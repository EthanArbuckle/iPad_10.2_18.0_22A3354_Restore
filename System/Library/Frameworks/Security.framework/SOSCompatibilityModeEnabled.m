@implementation SOSCompatibilityModeEnabled

void __SOSCompatibilityModeEnabled_block_invoke()
{
  NSObject *v0;
  const char *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  SOSCompatibilityModeEnabled_ffDeferSOSFromSignInStatus = _os_feature_enabled_impl();
  secLogObjForScope("octagon");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if (SOSCompatibilityModeEnabled_ffDeferSOSFromSignInStatus)
      v1 = "enabled";
    else
      v1 = "disabled";
    v2 = 136315138;
    v3 = v1;
    _os_log_impl(&dword_18A900000, v0, OS_LOG_TYPE_DEFAULT, "DeferSOSFromSignIn is %s", (uint8_t *)&v2, 0xCu);
  }

}

@end
