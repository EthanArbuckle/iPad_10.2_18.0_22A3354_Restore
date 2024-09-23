@implementation HDDaemonSyncMessageHandler

- (HDDaemonSyncMessageHandler)initWithSyncEntityClass:(Class)a3 anchorRange:(HDSyncAnchorRange)a4 session:(id)a5 requiredAnchorMap:(id)a6
{
  int64_t end;
  int64_t start;
  id v12;
  id v13;
  HDDaemonSyncMessageHandler *v14;
  HDDaemonSyncMessageHandler *v15;
  uint64_t v16;
  HDSyncAnchorMap *requiredAnchorMap;
  NSMutableArray *changes;
  objc_super v20;

  end = a4.end;
  start = a4.start;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDDaemonSyncMessageHandler;
  v14 = -[HDDaemonSyncMessageHandler init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_syncEntityClass = a3;
    v14->_anchorRange.start = start;
    v14->_anchorRange.end = end;
    v14->_lastAnchor = start;
    v14->_currentAnchor = start;
    objc_storeStrong((id *)&v14->_session, a5);
    v16 = objc_msgSend(v13, "copy");
    requiredAnchorMap = v15->_requiredAnchorMap;
    v15->_requiredAnchorMap = (HDSyncAnchorMap *)v16;

    v15->_sendChangesStatus = 1;
    v15->_done = 0;
    changes = v15->_changes;
    v15->_changes = 0;

    v15->_accumulatedChangeSetSize = 0;
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *changes;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  HDDaemonSyncMessageHandler *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_changes, "count"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      changes = self->_changes;
      v5 = v3;
      *(_DWORD *)buf = 138412546;
      v8 = self;
      v9 = 2048;
      v10 = -[NSMutableArray count](changes, "count");
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "%@ has %ld changes that must be sent prior to deallocation", buf, 0x16u);

    }
  }
  v6.receiver = self;
  v6.super_class = (Class)HDDaemonSyncMessageHandler;
  -[HDDaemonSyncMessageHandler dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDSyncSession shortSessionIdentifier](self->_session, "shortSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@ %lld -> %lld, %lld>"), v4, self, v5, self->_syncEntityClass, self->_anchorRange.start, self->_anchorRange.end, self->_currentAnchor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)sendCodableChange:(id)a3 resultAnchor:(int64_t)a4 sequence:(int64_t)a5 done:(BOOL)a6 error:(id *)a7
{
  return -[HDDaemonSyncMessageHandler sendCodableChange:version:resultAnchor:sequence:done:error:](self, "sendCodableChange:version:resultAnchor:sequence:done:error:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)sendCodableChange:(id)a3 version:(id)a4 resultAnchor:(int64_t)a5 sequence:(int64_t)a6 done:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v8;
  id v14;
  void *v15;
  void *v16;
  int64_t start;
  int64_t end;
  const char *v19;
  char v20;
  void *v22;
  void *v23;
  Class syncEntityClass;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  Class v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v8 = a7;
  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  if (self->_done)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemonSyncMessageHandler.m"), 94, CFSTR("%@ is already done"), self);

  }
  self->_done = v8;
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    syncEntityClass = self->_syncEntityClass;
    v25 = v15;
    HDSyncVersionRangeToString(*(_QWORD *)&a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    start = self->_anchorRange.start;
    end = self->_anchorRange.end;
    if (v8)
      v19 = "final";
    else
      v19 = "interim";
    *(_DWORD *)buf = 138545154;
    v29 = syncEntityClass;
    v30 = 2114;
    v31 = v16;
    v32 = 2048;
    v33 = start;
    v34 = 2048;
    v35 = end;
    v36 = 2080;
    v37 = v19;
    v38 = 2048;
    v39 = a5;
    v40 = 2048;
    v41 = objc_msgSend(v14, "count");
    v42 = 2048;
    v43 = a6;
    _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "Sync for %{public}@ (Version: %{public}@) from %lld -> %lld produced %s result anchor %lld and %lu objects with sequence %lld.", buf, 0x52u);

  }
  if (a6 || self->_currentAnchor != a5)
  {
    if (self->_anchorRange.end < a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDaemonSyncMessageHandler.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultAnchor <= _anchorRange.end"));

    }
    v27 = v14;
    v20 = HKWithAutoreleasePool();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a8, 100, CFSTR("syncObjectsWithStore failed to update result anchor for entity type %@."), self->_syncEntityClass);
    -[NSMutableArray removeAllObjects](self->_changes, "removeAllObjects");
    v20 = 0;
  }

  return v20;
}

