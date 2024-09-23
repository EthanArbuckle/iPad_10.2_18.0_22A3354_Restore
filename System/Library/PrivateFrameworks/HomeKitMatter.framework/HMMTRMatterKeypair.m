@implementation HMMTRMatterKeypair

- (HMMTRMatterKeypair)initWithAccount:(id)a3
{
  id v4;
  HMMTRMatterKeypair *v5;
  HMMTRMatterKeypair *v6;
  HMMTRMatterKeypair *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRMatterKeypair;
  v5 = -[HMMTRMatterKeypair init](&v9, sel_init);
  v6 = v5;
  if (v5
    && (-[HMMTRMatterKeypair setKeychainAccount:](v5, "setKeychainAccount:", v4),
        !-[HMMTRMatterKeypair initializeAllowingNew:](v6, "initializeAllowingNew:", 1)))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (HMMTRMatterKeypair)initWithV0Account:(id)a3
{
  id v5;
  HMMTRMatterKeypair *v6;
  HMMTRMatterKeypair *v7;
  HMMTRMatterKeypair *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRMatterKeypair;
  v6 = -[HMMTRMatterKeypair init](&v10, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_keychainAccount, a3),
        !-[HMMTRMatterKeypair initializeAllowingNew:](v7, "initializeAllowingNew:", 0)))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)initAsDeviceLocal
{
  HMMTRMatterKeypair *v2;
  HMMTRMatterKeypair *v3;
  NSString *keychainAccount;
  HMMTRMatterKeypair *v5;
  void *v6;
  HMMTRMatterKeypair *v7;
  NSObject *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)HMMTRMatterKeypair;
  v2 = -[HMMTRMatterKeypair init](&v11, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_4;
  keychainAccount = v2->_keychainAccount;
  v2->_keychainAccount = (NSString *)&stru_250F24B08;

  v3->_deviceLocal = 1;
  if (-[HMMTRMatterKeypair _generateKeys](v3, "_generateKeys"))
  {
    v3->_initialized = 1;
LABEL_4:
    v5 = v3;
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x242656984]();
  v7 = v3;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate device local keypair", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v5 = 0;
LABEL_8:

  return v5;
}

- (HMMTRMatterKeypair)initWithV0Account:(id)a3 privateKey:(__SecKey *)a4
{
  id v7;
  HMMTRMatterKeypair *v8;
  HMMTRMatterKeypair *v9;
  CFDataRef v10;
  NSData *keyRepr;
  const __CFData *v12;
  __SecKey *v13;
  HMMTRMatterKeypair *v14;
  void *v15;
  HMMTRMatterKeypair *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMMTRMatterKeypair;
  v8 = -[HMMTRMatterKeypair init](&v20, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  objc_storeStrong((id *)&v8->_keychainAccount, a3);
  v10 = SecKeyCopyExternalRepresentation(a4, 0);
  if (v10)
  {
    keyRepr = v9->_keyRepr;
    v9->_keyRepr = (NSData *)v10;
    v12 = v10;

    v13 = -[HMMTRMatterKeypair createPrivateKeyWithData:](v9, "createPrivateKeyWithData:", v12);
    v9->_privateKey = v13;
    v9->_publicKey = SecKeyCopyPublicKey(v13);
    -[HMMTRMatterKeypair _storePrivateKeyData:](v9, "_storePrivateKeyData:", v12);

LABEL_4:
    v14 = v9;
    goto LABEL_8;
  }
  v15 = (void *)MEMORY[0x242656984]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v18;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Failed in getting keypair data from private key", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  v14 = 0;
LABEL_8:

  return v14;
}

- (HMMTRMatterKeypair)initWithTLVData:(id)a3
{
  id v4;
  HMMTRMatterKeypair *v5;
  HMMTRMatterKeypair *v6;
  NSString *keychainAccount;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRMatterKeypair;
  v5 = -[HMMTRMatterKeypair init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    keychainAccount = v5->_keychainAccount;
    v5->_keychainAccount = (NSString *)CFSTR("null");

    -[HMMTRMatterKeypair deserialize:](v6, "deserialize:", v4);
  }

  return v6;
}

- (HMMTRMatterKeypair)initWithPrivateKey:(__SecKey *)a3
{
  HMMTRMatterKeypair *v4;
  CFDataRef v5;
  NSData *keyRepr;
  __SecKey *v7;
  HMMTRMatterKeypair *v8;
  void *v9;
  HMMTRMatterKeypair *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)HMMTRMatterKeypair;
  v4 = -[HMMTRMatterKeypair init](&v14, sel_init);
  if (!v4)
    goto LABEL_4;
  v5 = SecKeyCopyExternalRepresentation(a3, 0);
  keyRepr = v4->_keyRepr;
  v4->_keyRepr = (NSData *)v5;

  if (v4->_keyRepr)
  {
    v7 = -[HMMTRMatterKeypair createPrivateKeyWithData:](v4, "createPrivateKeyWithData:");
    v4->_privateKey = v7;
    v4->_publicKey = SecKeyCopyPublicKey(v7);
LABEL_4:
    v8 = v4;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x242656984]();
  v10 = v4;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Bad private key passed to initializer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v8 = 0;
LABEL_8:

  return v8;
}

