@implementation AXProcessIsInCallService

void __AXProcessIsInCallService_block_invoke()
{
  id v0;

  AXApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  AXProcessIsInCallService_AXIsInCallService = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.InCallService"));

}

@end
