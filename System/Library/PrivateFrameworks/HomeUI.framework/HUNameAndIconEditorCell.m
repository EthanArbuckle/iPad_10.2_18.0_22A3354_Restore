@implementation HUNameAndIconEditorCell

- (HUNameAndIconEditorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUNameAndIconEditorCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUIconButton *v14;
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
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)HUNameAndIconEditorCell;
  v4 = -[HUNameAndIconEditorCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    -[HUNameAndIconEditorCell setContainerView:](v4, "setContainerView:", v10);

    -[HUNameAndIconEditorCell containerView](v4, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUNameAndIconEditorCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNameAndIconEditorCell containerView](v4, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    v14 = -[HUIconButton initWithFrame:]([HUIconButton alloc], "initWithFrame:", v6, v7, v8, v9);
    -[HUNameAndIconEditorCell setIconButton:](v4, "setIconButton:", v14);

    -[HUNameAndIconEditorCell iconButton](v4, "iconButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTarget:action:forControlEvents:", v4, sel__handleIconButtonTap_, 64);

    -[HUNameAndIconEditorCell iconButton](v4, "iconButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUNameAndIconEditorCell containerView](v4, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNameAndIconEditorCell iconButton](v4, "iconButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    -[HUNameAndIconEditorCell iconButton](v4, "iconButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentMode:", 1);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAAD0]), "initWithFrame:", v6, v7, v8, v9);
    -[HUNameAndIconEditorCell setTextField:](v4, "setTextField:", v20);

    objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB538]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v21, "scaledValueForValue:", 17.0);
    objc_msgSend(v22, "systemFontOfSize:weight:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNameAndIconEditorCell textField](v4, "textField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    -[HUNameAndIconEditorCell textField](v4, "textField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setReturnKeyType:", 9);

    -[HUNameAndIconEditorCell textField](v4, "textField");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClearButtonMode:", 1);

    -[HUNameAndIconEditorCell textField](v4, "textField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAutocapitalizationType:", 1);

    -[HUNameAndIconEditorCell textField](v4, "textField");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentVerticalAlignment:", 0);

    -[HUNameAndIconEditorCell textField](v4, "textField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUNameAndIconEditorCell textField](v4, "textField");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAdjustsFontForContentSizeCategory:", 1);

    -[HUNameAndIconEditorCell containerView](v4, "containerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNameAndIconEditorCell textField](v4, "textField");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v32);

    -[HUNameAndIconEditorCell setHideIconButton:](v4, "setHideIconButton:", 0);
    -[HUNameAndIconEditorCell _setupConstraints](v4, "_setupConstraints");

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUNameAndIconEditorCell;
  -[HUNameAndIconEditorCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUNameAndIconEditorCell setDisabled:](self, "setDisabled:", 0);
}

- (void)_setupConstraints
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
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
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
  id v60;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v7);

  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v12);

  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v17);

  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v22);

  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 6.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v27);

  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 6.5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v32);

  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -6.5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v37);

  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = 1148846080;
  objc_msgSend(v38, "setContentHuggingPriority:forAxis:", 0, v39);

  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = 1148846080;
  objc_msgSend(v40, "setContentHuggingPriority:forAxis:", 1, v41);

  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v43) = 1148846080;
  objc_msgSend(v42, "setContentCompressionResistancePriority:forAxis:", 0, v43);

  -[HUNameAndIconEditorCell _updateTextFieldInset](self, "_updateTextFieldInset");
  -[HUNameAndIconEditorCell textField](self, "textField");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutMarginsGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v49);

  -[HUNameAndIconEditorCell textField](self, "textField");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v54);

  -[HUNameAndIconEditorCell textField](self, "textField");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell containerView](self, "containerView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addObject:", v59);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v60);
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[HUNameAndIconEditorCell _updateDisabled](self, "_updateDisabled");
  }
}

- (UIFont)textFieldFont
{
  void *v2;
  void *v3;

  -[HUNameAndIconEditorCell textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setTextFieldFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUNameAndIconEditorCell textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setHideIconButton:(BOOL)a3
{
  if (self->_hideIconButton != a3)
  {
    self->_hideIconButton = a3;
    -[HUNameAndIconEditorCell _updateTextFieldInset](self, "_updateTextFieldInset");
  }
}

- (void)_updateTextFieldInset
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
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[HUNameAndIconEditorCell textFieldLeadingConstraint](self, "textFieldLeadingConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUNameAndIconEditorCell textFieldLeadingConstraint](self, "textFieldLeadingConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v6);

  }
  if (-[HUNameAndIconEditorCell hideIconButton](self, "hideIconButton"))
  {
    -[HUNameAndIconEditorCell containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
  }
  else
  {
    -[HUNameAndIconEditorCell iconButton](self, "iconButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUNameAndIconEditorCell hideIconButton](self, "hideIconButton"))
    v9 = 18.0;
  else
    v9 = 12.0;
  -[HUNameAndIconEditorCell textField](self, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell setTextFieldLeadingConstraint:](self, "setTextFieldLeadingConstraint:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[HUNameAndIconEditorCell textFieldLeadingConstraint](self, "textFieldLeadingConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v15);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUNameAndIconEditorCell;
  -[HUNameAndIconEditorCell traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, a3);
}

- (void)_handleIconButtonTap:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HUNameAndIconEditorCell delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HUNameAndIconEditorCell delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nameAndIconEditorCellDidTapIcon:", self);

  }
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
  id v12;

  v3 = a3;
  -[HUNameAndIconEditorCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C78]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D317C8], "displayIconDescriptorFromIconDescriptor:symbolName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUNameAndIconEditorCell _updateDisabled](self, "_updateDisabled");
  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithIconDescriptor:animated:", v8, v3);

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D30F50]))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNameAndIconEditorCell iconButton](self, "iconButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v10);

  }
  else
  {
    -[HUNameAndIconEditorCell iconButton](self, "iconButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", 0);
  }

}

- (void)_updateDisabled
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[HUNameAndIconEditorCell isDisabled](self, "isDisabled"))
  {
    v3 = 0;
  }
  else
  {
    -[HUNameAndIconEditorCell item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "BOOLValue") ^ 1;

  }
  -[HUNameAndIconEditorCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
  -[HUNameAndIconEditorCell iconButton](self, "iconButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  -[HUNameAndIconEditorCell textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  if (-[HUNameAndIconEditorCell isDisabled](self, "isDisabled"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNameAndIconEditorCell textField](self, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  -[HUNameAndIconEditorCell textField](self, "textField");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClearButtonMode:", v3);

}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUNameAndIconEditorCellDelegate)delegate
{
  return (HUNameAndIconEditorCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUIconButton)iconButton
{
  return self->_iconButton;
}

- (void)setIconButton:(id)a3
{
  objc_storeStrong((id *)&self->_iconButton, a3);
}

- (BOOL)hideIconButton
{
  return self->_hideIconButton;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (NSLayoutConstraint)textFieldLeadingConstraint
{
  return self->_textFieldLeadingConstraint;
}

- (void)setTextFieldLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_iconButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
