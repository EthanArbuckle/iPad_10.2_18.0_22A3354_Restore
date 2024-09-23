@implementation HKDiagnosticStringFromDate

uint64_t __HKDiagnosticStringFromDate_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)HKDiagnosticStringFromDate_dateFormatter;
  HKDiagnosticStringFromDate_dateFormatter = (uint64_t)v0;

  v2 = (void *)HKDiagnosticStringFromDate_dateFormatter;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)HKDiagnosticStringFromDate_dateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)HKDiagnosticStringFromDate_dateFormatter, "setTimeStyle:", 3);
}

@end
