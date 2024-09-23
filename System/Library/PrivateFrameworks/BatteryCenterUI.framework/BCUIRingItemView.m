@implementation BCUIRingItemView

+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  return UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;
}

+ (BOOL)isAX1PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  NSString *v3;
  NSString *v4;
  BOOL v5;

  v3 = (NSString *)a3;
  v4 = (NSString *)*MEMORY[0x1E0DC48D8];
  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8]))
    v5 = UIContentSizeCategoryCompareToCategory(v3, v4) == NSOrderedDescending;
  else
    v5 = 1;

  return v5;
}

+ (double)_ringLabelPaddingForContentSizeCategory:(id)a3
{
  NSString *v3;
  double v4;

  v3 = (NSString *)a3;
  v4 = 10.0;
  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8])
    && UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]))
  {
    if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48C8]))
    {
      if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48C0]))
      {
        if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48B8]))
          v4 = 18.0;
        else
          v4 = 0.0;
      }
      else
      {
        v4 = 3.0;
      }
    }
    else
    {
      v4 = 8.0;
    }
  }

  return v4;
}

- (CGRect)_largestPossibleFrameForChargeLabelGivenBounds:(CGRect)result chargeRingSize:(CGSize)a4 andRingLabelPadding:(double)a5
{
  double v5;

  v5 = result.size.height - (a4.height + a5 + 16.0);
  result.size.height = v5;
  return result;
}

