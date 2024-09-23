@implementation BCUIChargeRing

- (double)lineWidth
{
  double result;

  result = self->_lineWidth;
  if (result <= 0.0)
    return 6.0;
  return result;
}

- (void)setLineWidth:(double)a3
{
  if (self->_lineWidth != a3)
  {
    self->_lineWidth = a3;
    -[BCUIChargeRing setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPercentCharge:(int64_t)a3
{
  uint64_t v3;
  void (**v5)(_QWORD);
  uint64_t v6;
  id WeakRetained;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD v10[5];

  v3 = a3 & ~(a3 >> 63);
  if (v3 >= 100)
    v3 = 100;
  if (v3 != self->_percentCharge)
  {
    self->_percentCharge = v3;
    if (v3)
    {
      -[BCUIChargeRing _chargeRing](self, "_chargeRing");
      v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFractionComplete:", (double)self->_percentCharge / 100.0);
    }
    else
    {
      v6 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __35__BCUIChargeRing_setPercentCharge___block_invoke;
      v10[3] = &unk_1E9418368;
      v10[4] = self;
      v5 = (void (**)(_QWORD))MEMORY[0x1D82417A0](v10, a2);
      WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
      if (WeakRetained)
      {
        v8[0] = v6;
        v8[1] = 3221225472;
        v8[2] = __35__BCUIChargeRing_setPercentCharge___block_invoke_2;
        v8[3] = &unk_1E94183E0;
        v9 = v5;
        objc_msgSend(WeakRetained, "animateAlongsideTransition:completion:", 0, v8);

      }
      else
      {
        v5[2](v5);
      }

    }
    -[BCUIChargeRing setNeedsLayout](self, "setNeedsLayout");
  }
}

void __35__BCUIChargeRing_setPercentCharge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 512))
  {
    objc_msgSend(*(id *)(v1 + 424), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 424);
    *(_QWORD *)(v3 + 424) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeFromSuperview");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 448);
    *(_QWORD *)(v5 + 448) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "removeFromSuperview");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 440);
    *(_QWORD *)(v7 + 440) = 0;

  }
}

