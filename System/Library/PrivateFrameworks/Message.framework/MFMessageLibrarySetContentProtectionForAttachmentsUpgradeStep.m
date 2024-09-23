@implementation MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_20 != -1)
    dispatch_once(&log_onceToken_20, block);
  return (id)log_log_20;
}

void __68__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_20;
  log_log_20 = (uint64_t)v1;

}

- (MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep)initWithBaseAttachmentsDirectory:(id)a3
{
  id v5;
  MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep *v6;
  MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep;
  v6 = -[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseAttachmentsDirectory, a3);

  return v7;
}

- (BOOL)performMigrationStep
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v26;
  void *v27;
  uint64_t v28;
  id obja;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log](MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Starting", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  obja = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep baseAttachmentsDirectory](self, "baseAttachmentsDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0C999D0];
  v44[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obja, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v5, 0, &__block_literal_global_49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v7)
  {
    v31 = *(_QWORD *)v36;
    v28 = *MEMORY[0x1E0CB2AD8];
    v27 = (void *)*MEMORY[0x1E0CB2AB8];
    *(_QWORD *)&v8 = 138412546;
    v26 = v8;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
        v34 = 0;
        v11 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v34, v32, 0, v26);
        v12 = v34;
        v13 = v12;
        if (v11 && (objc_msgSend(v12, "BOOLValue") & 1) == 0)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v10, 0, 0);
          objc_msgSend(v14, "fileAttributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v28);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v27, "isEqualToString:", v16) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "path");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0;
            v19 = objc_msgSend(v17, "mf_protectFileAtPath:withClass:error:", v18, 2, &v33);
            v20 = v33;

            if ((v19 & 1) == 0)
            {
              +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log](MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep, "log");
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v10, "path");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "ef_publicDescription");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v26;
                v40 = v22;
                v41 = 2114;
                v42 = v23;
                _os_log_error_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_ERROR, "Error setting the protection class on \"%@\": %{public}@", buf, 0x16u);

              }
            }

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v7);
  }

  +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log](MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep, "log");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "Finished", buf, 2u);
  }

  return 1;
}

uint64_t __85__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_performMigrationStep__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  +[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep log](MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __85__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_performMigrationStep__block_invoke_cold_1((uint64_t)v4, v7, v9, v6);
  }

  return 1;
}

- (NSURL)baseAttachmentsDirectory
{
  return self->_baseAttachmentsDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseAttachmentsDirectory, 0);
}

void __85__MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep_performMigrationStep__block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Compression: Failed to enumerate URL [%@] due to error [%{public}@]", buf, 0x16u);

}

@end
