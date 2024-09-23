@implementation NTKComplicationCollection

- (NTKComplicationCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v7;
  id v8;
  NTKComplicationCollection *v9;
  NTKComplicationCollection *v10;
  uint64_t v11;
  NSHashTable *observers;
  uint64_t v13;
  NSMutableArray *loadCallbacks;
  NSLock *v15;
  NSLock *observersLock;
  NSRecursiveLock *v17;
  NSRecursiveLock *lock;
  uint64_t v19;
  NSMutableDictionary *localizeableSampleDataTemplates;
  uint64_t v21;
  NSMutableDictionary *complicationDescriptors;
  uint64_t v23;
  NSXPCConnection *connection;
  NSXPCConnection *v25;
  void *v26;
  NSXPCConnection *v27;
  void *v28;
  _NTKComplicationStoreClientProxy *v29;
  NSXPCConnection *v30;
  uint64_t v31;
  id v32;
  NSXPCConnection *v33;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;
  objc_super v45;

  v7 = a3;
  v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)NTKComplicationCollection;
  v9 = -[NTKComplicationCollection init](&v45, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceUUID, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    loadCallbacks = v10->_loadCallbacks;
    v10->_loadCallbacks = (NSMutableArray *)v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    observersLock = v10->_observersLock;
    v10->_observersLock = v15;

    v17 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v10->_lock;
    v10->_lock = v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    localizeableSampleDataTemplates = v10->_localizeableSampleDataTemplates;
    v10->_localizeableSampleDataTemplates = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    complicationDescriptors = v10->_complicationDescriptors;
    v10->_complicationDescriptors = (NSMutableDictionary *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanotimekit.complicationstoreserver"), 4096);
    connection = v10->_connection;
    v10->_connection = (NSXPCConnection *)v23;

    v25 = v10->_connection;
    NTKComplicationStoreServerInterface();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v25, "setRemoteObjectInterface:", v26);

    v27 = v10->_connection;
    NTKComplicationStoreClientInterface();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v27, "setExportedInterface:", v28);

    v29 = -[_NTKComplicationStoreClientProxy initWithWeakProxy:]([_NTKComplicationStoreClientProxy alloc], "initWithWeakProxy:", v10);
    -[NSXPCConnection setExportedObject:](v10->_connection, "setExportedObject:", v29);
    objc_initWeak(&location, v10);
    v30 = v10->_connection;
    v31 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke;
    v41[3] = &unk_1E6BCF6D8;
    objc_copyWeak(&v43, &location);
    v32 = v7;
    v42 = v32;
    -[NSXPCConnection setInterruptionHandler:](v30, "setInterruptionHandler:", v41);
    v33 = v10->_connection;
    v36 = v31;
    v37 = 3221225472;
    v38 = __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_21;
    v39 = &unk_1E6BCD5F0;
    v40 = v32;
    -[NSXPCConnection setInvalidationHandler:](v33, "setInvalidationHandler:", &v36);
    -[NSXPCConnection resume](v10->_connection, "resume", v36, v37, v38, v39);
    -[NTKComplicationCollection _register](v10, "_register");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)_handleDaemonDidLaunchNotification_0, CFSTR("com.apple.nanotimekit.daemondidlaunch"), 0, (CFNotificationSuspensionBehavior)0);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

  }
  return v10;
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2;
  v2[3] = &unk_1E6BCF6D8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_21_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.nanotimekit.daemondidlaunch"), 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationCollection;
  -[NTKComplicationCollection dealloc](&v4, sel_dealloc);
}

+ (id)sharedRemoteCollection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKComplicationCollection_sharedRemoteCollection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRemoteCollection_onceToken != -1)
    dispatch_once(&sharedRemoteCollection_onceToken, block);
  return (id)sharedRemoteCollection___sharedRemoteCollection;
}

