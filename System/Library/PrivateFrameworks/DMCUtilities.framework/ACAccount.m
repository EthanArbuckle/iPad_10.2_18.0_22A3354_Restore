@implementation ACAccount

void __59__ACAccount_DeviceManagementClient__dmc_accountQuotaString__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE buf[24];
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve quota size for account: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v12 = (void *)getAAQuotaInfoResponseClass_softClass;
    v28 = getAAQuotaInfoResponseClass_softClass;
    if (!getAAQuotaInfoResponseClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getAAQuotaInfoResponseClass_block_invoke;
      v30 = &unk_1E4D36B88;
      v31 = &v25;
      __getAAQuotaInfoResponseClass_block_invoke((uint64_t)buf);
      v12 = (void *)v26[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v25, 8);
    v14 = [v13 alloc];
    objc_msgSend(v8, "httpResponse", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithHTTPResponse:data:", v15, v16);

    objc_msgSend(v17, "totalStorageInBytes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "longLongValue");

    if (v19)
    {
      NSLocalizedFileSizeDescription();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

    }
    else
    {
      v23 = *DMCLogObjects();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v24;
        _os_log_impl(&dword_1A4951000, v23, OS_LOG_TYPE_ERROR, "Quota size for account: %{public}@ is 0!", buf, 0xCu);
      }
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

@end
