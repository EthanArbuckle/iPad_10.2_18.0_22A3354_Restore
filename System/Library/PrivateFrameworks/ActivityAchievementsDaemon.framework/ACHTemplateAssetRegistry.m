@implementation ACHTemplateAssetRegistry

- (ACHTemplateAssetRegistry)initWithRemoteTemplateAvailabilityKeyProvider:(id)a3
{
  id v5;
  ACHTemplateAssetRegistry *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *templateSourcesByIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *templateAssetSourcesByIdentifier;
  uint64_t v11;
  OS_dispatch_queue *serialQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACHTemplateAssetRegistry;
  v6 = -[ACHTemplateAssetRegistry init](&v14, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templateSourcesByIdentifier = v6->_templateSourcesByIdentifier;
    v6->_templateSourcesByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templateAssetSourcesByIdentifier = v6->_templateAssetSourcesByIdentifier;
    v6->_templateAssetSourcesByIdentifier = v9;

    HKCreateSerialDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_remoteTemplateAvailabilityKeyProvider, a3);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHTemplateAssetRegistry serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__ACHTemplateAssetRegistry_setDelegate___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

id __40__ACHTemplateAssetRegistry_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)registerTemplateSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHTemplateAssetRegistry *v9;

  v4 = a3;
  -[ACHTemplateAssetRegistry serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD block[4];
  int8x16_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_254D70E88);
  ACHLogAssets();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Template Asset Registry added source with identifier %{public}@", buf, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "templateSourcesByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_262;
    block[3] = &unk_24D13A360;
    v11 = *(int8x16_t *)(a1 + 32);
    v10 = (id)v11.i64[0];
    v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_cold_1();

  }
}

void __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_262(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateAssetRegistry:didUpdateResourcesForTemplatesWithSourceName:", v2, v3);

}

- (void)deregisterTemplateSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHTemplateAssetRegistry *v9;

  v4 = a3;
  -[ACHTemplateAssetRegistry serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_254D70E88);
  objc_msgSend(v2[1], "templateSourcesByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if ((v3 & 1) != 0)
    {
      if (v6)
        return;
      ACHLogAssets();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_1();
    }
    else
    {
      ACHLogAssets();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_2();
    }
  }
  else
  {
    ACHLogAssets();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Template Asset Registry removed source with identifier %{public}@", (uint8_t *)&v13, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*v2, "setDelegate:", 0);
    objc_msgSend(*(id *)(a1 + 40), "templateSourcesByIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v12);

  }
}

- (void)registerTemplateAssetSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHTemplateAssetRegistry *v9;

  v4 = a3;
  -[ACHTemplateAssetRegistry serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD block[4];
  int8x16_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_254D710F8);
  ACHLogAssets();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Template Asset Registry added asset source with identifier %{public}@", buf, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setAssetSourceDelegate:", *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "templateAssetSourcesByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_271;
    block[3] = &unk_24D13A360;
    v11 = *(int8x16_t *)(a1 + 32);
    v10 = (id)v11.i64[0];
    v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_cold_1();

  }
}

void __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_271(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateAssetRegistry:didUpdateResourcesForTemplatesWithSourceName:", v2, v3);

}

- (void)deregisterTemplateAssetSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHTemplateAssetRegistry *v9;

  v4 = a3;
  -[ACHTemplateAssetRegistry serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_254D710F8);
  objc_msgSend(v2[1], "templateAssetSourcesByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if ((v3 & 1) != 0)
    {
      if (v6)
        return;
      ACHLogAssets();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_1();
    }
    else
    {
      ACHLogAssets();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_2();
    }
  }
  else
  {
    ACHLogAssets();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Template Asset Registry removed asset source with identifier %{public}@", (uint8_t *)&v13, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*v2, "setAssetSourceDelegate:", 0);
    objc_msgSend(*(id *)(a1 + 40), "templateAssetSourcesByIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v12);

  }
}

- (void)populateResourcePropertiesForAchievement:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  ACHLogAssets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACHTemplateAssetRegistry populateResourcePropertiesForAchievement:].cold.2(v4, v5);

  -[ACHTemplateAssetRegistry _setBundleURLsForAchievement:](self, "_setBundleURLsForAchievement:", v4);
  ACHLogAssets();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ACHTemplateAssetRegistry populateResourcePropertiesForAchievement:].cold.1(v4, v6);

  ACHApplyBadgePropertiesToAchievement();
}

