@implementation MPCStoreFrontLocalEquivalencyMiddlewareOperation

- (MPCStoreFrontLocalEquivalencyMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7;
  id v8;
  MPCStoreFrontLocalEquivalencyMiddlewareOperation *v9;
  MPCStoreFrontLocalEquivalencyMiddlewareOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCStoreFrontLocalEquivalencyMiddlewareOperation;
  v9 = -[MPAsyncOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerRequest, a4);
  }

  return v10;
}

- (void)execute
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  MPCStoreFrontLocalEquivalencyMiddlewareOperation *v39;
  id v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[MPCStoreFrontLocalEquivalencyMiddlewareOperation inputOperations](self, "inputOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_254AAD420);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "controller");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  objc_msgSend(v10, "resolvedPlayerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isLocal");

  if ((v12 & 1) != 0)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[MPCStoreFrontLocalEquivalencyMiddlewareOperation inputOperations](self, "inputOperations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", &unk_254A9E068);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v19, "modelObjects");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            objc_msgSend(v19, "sourceContentItems");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "playingIndexPath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23
              && (objc_msgSend(v21, "itemAtIndexPath:", v23), (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              v25 = v24;
              objc_msgSend(v24, "identifiers");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "universalStore");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "subscriptionAdamID");

              if (!v28)
                goto LABEL_31;
              if (execute_sOnceToken != -1)
                dispatch_once(&execute_sOnceToken, &__block_literal_global_6310);
              if (execute_sSystemMediaApplicationBundleID && execute_sSystemMediaApplicationBundleVersion)
              {
                objc_msgSend(v22, "itemAtIndexPath:", v23);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "userInfo");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BDDC508]);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "MPC_storeFrontIdentifierKey");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v37[0] = MEMORY[0x24BDAC760];
                v37[1] = 3221225472;
                v37[2] = __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2;
                v37[3] = &unk_24CAB3AA0;
                v38 = v31;
                v39 = self;
                v42 = v28;
                v40 = v25;
                v41 = v23;
                v34 = v25;
                v35 = v31;
                objc_msgSend(v32, "getPropertiesForUserIdentity:completionHandler:", v33, v37);

              }
              else
              {
LABEL_31:
                -[MPAsyncOperation finish](self, "finish");

              }
            }
            else
            {
              -[MPAsyncOperation finish](self, "finish");
            }

            goto LABEL_33;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  -[MPAsyncOperation finish](self, "finish");
LABEL_33:

}