- (id)initUnassociated
{
  HMMTRMatterKeypair *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  __SecKey *v8;
  void *v9;
  HMMTRMatterKeypair *v10;
  NSObject *v11;
  void *v12;
  HMMTRMatterKeypair *v13;
  CFErrorRef error;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  CFErrorRef v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)HMMTRMatterKeypair;
  v2 = -[HMMTRMatterKeypair init](&v16, sel_init);
  if (!v2)
    goto LABEL_7;
  v3 = *MEMORY[0x24BDE9030];
  v4 = *MEMORY[0x24BDE9050];
  v21[0] = *MEMORY[0x24BDE9028];
  v21[1] = v4;
  v5 = *MEMORY[0x24BDE9060];
  v22[0] = v3;
  v22[1] = v5;
  v6 = *MEMORY[0x24BDE90A0];
  v21[2] = *MEMORY[0x24BDE9048];
  v21[3] = v6;
  error = 0;
  v22[2] = &unk_250F3F348;
  v22[3] = CFSTR("A CHIPPlugin Matter Keypair.");
  v21[4] = *MEMORY[0x24BDE8FB8];
  v22[4] = CFSTR("com.apple.matter.commissioner.ca.issuer.id");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = SecKeyCreateRandomKey(v7, &error);
  v2->_privateKey = v8;
  if (!error)
  {
    v2->_publicKey = SecKeyCopyPublicKey(v8);

LABEL_7:
    v13 = v2;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x242656984]();
  v10 = v2;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = error;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed in keygen %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);

  v13 = 0;
LABEL_8:

  return v13;
}

- (HMMTRMatterKeypair)initWithV1Account:(id)a3
{
  id v5;
  HMMTRMatterKeypair *v6;
  HMMTRMatterKeypair *v7;
  HMMTRMatterKeypair *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRMatterKeypair;
  v6 = -[HMMTRMatterKeypair init](&v10, sel_init);
  v7 = v6;
  if (v6
    && (v6->_version = 1,
        objc_storeStrong((id *)&v6->_keychainAccount, a3),
        !-[HMMTRMatterKeypair initializeAllowingNew:](v7, "initializeAllowingNew:", 0)))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (HMMTRMatterKeypair)initWithV1Account:(id)a3 privateKey:(__SecKey *)a4 operationalKey:(__SecKey *)a5 rootCert:(id)a6 operationalCert:(id)a7 ipk:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMMTRMatterKeypair *v18;
  HMMTRMatterKeypair *v19;
  CFDataRef v20;
  NSData *keyRepr;
  CFDataRef v22;
  NSData *opKeyRepr;
  HMMTRMatterKeypair *v24;
  void *v25;
  HMMTRMatterKeypair *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)HMMTRMatterKeypair;
  v18 = -[HMMTRMatterKeypair init](&v32, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_6;
  v18->_version = 1;
  v20 = SecKeyCopyExternalRepresentation(a4, 0);
  keyRepr = v19->_keyRepr;
  v19->_keyRepr = (NSData *)v20;

  if (!v19->_keyRepr)
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = v19;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v28;
      v29 = "%{public}@Bad private key passed to initializer";
LABEL_11:
      _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

    }
