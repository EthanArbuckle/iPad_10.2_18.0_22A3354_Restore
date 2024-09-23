@implementation MCSystemProfileStorageDirectory

void __MCSystemProfileStorageDirectory_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MCSystemProfileLibraryDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ConfigurationProfiles"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)MCSystemProfileStorageDirectory_str;
  MCSystemProfileStorageDirectory_str = v1;

}

@end
