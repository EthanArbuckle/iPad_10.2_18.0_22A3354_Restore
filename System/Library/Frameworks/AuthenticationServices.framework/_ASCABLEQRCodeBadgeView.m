@implementation _ASCABLEQRCodeBadgeView

- (_ASCABLEQRCodeBadgeView)initWithFrame:(CGRect)a3
{
  _ASCABLEQRCodeBadgeView *v3;
  _ASCABLEQRCodeBadgePlatterView *v4;
  UIView *platterView;
  id v6;
  void *v7;
  uint64_t v8;
  UIImageView *iconView;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *iconOffsetXConstraint;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *iconOffsetYConstraint;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _ASCABLEQRCodeBadgeView *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[7];

  v36[6] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)_ASCABLEQRCodeBadgeView;
  v3 = -[_ASCABLEQRCodeBadgeView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_ASCABLEQRCodeBadgePlatterView);
    platterView = v3->_platterView;
    v3->_platterView = &v4->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_platterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_ASCABLEQRCodeBadgeView addSubview:](v3, "addSubview:", v3->_platterView);
    v6 = objc_alloc(MEMORY[0x24BEBD668]);
    -[_ASCABLEQRCodeBadgeView _passkeyIcon](v3, "_passkeyIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithImage:", v7);
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v8;

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_iconView, "setTintColor:", v10);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_ASCABLEQRCodeBadgeView addSubview:](v3, "addSubview:", v3->_iconView);
    -[UIImageView centerXAnchor](v3->_iconView, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v3->_platterView, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    iconOffsetXConstraint = v3->_iconOffsetXConstraint;
    v3->_iconOffsetXConstraint = (NSLayoutConstraint *)v13;

    -[UIImageView centerYAnchor](v3->_iconView, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v3->_platterView, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    iconOffsetYConstraint = v3->_iconOffsetYConstraint;
    v3->_iconOffsetYConstraint = (NSLayoutConstraint *)v17;

    v29 = (void *)MEMORY[0x24BDD1628];
    -[UIView leadingAnchor](v3->_platterView, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeBadgeView leadingAnchor](v3, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v32;
    -[UIView trailingAnchor](v3->_platterView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeBadgeView trailingAnchor](v3, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v19;
    -[UIView topAnchor](v3->_platterView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeBadgeView topAnchor](v3, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v22;
    -[UIView bottomAnchor](v3->_platterView, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASCABLEQRCodeBadgeView bottomAnchor](v3, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v25;
    v36[4] = v3->_iconOffsetXConstraint;
    v36[5] = v3->_iconOffsetYConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v26);

    v27 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ASCABLEQRCodeBadgeView;
  -[_ASCABLEQRCodeBadgeView layoutSubviews](&v5, sel_layoutSubviews);
  -[_ASCABLEQRCodeBadgeView bounds](self, "bounds");
  -[_ASCABLEQRCodeBadgeView _updateLayoutMetricsWithFrameSize:](self, "_updateLayoutMetricsWithFrameSize:", v3, v4);
}

- (id)_passkeyIcon
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.badge.key.fill"));
}

- (void)_updateLayoutMetricsWithFrameSize:(CGSize)a3
{
  double width;
  id v5;

  width = a3.width;
  -[NSLayoutConstraint setConstant:](self->_iconOffsetXConstraint, "setConstant:", a3.width * -0.035, a3.height);
  -[NSLayoutConstraint setConstant:](self->_iconOffsetYConstraint, "setConstant:", width * -0.015);
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", width * 0.62);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_iconView, "setPreferredSymbolConfiguration:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconOffsetYConstraint, 0);
  objc_storeStrong((id *)&self->_iconOffsetXConstraint, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
}

@end
