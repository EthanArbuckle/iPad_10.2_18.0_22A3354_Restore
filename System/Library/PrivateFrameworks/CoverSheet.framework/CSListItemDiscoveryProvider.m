@implementation CSListItemDiscoveryProvider

- (CSListItemDiscoveryProvider)init
{
  CSListItemDiscoveryProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *discoveryTypeToDiscoverySuggestionAndListItems;
  void *v5;
  uint64_t v6;
  DNDStateService *stateService;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSListItemDiscoveryProvider;
  v2 = -[CSListItemDiscoveryProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    discoveryTypeToDiscoverySuggestionAndListItems = v2->_discoveryTypeToDiscoverySuggestionAndListItems;
    v2->_discoveryTypeToDiscoverySuggestionAndListItems = v3;

    objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:", v2);

    -[CSListItemDiscoveryProvider _prototypeTest_registerRecipe](v2, "_prototypeTest_registerRecipe");
    objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.CoverSheetDiscoveryProvider"));
    v6 = objc_claimAutoreleasedReturnValue();
    stateService = v2->_stateService;
    v2->_stateService = (DNDStateService *)v6;

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](v2->_stateService, "addStateUpdateListener:withCompletionHandler:", v2, 0);
  }
  return v2;
}

- (CSListItemSection)section
{
  return -[CSListItemSection initWithIdentifier:]([CSListItemSection alloc], "initWithIdentifier:", CFSTR("Discovery"));
}

- (unint64_t)itemCount
{
  return -[NSMutableDictionary count](self->_discoveryTypeToDiscoverySuggestionAndListItems, "count");
}

- (void)willPresentPosterSwitcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  -[NSMutableDictionary objectForKey:](self->_discoveryTypeToDiscoverySuggestionAndListItems, "objectForKey:", CFSTR("CSListItemDiscoveryTypeExplorePosters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "discoverySuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", v5, 9);
    objc_msgSend(v6, "logUserEducationSuggestionFeedback:", v7);

    v8 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CSListItemDiscoveryProvider_willPresentPosterSwitcher__block_invoke;
    block[3] = &unk_1E8E2DB38;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __56__CSListItemDiscoveryProvider_willPresentPosterSwitcher__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeDiscoveryOfType:", CFSTR("CSListItemDiscoveryTypeExplorePosters"));
}

- (void)handleRemovedItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_discoveryTypeToDiscoverySuggestionAndListItems, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "discoverySuggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", v11, 3);
          objc_msgSend(v12, "logUserEducationSuggestionFeedback:", v13);

        }
        -[CSListItemDiscoveryProvider _removeDiscoveryOfType:](self, "_removeDiscoveryOfType:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)didReceiveUserEducationSuggestionEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CSListItemDiscoveryProvider *v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__CSListItemDiscoveryProvider_didReceiveUserEducationSuggestionEvent___block_invoke;
  v6[3] = &unk_1E8E2E908;
  objc_copyWeak(&v9, &location);
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__CSListItemDiscoveryProvider_didReceiveUserEducationSuggestionEvent___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(a1[4], "userEducationSuggestion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "_discoveryTypeForSuggestion:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1[4], "userEducationSuggestionEventType");
    if (v5 == 1)
    {
      objc_msgSend(v6, "_handleDismissSuggestion:type:", v3, v4);
    }
    else if (!v5)
    {
      objc_msgSend(v6, "_handleShowSuggestion:type:isPrototyping:", v3, v4, 0);
    }

    WeakRetained = v6;
  }

}

