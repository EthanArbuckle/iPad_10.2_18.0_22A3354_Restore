@implementation DSSharingPermissions

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSharingPermissions");
    v3 = (void *)DSLogSharingPermissions;
    DSLogSharingPermissions = (uint64_t)v2;

  }
}

- (DSSharingPermissions)init
{
  DSSharingPermissions *v2;
  DSSharingPermissions *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_queue_t v10;
  dispatch_queue_t v11;
  NSObject *v12;
  _QWORD block[4];
  DSSharingPermissions *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DSSharingPermissions;
  v2 = -[DSSharingPermissions init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_permissionsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissions setPeople:](v3, "setPeople:", v4);

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissions setReadOnlySharingPeople:](v3, "setReadOnlySharingPeople:", v5);

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissions setSharingTypes:](v3, "setSharingTypes:", v6);

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissions setPublicSharingTypes:](v3, "setPublicSharingTypes:", v7);

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissions setReadOnlySharingTypes:](v3, "setReadOnlySharingTypes:", v8);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSSharingPermissions setFetchStartTimesBySource:](v3, "setFetchStartTimesBySource:", v9);

    v10 = dispatch_queue_create("com.apple.DigitalSeparation.SharingPermissions", 0);
    -[DSSharingPermissions setWorkQueue:](v3, "setWorkQueue:", v10);

    v11 = dispatch_queue_create("com.apple.DigitalSeparation.DataUsageQueue", 0);
    -[DSSharingPermissions setDataUsageQueue:](v3, "setDataUsageQueue:", v11);

    -[DSSharingPermissions workQueue](v3, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__DSSharingPermissions_init__block_invoke;
    block[3] = &unk_24F081A20;
    v15 = v3;
    dispatch_async(v12, block);

  }
  return v3;
}

void __28__DSSharingPermissions_init__block_invoke(uint64_t a1)
{
  DSMe *v2;

  v2 = objc_alloc_init(DSMe);
  objc_msgSend(*(id *)(a1 + 32), "setMe:", v2);

}

- (BOOL)shouldAllowBundleIDWithNoPolicy:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  +[DSUtilities allApps](DSUtilities, "allApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Health"))
    || objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)verifyDataUsagePoliciesForSources:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id v37;
  NSObject *queue;
  id v39;
  id obj;
  void *v41;
  void *v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[16];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  queue = a4;
  v37 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  obj = v10;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v59 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "dataUsageBundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18
          && -[DSSharingPermissions shouldAllowBundleIDWithNoPolicy:](self, "shouldAllowBundleIDWithNoPolicy:", v18))
        {
          objc_msgSend(v15, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v19, v18);

        }
        objc_msgSend(v15, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v20);

      }
      v10 = obj;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v12);
  }

  v21 = v42;
  if (objc_msgSend(v42, "count"))
  {
    v22 = objc_alloc(MEMORY[0x24BDC2810]);
    -[DSSharingPermissions dataUsageQueue](self, "dataUsageQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithQueue:", v23);

    v25 = dispatch_group_create();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v42, "allKeys");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v54 != v28)
            objc_enumerationMutation(v39);
          v30 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
          dispatch_group_enter(v25);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x24BDAC760];
          v47[1] = 3221225472;
          v47[2] = __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke;
          v47[3] = &unk_24F081A48;
          v48 = v42;
          v49 = v30;
          v50 = v41;
          v51 = v25;
          v52 = v9;
          objc_msgSend(v24, "getLocalPolicies:completion:", v31, v47);

        }
        v27 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v27);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_18;
    block[3] = &unk_24F0815B8;
    v32 = v37;
    v46 = v37;
    v44 = v9;
    v33 = v41;
    v45 = v41;
    v34 = queue;
    dispatch_group_notify(v25, queue, block);

    v21 = v42;
    v35 = obj;
  }
  else
  {
    v36 = DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227D24000, v36, OS_LOG_TYPE_INFO, "All sources have required data usage policies", buf, 2u);
    }
    v32 = v37;
    v35 = obj;
    v33 = v41;
    (*((void (**)(id, id, void *))v37 + 2))(v37, obj, v41);
    v34 = queue;
  }

}

void __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  obj = v5;
  if (v6)
  {
    v7 = DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR))
      __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    +[DSError errorWithCode:](DSError, "errorWithCode:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 1, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

    v5 = obj;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v17 = *(void **)(a1 + 32);
          objc_msgSend(v16, "bundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = DSLogSharingPermissions;
          if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v19;
            v34 = 2114;
            v35 = v16;
            _os_log_impl(&dword_227D24000, v20, OS_LOG_TYPE_INFO, "Got data usage policy for %{public}@: %{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x24BDC2730], "ds_DataUsagePolicyWithPolicy:sourceName:", v16, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = DSLogSharingPermissions;
            if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v33 = v21;
              v34 = 2114;
              v35 = v19;
              _os_log_impl(&dword_227D24000, v22, OS_LOG_TYPE_DEFAULT, "Required policy %{public}@ for %{public}@ not met.", buf, 0x16u);
            }
            objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", 0, v19);
            +[DSError errorWithCode:](DSError, "errorWithCode:", 5);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v23;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 1, v19, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);
          }

        }
        v5 = obj;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v13);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    v6 = 0;
  }

}

