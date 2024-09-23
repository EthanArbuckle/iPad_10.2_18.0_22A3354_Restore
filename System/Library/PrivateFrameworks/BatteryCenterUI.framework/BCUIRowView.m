@implementation BCUIRowView

+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  return UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;
}

- (BOOL)isSeparatorVisible
{
  return self->_separator != 0;
}

- (void)setSeparatorVisible:(BOOL)a3
{
  _BOOL4 v3;
  UIView *separator;

  v3 = a3;
  if (-[BCUIRowView isSeparatorVisible](self, "isSeparatorVisible") != a3)
  {
    if (v3)
    {
      -[BCUIRowView _configureSeparatorIfNecessary](self, "_configureSeparatorIfNecessary");
    }
    else
    {
      -[UIView removeFromSuperview](self->_separator, "removeFromSuperview");
      separator = self->_separator;
      self->_separator = 0;

    }
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPercentCharge:(int64_t)a3
{
  if (!self->_empty && self->_percentCharge != a3)
  {
    self->_percentCharge = a3;
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCharging:(BOOL)a3
{
  if (!self->_empty && self->_charging != a3)
  {
    self->_charging = a3;
    -[BCUIRowView _configureBatteryViewIfNecessary](self, "_configureBatteryViewIfNecessary");
    -[_UIStaticBatteryView setShowsInlineChargingIndicator:](self->_batteryView, "setShowsInlineChargingIndicator:", self->_charging);
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLowCharge:(BOOL)a3
{
  uint64_t v4;

  if (!self->_empty && self->_lowCharge != a3)
  {
    self->_lowCharge = a3;
    if (a3)
      v4 = 2;
    else
      v4 = 1;
    -[BCUIRowView _configureBatteryViewIfNecessary](self, "_configureBatteryViewIfNecessary");
    -[_UIStaticBatteryView setLowBatteryMode:](self->_batteryView, "setLowBatteryMode:", v4);
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  if (!self->_empty && self->_lowPowerModeEnabled != a3)
  {
    self->_lowPowerModeEnabled = a3;
    -[BCUIRowView _configureBatteryViewIfNecessary](self, "_configureBatteryViewIfNecessary");
    -[_UIStaticBatteryView setSaverModeActive:](self->_batteryView, "setSaverModeActive:", self->_lowPowerModeEnabled);
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGlyph:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (!self->_empty && self->_glyph != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_glyph, a3);
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setScaleFactor:(double)a3
{
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setName:(id)a3
{
  id v5;
  BOOL v6;
  id v7;

  v5 = a3;
  if (!self->_empty)
  {
    v7 = v5;
    v6 = -[NSString isEqualToString:](self->_name, "isEqualToString:", v5);
    v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->_name, a3);
      -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
      v5 = v7;
    }
  }

}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_empty = a3;
    -[BCUIRowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BCUIRowView)init
{
  BCUIRowView *v2;
  BCUIRowView *v3;
  _QWORD v5[4];
  BCUIRowView *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCUIRowView;
  v2 = -[BCUIRowView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __19__BCUIRowView_init__block_invoke;
    v5[3] = &unk_1E9418270;
    v6 = v2;
    -[UIView observeContentSizeCategoryChange:](v6, "observeContentSizeCategoryChange:", v5);

  }
  return v3;
}

uint64_t __19__BCUIRowView_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCUIRowView;
  -[BCUIRowView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[BCUIRowView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCUIRowView _updateVisualStylingWithProvidersFromStylingProvider:](self, "_updateVisualStylingWithProvidersFromStylingProvider:", v3);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCUIRowView;
  -[BCUIRowView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[BCUIRowView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BCUIRowView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIRowView _updateVisualStylingWithProvidersFromStylingProvider:](self, "_updateVisualStylingWithProvidersFromStylingProvider:", v4);

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  UIImageView *glyphImageView;
  UILabel *percentChargeLabel;
  UILabel *nameLabel;
  _UIStaticBatteryView *batteryView;
  _UIStaticBatteryView *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIImageView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UILabel *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  UILabel *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  _QWORD v33[9];
  _QWORD v34[9];
  _QWORD v35[9];
  _QWORD v36[9];
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v37.receiver = self;
  v37.super_class = (Class)BCUIRowView;
  -[BCUIRowView layoutSubviews](&v37, sel_layoutSubviews);
  -[BCUIRowView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_empty)
  {
    -[UIImageView removeFromSuperview](self->_glyphImageView, "removeFromSuperview");
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = 0;

    -[UILabel removeFromSuperview](self->_percentChargeLabel, "removeFromSuperview");
    percentChargeLabel = self->_percentChargeLabel;
    self->_percentChargeLabel = 0;

    -[UILabel removeFromSuperview](self->_nameLabel, "removeFromSuperview");
    nameLabel = self->_nameLabel;
    self->_nameLabel = 0;

    batteryView = self->_batteryView;
LABEL_3:
    -[_UIStaticBatteryView removeFromSuperview](batteryView, "removeFromSuperview");
    v9 = self->_batteryView;
    self->_batteryView = 0;

    goto LABEL_4;
  }
  if (self->_glyph)
  {
    -[BCUIRowView _configureGlyphImageViewIfNecessary](self, "_configureGlyphImageViewIfNecessary");
    -[BCUIRowView _updateGlyphImageViewIfNecessary:](self, "_updateGlyphImageViewIfNecessary:", v4);
    -[BCUIRowView _glyphImageViewFrameForContentSizeCategory:](self, "_glyphImageViewFrameForContentSizeCategory:", v4);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    if (!CGRectIsNull(v38))
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __29__BCUIRowView_layoutSubviews__block_invoke;
      v36[3] = &unk_1E94182C0;
      v36[4] = self;
      *(CGFloat *)&v36[5] = x;
      *(CGFloat *)&v36[6] = y;
      *(CGFloat *)&v36[7] = width;
      *(CGFloat *)&v36[8] = height;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v36);
    }
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_glyphImageView, "removeFromSuperview");
    v14 = self->_glyphImageView;
    self->_glyphImageView = 0;

  }
  -[BCUIRowView _configurePercentChargeLabelIfNecessary](self, "_configurePercentChargeLabelIfNecessary");
  -[BCUIRowView _updatePercentChargeLabelIfNecessary:](self, "_updatePercentChargeLabelIfNecessary:", v4);
  -[BCUIRowView _percentChargeLabelFrameForContentSizeCategory:](self, "_percentChargeLabelFrameForContentSizeCategory:", v4);
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  if (self->_percentCharge)
  {
    if (!CGRectIsNull(*(CGRect *)&v15))
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __29__BCUIRowView_layoutSubviews__block_invoke_2;
      v35[3] = &unk_1E94182C0;
      v35[4] = self;
      *(double *)&v35[5] = v19;
      *(double *)&v35[6] = v20;
      *(double *)&v35[7] = v21;
      *(double *)&v35[8] = v22;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v35);
    }
  }
  else
  {
    -[UILabel removeFromSuperview](self->_percentChargeLabel, "removeFromSuperview");
    v23 = self->_percentChargeLabel;
    self->_percentChargeLabel = 0;

  }
  if (self->_name)
  {
    -[BCUIRowView _configureNameLabelIfNecessary](self, "_configureNameLabelIfNecessary");
    -[BCUIRowView _updateNameLabelIfNecessary:](self, "_updateNameLabelIfNecessary:", v4);
    -[BCUIRowView _nameLabelFrameForContentSize:percentChargeLabelFrame:](self, "_nameLabelFrameForContentSize:percentChargeLabelFrame:", v4, v19, v20, v21, v22);
    v24 = v39.origin.x;
    v25 = v39.origin.y;
    v26 = v39.size.width;
    v27 = v39.size.height;
    if (!CGRectIsNull(v39))
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __29__BCUIRowView_layoutSubviews__block_invoke_3;
      v34[3] = &unk_1E94182C0;
      v34[4] = self;
      *(CGFloat *)&v34[5] = v24;
      *(CGFloat *)&v34[6] = v25;
      *(CGFloat *)&v34[7] = v26;
      *(CGFloat *)&v34[8] = v27;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v34);
    }
    -[BCUIRowView _updateNameLabelIfNecessary:](self, "_updateNameLabelIfNecessary:", v4);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_nameLabel, "removeFromSuperview");
    v28 = self->_nameLabel;
    self->_nameLabel = 0;

  }
  -[BCUIRowView _configureBatteryViewIfNecessary](self, "_configureBatteryViewIfNecessary");
  if (!self->_batteryView)
  {
    batteryView = 0;
    goto LABEL_3;
  }
  -[BCUIRowView _updateBatteryViewIfNeccessary](self, "_updateBatteryViewIfNeccessary");
  -[BCUIRowView _batteryViewFrameforContentSize:percentChargeLabelFrame:](self, "_batteryViewFrameforContentSize:percentChargeLabelFrame:", v4, v19, v20, v21, v22);
  v29 = v40.origin.x;
  v30 = v40.origin.y;
  v31 = v40.size.width;
  v32 = v40.size.height;
  if (!CGRectIsNull(v40))
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __29__BCUIRowView_layoutSubviews__block_invoke_4;
    v33[3] = &unk_1E94182C0;
    v33[4] = self;
    *(CGFloat *)&v33[5] = v29;
    *(CGFloat *)&v33[6] = v30;
    *(CGFloat *)&v33[7] = v31;
    *(CGFloat *)&v33[8] = v32;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v33);
  }
