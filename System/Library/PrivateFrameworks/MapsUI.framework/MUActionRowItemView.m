@implementation MUActionRowItemView

+ (id)labelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)glyphFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MUActionRowItemView)initWithStyle:(int64_t)a3 useVibrancy:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  MUActionRowItemView *v10;
  MUActionRowItemView *v11;
  void *v12;
  uint64_t v13;
  id *p_vibrantView;
  MKVibrantView *vibrantView;
  void *backgroundView;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  MUEdgeLayout *v21;
  void *v22;
  id v23;
  uint64_t v24;
  UILabel *label;
  id v26;
  uint64_t v27;
  UIImageView *glyphImageView;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  UIView *accessoryContainerView;
  double v34;
  void *v35;
  void *v36;
  MUStackLayout *v37;
  id v38;
  void *v39;
  MUSizeLayout *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)MUActionRowItemView;
  v7 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[MUActionRowItemView initWithFrame:](&v45, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v9, v8);
  v11 = v10;
  if (!v10)
    return v11;
  v10->_style = a3;
  v10->_useVibrancy = a4;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUActionRowItemView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[MUActionRowItemView setEnabled:](v11, "setEnabled:", 1);
  -[MUActionRowItemView setPreferredMenuElementOrder:](v11, "setPreferredMenuElementOrder:", 2);
  -[MUActionRowItemView _setContinuousCornerRadius:](v11, "_setContinuousCornerRadius:", 10.0);
  if (v11->_useVibrancy)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC19E8]), "initWithFrame:", v7, v6, v9, v8);
    p_vibrantView = (id *)&v11->_vibrantView;
    vibrantView = v11->_vibrantView;
    v11->_vibrantView = (MKVibrantView *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.200000003);
    backgroundView = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantView contentView](v11->_vibrantView, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", backgroundView);

  }
  else
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v6, v9, v8);
    p_vibrantView = (id *)&v11->_backgroundView;
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = (UIView *)v18;
  }

  objc_msgSend(*p_vibrantView, "setUserInteractionEnabled:", 0);
  -[MUActionRowItemView addSubview:](v11, "addSubview:", *p_vibrantView);
  v19 = *p_vibrantView;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", v19, v11);
  objc_msgSend(v20, "addObject:", v21);
  if (MapKitIdiomIsMacCatalyst())
  {
    if (v11->_style != 1)
    {
LABEL_9:
      v23 = objc_alloc(MEMORY[0x1E0DC3990]);
      -[MUActionRowItemView bounds](v11, "bounds");
      v24 = objc_msgSend(v23, "initWithFrame:");
      label = v11->_label;
      v11->_label = (UILabel *)v24;

      -[UILabel setNumberOfLines:](v11->_label, "setNumberOfLines:", 1);
      -[UILabel setTextAlignment:](v11->_label, "setTextAlignment:", 1);
      -[UILabel setUserInteractionEnabled:](v11->_label, "setUserInteractionEnabled:", 0);
      -[UILabel setAccessibilityIdentifier:](v11->_label, "setAccessibilityIdentifier:", CFSTR("ActionRowItemLabel"));
      -[MUActionRowItemView addSubview:](v11, "addSubview:", v11->_label);
      goto LABEL_10;
    }
    -[UIView setAlpha:](v11->_backgroundView, "setAlpha:", 0.0);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v11, sel_handleHoverGesture_);
    -[MUActionRowItemView addGestureRecognizer:](v11, "addGestureRecognizer:", v22);

  }
  if (v11->_style != 1)
    goto LABEL_9;
