@implementation WDDataListViewControllerCell

- (WDDataListViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDDataListViewControllerCell *v4;
  WDDataListViewControllerCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDDataListViewControllerCell;
  v4 = -[WDDataListViewControllerCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDDataListViewControllerCell setupSubviews](v4, "setupSubviews");
    -[WDDataListViewControllerCell setupConstraints](v5, "setupConstraints");
    -[WDDataListViewControllerCell _updateForCurrentSizeCategory](v5, "_updateForCurrentSizeCategory");
    -[WDDataListViewControllerCell setAccessoryType:](v5, "setAccessoryType:", 1);
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MinX;
  double Width;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23.receiver = self;
  v23.super_class = (Class)WDDataListViewControllerCell;
  -[WDDataListViewControllerCell layoutSubviews](&v23, sel_layoutSubviews);
  -[WDDataListViewControllerCell titleTextLabel](self, "titleTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WDDataListViewControllerCell titleTextLabel](self, "titleTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (-[WDDataListViewControllerCell hk_isLeftToRight](self, "hk_isLeftToRight"))
  {
    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    MinX = CGRectGetMinX(v24);
  }
  else
  {
    -[WDDataListViewControllerCell bounds](self, "bounds");
    Width = CGRectGetWidth(v25);
    v26.origin.x = v14;
    v26.origin.y = v16;
    v26.size.width = v18;
    v26.size.height = v20;
    MinX = Width - CGRectGetMaxX(v26);
  }
  -[WDDataListViewControllerCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, MinX, 0.0, 0.0);
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  -[WDDataListViewControllerCell setIconImageView:](self, "setIconImageView:", v3);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 1);
  -[WDDataListViewControllerCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_iconImageView);

  v5 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[WDDataListViewControllerCell setSubtitleTextLabel:](self, "setSubtitleTextLabel:", v5);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleTextLabel, "setTextColor:", v6);

  -[WDDataListViewControllerCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_subtitleTextLabel);

  v8 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[WDDataListViewControllerCell setTitleTextLabel:](self, "setTitleTextLabel:", v8);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleTextLabel, "setNumberOfLines:", 0);
  -[WDDataListViewControllerCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleTextLabel, "setTextColor:", v10);

  -[WDDataListViewControllerCell contentView](self, "contentView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_titleTextLabel);

}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  -[WDDataListViewControllerCell detailTextLabel](self, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleTextLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleTextLabel, "setFont:", v5);

}

- (void)setupConstraints
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *largeTextIconImageCenterYAnchorConstraint;
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
  NSArray *v29;
  NSArray *regularConstraints;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *v36;
  NSArray *largeTextConstraints;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[10];

  v71[8] = *MEMORY[0x24BDAC8D0];
  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);

  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell subtitleTextLabel](self, "subtitleTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstBaselineAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 0.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  largeTextIconImageCenterYAnchorConstraint = self->_largeTextIconImageCenterYAnchorConstraint;
  self->_largeTextIconImageCenterYAnchorConstraint = v9;

  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell contentView](self, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, 16.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v62;
  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToConstant:", 29.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v59;
  -[WDDataListViewControllerCell subtitleTextLabel](self, "subtitleTextLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 16.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v54;
  -[WDDataListViewControllerCell subtitleTextLabel](self, "subtitleTextLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:constant:", v50, -16.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v49;
  -[WDDataListViewControllerCell subtitleTextLabel](self, "subtitleTextLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 9.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v44;
  -[WDDataListViewControllerCell titleTextLabel](self, "titleTextLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:constant:", v40, -16.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v39;
  -[WDDataListViewControllerCell titleTextLabel](self, "titleTextLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -6.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v14;
  -[WDDataListViewControllerCell titleTextLabel](self, "titleTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell subtitleTextLabel](self, "subtitleTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:constant:", v18, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v23;
  -[WDDataListViewControllerCell titleTextLabel](self, "titleTextLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 16.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  regularConstraints = self->_regularConstraints;
  self->_regularConstraints = v29;

  v69[0] = self->_largeTextIconImageCenterYAnchorConstraint;
  -[WDDataListViewControllerCell titleTextLabel](self, "titleTextLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataListViewControllerCell iconImageView](self, "iconImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  largeTextConstraints = self->_largeTextConstraints;
  self->_largeTextConstraints = v36;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v63);
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  double v4;
  int *v5;
  int *v6;

  -[WDDataListViewControllerCell _updateFont](self, "_updateFont");
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    -[UILabel font](self->_subtitleTextLabel, "font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capHeight");
    -[NSLayoutConstraint setConstant:](self->_largeTextIconImageCenterYAnchorConstraint, "setConstant:", v4 * -0.5);

    v5 = &OBJC_IVAR___WDDataListViewControllerCell__largeTextConstraints;
    v6 = &OBJC_IVAR___WDDataListViewControllerCell__regularConstraints;
  }
  else
  {
    v5 = &OBJC_IVAR___WDDataListViewControllerCell__regularConstraints;
    v6 = &OBJC_IVAR___WDDataListViewControllerCell__largeTextConstraints;
  }
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v6));
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v5));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDDataListViewControllerCell;
  -[WDDataListViewControllerCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDDataListViewControllerCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[WDDataListViewControllerCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)titleTextLabel
{
  return self->_titleTextLabel;
}

- (void)setTitleTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextLabel, a3);
}

- (UILabel)subtitleTextLabel
{
  return self->_subtitleTextLabel;
}

- (void)setSubtitleTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextIconImageCenterYAnchorConstraint, 0);
}

@end
