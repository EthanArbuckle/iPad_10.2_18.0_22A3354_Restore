@implementation ASCExpandableLabelTruncationButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (double)maximumFadeWidth
{
  return 100.0;
}

- (ASCExpandableLabelTruncationButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ASCExpandableLabelTruncationButton *v7;
  ASCExpandableLabelTruncationButton *v8;
  uint64_t v9;
  UIColor *gradientColor;
  uint64_t v11;
  UILabel *moreLabel;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)ASCExpandableLabelTruncationButton;
  v7 = -[ASCExpandableLabelTruncationButton initWithFrame:](&v19, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_isRTL = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = objc_claimAutoreleasedReturnValue();
    gradientColor = v8->_gradientColor;
    v8->_gradientColor = (UIColor *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    moreLabel = v8->_moreLabel;
    v8->_moreLabel = (UILabel *)v11;

    ASCLocalizedString(CFSTR("EXPANDABLE_LABEL_TRUNCATION_TEXT"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v8->_moreLabel, "setText:", v14);

    -[ASCExpandableLabelTruncationButton tintColor](v8, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_moreLabel, "setTextColor:", v15);

    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_moreLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[ASCExpandableLabelTruncationButton addSubview:](v8, "addSubview:", v8->_moreLabel);
    v20[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[ASCExpandableLabelTruncationButton registerForTraitChanges:withTarget:action:](v8, "registerForTraitChanges:withTarget:action:", v16, v8, sel_updateGradientLayer);

  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lineHeight");
  v14 = v13 + v13;

  +[ASCExpandableLabelTruncationButton maximumFadeWidth](ASCExpandableLabelTruncationButton, "maximumFadeWidth");
  if (v14 >= v15)
    v14 = v15;
  -[ASCExpandableLabelTruncationButton doubleSpaceWidth](self, "doubleSpaceWidth");
  v17 = v8 + v16 + v14;
  v18 = v10;
  result.height = v18;
  result.width = v17;
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
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ASCExpandableLabelTruncationButton;
  -[ASCExpandableLabelTruncationButton layoutSubviews](&v15, sel_layoutSubviews);
  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCExpandableLabelTruncationButton bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;

  v10 = 0.0;
  if (!-[ASCExpandableLabelTruncationButton isRTL](self, "isRTL"))
  {
    -[ASCExpandableLabelTruncationButton bounds](self, "bounds");
    v10 = v11 - v7;
  }
  -[ASCExpandableLabelTruncationButton bounds](self, "bounds");
  v13 = v12 * 0.5 - v9 * 0.5;
  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v10, v13, v7, v9);

  -[ASCExpandableLabelTruncationButton updateGradientLayer](self, "updateGradientLayer");
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (double)doubleSpaceWidth
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0DC32A0];
  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("  "), "boundingRectWithSize:options:attributes:context:", 0, v4, 0, 1.79769313e308, 1.79769313e308);
  v6 = v5;

  return v6;
}

- (void)setGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientColor, a3);
  -[ASCExpandableLabelTruncationButton updateGradientLayer](self, "updateGradientLayer");
}

- (void)updateGradientLayer
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  -[ASCExpandableLabelTruncationButton gradientColor](self, "gradientColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23[0] = objc_msgSend(v4, "CGColor");
  -[ASCExpandableLabelTruncationButton gradientColor](self, "gradientColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCExpandableLabelTruncationButton layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColors:", v6);

  -[ASCExpandableLabelTruncationButton moreLabel](self, "moreLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  -[ASCExpandableLabelTruncationButton doubleSpaceWidth](self, "doubleSpaceWidth");
  v12 = v11 + v10;

  -[ASCExpandableLabelTruncationButton bounds](self, "bounds");
  v22[0] = &unk_1E757A698;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v12 / v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v15 = objc_claimAutoreleasedReturnValue();
  -[ASCExpandableLabelTruncationButton layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocations:", v15);

  LOBYTE(v15) = -[ASCExpandableLabelTruncationButton isRTL](self, "isRTL");
  -[ASCExpandableLabelTruncationButton layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v17, "setStartPoint:", 1.0, 0.5);

    -[ASCExpandableLabelTruncationButton layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = 0.0;
  }
  else
  {
    objc_msgSend(v17, "setStartPoint:", 0.0, 0.5);

    -[ASCExpandableLabelTruncationButton layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = 1.0;
  }
  objc_msgSend(v19, "setEndPoint:", v21, 0.5);

}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (UILabel)moreLabel
{
  return self->_moreLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreLabel, 0);
  objc_storeStrong((id *)&self->_gradientColor, 0);
}

@end
