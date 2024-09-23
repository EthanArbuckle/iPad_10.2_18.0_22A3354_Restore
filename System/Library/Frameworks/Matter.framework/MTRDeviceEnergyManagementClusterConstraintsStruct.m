@implementation MTRDeviceEnergyManagementClusterConstraintsStruct

- (MTRDeviceEnergyManagementClusterConstraintsStruct)init
{
  MTRDeviceEnergyManagementClusterConstraintsStruct *v2;
  MTRDeviceEnergyManagementClusterConstraintsStruct *v3;
  NSNumber *startTime;
  NSNumber *duration;
  NSNumber *nominalPower;
  NSNumber *maximumEnergy;
  NSNumber *loadControl;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRDeviceEnergyManagementClusterConstraintsStruct;
  v2 = -[MTRDeviceEnergyManagementClusterConstraintsStruct init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    startTime = v2->_startTime;
    v2->_startTime = (NSNumber *)&unk_250591B18;

    duration = v3->_duration;
    v3->_duration = (NSNumber *)&unk_250591B18;

    nominalPower = v3->_nominalPower;
    v3->_nominalPower = 0;

    maximumEnergy = v3->_maximumEnergy;
    v3->_maximumEnergy = 0;

    loadControl = v3->_loadControl;
    v3->_loadControl = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterConstraintsStruct *v4;
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
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterConstraintsStruct);
  objc_msgSend_startTime(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v8, (uint64_t)v7);

  objc_msgSend_duration(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v12, (uint64_t)v11);

  objc_msgSend_nominalPower(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNominalPower_(v4, v16, (uint64_t)v15);

  objc_msgSend_maximumEnergy(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumEnergy_(v4, v20, (uint64_t)v19);

  objc_msgSend_loadControl(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLoadControl_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: startTime:%@; duration:%@; nominalPower:%@; maximumEnergy:%@; loadControl:%@; >"),
    v5,
    self->_startTime,
    self->_duration,
    self->_nominalPower,
    self->_maximumEnergy,
    self->_loadControl);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
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

- (NSNumber)nominalPower
{
  return self->_nominalPower;
}

- (void)setNominalPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)maximumEnergy
{
  return self->_maximumEnergy;
}

- (void)setMaximumEnergy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)loadControl
{
  return self->_loadControl;
}

- (void)setLoadControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadControl, 0);
  objc_storeStrong((id *)&self->_maximumEnergy, 0);
  objc_storeStrong((id *)&self->_nominalPower, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
