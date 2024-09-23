@implementation FCRemoveRecordsCommand

- (FCRemoveRecordsCommand)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCRemoveRecordsCommand init]";
    v9 = 2080;
    v10 = "FCRemoveRecordsCommand.m";
    v11 = 1024;
    v12 = 42;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCRemoveRecordsCommand init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCRemoveRecordsCommand)initWithRecordIDs:(id)a3
{
  id v4;
  FCRemoveRecordsCommand *v5;
  uint64_t v6;
  NSArray *recordIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCRemoveRecordsCommand;
  v5 = -[FCRemoveRecordsCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v6;

  }
  return v5;
}

- (FCRemoveRecordsCommand)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  FCRemoveRecordsCommand *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("recordIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FCRemoveRecordsCommand initWithRecordIDs:](self, "initWithRecordIDs:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *recordIDs;

  if (self)
    recordIDs = self->_recordIDs;
  else
    recordIDs = 0;
  objc_msgSend(a3, "encodeObject:forKey:", recordIDs, CFSTR("recordIDs"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  FCRemoveRecordsCommand *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "networkReachability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCloudKitReachable");

  if (v11)
  {
    objc_msgSend(v8, "internalPrivateDataContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__FCRemoveRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
    v17[3] = &unk_1E4643C80;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = a5;
    objc_msgSend(v12, "prepareRecordZonesForUseWithCompletionHandler:", v17);

  }
  else
  {
    v13 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will not execute because CloudKit is not reachable", buf, 0x16u);

    }
    objc_msgSend(v9, "command:didFinishWithStatus:", self, 1);
  }

}

void __71__FCRemoveRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  FCArrayStream *v5;
  uint64_t v6;
  uint64_t v7;
  FCArrayStream *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      v9 = v4;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      v17 = 2114;
      v18 = v3;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "<%{public}@ %p> failed to prepare zones for use with error: %{public}@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "statusForCloudKitError:", v3));
  }
  else
  {
    v5 = [FCArrayStream alloc];
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(_QWORD *)(v6 + 8);
    else
      v7 = 0;
    v8 = -[FCArrayStream initWithArray:](v5, "initWithArray:", v7);
    -[FCRemoveRecordsCommand handleRecordIDsFromStream:context:delegate:qualityOfService:](*(_QWORD *)(a1 + 32), v8, *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

- (void)handleRecordIDsFromStream:(void *)a3 context:(void *)a4 delegate:(uint64_t)a5 qualityOfService:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke;
    aBlock[3] = &unk_1E4643CD0;
    aBlock[4] = a1;
    v17 = v10;
    v20 = a5;
    v12 = v9;
    v18 = v12;
    v19 = v11;
    v13 = _Block_copy(aBlock);
    FCDispatchQueueForQualityOfService(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v12, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", 100, a5, v14, v13);

  }
}

void __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  int v17;
  id v18;
  _QWORD *v19;
  void (**v20)(_QWORD);
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[2];
  uint64_t (*v30)(uint64_t, uint64_t);
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE aBlock[24];
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_QWORD *)(a1 + 64);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v30 = __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke_2;
  v31 = &unk_1E4643CA8;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v32 = v8;
  v33 = v9;
  v34 = v10;
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v35 = v11;
  v36 = v12;
  v13 = a2;
  v14 = v4;
  v15 = v29;
  if (v5)
  {
    objc_msgSend(v14, "networkReachability");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isCloudKitReachable");

    if (v17)
    {
      *(_QWORD *)aBlock = v6;
      *(_QWORD *)&aBlock[8] = 3221225472;
      *(_QWORD *)&aBlock[16] = __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke;
      v42 = &unk_1E4644EF0;
      v18 = v13;
      v47 = v7;
      v43 = v18;
      v44 = v5;
      v19 = v15;
      v46 = v19;
      v45 = v14;
      v20 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (objc_msgSend(v18, "count"))
      {
        v20[2](v20);
      }
      else
      {
        v25 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v25;
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v28;
          v39 = 2048;
          v40 = v5;
          _os_log_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> succeeded because there are no record IDs to delete", buf, 0x16u);

        }
        v30((uint64_t)v19, 0);
      }

    }
    else
    {
      v21 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)aBlock = 138543618;
        *(_QWORD *)&aBlock[4] = v24;
        *(_WORD *)&aBlock[12] = 2048;
        *(_QWORD *)&aBlock[14] = v5;
        _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> skipping work because CloudKit is not available", aBlock, 0x16u);

      }
      v30((uint64_t)v15, 1);
    }
  }

}

uint64_t __86__FCRemoveRecordsCommand_handleRecordIDsFromStream_context_delegate_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 || (objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 56), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 40), a2);
  else
    return -[FCRemoveRecordsCommand handleRecordIDsFromStream:context:delegate:qualityOfService:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke(uint64_t a1)
{
  FCCKPrivateDeleteRecordsOperation *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(FCCKPrivateDeleteRecordsOperation);
  -[FCCKPrivateDeleteRecordsOperation setRecordIDsToDelete:](v2, "setRecordIDsToDelete:", *(_QWORD *)(a1 + 32));
  -[FCOperation setQualityOfService:](v2, "setQualityOfService:", *(_QWORD *)(a1 + 64));
  v3 = *(_QWORD *)(a1 + 64);
  v4 = v3 == 33 || v3 == 25;
  if (v3 == 9)
    v5 = -1;
  else
    v5 = v4;
  -[FCOperation setRelativePriority:](v2, "setRelativePriority:", v5);
  -[FCOperation operationID](v2, "operationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform delete operation, operationID=%{public}@", buf, 0x20u);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke_15;
  v15[3] = &unk_1E4643CF8;
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = v6;
  v17 = *(id *)(a1 + 56);
  v12 = v6;
  -[FCCKPrivateDeleteRecordsOperation setDeleteRecordsCompletionBlock:](v2, "setDeleteRecordsCompletionBlock:", v15);
  objc_msgSend(*(id *)(a1 + 48), "internalPrivateDataContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "privateDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v14, v2);

}

void __85__FCRemoveRecordsCommand_handleBatchOfRecordIDs_context_qualityOfService_completion___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "fc_isCKUnknownItemError") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if (v4)
    {
      v6 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
      {
        v14 = v6;
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        v21 = 2048;
        v22 = v17;
        v23 = 2114;
        v24 = v4;
        _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error deleting records: %{public}@", buf, 0x20u);

      }
    }
    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)FCRemoveRecordsCommand;
    v5 = objc_msgSendSuper2(&v18, sel_statusForCloudKitError_, v4);
  }
  v7 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    FCCommandStatusDescription((uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> did perform delete operation, operationID=%{public}@, status=%{public}@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)coalesceWithCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *recordIDs;
  uint64_t v9;
  const char *v10;
  void *v11;
  _QWORD *v12;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v12 = v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self)
    recordIDs = self->_recordIDs;
  else
    recordIDs = 0;
  objc_msgSend(v6, "addObjectsFromArray:", recordIDs);
  if (v12)
    v9 = v12[1];
  else
    v9 = 0;
  objc_msgSend(v7, "addObjectsFromArray:", v9);
  objc_msgSend(v7, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_nonatomic_copy(self, v10, v11, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
