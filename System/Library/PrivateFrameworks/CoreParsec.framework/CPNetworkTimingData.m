@implementation CPNetworkTimingData

void __64___CPNetworkTimingData_Dictionary__startMetricsForNormalization__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("_kCFNTimingDataConnectStart");
  v2[1] = CFSTR("_kCFNTimingDataFetchStart");
  v2[2] = CFSTR("_kCFNTimingDataRedirectStart");
  v2[3] = CFSTR("_kCFNTimingDataRequestStart");
  v2[4] = CFSTR("_kCFNTimingDataDomainLookupStart");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)startMetricsForNormalization_startMetricNames;
  startMetricsForNormalization_startMetricNames = v0;

}

@end
