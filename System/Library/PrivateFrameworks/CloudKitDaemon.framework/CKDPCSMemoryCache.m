@implementation CKDPCSMemoryCache

+ (void)initialize
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend_setupMemoryNotifications(a1, v3, v4);
    MEMORY[0x1E0DE7D20](a1, sel_registerEvictionTimer, v5);
  }
}

+ (void)setupMemoryNotifications
{
  NSObject *v2;
  dispatch_source_t v3;
  void *v4;

  qword_1ED702748 = 1;
  dispatch_get_global_queue(17, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, v2);
  v4 = (void *)qword_1ED702750;
  qword_1ED702750 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1ED702750, &unk_1E78302A8);
}

+ (void)runMemoryCacheEvictionInAllCaches
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint8_t v7[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v2 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1BE990000, v2, OS_LOG_TYPE_DEBUG, "Flushing all PCS memory caches", v7, 2u);
  }
  objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateConnections_(v5, v6, (uint64_t)&unk_1E78302E8);

}

+ (void)startEvictionTimer
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if ((byte_1ED702740 & 1) == 0)
  {
    byte_1ED702740 = 1;
    dispatch_resume((dispatch_object_t)qword_1ED702758);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v3 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Started PCS memory cache timer.", v4, 2u);
    }
  }
  objc_sync_exit(v2);

}

+ (void)stopEvictionTimer
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (byte_1ED702740 == 1)
  {
    byte_1ED702740 = 0;
    dispatch_suspend((dispatch_object_t)qword_1ED702758);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v3 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Stopped PCS memory cache timer.", v4, 2u);
    }
  }
  objc_sync_exit(v2);

}

+ (void)registerEvictionTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA39E48;
  block[3] = &unk_1E7830348;
  block[4] = a1;
  if (qword_1ED702CE0 != -1)
    dispatch_once(&qword_1ED702CE0, block);
}

- (CKDPCSMemoryCache)init
{
  CKDPCSMemoryCache *v2;
  uint64_t v3;
  NSMutableDictionary *cacheEntries;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKDPCSMemoryCache;
  v2 = -[CKDPCSMemoryCache init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cacheEntries = v2->_cacheEntries;
    v2->_cacheEntries = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cloudkit.pcs.memorycache", v5);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;

    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_maxEntries = objc_msgSend_PCSCacheSize(v10, v11, v12);

    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_PCSCacheMinTime(v15, v16, v17);
    v2->_minAge = v18;

    v2->_oldestCacheEntry = 0.0;
  }
  return v2;
}

- (void)_lockedEvictEntriesFromCache
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  float v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  NSObject *v39;
  const char *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  double v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  unint64_t v77;
  __int16 v78;
  CKDPCSMemoryCache *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend_accessQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend_cacheEntries(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v11, v12);
  v14 = v13;
  objc_msgSend_minAge(self, v15, v16);
  v18 = v14 - v17;
  v19 = qword_1ED702748;
  v70 = v10;
  if (v10 > objc_msgSend_maxEntries(self, v20, v21)
    || v10 && v19 != 1 && (objc_msgSend_oldestCacheEntry(self, v22, v23), v24 < v18))
  {
    LODWORD(v24) = 1068708659;
    if (v19 != 4)
      *(float *)&v24 = 1.0;
    v25 = v19 == 2 ? 1.2 : *(float *)&v24;
    v26 = objc_msgSend_maxEntries(self, v22, v23, v24, v10);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v27, v28);
    v30 = v29;
    objc_msgSend_minAge(self, v31, v32);
    v34 = v33;
    objc_msgSend_oldestCacheEntry(self, v35, v36);
    if (v37 != 0.0)
    {
      objc_msgSend_oldestCacheEntry(self, v22, v23);
      if (v38 < v30 + v34 * ((2.0 - v25) * -5.0))
        goto LABEL_10;
    }
    v10 = (unint64_t)(float)-(float)((float)(unint64_t)v26 - (float)((float)v70 * v25));
    if (v10)
    {
LABEL_10:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v39 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v77 = v10;
        v78 = 2048;
        v79 = self;
        _os_log_debug_impl(&dword_1BE990000, v39, OS_LOG_TYPE_DEBUG, "Attempting to evict %lu items from PCS memory cache %p", buf, 0x16u);
      }
      objc_msgSend_keysSortedByValueUsingComparator_(v7, v40, (uint64_t)&unk_1E7830388);
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v71, v75, 16);
      if (v43)
      {
        v45 = v43;
        v46 = 0;
        v47 = *(_QWORD *)v72;
        v48 = 1.79769313e308;
        while (2)
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v72 != v47)
              objc_enumerationMutation(v41);
            v50 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
            objc_msgSend_objectForKey_(v7, v44, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastAccess(v51, v52, v53);
            if (v56 < v48)
            {
              objc_msgSend_lastAccess(v51, v54, v55);
              v48 = v57;
            }
            if (v46 >= v10)
            {

              goto LABEL_33;
            }
            objc_msgSend_lastAccess(v51, v54, v55);
            if (v60 <= v18 || v70 - v46 > objc_msgSend_maxEntries(self, v58, v59))
            {
              objc_msgSend_removeObjectForKey_(v7, v58, v50);
              ++v46;
              v48 = 1.79769313e308;
            }

          }
          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v71, v75, 16);
          if (v45)
            continue;
          break;
        }
