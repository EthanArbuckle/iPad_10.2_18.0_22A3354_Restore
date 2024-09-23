@implementation MTRDeviceEnergyManagementClusterSlotStruct

- (MTRDeviceEnergyManagementClusterSlotStruct)init
{
  MTRDeviceEnergyManagementClusterSlotStruct *v2;
  MTRDeviceEnergyManagementClusterSlotStruct *v3;
  NSNumber *minDuration;
  NSNumber *maxDuration;
  NSNumber *defaultDuration;
  NSNumber *elapsedSlotTime;
  NSNumber *remainingSlotTime;
  NSNumber *slotIsPausable;
  NSNumber *minPauseDuration;
  NSNumber *maxPauseDuration;
  NSNumber *manufacturerESAState;
  NSNumber *nominalPower;
  NSNumber *minPower;
  NSNumber *maxPower;
  NSNumber *nominalEnergy;
  NSArray *costs;
  NSNumber *minPowerAdjustment;
  NSNumber *maxPowerAdjustment;
  NSNumber *minDurationAdjustment;
  NSNumber *maxDurationAdjustment;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTRDeviceEnergyManagementClusterSlotStruct;
  v2 = -[MTRDeviceEnergyManagementClusterSlotStruct init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    minDuration = v2->_minDuration;
    v2->_minDuration = (NSNumber *)&unk_250591B18;

    maxDuration = v3->_maxDuration;
    v3->_maxDuration = (NSNumber *)&unk_250591B18;

    defaultDuration = v3->_defaultDuration;
    v3->_defaultDuration = (NSNumber *)&unk_250591B18;

    elapsedSlotTime = v3->_elapsedSlotTime;
    v3->_elapsedSlotTime = (NSNumber *)&unk_250591B18;

    remainingSlotTime = v3->_remainingSlotTime;
    v3->_remainingSlotTime = (NSNumber *)&unk_250591B18;

    slotIsPausable = v3->_slotIsPausable;
    v3->_slotIsPausable = 0;

    minPauseDuration = v3->_minPauseDuration;
    v3->_minPauseDuration = 0;

    maxPauseDuration = v3->_maxPauseDuration;
    v3->_maxPauseDuration = 0;

    manufacturerESAState = v3->_manufacturerESAState;
    v3->_manufacturerESAState = 0;

    nominalPower = v3->_nominalPower;
    v3->_nominalPower = 0;

    minPower = v3->_minPower;
    v3->_minPower = 0;

    maxPower = v3->_maxPower;
    v3->_maxPower = 0;

    nominalEnergy = v3->_nominalEnergy;
    v3->_nominalEnergy = 0;

    costs = v3->_costs;
    v3->_costs = 0;

    minPowerAdjustment = v3->_minPowerAdjustment;
    v3->_minPowerAdjustment = 0;

    maxPowerAdjustment = v3->_maxPowerAdjustment;
    v3->_maxPowerAdjustment = 0;

    minDurationAdjustment = v3->_minDurationAdjustment;
    v3->_minDurationAdjustment = 0;

    maxDurationAdjustment = v3->_maxDurationAdjustment;
    v3->_maxDurationAdjustment = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterSlotStruct *v4;
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
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterSlotStruct);
  objc_msgSend_minDuration(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinDuration_(v4, v8, (uint64_t)v7);

  objc_msgSend_maxDuration(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxDuration_(v4, v12, (uint64_t)v11);

  objc_msgSend_defaultDuration(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDefaultDuration_(v4, v16, (uint64_t)v15);

  objc_msgSend_elapsedSlotTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setElapsedSlotTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_remainingSlotTime(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemainingSlotTime_(v4, v24, (uint64_t)v23);

  objc_msgSend_slotIsPausable(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSlotIsPausable_(v4, v28, (uint64_t)v27);

  objc_msgSend_minPauseDuration(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinPauseDuration_(v4, v32, (uint64_t)v31);

  objc_msgSend_maxPauseDuration(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxPauseDuration_(v4, v36, (uint64_t)v35);

  objc_msgSend_manufacturerESAState(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setManufacturerESAState_(v4, v40, (uint64_t)v39);

  objc_msgSend_nominalPower(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNominalPower_(v4, v44, (uint64_t)v43);

  objc_msgSend_minPower(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinPower_(v4, v48, (uint64_t)v47);

  objc_msgSend_maxPower(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxPower_(v4, v52, (uint64_t)v51);

  objc_msgSend_nominalEnergy(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNominalEnergy_(v4, v56, (uint64_t)v55);

  objc_msgSend_costs(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCosts_(v4, v60, (uint64_t)v59);

  objc_msgSend_minPowerAdjustment(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinPowerAdjustment_(v4, v64, (uint64_t)v63);

  objc_msgSend_maxPowerAdjustment(self, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxPowerAdjustment_(v4, v68, (uint64_t)v67);

  objc_msgSend_minDurationAdjustment(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinDurationAdjustment_(v4, v72, (uint64_t)v71);

  objc_msgSend_maxDurationAdjustment(self, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxDurationAdjustment_(v4, v76, (uint64_t)v75);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: minDuration:%@; maxDuration:%@; defaultDuration:%@; elapsedSlotTime:%@; remainingSlotTime:%@; slotIsPausable:%@; minPauseDuration:%@; maxPauseDuration:%@; manufacturerESAState:%@; nominalPower:%@; minPower:%@; maxPower:%@; nominalEnergy:%@; costs:%@; minPowerAdjustment:%@; maxPowerAdjustment:%@; minDurationAdjustment:%@; maxDurationAdjustment:%@; >"),
    v5,
    self->_minDuration,
    self->_maxDuration,
    self->_defaultDuration,
    self->_elapsedSlotTime,
    self->_remainingSlotTime,
    self->_slotIsPausable,
    self->_minPauseDuration,
    self->_maxPauseDuration,
    self->_manufacturerESAState,
    self->_nominalPower,
    self->_minPower,
    self->_maxPower,
    self->_nominalEnergy,
    self->_costs,
    self->_minPowerAdjustment,
    self->_maxPowerAdjustment,
    self->_minDurationAdjustment,
    self->_maxDurationAdjustment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)minDuration
{
  return self->_minDuration;
}

- (void)setMinDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)elapsedSlotTime
{
  return self->_elapsedSlotTime;
}

- (void)setElapsedSlotTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)remainingSlotTime
{
  return self->_remainingSlotTime;
}

- (void)setRemainingSlotTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)slotIsPausable
{
  return self->_slotIsPausable;
}

- (void)setSlotIsPausable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)minPauseDuration
{
  return self->_minPauseDuration;
}

- (void)setMinPauseDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)maxPauseDuration
{
  return self->_maxPauseDuration;
}

- (void)setMaxPauseDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)manufacturerESAState
{
  return self->_manufacturerESAState;
}

- (void)setManufacturerESAState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)nominalPower
{
  return self->_nominalPower;
}

- (void)setNominalPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)minPower
{
  return self->_minPower;
}

- (void)setMinPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)maxPower
{
  return self->_maxPower;
}

- (void)setMaxPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)nominalEnergy
{
  return self->_nominalEnergy;
}

- (void)setNominalEnergy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)costs
{
  return self->_costs;
}

- (void)setCosts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)minPowerAdjustment
{
  return self->_minPowerAdjustment;
}

- (void)setMinPowerAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)maxPowerAdjustment
{
  return self->_maxPowerAdjustment;
}

- (void)setMaxPowerAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)minDurationAdjustment
{
  return self->_minDurationAdjustment;
}

- (void)setMinDurationAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)maxDurationAdjustment
{
  return self->_maxDurationAdjustment;
}

- (void)setMaxDurationAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxDurationAdjustment, 0);
  objc_storeStrong((id *)&self->_minDurationAdjustment, 0);
  objc_storeStrong((id *)&self->_maxPowerAdjustment, 0);
  objc_storeStrong((id *)&self->_minPowerAdjustment, 0);
  objc_storeStrong((id *)&self->_costs, 0);
  objc_storeStrong((id *)&self->_nominalEnergy, 0);
  objc_storeStrong((id *)&self->_maxPower, 0);
  objc_storeStrong((id *)&self->_minPower, 0);
  objc_storeStrong((id *)&self->_nominalPower, 0);
  objc_storeStrong((id *)&self->_manufacturerESAState, 0);
  objc_storeStrong((id *)&self->_maxPauseDuration, 0);
  objc_storeStrong((id *)&self->_minPauseDuration, 0);
  objc_storeStrong((id *)&self->_slotIsPausable, 0);
  objc_storeStrong((id *)&self->_remainingSlotTime, 0);
  objc_storeStrong((id *)&self->_elapsedSlotTime, 0);
  objc_storeStrong((id *)&self->_defaultDuration, 0);
  objc_storeStrong((id *)&self->_maxDuration, 0);
  objc_storeStrong((id *)&self->_minDuration, 0);
}

@end