- (void)setRingItemViewStyle:(int64_t)a3
{
  if (self->_ringItemViewStyle != a3)
  {
    self->_ringItemViewStyle = a3;
    -[BCUIRingItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)ringLineWidth
{
  double result;

  -[BCUIChargeRing lineWidth](self->_chargeRing, "lineWidth");
  return result;
}

- (void)setRingLineWidth:(double)a3
{
  double v5;
  void *v6;

  -[BCUIRingItemView ringLineWidth](self, "ringLineWidth");
  if (v5 != a3)
  {
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineWidth:", a3);

    -[BCUIRingItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRingScale:(double)a3
{
  void *v5;

  if (self->_ringScale != a3)
  {
    self->_ringScale = a3;
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRingScale:", a3);

    -[BCUIRingItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)percentCharge
{
  return -[BCUIChargeRing percentCharge](self->_chargeRing, "percentCharge");
}

- (void)setPercentCharge:(int64_t)a3
{
  void *v5;

  if (-[BCUIRingItemView percentCharge](self, "percentCharge") != a3)
  {
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPercentCharge:", a3);

    -[BCUIRingItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isLowCharge
{
  return -[BCUIChargeRing isLowCharge](self->_chargeRing, "isLowCharge");
}

- (void)setLowCharge:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[BCUIRingItemView isLowCharge](self, "isLowCharge") != a3)
  {
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLowCharge:", v3);

  }
}

- (BOOL)isCharging
{
  return -[BCUIChargeRing isCharging](self->_chargeRing, "isCharging");
}

- (void)setCharging:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[BCUIRingItemView isCharging](self, "isCharging") != a3)
  {
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCharging:", v3);

  }
}

- (BOOL)isLowPowerModeEnabled
{
  return -[BCUIChargeRing isLowPowerModeEnabled](self->_chargeRing, "isLowPowerModeEnabled");
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[BCUIRingItemView isLowPowerModeEnabled](self, "isLowPowerModeEnabled") != a3)
  {
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLowPowerModeEnabled:", v3);

  }
}

- (UIImage)glyph
{
  return -[BCUIChargeRing glyph](self->_chargeRing, "glyph");
}

- (void)setGlyph:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BCUIRingItemView glyph](self, "glyph");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlyph:", v6);

  }
}

- (void)setScaleFactor:(double)a3
{
  void *v4;

  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    -[BCUIRingItemView _chargeRing](self, "_chargeRing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScaleFactor:", self->_scaleFactor);

    -[BCUIRingItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_empty = a3;
    -[BCUIRingItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTransitionCoordinator:(id)a3
{
  id WeakRetained;
  id v5;
  BCUIChargeRing *chargeRing;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_transitionCoordinator, obj);
    chargeRing = self->_chargeRing;
    v7 = v5;
    -[BCUIChargeRing setTransitionCoordinator:](chargeRing, "setTransitionCoordinator:", obj);

  }
}

- (BCUIRingItemView)initWithFrame:(CGRect)a3
{
  BCUIRingItemView *v3;
  BCUIRingItemView *v4;
  void *v5;
  _QWORD v7[4];
  BCUIRingItemView *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BCUIRingItemView;
  v3 = -[BCUIRingItemView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_ringScale = 1.0;
    -[BCUIRingItemView _chargeRing](v3, "_chargeRing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRingScale:", 1.0);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__BCUIRingItemView_initWithFrame___block_invoke;
    v7[3] = &unk_1E9418270;
    v8 = v4;
    -[UIView observeContentSizeCategoryChange:](v8, "observeContentSizeCategoryChange:", v7);

  }
  return v4;
}

uint64_t __34__BCUIRingItemView_initWithFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCUIRingItemView;
  -[BCUIRingItemView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[BCUIRingItemView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCUIRingItemView _updateVisualStylingWithProvidersFromStylingProvider:](self, "_updateVisualStylingWithProvidersFromStylingProvider:", v3);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCUIRingItemView;
  -[BCUIRingItemView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[BCUIRingItemView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BCUIRingItemView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIRingItemView _updateVisualStylingWithProvidersFromStylingProvider:](self, "_updateVisualStylingWithProvidersFromStylingProvider:", v4);

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  _QWORD v37[9];
  _QWORD v38[15];
  _QWORD v39[4];
  __int128 v40;
  __int128 v41;
  objc_super v42;
  CGRect v43;

  v42.receiver = self;
  v42.super_class = (Class)BCUIRingItemView;
  -[BCUIRingItemView layoutSubviews](&v42, sel_layoutSubviews);
  -[BCUIRingItemView bounds](self, "bounds");
  if (!CGRectIsEmpty(v43))
  {
    -[BCUIRingItemView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIRingItemView _configureChargeLabelForStyle:](self, "_configureChargeLabelForStyle:", self->_ringItemViewStyle);
    -[BCUIRingItemView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[BCUIRingItemView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[BCUIRingItemView window](self, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "screen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = v16;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scale");
      v17 = v18;
    }

    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x4010000000;
    v39[3] = &unk_1D2A90AF5;
    v19 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v40 = *MEMORY[0x1E0C9D628];
    v41 = v19;
    -[BCUIRingItemView _sizeForChargeRingWithStyle:inBounds:withPreferredContentSizeCategory:](self, "_sizeForChargeRingWithStyle:inBounds:withPreferredContentSizeCategory:", self->_ringItemViewStyle, v4, v6, v8, v10, v12);
    v22 = v21;
    v23 = MEMORY[0x1E0C809B0];
    if (self->_chargeLabel)
    {
      v36 = v20;
      -[BCUIRingItemView _updateFontForChargeLabelForStyle:andContentSizeCategory:](self, "_updateFontForChargeLabelForStyle:andContentSizeCategory:", self->_ringItemViewStyle, v4);
      -[BCUIRingItemView _lazyPercentChargeFormatter](self, "_lazyPercentChargeFormatter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bcui_setPercentSymbolEnabled:", -[BCUIRingItemView _isPercentSymbolEnabledForRingItemStyle:andContentSizeCategory:](self, "_isPercentSymbolEnabledForRingItemStyle:andContentSizeCategory:", self->_ringItemViewStyle, v4));

      -[BCUIRingItemView _percentChargeString:](self, "_percentChargeString:", -[BCUIRingItemView percentCharge](self, "percentCharge"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel text](self->_chargeLabel, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", v25);

      if ((v27 & 1) == 0)
      {
        -[UILabel setText:](self->_chargeLabel, "setText:", v25);
        -[UILabel setAdjustsFontSizeToFitWidth:](self->_chargeLabel, "setAdjustsFontSizeToFitWidth:", (unint64_t)objc_msgSend(v25, "length") > 4);
        -[UILabel pl_performCrossFadeIfNecessary](self->_chargeLabel, "pl_performCrossFadeIfNecessary");
      }
      -[BCUIRingItemView _sizeForChargeLabel:withStyle:inBounds:scale:](self, "_sizeForChargeLabel:withStyle:inBounds:scale:", self->_chargeLabel, self->_ringItemViewStyle, v6, v8, v10, v12, v17);
      v29 = v28;
      v31 = v30;
      v38[0] = v23;
      v38[1] = 3221225472;
      v38[2] = __34__BCUIRingItemView_layoutSubviews__block_invoke;
      v38[3] = &unk_1E9418298;
      *(double *)&v38[6] = v28;
      *(double *)&v38[7] = v30;
      v38[4] = self;
      v38[5] = v39;
      *(double *)&v38[8] = v36;
      *(double *)&v38[9] = v22;
      *(double *)&v38[10] = v6;
      *(double *)&v38[11] = v8;
      *(double *)&v38[12] = v10;
      *(double *)&v38[13] = v12;
      *(double *)&v38[14] = v17;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v38);

      v20 = v36;
    }
    else
    {
      v29 = *MEMORY[0x1E0C9D820];
      v31 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    -[BCUIRingItemView _frameForChargeRingWithSize:chargeLabelSize:style:inBounds:scale:](self, "_frameForChargeRingWithSize:chargeLabelSize:style:inBounds:scale:", self->_ringItemViewStyle, v20, v22, v29, v31, v6, v8, v10, v12, *(_QWORD *)&v17);
    v37[0] = v23;
    v37[1] = 3221225472;
    v37[2] = __34__BCUIRingItemView_layoutSubviews__block_invoke_2;
    v37[3] = &unk_1E94182C0;
    v37[4] = self;
    v37[5] = v32;
    v37[6] = v33;
    v37[7] = v34;
    v37[8] = v35;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v37);
    _Block_object_dispose(v39, 8);

  }
}

uint64_t __34__BCUIRingItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[60];
  if (v3 == 2)
  {
    v4 = (void *)v2[53];
    BSRectWithSize();
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "_firstLineBaselineOffsetFromBoundsTop");
    v6 = v5;
    v2 = *(_QWORD **)(a1 + 32);
    v3 = v2[60];
  }
  else
  {
    v6 = 0.0;
  }
  objc_msgSend(v2, "_frameForChargeLabelWithSize:baseLineOffsetFromBoundsTop:chargeRingSize:style:inBounds:scale:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56), v6, *(double *)(a1 + 64), *(double *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
}

void __34__BCUIRingItemView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_chargeRing");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E941D990;
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
    -[BCUIRingItemView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      -[BCUIRingItemView _visualStylingProviderForCategory:](self, "_visualStylingProviderForCategory:", a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[BCUIRingItemView _stopAutomaticallyUpdatingVisualStyling](self, "_stopAutomaticallyUpdatingVisualStyling");
        objc_storeStrong((id *)&self->_visualStylingProvider, a3);
        -[BCUIRingItemView _beginAutomaticallyUpdatingChargeLabelVisualStyling](self, "_beginAutomaticallyUpdatingChargeLabelVisualStyling");
      }

    }
  }

}

- (id)_chargeRing
{
  BCUIChargeRing *chargeRing;
  BCUIChargeRing *v4;
  BCUIChargeRing *v5;
  BCUIChargeRing *v6;
  id WeakRetained;

  chargeRing = self->_chargeRing;
  if (!chargeRing)
  {
    v4 = objc_alloc_init(BCUIChargeRing);
    v5 = self->_chargeRing;
    self->_chargeRing = v4;

    v6 = self->_chargeRing;
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
    -[BCUIChargeRing setTransitionCoordinator:](v6, "setTransitionCoordinator:", WeakRetained);

    -[BCUIRingItemView addSubview:](self, "addSubview:", self->_chargeRing);
    chargeRing = self->_chargeRing;
  }
  return chargeRing;
}

- (CGSize)_sizeForChargeRingWithStyle:(int64_t)a3 inBounds:(CGRect)a4 withPreferredContentSizeCategory:(id)a5
{
  double Width;
  double v7;
  CGSize result;

  if (self->_ringScale == 1.0)
    Width = CGRectGetWidth(a4);
  else
    Width = self->_scaleFactor * 74.0;
  if (a3 == 2)
    Width = (Width + -11.0) * 0.5;
  v7 = Width;
  result.height = v7;
  result.width = Width;
  return result;
}

- (CGRect)_frameForChargeRingWithSize:(CGSize)a3 chargeLabelSize:(CGSize)a4 style:(int64_t)a5 inBounds:(CGRect)a6 scale:(double)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double ringScale;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  BSRectWithSize();
  v28 = v13;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v20 = CGRectGetHeight(v29);
  ringScale = self->_ringScale;
  if (a5 == 2)
  {
    if (-[BCUIRingItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", v20))
    {
      -[BCUIRingItemView bounds](self, "bounds");
      CGRectGetMaxX(v30);
      v31.origin.x = v28;
      v31.origin.y = v15;
      v31.size.width = v17;
      v31.size.height = v19;
      CGRectGetWidth(v31);
    }
  }
  else if (a5 == 1)
  {
    -[BCUIRingItemView traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferredContentSizeCategory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCUIRingItemView _ringLabelPaddingForContentSizeCategory:](BCUIRingItemView, "_ringLabelPaddingForContentSizeCategory:", v23);

  }
  if (ringScale == 1.0)
    UIRectIntegralWithScale();
  else
    UIRectCenteredXInRectScale();
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)_configureChargeLabelForStyle:(int64_t)a3
{
  UILabel *chargeLabel;
  UILabel *v6;
  UILabel *v7;
  uint64_t v8;
  UILabel *v9;
  double v10;

  chargeLabel = self->_chargeLabel;
  if (a3)
  {
    if (!chargeLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v7 = self->_chargeLabel;
      self->_chargeLabel = v6;

      -[BCUIRingItemView addSubview:](self, "addSubview:", self->_chargeLabel);
      -[BCUIRingItemView _beginAutomaticallyUpdatingChargeLabelVisualStyling](self, "_beginAutomaticallyUpdatingChargeLabelVisualStyling");
      chargeLabel = self->_chargeLabel;
    }
    if (a3 == 1)
    {
      v8 = 1;
    }
    else if (-[BCUIRingItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }
    -[UILabel setTextAlignment:](chargeLabel, "setTextAlignment:", v8);
    -[UILabel setLineBreakMode:](self->_chargeLabel, "setLineBreakMode:", 2);
    v10 = 0.0;
    if (!self->_empty)
      v10 = 1.0;
    -[UILabel setAlpha:](self->_chargeLabel, "setAlpha:", v10);
  }
  else if (chargeLabel)
  {
    -[UILabel removeFromSuperview](self->_chargeLabel, "removeFromSuperview");
    v9 = self->_chargeLabel;
    self->_chargeLabel = 0;

  }
}

- (void)_updateFontForChargeLabelForStyle:(int64_t)a3 andContentSizeCategory:(id)a4
{
  id v6;
  void *v7;
  UILabel *chargeLabel;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = v6;
  chargeLabel = self->_chargeLabel;
  if (chargeLabel)
  {
    if (a3 == 2)
    {
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", self->_scaleFactor * 46.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](chargeLabel, "setFont:", v9);
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4B58], v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pointSize");
      objc_msgSend(v10, "fontWithSize:", v11 * self->_scaleFactor);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel setFont:](self->_chargeLabel, "setFont:", v12);
LABEL_6:

      v7 = v13;
    }
  }

}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1)
    return self->_visualStylingProvider;
  else
    return 0;
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
    -[BCUIRingItemView requiredVisualStyleCategories](self, "requiredVisualStyleCategories", 0);
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
          -[BCUIRingItemView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v11, objc_msgSend(v10, "integerValue"));

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_beginAutomaticallyUpdatingChargeLabelVisualStyling
{
  MTVisualStylingProvider *visualStylingProvider;
  UILabel *chargeLabel;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    chargeLabel = self->_chargeLabel;
    if (chargeLabel)
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:andObserverBlock:](visualStylingProvider, "automaticallyUpdateView:withStyle:andObserverBlock:", chargeLabel, 0, &__block_literal_global);
  }
}

