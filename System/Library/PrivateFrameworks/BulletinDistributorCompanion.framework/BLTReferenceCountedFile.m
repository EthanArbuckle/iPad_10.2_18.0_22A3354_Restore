@implementation BLTReferenceCountedFile

+ (BOOL)retain:(id)a3 fileData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v20;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&__read_write_lock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relativePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (!v10)
  {
    if ((objc_msgSend(v7, "writeToURL:atomically:", v6, 1) & 1) != 0)
    {
      objc_msgSend(v6, "blt_metadataURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(a1, "writeRetainCount:oldMetadata:to:", 1, MEMORY[0x24BDBD1B8], v12);

      if ((v13 & 1) != 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
        v11 = 1;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v16 = objc_msgSend(v15, "removeItemAtURL:error:", v6, &v20);
      v17 = v20;

      if ((v16 & 1) == 0)
      {
        blt_general_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[BLTReferenceCountedFile retain:fileData:].cold.1();

      }
      os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);

    }
    else
    {
      blt_general_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[BLTReferenceCountedFile retain:fileData:].cold.2();

      os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
    }
    v11 = 0;
    goto LABEL_15;
  }
  v11 = objc_msgSend(a1, "retain:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
LABEL_15:

  return v11;
}

+ (BOOL)retain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;

  v4 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__read_write_lock);
  objc_msgSend(a1, "metadataForFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    blt_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BLTReferenceCountedFile retain:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("refCount"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    blt_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[BLTReferenceCountedFile retain:].cold.2();

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v9 = (int)(-[NSObject intValue](v7, "intValue") + 1);
  objc_msgSend(v4, "blt_metadataURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "writeRetainCount:oldMetadata:to:", v9, v6, v10);

LABEL_10:
  return v11;
}

+ (id)metadataForFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__read_write_lock);
  objc_msgSend(v3, "blt_metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    blt_general_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[BLTReferenceCountedFile retain:].cold.1();

  }
  return v5;
}

+ (BOOL)writeRetainCount:(int64_t)a3 oldMetadata:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;

  v7 = a5;
  v8 = a4;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__read_write_lock);
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("refCount"));

  v11 = objc_msgSend(v9, "writeToURL:atomically:", v7, 1);
  if ((v11 & 1) == 0)
  {
    blt_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[BLTReferenceCountedFile writeRetainCount:oldMetadata:to:].cold.1();

  }
  return v11;
}

+ (BOOL)release:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  char v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  id v27;
  id v28;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__read_write_lock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relativePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(a1, "metadataForFile:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("refCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 && v9)
    {
      v11 = objc_msgSend(v9, "intValue");
      if (v11 < 2)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v15 = objc_msgSend(v18, "removeItemAtURL:error:", v4, &v28);
        v19 = v28;

        if ((v15 & 1) == 0)
        {
          blt_general_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[BLTReferenceCountedFile release:].cold.2();

        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "blt_metadataURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v19;
        v23 = objc_msgSend(v21, "removeItemAtURL:error:", v22, &v27);
        v24 = v27;

        if ((v23 & 1) == 0)
        {
          blt_general_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            +[BLTReferenceCountedFile release:].cold.2();

          v15 = 0;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);

        goto LABEL_24;
      }
      v12 = (v11 - 1);
      objc_msgSend(v4, "blt_metadataURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(a1, "writeRetainCount:oldMetadata:to:", v12, v8, v13);

      if ((v14 & 1) != 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
        v15 = 1;
LABEL_24:

        goto LABEL_25;
      }
      blt_general_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[BLTReferenceCountedFile release:].cold.1();
    }
    else
    {
      blt_general_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[BLTReferenceCountedFile release:].cold.4();
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
    v15 = 0;
    goto LABEL_24;
  }
  blt_general_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    +[BLTReferenceCountedFile release:].cold.5();

  os_unfair_lock_unlock((os_unfair_lock_t)&__read_write_lock);
  v15 = 0;
LABEL_25:

  return v15;
}

+ (void)retain:fileData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: Succeeded saving data to: %@ but failed to write metadata and then failed to remove file - things are going badly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)retain:fileData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: Error saving data to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)retain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: Error reading file data from: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)retain:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: Error reading refCount from: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)writeRetainCount:oldMetadata:to:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: Failed to write url: %@ fileInfo: %@");
  OUTLINED_FUNCTION_5();
}

+ (void)release:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: Failed to write updated retain count: %@ - this is bad", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)release:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: Unable to remove file: %@ error: %@");
  OUTLINED_FUNCTION_5();
}

+ (void)release:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: No metadata for file at url: %@ - this is bad", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)release:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, v0, v1, "BLTReferenceCountedFile: No file at url: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
