@implementation NTKRichComplicationDialView

- (NTKRichComplicationDialView)initWithLargeTickCount:(int64_t)a3 smallTickCountPerLargeTick:(int64_t)a4 largeTickSize:(CGSize)a5 smallTickSize:(CGSize)a6 dialRange:(double)a7 startAngle:(double)a8
{
  double height;
  double width;
  double v13;
  double v14;
  NTKRichComplicationDialView *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CAReplicatorLayer *largeTicksReplicatorLayer;
  uint64_t v21;
  CAReplicatorLayer *v22;
  CAReplicatorLayer *v23;
  id v24;
  uint64_t v25;
  CALayer *largeTickLayer;
  CALayer *v27;
  id v28;
  uint64_t v29;
  CAReplicatorLayer *smallTicksReplicatorLayer;
  CAReplicatorLayer *v31;
  CAReplicatorLayer *v32;
  id v33;
  uint64_t v34;
  CALayer *smallTickLayer;
  CALayer *v36;
  id v37;
  CATransform3D v39;
  CATransform3D v40;
  objc_super v41;

  height = a6.height;
  width = a6.width;
  v13 = a5.height;
  v14 = a5.width;
  v41.receiver = self;
  v41.super_class = (Class)NTKRichComplicationDialView;
  v16 = -[NTKRichComplicationDialView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRichComplicationDialView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    v16->_progress = 1.0;
    v16->_progressDirection = 1.0;
    -[NTKRichComplicationDialView layer](v16, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_largeTickCount = a3;
    v16->_smallTickCountPerLargeTick = a4;
    v19 = objc_opt_new();
    largeTicksReplicatorLayer = v16->_largeTicksReplicatorLayer;
    v16->_largeTicksReplicatorLayer = (CAReplicatorLayer *)v19;

    v21 = *MEMORY[0x1E0CD2B58];
    -[CAReplicatorLayer setFillMode:](v16->_largeTicksReplicatorLayer, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    -[CAReplicatorLayer setInstanceCount:](v16->_largeTicksReplicatorLayer, "setInstanceCount:", a3);
    v22 = v16->_largeTicksReplicatorLayer;
    CATransform3DMakeRotation(&v40, a8, 0.0, 0.0, 1.0);
    -[CAReplicatorLayer setTransform:](v22, "setTransform:", &v40);
    v23 = v16->_largeTicksReplicatorLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAReplicatorLayer setBackgroundColor:](v23, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));

    objc_msgSend(v18, "addSublayer:", v16->_largeTicksReplicatorLayer);
    v25 = objc_opt_new();
    largeTickLayer = v16->_largeTickLayer;
    v16->_largeTickLayer = (CALayer *)v25;

    v27 = v16->_largeTickLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v27, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));

    -[CALayer setBounds:](v16->_largeTickLayer, "setBounds:", 0.0, 0.0, v14, v13);
    -[CALayer setCornerRadius:](v16->_largeTickLayer, "setCornerRadius:", v14 * 0.5);
    -[CAReplicatorLayer addSublayer:](v16->_largeTicksReplicatorLayer, "addSublayer:", v16->_largeTickLayer);
    v16->_largeTickPositionY = v13 * 0.5;
    if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v29 = objc_opt_new();
      smallTicksReplicatorLayer = v16->_smallTicksReplicatorLayer;
      v16->_smallTicksReplicatorLayer = (CAReplicatorLayer *)v29;

      -[CAReplicatorLayer setFillMode:](v16->_smallTicksReplicatorLayer, "setFillMode:", v21);
      -[CAReplicatorLayer setInstanceCount:](v16->_smallTicksReplicatorLayer, "setInstanceCount:", v16->_smallTickCountPerLargeTick * a3);
      v31 = v16->_smallTicksReplicatorLayer;
      CATransform3DMakeRotation(&v39, a8, 0.0, 0.0, 1.0);
      -[CAReplicatorLayer setTransform:](v31, "setTransform:", &v39);
      v32 = v16->_smallTicksReplicatorLayer;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAReplicatorLayer setBackgroundColor:](v32, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));

      -[CAReplicatorLayer setCompositingFilter:](v16->_smallTicksReplicatorLayer, "setCompositingFilter:", CFSTR("maximum"));
      objc_msgSend(v18, "insertSublayer:below:", v16->_smallTicksReplicatorLayer, v16->_largeTicksReplicatorLayer);
      v34 = objc_opt_new();
      smallTickLayer = v16->_smallTickLayer;
      v16->_smallTickLayer = (CALayer *)v34;

      v36 = v16->_smallTickLayer;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](v36, "setBackgroundColor:", objc_msgSend(v37, "CGColor"));

      -[CALayer setBounds:](v16->_smallTickLayer, "setBounds:", 0.0, 0.0, width, height);
      -[CALayer setCornerRadius:](v16->_smallTickLayer, "setCornerRadius:", width * 0.5);
      -[CAReplicatorLayer addSublayer:](v16->_smallTicksReplicatorLayer, "addSublayer:", v16->_smallTickLayer);
      v16->_smallTickPositionY = height * 0.5;
    }
    -[NTKRichComplicationDialView setLargeTicksTransformAngle:](v16, "setLargeTicksTransformAngle:", a7 / (double)a3);

  }
  return v16;
}

- (NTKRichComplicationDialView)initWithTickCount:(int64_t)a3 tickSize:(CGSize)a4 dialRange:(double)a5 startAngle:(double)a6
{
  return -[NTKRichComplicationDialView initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:](self, "initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:", a3, 2, a4.width, a4.height, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), a5, a6);
}

