@implementation CNContactListShareContactsAction

- (CNContactListShareContactsAction)initWithContacts:(id)a3 sourceView:(id)a4
{
  return -[CNContactListShareContactsAction initWithContacts:sourceView:context:](self, "initWithContacts:sourceView:context:", a3, a4, 0);
}

- (CNContactListShareContactsAction)initWithContacts:(id)a3 sourceView:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNContactListShareContactsAction *v12;
  CNContactListShareContactsAction *v13;
  CNContactListShareContactsAction *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactListShareContactsAction;
  v12 = -[CNContactListShareContactsAction init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contacts, a3);
    objc_storeStrong((id *)&v13->_sourceView, a4);
    objc_storeStrong((id *)&v13->_context, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)shouldReloadListOnCompletion
{
  return 0;
}

- (void)performAction
{
  UIActivityViewController *activityViewController;
  void *v4;
  _BOOL4 v5;

  -[CNContactListShareContactsAction setupForContactFieldPicker](self, "setupForContactFieldPicker");
  activityViewController = self->_activityViewController;
  self->_activityViewController = 0;

  -[CNContactListShareContactsAction contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CNContactShareActionHelper contactsHavePrivateProperties:](CNContactShareActionHelper, "contactsHavePrivateProperties:", v4);

  if (v5)
    -[CNContactListShareContactsAction presentFilterFieldPicker](self, "presentFilterFieldPicker");
  else
    -[CNContactListShareContactsAction presentShareSheet](self, "presentShareSheet");
}

- (BOOL)editRequiresAuthorization
{
  return 0;
}

- (void)setupForContactFieldPicker
{
  CNContactCardFieldPicker *v3;
  void *v4;
  CNContactCardFieldPicker *v5;
  id v6;

  -[CNContactListShareContactsAction setFilteredContacts:](self, "setFilteredContacts:", 0);
  v3 = [CNContactCardFieldPicker alloc];
  -[CNContactListShareContactsAction contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactCardFieldPicker initWithContacts:](v3, "initWithContacts:", v4);
  -[CNContactListShareContactsAction setFieldPicker:](self, "setFieldPicker:", v5);

  -[CNContactListShareContactsAction fieldPicker](self, "fieldPicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)presentFilterFieldPicker
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0DC3A40]);
  -[CNContactListShareContactsAction fieldPicker](self, "fieldPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithRootViewController:", v4);

  -[CNContactListShareContactsAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action:presentViewController:", self, v6);

}

- (void)presentShareSheet
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id location;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[CNContactListShareContactsAction filteredContacts](self, "filteredContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CNContactListShareContactsAction contacts](self, "contacts");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[CNContactListShareContactsAction activityItemForContacts:](self, "activityItemForContacts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  v32[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, 0);

  -[CNContactListShareContactsAction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v11);
  objc_msgSend(v10, "setObjectManipulationDelegate:", self);
  objc_msgSend(v10, "setShowKeyboardAutomatically:", 1);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __53__CNContactListShareContactsAction_presentShareSheet__block_invoke;
  v29[3] = &unk_1E204F110;
  objc_copyWeak(&v30, &location);
  v29[4] = self;
  objc_msgSend(v10, "setPreCompletionHandler:", v29);
  -[CNContactListShareContactsAction sourceView](self, "sourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (!v13)
  {
    -[CNContactListShareContactsAction sourceView](self, "sourceView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "popoverPresentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSourceView:", v14);

    -[CNContactListShareContactsAction sourceView](self, "sourceView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v10, "popoverPresentationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSourceRect:", v18, v20, v22, v24);

    -[CNContactListShareContactsAction contacts](self, "contacts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = (unint64_t)objc_msgSend(v26, "count") > 1;

    if ((_DWORD)v25)
    {
      objc_msgSend(v10, "popoverPresentationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPermittedArrowDirections:", 12);

    }
  }
  -[CNContactListShareContactsAction delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "action:presentViewController:", self, v10);

  -[CNContactListShareContactsAction setActivityViewController:](self, "setActivityViewController:", v10);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (id)activityItemForContacts:(id)a3
{
  id v4;
  CNShareContactActivityItem *v5;
  void *v6;
  void *v7;
  CNShareContactActivityItem *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;

  v4 = a3;
  v5 = [CNShareContactActivityItem alloc];
  -[CNContactListShareContactsAction context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNShareContactActivityItem initWithContacts:inGroupNamed:](v5, "initWithContacts:inGroupNamed:", v4, v7);

  -[CNContactListShareContactsAction contacts](self, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CNContactCardFieldPickerDataSource canSharePronounsForContacts:](CNContactCardFieldPickerDataSource, "canSharePronounsForContacts:", v9))
  {
    v10 = +[CNContactShareActionHelper contactsHaveShareableAddressingGrammarValue:](CNContactShareActionHelper, "contactsHaveShareableAddressingGrammarValue:", v4);
  }
  else
  {
    v10 = 0;
  }
  -[CNShareContactActivityItem setCanSharePronouns:](v8, "setCanSharePronouns:", v10);

  -[CNContactListShareContactsAction contacts](self, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNShareContactActivityItem setCanShareMeCardOnlySharingProperties:](v8, "setCanShareMeCardOnlySharingProperties:", +[CNContactCardFieldPickerDataSource isSharingMeContactForContacts:](CNContactCardFieldPickerDataSource, "isSharingMeContactForContacts:", v11));

  return v8;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[CNContactListShareContactsAction fieldPicker](self, "fieldPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNContactListShareContactsAction fieldPicker](self, "fieldPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fieldPickerDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (id)customLocalizedActionTitleForActivityViewController:(id)a3
{
  void *v3;
  void *v4;

  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SHARE_SELECTED_FIELDS_OPTION_BUTTON_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)contactCardFieldPicker:(id)a3 didFinishWithContacts:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    -[CNContactListShareContactsAction setFilteredContacts:](self, "setFilteredContacts:", v5);
    -[CNContactListShareContactsAction activityViewController](self, "activityViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNContactListShareContactsAction activityItemForContacts:](self, "activityItemForContacts:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListShareContactsAction activityViewController](self, "activityViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_updateActivityItems:", v9);

      -[CNContactListShareContactsAction activityViewController](self, "activityViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObjectManipulationDelegate:", self);

    }
    else
    {
      -[CNContactListShareContactsAction presentShareSheet](self, "presentShareSheet");
    }
  }

}

- (CNContactListActionDelegate)delegate
{
  return (CNContactListActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactListShareContactsActionContext)context
{
  return self->_context;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSArray)filteredContacts
{
  return self->_filteredContacts;
}

- (void)setFilteredContacts:(id)a3
{
  objc_storeStrong((id *)&self->_filteredContacts, a3);
}

- (CNContactCardFieldPicker)fieldPicker
{
  return self->_fieldPicker;
}

- (void)setFieldPicker:(id)a3
{
  objc_storeStrong((id *)&self->_fieldPicker, a3);
}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_fieldPicker, 0);
  objc_storeStrong((id *)&self->_filteredContacts, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__CNContactListShareContactsAction_presentShareSheet__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a3)
  {
    +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CNUIContactActionTypeShare;
    v10 = CNUIContactActionShareActivityType;
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logContactActionType:attributes:", v8, v9);

    objc_msgSend(WeakRetained, "actionDidFinish:", *(_QWORD *)(a1 + 32));
  }

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
  +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListShareContactsAction descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
