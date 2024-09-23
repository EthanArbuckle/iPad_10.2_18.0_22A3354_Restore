@implementation IXUrlsForItemsInDirectoryAtURL

uint64_t __IXUrlsForItemsInDirectoryAtURL_block_invoke(uint64_t a1, uint64_t a2)
{
  const char *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (const char *)(a2 + 21);
  if (strcmp((const char *)(a2 + 21), ".") && strcmp(v4, ".."))
  {
    if (*(_BYTE *)(a2 + 20) == 10 && *(_BYTE *)(a1 + 48))
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __IXUrlsForItemsInDirectoryAtURL_block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", v4, *(unsigned __int16 *)(a2 + 18));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, *(unsigned __int8 *)(a2 + 20) == 4);
      v5 = objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "path");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 136315650;
          v12 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
          v13 = 2080;
          v14 = v4;
          v15 = 2112;
          v16 = v9;
          _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to create URL by appending %s to %@", (uint8_t *)&v11, 0x20u);

        }
      }
    }

  }
  return 1;
}

void __IXUrlsForItemsInDirectoryAtURL_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v6 = 136315650;
  v7 = "IXUrlsForItemsInDirectoryAtURL_block_invoke";
  v8 = 2080;
  v9 = v5;
  v10 = 2080;
  v11 = a2;
  _os_log_debug_impl(&dword_1A4BF6000, a3, OS_LOG_TYPE_DEBUG, "%s: Ignoring symlink at %s/%s", (uint8_t *)&v6, 0x20u);
}

@end
