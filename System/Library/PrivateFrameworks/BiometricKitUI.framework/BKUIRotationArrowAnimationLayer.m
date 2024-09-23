@implementation BKUIRotationArrowAnimationLayer

+ (id)animatorWith:(CGRect)a3 color:(id)a4 radiusForOrientation:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  BKUIRotationArrowAnimationLayer *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v11 = a4;
  v12 = -[BKUIRotationArrowAnimationLayer initWith:radiusForOrientation:arrowAngle:arrowLength:color:]([BKUIRotationArrowAnimationLayer alloc], "initWith:radiusForOrientation:arrowAngle:arrowLength:color:", v10, v11, x, y, width, height, 0.0, 0.0);

  return v12;
}

+ (id)animatorByEmbedding:(id)a3 color:(id)a4 radiusForOrientation:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKUIRotationArrowAnimationLayer *v10;
  BKUIRotationArrowAnimationLayer *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [BKUIRotationArrowAnimationLayer alloc];
  objc_msgSend(v9, "bounds");
  v11 = -[BKUIRotationArrowAnimationLayer initWith:radiusForOrientation:arrowAngle:arrowLength:color:](v10, "initWith:radiusForOrientation:arrowAngle:arrowLength:color:", v7, v8);

  objc_msgSend(v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v11);

  objc_msgSend(v9, "center");
  v13 = -[BKUIRotationArrowAnimationLayer _extendedInit:](v11, "_extendedInit:");
  objc_msgSend(v9, "center");
  -[BKUIRotationArrowAnimationLayer setPosition:](v11, "setPosition:");
  objc_msgSend(v9, "center");
  v15 = v14;
  v17 = v16;

  -[BKUIRotationArrowAnimationLayer setHostCenter:](v11, "setHostCenter:", v15, v17);
  return v11;
}

- (BKUIRotationArrowAnimationLayer)initWith:(CGRect)a3 radiusForOrientation:(id)a4 arrowAngle:(double)a5 arrowLength:(double)a6 color:(id)a7
{
  id v11;
  id v12;
  BKUIRotationArrowAnimationLayer *v13;
  uint64_t v14;
  id getOrientation;
  double v16;
  double v17;
  double v18;
  objc_super v20;

  v11 = a4;
  v12 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BKUIRotationArrowAnimationLayer;
  v13 = -[BKUIRotationArrowAnimationLayer init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    getOrientation = v13->_getOrientation;
    v13->_getOrientation = (id)v14;

    v13->_arrowAngle = a5;
    v13->_arrowlength = a6;
    objc_storeStrong((id *)&v13->_color, a7);
    v16 = (*((double (**)(id, _QWORD))v11 + 2))(v11, 0);
    v17 = v16 + v16;
    v18 = (*((double (**)(id, _QWORD))v11 + 2))(v11, 0);
    -[BKUIRotationArrowAnimationLayer setBounds:](v13, "setBounds:", 0.0, 0.0, v17, v18 + v18);
  }

  return v13;
}

- (id)_extendedInit:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;

  y = a3.y;
  x = a3.x;
  -[BKUIRotationArrowAnimationLayer setContainerSize:](self, "setContainerSize:", 28.0, 28.0);
  -[BKUIRotationArrowAnimationLayer setHostCenter:](self, "setHostCenter:", x, y);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer addSublayer:](self, "addSublayer:", v6);

  -[BKUIRotationArrowAnimationLayer hostCenter](self, "hostCenter");
  -[BKUIRotationArrowAnimationLayer setPosition:](self, "setPosition:");
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", v8);

  -[BKUIRotationArrowAnimationLayer bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer setArrowContainer:](self, "setArrowContainer:", v18);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer setArrowLayerLeft:](self, "setArrowLayerLeft:", v19);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer setArrowLayerRight:](self, "setArrowLayerRight:", v20);

  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", 0.0, 100.0, 28.0, 28.0);

  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "position");
  v24 = v23;
  v26 = v25;
  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPosition:", v24, v26);

  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSublayer:", v29);

  -[BKUIRotationArrowAnimationLayer _resetHideCircleLayerStrokeTo:](self, "_resetHideCircleLayerStrokeTo:", 0.5);
  -[BKUIRotationArrowAnimationLayer _layoutArrowSubLayers](self, "_layoutArrowSubLayers");
  -[BKUIRotationArrowAnimationLayer enableDebug:](self, "enableDebug:", 0);
  return self;
}

