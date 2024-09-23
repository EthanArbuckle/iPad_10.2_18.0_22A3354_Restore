@implementation CKDRecordFetchAggregator

- (void)_recordFetchesAvailable
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend_fetchQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend_fetchInfosByOrder(self, v5, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v13, v7, v8))
  {
    objc_msgSend_currentFetchOp(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      MEMORY[0x1E0DE7D20](self, sel__lockedSendFetchRequest, v12);
  }
  else
  {

  }
}

- (NSMutableDictionary)fetchInfosByOrder
{
  return self->_fetchInfosByOrder;
}

- (CKDRecordFetchAggregator)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  dispatch_group_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  dispatch_source_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  _QWORD *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  dispatch_source_t v41;
  void *v42;
  NSObject *v43;
  _QWORD *v44;
  id v45;
  void *v46;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id location;
  objc_super v53;
  uint64_t handler;
  uint64_t v55;
  void (*v56)(uint64_t);
  void *v57;
  id v58;

  v6 = a3;
  v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)CKDRecordFetchAggregator;
  v10 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v53, sel_initWithOperationInfo_container_, v6, v7);
  if (v10)
  {
    *((_BYTE *)v10 + 465) = objc_msgSend_fetchAssetContents(v6, v8, v9);
    *((_BYTE *)v10 + 466) = objc_msgSend_fetchMergeableValues(v6, v11, v12);
    *((_BYTE *)v10 + 467) = objc_msgSend_preserveOrdering(v6, v13, v14);
    objc_msgSend_desiredKeys(v6, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_copy(v17, v18, v19);
    v21 = (void *)*((_QWORD *)v10 + 61);
    *((_QWORD *)v10 + 61) = v20;

    objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v6, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v10 + 60);
    *((_QWORD *)v10 + 60) = v24;

    *((_BYTE *)v10 + 470) = objc_msgSend_forceDecryptionAttempt(v6, v26, v27);
    *((_BYTE *)v10 + 464) = 1;
    objc_initWeak(&location, v10);
    v28 = dispatch_group_create();
    v29 = (void *)*((_QWORD *)v10 + 65);
    *((_QWORD *)v10 + 65) = v28;

    objc_msgSend_fetchQueue(v10, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, v32);
    v34 = (void *)*((_QWORD *)v10 + 64);
    *((_QWORD *)v10 + 64) = v33;

    v35 = *((_QWORD *)v10 + 64);
    v36 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = sub_1BE99851C;
    v50[3] = &unk_1E782EF38;
    objc_copyWeak(&v51, &location);
    v37 = v50;
    handler = v36;
    v55 = 3221225472;
    v56 = sub_1BE9984E8;
    v57 = &unk_1E782EFD8;
    v58 = v37;
    dispatch_source_set_event_handler(v35, &handler);

    dispatch_resume(*((dispatch_object_t *)v10 + 64));
    objc_msgSend_fetchQueue(v10, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, v40);
    v42 = (void *)*((_QWORD *)v10 + 62);
    *((_QWORD *)v10 + 62) = v41;

    v43 = *((_QWORD *)v10 + 62);
    v48[0] = v36;
    v48[1] = 3221225472;
    v48[2] = sub_1BE9C2BB0;
    v48[3] = &unk_1E782EF38;
    objc_copyWeak(&v49, &location);
    v44 = v48;
    handler = v36;
    v55 = 3221225472;
    v56 = sub_1BE9984E8;
    v57 = &unk_1E782EFD8;
    v58 = v44;
    dispatch_source_set_event_handler(v43, &handler);

    dispatch_resume(*((dispatch_object_t *)v10 + 62));
    v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v46 = (void *)*((_QWORD *)v10 + 66);
    *((_QWORD *)v10 + 66) = v45;

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
  }

  return (CKDRecordFetchAggregator *)v10;
}

