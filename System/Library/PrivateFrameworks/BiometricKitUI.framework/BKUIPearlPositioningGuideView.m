@implementation BKUIPearlPositioningGuideView

- (BKUIPearlPositioningGuideView)initWithFrame:(CGRect)a3
{
  BKUIPearlPositioningGuideView *v3;
  BKUIPearlPositioningGuideView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlPositioningGuideView;
  v3 = -[BKUIPearlPositioningGuideView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKUIPearlPositioningGuideView setOpaque:](v3, "setOpaque:", 0);
    -[BKUIPearlPositioningGuideView setHidden:](v4, "setHidden:", 1);
    -[BKUIPearlPositioningGuideView center](v4, "center");
    -[BKUIPearlPositioningGuideView setPortalCenter:](v4, "setPortalCenter:");
    v4->_startMaskFromCenter = 0;
  }
  return v4;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[BKUIPearlPositioningGuideView isHidden](self, "isHidden") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKUIPearlPositioningGuideView;
    -[BKUIPearlPositioningGuideView setHidden:](&v5, sel_setHidden_, v3);
    if (v3)
      -[BKUIPearlPositioningGuideView _stopDisplay](self, "_stopDisplay");
    else
      -[BKUIPearlPositioningGuideView _startDisplay](self, "_startDisplay");
  }
}

- (void)_startDisplay
{
  __assert_rtn("-[BKUIPearlPositioningGuideView _startDisplay]", "BKUIPearlPositioningGuideView.m", 104, "!_displayLink");
}

