@implementation FUPlaneTrackerAnnotationLayer

- (void)setPlaneImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MidX;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  CGRect v15;
  CGRect v16;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  objc_msgSend(v4, "size");
  v8 = v7;
  -[FUPlaneTrackerAnnotationLayer planeImageLayer](self, "planeImageLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBounds:", 0.0, 0.0, v6, v8);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v6;
  v15.size.height = v8;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v6;
  v16.size.height = v8;
  objc_msgSend(v14, "setPosition:", MidX, CGRectGetMidY(v16));
  v10 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v6, v8);
  v11 = objc_retainAutorelease(v4);
  v12 = objc_msgSend(v11, "CGImage");

  objc_msgSend(v10, "setContents:", v12);
  objc_msgSend(v14, "setMask:", v10);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

  -[FUPlaneTrackerAnnotationLayer setBounds:](self, "setBounds:", 0.0, 0.0, v6, v8);
}

- (FUPlaneTrackerAnnotationLayer)init
{
  FUPlaneTrackerAnnotationLayer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FUPlaneTrackerAnnotationLayer;
  v2 = -[FUPlaneTrackerAnnotationLayer init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUPlaneTrackerAnnotationLayer setPlaneImageLayer:](v2, "setPlaneImageLayer:", v3);
    -[FUPlaneTrackerAnnotationLayer addSublayer:](v2, "addSublayer:", v3);

  }
  return v2;
}

- (void)updatePlaneStateForProgress:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  -[FUPlaneTrackerAnnotationLayer setCurrentProgress:](self, "setCurrentProgress:");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[FUPlaneTrackerAnnotationLayer startLocation](self, "startLocation");
  v6 = v5;
  v8 = v7;
  -[FUPlaneTrackerAnnotationLayer endLocation](self, "endLocation");
  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", v6, v8, v9, v10, a3);
  v12 = v11;
  v14 = v13;
  -[FUPlaneTrackerAnnotationLayer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCoordinate:", v12, v14);

  -[FUPlaneTrackerAnnotationLayer startLocation](self, "startLocation");
  v17 = v16;
  v19 = v18;
  -[FUPlaneTrackerAnnotationLayer endLocation](self, "endLocation");
  -[FUPlaneTrackerAnnotationLayer defaultHeadingForStartPosition:endPosition:positionPercentage:](self, "defaultHeadingForStartPosition:endPosition:positionPercentage:", v17, v19, v20, v21, a3);
  CGAffineTransformMakeRotation(&v25, v22 * -0.0174532925);
  -[FUPlaneTrackerAnnotationLayer planeImageLayer](self, "planeImageLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v25;
  objc_msgSend(v23, "setAffineTransform:", &v24);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CLLocationCoordinate2D)currentLocation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CLLocationCoordinate2D result;

  -[FUPlaneTrackerAnnotationLayer startLocation](self, "startLocation");
  v4 = v3;
  v6 = v5;
  -[FUPlaneTrackerAnnotationLayer endLocation](self, "endLocation");
  v8 = v7;
  v10 = v9;
  -[FUPlaneTrackerAnnotationLayer currentProgress](self, "currentProgress");
  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", v4, v6, v8, v10, v11);
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (CLLocationCoordinate2D)geodesicLocationForStartPosition:(CLLocationCoordinate2D)a3 endPosition:(CLLocationCoordinate2D)a4 positionPercentage:(double)a5
{
  double v6;
  double v7;
  CLLocationDegrees v8;
  __double2 v9;
  __double2 v10;
  long double v11;
  long double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  __double2 v17;
  __double2 v18;
  long double v19;
  long double v20;
  double v21;
  long double v22;
  double longitude;
  CLLocationCoordinate2D v24;
  CLLocationDegrees latitude;
  double v26;
  double v27;
  CLLocationCoordinate2D result;

  v6 = a4.latitude * 0.0174532925;
  v7 = a3.longitude * 0.0174532925;
  v8 = a4.longitude * 0.0174532925;
  v27 = a4.longitude * 0.0174532925;
  v9 = __sincos_stret(a3.latitude * 0.0174532925);
  v10 = __sincos_stret(v6);
  v11 = cos(v7 - v8);
  v12 = acos(v9.__cosval * v10.__cosval * v11 + v9.__sinval * v10.__sinval);
  v13 = sin((1.0 - a5) * v12);
  v14 = sin(v12);
  v15 = v13 / v14;
  v16 = sin(v12 * a5) / v14;
  v17 = __sincos_stret(v7);
  v18 = __sincos_stret(v27);
  v19 = v18.__cosval * (v10.__cosval * v16) + v9.__cosval * v15 * v17.__cosval;
  v20 = v18.__sinval * (v10.__cosval * v16) + v9.__cosval * v15 * v17.__sinval;
  v21 = atan2(v10.__sinval * v16 + v15 * v9.__sinval, sqrt(v20 * v20 + v19 * v19));
  v22 = atan2(v20, v19);
  v24 = CLLocationCoordinate2DMake(v21 * 57.2957795, v22 * 57.2957795);
  longitude = v24.longitude;
  latitude = -84.99;
  if (v24.latitude >= -84.99)
  {
    latitude = v24.latitude;
    if (v24.latitude > 84.99)
      latitude = 84.99;
  }
  v26 = latitude;
  result.longitude = longitude;
  result.latitude = v26;
  return result;
}

- (double)defaultHeadingForStartPosition:(CLLocationCoordinate2D)a3 endPosition:(CLLocationCoordinate2D)a4 positionPercentage:(double)a5
{
  double longitude;
  double latitude;
  double v7;
  double v8;
  double v10;
  MKMapPoint v11;
  MKMapPoint v12;
  double v13;
  double v14;
  double v15;
  double result;
  CLLocationCoordinate2D v17;
  CLLocationCoordinate2D v18;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3.longitude;
  v8 = a3.latitude;
  if (a5 <= 0.99)
    v10 = a5 + 0.01;
  else
    v10 = 1.0;
  if (a5 > 0.99)
    a5 = 0.99;
  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", a3.latitude, a3.longitude, a4.latitude, a4.longitude, a5);
  v11 = MKMapPointForCoordinate(v17);
  -[FUPlaneTrackerAnnotationLayer geodesicLocationForStartPosition:endPosition:positionPercentage:](self, "geodesicLocationForStartPosition:endPosition:positionPercentage:", v8, v7, latitude, longitude, v10);
  v12 = MKMapPointForCoordinate(v18);
  v13 = v12.x - v11.x;
  v14 = v12.y - v11.y;
  v15 = sqrt(v14 * v14 + v13 * v13);
  result = 0.0;
  if (v15 != 0.0)
    return (atan2(v13 / v15, v14 / v15) + -1.57079633) * 57.2957795;
  return result;
}

- (CLLocationCoordinate2D)startLocation
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_startLocation.latitude;
  longitude = self->_startLocation.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setStartLocation:(CLLocationCoordinate2D)a3
{
  self->_startLocation = a3;
}

- (CLLocationCoordinate2D)endLocation
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_endLocation.latitude;
  longitude = self->_endLocation.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setEndLocation:(CLLocationCoordinate2D)a3
{
  self->_endLocation = a3;
}

- (CALayer)planeImageLayer
{
  return (CALayer *)objc_loadWeakRetained((id *)&self->_planeImageLayer);
}

- (void)setPlaneImageLayer:(id)a3
{
  objc_storeWeak((id *)&self->_planeImageLayer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_planeImageLayer);
}

@end
