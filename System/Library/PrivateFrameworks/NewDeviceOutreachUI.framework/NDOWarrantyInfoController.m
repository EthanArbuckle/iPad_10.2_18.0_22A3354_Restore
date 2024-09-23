@implementation NDOWarrantyInfoController

- (NDOWarrantyInfoController)initWithSpecifier:(id)a3
{
  id v4;
  NDOWarrantyInfoController *v5;
  NDOWarrantyInfoController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NDOWarrantyInfoController;
  v5 = -[NDOWarrantyInfoController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NDOWarrantyInfoController setSpecifier:](v5, "setSpecifier:", v4);

  return v6;
}

- (void)loadView
{
  OUTLINED_FUNCTION_0_2(&dword_229EC7000, a1, a3, "%{public}s: Not signed in to icloud. Leaving...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __37__NDOWarrantyInfoController_loadView__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__NDOWarrantyInfoController_loadView__block_invoke_2;
  block[3] = &unk_24F334938;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __37__NDOWarrantyInfoController_loadView__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "-[NDOWarrantyInfoController loadView]_block_invoke_2";
    _os_log_impl(&dword_229EC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: finished updating warranty", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "postCAEventWithDeviceInfo:", v4);
  objc_msgSend(*(id *)(a1 + 32), "showUI");

}

- (void)postCAEventWithDeviceInfo:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "warranty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coverageLocalizedLabel");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _NDOLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NDOWarrantyInfoController postCAEventWithDeviceInfo:].cold.1((uint64_t)v3, v6, v7);

    v5 = CFSTR("NULL");
  }
  v9 = CFSTR("coverageType");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6C4A0], "postCAEventFor:eventDict:", CFSTR("com.apple.newdeviceoutreach.coverage.viewload"), v8);

}

- (BOOL)isWarrantyValid
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  -[NDOWarrantyInfoController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "warranty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceType");

  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v3, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serialNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getDeviceInfoUsingForceCachedPolicyForSerialNumber:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "getDefaultDeviceInfoUsingForceCachedPolicy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v11, "warranty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v4 && v12)
    v13 = objc_msgSend(v4, "isEqual:", v12);

  return v13;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NDOWarrantyInfoController;
  -[NDOWarrantyInfoController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[NDOWarrantyInfoController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)_refresh:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[NDOWarrantyInfoController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__NDOWarrantyInfoController__refresh___block_invoke;
  v11[3] = &unk_24F334B60;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v7, "clearUserInitiatedFollowUpDismissalForSerialNumber:withReply:", v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __38__NDOWarrantyInfoController__refresh___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__NDOWarrantyInfoController__refresh___block_invoke_2;
  v3[3] = &unk_24F334938;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:", 1, 1, v3);

}

uint64_t __38__NDOWarrantyInfoController__refresh___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRefreshing");
}

