@implementation MCUserMetadataFilePath

void __MCUserMetadataFilePath_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (MCUserPublicInfoDirectory_once != -1)
    dispatch_once(&MCUserPublicInfoDirectory_once, &__block_literal_global_113_0);
  v0 = (id)MCUserPublicInfoDirectory_str;
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("MCMeta.plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)MCUserMetadataFilePath_str;
  MCUserMetadataFilePath_str = v1;

}

@end
