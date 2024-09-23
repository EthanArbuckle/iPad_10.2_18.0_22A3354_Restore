@implementation AFUIAutoFillPasswordController

- (AFUIAutoFillPasswordController)initWithDocumentTraits:(id)a3 presentingViewController:(id)a4 textOperationsHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFUIAutoFillPasswordController *v11;
  uint64_t v12;
  RTIDocumentTraits *documentTraits;
  uint64_t v14;
  id textOperationsHandler;
  AFUIAutoFillPasswordController *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AFUIAutoFillPasswordController;
  v11 = -[AFUIAutoFillPasswordController init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    documentTraits = v11->_documentTraits;
    v11->_documentTraits = (RTIDocumentTraits *)v12;

    objc_storeWeak((id *)&v11->_presentingViewController, v9);
    v14 = MEMORY[0x23B803E10](v10);
    textOperationsHandler = v11->_textOperationsHandler;
    v11->_textOperationsHandler = (id)v14;

    v16 = v11;
  }

  return v11;
}

- (void)generateInitialMenu:(id)a3 menuChanged:(id)a4
{
  void *v6;
  id menuChanged;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x23B803E10](a4);
  menuChanged = self->_menuChanged;
  self->_menuChanged = v6;

  if (-[RTIDocumentTraits autofillMode](self->_documentTraits, "autofillMode") == 1)
  {
    -[AFUIAutoFillPasswordController _loadAccountSuggestions:](self, "_loadAccountSuggestions:", v8);
  }
  else
  {
    -[AFUIAutoFillPasswordController _loadOneTimeCodeSuggestions:](self, "_loadOneTimeCodeSuggestions:", v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__reloadOneTimeCodeSuggestions, CFSTR("com.apple.AutoFillCore.AFOneTimeCodeSuggestionsDidChangeNotification"), 0);
  }

}

- (void)_loadAccountSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RTIDocumentTraits *documentTraits;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  documentTraits = self->_documentTraits;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke;
  v10[3] = &unk_2508567D0;
  objc_copyWeak(&v13, &location);
  v8 = v5;
  v11 = v8;
  v9 = v4;
  v12 = v9;
  objc_msgSend(v6, "generateAutoFillSuggestionsWithAutoFillMode:textPrefix:documentTraits:completionHandler:", 1, 0, documentTraits, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE *WeakRetained;
  _BOOL4 v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id obj;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v31 = a2;
  objc_msgSend(v31, "indexesOfObjectsPassingTest:", &__block_literal_global);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v39;
    v6 = *MEMORY[0x24BE0B2B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v8, "usernameAndPasswordPayload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("person.badge.key.fill");
        if (!v10)
          v11 = CFSTR("key.fill");
        v12 = v11;

        v13 = (void *)MEMORY[0x24BEBD388];
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_3;
        v36[3] = &unk_250856780;
        objc_copyWeak(&v37, (id *)(a1 + 48));
        v36[4] = v8;
        objc_msgSend(v13, "actionWithHandler:", v36);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTitle:", v15);

        objc_msgSend(v8, "subTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSubtitle:", v16);

        objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setImage:", v17);

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
        objc_destroyWeak(&v37);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v4);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    WeakRetained[32] = objc_msgSend(obj, "count") != 0;
  v19 = objc_msgSend(obj, "count") == 0;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
    v22 = CFSTR("Passwords…");
  else
    v22 = CFSTR("Other Passwords…");
  objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_250857310, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BEBD388];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_4;
  v34[3] = &unk_2508567A8;
  objc_copyWeak(&v35, (id *)(a1 + 48));
  objc_msgSend(v24, "actionWithHandler:", v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitle:", v23);
  v26 = (void *)MEMORY[0x24BEBD748];
  v42 = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "menuWithTitle:image:identifier:options:children:", &stru_250857310, 0, 0, 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v28);
  v29 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", *(_QWORD *)(a1 + 32));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);

  objc_destroyWeak(&v35);
}

BOOL __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "usernameAndPasswordPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

void __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performTextOperationsWithAccountSuggestion:", *(_QWORD *)(a1 + 32));

}

void __58__AFUIAutoFillPasswordController__loadAccountSuggestions___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showAllPasswordsView");

}