- (void)_refreshWithForcedNetworkPolicy:(BOOL)a3 forceUpdateFollowup:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD);
  void (**v23)(_QWORD, _QWORD);
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  _BOOL4 v48;
  void *v49;
  _QWORD v50[4];
  void (**v51)(_QWORD, _QWORD);
  _QWORD v52[4];
  void (**v53)(_QWORD, _QWORD);
  _QWORD v54[4];
  void (**v55)(_QWORD, _QWORD);
  _QWORD v56[5];
  id v57;
  id v58;
  BOOL v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  _BOOL4 v63;
  uint64_t v64;

  v48 = a4;
  v5 = a3;
  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  -[NDOWarrantyInfoController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("NDODevice"));
  v9 = objc_claimAutoreleasedReturnValue();

  -[NDOWarrantyInfoController specifier](self, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v11 = objc_claimAutoreleasedReturnValue();

  -[NDOWarrantyInfoController specifier](self, "specifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertyForKey:", CFSTR("isSettingsContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NDOWarrantyInfoController specifier](self, "specifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertyForKey:", CFSTR("NDOHostingController"));
  v15 = objc_claimAutoreleasedReturnValue();

  if (v13)
    v16 = (void *)v15;
  else
    v16 = 0;
  v49 = v16;
  if (v13)
    v17 = 0;
  else
    v17 = (void *)v15;
  _NDOLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v61 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]";
    v62 = 1024;
    v63 = v13 != 0;
    _os_log_impl(&dword_229EC7000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: checking for warranty in settings: %d", buf, 0x12u);
  }

  v19 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke;
  v56[3] = &unk_24F334BB0;
  v56[4] = self;
  v59 = v13 != 0;
  v20 = v17;
  v57 = v20;
  v21 = v7;
  v58 = v21;
  v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2D8D84](v56);
  v23 = v22;
  if (v13)
  {
    if (v5)
      v24 = 2;
    else
      v24 = 0;
    v25 = (void *)v9;
    v26 = v11 | v9;
    v27 = v49;
    if (!v26)
    {
      _NDOLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

      -[NDOWarrantyInfoController errorUI](self, "errorUI");
    }
    if (v49)
    {
      if (v11)
      {
        objc_msgSend((id)v11, "device");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = v25;
      }
      -[NDOWarrantyInfoController deeplinkParams](self, "deeplinkParams");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v19;
      v54[1] = 3221225472;
      v54[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_60;
      v54[3] = &unk_24F334BD8;
      v55 = v23;
      objc_msgSend(v49, "updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:", v36, v24, v46, v48, v54);

      if (v11)
      v37 = v55;
      goto LABEL_31;
    }
    _NDOLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);
LABEL_37:

    v23[2](v23, v11);
    v27 = v49;
    goto LABEL_38;
  }
  v25 = (void *)v9;
  if (!v5)
  {
    v27 = v49;
    if (v20)
    {
      v50[0] = v19;
      v50[1] = 3221225472;
      v50[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_62;
      v50[3] = &unk_24F334C00;
      v51 = v22;
      objc_msgSend(v20, "updateSpecifiersWithCompletionHandler:", v50);
      v37 = v51;
      goto LABEL_31;
    }
    _NDOLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    *(_DWORD *)buf = 136315138;
    v61 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]";
    v47 = "%s: no achostingController, cannot call updateSpecifiersWithCompletionHandler:";
LABEL_36:
    _os_log_impl(&dword_229EC7000, v38, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);
    goto LABEL_37;
  }
  v27 = v49;
  if (!v20)
  {
    _NDOLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    *(_DWORD *)buf = 136315138;
    v61 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]";
    v47 = "%s: no achostingController, cannot call forceUpdateSpecifiersAndForceUpdateFollowup:withCompletionHandler:";
    goto LABEL_36;
  }
  v52[0] = v19;
  v52[1] = 3221225472;
  v52[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_61;
  v52[3] = &unk_24F334C00;
  v53 = v22;
  objc_msgSend(v20, "forceUpdateSpecifiersAndForceUpdateFollowup:withCompletionHandler:", v48, v52);
  v37 = v53;
LABEL_31:

LABEL_38:
}

