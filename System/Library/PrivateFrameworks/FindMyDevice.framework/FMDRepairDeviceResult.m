@implementation FMDRepairDeviceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDRepairDeviceResult)initWithEligibleDevices:(id)a3 devicesInRepairMode:(id)a4
{
  id v7;
  id v8;
  FMDRepairDeviceResult *v9;
  FMDRepairDeviceResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDRepairDeviceResult;
  v9 = -[FMDRepairDeviceResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eligibleDevices, a3);
    objc_storeStrong((id *)&v10->_devicesInRepairMode, a4);
  }

  return v10;
}

- (FMDRepairDeviceResult)initWithCoder:(id)a3
{
  id v4;
  FMDRepairDeviceResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *eligibleDevices;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *devicesInRepairMode;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDRepairDeviceResult;
  v5 = -[FMDRepairDeviceResult init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("eligibleDevices"));
    v9 = objc_claimAutoreleasedReturnValue();
    eligibleDevices = v5->_eligibleDevices;
    v5->_eligibleDevices = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("devicesInRepairMode"));
    v14 = objc_claimAutoreleasedReturnValue();
    devicesInRepairMode = v5->_devicesInRepairMode;
    v5->_devicesInRepairMode = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *eligibleDevices;
  id v5;

  eligibleDevices = self->_eligibleDevices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eligibleDevices, CFSTR("eligibleDevices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_devicesInRepairMode, CFSTR("devicesInRepairMode"));

}

- (NSArray)eligibleDevices
{
  return self->_eligibleDevices;
}

- (void)setEligibleDevices:(id)a3
{
  objc_storeStrong((id *)&self->_eligibleDevices, a3);
}

- (NSArray)devicesInRepairMode
{
  return self->_devicesInRepairMode;
}

- (void)setDevicesInRepairMode:(id)a3
{
  objc_storeStrong((id *)&self->_devicesInRepairMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesInRepairMode, 0);
  objc_storeStrong((id *)&self->_eligibleDevices, 0);
}

@end
