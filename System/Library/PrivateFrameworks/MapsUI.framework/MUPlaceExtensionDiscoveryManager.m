@implementation MUPlaceExtensionDiscoveryManager

- (MUPlaceExtensionDiscoveryManager)initWithExtensionDataItems:(id)a3 amsResultProvider:(id)a4
{
  id v7;
  id v8;
  MUPlaceExtensionDiscoveryManager *v9;
  MUPlaceExtensionDiscoveryManager *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *extensionsByAppIds;
  NSMutableDictionary *v13;
  NSMutableDictionary *vendorIdsByAppIds;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MUPlaceExtensionDiscoveryManager;
  v9 = -[MUPlaceExtensionDiscoveryManager init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extensionDataItems, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    extensionsByAppIds = v10->_extensionsByAppIds;
    v10->_extensionsByAppIds = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    vendorIdsByAppIds = v10->_vendorIdsByAppIds;
    v10->_vendorIdsByAppIds = v13;

    objc_storeStrong((id *)&v10->_amsResultProvider, a4);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v20, "vendorIdentifier", (_QWORD)v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v10->_vendorIdsByAppIds;
          objc_msgSend(v20, "appBundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v23);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

  }
  return v10;
}

- (id)discoveryResultForDataItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_extensionDiscoveryResults;
    v8 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "vendorIdentifier", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "vendorIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)performExtensionDiscoveryWithOptions:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  void (**v18)(id, void *, _QWORD);
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (v10)
  {
    if (!v9)
    {
      v9 = (id)MEMORY[0x1E0C80D38];
      v11 = MEMORY[0x1E0C80D38];
    }
    if (-[NSMutableDictionary count](self->_extensionsByAppIds, "count"))
    {
      v12 = (void *)-[NSArray copy](self->_extensionDiscoveryResults, "copy");
      v10[2](v10, v12, 0);

    }
    else
    {
      MUMap(self->_extensionDataItems, &__block_literal_global_35);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_2;
      v15[3] = &unk_1E2E03770;
      v9 = v9;
      v16 = v9;
      v18 = v10;
      objc_copyWeak(&v19, &location);
      v14 = v13;
      v17 = v14;
      -[MUPlaceExtensionDiscoveryManager _loadAppLockupExtensionGroupsUsingAppIdentifiers:options:completion:](self, "_loadAppLockupExtensionGroupsUsingAppIdentifiers:options:completion:", v14, v8, v15);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }

}

uint64_t __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appBundleIdentifier");
}

void __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_3;
    block[3] = &unk_1E2E03198;
    v18 = *(id *)(a1 + 48);
    v17 = v6;
    dispatch_async(v7, block);

    WeakRetained = v18;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_4;
      v10[3] = &unk_1E2E03748;
      v9 = *(_QWORD *)(a1 + 40);
      v11 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 48);
      v12 = 0;
      objc_copyWeak(&v15, (id *)(a1 + 56));
      v13 = WeakRetained;
      objc_msgSend(WeakRetained, "_performExtensionDiscoveryUsingExtensionGroups:usingAppIdentifiers:completion:", v5, v9, v10);
      objc_destroyWeak(&v15);

    }
  }

}

uint64_t __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  _QWORD block[4];
  id v18;
  _QWORD *v19;

  v5 = a2;
  if (a3)
  {
    v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_5;
    block[3] = &unk_1E2E03198;
    v19 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

    v7 = v19;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      v9 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_6;
      v16[3] = &unk_1E2E03720;
      v16[4] = WeakRetained;
      MUMap(v5, v16);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v7[4];
      v7[4] = v10;

      v12 = *(NSObject **)(a1 + 32);
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_7;
      v14[3] = &unk_1E2E03198;
      v13 = *(id *)(a1 + 56);
      v14[4] = *(_QWORD *)(a1 + 48);
      v15 = v13;
      dispatch_async(v12, v14);

    }
  }

}

uint64_t __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

MUPlaceExtensionDiscoveryResult *__98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  MUPlaceExtensionDiscoveryResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MUPlaceExtensionDiscoveryResult *v10;

  v3 = a2;
  v4 = [MUPlaceExtensionDiscoveryResult alloc];
  objc_msgSend(v3, "bestExtensionToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appStoreApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v3, "appIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MUPlaceExtensionDiscoveryResult initWithExtension:appStoreApp:vendorIdentifier:](v4, "initWithExtension:appStoreApp:vendorIdentifier:", v5, v6, v9);

  return v10;
}