- (void)_handleShowSuggestion:(id)a3 type:(id)a4 isPrototyping:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  CSDiscoveryItemViewController *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  NSObject *v29;
  NSMutableDictionary *discoveryTypeToDiscoverySuggestionAndListItems;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  NSMutableDictionary *v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKey:](self->_discoveryTypeToDiscoverySuggestionAndListItems, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v14 = -[NSMutableDictionary count](self->_discoveryTypeToDiscoverySuggestionAndListItems, "count");
    if (-[NSMutableDictionary count](self->_discoveryTypeToDiscoverySuggestionAndListItems, "count") == 1)
    {
      -[NSMutableDictionary allKeys](self->_discoveryTypeToDiscoverySuggestionAndListItems, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("CSListItemDiscoveryTypeSleepMigration")) & 1) != 0)
      v16 = 1;
    else
      v16 = objc_msgSend(v12, "isEqualToString:", CFSTR("CSListItemDiscoveryTypeCustomizeFocus"));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __72__CSListItemDiscoveryProvider__handleShowSuggestion_type_isPrototyping___block_invoke;
    v35[3] = &unk_1E8E2DB38;
    v17 = v8;
    v36 = v17;
    v18 = (void *)MEMORY[0x1D17E1614](v35);
    v19 = objc_msgSend(v9, "isEqualToString:", CFSTR("CSListItemDiscoveryTypeSleepMigration"));
    if (v14)
      v20 = v16;
    else
      v20 = 1;
    v21 = v20 | v5;
    if (v19 && v21)
    {
      -[CSListItemDiscoveryProvider _sleepMigrationDiscoveryView](self, "_sleepMigrationDiscoveryView");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CSListItemDiscoveryTypeCustomizeFocus")) & v21) != 1)
      {
        v27 = objc_msgSend(v9, "isEqualToString:", CFSTR("CSListItemDiscoveryTypeExplorePosters"));
        v13 = 0;
        if (v14)
          v28 = v5;
        else
          v28 = 1;
        if (v27)
        {
          if (v28)
          {
            -[CSListItemDiscoveryProvider _explorePostersDiscoveryView](self, "_explorePostersDiscoveryView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSListItemDiscoveryProvider _explorePostersDiscoveryItemViewControllerForPlatter:firstDidAppearCompletion:](self, "_explorePostersDiscoveryItemViewControllerForPlatter:firstDidAppearCompletion:", v23, v18);
            v13 = (CSDiscoveryItemViewController *)objc_claimAutoreleasedReturnValue();
            if (v23)
              goto LABEL_23;
          }
        }
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[DNDStateService queryCurrentStateWithError:](self->_stateService, "queryCurrentStateWithError:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "activeModeConfiguration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "mode");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[CSListItemDiscoveryProvider _customizeFocusDiscoveryViewWithDNDSemanticType:](self, "_customizeFocusDiscoveryViewWithDNDSemanticType:", objc_msgSend(v34, "semanticType"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }

LABEL_22:
        v13 = 0;
        if (v23)
        {
LABEL_23:
          SBLogDashBoard();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v9;
            _os_log_impl(&dword_1D0337000, v24, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Will appear.", buf, 0xCu);
          }

          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", v17, 0);
            objc_msgSend(v25, "logUserEducationSuggestionFeedback:", v26);

          }
          if (!v13)
            v13 = -[CSDiscoveryItemViewController initWithPlatterDiscoveryView:firstDidAppearCompletion:]([CSDiscoveryItemViewController alloc], "initWithPlatterDiscoveryView:firstDidAppearCompletion:", v23, v18);
          -[CSListItemDiscoveryProvider _presentPlatterDiscoveryView:discoveryItemViewController:withSuggestion:type:](self, "_presentPlatterDiscoveryView:discoveryItemViewController:withSuggestion:type:", v23, v13, v17, v9);
          goto LABEL_40;
        }
LABEL_36:
        SBLogDashBoard();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          discoveryTypeToDiscoverySuggestionAndListItems = self->_discoveryTypeToDiscoverySuggestionAndListItems;
          *(_DWORD *)buf = 138543618;
          v38 = v9;
          v39 = 2114;
          v40 = discoveryTypeToDiscoverySuggestionAndListItems;
          _os_log_impl(&dword_1D0337000, v29, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Will not show. Other suggestions: %{public}@ ", buf, 0x16u);
        }

        if (!v17)
          goto LABEL_41;
        objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", v17, 5);
        objc_msgSend(v23, "logUserEducationSuggestionFeedback:", v31);

LABEL_40:
LABEL_41:

        goto LABEL_42;
      }
      -[CSListItemDiscoveryProvider _customizeFocusDiscoveryViewWithDNDSemanticType:](self, "_customizeFocusDiscoveryViewWithDNDSemanticType:", objc_msgSend(v17, "modeSemanticType"));
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;
    goto LABEL_22;
  }
  SBLogDashBoard();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v9;
    _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Will not show because this type is currently presented. ", buf, 0xCu);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (CSDiscoveryItemViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", v8, 5);
    objc_msgSend(v12, "logUserEducationSuggestionFeedback:", v13);
LABEL_42:

  }
}

