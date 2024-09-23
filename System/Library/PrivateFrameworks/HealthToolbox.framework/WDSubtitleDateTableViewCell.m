@implementation WDSubtitleDateTableViewCell

- (WDSubtitleDateTableViewCell)initWithReuseIdentifier:(id)a3
{
  WDSubtitleDateTableViewCell *v3;
  WDSubtitleDateTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDSubtitleDateTableViewCell;
  v3 = -[WDSubtitleDateTableViewCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, 3, a3);
  v4 = v3;
  if (v3)
  {
    -[WDSubtitleDateTableViewCell setupSubviews](v3, "setupSubviews");
    -[WDSubtitleDateTableViewCell setupConstraints](v4, "setupConstraints");
    -[WDSubtitleDateTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  }
  return v4;
}

- (void)setupSubviews
{
  UILabel *v3;
  UILabel *subtitleTextLabel;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *mainTextLabel;
  void *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *dateTextLabel;
  void *v14;
  id v15;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  subtitleTextLabel = self->_subtitleTextLabel;
  self->_subtitleTextLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_subtitleTextLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleTextLabel, "setTextColor:", v5);

  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_subtitleTextLabel);

  v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  mainTextLabel = self->_mainTextLabel;
  self->_mainTextLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_mainTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WDSubtitleDateTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_mainTextLabel, "setTextColor:", v10);

  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_mainTextLabel);

  v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  dateTextLabel = self->_dateTextLabel;
  self->_dateTextLabel = v12;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_dateTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_dateTextLabel, "setTextColor:", v14);

  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_dateTextLabel);

}

- (void)setupConstraints
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
  double v17;
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
  void *v29;
  void *v30;
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
  void *v43;
  _QWORD v44[11];

  v44[9] = *MEMORY[0x24BDAC8D0];
  -[UILabel firstBaselineAnchor](self->_mainTextLabel, "firstBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_subtitleTextLabel, "lastBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSubtitleDateTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scaledValueForValue:", 22.0);
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSubtitleDateTableViewCell setBaselineConstraint:](self, "setBaselineConstraint:", v7);

  v29 = (void *)MEMORY[0x24BDD1628];
  -[UILabel leadingAnchor](self->_mainTextLabel, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layoutMarginsGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v39;
  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_mainTextLabel, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v36, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v35;
  -[UILabel leadingAnchor](self->_subtitleTextLabel, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layoutMarginsGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v30;
  -[UILabel topAnchor](self->_subtitleTextLabel, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v26, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v25;
  -[WDSubtitleDateTableViewCell baselineConstraint](self, "baselineConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v24;
  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_dateTextLabel, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v21, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v20;
  -[UILabel leadingAnchor](self->_dateTextLabel, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_subtitleTextLabel, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v18, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v8;
  -[UILabel leadingAnchor](self->_dateTextLabel, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_mainTextLabel, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v10, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v11;
  -[WDSubtitleDateTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerYAnchor](self->_dateTextLabel, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v16);

  LODWORD(v17) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_dateTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
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
  v9.super_class = (Class)WDSubtitleDateTableViewCell;
  -[WDSubtitleDateTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[WDSubtitleDateTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[WDSubtitleDateTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WDSubtitleDateTableViewCell detailTextLabel](self, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleTextLabel, "setFont:", v4);

  -[WDSubtitleDateTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_mainTextLabel, "setFont:", v6);

  -[WDSubtitleDateTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_dateTextLabel, "setFont:", v8);

  -[WDSubtitleDateTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_baselineConstraint, "setConstant:");

  -[WDSubtitleDateTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)mainTextLabel
{
  return self->_mainTextLabel;
}

- (void)setMainTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_mainTextLabel, a3);
}

- (UILabel)subtitleTextLabel
{
  return self->_subtitleTextLabel;
}

- (void)setSubtitleTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextLabel, a3);
}

- (UILabel)dateTextLabel
{
  return self->_dateTextLabel;
}

- (void)setDateTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateTextLabel, a3);
}

- (NSLayoutConstraint)baselineConstraint
{
  return self->_baselineConstraint;
}

- (void)setBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_baselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselineConstraint, 0);
  objc_storeStrong((id *)&self->_dateTextLabel, 0);
  objc_storeStrong((id *)&self->_subtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_mainTextLabel, 0);
}

@end
