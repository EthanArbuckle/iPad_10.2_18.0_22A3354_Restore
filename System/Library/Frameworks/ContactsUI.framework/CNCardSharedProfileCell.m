@implementation CNCardSharedProfileCell

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (BOOL)allowsCellSelection
{
  return 0;
}

- (id)constantConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNCardSharedProfileCell;
  -[CNContactCell updateConstraints](&v4, sel_updateConstraints);
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConstraints");

}

- (void)setLabelTextAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabelTextAttributes:", v4);

}

- (void)updateViewsWithCardGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContact:", v5);

  -[CNCardSharedProfileCell snapView](self, "snapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertyItem:", v4);

  -[CNCardSharedProfileCell snapView](self, "snapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[CNCardSharedProfileCell contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

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
  void *v11;
  void *v12;
  void *v13;
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
  id v29;
  _QWORD v30[6];

  v30[4] = *MEMORY[0x1E0C80C00];
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutMarginsGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v7;
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (CNCardSharedProfileCellView)snapView
{
  CNCardSharedProfileCellView *snapView;
  CNCardSharedProfileCellView *v4;
  CNCardSharedProfileCellView *v5;
  void *v6;

  snapView = self->_snapView;
  if (!snapView)
  {
    v4 = objc_alloc_init(CNCardSharedProfileCellView);
    v5 = self->_snapView;
    self->_snapView = v4;

    -[CNCardSharedProfileCellView setTranslatesAutoresizingMaskIntoConstraints:](self->_snapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNCardSharedProfileCell sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView setSharedProfileStateOracle:](self->_snapView, "setSharedProfileStateOracle:", v6);

    -[CNCardSharedProfileCellView setAllowsEditing:](self->_snapView, "setAllowsEditing:", -[CNPropertyCell allowsEditing](self, "allowsEditing"));
    snapView = self->_snapView;
  }
  return snapView;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  void *v5;
  CNSharedProfileStateOracle *v6;

  v6 = (CNSharedProfileStateOracle *)a3;
  if (self->_sharedProfileStateOracle != v6)
  {
    objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
    -[CNCardSharedProfileCell snapView](self, "snapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSharedProfileStateOracle:", v6);

  }
}

- (CNCardSharedProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNCardSharedProfileCell *v4;
  CNCardSharedProfileCell *v5;
  CNCardSharedProfileCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNCardSharedProfileCell;
  v4 = -[CNPropertyCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  CNContact *v8;
  CNContact *contact;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNCardSharedProfileCell;
  -[CNPropertyCell setCardGroupItem:](&v11, sel_setCardGroupItem_, v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[CNCardSharedProfileCell updateViewsWithCardGroupItem:](self, "updateViewsWithCardGroupItem:", v7);
    objc_msgSend(v7, "contact");
    v8 = (CNContact *)objc_claimAutoreleasedReturnValue();
    contact = self->_contact;
    self->_contact = v8;

  }
  else
  {
    -[CNCardSharedProfileCell snapView](self, "snapView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[CNCardSharedProfileCell setSnapView:](self, "setSnapView:", 0);
  }

}

- (void)setSnapView:(id)a3
{
  objc_storeStrong((id *)&self->_snapView, a3);
}

- (void)setAllowsEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[CNCardSharedProfileCell snapView](self, "snapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEditing:", v3);

  v6.receiver = self;
  v6.super_class = (Class)CNCardSharedProfileCell;
  -[CNPropertyCell setAllowsEditing:](&v6, sel_setAllowsEditing_, v3);
}

- (id)constantConstraintsForVerticalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)variableConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)viewDidSelectDisplayPreference:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CNPropertyCell delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyCell:didUpdateItem:withNewValue:", self, v5, v6);

}

- (void)viewDidSelectFallbackAction
{
  id v2;

  -[CNCardSharedProfileCell actionDelegate](self, "actionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAvatarPosterEditor");

}

- (CNCardSharedProfileCellActionDelegate)actionDelegate
{
  return (CNCardSharedProfileCellActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_snapView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
