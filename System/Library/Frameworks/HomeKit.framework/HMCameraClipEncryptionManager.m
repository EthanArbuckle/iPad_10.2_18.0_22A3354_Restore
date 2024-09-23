@implementation HMCameraClipEncryptionManager

- (HMCameraClipEncryptionManager)init
{
  void *v3;
  HMCameraClipEncryptionManager *v4;

  +[HMCameraClipCryptoUtilities secureRandomZeroingDataWithLength:](HMCameraClipCryptoUtilities, "secureRandomZeroingDataWithLength:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMCameraClipEncryptionManager initWithKey:](self, "initWithKey:", v3);

  return v4;
}

- (HMCameraClipEncryptionManager)initWithKey:(id)a3
{
  id v5;
  void *v6;
  HMCameraClipEncryptionManager *v7;
  HMCameraClipEncryptionManager *v8;
  HMCameraClipEncryptionManager *v10;
  SEL v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v6 = v5;
  if (objc_msgSend(v5, "length") != 32)
  {
LABEL_7:
    v10 = (HMCameraClipEncryptionManager *)_HMFPreconditionFailure();
    return (HMCameraClipEncryptionManager *)-[HMCameraClipEncryptionManager encryptedDataContextFromData:](v10, v11, v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)HMCameraClipEncryptionManager;
  v7 = -[HMCameraClipEncryptionManager init](&v13, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_key, a3);

  return v8;
}

- (id)encryptedDataContextFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  HMCameraClipEncryptionManager *v21;
  NSObject *v22;
  void *v23;
  HMCameraClipEncryptedDataContext *v24;
  void *v25;
  HMCameraClipEncryptionManager *v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  HMCameraClipEncryptionManager *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCameraClipCryptoUtilities secureRandomZeroingDataWithLength:](HMCameraClipCryptoUtilities, "secureRandomZeroingDataWithLength:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v6;
  if (v7)
  {
    -[HMCameraClipEncryptionManager key](self, "key");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v34, "bytes");
    v33 = self;
    -[HMCameraClipEncryptionManager key](self, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "length");
    v35 = v7;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v37 = v4;
    v10 = objc_retainAutorelease(v4);
    objc_msgSend(v10, "bytes");
    v11 = objc_msgSend(v10, "length");
    v36 = v5;
    v12 = objc_retainAutorelease(v5);
    v13 = objc_msgSend(v12, "mutableBytes");
    v14 = objc_retainAutorelease(v6);
    v31 = objc_msgSend(v14, "mutableBytes");
    v32 = objc_msgSend(v14, "length");
    v30 = v13;
    v15 = CCCryptorGCMOneshotEncrypt();

    if (v15)
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC](v16, v17, v18, v19);
      v21 = v33;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v23;
        v41 = 2048;
        v42 = objc_msgSend(v10, "length", v11, v30, v31, v32);
        v43 = 1024;
        v44 = v15;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt %lu bytes: %d", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v20);
      v24 = 0;
    }
    else
    {
      v24 = -[HMCameraClipEncryptedDataContext initWithInitializationVector:ciphertext:tag:]([HMCameraClipEncryptedDataContext alloc], "initWithInitializationVector:ciphertext:tag:", v9, v12, v14, v11, v13, v31, v32);
    }
    v5 = v36;
    v4 = v37;
    v7 = v35;
  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to generate initialization vector", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
