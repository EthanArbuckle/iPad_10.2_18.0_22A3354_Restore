@implementation IRPlatformInfo

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_25);
  return isInternalInstall_sIsInternalInstall;
}

void __35__IRPlatformInfo_isInternalInstall__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(CFSTR("com.apple.IntelligentRouting"), "UTF8String");
  isInternalInstall_sIsInternalInstall = os_variant_has_internal_content();
  v0 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    if (isInternalInstall_sIsInternalInstall)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_23FFBA000, v0, OS_LOG_TYPE_DEFAULT, "sIsInternalInstall %@", (uint8_t *)&v2, 0xCu);
  }
}

+ (BOOL)isRunningInUnitTesting
{
  if (isRunningInUnitTesting_onceToken != -1)
    dispatch_once(&isRunningInUnitTesting_onceToken, &__block_literal_global_6);
  return 0;
}

@end