- (OS_dispatch_queue)fetchQueue
{
  CKDRecordFetchAggregator *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  dispatch_qos_class_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *fetchQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fetchQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend_QOSClass(v2, v4, v5);
    dispatch_queue_attr_make_with_qos_class(v3, v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.cloudkit.fetchAggregator.fetchQueue", v7);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_fetchQueue, "com.apple.cloudkit.recordfetchaggregator", (void *)1, 0);
  }
  objc_sync_exit(v2);

  return v2->_fetchQueue;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  const char *v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend_fetchAggregatorCompletionBlock(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_fetchAggregatorCompletionBlock(self, v8, v9);
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v4);

    objc_msgSend_setFetchAggregatorCompletionBlock_(self, v11, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)CKDRecordFetchAggregator;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v12, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)fetchAggregatorCompletionBlock
{
  return self->_fetchAggregatorCompletionBlock;
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setUseRecordCache:(BOOL)a3
{
  self->_useRecordCache = a3;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void)setFetchAggregatorCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (OS_dispatch_source)recordReadySource
{
  return self->_recordReadySource;
}

- (BOOL)preserveOrdering
{
  return self->_preserveOrdering;
}

- (void)main
{
  CKDRecordFetchAggregator *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  CKDRecordFetchAggregator *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_isMarkedToFinishByParent(v2, v3, v4) & 1) != 0)
  {
    objc_sync_exit(v2);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v6 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v10 = v6;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v2, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v12;
      v24 = 2048;
      v25 = v2;
      v26 = 2114;
      v27 = v15;
      _os_log_debug_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEBUG, "Parent asked record fetch aggregator operation <%{public}@: %p; %{public}@> to finish before it started",
        (uint8_t *)&v22,
        0x20u);

    }
    objc_msgSend__finishRecordFetchAggregator(v2, v7, v8);
  }
  else
  {
    objc_msgSend_setStarted_(v2, v5, 1);
    objc_sync_exit(v2);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v16 = v9;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v2, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v18;
      v24 = 2048;
      v25 = v2;
      v26 = 2114;
      v27 = v21;
      _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Starting record fetch aggregator operation <%{public}@: %p; %{public}@>",
        (uint8_t *)&v22,
        0x20u);

    }
  }
}

- (BOOL)isMarkedToFinishByParent
{
  return self->_markedToFinishByParent;
}

- (unint64_t)highestReturnedOrder
{
  return self->_highestReturnedOrder;
}

- (void)finishIfAppropriate
{
  NSObject *v3;
  CKDRecordFetchAggregator *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  CKDRecordFetchAggregator *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v10 = 134217984;
    v11 = self;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Finishing fetch aggregator: %p", (uint8_t *)&v10, 0xCu);
  }
  v4 = self;
  objc_sync_enter(v4);
  if ((objc_msgSend_started(v4, v5, v6) & 1) != 0)
  {
    objc_sync_exit(v4);

    objc_msgSend__finishRecordFetchAggregator(v4, v8, v9);
  }
  else
  {
    objc_msgSend_setMarkedToFinishByParent_(v4, v7, 1);
    objc_sync_exit(v4);

  }
}

- (OS_dispatch_source)fetchSource
{
  return self->_fetchSource;
}

