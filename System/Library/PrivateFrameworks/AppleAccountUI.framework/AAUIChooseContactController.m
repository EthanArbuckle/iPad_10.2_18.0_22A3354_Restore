@implementation AAUIChooseContactController

- (AAUIChooseContactController)init
{
  AAUIChooseContactController *v2;
  AAUIChooseContactController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUIChooseContactController;
  v2 = -[AAUIChooseContactController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AAUIChooseContactController _setupViewController](v2, "_setupViewController");
  return v3;
}

- (AAUIChooseContactController)initWithAccountManager:(id)a3
{
  id v5;
  AAUIChooseContactController *v6;
  AAUIChooseContactController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIChooseContactController;
  v6 = -[AAUIChooseContactController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[AAUIChooseContactController _setupViewController](v6, "_setupViewController");
    objc_storeStrong((id *)&v7->_accountManager, a3);
  }

  return v7;
}

- (UIViewController)chooseContactViewController
{
  return (UIViewController *)self->_autocompleteSearchController;
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Composing contact for address: %@", (uint8_t *)&v9, 0xCu);
  }

  if ((objc_msgSend(v4, "aa_appearsToBeEmail") & 1) != 0)
  {
    v6 = 0;
  }
  else if (objc_msgSend(v4, "aa_appearsToBePhoneNumber"))
  {
    v6 = 1;
  }
  else
  {
    v6 = 5;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", 0, v4, v6);

  return v7;
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v6;
  id v7;
  NSObject *idsStatusAccessQueue;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD block[4];
  id v26;
  id v27;
  id location;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "kind") > 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    idsStatusAccessQueue = self->_idsStatusAccessQueue;
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke;
    block[3] = &unk_1EA2DB728;
    objc_copyWeak(&v27, &location);
    v10 = v7;
    v26 = v10;
    dispatch_async(idsStatusAccessQueue, block);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v11 = self->_idsStatusAccessQueue;
    v14 = v9;
    v15 = 3221225472;
    v16 = __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke_2;
    v17 = &unk_1EA2DB750;
    objc_copyWeak(&v20, &location);
    v19 = &v21;
    v18 = v10;
    dispatch_sync(v11, &v14);
    if (*((_BYTE *)v22 + 24))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor", v14, v15, v16, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

    objc_destroyWeak(&v20);
    _Block_object_dispose(&v21, 8);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "fetchIDSStatusForRecipient:", *(_QWORD *)(a1 + 32));

}

void __70__AAUIChooseContactController_searchController_tintColorForRecipient___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_isHandleReachable:", *(_QWORD *)(a1 + 32));

}

- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4
{
  return (unint64_t)objc_msgSend(a4, "kind", a3) > 1;
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setDelegate:", self);
  -[AAUIChooseContactController chooseContactViewController](self, "chooseContactViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 2)
  {
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRecipients:", v10);

  }
  -[AAUIChooseContactController _prepareNextButton](self, "_prepareNextButton");

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[AAUITrustedContactPickerViewController addressKindAndHandleForSingleAddressContact:](AAUITrustedContactPickerViewController, "addressKindAndHandleForSingleAddressContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D13688]);
  objc_msgSend(v8, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithContact:address:kind:", v6, v10, objc_msgSend(v8, "kind"));

  v13[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setRecipients:](self->_autocompleteSearchController, "setRecipients:", v12);

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "stringValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = 0;
    }
    else
    {
      v9 = 0;
      v10 = 5;
    }
  }
  v11 = objc_alloc(MEMORY[0x1E0D13688]);
  objc_msgSend(v6, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithContact:address:kind:", v12, v9, v10);
  v15[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setRecipients:](self->_autocompleteSearchController, "setRecipients:", v14);

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_setupViewController
{
  NSMutableDictionary *v3;
  NSMutableDictionary *idsReachabilityForRecipientHandle;
  NSMutableDictionary *v5;
  NSMutableDictionary *idsReachabilityForUnifiedOrGroupRecipientHandle;
  NSMutableDictionary *v7;
  NSMutableDictionary *handleToRecipient;
  NSObject *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *idsStatusAccessQueue;
  AAContactsManager *v12;
  AAContactsManager *contactsManager;
  CNAutocompleteSearchController *v14;
  CNAutocompleteSearchController *autocompleteSearchController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  idsReachabilityForRecipientHandle = self->_idsReachabilityForRecipientHandle;
  self->_idsReachabilityForRecipientHandle = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  idsReachabilityForUnifiedOrGroupRecipientHandle = self->_idsReachabilityForUnifiedOrGroupRecipientHandle;
  self->_idsReachabilityForUnifiedOrGroupRecipientHandle = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  handleToRecipient = self->_handleToRecipient;
  self->_handleToRecipient = v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appleaccountui.idsReachabilityAccessQueue", v9);
  idsStatusAccessQueue = self->_idsStatusAccessQueue;
  self->_idsStatusAccessQueue = v10;

  v12 = (AAContactsManager *)objc_alloc_init(MEMORY[0x1E0CFABF8]);
  contactsManager = self->_contactsManager;
  self->_contactsManager = v12;

  v20 = (id)objc_opt_new();
  v14 = (CNAutocompleteSearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13648]), "initWithSearchType:", 1);
  autocompleteSearchController = self->_autocompleteSearchController;
  self->_autocompleteSearchController = v14;

  -[CNAutocompleteSearchController setDelegate:](self->_autocompleteSearchController, "setDelegate:", self);
  objc_msgSend(v20, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSearchController setTitle:](self->_autocompleteSearchController, "setTitle:", v16);

  v17 = (void *)objc_opt_new();
  objc_msgSend(v20, "selectButtonText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:", v18);

  objc_msgSend(v17, "setTarget:", self);
  objc_msgSend(v17, "setAction:", sel__selectionCompleted);
  -[CNAutocompleteSearchController navigationItem](self->_autocompleteSearchController, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRightBarButtonItem:", v17);

  -[AAUIChooseContactController _prepareNextButton](self, "_prepareNextButton");
}

- (void)_prepareNextButton
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  -[CNAutocompleteSearchController recipients](self->_autocompleteSearchController, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 1;

  -[CNAutocompleteSearchController navigationItem](self->_autocompleteSearchController, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)_selectionCompleted
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "Selection is invalid!", v1, 2u);
}

- (BOOL)_isHandleReachable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;

  v4 = a3;
  -[AAUIChooseContactController _idsReachabilityDictionaryForRecipient:](self, "_idsReachabilityDictionaryForRecipient:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || objc_msgSend(v7, "integerValue") == -1)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "BOOLValue");
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AAUIChooseContactController _isHandleReachable:].cold.1(v4, v8, v9);

  return v8;
}

