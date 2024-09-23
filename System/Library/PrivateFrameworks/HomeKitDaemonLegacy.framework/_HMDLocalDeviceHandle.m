@implementation _HMDLocalDeviceHandle

- (_HMDLocalDeviceHandle)initWithDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _HMDLocalDeviceHandle *v8;
  _HMDLocalDeviceHandle *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("device:"), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[_HMDLocalDeviceHandle initWithDestination:](self, "initWithDestination:", v7);
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing device identifier parameter", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (_HMDLocalDeviceHandle)initWithDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _HMDLocalDeviceHandle *v12;
  uint64_t v13;
  NSUUID *deviceIdentifier;
  _HMDLocalDeviceHandle *v15;
  _HMDLocalDeviceHandle *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_super v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v25 = 0;
    __parseLocalDestination(v4, &v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;
    if (v6)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
      +[_HMDDeviceHandle identifierNamespace](_HMDDeviceHandle, "identifierNamespace");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithNamespace:data:", v9, v10);

      v24.receiver = self;
      v24.super_class = (Class)_HMDLocalDeviceHandle;
      v12 = -[_HMDDeviceHandle initWithIdentifier:](&v24, sel_initWithIdentifier_, v11);
      if (v12)
      {
        v13 = objc_msgSend(v6, "copy");
        deviceIdentifier = v12->_deviceIdentifier;
        v12->_deviceIdentifier = (NSUUID *)v13;

      }
      v15 = v12;

      v16 = v15;
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v22;
        v28 = 2112;
        v29 = v5;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse destination, %@, with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      v16 = 0;
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing destination parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _HMDLocalDeviceHandle *v4;
  _HMDLocalDeviceHandle *v5;
  _HMDLocalDeviceHandle *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMDLocalDeviceHandle *)a3;
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
      -[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMDLocalDeviceHandle deviceIdentifier](v6, "deviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

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

  -[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
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
  -[_HMDLocalDeviceHandle description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateStringForObjectValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isLocal
{
  return 1;
}

- (id)destination
{
  void *v2;
  void *v3;
  void *v4;

  -[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("device:"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_HMDLocalDeviceHandle)initWithCoder:(id)a3
{
  id v4;
  _HMDLocalDeviceHandle *v5;
  uint64_t v6;
  NSUUID *deviceIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMDLocalDeviceHandle;
  v5 = -[_HMDDeviceHandle initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.deviceID"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HMDLocalDeviceHandle;
  v4 = a3;
  -[_HMDDeviceHandle encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_HMDLocalDeviceHandle deviceIdentifier](self, "deviceIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.deviceID"));

}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

+ (BOOL)isValidDestination:(id)a3
{
  void *v3;
  BOOL v4;

  __parseLocalDestination(a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
