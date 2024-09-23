@implementation CDPAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  void *v2;
  void *v3;

  if (rtcAnalyticsReporter_onceToken != -1)
    dispatch_once(&rtcAnalyticsReporter_onceToken, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x24BDFC2C0], "analyticsTransportRTCWithClientType:clientBundleId:clientName:", 0x24C7D2408, rtcAnalyticsReporter_mainBundleIdentifier, CFSTR("com.apple.aaa.dnu"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFC2A8], "analyticsReporterWithTransport:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __47__CDPAnalyticsReporterRTC_rtcAnalyticsReporter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rtcAnalyticsReporter_mainBundleIdentifier;
  rtcAnalyticsReporter_mainBundleIdentifier = v0;

}

@end
