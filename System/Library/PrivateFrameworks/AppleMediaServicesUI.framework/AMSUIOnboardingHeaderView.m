@implementation AMSUIOnboardingHeaderView

- (AMSUIOnboardingHeaderView)initWithFrame:(CGRect)a3
{
  AMSUIOnboardingHeaderView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  UILabel *v6;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *descriptionLabel;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)AMSUIOnboardingHeaderView;
  v3 = -[AMSUIOnboardingHeaderView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[AMSUIOnboardingHeaderView addSubview:](v3, "addSubview:", v3->_imageView);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    v8 = (void *)MEMORY[0x24BEBB528];
    -[AMSUIOnboardingHeaderView traitCollection](v3, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE238], v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:", 2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v10;
    v14 = v13;

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingHeaderView titleLabel](v3, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

    -[AMSUIOnboardingHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v17;

    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_descriptionLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v3->_descriptionLabel, "setTextAlignment:", 1);
    v19 = (void *)MEMORY[0x24BEBB520];
    -[AMSUIOnboardingHeaderView traitCollection](v3, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE220], v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingHeaderView descriptionLabel](v3, "descriptionLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v21);

    -[AMSUIOnboardingHeaderView addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    -[AMSUIOnboardingHeaderView setAutoresizingMask:](v3, "setAutoresizingMask:", 16);
    -[AMSUIOnboardingHeaderView setShowsVerticalScrollIndicator:](v3, "setShowsVerticalScrollIndicator:", 0);
    -[AMSUIOnboardingHeaderView setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 0);
    objc_initWeak(&location, v3);
    v30[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __43__AMSUIOnboardingHeaderView_initWithFrame___block_invoke;
    v26[3] = &unk_24CB4F498;
    objc_copyWeak(&v27, &location);
    v24 = (id)-[AMSUIOnboardingHeaderView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v23, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __43__AMSUIOnboardingHeaderView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v11, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v11, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_traitCollectionDidChange:", v10);

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double Width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  float v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double MaxY;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  float v64;
  double v65;
  void *v66;
  objc_super v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v67.receiver = self;
  v67.super_class = (Class)AMSUIOnboardingHeaderView;
  -[AMSUIOnboardingHeaderView layoutSubviews](&v67, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE238]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE220]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v68);
  if (-[AMSUIOnboardingHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    v6 = 110.0;
  }
  else
  {
    -[AMSUIOnboardingHeaderView containerHeight](self, "containerHeight");
    v6 = v7 * 0.25;
  }
  -[AMSUIOnboardingHeaderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v8, 60.0);
  v10 = v9;

  -[AMSUIOnboardingHeaderView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", Width, 3.40282347e38);
  v13 = v12;
  v15 = v14;

  -[AMSUIOnboardingHeaderView safeAreaInsets](self, "safeAreaInsets");
  v17 = v16 + 44.0;
  v18 = v16 < 60.0;
  v19 = 104.0;
  if (!v18)
    v19 = v17;
  v20 = fmax(v6 - v10 - v15, 0.0) + v19;
  v21 = floorf(v20);
  -[AMSUIOnboardingHeaderView bounds](self, "bounds");
  v22 = CGRectGetMidX(v69) - v13 * 0.5;
  v23 = floorf(v22);
  -[AMSUIOnboardingHeaderView imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v23, v21, v13, v15);

  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_firstBaselineOffsetFromTop");
  v27 = v15 + v21 + v10 - v26;

  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sizeThatFits:", Width, 3.40282347e38);
  v30 = v29;
  v32 = v31;

  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_baselineOffsetFromBottom");
  v35 = v27 + v32 - v34;

  -[AMSUIOnboardingHeaderView traitCollection](self, "traitCollection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v36, 32.0);
  v38 = v37;
  -[AMSUIOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_firstBaselineOffsetFromTop");
  v41 = v35 + v38 - v40;

  -[AMSUIOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sizeThatFits:", Width, 3.40282347e38);
  v44 = v43;
  v46 = v45;

  -[AMSUIOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "_firstBaselineOffsetFromTop");
  v49 = v41 + v46 - (v32 + v46) - v48 - fmax(v32 + -160.0, 0.0);

  -[AMSUIOnboardingHeaderView bounds](self, "bounds");
  v50 = CGRectGetMidX(v70) - v30 * 0.5;
  v51 = floorf(v50);
  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_firstBaselineOffsetFromTop");
  v54 = v49 - v53;
  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v51, v54, v30, v32);

  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "frame");
  MaxY = CGRectGetMaxY(v71);
  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "_baselineOffsetFromBottom");
  v60 = MaxY - v59;

  -[AMSUIOnboardingHeaderView traitCollection](self, "traitCollection");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v61, 32.0);
  v63 = v60 + v62;

  -[AMSUIOnboardingHeaderView bounds](self, "bounds");
  v64 = CGRectGetMidX(v72) - v44 * 0.5;
  v65 = floorf(v64);
  -[AMSUIOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFrame:", v65, v63, v44, v46);

}

- (void)adjustedContentInsetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIOnboardingHeaderView;
  -[AMSUIOnboardingHeaderView adjustedContentInsetDidChange](&v3, sel_adjustedContentInsetDidChange);
  -[AMSUIOnboardingHeaderView updateContentSize](self, "updateContentSize");
  -[AMSUIOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_traitCollectionDidChange:(id)a3
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

  v4 = (void *)MEMORY[0x24BEBB528];
  v5 = *MEMORY[0x24BEBE238];
  -[AMSUIOnboardingHeaderView traitCollection](self, "traitCollection", a3);
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

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  v14 = (void *)MEMORY[0x24BEBB520];
  v15 = *MEMORY[0x24BEBE220];
  -[AMSUIOnboardingHeaderView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredFontForTextStyle:compatibleWithTraitCollection:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  -[AMSUIOnboardingHeaderView updateContentSize](self, "updateContentSize");
  -[AMSUIOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIOnboardingHeaderView;
  -[AMSUIOnboardingHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AMSUIOnboardingHeaderView updateContentSize](self, "updateContentSize");
}

- (void)updateContentSize
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  float v15;
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

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE238]);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v37);
  -[AMSUIOnboardingHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scaledValueForValue:compatibleWithTraitCollection:", v5, 60.0);
  v7 = v6;

  -[AMSUIOnboardingHeaderView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", Width, 3.40282347e38);
  v10 = v9;

  -[AMSUIOnboardingHeaderView safeAreaInsets](self, "safeAreaInsets");
  v12 = v11 + 44.0;
  v13 = v11 < 60.0;
  v14 = 104.0;
  if (!v13)
    v14 = v12;
  v15 = fmax(110.0 - v7 - v10, 0.0) + v14;
  v16 = v10 + floorf(v15);
  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_firstBaselineOffsetFromTop");
  v19 = v7 - v18 + v16;

  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  v22 = v21 + v19;

  -[AMSUIOnboardingHeaderView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_baselineOffsetFromBottom");
  v25 = v22 - v24;

  -[AMSUIOnboardingHeaderView traitCollection](self, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v26, 32.0);
  v28 = v27;
  -[AMSUIOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_firstBaselineOffsetFromTop");
  v31 = v25 + v28 - v30;

  -[AMSUIOnboardingHeaderView descriptionLabel](self, "descriptionLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeThatFits:", Width, 3.40282347e38);
  v34 = v31 + v33;

  v35 = v34;
  -[AMSUIOnboardingHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v35));

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[AMSUIOnboardingHeaderView updateContentSize](self, "updateContentSize");
  -[AMSUIOnboardingHeaderView contentSize](self, "contentSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    -[AMSUIOnboardingHeaderView updateContentSize](self, "updateContentSize");
    -[AMSUIOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    -[AMSUIOnboardingHeaderView updateContentSize](self, "updateContentSize");
    -[AMSUIOnboardingHeaderView setNeedsLayout](self, "setNeedsLayout");
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
