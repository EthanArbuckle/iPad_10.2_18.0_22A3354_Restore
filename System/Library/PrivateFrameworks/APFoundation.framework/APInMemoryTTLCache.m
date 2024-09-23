@implementation APInMemoryTTLCache

- (APInMemoryTTLCache)initWithExpirationInterval:(double)a3 flushQueue:(id)a4
{
  id v7;
  APInMemoryTTLCache *v8;
  NSCache *v9;
  NSCache *storage;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSHashTable *weakEntryRefs;
  APUnfairLock *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  APUnfairLock *lock;
  double v21;
  objc_super v23;

  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)APInMemoryTTLCache;
  v8 = -[APInMemoryTTLCache init](&v23, sel_init);
  if (v8)
  {
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    storage = v8->_storage;
    v8->_storage = v9;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    weakEntryRefs = v8->_weakEntryRefs;
    v8->_weakEntryRefs = (NSHashTable *)v14;

    v16 = [APUnfairLock alloc];
    v19 = objc_msgSend_initWithOptions_(v16, v17, 0, v18);
    lock = v8->_lock;
    v8->_lock = (APUnfairLock *)v19;

    v21 = 0.0;
    if (a3 >= 0.0)
      v21 = a3;
    v8->_timeout = v21;
    objc_storeStrong((id *)&v8->_flushQueue, a4);
  }

  return v8;
}

- (id)getObjectForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend_objectForKey_(self->_storage, v5, (uint64_t)v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend__updateMostRecentAccessForIdentifier_(self, v7, (uint64_t)v4, v8))
  {
    objc_msgSend_object(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_flushCacheStorage
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t buf[4];
  uint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v98 = (void *)os_transaction_create();
  objc_msgSend_lock(self, v3, v4, v5);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v99, v6, v7, v8);
  APLogForCategory(0x12uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_weakEntryRefs(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134283521;
    v111 = objc_msgSend_count(v13, v14, v15, v16);
    _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_INFO, "Attempting to evict objects from cache. %{private}lu entries remain", buf, 0xCu);

  }
  objc_msgSend_date(MEMORY[0x1E0C99D68], v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v20, v21, v22, v23);
  v25 = v24;

  v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend_weakEntryRefs(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v104, (uint64_t)v109, 16);
  if (v33)
  {
    v37 = v33;
    v38 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v105 != v38)
          objc_enumerationMutation(v31);
        v40 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        objc_msgSend_timestamp(v40, v34, v35, v36);
        v42 = v25 - v41;
        objc_msgSend_timeout(self, v43, v44, v45);
        if (v42 > v46)
        {
          objc_msgSend_object(v40, v34, v35, v36);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v47, v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_storage(self, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectForKey_(v55, v56, (uint64_t)v51, v57);

          objc_msgSend_addObject_(v26, v58, (uint64_t)v40, v59);
          objc_msgSend_addObject_(v27, v60, (uint64_t)v51, v61);

        }
      }
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v104, (uint64_t)v109, 16);
    }
    while (v37);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v62 = v26;
  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v100, (uint64_t)v108, 16);
  if (v64)
  {
    v68 = v64;
    v69 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v101 != v69)
          objc_enumerationMutation(v62);
        v71 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * j);
        objc_msgSend_weakEntryRefs(self, v65, v66, v67);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v72, v73, v71, v74);

      }
      v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v100, (uint64_t)v108, 16);
    }
    while (v68);
  }

  APLogForCategory(0x12uLL);
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    v79 = objc_msgSend_count(v62, v76, v77, v78);
    *(_DWORD *)buf = 134283521;
    v111 = v79;
    _os_log_impl(&dword_1CF251000, v75, OS_LOG_TYPE_INFO, "Cache evicted %{private}lu entries due to expiration", buf, 0xCu);
  }

  objc_msgSend_weakEntryRefs(self, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v83, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend_count(v87, v88, v89, v90);

  if (v91)
    objc_msgSend__startFlushCacheTimer(self, v92, v93, v94);
  else
    objc_msgSend__stopFlushCacheTimer(self, v92, v93, v94);
  objc_msgSend_unlock(v99, v95, v96, v97);

}

- (void)recentlyAccessedObject:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_identifier(a3, a2, (uint64_t)a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateMostRecentAccessForIdentifier_(self, v5, (uint64_t)v7, v6);

}

