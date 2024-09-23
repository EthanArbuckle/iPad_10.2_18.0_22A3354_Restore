@implementation TitleForExpirationDate

uint64_t ___TitleForExpirationDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_TitleForExpirationDate_dateFormatter;
  _TitleForExpirationDate_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)_TitleForExpirationDate_dateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)_TitleForExpirationDate_dateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMd"));
  return objc_msgSend((id)_TitleForExpirationDate_dateFormatter, "setFormattingContext:", 5);
}

@end
