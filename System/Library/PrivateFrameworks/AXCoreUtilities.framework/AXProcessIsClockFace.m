@implementation AXProcessIsClockFace

void __AXProcessIsClockFace_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.clockface"));

  if (v1)
    AXProcessIsClockFace__AXProcessIsClockFace = 1;
}

@end
