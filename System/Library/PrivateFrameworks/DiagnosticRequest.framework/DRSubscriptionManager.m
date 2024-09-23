@implementation DRSubscriptionManager

- (id)_configFromEvent:(id)a3 teamIdOut:(id *)a4
{
  id v5;
  const char *string;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const void *data;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  id v20;
  size_t length;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *a4 = 0;
  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81298]);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = xpc_dictionary_get_string(v5, "teamID");
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqualToString:](v7, "isEqualToString:", v9) & 1) != 0)
      {
        length = 0;
        data = xpc_dictionary_get_data(v5, "configData", &length);
        if (data)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v20 = 0;
            objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v20);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v20;
            if (v12)
            {
              *a4 = objc_retainAutorelease(v9);
              v14 = v12;
            }
            else
            {
              DPLogHandle_ConfigMonitorError();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v18 = CFSTR("Unknown");
                if (v13)
                  v18 = (const __CFString *)v13;
                *(_DWORD *)buf = 138543618;
                v23 = v9;
                v24 = 2114;
                v25 = (void *)v18;
                _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Malformed Config data for teamID %{public}@ with error %{public}@", buf, 0x16u);
              }

            }
          }
          else
          {
            DPLogHandle_ConfigMonitorError();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v13))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v9;
              _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Event for teamID %{public}@ does not have valid config data", buf, 0xCu);
            }
            v12 = 0;
          }

        }
        else
        {
          DPLogHandle_ConfigMonitor();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v16))
          {
            *(_DWORD *)buf = 138543362;
            v23 = v9;
            _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoActiveConfig", "No active config for teamID %{public}@", buf, 0xCu);
          }

          v12 = 0;
          *a4 = objc_retainAutorelease(v9);
        }
        goto LABEL_30;
      }
      DPLogHandle_ConfigMonitorError();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v7;
        v24 = 2114;
        v25 = v9;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Event name %{public}@ doesn't match teamID %{public}@", buf, 0x16u);
      }

    }
    else
    {
      DPLogHandle_ConfigMonitorError();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Got an object with no teamID value", buf, 2u);
      }
    }
    v12 = 0;
LABEL_30:

    goto LABEL_31;
  }
  DPLogHandle_ConfigMonitorError();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Got an object with no name", buf, 2u);
  }
  v12 = 0;
LABEL_31:

  return v12;
}

void __29__DRSubscriptionManager_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_processNewEvent:", v3);

}

- (BOOL)_hasInitializedSubscriptionForTeamID:(id)a3 cachedConfigOut:(id *)a4 errorOut:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v8 = a3;
  -[DRSubscriptionManager perTeamIdConfigState](self, "perTeamIdConfigState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_retainAutorelease(v10);
      v12 = 0;
      *a5 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      *a5 = 0;
      if (v10 == v13)
        v12 = 0;
      else
        v12 = objc_retainAutorelease(v10);
    }
  }
  else
  {
    v12 = 0;
    *a5 = 0;
  }
  *a4 = v12;

  return v10 != 0;
}

