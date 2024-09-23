@implementation CNMultipleUnknownContactsViewController

- (CNMultipleUnknownContactsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNMultipleUnknownContactsViewController initWithContacts:](self, "initWithContacts:", MEMORY[0x1E0C9AA60], a4);
}

- (CNMultipleUnknownContactsViewController)initWithContacts:(id)a3
{
  return -[CNMultipleUnknownContactsViewController initWithContacts:targetGroup:targetContainer:](self, "initWithContacts:targetGroup:targetContainer:", a3, 0, 0);
}

- (CNMultipleUnknownContactsViewController)initWithContacts:(id)a3 targetGroup:(id)a4 targetContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNMultipleUnknownContactsViewController *v11;
  uint64_t v12;
  NSArray *contacts;
  NSArray *v14;
  CNMultipleUnknownContactsViewController *v15;
  uint64_t v16;
  CNContactFormatter *formatter;
  NSMutableSet *v18;
  NSMutableSet *createdContactIdentifiers;
  void *v20;
  void *v21;
  void *v22;
  CNMultipleUnknownContactsViewController *v23;
  _QWORD v25[4];
  CNMultipleUnknownContactsViewController *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CNMultipleUnknownContactsViewController;
  v11 = -[CNMultipleUnknownContactsViewController initWithStyle:](&v27, sel_initWithStyle_, 1);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    contacts = v11->_contacts;
    v11->_contacts = (NSArray *)v12;

    v14 = v11->_contacts;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__CNMultipleUnknownContactsViewController_initWithContacts_targetGroup_targetContainer___block_invoke;
    v25[3] = &unk_1E2049CD0;
    v15 = v11;
    v26 = v15;
    -[NSArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v25);
    objc_msgSend((id)objc_opt_class(), "contactFormatter");
    v16 = objc_claimAutoreleasedReturnValue();
    formatter = v15->_formatter;
    v15->_formatter = (CNContactFormatter *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    createdContactIdentifiers = v15->_createdContactIdentifiers;
    v15->_createdContactIdentifiers = v18;

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 3, v15, sel__save_);
    -[CNMultipleUnknownContactsViewController navigationItem](v15, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRightBarButtonItem:", v20);

    -[CNMultipleUnknownContactsViewController navigationItem](v15, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLargeTitleDisplayMode:", 2);

    objc_storeStrong((id *)&v15->_targetGroup, a4);
    objc_storeStrong((id *)&v15->_targetContainer, a5);
    v23 = v15;

  }
  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNMultipleUnknownContactsViewController;
  -[CNMultipleUnknownContactsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CNMultipleUnknownContactsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("UITableViewCell"));

}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  CNUIGroupsAndContainersSaveManager *groupsAndContainersSaveManager;
  CNUIGroupsAndContainersSaveManager *v4;
  void *v5;
  CNUIGroupsAndContainersSaveManager *v6;
  CNUIGroupsAndContainersSaveManager *v7;

  groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  if (!groupsAndContainersSaveManager)
  {
    v4 = [CNUIGroupsAndContainersSaveManager alloc];
    -[CNMultipleUnknownContactsViewController contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:](v4, "initWithContactStore:", v5);
    v7 = self->_groupsAndContainersSaveManager;
    self->_groupsAndContainersSaveManager = v6;

    groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  }
  return groupsAndContainersSaveManager;
}

- (CNContainer)targetContainer
{
  CNContainer *targetContainer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  targetContainer = self->_targetContainer;
  if (targetContainer)
    return targetContainer;
  v5 = (void *)MEMORY[0x1E0C972C0];
  -[CNMultipleUnknownContactsViewController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultContainerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContainersWithIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMultipleUnknownContactsViewController contactStore](self, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containersMatchingPredicate:error:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContainer *)v12;
}

- (void)_showAddAllToContactsConfirmation
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
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMultipleUnknownContactsViewController contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VCARD_CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v8);

  v9 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VCARD_CREATE"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke;
  v24[3] = &unk_1E204FFA8;
  v24[4] = self;
  v13 = v4;
  v25 = v13;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("VCARD_ADD_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringWithFormat:", v17, objc_msgSend(v13, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0DC3448];
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke_2;
  v22[3] = &unk_1E204FFA8;
  v22[4] = self;
  v23 = v13;
  v20 = v13;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v18, 0, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v21);

  -[CNMultipleUnknownContactsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
}

