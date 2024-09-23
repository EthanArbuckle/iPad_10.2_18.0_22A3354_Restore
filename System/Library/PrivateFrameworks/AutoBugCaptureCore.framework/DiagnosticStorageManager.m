@implementation DiagnosticStorageManager

- (DiagnosticStorageManager)initWithPersistentStoreController:(id)a3 logArchiveDirectory:(id)a4
{
  id v7;
  id v8;
  DiagnosticStorageManager *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DiagnosticStorageManager;
  v9 = -[DiagnosticStorageManager init](&v14, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.symptoms.diagstoragemanager.queue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_storeController, a3);
    objc_storeStrong((id *)&v9->_logArchivePath, a4);

  }
  return v9;
}

- (unint64_t)allowableDiskUsageSize
{
  void *v2;
  int v3;

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass");

  if (v3 == 7)
    return 0x40000000;
  else
    return 0x280000000;
}

- (void)invalidateDiskUsageStatistics
{
  NSMutableDictionary *payloadsByCaseID;
  NSMutableArray *casesSortedByDate;

  payloadsByCaseID = self->_payloadsByCaseID;
  self->_payloadsByCaseID = 0;

  casesSortedByDate = self->_casesSortedByDate;
  self->_casesSortedByDate = 0;

  self->_lastCalculatedDiskUsageSize = 0;
}

- (unint64_t)performPeriodicPurge
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  unint64_t v7;
  _QWORD block[5];
  dispatch_semaphore_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke;
  block[3] = &unk_1EA3B63D0;
  v10 = v3;
  v11 = &v12;
  block[4] = self;
  v5 = v3;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke_2;
  v4[3] = &unk_1EA3B63A8;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_sortedAutoBugCaptureDiskUsageByCase:", v4);

}

void __48__DiagnosticStorageManager_performPeriodicPurge__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  __int128 v28;
  id obj;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -864000.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v33;
    *(_QWORD *)&v5 = 138412290;
    v28 = v5;
    do
    {
      v10 = 0;
      v11 = v7;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("caseDate"), v28);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("caseID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "length"))
        {
          if (objc_msgSend(v3, "compare:", v8) != 1)
            goto LABEL_18;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SymptomsAttachmentsTotalSize"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedIntegerValue");

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SymptomsDiagExtAttachmentsTotalSize"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedIntegerValue");

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v17 + v15;
          storageLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v37 = (uint64_t)v7;
            v38 = 2112;
            v39 = v8;
            v40 = 2112;
            v41 = v3;
            _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "Payloads for case %@ (generated on %@) is older than the retention limit (%@) and will be purged", buf, 0x20u);
          }

          objc_msgSend(v30, "addObject:", v7);
        }
        else
        {
          storageLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            v37 = (uint64_t)v13;
            _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, "This case is missing a caseID: %@", buf, 0xCu);
          }

        }
        ++v10;
        v11 = v7;
        v12 = v8;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
LABEL_18:

  v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  storageLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      v23 = objc_msgSend(v30, "count");
      v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      v37 = v23;
      v38 = 2048;
      v39 = v24;
      v25 = "The total periodic purge size for %lu cases shall be %lu";
      v26 = v21;
      v27 = 22;
LABEL_23:
      _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    }
  }
  else if (v22)
  {
    *(_WORD *)buf = 0;
    v25 = "There are no stale cases which need to be purged";
    v26 = v21;
    v27 = 2;
    goto LABEL_23;
  }

  objc_msgSend(*(id *)(a1 + 32), "_purgeCasesWithCaseIDs:", v30);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (unint64_t)performPurgeToMeetDiskUsageLimit:(unint64_t)a3 calculateOnly:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  const char *v8;
  dispatch_semaphore_t v9;
  NSObject *queue;
  NSObject *v11;
  dispatch_time_t v12;
  unint64_t v13;
  _QWORD block[5];
  dispatch_semaphore_t v16;
  _BYTE *v17;
  unint64_t v18;
  BOOL v19;
  _BYTE buf[24];
  uint64_t v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  storageLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = "NO";
    if (v4)
      v8 = "YES";
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "performPurgeToMeetDiskUsageLimit (%lu) calculateOnly:%s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v21 = 0;
  v9 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke;
  block[3] = &unk_1EA3B6470;
  v19 = v4;
  v17 = buf;
  v18 = a3;
  block[4] = self;
  v16 = v9;
  v11 = v9;
  dispatch_async(queue, block);
  v12 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v11, v12);
  v13 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "invalidateDiskUsageStatistics");
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2;
  v5[3] = &unk_1EA3B6448;
  v8 = *(_BYTE *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v5[4] = v2;
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "_autoBugCaptureDiskUsageSize:", v5);

}

