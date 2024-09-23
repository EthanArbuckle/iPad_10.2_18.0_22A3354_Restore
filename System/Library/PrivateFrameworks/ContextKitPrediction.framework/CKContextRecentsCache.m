@implementation CKContextRecentsCache

- (CKContextRecentsCache)initWithCacheConfiguration:(unint64_t)a3
{
  CKContextRecentsCache *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *biomeQueue;
  BMUserActivityMetadataStream *v7;
  BMUserActivityMetadataStream *stream;
  BMUserFocusComputedModeStream *v9;
  BMUserFocusComputedModeStream *computedModeStream;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *computedFocusModeQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKContextRecentsCache;
  v4 = -[CKContextRecentsCache init](&v15, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("CKContextRecentsCache Stream Modification Queue", 0);
    biomeQueue = v4->_biomeQueue;
    v4->_biomeQueue = (OS_dispatch_queue *)v5;

    v7 = (BMUserActivityMetadataStream *)objc_alloc_init(MEMORY[0x24BE0CDE8]);
    stream = v4->_stream;
    v4->_stream = v7;

    v4->_configuration = a3;
    v9 = (BMUserFocusComputedModeStream *)objc_alloc_init(MEMORY[0x24BE0CDF0]);
    computedModeStream = v4->_computedModeStream;
    v4->_computedModeStream = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("CKContextRecentsCache Focus Mode Queue", v11);
    computedFocusModeQueue = v4->_computedFocusModeQueue;
    v4->_computedFocusModeQueue = (OS_dispatch_queue *)v12;

    -[CKContextRecentsCache _registerComputedModeStream](v4, "_registerComputedModeStream");
    -[CKContextRecentsCache _updateLatestFocusMode](v4, "_updateLatestFocusMode");
    -[CKContextRecentsCache _scheduleDeferredMaintenanceTasks](v4, "_scheduleDeferredMaintenanceTasks");
  }
  return v4;
}

- (void)insertUserActivityData:(id)a3 preferredTitle:(id)a4 bundleId:(id)a5 topics:(id)a6 hasAssociatedImageRepresentation:(BOOL)a7 uuid:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke;
  v24[3] = &unk_24DD773A8;
  objc_copyWeak(&v30, &location);
  v19 = v15;
  v25 = v19;
  v20 = v14;
  v26 = v20;
  v21 = v16;
  v27 = v21;
  v22 = v17;
  v28 = v22;
  v31 = a7;
  v23 = v18;
  v29 = v23;
  objc_msgSend(v20, "_createUserActivityDataWithOptions:completionHandler:", 0, v24);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

void __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  double Current;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  __CFString *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  _QWORD block[5];
  id v34;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (!v5 || a3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_cold_1();
    }
    else
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (objc_msgSend(*(id *)(a1 + 32), "length"))
      {
        v8 = (const __CFString *)*(id *)(a1 + 32);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "title");
        v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      objc_msgSend(*(id *)(a1 + 40), "activityType");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "webpageURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      v32 = v5;
      if (v11)
        objc_msgSend(v12, "webpageURL");
      else
        objc_msgSend(v12, "referrerURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (objc_class *)MEMORY[0x24BE0CDE0];
      v15 = (__CFString *)*((id *)WeakRetained + 5);
      v16 = [v14 alloc];
      v17 = &stru_24DD77F20;
      if (v9)
        v18 = v9;
      else
        v18 = &stru_24DD77F20;
      if (v10)
        v19 = (const __CFString *)v10;
      else
        v19 = &stru_24DD77F20;
      v31 = (__CFString *)v9;
      v20 = *(_QWORD *)(a1 + 48);
      if (-[__CFString length](v15, "length"))
        v17 = v15;
      v30 = (void *)v10;
      v21 = *(_BYTE *)(a1 + 80);
      v22 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v28) = v21;
      v27 = v22;
      v5 = v32;
      v24 = (void *)objc_msgSend(v16, "initWithAbsoluteTimestamp:userActivityData:title:activityType:associatedBundleId:associatedURLString:modeIdentifier:topics:hasAssociatedImageRepresentation:uuid:", v32, v18, v19, v20, v29, v17, Current, v27, v28, v23);

      v25 = *((_QWORD *)WeakRetained + 2);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_24;
      block[3] = &unk_24DD77380;
      block[4] = WeakRetained;
      v34 = v24;
      v26 = v24;
      dispatch_async(v25, block);

    }
  }

}

