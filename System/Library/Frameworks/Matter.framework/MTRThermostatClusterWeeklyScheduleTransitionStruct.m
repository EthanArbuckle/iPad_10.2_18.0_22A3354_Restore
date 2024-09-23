@implementation MTRThermostatClusterWeeklyScheduleTransitionStruct

- (MTRThermostatClusterWeeklyScheduleTransitionStruct)init
{
  MTRThermostatClusterWeeklyScheduleTransitionStruct *v2;
  MTRThermostatClusterWeeklyScheduleTransitionStruct *v3;
  NSNumber *transitionTime;
  NSNumber *heatSetpoint;
  NSNumber *coolSetpoint;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRThermostatClusterWeeklyScheduleTransitionStruct;
  v2 = -[MTRThermostatClusterWeeklyScheduleTransitionStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    transitionTime = v2->_transitionTime;
    v2->_transitionTime = (NSNumber *)&unk_250591B18;

    heatSetpoint = v3->_heatSetpoint;
    v3->_heatSetpoint = 0;

    coolSetpoint = v3->_coolSetpoint;
    v3->_coolSetpoint = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThermostatClusterWeeklyScheduleTransitionStruct *v4;
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

  v4 = objc_alloc_init(MTRThermostatClusterWeeklyScheduleTransitionStruct);
  objc_msgSend_transitionTime(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionTime_(v4, v8, (uint64_t)v7);

  objc_msgSend_heatSetpoint(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeatSetpoint_(v4, v12, (uint64_t)v11);

  objc_msgSend_coolSetpoint(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCoolSetpoint_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: transitionTime:%@; heatSetpoint:%@; coolSetpoint:%@; >"),
    v5,
    self->_transitionTime,
    self->_heatSetpoint,
    self->_coolSetpoint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)transitionTime
{
  return self->_transitionTime;
}

- (void)setTransitionTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)heatSetpoint
{
  return self->_heatSetpoint;
}

- (void)setHeatSetpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)coolSetpoint
{
  return self->_coolSetpoint;
}

- (void)setCoolSetpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coolSetpoint, 0);
  objc_storeStrong((id *)&self->_heatSetpoint, 0);
  objc_storeStrong((id *)&self->_transitionTime, 0);
}

@end
