@implementation ATXModeEntityModelTrialHelper

- (ATXModeEntityModelTrialHelper)init
{
  ATXModeEntityModelTrialHelper *v2;
  uint64_t v3;
  ATXModeEntityTrialClientWrapper *modeEntityTrialClientWrapper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXModeEntityModelTrialHelper;
  v2 = -[ATXModeEntityModelTrialHelper init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v3;

  }
  return v2;
}

- (id)loadCoreMLModelFromTrialWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  char v17;

  v4 = a3;
  -[ATXModeEntityTrialClientWrapper directoryPathForTrialResource:](self->_modeEntityTrialClientWrapper, "directoryPathForTrialResource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v17);

  if (v7)
    v8 = v17 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setComputeUnits:", 0);
    v10 = (void *)MEMORY[0x1E0C9E940];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "modelWithContentsOfURL:configuration:error:", v11, v9, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    if (v13)
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXModeEntityModelTrialHelper loadCoreMLModelFromTrialWithName:].cold.1((uint64_t)v4, (uint64_t)v13, v14);

    }
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
}

- (void)loadCoreMLModelFromTrialWithName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXModeEntityModelTrialHelper: Error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
}

@end
