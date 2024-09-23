@implementation MKUserLocationAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