LABEL_33:

        if (v48 < 1.79769313e308)
          objc_msgSend_setOldestCacheEntry_(self, v61, v62, v48);
        if (v46)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v63 = *MEMORY[0x1E0C952D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            v77 = v46;
            v78 = 2048;
            v79 = self;
            _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Evicted %lu items from PCS memory cache %p", buf, 0x16u);
          }
          v66 = objc_msgSend_memoryCacheEvictCount(self, v64, v65);
          objc_msgSend_setMemoryCacheEvictCount_(self, v67, v66 + v46);
        }
      }
      else
      {

      }
    }
  }
  if (objc_msgSend_count(v7, v22, v23, v70))
    objc_msgSend_startEvictionTimer(CKDPCSMemoryCache, v68, v69);

}

- (void)getPCSDataFromCacheForID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;

  v8 = a5;
  v9 = a3;
  objc_msgSend_accessQueue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v12);

  v15 = objc_msgSend_memoryCacheRequestCount(self, v13, v14);
  objc_msgSend_setMemoryCacheRequestCount_(self, v16, v15 + 1);
  sub_1BEA15444((uint64_t)v9, (const char *)a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_accessQueue(self, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA3A688;
  block[3] = &unk_1E782F678;
  block[4] = self;
  v24 = v17;
  v25 = v8;
  v21 = v8;
  v22 = v17;
  dispatch_async(v20, block);

}

- (void)setPCSData:(id)a3 forItemID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  CKDPCSMemoryCache *v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  objc_msgSend_accessQueue(self, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v15);

  sub_1BEA15444((uint64_t)v12, (const char *)a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_accessQueue(self, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1BEA3AA20;
  v23[3] = &unk_1E78303B0;
  v24 = v10;
  v25 = self;
  v26 = v16;
  v27 = v11;
  v20 = v11;
  v21 = v16;
  v22 = v10;
  dispatch_async(v19, v23);

}

- (void)runCacheEviction
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  objc_msgSend_accessQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  objc_msgSend_accessQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA3AD38;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_sync(v7, block);

}

- (void)clearCache
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  objc_msgSend_accessQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  objc_msgSend_accessQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA3ADC4;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_sync(v7, block);

}

- (unint64_t)_cacheCount
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend_accessQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  objc_msgSend_accessQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEA3AF84;
  v10[3] = &unk_1E78303D8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (BOOL)hasStatusToReport
{
  uint64_t v2;

  return objc_msgSend__cacheCount(self, a2, v2) != 0;
}