void __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v19 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]_block_invoke";
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: refresh completion: specifier: %@, deviceInfo: %@", buf, 0x20u);

  }
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "specifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "specifierForID:", CFSTR("WARRANTY_DESCRIPTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _NDOLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]_block_invoke";
        v20 = 2112;
        v21 = v3;
        _os_log_impl(&dword_229EC7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: isHostSettings == NO, setting specifier deviceInfo: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setSpecifier:", v9);
      objc_msgSend(v9, "propertyForKey:", CFSTR("NDOWarranty"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "specifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setProperty:forKey:", v12, CFSTR("NDOWarranty"));

      }
      objc_msgSend(v9, "propertyForKey:", CFSTR("NDODeviceInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "specifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProperty:forKey:", v14, CFSTR("NDODeviceInfo"));

      }
    }
    goto LABEL_16;
  }
  if (v3)
  {
    _NDOLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "-[NDOWarrantyInfoController _refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:]_block_invoke";
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_229EC7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: isHostSettings == YES, setting specifier deviceInfo: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "warranty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("NDOWarranty"));

    objc_msgSend(*(id *)(a1 + 32), "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v3, CFSTR("NDODeviceInfo"));
LABEL_16:

  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_58;
  v16[3] = &unk_24F334B88;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_58(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__NDOWarrantyInfoController__refreshWithForcedNetworkPolicy_forceUpdateFollowup_withCompletion___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadSpecifiers
{
  void *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136446466;
  v5 = "-[NDOWarrantyInfoController reloadSpecifiers]";
  v6 = 2114;
  v7 = v2;
  OUTLINED_FUNCTION_2_2(&dword_229EC7000, a1, v3, "%{public}s: called off main thread with backtrace: %{public}@", (uint8_t *)&v4);

}

- (void)updateAppSupportSpecifiersWithSpecifiers:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _BYTE location[12];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (unint64_t)a3;
  -[NDOWarrantyInfoController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("NDOWarranty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "displayRepairAndSupport"))
  {
    -[NDOWarrantyInfoController specifier](self, "specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertyForKey:", CFSTR("NDOSupportAppShown"));
    v8 = objc_claimAutoreleasedReturnValue();

    if (v4 | v8)
    {
      if (v4 && v8)
      {
        -[NDOWarrantyInfoController specifier](self, "specifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "propertyForKey:", CFSTR("NDOSupportAppDictionary"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NDOWarrantyInfoController setAppSupportDictionary:](self, "setAppSupportDictionary:", v12);

        _NDOLogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[NDOWarrantyInfoController appSupportDictionary](self, "appSupportDictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 136446466;
          *(_QWORD *)&location[4] = "-[NDOWarrantyInfoController updateAppSupportSpecifiersWithSpecifiers:]";
          v18 = 2112;
          v19 = v14;
          _os_log_impl(&dword_229EC7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: appSupport added with appSupportDictionary: %@", location, 0x16u);

        }
        -[NDOWarrantyInfoController updateAppStoreLookupWithSpecifiers:](self, "updateAppStoreLookupWithSpecifiers:", v4);
      }
      else
      {
        -[NDOWarrantyInfoController setReloadInProgress:](self, "setReloadInProgress:", 0);
      }
    }
    else
    {
      -[NDOWarrantyInfoController specifier](self, "specifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("NDOSupportAppShown"));

      objc_initWeak((id *)location, self);
      v10 = (void *)objc_opt_new();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke;
      v15[3] = &unk_24F334C28;
      objc_copyWeak(&v16, (id *)location);
      objc_msgSend(v10, "appSupportDictionaryWithReply:", v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }
  }

}

void __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke_2;
  v5[3] = &unk_24F334B60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __70__NDOWarrantyInfoController_updateAppSupportSpecifiersWithSpecifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAppSupportDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAppStoreLookupWithSpecifiers:", 0);
  objc_msgSend(WeakRetained, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", *(_QWORD *)(a1 + 32), CFSTR("NDOSupportAppDictionary"));

  objc_msgSend(WeakRetained, "setReloadInProgress:", 0);
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "appSupportDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136446466;
    v7 = "-[NDOWarrantyInfoController updateAppSupportSpecifiersWithSpecifiers:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: appSupport reload completed with appSupportDictionary: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)updateAppStoreLookupWithSpecifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NDOWarrantyInfoController appSupportDictionary](self, "appSupportDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NDOWarrantyInfoController specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyForKey:", CFSTR("NDOWarranty"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NDOWarrantyInfoController appSupportDictionary](self, "appSupportDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE6C4C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "intValue"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F3352F8, self, 0, 0, 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (int)objc_msgSend(v9, "intValue");
      v12 = -[NDOWarrantyInfoController previousAppSupportAvailabilityType](self, "previousAppSupportAvailabilityType");
      -[NDOWarrantyInfoController setPreviousAppSupportAvailabilityType:](self, "setPreviousAppSupportAvailabilityType:", (int)objc_msgSend(v9, "intValue"));
      v29 = v12;
      if (v4)
      {
        objc_msgSend(v4, "addObject:", v10);
      }
      else
      {
        v33[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NDOWarrantyInfoController lastDetailSpecifier](self, "lastDetailSpecifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[NDOWarrantyInfoController lastDetailSpecifier](self, "lastDetailSpecifier");
        else
          -[NDOWarrantyInfoController lastCoverageSpecifier](self, "lastCoverageSpecifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v11;
        v16 = v12 != v11;
        objc_msgSend(v14, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16;
        v11 = v15;
        -[NDOWarrantyInfoController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v28, v17, v18);

      }
      v31[0] = *MEMORY[0x24BE75948];
      v32[0] = objc_opt_class();
      v31[1] = *MEMORY[0x24BE75D10];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = *MEMORY[0x24BE75AC0];
      v32[1] = v19;
      v32[2] = CFSTR("APPSUPPORT");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F3352F8, self, 0, 0, 0, 4, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProperties:", v20);
      objc_msgSend(v21, "setProperty:forKey:", v7, CFSTR("NDOWarranty"));
      if (v10)
      {
        objc_msgSend(v7, "localizedSupportAppFooter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

        if (v23)
        {
          objc_msgSend(v7, "localizedSupportAppFooter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setProperty:forKey:", v24, *MEMORY[0x24BE75A68]);

        }
        if (v4)
        {
          objc_msgSend(v4, "addObject:", v21);
        }
        else
        {
          v25 = v29 != v11;
          v30 = v21;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NDOWarrantyInfoController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v26, v27, v25);

        }
      }

    }
  }

}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)noCoverageInternalSubtitle:(id)a3
{
  if (objc_msgSend(MEMORY[0x24BE6C4B0], "isInternal", a3))
    return CFSTR("[internal] Expected for non-production devices");
  else
    return &stru_24F3352F8;
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  objc_class *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned int v98;
  uint64_t v99;
  void *v100;
  void *v101;
  _QWORD v102[5];
  id v103;
  _QWORD v104[2];
  _QWORD v105[3];
  NSRange v106;
  NSRange v107;
  NSRange v108;

  v105[2] = *MEMORY[0x24BDAC8D0];
  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
LABEL_41:
    v23 = v3;
    return v23;
  }
  v5 = (void *)objc_opt_new();
  -[NDOWarrantyInfoController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("NDOWarranty"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NDOWarrantyInfoController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v99 = v2;
    -[NDOWarrantyInfoController specifier](self, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", CFSTR("isCoverageCentralContainer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v11, "BOOLValue");

    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:");
    v13 = objc_msgSend(v7, "coverageHasACLogo");
    v14 = (_QWORD *)MEMORY[0x24BE75948];
    v15 = (_QWORD *)MEMORY[0x24BE75AC0];
    v101 = v12;
    if ((v13 & 1) != 0)
    {
      v104[0] = *MEMORY[0x24BE75948];
      v105[0] = objc_opt_class();
      v104[1] = *MEMORY[0x24BE75D10];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v105[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F3352F8, self, 0, 0, 0, 4, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setProperties:", v17);
      objc_msgSend(v18, "setProperty:forKey:", v7, CFSTR("NDOWarranty"));
      objc_msgSend(v18, "setProperty:forKey:", CFSTR("COVERAGE_ITEM"), *v15);
      -[NDOWarrantyInfoController coverageItemSubTitle:](self, "coverageItemSubTitle:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setProperty:forKey:", v19, CFSTR("NDOCoverageItemSubtitle"));
      objc_msgSend(v12, "addObject:", v18);

    }
    else
    {
      v24 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v7, "coverageLocalizedDesc");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, sel_coverageItemSubTitle_, 0, 4, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), *v14);
      objc_msgSend(v12, "addObject:", v18);
    }
    -[NDOWarrantyInfoController setLastCoverageSpecifier:](self, "setLastCoverageSpecifier:", v18);
    objc_msgSend(v9, "warranty");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "acOfferDisplayDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "warranty");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "acOfferEligible");
    if (v27)
    {
      if (v29)
      {
        objc_msgSend(v9, "warranty");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "acOfferDisplayDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "timeIntervalSinceNow");
        if (v32 > 0.0)
        {
LABEL_21:

          goto LABEL_22;
        }
        objc_msgSend(v9, "warranty");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "acOfferEligibleUntil");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceNow");
        v36 = v35;

LABEL_15:
        v40 = v101;
        if (v36 <= 0.0)
          goto LABEL_23;
        v41 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v9, "warranty");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "acLocalizedOfferCTA");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, self, 0, 0, 0, 13, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setProperty:forKey:", CFSTR("WARRANTY_OFFER"), *MEMORY[0x24BE75AC0]);
        objc_msgSend(v28, "setButtonAction:", sel_ndoAppleCareCoveragePressed_);
        objc_msgSend(v28, "setProperty:forKey:", v9, CFSTR("NDODeviceInfo"));
        objc_msgSend(v28, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v98);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setProperty:forKey:", v44, CFSTR("isCoverageCentralContainer"));

        objc_msgSend(v101, "addObject:", v28);
        objc_msgSend(v9, "warranty");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "acLocalizedOfferDesc");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "length"))
        {
          v30 = v31;
          if (v30)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v30);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "setProperty:forKey:", v46, *MEMORY[0x24BE75A68]);

          }
        }
        else
        {
          v30 = 0;
        }
        -[NDOWarrantyInfoController setLastCoverageSpecifier:](self, "setLastCoverageSpecifier:", v28);
        goto LABEL_21;
      }
    }
    else if (v29)
    {
      objc_msgSend(v9, "warranty");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "acOfferEligibleUntil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "timeIntervalSinceNow");
      v36 = v39;

      goto LABEL_15;
    }
