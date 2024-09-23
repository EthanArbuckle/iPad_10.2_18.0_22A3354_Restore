@implementation AMSUIOnboardingFeatureView

- (AMSUIOnboardingFeatureView)initWithFeature:(id)a3
{
  id v4;
  AMSUIOnboardingFeatureView *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  UILabel *v12;
  UILabel *descriptionLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIOnboardingFeatureView;
  v5 = -[AMSUIOnboardingFeatureView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    objc_msgSend(v4, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v5->_imageView, "setImage:", v8);

    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 1);
    -[AMSUIOnboardingFeatureView addSubview:](v5, "addSubview:", v5->_imageView);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_titleLabel, "setLineBreakMode:", 0);
    objc_msgSend(v4, "titleText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_titleLabel, "setText:", v11);

    -[AMSUIOnboardingFeatureView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v12;

    -[UILabel setNumberOfLines:](v5->_descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_descriptionLabel, "setLineBreakMode:", 0);
    objc_msgSend(v4, "descriptionText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_descriptionLabel, "setText:", v14);

    -[AMSUIOnboardingFeatureView addSubview:](v5, "addSubview:", v5->_descriptionLabel);
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE220], 2, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingFeatureView titleLabel](v5, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    v18 = (void *)MEMORY[0x24BEBB520];
    v19 = *MEMORY[0x24BEBE228];
    -[AMSUIOnboardingFeatureView traitCollection](v5, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferredFontForTextStyle:compatibleWithTraitCollection:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingFeatureView descriptionLabel](v5, "descriptionLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v21);

  }
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double MaxY;
  void *v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v30.receiver = self;
  v30.super_class = (Class)AMSUIOnboardingFeatureView;
  -[AMSUIOnboardingFeatureView layoutSubviews](&v30, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMSUIOnboardingFeatureView semanticContentAttribute](self, "semanticContentAttribute"));
  -[AMSUIOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AMSUIOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") == 0;

  }
  else
  {
    v8 = 1;
  }

  v9 = 0.0;
  v10 = 0.0;
  if (v3 == 1)
  {
    -[AMSUIOnboardingFeatureView bounds](self, "bounds");
    v10 = CGRectGetWidth(v31) + -50.0;
  }
  if (!v8)
  {
    -[AMSUIOnboardingFeatureView bounds](self, "bounds");
    v9 = CGRectGetHeight(v32) * 0.5 + -25.0;
  }
  -[AMSUIOnboardingFeatureView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v10, v9, 50.0, 50.0);

  -[AMSUIOnboardingFeatureView bounds](self, "bounds");
  v12 = CGRectGetWidth(v33) + -75.0;
  -[AMSUIOnboardingFeatureView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v12, 3.40282347e38);
  v15 = v14;
  v17 = v16;

  -[AMSUIOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", v12, 3.40282347e38);
  v20 = v19;
  v22 = v21;

  if (v3 == 1)
  {
    -[AMSUIOnboardingFeatureView bounds](self, "bounds");
    v23 = CGRectGetWidth(v34) + -75.0 - v15;
  }
  else
  {
    v23 = 75.0;
  }
  v24 = 0.0;
  if (v8)
  {
    -[AMSUIOnboardingFeatureView bounds](self, "bounds");
    v24 = CGRectGetHeight(v35) * 0.5 - v17 * 0.5;
  }
  -[AMSUIOnboardingFeatureView titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v23, v24, v15, v17);

  if (v3 == 1)
  {
    -[AMSUIOnboardingFeatureView bounds](self, "bounds");
    v26 = CGRectGetWidth(v36) + -75.0 - v20;
  }
  else
  {
    v26 = 75.0;
  }
  -[AMSUIOnboardingFeatureView titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  MaxY = CGRectGetMaxY(v37);
  -[AMSUIOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v26, MaxY, v20, v22);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  -[AMSUIOnboardingFeatureView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width + -75.0, 3.40282347e38);
  v7 = v6;

  -[AMSUIOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width + -75.0, 3.40282347e38);
  v10 = v9;

  v11 = v7 + v10;
  if (v7 + v10 < 50.0)
    v11 = 50.0;
  v12 = v11;
  v13 = roundf(v12);
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSUIOnboardingFeatureView;
  -[AMSUIOnboardingFeatureView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, a3);
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE220], 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingFeatureView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)MEMORY[0x24BEBB520];
  v8 = *MEMORY[0x24BEBE228];
  -[AMSUIOnboardingFeatureView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[AMSUIOnboardingFeatureView setNeedsLayout](self, "setNeedsLayout");
}

- (double)baselineOffsetFromBottom
{
  void *v2;
  double v3;
  double v4;

  -[AMSUIOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_baselineOffsetFromBottom");
  v4 = v3;

  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
