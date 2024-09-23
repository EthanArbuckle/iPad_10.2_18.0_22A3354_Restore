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
  uint64_t v19;
  NSNumber *accessoryVendorID;
  uint64_t v21;
  NSNumber *accessoryProductID;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *vendorDetailsForCoreAnalytics;
  void *v26;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HMDMatterSoftwareUpdateEndEvent;
  v17 = -[HMMLogEvent init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accessoryTransport, a4);
    objc_msgSend(v12, "matterVendorID");
    v19 = objc_claimAutoreleasedReturnValue();
    accessoryVendorID = v18->_accessoryVendorID;
    v18->_accessoryVendorID = (NSNumber *)v19;

    objc_msgSend(v12, "matterProductID");
    v21 = objc_claimAutoreleasedReturnValue();
    accessoryProductID = v18->_accessoryProductID;
    v18->_accessoryProductID = (NSNumber *)v21;

    objc_storeStrong((id *)&v18->_accessoryFirmwareVersionNumber, a5);
    objc_storeStrong((id *)&v18->_targetFirmwareVersionNumber, a6);
    -[HMMLogEvent setError:](v18, "setError:", v16);
    objc_msgSend(v12, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = objc_msgSend(v23, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    vendorDetailsForCoreAnalytics = v18->_vendorDetailsForCoreAnalytics;
    v18->_vendorDetailsForCoreAnalytics = (NSMutableDictionary *)v24;

    -[HMDMatterSoftwareUpdateEndEvent vendorDetailsForCoreAnalytics](v18, "vendorDetailsForCoreAnalytics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "populateVendorDetailsForCoreAnalytics:keyPrefix:", v26, CFSTR("accessory"));

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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
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
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

    objc_msgSend(v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("errorDomain"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDMatterSoftwareUpdateEndEvent isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](self, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"));
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
