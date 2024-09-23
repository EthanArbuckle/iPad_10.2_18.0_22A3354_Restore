@implementation GEOMapDataSubscriptionOfflineDataKeySelector

- (GEOMapDataSubscriptionOfflineDataKeySelector)initWithSubscription:(id)a3 requestOptions:(unint64_t)a4 auditToken:(id)a5 requiredLayers:(id)a6 log:(id)a7 logPrefix:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  GEOMapDataSubscriptionOfflineDataKeySelector *v19;
  GEOMapDataSubscriptionOfflineDataKeySelector *v20;
  uint64_t v21;
  NSString *logPrefix;
  GEOOfflineDataKeysServiceRequester *v23;
  GEOOfflineDataKeysServiceRequester *dataKeyRequester;
  uint64_t v25;
  NSArray *requiredLayers;
  uint64_t v27;
  OS_dispatch_queue *workQueue;
  dispatch_group_t v29;
  OS_dispatch_group *preparationGroup;
  GEOMapDataSubscriptionOfflineDataKeySelector *v31;
  id v33;
  objc_super v34;

  v33 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)GEOMapDataSubscriptionOfflineDataKeySelector;
  v19 = -[GEOMapDataSubscriptionOfflineDataKeySelector init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_subscription, a3);
    objc_storeStrong((id *)&v20->_log, a7);
    v21 = objc_msgSend(v18, "copy");
    logPrefix = v20->_logPrefix;
    v20->_logPrefix = (NSString *)v21;

    v23 = objc_alloc_init(GEOOfflineDataKeysServiceRequester);
    dataKeyRequester = v20->_dataKeyRequester;
    v20->_dataKeyRequester = v23;

    v20->_requestOptions = a4;
    objc_storeStrong((id *)&v20->_auditToken, a5);
    v25 = objc_msgSend(v16, "copy");
    requiredLayers = v20->_requiredLayers;
    v20->_requiredLayers = (NSArray *)v25;

    geo_dispatch_queue_create_with_workloop_qos();
    v27 = objc_claimAutoreleasedReturnValue();
    workQueue = v20->_workQueue;
    v20->_workQueue = (OS_dispatch_queue *)v27;

    v20->_startedPreparing.lock._os_unfair_lock_opaque = 0;
    v20->_startedPreparing.didRun = 0;
    v29 = dispatch_group_create();
    preparationGroup = v20->_preparationGroup;
    v20->_preparationGroup = (OS_dispatch_group *)v29;

    v31 = v20;
  }

  return v20;
}

- (void)_determineKeysToLoadIfNecessary
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke;
    v1[3] = &unk_1E1BFF6F8;
    v1[4] = a1;
    GEOOnce(a1 + 72, v1);
  }
}