LABEL_4:
  -[BCUIRowView _sepatorFrameForContentSize:](self, "_sepatorFrameForContentSize:", v4);
  -[UIView setFrame:](self->_separator, "setFrame:");

}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E941D9C0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSMutableDictionary *categoriesToVisualStylingProvider;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (v14)
  {
    -[BCUIRowView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (v8)
    {
      -[BCUIRowView _visualStylingProviderForCategory:](self, "_visualStylingProviderForCategory:", a4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 != v14)
      {
        -[BCUIRowView _stopAutomaticallyUpdatingVisualStylingForCategory:](self, "_stopAutomaticallyUpdatingVisualStylingForCategory:", a4);
        categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
        if (!categoriesToVisualStylingProvider)
        {
          v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v12 = self->_categoriesToVisualStylingProvider;
          self->_categoriesToVisualStylingProvider = v11;

          categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](categoriesToVisualStylingProvider, "setObject:forKey:", v14, v13);

        -[BCUIRowView _beginAutomaticallyUpdatingVisualStylingForCategory:](self, "_beginAutomaticallyUpdatingVisualStylingForCategory:", a4);
      }

    }
  }

}

- (void)_updateGlyphImageViewIfNecessary:(id)a3
{
  UIImage *v4;
  UIImage *glyph;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[UIImageView image](self->_glyphImageView, "image");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  glyph = self->_glyph;

  if (v4 != glyph)
  {
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", self->_glyph);
    -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 4);
    v6 = (void *)MEMORY[0x1E0DC1350];
    v7 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 4, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "_configurationWithHierarchicalColors:", MEMORY[0x1E0C9AA60]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationByApplyingConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setPreferredSymbolConfiguration:](self->_glyphImageView, "setPreferredSymbolConfiguration:", v13);
    -[UIImageView pl_performCrossFadeIfNecessary](self->_glyphImageView, "pl_performCrossFadeIfNecessary");

  }
}

