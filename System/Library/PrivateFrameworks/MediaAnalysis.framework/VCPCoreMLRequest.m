@implementation VCPCoreMLRequest

- (VCPCoreMLRequest)initWithModelName:(id)a3
{
  id v4;
  VCPCoreMLRequest *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  MLModel *model;
  VCPCoreMLRequest *v13;
  VCPCoreMLRequest *v14;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VCPCoreMLRequest;
  v5 = -[VCPCoreMLRequest init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", v4, CFSTR("mlmodelc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C9E958]);
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "setExperimentalMLE5EngineUsage:", 1);
        v16 = 0;
        objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v7, v9, &v16);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v16;
        model = v5->_model;
        v5->_model = (MLModel *)v10;

      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPCoreMLRequest Failed to create MLModelConfiguration", buf, 2u);
        }
        v11 = 0;
      }

    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] VCPCoreMLRequest Failed to open model file at url %@", buf, 0x16u);
    }
  }
  if (v5->_model)
    v13 = v5;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
