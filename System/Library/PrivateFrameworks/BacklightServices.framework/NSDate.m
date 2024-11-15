@implementation NSDate

uint64_t __46__NSDate_BacklightServices__bls_loggingString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)bls_loggingString_dateFormatter;
  bls_loggingString_dateFormatter = (uint64_t)v0;

  v2 = (void *)bls_loggingString_dateFormatter;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)bls_loggingString_dateFormatter, "setDateFormat:", CFSTR("HH:mm:ss.SSS MM/dd"));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v5 = (void *)bls_loggingString_dateComponentsFormatter;
  bls_loggingString_dateComponentsFormatter = (uint64_t)v4;

  objc_msgSend((id)bls_loggingString_dateComponentsFormatter, "setUnitsStyle:", 2);
  return objc_msgSend((id)bls_loggingString_dateComponentsFormatter, "setAllowedUnits:", 33008);
}

uint64_t __51__NSDate_BacklightServices__bls_shortLoggingString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)bls_shortLoggingString_dateFormatter;
  bls_shortLoggingString_dateFormatter = (uint64_t)v0;

  v2 = (void *)bls_shortLoggingString_dateFormatter;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)bls_shortLoggingString_dateFormatter, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
}

uint64_t __47__NSDate_BacklightServices__bls_fileNameString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)bls_fileNameString_dateFormatter;
  bls_fileNameString_dateFormatter = (uint64_t)v0;

  v2 = (void *)bls_fileNameString_dateFormatter;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)bls_fileNameString_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
}

@end
