@implementation HDMostRecentSuccessfulPullDateForProfile

id __HDMostRecentSuccessfulPullDateForProfile_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("LastSuccessfulPull-")))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __HDMostRecentSuccessfulPullDateForProfile_block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = (void *)a1[4];
  v10 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v9, "dateForKey:error:", v6, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v21 = v6;
        v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Could not get date for key: %{public}@ from the cloud sync domain: %{public}@", buf, 0x16u);
      }
    }
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    *a4 = 1;
  }
  v16 = *(_QWORD *)(a1[6] + 8);
  v17 = *(void **)(v16 + 40);
  if (!v17)
    goto LABEL_9;
  objc_msgSend(v17, "laterDate:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 == v11)
  {
    v16 = *(_QWORD *)(a1[6] + 8);
LABEL_9:
    objc_storeStrong((id *)(v16 + 40), v11);
  }

}

@end