void __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)fetchPermissionsFromSources:(id)a3 includingErrors:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_group_t v15;
  NSObject *v16;
  size_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *queue;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  os_signpost_id_t v31;
  _QWORD block[4];
  dispatch_group_t v33;
  id v34;
  id v35;
  DSSharingPermissions *v36;
  id v37;
  id location;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v27 = a4;
  queue = a5;
  v25 = a6;
  v11 = os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
  v12 = (id)DSLogSharingPermissions;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "fetch", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_group_create();
  objc_initWeak(&location, self);
  v16 = DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v10;
    _os_log_impl(&dword_227D24000, v16, OS_LOG_TYPE_INFO, "Fetching sharing permissions from sources: %{public}@", buf, 0xCu);
  }
  v17 = objc_msgSend(v10, "count");
  -[DSSharingPermissions workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke;
  block[3] = &unk_24F081A98;
  v33 = v15;
  v34 = v10;
  v24 = v10;
  v20 = v15;
  objc_copyWeak(&v37, &location);
  v21 = v14;
  v35 = v21;
  v36 = self;
  dispatch_apply(v17, v18, block);

  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_24;
  v28[3] = &unk_24F081AC0;
  v29 = v21;
  v30 = v25;
  v31 = v11;
  v22 = v25;
  v23 = v21;
  dispatch_group_notify(v20, queue, v28);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  id WeakRetained;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53[2];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

  if (v7)
  {
    v8 = (id)DSLogSharingPermissions;
    v9 = v8;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Calendars", " enableTelemetry=YES ", buf, 2u);
    }
LABEL_55:

    goto LABEL_61;
  }
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

  if (v11)
  {
    v12 = (id)DSLogSharingPermissions;
    v9 = v12;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.FindMy", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

  if (v14)
  {
    v15 = (id)DSLogSharingPermissions;
    v9 = v15;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Photos", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

  if (v17)
  {
    v18 = (id)DSLogSharingPermissions;
    v9 = v18;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Home", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

  if (v20)
  {
    v21 = (id)DSLogSharingPermissions;
    v9 = v21;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Health", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

  if (v23)
  {
    v24 = (id)DSLogSharingPermissions;
    v9 = v24;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Notes", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

  if (v26)
  {
    v27 = (id)DSLogSharingPermissions;
    v9 = v27;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Zelkova", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

  if (v29)
  {
    v30 = (id)DSLogSharingPermissions;
    v9 = v30;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Activity", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

  if (v32)
  {
    v33 = (id)DSLogSharingPermissions;
    v9 = v33;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Passkeys", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

  if (v35)
  {
    v36 = (id)DSLogSharingPermissions;
    v9 = v36;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.ItemSharing", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  objc_msgSend(v4, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

  v39 = (id)DSLogSharingPermissions;
  v9 = v39;
  if (v38)
  {
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Maps", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Notes", " enableTelemetry=YES ", buf, 2u);
  }

  v40 = (void *)DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
    __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_cold_1(v40, v4);
LABEL_61:
  v41 = DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v4;
    _os_log_impl(&dword_227D24000, v41, OS_LOG_TYPE_INFO, "Fetching sharing permissions from %{public}@", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v4, "name");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "fetchStartedForSource:", v43);

  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19;
  v47[3] = &unk_24F081A70;
  v44 = v4;
  v48 = v44;
  v49 = WeakRetained;
  v45 = *(id *)(a1 + 48);
  v46 = *(_QWORD *)(a1 + 56);
  v50 = v45;
  v51 = v46;
  v52 = *(id *)(a1 + 32);
  objc_copyWeak(v53, (id *)(a1 + 64));
  v53[1] = v5;
  objc_msgSend(v44, "fetchSharedResourcesWithCompletion:", v47);
  objc_destroyWeak(v53);

}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t i;
  void *v30;
  DSSharingPerson *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  id WeakRetained;
  void *v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  os_signpost_id_t v49;
  const char *v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  int v55;
  NSObject *v56;
  void *v57;
  int v58;
  NSObject *v59;
  void *v60;
  int v61;
  NSObject *v62;
  void *v63;
  int v64;
  NSObject *v65;
  void *v66;
  int v67;
  NSObject *v68;
  void *v69;
  int v70;
  NSObject *v71;
  void *v72;
  int v73;
  NSObject *v74;
  void *v75;
  int v76;
  NSObject *v77;
  NSObject *v78;
  os_signpost_id_t v79;
  void *v80;
  int v81;
  NSObject *v82;
  os_signpost_id_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id obj;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  void *v108;
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  id v112;
  __int16 v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)DSLogSharingPermissions;
  v92 = a1;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v110 = v10;
    v111 = 2113;
    v112 = v5;
    v113 = 2050;
    v114 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_227D24000, v9, OS_LOG_TYPE_INFO, "Finished fetching sharing permissions from %{public}@ with %{private}@ resources (%{public}lu)", buf, 0x20u);

  }
  v11 = *(void **)(a1 + 40);
  v12 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchCompletedForSource:", v13);

  v14 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ds_errorFromIgnorableError:sourceName:", v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR))
      __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_3((void **)(a1 + 32), v17);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSError errorWithCode:sourceName:underlyingErrors:](DSError, "errorWithCode:sourceName:underlyingErrors:", 1, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v21 = v5;
  v86 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
  if (v86)
  {
    v22 = *(_QWORD *)v102;
    v23 = (id *)(a1 + 72);
    v88 = v21;
    v89 = v16;
    v85 = *(_QWORD *)v102;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v102 != v22)
          objc_enumerationMutation(v21);
        v87 = v24;
        v25 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v24);
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        objc_msgSend(v25, "participants", v85);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
        if (!v26)
        {
          v28 = 0;
          goto LABEL_30;
        }
        v27 = v26;
        v28 = 0;
        v91 = *(_QWORD *)v98;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v98 != v91)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
            v31 = -[DSSharingPerson initWithSource:sharedResource:participant:deviceOwnerRole:]([DSSharingPerson alloc], "initWithSource:sharedResource:participant:deviceOwnerRole:", *(_QWORD *)(a1 + 32), v25, v30, v28);
            objc_msgSend(*(id *)(a1 + 56), "me");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
                __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_2();
              dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

              v21 = v88;
              v16 = v89;
              goto LABEL_89;
            }
            objc_msgSend(*(id *)(a1 + 56), "me");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[DSSharingPerson isMe:](v31, "isMe:", v33);

            if (!v34)
              goto LABEL_25;
            v35 = objc_msgSend(v30, "role");
            if (v35 == 2)
            {
              if (v28 == 1)
                v28 = 1;
              else
                v28 = 2;
LABEL_25:
              a1 = v92;
              goto LABEL_26;
            }
            a1 = v92;
            if (v35 == 1)
              v28 = 1;
LABEL_26:

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
          if (v27)
            continue;
          break;
        }
LABEL_30:

        if (v28 <= 1)
          v36 = 1;
        else
          v36 = v28;
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v25, "participants");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v94;
          do
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v94 != v40)
                objc_enumerationMutation(v37);
              v42 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * j);
              WeakRetained = objc_loadWeakRetained(v23);
              objc_msgSend(WeakRetained, "addParticipant:forSource:sharedResource:deviceOwnerRole:", v42, *v12, v25, v36);

            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
          }
          while (v39);
        }

        a1 = v92;
        objc_msgSend(*(id *)(v92 + 56), "_trackResourceForPublicAccess:source:", v25, *(_QWORD *)(v92 + 32));
        v24 = v87 + 1;
        v21 = v88;
        v16 = v89;
        v22 = v85;
      }
      while (v87 + 1 != v86);
      v86 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
    }
    while (v86);
  }

  objc_msgSend(*v12, "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

  if (v45)
  {
    v46 = (id)DSLogSharingPermissions;
    v47 = v46;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v46))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Calendars";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

  if (v52)
  {
    v53 = (id)DSLogSharingPermissions;
    v47 = v53;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v53))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.FindMy";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

  if (v55)
  {
    v56 = (id)DSLogSharingPermissions;
    v47 = v56;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v56))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Photos";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

  if (v58)
  {
    v59 = (id)DSLogSharingPermissions;
    v47 = v59;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v59))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Home";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

  if (v61)
  {
    v62 = (id)DSLogSharingPermissions;
    v47 = v62;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v62))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Health";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

  if (v64)
  {
    v65 = (id)DSLogSharingPermissions;
    v47 = v65;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v65))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Notes";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

  if (v67)
  {
    v68 = (id)DSLogSharingPermissions;
    v47 = v68;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v68))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Zelkova";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

  if (v70)
  {
    v71 = (id)DSLogSharingPermissions;
    v47 = v71;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v71))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Activity";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

  if (v73)
  {
    v74 = (id)DSLogSharingPermissions;
    v47 = v74;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v74))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.Passkeys";
    goto LABEL_85;
  }
  objc_msgSend(*v12, "name");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

  if (v76)
  {
    v77 = (id)DSLogSharingPermissions;
    v47 = v77;
    v48 = v92;
    v49 = *(_QWORD *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v77))
      goto LABEL_87;
    *(_WORD *)buf = 0;
    v50 = "fetch.ItemSharing";
