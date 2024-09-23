@implementation CAMFocalLengthLabel

- (CAMFocalLengthLabel)initWithFrame:(CGRect)a3
{
  CAMFocalLengthLabel *v3;
  UILabel *v4;
  UILabel *numeralLabel;
  UILabel *v6;
  UILabel *unitLabel;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMFocalLengthLabel;
  v3 = -[CAMFocalLengthLabel initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    numeralLabel = v3->__numeralLabel;
    v3->__numeralLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    unitLabel = v3->__unitLabel;
    v3->__unitLabel = v6;

    -[UILabel setTextAlignment:](v3->__numeralLabel, "setTextAlignment:", 1);
    -[UILabel setTextAlignment:](v3->__unitLabel, "setTextAlignment:", 1);
    -[CAMFocalLengthLabel addSubview:](v3, "addSubview:", v3->__numeralLabel);
    -[CAMFocalLengthLabel addSubview:](v3, "addSubview:", v3->__unitLabel);
    -[CAMFocalLengthLabel _updateFontsAndTextAnimated:](v3, "_updateFontsAndTextAnimated:", 0);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CAMFocalLengthLabel _unitFont](self, "_unitFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel _numeralFont](self, "_numeralFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ascender");
  objc_msgSend(v3, "descender");
  objc_msgSend(v4, "ascender");
  UIRoundToViewScale();
  v6 = v5;
  -[CAMFocalLengthLabel _numeralSize](self, "_numeralSize");
  -[CAMFocalLengthLabel _unitSize](self, "_unitSize");
  UICeilToViewScale();
  v8 = v7;

  v9 = v8;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  id v23;
  CGRect v24;

  -[CAMFocalLengthLabel _numeralLabel](self, "_numeralLabel");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel _unitLabel](self, "_unitLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CAMFocalLengthLabel _numeralSize](self, "_numeralSize");
  v13 = v12;
  -[CAMFocalLengthLabel _unitSize](self, "_unitSize");
  v15 = v14;
  CEKPixelWidthForView();
  v17 = v5 + v16;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v18 = CGRectGetMaxY(v24) - v15;
  -[CAMFocalLengthLabel _unitFont](self, "_unitFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel _numeralFont](self, "_numeralFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ascender");
  objc_msgSend(v20, "capHeight");
  objc_msgSend(v19, "descender");
  UIRoundToViewScale();
  v22 = v18 - v21;
  objc_msgSend(v23, "setFrame:", v5, v7 - v21, v9, v13);
  objc_msgSend(v3, "setFrame:", v17, v22, v9, v15);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  id v5;

  -[CAMFocalLengthLabel tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel _numeralLabel](self, "_numeralLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  -[CAMFocalLengthLabel _unitLabel](self, "_unitLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *category;

  objc_msgSend(a3, "preferredContentSizeCategory");
  category = (NSString *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = UIContentSizeCategoryIsAccessibilityCategory(category);
  if ((_DWORD)v4 != UIContentSizeCategoryIsAccessibilityCategory(v5))
    -[CAMFocalLengthLabel _updateFontsAndTextAnimated:](self, "_updateFontsAndTextAnimated:", 0);

}

- (void)setFocalLength:(int64_t)a3
{
  -[CAMFocalLengthLabel setFocalLength:animated:](self, "setFocalLength:animated:", a3, 0);
}

- (void)setFocalLength:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_focalLength != a3)
  {
    self->_focalLength = a3;
    -[CAMFocalLengthLabel _updateNumeralTextAnimated:](self, "_updateNumeralTextAnimated:", a4);
  }
}

- (void)_updateFontsAndTextAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[CAMFocalLengthLabel traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v8 = 13.0;
  if (IsAccessibilityCategory)
  {
    v8 = 17.0;
    v9 = 12.0;
  }
  else
  {
    v9 = 9.0;
  }
  v10 = *MEMORY[0x1E0DC1448];
  +[CAMFont cameraMonospacedFontOfSize:weight:](CAMFont, "cameraMonospacedFontOfSize:weight:", v8, *MEMORY[0x1E0DC1448]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel set_numeralFont:](self, "set_numeralFont:", v11);

  +[CAMFont cameraMonospacedFontOfSize:weight:](CAMFont, "cameraMonospacedFontOfSize:weight:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel set_unitFont:](self, "set_unitFont:", v12);

  -[CAMFocalLengthLabel _updateNumeralTextAnimated:](self, "_updateNumeralTextAnimated:", v3);
  -[CAMFocalLengthLabel _updateUnitText](self, "_updateUnitText");
}

- (void)_updateNumeralTextAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[CAMFocalLengthLabel _numeralFont](self, "_numeralFont", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel _numeralLabel](self, "_numeralLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC1150];
  v15[0] = *MEMORY[0x1E0DC1138];
  v15[1] = v6;
  v16[0] = v4;
  v16[1] = &unk_1EA3B1AA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMFocalLengthLabel focalLength](self, "focalLength");
  if (v8 > 3)
    v9 = 0;
  else
    v9 = qword_1DB9A7748[v8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v7);
  objc_msgSend(v5, "setAttributedText:", v11);

  objc_msgSend(v5, "intrinsicContentSize");
  UICeilToViewScale();
  v13 = v12;
  UICeilToViewScale();
  -[CAMFocalLengthLabel set_numeralSize:](self, "set_numeralSize:", v13, v14);

}

- (void)_updateUnitText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[CAMFocalLengthLabel _unitFont](self, "_unitFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFocalLengthLabel _unitLabel](self, "_unitLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC1150];
  v11[0] = *MEMORY[0x1E0DC1138];
  v11[1] = v5;
  v12[0] = v3;
  v12[1] = &unk_1EA3B0F10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("MM"), v6);
  objc_msgSend(v4, "setAttributedText:", v7);

  objc_msgSend(v4, "intrinsicContentSize");
  UICeilToViewScale();
  v9 = v8;
  UICeilToViewScale();
  -[CAMFocalLengthLabel set_unitSize:](self, "set_unitSize:", v9, v10);

}

- (int64_t)focalLength
{
  return self->_focalLength;
}

- (UILabel)_unitLabel
{
  return self->__unitLabel;
}

- (UILabel)_numeralLabel
{
  return self->__numeralLabel;
}

- (UIFont)_numeralFont
{
  return self->__numeralFont;
}

- (void)set_numeralFont:(id)a3
{
  objc_storeStrong((id *)&self->__numeralFont, a3);
}

- (UIFont)_unitFont
{
  return self->__unitFont;
}

- (void)set_unitFont:(id)a3
{
  objc_storeStrong((id *)&self->__unitFont, a3);
}

- (CGSize)_numeralSize
{
  double width;
  double height;
  CGSize result;

  width = self->__numeralSize.width;
  height = self->__numeralSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_numeralSize:(CGSize)a3
{
  self->__numeralSize = a3;
}

- (CGSize)_unitSize
{
  double width;
  double height;
  CGSize result;

  width = self->__unitSize.width;
  height = self->__unitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_unitSize:(CGSize)a3
{
  self->__unitSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__unitFont, 0);
  objc_storeStrong((id *)&self->__numeralFont, 0);
  objc_storeStrong((id *)&self->__numeralLabel, 0);
  objc_storeStrong((id *)&self->__unitLabel, 0);
}

@end
