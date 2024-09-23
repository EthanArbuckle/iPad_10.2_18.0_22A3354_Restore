@implementation MTRDeviceEnergyManagementClusterPowerAdjustEndEvent

- (MTRDeviceEnergyManagementClusterPowerAdjustEndEvent)init
{
  MTRDeviceEnergyManagementClusterPowerAdjustEndEvent *v2;
  MTRDeviceEnergyManagementClusterPowerAdjustEndEvent *v3;
  NSNumber *cause;
  NSNumber *duration;
  NSNumber *energyUse;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRDeviceEnergyManagementClusterPowerAdjustEndEvent;
  v2 = -[MTRDeviceEnergyManagementClusterPowerAdjustEndEvent init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    cause = v2->_cause;
    v2->_cause = (NSNumber *)&unk_250591B18;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_250591B18;

    energyUse = v3->_energyUse;
    v3->_energyUse = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterPowerAdjustEndEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustEndEvent);
  objc_msgSend_cause(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCause_(v4, v8, (uint64_t)v7);

  objc_msgSend_duration(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v12, (uint64_t)v11);

  objc_msgSend_energyUse(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnergyUse_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: cause:%@; duration:%@; energyUse:%@; >"),
    v5,
    self->_cause,
    self->_duration,
    self->_energyUse);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)energyUse
{
  return self->_energyUse;
}

- (void)setEnergyUse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyUse, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_cause, 0);
}

@end
