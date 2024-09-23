@implementation CIGetHarvestingBinaryArchiveDict

uint64_t __CIGetHarvestingBinaryArchiveDict_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  id v21;

  v21 = 0;
  if (CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH())
  {
    v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH());
  }
  else
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "temporaryDirectory");
    v2 = objc_msgSend((id)objc_msgSend(v3, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME())), "path");
  }
  v4 = v2;
  v20 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", v2, &v20))
    v5 = v20 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v19 = 0;
    objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0CB2AB0], *MEMORY[0x1E0CB2AD8]), &v19);
    if (v19)
    {
      v6 = ci_logger_render();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __CIGetHarvestingBinaryArchiveDict_block_invoke_cold_3(&v19, v6);
    }
  }
  v7 = CI_ADD_PROCESS_NAME_TO_BIN_ARCHIVE();
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (v7)
  {
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
    v10 = objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/ci_archive_%@_%d.bin"), v4, v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processIdentifier"));
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/ci_archive.bin"), v4, v17, v18);
  }
  v11 = v10;
  CIGetHarvestingBinaryArchiveDict_binary_archive_file_path = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("file:%@"), v10);
  v12 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v11))
    objc_msgSend(v12, "setUrl:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CIGetHarvestingBinaryArchiveDict_binary_archive_file_path));
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    CIGetHarvestingBinaryArchiveDict_bin = objc_msgSend(v13, "newBinaryArchiveWithDescriptor:error:", v12, &v21);
    if (CIGetHarvestingBinaryArchiveDict_bin)
      goto LABEL_23;
  }
  else if (CIGetHarvestingBinaryArchiveDict_bin)
  {
    goto LABEL_23;
  }
  v14 = ci_logger_render();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __CIGetHarvestingBinaryArchiveDict_block_invoke_cold_2(v12, &v21, v14);
LABEL_23:

  CIGetHarvestingBinaryArchiveDict_queue = (uint64_t)dispatch_queue_create("CoreImageBinaryArchive", 0);
  if (!CIGetHarvestingBinaryArchiveDict_queue)
  {
    v15 = ci_logger_render();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __CIGetHarvestingBinaryArchiveDict_block_invoke_cold_1();
  }
  result = CI_BIN_ARCHIVE_SERIALIZATION_METHOD();
  if (!(_DWORD)result)
    return atexit(serializeHarvestedBinaryArchiveExit);
  return result;
}

void __CIGetHarvestingBinaryArchiveDict_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "Binary archive queue creation failed\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __CIGetHarvestingBinaryArchiveDict_block_invoke_cold_2(void *a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "url");
  objc_msgSend(*a2, "localizedDescription");
  v7 = 138543618;
  v8 = v5;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a3, v6, "Binary archive newBinaryArchiveWithDescriptor: %{public}@ : %{public}@\n", (uint8_t *)&v7);
}

void __CIGetHarvestingBinaryArchiveDict_block_invoke_cold_3(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8_2(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_1921E4000, a2, v3, "Error creating CoreImage harvesting directory path: %{public}@", v4);
  OUTLINED_FUNCTION_2();
}

@end
