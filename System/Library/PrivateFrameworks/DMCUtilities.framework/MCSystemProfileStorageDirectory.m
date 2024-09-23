@implementation MCSystemProfileStorageDirectory

void __MCSystemProfileStorageDirectory_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (MCSystemProfileLibraryDirectory_once != -1)
    dispatch_once(&MCSystemProfileLibraryDirectory_once, &__block_literal_global_126);
  v0 = (id)MCSystemProfileLibraryDirectory_str;
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("ConfigurationProfiles"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)MCSystemProfileStorageDirectory_str;
  MCSystemProfileStorageDirectory_str = v1;

}

@end
