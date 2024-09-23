@implementation NSData(ISStoreIndex)

+ (id)_ISStoreIndex_mappedDataWithURL:()ISStoreIndex
{
  id v3;
  int v4;
  int v5;
  size_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = open((const char *)objc_msgSend(v3, "UTF8String"), 0);
  if (v4 == -1)
  {
    _ISDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[NSData(ISStoreIndex) _ISStoreIndex_mappedDataWithURL:].cold.1(v8);

    v9 = 0;
  }
  else
  {
    v5 = v4;
    v6 = lseek(v4, 0, 2);
    if (v6)
    {
      v7 = mmap(0, v6, 1, 1, v5, 0);
      if (v7 == (void *)-1)
        v6 = 0;
    }
    else
    {
      v7 = 0;
    }
    close(v5);
    v9 = 0;
    if (v7 && v6)
    {
      v10 = objc_alloc(MEMORY[0x1E0C99D50]);
      v9 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:deallocator:", v7, v6, *MEMORY[0x1E0CB2910]);
    }
  }

  return v9;
}

+ (void)_ISStoreIndex_mappedDataWithURL:()ISStoreIndex .cold.1(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1AA928000, a1, OS_LOG_TYPE_DEBUG, "Failed to open store index with errno: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

@end
