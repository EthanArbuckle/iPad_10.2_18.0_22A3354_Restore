@implementation GCControllerSettings

+ (id)settingsDispatchQueue
{
  if (settingsDispatchQueue_onceToken != -1)
    dispatch_once(&settingsDispatchQueue_onceToken, &__block_literal_global_28);
  return (id)settingsDispatchQueue__dispatch_queue;
}

void __45__GCControllerSettings_settingsDispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.GameController.Settings.GCControllerSettings", 0);
  v1 = (void *)settingsDispatchQueue__dispatch_queue;
  settingsDispatchQueue__dispatch_queue = (uint64_t)v0;

}

+ (id)settingsCustomizedChangedHandlers
{
  if (settingsCustomizedChangedHandlers_onceToken != -1)
    dispatch_once(&settingsCustomizedChangedHandlers_onceToken, &__block_literal_global_86);
  return (id)settingsCustomizedChangedHandlers__handlers;
}

void __57__GCControllerSettings_settingsCustomizedChangedHandlers__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)settingsCustomizedChangedHandlers__handlers;
  settingsCustomizedChangedHandlers__handlers = v0;

}

+ (id)controllerSettingsCustomizedChangedHandlers
{
  if (controllerSettingsCustomizedChangedHandlers_onceToken != -1)
    dispatch_once(&controllerSettingsCustomizedChangedHandlers_onceToken, &__block_literal_global_88);
  return (id)controllerSettingsCustomizedChangedHandlers__controllerHandlers;
}

void __67__GCControllerSettings_controllerSettingsCustomizedChangedHandlers__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)controllerSettingsCustomizedChangedHandlers__controllerHandlers;
  controllerSettingsCustomizedChangedHandlers__controllerHandlers = v0;

}

+ (void)registerSettingsCustomizedHandler:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  getGCSettingsLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x2199DEBB0](v5);
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "Register settings customized handler %@ -> %@", (uint8_t *)&v11, 0x16u);

  }
  +[GCControllerSettings settingsCustomizedChangedHandlers](GCControllerSettings, "settingsCustomizedChangedHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x2199DEBB0](v5);
  objc_msgSend(v9, "setObject:forKey:", v10, v6);

}

+ (void)unregisterSettingsCustomizedHandlerForKey:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    getGCSettingsLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "Unregister settings customized handler %@", (uint8_t *)&v6, 0xCu);
    }

    +[GCControllerSettings settingsCustomizedChangedHandlers](GCControllerSettings, "settingsCustomizedChangedHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v3);

  }
}

+ (void)registerSettingsCustomizedHandler:(id)a3 forController:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[GCControllerSettings settingsDispatchQueue](GCControllerSettings, "settingsDispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__GCControllerSettings_registerSettingsCustomizedHandler_forController_forKey___block_invoke;
  block[3] = &unk_24D2B5530;
  v15 = v8;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v8;
  dispatch_sync(v10, block);

}

void __79__GCControllerSettings_registerSettingsCustomizedHandler_forController_forKey___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  getGCSettingsLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = (void *)MEMORY[0x2199DEBB0](a1[6]);
    v13 = 138412802;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "Register controller %@ settings customized handler %@ -> %@", (uint8_t *)&v13, 0x20u);

  }
  if (a1[4] && a1[5])
  {
    +[GCControllerSettings controllerSettingsCustomizedChangedHandlers](GCControllerSettings, "controllerSettingsCustomizedChangedHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[GCControllerSettings controllerSettingsCustomizedChangedHandlers](GCControllerSettings, "controllerSettingsCustomizedChangedHandlers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, a1[4]);

    }
    +[GCControllerSettings controllerSettingsCustomizedChangedHandlers](GCControllerSettings, "controllerSettingsCustomizedChangedHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", a1[4]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x2199DEBB0](a1[6]);
    objc_msgSend(v11, "setObject:forKey:", v12, a1[5]);

  }
}

+ (void)unregisterSettingsCustomizedHandlerForController:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[GCControllerSettings settingsDispatchQueue](GCControllerSettings, "settingsDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__GCControllerSettings_unregisterSettingsCustomizedHandlerForController_forKey___block_invoke;
  block[3] = &unk_24D2B2B48;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_sync(v7, block);

}

void __80__GCControllerSettings_unregisterSettingsCustomizedHandlerForController_forKey___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  getGCSettingsLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "Unregister controller %@ settings customized handler %@", (uint8_t *)&v8, 0x16u);
  }

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    +[GCControllerSettings controllerSettingsCustomizedChangedHandlers](GCControllerSettings, "controllerSettingsCustomizedChangedHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      if (!objc_msgSend(v6, "count"))
      {
        +[GCControllerSettings controllerSettingsCustomizedChangedHandlers](GCControllerSettings, "controllerSettingsCustomizedChangedHandlers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

      }
    }

  }
}

+ (id)metaDefaults
{
  if (metaDefaults_onceToken != -1)
    dispatch_once(&metaDefaults_onceToken, &__block_literal_global_89_0);
  return (id)objc_msgSend((id)metaDefaults__observer, "metaDefaults");
}

void __36__GCControllerSettings_metaDefaults__block_invoke()
{
  GCControllerMetaDefaultsObserver *v0;
  void *v1;

  v0 = objc_alloc_init(GCControllerMetaDefaultsObserver);
  v1 = (void *)metaDefaults__observer;
  metaDefaults__observer = (uint64_t)v0;

}

+ (void)setSettingsExist:(BOOL)a3 forBundleIdentifier:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = a4;
  +[GCControllerSettings metaDefaults](GCControllerSettings, "metaDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("settingsExist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[NSDictionary dictionary](&off_254DEBCC0, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || v4)
  {
    objc_msgSend(v6, "objectForKey:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = 1;
    else
      v10 = !v4;
    if (!v10)
    {
      +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v11, v13);

    }
  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", v13);
  }
  +[GCControllerSettings metaDefaults](GCControllerSettings, "metaDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v7, CFSTR("settingsExist"));

}

+ (void)setSettingsExist:(BOOL)a3 forController:(id)a4 forBundleIdentifier:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  +[GCControllerSettings metaDefaults](GCControllerSettings, "metaDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryForKey:", CFSTR("controllerSettingsExist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[NSDictionary dictionary](&off_254DEBCC0, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[NSArray array](NSArray_0, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[GCAnalytics instance](GCAnalytics, "instance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendSettingsDevicesEventForTotalCustomizedControllersCount:", objc_msgSend(v11, "count") + 1);

  }
  +[NSMutableArray arrayWithArray:](&off_254DEBB20, "arrayWithArray:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "containsObject:", v8) && !v6)
  {
    objc_msgSend(v14, "removeObject:", v8);
LABEL_11:
    +[GCAnalytics instance](GCAnalytics, "instance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendSettingsCustomizedAppsEventForTotalCustomizedAppsCount:", objc_msgSend(v14, "count"));

    goto LABEL_12;
  }
  if ((objc_msgSend(v14, "containsObject:", v8) & 1) == 0 && v6)
  {
    objc_msgSend(v14, "addObject:", v8);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v11, "setObject:forKey:", v14, v7);
  getGCSettingsLogger();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v11;
    _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_INFO, "Saving controller settings exist dictionary: %@", (uint8_t *)&v18, 0xCu);
  }

  +[GCControllerSettings metaDefaults](GCControllerSettings, "metaDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("controllerSettingsExist"));

}

+ (BOOL)settingsCustomizedForController:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[GCControllerSettings metaDefaults](GCControllerSettings, "metaDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("controllerSettingsExist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v5);
  return (char)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initForController:(id)a3
{
  return -[GCControllerSettings initWithBundleIdentifier:forController:](self, "initWithBundleIdentifier:forController:", CFSTR("default"), a3);
}

- (GCControllerSettings)initWithBundleIdentifier:(id)a3 forControllerIdentifier:(id)a4
{
  id v7;
  id v8;
  GCControllerSettings *v9;
  GCControllerSettings *v10;
  uint64_t v11;
  NSMutableDictionary *elementSettings;
  uint64_t v13;
  NSArray *customizedElementSettings;
  uint64_t v15;
  uint64_t v16;
  NSMutableSet *observedKeyPaths;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GCControllerSettings;
  v9 = -[GCControllerSettings init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_uniqueIdentifier, a4);
    v10->_customized = +[GCControllerSettings settingsCustomizedForController:forBundleIdentifier:](GCControllerSettings, "settingsCustomizedForController:forBundleIdentifier:", v8, v7);
    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    elementSettings = v10->_elementSettings;
    v10->_elementSettings = (NSMutableDictionary *)v11;

    +[NSArray array](NSArray_0, "array");
    v13 = objc_claimAutoreleasedReturnValue();
    customizedElementSettings = v10->_customizedElementSettings;
    v10->_customizedElementSettings = (NSArray *)v13;

    v15 = gcControllerSettingsID++;
    v10->_settingsID = v15;
    +[NSMutableSet set](&off_254DEBF30, "set");
    v16 = objc_claimAutoreleasedReturnValue();
    observedKeyPaths = v10->_observedKeyPaths;
    v10->_observedKeyPaths = (NSMutableSet *)v16;

    -[GCControllerSettings registerForSettingsCustomized](v10, "registerForSettingsCustomized");
    -[GCControllerSettings initializeUserDefaults](v10, "initializeUserDefaults");
  }

  return v10;
}