LABEL_12:

    objc_autoreleasePoolPop(v25);
    v24 = 0;
    goto LABEL_13;
  }
  v19->_privateKey = -[HMMTRMatterKeypair createPrivateKeyWithData:](v19, "createPrivateKeyWithData:");
  v22 = SecKeyCopyExternalRepresentation(a5, 0);
  opKeyRepr = v19->_opKeyRepr;
  v19->_opKeyRepr = (NSData *)v22;

  if (!v19->_opKeyRepr)
  {
    v25 = (void *)MEMORY[0x242656984]();
    v26 = v19;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v28;
      v29 = "%{public}@Bad op key passed to initializer";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v19->_operationalKey = -[HMMTRMatterKeypair createPrivateKeyWithData:](v19, "createPrivateKeyWithData:");
  v19->_publicKey = SecKeyCopyPublicKey(v19->_privateKey);
  objc_storeStrong((id *)&v19->_keychainAccount, a3);
  objc_storeStrong((id *)&v19->_rootCert, a6);
  objc_storeStrong((id *)&v19->_operationalCert, a7);
  objc_storeStrong((id *)&v19->_ipk, a8);
  -[HMMTRMatterKeypair archiveV1KeyItemValue](v19, "archiveV1KeyItemValue");
  v24 = (HMMTRMatterKeypair *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HMMTRMatterKeypair _storePrivateKeyData:](v19, "_storePrivateKeyData:", v24);

LABEL_6:
    v24 = v19;
  }
LABEL_13:

  return v24;
}

- (void)setOperationalKey:(__SecKey *)a3
{
  NSData *v4;
  NSData *opKeyRepr;
  void *v6;
  HMMTRMatterKeypair *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (NSData *)SecKeyCopyExternalRepresentation(a3, 0);
    opKeyRepr = self->_opKeyRepr;
    self->_opKeyRepr = v4;

    if (self->_opKeyRepr)
    {
      self->_operationalKey = -[HMMTRMatterKeypair createPrivateKeyWithData:](self, "createPrivateKeyWithData:");
    }
    else
    {
      v6 = (void *)MEMORY[0x242656984]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@Bad op key passed to operationalKey", (uint8_t *)&v10, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
  }
  else
  {
    self->_operationalKey = 0;
  }
}

- (__SecKey)operationalKey
{
  return self->_operationalKey;
}

- (BOOL)initializeAllowingNew:(BOOL)a3
{
  void *v5;
  void *v6;
  HMMTRMatterKeypair *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  HMMTRMatterKeypair *v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v16;
  os_log_type_t v17;
  HMMTRMatterKeypair *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRMatterKeypair initialized](self, "initialized"))
    return -[HMMTRMatterKeypair initialized](self, "initialized");
  -[HMMTRMatterKeypair _getPrivateKeydata](self, "_getPrivateKeydata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Found private Key data, reloading keys", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    if (!-[HMMTRMatterKeypair _reloadWithData:](v7, "_reloadWithData:", v5))
    {
      v6 = (void *)MEMORY[0x242656984]();
      v11 = v7;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v12;
        v13 = "%{public}@Failed to reload keys from privateKey Data, init failure!!!";
LABEL_18:
        v16 = v8;
        v17 = OS_LOG_TYPE_ERROR;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  if (!a3)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v12;
      v13 = "%{public}@Private key not found";
      v16 = v8;
      v17 = OS_LOG_TYPE_INFO;
LABEL_19:
      _os_log_impl(&dword_23E95B000, v16, v17, v13, (uint8_t *)&v19, 0xCu);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (v9)
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v14;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Private Key not found, generating new Keys", (uint8_t *)&v19, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if (-[HMMTRMatterKeypair _generateKeys](v7, "_generateKeys"))
  {
LABEL_12:
    -[HMMTRMatterKeypair setInitialized:](v7, "setInitialized:", 1);

    return -[HMMTRMatterKeypair initialized](self, "initialized");
  }
  v6 = (void *)MEMORY[0x242656984]();
  v18 = v7;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v12;
    v13 = "%{public}@Failed to initialize, unable to generate new keys";
    goto LABEL_18;
  }
LABEL_20:

  objc_autoreleasePoolPop(v6);
  return 0;
}

