@implementation CompassBackgroundView

- (id)staticLayer
{
  CALayer *staticLayer;
  CALayer *v4;
  CALayer *v5;
  CALayer *v6;
  void *v7;
  CALayer *v8;
  void *v9;
  void *v10;

  staticLayer = self->_staticLayer;
  if (!staticLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_staticLayer;
    self->_staticLayer = v4;

    v6 = self->_staticLayer;
    -[CompassBackgroundView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    -[CALayer setFrame:](v6, "setFrame:");

    v8 = self->_staticLayer;
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setCompositingFilter:](v8, "setCompositingFilter:", v9);

    -[CompassBackgroundView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", self->_staticLayer);

    staticLayer = self->_staticLayer;
  }
  return staticLayer;
}

- (id)_crosshairLayerWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  double v11;
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);
  objc_msgSend(v8, "setBounds:", x, y, width, height);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  objc_msgSend(v8, "setLineWidth:", 1.0 / v11);

  -[CompassBackgroundView _crosshairPathInRect:](self, "_crosshairPathInRect:", x, y, width, height);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setPath:", objc_msgSend(v12, "CGPath"));

  return v8;
}

- (id)_crosshairPathInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v7;
  double MidX;
  double v9;
  double MinX;
  double MaxX;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(MEMORY[0x24BDF6870]);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  objc_msgSend(v7, "moveToPoint:", MidX, CGRectGetMinY(v14));
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v9 = CGRectGetMidX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  objc_msgSend(v7, "addLineToPoint:", v9, CGRectGetMaxY(v16));
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MinX = CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  objc_msgSend(v7, "moveToPoint:", MinX, CGRectGetMidY(v18));
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MaxX = CGRectGetMaxX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  objc_msgSend(v7, "addLineToPoint:", MaxX, CGRectGetMidY(v20));
  return v7;
}

- (BOOL)setCrosshairOffset:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGPoint *p_currentOffset;
  CGFloat v10;
  CGFloat v11;

  height = a3.height;
  width = a3.width;
  -[CompassBackgroundView bounds](self, "bounds");
  v7 = bubbleDiameter(v6);
  p_currentOffset = &self->_currentOffset;
  if (vabdd_f64(p_currentOffset->x, width * v7 / 5.0) < 0.5 && vabdd_f64(p_currentOffset->y, height * v7 / 5.0) < 0.5)
    return 0;
  CGPointRoundToPixel();
  p_currentOffset->x = v10;
  p_currentOffset->y = v11;
  return 1;
}

- (void)setCompassHeading:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CompassBackgroundView;
  -[CompassRotatingView setCompassHeading:](&v7, sel_setCompassHeading_, a3);
  -[CompassBackgroundView rotatingLayer](self, "rotatingLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CompassRotatingView angle](self, "angle");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v6, CFSTR("transform.rotation.z"));

}

