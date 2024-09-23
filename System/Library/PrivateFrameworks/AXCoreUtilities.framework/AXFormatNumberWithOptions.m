@implementation AXFormatNumberWithOptions

void __AXFormatNumberWithOptions_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)AXFormatNumberWithOptions__AXNumberFormatterWithOptions;
  AXFormatNumberWithOptions__AXNumberFormatterWithOptions = (uint64_t)v0;

  v2 = (void *)AXFormatNumberWithOptions__AXNumberFormatterWithOptions;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

@end
