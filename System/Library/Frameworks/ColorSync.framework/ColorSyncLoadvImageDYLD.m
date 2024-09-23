@implementation ColorSyncLoadvImageDYLD

void __ColorSyncLoadvImageDYLD_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  ColorSyncLoadvImageDYLD_handle = (uint64_t)dlopen("/System/Library/Frameworks/Accelerate.framework/Frameworks/vImage.framework/vImage", 5);
  if (!ColorSyncLoadvImageDYLD_handle)
    ColorSyncLog(2, (uint64_t)"Failed to load %s", v0, v1, v2, v3, v4, v5, (char)"/System/Library/Frameworks/Accelerate.framework/Frameworks/vImage.framework/vImage");
}

@end
