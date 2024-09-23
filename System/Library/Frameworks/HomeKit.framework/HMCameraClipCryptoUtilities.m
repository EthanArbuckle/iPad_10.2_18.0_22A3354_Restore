@implementation HMCameraClipCryptoUtilities

+ (id)zeroingDataFromData:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0C99D50];
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return (id)objc_msgSend(v3, "_newZeroingDataWithBytes:length:", v5, v6);
}

+ (id)secureRandomZeroingDataWithLength:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  NSRandomData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      v14 = 2048;
      v15 = a3;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not generate random data of length %lu: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

@end
