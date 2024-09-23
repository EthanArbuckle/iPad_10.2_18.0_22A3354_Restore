@implementation AKLAContextValidator

+ (BOOL)validateExternalizedContext:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v13;

  v5 = (objc_class *)MEMORY[0x1E0CC1298];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithExternalizedContext:", v6);

  v13 = 0;
  objc_msgSend(v7, "evaluatePolicy:options:error:", 4, MEMORY[0x1E0C9AA70], &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  _AKLogSiwa();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[AKLAContextValidator validateExternalizedContext:error:].cold.2((uint64_t)v8, (uint64_t)v9, v10);

  if (v9)
  {
    _AKLogSiwa();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[AKLAContextValidator validateExternalizedContext:error:].cold.1((uint64_t)v9, v11);

    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v9 == 0;
}

+ (void)validateExternalizedContext:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Failed to validate externalized Context data with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)validateExternalizedContext:(os_log_t)log error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Biometric validation of externalizedContext completed with result: %@ and error: %@", (uint8_t *)&v3, 0x16u);
}

@end