uint64_t __35__BCUIChargeRing_setPercentCharge___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setLowCharge:(BOOL)a3
{
  if (self->_lowCharge != a3)
  {
    self->_lowCharge = a3;
    -[BCUIChargeRing setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCharging:(BOOL)a3
{
  if (self->_charging != a3)
  {
    self->_charging = a3;
    -[BCUIChargeRing setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  if (self->_lowPowerModeEnabled != a3)
  {
    self->_lowPowerModeEnabled = a3;
    -[BCUIChargeRing setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGlyph:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_glyph != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_glyph, a3);
    -[BCUIChargeRing setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setScaleFactor:(double)a3
{
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    -[BCUIChargeRing setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BCUIChargeRing)init
{
  BCUIChargeRing *v2;
  BCUIChargeRing *v3;
  _QWORD v5[4];
  BCUIChargeRing *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCUIChargeRing;
  v2 = -[BCUIChargeRing init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __22__BCUIChargeRing_init__block_invoke;
    v5[3] = &unk_1E9418270;
    v6 = v2;
    -[UIView observeContentSizeCategoryChange:](v6, "observeContentSizeCategoryChange:", v5);

  }
  return v3;
}

uint64_t __22__BCUIChargeRing_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCUIChargeRing;
  -[BCUIChargeRing didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[BCUIChargeRing superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCUIChargeRing _updateVisualStylingWithProvidersFromStylingProvider:](self, "_updateVisualStylingWithProvidersFromStylingProvider:", v3);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCUIChargeRing;
  -[BCUIChargeRing didMoveToWindow](&v5, sel_didMoveToWindow);
  -[BCUIChargeRing window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BCUIChargeRing superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIChargeRing _updateVisualStylingWithProvidersFromStylingProvider:](self, "_updateVisualStylingWithProvidersFromStylingProvider:", v4);

  }
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
  double v12;
  void *v13;
  _BOOL4 lowCharge;
  _BOOL4 lowPowerModeEnabled;
  void *v16;
  uint64_t v17;
  void *v18;
  BCUIRingView *chargeRing;
  double v20;
  BCUIRingCapShadow *ringCapShadow;
  uint64_t v22;
  void *v23;
  BCUIRingCapShadow *v24;
  _BOOL4 v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  UIImage *v37;
  UIImage *glyph;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[9];
  _QWORD v43[9];
  _QWORD v44[9];
  objc_super v45;
  CGRect v46;

  v45.receiver = self;
  v45.super_class = (Class)BCUIChargeRing;
  -[BCUIChargeRing layoutSubviews](&v45, sel_layoutSubviews);
  -[BCUIChargeRing bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BCUIChargeRing lineWidth](self, "lineWidth");
  v12 = v11 * self->_scaleFactor * self->_ringScale;
  -[BCUIChargeRing _baseRing](self, "_baseRing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineWidth:", v12);

  -[BCUIRingView setFrame:](self->_baseRing, "setFrame:", v4, v6, v8, v10);
  -[BCUIChargeRing _updateVisualStylingForBaseRingIfNecessary](self, "_updateVisualStylingForBaseRingIfNecessary");
  lowCharge = self->_lowCharge;
  lowPowerModeEnabled = self->_lowPowerModeEnabled;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (lowPowerModeEnabled)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!lowCharge)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  v16 = v18;
LABEL_6:
  chargeRing = self->_chargeRing;
  if (chargeRing)
  {
    -[BCUIRingView setLineWidth:](chargeRing, "setLineWidth:", v12);
    -[BCUIRingView setFrame:](self->_chargeRing, "setFrame:", v4, v6, v8, v10);
    -[BCUIRingView setStrokeColor:](self->_chargeRing, "setStrokeColor:", v16);
    chargeRing = self->_chargeRing;
  }
  v20 = 0.0;
  if (self->_percentCharge > 0)
    v20 = 1.0;
  -[BCUIRingView setAlpha:](chargeRing, "setAlpha:", v20);
  ringCapShadow = self->_ringCapShadow;
  -[BCUIChargeRing _configureRingCapShadowIfNecessary](self, "_configureRingCapShadowIfNecessary");
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __32__BCUIChargeRing_layoutSubviews__block_invoke;
  v44[3] = &unk_1E94182C0;
  v44[4] = self;
  *(double *)&v44[5] = v4;
  *(double *)&v44[6] = v6;
  *(double *)&v44[7] = v8;
  *(double *)&v44[8] = v10;
  v22 = MEMORY[0x1D82417A0](v44);
  v23 = (void *)v22;
  if (ringCapShadow || !self->_ringCapShadow)
    (*(void (**)(uint64_t))(v22 + 16))(v22);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v22);
  v24 = self->_ringCapShadow;
  v25 = -[BCUIChargeRing _shouldShowRingCapShadow](self, "_shouldShowRingCapShadow");
  v26 = 0.0;
  if (v25)
    v26 = 1.0;
  -[BCUIRingCapShadow setAlpha:](v24, "setAlpha:", v26);
  -[BCUIChargeRing window](self, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[BCUIChargeRing window](self, "window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "screen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scale");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scale");
  }

  if (self->_charging)
  {
    -[BCUIRingView bounds](self->_baseRing, "bounds");
    CGRectGetMidX(v46);
    BSRectWithSize();
    UIRectCenteredAboutPoint();
    UIRectIntegralWithScale();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __32__BCUIChargeRing_layoutSubviews__block_invoke_2;
    v43[3] = &unk_1E94182C0;
    v43[4] = self;
    v43[5] = v30;
    v43[6] = v31;
    v43[7] = v32;
    v43[8] = v33;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v43);
  }
  -[BCUIChargeRing _updateVisualStylingForBolt](self, "_updateVisualStylingForBolt");
  -[BCUIChargeRing _configureCaptureBackdropIfNecessary](self, "_configureCaptureBackdropIfNecessary");
  -[CABackdropLayer setFrame:](self->_captureBackdrop, "setFrame:", v4, v6, v8, v10);
  if (self->_charging)
    v34 = 1.0;
  else
    v34 = 0.0;
  -[UIImageView setAlpha:](self->_boltMaskImageView, "setAlpha:", v34);
  if (self->_charging)
    v35 = 1.0;
  else
    v35 = 0.0;
  -[UIImageView setAlpha:](self->_boltImageView, "setAlpha:", v35);
  -[BCUIChargeRing _glyphImageView](self, "_glyphImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "image");
  v37 = (UIImage *)objc_claimAutoreleasedReturnValue();
  glyph = self->_glyph;

  if (v37 != glyph)
  {
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", self->_glyph);
    -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", self->_scaleFactor * 24.0 * self->_ringScale);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "_configurationWithHierarchicalColors:", MEMORY[0x1E0C9AA60]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "configurationByApplyingConfiguration:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setPreferredSymbolConfiguration:](self->_glyphImageView, "setPreferredSymbolConfiguration:", v41);
    -[UIImageView pl_performCrossFadeIfNecessary](self->_glyphImageView, "pl_performCrossFadeIfNecessary");

  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __32__BCUIChargeRing_layoutSubviews__block_invoke_3;
  v42[3] = &unk_1E94182C0;
  v42[4] = self;
  *(double *)&v42[5] = v4;
  *(double *)&v42[6] = v6;
  *(double *)&v42[7] = v8;
  *(double *)&v42[8] = v10;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v42);

}

uint64_t __32__BCUIChargeRing_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setArcFraction:", (double)*(uint64_t *)(*(_QWORD *)(a1 + 32) + 512) / 100.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "layoutIfNeeded");
}

uint64_t __32__BCUIChargeRing_layoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureBoltMaskImageViewIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_configureBoltImageViewIfNecessary");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __32__BCUIChargeRing_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[BCUIChargeRing _baseRing](self, "_baseRing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  MTVisualStylingProvider *baseRingVisualStylingProvider;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCUIChargeRing;
  -[BCUIChargeRing _dynamicUserInterfaceTraitDidChange](&v4, sel__dynamicUserInterfaceTraitDidChange);
  baseRingVisualStylingProvider = self->_baseRingVisualStylingProvider;
  self->_baseRingVisualStylingProvider = 0;

  -[BCUIChargeRing _updateVisualStylingForBaseRingIfNecessary](self, "_updateVisualStylingForBaseRingIfNecessary");
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E941D9A8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    -[BCUIChargeRing requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      -[BCUIChargeRing _visualStylingProviderForCategory:](self, "_visualStylingProviderForCategory:", a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[BCUIChargeRing _stopAutomaticallyUpdatingVisualStylingForCategory:](self, "_stopAutomaticallyUpdatingVisualStylingForCategory:", a4);
        objc_storeStrong((id *)&self->_visualStylingProvider, a3);
        -[BCUIChargeRing _beginAutomaticallyUpdatingVisualStylingForCategory:](self, "_beginAutomaticallyUpdatingVisualStylingForCategory:", a4);
      }

    }
  }

}

- (id)_chargeRing
{
  BCUIRingView *chargeRing;
  BCUIRingView *v4;
  BCUIRingView *v5;
  BCUIRingView *v6;
  void *v7;

  chargeRing = self->_chargeRing;
  if (!chargeRing)
  {
    v4 = objc_alloc_init(BCUIRingView);
    v5 = self->_chargeRing;
    self->_chargeRing = v4;

    v6 = self->_chargeRing;
    -[BCUIChargeRing _baseRing](self, "_baseRing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIChargeRing insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v6, v7);

    chargeRing = self->_chargeRing;
  }
  return chargeRing;
}

- (id)_baseRing
{
  BCUIRingView *baseRing;
  BCUIRingView *v4;
  BCUIRingView *v5;
  BCUIRingView *v6;
  void *v7;

  baseRing = self->_baseRing;
  if (!baseRing)
  {
    v4 = objc_alloc_init(BCUIRingView);
    v5 = self->_baseRing;
    self->_baseRing = v4;

    v6 = self->_baseRing;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIRingView setStrokeColor:](v6, "setStrokeColor:", v7);

    -[BCUIRingView setFractionComplete:](self->_baseRing, "setFractionComplete:", 1.0);
    -[BCUIChargeRing addSubview:](self, "addSubview:", self->_baseRing);
    baseRing = self->_baseRing;
  }
  return baseRing;
}

- (id)_glyphImageView
{
  UIImageView *glyphImageView;
  UIImageView *v4;
  UIImageView *v5;
  BCUIRingView *chargeRing;
  BCUIRingView *v7;
  BCUIRingView *v8;

  glyphImageView = self->_glyphImageView;
  if (!glyphImageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_glyphImageView;
    self->_glyphImageView = v4;

    chargeRing = self->_chargeRing;
    if (chargeRing)
    {
      v7 = chargeRing;
    }
    else
    {
      -[BCUIChargeRing _baseRing](self, "_baseRing");
      v7 = (BCUIRingView *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    -[BCUIChargeRing insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_glyphImageView, v7);
    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self->_glyphImageView, 0);

    glyphImageView = self->_glyphImageView;
  }
  return glyphImageView;
}

- (void)_configureBoltMaskImageViewIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *boltMaskImageView;
  void *v10;
  _QWORD v11[5];

  if (!self->_boltMaskImageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIChargeRing traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("batterywidget.bolt.mask"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v7);
    boltMaskImageView = self->_boltMaskImageView;
    self->_boltMaskImageView = v8;

    -[UIImageView setContentMode:](self->_boltMaskImageView, "setContentMode:", 1);
    -[UIImageView layer](self->_boltMaskImageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__BCUIChargeRing__configureBoltMaskImageViewIfNecessary__block_invoke;
    v11[3] = &unk_1E9418368;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
    -[BCUIChargeRing addSubview:](self, "addSubview:", self->_boltMaskImageView);
  }
}

uint64_t __56__BCUIChargeRing__configureBoltMaskImageViewIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
}

- (void)_configureBoltImageViewIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *boltImageView;
  _QWORD v10[5];

  if (!self->_boltImageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIChargeRing traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("batterywidget.bolt"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v7);
    boltImageView = self->_boltImageView;
    self->_boltImageView = v8;

    -[UIImageView setContentMode:](self->_boltImageView, "setContentMode:", 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__BCUIChargeRing__configureBoltImageViewIfNecessary__block_invoke;
    v10[3] = &unk_1E9418368;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
    -[BCUIChargeRing _configureBoltMaskImageViewIfNecessary](self, "_configureBoltMaskImageViewIfNecessary");
    -[BCUIChargeRing insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_boltImageView, self->_boltMaskImageView);
  }
}

uint64_t __52__BCUIChargeRing__configureBoltImageViewIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

- (BOOL)_isPastThresholdForRingCapShadow
{
  return (double)self->_percentCharge / 100.0 >= 0.97;
}

- (BOOL)_shouldShowRingCapShadow
{
  return !self->_charging
      && -[BCUIChargeRing _isPastThresholdForRingCapShadow](self, "_isPastThresholdForRingCapShadow");
}

- (void)_configureRingCapShadowIfNecessary
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BCUIRingCapShadow *ringCapShadow;
  _BOOL4 v19;
  double v20;
  BCUIRingCapShadow *v21;
  BCUIRingCapShadow *v22;
  char v23;
  id WeakRetained;
  _QWORD v25[5];
  void (**v26)(_QWORD);
  _QWORD v27[5];
  _QWORD v28[5];
  CGRect v29;
  CGRect v30;

  v3 = -[BCUIChargeRing _shouldShowRingCapShadow](self, "_shouldShowRingCapShadow");
  -[BCUIChargeRing bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke;
  v28[3] = &unk_1E9418368;
  v28[4] = self;
  v13 = (void (**)(_QWORD))MEMORY[0x1D82417A0](v28);
  -[BCUIRingCapShadow ringBounds](self->_ringCapShadow, "ringBounds");
  v30.origin.x = v14;
  v30.origin.y = v15;
  v30.size.width = v16;
  v30.size.height = v17;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  if (!CGRectEqualToRect(v29, v30))
    v13[2](v13);
  ringCapShadow = self->_ringCapShadow;
  if (ringCapShadow)
    v19 = 0;
  else
    v19 = v3;
  if (v19)
  {
    -[BCUIRingView lineWidth](self->_chargeRing, "lineWidth");
    +[BCUIRingCapShadow ringCapShadowForRingWithBounds:lineWidth:](BCUIRingCapShadow, "ringCapShadowForRingWithBounds:lineWidth:", v5, v7, v9, v11, v20);
    v21 = (BCUIRingCapShadow *)objc_claimAutoreleasedReturnValue();
    v22 = self->_ringCapShadow;
    self->_ringCapShadow = v21;

    -[BCUIChargeRing insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_ringCapShadow, self->_chargeRing);
    v27[0] = v12;
    v27[1] = 3221225472;
    v27[2] = __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_2;
    v27[3] = &unk_1E9418368;
    v27[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v27);
  }
  else
  {
    if (ringCapShadow)
      v23 = v3;
    else
      v23 = 1;
    if ((v23 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
      if (WeakRetained)
      {
        v25[0] = v12;
        v25[1] = 3221225472;
        v25[2] = __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_3;
        v25[3] = &unk_1E9418408;
        v25[4] = self;
        v26 = v13;
        objc_msgSend(WeakRetained, "animateAlongsideTransition:completion:", 0, v25);

      }
      else
      {
        v13[2](v13);
      }

    }
  }

}

void __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 432);
  *(_QWORD *)(v2 + 432) = 0;

}

uint64_t __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

uint64_t __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPastThresholdForRingCapShadow");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  return self->_visualStylingProvider;
}

