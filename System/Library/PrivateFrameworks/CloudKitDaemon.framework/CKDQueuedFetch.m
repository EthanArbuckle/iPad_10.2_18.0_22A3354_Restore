@implementation CKDQueuedFetch

- (CKDQueuedFetch)init
{
  objc_class *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  id v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C94D90]);
  v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E0C99778], CFSTR("You must call -[%@ initWithOperation:container:operationQueue:]"), v3);
  objc_exception_throw(v6);
}

- (CKDQueuedFetch)initWithOperation:(id)a3 container:(id)a4 operationQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKDQueuedFetch *v12;
  os_activity_t v13;
  OS_os_activity *osActivity;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSDate *queuedDate;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSDate *lastRequestDate;
  uint64_t v23;
  NSMutableDictionary *completionHandlersByItemID;
  uint64_t v25;
  NSMutableSet *dependentOperationIDs;
  uint64_t v27;
  NSMutableDictionary *dependentOperationIDsByItemID;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableDictionary *unitTestOverrides;
  uint64_t v39;
  objc_super v41;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v41.receiver = self;
  v41.super_class = (Class)CKDQueuedFetch;
  v12 = -[CKDQueuedFetch init](&v41, sel_init);
  if (v12)
  {
    v13 = _os_activity_create(&dword_1BE990000, "daemon/queued-fetch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v12->_osActivity;
    v12->_osActivity = (OS_os_activity *)v13;

    objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    queuedDate = v12->_queuedDate;
    v12->_queuedDate = (NSDate *)v17;

    objc_msgSend_date(MEMORY[0x1E0C99D68], v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    lastRequestDate = v12->_lastRequestDate;
    v12->_lastRequestDate = (NSDate *)v21;

    v23 = objc_opt_new();
    completionHandlersByItemID = v12->_completionHandlersByItemID;
    v12->_completionHandlersByItemID = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    dependentOperationIDs = v12->_dependentOperationIDs;
    v12->_dependentOperationIDs = (NSMutableSet *)v25;

    v27 = objc_opt_new();
    dependentOperationIDsByItemID = v12->_dependentOperationIDsByItemID;
    v12->_dependentOperationIDsByItemID = (NSMutableDictionary *)v27;

    objc_storeWeak((id *)&v12->_container, v10);
    objc_storeWeak((id *)&v12->_operationQueue, v11);
    objc_storeStrong((id *)&v12->_initialOperation, a3);
    v12->_scope = 2;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12->_scope = objc_msgSend_databaseScope(v9, v29, v30);
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(v9, v29, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend_unitTestOverrides(v9, v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_mutableCopy(v34, v35, v36);
        unitTestOverrides = v12->_unitTestOverrides;
        v12->_unitTestOverrides = (NSMutableDictionary *)v37;

      }
      else
      {
        v39 = objc_opt_new();
        v34 = v12->_unitTestOverrides;
        v12->_unitTestOverrides = (NSMutableDictionary *)v39;
      }

    }
    v12->_highestQOS = objc_msgSend_qualityOfService(v9, v29, v30);
  }

  return v12;
}

- (OS_dispatch_queue)callbackQueue
{
  CKDQueuedFetch *v2;
  dispatch_queue_t *p_callbackQueue;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  dispatch_qos_class_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  dispatch_queue_t v10;

  v2 = self;
  objc_sync_enter(v2);
  p_callbackQueue = (dispatch_queue_t *)&v2->_callbackQueue;
  if (!v2->_callbackQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_highestQOS(v2, v5, v6);
    v7 = CKQoSClassFromNSQualityOfService();
    dispatch_queue_attr_make_with_qos_class(v4, v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.cloudkit.pcs.queuedFetch.callbackQueue", v8);
    v10 = *p_callbackQueue;
    *p_callbackQueue = v9;

    dispatch_queue_set_specific(*p_callbackQueue, &v2->_callbackQueue, (void *)1, 0);
  }
  objc_sync_exit(v2);

  return v2->_callbackQueue;
}

- (BOOL)isFinished
{
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend_callbackQueue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ck_call_or_dispatch_sync_if_not_key();

  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (void)setIsFinished:(BOOL)a3
{
  void *v3;

  objc_msgSend_callbackQueue(self, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ck_call_or_dispatch_sync_if_not_key();

}

- (BOOL)isCancelled
{
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend_callbackQueue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ck_call_or_dispatch_sync_if_not_key();

  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (void)setIsCancelled:(BOOL)a3
{
  void *v3;

  objc_msgSend_callbackQueue(self, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ck_call_or_dispatch_sync_if_not_key();

}

- (int)numberOfCallbacks
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend_completionHandlersByItemID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_completionHandlersByItemID(self, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, v23, 16);
  if (v14)
  {
    LODWORD(v15) = 0;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend_count(*(void **)(*((_QWORD *)&v19 + 1) + 8 * i), v12, v13) + (int)v15;
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v19, v23, 16);
    }
    while (v14);
  }
  else
  {
    LODWORD(v15) = 0;
  }

  objc_sync_exit(v4);
  return v15;
}

- (void)addCallbackForItemWithID:(id)a3 operation:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  id v60;

  v60 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_completionHandlersByItemID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  objc_msgSend_completionHandlersByItemID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v60);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend_completionHandlersByItemID(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v17, v60);

  }
  v24 = (void *)objc_msgSend_copy(v9, v18, v19);
  objc_msgSend_addObject_(v17, v25, (uint64_t)v24);

  objc_sync_exit(v12);
  objc_msgSend_dependentOperationIDsByItemID(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v28);
  v31 = (void *)objc_opt_new();
  do
  {
    objc_msgSend_operationID(v8, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v31, v33, (uint64_t)v32);

    objc_msgSend_parentOperation(v8, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v36;
  }
  while (v36);
  objc_msgSend_dependentOperationIDsByItemID(self, v29, v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v37, v38, (uint64_t)v60);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    v39 = (void *)objc_opt_new();
    objc_msgSend_dependentOperationIDsByItemID(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v43, v44, (uint64_t)v39, v60);

  }
  objc_msgSend_addObjectsFromArray_(v39, v40, (uint64_t)v31);
  objc_msgSend_dependentOperationIDs(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v47, v48, (uint64_t)v31);

  objc_sync_exit(v28);
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v51);
    objc_msgSend_unitTestOverrides(self, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unitTestOverrides(0, v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v57;
    if (v57)
      objc_msgSend_addEntriesFromDictionary_(v54, v58, v57);
    else
      objc_msgSend_addEntriesFromDictionary_(v54, v58, MEMORY[0x1E0C9AA70]);

    objc_sync_exit(v51);
  }

}