LABEL_85:
    v78 = v47;
    v79 = v49;
LABEL_86:
    _os_signpost_emit_with_name_impl(&dword_227D24000, v78, OS_SIGNPOST_INTERVAL_END, v79, v50, " enableTelemetry=YES ", buf, 2u);
    goto LABEL_87;
  }
  objc_msgSend(*(id *)(v92 + 32), "name");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

  v48 = v92;
  v82 = (id)DSLogSharingPermissions;
  v47 = v82;
  v83 = *(_QWORD *)(v92 + 80);
  if (!v81)
  {
    if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v47, OS_SIGNPOST_INTERVAL_END, v83, "fetch.Notes", " enableTelemetry=YES ", buf, 2u);
    }

    v84 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_1((uint64_t)v12, v84);
    goto LABEL_88;
  }
  if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
  {
    *(_WORD *)buf = 0;
    v50 = "fetch.Maps";
    v78 = v47;
    v79 = v83;
    goto LABEL_86;
  }
LABEL_87:

LABEL_88:
  dispatch_group_leave(*(dispatch_group_t *)(v48 + 64));
LABEL_89:

}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  uint8_t v6[16];

  v2 = (id)DSLogSharingPermissions;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fetch", " enableTelemetry=YES ", v6, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[DSError errorWithCode:underlyingErrors:](DSError, "errorWithCode:underlyingErrors:", 1, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchPermissionsOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  DSSourceRepository *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(DSSourceRepository);
  -[DSSharingPermissions setRepo:](self, "setRepo:", v8);

  os_unfair_lock_lock(&self->_permissionsLock);
  -[DSSharingPermissions people](self, "people");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[DSSharingPermissions readOnlySharingPeople](self, "readOnlySharingPeople");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[DSSharingPermissions sharingTypes](self, "sharingTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[DSSharingPermissions readOnlySharingTypes](self, "readOnlySharingTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  os_unfair_lock_unlock(&self->_permissionsLock);
  objc_initWeak(&location, self);
  -[DSSharingPermissions repo](self, "repo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sources");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__DSSharingPermissions_fetchPermissionsOnQueue_completion___block_invoke;
  v18[3] = &unk_24F081AE8;
  objc_copyWeak(&v21, &location);
  v16 = v6;
  v19 = v16;
  v17 = v7;
  v20 = v17;
  -[DSSharingPermissions verifyDataUsagePoliciesForSources:queue:completion:](self, "verifyDataUsagePoliciesForSources:queue:completion:", v15, v16, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __59__DSSharingPermissions_fetchPermissionsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "fetchPermissionsFromSources:includingErrors:queue:completion:", v7, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_trackResourceForPublicAccess:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  os_unfair_lock_s *p_permissionsLock;
  DSPublicSharingType *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  DSPublicSharingType *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  DSPublicSharingType *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "visibility") == 2)
    v8 = v6;
  else
    v8 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "participationAccess") & 2) != 0)
  {
    v9 = v6;

    v8 = v9;
  }
  if (v8)
  {
    p_permissionsLock = &self->_permissionsLock;
    os_unfair_lock_lock(&self->_permissionsLock);
    v11 = -[DSPublicSharingType initWithSource:]([DSPublicSharingType alloc], "initWithSource:", v7);
    -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexOfObject:", v11);

    -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v14, "addObject:", v11);

      -[DSPublicSharingType addPublicResource:](v11, "addPublicResource:", v8);
      v16 = DSLogSharingPermissions;
      if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
      {
        v19 = 138478083;
        v20 = v8;
        v21 = 2114;
        v22 = v11;
        _os_log_impl(&dword_227D24000, v16, OS_LOG_TYPE_INFO, "Adding public resource %{private}@ to new sharing type %{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v17 = (DSPublicSharingType *)objc_claimAutoreleasedReturnValue();

      -[DSPublicSharingType addPublicResource:](v17, "addPublicResource:", v8);
      v18 = DSLogSharingPermissions;
      if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
      {
        v19 = 138478083;
        v20 = v8;
        v21 = 2114;
        v22 = v17;
        _os_log_impl(&dword_227D24000, v18, OS_LOG_TYPE_INFO, "Adding public resource %{private}@ to existing sharing type %{public}@", (uint8_t *)&v19, 0x16u);
      }

    }
    os_unfair_lock_unlock(p_permissionsLock);

  }
}

- (void)sort
{
  os_unfair_lock_s *p_permissionsLock;
  void *v4;
  void *v5;
  void *v6;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  -[DSSharingPermissions people](self, "people");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_1);

  -[DSSharingPermissions sharingTypes](self, "sharingTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_32);

  -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_34);

  os_unfair_lock_unlock(p_permissionsLock);
}

