@implementation NSBundle

void __44__NSBundle_RPExtensions___rpFrameworkBundle__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/Frameworks/ReplayKit.framework"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_rpFrameworkBundle_sFrameworkBundle;
  _rpFrameworkBundle_sFrameworkBundle = v1;

}

@end
