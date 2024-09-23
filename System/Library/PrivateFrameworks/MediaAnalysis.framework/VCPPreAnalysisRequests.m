@implementation VCPPreAnalysisRequests

+ (BOOL)includeNSFW
{
  return 1;
}

+ (BOOL)includeLM
{
  return 1;
}

+ (BOOL)includeSE
{
  return 1;
}

+ (BOOL)includeSDG
{
  return 1;
}

+ (BOOL)includeWP
{
  return 1;
}

+ (BOOL)includeDO
{
  return 1;
}

+ (BOOL)includeSO
{
  return 1;
}

+ (BOOL)includeMeme
{
  return 1;
}

+ (BOOL)includeRotation
{
  return 1;
}

+ (BOOL)includeDocument
{
  return 1;
}

+ (BOOL)includeIVS
{
  return 1;
}

+ (BOOL)includePA
{
  return 1;
}

+ (BOOL)includeCN
{
  return 1;
}

+ (BOOL)includeJunk
{
  return 1;
}

+ (BOOL)includeDMF
{
  return 1;
}

+ (unint64_t)sharpnessRevision
{
  unsigned __int8 v2;
  uint64_t *v3;
  int v5;

  v3 = &qword_1ED261000;
  if ((v2 & 1) == 0)
  {
    v3 = &qword_1ED261000;
    if (v5)
    {
      +[VCPPreAnalysisRequests sharpnessRevision]::revision = 2;
      v3 = &qword_1ED261000;
    }
  }
  return v3[125];
}

+ (BOOL)isDimensionUnknown:(id)a3
{
  return objc_msgSend(a3, "isEqualToValue:", &unk_1E6B72938);
}

- (id)gatherAvailableRequests
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_aestheticsRequest)
    objc_msgSend(v3, "addObject:");
  if (self->_classificationRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_sceneprintRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_saliencyRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_junkImageRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_objectRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_saliencyObjectnessRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_landmarkRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_nsfwRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_tabooRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_semanticRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_sceneprintRawRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_memeRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_adjustmentsRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_documentRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_cityNatureRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_imagefingerprintsRequest)
    objc_msgSend(v4, "addObject:");
  if (self->_classifyImageRequest)
    objc_msgSend(v4, "addObject:");
  return v4;
}

+ (id)_cachedRequestIdealDimension
{
  if (+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::once != -1)
    dispatch_once(&+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::once, &__block_literal_global_17);
  return (id)+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::cachedRequestIdealDimension;
}

void __54__VCPPreAnalysisRequests__cachedRequestIdealDimension__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  objc_class *v16;
  void *v17;
  unsigned int v18;
  id v19;
  int v20;
  id v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *type;
  id obja;
  id obj;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  objc_class *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[17];

  v63[15] = *MEMORY[0x1E0C80C00];
  v62[0] = objc_opt_class();
  v62[1] = &unk_1E6B72950;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v28;
  v61[0] = objc_opt_class();
  v61[1] = &unk_1E6B72968;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v34;
  v60[0] = objc_opt_class();
  v60[1] = &unk_1E6B72980;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v33;
  v59[0] = objc_opt_class();
  v59[1] = &unk_1E6B72950;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v63[3] = obja;
  v58[0] = objc_opt_class();
  v58[1] = &unk_1E6B72998;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  type = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = type;
  v57[0] = objc_opt_class();
  v57[1] = &unk_1E6B72950;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v29;
  v56[0] = objc_opt_class();
  v56[1] = &unk_1E6B729B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v63[6] = v0;
  v55[0] = objc_opt_class();
  v55[1] = &unk_1E6B729C8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v63[7] = v1;
  v54[0] = objc_opt_class();
  v54[1] = &unk_1E6B72950;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v63[8] = v2;
  v53[0] = objc_opt_class();
  v53[1] = &unk_1E6B729E0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v63[9] = v3;
  v52[0] = objc_opt_class();
  v52[1] = &unk_1E6B729F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v63[10] = v4;
  v51[0] = objc_opt_class();
  v51[1] = &unk_1E6B72A10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63[11] = v5;
  v50[0] = objc_opt_class();
  v50[1] = &unk_1E6B729C8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63[12] = v6;
  v49[0] = objc_opt_class();
  v49[1] = &unk_1E6B729F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63[13] = v7;
  v48[0] = objc_opt_class();
  v48[1] = &unk_1E6B72950;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v38;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v16 = (objc_class *)(id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntValue");

        v19 = objc_alloc_init(v16);
        v36 = v12;
        v20 = objc_msgSend(v19, "setRevision:error:", v18, &v36);
        v21 = v36;

        v12 = v21;
        if (v20)
        {
          objc_msgSend(v19, "vcp_idealDimension");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v22 = &unk_1E6B72938;
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v42 = v16;
              v43 = 2048;
              v44 = v18;
              v23 = MEMORY[0x1E0C81028];
              v24 = "Failed to get the ideal size of request %@ with revision %lu";
              v25 = 22;
LABEL_14:
              _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
            }
          }
        }
        else
        {
          v22 = &unk_1E6B72938;
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v42 = v16;
            v43 = 2048;
            v44 = v18;
            v45 = 2112;
            v46 = v12;
            v23 = MEMORY[0x1E0C81028];
            v24 = "Failed to set %@::setRevision %lu: %@";
            v25 = 32;
            goto LABEL_14;
          }
        }
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v22, v15);
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v42 = v16;
          v43 = 2048;
          v44 = v18;
          v45 = 2112;
          v46 = v22;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Request %@ (revision %lu) ideal size %@", buf, 0x20u);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (!v11)
        goto LABEL_22;
    }
  }
  v12 = 0;
