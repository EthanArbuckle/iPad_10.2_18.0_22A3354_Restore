@implementation CNContactCardFieldPicker

- (CNContactCardFieldPicker)initWithContacts:(id)a3
{
  return -[CNContactCardFieldPicker initWithContacts:isNameDropSession:fieldSelections:](self, "initWithContacts:isNameDropSession:fieldSelections:", a3, 0, 0);
}

- (CNContactCardFieldPicker)initWithContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CNContactCardFieldPicker *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNContactCardFieldPicker initWithContacts:](self, "initWithContacts:", v6, v9, v10);
  return v7;
}

- (CNContactCardFieldPicker)initWithNameDrop:(id)a3 fieldSelections:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CNContactCardFieldPicker *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNContactCardFieldPicker initWithContacts:isNameDropSession:fieldSelections:](self, "initWithContacts:isNameDropSession:fieldSelections:", v9, 1, v7, v12, v13);
  return v10;
}

- (CNContactCardFieldPicker)initWithContacts:(id)a3 isNameDropSession:(BOOL)a4 fieldSelections:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  CNContactCardFieldPicker *v11;
  CNContactCardFieldPicker *v12;
  CNContactCardFieldPickerDataSource *v13;
  CNContactCardFieldPickerDataSource *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  CNContactCardFieldPickerDataSource *fieldPickerDataSource;
  uint64_t v19;
  CNContactCardFieldPickerDataSource *v20;
  CNContactCardFieldPicker *v21;
  objc_super v23;
  _QWORD v24[4];

  v6 = a4;
  v24[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CNContactCardFieldPicker;
  v11 = -[CNContactCardFieldPicker init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contacts, a3);
    v12->_isNameDropSession = v6;
    v13 = [CNContactCardFieldPickerDataSource alloc];
    v14 = v13;
    if (v6)
    {
      v15 = *MEMORY[0x1E0C966D0];
      v24[0] = *MEMORY[0x1E0C96708];
      v24[1] = v15;
      v24[2] = *MEMORY[0x1E0C966C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CNContactCardFieldPickerDataSource initWithContacts:hiddenProperties:](v14, "initWithContacts:hiddenProperties:", v9, v16);
      fieldPickerDataSource = v12->_fieldPickerDataSource;
      v12->_fieldPickerDataSource = (CNContactCardFieldPickerDataSource *)v17;

    }
    else
    {
      v19 = -[CNContactCardFieldPickerDataSource initWithContacts:](v13, "initWithContacts:", v9);
      v20 = v12->_fieldPickerDataSource;
      v12->_fieldPickerDataSource = (CNContactCardFieldPickerDataSource *)v19;

      v12->_shouldSelectDefaultFieldKeys = 1;
    }
    v12->_shouldSelectDefaultIndividualFields = v10 != 0;
    objc_storeStrong((id *)&v12->_defaultFieldSelections, a5);
    v21 = v12;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNContactCardFieldPicker;
  -[CNContactCardFieldPicker viewDidLoad](&v11, sel_viewDidLoad);
  +[CNUIColorRepository groupsInsetBackgroundColor](CNUIColorRepository, "groupsInsetBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (-[CNContactCardFieldPicker isNameDropSession](self, "isNameDropSession"))
  {
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_BOOP_CONTACT_FIELDS_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactCardFieldPicker navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_SELECTED_FIELDS_SHEET_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactCardFieldPicker contacts](self, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v6, objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactCardFieldPicker navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

  }
  -[CNContactCardFieldPicker setUpTableView](self, "setUpTableView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactCardFieldPicker;
  -[CNContactCardFieldPicker viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNContactCardFieldPicker setUpDoneButton](self, "setUpDoneButton");
  if (!-[CNContactCardFieldPicker isNameDropSession](self, "isNameDropSession"))
    -[CNContactCardFieldPicker setUpToggleSelectAllFieldsButton](self, "setUpToggleSelectAllFieldsButton");
  if (-[CNContactCardFieldPicker shouldSelectDefaultFieldKeys](self, "shouldSelectDefaultFieldKeys"))
  {
    -[CNContactCardFieldPicker selectDefaultFieldKeys](self, "selectDefaultFieldKeys");
    -[CNContactCardFieldPicker setShouldSelectDefaultFieldKeys:](self, "setShouldSelectDefaultFieldKeys:", 0);
  }
  if (-[CNContactCardFieldPicker shouldSelectDefaultIndividualFields](self, "shouldSelectDefaultIndividualFields"))
  {
    -[CNContactCardFieldPicker selectDefaultFields](self, "selectDefaultFields");
    -[CNContactCardFieldPicker setShouldSelectDefaultIndividualFields:](self, "setShouldSelectDefaultIndividualFields:", 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactCardFieldPicker;
  -[CNContactCardFieldPicker viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CNContactCardFieldPicker saveFilteredContacts](self, "saveFilteredContacts");
}

- (void)setUpTableView
{
  id v3;
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
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[CNContactCardFieldPicker view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2);
  -[CNContactCardFieldPicker setTableView:](self, "setTableView:", v5);

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[CNContactCardFieldPicker fieldPickerDataSource](self, "fieldPickerDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:", v7);

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsMultipleSelection:", 1);

  +[CNUIColorRepository groupsInsetBackgroundColor](CNUIColorRepository, "groupsInsetBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSectionFooterHeight:", 0.0);

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("contactCardFieldPickerCell"));

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("contactCardFieldPickerPhotoCell"));

  -[CNContactCardFieldPicker view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v34;
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v29;
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v20;
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v27);
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)setUpToggleSelectAllFieldsButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[CNContactCardFieldPicker toggleSelectAllFieldsButton](self, "toggleSelectAllFieldsButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactCardFieldPicker updateControllerButtons](self, "updateControllerButtons");
  }
  else
  {
    -[CNContactCardFieldPicker titleForSelectAllFieldsButton](self, "titleForSelectAllFieldsButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v4, 0, self, sel_toggleSelectionOfFields_);
    -[CNContactCardFieldPicker setToggleSelectAllFieldsButton:](self, "setToggleSelectAllFieldsButton:", v5);

  }
  objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker toggleSelectAllFieldsButton](self, "toggleSelectAllFieldsButton", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPicker setToolbarItems:](self, "setToolbarItems:", v8);

  -[CNContactCardFieldPicker navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToolbarHidden:", 0);

}

- (void)setUpDoneButton
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
  {
    v4 = -[CNContactCardFieldPicker isInActivityController](self, "isInActivityController");

    if (v4)
    {
      v5 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[CNContactCardFieldPicker navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
    -[CNContactCardFieldPicker navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  v5 = 0;
LABEL_8:
  -[CNContactCardFieldPicker navigationItem](self, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v5);

}

- (BOOL)isInActivityController
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNContactCardFieldPicker navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (void)done:(id)a3
{
  -[CNContactCardFieldPicker dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)saveFilteredContacts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  if (!-[CNContactCardFieldPicker isNameDropSession](self, "isNameDropSession")
    || -[CNContactCardFieldPicker isAnyHandleSelected](self, "isAnyHandleSelected"))
  {
    -[CNContactCardFieldPicker contacts](self, "contacts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    -[CNContactCardFieldPicker contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__CNContactCardFieldPicker_saveFilteredContacts__block_invoke;
    v8[3] = &unk_1E204A140;
    v8[4] = self;
    v8[5] = v4;
    objc_msgSend(v5, "_cn_map:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactCardFieldPicker delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactCardFieldPicker:didFinishWithContacts:", self, v6);

  }
}

- (void)toggleSelectionOfFields:(id)a3
{
  if (-[CNContactCardFieldPicker allFieldsSelected](self, "allFieldsSelected", a3))
    -[CNContactCardFieldPicker deselectAllFields](self, "deselectAllFields");
  else
    -[CNContactCardFieldPicker selectAllFields](self, "selectAllFields");
}

- (void)selectDefaultFieldKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  -[CNContactCardFieldPicker contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactCardFieldPicker privateCardPropertiesForContacts:](CNContactCardFieldPicker, "privateCardPropertiesForContacts:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  if (v5 >= 1)
  {
    v6 = 0;
    v25 = *MEMORY[0x1E0C96708];
    v24 = *MEMORY[0x1E0C966D0];
    v23 = *MEMORY[0x1E0C966C0];
    v22 = *MEMORY[0x1E0C967D8];
    v7 = *MEMORY[0x1E0C967E0];
    v8 = *MEMORY[0x1E0C967D0];
    while (1)
    {
      -[CNContactCardFieldPicker tableView](self, "tableView", v22, v23, v24, v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfRowsInSection:", v6);

      if (v10 >= 1)
        break;
LABEL_11:
      ++v6;
      -[CNContactCardFieldPicker tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "numberOfSections");

      if (v6 >= v21)
        goto LABEL_12;
    }
    v11 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactCardFieldPicker fieldPickerDataSource](self, "fieldPickerDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "keyForIndexPath:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[CNContactCardFieldPicker isNameDropSession](self, "isNameDropSession"))
        break;
      if ((objc_msgSend(v26, "containsObject:", v14) & 1) == 0)
        goto LABEL_9;
LABEL_10:

      ++v11;
      -[CNContactCardFieldPicker tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "numberOfRowsInSection:", v6);

      if (v11 >= v19)
        goto LABEL_11;
    }
    v27[0] = v25;
    v27[1] = v24;
    v27[2] = v23;
    v27[3] = v22;
    v27[4] = v7;
    v27[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_10;
LABEL_9:
    -[CNContactCardFieldPicker tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectRowAtIndexPath:animated:scrollPosition:", v12, 0, 0);

    goto LABEL_10;
  }
LABEL_12:
  if (!-[CNContactCardFieldPicker isNameDropSession](self, "isNameDropSession"))
    -[CNContactCardFieldPicker updateControllerButtons](self, "updateControllerButtons");

}

- (BOOL)selectRowForKey:(id)a3 value:(id)a4 atIndex:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  -[CNContactCardFieldPicker defaultFieldSelections](self, "defaultFieldSelections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isProperty:value:inContact:", v10, v9, v12);

  if (v13)
  {
    -[CNContactCardFieldPicker tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectRowAtIndexPath:animated:scrollPosition:", v8, 0, 0);

  }
  return v13;
}

- (void)selectDefaultFields
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  CNContactCardFieldPicker *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  -[CNContactCardFieldPicker defaultFieldSelections](self, "defaultFieldSelections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactCardFieldPicker tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSections");

    if (v5 >= 1)
    {
      v6 = 0;
      v24 = *MEMORY[0x1E0C96670];
      v23 = (void *)*MEMORY[0x1E0C967A8];
      while (1)
      {
        -[CNContactCardFieldPicker tableView](self, "tableView", v23);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "numberOfRowsInSection:", v6);

        if (v8 >= 1)
          break;
LABEL_12:
        ++v6;
        -[CNContactCardFieldPicker tableView](self, "tableView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "numberOfSections");

        if (v6 >= v22)
          return;
      }
      v9 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactCardFieldPicker fieldPickerDataSource](self, "fieldPickerDataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "groupItemForIndexPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "property");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("birthdays"));
        objc_msgSend(v12, "labeledValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = self;
        if (!v14)
          break;
        v17 = -[CNContactCardFieldPicker selectRowForKey:value:atIndex:](self, "selectRowForKey:value:atIndex:", v24, v15, v10);

        if (!v17)
        {
          objc_msgSend(v12, "labeledValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = self;
          v18 = v23;
LABEL_10:
          -[CNContactCardFieldPicker selectRowForKey:value:atIndex:](v16, "selectRowForKey:value:atIndex:", v18, v15, v10);

        }
        ++v9;
        -[CNContactCardFieldPicker tableView](self, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "numberOfRowsInSection:", v6);

        if (v9 >= v20)
          goto LABEL_12;
      }
      v18 = v13;
      goto LABEL_10;
    }
  }
}

- (void)selectAllFields
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 >= 1)
  {
    v5 = 0;
    do
    {
      -[CNContactCardFieldPicker tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "numberOfRowsInSection:", v5);

      if (v7 >= 1)
      {
        v8 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactCardFieldPicker tableView](self, "tableView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "selectRowAtIndexPath:animated:scrollPosition:", v9, 0, 0);

          ++v8;
          -[CNContactCardFieldPicker tableView](self, "tableView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "numberOfRowsInSection:", v5);

        }
        while (v8 < v12);
      }
      ++v5;
      -[CNContactCardFieldPicker tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfSections");

    }
    while (v5 < v14);
  }
  -[CNContactCardFieldPicker updateControllerButtons](self, "updateControllerButtons");
}

- (void)deselectAllFields
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNContactCardFieldPicker tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[CNContactCardFieldPicker tableView](self, "tableView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v9, 1);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[CNContactCardFieldPicker updateControllerButtons](self, "updateControllerButtons");
}

- (void)updateControllerButtons
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (-[CNContactCardFieldPicker isNameDropSession](self, "isNameDropSession"))
  {
    v3 = -[CNContactCardFieldPicker isAnyHandleSelected](self, "isAnyHandleSelected");
    -[CNContactCardFieldPicker navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);
  }
  else
  {
    -[CNContactCardFieldPicker titleForSelectAllFieldsButton](self, "titleForSelectAllFieldsButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactCardFieldPicker toggleSelectAllFieldsButton](self, "toggleSelectAllFieldsButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);
  }

}

- (BOOL)isAnyHandleSelected
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CNContactCardFieldPicker tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = *MEMORY[0x1E0C966A8];
    v9 = *MEMORY[0x1E0C967C0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[CNContactCardFieldPicker fieldPickerDataSource](self, "fieldPickerDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "keyForIndexPath:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v23[0] = v8;
        v23[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if ((v15 & 1) != 0)
        {
          v16 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)titleForSelectAllFieldsButton
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CNContactCardFieldPicker allFieldsSelected](self, "allFieldsSelected");
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("DESELECT_ALL_FIELDS_BUTTON_TITLE");
  else
    v5 = CFSTR("SELECT_ALL_FIELDS_BUTTON_TITLE");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)allFieldsSelected
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[CNContactCardFieldPicker tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[CNContactCardFieldPicker fieldPickerDataSource](self, "fieldPickerDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v5 == objc_msgSend(v6, "totalItemCount");

  return v5;
}

- (void)setPhotoFromContact:(id)a3 onFilteredContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[CNContactCardFieldPicker imageProperties](CNContactCardFieldPicker, "imageProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactCardFieldPicker fieldPickerDataSource](self, "fieldPickerDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstContactContainingPhoto");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "prepareCellWithContact:", v7);
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;

  v6 = a3;
  v7 = a4;
  -[CNContactCardFieldPicker fieldPickerDataSource](self, "fieldPickerDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "section");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("contactCardFieldPickerPhotoSection"));

  if (v13
    && (-[CNContactCardFieldPicker contacts](self, "contacts"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "count"),
        v14,
        v15 == 1))
  {
    +[CNContactCardFieldPickerCell estimatedHeightDisplayingValue:](CNContactCardFieldPickerCell, "estimatedHeightDisplayingValue:", 1);
  }
  else
  {
    objc_msgSend(v6, "rowHeight");
  }
  v17 = v16;

  return v17;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (CNContactCardFieldPickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (CNContactCardFieldPickerDataSource)fieldPickerDataSource
{
  return self->_fieldPickerDataSource;
}

- (void)setFieldPickerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_fieldPickerDataSource, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIBarButtonItem)toggleSelectAllFieldsButton
{
  return self->_toggleSelectAllFieldsButton;
}

- (void)setToggleSelectAllFieldsButton:(id)a3
{
  objc_storeStrong((id *)&self->_toggleSelectAllFieldsButton, a3);
}

- (BOOL)shouldSelectDefaultFieldKeys
{
  return self->_shouldSelectDefaultFieldKeys;
}

- (void)setShouldSelectDefaultFieldKeys:(BOOL)a3
{
  self->_shouldSelectDefaultFieldKeys = a3;
}

- (BOOL)isNameDropSession
{
  return self->_isNameDropSession;
}

- (void)setIsNameDropSession:(BOOL)a3
{
  self->_isNameDropSession = a3;
}

- (CNContact)defaultFieldSelections
{
  return self->_defaultFieldSelections;
}

- (void)setDefaultFieldSelections:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFieldSelections, a3);
}

- (BOOL)shouldSelectDefaultIndividualFields
{
  return self->_shouldSelectDefaultIndividualFields;
}

- (void)setShouldSelectDefaultIndividualFields:(BOOL)a3
{
  self->_shouldSelectDefaultIndividualFields = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFieldSelections, 0);
  objc_storeStrong((id *)&self->_toggleSelectAllFieldsButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_fieldPickerDataSource, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

id __48__CNContactCardFieldPicker_saveFilteredContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v46 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v41)
  {
    v39 = a1;
    v40 = *(_QWORD *)v53;
    v38 = v5;
    v34 = v3;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(v5);
        v43 = v6;
        v7 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "fieldPickerDataSource", v34);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = v10;
        objc_msgSend(v10, "sectionType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v13, "isEqualToString:", CFSTR("contactCardFieldPickerPhotoSection"));

        if ((_DWORD)v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "setPhotoFromContact:onFilteredContact:", v46, v3);
        }
        else
        {
          objc_msgSend(v12, "groupItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "property");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "valueForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            if (+[CNContactView isMultiValueProperty:](CNContactView, "isMultiValueProperty:", v15))
            {
              v17 = v16;
              if (*(_QWORD *)(a1 + 40) == 1)
              {
                objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v18;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
                v19 = v17;
                v20 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v36 = v16;
                v37 = v15;
                +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v15, v46, 0, 0, 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = 0u;
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v35 = v17;
                obj = v17;
                v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                if (v47)
                {
                  v45 = *(_QWORD *)v49;
                  v20 = (void *)MEMORY[0x1E0C9AA60];
                  do
                  {
                    for (i = 0; i != v47; ++i)
                    {
                      if (*(_QWORD *)v49 != v45)
                        objc_enumerationMutation(obj);
                      v22 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
                      v23 = v18;
                      +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", v22, v18, v46);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "displayLabel");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = v12;
                      objc_msgSend(v12, "groupItem");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "displayLabel");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = objc_msgSend(v25, "isEqualToString:", v28);

                      if (v29)
                      {
                        objc_msgSend(v20, "arrayByAddingObject:", v22);
                        v30 = objc_claimAutoreleasedReturnValue();

                        v20 = (void *)v30;
                      }

                      v12 = v26;
                      v18 = v23;
                    }
                    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                  }
                  while (v47);
                }
                else
                {
                  v20 = (void *)MEMORY[0x1E0C9AA60];
                }

                v3 = v34;
                v19 = v35;
                v16 = v36;
                v15 = v37;
              }

              objc_msgSend(v3, "valueForKey:", v15);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v3, "setValue:forKey:", v32, v15);
              v5 = v38;
              a1 = v39;
            }
            else
            {
              objc_msgSend(v3, "setValue:forKey:", v16, v15);
            }
          }

        }
        v6 = v43 + 1;
      }
      while (v43 + 1 != v41);
      v41 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v41);
  }

  return v3;
}