void __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_24(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "source");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:", *(_QWORD *)(a1 + 40));

}

- (void)allRecentsWithReply:(id)a3
{
  id v4;
  NSObject *biomeQueue;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    biomeQueue = self->_biomeQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__CKContextRecentsCache_allRecentsWithReply___block_invoke;
    v6[3] = &unk_24DD77420;
    objc_copyWeak(&v8, &location);
    v6[4] = self;
    v7 = v4;
    dispatch_async(biomeQueue, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_maximumNumberOfItemsToRetrieve");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_cold_1();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "publisherFromStartTime:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bufferWithSize:prefetch:whenFull:", v4, 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__0;
    v13[4] = __Block_byref_object_dispose__0;
    v14 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v7 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_28;
    v10[3] = &unk_24DD773D0;
    v12 = v13;
    v11 = *(id *)(a1 + 40);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_30;
    v9[3] = &unk_24DD773F8;
    v9[4] = v13;
    v8 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", v10, v9);

    _Block_object_dispose(v13, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_28(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "event", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_28_cold_1(v2);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_30(uint64_t a1, void *a2)
{
  CKContextUserFacingUniversalRecent *v3;
  id v4;

  objc_msgSend(a2, "eventBody");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  -[CKContextUserFacingUniversalRecent setEvent:](v3, "setEvent:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "insertObject:atIndex:", v3, 0);

}

- (unint64_t)_maximumNumberOfItemsToRetrieve
{
  if (self->_configuration == 1)
    return 10;
  else
    return 1000;
}

- (void)retrieveRecentsBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *biomeQueue;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22[2];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v8 && v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v14 = v13;
      objc_initWeak(&location, self);
      biomeQueue = self->_biomeQueue;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke;
      v18[3] = &unk_24DD77498;
      objc_copyWeak(v22, &location);
      v16 = v11;
      v22[1] = v14;
      v21 = v16;
      v19 = v12;
      v20 = v9;
      v17 = v12;
      dispatch_async(biomeQueue, v18);

      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_maximumNumberOfItemsToRetrieve");
    objc_msgSend(v3[1], "publisherFromStartTime:", *(double *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__0;
    v16[4] = __Block_byref_object_dispose__0;
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2;
    v12[3] = &unk_24DD77448;
    v15 = v16;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_35;
    v8[3] = &unk_24DD77470;
    v9 = *(id *)(a1 + 40);
    v10 = v16;
    v11 = v4;
    v7 = (id)objc_msgSend(v5, "sinkWithCompletion:shouldContinue:", v12, v8);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2_cold_1(a1);
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "event", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_35(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CKContextUserFacingUniversalRecent *v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x22074E22C]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "absoluteTimestamp");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5
    || (objc_msgSend(v7, "earlierDate:", a1[4]),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = (void *)a1[4],
        v9,
        v9 == v10))
  {
    v12 = 0;
  }
  else
  {
    v11 = objc_alloc_init(CKContextUserFacingUniversalRecent);
    -[CKContextUserFacingUniversalRecent setEvent:](v11, "setEvent:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "insertObject:atIndex:", v11, 0);
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count") >= a1[6])
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeLastObject");

    v12 = 1;
  }

  objc_autoreleasePoolPop(v4);
  return v12;
}

- (void)retrieveRecentMatchingUUID:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *biomeQueue;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_initWeak(&location, self);
      biomeQueue = self->_biomeQueue;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke;
      v10[3] = &unk_24DD77420;
      objc_copyWeak(&v13, &location);
      v12 = v8;
      v11 = v6;
      dispatch_async(biomeQueue, v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }

}

void __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "publisherFromStartTime:", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__0;
    v13[4] = __Block_byref_object_dispose__0;
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_2;
    v10[3] = &unk_24DD773D0;
    v12 = v13;
    v11 = a1[5];
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_3;
    v7[3] = &unk_24DD774C0;
    v8 = a1[4];
    v9 = v13;
    v6 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", v10, v7);

    _Block_object_dispose(v13, 8);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(a2, "eventBody");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

- (void)removeAllRecentsWithReply:(id)a3
{
  objc_class *v4;
  void (**v5)(id, uint64_t);
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BE0CD88];
  v5 = (void (**)(id, uint64_t))a3;
  v6 = [v4 alloc];
  -[BMUserActivityMetadataStream identifier](self->_stream, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "initWithRestrictedStreamIdentifier:", v7);

  objc_msgSend(v8, "pruneWithPredicateBlock:", &__block_literal_global_0);
  v5[2](v5, 1);

}

uint64_t __51__CKContextRecentsCache_removeAllRecentsWithReply___block_invoke()
{
  return 1;
}

- (void)removeRecentWithUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE0CD88]);
  -[BMUserActivityMetadataStream identifier](self->_stream, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithRestrictedStreamIdentifier:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__CKContextRecentsCache_removeRecentWithUUID___block_invoke;
  v9[3] = &unk_24DD77528;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v8, "pruneWithPredicateBlock:", v9);

}

