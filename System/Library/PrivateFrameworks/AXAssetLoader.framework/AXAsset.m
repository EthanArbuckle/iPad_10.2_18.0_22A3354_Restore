@implementation AXAsset

uint64_t __27__AXAsset_installedAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled");
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (unint64_t)contentVersion
{
  return self->_contentVersion;
}

- (NSURL)localURL
{
  NSURL *localCopyURL;

  localCopyURL = self->_localCopyURL;
  if (!localCopyURL)
    localCopyURL = self->_originalURL;
  return localCopyURL;
}

+ (id)assetsFromMAAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AXAsset *v11;
  AXAsset *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
        v11 = [AXAsset alloc];
        v12 = -[AXAsset initWithMAAsset:](v11, "initWithMAAsset:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (AXAsset)initWithMAAsset:(id)a3
{
  id v5;
  AXAsset *v6;
  AXAsset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXAsset;
  v6 = -[AXAsset init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maAsset, a3);
    -[AXAsset resetPropertiesFromMAAsset:](v7, "resetPropertiesFromMAAsset:", v5);
  }

  return v7;
}

- (void)resetPropertiesFromMAAsset:(id)a3
{
  id v4;
  NSString *v5;
  NSString *assetId;
  NSString *v7;
  NSString *assetType;
  NSURL *v9;
  NSURL *originalURL;
  NSDictionary *v11;
  NSDictionary *properties;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  _Unwind_Exception *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  objc_msgSend(v4, "assetId");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetId = self->_assetId;
  self->_assetId = v5;

  objc_msgSend(v4, "assetType");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetType = self->_assetType;
  self->_assetType = v7;

  self->_isInstalled = -[AXAsset assetStateIsInstalled:](self, "assetStateIsInstalled:", objc_msgSend(v4, "state"));
  self->_isDownloading = objc_msgSend(v4, "state") == 4;
  if (self->_isInstalled)
  {
    objc_msgSend(v4, "getLocalFileUrl");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    originalURL = self->_originalURL;
    self->_originalURL = v9;

  }
  objc_msgSend(v4, "attributes");
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  properties = self->_properties;
  self->_properties = v11;

  self->_formatVersion = 1;
  objc_msgSend(v4, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_formatVersion = objc_msgSend(v14, "unsignedIntegerValue");
  self->_contentVersion = 1;
  objc_msgSend(v4, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_AXContentVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_contentVersion = objc_msgSend(v16, "unsignedIntValue");
  }
  else
  {
    objc_msgSend(v4, "attributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v18 = (_QWORD *)getASAttributeContentVersionSymbolLoc_ptr;
    v30 = getASAttributeContentVersionSymbolLoc_ptr;
    if (!getASAttributeContentVersionSymbolLoc_ptr)
    {
      v19 = (void *)MobileAssetLibrary_1();
      v18 = dlsym(v19, "ASAttributeContentVersion");
      v28[3] = (uint64_t)v18;
      getASAttributeContentVersionSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v27, 8);
    if (!v18)
    {
LABEL_21:
      v26 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init].cold.1();
      _Block_object_dispose(&v27, 8);
      _Unwind_Resume(v26);
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", *v18, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = objc_msgSend(v20, "unsignedIntValue");
    else
      v21 = 0;
    self->_contentVersion = v21;

  }
  self->_compatibilityVersion = 1;
  objc_msgSend(v4, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v23 = (_QWORD *)getASAttributeCompatibilityVersionSymbolLoc_ptr;
  v30 = getASAttributeCompatibilityVersionSymbolLoc_ptr;
  if (!getASAttributeCompatibilityVersionSymbolLoc_ptr)
  {
    v24 = (void *)MobileAssetLibrary_1();
    v23 = dlsym(v24, "ASAttributeCompatibilityVersion");
    v28[3] = (uint64_t)v23;
    getASAttributeCompatibilityVersionSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v27, 8);
  if (!v23)
  {
    -[AXAudiogramIngestionAssetPolicy init].cold.1();
    goto LABEL_21;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", *v23, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_compatibilityVersion = objc_msgSend(v25, "unsignedIntValue");

}

- (BOOL)assetStateIsInstalled:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x6Cu >> a3);
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

+ (id)installedAssets:(id)a3
{
  return (id)objc_msgSend(a3, "ax_filteredArrayUsingBlock:", &__block_literal_global_3);
}

- (NSString)characterVoiceLanguage
{
  void *v2;
  void *v3;

  -[AXAsset properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Language"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)characterVoiceName
{
  void *v2;
  void *v3;

  -[AXAsset properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Character"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)ultronModelName
{
  void *v2;
  void *v3;

  -[AXAsset properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ModelName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isUsingSoundPrint
{
  void *v2;
  void *v3;
  char v4;

  -[AXAsset properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SoundPrint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isOlderThanAsset:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "compatibilityVersion");
  v8 = 1;
  if (v5 <= -[AXAsset compatibilityVersion](self, "compatibilityVersion"))
  {
    v6 = objc_msgSend(v4, "compatibilityVersion");
    if (v6 != -[AXAsset compatibilityVersion](self, "compatibilityVersion")
      || (v7 = objc_msgSend(v4, "contentVersion"), v7 <= -[AXAsset contentVersion](self, "contentVersion")))
    {
      v8 = 0;
    }
  }

  return v8;
}

- (AXImageCaptionModel)imageCaptionModel
{
  void *v2;
  void *v3;
  AXImageCaptionModel *v4;

  -[AXAsset properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[AXImageCaptionModel initWithModelProperties:]([AXImageCaptionModel alloc], "initWithModelProperties:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)assertionForVersionLockedImageCaptionModelAsset:(id)a3
{
  id v4;
  AXImageCaptionModelAssetAssertion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(AXImageCaptionModelAssetAssertion);
  -[AXImageCaptionModelAssetAssertion setAssertionType:](v5, "setAssertionType:", 0);
  -[AXImageCaptionModelAssetAssertion setClientIdentifier:](v5, "setClientIdentifier:", v4);

  -[AXAsset imageCaptionModel](self, "imageCaptionModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setModelVersion:](v5, "setModelVersion:", v7);

  objc_msgSend(v6, "stage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setModelStage:](v5, "setModelStage:", v8);

  objc_msgSend(v6, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModelAssetAssertion setModelLanguage:](v5, "setModelLanguage:", v9);

  return v5;
}

+ (id)newsestCompatibleImageCaptionModelAssetFromAssets:(id)a3 withStage:(id)a4 language:(id)a5 isInstalled:(BOOL)a6 isDownloadable:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  int64_t v15;
  NSObject *v16;
  const __CFString *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  _BOOL8 v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  const char *v37;
  id v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id v49;
  int64_t v50;
  int64_t v51;
  BOOL v52;
  BOOL v53;
  uint8_t v54[128];
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  int64_t v60;
  uint64_t v61;

  v7 = a7;
  v8 = a6;
  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = +[AXImageCaptionModelAssetPolicy minimumCompatibilityVersion](AXImageCaptionModelAssetPolicy, "minimumCompatibilityVersion");
  v15 = +[AXImageCaptionModelAssetPolicy maximumCompatibilityVersion](AXImageCaptionModelAssetPolicy, "maximumCompatibilityVersion");
  AXLogAssetLoader();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = &stru_1E95D4460;
    if (v8)
      v17 = CFSTR("installed");
    *(_DWORD *)buf = 138412802;
    if (v7)
      v17 = CFSTR("downloadable");
    v56 = v17;
    v57 = 2048;
    v58 = v14;
    v59 = 2048;
    v60 = v15;
    _os_log_impl(&dword_1D3F8E000, v16, OS_LOG_TYPE_INFO, "Finding newest %@ compatible image caption model asset. Compat version range %ld-%ld", buf, 0x20u);
  }

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __126__AXAsset_ImageCaptionModel__newsestCompatibleImageCaptionModelAssetFromAssets_withStage_language_isInstalled_isDownloadable___block_invoke;
  v47[3] = &unk_1E95D3D90;
  v52 = v8;
  v53 = v7;
  v50 = v14;
  v51 = v15;
  v18 = v12;
  v48 = v18;
  v19 = v13;
  v49 = v19;
  objc_msgSend(v11, "ax_filteredArrayUsingBlock:", v47);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (!v20)
  {
LABEL_29:
    if (v8)
    {
      AXLogAssetLoader();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v37 = "No installed compatible image caption model asset found";
LABEL_35:
        _os_log_impl(&dword_1D3F8E000, v33, OS_LOG_TYPE_INFO, v37, buf, 2u);
      }
    }
    else
    {
      if (!v7)
      {
        v22 = 0;
        goto LABEL_38;
      }
      AXLogAssetLoader();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v37 = "No downloadable compatible image caption model asset found (it may already be downloaded/installed though!)";
        goto LABEL_35;
      }
    }
    v22 = 0;
    goto LABEL_37;
  }
  v21 = v20;
  v39 = v19;
  v40 = v18;
  v41 = v11;
  v22 = 0;
  v23 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      v25 = v8;
      v26 = v7;
      if (*(_QWORD *)v44 != v23)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v27, "imageCaptionModel", v39, v40, v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "version");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        goto LABEL_18;
      if (!v22)
      {
        v22 = v27;
LABEL_18:
        v7 = v26;
        goto LABEL_19;
      }
      objc_msgSend(v22, "imageCaptionModel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "version");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v29, "compare:options:", v31, 64) == 1)
      {
        v32 = v27;

        v22 = v32;
      }
      v7 = v26;

LABEL_19:
      v8 = v25;

    }
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  }
  while (v21);
  v18 = v40;
  v11 = v41;
  v19 = v39;
  if (!v22)
    goto LABEL_29;
  AXLogAssetLoader();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = &stru_1E95D4460;
    if (v25)
      v34 = CFSTR("installed");
    if (v7)
      v35 = CFSTR("downloadable");
    else
      v35 = v34;
    objc_msgSend(v22, "imageCaptionModel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v56 = v35;
    v57 = 2112;
    v58 = (int64_t)v22;
    v59 = 2112;
    v60 = (int64_t)v36;
    _os_log_impl(&dword_1D3F8E000, v33, OS_LOG_TYPE_INFO, "Returning newest %@ compatible image caption model asset: %@ (%@)", buf, 0x20u);

  }
LABEL_37:

LABEL_38:
  return v22;
}

uint64_t __126__AXAsset_ImageCaptionModel__newsestCompatibleImageCaptionModelAssetFromAssets_withStage_language_isInstalled_isDownloadable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a2;
  v4 = v3;
  if ((!*(_BYTE *)(a1 + 64) || objc_msgSend(v3, "isInstalled"))
    && (!*(_BYTE *)(a1 + 65) || (objc_msgSend(v4, "isInstalled") & 1) == 0)
    && (unint64_t)objc_msgSend(v4, "compatibilityVersion") >= *(_QWORD *)(a1 + 48)
    && (unint64_t)objc_msgSend(v4, "compatibilityVersion") <= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v4, "imageCaptionModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "stage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      {
        objc_msgSend(v8, "language");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if ((v11 & 1) != 0)
        {
          v5 = 1;
LABEL_15:

          goto LABEL_8;
        }
      }
      else
      {

      }
    }
    v5 = 0;
    goto LABEL_15;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (void)refreshMAAsset
{
  void *v3;
  void *v4;
  id v5;

  -[AXAsset maAsset](self, "maAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXAsset maAsset](self, "maAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshState");

    -[AXAsset maAsset](self, "maAsset");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AXAsset resetPropertiesFromMAAsset:](self, "resetPropertiesFromMAAsset:", v5);

  }
}

- (void)attachProgressHandlerIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_didAttachProgressHandler)
  {
    v7 = v4;
    -[AXAsset maAsset](self, "maAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      self->_didAttachProgressHandler = 1;
      objc_msgSend(v5, "attachProgressCallBack:", v7);
    }

    v4 = v7;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)AXAsset;
  -[AXAsset description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAsset assetId](self, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAsset assetType](self, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXAsset isInstalled](self, "isInstalled"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[AXAsset isDownloading](self, "isDownloading"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = -[AXAsset compatibilityVersion](self, "compatibilityVersion");
  v10 = -[AXAsset contentVersion](self, "contentVersion");
  v11 = -[AXAsset formatVersion](self, "formatVersion");
  -[AXAsset localURL](self, "localURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, AssetID=%@, Type=%@, Installed=%@, Downloading=%@ compatVers=%lu, contentVers=%lu, fmtVers=%lu, localURL=%@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEquivalentToMAAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AXAsset maAsset](self, "maAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXAsset assetId](self, "assetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSNumber)downloadSize
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[AXAsset properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getASAttributeDownloadSizeSymbolLoc_ptr;
  v11 = getASAttributeDownloadSizeSymbolLoc_ptr;
  if (!getASAttributeDownloadSizeSymbolLoc_ptr)
  {
    v4 = (void *)MobileAssetLibrary_1();
    v3 = dlsym(v4, "ASAttributeDownloadSize");
    v9[3] = (uint64_t)v3;
    getASAttributeDownloadSizeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(v2, "objectForKey:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (NSNumber)unarchivedFileSize
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[AXAsset properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getASAttributeUnarchivedSizeSymbolLoc_ptr;
  v11 = getASAttributeUnarchivedSizeSymbolLoc_ptr;
  if (!getASAttributeUnarchivedSizeSymbolLoc_ptr)
  {
    v4 = (void *)MobileAssetLibrary_1();
    v3 = dlsym(v4, "ASAttributeUnarchivedSize");
    v9[3] = (uint64_t)v3;
    getASAttributeUnarchivedSizeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(v2, "objectForKey:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (NSNumber)computedOnDiskSize
{
  NSNumber *cachedComputedOnDiskSize;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSNumber *v15;
  NSNumber *v16;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  _QWORD v46[6];

  v46[3] = *MEMORY[0x1E0C80C00];
  cachedComputedOnDiskSize = self->_cachedComputedOnDiskSize;
  if (!cachedComputedOnDiskSize)
  {
    -[AXAsset localURL](self, "localURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *MEMORY[0x1E0C99A18];
      v4 = *MEMORY[0x1E0C99900];
      v46[0] = *MEMORY[0x1E0C99A18];
      v46[1] = v4;
      v25 = v4;
      v5 = *MEMORY[0x1E0C99AC0];
      v46[2] = *MEMORY[0x1E0C99AC0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__1;
      v39 = __Block_byref_object_dispose__1;
      v40 = 0;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __29__AXAsset_computedOnDiskSize__block_invoke;
      v34[3] = &unk_1E95D3DD0;
      v34[4] = &v35;
      v24 = (void *)MEMORY[0x1D8256430](v34);
      objc_msgSend(v23, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v26, v22, 0, v24);
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v31;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v31 != v9)
              objc_enumerationMutation(v6);
            if (v36[5])
            {
              AXLogCommon();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v26, "path");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v36[5];
                *(_DWORD *)buf = 138412546;
                v42 = v19;
                v43 = 2112;
                v44 = v20;
                _os_log_impl(&dword_1D3F8E000, v18, OS_LOG_TYPE_DEFAULT, "Error calculating size of item: %@. %@", buf, 0x16u);

              }
              _Block_object_dispose(&v35, 8);

              return (NSNumber *)0;
            }
            v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
            v29 = 0;
            objc_msgSend(v11, "getResourceValue:forKey:error:", &v29, v3, 0);
            v12 = v29;
            if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
            {
              v28 = 0;
              objc_msgSend(v11, "getResourceValue:forKey:error:", &v28, v5, 0);
              v13 = v28;
              if (objc_msgSend(v13, "unsignedLongLongValue"))
              {
                v7 += objc_msgSend(v13, "unsignedLongLongValue");
              }
              else
              {
                v27 = 0;
                objc_msgSend(v11, "getResourceValue:forKey:error:", &v27, v25, 0);
                v14 = v27;

                if (objc_msgSend(v14, "unsignedLongLongValue"))
                  v7 += objc_msgSend(v14, "unsignedLongLongValue");
                v13 = v14;
              }

            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
          if (v8)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
      v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v16 = self->_cachedComputedOnDiskSize;
      self->_cachedComputedOnDiskSize = v15;

      _Block_object_dispose(&v35, 8);
    }

    cachedComputedOnDiskSize = self->_cachedComputedOnDiskSize;
  }
  return cachedComputedOnDiskSize;
}

uint64_t __29__AXAsset_computedOnDiskSize__block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXAsset isInstalled](self, "isInstalled"), CFSTR("isInstalled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AXAsset isDownloading](self, "isDownloading"), CFSTR("isDownloading"));
  -[AXAsset assetId](self, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetId"));

  -[AXAsset assetType](self, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetType"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXAsset compatibilityVersion](self, "compatibilityVersion"), CFSTR("compatibilityVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXAsset contentVersion](self, "contentVersion"), CFSTR("contentVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXAsset formatVersion](self, "formatVersion"), CFSTR("formatVersion"));
  -[AXAsset originalURL](self, "originalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("originalURL"));

  -[AXAsset properties](self, "properties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("properties"));

}

- (AXAsset)initWithCoder:(id)a3
{
  id v4;
  AXAsset *v5;
  uint64_t v6;
  NSString *assetId;
  uint64_t v8;
  NSString *assetType;
  uint64_t v10;
  NSURL *originalURL;
  uint64_t v12;
  NSDictionary *properties;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXAsset;
  v5 = -[AXAsset init](&v15, sel_init);
  if (v5)
  {
    v5->_isInstalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInstalled"));
    v5->_isDownloading = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDownloading"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetId"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    v5->_compatibilityVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compatibilityVersion"));
    v5->_contentVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentVersion"));
    v5->_formatVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("formatVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    originalURL = v5->_originalURL;
    v5->_originalURL = (NSURL *)v10;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("properties"));
    v12 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v12;

  }
  return v5;
}

+ (id)archivedAssets:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)unarchivedAssets:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v9, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)downloadableAssets:(id)a3
{
  return (id)objc_msgSend(a3, "ax_filteredArrayUsingBlock:", &__block_literal_global_216);
}

uint64_t __30__AXAsset_downloadableAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled") ^ 1;
}

- (id)assetInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAsset assetId](self, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AssetID"));

  -[AXAsset assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AssetType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXAsset contentVersion](self, "contentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ContentVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXAsset compatibilityVersion](self, "compatibilityVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("CompatibilityVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXAsset formatVersion](self, "formatVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("FormatVersion"));

  -[AXAsset properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("UserInfo"));

  -[AXAsset downloadSize](self, "downloadSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("DownloadSize"));

  -[AXAsset unarchivedFileSize](self, "unarchivedFileSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("UnarchivedSize"));

  return v3;
}

- (void)copyLocally
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3F8E000, v0, v1, "Could not create clone directory for asset: %@. error: %@");
  OUTLINED_FUNCTION_2();
}

- (NSString)assetId
{
  return self->_assetId;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalURL, a3);
}

- (NSURL)localCopyURL
{
  return self->_localCopyURL;
}

- (void)setLocalCopyURL:(id)a3
{
  objc_storeStrong((id *)&self->_localCopyURL, a3);
}

- (MAAsset)maAsset
{
  return self->_maAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maAsset, 0);
  objc_storeStrong((id *)&self->_localCopyURL, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_cachedComputedOnDiskSize, 0);
}

@end
