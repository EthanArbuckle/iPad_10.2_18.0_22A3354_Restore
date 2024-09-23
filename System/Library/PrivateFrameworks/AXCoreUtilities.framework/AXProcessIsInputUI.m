@implementation AXProcessIsInputUI

void __AXProcessIsInputUI_block_invoke()
{
  id v0;

  AXProcessGetName();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  AXProcessIsInputUI_AXProcessIsInputUI = objc_msgSend(v0, "isEqualToString:", CFSTR("InputUI"));

}

@end
