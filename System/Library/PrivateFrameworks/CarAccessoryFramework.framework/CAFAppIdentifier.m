@implementation CAFAppIdentifier

void __CAFAppIdentifier_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    v3 = (void *)CAFAppIdentifier_appIdentifier;
    CAFAppIdentifier_appIdentifier = (uint64_t)v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)CAFAppIdentifier_appIdentifier;
    CAFAppIdentifier_appIdentifier = v4;

  }
}

@end
