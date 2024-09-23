@implementation SLMicroBlogComposeViewController

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLComposeServiceViewController loadView](&v4, sel_loadView);
  -[SLComposeServiceViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardType:", 9);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLComposeServiceViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  -[SLMicroBlogComposeViewController updateShortenedURLCost](self, "updateShortenedURLCost");
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginPotentialLocationUse");

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __50__SLMicroBlogComposeViewController_viewDidAppear___block_invoke;
  v10 = &unk_1E7590B60;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x1C3B6C8B8](&v7);
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocationInformationChangedBlock:", v5);

  -[SLMicroBlogComposeViewController updateGeotagStatus](self, "updateGeotagStatus");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__SLMicroBlogComposeViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "noteLocationInfoChanged:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLComposeServiceViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endPotentialLocationUse");

}

- (void)_beginLoadingAccountProfileImages
{
  uint64_t v2;
  NSString *v4;
  id WeakRetained;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  NSString *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id location;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = self->_serviceAccountTypeIdentifier;
  _SLLog(v2, 7, CFSTR("MicroBlog for %@ – _beginLoadingAccountProfileImages"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);
  objc_initWeak(&location, self->_accountViewController);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_accountUserRecords;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16, v4);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "profileImageCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (v12)
        {
          objc_msgSend(v10, "screen_name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          _SLLog(v2, 7, CFSTR("MicroBlog for %@ – fetching profile image for %@"));

          objc_msgSend(v10, "screen_name", v4, v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke;
          v15[3] = &unk_1E7590BB0;
          v16 = v4;
          v17 = v10;
          objc_copyWeak(&v18, &location);
          objc_msgSend(WeakRetained, "fetchProfileImageDataForScreenName:completion:", v13, v15);

          objc_destroyWeak(&v18);
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  objc_destroyWeak(&location);
}

void __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  id v16;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "screen_name");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v6 || v7)
  {
    _SLLog(v3, 7, CFSTR("MicroBlog for %@ – failed to get profile image data for %@ with error %{public}@"));

  }
  else
  {
    v13 = v9;
    _SLLog(v3, 7, CFSTR("MicroBlog for %@ – got profile image data for %@"));

    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v6, v8, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setProfileImageCache:", v11);

    objc_msgSend(*(id *)(a1 + 40), "profileImageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "screen_name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v3, 7, CFSTR("MicroBlog for %@ – built profile image %@ for %@"));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke_2;
    block[3] = &unk_1E7590B88;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v16);
  }

}

void __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didUpdateAccountUserRecord:", *(_QWORD *)(a1 + 32));

}

- (void)_presentAccountPickerController
{
  uint64_t v2;
  SLMicroBlogAccountsTableViewController *v4;
  SLMicroBlogAccountsTableViewController *accountViewController;
  NSString *serviceAccountTypeIdentifier;

  serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
  _SLLog(v2, 7, CFSTR("MicroBlog for %@ – _presentAccountPickerController"));
  v4 = objc_alloc_init(SLMicroBlogAccountsTableViewController);
  accountViewController = self->_accountViewController;
  self->_accountViewController = v4;

  -[SLMicroBlogAccountsTableViewController setSelectionDelegate:](self->_accountViewController, "setSelectionDelegate:", self, serviceAccountTypeIdentifier);
  -[SLMicroBlogComposeViewController _beginLoadingAccountProfileImages](self, "_beginLoadingAccountProfileImages");
  -[SLMicroBlogAccountsTableViewController setAccountUserRecords:](self->_accountViewController, "setAccountUserRecords:", self->_accountUserRecords);
  -[SLMicroBlogAccountsTableViewController setCurrentAccountUserRecord:](self->_accountViewController, "setCurrentAccountUserRecord:", self->_selectedAccountUserRecord);
  -[SLComposeServiceViewController pushConfigurationViewController:](self, "pushConfigurationViewController:", self->_accountViewController);
}

