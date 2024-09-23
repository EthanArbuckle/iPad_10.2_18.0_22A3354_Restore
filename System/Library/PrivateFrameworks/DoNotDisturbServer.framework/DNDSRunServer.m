@implementation DNDSRunServer

void __DNDSRunServer_block_invoke()
{
  void *v0;
  dispatch_source_t v1;
  void *v2;
  NSObject *v3;
  DNDSServer *v4;
  void *v5;
  uint8_t v6[16];

  v0 = (void *)MEMORY[0x1D17A0B90]();
  DNDSRegisterLogging();
  DNDSRegisterSysdiagnose();
  signal(15, (void (__cdecl *)(int))1);
  v1 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, 0);
  v2 = (void *)_block_invoke_sigterm_source;
  _block_invoke_sigterm_source = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)_block_invoke_sigterm_source, &__block_literal_global_1);
  dispatch_activate((dispatch_object_t)_block_invoke_sigterm_source);
  DNDSMigrateLegacySettings();
  v3 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Starting up...", v6, 2u);
  }
  v4 = objc_alloc_init(DNDSServer);
  v5 = (void *)server;
  server = (uint64_t)v4;

  objc_msgSend((id)server, "resume");
  objc_autoreleasePoolPop(v0);
}

uint64_t __DNDSRunServer_block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1CB895000, v0, OS_LOG_TYPE_DEFAULT, "Received SIGTERM", v2, 2u);
  }
  return xpc_transaction_exit_clean();
}

@end
