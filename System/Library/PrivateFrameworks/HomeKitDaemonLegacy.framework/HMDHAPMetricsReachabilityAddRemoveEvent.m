@implementation HMDHAPMetricsReachabilityAddRemoveEvent

- (HMDHAPMetricsReachabilityAddRemoveEvent)initWithAccessory:(id)a3 hmdAddRemoveEvent:(unint64_t)a4 forLinkType:(id)a5
{
  id v9;
  HMDHAPMetricsReachabilityAddRemoveEvent *v10;
  HMDHAPMetricsReachabilityAddRemoveEvent *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDHAPMetricsReachabilityAddRemoveEvent;
  v10 = -[HMDHAPMetrics initWithHMDAccessory:](&v13, sel_initWithHMDAccessory_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_addRemoveEvent = a4;
    objc_storeStrong((id *)&v10->_linkType, a5);
  }

  return v11;
}

- (id)coreAnalyticsEventName
{
  return CFSTR("com.apple.HomeKit.daemon.reachability.addremove");
}

- (id)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDHAPMetricsReachabilityAddRemoveEvent addRemoveEvent](self, "addRemoveEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("addremove"));

  -[HMDHAPMetricsReachabilityAddRemoveEvent linkType](self, "linkType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("linkType"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (unint64_t)addRemoveEvent
{
  return self->_addRemoveEvent;
}

- (NSNumber)linkType
{
  return self->_linkType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkType, 0);
}

@end
