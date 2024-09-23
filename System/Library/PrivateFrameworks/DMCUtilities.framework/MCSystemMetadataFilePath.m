@implementation MCSystemMetadataFilePath

void __MCSystemMetadataFilePath_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (MCSystemPublicInfoDirectory_once != -1)
    dispatch_once(&MCSystemPublicInfoDirectory_once, &__block_literal_global_110_0);
  v0 = (id)MCSystemPublicInfoDirectory_str;
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("MCMeta.plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)MCSystemMetadataFilePath_str;
  MCSystemMetadataFilePath_str = v1;

}

@end
