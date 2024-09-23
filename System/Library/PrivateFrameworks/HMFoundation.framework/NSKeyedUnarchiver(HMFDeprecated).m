@implementation NSKeyedUnarchiver(HMFDeprecated)

+ (id)deserializeObjectWithData:()HMFDeprecated allowedClasses:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v7, v6, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1A1AC355C]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_19B546000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to unarchive with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

  return v8;
}

+ (id)deserializeObjectWithData:()HMFDeprecated allowedClass:frameworkClasses:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v34 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v34);
  v11 = v34;
  if (!v10)
  {
    v22 = (void *)MEMORY[0x1A1AC355C]();
    v26 = a1;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v27;
      v38 = 2112;
      v39 = v11;
      _os_log_impl(&dword_19B546000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive due to invalid data: %@", buf, 0x16u);

    }
    goto LABEL_18;
  }
  objc_msgSend(v10, "setDecodingFailurePolicy:", 1);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v10, "setClass:forClassName:", a4, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v14);
  }

  v17 = *MEMORY[0x1E0CB2CD0];
  v29 = v11;
  objc_msgSend(v10, "decodeTopLevelObjectOfClass:forKey:error:", a4, v17, &v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v29;

  v20 = objc_msgSend(v10, "finishDecoding");
  if (v18)
    v21 = 1;
  else
    v21 = v19 == 0;
  if (!v21)
  {
    v22 = (void *)MEMORY[0x1A1AC355C](v20);
    v23 = a1;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v25;
      v38 = 2112;
      v39 = v19;
      _os_log_impl(&dword_19B546000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to unarchive with error: %@", buf, 0x16u);

    }
    v11 = v19;
LABEL_18:

    objc_autoreleasePoolPop(v22);
    v18 = 0;
    v19 = v11;
  }

  return v18;
}

@end
