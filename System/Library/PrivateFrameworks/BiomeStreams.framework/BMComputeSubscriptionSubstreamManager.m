@implementation BMComputeSubscriptionSubstreamManager

- (BMComputeSubscriptionSubstreamManager)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  BMComputeSubscriptionSubstreamManager *v6;

  v4 = a3;
  BiomeLibraryAndInternalLibraryNode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BMComputeSubscriptionSubstreamManager _initWithDomain:queue:library:](self, "_initWithDomain:queue:library:", 0, v4, v5);

  return v6;
}

- (id)_initWithDomain:(unint64_t)a3 queue:(id)a4 library:(id)a5
{
  NSObject *v8;
  id v9;
  BMComputeSubscriptionSubstreamManager *v10;
  BMComputeSubscriptionSubstreamManager *v11;
  uint64_t v12;
  NSMutableDictionary *checkins;
  uint64_t v14;
  NSDictionary *subscriptions;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2(v8);
  v17.receiver = self;
  v17.super_class = (Class)BMComputeSubscriptionSubstreamManager;
  v10 = -[BMComputeSubscriptionSubstreamManager init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    objc_storeStrong((id *)&v11->_library, a5);
    v12 = objc_opt_new();
    checkins = v11->_checkins;
    v11->_checkins = (NSMutableDictionary *)v12;

    -[BMComputeSubscriptionSubstreamManager _loadSubscriptionsFromSubscriptionsSubstreams](v11, "_loadSubscriptionsFromSubscriptionsSubstreams");
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptions = v11->_subscriptions;
    v11->_subscriptions = (NSDictionary *)v14;

  }
  return v11;
}

- (id)_loadSubscriptionsFromSubscriptionsSubstreams
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[BMLibraryNode allStreams](self->_library, "allStreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = *MEMORY[0x1E0D01CA0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "enableSubscriptionSubstream");

        if (v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v9, "subscriptionPublisherWithUseCase:options:", v7, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[BMPairedEventSession sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:](BMPairedEventSession, "sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:", v13, &__block_literal_global_12, &__block_literal_global_6, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_opt_new();
          objc_msgSend(v9, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, v16);

          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3;
          v22[3] = &unk_1E26488D0;
          v23 = v15;
          v17 = v15;
          v18 = (id)objc_msgSend(v14, "sinkWithBookmark:completion:receiveInput:", 0, v22, &__block_literal_global_11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

  v19 = (void *)objc_msgSend(v21, "copy");
  return v19;
}

uint64_t __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

id __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(v2, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3_cold_1((uint64_t)v6, v7);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    +[BMPairedEventSession openSessionsFromBookmark:](BMPairedEventSession, "openSessionsFromBookmark:", v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "startEvent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "eventBody");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = *(void **)(a1 + 32);
          objc_msgSend(v13, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
  }

}

- (BOOL)supportsStream:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (double)timestamp
{
  NSDate *dateOverride;
  double result;

  dateOverride = self->_dateOverride;
  if (!dateOverride)
    return CFAbsoluteTimeGetCurrent();
  -[NSDate timeIntervalSinceReferenceDate](dateOverride, "timeIntervalSinceReferenceDate");
  return result;
}

- (void)addSubscription:(id)a3
{
  id v4;
  NSMutableDictionary *checkins;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  checkins = self->_checkins;
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](checkins, "setObject:forKeyedSubscript:", v4, v6);

  LODWORD(v6) = self->_initialCheckinsComplete;
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v6)
  {
    if (v8)
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl(&dword_18D810000, v7, OS_LOG_TYPE_DEFAULT, "addSubscription: %@", buf, 0xCu);

    }
    -[BMComputeXPCSubscription startEvent](v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "streamIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (-[BMComputeSubscriptionSubstreamManager supportsStream:](self, "supportsStream:", v14))
          {
            -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "uniqueIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v17;
            -[NSObject serialize](v7, "serialize");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "serialize");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = objc_msgSend(v19, "isEqual:", v20);
            if ((v21 & 1) == 0)
            {
              -[BMComputeSubscriptionSubstreamManager _subscriptionSourceForStream:](self, "_subscriptionSourceForStream:", v14);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[BMComputeSubscriptionSubstreamManager timestamp](self, "timestamp");
              objc_msgSend(v22, "sendEvent:timestamp:", v7);
              -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:", v14);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "uniqueIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v7, v24);

            }
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

  }
  else if (v8)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v25;
    _os_log_impl(&dword_18D810000, v7, OS_LOG_TYPE_DEFAULT, "addSubscription: %@ pending barrier", buf, 0xCu);

  }
}

