@implementation CKDPCSCache

- (CKDPCSCache)initWithDeviceContext:(id)a3 containerID:(id)a4 accountOverrideInfo:(id)a5 accountID:(id)a6 encryptionServiceName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CKDPCSCache *v17;
  CKDPCSCache *v18;
  CKDPCSSQLCache *v19;
  const char *v20;
  uint64_t v21;
  CKDPCSSQLCache *sqlCache;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *fetchQueue;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  NSObject *v44;
  dispatch_queue_t v45;
  OS_dispatch_queue *callbackQueue;
  uint64_t v47;
  CKDPCSMemoryCache *recordMemoryCache;
  uint64_t v49;
  CKDPCSMemoryCache *zoneMemoryCache;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  CKDPCSMemoryCache *shareMemoryCache;
  uint64_t v55;
  NSMutableDictionary *outstandingFetches;
  id v58;
  objc_super v59;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v59.receiver = self;
  v59.super_class = (Class)CKDPCSCache;
  v17 = -[CKDPCSCache init](&v59, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_containerID, a4);
    objc_storeStrong((id *)&v18->_accountOverrideInfo, a5);
    objc_storeStrong((id *)&v18->_accountID, a6);
    objc_storeStrong((id *)&v18->_encryptionServiceName, a7);
    v19 = [CKDPCSSQLCache alloc];
    v21 = objc_msgSend_initWithDeviceContext_containerID_accountOverrideInfo_accountID_encryptionServiceName_(v19, v20, (uint64_t)v12, v13, v14, v15, v16);
    sqlCache = v18->_sqlCache;
    v18->_sqlCache = (CKDPCSSQLCache *)v21;

    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v13, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v23, v27, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.CloudKit.PCSCache.fetchQueue"), v26);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = (const char *)objc_msgSend_UTF8String(v28, v29, v30);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v58 = v12;
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = dispatch_queue_create(v31, v32);
    fetchQueue = v18->_fetchQueue;
    v18->_fetchQueue = (OS_dispatch_queue *)v33;

    dispatch_queue_set_specific((dispatch_queue_t)v18->_fetchQueue, "com.apple.CloudKit.PCSCache.fetchQueue", (void *)1, 0);
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v13, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v35, v39, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.CloudKit.PCSCache.callbackQueue"), v38);
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43 = (const char *)objc_msgSend_UTF8String(v40, v41, v42);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = dispatch_queue_create(v43, v44);
    callbackQueue = v18->_callbackQueue;
    v18->_callbackQueue = (OS_dispatch_queue *)v45;

    v47 = objc_opt_new();
    recordMemoryCache = v18->_recordMemoryCache;
    v18->_recordMemoryCache = (CKDPCSMemoryCache *)v47;

    v49 = objc_opt_new();
    zoneMemoryCache = v18->_zoneMemoryCache;
    v18->_zoneMemoryCache = (CKDPCSMemoryCache *)v49;

    objc_msgSend_setMinAge_(v18->_zoneMemoryCache, v51, v52, 300.0);
    v12 = v58;
    v53 = objc_opt_new();
    shareMemoryCache = v18->_shareMemoryCache;
    v18->_shareMemoryCache = (CKDPCSMemoryCache *)v53;

    v55 = objc_opt_new();
    outstandingFetches = v18->_outstandingFetches;
    v18->_outstandingFetches = (NSMutableDictionary *)v55;

  }
  return v18;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  CKDPCSCache *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "PCS cache deallocating: %p", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSCache;
  -[CKDPCSCache dealloc](&v4, sel_dealloc);
}

- (void)runMemoryCacheEviction
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_runCacheEviction(self->_recordMemoryCache, a2, v2);
  objc_msgSend_runCacheEviction(self->_zoneMemoryCache, v4, v5);
  objc_msgSend_runCacheEviction(self->_shareMemoryCache, v6, v7);
}

- (void)_lockedGetSQLCacheWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend_fetchQueue(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, CKDPCSSQLCache *, _QWORD))v8 + 2))(v8, self->_sqlCache, 0);
    v7 = v8;
  }

}

