@implementation DRSTaskingEventPublisher

- (id)_activeConfigForTeamID:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(state == %u) AND (teamID == %@)"), 2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSTaskingEventPublisher configStore](self, "configStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configMetadatasForPredicate:sortDescriptors:fetchLimit:errorOut:", v7, 0, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a4)
  {
    DPLogHandle_ServiceEventPublisherError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = *a4;
      *(_DWORD *)buf = 138543618;
      v30 = (uint64_t)v6;
      v31 = 2114;
      v32 = v11;
      v12 = "ConfigMetadataForStateTeamFailed";
      v13 = "Could not fetch active configs metadatas for teamID %{public}@ due to error %{public}@";
LABEL_4:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, buf, 0x16u);
    }
  }
  else
  {
    if (!v9 || !objc_msgSend(v9, "count"))
    {
      v14 = 0;
      goto LABEL_13;
    }
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject config](v10, "config");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      if (v19)
      {
        v20 = v19;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB2D50];
        v26 = CFSTR("Metadata with nil config");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DRSTaskingEventPublisherError"), 0, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        DPLogHandle_ServiceEventPublisherError();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v23))
        {
          -[NSObject configUUID](v10, "configUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = (uint64_t)v6;
          v31 = 2114;
          v32 = v24;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ActiveMetadataMissingConfig", "Metadata for teamID %{public}@ (%{public}@) missing config", buf, 0x16u);

        }
      }

      goto LABEL_6;
    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("More than 1 active config");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("DRSTaskingEventPublisherError"), 0, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    DPLogHandle_ServiceEventPublisherError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v17 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218242;
      v30 = v17;
      v31 = 2114;
      v32 = v6;
      v12 = "MultipleActiveConfigs";
      v13 = "Found %lu active configs for teamID %{public}@";
      goto LABEL_4;
    }
  }
  v14 = 0;
LABEL_6:

LABEL_13:
  return v14;
}

- (void)_publishNotification:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v6, "teamID");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v8, "teamID", (const char *)objc_msgSend(v9, "UTF8String"));

  if (!v7)
    goto LABEL_4;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v25;
  if (v10)
  {
    v12 = objc_retainAutorelease(v10);
    xpc_dictionary_set_data(v8, "configData", (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));

LABEL_4:
    DPLogHandle_ServiceEventPublisher();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v14 = objc_msgSend(v6, "token");
      objc_msgSend(v6, "teamID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configUUID");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("(None)");
      *(_DWORD *)buf = 134349570;
      v27 = v14;
      if (v16)
        v18 = (const __CFString *)v16;
      v28 = 2114;
      v29 = v15;
      v30 = 2114;
      v31 = v18;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigNotification", "Notifying subscription %{public}#llx with team ID %{public}@ of current config %{public}@", buf, 0x20u);

    }
    -[DRSTaskingEventPublisher publisher](self, "publisher");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "token");
    xpc_event_publisher_fire();
    goto LABEL_14;
  }
  DPLogHandle_ServiceEventPublisherError();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v19))
  {
    objc_msgSend(v7, "configUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "teamID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedDescription");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = CFSTR("Unknown");
    *(_DWORD *)buf = 138543874;
    v27 = (uint64_t)v20;
    if (v22)
      v24 = (const __CFString *)v22;
    v28 = 2114;
    v29 = v21;
    v30 = 2114;
    v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigSerializationFailed", "Could not serialize config %{public}@ with teamID %{public}@ due to error %{public}@", buf, 0x20u);

  }
LABEL_14:

}