LABEL_22:

  v26 = (void *)+[VCPPreAnalysisRequests _cachedRequestIdealDimension]::cachedRequestIdealDimension;
  +[VCPPreAnalysisRequests _cachedRequestIdealDimension]::cachedRequestIdealDimension = (uint64_t)v35;
  v27 = v35;

}

- (id)mapAvailableRequestsToResolution
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalysisRequests gatherAvailableRequests](self, "gatherAvailableRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_cachedRequestIdealDimension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v18;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v26[0] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "revision"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v11 = &unk_1E6B72938;
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "description");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v25 = v12;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Ideal size for request %@ not cached", buf, 0xCu);

            v11 = &unk_1E6B72938;
          }
        }
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v11);

        }
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v5);
  }

  return v3;
}

+ (void)asyncCacheRequestIdealDimension
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCPPreAnalysisRequests_asyncCacheRequestIdealDimension__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

void __57__VCPPreAnalysisRequests_asyncCacheRequestIdealDimension__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = mach_absolute_time();
  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPPreAnalysisRequests_CacheRequestIdealDimension", ", (uint8_t *)&v11, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PreAnalysis] Caching Vision request input resolutions ... ", (uint8_t *)&v11, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_cachedRequestIdealDimension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(v7, "count");
    v11 = 134217984;
    v12 = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PreAnalysis] Cached %lu request", (uint8_t *)&v11, 0xCu);
  }
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_END, v4, "VCPPreAnalysisRequests_CacheRequestIdealDimension", ", (uint8_t *)&v11, 2u);
  }

  if (v2)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }

}

+ (void)asyncLoadSharedPhotoFormatsObjects
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_204);

}

void __60__VCPPreAnalysisRequests_asyncLoadSharedPhotoFormatsObjects__block_invoke()
{
  NSObject *v0;
  os_signpost_id_t v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v20 = mach_absolute_time();
  VCPSignPostLog();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_signpost_id_generate(v0);

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "VCPPreAnalysisRequests_LoadPFSceneObjects", ", buf, 2u);
  }

  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PreAnalysis] Initializing PFSceneObjects ... ", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "[PreAnalysis] Failed to initialize PFSceneTaxonomy";
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0D75240], "vcp_sharedSceneGeography");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
    v17 = "[PreAnalysis] Failed to initialize PFSceneGeography";
LABEL_20:
    _os_log_impl(&dword_1B6C4A000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
LABEL_21:
    v14 = 0;
    v15 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CD1758], "vcp_instanceWithExtendedSceneIdentifier:confidence:", 1472, 0.001);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D77E48];
    v25[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetIconicScoreForSceneClassifications:assetLatitude:assetLongitude:sceneGeography:sceneTaxonomy:", v9, v5, v4, 45.5787, -122.1177);

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v11;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PreAnalysis] Initialized %@ and %@", buf, 0x16u);

    }
    v14 = (void *)v5;
    v15 = v7;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PreAnalysis] Failed to create scene classification", buf, 2u);
    }
    v15 = 0;
    v14 = (void *)v5;
  }
LABEL_22:
  VCPSignPostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v1, "VCPPreAnalysisRequests_LoadPFSceneObjects", ", buf, 2u);
  }

  if (v20)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }

}

- (VNClassifyImageAestheticsRequest)aestheticsRequest
{
  return self->_aestheticsRequest;
}

- (void)setAestheticsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_aestheticsRequest, a3);
}

- (VNSceneClassificationRequest)classificationRequest
{
  return self->_classificationRequest;
}

- (void)setClassificationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_classificationRequest, a3);
}

- (VNCreateSceneprintRequest)sceneprintRequest
{
  return self->_sceneprintRequest;
}

- (void)setSceneprintRequest:(id)a3
{
  objc_storeStrong((id *)&self->_sceneprintRequest, a3);
}