- (void)_updatePercentChargeLabelIfNecessary:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4A98];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFontForTextStyle:compatibleWithTraitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pointSize");
  objc_msgSend(v7, "fontWithSize:", v8 * self->_scaleFactor);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_percentChargeLabel, "setFont:", v11);
  -[BCUIRowView _percentChargeString:](self, "_percentChargeString:", self->_percentCharge);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_percentChargeLabel, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v10, "isEqualToString:", v9);

  if ((v6 & 1) == 0)
  {
    -[UILabel setText:](self->_percentChargeLabel, "setText:", v9);
    -[UILabel pl_performCrossFadeIfNecessary](self->_percentChargeLabel, "pl_performCrossFadeIfNecessary");
  }

}

- (void)_updateNameLabelIfNecessary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFontForTextStyle:compatibleWithTraitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pointSize");
  objc_msgSend(v7, "fontWithSize:", v8 * self->_scaleFactor);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_nameLabel, "setFont:", v10);
  -[UILabel text](self->_nameLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "isEqualToString:", self->_name);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_nameLabel, "setText:", self->_name);
    -[UILabel pl_performCrossFadeIfNecessary](self->_nameLabel, "pl_performCrossFadeIfNecessary");
  }

}

- (void)_updateBatteryViewIfNeccessary
{
  -[_UIStaticBatteryView setChargePercent:](self->_batteryView, "setChargePercent:", (double)self->_percentCharge / 100.0);
}