- (id)serialize
{
  CFDataRef v3;
  CFDataRef v4;
  const __CFData *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMMTRMatterKeypair *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMMTRMatterKeypair *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint8_t buf[4];
  _DWORD v22[67];

  *(_QWORD *)&v22[65] = *MEMORY[0x24BDAC8D0];
  v3 = SecKeyCopyExternalRepresentation(-[HMMTRMatterKeypair privateKey](self, "privateKey"), 0);
  v4 = v3;
  if (v3)
  {
    *(_DWORD *)buf = 16786453;
    LOWORD(v22[0]) = 304;
    BYTE2(v22[0]) = -[__CFData length](v3, "length");
    v5 = objc_retainAutorelease(v4);
    -[__CFData bytes](v5, "bytes");
    -[__CFData length](v5, "length");
    __memcpy_chk();
    v6 = -[__CFData length](v5, "length");
    *((_BYTE *)v22 + v6 + 3) = 24;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, (char *)v22 + v6 + 3 - (char *)buf + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2048;
      v20 = objc_msgSend(v7, "length");
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Composed key data with length %zu", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v22 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed in getting private key data...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v7 = 0;
  }

  return v7;
}

- (BOOL)deserialize:(id)a3
{
  id v4;
  void *v5;
  __SecKey *v6;
  __SecKey *v7;
  BOOL v8;
  void *v9;
  HMMTRMatterKeypair *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMMTRTLVParser keyPairDataFromTLV:](HMMTRTLVParser, "keyPairDataFromTLV:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    v13 = "%{public}@TLV parsing failed";
LABEL_11:
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0xCu);

    goto LABEL_12;
  }
  v6 = -[HMMTRMatterKeypair createPrivateKeyWithData:](self, "createPrivateKeyWithData:", v5);
  self->_privateKey = v6;
  if (!v6)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v12;
    v13 = "%{public}@Unable to reconstruct private key from TLV";
    goto LABEL_11;
  }
  v7 = SecKeyCopyPublicKey(v6);
  self->_publicKey = v7;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      v13 = "%{public}@Unable to recover public key from TLV";
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v9);
    v8 = 0;
    goto LABEL_13;
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (id)signMessageECDSA_DER:(id)a3
{
  const __CFData *v4;
  CFDataRef v5;
  void *v6;
  HMMTRMatterKeypair *v7;
  NSObject *v8;
  void *v9;
  CFErrorRef error;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFData *)a3;
  error = 0;
  v5 = SecKeyCreateSignature(self->_privateKey, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], v4, &error);
  if (error)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = error;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@HomeKitMatter failed to sign message %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)unarchiveV1KeyItemValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  HMMTRMatterKeypair *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMMTRMatterKeypair version](self, "version") != 1)
    _HMFPreconditionFailure();
  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = objc_opt_class();
  v14 = 0;
  objc_msgSend(v5, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v6, objc_opt_class(), v4, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (!v7)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed unarchive V1 key data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v7;
}

- (id)archiveV1KeyItemValue
{
  CFDataRef v3;
  CFDataRef v4;
  CFDataRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMMTRMatterKeypair *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMMTRMatterKeypair *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMMTRMatterKeypair *v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRMatterKeypair version](self, "version") != 1)
    _HMFPreconditionFailure();
  v3 = SecKeyCopyExternalRepresentation(-[HMMTRMatterKeypair privateKey](self, "privateKey"), 0);
  if (v3)
  {
    v4 = SecKeyCopyExternalRepresentation(-[HMMTRMatterKeypair operationalKey](self, "operationalKey"), 0);
    v5 = v4;
    if (v4)
    {
      v30[0] = CFSTR("privkey");
      v30[1] = CFSTR("opkey");
      v31[0] = v3;
      v31[1] = v4;
      v30[2] = CFSTR("rootcert");
      -[HMMTRMatterKeypair rootCert](self, "rootCert");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v6;
      v30[3] = CFSTR("opcert");
      -[HMMTRMatterKeypair operationalCert](self, "operationalCert");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v31[3] = v7;
      v30[4] = CFSTR("ipk");
      -[HMMTRMatterKeypair ipk](self, "ipk");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31[4] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v25;
      if (!v10)
      {
        v12 = (void *)MEMORY[0x242656984]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v15;
          v28 = 2112;
          v29 = v11;
          _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize combo keypair cert data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x242656984]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v23;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get key data from operational key", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      v10 = 0;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get key data from private key", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v10 = 0;
  }

  return v10;
}