- (void)getSQLCache:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  if (dispatch_get_specific("com.apple.CloudKit.PCSCache.fetchQueue"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1BEA15B40;
    v9[3] = &unk_1E782EC18;
    v9[4] = self;
    v10 = v4;
    objc_msgSend__lockedGetSQLCacheWithCompletionHandler_(self, v5, (uint64_t)v9);

  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend_fetchQueue(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA159D4;
    block[3] = &unk_1E782EC40;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    dispatch_async(v8, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (void)_lockedHandleMemoryFetchOfItem:(id)a3 pcsData:(id)a4 forOperation:(id)a5 options:(unint64_t)a6 fetchCreator:(id)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  CKDPCSCache *v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend_fetchQueue(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA15D68;
  block[3] = &unk_1E782EC90;
  v33 = v17;
  v34 = a6;
  v28 = v15;
  v29 = v14;
  v30 = self;
  v31 = v16;
  v32 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v18;
  v25 = v14;
  v26 = v15;
  dispatch_async(v21, block);

}

- (void)_lockedRemoveOutstandingFetch:(id)a3 forItemIDString:(id)a4 databaseScope:(int64_t)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;

  v26 = a3;
  v8 = a4;
  objc_msgSend_fetchQueue(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (v26)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%lu-%@"), a5, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outstandingFetches(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_removeObject_(v18, v19, (uint64_t)v26);
      if (!objc_msgSend_count(v18, v20, v21))
      {
        objc_msgSend_outstandingFetches(self, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectForKey_(v24, v25, (uint64_t)v13);

      }
    }

  }
}

- (id)_lockedGetOutstandingFetchForOperation:(id)a3 options:(unint64_t)a4 itemIDString:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend_fetchQueue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (v9)
  {
    objc_msgSend_outstandingFetches(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_databaseScope(v8, v16, v17);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("%lu-%@"), v18, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v21, (uint64_t)v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = v22;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v33, v37, 16);
    if (v25)
    {
      v27 = v25;
      v28 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v23);
          v30 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend_canBeUsedForOperation_withOptions_(v30, v26, (uint64_t)v8, a4) & 1) != 0)
          {
            v31 = v30;
            goto LABEL_12;
          }
        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v33, v37, 16);
        if (v27)
          continue;
        break;
      }
    }
    v31 = 0;
LABEL_12:

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)_lockedAddOutstandingFetch:(id)a3 forItemIDString:(id)a4 databaseScope:(int64_t)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;

  v24 = a3;
  v8 = a4;
  objc_msgSend_fetchQueue(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%lu-%@"), a5, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_outstandingFetches(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend_outstandingFetches(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v18, v13);

  }
  objc_msgSend_addObject_(v18, v19, (uint64_t)v24);

}

- (void)_lockedInvalidateAllOutstandingPCSFetchesForItemIDString:(id)a3 databaseScope:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_fetchQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%lu-%@"), a4, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outstandingFetches(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = v16;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v24, v28, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v17);
        objc_msgSend_setPcsDataInvalidated_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v23++), v20, 1);
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v24, v28, 16);
    }
    while (v21);
  }

}

