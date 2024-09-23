@implementation HUColorWheelView

- (HUColorWheelView)initWithColorWheelSpace:(id)a3
{
  id v4;
  HUColorWheelView *v5;
  HUColorWheelView *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUColorWheelView;
  v5 = -[HUColorWheelView init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HUColorWheelView setColorWheelSpace:](v5, "setColorWheelSpace:", v4);
    -[HUColorWheelView setOpaque:](v6, "setOpaque:", 0);
    -[HUColorWheelView widthAnchor](v6, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColorWheelView heightAnchor](v6, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

  }
  return v6;
}

- (void)setColorWheelSpace:(id)a3
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUColorWheelView.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colorWheelSpace != nil"));

    v6 = 0;
  }
  if ((-[HUColorWheelSpace isEqual:](self->_colorWheelSpace, "isEqual:", v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_colorWheelSpace, a3);
    -[HUColorWheelView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setWheelHoleRadius:(double)a3
{
  if (self->_wheelHoleRadius != a3)
  {
    self->_wheelHoleRadius = a3;
    -[HUColorWheelView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (double)_outerRadius
{
  double v3;
  double v4;
  double v5;

  -[HUColorWheelView bounds](self, "bounds");
  v4 = v3;
  -[HUColorWheelView bounds](self, "bounds");
  return fmin(v4, v5) * 0.5;
}

- (id)wheelBezierPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  -[HUColorWheelView bounds](self, "bounds");
  UIRectGetCenter();
  v4 = v3;
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CEA390];
  -[HUColorWheelView _outerRadius](self, "_outerRadius");
  objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v8, 0.0, 6.28318531);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA390];
  -[HUColorWheelView wheelHoleRadius](self, "wheelHoleRadius");
  objc_msgSend(v10, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v11, 0.0, 6.28318531);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPath:", v12);

  objc_msgSend(v9, "setUsesEvenOddFillRule:", 1);
  return v9;
}

- (CGPoint)pointForColorWheelCoordinate:(id)a3
{
  double var0;
  double var1;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __double2 v14;
  double v15;
  double v16;
  CGPoint result;

  var0 = a3.var0;
  if (a3.var1 == 1.79769313e308)
    var1 = 0.5;
  else
    var1 = a3.var1;
  -[HUColorWheelView wheelHoleRadius](self, "wheelHoleRadius");
  v7 = v6;
  -[HUColorWheelView _outerRadius](self, "_outerRadius");
  v9 = v7 + (v8 - v7) * var1;
  -[HUColorWheelView bounds](self, "bounds");
  UIRectGetCenter();
  v11 = v10;
  v13 = v12;
  v14 = __sincos_stret(var0 * 6.28318531);
  v15 = v13 - v14.__sinval * v9;
  v16 = v11 + v14.__cosval * v9;
  result.y = v15;
  result.x = v16;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)colorWheelCoordinateForPoint:(CGPoint)a3 boundedToWheel:(BOOL)a4
{
  double y;
  double x;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  -[HUColorWheelView bounds](self, "bounds");
  -[HUColorWheelView wheelHoleRadius](self, "wheelHoleRadius");
  HUColorWheelCoordinateForPoint(x, y);
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

+ (double)_colorWheelRenderingScale
{
  return 1.0;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  CGColorSpace *DeviceRGB;
  CGContext *v16;
  void *Data;
  NSObject *v18;
  id v19;
  CGImage *Image;
  id v21;
  _QWORD block[4];
  id v23;
  unint64_t v24;
  __int128 v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CGSize v31;

  -[HUColorWheelView wheelBezierPath](self, "wheelBezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addClip");

  -[HUColorWheelView colorWheelSpace](self, "colorWheelSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Missing color space for wheel view %@"), self);
  -[HUColorWheelView bounds](self, "bounds");
  UIRectGetCenter();
  -[HUColorWheelView bounds](self, "bounds");
  v6 = HUSizeRoundedToScreenScale();
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "_colorWheelRenderingScale");
  -[HUColorWheelView wheelHoleRadius](self, "wheelHoleRadius");
  v10 = v9;
  -[HUColorWheelView colorWheelSpace](self, "colorWheelSpace");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)v6;
  v13 = (unint64_t)v8;
  if (*(uint64_t *)&v6 != *(uint64_t *)&v8)
  {
    v31.width = v6;
    v31.height = v8;
    NSStringFromCGSize(v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to draw color wheel with non-square size %@"), v14);

  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v16 = CGBitmapContextCreateWithData(0, (unint64_t)v6, (unint64_t)v8, 8uLL, 4 * v12, DeviceRGB, 0x4001u, 0, 0);
  Data = CGBitmapContextGetData(v16);
  v25 = *MEMORY[0x1E0C9D538];
  dispatch_get_global_queue(25, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __HUCreateColorWheelImage_block_invoke;
  block[3] = &unk_1E6F4F840;
  v26 = (double)v12;
  v27 = (double)v13;
  v28 = v10;
  v23 = v11;
  v24 = (unint64_t)v6;
  v29 = 4;
  v30 = Data;
  v19 = v11;
  dispatch_apply(v12 * v13, v18, block);

  Image = CGBitmapContextCreateImage(v16);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", Image, 0, 1.0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  CGContextRelease(v16);
  CGColorSpaceRelease(DeviceRGB);
  CGImageRelease(Image);

  objc_msgSend(v21, "size");
  UIRectCenteredAboutPoint();
  objc_msgSend(v21, "drawInRect:");

}

- (double)wheelHoleRadius
{
  return self->_wheelHoleRadius;
}

- (HUColorWheelSpace)colorWheelSpace
{
  return self->_colorWheelSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorWheelSpace, 0);
}

@end
