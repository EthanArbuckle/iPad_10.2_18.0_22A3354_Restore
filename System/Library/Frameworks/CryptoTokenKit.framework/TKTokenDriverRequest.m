@implementation TKTokenDriverRequest

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKToken.m"), 267, CFSTR("Unexpected TKTokenDriverRequest context type"));

  }
  v6 = v5;
  objc_msgSend(v6, "setup");
  TK_LOG_token();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[TKTokenDriverRequest beginRequestWithExtensionContext:].cold.1(v6, v7);

}

- (void)beginRequestWithExtensionContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "driver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, a2, v5, "%{public}@: new beginRequest for token driver", v6);

  OUTLINED_FUNCTION_2();
}

@end
