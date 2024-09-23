@implementation CNAccountsAndGroupsActionsProvider

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNAccountsAndGroupsActionsProvider)initWithDataSource:(id)a3 saveManager:(id)a4
{
  id v7;
  id v8;
  CNAccountsAndGroupsActionsProvider *v9;
  CNAccountsAndGroupsActionsProvider *v10;
  CNAccountsAndGroupsActionsProvider *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAccountsAndGroupsActionsProvider;
  v9 = -[CNAccountsAndGroupsActionsProvider init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_groupsAndContainersSaveManager, a4);
    v11 = v10;
  }

  return v10;
}

- (id)leadingActionsForItem:(id)a3 cell:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, void *);
  void *v21;
  CNAccountsAndGroupsActionsProvider *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(v5, "canEmail");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0DC36C8];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke;
    v24[3] = &unk_1E20504F8;
    v24[4] = self;
    v25 = v5;
    objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 0, 0, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("envelope.fill"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v11);

    +[CNUIColorRepository groupsMailActionColor](CNUIColorRepository, "groupsMailActionColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v12);

    objc_msgSend(v6, "addObject:", v10);
  }
  if (objc_msgSend(v5, "canMessage"))
  {
    v13 = (void *)MEMORY[0x1E0DC36C8];
    v18 = v8;
    v19 = 3221225472;
    v20 = __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke_2;
    v21 = &unk_1E20504F8;
    v22 = self;
    v23 = v5;
    objc_msgSend(v13, "contextualActionWithStyle:title:handler:", 0, 0, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message.fill"), v18, v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v15);

    +[CNUIColorRepository groupsTextActionColor](CNUIColorRepository, "groupsTextActionColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v16);

    objc_msgSend(v6, "addObject:", v14);
  }

  return v6;
}

- (id)trailingActionsForItem:(id)a3 cell:(id)a4 isCollectionViewEditing:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v21;
  CNAccountsAndGroupsActionsProvider *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  BOOL v27;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v8, "canDelete"))
  {
    v11 = (void *)MEMORY[0x1E0DC36C8];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke;
    v25[3] = &unk_1E204CAB8;
    v27 = a5;
    v25[4] = self;
    v26 = v8;
    objc_msgSend(v11, "contextualActionWithStyle:title:handler:", 1, 0, v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v13);

    objc_msgSend(v10, "addObject:", v12);
  }
  if (!a5 && objc_msgSend(v8, "canRename"))
  {
    v14 = (void *)MEMORY[0x1E0DC36C8];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_2;
    v21 = &unk_1E204CAE0;
    v22 = self;
    v23 = v8;
    v24 = v9;
    objc_msgSend(v14, "contextualActionWithStyle:title:handler:", 0, 0, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pencil"), v18, v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v16);

    objc_msgSend(v10, "addObject:", v15);
  }

  return v10;
}

- (id)contextMenuConfigurationForItem:(id)a3 cell:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CNAccountsAndGroupsActionsProvider_contextMenuConfigurationForItem_cell_atIndexPath___block_invoke;
  aBlock[3] = &unk_1E204CB08;
  aBlock[4] = self;
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  v12 = a5;
  v13 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", v12, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)actionsForItem:(id)a3 cell:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
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
  uint64_t v20;
  void *v21;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;

  v6 = a3;
  v41 = a4;
  v7 = objc_msgSend(v6, "canEmail");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EMAIL_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("envelope"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v8;
    v53[1] = 3221225472;
    v53[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke;
    v53[3] = &unk_1E20504A8;
    v53[4] = self;
    v54 = v6;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v53);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (objc_msgSend(v6, "canMessage"))
  {
    v15 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("MESSAGE_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_2;
    v51[3] = &unk_1E20504A8;
    v51[4] = self;
    v52 = v6;
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v51);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "arrayByAddingObject:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
  }
  if (objc_msgSend(v6, "canExport"))
  {
    v21 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("EXPORT_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up.on.square"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_3;
    v48[3] = &unk_1E20504D0;
    v48[4] = self;
    v49 = v6;
    v50 = v41;
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v23, v24, 0, v48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "arrayByAddingObject:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v26;
  }
  if (objc_msgSend(v6, "canRename"))
  {
    v27 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("RENAME_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pencil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_4;
    v45[3] = &unk_1E20504D0;
    v45[4] = self;
    v46 = v6;
    v47 = v41;
    objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v29, v30, 0, v45);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "arrayByAddingObject:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v32;
  }
  if (objc_msgSend(v6, "canDelete"))
  {
    v33 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DELETE_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_5;
    v42[3] = &unk_1E20504D0;
    v42[4] = self;
    v43 = v6;
    v37 = v41;
    v44 = v41;
    objc_msgSend(v33, "actionWithTitle:image:identifier:handler:", v35, v36, 0, v42);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setAttributes:", 2);
    objc_msgSend(v14, "arrayByAddingObject:", v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v39;
  }
  else
  {
    v37 = v41;
  }

  return v14;
}

- (BOOL)emailGroupForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);

  v6 = objc_alloc_init(MEMORY[0x1E0C97348]);
  -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97348], "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allContactsForItem:keysToFetch:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mailUrlForContacts:needsEmailAddresses:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationWorkspace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CA57C0];
    v17 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "openSensitiveURLInBackground:withOptions:", v11, v14);
  }
  else
  {
    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EMAIL_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentErrorAlertWithMessage:animated:", v14, 1);
  }

  return v11 != 0;
}

