@implementation MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct

- (MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct)init
{
  MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct *v2;
  MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct *v3;
  NSNumber *measurementType;
  NSNumber *measured;
  NSNumber *minMeasuredValue;
  NSNumber *maxMeasuredValue;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *accuracyRanges;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct;
  v2 = -[MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    measurementType = v2->_measurementType;
    v2->_measurementType = (NSNumber *)&unk_250591B18;

    measured = v3->_measured;
    v3->_measured = (NSNumber *)&unk_250591B18;

    minMeasuredValue = v3->_minMeasuredValue;
    v3->_minMeasuredValue = (NSNumber *)&unk_250591B18;

    maxMeasuredValue = v3->_maxMeasuredValue;
    v3->_maxMeasuredValue = (NSNumber *)&unk_250591B18;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    accuracyRanges = v3->_accuracyRanges;
    v3->_accuracyRanges = (NSArray *)v10;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct *v4;
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

  v4 = objc_alloc_init(MTRElectricalPowerMeasurementClusterMeasurementAccuracyStruct);
  objc_msgSend_measurementType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMeasurementType_(v4, v8, (uint64_t)v7);

  objc_msgSend_measured(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMeasured_(v4, v12, (uint64_t)v11);

  objc_msgSend_minMeasuredValue(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinMeasuredValue_(v4, v16, (uint64_t)v15);

  objc_msgSend_maxMeasuredValue(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxMeasuredValue_(v4, v20, (uint64_t)v19);

  objc_msgSend_accuracyRanges(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccuracyRanges_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: measurementType:%@; measured:%@; minMeasuredValue:%@; maxMeasuredValue:%@; accuracyRanges:%@; >"),
    v5,
    self->_measurementType,
    self->_measured,
    self->_minMeasuredValue,
    self->_maxMeasuredValue,
    self->_accuracyRanges);
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

- (NSNumber)measured
{
  return self->_measured;
}

- (void)setMeasured:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)minMeasuredValue
{
  return self->_minMeasuredValue;
}

- (void)setMinMeasuredValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)maxMeasuredValue
{
  return self->_maxMeasuredValue;
}

- (void)setMaxMeasuredValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)accuracyRanges
{
  return self->_accuracyRanges;
}

- (void)setAccuracyRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accuracyRanges, 0);
  objc_storeStrong((id *)&self->_maxMeasuredValue, 0);
  objc_storeStrong((id *)&self->_minMeasuredValue, 0);
  objc_storeStrong((id *)&self->_measured, 0);
  objc_storeStrong((id *)&self->_measurementType, 0);
}

@end
