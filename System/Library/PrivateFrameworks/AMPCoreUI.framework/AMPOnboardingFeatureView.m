@implementation AMPOnboardingFeatureView

- (AMPOnboardingFeatureView)initWithFeature:(id)a3
{
  id v4;
  AMPOnboardingFeatureView *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  UILabel *v12;
  UILabel *descriptionLabel;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMPOnboardingFeatureView;
  v5 = -[AMPOnboardingFeatureView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    objc_msgSend(v4, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v5->_imageView, "setImage:", v8);

    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 4);
    -[AMPOnboardingFeatureView addSubview:](v5, "addSubview:", v5->_imageView);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_titleLabel, "setLineBreakMode:", 0);
    objc_msgSend(v4, "titleText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_titleLabel, "setText:", v11);

    -[AMPOnboardingFeatureView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v12;

    -[UILabel setNumberOfLines:](v5->_descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_descriptionLabel, "setLineBreakMode:", 0);
    objc_msgSend(v4, "descriptionText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_descriptionLabel, "setText:", v14);

    -[AMPOnboardingFeatureView addSubview:](v5, "addSubview:", v5->_descriptionLabel);
  }

  return v5;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double MaxY;
  void *v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v23.receiver = self;
  v23.super_class = (Class)AMPOnboardingFeatureView;
  -[AMPOnboardingFeatureView layoutSubviews](&v23, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMPOnboardingFeatureView semanticContentAttribute](self, "semanticContentAttribute"));
  v4 = 0.0;
  if (v3 == 1)
  {
    -[AMPOnboardingFeatureView bounds](self, "bounds");
    v4 = CGRectGetWidth(v24) + -50.0;
  }
  -[AMPOnboardingFeatureView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v4, 0.0, 50.0, 50.0);

  -[AMPOnboardingFeatureView bounds](self, "bounds");
  v6 = CGRectGetWidth(v25) + -62.0;
  -[AMPOnboardingFeatureView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v6, 3.40282347e38);
  v9 = v8;
  v11 = v10;

  if (v3 == 1)
  {
    -[AMPOnboardingFeatureView bounds](self, "bounds");
    v12 = CGRectGetWidth(v26) + -62.0 - v9;
  }
  else
  {
    v12 = 62.0;
  }
  -[AMPOnboardingFeatureView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v12, 0.0, v9, v11);

  -[AMPOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v6, 3.40282347e38);
  v16 = v15;
  v18 = v17;

  if (v3 == 1)
  {
    -[AMPOnboardingFeatureView bounds](self, "bounds");
    v19 = CGRectGetWidth(v27) + -62.0 - v16;
  }
  else
  {
    v19 = 62.0;
  }
  -[AMPOnboardingFeatureView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  MaxY = CGRectGetMaxY(v28);
  -[AMPOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v19, MaxY, v16, v18);

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
  -[AMPOnboardingFeatureView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width + -62.0, 3.40282347e38);
  v7 = v6;

  -[AMPOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width + -62.0, 3.40282347e38);
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
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMPOnboardingFeatureView;
  -[AMPOnboardingFeatureView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, a3);
  v4 = *MEMORY[0x24BDF7808];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF7808], 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPOnboardingFeatureView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)MEMORY[0x24BDF6A70];
  -[AMPOnboardingFeatureView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[AMPOnboardingFeatureView setNeedsLayout](self, "setNeedsLayout");
}

- (double)baselineOffsetFromBottom
{
  void *v2;
  double v3;
  double v4;

  -[AMPOnboardingFeatureView descriptionLabel](self, "descriptionLabel");
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
