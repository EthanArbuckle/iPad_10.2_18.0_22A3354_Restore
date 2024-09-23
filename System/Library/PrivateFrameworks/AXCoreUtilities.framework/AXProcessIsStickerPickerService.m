@implementation AXProcessIsStickerPickerService

void __AXProcessIsStickerPickerService_block_invoke()
{
  id v0;

  AXApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  AXProcessIsStickerPickerService_AXProcessIsStickerPickerService = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.StickerKit.StickerPickerService"));

}

@end
