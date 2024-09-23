@implementation CNActionView

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
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CNActionView;
  -[CNActionView layoutSubviews](&v21, sel_layoutSubviews);
  -[CNActionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CNActionView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CNActionView colorMatrixView](self, "colorMatrixView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (UIVisualEffectView)colorMatrixView
{
  return self->_colorMatrixView;
}

- (TLKProminenceView)vibrantBackgroundView
{
  return self->_vibrantBackgroundView;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[CNActionView platterView](self, "platterView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5 * 0.5;
  -[CNActionView platterView](self, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v6);

  v9 = *MEMORY[0x1E0CD2A68];
  -[CNActionView platterView](self, "platterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v9);

  -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13 * 0.5;
  -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", v14);

  -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerCurve:", v9);

}

- (UIView)platterView
{
  return self->_platterView;
}

- (TLKProminenceView)vibrantPlatterView
{
  return self->_vibrantPlatterView;
}

- (void)setStyle:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[CNActionView updatePlatterViewStateAnimated:](self, "updatePlatterViewStateAnimated:", 0);
    -[CNActionView updateTitleLabelFont](self, "updateTitleLabelFont");
    -[CNActionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    -[CNActionView updateImage](self, "updateImage");
    -[CNActionView platterViewMinimumLayoutSizeForStyle:](self, "platterViewMinimumLayoutSizeForStyle:", a3);
    v6 = v5;
    v8 = v7;
    -[CNActionView platterView](self, "platterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMinimumLayoutSize:", v6, v8);

    -[CNActionView platterViewMinimumLayoutSizeForStyle:](self, "platterViewMinimumLayoutSizeForStyle:", a3);
    v11 = v10;
    v13 = v12;
    -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMinimumLayoutSize:", v11, v13);

    -[CNActionView platterView](self, "platterView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minimumLayoutSize");
    v17 = v16;
    -[CNActionView platterView](self, "platterView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "minimumLayoutSize");
    v20 = v19;
    -[CNActionView horizontalContentView](self, "horizontalContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", 0.0, 0.0, v17, v20);

    -[CNActionView updateBackground](self, "updateBackground");
  }
}

- (void)setActionDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  _BOOL8 v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_actionDelegate, obj);
    if (-[CNActionView isContextMenuInteractionEnabled](self, "isContextMenuInteractionEnabled"))
      v6 = -[CNActionView shouldShowDisambiguation](self, "shouldShowDisambiguation");
    else
      v6 = 0;
    -[CNActionView setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v6);
    v5 = obj;
  }

}

- (CGSize)platterViewMinimumLayoutSizeForStyle:(int64_t)a3
{
  double v3;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = 37.0;
  if ((unint64_t)a3 <= 0xB)
  {
    if (((1 << a3) & 0xCC0) != 0)
    {
      v3 = 24.0;
      if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
        -[UIImageView setMinimumLayoutSize:](self->_imageView, "setMinimumLayoutSize:", 28.0, 28.0);
    }
    else if (((1 << a3) & 0x300) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "minimumPillDimension");
      v3 = v5;
    }
  }
  v6 = v3;
  v7 = v3;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updateImage
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[CNActionView style](self, "style");
  if ((unint64_t)(v3 - 10) < 2)
  {
    -[CNActionView image](self, "image");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationWithFont:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)(v3 - 8) > 1)
    {
      -[CNActionView image](self, "image");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CNActionView imageView](self, "imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImage:", v11);
      goto LABEL_7;
    }
    -[CNActionView image](self, "image");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3888];
    -[CNActionView titleFont](self, "titleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v4, "configurationWithPointSize:");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;
  objc_msgSend(v11, "imageWithConfiguration:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionView imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

LABEL_7:
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)shouldShowDisambiguation
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CNActionView actionDelegate](self, "actionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[CNActionView actionDelegate](self, "actionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "actionViewShouldPresentDisambiguationUI:", self);

  return v6;
}