uint64_t __89__HDDaemonSyncMessageHandler_sendCodableChange_version_resultAnchor_sequence_done_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  if (!*(_QWORD *)(a1 + 48))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sequenceNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSequenceNumber:done:", objc_msgSend(v5, "longLongValue"), 1);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "newChangeWithSyncEntityClass:version:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 64));
    v7 = *(_QWORD *)(a1 + 40);
    v8 = HDSyncAnchorRangeMake(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(a1 + 56));
    objc_msgSend(v6, "setObjects:syncAnchorRange:requiredAnchorMap:", v7, v8, v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v6, "setSequenceNumber:done:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 64);
      *(_QWORD *)(v11 + 64) = v10;

    }
    v13 = objc_msgSend(v6, "encodedByteCount");
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "maxEncodedBytesPerChangeSetForSyncEntityClass:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v15 + 72) + v13;
    if (v16 <= v14)
    {
      *(_QWORD *)(v15 + 72) = v16;
    }
    else
    {
      if (!-[HDDaemonSyncMessageHandler _sendChangesWithError:](v15, a2))
      {

        return 0;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v13;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hk_addNonNilObject:", v6);

  }
  if (!*(_BYTE *)(a1 + 72)
    || (result = -[HDDaemonSyncMessageHandler _sendChangesWithError:](*(_QWORD *)(a1 + 32), a2), (_DWORD)result))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(a1 + 56);
    return 1;
  }
  return result;
}

- (uint64_t)_sendChangesWithError:(uint64_t)a1
{
  NSObject *v4;
  const char *v5;
  void *v6;
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  _BOOL8 v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE buf[24];
  void *v34;
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!objc_msgSend(*(id *)(a1 + 64), "count"))
    return 1;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = "final";
    if (!*(_BYTE *)(a1 + 48))
      v5 = "accumulated";
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempt sending %s changes", buf, 0x16u);
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 64);
  v8 = v6;
  objc_opt_self();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__200;
  v27 = __Block_byref_object_dispose__200;
  v28 = 0;
  v9 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __57__HDDaemonSyncMessageHandler__sendChanges_session_error___block_invoke;
  v34 = &unk_1E6D0FF18;
  v36 = &v29;
  v37 = &v23;
  v10 = v9;
  v35 = v10;
  objc_msgSend(v8, "sendChanges:completion:", v7, buf);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (void *)v24[5];
  v12 = v11;
  v13 = v12;
  if (v12)
    v14 = objc_retainAutorelease(v12);

  v15 = v30[3];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  v16 = v13;
  objc_msgSend(*(id *)(a1 + 64), "removeAllObjects");
  v17 = v15 != 0;
  if (v15)
  {
    if (v15 == 2)
      *(_QWORD *)(a1 + 96) = 2;
  }
  else
  {
    v18 = v16;
    if (v13)
    {
      v19 = v18;
      if (a2)
        *a2 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();

      *(_QWORD *)(a1 + 96) = 0;
      objc_storeStrong((id *)(a1 + 104), v11);
    }
    else
    {
      *(_QWORD *)(a1 + 96) = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Sending changes failed but did not provide an error."));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v20;

    }
  }

  return v17;
}

void __57__HDDaemonSyncMessageHandler__sendChanges_session_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)abandonUnsentChangesForError:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *changes;
  NSObject *v7;
  int v8;
  HDDaemonSyncMessageHandler *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_changes, "count"))
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      changes = self->_changes;
      v7 = v5;
      v8 = 138543874;
      v9 = self;
      v10 = 2048;
      v11 = -[NSMutableArray count](changes, "count");
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "%{public}@ Abandoning %ld due to an error during generation: %{public}@", (uint8_t *)&v8, 0x20u);

    }
    -[NSMutableArray removeAllObjects](self->_changes, "removeAllObjects");
  }

}

- (int64_t)currentAnchor
{
  return self->_currentAnchor;
}

- (int64_t)sendChangesStatus
{
  return self->_sendChangesStatus;
}

- (NSError)sendChangesError
{
  return self->_sendChangesError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendChangesError, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_requiredAnchorMap, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
