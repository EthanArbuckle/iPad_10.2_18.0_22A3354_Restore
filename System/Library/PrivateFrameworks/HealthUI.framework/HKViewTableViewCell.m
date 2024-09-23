@implementation HKViewTableViewCell

- (HKViewTableViewCell)initWithReuseIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKViewTableViewCell;
  return -[HKViewTableViewCell initWithStyle:reuseIdentifier:](&v4, sel_initWithStyle_reuseIdentifier_, 0, a3);
}

- (void)setHostedView:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_hostedView, a3);
  v5 = a3;
  -[HKViewTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  -[HKViewTableViewCell _pinViewToContent:](self, "_pinViewToContent:", v5);
  -[HKViewTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  UIView *hostedView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKViewTableViewCell;
  -[HKViewTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  hostedView = self->_hostedView;
  self->_hostedView = 0;

}

- (void)_pinViewToContent:(id)a3
{
  id v4;
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
  id v20;

  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKViewTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKViewTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v4, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKViewTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  objc_msgSend(v4, "bottomAnchor");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[HKViewTableViewCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedView, 0);
}

@end
