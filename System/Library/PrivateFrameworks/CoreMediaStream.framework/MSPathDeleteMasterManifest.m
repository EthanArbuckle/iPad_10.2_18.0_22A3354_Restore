@implementation MSPathDeleteMasterManifest

void __MSPathDeleteMasterManifest_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MSPathDeleteDir();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("manifest.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MSPathDeleteMasterManifest_path;
  MSPathDeleteMasterManifest_path = v0;

}

@end
