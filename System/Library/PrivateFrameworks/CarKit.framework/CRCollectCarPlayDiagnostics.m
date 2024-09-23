@implementation CRCollectCarPlayDiagnostics

void __CRCollectCarPlayDiagnostics_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    CarGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __CRCollectCarPlayDiagnostics_block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

uint64_t __CRCollectCarPlayDiagnostics_block_invoke_113(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __CRCollectCarPlayDiagnostics_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "CarPlay diagnostics error: %@", a5, a6, a7, a8, 2u);
}

@end