- (void)_lockedCreatePCSCacheFetchOfItem:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 fetchCreator:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD *);
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int isEqualToString;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  _QWORD v75[5];
  id v76;
  id v77;
  uint64_t *v78;
  uint64_t v79;
  _QWORD block[4];
  id v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD *))a6;
  v74 = a7;
  v17 = objc_msgSend_databaseScope(v13, v15, v16);
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = sub_1BE9BAF28;
  v87 = sub_1BE9BAD48;
  objc_msgSend__lockedGetOutstandingFetchForOperation_options_itemIDString_(self, v18, (uint64_t)v13, a5, v12);
  v88 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentOperation(v13, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend_operationID((void *)v84[5], v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v24, v28, (uint64_t)v27);

  }
  else
  {
    isEqualToString = 0;
  }
  objc_msgSend_operationID((void *)v84[5], v21, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v13, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_isEqualToString_(v30, v34, (uint64_t)v33);

  v38 = (void *)v84[5];
  if (!v38
    || (objc_msgSend_isPCSDataInvalidated(v38, v36, v37) & 1) != 0
    || ((objc_msgSend_isCancelled((void *)v84[5], v39, v40) | isEqualToString | v35) & 1) != 0)
  {
LABEL_13:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v54 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v90 = (uint64_t)v12;
      _os_log_debug_impl(&dword_1BE990000, v54, OS_LOG_TYPE_DEBUG, "Creating a new fetch operation for %{public}@", buf, 0xCu);
    }
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = sub_1BEA16E60;
    v75[3] = &unk_1E782ED08;
    v78 = &v83;
    v75[4] = self;
    v76 = v12;
    v79 = v17;
    v77 = v74;
    v14[2](v14, v75);

    goto LABEL_18;
  }
  objc_msgSend_parentOperation((void *)v84[5], v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAggregator(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_fetchRequestForExistingOperation_isDependentOnOperation_(v49, v50, (uint64_t)v43, v13))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v51 = (id)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID((void *)v84[5], v52, v53);
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(v13, v65, v66);
      v67 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = v64;
      v91 = 2114;
      v92 = v67;
      v73 = (void *)v64;
      v68 = (void *)v67;
      _os_log_debug_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEBUG, "Not adding callback to existing fetch operation %{public}@ for operation %{public}@ as it would create a dependency cycle", buf, 0x16u);

    }
    goto LABEL_13;
  }

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v55 = (id)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_operationID((void *)v84[5], v56, v57);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v13, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v90 = (uint64_t)v69;
    v91 = 2114;
    v92 = (uint64_t)v72;
    _os_log_debug_impl(&dword_1BE990000, v55, OS_LOG_TYPE_DEBUG, "Adding callback to existing fetch operation %{public}@ for operation %{public}@", buf, 0x16u);

  }
  objc_msgSend_fetchGroup((void *)v84[5], v58, v59);
  v60 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_callbackQueue(self, v61, v62);
  v63 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA16DDC;
  block[3] = &unk_1E782ECB8;
  v81 = v74;
  v82 = &v83;
  dispatch_group_notify(v60, v63, block);

LABEL_18:
  _Block_object_dispose(&v83, 8);

}

- (void)_lockedFetchPCSForItem:(id)a3 memoryCache:(id)a4 forOperation:(id)a5 options:(unint64_t)a6 fetchCreator:(id)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  const char *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35[2];
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend_fetchQueue(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v21);

  v24 = objc_msgSend_databaseScope(v16, v22, v23);
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1BEA174AC;
  v30[3] = &unk_1E782ED30;
  objc_copyWeak(v35, &location);
  v25 = v14;
  v31 = v25;
  v26 = v16;
  v32 = v26;
  v35[1] = (id)a6;
  v27 = v17;
  v33 = v27;
  v28 = v18;
  v34 = v28;
  objc_msgSend_getPCSDataFromCacheForID_databaseScope_withCompletionHandler_(v15, v29, (uint64_t)v25, v24, v30);

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);

}

- (void)fetchPCSForRecordWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  const char *v22;
  _QWORD block[4];
  id v24;
  id v25;
  CKDPCSCache *v26;
  id v27;
  unint64_t v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 303, CFSTR("Invalid record ID: %@"), v11);

  }
  v16 = a5 | 0x800;
  objc_msgSend_fetchQueue(self, v14, v15);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA17664;
  block[3] = &unk_1E782ED80;
  v24 = v11;
  v25 = v12;
  v27 = v13;
  v28 = v16;
  v26 = self;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  dispatch_async(v17, block);

}

- (void)fetchPCSForZoneWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  const char *v22;
  _QWORD block[4];
  id v24;
  id v25;
  CKDPCSCache *v26;
  id v27;
  unint64_t v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 325, CFSTR("Invalid zone ID: %@"), v11);

  }
  v16 = a5 | 0x400;
  objc_msgSend_fetchQueue(self, v14, v15);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA17A44;
  block[3] = &unk_1E782ED80;
  v24 = v11;
  v25 = v12;
  v27 = v13;
  v28 = v16;
  v26 = self;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  dispatch_async(v17, block);

}

