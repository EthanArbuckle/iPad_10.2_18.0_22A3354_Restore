@implementation IRMobileAssetClient

- (IRMobileAssetClient)init
{
  IRMobileAssetClient *v2;
  IRMobileAssetClient *v3;
  IRMobileAssetClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRMobileAssetClient;
  v2 = -[IRMobileAssetClient init](&v6, sel_init);
  v3 = v2;
  if (v2
    && !-[IRMobileAssetClient _createInterestInAssetType:withAssetSpecifier:](v2, "_createInterestInAssetType:withAssetSpecifier:", CFSTR("com.apple.MobileAsset.IntelligentRouting"), CFSTR("IntelligentRoutingSettingsAsset")))
  {
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  os_log_t *v16;
  NSObject *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BE66BD0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initForAssetType:withAssetSpecifier:", v8, v7);

  -[IRMobileAssetClient setCurrentAssetSelector:](self, "setCurrentAssetSelector:", v9);
  v10 = objc_alloc(MEMORY[0x24BE66BB8]);
  -[IRMobileAssetClient currentAssetSelector](self, "currentAssetSelector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v12 = (void *)objc_msgSend(v10, "initForClientName:selectingAsset:error:", CFSTR("IntelligentRoutingDaemon"), v11, &v22);
  v13 = v22;

  if (v13)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRMobileAssetClient _createInterestInAssetType:withAssetSpecifier:].cold.2();
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "interestInContentSync:", CFSTR("Adapting IntelligentRouting performance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15 == 0;
    v16 = (os_log_t *)MEMORY[0x24BE5B270];
    v17 = *MEMORY[0x24BE5B270];
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        -[IRMobileAssetClient _createInterestInAssetType:withAssetSpecifier:].cold.1();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23FFBA000, v17, OS_LOG_TYPE_INFO, "#mobile-asset-client, Successfully set interest in MobileAsset content", buf, 2u);
      }
      v18 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        objc_msgSend(v12, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_INFO, "#mobile-asset-client, %@", buf, 0xCu);

      }
    }

  }
  return v14;
}

- (id)lockAssetContent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD0]), "initForAssetType:withAssetSpecifier:", CFSTR("com.apple.MobileAsset.IntelligentRouting"), CFSTR("IntelligentRoutingSettingsAsset"));
  v28 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB8]), "initForClientName:selectingAsset:error:", CFSTR("IntelligentRoutingDaemon"), v3, &v28);
  v5 = v28;
  if (v5)
  {
    v6 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRMobileAssetClient lockAssetContent].cold.2(v6, v5);
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v26 = 0;
    v27 = 0;
    v25 = 0;
    objc_msgSend(v4, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", CFSTR("Adapting IntelligentRouting performance"), v8, 0, &v27, &v26, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    v11 = v26;
    v12 = v25;
    v13 = (void *)*MEMORY[0x24BE5B270];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v15 = v13;
        objc_msgSend(v12, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        _os_log_impl(&dword_23FFBA000, v15, OS_LOG_TYPE_INFO, "#mobile-asset-client, Unable to lock any version of auto-asset content: %@", buf, 0xCu);

      }
      v7 = 0;
    }
    else
    {
      v24 = v11;
      if (v14)
      {
        v17 = v13;
        objc_msgSend(v10, "assetVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl(&dword_23FFBA000, v17, OS_LOG_TYPE_INFO, "#mobile-asset-client, MobileAsset Locked. Version %@", buf, 0xCu);

        v11 = v24;
      }
      v19 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        objc_msgSend(v4, "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v21;
        _os_log_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_INFO, "#mobile-asset-client, %@", buf, 0xCu);

        v11 = v24;
      }
      if (v10)
      {
        -[IRMobileAssetClient setCurrentAssetSelector:](self, "setCurrentAssetSelector:", v10);
      }
      else
      {
        v22 = *MEMORY[0x24BE5B270];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
          -[IRMobileAssetClient lockAssetContent].cold.1(v22);
      }
      objc_msgSend(v9, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (void)unlockAssetContent
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, v0, v1, "#mobile-asset-client, [ErrorId - AutoAsset end lock error] Failed to end asset locks: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (id)getLockedAssetVersion
{
  void *v2;
  void *v3;

  -[IRMobileAssetClient currentAssetSelector](self, "currentAssetSelector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MAAutoAssetSelector)currentAssetSelector
{
  return self->_currentAssetSelector;
}

- (void)setCurrentAssetSelector:(id)a3
{
  objc_storeStrong((id *)&self->_currentAssetSelector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetSelector, 0);
}

- (void)_createInterestInAssetType:withAssetSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, v0, v1, "#mobile-asset-client, [ErrorId - AutoAsset set interest error] Failed to set interest in content: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_createInterestInAssetType:withAssetSpecifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, v0, v1, "#mobile-asset-client, [ErrorId - AutoAsset init error] Unable to create auto-asset instance: %@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)lockAssetContent
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_23FFBA000, v3, v5, "#mobile-asset-client, [ErrorId - AutoAsset init error] Unable to create auto-asset instance for locking: %@", v6);

}

@end
