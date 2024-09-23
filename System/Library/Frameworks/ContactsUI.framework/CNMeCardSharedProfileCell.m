@implementation CNMeCardSharedProfileCell

- (CNMeCardSharedProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNMeCardSharedProfileCell *v4;
  CNMeCardSharedProfileCell *v5;
  void *v6;
  CNMeCardSharedProfileCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNMeCardSharedProfileCell;
  v4 = -[CNLabeledCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNMeCardSharedProfileCell setUpView](v4, "setUpView");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_nicknameStoreDidChange, *MEMORY[0x1E0C97080], 0);

    v7 = v5;
  }

  return v5;
}

- (void)setUpView
{
  void *v3;
  void *v4;
  id v5;

  -[CNMeCardSharedProfileCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[CNMeCardSharedProfileCell setAccessoryType:](self, "setAccessoryType:", 1);
  +[CNUIColorRepository contactCardDisclosureAccessoryTintColor](CNUIColorRepository, "contactCardDisclosureAccessoryTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCell _setAccessoryTintColor:](self, "_setAccessoryTintColor:", v5);

}

- (void)updateViews
{
  id v2;

  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateView");

}

- (CNMeCardSharedProfileCellContentView)meCardSharedProfileContentView
{
  CNMeCardSharedProfileCellContentView *meCardSharedProfileContentView;
  CNMeCardSharedProfileCellContentView *v4;
  CNMeCardSharedProfileCellContentView *v5;

  meCardSharedProfileContentView = self->_meCardSharedProfileContentView;
  if (!meCardSharedProfileContentView)
  {
    v4 = objc_alloc_init(CNMeCardSharedProfileCellContentView);
    v5 = self->_meCardSharedProfileContentView;
    self->_meCardSharedProfileContentView = v4;

    -[CNMeCardSharedProfileCellContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_meCardSharedProfileContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    meCardSharedProfileContentView = self->_meCardSharedProfileContentView;
  }
  return meCardSharedProfileContentView;
}

- (void)setMeContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMeContact:", v4);

}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharedProfileCell;
  -[CNContactCell updateConstraints](&v4, sel_updateConstraints);
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConstraints");

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
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutMarginsGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v7;
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharedProfileCell contentView](self, "contentView");
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

- (id)constantConstraintsForVerticalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)constantConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)variableConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setLabelTextAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNMeCardSharedProfileCell meCardSharedProfileContentView](self, "meCardSharedProfileContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabelTextAttributes:", v4);

}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)performDefaultAction
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_opt_class();
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "sharedProfileSettingsAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSharedProfileSettingsActionDelegate:", self);

  objc_msgSend(v5, "sharedProfileSettingsAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "performActionWithSender:", self);
}

- (void)setMeCardSharedProfileContentView:(id)a3
{
  objc_storeStrong((id *)&self->_meCardSharedProfileContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCardSharedProfileContentView, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
