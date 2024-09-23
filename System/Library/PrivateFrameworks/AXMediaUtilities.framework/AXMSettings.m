@implementation AXMSettings

+ (id)settings
{
  if (settings_onceToken != -1)
    dispatch_once(&settings_onceToken, &__block_literal_global_19);
  return (id)settings__Settings;
}

void __23__AXMSettings_settings__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXMSettings _init]([AXMSettings alloc], "_init");
  v1 = (void *)settings__Settings;
  settings__Settings = (uint64_t)v0;

}

- (id)_init
{
  AXMSettings *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *queue_settingObservers;
  id v7;
  uint64_t v8;
  NSUserDefaults *defaults;
  NSUserDefaults *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)AXMSettings;
  v2 = -[AXMSettings init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXMSetting", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    queue_settingObservers = v2->_queue_settingObservers;
    v2->_queue_settingObservers = (NSMutableDictionary *)v5;

    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v8 = objc_msgSend(v7, "initWithSuiteName:", AXMBundleID);
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v8;

    v10 = v2->_defaults;
    v14[0] = CFSTR("writeOutInputImages");
    v14[1] = CFSTR("writeOutOCRInputImages");
    v15[0] = MEMORY[0x1E0C9AAA0];
    v15[1] = MEMORY[0x1E0C9AAA0];
    v14[2] = CFSTR("writeOutScreenCaptures");
    v14[3] = CFSTR("useANODModelForAXElementVision");
    v15[2] = MEMORY[0x1E0C9AAA0];
    v15[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults registerDefaults:](v10, "registerDefaults:", v11);

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_defaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("writeOutInputImages"), 1, AXMSettingsKVOContext);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_defaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("writeOutOCRInputImages"), 1, AXMSettingsKVOContext);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_defaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("writeOutScreenCaptures"), 1, AXMSettingsKVOContext);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_defaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("useANODModelForAXElementVision"), 1, AXMSettingsKVOContext);
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *queue;
  objc_super v14;
  _QWORD block[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if ((void *)AXMSettingsKVOContext == a6)
  {
    AXMediaLogSettings();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1B0E3B000, v12, OS_LOG_TYPE_INFO, "Did get KVO update for key: '%@'. change: %@", buf, 0x16u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AXMSettings_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E625CB18;
    block[4] = self;
    v16 = v10;
    dispatch_async(queue, block);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXMSettings;
    -[AXMSettings observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
  }

}

void __62__AXMSettings_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = MEMORY[0x1B5E12AE8](*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6) + 16));
        v8 = (void *)v7;
        if (v7)
          (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 32));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)addObserver:(id)a3 forSeetting:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AXMSettings_addObserver_forSeetting_withBlock___block_invoke;
  block[3] = &unk_1E625CFF8;
  block[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_sync(queue, block);

}

void __49__AXMSettings_addObserver_forSeetting_withBlock___block_invoke(uint64_t a1)
{
  _AXMSettingObserver *v2;
  uint64_t v3;
  id callback;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:");
  }
  v2 = objc_alloc_init(_AXMSettingObserver);
  objc_storeWeak(&v2->observer, *(id *)(a1 + 48));
  v3 = MEMORY[0x1B5E12AE8](*(_QWORD *)(a1 + 56));
  callback = v2->callback;
  v2->callback = (id)v3;

  objc_msgSend(v5, "addObject:", v2);
}

- (void)removeObserver:(id)a3 forSetting:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AXMSettings_removeObserver_forSetting___block_invoke;
  block[3] = &unk_1E625D9D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __41__AXMSettings_removeObserver_forSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forSetting:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_removeObserver:(id)a3 forSetting:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AXMSettings__queue_removeObserver_forSetting___block_invoke;
  block[3] = &unk_1E625D9D0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __48__AXMSettings__queue_removeObserver_forSetting___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
          WeakRetained = objc_loadWeakRetained((id *)(v9 + 8));
          if (!WeakRetained
            || (v11 = WeakRetained,
                v12 = objc_loadWeakRetained((id *)(v9 + 8)),
                v13 = (id)a1[6],
                v12,
                v11,
                v12 == v13))
          {
            objc_msgSend(v3, "addObject:", v9);
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    objc_msgSend(v4, "removeObjectsInArray:", v3);
    v2 = v14;
  }

}

- (void)removeObserverForAllSettings:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AXMSettings_removeObserverForAllSettings___block_invoke;
  block[3] = &unk_1E625CB18;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __44__AXMSettings_removeObserverForAllSettings___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forSetting:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)writeOutInputImages
{
  int v3;

  v3 = AXMHasInternalSecurityPrivilages();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("writeOutInputImages"));
  return v3;
}

- (void)setWriteOutInputImages:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, CFSTR("writeOutInputImages"));
}

- (BOOL)writeOutOCRInputImages
{
  int v3;

  v3 = AXMHasInternalSecurityPrivilages();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("writeOutOCRInputImages"));
  return v3;
}

- (void)setWriteOutOCRInputImages:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, CFSTR("writeOutOCRInputImages"));
}

- (BOOL)writeOutScreenCaptures
{
  int v3;

  v3 = AXMHasInternalSecurityPrivilages();
  if (v3)
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("writeOutScreenCaptures"));
  return v3;
}

- (void)setWriteOutScreenCaptures:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, CFSTR("writeOutScreenCaptures"));
}

- (BOOL)useANODModelForAXElementVision
{
  return !AXMHasInternalSecurityPrivilages()
      || -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("useANODModelForAXElementVision"));
}

- (void)setUseANODModelForAXElementVision:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, CFSTR("useANODModelForAXElementVision"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_settingObservers, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
