@implementation MTRDeviceEnergyManagementClusterSlotAdjustmentStruct

- (MTRDeviceEnergyManagementClusterSlotAdjustmentStruct)init
{
  MTRDeviceEnergyManagementClusterSlotAdjustmentStruct *v2;
  MTRDeviceEnergyManagementClusterSlotAdjustmentStruct *v3;
  NSNumber *slotIndex;
  NSNumber *nominalPower;
  NSNumber *duration;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRDeviceEnergyManagementClusterSlotAdjustmentStruct;
  v2 = -[MTRDeviceEnergyManagementClusterSlotAdjustmentStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    slotIndex = v2->_slotIndex;
    v2->_slotIndex = (NSNumber *)&unk_250591B18;

    nominalPower = v3->_nominalPower;
    v3->_nominalPower = 0;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterSlotAdjustmentStruct *v4;
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

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterSlotAdjustmentStruct);
  objc_msgSend_slotIndex(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSlotIndex_(v4, v8, (uint64_t)v7);

  objc_msgSend_nominalPower(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNominalPower_(v4, v12, (uint64_t)v11);

  objc_msgSend_duration(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: slotIndex:%@; nominalPower:%@; duration:%@; >"),
    v5,
    self->_slotIndex,
    self->_nominalPower,
    self->_duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)slotIndex
{
  return self->_slotIndex;
}

- (void)setSlotIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)nominalPower
{
  return self->_nominalPower;
}

- (void)setNominalPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_nominalPower, 0);
  objc_storeStrong((id *)&self->_slotIndex, 0);
}

@end
