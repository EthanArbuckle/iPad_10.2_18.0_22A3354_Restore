@implementation MLRTrialTask

- (MLRTrialTask)initWithTriClient:(id)a3
{
  id v5;
  MLRTrialTask *v6;
  MLRTrialTask *v7;
  MLRTrialTask *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v5 = a3;
  if (!objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLRTrialTask initWithTriClient:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_10;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MLRTrialTask initWithTriClient:].cold.2(v9, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:

    v8 = 0;
    goto LABEL_11;
  }
  v25.receiver = self;
  v25.super_class = (Class)MLRTrialTask;
  v6 = -[MLRTrialTask init](&v25, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_triClient, a3);
  self = v7;
  v8 = self;
LABEL_11:

  return v8;
}

- (MLRTrialTask)initWithTrialTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  MLRTrialTask *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;

  v4 = a3;
  if (!objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLRTrialTask initWithTriClient:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x24BEBA900];
  v6 = objc_msgSend(v4, "projectId");
  objc_msgSend(v4, "evaluationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientWithProjectId:factorsState:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MLRTrialTask initWithTrialTask:].cold.2(v4, v17);

LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  self = -[MLRTrialTask initWithTriClient:](self, "initWithTriClient:", v8);
  v9 = self;
LABEL_10:

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)\n"), v5, self->_triClient);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triClient, 0);
}

- (void)initWithTriClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "Trial.framework is not loaded.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithTriClient:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "triClient cannot be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithTrialTask:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "evaluationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2112F5000, a2, OS_LOG_TYPE_ERROR, "Fail to initialize TRIClient with factoryState=%@.", (uint8_t *)&v4, 0xCu);

}

@end
