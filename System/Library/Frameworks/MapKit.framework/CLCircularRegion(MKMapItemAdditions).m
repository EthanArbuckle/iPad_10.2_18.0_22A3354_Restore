@implementation CLCircularRegion(MKMapItemAdditions)

+ (id)circularRegionFromMapRegion:()MKMapItemAdditions
{
  double latitude;
  void *v1;
  double longitude;
  double v3;
  double v4;
  void *v5;
  MKMapRect v7;
  MKCoordinateRegion v8;

  GEOMapRectForMapRegion();
  v8 = MKCoordinateRegionForMapRect(v7);
  latitude = v8.center.latitude;
  v1 = 0;
  if (v8.center.longitude >= -180.0)
  {
    longitude = v8.center.longitude;
    if (v8.center.longitude <= 180.0 && v8.center.latitude >= -90.0 && v8.center.latitude <= 90.0)
    {
      v1 = 0;
      if (v8.span.latitudeDelta >= 0.0
        && v8.span.latitudeDelta <= 180.0
        && v8.span.longitudeDelta >= 0.0
        && v8.span.longitudeDelta <= 360.0)
      {
        GEOCalculateDistance();
        v4 = v3;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%+.8f,%+.8f> radius %.2f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude, *(_QWORD *)&v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initWithCenter:radius:identifier:", v5, latitude, longitude, v4);

      }
    }
  }
  return v1;
}

@end
