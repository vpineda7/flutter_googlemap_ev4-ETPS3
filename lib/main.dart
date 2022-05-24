import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps MovilSV',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _san_salvador = CameraPosition(
    target: LatLng(13.691801267200947, -89.22927177283256),
    zoom: 12.5,
  );


  
  static final CameraPosition _movilsv_mundo = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(13.702310615534824, -89.22452535261124),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414
  );

  @override
  Widget build(BuildContext context) {
    List<Marker> _markers = <Marker>[];

  _markers.add(
    Marker(
    markerId: MarkerId('_movilsv_arce'),
    infoWindow: InfoWindow(title: 'MovilSV - Arce'),
    icon: BitmapDescriptor.defaultMarker, 
    position: LatLng(13.699935452578657, -89.19811278262686)
    )
  );
  
  _markers.add(
    Marker(
    markerId: MarkerId('_movilsv_salvador_mundo'),
    infoWindow: InfoWindow(title: 'MovilSV - Salvador del mundo'),
    icon: BitmapDescriptor.defaultMarker, 
    position: LatLng(13.702310615534824, -89.22452535261124)
    )
  );

  _markers.add(
    Marker(
    markerId: MarkerId('_movilsv_soyapango_centro'),
    infoWindow: InfoWindow(title: 'MovilSV - Soyapango centro'),
    icon: BitmapDescriptor.defaultMarker, 
    position: LatLng(13.703980702473519, -89.15008647794278)
    )
  );

  _markers.add(
    Marker(
    markerId: MarkerId('_movilsv_san_jacinto'),
    infoWindow: InfoWindow(title: 'MovilSV - San Jacinto'),
    icon: BitmapDescriptor.defaultMarker, 
    position: LatLng(13.688108806027214, -89.19012406876631)
    )
  );

  

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers:Set<Marker>.of(_markers),
        initialCameraPosition: _san_salvador,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheMainStore,
        label: Text('Mostrar tienda principal!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheMainStore() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_movilsv_mundo));
  }
}


