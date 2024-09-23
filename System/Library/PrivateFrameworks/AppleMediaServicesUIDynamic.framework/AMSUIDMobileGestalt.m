@implementation AMSUIDMobileGestalt

+ (NSString)deviceClass
{
  return (NSString *)MGGetStringAnswer();
}

+ (BOOL)hasHEVCDecoding
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasVenice
{
  return MGGetBoolAnswer();
}

+ (BOOL)isTouchIDSupported
{
  return MGGetBoolAnswer();
}

+ (NSString)productType
{
  return (NSString *)MGGetStringAnswer();
}

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer();
}

+ (NSString)activePairedSystemVersion
{
  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  return (NSString *)(id)qword_1EF24B348;
}

void __48__AMSUIDMobileGestalt_activePairedSystemVersion__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D51778]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  v3 = (void *)qword_1EF24B348;
  qword_1EF24B348 = (uint64_t)v2;

}

+ (BOOL)hasCapabilities:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  uint64_t i;
  void *v10;
  const void *v11;
  const void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v24;
    v8 = (const void *)*MEMORY[0x1E0C9AE50];
    *(_QWORD *)&v5 = 138544130;
    v21 = v5;
    v22 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", &stru_1E7183780, v21) & 1) == 0)
        {
          v11 = (const void *)MGCopyAnswerWithError();
          v12 = v11;
          if (v11)
          {
            CFRelease(v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v13, "OSLogObject");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = v3;
              v16 = v8;
              v17 = objc_opt_class();
              AMSLogKey();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v21;
              v28 = v17;
              v8 = v16;
              v3 = v15;
              v7 = v22;
              v29 = 2114;
              v30 = v18;
              v31 = 2114;
              v32 = v10;
              v33 = 1026;
              v34 = 0;
              _os_log_impl(&dword_1B9D3F000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain capability: %{public}@, %{public}d", buf, 0x26u);

            }
          }
          if (v12 != v8)
          {
            v19 = 0;
            goto LABEL_19;
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      if (v6)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_19:

  return v19;
}

@end
