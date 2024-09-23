@implementation HMDAddAccessoryProgressState

- (HMDAddAccessoryProgressState)initWithUUID:(id)a3 accessoryName:(id)a4 manufacturerName:(id)a5 category:(id)a6 certificationStatus:(unint64_t)a7 productData:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDAddAccessoryProgressState *v18;
  HMDAddAccessoryProgressState *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDAddAccessoryProgressState;
  v18 = -[HMDAddAccessoryProgressState init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessoryUUID, a3);
    objc_storeStrong((id *)&v19->_accessoryName, a4);
    objc_storeStrong((id *)&v19->_manufacturerName, a5);
    objc_storeStrong((id *)&v19->_category, a6);
    v19->_certificationStatus = a7;
    objc_storeStrong((id *)&v19->_productData, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAddAccessoryProgressState accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAddAccessoryProgressState accessoryName](self, "accessoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAddAccessoryProgressState manufacturerName](self, "manufacturerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HMDAddAccessoryProgressState - uuid: %@, name: %@, mfg: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (HMAccessoryCategory)category
{
  return self->_category;
}

- (unint64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (NSString)productData
{
  return self->_productData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
