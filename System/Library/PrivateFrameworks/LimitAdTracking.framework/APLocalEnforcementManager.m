@implementation APLocalEnforcementManager

- (id)disabledReasons
{
  ADTrackingTransparency *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v2 = objc_alloc_init(ADTrackingTransparency);
  -[ADTrackingTransparency adSwitchDisabledReasons](v2, "adSwitchDisabledReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "containsObject:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "containsObject:", v11);

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

  }
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (BOOL)adServicesEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint8_t buf[16];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[APLocalEnforcementManager appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global_0, &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection for adServicesEnabled()", buf, 2u);
  }
  -[APLocalEnforcementManager appTrackingServiceProxy:](self, "appTrackingServiceProxy:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get adServicesEnabled", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to localAdServicesEnabled()", buf, 2u);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__APLocalEnforcementManager_adServicesEnabled___block_invoke_8;
  v10[3] = &unk_24D0AA550;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v6, "localAdServicesEnabled:", v10);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  objc_msgSend(v5, "invalidate");
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __47__APLocalEnforcementManager_adServicesEnabled___block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __47__APLocalEnforcementManager_adServicesEnabled___block_invoke_6()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __47__APLocalEnforcementManager_adServicesEnabled___block_invoke_8(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("not enabled");
    if (a2)
      v8 = CFSTR("enabled");
    v13 = 138412546;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    v9 = v7;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The localAdServicesEnabled flag is %{public}@.", (uint8_t *)&v13, 0x16u);

  }
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("us"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
  }
}

- (BOOL)loggingEnabled
{
  return !-[APLocalEnforcementManager isU13MAIDEDU](self, "isU13MAIDEDU");
}

- (BOOL)deviceRegionStorefrontEnabled
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[APLocalEnforcementManager appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global_14, &__block_literal_global_16_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection for deviceRegionEnabledPerStorefront", buf, 2u);
  }
  -[APLocalEnforcementManager appTrackingServiceProxy:](self, "appTrackingServiceProxy:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get deviceRegionStorefrontEnabled", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to deviceRegionEnabledPerStorefront()", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke_17;
  v7[3] = &unk_24D0AA5B8;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "deviceRegionEnabledPerStorefront:", v7);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to deviceRegionEnabledPerStorefront()", buf, 2u);
  }
  objc_msgSend(v3, "invalidate");
  v5 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke_15()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __58__APLocalEnforcementManager_deviceRegionStorefrontEnabled__block_invoke_17(uint64_t a1, int a2)
{
  void *v4;
  const __CFString *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = CFSTR("not enabled");
    if (a2)
      v5 = CFSTR("enabled");
    v7 = 138412546;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v6 = v4;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The deviceRegionStorefrontEnabled flag is %{public}@.", (uint8_t *)&v7, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)isU13MAIDEDU
{
  ADTrackingTransparency *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;

  v2 = objc_alloc_init(ADTrackingTransparency);
  -[ADTrackingTransparency adSwitchDisabledReasons](v2, "adSwitchDisabledReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "containsObject:", v7);

    if ((v8 & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "containsObject:", v9);

    }
  }

  return v4;
}

- (id)accountStorefront
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  __CFString *v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = CFSTR("NONE");
  -[APLocalEnforcementManager appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global_20, &__block_literal_global_22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection for accountStorefront()", buf, 2u);
  }
  -[APLocalEnforcementManager appTrackingServiceProxy:](self, "appTrackingServiceProxy:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get accountStorefront", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__APLocalEnforcementManager_accountStorefront__block_invoke_23;
  v7[3] = &unk_24D0AA620;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "iTunesAccountStorefront:", v7);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  objc_msgSend(v3, "invalidate");
  v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __46__APLocalEnforcementManager_accountStorefront__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __46__APLocalEnforcementManager_accountStorefront__block_invoke_21()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __46__APLocalEnforcementManager_accountStorefront__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v4 = v8;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The account storefront is %{public}@.", (uint8_t *)&v7, 0x16u);

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (id)appTrackingXPCConnection:(id)a3 withInvalidation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adprivacyd.opt-out"), 4096);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D17FD8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(v7, "setInvalidationHandler:", v6);
    objc_msgSend(v7, "setInterruptionHandler:", v5);
    objc_msgSend(v7, "resume");
    v9 = v7;
  }

  return v7;
}

- (id)appTrackingServiceProxy:(id)a3
{
  return (id)objc_msgSend(a3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_42);
}

void __53__APLocalEnforcementManager_appTrackingServiceProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 134218242;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received error code %ld from remote call: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)shouldShowTCCWithAds
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[APLocalEnforcementManager appTrackingXPCConnection:withInvalidation:](self, "appTrackingXPCConnection:withInvalidation:", &__block_literal_global_43, &__block_literal_global_45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create connection for shouldShowTCCWithAds()", buf, 2u);
  }
  -[APLocalEnforcementManager appTrackingServiceProxy:](self, "appTrackingServiceProxy:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote proxy is nil. Unable to get shouldShowTCCWithAds", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Starting synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke_46;
  v7[3] = &unk_24D0AA620;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend(v4, "iTunesAccountStorefront:", v7);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Returned from synchronous remote call to iTunesAccountStorefront()", buf, 2u);
  }
  objc_msgSend(v3, "invalidate");
  v5 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "The remote service was interrupted", v0, 2u);
  }
}

void __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke_44()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection invalidated before completing", v0, 2u);
  }
}

void __49__APLocalEnforcementManager_shouldShowTCCWithAds__block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BYTE v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v5 = 138412546;
    *(_QWORD *)&v5[4] = objc_opt_class();
    *(_WORD *)&v5[12] = 2114;
    *(_QWORD *)&v5[14] = v3;
    v4 = *(id *)&v5[4];
    _os_log_impl(&dword_213A6F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] The account storefront is %{public}@.", v5, 0x16u);

  }
  if (objc_msgSend(v3, "containsString:", CFSTR("143441"), *(_OWORD *)v5, *(_QWORD *)&v5[16], v6))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

@end