void __51__NTKComplicationCollection_sharedRemoteCollection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCollectionIdentifier:deviceUUID:", CFSTR("RemoteComplicationsV2"), 0);
  v2 = (void *)sharedRemoteCollection___sharedRemoteCollection;
  sharedRemoteCollection___sharedRemoteCollection = v1;

}

+ (id)newWidgetCollection
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionIdentifier:deviceUUID:", CFSTR("WidgetComplications"), 0);
}

+ (id)sharedBundleCollection
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKComplicationCollection_sharedBundleCollection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBundleCollection_onceToken != -1)
    dispatch_once(&sharedBundleCollection_onceToken, block);
  return (id)sharedBundleCollection___sharedBundleCollection;
}

void __51__NTKComplicationCollection_sharedBundleCollection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithCollectionIdentifier:deviceUUID:", CFSTR("BundleComplications"), 0);
  v2 = (void *)sharedBundleCollection___sharedBundleCollection;
  sharedBundleCollection___sharedBundleCollection = v1;

}

- (void)addObserver:(id)a3
{
  NSLock *observersLock;
  id v5;

  observersLock = self->_observersLock;
  v5 = a3;
  -[NSLock lock](observersLock, "lock");
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  -[NSLock unlock](self->_observersLock, "unlock");
}

- (void)removeObserver:(id)a3
{
  NSLock *observersLock;
  id v5;

  observersLock = self->_observersLock;
  v5 = a3;
  -[NSLock lock](observersLock, "lock");
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  -[NSLock unlock](self->_observersLock, "unlock");
}

- (void)performAfterLoad:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__NTKComplicationCollection_performAfterLoad___block_invoke;
    v6[3] = &unk_1E6BD00B0;
    v6[4] = self;
    v7 = v4;
    -[NTKComplicationCollection _performOrEnqueueUpdate:](self, "_performOrEnqueueUpdate:", v6);

  }
}

void __46__NTKComplicationCollection_performAfterLoad___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 96))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void **)(v1 + 64);
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v2, "addObject:", v3);

  }
}

+ (id)lsSDKVersionForApplicationID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;

  v3 = a3;
  v20 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v20);
  v5 = v20;
  if (v4)
  {
    objc_msgSend(v4, "SDKVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (v6)
      goto LABEL_15;
    goto LABEL_12;
  }
  CLKLoggingObjectForDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[NTKComplicationCollection lsSDKVersionForApplicationID:].cold.3();

  v19 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v3, &v19);
  v7 = v19;
  if (v9)
  {
    objc_msgSend(v9, "SDKVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CLKLoggingObjectForDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[NTKComplicationCollection lsSDKVersionForApplicationID:].cold.2();

    v6 = 0;
  }

  if (!v6)
  {
LABEL_12:
    CLKLoggingObjectForDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[NTKComplicationCollection lsSDKVersionForApplicationID:].cold.1((uint64_t)v3, v11, v12, v13, v14, v15, v16, v17);

  }
LABEL_15:

  return v6;
}

- (id)clients
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableDictionary allKeys](self->_localizeableSampleDataTemplates, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "length", (_QWORD)v13))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)clientsSupportingFamily:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *localizeableSampleDataTemplates;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  int64_t v15;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock lock](self->_lock, "lock");
  localizeableSampleDataTemplates = self->_localizeableSampleDataTemplates;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke;
  v13 = &unk_1E6BD5C70;
  v14 = v5;
  v15 = a3;
  v7 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](localizeableSampleDataTemplates, "enumerateKeysAndObjectsUsingBlock:", &v10);
  -[NSRecursiveLock unlock](self->_lock, "unlock", v10, v11, v12, v13);
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  objc_msgSend(a3, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke_2;
  v9[3] = &unk_1E6BD5C48;
  v7 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __53__NTKComplicationCollection_clientsSupportingFamily___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a2, "supportedFamilies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }
}

