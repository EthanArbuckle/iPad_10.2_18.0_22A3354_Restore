@implementation HAPDeviceID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (HAPDeviceID)initWithDeviceIDString:(id)a3
{
  id v4;
  uint64_t v5;
  uint8_t *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HAPDeviceID *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = HAPDeviceIDLength;
  v6 = &buf[-((HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = objc_retainAutorelease(v4);
  objc_msgSend(v7, "UTF8String");
  objc_msgSend(v7, "length");
  if (TextToHardwareAddress())
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier string: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HAPDeviceID initWithDeviceIDData:](self, "initWithDeviceIDData:", v12);

    v11 = self;
  }

  return v11;
}

- (HAPDeviceID)initWithDeviceIDData:(id)a3
{
  id v4;
  uint64_t v5;
  HAPDeviceID *v6;
  uint64_t v7;
  NSData *data;
  HAPDeviceID *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 == HAPDeviceIDLength)
  {
    v14.receiver = self;
    v14.super_class = (Class)HAPDeviceID;
    v6 = -[HAPDeviceID init](&v14, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v4, "copy");
      data = v6->_data;
      v6->_data = (NSData *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HAPDeviceID *v4;
  HAPDeviceID *v5;
  HAPDeviceID *v6;
  BOOL v7;

  v4 = (HAPDeviceID *)a3;
  if (self == v4)
  {
    v7 = 1;
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
      v7 = -[HAPDeviceID isEqualToDeviceID:](self, "isEqualToDeviceID:", v6);
    else
      v7 = 0;

  }
  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HAPDeviceID data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[HAPDeviceID data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToData:", v6);
  return (char)v4;
}

- (NSData)data
{
  return self->_data;
}

- (HAPDeviceID)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HAPDeviceID deviceIDString](self, "deviceIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)deviceIDString
{
  char *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (char *)v7 - ((3 * HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0);
  -[HAPDeviceID data](self, "data");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "bytes");
  -[HAPDeviceID data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");
  HardwareAddressToCString();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (HAPDeviceID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HAPDeviceID *v6;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP.data"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HAPDeviceID initWithDeviceIDData:](self, "initWithDeviceIDData:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    -[HAPDeviceID data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("HAP.data"));

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