- (void)_stopDisplay
{
  CADisplayLink *displayLink;

  -[BKUIPearlPositioningGuideView setAnimationCompletion:](self, "setAnimationCompletion:", 0);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)resetValuesToStart
{
  double v3;
  double v4;
  double v5;

  -[BKUIPearlPositioningGuideView setLineWidth:](self, "setLineWidth:", 4.33333333);
  -[BKUIPearlPositioningGuideView bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[BKUIPearlPositioningGuideView lineWidth](self, "lineWidth");
  -[BKUIPearlPositioningGuideView setEdgeDistance:](self, "setEdgeDistance:", v4 - v5);
  -[BKUIPearlPositioningGuideView setCornerRadius:](self, "setCornerRadius:", 17.6666667);
  -[BKUIPearlPositioningGuideView setPostCornerLength:](self, "setPostCornerLength:", 19.0);
  -[BKUIPearlPositioningGuideView setLineAlpha:](self, "setLineAlpha:", 0.0);
  -[BKUIPearlPositioningGuideView center](self, "center");
  -[BKUIPearlPositioningGuideView setPortalCenter:](self, "setPortalCenter:");
  -[BKUIPearlPositioningGuideView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_startAnimationWithDuration:(double)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;
  uint64_t v8;
  NSDate *v9;
  NSDate *animationStart;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  _QWORD v14[5];
  void (**v15)(id, _QWORD);
  uint64_t v16;
  _QWORD v17[5];

  v6 = (void (**)(id, _QWORD))a4;
  if (-[BKUIPearlPositioningGuideView isHidden](self, "isHidden"))
  {
    if (v6)
      v6[2](v6, 0);
  }
  else if (UIAccessibilityIsReduceMotionEnabled())
  {
    -[BKUIPearlPositioningGuideView alpha](self, "alpha");
    v7 = MEMORY[0x1E0CEABB0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke;
    v17[3] = &unk_1EA27FB98;
    v17[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_2;
    v14[3] = &unk_1EA280650;
    v14[4] = self;
    v16 = v8;
    v15 = v6;
    +[UIView bkui_animateWithDuration:animations:completion:](0.2, v7, v17, v14);

  }
  else
  {
    self->_animationDuration = a3;
    self->_lastAnimationTickProgres = 0.0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    animationStart = self->_animationStart;
    self->_animationStart = v9;

    self->_startLineWidth = self->_lineWidth;
    self->_startEdgeDistance = self->_edgeDistance;
    self->_startCornerRadius = self->_cornerRadius;
    self->_startPostCornerLength = self->_postCornerLength;
    self->_startLineAlpha = self->_lineAlpha;
    self->_startPortalCenter = self->_portalCenter;
    -[BKUIPearlPositioningGuideView animationCompletion](self, "animationCompletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[BKUIPearlPositioningGuideView animationCompletion](self, "animationCompletion");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0);

    }
    v13 = (void *)objc_msgSend(v6, "copy");
    -[BKUIPearlPositioningGuideView setAnimationCompletion:](self, "setAnimationCompletion:", v13);

  }
}

uint64_t __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_2(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7[2];
  id location;

  *((_QWORD *)a1[4] + 62) = 0;
  *((_QWORD *)a1[4] + 75) = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[61];
  v3[61] = v2;

  objc_initWeak(&location, a1[4]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_3;
  v5[3] = &unk_1EA280628;
  objc_copyWeak(v7, &location);
  v7[1] = a1[6];
  v6 = a1[5];
  objc_msgSend(a1[4], "setAnimationCompletion:", v5);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_3(id *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  char v7;
  _QWORD v8[4];
  id v9[2];

  if (a2)
  {
    v3 = MEMORY[0x1E0CEABB0];
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_4;
    v8[3] = &unk_1EA2805D8;
    objc_copyWeak(v9, a1 + 5);
    v9[1] = a1[6];
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_5;
    v5[3] = &unk_1EA280600;
    v6 = a1[4];
    v7 = 1;
    +[UIView bkui_animateWithDuration:animations:completion:](0.2, v3, v8, v5);

    objc_destroyWeak(v9);
  }
}

void __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", *(double *)(a1 + 40));

}

uint64_t __72__BKUIPearlPositioningGuideView__startAnimationWithDuration_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_updateTargetValuesForAnimation:(int64_t)a3 animationCurve:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint *p_targetPortalCenter;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  double v21;
  CGPoint *v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  CGPoint *v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v37 = v6;
  v38 = v5;
  v39 = v4;
  switch(a3)
  {
    case 0:
      self->_targetLineWidth = 4.33333333;
      self->_targetEdgeDistance = 128.0;
      self->_targetCornerRadius = 14.0;
      self->_targetPostCornerLength = 24.0;
      self->_targetLineAlpha = 1.0;
      p_targetPortalCenter = &self->_targetPortalCenter;
      -[BKUIPearlPositioningGuideView center](self, "center");
      p_targetPortalCenter->x = v17;
      self->_targetPortalCenter.y = v18;
      self->_animationCurve = a4;
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "userInterfaceIdiom");

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        self->_targetLineWidth = 6.0;
        -[BKUIPearlPositioningGuideView _minDistance](self, "_minDistance");
        goto LABEL_11;
      }
      break;
    case 1:
      self->_targetLineWidth = 4.33333333;
      self->_targetEdgeDistance = 132.0;
      self->_targetCornerRadius = 14.0;
      self->_targetPostCornerLength = 24.0;
      self->_targetLineAlpha = 1.0;
      v32 = &self->_targetPortalCenter;
      -[BKUIPearlPositioningGuideView center](self, "center");
      v32->x = v33;
      self->_targetPortalCenter.y = v34;
      self->_animationCurve = a4;
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "userInterfaceIdiom");

      if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        self->_targetLineWidth = 6.0;
        -[BKUIPearlPositioningGuideView _maxDistance](self, "_maxDistance");
LABEL_11:
        self->_targetEdgeDistance = v21 - self->_targetLineWidth * 0.5;
        self->_targetCornerRadius = 30.0 - self->_targetLineWidth * 0.5;
        goto LABEL_12;
      }
      break;
    case 2:
      self->_targetLineWidth = 4.33333333;
      self->_targetEdgeDistance = 142.0;
      self->_targetCornerRadius = 14.0;
      self->_targetPostCornerLength = 24.0;
      self->_targetLineAlpha = 1.0;
      v22 = &self->_targetPortalCenter;
      -[BKUIPearlPositioningGuideView center](self, "center");
      v22->x = v23;
      self->_targetPortalCenter.y = v24;
      self->_animationCurve = a4;
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "userInterfaceIdiom");

      if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        self->_targetLineWidth = 6.0;
        -[BKUIPearlPositioningGuideView _maxDistance](self, "_maxDistance");
        self->_targetEdgeDistance = v27 + self->_targetLineWidth * -0.5;
        self->_targetCornerRadius = 28.0;
LABEL_12:
        self->_targetPostCornerLength = 26.0;
      }
      break;
    case 3:
      self->_targetLineWidth = 3.5;
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "userInterfaceIdiom");

      if ((v29 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        self->_targetLineWidth = 6.0;
      -[BKUIPearlPositioningGuideView ringRadius](self, "ringRadius", v11, v10, v9, v8, v7, v37, v38, v39, v12, v13);
      v31 = v30 + self->_targetLineWidth * 0.5;
      self->_targetEdgeDistance = v31;
      self->_targetCornerRadius = v31;
      self->_targetPostCornerLength = 0.0;
      self->_targetLineAlpha = 0.85;
      break;
    default:
      return;
  }
}

