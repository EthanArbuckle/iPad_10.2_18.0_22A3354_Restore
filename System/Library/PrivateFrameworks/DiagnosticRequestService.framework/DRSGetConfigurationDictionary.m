@implementation DRSGetConfigurationDictionary

void __DRSGetConfigurationDictionary_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  char v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("DPConfig.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v25))
  {
LABEL_12:

    goto LABEL_13;
  }
  if (v25)
  {
    DPLogHandle_DPConfigError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v2;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigFileIsDirectory", "ERROR: Config file at path '%{public}@' is a directory. Clearing it...", buf, 0xCu);
    }

    v24 = 0;
    v5 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v24);
    v6 = v24;
    v7 = v24;
    if ((v5 & 1) == 0)
    {
      DPLogHandle_DPConfigError();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        objc_msgSend(v7, "localizedDescription");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        v11 = CFSTR("Unknown");
        if (v9)
          v11 = (const __CFString *)v9;
        *(_DWORD *)buf = 138543618;
        v27 = v2;
        v28 = 2114;
        v29 = v11;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigFileIsDirectoryRemovalFailure", "ERROR: Failed to remove directory at path '%{public}@' due to error: %{public}@", buf, 0x16u);

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
    }

    goto LABEL_12;
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v2);
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v12, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  v15 = v23;
  v16 = objc_msgSend(v13, "mutableCopy");
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    DPLogHandle_DPConfigError();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      objc_msgSend(v15, "localizedDescription");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = CFSTR("Unknown");
      if (v20)
        v22 = (const __CFString *)v20;
      *(_DWORD *)buf = 138543618;
      v27 = v2;
      v28 = 2114;
      v29 = v22;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigFileParseFailure", "ERROR: Failed to config file at path '%{public}@' due to error: %{public}@", buf, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14);
  }

LABEL_13:
}

@end