- (void)accountsViewController:(id)a3 didSelectAccountUserRecord:(id)a4
{
  uint64_t v4;
  SLMicroBlogUserRecord *v6;
  SLMicroBlogUserRecord *selectedAccountUserRecord;
  SLMicroBlogUserRecord *v8;
  void *v9;
  id WeakRetained;
  NSString *serviceAccountTypeIdentifier;
  id v12;

  v6 = (SLMicroBlogUserRecord *)a4;
  serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
  _SLLog(v4, 7, CFSTR("MicroBlog for %@ – didSelectAccountUserRecord %@"));
  selectedAccountUserRecord = self->_selectedAccountUserRecord;
  self->_selectedAccountUserRecord = v6;
  v8 = v6;

  -[SLMicroBlogUserRecord screen_name](self->_selectedAccountUserRecord, "screen_name", serviceAccountTypeIdentifier, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeSheetConfigurationItem setValue:](self->_accountConfigurationItem, "setValue:", v9);

  -[NSArray objectAtIndex:](self->_accountIdentifiers, "objectAtIndex:", -[NSArray indexOfObject:](self->_accountUserRecords, "indexOfObject:", v8));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);
  objc_msgSend(WeakRetained, "setActiveAccountIdentifier:", v12);
  -[SLComposeServiceViewController popConfigurationViewController](self, "popConfigurationViewController");

}

- (id)_accountConfigurationItem
{
  uint64_t v2;
  NSArray *accountUserRecords;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  SLComposeSheetConfigurationItem *accountConfigurationItem;
  SLComposeSheetConfigurationItem *v10;
  SLComposeSheetConfigurationItem *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *serviceAccountTypeIdentifier;
  _QWORD v17[4];
  id v18;
  id location;

  accountUserRecords = self->_accountUserRecords;
  if (accountUserRecords)
  {
    v5 = -[NSArray count](accountUserRecords, "count");
    _SLLog(v2, 7, CFSTR("MicroBlog for %@ – got countOfAccounts %d from _accountUserRecords"));
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0C8F2B8], "countOfAccountsWithAccountTypeIdentifier:", self->_serviceAccountTypeIdentifier);
    serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
    _SLLog(v2, 7, CFSTR("MicroBlog for %@ – got countOfAccounts %d from account store cache"));
    if (v5 == -1)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
      objc_msgSend(v6, "updateExistenceCacheOfAccountWithTypeIdentifier:", self->_serviceAccountTypeIdentifier, serviceAccountTypeIdentifier, -1);
      objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", self->_serviceAccountTypeIdentifier);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountsWithAccountType:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "count");

      _SLLog(v2, 7, CFSTR("MicroBlog for %@ – got countOfAccounts %d from account store"));
    }
  }
  accountConfigurationItem = self->_accountConfigurationItem;
  if (v5 < 2)
  {
    self->_accountConfigurationItem = 0;

  }
  else if (!accountConfigurationItem)
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc_init(SLComposeSheetConfigurationItem);
    v11 = self->_accountConfigurationItem;
    self->_accountConfigurationItem = v10;

    SLSocialFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_LABEL_TITLE"), &stru_1E7592238, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeSheetConfigurationItem setTitle:](self->_accountConfigurationItem, "setTitle:", v13);

    -[SLComposeSheetConfigurationItem setValue:](self->_accountConfigurationItem, "setValue:", &stru_1E7592238);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__SLMicroBlogComposeViewController__accountConfigurationItem__block_invoke;
    v17[3] = &unk_1E7590740;
    objc_copyWeak(&v18, &location);
    -[SLComposeSheetConfigurationItem setTapHandler:](self->_accountConfigurationItem, "setTapHandler:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  if (!self->_accountConfigurationItem)
    return 0;
  -[SLMicroBlogUserRecord screen_name](self->_selectedAccountUserRecord, "screen_name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeSheetConfigurationItem setValue:](self->_accountConfigurationItem, "setValue:", v14);

  return self->_accountConfigurationItem;
}

void __61__SLMicroBlogComposeViewController__accountConfigurationItem__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentAccountPickerController");

}