- (void)setProgress:(float)a3
{
  uint64_t v4;
  CALayer *largeTickLayer;
  uint64_t v6;
  CALayer *smallTickLayer;

  if (self->_progress != a3)
  {
    self->_progress = a3;
    v4 = (uint64_t)(float)((float)(a3 * (float)self->_largeTickCount) + 1.0);
    largeTickLayer = self->_largeTickLayer;
    if (v4)
    {
      -[CALayer setHidden:](largeTickLayer, "setHidden:", 0);
      -[CAReplicatorLayer setInstanceCount:](self->_largeTicksReplicatorLayer, "setInstanceCount:", v4);
    }
    else
    {
      -[CALayer setHidden:](largeTickLayer, "setHidden:", 1);
    }
    if (self->_smallTicksReplicatorLayer)
    {
      v6 = (uint64_t)(float)((float)((float)(self->_progress * (float)self->_largeTickCount)
                                  * (float)self->_smallTickCountPerLargeTick)
                          + 1.0);
      smallTickLayer = self->_smallTickLayer;
      if (v6)
      {
        -[CALayer setHidden:](smallTickLayer, "setHidden:", 0);
        -[CAReplicatorLayer setInstanceCount:](self->_smallTicksReplicatorLayer, "setInstanceCount:", v6);
      }
      else
      {
        -[CALayer setHidden:](smallTickLayer, "setHidden:", 1);
      }
    }
  }
}

- (void)setProgressDirection:(float)a3
{
  BOOL v3;
  float v4;

  v3 = a3 < 0.0;
  v4 = 1.0;
  if (v3)
    v4 = -1.0;
  if (self->_progressDirection != v4)
  {
    self->_progressDirection = v4;
    -[NTKRichComplicationDialView _updateTicksRotationTransform](self, "_updateTicksRotationTransform");
  }
}

- (void)setLargeTicksTransformAngle:(double)a3
{
  if (self->_largeTicksTransformAngle != a3)
  {
    self->_largeTicksTransformAngle = a3;
    -[NTKRichComplicationDialView _updateTicksRotationTransform](self, "_updateTicksRotationTransform");
  }
}

- (void)_updateTicksRotationTransform
{
  double v3;
  CAReplicatorLayer *largeTicksReplicatorLayer;
  CAReplicatorLayer *smallTicksReplicatorLayer;
  CATransform3D v6;
  CATransform3D v7;

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v3 = self->_largeTicksTransformAngle * self->_progressDirection;
  largeTicksReplicatorLayer = self->_largeTicksReplicatorLayer;
  CATransform3DMakeRotation(&v7, v3, 0.0, 0.0, 1.0);
  -[CAReplicatorLayer setInstanceTransform:](largeTicksReplicatorLayer, "setInstanceTransform:", &v7);
  smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
  if (smallTicksReplicatorLayer)
  {
    CATransform3DMakeRotation(&v6, v3 / (double)self->_smallTickCountPerLargeTick, 0.0, 0.0, 1.0);
    -[CAReplicatorLayer setInstanceTransform:](smallTicksReplicatorLayer, "setInstanceTransform:", &v6);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
}

- (void)layoutSubviews
{
  void *v3;
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
  CAReplicatorLayer *smallTicksReplicatorLayer;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKRichComplicationDialView;
  -[NTKRichComplicationDialView layoutSubviews](&v15, sel_layoutSubviews);
  -[NTKRichComplicationDialView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v8 * 0.5;
  v13 = v10 * 0.5;
  -[CAReplicatorLayer setPosition:](self->_largeTicksReplicatorLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  -[CAReplicatorLayer setBounds:](self->_largeTicksReplicatorLayer, "setBounds:", v5, v7, v9, v11);
  -[CALayer setPosition:](self->_largeTickLayer, "setPosition:", v12, self->_largeTickPositionY);
  smallTicksReplicatorLayer = self->_smallTicksReplicatorLayer;
  if (smallTicksReplicatorLayer)
  {
    -[CAReplicatorLayer setPosition:](smallTicksReplicatorLayer, "setPosition:", v12, v13);
    -[CAReplicatorLayer setBounds:](self->_smallTicksReplicatorLayer, "setBounds:", v5, v7, v9, v11);
    -[CALayer setPosition:](self->_smallTickLayer, "setPosition:", v12, self->_smallTickPositionY);
  }

}

- (void)setTickColor:(id)a3
{
  CALayer *smallTickLayer;
  id v5;
  CALayer *largeTickLayer;
  id v7;
  uint64_t v8;

  smallTickLayer = self->_smallTickLayer;
  v5 = objc_retainAutorelease(a3);
  -[CALayer setBackgroundColor:](smallTickLayer, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));
  largeTickLayer = self->_largeTickLayer;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGColor");

  -[CALayer setBackgroundColor:](largeTickLayer, "setBackgroundColor:", v8);
}

- (CALayer)largeTickLayer
{
  return self->_largeTickLayer;
}

- (CALayer)smallTickLayer
{
  return self->_smallTickLayer;
}

- (float)progress
{
  return self->_progress;
}

- (float)progressDirection
{
  return self->_progressDirection;
}

- (UIColor)tickColor
{
  return self->_tickColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallTickLayer, 0);
  objc_storeStrong((id *)&self->_smallTicksReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_largeTickLayer, 0);
  objc_storeStrong((id *)&self->_largeTicksReplicatorLayer, 0);
}

@end
