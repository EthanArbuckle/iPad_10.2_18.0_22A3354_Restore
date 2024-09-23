@implementation EXConcreteExtensionTearDownRequestWithIdentifier

void __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  _EXLegacyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_cold_1();

  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_355;
  v6[3] = &unk_1E2CFCA20;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_safelyEndUsingRequestWithPKUUID:processAssertion:continuation:", v4, v5, v6);

}

void __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_355(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;

  v3 = a2;
  _EXLegacyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_355_cold_2();

  if (v3)
  {
    _EXLegacyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_355_cold_1(a1, v3, v5);

  }
  v6 = (id)objc_opt_self();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

void __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_0(&dword_190C25000, v0, v1, "Begining request '%{public}@' assertion (%{public}@) cleanup.", v2);
  OUTLINED_FUNCTION_6();
}

void __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_355_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_10_0(&dword_190C25000, a3, v6, "__plugin endUsing for '%{public}@' returned error: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

void __EXConcreteExtensionTearDownRequestWithIdentifier_block_invoke_355_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_0(&dword_190C25000, v0, v1, "Completed request '%{public}@' assertion (%{public}@) cleanup.", v2);
  OUTLINED_FUNCTION_6();
}

@end
