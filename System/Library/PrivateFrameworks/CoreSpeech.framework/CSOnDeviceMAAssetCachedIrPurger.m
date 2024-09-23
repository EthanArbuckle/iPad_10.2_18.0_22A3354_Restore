@implementation CSOnDeviceMAAssetCachedIrPurger

+ (id)purgeCachedIrForMAAsset:(id)a3 cachedIrDir:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(a3, "getCSAssetOfType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19190], "getCachedIrsFromCSAsset:cachedIrDir:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v9)
    {
      v10 = v9;
      v22 = v7;
      v23 = v6;
      v11 = 0;
      v12 = *(_QWORD *)v26;
      v13 = (os_log_t *)MEMORY[0x1E0D18F60];
      do
      {
        v14 = 0;
        v15 = v11;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v8);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v22, v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v15;
          objc_msgSend(v17, "removeItemAtPath:error:", v16, &v24);
          v11 = v24;

          v18 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v30 = "+[CSOnDeviceMAAssetCachedIrPurger purgeCachedIrForMAAsset:cachedIrDir:]";
            v31 = 2112;
            v32 = v11;
            _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s purging cachedIr with error: %@", buf, 0x16u);
          }
          ++v14;
          v15 = v11;
        }
        while (v10 != v14);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v10);
      v7 = v22;
      v6 = v23;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D18E80];
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 114, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
