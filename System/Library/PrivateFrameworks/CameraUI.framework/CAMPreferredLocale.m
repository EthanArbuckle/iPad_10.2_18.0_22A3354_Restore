@implementation CAMPreferredLocale

void __CAMPreferredLocale_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  CAMCameraUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredLocalizations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CAMPreferredLocale___CAMPreferredLocale;
  CAMPreferredLocale___CAMPreferredLocale = v2;

}

@end
