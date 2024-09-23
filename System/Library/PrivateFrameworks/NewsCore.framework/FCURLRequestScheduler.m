@implementation FCURLRequestScheduler

- (FCURLRequestScheduler)initWithURLSession:(id)a3
{
  id v5;
  FCURLRequestScheduler *v6;
  FCURLRequestScheduler *v7;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *requests;
  uint64_t v10;
  NSMapTable *inFlightURLTasks;
  NFUnfairLock *v12;
  NFUnfairLock *lock;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCURLRequestScheduler;
  v6 = -[FCURLRequestScheduler init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URLSession, a3);
    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    requests = v7->_requests;
    v7->_requests = v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    inFlightURLTasks = v7->_inFlightURLTasks;
    v7->_inFlightURLTasks = (NSMapTable *)v10;

    v12 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E0D60B18]);
    lock = v7->_lock;
    v7->_lock = v12;

    objc_msgSend(v5, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_maxInFlightURLTasks = 2 * objc_msgSend(v14, "HTTPMaximumConnectionsPerHost");

    v7->_maxInFlightLowPriorityURLTasks = v7->_maxInFlightURLTasks;
  }

  return v7;
}

- (id)scheduleURLRequest:(id)a3 destination:(int64_t)a4 priority:(int64_t)a5 loggingKey:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  FCURLRequest *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSURLRequest *URLRequest;
  uint64_t v23;
  NSDate *dateInitiated;
  uint64_t v25;
  NSString *loggingKey;
  uint64_t v27;
  id completion;
  NFUnfairLock *lock;
  uint64_t v30;
  FCURLRequest *v31;
  FCURLRequest *v32;
  void *v33;
  FCURLRequest *v34;
  void *v35;
  FCPseudoOperation *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  FCPseudoOperation *v41;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void *v46;
  FCURLRequestScheduler *v47;
  FCURLRequest *v48;
  _QWORD aBlock[5];
  FCURLRequest *v50;
  _QWORD v51[5];
  FCURLRequest *v52;
  objc_super v53;

  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = [FCURLRequest alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  if (v15)
  {
    v53.receiver = v15;
    v53.super_class = (Class)FCURLRequest;
    v15 = -[FCURLRequestScheduler init](&v53, sel_init);
    if (v15)
    {
      v21 = objc_msgSend(v17, "copy");
      URLRequest = v15->_URLRequest;
      v15->_URLRequest = (NSURLRequest *)v21;

      v15->_destination = a4;
      v15->_priority = a5;
      v23 = objc_msgSend(v18, "copy");
      dateInitiated = v15->_dateInitiated;
      v15->_dateInitiated = (NSDate *)v23;

      v25 = objc_msgSend(v19, "copy");
      loggingKey = v15->_loggingKey;
      v15->_loggingKey = (NSString *)v25;

      v27 = objc_msgSend(v20, "copy");
      completion = v15->_completion;
      v15->_completion = (id)v27;

      v15->_remainingRetries = 2;
    }
  }

  if (self)
    lock = self->_lock;
  else
    lock = 0;
  v30 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke;
  v51[3] = &unk_1E463AD10;
  v51[4] = self;
  v31 = v15;
  v52 = v31;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v51);
  aBlock[0] = v30;
  aBlock[1] = 3221225472;
  aBlock[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_2;
  aBlock[3] = &unk_1E463AD10;
  aBlock[4] = self;
  v32 = v31;
  v50 = v32;
  v33 = _Block_copy(aBlock);
  v43 = v30;
  v44 = 3221225472;
  v45 = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_4;
  v46 = &unk_1E463B3E0;
  v47 = self;
  v48 = v32;
  v34 = v32;
  v35 = _Block_copy(&v43);
  v36 = [FCPseudoOperation alloc];
  v37 = (objc_class *)objc_opt_class();
  NSStringFromClass(v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (objc_class *)objc_opt_class();
  NSStringFromClass(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[FCPseudoOperation initWithCancelBlock:priorityBlock:shortDescription:longDescription:](v36, "initWithCancelBlock:priorityBlock:shortDescription:longDescription:", v33, v35, v38, v40, v43, v44, v45, v46, v47);

  return v41;
}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = v2;
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
    v5 = (_QWORD *)v5[2];
  v7 = v5;
  v8 = objc_msgSend(v7, "count");
  objc_opt_self();
  v9 = objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v8, 1024, &__block_literal_global_44_4);

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 16);
  else
    v11 = 0;
  objc_msgSend(v11, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), v9);
  -[FCURLRequestScheduler _serviceRequests](*(_QWORD *)(a1 + 32));
}

