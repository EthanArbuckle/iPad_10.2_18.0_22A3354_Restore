@implementation FBSRealizeSettingsExtension

void __FBSRealizeSettingsExtension_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_baseClass");
  _realizeSettingsExtension();
}

@end
