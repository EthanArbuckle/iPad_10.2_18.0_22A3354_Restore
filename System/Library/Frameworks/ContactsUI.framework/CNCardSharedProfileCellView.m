@implementation CNCardSharedProfileCellView

- (void)setupConstraints
{
  NSArray *v3;
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
  void *v53;
  void *v54;
  void *v55;
  NSArray *constraints;
  NSArray *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSArray *v71;
  _QWORD v72[3];
  _QWORD v73[5];

  v73[4] = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  v3 = (NSArray *)objc_opt_new();
  -[CNCardSharedProfileCellView labelStackView](self, "labelStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView centerYAnchor](self, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v7);

  -[CNCardSharedProfileCellView labelStackView](self, "labelStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v3, "addObject:", v11);

  -[CNCardSharedProfileCellView labelStackView](self, "labelStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v3;
  -[NSArray addObject:](v3, "addObject:", v15);

  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    -[CNCardSharedProfileCellView labelStackView](self, "labelStackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView leadingAnchor](self, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v19);
  }
  else
  {
    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView centerYAnchor](self, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v23);

    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView leadingAnchor](self, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v27);

    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v71, "addObject:", v32);

    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 40.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v71, "addObject:", v35);

    -[CNCardSharedProfileCellView labelStackView](self, "labelStackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v19, 1.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v71, "addObject:", v36);

  }
  -[CNCardSharedProfileCellView menuButton](self, "menuButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView leadingAnchor](self, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v65);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v63;
  -[CNCardSharedProfileCellView menuButton](self, "menuButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView trailingAnchor](self, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v58;
  -[CNCardSharedProfileCellView menuButton](self, "menuButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView topAnchor](self, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v40;
  -[CNCardSharedProfileCellView menuButton](self, "menuButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView bottomAnchor](self, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v71, "addObjectsFromArray:", v45);

  if (-[CNCardSharedProfileCellView shouldShowMenu](self, "shouldShowMenu"))
  {
    -[CNCardSharedProfileCellView chevronImageView](self, "chevronImageView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView labelStackView](self, "labelStackView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v48, 1.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v68;
    -[CNCardSharedProfileCellView chevronImageView](self, "chevronImageView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "centerYAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView centerYAnchor](self, "centerYAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v62);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v49;
    -[CNCardSharedProfileCellView chevronImageView](self, "chevronImageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView trailingAnchor](self, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v71, "addObjectsFromArray:", v54);

    v55 = v70;
  }
  else
  {
    -[CNCardSharedProfileCellView labelStackView](self, "labelStackView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView trailingAnchor](self, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v71, "addObject:", v48);
  }

  constraints = self->_constraints;
  self->_constraints = v71;
  v57 = v71;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v57);
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)updateMenuButton
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (-[CNCardSharedProfileCellView allowsEditing](self, "allowsEditing"))
  {
    v3 = -[CNCardSharedProfileCellView shouldShowMenu](self, "shouldShowMenu");
    -[CNCardSharedProfileCellView menuButton](self, "menuButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsMenuAsPrimaryAction:", v3);

    if (-[CNCardSharedProfileCellView shouldShowMenu](self, "shouldShowMenu"))
    {
      objc_initWeak(&location, self);
      -[CNCardSharedProfileCellView menuButton](self, "menuButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, sel_performFallbackAction, 0x2000);

      -[CNCardSharedProfileCellView menuButton](self, "menuButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __47__CNCardSharedProfileCellView_updateMenuButton__block_invoke;
      v11[3] = &unk_1E204D1C0;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v6, "_setMenuProvider:", v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      -[CNCardSharedProfileCellView menuButton](self, "menuButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setMenuProvider:", 0);

      -[CNCardSharedProfileCellView menuButton](self, "menuButton");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_performFallbackAction, 0x2000);

    }
  }
  else
  {
    -[CNCardSharedProfileCellView menuButton](self, "menuButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, sel_performFallbackAction, 0x2000);

    -[CNCardSharedProfileCellView menuButton](self, "menuButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setMenuProvider:", 0);

  }
}

- (CNCardSharedProfileCellMenuButton)menuButton
{
  return self->_menuButton;
}

- (BOOL)shouldShowMenu
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  void *v14;
  int v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[CNCardSharedProfileCellView allowsEditing](self, "allowsEditing"))
  {
    -[CNCardSharedProfileCellView contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "sharedPhotoDisplayPreference"))
    {
      -[CNCardSharedProfileCellView contact](self, "contact");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "sharedPhotoDisplayPreference") == 3;

    }
    else
    {
      v5 = 1;
    }

    -[CNCardSharedProfileCellView contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sharedPhotoDisplayPreference");

    if (v5)
    {
      -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "currentNicknameHasValidVisualIdentityData");

      CNUILogContactCard();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        return v6;
      }
      v16 = 67109120;
      v17 = v6;
      v11 = "Contact has a current shared photo: %d";
    }
    else
    {
      if (v8 != 2)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
      -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend((id)v12, "currentNicknameHasValidVisualIdentityData");

      -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v14, "pendingNicknameHasValidVisualIdentityData");

      v6 = v13 | v12;
      CNUILogContactCard();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v16 = 67109120;
      v17 = v6;
      v11 = "Contact has current or pending shared photo: %d";
    }
    _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v16, 8u);
    goto LABEL_13;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)updateConstraints
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNCardSharedProfileCellView;
  -[CNCardSharedProfileCellView updateConstraints](&v7, sel_updateConstraints);
  v3 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  -[CNCardSharedProfileCellView avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if ((_DWORD)v3 != v5)
  {
    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

    -[CNCardSharedProfileCellView setupConstraints](self, "setupConstraints");
  }
}

- (void)setLabelTextAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CNCardSharedProfileCellView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "font");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 != v10)
    {
      -[CNCardSharedProfileCellView titleLabel](self, "titleLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v10);

    }
    -[CNCardSharedProfileCellView valueLabel](self, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      -[CNCardSharedProfileCellView valueLabel](self, "valueLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v10);

    }
  }

}

