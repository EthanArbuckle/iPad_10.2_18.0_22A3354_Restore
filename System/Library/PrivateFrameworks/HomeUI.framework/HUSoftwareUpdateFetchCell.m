@implementation HUSoftwareUpdateFetchCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUSoftwareUpdateFetchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUSoftwareUpdateFetchCell *v4;
  HUSoftwareUpdateFetchCell *v5;
  void *v6;
  HUIconView *v7;
  HUIconView *iconView;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  UILabel *subtitleLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  uint64_t v23;
  UIActivityIndicatorView *checkingForUpdateSpinner;
  double v25;
  double v26;
  uint64_t v27;
  UIView *titleSpinnerView;
  void *v29;
  void *v30;
  uint64_t v31;
  UIStackView *mainStackView;
  UIStackView *v33;
  void *v34;
  void *v35;
  objc_super v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)HUSoftwareUpdateFetchCell;
  v4 = -[HUSoftwareUpdateFetchCell initWithStyle:reuseIdentifier:](&v37, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HUSoftwareUpdateFetchCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[HUSoftwareUpdateFetchCell setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateFetchCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (HUIconView *)objc_alloc_init(MEMORY[0x1E0D33720]);
    iconView = v5->_iconView;
    v5->_iconView = v7;

    -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](v5->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUIconView setContentMode:](v5->_iconView, "setContentMode:", 4);
    v5->_iconSize = 2;
    -[HUIconView setIconSize:](v5->_iconView, "setIconSize:", 2);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    v11 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB538], 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v5->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v5->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v15;

    v17 = v5->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    v19 = v5->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

    v21 = v5->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setNumberOfLines:](v5->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v5->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v5->_subtitleLabel, "setLineBreakMode:", 0);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    checkingForUpdateSpinner = v5->_checkingForUpdateSpinner;
    v5->_checkingForUpdateSpinner = (UIActivityIndicatorView *)v23;

    -[UIActivityIndicatorView startAnimating](v5->_checkingForUpdateSpinner, "startAnimating");
    -[UIActivityIndicatorView setHidesWhenStopped:](v5->_checkingForUpdateSpinner, "setHidesWhenStopped:", 1);
    LODWORD(v25) = 1148846080;
    -[UIActivityIndicatorView setContentHuggingPriority:forAxis:](v5->_checkingForUpdateSpinner, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](v5->_checkingForUpdateSpinner, "setContentCompressionResistancePriority:forAxis:", 0, v26);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v5->_checkingForUpdateSpinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = objc_opt_new();
    titleSpinnerView = v5->_titleSpinnerView;
    v5->_titleSpinnerView = (UIView *)v27;

    -[UIView addSubview:](v5->_titleSpinnerView, "addSubview:", v5->_checkingForUpdateSpinner);
    -[UIView addSubview:](v5->_titleSpinnerView, "addSubview:", v5->_titleLabel);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v5->_iconView);
    v38[0] = v5->_titleSpinnerView;
    v38[1] = v5->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v30);

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithArrangedSubviews:", v29);
    mainStackView = v5->_mainStackView;
    v5->_mainStackView = (UIStackView *)v31;

    -[UIStackView setAxis:](v5->_mainStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v5->_mainStackView, "setAlignment:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_mainStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v5->_mainStackView, "setSpacing:", 4.0);
    v33 = v5->_mainStackView;
    -[HUSoftwareUpdateFetchCell iconView](v5, "iconView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setCustomSpacing:afterView:](v33, "setCustomSpacing:afterView:", v34, 10.0);

    -[HUSoftwareUpdateFetchCell contentView](v5, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v5->_mainStackView);

  }
  return v5;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
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
  id v26;

  v3 = a3;
  -[HUSoftwareUpdateFetchCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithAttributes:", MEMORY[0x1E0C9AA70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  -[HUSoftwareUpdateFetchCell titleSpinnerView](self, "titleSpinnerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell checkingForUpdateSpinner](self, "checkingForUpdateSpinner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsView:", v14);

  if (!v12 || (v15 & 1) != 0)
  {
    if (((v12 | v15 ^ 1) & 1) == 0)
    {
      -[HUSoftwareUpdateFetchCell checkingForUpdateSpinner](self, "checkingForUpdateSpinner");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeFromSuperview");

      -[HUSoftwareUpdateFetchCell checkingForUpdateSpinner](self, "checkingForUpdateSpinner");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stopAnimating");

    }
  }
  else
  {
    -[HUSoftwareUpdateFetchCell titleSpinnerView](self, "titleSpinnerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateFetchCell checkingForUpdateSpinner](self, "checkingForUpdateSpinner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    -[HUSoftwareUpdateFetchCell checkingForUpdateSpinner](self, "checkingForUpdateSpinner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startAnimating");

    -[HUSoftwareUpdateFetchCell updateConstraints](self, "updateConstraints");
  }
  if (v15)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTextColor:", v21);

  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell iconView](self, "iconView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updateWithIconDescriptor:displayStyle:animated:", v23, 1, v3);

  -[HUSoftwareUpdateFetchCell iconView](self, "iconView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", v23 == 0);

  -[HUSoftwareUpdateFetchCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateConstraints
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)HUSoftwareUpdateFetchCell;
  -[HUSoftwareUpdateFetchCell updateConstraints](&v48, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_mainStackView, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[UIStackView trailingAnchor](self->_mainStackView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  -[UIStackView topAnchor](self->_mainStackView, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  -[UIStackView bottomAnchor](self->_mainStackView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  -[UILabel rightAnchor](self->_titleLabel, "rightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView rightAnchor](self->_titleSpinnerView, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_titleSpinnerView, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_titleSpinnerView, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  -[UILabel leftAnchor](self->_titleLabel, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leftAnchor](self->_titleSpinnerView, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  if (-[UIView containsView:](self->_titleSpinnerView, "containsView:", self->_checkingForUpdateSpinner))
  {
    -[UIView widthAnchor](self->_titleSpinnerView, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView widthAnchor](self->_mainStackView, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v38);

    -[UIActivityIndicatorView leftAnchor](self->_checkingForUpdateSpinner, "leftAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](self->_titleSpinnerView, "leftAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v41);

    -[UIActivityIndicatorView centerYAnchor](self->_checkingForUpdateSpinner, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](self->_titleSpinnerView, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v44);

    -[UILabel leftAnchor](self->_titleLabel, "leftAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView rightAnchor](self->_checkingForUpdateSpinner, "rightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 8.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v47);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);

}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UIStackView)mainStackView
{
  return self->_mainStackView;
}

- (void)setMainStackView:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackView, a3);
}

- (UIView)titleSpinnerView
{
  return self->_titleSpinnerView;
}

- (void)setTitleSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_titleSpinnerView, a3);
}

- (UIActivityIndicatorView)checkingForUpdateSpinner
{
  return self->_checkingForUpdateSpinner;
}

- (void)setCheckingForUpdateSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, a3);
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(unint64_t)a3
{
  self->_iconSize = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, 0);
  objc_storeStrong((id *)&self->_titleSpinnerView, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
