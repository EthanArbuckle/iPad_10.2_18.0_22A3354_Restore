@implementation HMFMACAddress

- (HMFMACAddress)initWithMACAddressString:(id)a3
{
  return -[HMFMACAddress initWithAddressString:length:](self, "initWithAddressString:length:", a3, 6);
}

- (HMFMACAddress)initWithAddressString:(id)a3 length:(unint64_t)a4
{
  id v6;
  HMFMACAddress *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 6)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMFMACAddress;
    v7 = -[HMFHardwareAddress initWithAddressString:length:](&v12, sel_initWithAddressString_length_, v6, 6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2048;
      v16 = a4;
      _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create MAC address with string of invalid length: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);

    v7 = 0;
  }

  return v7;
}

- (HMFMACAddress)initWithAddressData:(id)a3
{
  id v4;
  HMFMACAddress *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length") == 6)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMFMACAddress;
    v5 = -[HMFHardwareAddress initWithAddressData:](&v10, sel_initWithAddressData_, v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to create MAC address with data of invalid length: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);

    v5 = 0;
  }

  return v5;
}

@end
