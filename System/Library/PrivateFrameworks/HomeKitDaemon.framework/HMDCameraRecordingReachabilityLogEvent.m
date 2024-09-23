@implementation HMDCameraRecordingReachabilityLogEvent

- (HMDCameraRecordingReachabilityLogEvent)initWithReachability:(BOOL)a3 didCreateEventModel:(BOOL)a4 reachabilityChangeDebounceCount:(unint64_t)a5 offlineDuration:(double)a6 hapAccessory:(id)a7
{
  id v12;
  HMDCameraRecordingReachabilityLogEvent *v13;
  HMDCameraRecordingReachabilityLogEvent *v14;
  uint64_t v15;
  NSString *accessoryIdentifier;
  objc_super v18;

  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraRecordingReachabilityLogEvent;
  v13 = -[HMMLogEvent init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_reachable = a3;
    v13->_didCreateEventModel = a4;
    v13->_reachabilityChangeDebounceCount = a5;
    v13->_offlineDuration = a6;
    objc_msgSend(v12, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    accessoryIdentifier = v14->_accessoryIdentifier;
    v14->_accessoryIdentifier = (NSString *)v15;

  }
  return v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.camera-recording-reachability");
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDCameraRecordingReachabilityLogEvent reachable](self, "reachable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("reachable"));

  if (-[HMDCameraRecordingReachabilityLogEvent reachable](self, "reachable"))
    v5 = &unk_24E96A6B8;
  else
    v5 = &unk_24E96A6D0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isReachable_INT"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDCameraRecordingReachabilityLogEvent didCreateEventModel](self, "didCreateEventModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("didCreateEventModel"));

  if (-[HMDCameraRecordingReachabilityLogEvent didCreateEventModel](self, "didCreateEventModel"))
    v7 = &unk_24E96A6B8;
  else
    v7 = &unk_24E96A6D0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("didCreateEventModel_INT"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraRecordingReachabilityLogEvent reachabilityChangeDebounceCount](self, "reachabilityChangeDebounceCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reachabilityChangeDebounceCount_INT"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMDCameraRecordingReachabilityLogEvent offlineDuration](self, "offlineDuration");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("offlineDurationSeconds"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v11;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2147483652;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (BOOL)didCreateEventModel
{
  return self->_didCreateEventModel;
}

- (unint64_t)reachabilityChangeDebounceCount
{
  return self->_reachabilityChangeDebounceCount;
}

- (double)offlineDuration
{
  return self->_offlineDuration;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
