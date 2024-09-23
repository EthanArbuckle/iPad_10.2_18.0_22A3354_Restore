@implementation AXPIFingerView

- (id)backdropLayer
{
  void *v3;

  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v3 = 0;
  }
  else
  {
    -[AXPIFingerView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)layerClass
{
  UIAccessibilityIsInvertColorsEnabled();
  objc_opt_self();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AXPIFingerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AXPIFingerView *v8;
  void *v9;
  AXPIFingerView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = [AXPIFingerView alloc];
  AXPIDefaultAppearanceForDevice();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AXPIFingerView initWithFrame:appearanceDelegate:](v8, "initWithFrame:appearanceDelegate:", v9, x, y, width, height);

  return v10;
}

- (AXPIFingerView)initWithFrame:(CGRect)a3 appearanceDelegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  AXPIFingerView *v10;
  void *v11;
  AXPIFingerLayer *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  objc_super v55;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)AXPIFingerView;
  v10 = -[AXPIFingerView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPIFingerView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[AXPIFingerView setClipsToBounds:](v10, "setClipsToBounds:", 0);
    -[AXPIFingerView setAppearanceDelegate:](v10, "setAppearanceDelegate:", v9);
    v12 = -[AXPIFingerLayer initWithAppearanceDelegate:]([AXPIFingerLayer alloc], "initWithAppearanceDelegate:", v9);
    -[AXPIFingerView layer](v10, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v12);

    -[AXPIFingerView setCursorLayer:](v10, "setCursorLayer:", v12);
    -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "showFingerOutlines");

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDE5758], "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "strokeOutlineColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v16, "setFillColor:", objc_msgSend(v19, "CGColor"));

      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "strokeOutlineWidth");
      v22 = v21;
      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "strokeWidth");
      objc_msgSend(v16, "setLineWidth:", v24 + v22 * 2.0);

      -[AXPIFingerView layer](v10, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSublayer:", v16);

      -[AXPIFingerView setOuterStrokeTrackLayer:](v10, "setOuterStrokeTrackLayer:", v16);
      objc_msgSend(MEMORY[0x24BDE5758], "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deselectedStrokeColor");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v26, "setStrokeColor:", objc_msgSend(v28, "CGColor"));

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v26, "setFillColor:", objc_msgSend(v29, "CGColor"));

      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "strokeWidth");
      objc_msgSend(v26, "setLineWidth:");

      -[AXPIFingerView layer](v10, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSublayer:", v26);

      -[AXPIFingerView setOuterStrokeLayer:](v10, "setOuterStrokeLayer:", v26);
    }
    -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "showInnerCircle");

    if (v33)
    {
      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fingerInnerCircleInnerRadius");
      v36 = v35;
      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "innerCircleStrokeWidth");
      v39 = v38 + v36 * 2.0;

      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fingerInnerCircleInnerRadius");
      v42 = v41;
      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "innerCircleStrokeWidth");
      v45 = v44 + v42 * 2.0;

      objc_msgSend(MEMORY[0x24BDE5758], "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", x + (width - v39) * 0.5, y + (height - v45) * 0.5, v39, v45);
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v46, "setPath:", objc_msgSend(v47, "CGPath"));

      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "strokeOutlineColor");
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v46, "setStrokeColor:", objc_msgSend(v49, "CGColor"));

      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "deselectedStrokeColor");
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v46, "setFillColor:", objc_msgSend(v51, "CGColor"));

      -[AXPIFingerView appearanceDelegate](v10, "appearanceDelegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "innerCircleStrokeWidth");
      objc_msgSend(v46, "setLineWidth:");

      objc_msgSend(v46, "setLineJoin:", *MEMORY[0x24BDE5D08]);
      -[AXPIFingerView layer](v10, "layer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addSublayer:", v46);

      -[AXPIFingerView setInnerStrokeLayer:](v10, "setInnerStrokeLayer:", v46);
    }
    -[AXPIFingerView _setPathForCurrentShape](v10, "_setPathForCurrentShape");

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[AXPIFingerView outerStrokeTrackLayer](self, "outerStrokeTrackLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[AXPIFingerView outerStrokeLayer](self, "outerStrokeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[AXPIFingerView innerStrokeLayer](self, "innerStrokeLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[AXPIFingerView outerStrokeTrackLayer](self, "outerStrokeTrackLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperlayer");

  -[AXPIFingerView outerStrokeLayer](self, "outerStrokeLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperlayer");

  -[AXPIFingerView innerStrokeLayer](self, "innerStrokeLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperlayer");

  v9.receiver = self;
  v9.super_class = (Class)AXPIFingerView;
  -[AXPIFingerView dealloc](&v9, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fingerWidth");
  v5 = v4;

  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v6;
  BOOL v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[AXPIFingerView cursorLayer](self, "cursorLayer", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outerFrame");
  v9.x = x;
  v9.y = y;
  v7 = CGRectContainsPoint(v10, v9);

  return v7;
}

- (void)setSelected:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  if (-[AXPIFingerView isSelected](self, "isSelected") != a3)
  {
    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3)
      objc_msgSend(v5, "selectedStrokeColor");
    else
      objc_msgSend(v5, "deselectedStrokeColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");

    -[AXPIFingerView outerStrokeLayer](self, "outerStrokeLayer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStrokeColor:", v8);

  }
}

- (BOOL)isSelected
{
  void *v2;
  char v3;

  -[AXPIFingerView cursorLayer](self, "cursorLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelected");

  return v3;
}

- (void)setPressed:(BOOL)a3
{
  -[AXPIFingerView setPressed:animated:](self, "setPressed:animated:", a3, 0);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  if (self->_pressed != a3)
  {
    v4 = a4;
    self->_pressed = a3;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    if (a3)
    {
      v7 = 0.1;
      if (!v4)
        v7 = 0.0;
      objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", v7);
      -[AXPIFingerView cursorLayer](self, "cursorLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPressed:", 1);

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedStrokeColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0.16;
      if (!v4)
        v11 = 0.0;
      objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", v11);
      -[AXPIFingerView cursorLayer](self, "cursorLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPressed:", 0);

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deselectedStrokeColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_retainAutorelease(v10);
    v14 = objc_msgSend(v13, "CGColor");

    -[AXPIFingerView outerStrokeLayer](self, "outerStrokeLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStrokeColor:", v14);

    -[AXPIFingerView innerStrokeLayer](self, "innerStrokeLayer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFillColor:", v14);

  }
}

- (void)setShape:(unint64_t)a3
{
  if (self->_shape != a3)
  {
    self->_shape = a3;
    -[AXPIFingerView _setPathForCurrentShape](self, "_setPathForCurrentShape");
  }
}

- (void)animateCircularProgressWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v6 = a4;
  -[AXPIFingerView cancelExisingCircularProgressAnimation](self, "cancelExisingCircularProgressAnimation");
  -[AXPIFingerView setLastProgressCompletionBlock:](self, "setLastProgressCompletionBlock:", v6);

  -[AXPIFingerView cursorLayer](self, "cursorLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outerFrame");
  -[AXPIFingerView _createProgressLayerWithDuration:inRect:](self, "_createProgressLayerWithDuration:inRect:", a3, v8, v9, v10, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[AXPIFingerView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v13);

  -[AXPIFingerView setProgressLayer:](self, "setProgressLayer:", v13);
}

- (void)cancelExisingCircularProgressAnimation
{
  void *v3;

  -[AXPIFingerView progressLayer](self, "progressLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[AXPIFingerView setProgressLayer:](self, "setProgressLayer:", 0);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = a4;
  -[AXPIFingerView lastProgressCompletionBlock](self, "lastProgressCompletionBlock", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AXPIFingerView lastProgressCompletionBlock](self, "lastProgressCompletionBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v4);

    -[AXPIFingerView setLastProgressCompletionBlock:](self, "setLastProgressCompletionBlock:", 0);
  }
}

- (void)_setPathForCurrentShape
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
  double y;
  double width;
  double height;
  double x;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  id v41;
  id v42;
  CGRect v43;
  CGRect v44;

  -[AXPIFingerView cursorLayer](self, "cursorLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outerFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  y = v7;
  width = v9;
  height = v11;
  x = v5;
  if (!self->_shape)
  {
    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "showFingerOutlines");

    y = v7;
    width = v9;
    height = v11;
    x = v5;
    if ((v17 & 1) == 0)
    {
      -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "strokeWidth");
      v20 = v19;

      v43.origin.x = v5;
      v43.origin.y = v7;
      v43.size.width = v9;
      v43.size.height = v11;
      v44 = CGRectInset(v43, v20 * 0.5, v20 * 0.5);
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
    }
  }
  -[AXPIFingerView cursorLayer](self, "cursorLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 0, x, y, width, height);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v21, "setPath:", objc_msgSend(v22, "CGPath"));

  -[AXPIFingerView outerStrokeTrackLayer](self, "outerStrokeTrackLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 1, v5, v7, v9, v11);
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v23, "setPath:", objc_msgSend(v24, "CGPath"));

  -[AXPIFingerView outerStrokeLayer](self, "outerStrokeLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 1, v5, v7, v9, v11);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v25, "setPath:", objc_msgSend(v26, "CGPath"));

  if (self->_shape)
  {
    v28 = *MEMORY[0x24BDBF090];
    v27 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v29 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v30 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fingerInnerCircleInnerRadius");
    v33 = v32;
    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "innerCircleStrokeWidth");
    v29 = v35 + v33 * 2.0;

    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "fingerInnerCircleInnerRadius");
    v38 = v37;
    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "innerCircleStrokeWidth");
    v30 = v40 + v38 * 2.0;

    v28 = v5 + (v9 - v29) * 0.5;
    v27 = v7 + (v11 - v30) * 0.5;
  }
  -[AXPIFingerView innerStrokeLayer](self, "innerStrokeLayer");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", v28, v27, v29, v30);
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v42, "setPath:", objc_msgSend(v41, "CGPath"));

}