LABEL_22:
    v40 = v101;

LABEL_23:
    objc_msgSend(v5, "addObjectsFromArray:", v40);
    objc_msgSend(v7, "coverageDetailsDictionary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
    {
LABEL_31:
      -[NDOWarrantyInfoController updateAppSupportSpecifiersWithSpecifiers:](self, "updateAppSupportSpecifiersWithSpecifiers:", v5);
      if (-[NDOWarrantyInfoController _isValidSubscriptionPlan](self, "_isValidSubscriptionPlan"))
      {
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v66);
        objc_msgSend(v7, "acLocalizedUnlinkedPlanLabel");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v67;
        if (v67)
        {
          v69 = v67;
        }
        else
        {
          objc_msgSend(v7, "localizedManagePlanLabel");
          v69 = (id)objc_claimAutoreleasedReturnValue();
        }
        v70 = v69;

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v70, self, 0, 0, 0, 13, 0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setProperty:forKey:", CFSTR("SUBSCRIPTION_PLAN"), *MEMORY[0x24BE75AC0]);
        objc_msgSend(v71, "setButtonAction:", sel_managePlanPressed_);
        objc_msgSend(v71, "setProperty:forKey:", v7, CFSTR("NDOWarranty"));
        objc_msgSend(v71, "setProperty:forKey:", v9, CFSTR("NDODeviceInfo"));
        objc_msgSend(v5, "addObject:", v71);

      }
      objc_msgSend(v7, "footer1FormatString");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "length");

      if (v73)
      {
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "footer1FormatString");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "footer1LinkLabel");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "stringWithFormat:", v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = v101;
        objc_msgSend(v74, "setProperty:forKey:", v78, *MEMORY[0x24BE75A58]);
        v79 = (objc_class *)objc_opt_class();
        NSStringFromClass(v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setProperty:forKey:", v80, *MEMORY[0x24BE75A30]);

        objc_msgSend(v7, "footer1LinkLabel");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v107.location = objc_msgSend(v78, "rangeOfString:", v81);
        NSStringFromRange(v107);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setProperty:forKey:", v82, *MEMORY[0x24BE75A40]);

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setProperty:forKey:", v83, *MEMORY[0x24BE75A50]);

        objc_msgSend(v74, "setProperty:forKey:", CFSTR("footer1Tapped:"), *MEMORY[0x24BE75A38]);
        objc_msgSend(v5, "addObject:", v74);

      }
      objc_msgSend(v7, "footer2FormatString");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "length");

      if (v85)
      {
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "footer2FormatString");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "footer2LinkLabel");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "stringWithFormat:", v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = v101;
        objc_msgSend(v86, "setProperty:forKey:", v90, *MEMORY[0x24BE75A58]);
        v91 = (objc_class *)objc_opt_class();
        NSStringFromClass(v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setProperty:forKey:", v92, *MEMORY[0x24BE75A30]);

        objc_msgSend(v7, "footer2LinkLabel");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v108.location = objc_msgSend(v90, "rangeOfString:", v93);
        NSStringFromRange(v108);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setProperty:forKey:", v94, *MEMORY[0x24BE75A40]);

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setProperty:forKey:", v95, *MEMORY[0x24BE75A50]);

        objc_msgSend(v86, "setProperty:forKey:", CFSTR("footer2Tapped:"), *MEMORY[0x24BE75A38]);
        objc_msgSend(v5, "addObject:", v86);

      }
      v96 = *(Class *)((char *)&self->super.super.super.super.super.isa + v99);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v99) = (Class)v5;

      v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v99);
      goto LABEL_41;
    }
    v48 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v7, "localizedCoverageDetailsTitle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, self, 0, 0, 0, 0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v50);
    objc_msgSend(v7, "coverageDetailsDictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = (void *)objc_opt_new();
      objc_msgSend(v7, "coverageDetailsArray");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = MEMORY[0x24BDAC760];
      v102[1] = 3221225472;
      v102[2] = __39__NDOWarrantyInfoController_specifiers__block_invoke;
      v102[3] = &unk_24F334C50;
      v102[4] = self;
      v103 = v52;
      v54 = v52;
      objc_msgSend(v53, "enumerateObjectsUsingBlock:", v102);
      objc_msgSend(v5, "addObjectsFromArray:", v54);
      objc_msgSend(v54, "lastObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarrantyInfoController setLastDetailSpecifier:](self, "setLastDetailSpecifier:", v55);

    }
    objc_msgSend(v7, "localizedCoverageFooterFormatString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v56, "length"))
    {
      objc_msgSend(v7, "localizedCoverageFooterLinkLabel");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "length");

      if (!v58)
      {
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(v7, "localizedCoverageFooterLinkLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "localizedCoverageFooterFormatString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", v60, v56);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v101;
      objc_msgSend(v50, "setProperty:forKey:", v61, *MEMORY[0x24BE75A68]);
      objc_msgSend(v50, "setProperty:forKey:", v61, *MEMORY[0x24BE75A58]);
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setProperty:forKey:", v63, *MEMORY[0x24BE75A30]);

      v106.location = objc_msgSend(v61, "rangeOfString:", v56);
      NSStringFromRange(v106);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setProperty:forKey:", v64, *MEMORY[0x24BE75A40]);

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setProperty:forKey:", v65, *MEMORY[0x24BE75A50]);

      objc_msgSend(v50, "setProperty:forKey:", CFSTR("benefitsDescLinkTapped:"), *MEMORY[0x24BE75A38]);
    }

    goto LABEL_30;
  }
  if (objc_msgSend(MEMORY[0x24BE6C4B0], "isInternal"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("[internal] No coverage info"), self, 0, sel_noCoverageInternalSubtitle_, 0, 4, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v5, "addObject:", v20);

  }
  v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v5;
  v22 = v5;

  v23 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  return v23;
}

void __39__NDOWarrantyInfoController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedCoverageLabel"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localizedCoverageValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_addKey:value:isCopyable:toSpecifiers:", v5, v4, 1, *(_QWORD *)(a1 + 40));
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[NDOWarrantyInfoController handleURL:withCompletion:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_229EC7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Handle url %@", buf, 0x16u);
  }

  if (-[NDOWarrantyInfoController hasLoaded](self, "hasLoaded"))
    -[NDOWarrantyInfoController reloadSpecifiers](self, "reloadSpecifiers");
  v9.receiver = self;
  v9.super_class = (Class)NDOWarrantyInfoController;
  -[NDOWarrantyInfoController handleURL:withCompletion:](&v9, sel_handleURL_withCompletion_, v6, v7);

}

