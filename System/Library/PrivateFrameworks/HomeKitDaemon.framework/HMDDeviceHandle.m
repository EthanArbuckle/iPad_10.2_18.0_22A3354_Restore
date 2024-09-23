@implementation HMDDeviceHandle

void __39___HMDDeviceHandle_identifierNamespace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("A08F6CA5-EC1E-4DD6-A068-377BA45247B6"));
  v1 = (void *)identifierNamespace_namespace;
  identifierNamespace_namespace = v0;

}

- (HMDDeviceHandle)init
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

- (HMDDeviceHandle)initWithInternal:(id)a3
{
  id v4;
  HMDDeviceHandle *v5;
  uint64_t v6;
  _HMDDeviceHandle *internal;
  HMDDeviceHandle *v8;
  HMDDeviceHandle *v9;
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
    v14.super_class = (Class)HMDDeviceHandle;
    v5 = -[HMDDeviceHandle init](&v14, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      internal = v5->_internal;
      v5->_internal = (_HMDDeviceHandle *)v6;

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
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing internal parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDDeviceHandle internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDDeviceHandle *v4;
  HMDDeviceHandle *v5;
  HMDDeviceHandle *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDDeviceHandle *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDDeviceHandle internal](self, "internal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceHandle internal](v6, "internal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceHandle identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceHandle identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v5);
  v18[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  if (-[HMDDeviceHandle isGlobal](self, "isGlobal"))
    v8 = CFSTR("Global");
  else
    v8 = CFSTR("Local");
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Type"), v8);
  v18[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceHandle internal](self, "internal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Value"), v11);
  v18[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceHandle accountHandle](self, "accountHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:options:formatter:", CFSTR("Account Handle"), v14, 1, 0);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMDDeviceHandle internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isLocal
{
  void *v2;
  char v3;

  -[HMDDeviceHandle internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocal");

  return v3;
}

- (BOOL)isGlobal
{
  void *v2;
  char v3;

  -[HMDDeviceHandle internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGlobal");

  return v3;
}

- (HMDAccountHandle)accountHandle
{
  void *v2;
  void *v3;

  -[HMDDeviceHandle internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAccountHandle *)v3;
}

- (NSString)destination
{
  void *v2;
  void *v3;

  -[HMDDeviceHandle internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)pushToken
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HMDDeviceHandle internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(v4, "pushToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (BOOL)matchesPushToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  v4 = a3;
  -[HMDDeviceHandle internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "pushToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToData:", v4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HMDDeviceHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDDeviceHandle *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDDeviceHandle initWithInternal:](self, "initWithInternal:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDDeviceHandle internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.internal"));

}

- (_HMDDeviceHandle)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

+ (id)deviceHandleForDestination:(id)a3
{
  id v4;
  void *v5;
  __objc2_class **v6;
  uint64_t v7;
  void *v8;
  HMDDeviceHandle *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v13;
      v14 = "%{public}@Invalid destination, nil";
      v15 = v12;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 12;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v15, v16, v14, (uint8_t *)&v19, v17);

    }
LABEL_12:

    objc_autoreleasePoolPop(v10);
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v5 = (void *)IDSCopyAddressDestinationForDestination();

  if (!v5)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v4;
      v14 = "%{public}@Invalid device destination: %@";
      v15 = v12;
      v16 = OS_LOG_TYPE_INFO;
      v17 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v6 = &off_24E763638;
  if (!+[_HMDLocalDeviceHandle isValidDestination:](_HMDLocalDeviceHandle, "isValidDestination:", v4))
  {
    v6 = off_24E763630;
    if (!+[_HMDGlobalDeviceHandle isValidDestination:](_HMDGlobalDeviceHandle, "isValidDestination:", v4))
      goto LABEL_13;
  }
  v7 = objc_msgSend(objc_alloc(*v6), "initWithDestination:", v4);
  if (!v7)
    goto LABEL_13;
  v8 = (void *)v7;
  v9 = -[HMDDeviceHandle initWithInternal:]([HMDDeviceHandle alloc], "initWithInternal:", v7);

LABEL_14:
  return v9;
}

+ (id)deviceHandleForDeviceIdentifier:(id)a3
{
  id v3;
  _HMDLocalDeviceHandle *v4;
  HMDDeviceHandle *v5;

  v3 = a3;
  v4 = -[_HMDLocalDeviceHandle initWithDeviceIdentifier:]([_HMDLocalDeviceHandle alloc], "initWithDeviceIdentifier:", v3);

  if (v4)
    v5 = -[HMDDeviceHandle initWithInternal:]([HMDDeviceHandle alloc], "initWithInternal:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
