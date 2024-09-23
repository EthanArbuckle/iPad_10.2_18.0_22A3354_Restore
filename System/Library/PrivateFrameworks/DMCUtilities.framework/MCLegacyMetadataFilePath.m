@implementation MCLegacyMetadataFilePath

void __MCLegacyMetadataFilePath_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (MCLegacyPublicInfoDirectory_once != -1)
    dispatch_once(&MCLegacyPublicInfoDirectory_once, &__block_literal_global_114);
  v0 = (id)MCLegacyPublicInfoDirectory_str;
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("MCMeta.plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)MCLegacyMetadataFilePath_str;
  MCLegacyMetadataFilePath_str = v1;

}

@end
