@implementation ASAccessoryInfoHeaderCell

- (void)commonInit
{
  void *v3;
  ASAccessoryInfoHeaderView *v4;
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
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[ASAccessoryInfoHeaderView initWithDevice:insets:]([ASAccessoryInfoHeaderView alloc], "initWithDevice:insets:", v24, 16.0, 16.0, 16.0, 16.0);
  -[ASAccessoryInfoHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASAccessoryInfoHeaderCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  v16 = (void *)MEMORY[0x24BDD1628];
  -[ASAccessoryInfoHeaderView leadingAnchor](v4, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  -[ASAccessoryInfoHeaderView trailingAnchor](v4, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  -[ASAccessoryInfoHeaderView topAnchor](v4, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v9;
  -[ASAccessoryInfoHeaderView bottomAnchor](v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoHeaderCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v14);

}

+ (double)headerHeight
{
  return 178.0;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
