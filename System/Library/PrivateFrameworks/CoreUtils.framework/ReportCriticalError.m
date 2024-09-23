@implementation ReportCriticalError

void *__ReportCriticalError_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 5);
  ReportCriticalError_sCrashReporterLib = (uint64_t)result;
  if (result)
  {
    ReportCriticalError_sSimulateCrash_f = dlsym(result, "SimulateCrash");
    result = dlsym((void *)ReportCriticalError_sCrashReporterLib, "WriteStackshotReportWithPID");
    ReportCriticalError_sWriteStackShot_f = result;
  }
  return result;
}

@end
