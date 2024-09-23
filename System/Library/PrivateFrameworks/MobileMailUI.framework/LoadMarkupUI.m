@implementation LoadMarkupUI

void __LoadMarkupUI_block_invoke()
{
  LoadMarkupUI_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MarkupUI.framework/MarkupUI", 2);
  if (!LoadMarkupUI_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/MarkupUI.framework/MarkupUI"));
}

@end
