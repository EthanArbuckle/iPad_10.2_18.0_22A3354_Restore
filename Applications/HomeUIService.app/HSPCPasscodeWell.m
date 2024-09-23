@implementation HSPCPasscodeWell

- (HSPCPasscodeWell)initWithFrame:(CGRect)a3
{
  HSPCPasscodeWell *v3;
  HSPCPasscodeWell *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HSPCPasscodeWell *v14;
  objc_super v16;
  _QWORD v17[2];

  v16.receiver = self;
  v16.super_class = (Class)HSPCPasscodeWell;
  v3 = -[HSPCPasscodeWell initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HSPCPasscodeWell setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v4->_label;
    v4->_label = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HSPCPasscodeWell addSubview:](v4, "addSubview:", v4->_label);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v4->_label, "centerXAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell centerXAnchor](v4, "centerXAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    v17[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_label, "centerYAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPasscodeWell centerYAnchor](v4, "centerYAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v17[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

    v14 = v4;
  }

  return v4;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