- (void)setPropertyItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNPropertyGroupItem *v9;

  v9 = (CNPropertyGroupItem *)a3;
  if (self->_propertyItem != v9)
  {
    objc_storeStrong((id *)&self->_propertyItem, a3);
    -[CNPropertyGroupItem displayValue](v9, "displayValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView valueLabel](self, "valueLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[CNCardSharedProfileCellView avatarView](self, "avatarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem contact](v9, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContact:", v8);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNCardSharedProfileCellView)init
{
  CNCardSharedProfileCellView *v2;
  CNCardSharedProfileCellView *v3;
  CNCardSharedProfileCellView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNCardSharedProfileCellView;
  v2 = -[CNCardSharedProfileCellView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[CNCardSharedProfileCellView setupViews](v2, "setupViews");
    -[CNCardSharedProfileCellView setupConstraints](v3, "setupConstraints");
    -[CNCardSharedProfileCellView startObservingAvatarCacheInvalidation](v3, "startObservingAvatarCacheInvalidation");
    v4 = v3;
  }

  return v3;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  CNSharedProfileStateOracle *v5;
  void *v6;
  void *v7;
  void *v8;
  CNSharedProfileStateOracle *v9;

  v5 = (CNSharedProfileStateOracle *)a3;
  if (self->_sharedProfileStateOracle != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
    -[CNCardSharedProfileCellView setUpChevronAndMenuIfNeeded](self, "setUpChevronAndMenuIfNeeded");
    -[CNCardSharedProfileCellView propertyItem](self, "propertyItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView valueLabel](self, "valueLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    v5 = v9;
  }

}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setUpChevronAndMenuIfNeeded
{
  id v3;

  -[CNCardSharedProfileCellView updateMenuButton](self, "updateMenuButton");
  if (-[CNCardSharedProfileCellView shouldShowMenu](self, "shouldShowMenu"))
  {
    -[CNCardSharedProfileCellView setUpChevron](self, "setUpChevron");
    -[CNCardSharedProfileCellView setupConstraints](self, "setupConstraints");
  }
  else
  {
    -[CNCardSharedProfileCellView chevronImageView](self, "chevronImageView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (CNPropertyGroupItem)propertyItem
{
  return self->_propertyItem;
}

- (void)startObservingAvatarCacheInvalidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachingLikenessRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE082E38))
    v5 = v4;
  else
    v5 = 0;
  v7 = v5;

  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addDelegate:", self);
    v6 = v7;
  }

}

- (void)setupViews
{
  -[CNCardSharedProfileCellView setUpAvatarView](self, "setUpAvatarView");
  -[CNCardSharedProfileCellView setUpLabels](self, "setUpLabels");
  -[CNCardSharedProfileCellView setUpMenuButton](self, "setUpMenuButton");
  -[CNCardSharedProfileCellView setUpChevronAndMenuIfNeeded](self, "setUpChevronAndMenuIfNeeded");
}

- (void)setUpMenuButton
{
  void *v3;
  CNCardSharedProfileCellMenuButton *v4;
  id v5;

  -[CNCardSharedProfileCellView menuButton](self, "menuButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(CNCardSharedProfileCellMenuButton);
    -[CNCardSharedProfileCellMenuButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNCardSharedProfileCellView setMenuButton:](self, "setMenuButton:", v4);

  }
  -[CNCardSharedProfileCellView menuButton](self, "menuButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView addSubview:](self, "addSubview:", v5);

}

- (void)setUpLabels
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_CONTACT_CARD_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  v6 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v7);

  -[CNCardSharedProfileCellView addSubview:](self, "addSubview:", v3);
  -[CNCardSharedProfileCellView setTitleLabel:](self, "setTitleLabel:", v3);
  v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setText:", &stru_1E20507A8);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v10);

  -[CNCardSharedProfileCellView addSubview:](self, "addSubview:", v8);
  -[CNCardSharedProfileCellView setValueLabel:](self, "setValueLabel:", v8);
  v11 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[CNCardSharedProfileCellView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  -[CNCardSharedProfileCellView valueLabel](self, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithArrangedSubviews:", v14);

  objc_msgSend(v15, "setAxis:", 1);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNCardSharedProfileCellView addSubview:](self, "addSubview:", v15);
  -[CNCardSharedProfileCellView setLabelStackView:](self, "setLabelStackView:", v15);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void)setUpAvatarView
{
  CNAvatarView *v3;

  v3 = objc_alloc_init(CNAvatarView);
  -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNCardSharedProfileCellView addSubview:](self, "addSubview:", v3);
  -[CNCardSharedProfileCellView setAvatarView:](self, "setAvatarView:", v3);

}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_menuButton, a3);
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_propertyItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setAllowsEditing:(BOOL)a3
{
  if (self->_allowsEditing != a3)
  {
    self->_allowsEditing = a3;
    -[CNCardSharedProfileCellView updateMenuButton](self, "updateMenuButton");
  }
}

