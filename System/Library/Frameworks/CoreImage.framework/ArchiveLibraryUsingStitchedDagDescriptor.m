@implementation ArchiveLibraryUsingStitchedDagDescriptor

void __ArchiveLibraryUsingStitchedDagDescriptor_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  dispatch_time_t v17;
  dispatch_time_t v18;
  NSObject *global_queue;
  id v20;
  _BYTE buf[24];
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (CI_PREVENT_HARVEST_DUPLICATE_ENTRIES())
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_msgSend(v2, "temporaryDirectory");
    v4 = objc_msgSend((id)objc_msgSend(v3, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/ci_%016llX.txt"), CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME(), *(_QWORD *)(a1 + 72))), "path");
    if ((objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v4, 0) & 1) != 0)
      return;
    if ((objc_msgSend(v2, "createFileAtPath:contents:attributes:", v4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%016llX %@\n"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32)), "dataUsingEncoding:", 4), 0) & 1) == 0)
    {
      v5 = ci_logger_render();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __ArchiveLibraryUsingStitchedDagDescriptor_block_invoke_cold_3();
    }
  }
  v20 = 0;
  if ((objc_msgSend(*(id *)(a1 + 40), "addLibraryWithDescriptor:error:", *(_QWORD *)(a1 + 48), &v20) & 1) != 0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "addComputePipelineFunctionsWithDescriptor:error:", *(_QWORD *)(a1 + 56), &v20);
    v7 = ci_logger_render();
    v8 = v7;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = objc_msgSend(*(id *)(a1 + 64), "lastPathComponent");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_1921E4000, v8, OS_LOG_TYPE_INFO, "%{public}@ program added to %{public}@\n", buf, 0x16u);
      }
      if (CI_BIN_ARCHIVE_SERIALIZATION_METHOD() == 1)
      {
        serializeBinaryArchive(*(void **)(a1 + 40), *(_QWORD *)(a1 + 64));
      }
      else if (CI_BIN_ARCHIVE_SERIALIZATION_METHOD() == 2)
      {
        v12 = (void *)CIGetHarvestingBinaryArchiveDict(0);
        v13 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bin"));
        v14 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("queue"));
        v15 = objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("path"));
        v16 = CI_BIN_ARCHIVE_SERIALIZATION_DELAY();
        v17 = dispatch_time(0, (uint64_t)(v16 / 1000.0 * 1000000000.0));
        if ((scheduleSerializingHarvestedBinaryArchive_serialization_pending & 1) == 0)
        {
          v18 = v17;
          scheduleSerializingHarvestedBinaryArchive_serialization_pending = 1;
          global_queue = dispatch_get_global_queue(0, 0);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __scheduleSerializingHarvestedBinaryArchive_block_invoke;
          v22 = &unk_1E2EC4A38;
          v23 = v14;
          v24 = v13;
          v25 = v15;
          dispatch_after(v18, global_queue, buf);
        }
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __ArchiveLibraryUsingStitchedDagDescriptor_block_invoke_cold_1(&v20, v8);
    }
  }
  else
  {
    v11 = ci_logger_render();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __ArchiveLibraryUsingStitchedDagDescriptor_block_invoke_cold_2(&v20, v11);
  }
}

void __ArchiveLibraryUsingStitchedDagDescriptor_block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8_2(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_1921E4000, a2, v3, "Failed addComputePipelineFunctionsWithDescriptor for binary archive: %{public}@\n", v4);
  OUTLINED_FUNCTION_2();
}

void __ArchiveLibraryUsingStitchedDagDescriptor_block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8_2(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_1921E4000, a2, v3, "Failed addLibraryWithDescriptor for binary archive: %{public}@\n", v4);
  OUTLINED_FUNCTION_2();
}

void __ArchiveLibraryUsingStitchedDagDescriptor_block_invoke_cold_3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_12_1(&dword_1921E4000, v1, v2, "Failed writing descriptor fot %@: %d - message: %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_12_0();
}

@end
