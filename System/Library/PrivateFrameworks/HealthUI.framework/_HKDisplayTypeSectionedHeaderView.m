@implementation _HKDisplayTypeSectionedHeaderView

- (_HKDisplayTypeSectionedHeaderView)initWithFrame:(CGRect)a3
{
  _HKDisplayTypeSectionedHeaderView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *contentView;
  uint64_t v11;
  UILabel *titleLabel;
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
  uint64_t v24;
  NSLayoutConstraint *titleTrailingConstraint;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *titleWithNoTopMargin;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *titleWithTopMargin;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[3];
  _QWORD v52[6];

  v52[4] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)_HKDisplayTypeSectionedHeaderView;
  v3 = -[_HKDisplayTypeSectionedHeaderView initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v11;

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v13);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_titleLabel, "setBackgroundColor:", v14);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setClipsToBounds:](v3->_titleLabel, "setClipsToBounds:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[_HKDisplayTypeSectionedHeaderView _updatePreferredTitleFont](v3, "_updatePreferredTitleFont");
    -[_HKDisplayTypeSectionedHeaderView addSubview:](v3, "addSubview:", v3->_contentView);
    v44 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v3->_contentView, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView topAnchor](v3, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v47;
    -[UIView leadingAnchor](v3->_contentView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView leadingAnchor](v3, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v43;
    -[UIView bottomAnchor](v3->_contentView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView bottomAnchor](v3, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v17;
    -[UIView trailingAnchor](v3->_contentView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView trailingAnchor](v3, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v21);

    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_titleLabel);
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_contentView, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    titleTrailingConstraint = v3->_titleTrailingConstraint;
    v3->_titleTrailingConstraint = (NSLayoutConstraint *)v24;

    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_contentView, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    titleWithNoTopMargin = v3->_titleWithNoTopMargin;
    v3->_titleWithNoTopMargin = (NSLayoutConstraint *)v28;

    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_contentView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 16.0);
    v32 = objc_claimAutoreleasedReturnValue();
    titleWithTopMargin = v3->_titleWithTopMargin;
    v3->_titleWithTopMargin = (NSLayoutConstraint *)v32;

    -[NSLayoutConstraint setActive:](v3->_titleWithNoTopMargin, "setActive:", 1);
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_contentView, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v37;
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_contentView, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v40;
    v51[2] = v3->_titleTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v41);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKDisplayTypeSectionedHeaderView;
  v4 = a3;
  -[_HKDisplayTypeSectionedHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HKDisplayTypeSectionedHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
    -[_HKDisplayTypeSectionedHeaderView _updatePreferredTitleFont](self, "_updatePreferredTitleFont");
}

- (void)setTitle:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "length");
    v6 = v5 == 0;
    v7 = v5 != 0;
  }
  else
  {
    v7 = 0;
    v6 = 1;
  }
  -[NSLayoutConstraint setActive:](self->_titleWithNoTopMargin, "setActive:", v6);
  -[NSLayoutConstraint setActive:](self->_titleWithTopMargin, "setActive:", v7);
  -[_HKDisplayTypeSectionedHeaderView setHidden:](self, "setHidden:", v6);
  -[UILabel setText:](self->_titleLabel, "setText:", v8);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKDisplayTypeSectionedHeaderView;
  -[_HKDisplayTypeSectionedHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_titleLabel, "setText:", &stru_1E9C4C428);
  -[_HKDisplayTypeSectionedHeaderView setHidden:](self, "setHidden:", 0);
}

- (void)_updatePreferredTitleFont
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionHeaderFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

+ (id)reuseIdentifier
{
  return CFSTR("HKChartViewControllerCollectionViewHeaderIdentifier");
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)titleTrailingConstraint
{
  return self->_titleTrailingConstraint;
}

- (void)setTitleTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleTrailingConstraint, a3);
}

- (NSLayoutConstraint)titleWithNoTopMargin
{
  return self->_titleWithNoTopMargin;
}

- (void)setTitleWithNoTopMargin:(id)a3
{
  objc_storeStrong((id *)&self->_titleWithNoTopMargin, a3);
}

- (NSLayoutConstraint)titleWithTopMargin
{
  return self->_titleWithTopMargin;
}

- (void)setTitleWithTopMargin:(id)a3
{
  objc_storeStrong((id *)&self->_titleWithTopMargin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleWithTopMargin, 0);
  objc_storeStrong((id *)&self->_titleWithNoTopMargin, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
