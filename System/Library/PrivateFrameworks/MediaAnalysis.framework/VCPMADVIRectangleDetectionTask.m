@implementation VCPMADVIRectangleDetectionTask

- (VCPMADVIRectangleDetectionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVIRectangleDetectionTask *v12;
  VCPMADVIRectangleDetectionTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIRectangleDetectionTask;
  v12 = -[VCPMADVIRectangleDetectionTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVIRectangleDetectionTask", 0);
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
  block[2] = __40__VCPMADVIRectangleDetectionTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __40__VCPMADVIRectangleDetectionTask_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "cancel");
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));

}

- (int)run
{
  MADVIRectangleDetectionRequest *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSString *v12;
  MTLDevice *preferredMetalDevice;
  NSObject *cancelQueue;
  id v15;
  unsigned __int8 v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  NSString *signpostPayload;
  id v22;
  const void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSString *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  NSString *v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  NSString *v38;
  MADVIRectangleDetectionRequest *request;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v48;
  void *v49;
  id v50;
  _QWORD block[5];
  id v52;
  unsigned int v53;
  const void *v54;
  void *v55;
  id v56;
  uint8_t buf[4];
  NSString *v58;
  __int16 v59;
  MTLDevice *v60;
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIRectangleDetectionTask running...", buf, 2u);
  }
  v54 = 0;
  v53 = 0;
  if (!-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v54, &v53))
  {
    +[VCPMADVIRectangleDetectionResource sharedResource](VCPMADVIRectangleDetectionResource, "sharedResource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateResource:", v5);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CEDEB0]);
    if (DeviceHasANE())
    {
      objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProcessingDevice:", v10);

    }
    -[MADVIRectangleDetectionRequest minimumAspectRatio](self->_request, "minimumAspectRatio");
    objc_msgSend(v9, "setMinimumAspectRatio:");
    -[MADVIRectangleDetectionRequest maximumAspectRatio](self->_request, "maximumAspectRatio");
    objc_msgSend(v9, "setMaximumAspectRatio:");
    -[MADVIRectangleDetectionRequest quadratureTolerance](self->_request, "quadratureTolerance");
    objc_msgSend(v9, "setQuadratureTolerance:");
    -[MADVIRectangleDetectionRequest minimumSize](self->_request, "minimumSize");
    objc_msgSend(v9, "setMinimumSize:");
    -[MADVIRectangleDetectionRequest minimumConfidence](self->_request, "minimumConfidence");
    objc_msgSend(v9, "setMinimumConfidence:");
    objc_msgSend(v9, "setMaximumObservations:", -[MADVIRectangleDetectionRequest maximumObservations](self->_request, "maximumObservations"));
    if (self->_preferredMetalDevice)
    {
      objc_msgSend(MEMORY[0x1E0CEDFC0], "deviceForMetalDevice:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProcessingDevice:", v11);

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v9, "processingDevice");
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        preferredMetalDevice = self->_preferredMetalDevice;
        *(_DWORD *)buf = 138412546;
        v58 = v12;
        v59 = 2112;
        v60 = preferredMetalDevice;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RectangleDetection] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);

      }
    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__VCPMADVIRectangleDetectionTask_run__block_invoke;
    block[3] = &unk_1E6B16D58;
    block[4] = self;
    v15 = v9;
    v52 = v15;
    dispatch_sync(cancelQueue, block);
    v16 = atomic_load((unsigned __int8 *)&self->_canceled);
    if ((v16 & 1) != 0)
    {
      v6 = 0;
      v7 = -128;
LABEL_39:

      goto LABEL_40;
    }
    VCPSignPostLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v58 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v22 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v23 = v54;
    v24 = v53;
    objc_msgSend(v5, "session");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v22, "initWithCVPixelBuffer:orientation:options:session:", v23, v24, MEMORY[0x1E0C9AA70], v25);

    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v28 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v58 = v28;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v18, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    VCPSignPostLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_signpost_id_generate(v29);

    VCPSignPostLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      v33 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v58 = v33;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    v56 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v35 = objc_msgSend(v48, "performRequests:error:", v34, &v50);
    v6 = v50;

    VCPSignPostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      v38 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v58 = v38;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v30, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    if (v35)
    {
      request = self->_request;
      v40 = objc_alloc(MEMORY[0x1E0D477E0]);
      objc_msgSend(v15, "results");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v40, "initWithObservations:", v41);
      v55 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIRectangleDetectionRequest setResults:](request, "setResults:", v43);

      -[MADVIRectangleDetectionRequest results](self->_request, "results");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setExecutionNanoseconds:", objc_msgSend(v15, "executionNanoseconds"));

    }
    else
    {
      v46 = atomic_load((unsigned __int8 *)&self->_canceled);
      if ((v46 & 1) != 0)
      {
        v7 = -128;
LABEL_38:

        goto LABEL_39;
      }
      -[MADVIRectangleDetectionRequest setError:](self->_request, "setError:", v6);
    }
    objc_msgSend(v49, "reset");
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIRectangleDetectionTask complete", buf, 2u);
    }
    v7 = 0;
    goto LABEL_38;
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIRectangleDetectionTask image loading failed", buf, 2u);
  }
  v3 = self->_request;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v61 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MADVIRectangleDetectionRequest setError:](v3, "setError:", v6);
  v7 = 0;
LABEL_40:

  CF<opaqueCMSampleBuffer *>::~CF(&v54);
  return v7;
}

id __37__VCPMADVIRectangleDetectionTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