- (GCControllerSettings)initWithBundleIdentifier:(id)a3 forController:(id)a4
{
  id v7;
  id v8;
  GCControllerSettings *v9;
  GCControllerSettings *v10;
  NSDictionary *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSDictionary *elementMappingKeyToElement;
  NSDictionary *v22;
  uint64_t v23;
  NSCopying *uniqueIdentifier;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *elementSettings;
  uint64_t v28;
  NSArray *customizedElementSettings;
  uint64_t v30;
  uint64_t v31;
  NSMutableSet *observedKeyPaths;
  GCControllerSettings *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "isComponentBased"))
  {
    v40.receiver = self;
    v40.super_class = (Class)GCControllerSettings;
    v9 = -[GCControllerSettings init](&v40, sel_init);
    v10 = v9;
    if (v9)
    {
      v35 = v7;
      objc_storeWeak((id *)&v9->_controller, v8);
      v10->_settingsAppOpenedAtLeastOnce = 1;
      +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
      v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      WeakRetained = objc_loadWeakRetained((id *)&v10->_controller);
      objc_msgSend(WeakRetained, "physicalInputProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allElements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v37 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (objc_msgSend(v19, "remappable"))
            {
              -[GCControllerSettings mappingKeyForElement:](v10, "mappingKeyForElement:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v19, v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v16);
      }

      elementMappingKeyToElement = v10->_elementMappingKeyToElement;
      v10->_elementMappingKeyToElement = v11;
      v22 = v11;

      objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
      objc_msgSend(v8, "identifier");
      v23 = objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = v10->_uniqueIdentifier;
      v10->_uniqueIdentifier = (NSCopying *)v23;

      objc_msgSend(v8, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v35;
      v10->_customized = +[GCControllerSettings settingsCustomizedForController:forBundleIdentifier:](GCControllerSettings, "settingsCustomizedForController:forBundleIdentifier:", v25, v35);

      +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
      v26 = objc_claimAutoreleasedReturnValue();
      elementSettings = v10->_elementSettings;
      v10->_elementSettings = (NSMutableDictionary *)v26;

      +[NSArray array](NSArray_0, "array");
      v28 = objc_claimAutoreleasedReturnValue();
      customizedElementSettings = v10->_customizedElementSettings;
      v10->_customizedElementSettings = (NSArray *)v28;

      v30 = gcControllerSettingsID++;
      v10->_settingsID = v30;
      +[NSMutableSet set](&off_254DEBF30, "set");
      v31 = objc_claimAutoreleasedReturnValue();
      observedKeyPaths = v10->_observedKeyPaths;
      v10->_observedKeyPaths = (NSMutableSet *)v31;

      -[GCControllerSettings registerForSettingsCustomized](v10, "registerForSettingsCustomized");
      -[GCControllerSettings initializeUserDefaults](v10, "initializeUserDefaults");
    }
    self = v10;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)unregisterForSettingsCustomized
{
  if (self->_customizedUUID)
    +[GCControllerSettings unregisterSettingsCustomizedHandlerForController:forKey:](GCControllerSettings, "unregisterSettingsCustomizedHandlerForController:forKey:", self->_uniqueIdentifier);
}

- (void)registerForSettingsCustomized
{
  NSUUID *v3;
  NSUUID *customizedUUID;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_customizedUUID)
  {
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v3 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    customizedUUID = self->_customizedUUID;
    self->_customizedUUID = v3;

    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__GCControllerSettings_registerForSettingsCustomized__block_invoke;
    v5[3] = &unk_24D2B5578;
    objc_copyWeak(&v6, &location);
    +[GCControllerSettings registerSettingsCustomizedHandler:forController:forKey:](GCControllerSettings, "registerSettingsCustomizedHandler:forController:forKey:", v5, self->_uniqueIdentifier, self->_customizedUUID);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __53__GCControllerSettings_registerForSettingsCustomized__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = objc_msgSend(v6, "containsObject:", WeakRetained[14]);
    if ((_DWORD)v10)
    {
      getGCSettingsLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v9;
        v12 = "%@ is now customized";
LABEL_8:
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (objc_msgSend(v7, "containsObject:", v9[14]))
    {
      getGCSettingsLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v9;
        v12 = "%@ is no longer customized";
        goto LABEL_8;
      }
LABEL_9:

      objc_msgSend(v9, "setCustomized:", v10);
    }
  }

}

- (void)observeDefaultsKeyPath:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a3;
  getGCSettingsLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[GCControllerSettings observeDefaultsKeyPath:options:context:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  -[NSMutableSet addObject:](self->_observedKeyPaths, "addObject:", v8);
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_defaults, "addObserver:forKeyPath:options:context:", self, v8, a4, a5);

}

- (void)dealloc
{
  NSObject *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableSet *observedKeyPaths;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  GCControllerSettings *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  getGCSettingsLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "Dealloc: %@", buf, 0xCu);
  }

  -[GCControllerSettings unregisterForSettingsCustomized](self, "unregisterForSettingsCustomized");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_observedKeyPaths;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        getGCSettingsLogger();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          observedKeyPaths = self->_observedKeyPaths;
          *(_DWORD *)buf = 138412290;
          v19 = (GCControllerSettings *)observedKeyPaths;
          _os_log_debug_impl(&dword_215181000, v10, OS_LOG_TYPE_DEBUG, "Remove observer for key path: %@", buf, 0xCu);
        }

        -[NSUserDefaults removeObserver:forKeyPath:](self->_defaults, "removeObserver:forKeyPath:", self, v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)GCControllerSettings;
  -[GCControllerSettings dealloc](&v12, sel_dealloc);
}

