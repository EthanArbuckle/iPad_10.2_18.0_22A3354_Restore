@implementation HKClinicalStorageLocations

+ (id)homeMobileDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  HKSharedResourcesDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mobileLibraryHealthDirectory
{
  void *v2;
  void *v3;

  +[HKClinicalStorageLocations homeMobileDirectory](HKClinicalStorageLocations, "homeMobileDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Health"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)downloadableAttachmentsDirectory
{
  void *v2;
  void *v3;

  +[HKClinicalStorageLocations mobileLibraryHealthDirectory](HKClinicalStorageLocations, "mobileLibraryHealthDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("DownloadedAttachments"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)storeData:(id)a3 inLocalFileAtURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v13 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v26);
  v14 = v26;
  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      +[HKClinicalStorageLocations storeData:inLocalFileAtURL:error:].cold.2((uint64_t)a1, v23, v12);
    v24 = v14;
    v17 = v24;
    if (v24)
    {
      if (a5)
      {
        v17 = objc_retainAutorelease(v24);
        v19 = 0;
        *a5 = v17;
        goto LABEL_13;
      }
      _HKLogDroppedError();
    }
    v19 = 0;
    goto LABEL_13;
  }
  v15 = *MEMORY[0x24BDD0CD8];
  v16 = *MEMORY[0x24BDD0CC8];
  v27[0] = *MEMORY[0x24BDD0CF0];
  v27[1] = v16;
  v28[0] = v15;
  v28[1] = &unk_24D55C3D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v10, "createFileAtPath:contents:attributes:", v18, v8, v17);

  if ((v19 & 1) == 0)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      +[HKClinicalStorageLocations storeData:inLocalFileAtURL:error:].cold.1((uint64_t)a1, v20, v9);
    v21 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v9, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_assignError:code:format:", a5, 102, CFSTR("Error creating file at %@"), v22);

  }
LABEL_13:

  return v19;
}

+ (BOOL)removeLocalFileAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v13);

  v9 = v13;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    v11 = v9;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

  }
  return v8;
}

+ (void)storeData:(uint64_t)a1 inLocalFileAtURL:(void *)a2 error:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = a2;
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2163C4000, v7, v8, "%{public}@: Failed to create file %{public}@.", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_3();
}

+ (void)storeData:(uint64_t)a1 inLocalFileAtURL:(void *)a2 error:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2163C4000, v6, v7, "%{public}@: Failed to create directory %{public}@.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_3();
}

@end
