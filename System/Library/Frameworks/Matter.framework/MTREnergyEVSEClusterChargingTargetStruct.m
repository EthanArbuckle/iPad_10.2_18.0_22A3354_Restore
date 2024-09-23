@implementation MTREnergyEVSEClusterChargingTargetStruct

- (MTREnergyEVSEClusterChargingTargetStruct)init
{
  MTREnergyEVSEClusterChargingTargetStruct *v2;
  MTREnergyEVSEClusterChargingTargetStruct *v3;
  NSNumber *targetTimeMinutesPastMidnight;
  NSNumber *targetSoC;
  NSNumber *addedEnergy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTREnergyEVSEClusterChargingTargetStruct;
  v2 = -[MTREnergyEVSEClusterChargingTargetStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    targetTimeMinutesPastMidnight = v2->_targetTimeMinutesPastMidnight;
    v2->_targetTimeMinutesPastMidnight = (NSNumber *)&unk_250591B18;

    targetSoC = v3->_targetSoC;
    v3->_targetSoC = 0;

    addedEnergy = v3->_addedEnergy;
    v3->_addedEnergy = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterChargingTargetStruct *v4;
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

  v4 = objc_alloc_init(MTREnergyEVSEClusterChargingTargetStruct);
  objc_msgSend_targetTimeMinutesPastMidnight(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetTimeMinutesPastMidnight_(v4, v8, (uint64_t)v7);

  objc_msgSend_targetSoC(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetSoC_(v4, v12, (uint64_t)v11);

  objc_msgSend_addedEnergy(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAddedEnergy_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: targetTimeMinutesPastMidnight:%@; targetSoC:%@; addedEnergy:%@; >"),
    v5,
    self->_targetTimeMinutesPastMidnight,
    self->_targetSoC,
    self->_addedEnergy);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)targetTimeMinutesPastMidnight
{
  return self->_targetTimeMinutesPastMidnight;
}

- (void)setTargetTimeMinutesPastMidnight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)targetSoC
{
  return self->_targetSoC;
}

- (void)setTargetSoC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)addedEnergy
{
  return self->_addedEnergy;
}

- (void)setAddedEnergy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedEnergy, 0);
  objc_storeStrong((id *)&self->_targetSoC, 0);
  objc_storeStrong((id *)&self->_targetTimeMinutesPastMidnight, 0);
}

@end
