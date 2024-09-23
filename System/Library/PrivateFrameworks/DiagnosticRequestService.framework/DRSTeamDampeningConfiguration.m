@implementation DRSTeamDampeningConfiguration

- (id)jsonCompatibleDictRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jsonCompatibleDictRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kDRSDMDefaultConfigKey);

  }
  -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__DRSTeamDampeningConfiguration_jsonCompatibleDictRepresentation__block_invoke;
    v13[3] = &unk_1EA3D2B68;
    v14 = v9;
    v11 = v9;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kDRSDMIssueCategoryDictKey);
  }
  return v3;
}

void __65__DRSTeamDampeningConfiguration_jsonCompatibleDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "jsonCompatibleDictRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Default config:\n%@\n%@"), CFSTR("=========================="), v6);

  }
  -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__DRSTeamDampeningConfiguration_debugDescription__block_invoke;
    v10[3] = &unk_1EA3D2B68;
    v11 = v3;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  return v3;
}

void __49__DRSTeamDampeningConfiguration_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "debugDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@:\n%@\n%@"), v5, CFSTR("=========================="), v6);

}

- (DRSTeamDampeningConfiguration)initWithPlistDict:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  DRSTeamDampeningConfiguration *v7;
  DRSDampeningConfiguration *v8;
  const char *v9;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint8_t v17[16];
  _QWORD v18[4];
  id v19;
  uint8_t *v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v29 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke;
  v25[3] = &unk_1EA3D2B90;
  v25[4] = &v26;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v25);
  if (!*((_BYTE *)v27 + 24))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSDMDefaultConfigKey);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        DPLogHandle_DampeningManagerError();
        v8 = (DRSDampeningConfiguration *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(&v8->super))
        {
          *(_WORD *)buf = 0;
          v9 = "Invalid default config dictionary value";
          goto LABEL_19;
        }
LABEL_20:
        v7 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v8 = -[DRSDampeningConfiguration initWithPlistDict:]([DRSDampeningConfiguration alloc], "initWithPlistDict:", v6);
      if (!v8)
      {
        DPLogHandle_DampeningManagerError();
        v8 = (DRSDampeningConfiguration *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(&v8->super))
        {
          *(_WORD *)buf = 0;
          v9 = "Malformed default config dictionary";
LABEL_19:
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, &v8->super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", v9, buf, 2u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", kDRSDMIssueCategoryDictKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        DPLogHandle_DampeningManagerError();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", "Invalid issue category to config dictionary value", buf, 2u);
        }

        v14 = 0;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      *(_QWORD *)buf = 0;
      v22 = buf;
      v23 = 0x2020000000;
      v24 = 0;
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke_283;
      v18[3] = &unk_1EA3D2980;
      v20 = buf;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v11;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v18);
      v12 = v22[24];
      if (v22[24])
      {
        DPLogHandle_DampeningManagerError();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v13))
        {
          *(_WORD *)v17 = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", "Malformed issue category-to-config plist dictionary value", v17, 2u);
        }

        v14 = 0;
      }
      else
      {
        v14 = v11;
      }

      _Block_object_dispose(buf, 8);
      if (v12)
      {
LABEL_27:
        v7 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      v14 = 0;
    }
    self = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:](self, "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", v8, v14);
    v7 = self;
    goto LABEL_29;
  }
  DPLogHandle_DampeningManagerError();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningFromPlistFailure", "Malformed team dampening plist", buf, 2u);
  }
  v7 = 0;
LABEL_31:

  _Block_object_dispose(&v26, 8);
  return v7;
}

void __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  id v9;

  v9 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __51__DRSTeamDampeningConfiguration_initWithPlistDict___block_invoke_283(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  DRSDampeningConfiguration *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = -[DRSDampeningConfiguration initWithPlistDict:]([DRSDampeningConfiguration alloc], "initWithPlistDict:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

+ (id)teamIdToTeamDampeningConfigFromPlistDirectoryPath:(id)a3 errorOut:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  DRSTeamDampeningConfiguration *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  NSObject *v44;
  void *v45;
  id *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  char v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  if (v5)
  {
    v59 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v59);

    if ((v8 & 1) == 0)
    {
      DPLogHandle_DampeningManager();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        *(_DWORD *)buf = 138543362;
        v61 = (uint64_t)v6;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlistDirectoryMissing", "Plist directory %{public}@ does not exist", buf, 0xCu);
      }
      v15 = 0;
      goto LABEL_54;
    }
    if (v59)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, 0, 0, &v58);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v58;

      if (v12)
      {
        DPLogHandle_DampeningManagerError();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v13))
        {
          objc_msgSend(v12, "localizedDescription");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = (uint64_t)v6;
          v62 = 2114;
          v63 = v14;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CouldNotEnumeratePlistDirectory", "Could not enumerate plist directory %{public}@ due to error: %{public}@", buf, 0x16u);

        }
        v15 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v12);
