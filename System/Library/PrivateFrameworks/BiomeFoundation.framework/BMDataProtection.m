@implementation BMDataProtection

+ (int)biomeProtectionClassToOSProtectionClass:(unint64_t)a3
{
  if (a3 > 6)
    return 3;
  else
    return dword_1AEB5CA30[a3];
}

+ (BOOL)canOpenFilesForProtectionClass:(unint64_t)a3
{
  return objc_msgSend(a1, "canOpenFilesForProtectionClass:createNewFile:", a3, 0);
}

+ (BOOL)canOpenFilesForProtectionClass:(unint64_t)a3 createNewFile:(BOOL)a4
{
  char v8;
  char v9;
  BOOL result;
  NSObject *v11;

  v8 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
  v9 = objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked");
  result = 1;
  switch(a3)
  {
    case 0uLL:
      result = v9;
      break;
    case 1uLL:
    case 2uLL:
      result = v9 | a4;
      break;
    case 3uLL:
      result = v8 ^ 1;
      break;
    case 4uLL:
    case 6uLL:
      return result;
    case 5uLL:
      if ((v8 & 1) != 0)
        goto LABEL_9;
      result = objc_msgSend(a1, "isClassCXUnlocked");
      break;
    default:
      __biome_log_for_category(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[BMDataProtection canOpenFilesForProtectionClass:createNewFile:].cold.1(a2, a3, v11);

LABEL_9:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)requiresUnlockToOpen:(unint64_t)a3
{
  return a3 - 7 < 0xFFFFFFFFFFFFFFFCLL;
}

+ (BOOL)losesReadAccessOnLock:(unint64_t)a3
{
  return (a3 < 7) & (3u >> a3);
}

+ (BOOL)isClassCXUnlocked
{
  int extended_device_state;
  int v3;
  NSObject *v4;

  extended_device_state = aks_get_extended_device_state();
  if (extended_device_state)
  {
    v3 = extended_device_state;
    __biome_log_for_category(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[BMDataProtection isClassCXUnlocked].cold.1(v3, v4);

  }
  return 0;
}

+ (void)isClassCXUnlocked
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_ERROR, "aks_get_extended_device_state failed with error: %d", (uint8_t *)v2, 8u);
}

+ (void)canOpenFilesForProtectionClass:(NSObject *)a3 createNewFile:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = a2;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_ERROR, "Invalid protection class (%ld) sent to %@", (uint8_t *)&v6, 0x16u);

}

@end
