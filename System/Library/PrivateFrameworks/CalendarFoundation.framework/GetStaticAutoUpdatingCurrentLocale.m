@implementation GetStaticAutoUpdatingCurrentLocale

void __GetStaticAutoUpdatingCurrentLocale_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GetStaticAutoUpdatingCurrentLocale_sLocale;
  GetStaticAutoUpdatingCurrentLocale_sLocale = v0;

}

@end
