@implementation CGLibraryLoadColorSyncDYLD

void __CGLibraryLoadColorSyncDYLD_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  CGLibraryLoadColorSyncDYLD_handle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ColorSync.framework/ColorSync", 5);
  if (!CGLibraryLoadColorSyncDYLD_handle)
    CGPostError((uint64_t)"Failed to load %s", v0, v1, v2, v3, v4, v5, v6, (char)"/System/Library/PrivateFrameworks/ColorSync.framework/ColorSync");
}

@end