uint64_t __46__CKContextRecentsCache_removeRecentWithUUID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a3 = 1;

  return v7;
}

- (void)removeRecentsMatchingRecent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  CKContextUserFacingUniversalRecent *v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  objc_msgSend((id)v10[5], "setEvent:", v4);
  v5 = objc_alloc(MEMORY[0x24BE0CD88]);
  -[BMUserActivityMetadataStream identifier](self->_stream, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRestrictedStreamIdentifier:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__CKContextRecentsCache_removeRecentsMatchingRecent___block_invoke;
  v8[3] = &unk_24DD77550;
  v8[4] = &v9;
  objc_msgSend(v7, "pruneWithPredicateBlock:", v8);

  _Block_object_dispose(&v9, 8);
}

uint64_t __53__CKContextRecentsCache_removeRecentsMatchingRecent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CKContextUserFacingUniversalRecent *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x22074E22C]();
  v5 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContextUserFacingUniversalRecent setEvent:](v5, "setEvent:", v6);

  v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isEqual:", v5);
  objc_autoreleasePoolPop(v4);

  return v7;
}

- (void)pruneRecentsForBundleIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE0CD88]);
  -[BMUserActivityMetadataStream identifier](self->_stream, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithRestrictedStreamIdentifier:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__CKContextRecentsCache_pruneRecentsForBundleIdentifiers___block_invoke;
  v9[3] = &unk_24DD77528;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v8, "pruneWithPredicateBlock:", v9);

}

uint64_t __58__CKContextRecentsCache_pruneRecentsForBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "associatedBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)retrieveRecentsCatalogWithStyle:(unint64_t)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__CKContextRecentsCache_retrieveRecentsCatalogWithStyle_withReply___block_invoke;
    v8[3] = &unk_24DD77578;
    v9 = v6;
    v10 = a3;
    v8[4] = self;
    -[CKContextRecentsCache allRecentsWithReply:](self, "allRecentsWithReply:", v8);

  }
}

