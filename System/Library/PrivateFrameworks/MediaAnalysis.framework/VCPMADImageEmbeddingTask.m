@implementation VCPMADImageEmbeddingTask

- (VCPMADImageEmbeddingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADImageEmbeddingTask *v12;
  VCPMADImageEmbeddingTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADImageEmbeddingTask;
  v12 = -[VCPMADImageEmbeddingTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
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
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  MADImageEmbeddingRequest *request;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  MADImageEmbeddingRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  NSString *signpostPayload;
  uint64_t v26;
  void *v27;
  void *v28;
  MADImageEmbeddingRequest *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  MADImageEmbeddingRequest *v42;
  void *v43;
  MADImageEmbeddingRequest *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  int v50;
  const void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  NSString *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageEmbeddingTask running...", buf, 2u);
  }
  v3 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v3 & 1) != 0)
    return -128;
  +[VCPMADImageEmbeddingResource sharedResourceForRevision:](VCPMADImageEmbeddingResource, "sharedResourceForRevision:", -[MADImageEmbeddingRequest version](self->_request, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateResource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = -[MADImageEmbeddingRequest version](self->_request, "version");
    *(_DWORD *)buf = 67109120;
    LODWORD(v58) = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageEmbeddingTask with embedding version %d", buf, 8u);
  }
  objc_msgSend(v4, "imageBackbone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (!v9)
  {
    v51 = 0;
    v50 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v51, &v50))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADImageEmbeddingTask image loading failed", buf, 2u);
      }
      request = self->_request;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v60 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADImageEmbeddingRequest setError:](request, "setError:", v14);
      goto LABEL_44;
    }
    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_generate(v21);

    VCPSignPostLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v58 = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);
    }

    v26 = -[MADImageEmbeddingRequest bypassNormalizaton](self->_request, "bypassNormalizaton");
    objc_msgSend(v4, "imageBackbone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBypassNormalizaton:", v26);

    objc_msgSend(v4, "imageBackbone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    LODWORD(v26) = objc_msgSend(v28, "analyzePixelBuffer:flags:results:cancel:", v51, 0, &v49, &__block_literal_global_16);
    v12 = v49;

    if ((_DWORD)v26)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADImageEmbeddingTask image embedding analysis failed", buf, 2u);
      }
      v29 = self->_request;
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPMADImageEmbeddingTask image embedding analysis failed"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADImageEmbeddingRequest setError:](v29, "setError:", v31);
LABEL_38:

LABEL_44:
      CF<opaqueCMSampleBuffer *>::~CF(&v51);
      goto LABEL_45;
    }
    VCPSignPostLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      v34 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v58 = v34;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v33, OS_SIGNPOST_INTERVAL_END, v22, "VCPMADImageEmbeddingTask_requestEmbedding", "%@", buf, 0xCu);
    }

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("attributes"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("embeddings"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("embeddingVersion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31
        || (v39 = objc_msgSend(v31, "intValue"), -[MADImageEmbeddingRequest version](self->_request, "version") != v39))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageEmbeddingTask unexpected image embedding version", buf, 2u);
        }
        v44 = self->_request;
        v45 = (void *)MEMORY[0x1E0CB35C8];
        v53 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPMADImageEmbeddingTask unexpected image embedding version. Expect %d, got %d"), -[MADImageEmbeddingRequest version](v44, "version"), objc_msgSend(v31, "intValue"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADImageEmbeddingRequest setError:](v44, "setError:", v48);

        goto LABEL_38;
      }

      if (v14)
      {
        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0D476D0]), "initWithVersion:data:type:", -[MADImageEmbeddingRequest version](self->_request, "version"), v14, 1);
        v41 = (void *)v40;
        if (v40)
        {
          v42 = self->_request;
          v52 = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[MADImageEmbeddingRequest setResults:](v42, "setResults:", v43);

        }
      }
    }
    else
    {
      v14 = 0;
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageEmbeddingTask complete", buf, 2u);
    }
    objc_msgSend(v6, "reset");
    goto LABEL_44;
  }
  v16 = self->_request;
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v61 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create image backbone"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADImageEmbeddingRequest setError:](v16, "setError:", v20);

LABEL_45:
  return 0;
}

uint64_t __31__VCPMADImageEmbeddingTask_run__block_invoke()
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
