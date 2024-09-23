@implementation MCUSEnglishLocale

void __MCUSEnglishLocale_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  v1 = (void *)MCUSEnglishLocale_locale;
  MCUSEnglishLocale_locale = v0;

}

@end
