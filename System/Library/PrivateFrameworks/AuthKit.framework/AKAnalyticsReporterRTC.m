@implementation AKAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (rtcAnalyticsReporter_onceToken != -1)
    dispatch_once(&rtcAnalyticsReporter_onceToken, &__block_literal_global_19);
  return (id)rtcAnalyticsReporter_rtcReporter;
}

void __46__AKAnalyticsReporterRTC_rtcAnalyticsReporter__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF0E80], "analyticsTransportRTCWithClientType:clientBundleId:clientName:", 0x1E2E9A268, v4, CFSTR("com.apple.aaa.dnu"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF0E70], "analyticsReporterWithTransport:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)rtcAnalyticsReporter_rtcReporter;
  rtcAnalyticsReporter_rtcReporter = v2;

}

@end
