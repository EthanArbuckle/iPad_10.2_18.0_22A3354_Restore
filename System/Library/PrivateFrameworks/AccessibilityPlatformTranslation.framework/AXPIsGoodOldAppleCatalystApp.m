@implementation AXPIsGoodOldAppleCatalystApp

void __AXPIsGoodOldAppleCatalystApp_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.findmy"), CFSTR("com.apple.Home"), CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.news"), CFSTR("com.apple.PlaygroundsMac"), CFSTR("com.apple.VoiceMemos"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "containsObject:", v1) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.WebKit.WebContent"));
  AXPIsGoodOldAppleCatalystApp_isGoodOldApp = v2;

}

@end