- (BOOL)messageGroupForItem:(id)a3
{
  id v4;
  void *v5;
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
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);

  v6 = objc_alloc_init(MEMORY[0x1E0C97358]);
  -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97358], "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allContactsForItem:keysToFetch:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "messageUrlForContacts:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applicationWorkspace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CA57C0];
    v19 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "openSensitiveURLInBackground:withOptions:", v11, v14);
  }
  else
  {
    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MESSAGE_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MESSAGE_GROUP_FAILURE_HINT"), &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentErrorAlertWithTitle:message:animated:", v14, v16, 1);

  }
  return v11 != 0;
}

- (BOOL)exportGroupForItem:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactListShareContactsActionContext *v13;
  void *v14;
  CNContactListShareContactsAction *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);

  -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactListShareContactsAction descriptorForRequiredKeys](CNContactListShareContactsAction, "descriptorForRequiredKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allContactsForItem:keysToFetch:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(CNContactListShareContactsActionContext);
  objc_msgSend(v7, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactListShareContactsActionContext setGroupName:](v13, "setGroupName:", v14);
  v15 = -[CNContactListShareContactsAction initWithContacts:sourceView:context:]([CNContactListShareContactsAction alloc], "initWithContacts:sourceView:context:", v12, v6, v13);

  -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListShareContactsAction setDelegate:](v15, "setDelegate:", v16);

  -[CNContactListShareContactsAction performAction](v15, "performAction");
  return 1;
}

- (BOOL)deleteGroupActionForItem:(id)a3 sourceView:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a4;
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_GROUP_CONFIRMATION_ALERT_TITLE-%@"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v13, v14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v42, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke;
  v45[3] = &unk_1E204CB30;
  v45[4] = self;
  v46 = v8;
  v20 = v9;
  v47 = v20;
  v21 = v8;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 2, v45);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v22);
  v23 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v19;
  v43[1] = 3221225472;
  v43[2] = __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke_2;
  v43[3] = &unk_1E204E498;
  v44 = v20;
  v26 = v20;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v43);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v27);
  objc_msgSend(v15, "popoverPresentationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSourceView:", v11);

  objc_msgSend(v11, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  objc_msgSend(v15, "popoverPresentationController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setSourceRect:", v30, v32, v34, v36);

  objc_msgSend(v15, "popoverPresentationController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPermittedArrowDirections:", 15);

  -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "presentController:animated:", v15, 1);

  return 1;
}

- (void)deleteGroupForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  CNAccountsAndGroupsAuthorizationContext *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[CNAccountsAndGroupsActionsProvider isAuthorizedToEditItem:](self, "isAuthorizedToEditItem:", v9))
  {
    -[CNAccountsAndGroupsActionsProvider authorizedDeleteGroupForItem:completionHandler:](self, "authorizedDeleteGroupForItem:completionHandler:", v9, v6);
  }
  else
  {
    v7 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    -[CNAccountsAndGroupsAuthorizationContext setType:](v7, "setType:", 2);
    -[CNAccountsAndGroupsAuthorizationContext setItem:](v7, "setItem:", v9);
    -[CNAccountsAndGroupsAuthorizationContext setActionCompletionHandler:](v7, "setActionCompletionHandler:", v6);
    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showEditAuthorizationPaneWithAuthorizationContext:animated:", v7, 1);

  }
}