- (void)_performLocationAction
{
  void *v3;

  if (self->_currentPlace)
  {
    -[SLMicroBlogComposeViewController _presentPlaceViewController](self, "_presentPlaceViewController");
  }
  else
  {
    -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGeotagStatus:", 1);

    -[SLMicroBlogComposeViewController setGeotagStatus:](self, "setGeotagStatus:", 1);
  }
}

- (id)_locationConfigurationItem
{
  SLComposeSheetConfigurationItem *locationConfigurationItem;
  SLComposeSheetConfigurationItem *v4;
  SLComposeSheetConfigurationItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  locationConfigurationItem = self->_locationConfigurationItem;
  if (!locationConfigurationItem)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(SLComposeSheetConfigurationItem);
    v5 = self->_locationConfigurationItem;
    self->_locationConfigurationItem = v4;

    SLSocialFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHEET_LOCATION_ACTION_TITLE"), &stru_1E7592238, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeSheetConfigurationItem setTitle:](self->_locationConfigurationItem, "setTitle:", v7);

    SLSocialFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHEET_LOCATION_NO_VALUE"), &stru_1E7592238, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeSheetConfigurationItem setValue:](self->_locationConfigurationItem, "setValue:", v9);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__SLMicroBlogComposeViewController__locationConfigurationItem__block_invoke;
    v11[3] = &unk_1E7590740;
    objc_copyWeak(&v12, &location);
    -[SLComposeSheetConfigurationItem setTapHandler:](self->_locationConfigurationItem, "setTapHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    locationConfigurationItem = self->_locationConfigurationItem;
  }
  return locationConfigurationItem;
}

void __62__SLMicroBlogComposeViewController__locationConfigurationItem__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performLocationAction");

}

- (id)configurationItems
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[SLMicroBlogComposeViewController _accountConfigurationItem](self, "_accountConfigurationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_locationConfigurationItem)
    objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (SLMicroBlogSheetDelegate)microBlogSheetDelegate
{
  return (SLMicroBlogSheetDelegate *)objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);
}

- (void)setMicroBlogSheetDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  NSString *v6;
  NSString *serviceAccountTypeIdentifier;
  _QWORD v8[4];
  id v9;
  SLMicroBlogComposeViewController *v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_microBlogSheetDelegate, v4);
    objc_msgSend(v4, "serviceAccountTypeIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
    self->_serviceAccountTypeIdentifier = v6;

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke;
    v8[3] = &unk_1E7590C00;
    v9 = v4;
    v10 = self;
    objc_msgSend(v9, "fetchSessionInfo:", v8);

  }
}

void __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke_2;
  v10[3] = &unk_1E7590BD8;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  SLMicroBlogUserRecord *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "serviceAccountTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(_QWORD *)(a1 + 48);
  _SLLog(v1, 7, CFSTR("MicroBlog for %@ – fetched session info %@\nand got error %{public}@"));

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("accountEntries"), v3, v26, v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(v5 + 1200);
  v7 = MEMORY[0x1E0C9AA60];
  *(_QWORD *)(v5 + 1200) = MEMORY[0x1E0C9AA60];

  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(v8 + 1208);
  *(_QWORD *)(v8 + 1208) = v7;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v15 = *(void **)(*(_QWORD *)(a1 + 56) + 1208);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "arrayByAddingObject:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 56);
        v19 = *(void **)(v18 + 1208);
        *(_QWORD *)(v18 + 1208) = v17;

        v20 = objc_alloc_init(SLMicroBlogUserRecord);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("accountDescription"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLMicroBlogUserRecord setScreen_name:](v20, "setScreen_name:", v21);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1200), "arrayByAddingObject:", v20);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 56);
        v24 = *(void **)(v23 + 1200);
        *(_QWORD *)(v23 + 1200) = v22;

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("active"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = objc_msgSend(v25, "BOOLValue");

        if ((_DWORD)v21)
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 1216), v20);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 56), "reloadConfigurationItems");
  objc_msgSend(*(id *)(a1 + 56), "_presentNoAccountsAlertIfNecessaryAndReady");

}

