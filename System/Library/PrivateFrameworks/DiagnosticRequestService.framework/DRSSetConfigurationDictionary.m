@implementation DRSSetConfigurationDictionary

void __DRSSetConfigurationDictionary_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  char v5;
  NSObject *v6;
  char v7;
  id v8;
  id v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  char v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  char v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  if (!objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v48))
  {
LABEL_8:
    v46 = 0;
    v10 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v46);
    v9 = v46;
    if ((v10 & 1) != 0)
    {
      DPLogHandle_DPConfig();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v2;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CreatedConfigurationDirectory", "Created %{public}@", buf, 0xCu);
      }

      v4 = 0;
      v5 = 1;
      goto LABEL_22;
    }
    DPLogHandle_DPConfigError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v9, "localizedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("Unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      *(_DWORD *)buf = 138543618;
      v50 = v2;
      v51 = 2114;
      v52 = v15;
      v16 = "CreateDirectoryFailure";
      v17 = "ERROR: Failed to create %{public}@ due to error: %{public}@";
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x16u);

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (v48)
  {
    v4 = 0;
    v5 = 1;
    goto LABEL_23;
  }
  DPLogHandle_DPConfigError();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v2;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationDirectoryIsFile", "ERROR: %{public}@ exists but is not a directory", buf, 0xCu);
  }

  v47 = 0;
  v7 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v47);
  v8 = v47;
  v9 = v8;
  if ((v7 & 1) != 0)
  {

    goto LABEL_8;
  }
  DPLogHandle_DPConfigError();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    objc_msgSend(v9, "localizedDescription");
    v18 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v18;
    v19 = CFSTR("Unknown");
    if (v18)
      v19 = (const __CFString *)v18;
    *(_DWORD *)buf = 138543618;
    v50 = v2;
    v51 = 2114;
    v52 = v19;
    v16 = "ConfigDirectoryIsFileRemovalFailure";
    v17 = "ERROR: Failed to remove file that should be the config directory at path '%{public}@' due to error: %{public}@";
    goto LABEL_20;
  }
LABEL_21:

  v4 = objc_retainAutorelease(v9);
  v5 = 0;
  v9 = v4;
LABEL_22:

LABEL_23:
  v20 = v4;
  v21 = v20;
  if ((v5 & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 48));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 40);
      v44 = 0;
      v24 = objc_msgSend(v23, "writeToURL:error:", v22, &v44);
      v25 = v44;
      if ((v24 & 1) != 0)
      {
        DPLogHandle_DPConfig();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v26))
        {
          v27 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "description");
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v27;
          v51 = 2114;
          v52 = v28;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SavedConfiguration", "Saved config to path '%{public}@'. Config:\n%{public}@", buf, 0x16u);

        }
LABEL_33:

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v36 = *(void **)(v35 + 40);
        *(_QWORD *)(v35 + 40) = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "fileExistsAtPath:", *(_QWORD *)(a1 + 48)) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        v37 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v25 = *(id *)(v37 + 40);
        *(_QWORD *)(v37 + 40) = 0;
LABEL_42:

        goto LABEL_43;
      }
      v31 = *(_QWORD *)(a1 + 48);
      v45 = 0;
      v32 = objc_msgSend(v22, "removeItemAtPath:error:", v31, &v45);
      v25 = v45;
      DPLogHandle_DPConfigError();
      v26 = objc_claimAutoreleasedReturnValue();
      v33 = os_signpost_enabled(v26);
      if ((v32 & 1) != 0)
      {
        if (v33)
        {
          v34 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v50 = v34;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearedConfigFile", "Cleared config file at path '%{public}@'", buf, 0xCu);
        }
        goto LABEL_33;
      }
      if (v33)
      {
        v38 = *(void **)(a1 + 32);
        objc_msgSend(v25, "localizedDescription");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        v41 = CFSTR("Unknown");
        if (v39)
          v41 = (const __CFString *)v39;
        *(_DWORD *)buf = 138543618;
        v50 = v38;
        v51 = 2114;
        v52 = v41;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearConfigFileFailure", "ERROR: Failed to remove config file at path '%{public}@' due to error: %{public}@", buf, 0x16u);

      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v43 = v25;
    v36 = *(void **)(v42 + 40);
    *(_QWORD *)(v42 + 40) = v43;
    goto LABEL_41;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v30 = v20;
  v22 = *(void **)(v29 + 40);
  *(_QWORD *)(v29 + 40) = v30;
LABEL_43:

}

@end
