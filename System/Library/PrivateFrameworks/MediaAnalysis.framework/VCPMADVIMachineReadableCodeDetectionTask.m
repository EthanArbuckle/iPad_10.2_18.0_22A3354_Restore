@implementation VCPMADVIMachineReadableCodeDetectionTask

- (VCPMADVIMachineReadableCodeDetectionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVIMachineReadableCodeDetectionTask *v12;
  VCPMADVIMachineReadableCodeDetectionTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIMachineReadableCodeDetectionTask;
  v12 = -[VCPMADVIMachineReadableCodeDetectionTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVIMachineReadableCodeDetectionTask", 0);
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
  block[2] = __50__VCPMADVIMachineReadableCodeDetectionTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __50__VCPMADVIMachineReadableCodeDetectionTask_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "cancel");
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));

}

- (BOOL)canReuseResultsForRequest
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MADVIMachineReadableCodeDetectionRequest symbologies](self->_request, "symbologies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    -[MADVIMachineReadableCodeDetectionRequest symbologies](self->_request, "symbologies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CEE278]))
    {
      -[MADVIMachineReadableCodeDetectionRequest symbologies](self->_request, "symbologies");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0CEE250]);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)run
{
  void *v3;
  MADVIMachineReadableCodeDetectionRequest *v4;
  void *v5;
  void *v6;
  int v7;
  MADVIMachineReadableCodeDetectionRequest *request;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *cancelQueue;
  id v18;
  unsigned __int8 v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  NSString *signpostPayload;
  id v25;
  const void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSString *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  NSString *v36;
  void *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  NSString *v41;
  MADVIMachineReadableCodeDetectionRequest *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  MADVIMachineReadableCodeDetectionRequest *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  void *v57;
  void *v58;
  id v59;
  _QWORD block[5];
  id v61;
  unsigned int v62;
  const void *v63;
  void *v64;
  id v65;
  uint8_t buf[4];
  NSString *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIMachineReadableCodeDetectionTask running...", buf, 2u);
  }
  if (!VCPPhotosMRCCachingEnabled()
    || (-[VCPMADServiceImageAsset barcodeObservations](self->_imageAsset, "barcodeObservations"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v63 = 0;
    v62 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v63, &v62))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIMachineReadableCodeDetectionTask image loading failed", buf, 2u);
      }
      request = self->_request;
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v70 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[MADVIMachineReadableCodeDetectionRequest setError:](request, "setError:", v12);
      v7 = 0;
      goto LABEL_51;
    }
    +[VCPMADMachineReadableCodeResource sharedResource](VCPMADMachineReadableCodeResource, "sharedResource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateResource:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEDE50], "mad_defaultRequest");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to configure VNDetectBarcodesRequest", buf, 2u);
      }
      v50 = self->_request;
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v68 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to configure VNDetectBarcodesRequest"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIMachineReadableCodeDetectionRequest setError:](v50, "setError:", v54);

      v12 = 0;
      v7 = 0;
      goto LABEL_50;
    }
    -[MADVIMachineReadableCodeDetectionRequest symbologies](self->_request, "symbologies");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count") == 0;

    if (!v15)
    {
      -[MADVIMachineReadableCodeDetectionRequest symbologies](self->_request, "symbologies");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setSymbologies:", v16);

    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__VCPMADVIMachineReadableCodeDetectionTask_run__block_invoke;
    block[3] = &unk_1E6B16D58;
    block[4] = self;
    v18 = v58;
    v61 = v18;
    dispatch_sync(cancelQueue, block);
    v19 = atomic_load((unsigned __int8 *)&self->_canceled);
    if ((v19 & 1) != 0)
    {
      v12 = 0;
      v7 = -128;
LABEL_49:

LABEL_50:
LABEL_51:

      CF<opaqueCMSampleBuffer *>::~CF(&v63);
      return v7;
    }
    VCPSignPostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);

    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v67 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v25 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v26 = v63;
    v27 = v62;
    objc_msgSend(v10, "session");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v25, "initWithCVPixelBuffer:orientation:options:session:", v26, v27, MEMORY[0x1E0C9AA70], v28);

    VCPSignPostLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      v31 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v67 = v31;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v30, OS_SIGNPOST_INTERVAL_END, v21, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    VCPSignPostLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_signpost_id_generate(v32);

    VCPSignPostLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      v36 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v67 = v36;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    v65 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v38 = objc_msgSend(v57, "performRequests:error:", v37, &v59);
    v12 = v59;

    VCPSignPostLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      v41 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v67 = v41;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v40, OS_SIGNPOST_INTERVAL_END, v33, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    if (v38)
    {
      v42 = self->_request;
      v43 = objc_alloc(MEMORY[0x1E0D477D0]);
      objc_msgSend(v18, "results");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v43, "initWithObservations:", v44);
      v64 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIMachineReadableCodeDetectionRequest setResults:](v42, "setResults:", v46);

      -[MADVIMachineReadableCodeDetectionRequest results](self->_request, "results");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "firstObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setExecutionNanoseconds:", objc_msgSend(v18, "executionNanoseconds"));

      if (VCPPhotosMRCCachingEnabled())
      {
        if (-[VCPMADVIMachineReadableCodeDetectionTask canReuseResultsForRequest](self, "canReuseResultsForRequest"))
        {
          objc_msgSend(v18, "results");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPMADServiceImageAsset setBarcodeObservations:](self->_imageAsset, "setBarcodeObservations:", v49);

        }
        else if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MRC] Custom request configuration; not persisting result",
            buf,
            2u);
        }
      }
    }
    else
    {
      v55 = atomic_load((unsigned __int8 *)&self->_canceled);
      if ((v55 & 1) != 0)
      {
        v7 = -128;
LABEL_48:

        goto LABEL_49;
      }
      -[MADVIMachineReadableCodeDetectionRequest setError:](self->_request, "setError:", v12);
    }
    objc_msgSend(v11, "reset");
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIMachineReadableCodeDetectionTask complete", buf, 2u);
    }
    v7 = 0;
    goto LABEL_48;
  }
  if (!-[VCPMADVIMachineReadableCodeDetectionTask canReuseResultsForRequest](self, "canReuseResultsForRequest")
    && (int)MediaAnalysisLogLevel() >= 4
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MRC] Custom request configuration; overriding to use cached data",
      buf,
      2u);
  }
  v4 = self->_request;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D477D0]), "initWithObservations:", v3);
  v72[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADVIMachineReadableCodeDetectionRequest setResults:](v4, "setResults:", v6);

  return 0;
}

id __47__VCPMADVIMachineReadableCodeDetectionTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
