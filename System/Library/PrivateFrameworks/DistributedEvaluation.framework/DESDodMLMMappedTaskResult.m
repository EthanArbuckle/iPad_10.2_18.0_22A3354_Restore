@implementation DESDodMLMMappedTaskResult

- (DESDodMLMMappedTaskResult)initWithJSONResult:(id)a3 binaryResult:(id)a4 deferred:(BOOL)a5 deferralURL:(id)a6 duration:(double)a7
{
  return -[DESDodMLMMappedTaskResult initWithJSONResult:sandboxManager:mmappedFile:duration:](self, "initWithJSONResult:sandboxManager:mmappedFile:duration:", a3, 0, 0, a6, a7);
}

- (DESDodMLMMappedTaskResult)initWithJSONResult:(id)a3 sandboxManager:(id)a4 mmappedFile:(id)a5 duration:(double)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  DESDodMLMMappedTaskResult *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v12, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)DESDodMLMMappedTaskResult;
  v15 = -[DESInternalDodMLTaskResult initWithJSONResult:binaryResult:deferred:deferralURL:duration:](&v17, sel_initWithJSONResult_binaryResult_deferred_deferralURL_duration_, v13, v14, 0, 0, a6);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_sandboxManager, a4);
    objc_storeStrong((id *)&v15->_mmappedFile, a5);
  }

  return v15;
}

- (void)dealloc
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Fail to remove %@ with error=%@", (uint8_t *)&v3, 0x16u);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTaskResult binaryResult](self, "binaryResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[DESMMappedFile fileURL](self->_mmappedFile, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTaskResult JSONResult](self, "JSONResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(binaryResult.length=%lu, binaryResultURL=%@, JSONResult=%@)"), v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmappedFile, 0);
  objc_storeStrong((id *)&self->_sandboxManager, 0);
}

@end
