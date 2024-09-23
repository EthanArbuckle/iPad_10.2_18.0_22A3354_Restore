@implementation _SFAccountTableViewController

- (_SFAccountTableViewController)initWithSiteMetadataManager:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  _SFAccountTableViewController *v8;
  _SFAccountTableViewController *v9;
  uint64_t v10;
  NSCountedSet *visibleDomains;
  uint64_t v12;
  _ASPasswordManagerIconController *iconController;
  void *v14;
  void *v15;
  _SFAccountTableViewController *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFAccountTableViewController;
  v8 = -[_SFAccountTableViewController initWithStyle:](&v18, sel_initWithStyle_, +[_SFAccountManagerAppearanceValues preferencesTableViewStyle](_SFAccountManagerAppearanceValues, "preferencesTableViewStyle"));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a4);
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    visibleDomains = v9->_visibleDomains;
    v9->_visibleDomains = (NSCountedSet *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92670]), "initWithMetadataManager:", v6);
    iconController = v9->_iconController;
    v9->_iconController = (_ASPasswordManagerIconController *)v12;

    -[_ASPasswordManagerIconController setDelegate:](v9->_iconController, "setDelegate:", v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel__applicationWillTerminate, *MEMORY[0x1E0DC4870], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel__applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

    v16 = v9;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_ASPasswordManagerIconController prepareForApplicationTermination](self->_iconController, "prepareForApplicationTermination");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4870], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5318], 0);

  v4.receiver = self;
  v4.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  UISearchController *v4;
  UISearchController *searchController;
  UISearchController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController viewDidLoad](&v14, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);

  if (-[_SFAccountTableConfiguration shouldShowSearchBar](self->_configuration, "shouldShowSearchBar"))
  {
    v4 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
    searchController = self->_searchController;
    self->_searchController = v4;

    -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
    -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
    -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
    v6 = self->_searchController;
    -[_SFAccountTableViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSearchController:", v6);

    -[_SFAccountTableViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidesSearchBarWhenScrolling:", 0);

    -[UISearchController searchBar](self->_searchController, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "setAutocapitalizationType:", 0);
    objc_msgSend(v9, "setAutocorrectionType:", 1);
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Passwords List Search Bar"));

  }
  -[_SFAccountTableViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredSearchBarPlacement:", 2);

  -[_SFAccountTableViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStyle:", 0);

  v12 = -[_SFAccountTableConfiguration shouldConfigureMultipleSelectionDuringEditing](self->_configuration, "shouldConfigureMultipleSelectionDuringEditing");
  -[_SFAccountTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsMultipleSelectionDuringEditing:", v12);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[_ASPasswordManagerIconController performMaintenanceWork](self->_iconController, "performMaintenanceWork");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_ASPasswordManagerIconController clearIconFetchingState](self->_iconController, "clearIconFetchingState");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (-[UISearchController isActive](self->_searchController, "isActive"))
  {
    if (-[_SFAccountTableViewController _shouldShowToolbarWhenSearching](self, "_shouldShowToolbarWhenSearching"))
    {
      -[_SFAccountTableViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setToolbarHidden:animated:", 0, 0);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[_SFAccountTableViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:animated:", 1, v3);

}

- (void)_applicationWillTerminate
{
  -[_ASPasswordManagerIconController prepareForApplicationTermination](self->_iconController, "prepareForApplicationTermination");
}

- (void)_applicationDidEnterBackground
{
  -[_ASPasswordManagerIconController prepareForApplicationTermination](self->_iconController, "prepareForApplicationTermination");
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountTableViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    -[_SFAccountTableViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibleViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 0, 0);

    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFAccountTableViewController;
  -[_SFAccountTableViewController setEditing:animated:](&v8, sel_setEditing_animated_);
  if (!-[_SFAccountTableConfiguration shouldConfigureMultipleSelectionDuringEditing](self->_configuration, "shouldConfigureMultipleSelectionDuringEditing"))
  {
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setEnabled:animated:", !v5, v4);

  }
}

- (NSString)searchQuery
{
  void *v2;
  void *v3;

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSearchQuery:(id)a3
{
  UISearchController *searchController;
  id v4;
  id v5;

  searchController = self->_searchController;
  v4 = a3;
  -[UISearchController searchBar](searchController, "searchBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (BOOL)_hasMarkedText
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_shareSavedAccount:(id)a3 modalPresentationSourceView:(id)a4
{
  id v6;
  id v7;
  _SFAirDropAccountSharingAuthenticationContext *v8;
  id v9;
  _SFAirDropAccountSharingAuthenticationContext *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _SFAirDropAccountSharingAuthenticationContext *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = -[_SFAirDropAccountSharingAuthenticationContext initWithSavedAccount:]([_SFAirDropAccountSharingAuthenticationContext alloc], "initWithSavedAccount:", v6);
  self->_isOneTimeSharingAccount = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke;
  v12[3] = &unk_1E4ABF9B8;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  +[_SFSettingsAuthentication authenticateForSettings:allowAuthenticationReuse:completionHandler:](_SFSettingsAuthentication, "authenticateForSettings:allowAuthenticationReuse:completionHandler:", v10, 0, v12);

}

- (void)_shareSavedAccount:(id)a3 authenticationContext:(id)a4 modalPresentationSourceView:(id)a5
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
  _QWORD v17[4];
  id v18;
  _SFAccountTableViewController *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(a4, "hasBeenAuthenticated"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A068]), "initWithSavedPassword:", v8);
    v11 = objc_alloc(MEMORY[0x1E0CEA2D8]);
    objc_msgSend(v10, "urlRepresentationForAirDrop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithActivityItems:applicationActivities:", v13, 0);

    v20 = *MEMORY[0x1E0CEB1B0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIncludedActivityTypes:", v15);

    objc_msgSend(v14, "setExcludedActivityCategories:", 3);
    objc_msgSend(v14, "setModalPresentationStyle:", 7);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __102___SFAccountTableViewController__shareSavedAccount_authenticationContext_modalPresentationSourceView___block_invoke;
    v17[3] = &unk_1E4ABF9E0;
    v18 = v8;
    v19 = self;
    objc_msgSend(v14, "setCompletionWithItemsHandler:", v17);
    objc_msgSend(v14, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPermittedArrowDirections:", 1);
    objc_msgSend(v9, "bounds");
    objc_msgSend(v16, "setSourceRect:");
    objc_msgSend(v16, "setSourceView:", v9);
    -[_SFAccountTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
}

- (BOOL)_shouldShowToolbarWhenSearching
{
  return 1;
}

- (id)_allSharedCredentialGroupsMenuForSavedAccount:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  void *v36;
  id v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  char v46;
  id location;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = objc_msgSend(v4, "isSavedInPersonalKeychain");
  _WBSLocalizedString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke;
  v43[3] = &unk_1E4ABFA08;
  v28 = &v45;
  objc_copyWeak(&v45, &location);
  v46 = v5;
  v8 = v4;
  v44 = v8;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v29, v7, 0, v43);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setState:", v5);
  if ((v5 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore", &v45),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "_canMoveSavedAccount:toGroupWithID:", v8, *MEMORY[0x1E0D8B1A0]),
        v9,
        (v10 & 1) == 0))
  {
    objc_msgSend(v30, "setAttributes:", 1, v28);
  }
  objc_msgSend(v33, "addObject:", v30);
  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cachedGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v13)
  {
    v32 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v8, "sharedGroupID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "groupID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        v19 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v15, "displayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke_2;
        v34[3] = &unk_1E4ABFA30;
        objc_copyWeak(&v37, &location);
        v38 = v18;
        v22 = v8;
        v35 = v22;
        v36 = v15;
        objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v34);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setState:", v18);
        if ((v18 & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v15, "groupID"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v26 = objc_msgSend(v24, "_canMoveSavedAccount:toGroupWithID:", v22, v25),
              v25,
              v24,
              (v26 & 1) == 0))
        {
          objc_msgSend(v23, "setAttributes:", 1);
        }
        objc_msgSend(v33, "addObject:", v23);

        objc_destroyWeak(&v37);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v13);
  }

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

  return v33;
}

- (id)_contextMenuForSavedAccountAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  id v27;
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
  id *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  id location;
  void *v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFAccountTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "savedAccount");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke;
    v76[3] = &unk_1E4ABFA58;
    v11 = v6;
    v77 = v11;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v10, 0, v76);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);

    if ((objc_msgSend(v56, "credentialTypes") & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_2;
      v74[3] = &unk_1E4ABFA58;
      v75 = v11;
      objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v74);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v16);

    }
    if (objc_msgSend(v11, "safari_hasOneTimeCodeGenerator"))
    {
      v17 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_3;
      v72[3] = &unk_1E4ABFA58;
      v73 = v11;
      objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v18, v19, 0, v72);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v20);

    }
    if (objc_msgSend(v11, "safari_hasWebsite"))
    {
      v21 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_4;
      v70[3] = &unk_1E4ABFA58;
      v71 = v11;
      objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v22, v23, 0, v70);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v24);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isOngoingCredentialSharingEnabled")
      && -[_SFAccountTableConfiguration supportsOngoingCredentialSharing](self->_configuration, "supportsOngoingCredentialSharing")&& objc_msgSend(v56, "canUserEditSavedAccount")&& objc_msgSend(v56, "isCurrentUserOriginalContributor"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0DC36F8];
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_5;
      v67[3] = &unk_1E4ABFA80;
      objc_copyWeak(&v69, &location);
      v27 = v56;
      v68 = v27;
      objc_msgSend(v26, "elementWithUncachedProvider:", v67);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v28);

      v29 = (void *)MEMORY[0x1E0DC39D0];
      v30 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.circle"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_6;
      v64[3] = &unk_1E4ABFAA8;
      v52 = &v66;
      objc_copyWeak(&v66, &location);
      v65 = v27;
      objc_msgSend(v30, "actionWithTitle:image:identifier:handler:", v54, v53, 0, v64);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v33);

      v34 = (void *)MEMORY[0x1E0DC39D0];
      _WBSLocalizedString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "menuWithTitle:image:identifier:options:children:", v35, v36, 0, 0, v55);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v37);

      objc_destroyWeak(&v66);
      objc_destroyWeak(&v69);

    }
    if (-[_SFAccountTableConfiguration supportsShare](self->_configuration, "supportsShare", v52)
      && objc_msgSend(v56, "isOneTimeSharable"))
    {
      v38 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_7;
      v60[3] = &unk_1E4ABFAD0;
      objc_copyWeak(&v63, &location);
      v61 = v56;
      v62 = v11;
      objc_msgSend(v38, "actionWithTitle:image:identifier:handler:", v39, v40, 0, v60);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v41);

      objc_destroyWeak(&v63);
    }
    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v25);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v42);

    }
    if (-[_SFAccountTableViewController _shouldShowDeleteContextMenuItemForSavedAccount:](self, "_shouldShowDeleteContextMenuItemForSavedAccount:", v56))
    {
      v43 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_8;
      v57[3] = &unk_1E4ABFAA8;
      objc_copyWeak(&v59, &location);
      v58 = v4;
      objc_msgSend(v43, "actionWithTitle:image:identifier:handler:", v44, v45, 0, v57);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "setAttributes:", 2);
      v47 = (void *)MEMORY[0x1E0DC39D0];
      v79 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v49);

      objc_destroyWeak(&v59);
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E4AC8470, v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&location);
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (BOOL)_shouldShowDeleteContextMenuItemForSavedAccount:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (!-[_SFAccountTableConfiguration supportsDelete](self->_configuration, "supportsDelete")
    || -[_SFAccountTableConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields")|| objc_msgSend(v4, "isRecentlyDeleted")&& !objc_msgSend(v4, "isCurrentUserOriginalContributor"))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "canUserEditSavedAccount");
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EE76A448);
  v7 = v11;
  if (v6)
  {
    v8 = v11;
    objc_msgSend(v8, "savedAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "highLevelDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_SFAccountTableViewController _updateIconForDomain:forCell:](self, "_updateIconForDomain:forCell:", v10, v8);
      -[NSCountedSet addObject:](self->_visibleDomains, "addObject:", v10);
    }

    v7 = v11;
  }

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "savedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "highLevelDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[NSCountedSet removeObject:](self->_visibleDomains, "removeObject:", v9);

    v7 = v10;
  }

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  v10 = objc_msgSend(v7, "isEditing");

  if ((v10 & 1) != 0)
  {
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC36B8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91___SFAccountTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v14[3] = &unk_1E4ABFAF8;
  objc_copyWeak(&v16, &location);
  v15 = v8;
  objc_msgSend(v11, "configurationWithIdentifier:previewProvider:actionProvider:", v15, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_6:

  return v12;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFAccountTableViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v7, v8);

}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v5;

  if (!-[_SFAccountTableViewController _hasMarkedText](self, "_hasMarkedText", a3, a4))
  {
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setEnabled:animated:", 0, 1);

  }
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v4;

  -[UISearchController searchBar](self->_searchController, "searchBar", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setEnabled:animated:", 1, 0);

}