- (void)presentationAnimationDidFinish
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);
  objc_msgSend(WeakRetained, "stopDeferringExpensiveOperations");
  -[SLMicroBlogComposeViewController _presentNoAccountsAlertIfNecessaryAndReady](self, "_presentNoAccountsAlertIfNecessaryAndReady");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "ensureUserRecordStore");

}

- (void)_presentNoAccountsAlertIfNecessaryAndReady
{
  uint64_t v2;
  NSArray *accountUserRecords;

  if (-[SLComposeServiceViewController wasPresented](self, "wasPresented"))
  {
    accountUserRecords = self->_accountUserRecords;
    if (accountUserRecords)
    {
      if (!-[NSArray count](accountUserRecords, "count"))
      {
        _SLLog(v2, 7, CFSTR("MicroBlog for %@ – presenting no accounts alert"));
        -[SLMicroBlogComposeViewController presentNoAccountsAlert](self, "presentNoAccountsAlert");
      }
    }
  }
}

- (SLMicroBlogComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SLMicroBlogComposeViewController *v4;
  SLMicroBlogComposeViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLMicroBlogComposeViewController;
  v4 = -[SLComposeServiceViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_shortenedURLCost = 22;
    v4->_maxURLLength = -1;
    -[SLComposeServiceViewController setMaxImageAttachmentSize:](v4, "setMaxImageAttachmentSize:", 307200);
  }
  return v5;
}

- (void)_hostApplicationWillEnterForeground
{
  uint64_t v2;
  void *v4;
  objc_super v5;

  _SLLog(v2, 7, CFSTR("SLMicroBlogComposeViewController _hostApplicationWillEnterForeground"));
  v5.receiver = self;
  v5.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLMicroBlogComposeViewController _hostApplicationWillEnterForeground](&v5, sel__hostApplicationWillEnterForeground);
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginPotentialLocationUse");

}

- (void)_hostApplicationDidEnterBackground
{
  uint64_t v2;
  void *v4;
  objc_super v5;

  _SLLog(v2, 7, CFSTR("SLMicroBlogComposeViewController _hostApplicationDidEnterBackground"));
  v5.receiver = self;
  v5.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLMicroBlogComposeViewController _hostApplicationDidEnterBackground](&v5, sel__hostApplicationDidEnterBackground);
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endPotentialLocationUse");

}

- (int)_charactersRemainingWithText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SLComposeServiceViewController attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[SLMicroBlogComposeViewController characterCountForEnteredText:attachments:](self, "characterCountForEnteredText:attachments:", v4, v5);

  return 140 - (_DWORD)self;
}

- (BOOL)isContentValid
{
  uint64_t v2;
  SLMicroBlogComposeViewController *v3;
  SLMicroBlogComposeViewController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  int64_t maxURLLength;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = self;
  v33 = *MEMORY[0x1E0C80C00];
  if (self->_maxURLLength == -1)
  {
    v15 = 1;
  }
  else
  {
    maxURLLength = self->_maxURLLength;
    _SLLog(v2, 7, CFSTR("_maxURLLength is %i"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = v3;
    -[SLComposeServiceViewController attachments](v3, "attachments", maxURLLength);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v8 = 1;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v10, "type") == 4
            || objc_msgSend(v10, "type") == 5
            || objc_msgSend(v10, "type") == 6
            || objc_msgSend(v10, "type") == 7)
          {
            objc_msgSend(v10, "payload");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "absoluteString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "length");
            v14 = v4->_maxURLLength;

            if (v13 > v14)
              v8 = 0;
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 1;
    }

    v15 = v8 & 1;
    v3 = v4;
  }
  -[SLComposeServiceViewController textView](v3, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
  {

  }
  else
  {
    -[SLComposeServiceViewController attachments](v3, "attachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (!v19)
      v15 = 0;
  }
  -[SLComposeServiceViewController textView](v3, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SLMicroBlogComposeViewController _charactersRemainingWithText:](v3, "_charactersRemainingWithText:", v21);

  if ((int)v22 >= 0)
    v23 = v15;
  else
    v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController setCharactersRemaining:](v3, "setCharactersRemaining:", v24);

  return v23;
}

- (id)completeText:(id)a3 withAttachments:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v16) == 4
          || objc_msgSend(v12, "type") == 5
          || objc_msgSend(v12, "type") == 6
          || objc_msgSend(v12, "type") == 7)
        {
          if (objc_msgSend(v6, "length"))
            objc_msgSend(v6, "appendString:", CFSTR(" "));
          objc_msgSend(v12, "payload");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "absoluteString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (int64_t)_characterCountForText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "characterCountForText:shortenedURLCost:", v4, self->_shortenedURLCost);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_countMediaAttachmentsTowardCharacterCount
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countMediaAttachmentsTowardCharacterCount");

  return v6;
}

