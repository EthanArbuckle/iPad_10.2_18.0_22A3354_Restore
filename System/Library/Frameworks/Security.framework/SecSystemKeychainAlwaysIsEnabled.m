@implementation SecSystemKeychainAlwaysIsEnabled

void ___SecSystemKeychainAlwaysIsEnabled_block_invoke()
{
  NSObject *v0;
  const char *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _SecSystemKeychainAlwaysIsEnabled_ffSystemKeychainAlwaysSupported = _os_feature_enabled_impl();
  v0 = secLogObjForScope("keychain");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (_SecSystemKeychainAlwaysIsEnabled_ffSystemKeychainAlwaysSupported)
      v1 = "enabled";
    else
      v1 = "disabled";
    v2 = 136315138;
    v3 = v1;
    _os_log_impl(&dword_18A900000, v0, OS_LOG_TYPE_DEFAULT, "System Keychain Always Supported set via feature flag to %s", (uint8_t *)&v2, 0xCu);
  }
}

@end
