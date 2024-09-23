@implementation MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent

- (MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent)init
{
  MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent *v2;
  MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent *v3;
  MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct *energyImported;
  MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct *energyExported;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent;
  v2 = -[MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    energyImported = v2->_energyImported;
    v2->_energyImported = 0;

    energyExported = v3->_energyExported;
    v3->_energyExported = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterPeriodicEnergyMeasuredEvent);
  objc_msgSend_energyImported(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnergyImported_(v4, v8, (uint64_t)v7);

  objc_msgSend_energyExported(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnergyExported_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: energyImported:%@; energyExported:%@; >"),
    v5,
    self->_energyImported,
    self->_energyExported);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)energyImported
{
  return self->_energyImported;
}

- (void)setEnergyImported:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTRElectricalEnergyMeasurementClusterEnergyMeasurementStruct)energyExported
{
  return self->_energyExported;
}

- (void)setEnergyExported:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyExported, 0);
  objc_storeStrong((id *)&self->_energyImported, 0);
}

@end
