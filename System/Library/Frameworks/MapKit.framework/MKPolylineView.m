@implementation MKPolylineView

- (void)createPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double *v8;
  void *v9;
  unint64_t v10;
  CGPath *Mutable;
  double *v12;
  double v13;
  double v14;
  unint64_t v15;

  -[MKOverlayView _originMapPoint](self, "_originMapPoint");
  v4 = v3;
  v6 = v5;
  -[MKOverlayView overlay](self, "overlay");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (double *)objc_msgSend(v7, "points");

  -[MKOverlayView overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pointCount");

  if (v10 >= 2)
  {
    Mutable = CGPathCreateMutable();
    v13 = *v8;
    v14 = v8[1];
    v12 = v8 + 3;
    CGPathMoveToPoint(Mutable, 0, v13 - v4, v14 - v6);
    v15 = v10 - 1;
    do
    {
      CGPathAddLineToPoint(Mutable, 0, *(v12 - 1) - v4, *v12 - v6);
      v12 += 2;
      --v15;
    }
    while (v15);
    -[MKOverlayPathView setPath:](self, "setPath:", Mutable);
    CGPathRelease(Mutable);
  }
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  id v8;
  double *v9;
  void *v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPath *Mutable;

  -[MKOverlayView overlay](self, "overlay", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (double *)objc_msgSend(v8, "points");
  -[MKOverlayView overlay](self, "overlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pointCount");
  -[MKOverlayView _originMapPoint](self, "_originMapPoint");
  v13 = v12;
  v15 = v14;
  Mutable = CGPathCreateMutable();
  _MKPolylineAddToPath(Mutable, v9, v11, v13, v15, a4, 0.0, 1.0, -1.0);

  if (Mutable && !CGPathIsEmpty(Mutable))
  {
    -[MKOverlayPathView applyStrokePropertiesToContext:atZoomScale:](self, "applyStrokePropertiesToContext:atZoomScale:", a5, a4);
    -[MKOverlayPathView strokePath:inContext:](self, "strokePath:inContext:", Mutable, a5);
  }
  CGPathRelease(Mutable);
}

@end
