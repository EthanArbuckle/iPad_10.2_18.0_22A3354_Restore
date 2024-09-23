@implementation AXAssetMetadataStore

- (void)_mutateInstalledAssets:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[AXAssetMetadataStore defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("InstalledAssets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2](v8, v6);
  -[AXAssetMetadataStore defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("InstalledAssets"));

}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

void __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v3);

}

void __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_3;
  v5[3] = &unk_1E95D3B68;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateInstalledAssetsForAssetType:installedAssets:mutationBlock:", v4, a2, v5);

}

void __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateInstalledAssets:", v3);

}

void __29__AXAssetMetadataStore_store__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXAssetMetadataStore _init]([AXAssetMetadataStore alloc], "_init");
  v1 = (void *)_Store;
  _Store = (uint64_t)v0;

}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void)recordInstalledAssets:(id)a3 forAssetType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  +[AXAsset installedAssets:](AXAsset, "installedAssets:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke;
  v10[3] = &unk_1E95D3BB8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v10);

}

- (void)_performWithLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_mutateInstalledAssetsForAssetType:(id)a3 installedAssets:(id)a4 mutationBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, v10);
  objc_msgSend(v7, "setObject:forKey:", v10, v8);

}

- (id)_init
{
  AXAssetMetadataStore *v2;
  AXAssetMetadataStore *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAssetMetadataStore;
  v2 = -[AXAssetMetadataStore init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    if ((AXProcessIsAXAssetsd() & 1) != 0
      || (AXCUProcessIsVoiceOverTouch() & 1) != 0
      || (AXCUProcessIsAXUIServer() & 1) != 0
      || (AXCUProcessIsAssistiveTouch() & 1) != 0
      || (AXCUProcessIsPreferences() & 1) != 0
      || (AXCUProcessIsVoiceOverUtilityApp() & 1) != 0
      || AXCUProcessIsMagnifierAngel())
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Accessibility.Assets"));
      -[AXAssetMetadataStore setDefaults:](v3, "setDefaults:", v4);
    }
    else
    {
      AXLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D3F8E000, v4, OS_LOG_TYPE_INFO, "Process was not allowed to read/write from com.apple.Accessibility.Assets for AXAssetMetadataStore", v6, 2u);
      }
    }

  }
  return v3;
}

+ (AXAssetMetadataStore)store
{
  if (store_onceToken != -1)
    dispatch_once(&store_onceToken, &__block_literal_global_1);
  return (AXAssetMetadataStore *)(id)_Store;
}

- (void)requestAssertion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "propertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__AXAssetMetadataStore_requestAssertion___block_invoke;
  v8[3] = &unk_1E95D3BB8;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v8);

}

void __41__AXAssetMetadataStore_requestAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AXAssetMetadataStore_requestAssertion___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateAssetAssertions:", v3);

}

void __41__AXAssetMetadataStore_requestAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AXAssetMetadataStore_requestAssertion___block_invoke_3;
  v7[3] = &unk_1E95D3B68;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateAssertionsForAssetType:assertions:mutationBlock:", v6, v5, v7);

}

void __41__AXAssetMetadataStore_requestAssertion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)discardAssertion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "propertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__AXAssetMetadataStore_discardAssertion___block_invoke;
  v8[3] = &unk_1E95D3BB8;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v8);

}

void __41__AXAssetMetadataStore_discardAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AXAssetMetadataStore_discardAssertion___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateAssetAssertions:", v3);

}

void __41__AXAssetMetadataStore_discardAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AXAssetMetadataStore_discardAssertion___block_invoke_3;
  v7[3] = &unk_1E95D3B68;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateAssertionsForAssetType:assertions:mutationBlock:", v6, v5, v7);

}

uint64_t __41__AXAssetMetadataStore_discardAssertion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)discardAllAssertionsOfType:(id)a3 heldByClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke;
  v10[3] = &unk_1E95D3BB8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v10);

}

void __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateAssetAssertions:", v3);

}

void __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_3;
  v5[3] = &unk_1E95D3B68;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateAssertionsForAssetType:assertions:mutationBlock:", v4, a2, v5);

}

void __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_4;
  v3[3] = &unk_1E95D3BE0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ax_removeObjectsFromArrayUsingBlock:", v3);

}