- (void)_loadOneTimeCodeSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RTIDocumentTraits *documentTraits;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  documentTraits = self->_documentTraits;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke;
  v10[3] = &unk_2508567F8;
  objc_copyWeak(&v13, &location);
  v10[4] = self;
  v8 = v5;
  v11 = v8;
  v9 = v4;
  v12 = v9;
  objc_msgSend(v6, "generateAutoFillSuggestionsWithAutoFillMode:textPrefix:documentTraits:completionHandler:", 8, 0, documentTraits, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  _BOOL4 v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id obj;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          WeakRetained = obj;
          goto LABEL_16;
        }
        v7 = (void *)MEMORY[0x24BEBD388];
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_2;
        v28[3] = &unk_250856780;
        objc_copyWeak(&v29, (id *)(a1 + 56));
        v28[4] = v6;
        objc_msgSend(v7, "actionWithHandler:", v28);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTitle:", v9);

        objc_msgSend(v6, "subTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSubtitle:", v10);

        objc_msgSend(*(id *)(a1 + 32), "_menuItemImageForOneTimeCodeSuggestion:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setImage:", v11);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
        objc_destroyWeak(&v29);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v3)
        continue;
      break;
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 33) = objc_msgSend(obj, "count") != 0;
  v13 = objc_msgSend(*((id *)WeakRetained + 3), "autofillMode") == 8;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
    v16 = CFSTR("Passwords & Verification Codes…");
  else
    v16 = CFSTR("Passwords…");
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_250857310, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BEBD388];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_3;
  v26[3] = &unk_2508567A8;
  objc_copyWeak(&v27, (id *)(a1 + 56));
  objc_msgSend(v18, "actionWithHandler:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v17);
  v20 = (void *)MEMORY[0x24BEBD748];
  v34 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "menuWithTitle:image:identifier:options:children:", &stru_250857310, 0, 0, 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
  v23 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", *(_QWORD *)(a1 + 40));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

  objc_destroyWeak(&v27);
LABEL_16:

}

void __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performTextOperationsWithOneTimeCodeSuggestion:", *(_QWORD *)(a1 + 32));

}

void __62__AFUIAutoFillPasswordController__loadOneTimeCodeSuggestions___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showAllPasswordsView");

}

- (void)_reloadOneTimeCodeSuggestions
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__AFUIAutoFillPasswordController__reloadOneTimeCodeSuggestions__block_invoke;
  v3[3] = &unk_250856820;
  objc_copyWeak(&v4, &location);
  -[AFUIAutoFillPasswordController _loadOneTimeCodeSuggestions:](self, "_loadOneTimeCodeSuggestions:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__AFUIAutoFillPasswordController__reloadOneTimeCodeSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _QWORD *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  (*(void (**)(void))(WeakRetained[2] + 16))();

}

- (void)_showAllPasswordsView
{
  AFUIPasswordsController *v3;
  AFUIPasswordsController *passwordsController;
  void *v5;
  AFUIPasswordsController *v6;
  id v7;

  if (!self->_passwordsController)
  {
    v3 = -[AFUIPasswordsController initWithDocumentTraits:]([AFUIPasswordsController alloc], "initWithDocumentTraits:", self->_documentTraits);
    passwordsController = self->_passwordsController;
    self->_passwordsController = v3;

    -[AFUIPasswordsController setPasswordPickerDelegate:](self->_passwordsController, "setPasswordPickerDelegate:", self);
  }
  -[AFUIAutoFillPasswordController modalUIDelegate](self, "modalUIDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordsUIWillBeginForSessionUUID:completion:", 0, 0);

  v6 = self->_passwordsController;
  -[AFUIAutoFillPasswordController presentingViewController](self, "presentingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPasswordsController presentPasswordPickerFromViewController:didFinishAuthenticationBlock:](v6, "presentPasswordPickerFromViewController:didFinishAuthenticationBlock:", v7, 0);

}

- (void)_performTextOperationsWithAccountSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  RTIDocumentTraits *v8;
  void *v9;
  id v10;
  RTIDocumentTraits *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  RTIDocumentTraits *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke;
  v17[3] = &unk_250856870;
  v17[4] = self;
  v6 = v4;
  v18 = v6;
  v7 = (void *)MEMORY[0x23B803E10](v17);
  v8 = self->_documentTraits;
  -[AFUIAutoFillPasswordController modalUIDelegate](self, "modalUIDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_3;
  v13[3] = &unk_250856898;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "authenticationWillBeginForSessionUUID:completion:", 0, v13);

}

void __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "modalUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_2;
  v7[3] = &unk_250856848;
  v10 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "authenticationDidEndForSessionUUID:completion:", 0, v7);

}

void __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 48))
  {
    v5 = objc_alloc_init(MEMORY[0x24BE7ED90]);
    objc_msgSend(*(id *)(a1 + 32), "usernameAndPasswordPayload");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v5, "keyboardOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCustomInfo:", v3);

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16))();
  }
}

