@implementation CLKLoggingObjectForDomain

void __CLKLoggingObjectForDomain_block_invoke()
{
  void *v0;
  unint64_t i;
  const char *v2;
  const char *v3;
  os_log_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = -1; i != 10; ++i)
  {
    v2 = "default";
    if (i == 9)
      v3 = "com.apple.runtime-issues";
    else
      v3 = "ClockKit";
    if (i <= 9)
      v2 = off_24CBFA430[i];
    v4 = os_log_create(v3, v2);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", i + 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "setObject:forKey:", v4, v5);

    }
  }
  v6 = (void *)CLKLoggingObjectForDomain___logObjects;
  CLKLoggingObjectForDomain___logObjects = (uint64_t)v0;

}

@end
