@implementation HMDAccessoryMetricTransportDetails

- (HMDAccessoryMetricTransportDetails)initWithAccessory:(id)a3
{
  id v4;
  HMDAccessoryMetricTransportDetails *v5;
  id v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryMetricTransportDetails;
  v5 = -[HMDAccessoryMetricTransportDetails init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if ((objc_msgSend(v8, "supportsHAP") & 1) != 0)
    {
      v9 = CFSTR("HAP");
    }
    else if (objc_msgSend(v8, "supportsCHIP"))
    {
      v9 = CFSTR("Matter");
    }
    else
    {
      v9 = CFSTR("Unknown");
    }
    objc_storeStrong((id *)&v5->_accessoryProtocol, v9);
    v5->_isAccessoryBatteryPowered = objc_msgSend(v8, "hasBattery");
    objc_msgSend(v8, "bridge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAccessoryBridged = v10 != 0;

    v5->_isThreadAccessory = objc_msgSend(v8, "supportsThread");
    v5->_isHH2Enabled = HAPIsHH2Enabled();

  }
  return v5;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryMetricTransportDetails accessoryProtocol](self, "accessoryProtocol");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryProtocol"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryMetricTransportDetails isAccessoryBatteryPowered](self, "isAccessoryBatteryPowered");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("isAccessoryBatteryPowered"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryMetricTransportDetails isAccessoryBridged](self, "isAccessoryBridged");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("isAccessoryBridged"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryMetricTransportDetails isThreadAccessory](self, "isThreadAccessory");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("isThreadAccessory"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryMetricTransportDetails isHH2Enabled](self, "isHH2Enabled");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("isHH2Enabled"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)accessoryProtocol
{
  return self->_accessoryProtocol;
}

- (void)setAccessoryProtocol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAccessoryBatteryPowered
{
  return self->_isAccessoryBatteryPowered;
}

- (void)setIsAccessoryBatteryPowered:(BOOL)a3
{
  self->_isAccessoryBatteryPowered = a3;
}

- (BOOL)isAccessoryBridged
{
  return self->_isAccessoryBridged;
}

- (void)setIsAccessoryBridged:(BOOL)a3
{
  self->_isAccessoryBridged = a3;
}

- (BOOL)isThreadAccessory
{
  return self->_isThreadAccessory;
}

- (void)setIsThreadAccessory:(BOOL)a3
{
  self->_isThreadAccessory = a3;
}

- (BOOL)isHH2Enabled
{
  return self->_isHH2Enabled;
}

- (void)setIsHH2Enabled:(BOOL)a3
{
  self->_isHH2Enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryProtocol, 0);
}

@end
