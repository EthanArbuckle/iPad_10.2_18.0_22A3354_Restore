@implementation MTRDeviceEnergyManagementClusterCostStruct

- (MTRDeviceEnergyManagementClusterCostStruct)init
{
  MTRDeviceEnergyManagementClusterCostStruct *v2;
  MTRDeviceEnergyManagementClusterCostStruct *v3;
  NSNumber *costType;
  NSNumber *value;
  NSNumber *decimalPoints;
  NSNumber *currency;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRDeviceEnergyManagementClusterCostStruct;
  v2 = -[MTRDeviceEnergyManagementClusterCostStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    costType = v2->_costType;
    v2->_costType = (NSNumber *)&unk_250591B18;

    value = v3->_value;
    v3->_value = (NSNumber *)&unk_250591B18;

    decimalPoints = v3->_decimalPoints;
    v3->_decimalPoints = (NSNumber *)&unk_250591B18;

    currency = v3->_currency;
    v3->_currency = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterCostStruct *v4;
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

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterCostStruct);
  objc_msgSend_costType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCostType_(v4, v8, (uint64_t)v7);

  objc_msgSend_value(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  objc_msgSend_decimalPoints(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDecimalPoints_(v4, v16, (uint64_t)v15);

  objc_msgSend_currency(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrency_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: costType:%@; value:%@; decimalPoints:%@; currency:%@; >"),
    v5,
    self->_costType,
    self->_value,
    self->_decimalPoints,
    self->_currency);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)costType
{
  return self->_costType;
}

- (void)setCostType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)decimalPoints
{
  return self->_decimalPoints;
}

- (void)setDecimalPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_decimalPoints, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_costType, 0);
}

@end
