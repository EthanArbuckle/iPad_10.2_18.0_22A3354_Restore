@implementation HUDropInBannerItemProvider

- (id)items
{
  void *v2;
  void *v3;

  -[HUDropInBannerItemProvider bannerItems](self, "bannerItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSMutableSet)bannerItems
{
  return self->_bannerItems;
}

- (HUDropInBannerItemProvider)initWithHome:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HUDropInBannerItemProvider *v9;
  HUDropInBannerItemProvider *v10;
  NSArray *devices;
  uint64_t v12;
  NSMutableDictionary *accessoryIdentifierToEventBulletinsMapping;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUDropInBannerItemProvider;
  v9 = -[HFItemProvider init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    devices = v10->_devices;
    v10->_devices = (NSArray *)MEMORY[0x1E0C9AA60];

    v12 = objc_opt_new();
    accessoryIdentifierToEventBulletinsMapping = v10->_accessoryIdentifierToEventBulletinsMapping;
    v10->_accessoryIdentifierToEventBulletinsMapping = (NSMutableDictionary *)v12;

    v14 = (void *)objc_opt_new();
    -[HUDropInBannerItemProvider setBannerItems:](v10, "setBannerItems:", v14);

    objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v10);

  }
  return v10;
}

- (void)setBannerItems:(id)a3
{
  objc_storeStrong((id *)&self->_bannerItems, a3);
}

- (id)invalidationReasons
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUDropInBannerItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308A0];
  v8[0] = *MEMORY[0x1E0D308B0];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  HUDropInBannerItemProvider *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Execution env did become active", (uint8_t *)&v7, 0x16u);

  }
  -[HUDropInBannerItemProvider _setupDropInDelegatesIfNeeded](self, "_setupDropInDelegatesIfNeeded");
}

- (id)reloadItems
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28[2];
  uint8_t buf[4];
  HUDropInBannerItemProvider *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = self;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Execution env is active. Can set dropin delegates.", buf, 0x16u);

    }
    -[HUDropInBannerItemProvider _setupDropInDelegatesIfNeeded](self, "_setupDropInDelegatesIfNeeded");
  }
  -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "devices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInBannerItemProvider setDevices:](self, "setDevices:", v11);

  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInBannerItemProvider devices](self, "devices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = self;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@: %@ Dropin capable devices: %@", buf, 0x20u);

  }
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInBannerItemProvider accessoryIdentifierToEventBulletinsMapping](self, "accessoryIdentifierToEventBulletinsMapping");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = self;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v17;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@: %@ Event bulletins: %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  -[HUDropInBannerItemProvider devices](self, "devices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_3;
  v27[3] = &unk_1E6F5F650;
  objc_copyWeak(v28, (id *)buf);
  v28[1] = (id)a2;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v18, &__block_literal_global_280, &__block_literal_global_10_1, 0, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_15;
  v25[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v26, (id *)buf);
  objc_msgSend(v20, "flatMap:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_2_18;
  v24[3] = &unk_1E6F5F6A0;
  v24[4] = self;
  objc_msgSend(v21, "addSuccessBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v26);
  objc_destroyWeak(v28);

  objc_destroyWeak((id *)buf);
  return v22;
}

- (NSArray)devices
{
  return self->_devices;
}

- (DIDropInCenter)dropInCenter
{
  return self->_dropInCenter;
}

- (NSMutableDictionary)accessoryIdentifierToEventBulletinsMapping
{
  return self->_accessoryIdentifierToEventBulletinsMapping;
}

- (void)_setupDropInDelegatesIfNeeded
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  HUDropInBannerItemProvider *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 138412546;
    v41 = self;
    v42 = 2112;
    v43 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Setting up dropin delegates if needed", (uint8_t *)&v40, 0x16u);

  }
  -[HUDropInBannerItemProvider home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_hasAtleastOneAudioAnalysisSupportedAccessory");

  if (v7)
  {
    -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D1D8C8]);
      -[HUDropInBannerItemProvider home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithHomeIdentifier:queue:", v11, MEMORY[0x1E0C80D38]);
      -[HUDropInBannerItemProvider setDropInCenter:](self, "setDropInCenter:", v12);

      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412802;
        v41 = self;
        v42 = 2112;
        v43 = v14;
        v44 = 2112;
        v45 = v15;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ Created DropIn center: %@", (uint8_t *)&v40, 0x20u);

      }
    }
    -[HUDropInBannerItemProvider lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[HUDropInBannerItemProvider home](self, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createHomeAudioAnalysisEventSubscriber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDropInBannerItemProvider setLastKnownEventSubscriber:](self, "setLastKnownEventSubscriber:", v18);

      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDropInBannerItemProvider lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412802;
        v41 = self;
        v42 = 2112;
        v43 = v20;
        v44 = 2112;
        v45 = v21;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ Created Last known event subscriber: %@", (uint8_t *)&v40, 0x20u);

      }
      -[HUDropInBannerItemProvider lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setDelegate:", self);

    }
    -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDelegate:", self);

      HFLogForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412802;
        v41 = self;
        v42 = 2112;
        v43 = v27;
        v44 = 2112;
        v45 = v29;
        _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ DropIn center delegate set to %@", (uint8_t *)&v40, 0x20u);

      }
    }
    -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "deviceManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "deviceManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDelegate:", self);

      HFLogForCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "deviceManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "delegate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412802;
        v41 = self;
        v42 = 2112;
        v43 = v36;
        v44 = 2112;
        v45 = v39;
        _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@: %@ DropIn device manager delegate set to %@", (uint8_t *)&v40, 0x20u);

      }
    }
  }
}

