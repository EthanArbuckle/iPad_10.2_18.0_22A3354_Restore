@implementation HMDRemoteDeviceReachabilityChangeLogEvent

- (HMDRemoteDeviceReachabilityChangeLogEvent)initWithReason:(unint64_t)a3 reachable:(BOOL)a4 targetSupportsIDSPresence:(BOOL)a5
{
  HMDRemoteDeviceReachabilityChangeLogEvent *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteDeviceReachabilityChangeLogEvent;
  result = -[HMMLogEvent init](&v9, sel_init);
  if (result)
  {
    result->_reason = a3;
    result->_reachable = a4;
    result->_targetSupportsIDSPresence = a5;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.remoteDevice.reachability");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("reachable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDRemoteDeviceReachabilityChangeLogEvent reachable](self, "reachable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("reason");
  v4 = -[HMDRemoteDeviceReachabilityChangeLogEvent reason](self, "reason");
  if (v4 > 6)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E89AD420[v4];
  v10[1] = v5;
  v9[2] = CFSTR("targetSupportsIDSPresence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDRemoteDeviceReachabilityChangeLogEvent targetSupportsIDSPresence](self, "targetSupportsIDSPresence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (BOOL)targetSupportsIDSPresence
{
  return self->_targetSupportsIDSPresence;
}

@end
