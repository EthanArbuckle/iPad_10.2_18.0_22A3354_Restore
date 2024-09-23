@implementation LoadManagedConfiguration

void __LoadManagedConfiguration_block_invoke()
{
  LoadManagedConfiguration_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  if (!LoadManagedConfiguration_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration"));
}

@end
