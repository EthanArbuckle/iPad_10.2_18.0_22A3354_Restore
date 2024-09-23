@implementation _CAMExpandingControlButton

- (_CAMExpandingControlButton)initWithFrame:(CGRect)a3
{
  _CAMExpandingControlButton *v3;
  CAMSlashContainer *v4;
  CAMSlashContainer *titleContentView;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CAMExpandingControlButton;
  v3 = -[_CAMExpandingControlButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMSlashContainer);
    titleContentView = v3->__titleContentView;
    v3->__titleContentView = v4;

    -[CAMSlashContainer setUserInteractionEnabled:](v3->__titleContentView, "setUserInteractionEnabled:", 0);
    -[CAMSlashContainer setSlashSize:](v3->__titleContentView, "setSlashSize:", 20.0, 20.0);
    -[_CAMExpandingControlButton addSubview:](v3, "addSubview:", v3->__titleContentView);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    -[CAMSlashContainer setContentView:](v3->__titleContentView, "setContentView:", v6);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[_CAMExpandingControlButton titleImage](self, "titleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_CAMExpandingControlButton _filledOutlineContentView](self, "_filledOutlineContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[_CAMExpandingControlButton _filledOutlineContentView](self, "_filledOutlineContentView");
      else
        -[_CAMExpandingControlButton _titleImageView](self, "_titleImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v5;
    v10 = CAMViewAlignmentSize(v5);
    v12 = v11;

    v6 = v10;
    v7 = v12;
  }
  else
  {
    -[_CAMExpandingControlButton _intrinsicLabelSize](self, "_intrinsicLabelSize");
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[_CAMExpandingControlButton _effectiveTitleFont](self, "_effectiveTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_CAMExpandingControlButton titleText](self, "titleText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v7, "ascender");
      objc_msgSend(v7, "capHeight");
      UIRoundToViewScale();
      v4 = v10;
      -[_CAMExpandingControlButton _effectiveSubtitleFont](self, "_effectiveSubtitleFont");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descender");
      UIRoundToViewScale();
      v6 = v12;

    }
  }

  v13 = v4;
  v14 = v3;
  v15 = v6;
  v16 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
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
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  -[_CAMExpandingControlButton bounds](self, "bounds");
  -[_CAMExpandingControlButton intrinsicContentSize](self, "intrinsicContentSize");
  -[_CAMExpandingControlButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  CEKRectWithSize();
  UIRectCenteredIntegralRectScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_CAMExpandingControlButton alignmentRectInsets](self, "alignmentRectInsets", v5);
  v16 = v9 + (v14 - v15) * 0.5;
  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v7, v16, v11, v13);

  CEKRectWithSize();
  UIRectGetCenter();
  -[_CAMExpandingControlButton _titleImageView](self, "_titleImageView");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v34, "intrinsicContentSize");
  v21 = v20;
  v23 = v22;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v34, "setCenter:");
  objc_msgSend(v34, "setBounds:", v18, v19, v21, v23);
  -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "intrinsicContentSize");
  v26 = v25;
  v28 = v27;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v24, "setCenter:");
  objc_msgSend(v24, "setBounds:", v18, v19, v26, v28);
  -[_CAMExpandingControlButton _filledOutlineContentView](self, "_filledOutlineContentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "intrinsicContentSize");
  v31 = v30;
  v33 = v32;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v29, "setCenter:");
  objc_msgSend(v29, "setBounds:", v18, v19, v31, v33);

}

