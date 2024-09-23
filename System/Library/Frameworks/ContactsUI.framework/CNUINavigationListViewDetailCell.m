@implementation CNUINavigationListViewDetailCell

- (double)minimumContentHeight
{
  double v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNUINavigationListViewDetailCell;
  -[CNUINavigationListViewCell minimumContentHeight](&v7, sel_minimumContentHeight);
  v4 = v3;
  -[CNUINavigationListViewDetailCell subtitleLabelFirstBaselineAnchorConstraintConstant](self, "subtitleLabelFirstBaselineAnchorConstraintConstant");
  return ceil(v4 + v5);
}

- (double)contentViewBottomAnchorConstraintConstant
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewBottomAnchorConstraintConstantForNavigationListStyle:", v4);
  v6 = v5;

  return v6;
}

- (double)subtitleLabelFirstBaselineAnchorConstraintConstant
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:", v4);
  v6 = v5;

  return v6;
}

- (double)titleLabelFirstBaselineAnchorConstraintConstant
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:", v4);
  v6 = v5;

  return v6;
}

- (void)setContentAlignment:(int64_t)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;

  if (self->_contentAlignment != a3)
  {
    self->_contentAlignment = a3;
    v4 = -[CNUINavigationListViewDetailCell contentAlignment](self, "contentAlignment") == 1;
    -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", v4);

    -[CNUINavigationListViewCell subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", v4);

    -[CNUINavigationListViewDetailCell separatorInset](self, "separatorInset");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[CNUINavigationListViewDetailCell contentAlignment](self, "contentAlignment");
    v14 = 0.0;
    if (v13 != 1)
      v14 = 15.0;
    -[CNUINavigationListViewDetailCell setSeparatorInset:](self, "setSeparatorInset:", v8, v14, v10, v12);
    -[CNUINavigationListViewDetailCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)loadContentViewConstraints
{
  void *v3;
  void *v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  if (!-[CNUINavigationListViewCell isContentViewConstraintsLoaded](self, "isContentViewConstraintsLoaded"))
  {
    v24.receiver = self;
    v24.super_class = (Class)CNUINavigationListViewDetailCell;
    -[CNUINavigationListViewCell loadContentViewConstraints](&v24, sel_loadContentViewConstraints);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewDetailCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 5.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v8);
    -[CNUINavigationListViewCell setTitleLabelTrailingAnchorConstraint:](self, "setTitleLabelTrailingAnchorConstraint:", v8);
    -[CNUINavigationListViewCell subtitleLabel](self, "subtitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v13);
    -[CNUINavigationListViewCell setSubtitleLabelLeadingAnchorConstraint:](self, "setSubtitleLabelLeadingAnchorConstraint:", v13);
    -[CNUINavigationListViewCell subtitleLabel](self, "subtitleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v18);
    -[CNUINavigationListViewCell setSubtitleLabelTrailingAnchorConstraint:](self, "setSubtitleLabelTrailingAnchorConstraint:", v18);
    -[CNUINavigationListViewCell subtitleLabel](self, "subtitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstBaselineAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewDetailCell subtitleLabelFirstBaselineAnchorConstraintConstant](self, "subtitleLabelFirstBaselineAnchorConstraintConstant");
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v23);
    -[CNUINavigationListViewCell setSubtitleLabelFirstBaselineAnchorConstraint:](self, "setSubtitleLabelFirstBaselineAnchorConstraint:", v23);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
    -[CNUINavigationListViewCell setContentViewConstraintsLoaded:](self, "setContentViewConstraintsLoaded:", 1);

  }
}

- (void)updateConstraints
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CNUINavigationListViewDetailCell;
  -[CNUINavigationListViewCell updateConstraints](&v13, sel_updateConstraints);
  v3 = -[CNUINavigationListViewDetailCell contentAlignment](self, "contentAlignment");
  -[CNUINavigationListViewCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUINavigationListViewDetailCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 1)
  {
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 5.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell setTitleLabelLeadingAnchorConstraint:](self, "setTitleLabelLeadingAnchorConstraint:", v8);
  }
  else
  {
    -[CNUINavigationListViewCell navigationListStyle](self, "navigationListStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellUserActionLeftMargin");
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell setTitleLabelLeadingAnchorConstraint:](self, "setTitleLabelLeadingAnchorConstraint:", v9);

  }
  v10 = (void *)MEMORY[0x1E0CB3718];
  -[CNUINavigationListViewCell titleLabelLeadingAnchorConstraint](self, "titleLabelLeadingAnchorConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v12);

}

- (void)applyStyle
{
  id v3;

  -[CNUINavigationListViewCell styleApplier](self, "styleApplier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyNavigationListStyleToDetailCell:", self);

}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

+ (double)contentViewBottomAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "detailCellSubtitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailCellContentViewBottomAnchorConstraintConstant");
  v6 = v5;

  objc_msgSend(v4, "_scaledValueForValue:", v6);
  v8 = ceil(v7);

  return v8;
}

+ (double)subtitleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "detailCellSubtitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant");
  v6 = v5;

  objc_msgSend(v4, "_scaledValueForValue:", v6);
  v8 = ceil(v7);

  return v8;
}

+ (double)titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "detailCellTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailCellTitleLabelFirstBaselineAnchorConstraintConstant");
  v6 = v5;

  objc_msgSend(v4, "_scaledValueForValue:", v6);
  v8 = ceil(v7);

  return v8;
}

+ (CGSize)desiredContentSizeForTitle:(id)a3 subTitle:(id)a4 navigationListStyle:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];
  CGSize result;

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "cellUserActionLeftMargin");
  v12 = v11;
  v13 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v10, "detailCellTitleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailCellSubtitleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D13848];
  v17 = v13;
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v8) & 1) == 0)
  {
    if (v14)
    {
      v33 = *MEMORY[0x1E0DC1138];
      v34[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v8, "sizeWithAttributes:", v18);
    v17 = v19;

  }
  if (((*(uint64_t (**)(uint64_t, id))(v16 + 16))(v16, v9) & 1) == 0)
  {
    if (v15)
    {
      v31 = *MEMORY[0x1E0DC1138];
      v32 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v9, "sizeWithAttributes:", v20);
    v13 = v21;

  }
  if (v17 >= v13)
    v22 = v17;
  else
    v22 = v13;
  objc_msgSend(a1, "titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:", v10);
  v24 = v23;
  objc_msgSend(a1, "subtitleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:", v10);
  v26 = v25;
  objc_msgSend(a1, "contentViewBottomAnchorConstraintConstantForNavigationListStyle:", v10);
  v28 = v27;

  v29 = v12 + 22.0 + 5.0 + v22;
  v30 = ceil(v24 + v26 + v28);
  result.height = v30;
  result.width = v29;
  return result;
}

+ (id)reuseIdentifier
{
  return CFSTR("CNUINavigationListViewDetailCellReuseIdentifier");
}

@end
