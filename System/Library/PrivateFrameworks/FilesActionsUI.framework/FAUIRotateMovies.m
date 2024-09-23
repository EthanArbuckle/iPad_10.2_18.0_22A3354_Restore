@implementation FAUIRotateMovies

void __FAUIRotateMovies_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  char v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v4 = fauiLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __FAUIRotateMovies_block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(*(id *)(a1 + 40), "stopAccessingSecurityScopedResource");
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FAUICreateTemporaryFolderURLAppropriateForURL(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    FAUICreateTempFileURLInTemporaryDirectory(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v14, "copyItemAtURL:toURL:error:", v15, v13, &v36);
    v16 = v36;

    if (v16)
    {
      v17 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v17 = fauiLogHandle;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v24 = *(void **)(a1 + 56);
        v25 = v17;
        objc_msgSend(v24, "URL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = v26;
        v39 = 2112;
        v40 = v13;
        v41 = 2112;
        v42 = v16;
        _os_log_error_impl(&dword_22E113000, v25, OS_LOG_TYPE_ERROR, "Failed to copy %@ to temp file %@ error: %@", buf, 0x20u);

      }
    }
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __FAUIRotateMovies_block_invoke_6;
    v27[3] = &unk_24F9EC900;
    v18 = *(_QWORD *)(a1 + 72);
    v28 = *(id *)(a1 + 64);
    v29 = *(id *)(a1 + 56);
    v30 = v13;
    v19 = *(id *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(void **)(a1 + 48);
    v31 = v19;
    v32 = v20;
    v33 = v12;
    v35 = *(_BYTE *)(a1 + 80);
    v34 = v21;
    v22 = v12;
    v23 = v13;
    _FAUIRotateMovie(v23, v23, v18, v27);

  }
}

void __FAUIRotateMovies_block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id *)(v26 + 5);
    obj = (id)v26[5];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __FAUIRotateMovies_block_invoke_7;
    v21[3] = &unk_24F9EC8D8;
    v22 = *(id *)(a1 + 48);
    v23 = &v25;
    objc_msgSend(v7, "coordinateWritingItemAtURL:options:error:byAccessor:", v8, 0, &obj, v21);
    objc_storeStrong(v9, obj);

    if (v26[5])
    {
      v10 = (void *)fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v10 = (void *)fauiLogHandle;
      }
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "URL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v32 = v18;
        v33 = 2112;
        v34 = v19;
        v35 = 2112;
        v36 = v6;
        _os_log_error_impl(&dword_22E113000, v11, OS_LOG_TYPE_ERROR, "Failed to replace %@ with temp file %@ error: %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v26[5], *(_QWORD *)(a1 + 64));
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 72);
    v20 = 0;
    objc_msgSend(v13, "removeItemAtURL:error:", v14, &v20);
    v15 = v20;

    if (v15)
    {
      v16 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v16 = fauiLogHandle;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __FAUIRotateMovies_block_invoke_6_cold_1((uint64_t *)(a1 + 72), (uint64_t)v15, v16);
    }

    _Block_object_dispose(&v25, 8);
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v5, *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11800, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v17, *(_QWORD *)(a1 + 64));

  }
  if (*(_BYTE *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 64), "stopAccessingSecurityScopedResource");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));

}

void __FAUIRotateMovies_block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v4, v6, 0, 0, 0, &obj);

  objc_storeStrong((id *)(v7 + 40), obj);
}

void __FAUIRotateMovies_block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, _QWORD))(v1 + 16))(v1, objc_msgSend(v3, "count") == 0, *(_QWORD *)(a1 + 32));

  }
}

void __FAUIRotateMovies_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E113000, a2, a3, "Failed to take a coordinated read: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __FAUIRotateMovies_block_invoke_6_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_22E113000, log, OS_LOG_TYPE_ERROR, "Failed to delete temp directory %@ error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