- (int)characterCountForEnteredText:(id)a3 attachments:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SLMicroBlogComposeViewController completeText:withAttachments:](self, "completeText:withAttachments:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SLMicroBlogComposeViewController _characterCountForText:](self, "_characterCountForText:", v7);
  if (-[SLMicroBlogComposeViewController _countMediaAttachmentsTowardCharacterCount](self, "_countMediaAttachmentsTowardCharacterCount"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "type", (_QWORD)v15) & 0xFFFFFFFFFFFFFFFCLL) != 4)
            v8 += LODWORD(self->_shortenedURLCost) + 1;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (void)updateShortenedURLCost
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke;
  v5[3] = &unk_1E7590C50;
  v5[4] = self;
  v3 = (void *)MEMORY[0x1C3B6C8B8](v5, a2);
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchCurrentUrlLimits:", v3);

}

void __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke_2;
  v10[3] = &unk_1E7590C28;
  v13 = a2;
  v14 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  _SLLog(v1, 7, CFSTR("updateShortenedURLCost got tcoLength %d maxURLLength %d error %{public}@"));
  if (!*(_QWORD *)(a1 + 32))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1264) = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1272) = *(_QWORD *)(a1 + 56);
  }
  return objc_msgSend(*(id *)(a1 + 40), "validateContent");
}

- (void)_presentPlaceViewController
{
  void *v3;

  if (!self->_isPresentingPlaces)
  {
    -[SLMicroBlogComposeViewController _placeViewController](self, "_placeViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeServiceViewController pushConfigurationViewController:](self, "pushConfigurationViewController:", v3);

    self->_isPresentingPlaces = 1;
  }
}

- (void)updateGeotagStatus
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke;
  v5[3] = &unk_1E7590CA0;
  v5[4] = self;
  v3 = (void *)MEMORY[0x1C3B6C8B8](v5, a2);
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchGeotagStatus:", v3);

}

void __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke(uint64_t a1, int a2)
{
  _QWORD v2[5];
  int v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke_2;
  v2[3] = &unk_1E7590C78;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  _SLLog(v1, 6, CFSTR("Geotag status updated to %i"));
  return objc_msgSend(*(id *)(a1 + 32), "setGeotagStatus:", *(unsigned int *)(a1 + 40));
}

- (id)_placeViewController
{
  SLSheetPlaceViewController *placeViewController;
  SLSheetPlaceViewController *v4;
  void *v5;
  SLSheetPlaceViewController *v6;
  SLSheetPlaceViewController *v7;

  placeViewController = self->_placeViewController;
  if (!placeViewController)
  {
    v4 = [SLSheetPlaceViewController alloc];
    objc_msgSend((id)objc_opt_class(), "serviceBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SLSheetPlaceViewController initWithPlaceDataSource:effectiveBundle:](v4, "initWithPlaceDataSource:effectiveBundle:", 0, v5);
    v7 = self->_placeViewController;
    self->_placeViewController = v6;

    -[SLSheetPlaceViewController setSelectionDelegate:](self->_placeViewController, "setSelectionDelegate:", self);
    -[SLSheetPlaceViewController setSearchEnabled:](self->_placeViewController, "setSearchEnabled:", 0);
    placeViewController = self->_placeViewController;
  }
  return placeViewController;
}

- (void)placeViewController:(id)a3 didSelectPlace:(id)a4
{
  objc_storeStrong((id *)&self->_currentPlace, a4);
}

- (void)placeViewController:(id)a3 willDisappear:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_currentPlace)
  {
    -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValuePending:", 0);

    -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLPlace name](self->_currentPlace, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:", v7);

  }
  else
  {
    -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGeotagStatus:", 0);

    -[SLMicroBlogComposeViewController updateGeotagStatus](self, "updateGeotagStatus");
  }
  self->_isPresentingPlaces = 0;
}