- (id)_createProgressLayerWithDuration:(double)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = objc_alloc_init(MEMORY[0x24BDE5758]);
  v11 = *MEMORY[0x24BDBEFB0];
  v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v10, "setPosition:", *MEMORY[0x24BDBEFB0], v12);
  v13 = *MEMORY[0x24BDE5CE8];
  objc_msgSend(v10, "setLineCap:", *MEMORY[0x24BDE5CE8]);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathForFingerShape:inRect:curveOnly:", self->_shape, 1, x, y, width, height);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setPath:", objc_msgSend(v14, "CGPath"));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", a3 + -0.100000001);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v17);

  objc_msgSend(v15, "setDelegate:", self);
  objc_msgSend(v10, "addAnimation:forKey:", v15, CFSTR("drawCircleAnimation"));
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  v18 = -[AXPIFingerView isPressed](self, "isPressed");
  -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
    objc_msgSend(v19, "pressedCircularProgressFillColor");
  else
    objc_msgSend(v19, "circularProgressFillColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v21, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v22, "CGColor"));

  -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "strokeWidth");
  objc_msgSend(v10, "setLineWidth:");

  objc_msgSend(v10, "setName:", CFSTR("holdDurationProgressTrack"));
  -[AXPIFingerView window](self, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "screen");
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v25, "scale");
  objc_msgSend(v10, "setContentsScale:");

  -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = objc_msgSend(v26, "showFingerOutlines");

  if ((v25 & 1) != 0)
  {
    v27 = v10;
  }
  else
  {
    v27 = objc_alloc_init(MEMORY[0x24BDE5758]);
    objc_msgSend(v27, "setPosition:", v11, v12);
    objc_msgSend(v27, "setLineCap:", v13);
    objc_msgSend(v27, "setPath:", objc_msgSend(objc_retainAutorelease(v14), "CGPath"));
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v27, "setFillColor:", objc_msgSend(v28, "CGColor"));

    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "strokeWidth");
    objc_msgSend(v27, "setLineWidth:", v30 + 4.0);

    objc_msgSend(v27, "setName:", CFSTR("holdDurationBaseProgressTrack"));
    -[AXPIFingerView window](self, "window");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "screen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scale");
    objc_msgSend(v27, "setContentsScale:");

    objc_msgSend(v27, "addAnimation:forKey:", v15, CFSTR("drawCircleAnimation"));
    -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pressedCircularProgressFillColor");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = objc_msgSend(v34, "CGColor");

    if (-[AXPIFingerView isPressed](self, "isPressed"))
    {
      objc_msgSend(v27, "setStrokeColor:", v35);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v27, "setStrokeColor:", objc_msgSend(v36, "CGColor"));

    }
    objc_msgSend(v27, "addSublayer:", v10);
  }

  return v27;
}

