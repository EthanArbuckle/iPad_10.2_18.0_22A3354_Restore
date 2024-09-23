@implementation NUNILoggingObjectForDomain

void __NUNILoggingObjectForDomain_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.NanoUniverse", "nanouniverse");
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setObject:forKey:", v1, v2);

  }
  v3 = (void *)NUNILoggingObjectForDomain___logObjects;
  NUNILoggingObjectForDomain___logObjects = (uint64_t)v0;

}

@end