- (CAShapeLayer)circleLayer
{
  CAShapeLayer *v3;
  CAShapeLayer *circleLayer;

  if (!self->_circleLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v3 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    circleLayer = self->_circleLayer;
    self->_circleLayer = v3;

  }
  -[BKUIRotationArrowAnimationLayer _updateCircleLayerLayout:](self, "_updateCircleLayerLayout:", -[BKUIRotationArrowAnimationLayer orientation](self, "orientation"));
  return self->_circleLayer;
}

- (CAShapeLayer)rotationLayer
{
  CAShapeLayer *rotationLayer;
  CAShapeLayer *v4;
  CAShapeLayer *v5;

  rotationLayer = self->_rotationLayer;
  if (!rotationLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v4 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rotationLayer;
    self->_rotationLayer = v4;

    rotationLayer = self->_rotationLayer;
  }
  return rotationLayer;
}

- (void)_layoutArrowContainer:(int64_t)a3
{
  void *v4;
  double MidX;
  void *v6;
  double MidY;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  int64_t v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  CGRect v27;
  CGRect v28;

  -[BKUIRotationArrowAnimationLayer setOrientation:](self, "setOrientation:", a3);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v27);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  MidY = CGRectGetMidY(v28);
  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPosition:", MidX, MidY);

  v9 = MGGetProductType();
  if (v9 <= 2619317133)
  {
    if (v9 != 555503454)
    {
      v10 = 2487868872;
      goto LABEL_6;
    }
LABEL_7:
    if (-[BKUIRotationArrowAnimationLayer orientation](self, "orientation") != 4
      && -[BKUIRotationArrowAnimationLayer orientation](self, "orientation"))
    {
      v11 = -[BKUIRotationArrowAnimationLayer orientation](self, "orientation");
      -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
      if (v11 == 3)
      {
LABEL_10:

        -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v17 = v16;
        -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bounds");
        v20 = v17 + v19 * 0.5;

LABEL_15:
        -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFrame:", v14, v20, 28.0, 28.0);

        return;
      }
LABEL_14:
      -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v14 = v14 + v24 * -0.5;

      -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v20 = v25;
      goto LABEL_15;
    }
    return;
  }
  if (v9 == 2619317134)
    goto LABEL_7;
  v10 = 3241053352;
LABEL_6:
  if (v9 == v10)
    goto LABEL_7;
  if (-[BKUIRotationArrowAnimationLayer orientation](self, "orientation") != 1
    && -[BKUIRotationArrowAnimationLayer orientation](self, "orientation"))
  {
    v21 = -[BKUIRotationArrowAnimationLayer orientation](self, "orientation");
    -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v22;
    if (v21 == 2)
      goto LABEL_10;
    goto LABEL_14;
  }
}

- (void)animateDirectionPath:(double)a3 orientation:(int64_t)a4 duration:(double)a5 animationDelay:(double)a6
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;

  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 0);

  -[BKUIRotationArrowAnimationLayer _layoutArrowContainer:](self, "_layoutArrowContainer:", a4);
  -[BKUIRotationArrowAnimationLayer _layoutArrowSubLayers](self, "_layoutArrowSubLayers");
  -[BKUIRotationArrowAnimationLayer setOrientation:](self, "setOrientation:", a4);
  v12 = MGGetProductType();
  if (v12 > 2619317133)
  {
    if (v12 == 2619317134)
      goto LABEL_7;
    v13 = 3241053352;
  }
  else
  {
    if (v12 == 555503454)
      goto LABEL_7;
    v13 = 2487868872;
  }
  if (v12 != v13)
  {
    v15 = -[BKUIRotationArrowAnimationLayer orientation](self, "orientation");
    if (v15 != 2)
    {
      if (v15 == 3)
        goto LABEL_16;
      if (v15 != 4)
        return;
LABEL_14:
      -[BKUIRotationArrowAnimationLayer _animateArrowClockwise:duration:animationDelay:](self, "_animateArrowClockwise:duration:animationDelay:", a3, a5, a6);
      return;
    }
LABEL_15:
    -[BKUIRotationArrowAnimationLayer _animateArrowUpsideDown:duration:animationDelay:](self, "_animateArrowUpsideDown:duration:animationDelay:", a3, a5, a6);
    return;
  }
