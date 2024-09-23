@implementation HMDRPIdentity

- (HMDRPIdentity)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDRPIdentity)initWithDeviceIRK:(id)a3
{
  id v4;
  HMDRPIdentity *v5;
  uint64_t v6;
  HMFKey *deviceIRK;
  HMDRPIdentity *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDRPIdentity;
    v5 = -[HMDRPIdentity init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      deviceIRK = v5->_deviceIRK;
      v5->_deviceIRK = (HMFKey *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDRPIdentity deviceIRK](self, "deviceIRK");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDRPIdentity *v4;
  HMDRPIdentity *v5;
  HMDRPIdentity *v6;
  HMDRPIdentity *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDRPIdentity *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      -[HMDRPIdentity deviceIRK](v6, "deviceIRK");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRPIdentity deviceIRK](self, "deviceIRK");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = HMFEqualObjects();

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (BOOL)isEqualToRPIndentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDRPIdentity deviceIRK](self, "deviceIRK");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceIRKData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToData:", v6);
  return (char)v4;
}

- (id)logIdentifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (HMDRPIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDRPIdentity *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD5B38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDRPIdentity initWithDeviceIRK:](self, "initWithDeviceIRK:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDRPIdentity deviceIRK](self, "deviceIRK");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD5B38]);

}

- (HMFKey)deviceIRK
{
  return (HMFKey *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIRK, 0);
}

+ (HMDRPIdentity)identityWithRPIdentity:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BE3F190];
    v4 = a3;
    v5 = [v3 alloc];
    v6 = *MEMORY[0x24BE3EBE8];
    v7 = *MEMORY[0x24BE3EBE0];
    objc_msgSend(v4, "deviceIRKData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v5, "initWithType:size:data:", v6, v7, v8);
    v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceIRK:", v9);

  }
  else
  {
    v10 = 0;
  }
  return (HMDRPIdentity *)v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_105591 != -1)
    dispatch_once(&logCategory__hmf_once_t1_105591, &__block_literal_global_105592);
  return (id)logCategory__hmf_once_v2_105593;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __28__HMDRPIdentity_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_105593;
  logCategory__hmf_once_v2_105593 = v0;

}

@end
