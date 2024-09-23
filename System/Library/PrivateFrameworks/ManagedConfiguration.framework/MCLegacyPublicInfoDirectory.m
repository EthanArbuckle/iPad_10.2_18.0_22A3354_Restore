@implementation MCLegacyPublicInfoDirectory

void __MCLegacyPublicInfoDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(CFSTR("/var/mobile/"), "stringByAppendingPathComponent:", CFSTR("Library/ConfigurationProfiles/PublicInfo"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)MCLegacyPublicInfoDirectory_str;
  MCLegacyPublicInfoDirectory_str = v0;

}

@end
