@implementation HUEditableCheckmarkTextCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUEditableCheckmarkTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUEditableCheckmarkTextCell *v4;
  HUEditableCheckmarkTextCell *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UITextField *textField;
  void *v13;
  void *v14;
  HUCheckmarkAccessoryView *v15;
  HUCheckmarkAccessoryView *checkmarkView;
  void *v17;
  uint64_t v18;
  UITapGestureRecognizer *checkmarkTapRecognizer;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUEditableCheckmarkTextCell;
  v4 = -[HUEditableCheckmarkTextCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_disableCheckmark = 0;
    v4->_removeCheckmark = 0;
    v4->_isChecked = 0;
    v4->_allowCheckmarkSelectionWhileDisabled = 0;
    v6 = objc_alloc(MEMORY[0x1E0CEAAD0]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    textField = v5->_textField;
    v5->_textField = (UITextField *)v11;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v5->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v5->_textField, "setFont:", v13);

    -[UITextField setAdjustsFontForContentSizeCategory:](v5->_textField, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextField setReturnKeyType:](v5->_textField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v5->_textField, "setClearButtonMode:", 3);
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v5->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUEditableCheckmarkTextCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_textField);

    v15 = -[HUCheckmarkAccessoryView initWithFrame:]([HUCheckmarkAccessoryView alloc], "initWithFrame:", v7, v8, v9, v10);
    checkmarkView = v5->_checkmarkView;
    v5->_checkmarkView = v15;

    -[HUCheckmarkAccessoryView sizeToFit](v5->_checkmarkView, "sizeToFit");
    -[HUCheckmarkAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v5->_checkmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUEditableCheckmarkTextCell contentView](v5, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v5->_checkmarkView);

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v5, sel__checkmarkTapped_);
    checkmarkTapRecognizer = v5->_checkmarkTapRecognizer;
    v5->_checkmarkTapRecognizer = (UITapGestureRecognizer *)v18;

    -[UITapGestureRecognizer setCancelsTouchesInView:](v5->_checkmarkTapRecognizer, "setCancelsTouchesInView:", 1);
    -[UITapGestureRecognizer setDelegate:](v5->_checkmarkTapRecognizer, "setDelegate:", v5);
    -[HUCheckmarkAccessoryView setUserInteractionEnabled:](v5->_checkmarkView, "setUserInteractionEnabled:", 1);
    -[HUCheckmarkAccessoryView addGestureRecognizer:](v5->_checkmarkView, "addGestureRecognizer:", v5->_checkmarkTapRecognizer);
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  -[HUEditableCheckmarkTextCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;

  -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditableCheckmarkTextCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v5 = v5 + v11 + 0.0 + 12.0;

  }
  -[HUEditableCheckmarkTextCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5, 0.0, 0.0);
  -[HUEditableCheckmarkTextCell separatorInset](self, "separatorInset");
  if (v5 != v15 || v12 != 0.0 || v14 != 0.0 || v13 != 0.0)
  {
    -[HUEditableCheckmarkTextCell separatorInset](self, "separatorInset");
    -[HUEditableCheckmarkTextCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5 + v5 - v16, 0.0, 0.0);
  }
  v17.receiver = self;
  v17.super_class = (Class)HUEditableCheckmarkTextCell;
  -[HUEditableCheckmarkTextCell layoutSubviews](&v17, sel_layoutSubviews);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUEditableCheckmarkTextCell;
  -[HUEditableCheckmarkTextCell prepareForReuse](&v9, sel_prepareForReuse);
  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", 0);

  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endEditing:", 1);

  -[HUEditableCheckmarkTextCell setDisableCheckmark:](self, "setDisableCheckmark:", 0);
  -[HUEditableCheckmarkTextCell setChecked:](self, "setChecked:", 0);
  -[HUEditableCheckmarkTextCell setAllowCheckmarkSelectionWhileDisabled:](self, "setAllowCheckmarkSelectionWhileDisabled:", 0);
  -[HUEditableCheckmarkTextCell checkmarkTapRecognizer](self, "checkmarkTapRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView **p_accessoryView;
  UIView *accessoryView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUEditableCheckmarkTextCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_accessoryView);

    v5 = v9;
  }

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v4;

  if (a3)
  {
    -[HUEditableCheckmarkTextCell textField](self, "textField", a3, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = !a3
    || -[HUEditableCheckmarkTextCell allowCheckmarkSelectionWhileDisabled](self, "allowCheckmarkSelectionWhileDisabled");
  v6 = !v3;
  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

  if (v6)
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClearButtonMode:", v6);

  -[HUEditableCheckmarkTextCell checkmarkTapRecognizer](self, "checkmarkTapRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v5);

}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isChecked != a3)
  {
    v3 = a3;
    self->_isChecked = a3;
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setChecked:", v3);

  }
}

- (void)setDisableCheckmark:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (self->_disableCheckmark != a3)
  {
    self->_disableCheckmark = a3;
    v4 = -[HUEditableCheckmarkTextCell disableCheckmark](self, "disableCheckmark");
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "setDisabled:", 1);

      -[HUEditableCheckmarkTextCell checkmarkTapRecognizer](self, "checkmarkTapRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
    }
    else
    {
      objc_msgSend(v5, "setDisabled:", 0);

      -[HUEditableCheckmarkTextCell checkmarkTapRecognizer](self, "checkmarkTapRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
    }
    objc_msgSend(v7, "setEnabled:", v9);

    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", -[HUEditableCheckmarkTextCell disableCheckmark](self, "disableCheckmark"));

  }
}

