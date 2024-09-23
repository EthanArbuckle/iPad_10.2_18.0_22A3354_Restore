@implementation HMDAccessorySoftwareUpdateApplyEvent

- (HMDAccessorySoftwareUpdateApplyEvent)initWithDetails:(id)a3 stagedVersion:(id)a4 advertisedDuration:(unint64_t)a5 totalAllowedDuration:(unint64_t)a6 status:(int64_t)a7
{
  id v13;
  id v14;
  HMDAccessorySoftwareUpdateApplyEvent *v15;
  HMDAccessorySoftwareUpdateApplyEvent *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessorySoftwareUpdateApplyEvent;
  v15 = -[HMMLogEvent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_metricVendorDetails, a3);
    objc_storeStrong((id *)&v16->_stagedVersion, a4);
    v16->_advertisedDuration = a5;
    v16->_totalAllowedDuration = a6;
    v16->_status = a7;
  }

  return v16;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.accessory.softwareupdate.apply");
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
  int64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySoftwareUpdateApplyEvent metricVendorDetails](self, "metricVendorDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessoryManufacturer"));

  -[HMDAccessorySoftwareUpdateApplyEvent metricVendorDetails](self, "metricVendorDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryModel"));

  -[HMDAccessorySoftwareUpdateApplyEvent metricVendorDetails](self, "metricVendorDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firmwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryFirmwareVersion"));

  -[HMDAccessorySoftwareUpdateApplyEvent stagedVersion](self, "stagedVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "versionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("accessoryStagedVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateApplyEvent advertisedDuration](self, "advertisedDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("advertisedDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateApplyEvent totalAllowedDuration](self, "totalAllowedDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("totalAllowedDuration"));

  v14 = -[HMDAccessorySoftwareUpdateApplyEvent status](self, "status");
  v15 = CFSTR("Unknown");
  if (v14 == 2)
    v15 = CFSTR("Exceeded Total Allowed Apply Duration");
  if (v14 == 1)
    v16 = CFSTR("Exceeded Advertised Apply Duration");
  else
    v16 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("status"));
  v17 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v17;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDAccessoryMetricVendorDetails)metricVendorDetails
{
  return self->_metricVendorDetails;
}

- (HMFSoftwareVersion)stagedVersion
{
  return self->_stagedVersion;
}

- (unint64_t)advertisedDuration
{
  return self->_advertisedDuration;
}

- (unint64_t)totalAllowedDuration
{
  return self->_totalAllowedDuration;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedVersion, 0);
  objc_storeStrong((id *)&self->_metricVendorDetails, 0);
}

+ (id)eventWithMetricVendorDetails:(id)a3 stagedVersion:(id)a4 advertisedDuration:(unint64_t)a5 totalAllowedDuration:(unint64_t)a6 status:(int64_t)a7
{
  id v11;
  id v12;
  HMDAccessorySoftwareUpdateApplyEvent *v13;

  v11 = a4;
  v12 = a3;
  v13 = -[HMDAccessorySoftwareUpdateApplyEvent initWithDetails:stagedVersion:advertisedDuration:totalAllowedDuration:status:]([HMDAccessorySoftwareUpdateApplyEvent alloc], "initWithDetails:stagedVersion:advertisedDuration:totalAllowedDuration:status:", v12, v11, a5, a6, a7);

  return v13;
}

@end