- (void)fetchRecords:(id)a3 withPerRecordCompletion:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t i;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  SEL v32;
  unsigned __int8 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v7;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v34, v38, 16);
  if (v14)
  {
    v16 = v14;
    v32 = a2;
    v17 = 0;
    v18 = *(_QWORD *)v35;
    v19 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v12);
        v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        v33 = 0;
        objc_msgSend__fetchRecord_recordReadyHandle_withRecordCompletion_(self, v15, v21, &v33, v8, v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          objc_msgSend_currentHandler(*(void **)(v19 + 1160), v22, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)v32, self, CFSTR("CKDRecordFetchAggregator.m"), 534, CFSTR("Failed to initialize fetchInfo"));

          v19 = 0x1E0CB3000;
        }
        v17 += v33;
        objc_msgSend_addObject_(v11, v22, (uint64_t)v24);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v34, v38, 16);
    }
    while (v16);

    objc_msgSend__addRecordFetchInfos_(self, v27, (uint64_t)v11);
    if (v17)
    {
      objc_msgSend_recordReadySource(self, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      dispatch_source_merge_data(v30, 1uLL);

    }
  }
  else
  {

    objc_msgSend__addRecordFetchInfos_(self, v31, (uint64_t)v11);
  }

}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (void)dealloc
{
  NSObject *fetchSource;
  NSObject *recordReadySource;
  objc_super v5;

  fetchSource = self->_fetchSource;
  if (fetchSource)
    dispatch_source_cancel(fetchSource);
  recordReadySource = self->_recordReadySource;
  if (recordReadySource)
    dispatch_source_cancel(recordReadySource);
  v5.receiver = self;
  v5.super_class = (Class)CKDRecordFetchAggregator;
  -[CKDOperation dealloc](&v5, sel_dealloc);
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/record-fetch-aggregator", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_flushFetchedRecordsToConsumerOrderedLocked
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  CKDRecordFetchAggregator *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fetchQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);
  while (1)
  {

    objc_msgSend_fetchInfosByOrder(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v11 = objc_msgSend_highestReturnedOrder(self, v9, v10);
    objc_msgSend_numberWithUnsignedInteger_(v8, v12, v11 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
    v4 = objc_claimAutoreleasedReturnValue();

    if (!v4 || objc_msgSend_state(v4, v15, v16) != 3)
      break;
    objc_msgSend__performCallbackForFetchInfoLocked_(self, v17, (uint64_t)v4);
  }

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v18 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v19 = v18;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v21;
    v29 = 2048;
    v30 = self;
    v31 = 2114;
    v32 = v24;
    v33 = 2048;
    v34 = objc_msgSend_highestReturnedOrder(self, v25, v26);
    _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "Done flushing record callbacks for <%{public}@: %p; %{public}@>. Current highest callback is %lu",
      (uint8_t *)&v27,
      0x2Au);

  }
}

- (void)_flushFetchedRecordsToConsumerNoOrderingLocked
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fetchQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend_fetchInfosByOrder(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, v23, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend_state(v18, v13, v14) == 3)
          objc_msgSend__performCallbackForFetchInfoLocked_(self, v13, (uint64_t)v18);
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v19, v23, 16);
    }
    while (v15);
  }

}

- (void)_flushFetchedRecordsToConsumerLocked
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_fetchQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (objc_msgSend_preserveOrdering(self, v5, v6))
    MEMORY[0x1E0DE7D20](self, sel__flushFetchedRecordsToConsumerOrderedLocked, v7);
  else
    MEMORY[0x1E0DE7D20](self, sel__flushFetchedRecordsToConsumerNoOrderingLocked, v7);
}