LABEL_53:

        goto LABEL_54;
      }
      v47 = a4;
      v49 = v9;
      v50 = v6;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v48 = v11;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      if (!v19)
      {
LABEL_38:

        v15 = v17;
        v39 = v17;
        v9 = v49;
        v6 = v50;
        v12 = 0;
        v11 = v48;
LABEL_52:

        goto LABEL_53;
      }
      v20 = v19;
      v21 = *(_QWORD *)v55;
      v51 = v18;
      v52 = v17;
LABEL_21:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v22);
        if (objc_msgSend(v23, "hasDirectoryPath"))
        {
          DPLogHandle_DampeningManager();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v24))
          {
            objc_msgSend(v23, "path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = (uint64_t)v25;
            v26 = v24;
            v27 = "SkippingPlistSubDir";
LABEL_35:
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v27, "Skipping %{public}@", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v23, "pathExtension");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("plist"));

          if ((v29 & 1) != 0)
          {
            v30 = objc_alloc(MEMORY[0x1E0C99D80]);
            v53 = 0;
            v31 = (void *)objc_msgSend(v30, "initWithContentsOfURL:error:", v23, &v53);
            v24 = v53;
            if (!v31)
            {
              DPLogHandle_DampeningManagerError();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v40))
              {
                objc_msgSend(v23, "path");
                v41 = objc_claimAutoreleasedReturnValue();
                v42 = (void *)v41;
                v43 = CFSTR("Unknown");
                if (v24)
                  v43 = (const __CFString *)v24;
                *(_DWORD *)buf = 138543618;
                v61 = v41;
                v62 = 2114;
                v63 = v43;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlistLoadingError", "Failed to load %{public}@ due to error: %{public}@", buf, 0x16u);

              }
              v9 = v49;
              v6 = v50;
              v12 = 0;
              v11 = v48;
              if (v47)
                *v47 = 0;
              goto LABEL_51;
            }
            v32 = -[DRSTeamDampeningConfiguration initWithPlistDict:]([DRSTeamDampeningConfiguration alloc], "initWithPlistDict:", v31);
            if (!v32)
            {
              DPLogHandle_DampeningManagerError();
              v44 = objc_claimAutoreleasedReturnValue();
              v9 = v49;
              v6 = v50;
              v12 = 0;
              if (os_signpost_enabled(v44))
              {
                objc_msgSend(v23, "path");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v61 = (uint64_t)v45;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigPlistProcessingError", "Failed to intialize team dampening configuration from %{public}@", buf, 0xCu);

              }
              if (v47)
              {
                _dampeningManagerError(CFSTR("Invalid plist dictionary"));
                *v47 = (id)objc_claimAutoreleasedReturnValue();
              }

              v11 = v48;
              v18 = v51;
LABEL_51:

              v15 = 0;
              v39 = v52;
              goto LABEL_52;
            }
            objc_msgSend(v23, "path");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "lastPathComponent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringByDeletingPathExtension");
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

            DPLogHandle_DampeningManager();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v36))
            {
              objc_msgSend(v23, "path");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[DRSTeamDampeningConfiguration debugDescription](v32, "debugDescription");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v61 = (uint64_t)v37;
              v62 = 2114;
              v63 = v35;
              v64 = 2114;
              v65 = v38;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IncludingPlistTeamIDConfig", "Path: %{public}@\nTeamID: %{public}@\nConfig:\n%{public}@", buf, 0x20u);

            }
            v17 = v52;
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v32, v35);

            v18 = v51;
          }
          else
          {
            DPLogHandle_DampeningManager();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v24))
            {
              objc_msgSend(v23, "path");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v61 = (uint64_t)v25;
              v26 = v24;
              v27 = "SkippingNonPlistFile";
              goto LABEL_35;
            }
          }
        }

        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          if (v20)
            goto LABEL_21;
          goto LABEL_38;
        }
      }
    }
    DPLogHandle_DampeningManagerError();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138543362;
      v61 = (uint64_t)v6;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlistDirectoryNotDirectory", "Plist directory %{public}@ is not a directory", buf, 0xCu);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Plist directory path '%@' is not a directory"), v6);
      v9 = objc_claimAutoreleasedReturnValue();
      _dampeningManagerError(v9);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }
  }
  v15 = 0;
LABEL_55:

  return v15;
}