uint64_t __64__AXAssetMetadataStore_discardAllAssertionsOfType_heldByClient___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("clientIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)discardAllAssertionsOfType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke;
  v6[3] = &unk_1E95D3AD0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v6);

}

void __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke_2;
  v2[3] = &unk_1E95D3C48;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_mutateAssetAssertions:", v2);

}

uint64_t __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mutateAssertionsForAssetType:assertions:mutationBlock:", *(_QWORD *)(a1 + 40), a2, &__block_literal_global_8);
}

uint64_t __51__AXAssetMetadataStore_discardAllAssertionsOfType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (id)heldAssertionsForAssetType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__AXAssetMetadataStore_heldAssertionsForAssetType___block_invoke;
  v11[3] = &unk_1E95D3BB8;
  v11[4] = self;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

void __51__AXAssetMetadataStore_heldAssertionsForAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("AssetAssertions"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v3);

}

uint64_t __59__AXAssetMetadataStore_recordInstalledAssets_forAssetType___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetInfoDictionary");
}

- (void)recordAssetRefreshEventForAssetType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke;
  v6[3] = &unk_1E95D3AD0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v6);

}

void __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke_2;
  v2[3] = &unk_1E95D3C48;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_mutateAssetEvents:block:", CFSTR("RefreshEvents"), v2);

}

uint64_t __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mutateAssetEventsForAssetType:events:mutationBlock:", *(_QWORD *)(a1 + 40), a2, &__block_literal_global_17);
}

void __60__AXAssetMetadataStore_recordAssetRefreshEventForAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v2);

  if ((unint64_t)objc_msgSend(v3, "count") >= 5)
    objc_msgSend(v3, "removeObjectAtIndex:", 0);

}

- (void)recordAssetsToBePurged:(id)a3 forAssetType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke;
  v10[3] = &unk_1E95D3BB8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v10);

}

void __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateAssetEvents:block:", CFSTR("PurgeEvents"), v3);

}

void __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_3;
  v5[3] = &unk_1E95D3B68;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateAssetEventsForAssetType:events:mutationBlock:", v4, a2, v5);

}

void __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Date"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("Assets"));
    objc_msgSend(v6, "addObject:", v4);
    if ((unint64_t)objc_msgSend(v6, "count") >= 5)
      objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
}

uint64_t __60__AXAssetMetadataStore_recordAssetsToBePurged_forAssetType___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetInfoDictionary");
}

- (void)recordAssetsToBeDownloaded:(id)a3 forAssetType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke;
  v10[3] = &unk_1E95D3BB8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v10);

}

void __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateAssetEvents:block:", CFSTR("DownloadEvents"), v3);

}

void __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_3;
  v5[3] = &unk_1E95D3B68;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateAssetEventsForAssetType:events:mutationBlock:", v4, a2, v5);

}

void __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ax_mappedArrayUsingBlock:", &__block_literal_global_29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Date"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("Assets"));
    objc_msgSend(v6, "addObject:", v4);
    if ((unint64_t)objc_msgSend(v6, "count") >= 5)
      objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
}

uint64_t __64__AXAssetMetadataStore_recordAssetsToBeDownloaded_forAssetType___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetInfoDictionary");
}

- (void)recordLastAssetAccess:(id)a3
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
    v6[2] = __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke;
    v6[3] = &unk_1E95D3AD0;
    v6[4] = self;
    v7 = v4;
    -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v6);

  }
}

void __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_2;
  v2[3] = &unk_1E95D3C48;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_mutateAssetEvents:block:", CFSTR("AssetAccess"), v2);

}

void __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_3;
  v7[3] = &unk_1E95D3B68;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_mutateAssetEventsForAssetType:events:mutationBlock:", v6, v5, v7);

}

void __46__AXAssetMetadataStore_recordLastAssetAccess___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Date"));

  objc_msgSend(*(id *)(a1 + 32), "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AssetID"));

  objc_msgSend(v6, "addObject:", v3);
  if ((unint64_t)objc_msgSend(v6, "count") >= 4)
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

}