void __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56) >= a2)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    storageLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134218240;
      v18 = a2;
      v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "ABC Disk Usage exceeds limit: %lu > %lu", buf, 0x16u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = a2 - *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 64))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_22;
      v15[3] = &unk_1EA3B63F8;
      v11 = *(_OWORD *)(a1 + 40);
      v8 = (id)v11;
      v16 = v11;
      objc_msgSend(v6, "_calculatePurgableSizeForRequestedPurgeSize:reply:", v7, v15);
      v9 = (void *)v16;
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2_24;
      v13[3] = &unk_1EA3B6420;
      v12 = *(_OWORD *)(a1 + 40);
      v10 = (id)v12;
      v14 = v12;
      objc_msgSend(v6, "_performSizedPurge:reply:", v7, v13);
      v9 = (void *)v14;
    }

  }
}

intptr_t __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __75__DiagnosticStorageManager_performPurgeToMeetDiskUsageLimit_calculateOnly___block_invoke_2_24(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_performSizedPurge:(unint64_t)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__DiagnosticStorageManager__performSizedPurge_reply___block_invoke;
  v8[3] = &unk_1EA3B6498;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[DiagnosticStorageManager _calculatePurgableSizeForRequestedPurgeSize:reply:](self, "_calculatePurgableSizeForRequestedPurgeSize:reply:", a3, v8);

}

uint64_t __53__DiagnosticStorageManager__performSizedPurge_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_purgeCasesWithCaseIDs:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)_calculatePurgableSizeForRequestedPurgeSize:(unint64_t)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__DiagnosticStorageManager__calculatePurgableSizeForRequestedPurgeSize_reply___block_invoke;
  v8[3] = &unk_1EA3B64C0;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[DiagnosticStorageManager _sortedAutoBugCaptureDiskUsageByCase:](self, "_sortedAutoBugCaptureDiskUsageByCase:", v8);

}

void __78__DiagnosticStorageManager__calculatePurgableSizeForRequestedPurgeSize_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  char *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138412290;
    v21 = v5;
    do
    {
      v10 = 0;
      v11 = v7;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("caseID"), v21);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "length"))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SymptomsAttachmentsTotalSize"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "unsignedIntegerValue");

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SymptomsDiagExtAttachmentsTotalSize"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntegerValue");

          v8 += v14 + v16;
          objc_msgSend(v3, "addObject:", v7);
          if ((unint64_t)v8 >= *(_QWORD *)(a1 + 40))
            goto LABEL_14;
        }
        else
        {
          storageLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v29 = (char *)v12;
            _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, "This case is missing a caseID: %@", buf, 0xCu);
          }

        }
        ++v10;
        v11 = v7;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
LABEL_14:

  }
  else
  {
    v8 = 0;
  }

  storageLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    v29 = v8;
    v30 = 2048;
    v31 = v19;
    _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "purge size calculated to be %lu for a requestedPurgeSize of %lu", buf, 0x16u);
  }

  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
    (*(void (**)(uint64_t, id, char *))(v20 + 16))(v20, v3, v8);

}

- (void)_purgeCasesWithCaseIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
          v9 = (void *)objc_msgSend(v14, "initWithUUIDString:", v13, (_QWORD)v15);

          objc_msgSend(v5, "addObject:", v9);
          ++v11;
          v12 = v9;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);

    }
    -[DiagnosticStorageManager removeCaseStorageAndAttachmentsForCasesWithUUIDs:](self, "removeCaseStorageAndAttachmentsForCasesWithUUIDs:", v5);
    -[DiagnosticStorageManager invalidateDiskUsageStatistics](self, "invalidateDiskUsageStatistics");

  }
}

