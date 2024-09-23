@implementation InitiateAuthTimeoutSysdiagnose

void __acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose_block_invoke()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v0 = 136315394;
    v1 = "acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose_block_invoke";
    v2 = 1024;
    v3 = 79;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v0, 0x12u);
  }
  _acc_sysdiagnose_authFailure(1);
  _isSysdiagnosePending = 0;
}

@end
