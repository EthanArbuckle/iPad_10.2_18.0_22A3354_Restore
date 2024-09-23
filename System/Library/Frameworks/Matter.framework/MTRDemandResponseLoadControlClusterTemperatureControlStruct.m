@implementation MTRDemandResponseLoadControlClusterTemperatureControlStruct

- (MTRDemandResponseLoadControlClusterTemperatureControlStruct)init
{
  MTRDemandResponseLoadControlClusterTemperatureControlStruct *v2;
  MTRDemandResponseLoadControlClusterTemperatureControlStruct *v3;
  NSNumber *coolingTempOffset;
  NSNumber *heatingtTempOffset;
  NSNumber *coolingTempSetpoint;
  NSNumber *heatingTempSetpoint;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRDemandResponseLoadControlClusterTemperatureControlStruct;
  v2 = -[MTRDemandResponseLoadControlClusterTemperatureControlStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    coolingTempOffset = v2->_coolingTempOffset;
    v2->_coolingTempOffset = 0;

    heatingtTempOffset = v3->_heatingtTempOffset;
    v3->_heatingtTempOffset = 0;

    coolingTempSetpoint = v3->_coolingTempSetpoint;
    v3->_coolingTempSetpoint = 0;

    heatingTempSetpoint = v3->_heatingTempSetpoint;
    v3->_heatingTempSetpoint = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterTemperatureControlStruct *v4;
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

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterTemperatureControlStruct);
  objc_msgSend_coolingTempOffset(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCoolingTempOffset_(v4, v8, (uint64_t)v7);

  objc_msgSend_heatingtTempOffset(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeatingtTempOffset_(v4, v12, (uint64_t)v11);

  objc_msgSend_coolingTempSetpoint(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCoolingTempSetpoint_(v4, v16, (uint64_t)v15);

  objc_msgSend_heatingTempSetpoint(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeatingTempSetpoint_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: coolingTempOffset:%@; heatingtTempOffset:%@; coolingTempSetpoint:%@; heatingTempSetpoint:%@; >"),
    v5,
    self->_coolingTempOffset,
    self->_heatingtTempOffset,
    self->_coolingTempSetpoint,
    self->_heatingTempSetpoint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)coolingTempOffset
{
  return self->_coolingTempOffset;
}

- (void)setCoolingTempOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)heatingtTempOffset
{
  return self->_heatingtTempOffset;
}

- (void)setHeatingtTempOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)coolingTempSetpoint
{
  return self->_coolingTempSetpoint;
}

- (void)setCoolingTempSetpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)heatingTempSetpoint
{
  return self->_heatingTempSetpoint;
}

- (void)setHeatingTempSetpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatingTempSetpoint, 0);
  objc_storeStrong((id *)&self->_coolingTempSetpoint, 0);
  objc_storeStrong((id *)&self->_heatingtTempOffset, 0);
  objc_storeStrong((id *)&self->_coolingTempOffset, 0);
}

@end
