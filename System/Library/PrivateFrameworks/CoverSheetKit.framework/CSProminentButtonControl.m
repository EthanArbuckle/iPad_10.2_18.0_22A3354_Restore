@implementation CSProminentButtonControl

- (CSProminentButtonControl)initWithFrame:(CGRect)a3
{
  return -[CSProminentButtonControl initWithFrame:luminanceMap:](self, "initWithFrame:luminanceMap:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CSProminentButtonControl)initWithFrame:(CGRect)a3 luminanceMap:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  char *v37;
  objc_super v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CSProminentButtonControl;
  v11 = -[CSProminentButtonControl initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v12);

    objc_msgSend(v11, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v13);

    objc_msgSend(v11, "setOpaque:", 0);
    v14 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v11 + 568) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v11 + 584) = v14;
    objc_msgSend(v11, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v15, v17, v19, v21);
    objc_msgSend(v23, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v24);

    objc_msgSend(v23, "setOpaque:", 0);
    objc_msgSend(v23, "setClipsToBounds:", 1);
    objc_msgSend(v23, "setUserInteractionEnabled:", 0);
    objc_msgSend(v11, "addSubview:", v23);
    v25 = (void *)*((_QWORD *)v11 + 58);
    *((_QWORD *)v11 + 58) = v23;

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithFrame:", v16, v18, v20, v22);
    objc_msgSend(v26, "setAutoresizingMask:", 18);
    objc_msgSend(v26, "setClipsToBounds:", 1);
    objc_msgSend(v26, "setUserInteractionEnabled:", 0);
    objc_msgSend(*((id *)v11 + 58), "addSubview:", v26);
    v27 = (void *)*((_QWORD *)v11 + 59);
    *((_QWORD *)v11 + 59) = v26;

    objc_msgSend(*((id *)v11 + 59), "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.031372549, 0.031372549, 0.031372549, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBackgroundColor:", v29);

    objc_msgSend(*((id *)v11 + 59), "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAlpha:", 0.0);

    objc_storeStrong((id *)v11 + 70, a4);
    objc_msgSend(v11, "_backgroundEffectsWithBrightness:", -0.13);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v11 + 60);
    *((_QWORD *)v11 + 60) = v31;

    objc_msgSend(v11, "_backgroundEffectsWithBrightness:", 0.65);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v11 + 61);
    *((_QWORD *)v11 + 61) = v33;

    v35 = objc_alloc_init(MEMORY[0x1E0DC4078]);
    objc_msgSend(v35, "setDelegate:", v11);
    v36 = (void *)*((_QWORD *)v11 + 62);
    *((_QWORD *)v11 + 62) = v35;

    objc_msgSend(v11, "addInteraction:", *((_QWORD *)v11 + 62));
    objc_msgSend(*((id *)v11 + 62), "setDriverCancelsTouchesInView:", 0);
    v37 = v11;
  }

  return (CSProminentButtonControl *)v11;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[CSProminentButtonControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGlyphView:(id)a3
{
  CSProminentButtonControlEmbeddedView *v5;
  id *p_glyphView;
  CSProminentButtonControlEmbeddedView *glyphView;
  id v8;
  CSProminentButtonControlEmbeddedView *v9;

  v5 = (CSProminentButtonControlEmbeddedView *)a3;
  p_glyphView = (id *)&self->_glyphView;
  glyphView = self->_glyphView;
  v9 = v5;
  if (glyphView != v5)
  {
    -[CSProminentButtonControlEmbeddedView removeFromSuperview](glyphView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_glyphView, a3);
    v8 = *p_glyphView;
    -[UIView bounds](self->_containerView, "bounds");
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(*p_glyphView, "setAutoresizingMask:", 18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*p_glyphView, "setSelected:", -[CSProminentButtonControl isSelected](self, "isSelected"));
    if (*p_glyphView)
    {
      -[UIView addSubview:](self->_containerView, "addSubview:");
      -[CSProminentButtonControl setNeedsLayout](self, "setNeedsLayout");
      -[CSProminentButtonControl layoutIfNeeded](self, "layoutIfNeeded");
    }
  }

}

- (void)_updateStyle
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[CSProminentButtonControl isSelected](self, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v6;
  }
  v4 = v3;
  objc_msgSend(v3, "colorWithAlphaComponent:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSProminentButtonControl setTintColor:](self, "setTintColor:", v5);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CSProminentButtonControl isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CSProminentButtonControl;
    -[CSProminentButtonControl setSelected:](&v5, sel_setSelected_, v3);
    -[CSProminentButtonControl setNeedsLayout](self, "setNeedsLayout");
    -[CSProminentButtonControl _updateStyle](self, "_updateStyle");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CSProminentButtonControlEmbeddedView setSelected:](self->_glyphView, "setSelected:", -[CSProminentButtonControl isSelected](self, "isSelected"));
    -[CSProminentButtonControl layoutIfNeededAnimated](self, "layoutIfNeededAnimated");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float64x2_t v3;
  double v4;
  CGSize result;

  v3 = vaddq_f64(vaddq_f64(*(float64x2_t *)&self->_edgeInsets.top, *(float64x2_t *)&self->_edgeInsets.bottom), (float64x2_t)vdupq_n_s64(0x4049000000000000uLL));
  v4 = v3.f64[1];
  result.height = v3.f64[0];
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Width;
  double Height;
  double MidX;
  double MidY;
  uint64_t v23;
  int *v24;
  void *v25;
  double v26;
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
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  UIView *containerView;
  double v49;
  double v50;
  double v51;
  double v52;
  CGAffineTransform v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v54.receiver = self;
  v54.super_class = (Class)CSProminentButtonControl;
  -[CSProminentButtonControl layoutSubviews](&v54, sel_layoutSubviews);
  -[CSProminentButtonControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSProminentButtonControl edgeInsets](self, "edgeInsets");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  v55.origin.x = v12;
  v55.origin.y = v14;
  v55.size.width = v16;
  v55.size.height = v18;
  Width = CGRectGetWidth(v55);
  v56.origin.x = v12;
  v56.origin.y = v14;
  v56.size.width = v16;
  v56.size.height = v18;
  Height = CGRectGetHeight(v56);
  -[CSProminentButtonControl bounds](self, "bounds");
  MidX = CGRectGetMidX(v57);
  -[CSProminentButtonControl bounds](self, "bounds");
  MidY = CGRectGetMidY(v58);
  -[UIView setBounds:](self->_containerView, "setBounds:", 0.0, 0.0, Width, Height);
  -[UIView setCenter:](self->_containerView, "setCenter:", MidX, MidY);
  v23 = -[CSProminentButtonControl isSelected](self, "isSelected");
  v24 = &OBJC_IVAR___CSProminentButtonControl__backgroundEffects;
  if ((_DWORD)v23)
    v24 = &OBJC_IVAR___CSProminentButtonControl__selectedBackgroundEffects;
  -[UIVisualEffectView setBackgroundEffects:](self->_backgroundEffectView, "setBackgroundEffects:", *(Class *)((char *)&self->super.super.super.super.isa + *v24));
  UIRectGetCenter();
  -[CSProminentButtonControl traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "displayScale");
  UIRectCenteredAboutPointScale();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  -[UIVisualEffectView setFrame:](self->_backgroundEffectView, "setFrame:", v27, v29, v31, v33);
  -[UIVisualEffectView frame](self->_backgroundEffectView, "frame");
  if (v34 >= v35)
    v36 = v35;
  else
    v36 = v34;
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_backgroundEffectView, "_setContinuousCornerRadius:", v36 * 0.5);
  -[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAlpha:", self->_highlightProgress * 0.5 + 0.0);

  -[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidden:", v23);

  -[CSProminentButtonControlEmbeddedView sizeThatFits:](self->_glyphView, "sizeThatFits:", v16, v18);
  UIRectGetCenter();
  -[CSProminentButtonControl traitCollection](self, "traitCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "displayScale");
  UIRectCenteredAboutPointScale();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;

  -[CSProminentButtonControlEmbeddedView setFrame:](self->_glyphView, "setFrame:", v41, v43, v45, v47);
  containerView = self->_containerView;
  CGAffineTransformMakeScale(&v53, self->_highlightProgress * 0.6 + 1.0, self->_highlightProgress * 0.6 + 1.0);
  -[UIView setTransform:](containerView, "setTransform:", &v53);
  -[UIView bounds](self->_containerView, "bounds");
  v50 = v49;
  -[UIView bounds](self->_containerView, "bounds");
  if (v50 >= v51)
    v52 = v51;
  else
    v52 = v50;
  -[UIView _setContinuousCornerRadius:](self->_containerView, "_setContinuousCornerRadius:", v52 * 0.5);
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  _UIClickInteraction *v4;
  BOOL v5;

  v4 = (_UIClickInteraction *)a3;
  if (self->_clickInteraction == v4 && !self->_clickSuppressed)
  {
    v5 = 1;
    self->_interactive = 1;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    -[CSProminentButtonControl setNeedsLayout](self, "setNeedsLayout");
    -[CSProminentButtonControl layoutIfNeededAnimated](self, "layoutIfNeededAnimated");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)clickInteractionDidClickUp:(id)a3
{
  if (self->_clickInteraction == a3)
  {
    -[CSProminentButtonControl setSelected:](self, "setSelected:", -[CSProminentButtonControl isSelected](self, "isSelected") ^ 1);
    -[CSProminentButtonControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);
    if (self->_interactive)
      self->_didActivateDuringInteraction = 1;
  }
}

- (void)clickInteraction:(id)a3 didObserveForce:(double)maxForceDuringInteraction
{
  if (self->_interactive)
  {
    if (self->_maxForceDuringInteraction >= maxForceDuringInteraction)
      maxForceDuringInteraction = self->_maxForceDuringInteraction;
    self->_maxForceDuringInteraction = maxForceDuringInteraction;
  }
}

- (void)clickInteractionDidEnd:(id)a3
{
  _QWORD v4[5];

  if (self->_clickInteraction == a3)
  {
    self->_interactive = 0;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    -[CSProminentButtonControl setNeedsLayout](self, "setNeedsLayout");
    -[CSProminentButtonControl layoutIfNeededAnimated](self, "layoutIfNeededAnimated");
    if (-[CSProminentButtonControl shouldAnimateBackgroundDuringInteraction](self, "shouldAnimateBackgroundDuringInteraction"))
    {
      -[UIVisualEffectView setAlpha:](self->_backgroundEffectView, "setAlpha:", 1.0);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __51__CSProminentButtonControl_clickInteractionDidEnd___block_invoke;
      v4[3] = &unk_1E55EAEE0;
      v4[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v4, 2.0);
    }
  }
}

uint64_t __51__CSProminentButtonControl_clickInteractionDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 0.0);
}

- (unint64_t)_clickInteractionDefaultDriverType:(id)a3
{
  void *v3;
  uint64_t v4;

  -[CSProminentButtonControl traitCollection](self, "traitCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceTouchCapability");

  if (v4 == 2)
    return 4;
  else
    return 3;
}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DC42B8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CSProminentButtonControl_highlightEffectForClickInteraction___block_invoke;
  v8[3] = &unk_1E55EAF08;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_msgSend(v5, "initWithProgressBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __63__CSProminentButtonControl_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "progress");
  v5 = v4;
  v6 = objc_msgSend(v3, "ended");

  objc_msgSend(WeakRetained, "_animateEffectUpdateWithProgress:ended:", v6, v5);
}

- (void)_animateEffectUpdateWithProgress:(double)a3 ended:(BOOL)a4
{
  double v4;
  _QWORD v5[6];

  v4 = a3 + a3 + 18.0;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke;
  v5[3] = &unk_1E55EAF30;
  if (a4)
    v4 = v4 + 4.0;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v5, 0, 500.0, v4);
}