- (HMHome)home
{
  return self->_home;
}

- (HUDropInBannerItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDropInBannerItemProvider.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDropInBannerItemProvider init]",
    v5);

  return 0;
}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeKitIdentifier");
}

id __41__HUDropInBannerItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HUDropInBannerItem *__41__HUDropInBannerItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  HUDropInBannerItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HUDropInBannerItem *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4;
  v25[3] = &unk_1E6F5F628;
  v7 = v3;
  v26 = v7;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v25);
  v8 = (HUDropInBannerItem *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(WeakRetained, "accessoryIdentifierToEventBulletinsMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeKitIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v6;
    v21 = 3221225472;
    v22 = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_5;
    v23 = &unk_1E6F5BD90;
    v13 = v7;
    v24 = v13;
    objc_msgSend(v12, "na_firstObjectPassingTest:", &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = WeakRetained;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@: %@ Found event bulletin for accessory: %@", buf, 0x20u);

    }
    v17 = [HUDropInBannerItem alloc];
    objc_msgSend(WeakRetained, "home", v20, v21, v22, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUDropInBannerItem initWithHome:device:eventBulletin:](v17, "initWithHome:device:eventBulletin:", v18, v13, v14);

  }
  return v8;
}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeKitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeKitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

id __41__HUDropInBannerItemProvider_reloadItems__block_invoke_15(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "bannerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "bannerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __41__HUDropInBannerItemProvider_reloadItems__block_invoke_2_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  objc_msgSend(v3, "existingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_3_19;
  v8[3] = &unk_1E6F5F678;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "na_each:", v8);

  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithSet:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setBannerItems:", v7);

}

void __41__HUDropInBannerItemProvider_reloadItems__block_invoke_3_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessoryIdentifierToEventBulletinsMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeKitIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4_20;
  v11[3] = &unk_1E6F5BD90;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v10, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventBulletin:", v9);

}

uint64_t __41__HUDropInBannerItemProvider_reloadItems__block_invoke_4_20(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (void)_notifyDelegate
{
  void *v3;
  int v4;
  _QWORD block[5];

  -[HUDropInBannerItemProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2D3D38);

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HUDropInBannerItemProvider__notifyDelegate__block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __45__HUDropInBannerItemProvider__notifyDelegate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdateDropInAvailability:", *(_QWORD *)(a1 + 32));

}

- (void)subscriber:(id)a3 didUpdateBulletins:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  HUDropInBannerItemProvider *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = self;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Last Known Event Bulletins for accessory with identifier %@: %@", (uint8_t *)&v16, 0x2Au);

  }
  -[HUDropInBannerItemProvider accessoryIdentifierToEventBulletinsMapping](self, "accessoryIdentifierToEventBulletinsMapping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_safeSetObject:forKey:", v6, v15);

  -[HUDropInBannerItemProvider _notifyDelegate](self, "_notifyDelegate");
}

- (void)serverDisconnectedForDropInCenter:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  HUDropInBannerItemProvider *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Disconnected from DropIn process", (uint8_t *)&v7, 0x16u);

  }
}

