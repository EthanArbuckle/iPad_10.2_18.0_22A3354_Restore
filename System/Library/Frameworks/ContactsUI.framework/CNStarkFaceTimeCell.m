@implementation CNStarkFaceTimeCell

- (CNStarkFaceTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNStarkFaceTimeCell *v4;
  id v5;
  uint64_t v6;
  UILabel *faceTimeLabel;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CNStarkActionView *actionView;
  void *v13;
  CNStarkFaceTimeCell *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNStarkFaceTimeCell;
  v4 = -[CNContactCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    faceTimeLabel = v4->_faceTimeLabel;
    v4->_faceTimeLabel = (UILabel *)v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_faceTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->_faceTimeLabel, "setTextAlignment:", 4);
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_VIDEO_CONFERENCE"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4->_faceTimeLabel, "setText:", v9);

    -[CNStarkFaceTimeCell contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v4->_faceTimeLabel);

    +[CNStarkActionView propertyTransportButtonWithDelegate:](CNStarkActionView, "propertyTransportButtonWithDelegate:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    actionView = v4->_actionView;
    v4->_actionView = (CNStarkActionView *)v11;

    -[CNStarkActionView setTranslatesAutoresizingMaskIntoConstraints:](v4->_actionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNStarkActionView setActionType:](v4->_actionView, "setActionType:", *MEMORY[0x1E0C965F8]);
    -[CNStarkActionView setEnabled:](v4->_actionView, "setEnabled:", 0);
    -[CNStarkFaceTimeCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_actionView);

    v14 = v4;
  }

  return v4;
}

- (void)_cnui_applyContactStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[CNUIColorRepository carPlayTableViewCellBackgroundColor](CNUIColorRepository, "carPlayTableViewCellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkFaceTimeCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  +[CNUIColorRepository carPlayTableViewCellTitleTextColor](CNUIColorRepository, "carPlayTableViewCellTitleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkFaceTimeCell faceTimeLabel](self, "faceTimeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor](CNUIColorRepository, "carPlayTableViewCellTitleTextHighlightedColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkFaceTimeCell faceTimeLabel](self, "faceTimeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightedTextColor:", v7);

}

- (id)variableConstraints
{
  return (id)MEMORY[0x1E0C9AA60];
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
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("label");
  -[CNStarkFaceTimeCell faceTimeLabel](self, "faceTimeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = CFSTR("actionView");
  v27[0] = v4;
  -[CNStarkFaceTimeCell actionView](self, "actionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkFaceTimeCell faceTimeLabel](self, "faceTimeLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkFaceTimeCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  -[CNStarkFaceTimeCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNStarkContactPropertyCell minimumContentHeight](CNStarkContactPropertyCell, "minimumContentHeight");
  objc_msgSend(v11, "constraintEqualToConstant:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(64)-[actionView(==36)]-(12)-[label]-(>=12)-|"), 1024, 0, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v14);

  -[CNStarkFaceTimeCell actionView](self, "actionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkFaceTimeCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaLayoutGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CNStarkFaceTimeCell *v7;
  CNStarkFaceTimeCell *v8;
  _BOOL4 v9;
  CNStarkFaceTimeCell *v10;
  _BOOL8 v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNStarkFaceTimeCell;
  -[CNStarkFaceTimeCell didUpdateFocusInContext:withAnimationCoordinator:](&v13, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (CNStarkFaceTimeCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "previouslyFocusedView");
    v8 = (CNStarkFaceTimeCell *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == self;

  }
  objc_msgSend(v6, "nextFocusedView");
  v10 = (CNStarkFaceTimeCell *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = v10 == self;
    -[CNStarkFaceTimeCell actionView](self, "actionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateForFocusedState:", v11);

  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNStarkFaceTimeCell;
  -[CNStarkFaceTimeCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

- (void)performDefaultAction
{
  void *v3;
  id v4;

  -[CNStarkFaceTimeCell delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyCell:performActionForItem:withTransportType:", self, v3, 1);

}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (BOOL)shouldShowStar
{
  return 0;
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)labelTextAttributes
{
  return self->_labelTextAttributes;
}

- (void)setLabelTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (UILabel)faceTimeLabel
{
  return self->_faceTimeLabel;
}

- (void)setFaceTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeLabel, a3);
}

- (CNStarkActionView)actionView
{
  return self->_actionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_faceTimeLabel, 0);
  objc_storeStrong((id *)&self->_labelTextAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end
