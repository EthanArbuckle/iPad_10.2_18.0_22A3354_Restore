@implementation CCUISensorAttributionSensorButton

- (CCUISensorAttributionSensorButton)initWithSensorActivityData:(id)a3
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CCUISensorAttributionSensorButton *v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  id *p_sensorActivityData;
  uint64_t v16;
  UILabel *descriptionLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  UIView *indicatorView;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v50;
  CGAffineTransform v51;
  objc_super v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CCUISensorAttributionSensorButton;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[CCUISensorAttributionSensorButton initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v8, v9, v10);
  if (v11)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("CCUISensorAttributionSensorButton.m"), 36, CFSTR("Need a nonnil sensorActivityData"));

    }
    -[CCUISensorAttributionSensorButton traitCollection](v11, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    p_sensorActivityData = (id *)&v11->_sensorActivityData;
    objc_storeStrong((id *)&v11->_sensorActivityData, a3);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    descriptionLabel = v11->_descriptionLabel;
    v11->_descriptionLabel = (UILabel *)v16;

    v18 = v11->_descriptionLabel;
    -[CCUISensorAttributionSensorButton _fontForTitleLabel](v11, "_fontForTitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    v20 = v11->_descriptionLabel;
    if (IsAccessibilityCategory)
    {
      -[UILabel setAdjustsFontForContentSizeCategory:](v20, "setAdjustsFontForContentSizeCategory:", 1);
      -[UILabel setNumberOfLines:](v11->_descriptionLabel, "setNumberOfLines:", 0);
    }
    else
    {
      -[UILabel setAdjustsFontSizeToFitWidth:](v20, "setAdjustsFontSizeToFitWidth:", 1);
    }
    -[UILabel setMinimumScaleFactor:](v11->_descriptionLabel, "setMinimumScaleFactor:", 0.5);
    v21 = v11->_descriptionLabel;
    CCUILocalizedDescriptionForSensorActivityData(v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v21, "setText:", v22);

    v23 = v11->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v23, "setTextColor:", v24);

    -[UILabel layer](v11->_descriptionLabel, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCompositingFilter:", v26);

    -[UILabel layer](v11->_descriptionLabel, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAllowsGroupBlending:", 0);

    -[CCUISensorAttributionSensorButton addSubview:](v11, "addSubview:", v11->_descriptionLabel);
    CCUIImageForSensorType(objc_msgSend(*p_sensorActivityData, "sensorType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v28);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTintColor:", v30);

    CGAffineTransformMakeScale(&v51, 0.5, 0.5);
    objc_msgSend(v29, "setTransform:", &v51);
    v31 = objc_alloc(MEMORY[0x1E0DC3890]);
    CCUIPlainCircleImage();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithImage:", v32);

    CCUIIndicatorColorForSensorType(objc_msgSend(*p_sensorActivityData, "sensorType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTintColor:", v34);

    v35 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v33, "bounds");
    v36 = objc_msgSend(v35, "initWithFrame:");
    indicatorView = v11->_indicatorView;
    v11->_indicatorView = (UIView *)v36;

    -[UIView addSubview:](v11->_indicatorView, "addSubview:", v33);
    -[UIView addSubview:](v11->_indicatorView, "addSubview:", v29);
    -[UIView sendSubviewToBack:](v11->_indicatorView, "sendSubviewToBack:", v33);
    -[UIView layer](v11->_indicatorView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scale");
    objc_msgSend(v38, "setRasterizationScale:");

    -[UIView layer](v11->_indicatorView, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShouldRasterize:", 1);

    objc_msgSend(v29, "frame");
    objc_msgSend(v33, "bounds");
    UIRectCenteredRect();
    objc_msgSend(v29, "setFrame:");
    v41 = (void *)MEMORY[0x1E0CB3940];
    CCUIIdentifierForSensorType(objc_msgSend(v6, "sensorType"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("%@-activity-data-button-%@"), v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionSensorButton setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", v44);

    -[CCUISensorAttributionSensorButton layer](v11, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAllowsGroupBlending:", 0);

    -[CCUISensorAttributionSensorButton addSubview:](v11, "addSubview:", v11->_indicatorView);
    objc_opt_self();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (id)-[CCUISensorAttributionSensorButton registerForTraitChanges:withAction:](v11, "registerForTraitChanges:withAction:", v47, sel__enableUserInteractionForLargeContentViewerIfNeeded);

  }
  return v11;
}

- (UIView)sensorIconView
{
  return self->_indicatorView;
}

- (unint64_t)sensorType
{
  return -[CCUISensorActivityData sensorType](self->_sensorActivityData, "sensorType");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  -[CCUISensorAttributionSensorButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  -[CCUISensorAttributionSensorButton _indicatorWidth](self, "_indicatorWidth");
  v10 = v9;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", width - v9 + -4.0, height);
  v12 = v11;
  v14 = v13;
  -[UILabel font](self->_descriptionLabel, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");
  v17 = v14 / v16;

  -[UIView frame](self->_indicatorView, "frame");
  v18 = CGRectGetHeight(v22);
  if (v14 >= v18)
    v18 = v14;
  if (height >= v18)
    v19 = height;
  else
    v19 = v18;
  if (height < v18)
    v18 = height;
  if (!IsAccessibilityCategory || v17 <= 1.5)
    v19 = v18;
  v20 = v10 + v12 + 4.0;
  result.height = v19;
  result.width = v20;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionSensorButton;
  -[CCUISensorAttributionSensorButton layoutSubviews](&v3, sel_layoutSubviews);
  -[CCUISensorAttributionSensorButton _layoutIndicatorView](self, "_layoutIndicatorView");
  -[CCUISensorAttributionSensorButton _layoutDescriptionLabel](self, "_layoutDescriptionLabel");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionSensorButton;
  -[CCUISensorAttributionSensorButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CCUISensorAttributionSensorButton _enableUserInteractionForLargeContentViewerIfNeeded](self, "_enableUserInteractionForLargeContentViewerIfNeeded");
}

- (void)_layoutIndicatorView
{
  UIView *indicatorView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGRect v21;
  CGRect v22;

  indicatorView = self->_indicatorView;
  if (indicatorView)
  {
    -[UIView frame](indicatorView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CCUISensorAttributionSensorButton bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "userInterfaceLayoutDirection") == 1)
    {
      v21.origin.x = v13;
      v21.origin.y = v15;
      v21.size.width = v17;
      v21.size.height = v19;
      CGRectGetMaxX(v21);
      v22.origin.x = v5;
      v22.origin.y = v7;
      v22.size.width = v9;
      v22.size.height = v11;
      CGRectGetWidth(v22);
    }

    UIRectCenteredYInRect();
    -[UIView setFrame:](self->_indicatorView, "setFrame:");
  }
}

- (void)_layoutDescriptionLabel
{
  UILabel *descriptionLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    -[UILabel frame](descriptionLabel, "frame");
    -[CCUISensorAttributionSensorButton bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    -[CCUISensorAttributionSensorButton _indicatorWidth](self, "_indicatorWidth");
    -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v5 - v8 + -4.0, v7);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceLayoutDirection") != 1)
      -[CCUISensorAttributionSensorButton _indicatorWidth](self, "_indicatorWidth");

    UIRectCenteredYInRect();
    -[UILabel setFrame:](self->_descriptionLabel, "setFrame:");
  }
}

- (double)_indicatorWidth
{
  CGRect v3;

  -[UIView frame](self->_indicatorView, "frame");
  return CGRectGetWidth(v3);
}

- (id)_fontForTitleLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4AB8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_enableUserInteractionForLargeContentViewerIfNeeded
{
  void *v3;
  NSString *v4;
  _BOOL8 IsAccessibilityCategory;

  -[CCUISensorAttributionSensorButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[CCUISensorAttributionSensorButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:", IsAccessibilityCategory);
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (id)largeContentTitle
{
  return -[UILabel text](self->_descriptionLabel, "text");
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (CGRect)cachedExpandedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedExpandedRect.origin.x;
  y = self->_cachedExpandedRect.origin.y;
  width = self->_cachedExpandedRect.size.width;
  height = self->_cachedExpandedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->_cachedExpandedRect = a3;
}

- (UIView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorView, a3);
}

- (CCUISensorActivityData)sensorActivityData
{
  return self->_sensorActivityData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorActivityData, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
