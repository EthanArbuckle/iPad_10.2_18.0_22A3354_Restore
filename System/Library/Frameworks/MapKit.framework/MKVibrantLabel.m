@implementation MKVibrantLabel

- (MKVibrantLabel)initWithStyle:(int64_t)a3
{
  MKVibrantLabel *v4;
  MKVibrantLabel *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  UILabel *label;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)MKVibrantLabel;
  v4 = -[MKVibrantView initWithEffect:](&v27, sel_initWithEffect_, 0);
  v5 = v4;
  if (v4)
  {
    -[MKVibrantView setStyle:](v4, "setStyle:", a3);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[MKVibrantLabel bounds](v5, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    label = v5->_label;
    v5->_label = (UILabel *)v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKVibrantLabel contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v5->_label);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v5->_label, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel topAnchor](v5, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    -[UILabel leadingAnchor](v5->_label, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel leadingAnchor](v5, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    -[UILabel bottomAnchor](v5->_label, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel bottomAnchor](v5, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v16;
    -[UILabel trailingAnchor](v5->_label, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantLabel trailingAnchor](v5, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v20);

  }
  return v5;
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setAttributedText:(id)a3
{
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", a3);
}

- (NSAttributedString)attributedText
{
  return -[UILabel attributedText](self->_label, "attributedText");
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_label, "setFont:", a3);
}

- (UIFont)font
{
  return -[UILabel font](self->_label, "font");
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", a3);
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_label, "numberOfLines");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", a3);
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_label, "textAlignment");
}

- (void)_setHyphenationFactor:(float)a3
{
  -[UILabel _setHyphenationFactor:](self->_label, "_setHyphenationFactor:");
}

- (float)_hyphenationFactor
{
  float result;

  -[UILabel _hyphenationFactor](self->_label, "_hyphenationFactor");
  return result;
}

- (double)idealWidth
{
  double result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  return result;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return -[UILabel allowsDefaultTighteningForTruncation](self->_label, "allowsDefaultTighteningForTruncation");
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3
{
  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_label, "setAllowsDefaultTighteningForTruncation:", a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[UILabel adjustsFontForContentSizeCategory](self->_label, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_label, "setAdjustsFontForContentSizeCategory:", a3);
}

- (int64_t)lineBreakMode
{
  return -[UILabel lineBreakMode](self->_label, "lineBreakMode");
}

- (void)setLineBreakMode:(int64_t)a3
{
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", a3);
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_label, "textColor");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