void __67__CKContextRecentsCache_retrieveRecentsCatalogWithStyle_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
        objc_msgSend(*(id *)(a1 + 32), "_groupActivitiesByDateIntoSectionsWithRecents:limit:reply:", v3, 4, *(_QWORD *)(a1 + 40));
        break;
      case 1:
        objc_msgSend(*(id *)(a1 + 32), "_groupActivitiesByAppIntoSectionsWithRecents:limit:reply:", v3, 4, *(_QWORD *)(a1 + 40));
        break;
      case 2:
        objc_msgSend(*(id *)(a1 + 32), "_groupActivitiesByConstellationIntoSectionsWithRecents:limit:reply:", v3, 4, *(_QWORD *)(a1 + 40));
        break;
      case 3:
        objc_msgSend(*(id *)(a1 + 32), "_groupActivitiesByModeIntoSectionsWithRecents:limit:reply:", v3, 4, *(_QWORD *)(a1 + 40));
        break;
      default:
        break;
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)retrieveRecentsMatchingBundleIdentifier:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *biomeQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_initWeak(&location, self);
    biomeQueue = self->_biomeQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke;
    v9[3] = &unk_24DD77420;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    v10 = v6;
    dispatch_async(biomeQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_maximumNumberOfItemsToRetrieve");
    objc_msgSend(v3[1], "publisherFromStartTime:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__0;
    v17[4] = __Block_byref_object_dispose__0;
    v6 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v7 = MEMORY[0x24BDAC760];
    v18 = v6;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_2;
    v15[3] = &unk_24DD775A0;
    v16 = a1[4];
    objc_msgSend(v5, "filterWithIsIncluded:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bufferWithSize:prefetch:whenFull:", v4, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_3;
    v12[3] = &unk_24DD773D0;
    v14 = v17;
    v13 = a1[5];
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_4;
    v11[3] = &unk_24DD773F8;
    v11[4] = v17;
    v10 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v12, v11);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

uint64_t __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "event", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

void __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_4(uint64_t a1, void *a2)
{
  CKContextUserFacingUniversalRecent *v3;
  id v4;

  objc_msgSend(a2, "eventBody");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  -[CKContextUserFacingUniversalRecent setEvent:](v3, "setEvent:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "insertObject:atIndex:", v3, 0);

}

- (void)retrieveRecentsMatchingMode:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__CKContextRecentsCache_retrieveRecentsMatchingMode_withReply___block_invoke;
    v8[3] = &unk_24DD775C8;
    v10 = v7;
    v9 = v6;
    -[CKContextRecentsCache allRecentsWithReply:](self, "allRecentsWithReply:", v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __63__CKContextRecentsCache_retrieveRecentsMatchingMode_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "modeIdentifier", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v12)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)retrieveRecentsForPredictionWithReply:(id)a3
{
  id v4;
  NSObject *biomeQueue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    biomeQueue = self->_biomeQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke;
    block[3] = &unk_24DD77680;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(biomeQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[7];
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_maximumNumberOfItemsToRetrieve");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_cold_1();
    objc_msgSend(v3[1], "publisherFromStartTime:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__0;
    v18[4] = __Block_byref_object_dispose__0;
    v19 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__0;
    v16[4] = __Block_byref_object_dispose__0;
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v5, "filterWithIsIncluded:", &__block_literal_global_42);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bufferWithSize:prefetch:whenFull:", v4, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2;
    v11[3] = &unk_24DD77630;
    v13 = v20;
    v14 = v18;
    v15 = v16;
    v12 = *(id *)(a1 + 32);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_43;
    v10[3] = &unk_24DD77658;
    v10[4] = v20;
    v10[5] = v18;
    v10[6] = v16;
    v9 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", v11, v10);

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(v20, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_41()
{
  return 1;
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2_cold_1((uint64_t)a1);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "event");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v3, "addObject:", v11);
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

  v17 = *(_QWORD *)(a1[7] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_43(_QWORD *a1, void *a2)
{
  CKContextUserFacingUniversalRecent *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "eventBody");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  -[CKContextUserFacingUniversalRecent setEvent:](v3, "setEvent:", v7);
  if (v3)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "insertObject:atIndex:", v3, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "intValue") + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &unk_24DD78E20;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v6, v3);
    if (v5)

  }
}

- (void)retrieveRecentsMatchingStrings:(id)a3 withReply:(id)a4
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
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__CKContextRecentsCache_retrieveRecentsMatchingStrings_withReply___block_invoke;
  v10[3] = &unk_24DD776A8;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[CKContextRecentsCache allRecentsWithReply:](self, "allRecentsWithReply:", v10);

}

void __66__CKContextRecentsCache_retrieveRecentsMatchingStrings_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 32), "_recent:matchesKeywords:", v10, *(_QWORD *)(a1 + 40), (_QWORD)v11))objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)retrieveRecentsMatchingTopicIds:(id)a3 titles:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
    {
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __74__CKContextRecentsCache_retrieveRecentsMatchingTopicIds_titles_withReply___block_invoke;
      v11[3] = &unk_24DD776D0;
      objc_copyWeak(&v15, &location);
      v14 = v10;
      v12 = v8;
      v13 = v9;
      -[CKContextRecentsCache allRecentsWithReply:](self, "allRecentsWithReply:", v11);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __74__CKContextRecentsCache_retrieveRecentsMatchingTopicIds_titles_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
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

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      v24 = a1;
      v25 = WeakRetained;
      v22 = *(_QWORD *)v32;
      v23 = v6;
      do
      {
        v10 = 0;
        v26 = v8;
        do
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
          if (v11)
          {
            objc_msgSend(WeakRetained, "_associatedTopicIdsForRecent:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v10));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_associatedTopicTitlesForRecent:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "intersectsOrderedSet:", *(_QWORD *)(a1 + 32)) & 1) != 0
              || objc_msgSend(v13, "intersectsOrderedSet:", *(_QWORD *)(a1 + 40)))
            {
              objc_msgSend(v5, "addObject:", v11, v21);
            }
            else
            {
              objc_msgSend(v11, "title");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = 0u;
              v28 = 0u;
              v29 = 0u;
              v30 = 0u;
              v15 = *(id *)(a1 + 40);
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v28;
                while (2)
                {
                  v19 = v5;
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v28 != v18)
                      objc_enumerationMutation(v15);
                    if (objc_msgSend(v14, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v21))
                    {
                      v5 = v19;
                      objc_msgSend(v19, "addObject:", v11);
                      goto LABEL_22;
                    }
                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                  v5 = v19;
                  if (v17)
                    continue;
                  break;
                }
              }
LABEL_22:

              a1 = v24;
              WeakRetained = v25;
              v9 = v22;
              v6 = v23;
              v8 = v26;
            }

          }
          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = v21;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_modeDidChangeToModeWithModeUUIDString:(id)a3
{
  id v4;
  NSString *v5;
  NSString *latestActivity;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[CKContextRecentsCache _modeDidChangeToModeWithModeUUIDString:].cold.1();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  latestActivity = self->_latestActivity;
  self->_latestActivity = v5;

  -[CKContextRecentsCache delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CKContextRecentsCache delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modeDidChangeToModeWithUUIDString:forCache:", self->_latestActivity, self);

  }
}

