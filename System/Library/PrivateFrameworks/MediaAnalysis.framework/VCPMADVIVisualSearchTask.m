@implementation VCPMADVIVisualSearchTask

- (VCPMADVIVisualSearchTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVIVisualSearchTask *v12;
  VCPMADVIVisualSearchTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIVisualSearchTask;
  v12 = -[VCPMADVIVisualSearchTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVIVisualSearchTask", 0);
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
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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
  block[2] = __34__VCPMADVIVisualSearchTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __34__VCPMADVIVisualSearchTask_cancel__block_invoke(uint64_t a1)
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
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MTLDevice *preferredMetalDevice;
  void *v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADVIVisualSearchRequest queryID](self->_request, "queryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MADVIVisualSearchRequest queryID](self->_request, "queryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC6F28]);

  }
  -[MADVIVisualSearchRequest uiScale](self->_request, "uiScale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MADVIVisualSearchRequest uiScale](self->_request, "uiScale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC6F40]);

  }
  -[MADVIVisualSearchRequest location](self->_request, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (_QWORD *)MEMORY[0x1E0DC6F18];
  if (v10)
  {
    -[MADVIVisualSearchRequest location](self->_request, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *v11);

  }
  -[MADVIVisualSearchRequest imageType](self->_request, "imageType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (_QWORD *)MEMORY[0x1E0DC6F08];
  if (v13)
  {
    -[MADVIVisualSearchRequest imageType](self->_request, "imageType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *v14);

  }
  -[MADVIVisualSearchRequest catalogIDs](self->_request, "catalogIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MADVIVisualSearchRequest catalogIDs](self->_request, "catalogIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0DC6EF0]);

  }
  -[MADVIVisualSearchRequest featureIdentifier](self->_request, "featureIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MADVIVisualSearchRequest featureIdentifier](self->_request, "featureIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC6F00]);

  }
  -[VCPMADServiceImageAsset location](self->_imageAsset, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[VCPMADServiceImageAsset location](self->_imageAsset, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, *v11);

  }
  if (-[VCPMADServiceImageAsset isScreenshot](self->_imageAsset, "isScreenshot"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6B746A8, *v14);
  -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0DC6EE8]);

  }
  -[VCPMADServiceImageAsset clientTeamID](self->_imageAsset, "clientTeamID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[VCPMADServiceImageAsset clientTeamID](self->_imageAsset, "clientTeamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0DC6F38]);

  }
  preferredMetalDevice = self->_preferredMetalDevice;
  if (preferredMetalDevice)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", preferredMetalDevice, *MEMORY[0x1E0DC6F20]);
  -[MADVIVisualSearchRequest imageURL](self->_request, "imageURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (_QWORD *)MEMORY[0x1E0DC6F10];
  if (v27)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("<redacted>"), *MEMORY[0x1E0DC6F10]);
  -[MADVIVisualSearchRequest referralURL](self->_request, "referralURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (_QWORD *)MEMORY[0x1E0DC6F30];
  if (v29)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("<redacted>"), *MEMORY[0x1E0DC6F30]);
  -[MADVIVisualSearchRequest engagementSuggestionType](self->_request, "engagementSuggestionType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[MADVIVisualSearchRequest engagementSuggestionType](self->_request, "engagementSuggestionType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0DC6EF8]);

  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Query context: %@", buf, 0xCu);
  }
  -[MADVIVisualSearchRequest imageURL](self->_request, "imageURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 == 0;

  if (!v34)
  {
    -[MADVIVisualSearchRequest imageURL](self->_request, "imageURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, *v28);

  }
  -[MADVIVisualSearchRequest referralURL](self->_request, "referralURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 == 0;

  if (!v37)
  {
    -[MADVIVisualSearchRequest referralURL](self->_request, "referralURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, *v30);

  }
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0DC6E80], "contextWithDictionary:error:", v5, &v43);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v43;
  v41 = v43;
  if (a3)
    objc_storeStrong(a3, v40);

  return v39;
}

- (void)storeResults:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t k;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  MADVIVisualSearchRequest *request;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  id obj;
  void *v65;
  uint64_t i;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t j;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  void *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v61, "regionOfInterestResults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
  if (v60)
  {
    v62 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v60; ++i)
      {
        if (*(_QWORD *)v88 != v62)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v63 = v3;
        objc_msgSend(v3, "resultItems");
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
        if (v69)
        {
          v68 = *(_QWORD *)v84;
          do
          {
            for (j = 0; j != v69; ++j)
            {
              if (*(_QWORD *)v84 != v68)
                objc_enumerationMutation(v67);
              v4 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = 0u;
              v82 = 0u;
              v79 = 0u;
              v80 = 0u;
              objc_msgSend(v4, "objectKnowledge");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "knowledgeProperties");
              v7 = (void *)objc_claimAutoreleasedReturnValue();

              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
              if (v8)
              {
                v9 = *(_QWORD *)v80;
                do
                {
                  for (k = 0; k != v8; ++k)
                  {
                    if (*(_QWORD *)v80 != v9)
                      objc_enumerationMutation(v7);
                    v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
                    objc_msgSend(v11, "value");
                    v12 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "name");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

                  }
                  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
                }
                while (v8);
              }

              objc_msgSend(v4, "objectKnowledge");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "knowledgeGraphID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v4, "objectKnowledge");
              else
                objc_msgSend(v4, "ontologyNode");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "knowledgeGraphID");
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "thirdPartyObject");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17 == 0;

              if (v18)
              {
                v29 = 0;
              }
              else
              {
                v19 = objc_alloc(MEMORY[0x1E0D47858]);
                objc_msgSend(v4, "thirdPartyObject");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "objectIdentifier");
                v20 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "thirdPartyObject");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "imageURL");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "thirdPartyObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "thumbnailURL");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "thirdPartyObject");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "metadata");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v19;
                v28 = (void *)v20;
                v29 = (void *)objc_msgSend(v27, "initWithObjectIdentifier:imageURL:thumbnailURL:metadata:", v20, v22, v24, v26);

              }
              v30 = objc_alloc(MEMORY[0x1E0D47838]);
              objc_msgSend(v4, "domain");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectKnowledge");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "title");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectKnowledge");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "thumbnailURL");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectKnowledge");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "thumbnailAspectRatio");
              v33 = v32;
              objc_msgSend(v4, "objectKnowledge");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "shortDescription");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectKnowledge");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "detailedDescription");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectKnowledge");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "webURL");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v40) = v33;
              v41 = (void *)objc_msgSend(v30, "initWithDomain:knowledgeGraphID:title:thumbnailURL:thumbnailAspectRatio:shortDescription:detailedDescription:webURL:knowledgeProperties:", v74, v77, v73, v76, v35, v37, v40, v39, v5);
              objc_msgSend(v72, "addObject:", v41);

              objc_msgSend(v72, "lastObject");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setThirdPartyObject:", v29);

            }
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
          }
          while (v69);
        }

        v43 = objc_alloc(MEMORY[0x1E0D47850]);
        objc_msgSend(v63, "normalizedBoundingBox");
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v51 = v50;
        objc_msgSend(v63, "searchSections");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v43, "initWithNormalizedBoundingBox:regionAttributes:andSearchSections:", v72, v52, v45, v47, v49, v51);
        objc_msgSend(v65, "addObject:", v53);

      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    }
    while (v60);
  }

  request = self->_request;
  v55 = objc_alloc(MEMORY[0x1E0D47848]);
  objc_msgSend(v61, "userFeedbackPayload");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v55, "initWithResultItems:andUserFeedbackPayload:", v65, v56);
  v91 = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADVIVisualSearchRequest setResults:](request, "setResults:", v58);

}

