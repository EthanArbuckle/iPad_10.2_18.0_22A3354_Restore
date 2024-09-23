@implementation HMBModelUnsupported

- (id)debugString:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModel hmbCanonicalType](self, "hmbCanonicalType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMBModel hmbCanonicalTypeInferred](self, "hmbCanonicalTypeInferred");
  v7 = &stru_1E8935680;
  if (v6)
    v7 = CFSTR(" (inferred)");
  objc_msgSend(v4, "appendFormat:", CFSTR("values: (%@%@)"), v5, v7);

  -[HMBModel hmbModelID](self, "hmbModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n  uuid: %@"), v9);

  -[HMBModel hmbParentModelID](self, "hmbParentModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n  parent: %@"), v11);

  -[HMBModel hmbDataVersion](self, "hmbDataVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(v4, "appendFormat:", CFSTR("\n  version: %@"), v12);

  v13 = +[HMBModel hmbShouldLogPrivateInformation](HMBModel, "hmbShouldLogPrivateInformation");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMBModel hmbReserved](self, "hmbReserved");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v20, "hasPrefix:", CFSTR("_")) & 1) == 0)
        {
          -[HMBModel hmbReserved](self, "hmbReserved");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "valueForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v23 = CFSTR("...");
            if (v13)
            {
              +[HMBModel formattedStringForValue:](HMBModel, "formattedStringForValue:", v22);
              v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v25, "appendFormat:", CFSTR("\n  %@ (read-only) (unsupported): %@"), v20, v23);
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  return v25;
}

- (void)dumpDebug:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  HMBModelUnsupported *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMBModelUnsupported debugString:](self, "debugString:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D17B6230]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v22 = v14;
          v23 = 2112;
          v24 = v15;
          v25 = 2112;
          v26 = v10;
          _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@%@%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v7);
  }

}

- (void)dumpDebug
{
  -[HMBModelUnsupported dumpDebug:](self, "dumpDebug:", &stru_1E8935680);
}

@end
