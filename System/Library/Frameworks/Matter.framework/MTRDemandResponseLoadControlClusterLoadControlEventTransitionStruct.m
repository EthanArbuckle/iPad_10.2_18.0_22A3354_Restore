@implementation MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct

- (MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct)init
{
  MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct *v2;
  MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct *v3;
  NSNumber *duration;
  NSNumber *control;
  MTRDemandResponseLoadControlClusterTemperatureControlStruct *temperatureControl;
  MTRDemandResponseLoadControlClusterAverageLoadControlStruct *averageLoadControl;
  MTRDemandResponseLoadControlClusterDutyCycleControlStruct *dutyCycleControl;
  MTRDemandResponseLoadControlClusterPowerSavingsControlStruct *powerSavingsControl;
  MTRDemandResponseLoadControlClusterHeatingSourceControlStruct *heatingSourceControl;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct;
  v2 = -[MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    duration = v2->_duration;
    v2->_duration = (NSNumber *)&unk_250591B18;

    control = v3->_control;
    v3->_control = (NSNumber *)&unk_250591B18;

    temperatureControl = v3->_temperatureControl;
    v3->_temperatureControl = 0;

    averageLoadControl = v3->_averageLoadControl;
    v3->_averageLoadControl = 0;

    dutyCycleControl = v3->_dutyCycleControl;
    v3->_dutyCycleControl = 0;

    powerSavingsControl = v3->_powerSavingsControl;
    v3->_powerSavingsControl = 0;

    heatingSourceControl = v3->_heatingSourceControl;
    v3->_heatingSourceControl = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct *v4;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlEventTransitionStruct);
  objc_msgSend_duration(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v8, (uint64_t)v7);

  objc_msgSend_control(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setControl_(v4, v12, (uint64_t)v11);

  objc_msgSend_temperatureControl(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTemperatureControl_(v4, v16, (uint64_t)v15);

  objc_msgSend_averageLoadControl(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAverageLoadControl_(v4, v20, (uint64_t)v19);

  objc_msgSend_dutyCycleControl(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDutyCycleControl_(v4, v24, (uint64_t)v23);

  objc_msgSend_powerSavingsControl(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPowerSavingsControl_(v4, v28, (uint64_t)v27);

  objc_msgSend_heatingSourceControl(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeatingSourceControl_(v4, v32, (uint64_t)v31);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: duration:%@; control:%@; temperatureControl:%@; averageLoadControl:%@; dutyCycleControl:%@; powerSavingsControl:%@; heatingSourceControl:%@; >"),
    v5,
    self->_duration,
    self->_control,
    self->_temperatureControl,
    self->_averageLoadControl,
    self->_dutyCycleControl,
    self->_powerSavingsControl,
    self->_heatingSourceControl);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)temperatureControl
{
  return self->_temperatureControl;
}

- (void)setTemperatureControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)averageLoadControl
{
  return self->_averageLoadControl;
}

- (void)setAverageLoadControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MTRDemandResponseLoadControlClusterDutyCycleControlStruct)dutyCycleControl
{
  return self->_dutyCycleControl;
}

- (void)setDutyCycleControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MTRDemandResponseLoadControlClusterPowerSavingsControlStruct)powerSavingsControl
{
  return self->_powerSavingsControl;
}

- (void)setPowerSavingsControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MTRDemandResponseLoadControlClusterHeatingSourceControlStruct)heatingSourceControl
{
  return self->_heatingSourceControl;
}

- (void)setHeatingSourceControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatingSourceControl, 0);
  objc_storeStrong((id *)&self->_powerSavingsControl, 0);
  objc_storeStrong((id *)&self->_dutyCycleControl, 0);
  objc_storeStrong((id *)&self->_averageLoadControl, 0);
  objc_storeStrong((id *)&self->_temperatureControl, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end