- (void)layoutSubviews
{
  CGPoint *p_compassCenter;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double bearing;
  double v27;
  double v28;
  double x;
  __double2 v30;
  double v31;
  CGFloat v32;
  void *v33;
  CATransform3D v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CompassBackgroundView;
  -[CompassBackgroundView layoutSubviews](&v35, sel_layoutSubviews);
  p_compassCenter = &self->_compassCenter;
  -[CompassBackgroundView bounds](self, "bounds");
  v5 = v4 * 0.5;
  -[CompassBackgroundView bounds](self, "bounds");
  self->_compassCenter.x = v5;
  self->_compassCenter.y = v6 * 0.5;
  -[CompassBackgroundView bounds](self, "bounds");
  self->_ticLength = compassTicLength(v7);
  -[CompassBackgroundView bounds](self, "bounds");
  self->_bearingLength = bearingLength(v8);
  -[CompassBackgroundView bounds](self, "bounds");
  self->_currentHeadingLength = currentHeadingLength(v9);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CompassBackgroundView prototypeSmallTicLayer](self, "prototypeSmallTicLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  -[CompassBackgroundView prototypeLargeTicLayer](self, "prototypeLargeTicLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

  -[CompassBackgroundView currentHeadingLayer](self, "currentHeadingLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

  -[CompassBackgroundView bearingLayer](self, "bearingLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

  -[CompassBackgroundView smallCompassTicLayers](self, "smallCompassTicLayers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompassBackgroundView bounds](self, "bounds");
  objc_msgSend(v18, "setFrame:");

  -[CompassBackgroundView prototypeSmallTicLayer](self, "prototypeSmallTicLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPosition:", self->_compassCenter.x, self->_compassCenter.y + self->_ticRadius);

  if (self->_shownInCompass)
  {
    -[CompassBackgroundView largeCompassTicLayers](self, "largeCompassTicLayers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompassBackgroundView bounds](self, "bounds");
    objc_msgSend(v20, "setFrame:");

    -[CompassBackgroundView prototypeLargeTicLayer](self, "prototypeLargeTicLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPosition:", p_compassCenter->x, self->_compassCenter.y + self->_ticRadius);

    v22 = self->_ticRadius + (self->_currentHeadingLength - self->_ticLength) * 0.5;
    -[CompassBackgroundView currentHeadingLayer](self, "currentHeadingLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPosition:", p_compassCenter->x, self->_compassCenter.y - v22);

    -[CompassBackgroundView bubbleLayer](self, "bubbleLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPosition:", p_compassCenter->x - self->_currentOffset.x, self->_compassCenter.y - self->_currentOffset.y);

    -[CompassBackgroundView crosshairLayer](self, "crosshairLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPosition:", p_compassCenter->x, self->_compassCenter.y);

  }
  bearing = self->_bearing;
  if (bearing == 1.79769313e308)
  {
    -[CALayer setHidden:](self->_bearingLayer, "setHidden:", 1);
  }
  else
  {
    v27 = (bearing + 270.0) * 3.14159265 / 180.0;
    v28 = self->_ticRadius + (self->_bearingLength - self->_ticLength) * 0.5;
    x = p_compassCenter->x;
    v30 = __sincos_stret(v27);
    v31 = x + v28 * v30.__cosval;
    v32 = self->_compassCenter.y + v28 * v30.__sinval;
    -[CompassBackgroundView bearingLayer](self, "bearingLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPosition:", v31, v32);
    CATransform3DMakeRotation(&v34, v27 + 1.57079633, 0.0, 0.0, 1.0);
    objc_msgSend(v33, "setTransform:", &v34);
    objc_msgSend(v33, "setHidden:", 0);

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (id)prototypeSmallTicLayer
{
  CALayer *prototypeSmallTicLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;

  prototypeSmallTicLayer = self->_prototypeSmallTicLayer;
  if (!prototypeSmallTicLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prototypeSmallTicLayer;
    self->_prototypeSmallTicLayer = v4;

    -[CALayer setAllowsEdgeAntialiasing:](self->_prototypeSmallTicLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setFrame:](self->_prototypeSmallTicLayer, "setFrame:", 0.0, 0.0, 0.75, self->_ticLength);
    -[CompassBackgroundView smallCompassTicLayers](self, "smallCompassTicLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", self->_prototypeSmallTicLayer);

    prototypeSmallTicLayer = self->_prototypeSmallTicLayer;
  }
  return prototypeSmallTicLayer;
}

- (id)prototypeLargeTicLayer
{
  CALayer *prototypeLargeTicLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;

  prototypeLargeTicLayer = self->_prototypeLargeTicLayer;
  if (!prototypeLargeTicLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prototypeLargeTicLayer;
    self->_prototypeLargeTicLayer = v4;

    -[CALayer setAllowsEdgeAntialiasing:](self->_prototypeLargeTicLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setFrame:](self->_prototypeLargeTicLayer, "setFrame:", 0.0, 0.0, 2.5, self->_ticLength);
    -[CompassBackgroundView largeCompassTicLayers](self, "largeCompassTicLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", self->_prototypeLargeTicLayer);

    prototypeLargeTicLayer = self->_prototypeLargeTicLayer;
  }
  return prototypeLargeTicLayer;
}

- (id)currentHeadingLayer
{
  CALayer *currentHeadingLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;

  currentHeadingLayer = self->_currentHeadingLayer;
  if (!currentHeadingLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_currentHeadingLayer;
    self->_currentHeadingLayer = v4;

    -[CALayer setAllowsEdgeAntialiasing:](self->_currentHeadingLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setFrame:](self->_currentHeadingLayer, "setFrame:", 0.0, 0.0, 4.0, self->_currentHeadingLength);
    -[CompassBackgroundView staticLayer](self, "staticLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", self->_currentHeadingLayer);

    currentHeadingLayer = self->_currentHeadingLayer;
  }
  return currentHeadingLayer;
}

- (id)smallCompassTicLayers
{
  CAReplicatorLayer *smallCompassTicLayers;
  CAReplicatorLayer *v4;
  CAReplicatorLayer *v5;
  CAReplicatorLayer *v6;
  void *v7;
  CATransform3D v9;

  smallCompassTicLayers = self->_smallCompassTicLayers;
  if (!smallCompassTicLayers)
  {
    objc_msgSend(MEMORY[0x24BDE5748], "layer");
    v4 = (CAReplicatorLayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_smallCompassTicLayers;
    self->_smallCompassTicLayers = v4;

    v6 = self->_smallCompassTicLayers;
    CATransform3DMakeRotation(&v9, 0.034906585, 0.0, 0.0, 1.0);
    -[CAReplicatorLayer setInstanceTransform:](v6, "setInstanceTransform:", &v9);
    -[CAReplicatorLayer setInstanceCount:](self->_smallCompassTicLayers, "setInstanceCount:", 180);
    -[CompassBackgroundView rotatingLayer](self, "rotatingLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", self->_smallCompassTicLayers);

    smallCompassTicLayers = self->_smallCompassTicLayers;
  }
  return smallCompassTicLayers;
}

- (id)crosshairLayer
{
  CAShapeLayer *crosshairLayer;
  double v4;
  double v5;
  double v6;
  CAShapeLayer *v7;
  CAShapeLayer *v8;
  void *v9;

  crosshairLayer = self->_crosshairLayer;
  if (!crosshairLayer)
  {
    -[CompassBackgroundView bounds](self, "bounds");
    v5 = crosshairWidth(v4);
    -[CompassBackgroundView bounds](self, "bounds");
    -[CompassBackgroundView _crosshairLayerWithBounds:](self, "_crosshairLayerWithBounds:", 0.0, 0.0, v5, crosshairWidth(v6));
    v7 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    v8 = self->_crosshairLayer;
    self->_crosshairLayer = v7;

    -[CompassBackgroundView staticLayer](self, "staticLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", self->_crosshairLayer);

    crosshairLayer = self->_crosshairLayer;
  }
  return crosshairLayer;
}

- (id)bubbleLayer
{
  CALayer *bubbleLayer;
  double v4;
  double v5;
  double v6;
  double v7;
  CALayer *v8;
  CALayer *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  bubbleLayer = self->_bubbleLayer;
  if (!bubbleLayer)
  {
    -[CompassBackgroundView bounds](self, "bounds");
    v5 = bubbleDiameter(v4);
    -[CompassBackgroundView bounds](self, "bounds");
    v7 = bubbleDiameter(v6);
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v8 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v9 = self->_bubbleLayer;
    self->_bubbleLayer = v8;

    -[CALayer setFrame:](self->_bubbleLayer, "setFrame:", 0.0, 0.0, v5, v7);
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsEdgeAntialiasing:", 1);
    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v5, v7);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.119999997);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, v5, v7);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setPath:", objc_msgSend(v12, "CGPath"));

    -[CALayer addSublayer:](self->_bubbleLayer, "addSublayer:", v10);
    -[CompassBackgroundView bounds](self, "bounds");
    v14 = bubbleDiameter(v13) * 0.5;
    -[CompassBackgroundView bounds](self, "bounds");
    v16 = smallCrosshairWidth(v15);
    -[CompassBackgroundView bounds](self, "bounds");
    -[CompassBackgroundView _crosshairLayerWithBounds:](self, "_crosshairLayerWithBounds:", 0.0, 0.0, v16, smallCrosshairWidth(v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPosition:", v14, v14);
    -[CALayer addSublayer:](self->_bubbleLayer, "addSublayer:", v18);
    -[CompassBackgroundView staticLayer](self, "staticLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", self->_bubbleLayer);

    bubbleLayer = self->_bubbleLayer;
  }
  return bubbleLayer;
}

- (id)bearingLayer
{
  CALayer *bearingLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;

  bearingLayer = self->_bearingLayer;
  if (!bearingLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bearingLayer;
    self->_bearingLayer = v4;

    -[CALayer setAllowsEdgeAntialiasing:](self->_bearingLayer, "setAllowsEdgeAntialiasing:", 1);
    -[CALayer setFrame:](self->_bearingLayer, "setFrame:", 0.0, 0.0, 2.5, self->_bearingLength);
    -[CompassBackgroundView rotatingLayer](self, "rotatingLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", self->_bearingLayer);

    bearingLayer = self->_bearingLayer;
  }
  return bearingLayer;
}

- (id)rotatingLayer
{
  CALayer *rotatingLayer;
  CALayer *v4;
  CALayer *v5;
  CALayer *v6;
  void *v7;
  CALayer *v8;
  void *v9;
  void *v10;

  rotatingLayer = self->_rotatingLayer;
  if (!rotatingLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rotatingLayer;
    self->_rotatingLayer = v4;

    v6 = self->_rotatingLayer;
    -[CompassBackgroundView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    -[CALayer setFrame:](v6, "setFrame:");

    v8 = self->_rotatingLayer;
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setCompositingFilter:](v8, "setCompositingFilter:", v9);

    -[CompassBackgroundView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", self->_rotatingLayer);

    rotatingLayer = self->_rotatingLayer;
  }
  return rotatingLayer;
}

- (id)largeCompassTicLayers
{
  CAReplicatorLayer *largeCompassTicLayers;
  CAReplicatorLayer *v4;
  CAReplicatorLayer *v5;
  CAReplicatorLayer *v6;
  void *v7;
  CATransform3D v9;

  largeCompassTicLayers = self->_largeCompassTicLayers;
  if (!largeCompassTicLayers)
  {
    objc_msgSend(MEMORY[0x24BDE5748], "layer");
    v4 = (CAReplicatorLayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_largeCompassTicLayers;
    self->_largeCompassTicLayers = v4;

    v6 = self->_largeCompassTicLayers;
    CATransform3DMakeRotation(&v9, 0.523598776, 0.0, 0.0, 1.0);
    -[CAReplicatorLayer setInstanceTransform:](v6, "setInstanceTransform:", &v9);
    -[CAReplicatorLayer setInstanceCount:](self->_largeCompassTicLayers, "setInstanceCount:", 12);
    -[CompassBackgroundView rotatingLayer](self, "rotatingLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", self->_largeCompassTicLayers);

    largeCompassTicLayers = self->_largeCompassTicLayers;
  }
  return largeCompassTicLayers;
}

- (void)setTicRadius:(double)a3
{
  self->_ticRadius = a3;
  -[CompassBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (CompassBackgroundView)initWithFrame:(CGRect)a3 forCompass:(BOOL)a4
{
  CompassBackgroundView *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CompassBackgroundView;
  result = -[CompassBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_shownInCompass = a4;
    result->_bearing = 1.79769313e308;
  }
  return result;
}

- (CompassBackgroundView)initWithFrame:(CGRect)a3
{
  return -[CompassBackgroundView initWithFrame:forCompass:](self, "initWithFrame:forCompass:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
  -[CompassBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (double)ticLength
{
  return self->_ticLength;
}

- (double)ticRadius
{
  return self->_ticRadius;
}

- (double)bearing
{
  return self->_bearing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleLayer, 0);
  objc_storeStrong((id *)&self->_crosshairLayer, 0);
  objc_storeStrong((id *)&self->_currentHeadingLayer, 0);
  objc_storeStrong((id *)&self->_bearingLayer, 0);
  objc_storeStrong((id *)&self->_prototypeLargeTicLayer, 0);
  objc_storeStrong((id *)&self->_prototypeSmallTicLayer, 0);
  objc_storeStrong((id *)&self->_largeCompassTicLayers, 0);
  objc_storeStrong((id *)&self->_smallCompassTicLayers, 0);
  objc_storeStrong((id *)&self->_rotatingLayer, 0);
  objc_storeStrong((id *)&self->_staticLayer, 0);
}

@end
