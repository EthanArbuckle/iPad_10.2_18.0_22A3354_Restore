@implementation CSTrialAssetManager

- (CSTrialAssetManager)init
{
  CSTrialAssetManager *v3;
  CSTrialAssetManager *v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSDictionary *trialClientDict;
  _QWORD v16[4];
  NSDictionary *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CSTrialAssetManager;
    v4 = -[CSTrialAssetManager init](&v22, sel_init);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D19260], "supportTrialMitigationAssets"))
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E7C63E48, &unk_1E7C63E60, 0);
      else
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E7C63E78, &unk_1E7C63E90, 0);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        v10 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v6);
            v12 = (void *)MEMORY[0x1E0D19260];
            v13 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedIntegerValue");
            v16[0] = v10;
            v16[1] = 3221225472;
            v16[2] = __27__CSTrialAssetManager_init__block_invoke;
            v16[3] = &unk_1E7C28AE0;
            v17 = v5;
            objc_msgSend(v12, "getTrialIdsForAssetType:withCompletion:", v13, v16);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v8);
      }

      trialClientDict = v4->_trialClientDict;
      v4->_trialClientDict = v5;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)_getSiriAttAssetsForType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D19260];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__CSTrialAssetManager__getSiriAttAssetsForType_forLocale_completion___block_invoke;
  v13[3] = &unk_1E7C28B08;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "getTrialIdsForAssetType:withCompletion:", a3, v13);

}

- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3 != 6 && a3)
  {
    v11 = (void *)MEMORY[0x1E0D19260];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__CSTrialAssetManager_getInstalledAssetofType_forLocale_completion___block_invoke;
    v12[3] = &unk_1E7C28B30;
    v12[4] = self;
    v13 = v9;
    v14 = a3;
    objc_msgSend(v11, "getTrialIdsForAssetType:withCompletion:", a3, v12);

  }
  else
  {
    -[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:](self, "_getSiriAttAssetsForType:forLocale:completion:", a3, v8, v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClientDict, 0);
}

void __68__CSTrialAssetManager_getInstalledAssetofType_forLocale_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refresh");
  objc_msgSend(v5, "levelForFactor:withNamespaceName:", CFSTR("AssetData"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "fileValue"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "path"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(v7, "fileValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "levelForFactor:withNamespaceName:", CFSTR("isAssetArchived"), v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && objc_msgSend(v12, "BOOLeanValue"))
    {
      objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trialBaseAssetDirectory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[CSAssetController getAssetTypeStringForType:](CSAssetController, "getAssetTypeStringForType:", a1[6]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("TrialAssetData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "levelForFactor:withNamespaceName:", CFSTR("AssetVersion"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0D18FC0];
    v18 = a1[6];
    objc_msgSend(v7, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetForAssetType:resourcePath:configVersion:assetProvider:", v18, v11, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get Trial asset from path: %@"), v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[CSTrialAssetManager getInstalledAssetofType:forLocale:completion:]_block_invoke";
        v41 = 2112;
        v42 = v29;
        _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0D18E80];
      v35 = CFSTR("reason");
      v36 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 1601, v33);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v34 = a1[5];
    if (v34)
      (*(void (**)(uint64_t, void *, void *))(v34 + 16))(v34, v20, v21);

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "fileValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Unable to get Trial asset from path: %@"), v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[CSTrialAssetManager getInstalledAssetofType:forLocale:completion:]_block_invoke";
      v41 = 2112;
      v42 = v20;
      _os_log_error_impl(&dword_1C2614000, v25, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D18E80];
    v37 = CFSTR("reason");
    v38 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 1601, v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __69__CSTrialAssetManager__getSiriAttAssetsForType_forLocale_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void **v27;
  const __CFString **v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refresh");
  v7 = *(_QWORD *)(a1 + 56);
  v8 = CFSTR("com.apple.siri.sp.mitigation");
  if (v7 != 6)
    v8 = 0;
  if (v7)
    v9 = v8;
  else
    v9 = CFSTR("com.apple.siri.sp.invocation");
  objc_msgSend(*(id *)(a1 + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UAFLevelForFactor:withNamespaceName:withLanguage:", v9, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "directoryValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("version"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("locale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 136315906;
    v40 = "-[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:]_block_invoke";
    v41 = 2048;
    v42 = v19;
    v43 = 2112;
    v44 = v17;
    v45 = 2112;
    v46 = v15;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Got Trial rollout for assetType: %lu for locale: %@ version: %@", buf, 0x2Au);
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __69__CSTrialAssetManager__getSiriAttAssetsForType_forLocale_completion___block_invoke_29;
  v31[3] = &unk_1E7C28D20;
  v32 = *(id *)(a1 + 48);
  v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v31);
  if (v13 && v15 && v17)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v17) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "bypassTrialAssets");

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0D18FC0], "assetForAssetType:resourcePath:configVersion:assetProvider:", *(_QWORD *)(a1 + 56), v13, v15, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v20)[2](v20, v23, 0);
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trial asset bypass is set"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D18E80];
      v33 = CFSTR("reason");
      v34 = v23;
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v34;
      v28 = &v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatch between Current locale: %@ & Trial rollout locale: %@"), *(_QWORD *)(a1 + 40), v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D18E80];
      v35 = CFSTR("reason");
      v36 = v23;
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v36;
      v28 = &v35;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get Trial factor: %@"), v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D18E80];
    v37 = CFSTR("reason");
    v38 = v23;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = &v38;
    v28 = &v37;
  }
  objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 1601, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, _QWORD, void *))v20)[2](v20, 0, v30);
LABEL_17:

}

void __69__CSTrialAssetManager__getSiriAttAssetsForType_forLocale_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[CSTrialAssetManager _getSiriAttAssetsForType:forLocale:completion:]_block_invoke";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s %@ - %@", (uint8_t *)&v12, 0x20u);

    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

void __27__CSTrialAssetManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25301 != -1)
    dispatch_once(&sharedInstance_onceToken_25301, &__block_literal_global_25302);
  return (id)sharedInstance_sharedManager_25303;
}

void __37__CSTrialAssetManager_sharedInstance__block_invoke()
{
  CSTrialAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSTrialAssetManager);
  v1 = (void *)sharedInstance_sharedManager_25303;
  sharedInstance_sharedManager_25303 = (uint64_t)v0;

}

@end