uint64_t __28__DSSharingPermissions_sort__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "score");
  if (v6 >= objc_msgSend(v5, "score"))
  {
    v8 = objc_msgSend(v4, "score");
    if (v8 <= objc_msgSend(v5, "score"))
    {
      objc_msgSend(v4, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "localizedStandardCompare:", v10);

    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __28__DSSharingPermissions_sort__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "score");
  if (v6 >= objc_msgSend(v5, "score"))
  {
    v8 = objc_msgSend(v4, "score");
    if (v8 <= objc_msgSend(v5, "score"))
    {
      objc_msgSend(v4, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "localizedStandardCompare:", v10);

    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __28__DSSharingPermissions_sort__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "score");
  if (v6 >= objc_msgSend(v5, "score"))
  {
    v8 = objc_msgSend(v4, "score");
    if (v8 <= objc_msgSend(v5, "score"))
    {
      objc_msgSend(v4, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "localizedStandardCompare:", v10);

    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)addParticipant:(id)a3 forSource:(id)a4 sharedResource:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  DSSharingPerson *v13;
  uint64_t v14;
  DSSharingPerson *v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  void (**v23)(_QWORD);
  _QWORD v24[4];
  DSSharingPerson *v25;
  DSSharingPermissions *v26;
  id v27;
  id v28;
  id v29;
  id v30[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[DSSharingPerson initWithSource:sharedResource:participant:deviceOwnerRole:]([DSSharingPerson alloc], "initWithSource:sharedResource:participant:deviceOwnerRole:", v11, v12, v10, a6);
  objc_initWeak(&location, self);
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke;
  v24[3] = &unk_24F081BB0;
  objc_copyWeak(v30, &location);
  v15 = v13;
  v25 = v15;
  v26 = self;
  v16 = v10;
  v27 = v16;
  v17 = v11;
  v28 = v17;
  v18 = v12;
  v29 = v18;
  v30[1] = (id)a6;
  v19 = (void (**)(_QWORD))MEMORY[0x22E2A849C](v24);
  -[DSSharingPermissions me](self, "me");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v19[2](v19);
  }
  else
  {
    -[DSSharingPermissions workQueue](self, "workQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke_36;
    v22[3] = &unk_24F081658;
    v22[4] = self;
    v23 = v19;
    dispatch_async(v21, v22);

  }
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

}

void __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  DSSharingType *v9;
  const char *v10;
  void *v11;
  DSSharingType *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  DSSharingType *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  DSSharingType *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  DSSharingType *v33;
  NSObject *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  DSSharingType *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "me");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isMe:", v4);

  if ((_DWORD)v3)
  {
    v5 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v6 = *(void **)(a1 + 56);
      v8 = v5;
      objc_msgSend(v6, "name");
      v9 = (DSSharingType *)objc_claimAutoreleasedReturnValue();
      v36 = 138478083;
      v37 = v7;
      v38 = 2114;
      v39 = v9;
      v10 = "Skipping participant %{private}@ for source %{public}@ because they match the me card";
LABEL_9:
      _os_log_impl(&dword_227D24000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v36, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      os_unfair_lock_lock(WeakRetained + 2);
      v12 = (DSSharingType *)*(id *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "people");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "indexOfObject:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "people");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v15, "addObject:", v12);

        v17 = v12;
      }
      else
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
        v17 = (DSSharingType *)objc_claimAutoreleasedReturnValue();

        -[DSSharingType addSource:sharedResource:participant:deviceOwnerRole:](v17, "addSource:sharedResource:participant:deviceOwnerRole:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
        v21 = (void *)DSLogSharingPermissions;
        if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
        {
          v23 = *(_QWORD *)(a1 + 48);
          v22 = *(void **)(a1 + 56);
          v24 = v21;
          objc_msgSend(v22, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138478339;
          v37 = v23;
          v38 = 2114;
          v39 = v17;
          v40 = 2114;
          v41 = v25;
          _os_log_impl(&dword_227D24000, v24, OS_LOG_TYPE_INFO, "Adding participant %{private}@ to existing person %{public}@ for source %{public}@", (uint8_t *)&v36, 0x20u);

        }
      }
      v26 = -[DSSharingType initWithSource:]([DSSharingType alloc], "initWithSource:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 40), "sharingTypes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "indexOfObject:", v26);

      objc_msgSend(*(id *)(a1 + 40), "sharingTypes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v29, "addObject:", v26);

        -[DSSharingType addPerson:](v26, "addPerson:", v17);
        v31 = DSLogSharingPermissions;
        if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
        {
          v32 = *(_QWORD *)(a1 + 32);
          v36 = 138478083;
          v37 = v32;
          v38 = 2114;
          v39 = v26;
          _os_log_impl(&dword_227D24000, v31, OS_LOG_TYPE_INFO, "Adding person %{private}@ to new sharing type %{public}@", (uint8_t *)&v36, 0x16u);
        }
      }
      else
      {
        objc_msgSend(v29, "objectAtIndexedSubscript:", v28);
        v33 = (DSSharingType *)objc_claimAutoreleasedReturnValue();

        -[DSSharingType addPerson:](v33, "addPerson:", v17);
        v34 = DSLogSharingPermissions;
        if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
        {
          v35 = *(_QWORD *)(a1 + 32);
          v36 = 138478083;
          v37 = v35;
          v38 = 2114;
          v39 = v33;
          _os_log_impl(&dword_227D24000, v34, OS_LOG_TYPE_INFO, "Adding person %{private}@ to existing sharing type %{public}@", (uint8_t *)&v36, 0x16u);
        }

      }
      os_unfair_lock_unlock(WeakRetained + 2);

    }
    else
    {
      v18 = (void *)DSLogSharingPermissions;
      if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 48);
        v19 = *(void **)(a1 + 56);
        v8 = v18;
        objc_msgSend(v19, "name");
        v9 = (DSSharingType *)objc_claimAutoreleasedReturnValue();
        v36 = 138478083;
        v37 = v20;
        v38 = 2114;
        v39 = v9;
        v10 = "Skipping participant %{private}@ for source %{public}@ because they do not have a display name";
        goto LABEL_9;
      }
    }
  }

}

void __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke_36(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 40));
  }
  else if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
  {
    __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_2();
  }
}

- (void)removePerson:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "allSources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissions removePerson:sources:](self, "removePerson:sources:", v4, v5);

}

- (void)removePerson:(id)a3 sources:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  DSSharingType *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_permissionsLock);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = -[DSSharingType initWithSource:]([DSSharingType alloc], "initWithSource:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        -[DSSharingPermissions sharingTypes](self, "sharingTypes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "indexOfObject:", v12);

        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = v12;
        }
        else
        {
          -[DSSharingPermissions sharingTypes](self, "sharingTypes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "removePerson:", v28);
          objc_msgSend(v15, "allPeople");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (!v18)
            objc_msgSend(v27, "addObject:", v15);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  objc_msgSend(v28, "allSources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
  {
    -[DSSharingPermissions people](self, "people");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v28);

  }
  os_unfair_lock_unlock(&self->_permissionsLock);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v27;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        -[DSSharingPermissions removeSharingType:](self, "removeSharingType:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v24);
  }

}

- (void)removeSharingType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "allPeople");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissions removeSharingType:people:](self, "removeSharingType:people:", v4, v5);

}

- (void)removeSharingType:(id)a3 people:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_unfair_lock_t lock;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v12);
        -[DSSharingPermissions people](self, "people", lock);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "indexOfObject:", v13);

        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[DSSharingPermissions people](self, "people");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "source");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeSource:", v18);

          objc_msgSend(v17, "allSources");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (!v20)
            objc_msgSend(v30, "addObject:", v17);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "allPeople");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    -[DSSharingPermissions sharingTypes](self, "sharingTypes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObject:", v6);

  }
  os_unfair_lock_unlock(lock);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = v30;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        -[DSSharingPermissions removePerson:](self, "removePerson:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v28++), lock);
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v26);
  }

}

