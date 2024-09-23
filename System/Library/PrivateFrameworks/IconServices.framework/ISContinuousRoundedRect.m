@implementation ISContinuousRoundedRect

- (ISContinuousRoundedRect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISContinuousRoundedRect;
  return (ISContinuousRoundedRect *)-[ISShapeCompositorResource _init](&v3, sel__init);
}

- (double)_cornerRadiusForSize:(CGSize)a3
{
  if (a3.width >= a3.height)
    a3.width = a3.height;
  return a3.width * 0.225;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  uint64_t ContinuousRoundedRectCornerRadius;
  const void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  const void *v25;
  void *v26;
  CGRect v28;
  CGRect v29;

  v5 = ceil(a3.width);
  v6 = ceil(a3.height);
  objc_msgSend(MEMORY[0x1E0D3A7B0], "bitmapContextWithSize:scale:preset:", 0, v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clear");
  -[ISShapeCompositorResource fillColor](self, "fillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFillColor:", v8);

  -[ISShapeCompositorResource lineColor](self, "lineColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v9);

  -[ISShapeCompositorResource lineWidth](self, "lineWidth");
  objc_msgSend(v7, "setLineWidth:");
  -[ISShapeCompositorResource lineColor](self, "lineColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ISShapeCompositorResource lineWidth](self, "lineWidth");
    v12 = v11 * 0.5;
    -[ISShapeCompositorResource lineWidth](self, "lineWidth");
    v14 = v13 * 0.5;
    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v28.size.width = v5;
    v28.size.height = v6;
    v29 = CGRectInset(v28, v12, v14);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    -[ISContinuousRoundedRect _cornerRadiusForSize:](self, "_cornerRadiusForSize:", v29.size.width, v29.size.height);
    ContinuousRoundedRectCornerRadius = _CGPathCreateContinuousRoundedRectCornerRadius(x, y, width, height, v19);
    if (ContinuousRoundedRectCornerRadius)
    {
      v21 = (const void *)ContinuousRoundedRectCornerRadius;
      objc_msgSend(v7, "strokePath:", ContinuousRoundedRectCornerRadius);
      CFRelease(v21);
    }
  }
  -[ISShapeCompositorResource fillColor](self, "fillColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[ISContinuousRoundedRect _cornerRadiusForSize:](self, "_cornerRadiusForSize:", v5, v6);
    v24 = _CGPathCreateContinuousRoundedRectCornerRadius(0.0, 0.0, v5, v6, v23);
    if (v24)
    {
      v25 = (const void *)v24;
      objc_msgSend(v7, "fillPath:", v24);
      CFRelease(v25);
    }
  }
  objc_msgSend(v7, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
