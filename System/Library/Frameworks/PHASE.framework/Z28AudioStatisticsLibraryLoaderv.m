@implementation Z28AudioStatisticsLibraryLoaderv

void *___Z28AudioStatisticsLibraryLoaderv_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/lib/libAudioStatistics.dylib", 1);
  if (result)
  {
    v1 = result;
    qword_254E44638 = (uint64_t)dlsym(result, "CreateSharedCAReportingClient");
    off_254E44640 = dlsym(v1, "CAReportingClientCreateReporterID");
    qword_254E44648 = (uint64_t)dlsym(v1, "CAReportingClientCreateReporterIDFromSessionID");
    qword_254E44650 = (uint64_t)dlsym(v1, "CAReportingClientCreatePerformanceReporterID");
    off_254E44658 = (uint64_t (*)(_QWORD))dlsym(v1, "CAReportingClientStartReporter");
    off_254E44660 = (uint64_t (*)(_QWORD))dlsym(v1, "CAReportingClientStopReporter");
    off_254E44668 = dlsym(v1, "CAReportingClientSetAudioServiceType");
    qword_254E44670 = (uint64_t)dlsym(v1, "CAReportingClientGetAudioServiceType");
    qword_254E44678 = (uint64_t)dlsym(v1, "CAReportingClientSetConfiguration");
    qword_254E44680 = (uint64_t)dlsym(v1, "CAReportingClientCopyConfiguration");
    qword_254E44688 = (uint64_t)dlsym(v1, "CAReportingClientSendMessage");
    qword_254E44690 = (uint64_t)dlsym(v1, "CAReportingClientSendSingleMessage");
    off_254E44698 = (uint64_t (*)(_QWORD))dlsym(v1, "CAReportingClientDestroyReporterID");
    result = dlsym(v1, "CAReportingClientRequestMessage");
    qword_254E446A0 = (uint64_t)result;
  }
  return result;
}

@end
