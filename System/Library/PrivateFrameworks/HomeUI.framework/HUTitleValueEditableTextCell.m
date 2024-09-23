@implementation HUTitleValueEditableTextCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUTitleValueEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTitleValueEditableTextCell *v4;
  uint64_t v5;
  UIFont *titleFont;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUTitleValueEditableTextCell;
  v4 = -[HUTitleValueEditableTextCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v5 = objc_claimAutoreleasedReturnValue();
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    -[HUTitleValueEditableTextCell _addTitleLabel](v4, "_addTitleLabel");
    -[HUTitleValueEditableTextCell _addValueTextField](v4, "_addValueTextField");
  }
  return v4;
}

- (void)prepareForReuse
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUTitleValueEditableTextCell;
  -[HUTitleValueEditableTextCell prepareForReuse](&v12, sel_prepareForReuse);
  -[HUTitleValueEditableTextCell setHideTitle:](self, "setHideTitle:", 0);
  -[HUTitleValueEditableTextCell setTitleText:](self, "setTitleText:", 0);
  v3 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueEditableTextCell setTitleFont:](self, "setTitleFont:", v4);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", 0);

  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaceholder:", 0);

  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);

  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endEditing:", 1);

}

- (void)setTitleText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)setTitleFont:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleFont, a3);
  v5 = a3;
  -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

}

- (void)setHideTitle:(BOOL)a3
{
  if (self->_hideTitle != a3)
  {
    self->_hideTitle = a3;
    if (a3)
    {
      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
      -[HUTitleValueEditableTextCell setTitleLabelConstraints:](self, "setTitleLabelConstraints:", 0);
      -[HUTitleValueEditableTextCell setLabelsSpacingConstraint:](self, "setLabelsSpacingConstraint:", 0);
    }
    else
    {
      -[HUTitleValueEditableTextCell _addTitleLabel](self, "_addTitleLabel");
      -[HUTitleValueEditableTextCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v4;

  if (a3)
  {
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField", a3, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  self->_disabled = a3;
  v4 = !a3;
  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClearButtonMode:", v4);

  -[HUTitleValueEditableTextCell _updateTitle](self, "_updateTitle");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  uint64_t v20;
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
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
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
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  _QWORD v73[5];
  _QWORD v74[6];

  v74[4] = *MEMORY[0x1E0C80C00];
  -[HUTitleValueEditableTextCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HUTitleValueEditableTextCell titleLabelConstraints](self, "titleLabelConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_5;
    -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v66);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v64;
    -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "widthAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintLessThanOrEqualToAnchor:", v58);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v56;
    -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v11;
    -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heightAnchor");
    v14 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleValueEditableTextCell setTitleLabelConstraints:](self, "setTitleLabelConstraints:", v17);

    v4 = v14;
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[HUTitleValueEditableTextCell titleLabelConstraints](self, "titleLabelConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v5);
  }

LABEL_5:
  -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "superview");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[HUTitleValueEditableTextCell valueTextFieldConstraints](self, "valueTextFieldConstraints");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      goto LABEL_9;
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v67);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v65;
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintLessThanOrEqualToAnchor:", v59);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v57;
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:multiplier:", v52, 0.4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v51;
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v24 = v4;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v26;
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v73[4] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleValueEditableTextCell setValueTextFieldConstraints:](self, "setValueTextFieldConstraints:", v31);

    v4 = v24;
    v32 = (void *)MEMORY[0x1E0CB3718];
    -[HUTitleValueEditableTextCell valueTextFieldConstraints](self, "valueTextFieldConstraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v19);
  }

LABEL_9:
  -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "superview");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "superview");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      -[HUTitleValueEditableTextCell labelsSpacingConstraint](self, "labelsSpacingConstraint");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
        goto LABEL_15;
      -[HUTitleValueEditableTextCell titleLabel](self, "titleLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "leadingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:constant:", v43, -16.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueEditableTextCell setLabelsSpacingConstraint:](self, "setLabelsSpacingConstraint:", v44);

      -[HUTitleValueEditableTextCell labelsSpacingConstraint](self, "labelsSpacingConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setActive:", 1);
    }
    else
    {

    }
  }