- (DRSubscriptionManager)init
{
  DRSubscriptionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  uint64_t v5;
  NSMutableDictionary *perTeamIdMonitors;
  uint64_t v7;
  NSMutableDictionary *perTeamIdConfigState;
  uint64_t v9;
  NSMutableSet *inFlightSubscriptionRequests;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DRSubscriptionManager;
  v2 = -[DRSubscriptionManager init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("DRSubscriptionManager access queue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    perTeamIdMonitors = v2->_perTeamIdMonitors;
    v2->_perTeamIdMonitors = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    perTeamIdConfigState = v2->_perTeamIdConfigState;
    v2->_perTeamIdConfigState = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    inFlightSubscriptionRequests = v2->_inFlightSubscriptionRequests;
    v2->_inFlightSubscriptionRequests = (NSMutableSet *)v9;

    objc_initWeak(&location, v2);
    -[DRSubscriptionManager accessQueue](v2, "accessQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __29__DRSubscriptionManager_init__block_invoke;
    v13[3] = &unk_1E9553800;
    objc_copyWeak(&v14, &location);
    xpc_set_event_stream_handler("com.apple.diagnosticpipeline.taskingevents", v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_completeSubscriptionRequestForTeamID:(id)a3 config:(id)a4 event:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[DRSubscriptionManager inFlightSubscriptionRequests](self, "inFlightSubscriptionRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v7);

  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  -[DRSubscriptionManager perTeamIdConfigState](self, "perTeamIdConfigState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v7);

  -[DRSubscriptionManager perTeamIdMonitors](self, "perTeamIdMonitors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19++), "_handleCurrentConfig:error:forceBroadcast:", v8, 0, 1, (_QWORD)v21);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v17);
  }

  DPLogHandle_ConfigMonitor();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EstablishedNewSubscription", "Successfully established subscription for %{public}@", buf, 0xCu);
  }

}

- (void)_requestSubscriptionToTeamIDStream:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  xpc_object_t v9;
  NSObject *v10;
  char v11;
  __CFString *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DPLogHandle_ConfigMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StreamSubscribeRequest", "Subscribing to teamID %{public}@ event stream", buf, 0xCu);
  }

  -[DRSubscriptionManager inFlightSubscriptionRequests](self, "inFlightSubscriptionRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  v7 = objc_retainAutorelease(v4);
  objc_msgSend(v7, "UTF8String");
  v8 = xpc_copy_event();
  if (v8)
  {
    v9 = (xpc_object_t)v8;
    DPLogHandle_ConfigMonitorError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PreExistingSubscription", "Already subscribed for teamID %{public}@. Requesting a refresh of state", buf, 0xCu);
    }

    v20 = 0;
    v11 = _DPCRequestTeamIDBroadcast(v7, &v20);
    v12 = (__CFString *)v20;
    if ((v11 & 1) == 0)
    {
      DPLogHandle_ConfigMonitorError();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        v14 = CFSTR("Unknown");
        if (v12)
          v14 = v12;
        *(_DWORD *)buf = 138543618;
        v24 = v7;
        v25 = 2114;
        v26 = v14;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestError", "Request to re-broadcast teamID %{public}@ failed due to error: %{public}@", buf, 0x16u);
      }

      if (!v12)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB2D50];
        v22 = CFSTR("Unknown error");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("DRConfigMonitorError"), 0, v16);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[DRSubscriptionManager perTeamIdConfigState](self, "perTeamIdConfigState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v7);

      }
      -[DRSubscriptionManager _broadcastErrorForTeamID:error:](self, "_broadcastErrorForTeamID:error:", v7, v12);
    }

  }
  else
  {
    DPLogHandle_ConfigMonitor();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewStreamSubscribe", "Subscribing to teamID %{public}@ event stream (no previously existing subscription)", buf, 0xCu);
    }

    v9 = xpc_dictionary_create(0, 0, 0);
    v19 = objc_retainAutorelease(v7);
    xpc_dictionary_set_string(v9, "teamID", (const char *)objc_msgSend(v19, "UTF8String"));
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    xpc_set_event();
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_manager;
}

void __39__DRSubscriptionManager_sharedInstance__block_invoke()
{
  DRSubscriptionManager *v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v0 = objc_alloc_init(DRSubscriptionManager);
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;

  DPLogHandle_ConfigMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriptionManagerSingletonInit", (const char *)&unk_1D3AC206D, v3, 2u);
  }

}

- (void)_processNewEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  id v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0;
  -[DRSubscriptionManager _configFromEvent:teamIdOut:](self, "_configFromEvent:teamIdOut:", v4, &v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v29;
  if (v6)
  {
    v27 = 0;
    v28 = 0;
    v7 = -[DRSubscriptionManager _hasInitializedSubscriptionForTeamID:cachedConfigOut:errorOut:](self, "_hasInitializedSubscriptionForTeamID:cachedConfigOut:errorOut:", v6, &v28, &v27);
    v8 = v28;
    v9 = v27;
    if (v7)
    {
      if (v5)
      {
        v10 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v10;
      -[DRSubscriptionManager perTeamIdConfigState](self, "perTeamIdConfigState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v6);

      -[DRSubscriptionManager perTeamIdMonitors](self, "perTeamIdMonitors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "_handleCurrentConfig:error:forceBroadcast:", v5, 0, 0, (_QWORD)v23);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        }
        while (v19);
      }

      DPLogHandle_ConfigMonitor();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v6;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessingEvent", "Successfully processed an event for already established subscription for %{public}@", buf, 0xCu);
      }

    }
    else
    {
      -[DRSubscriptionManager _completeSubscriptionRequestForTeamID:config:event:](self, "_completeSubscriptionRequestForTeamID:config:event:", v6, v5, v4);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1D82513A0](v4);
    DPLogHandle_ConfigMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 136446210;
      v32 = v11;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessingEventFailed", "Failed to process event %{public}s", buf, 0xCu);
    }

    if (v11)
      free(v11);
  }

}

