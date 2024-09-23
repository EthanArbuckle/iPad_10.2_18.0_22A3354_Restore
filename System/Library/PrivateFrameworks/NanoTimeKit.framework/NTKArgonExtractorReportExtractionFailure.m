@implementation NTKArgonExtractorReportExtractionFailure

void __NTKArgonExtractorReportExtractionFailure_block_invoke()
{
  void *v0;
  NTKDebugRadarArgonErrorReporterQueue *v1;
  void *v2;
  id v3;

  NSTemporaryDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ArgonRadarData"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[NTKDebugRadarArgonErrorReporterQueue initWithQueueDirectoryPath:]([NTKDebugRadarArgonErrorReporterQueue alloc], "initWithQueueDirectoryPath:", v0);
  v2 = (void *)NTKArgonExtractorReportExtractionFailure_reporterQueue;
  NTKArgonExtractorReportExtractionFailure_reporterQueue = (uint64_t)v1;

}

@end