- (void)_save:(id)a3
{
  id v4;

  -[CNMultipleUnknownContactsViewController contacts](self, "contacts", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNMultipleUnknownContactsViewController _createNewContacts:](self, "_createNewContacts:", v4);

}

- (void)_didComplete
{
  id v3;

  -[CNMultipleUnknownContactsViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multipleUnknownContactsViewControllerDidComplete:", self);

}

- (void)_createNewContacts:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__CNMultipleUnknownContactsViewController__createNewContacts___block_invoke;
  v5[3] = &unk_1E2050520;
  v5[4] = self;
  objc_msgSend(a3, "_cn_filter:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    -[CNMultipleUnknownContactsViewController addContacts:](self, "addContacts:", v4);
  -[CNMultipleUnknownContactsViewController _didComplete](self, "_didComplete");

}

- (void)addContacts:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9);
        -[CNMultipleUnknownContactsViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNMultipleUnknownContactsViewController targetContainer](self, "targetContainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isAuthorizedToAddContact:toContainer:ignoresParentalRestrictions:", v10, v12, 0);

        if (v13)
          v14 = v5;
        else
          v14 = v6;
        objc_msgSend(v14, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  v15 = *MEMORY[0x1E0D137F8];
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v5) & 1) == 0)
  {
    -[CNMultipleUnknownContactsViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController targetGroup](self, "targetGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController targetContainer](self, "targetContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addContacts:toGroup:inContainer:moveWasAuthorized:", v5, v17, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "saveDidSucceed"))
    {
      -[CNMultipleUnknownContactsViewController createdContactIdentifiers](self, "createdContactIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addedContacts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_cn_map:", &__block_literal_global_35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v22);

    }
  }
  if (((*(uint64_t (**)(uint64_t, id))(v15 + 16))(v15, v6) & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[CNMultipleUnknownContactsViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke_2;
    v25[3] = &unk_1E2049D18;
    objc_copyWeak(&v27, &location);
    v26 = v6;
    objc_msgSend(v23, "authorizeForViewController:sender:animated:completionBlock:", self, self, 1, v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

- (void)_addToExistingContacts:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
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
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke;
  v37[3] = &unk_1E2049D40;
  v37[4] = self;
  v9 = v6;
  v38 = v9;
  v10 = v7;
  v39 = v10;
  v11 = v8;
  v40 = v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v37);

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    -[CNMultipleUnknownContactsViewController contactStore](self, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v13 = objc_msgSend(v12, "executeSaveRequest:error:", v11, &v36);
    v14 = v36;

    if ((v13 & 1) != 0)
    {
      -[CNMultipleUnknownContactsViewController addContacts:](self, "addContacts:", v10);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[CNMultipleUnknownContactsViewController contactStore](self, "contactStore");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = v32;
        v43 = 2112;
        v44 = v14;
        _os_log_error_impl(&dword_18AC56000, v15, OS_LOG_TYPE_ERROR, "Could not save contacts in store %@: %@", buf, 0x16u);

      }
    }

  }
  if (objc_msgSend(v9, "count"))
  {
    v33 = v11;
    v16 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("VCARD_UNMERGED_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v18, objc_msgSend(v9, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
      v22 = CFSTR("VCARD_CREATE_NEW_ONE");
    else
      v22 = CFSTR("VCARD_CREATE_NEW_MANY");
    objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_1E20507A8, CFSTR("Localized"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithFormat:", v23, objc_msgSend(v9, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v19, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("VCARD_CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 1, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v29);

    v30 = (void *)MEMORY[0x1E0DC3448];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke_45;
    v34[3] = &unk_1E204FFA8;
    v34[4] = self;
    v35 = v9;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v24, 0, v34);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v31);

    v11 = v33;
    -[CNMultipleUnknownContactsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);

  }
  else
  {
    -[CNMultipleUnknownContactsViewController _didComplete](self, "_didComplete");
  }

}

- (void)_presentUnknownContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CNMultipleUnknownContactsViewController createdContactIdentifiers](self, "createdContactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    +[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v4);
  else
    +[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CNMultipleUnknownContactsViewController contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContactStore:", v8);

  objc_msgSend(v12, "setDelegate:", self);
  -[CNMultipleUnknownContactsViewController targetGroup](self, "targetGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setParentGroup:", v9);

  -[CNMultipleUnknownContactsViewController targetContainer](self, "targetContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setParentContainer:", v10);

  -[CNMultipleUnknownContactsViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v12, 1);

}

- (id)_existingMatchForUnknownContact:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "contactType");
  if (v5 == 1)
  {
    objc_msgSend(v4, "organizationName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E20507A8;
  }
  v7 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, __CFString *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v6))
  {
    objc_msgSend(v4, "givenName");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v8;
  }
  objc_msgSend(v4, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9) & 1) == 0)
  {
    if ((*(unsigned int (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6))
    {
      v10 = v9;
    }
    else
    {
      -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR(" %@"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    v6 = v11;
  }
  if (((*(uint64_t (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0C97210]);
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithKeysToFetch:", v16);

    objc_msgSend(v17, "setPredicate:", v13);
    objc_msgSend(v17, "setSortOrder:", 1);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__18456;
    v33 = __Block_byref_object_dispose__18457;
    v34 = 0;
    -[CNMultipleUnknownContactsViewController contactStore](self, "contactStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __75__CNMultipleUnknownContactsViewController__existingMatchForUnknownContact___block_invoke_51;
    v23[3] = &unk_1E2049D88;
    v27 = v5;
    v25 = &__block_literal_global_50;
    v24 = v4;
    v26 = &v29;
    v19 = objc_msgSend(v18, "enumerateContactsWithFetchRequest:error:usingBlock:", v17, &v28, v23);
    v20 = v28;

    if (v19)
      v21 = (void *)v30[5];
    else
      v21 = 0;
    v12 = v21;

    _Block_object_dispose(&v29, 8);
  }

  return v12;
}

- (id)_updatedContact:(id)a3 withPropertiesFromContact:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = (id)objc_msgSend(v6, "addAllPropertiesFromContact:", v5);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    -[CNMultipleUnknownContactsViewController contacts](self, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMultipleUnknownContactsViewController _presentUnknownContact:](self, "_presentUnknownContact:", v8);
  }
  else
  {
    -[CNMultipleUnknownContactsViewController _showAddAllToContactsConfirmation](self, "_showAddAllToContactsConfirmation");
    objc_msgSend(v9, "indexPathForSelectedRow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v8, 1);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  if (!a4)
    return 1;
  -[CNMultipleUnknownContactsViewController contacts](self, "contacts", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
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

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("UITableViewCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "section"))
  {
    -[CNMultipleUnknownContactsViewController contacts](self, "contacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMultipleUnknownContactsViewController formatter](self, "formatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromContact:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(v7, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 4);

    objc_msgSend(v7, "setAccessoryType:", 1);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("VCARD_ADD_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController contacts](self, "contacts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v16, objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    objc_msgSend(v7, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextAlignment:", 1);

    objc_msgSend(v7, "setAccessoryType:", 0);
  }

  return v7;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  if (a4)
  {
    objc_msgSend(a3, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMultipleUnknownContactsViewController contacts](self, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__CNMultipleUnknownContactsViewController_contactViewController_didCompleteWithContact___block_invoke;
    v14[3] = &unk_1E2050520;
    v13 = v6;
    v15 = v13;
    LODWORD(v6) = objc_msgSend(v7, "_cn_any:", v14);

    if ((_DWORD)v6)
    {
      -[CNMultipleUnknownContactsViewController createdContactIdentifiers](self, "createdContactIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_cn_addNonNilObject:", v13);

    }
    -[CNMultipleUnknownContactsViewController createdContactIdentifiers](self, "createdContactIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    -[CNMultipleUnknownContactsViewController contacts](self, "contacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 == v12)
      -[CNMultipleUnknownContactsViewController _didComplete](self, "_didComplete");

  }
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[CNMultipleUnknownContactsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNMultipleUnknownContactsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "multipleUnknownContactsViewController:shouldPerformDefaultActionForContactProperty:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNMultipleUnknownContactsViewControllerDelegate)delegate
{
  return (CNMultipleUnknownContactsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNGroup)targetGroup
{
  return self->_targetGroup;
}

- (void)setTargetGroup:(id)a3
{
  objc_storeStrong((id *)&self->_targetGroup, a3);
}

- (void)setTargetContainer:(id)a3
{
  objc_storeStrong((id *)&self->_targetContainer, a3);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSMutableSet)createdContactIdentifiers
{
  return self->_createdContactIdentifiers;
}

- (void)setCreatedContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_createdContactIdentifiers, a3);
}

- (CNContactFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_createdContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_targetContainer, 0);
  objc_storeStrong((id *)&self->_targetGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

uint64_t __88__CNMultipleUnknownContactsViewController_contactViewController_didCompleteWithContact___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __75__CNMultipleUnknownContactsViewController__existingMatchForUnknownContact___block_invoke_51(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(uint64_t, void *, uint64_t);
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a2;
  if (objc_msgSend(v35, "contactType") != *(_QWORD *)(a1 + 56))
    goto LABEL_15;
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v35, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8) & 1) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v35, "middleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "middleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(*(unsigned int (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11))
  {
LABEL_13:

    goto LABEL_14;
  }
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v35, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "familyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(*(unsigned int (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v14))
  {

    goto LABEL_13;
  }
  v34 = v13;
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v35, "namePrefix");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "namePrefix");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(unsigned int (**)(uint64_t, void *, uint64_t))(v15 + 16);
  v19 = v15;
  v20 = (void *)v16;
  v21 = (void *)v17;
  if (!v18(v19, v20, v17))
  {

LABEL_12:
    goto LABEL_13;
  }
  v31 = v14;
  v32 = v21;
  v33 = v20;
  v22 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v35, "nameSuffix");
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nameSuffix");
  v24 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v23;
  v25 = v23;
  v26 = (void *)v24;
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v22 + 16))(v22, v25))
  {

    goto LABEL_12;
  }
  v29 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v35, "organizationName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "organizationName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = (*(uint64_t (**)(uint64_t, void *, void *))(v29 + 16))(v29, v27, v28);

  if ((_DWORD)v29)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
LABEL_15:

}

BOOL __75__CNMultipleUnknownContactsViewController__existingMatchForUnknownContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v4 && v5)
      v7 = objc_msgSend(v4, "localizedCaseInsensitiveCompare:", v5) == 0;
  }

  return v7;
}

void __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v3, "_existingMatchForUnknownContact:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (v5)
  {
    objc_msgSend(a1[4], "_updatedContact:withPropertiesFromContact:", v5, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "addObject:", v6);
    objc_msgSend(a1[7], "updateContact:", v6);
    v4 = (id)v6;
  }
  else
  {
    objc_msgSend(a1[5], "addObject:", v4);
  }

}

uint64_t __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createNewContacts:", *(_QWORD *)(a1 + 40));
}

void __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "groupsAndContainersSaveManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "targetGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "targetContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addContacts:toGroup:inContainer:moveWasAuthorized:", v3, v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "saveDidSucceed"))
  {
    objc_msgSend(WeakRetained, "createdContactIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_36);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
}

uint64_t __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __62__CNMultipleUnknownContactsViewController__createNewContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "createdContactIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return v6;
}

uint64_t __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createNewContacts:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addToExistingContacts:", *(_QWORD *)(a1 + 40));
}

void __88__CNMultipleUnknownContactsViewController_initWithContacts_targetGroup_targetContainer___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertKeysAreAvailable:", v4);

}

+ (id)log
{
  if (log_cn_once_token_1_18494 != -1)
    dispatch_once(&log_cn_once_token_1_18494, &__block_literal_global_18495);
  return (id)log_cn_once_object_1_18496;
}

+ (id)contactFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v2, "setStyle:", 0);
  objc_msgSend(v2, "setFallbackStyle:", -1);
  return v2;
}

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97200];
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(a1, "contactFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNMultipleUnknownContactsViewController descriptorForRequiredKeys]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorWithKeyDescriptors:description:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __46__CNMultipleUnknownContactsViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNMultipleUnknownContactsViewController");
  v1 = (void *)log_cn_once_object_1_18496;
  log_cn_once_object_1_18496 = (uint64_t)v0;

}

@end
