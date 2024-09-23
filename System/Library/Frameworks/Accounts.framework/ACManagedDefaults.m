@implementation ACManagedDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_managedDefaults;
}

void __35__ACManagedDefaults_sharedInstance__block_invoke()
{
  ACManagedDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(ACManagedDefaults);
  v1 = (void *)sharedInstance_managedDefaults;
  sharedInstance_managedDefaults = (uint64_t)v0;

}

- (id)_readManagedDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/Library/Managed Preferences/mobile/.GlobalPreferences.plist"));
}

- (void)_writeManagedDefaults:(id)a3
{
  _CFPreferencesWriteManagedDomainForUser();
  _CFPreferencesPostValuesChangedInDomains();
  _CFPreferencesManagementStatusChangedForDomains();
}

- (id)valueForManagedDefault:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[ACManagedDefaults _readManagedDefaults](self, "_readManagedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  if (!objc_msgSend(v6, "isNSNumber"))
  {
    if (objc_msgSend(v6, "isNSString"))
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v6, "intValue"));
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = v6;
LABEL_6:
  v8 = v7;
LABEL_8:

  return v8;
}

- (void)setValue:(id)a3 forManagedDefault:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ACManagedDefaults _readManagedDefaults](self, "_readManagedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v9, "intValue") == -1)
  {
    objc_msgSend(v8, "removeObjectForKey:", v6);
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setValue:forKey:", v9, v6);
  }
  -[ACManagedDefaults _writeManagedDefaults:](self, "_writeManagedDefaults:", v8);

}

@end
