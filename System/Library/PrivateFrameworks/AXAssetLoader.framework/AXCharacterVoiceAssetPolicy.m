@implementation AXCharacterVoiceAssetPolicy

+ (id)characterVoiceAssetPolicyWithLanguage:(id)a3
{
  id v3;
  AXCharacterVoiceAssetPolicy *v4;

  v3 = a3;
  v4 = objc_alloc_init(AXCharacterVoiceAssetPolicy);
  -[AXCharacterVoiceAssetPolicy setLanguage:](v4, "setLanguage:", v3);

  return v4;
}

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.CharacterVoices");
}

- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  if (objc_msgSend(v5, "formatVersion") == 1)
  {
    -[AXCharacterVoiceAssetPolicy language](self, "language");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "characterVoiceLanguage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXCharacterVoiceAssetPolicy language](self, "language");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t j;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  id v28;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXCharacterVoiceAssetPolicy language](self, "language");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogCharacterVoices();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v34;
    _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_DEFAULT, "Purging mickey assets: language: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "characterVoiceLanguage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v34);

        if (v13)
        {
          objc_msgSend(v11, "characterVoiceName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "characterVoiceName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v16, v17);

          }
          objc_msgSend(v11, "characterVoiceName");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v11);
          AXLogCharacterVoices();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v11;
            _os_log_impl(&dword_1D3F8E000, v18, OS_LOG_TYPE_DEFAULT, "Asset doesn't match language, purging: %@", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = v36;
  objc_msgSend(v36, "allKeys");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v35)
  {
    v32 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(v30);
        objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v22, "count") >= 2)
        {
          v24 = 1;
          do
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "contentVersion");
            if (v26 > objc_msgSend(v23, "contentVersion"))
            {
              AXLogCharacterVoices();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v46 = v25;
                v47 = 2112;
                v48 = v23;
                _os_log_impl(&dword_1D3F8E000, v27, OS_LOG_TYPE_DEFAULT, "Asset is newer than current asset, purging: %@ > %@", buf, 0x16u);
              }

              objc_msgSend(v6, "addObject:", v23);
              v28 = v25;

              v23 = v28;
            }

            ++v24;
          }
          while (v24 < objc_msgSend(v22, "count"));
        }
        v20 = v36;
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v23, v36);

      }
      v35 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v35);
  }

  return v6;
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)AXCharacterVoiceAssetPolicy;
  -[AXAssetPolicy downloadOptionsForOperation:userInitiated:](&v8, sel_downloadOptionsForOperation_userInitiated_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  return v6;
}

- (AXCharacterVoiceAssetPolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXCharacterVoiceAssetPolicy;
  return -[AXAssetPolicy init](&v3, sel_init);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
}

@end
