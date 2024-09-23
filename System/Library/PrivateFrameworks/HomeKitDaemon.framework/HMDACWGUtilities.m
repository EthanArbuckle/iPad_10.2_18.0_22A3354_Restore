@implementation HMDACWGUtilities

+ (id)createGroupResolvingKey
{
  void *v3;
  const __SecRandom *v4;
  size_t v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v3);
  if (SecRandomCopyBytes(v4, v5, (void *)objc_msgSend(v6, "mutableBytes")))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate random bytes for group resolving key", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(v6, "copy");
  }

  return v11;
}

+ (id)keychainIdentifierForPublicKeyExternalRepresentation:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("B52DD235-5F79-4A54-91F1-07076C605ED8"));
  objc_msgSend(MEMORY[0x24BDD1880], "hmf_UUIDWithNamespace:data:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)createIssuerKeyKeychainItemWithKeyPairExternalRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[HMDNIST256Utilities publicKeyExternalRepresentationFromKeyPairExternalRepresentation:](HMDNIST256Utilities, "publicKeyExternalRepresentationFromKeyPairExternalRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE1BB48]);
  objc_msgSend(v6, "setLabel:", CFSTR("Home ACWG Issuer Key"));
  objc_msgSend(v6, "setItemDescription:", CFSTR("Per User ACWG Issuer Key synced to HomeKit locks to grant users access."));
  objc_msgSend(v6, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
  objc_msgSend(v6, "setSyncable:", 1);
  objc_msgSend(v6, "setType:", &unk_24E96B570);
  v7 = (void *)MEMORY[0x24BE1BC08];
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewHintForType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setViewHint:", v9);

  objc_msgSend(v6, "setValueData:", v4);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCreationDate:", v10);

  objc_msgSend(a1, "keychainIdentifierForPublicKeyExternalRepresentation:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccount:", v11);

  return v6;
}

+ (id)keyPairExternalRepresentationFromKeychainItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.hap.pairing"));

  if ((v6 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = CFSTR("com.apple.hap.pairing");
      v14 = "%{public}@Failed to create ACWG Issuer key from keychain item: %@ access group is not equal to: %@";
LABEL_8:
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x20u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v10);
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", &unk_24E96B570);

  if ((v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = (const __CFString *)&unk_24E96B570;
      v14 = "%{public}@Failed to create ACWG Issuer key from keychain item: %@ is not equal to: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "valueData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v9;
}

@end
