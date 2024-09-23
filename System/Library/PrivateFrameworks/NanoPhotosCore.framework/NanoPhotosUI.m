@implementation NanoPhotosUI

void __nanophotos_log_NanoPhotosUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPhotos", "NanoPhotosUI");
  v1 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v0;

}

@end
