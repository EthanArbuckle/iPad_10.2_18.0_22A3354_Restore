@implementation NSLocale

void __43__NSLocale_CKUtilities____ck_currentLocale__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__ck_currentLocale_sLocale;
  __ck_currentLocale_sLocale = v0;

}

@end
