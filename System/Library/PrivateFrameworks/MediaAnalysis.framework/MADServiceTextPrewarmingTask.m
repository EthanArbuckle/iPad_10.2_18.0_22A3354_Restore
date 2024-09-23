@implementation MADServiceTextPrewarmingTask

- (MADServiceTextPrewarmingTask)initWithRequests:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  MADServiceTextPrewarmingTask *v13;
  MADServiceTextPrewarmingTask *v14;
  NSString *signpostPayload;
  dispatch_queue_t v16;
  OS_dispatch_queue *cancelQueue;
  objc_super v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__MADServiceTextPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke;
  v20[3] = &unk_1E6B16938;
  v12 = v11;
  v21 = v12;
  v19.receiver = self;
  v19.super_class = (Class)MADServiceTextPrewarmingTask;
  v13 = -[VCPMABaseTask initWithCompletionHandler:](&v19, sel_initWithCompletionHandler_, v20);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requests, a3);
    signpostPayload = v14->_signpostPayload;
    v14->_signpostPayload = (NSString *)&stru_1E6B1C190;

    -[VCPMABaseTask setCancelBlock:](v14, "setCancelBlock:", v10);
    v16 = dispatch_queue_create("MADServiceTextProcessingTask", 0);
    cancelQueue = v14->_cancelQueue;
    v14->_cancelQueue = (OS_dispatch_queue *)v16;

  }
  return v14;
}

uint64_t __79__MADServiceTextPrewarmingTask_initWithRequests_cancelBlock_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)interruptBackgroundTasks
{
  return 0;
}

- (BOOL)run:(id *)p_isa
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  NSString *signpostPayload;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSString *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  unint64_t v38;
  os_signpost_id_t v39;
  NSArray *obj;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSString *v49;
  uint8_t v50[128];
  uint8_t buf[4];
  NSString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v52 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MADServiceTextPrewarmingTask_Run", "%@", buf, 0xCu);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v11 = self->_requests;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    obj = v11;
    v38 = v6 - 1;
    v39 = v6;
LABEL_6:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v15);
      if (-[VCPMABaseTask isCanceled](self, "isCanceled"))
        break;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v18;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Prewarming %@", buf, 0xCu);
      }
      if (!objc_msgSend(v16, "isMemberOfClass:", objc_opt_class()))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v18;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ does not support prewarming", buf, 0xCu);
        }
        v27 = (void (**)(_QWORD, _QWORD, _QWORD))obj;
        if (p_isa)
        {
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v34 = *MEMORY[0x1E0CB2F90];
          v46 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not support prewarming"), v18);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, -50, v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *p_isa;
          *p_isa = v35;

LABEL_34:
        }

        LOBYTE(p_isa) = 0;
        goto LABEL_37;
      }
      v19 = (void *)MEMORY[0x1BCCA1B2C]();
      v41 = 0;
      v20 = +[MADTextEmbeddingTask prewarmRequest:error:](MADTextEmbeddingTask, "prewarmRequest:error:", v16, &v41);
      v21 = v41;
      v22 = v21;
      if (p_isa && !v20)
      {
        v23 = (void *)objc_msgSend(v21, "copy");
        v24 = *p_isa;
        *p_isa = v23;

      }
      objc_autoreleasePoolPop(v19);

      if (!v20)
      {
        LOBYTE(p_isa) = 0;
        v27 = (void (**)(_QWORD, _QWORD, _QWORD))obj;
        goto LABEL_37;
      }
      if (v13 == ++v15)
      {
        v11 = obj;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v9 = v38;
        v6 = v39;
        if (v13)
          goto LABEL_6;
        goto LABEL_20;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
    }
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))obj;
    if (p_isa)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2F90];
      v48 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request was canceled"));
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v49 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, -128, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *p_isa;
      *p_isa = v31;
      goto LABEL_34;
    }
  }
  else
  {
LABEL_20:

    VCPSignPostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    p_isa = (id *)&v25->isa;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v26 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v52 = v26;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)p_isa, OS_SIGNPOST_INTERVAL_END, v6, "MADServiceTextPrewarmingTask_Run", "%@", buf, 0xCu);
    }

    -[VCPMABaseTask completionHandler](self, "completionHandler");
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v27[2](v27, 0, 0);
    LOBYTE(p_isa) = 1;
  }
LABEL_37:

  return (char)p_isa;
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
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
