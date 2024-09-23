@implementation ArchiveLibrary

void __ArchiveLibrary_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  id v7;
  char v8;

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
  v8 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", v2, &v8))
    v5 = v8 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v7 = 0;
    objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0CB2AB0], *MEMORY[0x1E0CB2AD8]), &v7);
    if (v7)
    {
      v6 = ci_logger_render();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __CIGetHarvestingBinaryArchiveDict_block_invoke_cold_3(&v7, v6);
    }
  }
}

@end
