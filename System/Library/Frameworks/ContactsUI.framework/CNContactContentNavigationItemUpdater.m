@implementation CNContactContentNavigationItemUpdater

- (void)updateBackButtonForPlatterStyleForController:(id)a3 mode:(int64_t)a4 platterBackBarButtonItem:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v6 = a6;
  v13[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  objc_msgSend(a3, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 5 && !v11)
  {
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItems:animated:", v12, v6);

  }
}

- (id)updateEditingNavigationItemForController:(id)a3 actionTarget:(id)a4 isInSheet:(BOOL)a5 isShowingNavBar:(BOOL)a6 shouldUsePlatterStyle:(BOOL)a7 isUpdatingContact:(BOOL)a8 hasChanges:(BOOL)a9 animated:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v16 = a4;
  v17 = a3;
  -[CNContactContentNavigationItemUpdater customEditItemTitleForIsUpdatingContact:](self, "customEditItemTitleForIsUpdatingContact:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v21) = __PAIR16__(a10, a9);
  -[CNContactContentNavigationItemUpdater updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:customEditButtonTitle:hasChanges:animated:](self, "updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:customEditButtonTitle:hasChanges:animated:", v17, v16, v13, v12, v11, v18, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)updateEditingNavigationItemForController:(id)a3 actionTarget:(id)a4 isInSheet:(BOOL)a5 isShowingNavBar:(BOOL)a6 shouldUsePlatterStyle:(BOOL)a7 customEditButtonTitle:(id)a8 hasChanges:(BOOL)a9 animated:(BOOL)a10
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  CNContactContentNavigationItemUpdaterResult *v18;
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
  CNContactContentNavigationItemUpdater *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  CNContactContentNavigationItemUpdater *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  CNContactContentNavigationItemUpdaterResult *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  _QWORD v53[2];

  v51 = a7;
  v11 = a5;
  v53[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  objc_msgSend(v14, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(CNContactContentNavigationItemUpdaterResult);
  -[CNContactContentNavigationItemUpdater preEditLeftBarButtonItems](self, "preEditLeftBarButtonItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(v17, "leftBarButtonItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_cn_filter:", &__block_literal_global_6488);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      v22 = v21;
    else
      v22 = (void *)MEMORY[0x1E0C9AA60];
    -[CNContactContentNavigationItemUpdater setPreEditLeftBarButtonItems:](self, "setPreEditLeftBarButtonItems:", v22);

  }
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v15, sel_editCancel_);
  v53[0] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentNavigationItemUpdaterResult setEnableCancelShortcut:](v18, "setEnableCancelShortcut:", 1);
  -[CNContactContentNavigationItemUpdater updateEditDoneButtonForController:customEditButtonTitle:hasChanges:](self, "updateEditDoneButtonForController:customEditButtonTitle:hasChanges:", v14, v16, a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v24;
  -[CNContactContentNavigationItemUpdaterResult setEnableSaveShortcut:](v18, "setEnableSaveShortcut:", objc_msgSend(v24, "enableSaveShortcut"));
  objc_msgSend(v14, "editButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEditing") & 1) == 0)
    objc_msgSend(v14, "setEditing:", 1);
  objc_msgSend(v25, "setTarget:", v15);
  objc_msgSend(v25, "setAction:", sel_toggleEditing_);
  if (!v25)
  {
    v26 = 0;
    if (!v11)
      goto LABEL_31;
LABEL_12:
    objc_msgSend(v17, "rightBarButtonItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leftBarButtonItems");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentNavigationItemUpdater extraRightBarButtonItems](self, "extraRightBarButtonItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      if (objc_msgSend(v27, "count"))
      {
        v29 = self;
        v30 = v27;
      }
      else
      {
        v30 = (void *)MEMORY[0x1E0C9AA60];
        v29 = self;
      }
      -[CNContactContentNavigationItemUpdater setExtraRightBarButtonItems:](v29, "setExtraRightBarButtonItems:", v30);
    }
    -[CNContactContentNavigationItemUpdater extraRightBarButtonItems](self, "extraRightBarButtonItems", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      v32 = objc_msgSend(v26, "count");

      if (v32)
        goto LABEL_21;
      -[CNContactContentNavigationItemUpdater extraRightBarButtonItems](self, "extraRightBarButtonItems");
      v31 = v26;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    -[CNContactContentNavigationItemUpdater extraLeftBarButtonItems](self, "extraLeftBarButtonItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      if (objc_msgSend(v47, "count"))
      {
        v34 = self;
        v35 = v47;
      }
      else
      {
        v35 = (id)MEMORY[0x1E0C9AA60];
        v34 = self;
      }
      -[CNContactContentNavigationItemUpdater setExtraLeftBarButtonItems:](v34, "setExtraLeftBarButtonItems:", v35);
    }
    -[CNContactContentNavigationItemUpdater extraLeftBarButtonItems](self, "extraLeftBarButtonItems");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "count"))
    {
      v37 = objc_msgSend(v23, "count");

      if (v37)
      {
LABEL_30:

        goto LABEL_31;
      }
      -[CNContactContentNavigationItemUpdater extraLeftBarButtonItems](self, "extraLeftBarButtonItems");
      v36 = v23;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_30;
  }
  v52 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_12;
