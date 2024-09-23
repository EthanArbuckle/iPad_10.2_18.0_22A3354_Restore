@implementation MSPathPublishMasterManifest

void __MSPathPublishMasterManifest_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MSPathPublishDir();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MSPathPublishMasterManifest_path;
  MSPathPublishMasterManifest_path = v0;

}

@end
