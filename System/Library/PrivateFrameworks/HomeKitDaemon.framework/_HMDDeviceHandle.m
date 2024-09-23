@implementation _HMDDeviceHandle

- (_HMDDeviceHandle)init
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

- (NSString)destination
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HMDDeviceHandle)initWithDestination:(id)a3
{
  id v4;
  _HMDDeviceHandle *v5;
  SEL v6;
  id v7;

  v4 = a3;
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  v5 = (_HMDDeviceHandle *)_HMFPreconditionFailureWithFormat();
  return -[_HMDDeviceHandle initWithIdentifier:](v5, v6, v7);
}

- (_HMDDeviceHandle)initWithIdentifier:(id)a3
{
  id v4;
  _HMDDeviceHandle *v5;
  uint64_t v6;
  NSUUID *identifier;
  _HMDDeviceHandle *v8;
  _HMDDeviceHandle *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)_HMDDeviceHandle;
    v5 = -[_HMDDeviceHandle init](&v14, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

    }
    v8 = v5;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing required parameter 'identifier'", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isGlobal
{
  return 0;
}

- (HMDAccountHandle)accountHandle
{
  return 0;
}

- (_HMDDeviceHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _HMDDeviceHandle *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_HMDDeviceHandle initWithIdentifier:](self, "initWithIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HMDDeviceHandle identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)isValidDestination:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (NSUUID)identifierNamespace
{
  if (identifierNamespace_onceToken != -1)
    dispatch_once(&identifierNamespace_onceToken, &__block_literal_global_33666);
  return (NSUUID *)(id)identifierNamespace_namespace;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
