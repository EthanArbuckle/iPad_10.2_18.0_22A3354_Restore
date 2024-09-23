@implementation WDMedicalRecordSpacerTextCell

- (WDMedicalRecordSpacerTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDMedicalRecordSpacerTextCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDMedicalRecordSpacerTextCell;
  v4 = -[WDMedicalRecordSpacerTextCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordSpacerTextCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[WDMedicalRecordSpacerTextCell _setupSubviews](v4, "_setupSubviews");
  }
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordSpacerTextCell setTitleLabel:](self, "setTitleLabel:", v3);

  -[WDMedicalRecordSpacerTextCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4AB8], 1024);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSpacerTextCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[WDMedicalRecordSpacerTextCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSpacerTextCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[WDMedicalRecordSpacerTextCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSpacerTextCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 18.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[WDMedicalRecordSpacerTextCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSpacerTextCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -18.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[WDMedicalRecordSpacerTextCell titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSpacerTextCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -9.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[WDMedicalRecordSpacerTextCell titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSpacerTextCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSpacerTextCell setTopConstraint:](self, "setTopConstraint:", v28);

  -[WDMedicalRecordSpacerTextCell topConstraint](self, "topConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  self->_useTallTopPadding = 0;
}

- (void)setTitle:(id)a3
{
  NSString **p_title;
  void *v6;
  id v7;

  p_title = &self->_title;
  v7 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[NSString localizedUppercaseString](*p_title, "localizedUppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

  }
}

- (void)setUseTallTopPadding:(BOOL)a3
{
  double v3;
  id v4;

  if (self->_useTallTopPadding != a3)
  {
    self->_useTallTopPadding = a3;
    if (a3)
      v3 = 26.0;
    else
      v3 = 20.0;
    -[WDMedicalRecordSpacerTextCell topConstraint](self, "topConstraint");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstant:", v3);

  }
}

+ (id)defaultReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)useTallTopPadding
{
  return self->_useTallTopPadding;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
