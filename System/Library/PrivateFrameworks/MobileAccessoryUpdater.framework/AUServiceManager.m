@implementation AUServiceManager

+ (void)startService
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD1998], "serviceListener");
  objc_msgSend(v3, "setDelegate:", v2);
  objc_msgSend(v3, "resume");
}

+ (int)startServiceInSandbox
{
  int v2;

  v2 = AUSandboxPlatformInit(0, 0);
  if (!v2)
    +[AUServiceManager startService](AUServiceManager, "startService");
  return v2;
}

@end