- (void)removeSubscription:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 initialCheckinsComplete;
  NSDictionary *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_checkins, "setObject:forKeyedSubscript:", 0, v5);
  initialCheckinsComplete = self->_initialCheckinsComplete;
  __biome_log_for_category();
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT);
  if (initialCheckinsComplete)
  {
    if (v8)
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_18D810000, &v7->super, OS_LOG_TYPE_DEFAULT, "removeSubscription: %@", buf, 0xCu);

    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = self->_subscriptions;
    v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v21 = v4;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[BMSubscriptionEvent endEvent](v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMComputeSubscriptionSubstreamManager _subscriptionSourceForStream:](self, "_subscriptionSourceForStream:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMComputeSubscriptionSubstreamManager timestamp](self, "timestamp");
            objc_msgSend(v18, "sendEvent:timestamp:", v17);
            -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, v5);

          }
        }
        v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
      v4 = v21;
    }
  }
  else if (v8)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v20;
    _os_log_impl(&dword_18D810000, &v7->super, OS_LOG_TYPE_DEFAULT, "removeSubscription: %@ before barrier", buf, 0xCu);

  }
}

- (void)initialCheckinsComplete
{
  NSDate *v4;
  NSDate *dateOverride;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *checkins;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSDate *v16;
  dispatch_time_t v17;
  NSObject *queue;
  void *v19;
  _QWORD block[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_initialCheckinsComplete
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeSubscriptionSubstreamManager.m"), 216, CFSTR("initialCheckinsComplete must only be called once")), v19, !self->_initialCheckinsComplete))
  {
    self->_initialCheckinsComplete = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateOverride = self->_dateOverride;
    self->_dateOverride = v4;

    v6 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke;
    v25[3] = &unk_1E26488F8;
    v25[4] = self;
    -[BMComputeSubscriptionSubstreamManager _removeSubscriptionsPassingTest:](self, "_removeSubscriptionsPassingTest:", v25);
    v7 = self->_checkins;
    checkins = self->_checkins;
    self->_checkins = 0;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[NSMutableDictionary allValues](v7, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          -[BMComputeSubscriptionSubstreamManager addSubscription:](self, "addSubscription:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

    v14 = self->_checkins;
    self->_checkins = v7;
    v15 = v7;

    v16 = self->_dateOverride;
    self->_dateOverride = 0;

    v17 = dispatch_time(0, 15000000000);
    queue = self->_queue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke_19;
    block[3] = &unk_1E2647C48;
    block[4] = self;
    dispatch_after(v17, queue, block);

  }
}

uint64_t __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    v10 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v3, "bootUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "bm_bootSessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_4;
  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_18D810000, v12, OS_LOG_TYPE_DEFAULT, "Removing subscription from previous boot %@", (uint8_t *)&v14, 0xCu);

  }
  v10 = 1;
LABEL_5:

  return v10;
}

uint64_t __64__BMComputeSubscriptionSubstreamManager_initialCheckinsComplete__block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkinTimeout");
}

- (void)_checkinTimeout
{
  NSMutableDictionary *checkins;
  void *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_initialCheckinsComplete
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeSubscriptionSubstreamManager.m"), 262, CFSTR("initialCheckinsComplete must be called before _checkinTimeout")), v5, self->_initialCheckinsComplete))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__BMComputeSubscriptionSubstreamManager__checkinTimeout__block_invoke;
    v6[3] = &unk_1E26488F8;
    v6[4] = self;
    -[BMComputeSubscriptionSubstreamManager _removeSubscriptionsPassingTest:](self, "_removeSubscriptionsPassingTest:", v6);
    checkins = self->_checkins;
    self->_checkins = 0;

  }
}

BOOL __56__BMComputeSubscriptionSubstreamManager__checkinTimeout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_18D810000, v7, OS_LOG_TYPE_DEFAULT, "Removing subscription that missed checkin %@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v6 == 0;
}

- (void)_removeSubscriptionsPassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, void *))a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_subscriptions;
  v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v21 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v5);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v8;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v22);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if (v4[2](v4, v14))
              {
                if (!v11)
                {
                  -[BMComputeSubscriptionSubstreamManager _subscriptionSourceForStream:](self, "_subscriptionSourceForStream:", v6);
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                }
                -[BMSubscriptionEvent endEvent](v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[BMComputeSubscriptionSubstreamManager timestamp](self, "timestamp");
                objc_msgSend(v11, "sendEvent:timestamp:", v15);
                -[NSDictionary objectForKeyedSubscript:](self->_subscriptions, "objectForKeyedSubscript:", v6);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "uniqueIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v17);

              }
            }
            v10 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v10);
        }
        else
        {
          v11 = 0;
        }

        v5 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

}

- (id)_subscriptionSourceForStream:(id)a3
{
  id v4;
  BMLibraryNode *library;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BMComputeSubscriptionSubstreamManager supportsStream:](self, "supportsStream:", v4))
  {
    library = self->_library;
    v11 = 0;
    -[BMLibraryNode streamWithIdentifier:error:](library, "streamWithIdentifier:error:", v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v7)
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[BMComputeSubscriptionSubstreamManager _subscriptionSourceForStream:].cold.1((uint64_t)v4, (uint64_t)v7, v8);

      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "subscriptionSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkins, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_dateOverride, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

void __86__BMComputeSubscriptionSubstreamManager__loadSubscriptionsFromSubscriptionsSubstreams__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "Failed to compute open subscriptions %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_subscriptionSourceForStream:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "BMComputeSubscriptionSubstreamManager: could not find stream for streamIdentifier: %@, err: %@", (uint8_t *)&v3, 0x16u);
}

@end
