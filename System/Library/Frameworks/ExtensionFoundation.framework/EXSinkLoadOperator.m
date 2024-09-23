@implementation EXSinkLoadOperator

void __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v5;
        objc_msgSend(v8, "resourceURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v5 = v8;
        if (v9)
        {
          objc_setAssociatedObject(v9, v8, v8, (void *)0x301);
          v5 = v10;

        }
      }
    }
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_122_cold_2();
  }
  else
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_122_cold_1(a1, (uint64_t)v7, v11);
    v5 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __88___EXSinkLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88___EXSinkLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_190C25000, v0, v1, "Connection error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_122_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
}

void __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_122_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v4 = 2114;
  v5 = v0;
  v6 = 2114;
  v7 = v1;
}

@end