- (void)fetchPCSForShareWithID:(id)a3 forOperation:(id)a4 options:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  const char *v22;
  _QWORD block[4];
  id v24;
  id v25;
  CKDPCSCache *v26;
  id v27;
  unint64_t v28;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 349, CFSTR("Invalid share ID: %@"), v11);

  }
  v16 = a5 | 0x1000;
  objc_msgSend_fetchQueue(self, v14, v15);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA17E24;
  block[3] = &unk_1E782ED80;
  v24 = v11;
  v25 = v12;
  v27 = v13;
  v28 = v16;
  v26 = self;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  dispatch_async(v17, block);

}

- (void)_setPCSData:(id)a3 forFetchedRecordID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  _QWORD block[4];
  id v25;
  id v26;
  CKDPCSCache *v27;
  id v28;
  int64_t v29;

  v11 = a3;
  v12 = a4;
  v15 = a6;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v23, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 375, CFSTR("PCS data is of the wrong class: %@"), v22);

    }
  }
  objc_msgSend_fetchQueue(self, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA18220;
  block[3] = &unk_1E782ED80;
  v25 = v12;
  v26 = v11;
  v28 = v15;
  v29 = a5;
  v27 = self;
  v17 = v15;
  v18 = v11;
  v19 = v12;
  dispatch_async(v16, block);

}

- (void)_setPCSData:(id)a3 forFetchedZoneID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  _QWORD block[4];
  id v25;
  id v26;
  CKDPCSCache *v27;
  id v28;
  int64_t v29;

  v11 = a3;
  v12 = a4;
  v15 = a6;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v23, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 414, CFSTR("PCS data is of the wrong class: %@"), v22);

    }
  }
  objc_msgSend_fetchQueue(self, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA187E4;
  block[3] = &unk_1E782ED80;
  v25 = v12;
  v26 = v11;
  v28 = v15;
  v29 = a5;
  v27 = self;
  v17 = v15;
  v18 = v11;
  v19 = v12;
  dispatch_async(v16, block);

}

- (void)_setPCSData:(id)a3 forFetchedShareID:(id)a4 withScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  _QWORD block[4];
  id v25;
  id v26;
  CKDPCSCache *v27;
  id v28;
  int64_t v29;

  v11 = a3;
  v12 = a4;
  v15 = a6;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v23, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 453, CFSTR("PCS data is of the wrong class: %@"), v22);

    }
  }
  objc_msgSend_fetchQueue(self, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA18DD8;
  block[3] = &unk_1E782ED80;
  v25 = v12;
  v26 = v11;
  v28 = v15;
  v29 = a5;
  v27 = self;
  v17 = v15;
  v18 = v11;
  v19 = v12;
  dispatch_async(v16, block);

}

- (void)_updateMemoryCacheWithPCSData:(id)a3 forItemWithID:(id)a4 inMemoryCache:(id)a5 databaseScope:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v11 = a7;
  v12 = a5;
  v13 = a3;
  objc_msgSend_sqliteRepresentation(a4, v14, v15);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forItemID_databaseScope_withCompletionHandler_(v12, v16, (uint64_t)v13, v17, a6, v11);

}

- (void)updateMemoryCacheWithZonePCSData:(id)a3 forZoneWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v11 = a4;
  v14 = a6;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v20, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 498, CFSTR("PCS data is of the wrong class: %@"), v19);

    }
  }
  objc_msgSend_zoneMemoryCache(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateMemoryCacheWithPCSData_forItemWithID_inMemoryCache_databaseScope_withCompletionHandler_(self, v16, (uint64_t)v21, v11, v15, a5, v14);

}

- (void)updateMemoryCacheWithRecordPCSData:(id)a3 forRecordWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v11 = a4;
  v14 = a6;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v20, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 503, CFSTR("PCS data is of the wrong class: %@"), v19);

    }
  }
  objc_msgSend_recordMemoryCache(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateMemoryCacheWithPCSData_forItemWithID_inMemoryCache_databaseScope_withCompletionHandler_(self, v16, (uint64_t)v21, v11, v15, a5, v14);

}

