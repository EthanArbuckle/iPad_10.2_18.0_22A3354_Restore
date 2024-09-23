@implementation FPBlockRecoveryAttempter

- (FPBlockRecoveryAttempter)initWithBlock:(id)a3 operationService:(id)a4
{
  id v6;
  id v7;
  FPBlockRecoveryAttempter *v8;
  uint64_t v9;
  id recoveryBlock;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPBlockRecoveryAttempter;
  v8 = -[FPBlockRecoveryAttempter init](&v12, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1A1B00850](v6);
    recoveryBlock = v8->_recoveryBlock;
    v8->_recoveryBlock = (id)v9;

    objc_storeStrong((id *)&v8->_fpxOperationService, a4);
  }

  return v8;
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;

  v6 = a3;
  v7 = objc_msgSend(v6, "code");
  WeakRetained = objc_loadWeakRetained((id *)&self->_expectedError);
  v9 = objc_msgSend(WeakRetained, "code");

  if (v7 != v9)
  {
    v10 = objc_msgSend(v6, "code");
    v11 = objc_loadWeakRetained((id *)&self->_expectedError);
    v12 = objc_msgSend(v11, "code");

    if (v10 != v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSError+FPAdditions.m"), 843, CFSTR("unexpected error code"));

    }
  }
  objc_msgSend(v6, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)&self->_expectedError);
  objc_msgSend(v14, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v15)
  {
    objc_msgSend(v6, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)&self->_expectedError);
    objc_msgSend(v17, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSError+FPAdditions.m"), 844, CFSTR("unexpected error domain"));

    }
  }
  objc_msgSend(v6, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKey:", CFSTR("FPErrorSuppressionCheckboxIsChecked"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v20, "BOOLValue"))
    {
      objc_msgSend(v6, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "valueForKey:", CFSTR("FPUserInteractionIdentifier"));
      v22 = objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:].cold.3();

        objc_msgSend(v6, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("DomainIdentifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[FPXOperationService userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:](self->_fpxOperationService, "userCheckedSuppressionCheckboxForUserInteractionIdentifier:domainIdentifier:completionHandler:", v22, v24, &__block_literal_global_215);
      }
      else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:].cold.2();
      }

    }
    else
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:].cold.4();
    }
  }
  else
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:].cold.1();
  }

  (*((void (**)(void))self->_recoveryBlock + 2))();
  return 1;
}

void __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_2((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_1();
  }

}

- (NSError)expectedError
{
  return (NSError *)objc_loadWeakRetained((id *)&self->_expectedError);
}

- (void)setExpectedError:(id)a3
{
  objc_storeWeak((id *)&self->_expectedError, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expectedError);
  objc_storeStrong((id *)&self->_fpxOperationService, 0);
  objc_storeStrong(&self->_recoveryBlock, 0);
}

- (void)attemptRecoveryFromError:optionIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] Suppression: did not find value in userInfo, or it wasn't an NSNumber", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)attemptRecoveryFromError:optionIndex:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_31();
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Suppression: Expected valid user interaction identifier, if the user was shown the suppression checkbox", v1, 2u);
  OUTLINED_FUNCTION_30();
}

- (void)attemptRecoveryFromError:optionIndex:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] Suppression: Finder signaled FP that user has checked suppression checkbox for predicate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)attemptRecoveryFromError:optionIndex:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] Suppression: was not checked by user", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] Suppression: Sent the suppression message back to the extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] Suppression: Error async sending suppression checkbox notification to extension: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