- (int)run
{
  MADVIVisualSearchRequest *request;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  dispatch_group_t v11;
  NSObject *cancelQueue;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  VCPMADVIVisualSearchTask *v21;
  NSObject *v22;
  id v23;
  uint8_t *v24;
  const void *v25;
  int v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  int v30;
  int v31;
  const void *v32;
  uint8_t v33[4];
  int v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchTask running...", buf, 2u);
  }
  v32 = 0;
  v31 = 0;
  if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v32, &v31))
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIVisualSearchTask image loading failed", buf, 2u);
    }
    request = self->_request;
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v36[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADVIVisualSearchRequest setError:](request, "setError:", v7);

    v8 = 0;
  }
  else
  {
    +[VCPMADVIVisualSearchResource sharedResource](VCPMADVIVisualSearchResource, "sharedResource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateResource:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v28 = buf;
    v29 = 0x2020000000;
    v30 = 0;
    v11 = dispatch_group_create();
    cancelQueue = self->_cancelQueue;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3321888768;
    v19 = __31__VCPMADVIVisualSearchTask_run__block_invoke;
    v20 = &unk_1E6B145B0;
    v21 = self;
    v24 = buf;
    v13 = v11;
    v22 = v13;
    v25 = v32;
    if (v32)
      CFRetain(v32);
    v26 = v31;
    v5 = v9;
    v23 = v5;
    dispatch_sync(cancelQueue, &v17);
    dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v5, "service", v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearCacheWithOption:", 16);

    objc_msgSend(v6, "reset");
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v15 = *((_DWORD *)v28 + 6);
      *(_DWORD *)v33 = 67109120;
      v34 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIVisualSearchTask complete (%d)", v33, 8u);
    }
    v8 = *((_DWORD *)v28 + 6);

    CF<opaqueCMSampleBuffer *>::~CF(&v25);
    _Block_object_dispose(buf, 8);
  }

  CF<opaqueCMSampleBuffer *>::~CF(&v32);
  return v8;
}

