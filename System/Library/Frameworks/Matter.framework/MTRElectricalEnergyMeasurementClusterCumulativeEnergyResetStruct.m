@implementation MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct

- (MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct)init
{
  MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct *v2;
  MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct *v3;
  NSNumber *importedResetTimestamp;
  NSNumber *exportedResetTimestamp;
  NSNumber *importedResetSystime;
  NSNumber *exportedResetSystime;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct;
  v2 = -[MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    importedResetTimestamp = v2->_importedResetTimestamp;
    v2->_importedResetTimestamp = 0;

    exportedResetTimestamp = v3->_exportedResetTimestamp;
    v3->_exportedResetTimestamp = 0;

    importedResetSystime = v3->_importedResetSystime;
    v3->_importedResetSystime = 0;

    exportedResetSystime = v3->_exportedResetSystime;
    v3->_exportedResetSystime = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct *v4;
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

  v4 = objc_alloc_init(MTRElectricalEnergyMeasurementClusterCumulativeEnergyResetStruct);
  objc_msgSend_importedResetTimestamp(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImportedResetTimestamp_(v4, v8, (uint64_t)v7);

  objc_msgSend_exportedResetTimestamp(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedResetTimestamp_(v4, v12, (uint64_t)v11);

  objc_msgSend_importedResetSystime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImportedResetSystime_(v4, v16, (uint64_t)v15);

  objc_msgSend_exportedResetSystime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedResetSystime_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: importedResetTimestamp:%@; exportedResetTimestamp:%@; importedResetSystime:%@; exportedResetSystime:%@; >"),
    v5,
    self->_importedResetTimestamp,
    self->_exportedResetTimestamp,
    self->_importedResetSystime,
    self->_exportedResetSystime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)importedResetTimestamp
{
  return self->_importedResetTimestamp;
}

- (void)setImportedResetTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)exportedResetTimestamp
{
  return self->_exportedResetTimestamp;
}

- (void)setExportedResetTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)importedResetSystime
{
  return self->_importedResetSystime;
}

- (void)setImportedResetSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)exportedResetSystime
{
  return self->_exportedResetSystime;
}

- (void)setExportedResetSystime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedResetSystime, 0);
  objc_storeStrong((id *)&self->_importedResetSystime, 0);
  objc_storeStrong((id *)&self->_exportedResetTimestamp, 0);
  objc_storeStrong((id *)&self->_importedResetTimestamp, 0);
}

@end
