@implementation CNVisualIdentityAvatarStyleSectionHeaderView

- (CNVisualIdentityAvatarStyleSectionHeaderView)initWithFrame:(CGRect)a3
{
  CNVisualIdentityAvatarStyleSectionHeaderView *v3;
  UILabel *v4;
  UILabel *label;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)CNVisualIdentityAvatarStyleSectionHeaderView;
  v3 = -[CNVisualIdentityAvatarStyleSectionHeaderView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v4;

    objc_msgSend((id)objc_opt_class(), "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v6);

    -[CNVisualIdentityAvatarStyleSectionHeaderView addSubview:](v3, "addSubview:", v3->_label);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v17;
    -[UILabel topAnchor](v3->_label, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v10;
    -[UILabel bottomAnchor](v3->_label, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  }
  return v3;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (NSString)reuseID
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (CGSize)sizeWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  _QWORD v14[2];
  CGSize result;

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0DC1138];
  v4 = a3;
  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v6, 0, 1.79769313e308, 1.79769313e308);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (UIFont)font
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
}

@end
