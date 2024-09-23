@implementation MPStorePlatformDateFromString

void ___MPStorePlatformDateFromString_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MPStorePlatformDateFromString_storePlatformReleaseDateFormatter;
  _MPStorePlatformDateFromString_storePlatformReleaseDateFormatter = (uint64_t)v0;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend((id)_MPStorePlatformDateFromString_storePlatformReleaseDateFormatter, "setLocale:", v2);
  objc_msgSend((id)_MPStorePlatformDateFromString_storePlatformReleaseDateFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd"));

}

@end
