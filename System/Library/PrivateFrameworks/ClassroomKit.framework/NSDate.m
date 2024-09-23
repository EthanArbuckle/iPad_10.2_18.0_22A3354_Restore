@implementation NSDate

uint64_t __47__NSDate_CRKAdditions__crk_sharedDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)crk_sharedDateFormatter_formatter;
  crk_sharedDateFormatter_formatter = v0;

  return objc_msgSend((id)crk_sharedDateFormatter_formatter, "setFormatOptions:", 1907);
}

@end