- (void)setUpChevron
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[CNCardSharedProfileCellView chevronImageView](self, "chevronImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageForContactCardMenuChevron");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v6);

    if (-[CNCardSharedProfileCellView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)v7 = 7;
    else
      v7 = 8;
    objc_msgSend(v5, "setContentMode:", v7);
    -[CNCardSharedProfileCellView setChevronImageView:](self, "setChevronImageView:", v5);

  }
  -[CNCardSharedProfileCellView chevronImageView](self, "chevronImageView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView addSubview:](self, "addSubview:", v8);

}

- (int64_t)sharedPhotoDisplayPreference
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;

  objc_opt_class();
  -[CNCardSharedProfileCellView propertyItem](self, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "sharedPhotoDisplayPreference");
  return v6;
}

- (void)performFallbackAction
{
  id v2;

  -[CNCardSharedProfileCellView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewDidSelectFallbackAction");

}

- (id)menuActions
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  -[CNCardSharedProfileCellView sharedMenu](self, "sharedMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_addNonNilObject:", v4);

  -[CNCardSharedProfileCellView customMenu](self, "customMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_addNonNilObject:", v5);

  return v3;
}

- (id)sharedMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableActionTypesForEffectiveState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
    goto LABEL_14;
  v9 = v8;
  v10 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if (objc_msgSend(v12, "isEqualToNumber:", &unk_1E20D2D60, (_QWORD)v19))
      {
        -[CNCardSharedProfileCellView updateAction](self, "updateAction");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToNumber:", &unk_1E20D2D78))
          continue;
        -[CNCardSharedProfileCellView revertToPreviousAction](self, "revertToPreviousAction");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v13;
      objc_msgSend(v6, "_cn_addNonNilObject:", v13);

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v9);
LABEL_14:

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0DC39D0];
    -[CNCardSharedProfileCellView sharedMenuTitle](self, "sharedMenuTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "menuWithTitle:image:identifier:options:children:", v18, 0, 0, 1, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)customMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableActionTypesForEffectiveState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "isEqualToNumber:", &unk_1E20D2D90, (_QWORD)v15))
        {
          -[CNCardSharedProfileCellView revertToCustomAction](self, "revertToCustomAction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "_cn_addNonNilObject:", v12);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E20507A8, 0, 0, 1, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)updateAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveStateForContactIsAutoUpdate");

  -[CNCardSharedProfileCellView avatarImageForActionType:](self, "avatarImageForActionType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_UPDATE_MENU_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_ALWAYS_UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSharedProfileUpdateMenuElement elementWithTitle:subtitle:avatarImage:selected:](CNSharedProfileUpdateMenuElement, "elementWithTitle:subtitle:avatarImage:selected:", v7, v9, v5, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__CNCardSharedProfileCellView_updateAction__block_invoke;
  v12[3] = &unk_1E2048E50;
  v12[4] = self;
  objc_msgSend(v10, "setPrimaryActionHandler:", v12);

  return v10;
}

- (id)revertToPreviousAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[CNCardSharedProfileCellView avatarImageForActionType:](self, "avatarImageForActionType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_REVERT_TO_PREVIOUS_MENU_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_ASK_FOR_UPDATES"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSharedProfileUpdateMenuElement elementWithTitle:subtitle:avatarImage:selected:](CNSharedProfileUpdateMenuElement, "elementWithTitle:subtitle:avatarImage:selected:", v5, v7, v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__CNCardSharedProfileCellView_revertToPreviousAction__block_invoke;
  v10[3] = &unk_1E2048E50;
  v10[4] = self;
  objc_msgSend(v8, "setPrimaryActionHandler:", v10);

  return v8;
}

- (id)revertToCustomAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveStateForContact");

  -[CNCardSharedProfileCellView avatarImageForActionType:](self, "avatarImageForActionType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_REVERT_TO_CUSTOM_MENU_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_ASK_FOR_UPDATES"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSharedProfileUpdateMenuElement elementWithTitle:subtitle:avatarImage:selected:](CNSharedProfileUpdateMenuElement, "elementWithTitle:subtitle:avatarImage:selected:", v7, v9, v5, v4 == 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__CNCardSharedProfileCellView_revertToCustomAction__block_invoke;
  v12[3] = &unk_1E2048E50;
  v12[4] = self;
  objc_msgSend(v10, "setPrimaryActionHandler:", v12);

  return v10;
}

- (id)sharedMenuTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_SHARED_MENU_TITLE_%@"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView contactDisplayName](self, "contactDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contactDisplayName
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v3, "setStyle:", 1000);
  objc_msgSend(v3, "setFallbackStyle:", -1);
  -[CNCardSharedProfileCellView contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromContact:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E20507A8;
  v7 = v6;

  return v7;
}

- (id)avatarImageForActionType:(unint64_t)a3
{
  void *v5;
  CNAvatarImageRenderer *v6;
  void *v7;
  CNAvatarImageRenderer *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  double v12;
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
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[CNCardSharedProfileCellView avatarImageRenderer](self, "avatarImageRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [CNAvatarImageRenderer alloc];
    +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNAvatarImageRenderer initWithSettings:](v6, "initWithSettings:", v7);
    -[CNCardSharedProfileCellView setAvatarImageRenderer:](self, "setAvatarImageRenderer:", v8);

    -[CNCardSharedProfileCellView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "layoutDirection") == 1;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v10, 0, 20.0, 20.0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardSharedProfileCellView setRenderingScope:](self, "setRenderingScope:", v13);

  }
  -[CNCardSharedProfileCellView contact](self, "contact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "targetProfileForActionType:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "thumbnailImageData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImageData:", v18);

  objc_msgSend(v17, "thumbnailImageData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setThumbnailImageData:", v19);

  -[CNCardSharedProfileCellView avatarImageRenderer](self, "avatarImageRenderer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileCellView renderingScope](self, "renderingScope");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "avatarImageForContacts:scope:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)invalidateAvatarCacheEntriesForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  if (v3)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachingLikenessRenderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &unk_1EE082E38;
    if (objc_msgSend(v5, "conformsToProtocol:", v6))
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      dispatch_get_global_queue(25, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __70__CNCardSharedProfileCellView_invalidateAvatarCacheEntriesForContact___block_invoke;
      v10[3] = &unk_1E2050400;
      v11 = v8;
      v12 = v3;
      dispatch_async(v9, v10);

    }
  }

}

