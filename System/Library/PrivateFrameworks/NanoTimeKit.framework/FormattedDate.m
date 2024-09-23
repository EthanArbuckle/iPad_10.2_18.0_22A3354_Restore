@implementation FormattedDate

uint64_t ___FormattedDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_FormattedDate___formatter;
  _FormattedDate___formatter = (uint64_t)v0;

  return objc_msgSend((id)_FormattedDate___formatter, "setDateFormat:", CFSTR("MMM dd-hh:mm"));
}

@end
