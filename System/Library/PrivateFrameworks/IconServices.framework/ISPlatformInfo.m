@implementation ISPlatformInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_28);
  return (id)sharedInstance_sharedInstance_5;
}

void __32__ISPlatformInfo_sharedInstance__block_invoke()
{
  ISPlatformInfo *v0;
  void *v1;

  v0 = objc_alloc_init(ISPlatformInfo);
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v0;

}

- (BOOL)supportsRequestingLayerStacksForPlatform:(unint64_t)a3
{
  BOOL v5;
  BOOL result;

  v5 = -[IFPlatformInfo nativePlatform](self, "nativePlatform") == 32
    || -[IFPlatformInfo nativePlatform](self, "nativePlatform") == 16;
  result = 1;
  if (a3 != 32 && a3 != 16 && (a3 || !v5))
    return 0;
  return result;
}

- (BOOL)supportsRequestingMultisizedImagesForPlatform:(unint64_t)a3
{
  BOOL v5;

  v5 = -[IFPlatformInfo nativePlatform](self, "nativePlatform") == 1
    || -[IFPlatformInfo nativePlatform](self, "nativePlatform") == 2
    || -[IFPlatformInfo nativePlatform](self, "nativePlatform") == 4
    || -[IFPlatformInfo nativePlatform](self, "nativePlatform") == 8
    || -[IFPlatformInfo nativePlatform](self, "nativePlatform") == 16;
  return a3 <= 0x10 && (((1 << a3) & 0x10116) != 0 || !a3 && v5);
}

@end
