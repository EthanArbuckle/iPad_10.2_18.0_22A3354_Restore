@implementation NCSSettingsManager

+ (id)sharedSettingsManager
{
  if (sharedSettingsManager_onceToken != -1)
    dispatch_once(&sharedSettingsManager_onceToken, &__block_literal_global);
  return (id)sharedSettingsManager_sharedManager;
}

void __43__NCSSettingsManager_sharedSettingsManager__block_invoke()
{
  NCSSettingsManager *v0;
  void *v1;

  v0 = objc_alloc_init(NCSSettingsManager);
  v1 = (void *)sharedSettingsManager_sharedManager;
  sharedSettingsManager_sharedManager = (uint64_t)v0;

}

- (NCSSettingsManager)init
{
  NCSSettingsManager *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCSSettingsManager;
  v2 = -[NCSInternalSettingsManager init](&v9, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)PairedDeviceChanged, (CFStringRef)*MEMORY[0x24BE6B478], 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)ComplicationSettingsChanged, CFSTR("NCSSettingsChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)ApplicationsChanged, (CFStringRef)*MEMORY[0x24BDC14C8], 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)SPApplicationsChanged, (CFStringRef)*MEMORY[0x24BE03DD8], 0, (CFNotificationSuspensionBehavior)0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleLocaleChange_, *MEMORY[0x24BDBCA70], 0);

    -[NCSSettingsManager loadSettings](v2, "loadSettings");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  void *v6;
  objc_super v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("NCSSettingsChangedNotification"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x24BDC14C8], 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x24BE03DD8], 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)NCSSettingsManager;
  -[NCSSettingsManager dealloc](&v7, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = -[NCSInternalSettingsManager hasSettings](self, "hasSettings");
    v5 = obj;
    if (v6)
    {
      -[NCSSettingsManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "settingsManagerReloadedComplications:", self);

      v5 = obj;
    }
  }

}

- (void)loadSettings
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCSSettingsManager;
  -[NCSInternalSettingsManager loadSettings](&v4, sel_loadSettings);
  -[NCSSettingsManager _updateSockPuppetComplications](self, "_updateSockPuppetComplications");
  if (-[NCSInternalSettingsManager hasSettings](self, "hasSettings"))
  {
    -[NCSSettingsManager delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settingsManagerReloadedComplications:", self);

  }
}

- (void)_updateSockPuppetComplications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[NCSSettingsManager _fetchSockPuppetComplications](self, "_fetchSockPuppetComplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__NCSSettingsManager__updateSockPuppetComplications__block_invoke;
  v17[3] = &unk_24F7E9C30;
  v6 = v4;
  v18 = v6;
  v7 = v5;
  v19 = v7;
  -[NCSInternalSettingsManager enumerateAllComplicationDefinitionsUsingBlock:](self, "enumerateAllComplicationDefinitionsUsingBlock:", v17);
  -[NCSInternalSettingsManager removeComplicationDefinitionsInArray:](self, "removeComplicationDefinitionsInArray:", v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[NCSInternalSettingsManager addComplicationDefinition:](self, "addComplicationDefinition:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v10);
  }

  -[NCSInternalSettingsManager saveSettings](self, "saveSettings");
}

void __52__NCSSettingsManager__updateSockPuppetComplications__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "sockPuppetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v19, "sockPuppetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v19, "sockPuppetIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setName:", v10);

      objc_msgSend(v9, "appBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAppBundleIdentifier:", v11);

      v12 = objc_msgSend(v19, "installState");
      if (v12 != objc_msgSend(v9, "installState"))
      {
        if ((objc_msgSend(v19, "isActive") & 1) == 0 && objc_msgSend(v9, "installState") == 2)
          objc_msgSend(v19, "setActive:", 1);
        objc_msgSend(v19, "setInstallState:", objc_msgSend(v9, "installState"));
      }
      v13 = (void *)MEMORY[0x24BDC1538];
      objc_msgSend(v19, "appBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applicationProxyForIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "localizedName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setName:", v16);

      }
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v19, "sockPuppetIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", v18);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
    }
  }

}

- (id)_fetchSockPuppetComplications
{
  void *v2;
  NSObject *v3;
  dispatch_group_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  dispatch_semaphore_t v11;
  id v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  dispatch_semaphore_t v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  uint64_t *v25;
  _QWORD block[4];
  NSObject *v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  id v37;

  objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__0;
  v36[4] = __Block_byref_object_dispose__0;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v3 = dispatch_queue_create("com.apple.nano-complications.sockpuppet-loader", MEMORY[0x24BDAC9C0]);
  v4 = dispatch_group_create();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke;
  block[3] = &unk_24F7E9C80;
  v6 = v4;
  v27 = v6;
  v7 = v2;
  v28 = v7;
  v29 = v36;
  dispatch_sync(v3, block);
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_3;
  v22[3] = &unk_24F7E9C80;
  v8 = v6;
  v23 = v8;
  v9 = v7;
  v24 = v9;
  v25 = &v30;
  dispatch_sync(v3, v22);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend((id)v31[5], "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_semaphore_create(0);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_5;
  v17[3] = &unk_24F7E9CA8;
  v20 = &v30;
  v21 = v36;
  v12 = v10;
  v18 = v12;
  v19 = v11;
  v13 = v11;
  dispatch_group_notify(v8, v3, v17);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v14 = v19;
  v15 = v12;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v36, 8);

  return v15;
}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_2;
  v3[3] = &unk_24F7E9C58;
  v2 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "fetchInstalledApplicationsForPairedDevice:completion:", 0, v3);

}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_4;
  v3[3] = &unk_24F7E9C58;
  v2 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "fetchInstalledComplicationsForPairedDevice:completion:", 0, v3);

}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

intptr_t __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NCSComplication *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("s"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init(NCSComplication);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCSComplication setName:](v11, "setName:", v12);

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SPContainerAppBundleId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCSComplication setAppBundleIdentifier:](v11, "setAppBundleIdentifier:", v13);

        -[NCSComplication setComplicationBundleIdentifier:](v11, "setComplicationBundleIdentifier:", CFSTR("NCSSockPuppetBundleIdentifier"));
        -[NCSComplication setActive:](v11, "setActive:", 1);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCSComplication setSockPuppetIdentifier:](v11, "setSockPuppetIdentifier:", v14);

        -[NCSComplication setInstallState:](v11, "setInstallState:", 2 * ((v9 & 0xFFFFFFFE) == 2));
        v15 = *(void **)(a1 + 32);
        -[NCSComplication sockPuppetIdentifier](v11, "sockPuppetIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v16);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v3);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NCSSettingsManagerDelegate)delegate
{
  return (NCSSettingsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