+ (BOOL)isContactObject:(id)a3 equivalentTo:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v25;
  uint64_t v26;
  BOOL (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v8 = v6;
    v9 = (void *)MEMORY[0x1E0D13A40];
    v10 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke;
    v40[3] = &unk_1E2050050;
    v41 = v7;
    v42 = v8;
    aBlock[0] = v10;
    aBlock[1] = 3221225472;
    aBlock[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_2;
    aBlock[3] = &unk_1E2050050;
    v11 = v41;
    v38 = v11;
    v12 = v42;
    v39 = v12;
    v13 = _Block_copy(aBlock);
    v34[0] = v10;
    v34[1] = 3221225472;
    v34[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_3;
    v34[3] = &unk_1E2050050;
    v14 = v11;
    v35 = v14;
    v15 = v12;
    v36 = v15;
    v16 = _Block_copy(v34);
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_4;
    v31[3] = &unk_1E2050050;
    v17 = v14;
    v32 = v17;
    v18 = v15;
    v33 = v18;
    v19 = _Block_copy(v31);
    v25 = v10;
    v26 = 3221225472;
    v27 = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_5;
    v28 = &unk_1E2050050;
    v29 = v17;
    v30 = v18;
    v20 = v18;
    v21 = v17;
    v22 = _Block_copy(&v25);
    v23 = objc_msgSend(v9, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v21, v20, v40, v13, v16, v19, v22, 0, v25, v26, v27, v28);

  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", v5, v6);
  }

  return v23;
}

+ (BOOL)isProperty:(id)a3 value:(id)a4 inContact:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v9, "isKeyAvailable:", v7))
  {
    v20 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v9, "valueForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v20 = 0;
LABEL_16:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)objc_opt_class();
    objc_msgSend(v8, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v21, "isContactObject:equivalentTo:", v22, v10);

    goto LABEL_16;
  }
  v24 = v7;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v17 = objc_opt_class();
        objc_msgSend(v8, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = objc_msgSend((id)v17, "isContactObject:equivalentTo:", v18, v19);

        if ((v17 & 1) != 0)
        {

          v20 = 1;
          goto LABEL_18;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
        continue;
      break;
    }
  }

  v20 = 0;