- (id)supportedTemplateFamiliesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  void *v4;
  void *v5;

  -[NTKComplicationCollection _sampleDataForClientIdentifier:descriptor:](self, "_sampleDataForClientIdentifier:descriptor:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedFamilies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5
{
  void *v6;

  -[NTKComplicationCollection _sampleDataForClientIdentifier:descriptor:](self, "_sampleDataForClientIdentifier:descriptor:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v6, "hasTemplateForFamily:", a5);

  return a5;
}

- (id)sampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4 applicationID:(id)a5 family:(int64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v31 = a5;
  -[NTKComplicationCollection _sampleDataForClientIdentifier:descriptor:](self, "_sampleDataForClientIdentifier:descriptor:", v10, a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "templateForFamily:", a6);
  v29 = objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thirdPartyApps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v13)
  {
LABEL_14:

    v23 = (void *)v29;
    v22 = v30;
    goto LABEL_20;
  }
  v14 = v13;
  v15 = *(_QWORD *)v33;
LABEL_3:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v33 != v15)
      objc_enumerationMutation(v12);
    v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v16);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v18 = v17;
    objc_msgSend(v18, "complicationClientIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", v10) & 1) == 0)
    {

      goto LABEL_11;
    }
    objc_msgSend(v18, "watchApplicationIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", v31);

    if (v21)
      break;
LABEL_11:

LABEL_12:
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v14)
        goto LABEL_3;
      goto LABEL_14;
    }
  }
  objc_msgSend(v18, "urlToWatchKitBundle");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  v23 = (void *)v29;
  v22 = v30;

  if (v26)
  {
    +[NTKComplicationBundleHelper localizedComplicationTemplateForTemplate:bundle:localization:](NTKComplicationBundleHelper, "localizedComplicationTemplateForTemplate:bundle:localization:", v29, v26, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
LABEL_20:
  v27 = v23;
LABEL_21:

  return v27;
}

- (id)complicationDescriptorsForClientIdentifier:(id)a3
{
  NSRecursiveLock *lock;
  id v5;
  void *v6;
  void *v7;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[NSMutableDictionary objectForKey:](self->_complicationDescriptors, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

+ (id)_bundleForWatchKitAppID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v26);
  v5 = v26;
  if (!v4)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[NTKComplicationCollection _bundleForWatchKitAppID:].cold.1((uint64_t)v3, (uint64_t)v5, v6);
    goto LABEL_14;
  }
  objc_msgSend(v4, "applicationExtensionRecords");
  v6 = objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v7)
  {
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v8 = v7;
  v19 = v5;
  v20 = v4;
  v21 = v3;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v12, "extensionPointRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.watchkit"));

      if (v15)
      {
        objc_msgSend(v12, "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v17;
      }

    }
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  }
  while (v8);
  v4 = v20;
  v3 = v21;
  v5 = v19;
LABEL_15:

  return v9;
}

- (void)setLocalizableSampleTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10;
  id v11;
  id v12;

  if (a3)
  {
    v10 = a5;
    v12 = a4;
    v11 = a3;
    -[NTKComplicationCollection _setLocalizedSampleTemplate:forClientIdentifier:descriptor:family:](self, "_setLocalizedSampleTemplate:forClientIdentifier:descriptor:family:", v11, v12, v10, a6);
    -[NTKComplicationCollection _sendToDaemonUpdatedSampleDataTemplate:forClientIdentifier:descriptor:family:](self, "_sendToDaemonUpdatedSampleDataTemplate:forClientIdentifier:descriptor:family:", v11, v12, v10, a6);

    -[NTKComplicationCollection _notifyUpdateComplicationSampleTemplateForClientIdentifier:descriptor:](self, "_notifyUpdateComplicationSampleTemplateForClientIdentifier:descriptor:", v12, v10);
  }
}

