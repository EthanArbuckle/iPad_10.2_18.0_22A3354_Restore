@implementation GEOAPWiFiConnectionQualityReporter

+ (void)reportWiFiConnectionQuality:(id)a3
{
  +[GEOAPPortal captureWifiProbeWithWifiConnectionQuality:](GEOAPPortal, "captureWifiProbeWithWifiConnectionQuality:", a3);
}

@end