LABEL_31:
  v48 = v18;
  if (v23)
    objc_msgSend(v17, "setLeftBarButtonItems:animated:", v23, a10);
  v38 = (uint64_t *)MEMORY[0x1E0D137F8];
  if (v51)
  {
    v39 = *MEMORY[0x1E0D137F8];
    objc_msgSend(v17, "leftBarButtonItems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v39) = (*(uint64_t (**)(uint64_t, void *))(v39 + 16))(v39, v40);

    if ((v39 & 1) == 0)
    {
      objc_msgSend(v17, "leftBarButtonItems");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentNavigationItemUpdater applyPlatterStyleToBarButtonItems:navItemController:isEditing:](self, "applyPlatterStyleToBarButtonItems:navItemController:isEditing:", v41, v14, 1);

    }
  }
  if (v26)
    objc_msgSend(v17, "setRightBarButtonItems:animated:", v26, a10);
  if (v51)
  {
    v42 = *v38;
    objc_msgSend(v17, "rightBarButtonItems");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v42) = (*(uint64_t (**)(uint64_t, void *))(v42 + 16))(v42, v43);

    if ((v42 & 1) == 0)
    {
      objc_msgSend(v17, "rightBarButtonItems");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentNavigationItemUpdater applyPlatterStyleToBarButtonItems:navItemController:isEditing:](self, "applyPlatterStyleToBarButtonItems:navItemController:isEditing:", v44, v14, 1);

    }
  }

  return v48;
}

- (id)updateEditDoneButtonForController:(id)a3 isUpdatingContact:(BOOL)a4 hasChanges:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[CNContactContentNavigationItemUpdater customEditItemTitleForIsUpdatingContact:](self, "customEditItemTitleForIsUpdatingContact:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentNavigationItemUpdater updateEditDoneButtonForController:customEditButtonTitle:hasChanges:](self, "updateEditDoneButtonForController:customEditButtonTitle:hasChanges:", v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)updateEditDoneButtonForController:(id)a3 customEditButtonTitle:(id)a4 hasChanges:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CNContactContentNavigationItemUpdaterResult *v9;
  void *v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(CNContactContentNavigationItemUpdaterResult);
  objc_msgSend(v8, "editButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEnabled:", v5);
  if (v7)
    objc_msgSend(v10, "setTitle:", v7);
  -[CNContactContentNavigationItemUpdaterResult setEnableSaveShortcut:](v9, "setEnableSaveShortcut:", v5);

  return v9;
}

- (id)customEditItemTitleForIsUpdatingContact:(BOOL)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)updateDisplayNavigationItemsForController:(id)a3 mode:(int64_t)a4 actionTarget:(id)a5 allowsEditing:(BOOL)a6 editRequiresAuthorization:(BOOL)a7 isInSheet:(BOOL)a8 isShowingNavBar:(BOOL)a9 shouldShowBackButton:(BOOL)a10 shouldUsePlatterStyle:(BOOL)a11 platterBackBarButtonItem:(id)a12 animated:(BOOL)a13
{
  return -[CNContactContentNavigationItemUpdater updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editButtonEnabled:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:](self, "updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editButtonEnabled:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:", a3, a4, a5, a6, 1, a8);
}

