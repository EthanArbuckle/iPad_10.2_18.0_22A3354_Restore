@implementation NPSShouldRun

void __NPSShouldRun_block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D51800];
  if (notify_register_check((const char *)objc_msgSend((id)*MEMORY[0x1E0D51800], "UTF8String"), &NPSShouldRun_notifyToken))
  {
    v1 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      v2 = 138412290;
      v3 = v0;
      _os_log_impl(&dword_1B5280000, v1, OS_LOG_TYPE_DEFAULT, "Failed to get notify token %@", (uint8_t *)&v2, 0xCu);
    }
  }
}

@end
