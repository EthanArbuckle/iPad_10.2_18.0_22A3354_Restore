@implementation HMDAccessoryReachabilityChangedLogEvent

- (HMDAccessoryReachabilityChangedLogEvent)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)__initWithReachable:(BOOL)a3 changed:(BOOL)a4 duration:(double)a5 accessory:(id)a6 transportReport:(id)a7
{
  id v12;
  id v13;
  HMDAccessoryReachabilityChangedLogEvent *v14;
  HMDAccessoryReachabilityChangedLogEvent *v15;
  void *v16;
  uint64_t v17;
  NSString *accessoryModel;
  uint64_t v19;
  NSString *accessoryManufacturer;
  uint64_t v21;
  NSString *accessoryCategory;
  uint64_t v23;
  NSString *accessoryFirmwareVersion;
  uint64_t v25;
  NSNumber *accessoryNumber;
  objc_super v28;

  v12 = a6;
  v13 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HMDAccessoryReachabilityChangedLogEvent;
  v14 = -[HMMLogEvent init](&v28, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_reachable = a3;
    v14->_changed = a4;
    v14->_duration = a5;
    v14->_accessoryBridged = objc_msgSend(v12, "isPrimary") ^ 1;
    v15->_accessoryBatteryPowered = objc_msgSend(v12, "hasBattery");
    v15->_batteryLow = 0;
    objc_storeStrong((id *)&v15->_transportReport, a7);
    objc_msgSend(v12, "metricLoggingVendorDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "model");
    v17 = objc_claimAutoreleasedReturnValue();
    accessoryModel = v15->_accessoryModel;
    v15->_accessoryModel = (NSString *)v17;

    objc_msgSend(v16, "manufacturer");
    v19 = objc_claimAutoreleasedReturnValue();
    accessoryManufacturer = v15->_accessoryManufacturer;
    v15->_accessoryManufacturer = (NSString *)v19;

    objc_msgSend(v16, "category");
    v21 = objc_claimAutoreleasedReturnValue();
    accessoryCategory = v15->_accessoryCategory;
    v15->_accessoryCategory = (NSString *)v21;

    objc_msgSend(v16, "firmwareVersion");
    v23 = objc_claimAutoreleasedReturnValue();
    accessoryFirmwareVersion = v15->_accessoryFirmwareVersion;
    v15->_accessoryFirmwareVersion = (NSString *)v23;

    objc_msgSend(v16, "differentiationNumber");
    v25 = objc_claimAutoreleasedReturnValue();
    accessoryNumber = v15->_accessoryNumber;
    v15->_accessoryNumber = (NSNumber *)v25;

  }
  return v15;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.AccessoryReachabilityChanged");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAccessoryReachabilityChangedLogEvent duration](self, "duration");
  objc_msgSend(v4, "numberWithInteger:", (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent accessoryBatteryPowered](self, "accessoryBatteryPowered"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryBatteryPowered"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent accessoryBridged](self, "accessoryBridged"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("accessoryBridged"));

  -[HMDAccessoryReachabilityChangedLogEvent accessoryCategory](self, "accessoryCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryCategory"));

  -[HMDAccessoryReachabilityChangedLogEvent accessoryFirmwareVersion](self, "accessoryFirmwareVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("accessoryFirmwareVersion"));

  -[HMDAccessoryReachabilityChangedLogEvent accessoryManufacturer](self, "accessoryManufacturer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("accessoryManufacturer"));

  -[HMDAccessoryReachabilityChangedLogEvent accessoryModel](self, "accessoryModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("accessoryModel"));

  -[HMDAccessoryReachabilityChangedLogEvent accessoryNumber](self, "accessoryNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("accessoryNumber"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent batteryLow](self, "batteryLow"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("batteryLow"));

  if (-[HMDAccessoryReachabilityChangedLogEvent changed](self, "changed"))
    v15 = &unk_24E96AD60;
  else
    v15 = &unk_24E96AD78;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("changeCount"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("duration"));
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAccessoryReachabilityChangedLogEvent transportReport](self, "transportReport");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "hasAdvertisement"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasAdvertisement"));

  -[HMDAccessoryReachabilityChangedLogEvent transportReport](self, "transportReport");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "protocol");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("protocol"));

  -[HMDAccessoryReachabilityChangedLogEvent transportReport](self, "transportReport");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "protocolVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("protocolVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAccessoryReachabilityChangedLogEvent reachable](self, "reachable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("reachable"));

  -[HMDAccessoryReachabilityChangedLogEvent transportReport](self, "transportReport");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "reason");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("reason"));

  -[HMDAccessoryReachabilityChangedLogEvent transportReport](self, "transportReport");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "linkType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("transport"));

  if (-[HMDAccessoryReachabilityChangedLogEvent reachable](self, "reachable"))
    v28 = CFSTR("unreachableDuration");
  else
    v28 = CFSTR("reachableDuration");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v28);
  v29 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v29;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)accessoryBatteryPowered
{
  return self->_accessoryBatteryPowered;
}

- (BOOL)accessoryBridged
{
  return self->_accessoryBridged;
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (NSString)accessoryFirmwareVersion
{
  return self->_accessoryFirmwareVersion;
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (NSString)accessoryModel
{
  return self->_accessoryModel;
}

- (NSNumber)accessoryNumber
{
  return self->_accessoryNumber;
}

- (BOOL)batteryLow
{
  return self->_batteryLow;
}

- (BOOL)changed
{
  return self->_changed;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (HMDAccessoryTransportReachabilityReport)transportReport
{
  return self->_transportReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportReport, 0);
  objc_storeStrong((id *)&self->_accessoryNumber, 0);
  objc_storeStrong((id *)&self->_accessoryModel, 0);
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_accessoryFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
}

+ (id)eventWithReachable:(BOOL)a3 changed:(BOOL)a4 duration:(double)a5 accessory:(id)a6 transportReport:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;

  v9 = a4;
  v10 = a3;
  v12 = a7;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "__initWithReachable:changed:duration:accessory:transportReport:", v10, v9, v13, v12, a5);

  return v14;
}

@end
