@implementation CHUISHasGlobalCaptureEntitlement

void __CHUISHasGlobalCaptureEntitlement_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CHUISHasGlobalCaptureEntitlement_hasGlobalCaptureEntitlement = objc_msgSend(v0, "hasEntitlement:", CFSTR("com.apple.QuartzCore.global-capture"));

}

@end
