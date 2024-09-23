@implementation TimeFormatterWithDate

uint64_t ___TimeFormatterWithDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C94550]);
  v1 = (void *)_TimeFormatterWithDate___formatter;
  _TimeFormatterWithDate___formatter = (uint64_t)v0;

  objc_msgSend((id)_TimeFormatterWithDate___formatter, "setSuppressesDesignatorWhitespace:", 1);
  return objc_msgSend((id)_TimeFormatterWithDate___formatter, "setPaused:forReason:", 1, CFSTR("AlwaysPaused"));
}

@end