- (void)publishConfigUpdateForTeamID:(id)a3 state:(unsigned __int8)a4 config:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a3;
  v9 = a5;
  -[DRSTaskingEventPublisher workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__DRSTaskingEventPublisher_publishConfigUpdateForTeamID_state_config___block_invoke;
  block[3] = &unk_1EA3D1BE8;
  v16 = a4;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

void __70__DRSTaskingEventPublisher_publishConfigUpdateForTeamID_state_config___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  DPLogHandle_ServiceEventPublisher();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    DRConfigStringForState();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublishConfigUpdate", "Publishing new config state: %{public}@", buf, 0xCu);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subscribers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "teamID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v11)
          objc_msgSend(*(id *)(a1 + 32), "_publishNotification:config:", v9, *(_QWORD *)(a1 + 48));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)publishCurrentConfigForTeamID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  DRSTaskingEventPublisher *v9;

  v4 = a3;
  -[DRSTaskingEventPublisher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__DRSTaskingEventPublisher_publishCurrentConfigForTeamID___block_invoke;
  block[3] = &unk_1EA3D1680;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __58__DRSTaskingEventPublisher_publishCurrentConfigForTeamID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  DPLogHandle_ServiceEventPublisher();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v34 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublishCurrentConfig", "Publishing current config for teamID: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "subscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "teamID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v12)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v27 = 0;
    objc_msgSend(v13, "_activeConfigForTeamID:errorOut:", v14, &v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v27;
    if (v16)
    {
      DPLogHandle_ServiceEventPublisher();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v34 = v18;
        v35 = 2114;
        v36 = v16;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublishCurrentConfigError", "Error getting config for teamID: %{public}@: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = v4;
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(a1 + 40), "_publishNotification:config:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v15, (_QWORD)v23);
          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        }
        while (v20);
      }
    }

  }
}

+ (BOOL)_isFirst
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__DRSTaskingEventPublisher__isFirst__block_invoke;
  block[3] = &unk_1EA3D0F00;
  block[4] = &v5;
  if (_isFirst_onceToken != -1)
    dispatch_once(&_isFirst_onceToken, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __36__DRSTaskingEventPublisher__isFirst__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (DRSTaskingEventPublisher)initWithConfigStore:(id)a3
{
  id v5;
  DRSTaskingEventPublisher *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  uint64_t v9;
  NSMutableSet *subscribers;
  dispatch_semaphore_t v11;
  void *v12;
  uint64_t v13;
  OS_xpc_event_publisher *publisher;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  DRSTaskingEventPublisher *v21;
  NSObject *v22;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id location;
  objc_super v28;
  __int128 buf;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_isFirst") & 1) != 0)
  {
    v28.receiver = self;
    v28.super_class = (Class)DRSTaskingEventPublisher;
    v6 = -[DRSTaskingEventPublisher init](&v28, sel_init);
    if (v6)
    {
      v7 = dispatch_queue_create("DRSTaskingEventPublisher work queue", 0);
      workQueue = v6->_workQueue;
      v6->_workQueue = (OS_dispatch_queue *)v7;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = objc_claimAutoreleasedReturnValue();
      subscribers = v6->_subscribers;
      v6->_subscribers = (NSMutableSet *)v9;

      objc_storeStrong((id *)&v6->_configStore, a3);
      v11 = dispatch_semaphore_create(0);
      -[DRSTaskingEventPublisher workQueue](v6, "workQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_event_publisher_create();
      v13 = objc_claimAutoreleasedReturnValue();
      publisher = v6->_publisher;
      v6->_publisher = (OS_xpc_event_publisher *)v13;

      objc_initWeak(&location, v6);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v30 = 0x2020000000;
      v31 = 1;
      -[DRSTaskingEventPublisher publisher](v6, "publisher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v25 = v11;
      objc_copyWeak(&v26, &location);
      xpc_event_publisher_set_handler();

      -[DRSTaskingEventPublisher publisher](v6, "publisher", v24, 3221225472, __48__DRSTaskingEventPublisher_initWithConfigStore___block_invoke, &unk_1EA3D1C10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_event_publisher_set_error_handler();

      -[DRSTaskingEventPublisher publisher](v6, "publisher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_event_publisher_activate();

      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
      objc_destroyWeak(&v26);

      _Block_object_dispose(&buf, 8);
      objc_destroyWeak(&location);

    }
    DPLogHandle_ServiceEventPublisher();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      -[DRSTaskingEventPublisher subscribers](v6, "subscribers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublisherInitialized", "Publisher initialization completed (%lu subscribers)", (uint8_t *)&buf, 0xCu);

    }
    self = v6;
    v21 = self;
  }
  else
  {
    DPLogHandle_ServiceEventPublisher();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ThereCanBeOnlyOnePublisher", "Only one publisher can be instantiated in a given process lifetime", (uint8_t *)&buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

void __48__DRSTaskingEventPublisher_initWithConfigStore___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id WeakRetained;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a2)
  {
    if (a2 == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "_removeSubscriber:", a3);

    }
    else if (a2 == 2)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1DF0B72BC](v7);
    DPLogHandle_ServiceEventPublisher();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v13 = 136446210;
      v14 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewSubscriptionDescriptor", "Descriptor: %{public}s", (uint8_t *)&v13, 0xCu);
    }

    if (v9)
      free(v9);
    v11 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v11, "_addSubscriber:descriptor:isOldSubscriber:", a3, v8, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

  }
}

void __48__DRSTaskingEventPublisher_initWithConfigStore___block_invoke_39()
{
  NSObject *v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  DPLogHandle_ServiceEventPublisherError();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    v3 = 136446210;
    v4 = xpc_strerror();
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublisherError", "Publisher error: %{public}s. Crashing.", (uint8_t *)&v3, 0xCu);
  }

  DPLogHandle_ServiceEventPublisherError();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    v2 = xpc_strerror();
    v3 = 136446210;
    v4 = v2;
    _os_log_fault_impl(&dword_1DBB92000, v1, OS_LOG_TYPE_FAULT, "FATAL ERROR: Tasking event publisher encountered unrecoverable error:%{public}s", (uint8_t *)&v3, 0xCu);
  }

  exit(1);
}