void __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  GEOPBOfflineDataBatchesRequest *v2;
  void *v3;
  void *v4;
  GEOLatLng *v5;
  double v6;
  double v7;
  double v8;
  GEOLatLng *v9;
  GEOLatLng *v10;
  double v11;
  double v12;
  double v13;
  GEOLatLng *v14;
  GEOLatLng *v15;
  double v16;
  double v17;
  double v18;
  GEOLatLng *v19;
  GEOLatLng *v20;
  double v21;
  double v22;
  double v23;
  GEOLatLng *v24;
  GEOLatLng *v25;
  double v26;
  double v27;
  double v28;
  GEOLatLng *v29;
  void *v30;
  void *v31;
  uint64_t Uint64;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 buf;
  void (*v49)(uint64_t, void *, void *);
  void *v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 64));
    v2 = objc_alloc_init(GEOPBOfflineDataBatchesRequest);
    objc_msgSend(*(id *)(v1 + 8), "region");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "vertexsCount"))
    {
      v4 = (void *)objc_msgSend(v3, "copy");

      v5 = [GEOLatLng alloc];
      objc_msgSend(v4, "northLat");
      v7 = v6;
      objc_msgSend(v4, "westLng");
      v9 = -[GEOLatLng initWithLatitude:longitude:](v5, "initWithLatitude:longitude:", v7, v8);
      objc_msgSend(v4, "addVertex:", v9);

      v10 = [GEOLatLng alloc];
      objc_msgSend(v4, "northLat");
      v12 = v11;
      objc_msgSend(v4, "eastLng");
      v14 = -[GEOLatLng initWithLatitude:longitude:](v10, "initWithLatitude:longitude:", v12, v13);
      objc_msgSend(v4, "addVertex:", v14);

      v15 = [GEOLatLng alloc];
      objc_msgSend(v4, "southLat");
      v17 = v16;
      objc_msgSend(v4, "eastLng");
      v19 = -[GEOLatLng initWithLatitude:longitude:](v15, "initWithLatitude:longitude:", v17, v18);
      objc_msgSend(v4, "addVertex:", v19);

      v20 = [GEOLatLng alloc];
      objc_msgSend(v4, "southLat");
      v22 = v21;
      objc_msgSend(v4, "westLng");
      v24 = -[GEOLatLng initWithLatitude:longitude:](v20, "initWithLatitude:longitude:", v22, v23);
      objc_msgSend(v4, "addVertex:", v24);

      v25 = [GEOLatLng alloc];
      objc_msgSend(v4, "northLat");
      v27 = v26;
      objc_msgSend(v4, "westLng");
      v29 = -[GEOLatLng initWithLatitude:longitude:](v25, "initWithLatitude:longitude:", v27, v28);
      objc_msgSend(v4, "addVertex:", v29);

      v3 = v4;
    }
    -[GEOPBOfflineDataBatchesRequest setRegion:](v2, "setRegion:", v3);

    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");
    -[GEOPBOfflineDataBatchesRequest setSupportedLanguages:](v2, "setSupportedLanguages:", v31);

    Uint64 = GEOConfigGetUint64(GeoOfflineConfig_OfflineClientVersionModifier, (uint64_t)off_1EDF4EC38);
    if (Uint64)
      -[GEOPBOfflineDataBatchesRequest setClientVersionModifier:](v2, "setClientVersionModifier:", Uint64);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v33 = *(id *)(v1 + 56);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v45 != v36)
            objc_enumerationMutation(v33);
          -[GEOPBOfflineDataBatchesRequest addLayers:](v2, "addLayers:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "intValue", (_QWORD)v44));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v35);
    }

    v38 = *(NSObject **)(v1 + 24);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v39 = *(_QWORD *)(v1 + 32);
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v39;
      _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ Fetching list of keys from data service", (uint8_t *)&buf, 0xCu);
    }
    v40 = *(void **)(v1 + 40);
    v41 = *(void **)(v1 + 16);
    v42 = v41;
    if (!v41)
    {
      +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43 = *(_QWORD *)(v1 + 48);
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v49 = __68__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoad__block_invoke;
    v50 = &unk_1E1C08BC0;
    v51 = v1;
    objc_msgSend(v40, "startWithRequest:traits:auditToken:options:completionHandler:", v2, 0, v42, v43, &buf, (_QWORD)v44);
    if (!v41)

  }
}

void __68__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  id v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(v8 + 32);
      *(_DWORD *)buf = 138543618;
      v71 = v10;
      v72 = 2114;
      v73 = v7;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch offline data key list: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v6, "layerBatchs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v65;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v16);
          if (v17)
            v18 = objc_msgSend(*(id *)(v17 + 32), "count");
          else
            v18 = 0;
          v14 += v18;
          ++v16;
        }
        while (v13 != v16);
        v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        v13 = v19;
      }
      while (v19);
    }
    else
    {
      v14 = 0;
    }

    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(NSObject **)(v20 + 24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = *(_QWORD *)(v20 + 32);
      v23 = v21;
      v24 = objc_msgSend(v6, "layerBatchsCount");
      *(_DWORD *)buf = 138543874;
      v71 = v22;
      v72 = 2050;
      v73 = v14;
      v74 = 2050;
      v75 = v24;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_INFO, "%{public}@ Fetched offline data key list. %{public}llu total keys across %{public}llu layers", buf, 0x20u);

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
  if (v6)
  {
    v55 = v7;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "layerBatchsCount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v6, "layerBatchs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v61;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v61 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v30);
          if (v31)
          {
            v32 = v31 + 8;
            LODWORD(v31) = *(_DWORD *)(v31 + 8);
            v33 = *(_QWORD *)(v32 + 8);
            v34 = *(unsigned __int8 *)(v32 + 16);
          }
          else
          {
            v33 = 0;
            v34 = 0;
          }
          v35 = (v34 << 31 >> 31) & v31;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v36, v37);

          ++v30;
        }
        while (v28 != v30);
        v38 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        v28 = v38;
      }
      while (v38);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), v25);
    objc_msgSend(v25, "allKeys");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v40 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v57;
      v7 = v55;
      while (2)
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if ((objc_msgSend(v39, "containsObject:", v45) & 1) == 0)
          {
            v46 = *(_QWORD *)(a1 + 32);
            v47 = *(NSObject **)(v46 + 24);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v48 = *(_QWORD *)(v46 + 32);
              *(_DWORD *)buf = 138543618;
              v71 = v48;
              v72 = 2114;
              v73 = v45;
              _os_log_impl(&dword_1885A9000, v47, OS_LOG_TYPE_ERROR, "%{public}@ Fetched offline data key list does not include required layer %{public}@", buf, 0x16u);
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Offline key list is missing required layer"));
            v49 = objc_claimAutoreleasedReturnValue();

            v50 = *(_QWORD *)(a1 + 32);
            v51 = *(void **)(v50 + 88);
            *(_QWORD *)(v50 + 88) = 0;

            v7 = (id)v49;
            goto LABEL_44;
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
        if (v42)
          continue;
        break;
      }
    }
    else
    {
      v7 = v55;
    }