- (id)overrideMinimumCompatibilityVersionForAssetType:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__AXAssetMetadataStore_overrideMinimumCompatibilityVersionForAssetType___block_invoke;
  v8[3] = &unk_1E95D3AA8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__AXAssetMetadataStore_overrideMinimumCompatibilityVersionForAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("Overrides"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinimumCompatibilityVersion"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setOverrideMinimumCompatibilityVersion:(id)a3 forAssetType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke;
  v10[3] = &unk_1E95D3BB8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v10);

}

void __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateOverrides:", v3);

}

void __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_3;
  v5[3] = &unk_1E95D3CF0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateOverridesForAssetType:overrides:mutationBlock:", v4, a2, v5);

}

uint64_t __76__AXAssetMetadataStore_setOverrideMinimumCompatibilityVersion_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("MinimumCompatibilityVersion"));
}

- (id)overrideMaximumCompatibilityVersionForAssetType:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__AXAssetMetadataStore_overrideMaximumCompatibilityVersionForAssetType___block_invoke;
  v8[3] = &unk_1E95D3AA8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__AXAssetMetadataStore_overrideMaximumCompatibilityVersionForAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("Overrides"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaximumCompatibilityVersion"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setOverrideMaximumCompatibilityVersion:(id)a3 forAssetType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke;
  v10[3] = &unk_1E95D3BB8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v10);

}

void __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_2;
  v3[3] = &unk_1E95D3B90;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_mutateOverrides:", v3);

}

void __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_3;
  v5[3] = &unk_1E95D3CF0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_mutateOverridesForAssetType:overrides:mutationBlock:", v4, a2, v5);

}

uint64_t __76__AXAssetMetadataStore_setOverrideMaximumCompatibilityVersion_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("MaximumCompatibilityVersion"));
}

- (id)valueForKey:(id)a3 forAssetType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__AXAssetMetadataStore_valueForKey_forAssetType___block_invoke;
  v12[3] = &unk_1E95D3D18;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  v15 = &v16;
  v9 = v6;
  v14 = v9;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __49__AXAssetMetadataStore_valueForKey_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("UserInfo"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setValue:(id)a3 forKey:(id)a4 forAssetType:(id)a5
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
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke;
  v14[3] = &unk_1E95D3D68;
  v14[4] = self;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v11 = v8;
  v12 = v9;
  v13 = v10;
  -[AXAssetMetadataStore _performWithLock:](self, "_performWithLock:", v14);

}

void __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_2;
  v3[3] = &unk_1E95D3D40;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_mutateUserInfo:", v3);

}

void __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_3;
  v6[3] = &unk_1E95D3C48;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_mutateUserInfoForAssetType:userInfo:mutationBlock:", v5, a2, v6);

}

uint64_t __53__AXAssetMetadataStore_setValue_forKey_forAssetType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_mutateAssetAssertions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[AXAssetMetadataStore defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("AssetAssertions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2](v8, v6);
  -[AXAssetMetadataStore defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("AssetAssertions"));

}

- (void)_mutateAssertionsForAssetType:(id)a3 assertions:(id)a4 mutationBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, v10);
  objc_msgSend(v7, "setObject:forKey:", v10, v8);

}

- (void)_mutateAssetEvents:(id)a3 block:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  -[AXAssetMetadataStore defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6[2](v6, v9);
  -[AXAssetMetadataStore defaults](self, "defaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v11);

}

- (void)_mutateAssetEventsForAssetType:(id)a3 events:(id)a4 mutationBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, v10);
  objc_msgSend(v7, "setObject:forKey:", v10, v8);

}

- (void)_mutateOverrides:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[AXAssetMetadataStore defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("Overrides"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2](v8, v6);
  -[AXAssetMetadataStore defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("Overrides"));

}

- (void)_mutateOverridesForAssetType:(id)a3 overrides:(id)a4 mutationBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, v10);
  objc_msgSend(v7, "setObject:forKey:", v10, v8);

}

- (void)_mutateUserInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[AXAssetMetadataStore defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("UserInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2](v8, v6);
  -[AXAssetMetadataStore defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("UserInfo"));

}

- (void)_mutateUserInfoForAssetType:(id)a3 userInfo:(id)a4 mutationBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, v10);
  objc_msgSend(v7, "setObject:forKey:", v10, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