- (NSArray)inputProtocols
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_254A9E068;
  v3[1] = &unk_254AAD420;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)outputProtocols
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_254AA8F28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (void)setInputOperations:(id)a3
{
  objc_storeStrong((id *)&self->_inputOperations, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (MPCStoreFrontLocalEquivalencyMiddleware)middleware
{
  return self->_middleware;
}

- (void)setMiddleware:(id)a3
{
  objc_storeStrong((id *)&self->_middleware, a3);
}

- (MPCPlayerRequest)playerRequest
{
  return self->_playerRequest;
}

- (void)setPlayerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_playerRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_inputOperations, 0);
}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "storefrontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MPC_storeFrontIdentifierKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == *(void **)(a1 + 32) || objc_msgSend(v4, "isEqual:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "finish");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lli"), *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDDCC48]);
    objc_msgSend(v6, "setReason:", 3);
    objc_msgSend(v6, "setTimeoutInterval:", &unk_24CB17570);
    objc_msgSend(v6, "setRetryDelay:", 2.0);
    objc_msgSend(v6, "setAllowLocalEquivalencies:", 1);
    objc_msgSend(v6, "setShouldRequireCachedResults:", 1);
    v22[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItemIdentifiers:", v7);

    objc_msgSend(MEMORY[0x24BEC8770], "defaultInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "setClientIdentifier:", execute_sSystemMediaApplicationBundleID);
    objc_msgSend(v9, "setClientVersion:", execute_sSystemMediaApplicationBundleVersion);
    objc_msgSend(v6, "setClientInfo:", v9);
    objc_msgSend(v6, "setShouldIgnoreExpiration:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserIdentity:", v10);

    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserIdentityStore:", v11);

    objc_msgSend(MEMORY[0x24BDDCC50], "sharedStoreItemMetadataRequestController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_70;
    v17[3] = &unk_24CAB7B68;
    v13 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v5;
    v19 = v6;
    v20 = v13;
    v21 = *(id *)(a1 + 56);
    v14 = v6;
    v15 = v5;
    v16 = (id)objc_msgSend(v12, "getStoreItemMetadataForRequest:responseHandler:", v14, v17);

  }
}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v5 = a2;
  v6 = a3;
  if (!v5 || objc_msgSend(v5, "isFinalResponse"))
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
    }
    else
    {
      objc_msgSend(v5, "storeItemMetadataForItemIdentifier:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "playerRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "playingItemProperties");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "playerRequest");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "queueItemProperties");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC80]), "initWithRequestedPropertySet:", v10);
        objc_msgSend(v19, "setShouldUsePlaylistEntry:", objc_msgSend(*(id *)(a1 + 56), "type") == 5);
        objc_msgSend(*(id *)(a1 + 32), "userIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "modelObjectWithStoreItemMetadata:userIdentity:", v7, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22 && (void *)v22 != v21)
        {
          objc_msgSend(*(id *)(a1 + 32), "middleware");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setOverridePlayingItem:", v23);

          v25 = *(_QWORD *)(a1 + 64);
          objc_msgSend(*(id *)(a1 + 32), "middleware");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setPlayingItemIndexPath:", v25);

        }
        objc_msgSend(*(id *)(a1 + 32), "finish");

      }
      else
      {
        objc_msgSend(v5, "cacheMissItemIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 40));

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 48), "setShouldRequireCachedResults:", 0);
          v13 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 280));
          objc_msgSend(MEMORY[0x24BDDCC50], "sharedStoreItemMetadataRequestController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(a1 + 48);
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2_71;
          v27[3] = &unk_24CAB3A78;
          v28 = v13;
          v16 = v13;
          v17 = (id)objc_msgSend(v14, "getStoreItemMetadataForRequest:responseHandler:", v15, v27);

        }
        objc_msgSend(*(id *)(a1 + 32), "finish");
      }

    }
  }

}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v6 || objc_msgSend(v6, "isFinalResponse"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v0 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v1 = (void *)execute_sSystemMediaApplicationBundleID;
  execute_sSystemMediaApplicationBundleID = v0;

  if (execute_sSystemMediaApplicationBundleID)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", execute_sSystemMediaApplicationBundleID);

    if (v3)
    {
      objc_msgSend(v13, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD1E0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4;
      }
      else
      {
        objc_msgSend(v13, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD2A0]);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = (void *)execute_sSystemMediaApplicationBundleVersion;
      execute_sSystemMediaApplicationBundleVersion = (uint64_t)v6;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDC1540]);
      v8 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", execute_sSystemMediaApplicationBundleID, 1, 0);
      v5 = v8;
      if (!v8)
      {
LABEL_14:

        return;
      }
      objc_msgSend(v8, "shortVersionString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v5, "bundleVersion");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)execute_sSystemMediaApplicationBundleVersion;
      execute_sSystemMediaApplicationBundleVersion = (uint64_t)v11;

    }
    goto LABEL_14;
  }
}

- (MPModelGenericObject)overridePlayingItem
{
  void *v2;
  void *v3;

  -[MPCStoreFrontLocalEquivalencyMiddlewareOperation middleware](self, "middleware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overridePlayingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPModelGenericObject *)v3;
}

- (NSIndexPath)playingItemIndexPath
{
  void *v2;
  void *v3;

  -[MPCStoreFrontLocalEquivalencyMiddlewareOperation middleware](self, "middleware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playingItemIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

@end