LABEL_18:
  v7 = v24;
LABEL_19:

  return v20;
}

+ (id)imageProperties
{
  if (imageProperties_cn_once_token_1 != -1)
    dispatch_once(&imageProperties_cn_once_token_1, &__block_literal_global_20474);
  return (id)imageProperties_cn_once_object_1;
}

+ (id)privateCardPropertiesForContacts:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C96690];
  v10[0] = CFSTR("birthdays");
  v10[1] = v5;
  v6 = *MEMORY[0x1E0C967F0];
  v10[2] = *MEMORY[0x1E0C967B0];
  v10[3] = v6;
  v7 = *MEMORY[0x1E0C967E8];
  v10[4] = *MEMORY[0x1E0C967B8];
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  if (+[CNContactCardFieldPickerDataSource canSharePronounsForContacts:](CNContactCardFieldPickerDataSource, "canSharePronounsForContacts:", v3))
  {
    objc_msgSend(v4, "addObject:", *MEMORY[0x1E0C96668]);
  }
  if (+[CNContactCardFieldPickerDataSource isSharingMeContactForContacts:](CNContactCardFieldPickerDataSource, "isSharingMeContactForContacts:", v3))
  {
    objc_msgSend(v4, "addObject:", *MEMORY[0x1E0C96840]);
  }

  return v4;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactCardFieldPicker descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __43__CNContactCardFieldPicker_imageProperties__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96890];
  v6[0] = *MEMORY[0x1E0C96708];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0C96710];
  v6[2] = *MEMORY[0x1E0C966C8];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0C96688];
  v6[4] = *MEMORY[0x1E0C96728];
  v6[5] = v2;
  v6[6] = *MEMORY[0x1E0C96778];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)imageProperties_cn_once_object_1;
  imageProperties_cn_once_object_1 = v4;

}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "day");
  return v2 == objc_msgSend(*(id *)(a1 + 40), "day");
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "month");
  return v2 == objc_msgSend(*(id *)(a1 + 40), "month");
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "year");
  return v2 == objc_msgSend(*(id *)(a1 + 40), "year");
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "era");
  return v2 == objc_msgSend(*(id *)(a1 + 40), "era");
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(*(id *)(a1 + 32), "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 == v5;

  return v6;
}

@end