- (void)removePublicSharingType:(id)a3
{
  os_unfair_lock_s *p_permissionsLock;
  id v5;
  void *v6;

  p_permissionsLock = &self->_permissionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterPeopleWithPredicate:(id)a3
{
  os_unfair_lock_s *p_permissionsLock;
  id v5;
  void *v6;
  void *v7;

  p_permissionsLock = &self->_permissionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  -[DSSharingPermissions people](self, "people");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredOrderedSetUsingPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSSharingPermissions setFilteredPeople:](self, "setFilteredPeople:", v7);
  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterReadOnlySharingPeopleWithPredicate:(id)a3
{
  os_unfair_lock_s *p_permissionsLock;
  id v5;
  void *v6;
  void *v7;

  p_permissionsLock = &self->_permissionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  -[DSSharingPermissions readOnlySharingPeople](self, "readOnlySharingPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredOrderedSetUsingPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSSharingPermissions setFilteredReadOnlySharingPeople:](self, "setFilteredReadOnlySharingPeople:", v7);
  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterSharingTypesWithPredicate:(id)a3
{
  os_unfair_lock_s *p_permissionsLock;
  id v5;
  void *v6;
  void *v7;

  p_permissionsLock = &self->_permissionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  -[DSSharingPermissions sharingTypes](self, "sharingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredOrderedSetUsingPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSSharingPermissions setFilteredSharingTypes:](self, "setFilteredSharingTypes:", v7);
  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterReadOnlySharingTypesWithPredicate:(id)a3
{
  os_unfair_lock_s *p_permissionsLock;
  id v5;
  void *v6;
  void *v7;

  p_permissionsLock = &self->_permissionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  -[DSSharingPermissions readOnlySharingTypes](self, "readOnlySharingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredOrderedSetUsingPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSSharingPermissions setFilteredReadOnlySharingTypes:](self, "setFilteredReadOnlySharingTypes:", v7);
  os_unfair_lock_unlock(p_permissionsLock);
}

- (id)person:(int64_t)a3 withFilter:(BOOL)a4
{
  os_unfair_lock_s *p_permissionsLock;
  void *v8;
  void *v9;
  void *v10;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4)
    -[DSSharingPermissions filteredPeople](self, "filteredPeople");
  else
    -[DSSharingPermissions people](self, "people");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 < 0 || objc_msgSend(v8, "count") <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions person:withFilter:].cold.1();
    os_unfair_lock_unlock(p_permissionsLock);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (id)readOnlySharingPerson:(int64_t)a3 withFilter:(BOOL)a4
{
  os_unfair_lock_s *p_permissionsLock;
  void *v8;
  void *v9;
  void *v10;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4)
    -[DSSharingPermissions filteredReadOnlySharingPeople](self, "filteredReadOnlySharingPeople");
  else
    -[DSSharingPermissions readOnlySharingPeople](self, "readOnlySharingPeople");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 < 0 || objc_msgSend(v8, "count") <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions readOnlySharingPerson:withFilter:].cold.1();
    os_unfair_lock_unlock(p_permissionsLock);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (id)sharingType:(int64_t)a3 withFilter:(BOOL)a4
{
  os_unfair_lock_s *p_permissionsLock;
  void *v8;
  void *v9;
  void *v10;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4)
    -[DSSharingPermissions filteredSharingTypes](self, "filteredSharingTypes");
  else
    -[DSSharingPermissions sharingTypes](self, "sharingTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 < 0 || objc_msgSend(v8, "count") <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions person:withFilter:].cold.1();
    os_unfair_lock_unlock(p_permissionsLock);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (id)publicSharingType:(int64_t)a3
{
  os_unfair_lock_s *p_permissionsLock;
  void *v6;
  void *v7;
  void *v8;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 < 0 || objc_msgSend(v6, "count") <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions person:withFilter:].cold.1();
    os_unfair_lock_unlock(p_permissionsLock);
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v8;
}

- (id)readOnlySharingType:(int64_t)a3 withFilter:(BOOL)a4
{
  os_unfair_lock_s *p_permissionsLock;
  void *v8;
  void *v9;
  void *v10;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4)
    -[DSSharingPermissions filteredReadOnlySharingTypes](self, "filteredReadOnlySharingTypes");
  else
    -[DSSharingPermissions readOnlySharingTypes](self, "readOnlySharingTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 < 0 || objc_msgSend(v8, "count") <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions readOnlySharingPerson:withFilter:].cold.1();
    os_unfair_lock_unlock(p_permissionsLock);
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (int64_t)peopleCountWithFilter:(BOOL)a3
{
  os_unfair_lock_s *p_permissionsLock;
  void *v6;
  int64_t v7;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3)
    -[DSSharingPermissions filteredPeople](self, "filteredPeople");
  else
    -[DSSharingPermissions people](self, "people");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions peopleCountWithFilter:].cold.1();
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (int64_t)readOnlySharingPeopleCountWithFilter:(BOOL)a3
{
  os_unfair_lock_s *p_permissionsLock;
  void *v6;
  int64_t v7;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3)
    -[DSSharingPermissions filteredReadOnlySharingPeople](self, "filteredReadOnlySharingPeople");
  else
    -[DSSharingPermissions readOnlySharingPeople](self, "readOnlySharingPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions readOnlySharingPeopleCountWithFilter:].cold.1();
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (int64_t)sharingTypesCountWithFilter:(BOOL)a3
{
  os_unfair_lock_s *p_permissionsLock;
  void *v6;
  int64_t v7;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3)
    -[DSSharingPermissions filteredSharingTypes](self, "filteredSharingTypes");
  else
    -[DSSharingPermissions sharingTypes](self, "sharingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions peopleCountWithFilter:].cold.1();
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (int64_t)publicSharingTypesCount
{
  os_unfair_lock_s *p_permissionsLock;
  void *v4;
  int64_t v5;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  os_unfair_lock_unlock(p_permissionsLock);
  if (v5 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions readOnlySharingPeopleCountWithFilter:].cold.1();
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (int64_t)readOnlySharingTypesCountWithFilter:(BOOL)a3
{
  os_unfair_lock_s *p_permissionsLock;
  void *v6;
  int64_t v7;

  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3)
    -[DSSharingPermissions filteredReadOnlySharingTypes](self, "filteredReadOnlySharingTypes");
  else
    -[DSSharingPermissions readOnlySharingTypes](self, "readOnlySharingTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      -[DSSharingPermissions readOnlySharingPeopleCountWithFilter:].cold.1();
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (NSArray)allPeople
{
  void *v2;
  void *v3;

  -[DSSharingPermissions people](self, "people");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)allReadOnlySharingPeople
{
  void *v2;
  void *v3;

  -[DSSharingPermissions readOnlySharingPeople](self, "readOnlySharingPeople");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)allSharingTypes
{
  void *v2;
  void *v3;

  -[DSSharingPermissions sharingTypes](self, "sharingTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)allPublicSharingTypes
{
  void *v2;
  void *v3;

  -[DSSharingPermissions publicSharingTypes](self, "publicSharingTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)allReadOnlySharingTypes
{
  void *v2;
  void *v3;

  -[DSSharingPermissions readOnlySharingTypes](self, "readOnlySharingTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)elapsedUnfinishedFetchesBySource
{
  void *v3;
  __uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  os_unfair_lock_t lock;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  lock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[DSSharingPermissions fetchStartTimesBySource](self, "fetchStartTimesBySource");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        -[DSSharingPermissions fetchStartTimesBySource](self, "fetchStartTimesBySource", lock);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedLongLongValue");

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(v4 - v12) / 1000000000.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v14;
}

- (void)fetchStartedForSource:(id)a3
{
  os_unfair_lock_s *p_permissionsLock;
  id v5;
  void *v6;
  void *v7;

  p_permissionsLock = &self->_permissionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissions fetchStartTimesBySource](self, "fetchStartTimesBySource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v5);

  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)fetchCompletedForSource:(id)a3
{
  os_unfair_lock_s *p_permissionsLock;
  id v5;
  void *v6;

  p_permissionsLock = &self->_permissionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  -[DSSharingPermissions fetchStartTimesBySource](self, "fetchStartTimesBySource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  DSPublicSharingType *v18;
  void *v19;
  DSPublicSharingType *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  const char *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  int v58;
  NSObject *v59;
  void *v60;
  void *v61;
  int v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  NSObject *v67;
  void *v68;
  void *v69;
  int v70;
  NSObject *v71;
  void *v72;
  void *v73;
  int v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  os_signpost_id_t spid;
  id obj;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  NSObject *queue;
  _QWORD block[4];
  id v101;
  id v102;
  id v103;
  os_signpost_id_t v104;
  _QWORD v105[5];
  id v106;
  id v107;
  NSObject *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[5];
  id v115;
  id v116;
  id v117;
  NSObject *v118;
  id v119[2];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id location;
  uint8_t v129[128];
  uint8_t buf[4];
  void *v131;
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  queue = a3;
  v92 = a4;
  v6 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingPermissions allSharingTypes](self, "allSharingTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x24BDBCEF0];
  -[DSSharingPermissions allPublicSharingTypes](self, "allPublicSharingTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v10, "setWithArray:", v12);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v125 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
        v18 = [DSPublicSharingType alloc];
        objc_msgSend(v17, "source");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[DSPublicSharingType initWithSource:](v18, "initWithSource:", v19);

        objc_msgSend(v96, "removeObject:", v20);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v124, v133, 16);
    }
    while (v14);
  }

  v21 = os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
  v22 = (id)DSLogSharingPermissions;
  v23 = v22;
  spid = v21;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "stopAll", " enableTelemetry=YES ", buf, 2u);
  }

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  obj = v13;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
  if (v24)
  {
    v95 = *(_QWORD *)v121;
    do
    {
      v97 = v24;
      for (j = 0; j != v97; ++j)
      {
        if (*(_QWORD *)v121 != v95)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
        dispatch_group_enter(v6);
        v27 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
        objc_msgSend(v26, "source");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

        if (v30)
        {
          v31 = (id)DSLogSharingPermissions;
          v32 = v31;
          if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
          {
            *(_WORD *)buf = 0;
            v33 = v32;
            v34 = (os_signpost_id_t)v27;
            v35 = "stopAll.Calendars";
LABEL_60:
            _os_signpost_emit_with_name_impl(&dword_227D24000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v34, v35, " enableTelemetry=YES ", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v26, "source");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

          if (v38)
          {
            v39 = (id)DSLogSharingPermissions;
            v32 = v39;
            if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
            {
              *(_WORD *)buf = 0;
              v33 = v32;
              v34 = (os_signpost_id_t)v27;
              v35 = "stopAll.FindMy";
              goto LABEL_60;
            }
          }
          else
          {
            objc_msgSend(v26, "source");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "name");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

            if (v42)
            {
              v43 = (id)DSLogSharingPermissions;
              v32 = v43;
              if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
              {
                *(_WORD *)buf = 0;
                v33 = v32;
                v34 = (os_signpost_id_t)v27;
                v35 = "stopAll.Photos";
                goto LABEL_60;
              }
            }
            else
            {
              objc_msgSend(v26, "source");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "name");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

              if (v46)
              {
                v47 = (id)DSLogSharingPermissions;
                v32 = v47;
                if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
                {
                  *(_WORD *)buf = 0;
                  v33 = v32;
                  v34 = (os_signpost_id_t)v27;
                  v35 = "stopAll.Home";
                  goto LABEL_60;
                }
              }
              else
              {
                objc_msgSend(v26, "source");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "name");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

                if (v50)
                {
                  v51 = (id)DSLogSharingPermissions;
                  v32 = v51;
                  if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
                  {
                    *(_WORD *)buf = 0;
                    v33 = v32;
                    v34 = (os_signpost_id_t)v27;
                    v35 = "stopAll.Health";
                    goto LABEL_60;
                  }
                }
                else
                {
                  objc_msgSend(v26, "source");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "name");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

                  if (v54)
                  {
                    v55 = (id)DSLogSharingPermissions;
                    v32 = v55;
                    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
                    {
                      *(_WORD *)buf = 0;
                      v33 = v32;
                      v34 = (os_signpost_id_t)v27;
                      v35 = "stopAll.Notes";
                      goto LABEL_60;
                    }
                  }
                  else
                  {
                    objc_msgSend(v26, "source");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "name");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

                    if (v58)
                    {
                      v59 = (id)DSLogSharingPermissions;
                      v32 = v59;
                      if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
                      {
                        *(_WORD *)buf = 0;
                        v33 = v32;
                        v34 = (os_signpost_id_t)v27;
                        v35 = "stopAll.Zelkova";
                        goto LABEL_60;
                      }
                    }
                    else
                    {
                      objc_msgSend(v26, "source");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "name");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

                      if (v62)
                      {
                        v63 = (id)DSLogSharingPermissions;
                        v32 = v63;
                        if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
                        {
                          *(_WORD *)buf = 0;
                          v33 = v32;
                          v34 = (os_signpost_id_t)v27;
                          v35 = "stopAll.Activity";
                          goto LABEL_60;
                        }
                      }
                      else
                      {
                        objc_msgSend(v26, "source");
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v64, "name");
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

                        if (v66)
                        {
                          v67 = (id)DSLogSharingPermissions;
                          v32 = v67;
                          if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
                          {
                            *(_WORD *)buf = 0;
                            v33 = v32;
                            v34 = (os_signpost_id_t)v27;
                            v35 = "stopAll.Passkeys";
                            goto LABEL_60;
                          }
                        }
                        else
                        {
                          objc_msgSend(v26, "source");
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v68, "name");
                          v69 = (void *)objc_claimAutoreleasedReturnValue();
                          v70 = objc_msgSend(v69, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

                          if (v70)
                          {
                            v71 = (id)DSLogSharingPermissions;
                            v32 = v71;
                            if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
                            {
                              *(_WORD *)buf = 0;
                              v33 = v32;
                              v34 = (os_signpost_id_t)v27;
                              v35 = "stopAll.ItemSharing";
                              goto LABEL_60;
                            }
                          }
                          else
                          {
                            objc_msgSend(v26, "source");
                            v72 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v72, "name");
                            v73 = (void *)objc_claimAutoreleasedReturnValue();
                            v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

                            v75 = (id)DSLogSharingPermissions;
                            v32 = v75;
                            if (v74)
                            {
                              if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                              {
                                *(_WORD *)buf = 0;
                                v33 = v32;
                                v34 = (os_signpost_id_t)v27;
                                v35 = "stopAll.Maps";
                                goto LABEL_60;
                              }
                            }
                            else
                            {
                              if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_227D24000, v32, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v27, "stopAll.Notes", " enableTelemetry=YES ", buf, 2u);
                              }

                              v32 = (id)DSLogSharingPermissions;
                              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                              {
                                objc_msgSend(v26, "source");
                                v82 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v82, "name");
                                v83 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138543362;
                                v131 = v83;
                                _os_log_fault_impl(&dword_227D24000, v32, OS_LOG_TYPE_FAULT, "Signpost for unsupported source name %{public}@", buf, 0xCu);

                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }

        v76 = (id)DSLogSharingPermissions;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v26, "source");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "name");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v131 = v78;
          _os_log_impl(&dword_227D24000, v76, OS_LOG_TYPE_INFO, "Stopping all sharing for type %{public}@", buf, 0xCu);

        }
        objc_msgSend(v26, "allPeople");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)objc_msgSend(v79, "copy");

        v114[0] = MEMORY[0x24BDAC760];
        v114[1] = 3221225472;
        v114[2] = __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke;
        v114[3] = &unk_24F081BD8;
        v114[4] = v26;
        v115 = v98;
        objc_copyWeak(v119, &location);
        v116 = v7;
        v81 = v80;
        v117 = v81;
        v119[1] = v27;
        v118 = v6;
        objc_msgSend(v26, "stopAllSharingOnQueue:completion:", queue, v114);

        objc_destroyWeak(v119);
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
    }
    while (v24);
  }

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v84 = v96;
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
  if (v85)
  {
    v86 = *(_QWORD *)v111;
    do
    {
      for (k = 0; k != v85; ++k)
      {
        if (*(_QWORD *)v111 != v86)
          objc_enumerationMutation(v84);
        v88 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
        dispatch_group_enter(v6);
        v105[0] = MEMORY[0x24BDAC760];
        v105[1] = 3221225472;
        v105[2] = __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_41;
        v105[3] = &unk_24F081C00;
        v105[4] = v88;
        v106 = v98;
        objc_copyWeak(&v109, &location);
        v107 = v7;
        v108 = v6;
        objc_msgSend(v88, "stopAllSharingOnQueue:completion:", queue, v105);

        objc_destroyWeak(&v109);
      }
      v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
    }
    while (v85);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_42;
  block[3] = &unk_24F081C28;
  v103 = v92;
  v104 = spid;
  v101 = v7;
  v102 = v98;
  v89 = v98;
  v90 = v7;
  v91 = v92;
  dispatch_group_notify(v6, queue, block);

  objc_destroyWeak(&location);
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  DSPublicSharingType *v14;
  void *v15;
  DSPublicSharingType *v16;
  id *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  const char *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  int v47;
  NSObject *v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int v55;
  NSObject *v56;
  void *v57;
  void *v58;
  int v59;
  NSObject *v60;
  void *v61;
  void *v62;
  int v63;
  NSObject *v64;
  NSObject *v65;
  os_signpost_id_t v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 138543362;
    v69 = v8;
    _os_log_impl(&dword_227D24000, v6, OS_LOG_TYPE_INFO, "Finished stop all sharing for type %{public}@", (uint8_t *)&v68, 0xCu);

  }
  if (v3)
  {
    v9 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR))
      __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_2(a1, v9);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    objc_msgSend(WeakRetained, "removeSharingType:people:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v14 = [DSPublicSharingType alloc];
    objc_msgSend(*(id *)(a1 + 32), "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DSPublicSharingType initWithSource:](v14, "initWithSource:", v15);

    objc_msgSend(WeakRetained, "removePublicSharingType:", v16);
  }
  v17 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "source");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Calendars"));

  if (v20)
  {
    v21 = (id)DSLogSharingPermissions;
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Calendars";
LABEL_48:
    _os_signpost_emit_with_name_impl(&dword_227D24000, v22, OS_SIGNPOST_INTERVAL_END, v23, v24, " enableTelemetry=YES ", (uint8_t *)&v68, 2u);
LABEL_49:

    goto LABEL_50;
  }
  objc_msgSend(*v17, "source");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.FindMy"));

  if (v27)
  {
    v28 = (id)DSLogSharingPermissions;
    v22 = v28;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.FindMy";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Photos"));

  if (v31)
  {
    v32 = (id)DSLogSharingPermissions;
    v22 = v32;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v32))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Photos";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HomeKit.HomeSharing"));

  if (v35)
  {
    v36 = (id)DSLogSharingPermissions;
    v22 = v36;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v36))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Home";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.HealthKit.HealthSharing"));

  if (v39)
  {
    v40 = (id)DSLogSharingPermissions;
    v22 = v40;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v40))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Health";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "name");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Notes"));

  if (v43)
  {
    v44 = (id)DSLogSharingPermissions;
    v22 = v44;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Notes";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "name");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Zelkova"));

  if (v47)
  {
    v48 = (id)DSLogSharingPermissions;
    v22 = v48;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v48))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Zelkova";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "name");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Fitness"));

  if (v51)
  {
    v52 = (id)DSLogSharingPermissions;
    v22 = v52;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Activity";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "name");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.PassKeys"));

  if (v55)
  {
    v56 = (id)DSLogSharingPermissions;
    v22 = v56;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v56))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.Passkeys";
    goto LABEL_48;
  }
  objc_msgSend(*v17, "source");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.ItemSharing"));

  if (v59)
  {
    v60 = (id)DSLogSharingPermissions;
    v22 = v60;
    v23 = *(_QWORD *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v60))
      goto LABEL_49;
    LOWORD(v68) = 0;
    v24 = "stopAll.ItemSharing";
    goto LABEL_48;
  }
  objc_msgSend(*(id *)(a1 + 32), "source");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "name");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("com.apple.DigitalSeparation.Maps"));

  v64 = (id)DSLogSharingPermissions;
  v65 = v64;
  v66 = *(_QWORD *)(a1 + 80);
  if (v63)
  {
    if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      LOWORD(v68) = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v65, OS_SIGNPOST_INTERVAL_END, v66, "stopAll.Maps", " enableTelemetry=YES ", (uint8_t *)&v68, 2u);
    }

  }
  else
  {
    if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      LOWORD(v68) = 0;
      _os_signpost_emit_with_name_impl(&dword_227D24000, v65, OS_SIGNPOST_INTERVAL_END, v66, "stopAll.Notes", " enableTelemetry=YES ", (uint8_t *)&v68, 2u);
    }

    v67 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
      __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_1(a1 + 32, v67);
  }
