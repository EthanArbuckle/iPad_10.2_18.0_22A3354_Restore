@implementation HMDMatterSoftwareUpdateEndEvent

- (HMDMatterSoftwareUpdateEndEvent)initWithAccessory:(id)a3 transport:(id)a4 accessorySoftwareVersionNumber:(id)a5 updateSoftwareVersionNumber:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDMatterSoftwareUpdateEndEvent *v17;
  HMDMatterSoftwareUpdateEndEvent *v18;
  void *v19;
  uint64_t v20;
  NSNumber *accessoryVendorID;
  void *v22;
  uint64_t v23;
  NSNumber *accessoryProductID;
  void *v25;
  uint64_t v26;
  NSMutableDictionary *vendorDetailsForCoreAnalytics;
  void *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HMDMatterSoftwareUpdateEndEvent;
  v17 = -[HMMLogEvent init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accessoryTransport, a4);
    objc_msgSend(v12, "chipStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "vendorID");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoryVendorID = v18->_accessoryVendorID;
    v18->_accessoryVendorID = (NSNumber *)v20;

    objc_msgSend(v12, "chipStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "productID");
    v23 = objc_claimAutoreleasedReturnValue();
    accessoryProductID = v18->_accessoryProductID;
    v18->_accessoryProductID = (NSNumber *)v23;

    objc_storeStrong((id *)&v18->_accessoryFirmwareVersionNumber, a5);
    objc_storeStrong((id *)&v18->_targetFirmwareVersionNumber, a6);
    -[HMMLogEvent setError:](v18, "setError:", v16);
    objc_msgSend(v12, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = objc_msgSend(v25, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    vendorDetailsForCoreAnalytics = v18->_vendorDetailsForCoreAnalytics;
    v18->_vendorDetailsForCoreAnalytics = (NSMutableDictionary *)v26;

    -[HMDMatterSoftwareUpdateEndEvent vendorDetailsForCoreAnalytics](v18, "vendorDetailsForCoreAnalytics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "populateVendorDetailsForCoreAnalytics:keyPrefix:", v28, CFSTR("accessory"));

  }
  return v18;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.accessoryFirmwareUpdate.matterEndEvent");
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
  -[HMDMatterSoftwareUpdateEndEvent accessoryTransport](self, "accessoryTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accessoryTransport"));

  -[HMDMatterSoftwareUpdateEndEvent accessoryVendorID](self, "accessoryVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessoryVendorID"));

  -[HMDMatterSoftwareUpdateEndEvent accessoryProductID](self, "accessoryProductID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accessoryProductID"));

  -[HMDMatterSoftwareUpdateEndEvent accessoryFirmwareVersionNumber](self, "accessoryFirmwareVersionNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("currentAccessoryFirmwareVersionNumber"));

  -[HMDMatterSoftwareUpdateEndEvent targetFirmwareVersionNumber](self, "targetFirmwareVersionNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("targetAccessoryFirmwareVersionNumber"));

  -[HMMLogEvent error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

    objc_msgSend(v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("errorDomain"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDMatterSoftwareUpdateEndEvent isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](self, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isAutomaticFirmwareUpdateEnabled"));

  -[HMDMatterSoftwareUpdateEndEvent vendorDetailsForCoreAnalytics](self, "vendorDetailsForCoreAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v14);

  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)accessoryTransport
{
  return self->_accessoryTransport;
}

- (NSNumber)accessoryProductID
{
  return self->_accessoryProductID;
}

- (NSNumber)accessoryVendorID
{
  return self->_accessoryVendorID;
}

- (NSNumber)accessoryFirmwareVersionNumber
{
  return self->_accessoryFirmwareVersionNumber;
}

- (NSNumber)targetFirmwareVersionNumber
{
  return self->_targetFirmwareVersionNumber;
}

- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled
{
  return self->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
}

- (NSMutableDictionary)vendorDetailsForCoreAnalytics
{
  return self->_vendorDetailsForCoreAnalytics;
}

- (void)setVendorDetailsForCoreAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_vendorDetailsForCoreAnalytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorDetailsForCoreAnalytics, 0);
  objc_storeStrong((id *)&self->_targetFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_accessoryFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_accessoryVendorID, 0);
  objc_storeStrong((id *)&self->_accessoryProductID, 0);
  objc_storeStrong((id *)&self->_accessoryTransport, 0);
}

@end