- (void)_updateControllerReference:(id)a3
{
  GCController **p_controller;
  NSDictionary *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSDictionary *elementMappingKeyToElement;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_controller = &self->_controller;
  objc_storeWeak((id *)&self->_controller, a3);
  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)p_controller);
  objc_msgSend(WeakRetained, "physicalInputProfile", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "remappable"))
        {
          -[GCControllerSettings mappingKeyForElement:](self, "mappingKeyForElement:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  elementMappingKeyToElement = self->_elementMappingKeyToElement;
  self->_elementMappingKeyToElement = v5;

  -[GCControllerSettings initializeElementMappings](self, "initializeElementMappings");
  -[GCControllerSettings initializeReplayKitDefaultMappings](self, "initializeReplayKitDefaultMappings");
}

- (void)setHapticsEnabled:(BOOL)a3
{
  if (self->_hapticsEnabled != a3)
  {
    self->_hapticsEnabled = a3;
    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:");
  }
}

- (void)setScreenShotEnabled:(BOOL)a3
{
  if (self->_screenShotEnabled != a3)
  {
    self->_screenShotEnabled = a3;
    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:");
  }
}

- (void)setVideoRecordingEnabled:(BOOL)a3
{
  if (self->_videoRecordingEnabled != a3)
  {
    self->_videoRecordingEnabled = a3;
    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:");
  }
}

- (void)setScreenShotKey:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_screenShotKey) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_screenShotKey, a3);
    -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", self->_screenShotKey, CFSTR("screenShotMappingKey"));
  }

}

- (void)setScreenShotGesture:(int64_t)a3
{
  id v4;

  if (self->_screenShotGesture != a3)
  {
    self->_screenShotGesture = a3;
    +[NSNumber numberWithInteger:](&off_254DED908, "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", v4, CFSTR("screenShotGestureKey"));

  }
}

- (void)setVideoRecordingKey:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_videoRecordingKey) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_videoRecordingKey, a3);
    -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", self->_videoRecordingKey, CFSTR("videoRecordingMappingKey"));
  }

}

- (void)setVideoRecordingGesture:(int64_t)a3
{
  id v4;

  if (self->_videoRecordingGesture != a3)
  {
    self->_videoRecordingGesture = a3;
    +[NSNumber numberWithInteger:](&off_254DED908, "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", v4, CFSTR("videoRecordingGestureKey"));

  }
}

- (void)setVideoRecordingMode:(int64_t)a3
{
  id v4;

  if (self->_videoRecordingMode != a3)
  {
    self->_videoRecordingMode = a3;
    +[NSNumber numberWithInteger:](&off_254DED908, "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", v4, CFSTR("videoRecordingModeKey"));

  }
}

- (GCReplayKitGestureSettings)replayKitGestureSettings
{
  return (GCReplayKitGestureSettings *)(id)-[GCReplayKitGestureSettings copy](self->_replayKitGestureSettings, "copy");
}

- (void)setReplayKitGestureSettings:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  GCReplayKitGestureSettings *v7;
  GCReplayKitGestureSettings *replayKitGestureSettings;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_replayKitGestureSettings)
  {
    v5 = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("settingsOpenedAtLeastOnce"));
    v4 = v10;
    if (v5)
    {
      +[GCAnalytics instance](GCAnalytics, "instance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendSettingsRPKitGesturesCustomized:from:", v10, self->_replayKitGestureSettings);

      v4 = v10;
    }
  }
  v7 = (GCReplayKitGestureSettings *)objc_msgSend(v4, "copy");
  replayKitGestureSettings = self->_replayKitGestureSettings;
  self->_replayKitGestureSettings = v7;

  +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](&off_254E12798, "archivedDataWithRootObject:requiringSecureCoding:error:", self->_replayKitGestureSettings, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", v9, CFSTR("replayKitSettingsMappingKey"));

}

- (void)setGameIntentMappings:(id)a3
{
  NSDictionary *v5;

  v5 = (NSDictionary *)a3;
  if (self->_general_gameIntentMappings != v5)
  {
    objc_storeStrong((id *)&self->_general_gameIntentMappings, a3);
    -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", v5, CFSTR("gameIntentKey"));
  }

}

- (void)setCustomizationsEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  if (self->_customizationsEnabled != a3)
  {
    self->_customizationsEnabled = a3;
    +[GCAnalytics instance](GCAnalytics, "instance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerSettings bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "productCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendSettingsCustomizationsToggledEventForBundleID:productCategory:toggledOn:", v5, v7, self->_customizationsEnabled);

    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:", self->_customizationsEnabled, CFSTR("customizationsEnabled"));
  }
}

- (id)staticDefaultValues
{
  _QWORD v3[11];
  _QWORD v4[12];

  v4[11] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("hapticsEnabled");
  v3[1] = CFSTR("screenShotEnabled");
  v4[0] = MEMORY[0x24BDBD1C8];
  v4[1] = MEMORY[0x24BDBD1C8];
  v3[2] = CFSTR("videoRecordingEnabled");
  v3[3] = CFSTR("gameIntentKey");
  v4[2] = MEMORY[0x24BDBD1C8];
  v4[3] = CFSTR("Button Home");
  v3[4] = CFSTR("customizedElements");
  v3[5] = CFSTR("settingsOpenedAtLeastOnce");
  v4[4] = MEMORY[0x24BDBD1A8];
  v4[5] = MEMORY[0x24BDBD1C0];
  v3[6] = CFSTR("screenShotMappingKey");
  v3[7] = CFSTR("screenShotGestureKey");
  v4[6] = &stru_24D2B85A8;
  v4[7] = &unk_24D30EEA8;
  v3[8] = CFSTR("videoRecordingMappingKey");
  v3[9] = CFSTR("videoRecordingGestureKey");
  v4[8] = &stru_24D2B85A8;
  v4[9] = &unk_24D30EEA8;
  v3[10] = CFSTR("videoRecordingModeKey");
  v4[10] = &unk_24D30EEA8;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultValues
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerSettings staticDefaultValues](self, "staticDefaultValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v9 = CFSTR("customizationsEnabled");
  v5 = -[NSString isEqualToString:](self->_bundleIdentifier, "isEqualToString:", CFSTR("default"));
  v6 = MEMORY[0x24BDBD1C0];
  if (v5)
    v6 = MEMORY[0x24BDBD1C8];
  v10[0] = v6;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  return v3;
}

- (id)suiteNameForBundleIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@%@.%@.%@"), &stru_24D2B85A8, CFSTR("com.apple.gamecontroller.settings"), self->_uniqueIdentifier, a3);
}

