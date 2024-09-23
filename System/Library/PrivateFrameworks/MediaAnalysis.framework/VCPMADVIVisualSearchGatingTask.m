@implementation VCPMADVIVisualSearchGatingTask

- (VCPMADVIVisualSearchGatingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVIVisualSearchGatingTask *v12;
  VCPMADVIVisualSearchGatingTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIVisualSearchGatingTask;
  v12 = -[VCPMADVIVisualSearchGatingTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVIVisualSearchGatingTask", 0);
    cancelQueue = v13->_cancelQueue;
    v13->_cancelQueue = (OS_dispatch_queue *)v14;

  }
  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  objc_class *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:imageAsset:andSignpostPayload:", v8, v9, v10);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v17, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setPreferredMetalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, a3);
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  NSObject *cancelQueue;
  _QWORD block[5];

  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCPMADVIVisualSearchGatingTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __40__VCPMADVIVisualSearchGatingTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancel");
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  return result;
}

- (id)createQueryContextWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MTLDevice *preferredMetalDevice;
  void *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADVIVisualSearchGatingRequest queryID](self->_request, "queryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MADVIVisualSearchGatingRequest queryID](self->_request, "queryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC6F28]);

  }
  -[MADVIVisualSearchGatingRequest location](self->_request, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (_QWORD *)MEMORY[0x1E0DC6F18];
  if (v8)
  {
    -[MADVIVisualSearchGatingRequest location](self->_request, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *v9);

  }
  -[MADVIVisualSearchGatingRequest imageType](self->_request, "imageType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (_QWORD *)MEMORY[0x1E0DC6F08];
  if (v11)
  {
    -[MADVIVisualSearchGatingRequest imageType](self->_request, "imageType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *v12);

  }
  -[MADVIVisualSearchGatingRequest featureIdentifier](self->_request, "featureIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MADVIVisualSearchGatingRequest featureIdentifier](self->_request, "featureIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DC6F00]);

  }
  -[VCPMADServiceImageAsset location](self->_imageAsset, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[VCPMADServiceImageAsset location](self->_imageAsset, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *v9);

  }
  if (-[VCPMADServiceImageAsset isScreenshot](self->_imageAsset, "isScreenshot"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6B74480, *v12);
  -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC6EE8]);

  }
  preferredMetalDevice = self->_preferredMetalDevice;
  if (preferredMetalDevice)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", preferredMetalDevice, *MEMORY[0x1E0DC6F20]);
  -[MADVIVisualSearchGatingRequest imageURL](self->_request, "imageURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (_QWORD *)MEMORY[0x1E0DC6F10];
  if (v21)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("<redacted>"), *MEMORY[0x1E0DC6F10]);
  -[MADVIVisualSearchGatingRequest referralURL](self->_request, "referralURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (_QWORD *)MEMORY[0x1E0DC6F30];
  if (v23)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("<redacted>"), *MEMORY[0x1E0DC6F30]);
  -[MADVIVisualSearchGatingRequest engagementSuggestionType](self->_request, "engagementSuggestionType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[MADVIVisualSearchGatingRequest engagementSuggestionType](self->_request, "engagementSuggestionType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0DC6EF8]);

  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Query context: %@", buf, 0xCu);
  }
  -[MADVIVisualSearchGatingRequest imageURL](self->_request, "imageURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (!v28)
  {
    -[MADVIVisualSearchGatingRequest imageURL](self->_request, "imageURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, *v22);

  }
  -[MADVIVisualSearchGatingRequest referralURL](self->_request, "referralURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 == 0;

  if (!v31)
  {
    -[MADVIVisualSearchGatingRequest referralURL](self->_request, "referralURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, *v24);

  }
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0DC6E80], "contextWithDictionary:error:", v5, &v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v37;
  v35 = v37;
  if (a3)
    objc_storeStrong(a3, v34);

  return v33;
}

- (void)storeResults:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  MADVIVisualSearchGatingRequest *request;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  VCPMADVIVisualSearchGatingTask *v31;
  id v32;
  id obj;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v31 = self;
  v52 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v32, "visualUnderstanding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageRegions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v36 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v46;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v38);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array", v31);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v37 = v5;
        objc_msgSend(v5, "domainInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v42;
          v39 = v6;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v42 != v8)
                objc_enumerationMutation(v39);
              v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v9);
              v11 = objc_alloc(MEMORY[0x1E0D47818]);
              objc_msgSend(v10, "domainKey");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "labelName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "glyphName");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v10, "hasFocalPoint");
              objc_msgSend(v10, "focalPoint");
              v17 = v16;
              v19 = v18;
              objc_msgSend(v10, "displayLabel");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "displayMessage");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)objc_msgSend(v11, "initWithDomain:label:glyphName:hasFocalPoint:focalPoint:displayLabel:displayMessage:", v12, v13, v14, v15, v20, v21, v17, v19);
              objc_msgSend(v40, "addObject:", v22);

              ++v9;
            }
            while (v7 != v9);
            v6 = v39;
            v7 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v7);
        }

        v23 = objc_alloc(MEMORY[0x1E0D47830]);
        objc_msgSend(v37, "regionOfInterest");
        v24 = (void *)objc_msgSend(v23, "initWithNormalizedBoundingBox:andDomains:", v40);
        objc_msgSend(v35, "addObject:", v24);

        ++v38;
      }
      while (v38 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v36);
  }

  request = v31->_request;
  v26 = objc_alloc(MEMORY[0x1E0D47828]);
  objc_msgSend(v32, "visualUnderstanding");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "payload");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "initWithResultItems:andPayload:", v35, v28);
  v49 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADVIVisualSearchGatingRequest setResults:](request, "setResults:", v30);

}

