@implementation HMMTRControllerData

- (HMMTRControllerData)initWithFabric:(id)a3
{
  id v4;
  HMMTRControllerData *v5;
  HMMTRControllerData *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMMTRControllerData;
  v5 = -[HMMTRControllerData init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_fabric, v4);

  return v6;
}

- (void)setOperationalCertificate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  NSNumber *nodeID;
  void *v14;
  void *v15;
  HMMTRDeviceControllerStorageDataSource *v16;
  HMMTRDeviceControllerStorageDataSource *privateDataSource;
  NSNumber *v18;
  NSData *operationalCertificate;
  HMMTRDeviceControllerStorageDataSource *v20;
  void *v21;
  HMMTRControllerData *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDDB5B0], "convertX509Certificate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB5A8]), "initWithTLVBytes:", v6);
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "subject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "nodeID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "subject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "nodeID");
          v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          nodeID = self->_nodeID;
          self->_nodeID = v12;

          objc_storeStrong((id *)&self->_operationalCertificate, a3);
          -[HMMTRControllerData fabric](self, "fabric");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "privateDataSourceForNode:", self->_nodeID);
          v16 = (HMMTRDeviceControllerStorageDataSource *)objc_claimAutoreleasedReturnValue();
          privateDataSource = self->_privateDataSource;
          self->_privateDataSource = v16;

        }
      }

    }
    else
    {
      v21 = (void *)MEMORY[0x242656984]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@Couldn't convert NOC to Matter format", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
  else
  {
    v18 = self->_nodeID;
    self->_nodeID = 0;

    operationalCertificate = self->_operationalCertificate;
    self->_operationalCertificate = 0;

    v20 = self->_privateDataSource;
    self->_privateDataSource = 0;

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRControllerData nodeID](self, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRControllerData nodeID](self, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Controller Node ID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (NSData)operationalCertificate
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
  objc_storeStrong((id *)&self->_nodeID, a3);
}

- (HMMTRDeviceControllerStorageDataSource)privateDataSource
{
  return self->_privateDataSource;
}

- (void)setPrivateDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataSource, a3);
}

- (HMMTRFabric)fabric
{
  return (HMMTRFabric *)objc_loadWeakRetained((id *)&self->_fabric);
}

- (void)setFabric:(id)a3
{
  objc_storeWeak((id *)&self->_fabric, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fabric);
  objc_storeStrong((id *)&self->_privateDataSource, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1)
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_1518);
  return (id)logCategory__hmf_once_v2;
}

void __34__HMMTRControllerData_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2;
  logCategory__hmf_once_v2 = v0;

}

@end
