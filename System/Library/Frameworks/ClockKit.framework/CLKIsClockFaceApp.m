@implementation CLKIsClockFaceApp

void __CLKIsClockFaceApp_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CLKIsClockFaceApp___isClockFaceApp = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.clockface"));

}

@end
