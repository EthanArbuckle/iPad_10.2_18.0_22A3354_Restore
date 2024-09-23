@implementation DRSCKConfigStore

- (DRSCKConfigStore)initWithWorkingDirectory:(id)a3 isReadOnly:(BOOL)a4 errorOut:(id *)a5
{
  id v9;
  DRSCKConfigStore *v10;
  DRSCKConfigStore *v11;
  void *v12;
  NSPersistentContainer *v13;
  id v14;
  id v15;
  DRSCKConfigStore *v16;
  NSPersistentContainer *container;
  NSPersistentContainer *v18;
  void *v19;
  uint64_t v20;
  NSManagedObjectContext *context;
  id v23;
  objc_super v24;

  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DRSCKConfigStore;
  v10 = -[DRSCKConfigStore init](&v24, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_5;
  objc_storeStrong((id *)&v10->_workingDirectory, a3);
  v11->_isReadOnly = a4;
  -[DRSCKConfigStore workingDirectory](v11, "workingDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  DRSCKConfigPersistentContainer(v12, -[DRSCKConfigStore isReadOnly](v11, "isReadOnly"), &v23);
  v13 = (NSPersistentContainer *)objc_claimAutoreleasedReturnValue();
  v14 = v23;

  if (!v14)
  {
    container = v11->_container;
    v11->_container = v13;
    v18 = v13;

    -[DRSCKConfigStore container](v11, "container");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "newBackgroundContext");
    context = v11->_context;
    v11->_context = (NSManagedObjectContext *)v20;

LABEL_5:
    v16 = v11;
    goto LABEL_6;
  }
  v15 = objc_retainAutorelease(v14);
  *a5 = v15;

  v16 = 0;
LABEL_6:

  return v16;
}

- (id)_currentConfig_ON_MOC_QUEUE:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  char v38;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  const __CFString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[DRSCKConfigStore context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DRSCKConfigMO fetchRequest](DRSCKConfigMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v45;

  if (!v8)
  {
    if (objc_msgSend(v7, "count"))
    {
      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
        objc_msgSend(v7, "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v36;
        if (v36)
        {
          if ((objc_msgSend(v36, "overridesDefault") & 1) != 0
            || (+[DRSCKConfig defaultConfig](DRSCKConfig, "defaultConfig"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                v38 = objc_msgSend(v24, "isEqual:", v37),
                v37,
                (v38 & 1) != 0))
          {
            v13 = 0;
            goto LABEL_36;
          }
        }
LABEL_22:
        DPLogHandle_CKConfig();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v25))
        {
          +[DRSCKConfig defaultConfig](DRSCKConfig, "defaultConfig");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "debugDescription");
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v27;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PopulatingDefaultConfig", "Populating config entry with default (%{public}@", buf, 0xCu);

        }
        +[DRSCKConfig defaultConfig](DRSCKConfig, "defaultConfig");
        v28 = objc_claimAutoreleasedReturnValue();
        -[DRSCKConfigStore context](self, "context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend((id)v28, "newConfigMOInContext_ON_MOC_QUEUE:", v29);

        -[DRSCKConfigStore context](self, "context");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        LOBYTE(v28) = objc_msgSend(v31, "save:", &v40);
        v13 = v40;

        if ((v28 & 1) == 0)
        {
          DPLogHandle_CoreDataError();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v32))
          {
            objc_msgSend(v13, "localizedDescription");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v33;
            v35 = CFSTR("Unknown");
            if (v33)
              v35 = (const __CFString *)v33;
            *(_DWORD *)buf = 138543362;
            v48 = v35;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToSaveCKConfig", "Failed a CK Config managed object due to error: %{public}@", buf, 0xCu);

          }
          if (a3)
          {
            v13 = objc_retainAutorelease(v13);
            v14 = 0;
            *a3 = v13;
          }
          else
          {
            v14 = 0;
          }
          goto LABEL_38;
        }
        v24 = v30;
LABEL_36:
        v30 = v24;
        v14 = v30;
LABEL_38:

        goto LABEL_39;
      }
      DPLogHandle_CKConfigError();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        v16 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = v16;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NonUniqueCKConfig", "Found %u configs. Attempting to delete and recover from state.", buf, 8u);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = v7;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            -[DRSCKConfigStore context](self, "context");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "deleteObject:", v22);

          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v19);
      }
    }
    else
    {
      DPLogHandle_CKConfig();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigManagedObjectFetchMiss", "No cached CK Config", buf, 2u);
      }
    }

    v24 = 0;
    goto LABEL_22;
  }
  DPLogHandle_CoreDataError();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    objc_msgSend(v8, "localizedDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("Unknown");
    if (v10)
      v12 = (const __CFString *)v10;
    *(_DWORD *)buf = 138543362;
    v48 = v12;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigMOFetch", "Failed to fetch a CK Config managed object due to error: %{public}@", buf, 0xCu);

  }
  v13 = v8;
  v14 = 0;
LABEL_39:

  return v14;
}

- (BOOL)saveConfig:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  DRSCKConfigStore *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[DRSCKConfigStore context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __40__DRSCKConfigStore_saveConfig_errorOut___block_invoke;
  v18 = &unk_1EA3D14F8;
  v19 = self;
  v21 = &v23;
  v22 = &v29;
  v8 = v6;
  v20 = v8;
  objc_msgSend(v7, "performBlockAndWait:", &v15);

  if (!*((_BYTE *)v30 + 24))
  {
    DPLogHandle_CKConfigError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend((id)v24[5], "localizedDescription", v15, v16, v17, v18, v19);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("Unknown");
      if (v10)
        v12 = (const __CFString *)v10;
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SaveConfigFailed", "Failed due to error: %{public}@", buf, 0xCu);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v24[5]);
  v13 = *((_BYTE *)v30 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __40__DRSCKConfigStore_saveConfig_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend(v2, "_currentConfig_ON_MOC_QUEUE:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v11;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
  if (v3)
  {
    objc_msgSend(v3, "setContainerEnvironment:", objc_msgSend(*(id *)(a1 + 40), "containerEnvironment"));
    objc_msgSend(v3, "setRapidEnvironment:", objc_msgSend(*(id *)(a1 + 40), "rapidEnvironment"));
    objc_msgSend(v3, "setOverridesDefault:", objc_msgSend(*(id *)(a1 + 40), "overridesDefault"));
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    v7 = objc_msgSend(v6, "save:", &v10);
    v8 = v10;
    v9 = v10;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
    v5 = v9;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (BOOL)resetToDefaultWithErrorOut:(id *)a3
{
  void *v5;

  +[DRSCKConfig defaultConfig](DRSCKConfig, "defaultConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[DRSCKConfigStore saveConfig:errorOut:](self, "saveConfig:errorOut:", v5, a3);

  return (char)a3;
}

- (id)currentConfig:(id *)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[DRSCKConfigStore context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__DRSCKConfigStore_currentConfig___block_invoke;
  v8[3] = &unk_1EA3D1520;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __34__DRSCKConfigStore_currentConfig___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v2, "_currentConfig_ON_MOC_QUEUE:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = v9;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v4);
  if (v3)
  {
    +[DRSCKConfig _configWithConfigMO_ON_MOC_QUEUE:](DRSCKConfig, "_configWithConfigMO_ON_MOC_QUEUE:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_workingDirectory, 0);
}

@end