LABEL_50:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_227D24000, v6, OS_LOG_TYPE_INFO, "Finished stop all public sharing for type %{public}@", (uint8_t *)&v14, 0xCu);

  }
  if (v3)
  {
    v9 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR))
      __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_41_cold_1(a1, v9);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    objc_msgSend(WeakRetained, "removePublicSharingType:", *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  v2 = (id)DSLogSharingPermissions;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_227D24000, v3, OS_SIGNPOST_INTERVAL_END, v4, "stopAll", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (NSMutableOrderedSet)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
  objc_storeStrong((id *)&self->_people, a3);
}

- (NSOrderedSet)filteredPeople
{
  return self->_filteredPeople;
}

- (void)setFilteredPeople:(id)a3
{
  objc_storeStrong((id *)&self->_filteredPeople, a3);
}

- (NSMutableOrderedSet)readOnlySharingPeople
{
  return self->_readOnlySharingPeople;
}

- (void)setReadOnlySharingPeople:(id)a3
{
  objc_storeStrong((id *)&self->_readOnlySharingPeople, a3);
}

- (NSOrderedSet)filteredReadOnlySharingPeople
{
  return self->_filteredReadOnlySharingPeople;
}

- (void)setFilteredReadOnlySharingPeople:(id)a3
{
  objc_storeStrong((id *)&self->_filteredReadOnlySharingPeople, a3);
}

