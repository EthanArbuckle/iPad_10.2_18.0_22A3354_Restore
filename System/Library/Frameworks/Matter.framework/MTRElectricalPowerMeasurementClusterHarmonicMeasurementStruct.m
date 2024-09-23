@implementation MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct

- (MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct)init
{
  MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct *v2;
  MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct *v3;
  NSNumber *order;
  NSNumber *measurement;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct;
  v2 = -[MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    order = v2->_order;
    v2->_order = (NSNumber *)&unk_250591B18;

    measurement = v3->_measurement;
    v3->_measurement = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRElectricalPowerMeasurementClusterHarmonicMeasurementStruct);
  objc_msgSend_order(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOrder_(v4, v8, (uint64_t)v7);

  objc_msgSend_measurement(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMeasurement_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: order:%@; measurement:%@; >"),
    v5,
    self->_order,
    self->_measurement);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)order
{
  return self->_order;
}

- (void)setOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_order, 0);
}

@end
