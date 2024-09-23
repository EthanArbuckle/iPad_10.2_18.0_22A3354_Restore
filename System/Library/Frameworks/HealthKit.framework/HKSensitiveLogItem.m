@implementation HKSensitiveLogItem

void __HKSensitiveLogItem_block_invoke()
{
  id v0;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem_showSensitiveLogItems = objc_msgSend(v0, "showSensitiveLogItems");

}

@end
