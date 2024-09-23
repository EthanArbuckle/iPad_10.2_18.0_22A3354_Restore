@implementation MKCircleView

- (MKCircleView)initWithCircle:(MKCircle *)circle
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKCircleView;
  return -[MKOverlayPathView initWithOverlay:](&v4, sel_initWithOverlay_, circle);
}

- (void)createPath
{
  CGPath *Mutable;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  double v7;
  CLLocationDegrees v8;
  MKMapPoint v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  CLLocationCoordinate2D v19;

  Mutable = CGPathCreateMutable();
  -[MKOverlayView overlay](self, "overlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;

  v19.latitude = v6;
  v19.longitude = v8;
  v9 = MKMapPointForCoordinate(v19);
  -[MKOverlayView pointForMapPoint:](self, "pointForMapPoint:", v9.x, v9.y);
  v11 = v10;
  v13 = v12;
  GEOMapPointsPerMeterAtLatitude();
  v15 = v14;
  -[MKOverlayView overlay](self, "overlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "radius");
  v18 = v15 * v17;

  CGPathAddArc(Mutable, 0, v11, v13, v18, 0.0, 6.28318531, 1);
  -[MKOverlayPathView setPath:](self, "setPath:", Mutable);
  CGPathRelease(Mutable);
}

@end
