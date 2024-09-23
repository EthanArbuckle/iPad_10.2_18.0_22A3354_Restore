@implementation NSNumber

uint64_t __45__NSNumber_CKUtilities____ck_localizedString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)__ck_localizedString_sNumberFormatter;
  __ck_localizedString_sNumberFormatter = (uint64_t)v0;

  v2 = (void *)__ck_localizedString_sNumberFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "__ck_currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)__ck_localizedString_sNumberFormatter, "setNumberStyle:", 0);
}

@end
