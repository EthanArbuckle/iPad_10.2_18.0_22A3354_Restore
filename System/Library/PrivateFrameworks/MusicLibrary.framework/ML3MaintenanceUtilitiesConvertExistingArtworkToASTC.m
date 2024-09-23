@implementation ML3MaintenanceUtilitiesConvertExistingArtworkToASTC

void __ML3MaintenanceUtilitiesConvertExistingArtworkToASTC_block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  os_log_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  os_log_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v12 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v23 = 0;
    v14 = objc_msgSend(v11, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v12, v13, 0, 1, 0, &v23);
    v9 = (os_log_t)v23;
    if (v14)
    {
      v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(NSObject **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v25 = v16;
        v17 = "Artwork at %{public}@ successfully converted to ASTC format";
        v18 = v15;
        v19 = 12;
LABEL_13:
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v20 = objc_msgSend(*(id *)(a1 + 48), "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);
      v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 40);
        v22 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        v25 = v9;
        v26 = 2114;
        v27 = v21;
        v28 = 2114;
        v29 = v22;
        v30 = 1024;
        v31 = v20;
        v17 = "Error %{public}@ replacing artwork at %{public}@ with %{public}@ - temp file deleted %d";
        v18 = v15;
        v19 = 38;
        goto LABEL_13;
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  -[NSObject domain](v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D4CE20]))
  {
    v6 = -[NSObject code](v4, "code");

    if (v6 == 1)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v25 = v4;
        v26 = 2114;
        v27 = v10;
        _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Error %{public}@ converting artwork at %{public}@ to ASTC", buf, 0x16u);
      }
      goto LABEL_15;
    }
  }
  else
  {

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

@end
