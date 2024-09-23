@implementation _SFPerSitePreferencesPopoverViewController

- (_SFPerSitePreferencesPopoverViewController)initWithBrowserDocument:(id)a3 perSitePreferencesVendor:(id)a4
{
  id v6;
  id v7;
  _SFPerSitePreferencesPopoverViewController *v8;
  _SFPerSitePreferencesPopoverViewController *v9;
  void *v10;
  uint64_t v11;
  NSString *domain;
  uint64_t v13;
  NSMutableDictionary *preferenceToValueCache;
  void *v15;
  void *v16;
  void *v17;
  _SFPerSitePreferencesPopoverViewController *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_SFPerSitePreferencesPopoverViewController;
  v8 = -[_SFPerSitePreferencesPopoverViewController initWithStyle:](&v20, sel_initWithStyle_, 2);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_browserDocument, v6);
    objc_msgSend(v6, "URLForPerSitePreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");
    v11 = objc_claimAutoreleasedReturnValue();
    domain = v9->_domain;
    v9->_domain = (NSString *)v11;

    v9->_shouldShowSecurePagePreferences = objc_msgSend(v6, "isSecure");
    v9->_shouldShowLockdownPreference = objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari");
    objc_storeStrong((id *)&v9->_perSitePreferencesVendor, a4);
    -[_SFPerSitePreferencesPopoverViewController _initializePreferences](v9, "_initializePreferences");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    preferenceToValueCache = v9->_preferenceToValueCache;
    v9->_preferenceToValueCache = (NSMutableDictionary *)v13;

    v15 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v9->_domain);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPerSitePreferencesPopoverViewController setTitle:](v9, "setTitle:", v17);

    v18 = v9;
  }

  return v9;
}

- (SFBrowsingAssistantMenuSection)pageMenuSection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *obj;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_preferencesBySections)
    -[_SFPerSitePreferencesPopoverViewController _initializePreferences](self, "_initializePreferences");
  objc_msgSend(MEMORY[0x1E0D4EC00], "websiteSettingsSectionForDomain:", self->_domain);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_preferencesBySections;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "preferences");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __61___SFPerSitePreferencesPopoverViewController_pageMenuSection__block_invoke;
        v14[3] = &unk_1E4AC4A08;
        v14[4] = self;
        objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "settings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setSettings:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return (SFBrowsingAssistantMenuSection *)v3;
}