- (void)setGeotagStatus:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SLSocialFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SHEET_LOCATION_NO_VALUE");
      goto LABEL_7;
    case 1:
      -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SLSocialFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LOCATING"), &stru_1E7592238, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:", v11);

      -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      v13 = 1;
      goto LABEL_8;
    case 2:
      if (self->_currentPlace)
      {
        -[SLMicroBlogComposeViewController _placeViewController](self, "_placeViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = self->_currentPlace;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPlaces:", v15);

        objc_msgSend(v14, "setSelectedPlace:", self->_currentPlace);
        -[SLMicroBlogComposeViewController _presentPlaceViewController](self, "_presentPlaceViewController");

      }
      else
      {
        _SLLog(v3, 3, CFSTR("We have SLGeotagStatusYes but no place to display. That's wrong."));
      }
      return;
    case 3:
      -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SLSocialFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SHEET_LOCATION_ACTION_DISALLOWED_VALUE");
LABEL_7:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E7592238, CFSTR("Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:", v16);

      -[SLMicroBlogComposeViewController _locationConfigurationItem](self, "_locationConfigurationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      v13 = 0;
LABEL_8:
      objc_msgSend(v12, "setValuePending:", v13);

      break;
    default:
      return;
  }
}

- (void)noteLocationInfoChanged:(id)a3
{
  uint64_t v3;
  void *v5;
  SLPlace *v6;
  SLPlace *currentPlace;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  _SLLog(v3, 6, CFSTR("noteLocationInfoChanged:%@"));
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("locationGeoString"), v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(SLPlace);
    currentPlace = self->_currentPlace;
    self->_currentPlace = v6;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("locationGeoString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLPlace setName:](self->_currentPlace, "setName:", v8);

    -[SLPlace setIdentifier:](self->_currentPlace, "setIdentifier:", CFSTR("currentPlaceIdentifier"));
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("latitude"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = (void *)v9,
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("longitude")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("latitude"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      -[SLPlace setLatitude:](self->_currentPlace, "setLatitude:");

      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("longitude"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      -[SLPlace setLongitude:](self->_currentPlace, "setLongitude:");

    }
    else
    {
      -[SLPlace setLatitude:](self->_currentPlace, "setLatitude:", -180.0);
      -[SLPlace setLongitude:](self->_currentPlace, "setLongitude:", -180.0);
    }
  }
  objc_msgSend(v15, "objectForKey:", CFSTR("geotagStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogComposeViewController setGeotagStatus:](self, "setGeotagStatus:", objc_msgSend(v14, "intValue"));

}

- (void)_presentMentionsViewControllerWithSearchString:(id)a3
{
  uint64_t v3;
  id v5;
  SLMicroBlogMentionsViewController *v6;
  void *v7;
  SLMicroBlogMentionsViewController *v8;
  SLMicroBlogMentionsViewController *mentionsViewController;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("_presentMentionsViewController"));
  v6 = [SLMicroBlogMentionsViewController alloc];
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SLMicroBlogMentionsViewController initWithSheetDelegate:](v6, "initWithSheetDelegate:", v7);
  mentionsViewController = self->_mentionsViewController;
  self->_mentionsViewController = v8;

  -[SLMicroBlogMentionsViewController setDelegate:](self->_mentionsViewController, "setDelegate:", self);
  -[SLMicroBlogMentionsViewController setSearchString:](self->_mentionsViewController, "setSearchString:", v5);

  -[SLComposeServiceViewController setAutoCompletionViewController:](self, "setAutoCompletionViewController:", self->_mentionsViewController);
}

- (void)_presentMentionsViewControllerIfApplicableForSearchString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke;
  v7[3] = &unk_1E7590CF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "recordsMatchingPrefixString:completion:", v6, v7);

}

