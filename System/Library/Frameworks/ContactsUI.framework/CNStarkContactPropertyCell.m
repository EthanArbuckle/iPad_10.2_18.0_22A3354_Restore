@implementation CNStarkContactPropertyCell

- (CNStarkContactPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNStarkContactPropertyCell *v4;
  CNStarkContactPropertyCell *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  CNStarkActionView *actionView1;
  uint64_t v12;
  CNStarkActionView *actionView2;
  CNStarkContactPropertyCell *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNStarkContactPropertyCell;
  v4 = -[CNPropertyPhoneNumberCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNStarkContactPropertyCell setAllowsFocus:](v4, "setAllowsFocus:", 1);
    -[CNPropertySimpleCell labelLabel](v5, "labelLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 4);

    -[CNPropertySimpleCell valueLabel](v5, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 4);

    -[CNPropertySimpleCell labelView](v5, "labelView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 0;
    objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v9);

    +[CNStarkActionView propertyTransportButtonWithDelegate:](CNStarkActionView, "propertyTransportButtonWithDelegate:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    actionView1 = v5->_actionView1;
    v5->_actionView1 = (CNStarkActionView *)v10;

    -[CNStarkActionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionView1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CNStarkActionView propertyTransportButtonWithDelegate:](CNStarkActionView, "propertyTransportButtonWithDelegate:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    actionView2 = v5->_actionView2;
    v5->_actionView2 = (CNStarkActionView *)v12;

    -[CNStarkActionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionView2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = v5;
  }

  return v5;
}

- (void)_cnui_applyContactStyle
{
  id v3;

  +[CNUIColorRepository carPlayTableViewCellBackgroundColor](CNUIColorRepository, "carPlayTableViewCellBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactPropertyCell setBackgroundColor:](self, "setBackgroundColor:", v3);

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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  -[CNPropertySimpleCell labelView](self, "labelView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactPropertyCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "labelViewFirstBaselineAnchorConstraintConstant");
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactPropertyCell setLabelViewFirstBaselineAnchorConstraint:](self, "setLabelViewFirstBaselineAnchorConstraint:", v8);

  -[CNPropertySimpleCell valueView](self, "valueView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstBaselineAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelView](self, "labelView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstBaselineAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "valueLabelFirstBaselineAnchorConstraintConstant");
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactPropertyCell setValueViewFirstBaselineAnchorConstraint:](self, "setValueViewFirstBaselineAnchorConstraint:", v13);

  -[CNPropertySimpleCell valueView](self, "valueView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstBaselineAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactPropertyCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contentViewBottomAnchorConstraintConstant");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactPropertyCell setContentViewBottomAnchorConstraint:](self, "setContentViewBottomAnchorConstraint:", v19);

  -[CNStarkContactPropertyCell labelViewFirstBaselineAnchorConstraint](self, "labelViewFirstBaselineAnchorConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  -[CNStarkContactPropertyCell valueViewFirstBaselineAnchorConstraint](self, "valueViewFirstBaselineAnchorConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v21;
  -[CNPropertySimpleCell valueView](self, "valueView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelView](self, "labelView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  -[CNStarkContactPropertyCell contentViewBottomAnchorConstraint](self, "contentViewBottomAnchorConstraint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("label");
  -[CNPropertySimpleCell labelLabel](self, "labelLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v4;
  v32[1] = CFSTR("value");
  -[CNPropertySimpleCell valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v5;
  v32[2] = CFSTR("actionView1");
  -[CNStarkContactPropertyCell actionView1](self, "actionView1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v6;
  v32[3] = CFSTR("actionView2");
  -[CNStarkContactPropertyCell actionView2](self, "actionView2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkContactPropertyCell actionView2](self, "actionView2");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = CFSTR("H:|-(12)-[actionView2(==36)]-(16)-[actionView1(==36)]-(12)-[label]-(>=12)-|");
  }
  else
  {
    -[CNStarkContactPropertyCell actionView1](self, "actionView1");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_6;
    v11 = CFSTR("H:|-(64)-[actionView1(==36)]-(12)-[label]-(>=12)-|");
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v11, 0, 0, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v14);

LABEL_6:
  -[CNStarkContactPropertyCell actionView1](self, "actionView1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CNStarkContactPropertyCell actionView1](self, "actionView1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactPropertyCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeAreaLayoutGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

  }
  -[CNStarkContactPropertyCell actionView2](self, "actionView2");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CNStarkContactPropertyCell actionView2](self, "actionView2");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactPropertyCell contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeAreaLayoutGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CNStarkContactPropertyCell *v7;
  CNStarkContactPropertyCell *v8;
  _BOOL4 v9;
  CNStarkContactPropertyCell *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNStarkContactPropertyCell;
  -[CNStarkContactPropertyCell didUpdateFocusInContext:withAnimationCoordinator:](&v14, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (CNStarkContactPropertyCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "previouslyFocusedView");
    v8 = (CNStarkContactPropertyCell *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == self;

  }
  objc_msgSend(v6, "nextFocusedView");
  v10 = (CNStarkContactPropertyCell *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = v10 == self;
    -[CNStarkContactPropertyCell actionView1](self, "actionView1");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateForFocusedState:", v11);

    -[CNStarkContactPropertyCell actionView2](self, "actionView2");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateForFocusedState:", v11);

  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactPropertyCell;
  -[CNStarkContactPropertyCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

- (void)performDefaultAction
{
  void *v3;
  void *v4;
  int v5;
  objc_super v6;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v5)
  {
    -[CNStarkContactPropertyCell performActionForMessage](self, "performActionForMessage");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNStarkContactPropertyCell;
    -[CNPropertyCell performDefaultAction](&v6, sel_performDefaultAction);
  }
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (BOOL)supportsValueColorUsesLabelColor
{
  return 0;
}

- (BOOL)shouldShowStar
{
  return 0;
}

- (void)updateTransportButtons
{
  void *v3;
  int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(void *, void *);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if (!-[CNPropertySimpleTransportCell allowsActions](self, "allowsActions"))
    return;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsPhone");

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsIMessage");

  if (!v4)
  {
    if (!v6)
    {
      -[CNStarkContactPropertyCell actionView1](self, "actionView1");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActionType:", 0);

      -[CNStarkContactPropertyCell actionView2](self, "actionView2");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
      goto LABEL_9;
    }
    v9 = *MEMORY[0x1E0C96620];
    -[CNStarkContactPropertyCell actionView1](self, "actionView1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = v10;
    v12 = v9;
LABEL_9:
    objc_msgSend(v10, "setActionType:", v12);

    goto LABEL_10;
  }
  v7 = *MEMORY[0x1E0C965F8];
  -[CNStarkContactPropertyCell actionView1](self, "actionView1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionType:", v7);

  if (v6)
  {
    v9 = *MEMORY[0x1E0C96620];
    -[CNStarkContactPropertyCell actionView2](self, "actionView2");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_10:
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__CNStarkContactPropertyCell_updateTransportButtons__block_invoke;
  v20[3] = &unk_1E204DFE8;
  v20[4] = self;
  v20[5] = &v21;
  v14 = (void (**)(void *, void *))_Block_copy(v20);
  -[CNStarkContactPropertyCell actionView1](self, "actionView1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v15);

  -[CNStarkContactPropertyCell actionView2](self, "actionView2");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v16);

  if (*((_BYTE *)v22 + 24))
  {
    -[CNStarkContactPropertyCell actionView1](self, "actionView1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v4 & v6;
    objc_msgSend(v17, "setEnabled:", v18);

    -[CNStarkContactPropertyCell actionView2](self, "actionView2");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnabled:", v18);

    -[CNStarkContactPropertyCell setAllowsFocus:](self, "setAllowsFocus:", v18 ^ 1);
    -[CNStarkContactPropertyCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

  _Block_object_dispose(&v21, 8);
}

- (void)actionViewTapped:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNStarkContactPropertyCell transportTypeForActionType:](self, "transportTypeForActionType:", v4);

  if (v5)
  {
    if (v5 == 2)
    {
      -[CNStarkContactPropertyCell performActionForMessage](self, "performActionForMessage");
    }
    else
    {
      -[CNPropertyCell delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CNPropertyCell propertyItem](self, "propertyItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "propertyCell:performActionForItem:withTransportType:", self, v6, v5);

    }
  }
}

- (int64_t)transportTypeForActionType:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C96620];
  v10[0] = *MEMORY[0x1E0C965F8];
  v10[1] = v3;
  v11[0] = &unk_1E20D3090;
  v11[1] = &unk_1E20D30A8;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  return v8;
}

- (void)performActionForMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contact");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13D98], "targetForTextWithMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsForContact:discoveringEnvironment:", v12, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__CNStarkContactPropertyCell_performActionForMessage__block_invoke;
  v13[3] = &unk_1E204E010;
  v13[4] = self;
  objc_msgSend(v7, "_cn_firstObjectPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  -[objc_class dashboardEndpoint](getFBSOpenApplicationServiceClass_48469(), "dashboardEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConnectionEndpoint:", v10);

  v11 = (id)objc_msgSend(v8, "performActionWithContext:shouldCurateIfPerformed:", v9, 0);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (CNStarkActionView)actionView1
{
  return self->_actionView1;
}

- (CNStarkActionView)actionView2
{
  return self->_actionView2;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (NSLayoutConstraint)labelViewFirstBaselineAnchorConstraint
{
  return self->_labelViewFirstBaselineAnchorConstraint;
}

- (void)setLabelViewFirstBaselineAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelViewFirstBaselineAnchorConstraint, a3);
}

- (NSLayoutConstraint)valueViewFirstBaselineAnchorConstraint
{
  return self->_valueViewFirstBaselineAnchorConstraint;
}

- (void)setValueViewFirstBaselineAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_valueViewFirstBaselineAnchorConstraint, a3);
}

- (NSLayoutConstraint)contentViewBottomAnchorConstraint
{
  return self->_contentViewBottomAnchorConstraint;
}

- (void)setContentViewBottomAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewBottomAnchorConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_valueViewFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_labelViewFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_actionView2, 0);
  objc_storeStrong((id *)&self->_actionView1, 0);
}

uint64_t __53__CNStarkContactPropertyCell_performActionForMessage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  return v9;
}

void __52__CNStarkContactPropertyCell_updateTransportButtons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "actionType");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v10, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_8;
    }
  }
  objc_msgSend(v10, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_8:
    v8 = v10;
    goto LABEL_9;
  }
  objc_msgSend(v10, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    objc_msgSend(v10, "removeFromSuperview");
    v8 = v10;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_9:

}

+ (BOOL)wantsHorizontalLayout
{
  return 1;
}

+ (double)minimumContentHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "labelViewFirstBaselineAnchorConstraintConstant");
  v4 = v3;
  objc_msgSend(a1, "valueLabelFirstBaselineAnchorConstraintConstant");
  v6 = v4 + v5;
  objc_msgSend(a1, "contentViewBottomAnchorConstraintConstant");
  return v6 - v7;
}

+ (double)labelViewFirstBaselineAnchorConstraintConstant
{
  void *v2;
  double v3;
  double v4;

  +[CNUIFontRepository carPlayTableViewCellTitleFont](CNUIFontRepository, "carPlayTableViewCellTitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 18.0);
  v4 = ceil(v3);

  return v4;
}

+ (double)valueLabelFirstBaselineAnchorConstraintConstant
{
  void *v2;
  double v3;
  double v4;

  +[CNUIFontRepository carPlayTableViewCellTitleFont](CNUIFontRepository, "carPlayTableViewCellTitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 18.0);
  v4 = ceil(v3);

  return v4;
}

+ (double)contentViewBottomAnchorConstraintConstant
{
  void *v2;
  double v3;
  double v4;

  +[CNUIFontRepository carPlayTableViewCellSubtitleFont](CNUIFontRepository, "carPlayTableViewCellSubtitleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", -8.0);
  v4 = ceil(v3);

  return v4;
}

@end
