@implementation NSUUID(HomeKitClient)

+ (id)hm_deriveUUIDFromBaseUUID:()HomeKitClient withSalts:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3A28];
  v6 = a4;
  v7 = a3;
  sharedIdentifierSaltStore();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierSalt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v7, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hm_deriveUUIDFromBaseUUID:()HomeKitClient identifierSalt:withSalts:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_UUIDWithNamespace:data:salts:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_FAULT, "%{public}@API Misuse: requested to derive UUID from nil base UUID. Call stack: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)hm_deriveUUIDFromBaseUUID:()HomeKitClient
{
  return objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:withSalts:", a3, 0);
}

+ (uint64_t)hm_deriveUUIDFromBaseUUID:()HomeKitClient identifierSalt:
{
  return objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", a3, a4, 0);
}

+ (void)hm_setIdentifierSalt:()HomeKitClient
{
  id v3;
  id v4;

  v3 = a3;
  sharedIdentifierSaltStore();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifierSalt:", v3);

}

- (id)hm_convertToData
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hm_deriveUUIDForAssistantFromBaseUUID:()HomeKitClient withSalts:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  sharedIdentifierSaltStore();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assistantIdentifierSalt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v5, v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (uint64_t)hm_deriveUUIDForAssistantFromBaseUUID:()HomeKitClient
{
  return objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDForAssistantFromBaseUUID:withSalts:", a3, 0);
}

+ (uint64_t)hm_setAssistantIdentifierSalt:()HomeKitClient
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  sharedIdentifierSaltStore();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantIdentifierSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  sharedIdentifierSaltStore();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v6, "setAssistantIdentifierSalt:", v7);

  LODWORD(v6) = HMFEqualObjects();
  return v6 ^ 1;
}

@end
