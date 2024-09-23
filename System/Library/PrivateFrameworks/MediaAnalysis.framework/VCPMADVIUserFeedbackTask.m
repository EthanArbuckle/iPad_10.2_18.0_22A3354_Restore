@implementation VCPMADVIUserFeedbackTask

- (VCPMADVIUserFeedbackTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVIUserFeedbackTask *v12;
  VCPMADVIUserFeedbackTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIUserFeedbackTask;
  v12 = -[VCPMADVIUserFeedbackTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVIUserFeedbackTask", 0);
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
  block[2] = __34__VCPMADVIUserFeedbackTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

uint64_t __34__VCPMADVIUserFeedbackTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancel");
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  return result;
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
  VCPMADVIUserFeedbackTask *v18;
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIUserFeedbackTask running...", buf, 2u);
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
  v16 = __31__VCPMADVIUserFeedbackTask_run__block_invoke;
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIUserFeedbackTask complete (%d)", v26, 8u);
  }
  v12 = *((_DWORD *)v23 + 6);

  _Block_object_dispose(buf, 8);
  return v12;
}

void __31__VCPMADVIUserFeedbackTask_run__block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  os_signpost_id_t v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  VCPTimeMeasurement *v39;
  _QWORD aBlock[5];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
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
    aBlock[2] = __31__VCPMADVIUserFeedbackTask_run__block_invoke_2;
    aBlock[3] = &unk_1E6B17448;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v4 = _Block_copy(aBlock);
    v5 = objc_alloc(MEMORY[0x1E0DC6E70]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resolution");
    v6 = (void *)objc_msgSend(v5, "initWithImageLoader:imageSize:", v4);
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__49;
    v38 = __Block_byref_object_dispose__49;
    v39 = objc_alloc_init(VCPTimeMeasurement);
    objc_msgSend((id)v35[5], "start");
    v30[0] = v3;
    v30[1] = 3221225472;
    v30[2] = __31__VCPMADVIUserFeedbackTask_run__block_invoke_159;
    v30[3] = &unk_1E6B1AA88;
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v32 = &v34;
    v30[4] = v8;
    v33 = *(_QWORD *)(a1 + 56);
    v31 = v7;
    v9 = _Block_copy(v30);
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v10 = objc_alloc(MEMORY[0x1E0DC6ED0]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "userFeedbackPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sfReportData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reportIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithImage:userFeedbackPayload:sfReportData:reportIdentifier:", v6, v11, v12, v13);

    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      v42 = v19;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VIService_UserFeedback", "%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v3;
    v26[1] = 3221225472;
    v26[2] = __31__VCPMADVIUserFeedbackTask_run__block_invoke_164;
    v26[3] = &unk_1E6B1AAB0;
    v21 = *(_QWORD *)(a1 + 32);
    v28 = v16;
    v29 = 0;
    v26[4] = v21;
    v22 = v9;
    v27 = v22;
    objc_msgSend(v20, "submitUserFeedback:completion:", v14, v26);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 56);
    *(_QWORD *)(v24 + 56) = v23;

    _Block_object_dispose(&v34, 8);
  }
}

id __31__VCPMADVIUserFeedbackTask_run__block_invoke_2(uint64_t a1)
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
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIUserFeedbackTask image loading failed", v3, 2u);
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

void __31__VCPMADVIUserFeedbackTask_run__block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stop");
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = atomic_load((unsigned __int8 *)(v4 + 48));
    if ((v5 & 1) != 0)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -128;
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setError:", v3);
  }
  else
  {
    v6 = *(void **)(v4 + 8);
    v7 = objc_alloc_init(MEMORY[0x1E0D47810]);
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setResults:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "elapsedTimeSeconds");
    objc_msgSend(v10, "setExecutionNanoseconds:", (unint64_t)(v11 * 1000000000.0));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __31__VCPMADVIUserFeedbackTask_run__block_invoke_164(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = *(_QWORD *)(a1[4] + 24);
    v8 = 138412290;
    v9 = v7;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "VIService_UserFeedback", "%@", (uint8_t *)&v8, 0xCu);
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
