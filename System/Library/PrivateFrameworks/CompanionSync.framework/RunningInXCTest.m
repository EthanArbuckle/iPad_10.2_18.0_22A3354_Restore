@implementation RunningInXCTest

void ___RunningInXCTest_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _RunningInXCTest___value = objc_msgSend(v0, "isEqualToString:", CFSTR("xctest"));

}

@end
