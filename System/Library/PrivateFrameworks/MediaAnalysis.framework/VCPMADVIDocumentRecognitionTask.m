@implementation VCPMADVIDocumentRecognitionTask

- (VCPMADVIDocumentRecognitionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVIDocumentRecognitionTask *v12;
  VCPMADVIDocumentRecognitionTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIDocumentRecognitionTask;
  v12 = -[VCPMADVIDocumentRecognitionTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVIDocumentRecognitionTask", 0);
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
  block[2] = __41__VCPMADVIDocumentRecognitionTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __41__VCPMADVIDocumentRecognitionTask_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "cancel");
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));

}

- (BOOL)canReuseResultsForRequest
{
  int v3;
  float v4;

  if (-[MADVIDocumentRecognitionRequest maximumCandidateCount](self->_request, "maximumCandidateCount") != 3)
    goto LABEL_6;
  v3 = -[MADVIDocumentRecognitionRequest usesLanguageDetection](self->_request, "usesLanguageDetection");
  if (v3)
  {
    v3 = -[MADVIDocumentRecognitionRequest usesLanguageCorrection](self->_request, "usesLanguageCorrection");
    if (v3)
    {
      if ((-[MADVIDocumentRecognitionRequest usesFormFieldDetection](self->_request, "usesFormFieldDetection") & 1) != 0
        || -[MADVIDocumentRecognitionRequest recognitionLevel](self->_request, "recognitionLevel"))
      {
LABEL_6:
        LOBYTE(v3) = 0;
        return v3;
      }
      -[MADVIDocumentRecognitionRequest minimumTextHeight](self->_request, "minimumTextHeight");
      LOBYTE(v3) = v4 == 0.0;
    }
  }
  return v3;
}