- (void)setComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, setting %@ descriptors for %@", (uint8_t *)&v9, 0x16u);
    }

    -[NTKComplicationCollection _setComplicationDescriptors:forClientIdentifier:](self, "_setComplicationDescriptors:forClientIdentifier:", v6, v7);
    -[NTKComplicationCollection _sendToDaemonUpdatedComplicationDescriptors:forClientIdentifier:](self, "_sendToDaemonUpdatedComplicationDescriptors:forClientIdentifier:", v6, v7);
    -[NTKComplicationCollection _notifyUpdateComplicationDescriptorsForClientIdentifier:](self, "_notifyUpdateComplicationDescriptorsForClientIdentifier:", v7);
    -[NTKComplicationCollection _cleanupOrphanedSampleTemplatesForClientIdentifier:](self, "_cleanupOrphanedSampleTemplatesForClientIdentifier:", v7);
  }

}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[NTKComplicationCollection _throwIfNotLoaded:](self, "_throwIfNotLoaded:", a2);
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing complication sample templates for %@, %@", (uint8_t *)&v11, 0x16u);

  }
  -[NTKComplicationCollection _removeComplicationSampleTemplatesForClientIdentifier:descriptor:](self, "_removeComplicationSampleTemplatesForClientIdentifier:descriptor:", v7, v8);
  -[NTKComplicationCollection _sendToDaemonRemoveComplicationSampleTemplatesForClientIdentifier:descriptor:](self, "_sendToDaemonRemoveComplicationSampleTemplatesForClientIdentifier:descriptor:", v7, v8);
  -[NTKComplicationCollection _notifyRemovedComplicationSampleTemplatesForClientIdentifier:descriptor:](self, "_notifyRemovedComplicationSampleTemplatesForClientIdentifier:descriptor:", v7, v8);

}

- (void)removeAllComplicationSampleTemplatesExceptThoseWithClientIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableDictionary allKeys](self->_localizeableSampleDataTemplates, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing all complication sample templates except those with client identifiers %@", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v12) & 1) == 0)
        {
          -[NTKComplicationCollection complicationDescriptorsForClientIdentifier:](self, "complicationDescriptorsForClientIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __98__NTKComplicationCollection_removeAllComplicationSampleTemplatesExceptThoseWithClientIdentifiers___block_invoke;
          v14[3] = &unk_1E6BD5C98;
          v14[4] = self;
          v14[5] = v12;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

          -[NTKComplicationCollection _cleanupOrphanedSampleTemplatesForClientIdentifier:](self, "_cleanupOrphanedSampleTemplatesForClientIdentifier:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

uint64_t __98__NTKComplicationCollection_removeAllComplicationSampleTemplatesExceptThoseWithClientIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeComplicationSampleTemplatesForClientIdentifier:descriptor:", *(_QWORD *)(a1 + 40), a2);
}

- (id)_fetchOrCreateSampleDataForClientIdentifier:(id)a3 descriptor:(id)a4 family:(int64_t)a5
{
  id v8;
  id v9;
  NTKComplicationSampleData *v10;
  NTKComplicationSampleData *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NTKComplicationCollection _sampleDataForClientIdentifier:descriptor:](self, "_sampleDataForClientIdentifier:descriptor:", v8, v9);
  v10 = (NTKComplicationSampleData *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = [NTKComplicationSampleData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NTKComplicationSampleData initWithSupportedFamilies:](v11, "initWithSupportedFamilies:", v13);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_localizeableSampleDataTemplates, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localizeableSampleDataTemplates, "setObject:forKeyedSubscript:", v14, v8);
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v9);

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v10;
}

- (void)_setLocalizedSampleTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10;
  id v11;

  v10 = a3;
  -[NTKComplicationCollection _fetchOrCreateSampleDataForClientIdentifier:descriptor:family:](self, "_fetchOrCreateSampleDataForClientIdentifier:descriptor:family:", a4, a5, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTemplate:forFamily:", v10, a6);

}

- (void)_setLocalizedSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;

  v10 = a3;
  -[NTKComplicationCollection _fetchOrCreateSampleDataForClientIdentifier:descriptor:family:](self, "_fetchOrCreateSampleDataForClientIdentifier:descriptor:family:", a4, a5, a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTemplatePath:forFamily:", v11, a6);
}

- (void)_setComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
  NSRecursiveLock *lock;
  id v7;
  NSMutableDictionary *complicationDescriptors;
  id v9;

  v9 = a3;
  lock = self->_lock;
  v7 = a4;
  -[NSRecursiveLock lock](lock, "lock");
  complicationDescriptors = self->_complicationDescriptors;
  if (v9)
    -[NSMutableDictionary setObject:forKey:](complicationDescriptors, "setObject:forKey:", v9, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](complicationDescriptors, "removeObjectForKey:", v7);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_cleanupOrphanedSampleTemplatesForClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NTKComplicationCollection *v16;
  char v17;

  v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NTKComplicationCollection clients](self, "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  -[NSMutableDictionary objectForKey:](self->_localizeableSampleDataTemplates, "objectForKey:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_complicationDescriptors, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v13, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__NTKComplicationCollection__cleanupOrphanedSampleTemplatesForClientIdentifier___block_invoke;
  v14[3] = &unk_1E6BD5CC0;
  v17 = v6;
  v15 = v4;
  v16 = self;
  v12 = v4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

void __80__NTKComplicationCollection__cleanupOrphanedSampleTemplatesForClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 48)
    || (objc_msgSend(v3, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C93EC8]),
        v5,
        (v6 & 1) == 0))
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing orphaned sample data for %@, %@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "removeComplicationSampleTemplatesForClientIdentifier:descriptor:", *(_QWORD *)(a1 + 32), v4);
  }

}

