@implementation VCPMADVITextLookupTask

- (VCPMADVITextLookupTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVITextLookupTask *v12;
  VCPMADVITextLookupTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVITextLookupTask;
  v12 = -[VCPMADVITextLookupTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVITextLookupTask", 0);
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
  block[2] = __32__VCPMADVITextLookupTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __32__VCPMADVITextLookupTask_cancel__block_invoke(uint64_t a1)
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
  void *v11;
  MTLDevice *preferredMetalDevice;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADVITextLookupRequest queryID](self->_request, "queryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MADVITextLookupRequest queryID](self->_request, "queryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC6F28]);

  }
  -[MADVITextLookupRequest uiScale](self->_request, "uiScale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MADVITextLookupRequest uiScale](self->_request, "uiScale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC6F40]);

  }
  -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DC6EE8]);

  }
  preferredMetalDevice = self->_preferredMetalDevice;
  if (preferredMetalDevice)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", preferredMetalDevice, *MEMORY[0x1E0DC6F20]);
  -[MADVITextLookupRequest engagementSuggestionType](self->_request, "engagementSuggestionType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MADVITextLookupRequest engagementSuggestionType](self->_request, "engagementSuggestionType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DC6EF8]);

  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Query context: %@", buf, 0xCu);
  }
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0DC6E80], "contextWithDictionary:error:", v5, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  v17 = v19;
  if (a3)
    objc_storeStrong(a3, v16);

  return v15;
}

- (int)run
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_group_t v6;
  NSObject *cancelQueue;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  VCPMADVITextLookupTask *v18;
  NSObject *v19;
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  int v25;
  uint8_t v26[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVITextLookupTask running...", buf, 2u);
  }
  +[VCPMADVIVisualSearchResource sharedResource](VCPMADVIVisualSearchResource, "sharedResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateResource:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x2020000000;
  v25 = 0;
  v6 = dispatch_group_create();
  cancelQueue = self->_cancelQueue;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __29__VCPMADVITextLookupTask_run__block_invoke;
  v17 = &unk_1E6B174C0;
  v18 = self;
  v21 = buf;
  v8 = v6;
  v19 = v8;
  v9 = v3;
  v20 = v9;
  dispatch_sync(cancelQueue, &v14);
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v9, "service", v14, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearCacheWithOption:", 56);

  objc_msgSend(v5, "reset");
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = *((_DWORD *)v23 + 6);
    *(_DWORD *)v26 = 67109120;
    v27 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVITextLookupTask complete (%d)", v26, 8u);
  }
  v12 = *((_DWORD *)v23 + 6);

  _Block_object_dispose(buf, 8);
  return v12;
}

void __29__VCPMADVITextLookupTask_run__block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  os_signpost_id_t v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  __int128 *p_buf;
  uint64_t v45;
  id v46;
  _QWORD aBlock[5];
  uint8_t v48[4];
  uint64_t v49;
  __int128 buf;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  VCPTimeMeasurement *v54;
  uint64_t v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  if ((v2 & 1) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -128;
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __29__VCPMADVITextLookupTask_run__block_invoke_2;
    aBlock[3] = &unk_1E6B17448;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v4 = _Block_copy(aBlock);
    v5 = objc_alloc(MEMORY[0x1E0DC6E70]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resolution");
    v37 = (void *)objc_msgSend(v5, "initWithImageLoader:imageSize:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "vcp_annotationWithTypes:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(*(id *)(a1 + 32), "createQueryContextWithError:", &v46);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "surroundingText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 == 0;

      if (v9)
      {
        v13 = 0;
      }
      else
      {
        v10 = objc_alloc(MEMORY[0x1E0DC6EC0]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "surroundingText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "normalizedBoundingBoxes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "initWithSurroundingText:normalizedBoundingBoxes:", v11, v12);

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__16;
      v53 = __Block_byref_object_dispose__16;
      v54 = objc_alloc_init(VCPTimeMeasurement);
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "start");
      v42[0] = v3;
      v42[1] = 3221225472;
      v42[2] = __29__VCPMADVITextLookupTask_run__block_invoke_167;
      v42[3] = &unk_1E6B17470;
      v19 = *(void **)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 32);
      p_buf = &buf;
      v42[4] = v20;
      v45 = *(_QWORD *)(a1 + 56);
      v43 = v19;
      v21 = _Block_copy(v42);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v22 = objc_alloc(MEMORY[0x1E0DC6EC8]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "queryTerm");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hintDomain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v22, "initWithQueryTerm:hintDomain:textContext:imageContext:annotation:queryContext:", v23, v24, v13, v37, v6, v7);

      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_signpost_id_generate(v26);

      VCPSignPostLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        *(_DWORD *)v48 = 138412290;
        v49 = v30;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VIService_TextLookup", "%@", v48, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 48), "service");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v3;
      v38[1] = 3221225472;
      v38[2] = __29__VCPMADVITextLookupTask_run__block_invoke_172;
      v38[3] = &unk_1E6B17498;
      v32 = *(_QWORD *)(a1 + 32);
      v40 = v27;
      v41 = 0;
      v38[4] = v32;
      v33 = v21;
      v39 = v33;
      objc_msgSend(v31, "lookupTextWithQuery:completion:", v25, v38);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(a1 + 32);
      v36 = *(void **)(v35 + 56);
      *(_QWORD *)(v35 + 56) = v34;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v46, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADVITextLookupTask failed to create text lookup query context (%@)", (uint8_t *)&buf, 0xCu);

      }
      v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create text lookup query context"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setError:", v18);

    }
  }
}

id __29__VCPMADVITextLookupTask_run__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint8_t v3[4];
  unsigned int v4;
  const void *v5;

  v5 = 0;
  v4 = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "loadPixelBuffer:orientation:", &v5, &v4))
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVITextLookupTask image loading failed", v3, 2u);
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

void __29__VCPMADVITextLookupTask_run__block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stop");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v8 = atomic_load((unsigned __int8 *)(v7 + 48));
    if ((v8 & 1) != 0)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -128;
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setError:", v6);
  }
  else
  {
    v9 = *(void **)(v7 + 8);
    v10 = objc_alloc(MEMORY[0x1E0D47800]);
    objc_msgSend(v5, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithSearchSections:", v11);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResults:", v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "elapsedTimeSeconds");
    objc_msgSend(v15, "setExecutionNanoseconds:", (unint64_t)(v16 * 1000000000.0));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __29__VCPMADVITextLookupTask_run__block_invoke_172(_QWORD *a1, void *a2, void *a3)
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
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VIService_TextLookup", "%@", (uint8_t *)&v11, 0xCu);
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
