@implementation SFAppAutoFillPasswordViewController

void __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_2(a1, v9, (uint64_t)v6);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 984), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "serviceViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setTarget:", v10);

  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_1(v9, v7);
  }

}

uint64_t __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;

  v4 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke_cold_1(a1, a2, v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_FAULT, "Failed to get remote password picker view controller with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

void __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v6 = 134218498;
  v7 = v4;
  v8 = 2114;
  v9 = objc_opt_class();
  v10 = 2048;
  v11 = a3;
  _os_log_debug_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_DEBUG, "In-process view controller %p got remote password picker view controller %{public}@ <%p>", (uint8_t *)&v6, 0x20u);

}

void __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke_cold_1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 134218240;
  v5 = v3;
  v6 = 1024;
  v7 = a2 & 1;
  _os_log_debug_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_DEBUG, "In-process view controller %p got authentication result %d ", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_3_2();
}

@end
