@implementation MADServiceTextProcessingTask

- (MADServiceTextProcessingTask)initWithRequests:(id)a3 asset:(id)a4 cancelBlock:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  MADServiceTextProcessingTask *v16;
  MADServiceTextProcessingTask *v17;
  NSString *signpostPayload;
  uint64_t v19;
  NSMutableArray *subtasks;
  dispatch_queue_t v21;
  OS_dispatch_queue *cancelQueue;
  objc_super v24;
  _QWORD v25[4];
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __85__MADServiceTextProcessingTask_initWithRequests_asset_cancelBlock_completionHandler___block_invoke;
  v25[3] = &unk_1E6B16938;
  v15 = v14;
  v26 = v15;
  v24.receiver = self;
  v24.super_class = (Class)MADServiceTextProcessingTask;
  v16 = -[VCPMABaseTask initWithCompletionHandler:](&v24, sel_initWithCompletionHandler_, v25);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_requests, a3);
    objc_storeStrong((id *)&v17->_asset, a4);
    signpostPayload = v17->_signpostPayload;
    v17->_signpostPayload = (NSString *)&stru_1E6B1C190;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    subtasks = v17->_subtasks;
    v17->_subtasks = (NSMutableArray *)v19;

    -[VCPMABaseTask setCancelBlock:](v17, "setCancelBlock:", v13);
    v21 = dispatch_queue_create("MADServiceTextProcessingTask", 0);
    cancelQueue = v17->_cancelQueue;
    v17->_cancelQueue = (OS_dispatch_queue *)v21;

  }
  return v17;
}

void __85__MADServiceTextProcessingTask_initWithRequests_asset_cancelBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Payloads"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)interruptBackgroundTasks
{
  return 0;
}

- (BOOL)run:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSString *signpostPayload;
  NSObject *cancelQueue;
  void *v11;
  uint64_t v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  int v25;
  objc_class *v26;
  NSString *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSString *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  BOOL v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  os_signpost_id_t spid;
  unint64_t v51;
  id *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD block[5];
  const __CFString *v62;
  NSMutableArray *v63;
  uint8_t v64[128];
  uint8_t buf[4];
  NSString *v66;
  __int16 v67;
  int v68;
  uint64_t v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v66 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MADServiceTextProcessingTask_Run", "%@", buf, 0xCu);
  }

  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MADServiceTextProcessingTask_run___block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
  if (-[VCPMABaseTask isCanceled](self, "isCanceled"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
    }
    if (!a3)
      return 0;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2F90];
    v72 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request was canceled"));
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v73[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -128, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *a3;
    *a3 = v15;

LABEL_39:
    v41 = 0;
  }
  else
  {
    spid = v6;
    v51 = v6 - 1;
    v52 = a3;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v13 = self->_subtasks;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v58;
      v20 = MEMORY[0x1E0C81028];
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v58 != v19)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1BCCA1B2C]();
          v24 = objc_msgSend(v22, "run");
          if (v24)
          {
            v25 = v24;
            if (v24 == -128)
            {
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
              }
              if (v52)
              {
                v43 = (void *)MEMORY[0x1E0CB35C8];
                v44 = *MEMORY[0x1E0CB2F90];
                v69 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request was canceled"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v45;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, -128, v46);
                v47 = objc_claimAutoreleasedReturnValue();
                v48 = *v52;
                *v52 = (id)v47;

              }
              objc_autoreleasePoolPop(v23);
              goto LABEL_39;
            }
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (NSString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v66 = v27;
              v67 = 1024;
              v68 = v25;
              _os_log_impl(&dword_1B6C4A000, v20, OS_LOG_TYPE_DEFAULT, "%@ returned unexpected status (%d)", buf, 0x12u);

            }
          }
          objc_autoreleasePoolPop(v23);
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
        if (v18)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v28 = self->_requests;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v54 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          v34 = objc_alloc_init(MEMORY[0x1E0D477A0]);
          objc_msgSend(v33, "results");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setResults:", v35);

          objc_msgSend(v33, "error");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setError:", v36);

          -[NSMutableArray addObject:](v13, "addObject:", v34);
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      }
      while (v30);
    }

    VCPSignPostLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      v39 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v66 = v39;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v38, OS_SIGNPOST_INTERVAL_END, spid, "MADServiceTextProcessingTask_Run", "%@", buf, 0xCu);
    }

    -[VCPMABaseTask completionHandler](self, "completionHandler");
    v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v62 = CFSTR("Payloads");
    v63 = v13;
    v41 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v40)[2](v40, v42, 0);

  }
  return v41;
}

void __36__MADServiceTextProcessingTask_run___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **p_cache;
  int *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v24;
    v20 = *MEMORY[0x1E0CB2F90];
    v19 = *MEMORY[0x1E0CB2D50];
    p_cache = &OBJC_METACLASS___MADVSKClient.cache;
    v6 = &OBJC_IVAR___VCPMADMLScalingTask__request;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(p_cache + 325, "subtaskForRequest:asset:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + v6[320]));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v9);
        }
        else
        {
          v10 = (void *)MEMORY[0x1E0CB35C8];
          v27 = v19;
          v11 = (void *)MEMORY[0x1E0CB3940];
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ not currently implemented"), v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v14 = v3;
          v15 = v4;
          v16 = p_cache;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "errorWithDomain:code:userInfo:", v20, -4, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setError:", v18);

          v6 = &OBJC_IVAR___VCPMADMLScalingTask__request;
          p_cache = v16;
          v4 = v15;
          v3 = v14;

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v3);
  }

}

- (void)cancel
{
  NSObject *cancelQueue;
  _QWORD block[5];

  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MADServiceTextProcessingTask_cancel__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __38__MADServiceTextProcessingTask_cancel__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)MADServiceTextProcessingTask;
  objc_msgSendSuper2(&v11, sel_cancel);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v12, 16);
    }
    while (v4);
  }

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
  objc_storeStrong((id *)&self->_subtasks, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
