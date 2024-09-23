@implementation MKCircle

- (id)_initWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4
{
  double longitude;
  double latitude;
  MKCircle *v7;
  MKCircle *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v13.receiver = self;
  v13.super_class = (Class)MKCircle;
  v7 = -[MKCircle init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_coordinate.latitude = latitude;
    v7->_coordinate.longitude = longitude;
    v7->_radius = a4;
    v7->_boundingMapRect.origin.x = MKMapRectMakeWithRadialDistance(latitude, longitude, a4);
    v8->_boundingMapRect.origin.y = v9;
    v8->_boundingMapRect.size.width = v10;
    v8->_boundingMapRect.size.height = v11;
  }
  return v8;
}

+ (MKCircle)circleWithCenterCoordinate:(CLLocationCoordinate2D)coord radius:(CLLocationDistance)radius
{
  return (MKCircle *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCenterCoordinate:radius:", coord.latitude, coord.longitude, radius);
}

+ (MKCircle)circleWithMapRect:(MKMapRect)mapRect
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  CLLocationCoordinate2D v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CLLocationDistance v14;
  MKMapPoint v16;

  height = mapRect.size.height;
  width = mapRect.size.width;
  y = mapRect.origin.y;
  x = mapRect.origin.x;
  v7 = mapRect.origin.x + mapRect.size.width * 0.5;
  v8 = mapRect.origin.y + mapRect.size.height * 0.5;
  v16.x = v7;
  v16.y = v8;
  v9 = MKCoordinateForMapPoint(v16);
  if (width > height)
    v10 = x + width;
  else
    v10 = v7;
  if (width > height)
    v11 = x;
  else
    v11 = v7;
  if (width > height)
    v12 = v8;
  else
    v12 = y + height;
  if (width > height)
    v13 = v8;
  else
    v13 = y;
  v14 = MKMetersBetweenMapPoints(*(MKMapPoint *)&v11, *(MKMapPoint *)&v10) * 0.5;
  return (MKCircle *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCenterCoordinate:radius:", v9.latitude, v9.longitude, v14);
}

- (BOOL)intersectsMapRect:(id)a3
{
  return MKMapRectIntersectsRect((MKMapRect)self->_boundingMapRect, (MKMapRect)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKCircle)initWithCoder:(id)a3
{
  id v4;
  MKCircle *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MKCircle *v16;
  double v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MKCircle;
  v5 = -[MKShape initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKCircleLatitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKCircleLongitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKCircleRadius"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10 && v8 != 0)
  {
    objc_msgSend(v6, "doubleValue");
    v18 = v17;
    objc_msgSend(v7, "doubleValue");
    v5->_coordinate = CLLocationCoordinate2DMake(v18, v19);
    objc_msgSend(v9, "doubleValue");
    v5->_radius = v20;
    v5->_boundingMapRect.origin.x = MKMapRectMakeWithRadialDistance(v5->_coordinate.latitude, v5->_coordinate.longitude, v20);
    v5->_boundingMapRect.origin.y = v21;
    v5->_boundingMapRect.size.width = v22;
    v5->_boundingMapRect.size.height = v23;

LABEL_11:
    v16 = v5;
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0CB28A8];
  v26 = *MEMORY[0x1E0CB2938];
  v27[0] = CFSTR("Expected circle data missing.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 4864, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v15);

  v16 = 0;
LABEL_12:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKCircle;
  v4 = a3;
  -[MKShape encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coordinate.latitude, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKCircleLatitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coordinate.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MKCircleLongitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_radius);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MKCircleRadius"));

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

- (MKMapRect)boundingMapRect
{
  double x;
  double y;
  double width;
  double height;
  MKMapRect result;

  x = self->_boundingMapRect.origin.x;
  y = self->_boundingMapRect.origin.y;
  width = self->_boundingMapRect.size.width;
  height = self->_boundingMapRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