- (void)removeCaseStorageAndAttachmentsForCasesWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  ABCPersistentStoreController *storeController;
  OS_dispatch_queue *queue;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    queue = self->_queue;
    storeController = self->_storeController;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__DiagnosticStorageManager_removeCaseStorageAndAttachmentsForCasesWithUUIDs___block_invoke;
    v15[3] = &unk_1EA3B64E8;
    v15[4] = self;
    v16 = v5;
    v14 = v5;
    -[ABCPersistentStoreController caseAttachmentsForDiagnosticCaseIDs:queue:reply:](storeController, "caseAttachmentsForDiagnosticCaseIDs:queue:reply:", v14, queue, v15);

  }
}

void __77__DiagnosticStorageManager_removeCaseStorageAndAttachmentsForCasesWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "deleteAttachmentsForCases:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeCaseStoragesWithCaseIDs:", *(_QWORD *)(a1 + 40));
  }

}

- (void)deleteAttachmentsForCases:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__DiagnosticStorageManager_deleteAttachmentsForCases___block_invoke;
    v6[3] = &unk_1EA3B6510;
    v6[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  }
  else
  {
    storageLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "Skipping deletion for empty attachments list.", buf, 2u);
    }

  }
}

void __54__DiagnosticStorageManager_deleteAttachmentsForCases___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1DF0B6314]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("caseID"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("caseAttachments"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase attachmentsFromStringRepresentation:](DiagnosticCase, "attachmentsFromStringRepresentation:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "deleteAttachmentFiles:", v7);
    storageLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218242;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "Deleted %lu attachment files for case %@", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_7;
  }
  storageLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = (uint64_t)v6;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "Found unexpected class %@ in cases array: %@", (uint8_t *)&v11, 0x16u);
LABEL_7:

  }
  objc_autoreleasePoolPop(v4);

}

- (void)deleteAttachmentsAtPaths:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__DiagnosticStorageManager_deleteAttachmentsAtPaths___block_invoke;
  v7[3] = &unk_1EA3B6538;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  storageLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v9[3];
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Deleted a total of %lu attachment files.", buf, 0xCu);
  }

  _Block_object_dispose(&v8, 8);
}

void __53__DiagnosticStorageManager_deleteAttachmentsAtPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "deleteAttachmentFiles:", v3);
  }
  else
  {
    storageLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_ERROR, "Found unexpected object of class %@ in attachments list (%@)", (uint8_t *)&v7, 0x16u);

    }
  }

}

- (unint64_t)deleteAttachmentFiles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__DiagnosticStorageManager_deleteAttachmentFiles___block_invoke;
  v8[3] = &unk_1EA3B5D30;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __50__DiagnosticStorageManager_deleteAttachmentFiles___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
    if (!v8)
    {
LABEL_12:

      goto LABEL_13;
    }
    v9 = *(void **)(a1 + 32);
    v17 = 0;
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v17);
    v11 = v17;
    v12 = v11;
    if (v10)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    else
    {
      objc_msgSend(v11, "domain");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15 == *MEMORY[0x1E0CB28A8] && objc_msgSend(v12, "code") != 4)
      {
        v16 = objc_msgSend(v12, "code");

        if (v16 == 260)
          goto LABEL_11;
        storageLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v7;
          v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_ERROR, "Failed to delete file at %@. (%@)", buf, 0x16u);
        }
      }

    }
LABEL_11:

    goto LABEL_12;
  }
  storageLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    NSStringFromClass((Class)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object of class %@ in attachments list (%@)", buf, 0x16u);

  }
  *a4 = 1;
LABEL_13:

}

- (void)purgeAttachmentsForAllCases
{
  OS_dispatch_queue *queue;
  ABCPersistentStoreController *storeController;
  _QWORD v4[5];

  queue = self->_queue;
  storeController = self->_storeController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__DiagnosticStorageManager_purgeAttachmentsForAllCases__block_invoke;
  v4[3] = &unk_1EA3B6560;
  v4[4] = self;
  -[ABCPersistentStoreController caseAttachmentsForAllDiagnosticCasesWithQueue:reply:](storeController, "caseAttachmentsForAllDiagnosticCasesWithQueue:reply:", queue, v4);
}

uint64_t __55__DiagnosticStorageManager_purgeAttachmentsForAllCases__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAttachmentsForCases:", a2);
}

