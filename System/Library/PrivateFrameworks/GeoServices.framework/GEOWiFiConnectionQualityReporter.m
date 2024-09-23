@implementation GEOWiFiConnectionQualityReporter

+ (void)reportWiFiConnectionQuality:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(getGEOAPPortalClass(), "captureWifiProbeWithWifiConnectionQuality:", v3);

}

@end