uint64_t __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[6];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke_2;
  v4[3] = &unk_1E55EAF30;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __67__CSProminentButtonControl__animateEffectUpdateWithProgress_ended___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 529))
  {
    objc_msgSend(*(id *)(v2 + 472), "setAlpha:", *(double *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(double *)(a1 + 40);
  if (v3 > 1.2)
    v3 = 1.2;
  *(double *)(v2 + 520) = v3;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setShouldAnimateBackgroundDuringInteraction:(BOOL)a3
{
  UIVisualEffectView *backgroundEffectView;
  double v4;

  if (self->_shouldAnimateBackgroundDuringInteraction != a3)
  {
    self->_shouldAnimateBackgroundDuringInteraction = a3;
    backgroundEffectView = self->_backgroundEffectView;
    v4 = 1.0;
    if (a3)
      v4 = 0.0;
    -[UIVisualEffectView setAlpha:](backgroundEffectView, "setAlpha:", v4);
  }
}

- (void)layoutIfNeededAnimated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke;
  v2[3] = &unk_1E55EAEE0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v2, 0, 0.0, 0.0);
}

uint64_t __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke_2;
  v4[3] = &unk_1E55EAEE0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __50__CSProminentButtonControl_layoutIfNeededAnimated__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)_backgroundEffectsWithBrightness:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3F50];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectCompositingColor:withMode:alpha:", v7, 4, 0.12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v9 = (void *)MEMORY[0x1E0DC3660];
  -[CSProminentButtonControl luminanceMap](self, "luminanceMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorEffectLuminanceMap:blendingAmount:", v10, 0.7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 2.8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectBrightness:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setBackgroundEffectViewGroupName:(id)a3
{
  -[UIVisualEffectView _setGroupName:](self->_backgroundEffectView, "_setGroupName:", a3);
}

- (UIImage)luminanceMap
{
  UIImage *luminanceMap;

  luminanceMap = self->_luminanceMap;
  if (luminanceMap)
    return luminanceMap;
  -[CSProminentButtonControl _defaultLuminanceMap](self, "_defaultLuminanceMap");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultLuminanceMap
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UICoverSheetButtonLuminanceMap"));
}

- (BOOL)isClickSuppressed
{
  return self->_clickSuppressed;
}

- (void)setClickSuppressed:(BOOL)a3
{
  self->_clickSuppressed = a3;
}

- (CSProminentButtonControlEmbeddedView)glyphView
{
  return self->_glyphView;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)backgroundEffectViewGroupName
{
  return self->_backgroundEffectViewGroupName;
}

- (NSString)statisticsIdentifier
{
  return self->_statisticsIdentifier;
}

- (void)setStatisticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setLuminanceMap:(id)a3
{
  objc_storeStrong((id *)&self->_luminanceMap, a3);
}

- (BOOL)shouldAnimateBackgroundDuringInteraction
{
  return self->_shouldAnimateBackgroundDuringInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminanceMap, 0);
  objc_storeStrong((id *)&self->_statisticsIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundEffectViewGroupName, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_clickInteraction, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