- (void)cleanupCasesAfterACentralizedCacheDeletePurgeEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  ABCPersistentStoreController *storeController;
  OS_dispatch_queue *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  DiagnosticStorageManager *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  storageLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Cleanup cases after Centralized CD Purge for these files %@", buf, 0xCu);
  }

  if (!v4)
  {
    v8 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "count"))
  {
    v8 = (void *)objc_msgSend(v4, "copy");
LABEL_7:
    queue = self->_queue;
    storeController = self->_storeController;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__DiagnosticStorageManager_cleanupCasesAfterACentralizedCacheDeletePurgeEvent___block_invoke;
    v12[3] = &unk_1EA3B6588;
    v13 = v8;
    v14 = v5;
    v15 = v6;
    v16 = self;
    v11 = v8;
    -[ABCPersistentStoreController caseAttachmentsForAllDiagnosticCasesWithQueue:reply:](storeController, "caseAttachmentsForAllDiagnosticCasesWithQueue:reply:", queue, v12);

  }
}

void __79__DiagnosticStorageManager_cleanupCasesAfterACentralizedCacheDeletePurgeEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *context;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x1DF0B6314]();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("caseAttachments"));
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("caseID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v6;
        +[DiagnosticCase attachmentsFromStringRepresentation:](DiagnosticCase, "attachmentsFromStringRepresentation:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (!v10)
          goto LABEL_24;
        v11 = v10;
        v12 = *(_QWORD *)v30;
        while (2)
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
            objc_msgSend(v14, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(void **)(a1 + 32);
            if (v16)
            {
              if (objc_msgSend(v16, "containsObject:", v15))
              {
                storageLogHandle();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = (uint64_t)v7;
                  v19 = v17;
                  v20 = "Case %@ will be purged due to purged payload files";
                  goto LABEL_22;
                }
                goto LABEL_23;
              }
            }
            else if ((objc_msgSend(*(id *)(a1 + 48), "fileExistsAtPath:", v15) & 1) == 0)
            {
              storageLogHandle();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = (uint64_t)v7;
                v19 = v17;
                v20 = "Case %@ will be purged due to missing payload files";
LABEL_22:
                _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
              }
LABEL_23:

              objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
              goto LABEL_24;
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          if (v11)
            continue;
          break;
        }
LABEL_24:

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v27);
  }

  objc_autoreleasePoolPop(context);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    storageLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(*(id *)(a1 + 40), "count");
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v38 = v22;
      v39 = 2112;
      v40 = v23;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEFAULT, "Post Centralized CacheDelete cleanup for %lu cases: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "_purgeCasesWithCaseIDs:", *(_QWORD *)(a1 + 40));
  }

}

- (void)purgeDEPayloadForCase:(id)a3
{
  id v4;
  uint64_t v5;
  ABCPersistentStoreController *storeController;
  void *v7;
  OS_dispatch_queue *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "UUIDString");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
    }
  }
  storeController = self->_storeController;
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__DiagnosticStorageManager_purgeDEPayloadForCase___block_invoke;
  v10[3] = &unk_1EA3B6560;
  v11 = v4;
  v9 = v4;
  -[ABCPersistentStoreController caseAttachmentsForDiagnosticCaseIDs:queue:reply:](storeController, "caseAttachmentsForDiagnosticCaseIDs:queue:reply:", v7, queue, v10);

}

void __50__DiagnosticStorageManager_purgeDEPayloadForCase___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  const char *v23;
  uint32_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  unint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a2;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v41;
    *(_QWORD *)&v2 = 138412802;
    v28 = v2;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(obj);
        v33 = v3;
        v4 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v3);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v28);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", kStoredPayloadKeyAttachmentPaths);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        storageLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = objc_msgSend(v6, "count");
          *(_DWORD *)buf = 134217984;
          v45 = v8;
          _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Will purge %ld files.", buf, 0xCu);
        }

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
        if (!v10)
        {
          v34 = 0;
          v12 = 0;
          goto LABEL_35;
        }
        v11 = v10;
        v34 = 0;
        v12 = 0;
        v13 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            v15 = v12;
            if (*(_QWORD *)v37 != v13)
              objc_enumerationMutation(v9);
            v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              storageLogHandle();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v16;
                _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_INFO, "Will remove file at %@", buf, 0xCu);
              }

              v35 = v15;
              v18 = objc_msgSend(v5, "removeItemAtPath:error:", v16, &v35);
              v12 = v35;

              if (v18)
              {
                storageLogHandle();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v16;
                  _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEFAULT, "Removed file at %@", buf, 0xCu);
                }

                if ((objc_msgSend(v5, "fileExistsAtPath:", v16) & 1) != 0)
                {
                  storageLogHandle();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v45 = v16;
                    v21 = v20;
                    v22 = OS_LOG_TYPE_ERROR;
                    v23 = "This file should have been removed. Why is it still here??? - %@";
                    goto LABEL_28;
                  }