- (id)CKStatusReportArray
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t updated;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const __CFString *v44;
  void *v45;
  const char *v46;
  uint64_t v48;
  uint64_t v49;
  void *v50;

  v3 = (void *)objc_opt_new();
  v6 = objc_msgSend__cacheCount(self, v4, v5);
  v50 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_msgSend_maxEntries(self, v7, v8);
  v49 = objc_msgSend_maxEntries(self, v10, v11);
  v48 = objc_msgSend_memoryCacheHighwaterCount(self, v12, v13);
  objc_msgSend_minAge(self, v14, v15);
  v17 = v16;
  objc_msgSend_oldestCacheEntry(self, v18, v19);
  v21 = v20;
  v24 = objc_msgSend_memoryCacheHitCount(self, v22, v23);
  v27 = objc_msgSend_memoryCacheRequestCount(self, v25, v26);
  v30 = objc_msgSend_memoryCacheHitCount(self, v28, v29);
  v33 = objc_msgSend_memoryCacheRequestCount(self, v31, v32);
  updated = objc_msgSend_memoryCacheUpdateCount(self, v34, v35);
  v39 = objc_msgSend_memoryCacheDeleteCount(self, v37, v38);
  v42 = objc_msgSend_memoryCacheEvictCount(self, v40, v41);
  if ((unint64_t)(qword_1ED702748 - 1) > 3)
    v44 = CFSTR("unknown");
  else
    v44 = off_1E78303F8[qword_1ED702748 - 1];
  objc_msgSend_stringWithFormat_(v50, v43, (uint64_t)CFSTR("[%0.2f%% full: %lu/%lu (max: %lu) (%f min, %f oldest)] [Hit rate %0.2f%% (%lu/%lu), Updates: %lu, Deletes: %lu, Evictions: %lu Memory Status: %@]"), (float)((float)(unint64_t)v6 / (float)(unint64_t)v9) * 100.0, v6, v49, v48, v17, v21, (float)((float)(unint64_t)v24 / (float)(unint64_t)v27) * 100.0, v30, v33, updated, v39, v42, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v46, (uint64_t)v45);

  return v3;
}

- (unint64_t)maxEntries
{
  return self->_maxEntries;
}

- (void)setMaxEntries:(unint64_t)a3
{
  self->_maxEntries = a3;
}

- (double)minAge
{
  return self->_minAge;
}

- (void)setMinAge:(double)a3
{
  self->_minAge = a3;
}

- (NSMutableDictionary)cacheEntries
{
  return self->_cacheEntries;
}

- (void)setCacheEntries:(id)a3
{
  objc_storeStrong((id *)&self->_cacheEntries, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (double)oldestCacheEntry
{
  return self->_oldestCacheEntry;
}

- (void)setOldestCacheEntry:(double)a3
{
  self->_oldestCacheEntry = a3;
}

- (unint64_t)memoryCacheRequestCount
{
  return self->_memoryCacheRequestCount;
}

- (void)setMemoryCacheRequestCount:(unint64_t)a3
{
  self->_memoryCacheRequestCount = a3;
}

- (unint64_t)memoryCacheHitCount
{
  return self->_memoryCacheHitCount;
}

- (void)setMemoryCacheHitCount:(unint64_t)a3
{
  self->_memoryCacheHitCount = a3;
}

- (unint64_t)memoryCacheHighwaterCount
{
  return self->_memoryCacheHighwaterCount;
}

- (void)setMemoryCacheHighwaterCount:(unint64_t)a3
{
  self->_memoryCacheHighwaterCount = a3;
}

- (unint64_t)memoryCacheDeleteCount
{
  return self->_memoryCacheDeleteCount;
}

- (void)setMemoryCacheDeleteCount:(unint64_t)a3
{
  self->_memoryCacheDeleteCount = a3;
}

- (unint64_t)memoryCacheUpdateCount
{
  return self->_memoryCacheUpdateCount;
}

- (void)setMemoryCacheUpdateCount:(unint64_t)a3
{
  self->_memoryCacheUpdateCount = a3;
}

- (unint64_t)memoryCacheEvictCount
{
  return self->_memoryCacheEvictCount;
}

- (void)setMemoryCacheEvictCount:(unint64_t)a3
{
  self->_memoryCacheEvictCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_cacheEntries, 0);
}

@end