- (void)animateToOpenValuesOverDuration:(double)a3 curve:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v8 = a5;
  -[BKUIPearlPositioningGuideView _updateTargetValuesForAnimation:animationCurve:](self, "_updateTargetValuesForAnimation:animationCurve:", 0, a4);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__BKUIPearlPositioningGuideView_animateToOpenValuesOverDuration_curve_completion___block_invoke;
  v10[3] = &unk_1EA280678;
  objc_copyWeak(&v12, &location);
  v9 = v8;
  v11 = v9;
  -[BKUIPearlPositioningGuideView _startAnimationWithDuration:completion:](self, "_startAnimationWithDuration:completion:", v10, a3);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __82__BKUIPearlPositioningGuideView_animateToOpenValuesOverDuration_curve_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *WeakRetained;
  uint64_t v5;
  _BYTE *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WeakRetained[424] = 0;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = WeakRetained;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    WeakRetained = v6;
  }

}

- (void)animateToBreatheOutValuesOverDuration:(double)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  -[BKUIPearlPositioningGuideView _updateTargetValuesForAnimation:animationCurve:](self, "_updateTargetValuesForAnimation:animationCurve:", 1, 0);
  -[BKUIPearlPositioningGuideView _startAnimationWithDuration:completion:](self, "_startAnimationWithDuration:completion:", v6, a3);

}

- (void)animateToPopOutValuesOverDuration:(double)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  -[BKUIPearlPositioningGuideView _updateTargetValuesForAnimation:animationCurve:](self, "_updateTargetValuesForAnimation:animationCurve:", 2, 1);
  -[BKUIPearlPositioningGuideView _startAnimationWithDuration:completion:](self, "_startAnimationWithDuration:completion:", v6, a3);

}

- (double)minimumMaskLayerDistanceFromCenter
{
  void *v3;
  uint64_t v4;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0.0;
  -[BKUIPearlPositioningGuideView _minDistance](self, "_minDistance");
  return result;
}

- (double)maximumMaskLayerDistanceFromCenter
{
  void *v3;
  uint64_t v4;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0.0;
  -[BKUIPearlPositioningGuideView _maxDistance](self, "_maxDistance");
  return result;
}

- (void)breathe
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__BKUIPearlPositioningGuideView_breathe__block_invoke;
  v2[3] = &unk_1EA27FC00;
  v2[4] = self;
  -[BKUIPearlPositioningGuideView animateToBreatheOutValuesOverDuration:completion:](self, "animateToBreatheOutValuesOverDuration:completion:", v2, 1.5);
}

uint64_t __40__BKUIPearlPositioningGuideView_breathe__block_invoke(uint64_t result, int a2)
{
  void *v2;
  _QWORD v3[5];

  if (a2)
  {
    v2 = *(void **)(result + 32);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __40__BKUIPearlPositioningGuideView_breathe__block_invoke_2;
    v3[3] = &unk_1EA27FC00;
    v3[4] = v2;
    return objc_msgSend(v2, "animateToOpenValuesOverDuration:curve:completion:", 0, v3, 1.5);
  }
  return result;
}