- (int)run
{
  void *v3;
  MADVIDocumentRecognitionRequest *v4;
  void *v5;
  void *v6;
  int v7;
  MADVIDocumentRecognitionRequest *request;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSString *v17;
  MTLDevice *preferredMetalDevice;
  NSObject *cancelQueue;
  id v20;
  unsigned __int8 v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  NSString *signpostPayload;
  id v27;
  const void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSString *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  NSString *v38;
  void *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSString *v43;
  MADVIDocumentRecognitionRequest *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD block[5];
  id v59;
  unsigned int v60;
  const void *v61;
  void *v62;
  id v63;
  uint8_t buf[4];
  NSString *v65;
  __int16 v66;
  MTLDevice *v67;
  uint64_t v68;
  void *v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIDocumentRecognitionTask running...", buf, 2u);
  }
  -[VCPMADServiceImageAsset documentObservations](self->_imageAsset, "documentObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v61 = 0;
    v60 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v61, &v60))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIDocumentRecognitionTask image loading failed", buf, 2u);
      }
      request = self->_request;
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v68 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[MADVIDocumentRecognitionRequest setError:](request, "setError:", v10);
      v7 = 0;
      goto LABEL_50;
    }
    +[VCPMADVIDocumentRecognitionResource sharedResource](VCPMADVIDocumentRecognitionResource, "sharedResource");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateResource:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEDFE0], "mad_defaultRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADVIDocumentRecognitionRequest languages](self->_request, "languages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      -[MADVIDocumentRecognitionRequest languages](self->_request, "languages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRecognitionLanguages:", v15);

    }
    objc_msgSend(v12, "setMaximumCandidateCount:", -[MADVIDocumentRecognitionRequest maximumCandidateCount](self->_request, "maximumCandidateCount"));
    objc_msgSend(v12, "setUsesLanguageDetection:", -[MADVIDocumentRecognitionRequest usesLanguageDetection](self->_request, "usesLanguageDetection"));
    objc_msgSend(v12, "setUsesLanguageCorrection:", -[MADVIDocumentRecognitionRequest usesLanguageCorrection](self->_request, "usesLanguageCorrection"));
    objc_msgSend(v12, "setRecognitionLevel:", -[MADVIDocumentRecognitionRequest recognitionLevel](self->_request, "recognitionLevel"));
    -[MADVIDocumentRecognitionRequest minimumTextHeight](self->_request, "minimumTextHeight");
    objc_msgSend(v12, "setMinimumTextHeight:");
    objc_msgSend(v12, "setUsesFormFieldDetection:", -[MADVIDocumentRecognitionRequest usesFormFieldDetection](self->_request, "usesFormFieldDetection"));
    if (self->_preferredMetalDevice)
    {
      objc_msgSend(MEMORY[0x1E0CEDFC0], "deviceForMetalDevice:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setProcessingDevice:", v16);

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "processingDevice");
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        preferredMetalDevice = self->_preferredMetalDevice;
        *(_DWORD *)buf = 138412546;
        v65 = v17;
        v66 = 2112;
        v67 = preferredMetalDevice;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[DocumentRecognition] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);

      }
    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__VCPMADVIDocumentRecognitionTask_run__block_invoke;
    block[3] = &unk_1E6B16D58;
    block[4] = self;
    v20 = v12;
    v59 = v20;
    dispatch_sync(cancelQueue, block);
    v21 = atomic_load((unsigned __int8 *)&self->_canceled);
    if ((v21 & 1) != 0)
    {
      v10 = 0;
      v7 = -128;
LABEL_49:

LABEL_50:
      CF<opaqueCMSampleBuffer *>::~CF(&v61);
      goto LABEL_51;
    }
    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_signpost_id_generate(v22);

    VCPSignPostLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v65 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v27 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v28 = v61;
    v29 = v60;
    objc_msgSend(v56, "session");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v27, "initWithCVPixelBuffer:orientation:options:session:", v28, v29, MEMORY[0x1E0C9AA70], v30);

    VCPSignPostLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      v33 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v65 = v33;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_END, v23, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    VCPSignPostLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_signpost_id_generate(v34);

    VCPSignPostLog();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      v38 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v65 = v38;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    v63 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v40 = objc_msgSend(v54, "performRequests:error:", v39, &v57);
    v10 = v57;

    VCPSignPostLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      v43 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v65 = v43;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v42, OS_SIGNPOST_INTERVAL_END, v35, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
    }

    if (v40)
    {
      v44 = self->_request;
      v45 = objc_alloc(MEMORY[0x1E0D477B0]);
      objc_msgSend(v20, "results");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v45, "initWithObservations:", v46);
      v62 = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIDocumentRecognitionRequest setResults:](v44, "setResults:", v48);

      -[MADVIDocumentRecognitionRequest results](self->_request, "results");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "firstObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setExecutionNanoseconds:", objc_msgSend(v20, "executionNanoseconds"));

      if (-[VCPMADVIDocumentRecognitionTask canReuseResultsForRequest](self, "canReuseResultsForRequest"))
      {
        objc_msgSend(v20, "results");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPMADServiceImageAsset setDocumentObservations:](self->_imageAsset, "setDocumentObservations:", v51);

      }
      else if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[DocumentRecognition] Custom request configuration; not persisting result",
          buf,
          2u);
      }
    }
    else
    {
      v52 = atomic_load((unsigned __int8 *)&self->_canceled);
      if ((v52 & 1) != 0)
      {
        v7 = -128;
LABEL_48:

        goto LABEL_49;
      }
      -[MADVIDocumentRecognitionRequest setError:](self->_request, "setError:", v10);
    }
    objc_msgSend(v55, "reset", v54);
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIDocumentRecognitionTask complete", buf, 2u);
    }
    v7 = 0;
    goto LABEL_48;
  }
  if (!-[VCPMADVIDocumentRecognitionTask canReuseResultsForRequest](self, "canReuseResultsForRequest")
    && (int)MediaAnalysisLogLevel() >= 4
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[DocumentRecognition] Custom request configuration; overriding to use cached data",
      buf,
      2u);
  }
  v4 = self->_request;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D477B0]), "initWithObservations:", v3);
  v70[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADVIDocumentRecognitionRequest setResults:](v4, "setResults:", v6);

  v7 = 0;
LABEL_51:

  return v7;
}

id __38__VCPMADVIDocumentRecognitionTask_run__block_invoke(uint64_t a1)
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
