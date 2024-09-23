@implementation DKDoNotDisturbMonitor

void __31___DKDoNotDisturbMonitor_start__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_219056000, v5, OS_LOG_TYPE_DEFAULT, "Success registering for DND: %u, Error=%@", (uint8_t *)v6, 0x12u);
  }

}

@end
