@implementation HMDMatterAccessory

- (HMDMatterAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  HMDMatterAccessory *v11;
  uint64_t v12;
  HMDMatterAccessoryProtocol *matterAdapter;
  HMDMatterAccessory *v14;
  HMDMatterAccessory *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDMatterAccessory;
    v11 = -[HMDAccessory initWithTransaction:home:](&v20, sel_initWithTransaction_home_, v8, v7);
    if (v11)
    {
      +[HMDMatterAccessoryAdapter MatterAccessoryAdapterWithAccessory:accessoryModel:](HMDMatterAccessoryAdapter, "MatterAccessoryAdapterWithAccessory:accessoryModel:", v11, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      matterAdapter = v11->_matterAdapter;
      v11->_matterAdapter = (HMDMatterAccessoryProtocol *)v12;

    }
    v14 = v11;
    v15 = v14;
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize a matter accessory without a matter accessory model.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  if (v12
    && (-[HMDMatterAccessory matterAdapter](self, "matterAdapter"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    -[HMDMatterAccessory matterAdapter](self, "matterAdapter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addMatterPathModel:message:", v12, v10);

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDMatterAccessory;
    -[HMDAccessory transactionObjectUpdated:newValues:message:](&v15, sel_transactionObjectUpdated_newValues_message_, v8, v9, v10);
  }

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  if (v9
    && (-[HMDMatterAccessory matterAdapter](self, "matterAdapter"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    -[HMDMatterAccessory matterAdapter](self, "matterAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeMatterPathModel:message:", v9, v7);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDMatterAccessory;
    -[HMDAccessory transactionObjectRemoved:message:](&v12, sel_transactionObjectRemoved_message_, v6, v7);
  }

}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  HMDHAPAccessoryTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHAPAccessoryTransaction *v9;

  v5 = [HMDHAPAccessoryTransaction alloc];
  -[HMDAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessory home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return -[HMDMatterAccessory modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", a3, 4);
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v6;

  -[HMDMatterAccessory transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterAccessory populateModelObject:version:](self, "populateModelObject:version:", v6, a4);
  return v6;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v8;
  else
    v5 = 0;
  v6 = v5;
  -[HMDMatterAccessory matterAdapter](self, "matterAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "populateAccessoryModel:", v6);

}

- (HMMTRAccessoryServer)accessoryServer
{
  return self->_accessoryServer;
}

- (void)setAccessoryServer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryServer, a3);
}

- (HMDMatterAccessoryProtocol)matterAdapter
{
  return self->_matterAdapter;
}

- (void)setMatterAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_matterAdapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterAdapter, 0);
  objc_storeStrong((id *)&self->_accessoryServer, 0);
}

@end