- (void)_removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, removing complication sample data for %@, %@", (uint8_t *)&v11, 0x16u);

  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableDictionary objectForKey:](self->_localizeableSampleDataTemplates, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v7);
  if (!objc_msgSend(v10, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_localizeableSampleDataTemplates, "removeObjectForKey:", v6);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)suspendUpdatesFromDaemon
{
  NSMutableArray *v3;
  NSMutableArray *updatesEnqueuedWhileSuspended;

  if (!self->_updatesEnqueuedWhileSuspended)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    updatesEnqueuedWhileSuspended = self->_updatesEnqueuedWhileSuspended;
    self->_updatesEnqueuedWhileSuspended = v3;

  }
  self->_updatesSuspended = 1;
}

- (void)resumeUpdatesFromDaemon
{
  NSMutableArray *v3;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_updatesEnqueuedWhileSuspended;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_updatesEnqueuedWhileSuspended, "removeAllObjects", (_QWORD)v8);
  self->_updatesSuspended = 0;
}

- (void)_sendToDaemonUpdatedSampleDataTemplate:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[NTKComplicationCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateLocalizableSampleDataTemplate:forClientIdentifier:descriptor:family:", v12, v11, v10, a6);

}

- (void)_sendToDaemonUpdatedComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NTKComplicationCollection _registerIfNeeded](self, "_registerIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateComplicationDescriptors:forClientIdentifier:", v7, v6);

}

- (void)_sendToDaemonRemoveComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NTKComplicationCollection _registerIfNeeded](self, "_registerIfNeeded");
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection, telling daemon to remove complication sample templates for %@, %@", (uint8_t *)&v11, 0x16u);

  }
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeComplicationSampleTemplatesForClientIdentifier:descriptor:", v6, v7);

}

- (void)loadFullCollectionWithLocalizableSampleTemplates:(id)a3 complicationDescriptors:(id)a4 seqId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSString *collectionIdentifier;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    collectionIdentifier = self->_collectionIdentifier;
    *(_DWORD *)buf = 138412290;
    v23 = collectionIdentifier;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "NTKComplicationCollection %@ load full data", buf, 0xCu);
  }

  v13 = objc_opt_class();
  v14 = objc_opt_class();
  NTKValidateDictionary(v8, v13, v14);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke;
  v18[3] = &unk_1E6BD17F0;
  v18[4] = self;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  -[NTKComplicationCollection _performOrEnqueueUpdate:](self, "_performOrEnqueueUpdate:", v18);

}