void __31__VCPMADVIVisualSearchTask_run__block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  os_signpost_id_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id obj;
  void *v56;
  _QWORD v57[8];
  _QWORD v58[8];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD aBlock[5];
  id v68;
  __int128 *p_buf;
  uint64_t v70;
  id v71;
  uint8_t v72[4];
  uint64_t v73;
  _BYTE v74[128];
  uint8_t v75[128];
  __int128 buf;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  VCPTimeMeasurement *v80;
  uint64_t v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  if ((v2 & 1) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -128;
  }
  else
  {
    v71 = 0;
    objc_msgSend(*(id *)(a1 + 32), "createQueryContextWithError:", &v71);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = a1;
    if (v53)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "documentObservations");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3 == 0;

      if (!v4)
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VisualSearch] Using client provided OCR results", (uint8_t *)&buf, 2u);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(v54 + 32) + 8), "documentObservations");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v54 + 32) + 16), "setDocumentObservations:", v5);

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v77 = 0x3032000000;
      v78 = __Block_byref_object_copy__32;
      v79 = __Block_byref_object_dispose__32;
      v80 = objc_alloc_init(VCPTimeMeasurement);
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "start");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __31__VCPMADVIVisualSearchTask_run__block_invoke_175;
      aBlock[3] = &unk_1E6B19938;
      v6 = *(_QWORD *)(v54 + 32);
      p_buf = &buf;
      aBlock[4] = v6;
      v70 = *(_QWORD *)(v54 + 56);
      v68 = *(id *)(v54 + 40);
      v52 = _Block_copy(aBlock);
      dispatch_group_enter(*(dispatch_group_t *)(v54 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(v54 + 32) + 8), "gatingResultItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") == 0;

      if (v8)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(v54 + 32) + 16), "vcp_annotationWithTypes:", 15);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC6ED8], "queryWithPixelBuffer:orientation:normalizedRegionOfInterest:annotation:queryContext:", *(_QWORD *)(v54 + 64), *(unsigned int *)(v54 + 72), 0.0, 0.0, 1.0, 1.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        VCPSignPostLog();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = os_signpost_id_generate(v44);

        VCPSignPostLog();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          v48 = *(_QWORD *)(*(_QWORD *)(v54 + 32) + 24);
          *(_DWORD *)v72 = 138412290;
          v73 = v48;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "VIService_VisualSearch", "%@", v72, 0xCu);
        }

        objc_msgSend(*(id *)(v54 + 48), "service");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __31__VCPMADVIVisualSearchTask_run__block_invoke_182;
        v57[3] = &unk_1E6B19960;
        v34 = v57;
        v35 = v54;
        v49 = *(_QWORD *)(v54 + 32);
        v57[6] = v45;
        v57[7] = 0;
        v57[4] = v49;
        v57[5] = v52;
        objc_msgSend(v33, "searchWithVisualQuery:completion:", v27, v57);
        v37 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(v54 + 32) + 8), "gatingResultItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v9;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v64 != v11)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              objc_msgSend(v13, "domains");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v60;
                do
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v60 != v17)
                      objc_enumerationMutation(v15);
                    objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "domain");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "addObject:", v19);

                  }
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
                }
                while (v16);
              }

              v20 = objc_alloc(MEMORY[0x1E0DC6E68]);
              objc_msgSend(v13, "normalizedBoundingBox");
              v21 = (void *)objc_msgSend(v20, "initWithRegionOfInterest:domains:", v14);
              objc_msgSend(v56, "addObject:", v21);

            }
            v9 = obj;
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
          }
          while (v10);
        }

        v22 = (void *)MEMORY[0x1E0DC6E78];
        v23 = *(_QWORD *)(v54 + 64);
        v24 = *(unsigned int *)(v54 + 72);
        objc_msgSend(*(id *)(*(_QWORD *)(v54 + 32) + 16), "vcp_textAnnotation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v54 + 32) + 8), "gatingPayload");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "queryWithPixelBuffer:orientation:imageRegions:textBlockAnnotation:queryContext:payload:", v23, v24, v56, v25, v53, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        VCPSignPostLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_signpost_id_generate(v28);

        VCPSignPostLog();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(v54 + 32) + 24);
          *(_DWORD *)v72 = 138412290;
          v73 = v32;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "VIService_ParsedVisualSearch", "%@", v72, 0xCu);
        }

        objc_msgSend(*(id *)(v54 + 48), "service");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __31__VCPMADVIVisualSearchTask_run__block_invoke_179;
        v58[3] = &unk_1E6B19960;
        v34 = v58;
        v35 = v54;
        v36 = *(_QWORD *)(v54 + 32);
        v58[6] = v29;
        v58[7] = 0;
        v58[4] = v36;
        v58[5] = v52;
        objc_msgSend(v33, "searchWithParsedVisualQuery:completion:", v27, v58);
        v37 = objc_claimAutoreleasedReturnValue();
      }
      v50 = *(_QWORD *)(v35 + 32);
      v51 = *(void **)(v50 + 56);
      *(_QWORD *)(v50 + 56) = v37;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v71, "description");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v38;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADVIVisualSearchTask failed to create visual search query context (%@)", (uint8_t *)&buf, 0xCu);

      }
      v39 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v81 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create visual search query context"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setError:", v43);

    }
  }
}

void __31__VCPMADVIVisualSearchTask_run__block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unsigned __int8 *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stop");
  v6 = *(unsigned __int8 **)(a1 + 32);
  if (v5)
  {
    v7 = atomic_load(v6 + 48);
    if ((v7 & 1) != 0)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -128;
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setError:", v5);
  }
  else
  {
    objc_msgSend(v6, "storeResults:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "elapsedTimeSeconds");
    objc_msgSend(v9, "setExecutionNanoseconds:", (unint64_t)(v10 * 1000000000.0));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __31__VCPMADVIVisualSearchTask_run__block_invoke_179(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1[4] + 24);
    v11 = 138412290;
    v12 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VIService_ParsedVisualSearch", "%@", (uint8_t *)&v11, 0xCu);
  }

  if (a1[7])
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __31__VCPMADVIVisualSearchTask_run__block_invoke_182(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1[4] + 24);
    v11 = 138412290;
    v12 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VIService_VisualSearch", "%@", (uint8_t *)&v11, 0xCu);
  }

  if (a1[7])
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  (*(void (**)(void))(a1[5] + 16))();

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