- (void)managerDidUpdateDevices:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[7];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  HUDropInBannerItemProvider *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v42 = self;
    v43 = 2112;
    v44 = v6;
    v45 = 2112;
    v46 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Device manager: %@", buf, 0x20u);

  }
  v33 = v4;

  -[HUDropInBannerItemProvider dropInCenter](self, "dropInCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInBannerItemProvider setDevices:](self, "setDevices:", v9);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInBannerItemProvider devices](self, "devices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v42 = self;
    v43 = 2112;
    v44 = v11;
    v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@: %@ Devices available for drop-in: %@", buf, 0x20u);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HUDropInBannerItemProvider devices](self, "devices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSince1970");
        v21 = v20;
        objc_msgSend(v18, "stateExpiration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSince1970");
        v24 = v23;

        if (objc_msgSend(v18, "state"))
          v25 = v21 <= v24;
        else
          v25 = 0;
        if (!v25)
        {
          HFLogForCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v42 = self;
            v43 = 2112;
            v44 = v27;
            v45 = 2112;
            v46 = v18;
            _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ Requesting device state refresh for device: %@", buf, 0x20u);

          }
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __54__HUDropInBannerItemProvider_managerDidUpdateDevices___block_invoke;
          v35[3] = &unk_1E6F570B8;
          v35[5] = v18;
          v35[6] = a2;
          v35[4] = self;
          objc_msgSend(v18, "refreshStateWithCompletionHandler:", v35);
        }
        objc_msgSend(v18, "setDelegate:", self);
        -[HUDropInBannerItemProvider home](self, "home");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "homeKitIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "hf_accessoryWithIdentifier:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUDropInBannerItemProvider lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "uniqueIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "subscribeLastKnownEventsForAccessory:completion:", v32, &__block_literal_global_75_3);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }

  -[HUDropInBannerItemProvider _notifyDelegate](self, "_notifyDelegate");
}

void __54__HUDropInBannerItemProvider_managerDidUpdateDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v11 = 138413058;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@: %@ Failed to request refresh of device state for device: %@ with error %@", (uint8_t *)&v11, 0x2Au);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ Succeeded to request refresh of device state for device: %@", (uint8_t *)&v11, 0x20u);
    goto LABEL_6;
  }

}

void __54__HUDropInBannerItemProvider_managerDidUpdateDevices___block_invoke_74(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Failed to subscribe for last known events: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Successfully subscribed for last known events", (uint8_t *)&v5, 2u);
  }

}

- (void)manager:(id)a3 didAddDevice:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HUDropInBannerItemProvider *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Added Device: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(v6, "setDelegate:", self);
  -[HUDropInBannerItemProvider home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeKitIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_accessoryWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDropInBannerItemProvider lastKnownEventSubscriber](self, "lastKnownEventSubscriber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscribeLastKnownEventsForAccessory:completion:", v13, &__block_literal_global_76_4);

  -[HUDropInBannerItemProvider _notifyDelegate](self, "_notifyDelegate");
}

void __51__HUDropInBannerItemProvider_manager_didAddDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Failed to subscribe for last known events: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Successfully subscribed for last known events", (uint8_t *)&v5, 2u);
  }

}

- (void)manager:(id)a3 didRemoveDevice:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  HUDropInBannerItemProvider *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Removed Device: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(v6, "setDelegate:", 0);
  -[HUDropInBannerItemProvider _notifyDelegate](self, "_notifyDelegate");

}

- (void)device:(id)a3 didUpdateState:(int64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  HUDropInBannerItemProvider *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1D8C0], "stringForDeviceState:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = self;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Updated Device state to %@ for device: %@", (uint8_t *)&v11, 0x2Au);

  }
  -[HUDropInBannerItemProvider _notifyDelegate](self, "_notifyDelegate");

}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HUDropInBannerItemProviderDelegate)delegate
{
  return (HUDropInBannerItemProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDropInCenter:(id)a3
{
  objc_storeStrong((id *)&self->_dropInCenter, a3);
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (HMAudioAnalysisLastKnownEventSubscriber)lastKnownEventSubscriber
{
  return self->_lastKnownEventSubscriber;
}

- (void)setLastKnownEventSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownEventSubscriber, a3);
}

- (void)setAccessoryIdentifierToEventBulletinsMapping:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifierToEventBulletinsMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifierToEventBulletinsMapping, 0);
  objc_storeStrong((id *)&self->_lastKnownEventSubscriber, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_dropInCenter, 0);
  objc_storeStrong((id *)&self->_bannerItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
