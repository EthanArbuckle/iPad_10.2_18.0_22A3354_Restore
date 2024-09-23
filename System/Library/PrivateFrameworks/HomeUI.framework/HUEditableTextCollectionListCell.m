@implementation HUEditableTextCollectionListCell

- (HUEditableTextCollectionListCell)initWithFrame:(CGRect)a3
{
  HUEditableTextCollectionListCell *v3;
  UITextField *v4;
  UITextField *textField;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HUEditableTextCollectionListCell;
  v3 = -[HUEditableTextCollectionListCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UITextField *)objc_alloc_init(MEMORY[0x1E0CEAAD0]);
    textField = v3->_textField;
    v3->_textField = v4;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell textField](v3, "textField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    -[HUEditableTextCollectionListCell textField](v3, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);

    -[HUEditableTextCollectionListCell textField](v3, "textField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReturnKeyType:", 9);

    -[HUEditableTextCollectionListCell textField](v3, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClearButtonMode:", 3);

    -[HUEditableTextCollectionListCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell textField](v3, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    v13 = objc_alloc(MEMORY[0x1E0CEA720]);
    -[HUEditableTextCollectionListCell defaultContentConfiguration](v3, "defaultContentConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithConfiguration:", v14);
    -[HUEditableTextCollectionListCell setListContentView:](v3, "setListContentView:", v15);

    -[HUEditableTextCollectionListCell listContentView](v3, "listContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    -[HUEditableTextCollectionListCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell listContentView](v3, "listContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUEditableTextCollectionListCell;
  -[HUEditableTextCollectionListCell prepareForReuse](&v10, sel_prepareForReuse);
  -[HUEditableTextCollectionListCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HUEditableTextCollectionListCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", 0);

  -[HUEditableTextCollectionListCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[HUEditableTextCollectionListCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[HUEditableTextCollectionListCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endEditing:", 1);

  -[HUEditableTextCollectionListCell textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setContentConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  v15 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v15;
  else
    v5 = 0;
  v6 = v5;

  -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v6);

  objc_msgSend(v6, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  -[HUEditableTextCollectionListCell textField](self, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "setHidden:", 1);

    -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
  }
  else
  {
    objc_msgSend(v10, "setHidden:", 0);

    -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
  }
  objc_msgSend(v12, "setHidden:", v14);

  -[HUEditableTextCollectionListCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = !a3;
  -[HUEditableTextCollectionListCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditableTextCollectionListCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[HUEditableTextCollectionListCell textField](self, "textField");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClearButtonMode:", v4);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUEditableTextCollectionListCell;
  -[HUEditableTextCollectionListCell setSelected:](&v8, sel_setSelected_);
  if (v3)
  {
    -[HUEditableTextCollectionListCell textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
  -[HUEditableTextCollectionListCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

  -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v3 ^ 1);

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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)HUEditableTextCollectionListCell;
  -[HUEditableTextCollectionListCell updateConstraints](&v59, sel_updateConstraints);
  -[HUEditableTextCollectionListCell textFieldConstraints](self, "textFieldConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell textField](self, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUEditableTextCollectionListCell textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    -[HUEditableTextCollectionListCell textField](self, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

    -[HUEditableTextCollectionListCell textField](self, "textField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    -[HUEditableTextCollectionListCell textField](self, "textField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    -[HUEditableTextCollectionListCell setTextFieldConstraints:](self, "setTextFieldConstraints:", v4);
  }
  -[HUEditableTextCollectionListCell listContentViewConstraints](self, "listContentViewConstraints");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell leadingAnchor](self, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v36);

    -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v41);

    -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v46);

    -[HUEditableTextCollectionListCell listContentView](self, "listContentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCollectionListCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v51);

    -[HUEditableTextCollectionListCell setListContentViewConstraints:](self, "setListContentViewConstraints:", v31);
  }
  -[HUEditableTextCollectionListCell textField](self, "textField");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "isHidden");

  v54 = (void *)MEMORY[0x1E0CB3718];
  -[HUEditableTextCollectionListCell textFieldConstraints](self, "textFieldConstraints");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend(v54, "deactivateConstraints:", v55);

    v56 = (void *)MEMORY[0x1E0CB3718];
    -[HUEditableTextCollectionListCell listContentViewConstraints](self, "listContentViewConstraints");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "activateConstraints:", v57);
  }
  else
  {
    objc_msgSend(v54, "activateConstraints:", v55);

    v58 = (void *)MEMORY[0x1E0CB3718];
    -[HUEditableTextCollectionListCell listContentViewConstraints](self, "listContentViewConstraints");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "deactivateConstraints:", v57);
  }

}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
  objc_storeStrong((id *)&self->_listContentView, a3);
}

- (NSArray)textFieldConstraints
{
  return self->_textFieldConstraints;
}

- (void)setTextFieldConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldConstraints, a3);
}

- (NSArray)listContentViewConstraints
{
  return self->_listContentViewConstraints;
}

- (void)setListContentViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_listContentViewConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listContentViewConstraints, 0);
  objc_storeStrong((id *)&self->_textFieldConstraints, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
