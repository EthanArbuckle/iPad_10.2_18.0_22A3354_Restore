@implementation NTKPhotosConfirmMemoryWasViewed

void __NTKPhotosConfirmMemoryWasViewed_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__37;
  v18 = __Block_byref_object_dispose__37;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __NTKPhotosConfirmMemoryWasViewed_block_invoke_287;
  v11[3] = &unk_1E6BD1498;
  v13 = &v14;
  v12 = *(id *)(a1 + 32);
  v10 = 0;
  v3 = objc_msgSend(v2, "performChangesAndWait:error:", v11, &v10);
  v4 = v10;

  if (v4)
    v5 = 0;
  else
    v5 = v3;
  if (v5 != 1 || !v15[5])
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = "NO";
      if (v3)
        v8 = "YES";
      v9 = v15[5];
      *(_DWORD *)buf = 138413058;
      v21 = v7;
      v22 = 2080;
      v23 = v8;
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_ERROR, "Error confirming the watch has viewed memory %@, success: %s, error: %@, memoryChangeRequest: %@", buf, 0x2Au);
    }

  }
  _Block_object_dispose(&v14, 8);

}

void __NTKPhotosConfirmMemoryWasViewed_block_invoke_287(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForRemotelyViewedMemoryWithLocalIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
