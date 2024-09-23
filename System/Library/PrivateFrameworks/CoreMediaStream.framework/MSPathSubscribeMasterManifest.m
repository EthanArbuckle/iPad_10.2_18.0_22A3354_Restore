@implementation MSPathSubscribeMasterManifest

void __MSPathSubscribeMasterManifest_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MSPathSubscribeDir();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MSPathSubscribeMasterManifest_path;
  MSPathSubscribeMasterManifest_path = v0;

}

@end