- (NSMutableOrderedSet)sharingTypes
{
  return self->_sharingTypes;
}

- (void)setSharingTypes:(id)a3
{
  objc_storeStrong((id *)&self->_sharingTypes, a3);
}

- (NSOrderedSet)filteredSharingTypes
{
  return self->_filteredSharingTypes;
}

- (void)setFilteredSharingTypes:(id)a3
{
  objc_storeStrong((id *)&self->_filteredSharingTypes, a3);
}

- (NSMutableOrderedSet)readOnlySharingTypes
{
  return self->_readOnlySharingTypes;
}

- (void)setReadOnlySharingTypes:(id)a3
{
  objc_storeStrong((id *)&self->_readOnlySharingTypes, a3);
}

- (NSOrderedSet)filteredReadOnlySharingTypes
{
  return self->_filteredReadOnlySharingTypes;
}

- (void)setFilteredReadOnlySharingTypes:(id)a3
{
  objc_storeStrong((id *)&self->_filteredReadOnlySharingTypes, a3);
}

- (NSMutableOrderedSet)publicSharingTypes
{
  return self->_publicSharingTypes;
}

- (void)setPublicSharingTypes:(id)a3
{
  objc_storeStrong((id *)&self->_publicSharingTypes, a3);
}

- (NSMutableDictionary)fetchStartTimesBySource
{
  return self->_fetchStartTimesBySource;
}

