@implementation MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct

- (MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct)init
{
  MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct *v2;
  MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct *v3;
  NSArray *powerAdjustCapability;
  NSNumber *cause;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct;
  v2 = -[MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    powerAdjustCapability = v2->_powerAdjustCapability;
    v2->_powerAdjustCapability = 0;

    cause = v3->_cause;
    v3->_cause = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustCapabilityStruct);
  objc_msgSend_powerAdjustCapability(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPowerAdjustCapability_(v4, v8, (uint64_t)v7);

  objc_msgSend_cause(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCause_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: powerAdjustCapability:%@; cause:%@; >"),
    v5,
    self->_powerAdjustCapability,
    self->_cause);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)powerAdjustCapability
{
  return self->_powerAdjustCapability;
}

- (void)setPowerAdjustCapability:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_powerAdjustCapability, 0);
}

@end