- (BOOL)authorizedDeleteGroupForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = (void (**)(id, _BOOL8))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsActionsProvider setIssuedSaveRequestIdentifiers:](self, "setIssuedSaveRequestIdentifiers:", v8);

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));

  if ((v10 & 1) != 0)
    goto LABEL_7;
  if (objc_msgSend(v6, "type") == 2)
  {
    -[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsActionsProvider issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "deleteContainerWithIdentifier:inStore:ignoresGuardianRestrictions:issuedRequestIdentifiers:", v12, v14, 1, v15);
  }
  else
  {
    if (objc_msgSend(v6, "type") != 4)
      goto LABEL_8;
    -[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsActionsProvider issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "deleteGroupWithIdentifier:inStore:ignoresGuardianRestrictions:issuedRequestIdentifiers:", v12, v14, 1, v15);
  }
  v17 = v16;

  if ((v17 & 1) != 0)
  {
LABEL_7:
    -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCurrentlyEditingGroupIdentifier:", 0);

    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reloadCollectionViewDeletingItem:", v6);
    v20 = 1;
    goto LABEL_9;
  }
LABEL_8:
  -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DELETE_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentErrorAlertWithMessage:animated:", v22, 1);

  v20 = 0;
LABEL_9:

  if (v7)
    v7[2](v7, v20);

  return v20;
}

- (BOOL)editGroupNameActionForItem:(id)a3 cell:(id)a4
{
  id v6;
  BOOL v7;
  CNAccountsAndGroupsAuthorizationContext *v8;
  void *v9;

  v6 = a4;
  if (-[CNAccountsAndGroupsActionsProvider isAuthorizedToEditItem:](self, "isAuthorizedToEditItem:", a3))
  {
    v7 = -[CNAccountsAndGroupsActionsProvider authorizedEditGroupNameForCell:](self, "authorizedEditGroupNameForCell:", v6);
  }
  else
  {
    v8 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    v7 = 1;
    -[CNAccountsAndGroupsAuthorizationContext setType:](v8, "setType:", 1);
    -[CNAccountsAndGroupsAuthorizationContext setCell:](v8, "setCell:", v6);
    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showEditAuthorizationPaneWithAuthorizationContext:animated:", v8, 1);

  }
  return v7;
}

- (BOOL)authorizedEditGroupNameForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentlyEditingGroupIdentifier:", v6);

  objc_msgSend(v4, "beginEditingName");
  return 1;
}

- (void)updateItem:(id)a3 withNewName:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  objc_msgSend(v31, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));

  objc_msgSend(v31, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v6) & 1) != 0)
  {

    goto LABEL_7;
  }
  v10 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsActionsProvider setIssuedSaveRequestIdentifiers:](self, "setIssuedSaveRequestIdentifiers:", v11);

    if (v8)
    {
      if (!-[CNAccountsAndGroupsActionsProvider addGroupToStoreForGroupItem:withName:](self, "addGroupToStoreForGroupItem:withName:", v31, v6))
      {
        -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reloadCollectionViewDeletingItem:", v31);

LABEL_16:
        -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactsUIBundle();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("UPDATE_GROUP_NAME_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "presentErrorAlertWithMessage:animated:", v30, 1);

        goto LABEL_17;
      }
    }
    else if (objc_msgSend(v31, "type") == 4)
    {
      -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "groupIdentifierForGroupItem:", v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "store");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsActionsProvider issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v16, "updateGroupWithIdentifier:inStore:withNewName:ignoresGuardianRestrictions:issuedRequestIdentifiers:", v15, v18, v6, 1, v19);

      if ((v20 & 1) == 0)
        goto LABEL_16;
    }
    else
    {
      if (objc_msgSend(v31, "type") != 2)
        goto LABEL_16;
      -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "containerIdentifierForItem:", v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "store");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsActionsProvider issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v23, "updateContainerWithIdentifier:inStore:withNewName:ignoresGuardianRestrictions:issuedRequestIdentifiers:", v22, v25, v6, 1, v26);

      if (!v27)
        goto LABEL_16;
    }
    objc_msgSend(v31, "setName:", v6);
    -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sectionIdentifierForItem:", v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_18;
    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "reloadCollectionViewForSectionWithIdentifier:settingFilterForEditingItem:allowsReloadWhenEditing:", v13, 0, 0);
LABEL_17:

    goto LABEL_18;
  }
LABEL_7:
  if (v8)
  {
    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadCollectionViewDeletingItem:", v31);
LABEL_18:

  }
}