LABEL_10:
  v26 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[MUActionRowItemView bounds](v11, "bounds");
  v27 = objc_msgSend(v26, "initWithFrame:");
  glyphImageView = v11->_glyphImageView;
  v11->_glyphImageView = (UIImageView *)v27;

  -[UIImageView setContentMode:](v11->_glyphImageView, "setContentMode:", 1);
  -[UIImageView setUserInteractionEnabled:](v11->_glyphImageView, "setUserInteractionEnabled:", 0);
  LODWORD(v29) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](v11->_glyphImageView, "setContentHuggingPriority:forAxis:", 0, v29);
  if (v11->_style == 1)
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, 13.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B60]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](v11->_glyphImageView, "setPreferredSymbolConfiguration:", v30);

  v31 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[MUActionRowItemView bounds](v11, "bounds");
  v32 = objc_msgSend(v31, "initWithFrame:");
  accessoryContainerView = v11->_accessoryContainerView;
  v11->_accessoryContainerView = (UIView *)v32;

  -[UIView setUserInteractionEnabled:](v11->_accessoryContainerView, "setUserInteractionEnabled:", 0);
  LODWORD(v34) = 1144750080;
  -[UIView setContentHuggingPriority:forAxis:](v11->_accessoryContainerView, "setContentHuggingPriority:forAxis:", 0, v34);
  -[MUActionRowItemView addSubview:](v11, "addSubview:", v11->_accessoryContainerView);
  if (v11->_style)
  {
    -[MUActionRowItemView setClipsToBounds:](v11, "setClipsToBounds:", 0);
  }
  else if (v11->_useVibrancy)
  {
    -[MKVibrantView setContinuousCornerRadius:](v11->_vibrantView, "setContinuousCornerRadius:", 10.0);
  }
  else
  {
    -[UIView _setContinuousCornerRadius:](v11->_backgroundView, "_setContinuousCornerRadius:", 10.0);
  }
  -[MUActionRowItemView updateColor](v11, "updateColor");
  -[MUActionRowItemView updateImage](v11, "updateImage");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObserver:selector:name:object:", v11, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

  if (MapKitIdiomIsMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v11, sel__applyBorderIfNeeded, *MEMORY[0x1E0DC4508], 0);

  }
  -[MUActionRowItemView addTarget:action:forControlEvents:](v11, "addTarget:action:forControlEvents:", v11, sel_handlePress, 0x2000);
  -[MUActionRowItemView addTarget:action:forControlEvents:](v11, "addTarget:action:forControlEvents:", v11, sel_handleMenuPresentation, 0x4000);
  v37 = -[MUStackLayout initWithContainer:axis:]([MUStackLayout alloc], "initWithContainer:axis:", v11, 1);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v38, "_mapsui_addObjectIfNotNil:", v11->_accessoryContainerView);
  objc_msgSend(v38, "_mapsui_addObjectIfNotNil:", v11->_label);
  v39 = (void *)objc_msgSend(v38, "copy");
  -[MUStackLayout setArrangedLayoutItems:](v37, "setArrangedLayoutItems:", v39);

  objc_storeStrong((id *)&v11->_iconLabelStackLayout, v37);
  -[MUActionRowItemView _updateMetrics](v11, "_updateMetrics");
  objc_msgSend(v20, "addObject:", v37);
  -[MUActionRowItemView traitCollection](v11, "traitCollection");
  v40 = (MUSizeLayout *)objc_claimAutoreleasedReturnValue();
  -[MUSizeLayout preferredContentSizeCategory](v40, "preferredContentSizeCategory");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MUSizeLayout userInterfaceIdiom](v40, "userInterfaceIdiom") == 5)
  {

    v40 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", v11, 26.0, 23.0);
    objc_msgSend(v20, "addObject:", v40);
  }
  else
  {
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v41))
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v41, (UIContentSizeCategory)*MEMORY[0x1E0DC48C0]);

  }
  v42 = (void *)MEMORY[0x1E0CB3718];
  v43 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v42, "_mapsui_activateLayouts:", v43);

  return v11;
}

- (void)_applyBorderIfNeeded
{
  id v2;
  _BOOL4 v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (v4)
    v5 = 1.0;
  else
    v5 = 0.0;
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v5);
  if (v4)
  {
    -[MUActionRowItemView tintColor](self, "tintColor");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v2, "CGColor");
  }
  else
  {
    v6 = 0;
  }
  -[UIView layer](self->_backgroundView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  if (v4)
  -[UIView layer](self->_backgroundView, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", v5);

}

- (void)handlePress
{
  id v3;

  -[MUActionRowItemView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionRowItemSelected:", self);

}

- (void)handleMenuPresentation
{
  id v3;

  -[MUActionRowItemView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionRowItemPresentedMenu:", self);

}

- (void)handleHoverGesture:(id)a3
{
  -[MUActionRowItemView setHovering:](self, "setHovering:", (unint64_t)(objc_msgSend(a3, "state") - 1) < 2);
}

- (id)accessibilityLabel
{
  return (id)-[UIImageView accessibilityLabel](self->_glyphImageView, "accessibilityLabel");
}

- (void)setAccessibilityLabel:(id)a3
{
  -[UIImageView setAccessibilityLabel:](self->_glyphImageView, "setAccessibilityLabel:", a3);
}

- (void)setGlyphName:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSString isEqual:](self->_glyphName, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphName, a3);
    -[MUActionRowItemView updateImage](self, "updateImage");
  }

}

- (void)setAccessoryView:(id)a3
{
  UIView **p_accessoryView;
  id v6;

  p_accessoryView = &self->_accessoryView;
  v6 = a3;
  if ((-[UIView isEqual:](*p_accessoryView, "isEqual:") & 1) == 0)
  {
    -[UIView removeFromSuperview](*p_accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[MUActionRowItemView updateImage](self, "updateImage");
  }

}

- (void)setHovering:(BOOL)a3
{
  double v4;

  if (self->_hovering != a3)
  {
    self->_hovering = a3;
    v4 = 1.0;
    if (!UIAccessibilityDarkerSystemColorsEnabled())
    {
      if (self->_hovering)
        v4 = 1.0;
      else
        v4 = 0.0;
    }
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v4);
  }
}