- (VNGenerateAttentionBasedSaliencyImageRequest)saliencyRequest
{
  return self->_saliencyRequest;
}

- (void)setSaliencyRequest:(id)a3
{
  objc_storeStrong((id *)&self->_saliencyRequest, a3);
}

- (VNClassifyJunkImageRequest)junkImageRequest
{
  return self->_junkImageRequest;
}

- (void)setJunkImageRequest:(id)a3
{
  objc_storeStrong((id *)&self->_junkImageRequest, a3);
}

- (VNRecognizeObjectsRequest)objectRequest
{
  return self->_objectRequest;
}

- (void)setObjectRequest:(id)a3
{
  objc_storeStrong((id *)&self->_objectRequest, a3);
}

- (VNGenerateObjectnessBasedSaliencyImageRequest)saliencyObjectnessRequest
{
  return self->_saliencyObjectnessRequest;
}

- (void)setSaliencyObjectnessRequest:(id)a3
{
  objc_storeStrong((id *)&self->_saliencyObjectnessRequest, a3);
}

- (VNClassifyPotentialLandmarkRequest)landmarkRequest
{
  return self->_landmarkRequest;
}

- (void)setLandmarkRequest:(id)a3
{
  objc_storeStrong((id *)&self->_landmarkRequest, a3);
}

- (VNVYvzEtX1JlUdu8xx5qhDI)nsfwRequest
{
  return self->_nsfwRequest;
}

- (void)setNsfwRequest:(id)a3
{
  objc_storeStrong((id *)&self->_nsfwRequest, a3);
}

- (VN6Mb1ME89lyW3HpahkEygIG)tabooRequest
{
  return self->_tabooRequest;
}

- (void)setTabooRequest:(id)a3
{
  objc_storeStrong((id *)&self->_tabooRequest, a3);
}

- (VN5kJNH3eYuyaLxNpZr5Z7zi)semanticRequest
{
  return self->_semanticRequest;
}

- (void)setSemanticRequest:(id)a3
{
  objc_storeStrong((id *)&self->_semanticRequest, a3);
}

- (VNCreateSceneprintRequest)sceneprintRawRequest
{
  return self->_sceneprintRawRequest;
}

- (void)setSceneprintRawRequest:(id)a3
{
  objc_storeStrong((id *)&self->_sceneprintRawRequest, a3);
}

- (VNClassifyMemeImageRequest)memeRequest
{
  return self->_memeRequest;
}

- (void)setMemeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_memeRequest, a3);
}

- (VN1JC7R3k4455fKQz0dY1VhQ)adjustmentsRequest
{
  return self->_adjustmentsRequest;
}

- (void)setAdjustmentsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentsRequest, a3);
}

- (VNRecognizeDocumentElementsRequest)documentRequest
{
  return self->_documentRequest;
}

- (void)setDocumentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_documentRequest, a3);
}

- (VNClassifyCityNatureImageRequest)cityNatureRequest
{
  return self->_cityNatureRequest;
}

- (void)setCityNatureRequest:(id)a3
{
  objc_storeStrong((id *)&self->_cityNatureRequest, a3);
}

- (VNCreateImageFingerprintsRequest)imagefingerprintsRequest
{
  return self->_imagefingerprintsRequest;
}

- (void)setImagefingerprintsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_imagefingerprintsRequest, a3);
}

- (VNClassifyImageRequest)classifyImageRequest
{
  return self->_classifyImageRequest;
}

- (void)setClassifyImageRequest:(id)a3
{
  objc_storeStrong((id *)&self->_classifyImageRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifyImageRequest, 0);
  objc_storeStrong((id *)&self->_imagefingerprintsRequest, 0);
  objc_storeStrong((id *)&self->_cityNatureRequest, 0);
  objc_storeStrong((id *)&self->_documentRequest, 0);
  objc_storeStrong((id *)&self->_adjustmentsRequest, 0);
  objc_storeStrong((id *)&self->_memeRequest, 0);
  objc_storeStrong((id *)&self->_sceneprintRawRequest, 0);
  objc_storeStrong((id *)&self->_semanticRequest, 0);
  objc_storeStrong((id *)&self->_tabooRequest, 0);
  objc_storeStrong((id *)&self->_nsfwRequest, 0);
  objc_storeStrong((id *)&self->_landmarkRequest, 0);
  objc_storeStrong((id *)&self->_saliencyObjectnessRequest, 0);
  objc_storeStrong((id *)&self->_objectRequest, 0);
  objc_storeStrong((id *)&self->_junkImageRequest, 0);
  objc_storeStrong((id *)&self->_saliencyRequest, 0);
  objc_storeStrong((id *)&self->_sceneprintRequest, 0);
  objc_storeStrong((id *)&self->_classificationRequest, 0);
  objc_storeStrong((id *)&self->_aestheticsRequest, 0);
}

@end