- (int)run
{
  MADVIVisualSearchGatingRequest *request;
  id v4;
  void *v5;
  void *v6;
  int v7;
  MADVIVisualSearchGatingRequest *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_group_t v23;
  NSObject *cancelQueue;
  NSObject *v25;
  id v26;
  id v27;
  int v28;
  void *v29;
  MADVIVisualSearchGatingRequest *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  _QWORD block[5];
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  __int128 *p_buf;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  _QWORD aBlock[6];
  id v51;
  uint8_t v52[4];
  int v53;
  __int128 buf;
  uint64_t v55;
  char v56;
  uint64_t v57;
  void *v58;
  void *v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchGatingTask running...", (uint8_t *)&buf, 2u);
  }
  if (-[VCPMADServiceImageAsset fromGenerativePlayground](self->_imageAsset, "fromGenerativePlayground"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VS] Skipping Generative Playground asset", (uint8_t *)&buf, 2u);
    }
    request = self->_request;
    v4 = objc_alloc(MEMORY[0x1E0D47828]);
    v5 = (void *)objc_msgSend(v4, "initWithResultItems:andPayload:", MEMORY[0x1E0C9AA60], 0);
    v60[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADVIVisualSearchGatingRequest setResults:](request, "setResults:", v6);

LABEL_9:
    v7 = 0;
    goto LABEL_30;
  }
  if (VCPPhotosParseCachingEnabled()
    && -[VCPMADServiceImageAsset hasCachedParseData](self->_imageAsset, "hasCachedParseData"))
  {
    -[VCPMADServiceImageAsset cachedParseData](self->_imageAsset, "cachedParseData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VS] Cached parse result empty; returning empty result",
          (uint8_t *)&buf,
          2u);
      }
      v8 = self->_request;
      v9 = objc_alloc(MEMORY[0x1E0D47828]);
      v5 = (void *)objc_msgSend(v9, "initWithResultItems:andPayload:", MEMORY[0x1E0C9AA60], 0);
      v59 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIVisualSearchGatingRequest setResults:](v8, "setResults:", v10);

      goto LABEL_9;
    }
  }
  else
  {
    v5 = 0;
  }
  v51 = 0;
  -[VCPMADVIVisualSearchGatingTask createQueryContextWithError:](self, "createQueryContextWithError:", &v51);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v55 = 0x2020000000;
    v56 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__VCPMADVIVisualSearchGatingTask_run__block_invoke;
    aBlock[3] = &unk_1E6B19858;
    aBlock[4] = self;
    aBlock[5] = &buf;
    v36 = _Block_copy(aBlock);
    v12 = objc_alloc(MEMORY[0x1E0DC6E70]);
    -[VCPMADServiceImageAsset resolution](self->_imageAsset, "resolution");
    v37 = (void *)objc_msgSend(v12, "initWithImageLoader:imageSize:", v36);
    -[VCPMADServiceImageAsset vcp_annotationWithTypes:](self->_imageAsset, "vcp_annotationWithTypes:", 7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    VIAllVisualSearchDomains();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADVIVisualSearchGatingRequest domains](self->_request, "domains");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count") == 0;

    if (!v15)
    {
      v16 = (void *)MEMORY[0x1E0C99E60];
      -[MADVIVisualSearchGatingRequest domains](self->_request, "domains");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v18;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6ED8]), "initWithImage:annotation:normalizedRegionOfInterest:domainsOfInterest:queryContext:", v37, v38, v13, v11, 0.0, 0.0, 1.0, 1.0);
    +[VCPMADVIVisualSearchResource sharedResource](VCPMADVIVisualSearchResource, "sharedResource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateResource:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v23 = dispatch_group_create();
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_175;
    block[3] = &unk_1E6B198A8;
    block[4] = self;
    v44 = &v46;
    v25 = v23;
    v40 = v25;
    v26 = v20;
    v41 = v26;
    v27 = v19;
    v42 = v27;
    v43 = v5;
    p_buf = &buf;
    dispatch_sync(cancelQueue, block);
    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v22, "reset");
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v28 = *((_DWORD *)v47 + 6);
      *(_DWORD *)v52 = 67109120;
      v53 = v28;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchGatingTask complete (%d)", v52, 8u);
    }
    v7 = *((_DWORD *)v47 + 6);

    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v51, "description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v29;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIVisualSearchGatingTask failed to create visual search query context (%@)", (uint8_t *)&buf, 0xCu);

    }
    v30 = self->_request;
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create visual search query context"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADVIVisualSearchGatingRequest setError:](v30, "setError:", v34);

    v7 = 0;
  }