- (void)avatarCacheDidUpdateForIdentifiers:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void (*v9)(uint64_t);
  uint64_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = -[CNCardSharedProfileCellView actionToPerformUponCacheInvalidation](self, "actionToPerformUponCacheInvalidation", a3);
  if (v4 == 1)
  {
    -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "updateContactAndNicknamesForActionType:error:", 1, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;

    if (v6)
    {
      v17 = MEMORY[0x1E0C809B0];
      v9 = __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_61;
      v10 = &v17;
LABEL_12:
      v10[1] = 3221225472;
      v10[2] = (uint64_t)v9;
      v10[3] = (uint64_t)&unk_1E204F648;
      v10[4] = (uint64_t)self;
      dispatch_async(MEMORY[0x1E0C80D38], v10);

      goto LABEL_13;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    v14 = "Failed to update contact for Revert to Previous action: %@";
LABEL_20:
    _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    goto LABEL_17;
  }
  if (v4 == 3)
  {
    -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v12, "updateContactAndNicknamesForActionType:error:", 3, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;

    if (v6)
    {
      v15 = MEMORY[0x1E0C809B0];
      v9 = __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_62;
      v10 = &v15;
      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    v14 = "Error updating contact for update action type: %@";
    goto LABEL_20;
  }
  if (v4 != 2)
  {
LABEL_13:
    -[CNCardSharedProfileCellView setActionToPerformUponCacheInvalidation:](self, "setActionToPerformUponCacheInvalidation:", 0, v15);
    return;
  }
  -[CNCardSharedProfileCellView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "updateContactAndNicknamesForActionType:error:", 2, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Failed to update contact for Revert to Custom action: %@", buf, 0xCu);
    }

    v19 = MEMORY[0x1E0C809B0];
    v9 = __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke;
    v10 = &v19;
    goto LABEL_12;
  }
LABEL_18:

}