- (id)_modeUUIDStringForComputedModeEvent:(id)a3
{
  return (id)objc_msgSend(a3, "mode");
}

- (void)_updateLatestFocusMode
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__0;
  v9[4] = __Block_byref_object_dispose__0;
  v10 = 0;
  -[BMUserFocusComputedModeStream publisherFromStartTime:](self->_computedModeStream, "publisherFromStartTime:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke;
  v7[3] = &unk_24DD776F8;
  objc_copyWeak(&v8, &location);
  v7[4] = v9;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke_2;
  v6[3] = &unk_24DD773F8;
  v6[4] = v9;
  v5 = (id)objc_msgSend(v3, "sinkWithCompletion:receiveInput:", v7, v6);

  objc_destroyWeak(&v8);
  _Block_object_dispose(v9, 8);

  objc_destroyWeak(&location);
}

void __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isStarting") & 1) != 0)
    {
      objc_msgSend(v4, "_modeUUIDStringForComputedModeEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_modeDidChangeToModeWithModeUUIDString:", v3);

    }
    else
    {
      objc_msgSend(v4, "_modeDidChangeToModeWithModeUUIDString:", 0);
    }
    WeakRetained = v4;
  }

}

void __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "eventBody");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_registerComputedModeStream
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BPSSink *v10;
  BPSSink *computedModeSink;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("CKContextRecentsCache.Modes"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[BMUserFocusComputedModeStream publisher](self->_computedModeStream, "publisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CB48]), "initWithIdentifier:targetQueue:", v6, self->_computedFocusModeQueue);
  objc_msgSend(v7, "subscribeOn:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_56;
  v12[3] = &unk_24DD77760;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_55, v12);
  v10 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  computedModeSink = self->_computedModeSink;
  self->_computedModeSink = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  if (objc_msgSend(v2, "state"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_2(v2);
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v3)
      __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_56(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isStarting") & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_modeUUIDStringForComputedModeEvent:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_modeDidChangeToModeWithModeUUIDString:", v5);

    }
    else
    {
      objc_msgSend(WeakRetained, "_modeDidChangeToModeWithModeUUIDString:", 0);
    }

  }
}

- (void)_groupActivitiesByDateIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, void *, id, id);
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v23 = (void (**)(_QWORD, void *, id, id))v9;
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v8;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          -[CKContextRecentsCache _relativeDateStringForRecent:](self, "_relativeDateStringForRecent:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!a4 || objc_msgSend(v19, "count") < a4)
          {
            if (v20)
              objc_msgSend(v20, "arrayByAddingObject:", v17);
            else
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v18);

            objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v18);
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    objc_msgSend(v12, "keysSortedByValueUsingComparator:", &__block_literal_global_59);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;
    v23[2](v23, v22, v11, v12);

    v8 = v24;
  }

}

uint64_t __83__CKContextRecentsCache__groupActivitiesByDateIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteTimestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "absoluteTimestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "compare:", v7);
  return v11;
}

- (void)_groupActivitiesByAppIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, void *, id, id);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v23 = (void (**)(_QWORD, void *, id, id))v8;
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v17, "associatedBundleId", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!a4 || objc_msgSend(v19, "count") < a4)
          {
            if (v20)
              objc_msgSend(v20, "arrayByAddingObject:", v17);
            else
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v18);

            objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v18);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "keysSortedByValueUsingComparator:", &__block_literal_global_60);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v23;
    v23[2](v23, v22, v10, v11);

    v7 = v24;
  }

}

