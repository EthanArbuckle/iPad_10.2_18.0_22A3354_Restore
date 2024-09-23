@implementation MFCanUseSoftBankCodePoints

void __MFCanUseSoftBankCodePoints_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  unsigned __int8 v15;
  void *context;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  uint8_t v24[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (sInnerCanUseCodePoints == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else if (sInnerCanUseCodePoints)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v2 = MEMORY[0x1AF433BF4]();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    activeContexts();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    context = (void *)v2;
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          sharedCoreTelephonyClient();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          v10 = (void *)objc_msgSend(v9, "copyBundleIdentifier:bundleType:error:", v8, v3, &v17);
          v11 = v17;

          if (v10)
          {
            if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Softbank_jp")) & 1) != 0)
            {

              v13 = 1;
              goto LABEL_19;
            }
          }
          else
          {
            MFLogGeneral();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v11;
              _os_log_error_impl(&dword_1ABB13000, v12, OS_LOG_TYPE_ERROR, "SoftBank: Unable to get bundle ID: %{public}@", buf, 0xCu);
            }

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v5);
    }
    v13 = 0;
LABEL_19:

    objc_autoreleasePoolPop(context);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v13;
    MFLogGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v24 = 67109120;
      v25 = v13;
      _os_log_impl(&dword_1ABB13000, v14, OS_LOG_TYPE_INFO, "SoftBank: has SoftBank carrier: %{BOOL}d", v24, 8u);
    }

    if (v13)
      v15 = 1;
    else
      v15 = 2;
    sInnerCanUseCodePoints = v15;
    atomic_store(v15, (unsigned __int8 *)&sCanUseCodePoints);
  }
}

@end