LABEL_30:

                  continue;
                }
                ++v34;
                storageLogHandle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  goto LABEL_30;
                *(_DWORD *)buf = 138412290;
                v45 = v16;
                v21 = v20;
                v22 = OS_LOG_TYPE_DEBUG;
                v23 = "Verified that %@ no longer exists.";
LABEL_28:
                v24 = 12;
              }
              else
              {
                if (objc_msgSend(v12, "code") == 4)
                  continue;
                storageLogHandle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  goto LABEL_30;
                *(_DWORD *)buf = 138412546;
                v45 = v16;
                v46 = 2112;
                v47 = (uint64_t)v12;
                v21 = v20;
                v22 = OS_LOG_TYPE_ERROR;
                v23 = "Unable to remove file at %@. (%@)";
                v24 = 22;
              }
              _os_log_impl(&dword_1DBAE1000, v21, v22, v23, buf, v24);
              goto LABEL_30;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
        }
        while (v11);
LABEL_35:

        if (v34 < objc_msgSend(v9, "count"))
        {
          storageLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = *(_QWORD *)(a1 + 32);
            v27 = objc_msgSend(v9, "count");
            *(_DWORD *)buf = v28;
            v45 = v26;
            v46 = 2048;
            v47 = v27;
            v48 = 2048;
            v49 = v34;
            _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_INFO, "Case %@ has %ld attachments but only %ld were removed.", buf, 0x20u);
          }

        }
        v3 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v32);
  }

}

- (void)_autoBugCaptureDiskUsageSize:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_lastCalculatedDiskUsageSize)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__DiagnosticStorageManager__autoBugCaptureDiskUsageSize___block_invoke;
    v6[3] = &unk_1EA3B65B0;
    v6[4] = self;
    v7 = v4;
    -[DiagnosticStorageManager _inspectAutoBugCaptureDiskUsage:](self, "_inspectAutoBugCaptureDiskUsage:", v6);

  }
}

void __57__DiagnosticStorageManager__autoBugCaptureDiskUsageSize___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SymptomsAttachmentsTotalSize"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SymptomsDiagExtAttachmentsTotalSize"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += v10 + objc_msgSend(v11, "unsignedIntegerValue");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  storageLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v5;
    _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "The total ABC disk usage size is %lu", buf, 0xCu);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v5;
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

- (void)_sortedAutoBugCaptureDiskUsageByCase:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSMutableArray *casesSortedByDate;
  NSMutableArray *v7;
  NSMutableArray *v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  casesSortedByDate = self->_casesSortedByDate;
  if (casesSortedByDate)
  {
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = self->_casesSortedByDate;
  self->_casesSortedByDate = v7;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__DiagnosticStorageManager__sortedAutoBugCaptureDiskUsageByCase___block_invoke;
  v9[3] = &unk_1EA3B5DF8;
  v9[4] = self;
  -[DiagnosticStorageManager _inspectAutoBugCaptureDiskUsage:](self, "_inspectAutoBugCaptureDiskUsage:", v9);
  if (v5)
  {
    casesSortedByDate = self->_casesSortedByDate;
LABEL_6:
    ((void (**)(_QWORD, NSMutableArray *))v5)[2](v5, casesSortedByDate);
  }
LABEL_7:

}

void __65__DiagnosticStorageManager__sortedAutoBugCaptureDiskUsageByCase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "length"))
        {
          v9 = objc_alloc(MEMORY[0x1E0C99E08]);
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "initWithDictionary:", v10);

          -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v8, CFSTR("caseID"));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v11);
        }
        else
        {
          storageLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v12 = 0;
            _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "A blank caseID from _gatherAutoBugCaptureDiskUsageStatistics()", v12, 2u);
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sortUsingComparator:", &__block_literal_global_16);

}

