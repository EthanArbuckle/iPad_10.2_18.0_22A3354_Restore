@implementation CAMGridView

- (CAMGridView)initWithFrame:(CGRect)a3
{
  CAMGridView *v3;
  CAMGridView *v4;
  CEKAdditiveAnimator *v5;
  CEKAdditiveAnimator *animator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMGridView;
  v3 = -[CAMGridView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMGridView setOpaque:](v3, "setOpaque:", 0);
    -[CAMGridView setContentMode:](v4, "setContentMode:", 3);
    v5 = (CEKAdditiveAnimator *)objc_alloc_init(MEMORY[0x1E0D0D000]);
    animator = v4->__animator;
    v4->__animator = v5;

    -[CEKAdditiveAnimator setDelegate:](v4->__animator, "setDelegate:", v4);
    -[CEKAdditiveAnimator setValue:forKey:](v4->__animator, "setValue:forKey:", CFSTR("CAMAnimatorGridHorizontalGapKey"), 0.0);
    -[CEKAdditiveAnimator setValue:forKey:](v4->__animator, "setValue:forKey:", CFSTR("CAMAnimatorGridVerticalGapKey"), 0.0);
  }
  return v4;
}

- (void)setLevelViewModel:(id)a3
{
  CAMLevelViewModel *v5;
  CAMLevelViewModel *levelViewModel;
  CAMLevelViewModel *v7;

  v5 = (CAMLevelViewModel *)a3;
  levelViewModel = self->_levelViewModel;
  v7 = v5;
  if (levelViewModel != v5)
  {
    -[CAMObservable unregisterChangeObserver:context:](levelViewModel, "unregisterChangeObserver:context:", self, 0);
    objc_storeStrong((id *)&self->_levelViewModel, a3);
    -[CAMObservable registerChangeObserver:context:](self->_levelViewModel, "registerChangeObserver:context:", self, 0);
    -[CAMGridView _setAnimatorGridOffsetForViewModel:animated:](self, "_setAnimatorGridOffsetForViewModel:animated:", v7, 0);
  }

}

- (void)_getDeltasBetweenLines:(double *)a3 widthDelta:(double *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[CAMGridView bounds](self, "bounds");
  UIRoundToViewScale();
  v7 = v6;
  UIRoundToViewScale();
  *(_QWORD *)a3 = v7;
  *(_QWORD *)a4 = v8;
}

- (void)_setAnimatorGridOffsetForViewModel:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v4 = a4;
  v6 = a3;
  -[CAMGridView _animator](self, "_animator");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  HIDWORD(v10) = 1069757235;
  if (v4)
    v11 = 0.15;
  else
    v11 = 0.0;
  if (v4)
  {
    LODWORD(v10) = 1045220557;
    LODWORD(v8) = 1053609165;
    LODWORD(v9) = 1.0;
    LODWORD(v7) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "currentIndicatorRotationAngle");
  v14 = v13;
  objc_msgSend(v6, "currentIndicatorAlpha");
  if (v15 > 0.0 && v14 == 0.0)
    v17 = 5.0;
  else
    v17 = 0.0;
  v18 = objc_msgSend(v6, "currentIndicatorMode");

  if (v18 == 2)
    v19 = v17;
  else
    v19 = 0.0;
  if (v18 == 3)
    v20 = v17;
  else
    v20 = 0.0;
  if (v18 == 3)
    v21 = 0.0;
  else
    v21 = v19;
  objc_msgSend(v22, "setValue:forKey:duration:timingCurve:", CFSTR("CAMAnimatorGridHorizontalGapKey"), v12, v20, v11);
  objc_msgSend(v22, "setValue:forKey:duration:timingCurve:", CFSTR("CAMAnimatorGridVerticalGapKey"), v12, v21, v11);
  if (!v4)
    -[CAMGridView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_drawLinesWithInset:(float)a3
{
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
  char v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[CAMGridView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v41 = 0;
  v42 = 0;
  -[CAMGridView _getDeltasBetweenLines:widthDelta:](self, "_getDeltasBetweenLines:widthDelta:", &v42, &v41);
  v38 = v12;
  v39 = v10;
  v36 = v8;
  v40 = v8 + 0.0;
  v13 = a3;
  v37 = v6;
  v14 = v6 + 0.0;
  v15 = 1;
  do
  {
    v16 = v15;
    UIRoundToViewScale();
    v18 = v17;
    UIRoundToViewScale();
    v20 = v19;
    -[CAMGridView _animator](self, "_animator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueForKey:", CFSTR("CAMAnimatorGridVerticalGapKey"));
    v23 = v22;

    -[CAMGridView _animator](self, "_animator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForKey:", CFSTR("CAMAnimatorGridHorizontalGapKey"));
    v26 = v25;

    v27 = v40;
    v28 = v40;
    v29 = 0.0;
    if (v23 != 0.0)
    {
      UIRoundToViewScale();
      v27 = v40;
      v28 = v36 + v29;
    }
    v30 = 0.0;
    v31 = v20 + 0.0;
    v32 = v38 - (v29 + 0.0);
    v43.size.width = 1.0;
    v43.origin.x = v31;
    v43.origin.y = v27;
    v43.size.height = v32;
    v44 = CGRectInset(v43, v13, 0.0);
    UIRectFill(v44);
    v45.size.width = 1.0;
    v45.origin.x = v31;
    v45.origin.y = v28;
    v45.size.height = v32;
    v46 = CGRectInset(v45, v13, 0.0);
    UIRectFill(v46);
    v33 = v14;
    if (v26 != 0.0)
    {
      UIRoundToViewScale();
      v30 = v34;
      v33 = v37 + v34;
    }
    v35 = v39 - (v30 + 0.0);
    v47.size.height = 1.0;
    v47.origin.x = v14;
    v47.origin.y = v18 + 0.0;
    v47.size.width = v35;
    v48 = CGRectInset(v47, 0.0, v13);
    UIRectFill(v48);
    v49.size.height = 1.0;
    v49.origin.x = v33;
    v49.origin.y = v18 + 0.0;
    v49.size.width = v35;
    v50 = CGRectInset(v49, 0.0, v13);
    UIRectFill(v50);
    v15 = 0;
  }
  while ((v16 & 1) != 0);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  double v6;
  void *v7;
  double v8;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.150000006);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");

  v6 = CAMPixelWidthForView(self);
  *(float *)&v6 = v6;
  *(float *)&v6 = -*(float *)&v6;
  -[CAMGridView _drawLinesWithInset:](self, "_drawLinesWithInset:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.400000006);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set");

  LODWORD(v8) = 0;
  -[CAMGridView _drawLinesWithInset:](self, "_drawLinesWithInset:", v8);
  CGContextEndTransparencyLayer(CurrentContext);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CAMGridView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMGridView;
  -[CAMGridView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CAMGridView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  if (!a5 && (a4 & 0x15) != 0)
    -[CAMGridView _setAnimatorGridOffsetForViewModel:animated:](self, "_setAnimatorGridOffsetForViewModel:animated:", a3, 1);
}

- (CAMLevelViewModel)levelViewModel
{
  return self->_levelViewModel;
}

- (CEKAdditiveAnimator)_animator
{
  return self->__animator;
}

- (void)set_animator:(id)a3
{
  objc_storeStrong((id *)&self->__animator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->_levelViewModel, 0);
}

@end