- (BOOL)_updateMostRecentAccessForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  BOOL v22;
  void *v23;
  const char *v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v8, v9, v10, v11);
  v13 = v12;

  objc_msgSend_objectForKey_(self->_storage, v14, (uint64_t)v4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16;
  if (!v16)
    goto LABEL_6;
  if (self->_timeout > 0.0)
  {
    objc_msgSend_timestamp(v16, v17, v18, v19);
    if (v13 - v21 >= self->_timeout)
    {
      objc_msgSend_storage(self, v17, v18, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(v23, v24, (uint64_t)v4, v25);

LABEL_6:
      v22 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend_setTimestamp_(v20, v17, v18, v19, v13);
  v22 = 1;
LABEL_7:

  return v22;
}

- (NSHashTable)weakEntryRefs
{
  return self->_weakEntryRefs;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setObject:(id)a3
{
  id v4;
  APPurgeableCacheEntry *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  id v40;

  v4 = a3;
  v5 = [APPurgeableCacheEntry alloc];
  v40 = (id)objc_msgSend_initWithObject_(v5, v6, (uint64_t)v4, v7);
  objc_msgSend_storage(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v4, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKey_(v11, v16, (uint64_t)v40, (uint64_t)v15);
  objc_msgSend_lock(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v20, v21, v22, v23);
  objc_msgSend_weakEntryRefs(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v27, v28, (uint64_t)v40, v29);

  objc_msgSend_unlock(v20, v30, v31, v32);
  objc_msgSend_timeout(self, v33, v34, v35);
  if (v39 > 0.0)
    objc_msgSend__startFlushCacheTimer(self, v36, v37, v38);

}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)_startFlushCacheTimer
{
  APInMemoryTTLCache *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD aBlock[4];
  id v14;
  id location[2];

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_flushCacheTimer(v2, v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v2->_flushQueue);
    objc_msgSend_setFlushCacheTimer_(v2, v7, (uint64_t)v6, v8);
    if (v6)
    {
      objc_initWeak(location, v2);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1CF25F83C;
      aBlock[3] = &unk_1E8C48630;
      objc_copyWeak(&v14, location);
      v9 = _Block_copy(aBlock);
      dispatch_source_set_timer(v6, 0, 0xDF8475800uLL, 0x37E11D600uLL);
      dispatch_source_set_event_handler(v6, v9);
      dispatch_resume(v6);
      APLogForCategory(0x12uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_DEBUG, "Starting Cache Eviction Timer", v12, 2u);
      }

      objc_destroyWeak(&v14);
      objc_destroyWeak(location);
    }
    else
    {
      APLogForCategory(0x12uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_ERROR, "Error: Could not create eviction timer!", (uint8_t *)location, 2u);
      }

      APSimulateCrash((const char *)5, CFSTR("Could not create eviction timer!"), 0);
      v6 = 0;
    }
  }

  objc_sync_exit(v2);
}

- (OS_dispatch_source)flushCacheTimer
{
  return self->_flushCacheTimer;
}

- (NSCache)storage
{
  return self->_storage;
}

- (void)setFlushCacheTimer:(id)a3
{
  objc_storeStrong((id *)&self->_flushCacheTimer, a3);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend__stopFlushCacheTimer(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)APInMemoryTTLCache;
  -[APInMemoryTTLCache dealloc](&v5, sel_dealloc);
}

- (void)_stopFlushCacheTimer
{
  APInMemoryTTLCache *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_flushCacheTimer(v2, v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    dispatch_source_cancel(v6);
    objc_msgSend_setFlushCacheTimer_(v2, v8, 0, v9);
    APLogForCategory(0x12uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_DEBUG, "Stopping Cache Eviction Timer", v11, 2u);
    }

  }
  objc_sync_exit(v2);

}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void)setWeakEntryRefs:(id)a3
{
  objc_storeStrong((id *)&self->_weakEntryRefs, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (OS_dispatch_queue)flushQueue
{
  return self->_flushQueue;
}

- (void)setFlushQueue:(id)a3
{
  objc_storeStrong((id *)&self->_flushQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushQueue, 0);
  objc_storeStrong((id *)&self->_flushCacheTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_weakEntryRefs, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
