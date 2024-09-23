@implementation VCPMABaseTask

- (VCPMABaseTask)init
{

  return 0;
}

- (VCPMABaseTask)initWithCompletionHandler:(id)a3
{
  id v4;
  VCPMABaseTask *v5;
  void *v6;
  id completionHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPMABaseTask;
  v5 = -[VCPMABaseTask init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = v6;

  }
  return v5;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void (**completionHandler)(id, _QWORD, void *);
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ canceled"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, 0, v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)VCPMABaseTask;
  -[VCPMABaseTask dealloc](&v12, sel_dealloc);
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

- (BOOL)isCanceled
{
  unsigned __int8 v2;
  uint64_t (**cancelBlock)(void);

  v2 = atomic_load((unsigned __int8 *)&self->_canceled);
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

- (BOOL)run:(id *)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0CB2D50];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is not yet implemented"), v7, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *a3;
  *a3 = v10;

  return 0;
}

- (int)run
{
  void *v3;
  int v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  v12 = 0;
  if (-[VCPMABaseTask run:](self, "run:", &v12))
  {
    v4 = 0;
  }
  else
  {
    if (objc_msgSend(v12, "code") == -128)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ canceled (%@)", buf, 0x16u);

      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ failed (%@)", buf, 0x16u);

    }
    (*((void (**)(void))self->_completionHandler + 2))();
    v4 = objc_msgSend(v12, "code");
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
