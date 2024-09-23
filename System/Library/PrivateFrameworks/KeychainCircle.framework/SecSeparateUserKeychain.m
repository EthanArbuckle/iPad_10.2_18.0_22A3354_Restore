@implementation SecSeparateUserKeychain

void __SecSeparateUserKeychain_block_invoke()
{
  NSObject *v0;
  const char *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  SecSeparateUserKeychain_ffSeparateUserKeychain = _os_feature_enabled_impl();
  v0 = secLogObjForScope("keychain");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (SecSeparateUserKeychain_ffSeparateUserKeychain)
      v1 = "enabled";
    else
      v1 = "disabled";
    v2 = 136315138;
    v3 = v1;
    _os_log_impl(&dword_20D7B6000, v0, OS_LOG_TYPE_DEFAULT, "SeparateUserKeychain set via feature flag to %s", (uint8_t *)&v2, 0xCu);
  }
}

@end
