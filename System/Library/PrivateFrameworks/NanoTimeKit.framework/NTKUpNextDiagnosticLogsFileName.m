@implementation NTKUpNextDiagnosticLogsFileName

uint64_t __NTKUpNextDiagnosticLogsFileName_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)NTKUpNextDiagnosticLogsFileName_FileNameFormatter;
  NTKUpNextDiagnosticLogsFileName_FileNameFormatter = (uint64_t)v0;

  return objc_msgSend((id)NTKUpNextDiagnosticLogsFileName_FileNameFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd_HH-mm-ss"));
}

@end
