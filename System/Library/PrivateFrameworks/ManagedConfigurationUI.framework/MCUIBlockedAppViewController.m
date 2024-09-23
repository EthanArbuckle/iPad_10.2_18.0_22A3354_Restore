@implementation MCUIBlockedAppViewController

- (MCUIBlockedAppViewController)init
{
  MCUIBlockedAppViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCUIBlockedAppViewController;
  v2 = -[MCUIBlockedAppViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__blockedAppsUpdated, *MEMORY[0x1E0D46EC8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D46EC8], 0);

  v4.receiver = self;
  v4.super_class = (Class)MCUIBlockedAppViewController;
  -[MCUIBlockedAppViewController dealloc](&v4, sel_dealloc);
}

- (void)_blockedAppsUpdated
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__MCUIBlockedAppViewController__blockedAppsUpdated__block_invoke;
  v2[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __51__MCUIBlockedAppViewController__blockedAppsUpdated__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (BOOL)overridden
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = (int)*MEMORY[0x1E0D80628];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "propertyForKey:", CFSTR("MCUIBlockedAppCdHash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "propertyForKey:", CFSTR("MCUIBlockedAppHashType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intValue");

    v6 = MISBlacklistOverriddenByUser();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setOverride:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (int)*MEMORY[0x1E0D80628];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", CFSTR("MCUIBlockedAppCdHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v4), "propertyForKey:", CFSTR("MCUIBlockedAppHashType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intValue");

    objc_msgSend(v7, "BOOLValue");
    MISBlacklistSetOverride();
  }

}

- (void)_askForReenableConfirmation
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
  _QWORD v12[4];
  id v13;
  id location;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "propertyForKey:", CFSTR("MCUIBlockedAppName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  MCUILocalizedString(CFSTR("REENABLE_WARNING_TITLE_%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA2E8];
  MCUILocalizedString(CFSTR("REENABLE_WARNING_TEXT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MCUILocalizedString(CFSTR("REENABLE_WARNING_CANCEL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MCUIAddCancelActionWithTitle:", v10);

  objc_initWeak(&location, self);
  MCUILocalizedString(CFSTR("REENABLE_WARNING_OK"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__MCUIBlockedAppViewController__askForReenableConfirmation__block_invoke;
  v12[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "MCUIAddActionWithTitle:style:completion:", v11, 2, v12);

  objc_msgSend(v9, "MCUIShowFromController:", self);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __59__MCUIBlockedAppViewController__askForReenableConfirmation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setOverride:", MEMORY[0x1E0C9AAB0]);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "reloadSpecifiers");

}

- (id)_reenableButtonSpecifier
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0D804E8];
  if (self->_reenabled)
    v4 = CFSTR("DETAIL_REENABLED_BUTTON_TITLE");
  else
    v4 = CFSTR("DETAIL_REENABLE_BUTTON_TITLE");
  MCUILocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isOnDeviceAppInstallationAllowed");

  if (self->_reenabled || v8 == 0)
  {
    v10 = MEMORY[0x1E0C9AAA0];
  }
  else
  {
    objc_msgSend(v6, "setButtonAction:", sel__askForReenableConfirmation);
    v10 = MEMORY[0x1E0C9AAB0];
  }
  objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x1E0D80808]);
  return v6;
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (int)*MEMORY[0x1E0D80590];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
    return v3;
  v6 = (int)*MEMORY[0x1E0D80628];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "propertyForKey:", CFSTR("MCUIBlockedAppCdHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    self->_reenabled = -[MCUIBlockedAppViewController overridden](self, "overridden");
    v8 = (void *)MEMORY[0x1E0D804E8];
    MCUILocalizedString(CFSTR("DETAIL_GROUP_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupSpecifierWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "propertyForKey:", CFSTR("MCUIBlockedAppName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    if (self->_reenabled)
      v13 = CFSTR("DETAIL_GROUP_REENABLED_FOOTER_%@");
    else
      v13 = CFSTR("DETAIL_GROUP_FOOTER_%@");
    MCUILocalizedString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setProperty:forKey:", v15, *MEMORY[0x1E0D80848]);
    v20[0] = v10;
    -[MCUIBlockedAppViewController _reenableButtonSpecifier](self, "_reenableButtonSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v17 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v17;

    v19 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  else
  {
    -[MCUIBlockedAppViewController popRecursivelyToRootController](self, "popRecursivelyToRootController");
    v19 = 0;
  }

  return v19;
}

- (BOOL)reenabled
{
  return self->_reenabled;
}

- (void)setReenabled:(BOOL)a3
{
  self->_reenabled = a3;
}

@end
