@implementation HMDCloudShareTrustManagerTrustActivityLogEvent

- (HMDCloudShareTrustManagerTrustActivityLogEvent)initWithTrustActivityType:(int64_t)a3 privilege:(unint64_t)a4 isPrimaryResident:(BOOL)a5
{
  _BOOL8 v5;
  HMDCloudShareTrustManagerTrustActivityLogEvent *v8;
  uint64_t v9;
  NSNumber *trustActivityType;
  uint64_t v11;
  NSNumber *privilege;
  uint64_t v13;
  NSNumber *isPrimaryResident;
  objc_super v16;

  v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDCloudShareTrustManagerTrustActivityLogEvent;
  v8 = -[HMMLogEvent init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    trustActivityType = v8->_trustActivityType;
    v8->_trustActivityType = (NSNumber *)v9;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v11 = objc_claimAutoreleasedReturnValue();
    privilege = v8->_privilege;
    v8->_privilege = (NSNumber *)v11;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    isPrimaryResident = v8->_isPrimaryResident;
    v8->_isPrimaryResident = (NSNumber *)v13;

  }
  return v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.trustManager.activity");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("trustActivityType");
  -[HMDCloudShareTrustManagerTrustActivityLogEvent trustActivityType](self, "trustActivityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("userPrivilege");
  -[HMDCloudShareTrustManagerTrustActivityLogEvent privilege](self, "privilege");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("isPrimaryResident");
  -[HMDCloudShareTrustManagerTrustActivityLogEvent isPrimaryResident](self, "isPrimaryResident");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSNumber)trustActivityType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)privilege
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)isPrimaryResident
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isPrimaryResident, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_trustActivityType, 0);
}

@end
