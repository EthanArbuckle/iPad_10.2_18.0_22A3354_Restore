@implementation LACSysUtility

+ (BOOL)isTXMDevice
{
  NSObject *v2;
  _BOOL4 v3;
  size_t v5;
  unsigned int v6;
  size_t v7;
  int v8;

  v8 = 0;
  v7 = 4;
  v6 = 0;
  v5 = 4;
  if (sysctlbyname("security.codesigning.monitor", &v8, &v7, 0, 0))
  {
    LACLogDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      +[LACSysUtility isTXMDevice].cold.2();
LABEL_7:

    goto LABEL_8;
  }
  if (sysctlbyname("security.codesigning.config", &v6, &v5, 0, 0))
  {
    LACLogDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      +[LACSysUtility isTXMDevice].cold.1();
    goto LABEL_7;
  }
  if (v8 == 2)
    return v6 >> 31;
LABEL_8:
  LOBYTE(v3) = 0;
  return v3;
}

+ (unint64_t)txmSecurityBootMode
{
  int v2;
  NSObject *v3;
  unsigned int v4;
  int v5;
  size_t v7;
  unsigned int v8;
  uint8_t buf[4];
  unsigned int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v7 = 4;
  v2 = sysctlbyname("security.codesigning.security_boot_mode_complete", &v8, &v7, 0, 0);
  LACLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v8;
    v5 = *__error();
    *(_DWORD *)buf = 67109632;
    v10 = v4;
    v11 = 1024;
    v12 = v2;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "TXM boot mode returned value: %d error: %d global error: %d", buf, 0x14u);
  }

  if (v2)
    return 0;
  else
    return v8;
}

+ (void)isTXMDevice
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2409DC000, v0, v1, "Sysctl security.codesigning.monitor failed with error code: %d global error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
