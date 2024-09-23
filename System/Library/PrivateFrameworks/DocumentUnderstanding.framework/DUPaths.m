@implementation DUPaths

+ (id)topDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__DUPaths_topDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (topDirectory__pasOnceToken2 != -1)
    dispatch_once(&topDirectory__pasOnceToken2, block);
  return (id)topDirectory__pasExprOnceResult;
}

void __23__DUPaths_topDirectory__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x22E2B0AD4]();
  +[DUPaths topDirectoryWithName:createIfNeeded:](*(_QWORD *)(a1 + 32), CFSTR("TextUnderstanding"), 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)topDirectory__pasExprOnceResult;
  topDirectory__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

+ (id)topDirectoryWithName:(int)a3 createIfNeeded:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a2;
  v5 = objc_opt_self();
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x22E2B0AD4]();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    +[DUPaths topDirectoryWithName:createIfNeeded:].cold.1();
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    +[DUPaths _createDirectoryAtPath:](v5, v9);
LABEL_4:

  return v9;
}

+ (id)topDirectoryCreateIfNeeded:(BOOL)a3
{
  return +[DUPaths topDirectoryWithName:createIfNeeded:]((uint64_t)a1, CFSTR("TextUnderstanding"), a3);
}

+ (void)_createDirectoryAtPath:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  char v5;
  NSObject *v6;
  __int128 v7;
  char v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  int v16;
  __int128 v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (id)objc_opt_self();
  objc_sync_enter(v3);
  v4 = *MEMORY[0x24BDD0B88];
  v5 = 1;
  v6 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v7 = 138412546;
  v17 = v7;
  while (1)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v19);
    v11 = v19;

    if ((v10 & 1) != 0)
      goto LABEL_14;
    if (objc_msgSend(v11, "code") == 640)
    {
      objc_msgSend(v11, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          +[DUPaths _createDirectoryAtPath:].cold.2();
        if (objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild")
          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          +[DUPaths _createDirectoryAtPath:].cold.1();
        }
        v16 = 4002;
        goto LABEL_23;
      }
    }
    if (objc_msgSend(v11, "code") == 513)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[DUPaths _createDirectoryAtPath:].cold.4();
      if (objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild")
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        +[DUPaths _createDirectoryAtPath:].cold.3();
      }
LABEL_22:
      v16 = 4003;
LABEL_23:
      _exit(v16);
    }
    if (objc_msgSend(v11, "code") != 516)
      break;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v17;
      v21 = v2;
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_2282CC000, v6, OS_LOG_TYPE_ERROR, "DUPaths: deleting file squatting at %@ due to error %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v14, "removeItemAtPath:error:", v2, &v18);
    v15 = v18;

    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[DUPaths _createDirectoryAtPath:].cold.5((uint64_t)v15, (uint64_t)v2);
      goto LABEL_22;
    }
    v5 = 0;
    if ((v8 & 1) == 0)
    {
      v11 = 0;
      goto LABEL_14;
    }
  }
  if (v11)
    +[FileErrorCode handleError:](FileErrorCode, "handleError:", v11);
LABEL_14:

  objc_sync_exit(v3);
}

+ (id)subdirectory:(id)a3
{
  return (id)objc_msgSend(a1, "subdirectory:createIfNeeded:", a3, 1);
}

+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x22E2B0AD4]();
  objc_msgSend(a1, "topDirectoryCreateIfNeeded:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  if (v4)
    +[DUPaths _createDirectoryAtPath:]((uint64_t)a1, v9);

  return v9;
}

+ (id)filename:(id)a3
{
  return (id)objc_msgSend(a1, "filename:createIfNeeded:", a3, 1);
}

+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x22E2B0AD4]();
  objc_msgSend(a1, "topDirectoryCreateIfNeeded:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v9;
}

+ (id)filename:(id)a3 subdirectory:(id)a4
{
  return (id)objc_msgSend(a1, "filename:subdirectory:createIfNeeded:", a3, a4, 1);
}

+ (id)filename:(id)a3 subdirectory:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x22E2B0AD4]();
  objc_msgSend(a1, "subdirectory:createIfNeeded:", v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  return v12;
}

+ (void)topDirectoryWithName:createIfNeeded:.cold.1()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "using top directory: %@", v0, 0xCu);
  OUTLINED_FUNCTION_0();
}

+ (void)_createDirectoryAtPath:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "DUPaths: unable to create directory due to lack of space.", v0, 2u);
}

+ (void)_createDirectoryAtPath:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2282CC000, MEMORY[0x24BDACB70], v0, "DUPaths: _createDirectoryAtPath: exiting due to lack of disk space while creating %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

+ (void)_createDirectoryAtPath:.cold.3()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "DUPaths: unable to create directory %@ due to lack of permissions.", v0, 0xCu);
  OUTLINED_FUNCTION_0();
}

+ (void)_createDirectoryAtPath:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2282CC000, MEMORY[0x24BDACB70], v0, "DUPaths: _createDirectoryAtPath: exiting due to lack of write permissions to directory %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

+ (void)_createDirectoryAtPath:(uint64_t)a1 .cold.5(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DUPaths: exiting due to failure to delete squatter file %@ due to error %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