- (id)coverageItemSubTitle:(id)a3
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
  void *v12;

  -[NDOWarrantyInfoController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("NDOWarranty"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isACServicesPartner"))
  {
    objc_msgSend(v4, "localizedCoverageSubTitleForServicesPartnerString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "coverageEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setTimeStyle:", 0);
      objc_msgSend(v7, "setDateStyle:", 3);
      objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimeZone:", v8);

      objc_msgSend(v4, "coverageEndDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringFromDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "coverageLocalizedExpirationLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v12, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)managePlanPressed:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NDOAMSUIWebViewWrapperController *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  const __CFString *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[NDOWarrantyInfoController managePlanPressed:].cold.2(v4);

  objc_msgSend(v3, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = CFSTR("devicetype");
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceTypeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6C4A0], "postCAEventFor:eventDict:", CFSTR("com.apple.newdeviceoutreach.coverage.loadmanageplan"), v8);
  v9 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(MEMORY[0x24BE083F8], "bagKeySet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE083F8], "bagSubProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE083F8], "bagSubProfileVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerBagKeySet:forProfile:profileVersion:", v10, v11, v12);

  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("AppleCare"), CFSTR("1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForKey:", CFSTR("manageSubscriptionsV2Url"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __47__NDOWarrantyInfoController_managePlanPressed___block_invoke;
  v39[3] = &unk_24F334C78;
  v16 = v3;
  v40 = v16;
  objc_msgSend(v14, "transformWithBlock:", v39);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ams_activeiTunesAccount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    _NDOLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[NDOWarrantyInfoController managePlanPressed:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08680]), "initWithBag:account:clientInfo:", v13, v19, 0);
  v29 = (id)objc_msgSend(v28, "loadBagValue:", v17);
  v30 = -[NDOAMSUIWebViewWrapperController initWithViewController:]([NDOAMSUIWebViewWrapperController alloc], "initWithViewController:", v28);
  v38[0] = v15;
  v38[1] = 3221225472;
  v35 = v13;
  v38[2] = __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_139;
  v38[3] = &unk_24F334938;
  v38[4] = self;
  -[NDOAMSUIWebViewWrapperController setDismissBlock:](v30, "setDismissBlock:", v38);
  -[NDOAMSUIWebViewWrapperController presentationController](v30, "presentationController");
  v31 = v16;
  v32 = v15;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDelegate:", v30);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v30);
  v37[0] = v32;
  v37[1] = 3221225472;
  v37[2] = __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_141;
  v37[3] = &unk_24F334938;
  v37[4] = self;
  -[NDOWarrantyInfoController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, v37);

}

id __47__NDOWarrantyInfoController_managePlanPressed___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("?context=linking&source=applecaresettings&serialNumbers=%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _NDOLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v15 = "-[NDOWarrantyInfoController managePlanPressed:]_block_invoke";
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_229EC7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: deviceInfo: %@ with url: %@", buf, 0x20u);
  }

  v10 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "promiseWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_139(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[NDOWarrantyInfoController managePlanPressed:]_block_invoke";
    _os_log_impl(&dword_229EC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: refreshing warranty after dismiss", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:", 1, 0, 0);
}