- (id)updateDisplayNavigationItemsForController:(id)a3 mode:(int64_t)a4 actionTarget:(id)a5 allowsEditing:(BOOL)a6 editButtonEnabled:(BOOL)a7 isInSheet:(BOOL)a8 isShowingNavBar:(BOOL)a9 shouldShowBackButton:(BOOL)a10 shouldUsePlatterStyle:(BOOL)a11 platterBackBarButtonItem:(id)a12 animated:(BOOL)a13
{
  _BOOL8 v13;
  _BOOL4 v14;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  CNContactContentNavigationItemUpdater *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  CNContactContentNavigationItemUpdater *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  _BOOL4 v73;
  void *v74;
  CNContactContentNavigationItemUpdaterResult *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  _QWORD v82[2];

  v73 = a8;
  v13 = a7;
  v14 = a6;
  v82[1] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a5;
  v20 = a12;
  v75 = objc_alloc_init(CNContactContentNavigationItemUpdaterResult);
  v21 = v18;
  objc_msgSend(v21, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v74 = v20;
  if (!v14)
  {
    if (a4 == 5)
    {
      objc_msgSend(v21, "editButtonItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setStyle:", 2);

      objc_msgSend(v21, "editButtonItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTarget:", v19);

      objc_msgSend(v21, "editButtonItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAction:", sel_updateContact_);

      CNContactsUIBundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "editButtonItem");
      v33 = v19;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTitle:", v32);

      objc_msgSend(v21, "editButtonItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      CNContactsUIBundle();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("REVIEW"), &stru_1E20507A8, CFSTR("Localized"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitle:", v38);

      v19 = v33;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v33, sel_editCancel_);
      v78 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentNavigationItemUpdaterResult setEnableCancelShortcut:](v75, "setEnableCancelShortcut:", 1);
      -[CNContactContentNavigationItemUpdaterResult setEnableEditShortcut:](v75, "setEnableEditShortcut:", 1);
LABEL_7:

      goto LABEL_52;
    }
    v40 = v19;
    objc_msgSend(v22, "rightBarButtonItems");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "editButtonItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42 == v43)
      v36 = (void *)MEMORY[0x1E0C9AA60];
    else
      v36 = 0;
    -[CNContactContentNavigationItemUpdaterResult setEnableCancelShortcut:](v75, "setEnableCancelShortcut:", 0);
    -[CNContactContentNavigationItemUpdaterResult setEnableEditShortcut:](v75, "setEnableEditShortcut:", 0);
    objc_msgSend(v23, "backBarButtonItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v23, "backBarButtonItem");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v40;
    }
    else
    {
      v19 = v40;
      if (v20 && a11 && a10)
      {
        v76 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
        if (a11 && !a10)
        {
          objc_msgSend(v23, "leftBarButtonItems");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_cn_filter:", &__block_literal_global_32);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
      }
    }
LABEL_52:
    if (v73)
      goto LABEL_29;
    goto LABEL_53;
  }
  objc_msgSend(v22, "backBarButtonItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v23, "backBarButtonItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v27 = (void *)v26;

    goto LABEL_24;
  }
  if (v20 && a11 && a10)
  {
    v81 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v46 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v27 = (void *)v46;
    goto LABEL_24;
  }
  -[CNContactContentNavigationItemUpdater preEditLeftBarButtonItems](self, "preEditLeftBarButtonItems");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[CNContactContentNavigationItemUpdater preEditLeftBarButtonItems](self, "preEditLeftBarButtonItems");
    v46 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v27 = 0;
  if (a11 && !a10)
  {
    objc_msgSend(v23, "leftBarButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_cn_filter:", &__block_literal_global_27);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_24:
  -[CNContactContentNavigationItemUpdater setPreEditLeftBarButtonItems:](self, "setPreEditLeftBarButtonItems:", 0);
  objc_msgSend(v21, "editButtonItem");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setEnabled:", v13);

  -[CNContactContentNavigationItemUpdaterResult setEnableEditShortcut:](v75, "setEnableEditShortcut:", v13);
  if (objc_msgSend(v21, "isEditing"))
    objc_msgSend(v21, "setEditing:", 0);
  objc_msgSend(v21, "editButtonItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTarget:", v19);

  objc_msgSend(v21, "editButtonItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setAction:", sel_toggleEditing_);

  objc_msgSend(v21, "editButtonItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v21, "editButtonItem");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v73)
  {
LABEL_29:
    v52 = v19;
    objc_msgSend(v23, "rightBarButtonItems");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftBarButtonItems");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentNavigationItemUpdater extraRightBarButtonItems](self, "extraRightBarButtonItems");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
    {
      if (objc_msgSend(v53, "count"))
      {
        v56 = self;
        v57 = v53;
      }
      else
      {
        v57 = (void *)MEMORY[0x1E0C9AA60];
        v56 = self;
      }
      -[CNContactContentNavigationItemUpdater setExtraRightBarButtonItems:](v56, "setExtraRightBarButtonItems:", v57);
    }
    -[CNContactContentNavigationItemUpdater extraRightBarButtonItems](self, "extraRightBarButtonItems");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "count"))
    {
      v59 = objc_msgSend(v36, "count");

      if (v59)
        goto LABEL_38;
      -[CNContactContentNavigationItemUpdater extraRightBarButtonItems](self, "extraRightBarButtonItems");
      v58 = v36;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_38:
    -[CNContactContentNavigationItemUpdater extraLeftBarButtonItems](self, "extraLeftBarButtonItems");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v60)
    {
      if (objc_msgSend(v54, "count"))
      {
        v61 = self;
        v62 = v54;
      }
      else
      {
        v62 = (void *)MEMORY[0x1E0C9AA60];
        v61 = self;
      }
      -[CNContactContentNavigationItemUpdater setExtraLeftBarButtonItems:](v61, "setExtraLeftBarButtonItems:", v62);
    }
    -[CNContactContentNavigationItemUpdater extraLeftBarButtonItems](self, "extraLeftBarButtonItems");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "count"))
    {
      v64 = objc_msgSend(v27, "count");

      if (v64)
        goto LABEL_47;
      -[CNContactContentNavigationItemUpdater extraLeftBarButtonItems](self, "extraLeftBarButtonItems");
      v63 = v27;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_47:
    v19 = v52;
    if (!v27)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_53:
  if (v27)
LABEL_54:
    objc_msgSend(v23, "setLeftBarButtonItems:animated:", v27, a13);
LABEL_55:
  v65 = (uint64_t *)MEMORY[0x1E0D137F8];
  if (a11)
  {
    v66 = *MEMORY[0x1E0D137F8];
    objc_msgSend(v23, "leftBarButtonItems");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v66) = (*(uint64_t (**)(uint64_t, void *))(v66 + 16))(v66, v67);

    if ((v66 & 1) == 0)
    {
      objc_msgSend(v23, "leftBarButtonItems");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentNavigationItemUpdater applyPlatterStyleToBarButtonItems:navItemController:isEditing:](self, "applyPlatterStyleToBarButtonItems:navItemController:isEditing:", v68, v21, 0);

    }
  }
  if (v36)
    objc_msgSend(v23, "setRightBarButtonItems:animated:", v36, a13);
  if (a11)
  {
    v69 = *v65;
    objc_msgSend(v23, "rightBarButtonItems");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v69) = (*(uint64_t (**)(uint64_t, void *))(v69 + 16))(v69, v70);

    if ((v69 & 1) == 0)
    {
      objc_msgSend(v23, "rightBarButtonItems");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentNavigationItemUpdater applyPlatterStyleToBarButtonItems:navItemController:isEditing:](self, "applyPlatterStyleToBarButtonItems:navItemController:isEditing:", v71, v21, 0);

    }
  }

  return v75;
}

