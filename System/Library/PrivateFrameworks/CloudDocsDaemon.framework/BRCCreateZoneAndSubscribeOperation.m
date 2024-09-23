@implementation BRCCreateZoneAndSubscribeOperation

- (BRCCreateZoneAndSubscribeOperation)initWithSession:(id)a3 zoneID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCCreateZoneAndSubscribeOperation *v13;
  objc_super v15;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("create-subscribe-zone/"), "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncContextProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultSyncContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)BRCCreateZoneAndSubscribeOperation;
  v13 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v15, sel_initWithName_syncContext_sessionContext_, v10, v12, v8);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_zoneID, a4);
    -[BRCCreateZoneAndSubscribeOperation setQueuePriority:](v13, "setQueuePriority:", 4);
  }

  return v13;
}

- (BRCCreateZoneAndSubscribeOperation)initWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CKRecordZoneID *v10;
  CKRecordZoneID *zoneID;
  void *v12;
  BRCCreateZoneAndSubscribeOperation *v13;
  void *v14;
  int v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("create-subscribe-zone/"), "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "zoneID");
  v10 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue();
  zoneID = self->_zoneID;
  self->_zoneID = v10;

  objc_msgSend(v6, "metadataSyncContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)BRCCreateZoneAndSubscribeOperation;
  v13 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v17, sel_initWithName_syncContext_sessionContext_, v9, v12, v7);

  if (v13)
  {
    -[BRCCreateZoneAndSubscribeOperation setQueuePriority:](v13, "setQueuePriority:", 4);
    objc_msgSend(v6, "clientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasHighPriorityWatchers");

    if (v15)
      -[_BRCOperation setNonDiscretionary:](v13, "setNonDiscretionary:", 1);
  }

  return v13;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "create-zone", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_optimisticSubscribe%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**createZoneAndSubscribeCompletionBlock)(id, id);
  objc_super v9;

  v6 = a3;
  v7 = a4;
  createZoneAndSubscribeCompletionBlock = (void (**)(id, id))self->_createZoneAndSubscribeCompletionBlock;
  if (createZoneAndSubscribeCompletionBlock)
    createZoneAndSubscribeCompletionBlock[2](createZoneAndSubscribeCompletionBlock, v7);
  v9.receiver = self;
  v9.super_class = (Class)BRCCreateZoneAndSubscribeOperation;
  -[_BRCOperation finishWithResult:error:](&v9, sel_finishWithResult_error_, v6, v7);

}

- (void)_createZoneWithZoneID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  id v14;
  BRCCreateZoneAndSubscribeOperation *v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v4);
  v6 = objc_alloc(MEMORY[0x1E0C94EF0]);
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v7, 0);

  objc_initWeak(&location, v8);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke;
  v13 = &unk_1E8763860;
  objc_copyWeak(&v16, &location);
  v9 = v4;
  v14 = v9;
  v15 = self;
  objc_msgSend(v8, "setModifyRecordZonesCompletionBlock:", &v10);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v8, v10, v11, v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  __CFString *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22[3];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCCreateZoneAndSubscribeOperation _createZoneWithZoneID:]_block_invoke", 97, v22);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = v22[0];
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "operationID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("success");
    *(_DWORD *)buf = 134219010;
    if (v9)
      v19 = v9;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v17;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Handling result of creating %@ (operationID=%@): %@%@", buf, 0x34u);

  }
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v9);
  }
  else
  {
    if (objc_msgSend(v7, "count") != 1)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke_cold_1();

    }
    v13 = objc_msgSend(v7, "count");
    if (v13)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 528), v14);
    if (v13)

    objc_msgSend(*(id *)(a1 + 40), "_registerSubscriptionForZoneID:isOptimisticSubscribe:", *(_QWORD *)(a1 + 32), 0);
  }
  __brc_leave_section(v22);

}

- (void)_registerSubscriptionForZoneID:(id)a3 isOptimisticSubscribe:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  BRCCreateZoneAndSubscribeOperation *v22;
  id v23;
  id v24;
  BOOL v25;
  id location;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BRCSyncContext isShared](self->super._syncContext, "isShared"))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCCreateZoneAndSubscribeOperation _registerSubscriptionForZoneID:isOptimisticSubscribe:].cold.1();

  }
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("subscription/"), "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950B0]), "initWithZoneID:subscriptionID:", v6, v8);
  v10 = objc_alloc_init(MEMORY[0x1E0C94F50]);
  objc_msgSend(v10, "setShouldSendContentAvailable:", 1);
  objc_msgSend(v9, "setNotificationInfo:", v10);
  v11 = objc_alloc(MEMORY[0x1E0C94F28]);
  v27[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v12, 0);

  objc_initWeak(&location, v13);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke;
  v19[3] = &unk_1E8763888;
  v14 = v8;
  v20 = v14;
  objc_copyWeak(&v24, &location);
  v15 = v9;
  v25 = a4;
  v21 = v15;
  v22 = self;
  v16 = v6;
  v23 = v16;
  objc_msgSend(v13, "setModifySubscriptionsCompletionBlock:", v19);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v13);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21[3];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "brc_cloudKitErrorForSubscriptionID:", *(_QWORD *)(a1 + 32));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString brc_containsCloudKitInternalErrorCode:](v10, "brc_containsCloudKitInternalErrorCode:", 2032))
  {

    v10 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRCCreateZoneAndSubscribeOperation _registerSubscriptionForZoneID:isOptimisticSubscribe:]_block_invoke", 137, v21);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = v21[0];
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "operationID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("success");
    *(_DWORD *)buf = 134219010;
    if (v10)
      v19 = v10;
    v23 = v16;
    v24 = 2112;
    v25 = v20;
    v26 = 2112;
    v27 = v17;
    v28 = 2112;
    v29 = v19;
    v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Handling result of creating %@ (operationID=%@): %@%@", buf, 0x34u);

  }
  if (*(_BYTE *)(a1 + 72)
    && ((-[__CFString brc_isCloudKitErrorImplyingZoneNeedsCreation](v10, "brc_isCloudKitErrorImplyingZoneNeedsCreation") & 1) != 0
     || -[__CFString brc_containsCloudKitErrorCode:](v10, "brc_containsCloudKitErrorCode:", 11)))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "_createZoneWithZoneID:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "completedWithResult:error:", 0, v10);
  }
  __brc_leave_section(v21);

}

- (BOOL)optimisticSubscribe
{
  return self->_optimisticSubscribe;
}

- (void)setOptimisticSubscribe:(BOOL)a3
{
  self->_optimisticSubscribe = a3;
}

- (BOOL)subscriptionOnly
{
  return self->_subscriptionOnly;
}

- (void)setSubscriptionOnly:(BOOL)a3
{
  self->_subscriptionOnly = a3;
}

- (id)createZoneAndSubscribeCompletionBlock
{
  return self->_createZoneAndSubscribeCompletionBlock;
}

- (void)setCreateZoneAndSubscribeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (CKRecordZone)createdZone
{
  return self->_createdZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdZone, 0);
  objc_storeStrong(&self->_createZoneAndSubscribeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

void __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: savedZones.count == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_registerSubscriptionForZoneID:isOptimisticSubscribe:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !self->_syncContext.isShared%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] optimistic subscribe failed with Zone Not Found, try to create the zone first%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
