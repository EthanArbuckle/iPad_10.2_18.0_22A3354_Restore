@implementation CCUILabeledRoundButton

- (CCUILabeledRoundButton)initWithHighlightColor:(id)a3 useLightStyle:(BOOL)a4
{
  id v6;
  CCUILabeledRoundButton *v7;
  CCUILabeledRoundButton *v8;
  uint64_t v9;
  UIColor *highlightColor;
  UILabel *v11;
  UILabel *titleLabel;
  UILabel *v13;
  void *v14;
  double v15;
  UILabel *v16;
  UILabel *subtitleLabel;
  UILabel *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CCUILabeledRoundButton;
  v7 = -[CCUILabeledRoundButton initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_glyphScale = 1.0;
    v9 = objc_msgSend(v6, "copy");
    highlightColor = v8->_highlightColor;
    v8->_highlightColor = (UIColor *)v9;

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v11;

    -[CCUILabeledRoundButton addSubview:](v8, "addSubview:", v8->_titleLabel);
    -[UILabel setTextAlignment:](v8->_titleLabel, "setTextAlignment:", 1);
    v13 = v8->_titleLabel;
    -[CCUILabeledRoundButton title](v8, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v13, "setText:", v14);

    -[UILabel setClipsToBounds:](v8->_titleLabel, "setClipsToBounds:", 0);
    LODWORD(v15) = 1055286886;
    -[UILabel _setHyphenationFactor:](v8->_titleLabel, "_setHyphenationFactor:", v15);
    -[UILabel setNumberOfLines:](v8->_titleLabel, "setNumberOfLines:", 2);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v8->_subtitleLabel;
    v8->_subtitleLabel = v16;

    -[CCUILabeledRoundButton addSubview:](v8, "addSubview:", v8->_subtitleLabel);
    -[UILabel setTextAlignment:](v8->_subtitleLabel, "setTextAlignment:", 1);
    v18 = v8->_subtitleLabel;
    -[CCUILabeledRoundButton subtitle](v8, "subtitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v18, "setText:", v19);

    -[UILabel setClipsToBounds:](v8->_subtitleLabel, "setClipsToBounds:", 0);
    LODWORD(v20) = 1055286886;
    -[UILabel _setHyphenationFactor:](v8->_subtitleLabel, "_setHyphenationFactor:", v20);
    -[UILabel setNumberOfLines:](v8->_subtitleLabel, "setNumberOfLines:", 2);
    if (!a4)
    {
      -[UILabel controlCenterApplyPrimaryContentShadow](v8->_titleLabel, "controlCenterApplyPrimaryContentShadow");
      -[UILabel controlCenterApplyPrimaryContentShadow](v8->_subtitleLabel, "controlCenterApplyPrimaryContentShadow");
    }
    v8->_contentSizeCategoryThreshold = (NSString *)*MEMORY[0x1E0DC4900];
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)-[CCUILabeledRoundButton registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v22, sel__contentSizeCategoryDidChange);

    -[CCUILabeledRoundButton _contentSizeCategoryDidChange](v8, "_contentSizeCategoryDidChange");
  }

  return v8;
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  return -[CCUILabeledRoundButton initWithGlyphImage:highlightColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:useLightStyle:", a3, a4, 0);
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  return -[CCUILabeledRoundButton initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", a3, a4, 0, a5);
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5
{
  return -[CCUILabeledRoundButton initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", a3, a4, a5, 0);
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  CCUILabeledRoundButton *v14;
  CCUILabeledRoundButton *v15;
  uint64_t v16;
  UIColor *highlightTintColor;
  CCUIRoundButton *v18;
  CCUIRoundButton *buttonView;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[CCUILabeledRoundButton initWithHighlightColor:useLightStyle:](self, "initWithHighlightColor:useLightStyle:", v12, v6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_glyphImage, a3);
    v16 = objc_msgSend(v13, "copy");
    highlightTintColor = v15->_highlightTintColor;
    v15->_highlightTintColor = (UIColor *)v16;

    v18 = -[CCUIRoundButton initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:]([CCUIRoundButton alloc], "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", v11, v12, v13, v6);
    buttonView = v15->_buttonView;
    v15->_buttonView = v18;

    -[CCUIRoundButton addTarget:action:forControlEvents:](v15->_buttonView, "addTarget:action:forControlEvents:", v15, sel_buttonTapped_, 64);
    -[CCUILabeledRoundButton addSubview:](v15, "addSubview:", v15->_buttonView);
  }

  return v15;
}

- (CCUILabeledRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  return -[CCUILabeledRoundButton initWithGlyphPackageDescription:highlightColor:useLightStyle:](self, "initWithGlyphPackageDescription:highlightColor:useLightStyle:", a3, a4, 0);
}

- (CCUILabeledRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  CCUILabeledRoundButton *v11;
  CCUILabeledRoundButton *v12;
  CCUIRoundButton *v13;
  CCUIRoundButton *buttonView;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = -[CCUILabeledRoundButton initWithHighlightColor:useLightStyle:](self, "initWithHighlightColor:useLightStyle:", v10, v5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_glyphPackageDescription, a3);
    v13 = -[CCUIRoundButton initWithGlyphPackageDescription:highlightColor:useLightStyle:]([CCUIRoundButton alloc], "initWithGlyphPackageDescription:highlightColor:useLightStyle:", v9, v10, v5);
    buttonView = v12->_buttonView;
    v12->_buttonView = v13;

    -[CCUIRoundButton addTarget:action:forControlEvents:](v12->_buttonView, "addTarget:action:forControlEvents:", v12, sel_buttonTapped_, 64);
    -[CCUILabeledRoundButton addSubview:](v12, "addSubview:", v12->_buttonView);
  }

  return v12;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CCUILabeledRoundButton;
  -[CCUILabeledRoundButton layoutSubviews](&v14, sel_layoutSubviews);
  -[CCUILabeledRoundButton _updateFonts](self, "_updateFonts");
  -[CCUILabeledRoundButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[CCUILabeledRoundButton labelsVisible](self, "labelsVisible");
  v8 = v7;
  if (self->_dynamicLayoutEnabled && v7)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v4, v6);
    v10 = v9;
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v4, v6);
    v12 = v6 - (v10 + v11 + 8.0);
  }
  else
  {
    v12 = v6;
  }
  -[CCUIRoundButton sizeThatFits:](self->_buttonView, "sizeThatFits:", v4, v12);
  BSRectWithSize();
  UIRectCenteredXInRectScale();
  -[CCUIRoundButton setFrame:](self->_buttonView, "setFrame:", 0);
  v13 = 0.0;
  if (v8)
  {
    -[CCUILabeledRoundButton _setupLabelsBounds](self, "_setupLabelsBounds");
    v13 = 1.0;
  }
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v13);
  -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", v13);
  -[CCUILabeledRoundButton _layoutLabels](self, "_layoutLabels");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUILabeledRoundButton;
  -[CCUILabeledRoundButton didMoveToWindow](&v8, sel_didMoveToWindow);
  -[CCUILabeledRoundButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CCUILabeledRoundButton visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUILabeledRoundButton _visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:](self, "_visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:", v4, 1, v7);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CCUIRoundButton sizeThatFits:](self->_buttonView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  if (-[CCUILabeledRoundButton labelsVisible](self, "labelsVisible"))
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
    v11 = v10;
    v13 = v12;
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, height);
    v9 = v9 + v13 + v15 + 8.0;
    if (v11 >= v14)
      v14 = v11;
    if (v7 >= v14)
      v7 = v14;
  }
  v16 = v7;
  v17 = v9;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CCUILabeledRoundButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHighlightColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_highlightColor, a3);
  v5 = a3;
  -[CCUIRoundButton setHighlightColor:](self->_buttonView, "setHighlightColor:", v5);

}

