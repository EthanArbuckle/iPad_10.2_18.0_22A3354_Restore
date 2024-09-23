@implementation MSVLogDateFormatter

uint64_t __MSVLogDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)MSVLogDateFormatter___formatter;
  MSVLogDateFormatter___formatter = (uint64_t)v0;

  return objc_msgSend((id)MSVLogDateFormatter___formatter, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss.SSSXX"));
}

@end
