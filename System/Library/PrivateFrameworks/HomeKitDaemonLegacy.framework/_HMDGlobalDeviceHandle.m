@implementation _HMDGlobalDeviceHandle

- (_HMDGlobalDeviceHandle)initWithPushToken:(id)a3 accountHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _HMDGlobalDeviceHandle *v12;
  _HMDGlobalDeviceHandle *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "URI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prefixedURI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17B908C](v6, v10);

    v12 = -[_HMDGlobalDeviceHandle initWithDestination:](self, "initWithDestination:", v11);
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Missing push token parameter", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (_HMDGlobalDeviceHandle)initWithDestination:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _HMDGlobalDeviceHandle *v11;
  uint64_t v12;
  NSData *pushToken;
  uint64_t v14;
  HMDAccountHandle *accountHandle;
  _HMDGlobalDeviceHandle *v16;
  _HMDGlobalDeviceHandle *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_super v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v28 = 0;
    v29 = 0;
    v26 = 0;
    v27 = 0;
    v6 = __parseGlobalDestination(v4, &v29, &v28, &v27, &v26);
    v7 = v29;
    v8 = v28;
    v9 = v27;
    v10 = v26;
    if ((v6 & 1) != 0)
    {
      v25.receiver = self;
      v25.super_class = (Class)_HMDGlobalDeviceHandle;
      v11 = -[_HMDDeviceHandle initWithIdentifier:](&v25, sel_initWithIdentifier_, v7);
      if (v11)
      {
        v12 = objc_msgSend(v8, "copy");
        pushToken = v11->_pushToken;
        v11->_pushToken = (NSData *)v12;

        v14 = objc_msgSend(v9, "copy");
        accountHandle = v11->_accountHandle;
        v11->_accountHandle = (HMDAccountHandle *)v14;

      }
      v16 = v11;
      v17 = v16;
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        v32 = 2112;
        v33 = v5;
        v34 = 2112;
        v35 = v10;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse destination, %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      v17 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Missing destination parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMDGlobalDeviceHandle pushToken](self, "pushToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _HMDGlobalDeviceHandle *v4;
  _HMDGlobalDeviceHandle *v5;
  _HMDGlobalDeviceHandle *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMDGlobalDeviceHandle *)a3;
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
      -[_HMDGlobalDeviceHandle pushToken](self, "pushToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDGlobalDeviceHandle pushToken](v6, "pushToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToData:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_HMDGlobalDeviceHandle pushToken](self, "pushToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_hexadecimalStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)privateDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMDGlobalDeviceHandle description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateStringForObjectValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isGlobal
{
  return 1;
}

- (id)destination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_HMDGlobalDeviceHandle pushToken](self, "pushToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMDGlobalDeviceHandle accountHandle](self, "accountHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prefixedURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17B908C](v3, v6);

  return v7;
}

- (_HMDGlobalDeviceHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _HMDGlobalDeviceHandle *v6;
  _HMDGlobalDeviceHandle *v7;
  uint64_t v8;
  HMDAccountHandle *accountHandle;
  _HMDGlobalDeviceHandle *v10;
  _HMDGlobalDeviceHandle *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.token"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)_HMDGlobalDeviceHandle;
    v6 = -[_HMDDeviceHandle initWithCoder:](&v16, sel_initWithCoder_, v4);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_pushToken, v5);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.account"));
      v8 = objc_claimAutoreleasedReturnValue();
      accountHandle = v7->_accountHandle;
      v7->_accountHandle = (HMDAccountHandle *)v8;

    }
    v10 = v7;
    v11 = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = CFSTR("HM.token");
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing required object for key '%@'", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HMDGlobalDeviceHandle;
  v4 = a3;
  -[_HMDDeviceHandle encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[_HMDGlobalDeviceHandle pushToken](self, "pushToken", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.token"));

  -[_HMDGlobalDeviceHandle accountHandle](self, "accountHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.account"));

}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
}

+ (BOOL)isValidDestination:(id)a3
{
  return __parseGlobalDestination(a3, 0, 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
