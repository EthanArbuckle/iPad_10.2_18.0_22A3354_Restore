@implementation MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct

- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)init
{
  MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct *v2;
  MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct *v3;
  NSNumber *energy;
  NSNumber *startTimestamp;
  NSNumber *endTimestamp;
  NSNumber *startSystime;
  NSNumber *endSystime;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct;
  v2 = -[MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    energy = v2->_energy;
    v2->_energy = (NSNumber *)&unk_250591B18;

    startTimestamp = v3->_startTimestamp;
    v3->_startTimestamp = 0;

    endTimestamp = v3->_endTimestamp;
    v3->_endTimestamp = 0;

    startSystime = v3->_startSystime;
    v3->_startSystime = 0;

    endSystime = v3->_endSystime;
    v3->_endSystime = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct *v4;
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

  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct);
  objc_msgSend_energy(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnergy_(v4, v8, (uint64_t)v7);

  objc_msgSend_startTimestamp(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTimestamp_(v4, v12, (uint64_t)v11);

  objc_msgSend_endTimestamp(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndTimestamp_(v4, v16, (uint64_t)v15);

  objc_msgSend_startSystime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartSystime_(v4, v20, (uint64_t)v19);

  objc_msgSend_endSystime(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndSystime_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: energy:%@; startTimestamp:%@; endTimestamp:%@; startSystime:%@; endSystime:%@; >"),
    v5,
    self->_energy,
    self->_startTimestamp,
    self->_endTimestamp,
    self->_startSystime,
    self->_endSystime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)energy
{
  return self->_energy;
}

- (void)setEnergy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)startSystime
{
  return self->_startSystime;
}

- (void)setStartSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)endSystime
{
  return self->_endSystime;
}

- (void)setEndSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endSystime, 0);
  objc_storeStrong((id *)&self->_startSystime, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_energy, 0);
}

@end
