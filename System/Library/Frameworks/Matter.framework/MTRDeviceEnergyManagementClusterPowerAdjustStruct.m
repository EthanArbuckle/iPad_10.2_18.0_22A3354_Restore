@implementation MTRDeviceEnergyManagementClusterPowerAdjustStruct

- (MTRDeviceEnergyManagementClusterPowerAdjustStruct)init
{
  MTRDeviceEnergyManagementClusterPowerAdjustStruct *v2;
  MTRDeviceEnergyManagementClusterPowerAdjustStruct *v3;
  NSNumber *minPower;
  NSNumber *maxPower;
  NSNumber *minDuration;
  NSNumber *maxDuration;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRDeviceEnergyManagementClusterPowerAdjustStruct;
  v2 = -[MTRDeviceEnergyManagementClusterPowerAdjustStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    minPower = v2->_minPower;
    v2->_minPower = (NSNumber *)&unk_250591B18;

    maxPower = v3->_maxPower;
    v3->_maxPower = (NSNumber *)&unk_250591B18;

    minDuration = v3->_minDuration;
    v3->_minDuration = (NSNumber *)&unk_250591B18;

    maxDuration = v3->_maxDuration;
    v3->_maxDuration = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterPowerAdjustStruct *v4;
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
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterPowerAdjustStruct);
  objc_msgSend_minPower(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinPower_(v4, v8, (uint64_t)v7);

  objc_msgSend_maxPower(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxPower_(v4, v12, (uint64_t)v11);

  objc_msgSend_minDuration(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinDuration_(v4, v16, (uint64_t)v15);

  objc_msgSend_maxDuration(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxDuration_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: minPower:%@; maxPower:%@; minDuration:%@; maxDuration:%@; >"),
    v5,
    self->_minPower,
    self->_maxPower,
    self->_minDuration,
    self->_maxDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)minPower
{
  return self->_minPower;
}

- (void)setMinPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)maxPower
{
  return self->_maxPower;
}

- (void)setMaxPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)minDuration
{
  return self->_minDuration;
}

- (void)setMinDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxDuration, 0);
  objc_storeStrong((id *)&self->_minDuration, 0);
  objc_storeStrong((id *)&self->_maxPower, 0);
  objc_storeStrong((id *)&self->_minPower, 0);
}

@end
