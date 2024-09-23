@implementation LoadPassKitUI

void __LoadPassKitUI_block_invoke()
{
  LoadPassKitUI_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/PassKitUI.framework/PassKitUI", 2);
  if (!LoadPassKitUI_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/PassKitUI.framework/PassKitUI"));
}

@end
