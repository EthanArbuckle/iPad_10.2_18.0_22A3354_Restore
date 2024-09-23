@implementation FMFSpecifierProvider

- (FMFSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  FMFSpecifierProvider *v6;
  FMFSpecifierProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMFSpecifierProvider;
  v6 = -[FMFSpecifierProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if (-[FMFSpecifierProvider shouldShowLocationSharingSpecifier](self, "shouldShowLocationSharingSpecifier"))
    {
      v4 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOCATION_SHARING"), &stru_24C878158, CFSTR("LocalizableUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setControllerLoadAction:", sel_locationSharingSpecifierWasTapped_);
      objc_msgSend(v7, "setIdentifier:", CFSTR("LOCATION_SHARING"));
      v8 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageNamed:inBundle:", CFSTR("ShareMyLocationIcon"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC8]);
      if (-[FMFSpecifierProvider shouldEnableLocationSharingSpecifier](self, "shouldEnableLocationSharingSpecifier"))
        v11 = MEMORY[0x24BDBD1C8];
      else
        v11 = MEMORY[0x24BDBD1C0];
      objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x24BE75A18]);
      v16[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v13 = self->_specifiers;
      self->_specifiers = v12;

    }
    else
    {
      v14 = self->_specifiers;
      self->_specifiers = (NSArray *)MEMORY[0x24BDBD1A8];

    }
    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)locationSharingSpecifierWasTapped:(id)a3
{
  id v4;
  NSObject *v5;
  FMFLocationSharingViewController *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[FMFSpecifierProvider locationSharingSpecifierWasTapped:]";
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v6 = objc_alloc_init(FMFLocationSharingViewController);
  -[FMFLocationSharingViewController setSpecifier:](v6, "setSpecifier:", v4);

  -[FMFSpecifierProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierProvider:showViewController:", self, v6);

}

- (BOOL)shouldEnableLocationSharingSpecifier
{
  if (-[FMFSpecifierProvider isAccountInGrayMode](self, "isAccountInGrayMode"))
    return 0;
  else
    return !-[FMFSpecifierProvider locationServicesDisabledByRestrictions](self, "locationServicesDisabledByRestrictions");
}

- (BOOL)shouldShowLocationSharingSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  -[FMFSpecifierProvider accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.AppleID.Service.Cloud"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "isProvisionedForDataclass:", *MEMORY[0x24BDB4630]);
  return (char)v2;
}

- (BOOL)locationServicesDisabledByRestrictions
{
  void *v2;
  char v3;

  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("location"));

  return v3;
}

- (BOOL)isAccountInGrayMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[FMFSpecifierProvider accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.AppleID.Service.Cloud"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_msgSend(v4, "aa_isSuspended") & 1) != 0 || !objc_msgSend(v4, "aa_isPrimaryEmailVerified"))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "aa_repairState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedIntegerValue") == 3;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
