@implementation AFUIIsAppleApp

void __AFUIIsAppleApp_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  AFUIIsAppleApp_isAppleApp = objc_msgSend(v0, "hasPrefix:", CFSTR("com.apple."));

}

@end
