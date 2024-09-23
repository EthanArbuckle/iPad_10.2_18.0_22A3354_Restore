@implementation InitNviLogging

void __InitNviLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("::: Initializing NVI logging..."));
  v0 = os_log_create("com.apple.nvi", "Framework");
  v1 = (void *)NviLogContextFacility;
  NviLogContextFacility = (uint64_t)v0;

  v2 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "InitNviLogging_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ::: NVI logging initialized", (uint8_t *)&v3, 0xCu);
  }
}

@end
