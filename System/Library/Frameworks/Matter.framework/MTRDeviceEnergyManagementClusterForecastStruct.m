@implementation MTRDeviceEnergyManagementClusterForecastStruct

- (MTRDeviceEnergyManagementClusterForecastStruct)init
{
  MTRDeviceEnergyManagementClusterForecastStruct *v2;
  MTRDeviceEnergyManagementClusterForecastStruct *v3;
  NSNumber *forecastID;
  NSNumber *activeSlotNumber;
  NSNumber *startTime;
  NSNumber *endTime;
  NSNumber *earliestStartTime;
  NSNumber *latestEndTime;
  NSNumber *isPausable;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *slots;
  NSNumber *forecastUpdateReason;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRDeviceEnergyManagementClusterForecastStruct;
  v2 = -[MTRDeviceEnergyManagementClusterForecastStruct init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    forecastID = v2->_forecastID;
    v2->_forecastID = (NSNumber *)&unk_250591B18;

    activeSlotNumber = v3->_activeSlotNumber;
    v3->_activeSlotNumber = 0;

    startTime = v3->_startTime;
    v3->_startTime = (NSNumber *)&unk_250591B18;

    endTime = v3->_endTime;
    v3->_endTime = (NSNumber *)&unk_250591B18;

    earliestStartTime = v3->_earliestStartTime;
    v3->_earliestStartTime = 0;

    latestEndTime = v3->_latestEndTime;
    v3->_latestEndTime = 0;

    isPausable = v3->_isPausable;
    v3->_isPausable = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    slots = v3->_slots;
    v3->_slots = (NSArray *)v13;

    forecastUpdateReason = v3->_forecastUpdateReason;
    v3->_forecastUpdateReason = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterForecastStruct *v4;
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

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterForecastStruct);
  objc_msgSend_forecastID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setForecastID_(v4, v8, (uint64_t)v7);

  objc_msgSend_activeSlotNumber(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActiveSlotNumber_(v4, v12, (uint64_t)v11);

  objc_msgSend_startTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v16, (uint64_t)v15);

  objc_msgSend_endTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_earliestStartTime(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEarliestStartTime_(v4, v24, (uint64_t)v23);

  objc_msgSend_latestEndTime(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLatestEndTime_(v4, v28, (uint64_t)v27);

  objc_msgSend_isPausable(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIsPausable_(v4, v32, (uint64_t)v31);

  objc_msgSend_slots(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSlots_(v4, v36, (uint64_t)v35);

  objc_msgSend_forecastUpdateReason(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setForecastUpdateReason_(v4, v40, (uint64_t)v39);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: forecastID:%@; activeSlotNumber:%@; startTime:%@; endTime:%@; earliestStartTime:%@; latestEndTime:%@; isPausable:%@; slots:%@; forecastUpdateReason:%@; >"),
    v5,
    self->_forecastID,
    self->_activeSlotNumber,
    self->_startTime,
    self->_endTime,
    self->_earliestStartTime,
    self->_latestEndTime,
    self->_isPausable,
    self->_slots,
    self->_forecastUpdateReason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)forecastID
{
  return self->_forecastID;
}

- (void)setForecastID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)activeSlotNumber
{
  return self->_activeSlotNumber;
}

- (void)setActiveSlotNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)earliestStartTime
{
  return self->_earliestStartTime;
}

- (void)setEarliestStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)latestEndTime
{
  return self->_latestEndTime;
}

- (void)setLatestEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)isPausable
{
  return self->_isPausable;
}

- (void)setIsPausable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)slots
{
  return self->_slots;
}

- (void)setSlots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)forecastUpdateReason
{
  return self->_forecastUpdateReason;
}

- (void)setForecastUpdateReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecastUpdateReason, 0);
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_isPausable, 0);
  objc_storeStrong((id *)&self->_latestEndTime, 0);
  objc_storeStrong((id *)&self->_earliestStartTime, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_activeSlotNumber, 0);
  objc_storeStrong((id *)&self->_forecastID, 0);
}

@end
