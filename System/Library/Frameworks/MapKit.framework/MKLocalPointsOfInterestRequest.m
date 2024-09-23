@implementation MKLocalPointsOfInterestRequest

- (MKLocalPointsOfInterestRequest)initWithCenterCoordinate:(CLLocationCoordinate2D)coordinate radius:(CLLocationDistance)radius
{
  double longitude;
  double latitude;
  MKLocalPointsOfInterestRequest *v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  double v10;
  double v11;
  MKLocalPointsOfInterestRequest *v12;
  void *v13;
  objc_super v15;
  CLLocationCoordinate2D v16;
  MKMapRect v17;
  MKCoordinateRegion v18;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v15.receiver = self;
  v15.super_class = (Class)MKLocalPointsOfInterestRequest;
  v7 = -[MKLocalPointsOfInterestRequest init](&v15, sel_init);
  if (!v7)
    goto LABEL_5;
  v16.latitude = latitude;
  v16.longitude = longitude;
  if (!CLLocationCoordinate2DIsValid(v16))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Invalid coordinate provided to MKLocalPointsOfInterestRequest initializer: %@"), v13);

LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (radius <= 0.0)
  {
    NSLog(CFSTR("Invalid radius provided to MKLocalPointsOfInterestRequest initializer: %f"), *(_QWORD *)&radius);
    goto LABEL_8;
  }
  v7->_coordinate.latitude = latitude;
  v7->_coordinate.longitude = longitude;
  v7->_radius = radius;
  v17.origin.x = MKMapRectMakeWithRadialDistance(latitude, longitude, radius);
  v18 = MKCoordinateRegionForMapRect(v17);
  -[MKLocalPointsOfInterestRequest _clampedCoordinateRegionForCoordinateRegion:](v7, "_clampedCoordinateRegionForCoordinateRegion:", v18.center.latitude, v18.center.longitude, v18.span.latitudeDelta, v18.span.longitudeDelta);
  v7->_region.center.latitude = v8;
  v7->_region.center.longitude = v9;
  v7->_region.span.latitudeDelta = v10;
  v7->_region.span.longitudeDelta = v11;
LABEL_5:
  v12 = v7;
LABEL_9:

  return v12;
}

- (MKLocalPointsOfInterestRequest)initWithCoordinateRegion:(MKCoordinateRegion)region
{
  double longitudeDelta;
  double latitudeDelta;
  double longitude;
  double latitude;
  MKLocalPointsOfInterestRequest *v7;
  MKLocalPointsOfInterestRequest *v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  double v11;
  double v12;
  double v13;
  MKLocalPointsOfInterestRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  longitudeDelta = region.span.longitudeDelta;
  latitudeDelta = region.span.latitudeDelta;
  longitude = region.center.longitude;
  latitude = region.center.latitude;
  v19.receiver = self;
  v19.super_class = (Class)MKLocalPointsOfInterestRequest;
  v7 = -[MKLocalPointsOfInterestRequest init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!-[MKLocalPointsOfInterestRequest _isValidCoordinateRegion:](v7, "_isValidCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v16, *(_QWORD *)&latitudeDelta, *(_QWORD *)&longitudeDelta);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      NSLog(CFSTR("Invalid MKCoordinateRegion provided to MKLocalPointsOfInterestRequest initializer: %@"), v17);
      v14 = 0;
      goto LABEL_6;
    }
    -[MKLocalPointsOfInterestRequest _clampedCoordinateRegionForCoordinateRegion:](v8, "_clampedCoordinateRegionForCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
    v8->_region.center.latitude = v9;
    v8->_region.center.longitude = v10;
    v8->_region.span.latitudeDelta = v11;
    v8->_region.span.longitudeDelta = v12;
    v8->_createdFromRegion = 1;
    v8->_coordinate = v8->_region.center;
    -[MKLocalPointsOfInterestRequest _deriveRadiusFromCoordinateRegion:](v8, "_deriveRadiusFromCoordinateRegion:");
    v8->_radius = v13;
  }
  v14 = v8;
LABEL_6:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v5 = -[MKLocalPointsOfInterestRequest _createdFromRegion](self, "_createdFromRegion");
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (v5)
    v7 = objc_msgSend(v6, "initWithCoordinateRegion:", self->_region.center.latitude, self->_region.center.longitude, self->_region.span.latitudeDelta, self->_region.span.longitudeDelta);
  else
    v7 = objc_msgSend(v6, "initWithCenterCoordinate:radius:", self->_coordinate.latitude, self->_coordinate.longitude, self->_radius);
  v8 = (_QWORD *)v7;
  v9 = -[MKPointOfInterestFilter copy](self->_pointOfInterestFilter, "copy");
  v10 = (void *)v8[3];
  v8[3] = v9;

  v8[4] = self->_maxResultCount;
  return v8;
}

- (BOOL)_isValidCoordinateRegion:(id *)a3
{
  double v3;
  double v4;
  BOOL result;

  result = 0;
  if (v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0)
    return v3 <= 90.0;
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)_clampedCoordinateRegionForCoordinateRegion:(SEL)a3
{
  return self;
}

- (double)_deriveRadiusFromCoordinateRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  GEOMapRectForCoordinateRegion();
  v7 = v5 <= v6;
  v8 = v3 + v5 * 0.5;
  v9 = v4 + v6;
  v10 = v6 * 0.5;
  v11 = v4 + v10;
  v12 = v3 + v5;
  if (v7)
  {
    v12 = v8;
    v13 = v9;
  }
  else
  {
    v13 = v4 + v10;
  }
  if (v7)
    v3 = v8;
  else
    v4 = v11;
  return MKMetersBetweenMapPoints(*(MKMapPoint *)&v3, *(MKMapPoint *)&v12) * 0.5;
}

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

- (CLLocationDistance)radius
{
  return self->_radius;
}

- (MKCoordinateRegion)region
{
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  MKCoordinateRegion result;

  latitude = self->_region.center.latitude;
  longitude = self->_region.center.longitude;
  latitudeDelta = self->_region.span.latitudeDelta;
  longitudeDelta = self->_region.span.longitudeDelta;
  result.span.longitudeDelta = longitudeDelta;
  result.span.latitudeDelta = latitudeDelta;
  result.center.longitude = longitude;
  result.center.latitude = latitude;
  return result;
}

- (BOOL)_createdFromRegion
{
  return self->_createdFromRegion;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  objc_setProperty_nonatomic_copy(self, a2, pointOfInterestFilter, 24);
}

- (int64_t)_maxResultCount
{
  return self->_maxResultCount;
}

- (void)_setMaxResultCount:(int64_t)a3
{
  self->_maxResultCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
}

@end
