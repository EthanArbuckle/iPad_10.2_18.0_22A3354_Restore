@implementation AXMMobileAssetEvaluationNode

- (AXMMobileAssetEvaluationNode)initWithIdentifier:(id)a3
{
  AXMMobileAssetEvaluationNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMMobileAssetEvaluationNode;
  v3 = -[AXMVisionEngineNode initWithIdentifier:](&v5, sel_initWithIdentifier_, a3);
  -[AXMMobileAssetEvaluationNode _downloadAssetsIfNecessary](v3, "_downloadAssetsIfNecessary");
  return v3;
}

- (id)mlModelClasses
{
  NSObject *v2;

  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[AXMMobileAssetEvaluationNode mlModelClasses].cold.1();

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)mobileAssetType
{
  NSObject *v2;

  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[AXMMobileAssetEvaluationNode mobileAssetType].cold.1();

  return &stru_1E6260C18;
}

- (id)modelResourceNames
{
  NSObject *v2;

  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[AXMMobileAssetEvaluationNode modelResourceNames].cold.1();

  return (id)MEMORY[0x1E0C9AA60];
}

- (unint64_t)minSupportedFormatVersion
{
  NSObject *v2;

  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[AXMMobileAssetEvaluationNode minSupportedFormatVersion].cold.1();

  return 1;
}

- (unint64_t)maxSupportedFormatVersion
{
  NSObject *v2;

  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[AXMMobileAssetEvaluationNode minSupportedFormatVersion].cold.1();

  return -1;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (id)modelURLs
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;

  if (modelURLs_onceToken != -1)
    dispatch_once(&modelURLs_onceToken, &__block_literal_global_3);
  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (void *)__ModelURLs;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    v8 = (void *)__ModelURLs;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v10);

  }
  v11 = (void *)__ModelURLs;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v14;
}

void __41__AXMMobileAssetEvaluationNode_modelURLs__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)__ModelURLs;
  __ModelURLs = v0;

}

- (void)setModelURLs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  AXLogAssetLoader();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[AXMMobileAssetEvaluationNode modelURLs](self, "modelURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B0E3B000, v6, OS_LOG_TYPE_INFO, "Setting new model URLs: %@. Replacing old modelURLs: %@", (uint8_t *)&v10, 0x16u);

  }
  -[AXMMobileAssetEvaluationNode modelURLs](self, "modelURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[AXMMobileAssetEvaluationNode modelURLs](self, "modelURLs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v4);

  objc_sync_exit(v5);
}

- (id)contentVersionKey
{
  return CFSTR("_ContentVersion");
}

- (void)_downloadAssetsIfNecessary
{
  void *v3;
  NSURL *mobileAssetBaseURL;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AXMMobileAssetEvaluationNode *v11;

  -[AXMMobileAssetEvaluationNode modelURLs](self, "modelURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    mobileAssetBaseURL = self->_mobileAssetBaseURL;

    if (mobileAssetBaseURL)
      return;
  }
  else
  {

  }
  v5 = objc_alloc(MEMORY[0x1E0D4E050]);
  -[AXMMobileAssetEvaluationNode mobileAssetType](self, "mobileAssetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithType:", v6);

  objc_msgSend(v7, "returnTypes:", 2);
  objc_msgSend(v7, "setDoNotBlockBeforeFirstUnlock:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke;
  v9[3] = &unk_1E625CC70;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(v8, "queryMetaData:", v9);

}

void __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    v34 = (void *)MEMORY[0x1E0D4E038];
    objc_msgSend(*(id *)(a1 + 40), "mobileAssetType");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "startCatalogDownload:then:", v39, &__block_literal_global_214);

  }
  else if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    AXLogAssetLoader();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v38;
      _os_log_impl(&dword_1B0E3B000, v3, OS_LOG_TYPE_INFO, "Retrieved assets: %@", buf, 0xCu);
    }

    v4 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_201;
    v49[3] = &unk_1E625CC00;
    v49[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v38, "ax_filteredArrayUsingBlock:", v49);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogAssetLoader();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "minSupportedFormatVersion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "maxSupportedFormatVersion"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v53 = v37;
      v54 = 2112;
      v55 = v6;
      v56 = 2112;
      v57 = v7;
      _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_INFO, "Supported assets: %@ %@ %@", buf, 0x20u);

    }
    v48[0] = v4;
    v48[1] = 3221225472;
    v48[2] = __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_206;
    v48[3] = &unk_1E625CC28;
    v48[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v37, "sortedArrayUsingComparator:", v48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogAssetLoader();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v9;
      _os_log_impl(&dword_1B0E3B000, v10, OS_LOG_TYPE_INFO, "Found download node asset: %@", buf, 0xCu);
    }

    if (v9)
    {
      objc_msgSend(v9, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = objc_msgSend(v36, "unsignedIntegerValue");
      objc_msgSend(v9, "logAsset");
      if (objc_msgSend(v9, "state") == 2 || objc_msgSend(v9, "state") == 4 || objc_msgSend(v9, "state") == 3)
      {
        if (objc_msgSend(v9, "state") == 2 || objc_msgSend(v9, "state") == 3)
        {
          objc_opt_class();
          obj = (id)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(obj);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(*(id *)(a1 + 40), "modelResourceNames");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v45;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v45 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v19);
                objc_msgSend(v9, "getLocalFileUrl", obj);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "URLByAppendingPathComponent:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v22);

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
            }
            while (v17);
          }

          objc_msgSend(*(id *)(a1 + 40), "setModelURLs:", v15);
          AXMediaLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v15;
            _os_log_impl(&dword_1B0E3B000, v23, OS_LOG_TYPE_INFO, "Adding model URLS: %@", buf, 0xCu);
          }

          objc_msgSend(v9, "getLocalFileUrl");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(a1 + 40);
          v26 = *(void **)(v25 + 80);
          *(_QWORD *)(v25 + 80) = v24;

          AXMediaLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
            *(_DWORD *)buf = 138412546;
            v53 = v28;
            v54 = 2112;
            v55 = v9;
            _os_log_impl(&dword_1B0E3B000, v27, OS_LOG_TYPE_INFO, "Adding base URLS: %@ -> %@", buf, 0x16u);
          }

          if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 80))
          {
            AXMediaLogCommon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B0E3B000, v29, OS_LOG_TYPE_INFO, "No base URL, resetting model URLs", buf, 2u);
            }

            objc_msgSend(*(id *)(a1 + 40), "setModelURLs:", 0);
          }

          objc_sync_exit(obj);
          if ((unint64_t)objc_msgSend(v8, "count") >= 2)
          {
            objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
            if (v31)
            {
              v32 = *(_QWORD *)v41;
              do
              {
                v33 = 0;
                do
                {
                  if (*(_QWORD *)v41 != v32)
                    objc_enumerationMutation(v30);
                  objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v33++), "purge:", &__block_literal_global_212, obj);
                }
                while (v31 != v33);
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
              }
              while (v31);
            }

          }
        }
      }
      else
      {
        objc_msgSend(v9, "startDownload:", &__block_literal_global_210);
      }

    }
  }
}