uint64_t __65__DiagnosticStorageManager__sortedAutoBugCaptureDiskUsageByCase___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("caseDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("caseDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_inspectAutoBugCaptureDiskUsage:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *payloadsByCaseID;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  char v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  ABCPersistentStoreController *storeController;
  OS_dispatch_queue *queue;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  DiagnosticStorageManager *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  id v61;
  DiagnosticStorageManager *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];
  _QWORD v79[5];

  v79[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_payloadsByCaseID)
  {
    if (v4)
      (*((void (**)(id))v4 + 2))(v4);
    goto LABEL_40;
  }
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  payloadsByCaseID = self->_payloadsByCaseID;
  self->_payloadsByCaseID = v6;

  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1DF0B6314]();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3600.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", self->_logArchivePath, 1);
  v11 = *MEMORY[0x1E0C998E8];
  v56 = *MEMORY[0x1E0C999D0];
  v79[0] = *MEMORY[0x1E0C999D0];
  v79[1] = v11;
  v58 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v53 = v8;
  objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v10, v12, 1, &v73);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v73;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (!v15)
    goto LABEL_39;
  v16 = v15;
  v46 = v9;
  v47 = self;
  v48 = v5;
  v17 = 0;
  v18 = 0;
  v57 = *(_QWORD *)v70;
  v52 = *MEMORY[0x1E0CB28A8];
  v51 = *MEMORY[0x1E0CB2FE0];
  v19 = v49;
  do
  {
    v20 = 0;
    do
    {
      v21 = v18;
      v22 = v17;
      if (*(_QWORD *)v70 != v57)
        objc_enumerationMutation(obj);
      v18 = *(id *)(*((_QWORD *)&v69 + 1) + 8 * v20);

      v23 = (void *)MEMORY[0x1DF0B6314]();
      v68 = 0;
      v24 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v68, v58, 0);
      v17 = v68;

      if (!v24 || objc_msgSend(v17, "compare:", v54) != 1)
      {
        v67 = 0;
        v26 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v67, v56, 0, v46, v47, v48);
        v27 = v67;
        v25 = v27;
        if (v26 && -[NSObject BOOLValue](v27, "BOOLValue"))
        {
          storageLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v18;
            _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_DEFAULT, "Found an errant directory (%@) in AutoBugCapture which will be deleted", buf, 0xCu);
          }

          v66 = v14;
          v29 = objc_msgSend(v53, "removeItemAtURL:error:", v18, &v66);
          v30 = v66;

          if ((v29 & 1) != 0)
            goto LABEL_29;
          storageLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v75 = v18;
            v76 = 2112;
            v77 = v30;
            _os_log_impl(&dword_1DBAE1000, v31, OS_LOG_TYPE_ERROR, "Unable to remove directory at %@ (%@)", buf, 0x16u);
          }

          objc_msgSend(v30, "domain");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v32, "isEqualToString:", v52) && objc_msgSend(v30, "code") == 513)
          {

            goto LABEL_35;
          }
          objc_msgSend(v30, "domain");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v36, "isEqualToString:", v51) & 1) != 0)
          {
            v37 = objc_msgSend(v30, "code");

            v38 = v37 == 13;
            v19 = v49;
            if (!v38)
              goto LABEL_29;
LABEL_35:
            objc_msgSend(v18, "path");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v32);
          }
          else
          {

          }
        }
        else
        {
          objc_msgSend(v18, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "rangeOfString:", CFSTR("/private"));
          if (v33 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v32, "substringFromIndex:", v33 + v34);
            v35 = objc_claimAutoreleasedReturnValue();

            v32 = (void *)v35;
          }
          if (objc_msgSend(v32, "length"))
            objc_msgSend(v19, "addObject:", v32);
          v30 = v14;
        }

LABEL_29:
        v14 = v30;
        goto LABEL_30;
      }
      storageLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v75 = v18;
        v76 = 2112;
        v77 = v17;
        _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_INFO, "This item (%@) will NOT be deleted because it's too young (%@)", buf, 0x16u);
      }
LABEL_30:

      objc_autoreleasePoolPop(v23);
      ++v20;
    }
    while (v16 != v20);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    v16 = v39;
  }
  while (v39);

  self = v47;
  v5 = v48;
  v9 = v46;