- (void)initializeUserDefaults
{
  void *v3;
  NSObject *v4;
  NSUserDefaults *v5;
  NSUserDefaults *defaults;
  NSUserDefaults *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *screenShotKey;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *videoRecordingKey;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *general_gameIntentMappings;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  NSArray *customizedElementSettings;
  NSObject *v37;
  _BOOL4 hapticsEnabled;
  NSObject *v39;
  GCReplayKitGestureSettings *replayKitGestureSettings;
  NSObject *v41;
  NSDictionary *v42;
  NSObject *v43;
  _BOOL4 customizationsEnabled;
  NSObject *v45;
  NSArray *v46;
  void *v47;
  _QWORD v48[14];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  -[GCControllerSettings suiteNameForBundleIdentifier:](self, "suiteNameForBundleIdentifier:", self->_bundleIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getGCSettingsLogger();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v3;
    _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "Initializing user defaults with suite = %@", buf, 0xCu);
  }

  v5 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", v3);
  defaults = self->_defaults;
  self->_defaults = v5;

  v7 = self->_defaults;
  -[GCControllerSettings staticDefaultValues](self, "staticDefaultValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults registerDefaults:](v7, "registerDefaults:", v8);

  -[GCControllerSettings initializeElementMappings](self, "initializeElementMappings");
  v48[0] = CFSTR("elementMapping");
  v48[1] = CFSTR("hapticsEnabled");
  v48[2] = CFSTR("screenShotEnabled");
  v48[3] = CFSTR("videoRecordingEnabled");
  v48[6] = CFSTR("videoRecordingMappingKey");
  v48[7] = CFSTR("videoRecordingGestureKey");
  v48[8] = CFSTR("videoRecordingModeKey");
  v48[9] = CFSTR("replayKitSettingsMappingKey");
  v48[4] = CFSTR("screenShotMappingKey");
  v48[5] = CFSTR("screenShotGestureKey");
  v48[10] = CFSTR("gameIntentKey");
  v48[11] = CFSTR("customizationsEnabled");
  v48[12] = CFSTR("customizedElements");
  v48[13] = CFSTR("settingsOpenedAtLeastOnce");
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v48, 14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerSettings observeDefaultsKeyPaths:](self, "observeDefaultsKeyPaths:", v9);

  self->_hapticsEnabled = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("hapticsEnabled"));
  self->_screenShotEnabled = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("screenShotEnabled"));
  self->_videoRecordingEnabled = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("videoRecordingEnabled"));
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("screenShotMappingKey"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  screenShotKey = self->_screenShotKey;
  self->_screenShotKey = v10;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("screenShotGestureKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[NSNull null](&off_254E06A98, "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v13)
      self->_screenShotGesture = objc_msgSend(v12, "integerValue");
  }
  v47 = v12;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("videoRecordingMappingKey"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  videoRecordingKey = self->_videoRecordingKey;
  self->_videoRecordingKey = v14;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("videoRecordingGestureKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    +[NSNull null](&off_254E06A98, "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v17)
      self->_videoRecordingGesture = objc_msgSend(v16, "integerValue");
  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("videoRecordingModeKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[NSNull null](&off_254E06A98, "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 != v19)
      self->_videoRecordingMode = objc_msgSend(v18, "integerValue");
  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("replayKitSettingsMappingKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[NSNull null](&off_254E06A98, "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 != v21)
    {
      v22 = v20;
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v23, v24, objc_opt_class(), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](&off_254E12C00, "unarchivedObjectOfClasses:fromData:error:", v25, v22, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        objc_storeStrong((id *)&self->_replayKitGestureSettings, v26);

    }
  }
  -[GCControllerSettings initializeReplayKitDefaultMappings](self, "initializeReplayKitDefaultMappings");
  if (-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("settingsOpenedAtLeastOnce"))
    || !self->_settingsAppOpenedAtLeastOnce)
  {
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("settingsOpenedAtLeastOnce"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      self->_settingsAppOpenedAtLeastOnce = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("settingsOpenedAtLeastOnce"));
  }
  else
  {
    -[GCControllerSettings saveBool:forKey:](self, "saveBool:forKey:", 1, CFSTR("settingsOpenedAtLeastOnce"));
  }
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("gameIntentKey"));
  v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  general_gameIntentMappings = self->_general_gameIntentMappings;
  self->_general_gameIntentMappings = v28;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("customizationsEnabled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerSettings defaultValues](self, "defaultValues");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", CFSTR("customizationsEnabled"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    v33 = v30;
  else
    v33 = v32;
  self->_customizationsEnabled = objc_msgSend(v33, "BOOLValue");
  -[NSUserDefaults arrayForKey:](self->_defaults, "arrayForKey:", CFSTR("customizedElements"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (NSArray *)objc_msgSend(v34, "mutableCopy");
  customizedElementSettings = self->_customizedElementSettings;
  self->_customizedElementSettings = v35;

  -[GCControllerSettings populateElementSettings](self, "populateElementSettings");
  getGCSettingsLogger();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    hapticsEnabled = self->_hapticsEnabled;
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = hapticsEnabled;
    _os_log_impl(&dword_215181000, v37, OS_LOG_TYPE_INFO, "Initialized hapticsEnabled to %d", buf, 8u);
  }

  getGCSettingsLogger();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    replayKitGestureSettings = self->_replayKitGestureSettings;
    *(_DWORD *)buf = 138412290;
    v50 = replayKitGestureSettings;
    _os_log_impl(&dword_215181000, v39, OS_LOG_TYPE_INFO, "Initialized replayKitGestureSettings to %@", buf, 0xCu);
  }

  getGCSettingsLogger();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = self->_general_gameIntentMappings;
    *(_DWORD *)buf = 138412290;
    v50 = v42;
    _os_log_impl(&dword_215181000, v41, OS_LOG_TYPE_INFO, "Initialized gameIntentMappings to %@", buf, 0xCu);
  }

  getGCSettingsLogger();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    customizationsEnabled = self->_customizationsEnabled;
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = customizationsEnabled;
    _os_log_impl(&dword_215181000, v43, OS_LOG_TYPE_INFO, "Initialized customizationsEnabled to %d", buf, 8u);
  }

  getGCSettingsLogger();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = self->_customizedElementSettings;
    *(_DWORD *)buf = 138412290;
    v50 = v46;
    _os_log_impl(&dword_215181000, v45, OS_LOG_TYPE_INFO, "Initialized customizedElementSettings to %@", buf, 0xCu);
  }

}

- (void)observeDefaultsKeyPaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[GCControllerSettings observeDefaultsKeyPath:options:context:](self, "observeDefaultsKeyPath:options:context:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 3, kGCSettingsContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)initializeReplayKitDefaultMappings
{
  GCController **p_controller;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  GCReplayKitGestureSettings *v13;
  GCReplayKitGestureSettings *replayKitGestureSettings;
  NSObject *v15;
  GCReplayKitGestureSettings *v16;
  _BOOL4 settingsAppOpenedAtLeastOnce;
  int v18;
  GCReplayKitGestureSettings *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_controller);
    objc_msgSend(v5, "physicalInputProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Button Share"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = CFSTR("Button Options");
    if (v8)
    {
      v9 = CFSTR("Button Share");
      v10 = 0;
    }
    else
    {
      v10 = -1;
    }
    if (v8)
      v11 = -1;
    else
      v11 = 0;
    v12 = v9;
    v13 = objc_alloc_init(GCReplayKitGestureSettings);
    -[GCReplayKitGestureSettings setControllerElementMappingKey:](v13, "setControllerElementMappingKey:", v12);
    -[GCReplayKitGestureSettings setSinglePressGesture:](v13, "setSinglePressGesture:", v10);
    -[GCReplayKitGestureSettings setDoublePressGesture:](v13, "setDoublePressGesture:", v11);
    -[GCReplayKitGestureSettings setLongPressGesture:](v13, "setLongPressGesture:", 1);
    replayKitGestureSettings = self->_replayKitGestureSettings;
    if (self->_serialized)
    {
      if (!replayKitGestureSettings || !self->_settingsAppOpenedAtLeastOnce)
      {
        objc_storeStrong((id *)&self->_replayKitGestureSettings, v13);
        -[GCReplayKitGestureSettings setControllerElementMappingKey:](self->_replayKitGestureSettings, "setControllerElementMappingKey:", v12);
        getGCSettingsLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = self->_replayKitGestureSettings;
          settingsAppOpenedAtLeastOnce = self->_settingsAppOpenedAtLeastOnce;
          v18 = 138412546;
          v19 = v16;
          v20 = 1024;
          v21 = settingsAppOpenedAtLeastOnce;
          _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "Default ReplayKit settings = {\n                              _replayKitGestureSettings = %@\n                              _settingsAppOpenedAtLeastOnce = %d\n", (uint8_t *)&v18, 0x12u);
        }

      }
    }
    else if (!replayKitGestureSettings
           || !-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("settingsOpenedAtLeastOnce")))
    {
      -[GCControllerSettings setReplayKitGestureSettings:](self, "setReplayKitGestureSettings:", v13);
    }

  }
}