void __72__CSListItemDiscoveryProvider__handleShowSuggestion_type_isPrototyping___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(v2, "logUserEducationSuggestionFeedback:", v3);

  }
  SBLogDashBoard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type:]: Did Appear.", v5, 2u);
  }

}

- (void)_handleDismissSuggestion:(id)a3 type:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    -[CSListItemDiscoveryProvider _removeDiscoveryOfType:](self, "_removeDiscoveryOfType:", v5);
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Dismissed suggestion", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CSListItemDiscoveryProvider _handleDismissSuggestion:type:].cold.1(v6);
  }

}

- (id)_discoveryTypeForSuggestion:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  v4 = 0;
  if (CSFeatureEnabled(0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = CFSTR("CSListItemDiscoveryTypeSleepMigration");
    else
      v4 = 0;
  }
  if (CSFeatureEnabled(0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = CFSTR("CSListItemDiscoveryTypeCustomizeFocus");
  }
  if (CSFeatureEnabled(0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = CFSTR("CSListItemDiscoveryTypeExplorePosters");
  }

  return (id)v4;
}

- (void)_presentPlatterDiscoveryView:(id)a3 discoveryItemViewController:(id)a4 withSuggestion:(id)a5 type:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CSListItem *v14;
  CSDiscoverySuggestionAndListItemTuple *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  CSDiscoverySuggestionAndListItemTuple *v35;
  id v36;
  CSListItemDiscoveryProvider *v37;
  CSListItem *v38;
  id v39;
  uint64_t *v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[CSListItem initWithIdentifier:groupingIdentifier:sectionIdentifier:]([CSListItem alloc], "initWithIdentifier:groupingIdentifier:sectionIdentifier:", v13, v13, CFSTR("Discovery"));
  v28 = objc_alloc_init(MEMORY[0x1E0DC6168]);
  v15 = objc_alloc_init(CSDiscoverySuggestionAndListItemTuple);
  -[CSDiscoverySuggestionAndListItemTuple setListItem:](v15, "setListItem:", v14);
  -[CSDiscoverySuggestionAndListItemTuple setDiscoverySuggestion:](v15, "setDiscoverySuggestion:", v12);
  -[NSMutableDictionary setObject:forKey:](self->_discoveryTypeToDiscoverySuggestionAndListItems, "setObject:forKey:", v15, v13);
  objc_initWeak(location, self);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  objc_msgSend(v10, "defaultAction");
  v27 = v11;
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  if (v43[5])
  {
    v26 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DISCOVERY_LIST_ITEM_OPEN_ACTION_TITLE"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke;
    v33[3] = &unk_1E8E2F270;
    objc_copyWeak(&v41, location);
    v34 = v13;
    v35 = v15;
    v36 = v12;
    v37 = self;
    v38 = v14;
    v40 = &v42;
    v39 = v11;
    objc_msgSend(v26, "actionWithTitle:image:identifier:handler:", v18, 0, 0, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setDefaultAction:", v19);
    objc_destroyWeak(&v41);
    v16 = MEMORY[0x1E0C809B0];
  }
  v20 = (void *)MEMORY[0x1E0CEA2A8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DISCOVERY_LIST_ITEM_CLEAR_ACTION_TITLE"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_2;
  v29[3] = &unk_1E8E2F298;
  objc_copyWeak(&v32, location);
  v23 = v13;
  v30 = v23;
  v24 = v12;
  v31 = v24;
  objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v22, 0, 0, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setClearAction:", v25);
  objc_msgSend(v10, "setUsesBackgroundView:", 0);
  objc_msgSend(v28, "setMaterialRecipe:", objc_msgSend(v10, "materialRecipe"));
  -[CSListItem setConfiguration:](v14, "setConfiguration:", v28);
  -[CSListItem setContentHost:](v14, "setContentHost:", v27);
  -[CSListItemManaging addItem:](self->_itemManager, "addItem:", v14);

  objc_destroyWeak(&v32);
  _Block_object_dispose(&v42, 8);

  objc_destroyWeak(location);
}

void __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "discoveryTypeToDiscoverySuggestionAndListItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);

    if (v5 == v6)
    {
      SBLogDashBoard();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v18 = v8;
        _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: User triggered default action.", buf, 0xCu);
      }

      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", *(_QWORD *)(a1 + 48), 7);
        objc_msgSend(v9, "logUserEducationSuggestionFeedback:", v10);

      }
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(void **)(*(_QWORD *)(a1 + 56) + 24);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_52;
      v15[3] = &unk_1E8E2F248;
      v14 = *(_OWORD *)(a1 + 72);
      v13 = (id)v14;
      v16 = v14;
      objc_msgSend(v12, "item:requestsAuthenticationAndPerformBlock:", v11, v15);

    }
  }

}

