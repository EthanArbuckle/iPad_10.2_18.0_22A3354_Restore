@implementation CLKIsBridge

void __CLKIsBridge_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CLKIsBridge___result = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Bridge"));

}

@end