- (void)setRemoveCheckmark:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_removeCheckmark != a3)
  {
    self->_removeCheckmark = a3;
    if (-[HUEditableCheckmarkTextCell removeCheckmark](self, "removeCheckmark"))
    {
      -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");
    }
    else
    {
      -[HUEditableCheckmarkTextCell contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", v6);

      -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sizeToFit");
    }

    -[HUEditableCheckmarkTextCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[HUEditableCheckmarkTextCell updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
  }
}

- (void)_checkmarkTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[HUEditableCheckmarkTextCell delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HUEditableCheckmarkTextCell delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUEditableCheckmarkTextCell item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "checkmarkTappedInCell:forItem:", self, v6);

  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
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
  uint64_t v65;
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
  objc_super v80;
  void *v81;
  _QWORD v82[3];
  void *v83;
  _QWORD v84[4];
  _QWORD v85[5];

  v85[3] = *MEMORY[0x1E0C80C00];
  -[HUEditableCheckmarkTextCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditableCheckmarkTextCell staticConstraints](self, "staticConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = v4;
  if (!v5)
  {
    -[HUEditableCheckmarkTextCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v9) = 1148829696;
    v77 = v8;
    objc_msgSend(v8, "setPriority:", v9);
    v85[0] = v8;
    -[HUEditableCheckmarkTextCell textField](self, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v13;
    -[HUEditableCheckmarkTextCell textField](self, "textField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v85[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableCheckmarkTextCell setStaticConstraints:](self, "setStaticConstraints:", v18);

    v4 = v79;
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[HUEditableCheckmarkTextCell staticConstraints](self, "staticConstraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v20);

    -[HUEditableCheckmarkTextCell textField](self, "textField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1132068864;
    objc_msgSend(v21, "setContentHuggingPriority:forAxis:", 0, v22);

    -[HUEditableCheckmarkTextCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1132068864;
    objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 0, v24);

  }
  v25 = (void *)objc_opt_new();
  -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "superview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditableCheckmarkTextCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqual:", v28);

  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v25;
  if (v29)
  {
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "trailingAnchor");
    v65 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v65, 12.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v32;
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v63;
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v73 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v34;
    -[HUEditableCheckmarkTextCell checkmarkView](self, "checkmarkView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "centerYAnchor");
    v75 = v30;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v39);

    v4 = v79;
    v30 = v75;

    v40 = (void *)v65;
    v41 = v69;

    v31 = v73;
  }
  else
  {
    objc_msgSend(v4, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v32);
  }

  -[HUEditableCheckmarkTextCell accessoryView](self, "accessoryView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditableCheckmarkTextCell textField](self, "textField");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[HUEditableCheckmarkTextCell accessoryView](self, "accessoryView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v74);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v72;
    -[HUEditableCheckmarkTextCell accessoryView](self, "accessoryView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "centerYAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v46;
    -[HUEditableCheckmarkTextCell accessoryView](self, "accessoryView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObjectsFromArray:", v51);

    v4 = v79;
    v52 = v78;

    -[HUEditableCheckmarkTextCell accessoryView](self, "accessoryView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = 1144766464;
    objc_msgSend(v43, "setContentCompressionResistancePriority:forAxis:", 0, v53);
  }
  else
  {
    objc_msgSend(v4, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v25;
    objc_msgSend(v25, "addObjectsFromArray:", v56);

  }
  v57 = (void *)MEMORY[0x1E0CB3718];
  -[HUEditableCheckmarkTextCell dynamicConstraints](self, "dynamicConstraints");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "deactivateConstraints:", v58);

  -[HUEditableCheckmarkTextCell setDynamicConstraints:](self, "setDynamicConstraints:", v52);
  v59 = (void *)MEMORY[0x1E0CB3718];
  -[HUEditableCheckmarkTextCell dynamicConstraints](self, "dynamicConstraints");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "activateConstraints:", v60);

  v80.receiver = self;
  v80.super_class = (Class)HUEditableCheckmarkTextCell;
  -[HUEditableCheckmarkTextCell updateConstraints](&v80, sel_updateConstraints);

}

- (id)accessoryView
{
  return self->_accessoryView;
}

- (UITextField)textField
{
  return self->_textField;
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

- (BOOL)disableCheckmark
{
  return self->_disableCheckmark;
}

- (BOOL)removeCheckmark
{
  return self->_removeCheckmark;
}

- (BOOL)isChecked
{
  return self->_isChecked;
}

- (BOOL)allowCheckmarkSelectionWhileDisabled
{
  return self->_allowCheckmarkSelectionWhileDisabled;
}

- (void)setAllowCheckmarkSelectionWhileDisabled:(BOOL)a3
{
  self->_allowCheckmarkSelectionWhileDisabled = a3;
}

- (HUEditableCheckmarkDelegate)delegate
{
  return (HUEditableCheckmarkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUCheckmarkAccessoryView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraints, a3);
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (UITapGestureRecognizer)checkmarkTapRecognizer
{
  return self->_checkmarkTapRecognizer;
}

- (void)setCheckmarkTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkTapRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkTapRecognizer, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