LABEL_44:

  }
  v52 = *(_QWORD *)(a1 + 32);
  v53 = *(void **)(v52 + 96);
  *(_QWORD *)(v52 + 96) = v7;
  v54 = v7;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)determineTotalCountWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *preparationGroup;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[GEOMapDataSubscriptionOfflineDataKeySelector _determineKeysToLoadIfNecessary]((uint64_t)self);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke;
  block[3] = &unk_1E1BFFC90;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_group_notify(preparationGroup, workQueue, block);

}

void __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v18 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "layerBatchs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  v1 = 0;
  v2 = 0;
  if (v21)
  {
    v20 = *(_QWORD *)v32;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(obj);
        v4 = *(id **)(*((_QWORD *)&v31 + 1) + 8 * v3);
        if (v4)
          v5 = objc_msgSend(v4[4], "count");
        else
          v5 = 0;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        -[GEOPBOfflineDataLayerBatches batchReferences](v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v28;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v28 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
              if (v11)
              {
                if ((*(_BYTE *)(v11 + 60) & 2) == 0 || v1 == -1)
                {
                  if ((*(_BYTE *)(v11 + 60) & 2) == 0)
                    v1 = -1;
                }
                else
                {
                  v1 += *(_QWORD *)(v11 + 32);
                }
              }
              else
              {
                v1 = -1;
              }
              ++v10;
            }
            while (v8 != v10);
            v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            v8 = v12;
          }
          while (v12);
        }
        v2 += v5;

        ++v3;
      }
      while (v3 != v21);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v21 = v13;
    }
    while (v13);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke_2;
  block[3] = &unk_1E1C08BE8;
  v14 = *(NSObject **)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v25 = v2;
  v26 = v1;
  v23 = v18;
  v24 = v15;
  v16 = v18;
  dispatch_async(v14, block);

}

uint64_t __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

- (void)determineNextRequestsWithMaximumCount:(unint64_t)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  NSObject *preparationGroup;
  NSObject *workQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  -[GEOMapDataSubscriptionOfflineDataKeySelector _determineKeysToLoadIfNecessary]((uint64_t)self);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke;
  v14[3] = &unk_1E1C00A00;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_group_notify(preparationGroup, workQueue, v14);

}

