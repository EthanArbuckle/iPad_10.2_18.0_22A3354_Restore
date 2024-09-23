@implementation HMDMediaGroupSetupLatencyLogEvent

- (HMDMediaGroupSetupLatencyLogEvent)initWithRequestType:(id)a3 systemUUID:(id)a4 deviceRole:(id)a5 totalDurationMS:(unint64_t)a6 setupSessionIdentifier:(id)a7 totalDurationSinceAccessorySetupStartMS:(unint64_t)a8 errorStage:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDMediaGroupSetupLatencyLogEvent *v18;
  HMDMediaGroupSetupLatencyLogEvent *v19;
  id v23;
  objc_super v24;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HMDMediaGroupSetupLatencyLogEvent;
  v18 = -[HMMLogEvent init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_requestType, a3);
    objc_storeStrong((id *)&v19->_systemUUID, a4);
    objc_storeStrong((id *)&v19->_deviceRole, a5);
    v19->_totalDurationMS = a6;
    objc_storeStrong((id *)&v19->_setupSessionIdentifier, a7);
    v19->_totalDurationSinceAccessorySetupStartMS = a8;
    objc_storeStrong((id *)&v19->_errorStage, a9);
  }

  return v19;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.multidevice.homepod.feature.setup");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMDMediaGroupSetupLatencyLogEvent requestType](self, "requestType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("requestType"));

  -[HMDMediaGroupSetupLatencyLogEvent systemUUID](self, "systemUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("systemUUID"));

  -[HMDMediaGroupSetupLatencyLogEvent deviceRole](self, "deviceRole");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceRole"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDMediaGroupSetupLatencyLogEvent totalDurationMS](self, "totalDurationMS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("totalDurationMS"));

  -[HMDMediaGroupSetupLatencyLogEvent errorStage](self, "errorStage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("errorStage"));

  -[HMDMediaGroupSetupLatencyLogEvent setupSessionIdentifier](self, "setupSessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDMediaGroupSetupLatencyLogEvent setupSessionIdentifier](self, "setupSessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("setupSessionIdentifier"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDMediaGroupSetupLatencyLogEvent totalDurationSinceAccessorySetupStartMS](self, "totalDurationSinceAccessorySetupStartMS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("totalDurationSinceAccessorySetupStartMS"));

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (NSString)systemUUID
{
  return self->_systemUUID;
}

- (NSString)deviceRole
{
  return self->_deviceRole;
}

- (unint64_t)totalDurationMS
{
  return self->_totalDurationMS;
}

- (NSString)errorStage
{
  return self->_errorStage;
}

- (NSString)setupSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)totalDurationSinceAccessorySetupStartMS
{
  return self->_totalDurationSinceAccessorySetupStartMS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_errorStage, 0);
  objc_storeStrong((id *)&self->_deviceRole, 0);
  objc_storeStrong((id *)&self->_systemUUID, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
}

@end
