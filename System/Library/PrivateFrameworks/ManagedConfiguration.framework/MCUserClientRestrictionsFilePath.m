@implementation MCUserClientRestrictionsFilePath

void __MCUserClientRestrictionsFilePath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MCUserProfileStorageDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ClientTruth.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)MCUserClientRestrictionsFilePath_str;
  MCUserClientRestrictionsFilePath_str = v1;

}

@end
