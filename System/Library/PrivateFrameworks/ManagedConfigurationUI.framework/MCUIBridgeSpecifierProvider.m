@implementation MCUIBridgeSpecifierProvider

- (id)specifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fetchStatus");

  switch(v4)
  {
    case 2:
      goto LABEL_7;
    case 1:
      -[MCUISpecifierProvider delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mcuiViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 0);

LABEL_7:
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 15, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      v13 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0:
      -[MCUIBridgeSpecifierProvider _specifiersForWatchProfiles](self, "_specifiersForWatchProfiles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "count"))
      {
        -[MCUIBridgeSpecifierProvider _emptySpecifier](self, "_emptySpecifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      v6 = v5;
      v5 = v6;
LABEL_8:
      v3 = v6;
LABEL_9:

      break;
  }
  return v3;
}

- (id)_specifiersForWatchProfiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mdmProfilesInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierProvider specifiersForMDMProfiles:](self, "specifiersForMDMProfiles:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configProfilesInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierProvider specifiersForInstalledProfiles:](self, "specifiersForInstalledProfiles:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  return v3;
}

- (id)_emptySpecifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("NO_PROFILES_INSTALLED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v3, *MEMORY[0x1E0D80848]);

  return v2;
}

- (void)loadProfileFromSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("MCUIPSItemKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MCUISpecifierProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mcuiViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MCUIShowProgressInNavBar");

    objc_initWeak(&location, self);
    +[MCUIWatchManager shared](MCUIWatchManager, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke;
    v10[3] = &unk_1EA2B62C0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "fetchProfileIdentifier:completion:", v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(CFSTR("MCUI Bridge Specifier Provider failed to find profile info in specifier: %@"), v4);
  }

}

void __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke_2;
  block[3] = &unk_1EA2B5CC0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __56__MCUIBridgeSpecifierProvider_loadProfileFromSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  MCRemoveProfileViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mcuiViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCUIHideProgressInNavBarShowBackButton:", 1);

    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CEA2E8], "MCUIShowWatchUnavailableAlertWithCompletion:", 0);
    }
    else
    {
      v5 = -[MCRemoveProfileViewController initWithProfile:]([MCRemoveProfileViewController alloc], "initWithProfile:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v9, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mcuiViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pushViewController:animated:", v5, 1);

    }
    WeakRetained = v9;
  }

}

@end