void __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock");
  v2 = objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unlock");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_2;
  v12[3] = &unk_1E6BD5D10;
  v11 = v5;
  v13 = v11;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock");
  v7 = objc_msgSend(v11, "mutableCopy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unlock");
  v10 = *(_BYTE **)(a1 + 32);
  if (v10[96])
  {
    objc_msgSend(v10, "_notifyReloaded");
  }
  else
  {
    v10[96] = 1;
    objc_msgSend(*(id *)(a1 + 32), "_notifyLoaded");
  }

}

void __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t, _BYTE *);
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v12 = *(void **)(a1 + 40);
  objc_msgSend(v5, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_3;
  v26 = &unk_1E6BD5CE8;
  v15 = v5;
  v27 = v15;
  v16 = v9;
  v28 = v16;
  v17 = v6;
  v29 = v17;
  v30 = &v31;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v23);

  if (!*((_BYTE *)v32 + 24))
  {
    objc_msgSend(v15, "complicationIdentifier", v23, v24, v25, v26, v27, v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C93EC8]);

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0C94148];
      objc_msgSend(v17, "supportedFamilies");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "legacyComplicationDescriptorWithSupportedFamilies:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v22);
    }
  }

  _Block_object_dispose(&v31, 8);
}

void __108__NTKComplicationCollection_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "complicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (void)updateSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6 seqId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12)
  {
    if (v13)
    {
      if (v14)
      {
LABEL_4:
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __103__NTKComplicationCollection_updateSampleTemplateReference_forClientIdentifier_descriptor_family_seqId___block_invoke;
        v16[3] = &unk_1E6BD5D38;
        v16[4] = self;
        v17 = v15;
        v18 = v12;
        v19 = v13;
        v20 = v14;
        v21 = a6;
        -[NTKComplicationCollection _performOrEnqueueUpdate:](self, "_performOrEnqueueUpdate:", v16);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("ClientIdentifier"));
      if (v14)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("ComplicationDescriptor"));
    goto LABEL_4;
  }
LABEL_5:

}

uint64_t __103__NTKComplicationCollection_updateSampleTemplateReference_forClientIdentifier_descriptor_family_seqId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setLocalizedSampleTemplateReference:forClientIdentifier:descriptor:family:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 32), "_notifyUpdateComplicationSampleTemplateForClientIdentifier:descriptor:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 seqId:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("CLKComplicationDescriptor"));
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("ClientIdentifier"));
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = objc_opt_class();
  NTKValidateArray(v8, v11);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__NTKComplicationCollection_updateComplicationDescriptors_forClientIdentifier_seqId___block_invoke;
  v15[3] = &unk_1E6BD17F0;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[NTKComplicationCollection _performOrEnqueueUpdate:](self, "_performOrEnqueueUpdate:", v15);

}

uint64_t __85__NTKComplicationCollection_updateComplicationDescriptors_forClientIdentifier_seqId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setComplicationDescriptors:forClientIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_notifyUpdateComplicationDescriptorsForClientIdentifier:", *(_QWORD *)(a1 + 56));
}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4 seqId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ must be non-nil"), CFSTR("ClientIdentifier"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__NTKComplicationCollection_removeComplicationSampleTemplatesForClientIdentifier_descriptor_seqId___block_invoke;
  v14[3] = &unk_1E6BD17F0;
  v14[4] = self;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[NTKComplicationCollection _performOrEnqueueUpdate:](self, "_performOrEnqueueUpdate:", v14);

}

