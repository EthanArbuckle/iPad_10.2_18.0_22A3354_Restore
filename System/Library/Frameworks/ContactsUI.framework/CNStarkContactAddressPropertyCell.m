@implementation CNStarkContactAddressPropertyCell

- (CNStarkContactAddressPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNStarkContactAddressPropertyCell *v4;
  CNStarkContactAddressPropertyCell *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  CNStarkActionView *actionView;
  void *v12;
  CNStarkContactAddressPropertyCell *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CNStarkContactAddressPropertyCell;
  v4 = -[CNPropertyPostalAddressCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNPropertySimpleCell labelLabel](v4, "labelLabel");
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
    actionView = v5->_actionView;
    v5->_actionView = (CNStarkActionView *)v10;

    -[CNStarkActionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNStarkActionView setActionType:](v5->_actionView, "setActionType:", *MEMORY[0x1E0C96608]);
    -[CNStarkActionView setEnabled:](v5->_actionView, "setEnabled:", 0);
    -[CNStarkContactAddressPropertyCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_actionView);

    v13 = v5;
  }

  return v5;
}

- (void)_cnui_applyContactStyle
{
  id v3;

  +[CNUIColorRepository carPlayTableViewCellBackgroundColor](CNUIColorRepository, "carPlayTableViewCellBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactAddressPropertyCell setBackgroundColor:](self, "setBackgroundColor:", v3);

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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = CFSTR("label");
  -[CNPropertySimpleCell labelLabel](self, "labelLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v3;
  v47[1] = CFSTR("actionView");
  -[CNStarkContactAddressPropertyCell actionView](self, "actionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertySimpleCell labelView](self, "labelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstBaselineAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactAddressPropertyCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNStarkContactPropertyCell labelViewFirstBaselineAnchorConstraintConstant](CNStarkContactPropertyCell, "labelViewFirstBaselineAnchorConstraintConstant");
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactAddressPropertyCell setLabelViewFirstBaselineAnchorConstraint:](self, "setLabelViewFirstBaselineAnchorConstraint:", v10);

  -[CNPropertySimpleCell valueView](self, "valueView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstBaselineAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelView](self, "labelView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstBaselineAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNStarkContactPropertyCell valueLabelFirstBaselineAnchorConstraintConstant](CNStarkContactPropertyCell, "valueLabelFirstBaselineAnchorConstraintConstant");
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactAddressPropertyCell setValueViewFirstBaselineAnchorConstraint:](self, "setValueViewFirstBaselineAnchorConstraint:", v15);

  -[CNPropertySimpleCell valueView](self, "valueView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastBaselineAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactAddressPropertyCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNStarkContactPropertyCell contentViewBottomAnchorConstraintConstant](CNStarkContactPropertyCell, "contentViewBottomAnchorConstraintConstant");
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactAddressPropertyCell setContentViewBottomAnchorConstraint:](self, "setContentViewBottomAnchorConstraint:", v21);

  -[CNStarkContactAddressPropertyCell labelViewFirstBaselineAnchorConstraint](self, "labelViewFirstBaselineAnchorConstraint");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v43;
  -[CNStarkContactAddressPropertyCell valueViewFirstBaselineAnchorConstraint](self, "valueViewFirstBaselineAnchorConstraint");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v42;
  -[CNStarkContactAddressPropertyCell contentViewBottomAnchorConstraint](self, "contentViewBottomAnchorConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v41;
  -[CNPropertySimpleCell valueView](self, "valueView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelView](self, "labelView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v23;
  -[CNPropertySimpleCell valueView](self, "valueView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleCell labelView](self, "labelView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObjectsFromArray:", v29);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(64)-[actionView(==36)]-(12)-[label]-(>=12)-|"), 0, 0, v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObjectsFromArray:", v30);

  -[CNStarkContactAddressPropertyCell actionView](self, "actionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactAddressPropertyCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v35, 4.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObject:", v36);

  return v44;
}

- (id)variableConstraints
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CNStarkContactAddressPropertyCell *v7;
  CNStarkContactAddressPropertyCell *v8;
  _BOOL4 v9;
  CNStarkContactAddressPropertyCell *v10;
  _BOOL8 v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNStarkContactAddressPropertyCell;
  -[CNStarkContactAddressPropertyCell didUpdateFocusInContext:withAnimationCoordinator:](&v13, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (CNStarkContactAddressPropertyCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "previouslyFocusedView");
    v8 = (CNStarkContactAddressPropertyCell *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == self;

  }
  objc_msgSend(v6, "nextFocusedView");
  v10 = (CNStarkContactAddressPropertyCell *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = v10 == self;
    -[CNStarkContactAddressPropertyCell actionView](self, "actionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateForFocusedState:", v11);

  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactAddressPropertyCell;
  -[CNStarkContactAddressPropertyCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (BOOL)supportsValueColorUsesLabelColor
{
  return 0;
}

- (void)performDefaultAction
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

  objc_msgSend(MEMORY[0x1E0D13D98], "targetForDirections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsForContact:discoveringEnvironment:", v12, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__CNStarkContactAddressPropertyCell_performDefaultAction__block_invoke;
  v13[3] = &unk_1E204E010;
  v13[4] = self;
  objc_msgSend(v7, "_cn_firstObjectPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  -[objc_class dashboardEndpoint](getFBSOpenApplicationServiceClass_47172(), "dashboardEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConnectionEndpoint:", v10);

  v11 = (id)objc_msgSend(v8, "performActionWithContext:shouldCurateIfPerformed:", v9, 0);
}

- (BOOL)shouldShowStar
{
  return 0;
}

- (CNStarkActionView)actionView
{
  return self->_actionView;
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
  objc_storeStrong((id *)&self->_actionView, 0);
}

uint64_t __57__CNStarkContactAddressPropertyCell_performDefaultAction__block_invoke(uint64_t a1, void *a2)
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

@end
