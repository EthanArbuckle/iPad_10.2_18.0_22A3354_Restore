@implementation HMDWiFiReconfigurationLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.wiFiReconfiguration");
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDWiFiReconfigurationLogEvent isUsingFailSafeUpdate](self, "isUsingFailSafeUpdate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("failSafeUpdate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDWiFiReconfigurationLogEvent credentialType](self, "credentialType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("credentialType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil((double)-[HMMLogEvent durationMilliseconds](self, "durationMilliseconds") / 1000.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("duration"));

  -[HMDWiFiReconfigurationLogEvent accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "populateVendorDetailsForCoreAnalytics:keyPrefix:", v3, CFSTR("accessory"));

  -[HMDWiFiReconfigurationLogEvent routerAccessory](self, "routerAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "populateVendorDetailsForCoreAnalytics:keyPrefix:", v3, CFSTR("router"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (BOOL)isUsingFailSafeUpdate
{
  return self->_usingFailSafeUpdate;
}

- (void)setUsingFailSafeUpdate:(BOOL)a3
{
  self->_usingFailSafeUpdate = a3;
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (HMDAccessory)routerAccessory
{
  return self->_routerAccessory;
}

- (void)setRouterAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_routerAccessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routerAccessory, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
