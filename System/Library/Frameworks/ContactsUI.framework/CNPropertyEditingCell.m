@implementation CNPropertyEditingCell

- (CNPropertyEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyEditingCell *v4;
  CNRepeatingGradientSeparatorView *v5;
  uint64_t v6;
  CNRepeatingGradientSeparatorView *vseparator;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNPropertyEditingCell;
  v4 = -[CNPropertyCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = [CNRepeatingGradientSeparatorView alloc];
  v6 = -[CNRepeatingGradientSeparatorView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  vseparator = v4->_vseparator;
  v4->_vseparator = (CNRepeatingGradientSeparatorView *)v6;

  -[CNRepeatingGradientSeparatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_vseparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPropertyEditingCell contentView](v4, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v4->_vseparator);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyEditingCell;
  -[CNContactCell dealloc](&v4, sel_dealloc);
}

- (id)labelView
{
  UIButton *labelButton;
  UIButton *v4;
  UIButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;

  labelButton = self->_labelButton;
  if (!labelButton)
  {
    +[CNPropertyLabelButton propertyLabelButton](CNPropertyLabelButton, "propertyLabelButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_labelButton;
    self->_labelButton = v4;

    LODWORD(v6) = 1112014848;
    -[UIButton setContentHuggingPriority:forAxis:](self->_labelButton, "setContentHuggingPriority:forAxis:", 1, v6);
    v7 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    if (objc_msgSend((id)objc_opt_class(), "wantsChevron"))
    {
      v11 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
      -[CNLabeledCell chevronWidth](self, "chevronWidth");
      if (v11 == 1)
        v8 = v12;
      else
        v10 = v12;
    }
    -[UIButton setTitleEdgeInsets:](self->_labelButton, "setTitleEdgeInsets:", v7, v8, v9, v10);
    -[UIButton addTarget:action:forControlEvents:](self->_labelButton, "addTarget:action:forControlEvents:", self, sel_labelButtonClicked_, 64);
    labelButton = self->_labelButton;
  }
  return labelButton;
}

- (void)labelButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  CNLabelPickerController *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    v7 = [CNLabelPickerController alloc];
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNLabelPickerController initForPropertyItem:](v7, "initForPropertyItem:", v8);

    objc_msgSend(v9, "setDelegate:", self);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
    -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sender:presentViewController:", v12, v10);

  }
}

- (void)updateWithPropertyItem:(id)a3
{
  id v4;
  UIButton *labelButton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNPropertyEditingCell;
  -[CNPropertyCell updateWithPropertyItem:](&v18, sel_updateWithPropertyItem_, v4);
  labelButton = self->_labelButton;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](labelButton, "setTitle:forState:", v7, 0);

  -[UIButton titleLabel](self->_labelButton, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell labelWidth](self, "labelWidth");
  objc_msgSend(v8, "setPreferredMaxLayoutWidth:");

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 > 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageForContactCardChevron");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledCell chevron](self, "chevron");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v15);

    -[CNLabeledCell chevron](self, "chevron");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
  }
  else
  {
    -[CNLabeledCell chevron](self, "chevron");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
  }
  objc_msgSend(v12, "setHidden:", v14);

  if ((objc_msgSend(v4, "isReadonly") & 1) != 0)
    v17 = 0;
  else
    v17 = objc_msgSend(v4, "shouldDisableLabelButton") ^ 1;
  -[UIButton setUserInteractionEnabled:](self->_labelButton, "setUserInteractionEnabled:", v17);
  -[UIButton setEnabled:](self->_labelButton, "setEnabled:", objc_msgSend(v4, "shouldDisableLabelButton") ^ 1);

}

- (void)setValueTextAttributes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;

  v4 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReadonly");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor](CNUIColorRepository, "contactStyleDefaultReadOnlyTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1140]);

    v15.receiver = self;
    v15.super_class = (Class)CNPropertyEditingCell;
    -[CNLabeledCell setValueTextAttributes:](&v15, sel_setValueTextAttributes_, v7);
  }
  else
  {
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "showValueWithLabelStyle");

    if (!v10)
    {
      v13.receiver = self;
      v13.super_class = (Class)CNPropertyEditingCell;
      -[CNLabeledCell setValueTextAttributes:](&v13, sel_setValueTextAttributes_, v4);
      goto LABEL_7;
    }
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1140]);

    v14.receiver = self;
    v14.super_class = (Class)CNPropertyEditingCell;
    -[CNLabeledCell setValueTextAttributes:](&v14, sel_setValueTextAttributes_, v7);
  }

LABEL_7:
}

- (id)valueString
{
  void *v2;
  void *v3;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editingStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)leftValueMargin
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  result = 16.0;
  if (v2)
    return 0.0;
  return result;
}

- (double)minCellHeight
{
  return 44.0;
}

- (double)effectiveLabelWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[CNPropertyCell labelWidth](self, "labelWidth");
  v4 = v3;
  -[UIButton titleEdgeInsets](self->_labelButton, "titleEdgeInsets");
  v6 = v4 + v5;
  -[UIButton titleEdgeInsets](self->_labelButton, "titleEdgeInsets");
  return v6 + v7;
}

