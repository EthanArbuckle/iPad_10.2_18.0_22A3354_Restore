@implementation SFContactAutoFillTableViewCell

- (SFContactAutoFillTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFContactAutoFillTableViewCell *v4;
  SFContactAutoFillTableViewCell *v5;
  void *v6;
  id v7;
  id v8;
  UILabel *v9;
  UILabel *categoryLabel;
  void *v11;
  UILabel *v12;
  UILabel *optionLabel;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  UIButton *checkmarkButton;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SFContactAutoFillTableViewCell *v40;
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
  objc_super v66;
  _QWORD v67[11];

  v67[9] = *MEMORY[0x1E0C80C00];
  v66.receiver = self;
  v66.super_class = (Class)SFContactAutoFillTableViewCell;
  v4 = -[SFContactAutoFillTableViewCell initWithStyle:reuseIdentifier:](&v66, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFContactAutoFillTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v7, "setAlignment:", 1);
    objc_msgSend(v7, "setAxis:", 0);
    objc_msgSend(v7, "setDistribution:", 0);
    objc_msgSend(v7, "setSpacing:", -14.0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v7);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v8, "setAlignment:", 1);
    objc_msgSend(v8, "setAxis:", 0);
    objc_msgSend(v8, "setDistribution:", 0);
    objc_msgSend(v8, "setLayoutMargins:", 14.0, 14.0, 14.0, 14.0);
    objc_msgSend(v8, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v8, "setSpacing:", 14.0);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addArrangedSubview:", v8);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    categoryLabel = v5->_categoryLabel;
    v5->_categoryLabel = v9;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_categoryLabel, "setFont:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_categoryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel _setTextColorFollowsTintColor:](v5->_categoryLabel, "_setTextColorFollowsTintColor:", 1);
    v65 = v8;
    objc_msgSend(v8, "addArrangedSubview:", v5->_categoryLabel);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    optionLabel = v5->_optionLabel;
    v5->_optionLabel = v12;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_optionLabel, "setFont:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_optionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "addArrangedSubview:", v5->_optionLabel);
    objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "background");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setButtonSize:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setBackgroundColor:", v16);

    v17 = *MEMORY[0x1E0DC3298];
    v18 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v19 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v20 = *(double *)(MEMORY[0x1E0DC3298] + 24);
    objc_msgSend(v64, "setBackgroundInsets:", *MEMORY[0x1E0DC3298], v18, v19, v20);
    v63 = v15;
    objc_msgSend(v15, "setContentInsets:", v17, v18, v19, v20);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v15, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    checkmarkButton = v5->_checkmarkButton;
    v5->_checkmarkButton = (UIButton *)v21;

    -[UIButton addTarget:action:forControlEvents:](v5->_checkmarkButton, "addTarget:action:forControlEvents:", v5, sel_checkmarkButtonTapped_, 64);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_checkmarkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v23, "addSubview:", v5->_checkmarkButton);
    objc_msgSend(v7, "insertArrangedSubview:atIndex:", v23, 0);
    v49 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton centerXAnchor](v5->_checkmarkButton, "centerXAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v23;
    objc_msgSend(v23, "centerXAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v59;
    -[UIButton centerYAnchor](v5->_checkmarkButton, "centerYAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v54;
    objc_msgSend(v23, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToConstant:", 48.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v52;
    objc_msgSend(v23, "heightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToConstant:", 48.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v50;
    objc_msgSend(v7, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v67[4] = v46;
    objc_msgSend(v7, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v67[5] = v43;
    v58 = v7;
    objc_msgSend(v7, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v6;
    v57 = v6;
    objc_msgSend(v6, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v67[6] = v26;
    objc_msgSend(v7, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v67[7] = v29;
    -[UILabel widthAnchor](v5->_categoryLabel, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", 100.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v67[8] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activateConstraints:", v32);

    LODWORD(v33) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_optionLabel, "setContentHuggingPriority:forAxis:", 0, v33);
    LODWORD(v34) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_categoryLabel, "setContentCompressionResistancePriority:forAxis:", 0, v34);
    LODWORD(v35) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_categoryLabel, "setContentHuggingPriority:forAxis:", 0, v35);
    LODWORD(v36) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_checkmarkButton, "setContentCompressionResistancePriority:forAxis:", 1, v36);
    LODWORD(v37) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_checkmarkButton, "setContentCompressionResistancePriority:forAxis:", 0, v37);
    LODWORD(v38) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_checkmarkButton, "setContentHuggingPriority:forAxis:", 1, v38);
    LODWORD(v39) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_checkmarkButton, "setContentHuggingPriority:forAxis:", 0, v39);
    v40 = v5;

  }
  return v5;
}

- (void)setValue:(id)a3 property:(id)a4
{
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_value, a3);
  v8 = (_QWORD *)MEMORY[0x1E0D8AE28];
  if (self->_usesDetailAppearance)
  {
    objc_msgSend(v14, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
    if (objc_msgSend(v10, "isEqualToString:", *v8))
      _WBSLocalizedString();
    else
      objc_msgSend(MEMORY[0x1E0C97200], "localizedStringForKey:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UILabel setText:](self->_categoryLabel, "setText:", v9);

  v11 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C967F0]);
  if (v11)
    v12 = 0;
  else
    v12 = 4;
  -[UILabel setNumberOfLines:](self->_optionLabel, "setNumberOfLines:", v11 ^ 1u);
  -[UILabel setLineBreakMode:](self->_optionLabel, "setLineBreakMode:", v12);
  -[UIButton setEnabled:](self->_checkmarkButton, "setEnabled:", objc_msgSend(v7, "isEqualToString:", *v8) ^ 1);
  -[SFContactAutoFillTableViewCell setChecked:](self, "setChecked:", objc_msgSend(v14, "selected"));
  objc_msgSend(v14, "displayValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_optionLabel, "setText:", v13);

}

- (void)checkmarkButtonTapped:(id)a3
{
  -[SFContactAutoFillTableViewCell setChecked:](self, "setChecked:", !self->_checked);
}

- (void)setUsesDetailAppearance:(BOOL)a3
{
  self->_usesDetailAppearance = a3;
  -[UIButton setHidden:](self->_checkmarkButton, "setHidden:");
}

- (void)setChecked:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  self->_checked = a3;
  -[SFContactAutoFillValue setSelected:](self->_value, "setSelected:");
  -[UIButton setSelected:](self->_checkmarkButton, "setSelected:", self->_checked);
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContactAutoFillValue matches](self->_value, "matches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8AE28]);

  if ((v8 & 1) == 0)
  {
    -[UIButton configuration](self->_checkmarkButton, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_checked)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v10);

      v11 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v12;
      v21 = v4;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v20;
      v15 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v16);

      v11 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v19;
      v15 = 1;
    }
    objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationWithPaletteColors:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredSymbolConfigurationForImage:", v18);

    -[UIButton setConfiguration:](self->_checkmarkButton, "setConfiguration:", v9);
  }

}

- (BOOL)usesDetailAppearance
{
  return self->_usesDetailAppearance;
}

- (BOOL)checked
{
  return self->_checked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionLabel, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkButton, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