- (void)createGroupActionForContainerItem:(id)a3 isCollectionViewEditing:(BOOL)a4
{
  void *v6;
  void *v7;
  char v8;
  CNAccountsAndGroupsAuthorizationContext *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (a4
    || (-[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isAuthorizedToEditContainerWithIdentifier:", v7),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[CNAccountsAndGroupsActionsProvider authorizedCreateGroupActionForContainerItem:](self, "authorizedCreateGroupActionForContainerItem:", v11);
  }
  else
  {
    v9 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    -[CNAccountsAndGroupsAuthorizationContext setType:](v9, "setType:", 3);
    -[CNAccountsAndGroupsAuthorizationContext setContainerItem:](v9, "setContainerItem:", v11);
    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "showEditAuthorizationPaneWithAuthorizationContext:animated:", v9, 1);

  }
}

- (void)authorizedCreateGroupActionForContainerItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CNAccountsAndGroupsItem *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountForContainerIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
  v7 = (CNAccountsAndGroupsItem *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsItem expandSectionForAccountWithIdentifier:](v7, "expandSectionForAccountWithIdentifier:", v8);

    if (objc_msgSend(v13, "type") == 2)
      v9 = 2;
    else
      v9 = 4;
    v7 = -[CNAccountsAndGroupsItem initWithType:nameProvider:]([CNAccountsAndGroupsItem alloc], "initWithType:nameProvider:", v9, 0);
    -[CNAccountsAndGroupsItem setIdentifier:](v7, "setIdentifier:", CFSTR("groupPlaceholderIdentifier"));
    objc_msgSend(v13, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsItem setContainerIdentifier:](v7, "setContainerIdentifier:", v10);

    -[CNAccountsAndGroupsActionsProvider delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadCollectionViewAddingPlaceholderItem:inSectionWithIdentifier:", v7, v12);
  }
  else
  {
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CREATE_GROUP_FAILURE"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsItem presentErrorAlertWithMessage:animated:](v7, "presentErrorAlertWithMessage:animated:", v12, 1);
  }

}

- (BOOL)addGroupToStoreForGroupItem:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsActionsProvider setIssuedSaveRequestIdentifiers:](self, "setIssuedSaveRequestIdentifiers:", v8);

  -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerIdentifierForItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(v6, "type") == 2)
    {
      -[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accountForContainerIdentifier:", v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97368]), "initWithName:type:", v7, 2);
      v14 = objc_alloc_init(MEMORY[0x1E0C973D0]);
      objc_msgSend(v14, "setIgnoresGuardianRestrictions:", 1);
      -[CNAccountsAndGroupsActionsProvider issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "saveRequestIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "store");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v13, "addContainerInStore:toAccountWithIdentifier:saveRequest:", v18, v19, v14);

      if (!v20)
      {
        v22 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v13, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", v21);

      objc_msgSend(v6, "setContainerIdentifier:", 0);
    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C97370]);
      objc_msgSend(v12, "setName:", v7);
      v13 = objc_alloc_init(MEMORY[0x1E0C973D0]);
      objc_msgSend(v13, "setIgnoresGuardianRestrictions:", 1);
      -[CNAccountsAndGroupsActionsProvider issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "saveRequestIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

      -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "store");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = objc_msgSend(v12, "addGroupInStore:toContainerWithIdentifier:saveRequest:", v26, v10, v13);

      if (!(_DWORD)v24)
      {
        v22 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v12, "identifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", v14);
    }
    v22 = 1;
LABEL_10:

LABEL_12:
    goto LABEL_13;
  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)isAuthorizedToEditItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNAccountsAndGroupsActionsProvider dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerIdentifierForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsActionsProvider groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "isAuthorizedToEditContainerWithIdentifier:", v6);

  return (char)v4;
}

- (CNAccountsAndGroupsActionsProviderDelegate)delegate
{
  return (CNAccountsAndGroupsActionsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableArray)issuedSaveRequestIdentifiers
{
  return self->_issuedSaveRequestIdentifiers;
}

- (void)setIssuedSaveRequestIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, a3);
}

- (CNAccountsAndGroupsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteGroupForItem:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "emailGroupForItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageGroupForItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "exportGroupForItem:sourceView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "editGroupNameActionForItem:cell:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteGroupActionForItem:sourceView:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

id __87__CNAccountsAndGroupsActionsProvider_contextMenuConfigurationForItem_cell_atIndexPath___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "actionsForItem:cell:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E20507A8, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7;
  void *v8;
  uint64_t v9;

  v7 = *(unsigned __int8 *)(a1 + 48);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (v7)
    return objc_msgSend(v8, "authorizedDeleteGroupForItem:completionHandler:", v9, a4);
  else
    return objc_msgSend(v8, "deleteGroupActionForItem:sourceView:completionHandler:", v9, a3, a4);
}

void __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  dispatch_time_t v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, 1);
  v5 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_3;
  block[3] = &unk_1E204FAA0;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);

}

uint64_t __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "editGroupNameActionForItem:cell:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a4;
  v6[2](v6, objc_msgSend(v4, "emailGroupForItem:", v5));

}

void __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a4;
  v6[2](v6, objc_msgSend(v4, "messageGroupForItem:", v5));

}

@end
