@implementation _DKWifiNetworkQualityMonitor

- (_DKWifiNetworkQualityMonitor)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _DKWifiNetworkQualityMonitor *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BE1B1B8], "keyPathForWiFiConnectionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForWiFiConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B178], "keyPathForWiFiQualityPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/system/wifi/active"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)_DKWifiNetworkQualityMonitor;
  v7 = -[_DKNetworkQualityMonitor initForInterfaceType:connectionStatusKeyPath:qualityKeyPath:predictedQualityKeyPath:discretionaryInvitedPath:](&v9, sel_initForInterfaceType_connectionStatusKeyPath_qualityKeyPath_predictedQualityKeyPath_discretionaryInvitedPath_, 1, v3, v4, v5, v6);

  return v7;
}

+ (id)eventStream
{
  return CFSTR("WiFiQuality");
}

@end