- (void)initializeElementMappings
{
  OUTLINED_FUNCTION_0_21(&dword_215181000, a2, a3, "Initialized element mappings from user defaults to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_20();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  __CFString *v10;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void (**settingsChangedHandler)(id, GCControllerSettings *);
  void *v23;
  NSArray *v24;
  NSArray *customizedElementSettings;
  NSString *v26;
  NSDictionary *screenShotKey;
  uint64_t v28;
  void *v29;
  char isKindOfClass;
  const __CFString *v31;
  void *v32;
  NSString *v33;
  GCControllerSettings *v34;
  const __CFString *v35;
  void (**v36)(id, GCControllerSettings *);
  uint64_t v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  GCReplayKitGestureSettings *v50;
  GCReplayKitGestureSettings *replayKitGestureSettings;
  NSDictionary *v52;
  objc_super v53;
  uint8_t buf[4];
  GCControllerSettings *v55;
  __int16 v56;
  __CFString *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  getGCSettingsLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v55 = self;
    v56 = 2112;
    v57 = v10;
    v58 = 2112;
    v59 = v11;
    v60 = 2112;
    v61 = v12;
    v62 = 2048;
    v63 = a6;
    _os_log_debug_impl(&dword_215181000, v13, OS_LOG_TYPE_DEBUG, "%@ observeValueForKeyPath: %@ ofObject:%@ change:%@ context:%p", buf, 0x34u);
  }

  if ((void *)kGCSettingsContext != a6)
  {
    if ((void *)kGCSettingsElementMappingsContext == a6)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_elementSettings, "objectForKeyedSubscript:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[NSNull null](&off_254E06A98, "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (v20)
          v21 = 0;
        else
          v21 = v18;
        objc_msgSend(v17, "setDictionaryRepresentation:", v21);
        settingsChangedHandler = (void (**)(id, GCControllerSettings *))self->_settingsChangedHandler;
        if (settingsChangedHandler)
          settingsChangedHandler[2](settingsChangedHandler, self);

      }
    }
    else
    {
      v53.receiver = self;
      v53.super_class = (Class)GCControllerSettings;
      -[GCControllerSettings observeValueForKeyPath:ofObject:change:context:](&v53, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    }
    goto LABEL_44;
  }
  if (v10 == CFSTR("elementMapping"))
  {
    v14 = CFSTR("elementMappings");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("elementMappings"));
    -[GCControllerSettings initializeElementMappings](self, "initializeElementMappings");
LABEL_40:
    v34 = self;
    v35 = v14;
LABEL_41:
    -[GCControllerSettings didChangeValueForKey:](v34, "didChangeValueForKey:", v35);
    goto LABEL_42;
  }
  if (v10 == CFSTR("hapticsEnabled"))
  {
    v14 = CFSTR("hapticsEnabled");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hapticsEnabled"));
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hapticsEnabled = objc_msgSend(v15, "BOOLValue");
LABEL_39:

    goto LABEL_40;
  }
  if (v10 == CFSTR("customizationsEnabled"))
  {
    v14 = CFSTR("customizationsEnabled");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("customizationsEnabled"));
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_customizationsEnabled = objc_msgSend(v15, "BOOLValue");
    goto LABEL_39;
  }
  if (CFSTR("customizedElements") == v10)
  {
    v14 = CFSTR("customizedElementSettings");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("customizedElementSettings"));
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (NSArray *)objc_msgSend(v23, "mutableCopy");
    customizedElementSettings = self->_customizedElementSettings;
    self->_customizedElementSettings = v24;

    -[GCControllerSettings populateElementSettings](self, "populateElementSettings");
    goto LABEL_40;
  }
  if (v10 == CFSTR("screenShotEnabled"))
  {
    v14 = CFSTR("screenShotEnabled");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("screenShotEnabled"));
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_screenShotEnabled = objc_msgSend(v15, "BOOLValue");
    goto LABEL_39;
  }
  if (v10 == CFSTR("videoRecordingEnabled"))
  {
    v14 = CFSTR("videoRecordingEnabled");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoRecordingEnabled"));
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_videoRecordingEnabled = objc_msgSend(v15, "BOOLValue");
    goto LABEL_39;
  }
  if (v10 == CFSTR("screenShotMappingKey"))
  {
    v14 = CFSTR("screenShotMappingKey");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("screenShotMappingKey"));
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (NSString *)objc_msgSend(v15, "mutableCopy");
    screenShotKey = (NSDictionary *)self->_screenShotKey;
    self->_screenShotKey = v26;
LABEL_38:

    goto LABEL_39;
  }
  if (v10 == CFSTR("screenShotGestureKey"))
  {
    v28 = *MEMORY[0x24BDD0E70];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_42;
    v31 = CFSTR("screenShotGestureKey");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("screenShotGestureKey"));
    objc_msgSend(v12, "objectForKeyedSubscript:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    self->_screenShotGesture = objc_msgSend(v32, "integerValue");
    goto LABEL_49;
  }
  if (v10 == CFSTR("videoRecordingMappingKey"))
  {
    v14 = CFSTR("videoRecordingMappingKey");
    -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoRecordingMappingKey"));
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (NSString *)objc_msgSend(v15, "mutableCopy");
    screenShotKey = (NSDictionary *)self->_videoRecordingKey;
    self->_videoRecordingKey = v33;
    goto LABEL_38;
  }
  if (v10 == CFSTR("videoRecordingGestureKey"))
  {
    v37 = *MEMORY[0x24BDD0E70];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = objc_opt_isKindOfClass();

    if ((v39 & 1) == 0)
    {
      v31 = CFSTR("videoRecordingGestureKey");
      -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoRecordingGestureKey"));
      objc_msgSend(v12, "objectForKeyedSubscript:", v37);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      self->_videoRecordingGesture = objc_msgSend(v32, "integerValue");
LABEL_49:

      v34 = self;
      v35 = v31;
      goto LABEL_41;
    }
  }
  else
  {
    if (v10 != CFSTR("videoRecordingModeKey"))
    {
      if (v10 == CFSTR("replayKitSettingsMappingKey"))
      {
        v43 = *MEMORY[0x24BDD0E70];
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v45 = objc_opt_isKindOfClass();

        if ((v45 & 1) == 0)
        {
          -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("replayKitSettingsMappingKey"));
          objc_msgSend(v12, "objectForKeyedSubscript:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_opt_class();
          v48 = objc_opt_class();
          +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v47, v48, objc_opt_class(), 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](&off_254E12C00, "unarchivedObjectOfClasses:fromData:error:", v49, v46, 0);
          v50 = (GCReplayKitGestureSettings *)objc_claimAutoreleasedReturnValue();
          replayKitGestureSettings = self->_replayKitGestureSettings;
          self->_replayKitGestureSettings = v50;

          -[GCControllerSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("replayKitSettingsMappingKey"));
        }
        goto LABEL_42;
      }
      if (v10 != CFSTR("gameIntentKey"))
      {
        if (v10 != CFSTR("settingsOpenedAtLeastOnce"))
          goto LABEL_42;
        v14 = CFSTR("settingsOpenedAtLeastOnce");
        -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("settingsOpenedAtLeastOnce"));
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self->_settingsAppOpenedAtLeastOnce = objc_msgSend(v15, "integerValue") != 0;
        goto LABEL_39;
      }
      v14 = CFSTR("gameIntentKey");
      -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("gameIntentKey"));
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (NSDictionary *)objc_msgSend(v15, "mutableCopy");
      screenShotKey = self->_general_gameIntentMappings;
      self->_general_gameIntentMappings = v52;
      goto LABEL_38;
    }
    v40 = *MEMORY[0x24BDD0E70];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = objc_opt_isKindOfClass();

    if ((v42 & 1) == 0)
    {
      v31 = CFSTR("videoRecordingModeKey");
      -[GCControllerSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("videoRecordingModeKey"));
      objc_msgSend(v12, "objectForKeyedSubscript:", v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      self->_videoRecordingMode = objc_msgSend(v32, "integerValue");
      goto LABEL_49;
    }
  }