uint64_t __99__NTKComplicationCollection_removeComplicationSampleTemplatesForClientIdentifier_descriptor_seqId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_removeComplicationSampleTemplatesForClientIdentifier:descriptor:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRemovedComplicationSampleTemplatesForClientIdentifier:descriptor:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_notifyUpdateComplicationSampleTemplateForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_hasLoaded)
  {
    -[NSLock lock](self->_observersLock, "lock");
    v8 = (void *)-[NSHashTable copy](self->_observers, "copy");
    -[NSLock unlock](self->_observersLock, "unlock");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "complicationCollection:didUpdateSampleTemplateForClient:descriptor:", self, v6, v7, (_QWORD)v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)_notifyUpdateComplicationDescriptorsForClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasLoaded)
  {
    -[NSLock lock](self->_observersLock, "lock");
    v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
    -[NSLock unlock](self->_observersLock, "unlock");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "complicationCollection:didUpdateComplicationDescriptorsForClient:", self, v4, (_QWORD)v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_notifyRemovedComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_hasLoaded)
  {
    -[NSLock lock](self->_observersLock, "lock");
    v8 = (void *)-[NSHashTable copy](self->_observers, "copy");
    -[NSLock unlock](self->_observersLock, "unlock");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "complicationCollection:didRemoveSampleTemplatesForClient:descriptor:", self, v6, v7, (_QWORD)v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)_notifyLoaded
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *loadCallbacks;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_observersLock, "lock");
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy");
  -[NSLock unlock](self->_observersLock, "unlock");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "complicationCollectionDidLoad:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)-[NSMutableArray copy](self->_loadCallbacks, "copy", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_loadCallbacks, "removeAllObjects");
  loadCallbacks = self->_loadCallbacks;
  self->_loadCallbacks = 0;

}

- (void)_notifyReloaded
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_observersLock, "lock");
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy");
  -[NSLock unlock](self->_observersLock, "unlock");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "complicationCollectionDidReload:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)_sampleDataForClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__35;
  v22 = __Block_byref_object_dispose__35;
  v23 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localizeableSampleDataTemplates, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __71__NTKComplicationCollection__sampleDataForClientIdentifier_descriptor___block_invoke;
  v15 = &unk_1E6BD5D60;
  v9 = v7;
  v16 = v9;
  v17 = &v18;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v12);

  -[NSRecursiveLock unlock](self->_lock, "unlock", v12, v13, v14, v15);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __71__NTKComplicationCollection__sampleDataForClientIdentifier_descriptor___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)_register
{
  void *v3;

  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForCollectionIdentifier:deviceUUID:withSeqId:", self->_collectionIdentifier, self->_deviceUUID, self->_seqId);

  self->_registrationNeeded = 0;
}

- (void)_registerIfNeeded
{
  if (self->_registrationNeeded)
    -[NTKComplicationCollection _register](self, "_register");
}

- (void)_handleConnectionInterrupted
{
  self->_registrationNeeded = 1;
}

- (void)_throwIfNotLoaded:(SEL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (!self->_hasLoaded)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99768];
    -[NTKComplicationCollection collectionIdentifier](self, "collectionIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Attempt to modify complication collection (%@) before it has loaded (sel = %@)"), v7, v6);

  }
}

- (void)_performOrEnqueueUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__NTKComplicationCollection__performOrEnqueueUpdate___block_invoke;
  v6[3] = &unk_1E6BD00B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__NTKComplicationCollection__performOrEnqueueUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 80))
  {
    v2 = *(void **)(v1 + 88);
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = _Block_copy(v4);
    objc_msgSend(v2, "addObject:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_updatesEnqueuedWhileSuspended, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_loadCallbacks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_complicationDescriptors, 0);
  objc_storeStrong((id *)&self->_localizeableSampleDataTemplates, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_seqId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Complication collection %@ connection interrupted", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__NTKComplicationCollection_initWithCollectionIdentifier_deviceUUID___block_invoke_21_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Complication collection %@ connection invalidated. This is unrecoverable.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)lsSDKVersionForApplicationID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "No errors retreiving application or extension records for %@, but got a nil SDKVersion", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)lsSDKVersionForApplicationID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Error acquiring application extension record with bundle id %@: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)lsSDKVersionForApplicationID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Error acquiring application record with bundle id %@: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)_bundleForWatchKitAppID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, a2, a3, "Couldn't fetch record for bundle %@ - %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
