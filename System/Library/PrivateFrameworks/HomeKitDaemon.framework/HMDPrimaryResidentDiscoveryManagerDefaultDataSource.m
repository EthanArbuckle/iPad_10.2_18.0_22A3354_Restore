@implementation HMDPrimaryResidentDiscoveryManagerDefaultDataSource

- (HMDPrimaryResidentDiscoveryManagerDefaultDataSource)init
{
  HMDPrimaryResidentDiscoveryManagerDefaultDataSource *v2;
  uint64_t v3;
  NSNotificationCenter *notificationCenter;
  uint64_t v5;
  HMMLogEventSubmitting *logEventSubmitter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDPrimaryResidentDiscoveryManagerDefaultDataSource;
  v2 = -[HMDPrimaryResidentDiscoveryManagerDefaultDataSource init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v3;

    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v5 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v2->_logEventSubmitter;
    v2->_logEventSubmitter = (HMMLogEventSubmitting *)v5;

  }
  return v2;
}

- (id)createPrimaryResidentDiscoveryOperationWithContext:(id)a3
{
  id v3;
  HMDPrimaryResidentDiscoveryOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDPrimaryResidentDiscoveryOperation *v8;

  v3 = a3;
  v4 = [HMDPrimaryResidentDiscoveryOperation alloc];
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFeaturesDataSource defaultDataSource](HMDFeaturesDataSource, "defaultDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDPrimaryResidentDiscoveryOperation initWithHome:messageDispatcher:featuresDataSource:context:](v4, "initWithHome:messageDispatcher:featuresDataSource:context:", v5, v6, v7, v3);

  return v8;
}

- (id)createBackoffTimer
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F170]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 4, 0, 4.0, 3600.0);
}

- (id)remoteDeviceMonitorFromContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureRemoteTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transportStartFutureFromContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureRemoteTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 8, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