- (void)updateMemoryCacheWithSharePCSData:(id)a3 forShareWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  v11 = a4;
  v14 = a6;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v20, (uint64_t)a2, self, CFSTR("CKDPCSCache.m"), 508, CFSTR("PCS data is of the wrong class: %@"), v19);

    }
  }
  objc_msgSend_shareMemoryCache(self, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateMemoryCacheWithPCSData_forItemWithID_inMemoryCache_databaseScope_withCompletionHandler_(self, v16, (uint64_t)v21, v11, v15, a5, v14);

}

- (void)removePCSDataForItemsInZoneWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_fetchQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA196F0;
  v9[3] = &unk_1E782EE20;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)removePCSDataForItemsInShareWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_fetchQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA198A4;
  v9[3] = &unk_1E782EE20;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (BOOL)hasStatusToReport
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char hasStatusToReport;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  objc_msgSend_zoneMemoryCache(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasStatusToReport(v4, v5, v6) & 1) != 0)
  {
    hasStatusToReport = 1;
  }
  else
  {
    objc_msgSend_recordMemoryCache(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasStatusToReport(v10, v11, v12) & 1) != 0)
    {
      hasStatusToReport = 1;
    }
    else
    {
      objc_msgSend_shareMemoryCache(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_hasStatusToReport(v15, v16, v17) & 1) != 0)
        hasStatusToReport = 1;
      else
        hasStatusToReport = objc_msgSend_hasStatusToReport(self->_sqlCache, v18, v19);

    }
  }

  return hasStatusToReport;
}

- (id)CKStatusReportArray
{
  void *v3;
  CKDPCSSQLCache *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  CKDPCSSQLCache *v9;
  CKDPCSSQLCache *v10;
  id v11;
  _QWORD block[5];
  id v14;
  CKDPCSSQLCache *v15;

  v3 = (void *)objc_opt_new();
  v4 = self->_sqlCache;
  objc_msgSend_fetchQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA19B30;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v8 = v3;
  v14 = v8;
  v15 = v4;
  v9 = v4;
  dispatch_sync(v7, block);

  v10 = v15;
  v11 = v8;

  return v11;
}

- (CKDPCSSQLCache)sqlCache
{
  return self->_sqlCache;
}

- (CKDPCSMemoryCache)recordMemoryCache
{
  return self->_recordMemoryCache;
}

- (CKDPCSMemoryCache)zoneMemoryCache
{
  return self->_zoneMemoryCache;
}

- (CKDPCSMemoryCache)shareMemoryCache
{
  return self->_shareMemoryCache;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (CKAccountOverrideInfo)accountOverrideInfo
{
  return self->_accountOverrideInfo;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)encryptionServiceName
{
  return self->_encryptionServiceName;
}

- (NSMutableDictionary)outstandingFetches
{
  return self->_outstandingFetches;
}

- (void)setOutstandingFetches:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingFetches, a3);
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_outstandingFetches, 0);
  objc_storeStrong((id *)&self->_encryptionServiceName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountOverrideInfo, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_shareMemoryCache, 0);
  objc_storeStrong((id *)&self->_zoneMemoryCache, 0);
  objc_storeStrong((id *)&self->_recordMemoryCache, 0);
  objc_storeStrong((id *)&self->_sqlCache, 0);
}

- (void)clearPCSCaches
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_fetchQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA19FB8;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)clearPCSMemoryCaches
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint8_t v19[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v19 = 0;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Clearing memory-based PCS caches", v19, 2u);
  }
  objc_msgSend_zoneMemoryCache(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearCache(v6, v7, v8);

  objc_msgSend_recordMemoryCache(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearCache(v11, v12, v13);

  objc_msgSend_shareMemoryCache(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearCache(v16, v17, v18);

}

- (void)clearInvalidatedPCSSQLCacheEntriesWithSkipZonePCS:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  const char *v9;
  const __CFString *v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "Clearing invalidated PCS SQL cache entries. Skipping zone pcs: %@", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEA1A364;
  v11[3] = &unk_1E782EE70;
  v13 = v4;
  v12 = v6;
  v8 = v6;
  objc_msgSend_getSQLCache_(self, v9, (uint64_t)v11);

}

@end
