@implementation FAUIRotateImages

void __FAUIRotateImages_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
  {
    v6 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v6 = fauiLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __FAUIRotateImages_block_invoke_cold_1(a1 + 48, (uint64_t)v5, v6);
  }
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __FAUIRotateImages_block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v4 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v4 = fauiLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __FAUIRotateImages_block_invoke_6_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    FAUICreateTemporaryFolderURLAppropriateForURL(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    FAUICreateTempFileURLInTemporaryDirectory(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = FAUIRotateImage(v10, v9, *(_QWORD *)(a1 + 80));

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD1568];
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writingIntentWithURL:options:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *(void **)(a1 + 40);
      v26[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 48);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __FAUIRotateImages_block_invoke_7;
      v21[3] = &unk_24F9EC978;
      v22 = v14;
      v23 = v9;
      v24 = *(id *)(a1 + 32);
      v20 = *(_OWORD *)(a1 + 56);
      v18 = (id)v20;
      v25 = v20;
      v19 = v14;
      objc_msgSend(v15, "coordinateAccessWithIntents:queue:byAccessor:", v16, v17, v21);

    }
    else
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __FAUIRotateImages_block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v4 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v4 = fauiLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __FAUIRotateImages_block_invoke_7_cold_2();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v11 = 0;
    v8 = objc_msgSend(v5, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v7, 0, 0, 0, &v11);
    v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v10 = fauiLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __FAUIRotateImages_block_invoke_7_cold_1(a1, v10);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __FAUIRotateImages_block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0);
  return result;
}

void __FAUIRotateImages_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_22E113000, log, OS_LOG_TYPE_ERROR, "Failed to remove temporary folder %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __FAUIRotateImages_block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Failed to take a coordinated read: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __FAUIRotateImages_block_invoke_7_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 48);
  v3 = a2;
  objc_msgSend(v2, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v7 = 2112;
  v8 = v5;
  v9 = 2112;
  v10 = 0;
  _os_log_error_impl(&dword_22E113000, v3, OS_LOG_TYPE_ERROR, "Failed to replace %@ with temp file %@ error: %@", v6, 0x20u);

}

void __FAUIRotateImages_block_invoke_7_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Failed to take a coordinated write: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