- (void)_updateVisualStylingWithProvidersFromStylingProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[BCUIChargeRing requiredVisualStyleCategories](self, "requiredVisualStyleCategories", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v4, "visualStylingProviderForCategory:", objc_msgSend(v10, "integerValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCUIChargeRing setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v11, objc_msgSend(v10, "integerValue"));

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_beginAutomaticallyUpdatingPrimaryVisualStylingForView:(id)a3 observerBlock:(id)a4
{
  MTVisualStylingProvider *visualStylingProvider;

  if (a3)
  {
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider)
    {
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:andObserverBlock:](visualStylingProvider, "automaticallyUpdateView:withStyle:andObserverBlock:");
      -[BCUIChargeRing setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
}

- (void)_beginAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  if (a3 == 1)
  {
    if (self->_visualStylingProvider)
    {
      -[BCUIChargeRing _beginAutomaticallyUpdatingPrimaryVisualStylingForView:observerBlock:](self, "_beginAutomaticallyUpdatingPrimaryVisualStylingForView:observerBlock:", self->_glyphImageView, 0);
      -[BCUIChargeRing _updateVisualStylingForBolt](self, "_updateVisualStylingForBolt");
    }
  }
}

- (void)_stopAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void (**v6)(_QWORD, _QWORD);
  _QWORD v7[9];

  if (a3 == 1)
  {
    v7[7] = v3;
    v7[8] = v4;
    if (self->_visualStylingProvider)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __69__BCUIChargeRing__stopAutomaticallyUpdatingVisualStylingForCategory___block_invoke;
      v7[3] = &unk_1E9418430;
      v7[4] = self;
      v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D82417A0](v7, a2);
      ((void (**)(_QWORD, UIImageView *))v6)[2](v6, self->_glyphImageView);
      ((void (**)(_QWORD, UIImageView *))v6)[2](v6, self->_boltImageView);

    }
  }
}

