@implementation DDUIRemoteDisplaySessionHandler

void __50___DDUIRemoteDisplaySessionHandler_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

void __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;

  v3 = a2;
  if (v3)
  {
    _DDUICoreLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 8) = v3 != 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74___DDUIRemoteDisplaySessionHandler_enterSessionWithRemoteDeviceID_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!a2)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[2], "enterDiscoverySessionWithDevice:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v5;
  }

}

void __72___DDUIRemoteDisplaySessionHandler_presentProxCardForDevice_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _DDUICoreLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = WeakRetained;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "{self: %@} Dedicated camera prox card response: %@ with error: %@", (uint8_t *)&v10, 0x20u);
  }

  v9 = (void *)WeakRetained[3];
  WeakRetained[3] = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C87B2000, a2, a3, "%@: could not activate remote display discovery", a5, a6, a7, a8, 2u);
}

@end