- (void)updateDisplayDoneButtonForController:(id)a3 allowsEditing:(BOOL)a4 viewMode:(int64_t)a5 editRequiresAuthorization:(BOOL)a6
{
  -[CNContactContentNavigationItemUpdater updateDisplayDoneButtonForController:allowsEditing:viewMode:editButtonEnabled:](self, "updateDisplayDoneButtonForController:allowsEditing:viewMode:editButtonEnabled:", a3, a4, a5, 1);
}

- (void)updateDisplayDoneButtonForController:(id)a3 allowsEditing:(BOOL)a4 viewMode:(int64_t)a5 editButtonEnabled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  if (v8)
  {
    v15 = v9;
    objc_msgSend(v9, "editButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", v6);
LABEL_5:

    v9 = v15;
    goto LABEL_6;
  }
  if (a5 == 5)
  {
    v15 = v9;
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "editButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REVIEW"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v14);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)applyPlatterStyleToBarButtonItems:(id)a3 navItemController:(id)a4 isEditing:(BOOL)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (a5)
          -[CNContactContentNavigationItemUpdater transparentPlatterImage](self, "transparentPlatterImage");
        else
          -[CNContactContentNavigationItemUpdater buttonPlatterImage](self, "buttonPlatterImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundImage:forState:barMetrics:", v13, 0, 0);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (id)buttonPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "cnui_roundedNavButtonPlatterImage");
}

- (id)transparentPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageNamed:", CFSTR("transparent-image"));
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, a3);
}

- (NSArray)extraLeftBarButtonItems
{
  return self->_extraLeftBarButtonItems;
}

- (void)setExtraLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, a3);
}

- (NSArray)extraRightBarButtonItems
{
  return self->_extraRightBarButtonItems;
}

- (void)setExtraRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
}

BOOL __236__CNContactContentNavigationItemUpdater_updateDisplayNavigationItemsForController_mode_actionTarget_allowsEditing_editButtonEnabled_isInSheet_isShowingNavBar_shouldShowBackButton_shouldUsePlatterStyle_platterBackBarButtonItem_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __236__CNContactContentNavigationItemUpdater_updateDisplayNavigationItemsForController_mode_actionTarget_allowsEditing_editButtonEnabled_isInSheet_isShowingNavBar_shouldShowBackButton_shouldUsePlatterStyle_platterBackBarButtonItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __185__CNContactContentNavigationItemUpdater_updateEditingNavigationItemForController_actionTarget_isInSheet_isShowingNavBar_shouldUsePlatterStyle_customEditButtonTitle_hasChanges_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end
