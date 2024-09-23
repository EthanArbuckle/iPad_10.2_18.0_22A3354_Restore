@implementation VCPMADImageCaptionTask

- (VCPMADImageCaptionTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADImageCaptionTask *v12;
  VCPMADImageCaptionTask *v13;
  NSURL *imageCaptionModel;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VCPMADImageCaptionTask;
  v12 = -[VCPMADImageCaptionTask init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    imageCaptionModel = v13->_imageCaptionModel;
    v13->_imageCaptionModel = 0;

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
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (int)run
{
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSString *signpostPayload;
  VCPImageCaptionAnalyzer *v11;
  NSObject *v12;
  NSObject *v13;
  NSString *v14;
  MADImageCaptionRequest *request;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  MADImageCaptionRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  NSString *v30;
  int v31;
  MADImageCaptionRequest *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSString *v38;
  __CFString **v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  void *v54;
  MADImageCaptionRequest *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  const void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint8_t buf[4];
  NSString *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageCaptionTask running...", buf, 2u);
  }
  v3 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v3 & 1) != 0)
    return -128;
  v4 = -[MADImageCaptionRequest modelType](self->_request, "modelType");
  v5 = -[MADImageCaptionRequest safetyType](self->_request, "safetyType");
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v70 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPMADImageCaptionTask_modelPrepare", "%@", buf, 0xCu);
  }

  v11 = -[VCPImageCaptionAnalyzer initWithCaptionModelType:captionSafetyType:]([VCPImageCaptionAnalyzer alloc], "initWithCaptionModelType:captionSafetyType:", v4, v5);
  if (v11)
  {
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v70 = v14;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v7, "VCPMADImageCaptionTask_modelPrepare", "%@", buf, 0xCu);
    }

    v61 = 0;
    v60 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v61, &v60))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADImageCaptionTask image loading failed", buf, 2u);
      }
      request = self->_request;
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v66 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADImageCaptionRequest setError:](request, "setError:", v19);

    }
    else
    {
      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_signpost_id_generate(v26);

      VCPSignPostLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        v30 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v70 = v30;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VCPMADImageCaptionTask_requestCaption", "%@", buf, 0xCu);
      }

      v59 = 0;
      v31 = -[VCPImageCaptionAnalyzer analyzePixelBuffer:flags:results:cancel:](v11, "analyzePixelBuffer:flags:results:cancel:", v61, 0, &v59, &__block_literal_global_2);
      v17 = v59;
      if (v31)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADImageCaptionTask image caption analysis failed", buf, 2u);
        }
        v32 = self->_request;
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPMADImageCaptionTask image caption analysis failed"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADImageCaptionRequest setError:](v32, "setError:", v35);

      }
      else
      {
        VCPSignPostLog();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
        {
          v38 = self->_signpostPayload;
          *(_DWORD *)buf = 138412290;
          v70 = v38;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v37, OS_SIGNPOST_INTERVAL_END, v27, "VCPMADImageCaptionTask_requestCaption", "%@", buf, 0xCu);
        }

        v39 = MediaAnalysisImageCaptionResultsKey;
        if ((unint64_t)(v4 - 1) >= 2)
          v39 = MediaAnalysisMiCaImageCaptionResultsKey;
        objc_msgSend(v17, "objectForKeyedSubscript:", *v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("attributes"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41 == 0;

          if (!v42)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("attributes"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("imageCaptionText"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("imageCaptionConfidence"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("imageCaptionUnsafeContent"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("imageCaptionLowConfidence"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("classificationIdentifiers"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_alloc(MEMORY[0x1E0D476B0]);
            objc_msgSend(v58, "floatValue");
            v50 = v49;
            v51 = objc_msgSend(v45, "BOOLValue");
            v52 = objc_msgSend(v46, "BOOLValue");
            LODWORD(v53) = v50;
            v54 = (void *)objc_msgSend(v48, "initWithCaption:score:containsUnsafeContent:isLowConfidence:classificationIdentifiers:", v57, v51, v52, v47, v53);
            v55 = self->_request;
            v62 = v54;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[MADImageCaptionRequest setResults:](v55, "setResults:", v56);

          }
        }
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageCaptionTask complete", buf, 2u);
        }
      }
    }

    CF<opaqueCMSampleBuffer *>::~CF(&v61);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPImageCaptionAnalyzer init fail", buf, 2u);
    }
    v21 = self->_request;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v67 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPImageCaptionAnalyzer init fail"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADImageCaptionRequest setError:](v21, "setError:", v25);

  }
  return 0;
}

uint64_t __29__VCPMADImageCaptionTask_run__block_invoke()
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageCaptionModel, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
