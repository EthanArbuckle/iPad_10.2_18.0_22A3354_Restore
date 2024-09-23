@implementation VCPHomeResidentMaintenanceTask

- (VCPHomeResidentMaintenanceTask)initWithOptions:(id)a3 extendTimeoutBlock:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPHomeResidentMaintenanceTask *v12;
  VCPHomeResidentMaintenanceTask *v13;
  void *v14;
  id extendTimeoutBlock;
  void *v16;
  id completionHandler;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VCPHomeResidentMaintenanceTask;
  v12 = -[VCPHomeResidentMaintenanceTask init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a3);
    v14 = _Block_copy(v10);
    extendTimeoutBlock = v13->_extendTimeoutBlock;
    v13->_extendTimeoutBlock = v14;

    v16 = _Block_copy(v11);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = v16;

    v13->_taskID = -1;
  }

  return v13;
}

+ (id)taskWithOptions:(id)a3 extendTimeoutBlock:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:extendTimeoutBlock:completionHandler:", v7, v8, v9);

  return v10;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void (**completionHandler)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Home resident maintenance task cancelled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, 0, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)VCPHomeResidentMaintenanceTask;
  -[VCPHomeResidentMaintenanceTask dealloc](&v9, sel_dealloc);
}

- (float)resourceRequirement
{
  return 0.7;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancel);
}

- (BOOL)isCanceled
{
  unsigned __int8 v2;
  uint64_t (**cancelBlock)(void);

  v2 = atomic_load((unsigned __int8 *)&self->_cancel);
  if ((v2 & 1) != 0)
  {
    LOBYTE(cancelBlock) = 1;
  }
  else
  {
    cancelBlock = (uint64_t (**)(void))self->_cancelBlock;
    if (cancelBlock)
      LOBYTE(cancelBlock) = cancelBlock[2]();
  }
  return (char)cancelBlock;
}

- (int)run
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int taskID;
  int v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  VCPHomeResidentMaintenanceTask *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD aBlock[5];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  dispatch_semaphore_t v28;
  _QWORD v29[7];
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t v40[4];
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Running Home Resident Maintenance task", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__20;
  v34 = __Block_byref_object_dispose__20;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v4 = (void *)getHMITaskServiceClass(void)::softClass;
  v39 = getHMITaskServiceClass(void)::softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getHMITaskServiceClass(void)::softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = (uint64_t)___ZL22getHMITaskServiceClassv_block_invoke;
    v26 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6B15540;
    v27 = (void (*)(uint64_t))&v36;
    ___ZL22getHMITaskServiceClassv_block_invoke((uint64_t)&v23);
    v4 = (void *)v37[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v36, 8);
  objc_msgSend(v6, "taskService");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  LODWORD(v39) = 0;
  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __37__VCPHomeResidentMaintenanceTask_run__block_invoke;
  v29[3] = &unk_1E6B16FC8;
  v29[4] = self;
  v29[5] = buf;
  v29[6] = &v36;
  +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:](VCPTimer, "timerWithIntervalSeconds:isOneShot:andBlock:", 1, 0, v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = (uint64_t)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__20;
  v27 = __Block_byref_object_dispose__20;
  v28 = dispatch_semaphore_create(0);
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __37__VCPHomeResidentMaintenanceTask_run__block_invoke_7;
  aBlock[3] = &unk_1E6B17880;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  v14 = v5;
  v15 = 3221225472;
  v16 = __37__VCPHomeResidentMaintenanceTask_run__block_invoke_9;
  v17 = &unk_1E6B178A8;
  v9 = v7;
  v18 = v9;
  v19 = self;
  v20 = &v36;
  v21 = &v23;
  v10 = _Block_copy(&v14);
  self->_taskID = objc_msgSend(*((id *)v31 + 5), "submitTaskWithOptions:progressHandler:completionHandler:", self->_options, v8, v10, v14, v15, v16, v17);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    taskID = self->_taskID;
    *(_DWORD *)v40 = 67109120;
    v41 = taskID;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "HomeAI request submitted (%d)", v40, 8u);
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v24 + 40), 0xFFFFFFFFFFFFFFFFLL);
  v12 = *((_DWORD *)v37 + 6);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(v3);
  return v12;
}

_DWORD *__37__VCPHomeResidentMaintenanceTask_run__block_invoke(_QWORD *a1)
{
  _DWORD *result;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  result = (_DWORD *)a1[4];
  if (result[7] != -1)
  {
    result = (_DWORD *)objc_msgSend(result, "isCanceled");
    if ((_DWORD)result)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v3 = *(_DWORD *)(a1[4] + 28);
        v4[0] = 67109120;
        v4[1] = v3;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Canceling Home Resident Maintenance task (%d)", (uint8_t *)v4, 8u);
      }
      result = (_DWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "cancelTask:", *(unsigned int *)(a1[4] + 28));
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -128;
    }
  }
  return result;
}

uint64_t __37__VCPHomeResidentMaintenanceTask_run__block_invoke_7(uint64_t a1, double a2)
{
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Progress %.2f", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

void __37__VCPHomeResidentMaintenanceTask_run__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "destroy");
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16))();
  if (v5)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "code");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_extendTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
