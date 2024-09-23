@implementation CPSVibrantLabel

- (CPSVibrantLabel)initWithTextStyle:(id)a3 textVariant:(int64_t)a4 vibrancyEffectStyle:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  CPSVibrantLabel *v11;
  uint64_t v12;
  UILabel *label;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CPSVibrantLabel *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  objc_super v39;
  _QWORD v40[6];

  v40[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)CPSVibrantLabel;
  v11 = -[CPSVibrantLabel initWithEffect:](&v39, sel_initWithEffect_, v10);
  if (v11)
  {
    v12 = objc_opt_new();
    v37 = v9;
    label = v11->_label;
    v11->_label = (UILabel *)v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", v8, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11->_label, "setFont:", v14);

    -[UILabel setAdjustsFontForContentSizeCategory:](v11->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[CPSVibrantLabel contentView](v11, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v11->_label);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v11->_label, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantLabel contentView](v11, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v32;
    -[UILabel leadingAnchor](v11->_label, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantLabel contentView](v11, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v27;
    -[UILabel bottomAnchor](v11->_label, "bottomAnchor");
    v36 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantLabel contentView](v11, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v38 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v19;
    -[UILabel trailingAnchor](v11->_label, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSVibrantLabel contentView](v11, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v24);

    v9 = v37;
    v8 = v38;

    v10 = v36;
    v25 = v11;
  }

  return v11;
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

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_label, "setAdjustsFontForContentSizeCategory:", a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[UILabel adjustsFontForContentSizeCategory](self->_label, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", a3);
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_label, "adjustsFontSizeToFitWidth");
}

- (void)setLineBreakMode:(int64_t)a3
{
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", a3);
}

- (int64_t)lineBreakMode
{
  return -[UILabel lineBreakMode](self->_label, "lineBreakMode");
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
