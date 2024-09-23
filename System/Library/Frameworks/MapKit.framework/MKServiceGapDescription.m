@implementation MKServiceGapDescription

uint64_t __MKServiceGapDescription_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_145;
  _MergedGlobals_145 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_145;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)_MergedGlobals_145, "setLocalizedDateFormatFromTemplate:", CFSTR("jma"));
}

@end