uint64_t __82__CKContextRecentsCache__groupActivitiesByAppIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteTimestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "absoluteTimestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "compare:", v7);
  return v11;
}

- (void)_groupActivitiesByConstellationIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  CKContextRecentsCache *v43;
  id v44;
  id v45[2];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id location[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v7 = a5;
  if (v7)
  {
    v34 = (void *)a4;
    v35 = v7;
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v36;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v40)
    {
      v38 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v47 != v38)
            objc_enumerationMutation(obj);
          -[CKContextRecentsCache _associatedTopicIdsForRecent:](self, "_associatedTopicIdsForRecent:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i), v34);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "count");
          if (v12 >= 4)
            v13 = 4;
          else
            v13 = v12;
          if (v13)
          {
            for (j = 0; j < v20; ++j)
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", j);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (v16)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v16, "intValue") + 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v15);

              }
              else
              {
                objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24DD78E20, v15);
              }

              v19 = objc_msgSend(v11, "count");
              if (v19 >= 4)
                v20 = 4;
              else
                v20 = v19;
            }
          }

        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v40);
    }

    objc_msgSend(v8, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "count");
    if (v23 >= 0x32)
      v24 = 50;
    else
      v24 = v23;
    v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v24)
    {
      for (k = 0; k != v24; ++k)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", k, v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, v27);

      }
    }
    v51 = 0;
    v52 = &v51;
    v53 = 0x2050000000;
    v29 = (void *)getCKContextClientClass_softClass;
    v54 = getCKContextClientClass_softClass;
    v30 = MEMORY[0x24BDAC760];
    if (!getCKContextClientClass_softClass)
    {
      location[0] = (id)MEMORY[0x24BDAC760];
      location[1] = (id)3221225472;
      location[2] = __getCKContextClientClass_block_invoke;
      location[3] = &unk_24DD77310;
      location[4] = &v51;
      __getCKContextClientClass_block_invoke((uint64_t)location);
      v29 = (void *)v52[3];
    }
    v31 = objc_retainAutorelease(v29);
    _Block_object_dispose(&v51, 8);
    objc_msgSend(v31, "clientWithDefaultRequestType:", 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "newRequest");
    objc_msgSend(v33, "setIncludeHigherLevelTopics:", 1);
    objc_msgSend(v33, "setMaxConstellationTopics:", 15);
    objc_msgSend(v33, "setItemIds:", v25);
    objc_initWeak(location, self);
    v41[0] = v30;
    v41[1] = 3221225472;
    v41[2] = __92__CKContextRecentsCache__groupActivitiesByConstellationIntoSectionsWithRecents_limit_reply___block_invoke;
    v41[3] = &unk_24DD77808;
    objc_copyWeak(v45, location);
    v44 = v35;
    v42 = obj;
    v43 = self;
    v45[1] = v34;
    objc_msgSend(v33, "executeWithReply:", v41);

    objc_destroyWeak(v45);
    objc_destroyWeak(location);

    v7 = v35;
  }

}

void __92__CKContextRecentsCache__groupActivitiesByConstellationIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_36;
  }
  v26 = WeakRetained;
  v27 = v3;
  objc_msgSend(v3, "level2Topics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 32);
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v31)
    goto LABEL_32;
  v29 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v31; ++i)
    {
      if (*(_QWORD *)v40 != v29)
        objc_enumerationMutation(obj);
      v7 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v8 = v30;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (!v9)
      {

LABEL_26:
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Other"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          objc_msgSend(v20, "arrayByAddingObject:", v7);
        else
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v22, CFSTR("Other"));

        objc_msgSend(v33, "setObject:forKeyedSubscript:", CFSTR("Other"), CFSTR("Other"));
        continue;
      }
      v10 = v9;
      v32 = i;
      v11 = 0;
      v12 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v14, "topicId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length")
            && objc_msgSend(*(id *)(a1 + 40), "_constellationResult:intersectsWithRecent:", v14, v7))
          {
            objc_msgSend(v34, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!*(_QWORD *)(a1 + 64) || (unint64_t)objc_msgSend(v16, "count") < *(_QWORD *)(a1 + 64))
            {
              if (v17)
                objc_msgSend(v17, "arrayByAddingObject:", v7);
              else
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v18, v15);

              objc_msgSend(v14, "title");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v19, v15);

            }
            v11 = 1;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v10);

      i = v32;
      if ((v11 & 1) == 0)
        goto LABEL_26;
    }
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  }
  while (v31);