- (BOOL)reload
{
  void *v3;
  HMMTRMatterKeypair *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMMTRMatterKeypair *v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  CFDataRef v18;
  void *v19;
  HMMTRMatterKeypair *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  HMMTRMatterKeypair *v24;
  void *v26;
  HMMTRMatterKeypair *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Trying to reload keypair from keychain", (uint8_t *)&v30, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRMatterKeypair _getPrivateKeydata](v4, "_getPrivateKeydata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    if (-[HMMTRMatterKeypair version](v4, "version") == 1)
    {
      -[HMMTRMatterKeypair unarchiveV1KeyItemValue:](v4, "unarchiveV1KeyItemValue:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v26 = (void *)MEMORY[0x242656984]();
        v27 = v4;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138543618;
          v31 = v29;
          v32 = 2112;
          v33 = 0;
          _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@Key value could not be deserialized: %@", (uint8_t *)&v30, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        v17 = 0;
        goto LABEL_23;
      }
      v11 = v10;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("privkey"));
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v12;
    }
    else
    {
      v11 = 0;
    }
    v18 = SecKeyCopyExternalRepresentation(v4->_privateKey, 0);
    if ((-[__CFData isEqualToData:](v18, "isEqualToData:", v9) & 1) != 0)
    {
      v19 = (void *)MEMORY[0x242656984]();
      v20 = v4;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v22;
        v23 = "%{public}@Keypair data was not changed not reloading";
LABEL_20:
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v30, 0xCu);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if (-[HMMTRMatterKeypair version](v4, "version") == 1)
    {
      if (-[HMMTRMatterKeypair _reloadWithDictionary:](v4, "_reloadWithDictionary:", v11))
      {
LABEL_16:
        v17 = 1;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
    }
    else if (-[HMMTRMatterKeypair _reloadWithData:](v4, "_reloadWithData:", v9))
    {
      goto LABEL_16;
    }
    v19 = (void *)MEMORY[0x242656984]();
    v24 = v4;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v22;
      v23 = "%{public}@!!!Failed to reload keypair!!! Keypair is useless now. ";
      goto LABEL_20;
    }
LABEL_21:

    objc_autoreleasePoolPop(v19);
    v17 = 0;
    goto LABEL_22;
  }
  v13 = (void *)MEMORY[0x242656984]();
  v14 = v4;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v16;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@keypair was deleted, not reloading...", (uint8_t *)&v30, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  v17 = 0;
LABEL_24:

  return v17;
}

- (BOOL)_storePrivateKeyData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMMTRMatterKeypair *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE1BB48]);
  objc_msgSend(v6, "setValueData:", v4);
  objc_msgSend(v6, "setSyncable:", -[HMMTRMatterKeypair deviceLocal](self, "deviceLocal") ^ 1);
  -[HMMTRMatterKeypair keychainAccount](self, "keychainAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccount:", v7);

  objc_msgSend(v6, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
  objc_msgSend(v6, "setLabel:", CFSTR("A CHIPPlugin Matter Keypair."));
  objc_msgSend(v6, "setItemDescription:", CFSTR("A CHIPPlugin Matter keypair is stored here."));
  objc_msgSend(v6, "setType:", &unk_250F3F360);
  v8 = (void *)MEMORY[0x24BE1BC08];
  objc_msgSend(v6, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewHintForType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setViewHint:", v10);

  v17 = 0;
  objc_msgSend(v5, "updateKeychainItem:createIfNeeded:error:", v6, 1, &v17);
  v11 = v17;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Update Keychain Item Result : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

  return v11 == 0;
}

- (BOOL)_generateKeys
{
  void *v3;
  HMMTRMatterKeypair *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  __SecKey *v12;
  void *v13;
  HMMTRMatterKeypair *v14;
  NSObject *v15;
  void *v16;
  char v17;
  CFDataRef v18;
  void *v19;
  HMMTRMatterKeypair *v20;
  NSObject *v21;
  void *v22;
  CFErrorRef error;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  CFErrorRef v28;
  _QWORD v29[5];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRMatterKeypair version](self, "version") == 1)
    _HMFPreconditionFailure();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Generating a new keypair for the Matter CA", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = *MEMORY[0x24BDE9030];
  v8 = *MEMORY[0x24BDE9050];
  v29[0] = *MEMORY[0x24BDE9028];
  v29[1] = v8;
  v9 = *MEMORY[0x24BDE9060];
  v30[0] = v7;
  v30[1] = v9;
  v10 = *MEMORY[0x24BDE90A0];
  v29[2] = *MEMORY[0x24BDE9048];
  v29[3] = v10;
  error = 0;
  v30[2] = &unk_250F3F348;
  v30[3] = CFSTR("A CHIPPlugin Matter Keypair.");
  v29[4] = *MEMORY[0x24BDE8FB8];
  v30[4] = CFSTR("com.apple.matter.commissioner.ca.issuer.id");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v12 = SecKeyCreateRandomKey(v11, &error);
  v4->_privateKey = v12;
  if (error)
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = v4;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      v27 = 2112;
      v28 = error;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed in keygen %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }
  else
  {
    v4->_publicKey = SecKeyCopyPublicKey(v12);
    v18 = SecKeyCopyExternalRepresentation(v4->_privateKey, 0);
    if (v18)
    {
      if (v4->_deviceLocal)
        v17 = 1;
      else
        v17 = -[HMMTRMatterKeypair _storePrivateKeyData:](v4, "_storePrivateKeyData:", v18);
    }
    else
    {
      v19 = (void *)MEMORY[0x242656984]();
      v20 = v4;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v22;
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Failed in getting keypair data...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v17 = 0;
    }

  }
  return v17;
}

