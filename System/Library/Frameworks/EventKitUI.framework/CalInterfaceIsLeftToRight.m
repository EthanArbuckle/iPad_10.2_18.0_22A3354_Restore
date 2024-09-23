@implementation CalInterfaceIsLeftToRight

void __CalInterfaceIsLeftToRight_block_invoke()
{
  id v0;

  +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _leftToRight = objc_msgSend(v0, "layoutDirectionOrOverride") == 0;

}

@end