- (void)_serviceRequests
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  if (a1 && objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__42;
    v23 = __Block_byref_object_dispose__42;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__42;
    v17 = __Block_byref_object_dispose__42;
    v18 = 0;
    v2 = *(id *)(a1 + 16);
    objc_msgSend(v2, "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v11[5] = &v13;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_10;
    v12[3] = &unk_1E46455B8;
    v12[4] = a1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_2;
    v11[3] = &unk_1E463F498;
    v11[4] = &v19;
    objc_msgSend(v3, "fc_splitArrayWithTest:result:", v12, v11);

    v5 = objc_msgSend((id)v14[5], "count");
    v6 = (void *)v20[5];
    if (v5)
    {
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_3;
      v10[3] = &unk_1E46455E0;
      v10[4] = a1;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
      v7 = (void *)v14[5];
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_4;
      v9[3] = &unk_1E46455E0;
      v9[4] = a1;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);
    }
    else
    {
      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __41__FCURLRequestScheduler__serviceRequests__block_invoke_5;
      v8[3] = &unk_1E46455E0;
      v8[4] = a1;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
    }
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }
}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 48);
  else
    v2 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_3;
  v3[3] = &unk_1E463AD10;
  v3[4] = v1;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performWithLockSync:", v3);

}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BYTE v10[24];
  void *v11;
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1 && objc_msgSend(*(id *)(v1 + 16), "containsObject:", v2))
  {
    objc_msgSend(*(id *)(v1 + 24), "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 16), "removeObject:", v2);
    objc_msgSend(*(id *)(v1 + 24), "removeObjectForKey:", v2);
    if (v3)
    {
      v4 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        if (v2)
          v5 = (void *)v2[5];
        else
          v5 = 0;
        v6 = v5;
        v7 = v4;
        objc_msgSend(v3, "longOperationDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v10 = 138543618;
        *(_QWORD *)&v10[4] = v5;
        *(_WORD *)&v10[12] = 2114;
        *(_QWORD *)&v10[14] = v8;
        _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will cancel URL task %{public}@", v10, 0x16u);

      }
      objc_msgSend(v3, "cancel");
      -[FCURLRequestScheduler _serviceRequests](v1);
    }
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v2 && v2[6])
    {
      *(_QWORD *)v10 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v10[8] = 3221225472;
      *(_QWORD *)&v10[16] = __40__FCURLRequestScheduler__cancelRequest___block_invoke;
      v11 = &unk_1E463AB18;
      v12 = v2;
      dispatch_async(v9, v10);

    }
  }

}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 48);
  else
    v3 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_5;
  v4[3] = &unk_1E463D0E0;
  v4[4] = v2;
  v6 = a2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performWithLockSync:", v4);

}

