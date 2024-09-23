@implementation EDPersonaPersistenceLayoutManager

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EDPersonaPersistenceLayoutManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_67 != -1)
    dispatch_once(&log_onceToken_67, block);
  return (OS_os_log *)(id)log_log_67;
}

void __40__EDPersonaPersistenceLayoutManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_67;
  log_log_67 = (uint64_t)v1;

}

+ (id)baseAccountDirectoryForPersonaIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "baseAccountDirectoryPathForPersonaIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)baseAccountDirectoryPathForPersonaIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v7 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v17);
  v8 = v17;
  if (v8)
  {
    v9 = v8;
    +[EDPersonaPersistenceLayoutManager log](EDPersonaPersistenceLayoutManager, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v9, "ef_publicDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDPersonaPersistenceLayoutManager baseAccountDirectoryPathForPersonaIdentifier:].cold.2((uint64_t)v4, v11, (uint64_t)v18);
    }

    v12 = 0;
  }
  else
  {
    objc_msgSend(v6, "generateAndRestorePersonaContextWithIdentityString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[EDPersonaPersistenceLayoutManager log](EDPersonaPersistenceLayoutManager, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v9, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDPersonaPersistenceLayoutManager baseAccountDirectoryPathForPersonaIdentifier:].cold.1((uint64_t)v4, v14, (uint64_t)v18);
      }

      v12 = 0;
    }
    else
    {
      objc_msgSend(a1, "iOS_baseAccountDirectoryPathForPersonaIdentifier:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
    v15 = (id)objc_msgSend(v6, "restorePersonaWithSavedPersonaContext:", v7);
  }

  return v12;
}

+ (id)macOS_baseAccountDirectoryPathForPersonaIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("com.apple.MailPersonaStorage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)iOS_baseAccountDirectoryPathForPersonaIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[5];
  uint64_t v13;

  v3 = a3;
  v13 = 1;
  v4 = (void *)container_create_or_lookup_app_group_paths_for_current_user();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", xpc_dictionary_get_count(v4));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__EDPersonaPersistenceLayoutManager_iOS_baseAccountDirectoryPathForPersonaIdentifier___block_invoke;
    v12[3] = &unk_1E949F9B8;
    v12[4] = v5;
    xpc_dictionary_apply(v4, v12);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.MailPersonaStorage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[EDPersonaPersistenceLayoutManager log](EDPersonaPersistenceLayoutManager, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        +[EDPersonaPersistenceLayoutManager iOS_baseAccountDirectoryPathForPersonaIdentifier:].cold.2(v8);

    }
    v9 = v7;

    v10 = v9;
  }
  else
  {
    +[EDPersonaPersistenceLayoutManager log](EDPersonaPersistenceLayoutManager, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[EDPersonaPersistenceLayoutManager iOS_baseAccountDirectoryPathForPersonaIdentifier:].cold.1((uint64_t)v3, &v13, v9);
    v10 = 0;
  }

  return v10;
}

uint64_t __86__EDPersonaPersistenceLayoutManager_iOS_baseAccountDirectoryPathForPersonaIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:relativeToURL:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v6);
  return 1;
}

+ (void)baseAccountDirectoryPathForPersonaIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D2F2C000, v6, v4, "Failed to generate and restore persona context with identifier: %{public}@ error: %{public}@ ", v5);

}

+ (void)baseAccountDirectoryPathForPersonaIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D2F2C000, v6, v4, "Failed to create saved persona context for identifier: %{public}@ error: %{public}@ ", v5);

}

+ (void)iOS_baseAccountDirectoryPathForPersonaIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_0_8(&dword_1D2F2C000, a3, (uint64_t)a3, "Failed to create container with identifier %{public}@ due to container manager error: %llu", (uint8_t *)&v4);
}

+ (void)iOS_baseAccountDirectoryPathForPersonaIdentifier:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_FAULT, "Mail persona container is not in the group container URLs", v1, 2u);
}

@end
