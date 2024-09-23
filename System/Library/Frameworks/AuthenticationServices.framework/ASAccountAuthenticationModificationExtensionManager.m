@implementation ASAccountAuthenticationModificationExtensionManager

void __69___ASAccountAuthenticationModificationExtensionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

void __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_2;
    block[3] = &unk_24C94F7E0;
    block[4] = WeakRetained;
    v11 = v6;
    v12 = v5;
    dispatch_async(v9, block);

  }
}

void __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(a1 + 40) != 0;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_endExtensionDiscovery");
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 48));
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_3;
    v2[3] = &unk_24C94F940;
    v2[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BE83068], "getAllApprovedSharedWebCredentialsEntries:", v2);
  }
}

uint64_t __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:", a2);
}

void __129___ASAccountAuthenticationModificationExtensionManager__buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = a1;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x24BDC1538];
        objc_msgSend(v7, "_plugIn");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "containingUrl");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "applicationProxyForBundleURL:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(*(id *)(v24 + 40), "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v15);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);
  }

  v18 = *(_QWORD *)(v24 + 32);
  v19 = *(void **)(v18 + 32);
  *(_QWORD *)(v18 + 32) = v2;
  v20 = v2;

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(v24 + 32) + 16));
  v21 = *(id **)(v24 + 32);
  objc_msgSend(v21[6], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_notifyObservers:", v22);

}

void __93___ASAccountAuthenticationModificationExtensionManager_extensionForDomain_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 56))
      objc_msgSend(WeakRetained, "_beginExtensionDiscovery");
    objc_msgSend(MEMORY[0x24BE83038], "domainByStrippingSubdomainWildcardPrefixIfNecessary:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_highLevelDomainFromHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7[4], "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __74___ASAccountAuthenticationModificationExtensionManager_addChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_beginExtensionDiscovery");
  return result;
}

uint64_t __77___ASAccountAuthenticationModificationExtensionManager_removeChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_endExtensionDiscovery");
  return result;
}

void __73___ASAccountAuthenticationModificationExtensionManager__notifyObservers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "accountModificationExtensionManagerExtensionListDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

@end