- (void)_finishRecordFetchAggregator
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  CKDRecordFetchAggregator *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isFinished(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, self, CFSTR("CKDRecordFetchAggregator.m"), 562, CFSTR("You can't finish a CKDRecordFetchAggregator twice"));

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v20 = v7;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v22;
    v31 = 2048;
    v32 = self;
    v33 = 2114;
    v34 = v25;
    _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Finishing fetch aggregator <%{public}@: %p; %{public}@>",
      buf,
      0x20u);

  }
  objc_msgSend_fetchSource(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_source_merge_data(v10, 1uLL);

  objc_msgSend_recordReadySource(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_source_merge_data(v13, 1uLL);

  objc_msgSend_fetchGroup(self, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C2C88;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_group_notify(v16, v19, block);

}

- (void)_addRecordFetchInfos:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  CKDRecordFetchAggregator *v12;
  SEL v13;

  v5 = a3;
  objc_msgSend_fetchQueue(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C31C0;
  block[3] = &unk_1E7830158;
  v11 = v5;
  v12 = self;
  v13 = a2;
  v9 = v5;
  dispatch_sync(v8, block);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentFetchOp);
  objc_storeStrong((id *)&self->_fetchInfosByOrder, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_fetchSource, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_recordReadySource, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong(&self->_fetchAggregatorCompletionBlock, 0);
  objc_storeStrong((id *)&self->_recordCache, 0);
}

- (id)CKPropertiesDescription
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD aBlock[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1BE9BB0D8;
  v18 = sub_1BE9BAE20;
  v19 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1BEB7E010;
  aBlock[3] = &unk_1E7831250;
  aBlock[4] = self;
  v4 = v3;
  v12 = v4;
  v13 = &v14;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (dispatch_get_specific("com.apple.cloudkit.recordfetchaggregator"))
  {
    v5[2](v5);
  }
  else
  {
    objc_msgSend_fetchQueue(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v8, v5);

  }
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDRecordFetchAggregator *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (int)operationType
{
  return 0;
}

- (void)_performCallbackForFetchInfoLocked:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  unint64_t Order;
  const char *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, uint64_t);
  void *v33;
  id v34;
  CKDRecordFetchAggregator *v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_fetchQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v4;
    _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Performing callback for fetch info %@", buf, 0xCu);
  }
  v11 = objc_msgSend_highestReturnedOrder(self, v9, v10);
  Order = objc_msgSend_fetchOrder(v4, v12, v13);
  if (v11 <= Order)
    objc_msgSend_setHighestReturnedOrder_(self, v15, Order);
  else
    objc_msgSend_setHighestReturnedOrder_(self, v15, v11);
  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = sub_1BEB7E49C;
  v33 = &unk_1E782EE20;
  v34 = v4;
  v35 = self;
  v19 = v4;
  dispatch_async(v18, &v30);

  objc_msgSend_fetchInfosByOrder(self, v20, v21, v30, v31, v32, v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  v26 = objc_msgSend_fetchOrder(v19, v24, v25);
  objc_msgSend_numberWithUnsignedInteger_(v23, v27, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v22, v29, 0, v28);

}

- (void)_lockedSendFetchRequest
{
  uint64_t v2;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  _QWORD *v54;
  void *v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t AssetContents;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t MergeableValues;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  id v100;
  const char *v101;
  NSObject *v102;
  objc_class *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  const char *v109;
  SEL v110;
  CKDRecordFetchAggregator *v111;
  _QWORD v112[4];
  id v113;
  CKDRecordFetchAggregator *v114;
  id v115;
  id v116;
  SEL v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  CKDRecordFetchAggregator *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fetchQueue(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend_currentFetchOp(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v108, v109, (uint64_t)a2, self, CFSTR("CKDRecordFetchAggregator.m"), 324, CFSTR("Can't send a fetch request when another one is still outstanding"));

  }
  v110 = a2;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v102 = v11;
    v103 = (objc_class *)objc_opt_class();
    NSStringFromClass(v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v123 = v104;
    v124 = 2048;
    v125 = self;
    v126 = 2114;
    v127 = v107;
    _os_log_debug_impl(&dword_1BE990000, v102, OS_LOG_TYPE_DEBUG, "Sending fetch requests for <%{public}@: %p; %{public}@>",
      buf,
      0x20u);

  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v111 = self;
  objc_msgSend_fetchInfosByOrder(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v118, v130, 16);
  if (v22)
  {
    v25 = v22;
    v26 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v119 != v26)
          objc_enumerationMutation(v20);
        v28 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        if (objc_msgSend_state(v28, v23, v24) == 1)
        {
          objc_msgSend_record(v28, v23, v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend_record(v28, v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v13, v33, (uint64_t)v32);
          }
          else
          {
            objc_msgSend_recordID(v28, v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v12, v34, (uint64_t)v32);
          }

          objc_msgSend_recordID(v28, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v14, v38, (uint64_t)v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend_addObject_(v39, v40, (uint64_t)v28);
          }
          else
          {
            objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v40, (uint64_t)v28);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v28, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v14, v45, (uint64_t)v39, v44);

          }
          objc_msgSend_setState_(v28, v41, 2);

        }
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v118, v130, 16);
    }
    while (v25);
  }

  v46 = v12;
  if (objc_msgSend_count(v12, v47, v48) || objc_msgSend_count(v13, v49, v50))
  {
    v51 = objc_msgSend_count(v12, v49, v50);
    v54 = (_QWORD *)MEMORY[0x1E0C95300];
    if (v51)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v55 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v56 = v55;
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ckShortDescription(v111, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v123 = v58;
        v124 = 2048;
        v125 = v111;
        v126 = 2114;
        v127 = v61;
        v128 = 2112;
        v129 = v46;
        _os_log_impl(&dword_1BE990000, v56, OS_LOG_TYPE_INFO, "Fetching the following record IDs from the server for operation <%{public}@: %p; %{public}@>: %@",
          buf,
          0x2Au);

      }
    }
    if (objc_msgSend_count(v13, v52, v53))
    {
      if (*v54 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v62 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v63 = v62;
        v64 = (objc_class *)objc_opt_class();
        NSStringFromClass(v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ckShortDescription(v111, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKeyPath_(v13, v69, (uint64_t)CFSTR("recordID"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v123 = v65;
        v124 = 2048;
        v125 = v111;
        v126 = 2114;
        v127 = v68;
        v128 = 2112;
        v129 = v70;
        _os_log_impl(&dword_1BE990000, v63, OS_LOG_TYPE_INFO, "Running the following full records through a fetch records operation for <%{public}@: %p; %{public}@>: %@",
          buf,
          0x2Au);

      }
    }
    v71 = (void *)objc_opt_new();
    objc_msgSend_allObjects(v46, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordIDs_(v71, v75, (uint64_t)v74);

    objc_msgSend_desiredKeys(v111, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDesiredKeys_(v71, v82, (uint64_t)v81);

    objc_msgSend_assetTransferOptionsByRecordTypeAndKey(v111, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetTransferOptionsByRecordTypeAndKey_(v71, v86, (uint64_t)v85);

    AssetContents = objc_msgSend_fetchAssetContents(v111, v87, v88);
    objc_msgSend_setShouldFetchAssetContent_(v71, v90, AssetContents);
    MergeableValues = objc_msgSend_fetchMergeableValues(v111, v91, v92);
    objc_msgSend_setShouldFetchMergeableValues_(v71, v94, MergeableValues);
    v97 = objc_msgSend_databaseScope(v111, v95, v96);
    objc_msgSend_setDatabaseScope_(v71, v98, v97);
    v99 = objc_opt_class();
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = sub_1BEB7EBB4;
    v112[3] = &unk_1E7835958;
    v113 = v13;
    v114 = v111;
    v117 = v110;
    v115 = v71;
    v116 = v14;
    v100 = v71;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v111, v101, v99, v100, v112);

  }
}

- (id)_fetchRecord:(id)a3 recordReadyHandle:(BOOL *)a4 withRecordCompletion:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  CKDRecordFetchInfo *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t hasProtectionDataEntitlement;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  char hasOutOfProcessUIEntitlement;
  uint64_t hasParticipantPIIEntitlement;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  id v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  int v114;
  const char *v115;
  uint64_t v116;
  BOOL *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  char MergeableValues;
  NSObject *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  const char *v165;
  const char *v166;
  NSObject *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  NSObject *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  const char *v176;
  BOOL *v177;
  id v178;
  id v179;
  void *v180;
  uint8_t buf[4];
  void *v182;
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (objc_msgSend_isFinished(self, v11, v12))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v175, v176, (uint64_t)a2, self, CFSTR("CKDRecordFetchAggregator.m"), 469, CFSTR("Can't enqueue a new fetch after we've already finished"));

  }
  objc_msgSend_recordID(v9, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_4;
  objc_msgSend_record(v9, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v153, (uint64_t)a2, self, CFSTR("CKDRecordFetchAggregator.m"), 470, CFSTR("Can't fetch a record without a record ID"));
LABEL_4:

  }
  objc_msgSend_recordID(v9, v18, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v24;
  if (v24)
  {
    v28 = v24;
  }
  else
  {
    objc_msgSend_record(v9, v25, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v29, v30, v31);
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v32 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v160 = v32;
    objc_msgSend_ckShortDescription(v28, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v182 = v163;
    _os_log_debug_impl(&dword_1BE990000, v160, OS_LOG_TYPE_DEBUG, "Enqueuing a record fetch for record %@", buf, 0xCu);

  }
  v33 = [CKDRecordFetchInfo alloc];
  v35 = (void *)objc_msgSend_initWithAggregator_(v33, v34, (uint64_t)self);
  v38 = objc_msgSend_curFetchOrder(self, v36, v37) + 1;
  objc_msgSend_setCurFetchOrder_(self, v39, v38);
  objc_msgSend_setFetchOrder_(v35, v40, v38);
  v180 = v28;
  objc_msgSend_setRecordID_(v35, v41, (uint64_t)v28);
  objc_msgSend_record(v9, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecord_(v35, v45, (uint64_t)v44);

  objc_msgSend_etag(v9, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEtag_(v35, v49, (uint64_t)v48);

  v52 = objc_msgSend_forceDecryptionAttempt(self, v50, v51);
  objc_msgSend_setIgnoreErrors_(v35, v53, v52);
  objc_msgSend_container(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v56, v57, v58);
  v59 = objc_claimAutoreleasedReturnValue();
  hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement((void *)v59, v60, v61);
  objc_msgSend_record(v35, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSerializeProtectionData_(v65, v66, hasProtectionDataEntitlement);

  objc_msgSend_record(v35, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v59) = objc_opt_isKindOfClass();

  if ((v59 & 1) != 0)
  {
    v177 = a4;
    v178 = v10;
    objc_msgSend_container(self, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v75, v76, v77);
    if ((hasOutOfProcessUIEntitlement & 1) != 0)
    {
      hasParticipantPIIEntitlement = 1;
    }
    else
    {
      objc_msgSend_container(self, v78, v79);
      a4 = (BOOL *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entitlements(a4, v82, v83);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v69, v84, v85);
    }
    objc_msgSend_record(v35, v78, v79);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSerializePersonalInfo_(v86, v87, hasParticipantPIIEntitlement);

    if ((hasOutOfProcessUIEntitlement & 1) == 0)
    {

    }
    a4 = v177;
    v10 = v178;
  }
  objc_msgSend_setCompletionBlock_(v35, v70, (uint64_t)v10);
  objc_msgSend_fetchGroup(self, v88, v89);
  v90 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v90);

  objc_msgSend_setState_(v35, v91, 1);
  objc_msgSend_record(v9, v92, v93);
  v94 = objc_claimAutoreleasedReturnValue();
  if (!v94)
    goto LABEL_26;
  v97 = (void *)v94;
  objc_msgSend_record(v9, v95, v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsAssetValues(v98, v99, v100) & 1) != 0)
  {
LABEL_25:

    goto LABEL_26;
  }
  v103 = v10;
  objc_msgSend_record(v9, v101, v102);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasEncryptedData(v104, v105, v106) & 1) != 0
    || (objc_msgSend_forceDecryptionAttempt(self, v107, v108) & 1) != 0)
  {

    v10 = v103;
    goto LABEL_25;
  }
  objc_msgSend_record(v9, v109, v110);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsMergeableValues(v154, v155, v156))
  {
    MergeableValues = objc_msgSend_fetchMergeableValues(self, v157, v158);

    v10 = v103;
    if ((MergeableValues & 1) == 0)
      goto LABEL_50;
LABEL_26:
    objc_msgSend_etag(v9, v95, v96);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v113)
      goto LABEL_42;
    v114 = objc_msgSend_useRecordCache(self, v111, v112);

    if (!v114)
    {
      LOBYTE(v113) = 0;
      goto LABEL_42;
    }
    v179 = v10;
    v117 = a4;
    objc_msgSend_container(self, v115, v116);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordCache(v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_databaseScope(self, v122, v123);
    objc_msgSend_recordID(v35, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_desiredKeys(self, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etagForRecordID_container_requiredKeys_scope_(v121, v131, (uint64_t)v127, v118, v130, v124);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_etag(v9, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v130) = objc_msgSend_isEqualToString_(v132, v136, (uint64_t)v135);

    if (!(_DWORD)v130)
    {
      LOBYTE(v113) = 0;
      goto LABEL_41;
    }
    objc_msgSend_recordID(v35, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_desiredKeys(self, v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordWithID_container_requiredKeys_scope_(v121, v143, (uint64_t)v139, v118, v142, v124);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    if (v144)
    {
      if ((objc_msgSend_containsAssetValues(v144, v145, v146) & 1) == 0
        && (objc_msgSend_hasEncryptedData(v144, v147, v148) & 1) == 0
        && !objc_msgSend_forceDecryptionAttempt(self, v149, v150))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v164 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v171 = v164;
          objc_msgSend_recordID(v35, v172, v173);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v182 = v174;
          _os_log_debug_impl(&dword_1BE990000, v171, OS_LOG_TYPE_DEBUG, "Found record %@ in the cache. Returning that record", buf, 0xCu);

        }
        objc_msgSend_setRecord_(v35, v165, (uint64_t)v144);
        objc_msgSend_setState_(v35, v166, 3);
        LOBYTE(v113) = 1;
        goto LABEL_38;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v151 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v167 = v151;
        objc_msgSend_recordID(v35, v168, v169);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v182 = v170;
        _os_log_debug_impl(&dword_1BE990000, v167, OS_LOG_TYPE_DEBUG, "Found record %@ in the cache, but it needs decryption.  Going through the fetch flow.", buf, 0xCu);

      }
    }
    LOBYTE(v113) = 0;
LABEL_38:

LABEL_41:
    a4 = v117;

    v10 = v179;
    goto LABEL_42;
  }

  v10 = v103;
LABEL_50:
  objc_msgSend_setState_(v35, v95, 3);
  LOBYTE(v113) = 1;
LABEL_42:
  if (a4)
    *a4 = (char)v113;

  return v35;
}

- (BOOL)useRecordCache
{
  return self->_useRecordCache;
}

- (BOOL)fetchAssetContents
{
  return self->_fetchAssetContents;
}

- (void)setFetchAssetContents:(BOOL)a3
{
  self->_fetchAssetContents = a3;
}

- (BOOL)fetchMergeableValues
{
  return self->_fetchMergeableValues;
}

- (void)setFetchMergeableValues:(BOOL)a3
{
  self->_fetchMergeableValues = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (void)setPreserveOrdering:(BOOL)a3
{
  self->_preserveOrdering = a3;
}

- (NSSet)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeys, a3);
}

- (void)setRecordReadySource:(id)a3
{
  objc_storeStrong((id *)&self->_recordReadySource, a3);
}

- (void)setFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchQueue, a3);
}

- (void)setFetchSource:(id)a3
{
  objc_storeStrong((id *)&self->_fetchSource, a3);
}

- (void)setFetchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchGroup, a3);
}

- (unint64_t)curFetchOrder
{
  return self->_curFetchOrder;
}

- (void)setCurFetchOrder:(unint64_t)a3
{
  self->_curFetchOrder = a3;
}

- (void)setHighestReturnedOrder:(unint64_t)a3
{
  self->_highestReturnedOrder = a3;
}

- (CKDFetchRecordsOperation)currentFetchOp
{
  return (CKDFetchRecordsOperation *)objc_loadWeakRetained((id *)&self->_currentFetchOp);
}

- (void)setCurrentFetchOp:(id)a3
{
  objc_storeWeak((id *)&self->_currentFetchOp, a3);
}

- (void)setMarkedToFinishByParent:(BOOL)a3
{
  self->_markedToFinishByParent = a3;
}

- (BOOL)forceDecryptionAttempt
{
  return self->_forceDecryptionAttempt;
}

- (void)setForceDecryptionAttempt:(BOOL)a3
{
  self->_forceDecryptionAttempt = a3;
}

@end
