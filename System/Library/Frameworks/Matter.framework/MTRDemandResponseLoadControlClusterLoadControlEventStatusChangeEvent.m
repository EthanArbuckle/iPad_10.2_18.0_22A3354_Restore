@implementation MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent

- (MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent)init
{
  const char *v2;
  uint64_t v3;
  MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent *v4;
  uint64_t v5;
  NSData *eventID;
  NSNumber *transitionIndex;
  NSNumber *status;
  NSNumber *criticality;
  NSNumber *control;
  MTRDemandResponseLoadControlClusterTemperatureControlStruct *temperatureControl;
  MTRDemandResponseLoadControlClusterAverageLoadControlStruct *averageLoadControl;
  MTRDemandResponseLoadControlClusterDutyCycleControlStruct *dutyCycleControl;
  MTRDemandResponseLoadControlClusterPowerSavingsControlStruct *powerSavingsControl;
  MTRDemandResponseLoadControlClusterHeatingSourceControlStruct *heatingSourceControl;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent;
  v4 = -[MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent init](&v17, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    eventID = v4->_eventID;
    v4->_eventID = (NSData *)v5;

    transitionIndex = v4->_transitionIndex;
    v4->_transitionIndex = 0;

    status = v4->_status;
    v4->_status = (NSNumber *)&unk_250591B18;

    criticality = v4->_criticality;
    v4->_criticality = (NSNumber *)&unk_250591B18;

    control = v4->_control;
    v4->_control = (NSNumber *)&unk_250591B18;

    temperatureControl = v4->_temperatureControl;
    v4->_temperatureControl = 0;

    averageLoadControl = v4->_averageLoadControl;
    v4->_averageLoadControl = 0;

    dutyCycleControl = v4->_dutyCycleControl;
    v4->_dutyCycleControl = 0;

    powerSavingsControl = v4->_powerSavingsControl;
    v4->_powerSavingsControl = 0;

    heatingSourceControl = v4->_heatingSourceControl;
    v4->_heatingSourceControl = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent *v4;
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
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterLoadControlEventStatusChangeEvent);
  objc_msgSend_eventID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventID_(v4, v8, (uint64_t)v7);

  objc_msgSend_transitionIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransitionIndex_(v4, v12, (uint64_t)v11);

  objc_msgSend_status(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v16, (uint64_t)v15);

  objc_msgSend_criticality(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCriticality_(v4, v20, (uint64_t)v19);

  objc_msgSend_control(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setControl_(v4, v24, (uint64_t)v23);

  objc_msgSend_temperatureControl(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTemperatureControl_(v4, v28, (uint64_t)v27);

  objc_msgSend_averageLoadControl(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAverageLoadControl_(v4, v32, (uint64_t)v31);

  objc_msgSend_dutyCycleControl(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDutyCycleControl_(v4, v36, (uint64_t)v35);

  objc_msgSend_powerSavingsControl(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPowerSavingsControl_(v4, v40, (uint64_t)v39);

  objc_msgSend_heatingSourceControl(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeatingSourceControl_(v4, v44, (uint64_t)v43);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_eventID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: eventID:%@; transitionIndex:%@; status:%@; criticality:%@; control:%@; temperatureControl:%@; averageLoadControl:%@; dutyCycleControl:%@; powerSavingsControl:%@; heatingSourceControl:%@; >"),
    v5,
    v7,
    self->_transitionIndex,
    self->_status,
    self->_criticality,
    self->_control,
    self->_temperatureControl,
    self->_averageLoadControl,
    self->_dutyCycleControl,
    self->_powerSavingsControl,
    self->_heatingSourceControl);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)transitionIndex
{
  return self->_transitionIndex;
}

- (void)setTransitionIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)criticality
{
  return self->_criticality;
}

- (void)setCriticality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)temperatureControl
{
  return self->_temperatureControl;
}

- (void)setTemperatureControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)averageLoadControl
{
  return self->_averageLoadControl;
}

- (void)setAverageLoadControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (MTRDemandResponseLoadControlClusterDutyCycleControlStruct)dutyCycleControl
{
  return self->_dutyCycleControl;
}

- (void)setDutyCycleControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MTRDemandResponseLoadControlClusterPowerSavingsControlStruct)powerSavingsControl
{
  return self->_powerSavingsControl;
}

- (void)setPowerSavingsControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MTRDemandResponseLoadControlClusterHeatingSourceControlStruct)heatingSourceControl
{
  return self->_heatingSourceControl;
}

- (void)setHeatingSourceControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatingSourceControl, 0);
  objc_storeStrong((id *)&self->_powerSavingsControl, 0);
  objc_storeStrong((id *)&self->_dutyCycleControl, 0);
  objc_storeStrong((id *)&self->_averageLoadControl, 0);
  objc_storeStrong((id *)&self->_temperatureControl, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_criticality, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_transitionIndex, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end