LABEL_39:

  objc_autoreleasePoolPop(v9);
  queue = self->_queue;
  storeController = self->_storeController;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __60__DiagnosticStorageManager__inspectAutoBugCaptureDiskUsage___block_invoke;
  v59[3] = &unk_1EA3B65F8;
  v60 = v53;
  v61 = v49;
  v62 = self;
  v63 = v14;
  v64 = v50;
  v65 = v5;
  v42 = v50;
  v43 = v14;
  v44 = v49;
  v45 = v53;
  -[ABCPersistentStoreController caseAttachmentsForAllDiagnosticCasesWithQueue:reply:](storeController, "caseAttachmentsForAllDiagnosticCasesWithQueue:reply:", queue, v59);

LABEL_40:
}

void __60__DiagnosticStorageManager__inspectAutoBugCaptureDiskUsage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  id v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  BOOL v52;
  NSObject *v53;
  uint64_t v54;
  ABCFileCleaner *v55;
  uint64_t v56;
  void *context;
  id obj;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t v87[128];
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x1DF0B6314]();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v3;
  v71 = a1;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v84 != v59)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1DF0B6314]();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("caseID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("caseAttachments"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[DiagnosticCase attachmentsFromStringRepresentation:](DiagnosticCase, "attachmentsFromStringRepresentation:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          v60 = v5;
          v63 = v8;
          v64 = v7;
          v65 = v6;
          v66 = i;
          v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v62 = v9;
          v69 = v9;
          v10 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
          if (v10)
          {
            v11 = v10;
            v12 = 0;
            v13 = *(_QWORD *)v80;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v80 != v13)
                  objc_enumerationMutation(v69);
                v15 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
                v16 = (void *)MEMORY[0x1DF0B6314]();
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v15);
                objc_msgSend(v17, "path");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "rangeOfString:", CFSTR("/private"));
                if (v19 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(v18, "substringFromIndex:", v19 + v20);
                  v21 = objc_claimAutoreleasedReturnValue();

                  v18 = (void *)v21;
                  a1 = v71;
                }
                v22 = *(void **)(a1 + 32);
                v78 = 0;
                objc_msgSend(v22, "attributesOfItemAtPath:error:", v18, &v78);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v78;
                v25 = v24;
                if (v23)
                {
                  v12 += objc_msgSend(v23, "fileSize");
                }
                else if (v24)
                {
                  storageLogHandle();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v89 = (uint64_t)v18;
                    v90 = 2112;
                    v91 = v25;
                    _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEBUG, "Unable to inspect attributes of file at %@. (%@)", buf, 0x16u);
                  }

                  a1 = v71;
                }
                objc_msgSend(v72, "addObject:", v18);
                if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v18))
                  objc_msgSend(*(id *)(a1 + 40), "removeObject:", v18);

                objc_autoreleasePoolPop(v16);
              }
              v11 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
            }
            while (v11);
          }
          else
          {
            v12 = 0;
          }

          i = v66;
          v7 = v64;
          v9 = v62;
          if (objc_msgSend(v72, "count"))
          {
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("caseClosedTime"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v64)
            {
              v28 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)objc_msgSend(v28, "initWithObjectsAndKeys:", v72, CFSTR("SymptomsAttachments"), v29, CFSTR("SymptomsAttachmentsTotalSize"), v27, CFSTR("caseDate"), 0, context);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "setObject:forKeyedSubscript:", v30, v64);

            }
          }

          v6 = v65;
          v8 = v63;
        }

        objc_autoreleasePoolPop(v6);
      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
    }
    while (v61);
  }

  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v32 = *(id *)(a1 + 40);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v75;
    v68 = *MEMORY[0x1E0CB28A8];
    v67 = *MEMORY[0x1E0CB2FE0];
    do
    {
      v36 = 0;
      v70 = (id)v34;
      do
      {
        if (*(_QWORD *)v75 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v36);
        v38 = (void *)MEMORY[0x1DF0B6314]();
        storageLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v89 = (uint64_t)v37;
          _os_log_impl(&dword_1DBAE1000, v39, OS_LOG_TYPE_DEBUG, "Will remove orphaned file at %@", buf, 0xCu);
        }

        v40 = *(void **)(v71 + 32);
        v73 = 0;
        v41 = objc_msgSend(v40, "removeItemAtPath:error:", v37, &v73);
        v42 = v73;
        v43 = v42;
        if (v41)
        {
          storageLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v89 = (uint64_t)v37;
            _os_log_impl(&dword_1DBAE1000, v44, OS_LOG_TYPE_DEFAULT, "Removed orphaned file at %@", buf, 0xCu);
          }

        }
        else
        {
          if (objc_msgSend(v42, "code") == 4)
            goto LABEL_55;
          v45 = v35;
          v46 = v32;
          storageLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v89 = (uint64_t)v37;
            v90 = 2112;
            v91 = v43;
            _os_log_impl(&dword_1DBAE1000, v47, OS_LOG_TYPE_ERROR, "Unable to remove orphaned file at %@. (%@)", buf, 0x16u);
          }

          objc_msgSend(*(id *)(v71 + 56), "domain");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v48, "isEqualToString:", v68)
            && objc_msgSend(*(id *)(v71 + 56), "code") == 513)
          {

            v35 = v45;
            v34 = (uint64_t)v70;
LABEL_53:
            objc_msgSend(v31, "addObject:", v37);
            goto LABEL_55;
          }
          objc_msgSend(*(id *)(v71 + 56), "domain");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v49, "isEqualToString:", v67) & 1) != 0)
          {
            v50 = v31;
            v51 = objc_msgSend(*(id *)(v71 + 56), "code");

            v52 = v51 == 13;
            v31 = v50;
            v32 = v46;
            v35 = v45;
            v34 = (uint64_t)v70;
            if (v52)
              goto LABEL_53;
          }
          else
          {

            v35 = v45;
            v34 = (uint64_t)v70;
          }
        }
