@implementation MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct

- (MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct)init
{
  MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct *v2;
  MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct *v3;
  NSNumber *rangeMin;
  NSNumber *rangeMax;
  NSNumber *percentMax;
  NSNumber *percentMin;
  NSNumber *percentTypical;
  NSNumber *fixedMax;
  NSNumber *fixedMin;
  NSNumber *fixedTypical;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct;
  v2 = -[MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    rangeMin = v2->_rangeMin;
    v2->_rangeMin = (NSNumber *)&unk_250591B18;

    rangeMax = v3->_rangeMax;
    v3->_rangeMax = (NSNumber *)&unk_250591B18;

    percentMax = v3->_percentMax;
    v3->_percentMax = 0;

    percentMin = v3->_percentMin;
    v3->_percentMin = 0;

    percentTypical = v3->_percentTypical;
    v3->_percentTypical = 0;

    fixedMax = v3->_fixedMax;
    v3->_fixedMax = 0;

    fixedMin = v3->_fixedMin;
    v3->_fixedMin = 0;

    fixedTypical = v3->_fixedTypical;
    v3->_fixedTypical = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct *v4;
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

  v4 = objc_alloc_init(MTRElectricalPowerMeasurementClusterMeasurementAccuracyRangeStruct);
  objc_msgSend_rangeMin(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRangeMin_(v4, v8, (uint64_t)v7);

  objc_msgSend_rangeMax(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRangeMax_(v4, v12, (uint64_t)v11);

  objc_msgSend_percentMax(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPercentMax_(v4, v16, (uint64_t)v15);

  objc_msgSend_percentMin(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPercentMin_(v4, v20, (uint64_t)v19);

  objc_msgSend_percentTypical(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPercentTypical_(v4, v24, (uint64_t)v23);

  objc_msgSend_fixedMax(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFixedMax_(v4, v28, (uint64_t)v27);

  objc_msgSend_fixedMin(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFixedMin_(v4, v32, (uint64_t)v31);

  objc_msgSend_fixedTypical(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFixedTypical_(v4, v36, (uint64_t)v35);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: rangeMin:%@; rangeMax:%@; percentMax:%@; percentMin:%@; percentTypical:%@; fixedMax:%@; fixedMin:%@; fixedTypical:%@; >"),
    v5,
    self->_rangeMin,
    self->_rangeMax,
    self->_percentMax,
    self->_percentMin,
    self->_percentTypical,
    self->_fixedMax,
    self->_fixedMin,
    self->_fixedTypical);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)rangeMin
{
  return self->_rangeMin;
}

- (void)setRangeMin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)rangeMax
{
  return self->_rangeMax;
}

- (void)setRangeMax:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)percentMax
{
  return self->_percentMax;
}

- (void)setPercentMax:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)percentMin
{
  return self->_percentMin;
}

- (void)setPercentMin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)percentTypical
{
  return self->_percentTypical;
}

- (void)setPercentTypical:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)fixedMax
{
  return self->_fixedMax;
}

- (void)setFixedMax:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)fixedMin
{
  return self->_fixedMin;
}

- (void)setFixedMin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)fixedTypical
{
  return self->_fixedTypical;
}

- (void)setFixedTypical:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedTypical, 0);
  objc_storeStrong((id *)&self->_fixedMin, 0);
  objc_storeStrong((id *)&self->_fixedMax, 0);
  objc_storeStrong((id *)&self->_percentTypical, 0);
  objc_storeStrong((id *)&self->_percentMin, 0);
  objc_storeStrong((id *)&self->_percentMax, 0);
  objc_storeStrong((id *)&self->_rangeMax, 0);
  objc_storeStrong((id *)&self->_rangeMin, 0);
}

@end
