@implementation MFIMAPDateStringForDate

uint64_t ___MFIMAPDateStringForDate_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MFIMAPDateStringForDate_formatter;
  _MFIMAPDateStringForDate_formatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "ef_posixLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MFIMAPDateStringForDate_formatter, "setLocale:", v2);

  return objc_msgSend((id)_MFIMAPDateStringForDate_formatter, "setDateFormat:", CFSTR("\"dd-MMM-yyyy HH:mm:ss ZZ\"));
}

@end
