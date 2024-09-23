@implementation ISCircle

- (ISCircle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISCircle;
  return (ISCircle *)-[ISShapeCompositorResource _init](&v3, sel__init);
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
  CGPathRef v15;
  CGPathRef v16;
  void *v17;
  CGPathRef v18;
  CGPathRef v19;
  void *v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;

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
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v5;
    v22.size.height = v6;
    v23 = CGRectInset(v22, v12, v14);
    v15 = CGPathCreateWithEllipseInRect(v23, 0);
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v7, "strokePath:", v15);
      CFRelease(v16);
    }
  }
  -[ISShapeCompositorResource fillColor](self, "fillColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = v5;
    v24.size.height = v6;
    v18 = CGPathCreateWithEllipseInRect(v24, 0);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v7, "fillPath:", v18);
      CFRelease(v19);
    }
  }
  objc_msgSend(v7, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
