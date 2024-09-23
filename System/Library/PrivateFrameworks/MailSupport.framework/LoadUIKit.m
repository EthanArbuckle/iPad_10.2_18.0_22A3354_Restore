@implementation LoadUIKit

void __LoadUIKit_block_invoke()
{
  LoadUIKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  if (!LoadUIKit_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/UIKit.framework/UIKit"));
}

void __LoadUIKit_block_invoke_0()
{
  LoadUIKit_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  if (!LoadUIKit_frameworkLibrary_0)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/UIKit.framework/UIKit"));
}

@end