uint64_t __69__BCUIChargeRing__stopAutomaticallyUpdatingVisualStylingForCategory___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 472), "stopAutomaticallyUpdatingView:", a2);
    return objc_msgSend(*(id *)(v2 + 32), "setNeedsDisplay");
  }
  return result;
}

- (id)_ringVisualStylingProvider
{
  MTVisualStylingProvider *baseRingVisualStylingProvider;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  MTVisualStylingProvider *v10;
  MTVisualStylingProvider *v11;

  baseRingVisualStylingProvider = self->_baseRingVisualStylingProvider;
  if (!baseRingVisualStylingProvider)
  {
    -[BCUIChargeRing traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");
    v6 = CFSTR("baseRingLight");
    if (v5 == 2)
      v6 = CFSTR("baseRingDark");
    v7 = v6;

    v8 = (void *)MEMORY[0x1E0D474B8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_visualStylingProviderForStyleSetNamed:inBundle:", v7, v9);
    v10 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();

    v11 = self->_baseRingVisualStylingProvider;
    self->_baseRingVisualStylingProvider = v10;

    baseRingVisualStylingProvider = self->_baseRingVisualStylingProvider;
  }
  return baseRingVisualStylingProvider;
}

- (void)_updateVisualStylingForBaseRingIfNecessary
{
  BCUIRingView *baseRing;
  void *v4;
  id v5;

  if (!self->_baseRingVisualStylingProvider)
  {
    -[BCUIRingView mt_removeAllVisualStyling](self->_baseRing, "mt_removeAllVisualStyling");
    baseRing = self->_baseRing;
    -[BCUIChargeRing _ringVisualStylingProvider](self, "_ringVisualStylingProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_visualStylingForStyle:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIRingView mt_replaceVisualStyling:](baseRing, "mt_replaceVisualStyling:", v4);

  }
}

- (void)_configureCaptureBackdropIfNecessary
{
  CABackdropLayer *captureBackdrop;
  CABackdropLayer *v4;
  CABackdropLayer *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD v12[5];

  captureBackdrop = self->_captureBackdrop;
  if (self->_charging)
  {
    if (!captureBackdrop)
    {
      v4 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E0CD2708]);
      v5 = self->_captureBackdrop;
      self->_captureBackdrop = v4;

      -[CABackdropLayer setAllowsInPlaceFiltering:](self->_captureBackdrop, "setAllowsInPlaceFiltering:", 1);
      -[BCUIChargeRing layer](self, "layer");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSublayer:atIndex:", self->_captureBackdrop, 0);

    }
  }
  else if (captureBackdrop)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke;
    v12[3] = &unk_1E9418368;
    v12[4] = self;
    v7 = (void (**)(_QWORD))MEMORY[0x1D82417A0](v12, a2);
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
    if (WeakRetained)
    {
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke_2;
      v10[3] = &unk_1E94183E0;
      v11 = v7;
      objc_msgSend(WeakRetained, "animateAlongsideTransition:completion:", 0, v10);

    }
    else
    {
      v7[2](v7);
    }

  }
}