- (void)removeCallbacksForItemWithID:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_msgSend_completionHandlersByItemID(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    objc_msgSend_completionHandlersByItemID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v10, v11, (uint64_t)v6);

    objc_sync_exit(v7);
    objc_msgSend_dependentOperationIDsByItemID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v14);
    objc_msgSend_dependentOperationIDsByItemID(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = v19;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v34, v38, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v20);
          v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v26);
          objc_msgSend_dependentOperationIDs(self, v22, v23, (_QWORD)v34);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v28, v29, v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v34, v38, 16);
      }
      while (v24);
    }

    objc_msgSend_dependentOperationIDsByItemID(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v32, v33, (uint64_t)v6);

    objc_sync_exit(v14);
  }

}

- (id)callbacksForItemWithID:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_completionHandlersByItemID(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    objc_msgSend_completionHandlersByItemID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend_copy(v12, v13, v14);

    objc_sync_exit(v7);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)allItemIDs
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_completionHandlersByItemID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend_completionHandlersByItemID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_copy(v10, v11, v12);

  objc_sync_exit(v4);
  return v13;
}

- (void)performCallbacksForItemWithID:(id)a3 withItem:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0C952F8];
  if (v10)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Error fetching item with ID %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v15 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Bulk fetched item with ID %@: %@.", buf, 0x16u);
    }
  }
  objc_msgSend_callbackQueue(self, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1BEA5388C;
  v20[3] = &unk_1E782F4A8;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v17 = v10;
  v18 = v9;
  v19 = v8;
  dispatch_async(v16, v20);

}