id __71__BCUIRingItemView__beginAutomaticallyUpdatingChargeLabelVisualStyling__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  objc_msgSend(a3, "alpha");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__BCUIRingItemView__beginAutomaticallyUpdatingChargeLabelVisualStyling__block_invoke_2;
  v5[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v5[4] = v3;
  return (id)MEMORY[0x1D82417A0](v5);
}

uint64_t __71__BCUIRingItemView__beginAutomaticallyUpdatingChargeLabelVisualStyling__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

- (void)_stopAutomaticallyUpdatingVisualStyling
{
  MTVisualStylingProvider *visualStylingProvider;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    if (self->_chargeLabel)
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:");
  }
}

- (CGSize)_sizeForChargeLabel:(id)a3 withStyle:(int64_t)a4 inBounds:(CGRect)a5 scale:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v12 = CGRectGetWidth(v21);
  v13 = 0.0;
  if (a4 == 1)
    v13 = 12.0;
  v14 = v13 + v12;
  objc_msgSend(v11, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pointSize");
  v17 = v16;

  v18 = v14;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGRect)_frameForChargeLabelWithSize:(CGSize)a3 baseLineOffsetFromBoundsTop:(double)a4 chargeRingSize:(CGSize)a5 style:(int64_t)a6 inBounds:(CGRect)a7 scale:(double)a8
{
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat height;
  CGRect result;

  height = a5.height;
  BSRectWithSize();
  CGRectGetHeight(a7);
  if (a6 == 1)
  {
    -[BCUIRingItemView traitCollection](self, "traitCollection", *(_QWORD *)&height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSizeCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCUIRingItemView _ringLabelPaddingForContentSizeCategory:](BCUIRingItemView, "_ringLabelPaddingForContentSizeCategory:", v11);

  }
  UIRectIntegralWithScale();
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_lazyPercentChargeFormatter
{
  NSNumberFormatter *percentChargeFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  percentChargeFormatter = self->_percentChargeFormatter;
  if (!percentChargeFormatter)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "bcui_newPercentChargeFormatter");
    v4 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
    v5 = self->_percentChargeFormatter;
    self->_percentChargeFormatter = v4;

    percentChargeFormatter = self->_percentChargeFormatter;
  }
  return percentChargeFormatter;
}

- (id)_percentChargeString:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[BCUIRingItemView _lazyPercentChargeFormatter](self, "_lazyPercentChargeFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isPercentSymbolEnabledForRingItemStyle:(int64_t)a3 andContentSizeCategory:(id)a4
{
  return a3 != 1
      || UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a4, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8]) == NSOrderedAscending;
}

- (double)ringScale
{
  return self->_ringScale;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_transitionCoordinator);
}

- (int64_t)ringItemViewStyle
{
  return self->_ringItemViewStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_percentChargeFormatter, 0);
  objc_storeStrong((id *)&self->_chargeLabel, 0);
  objc_storeStrong((id *)&self->_chargeRing, 0);
}

@end
