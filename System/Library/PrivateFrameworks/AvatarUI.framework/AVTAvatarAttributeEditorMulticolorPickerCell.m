@implementation AVTAvatarAttributeEditorMulticolorPickerCell

+ (id)cellIdentifier
{
  return CFSTR("AVTAvatarAttributeEditorMulticolorPickerCell");
}

+ (id)labelFont
{
  return +[AVTUIFontRepository multicolorPickerLabelFont](AVTUIFontRepository, "multicolorPickerLabelFont");
}

+ (double)estimatedWidthForLabelSize:(CGSize)a3 isRemovable:(BOOL)a4 isSelected:(BOOL)a5
{
  double v5;

  v5 = 0.0;
  if (a4 && a5)
    v5 = 27.0;
  return a3.width + 35.0 + v5 + 10.0;
}

+ (double)estimatedTitleSpaceForWidth:(double)a3 isRemovable:(BOOL)a4 isSelected:(BOOL)a5
{
  double v5;

  v5 = 45.0;
  if (a4 && a5)
    v5 = 72.0;
  return a3 - v5;
}

- (AVTAvatarAttributeEditorMulticolorPickerCell)initWithFrame:(CGRect)a3
{
  AVTAvatarAttributeEditorMulticolorPickerCell *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UILabel *label;
  void *v8;
  void *v9;
  uint64_t v10;
  CALayer *colorView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIButton *clearButton;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  v3 = -[AVTAvatarAttributeEditorMulticolorPickerCell initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v6;

    objc_msgSend((id)objc_opt_class(), "labelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v8);

    -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_label);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v10 = objc_claimAutoreleasedReturnValue();
    colorView = v3->_colorView;
    v3->_colorView = (CALayer *)v10;

    -[CALayer setMasksToBounds:](v3->_colorView, "setMasksToBounds:", 1);
    -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v3->_colorView);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB590], 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithWeight:", 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationByApplyingConfiguration:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "systemButtonWithImage:target:action:", v17, v3, sel_didTapClearButton_);
    v18 = objc_claimAutoreleasedReturnValue();
    clearButton = v3->_clearButton;
    v3->_clearButton = (UIButton *)v18;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v3->_clearButton, "setTintColor:", v20);

    -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](v3, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v3->_clearButton);

    -[UIButton setHidden:](v3->_clearButton, "setHidden:", 1);
    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](v3, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShadowRadius:", 15.0);

    v23 = *MEMORY[0x1E0C9D820];
    v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](v3, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShadowOffset:", v23, v24);

    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](v3, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 0);

    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "resolvedColorWithTraitCollection:", v27);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "CGColor");
    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](v3, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowColor:", v30);

    -[AVTAvatarAttributeEditorMulticolorPickerCell bounds](v3, "bounds");
    v38 = CGRectInset(v37, -3.0, -3.0);
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "CGPath");
    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](v3, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setShadowPath:", v33);

  }
  return v3;
}

