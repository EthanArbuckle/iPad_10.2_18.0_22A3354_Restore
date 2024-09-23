@implementation FILocalizedDayName

uint64_t __FILocalizedDayName_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)FILocalizedDayName___formatter;
  FILocalizedDayName___formatter = (uint64_t)v0;

  objc_msgSend((id)FILocalizedDayName___formatter, "setFormattingContext:", 1);
  return objc_msgSend((id)FILocalizedDayName___formatter, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE"));
}

@end