void __87__FCURLRequestScheduler_scheduleURLRequest_destination_priority_loggingKey_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)*(id *)(a1 + 40);
  v4 = v3;
  if (v2)
  {
    v5 = v3 ? v3[3] : 0;
    if (v5 != v1)
    {
      v10 = v3;
      objc_msgSend(*(id *)(v2 + 24), "objectForKey:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "setRelativePriority:", v1);
      v8 = *(id *)(v2 + 16);
      objc_opt_self();
      objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_44_4);

      if (v10)
      {
        v9 = v10[3];
        if (v9 > -2)
        {
          if (v1 < 0 == (v9 == -1))
            goto LABEL_11;
        }
        else if (v1 < 0)
        {
LABEL_11:

          v4 = v10;
          goto LABEL_12;
        }
      }
      else if ((v1 & 0x8000000000000000) == 0)
      {
        goto LABEL_11;
      }
      -[FCURLRequestScheduler _serviceRequests](v2);
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  char *v7;
  char *v8;
  objc_super v9;

  if ((void *)FCURLRequestSchedulerKVOContext == a6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4, a5);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v8 = v7;
      objc_setProperty_nonatomic_copy(self, v7, v7, 56);
      v7 = v8;
    }

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FCURLRequestScheduler;
    -[FCURLRequestScheduler observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __41__FCURLRequestScheduler__serviceRequests__block_invoke_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 24) >> 63;
  else
    LODWORD(v2) = 0;
  if (*(_QWORD *)(a1 + 32))
    return v2;
  else
    return 0;
}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    objc_msgSend(*(id *)(v2 + 24), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      v7 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        if (v3)
          v8 = (void *)v3[5];
        else
          v8 = 0;
        v9 = v8;
        v10 = v7;
        objc_msgSend(v6, "longOperationDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v8;
        v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ will cancel URL task %{public}@ to make way for higher-priority requests", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(*(id *)(v2 + 24), "removeObjectForKey:", v3);
      objc_msgSend(v6, "cancel");

    }
  }

}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v12 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[3];
  v7 = v6;
  v8 = objc_msgSend(v7, "count");
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10 = v8;
    v11 = *(_QWORD *)(v9 + 32);
    *a4 = v8 >= v11;

    if (v10 < v11)
      -[FCURLRequestScheduler _resumeURLTaskForRequest:](*(_QWORD *)(a1 + 32), v12);
  }
  else
  {
    *a4 = 1;

  }
}

- (void)_resumeURLTaskForRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, void *);
  void *v24;
  uint64_t v25;
  id *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_17;
  objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  v34 = 0;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_2;
  v24 = &unk_1E4645630;
  v25 = a1;
  v28 = &v29;
  v6 = (id *)v3;
  v26 = v6;
  v7 = v5;
  v27 = v7;
  v8 = _Block_copy(&v21);
  if (!v6)
  {
    v10 = *(id *)(a1 + 8);
    v13 = 0;
    goto LABEL_8;
  }
  v9 = v6[2];
  if (!v9)
  {
    v10 = *(id *)(a1 + 8);
    v13 = v6[1];
LABEL_8:
    v11 = v13;
    objc_msgSend(v10, "downloadTaskWithRequest:completionHandler:", v11, v8, v21, v22, v23, v24, v25, v26);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v9 == (id)1)
  {
    v10 = *(id *)(a1 + 8);
    v11 = v6[1];
    objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v11, v8, v21, v22, v23, v24, v25, v26);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v14 = (void *)v30[5];
    v30[5] = v12;

  }
  v15 = *(id *)(a1 + 24);
  objc_msgSend(v15, "setObject:forKey:", v30[5], v6);

  if (v6)
    v16 = v6[3];
  else
    v16 = 0;
  objc_msgSend((id)v30[5], "setRelativePriority:", v16, v21, v22, v23, v24, v25);
  objc_msgSend((id)v30[5], "addObserver:forKeyPath:options:context:", a1, CFSTR("countOfBytesReceived"), 0, FCURLRequestSchedulerKVOContext);
  v17 = (id)FCOperationLog;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v18 = v6[5];
    else
      v18 = 0;
    v19 = v18;
    objc_msgSend((id)v30[5], "longOperationDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v19;
    v37 = 2114;
    v38 = v20;
    _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ will start URL task %{public}@", buf, 0x16u);

  }
  objc_msgSend((id)v30[5], "resume");

  _Block_object_dispose(&v29, 8);
LABEL_17:

}

void __41__FCURLRequestScheduler__serviceRequests__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v12 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[3];
  v7 = v6;
  v8 = objc_msgSend(v7, "count");
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10 = v8;
    v11 = *(_QWORD *)(v9 + 40);
    *a4 = v8 >= v11;

    if (v10 < v11)
      -[FCURLRequestScheduler _resumeURLTaskForRequest:](*(_QWORD *)(a1 + 32), v12);
  }
  else
  {
    *a4 = 1;

  }
}

