@implementation AKAuthorizationBulletPointSubPane

- (AKAuthorizationBulletPointSubPane)initWithImage:(id)a3 title:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  UIView *v12;
  UIView *baseView;
  UIView *v14;
  AKAuthorizationBulletPointSubPane *v15;
  AKAuthorizationBulletPointSubPane *v16;
  uint64_t v17;
  UIImageView *bulletImageView;
  uint64_t v19;
  UIStackView *messageStackView;
  uint64_t v21;
  UILabel *titleLabel;
  uint64_t v23;
  UILabel *messageLabel;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v12 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  baseView = self->_baseView;
  self->_baseView = v12;

  v14 = self->_baseView;
  v26.receiver = self;
  v26.super_class = (Class)AKAuthorizationBulletPointSubPane;
  v15 = -[AKAuthorizationSubPane initWithView:](&v26, sel_initWithView_, v14);
  v16 = v15;
  if (v15)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15->_baseView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AKAuthorizationBulletPointSubPane _imageViewWithImage:](v16, "_imageViewWithImage:", v8);
    v17 = objc_claimAutoreleasedReturnValue();
    bulletImageView = v16->_bulletImageView;
    v16->_bulletImageView = (UIImageView *)v17;

    -[UIView addSubview:](v16->_baseView, "addSubview:", v16->_bulletImageView);
    -[AKAuthorizationBulletPointSubPane _verticalStackView](v16, "_verticalStackView");
    v19 = objc_claimAutoreleasedReturnValue();
    messageStackView = v16->_messageStackView;
    v16->_messageStackView = (UIStackView *)v19;

    -[UIView addSubview:](v16->_baseView, "addSubview:", v16->_messageStackView);
    -[AKAuthorizationBulletPointSubPane _labelWithString:title:](v16, "_labelWithString:title:", v9, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    titleLabel = v16->_titleLabel;
    v16->_titleLabel = (UILabel *)v21;

    -[AKAuthorizationBulletPointSubPane _labelWithString:title:](v16, "_labelWithString:title:", v10, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    messageLabel = v16->_messageLabel;
    v16->_messageLabel = (UILabel *)v23;

    -[UIStackView addArrangedSubview:](v16->_messageStackView, "addArrangedSubview:", v16->_titleLabel);
    -[UIStackView addArrangedSubview:](v16->_messageStackView, "addArrangedSubview:", v16->_messageLabel);
  }

  return v16;
}

- (id)_labelWithString:(id)a3 title:(BOOL)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0CEA700];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (a4)
  {
    +[AKAuthorizationAppearance bulletInfoLabelTitleFont](AKAuthorizationAppearance, "bulletInfoLabelTitleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    objc_msgSend(v7, "setTextAlignment:", 4);
    objc_msgSend(v7, "setNumberOfLines:", 0);
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v9);

    objc_msgSend(v7, "setText:", v6);
  }
  else
  {
    +[AKAuthorizationAppearance bulletInfoLabelDescriptionFont](AKAuthorizationAppearance, "bulletInfoLabelDescriptionFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v10);

    objc_msgSend(v7, "setTextAlignment:", 4);
    objc_msgSend(v7, "setNumberOfLines:", 0);
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v11);

    objc_msgSend(v7, "setText:", v6);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);
  }

  return v7;
}

- (id)_verticalStackView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[AKAuthorizationSubPaneMetrics bulletInfoTitleToDescriptionVerticalSpacing](AKAuthorizationSubPaneMetrics, "bulletInfoTitleToDescriptionVerticalSpacing");
  objc_msgSend(v2, "setSpacing:");
  objc_msgSend(v2, "setAlignment:", 1);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setDistribution:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)_imageViewWithImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AKAuthorizationBulletPointSubPane _sizeForBulletImage:](self, "_sizeForBulletImage:", v4);
  objc_msgSend(v4, "ak_copyScaledToSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
  objc_msgSend(v6, "setContentMode:", 5);
  -[AKAuthorizationBulletPointSubPane _iconColor](self, "_iconColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v6;
}

- (CGSize)_sizeForBulletImage:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  objc_msgSend(v3, "size");
  v7 = v6;
  objc_msgSend(v3, "size");
  v9 = v8;
  v11 = v10;

  +[AKAuthorizationSubPaneMetrics bulletImageSize](AKAuthorizationSubPaneMetrics, "bulletImageSize");
  if (v5 <= v7)
    +[AKSizing size:scaledForHeight:](AKSizing, "size:scaledForHeight:", v9, v11, v12);
  else
    +[AKSizing size:scaledForWidth:](AKSizing, "size:scaledForWidth:", v9, v11, v12);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  UIView *baseView;
  id v7;
  double v8;
  double v9;
  double v10;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  objc_super v49;
  _QWORD v50[12];

  v50[10] = *MEMORY[0x1E0C80C00];
  baseView = self->_baseView;
  v7 = a4;
  v48 = a3;
  -[UIView leadingAnchor](baseView, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v44;
  -[UIView trailingAnchor](self->_baseView, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v7;
  objc_msgSend(v7, "stackView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v39;
  -[UIView topAnchor](self->_baseView, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "arrangedSubviews");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "lastObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v33;
  -[UIImageView topAnchor](self->_bulletImageView, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel font](self->_titleLabel, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "ascender");
  v9 = v8;
  +[AKAuthorizationSubPaneMetrics bulletImagePixelAdjustmentOffset](AKAuthorizationSubPaneMetrics, "bulletImagePixelAdjustmentOffset");
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -(v9 - v10));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v29;
  -[UIImageView leadingAnchor](self->_bulletImageView, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_baseView, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics bulletLeadingSpacing](AKAuthorizationSubPaneMetrics, "bulletLeadingSpacing");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v26;
  -[UIImageView widthAnchor](self->_bulletImageView, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics bulletImageSize](AKAuthorizationSubPaneMetrics, "bulletImageSize");
  objc_msgSend(v25, "constraintEqualToConstant:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v24;
  -[UIStackView leadingAnchor](self->_messageStackView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_bulletImageView, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics bulletImageToInfoLabelSpacing](AKAuthorizationSubPaneMetrics, "bulletImageToInfoLabelSpacing");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v21;
  -[UIStackView trailingAnchor](self->_messageStackView, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_baseView, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationSubPaneMetrics bulletTrailingSpacing](AKAuthorizationSubPaneMetrics, "bulletTrailingSpacing");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v12;
  -[UIStackView topAnchor](self->_messageStackView, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_baseView, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v15;
  -[UIStackView bottomAnchor](self->_messageStackView, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_baseView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObjectsFromArray:", v19);

  v49.receiver = self;
  v49.super_class = (Class)AKAuthorizationBulletPointSubPane;
  -[AKAuthorizationSubPane addToConstraints:context:](&v49, sel_addToConstraints_context_, v48, v43);

}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_bulletImageView, "setImage:", a3);
}

- (UIImage)image
{
  return -[UIImageView image](self->_bulletImageView, "image");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setMessage:(id)a3
{
  -[UILabel setText:](self->_messageLabel, "setText:", a3);
}

- (NSString)message
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (id)_iconColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("firstTimeColor"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIView)baseView
{
  return self->_baseView;
}

- (UIImageView)bulletImageView
{
  return self->_bulletImageView;
}

- (UIStackView)messageStackView
{
  return self->_messageStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageStackView, 0);
  objc_storeStrong((id *)&self->_bulletImageView, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
}

@end
