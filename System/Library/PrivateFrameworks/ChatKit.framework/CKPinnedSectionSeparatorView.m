@implementation CKPinnedSectionSeparatorView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CKPinnedSectionSeparatorView)initWithFrame:(CGRect)a3
{
  CKPinnedSectionSeparatorView *v3;
  id v4;
  double v5;
  double v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)CKPinnedSectionSeparatorView;
  v3 = -[CKPinnedSectionSeparatorView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKPinnedSectionSeparatorView bounds](v3, "bounds");
    v6 = v5 * 0.5 + -1.0;
    -[CKPinnedSectionSeparatorView bounds](v3, "bounds");
    v7 = (void *)objc_msgSend(v4, "initWithFrame:", 0.0, v6);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 1.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v9);

    -[CKPinnedSectionSeparatorView addSubview:](v3, "addSubview:", v7);
    v20 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedSectionSeparatorView leadingAnchor](v3, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    objc_msgSend(v7, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedSectionSeparatorView trailingAnchor](v3, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v21;
    objc_msgSend(v7, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedSectionSeparatorView centerXAnchor](v3, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v11;
    objc_msgSend(v7, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedSectionSeparatorView centerYAnchor](v3, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v14;
    objc_msgSend(v7, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v17);

  }
  return v3;
}

+ (UIEdgeInsets)padding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 4.0;
  v3 = 0.0;
  v4 = 4.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)heightWithPadding
{
  double v2;
  double v3;

  objc_msgSend((id)objc_opt_class(), "padding");
  return v3 + v2 + 2.0;
}

@end
