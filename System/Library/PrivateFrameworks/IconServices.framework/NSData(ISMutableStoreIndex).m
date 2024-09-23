@implementation NSData(ISMutableStoreIndex)

+ (id)_ISMutableStoreIndex_mappedDataWithURL:()ISMutableStoreIndex
{
  id v3;
  int v4;
  int v5;
  size_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = open_dprotected_np((const char *)objc_msgSend(v3, "UTF8String"), 2, 4, 0, 384);
  if (v4 == -1)
  {
    v8 = 0;
  }
  else
  {
    v5 = v4;
    v6 = lseek(v4, 0, 2);
    if (v6)
    {
      v7 = mmap(0, v6, 3, 1, v5, 0);
      if (v7 == (void *)-1)
        v6 = 0;
    }
    else
    {
      v7 = 0;
    }
    close(v5);
    v8 = 0;
    if (v6 && v7)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D50]);
      v8 = (void *)objc_msgSend(v9, "initWithBytesNoCopy:length:deallocator:", v7, v6, *MEMORY[0x1E0CB2910]);
    }
  }

  return v8;
}

- (BOOL)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex
{
  id v4;
  void *v5;
  void *v6;
  size_t v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  _BOOL8 v16;
  NSObject *v17;
  kern_return_t v19;
  int v20;
  NSObject *v21;
  char v22;
  id v23;
  const std::__fs::filesystem::path *v24;
  id v25;
  const std::__fs::filesystem::path *v26;
  std::error_code *v27;
  int v28;
  NSObject *v29;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("tmp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "length");
  v8 = (void *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v9 = objc_retainAutorelease(v6);
  v10 = open_dprotected_np((const char *)objc_msgSend(v9, "UTF8String"), 1538, 4, 0, 420);
  if (v10 != -1)
  {
    v11 = v10;
    if (lseek(v10, v7 - 1, 0) != v7 - 1 || write(v11, "", 1uLL) == -1)
    {
      _ISDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.2();
      goto LABEL_10;
    }
    v12 = mmap(0, v7, 3, 1, v11, 0);
    if (!v12)
    {
LABEL_11:
      close(v11);
      goto LABEL_12;
    }
    v13 = v12;
    if (v12 == (void *)-1)
    {
      _ISDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.6();
LABEL_10:

      goto LABEL_11;
    }
    v19 = vm_copy(*MEMORY[0x1E0C83DA0], (vm_address_t)v8, v7, (vm_address_t)v12);
    if (v19)
    {
      v20 = v19;
      _ISDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.5(v20, v21);
    }
    else
    {
      if (mmap(v8, v7, 3, 17, v11, 0) == v8)
      {
        v22 = 0;
        v15 = 1;
        goto LABEL_25;
      }
      _ISDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.4((uint64_t)v9, v21);
    }

    v15 = 0;
    v22 = 1;
LABEL_25:
    munmap(v13, v7);
    close(v11);
    if ((v22 & 1) != 0)
      goto LABEL_13;
    v23 = objc_retainAutorelease(v9);
    v24 = (const std::__fs::filesystem::path *)objc_msgSend(v23, "UTF8String");
    objc_msgSend(v4, "path");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (const std::__fs::filesystem::path *)objc_msgSend(v25, "UTF8String");
    rename(v24, v26, v27);
    LODWORD(v24) = v28;

    if ((_DWORD)v24 != -1)
    {
      v15 = 1;
      goto LABEL_13;
    }
    _ISDefaultLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.3((uint64_t)v23, v4);

LABEL_12:
    v15 = 0;
LABEL_13:
    v16 = v15 != 0;
    goto LABEL_17;
  }
  _ISDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.1();

  v16 = 0;
LABEL_17:

  return v16;
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_1AA928000, v0, v1, "File at path: %@ could not be opened or created, error: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8();
  __error();
  OUTLINED_FUNCTION_5(&dword_1AA928000, v0, v1, "File at path: %@ coild not be sizes to fit %ld bytes, error: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0_1();
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __error();
  OUTLINED_FUNCTION_5(&dword_1AA928000, v2, v3, "rename from: %@ to %@ with error: %d", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1AA928000, a2, OS_LOG_TYPE_FAULT, "Failed to remap the index buffer to: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.5(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1AA928000, a2, OS_LOG_TYPE_FAULT, "vm_copy failed: %x", (uint8_t *)v2, 8u);
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_1AA928000, v0, v1, "Could not mmap(...) file at path: %@, error: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
