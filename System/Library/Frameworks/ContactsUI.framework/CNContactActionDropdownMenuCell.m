@implementation CNContactActionDropdownMenuCell

- (void)setMenuProvider:(id)a3
{
  void *v5;
  id menuProvider;
  void *v7;
  void *v8;
  id v9;

  if (self->_menuProvider != a3)
  {
    v5 = _Block_copy(a3);
    menuProvider = self->_menuProvider;
    self->_menuProvider = v5;

    -[CNContactActionDropdownMenuCell menuProvider](self, "menuProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setMenuProvider:", v7);

    -[CNContactActionDropdownMenuCell button](self, "button");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", a3 == 0);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactActionDropdownMenuCell;
  -[CNContactCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CNContactActionDropdownMenuCell setMenuProvider:](self, "setMenuProvider:", 0);
  -[CNContactActionDropdownMenuCell button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (UIContextMenuInteraction)contextMenuInteraction
{
  void *v2;
  void *v3;

  -[CNContactActionDropdownMenuCell button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextMenuInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIContextMenuInteraction *)v3;
}

- (CNContactActionDropdownMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNContactActionDropdownMenuCell *v4;
  CNContactActionDropdownMenuButton *v5;
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
  CNContactActionDropdownMenuCell *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)CNContactActionDropdownMenuCell;
  v4 = -[CNLabeledCell initWithStyle:reuseIdentifier:](&v33, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(CNContactActionDropdownMenuButton);
    -[CNContactActionDropdownMenuCell setButton:](v4, "setButton:", v5);

    -[CNContactActionDropdownMenuCell button](v4, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNContactActionDropdownMenuCell button](v4, "button");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsMenuAsPrimaryAction:", 1);

    -[CNContactActionDropdownMenuCell menuProvider](v4, "menuProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell button](v4, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setMenuProvider:", v8);

    -[CNContactActionDropdownMenuCell menuProvider](v4, "menuProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell button](v4, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v10 == 0);

    -[CNContactActionDropdownMenuCell button](v4, "button");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell addSubview:](v4, "addSubview:", v12);

    v25 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactActionDropdownMenuCell button](v4, "button");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leftAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell leftAnchor](v4, "leftAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v29;
    -[CNContactActionDropdownMenuCell button](v4, "button");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell rightAnchor](v4, "rightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v24;
    -[CNContactActionDropdownMenuCell button](v4, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell topAnchor](v4, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v16;
    -[CNContactActionDropdownMenuCell button](v4, "button");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionDropdownMenuCell bottomAnchor](v4, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v21);

    v22 = v4;
  }

  return v4;
}

- (CNContactActionDropdownMenuButton)button
{
  return self->_button;
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_menuProvider, 0);
}

@end
