@implementation _DKWiredNetworkQualityMonitor

- (_DKWiredNetworkQualityMonitor)init
{
  void *v3;
  void *v4;
  _DKWiredNetworkQualityMonitor *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BE1B1B8], "keyPathForWiredConnectionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForWiredConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_DKWiredNetworkQualityMonitor;
  v5 = -[_DKNetworkQualityMonitor initForInterfaceType:connectionStatusKeyPath:qualityKeyPath:predictedQualityKeyPath:discretionaryInvitedPath:](&v7, sel_initForInterfaceType_connectionStatusKeyPath_qualityKeyPath_predictedQualityKeyPath_discretionaryInvitedPath_, 3, v3, v4, 0, 0);

  return v5;
}

+ (id)eventStream
{
  return CFSTR("WiredQuality");
}

@end