- (CGRect)_glyphImageViewFrameForContentSizeCategory:(id)a3
{
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "isAX3PlusLayoutRequiredForContentSizeCategory:", v4);

  -[BCUIRowView bounds](self, "bounds");
  v10 = BCUI6x8ColumnWidthForBounds(v6, v7, v8, v9);
  -[BCUIRowView bounds](self, "bounds");
  Height = CGRectGetHeight(v19);
  if (v5)
    v12 = 80.0;
  else
    v12 = v10;
  if (v5)
    v13 = 0.0;
  else
    v13 = 8.0;
  -[UIImageView sizeThatFits:](self->_glyphImageView, "sizeThatFits:", v12, Height);
  BSRectWithSize();
  BSRectWithSize();
  if (-[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[BCUIRowView bounds](self, "bounds");
    v14 = CGRectGetWidth(v20) - v13;
  }
  -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 1, v14);
  UIRectCenteredIntegralRectScale();
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_percentChargeLabelFrameForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double Height;
  int v9;
  int v10;
  UILabel *percentChargeLabel;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UILabel *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  v4 = a3;
  -[BCUIRowView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BCUIRowView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
  }

  -[BCUIRowView bounds](self, "bounds");
  Height = CGRectGetHeight(v34);
  v9 = -[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v10 = objc_msgSend((id)objc_opt_class(), "isAX3PlusLayoutRequiredForContentSizeCategory:", v4);

  if (v10)
  {
    if ((v9 & 1) == 0)
      -[UILabel setTextAlignment:](self->_percentChargeLabel, "setTextAlignment:", 3);
    percentChargeLabel = self->_percentChargeLabel;
    -[BCUIRowView bounds](self, "bounds");
    -[UILabel sizeThatFits:](percentChargeLabel, "sizeThatFits:", CGRectGetWidth(v35) + -80.0 + -8.0, Height * 0.5 + -16.0);
    if (v9)
    {
      -[BCUIRowView bounds](self, "bounds");
      CGRectGetWidth(v36);
    }
    -[BCUIRowView bounds](self, "bounds");
    CGRectGetWidth(v37);
    UIRectCenteredYInRectScale();
  }
  else
  {
    -[BCUIRowView bounds](self, "bounds");
    v16 = BCUI6x8ColumnWidthForBounds(v12, v13, v14, v15);
    BSRectWithSize();
    v18 = v17;
    v20 = v19;
    v22 = v21;
    if (v9)
    {
      v23 = v16 + 16.0;
    }
    else
    {
      -[BCUIRowView bounds](self, "bounds");
      v23 = CGRectGetWidth(v38) + -16.0 + v16 * -2.0;
    }
    v28 = self->_percentChargeLabel;
    -[BCUIRowView bounds](self, "bounds");
    -[UILabel sizeThatFits:](v28, "sizeThatFits:", v29, v30);
    v32 = v31;
    v39.origin.x = v23;
    v39.origin.y = v18;
    v39.size.width = v20;
    v39.size.height = v22;
    if (v32 <= CGRectGetWidth(v39))
      v33 = 1;
    else
      v33 = v9;
    if ((v33 & 1) == 0)
    {
      v40.origin.x = v23;
      v40.origin.y = v18;
      v40.size.width = v20;
      v40.size.height = v22;
      CGRectGetWidth(v40);
    }
    UIRectIntegralWithScale();
  }
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_nameLabelFrameForContentSize:(id)a3 percentChargeLabelFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[BCUIRowView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[BCUIRowView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
  }

  -[BCUIRowView bounds](self, "bounds");
  CGRectGetHeight(v22);
  v13 = objc_msgSend((id)objc_opt_class(), "isAX3PlusLayoutRequiredForContentSizeCategory:", v9);

  -[BCUIRowView bounds](self, "bounds");
  if (v13)
  {
    CGRectGetWidth(*(CGRect *)&v14);
    BSRectWithSize();
    if (-[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[BCUIRowView bounds](self, "bounds");
      CGRectGetWidth(v23);
    }
    -[BCUIRowView bounds](self, "bounds");
    CGRectGetWidth(v27);
  }
  else
  {
    BCUI6x8ColumnWidthForBounds(v14, v15, v16, v17);
    BSRectWithSize();
    if (-[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[BCUIRowView bounds](self, "bounds");
      CGRectGetWidth(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      CGRectGetMaxX(v25);
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      CGRectGetMaxX(v26);
    }
    else
    {
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      CGRectGetMinX(v28);
    }
  }
  UIRectIntegralWithScale();
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_batteryViewFrameforContentSize:(id)a3 percentChargeLabelFrame:(CGRect)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  int v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat rect;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;

  v5 = a3;
  -[BCUIRowView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BCUIRowView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
  }

  -[BCUIRowView bounds](self, "bounds");
  CGRectGetHeight(v40);
  -[_UIStaticBatteryView intrinsicContentSize](self->_batteryView, "intrinsicContentSize");
  BSRectWithSize();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[BCUIRowView bounds](self, "bounds");
  v21 = BCUI6x8ColumnWidthForBounds(v17, v18, v19, v20);
  v22 = objc_msgSend((id)objc_opt_class(), "isAX3PlusLayoutRequiredForContentSizeCategory:", v5);

  if (v22)
  {
    if (-[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[BCUIRowView bounds](self, "bounds");
      CGRectGetWidth(v41);
    }
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    rect = v10;
    BSRectWithSize();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = 8.0;
    if ((-[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
    {
      -[BCUIRowView bounds](self, "bounds");
      v29 = CGRectGetWidth(v42) + -8.0 - v21;
    }
    v30 = -[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v31 = v29;
    v32 = v24;
    v33 = v26;
    v34 = v28;
    if (v30)
    {
      CGRectGetMaxX(*(CGRect *)&v31);
      v43.origin.x = rect;
      v43.origin.y = v12;
      v43.size.width = v14;
      v43.size.height = v16;
      CGRectGetWidth(v43);
    }
    else
    {
      CGRectGetMinX(*(CGRect *)&v31);
    }
    UIRectCenteredYInRectScale();
  }
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)_sepatorFrameForContentSize:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  if (self->_separator)
  {
    v4 = a3;
    -[BCUIRowView bounds](self, "bounds");
    BCUI6x8ColumnWidthForBounds(v5, v6, v7, v8);
    objc_msgSend((id)objc_opt_class(), "isAX3PlusLayoutRequiredForContentSizeCategory:", v4);

    -[BCUIRowView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[BCUIRowView window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
    }

    -[BCUIRowView bounds](self, "bounds");
    CGRectGetWidth(v16);
    -[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[BCUIRowView bounds](self, "bounds");
    CGRectGetHeight(v17);
    UIRectIntegralWithScale();
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_configureGlyphImageViewIfNecessary
{
  UIImageView *v3;
  UIImageView *glyphImageView;
  id v5;

  if (!self->_glyphImageView)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = v3;

    -[BCUIRowView addSubview:](self, "addSubview:", self->_glyphImageView);
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProvider, "objectForKey:", &unk_1E941D928);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "automaticallyUpdateView:withStyle:", self->_glyphImageView, 0);

  }
}

- (void)_configureNameLabelIfNecessary
{
  UILabel *v3;
  UILabel *nameLabel;
  UILabel *v5;
  uint64_t v6;

  if (!self->_nameLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    nameLabel = self->_nameLabel;
    self->_nameLabel = v3;

    v5 = self->_nameLabel;
    if (-[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v6 = 2;
    else
      v6 = 0;
    -[UILabel setTextAlignment:](v5, "setTextAlignment:", v6);
    -[UILabel setLineBreakMode:](self->_nameLabel, "setLineBreakMode:", 4);
    -[BCUIRowView addSubview:](self, "addSubview:", self->_nameLabel);
  }
}

- (void)_configurePercentChargeLabelIfNecessary
{
  UILabel *v3;
  UILabel *percentChargeLabel;
  UILabel *v5;
  uint64_t v6;
  id v7;

  if (!self->_percentChargeLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    percentChargeLabel = self->_percentChargeLabel;
    self->_percentChargeLabel = v3;

    v5 = self->_percentChargeLabel;
    if (-[BCUIRowView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v6 = 2;
    else
      v6 = 0;
    -[UILabel setTextAlignment:](v5, "setTextAlignment:", v6);
    -[UILabel setLineBreakMode:](self->_percentChargeLabel, "setLineBreakMode:", 2);
    -[BCUIRowView addSubview:](self, "addSubview:", self->_percentChargeLabel);
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProvider, "objectForKey:", &unk_1E941D928);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_percentChargeLabel, 0);

  }
}

- (void)_configureBatteryViewIfNecessary
{
  _UIStaticBatteryView *v3;
  _UIStaticBatteryView *batteryView;

  if (!self->_batteryView)
  {
    v3 = (_UIStaticBatteryView *)objc_alloc_init(MEMORY[0x1E0DC4378]);
    batteryView = self->_batteryView;
    self->_batteryView = v3;

    -[_UIStaticBatteryView setChargingState:](self->_batteryView, "setChargingState:", 1);
    -[BCUIRowView addSubview:](self, "addSubview:", self->_batteryView);
  }
}

- (void)_configureSeparatorIfNecessary
{
  UIView *v3;
  UIView *separator;
  UIView *v5;
  void *v6;
  id v7;

  if (!self->_separator)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separator = self->_separator;
    self->_separator = v3;

    v5 = self->_separator;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[BCUIRowView addSubview:](self, "addSubview:", self->_separator);
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProvider, "objectForKey:", &unk_1E941D940);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "automaticallyUpdateView:withStyle:", self->_separator, 5);

  }
}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  NSMutableDictionary *categoriesToVisualStylingProvider;
  void *v4;
  void *v5;

  categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProvider, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
    -[BCUIRowView requiredVisualStyleCategories](self, "requiredVisualStyleCategories", 0);
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
          -[BCUIRowView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v11, objc_msgSend(v10, "integerValue"));

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_beginAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  NSMutableDictionary *categoriesToVisualStylingProvider;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *separator;
  uint64_t v9;

  categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
  if (categoriesToVisualStylingProvider)
  {
    if (a3 == 2)
    {
      if (!self->_separator)
        return;
      -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProvider, "objectForKey:", &unk_1E941D940);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      separator = (UIImageView *)self->_separator;
      v9 = 5;
      goto LABEL_10;
    }
    if (a3 == 1)
    {
      if (self->_percentChargeLabel)
      {
        -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProvider, "objectForKey:", &unk_1E941D928);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "automaticallyUpdateView:withStyle:", self->_percentChargeLabel, 0);

        -[BCUIRowView setNeedsDisplay](self, "setNeedsDisplay");
      }
      if (self->_glyphImageView)
      {
        -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProvider, "objectForKey:", &unk_1E941D928);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        separator = self->_glyphImageView;
        v9 = 0;
LABEL_10:
        objc_msgSend(v6, "automaticallyUpdateView:withStyle:", separator, v9);

        -[BCUIRowView setNeedsDisplay](self, "setNeedsDisplay");
      }
    }
  }
}

- (void)_stopAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  NSMutableDictionary *categoriesToVisualStylingProvider;
  void *v5;
  _QWORD *p_separator;
  void *v7;
  void *v8;

  categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
  if (categoriesToVisualStylingProvider)
  {
    if (a3 == 2)
    {
      p_separator = &self->_separator;
      if (!self->_separator)
        return;
      v7 = &unk_1E941D940;
      goto LABEL_10;
    }
    if (a3 == 1)
    {
      if (self->_percentChargeLabel)
      {
        -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProvider, "objectForKey:", &unk_1E941D928);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stopAutomaticallyUpdatingView:", self->_percentChargeLabel);

        -[BCUIRowView setNeedsDisplay](self, "setNeedsDisplay");
      }
      p_separator = &self->_glyphImageView;
      if (self->_glyphImageView)
      {
        categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
        v7 = &unk_1E941D928;
LABEL_10:
        -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProvider, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stopAutomaticallyUpdatingView:", *p_separator);

        -[BCUIRowView setNeedsDisplay](self, "setNeedsDisplay");
      }
    }
  }
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

  -[BCUIRowView _lazyPercentChargeFormatter](self, "_lazyPercentChargeFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)percentCharge
{
  return self->_percentCharge;
}

- (BOOL)isCharging
{
  return self->_charging;
}

- (BOOL)isLowCharge
{
  return self->_lowCharge;
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

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_percentChargeFormatter, 0);
  objc_storeStrong((id *)&self->_percentChargeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end
