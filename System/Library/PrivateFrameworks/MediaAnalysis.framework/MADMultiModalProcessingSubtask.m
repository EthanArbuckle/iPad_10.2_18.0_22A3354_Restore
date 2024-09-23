@implementation MADMultiModalProcessingSubtask

+ (BOOL)prewarmRequest:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2F90];
    v13 = *MEMORY[0x1E0CB2D50];
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Pre-warming not implemented for %@"), v9, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, -4, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)subtaskForRequest:(id)a3 inputs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequest:inputs:", v5, v6);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No subtask implemented for %@", (uint8_t *)&v11, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (MADMultiModalProcessingSubtask)initWithRequest:(id)a3 inputs:(id)a4
{
  id v7;
  id v8;
  MADMultiModalProcessingSubtask *v9;
  MADMultiModalProcessingSubtask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADMultiModalProcessingSubtask;
  v9 = -[MADMultiModalProcessingSubtask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_inputs, a4);
  }

  return v10;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (int)run
{
  return -4;
}

- (MADMultiModalRequest)request
{
  return self->_request;
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
