@implementation CDFormattedDate

uint64_t ___CDFormattedDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_CDFormattedDate_formatter;
  _CDFormattedDate_formatter = (uint64_t)v0;

  objc_msgSend((id)_CDFormattedDate_formatter, "setTimeStyle:", 3);
  return objc_msgSend((id)_CDFormattedDate_formatter, "setDateStyle:", 1);
}

@end
