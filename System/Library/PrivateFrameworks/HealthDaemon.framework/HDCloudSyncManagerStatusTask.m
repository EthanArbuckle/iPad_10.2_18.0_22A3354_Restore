@implementation HDCloudSyncManagerStatusTask

- (HDCloudSyncManagerStatusTask)initWithManager:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncManagerStatusTask *v8;
  HDCloudSyncManagerStatusTask *v9;
  uint64_t v10;
  id completion;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncManagerStatusTask;
  v8 = -[HDCloudSyncManagerTask init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    v10 = objc_msgSend(v7, "copy");
    completion = v9->_completion;
    v9->_completion = (id)v10;

  }
  return v9;
}

- (void)main
{
  id WeakRetained;
  void *v4;
  void (**completion)(id, _QWORD, void *);
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__94;
    v16[4] = __Block_byref_object_dispose__94;
    v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__94;
    v14[4] = __Block_byref_object_dispose__94;
    v15 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__94;
    v12[4] = __Block_byref_object_dispose__94;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__HDCloudSyncManagerStatusTask_main__block_invoke;
    v7[3] = &unk_1E6CF8D60;
    v7[4] = self;
    v8 = WeakRetained;
    v9 = v16;
    v10 = v14;
    v11 = v12;
    objc_msgSend(v8, "containerIdentifiersForCurrentAccountWithCompletion:", v7);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v14, 8);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    completion = (void (**)(id, _QWORD, void *))self->_completion;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 2000, CFSTR("Cloud sync manager unexpectedly nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 0, v6);

    -[HDCloudSyncManagerTask finish](self, "finish");
  }

}

void __36__HDCloudSyncManagerStatusTask_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  HDCloudSyncStatus *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[HDDatabaseTransactionContext contextForReading](HDDatabaseTransactionContext, "contextForReading");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __36__HDCloudSyncManagerStatusTask_main__block_invoke_2;
    v18[3] = &unk_1E6CF8D38;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v3;
    v20 = *(id *)(a1 + 40);
    v21 = *(_OWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 64);
    v7 = objc_msgSend(v6, "performTransactionWithContext:error:block:inaccessibilityHandler:", v4, &v23, v18, 0);
    v8 = v23;

    if (v7)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v14 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(a1 + 40);
        v15 = v9;
        objc_msgSend(v13, "profile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v25 = v14;
        v26 = 2114;
        v27 = v10;
        v28 = 2114;
        v29 = v11;
        v30 = 2114;
        v31 = v12;
        v32 = 2114;
        v33 = v16;
        _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched Status: Push: %{public}@, Lite Push: %{public}@, Pull: %{public}@, Profile:%{public}@", buf, 0x34u);

      }
      v17 = objc_alloc_init(HDCloudSyncStatus);
      -[HDCloudSyncStatus setLastSuccessfulPullDate:](v17, "setLastSuccessfulPullDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      -[HDCloudSyncStatus setLastSuccessfulPushDate:](v17, "setLastSuccessfulPushDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      -[HDCloudSyncStatus setLastSuccessfulLitePushDate:](v17, "setLastSuccessfulLitePushDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
    }
    objc_msgSend(*(id *)(a1 + 32), "finish");

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }

}

uint64_t __36__HDCloudSyncManagerStatusTask_main__block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  BOOL v27;
  int v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  BOOL v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v44;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "profile");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v16 = 0;
    goto LABEL_62;
  }
  v8 = v5;
  HDCloudSyncKeyValueDomainWithProfile(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncLastSuccessfulPushKeyForContainerIdentifier((uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  objc_msgSend(v9, "dateForKey:error:", v10, &v44);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v44;

  if (v11)
    v13 = 1;
  else
    v13 = v12 == 0;
  v14 = v13;
  if (v13)
  {
    v15 = objc_retainAutorelease(v11);
  }
  else if (a3)
  {
    v15 = 0;
    *a3 = objc_retainAutorelease(v12);
  }
  else
  {
    _HKLogDroppedError();
    v15 = 0;
  }

  v16 = v15;
  if (v14)
  {
    if (!v16)
      goto LABEL_20;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    if (v18)
    {
      if (!objc_msgSend(v18, "hk_isAfterDate:", v16))
        goto LABEL_20;
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    objc_storeStrong((id *)(v17 + 40), v15);
    objc_msgSend(*(id *)(a1 + 48), "didCompleteSuccessfulPushWithDate:", v16);
LABEL_20:
    v20 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "profile");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v7 = 0;
      goto LABEL_60;
    }
    v22 = v19;
    HDCloudSyncKeyValueDomainWithProfile(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncLastSuccessfulPullKeyForContainerIdentifier((uint64_t)v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0;
    objc_msgSend(v23, "dateForKey:error:", v24, &v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v44;

    if (v25)
      v27 = 1;
    else
      v27 = v26 == 0;
    v28 = v27;
    if (v27)
    {
      v29 = objc_retainAutorelease(v25);
    }
    else if (a3)
    {
      v29 = 0;
      *a3 = objc_retainAutorelease(v26);
    }
    else
    {
      _HKLogDroppedError();
      v29 = 0;
    }

    v7 = v29;
    if (v28)
    {
      if (!v7)
        goto LABEL_40;
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v31 = *(void **)(v30 + 40);
      if (v31)
      {
        if (!objc_msgSend(v31, "hk_isAfterDate:", v7))
          goto LABEL_40;
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      }
      objc_storeStrong((id *)(v30 + 40), v29);
      objc_msgSend(*(id *)(a1 + 48), "didCompleteSuccessfulPullWithDate:", v7);
LABEL_40:
      v20 = *(_QWORD *)(a1 + 32);
      v32 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "profile");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v34 = v32;
        HDCloudSyncKeyValueDomainWithProfile(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        HDCloudSyncLastSuccessfulLitePushKeyForContainerIdentifier((uint64_t)v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0;
        objc_msgSend(v35, "dateForKey:error:", v36, &v44);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v44;

        if (v37)
          v39 = 1;
        else
          v39 = v38 == 0;
        v20 = v39;
        if (v39)
        {
          v40 = objc_retainAutorelease(v37);
        }
        else if (a3)
        {
          v40 = 0;
          *a3 = objc_retainAutorelease(v38);
        }
        else
        {
          _HKLogDroppedError();
          v40 = 0;
        }

      }
      else
      {
        v40 = 0;
      }
      v21 = v40;

      if (!(_DWORD)v20 || !v21)
        goto LABEL_60;
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v42 = *(void **)(v41 + 40);
      if (v42)
      {
        if (!objc_msgSend(v42, "hk_isAfterDate:", v21))
        {
LABEL_60:

LABEL_63:
          goto LABEL_64;
        }
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      }
      objc_storeStrong((id *)(v41 + 40), v40);
      objc_msgSend(*(id *)(a1 + 48), "didCompleteSuccessfulLitePushWithDate:", v21);
      goto LABEL_60;
    }
LABEL_62:
    v20 = 0;
    goto LABEL_63;
  }
  v20 = 0;
LABEL_64:

  return v20;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong(&self->_completion, 0);
}

@end