- (id)_getPrivateKeydata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMMTRMatterKeypair *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  HMMTRMatterKeypair *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRMatterKeypair keychainAccount](self, "keychainAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[HMMTRMatterKeypair deviceLocal](self, "deviceLocal") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v3, "allKeychainItemsForType:identifier:syncable:error:", &unk_250F3F360, v4, v5, &v33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v33;

  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v11;
    v37 = 2112;
    v38 = v7;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Load Keychain Item Result : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v28 = v7;
    v15 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "account");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRMatterKeypair keychainAccount](v9, "keychainAccount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (v20)
        {
          v22 = (void *)MEMORY[0x242656984]();
          v23 = v9;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueData");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = v25;
            v37 = 2112;
            v38 = v26;
            _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, "%{public}@Returning matching key : %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v22);
          objc_msgSend(v17, "valueData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v14)
        continue;
      break;
    }
    v21 = 0;
LABEL_15:
    v7 = v28;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_reloadWithData:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  __SecKey *v7;
  __SecKey *v8;
  void *v9;
  HMMTRMatterKeypair *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMMTRMatterKeypair version](self, "version") != 1)
  {
    v7 = -[HMMTRMatterKeypair createPrivateKeyWithData:](self, "createPrivateKeyWithData:", v4);
    self->_privateKey = v7;
    if (v7)
    {
      v8 = SecKeyCopyPublicKey(v7);
      self->_publicKey = v8;
      if (v8)
      {
        v6 = 1;
        goto LABEL_15;
      }
      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v12;
        v13 = "%{public}@Unable to recover public key";
        goto LABEL_13;
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v12;
        v13 = "%{public}@Unable to reconstruct private key";
LABEL_13:
        _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v9);
    v6 = 0;
    goto LABEL_15;
  }
  -[HMMTRMatterKeypair unarchiveV1KeyItemValue:](self, "unarchiveV1KeyItemValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[HMMTRMatterKeypair _reloadWithDictionary:](self, "_reloadWithDictionary:", v5);
  else
    v6 = 0;

LABEL_15:
  return v6;
}

