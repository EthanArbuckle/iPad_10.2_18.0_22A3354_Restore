@implementation AMSUIOnboardingMultiFeatureHeaderView

- (AMSUIOnboardingMultiFeatureHeaderView)initWithFeatures:(id)a3
{
  id v4;
  AMSUIOnboardingMultiFeatureHeaderView *v5;
  UILabel *v6;
  UILabel *titleLabel;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  AMSUIOnboardingFeatureView *v25;
  AMSUIOnboardingFeatureView *v26;
  uint64_t v27;
  NSArray *featureViews;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  v5 = -[AMSUIOnboardingMultiFeatureHeaderView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v6;

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
    -[AMSUIOnboardingMultiFeatureHeaderView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v8 = (void *)MEMORY[0x24BEBB528];
    v9 = *MEMORY[0x24BEBE238];
    -[AMSUIOnboardingMultiFeatureHeaderView traitCollection](v5, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v11;
    v15 = v14;

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](v5, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v4;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v25 = [AMSUIOnboardingFeatureView alloc];
          v26 = -[AMSUIOnboardingFeatureView initWithFeature:](v25, "initWithFeature:", v24, (_QWORD)v30);
          objc_msgSend(v18, "addObject:", v26);
          -[AMSUIOnboardingMultiFeatureHeaderView addSubview:](v5, "addSubview:", v26);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v21);
    }

    v27 = objc_msgSend(v18, "copy");
    featureViews = v5->_featureViews;
    v5->_featureViews = (NSArray *)v27;

    -[AMSUIOnboardingMultiFeatureHeaderView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
    -[AMSUIOnboardingMultiFeatureHeaderView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 0);

  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double Width;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double MaxY;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t i;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  -[AMSUIOnboardingMultiFeatureHeaderView layoutSubviews](&v43, sel_layoutSubviews);
  if (-[AMSUIOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
    v3 = 0.0;
  else
    v3 = 44.0;
  -[AMSUIOnboardingMultiFeatureHeaderView safeAreaInsets](self, "safeAreaInsets");
  *(float *)&v4 = v3 + v4 + 140.0;
  v5 = floorf(*(float *)&v4);
  -[AMSUIOnboardingMultiFeatureHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v46);
  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", Width, 3.40282347e38);
  v9 = v8;
  v11 = v10;

  -[AMSUIOnboardingMultiFeatureHeaderView bounds](self, "bounds");
  v12 = CGRectGetMidX(v47) + v9 * -0.5;
  v13 = floorf(v12);
  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_firstBaselineOffsetFromTop");
  v16 = v5 - v15;
  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v13, v16, v9, v11);

  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  MaxY = CGRectGetMaxY(v48);
  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_baselineOffsetFromBottom");
  v22 = v21;

  v23 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMSUIOnboardingMultiFeatureHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[AMSUIOnboardingMultiFeatureHeaderView featureViews](self, "featureViews", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = MaxY - v22 + 50.0;
    v28 = ceilf(v27);
    v29 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v24);
        v31 = v28;
        v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v32, "sizeThatFits:", Width, 3.40282347e38);
        v35 = v34;
        v36 = Width - v34;
        if (v23 != 1)
          v36 = 0.0;
        objc_msgSend(v32, "setFrame:", v36, v31, v35, v33);
        objc_msgSend(v32, "frame");
        v37 = CGRectGetMaxY(v49);
        objc_msgSend(v32, "baselineOffsetFromBottom");
        *(float *)&v38 = v37 - v38 + 36.0;
        v28 = ceilf(*(float *)&v38);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v26);
  }

}

- (void)adjustedContentInsetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  -[AMSUIOnboardingMultiFeatureHeaderView adjustedContentInsetDidChange](&v3, sel_adjustedContentInsetDidChange);
  -[AMSUIOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
  -[AMSUIOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  -[AMSUIOnboardingMultiFeatureHeaderView traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, a3);
  v4 = (void *)MEMORY[0x24BEBB528];
  v5 = *MEMORY[0x24BEBE238];
  -[AMSUIOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
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

  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[AMSUIOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
  -[AMSUIOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    -[AMSUIOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
    -[AMSUIOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    -[AMSUIOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
    -[AMSUIOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIOnboardingMultiFeatureHeaderView;
  -[AMSUIOnboardingMultiFeatureHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AMSUIOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[AMSUIOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
  -[AMSUIOnboardingMultiFeatureHeaderView contentSize](self, "contentSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateContentSize
{
  void *v3;
  double Width;
  double v5;
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
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  double v42;
  double v43;
  float v44;
  void *v45;
  unint64_t v46;
  float v47;
  id v48;
  CGRect v49;

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE238]);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE218]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIOnboardingMultiFeatureHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v49);
  if (-[AMSUIOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
    v5 = 0.0;
  else
    v5 = 44.0;
  if (-[AMSUIOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    v6 = 140.0;
  }
  else
  {
    -[AMSUIOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v6 = v7 * 0.045;
  }
  -[AMSUIOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "scaledValueForValue:compatibleWithTraitCollection:", v8, v6);
  v10 = v9;

  if (-[AMSUIOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    -[AMSUIOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "scaledValueForValue:compatibleWithTraitCollection:", v11, 50.0);
    v13 = v12;

  }
  else
  {
    -[AMSUIOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v13 = v14 * 0.055;
  }
  -[AMSUIOnboardingMultiFeatureHeaderView safeAreaInsets](self, "safeAreaInsets");
  *(float *)&v15 = v10 + v5 + v15;
  v16 = floorf(*(float *)&v15);
  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_firstBaselineOffsetFromTop");
  v19 = v16 - v18 + 0.0;

  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  v22 = v21;
  -[AMSUIOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_baselineOffsetFromBottom");
  *(float *)&v24 = v13 + v22 - v24;
  v25 = ceilf(*(float *)&v24);

  if (-[AMSUIOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    -[AMSUIOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v26, 36.0);
    v28 = v27;

  }
  else
  {
    -[AMSUIOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v28 = v29 * 0.047;
  }
  v30 = v19 + v25;
  -[AMSUIOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    v33 = 0;
    do
    {
      -[AMSUIOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "sizeThatFits:", Width, 3.40282347e38);
      v37 = v36;
      -[AMSUIOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count") - 1;

      -[AMSUIOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      v42 = 0.0;
      if (v33 != v39)
        objc_msgSend(v35, "baselineOffsetFromBottom", 0.0);
      if (++v33 >= v41)
        v43 = 0.0;
      else
        v43 = v28;
      v44 = v43 + v37 - v42;
      v30 = v30 + ceilf(v44);

      -[AMSUIOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count");

    }
    while (v33 < v46);
  }
  v47 = v30;
  -[AMSUIOnboardingMultiFeatureHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v47));

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (double)containerHeight
{
  return self->_containerHeight;
}

- (BOOL)isPresentedInFormSheet
{
  return self->_isPresentedInFormSheet;
}

- (NSArray)featureViews
{
  return self->_featureViews;
}

- (void)setFeatureViews:(id)a3
{
  objc_storeStrong((id *)&self->_featureViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureViews, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