id __62__AVTAvatarAttributeEditorMulticolorPickerCell_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isRTL
{
  void *v2;
  BOOL v3;

  -[AVTAvatarAttributeEditorMulticolorPickerCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection") == 1;

  return v3;
}

- (BOOL)isShowingRemoveButton
{
  int v3;

  v3 = -[AVTAvatarAttributeEditorMulticolorPickerCell isRemovable](self, "isRemovable");
  if (v3)
    LOBYTE(v3) = -[AVTAvatarAttributeEditorMulticolorPickerCell isSelected](self, "isSelected");
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  -[AVTAvatarAttributeEditorMulticolorPickerCell layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  if (-[AVTAvatarAttributeEditorMulticolorPickerCell isRTL](self, "isRTL"))
    -[AVTAvatarAttributeEditorMulticolorPickerCell layoutForRTL](self, "layoutForRTL");
  else
    -[AVTAvatarAttributeEditorMulticolorPickerCell layoutForLTR](self, "layoutForLTR");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[AVTAvatarAttributeEditorMulticolorPickerCell bounds](self, "bounds");
  -[AVTAvatarAttributeEditorMulticolorPickerCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", CGRectGetHeight(v4) * 0.5);
}

- (void)showDropShadow
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;
  CGRect v8;
  CGRect v9;

  -[AVTAvatarAttributeEditorMulticolorPickerCell layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setShadowOpacity:", v4);

  -[AVTAvatarAttributeEditorMulticolorPickerCell bounds](self, "bounds");
  v9 = CGRectInset(v8, -3.0, -3.0);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v7, "CGPath");
  -[AVTAvatarAttributeEditorMulticolorPickerCell layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowPath:", v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  -[AVTAvatarAttributeEditorMulticolorPickerCell traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  -[AVTAvatarAttributeEditorMulticolorPickerCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerCell setBackgroundColor:](self, "setBackgroundColor:", v8);

    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setShadowOpacity:", v10);

    -[AVTAvatarAttributeEditorMulticolorPickerCell applyAppearanceForSelected:](self, "applyAppearanceForSelected:", -[AVTAvatarAttributeEditorMulticolorPickerCell isSelected](self, "isSelected"));
  }
  -[AVTAvatarAttributeEditorMulticolorPickerCell traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "layoutDirection");
  v13 = objc_msgSend(v4, "layoutDirection");

  if (v12 != v13)
    -[AVTAvatarAttributeEditorMulticolorPickerCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutForRTL
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double Width;
  void *v13;
  double v14;
  void *v15;
  double Height;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  CGFloat v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = (CGRectGetHeight(v26) + -20.0) * 0.5;

  v5 = fmax(v4, 0.0);
  -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 10.0;
  objc_msgSend(v6, "setFrame:", 10.0, v5, 20.0, 20.0);

  if (-[AVTAvatarAttributeEditorMulticolorPickerCell isShowingRemoveButton](self, "isShowingRemoveButton"))
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9 + 7.0 + 10.0 + 35.0;

  }
  else
  {
    v10 = 45.0;
  }
  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v27);

  if (-[AVTAvatarAttributeEditorMulticolorPickerCell isShowingRemoveButton](self, "isShowingRemoveButton"))
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v7 = CGRectGetMaxX(v28) + 7.0;

  }
  v14 = Width - v10;
  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  Height = CGRectGetHeight(v29);
  -[AVTAvatarAttributeEditorMulticolorPickerCell label](self, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v7, 0.0, v14, Height);

  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v19 = (CGRectGetHeight(v30) + -20.0) * 0.5;

  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = CGRectGetMaxX(v31) + -30.0;

  -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v21, fmax(v19, 0.0), 20.0, 20.0);

  -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", 10.0);

  v24 = *MEMORY[0x1E0CD2A68];
  -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerCurve:", v24);

}

- (void)layoutForLTR
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  double Height;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = (CGRectGetHeight(v24) + -20.0) * 0.5;

  -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 10.0, fmax(v4, 0.0), 20.0, 20.0);

  -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 10.0);

  v7 = *MEMORY[0x1E0CD2A68];
  -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerCurve:", v7);

  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = (CGRectGetHeight(v25) + -20.0) * 0.5;

  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetMaxX(v26) + -30.0;
  -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v12, fmax(v10, 0.0), 20.0, 20.0);

  if (-[AVTAvatarAttributeEditorMulticolorPickerCell isShowingRemoveButton](self, "isShowingRemoveButton"))
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15 + 7.0 + 10.0 + 35.0;

  }
  else
  {
    v16 = 45.0;
  }
  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v18 = CGRectGetWidth(v27) - v16;

  -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v19 = CGRectGetMaxX(v28) + 5.0;
  -[AVTAvatarAttributeEditorMulticolorPickerCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  Height = CGRectGetHeight(v29);
  -[AVTAvatarAttributeEditorMulticolorPickerCell label](self, "label");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v19, 0.0, v18, Height);

}

