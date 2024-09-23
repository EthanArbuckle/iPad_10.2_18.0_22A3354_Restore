@implementation MCUserProfileStorageDirectory

void __MCUserProfileStorageDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(CFSTR("/var/mobile/"), "stringByAppendingPathComponent:", CFSTR("Library/UserConfigurationProfiles"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)MCUserProfileStorageDirectory_str;
  MCUserProfileStorageDirectory_str = v0;

}

@end