- (void)setFullWidthMode:(BOOL)a3
{
  uint64_t v4;

  if (self->_fullWidthMode != a3)
  {
    self->_fullWidthMode = a3;
    if (a3)
      v4 = 4;
    else
      v4 = 1;
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", v4);
    -[MUActionRowItemView _updateMetrics](self, "_updateMetrics");
  }
}

- (void)_updateMetrics
{
  void *v3;
  NSString *v4;
  double v5;
  double v6;
  double v7;
  NSComparisonResult v8;
  unint64_t v9;
  unint64_t v10;
  id v11;

  -[MUActionRowItemView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 5)
  {
    v5 = 4.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  else if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v8 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48C0]);
    v9 = 18;
    v10 = 12;
    if (v8 == NSOrderedAscending)
    {
      v9 = 12;
      v10 = 8;
    }
    v6 = (double)v9;
    v7 = (double)v10;
    v5 = 10.0;
  }
  else
  {
    v7 = 5.0;
    v5 = 6.0;
    v6 = 8.0;
  }

  -[MUStackLayout setInsets:](self->_iconLabelStackLayout, "setInsets:", v5, v6, v5, v6);
  -[MUStackLayout setSpacing:](self->_iconLabelStackLayout, "setSpacing:", v7);
  -[MUStackLayout setAxis:](self->_iconLabelStackLayout, "setAxis:", !self->_fullWidthMode);
  objc_msgSend((id)objc_opt_class(), "labelFont");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v11);

}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView layoutSubviews](&v6, sel_layoutSubviews);
  if (self->_style == 1)
  {
    -[UIView layer](self->_backgroundView, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCornerRadius:", 8.0);

    v4 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](self->_backgroundView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", v4);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[MUActionRowItemView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MUActionRowItemView infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (void)infoCardThemeChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView infoCardThemeChanged](&v3, sel_infoCardThemeChanged);
  -[MUActionRowItemView updateColor](self, "updateColor");
}

- (void)updateImage
{
  UIView *accessoryView;
  UIImageView *v4;
  void *v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  UIView *accessoryContainerView;
  MUBoxLayout *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  MUBoxLayout *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    v4 = accessoryView;
  }
  else
  {
    v4 = self->_glyphImageView;
    objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:", self->_glyphName);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_glyphImageView, "setImage:", v5);

  }
  if (v4 != (UIImageView *)self->_accessoryView
    || (-[UIImageView superview](v4, "superview"),
        v6 = (UIView *)objc_claimAutoreleasedReturnValue(),
        v7 = self->_accessoryContainerView,
        v6,
        v6 != v7))
  {
    if (v4 != self->_glyphImageView
      || (-[UIImageView superview](v4, "superview"),
          v8 = (UIView *)objc_claimAutoreleasedReturnValue(),
          accessoryContainerView = self->_accessoryContainerView,
          v8,
          v8 != accessoryContainerView))
    {
      -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
      -[UIImageView removeFromSuperview](self->_glyphImageView, "removeFromSuperview");
      -[UIView addSubview:](self->_accessoryContainerView, "addSubview:", v4);
      v10 = -[MUBoxLayout initWithContainer:]([MUBoxLayout alloc], "initWithContainer:", self->_accessoryContainerView);
      v16[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUBoxLayout setArrangedLayoutItems:](v10, "setArrangedLayoutItems:", v11);

      -[MUBoxLayout setHorizontalAlignment:](v10, "setHorizontalAlignment:", 2);
      -[MUBoxLayout setVerticalAlignment:](v10, "setVerticalAlignment:", 0);
      LODWORD(v12) = 1144750080;
      -[MUBoxLayout setHorizontalAlignmentFittingSizePriority:](v10, "setHorizontalAlignmentFittingSizePriority:", v12);
      v13 = (void *)MEMORY[0x1E0CB3718];
      v15 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_mapsui_activateLayouts:", v14);

    }
  }

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[MUActionRowItemView updateColor](self, "updateColor");
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView setTintColor:](&v4, sel_setTintColor_, a3);
  -[MUActionRowItemView updateColor](self, "updateColor");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView setEnabled:](&v4, sel_setEnabled_, a3);
  -[MUActionRowItemView updateColor](self, "updateColor");
}

- (void)setTitleText:(id)a3
{
  UILabel *label;
  id v5;

  label = self->_label;
  v5 = a3;
  -[UILabel setText:](label, "setText:", v5);
  -[MUActionRowItemView setToolTip:](self, "setToolTip:", v5);

}