uint64_t __47__NDOWarrantyInfoController_managePlanPressed___block_invoke_141(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldRefreshOnAppear:", 1);
}

- (void)footer1Tapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NDOWarrantyInfoController specifier](self, "specifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("NDOWarranty"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v8, "footer1LinkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOWarrantyInfoController openURL:](self, "openURL:", v7);

}

- (void)benefitsDescLinkTapped:(id)a3
{
  void *v4;
  NDOWarrantyBenefitsViewController *v5;
  void *v6;
  id v7;

  -[NDOWarrantyInfoController specifier](self, "specifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("NDOWarranty"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[NDOWarrantyBenefitsViewController initWithWarranty:]([NDOWarrantyBenefitsViewController alloc], "initWithWarranty:", v7);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v5);
  -[NDOWarrantyInfoController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, &__block_literal_global_1);

}

- (void)donePressed:(id)a3
{
  -[NDOWarrantyInfoController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_143);
}

- (void)footer2Tapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NDOWarrantyInfoController specifier](self, "specifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("NDOWarranty"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v8, "footer2LinkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOWarrantyInfoController openURL:](self, "openURL:", v7);

}

- (void)openURL:(id)a3
{
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "openURL:options:completionHandler:", a3, MEMORY[0x24BDBD1B8], 0);
}