uint64_t __40__BKUIPearlPositioningGuideView_breathe__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "breathe");
  return result;
}

- (void)animateToFinishedValuesOverDuration:(double)a3 center:(CGPoint)a4 completion:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  -[BKUIPearlPositioningGuideView _updateTargetValuesForAnimation:animationCurve:](self, "_updateTargetValuesForAnimation:animationCurve:", 3, -[BKUIPearlPositioningGuideView animationCurve](self, "animationCurve"));
  self->_targetPortalCenter.x = x;
  self->_targetPortalCenter.y = y;
  -[BKUIPearlPositioningGuideView _startAnimationWithDuration:completion:](self, "_startAnimationWithDuration:completion:", v9, a3);

}

- (id)_roundedRectMaskForMaskDistance:(double)a3 portalCenter:(CGPoint)a4 cornerRadius:(double)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;

  y = a4.y;
  x = a4.x;
  v9 = (void *)MEMORY[0x1E0CEA390];
  -[BKUIPearlPositioningGuideView bounds](self, "bounds");
  objc_msgSend(v9, "bezierPathWithRect:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "_bezierPathWithArcRoundedRect:cornerRadius:", x - a3, y - a3, a3 + a3, a3 + a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendPath:", v11);

  return v10;
}

- (void)prepareMaskLayerForStartToOpenTransition
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if (-[BKUIPearlPositioningGuideView needsMaskedNeedsPositionStyleEnrollment](self, "needsMaskedNeedsPositionStyleEnrollment"))
  {
    -[BKUIPearlPositioningGuideView roundedRectMaskLayer](self, "roundedRectMaskLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[BKUIPearlPositioningGuideView portalCenter](self, "portalCenter");
      -[BKUIPearlPositioningGuideView _roundedRectMaskForMaskDistance:portalCenter:cornerRadius:](self, "_roundedRectMaskForMaskDistance:portalCenter:cornerRadius:", 0.0, v4, v5, 0.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlPositioningGuideView roundedRectMaskLayer](self, "roundedRectMaskLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_retainAutorelease(v6);
      objc_msgSend(v7, "setPath:", objc_msgSend(v8, "CGPath"));

      self->_startMaskFromCenter = 1;
    }
  }
}

- (void)prepareMaskLayerForReducedMotionOpenTransition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  if (-[BKUIPearlPositioningGuideView needsMaskedNeedsPositionStyleEnrollment](self, "needsMaskedNeedsPositionStyleEnrollment"))
  {
    -[BKUIPearlPositioningGuideView roundedRectMaskLayer](self, "roundedRectMaskLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[BKUIPearlPositioningGuideView _minDistance](self, "_minDistance");
      v5 = v4;
      -[BKUIPearlPositioningGuideView portalCenter](self, "portalCenter");
      -[BKUIPearlPositioningGuideView _roundedRectMaskForMaskDistance:portalCenter:cornerRadius:](self, "_roundedRectMaskForMaskDistance:portalCenter:cornerRadius:", v5, v6, v7, 30.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlPositioningGuideView roundedRectMaskLayer](self, "roundedRectMaskLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_retainAutorelease(v8);
      objc_msgSend(v9, "setPath:", objc_msgSend(v10, "CGPath"));

    }
  }
}

- (double)_updatedFloatWithTarget:(double)a3 current:(double)a4 start:(double)a5 progress:(double)a6
{
  int64_t animationCurve;
  double v9;

  animationCurve = self->_animationCurve;
  switch(animationCurve)
  {
    case 0:
      v9 = timingEaseInOut_block_invoke(a6);
      goto LABEL_7;
    case 2:
      v9 = timingEaseOut_block_invoke_2(a6);
      goto LABEL_7;
    case 1:
      v9 = timingEaseIn_block_invoke_3(a6);
LABEL_7:
      a6 = v9;
      break;
  }
  return a5 + (a3 - a5) * a6;
}

