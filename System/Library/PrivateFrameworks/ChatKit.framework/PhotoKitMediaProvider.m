@implementation PhotoKitMediaProvider

void ___PhotoKitMediaProvider_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B768], "mediaProviderWithLibrary:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PhotoKitMediaProvider__photoKitMediaProvider;
  _PhotoKitMediaProvider__photoKitMediaProvider = v0;

}

@end