- (void)_addKey:(id)a3 value:(id)a4 isCopyable:(BOOL)a5 toSpecifiers:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  -[NDOWarrantyInfoController _addKey:isCopyable:toSpecifiers:](self, "_addKey:isCopyable:toSpecifiers:", a3, v6, v10);
  objc_msgSend(v10, "lastObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NDOWarrantyInfoController _setValue:forSpecifier:](self, "_setValue:forSpecifier:", v11, v12);
}

- (void)_addKey:(id)a3 isCopyable:(BOOL)a4 toSpecifiers:(id)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a5;
  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = a3;
  objc_msgSend(v8, "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_24F3352F8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, sel_valueForSpecifier_, 0, 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v9, *MEMORY[0x24BE75AC0]);

  objc_msgSend(v12, "setProperty:forKey:", NSClassFromString(CFSTR("PSMultilineTableCell")), *MEMORY[0x24BE75948]);
  if (v5)
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759C8]);
  objc_msgSend(v13, "addObject:", v12);

}

- (void)_setValue:(id)a3 forSpecifierWithKey:(id)a4 inSpecifiers:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[NDOWarrantyInfoController specifierForID:inSpecifiers:](self, "specifierForID:inSpecifiers:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NDOWarrantyInfoController _setValue:forSpecifier:](self, "_setValue:forSpecifier:", v8, v9);

}

- (void)_setValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v5 = *MEMORY[0x24BE75DA0];
    v9 = a4;
    objc_msgSend(v9, "setProperty:forKey:", a3, v5);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1488];
    v7 = a4;
    objc_msgSend(v6, "mainBundle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("N/A"), &stru_24F3352F8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75DA0]);

  }
}

- (id)specifierForID:(id)a3 inSpecifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__NDOWarrantyInfoController_specifierForID_inSpecifiers___block_invoke;
  v10[3] = &unk_24F334CE0;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __57__NDOWarrantyInfoController_specifierForID_inSpecifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75DA0]);
}

- (BOOL)_isValidSubscriptionPlan
{
  void *v2;
  void *v3;

  -[NDOWarrantyInfoController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("NDOWarranty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isCoveragePlanSubscriptionType");
  return (char)v2;
}

- (void)ndoAppleCareCoveragePressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NDOAppleCareViewController *v14;
  void *v15;
  NDOAppleCareViewController *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 136315138;
    v26 = "-[NDOWarrantyInfoController ndoAppleCareCoveragePressed:]";
    _os_log_impl(&dword_229EC7000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend(v4, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("isCoverageCentralContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  objc_msgSend(v6, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceFromDeviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    v12 = CFSTR("_COVERAGE_CENTRAL");
  else
    v12 = CFSTR("_COVERAGE");
  objc_msgSend(v10, "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [NDOAppleCareViewController alloc];
  -[NDOWarrantyInfoController deeplinkParams](self, "deeplinkParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NDOAppleCareViewController initWithDeviceInfo:presentationType:source:deeplinkParams:](v14, "initWithDeviceInfo:presentationType:source:deeplinkParams:", v6, 0, v13, v15);

  -[NDOAppleCareViewController setPresentor:](v16, "setPresentor:", self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "userInterfaceIdiom") == 1)
  {

    v18 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom") == 6;

    v18 = 2 * v20;
  }
  -[NDOAppleCareViewController setModalPresentationStyle:](v16, "setModalPresentationStyle:", v18);
  -[NDOAppleCareViewController setModalInPresentation:](v16, "setModalInPresentation:", 1);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v16);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "userInterfaceIdiom") == 6)
  {

LABEL_12:
    objc_msgSend(v21, "setModalPresentationStyle:", 2);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if (v24 == 1)
    goto LABEL_12;
LABEL_13:
  objc_msgSend(v21, "setModalInPresentation:", 1);
  -[NDOWarrantyInfoController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);

}

- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[6];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]";
    _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke;
  v14[3] = &unk_24F334D30;
  v14[4] = self;
  v14[5] = a4;
  v9 = (void (**)(_QWORD))MEMORY[0x22E2D8D84](v14);
  if (!a4)
    goto LABEL_8;
  v10 = (void *)objc_opt_new();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_161;
  v12[3] = &unk_24F334910;
  v13 = v6;
  objc_msgSend(v10, "dismissFollowUpForSerialNumber:completion:", v13, v12);
  if (a4 == 2)
  {
    v9[2](v9);

    goto LABEL_9;
  }
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_167;
  v11[3] = &unk_24F334938;
  v11[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

  if (a4 != 3 && a4 != 5)
LABEL_8:
    v9[2](v9);
LABEL_9:

}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2;
  block[3] = &unk_24F334D08;
  objc_copyWeak(v3, &location);
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v3);
  objc_destroyWeak(&location);
}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 40) == 2)
  {
    _NDOLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v7 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke_2";
      _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Refreshing device info after purchase done", buf, 0xCu);
    }

    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_159;
    v5[3] = &unk_24F334938;
    v5[4] = v3;
    objc_msgSend(v3, "_refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:", 1, 1, v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_159(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    _os_log_impl(&dword_229EC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: Device info refreshed after purchase done", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NDOPurchaseCompletedNotification"), 0);

}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_161(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("Failed to dismiss");
    v8 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136446722;
    if (a2)
      v5 = CFSTR("Dismissed");
    v9 = 2114;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@ followup up for %@", (uint8_t *)&v7, 0x20u);
  }

}