LABEL_32:

  objc_msgSend(v34, "keysSortedByValueUsingComparator:", &__block_literal_global_65);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "indexOfObject:", CFSTR("Other"));
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v24, "removeObjectAtIndex:", v25);
    objc_msgSend(v24, "addObject:", CFSTR("Other"));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  v5 = v26;
  v3 = v27;
LABEL_36:

}

uint64_t __92__CKContextRecentsCache__groupActivitiesByConstellationIntoSectionsWithRecents_limit_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteTimestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "absoluteTimestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "compare:", v7);
  return v11;
}

- (void)_groupActivitiesByModeIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, void *, id, id);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v24 = (void (**)(_QWORD, void *, id, id))v8;
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v17, "modeIdentifier", v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length"))
          {
            objc_msgSend(v17, "modeIdentifier");
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = CFSTR("Other");
          }

          objc_msgSend(v11, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!a4 || objc_msgSend(v20, "count") < a4)
          {
            if (v21)
              objc_msgSend(v21, "arrayByAddingObject:", v17);
            else
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v19);

            objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v19);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "keysSortedByValueUsingComparator:", &__block_literal_global_67);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v24;
    v24[2](v24, v23, v10, v11);

    v7 = v25;
  }

}

uint64_t __83__CKContextRecentsCache__groupActivitiesByModeIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteTimestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "absoluteTimestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "compare:", v7);
  return v11;
}

- (BOOL)_constellationResult:(id)a3 intersectsWithRecent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    -[CKContextRecentsCache _associatedTopicTitlesForRecent:](self, "_associatedTopicTitlesForRecent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v12 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v6, "topicId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        -[CKContextRecentsCache _associatedTopicIdsForRecent:](self, "_associatedTopicIdsForRecent:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "relatedItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "intersectsOrderedSet:", v14) & 1) != 0)
          v9 = 1;
        else
          v9 = objc_msgSend(v14, "containsObject:", v13);

      }
      else
      {
        v9 = 0;
      }

    }
  }

  return v9;
}

- (BOOL)_recent:(id)a3 matchesKeywords:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  char v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "count"))
  {
    -[CKContextRecentsCache _associatedTopicTitlesForRecent:](self, "_associatedTopicTitlesForRecent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v6, "title", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "localizedCaseInsensitiveContainsString:", v15);

          if ((v17 & 1) != 0 || (objc_msgSend(v9, "containsObject:", v15) & 1) != 0)
          {
            v18 = 1;
            goto LABEL_16;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v18 = 0;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_16:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_relativeDateStringForRecent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "absoluteTimestamp");
  v8 = v7;

  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeStyle:", 0);
  objc_msgSend(v5, "setDateStyle:", 3);
  objc_msgSend(v5, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v5, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_associatedTopicIdsForRecent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "topics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "topicIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length") && objc_msgSend(v10, "hasPrefix:", CFSTR("Q")))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_associatedTopicTitlesForRecent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "topics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_scheduleDeferredMaintenanceTasks
{
  id deferredMaintenanceTaskBlock;
  dispatch_block_t v4;
  id v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  deferredMaintenanceTaskBlock = self->_deferredMaintenanceTaskBlock;
  if (deferredMaintenanceTaskBlock)
    dispatch_block_cancel(deferredMaintenanceTaskBlock);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__CKContextRecentsCache__scheduleDeferredMaintenanceTasks__block_invoke;
  v8[3] = &unk_24DD77298;
  objc_copyWeak(&v9, &location);
  v4 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  v5 = self->_deferredMaintenanceTaskBlock;
  self->_deferredMaintenanceTaskBlock = v4;

  v6 = dispatch_time(0, 5000000000);
  dispatch_get_global_queue(9, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v6, v7, self->_deferredMaintenanceTaskBlock);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__CKContextRecentsCache__scheduleDeferredMaintenanceTasks__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_performMaintenanceTasks");
    v2 = (void *)v3[3];
    v3[3] = 0;

    WeakRetained = v3;
  }

}

- (void)_performMaintenanceTasks
{
  OUTLINED_FUNCTION_3(&dword_21A9DC000, MEMORY[0x24BDACB70], a3, "Performing clean-up and maintenance tasks", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __49__CKContextRecentsCache__performMaintenanceTasks__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_performMaintenanceTasksForRecents:", v5);

}

- (void)_performMaintenanceTasksForRecents:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  OS_os_transaction *deferredMaintenanceTransaction;
  _QWORD block[4];
  id v9;
  id location[2];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[CKContextRecentsCache _pruneRecentsFromUnusedAppsForRecents:](self, "_pruneRecentsFromUnusedAppsForRecents:", v4);
    objc_initWeak(location, self);
    v5 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(9, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__CKContextRecentsCache__performMaintenanceTasksForRecents___block_invoke;
    block[3] = &unk_24DD77298;
    objc_copyWeak(&v9, location);
    dispatch_after(v5, v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_21A9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "There was nothing new to prune", (uint8_t *)location, 2u);
    }
    deferredMaintenanceTransaction = self->_deferredMaintenanceTransaction;
    self->_deferredMaintenanceTransaction = 0;

  }
}

void __60__CKContextRecentsCache__performMaintenanceTasksForRecents___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  id deferredMaintenanceTaskBlock;
  objc_super v4;

  deferredMaintenanceTaskBlock = self->_deferredMaintenanceTaskBlock;
  if (deferredMaintenanceTaskBlock)
    dispatch_block_cancel(deferredMaintenanceTaskBlock);
  -[BPSSink cancel](self->_computedModeSink, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)CKContextRecentsCache;
  -[CKContextRecentsCache dealloc](&v4, sel_dealloc);
}