- (void)_addSubscriber:(unint64_t)a3 descriptor:(id)a4 isOldSubscriber:(BOOL)a5
{
  _BOOL4 v5;
  const char *string;
  const char *v9;
  DRSTaskingEventSubscriber *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  string = xpc_dictionary_get_string(a4, "teamID");
  if (string)
  {
    v9 = string;
    v10 = [DRSTaskingEventSubscriber alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DRSTaskingEventSubscriber initWithTeamID:token:](v10, "initWithTeamID:token:", v11, a3);

    -[DRSTaskingEventPublisher subscribers](self, "subscribers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v13, "containsObject:", v12);

    if ((_DWORD)v10)
    {
      DPLogHandle_ServiceEventPublisherError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        -[NSObject teamID](v12, "teamID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2048;
        v27 = -[NSObject token](v12, "token");
        v16 = "DuplicateSubscribers";
        v17 = "Tried to add duplicate subscribers: TeamID: %{public}@ token: %#llx";
LABEL_10:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x16u);

      }
    }
    else
    {
      -[DRSTaskingEventPublisher subscribers](self, "subscribers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v12);

      DPLogHandle_ServiceEventPublisher();
      v14 = objc_claimAutoreleasedReturnValue();
      v19 = os_signpost_enabled(v14);
      if (!v5)
      {
        if (v19)
        {
          -[NSObject teamID](v12, "teamID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v20;
          v26 = 2048;
          v27 = -[NSObject token](v12, "token");
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedNewSubscriber", "Added subscriber: TeamID: %{public}@ token: %#llx", buf, 0x16u);

        }
        -[NSObject teamID](v12, "teamID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        -[DRSTaskingEventPublisher _activeConfigForTeamID:errorOut:](self, "_activeConfigForTeamID:errorOut:", v21, &v23);
        v14 = objc_claimAutoreleasedReturnValue();
        v22 = v23;

        if (!v22)
          -[DRSTaskingEventPublisher _publishNotification:config:](self, "_publishNotification:config:", v12, v14);
        goto LABEL_15;
      }
      if (v19)
      {
        -[NSObject teamID](v12, "teamID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2048;
        v27 = -[NSObject token](v12, "token");
        v16 = "InitializedOldSubscriber";
        v17 = "Added pre-existing subscriber: TeamID: %{public}@ token: %#llx. No need to broadcast config";
        goto LABEL_10;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  DPLogHandle_ServiceEventPublisherError();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidTaskingEventDescriptor", "Missing 'teamID' key", buf, 2u);
  }
LABEL_16:

}

- (void)_removeSubscriber:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  unint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DRSTaskingEventPublisher subscribers](self, "subscribers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "token") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_12;
    -[DRSTaskingEventPublisher subscribers](self, "subscribers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v11);

  }
  else
  {
LABEL_9:

LABEL_12:
    DPLogHandle_ServiceEventPublisherError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 134349056;
      v18 = a3;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriberRemovalFailure", "Failed to find a subscriber for token: %{public}#llx", buf, 0xCu);
    }
  }

}

- (NSMutableSet)subscribers
{
  return self->_subscribers;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (DRSConfigPersistedStore)configStore
{
  return self->_configStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configStore, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
}

@end
