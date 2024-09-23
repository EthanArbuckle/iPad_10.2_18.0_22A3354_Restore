@implementation VCPMADServiceImageProcessingTask

- (VCPMADServiceImageProcessingTask)initWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 andCompletionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  VCPMADServiceImageProcessingTask *v16;
  VCPMADServiceImageProcessingTask *v17;
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
  v25[2] = __95__VCPMADServiceImageProcessingTask_initWithRequests_forAsset_cancelBlock_andCompletionHandler___block_invoke;
  v25[3] = &unk_1E6B15F88;
  v15 = v14;
  v26 = v15;
  v24.receiver = self;
  v24.super_class = (Class)VCPMADServiceImageProcessingTask;
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
    v21 = dispatch_queue_create("VCPMADServiceImageProcessingTask", 0);
    cancelQueue = v17->_cancelQueue;
    v17->_cancelQueue = (OS_dispatch_queue *)v21;

  }
  return v17;
}

uint64_t __95__VCPMADServiceImageProcessingTask_initWithRequests_forAsset_cancelBlock_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)taskWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 andCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequests:forAsset:cancelBlock:andCompletionHandler:", v9, v10, v11, v12);

  return v13;
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)run:(id *)p_isa
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSString *signpostPayload;
  NSObject *cancelQueue;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  NSString *v27;
  NSObject *v28;
  NSString *v29;
  os_signpost_id_t spid;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v41;
  __int16 v42;
  int v43;
  uint64_t v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v4);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    signpostPayload = self->_signpostPayload;
    *(_DWORD *)buf = 138412290;
    v41 = signpostPayload;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADServiceImageProcessingTask_Run", "%@", buf, 0xCu);
  }

  -[VCPMADServiceImageAsset setSignpostPayload:](self->_asset, "setSignpostPayload:", self->_signpostPayload);
  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCPMADServiceImageProcessingTask_run___block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
  if (!-[VCPMABaseTask isCanceled](self, "isCanceled"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = self->_subtasks;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    if (!v14)
    {
LABEL_29:

      VCPSignPostLog();
      v28 = objc_claimAutoreleasedReturnValue();
      p_isa = (id *)&v28->isa;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        v29 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v41 = v29;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, (os_log_t)p_isa, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADServiceImageProcessingTask_Run", "%@", buf, 0xCu);
      }

      -[VCPMABaseTask completionHandler](self, "completionHandler");
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      ((void (*)(NSMutableArray *, _QWORD, _QWORD))v10[2].super.super.isa)(v10, 0, 0);
      LOBYTE(p_isa) = 1;
      goto LABEL_33;
    }
    v15 = *(_QWORD *)v36;
    v32 = *MEMORY[0x1E0CB2F90];
    v33 = *MEMORY[0x1E0CB2D50];
LABEL_13:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x1BCCA1B2C]();
      v19 = objc_msgSend(v17, "run");
      v20 = v19;
      if (v19 == -128)
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
        }
        if (p_isa)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v44 = v33;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request was canceled"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", v32, -128, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *p_isa;
          *p_isa = v24;

        }
      }
      else if (v19
             && (int)MediaAnalysisLogLevel() >= 4
             && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v27;
        v42 = 1024;
        v43 = v20;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ returned unexpected status (%d)", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v18);
      if (v20 == -128)
        break;
      if (v14 == ++v16)
      {
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        if (v14)
          goto LABEL_13;
        goto LABEL_29;
      }
    }
LABEL_10:
    LOBYTE(p_isa) = 0;
LABEL_33:

    return (char)p_isa;
  }
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Request canceled", buf, 2u);
  }
  if (p_isa)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request was canceled"));
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v48[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *p_isa;
    *p_isa = v12;

    goto LABEL_10;
  }
  return (char)p_isa;
}

uint64_t __40__VCPMADServiceImageProcessingTask_run___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v19;
    v15 = *MEMORY[0x1E0CB2F90];
    v16 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v19 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "vcp_taskWithImageAsset:andSignpostPayload:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v6);
        }
        else
        {
          v7 = (void *)MEMORY[0x1E0CB35C8];
          v22 = v16;
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ not currently implemented"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "errorWithDomain:code:userInfo:", v15, -4, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setError:", v13);

        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v2);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "sortUsingComparator:", &__block_literal_global_56);
}

uint64_t __40__VCPMADServiceImageProcessingTask_run___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "dependencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", objc_opt_class());

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "dependencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", objc_opt_class());

    v8 = v10 << 63 >> 63;
  }

  return v8;
}

- (void)cancel
{
  NSObject *cancelQueue;
  _QWORD block[5];

  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCPMADServiceImageProcessingTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __42__VCPMADServiceImageProcessingTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 32;
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)VCPMADServiceImageProcessingTask;
  objc_msgSendSuper2(&v10, sel_cancel);
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = *(id *)(*(_QWORD *)v1 + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "cancel", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v11, 16);
    }
    while (v3);
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