- (void)didTapClearButton:(id)a3
{
  id v4;

  -[AVTAvatarAttributeEditorMulticolorPickerCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multicolorPickerCellDidTapClearButton:", self);

}

- (void)applyAppearanceForSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  v3 = a3;
  -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v9);

    }
    -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    if (v3)
    {
      v11 = objc_msgSend(v10, "isRemovable") ^ 1;
      -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", v11);

      -[AVTAvatarAttributeEditorMulticolorPickerCell traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorMulticolorPickerCell applySelectedAppearanceForStyle:](self, "applySelectedAppearanceForStyle:", objc_msgSend(v13, "userInterfaceStyle"));
    }
    else
    {
      -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidden:", 1);

      -[AVTAvatarAttributeEditorMulticolorPickerCell traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorMulticolorPickerCell applyDefaultAppearanceForStyle:](self, "applyDefaultAppearanceForStyle:", objc_msgSend(v13, "userInterfaceStyle"));
    }

    -[AVTAvatarAttributeEditorMulticolorPickerCell updateColorViewBorder](self, "updateColorViewBorder");
  }
  else
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell clearButton](self, "clearButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](self, "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0;
    objc_msgSend(v17, "setShadowOpacity:", v15);
  }

}

- (void)applySelectedAppearanceForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerCell setBackgroundColor:](self, "setBackgroundColor:", v4);

  }
  else
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell showDropShadow](self, "showDropShadow");
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorMulticolorPickerCell label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

}

- (void)applyDefaultAppearanceForStyle:(int64_t)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerCell setBackgroundColor:](self, "setBackgroundColor:", v4);
  }
  else
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 0;
    objc_msgSend(v4, "setShadowOpacity:", v5);
  }

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorMulticolorPickerCell label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

- (void)setItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  AVTAvatarAttributeEditorSectionItem *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v5);
  v8 = (AVTAvatarAttributeEditorSectionItem *)v5;
  if (self->_item != v8)
  {
    objc_storeStrong((id *)&self->_item, a3);
    -[AVTAvatarAttributeEditorSectionItem localizedName](v8, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerCell label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[AVTAvatarAttributeEditorMulticolorPickerCell updateColor](self, "updateColor");
    -[AVTAvatarAttributeEditorMulticolorPickerCell applyAppearanceForSelected:](self, "applyAppearanceForSelected:", -[AVTAvatarAttributeEditorMulticolorPickerCell isSelected](self, "isSelected"));
  }

}

- (void)updateColor
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v7);

    }
    -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "variationStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "colorItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorPresetFromColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "colorItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layerContentProvider");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "colorItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "skinColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerCell colorView](self, "colorView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v13)[2](v13, v11, v15, v16);

  }
}

- (BOOL)shouldShowColorBorder
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;

  -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[AVTAvatarAttributeEditorMulticolorPickerCell isSelected](self, "isSelected");

    if (v5)
    {
      -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v8 = (void *)MEMORY[0x1E0C99DA0];
        -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v9);

      }
      -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Gray")) & 1) != 0)
      {
LABEL_6:
        v13 = 1;
LABEL_11:

LABEL_12:
        return v13;
      }
      objc_msgSend(v11, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("White")) & 1) != 0)
        goto LABEL_9;
      objc_msgSend(v11, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Clear"));

      if ((v17 & 1) != 0)
      {
        v13 = 1;
        goto LABEL_12;
      }
      -[AVTAvatarAttributeEditorMulticolorPickerCell traitCollection](self, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "userInterfaceStyle");

      if (v19 != 2)
      {
        v13 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Black")) & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v11, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Soft Black")) & 1) != 0)
      {
LABEL_9:
        v13 = 1;
      }
      else
      {
        objc_msgSend(v11, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v20, "isEqualToString:", CFSTR("Dark"));

      }
      goto LABEL_11;
    }
  }
  return 0;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  -[AVTAvatarAttributeEditorMulticolorPickerCell setSelected:](&v5, sel_setSelected_);
  -[AVTAvatarAttributeEditorMulticolorPickerCell applyAppearanceForSelected:](self, "applyAppearanceForSelected:", v3);
}

- (BOOL)isRemovable
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v7);

  }
  -[AVTAvatarAttributeEditorMulticolorPickerCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRemovable");

  return v9;
}

- (AVTAvatarAttributeEditorSectionItem)item
{
  return self->_item;
}

- (AVTAvatarAttributeEditorMulticolorPickerCellDelegate)delegate
{
  return (AVTAvatarAttributeEditorMulticolorPickerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CALayer)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
