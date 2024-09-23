@implementation MTRElectricalPowerMeasurementClusterMeasurementRangeStruct

- (MTRElectricalPowerMeasurementClusterMeasurementRangeStruct)init
{
  MTRElectricalPowerMeasurementClusterMeasurementRangeStruct *v2;
  MTRElectricalPowerMeasurementClusterMeasurementRangeStruct *v3;
  NSNumber *measurementType;
  NSNumber *min;
  NSNumber *max;
  NSNumber *startTimestamp;
  NSNumber *endTimestamp;
  NSNumber *minTimestamp;
  NSNumber *maxTimestamp;
  NSNumber *startSystime;
  NSNumber *endSystime;
  NSNumber *minSystime;
  NSNumber *maxSystime;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTRElectricalPowerMeasurementClusterMeasurementRangeStruct;
  v2 = -[MTRElectricalPowerMeasurementClusterMeasurementRangeStruct init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    measurementType = v2->_measurementType;
    v2->_measurementType = (NSNumber *)&unk_250591B18;

    min = v3->_min;
    v3->_min = (NSNumber *)&unk_250591B18;

    max = v3->_max;
    v3->_max = (NSNumber *)&unk_250591B18;

    startTimestamp = v3->_startTimestamp;
    v3->_startTimestamp = 0;

    endTimestamp = v3->_endTimestamp;
    v3->_endTimestamp = 0;

    minTimestamp = v3->_minTimestamp;
    v3->_minTimestamp = 0;

    maxTimestamp = v3->_maxTimestamp;
    v3->_maxTimestamp = 0;

    startSystime = v3->_startSystime;
    v3->_startSystime = 0;

    endSystime = v3->_endSystime;
    v3->_endSystime = 0;

    minSystime = v3->_minSystime;
    v3->_minSystime = 0;

    maxSystime = v3->_maxSystime;
    v3->_maxSystime = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalPowerMeasurementClusterMeasurementRangeStruct *v4;
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

  v4 = objc_alloc_init(MTRElectricalPowerMeasurementClusterMeasurementRangeStruct);
  objc_msgSend_measurementType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMeasurementType_(v4, v8, (uint64_t)v7);

  objc_msgSend_min(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMin_(v4, v12, (uint64_t)v11);

  objc_msgSend_max(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMax_(v4, v16, (uint64_t)v15);

  objc_msgSend_startTimestamp(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTimestamp_(v4, v20, (uint64_t)v19);

  objc_msgSend_endTimestamp(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndTimestamp_(v4, v24, (uint64_t)v23);

  objc_msgSend_minTimestamp(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinTimestamp_(v4, v28, (uint64_t)v27);

  objc_msgSend_maxTimestamp(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxTimestamp_(v4, v32, (uint64_t)v31);

  objc_msgSend_startSystime(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartSystime_(v4, v36, (uint64_t)v35);

  objc_msgSend_endSystime(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEndSystime_(v4, v40, (uint64_t)v39);

  objc_msgSend_minSystime(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinSystime_(v4, v44, (uint64_t)v43);

  objc_msgSend_maxSystime(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxSystime_(v4, v48, (uint64_t)v47);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: measurementType:%@; min:%@; max:%@; startTimestamp:%@; endTimestamp:%@; minTimestamp:%@; maxTimestamp:%@; startSystime:%@; endSystime:%@; minSystime:%@; maxSystime:%@; >"),
    v5,
    self->_measurementType,
    self->_min,
    self->_max,
    self->_startTimestamp,
    self->_endTimestamp,
    self->_minTimestamp,
    self->_maxTimestamp,
    self->_startSystime,
    self->_endSystime,
    self->_minSystime,
    self->_maxSystime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)measurementType
{
  return self->_measurementType;
}

- (void)setMeasurementType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)min
{
  return self->_min;
}

- (void)setMin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)endTimestamp
{
  return self->_endTimestamp;
}

- (void)setEndTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)minTimestamp
{
  return self->_minTimestamp;
}

- (void)setMinTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)maxTimestamp
{
  return self->_maxTimestamp;
}

- (void)setMaxTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)startSystime
{
  return self->_startSystime;
}

- (void)setStartSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)endSystime
{
  return self->_endSystime;
}

- (void)setEndSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)minSystime
{
  return self->_minSystime;
}

- (void)setMinSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)maxSystime
{
  return self->_maxSystime;
}

- (void)setMaxSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSystime, 0);
  objc_storeStrong((id *)&self->_minSystime, 0);
  objc_storeStrong((id *)&self->_endSystime, 0);
  objc_storeStrong((id *)&self->_startSystime, 0);
  objc_storeStrong((id *)&self->_maxTimestamp, 0);
  objc_storeStrong((id *)&self->_minTimestamp, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
  objc_storeStrong((id *)&self->_measurementType, 0);
}

@end