LABEL_15:
  -[HUTitleValueEditableTextCell minimumHeightConstraint](self, "minimumHeightConstraint");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    -[HUTitleValueEditableTextCell contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToConstant:", *MEMORY[0x1E0CEBC18]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTitleValueEditableTextCell setMinimumHeightConstraint:](self, "setMinimumHeightConstraint:", v48);

    -[HUTitleValueEditableTextCell minimumHeightConstraint](self, "minimumHeightConstraint");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

  }
  v72.receiver = self;
  v72.super_class = (Class)HUTitleValueEditableTextCell;
  -[HUTitleValueEditableTextCell updateConstraints](&v72, sel_updateConstraints);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[HUTitleValueEditableTextCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueEditableTextCell setTitleText:](self, "setTitleText:", v6);

  v7 = *MEMORY[0x1E0D30BF8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v20[0] = *MEMORY[0x1E0CEA098];
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v20[1] = *MEMORY[0x1E0CEA0A0];
    -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "prefersDynamicString"))
    {
      -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      objc_msgSend(v14, "dynamicStringForSize:attributes:", v13, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAttributedText:", v18);

    }
    else
    {
      objc_msgSend(v14, "stringWithAttributes:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTitleValueEditableTextCell valueTextField](self, "valueTextField");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAttributedText:", v15);
    }

  }
  -[HUTitleValueEditableTextCell _updateTitle](self, "_updateTitle");

}

- (void)_addTitleLabel
{
  void *v3;
  id v4;
  UILabel *v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  id v9;

  -[UILabel superview](self->_titleLabel, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Title label already added: %@"), self);
  if (!self->_titleLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUTitleValueEditableTextCell titleFont](self, "titleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

    -[HUTitleValueEditableTextCell titleText](self, "titleText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v8);

    -[HUTitleValueEditableTextCell _updateTitle](self, "_updateTitle");
  }
  -[HUTitleValueEditableTextCell contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_titleLabel);

}

- (void)_addValueTextField
{
  void *v3;
  UITextField *v4;
  UITextField *valueTextField;
  void *v6;
  void *v7;
  id v8;

  -[UITextField superview](self->_valueTextField, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Value label already added: %@"), self);
  if (!self->_valueTextField)
  {
    v4 = (UITextField *)objc_opt_new();
    valueTextField = self->_valueTextField;
    self->_valueTextField = v4;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](self->_valueTextField, "setFont:", v6);

    -[UITextField setReturnKeyType:](self->_valueTextField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](self->_valueTextField, "setClearButtonMode:", 3);
    -[UITextField setTextAlignment:](self->_valueTextField, "setTextAlignment:", 2* (-[HUTitleValueEditableTextCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0));
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](self->_valueTextField, "setTextColor:", v7);

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_valueTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  -[HUTitleValueEditableTextCell contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_valueTextField);

}

- (void)_updateTitle
{
  id v3;

  if (-[HUTitleValueEditableTextCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v3);

}

- (UITextField)valueTextField
{
  return self->_valueTextField;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSArray)titleLabelConstraints
{
  return self->_titleLabelConstraints;
}

- (void)setTitleLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelConstraints, a3);
}

- (NSArray)valueTextFieldConstraints
{
  return self->_valueTextFieldConstraints;
}

- (void)setValueTextFieldConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_valueTextFieldConstraints, a3);
}

- (NSLayoutConstraint)labelsSpacingConstraint
{
  return self->_labelsSpacingConstraint;
}

- (void)setLabelsSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelsSpacingConstraint, a3);
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (void)setMinimumHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_labelsSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_valueTextFieldConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_valueTextField, 0);
}

@end
