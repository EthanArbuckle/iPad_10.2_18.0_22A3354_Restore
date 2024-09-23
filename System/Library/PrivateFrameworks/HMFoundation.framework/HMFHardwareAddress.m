@implementation HMFHardwareAddress

- (HMFHardwareAddress)initWithAddressString:(id)a3 length:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMFHardwareAddress *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  HMFHardwareAddress *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 - 1 > 7)
  {
    v15 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2048;
      v23 = a4;
      _os_log_impl(&dword_19B546000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hardware address with invalid length: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);

    v14 = 0;
  }
  else
  {
    v8 = objc_retainAutorelease(v6);
    objc_msgSend(v8, "UTF8String");
    objc_msgSend(v8, "length");
    v9 = TextToHardwareAddress();
    if (v9)
    {
      v10 = v9;
      v11 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v13;
        v22 = 2112;
        v23 = (unint64_t)v8;
        v24 = 1024;
        v25 = v10;
        _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert string to hardware address %@: %d", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v11);
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &buf[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)], a4);
      v18 = (HMFHardwareAddress *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMFHardwareAddress initWithAddressData:](self, "initWithAddressData:", v18);
      self = v18;
    }

  }
  return v14;
}

- (HMFHardwareAddress)initWithAddressData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length") || (unint64_t)objc_msgSend(v4, "length") >= 9)
  {
    v5 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hardware address with data of invalid length: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v8 = 0;
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)HMFHardwareAddress;
  v8 = -[HMFHardwareAddress init](&v11, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v4, "copy");
    self = (HMFHardwareAddress *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v9;
LABEL_8:

  }
  return (HMFHardwareAddress *)v8;
}

- (NSString)propertyDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMFHardwareAddress formattedString](self, "formattedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(" formattedString=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[HMFHardwareAddress data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSString)formattedString
{
  NSString *formattedString;
  char *v4;
  id v5;
  NSString *v6;
  NSString *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  formattedString = self->_formattedString;
  if (!formattedString)
  {
    v4 = (char *)v9 - ((3 * -[HMFHardwareAddress length](self, "length") + 15) & 0xFFFFFFFFFFFFFFF0);
    -[HMFHardwareAddress data](self, "data");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "bytes");
    -[HMFHardwareAddress length](self, "length");
    HardwareAddressToCString();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_formattedString;
    self->_formattedString = v6;

    formattedString = self->_formattedString;
  }
  return formattedString;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFHardwareAddress data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[HMFHardwareAddress isEqualToAddress:](self, "isEqualToAddress:", v4);

  return v5;
}

- (BOOL)isEqualToAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[HMFHardwareAddress data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToData:", v6);
  return (char)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFHardwareAddress)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMFHardwareAddress *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMFHardwareAddress initWithAddressData:](self, "initWithAddressData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFHardwareAddress data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMF.data"));

}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
}

@end
