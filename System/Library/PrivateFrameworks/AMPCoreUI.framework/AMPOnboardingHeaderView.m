@implementation AMPOnboardingHeaderView

- (AMPOnboardingHeaderView)initWithFrame:(CGRect)a3
{
  AMPOnboardingHeaderView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  UILabel *descriptionLabel;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AMPOnboardingHeaderView;
  v3 = -[AMPOnboardingHeaderView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[AMPOnboardingHeaderView addSubview:](v3, "addSubview:", v3->_imageView);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[AMPOnboardingHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v8;

    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_descriptionLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v3->_descriptionLabel, "setTextAlignment:", 1);
    -[AMPOnboardingHeaderView addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    -[AMPOnboardingHeaderView setShowsVerticalScrollIndicator:](v3, "setShowsVerticalScrollIndicator:", 0);
    -[AMPOnboardingHeaderView setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 0);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double Width;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double MaxY;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v55.receiver = self;
  v55.super_class = (Class)AMPOnboardingHeaderView;
  -[AMPOnboardingHeaderView layoutSubviews](&v55, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF7840]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPOnboardingHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v56);
  v6 = -[AMPOnboardingHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet");
  if (-[AMPOnboardingHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    v7 = 200.0;
  }
  else
  {
    -[AMPOnboardingHeaderView containerHeight](self, "containerHeight");
    v7 = v8 * 0.25;
  }
  if (v6)
    v9 = 0.0;
  else
    v9 = 44.0;
  -[AMPOnboardingHeaderView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v10, 60.0);
  v12 = v11;

  -[AMPOnboardingHeaderView imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", Width, 3.40282347e38);
  v15 = v14;
  v17 = v16;

  -[AMPOnboardingHeaderView safeAreaInsets](self, "safeAreaInsets");
  *(float *)&v18 = v9 + v18 + fmax(v7 - v12 - v17, 0.0);
  v19 = floorf(*(float *)&v18);
  -[AMPOnboardingHeaderView bounds](self, "bounds");
  v20 = CGRectGetMidX(v57) - v15 * 0.5;
  v21 = floorf(v20);
  -[AMPOnboardingHeaderView imageView](self, "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v21, v19, v15, v17);

  -[AMPOnboardingHeaderView imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v24 = v12 + CGRectGetMaxY(v58);

  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sizeThatFits:", Width, 3.40282347e38);
  v27 = v26;
  v29 = v28;

  -[AMPOnboardingHeaderView bounds](self, "bounds");
  v30 = CGRectGetMidX(v59) - v27 * 0.5;
  v31 = floorf(v30);
  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_firstBaselineOffsetFromTop");
  v34 = v24 - v33;
  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v31, v34, v27, v29);

  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frame");
  MaxY = CGRectGetMaxY(v60);
  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_baselineOffsetFromBottom");
  v40 = MaxY - v39;

  -[AMPOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sizeThatFits:", Width, 3.40282347e38);
  v43 = v42;
  v45 = v44;

  -[AMPOnboardingHeaderView bounds](self, "bounds");
  v46 = CGRectGetMidX(v61) - v43 * 0.5;
  v47 = floorf(v46);
  -[AMPOnboardingHeaderView traitCollection](self, "traitCollection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v48, 32.0);
  v50 = v40 + v49;
  -[AMPOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_firstBaselineOffsetFromTop");
  v53 = v50 - v52;
  -[AMPOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFrame:", v47, v53, v43, v45);

}

- (void)adjustedContentInsetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMPOnboardingHeaderView;
  -[AMPOnboardingHeaderView adjustedContentInsetDidChange](&v3, sel_adjustedContentInsetDidChange);
  -[AMPOnboardingHeaderView updateContentSize](self, "updateContentSize");
  -[AMPOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AMPOnboardingHeaderView;
  -[AMPOnboardingHeaderView traitCollectionDidChange:](&v19, sel_traitCollectionDidChange_, a3);
  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = *MEMORY[0x24BDF7840];
  -[AMPOnboardingHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  v14 = (void *)MEMORY[0x24BDF6A70];
  v15 = *MEMORY[0x24BDF77B0];
  -[AMPOnboardingHeaderView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredFontForTextStyle:compatibleWithTraitCollection:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  -[AMPOnboardingHeaderView updateContentSize](self, "updateContentSize");
  -[AMPOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMPOnboardingHeaderView;
  -[AMPOnboardingHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AMPOnboardingHeaderView updateContentSize](self, "updateContentSize");
}

- (void)updateContentSize
{
  void *v3;
  double Width;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  float v35;
  id v36;
  CGRect v37;

  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF7840]);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPOnboardingHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v37);
  v5 = -[AMPOnboardingHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet");
  if (-[AMPOnboardingHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    v6 = 200.0;
  }
  else
  {
    -[AMPOnboardingHeaderView containerHeight](self, "containerHeight");
    v6 = v7 * 0.25;
  }
  if (v5)
    v8 = 0.0;
  else
    v8 = 44.0;
  -[AMPOnboardingHeaderView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scaledValueForValue:compatibleWithTraitCollection:", v9, 60.0);
  v11 = v10;

  -[AMPOnboardingHeaderView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", Width, 3.40282347e38);
  v14 = v13;

  -[AMPOnboardingHeaderView safeAreaInsets](self, "safeAreaInsets");
  *(float *)&v15 = v8 + v15 + fmax(v6 - v11 - v14, 0.0);
  v16 = v14 + floorf(*(float *)&v15);
  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_firstBaselineOffsetFromTop");
  v19 = v11 - v18 + v16;

  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  v22 = v19 + v21;

  -[AMPOnboardingHeaderView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_baselineOffsetFromBottom");
  v25 = v22 - v24;

  -[AMPOnboardingHeaderView traitCollection](self, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v26, 32.0);
  v28 = v27;
  -[AMPOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_firstBaselineOffsetFromTop");
  v31 = v25 + v28 - v30;

  -[AMPOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeThatFits:", Width, 3.40282347e38);
  v34 = v31 + v33;

  v35 = v34;
  -[AMPOnboardingHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v35));

}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    -[AMPOnboardingHeaderView updateContentSize](self, "updateContentSize");
    -[AMPOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    -[AMPOnboardingHeaderView updateContentSize](self, "updateContentSize");
    -[AMPOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
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

- (double)containerHeight
{
  return self->_containerHeight;
}

- (BOOL)isPresentedInFormSheet
{
  return self->_isPresentedInFormSheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