- (void)finishFetchOperationWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_callbackQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA53A88;
  v9[3] = &unk_1E782EE20;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)cancelFetchOperation
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  const char *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C94FF8];
  v4 = *MEMORY[0x1E0C947D8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_format_(v3, v7, v4, 20, 0, CFSTR("%@ %p was cancelled"), v6, self);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_finishFetchOperationWithError_(self, v8, (uint64_t)v9);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  unsigned int v23;
  const char *v24;
  void *v25;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_queuedDate(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastRequestDate(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_numberOfCallbacks(self, v9, v10);
  objc_msgSend_initialOperation(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfo(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_initialOperation(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_usesBackgroundSession(v20, v21, v22);
  objc_msgSend_stringWithFormat_(v4, v24, (uint64_t)CFSTR("queuedDate=%@, lastRequestDate=%@, numCallbacks=%d, initialOperationInfo=%@, usesBackground=%d"), v5, v8, v11, v17, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDQueuedFetch *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)canBeUsedForOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int isNetworkingBehaviorEquivalentForOperation;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  BOOL v15;

  v4 = a3;
  objc_msgSend_initialOperation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isNetworkingBehaviorEquivalentForOperation = objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v7, v8, (uint64_t)v4);

  v15 = 0;
  if (isNetworkingBehaviorEquivalentForOperation)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v12 = objc_msgSend_databaseScope(v4, v10, v11), v12 == objc_msgSend_scope(self, v13, v14)))
    {
      v15 = 1;
    }
  }

  return v15;
}

- (BOOL)canBeUsedForPendingFetch:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int isNetworkingBehaviorEquivalentForOperation;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;

  v4 = a3;
  objc_msgSend_initialOperation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_initialOperation(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isNetworkingBehaviorEquivalentForOperation = objc_msgSend_isNetworkingBehaviorEquivalentForOperation_(v7, v11, (uint64_t)v10);

  if (isNetworkingBehaviorEquivalentForOperation)
  {
    v15 = objc_msgSend_scope(self, v13, v14);
    v18 = v15 == objc_msgSend_scope(v4, v16, v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)dependentOperationListContainsRunningFetch:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  char v19;
  void *v21;
  const char *v22;

  v5 = a3;
  objc_msgSend_runningOperationID(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDQueuedFetch.m"), 265, CFSTR("Expected non-nil runningOperationID on fetch %@"), v5);

  }
  objc_msgSend_dependentOperationIDsByItemID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  objc_msgSend_dependentOperationIDs(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_runningOperationID(v5, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_containsObject_(v14, v18, (uint64_t)v17);

  objc_sync_exit(v11);
  return v19;
}

- (BOOL)dependentOperationListContainsOperationID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = a3;
  objc_msgSend_dependentOperationIDsByItemID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_dependentOperationIDs(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4);

  objc_sync_exit(v7);
  return (char)self;
}

- (void)createFetchOperationForItemIDs:(id)a3 operationQueue:(id)a4 operationConfigurationBlock:(id)a5
{
  const char *v7;
  id v8;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, self, CFSTR("CKDQueuedFetch.m"), 281, CFSTR("To be overridden by subclass"));

}

- (void)start
{
  uint64_t v2;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend_osActivity(self, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v5, &state);

  objc_msgSend_callbackQueue(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA54284;
  v9[3] = &unk_1E7830130;
  v9[4] = self;
  v9[5] = a2;
  dispatch_sync(v8, v9);

  os_activity_scope_leave(&state);
}

- (NSDate)queuedDate
{
  return self->_queuedDate;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKDQueuedFetch)equivalentRunningFetch
{
  return (CKDQueuedFetch *)objc_loadWeakRetained((id *)&self->_equivalentRunningFetch);
}

- (void)setEquivalentRunningFetch:(id)a3
{
  objc_storeWeak((id *)&self->_equivalentRunningFetch, a3);
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
  objc_storeStrong((id *)&self->_osActivity, a3);
}

- (NSMutableDictionary)completionHandlersByItemID
{
  return self->_completionHandlersByItemID;
}

- (void)setCompletionHandlersByItemID:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlersByItemID, a3);
}

- (unint64_t)lastCompletionHandlerCount
{
  return self->_lastCompletionHandlerCount;
}

- (void)setLastCompletionHandlerCount:(unint64_t)a3
{
  self->_lastCompletionHandlerCount = a3;
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (void)setLastRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestDate, a3);
}

- (CKDContainer)container
{
  return (CKDContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_loadWeakRetained((id *)&self->_operationQueue);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeWeak((id *)&self->_operationQueue, a3);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (int64_t)highestQOS
{
  return self->_highestQOS;
}

- (void)setHighestQOS:(int64_t)a3
{
  self->_highestQOS = a3;
}

- (NSString)runningOperationID
{
  return self->_runningOperationID;
}

- (void)setRunningOperationID:(id)a3
{
  objc_storeStrong((id *)&self->_runningOperationID, a3);
}

- (NSMutableSet)dependentOperationIDs
{
  return self->_dependentOperationIDs;
}

- (void)setDependentOperationIDs:(id)a3
{
  objc_storeStrong((id *)&self->_dependentOperationIDs, a3);
}

- (NSMutableDictionary)dependentOperationIDsByItemID
{
  return self->_dependentOperationIDsByItemID;
}

- (void)setDependentOperationIDsByItemID:(id)a3
{
  objc_storeStrong((id *)&self->_dependentOperationIDsByItemID, a3);
}

- (NSMutableDictionary)unitTestOverrides
{
  return self->_unitTestOverrides;
}

- (void)setUnitTestOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestOverrides, a3);
}

- (CKDOperation)initialOperation
{
  return self->_initialOperation;
}

- (void)setInitialOperation:(id)a3
{
  objc_storeStrong((id *)&self->_initialOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialOperation, 0);
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_dependentOperationIDsByItemID, 0);
  objc_storeStrong((id *)&self->_dependentOperationIDs, 0);
  objc_storeStrong((id *)&self->_runningOperationID, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_destroyWeak((id *)&self->_operationQueue);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_completionHandlersByItemID, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_destroyWeak((id *)&self->_equivalentRunningFetch);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queuedDate, 0);
}

@end
