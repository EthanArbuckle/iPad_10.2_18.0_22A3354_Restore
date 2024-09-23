@implementation LSPersonaDatabase

void __36___LSPersonaDatabase_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_LSPersonaDatabase initPrivately]([_LSPersonaDatabase alloc], "initPrivately");
  v1 = (void *)+[_LSPersonaDatabase sharedInstance]::sharedInstance;
  +[_LSPersonaDatabase sharedInstance]::sharedInstance = (uint64_t)v0;

}

void __64___LSPersonaDatabase_personasWithAttributesForBundleIdentifier___block_invoke()
{
  NSObject *v0;

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __64___LSPersonaDatabase_personasWithAttributesForBundleIdentifier___block_invoke_cold_1(v0);

}

void __64___LSPersonaDatabase_personasWithAttributesForBundleIdentifier___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "Could not get personal persona unique string! This will result in bogus persona assocations! Please file a radar against CoreServices. This will only fault once per lifetime of this process.", v1, 2u);
}

@end