- (void)_pruneRecentsFromUnusedAppsForRecents:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  CKContextRecentsCache *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v22 = self;
  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v4)
    -[CKContextRecentsCache _pruneRecentsFromUnusedAppsForRecents:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "associatedBundleId", v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "length") && (objc_msgSend(v13, "containsObject:", v18) & 1) == 0)
        {
          objc_msgSend(v13, "addObject:", v18);
          v29 = 0;
          v30 = &v29;
          v31 = 0x2050000000;
          v19 = (void *)getLSApplicationRecordClass_softClass;
          v32 = getLSApplicationRecordClass_softClass;
          if (!getLSApplicationRecordClass_softClass)
          {
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __getLSApplicationRecordClass_block_invoke;
            v28[3] = &unk_24DD77310;
            v28[4] = &v29;
            __getLSApplicationRecordClass_block_invoke((uint64_t)v28);
            v19 = (void *)v30[3];
          }
          v20 = objc_retainAutorelease(v19);
          _Block_object_dispose(&v29, 8);
          v23 = 0;
          objc_msgSend(v20, "bundleRecordWithApplicationIdentifier:error:", v18, &v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21 || v23)
            objc_msgSend(v12, "addObject:", v18);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v15);
  }

  -[CKContextRecentsCache pruneRecentsForBundleIdentifiers:](v22, "pruneRecentsForBundleIdentifiers:", v12);
}

- (CKContextRecentsCacheDelegate)delegate
{
  return (CKContextRecentsCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_computedModeSink, 0);
  objc_storeStrong((id *)&self->_computedFocusModeQueue, 0);
  objc_storeStrong((id *)&self->_computedModeStream, 0);
  objc_storeStrong((id *)&self->_latestActivity, 0);
  objc_storeStrong((id *)&self->_deferredMaintenanceTransaction, 0);
  objc_storeStrong(&self->_deferredMaintenanceTaskBlock, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

void __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21A9DC000, MEMORY[0x24BDACB70], v0, "Could not create user activity data: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3_0();
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v0, "Retrieving up to %lu number of items from Biome", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3_0();
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_28_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v1, "Retrieved %lu unique items from Biome", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  OUTLINED_FUNCTION_4_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v3, "Retrieved %lu activities from Biome. Took %f seconds.", v4, v5, v6, v7, 0);

}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v0, "Retrieving up to %lu number of items from Biome for Kettle predictions", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3_0();
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  OUTLINED_FUNCTION_4_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v1, "Retrieved %lu items from Biome for Kettle predictions (%lu unique items)", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_modeDidChangeToModeWithModeUUIDString:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v0, "Mode did change to mode with UUID: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3_0();
}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A9DC000, MEMORY[0x24BDACB70], a3, "Successfully stopped listening to computed focus mode stream", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21A9DC000, MEMORY[0x24BDACB70], v2, "Error listening to computed focus mode stream with error: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_pruneRecentsFromUnusedAppsForRecents:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A9DC000, MEMORY[0x24BDACB70], a3, "Pruning recents for unused applications", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
