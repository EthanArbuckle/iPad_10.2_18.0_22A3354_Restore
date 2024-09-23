@implementation MSNFailureMode

void __MSNFailureMode_block_invoke()
{
  int AppIntegerValue;
  int v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  char *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Boolean keyExistsAndHasValidFormat;
  stat v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("MediaSafetyNetFailureMode"), CFSTR("com.apple.mediaserverd"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppIntegerValue;
  else
    v1 = 2;
  _MergedGlobals = v1;
  if (os_variant_allows_internal_security_policies())
  {
    memset(&v22, 0, sizeof(v22));
    if (!stat("/var/db/internal_disable_mediasafetynet_cookie", &v22))
    {
      MSNLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        __MSNFailureMode_block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);

      _MergedGlobals = 1;
    }
  }
  MSNLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (_MergedGlobals >= 6)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown mode";
      MSNLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        ServerModeDescription_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);

      abort();
    }
    v11 = "";
    v12 = off_1E97762B0[_MergedGlobals];
    if (!keyExistsAndHasValidFormat)
      v11 = " default";
    v22.st_dev = 136315394;
    *(_QWORD *)&v22.st_mode = v11;
    WORD2(v22.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v22.st_ino + 6) = (__darwin_ino64_t)v12;
    _os_log_impl(&dword_1D416F000, v10, OS_LOG_TYPE_INFO, "MediaSafetyNet%s failure mode: %s", (uint8_t *)&v22, 0x16u);
  }

}

void __MSNFailureMode_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D416F000, a1, a3, "MediaSafetyNet state failure downgraded to log due to existence of /var/db/disable_mediasafetynet.", a5, a6, a7, a8, 0);
}

@end
