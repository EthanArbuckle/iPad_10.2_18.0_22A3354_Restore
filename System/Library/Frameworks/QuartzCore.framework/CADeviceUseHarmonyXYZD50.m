@implementation CADeviceUseHarmonyXYZD50

void __CADeviceUseHarmonyXYZD50_block_invoke()
{
  int AppBooleanValue;
  NSObject *v1;
  const char *v2;
  Boolean keyExistsAndHasValidFormat[4];
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (CADeviceDisplaySupportsICC::once != -1)
    dispatch_once(&CADeviceDisplaySupportsICC::once, &__block_literal_global_143);
  if (CADeviceDisplaySupportsICC::supports_icc)
  {
    keyExistsAndHasValidFormat[0] = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableHarmonyXYZ"), CFSTR("com.apple.coreanimation"), keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat[0])
      CADeviceUseHarmonyXYZD50::use_d50_xyz = AppBooleanValue != 0;
  }
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v1 = x_log_category_utilities;
    if (os_log_type_enabled((os_log_t)x_log_category_utilities, OS_LOG_TYPE_INFO))
    {
      if (CADeviceUseHarmonyXYZD50::use_d50_xyz)
        v2 = "YES";
      else
        v2 = "NO";
      *(_DWORD *)keyExistsAndHasValidFormat = 136315138;
      v4 = v2;
      _os_log_impl(&dword_184457000, v1, OS_LOG_TYPE_INFO, "CADisplay Harmony Matrix is XYZ: %s\n", keyExistsAndHasValidFormat, 0xCu);
    }
  }
}

@end