uint64_t __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(a2, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke_2;
    v5[3] = &unk_1E7590CC8;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
  return 0;
}

void __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_mentionsSearchString");
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176);
  v7 = (id)v3;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  _SLLog(v1, 7, CFSTR("Mentions got initial recordsMatchingPrefixString: '%@' response. latestMentionsString '%@' _mentionsViewController %@"));
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176))
  {
    if (objc_msgSend(v7, "length", v4, v5, v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentMentionsViewControllerWithSearchString:", *(_QWORD *)(a1 + 40));
      if ((objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "setSearchString:", v7);
    }
  }

}

- (void)_dismissMentionsViewController
{
  SLMicroBlogMentionsViewController *mentionsViewController;

  mentionsViewController = self->_mentionsViewController;
  self->_mentionsViewController = 0;

  -[SLComposeServiceViewController setAutoCompletionViewController:](self, "setAutoCompletionViewController:", 0);
}

- (void)mentionsViewController:(id)a3 finishedWithResult:(id)a4
{
  if (a4)
    -[SLMicroBlogComposeViewController applyMention:](self, "applyMention:", a4);
  -[SLMicroBlogComposeViewController _dismissMentionsViewController](self, "_dismissMentionsViewController", a3);
}

- (void)applyMention:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t mentionStartLocation;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[SLComposeServiceViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = v7;

  -[SLComposeServiceViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  mentionStartLocation = self->_mentionStartLocation;
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", mentionStartLocation, v6 + v8 - mentionStartLocation, v4);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v4, "length");
  v13 = v12 + mentionStartLocation;
  -[SLComposeServiceViewController textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  -[SLComposeServiceViewController textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelectedRange:", v13, 0);

  -[SLComposeServiceViewController validateContent](self, "validateContent");
}

- (id)_mentionsSearchString
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t mentionStartLocation;
  __CFString *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  -[SLComposeServiceViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v6 = v5;

  mentionStartLocation = self->_mentionStartLocation;
  if (v4 >= mentionStartLocation)
  {
    v9 = v6 + v4 - mentionStartLocation;
    -[SLComposeServiceViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringWithRange:", mentionStartLocation, v9);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E7592238;
  }
  return v8;
}

- (void)didSelectPost
{
  uint64_t v2;
  SLMicroBlogStatus *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLComposeServiceViewController didSelectPost](&v24, sel_didSelectPost);
  v4 = objc_alloc_init(SLMicroBlogStatus);
  -[SLComposeServiceViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController attachments](self, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogComposeViewController completeText:withAttachments:](self, "completeText:withAttachments:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogStatus setStatusText:](v4, "setStatusText:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SLComposeServiceViewController attachments](self, "attachments", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v16, "type"))
        {
          if (objc_msgSend(v16, "type") != 2)
            continue;
          objc_msgSend(v16, "payload");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = v10;
LABEL_12:
            objc_msgSend(v18, "addObject:", v17);
          }
        }
        else
        {
          objc_msgSend(v16, "payload");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = v9;
            goto LABEL_12;
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v13);
  }

  -[SLMicroBlogStatus setImageData:](v4, "setImageData:", v9);
  -[SLMicroBlogStatus setImageAssetURLs:](v4, "setImageAssetURLs:", v10);
  -[SLMicroBlogComposeViewController microBlogSheetDelegate](self, "microBlogSheetDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendStatus:completion:", v4, &__block_literal_global_3);

  if (!-[SLMicroBlogComposeViewController _hostProcessIdentifier](self, "_hostProcessIdentifier"))
  {
    _SLLog(v2, 6, CFSTR("hostPid is 0 - obtaining pid of current process instead"));
    getpid();
  }

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v18;
  void *v19;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "markedTextRange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = length;
  _SLLog(v5, 7, CFSTR("SLMicroBlogComposeViewController textView:shouldChangeInRange: %d %d replacementText: %@ (markedTextRange %@)"));

  if (!self->_mentionsViewController)
  {
    v13 = 0;
    if (location)
    {
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v10, "markedTextRange", location, v18, v11, v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;
      }
      if (location != 0x7FFFFFFFFFFFFFFFLL)

    }
    if (v13)
    {
      objc_msgSend(v10, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (location - 1 < objc_msgSend(v14, "length"))
      {
        objc_msgSend(v14, "substringWithRange:", location - 1, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("@")) && objc_msgSend(v11, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "characterIsMember:", objc_msgSend(v11, "characterAtIndex:", 0)))
          {
            self->_mentionStartLocation = location;
            self->_mentionPendingStart = 1;
            _SLLog(v5, 7, CFSTR("SLMicroBlogComposeViewController setting _mentionPendingStart to YES"));
          }

        }
      }

    }
  }

  return 1;
}

