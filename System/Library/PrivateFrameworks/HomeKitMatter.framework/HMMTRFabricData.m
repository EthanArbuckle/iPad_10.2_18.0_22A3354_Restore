@implementation HMMTRFabricData

- (HMMTRFabricData)initWithFabric:(id)a3
{
  id v4;
  HMMTRFabricData *v5;
  HMMTRFabricData *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMMTRFabricData;
  v5 = -[HMMTRFabricData init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_fabric, v4);

  return v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRFabricData fabric](self, "fabric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fabricID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricData fabric](self, "fabric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fabricID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Fabric ID"), v6);
  objc_msgSend(v3, "addObject:", v7);

  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRFabricData residentNodeID](self, "residentNodeID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Resident Node ID"), v9);
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (NSData)rootCert
{
  return self->_rootCert;
}

- (void)setRootCert:(id)a3
{
  objc_storeStrong((id *)&self->_rootCert, a3);
}

- (NSNumber)residentNodeID
{
  return self->_residentNodeID;
}

- (void)setResidentNodeID:(id)a3
{
  objc_storeStrong((id *)&self->_residentNodeID, a3);
}

- (NSData)ipk
{
  return self->_ipk;
}

- (void)setIpk:(id)a3
{
  objc_storeStrong((id *)&self->_ipk, a3);
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
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_residentNodeID, 0);
  objc_storeStrong((id *)&self->_rootCert, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1)
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global);
  return (id)logCategory__hmf_once_v1;
}

void __30__HMMTRFabricData_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1;
  logCategory__hmf_once_v1 = v0;

}

@end
