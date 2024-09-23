@implementation HMDCameraRecordingLoadBalancerLogEvent

- (HMDCameraRecordingLoadBalancerLogEvent)initWithNumberOfResidents:(id)a3 numberOfRetries:(id)a4 totalNumberOfJobSlots:(id)a5 remainingNumberOfJobSlots:(id)a6 selectedResidentDeviceType:(id)a7 selectedResidentNumberOfActiveStreams:(id)a8 selectedResidentSystemResourceUsageLevel:(id)a9 selectedResidentJobSlots:(id)a10 selectedResidentPartialJobSlots:(id)a11 selectedResidentHasActiveSessionWithCamera:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  HMDCameraRecordingLoadBalancerLogEvent *v27;
  uint64_t v28;
  NSNumber *numberOfResidents;
  uint64_t v30;
  NSNumber *numberOfRetries;
  uint64_t v32;
  NSNumber *totalNumberOfJobSlots;
  uint64_t v34;
  NSNumber *remainingNumberOfJobSlots;
  uint64_t v36;
  NSString *selectedResidentDeviceType;
  uint64_t v38;
  NSNumber *selectedResidentNumberOfActiveStreams;
  uint64_t v40;
  NSNumber *selectedResidentSystemResourceUsageLevel;
  uint64_t v42;
  NSNumber *selectedResidentJobSlots;
  uint64_t v44;
  NSNumber *selectedResidentPartialJobSlots;
  objc_super v47;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v47.receiver = self;
  v47.super_class = (Class)HMDCameraRecordingLoadBalancerLogEvent;
  v27 = -[HMMLogEvent init](&v47, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v18, "copy");
    numberOfResidents = v27->_numberOfResidents;
    v27->_numberOfResidents = (NSNumber *)v28;

    v30 = objc_msgSend(v19, "copy");
    numberOfRetries = v27->_numberOfRetries;
    v27->_numberOfRetries = (NSNumber *)v30;

    v32 = objc_msgSend(v20, "copy");
    totalNumberOfJobSlots = v27->_totalNumberOfJobSlots;
    v27->_totalNumberOfJobSlots = (NSNumber *)v32;

    v34 = objc_msgSend(v21, "copy");
    remainingNumberOfJobSlots = v27->_remainingNumberOfJobSlots;
    v27->_remainingNumberOfJobSlots = (NSNumber *)v34;

    v36 = objc_msgSend(v22, "copy");
    selectedResidentDeviceType = v27->_selectedResidentDeviceType;
    v27->_selectedResidentDeviceType = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    selectedResidentNumberOfActiveStreams = v27->_selectedResidentNumberOfActiveStreams;
    v27->_selectedResidentNumberOfActiveStreams = (NSNumber *)v38;

    v40 = objc_msgSend(v24, "copy");
    selectedResidentSystemResourceUsageLevel = v27->_selectedResidentSystemResourceUsageLevel;
    v27->_selectedResidentSystemResourceUsageLevel = (NSNumber *)v40;

    v42 = objc_msgSend(v25, "copy");
    selectedResidentJobSlots = v27->_selectedResidentJobSlots;
    v27->_selectedResidentJobSlots = (NSNumber *)v42;

    v44 = objc_msgSend(v26, "copy");
    selectedResidentPartialJobSlots = v27->_selectedResidentPartialJobSlots;
    v27->_selectedResidentPartialJobSlots = (NSNumber *)v44;

    v27->_selectedResidentHasActiveSessionWithCamera = a12;
  }

  return v27;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.camera-load-balancing");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingLoadBalancerLogEvent numberOfResidents](self, "numberOfResidents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfResidents"));

  -[HMDCameraRecordingLoadBalancerLogEvent numberOfRetries](self, "numberOfRetries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfRetries"));

  -[HMDCameraRecordingLoadBalancerLogEvent totalNumberOfJobSlots](self, "totalNumberOfJobSlots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("totalNumberOfJobSlots"));

  -[HMDCameraRecordingLoadBalancerLogEvent remainingNumberOfJobSlots](self, "remainingNumberOfJobSlots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("remainingNumberOfJobSlots"));

  -[HMDCameraRecordingLoadBalancerLogEvent selectedResidentDeviceType](self, "selectedResidentDeviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("selectedResidentDeviceType"));

  -[HMDCameraRecordingLoadBalancerLogEvent selectedResidentNumberOfActiveStreams](self, "selectedResidentNumberOfActiveStreams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("selectedResidentNumberOfActiveStreams"));

  -[HMDCameraRecordingLoadBalancerLogEvent selectedResidentSystemResourceUsageLevel](self, "selectedResidentSystemResourceUsageLevel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("selectedResidentSystemResourceUsageLevel"));

  -[HMDCameraRecordingLoadBalancerLogEvent selectedResidentJobSlots](self, "selectedResidentJobSlots");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("selectedResidentFullJobSlots"));

  -[HMDCameraRecordingLoadBalancerLogEvent selectedResidentPartialJobSlots](self, "selectedResidentPartialJobSlots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("selectedResidentPartialJobSlots"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCameraRecordingLoadBalancerLogEvent selectedResidentHasActiveSessionWithCamera](self, "selectedResidentHasActiveSessionWithCamera"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("selectedResidentHasActiveSessionWithCamera"));

  v14 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v14;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSNumber)numberOfResidents
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)numberOfRetries
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)totalNumberOfJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)remainingNumberOfJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)selectedResidentDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)selectedResidentSystemResourceUsageLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)selectedResidentNumberOfActiveStreams
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)selectedResidentJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)selectedResidentPartialJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)selectedResidentHasActiveSessionWithCamera
{
  return self->_selectedResidentHasActiveSessionWithCamera;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedResidentPartialJobSlots, 0);
  objc_storeStrong((id *)&self->_selectedResidentJobSlots, 0);
  objc_storeStrong((id *)&self->_selectedResidentNumberOfActiveStreams, 0);
  objc_storeStrong((id *)&self->_selectedResidentSystemResourceUsageLevel, 0);
  objc_storeStrong((id *)&self->_selectedResidentDeviceType, 0);
  objc_storeStrong((id *)&self->_remainingNumberOfJobSlots, 0);
  objc_storeStrong((id *)&self->_totalNumberOfJobSlots, 0);
  objc_storeStrong((id *)&self->_numberOfRetries, 0);
  objc_storeStrong((id *)&self->_numberOfResidents, 0);
}

@end
