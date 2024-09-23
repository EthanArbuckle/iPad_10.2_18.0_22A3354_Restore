@implementation CCUIBaseSliderView

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CCUIBaseSliderView isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)CCUIBaseSliderView;
  -[CCUIBaseSliderView setEnabled:](&v6, sel_setEnabled_, v3);
  if (v5 != v3)
  {
    -[CCUIBaseSliderView _updateInteractionEnabled](self, "_updateInteractionEnabled");
    -[CCUIBaseSliderView _updateHasInoperativeAppearance](self, "_updateHasInoperativeAppearance");
  }
}

- (void)_updateInteractionEnabled
{
  uint64_t v3;

  if (-[CCUIBaseSliderView isEnabled](self, "isEnabled"))
    v3 = -[CCUIBaseSliderView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  else
    v3 = 0;
  -[_UIFluidSliderInteraction setUserInteractionEnabled:](self->_interaction, "setUserInteractionEnabled:", v3);
}

- (void)_updateHasInoperativeAppearance
{
  int v3;
  _BOOL4 v4;

  if (-[CCUIBaseSliderView isInoperative](self, "isInoperative"))
    v3 = 1;
  else
    v3 = -[CCUIBaseSliderView isEnabled](self, "isEnabled") ^ 1;
  v4 = -[CCUIBaseSliderView isValueVisible](self, "isValueVisible");
  if (self->_hasInoperativeAppearance != (v3 & v4))
  {
    self->_hasInoperativeAppearance = v3 & v4;
    -[CCUIBaseSliderView applyInoperativeAppearance:](self, "applyInoperativeAppearance:");
  }
}

- (BOOL)isValueVisible
{
  return self->_valueVisible;
}

- (BOOL)isInoperative
{
  return self->_inoperative;
}

- (CCUIBaseSliderView)initWithFrame:(CGRect)a3
{
  CCUIBaseSliderView *v3;
  CCUIBaseSliderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _CCUIBaseSliderContentView *v13;
  _CCUIBaseSliderContentView *v14;
  _CCUIBaseSliderContentView *v15;
  _CCUIBaseSliderContentView *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _UIFluidSliderInteraction *interaction;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CCUIBaseSliderView;
  v3 = -[CCUIBaseSliderView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_glyphVisible = 1;
    v3->_glyphScale = 1.0;
    objc_storeStrong((id *)&v3->_glyphState, CFSTR("*"));
    v4->_valueVisible = 1;
    v4->_elasticContentStretchAmount = -1.0;
    -[CCUIBaseSliderView bounds](v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v5, v7, v9, v11);
    -[_CCUIBaseSliderContentView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    -[_CCUIBaseSliderContentView setContainingSliderView:](v13, "setContainingSliderView:", v4);
    objc_storeStrong((id *)&v4->_elasticBackgroundContentView, v13);
    -[CCUIBaseSliderView addSubview:](v4, "addSubview:", v13);
    v14 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v6, v8, v10, v12);
    -[_CCUIBaseSliderContentView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
    -[_CCUIBaseSliderContentView setContainingSliderView:](v14, "setContainingSliderView:", v4);
    objc_storeStrong((id *)&v4->_elasticContentView, v14);
    -[CCUIBaseSliderView addSubview:](v4, "addSubview:", v14);
    v15 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v6, v8, v10, v12);
    -[_CCUIBaseSliderContentView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
    -[_CCUIBaseSliderContentView setContainingSliderView:](v15, "setContainingSliderView:", v4);
    objc_storeStrong((id *)&v4->_elasticContentBoundaryView, v15);
    -[_CCUIBaseSliderContentView addSubview:](v14, "addSubview:", v15);
    v16 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v6, v8, v10, v12);
    -[_CCUIBaseSliderContentView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 0);
    -[_CCUIBaseSliderContentView setContainingSliderView:](v16, "setContainingSliderView:", v4);
    objc_storeStrong((id *)&v4->_glyphContainerView, v16);
    -[_CCUIBaseSliderContentView addSubview:](v15, "addSubview:", v16);
    -[CCUIBaseSliderView setUsesBuiltInBackgroundView:](v4, "setUsesBuiltInBackgroundView:", 1);
    objc_msgSend(MEMORY[0x1E0DC4178], "configurationWithTrackSize:", v10, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPreferredInputMethods:", 1);
    objc_initWeak(&location, v4);
    v18 = objc_alloc(MEMORY[0x1E0DC4170]);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __36__CCUIBaseSliderView_initWithFrame___block_invoke;
    v25 = &unk_1E8E20BB8;
    objc_copyWeak(&v26, &location);
    v19 = objc_msgSend(v18, "initWithConfiguration:handler:", v17, &v22);
    interaction = v4->_interaction;
    v4->_interaction = (_UIFluidSliderInteraction *)v19;

    -[CCUIBaseSliderView addInteraction:](v4, "addInteraction:", v4->_interaction, v22, v23, v24, v25);
    -[CCUIBaseSliderView _configurePanGestureRecognizer](v4, "_configurePanGestureRecognizer");
    -[CCUIBaseSliderView _configureButtonInteraction](v4, "_configureButtonInteraction");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __36__CCUIBaseSliderView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleFluidSliderInteractionUpdate:", v3);

}

- (void)setValue:(float)a3
{
  -[CCUIBaseSliderView setValue:animated:](self, "setValue:animated:", 1);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  float v4;
  _BOOL4 v5;
  void *v7;
  _QWORD v8[5];
  float v9;
  _QWORD v10[5];
  float v11;

  v4 = fmax(fmin(a3, 1.0), 0.0);
  if (self->_value != v4)
  {
    v5 = a4;
    self->_value = v4;
    -[_UIFluidSliderInteraction value](self->_interaction, "value");
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      if (v5)
      {
        -[CCUIBaseSliderView window](self, "window");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __40__CCUIBaseSliderView_setValue_animated___block_invoke;
        v10[3] = &unk_1E8E20BE0;
        v10[4] = self;
        v11 = v4;
        +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:actions:](CCUIContentModuleContext, "performWithoutAnimationWhileHiddenInWindow:actions:", v7, v10);

      }
      else
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __40__CCUIBaseSliderView_setValue_animated___block_invoke_2;
        v8[3] = &unk_1E8E20BE0;
        v8[4] = self;
        v9 = v4;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
      }
    }
  }
}