LABEL_55:

        objc_autoreleasePoolPop(v38);
        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    }
    while (v34);
  }

  objc_msgSend(v31, "addObjectsFromArray:", *(_QWORD *)(v71 + 64));
  if (objc_msgSend(v31, "count"))
  {
    storageLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v54 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 134217984;
      v89 = v54;
      _os_log_impl(&dword_1DBAE1000, v53, OS_LOG_TYPE_DEBUG, "Will use netdiagnose to clean up %lu orphans and folders", buf, 0xCu);
    }

    v55 = -[ABCFileCleaner initWithQueue:]([ABCFileCleaner alloc], "initWithQueue:", 0);
    objc_msgSend(*(id *)(v71 + 48), "setAbcCleaner:", v55);

    objc_msgSend(*(id *)(*(_QWORD *)(v71 + 48) + 56), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(v71 + 48) + 56), "cleanupFiles:", v31);
  }

  objc_autoreleasePoolPop(context);
  v56 = *(_QWORD *)(v71 + 72);
  if (v56)
    (*(void (**)(uint64_t, _QWORD))(v56 + 16))(v56, *(_QWORD *)(*(_QWORD *)(v71 + 48) + 24));

}

- (void)fileCleanupComplete
{
  NSObject *v3;
  uint8_t v4[16];

  storageLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "File cleanup using netdiagnose completed", v4, 2u);
  }

  -[DiagnosticStorageManager setAbcCleaner:](self, "setAbcCleaner:", 0);
}

- (void)didSaveDiagnosticCases
{
  -[DiagnosticStorageManager performPurgeToMeetDiskUsageLimit:calculateOnly:](self, "performPurgeToMeetDiskUsageLimit:calculateOnly:", -[DiagnosticStorageManager allowableDiskUsageSize](self, "allowableDiskUsageSize"), 0);
}

- (void)purgeAttachmentsAtPaths:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__DiagnosticStorageManager_purgeAttachmentsAtPaths___block_invoke;
  v7[3] = &unk_1EA3B5010;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __52__DiagnosticStorageManager_purgeAttachmentsAtPaths___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAttachmentsAtPaths:", *(_QWORD *)(a1 + 40));
}

- (ABCFileCleaner)abcCleaner
{
  return self->_abcCleaner;
}

- (void)setAbcCleaner:(id)a3
{
  objc_storeStrong((id *)&self->_abcCleaner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abcCleaner, 0);
  objc_storeStrong((id *)&self->_logArchivePath, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_payloadsByCaseID, 0);
  objc_storeStrong((id *)&self->_casesSortedByDate, 0);
}

@end
