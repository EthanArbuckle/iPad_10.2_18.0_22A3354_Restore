@implementation NSString(HAPAdditions)

- (id)hap_validatedAndNormalizedUUIDString
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v11;
  int v12;
  int v13;
  uint64_t ErrorString;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint8_t *v23;
  __int16 v24;
  id v25;
  uint8_t buf[32];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int v31;
  _BYTE v32[37];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a1);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-1000-8000-0026BB765291"));
    v4 = objc_msgSend(v2, "isEqual:", v3);

    if (!v4)
    {
      objc_msgSend(v2, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v5 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a1;
    v8 = "%{public}@### UUID type %@ is using the HAP Base UUID";
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "characterAtIndex:", 0) != 48)
  {
    memset(v32, 0, sizeof(v32));
    v11 = objc_retainAutorelease(a1);
    objc_msgSend(v11, "UTF8String");
    v12 = NormalizeUUIDString();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uppercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    v13 = v12;
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    memset(buf, 0, sizeof(buf));
    ErrorString = DebugGetErrorString();
    v5 = (void *)MEMORY[0x1D17B7244](ErrorString);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v16;
      v20 = 1024;
      v21 = v13;
      v22 = 2080;
      v23 = buf;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@### Error: %d(%s) creating UUID string from type: %@.", (uint8_t *)&v18, 0x26u);

    }
    goto LABEL_10;
  }
  v5 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a1;
    v8 = "%{public}@### UUID type %@ starts with a '0'";
LABEL_8:
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);

  }
LABEL_9:

LABEL_10:
  objc_autoreleasePoolPop(v5);
  v9 = 0;
LABEL_12:

  return v9;
}

@end
