@implementation FILocalizedMonthName

uint64_t __FILocalizedMonthName_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)FILocalizedMonthName___formatter;
  FILocalizedMonthName___formatter = (uint64_t)v0;

  return objc_msgSend((id)FILocalizedMonthName___formatter, "setDateFormat:", CFSTR("LLLL"));
}

@end
