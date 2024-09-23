@implementation LSDService

void __50___LSDService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (!v3)
    {
      _LSDefaultLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        __50___LSDService_listener_shouldAcceptNewConnection___block_invoke_cold_1((uint64_t)WeakRetained, v4);

    }
    objc_msgSend(v3, "setExportedObject:", 0);
    objc_msgSend(WeakRetained, "connectionWasInvalidated:", v3);

  }
}

void __50___LSDService_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_182882000, a2, OS_LOG_TYPE_FAULT, "connection service %@ was unexpectedly nil in invalidation handler", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
