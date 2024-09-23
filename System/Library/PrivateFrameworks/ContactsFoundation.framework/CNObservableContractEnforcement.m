@implementation CNObservableContractEnforcement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationContext, 0);
}

+ (BOOL)shouldSwizzleNilResults
{
  return +[CNObservableContractEnforcementPreferences shouldSwizzleNilResults](CNObservableContractEnforcementPreferences, "shouldSwizzleNilResults");
}

- (void)observerDidReceiveResult:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (self->_state)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.5(&self->_state, v5, v6);

    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.1();

    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.3((uint64_t)self);

    v9 = CNObserverProtocolExceptionNullMarker[0];
    if (v4)
      v9 = v4;
    v22[0] = v9;
    v21[0] = CNObserverProtocolExceptionResultKey[0];
    v21[1] = CNObserverProtocolExceptionStateKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_state);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CNObserverThrowProtocolExceptionWithReason(CFSTR("Result after termination"), v11);

  }
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);

    objc_msgSend((id)objc_opt_class(), "os_log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.1();

    CNObserverThrowProtocolExceptionWithReason(CFSTR("Result cannot be nil"), 0);
  }

}

- (void)observerDidFailWithError:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  CNObservableContractTerminationContext *v13;
  CNObservableContractTerminationContext *terminationContext;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (self->_state)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidFailWithError:].cold.6(&self->_state, v5, v6);

    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidFailWithError:].cold.5();

    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.1();

    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.3((uint64_t)self);

    v10 = CNObserverProtocolExceptionNullMarker[0];
    if (v4)
      v10 = v4;
    v25[0] = v10;
    v24[0] = CNObserverProtocolExceptionErrorKey[0];
    v24[1] = CNObserverProtocolExceptionStateKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_state);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNObserverThrowProtocolExceptionWithReason(CFSTR("Failing after termination"), v12);

  }
  self->_state = 2;
  +[CNObservableContractTerminationContext currentContext](CNObservableContractTerminationContext, "currentContext");
  v13 = (CNObservableContractTerminationContext *)objc_claimAutoreleasedReturnValue();
  terminationContext = self->_terminationContext;
  self->_terminationContext = v13;

  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidFailWithError:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

    objc_msgSend((id)objc_opt_class(), "os_log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CNObservableContractEnforcement observerDidReceiveResult:].cold.1();

    CNObserverThrowProtocolExceptionWithReason(CFSTR("Error cannot be nil"), 0);
  }

}

- (void)observerDidComplete
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*a1 == 1)
    v3 = CFSTR("completed");
  else
    v3 = CFSTR("failed");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, a2, a3, "An observer was completed after being %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_10();
}

+ (BOOL)shouldEnforceRxProtocols
{
  return +[CNObservableContractEnforcementPreferences shouldEnforceRxProtocols](CNObservableContractEnforcementPreferences, "shouldEnforceRxProtocols");
}

+ (id)os_log
{
  if (os_log_cn_once_token_15 != -1)
    dispatch_once(&os_log_cn_once_token_15, &__block_literal_global_41);
  return (id)os_log_cn_once_object_15;
}

void __41__CNObservableContractEnforcement_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.reactive-extensions", "contract-enforcement");
  v1 = (void *)os_log_cn_once_object_15;
  os_log_cn_once_object_15 = (uint64_t)v0;

}

- (void)observerDidReceiveResult:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_18F80C000, v1, v2, "Call stack: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)observerDidReceiveResult:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F80C000, a1, a3, "An observer was sent a nil result", a5, a6, a7, a8, 0);
}

- (void)observerDidReceiveResult:(uint64_t)a1 .cold.3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_6_0();
  objc_msgSend(*(id *)(a1 + 16), "callStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_3(&dword_18F80C000, v3, v4, "Termination call stack (thread 0x%llx (%llu)): %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5();
}

- (void)observerDidReceiveResult:(uint64_t)a3 .cold.5(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*a1 == 1)
    v3 = CFSTR("completed");
  else
    v3 = CFSTR("failed");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, a2, a3, "An observer was sent result after being %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_10();
}

- (void)observerDidFailWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F80C000, a1, a3, "[Rx] An observer was failed with a nil error", a5, a6, a7, a8, 0);
}

- (void)observerDidFailWithError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, v0, v1, "Error: %@", v2);
  OUTLINED_FUNCTION_10();
}

- (void)observerDidFailWithError:(uint64_t)a3 .cold.6(_QWORD *a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*a1 == 1)
    v3 = CFSTR("completed");
  else
    v3 = CFSTR("failed");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_18F80C000, a2, a3, "An observer was failed after being %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_10();
}

@end