- (void)animateToTapWithDuration:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeColor"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerView appearanceDelegate](self, "appearanceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedStrokeColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setToValue:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(v8, "setDuration:", a3);
  objc_msgSend(v8, "setRemovedOnCompletion:", 1);
  -[AXPIFingerView outerStrokeLayer](self, "outerStrokeLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("AXPIFingerView-SetSelected"));

}

- (double)_iconScaleForForce:(double)a3
{
  double v3;

  v3 = a3 * 0.001 + 1.0;
  if (v3 > 1.5)
    v3 = 1.5;
  if (a3 <= 100.0)
    return 1.0;
  else
    return v3;
}

- (void)setForce:(double)a3
{
  __int128 v4;
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  if (self->_force != a3)
  {
    self->_force = a3;
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v7.c = v4;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[AXPIFingerView _iconScaleForForce:](self, "_iconScaleForForce:");
    if (v5 > 1.0)
      CGAffineTransformMakeScale(&v7, v5, v5);
    v6 = v7;
    -[AXPIFingerView setTransform:](self, "setTransform:", &v6);
  }
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (double)force
{
  return self->_force;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (AXPIFingerLayer)cursorLayer
{
  return self->_cursorLayer;
}

- (void)setCursorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_cursorLayer, a3);
}

- (CAShapeLayer)outerStrokeTrackLayer
{
  return self->_outerStrokeTrackLayer;
}

- (void)setOuterStrokeTrackLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerStrokeTrackLayer, a3);
}

- (CAShapeLayer)outerStrokeLayer
{
  return self->_outerStrokeLayer;
}

- (void)setOuterStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerStrokeLayer, a3);
}

- (CAShapeLayer)innerStrokeLayer
{
  return self->_innerStrokeLayer;
}

- (void)setInnerStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerStrokeLayer, a3);
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  return (AXPIFingerAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (id)lastProgressCompletionBlock
{
  return self->_lastProgressCompletionBlock;
}

- (void)setLastProgressCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastProgressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_innerStrokeLayer, 0);
  objc_storeStrong((id *)&self->_outerStrokeLayer, 0);
  objc_storeStrong((id *)&self->_outerStrokeTrackLayer, 0);
  objc_storeStrong((id *)&self->_cursorLayer, 0);
}

@end
