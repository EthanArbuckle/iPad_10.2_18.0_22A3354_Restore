@implementation MKRouteStepPolyline

- (id)_initWithRoute:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKRouteStepPolyline;
  v9 = -[MKRouteStepPolyline init](&v12, sel_init);
  if (!v9)
    goto LABEL_5;
  if (location + length <= objc_msgSend(v8, "pointCount"))
  {
    objc_storeStrong((id *)v9 + 14, a3);
    objc_msgSend(v9, "_assignPoints:count:", objc_msgSend(*((id *)v9 + 14), "points") + 16 * location, length);
LABEL_5:
    v10 = v9;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[MKMultiPoint _assignPoints:count:](self, "_assignPoints:count:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)MKRouteStepPolyline;
  -[MKMultiPoint dealloc](&v3, sel_dealloc);
}

- (CLLocationCoordinate2D)coordinate
{
  MKRouteStepPolyline *v3;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v6;
  CLLocationCoordinate2D result;

  if (-[MKMultiPoint pointCount](self, "pointCount"))
  {
    v3 = objc_retainAutorelease(self);
    v6 = MKCoordinateForMapPoint(*(-[MKMultiPoint points](v3, "points")
                                 + 16 * -[MKMultiPoint pointCount](v3, "pointCount")
                                 - 16));
    longitude = v6.longitude;
    latitude = v6.latitude;
  }
  else
  {
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)_requiresModernMap
{
  return objc_msgSend(*(id *)&self->super._needsElevationCorrection, "_requiresModernMap");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._needsElevationCorrection, 0);
}

@end