- (void)_displayTick
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSDate *animationStart;
  double targetLineWidth;
  double v11;
  double targetEdgeDistance;
  double v13;
  double targetCornerRadius;
  double v15;
  double targetPostCornerLength;
  double v17;
  double targetLineAlpha;
  double v19;
  double x;
  double v21;
  double v22;
  double v23;
  double y;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void (**v41)(id, uint64_t);

  if (self->_animationStart)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_animationStart);
    v5 = v4;

    -[BKUIPearlPositioningGuideView animationDuration](self, "animationDuration");
    if (v6 <= 0.0
      || (-[BKUIPearlPositioningGuideView animationDuration](self, "animationDuration"), v8 = v5 / v7, v8 >= 1.0))
    {
      animationStart = self->_animationStart;
      self->_animationStart = 0;

      v8 = 1.0;
    }
    targetLineWidth = self->_targetLineWidth;
    -[BKUIPearlPositioningGuideView lineWidth](self, "lineWidth");
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", targetLineWidth, v11, self->_startLineWidth, v8);
    -[BKUIPearlPositioningGuideView setLineWidth:](self, "setLineWidth:");
    targetEdgeDistance = self->_targetEdgeDistance;
    -[BKUIPearlPositioningGuideView edgeDistance](self, "edgeDistance");
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", targetEdgeDistance, v13, self->_startEdgeDistance, v8);
    -[BKUIPearlPositioningGuideView setEdgeDistance:](self, "setEdgeDistance:");
    targetCornerRadius = self->_targetCornerRadius;
    -[BKUIPearlPositioningGuideView cornerRadius](self, "cornerRadius");
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", targetCornerRadius, v15, self->_startCornerRadius, v8);
    -[BKUIPearlPositioningGuideView setCornerRadius:](self, "setCornerRadius:");
    targetPostCornerLength = self->_targetPostCornerLength;
    -[BKUIPearlPositioningGuideView postCornerLength](self, "postCornerLength");
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", targetPostCornerLength, v17, self->_startPostCornerLength, v8);
    -[BKUIPearlPositioningGuideView setPostCornerLength:](self, "setPostCornerLength:");
    targetLineAlpha = self->_targetLineAlpha;
    -[BKUIPearlPositioningGuideView lineAlpha](self, "lineAlpha");
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", targetLineAlpha, v19, self->_startLineAlpha, v8);
    -[BKUIPearlPositioningGuideView setLineAlpha:](self, "setLineAlpha:");
    x = self->_targetPortalCenter.x;
    -[BKUIPearlPositioningGuideView portalCenter](self, "portalCenter");
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", x, v21, self->_startPortalCenter.x, v8);
    v23 = v22;
    y = self->_targetPortalCenter.y;
    -[BKUIPearlPositioningGuideView portalCenter](self, "portalCenter");
    -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", y);
    -[BKUIPearlPositioningGuideView setPortalCenter:](self, "setPortalCenter:", v23, v25);
    if (-[BKUIPearlPositioningGuideView needsMaskedNeedsPositionStyleEnrollment](self, "needsMaskedNeedsPositionStyleEnrollment"))
    {
      -[BKUIPearlPositioningGuideView roundedRectMaskLayer](self, "roundedRectMaskLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        if (self->_startMaskFromCenter)
          -[BKUIPearlPositioningGuideView _updatedFloatWithTarget:current:start:progress:](self, "_updatedFloatWithTarget:current:start:progress:", self->_targetEdgeDistance, 0.0, 0.0, v8);
        else
          -[BKUIPearlPositioningGuideView edgeDistance](self, "edgeDistance");
        v28 = v27;
        -[BKUIPearlPositioningGuideView lineWidth](self, "lineWidth");
        v30 = v28 + v29 * 0.5;
        -[BKUIPearlPositioningGuideView cornerRadius](self, "cornerRadius");
        v32 = v31;
        -[BKUIPearlPositioningGuideView lineWidth](self, "lineWidth");
        v34 = v32 + v33 * 0.5;
        -[BKUIPearlPositioningGuideView portalCenter](self, "portalCenter");
        -[BKUIPearlPositioningGuideView _roundedRectMaskForMaskDistance:portalCenter:cornerRadius:](self, "_roundedRectMaskForMaskDistance:portalCenter:cornerRadius:", v30, v35, v36, v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUIPearlPositioningGuideView roundedRectMaskLayer](self, "roundedRectMaskLayer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_retainAutorelease(v37);
        objc_msgSend(v38, "setPath:", objc_msgSend(v39, "CGPath"));

      }
    }
    self->_lastAnimationTickProgres = v8;
    -[BKUIPearlPositioningGuideView _updateChildrenValuesForDisplayTickProgress:](self, "_updateChildrenValuesForDisplayTickProgress:", v8);
    -[BKUIPearlPositioningGuideView setNeedsDisplay](self, "setNeedsDisplay");
    if (v8 >= 1.0)
    {
      -[BKUIPearlPositioningGuideView animationCompletion](self, "animationCompletion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        -[BKUIPearlPositioningGuideView animationCompletion](self, "animationCompletion");
        v41 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
        -[BKUIPearlPositioningGuideView setAnimationCompletion:](self, "setAnimationCompletion:", 0);
        v41[2](v41, 1);

      }
    }
  }
}

