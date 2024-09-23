@implementation AMPOnboardingMultiFeatureHeaderView

- (AMPOnboardingMultiFeatureHeaderView)initWithFeatures:(id)a3
{
  id v4;
  AMPOnboardingMultiFeatureHeaderView *v5;
  UILabel *v6;
  UILabel *titleLabel;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AMPOnboardingFeatureView *v15;
  AMPOnboardingFeatureView *v16;
  uint64_t v17;
  NSArray *featureViews;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  v5 = -[AMPOnboardingMultiFeatureHeaderView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v6;

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
    -[AMPOnboardingMultiFeatureHeaderView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = [AMPOnboardingFeatureView alloc];
          v16 = -[AMPOnboardingFeatureView initWithFeature:](v15, "initWithFeature:", v14, (_QWORD)v20);
          objc_msgSend(v8, "addObject:", v16);
          -[AMPOnboardingMultiFeatureHeaderView addSubview:](v5, "addSubview:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    v17 = objc_msgSend(v8, "copy");
    featureViews = v5->_featureViews;
    v5->_featureViews = (NSArray *)v17;

    -[AMPOnboardingMultiFeatureHeaderView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
    -[AMPOnboardingMultiFeatureHeaderView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 0);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Width;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double MaxY;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  uint64_t v44;
  uint64_t i;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v60 = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  -[AMPOnboardingMultiFeatureHeaderView layoutSubviews](&v58, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF7840]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF7808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
    v5 = 0.0;
  else
    v5 = 44.0;
  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    v6 = 100.0;
  }
  else
  {
    -[AMPOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v6 = v7 * 0.045;
  }
  -[AMPOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v8, v6);
  v10 = v9;

  -[AMPOnboardingMultiFeatureHeaderView safeAreaInsets](self, "safeAreaInsets");
  *(float *)&v11 = v10 + v5 + v11;
  v12 = floorf(*(float *)&v11);
  -[AMPOnboardingMultiFeatureHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v61);
  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", Width, 3.40282347e38);
  v16 = v15;
  v18 = v17;

  -[AMPOnboardingMultiFeatureHeaderView bounds](self, "bounds");
  v19 = CGRectGetMidX(v62) + v16 * -0.5;
  v20 = floorf(v19);
  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_firstBaselineOffsetFromTop");
  v23 = v12 - v22;
  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v20, v23, v16, v18);

  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    -[AMPOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v25, 50.0);
    v27 = v26;

  }
  else
  {
    -[AMPOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v27 = v28 * 0.055;
  }
  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  MaxY = CGRectGetMaxY(v63);
  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_baselineOffsetFromBottom");
  v33 = v32;

  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    -[AMPOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValueForValue:compatibleWithTraitCollection:", v34, 36.0);
    v36 = v35;

  }
  else
  {
    -[AMPOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v36 = v37 * 0.047;
  }
  v38 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AMPOnboardingMultiFeatureHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[AMPOnboardingMultiFeatureHeaderView featureViews](self, "featureViews", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v40)
  {
    v41 = v40;
    v42 = v27 + MaxY - v33;
    v43 = ceilf(v42);
    v44 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(v39);
        v46 = v43;
        v47 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v47, "sizeThatFits:", Width, 3.40282347e38);
        v50 = v49;
        v51 = Width - v49;
        if (v38 != 1)
          v51 = 0.0;
        objc_msgSend(v47, "setFrame:", v51, v46, v50, v48);
        objc_msgSend(v47, "frame");
        v52 = CGRectGetMaxY(v64);
        objc_msgSend(v47, "baselineOffsetFromBottom");
        *(float *)&v53 = v36 + v52 - v53;
        v43 = ceilf(*(float *)&v53);
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v41);
  }

}

- (void)adjustedContentInsetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  -[AMPOnboardingMultiFeatureHeaderView adjustedContentInsetDidChange](&v3, sel_adjustedContentInsetDidChange);
  -[AMPOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
  -[AMPOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
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
  v14.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  -[AMPOnboardingMultiFeatureHeaderView traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, a3);
  v4 = (void *)MEMORY[0x24BDF6A78];
  v5 = *MEMORY[0x24BDF7840];
  -[AMPOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
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

  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[AMPOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
  -[AMPOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContainerHeight:(double)a3
{
  if (vabdd_f64(a3, self->_containerHeight) > 2.22044605e-16)
  {
    self->_containerHeight = a3;
    -[AMPOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
    -[AMPOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIsPresentedInFormSheet:(BOOL)a3
{
  if (self->_isPresentedInFormSheet != a3)
  {
    self->_isPresentedInFormSheet = a3;
    -[AMPOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
    -[AMPOnboardingMultiFeatureHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMPOnboardingMultiFeatureHeaderView;
  -[AMPOnboardingMultiFeatureHeaderView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AMPOnboardingMultiFeatureHeaderView updateContentSize](self, "updateContentSize");
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

  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF7840]);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF7808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPOnboardingMultiFeatureHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v49);
  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
    v5 = 0.0;
  else
    v5 = 44.0;
  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    v6 = 100.0;
  }
  else
  {
    -[AMPOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v6 = v7 * 0.045;
  }
  -[AMPOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "scaledValueForValue:compatibleWithTraitCollection:", v8, v6);
  v10 = v9;

  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    -[AMPOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "scaledValueForValue:compatibleWithTraitCollection:", v11, 50.0);
    v13 = v12;

  }
  else
  {
    -[AMPOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v13 = v14 * 0.055;
  }
  -[AMPOnboardingMultiFeatureHeaderView safeAreaInsets](self, "safeAreaInsets");
  *(float *)&v15 = v10 + v5 + v15;
  v16 = floorf(*(float *)&v15);
  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_firstBaselineOffsetFromTop");
  v19 = v16 - v18 + 0.0;

  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", Width, 3.40282347e38);
  v22 = v21;
  -[AMPOnboardingMultiFeatureHeaderView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_baselineOffsetFromBottom");
  *(float *)&v24 = v13 + v22 - v24;
  v25 = ceilf(*(float *)&v24);

  if (-[AMPOnboardingMultiFeatureHeaderView isPresentedInFormSheet](self, "isPresentedInFormSheet"))
  {
    -[AMPOnboardingMultiFeatureHeaderView traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v26, 36.0);
    v28 = v27;

  }
  else
  {
    -[AMPOnboardingMultiFeatureHeaderView containerHeight](self, "containerHeight");
    v28 = v29 * 0.047;
  }
  v30 = v19 + v25;
  -[AMPOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    v33 = 0;
    do
    {
      -[AMPOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "sizeThatFits:", Width, 3.40282347e38);
      v37 = v36;
      -[AMPOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count") - 1;

      -[AMPOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
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

      -[AMPOnboardingMultiFeatureHeaderView featureViews](self, "featureViews");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count");

    }
    while (v33 < v46);
  }
  v47 = v30;
  -[AMPOnboardingMultiFeatureHeaderView setContentSize:](self, "setContentSize:", Width, roundf(v47));

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