void __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (**v17)(id, id, id, _QWORD, id);
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
    v10 = (_QWORD *)v10[6];
  v11 = v10;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_3;
  v18[3] = &unk_1E4645608;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 56);
  v18[4] = v12;
  v18[1] = 3221225472;
  v19 = v13;
  v20 = *(id *)(a1 + 48);
  v14 = v9;
  v21 = v14;
  v23 = &v24;
  objc_msgSend(v11, "performWithLockSync:", v18);

  if (*((_BYTE *)v25 + 24))
  {
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
    {
      v16 = *(void **)(v15 + 48);
      if (v16)
      {
        v17 = v16;
        v17[2](v17, v7, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v14);

      }
    }
  }

  _Block_object_dispose(&v24, 8);
}

void __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[6];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("countOfBytesReceived"));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  if (*(void **)(*(_QWORD *)(v5 + 8) + 40) == v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 24);
    else
      v7 = 0;
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 48);
    v10 = *(void **)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    v12 = v9;
    v13 = v10;
    v14 = v13;
    v15 = 0;
    if (v8 && v11)
    {
      if (*((uint64_t *)v11 + 7) < 1)
        goto LABEL_16;
      objc_msgSend(v13, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

      if (!v17 || objc_msgSend(v14, "code") != -1001)
        goto LABEL_16;
      v18 = *(id *)(v8 + 56);
      if (v18)
      {
        v19 = v18;
        v20 = *(id *)(v8 + 56);
        objc_msgSend(v20, "fc_timeIntervalUntilNow");
        v22 = v21;
        objc_msgSend(*((id *)v11 + 1), "timeoutInterval");
        v24 = v23;

        if (v22 < v24)
          goto LABEL_15;
      }
      objc_msgSend(v12, "fc_timeIntervalUntilNow");
      v26 = v25;
      objc_msgSend(*((id *)v11 + 1), "timeoutInterval");
      if (v26 > v27 + v27)
LABEL_15:
        v15 = 1;
      else
LABEL_16:
        v15 = 0;
    }

    v28 = (void *)FCOperationLog;
    v29 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v29)
      {
        v30 = *(_QWORD *)(a1 + 40);
        if (v30)
          v31 = *(void **)(v30 + 40);
        else
          v31 = 0;
        v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v33 = v31;
        v34 = v28;
        objc_msgSend(v32, "longOperationDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v31;
        v48 = 2114;
        v49 = v35;
        _os_log_impl(&dword_1A1B90000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ will retry URL task %{public}@", buf, 0x16u);

      }
      v36 = *(_QWORD *)(a1 + 40);
      if (v36)
        --*(_QWORD *)(v36 + 56);
    }
    else
    {
      if (v29)
      {
        v37 = *(_QWORD *)(a1 + 40);
        if (v37)
          v38 = *(void **)(v37 + 40);
        else
          v38 = 0;
        v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v40 = v38;
        v41 = v28;
        objc_msgSend(v39, "longOperationDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v38;
        v48 = 2114;
        v49 = v42;
        _os_log_impl(&dword_1A1B90000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ did complete URL task %{public}@", buf, 0x16u);

      }
      v43 = *(_QWORD *)(a1 + 32);
      if (v43)
        v44 = *(void **)(v43 + 16);
      else
        v44 = 0;
      objc_msgSend(v44, "removeObject:", *(_QWORD *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    -[FCURLRequestScheduler _serviceRequests](*(_QWORD *)(a1 + 32));
  }
  else
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_4;
    v45[3] = &unk_1E463DF90;
    v45[4] = *(_QWORD *)(a1 + 40);
    v45[5] = v5;
    __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_4((uint64_t)v45);
  }

}

void __50__FCURLRequestScheduler__resumeURLTaskForRequest___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(void **)(v3 + 40);
    else
      v4 = 0;
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v6 = v4;
    v7 = v2;
    objc_msgSend(v5, "longOperationDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring URL task completion due to prior cancellation %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

void __40__FCURLRequestScheduler__cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void (***)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 48);
  else
    v2 = 0;
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB32E8];
  v5 = v2;
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -999, MEMORY[0x1E0C9AA70]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, id))v2)[2](v5, 0, 0, 0, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastProgress, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_inFlightURLTasks, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
}

@end