LABEL_42:
  v36 = (void (**)(id, GCControllerSettings *))self->_settingsChangedHandler;
  if (v36)
    v36[2](v36, self);
LABEL_44:

}

- (id)mappingForElement:(id)a3
{
  id v4;
  NSMutableDictionary *elementMappings;
  void *v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(v4, "remappable") & 1) != 0)
  {
    elementMappings = self->_elementMappings;
    -[GCControllerSettings mappingKeyForElement:](self, "mappingKeyForElement:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](elementMappings, "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (id)mappingForButton:(id)a3
{
  void *v3;
  id v4;

  -[GCControllerSettings mappingForElement:](self, "mappingForElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)mappingForDirectionPad:(id)a3
{
  void *v3;
  id v4;

  -[GCControllerSettings mappingForElement:](self, "mappingForElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)mappingForTouchpad:(id)a3
{
  void *v3;
  id v4;

  -[GCControllerSettings mappingForElement:](self, "mappingForElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 hapticsEnabled;
  _BOOL4 screenShotEnabled;
  _BOOL4 videoRecordingEnabled;
  NSString *screenShotKey;
  int64_t screenShotGesture;
  NSString *videoRecordingKey;
  int64_t videoRecordingGesture;
  int64_t videoRecordingMode;
  NSDictionary *general_gameIntentMappings;
  _BOOL4 customizationsEnabled;
  NSMutableDictionary *elementMappingFromUserDefaults;
  NSArray *customizedElementSettings;
  NSMutableDictionary *elementSettings;
  NSCopying *uniqueIdentifier;
  NSString *bundleIdentifier;
  _BOOL4 settingsAppOpenedAtLeastOnce;
  int v22;
  NSMutableDictionary *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  NSDictionary *v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  NSArray *v45;
  __int16 v46;
  NSMutableDictionary *v47;
  __int16 v48;
  NSCopying *v49;
  __int16 v50;
  NSString *v51;
  __int16 v52;
  _BOOL4 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->__elementMappingFromUserDefaults, CFSTR("__elementMappingFromUserDefaults"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hapticsEnabled, CFSTR("_hapticsEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_screenShotEnabled, CFSTR("_screenShotEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_videoRecordingEnabled, CFSTR("_videoRecordingEnabled"));
  if (self->_settingsAppOpenedAtLeastOnce)
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_screenShotKey, CFSTR("_screenShotKey"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_screenShotGesture, CFSTR("_screenShotGesture"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_videoRecordingKey, CFSTR("_videoRecordingKey"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_videoRecordingGesture, CFSTR("_videoRecordingGesture"));
    objc_msgSend(v4, "encodeInteger:forKey:", self->_videoRecordingMode, CFSTR("_videoRecordingMode"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_replayKitGestureSettings, CFSTR("_replayKitGestureSettings"));
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_general_gameIntentMappings, CFSTR("_general_gameIntentMappings"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_customizationsEnabled, CFSTR("_customizationsEnabled"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_customizedElementSettings, CFSTR("_customizedElementSettings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_elementSettings, CFSTR("_elementSettings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("_uniqueIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_settingsAppOpenedAtLeastOnce, CFSTR("_settingsAppOpenedAtLeastOnce"));
  getGCSettingsLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    hapticsEnabled = self->_hapticsEnabled;
    screenShotEnabled = self->_screenShotEnabled;
    videoRecordingEnabled = self->_videoRecordingEnabled;
    screenShotKey = self->_screenShotKey;
    screenShotGesture = self->_screenShotGesture;
    videoRecordingKey = self->_videoRecordingKey;
    videoRecordingGesture = self->_videoRecordingGesture;
    videoRecordingMode = self->_videoRecordingMode;
    general_gameIntentMappings = self->_general_gameIntentMappings;
    customizationsEnabled = self->_customizationsEnabled;
    elementMappingFromUserDefaults = self->__elementMappingFromUserDefaults;
    customizedElementSettings = self->_customizedElementSettings;
    elementSettings = self->_elementSettings;
    uniqueIdentifier = self->_uniqueIdentifier;
    bundleIdentifier = self->_bundleIdentifier;
    settingsAppOpenedAtLeastOnce = self->_settingsAppOpenedAtLeastOnce;
    v22 = 138416130;
    v23 = elementMappingFromUserDefaults;
    v24 = 1024;
    v25 = hapticsEnabled;
    v26 = 1024;
    v27 = screenShotEnabled;
    v28 = 1024;
    v29 = videoRecordingEnabled;
    v30 = 2112;
    v31 = screenShotKey;
    v32 = 1024;
    v33 = screenShotGesture;
    v34 = 2112;
    v35 = videoRecordingKey;
    v36 = 1024;
    v37 = videoRecordingGesture;
    v38 = 1024;
    v39 = videoRecordingMode;
    v40 = 2112;
    v41 = general_gameIntentMappings;
    v42 = 1024;
    v43 = customizationsEnabled;
    v44 = 2112;
    v45 = customizedElementSettings;
    v46 = 2112;
    v47 = elementSettings;
    v48 = 2112;
    v49 = uniqueIdentifier;
    v50 = 2112;
    v51 = bundleIdentifier;
    v52 = 1024;
    v53 = settingsAppOpenedAtLeastOnce;
    _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "Encoded settings = {\n                      __elementMappingFromUserDefaults = %@\n                      _hapticsEnabled = %d\n                      _screenShotEnabled = %d\n                      _videoRecordingEnabled = %d\n                      _screenShotKey = %@\n                      _screenShotGesture = %d\n                      _videoRecordingKey = %@\n                      _videoRecordingGesture = %d\n                      _videoRecordingMode = %d\n                      _general_gameIntentMappings = %@\n                      _customizationsEnabled = %d\n                      _customizedElementSettings = %@\n                      _elementSettings = %@\n                      _uniqueIdentifier = %@\n                      _bundleIdentifier = %@\n"
      "                      _settingsAppOpenedAtLeastOnce = %d\n",
      (uint8_t *)&v22,
      0x82u);
  }

}

- (GCControllerSettings)initWithCoder:(id)a3
{
  id v4;
  GCControllerSettings *v5;
  GCControllerSettings *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *elementMappingFromUserDefaults;
  int v11;
  void *v12;
  uint64_t v13;
  NSString *screenShotKey;
  void *v15;
  uint64_t v16;
  NSString *videoRecordingKey;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  GCReplayKitGestureSettings *replayKitGestureSettings;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *general_gameIntentMappings;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *customizedElementSettings;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *elementSettings;
  void *v36;
  uint64_t v37;
  NSCopying *uniqueIdentifier;
  uint64_t v39;
  NSString *bundleIdentifier;
  uint64_t v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GCControllerSettings;
  v5 = -[GCControllerSettings init](&v43, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_serialized = 1;
    v7 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("__elementMappingFromUserDefaults"));
    v9 = objc_claimAutoreleasedReturnValue();
    elementMappingFromUserDefaults = v6->__elementMappingFromUserDefaults;
    v6->__elementMappingFromUserDefaults = (NSMutableDictionary *)v9;

    v6->_hapticsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hapticsEnabled"));
    v6->_screenShotEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_screenShotEnabled"));
    v6->_videoRecordingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_videoRecordingEnabled"));
    v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_settingsAppOpenedAtLeastOnce"));
    v6->_settingsAppOpenedAtLeastOnce = v11;
    if (v11)
    {
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_screenShotKey"));
      v13 = objc_claimAutoreleasedReturnValue();
      screenShotKey = v6->_screenShotKey;
      v6->_screenShotKey = (NSString *)v13;

      v6->_screenShotGesture = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_screenShotGesture"));
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_videoRecordingKey"));
      v16 = objc_claimAutoreleasedReturnValue();
      videoRecordingKey = v6->_videoRecordingKey;
      v6->_videoRecordingKey = (NSString *)v16;

      v6->_videoRecordingGesture = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_videoRecordingGesture"));
      v6->_videoRecordingMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_videoRecordingMode"));
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v18, v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("_replayKitGestureSettings"));
      v21 = objc_claimAutoreleasedReturnValue();
      replayKitGestureSettings = v6->_replayKitGestureSettings;
      v6->_replayKitGestureSettings = (GCReplayKitGestureSettings *)v21;

    }
    v23 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("_general_gameIntentMappings"));
    v25 = objc_claimAutoreleasedReturnValue();
    general_gameIntentMappings = v6->_general_gameIntentMappings;
    v6->_general_gameIntentMappings = (NSDictionary *)v25;

    v6->_customizationsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_customizationsEnabled"));
    v27 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("_customizedElementSettings"));
    v29 = objc_claimAutoreleasedReturnValue();
    customizedElementSettings = v6->_customizedElementSettings;
    v6->_customizedElementSettings = (NSArray *)v29;

    v31 = objc_opt_class();
    v32 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v31, v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("_elementSettings"));
    v34 = objc_claimAutoreleasedReturnValue();
    elementSettings = v6->_elementSettings;
    v6->_elementSettings = (NSMutableDictionary *)v34;

    GCIPCObjectIdentifier_Classes();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("_uniqueIdentifier"));
    v37 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSCopying *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v39 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v39;

    v41 = gcControllerSettingsID++;
    v6->_settingsID = v41;
  }

  return v6;
}

- (void)setMappingForElement:(id)a3 toElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSString *bundleIdentifier;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *elementMappingFromUserDefaults;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "remappable") && objc_msgSend(v7, "remappable"))
  {
    -[GCControllerSettings mappingKeyForElement:](self, "mappingKeyForElement:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerSettings mappingKeyForElement:](self, "mappingKeyForElement:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_elementMappings, "objectForKeyedSubscript:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v7)
    {
      getGCSettingsLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v6;
        v22 = 2112;
        v23 = v7;
        _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "%@ already maps to %@!", buf, 0x16u);
      }

    }
    else
    {
      v19 = v9;
      +[GCAnalytics instance](GCAnalytics, "instance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      bundleIdentifier = self->_bundleIdentifier;
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "productCategory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      mappingKeyForElement(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendSettingsButtonCustomizedEventForBundleID:productCategory:button:", bundleIdentifier, v14, v15);

      +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", self->_elementMappings);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v8);
      objc_storeStrong((id *)&self->_elementMappings, v16);
      elementMappingFromUserDefaults = self->__elementMappingFromUserDefaults;
      if (v6 == v7)
      {
        -[NSMutableDictionary removeObjectForKey:](elementMappingFromUserDefaults, "removeObjectForKey:", v8);
        v9 = v19;
      }
      else
      {
        v9 = v19;
        -[NSMutableDictionary setObject:forKeyedSubscript:](elementMappingFromUserDefaults, "setObject:forKeyedSubscript:", v19, v8);
      }
      if (-[NSMutableDictionary count](self->__elementMappingFromUserDefaults, "count"))
        -[GCControllerSettings saveObject:forKey:](self, "saveObject:forKey:", self->__elementMappingFromUserDefaults, CFSTR("elementMapping"));
      else
        -[GCControllerSettings deleteObjectForKey:](self, "deleteObjectForKey:", CFSTR("elementMapping"));

    }
  }

}

- (id)elementSettingForKey:(id)a3
{
  id v4;
  void *v5;
  GCControllerElementSettings *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_elementSettings, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_elementSettings, "objectForKeyedSubscript:", v4);
      v6 = (GCControllerElementSettings *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = -[GCControllerElementSettings initWithElementKey:]([GCControllerElementSettings alloc], "initWithElementKey:", v4);
      objc_initWeak(&location, self);
      -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        -[GCControllerElementSettings setDictionaryRepresentation:](v6, "setDictionaryRepresentation:", v7);
      -[GCControllerSettings observeDefaultsKeyPath:options:context:](self, "observeDefaultsKeyPath:options:context:", v4, 1, kGCSettingsElementMappingsContext);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementSettings, "setObject:forKeyedSubscript:", v6, v4);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __45__GCControllerSettings_elementSettingForKey___block_invoke;
      v9[3] = &unk_24D2B55A0;
      objc_copyWeak(&v11, &location);
      v10 = v4;
      -[GCControllerElementSettings setChangedHandler:](v6, "setChangedHandler:", v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __45__GCControllerSettings_elementSettingForKey___block_invoke(uint64_t a1, void *a2)
{
  char *WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[GCAnalytics instance](GCAnalytics, "instance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *((_QWORD *)WeakRetained + 14);
    v6 = objc_loadWeakRetained((id *)WeakRetained + 6);
    objc_msgSend(v6, "productCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mappingKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendSettingsButtonCustomizedEventForBundleID:productCategory:button:", v5, v7, v8);

    LODWORD(v4) = objc_msgSend(v17, "isCustomized");
    v9 = (id *)(WeakRetained + 40);
    v10 = objc_msgSend(*((id *)WeakRetained + 5), "containsObject:", *(_QWORD *)(a1 + 32));
    if ((_DWORD)v4)
    {
      if ((v10 & 1) == 0)
      {
        v11 = (void *)objc_msgSend(*((id *)WeakRetained + 5), "mutableCopy");
        objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 32));
        v12 = (void *)*((_QWORD *)WeakRetained + 5);
        *((_QWORD *)WeakRetained + 5) = v11;
        v13 = v11;

        objc_msgSend(WeakRetained, "saveObject:forKey:", *((_QWORD *)WeakRetained + 5), CFSTR("customizedElements"));
      }
      objc_msgSend(v17, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mappingKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "saveObject:forKey:", v14, v15);

    }
    else
    {
      if (v10)
      {
        v16 = (void *)objc_msgSend(*v9, "mutableCopy");
        objc_msgSend(v16, "removeObject:", *(_QWORD *)(a1 + 32));
        objc_storeStrong((id *)WeakRetained + 5, v16);
        if (objc_msgSend(*v9, "count"))
          objc_msgSend(WeakRetained, "saveObject:forKey:", *((_QWORD *)WeakRetained + 5), CFSTR("customizedElements"));
        else
          objc_msgSend(WeakRetained, "deleteObjectForKey:", CFSTR("customizedElements"));

      }
      objc_msgSend(v17, "mappingKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "deleteObjectForKey:", v14);
    }

  }
}

- (void)populateElementSettings
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_customizedElementSettings;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = -[GCControllerSettings elementSettingForKey:](self, "elementSettingForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)settingsForElement:(id)a3
{
  void *v4;
  void *v5;

  -[GCControllerSettings mappingKeyForElement:](self, "mappingKeyForElement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerSettings elementSettingForKey:](self, "elementSettingForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)eraseAllSettings
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSUserDefaults *defaults;
  NSObject *v14;
  void *v15;
  NSString *bundleIdentifier;
  id WeakRetained;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  getGCSettingsLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "eraseAllSettings", buf, 2u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSUserDefaults dictionaryRepresentation](self->_defaults, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        getGCSettingsLogger();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v9;
          _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "Erasing %@...", buf, 0xCu);
        }

        -[GCControllerSettings defaultValues](self, "defaultValues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        defaults = self->_defaults;
        if (v12)
          -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v12, v9);
        else
          -[NSUserDefaults removeObjectForKey:](defaults, "removeObjectForKey:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  getGCSettingsLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, "Initializing Replay Kit default mappings...", buf, 2u);
  }

  -[GCControllerSettings initializeReplayKitDefaultMappings](self, "initializeReplayKitDefaultMappings");
  +[GCAnalytics instance](GCAnalytics, "instance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "productCategory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendSettingsCustomizationsResetEventForBundleID:productCategory:", bundleIdentifier, v18);

  +[GCControllerSettings setSettingsExist:forBundleIdentifier:](GCControllerSettings, "setSettingsExist:forBundleIdentifier:", 0, self->_bundleIdentifier);
  +[GCControllerSettings setSettingsExist:forController:forBundleIdentifier:](GCControllerSettings, "setSettingsExist:forController:forBundleIdentifier:", 0, self->_uniqueIdentifier, self->_bundleIdentifier);
}

- (void)restoreElementMappingToDefault
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_customizedElementSettings;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[GCControllerSettings deleteObjectForKey:](self, "deleteObjectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[GCControllerSettings deleteObjectForKey:](self, "deleteObjectForKey:", CFSTR("customizedElements"));
  -[GCControllerSettings deleteObjectForKey:](self, "deleteObjectForKey:", CFSTR("elementMapping"));
}

- (void)deleteObjectForKey:(id)a3
{
  id v4;
  NSUserDefaults *defaults;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  GCControllerSettings *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    defaults = self->_defaults;
    if (defaults)
    {
      -[NSUserDefaults objectForKey:](defaults, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      getGCSettingsLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138412802;
          v11 = self;
          v12 = 2112;
          v13 = v4;
          v14 = 2112;
          v15 = v9;
          _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "%@ - deleting from disk %@ -> %@", (uint8_t *)&v10, 0x20u);

        }
        -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", v4);
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[GCControllerSettings deleteObjectForKey:].cold.1((uint64_t)self, (uint64_t)v4, v8);

      }
    }
  }

}

