@implementation AMUIIconModelStore

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v6 = a3;
  -[AMUIIconModelStore iconModelStoreDelegate](self, "iconModelStoreDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = objc_msgSend(v7, "iconModelStore:saveIconState:toPosterConfigurationWithError:", self, v6, &v20);

  v9 = v20;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    v11 = objc_retainAutorelease(v9);
    *a4 = v11;
    AMUILogInfograph();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AMUIIconModelStore saveCurrentIconState:error:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

  }
  return v8;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (id)loadCurrentIconState:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  -[AMUIIconModelStore iconModelStoreDelegate](self, "iconModelStoreDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "iconModelStore:loadIconStateFromPosterConfigurationWithError:", self, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (!v6)
  {
    AMUILogInfograph();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AMUIIconModelStore loadCurrentIconState:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    if (v7)
      *a3 = objc_retainAutorelease(v7);
  }

  return v6;
}

- (id)loadDesiredIconState:(id *)a3
{
  return 0;
}

- (AMUIIconModelStoreDelegate)iconModelStoreDelegate
{
  return (AMUIIconModelStoreDelegate *)objc_loadWeakRetained((id *)&self->_iconModelStoreDelegate);
}

- (void)setIconModelStoreDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_iconModelStoreDelegate, a3);
}

- (PRSPosterConfiguration)posterConfiguration
{
  return (PRSPosterConfiguration *)objc_loadWeakRetained((id *)&self->_posterConfiguration);
}

- (void)setPosterConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_posterConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_posterConfiguration);
  objc_destroyWeak((id *)&self->_iconModelStoreDelegate);
}

- (void)saveCurrentIconState:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_23600A000, a2, a3, "Failed to save icon state in poster configuration withError:%@", a5, a6, a7, a8, 2u);
}

- (void)loadCurrentIconState:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_23600A000, a2, a3, "Received nil icon state from poster configuration with error:%@", a5, a6, a7, a8, 2u);
}

@end
