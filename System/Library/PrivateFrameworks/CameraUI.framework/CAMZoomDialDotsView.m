@implementation CAMZoomDialDotsView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMZoomDialDotsView)initWithDotImage:(id)a3
{
  id v4;
  CAMZoomDialDotsView *v5;
  CAMZoomDialDotsView *v6;
  void *v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CALayer *v16;
  CALayer *dotLayer;
  CAMZoomDialDotsView *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CAMZoomDialDotsView;
  v5 = -[CAMZoomDialDotsView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[CAMZoomDialDotsView _replicatorLayer](v5, "_replicatorLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v4);
    v9 = objc_msgSend(v8, "CGImage");
    objc_msgSend(v8, "size");
    v11 = v10;
    v13 = v12;
    v14 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    dotLayer = v6->__dotLayer;
    v6->__dotLayer = v16;

    -[CALayer setBounds:](v6->__dotLayer, "setBounds:", v14, v15, v11, v13);
    -[CALayer setContents:](v6->__dotLayer, "setContents:", v9);
    objc_msgSend(v7, "addSublayer:", v6->__dotLayer);
    v18 = v6;

  }
  return v6;
}

- (int64_t)dotCount
{
  void *v2;
  int64_t v3;

  -[CAMZoomDialDotsView _replicatorLayer](self, "_replicatorLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "instanceCount");

  return v3;
}

- (void)setDotCount:(int64_t)a3
{
  id v4;

  -[CAMZoomDialDotsView _replicatorLayer](self, "_replicatorLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInstanceCount:", a3);

}

- (CGPoint)dotCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CAMZoomDialDotsView _dotLayer](self, "_dotLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "position");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setDotCenter:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[CAMZoomDialDotsView _dotLayer](self, "_dotLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPosition:", x, y);

}

- (void)setDotSpacingAngle:(double)a3
{
  void *v4;
  CATransform3D v5;
  CATransform3D v6;

  if (self->_dotSpacingAngle != a3)
  {
    self->_dotSpacingAngle = a3;
    CATransform3DMakeRotation(&v6, a3, 0.0, 0.0, 1.0);
    -[CAMZoomDialDotsView _replicatorLayer](self, "_replicatorLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "setInstanceTransform:", &v5);

  }
}

- (double)dotSpacingAngle
{
  return self->_dotSpacingAngle;
}

- (CALayer)_dotLayer
{
  return self->__dotLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dotLayer, 0);
}

@end
