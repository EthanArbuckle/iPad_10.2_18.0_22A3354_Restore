@implementation GEOSearchAttributionServerRemoteProxy

- (GEOSearchAttributionServerRemoteProxy)init
{
  GEOSearchAttributionServerRemoteProxy *v2;
  GEOSearchAttributionServerRemoteProxy *v3;
  uint64_t v4;
  OS_dispatch_queue *attributionQueue;
  const char *v6;
  NSObject *v7;
  GEOSearchAttributionServerRemoteProxy *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GEOSearchAttributionServerRemoteProxy;
  v2 = -[GEOSearchAttributionServerRemoteProxy init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_attributionManifestLock._os_unfair_lock_opaque = 0;
    geo_dispatch_queue_create_with_workloop_qos();
    v4 = objc_claimAutoreleasedReturnValue();
    attributionQueue = v3->_attributionQueue;
    v3->_attributionQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v3);
    v6 = GEOSearchAttributionManifestUpdatedDarwinNotificationName;
    v7 = v3->_attributionQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__GEOSearchAttributionServerRemoteProxy_init__block_invoke;
    v10[3] = &unk_1E1C05280;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v3->_attributionManifestUpdatedToken, v7, v10);
    v8 = v3;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __45__GEOSearchAttributionServerRemoteProxy_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  void *v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 6;
    v4 = WeakRetained;
    os_unfair_lock_lock_with_options();
    v3 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v4[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }

}

- (id)_attributionManifest
{
  GEOSearchAttributionServerRemoteProxy *v2;
  os_unfair_lock_s *p_attributionManifestLock;
  GEOSearchAttributionManifest *attributionManifest;
  void *v5;
  void *v6;
  GEOSearchAttributionManifest *v7;
  GEOSearchAttributionManifest *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  id *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  GEOSearchAttributionManifest *v27;
  void *context;
  id *v30;
  void *v31;
  void *v32;
  GEOSearchAttributionServerRemoteProxy *v33;
  os_unfair_lock_s *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v2 = self;
  v51 = *MEMORY[0x1E0C80C00];
  p_attributionManifestLock = &self->_attributionManifestLock;
  os_unfair_lock_lock(&self->_attributionManifestLock);
  attributionManifest = v2->_attributionManifest;
  if (!attributionManifest)
  {
    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 30);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v5);
      v7 = -[GEOSearchAttributionManifest initWithData:]([GEOSearchAttributionManifest alloc], "initWithData:", v6);
      v8 = v2->_attributionManifest;
      v2->_attributionManifest = v7;

      v9 = v2->_attributionManifest;
      if (v9)
      {
        v31 = v6;
        v32 = v5;
        v33 = v2;
        v34 = p_attributionManifestLock;
        context = (void *)MEMORY[0x18D764E2C]();
        objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v30 = v9;
        -[GEOSearchAttributionManifest searchAttributionSources](v9);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v37)
        {
          v36 = *(_QWORD *)v46;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v46 != v36)
                objc_enumerationMutation(obj);
              v38 = v11;
              v12 = *(id **)(*((_QWORD *)&v45 + 1) + 8 * v11);
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              -[GEOSearchAttributionSource localizedAttributions](v12);
              v39 = (id)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v13)
              {
                v14 = v13;
                v40 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v14; ++i)
                  {
                    if (*(_QWORD *)v42 != v40)
                      objc_enumerationMutation(v39);
                    v16 = 0;
                    v17 = *(id **)(*((_QWORD *)&v41 + 1) + 8 * i);
                    if (v17)
                    {
LABEL_15:
                      -[GEOLocalizedAttribution _readLogoURLs]((uint64_t)v17);
                      v18 = objc_msgSend(v17[6], "count");
                      goto LABEL_16;
                    }
                    while (1)
                    {
                      v18 = 0;
LABEL_16:
                      if (v16 >= v18)
                        break;
                      -[GEOLocalizedAttribution logoURLsAtIndex:](v17, v16);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "member:", v19);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v20)
                      {
                        -[GEOLocalizedAttribution logoURLs](v17);
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "replaceObjectAtIndex:withObject:", v16, v20);

                      }
                      else
                      {
                        objc_msgSend(v10, "addObject:", v19);
                      }

                      ++v16;
                      if (v17)
                        goto LABEL_15;
                    }
                    v22 = 0;
                    if (v17)
                    {
LABEL_23:
                      -[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)v17);
                      v23 = objc_msgSend(v17[7], "count");
                      goto LABEL_24;
                    }
                    while (1)
                    {
                      v23 = 0;
LABEL_24:
                      if (v22 >= v23)
                        break;
                      -[GEOLocalizedAttribution snippetLogoURLsAtIndex:](v17, v22);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "member:", v24);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v25)
                      {
                        -[GEOLocalizedAttribution snippetLogoURLs](v17);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v22, v25);

                      }
                      else
                      {
                        objc_msgSend(v10, "addObject:", v24);
                      }

                      ++v22;
                      if (v17)
                        goto LABEL_23;
                    }
                  }
                  v14 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                }
                while (v14);
              }

              v11 = v38 + 1;
            }
            while (v38 + 1 != v37);
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v37);
        }

        objc_autoreleasePoolPop(context);
        v2 = v33;
        p_attributionManifestLock = v34;
        v6 = v31;
        v5 = v32;
        v9 = v30;
      }

    }
    attributionManifest = v2->_attributionManifest;
  }
  v27 = attributionManifest;
  os_unfair_lock_unlock(p_attributionManifestLock);
  return v27;
}

- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *attributionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  attributionQueue = self->_attributionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__GEOSearchAttributionServerRemoteProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E1BFFC90;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(attributionQueue, block);

}

uint64_t __93__GEOSearchAttributionServerRemoteProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAttributionInfoForIdentifiers:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  GEOSearchAttributionLoader *v11;
  GEOSearchAttributionServerRemoteProxy *v12;
  void *v13;
  GEOSearchAttributionLoader *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  GEOSearchAttributionServerRemoteProxy *v20;
  NSObject *attributionQueue;
  id v22;
  id v23;
  void *v24;
  id v25;
  id obj;
  _QWORD block[4];
  id v28;
  id v29;
  GEOSearchAttributionServerRemoteProxy *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v24 = v7;
    v8 = dispatch_group_create();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [GEOSearchAttributionLoader alloc];
    v12 = self;
    -[GEOSearchAttributionServerRemoteProxy _attributionManifest](self, "_attributionManifest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOSearchAttributionLoader initWithAttributionManifest:](v11, "initWithAttributionManifest:", v13);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v6;
    obj = v6;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v18);
          dispatch_group_enter(v8);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
          v32[3] = &unk_1E1C12950;
          v32[4] = v12;
          v33 = v9;
          v34 = v19;
          v35 = v10;
          v36 = v8;
          -[GEOSearchAttributionLoader loadAttributionInfoForIdentifier:allowNetwork:completionHandler:](v14, "loadAttributionInfoForIdentifier:allowNetwork:completionHandler:", v19, 0, v32);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v16);
    }

    v20 = v12;
    attributionQueue = v12->_attributionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3;
    block[3] = &unk_1E1C064B8;
    v28 = v10;
    v7 = v24;
    v30 = v20;
    v31 = v24;
    v29 = v9;
    v22 = v9;
    v23 = v10;
    dispatch_group_notify(v8, attributionQueue, block);

    v6 = v25;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
  }

}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_1E1C12928;
  v11 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v15 = *(id *)(a1 + 64);
  v9 = v3;
  dispatch_async(v5, block);

}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v2, v3);
  else
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[8];
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Missing some attribution information. Asking geod to load it instead.", buf, 2u);
    }

    v17[0] = CFSTR("searchattribution.loadAttribution");
    v16[0] = CFSTR("message");
    v16[1] = CFSTR("userInfo");
    v3 = *(_QWORD *)(a1 + 32);
    v14 = CFSTR("identifiers");
    v15 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 13, CFSTR("SearchAttribution"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_20;
    v9[3] = &unk_1E1C12978;
    v10 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "sendMessage:withReply:handler:", v6, v8, v9);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA70]);
  }
}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  GEOSearchAttributionInfo *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (v28)
    {
      v29 = (void *)MEMORY[0x18D765864](v3);
      GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v65 = v29;
        _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, "Error loading attribution info from geod: %{public}s", buf, 0xCu);
      }

      free(v29);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v31 = *(id *)(a1 + 32);
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v59 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(v4, "setObject:forKey:", v26, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      }
      while (v33);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = a1;
      v43 = v3;
      v41 = v4;
      objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKey:", CFSTR("errors"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v55 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            objc_msgSend(v6, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            _geo_NSErrorFromDictionaryRepresentationCopy(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Bad response data"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v65 = v11;
              v66 = 2114;
              v67 = v13;
              _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Error loading attribution info for identifier %{public}@ from geod: %{public}@", buf, 0x16u);
            }

            objc_msgSend(v45, "setObject:forKey:", v13, v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        }
        while (v8);
      }

      objc_msgSend(v44, "objectForKey:", CFSTR("attributionInfos"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v51;
        do
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v51 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
            objc_msgSend(v17, "objectForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[GEOSearchAttributionInfo initWithDictionaryRepresentation:]([GEOSearchAttributionInfo alloc], "initWithDictionaryRepresentation:", v23);
            if (v24)
            {
              GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v22;
                _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_DEBUG, "Finished loading attribution info from geod for identifier '%{public}@'", buf, 0xCu);
              }

              objc_msgSend(v16, "setObject:forKey:", v24, v22);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        }
        while (v19);
      }

      objc_msgSend(*(id *)(v42 + 40), "addEntriesFromDictionary:", v16);
      (*(void (**)(void))(*(_QWORD *)(v42 + 48) + 16))();

      v3 = v43;
      v26 = v44;
      v4 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v36 = *(id *)(a1 + 32);
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v47;
        do
        {
          for (m = 0; m != v38; ++m)
          {
            if (*(_QWORD *)v47 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(v26, "setObject:forKey:", v6, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m));
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
        }
        while (v38);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionManifest, 0);
  objc_storeStrong((id *)&self->_attributionQueue, 0);
}

@end