- (BOOL)_reloadWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFData *v10;
  void *v11;
  HMMTRMatterKeypair *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  BOOL v18;
  __SecKey *v20;
  const __CFData *v21;
  NSData *v22;
  NSData *rootCert;
  NSData *v24;
  NSData *operationalCert;
  NSData *v26;
  NSData *ipk;
  CFErrorRef error;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  CFErrorRef v32;
  _QWORD v33[5];
  _QWORD v34[6];

  v34[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMMTRMatterKeypair version](self, "version") != 1)
    _HMFPreconditionFailure();
  v5 = *MEMORY[0x24BDE9030];
  v6 = *MEMORY[0x24BDE9050];
  v33[0] = *MEMORY[0x24BDE9028];
  v33[1] = v6;
  v7 = *MEMORY[0x24BDE9060];
  v34[0] = v5;
  v34[1] = v7;
  v8 = *MEMORY[0x24BDE90A0];
  v33[2] = *MEMORY[0x24BDE9048];
  v33[3] = v8;
  error = 0;
  v34[2] = &unk_250F3F348;
  v34[3] = CFSTR("A CHIPPlugin Matter Keypair.");
  v33[4] = *MEMORY[0x24BDE8FB8];
  v34[4] = CFSTR("com.apple.matter.commissioner.ca.issuer.id");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privkey"));
  v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  self->_privateKey = SecKeyCreateWithData(v10, v9, &error);

  if (error)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      v31 = 2112;
      v32 = error;
      v15 = "%{public}@Unable to reconstruct private key %@";
LABEL_5:
      v16 = v13;
      v17 = 22;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);

    }
  }
  else
  {
    v20 = SecKeyCopyPublicKey(self->_privateKey);
    self->_publicKey = v20;
    if (!v20)
    {
      v11 = (void *)MEMORY[0x242656984]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      v15 = "%{public}@Unable to recover public key";
      v16 = v13;
      v17 = 12;
      goto LABEL_6;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("opkey"));
    v21 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    self->_operationalKey = SecKeyCreateWithData(v21, v9, &error);

    if (self->_operationalKey)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rootcert"));
      v22 = (NSData *)objc_claimAutoreleasedReturnValue();
      rootCert = self->_rootCert;
      self->_rootCert = v22;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("opcert"));
      v24 = (NSData *)objc_claimAutoreleasedReturnValue();
      operationalCert = self->_operationalCert;
      self->_operationalCert = v24;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ipk"));
      v26 = (NSData *)objc_claimAutoreleasedReturnValue();
      ipk = self->_ipk;
      self->_ipk = v26;

      v18 = 1;
      goto LABEL_8;
    }
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      v31 = 2112;
      v32 = error;
      v15 = "%{public}@Unable to reconstruct operational key %@";
      goto LABEL_5;
    }
  }
LABEL_7:

  objc_autoreleasePoolPop(v11);
  v18 = 0;
LABEL_8:

  return v18;
}

- (__SecKey)createPrivateKeyWithData:(id)a3
{
  const __CFData *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  __SecKey *v10;
  void *v11;
  HMMTRMatterKeypair *v12;
  NSObject *v13;
  void *v14;
  CFErrorRef error;
  uint8_t buf[4];
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFData *)a3;
  v5 = *MEMORY[0x24BDE9030];
  v6 = *MEMORY[0x24BDE9050];
  v19[0] = *MEMORY[0x24BDE9028];
  v19[1] = v6;
  v7 = *MEMORY[0x24BDE9060];
  v20[0] = v5;
  v20[1] = v7;
  v8 = *MEMORY[0x24BDE90A0];
  v19[2] = *MEMORY[0x24BDE9048];
  v19[3] = v8;
  error = 0;
  v20[2] = &unk_250F3F348;
  v20[3] = CFSTR("A CHIPPlugin Matter Keypair.");
  v19[4] = *MEMORY[0x24BDE8FB8];
  v20[4] = CFSTR("com.apple.matter.commissioner.ca.issuer.id");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = SecKeyCreateWithData(v4, v9, &error);
  if (error)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@SecKeyCreateWithData failed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

  return v10;
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (NSData)rootCert
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)operationalCert
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)ipk
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (NSString)keychainAccount
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKeychainAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)keyRepr
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeyRepr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)opKeyRepr
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOpKeyRepr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)deviceLocal
{
  return self->_deviceLocal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opKeyRepr, 0);
  objc_storeStrong((id *)&self->_keyRepr, 0);
  objc_storeStrong((id *)&self->_keychainAccount, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_operationalCert, 0);
  objc_storeStrong((id *)&self->_rootCert, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39 != -1)
    dispatch_once(&logCategory__hmf_once_t39, &__block_literal_global_1911);
  return (id)logCategory__hmf_once_v40;
}

void __33__HMMTRMatterKeypair_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v40;
  logCategory__hmf_once_v40 = v0;

}

@end
