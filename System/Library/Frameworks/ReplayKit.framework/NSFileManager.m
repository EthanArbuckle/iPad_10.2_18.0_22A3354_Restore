@implementation NSFileManager

void __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke_cold_1(v2);
    NSLog(CFSTR("error = %@"), v2);
  }

}

void __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v2))
  {
    v3 = *(void **)(a1 + 40);
    v7 = 0;
    v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v7);
    v5 = v7;
    if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke_cold_1(v5);
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

void __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v6, "moveItemAtURL:toURL:error:", v4, v5, &v16);
  v7 = v16;
  if (v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v7);

}

void __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  _DWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_srTempPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] %@"), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        v12 = v5;
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke_cold_1(buf, (int)v5, v27);
        v14 = *(void **)(a1 + 32);
        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v14, "_srTempPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@"), v16, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v12;
        objc_msgSend(v14, "removeItemAtPath:error:", v17, &v20);
        v5 = v20;

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v9);
  }

}

void __92__NSFileManager_RPExtensions___srDeleteFilesOlderThanTimeToLiveInSeconds_deleteSystemFiles___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v1, "error in _rkRemoveFile_srDeleteFilesOlderThanTimeToLiveInSeconds, error code: %i", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

void __56__NSFileManager_RPExtensions___srRemoveFile_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v1, "_rkRemoveFile error: %i", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

void __67__NSFileManager_RPExtensions___srMoveFileFromURL_toURL_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], a3, "_rkMoveFileFromURL error: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __56__NSFileManager_RPExtensions___srDeleteFilesWithPrefix___block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "_rkDeleteFilesWithPrefix error: %i", buf, 8u);
}

@end