uint64_t __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_52(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), "performWithSender:target:", *(_QWORD *)(result + 32), 0);
  return result;
}

void __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_removeDiscoveryOfType:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", *(_QWORD *)(a1 + 40), 3);
    objc_msgSend(v2, "logUserEducationSuggestionFeedback:", v3);

  }
}

- (void)_removeDiscoveryOfType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CSListItemDiscoveryProvider__removeDiscoveryOfType___block_invoke;
  v6[3] = &unk_1E8E2DC00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __54__CSListItemDiscoveryProvider__removeDiscoveryOfType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "discoverySuggestion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      SBLogDashBoard();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v11 = 138543362;
        v12 = v6;
        _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Removing suggestion from list", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CF91A0], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91C8]), "initWithUserEducationSuggestion:feedbackType:", v4, 4);
      objc_msgSend(v7, "logUserEducationSuggestionFeedback:", v8);

    }
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v3, "listItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItem:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

}

- (id)_sleepMigrationDiscoveryView
{
  return objc_alloc_init(CSDiscoveryItemPlatterSleepMigration);
}

- (id)_customizeFocusDiscoveryViewWithDNDSemanticType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  -[DNDStateService queryCurrentStateWithError:](self->_stateService, "queryCurrentStateWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeModeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "semanticType") == a3)
  {
    objc_msgSend(MEMORY[0x1E0D223A0], "onboardingPlatterDiscoveryViewForMode:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);
  }
  else
  {
    SBLogDashBoard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CSListItemDiscoveryProvider _customizeFocusDiscoveryViewWithDNDSemanticType:].cold.1(v9);

    v8 = 0;
  }

  return v8;
}

- (id)_explorePostersDiscoveryView
{
  CSDiscoveryItemExplorePostersPlatterView *v3;

  v3 = objc_alloc_init(CSDiscoveryItemExplorePostersPlatterView);
  -[CSDiscoveryItemExplorePostersPlatterView setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (id)_explorePostersDiscoveryItemViewControllerForPlatter:(id)a3 firstDidAppearCompletion:(id)a4
{
  id v5;
  id v6;
  CSDiscoveryItemExplorePostersViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CSDiscoveryItemExplorePostersViewController initWithPlatter:firstDidAppearCompletion:]([CSDiscoveryItemExplorePostersViewController alloc], "initWithPlatter:firstDidAppearCompletion:", v6, v5);

  return v7;
}

- (void)onboardingPlatter:(id)a3 requestsModalPresentationOfViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  NSMutableDictionary *discoveryTypeToDiscoverySuggestionAndListItems;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a5;
  discoveryTypeToDiscoverySuggestionAndListItems = self->_discoveryTypeToDiscoverySuggestionAndListItems;
  v10 = a6;
  v11 = a4;
  -[NSMutableDictionary objectForKey:](discoveryTypeToDiscoverySuggestionAndListItems, "objectForKey:", CFSTR("CSListItemDiscoveryTypeCustomizeFocus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "listItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CSListItemManaging item:requestsModalPresentationOfViewController:animated:completion:](self->_itemManager, "item:requestsModalPresentationOfViewController:animated:completion:", v13, v11, v6, v10);
}

- (void)onboardingPlatterRequestsDismissal:(id)a3
{
  -[CSListItemDiscoveryProvider _removeDiscoveryOfType:](self, "_removeDiscoveryOfType:", CFSTR("CSListItemDiscoveryTypeCustomizeFocus"));
}

- (void)explorePostersPlatterViewWasTapped:(id)a3
{
  -[CSListItemDiscoveryProvider _removeDiscoveryOfType:](self, "_removeDiscoveryOfType:", CFSTR("CSListItemDiscoveryTypeExplorePosters"));
}

- (void)_prototypeTest_registerRecipe
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0D83038];
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke;
  v7[3] = &unk_1E8E2E868;
  objc_copyWeak(&v8, &location);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke_2;
  v5[3] = &unk_1E8E2E868;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "recipeWithTitle:increaseAction:decreaseAction:", CFSTR("Add Discover Platter"), v7, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTDomain registerTestRecipe:](CSLockScreenDomain, "registerTestRecipe:", v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_prototypeTest_addItem");
    WeakRetained = v2;
  }

}

