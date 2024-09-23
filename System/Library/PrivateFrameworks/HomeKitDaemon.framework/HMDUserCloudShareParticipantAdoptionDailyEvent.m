@implementation HMDUserCloudShareParticipantAdoptionDailyEvent

- (HMDUserCloudShareParticipantAdoptionDailyEvent)initWithConfigureState:(int64_t)a3 hasOwnerCloudShareID:(BOOL)a4
{
  _BOOL8 v4;
  HMDUserCloudShareParticipantAdoptionDailyEvent *v6;
  uint64_t v7;
  NSNumber *configureState;
  uint64_t v9;
  NSNumber *hasOwnerCloudShareID;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserCloudShareParticipantAdoptionDailyEvent;
  v6 = -[HMMLogEvent init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    configureState = v6->_configureState;
    v6->_configureState = (NSNumber *)v7;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    hasOwnerCloudShareID = v6->_hasOwnerCloudShareID;
    v6->_hasOwnerCloudShareID = (NSNumber *)v9;

  }
  return v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.trustManager.adoption.participant");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("configureState");
  -[HMDUserCloudShareParticipantAdoptionDailyEvent configureState](self, "configureState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("hasOwnerCloudShareID");
  v8[0] = v3;
  -[HMDUserCloudShareParticipantAdoptionDailyEvent hasOwnerCloudShareID](self, "hasOwnerCloudShareID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSNumber)configureState
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)hasOwnerCloudShareID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasOwnerCloudShareID, 0);
  objc_storeStrong((id *)&self->_configureState, 0);
}

@end