- (void)iconDidUpdateForDomain:(id)a3 iconController:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    v11 = 1752392040;
    v12 = 2117;
    v13 = v5;
    _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Icon did update; domain=%{sensitive, mask.hash}@",
      buf,
      0x16u);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71___SFAccountTableViewController_iconDidUpdateForDomain_iconController___block_invoke;
  v8[3] = &unk_1E4ABFB20;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

- (void)_updateIconForDomain:(id)a3 forCell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[_ASPasswordManagerIconController iconForDomain:](self->_iconController, "iconForDomain:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
  v8 = v7;
  objc_msgSend(v7, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
  if (v10 == v14 && v12 == v13)
    goto LABEL_7;
  v16 = (void *)MEMORY[0x1E0D8A9C8];
  -[_ASPasswordManagerIconController iconForDomain:](self->_iconController, "iconForDomain:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
  objc_msgSend(v16, "resizedImage:withSize:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v18;
  if (v18)
  {
LABEL_7:
    objc_msgSend(v6, "setIcon:", v8);
  }
  else
  {
LABEL_8:
    -[_ASPasswordManagerIconController backgroundColorForDomain:](self->_iconController, "backgroundColorForDomain:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showPlaceholderImageForDomain:backgroundColor:", v19, v8);
  }

}

- (id)iconControllerForAccountDetailViewController:(id)a3
{
  return self->_iconController;
}

- (void)willPresentSearchController:(id)a3
{
  id v4;

  if (-[_SFAccountTableViewController _shouldShowToolbarWhenSearching](self, "_shouldShowToolbarWhenSearching", a3))
  {
    -[_SFAccountTableViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);

  }
}

- (void)willDismissSearchController:(id)a3
{
  id v3;

  -[_SFAccountTableViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToolbarHidden:animated:", 1, 1);

}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *searchPattern;
  uint64_t v7;
  BOOL v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  searchPattern = self->_searchPattern;
  if (!searchPattern)
  {
    v7 = -[NSString length](v11, "length");
    v5 = v11;
    if (!v7)
      goto LABEL_7;
    searchPattern = self->_searchPattern;
  }
  if (v5 != searchPattern)
  {
    v8 = -[NSString isEqualToString:](v5, "isEqualToString:");
    v5 = v11;
    if (!v8)
    {
      v9 = (NSString *)-[NSString copy](v11, "copy");
      v10 = self->_searchPattern;
      self->_searchPattern = v9;

      -[_SFAccountTableViewController searchPatternDidUpdate](self, "searchPatternDidUpdate");
      v5 = v11;
    }
  }
LABEL_7:

}

- (BOOL)shouldSuppressAccountManagerLockedView
{
  return self->_isOneTimeSharingAccount;
}

- (NSString)searchPattern
{
  return self->_searchPattern;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (_ASPasswordManagerIconController)iconController
{
  return self->_iconController;
}

- (void)setIconController:(id)a3
{
  objc_storeStrong((id *)&self->_iconController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_visibleDomains, 0);
}

@end
