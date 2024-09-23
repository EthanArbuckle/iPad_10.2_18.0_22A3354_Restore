@implementation _SFSecIdentityPreferencesController

+ (id)sharedPersistentSecIdentityPreferencesController
{
  if (sharedPersistentSecIdentityPreferencesController_onceToken != -1)
    dispatch_once(&sharedPersistentSecIdentityPreferencesController_onceToken, &__block_literal_global_55);
  return (id)sharedPersistentSecIdentityPreferencesController_sharedInstance;
}

+ (id)ephemeralSecIdentityPreferencesController
{
  return -[_SFSecIdentityPreferencesController _initUsingEphemeralStorage:]([_SFSecIdentityPreferencesController alloc], "_initUsingEphemeralStorage:", 1);
}

- (BOOL)shouldUseOnlyAvailableIdentityWithoutPromptingForDomainAndPort:(id)a3
{
  NSMutableSet *domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
  id v4;
  void *v5;
  id v6;
  void *v7;

  domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = self->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
  if (domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting)
  {
    v4 = a3;
    LOBYTE(domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting) = -[NSMutableSet containsObject:](domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting, "containsObject:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99EA0];
    v6 = a3;
    objc_msgSend(v5, "_sf_safariDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayForKey:", *MEMORY[0x1E0D4F620]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = (NSMutableSet *)objc_msgSend(v7, "containsObject:", v6);

  }
  return (char)domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
}

- (void)saveShouldUseOnlyAvailableIdentityWithoutPrompting:(BOOL)a3 forDomainAndPort:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v4 = a3;
  v6 = a4;
  domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = self->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
  v15 = v6;
  if (domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting)
  {
    if (v4)
      -[NSMutableSet addObject:](domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting, "addObject:", v6);
    else
      -[NSMutableSet removeObject:](domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting, "removeObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D4F620];
    objc_msgSend(v8, "arrayForKey:", *MEMORY[0x1E0D4F620]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(v14, "addObject:", v15);
    objc_msgSend(v8, "setObject:forKey:", v14, v9);

  }
}

- (id)_initUsingEphemeralStorage:(BOOL)a3
{
  _BOOL4 v3;
  _SFSecIdentityPreferencesController *v4;
  uint64_t v5;
  NSMutableSet *domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
  _SFSecIdentityPreferencesController *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFSecIdentityPreferencesController;
  v4 = -[_SFSecIdentityPreferencesController init](&v9, sel_init);
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = objc_claimAutoreleasedReturnValue();
      domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = v4->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
      v4->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = (NSMutableSet *)v5;

    }
    v7 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting, 0);
}

@end
