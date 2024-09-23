@implementation BRCWritePackageExtensions

uint64_t ___BRCWritePackageExtensions_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "packageExtensionPlistWriteInterval");
  dispatch_get_global_queue(9, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  br_pacer_create();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_BRCWritePackageExtensions_pacer;
  _BRCWritePackageExtensions_pacer = v2;

  br_pacer_set_event_handler();
  return br_pacer_resume();
}

void ___BRCWritePackageExtensions_block_invoke_2()
{
  void *v0;
  void *v1;
  NSObject *v2;
  void *v3;

  pthread_rwlock_rdlock(&_forcedPackageExtensionsMutex);
  objc_msgSend((id)_loadedPersonaIDs, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_17);
  objc_msgSend((id)_unifiedForcedPackageExtensions, "allObjects");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    ___BRCWritePackageExtensions_block_invoke_2_cold_1();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
  objc_msgSend(v3, "setObject:forKey:", v0, CFSTR("iCDPackageExtensions"));
  pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);

}

void ___BRCWritePackageExtensions_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a2;
  v7 = a3;
  v5 = v7;
  v6 = v4;
  BRPerformWithPersonaAndError();

}

void ___BRCWritePackageExtensions_block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a2)
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      ___BRCWritePackageExtensions_block_invoke_4_cold_1((uint64_t)v2, v3);

  }
  else
  {
    objc_msgSend((id)_unifiedForcedPackageExtensions, "allObjects");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
    objc_msgSend(MEMORY[0x1E0CB3940], "br_supportDirForPersona:dataSeparated:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("pkg_extensions.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "writeToFile:atomically:", v8, 1);
  }
}

void ___BRCWritePackageExtensions_block_invoke_2_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  v3 = v0;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v1, (uint64_t)v1, "[DEBUG] Persisting %@ for FileProvider%@", v2);
  OUTLINED_FUNCTION_2();
}

void ___BRCWritePackageExtensions_block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't change personas while saving package extensions list%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