- (void)_setBundleURLsForAchievement:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD block[5];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__6;
  v50 = __Block_byref_object_dispose__6;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__6;
  v44 = __Block_byref_object_dispose__6;
  v45 = 0;
  -[ACHTemplateAssetRegistry serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ACHTemplateAssetRegistry__setBundleURLsForAchievement___block_invoke;
  block[3] = &unk_24D13B4B8;
  v38 = &v46;
  block[4] = self;
  v7 = v5;
  v37 = v7;
  v39 = &v40;
  dispatch_sync(v6, block);

  v8 = (void *)v41[5];
  if (v8)
    objc_msgSend(v8, "localizationBundleURLForTemplate:", v7);
  else
    objc_msgSend((id)v47[5], "localizationBundleURLForTemplate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v41[5];
  if (v10)
    objc_msgSend(v10, "resourceBundleURLForTemplate:", v7);
  else
    objc_msgSend((id)v47[5], "resourceBundleURLForTemplate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)v41[5];
  if (v12)
    objc_msgSend(v12, "propertyListBundleURLForTemplate:", v7);
  else
    objc_msgSend((id)v47[5], "propertyListBundleURLForTemplate:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v41[5];
  if (v14)
    objc_msgSend(v14, "stickerBundleURLForTemplate:", v7);
  else
    objc_msgSend((id)v47[5], "stickerBundleURLForTemplate:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizationBundleURL:", v9);
  objc_msgSend(v4, "setResourceBundleURL:", v11);
  objc_msgSend(v4, "setPropertyListBundleURL:", v13);
  objc_msgSend(v4, "setStickerBundleURL:", v15);
  if (ACHTemplateIsRemote())
  {
    -[ACHTemplateAssetRegistry remoteTemplateAvailabilityKeyProvider](self, "remoteTemplateAvailabilityKeyProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v17 = objc_msgSend(v16, "templateAvailableOnPairedDevice:error:", v7, &v35);
    v18 = v35;

    if (v18)
    {
      ACHLogAssets();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ACHTemplateAssetRegistry _setBundleURLsForAchievement:].cold.1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

    }
    else
    {
      objc_msgSend(v7, "setAvailableOnPairedDevice:", v17);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26 = v41;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v26 = v47;
    }
    objc_msgSend(v7, "setMobileAssetVersion:", objc_msgSend((id)v26[5], "mobileAssetVersionForTemplate:", v7));
    goto LABEL_24;
  }
LABEL_25:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27 = (void *)v41[5];
    v34 = 0;
    objc_msgSend(v27, "customPlaceholderValuesForTemplate:error:", v7, &v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v34;
    objc_msgSend(v4, "setCustomPlaceholderValues:", v28);

    if (v29)
    {
      ACHLogAssets();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v31 = (void *)v47[5];
    v33 = 0;
    objc_msgSend(v31, "customPlaceholderValuesForTemplate:error:", v7, &v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v33;
    objc_msgSend(v4, "setCustomPlaceholderValues:", v32);

    if (v29)
    {
      ACHLogAssets();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        *(_DWORD *)buf = 138412546;
        v53 = v7;
        v54 = 2112;
        v55 = v29;
        _os_log_impl(&dword_21407B000, v30, OS_LOG_TYPE_DEFAULT, "Error getting custom placeholder for template %@: %@", buf, 0x16u);
      }
LABEL_33:

    }
LABEL_34:

  }
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __57__ACHTemplateAssetRegistry__setBundleURLsForAchievement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "templateSourcesByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sourceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "templateAssetSourcesByIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sourceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)templateSourceDidUpdateAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__ACHTemplateAssetRegistry_templateSourceDidUpdateAssets___block_invoke;
  v6[3] = &unk_24D13A360;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__ACHTemplateAssetRegistry_templateSourceDidUpdateAssets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateAssetRegistry:didUpdateResourcesForTemplatesWithSourceName:", v2, v3);

}

- (void)templateAssetSourceDidUpdateAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__ACHTemplateAssetRegistry_templateAssetSourceDidUpdateAssets___block_invoke;
  v6[3] = &unk_24D13A360;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __63__ACHTemplateAssetRegistry_templateAssetSourceDidUpdateAssets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateAssetRegistry:didUpdateResourcesForTemplatesWithSourceName:", v2, v3);

}

- (ACHTemplateAssetRegistryDelegate)delegate
{
  return (ACHTemplateAssetRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ACHRemoteTemplateAvailabilityKeyProvider)remoteTemplateAvailabilityKeyProvider
{
  return self->_remoteTemplateAvailabilityKeyProvider;
}

- (void)setRemoteTemplateAvailabilityKeyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, a3);
}

- (NSMutableDictionary)templateSourcesByIdentifier
{
  return self->_templateSourcesByIdentifier;
}

- (void)setTemplateSourcesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_templateSourcesByIdentifier, a3);
}

- (NSMutableDictionary)templateAssetSourcesByIdentifier
{
  return self->_templateAssetSourcesByIdentifier;
}

- (void)setTemplateAssetSourcesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_templateAssetSourcesByIdentifier, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_templateAssetSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_templateSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteTemplateAvailabilityKeyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__ACHTemplateAssetRegistry_registerTemplateSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Asset Registry did not add source %{public}@ because it does not conform to source protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Asset Registry did not remove template source %{public}@ because it was not previously registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__ACHTemplateAssetRegistry_deregisterTemplateSource___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Asset Registry did not remove template source %{public}@ because it does not conform to source protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__ACHTemplateAssetRegistry_registerTemplateAssetSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Asset Registry did not add asset source %{public}@ because it does not conform to asset source protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Asset Registry did not remove template asset source %{public}@ because it was not previously registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__ACHTemplateAssetRegistry_deregisterTemplateAssetSource___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Asset Registry did not remove template asset source %{public}@ because it does not conform to source protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)populateResourcePropertiesForAchievement:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizationBundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resourceBundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyListBundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544130;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  _os_log_debug_impl(&dword_21407B000, a2, OS_LOG_TYPE_DEBUG, "URLs for template %{public}@ are now %{public}@, %{public}@, %{public}@", (uint8_t *)&v9, 0x2Au);

}

- (void)populateResourcePropertiesForAchievement:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_21407B000, a2, OS_LOG_TYPE_DEBUG, "Template Asset Registry populating asset URLs for template %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)_setBundleURLsForAchievement:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error reading paired availability of remote assets: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
