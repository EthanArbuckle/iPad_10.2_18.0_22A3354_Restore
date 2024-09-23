@implementation CKDPCSSQLCache

+ (void)evictPCSSQLCachesForKnownContainers
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  id v7;

  objc_msgSend_defaultContext(CKDLogicalDeviceContext, a2, v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedDatabase(v7, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateGroupsInDatabase_block_(CKDPCSSQLCacheTableGroup, v6, (uint64_t)v5, &unk_1E7837FF8);

}

- (CKDPCSSQLCache)initWithDeviceContext:(id)a3 containerID:(id)a4 accountOverrideInfo:(id)a5 accountID:(id)a6 encryptionServiceName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CKDPCSSQLCache *v17;
  CKDPCSSQLCache *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *asyncQueue;
  const char *v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  CKDPCSSQLCache *v31;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)CKDPCSSQLCache;
  v17 = -[CKDPCSSQLCache init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_containerID, a4);
    objc_storeStrong((id *)&v18->_accountID, a6);
    objc_storeStrong((id *)&v18->_encryptionServiceName, a7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("PCSSQLCache", v19);
    asyncQueue = v18->_asyncQueue;
    v18->_asyncQueue = (OS_dispatch_queue *)v20;

    objc_msgSend_groupNameForContainerID_accountOverrideInfo_(CKDPCSSQLCacheTableGroup, v22, (uint64_t)v13, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18->_asyncQueue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1BEC2674C;
    v27[3] = &unk_1E782F4A8;
    v28 = v12;
    v29 = v13;
    v30 = v23;
    v31 = v18;
    v25 = v23;
    dispatch_async(v24, v27);

  }
  return v18;
}

- (BOOL)hasStatusToReport
{
  return self->_cacheRequestCount != 0;
}

- (id)_lockedFetchPCSDataForID:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5
{
  unsigned int *p_cacheRequestCount;
  unsigned int v7;
  id result;
  unsigned int *p_cacheHitCount;
  unsigned int v10;

  p_cacheRequestCount = &self->_cacheRequestCount;
  do
    v7 = __ldxr(p_cacheRequestCount);
  while (__stxr(v7 + 1, p_cacheRequestCount));
  result = (id)objc_msgSend_PCSDataForID_databaseScope_itemType_accountID_serviceName_(self->_table, a2, (uint64_t)a3, a4, a5, self->_accountID, self->_encryptionServiceName);
  if (result)
  {
    p_cacheHitCount = &self->_cacheHitCount;
    do
      v10 = __ldxr(p_cacheHitCount);
    while (__stxr(v10 + 1, p_cacheHitCount));
  }
  return result;
}

- (void)fetchPCSDataForRecordWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *asyncQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  asyncQueue = self->_asyncQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEC269EC;
  v13[3] = &unk_1E78301A8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(asyncQueue, v13);

}

- (void)fetchPCSDataForZoneWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *asyncQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  asyncQueue = self->_asyncQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEC26B10;
  v13[3] = &unk_1E78301A8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(asyncQueue, v13);

}

- (void)fetchPCSDataForShareWithID:(id)a3 databaseScope:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *asyncQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  asyncQueue = self->_asyncQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEC26C34;
  v13[3] = &unk_1E78301A8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(asyncQueue, v13);

}