- (void)textViewDidChange:(id)a3
{
  uint64_t v3;
  SLMicroBlogMentionsViewController *mentionsViewController;
  _BOOL8 mentionPendingStart;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  mentionsViewController = self->_mentionsViewController;
  mentionPendingStart = self->_mentionPendingStart;
  v7 = a3;
  objc_msgSend(v7, "markedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLMicroBlogComposeViewController textViewDidChange: _mentionsViewController %lx _mentionPendingStart %d (markedTextRange %@)"));

  v11.receiver = self;
  v11.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLComposeServiceViewController textViewDidChange:](&v11, sel_textViewDidChange_, v7, mentionsViewController, mentionPendingStart, v10);
  objc_msgSend(v7, "markedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!self->_mentionsViewController && self->_mentionPendingStart)
    {
      -[SLMicroBlogComposeViewController _mentionsSearchString](self, "_mentionsSearchString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLMicroBlogComposeViewController _presentMentionsViewControllerIfApplicableForSearchString:](self, "_presentMentionsViewControllerIfApplicableForSearchString:", v9);

    }
    self->_mentionPendingStart = 0;
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  v5 = a3;
  v6 = objc_msgSend(v5, "selectedRange");
  objc_msgSend(v5, "selectedRange");
  v8 = v7;
  objc_msgSend(v5, "markedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLMicroBlogComposeViewController textViewDidChangeSelection to %d %d (markedTextRange %@)"));

  if (self->_mentionsViewController)
  {
    objc_msgSend(v5, "markedTextRange", v6, v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__SLMicroBlogComposeViewController_textViewDidChangeSelection___block_invoke;
      block[3] = &unk_1E7590248;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

void __63__SLMicroBlogComposeViewController_textViewDidChangeSelection___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[147])
  {
    objc_msgSend(v2, "_mentionsSearchString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v3 = objc_msgSend(v5, "rangeOfString:", CFSTR(" "));
      v4 = *(id **)(a1 + 32);
      if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v4[147], "setSearchString:", v5);
LABEL_8:

        return;
      }
    }
    else
    {
      v4 = *(id **)(a1 + 32);
    }
    objc_msgSend(v4, "_dismissMentionsViewController");
    goto LABEL_8;
  }
}

+ (id)serviceBundle
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPlace, 0);
  objc_storeStrong((id *)&self->_placeViewController, 0);
  objc_storeStrong((id *)&self->_accountViewController, 0);
  objc_storeStrong((id *)&self->_locationConfigurationItem, 0);
  objc_storeStrong((id *)&self->_accountConfigurationItem, 0);
  objc_storeStrong((id *)&self->_selectedAccountUserRecord, 0);
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountUserRecords, 0);
  objc_storeStrong((id *)&self->_mentionsViewController, 0);
  objc_storeStrong((id *)&self->_serviceAccountTypeIdentifier, 0);
  objc_destroyWeak((id *)&self->_microBlogSheetDelegate);
}

@end
