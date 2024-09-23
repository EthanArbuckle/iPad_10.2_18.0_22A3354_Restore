@implementation CGLibraryLoadImageIODYLD

void __CGLibraryLoadImageIODYLD_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  CGLibraryLoadImageIODYLD_handle = (uint64_t)dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 5);
  if (!CGLibraryLoadImageIODYLD_handle)
    CGPostError((uint64_t)"Failed to load %s", v0, v1, v2, v3, v4, v5, v6, (char)"/System/Library/Frameworks/ImageIO.framework/ImageIO");
}

@end
