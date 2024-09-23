@implementation CNContactShareContactAction

- (BOOL)canPerformAction
{
  return 1;
}

- (void)performActionWithSender:(id)a3
{
  UIActivityViewController *activityViewController;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[CNContactShareContactAction setSourceView:](self, "setSourceView:", a3);
  -[CNContactShareContactAction setupForContactFieldPicker](self, "setupForContactFieldPicker");
  activityViewController = self->_activityViewController;
  self->_activityViewController = 0;

  -[CNContactAction contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[CNContactShareActionHelper contactsHavePrivateProperties:](CNContactShareActionHelper, "contactsHavePrivateProperties:", v6);

  if (v7)
    -[CNContactShareContactAction presentFilterFieldPicker](self, "presentFilterFieldPicker");
  else
    -[CNContactShareContactAction presentShareSheet](self, "presentShareSheet");
}

- (void)setupForContactFieldPicker
{
  CNContactCardFieldPicker *v3;
  void *v4;
  CNContactCardFieldPicker *v5;
  id v6;

  -[CNContactShareContactAction setFilteredContact:](self, "setFilteredContact:", 0);
  v3 = [CNContactCardFieldPicker alloc];
  -[CNContactAction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactCardFieldPicker initWithContact:](v3, "initWithContact:", v4);
  -[CNContactShareContactAction setFieldPicker:](self, "setFieldPicker:", v5);

  -[CNContactShareContactAction fieldPicker](self, "fieldPicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)presentFilterFieldPicker
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3A40]);
  -[CNContactShareContactAction fieldPicker](self, "fieldPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "initWithRootViewController:", v4);

  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactShareContactAction sourceView](self, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action:presentViewController:sender:", self, v7, v6);

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
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id from;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[CNContactShareContactAction filteredContact](self, "filteredContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CNContactAction contact](self, "contact");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[CNContactShareContactAction activityItemForContact:](self, "activityItemForContact:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, 0);

  -[CNContactAction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);
  objc_initWeak(&from, v11);
  objc_msgSend(v10, "setObjectManipulationDelegate:", self);
  objc_msgSend(v10, "setShowKeyboardAutomatically:", 1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__CNContactShareContactAction_presentShareSheet__block_invoke;
  v14[3] = &unk_1E20493F0;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  objc_msgSend(v10, "setPreCompletionHandler:", v14);
  -[CNContactAction delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactShareContactAction sourceView](self, "sourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "action:presentViewController:sender:", self, v10, v13);

  -[CNContactShareContactAction setActivityViewController:](self, "setActivityViewController:", v10);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (id)activityItemForContact:(id)a3
{
  id v4;
  CNShareContactActivityItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CNShareContactActivityItem initWithContact:]([CNShareContactActivityItem alloc], "initWithContact:", v4);

  -[CNContactAction contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CNContactCardFieldPickerDataSource canSharePronounsForContacts:](CNContactCardFieldPickerDataSource, "canSharePronounsForContacts:", v7))
  {
    -[CNContactAction contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNShareContactActivityItem setCanSharePronouns:](v5, "setCanSharePronouns:", +[CNContactShareActionHelper contactsHaveShareableAddressingGrammarValue:](CNContactShareActionHelper, "contactsHaveShareableAddressingGrammarValue:", v9));

  }
  else
  {
    -[CNShareContactActivityItem setCanSharePronouns:](v5, "setCanSharePronouns:", 0);
  }

  -[CNContactAction contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNShareContactActivityItem setCanShareMeCardOnlySharingProperties:](v5, "setCanShareMeCardOnlySharingProperties:", +[CNContactCardFieldPickerDataSource isSharingMeContactForContacts:](CNContactCardFieldPickerDataSource, "isSharingMeContactForContacts:", v11));

  return v5;
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

  -[CNContactShareContactAction fieldPicker](self, "fieldPicker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNContactShareContactAction fieldPicker](self, "fieldPicker");
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
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactShareContactAction setFilteredContact:](self, "setFilteredContact:", v6);

    -[CNContactShareContactAction activityViewController](self, "activityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNContactShareContactAction filteredContact](self, "filteredContact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactShareContactAction activityItemForContact:](self, "activityItemForContact:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactShareContactAction activityViewController](self, "activityViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_updateActivityItems:", v11);

      -[CNContactShareContactAction activityViewController](self, "activityViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObjectManipulationDelegate:", self);

    }
    else
    {
      -[CNContactShareContactAction presentShareSheet](self, "presentShareSheet");
    }
  }

}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (CNContact)filteredContact
{
  return self->_filteredContact;
}

- (void)setFilteredContact:(id)a3
{
  objc_storeStrong((id *)&self->_filteredContact, a3);
}

- (CNContactCardFieldPicker)fieldPicker
{
  return self->_fieldPicker;
}

- (void)setFieldPicker:(id)a3
{
  objc_storeStrong((id *)&self->_fieldPicker, a3);
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
  objc_storeStrong((id *)&self->_fieldPicker, 0);
  objc_storeStrong((id *)&self->_filteredContact, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
}

void __48__CNContactShareContactAction_presentShareSheet__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  if (a3)
  {
    +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CNUIContactActionTypeShare;
    v13 = CNUIContactActionShareActivityType;
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logContactActionType:attributes:", v9, v10);

    objc_msgSend(WeakRetained, "actionDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(WeakRetained, "actionWasCanceled:", *(_QWORD *)(a1 + 32));
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "sourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "action:dismissViewController:sender:", v11, v7, v12);

}

@end
