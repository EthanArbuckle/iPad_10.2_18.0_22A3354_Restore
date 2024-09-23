@implementation NSDate

uint64_t __58__NSDate_GKExtensions___gkFormattedDateForStyle_relative___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_gkFormattedDateForStyle_relative__sDateFormatter;
  _gkFormattedDateForStyle_relative__sDateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_gkFormattedDateForStyle_relative__sDateFormatter, "setTimeStyle:", 0);
}

@end
