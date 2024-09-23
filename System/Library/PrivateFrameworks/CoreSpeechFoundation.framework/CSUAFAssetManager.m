@implementation CSUAFAssetManager

- (id)_initWithForceSetIsExclave:(BOOL)a3
{
  CSUAFAssetManager *v5;
  CSUAFAssetManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v5 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CSUAFAssetManager;
    v6 = -[CSUAFAssetManager init](&v10, sel_init);
    if (v6)
    {
      v7 = dispatch_queue_create("CSUAFAssetManager queue", 0);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v7;

      v6->_isExclaveHardware = a3;
    }
    self = v6;
    v5 = self;
  }

  return v5;
}

- (CSUAFAssetManager)init
{
  return (CSUAFAssetManager *)-[CSUAFAssetManager _initWithForceSetIsExclave:](self, "_initWithForceSetIsExclave:", +[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"));
}

- (void)getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__CSUAFAssetManager_getInstalledAssetofType_forLocale_completion___block_invoke;
  v13[3] = &unk_1E687F048;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)_getInstalledAssetofType:(unint64_t)a3 forLocale:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UAFAssetSet *v23;
  UAFAssetSet *assetSet;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __67__CSUAFAssetManager__getInstalledAssetofType_forLocale_completion___block_invoke;
  v48[3] = &unk_1E687F070;
  v10 = v9;
  v49 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E468D0](v48);
  if (a3 && a3 != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported assetType: %lu"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v68 = CFSTR("reason");
    v69[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    v18 = 2152;
    goto LABEL_6;
  }
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "bypassTrialAssets");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UAF honoring Trial asset bypass is set"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v66 = CFSTR("reason");
    v67 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = 1601;
LABEL_6:
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), v18, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v20);
    goto LABEL_25;
  }
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5DE8], "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = CFSTR("attention.language");
  v65 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "retrieveAssetSet:usages:", CFSTR("com.apple.siri.understanding"), v22);
  v23 = (UAFAssetSet *)objc_claimAutoreleasedReturnValue();
  assetSet = self->_assetSet;
  self->_assetSet = v23;

  if (a3)
    v25 = CFSTR("com.apple.siri.sp.mitigation");
  else
    v25 = CFSTR("com.apple.siri.sp.invocation");
  -[UAFAssetSet assetNamed:](self->_assetSet, "assetNamed:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v26;
  if (!v26)
    goto LABEL_19;
  objc_msgSend(v26, "metadata");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_19;
  v28 = (void *)v27;
  objc_msgSend(v20, "metadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("locale"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v20, "metadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("locale"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqualToString:", v33) & 1) != 0)
    {
      objc_msgSend(v20, "location");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("version"));
      v47 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v47;
      if (v35 && v47)
      {
        v38 = CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v51 = "-[CSUAFAssetManager _getInstalledAssetofType:forLocale:completion:]";
          v52 = 2048;
          v53 = a3;
          v54 = 2112;
          v55 = v8;
          v56 = 2112;
          v57 = v47;
          _os_log_impl(&dword_1B502E000, v38, OS_LOG_TYPE_DEFAULT, "%s Got UAF Asset for assetType: %lu for locale: %@ version: %@", buf, 0x2Au);
        }
        +[CSAsset assetForAssetType:resourcePath:configVersion:assetProvider:identity:assistantLanguageCode:](CSAsset, "assetForAssetType:resourcePath:configVersion:assetProvider:identity:assistantLanguageCode:", a3, v35, v47, 2, 0, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v39, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UAF asset path || version missing: %@"), v25);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E0CB35C8];
        v58 = CFSTR("reason");
        v59 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2151, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v46);
        v37 = (void *)v47;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatch between Current locale: %@ & UAFAsset locale: %@"), v8, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0CB35C8];
      v60 = CFSTR("reason");
      v61 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 1601, v43);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v37);
    }

  }
  else
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get UAF asset: %@"), v25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v62 = CFSTR("reason");
    v63 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2151, v41);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v35);
  }

LABEL_25:
}

- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CSUAFAssetManager_mapAssetToExclaveKit_completion___block_invoke;
  block[3] = &unk_1E687F5D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_mapAssetToExclaveKitForAssetName:(id)a3 asset:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  UAFAssetSet *v13;
  UAFAssetSet *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  UAFAssetSet *v25;
  id v26;
  CSUAFAssetManager *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD);
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke;
  v30[3] = &unk_1E687F098;
  v11 = v9;
  v31 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E468D0](v30);
  v13 = self->_assetSet;
  v14 = v13;
  if (a4)
  {
    if (self->_isExclaveHardware)
    {
      if (v8 && v13)
        goto LABEL_16;
      v15 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
        _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Asset is nil. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
      }
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = &unk_1E68A1630;
      v18 = 2153;
    }
    else
    {
      v20 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
        _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s The hardware does not support secure exclave. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
      }
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = &unk_1E68A1608;
      v18 = 2155;
    }
  }
  else
  {
    v19 = CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
      _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s Asset is nil. Not starting Secure Mobile Asset Loader Service", buf, 0xCu);
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = &unk_1E68A15E0;
    v18 = 2151;
  }
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), v18, v17);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    ((void (**)(_QWORD, id))v12)[2](v12, v21);
    goto LABEL_19;
  }
LABEL_16:
  v22 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]";
    v34 = 2112;
    v35 = CFSTR("com.apple.siri.sp.invocation");
    _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s Mapping asset %@ to ExclaveKit", buf, 0x16u);
  }
  +[CSExclaveAssetManagerProxy sharedManager](CSExclaveAssetManagerProxy, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_224;
  v24[3] = &unk_1E687F110;
  v25 = v14;
  v26 = v8;
  v27 = self;
  v28 = v23;
  v29 = v12;
  v21 = v23;
  objc_msgSend(v21, "stopSecureMobileAssetLoaderService:", v24);

LABEL_19:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetSet, 0);
}

uint64_t __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_224(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2;
  v5[3] = &unk_1E687F0E8;
  v2 = *(void **)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[1] = 3221225472;
  v6 = v2;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v3, "mapAsset:queue:completion:", v4, 0, v5);

}

void __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[CSUAFAssetManager _mapAssetToExclaveKitForAssetName:asset:completion:]_block_invoke_2";
    v16 = 2112;
    v17 = CFSTR("com.apple.siri.sp.invocation");
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Mapping asset %@ to ExclaveKit completed with error %@", buf, 0x20u);
  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_225;
  v9[3] = &unk_1E687F0C0;
  v10 = v5;
  v13 = 0;
  v7 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v7;
  v8 = v3;
  dispatch_async(v6, v9);

}

void __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_225(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2_226;
  v4[3] = &unk_1E6881160;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "startSecureMobileAssetLoaderService:completion:", v3, v4);

}

uint64_t __72__CSUAFAssetManager__mapAssetToExclaveKitForAssetName_asset_completion___block_invoke_2_226(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __53__CSUAFAssetManager_mapAssetToExclaveKit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[CSUAFAssetManager mapAssetToExclaveKit:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("com.apple.siri.sp.invocation");
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Mapping asset %@ to ExclaveKit", (uint8_t *)&v4, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_mapAssetToExclaveKitForAssetName:asset:completion:", CFSTR("com.apple.siri.sp.invocation"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __67__CSUAFAssetManager__getInstalledAssetofType_forLocale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v7 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[CSUAFAssetManager _getInstalledAssetofType:forLocale:completion:]_block_invoke";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s %@ - %@", (uint8_t *)&v12, 0x20u);

    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

uint64_t __66__CSUAFAssetManager_getInstalledAssetofType_forLocale_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getInstalledAssetofType:forLocale:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)sharedInstance
{
  id v2;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v2 = 0;
  }
  else
  {
    if ((+[CSUtils supportsUnderstandingOnDevice](CSUtils, "supportsUnderstandingOnDevice")
       || +[CSUtils supportsHybridUnderstandingOnDevice](CSUtils, "supportsHybridUnderstandingOnDevice"))
      && sharedInstance_onceToken_5594 != -1)
    {
      dispatch_once(&sharedInstance_onceToken_5594, &__block_literal_global_5595);
    }
    v2 = (id)sharedInstance_sharedManager_5596;
  }
  return v2;
}

void __35__CSUAFAssetManager_sharedInstance__block_invoke()
{
  CSUAFAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSUAFAssetManager);
  v1 = (void *)sharedInstance_sharedManager_5596;
  sharedInstance_sharedManager_5596 = (uint64_t)v0;

}

@end