- (void)_lockedSetPCSData:(id)a3 databaseScope:(int64_t)a4 itemType:(unint64_t)a5 forID:(id)a6
{
  const char *v10;
  uint64_t v11;
  id v12;
  CKDPCSSQLCacheEntry *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  CKDPCSSQLCacheTable *table;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  id v60;
  id v61;

  v61 = a3;
  v12 = a6;
  if (v61)
  {
    v13 = objc_alloc_init(CKDPCSSQLCacheEntry);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_zoneID(v61, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareID(v61, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parentID(v61, v20, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      objc_msgSend_sqliteRepresentation(v12, v22, v23);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIdentifier_(v13, v37, (uint64_t)v36);

      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v38, a4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDatabaseScope_(v13, v40, (uint64_t)v39);

      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v41, a5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setItemType_(v13, v43, (uint64_t)v42);

      objc_msgSend_setCKDPCSData_(v13, v44, (uint64_t)v61);
      objc_msgSend_setAccountID_(v13, v45, (uint64_t)self->_accountID);
      objc_msgSend_setServiceName_(v13, v46, (uint64_t)self->_encryptionServiceName);
      objc_msgSend_sqliteRepresentation(v16, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneID_(v13, v50, (uint64_t)v49);

      objc_msgSend_sqliteRepresentation(v19, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setShareID_(v13, v54, (uint64_t)v53);

      objc_msgSend_sqliteRepresentation(v24, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setParentID_(v13, v58, (uint64_t)v57);

      v60 = (id)objc_msgSend_insertObject_orUpdateProperties_label_(self->_table, v59, (uint64_t)v13, 0, off_1E7838018);
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_zoneID(v61, v28, v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_specialContainerType(self->_containerID, v30, v31) != 5)
      {
LABEL_11:
        v24 = 0;
        v19 = 0;
        goto LABEL_13;
      }
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v22, v23, 1209600.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExpirationDate_(v13, v33, (uint64_t)v32);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = 0;
        v19 = 0;
        v16 = 0;
        goto LABEL_13;
      }
      objc_msgSend_shareID(v61, v22, v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v32, v34, v35);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_11;
  }
  table = self->_table;
  objc_msgSend_sqliteRepresentation(v12, v10, v11);
  v13 = (CKDPCSSQLCacheEntry *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend_deletePCSDataForID_databaseScope_itemType_accountID_serviceName_(table, v26, (uint64_t)v13, a4, a5, self->_accountID, self->_encryptionServiceName);
LABEL_14:

}

- (void)_setPCSData:(id)a3 forItemWithID:(id)a4 databaseScope:(int64_t)a5 itemType:(unint64_t)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *asyncQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  unint64_t v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  asyncQueue = self->_asyncQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEC2706C;
  v19[3] = &unk_1E7838038;
  v19[4] = self;
  v20 = v12;
  v23 = a5;
  v24 = a6;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_barrier_async(asyncQueue, v19);

}

- (void)setZonePCSData:(id)a3 forZoneWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__setPCSData_forItemWithID_databaseScope_itemType_withCompletionHandler_, a3);
}

- (void)setRecordPCSData:(id)a3 forRecordWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__setPCSData_forItemWithID_databaseScope_itemType_withCompletionHandler_, a3);
}

- (void)setSharePCSData:(id)a3 forShareWithID:(id)a4 databaseScope:(int64_t)a5 withCompletionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__setPCSData_forItemWithID_databaseScope_itemType_withCompletionHandler_, a3);
}

- (void)removePCSDataForItemsInZoneWithID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *asyncQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CKDPCSSQLCache *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC27180;
  block[3] = &unk_1E782F678;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(asyncQueue, block);

}

- (void)removePCSDataForItemsInShareWithID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *asyncQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CKDPCSSQLCache *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC272A8;
  block[3] = &unk_1E782F678;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(asyncQueue, block);

}

- (void)clearCache
{
  NSObject *asyncQueue;
  _QWORD block[5];

  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC273E0;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_barrier_async(asyncQueue, block);
}

- (void)clearInvalidatedCacheEntriesWithSkipZonePCS:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *asyncQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  asyncQueue = self->_asyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC2746C;
  block[3] = &unk_1E782EFD8;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(asyncQueue, block);

}

- (id)CKStatusReportArray
{
  const char *v3;
  void *v4;
  uint64_t cacheRequestCount;
  void *v6;
  const char *v7;

  v4 = (void *)objc_opt_new();
  cacheRequestCount = self->_cacheRequestCount;
  if ((_DWORD)cacheRequestCount)
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("[Hit rate %0.2f%% (%lu/%lu)]"), (float)((float)self->_cacheHitCount / (float)cacheRequestCount) * 100.0, self->_cacheHitCount, cacheRequestCount);
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("[Hit rate %0.2f%% (%lu/%lu)]"), 0, self->_cacheHitCount, cacheRequestCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v7, (uint64_t)v6);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_cacheGroupName, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_cacheGroup, 0);
  objc_storeStrong((id *)&self->_encryptionServiceName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end