- (void)setVseparatorHidden:(BOOL)a3
{
  -[CNRepeatingGradientSeparatorView setHidden:](self->_vseparator, "setHidden:", a3);
}

- (id)constantConstraints
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v21.receiver = self;
  v21.super_class = (Class)CNPropertyEditingCell;
  -[CNLabeledCell constantConstraints](&v21, sel_constantConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyEditingCell labelButton](self, "labelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyEditingCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 5, 0, v8, 17, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3718];
  -[CNLabeledCell valueView](self, "valueView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyEditingCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 6, 0, v12, 18, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  objc_msgSend(v5, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, "setPriority:", v15);

  if (objc_msgSend((id)objc_opt_class(), "wantsChevron"))
  {
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell chevron](self, "chevron");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyEditingCell labelView](self, "labelView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 6, 0, v18, 6, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  return v5;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
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
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
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
  double v47;
  objc_super v49;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v49.receiver = self;
  v49.super_class = (Class)CNPropertyEditingCell;
  -[CNLabeledCell variableConstraints](&v49, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  v6 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyEditingCell labelButton](self, "labelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyEditingCell effectiveLabelWidth](self, "effectiveLabelWidth");
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, 0, 0, 1.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  objc_msgSend(v5, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setPriority:", v11);

  v12 = (void *)MEMORY[0x1E0CB3718];
  if ((_DWORD)v4)
  {
    -[CNLabeledCell valueView](self, "valueView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyEditingCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 5, 0, v14, 17, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    v16 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertyEditingCell labelButton](self, "labelButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyEditingCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 3, 0, v18, 15, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

    if (objc_msgSend((id)objc_opt_class(), "wantsChevron"))
    {
      v20 = (void *)MEMORY[0x1E0CB3718];
      -[CNLabeledCell chevron](self, "chevron");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyEditingCell labelButton](self, "labelButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 10, 0, v22, 10, 1.0, 0.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v23);

    }
    -[CNPropertyEditingCell labelButton](self, "labelButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyCell labelWidth](self, "labelWidth");
    objc_msgSend(v25, "setPreferredMaxLayoutWidth:");

    -[CNPropertyEditingCell labelButton](self, "labelButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1148846080;
    objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 1, v28);

  }
  else
  {
    -[CNPropertyEditingCell vseparator](self, "vseparator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyEditingCell labelButton](self, "labelButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 5, 0, v30, 6, 1.0, 8.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v31);

    v32 = (void *)MEMORY[0x1E0CB3718];
    -[CNLabeledCell valueView](self, "valueView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyEditingCell vseparator](self, "vseparator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyEditingCell leftValueMargin](self, "leftValueMargin");
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 5, 0, v34, 6, 1.0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v36);

    if (objc_msgSend((id)objc_opt_class(), "wantsChevron"))
    {
      v37 = (void *)MEMORY[0x1E0CB3718];
      -[CNLabeledCell chevron](self, "chevron");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyEditingCell contentView](self, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, 10, 0, v39, 10, 1.0, 0.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v40);

    }
    v41 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_labelButton"), self->_labelButton, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_labelButton]|"), 0, 0, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v43);

    v44 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_vseparator"), self->_vseparator, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_vseparator]|"), 0, 0, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v46);

    -[CNLabeledCell valueView](self, "valueView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 1144733696;
    objc_msgSend(v26, "setContentCompressionResistancePriority:forAxis:", 0, v47);
  }

  return v5;
}

- (void)pickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CNPropertyEditingCell_pickerDidCancel___block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v5, "sender:dismissViewController:completionHandler:", self, v4, v6);

}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = a3;
  -[CNPropertyCell delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyCell:didUpdateItem:withNewLabel:", self, v9, v6);

  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__CNPropertyEditingCell_picker_didPickItem___block_invoke;
  v11[3] = &unk_1E204F648;
  v11[4] = self;
  objc_msgSend(v10, "sender:dismissViewController:completionHandler:", self, v7, v11);

}

- (void)picker:(id)a3 didDeleteItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[CNPropertyCell delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyCell:didDeleteLabel:forGroup:", self, v5, v7);

}

- (void)regainFocus
{
  id v2;

  -[CNLabeledCell valueView](self, "valueView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (UIButton)labelButton
{
  return self->_labelButton;
}

- (CNRepeatingGradientSeparatorView)vseparator
{
  return self->_vseparator;
}

- (void)setVseparator:(id)a3
{
  objc_storeStrong((id *)&self->_vseparator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vseparator, 0);
  objc_storeStrong((id *)&self->_labelButton, 0);
}

uint64_t __44__CNPropertyEditingCell_picker_didPickItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

uint64_t __41__CNPropertyEditingCell_pickerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

+ (BOOL)wantsChevron
{
  return 1;
}

+ (BOOL)wantsStandardConstraints
{
  return 0;
}

@end
