@implementation MTREnergyEVSEClusterChargingTargetScheduleStruct

- (MTREnergyEVSEClusterChargingTargetScheduleStruct)init
{
  MTREnergyEVSEClusterChargingTargetScheduleStruct *v2;
  MTREnergyEVSEClusterChargingTargetScheduleStruct *v3;
  NSNumber *dayOfWeekForSequence;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *chargingTargets;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTREnergyEVSEClusterChargingTargetScheduleStruct;
  v2 = -[MTREnergyEVSEClusterChargingTargetScheduleStruct init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    dayOfWeekForSequence = v2->_dayOfWeekForSequence;
    v2->_dayOfWeekForSequence = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    chargingTargets = v3->_chargingTargets;
    v3->_chargingTargets = (NSArray *)v7;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterChargingTargetScheduleStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTREnergyEVSEClusterChargingTargetScheduleStruct);
  objc_msgSend_dayOfWeekForSequence(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDayOfWeekForSequence_(v4, v8, (uint64_t)v7);

  objc_msgSend_chargingTargets(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChargingTargets_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: dayOfWeekForSequence:%@; chargingTargets:%@; >"),
    v5,
    self->_dayOfWeekForSequence,
    self->_chargingTargets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)dayOfWeekForSequence
{
  return self->_dayOfWeekForSequence;
}

- (void)setDayOfWeekForSequence:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)chargingTargets
{
  return self->_chargingTargets;
}

- (void)setChargingTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingTargets, 0);
  objc_storeStrong((id *)&self->_dayOfWeekForSequence, 0);
}

@end
