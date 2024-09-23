@implementation HMDHomeNFCReaderKey

- (HMDHomeNFCReaderKey)initWithIdentifier:(id)a3 privateKey:(id)a4 publicKeyExternalRepresentation:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDHomeNFCReaderKey *v12;
  HMDHomeNFCReaderKey *v13;
  uint64_t v14;
  NSData *privateKey;
  uint64_t v16;
  NSData *publicKeyExternalRepresentation;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDHomeNFCReaderKey;
  v12 = -[HMDHomeNFCReaderKey init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v14 = objc_msgSend(v10, "copy");
    privateKey = v13->_privateKey;
    v13->_privateKey = (NSData *)v14;

    v16 = objc_msgSend(v11, "copy");
    publicKeyExternalRepresentation = v13->_publicKeyExternalRepresentation;
    v13->_publicKeyExternalRepresentation = (NSData *)v16;

  }
  return v13;
}

- (NSData)publicKey
{
  void *v2;
  void *v3;

  -[HMDHomeNFCReaderKey publicKeyExternalRepresentation](self, "publicKeyExternalRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:](HMDHomeNFCReaderKey, "publicKeyWithPublicKeyExternalRepresentation:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)externalRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDHomeNFCReaderKey privateKey](self, "privateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDHomeNFCReaderKey publicKeyExternalRepresentation](self, "publicKeyExternalRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "appendData:", v3);
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  return (NSData *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "publicKeyExternalRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeNFCReaderKey publicKeyExternalRepresentation](self, "publicKeyExternalRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9)
      && (objc_msgSend(v7, "privateKey"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDHomeNFCReaderKey privateKey](self, "privateKey"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = HMFEqualObjects(),
          v11,
          v10,
          v12))
    {
      objc_msgSend(v7, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeNFCReaderKey identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToData:", v14);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDHomeNFCReaderKey publicKeyExternalRepresentation](self, "publicKeyExternalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDHomeNFCReaderKey privateKey](self, "privateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDHomeNFCReaderKey identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (HMDHomeNFCReaderKey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeNFCReaderKey *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDHomeNFCReaderPublicKeyExternalRepresentationCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDHomeNFCReaderIdentifierCodingKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[HMDHomeNFCReaderKey initWithIdentifier:privateKey:publicKeyExternalRepresentation:](self, "initWithIdentifier:privateKey:publicKeyExternalRepresentation:", v6, 0, v5);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHomeNFCReaderKey identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDHomeNFCReaderIdentifierCodingKey"));

  -[HMDHomeNFCReaderKey publicKeyExternalRepresentation](self, "publicKeyExternalRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDHomeNFCReaderPublicKeyExternalRepresentationCodingKey"));

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeNFCReaderKey identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_hexadecimalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v5);
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeNFCReaderKey privateKey](self, "privateKey", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Has Private Key"), v9);
  v17[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHomeNFCReaderKey publicKeyExternalRepresentation](self, "publicKeyExternalRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_hexadecimalRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Public Key External Representation"), v13);
  v17[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSData)publicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)privateKey
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)identifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_publicKeyExternalRepresentation, 0);
}

+ (id)createRandomKey
{
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  __SecKey *v5;
  __SecKey *v6;
  CFErrorRef v7;
  CFDataRef v8;
  CFErrorRef v9;
  void *v10;
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

  v24[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD6A50];
  v3 = *MEMORY[0x1E0CD6A20];
  v23[0] = *MEMORY[0x1E0CD6A38];
  v23[1] = v3;
  v24[0] = v2;
  v24[1] = &unk_1E8B33168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
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
      +[HMDHomeNFCReaderKey createWithExternalRepresentation:](HMDHomeNFCReaderKey, "createWithExternalRepresentation:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy nfc reader key external representation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v10 = 0;
    }

    v7 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create nfc reader key: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

+ (id)createWithExternalRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMDHomeNFCReaderKey *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length") == 97)
  {
    objc_msgSend(v3, "subdataWithRange:", 0, 65);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subdataWithRange:", 65, 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeNFCReaderKey identifierForKey:](HMDHomeNFCReaderKey, "identifierForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDHomeNFCReaderKey initWithIdentifier:privateKey:publicKeyExternalRepresentation:]([HMDHomeNFCReaderKey alloc], "initWithIdentifier:privateKey:publicKeyExternalRepresentation:", v6, v5, v4);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(v3, "length");
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nfc reader key external representation length %lu", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

+ (id)identifierForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  CC_SHA256_CTX v8;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(&v8, 0, sizeof(v8));
  v3 = a3;
  CC_SHA256_Init(&v8);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", "key-identifier", 14, *(_OWORD *)v8.count, *(_OWORD *)&v8.hash[2], *(_OWORD *)&v8.hash[6], *(_OWORD *)&v8.wbuf[2], *(_OWORD *)&v8.wbuf[6], *(_OWORD *)&v8.wbuf[10], *(_QWORD *)&v8.wbuf[14]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v3);

  v5 = objc_retainAutorelease(v4);
  CC_SHA256_Update(&v8, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  CC_SHA256_Final(md, &v8);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)publicKeyWithPublicKeyExternalRepresentation:(id)a3
{
  return (id)objc_msgSend(a3, "subdataWithRange:", 1, 64);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createKeychainItemForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeNFCReaderKey *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  HMDHomeNFCReaderKey *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeNFCReaderKey externalRepresentation](self, "externalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D16548]);
    objc_msgSend(v6, "setLabel:", CFSTR("Home NFC Reader Key"));
    objc_msgSend(v6, "setItemDescription:", CFSTR("Per Home NFC Reader Key synced to HomeKit locks to protect device privacy over NFC transaction."));
    objc_msgSend(v6, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
    objc_msgSend(v6, "setSyncable:", 1);
    objc_msgSend(v6, "setType:", &unk_1E8B33B58);
    v7 = (void *)MEMORY[0x1E0D165F0];
    objc_msgSend(v6, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewHintForType:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewHint:", v9);

    objc_msgSend(v6, "setValueData:", v5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCreationDate:", v10);

    v11 = (void *)objc_opt_class();
    -[HMDHomeNFCReaderKey identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccount:", v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v17;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create keychain item for home: %@ from: %@, external representation is nil", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v6 = 0;
  }

  return v6;
}

+ (id)keychainItemAccountAttributeValueWithHome:(id)a3 keyIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3A28];
  v6 = a4;
  objc_msgSend(a3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)createWithKeychainItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accessGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.hap.pairing"));

  if ((v6 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = CFSTR("com.apple.hap.pairing");
      v15 = "%{public}@Failed to create nfc reader key from keychain item: %@ access group is not equal to: %@";
LABEL_8:
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x20u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v11);
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", &unk_1E8B33B58);

  if ((v8 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = (const __CFString *)&unk_1E8B33B58;
      v15 = "%{public}@Failed to create nfc reader key from keychain item: %@ is not equal to: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "valueData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeNFCReaderKey createWithExternalRepresentation:](HMDHomeNFCReaderKey, "createWithExternalRepresentation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

@end