- (void)refreshSettingsExist
{
  void *v3;
  _BOOL8 v4;

  -[NSUserDefaults dictionaryRepresentation](self->_defaults, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  +[GCControllerSettings setSettingsExist:forBundleIdentifier:](GCControllerSettings, "setSettingsExist:forBundleIdentifier:", v4, self->_bundleIdentifier);
  +[GCControllerSettings setSettingsExist:forController:forBundleIdentifier:](GCControllerSettings, "setSettingsExist:forController:forBundleIdentifier:", v4, self->_uniqueIdentifier, self->_bundleIdentifier);
}

- (void)saveObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  GCControllerSettings *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_defaults)
  {
    getGCSettingsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "%@ - saving to disk %@ -> %@", (uint8_t *)&v9, 0x20u);
    }

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v6, v7);
    -[GCControllerSettings refreshSettingsExist](self, "refreshSettingsExist");
  }

}

- (void)saveBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  GCControllerSettings *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self->_defaults)
  {
    getGCSettingsLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412802;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      v12 = 1024;
      v13 = v4;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "%@ - saving to disk %@ -> %d", (uint8_t *)&v8, 0x1Cu);
    }

    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v4, v6);
    -[GCControllerSettings refreshSettingsExist](self, "refreshSettingsExist");
  }

}

