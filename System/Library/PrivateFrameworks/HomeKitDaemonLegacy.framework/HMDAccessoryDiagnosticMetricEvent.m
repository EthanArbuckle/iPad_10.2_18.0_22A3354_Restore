@implementation HMDAccessoryDiagnosticMetricEvent

- (HMDAccessoryDiagnosticMetricEvent)initWithAccessory:(id)a3 diagnostics:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryDiagnosticMetricEvent *v8;
  HMDAccessoryDiagnosticMetricEvent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryDiagnosticMetricEvent;
  v8 = -[HMDHAPMetrics initWithHMDAccessory:](&v11, sel_initWithHMDAccessory_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_diagnostics, a4);
  }

  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.Matter.Accessory.Diagnostic");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;
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
  HMDAccessoryDiagnosticMetricEvent *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDiagnosticMetricEvent accessory](self, "accessory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v4, "metricLoggingTransportDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricLoggingVendorDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accessoryCategory"));

  objc_msgSend(v8, "firmwareVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("accessoryFirmwareVersion"));

  objc_msgSend(v8, "manufacturer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("accessoryManufacturer"));

  objc_msgSend(v8, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("accessoryModel"));

  objc_msgSend(v7, "accessoryProtocol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("accessoryProtocol"));

  objc_msgSend(v6, "linkLayerType");
  HAPLinkLayerTypeDescription();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("accessoryTransport"));

  objc_msgSend(v6, "expectedTransport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("expectedTransport"));

  -[HMDAccessoryDiagnosticMetricEvent diagnostics](self, "diagnostics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v16);

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v25 = v17;
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v3;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Serialized HMDAccessoryDiagnosticMetricEvent for accessory: %@/%@ - %@", buf, 0x2Au);

    v7 = v22;
    v17 = v25;

  }
  objc_autoreleasePoolPop(v17);

  return (NSDictionary *)v3;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (NSDictionary)diagnostics
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

@end
