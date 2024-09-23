@implementation MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent

- (MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent)init
{
  const char *v2;
  uint64_t v3;
  MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent *v4;
  uint64_t v5;
  NSArray *ranges;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent;
  v4 = -[MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    ranges = v4->_ranges;
    v4->_ranges = (NSArray *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRElectricalPowerMeasurementClusterMeasurementPeriodRangesEvent);
  objc_msgSend_ranges(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRanges_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: ranges:%@; >"), v5, self->_ranges);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
}

@end