LABEL_7:
  v14 = -[BKUIRotationArrowAnimationLayer orientation](self, "orientation");
  switch(v14)
  {
    case 3:
      goto LABEL_15;
    case 2:
      goto LABEL_14;
    case 1:
LABEL_16:
      -[BKUIRotationArrowAnimationLayer _animateArrowCounterClockwise:duration:animationDelay:](self, "_animateArrowCounterClockwise:duration:animationDelay:", a3, a5, a6);
      break;
  }
}

- (void)stopAnimationRemoveStroke
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[BKUIRotationArrowAnimationLayer _zeroOutArrowStroke](self, "_zeroOutArrowStroke");
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

}

- (void)_layoutArrowSubLayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", v6);

  }
  v7 = 2;
  v8 = MGGetProductType();
  if (v8 > 2619317133)
  {
    if (v8 != 3241053352)
    {
      v9 = 2619317134;
LABEL_8:
      if (v8 != v9)
        goto LABEL_10;
    }
  }
  else if (v8 != 555503454)
  {
    v9 = 2487868872;
    goto LABEL_8;
  }
  v7 = 3;
LABEL_10:
  v10 = -[BKUIRotationArrowAnimationLayer orientation](self, "orientation");
  if (v10 == v7)
    v11 = 28.0;
  else
    v11 = 0.0;
  if (v10 == v7)
    v12 = 0.0;
  else
    v12 = 28.0;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moveToPoint:", 14.0, 14.0);
  objc_msgSend(v13, "addLineToPoint:", v11, v12);
  -[BKUIRotationArrowAnimationLayer color](self, "color");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGColor");
  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStrokeColor:", v15);

  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFillColor:", 0);

  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineWidth:", 6.0);

  v19 = *MEMORY[0x1E0CD3010];
  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLineCap:", v19);

  v42 = objc_retainAutorelease(v13);
  v21 = objc_msgSend(v42, "CGPath");
  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPath:", v21);

  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSublayer:", v24);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "moveToPoint:", 14.0, 14.0);
  objc_msgSend(v25, "addLineToPoint:", 28.0, 28.0);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer setArrowLayerRight:](self, "setArrowLayerRight:", v26);

  -[BKUIRotationArrowAnimationLayer color](self, "color");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = objc_msgSend(v27, "CGColor");
  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStrokeColor:", v28);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v30, "CGColor");
  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFillColor:", v31);

  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLineWidth:", 6.0);

  v34 = *MEMORY[0x1E0CD3030];
  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLineJoin:", v34);

  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setLineCap:", v19);

  v37 = objc_retainAutorelease(v25);
  v38 = objc_msgSend(v37, "CGPath");
  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPath:", v38);

  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSublayer:", v41);

  -[BKUIRotationArrowAnimationLayer _zeroOutArrowStroke](self, "_zeroOutArrowStroke");
}

- (double)radius
{
  double (**v3)(_QWORD, _QWORD);
  double v4;

  -[BKUIRotationArrowAnimationLayer getOrientation](self, "getOrientation");
  v3 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4 = v3[2](v3, -[BKUIRotationArrowAnimationLayer orientation](self, "orientation"));

  return v4;
}

- (void)_animateArrowPaths:(double)a3 delay:(double)a4 duration:(double)a5
{
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"), a3, a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v8 = a5 * 0.5;
  objc_msgSend(v15, "setDuration:", v8);
  objc_msgSend(v15, "setFromValue:", &unk_1EA298A40);
  objc_msgSend(v15, "setToValue:", &unk_1EA298A50);
  objc_msgSend(v15, "setAutoreverses:", 1);
  objc_msgSend(v15, "setBeginTime:", a3);
  v9 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v10);

  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v15, CFSTR("strokeEnd"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", v8);
  objc_msgSend(v12, "setFromValue:", &unk_1EA298A40);
  objc_msgSend(v12, "setToValue:", &unk_1EA298A50);
  objc_msgSend(v12, "setAutoreverses:", 1);
  objc_msgSend(v12, "setBeginTime:", a3);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunction:", v13);

  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v12, CFSTR("strokeEnd"));

}

- (void)_rotateRotationLayerBy:(double)a3 startTime:(double)a4 fromDegree:(unint64_t)a5 toDegree:(unint64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a5 * 3.14159265 / 180.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a6 * 3.14159265 / 180.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v12);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v13);

  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v15, "setBeginTime:", a4);
  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v15, CFSTR("rotationZ"));

}

