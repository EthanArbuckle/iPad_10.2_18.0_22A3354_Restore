@implementation NSDateFormatter

uint64_t __51__NSDateFormatter_MTUtilities__mtTimeOnlyFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)mtTimeOnlyFormatter__timeOnlyFormatter;
  mtTimeOnlyFormatter__timeOnlyFormatter = (uint64_t)v0;

  return objc_msgSend((id)mtTimeOnlyFormatter__timeOnlyFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("Jmm"));
}

@end
