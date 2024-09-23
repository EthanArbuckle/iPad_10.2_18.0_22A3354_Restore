@implementation WDHeartRhythmSectionHeaderView

- (WDHeartRhythmSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  WDHeartRhythmSectionHeaderView *v3;
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDHeartRhythmSectionHeaderView;
  v3 = -[WDHeartRhythmSectionHeaderView initWithReuseIdentifier:](&v8, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    -[WDHeartRhythmSectionHeaderView setUpUI](v3, "setUpUI");
  }
  return v3;
}

- (void)setUpUI
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
  double v15;
  double v16;
  double v17;
  double v18;
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
  NSLayoutConstraint *v29;
  NSLayoutConstraint *bottomToTitleLastBaselineConstraint;
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
  NSLayoutConstraint *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x24BDAC8D0];
  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);

  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 4);

  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF7850], 32770, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[WDHeartRhythmSectionHeaderView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[WDHeartRhythmSectionHeaderView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMargins");
  v16 = v15;
  v18 = v17;

  -[WDHeartRhythmSectionHeaderView contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLayoutMargins:", 0.0, v16, 0.0, v18);

  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmSectionHeaderView contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 12.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[WDHeartRhythmSectionHeaderView contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastBaselineAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomToTitleLastBaselineConstraint = self->_bottomToTitleLastBaselineConstraint;
  self->_bottomToTitleLastBaselineConstraint = v29;

  -[WDHeartRhythmSectionHeaderView updateConstraintConstants](self, "updateConstraintConstants");
  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmSectionHeaderView contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutMarginsGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v35, 2.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDHeartRhythmSectionHeaderView contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutMarginsGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v41, -2.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = self->_bottomToTitleLastBaselineConstraint;
  v44 = (void *)MEMORY[0x24BDD1628];
  v46[0] = v43;
  v46[1] = v36;
  v46[2] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v45);

}

- (void)updateConstraintConstants
{
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x24BDF6A80]);
  v7 = (id)objc_msgSend(v3, "initForTextStyle:", *MEMORY[0x24BDF7850]);
  objc_msgSend(v7, "scaledValueForValue:", 12.0);
  v5 = v4;
  -[WDHeartRhythmSectionHeaderView bottomToTitleLastBaselineConstraint](self, "bottomToTitleLastBaselineConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (!v8)
    goto LABEL_3;
  -[WDHeartRhythmSectionHeaderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
LABEL_3:
    -[WDHeartRhythmSectionHeaderView updateConstraintConstants](self, "updateConstraintConstants");

}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[WDHeartRhythmSectionHeaderView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSLayoutConstraint)bottomToTitleLastBaselineConstraint
{
  return self->_bottomToTitleLastBaselineConstraint;
}

- (void)setBottomToTitleLastBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomToTitleLastBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomToTitleLastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