- (CNCardSharedProfileCellViewDelegate)delegate
{
  return (CNCardSharedProfileCellViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (CNAvatarImageRenderer)avatarImageRenderer
{
  return self->_avatarImageRenderer;
}

- (void)setAvatarImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageRenderer, a3);
}

- (CNAvatarImageRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setRenderingScope:(id)a3
{
  objc_storeStrong((id *)&self->_renderingScope, a3);
}

- (unint64_t)actionToPerformUponCacheInvalidation
{
  return self->_actionToPerformUponCacheInvalidation;
}

- (void)setActionToPerformUponCacheInvalidation:(unint64_t)a3
{
  self->_actionToPerformUponCacheInvalidation = a3;
}

void __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewDidSelectDisplayPreference:", 2);

}

void __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_61(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewDidSelectDisplayPreference:", 2);

}

void __66__CNCardSharedProfileCellView_avatarCacheDidUpdateForIdentifiers___block_invoke_62(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewDidSelectDisplayPreference:", 1);

}

void __70__CNCardSharedProfileCellView_invalidateAvatarCacheEntriesForContact___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateContactsWithIdentifiers:", v3);

}

void __51__CNCardSharedProfileCellView_revertToCustomAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setActionToPerformUponCacheInvalidation:", 2);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sharedProfileStateOracle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAvatarCacheEntriesForContact:", v3);

}

void __53__CNCardSharedProfileCellView_revertToPreviousAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setActionToPerformUponCacheInvalidation:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sharedProfileStateOracle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAvatarCacheEntriesForContact:", v3);

}

void __43__CNCardSharedProfileCellView_updateAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setActionToPerformUponCacheInvalidation:", 3);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sharedProfileStateOracle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAvatarCacheEntriesForContact:", v3);

}

id __47__CNCardSharedProfileCellView_updateMenuButton__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(WeakRetained, "menuActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuWithChildren:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)log
{
  if (log_cn_once_token_1_9776 != -1)
    dispatch_once(&log_cn_once_token_1_9776, &__block_literal_global_9777);
  return (id)log_cn_once_object_1_9778;
}

void __34__CNCardSharedProfileCellView_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNCardSharedProfileCellContentView");
  v1 = (void *)log_cn_once_object_1_9778;
  log_cn_once_object_1_9778 = (uint64_t)v0;

}

@end
