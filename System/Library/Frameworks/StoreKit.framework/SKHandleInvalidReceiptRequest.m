@implementation SKHandleInvalidReceiptRequest

- (void)_start
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SKHandleInvalidReceiptRequest__start__block_invoke;
  v7[3] = &unk_1E5B26708;
  v7[4] = self;
  objc_msgSend(v3, "storeKitSynchronousServiceWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __39__SKHandleInvalidReceiptRequest__start__block_invoke_36;
  v6[3] = &unk_1E5B267D8;
  v6[4] = self;
  objc_msgSend(v5, "handleInvalidReceipt:", v6);

}

void __39__SKHandleInvalidReceiptRequest__start__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __39__SKHandleInvalidReceiptRequest__start__block_invoke_cold_1(a1, a2, v4, v5, v6, v7, v8, v9);
}

void __39__SKHandleInvalidReceiptRequest__start__block_invoke_36(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 138543362;
    v4 = v2;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Terminated due to invalid receipt.", (uint8_t *)&v3, 0xCu);
  }
}

void __39__SKHandleInvalidReceiptRequest__start__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "%{public}@: Error in remote proxy while terminating for invalid receipt: %{public}@", a5, a6, a7, a8, 2u);
}

@end
