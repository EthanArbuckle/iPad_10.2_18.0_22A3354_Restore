@implementation LoadQuickLook

void __LoadQuickLook_block_invoke()
{
  LoadQuickLook_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  if (!LoadQuickLook_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/QuickLook.framework/QuickLook"));
}

void __LoadQuickLook_block_invoke_0()
{
  LoadQuickLook_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/QuickLook.framework/QuickLook", 2);
  if (!LoadQuickLook_frameworkLibrary_0)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/QuickLook.framework/QuickLook"));
}

@end
