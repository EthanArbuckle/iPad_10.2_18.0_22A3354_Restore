@implementation HSPCNameServiceNoIconRow

+ (id)_reuseIdentifier
{
  return CFSTR("HSPCNameServiceNoIconRow");
}

+ (double)leadingSeparatorMargin
{
  double result;

  +[HSPCRow horizontalLeadingMargin](HSPCRow, "horizontalLeadingMargin");
  return result;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  if (!-[HSPCRow constraintsSet](self, "constraintsSet"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceNoIconRow contentView](self, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    +[HSPCRow horizontalLeadingMargin](HSPCRow, "horizontalLeadingMargin");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22));
    v27[0] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceNoIconRow contentView](self, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
    v27[1] = v16;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceNoIconRow contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    +[HSPCRow horizontalTrailingMargin](HSPCRow, "horizontalTrailingMargin");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v5, -v6));
    v27[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCRow textField](self, "textField"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServiceNoIconRow contentView](self, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    v27[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    -[HSPCRow setConstraintsSet:](self, "setConstraintsSet:", 1);
  }
  v26.receiver = self;
  v26.super_class = (Class)HSPCNameServiceNoIconRow;
  -[HSPCNameServiceRow updateConstraints](&v26, "updateConstraints");
}

@end
