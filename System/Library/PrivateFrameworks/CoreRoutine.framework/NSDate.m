@implementation NSDate

uint64_t __37__NSDate_RTExtensions__dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_10, "setLocale:", v2);

  objc_msgSend((id)_MergedGlobals_10, "setDateStyle:", 1);
  return objc_msgSend((id)_MergedGlobals_10, "setTimeStyle:", 3);
}

@end
