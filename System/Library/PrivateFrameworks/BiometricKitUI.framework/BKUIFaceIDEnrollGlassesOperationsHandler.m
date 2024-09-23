@implementation BKUIFaceIDEnrollGlassesOperationsHandler

- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:(id)a3
{
  id v4;
  BKUIMatchVerifyPearlOperation *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  id v19;

  v4 = a3;
  -[BKUIFaceIDEnrollOperationsHandler setMatchUserThenDoSingleEnrollmentCompletion:](self, "setMatchUserThenDoSingleEnrollmentCompletion:", v4);
  v5 = objc_alloc_init(BKUIMatchVerifyPearlOperation);
  -[BKUIFaceIDEnrollOperationsHandler setMatchOperation:](self, "setMatchOperation:", v5);

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "setOperationsDelegate:", v6);

  v19 = 0;
  LOBYTE(v7) = -[BKUIFaceIDEnrollOperationsHandler _matchOperationPreflightCheck:](self, "_matchOperationPreflightCheck:", &v19);
  v8 = v19;
  if ((v7 & 1) != 0)
  {
    if (-[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration") == 4)
    {
      -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setState:animated:", 3, 1);

    }
    objc_initWeak(&location, self);
    -[BKUIFaceIDEnrollOperationsHandler matchOperation](self, "matchOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFaceIDEnrollOperationsHandler device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke;
    v15[3] = &unk_1EA27FC50;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    objc_msgSend(v10, "startMatchOperationWithDevice:identity:credential:withConfiguration:matchOperationActionBlock:", v11, v12, v8, v13, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    _BKUILoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BKUIFaceIDEnrollGlassesOperationsHandler matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:].cold.1();

  }
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!v3)
  {
    objc_msgSend(WeakRetained, "matchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchOperation:failedToMatchWithUserPositionSubstate:operationCompleteAction:", v6, objc_msgSend(v7, "lastErrorousSubState"), *(_QWORD *)(a1 + 32));

LABEL_13:
    goto LABEL_18;
  }
  if ((objc_msgSend(WeakRetained, "supportsPeriocularEnrollment") & 1) == 0)
  {
    _BKUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_3();

    objc_msgSend(v5, "operationsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -4;
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "hasPeriocularEnrollment") & 1) == 0)
  {
    _BKUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_2();

    objc_msgSend(v5, "matchOperation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchOperation:failedToMatchWithUserPositionSubstate:operationCompleteAction:", v6, 11, *(_QWORD *)(a1 + 32));
    goto LABEL_13;
  }
  if ((objc_msgSend(v3, "canAddPeriocularEnrollment") & 1) == 0)
  {
    _BKUILoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_1();

    objc_msgSend(v5, "operationsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -6;
LABEL_17:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endEnrollFlowWithError:", v14);

    goto LABEL_18;
  }
  objc_msgSend(v5, "startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:", objc_msgSend(v5, "enrollmentType"), objc_msgSend(v5, "glassesRequirement"), v3, *(_QWORD *)(a1 + 32));
LABEL_18:

}

- (BOOL)showAddGlassesButton
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[BKUIFaceIDEnrollOperationsHandler supportsPeriocularEnrollment](self, "supportsPeriocularEnrollment"))
    return 0;
  -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canAddPeriocularEnrollment"))
  {
    -[BKUIFaceIDEnrollOperationsHandler identity](self, "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasPeriocularEnrollment"))
      v5 = -[BKUIFaceIDEnrollOperationsHandler glassesFound](self, "glassesFound");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DB281000, v0, v1, "Mathc Operation preflight check failed:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DB281000, v0, v1, "Periocular enrollment canAddPeriocularEnrollment was NO, slots are prob full.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DB281000, v0, v1, "Periocular enrollment needed as a prerequisite prior to adding glasses.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DB281000, v0, v1, "This device does not support periocular enrollment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
