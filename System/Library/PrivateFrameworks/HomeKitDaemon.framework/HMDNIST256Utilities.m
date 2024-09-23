@implementation HMDNIST256Utilities

+ (id)createNIST256KeyPair
{
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  __SecKey *v5;
  __SecKey *v6;
  CFErrorRef v7;
  CFDataRef v8;
  CFErrorRef v9;
  const __CFData *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  CFErrorRef error;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  CFErrorRef v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDE9060];
  v3 = *MEMORY[0x24BDE9048];
  v23[0] = *MEMORY[0x24BDE9050];
  v23[1] = v3;
  v24[0] = v2;
  v24[1] = &unk_24E96D358;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  error = 0;
  v5 = SecKeyCreateRandomKey(v4, &error);
  v6 = v5;
  v7 = error;
  if (v5)
  {
    v8 = SecKeyCopyExternalRepresentation(v5, &error);
    v9 = error;

    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy NIST256 key external representation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }

    v7 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create NIST256 key: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v8 = 0;
  }

  return v8;
}

+ (id)publicKeyExternalRepresentationFromKeyPairExternalRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length") == 97)
  {
    objc_msgSend(v3, "subdataWithRange:", 0, 65);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected NIST256 key pair external representation length %lu", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

+ (id)publicKeyFromKeyPairExternalRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length") == 97)
  {
    objc_msgSend(v3, "subdataWithRange:", 1, 64);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected NIST256 key pair external representation length %lu", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

+ (id)privateKeyFromKeyPairExternalRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length") == 97)
  {
    objc_msgSend(v3, "subdataWithRange:", 65, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected NIST256 key pair external representation length %lu", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

+ (id)identifier16BytesForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  CC_SHA256_CTX v8;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(&v8, 0, sizeof(v8));
  v3 = a3;
  CC_SHA256_Init(&v8);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", "key-identifier", 14, *(_OWORD *)v8.count, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[6], *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[10], *(_QWORD *)&v8.wbuf[14]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v3);

  v5 = objc_retainAutorelease(v4);
  CC_SHA256_Update(&v8, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  CC_SHA256_Final(md, &v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)identifier8BytesForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  CC_SHA256_CTX v8;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(&v8, 0, sizeof(v8));
  v3 = a3;
  CC_SHA256_Init(&v8);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", "key-identifier", 14, *(_OWORD *)v8.count, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[6], *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[10], *(_QWORD *)&v8.wbuf[14]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v3);

  v5 = objc_retainAutorelease(v4);
  CC_SHA256_Update(&v8, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  CC_SHA256_Final(md, &v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