- (NSString)titleText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setContentBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_contentBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
    -[MUActionRowItemView updateColor](self, "updateColor");
  }

}

- (void)setGlyphColor:(id)a3
{
  if (self->_style == 1)
    -[MUActionRowItemView setTintColor:](self, "setTintColor:", a3);
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_highlightedBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
    -[MUActionRowItemView updateColor](self, "updateColor");
  }

}

- (void)updateColor
{
  int64_t style;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  _BOOL4 touched;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  style = self->_style;
  if (style == 1)
  {
    -[MUActionRowItemView tintColor](self, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[MUActionRowItemView tintColor](self, "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v11);

    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", self->_contentBackgroundColor);
    v12 = -[MUActionRowItemView isEnabled](self, "isEnabled");
    v13 = 0.5;
    if (v12)
      v13 = 1.0;
    -[UIImageView setAlpha:](self->_glyphImageView, "setAlpha:", v13);
  }
  else if (!style)
  {
    -[MUActionRowItemView mk_theme](self, "mk_theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintColor");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    -[MUActionRowItemView tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MUActionRowItemView tintColor](self, "tintColor");
      v6 = objc_claimAutoreleasedReturnValue();

      v21 = (id)v6;
    }
    if (-[MUActionRowItemView isEnabled](self, "isEnabled")
      && -[MUActionRowItemView tintAdjustmentMode](self, "tintAdjustmentMode") != 2)
    {
      v9 = v21;
    }
    else
    {
      -[MUActionRowItemView mk_theme](self, "mk_theme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "disabledActionRowTextColor");
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v8;
    }
    v22 = v9;
    if (self->_useVibrancy)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantView setBackgroundColor:](self->_vibrantView, "setBackgroundColor:", v14);

      touched = self->_touched;
      -[MUActionRowItemView mk_theme](self, "mk_theme");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (touched)
        objc_msgSend(v16, "buttonHighlightedColor");
      else
        objc_msgSend(v16, "buttonNormalColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKVibrantView contentView](self->_vibrantView, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBackgroundColor:", v19);

      goto LABEL_24;
    }
    if (self->_touched)
    {
      if (!self->_highlightedBackgroundColor)
      {
        -[MUActionRowItemView mk_theme](self, "mk_theme");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "buttonHighlightedColor");
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_29:
        v19 = (void *)v18;
        -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v18);
LABEL_24:

LABEL_27:
        -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", v22);
        -[UILabel setTextColor:](self->_label, "setTextColor:", v22);

        return;
      }
    }
    else if (!self->_contentBackgroundColor)
    {
      -[MUActionRowItemView mk_theme](self, "mk_theme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "buttonNormalColor");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:");
    goto LABEL_27;
  }
}

- (void)setTouched:(BOOL)a3
{
  if (self->_touched != a3)
  {
    self->_touched = a3;
    -[MUActionRowItemView updateColor](self, "updateColor");
  }
}

- (void)_touchBegan
{
  if (-[MUActionRowItemView isEnabled](self, "isEnabled"))
    -[MUActionRowItemView setTouched:](self, "setTouched:", 1);
}

- (void)_touchCancelled
{
  -[MUActionRowItemView setTouched:](self, "setTouched:", 0);
}

- (void)_touchEnded
{
  if (-[MUActionRowItemView touched](self, "touched"))
    -[MUActionRowItemView setTouched:](self, "setTouched:", 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MUActionRowItemView;
  v6 = a4;
  -[MUActionRowItemView touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, a3, v6);
  -[MUActionRowItemView window](self, "window", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touchesForWindow:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "tapCount") == 1)
    -[MUActionRowItemView _touchBegan](self, "_touchBegan");

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[MUActionRowItemView _touchCancelled](self, "_touchCancelled");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[MUActionRowItemView _touchEnded](self, "_touchEnded");
}

- (void)setMenu:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUActionRowItemView;
  -[MUActionRowItemView setMenu:](&v5, sel_setMenu_, a3);
  -[MUActionRowItemView menu](self, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MUActionRowItemView removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", self, sel_handlePress, 0x2000);
  else
    -[MUActionRowItemView addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel_handlePress, 0x2000);
  -[MUActionRowItemView setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v4 != 0);
}

- (MUActionRowItemViewDelegate)delegate
{
  return (MUActionRowItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)fullWidthMode
{
  return self->_fullWidthMode;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (BOOL)touched
{
  return self->_touched;
}

- (BOOL)hovering
{
  return self->_hovering;
}

- (BOOL)showSelectedState
{
  return self->_showSelectedState;
}

- (void)setShowSelectedState:(BOOL)a3
{
  self->_showSelectedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconLabelStackLayout, 0);
  objc_storeStrong((id *)&self->_edgeLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_accessoryContainerView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