- (id)_idsReachabilityDictionaryForRecipient:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = 24;
  if (!v5)
    v6 = 16;
  v7 = *(id *)((char *)&self->super.isa + v6);

  return v7;
}

- (void)fetchIDSStatusForRecipient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *handleToRecipient;
  void *v18;
  id v19;
  NSObject *v20;
  NSMutableDictionary *v21;
  void *v22;
  AAContactsManager *contactsManager;
  void *v24;
  _QWORD v25[5];
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
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AAUIChooseContactController _idsReachabilityDictionaryForRecipient:](self, "_idsReachabilityDictionaryForRecipient:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v4, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (objc_msgSend(v9, "integerValue") == -1)
          goto LABEL_27;
      }
      else
      {
        objc_msgSend(v4, "address");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &unk_1EA31E800, v10);

      }
      objc_msgSend(v4, "children");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v4, "children");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v30;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v13);
              -[AAUIChooseContactController fetchIDSStatusForRecipient:](self, "fetchIDSStatusForRecipient:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v14);
        }

      }
      handleToRecipient = self->_handleToRecipient;
      objc_msgSend(v4, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](handleToRecipient, "objectForKeyedSubscript:", v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (!v19 || v19 == v4)
      {
        if (v19 && v19 == v4)
          goto LABEL_26;
      }
      else
      {
        _AAUILogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[AAUIChooseContactController fetchIDSStatusForRecipient:].cold.1(v4, (uint64_t)v19, v20);

      }
      v21 = self->_handleToRecipient;
      objc_msgSend(v4, "address");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v4, v22);

      objc_initWeak(&location, self);
      contactsManager = self->_contactsManager;
      objc_msgSend(v4, "address");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke;
      v25[3] = &unk_1EA2DB7C8;
      v25[4] = self;
      objc_copyWeak(&v27, &location);
      v26 = v4;
      -[AAContactsManager idsStatusForHandle:completion:](contactsManager, "idsStatusForHandle:completion:", v24, v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
LABEL_26:

LABEL_27:
    }
  }
  else
  {
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AAUIChooseContactController fetchIDSStatusForRecipient:].cold.2(v4, v5);
  }

}

void __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_2;
  block[3] = &unk_1EA2DB7A0;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  v8 = a2;
  dispatch_async(v4, block);

  objc_destroyWeak(&v7);
}

void __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_idsReachabilityDictionaryForRecipient:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  if (*(_BYTE *)(a1 + 48) && *(_QWORD *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_3;
    v6[3] = &unk_1EA2DB778;
    v7 = WeakRetained;
    v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __58__AAUIChooseContactController_fetchIDSStatusForRecipient___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:forRecipient:", v3, *(_QWORD *)(a1 + 40));

}

- (AAUIChooseContactControllerDelegate)delegate
{
  return (AAUIChooseContactControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_idsStatusAccessQueue, 0);
  objc_storeStrong((id *)&self->_handleToRecipient, 0);
  objc_storeStrong((id *)&self->_idsReachabilityForUnifiedOrGroupRecipientHandle, 0);
  objc_storeStrong((id *)&self->_idsReachabilityForRecipientHandle, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchController, 0);
}

- (void)_isHandleReachable:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = v5;
  v8 = 1024;
  v9 = a2 & 1;
  _os_log_debug_impl(&dword_1DB4ED000, a3, OS_LOG_TYPE_DEBUG, "%{private}@ _isHandleReachable %d", (uint8_t *)&v6, 0x12u);

}

- (void)fetchIDSStatusForRecipient:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478339;
  v8 = v6;
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_1DB4ED000, a3, OS_LOG_TYPE_ERROR, "%{private}@ mismatch in tintColorForRecipient incoming %@ existing %@", (uint8_t *)&v7, 0x20u);

}

- (void)fetchIDSStatusForRecipient:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138477827;
  v5 = v3;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "%{private}@ Missing AA SPI, skipping reachability check", (uint8_t *)&v4, 0xCu);

}

@end
