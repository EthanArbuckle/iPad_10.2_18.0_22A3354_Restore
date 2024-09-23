@implementation CKDetailsShowMoreContactsLargeTextCell

- (CKDetailsShowMoreContactsLargeTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsShowMoreContactsLargeTextCell *v4;
  CKDetailsShowMoreContactsLargeTextCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDetailsShowMoreContactsLargeTextCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CKDetailsShowMoreContactsLargeTextCell _initConstraints](v4, "_initConstraints");
  return v5;
}

- (void)_initConstraints
{
  void *v3;
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
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  -[CKDetailsShowMoreContactsLargeTextCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)MEMORY[0x1E0CB3718];
  -[CKDetailsShowMoreContactsLargeTextCell textLabel](self, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsShowMoreContactsLargeTextCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  -[CKDetailsShowMoreContactsLargeTextCell textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsShowMoreContactsLargeTextCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  -[CKDetailsShowMoreContactsLargeTextCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsShowMoreContactsLargeTextCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v13);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  -[CKDetailsShowMoreContactsLargeTextCell contentView](self, "contentView", a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  v8 = v7;

  -[CKDetailsShowMoreContactsLargeTextCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, height);
  v11 = v10;

  v12 = v11 + 20.0;
  v13 = v8;
  result.height = v12;
  result.width = v13;
  return result;
}

@end
