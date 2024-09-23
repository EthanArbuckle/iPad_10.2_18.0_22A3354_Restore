@implementation NTKTritiumDefaults

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NTKTritiumDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_25 != -1)
    dispatch_once(&sharedInstance_onceToken_25, block);
  return (id)sharedInstance___sharedInstance_10;
}

void __36__NTKTritiumDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_10;
  sharedInstance___sharedInstance_10 = (uint64_t)v1;

}

- (NTKTritiumDefaults)init
{
  NTKTritiumDefaults *v2;
  NTKTritiumDefaults *v3;
  uint64_t v4;
  NPSDomainAccessor *domainAccessor;
  uint64_t v6;
  NSUserDefaults *defaults;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKTritiumDefaults;
  v2 = -[NTKTritiumDefaults init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKTritiumDefaults _synchronize](v2, "_synchronize");
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
    domainAccessor = v3->_domainAccessor;
    v3->_domainAccessor = (NPSDomainAccessor *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.NanoTimeKit"));
    defaults = v3->_defaults;
    v3->_defaults = (NSUserDefaults *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v8;

    -[NTKTritiumDefaults _observe](v3, "_observe");
  }
  return v3;
}

- (id)_domainAccessor
{
  return self->_domainAccessor;
}

- (void)_synchronize
{
  void *v2;
  id v3;
  id v4;
  id v5;

  -[NTKTritiumDefaults _domainAccessor](self, "_domainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "synchronize");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("NTKAllComplicationsPrivate"), CFSTR("NTKSpecificComplicationsPrivate"), CFSTR("NTKSpecificSiriCardsPrivate"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D51618]);
  objc_msgSend(v4, "synchronizeNanoDomain:keys:cloudEnabled:", CFSTR("com.apple.NanoTimeKit"), v5, 1);

}

- (BOOL)allBundleIDsPrivateInTritium
{
  void *v3;
  uint64_t v4;
  int AppBooleanValue;
  BOOL v6;
  Boolean keyExistsAndHasValidFormat;
  char v9;

  v9 = 0;
  -[NTKTritiumDefaults _domainAccessor](self, "_domainAccessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v3, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("NTKAllComplicationsPrivate"), &v9);

  if (!v9)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AOTPrivacyEnabled"), CFSTR("com.apple.system.prefs"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v6 = AppBooleanValue == 0;
    else
      v6 = 1;
    v4 = !v6;
    -[NTKTritiumDefaults setAllBundleIDsPrivateInTritium:](self, "setAllBundleIDsPrivateInTritium:", v4);
  }
  return v4;
}

- (void)setAllBundleIDsPrivateInTritium:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[NTKTritiumDefaults _domainAccessor](self, "_domainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("NTKAllComplicationsPrivate"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.NanoTimeKit.NTKTritiumSettingsDidChangeNotification"), 0);

  -[NTKTritiumDefaults _synchronize](self, "_synchronize");
}

- (BOOL)isBundleIdPrivateInTritium:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[NTKTritiumDefaults allBundleIDsPrivateInTritium](self, "allBundleIDsPrivateInTritium"))
  {
    v5 = 1;
  }
  else
  {
    -[NTKTritiumDefaults _privateBundleIDs](self, "_privateBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (BOOL)isSiriPlatterPrivateInTritium:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NTKTritiumDefaults _privateSiriCardIDs](self, "_privateSiriCardIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKTritiumDefaults allBundleIDsPrivateInTritium](self, "allBundleIDsPrivateInTritium")
    || (objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.NanoTimeKit.NTKTritiumSettingsAllSiriPlattersHidden"));
  }

  return v6;
}

- (void)setBundleIDs:(id)a3 privateInTritium:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  -[NTKTritiumDefaults _privateBundleIDs](self, "_privateBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v12, "unionSet:", v7);
  else
    objc_msgSend(v12, "minusSet:", v7);

  -[NTKTritiumDefaults _domainAccessor](self, "_domainAccessor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("NTKSpecificComplicationsPrivate"));

  -[NTKTritiumDefaults _synchronize](self, "_synchronize");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("com.apple.NanoTimeKit.NTKTritiumSettingsDidChangeNotification"), 0);

}

- (void)setSiriPlatters:(id)a3 privateInTritium:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  -[NTKTritiumDefaults _privateSiriCardIDs](self, "_privateSiriCardIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v12, "unionSet:", v7);
  else
    objc_msgSend(v12, "minusSet:", v7);

  -[NTKTritiumDefaults _domainAccessor](self, "_domainAccessor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("NTKSpecificSiriCardsPrivate"));

  -[NTKTritiumDefaults _synchronize](self, "_synchronize");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("com.apple.NanoTimeKit.NTKTritiumSettingsDidChangeNotification"), 0);

}

- (id)_privateBundleIDs
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[NTKTritiumDefaults _domainAccessor](self, "_domainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NTKSpecificComplicationsPrivate"));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  return v4;
}

- (id)_privateSiriCardIDs
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[NTKTritiumDefaults _domainAccessor](self, "_domainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NTKSpecificSiriCardsPrivate"));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  return v4;
}

- (void)_observe
{
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_defaults, "addObserver:forKeyPath:options:context:", self, CFSTR("NTKSpecificComplicationsPrivate"), 0, 0);
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_defaults, "addObserver:forKeyPath:options:context:", self, CFSTR("NTKAllComplicationsPrivate"), 0, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "tritiumPrivacySettingsDidChange", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end
