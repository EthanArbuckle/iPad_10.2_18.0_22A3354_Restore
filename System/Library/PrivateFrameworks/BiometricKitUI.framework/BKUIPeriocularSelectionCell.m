@implementation BKUIPeriocularSelectionCell

- (double)BKUIPeriocularSelectionCellTopBottomPadding
{
  int v2;
  double result;

  v2 = MGGetSInt32Answer();
  result = 30.0;
  if (v2 == 30)
    return 28.0;
  return result;
}

- (BKUIPeriocularSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BKUIPeriocularSelectionCell *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIImageView *iconView;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UILabel *titleLabel;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  UILabel *subtitleLabel;
  void *v21;
  void *v22;
  double v23;
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
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
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
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  objc_super v101;
  _QWORD v102[11];
  _QWORD v103[7];

  v103[5] = *MEMORY[0x1E0C80C00];
  v101.receiver = self;
  v101.super_class = (Class)BKUIPeriocularSelectionCell;
  v4 = -[BKUIPeriocularSelectionCell initWithStyle:reuseIdentifier:](&v101, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("faceid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithImage:", v6);
    iconView = v4->_iconView;
    v4->_iconView = (UIImageView *)v7;

    v9 = objc_alloc(MEMORY[0x1E0CEA700]);
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIPeriocularSelectionCell _titleFont](v4, "_titleFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v16);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v17);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v18) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v10, v11, v12, v13);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIPeriocularSelectionCell _descriptionFont](v4, "_descriptionFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v21);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v22);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v23) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_iconView, "setContentMode:", 2);
    -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNumberOfLines:", 0);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v10, v11, v12, v13);
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKUIPeriocularSelectionCell titleLabel](v4, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v26);

    -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v27);

    -[BKUIPeriocularSelectionCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v25);

    -[BKUIPeriocularSelectionCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell setBackgroundColor:](v4, "setBackgroundColor:", v31);

    v82 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v25, "topAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell contentView](v4, "contentView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:", v94);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v92;
    v100 = v25;
    objc_msgSend(v25, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell contentView](v4, "contentView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintLessThanOrEqualToAnchor:", v86);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v84;
    objc_msgSend(v25, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell leadingAnchor](v4, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v33;
    objc_msgSend(v25, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell trailingAnchor](v4, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v36;
    objc_msgSend(v25, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell centerYAnchor](v4, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v103[4] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "activateConstraints:", v40);

    v71 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:constant:", v95, 21.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v93;
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "widthAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToConstant:", 37.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v87;
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "heightAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToConstant:", 37.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = v81;
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell centerYAnchor](v4, "centerYAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v102[3] = v76;
    -[BKUIPeriocularSelectionCell titleLabel](v4, "titleLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell BKUIPeriocularSelectionCellTopBottomPadding](v4, "BKUIPeriocularSelectionCellTopBottomPadding");
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v102[4] = v72;
    -[BKUIPeriocularSelectionCell titleLabel](v4, "titleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 20.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v102[5] = v66;
    -[BKUIPeriocularSelectionCell titleLabel](v4, "titleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, -38.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v102[6] = v62;
    -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell titleLabel](v4, "titleLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 1.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v102[7] = v57;
    -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell BKUIPeriocularSelectionCellTopBottomPadding](v4, "BKUIPeriocularSelectionCellTopBottomPadding");
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, -v41);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v102[8] = v53;
    -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPeriocularSelectionCell iconView](v4, "iconView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 20.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v102[9] = v45;
    -[BKUIPeriocularSelectionCell subtitleLabel](v4, "subtitleLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -38.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v102[10] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 11);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "activateConstraints:", v50);

  }
  return v4;
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB590]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_descriptionFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB590]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