- (void)setFetchStartTimesBySource:(id)a3
{
  objc_storeStrong((id *)&self->_fetchStartTimesBySource, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)dataUsageQueue
{
  return self->_dataUsageQueue;
}

- (void)setDataUsageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataUsageQueue, a3);
}

- (DSSourceRepository)repo
{
  return self->_repo;
}

- (void)setRepo:(id)a3
{
  objc_storeStrong((id *)&self->_repo, a3);
}

- (DSMe)me
{
  return (DSMe *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_repo, 0);
  objc_storeStrong((id *)&self->_dataUsageQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fetchStartTimesBySource, 0);
  objc_storeStrong((id *)&self->_publicSharingTypes, 0);
  objc_storeStrong((id *)&self->_filteredReadOnlySharingTypes, 0);
  objc_storeStrong((id *)&self->_readOnlySharingTypes, 0);
  objc_storeStrong((id *)&self->_filteredSharingTypes, 0);
  objc_storeStrong((id *)&self->_sharingTypes, 0);
  objc_storeStrong((id *)&self->_filteredReadOnlySharingPeople, 0);
  objc_storeStrong((id *)&self->_readOnlySharingPeople, 0);
  objc_storeStrong((id *)&self->_filteredPeople, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

void __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_227D24000, log, OS_LOG_TYPE_ERROR, "Failed to get data usage policies for %{public}@ because %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_227D24000, v3, v5, "Signpost for unsupported source name %{public}@", v6);

  OUTLINED_FUNCTION_9();
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1, a2);
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_227D24000, v3, v5, "Signpost for unsupported source name %{public}@", v6);

  OUTLINED_FUNCTION_9();
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_227D24000, v0, v1, "DSMe should always be initialized before being used", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_3(void **a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227D24000, v5, v6, "Failed to fetch shared resources from %{public}@ because %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)person:withFilter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_227D24000, v0, v1, "Failed to find a person for index path %{public}ld", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)readOnlySharingPerson:withFilter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_227D24000, v0, v1, "Failed to find a read only sharing type for index path %{public}ld", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)peopleCountWithFilter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_227D24000, v0, v1, "Too many people to count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)readOnlySharingPeopleCountWithFilter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_227D24000, v0, v1, "Too many rows to count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_11(a1, a2);
  objc_msgSend(v2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_227D24000, v3, v6, "Signpost for unsupported source name %{public}@", v7);

  OUTLINED_FUNCTION_1();
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_10(a1, a2);
  objc_msgSend(v2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227D24000, v6, v7, "Failed to stop all sharing for sharing type %{public}@ because %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1();
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_41_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_10(a1, a2);
  objc_msgSend(v2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227D24000, v6, v7, "Failed to stop all public sharing for type %{public}@ because %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1();
}

@end