- (void)drawRect:(CGRect)a3
{
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  -[BKUIPearlPositioningGuideView portalCenter](self, "portalCenter", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlPositioningGuideView edgeDistance](self, "edgeDistance");
  v9 = v8;
  -[BKUIPearlPositioningGuideView cornerRadius](self, "cornerRadius");
  v11 = v10;
  -[BKUIPearlPositioningGuideView postCornerLength](self, "postCornerLength");
  v13 = v12;
  -[BKUIPearlPositioningGuideView lineWidth](self, "lineWidth");
  v28 = v5 + v9;
  v29 = v14;
  v15 = v7 + v9 - v11 - v13;
  objc_msgSend(v30, "moveToPoint:", v5 + v9, v15);
  objc_msgSend(v30, "addLineToPoint:", v5 + v9, v13 + v15);
  v27 = v5 + v9 - v11;
  objc_msgSend(v30, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, v13 + v15, v11, 0.0);
  v26 = v27 - v13;
  objc_msgSend(v30, "addLineToPoint:");
  v16 = v5 - v9;
  v25 = v16 + v11 + v13;
  objc_msgSend(v30, "moveToPoint:");
  objc_msgSend(v30, "addLineToPoint:", v16 + v11, v7 + v9);
  objc_msgSend(v30, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16 + v11, v7 + v9 - v11, v11, 1.57079633, 3.14159265);
  objc_msgSend(v30, "addLineToPoint:", v16, v7 + v9 - v11 - v13);
  v17 = v7 - v9;
  v18 = v17 + v11 + v13;
  objc_msgSend(v30, "moveToPoint:", v16, v18);
  objc_msgSend(v30, "addLineToPoint:", v16, v17 + v11);
  objc_msgSend(v30, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16 + v11, v17 + v11, v11, 3.14159265, 4.71238898);
  objc_msgSend(v30, "addLineToPoint:", v25, v17);
  objc_msgSend(v30, "moveToPoint:", v26, v17);
  objc_msgSend(v30, "addLineToPoint:", v27, v17);
  objc_msgSend(v30, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, v17 + v11, v11, 4.71238898, 0.0);
  objc_msgSend(v30, "addLineToPoint:", v28, v18);
  objc_msgSend(v30, "setLineCapStyle:", 1);
  objc_msgSend(v30, "setLineWidth:", v29 + 1.0);
  v19 = (void *)MEMORY[0x1E0CEA478];
  -[BKUIPearlPositioningGuideView lineAlpha](self, "lineAlpha");
  objc_msgSend(v19, "colorWithWhite:alpha:", 0.0, v20 * 0.25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStroke");

  objc_msgSend(v30, "stroke");
  objc_msgSend(v30, "setLineWidth:", v29);
  v22 = (void *)MEMORY[0x1E0CEA478];
  -[BKUIPearlPositioningGuideView lineAlpha](self, "lineAlpha");
  objc_msgSend(v22, "colorWithWhite:alpha:", 1.0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStroke");

  objc_msgSend(v30, "stroke");
}

- (BOOL)needsMaskedNeedsPositionStyleEnrollment
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (double)_maxDistance
{
  _BOOL4 v2;
  double result;

  v2 = -[BKUIPearlPositioningGuideView inSheet](self, "inSheet");
  result = 246.0;
  if (v2)
    return 209.1;
  return result;
}

- (double)_minDistance
{
  _BOOL4 v2;
  double result;

  v2 = -[BKUIPearlPositioningGuideView inSheet](self, "inSheet");
  result = 198.0;
  if (v2)
    return 168.3;
  return result;
}

- (CAShapeLayer)roundedRectMaskLayer
{
  return self->_roundedRectMaskLayer;
}

- (void)setRoundedRectMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_roundedRectMaskLayer, a3);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)edgeDistance
{
  return self->_edgeDistance;
}