uint64_t __40__CCUIBaseSliderView_setValue_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setValue:", *(float *)(a1 + 40));
}

uint64_t __40__CCUIBaseSliderView_setValue_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setValue:", *(float *)(a1 + 40));
}

- (float)presentationValue
{
  double v2;
  float result;

  if (self->_lastInteractionUpdate)
  {
    -[_UIFluidSliderInteractionUpdate value](self->_lastInteractionUpdate, "value");
    return v2;
  }
  else
  {
    -[CCUIBaseSliderView value](self, "value");
  }
  return result;
}

- (void)setUsesBuiltInBackgroundView:(BOOL)a3
{
  _BOOL4 v3;
  UIView *backgroundView;
  UIView *v6;
  void *v7;
  void *v8;
  UIView *v9;

  if (self->_usesBuiltInBackgroundView != a3)
  {
    v3 = a3;
    self->_usesBuiltInBackgroundView = a3;
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    if (v3)
    {
      -[CCUIBaseSliderView createBackgroundView](self, "createBackgroundView");
      v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[CCUIBaseSliderView elasticContentBoundaryView](self, "elasticContentBoundaryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSubview:atIndex:", v6, 0);

      -[CCUIBaseSliderView elasticContentBoundaryView](self, "elasticContentBoundaryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      -[UIView setFrame:](v6, "setFrame:");

      -[CCUIBaseSliderView continuousSliderCornerRadius](self, "continuousSliderCornerRadius");
      -[UIView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:");
      v9 = self->_backgroundView;
      self->_backgroundView = v6;

      -[CCUIBaseSliderView _updateBackgroundViewAppearance](self, "_updateBackgroundViewAppearance");
    }
  }
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  self->_continuousSliderCornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
}

- (void)setGlyphVisible:(BOOL)a3
{
  if (self->_glyphVisible != a3)
  {
    self->_glyphVisible = a3;
    -[CCUIBaseSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGlyphScale:(double)a3
{
  if (self->_glyphScale != a3)
  {
    self->_glyphScale = a3;
    -[CCUIBaseSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGlyphTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphTintColor, a3);
    -[CCUIBaseSliderView _updateGlyphTinting](self, "_updateGlyphTinting");
    -[CCUIBaseSliderView _configureGroupRenderingMode](self, "_configureGroupRenderingMode");
  }

}

- (void)setInoperative:(BOOL)a3
{
  if (self->_inoperative != a3)
  {
    self->_inoperative = a3;
    -[_UIFluidSliderInteraction setLocked:](self->_interaction, "setLocked:");
    -[CCUIBaseSliderView _updateHasInoperativeAppearance](self, "_updateHasInoperativeAppearance");
  }
}

- (void)setValueVisible:(BOOL)a3
{
  if (self->_valueVisible != a3)
  {
    self->_valueVisible = a3;
    -[CCUIBaseSliderView _updateHasInoperativeAppearance](self, "_updateHasInoperativeAppearance");
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIBaseSliderView;
  -[CCUIBaseSliderView setUserInteractionEnabled:](&v4, sel_setUserInteractionEnabled_, a3);
  -[CCUIBaseSliderView _updateInteractionEnabled](self, "_updateInteractionEnabled");
}

- (void)didMoveToWindow
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIBaseSliderView;
  -[CCUIBaseSliderView didMoveToWindow](&v7, sel_didMoveToWindow);
  if (-[CCUIBaseSliderView _isInAWindow](self, "_isInAWindow"))
  {
    -[CCUIBaseSliderView _effectiveStretchAmount](self, "_effectiveStretchAmount");
    v4 = v3;
    -[_UIFluidSliderInteraction configuration](self->_interaction, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v6, "setStretchAmount:", v4);
    -[_UIFluidSliderInteraction setConfiguration:](self->_interaction, "setConfiguration:", v6);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(_QWORD);
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  UIImageView *glyphImageView;
  double glyphScale;
  __int128 v27;
  UIImageView *v28;
  CCUIPunchOutCompensating *compensatingGlyphView;
  void *v30;
  CCUIPunchOutCompensating *v31;
  CCUIPunchOutCompensating *v32;
  CCUIPunchOutCompensating *v33;
  CCUICAPackageView *glyphPackageView;
  CCUIPunchOutCompensating *v35;
  void *v36;
  CCUIPunchOutCompensating *v37;
  CCUIPunchOutCompensating *v38;
  CCUIPunchOutCompensating *v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  _QWORD aBlock[5];
  id v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CCUIBaseSliderView;
  -[CCUIBaseSliderView layoutSubviews](&v44, sel_layoutSubviews);
  -[CCUIBaseSliderView bounds](self, "bounds");
  if (self->_sizeForValidConfiguration.width == v3 && self->_sizeForValidConfiguration.height == v4)
  {
    v13 = 0;
  }
  else
  {
    v6 = v3;
    v7 = v4;
    self->_sizeForValidConfiguration.width = v3;
    self->_sizeForValidConfiguration.height = v4;
    -[CCUIBaseSliderView _effectiveStretchAmount](self, "_effectiveStretchAmount");
    v9 = v8;
    -[_UIFluidSliderInteraction configuration](self->_interaction, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackSize");
    v13 = v7 != v12 || v6 != v11;

    -[_UIFluidSliderInteraction configuration](self->_interaction, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithTrackSize:", v6, v7);

    objc_msgSend(v15, "setStretchAmount:", v9);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__CCUIBaseSliderView_layoutSubviews__block_invoke;
    aBlock[3] = &unk_1E8E20708;
    aBlock[4] = self;
    v16 = v15;
    v43 = v16;
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
      v17[2](v17);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v17);

  }
  -[CCUIBaseSliderView bounds](self, "bounds");
  UIRectGetCenter();
  v19 = v18;
  v21 = v20;
  -[CCUIBaseSliderView elasticBackgroundContentView](self, "elasticBackgroundContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v19, v21);
  objc_msgSend(v23, "setCenter:", v19, v21);
  if (self->_glyphVisible)
    v24 = 1.0;
  else
    v24 = 0.0;
  glyphImageView = self->_glyphImageView;
  if (glyphImageView)
  {
    -[UIImageView setAlpha:](glyphImageView, "setAlpha:", v24);
    memset(&v41, 0, sizeof(v41));
    glyphScale = self->_glyphScale;
    if (fabs(glyphScale + -1.0) >= 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v41, glyphScale, self->_glyphScale);
    }
    else
    {
      v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v41.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v41.c = v27;
      *(_OWORD *)&v41.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    v28 = self->_glyphImageView;
    v40 = v41;
    -[UIImageView setTransform:](v28, "setTransform:", &v40);
    compensatingGlyphView = self->_compensatingGlyphView;
    objc_opt_self();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = compensatingGlyphView;
    if (v30)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
    }
    else
    {
      v32 = 0;
    }
    v33 = v32;

    v40 = v41;
    -[CCUIPunchOutCompensating setTransform:](v33, "setTransform:", &v40);

  }
  glyphPackageView = self->_glyphPackageView;
  if (glyphPackageView)
  {
    -[CCUICAPackageView setAlpha:](glyphPackageView, "setAlpha:", v24);
    -[CCUICAPackageView setScale:](self->_glyphPackageView, "setScale:", self->_glyphScale);
    v35 = self->_compensatingGlyphView;
    objc_opt_self();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    if (v36)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
    }
    else
    {
      v38 = 0;
    }
    v39 = v38;

    -[CCUIPunchOutCompensating setScale:](v39, "setScale:", self->_glyphScale);
  }
  -[CCUIPunchOutCompensating ccui_setCompensationAlpha:](self->_compensatingGlyphView, "ccui_setCompensationAlpha:", v24);
  if (!v13)
    -[CCUIBaseSliderView layoutElasticContentViews](self, "layoutElasticContentViews");

}

uint64_t __36__CCUIBaseSliderView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)_layoutElasticContentContainers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  _UIFluidSliderInteractionUpdate *lastInteractionUpdate;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _UIFluidSliderInteractionUpdate *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  -[CCUIBaseSliderView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v23 = *MEMORY[0x1E0C9BAA8];
  v24 = v9;
  v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  lastInteractionUpdate = self->_lastInteractionUpdate;
  if (lastInteractionUpdate)
  {
    -[_UIFluidSliderInteractionUpdate trackBounds](lastInteractionUpdate, "trackBounds");
    v6 = v11;
    v8 = v12;
    v14 = v13;
    v16 = v15;
    v17 = self->_lastInteractionUpdate;
    if (v17)
    {
      -[_UIFluidSliderInteractionUpdate trackTransform](v17, "trackTransform");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
    }
    v23 = v20;
    v24 = v21;
    v25 = v22;
  }
  else
  {
    v14 = v3;
    v16 = v4;
  }
  -[CCUIBaseSliderView elasticBackgroundContentView](self, "elasticBackgroundContentView", v20, v21, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBounds:", v6, v8, v14, v16);
  v20 = v23;
  v21 = v24;
  v22 = v25;
  objc_msgSend(v18, "setTransform:", &v20);
  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBounds:", v6, v8, v14, v16);
  v20 = v23;
  v21 = v24;
  v22 = v25;
  objc_msgSend(v19, "setTransform:", &v20);

}

- (void)layoutElasticContentViews
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
  double v14;
  double v15;

  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setFrame:](self->_elasticContentBoundaryView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_glyphContainerView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  -[CCUIBaseSliderView glyphCenter](self, "glyphCenter");
  v13 = v12;
  v15 = v14;
  -[UIImageView setCenter:](self->_glyphImageView, "setCenter:");
  -[CCUICAPackageView setCenter:](self->_glyphPackageView, "setCenter:", v13, v15);
  -[CCUIPunchOutCompensating setCenter:](self->_compensatingGlyphView, "setCenter:", v13, v15);
}

- (BOOL)isGroupRenderingRequired
{
  void *v3;
  BOOL v4;

  if (!-[CCUIBaseSliderView _usesVibrantGlyphStyling](self, "_usesVibrantGlyphStyling"))
    return 0;
  -[CCUIBaseSliderView punchOutRenderingViews](self, "punchOutRenderingViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (NSArray)punchOutRenderingViews
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", self->_activeGlyphView, 0);
}

- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3
{
  self->_expanded = a3;
}

- (NSArray)topLevelBlockingGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!-[CCUIBaseSliderView isInteractiveWhenUnexpanded](self, "isInteractiveWhenUnexpanded"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  -[CCUIBaseSliderView _panGestureRecognizer](self, "_panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIBaseSliderView _additionalTopLevelBlockingGestureRecognizers](self, "_additionalTopLevelBlockingGestureRecognizers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)setShouldIncludeVolumeButtonsInput:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;

  if (self->_shouldIncludeVolumeButtonsInput != a3)
  {
    v3 = a3;
    self->_shouldIncludeVolumeButtonsInput = a3;
    -[_UIFluidSliderInteraction configuration](self->_interaction, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v5, "copy");

    v6 = objc_msgSend(v8, "preferredInputMethods") & 0xFFFFFFFFFFFFFFFDLL;
    v7 = 2;
    if (!v3)
      v7 = 0;
    objc_msgSend(v8, "setPreferredInputMethods:", v6 | v7);
    -[_UIFluidSliderInteraction setConfiguration:](self->_interaction, "setConfiguration:", v8);
    -[CCUIBaseSliderView _configurePanGestureRecognizer](self, "_configurePanGestureRecognizer");
    -[CCUIBaseSliderView _configureButtonInteraction](self, "_configureButtonInteraction");

  }
}

- (void)setElasticContentStretchAmount:(double)a3
{
  if (self->_elasticContentStretchAmount != a3)
  {
    self->_elasticContentStretchAmount = a3;
    __asm { FMOV            V0.2D, #-1.0 }
    self->_sizeForValidConfiguration = _Q0;
    -[CCUIBaseSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)presentationLayoutValue
{
  _UIFluidSliderInteractionUpdate *v3;
  _UIFluidSliderInteractionUpdate *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;

  v3 = self->_lastInteractionUpdate;
  v4 = v3;
  if (v3
    && (-[_UIFluidSliderInteractionUpdate trackBounds](v3, "trackBounds"),
        v6 = v5,
        v8 = v7,
        -[_UIFluidSliderInteractionUpdate barFrame](v4, "barFrame"),
        v6 > 0.0)
    && v8 > 0.0)
  {
    if (v6 <= v8)
      v11 = v10 / v8;
    else
      v11 = v9 / v6;
  }
  else
  {
    -[CCUIBaseSliderView presentationValue](self, "presentationValue");
    v11 = v12;
  }

  return v11;
}

- (BOOL)shouldIntegralizeContentLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;

  -[CCUIBaseSliderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v10 = v6 == v9 && v4 == v8;

  return v10;
}

- (BOOL)shouldIntegralizeValueLayout
{
  _BOOL4 v3;

  v3 = -[CCUIBaseSliderView shouldIntegralizeContentLayout](self, "shouldIntegralizeContentLayout");
  if (v3)
    LOBYTE(v3) = -[CCUIBaseSliderView _isInteractionStable](self, "_isInteractionStable");
  return v3;
}

- (id)createBackgroundView
{
  return +[CCUIControlCenterMaterialView controlCenterModuleBackgroundMaterial](CCUIControlCenterMaterialView, "controlCenterModuleBackgroundMaterial");
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    name = self->_name;
    self->_name = v4;

    -[CCUIBaseSliderView _configureButtonInteraction](self, "_configureButtonInteraction");
  }

}

- (BOOL)shouldProvideBuiltInFeedback
{
  return -[_UIFluidSliderInteraction _feedbackEnabled](self->_interaction, "_feedbackEnabled");
}

- (void)setShouldProvideBuiltInFeedback:(BOOL)a3
{
  -[_UIFluidSliderInteraction _setFeedbackEnabled:](self->_interaction, "_setFeedbackEnabled:", a3);
}

- (BOOL)shouldScaleWithButtonInput
{
  return -[_UIFluidSliderInteraction _shouldScaleOnIndirectInput](self->_interaction, "_shouldScaleOnIndirectInput");
}

- (void)setShouldScaleWithButtonInput:(BOOL)a3
{
  -[_UIFluidSliderInteraction _setShouldScaleOnIndirectInput:](self->_interaction, "_setShouldScaleOnIndirectInput:", a3);
}

- (void)setShouldRelaxVisibilityRequirementForButtonInput:(BOOL)a3
{
  if (self->_shouldRelaxVisibilityRequirementForButtonInput != a3)
  {
    self->_shouldRelaxVisibilityRequirementForButtonInput = a3;
    -[CCUIBaseSliderView _configureButtonInteraction](self, "_configureButtonInteraction");
  }
}

- (void)_setActiveGlyphView:(id)a3
{
  CCUIGlyphTinting **p_activeGlyphView;
  CCUIPunchOutCompensating *v6;
  CCUIPunchOutCompensating *compensatingGlyphView;
  double v8;
  void *v9;
  id v10;

  p_activeGlyphView = &self->_activeGlyphView;
  v10 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeGlyphView, a3);
    -[CCUIPunchOutCompensating removeFromSuperview](self->_compensatingGlyphView, "removeFromSuperview");
    -[CCUIGlyphTinting ccui_punchOutCompensatingCopy](*p_activeGlyphView, "ccui_punchOutCompensatingCopy");
    v6 = (CCUIPunchOutCompensating *)objc_claimAutoreleasedReturnValue();
    compensatingGlyphView = self->_compensatingGlyphView;
    self->_compensatingGlyphView = v6;

    -[CCUIPunchOutCompensating setAutoresizingMask:](self->_compensatingGlyphView, "setAutoresizingMask:", 0);
    -[CCUIPunchOutCompensating setTintAdjustmentMode:](self->_compensatingGlyphView, "setTintAdjustmentMode:", 1);
    v8 = 1.0;
    if (!self->_glyphVisible)
      v8 = 0.0;
    -[CCUIPunchOutCompensating ccui_setCompensationAlpha:](self->_compensatingGlyphView, "ccui_setCompensationAlpha:", v8);
    -[CCUIBaseSliderView glyphContainerView](self, "glyphContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_compensatingGlyphView);

    -[CCUIBaseSliderView _updateGlyphTinting](self, "_updateGlyphTinting");
  }

}

- (void)setGlyphImage:(id)a3
{
  UIImage *v5;
  UIImageView *glyphImageView;
  id v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  double v11;
  CCUIPunchOutCompensating *compensatingGlyphView;
  void *v13;
  CCUIPunchOutCompensating *v14;
  CCUIPunchOutCompensating *v15;
  UIImageView *v16;
  CCUIPunchOutCompensating *v17;
  UIImage *v18;

  v5 = (UIImage *)a3;
  if (self->_glyphImage != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_glyphImage, a3);
    glyphImageView = self->_glyphImageView;
    if (self->_glyphImage)
    {
      if (!glyphImageView)
      {
        v7 = objc_alloc(MEMORY[0x1E0DC3890]);
        v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v9 = self->_glyphImageView;
        self->_glyphImageView = v8;

        -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 4);
        -[UIImageView setTintAdjustmentMode:](self->_glyphImageView, "setTintAdjustmentMode:", 1);
        -[UIImageView setUserInteractionEnabled:](self->_glyphImageView, "setUserInteractionEnabled:", 0);
        -[CCUIBaseSliderView glyphContainerView](self, "glyphContainerView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", self->_glyphImageView);

        glyphImageView = self->_glyphImageView;
      }
      -[UIImageView setImage:](glyphImageView, "setImage:", v18);
      -[UIImageView sizeToFit](self->_glyphImageView, "sizeToFit");
      v11 = 1.0;
      if (!self->_glyphVisible)
        v11 = 0.0;
      -[UIImageView setAlpha:](self->_glyphImageView, "setAlpha:", v11);
      -[CCUIBaseSliderView _setActiveGlyphView:](self, "_setActiveGlyphView:", self->_glyphImageView);
      compensatingGlyphView = self->_compensatingGlyphView;
      objc_opt_self();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = compensatingGlyphView;
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v17 = v15;

      -[CCUIPunchOutCompensating setImage:](v17, "setImage:", v18);
      -[CCUIPunchOutCompensating sizeToFit](v17, "sizeToFit");

      -[CCUIBaseSliderView _configureGroupRenderingMode](self, "_configureGroupRenderingMode");
      -[CCUIBaseSliderView setGlyphPackageDescription:](self, "setGlyphPackageDescription:", 0);
    }
    else
    {
      -[UIImageView removeFromSuperview](glyphImageView, "removeFromSuperview");
      v16 = self->_glyphImageView;
      self->_glyphImageView = 0;

    }
    v5 = v18;
  }

}

- (void)setGlyphPackageDescription:(id)a3
{
  CCUICAPackageDescription *v5;
  CCUICAPackageDescription **p_glyphPackageDescription;
  CCUICAPackageView *glyphPackageView;
  CCUICAPackageView *v8;
  CCUICAPackageView *v9;
  void *v10;
  CCUIPunchOutCompensating *compensatingGlyphView;
  void *v12;
  CCUIPunchOutCompensating *v13;
  CCUIPunchOutCompensating *v14;
  CCUICAPackageView *v15;
  CCUIPunchOutCompensating *v16;
  void *v17;
  double v18;
  CCUICAPackageDescription *v19;

  v5 = (CCUICAPackageDescription *)a3;
  p_glyphPackageDescription = &self->_glyphPackageDescription;
  if (self->_glyphPackageDescription != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
    glyphPackageView = self->_glyphPackageView;
    if (*p_glyphPackageDescription)
    {
      if (!glyphPackageView)
      {
        v8 = objc_alloc_init(CCUICAPackageView);
        v9 = self->_glyphPackageView;
        self->_glyphPackageView = v8;

        -[CCUICAPackageView setAutoresizingMask:](self->_glyphPackageView, "setAutoresizingMask:", 0);
        -[CCUIBaseSliderView glyphContainerView](self, "glyphContainerView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSubview:", self->_glyphPackageView);

        glyphPackageView = self->_glyphPackageView;
      }
      -[CCUICAPackageView setPackageDescription:](glyphPackageView, "setPackageDescription:");
      -[CCUIBaseSliderView _setActiveGlyphView:](self, "_setActiveGlyphView:", self->_glyphPackageView);
      compensatingGlyphView = self->_compensatingGlyphView;
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = compensatingGlyphView;
      if (v12)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v16 = v14;

      -[CCUIPunchOutCompensating setPackageDescription:](v16, "setPackageDescription:", *p_glyphPackageDescription);
      -[CCUIBaseSliderView glyphState](self, "glyphState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIBaseSliderView _applyGlyphState:performConfiguration:](self, "_applyGlyphState:performConfiguration:", v17, 1);

      v18 = 1.0;
      if (!self->_glyphVisible)
        v18 = 0.0;
      -[CCUICAPackageView setAlpha:](self->_glyphPackageView, "setAlpha:", v18);
      -[CCUIBaseSliderView setGlyphImage:](self, "setGlyphImage:", 0);
    }
    else
    {
      -[CCUICAPackageView removeFromSuperview](glyphPackageView, "removeFromSuperview");
      v15 = self->_glyphPackageView;
      self->_glyphPackageView = 0;

    }
    v5 = v19;
  }

}

- (void)_applyGlyphState:(id)a3 performConfiguration:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  CCUICAPackageView *glyphPackageView;
  BOOL v8;
  CCUIPunchOutCompensating *compensatingGlyphView;
  void *v10;
  CCUIPunchOutCompensating *v11;
  CCUIPunchOutCompensating *v12;
  CCUIPunchOutCompensating *v13;
  __CFString *v14;
  _QWORD v15[5];

  v4 = a4;
  v6 = (__CFString *)a3;
  glyphPackageView = self->_glyphPackageView;
  if (glyphPackageView)
    v8 = CFSTR("*") == v6;
  else
    v8 = 1;
  if (!v8)
  {
    v14 = v6;
    -[CCUICAPackageView setStateName:](glyphPackageView, "setStateName:", v6);
    compensatingGlyphView = self->_compensatingGlyphView;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = compensatingGlyphView;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    -[CCUIPunchOutCompensating setStateName:](v13, "setStateName:", v14);
    v6 = v14;
    if (v4)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__CCUIBaseSliderView__applyGlyphState_performConfiguration___block_invoke;
      v15[3] = &unk_1E8E20590;
      v15[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v15);
      -[CCUIBaseSliderView _configureGroupRenderingMode](self, "_configureGroupRenderingMode");
      -[CCUIBaseSliderView _updateGlyphTinting](self, "_updateGlyphTinting");
      v6 = v14;
    }
  }

}

uint64_t __60__CCUIBaseSliderView__applyGlyphState_performConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)_usesVibrantGlyphStyling
{
  return self->_glyphTintColor == 0;
}

- (void)_updateGlyphTinting
{
  _BOOL4 v3;
  CCUIPunchOutCompensating *compensatingGlyphView;
  CCUIGlyphTinting *activeGlyphView;
  id v6;

  v3 = -[CCUIBaseSliderView _usesVibrantGlyphStyling](self, "_usesVibrantGlyphStyling");
  compensatingGlyphView = self->_compensatingGlyphView;
  if (v3)
  {
    -[CCUIPunchOutCompensating setHidden:](compensatingGlyphView, "setHidden:", 0);
    -[CCUIPunchOutCompensating ccui_updatePunchOutCompensationIfNecessary](self->_compensatingGlyphView, "ccui_updatePunchOutCompensationIfNecessary");
  }
  else
  {
    -[CCUIPunchOutCompensating setHidden:](compensatingGlyphView, "setHidden:", 1);
  }
  activeGlyphView = self->_activeGlyphView;
  -[CCUIBaseSliderView glyphTintColor](self, "glyphTintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIGlyphTinting ccui_applyGlyphTintColor:](activeGlyphView, "ccui_applyGlyphTintColor:", v6);

}

- (void)_configureGroupRenderingMode
{
  -[NSObject ccui_configureForGroupRenderingMode:](self, "ccui_configureForGroupRenderingMode:", -[CCUIBaseSliderView _usesVibrantGlyphStyling](self, "_usesVibrantGlyphStyling"));
}

- (void)_setGlyphState:(id)a3
{
  __CFString *v5;
  const __CFString *glyphState;
  _BOOL8 v7;
  __CFString *v8;

  v5 = (__CFString *)a3;
  glyphState = (const __CFString *)self->_glyphState;
  if (glyphState != v5)
  {
    v7 = glyphState == CFSTR("*");
    v8 = v5;
    objc_storeStrong((id *)&self->_glyphState, a3);
    -[CCUIBaseSliderView _applyGlyphState:performConfiguration:](self, "_applyGlyphState:performConfiguration:", self->_glyphState, v7);
    v5 = v8;
  }

}

- (void)setGlyphState:(id)a3
{
  __CFString *v4;
  __CFString *v5;

  v4 = CFSTR("*");
  if (a3)
    v4 = (__CFString *)a3;
  v5 = v4;
  -[CCUIBaseSliderView _setGlyphState:](self, "_setGlyphState:", v5);

}

- (CGPoint)glyphCenter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  -[CCUIBaseSliderView glyphContainerView](self, "glyphContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5 * 0.5;
  v9 = v7 - v5 * 0.5;
  if (-[CCUIBaseSliderView shouldIntegralizeContentLayout](self, "shouldIntegralizeContentLayout"))
  {
    -[CCUIBaseSliderView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    UIPointRoundToScale();
    v12 = v11;
    v14 = v13;

    v15 = v12;
    v16 = v14;
  }
  else
  {
    v15 = v8;
    v16 = v9;
  }
  result.y = v16;
  result.x = v15;
  return result;
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return (UIPanGestureRecognizer *)-[_UIFluidSliderInteraction _panGestureRecognizer](self->_interaction, "_panGestureRecognizer");
}

- (id)_additionalTopLevelBlockingGestureRecognizers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (double)_length
{
  double v2;
  double v3;

  -[CCUIBaseSliderView bounds](self, "bounds");
  if (v2 <= v3)
    return v3;
  else
    return v2;
}

- (void)_configurePanGestureRecognizer
{
  id v2;

  -[CCUIBaseSliderView _panGestureRecognizer](self, "_panGestureRecognizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCancelsTouchesInView:", 0);
  objc_msgSend(v2, "setDelaysTouchesEnded:", 0);

}

- (void)_configureButtonInteraction
{
  void *v3;
  id v4;

  -[_UIFluidSliderInteraction _volumeButtonInteraction](self->_interaction, "_volumeButtonInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "_setWantsRelaxedVisibilityRequirement:", -[CCUIBaseSliderView shouldRelaxVisibilityRequirementForButtonInput](self, "shouldRelaxVisibilityRequirementForButtonInput"));
    -[CCUIBaseSliderView name](self, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setName:", v3);

  }
}

- (void)_updateBackgroundViewAppearance
{
  _BOOL8 v3;
  void *v4;
  char isKindOfClass;
  UIView *v6;

  v3 = -[CCUIBaseSliderView hasInoperativeAppearance](self, "hasInoperativeAppearance");
  v6 = self->_backgroundView;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[UIView setHasInoperativeAppearance:](v6, "setHasInoperativeAppearance:", v3);

}

- (double)_effectiveStretchAmount
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v11;

  -[CCUIBaseSliderView elasticContentStretchAmount](self, "elasticContentStretchAmount");
  v4 = v3;
  -[CCUIBaseSliderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  if (v4 >= 0.0)
  {
    if (v4 > 0.0 && v4 < 1.0)
    {
      -[CCUIBaseSliderView _length](self, "_length");
      UIFloorToScale();
      v4 = v11;
    }
  }
  else
  {
    -[CCUIBaseSliderView _length](self, "_length");
    -[CCUIBaseSliderView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");

    if (!self->_expanded)
      CCUILayoutGutter();
    UIRoundToScale();
    v8 = v7;
    UIRoundToScale();
    if (v9 <= v8)
      v4 = v9;
    else
      v4 = v8;
  }

  return v4;
}

- (BOOL)_isInteractionStable
{
  _UIFluidSliderInteractionUpdate *lastInteractionUpdate;

  lastInteractionUpdate = self->_lastInteractionUpdate;
  return !lastInteractionUpdate
      || -[_UIFluidSliderInteractionUpdate interactionState](lastInteractionUpdate, "interactionState") == 0;
}

- (void)_handleFluidSliderInteractionUpdate:(id)a3
{
  _UIFluidSliderInteractionUpdate *v5;
  _UIFluidSliderInteractionUpdate *v6;
  BOOL v7;
  uint64_t v8;
  _BOOL4 v9;
  float v10;
  float v11;
  float v12;
  float v13;
  _BOOL4 shouldSendEditingControlEvents;
  char v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  int isReceivingIndirectInputUpdates;
  int v20;
  double v21;
  float v22;
  float v23;
  void *v24;
  id v25;

  v25 = a3;
  v5 = self->_lastInteractionUpdate;
  v6 = v5;
  if (v5)
    v7 = -[_UIFluidSliderInteractionUpdate interactionState](v5, "interactionState") == 1;
  else
    v7 = 0;
  v8 = objc_msgSend(v25, "interactionState");
  v9 = -[CCUIBaseSliderView isEditingValue](self, "isEditingValue");
  -[CCUIBaseSliderView presentationValue](self, "presentationValue");
  v11 = v10;
  -[CCUIBaseSliderView value](self, "value");
  v13 = v12;
  shouldSendEditingControlEvents = self->_shouldSendEditingControlEvents;
  v15 = -[_UIFluidSliderInteraction isLocked](self->_interaction, "isLocked");
  v16 = shouldSendEditingControlEvents;
  if (!v7 && v8 == 1)
  {
    v17 = v25;
    if ((v15 & 1) != 0)
      goto LABEL_10;
    v16 = 1;
    self->_editingValue = 1;
    self->_shouldSendEditingControlEvents = 1;
    if (v9)
      goto LABEL_10;
    -[CCUIBaseSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x10000);
  }
  v17 = v25;
LABEL_10:
  if (objc_msgSend(v17, "interactionState") == 1)
    v18 = objc_msgSend(v25, "isTracking") ^ 1;
  else
    v18 = 0;
  isReceivingIndirectInputUpdates = self->_isReceivingIndirectInputUpdates;
  self->_isReceivingIndirectInputUpdates = v18;
  v20 = isReceivingIndirectInputUpdates == v18 || !v16;
  if ((v20 & 1) == 0 && v18)
    -[CCUIBaseSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", CCUIBaseSliderViewControlEventIndirectInputDidBegin);
  objc_storeStrong((id *)&self->_lastInteractionUpdate, a3);
  -[_UIFluidSliderInteraction value](self->_interaction, "value");
  *(float *)&v21 = fmax(fmin(v21, 1.0), 0.0);
  self->_value = *(float *)&v21;
  -[CCUIBaseSliderView _layoutElasticContentContainers](self, "_layoutElasticContentContainers");
  -[CCUIBaseSliderView layoutElasticContentViews](self, "layoutElasticContentViews");
  -[CCUIBaseSliderView value](self, "value");
  if (v13 != v22)
    -[CCUIBaseSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[CCUIBaseSliderView presentationValue](self, "presentationValue");
  if (v11 != v23)
    -[CCUIBaseSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", CCUIBaseSliderViewControlEventPresentationValueChanged);
  if (((v20 | v18) & 1) == 0)
    -[CCUIBaseSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", CCUIBaseSliderViewControlEventIndirectInputDidEnd);
  if (-[CCUIBaseSliderView _isInteractionStable](self, "_isInteractionStable"))
  {
    self->_editingValue = 0;
    self->_shouldSendEditingControlEvents = 0;
    if (v9 && v16)
      -[CCUIBaseSliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x40000);
  }
  if (-[_UIFluidSliderInteractionUpdate isTracking](v6, "isTracking")
    && (objc_msgSend(v25, "isTracking") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_deactivateReachability");

  }
}

- (float)value
{
  return self->_value;
}

- (BOOL)isEditingValue
{
  return self->_editingValue;
}

- (BOOL)usesBuiltInBackgroundView
{
  return self->_usesBuiltInBackgroundView;
}

- (double)continuousSliderCornerRadius
{
  return self->_continuousSliderCornerRadius;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (BOOL)isGlyphVisible
{
  return self->_glyphVisible;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (BOOL)isInteractiveWhenUnexpanded
{
  return self->_interactiveWhenUnexpanded;
}

- (void)setInteractiveWhenUnexpanded:(BOOL)a3
{
  self->_interactiveWhenUnexpanded = a3;
}

- (_UIFluidSliderInteraction)interaction
{
  return self->_interaction;
}

- (UIView)elasticBackgroundContentView
{
  return self->_elasticBackgroundContentView;
}

- (UIView)elasticContentBoundaryView
{
  return self->_elasticContentBoundaryView;
}

- (UIView)glyphContainerView
{
  return self->_glyphContainerView;
}

- (BOOL)shouldRelaxVisibilityRequirementForButtonInput
{
  return self->_shouldRelaxVisibilityRequirementForButtonInput;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)behaviorIdentifier
{
  return self->_behaviorIdentifier;
}

- (void)setBehaviorIdentifier:(unint64_t)a3
{
  self->_behaviorIdentifier = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)elasticContentView
{
  return self->_elasticContentView;
}

- (BOOL)shouldIncludeVolumeButtonsInput
{
  return self->_shouldIncludeVolumeButtonsInput;
}

- (double)elasticContentStretchAmount
{
  return self->_elasticContentStretchAmount;
}

- (BOOL)hasInoperativeAppearance
{
  return self->_hasInoperativeAppearance;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elasticContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_glyphContainerView, 0);
  objc_storeStrong((id *)&self->_elasticContentBoundaryView, 0);
  objc_storeStrong((id *)&self->_elasticBackgroundContentView, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_lastInteractionUpdate, 0);
  objc_storeStrong((id *)&self->_compensatingGlyphView, 0);
  objc_storeStrong((id *)&self->_activeGlyphView, 0);
  objc_storeStrong((id *)&self->_glyphPackageView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end