BOOL __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_201(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  _BOOL8 v6;

  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v5 = 1;
  v6 = v5 >= objc_msgSend(*(id *)(a1 + 32), "minSupportedFormatVersion")
    && v5 <= objc_msgSend(*(id *)(a1 + 32), "maxSupportedFormatVersion");

  return v6;
}

uint64_t __58__AXMMobileAssetEvaluationNode__downloadAssetsIfNecessary__block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(a2, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentVersionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contentVersionKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v12 = objc_msgSend(v8, "compare:", v11);
  else
    v12 = 0;

  return v12;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  void *v13;
  BOOL v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  id obj;
  id v27;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)AXMMobileAssetEvaluationNode;
  v27 = a3;
  v28 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v30, sel_evaluate_metrics_, v27);
  -[AXMMobileAssetEvaluationNode _downloadAssetsIfNecessary](self, "_downloadAssetsIfNecessary");
  if (!self->_mlModels)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    -[AXMMobileAssetEvaluationNode modelURLs](self, "modelURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[AXMMobileAssetEvaluationNode mlModelClasses](self, "mlModelClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = 0;
    *(_QWORD *)&v12 = 138412290;
    v25 = v12;
    while (1)
    {
      -[AXMMobileAssetEvaluationNode mlModelClasses](self, "mlModelClasses", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count") > v11;

      if (!v14)
        break;
      -[AXMMobileAssetEvaluationNode mlModelClasses](self, "mlModelClasses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_msgSend(v15, "objectAtIndexedSubscript:", v11);

      if (v8 == v10)
      {
        -[AXMMobileAssetEvaluationNode modelURLs](self, "modelURLs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = [v16 alloc];
          v29 = 0;
          v20 = (id)objc_msgSend(v19, "initWithContentsOfURL:error:", v18, &v29);
          v21 = v29;
          if (v21)
          {
            AXMediaLogCommon();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v25;
              v32 = v21;
              _os_log_error_impl(&dword_1B0E3B000, v22, OS_LOG_TYPE_ERROR, "Can't load model: %@", buf, 0xCu);
            }
          }
          else
          {
            AXMediaLogCommon();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v32 = v18;
              v33 = 2112;
              v34 = v20;
              _os_log_impl(&dword_1B0E3B000, v22, OS_LOG_TYPE_INFO, "Made model: %@ %@", buf, 0x16u);
            }
          }

          if (v20)
            goto LABEL_13;
        }
      }
      v20 = objc_alloc_init(v16);
      if (v20)
LABEL_13:
        objc_msgSend(v6, "addObject:", v20);

      ++v11;
    }
    objc_sync_exit(obj);

    v23 = objc_msgSend(v6, "count");
    -[AXMMobileAssetEvaluationNode mlModelClasses](self, "mlModelClasses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = v23 == objc_msgSend(v24, "count");

    if ((v23 & 1) != 0)
      objc_storeStrong((id *)&self->_mlModels, v6);

  }
}

- (NSArray)mlModels
{
  return self->_mlModels;
}

- (NSURL)mobileAssetBaseURL
{
  return self->_mobileAssetBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetBaseURL, 0);
  objc_storeStrong((id *)&self->_mlModels, 0);
}

- (void)mlModelClasses
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Need to define mlModelClasses for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)mobileAssetType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Need to define an mobileAssetType for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)modelResourceNames
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Need to define modelResourceNames for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)minSupportedFormatVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Need to define an minSupportedFormatVersion for subclass of AXMMobileAssetEvaluationNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