uint64_t __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshWithForcedNetworkPolicy:forceUpdateFollowup:withCompletion:", 1, 1, &__block_literal_global_169);
}

void __86__NDOWarrantyInfoController_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2_168()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446210;
    v2 = "-[NDOWarrantyInfoController outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke_2";
    _os_log_impl(&dword_229EC7000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: Device info refreshed only.", (uint8_t *)&v1, 0xCu);
  }

}

- (id)_noAccountConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CC_NO_ACCOUNT_ERROR_TITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v4);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CC_NO_ACCOUNT_ERROR_SUBTITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSecondaryText:", v6);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.crop.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v7);

  return v2;
}

- (id)_errorStateConfig
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CC_ISSUE_ERROR_TITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CC_ISSUE_ERROR_SUBTITLE"), &stru_24F3352F8, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v7);

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v8);

  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfiguration:", v9);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CC_RETRY"), &stru_24F3352F8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v12);

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46__NDOWarrantyInfoController__errorStateConfig__block_invoke;
  v18[3] = &unk_24F334D78;
  v18[4] = self;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPrimaryAction:", v15);

  return v3;
}

uint64_t __46__NDOWarrantyInfoController__errorStateConfig__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refresh:", 0);
}

- (void)hideUI
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEBD4E8], "loadingConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOWarrantyInfoController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v3);

  -[NDOWarrantyInfoController table](self, "table");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)errorUI
{
  void *v3;
  id v4;

  -[NDOWarrantyInfoController _errorStateConfig](self, "_errorStateConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOWarrantyInfoController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v3);

  -[NDOWarrantyInfoController table](self, "table");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)showUI
{
  id v3;

  -[NDOWarrantyInfoController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  -[NDOWarrantyInfoController table](self, "table");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (NDOACController)acController
{
  return (NDOACController *)objc_loadWeakRetained((id *)&self->_acController);
}

- (void)setAcController:(id)a3
{
  objc_storeWeak((id *)&self->_acController, a3);
}

- (NSDictionary)appSupportDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setAppSupportDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (PSSpecifier)lastDetailSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setLastDetailSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (PSSpecifier)lastCoverageSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setLastCoverageSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (BOOL)reloadInProgress
{
  return self->_reloadInProgress;
}

- (void)setReloadInProgress:(BOOL)a3
{
  self->_reloadInProgress = a3;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (BOOL)shouldRefreshOnAppear
{
  return self->_shouldRefreshOnAppear;
}

- (void)setShouldRefreshOnAppear:(BOOL)a3
{
  self->_shouldRefreshOnAppear = a3;
}

- (unint64_t)previousAppSupportAvailabilityType
{
  return self->_previousAppSupportAvailabilityType;
}

- (void)setPreviousAppSupportAvailabilityType:(unint64_t)a3
{
  self->_previousAppSupportAvailabilityType = a3;
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setDeeplinkParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (void)setIsSignedIn:(BOOL)a3
{
  self->_isSignedIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_storeStrong((id *)&self->_lastCoverageSpecifier, 0);
  objc_storeStrong((id *)&self->_lastDetailSpecifier, 0);
  objc_storeStrong((id *)&self->_appSupportDictionary, 0);
  objc_destroyWeak((id *)&self->_acController);
}

- (void)postCAEventWithDeviceInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446467;
  v4 = "-[NDOWarrantyInfoController postCAEventWithDeviceInfo:]";
  v5 = 2113;
  v6 = a1;
  OUTLINED_FUNCTION_2_2(&dword_229EC7000, a2, a3, "%{public}s: coverageLocalizedLabel nil with deviceInfo: %{private}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_refreshWithForcedNetworkPolicy:(uint64_t)a3 forceUpdateFollowup:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_229EC7000, a1, a3, "%s: no settingshostingController, cannot call updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_refreshWithForcedNetworkPolicy:(uint64_t)a3 forceUpdateFollowup:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_229EC7000, a1, a3, "%{public}s: cannot load warranty: no deviceInfo or device to make query", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)managePlanPressed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_229EC7000, a1, a3, "%{public}s: No active itunes account", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)managePlanPressed:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[NDOWarrantyInfoController managePlanPressed:]";
  _os_log_debug_impl(&dword_229EC7000, log, OS_LOG_TYPE_DEBUG, "%{public}s:", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
