@implementation NSSShouldRun

void __NSSShouldRun_block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (notify_register_check("com.apple.nanoregistry.watchdidbecomeactive", &NSSShouldRun_notifyToken))
  {
    NSSLogForType(1);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = 136315394;
      v2 = "com.apple.nanoregistry.watchdidbecomeactive";
      v3 = 2080;
      v4 = "NSSShouldRun_block_invoke";
      _os_log_impl(&dword_211335000, v0, OS_LOG_TYPE_DEFAULT, "Failed to get notify token %s %s", (uint8_t *)&v1, 0x16u);
    }

  }
}

@end
