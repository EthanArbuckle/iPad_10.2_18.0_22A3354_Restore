@implementation NSData(DeviceManagement)

- (uint64_t)dm_atomicWriteToURL:()DeviceManagement error:
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v30;
  id v31;
  void *v32;
  char v33;
  NSObject *v34;
  id v36;
  id v37;
  id v38;
  unsigned __int8 v39;

  v6 = a3;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v39);
  v10 = v39;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "substringToIndex:", 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(".temp-%@-%@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v20 = objc_msgSend(a1, "writeToURL:options:error:", v19, 0, &v38);
    v21 = v38;
    if ((v20 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v21;
      v23 = objc_msgSend(v22, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v19, 0, 1, 0, &v37);
      v24 = v37;

      DMFAtomicFileWritingLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if ((v23 & 1) != 0)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[NSData(DeviceManagement) dm_atomicWriteToURL:error:].cold.2();

        v27 = 1;
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[NSData(DeviceManagement) dm_atomicWriteToURL:error:].cold.4();

        v31 = objc_retainAutorelease(v24);
        *a4 = v31;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v31;
        v33 = objc_msgSend(v32, "removeItemAtURL:error:", v19, &v36);
        v24 = v36;

        if ((v33 & 1) == 0)
        {
          DMFAtomicFileWritingLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[NSData(DeviceManagement) dm_atomicWriteToURL:error:].cold.3();

        }
        v27 = 0;
      }
    }
    else
    {
      DMFAtomicFileWritingLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[NSData(DeviceManagement) dm_atomicWriteToURL:error:].cold.5();

      v24 = objc_retainAutorelease(v21);
      v27 = 0;
      *a4 = v24;
    }

  }
  else
  {
    DMFAtomicFileWritingLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[NSData(DeviceManagement) dm_atomicWriteToURL:error:].cold.1();

    DMFErrorWithCodeAndUserInfo();
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Failed to write temporary file since a directory is present: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1B8C0C000, v0, OS_LOG_TYPE_DEBUG, "Wrote file atomically in-place: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_2();
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Failed to remove temporary file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Failed to replace original file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)dm_atomicWriteToURL:()DeviceManagement error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Failed to write temporary file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
