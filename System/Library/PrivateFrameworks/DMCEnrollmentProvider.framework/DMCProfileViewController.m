@implementation DMCProfileViewController

- (DMCProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4
{
  id v6;
  void *v7;
  DMCProfileViewController *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[DMCProfileViewController initWithProfile:viewMode:profileUIDataProvider:](self, "initWithProfile:viewMode:profileUIDataProvider:", v6, a4, v7);

  return v8;
}

- (DMCProfileViewController)initWithProfile:(id)a3 viewMode:(int64_t)a4 profileUIDataProvider:(id)a5
{
  id v8;
  id v9;
  DMCProfileViewController *v10;
  DMCProfileViewController *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DMCProfileViewController;
  v10 = -[DMCProfileTableViewController initWithStyle:](&v13, sel_initWithStyle_, 2);
  v11 = v10;
  if (v10)
  {
    v10->_profileViewMode = a4;
    objc_storeStrong((id *)&v10->_profileUIDataProvider, a5);
    -[DMCProfileViewController _setup](v11, "_setup");
    -[DMCProfileViewController setProfile:](v11, "setProfile:", v8);
  }

  return v11;
}

- (DMCProfileViewController)initWithMDMProfileForRMAccount
{
  DMCProfileUIDataProvider *v3;
  DMCProfileUIDataProvider *profileUIDataProvider;
  void *v5;
  void *v6;
  DMCProfileViewController *v7;

  v3 = (DMCProfileUIDataProvider *)objc_opt_new();
  profileUIDataProvider = self->_profileUIDataProvider;
  self->_profileUIDataProvider = v3;

  -[DMCProfileUIDataProvider installedMDMProfileIdentifier](self->_profileUIDataProvider, "installedMDMProfileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileUIDataProvider installedProfileWithIdentifier:](self->_profileUIDataProvider, "installedProfileWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMCProfileViewController initWithProfile:viewMode:profileUIDataProvider:](self, "initWithProfile:viewMode:profileUIDataProvider:", v6, 0, self->_profileUIDataProvider);

  return v7;
}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DMCProfileViewController;
  -[DMCProfileTableViewController updateExtendedLayoutIncludesOpaqueBars](&v14, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[DMCProfileViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 15);
  -[DMCProfileViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[DMCProfileSummaryCell cellIdentifier](DMCProfileSummaryCell, "cellIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  -[DMCProfileViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  +[DMCProfileDetailsSummaryCell cellIdentifier](DMCProfileDetailsSummaryCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v7, v8);

  -[DMCProfileViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kMCUIProfileMoreDetailsCellID"));

  -[DMCProfileViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kMCUIElevatedPayloadCellID"));

  -[DMCProfileViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kMCUIButtonCellID"));

  v13.receiver = self;
  v13.super_class = (Class)DMCProfileViewController;
  -[DMCProfileTableViewController reloadTableOnContentSizeCategoryChange](&v13, sel_reloadTableOnContentSizeCategoryChange);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__tableChanged_, CFSTR("kMCUIProfileDidChangeNotification"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCProfileViewController;
  -[DMCProfileViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[DMCProfileViewController rmSpecifierProvider](self, "rmSpecifierProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifiers");

  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
  {
    -[DMCProfileViewController rmSpecifierProviderUserScope](self, "rmSpecifierProviderUserScope");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSpecifiers");

  }
}

- (void)_tableChanged:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__DMCProfileViewController__tableChanged___block_invoke;
  v3[3] = &unk_24D52E7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __42__DMCProfileViewController__tableChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

- (void)_rmConfigsChanged:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__DMCProfileViewController__rmConfigsChanged___block_invoke;
  v3[3] = &unk_24D52E7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__DMCProfileViewController__rmConfigsChanged___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rmSpecifierProvider");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "specifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setRmConfigurationsCount:", objc_msgSend(v2, "count"));

    if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
    {
      objc_msgSend(WeakRetained, "rmSpecifierProviderUserScope");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "specifiers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setRmConfigurationsCountUserScope:", objc_msgSend(v4, "count"));

    }
    objc_msgSend(WeakRetained, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (void)setProfile:(id)a3
{
  id v4;
  void *v5;
  DMCProfileViewModel *v6;
  DMCProfileViewModel *UIProfile;
  DMCProfileViewModel *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  char v17;
  void *v18;
  id v19;

  v19 = a3;
  -[DMCProfileViewModel profile](self->_UIProfile, "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v19;
  if (v4 != v19)
  {
    v6 = -[DMCProfileViewModel initWithProfile:managedPayloads:profileUIDataProvider:]([DMCProfileViewModel alloc], "initWithProfile:managedPayloads:profileUIDataProvider:", v19, -[DMCProfileViewController _showManagedPayloads](self, "_showManagedPayloads"), self->_profileUIDataProvider);
    UIProfile = self->_UIProfile;
    self->_UIProfile = v6;

    -[DMCProfileViewController setProfileExpiry:](self, "setProfileExpiry:", -[DMCProfileViewController _profileExpiryForProfile:](self, "_profileExpiryForProfile:", v19));
    v8 = self->_UIProfile;
    if (v8 && -[DMCProfileViewModel isMDMProfile](v8, "isMDMProfile"))
      v9 = -[DMCProfileUIDataProvider isProvisionallyEnrolled](self->_profileUIDataProvider, "isProvisionallyEnrolled");
    else
      v9 = 0;
    objc_msgSend(v19, "installOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE63E10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (objc_msgSend(v19, "isLocked"))
    {
      objc_msgSend(v19, "removalPasscode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v9 ^ 1;
      if (v13)
        v15 = 0;
      if (((v15 | v12) & 1) != 0)
      {

LABEL_15:
        v16 = 0;
        goto LABEL_16;
      }
      v17 = objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad");

      if ((v17 & 1) != 0)
        goto LABEL_15;
    }
    else if ((v12 & 1) != 0 || (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad") & 1) != 0)
    {
      goto LABEL_15;
    }
    v16 = 1;
LABEL_16:
    -[DMCProfileViewController setProfileRemovable:](self, "setProfileRemovable:", v16);
    -[DMCProfileViewController _setupRMConfigurationsUI](self, "_setupRMConfigurationsUI");
    -[DMCProfileViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadData");

    v5 = v19;
  }

}

- (void)setProfileViewMode:(int64_t)a3
{
  id v4;

  if (self->_profileViewMode != a3)
  {
    self->_profileViewMode = a3;
    -[DMCProfileViewModel setShowManagedPayloads:](self->_UIProfile, "setShowManagedPayloads:", -[DMCProfileViewController _showManagedPayloads](self, "_showManagedPayloads"));
    -[DMCProfileViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (BOOL)_showManagedPayloads
{
  return self->_profileViewMode != 1;
}

- (unint64_t)_profileExpiryForProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(v3, "expiryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && objc_msgSend(v3, "isManagedByProfileService")
    && (v5 = (void *)MEMORY[0x24BDBCE60],
        v6 = v4,
        objc_msgSend(v5, "date"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "compare:", v7),
        v6,
        v7,
        v8 != 1))
  {
    objc_msgSend(v3, "unmodifiedExpiryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "compare:", v12),
          v12,
          v13 == 1))
    {
      v9 = 1;
    }
    else
    {
      v9 = 2;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_delegateCanRemove
{
  void *v2;
  char v3;

  -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_shouldShowRemoveButton
{
  _BOOL4 v3;
  int64_t v4;

  v3 = -[DMCProfileViewController _delegateCanRemove](self, "_delegateCanRemove");
  if (v3)
  {
    v4 = -[DMCProfileViewController profileViewMode](self, "profileViewMode");
    if (v4 == 1)
    {
      if (-[DMCProfileViewController installProfileSource](self, "installProfileSource") == 1
        || -[DMCProfileViewController installProfileSource](self, "installProfileSource") == 2)
      {
        LOBYTE(v3) = !-[DMCProfileViewController installComplete](self, "installComplete");
        return v3;
      }
    }
    else if (v4 == 2)
    {
      LOBYTE(v3) = -[DMCProfileViewController profileRemovable](self, "profileRemovable");
      return v3;
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_removeProfile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[DMCProfileViewController _delegateCanRemove](self, "_delegateCanRemove"))
  {
    -[DMCProfileViewController UIProfile](self, "UIProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("DMCProfileViewController asking delegate to remove profile %@..."), v5);

    -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profileViewControllerDidSelectRemoveProfile:", self);

  }
}

- (BOOL)_delegateCanUpdate
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  char v7;
  void *v8;

  -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0
    && (-[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "profileViewControllerHideUpdateProfile:", self),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

  }
  return v7 & 1;
}

- (BOOL)_shouldShowUpdateButton
{
  unint64_t v3;

  LODWORD(v3) = -[DMCProfileViewController _delegateCanUpdate](self, "_delegateCanUpdate");
  if ((_DWORD)v3)
  {
    v3 = -[DMCProfileViewController profileExpiry](self, "profileExpiry");
    if (v3)
      LOBYTE(v3) = -[DMCProfileViewController profileViewMode](self, "profileViewMode") == 2;
  }
  return v3;
}

- (void)_updateProfile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[DMCProfileViewController _delegateCanUpdate](self, "_delegateCanUpdate"))
  {
    -[DMCProfileViewController UIProfile](self, "UIProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("DMCProfileViewController asking delegate to update profile %@..."), v5);

    -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profileViewControllerDidSelectUpdateProfile:", self);

  }
}

- (BOOL)_delegateCanPoll
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0
    && (-[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "profileViewControllerShouldDisplayPoll:", self),
        v5,
        !v6))
  {
    v8 = 0;
  }
  else
  {
    -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

  }
  return v8 & 1;
}

- (void)_poll
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[DMCProfileViewController _delegateCanPoll](self, "_delegateCanPoll"))
  {
    -[DMCProfileViewController UIProfile](self, "UIProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("DMCProfileViewController asking delegate to poll profile %@..."), v5);

    -[DMCProfileViewController profileViewControllerDelegate](self, "profileViewControllerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profileViewControllerDidSelectPoll:", self);

  }
}

- (BOOL)_profileContainsPayloadClass:(Class)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DMCProfileViewModel profile](self->_UIProfile, "profile", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_profileContainsMDMPayload
{
  return -[DMCProfileViewController _profileContainsPayloadClass:](self, "_profileContainsPayloadClass:", objc_opt_class());
}

- (BOOL)_profileContainsDeclarationsPayload
{
  return -[DMCProfileViewController _profileContainsPayloadClass:](self, "_profileContainsPayloadClass:", objc_opt_class());
}

- (void)_setupRMConfigurationsUI
{
  void *v3;
  RMConfigurationsSpecifierProvider *v4;
  RMConfigurationsSpecifierProvider *rmSpecifierProvider;
  RMConfigurationsSpecifierProvider *v6;
  void *v7;
  void *v8;
  RMConfigurationsSpecifierProvider *v9;
  RMConfigurationsSpecifierProvider *rmSpecifierProviderUserScope;
  RMConfigurationsSpecifierProvider *v11;
  void *v12;
  RMConfigurationsSpecifierProvider *v13;
  RMConfigurationsSpecifierProvider *v14;
  id v15;

  if (self->_profileViewMode != 1
    && (-[DMCProfileViewController _profileContainsMDMPayload](self, "_profileContainsMDMPayload")
     || -[DMCProfileViewController _profileContainsDeclarationsPayload](self, "_profileContainsDeclarationsPayload")))
  {
    -[DMCProfileViewModel profile](self->_UIProfile, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[DMCProfileUIDataProvider rmSpecifierProviderForProfileIdentifier:scope:](self->_profileUIDataProvider, "rmSpecifierProviderForProfileIdentifier:scope:", v15, 1);
    v4 = (RMConfigurationsSpecifierProvider *)objc_claimAutoreleasedReturnValue();
    rmSpecifierProvider = self->_rmSpecifierProvider;
    self->_rmSpecifierProvider = v4;

    v6 = self->_rmSpecifierProvider;
    if (v6)
    {
      -[RMConfigurationsSpecifierProvider specifiers](v6, "specifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_rmConfigurationsCount = objc_msgSend(v7, "count");

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__rmConfigsChanged_, CFSTR("RMConfigurationsSpecifiersDidChangeNotification"), 0);

    }
    if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
    {
      -[DMCProfileUIDataProvider rmSpecifierProviderForProfileIdentifier:scope:](self->_profileUIDataProvider, "rmSpecifierProviderForProfileIdentifier:scope:", v15, 0);
      v9 = (RMConfigurationsSpecifierProvider *)objc_claimAutoreleasedReturnValue();
      rmSpecifierProviderUserScope = self->_rmSpecifierProviderUserScope;
      self->_rmSpecifierProviderUserScope = v9;

      v11 = self->_rmSpecifierProviderUserScope;
      if (v11)
      {
        -[RMConfigurationsSpecifierProvider specifiers](v11, "specifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        self->_rmConfigurationsCountUserScope = objc_msgSend(v12, "count");

      }
    }

  }
  else
  {
    v13 = self->_rmSpecifierProvider;
    self->_rmSpecifierProvider = 0;

    v14 = self->_rmSpecifierProviderUserScope;
    self->_rmSpecifierProviderUserScope = 0;

    self->_rmConfigurationsCount = 0;
    self->_rmConfigurationsCountUserScope = 0;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;

  v6 = a3;
  if (a4 == 1)
  {
    -[DMCProfileViewController UIProfile](self, "UIProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "elevatedPayloadTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    if (-[DMCProfileViewController rmConfigurationsCount](self, "rmConfigurationsCount"))
      ++v10;
    if (-[DMCProfileViewController rmConfigurationsCountUserScope](self, "rmConfigurationsCountUserScope"))
      v9 = v10 + 1;
    else
      v9 = v10;
  }
  else
  {
    if (a4)
    {
      v9 = -[DMCProfileViewController _isSectionPopulated:](self, "_isSectionPopulated:", a4);
      goto LABEL_13;
    }
    -[DMCProfileViewController UIProfile](self, "UIProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "moreDetailsSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      v9 = 3;
    else
      v9 = 2;
  }

LABEL_13:
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "section"))
  {
    case 0:
      -[DMCProfileViewController _tableView:profileCellForRowAtIndexPath:](self, "_tableView:profileCellForRowAtIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      -[DMCProfileViewController _tableView:elevatedPayloadCellForRowAtIndexPath:](self, "_tableView:elevatedPayloadCellForRowAtIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      v9 = CFSTR("DMC_POLL_HRN_TITLE");
      goto LABEL_7;
    case 3:
      v9 = CFSTR("DMC_UPDATE_PROFILE_TITLE");
LABEL_7:
      DMCEnrollmentLocalizedString(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileViewController _tableView:buttonForRowAtIndexPath:text:color:](self, "_tableView:buttonForRowAtIndexPath:text:color:", v6, v7, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 4:
      -[DMCProfileViewController _tableView:removeButtonForRowAtIndexPath:](self, "_tableView:removeButtonForRowAtIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      NSLog(CFSTR("DMCProfileViewController could not build a table cell at indexPath: %@"), v7);
      v8 = objc_opt_new();
LABEL_9:
      v12 = (void *)v8;
LABEL_10:

      return v12;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  DMCProfileDetailsViewController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  DMCRMConfigurationsViewController *v12;
  DMCRMConfigurationsViewController *v13;
  void *v14;
  uint64_t v15;
  DMCRMConfigurationsViewController *v16;
  DMCProfileDetailsViewController *v17;
  DMCProfileDetailsViewController *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  switch(objc_msgSend(v6, "section"))
  {
    case 0:
      if (objc_msgSend(v6, "row") == 2)
      {
        v7 = [DMCProfileDetailsViewController alloc];
        -[DMCProfileViewController UIProfile](self, "UIProfile");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[DMCProfileDetailsViewController initWithProfileViewModel:mode:](v7, "initWithProfileViewModel:mode:", v8, 0);
        goto LABEL_13;
      }
      goto LABEL_16;
    case 1:
      v10 = -[DMCProfileViewController _profileDetailsModeForElevatedPayloadAtIndexPath:](self, "_profileDetailsModeForElevatedPayloadAtIndexPath:", v6);
      if ((_DWORD)v10 == 7)
      {
        if (!objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
          goto LABEL_16;
        v16 = [DMCRMConfigurationsViewController alloc];
        -[DMCProfileViewController rmSpecifierProviderUserScope](self, "rmSpecifierProviderUserScope");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        v14 = v8;
        v15 = 0;
      }
      else
      {
        v11 = v10;
        if ((_DWORD)v10 != 6)
        {
          v18 = [DMCProfileDetailsViewController alloc];
          -[DMCProfileViewController UIProfile](self, "UIProfile");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[DMCProfileDetailsViewController initWithProfileViewModel:mode:](v18, "initWithProfileViewModel:mode:", v19, v11);

          goto LABEL_15;
        }
        v12 = [DMCRMConfigurationsViewController alloc];
        -[DMCProfileViewController rmSpecifierProvider](self, "rmSpecifierProvider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = v8;
        v15 = 1;
      }
      v9 = -[DMCRMConfigurationsViewController initWithRMConfigurationsSpecifierProvider:scope:](v13, "initWithRMConfigurationsSpecifierProvider:scope:", v14, v15);
LABEL_13:
      v17 = (DMCProfileDetailsViewController *)v9;

LABEL_15:
      -[DMCProfileTableViewController presentViewController:](self, "presentViewController:", v17);

LABEL_16:
      objc_msgSend(v20, "deselectRowAtIndexPath:animated:", v6, 1);

      return;
    case 2:
      -[DMCProfileViewController _poll](self, "_poll");
      goto LABEL_16;
    case 3:
      -[DMCProfileViewController _updateProfile](self, "_updateProfile");
      goto LABEL_16;
    case 4:
      -[DMCProfileViewController _removeProfile](self, "_removeProfile");
      goto LABEL_16;
    default:
      goto LABEL_16;
  }
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  double result;

  -[DMCProfileViewController _heightForHeaderFooterInSection:](self, "_heightForHeaderFooterInSection:", a4);
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  double result;

  -[DMCProfileViewController _heightForHeaderFooterInSection:](self, "_heightForHeaderFooterInSection:", a4);
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  -[DMCProfileViewController _heightForHeaderFooterInSection:](self, "_heightForHeaderFooterInSection:", a4);
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  -[DMCProfileViewController _heightForHeaderFooterInSection:](self, "_heightForHeaderFooterInSection:", a4);
  return result;
}

- (double)_heightForHeaderFooterInSection:(int64_t)a3
{
  _BOOL4 v3;
  double result;

  v3 = -[DMCProfileViewController _isSectionPopulated:](self, "_isSectionPopulated:", a3);
  result = *MEMORY[0x24BDF7DE0];
  if (!v3)
    return 2.22507386e-308;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  if (-[DMCProfileViewController _isSectionPopulated:](self, "_isSectionPopulated:", a4))
  {
    v10.receiver = self;
    v10.super_class = (Class)DMCProfileViewController;
    -[DMCProfileViewController tableView:viewForHeaderInSection:](&v10, sel_tableView_viewForHeaderInSection_, v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DMCProfileViewController _emptyViewForHeaderFooter](self, "_emptyViewForHeaderFooter");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  if (-[DMCProfileViewController _isSectionPopulated:](self, "_isSectionPopulated:", a4))
  {
    v10.receiver = self;
    v10.super_class = (Class)DMCProfileViewController;
    -[DMCProfileViewController tableView:viewForFooterInSection:](&v10, sel_tableView_viewForFooterInSection_, v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DMCProfileViewController _emptyViewForHeaderFooter](self, "_emptyViewForHeaderFooter");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)_emptyViewForHeaderFooter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDF6F90]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return &stru_24D52F990;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  unint64_t v6;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFString *v10;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v6 = -[DMCProfileViewController profileExpiry](self, "profileExpiry", a3);
    if (v6 == 1)
    {
      v7 = -[DMCProfileViewController _delegateCanUpdate](self, "_delegateCanUpdate");
      v8 = CFSTR("DMC_PROFILE_EXPIRING_CERT");
      v9 = CFSTR("DMC_PROFILE_EXPIRING_CERT_REENROLL");
    }
    else
    {
      if (v6 != 2)
      {
        v4 = 0;
        return v4;
      }
      v7 = -[DMCProfileViewController _delegateCanUpdate](self, "_delegateCanUpdate");
      v8 = CFSTR("DMC_PROFILE_EXPIRED");
      v9 = CFSTR("DMC_PROFILE_EXPIRED_REENROLL");
    }
    if (v7)
      v10 = (__CFString *)v9;
    else
      v10 = (__CFString *)v8;
    DMCEnrollmentLocalizedString(v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_isSectionPopulated:(int64_t)a3
{
  BOOL v4;
  void *v5;
  void *v6;

  v4 = 1;
  switch(a3)
  {
    case 0:
      return v4;
    case 1:
      -[DMCProfileViewController UIProfile](self, "UIProfile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "elevatedPayloadTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "count")
        && !-[DMCProfileViewController rmConfigurationsCount](self, "rmConfigurationsCount"))
      {
        v4 = -[DMCProfileViewController rmConfigurationsCountUserScope](self, "rmConfigurationsCountUserScope") != 0;
      }

      return v4;
    case 2:
      return -[DMCProfileViewController _shouldShowPollButton](self, "_shouldShowPollButton");
    case 3:
      return -[DMCProfileViewController _shouldShowUpdateButton](self, "_shouldShowUpdateButton");
    case 4:
      return -[DMCProfileViewController _shouldShowRemoveButton](self, "_shouldShowRemoveButton");
    default:
      return 0;
  }
}

- (int)_profileDetailsModeForElevatedPayloadAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[DMCProfileViewController UIProfile](self, "UIProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elevatedPayloadTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "row");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (-[DMCProfileViewController rmConfigurationsCount](self, "rmConfigurationsCount"))
      v8 = 6;
    else
      v8 = 7;
  }
  else
  {
    v9 = objc_msgSend(v4, "row");
    if (v9 == objc_msgSend(v6, "count") + 1)
    {
      v8 = 7;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      if ((unint64_t)(v11 - 1) >= 4)
      {
        NSLog(CFSTR("DMCProfileViewController does not support a DMCProfileDetailsMode for MCUIPayloadInfoType %ld"), v11);
        v8 = 0;
      }
      else
      {
        v8 = v11 + 1;
      }
    }
  }

  return v8;
}

- (id)_tableView:(id)a3 profileCellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if (v8 == 2)
  {
    -[DMCProfileViewController _tableView:profileMoreDetailsCellForRowAtIndexPath:](self, "_tableView:profileMoreDetailsCellForRowAtIndexPath:", v6, v7);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10 = (void *)v13;
    goto LABEL_10;
  }
  if (v8 == 1)
  {
    +[DMCProfileDetailsSummaryCell cellIdentifier](DMCProfileDetailsSummaryCell, "cellIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v14, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[DMCProfileViewController UIProfile](self, "UIProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProfileViewModel:", v11);
    goto LABEL_7;
  }
  if (v8)
  {
    NSLog(CFSTR("DMCProfileViewController could not build a profile table cell at indexPath: %@"), v7);
    v13 = objc_opt_new();
    goto LABEL_9;
  }
  +[DMCProfileSummaryCell cellIdentifier](DMCProfileSummaryCell, "cellIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCProfileViewController UIProfile](self, "UIProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProfile:", v12);

LABEL_7:
LABEL_10:

  return v10;
}

- (id)_tableView:(id)a3 profileMoreDetailsCellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMCUIProfileMoreDetailsCellID"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DMCEnrollmentLocalizedString(CFSTR("DMC_MORE_DETAILS_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "setAccessoryType:", 1);
  return v4;
}

- (id)_tableView:(id)a3 elevatedPayloadCellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  __CFString *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMCUIElevatedPayloadCellID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DMCProfileViewController _profileDetailsModeForElevatedPayloadAtIndexPath:](self, "_profileDetailsModeForElevatedPayloadAtIndexPath:", v6);
  switch((int)v8)
  {
    case 2:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_ACCOUNTS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileViewController UIProfile](self, "UIProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfAccounts");
      goto LABEL_7;
    case 3:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_APPS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileViewController UIProfile](self, "UIProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfManagedApps");
      goto LABEL_7;
    case 4:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_BOOKS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileViewController UIProfile](self, "UIProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfManagedBooks");
      goto LABEL_7;
    case 5:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_RESTRICTIONS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileViewController UIProfile](self, "UIProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfRestrictions");
LABEL_7:
      v13 = v11;

      goto LABEL_14;
    case 6:
      if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
        v14 = CFSTR("DMC_DEVICE_CONFIGURATIONS_TITLE");
      else
        v14 = CFSTR("DMC_CONFIGURATIONS_TITLE");
      DMCEnrollmentLocalizedString(v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[DMCProfileViewController rmConfigurationsCount](self, "rmConfigurationsCount");
      goto LABEL_13;
    case 7:
      DMCEnrollmentLocalizedString(CFSTR("DMC_USER_CONFIGURATIONS_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[DMCProfileViewController rmConfigurationsCountUserScope](self, "rmConfigurationsCountUserScope");
LABEL_13:
      v13 = v15;
LABEL_14:
      objc_msgSend(v7, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v9);

      objc_msgSend(v7, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTextAlignment:", 4);

      v18 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringFromNumber:numberStyle:", v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "detailTextLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v20);

      objc_msgSend(v7, "setAccessoryType:", 1);
      v12 = v7;

      break;
    default:
      NSLog(CFSTR("DMCProfileViewController could not build an elevated payload table cell for mode %u at indexPath: %@"), v8, v6);
      v12 = (id)objc_opt_new();
      break;
  }

  return v12;
}

- (id)_tableView:(id)a3 buttonForRowAtIndexPath:(id)a4 text:(id)a5 color:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMCUIButtonCellID"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v10);

  objc_msgSend(v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextAlignment:", 1);

  objc_msgSend(v11, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v9);

  return v11;
}

- (id)_tableView:(id)a3 removeButtonForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  if (-[DMCProfileViewController profileViewMode](self, "profileViewMode") == 2)
  {
    -[DMCProfileViewController UIProfile](self, "UIProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isMDMProfile");

    if (v9)
    {
      if (-[DMCProfileUIDataProvider isProvisionallyEnrolled](self->_profileUIDataProvider, "isProvisionallyEnrolled"))v10 = CFSTR("DMC_MDM_LEAVE_REMOTE_MANAGEMENT");
      else
        v10 = CFSTR("DMC_MDM_REMOVE_TITLE");
    }
    else
    {
      v10 = CFSTR("DMC_PROFILE_REMOVE_TITLE");
    }
  }
  else
  {
    v10 = CFSTR("DMC_PROFILE_REMOVE_UNINSTALLED_TITLE");
  }
  DMCEnrollmentLocalizedString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "DMCProfileRedColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileViewController _tableView:buttonForRowAtIndexPath:text:color:](self, "_tableView:buttonForRowAtIndexPath:text:color:", v7, v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (DMCProfileViewModel)UIProfile
{
  return self->_UIProfile;
}

- (int64_t)profileViewMode
{
  return self->_profileViewMode;
}

- (unint64_t)installProfileSource
{
  return self->_installProfileSource;
}

- (void)setInstallProfileSource:(unint64_t)a3
{
  self->_installProfileSource = a3;
}

- (BOOL)installComplete
{
  return self->_installComplete;
}

- (void)setInstallComplete:(BOOL)a3
{
  self->_installComplete = a3;
}

- (DMCProfileViewControllerDelegate)profileViewControllerDelegate
{
  return (DMCProfileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_profileViewControllerDelegate);
}

- (void)setProfileViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_profileViewControllerDelegate, a3);
}

- (BOOL)profileRemovable
{
  return self->_profileRemovable;
}

- (void)setProfileRemovable:(BOOL)a3
{
  self->_profileRemovable = a3;
}

- (unint64_t)profileExpiry
{
  return self->_profileExpiry;
}

- (void)setProfileExpiry:(unint64_t)a3
{
  self->_profileExpiry = a3;
}

- (RMConfigurationsSpecifierProvider)rmSpecifierProvider
{
  return self->_rmSpecifierProvider;
}

- (void)setRmSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rmSpecifierProvider, a3);
}

- (unint64_t)rmConfigurationsCount
{
  return self->_rmConfigurationsCount;
}

- (void)setRmConfigurationsCount:(unint64_t)a3
{
  self->_rmConfigurationsCount = a3;
}

- (RMConfigurationsSpecifierProvider)rmSpecifierProviderUserScope
{
  return self->_rmSpecifierProviderUserScope;
}

- (void)setRmSpecifierProviderUserScope:(id)a3
{
  objc_storeStrong((id *)&self->_rmSpecifierProviderUserScope, a3);
}

- (unint64_t)rmConfigurationsCountUserScope
{
  return self->_rmConfigurationsCountUserScope;
}

- (void)setRmConfigurationsCountUserScope:(unint64_t)a3
{
  self->_rmConfigurationsCountUserScope = a3;
}

- (DMCProfileUIDataProvider)profileUIDataProvider
{
  return self->_profileUIDataProvider;
}

- (void)setProfileUIDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, 0);
  objc_storeStrong((id *)&self->_rmSpecifierProviderUserScope, 0);
  objc_storeStrong((id *)&self->_rmSpecifierProvider, 0);
  objc_destroyWeak((id *)&self->_profileViewControllerDelegate);
  objc_storeStrong((id *)&self->_UIProfile, 0);
}

@end
