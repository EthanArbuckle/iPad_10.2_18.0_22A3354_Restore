@implementation HMCameraClipDecryptionManager

- (HMCameraClipDecryptionManager)initWithKey:(id)a3
{
  id v4;
  void *v5;
  HMCameraClipDecryptionManager *v6;
  uint64_t v7;
  NSData *key;
  HMCameraClipDecryptionManager *v10;
  SEL v11;
  id v12;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)HMCameraClipDecryptionManager;
    v6 = -[HMCameraClipDecryptionManager init](&v13, sel_init);
    if (v6)
    {
      +[HMCameraClipCryptoUtilities zeroingDataFromData:](HMCameraClipCryptoUtilities, "zeroingDataFromData:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      key = v6->_key;
      v6->_key = (NSData *)v7;

    }
    return v6;
  }
  else
  {
    v10 = (HMCameraClipDecryptionManager *)_HMFPreconditionFailure();
    return (HMCameraClipDecryptionManager *)-[HMCameraClipDecryptionManager dataFromEncryptedDataContext:](v10, v11, v12);
  }
}

- (id)dataFromEncryptedDataContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HMCameraClipDecryptionManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  HMCameraClipDecryptionManager *v34;
  id v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DF0];
  objc_msgSend(v4, "ciphertext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithLength:", objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCameraClipDecryptionManager key](self, "key");
  v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v37, "bytes");
  v34 = self;
  -[HMCameraClipDecryptionManager key](self, "key");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "length");
  objc_msgSend(v4, "initializationVector");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v35, "bytes");
  objc_msgSend(v4, "initializationVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "length");
  objc_msgSend(v4, "ciphertext");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "bytes");
  objc_msgSend(v4, "ciphertext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  v12 = objc_retainAutorelease(v7);
  v13 = objc_msgSend(v12, "mutableBytes");
  objc_msgSend(v4, "tag");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "bytes");
  objc_msgSend(v4, "tag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v15;
  v33 = objc_msgSend(v16, "length");
  v30 = v11;
  v31 = v13;
  v17 = CCCryptorGCMOneshotDecrypt();

  if (v17)
  {
    v22 = v12;
    v23 = (void *)MEMORY[0x1A1AC1AAC](v18, v19, v20, v21);
    v24 = v34;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ciphertext", v30, v31, v32, v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v26;
      v40 = 2048;
      v41 = objc_msgSend(v27, "length");
      v42 = 1024;
      v43 = v17;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt %lu bytes: %d", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v23);
    v28 = 0;
  }
  else
  {
    v28 = (void *)objc_msgSend(v12, "copy", v11, v31, v15, v33);
    v22 = v12;
  }

  return v28;
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
