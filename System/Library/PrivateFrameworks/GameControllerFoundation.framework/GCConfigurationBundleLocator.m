@implementation GCConfigurationBundleLocator

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  os_activity_scope_state_s v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _os_activity_create(&dword_1DC79E000, "[Config Bundle Locator/Source/FS] Did Change", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v3.opaque[0] = 0;
    v3.opaque[1] = 0;
    os_activity_scope_enter(v2, &v3);
    if (-[_GCConfigurationBundleLocator _onqueue_filesystem_updateBundles]((uint64_t)WeakRetained))
      -[_GCConfigurationBundleLocator _onqueue_rebuildBundleCollection](WeakRetained);
    os_activity_scope_leave(&v3);

  }
}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;
  os_activity_scope_state_s state;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _os_activity_create(&dword_1DC79E000, "[Config Bundle Locator/Source/Asset] Did Change", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2;
    block[3] = &unk_1EA4D2DB8;
    v5 = WeakRetained;
    dispatch_async_and_wait(v3, block);

    os_activity_scope_leave(&state);
  }

}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2(uint64_t a1)
{
  if (-[_GCConfigurationBundleLocator _onqueue_asset_updateBundles](*(_QWORD *)(a1 + 32)))
    -[_GCConfigurationBundleLocator _onqueue_rebuildBundleCollection](*(_QWORD **)(a1 + 32));
}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_11(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[3];
    block[1] = 3221225472;
    block[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2_12;
    block[3] = &unk_1EA4D2DB8;
    v3 = WeakRetained;
    block[0] = MEMORY[0x1E0C809B0];
    v5 = WeakRetained;
    dispatch_async_and_wait(v2, block);

    WeakRetained = v3;
  }

}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2_12(uint64_t a1)
{
  NSObject *v2;
  os_activity_scope_state_s v3;

  v2 = _os_activity_create(&dword_1DC79E000, "[Config Bundle Locator] Refresh Bundles", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  -[_GCConfigurationBundleLocator _onqueue_loadBundlesIfNeeded](*(_QWORD *)(a1 + 32));
  os_activity_scope_leave(&v3);

}

id __45___GCConfigurationBundleLocator_fetchBundles__block_invoke(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];

  v2 = atomic_load(a2);
  if ((v2 & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_17;
    block[3] = &unk_1EA4D2DB8;
    block[4] = v12;
    dispatch_async_and_wait(v13, block);
    v14 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  }
  return v14;
}

void __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  os_activity_scope_state_s v3;

  v2 = _os_activity_create(&dword_1DC79E000, "[Config Bundle Locator] Fetch Bundles", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  -[_GCConfigurationBundleLocator _onqueue_loadBundlesIfNeeded](*(_QWORD *)(a1 + 32));
  os_activity_scope_leave(&v3);

}

void __65___GCConfigurationBundleLocator__onqueue_rebuildBundleCollection__block_invoke(uint64_t a1)
{
  id v2;

  +[NSNotificationCenter defaultCenter](&off_1F03AABE0, "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GCConfigurationBundlesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

_GCConfigurationBundle *__66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _GCConfigurationBundle *v5;
  void *v6;
  _GCConfigurationBundle *v7;
  id v8;
  _GCConfigurationBundle *v9;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_3(v4, v3);
  v5 = [_GCConfigurationBundle alloc];
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = -[_GCConfigurationBundle initWithPath:error:](v5, "initWithPath:error:", v6, &v15);
  v8 = v15;

  if (v7)
  {
    v9 = v7;
    goto LABEL_5;
  }
  objc_msgSend(v8, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", 0x1EA4D88A8))
  {
    v12 = objc_msgSend(v8, "code");

    if (v12 == 2)
    {
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_1(v13, v3);
      goto LABEL_5;
    }
  }
  else
  {

  }
  v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_2(v14, v3, (uint64_t)v8);
LABEL_5:

  return v7;
}

_GCConfigurationBundle *__61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _GCConfigurationBundle *v6;
  void *v7;
  _GCConfigurationBundle *v8;
  id v9;
  _GCConfigurationBundle *v10;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v19, CFSTR("NSURLAssetKey"), 0);
  v4 = v19;
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_2(v5, v3);
  v6 = [_GCConfigurationBundle alloc];
  objc_msgSend(v3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v8 = -[_GCConfigurationBundle initWithPath:error:](v6, "initWithPath:error:", v7, &v18);
  v9 = v18;

  if (v8)
  {
    v10 = v8;
    goto LABEL_5;
  }
  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", 0x1EA4D88A8))
  {
    v13 = objc_msgSend(v9, "code");

    if (v13 == 2)
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_1(v14, v3);
      goto LABEL_5;
    }
  }
  else
  {

  }
  v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v16 = v15;
    objc_msgSend(v3, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v17;
    v22 = 2112;
    v23 = v4;
    v24 = 2114;
    v25 = v9;
    _os_log_fault_impl(&dword_1DC79E000, v16, OS_LOG_TYPE_FAULT, "[Source/Asset] Failed to load bundle '%{public}@' in asset '%@': %{public}@", buf, 0x20u);

  }
LABEL_5:

  return v8;
}

void __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1DC79E000, a1, a3, "Fetch bundles.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1DC79E000, v3, v5, "[Source/FS] Skipping bundle at '%@'.  Incompatible with host.", v6);

  OUTLINED_FUNCTION_6_0();
}

void __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v8 = 2114;
  v9 = a3;
  _os_log_fault_impl(&dword_1DC79E000, v5, OS_LOG_TYPE_FAULT, "[Source/FS] Failed to load bundle at '%@': %{public}@", v7, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

void __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_1DC79E000, v3, v5, "[Source/FS] (Re)Loading bundle at '%@'.", v6);

  OUTLINED_FUNCTION_6_0();
}

void __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1DC79E000, v5, v6, "[Source/Asset] Skipping bundle '%{public}@' in asset '%@'.  Incompatible with host.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3_0(a1);
  objc_msgSend(a2, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1DC79E000, v5, v6, "[Source/Asset] (Re)Loading bundle '%{public}@' in asset '%@'.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

@end
