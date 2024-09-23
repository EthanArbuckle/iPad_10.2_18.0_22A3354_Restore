@implementation MLGenericPredictionRequest

- (id)initForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  MLGenericPredictionRequest *v15;
  MLGenericPredictionRequest *v16;
  objc_super v18;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "The model cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The model cannot be nil."));
  }
  if (!v10)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The input feature provider cannot be nil."));
  }
  if (!v11)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "The options cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The options cannot be nil."));
  }
  v18.receiver = self;
  v18.super_class = (Class)MLGenericPredictionRequest;
  v15 = -[MLGenericPredictionRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_model, a3);
    objc_storeStrong((id *)&v16->_inputFeatures, a4);
    objc_storeStrong((id *)&v16->_predictionOptions, a5);
    atomic_store(0, (unsigned __int8 *)&v16->_used);
    atomic_store(0, (unsigned __int8 *)&v16->_cancelled);
  }

  return v16;
}

- (void)submitWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  atomic<BOOL> *p_used;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "The completion handler cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completion handler cannot be nil."));
  }
  p_used = &self->_used;
  while (!__ldaxr((unsigned __int8 *)p_used))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_used))
      goto LABEL_12;
  }
  __clrex();
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Attempting to submit an already submitted prediction request.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Attempting to submit an already submitted prediction request."));
LABEL_12:
  -[MLGenericPredictionRequest model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__MLGenericPredictionRequest_submitWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E3D66928;
  v10 = v4;
  v12 = v10;
  objc_msgSend(v9, "submitPredictionRequest:completionHandler:", self, v11);

}

- (void)cancel
{
  id v3;

  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
  -[MLGenericPredictionRequest model](self, "model");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPredictionRequest:", self);

}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (MLFeatureProvider)inputFeatures
{
  return self->_inputFeatures;
}

- (MLPredictionOptions)predictionOptions
{
  return self->_predictionOptions;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_predictionOptions, 0);
  objc_storeStrong((id *)&self->_inputFeatures, 0);
}

uint64_t __58__MLGenericPredictionRequest_submitWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
