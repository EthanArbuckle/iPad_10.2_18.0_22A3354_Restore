@implementation EDSentToFilter

id __31___EDSentToFilter_loadFromDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = v4;
  objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0D1EE80], "bloomFilterWithContentsOfFile:error:", v8, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  v11 = v10;
  if (!v9)
  {
    if (isNoSuchFileError(v10))
    {
      EDSenderLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Sent to addresses filter %@ does not exist", buf, 0xCu);
      }
    }
    else
    {
      EDSenderLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "ef_publicDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        __31___EDSentToFilter_loadFromDisk__block_invoke_cold_1((uint64_t)v5, v13, (uint64_t)buf, v12);
      }
    }

  }
  return v9;
}

void __31___EDSentToFilter_loadFromDisk__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to load sent to addresses filter %@: %{public}@", (uint8_t *)a3, a4);

  OUTLINED_FUNCTION_2_0();
}

@end
