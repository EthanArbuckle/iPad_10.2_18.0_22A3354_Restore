@implementation CNObserverCancelableCompletionHandler

void __CNObserverCancelableCompletionHandler_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __CNObserverCancelableCompletionHandler_block_invoke_cold_4(v8);

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __CNObserverCancelableCompletionHandler_block_invoke_cold_3((uint64_t)v5, v9, v10);

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __CNObserverCancelableCompletionHandler_block_invoke_cold_2((uint64_t)v7, v11, v12);

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __CNObserverCancelableCompletionHandler_block_invoke_cold_1(v13);

    v22[0] = CNObserverProtocolExceptionResultKey[0];
    v22[1] = CNObserverProtocolExceptionErrorKey[0];
    v23[0] = v5;
    v23[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CNObserverThrowProtocolExceptionWithReason(CFSTR("Either the result or the error must be nil"), v14);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __CNObserverCancelableCompletionHandler_block_invoke_23;
  v18[3] = &unk_1E29B9308;
  v19 = v5;
  v20 = v7;
  v15 = *(void **)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v5;
  objc_msgSend(v15, "performBlock:", v18);

}

uint64_t __CNObserverCancelableCompletionHandler_block_invoke_23(_QWORD *a1)
{
  return +[CNObserver sendResult:error:toObserver:](CNObserver, "sendResult:error:toObserver:", a1[4], a1[5], a1[6]);
}

void __CNObserverCancelableCompletionHandler_block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v2;
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, a1, v3, "Call stack: %{public}@", (uint8_t *)&v4);

}

void __CNObserverCancelableCompletionHandler_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, a2, a3, "Error : %{error}@", (uint8_t *)&v3);
}

void __CNObserverCancelableCompletionHandler_block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, a2, a3, "Result: %{public}@", (uint8_t *)&v3);
}

void __CNObserverCancelableCompletionHandler_block_invoke_cold_4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F80C000, log, OS_LOG_TYPE_ERROR, "An observer completion handler is being called incorrectly.", v1, 2u);
}

@end
