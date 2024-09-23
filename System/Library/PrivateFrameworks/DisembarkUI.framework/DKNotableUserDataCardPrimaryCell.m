@implementation DKNotableUserDataCardPrimaryCell

- (DKNotableUserDataCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  DKNotableUserDataCardPrimaryCell *v15;
  uint64_t v16;
  UIView *iconView;
  uint64_t v18;
  UILabel *titleLabel;
  void *v20;
  uint64_t v21;
  UILabel *subtitleLabel;
  void *v23;
  void *v24;
  uint64_t v25;
  UIStackView *labelContainer;
  id v27;
  void *v28;
  uint64_t v29;
  UIImageView *chevronImageView;
  void *v31;
  void *v32;
  double v33;
  uint64_t v34;
  UIView *separatorView;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  objc_super v86;
  _QWORD v87[17];

  v87[15] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v86.receiver = self;
  v86.super_class = (Class)DKNotableUserDataCardPrimaryCell;
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v15 = -[DKNotableUserDataCardPrimaryCell initWithFrame:](&v86, sel_initWithFrame_, *MEMORY[0x24BDBF090], v12, v13, v14);
  if (v15)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v10);
    iconView = v15->_iconView;
    v15->_iconView = (UIView *)v16;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setContentMode:](v15->_iconView, "setContentMode:", 1);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v15->_titleLabel;
    v15->_titleLabel = (UILabel *)v18;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v15->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DKNotableUserDataCardPrimaryCell _titleFont](v15, "_titleFont");
    v83 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15->_titleLabel, "setFont:", v20);

    -[UILabel setText:](v15->_titleLabel, "setText:", v8);
    -[UILabel setNumberOfLines:](v15->_titleLabel, "setNumberOfLines:", 0);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v11, v12, v13, v14);
    subtitleLabel = v15->_subtitleLabel;
    v15->_subtitleLabel = (UILabel *)v21;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v15->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v85 = v8;
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15->_subtitleLabel, "setTextColor:", v23);

    -[DKNotableUserDataCardPrimaryCell _subtitleFont](v15, "_subtitleFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15->_subtitleLabel, "setFont:", v24);

    -[UILabel setText:](v15->_subtitleLabel, "setText:", v9);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithFrame:", v11, v12, v13, v14);
    labelContainer = v15->_labelContainer;
    v15->_labelContainer = (UIStackView *)v25;

    -[UIStackView setAxis:](v15->_labelContainer, "setAxis:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v15->_labelContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v15->_labelContainer, "addArrangedSubview:", v15->_titleLabel);
    -[UIStackView addArrangedSubview:](v15->_labelContainer, "addArrangedSubview:", v15->_subtitleLabel);
    v27 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[DKNotableUserDataCardPrimaryCell _chevronImage](v15, "_chevronImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithImage:", v28);
    chevronImageView = v15->_chevronImageView;
    v15->_chevronImageView = (UIImageView *)v29;

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "colorWithAlphaComponent:", 0.3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v15->_chevronImageView, "setTintColor:", v32);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v15->_chevronImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v15->_chevronImageView, "setContentMode:", 1);
    LODWORD(v33) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v15->_chevronImageView, "setContentHuggingPriority:forAxis:", 0, v33);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v11, v12, v13, v14);
    separatorView = v15->_separatorView;
    v15->_separatorView = (UIView *)v34;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setHidden:](v15->_separatorView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15->_separatorView, "setBackgroundColor:", v36);

    -[DKNotableUserDataCardPrimaryCell addSubview:](v15, "addSubview:", v15->_iconView);
    -[DKNotableUserDataCardPrimaryCell addSubview:](v15, "addSubview:", v15->_labelContainer);
    -[DKNotableUserDataCardPrimaryCell addSubview:](v15, "addSubview:", v15->_chevronImageView);
    -[DKNotableUserDataCardPrimaryCell addSubview:](v15, "addSubview:", v15->_separatorView);
    -[UIView widthAnchor](v15->_iconView, "widthAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToConstant:", 40.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v81;
    -[UIView heightAnchor](v15->_iconView, "heightAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToConstant:", 40.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v79;
    -[UIView leadingAnchor](v15->_iconView, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell layoutMarginsGuide](v15, "layoutMarginsGuide");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v75;
    -[UIView centerYAnchor](v15->_iconView, "centerYAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell centerYAnchor](v15, "centerYAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v87[3] = v72;
    -[UIStackView leadingAnchor](v15->_labelContainer, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v15->_iconView, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 14.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v87[4] = v69;
    -[UIStackView trailingAnchor](v15->_labelContainer, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v15->_chevronImageView, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v87[5] = v66;
    -[UIStackView centerYAnchor](v15->_labelContainer, "centerYAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell centerYAnchor](v15, "centerYAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v87[6] = v63;
    -[UIStackView topAnchor](v15->_labelContainer, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell topAnchor](v15, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v61, 1.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v87[7] = v60;
    -[DKNotableUserDataCardPrimaryCell bottomAnchor](v15, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v15->_labelContainer, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v58, 1.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v87[8] = v57;
    -[UIImageView centerYAnchor](v15->_chevronImageView, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell centerYAnchor](v15, "centerYAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v87[9] = v54;
    -[UIImageView trailingAnchor](v15->_chevronImageView, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell layoutMarginsGuide](v15, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v87[10] = v50;
    -[UIView heightAnchor](v15->_separatorView, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToConstant:", 1.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v87[11] = v48;
    -[UIView leadingAnchor](v15->_separatorView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v15->_labelContainer, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v87[12] = v38;
    -[UIView trailingAnchor](v15->_separatorView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell trailingAnchor](v15, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v84 = v9;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v87[13] = v41;
    -[UIView bottomAnchor](v15->_separatorView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell bottomAnchor](v15, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v87[14] = v44;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 15);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserDataCardPrimaryCell addConstraints:](v15, "addConstraints:", v45);

    v10 = v83;
    v9 = v84;

    v8 = v85;
  }

  return v15;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_expanded = a3;
  -[DKNotableUserDataCardPrimaryCell _chevronImage](self, "_chevronImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKNotableUserDataCardPrimaryCell chevronImageView](self, "chevronImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[DKNotableUserDataCardPrimaryCell separatorView](self, "separatorView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", !v3);

}

- (void)setHideChevron:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DKNotableUserDataCardPrimaryCell chevronImageView](self, "chevronImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DKNotableUserDataCardPrimaryCell;
  -[DKNotableUserDataCardPrimaryCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[DKNotableUserDataCardPrimaryCell _titleFont](self, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKNotableUserDataCardPrimaryCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[DKNotableUserDataCardPrimaryCell _subtitleFont](self, "_subtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKNotableUserDataCardPrimaryCell subtitleLabel](self, "subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (id)_chevronImage
{
  const __CFString *v2;

  if (-[DKNotableUserDataCardPrimaryCell isExpanded](self, "isExpanded"))
    v2 = CFSTR("chevron.down");
  else
    v2 = CFSTR("chevron.forward");
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_subtitleFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7810]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)hideChevron
{
  return self->_hideChevron;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIStackView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainer, a3);
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

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