- (void)_broadcastErrorForTeamID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[DRSubscriptionManager perTeamIdMonitors](self, "perTeamIdMonitors", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "_handleCurrentConfig:error:forceBroadcast:", 0, v7, 1);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)addMonitor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DRSubscriptionManager accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__DRSubscriptionManager_addMonitor___block_invoke;
  block[3] = &unk_1E9553828;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __36__DRSubscriptionManager_addMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "perTeamIdMonitors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "teamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "perTeamIdMonitors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "teamID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  if (!objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "teamID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = 0;
    v12 = objc_msgSend(v10, "_hasInitializedSubscriptionForTeamID:cachedConfigOut:errorOut:", v11, &v19, &v18);
    v9 = v19;
    v7 = v18;

    if ((v12 & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "inFlightSubscriptionRequests"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(*(id *)(a1 + 40), "teamID"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v13, "containsObject:", v14),
          v14,
          v13,
          (v15 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleCurrentConfig:error:forceBroadcast:", v9, v7, 1);
    }
    else
    {
      v16 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "teamID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_requestSubscriptionToTeamIDStream:", v17);

    }
    goto LABEL_10;
  }
  DPLogHandle_ConfigMonitorError();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "teamID");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349314;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RedundantMonitorAdd", "%{public}p with teamID %{public}@ already added to subscription manager", buf, 0x16u);
LABEL_10:

  }
}

- (void)_unsubscribeFromStreamWithTeamID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DPLogHandle_ConfigMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v10 = 138543362;
    v11 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StreamUnsubscribe", "Unsubscribing from teamID %{public}@ event stream", (uint8_t *)&v10, 0xCu);
  }

  -[DRSubscriptionManager inFlightSubscriptionRequests](self, "inFlightSubscriptionRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[DRSubscriptionManager perTeamIdMonitors](self, "perTeamIdMonitors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);

  -[DRSubscriptionManager perTeamIdConfigState](self, "perTeamIdConfigState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

  v9 = objc_retainAutorelease(v4);
  objc_msgSend(v9, "UTF8String");
  xpc_set_event();

}

- (void)removeMonitor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DRSubscriptionManager accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__DRSubscriptionManager_removeMonitor___block_invoke;
  block[3] = &unk_1E9553828;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __39__DRSubscriptionManager_removeMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "perTeamIdMonitors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "teamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    DPLogHandle_ConfigMonitor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v11, "teamID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134349314;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemoveMonitorFailure_UnknownTeam", "WARNING: Failed to remove %{public}p with teamID %{public}@ (unknown teamID)", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));
    DPLogHandle_ConfigMonitor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v5))
      goto LABEL_10;
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v6, "teamID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134349314;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    v8 = "RemovedMonitor";
    v9 = "Remove %{public}p with teamID %{public}@";
  }
  else
  {
    DPLogHandle_ConfigMonitor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v5))
      goto LABEL_10;
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v13, "teamID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134349314;
    v18 = v13;
    v19 = 2114;
    v20 = v7;
    v8 = "RemoveMonitorFailure_UnknownMonitor";
    v9 = "WARNING: %{public}p with teamID %{public}@ not tracked";
  }
  _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, (uint8_t *)&v17, 0x16u);

LABEL_10:
  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "teamID");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_unsubscribeFromStreamWithTeamID:", v10);
LABEL_12:

  }
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableDictionary)perTeamIdMonitors
{
  return self->_perTeamIdMonitors;
}

- (NSMutableDictionary)perTeamIdConfigState
{
  return self->_perTeamIdConfigState;
}

- (NSMutableSet)inFlightSubscriptionRequests
{
  return self->_inFlightSubscriptionRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightSubscriptionRequests, 0);
  objc_storeStrong((id *)&self->_perTeamIdConfigState, 0);
  objc_storeStrong((id *)&self->_perTeamIdMonitors, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