- (void)_animateArrowUpsideDown:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CFTimeInterval v13;
  CFTimeInterval v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v25[8];

  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v25[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v25[5] = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v25[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v25[7] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v25[0] = *MEMORY[0x1E0CD2610];
  v25[1] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v25[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v25[3] = v12;
  objc_msgSend(v8, "setTransform:", v25);

  v13 = CACurrentMediaTime();
  v14 = v13 + a5;
  -[BKUIRotationArrowAnimationLayer _animateArrowPaths:delay:duration:](self, "_animateArrowPaths:delay:duration:", v13 + a5, a5, a4);
  -[BKUIRotationArrowAnimationLayer _resetHideCircleLayerStrokeTo:](self, "_resetHideCircleLayerStrokeTo:", 0.25);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", a4 + a4 * -0.031);
  objc_msgSend(v15, "setFromValue:", &unk_1EA298A60);
  objc_msgSend(v15, "setToValue:", &unk_1EA298A70);
  objc_msgSend(v15, "setBeginTime:", v14 + a4 * 0.01419);
  LODWORD(v16) = 1054280253;
  LODWORD(v17) = 1058306785;
  LODWORD(v18) = 1065185444;
  LODWORD(v19) = 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v16, v19, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v20);

  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v15, CFSTR("strokeEnd"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeStart"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDuration:", a4 - a4 * 0.35);
  objc_msgSend(v22, "setFromValue:", &unk_1EA298A60);
  objc_msgSend(v22, "setToValue:", &unk_1EA298A70);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimingFunction:", v23);

  objc_msgSend(v22, "setRemovedOnCompletion:", 0);
  objc_msgSend(v22, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v22, "setBeginTime:", v14 + a4 * 0.35);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAnimation:forKey:", v22, CFSTR("strokeStart"));

  -[BKUIRotationArrowAnimationLayer _rotateRotationLayerBy:startTime:fromDegree:toDegree:](self, "_rotateRotationLayerBy:startTime:fromDegree:toDegree:", 0, 180, a4, v14);
}

- (void)_animateArrowClockwise:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];

  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v14[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v14[5] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v14[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v14[7] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v14[0] = *MEMORY[0x1E0CD2610];
  v14[1] = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v14[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v14[3] = v13;
  objc_msgSend(v9, "setTransform:", v14);

  -[BKUIRotationArrowAnimationLayer _landscapeAnimationImpl:duration:animationDelay:](self, "_landscapeAnimationImpl:duration:animationDelay:", a3, a4, a5);
}

- (void)_animateArrowCounterClockwise:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  void *v9;
  CATransform3D v10;
  CATransform3D v11;

  CATransform3DMakeRotation(&v11, 3.14159265, 0.0, 1.0, 0.0);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  objc_msgSend(v9, "setTransform:", &v10);

  -[BKUIRotationArrowAnimationLayer _landscapeAnimationImpl:duration:animationDelay:](self, "_landscapeAnimationImpl:duration:animationDelay:", a3, a4, a5);
}

- (void)_landscapeAnimationImpl:(double)a3 duration:(double)a4 animationDelay:(double)a5
{
  CFTimeInterval v8;
  CFTimeInterval v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = CACurrentMediaTime();
  v9 = v8 + a5;
  -[BKUIRotationArrowAnimationLayer _animateArrowPaths:delay:duration:](self, "_animateArrowPaths:delay:duration:", v8 + a5, a5, a4);
  -[BKUIRotationArrowAnimationLayer _resetHideCircleLayerStrokeTo:](self, "_resetHideCircleLayerStrokeTo:", 0.5);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDuration:", a4 - a4 * 0.023);
  objc_msgSend(v16, "setFromValue:", &unk_1EA298A80);
  objc_msgSend(v16, "setToValue:", &unk_1EA298A70);
  objc_msgSend(v16, "setBeginTime:", v9 + a4 * 0.023);
  v10 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v11);

  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v16, CFSTR("strokeEnd"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeStart"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDuration:", a4 - a4 * 0.35);
  objc_msgSend(v13, "setFromValue:", &unk_1EA298A80);
  objc_msgSend(v13, "setToValue:", &unk_1EA298A70);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimingFunction:", v14);

  objc_msgSend(v13, "setRemovedOnCompletion:", 0);
  objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v13, "setBeginTime:", v9 + a4 * 0.35);
  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v13, CFSTR("strokeStart"));

  -[BKUIRotationArrowAnimationLayer _rotateRotationLayerBy:startTime:fromDegree:toDegree:](self, "_rotateRotationLayerBy:startTime:fromDegree:toDegree:", 0, 90, a4, v9 + a4 * 0.01);
}

