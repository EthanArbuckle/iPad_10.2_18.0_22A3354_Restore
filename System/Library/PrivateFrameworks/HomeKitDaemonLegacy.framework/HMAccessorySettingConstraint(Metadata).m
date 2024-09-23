@implementation HMAccessorySettingConstraint(Metadata)

+ (id)constraintsWithArrayRepresenation:()Metadata
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CBA2C0], "constraintWithDictonaryRepresentation:", v10, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

+ (id)constraintWithDictonaryRepresentation:()Metadata
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("Type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = HMAccessorySettingConstraintTypeFromString();
    v7 = (void *)MEMORY[0x1E0CBA2C0];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueWithType:representation:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = (void *)objc_msgSend([a1 alloc], "initWithType:value:", v6, v9);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)valueWithType:()Metadata representation:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (!v5)
    goto LABEL_14;
  if ((unint64_t)(a3 - 1) < 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid constraint value: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  if (a3 != 4)
    goto LABEL_14;
  v8 = v5;
  objc_opt_class();
  v9 = objc_opt_isKindOfClass() & 1;
  if (v9)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  if (v9)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2B0]), "initWithTitle:", v8);
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid constraint value: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v7 = 0;
  }

LABEL_15:
  return v7;
}

@end