- (void)setGlyphImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphImage, a3);
  v5 = a3;
  -[CCUIRoundButton setGlyphImage:](self->_buttonView, "setGlyphImage:", v5);

}

- (void)setGlyphPackageDescription:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
  v5 = a3;
  -[CCUIRoundButton setGlyphPackageDescription:](self->_buttonView, "setGlyphPackageDescription:", v5);

}

- (void)setGlyphScale:(double)a3
{
  self->_glyphScale = a3;
  -[CCUIRoundButton setGlyphScale:](self->_buttonView, "setGlyphScale:");
}

- (void)setGlyphState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphState, a3);
  v5 = a3;
  -[CCUIRoundButton setGlyphState:](self->_buttonView, "setGlyphState:", v5);

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[UILabel setText:](self->_titleLabel, "setText:", v4);
  -[CCUILabeledRoundButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *subtitle;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  -[UILabel setText:](self->_subtitleLabel, "setText:", v4);
  -[CCUILabeledRoundButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLabelsVisible:(BOOL)a3
{
  if (self->_labelsVisible != a3)
  {
    self->_labelsVisible = a3;
    -[CCUILabeledRoundButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUseAlternateBackground:(BOOL)a3
{
  self->_useAlternateBackground = a3;
  -[CCUIRoundButton setUseAlternateBackground:](self->_buttonView, "setUseAlternateBackground:");
}

- (void)setContentSizeCategoryThreshold:(id)a3
{
  if (self->_contentSizeCategoryThreshold != a3)
  {
    self->_contentSizeCategoryThreshold = (NSString *)a3;
    -[CCUILabeledRoundButton _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
  }
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  if (self->_dynamicLayoutEnabled != a3)
  {
    self->_dynamicLayoutEnabled = a3;
    -[CCUIRoundButton setDynamicLayoutEnabled:](self->_buttonView, "setDynamicLayoutEnabled:");
    -[CCUILabeledRoundButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  objc_super v15;

  -[CCUILabeledRoundButton requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v7)
    return 0;
  categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CCUILabeledRoundButton;
    -[CCUILabeledRoundButton visualStylingProviderForCategory:](&v15, sel_visualStylingProviderForCategory_, a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v12;

  return v14;
}

- (NSArray)requiredVisualStyleCategories
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1E8E2BBF0, 0);
  -[CCUIRoundButton requiredVisualStyleCategories](self->_buttonView, "requiredVisualStyleCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[CCUILabeledRoundButton requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v17)
    {
LABEL_10:

      goto LABEL_11;
    }
    v12 = self->_categoriesToVisualStylingProviders;
    if (v17)
    {
      if (!v12)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v14 = self->_categoriesToVisualStylingProviders;
        self->_categoriesToVisualStylingProviders = v13;

        v12 = self->_categoriesToVisualStylingProviders;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v17, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v16);

      if (-[NSMutableDictionary count](self->_categoriesToVisualStylingProviders, "count"))
        goto LABEL_9;
      v15 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = 0;
    }

LABEL_9:
    -[CCUILabeledRoundButton _visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:](self, "_visualStylingProvider:didChangeForCategory:outgoingVisualStylingProvider:", v17, a4, v11);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_setupLabelsBounds
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  _QWORD v18[9];
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[CCUILabeledRoundButton bounds](self, "bounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v19), 0.0);
  v8 = v7;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v17 = CGRectGetWidth(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", CGRectGetWidth(v21), 0.0);
  v10 = v9;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v11 = CGRectGetWidth(v22);
  -[UILabel font](self->_titleLabel, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_bodyLeading");
  v14 = v13;

  if (v14 == 0.0 || (uint64_t)vcvtmd_s64_f64(v8 / v14) < 2)
  {
    if (-[UILabel numberOfLines](self->_subtitleLabel, "numberOfLines", *(_QWORD *)&v17) == 1)
    {
      -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", CGRectGetWidth(v23), 0.0);
      v10 = v16;
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v11 = CGRectGetWidth(v24);
    }
  }
  else
  {
    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, height);
    v10 = v15;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__CCUILabeledRoundButton__setupLabelsBounds__block_invoke;
  v18[3] = &unk_1E8E209B0;
  v18[4] = self;
  *(CGFloat *)&v18[5] = v17;
  *(double *)&v18[6] = v8;
  *(CGFloat *)&v18[7] = v11;
  v18[8] = v10;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18, *(_QWORD *)&v17);
}

uint64_t __44__CCUILabeledRoundButton__setupLabelsBounds__block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setBounds:", *MEMORY[0x1E0C9D538], v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setBounds:", v2, v3, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_layoutLabels
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  UILabel *titleLabel;
  void *v13;
  UILabel *subtitleLabel;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[CCUILabeledRoundButton buttonView](self, "buttonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel bounds](self->_titleLabel, "bounds");
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  CGRectGetMidX(v15);
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  CGRectGetMaxY(v16);
  titleLabel = self->_titleLabel;
  -[UILabel bounds](titleLabel, "bounds");
  UIRectCenteredAboutPointScale();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  -[UILabel bounds](self->_subtitleLabel, "bounds");
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  CGRectGetMidX(v17);
  -[UILabel frame](self->_titleLabel, "frame");
  CGRectGetMaxY(v18);
  -[UILabel font](self->_subtitleLabel, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_leading");

  subtitleLabel = self->_subtitleLabel;
  -[UILabel bounds](subtitleLabel, "bounds");
  UIRectCenteredAboutPointScale();
  -[UILabel setFrame:](subtitleLabel, "setFrame:");
}

- (void)_contentSizeCategoryDidChange
{
  -[CCUILabeledRoundButton _updateFonts](self, "_updateFonts");
  -[CCUILabeledRoundButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFonts
{
  NSString *v3;
  NSComparisonResult v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 IsAccessibilityCategory;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;

  -[CCUILabeledRoundButton traitCollection](self, "traitCollection");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = UIContentSizeCategoryCompareToCategory(v3, self->_contentSizeCategoryThreshold);
  if (v4 == NSOrderedDescending)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", self->_contentSizeCategoryThreshold);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v18;
  }
  v19 = v6;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A98], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v7, "pointSize");
  objc_msgSend(v8, "boldSystemFontOfSize:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
  if (v4 == NSOrderedDescending && IsAccessibilityCategory)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4B50], v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v12, "pointSize");
    objc_msgSend(v13, "boldSystemFontOfSize:");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v12, "pointSize");
    objc_msgSend(v15, "systemFontOfSize:", v16 + -2.0);
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v17;
    v9 = (void *)v14;
  }
  -[UILabel setFont:](self->_titleLabel, "setFont:", v9);
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v7);

}

- (BOOL)_shouldUseLargeTextLayout
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  -[CCUILabeledRoundButton traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingVisualStylingProvider:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  v8 = a5;
  v9 = v8;
  if (a4 == 1)
  {
    objc_msgSend(v8, "stopAutomaticallyUpdatingView:", self->_titleLabel);
    objc_msgSend(v9, "stopAutomaticallyUpdatingView:", self->_subtitleLabel);
    objc_msgSend(v13, "automaticallyUpdateView:withStyle:", self->_titleLabel, 0);
    objc_msgSend(v13, "automaticallyUpdateView:withStyle:", self->_subtitleLabel, 0);
  }
  -[CCUIRoundButton requiredVisualStyleCategories](self->_buttonView, "requiredVisualStyleCategories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (v12)
    -[CCUIRoundButton setVisualStylingProvider:forCategory:](self->_buttonView, "setVisualStylingProvider:forCategory:", v13, a4);
  -[CCUILabeledRoundButton setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)labelsVisible
{
  return self->_labelsVisible;
}

- (BOOL)useAlternateBackground
{
  return self->_useAlternateBackground;
}

- (CCUIRoundButton)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonView, a3);
}

- (NSString)contentSizeCategoryThreshold
{
  return self->_contentSizeCategoryThreshold;
}

- (BOOL)isDynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (UIColor)highlightTintColor
{
  return self->_highlightTintColor;
}

- (void)setHighlightTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightTintColor, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightTintColor, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
}

@end