void __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  GEOOfflineDataBatchKey *v34;
  GEOOfflineDataRequest *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  __CFString *v40;
  unint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  __CFString *v50;
  NSObject *v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD block[5];
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  __CFString *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_2;
    block[3] = &unk_1E1BFF970;
    v2 = *(NSObject **)(a1 + 40);
    v3 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v59 = v3;
    dispatch_async(v2, block);
    v4 = v59;
    goto LABEL_56;
  }
  GEOGetURLWithSource(62, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 104);
  v8 = 0;
  if (v7 >= objc_msgSend(*(id *)(v6 + 88), "layerBatchsCount"))
    goto LABEL_55;
  v9 = 0;
  v10 = &OBJC_IVAR___GEOTextItemContainer__textItems;
  while ((unint64_t)objc_msgSend(v5, "count") < *(_QWORD *)(a1 + 56))
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v9)
      goto LABEL_17;
    objc_msgSend(*(id *)(v11 + 88), "layerBatchs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    v9 = objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v11 + 112))
    {
      v13 = *(id *)(v11 + 24);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        if (v9)
        {
          v15 = *(int *)(v9 + 8);
          if (v15 >= 0x15)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(v9 + 8));
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E1C08C08[v15];
          }
          v17 = v16;
          v18 = objc_msgSend(*(id *)(v9 + v10[316]), "count");
        }
        else
        {
          v17 = CFSTR("LAYER_UNKNOWN");
          v50 = CFSTR("LAYER_UNKNOWN");
          v18 = 0;
          v16 = CFSTR("LAYER_UNKNOWN");
        }
        *(_DWORD *)buf = 138543874;
        v61 = v14;
        v62 = 2114;
        v63 = v16;
        v64 = 2048;
        v65 = v18;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "%{public}@ Starting offline layer %{public}@ (%llu keys)", buf, 0x20u);

      }
      v11 = *(_QWORD *)(a1 + 32);
    }
    if (v9)
    {
LABEL_17:
      v19 = *(_QWORD *)(v11 + 112);
      if (v19 >= objc_msgSend(*(id *)(v9 + v10[316]), "count"))
      {
        if (objc_msgSend(*(id *)(v9 + v10[316]), "count")
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: currentLayerKeys.batchReferencesCount == 0", buf, 2u);
        }
        v25 = 0;
        goto LABEL_22;
      }
      -[GEOPBOfflineDataLayerBatches batchReferences]((id *)v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
      v21 = objc_claimAutoreleasedReturnValue();

      -[GEOPBOfflineDataBatchReference batchIdentifier]((id *)v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        -[GEOPBOfflineDataBatchReference url]((id *)v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dataUsingEncoding:", 4);
        v24 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[GEOPBOfflineDataBatchReference url]((id *)v21);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v4;
      objc_msgSend(v4, "URLByAppendingPathComponent:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = -[GEOOfflineDataBatchKey initWithLayer:key:]([GEOOfflineDataBatchKey alloc], "initWithLayer:key:", *(unsigned int *)(v9 + 8), v24);
        v35 = [GEOOfflineDataRequest alloc];
        if (v21 && (*(_BYTE *)(v21 + 60) & 2) != 0)
          v36 = *(_QWORD *)(v21 + 32);
        else
          v36 = 0;
        v40 = (__CFString *)-[GEOOfflineDataRequest initWithKey:version:url:expectedSizeInBytes:](v35, v34, *(_QWORD *)(v9 + 16), v33, v36);
        objc_msgSend(v5, "addObject:", v40);
        goto LABEL_35;
      }
      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(NSObject **)(v37 + 24);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = *(_QWORD *)(v37 + 32);
        v34 = v38;
        -[GEOPBOfflineDataBatchReference url]((id *)v21);
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v39;
        v62 = 2112;
        v63 = v40;
        _os_log_impl(&dword_1885A9000, &v34->super, OS_LOG_TYPE_ERROR, "%{public}@ Missing/invalid URL for key: %@", buf, 0x16u);
LABEL_35:

      }
      v41 = ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
      if (v41 >= objc_msgSend(*(id *)(v9 + 32), "count"))
      {
        v42 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          v43 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
          v44 = *(int *)(v9 + 8);
          if (v44 >= 0x15)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(v9 + 8));
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v45 = off_1E1C08C08[v44];
          }
          *(_DWORD *)buf = 138543618;
          v61 = v43;
          v62 = 2114;
          v63 = v45;
          _os_log_impl(&dword_1885A9000, v42, OS_LOG_TYPE_DEBUG, "%{public}@ Finished enumerating keys for layer %{public}@", buf, 0x16u);

        }
        ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);

        v9 = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
      }

      v48 = *(_QWORD *)(a1 + 32);
      v49 = *(_QWORD *)(v48 + 104);
      v8 = (void *)v9;
      v4 = v32;
      v10 = &OBJC_IVAR___GEOTextItemContainer__textItems;
      if (v49 >= objc_msgSend(*(id *)(v48 + 88), "layerBatchsCount"))
        goto LABEL_55;
    }
    else
    {
      v25 = 1;
LABEL_22:
      v26 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        if ((v25 & 1) != 0)
        {
          v29 = CFSTR("LAYER_UNKNOWN");
        }
        else
        {
          v28 = *(int *)(v9 + 8);
          if (v28 >= 0x15)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(v9 + 8));
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v29 = off_1E1C08C08[v28];
          }
        }
        *(_DWORD *)buf = 138543618;
        v61 = v27;
        v62 = 2114;
        v63 = v29;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ Finished enumerating keys for layer %{public}@", buf, 0x16u);

      }
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
      v46 = *(_QWORD *)(a1 + 32);
      v47 = *(_QWORD *)(v46 + 104);
      v9 = 0;
      v8 = 0;
      if (v47 >= objc_msgSend(*(id *)(v46 + 88), "layerBatchsCount"))
        goto LABEL_55;
    }
  }
  v8 = (void *)v9;
LABEL_55:
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_13;
  v54[3] = &unk_1E1C01358;
  v51 = *(NSObject **)(a1 + 40);
  v52 = *(id *)(a1 + 48);
  v56 = v5;
  v57 = v52;
  v55 = 0;
  v53 = v5;
  dispatch_async(v51, v54);

LABEL_56:
}

uint64_t __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

uint64_t __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_13(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (NSDictionary)layerVersions
{
  return self->_layerVersions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerVersions, 0);
  objc_storeStrong((id *)&self->_keysLoadError, 0);
  objc_storeStrong((id *)&self->_keysToLoad, 0);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requiredLayers, 0);
  objc_storeStrong((id *)&self->_dataKeyRequester, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