- (CNActionViewDelegate)actionDelegate
{
  return (CNActionViewDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (NSString)type
{
  return self->_type;
}

+ (CGSize)minimumSizeForStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = *MEMORY[0x1E0CFAA78];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    objc_msgSend(a1, "minimumPillDimension");
    v5 = v4;
  }
  else
  {
    v5 = 37.0;
  }
  v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CNActionView)init
{
  return -[CNActionView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (UIFont)defaultTitleFont
{
  return (UIFont *)objc_msgSend(a1, "titleFontForStyle:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CNActionView title](self, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[CNActionView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[CNActionView titleLabel](self, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNActionView title](self, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v11);

    }
  }
  -[CNActionView containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", width, height);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)updateTitleLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNActionView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "titleFontForStyle:", -[CNActionView style](self, "style"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView setTitleFont:](self, "setTitleFont:", v4);

    -[CNActionView titleFont](self, "titleFont");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNActionView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNActionView;
  -[CNActionView tlk_updateForAppearance:](&v4, sel_tlk_updateForAppearance_, a3);
  -[CNActionView updateLabelStateAnimated:](self, "updateLabelStateAnimated:", 0);
  -[CNActionView updateImageViewStateAnimated:](self, "updateImageViewStateAnimated:", 0);
}

- (void)updateImageViewStateAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  -[CNActionView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    switch(-[CNActionView style](self, "style"))
    {
      case 1:
      case 5:
        if (!-[CNActionView disabled](self, "disabled"))
          goto LABEL_16;
        objc_msgSend((id)objc_opt_class(), "contentColorForDisabledVibrantDarkState");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      case 2:
      case 3:
      case 6:
      case 9:
      case 11:
      case 12:
        objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "primaryButtonColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CNActionView disabled](self, "disabled"))
        {
          objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = v6;
        }
        v13 = v7;
        -[CNActionView imageView](self, "imageView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "enableAppearanceForView:", v8);

        goto LABEL_23;
      case 4:
        if (-[CNActionView disabled](self, "disabled"))
          goto LABEL_20;
        +[CNUIColorRepository quickActionContentColorEnabled](CNUIColorRepository, "quickActionContentColorEnabled");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      case 7:
        if (-[CNActionView disabled](self, "disabled"))
          goto LABEL_20;
        goto LABEL_16;
      case 8:
        if (-[CNActionView disabled](self, "disabled"))
        {
          +[CNUIColorRepository quickActionContentColorDisabledPill](CNUIColorRepository, "quickActionContentColorDisabledPill");
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_25:
          v13 = (id)v9;
        }
        else
        {
LABEL_16:
          -[UIView tintColorOverride](self, "tintColorOverride");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNActionView colorByAdjustingColorToHighlightState:](self, "colorByAdjustingColorToHighlightState:", v5);
          v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
          v13 = v10;
LABEL_23:

        }
        -[CNActionView imageView](self, "imageView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTintColor:", v13);

        break;
      case 10:
        -[CNActionView posterTintColor](self, "posterTintColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView colorByAdjustingColorToHighlightState:](self, "colorByAdjustingColorToHighlightState:", v11);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[CNActionView disabled](self, "disabled"))
        {
          objc_msgSend(v5, "colorWithAlphaComponent:", 0.2);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = v5;
        }
        goto LABEL_22;
      default:
        if (-[CNActionView disabled](self, "disabled"))
        {
LABEL_20:
          objc_msgSend((id)objc_opt_class(), "contentColorForDisabledBoldState");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[CNUIColorRepository quickActionContentColor](CNUIColorRepository, "quickActionContentColor");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_25;
    }
  }
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (id)colorByAdjustingColorToHighlightState:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = -[CNActionView style](self, "style");
  if ((-[CNActionView isHighlighted](self, "isHighlighted") & 1) != 0)
  {
    if (v5 == 1)
      v6 = -0.100000001;
    else
      v6 = 0.0;
    objc_msgSend((id)objc_opt_class(), "colorByIncreasingBrightnessComponentByPercentage:ofColor:", v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (void)updateLabelStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = a3;
  -[CNActionView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNActionView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    switch(-[CNActionView style](self, "style"))
    {
      case 1:
        if (!-[CNActionView disabled](self, "disabled"))
          goto LABEL_15;
        objc_msgSend((id)objc_opt_class(), "contentColorForDisabledVibrantDarkState");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 2:
      case 3:
      case 6:
      case 11:
      case 12:
        objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CNActionView disabled](self, "disabled"))
          v9 = 2;
        else
          v9 = 1;
        goto LABEL_6;
      case 4:
      case 7:
        if (!-[CNActionView disabled](self, "disabled"))
          goto LABEL_15;
        objc_msgSend((id)objc_opt_class(), "contentColorForDisabledBoldState");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 8:
        if (!-[CNActionView disabled](self, "disabled"))
          goto LABEL_15;
        +[CNUIColorRepository quickActionContentColorDisabledPill](CNUIColorRepository, "quickActionContentColorDisabledPill");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 9:
        objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CNActionView disabled](self, "disabled"))
          v9 = 2;
        else
          v9 = 0;
LABEL_6:
        objc_msgSend(v8, "colorForProminence:", v9);
        v30 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView titleLabel](self, "titleLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "enableAppearanceForView:", v11);

        goto LABEL_7;
      case 10:
        -[CNActionView posterTintColor](self, "posterTintColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CNActionView disabled](self, "disabled"))
          objc_msgSend(v10, "colorWithAlphaComponent:", 0.2);
        else
          -[CNActionView posterTintColor](self, "posterTintColor");
        v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

        break;
      default:
LABEL_15:
        -[UIView tintColorOverride](self, "tintColorOverride");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v30 = (id)v12;
        break;
    }
    -[CNActionView titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v30);

    -[CNActionView updateLabelArrangedSubviews](self, "updateLabelArrangedSubviews");
    -[CNActionView title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[CNActionView title](self, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length") == 0;

    }
    else
    {
      v16 = 1;
    }

    if ((-[CNActionView style](self, "style") & 0xFFFFFFFFFFFFFFFELL) == 8)
    {
      if (v16)
      {
        -[CNActionView applyDefaultLabelContainerMetrics](self, "applyDefaultLabelContainerMetrics");
      }
      else
      {
        -[CNActionView horizontalContentView](self, "horizontalContentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setLayoutMargins:", 0.0, 14.0, 0.0, 14.0);

        -[CNActionView title](self, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedCapitalizedString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView titleLabel](self, "titleLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setText:", v19);

        v21 = *MEMORY[0x1E0CFAA80];
        v22 = *(double *)(MEMORY[0x1E0CFAA80] + 8);
        -[CNActionView titleLabel](self, "titleLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setMaximumLayoutSize:", v21, v22);

      }
      -[CNActionView titleLabel](self, "titleLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", v16);

      -[CNActionView containerView](self, "containerView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAlignment:", 0);

    }
    else
    {
      -[CNActionView applyDefaultLabelContainerMetrics](self, "applyDefaultLabelContainerMetrics");
    }
    -[CNActionView titleFont](self, "titleFont");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView titleLabel](self, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v26);

    if (v3)
    {
      v28 = (void *)objc_opt_class();
      -[CNActionView titleLabel](self, "titleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fadeInView:", v29);

    }
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)posterTintColor
{
  return self->_posterTintColor;
}

- (UIFont)titleFont
{
  UIFont *titleFont;

  titleFont = self->_titleFont;
  if (titleFont)
    return titleFont;
  objc_msgSend((id)objc_opt_class(), "defaultTitleFont");
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)updatePlatterViewStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  id v61;

  v3 = a3;
  -[CNActionView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && -[CNActionView style](self, "style") != 6
    && -[CNActionView style](self, "style") != 11
    && -[CNActionView style](self, "style") != 10)
  {
    v6 = -[CNActionView style](self, "style") == 3
      || -[CNActionView style](self, "style") == 2
      || -[CNActionView style](self, "style") == 9
      || -[CNActionView style](self, "style") == 12;
    -[CNActionView platterView](self, "platterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v6);

    -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v6 ^ 1);

    switch(-[CNActionView style](self, "style"))
    {
      case 0:
      case 5:
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        -[CNActionView platterView](self, "platterView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setBackgroundColor:", v23);
        goto LABEL_28;
      case 2:
      case 3:
      case 9:
      case 12:
        -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v10 = (void *)objc_opt_new();
          -[CNActionView setVibrantPlatterView:](self, "setVibrantPlatterView:", v10);

          -[CNActionView platterViewMinimumLayoutSizeForStyle:](self, "platterViewMinimumLayoutSizeForStyle:", -[CNActionView style](self, "style"));
          v12 = v11;
          v14 = v13;
          -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setMinimumLayoutSize:", v12, v14);

          -[CNActionView platterBoxView](self, "platterBoxView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "insertArrangedSubview:atIndex:", v17, 0);

        }
        if (-[CNActionView isHighlighted](self, "isHighlighted"))
          v18 = 2;
        else
          v18 = 3;
        -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProminence:", v18);

        -[CNActionView layer](self, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = 0;
        goto LABEL_16;
      case 4:
        if (-[CNActionView disabled](self, "disabled"))
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNActionView platterView](self, "platterView");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setBackgroundColor:", v39);

          -[CNActionView platterView](self, "platterView");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "layer");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setBorderWidth:", 1.0);

          objc_msgSend((id)objc_opt_class(), "borderColorForDisabledBoldState");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v43 = objc_msgSend(v23, "CGColor");
          -[CNActionView platterView](self, "platterView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "layer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          v46 = v43;
        }
        else
        {
          +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "transportBoldBackgroundColor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v53;
          if (v53)
          {
            v55 = v53;
          }
          else
          {
            -[UIView tintColorOverride](self, "tintColorOverride");
            v55 = (id)objc_claimAutoreleasedReturnValue();
          }
          v23 = v55;

          -[CNActionView platterView](self, "platterView");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setBackgroundColor:", v23);

          -[CNActionView platterView](self, "platterView");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "layer");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setBorderWidth:", 0.0);

          -[CNActionView platterView](self, "platterView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "layer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          v46 = 0;
        }
        objc_msgSend(v44, "setBorderColor:", v46);

LABEL_28:
        if (-[CNActionView isHighlighted](self, "isHighlighted"))
          v59 = 0.3;
        else
          v59 = 1.0;
        -[CNActionView platterView](self, "platterView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setAlpha:", v59);
        goto LABEL_32;
      case 7:
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView platterView](self, "platterView");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setBackgroundColor:", v47);

        -[CNActionView platterView](self, "platterView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "layer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setBorderWidth:", 0.0);

        -[CNActionView platterView](self, "platterView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "layer");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setCompositingFilter:", 0);

        goto LABEL_32;
      default:
        -[CNActionView platterView](self, "platterView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setBorderWidth:", 1.0);

        +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "transportBackgroundColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView colorByAdjustingColorToHighlightState:](self, "colorByAdjustingColorToHighlightState:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView platterView](self, "platterView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setBackgroundColor:", v29);

        +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "transportBorderColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView colorByAdjustingColorToHighlightState:](self, "colorByAdjustingColorToHighlightState:", v32);
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = objc_msgSend(v33, "CGColor");
        -[CNActionView platterView](self, "platterView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "layer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setBorderColor:", v34);

        -[CNActionView platterView](self, "platterView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "layer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setCompositingFilter:", 0);

        -[CNActionView layer](self, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = 1;
LABEL_16:
        objc_msgSend(v20, "setAllowsGroupBlending:", v22);
LABEL_32:

        if (v3)
        {
          v60 = (void *)objc_opt_class();
          -[CNActionView platterView](self, "platterView");
          v61 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "fadeInView:", v61);

        }
        break;
    }
  }
}

- (int64_t)style
{
  return self->_style;
}

- (void)updateLabelArrangedSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((-[CNActionView style](self, "style") & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    -[CNActionView containerView](self, "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeArrangedSubview:", v4);

    -[CNActionView horizontalContentView](self, "horizontalContentView");
  }
  else
  {
    -[CNActionView horizontalContentView](self, "horizontalContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeArrangedSubview:", v6);

    -[CNActionView containerView](self, "containerView");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNActionView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v7);

}

- (void)applyDefaultLabelContainerMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[CNActionView horizontalContentView](self, "horizontalContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutMargins:", v3, v4, v5, v6);

  -[CNActionView title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[CNActionView containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlignment:", 3);

  -[CNActionView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 0);

  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    v12 = *MEMORY[0x1E0CFAA78];
    -[CNActionView titleLabel](self, "titleLabel");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaximumLayoutSize:", 66.0, v12);

  }
}

- (NUIContainerStackView)containerView
{
  return self->_containerView;
}

- (NUIContainerStackView)horizontalContentView
{
  return self->_horizontalContentView;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

+ (id)titleFontForStyle:(int64_t)a3
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if ((unint64_t)(a3 - 8) > 3)
    v3 = (id *)MEMORY[0x1E0DC4AA0];
  else
    v3 = (id *)qword_1E2049B30[a3 - 8];
  v4 = *v3;
  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *v9;

  v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    -[CNActionView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setNumberOfLines:", 1);
      if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
        v8 = 4;
      else
        v8 = 1;
      objc_msgSend(v7, "setTextAlignment:", v8);
      -[CNActionView setTitleLabel:](self, "setTitleLabel:", v7);
      -[CNActionView updateTitleLabelFont](self, "updateTitleLabelFont");

    }
    -[CNActionView updateLabelStateAnimated:](self, "updateLabelStateAnimated:", 0);
    v5 = v9;
  }

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[CNActionView updateImage](self, "updateImage");
    -[CNActionView updateImageViewStateAnimated:](self, "updateImageViewStateAnimated:", 0);
    v5 = v6;
  }

}

- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;

  v4 = a3;
  if (self->_disabled != a3)
  {
    v6 = a4;
    self->_disabled = a3;
    -[CNActionView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !a3);
    -[CNActionView setHighlighted:animated:](self, "setHighlighted:animated:", 0, v6);
    -[CNActionView updatePlatterViewStateAnimated:](self, "updatePlatterViewStateAnimated:", v6);
    -[CNActionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
  if (v4)
  {
    if ((-[CNActionView isContextMenuInteractionEnabled](self, "isContextMenuInteractionEnabled") & 1) == 0)
      return;
    v7 = 0;
  }
  else
  {
    v7 = -[CNActionView shouldShowDisambiguation](self, "shouldShowDisambiguation");
    if (v7 == -[CNActionView isContextMenuInteractionEnabled](self, "isContextMenuInteractionEnabled"))
      return;
  }
  if (-[CNActionView isContextMenuInteractionEnabled](self, "isContextMenuInteractionEnabled"))
  {
    -[CNActionView contextMenuInteraction](self, "contextMenuInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissMenu");

  }
  -[CNActionView setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v7);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CNActionView;
  -[CNActionView setHighlighted:](&v7, sel_setHighlighted_);
  if (!-[CNActionView disabled](self, "disabled") || !a3)
  {
    -[CNActionView updatePlatterViewStateAnimated:](self, "updatePlatterViewStateAnimated:", v4);
    -[CNActionView updateImageViewStateAnimated:](self, "updateImageViewStateAnimated:", v4);
  }
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (CNActionView)initWithFrame:(CGRect)a3
{
  CNActionView *v3;
  CNActionView *v4;
  uint64_t v5;
  UIView *platterView;
  uint64_t v7;
  UIImageView *imageView;
  double v9;
  id v10;
  void *v11;
  uint64_t v12;
  NUIContainerStackView *horizontalContentView;
  id v14;
  uint64_t v15;
  NUIContainerStackView *containerView;
  double v17;
  id v18;
  void *v19;
  uint64_t v20;
  NUIContainerBoxView *platterBoxView;
  double v22;
  double v23;
  double v24;
  CNActionMenuHelper *v25;
  CNActionMenuHelper *actionMenuHelper;
  uint64_t v27;
  UIColor *posterTintColor;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)CNActionView;
  v3 = -[CNActionView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNActionView setContextMenuInteractionEnabled:](v3, "setContextMenuInteractionEnabled:", 1);
    v5 = objc_opt_new();
    platterView = v4->_platterView;
    v4->_platterView = (UIView *)v5;

    v7 = objc_opt_new();
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v7;

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 4);
    LODWORD(v9) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_imageView, "setContentHuggingPriority:forAxis:", 0, v9);
    v10 = objc_alloc(MEMORY[0x1E0CFAAB0]);
    v32[0] = v4->_imageView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithArrangedSubviews:", v11);
    horizontalContentView = v4->_horizontalContentView;
    v4->_horizontalContentView = (NUIContainerStackView *)v12;

    -[NUIContainerStackView setAlignment:](v4->_horizontalContentView, "setAlignment:", 3);
    -[NUIContainerStackView setSpacing:](v4->_horizontalContentView, "setSpacing:", 4.0);
    -[NUIContainerStackView setLayoutMarginsRelativeArrangement:](v4->_horizontalContentView, "setLayoutMarginsRelativeArrangement:", 1);
    -[NUIContainerStackView setLayoutMargins:](v4->_horizontalContentView, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[NUIContainerStackView setInsetsLayoutMarginsFromSafeArea:](v4->_horizontalContentView, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[CNActionView updatePlatterViewStateAnimated:](v4, "updatePlatterViewStateAnimated:", 0);
    -[CNActionView updateImageViewStateAnimated:](v4, "updateImageViewStateAnimated:", 0);
    LODWORD(v10) = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    v14 = objc_alloc(MEMORY[0x1E0CFAAB0]);
    -[CNActionView bounds](v4, "bounds");
    v15 = objc_msgSend(v14, "initWithFrame:");
    containerView = v4->_containerView;
    v4->_containerView = (NUIContainerStackView *)v15;

    -[NUIContainerStackView setUserInteractionEnabled:](v4->_containerView, "setUserInteractionEnabled:", 0);
    -[NUIContainerStackView setAutoresizingMask:](v4->_containerView, "setAutoresizingMask:", 18);
    -[NUIContainerStackView setAlignment:](v4->_containerView, "setAlignment:", 3);
    -[NUIContainerStackView setAxis:](v4->_containerView, "setAxis:", v10 ^ 1);
    v17 = 2.0;
    if ((_DWORD)v10)
      v17 = 12.0;
    -[NUIContainerStackView setSpacing:](v4->_containerView, "setSpacing:", v17);
    -[NUIContainerStackView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:](v4->_containerView, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
    -[NUIContainerStackView setInsetsLayoutMarginsFromSafeArea:](v4->_containerView, "setInsetsLayoutMarginsFromSafeArea:", 0);
    v18 = objc_alloc(MEMORY[0x1E0CFAA98]);
    v31[0] = v4->_platterView;
    v31[1] = v4->_horizontalContentView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithArrangedSubviews:", v19);
    platterBoxView = v4->_platterBoxView;
    v4->_platterBoxView = (NUIContainerBoxView *)v20;

    -[NUIContainerBoxView setDelegate:](v4->_platterBoxView, "setDelegate:", v4);
    -[NUIContainerBoxView setAlignment:forView:inAxis:](v4->_platterBoxView, "setAlignment:forView:inAxis:", 3, v4->_horizontalContentView, 1);
    -[NUIContainerBoxView setAlignment:forView:inAxis:](v4->_platterBoxView, "setAlignment:forView:inAxis:", 3, v4->_horizontalContentView, 0);
    LODWORD(v22) = 1148846080;
    -[NUIContainerBoxView setContentHuggingPriority:forAxis:](v4->_platterBoxView, "setContentHuggingPriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[NUIContainerBoxView setContentCompressionResistancePriority:forAxis:](v4->_platterBoxView, "setContentCompressionResistancePriority:forAxis:", 0, v23);
    LODWORD(v24) = 1148846080;
    -[NUIContainerBoxView setContentCompressionResistancePriority:forAxis:](v4->_platterBoxView, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    -[NUIContainerStackView addArrangedSubview:](v4->_containerView, "addArrangedSubview:", v4->_platterBoxView);
    -[CNActionView addSubview:](v4, "addSubview:", v4->_containerView);
    -[CNActionView addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel_handleTapGesture, 64);
    v25 = objc_alloc_init(CNActionMenuHelper);
    actionMenuHelper = v4->_actionMenuHelper;
    v4->_actionMenuHelper = v25;

    +[CNUIColorRepository quickActionViewDefaultPosterTintColor](CNUIColorRepository, "quickActionViewDefaultPosterTintColor");
    v27 = objc_claimAutoreleasedReturnValue();
    posterTintColor = v4->_posterTintColor;
    v4->_posterTintColor = (UIColor *)v27;

  }
  return v4;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNActionView;
  -[CNActionView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CNActionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  -[CNActionView updatePlatterViewStateAnimated:](self, "updatePlatterViewStateAnimated:", 0);
  -[CNActionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNActionView;
  -[CNActionView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CNActionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  -[CNActionView updatePlatterViewStateAnimated:](self, "updatePlatterViewStateAnimated:", 0);
}

- (void)setPosterTintColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (UIColor *)v4;
  }
  else
  {
    +[CNUIColorRepository quickActionViewDefaultPosterTintColor](CNUIColorRepository, "quickActionViewDefaultPosterTintColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (self->_posterTintColor != v5)
  {
    objc_storeStrong((id *)&self->_posterTintColor, v5);
    if (-[CNActionView style](self, "style") == 10)
      -[CNActionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }

}

- (void)updateBackground
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  _OWORD v34[5];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  switch(-[CNActionView style](self, "style"))
  {
    case 6:
    case 11:
      -[CNActionView updateBackgroundForVibrantRoundedRect](self, "updateBackgroundForVibrantRoundedRect");
      break;
    case 7:
      -[CNActionView applyRoundedRectMargins](self, "applyRoundedRectMargins");
      -[CNActionView layer](self, "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCornerRadius:", 10.0);

      v4 = *MEMORY[0x1E0CD2A68];
      -[CNActionView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCornerCurve:", v4);

      -[CNActionView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBorderWidth:", 0.5);

      +[CNUIColorRepository quickActionViewRoundedRectBorderColor](CNUIColorRepository, "quickActionViewRoundedRectBorderColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "CGColor");
      -[CNActionView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderColor:", v8);

      +[CNUIColorRepository quickActionViewRoundedRectBackgroundColor](CNUIColorRepository, "quickActionViewRoundedRectBackgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNActionView setBackgroundColor:](self, "setBackgroundColor:", v10);
      goto LABEL_5;
    case 10:
      -[CNActionView applyRoundedRectMargins](self, "applyRoundedRectMargins");
      -[CNActionView colorMatrixView](self, "colorMatrixView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCornerRadius:", 10.0);

        v17 = *MEMORY[0x1E0CD2A68];
        objc_msgSend(v15, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCornerCurve:", v17);

        objc_msgSend(v15, "setClipsToBounds:", 1);
        objc_msgSend(v15, "setUserInteractionEnabled:", 0);
        objc_msgSend(v15, "_setGroupName:", CFSTR("CNQuickActionsCaptureGroup"));
        -[CNActionView containerView](self, "containerView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNActionView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v15, v19);

        -[CNActionView setColorMatrixView:](self, "setColorMatrixView:", v15);
      }
      v34[2] = xmmword_18AF8B9F0;
      v34[3] = unk_18AF8BA00;
      v34[4] = xmmword_18AF8BA10;
      v34[0] = xmmword_18AF8B9D0;
      v34[1] = unk_18AF8B9E0;
      objc_msgSend(MEMORY[0x1E0DC3660], "_colorEffectCAMatrix:", v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 30.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v20;
      v35[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNActionView colorMatrixView](self, "colorMatrixView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBackgroundEffects:", v22);

      -[CNActionView bounds](self, "bounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[CNActionView colorMatrixView](self, "colorMatrixView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

      break;
    case 12:
      return;
    default:
      -[CNActionView containerView](self, "containerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLayoutMarginsRelativeArrangement:", 0);

      -[CNActionView setBackgroundColor:](self, "setBackgroundColor:", 0);
      -[CNActionView layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCornerRadius:", 0.0);

      -[CNActionView layer](self, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderWidth:", 0.0);

      -[CNActionView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderColor:", 0);
LABEL_5:

      -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setHidden:", 1);

      break;
  }
}

- (void)setColorMatrixView:(id)a3
{
  objc_storeStrong((id *)&self->_colorMatrixView, a3);
}

- (void)applyRoundedRectMargins
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  -[CNActionView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutMarginsRelativeArrangement:", 1);

  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionContentInset");
    v5 = v4;
    -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionContentInset");
    v8 = v7;
    -[CNActionView containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLayoutMargins:", 9.5, v5, 9.5, v8);

  }
  else
  {
    -[CNActionView containerView](self, "containerView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLayoutMargins:", 9.5, 4.0, 9.5, 4.0);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNActionView;
  -[CNActionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[CNActionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[CNActionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[CNActionView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)setDisabled:(BOOL)a3
{
  -[CNActionView setDisabled:animated:](self, "setDisabled:animated:", a3, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNActionView;
  -[CNActionView setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[CNActionView updatePlatterViewStateAnimated:](self, "updatePlatterViewStateAnimated:", 0);
  -[CNActionView updateImageViewStateAnimated:](self, "updateImageViewStateAnimated:", 0);
  -[CNActionView updateBackground](self, "updateBackground");
}

- (void)setVisualEffectViewCaptureView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (self->_visualEffectViewCaptureView != a3)
  {
    v4 = a3;
    -[CNActionView colorMatrixView](self, "colorMatrixView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setCaptureView:", v4);

    -[CNActionView colorMatrixView](self, "colorMatrixView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setGroupName:", CFSTR("CNQuickActionsCaptureGroup"));

  }
}

- (void)updateBackgroundForVibrantRoundedRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  -[CNActionView applyRoundedRectMargins](self, "applyRoundedRectMargins");
  -[CNActionView setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[CNActionView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 0.0);

  -[CNActionView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", 0.0);

  -[CNActionView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", 0);

  -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD9D0]), "initWithProminence:", 3);
    -[CNActionView setVibrantBackgroundView:](self, "setVibrantBackgroundView:", v7);

    -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);

    -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 10.0);

    v11 = *MEMORY[0x1E0CD2A68];
    -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerCurve:", v11);

    -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v14, v15);

    -[CNActionView setNeedsLayout](self, "setNeedsLayout");
  }
  if (-[CNActionView isHighlighted](self, "isHighlighted"))
    v16 = 2;
  else
    v16 = 3;
  -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProminence:", v16);

  -[CNActionView vibrantBackgroundView](self, "vibrantBackgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 0);

  -[CNActionView vibrantPlatterView](self, "vibrantPlatterView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 1);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CNActionView containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)handleTapGesture
{
  void *v3;
  char v4;
  id v5;

  -[CNActionView actionDelegate](self, "actionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNActionView actionDelegate](self, "actionDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didPressActionView:longPress:", self, 0);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  if (!-[CNActionView shouldShowDisambiguation](self, "shouldShowDisambiguation", a3, a4.x, a4.y))
    return 0;
  -[CNActionView actionMenuHelper](self, "actionMenuHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__CNActionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v11[3] = &unk_1E204F648;
  v11[4] = self;
  objc_msgSend(v5, "configurationActionProviderWithActionBlock:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC36B8];
  -[CNActionView type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithIdentifier:previewProvider:actionProvider:", v8, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  -[CNActionView sourceViewForContextMenuPreview](self, "sourceViewForContextMenuPreview", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (!v5)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNActionView.m", 942, 3, CFSTR("Tried to initialize UITargetedPreview with a view that is not in a window: %@"), v6, v7, v8, v9, 0);
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNActionView.m", 942, 3, CFSTR("Tried to initialize UITargetedPreview with a view that is not in a window: %@"), v12, v13, v14, v15, (uint64_t)v10);
    goto LABEL_6;
  }
  -[CNActionView actionMenuHelper](self, "actionMenuHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "targetedPreviewForSourceView:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v17;
}

- (id)sourceViewForContextMenuPreview
{
  CNActionView *v3;

  if (-[CNActionView style](self, "style") == 7
    || -[CNActionView style](self, "style") == 6
    || -[CNActionView style](self, "style") == 11
    || -[CNActionView style](self, "style") == 10)
  {
    v3 = self;
  }
  else
  {
    -[CNActionView imageView](self, "imageView");
    v3 = (CNActionView *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNActionView;
  v8 = a3;
  -[CNActionView contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v8, a4, a5);
  -[CNActionView actionMenuHelper](self, "actionMenuHelper", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "willDisplayMenuWithContextMenuInteraction:", v8);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNActionView;
  -[CNActionView contextMenuInteraction:willEndForConfiguration:animator:](&v7, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, a5);
  -[CNActionView actionMenuHelper](self, "actionMenuHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willDismissMenu");

}

- (void)updateWithMenuItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNActionView actionMenuHelper](self, "actionMenuHelper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNActionView contextMenuInteraction](self, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithMenuItems:contextMenuInteraction:", v4, v5);

}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NUIContainerBoxView)platterBoxView
{
  return self->_platterBoxView;
}

- (void)setPlatterBoxView:(id)a3
{
  objc_storeStrong((id *)&self->_platterBoxView, a3);
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void)setHorizontalContentView:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalContentView, a3);
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setActionMenuHelper:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuHelper, a3);
}

- (void)setVibrantPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantPlatterView, a3);
}

- (void)setVibrantBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantBackgroundView, a3);
}

- (_UIVisualEffectBackdropView)visualEffectViewCaptureView
{
  return self->_visualEffectViewCaptureView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectViewCaptureView, 0);
  objc_storeStrong((id *)&self->_posterTintColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_colorMatrixView, 0);
  objc_storeStrong((id *)&self->_vibrantBackgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantPlatterView, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_horizontalContentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_platterBoxView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
}

void __70__CNActionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "actionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didPressActionView:longPress:", *(_QWORD *)(a1 + 32), 1);

}

+ (id)borderColorForDisabledBoldState
{
  return +[CNUIColorRepository quickActionBorderColorDisabled](CNUIColorRepository, "quickActionBorderColorDisabled");
}

+ (id)contentColorForDisabledBoldState
{
  return +[CNUIColorRepository quickActionContentColorDisabled](CNUIColorRepository, "quickActionContentColorDisabled");
}

+ (id)contentColorForDisabledVibrantDarkState
{
  return +[CNUIColorRepository quickActionContentColorDisabledVibrant](CNUIColorRepository, "quickActionContentColorDisabledVibrant");
}

+ (id)colorByIncreasingBrightnessComponentByPercentage:(double)a3 ofColor:(id)a4
{
  id v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  void *v10;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7
      || (a3 >= -1.0 ? (v8 = a3 > 1.0) : (v8 = 1),
          v8
       || (v14 = 0.0,
           v15 = 0.0,
           v12 = 0.0,
           v13 = 0.0,
           (objc_msgSend(v5, "getHue:saturation:brightness:alpha:", &v15, &v14, &v13, &v12) & 1) == 0)))
    {
      v9 = v5;
    }
    else
    {
      v13 = fmin((a3 + 1.0) * v13, 1.0);
      if (v12 < 0.1)
        v12 = v12 + 0.100000001;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v15, v14, *(_QWORD *)&v12, *(_QWORD *)&v13);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)fadeInView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CD28D0];
  v4 = a3;
  objc_msgSend(v3, "animation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDuration:", 0.2);
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAnimation:forKey:", v6, 0);
}

+ (double)minimumPillDimension
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "titleFontForStyle:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 31.0);
  v4 = v3;

  if (v4 >= 31.0)
    return v4;
  else
    return 31.0;
}

@end
