@implementation LoadPhotos

void __LoadPhotos_block_invoke()
{
  LoadPhotos_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Photos.framework/Photos", 2);
  if (!LoadPhotos_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/Photos.framework/Photos"));
}

@end