- (void)tintColorDidChange
{
  -[_CAMExpandingControlButton _updateTitleLabel](self, "_updateTitleLabel");
  -[_CAMExpandingControlButton _updateTitleImageView](self, "_updateTitleImageView");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[_CAMExpandingControlButton isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)_CAMExpandingControlButton;
  -[_CAMExpandingControlButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[_CAMExpandingControlButton _titleLabel](self, "_titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v7, v3, 4);

  }
}

- (void)setTitleImage:(id)a3
{
  if ((objc_msgSend(a3, "isEqual:", self->_titleImage) & 1) == 0)
  {
    self->_titleImage = (UIImage *)a3;
    -[_CAMExpandingControlButton _updateTitleImageView](self, "_updateTitleImageView");
    -[_CAMExpandingControlButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTitleImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  -[_CAMExpandingControlButton _titleImageView](self, "_titleImageView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[_CAMExpandingControlButton titleImage](self, "titleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 && v3)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[_CAMExpandingControlButton _setTitleImageView:](self, "_setTitleImageView:", v20);
    -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v20);

  }
  objc_msgSend(v20, "setImage:", v3);
  -[_CAMExpandingControlButton tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_CAMExpandingControlButton border](self, "border");
  switch(v7)
  {
    case 2:
      -[_CAMExpandingControlButton _filledOutlineContentView](self, "_filledOutlineContentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        -[_CAMExpandingControlButton _createFilledOutlineContentView](self, "_createFilledOutlineContentView");
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CAMExpandingControlButton _titleImageView](self, "_titleImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTintColor:", v12);

      -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAlpha:", 0.0);

      -[_CAMExpandingControlButton _filledOutlineContentView](self, "_filledOutlineContentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 1.0;
      goto LABEL_15;
    case 1:
      -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        -[_CAMExpandingControlButton _createOutlineContentView](self, "_createOutlineContentView");
      -[_CAMExpandingControlButton _titleImageView](self, "_titleImageView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTintColor:", v6);

      -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0.6;
      goto LABEL_14;
    case 0:
      -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0.0;
LABEL_14:
      objc_msgSend(v8, "setAlpha:", v10);

      -[_CAMExpandingControlButton _filledOutlineContentView](self, "_filledOutlineContentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 0.0;
LABEL_15:
      objc_msgSend(v15, "setAlpha:", v17);

      break;
  }

}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CAMExpandingControlButton titleFont](self, "titleFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_CAMExpandingControlButton setTitleText:font:](self, "setTitleText:font:", v4, v5);

}

- (void)setTitleText:(id)a3 font:(id)a4
{
  UIFont *v7;
  NSString *titleText;
  void *v9;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  v7 = (UIFont *)a4;
  titleText = self->_titleText;
  if (titleText != v11 && !-[NSString isEqualToString:](titleText, "isEqualToString:", v11)
    || self->_titleFont != v7 && (-[UIFont isEqual:](v7, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    self->_titleFont = v7;
    -[_CAMExpandingControlButton _updateTitleLabel](self, "_updateTitleLabel");
    -[_CAMExpandingControlButton _titleLabel](self, "_titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intrinsicContentSize");
    -[_CAMExpandingControlButton traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    CEKSizeCeilToScale();
    -[_CAMExpandingControlButton _setIntrinsicLabelSize:](self, "_setIntrinsicLabelSize:");

    -[_CAMExpandingControlButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_effectiveTitleFont
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[_CAMExpandingControlButton titleFont](self, "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[CAMFont cameraFontOfSize:weight:](CAMFont, "cameraFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1438]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)_effectiveSubtitleFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_CAMExpandingControlButton titleFont](self, "titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_CAMExpandingControlButton titleText](self, "titleText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsString:", CFSTR("\n")) & 1) != 0)
      +[CAMFont cameraFontOfSize:weight:](CAMFont, "cameraFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1440]);
    else
      -[_CAMExpandingControlButton _effectiveTitleFont](self, "_effectiveTitleFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_updateTitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_CAMExpandingControlButton _titleLabel](self, "_titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_CAMExpandingControlButton titleText](self, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && v3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v6, "setNumberOfLines:", 0);
    -[_CAMExpandingControlButton _setTitleLabel:](self, "_setTitleLabel:", v6);
    -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentView:", v6);

  }
  -[_CAMExpandingControlButton _attributedTextForTitle:](self, "_attributedTextForTitle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

}

- (id)_attributedTextForTitle:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    CEKPixelWidthForView();
    objc_msgSend(v5, "setParagraphSpacing:", v6 + -3.0);
    objc_msgSend(v5, "setAlignment:", 1);
    -[_CAMExpandingControlButton tintColor](self, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CAMExpandingControlButton _effectiveTitleFont](self, "_effectiveTitleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    v10 = *MEMORY[0x1E0DC1138];
    v22[0] = *MEMORY[0x1E0DC1178];
    v22[1] = v10;
    v23[0] = v5;
    v23[1] = v8;
    v22[2] = *MEMORY[0x1E0DC1140];
    v23[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v4, v11);

    v13 = objc_msgSend(v4, "rangeOfString:", CFSTR("\n"));
    if (v13 < objc_msgSend(v4, "length") - 2)
    {
      v14 = v13 + 1;
      v15 = objc_msgSend(v4, "length") + ~v13;
      v16 = (void *)objc_msgSend(v12, "mutableCopy");
      v20 = v10;
      -[_CAMExpandingControlButton _effectiveSubtitleFont](self, "_effectiveSubtitleFont");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAttributes:range:", v18, v14, v15);

      v12 = v16;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setSlashed:(BOOL)a3
{
  -[_CAMExpandingControlButton setSlashed:animated:](self, "setSlashed:animated:", a3, 0);
}

- (void)setSlashed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSlashed:animated:", v5, v4);

}

- (BOOL)isSlashed
{
  void *v2;
  char v3;

  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSlashed");

  return v3;
}

- (CGSize)slashSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slashSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setSlashSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSlashSize:", width, height);

}

- (void)setBorder:(int64_t)a3
{
  if (self->_border != a3)
  {
    self->_border = a3;
    -[_CAMExpandingControlButton _updateTitleImageView](self, "_updateTitleImageView");
  }
}

- (void)_createOutlineContentView
{
  id v3;
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *outlineContentView;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[_CAMExpandingControlButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  +[CAMControlStatusIndicator stretchableCircleImageFilled:scale:](CAMControlStatusIndicator, "stretchableCircleImageFilled:scale:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v5);
  outlineContentView = self->__outlineContentView;
  self->__outlineContentView = v6;

  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CAMExpandingControlButton _outlineContentView](self, "_outlineContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertSubview:atIndex:", v9, 0);

}

- (void)_createFilledOutlineContentView
{
  id v3;
  void *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *filledOutlineContentView;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[_CAMExpandingControlButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  +[CAMControlStatusIndicator stretchableCircleImageFilled:scale:](CAMControlStatusIndicator, "stretchableCircleImageFilled:scale:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v5);
  filledOutlineContentView = self->__filledOutlineContentView;
  self->__filledOutlineContentView = v6;

  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CAMExpandingControlButton _filledOutlineContentView](self, "_filledOutlineContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertSubview:atIndex:", v9, 0);

}

- (void)setOrientation:(int64_t)a3
{
  id v4;

  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrientation:", a3);

}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOrientation:animated:", a3, v4);

}

- (int64_t)orientation
{
  void *v2;
  int64_t v3;

  -[_CAMExpandingControlButton _titleContentView](self, "_titleContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  return v3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (int64_t)border
{
  return self->_border;
}

- (CAMSlashContainer)_titleContentView
{
  return self->__titleContentView;
}

- (UIImageView)_outlineContentView
{
  return self->__outlineContentView;
}

- (UIImageView)_filledOutlineContentView
{
  return self->__filledOutlineContentView;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)_setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->__titleLabel, a3);
}

- (UIImageView)_titleImageView
{
  return self->__titleImageView;
}

- (void)_setTitleImageView:(id)a3
{
  objc_storeStrong((id *)&self->__titleImageView, a3);
}

- (CGSize)_intrinsicLabelSize
{
  double width;
  double height;
  CGSize result;

  width = self->__intrinsicLabelSize.width;
  height = self->__intrinsicLabelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setIntrinsicLabelSize:(CGSize)a3
{
  self->__intrinsicLabelSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleImageView, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__filledOutlineContentView, 0);
  objc_storeStrong((id *)&self->__outlineContentView, 0);
  objc_storeStrong((id *)&self->__titleContentView, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
