@implementation MADMultiModalPrewarmingTask

- (MADMultiModalPrewarmingTask)initWithRequests:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  MADMultiModalPrewarmingTask *v13;
  MADMultiModalPrewarmingTask *v14;
  NSString *signpostPayload;
  objc_super v17;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__MADMultiModalPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke;
  v18[3] = &unk_1E6B16938;
  v12 = v11;
  v19 = v12;
  v17.receiver = self;
  v17.super_class = (Class)MADMultiModalPrewarmingTask;
  v13 = -[VCPMABaseTask initWithCompletionHandler:](&v17, sel_initWithCompletionHandler_, v18);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requests, a3);
    signpostPayload = v14->_signpostPayload;
    v14->_signpostPayload = (NSString *)&stru_1E6B1C190;

    -[VCPMABaseTask setCancelBlock:](v14, "setCancelBlock:", v10);
  }

  return v14;
}

uint64_t __78__MADMultiModalPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)run:(id *)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  NSString *signpostPayload;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSString *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  unint64_t v42;
  os_signpost_id_t v43;
  uint64_t v44;
  uint64_t v45;
  NSArray *obj;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  NSString *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;
  NSString *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v58 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADMultiModalPrewarmingTask_Run", "%@", buf, 0xCu);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = self->_requests;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    v44 = *MEMORY[0x1E0CB2D50];
    v45 = *MEMORY[0x1E0CB2F90];
    obj = v10;
    v42 = v5 - 1;
    v43 = v5;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
      if (-[VCPMABaseTask isCanceled](self, "isCanceled"))
        break;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v17;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Prewarming %@", buf, 0xCu);
      }
      if (!objc_msgSend(v15, "isMemberOfClass:", objc_opt_class()))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v17;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ does not support prewarming", buf, 0xCu);
        }
        v25 = (void (**)(_QWORD, _QWORD, _QWORD))obj;
        if (a3)
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v53 = v44;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not support prewarming"), v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", v45, -50, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = *a3;
          *a3 = v33;

LABEL_31:
        }
LABEL_38:

LABEL_39:
        v26 = 0;
        goto LABEL_40;
      }
      v18 = (void *)MEMORY[0x1BCCA1B2C]();
      v19 = v15;
      v48 = 0;
      v20 = +[MADPersonalizedEmbeddingTask prewarmRequest:error:](MADPersonalizedEmbeddingTask, "prewarmRequest:error:", v19, &v48);
      v21 = v48;
      if (!v20)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v21, "description");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v17;
          v59 = 2112;
          v60 = v35;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to prewarm %@ (%@)", buf, 0x16u);

        }
        v25 = (void (**)(_QWORD, _QWORD, _QWORD))obj;
        if (a3)
        {
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v55 = v44;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to prewarm %@"), v17);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "errorWithDomain:code:userInfo:", v45, -50, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *a3;
          *a3 = v39;

        }
        objc_autoreleasePoolPop(v18);
        goto LABEL_38;
      }

      objc_autoreleasePoolPop(v18);
      if (v12 == ++v14)
      {
        v10 = obj;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
        v8 = v42;
        v5 = v43;
        if (v12)
          goto LABEL_6;
        goto LABEL_17;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
    }
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))obj;
    if (a3)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v61 = v44;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request was canceled"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v62 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v45, -128, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *a3;
      *a3 = v29;

      goto LABEL_31;
    }
    goto LABEL_39;
  }
LABEL_17:

  VCPSignPostLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    v24 = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v58 = v24;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, v5, "MADMultiModalPrewarmingTask_Run", "%@", buf, 0xCu);
  }

  -[VCPMABaseTask completionHandler](self, "completionHandler");
  v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v25[2](v25, 0, 0);
  v26 = 1;
LABEL_40:

  return v26;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
  objc_storeStrong((id *)&self->_signpostPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