void __78__AFUIAutoFillPasswordController__performTextOperationsWithAccountSuggestion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  v6 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "authenticateIfNecessaryForSuggestion:documentTraits:completionHandler:", v5, a1[5], a1[6]);
  else
    objc_msgSend(v4, "shouldAcceptSuggestion:completionHandler:", v5, a1[6]);

}

- (void)_performTextOperationsWithCredential:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BE7ED90];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  -[AFUIAutoFillPasswordController _keyboardDictionaryWithCredential:](self, "_keyboardDictionaryWithCredential:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "keyboardOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomInfo:", v6);

  (*((void (**)(void))self->_textOperationsHandler + 2))();
}

- (void)_performTextOperationsWithOneTimeCodeSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  RTIDocumentTraits *v8;
  void *v9;
  id v10;
  RTIDocumentTraits *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  RTIDocumentTraits *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke;
  v17[3] = &unk_250856870;
  v17[4] = self;
  v6 = v4;
  v18 = v6;
  v7 = (void *)MEMORY[0x23B803E10](v17);
  v8 = self->_documentTraits;
  -[AFUIAutoFillPasswordController modalUIDelegate](self, "modalUIDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_3;
  v13[3] = &unk_250856898;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "authenticationWillBeginForSessionUUID:completion:", 0, v13);

}

void __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "modalUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_2;
  v7[3] = &unk_250856848;
  v10 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "authenticationDidEndForSessionUUID:completion:", 0, v7);

}

void __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "oneTimeCodePayload");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OneTimeCode"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "code");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BEB50A8]);

      v5 = objc_alloc_init(MEMORY[0x24BE7ED90]);
      objc_msgSend(v5, "keyboardOutput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCustomInfo:", v3);

      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16))();
    }

  }
}

void __82__AFUIAutoFillPasswordController__performTextOperationsWithOneTimeCodeSuggestion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x24BE0B3B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  v6 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "authenticateIfNecessaryForSuggestion:documentTraits:completionHandler:", v5, a1[5], a1[6]);
  else
    objc_msgSend(v4, "shouldAcceptSuggestion:completionHandler:", v5, a1[6]);

}

- (id)_menuItemImageForOneTimeCodeSuggestion:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "oneTimeCodePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OneTimeCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "source");
  if (v5 <= 2)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", off_2508568B8[v5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_keyboardDictionaryWithCredential:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_250857310;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BEB50B8]);

  objc_msgSend(v4, "password");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_250857310;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BEB50B0]);

  return v5;
}

- (void)_performTextOperationsWithStringValue:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BE7ED90];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "_assertOrInsertText:documentTraits:", v5, self->_documentTraits);

  (*((void (**)(void))self->_textOperationsHandler + 2))();
}

- (BOOL)hasSuggestions
{
  return self->_hasAccountSuggestions || self->_hasOneTimeCodeSuggestions;
}

- (void)passwordsController:(id)a3 selectedCredential:(id)a4
{
  -[AFUIAutoFillPasswordController _performTextOperationsWithCredential:](self, "_performTextOperationsWithCredential:", a4);
}

- (void)passwordsController:(id)a3 fillUsername:(id)a4
{
  -[AFUIAutoFillPasswordController _performTextOperationsWithStringValue:](self, "_performTextOperationsWithStringValue:", a4);
}

- (void)passwordsController:(id)a3 fillPassword:(id)a4
{
  -[AFUIAutoFillPasswordController _performTextOperationsWithStringValue:](self, "_performTextOperationsWithStringValue:", a4);
}

- (void)passwordsController:(id)a3 fillVerificationCode:(id)a4
{
  -[AFUIAutoFillPasswordController _performTextOperationsWithStringValue:](self, "_performTextOperationsWithStringValue:", a4);
}

- (void)passwordsController:(id)a3 fillText:(id)a4
{
  -[AFUIAutoFillPasswordController _performTextOperationsWithStringValue:](self, "_performTextOperationsWithStringValue:", a4);
}

- (void)passwordsControllerDidFinish:(id)a3
{
  id v3;

  -[AFUIAutoFillPasswordController modalUIDelegate](self, "modalUIDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passwordsUIDidEndForSessionUUID:completion:", 0, 0);

}

- (AFUIModalUIDelegate)modalUIDelegate
{
  return (AFUIModalUIDelegate *)objc_loadWeakRetained((id *)&self->modalUIDelegate);
}

- (void)setModalUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->modalUIDelegate, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->modalUIDelegate);
  objc_storeStrong((id *)&self->_passwordsController, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong(&self->_menuChanged, 0);
  objc_storeStrong(&self->_textOperationsHandler, 0);
}

@end