- (void)updateIssueCategoryConfig:(id)a3 newConfig:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (DRSTeamDampeningConfiguration)initWithDefaultConfiguration:(id)a3 issueCategoryToConfigurationDict:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  DRSTeamDampeningConfiguration *v10;
  DRSTeamDampeningConfiguration *v11;
  DRSTeamDampeningConfiguration *v12;
  uint64_t v13;
  NSDictionary *issueCategoryToConfigurationDict;
  objc_super v16;
  uint8_t buf[16];

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)DRSTeamDampeningConfiguration;
    v11 = -[DRSTeamDampeningConfiguration init](&v16, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_defaultConfiguration, a3);
      v13 = objc_msgSend((id)v8, "mutableCopy");
      issueCategoryToConfigurationDict = v12->_issueCategoryToConfigurationDict;
      v12->_issueCategoryToConfigurationDict = (NSDictionary *)v13;

    }
    self = v12;
    v10 = self;
  }
  else
  {
    DPLogHandle_DampeningManagerError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigurationFailure", "Default configuration and issue category configuration dictionary cannot both be nil", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)configurationForIssueCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  DRSTeamDampeningConfiguration *v4;
  DRSTeamDampeningConfiguration *v5;
  DRSTeamDampeningConfiguration *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;

  v4 = (DRSTeamDampeningConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v13 = 1;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7
        && (v8 = (void *)v7,
            -[DRSTeamDampeningConfiguration defaultConfiguration](v6, "defaultConfiguration"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSTeamDampeningConfiguration defaultConfiguration](v6, "defaultConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) == 0)
          goto LABEL_18;
      }
      else
      {
        -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_17;
        -[DRSTeamDampeningConfiguration defaultConfiguration](v6, "defaultConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_18;
      }
      -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](v6, "issueCategoryToConfigurationDict");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](v6, "issueCategoryToConfigurationDict");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqualToDictionary:", v20);

          if ((v21 & 1) != 0)
            goto LABEL_22;
          goto LABEL_18;
        }
      }
      -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](v6, "issueCategoryToConfigurationDict");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
LABEL_22:
          v13 = 1;
          goto LABEL_19;
        }
LABEL_18:
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (id)_initWithTeamDampeningConfigMO_ON_MOC_QUEUE:(id)a3
{
  id v4;
  void *v5;
  DRSDampeningConfiguration *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  DRSTeamDampeningConfiguration *v19;
  NSObject *v20;
  uint64_t v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [DRSDampeningConfiguration alloc];
    objc_msgSend(v4, "defaultConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[DRSDampeningConfiguration _initWithMO_ON_MOC_QUEUE:](v6, "_initWithMO_ON_MOC_QUEUE:", v7);

  }
  else
  {
    v22 = 0;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "categoryConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        v15 = -[DRSDampeningConfiguration _initWithMO_ON_MOC_QUEUE:]([DRSDampeningConfiguration alloc], "_initWithMO_ON_MOC_QUEUE:", v14);
        if (!v15)
        {
          DPLogHandle_DampeningManagerError();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigurationMOInitFailure", "Failed to initialize team dampening configuration from persistence", buf, 2u);
          }

          v19 = 0;
          v18 = (void *)v22;
          goto LABEL_18;
        }
        v16 = v15;
        objc_msgSend(v14, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (!objc_msgSend(v8, "count"))
  {

    v8 = 0;
  }
  v18 = (void *)v22;
  self = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:](self, "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", v22, v8);
  v19 = self;
LABEL_18:

  return v19;
}

- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3 teamID:(id)a4
{
  id v6;
  id v7;
  DRSTeamDampeningConfigurationMO *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  DRSTeamDampeningConfigurationMO *v14;
  DRSTeamDampeningConfigurationMO *v15;
  _QWORD v17[4];
  id v18;
  DRSTeamDampeningConfigurationMO *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v7 = a4;
  v8 = -[DRSTeamDampeningConfigurationMO initWithContext:]([DRSTeamDampeningConfigurationMO alloc], "initWithContext:", v6);
  -[DRSTeamDampeningConfigurationMO setTeamID:](v8, "setTeamID:", v7);
  -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DRSTeamDampeningConfiguration defaultConfiguration](self, "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", v6, CFSTR("defaultConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSTeamDampeningConfigurationMO setDefaultConfiguration:](v8, "setDefaultConfiguration:", v11);

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[DRSTeamDampeningConfiguration issueCategoryToConfigurationDict](self, "issueCategoryToConfigurationDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__DRSTeamDampeningConfiguration__ON_MOC_QUEUE_moRepresentationInContext_teamID___block_invoke;
  v17[3] = &unk_1EA3D2BB8;
  v13 = v6;
  v18 = v13;
  v20 = &v21;
  v14 = v8;
  v19 = v14;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);

  if (*((_BYTE *)v22 + 24))
    v15 = 0;
  else
    v15 = v14;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __80__DRSTeamDampeningConfiguration__ON_MOC_QUEUE_moRepresentationInContext_teamID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a3, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", *(_QWORD *)(a1 + 32), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addCategoryConfigurationsObject:", v8);
  }
  else
  {
    *a4 = 1;
    DPLogHandle_DampeningManagerError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      v10 = 138543362;
      v11 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamDampeningConfigurationMORepresentationFailure", "Failed to get MO representation of config for issueCategory: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (DRSDampeningConfiguration)defaultConfiguration
{
  return self->_defaultConfiguration;
}

- (void)setDefaultConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConfiguration, a3);
}

- (NSDictionary)issueCategoryToConfigurationDict
{
  return self->_issueCategoryToConfigurationDict;
}

- (void)setIssueCategoryToConfigurationDict:(id)a3
{
  objc_storeStrong((id *)&self->_issueCategoryToConfigurationDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueCategoryToConfigurationDict, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
}

@end
