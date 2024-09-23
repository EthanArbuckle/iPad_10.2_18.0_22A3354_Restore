@implementation NSString(BRCPackageAdditions)

+ (uint64_t)brc_closeForcedPackageExtensionsForPersona:()BRCPackageAdditions
{
  id v3;

  v3 = a3;
  pthread_rwlock_wrlock(&_forcedPackageExtensionsMutex);
  objc_msgSend((id)_loadedPersonaIDs, "removeObjectForKey:", v3);

  return pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);
}

+ (void)brc_loadForcedPackageExtensionsForCurrentPersona
{
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4_3();
  v7 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Migrating %lu extensions%@", v6);
}

+ (uint64_t)brc_addForcedPackageExtension:()BRCPackageAdditions
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  pthread_rwlock_wrlock(&_forcedPackageExtensionsMutex);
  v4 = (void *)_unifiedForcedPackageExtensions;
  objc_msgSend(v3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v5);
  pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);
  return _BRCWritePackageExtensions();
}

- (uint64_t)brc_isForcedPackageExtension
{
  void *v2;
  void *v3;
  uint64_t v4;

  pthread_rwlock_rdlock(&_forcedPackageExtensionsMutex);
  v2 = (void *)_unifiedForcedPackageExtensions;
  objc_msgSend(a1, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  pthread_rwlock_unlock(&_forcedPackageExtensionsMutex);
  return v4;
}

- (uint64_t)brc_isBlacklistedPackageExtension
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blacklistedPackageExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

@end