LABEL_30:
  return v7;
}

id __37__VCPMADVIVisualSearchGatingTask_run__block_invoke(uint64_t a1)
{
  void *v1;
  uint8_t v3[4];
  unsigned int v4;
  const void *v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v5 = 0;
  v4 = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadPixelBuffer:orientation:", &v5, &v4))
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIVisualSearchGatingTask image loading failed", v3, 2u);
    }
    v1 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC6E60], "imageWithPixelBuffer:orientation:", v5, v4);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v5);
  return v1;
}

void __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_175(uint64_t a1)
{
  unsigned __int8 v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  int8x16_t v18;
  os_signpost_id_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  VCPTimeMeasurement *v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  if ((v2 & 1) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -128;
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__30;
    v25 = __Block_byref_object_dispose__30;
    v26 = objc_alloc_init(VCPTimeMeasurement);
    objc_msgSend((id)v22[5], "start");
    VCPSignPostLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    VCPSignPostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VIService_VisualSearchGating", "%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_177;
    v15[3] = &unk_1E6B19880;
    v19 = v4;
    v20 = 0;
    v11 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v17 = &v21;
    v18 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v16 = v11;
    objc_msgSend(v8, "parseWithVisualQuery:cachedResults:completion:", v9, v10, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 56);
    *(_QWORD *)(v13 + 56) = v12;

    _Block_object_dispose(&v21, 8);
  }
}

void __37__VCPMADVIVisualSearchGatingTask_run__block_invoke_177(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v20 = 138412290;
    v21 = v13;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v11, OS_SIGNPOST_INTERVAL_END, v12, "VIService_VisualSearchGating", "%@", (uint8_t *)&v20, 0xCu);
  }

  if (*(_QWORD *)(a1 + 80))
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stop");
  v14 = *(unsigned __int8 **)(a1 + 32);
  if (v9)
  {
    v15 = atomic_load(v14 + 48);
    if ((v15 & 1) != 0)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -128;
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setError:", v9);
  }
  else
  {
    objc_msgSend(v14, "storeResults:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "elapsedTimeSeconds");
    objc_msgSend(v17, "setExecutionNanoseconds:", (unint64_t)(v18 * 1000000000.0));

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v19 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasValidSceneProcessing");
    else
      v19 = 0;
    if (VCPPhotosParseCachingEnabled()
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasCachedParseData") ^ 1 | v19) == 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setCachedParseData:overwriteExisting:", v8, v19);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellable, 0);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