void __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 489))
  {
    objc_msgSend(*(id *)(v1 + 456), "removeFromSuperlayer");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 456);
    *(_QWORD *)(v3 + 456) = 0;

  }
}

uint64_t __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateVisualStylingForBolt
{
  int64_t percentCharge;
  MTVisualStylingProvider *visualStylingProvider;
  UIImageView *boltImageView;
  UIImageView *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  UIImageView *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  id location;

  if (self->_charging)
  {
    percentCharge = self->_percentCharge;
    visualStylingProvider = self->_visualStylingProvider;
    boltImageView = self->_boltImageView;
    if (percentCharge == 100)
    {
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", boltImageView);
      v6 = self->_boltImageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v6, "setTintColor:", v7);

    }
    else
    {
      -[MTVisualStylingProvider _visualStylingForContinuallyUpdatedView:](visualStylingProvider, "_visualStylingForContinuallyUpdatedView:", boltImageView);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_initWeak(&location, self->_boltImageView);
        v11 = self->_boltImageView;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke;
        v14[3] = &unk_1E9418458;
        objc_copyWeak(&v15, &location);
        -[BCUIChargeRing _beginAutomaticallyUpdatingPrimaryVisualStylingForView:observerBlock:](self, "_beginAutomaticallyUpdatingPrimaryVisualStylingForView:observerBlock:", v11, v14);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
    -[BCUIChargeRing layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 1);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
    v9 = WeakRetained;
    if (WeakRetained)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_3;
      v13[3] = &unk_1E9418480;
      v13[4] = self;
      objc_msgSend(WeakRetained, "animateAlongsideTransition:completion:", 0, v13);
    }
    else
    {
      -[BCUIChargeRing layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAllowsGroupBlending:", self->_charging);

    }
  }

}

id __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "alpha");
  v3 = v2;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_2;
  v5[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v5[4] = v3;
  return (id)MEMORY[0x1D82417A0](v5);
}

uint64_t __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

void __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupBlending:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 489));

}

- (double)ringScale
{
  return self->_ringScale;
}

- (void)setRingScale:(double)a3
{
  self->_ringScale = a3;
}

- (int64_t)percentCharge
{
  return self->_percentCharge;
}

- (BOOL)isLowCharge
{
  return self->_lowCharge;
}

- (BOOL)isCharging
{
  return self->_charging;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (UIImage)glyph
{
  return self->_glyph;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_transitionCoordinator);
}

- (void)setTransitionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_transitionCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_baseRingVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_captureBackdrop, 0);
  objc_storeStrong((id *)&self->_boltImageView, 0);
  objc_storeStrong((id *)&self->_boltMaskImageView, 0);
  objc_storeStrong((id *)&self->_ringCapShadow, 0);
  objc_storeStrong((id *)&self->_chargeRing, 0);
  objc_storeStrong((id *)&self->_baseRing, 0);
}

@end