- (id)mappingKeyForElement:(id)a3
{
  return (id)objc_msgSend(a3, "primaryAlias");
}

- (id)description
{
  uint64_t v3;
  unint64_t settingsID;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  settingsID = self->_settingsID;
  -[GCControllerSettings suiteNameForBundleIdentifier:](self, "suiteNameForBundleIdentifier:", self->_bundleIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ id=%lu suite=%@>"), v3, settingsID, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSCopying)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDictionary)elementMappings
{
  return &self->_elementMappings->super;
}

- (BOOL)hapticsEnabled
{
  return self->_hapticsEnabled;
}

- (BOOL)screenShotEnabled
{
  return self->_screenShotEnabled;
}

- (BOOL)videoRecordingEnabled
{
  return self->_videoRecordingEnabled;
}

- (BOOL)customizationsEnabled
{
  return self->_customizationsEnabled;
}

- (BOOL)serialized
{
  return self->_serialized;
}

- (void)setSerialized:(BOOL)a3
{
  self->_serialized = a3;
}

- (NSString)screenShotKey
{
  return self->_screenShotKey;
}

- (int64_t)screenShotGesture
{
  return self->_screenShotGesture;
}

- (NSString)videoRecordingKey
{
  return self->_videoRecordingKey;
}

- (int64_t)videoRecordingGesture
{
  return self->_videoRecordingGesture;
}

- (int64_t)videoRecordingMode
{
  return self->_videoRecordingMode;
}

- (NSDictionary)general_gameIntentMappings
{
  return self->_general_gameIntentMappings;
}

- (BOOL)customized
{
  return self->_customized;
}

- (void)setCustomized:(BOOL)a3
{
  self->_customized = a3;
}

- (id)settingsChangedHandler
{
  return self->_settingsChangedHandler;
}

- (void)setSettingsChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unint64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(unint64_t)a3
{
  self->_settingsID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_settingsChangedHandler, 0);
  objc_storeStrong((id *)&self->_general_gameIntentMappings, 0);
  objc_storeStrong((id *)&self->_videoRecordingKey, 0);
  objc_storeStrong((id *)&self->_screenShotKey, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_replayKitGestureSettings, 0);
  objc_storeStrong((id *)&self->_observedKeyPaths, 0);
  objc_storeStrong((id *)&self->_elementSettings, 0);
  objc_storeStrong((id *)&self->_customizedUUID, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_customizedElementSettings, 0);
  objc_storeStrong((id *)&self->__elementMappingFromUserDefaults, 0);
  objc_storeStrong((id *)&self->_elementMappings, 0);
  objc_storeStrong((id *)&self->_elementMappingKeyToElement, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)observeDefaultsKeyPath:(uint64_t)a3 options:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_21(&dword_215181000, a2, a3, "Observe: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_20();
}

- (void)deleteObjectForKey:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_215181000, log, OS_LOG_TYPE_ERROR, "%@ - attempting to delete %@ from disk, but it doesn't exist!", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_20();
}

@end
