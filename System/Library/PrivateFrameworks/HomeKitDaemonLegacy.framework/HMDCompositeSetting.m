@implementation HMDCompositeSetting

- (HMDCompositeSetting)initWithReadVersion:(id)a3 writeVersion:(id)a4
{
  id v6;
  id v7;
  HMDCompositeSetting *v8;
  uint64_t v9;
  HMFVersion *readVersion;
  uint64_t v11;
  HMFVersion *writeVersion;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCompositeSetting;
  v8 = -[HMDCompositeSetting init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v6);
    readVersion = v8->_readVersion;
    v8->_readVersion = (HMFVersion *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v7);
    writeVersion = v8->_writeVersion;
    v8->_writeVersion = (HMFVersion *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMDCompositeSetting *v4;
  HMDCompositeSetting *v5;
  HMDCompositeSetting *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDCompositeSetting *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    -[HMDCompositeSetting readVersion](v6, "readVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCompositeSetting readVersion](self, "readVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToVersion:", v8))
    {
      -[HMDCompositeSetting writeVersion](v6, "writeVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCompositeSetting writeVersion](self, "writeVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToVersion:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCompositeSetting readVersion](self, "readVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("readVersion"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCompositeSetting writeVersion](self, "writeVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("writeVersion"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqualValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMFVersion)readVersion
{
  return (HMFVersion *)objc_getProperty(self, a2, 8, 1);
}

- (HMFVersion)writeVersion
{
  return (HMFVersion *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeVersion, 0);
  objc_storeStrong((id *)&self->_readVersion, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_27319 != -1)
    dispatch_once(&logCategory__hmf_once_t1_27319, &__block_literal_global_27320);
  return (id)logCategory__hmf_once_v2_27321;
}

void __34__HMDCompositeSetting_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_27321;
  logCategory__hmf_once_v2_27321 = v0;

}

@end
