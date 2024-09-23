@implementation HMDCharacteristicRequest

- (HMDCharacteristicRequest)initWithCharacteristic:(id)a3
{
  id v5;
  HMDCharacteristicRequest *v6;
  HMDCharacteristicRequest *v7;
  uint64_t v8;
  id previousValue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicRequest;
  v6 = -[HMDCharacteristicRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_characteristic, a3);
    objc_msgSend(v5, "value");
    v8 = objc_claimAutoreleasedReturnValue();
    previousValue = v7->_previousValue;
    v7->_previousValue = (id)v8;

  }
  return v7;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[7];

  v39[5] = *MEMORY[0x24BDAC8D0];
  -[HMDCharacteristicRequest characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristicRequest characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v38 = v4;
  objc_msgSend(v4, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("(%@/%@)"), v37, v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Accessory"), v35);
  v39[0] = v34;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  v10 = (void *)MEMORY[0x24BDD17C8];
  v33 = v6;
  objc_msgSend(v6, "type");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  shortHAPTypeDescription(v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@/%@)"), v31, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Service"), v29);
  v39[1] = v28;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCharacteristicRequest characteristic](self, "characteristic");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  shortHAPTypeDescription(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicRequest characteristic](self, "characteristic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "instanceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@/%@)"), v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Characteristic"), v17);
  v39[2] = v18;
  v19 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicRequest previousValue](self, "previousValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Previous Value"), v20);
  v39[3] = v21;
  v22 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCharacteristicRequest previousValue](self, "previousValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithName:value:", CFSTR("Type"), objc_opt_class());
  v39[4] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 5);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (HMDService)service
{
  void *v2;
  void *v3;

  -[HMDCharacteristicRequest characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDService *)v3;
}

- (HMDHAPAccessory)accessory
{
  void *v2;
  void *v3;

  -[HMDCharacteristicRequest characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHAPAccessory *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDCharacteristicRequest characteristic](self, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCharacteristicRequest characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMDCharacteristic)characteristic
{
  return self->_characteristic;
}

- (id)previousValue
{
  return self->_previousValue;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

+ (id)requestWithCharacteristic:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCharacteristic:", v4);

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_251746 != -1)
    dispatch_once(&logCategory__hmf_once_t1_251746, &__block_literal_global_251747);
  return (id)logCategory__hmf_once_v2_251748;
}

void __39__HMDCharacteristicRequest_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_251748;
  logCategory__hmf_once_v2_251748 = v0;

}

@end