- (void)_initializePreferences
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *preferencesBySections;
  NSArray *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[_SFPerSitePreferencesPopoverViewController _generalPageSection](self, "_generalPageSection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_shouldShowSecurePagePreferences)
  {
    -[_SFPerSitePreferencesPopoverViewController _securePageSection](self, "_securePageSection", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    preferencesBySections = self->_preferencesBySections;
    self->_preferencesBySections = v6;

  }
  else
  {
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_preferencesBySections;
    self->_preferencesBySections = v8;
  }

}

- (id)_securePageSection
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
  void *v12;
  _SFPerSitePreferencesSection *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPerSitePreferencesVendor sharedUserMediaPermissionController](self->_perSitePreferencesVendor, "sharedUserMediaPermissionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraMediaCapturePreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(v4, "microphoneMediaCapturePreference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[_SFPerSitePreferencesVendor sharedGeolocationPermissionManager](self->_perSitePreferencesVendor, "sharedGeolocationPermissionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geolocationPreference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, self->_domain);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_SFPerSitePreferencesSection initWithTitle:preferences:]([_SFPerSitePreferencesSection alloc], "initWithTitle:preferences:", v12, v3);
  return v13;
}

- (id)_generalPageSection
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
  id WeakRetained;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFPerSitePreferencesSection *v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPerSitePreferencesVendor requestDesktopSitePreferenceManager](self->_perSitePreferencesVendor, "requestDesktopSitePreferenceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDesktopSitePreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[_SFPerSitePreferencesVendor automaticReaderActivationManager](self->_perSitePreferencesVendor, "automaticReaderActivationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readerPreference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[_SFPerSitePreferencesVendor contentBlockersPreferenceManager](self->_perSitePreferencesVendor, "contentBlockersPreferenceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasEnabledContentBlockers"))
  {
    objc_msgSend(v8, "contentBlockersPreference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (self->_shouldShowLockdownPreference)
  {
    -[_SFPerSitePreferencesVendor lockdownModePreferenceManager](self->_perSitePreferencesVendor, "lockdownModePreferenceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lockdownPreference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserDocument);
  v13 = objc_msgSend(WeakRetained, "browserHasMultipleProfiles");

  if (v13)
  {
    -[_SFPerSitePreferencesVendor profilePreferenceManager](self->_perSitePreferencesVendor, "profilePreferenceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profilePreference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v17, self->_domain);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[_SFPerSitePreferencesSection initWithTitle:preferences:]([_SFPerSitePreferencesSection alloc], "initWithTitle:preferences:", v18, v3);
  return v19;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *doneButton;
  id v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFPerSitePreferencesPopoverViewController;
  -[_SFPerSitePreferencesPopoverViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  if (-[_SFPerSitePreferencesPopoverViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
  {
    -[_SFPerSitePreferencesPopoverViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 0;
  }
  else
  {
    doneButton = self->_doneButton;
    if (!doneButton)
    {
      v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v8 = (UIBarButtonItem *)objc_msgSend(v7, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_popoverDoneButtonItem"), self, sel__done_);
      v9 = self->_doneButton;
      self->_doneButton = v8;

      doneButton = self->_doneButton;
    }
    -[_SFPerSitePreferencesPopoverViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = doneButton;
  }
  objc_msgSend(v3, "sf_setPreferredDismissOrDoneButtonItem:", v5);

}

- (void)reloadPreferences
{
  NSMutableDictionary *v3;
  NSMutableDictionary *preferenceToValueCache;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  preferenceToValueCache = self->_preferenceToValueCache;
  self->_preferenceToValueCache = v3;

  -[_SFPerSitePreferencesPopoverViewController _initializePreferences](self, "_initializePreferences");
  -[_SFPerSitePreferencesPopoverViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)_done:(id)a3
{
  -[_SFPerSitePreferencesPopoverViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_indexPathForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v5, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    -[_SFPerSitePreferencesPopoverViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForCell:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v7 = 0;
  }
  return v7;
}

- (void)_presentPrivacyToggledInGuestUserAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[_SFPerSitePreferencesPopoverViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)_setPreferenceValue:(id)a3 forPreference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *domain;
  _QWORD v12[4];
  id v13;
  id v14;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[_SFPerSitePreferencesVendor managerForPreference:](self->_perSitePreferencesVendor, "managerForPreference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", v10, 1, 0, 1);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preferenceToValueCache, "setObject:forKeyedSubscript:", v6, v7);
  objc_initWeak(&from, v8);
  domain = self->_domain;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80___SFPerSitePreferencesPopoverViewController__setPreferenceValue_forPreference___block_invoke;
  v12[3] = &unk_1E4AC4A50;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  objc_msgSend(v8, "setValue:ofPreference:forDomain:completionHandler:", v6, v7, domain, v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (void)_didRetrieveValue:(id)a3 forPreference:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_preferenceToValueCache, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preferenceToValueCache, "setObject:forKeyedSubscript:", v9, v6);
    -[_SFPerSitePreferencesPopoverViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (id)_preferenceRowIndexPathForCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSInteger v8;
  int64_t numberOfValuesInExpandedPreference;
  NSIndexPath *v10;
  NSIndexPath *v11;

  v4 = a3;
  v5 = v4;
  if (self->_expandedRowIndexPath
    && (v6 = objc_msgSend(v4, "section"), v6 == -[NSIndexPath section](self->_expandedRowIndexPath, "section"))
    && (v7 = objc_msgSend(v5, "row"), v8 = -[NSIndexPath row](self->_expandedRowIndexPath, "row"), v7 > v8))
  {
    numberOfValuesInExpandedPreference = self->_numberOfValuesInExpandedPreference;
    if (v7 >= numberOfValuesInExpandedPreference + v8)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7 - numberOfValuesInExpandedPreference, v6);
      v10 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = self->_expandedRowIndexPath;
    }
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

- (id)_preferenceAtIndexPath:(id)a3
{
  NSArray *preferencesBySections;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  preferencesBySections = self->_preferencesBySections;
  v4 = a3;
  -[NSArray objectAtIndexedSubscript:](preferencesBySections, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_preferencesBySections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;
  NSIndexPath *expandedRowIndexPath;

  -[NSArray objectAtIndexedSubscript:](self->_preferencesBySections, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  expandedRowIndexPath = self->_expandedRowIndexPath;
  if (expandedRowIndexPath && -[NSIndexPath section](expandedRowIndexPath, "section") == a4)
    v8 += self->_numberOfValuesInExpandedPreference;
  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_preferencesBySections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSString *domain;
  SFSwitchTableViewCell *v15;
  void *v16;
  void *v17;
  void *v18;
  NSIndexPath *expandedRowIndexPath;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id location;

  v6 = a3;
  v7 = a4;
  -[_SFPerSitePreferencesPopoverViewController _preferenceRowIndexPathForCellAtIndexPath:](self, "_preferenceRowIndexPathForCellAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPerSitePreferencesPopoverViewController _preferenceAtIndexPath:](self, "_preferenceAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:](_SFPerSitePreferencePopoverDisplayInformation, "popoverDisplayInformationForPerSitePreference:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "displayOption");
  -[_SFPerSitePreferencesVendor managerForPreference:](self->_perSitePreferencesVendor, "managerForPreference:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_preferenceToValueCache, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_initWeak(&location, self);
    domain = self->_domain;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v46[3] = &unk_1E4AC4A78;
    objc_copyWeak(&v48, &location);
    v47 = v9;
    objc_msgSend(v12, "getValueOfPreference:forDomain:withTimeout:usingBlock:", v47, domain, 0, v46);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
    v13 = 0;
  }
  if (v11 == 1)
  {
    v43 = v12;
    v44 = v6;
    expandedRowIndexPath = self->_expandedRowIndexPath;
    if (expandedRowIndexPath
      && (v20 = -[NSIndexPath section](expandedRowIndexPath, "section"), v20 == objc_msgSend(v7, "section"))
      && (v21 = objc_msgSend(v7, "row"), v21 > -[NSIndexPath row](self->_expandedRowIndexPath, "row"))
      && (v22 = objc_msgSend(v7, "row"),
          v22 <= self->_numberOfValuesInExpandedPreference + -[NSIndexPath row](self->_expandedRowIndexPath, "row")))
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("expandedMultipleChoiceOptionTableViewCell"));
      v15 = (SFSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = (SFSwitchTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("expandedMultipleChoiceOptionTableViewCell"));
        -[SFSwitchTableViewCell textLabel](v15, "textLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setNumberOfLines:", 0);

        -[SFSwitchTableViewCell imageView](v15, "imageView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setImage:", v33);

        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setPreferredSymbolConfiguration:", v34);

        v6 = v44;
        objc_msgSend(v32, "setHidden:", 1);

      }
      v35 = objc_msgSend(v7, "row");
      v36 = v35 + ~objc_msgSend(v8, "row");
      v37 = 15.0;
      if (v36 != self->_numberOfValuesInExpandedPreference - 1)
        v37 = 44.0;
      -[SFSwitchTableViewCell setSeparatorInset:](v15, "setSeparatorInset:", 0.0, v37, 0.0, 0.0);
      objc_msgSend(v12, "valuesForPreference:", v9);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForValue:inPreference:", v38, v9);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSwitchTableViewCell textLabel](v15, "textLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setText:", v39);

      v41 = objc_msgSend(v13, "isEqual:", v38) ^ 1;
      -[SFSwitchTableViewCell imageView](v15, "imageView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setHidden:", v41);

      v12 = v43;
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("multipleChoiceTableViewCell"));
      v15 = (SFSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = (SFSwitchTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("multipleChoiceTableViewCell"));
        -[SFSwitchTableViewCell setSelectionStyle:](v15, "setSelectionStyle:", 0);
        -[SFSwitchTableViewCell textLabel](v15, "textLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setNumberOfLines:", 0);

      }
      objc_msgSend(v10, "localizedDisplayName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSwitchTableViewCell textLabel](v15, "textLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v24);

      if (v13)
      {
        objc_msgSend(v43, "localizedStringForValue:inPreference:", v13, v9);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = &stru_1E4AC8470;
      }
      -[SFSwitchTableViewCell detailTextLabel](v15, "detailTextLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v26);

      if (v13)
      if (objc_msgSend(v7, "isEqual:", self->_expandedRowIndexPath))
        objc_msgSend(v6, "tintColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v43;
      -[SFSwitchTableViewCell detailTextLabel](v15, "detailTextLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTextColor:", v28);

    }
  }
  else if (v11)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("toggleOptionTableViewCell"));
    v15 = (SFSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = -[SFSwitchTableViewCell initWithReuseIdentifier:]([SFSwitchTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("toggleOptionTableViewCell"));
      -[SFSwitchTableViewCell setDelegate:](v15, "setDelegate:", self);
      -[SFSwitchTableViewCell setSelectionStyle:](v15, "setSelectionStyle:", 0);
      -[SFSwitchTableViewCell textLabel](v15, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNumberOfLines:", 0);

    }
    objc_msgSend(v10, "localizedDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSwitchTableViewCell textLabel](v15, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    if (v13)
      -[SFSwitchTableViewCell setSwitchOn:](v15, "setSwitchOn:", +[_SFPerSitePreferencesUtilities isBinaryPreferenceValueOn:preference:preferenceManager:](_SFPerSitePreferencesUtilities, "isBinaryPreferenceValueOn:preference:preferenceManager:", v13, v9, v12));
  }

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSIndexPath **p_expandedRowIndexPath;
  char v12;
  char v13;
  int *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  NSIndexPath *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  char v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;

  v52 = a3;
  v6 = a4;
  -[_SFPerSitePreferencesPopoverViewController _preferenceRowIndexPathForCellAtIndexPath:](self, "_preferenceRowIndexPathForCellAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPerSitePreferencesPopoverViewController _preferenceAtIndexPath:](self, "_preferenceAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:](_SFPerSitePreferencePopoverDisplayInformation, "popoverDisplayInformationForPerSitePreference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "displayOption");

  if (v10 == 1)
  {
    p_expandedRowIndexPath = &self->_expandedRowIndexPath;
    if (objc_msgSend(v7, "isEqual:", self->_expandedRowIndexPath)
      && (objc_msgSend(v6, "isEqual:", *p_expandedRowIndexPath) & 1) == 0)
    {
      v38 = objc_msgSend(v6, "row");
      v47 = v38 + ~-[NSIndexPath row](*p_expandedRowIndexPath, "row");
      -[_SFPerSitePreferencesVendor managerForPreference:](self->_perSitePreferencesVendor, "managerForPreference:", v8);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "valuesForPreference:", v8);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_numberOfValuesInExpandedPreference + 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((self->_numberOfValuesInExpandedPreference & 0x8000000000000000) == 0)
      {
        v41 = -1;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", ++v41 + objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v42);

        }
        while (v41 < self->_numberOfValuesInExpandedPreference);
      }
      objc_msgSend(v49, "objectAtIndexedSubscript:", v47);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPerSitePreferencesPopoverViewController _setPreferenceValue:forPreference:](self, "_setPreferenceValue:forPreference:", v43, v8);

      v44 = (void *)MEMORY[0x1E0DC3F10];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __80___SFPerSitePreferencesPopoverViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v53[3] = &unk_1E4ABFB20;
      v54 = v52;
      v55 = v40;
      v45 = v40;
      objc_msgSend(v44, "performWithoutAnimation:", v53);

    }
    else
    {
      objc_msgSend(v52, "beginUpdates");
      v12 = -[NSIndexPath isEqual:](*p_expandedRowIndexPath, "isEqual:", v6);
      v13 = v12;
      v14 = &OBJC_IVAR____SFLinkPreviewHeader__hairline;
      v15 = 0x1E0C99000uLL;
      v50 = v8;
      v51 = v6;
      if (*p_expandedRowIndexPath)
      {
        v48 = v12;
        objc_msgSend(v52, "cellForRowAtIndexPath:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v16;
        objc_msgSend(v16, "detailTextLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTextColor:", v17);

        v19 = -[NSIndexPath section](*p_expandedRowIndexPath, "section");
        v20 = -[NSIndexPath row](*p_expandedRowIndexPath, "row");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_numberOfValuesInExpandedPreference >= 1)
        {
          v22 = 0;
          v23 = v20 + 1;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v23 + v22, v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v24);

            ++v22;
          }
          while (v22 < self->_numberOfValuesInExpandedPreference);
        }
        objc_msgSend(v52, "deleteRowsAtIndexPaths:withRowAnimation:", v21, 0);

        v25 = *p_expandedRowIndexPath;
        v8 = v50;
        v15 = 0x1E0C99000;
        v13 = v48;
        v14 = &OBJC_IVAR____SFLinkPreviewHeader__hairline;
      }
      else
      {
        v25 = 0;
      }
      *p_expandedRowIndexPath = 0;

      v26 = v14[58];
      *(Class *)((char *)&self->super.super.super.super.isa + v26) = 0;
      if ((v13 & 1) == 0)
      {
        objc_msgSend(v52, "cellForRowAtIndexPath:", v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "tintColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "detailTextLabel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setTextColor:", v28);

        objc_storeStrong((id *)&self->_expandedRowIndexPath, v7);
        -[_SFPerSitePreferencesVendor managerForPreference:](self->_perSitePreferencesVendor, "managerForPreference:", v8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "valuesForPreference:", v8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(Class *)((char *)&self->super.super.super.super.isa + v26) = (Class)objc_msgSend(v31, "count");

        v32 = -[NSIndexPath section](*p_expandedRowIndexPath, "section");
        v33 = -[NSIndexPath row](*p_expandedRowIndexPath, "row");
        objc_msgSend(*(id *)(v15 + 3560), "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(uint64_t *)((char *)&self->super.super.super.super.isa + v26) >= 1)
        {
          v35 = 0;
          v36 = v33 + 1;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v36 + v35, v32);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v37);

            ++v35;
          }
          while (v35 < *(uint64_t *)((char *)&self->super.super.super.super.isa + v26));
        }
        objc_msgSend(v52, "insertRowsAtIndexPaths:withRowAnimation:", v34, 0);

        v8 = v50;
        v6 = v51;
      }
      objc_msgSend(v52, "endUpdates");
    }
  }

}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[_SFPerSitePreferencesPopoverViewController _preferenceRowIndexPathForCellAtIndexPath:](self, "_preferenceRowIndexPathForCellAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPerSitePreferencesPopoverViewController _preferenceAtIndexPath:](self, "_preferenceAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFPerSitePreferencePopoverDisplayInformation popoverDisplayInformationForPerSitePreference:](_SFPerSitePreferencePopoverDisplayInformation, "popoverDisplayInformationForPerSitePreference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "displayOption");

  return v8 != 0;
}

- (void)switchTableViewCell:(id)a3 didChangeSwitchState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  BOOL v31;
  _QWORD v32[4];
  id v33;

  v4 = a4;
  v6 = a3;
  -[_SFPerSitePreferencesPopoverViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_SFPerSitePreferencesPopoverViewController _preferenceRowIndexPathForCellAtIndexPath:](self, "_preferenceRowIndexPathForCellAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPerSitePreferencesPopoverViewController _preferenceAtIndexPath:](self, "_preferenceAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = WBSIsEqual();

    if (v12)
      v13 = !v4;
    else
      v13 = 0;
    if (v13)
    {
      v16 = (void *)MEMORY[0x1E0DC3450];
      v17 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v18, self->_domain);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v19, v20, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke;
      v32[3] = &unk_1E4AC0010;
      v33 = v6;
      objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:", v25);

      v26 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v24;
      v29[1] = 3221225472;
      v29[2] = __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke_2;
      v29[3] = &unk_1E4AC4AA0;
      v29[4] = self;
      v31 = v4;
      v30 = v10;
      objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 2, v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:", v28);

      -[_SFPerSitePreferencesPopoverViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
    }
    else
    {
      -[_SFPerSitePreferencesVendor managerForPreference:](self->_perSitePreferencesVendor, "managerForPreference:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SFPerSitePreferencesUtilities preferenceValueForBoolValue:preference:preferenceManager:](_SFPerSitePreferencesUtilities, "preferenceValueForBoolValue:preference:preferenceManager:", v4, v10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPerSitePreferencesPopoverViewController _setPreferenceValue:forPreference:](self, "_setPreferenceValue:forPreference:", v15, v10);

    }
  }

}

- (_SFBrowserDocument)browserDocument
{
  return (_SFBrowserDocument *)objc_loadWeakRetained((id *)&self->_browserDocument);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browserDocument);
  objc_storeStrong((id *)&self->_expandedRowIndexPath, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_preferencesBySections, 0);
  objc_storeStrong((id *)&self->_preferenceToValueCache, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesVendor, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
