@implementation ATXAssertions

+ (void)parameterAssert:(id)a3 parameterName:(id)a4
{
  +[ATXAssertions parameterAssert:parameterName:descriptionString:](ATXAssertions, "parameterAssert:parameterName:descriptionString:", a3, a4, 0);
}

+ (void)parameterAssert:(id)a3 parameterName:(id)a4 descriptionString:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAssertions.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

    }
  }
  else
  {
    if (v10)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &v20);
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[ATXAssertions parameterAssert:parameterName:descriptionString:].cold.2();

    }
    else
    {
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[ATXAssertions parameterAssert:parameterName:descriptionString:].cold.1((uint64_t)v9, v12, v14, v15, v16, v17, v18, v19);
    }

  }
}

+ (void)assert:(BOOL)a3 conditionName:(id)a4
{
  +[ATXAssertions assert:conditionName:withDescriptionString:](ATXAssertions, "assert:conditionName:withDescriptionString:", a3, a4, 0);
}

+ (void)assert:(BOOL)a3 conditionName:(id)a4 withDescriptionString:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    if ((objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) != 0)
      goto LABEL_7;
LABEL_12:
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[ATXAssertions assert:conditionName:withDescriptionString:].cold.1((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_14;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &v19);
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) == 0)
  {
    if (v11)
    {
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[ATXAssertions assert:conditionName:withDescriptionString:].cold.2();
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (!v11)
  {
LABEL_7:
    if (a3)
    {
      v11 = 0;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAssertions.m"), 72, CFSTR("Condition %@ is unexpectedly false."), v9);
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAssertions.m"), 70, CFSTR("Condition %@ is unexpectedly false - %@"), v9, v11);
LABEL_15:

  }
LABEL_16:

}

+ (void)parameterAssert:(uint64_t)a3 parameterName:(uint64_t)a4 descriptionString:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1C99CA000, a2, a3, "%@ parameter is unexpectedly nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)parameterAssert:parameterName:descriptionString:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1C99CA000, v0, v1, "%@ parameter is unexpectedly nil - %@");
  OUTLINED_FUNCTION_10();
}

+ (void)assert:(uint64_t)a3 conditionName:(uint64_t)a4 withDescriptionString:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1C99CA000, a2, a3, "Condition %@ is unexpectedly false.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)assert:conditionName:withDescriptionString:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1C99CA000, v0, v1, "Condition %@ is unexpectedly false - %@");
  OUTLINED_FUNCTION_10();
}

@end
