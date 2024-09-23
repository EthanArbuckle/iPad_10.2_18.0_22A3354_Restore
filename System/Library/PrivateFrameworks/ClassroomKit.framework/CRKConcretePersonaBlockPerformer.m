@implementation CRKConcretePersonaBlockPerformer

- (void)adoptPersonaWithUniqueString:(id)a3 andPerformBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  _BYTE v24[16];
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v6)
  {
LABEL_8:
    v13 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  -[CRKConcretePersonaBlockPerformer currentPersona](self, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    _CRKLogASM_0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:].cold.2(v14);

    goto LABEL_8;
  }
  objc_msgSend(v8, "userPersonaUniqueString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userPersonaUniqueString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v6);

  if ((v12 & 1) != 0)
  {
    v13 = 0;
    goto LABEL_9;
  }
  v23 = 0;
  v13 = (void *)objc_msgSend(v9, "copyCurrentPersonaContextWithError:", &v23);
  v18 = v23;
  if (v13)
  {
    objc_msgSend(v9, "createPersonaContextForBackgroundProcessingWithPersonaUniqueString:", v6);
    v19 = objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_9;
    _CRKLogASM_0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:].cold.4((uint64_t)v6, v20, v21);
    v18 = (id)v19;
  }
  else
  {
    _CRKLogASM_0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "verboseDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:].cold.3(v22, (uint64_t)v25, v20);
    }
  }

LABEL_9:
  v7[2](v7);
  if (v13)
  {
    objc_msgSend(v9, "restorePersonaWithSavedPersonaContext:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      _CRKLogASM_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "verboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKConcretePersonaBlockPerformer adoptPersonaWithUniqueString:andPerformBlock:].cold.1(v17, (uint64_t)v24, v16);
      }

    }
  }

}

- (id)currentPersona
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)adoptPersonaWithUniqueString:(NSObject *)a3 andPerformBlock:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a3, (uint64_t)a3, "Failed to restore old persona: %{public}@", (uint8_t *)a2);

}

- (void)adoptPersonaWithUniqueString:(os_log_t)log andPerformBlock:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "There is no current persona", v1, 2u);
}

- (void)adoptPersonaWithUniqueString:(NSObject *)a3 andPerformBlock:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a3, (uint64_t)a3, "Error copying current persona context: %{public}@", (uint8_t *)a2);

}

- (void)adoptPersonaWithUniqueString:(uint64_t)a3 andPerformBlock:.cold.4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a2, a3, "Failed to create persona context for persona identifier %{public}@", (uint8_t *)&v3);
}

@end