void __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)_loadAppLockupExtensionGroupsUsingAppIdentifiers:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MUAMSResultProvider *amsResultProvider;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  amsResultProvider = self->_amsResultProvider;
  v12 = (void *)objc_msgSend(v8, "copy");
  v13 = MEMORY[0x1E0C80D38];
  v14 = MEMORY[0x1E0C80D38];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke;
  v17[3] = &unk_1E2E01498;
  v15 = v10;
  v19 = v15;
  objc_copyWeak(&v20, &location);
  v16 = v8;
  v18 = v16;
  -[MUAMSResultProvider fetchResultsForBundleIds:options:callbackQueue:completion:](amsResultProvider, "fetchResultsForBundleIds:options:callbackQueue:completion:", v12, v9, v13, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  if (a3)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke_2;
      v8[3] = &unk_1E2E03798;
      v9 = *(id *)(a1 + 32);
      MUMap(v7, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

_MUExtensionGroup *__104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _MUExtensionGroup *v8;
  void *v9;
  _MUExtensionGroup *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "iOSBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4
    && (objc_msgSend(v3, "iOSBundleIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    v8 = [_MUExtensionGroup alloc];
    objc_msgSend(v3, "iOSBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_MUExtensionGroup initWithAppIdentifier:](v8, "initWithAppIdentifier:", v9);

    -[_MUExtensionGroup setAppStoreApp:](v10, "setAppStoreApp:", v3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_performExtensionDiscoveryUsingExtensionGroups:(id)a3 usingAppIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _MXExtensionManager *v15;
  _MXExtensionManager *extensionManager;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CC1A68], "lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifiers:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0CC1A68];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __114__MUPlaceExtensionDiscoveryManager__performExtensionDiscoveryUsingExtensionGroups_usingAppIdentifiers_completion___block_invoke;
  v17[3] = &unk_1E2E037C0;
  v13 = v10;
  v19 = v13;
  v14 = v8;
  v18 = v14;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v12, "managerWithExtensionLookupPolicy:updateHandler:", v11, v17);
  v15 = (_MXExtensionManager *)objc_claimAutoreleasedReturnValue();
  extensionManager = self->_extensionManager;
  self->_extensionManager = v15;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __114__MUPlaceExtensionDiscoveryManager__performExtensionDiscoveryUsingExtensionGroups_usingAppIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD *WeakRetained;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MUGetPlaceExtensionDiscoveryManagerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v6;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_ERROR, "Failed to discover the extension with error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (objc_msgSend(v5, "count"))
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v30 = a1;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v8 = *(id *)(a1 + 32);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v38 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v14 = v5;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v34;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v34 != v17)
                    objc_enumerationMutation(v14);
                  objc_msgSend(v13, "addExtensionIfMatchedAppIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j), v30);
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              }
              while (v16);
            }

            objc_msgSend(v13, "bestExtensionToUse");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v32, "addObject:", v19);
              v20 = (void *)WeakRetained[3];
              objc_msgSend(v19, "_containingAppIdentifer");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKey:", v19, v21);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v10);
      }

      if (objc_msgSend(v32, "count"))
      {
        v22 = *(_QWORD *)(v30 + 40);
        v23 = (void *)objc_msgSend(*(id *)(v30 + 32), "copy");
        (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);
      }
      else
      {
        MUGetPlaceExtensionDiscoveryManagerLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_191DB8000, v27, OS_LOG_TYPE_INFO, "We have no non-ui extensions, so early return", buf, 2u);
        }

        v28 = (void *)MEMORY[0x1E0CB35C8];
        GEOErrorDomain();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, -8, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(v30 + 40) + 16))(*(_QWORD *)(v30 + 40), 0, v23);
      }
      v6 = 0;

    }
  }
  else
  {
    MUGetPlaceExtensionDiscoveryManagerLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v24, OS_LOG_TYPE_INFO, "There are no extensions installed.  Early return.", buf, 2u);
    }

    v25 = *(_QWORD *)(a1 + 40);
    v26 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v25 + 16))(v25, v26, 0);

  }
}

- (BOOL)isPerformingDiscovery
{
  return self->_performingDiscovery;
}

- (BOOL)canShowExtensionReservation
{
  return self->_canShowExtensionReservation;
}

- (BOOL)isReservationProviderAppInstalled
{
  return self->_reservationProviderAppInstalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_extensionDiscoveryResults, 0);
  objc_storeStrong((id *)&self->_extensionsByAppIds, 0);
  objc_storeStrong((id *)&self->_vendorIdsByAppIds, 0);
  objc_storeStrong((id *)&self->_extensionDataItems, 0);
}

@end