- (void)_updateCircleLayerLayout:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  -[BKUIRotationArrowAnimationLayer radius](self, "radius", a3);
  v5 = v4 + v4;
  -[BKUIRotationArrowAnimationLayer radius](self, "radius");
  v7 = v6 + v6;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", 0.0, 0.0, v5, v6 + v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setBounds:](self->_circleLayer, "setBounds:", 0.0, 0.0, v5, v7);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.490196079, 1.0, 1.0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_circleLayer, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", 0);
  -[CAShapeLayer setLineWidth:](self->_circleLayer, "setLineWidth:", 6.0);
  -[CAShapeLayer setLineCap:](self->_circleLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
  -[CAShapeLayer setAnchorPoint:](self->_circleLayer, "setAnchorPoint:", 0.5, 0.5);
  v19 = objc_retainAutorelease(v8);
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", objc_msgSend(v19, "CGPath"));
  -[CAShapeLayer bounds](self->_circleLayer, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

}

- (void)layoutSublayers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIRotationArrowAnimationLayer;
  -[BKUIRotationArrowAnimationLayer layoutSublayers](&v3, sel_layoutSublayers);
  -[BKUIRotationArrowAnimationLayer _updateCircleLayerLayout:](self, "_updateCircleLayerLayout:", -[BKUIRotationArrowAnimationLayer orientation](self, "orientation"));
}

- (void)setHostCenter:(CGPoint)a3
{
  self->_hostCenter = a3;
}

- (void)enableDebug:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  v8 = (double)v3;
  -[BKUIRotationArrowAnimationLayer arrowContainer](self, "arrowContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "CGColor");
  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v11);

  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGColor");
  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderColor:", v15);

  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderWidth:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[BKUIRotationArrowAnimationLayer setBorderColor:](self, "setBorderColor:", objc_msgSend(v18, "CGColor"));

  -[BKUIRotationArrowAnimationLayer setBorderWidth:](self, "setBorderWidth:", v8);
}

- (void)_resetHideCircleLayerStrokeTo:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeEnd:", a3);

  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeStart:", a3);

  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

}

- (void)_zeroOutArrowStroke
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStrokeStart:", 0.0);

  -[BKUIRotationArrowAnimationLayer arrowLayerRight](self, "arrowLayerRight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeEnd:", 0.0);

  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeStart:", 0.0);

  -[BKUIRotationArrowAnimationLayer arrowLayerLeft](self, "arrowLayerLeft");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeEnd:", 0.0);

}

- (void)resetLayout
{
  void *v3;
  void *v4;

  -[BKUIRotationArrowAnimationLayer circleLayer](self, "circleLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[BKUIRotationArrowAnimationLayer rotationLayer](self, "rotationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[BKUIRotationArrowAnimationLayer stopAnimationRemoveStroke](self, "stopAnimationRemoveStroke");
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)arrowAngle
{
  return self->_arrowAngle;
}

- (void)setArrowAngle:(double)a3
{
  self->_arrowAngle = a3;
}

- (double)arrowlength
{
  return self->_arrowlength;
}

- (void)setArrowlength:(double)a3
{
  self->_arrowlength = a3;
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (CGPoint)hostCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_hostCenter.x;
  y = self->_hostCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (CALayer)arrowContainer
{
  return self->_arrowContainer;
}

- (void)setArrowContainer:(id)a3
{
  objc_storeStrong((id *)&self->_arrowContainer, a3);
}

- (id)getOrientation
{
  return self->_getOrientation;
}

- (void)setGetOrientation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CAShapeLayer)arrowLayerLeft
{
  return self->_arrowLayerLeft;
}

- (void)setArrowLayerLeft:(id)a3
{
  objc_storeStrong((id *)&self->_arrowLayerLeft, a3);
}

- (CAShapeLayer)arrowLayerRight
{
  return self->_arrowLayerRight;
}

- (void)setArrowLayerRight:(id)a3
{
  objc_storeStrong((id *)&self->_arrowLayerRight, a3);
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (void)setRotationLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rotationLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationLayer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_arrowLayerRight, 0);
  objc_storeStrong((id *)&self->_arrowLayerLeft, 0);
  objc_storeStrong(&self->_getOrientation, 0);
  objc_storeStrong((id *)&self->_arrowContainer, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
