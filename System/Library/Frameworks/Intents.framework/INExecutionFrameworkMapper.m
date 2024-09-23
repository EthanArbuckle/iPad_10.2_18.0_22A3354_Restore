@implementation INExecutionFrameworkMapper

- (void)_addExtensionBundleIdentifier:(id)a3 forAppBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appToExtensionIdentifiers, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appToExtensionIdentifiers, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

uint64_t __35__INExecutionFrameworkMapper_reset__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addExtensionBundleIdentifier:forAppBundleIdentifier:", a2, a3);
}

uint64_t __35__INExecutionFrameworkMapper_reset__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addExtensionBundleIdentifier:forAppBundleIdentifier:", a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appToExtensionIdentifiers, 0);
}

- (id)launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "if_isSystem"))
  {
    objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:", CFSTR("INLaunchableApplicationBundleIdentifier"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:", CFSTR("INLaunchableAApplicationBundleIdentifier"), objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(&unk_1E23FE8E8, "objectForKey:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          objc_msgSend(v5, "containingBundle");
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          if (v6)
          {
            objc_msgSend(v5, "containingBundle");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "bundleIdentifier");
            v6 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "if_isSystem"))
    {
      objc_msgSend(v5, "objectForInfoDictionaryKey:ofClass:", CFSTR("INDisplayableApplicationBundleIdentifier"), objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(&unk_1E23FE910, "objectForKey:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  v4.receiver = self;
  v4.super_class = (Class)INExecutionFrameworkMapper;
  -[INExecutionFrameworkMapper dealloc](&v4, sel_dealloc);
}

- (INExecutionFrameworkMapper)init
{
  INExecutionFrameworkMapper *v2;
  INExecutionFrameworkMapper *v3;
  void *v4;
  INExecutionFrameworkMapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INExecutionFrameworkMapper;
  v2 = -[INExecutionFrameworkMapper init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    -[INExecutionFrameworkMapper reset](v3, "reset");
    v5 = v3;

  }
  return v3;
}

- (void)reset
{
  uint64_t v3;
  void (**v4)(_QWORD);
  NSMutableDictionary *v5;
  NSMutableDictionary *appToExtensionIdentifiers;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  os_unfair_lock_lock(&self->_lock);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__INExecutionFrameworkMapper_reset__block_invoke;
  v9[3] = &unk_1E2294DE0;
  v9[4] = self;
  v4 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v9);
  v5 = (NSMutableDictionary *)objc_opt_new();
  appToExtensionIdentifiers = self->_appToExtensionIdentifiers;
  self->_appToExtensionIdentifiers = v5;

  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __35__INExecutionFrameworkMapper_reset__block_invoke_2;
  v8[3] = &unk_1E2293A70;
  v8[4] = self;
  objc_msgSend(&unk_1E23FE8E8, "enumerateKeysAndObjectsUsingBlock:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __35__INExecutionFrameworkMapper_reset__block_invoke_3;
  v7[3] = &unk_1E2293A70;
  v7[4] = self;
  objc_msgSend(&unk_1E23FE910, "enumerateKeysAndObjectsUsingBlock:", v7);
  self->_filled = 0;
  v4[2](v4);

}

void __35__INExecutionFrameworkMapper_reset__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (void)installedApplicationsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isPlaceholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = objc_msgSend(v7, "BOOLValue");
  if ((v8 & 1) == 0)
    -[INExecutionFrameworkMapper reset](self, "reset");
}

- (void)loadSystemExtensionInformation
{
  INExecutionFrameworkMapper *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(void);
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->_lock);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__INExecutionFrameworkMapper_loadSystemExtensionInformation__block_invoke;
  v22[3] = &unk_1E2294DE0;
  v3 = self;
  v22[4] = self;
  v16 = (void (**)(void))MEMORY[0x18D7812C4](v22);
  if (!self->_filled)
  {
    objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithOptions:", 1);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v19;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v19 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x18D7810F0]();
          objc_msgSend(v7, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v7, "infoDictionary");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKey:ofClass:", CFSTR("INLaunchableApplicationBundleIdentifier"), objc_opt_class());
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
              -[INExecutionFrameworkMapper _addExtensionBundleIdentifier:forAppBundleIdentifier:](v3, "_addExtensionBundleIdentifier:forAppBundleIdentifier:", v9, v11);
            objc_msgSend(v7, "infoDictionary", v16);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:ofClass:", CFSTR("INLaunchableAApplicationBundleIdentifier"), objc_opt_class());
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
              -[INExecutionFrameworkMapper _addExtensionBundleIdentifier:forAppBundleIdentifier:](v3, "_addExtensionBundleIdentifier:forAppBundleIdentifier:", v9, v13);
            objc_msgSend(v7, "infoDictionary");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:ofClass:", CFSTR("INDisplayableApplicationBundleIdentifier"), objc_opt_class());
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              -[INExecutionFrameworkMapper _addExtensionBundleIdentifier:forAppBundleIdentifier:](v3, "_addExtensionBundleIdentifier:forAppBundleIdentifier:", v9, v15);

          }
          objc_autoreleasePoolPop(v8);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v4);
    }

    v3->_filled = 1;
  }
  v16[2]();

}

- (id)extensionBundleIdentifiersForSystemAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  objc_msgSend(v5, "compatibilityObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (objc_msgSend(v6, "if_isSystem"))
  {
    -[INExecutionFrameworkMapper loadSystemExtensionInformation](self, "loadSystemExtensionInformation");
    os_unfair_lock_lock(&self->_lock);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__INExecutionFrameworkMapper_extensionBundleIdentifiersForSystemAppIdentifier___block_invoke;
    v14[3] = &unk_1E2294DE0;
    v14[4] = self;
    v8 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v14);
    objc_msgSend(v5, "applicationExtensionRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_compactMap:", &__block_literal_global_109691);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[INExecutionFrameworkMapper _appToExtensionIdentifiers](self, "_appToExtensionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setByAddingObjectsFromSet:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8[2](v8);
  }

  return v7;
}

- (id)appBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[INExecutionFrameworkMapper launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:](self, "launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[INExecutionFrameworkMapper displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:](self, "displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (NSMutableDictionary)_appToExtensionIdentifiers
{
  return self->_appToExtensionIdentifiers;
}

- (BOOL)_filled
{
  return self->_filled;
}

- (os_unfair_lock_s)_lock
{
  return self->_lock;
}

void __79__INExecutionFrameworkMapper_extensionBundleIdentifiersForSystemAppIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __60__INExecutionFrameworkMapper_loadSystemExtensionInformation__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

@end