- (void)setEdgeDistance:(double)a3
{
  self->_edgeDistance = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)postCornerLength
{
  return self->_postCornerLength;
}

- (void)setPostCornerLength:(double)a3
{
  self->_postCornerLength = a3;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (void)setLineAlpha:(double)a3
{
  self->_lineAlpha = a3;
}

- (double)ringRadius
{
  return self->_ringRadius;
}

- (void)setRingRadius:(double)a3
{
  self->_ringRadius = a3;
}

- (CGPoint)portalCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_portalCenter.x;
  y = self->_portalCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPortalCenter:(CGPoint)a3
{
  self->_portalCenter = a3;
}

- (NSDate)animationStart
{
  return self->_animationStart;
}

- (void)setAnimationStart:(id)a3
{
  objc_storeStrong((id *)&self->_animationStart, a3);
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (int64_t)animationCurve
{
  return self->_animationCurve;
}

- (void)setAnimationCurve:(int64_t)a3
{
  self->_animationCurve = a3;
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (double)startLineWidth
{
  return self->_startLineWidth;
}

- (void)setStartLineWidth:(double)a3
{
  self->_startLineWidth = a3;
}

- (double)startEdgeDistance
{
  return self->_startEdgeDistance;
}

- (void)setStartEdgeDistance:(double)a3
{
  self->_startEdgeDistance = a3;
}

- (double)startCornerRadius
{
  return self->_startCornerRadius;
}

- (void)setStartCornerRadius:(double)a3
{
  self->_startCornerRadius = a3;
}

- (double)startPostCornerLength
{
  return self->_startPostCornerLength;
}

- (void)setStartPostCornerLength:(double)a3
{
  self->_startPostCornerLength = a3;
}

- (double)startLineAlpha
{
  return self->_startLineAlpha;
}

- (void)setStartLineAlpha:(double)a3
{
  self->_startLineAlpha = a3;
}

- (CGPoint)startPortalCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPortalCenter.x;
  y = self->_startPortalCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartPortalCenter:(CGPoint)a3
{
  self->_startPortalCenter = a3;
}

- (double)targetLineWidth
{
  return self->_targetLineWidth;
}

- (void)setTargetLineWidth:(double)a3
{
  self->_targetLineWidth = a3;
}

- (double)targetEdgeDistance
{
  return self->_targetEdgeDistance;
}

- (void)setTargetEdgeDistance:(double)a3
{
  self->_targetEdgeDistance = a3;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (void)setTargetCornerRadius:(double)a3
{
  self->_targetCornerRadius = a3;
}

- (double)targetPostCornerLength
{
  return self->_targetPostCornerLength;
}

- (void)setTargetPostCornerLength:(double)a3
{
  self->_targetPostCornerLength = a3;
}

- (double)targetLineAlpha
{
  return self->_targetLineAlpha;
}

- (void)setTargetLineAlpha:(double)a3
{
  self->_targetLineAlpha = a3;
}

- (CGPoint)targetPortalCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetPortalCenter.x;
  y = self->_targetPortalCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetPortalCenter:(CGPoint)a3
{
  self->_targetPortalCenter = a3;
}

- (double)lastAnimationTickProgres
{
  return self->_lastAnimationTickProgres;
}

- (void)setLastAnimationTickProgres:(double)a3
{
  self->_lastAnimationTickProgres = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_animationStart, 0);
  objc_storeStrong((id *)&self->_roundedRectMaskLayer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