void __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_prototypeTest_removeItem");
    WeakRetained = v2;
  }

}

- (void)_prototypeTest_addItem
{
  void *v3;
  const __CFString *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_discoveryTypeToDiscoverySuggestionAndListItems, "objectForKey:", CFSTR("CSListItemDiscoveryTypeCustomizeFocus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = CFSTR("CSListItemDiscoveryTypeSleepMigration");
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_discoveryTypeToDiscoverySuggestionAndListItems, "objectForKey:", CFSTR("CSListItemDiscoveryTypeExplorePosters"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v4 = CFSTR("CSListItemDiscoveryTypeCustomizeFocus");
    else
      v4 = CFSTR("CSListItemDiscoveryTypeExplorePosters");
  }
  -[CSListItemDiscoveryProvider _handleShowSuggestion:type:isPrototyping:](self, "_handleShowSuggestion:type:isPrototyping:", 0, v4, 1);
}

- (void)_prototypeTest_removeItem
{
  void *v3;
  id v4;

  if (-[NSMutableDictionary count](self->_discoveryTypeToDiscoverySuggestionAndListItems, "count"))
  {
    -[NSMutableDictionary allKeys](self->_discoveryTypeToDiscoverySuggestionAndListItems, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[CSListItemDiscoveryProvider _handleDismissSuggestion:type:](self, "_handleDismissSuggestion:type:", 0, v4);
  }
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  CSListItemDiscoveryProvider *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeModeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v5;
  objc_msgSend(v5, "previousState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeModeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[NSMutableDictionary allKeys](self->_discoveryTypeToDiscoverySuggestionAndListItems, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    v32 = *(_QWORD *)v35;
    v33 = v8;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16);
        if (v8)
        {
          v18 = objc_msgSend(v11, "semanticType");
          if (v18 == objc_msgSend(v8, "semanticType"))
          {
            -[NSMutableDictionary objectForKey:](self->_discoveryTypeToDiscoverySuggestionAndListItems, "objectForKey:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "discoverySuggestion");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_13;
            }
            v21 = v20;
            v22 = v12;
            v23 = self;
            v24 = v11;
            v25 = objc_msgSend(v8, "semanticType");
            v26 = v14;
            v27 = objc_msgSend(v21, "modeSemanticType");

            v28 = v25 == v27;
            v14 = v26;
            v11 = v24;
            self = v23;
            v12 = v22;
            v15 = v32;
            v8 = v33;
            if (v28)
              goto LABEL_13;
          }
        }
        SBLogDashBoard();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v39 = v17;
          _os_log_impl(&dword_1D0337000, v29, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Removing due to mode change.", buf, 0xCu);
        }

        -[CSListItemDiscoveryProvider _removeDiscoveryOfType:](self, "_removeDiscoveryOfType:", v17);
LABEL_13:
        ++v16;
      }
      while (v14 != v16);
      v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      v14 = v30;
    }
    while (v30);
  }

}

- (CSListItemManaging)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (BOOL)listHasAdditionalContent
{
  return self->_listHasAdditionalContent;
}

- (void)setListHasAdditionalContent:(BOOL)a3
{
  self->_listHasAdditionalContent = a3;
}

- (NSMutableDictionary)discoveryTypeToDiscoverySuggestionAndListItems
{
  return self->_discoveryTypeToDiscoverySuggestionAndListItems;
}

- (void)setDiscoveryTypeToDiscoverySuggestionAndListItems:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryTypeToDiscoverySuggestionAndListItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryTypeToDiscoverySuggestionAndListItems, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_stateService, 0);
}

- (void)_handleDismissSuggestion:(os_log_t)log type:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = 0;
  _os_log_error_impl(&dword_1D0337000, log, OS_LOG_TYPE_ERROR, "[Discovery UI, type: '%{public}@']: Error. System system cannot dismiss from suggestion event. Suggestion isn't currently presented.", (uint8_t *)&v1, 0xCu);
}

- (void)_customizeFocusDiscoveryViewWithDNDSemanticType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0337000, log, OS_LOG_TYPE_ERROR, "[Discovery UI, type: 'CSListItemDiscoveryTypeCustomizeFocus']: Current mode semantic type does not match suggestion's semantic type.", v1, 2u);
}

@end
