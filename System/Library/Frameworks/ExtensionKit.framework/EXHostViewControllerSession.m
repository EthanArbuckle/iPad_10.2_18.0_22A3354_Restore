@implementation EXHostViewControllerSession

void __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke_2;
  v3[3] = &unk_24C3E36E8;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "resumeWithReadyNotification:", v3);

}

uint64_t __89___EXHostViewControllerSession_sessionWithProcessConfiguration_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __41___EXHostViewControllerSession_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_prepareToHost");
}

void __53___EXHostViewControllerSession_processDidInvalidate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "extensionProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 32), "extensionProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "extensionProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_EX_processExitedErrorWithName:pid:", v8, objc_msgSend(v9, "pid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v10);

    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
  }
}

uint64_t __53___EXHostViewControllerSession_processDidInvalidate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50___EXHostViewControllerSession__invalidateSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_cold_1();

  objc_msgSend(v3, "_invalidateSession");
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_135(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _EXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_135_cold_1();

}

id __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_139(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

uint64_t __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_144(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "sceneEndpoint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 40);

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 48), "setSceneSessionConnection:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 48), "setExtensionProcess:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "sceneEndpoint");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setRemoteViewControllerEndpoint:", v4);

        return objc_msgSend(*(id *)(a1 + 48), "setState:", 2);
      }
    }
    if (*(_QWORD *)(a1 + 32) && objc_msgSend(*(id *)(a1 + 48), "requiresFBSceneHosting"))
    {
      objc_msgSend(*(id *)(a1 + 48), "setExtensionProcess:", *(_QWORD *)(a1 + 32));
      return objc_msgSend(*(id *)(a1 + 48), "setState:", 2);
    }
  }
  _EXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_144_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "setError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 48), "setState:", 5);
}

uint64_t __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke()
{
  return 0;
}

void __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _EXDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_151_cold_2();

    v10 = *(void **)(a1 + 32);
    v9 = (id *)(a1 + 32);
    objc_msgSend(v10, "setRemoteViewController:", v5);
    v11 = 4;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_151_cold_1();

    v12 = *(void **)(a1 + 32);
    v9 = (id *)(a1 + 32);
    objc_msgSend(v12, "setError:", v6);
    v11 = 5;
  }
  objc_msgSend(*v9, "setState:", v11);

}

uint64_t __67___EXHostViewControllerSession_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldAcceptXPCConnection:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, v0, v1, "Internal connection '%@' invalidated.", v2);
  OUTLINED_FUNCTION_2_0();
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_135_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, v0, v1, "Internal connection '%@' interupted.", v2);
  OUTLINED_FUNCTION_2_0();
}

void __60___EXHostViewControllerSession__internalQueue_prepareToHost__block_invoke_144_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_20AE73000, v0, v1, "Failed to get extension process and XPC endpoints with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_151_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20AE73000, v0, v1, "Remote viewcontroller request failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __59___EXHostViewControllerSession_requestRemoteViewController__block_invoke_151_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, v0, v1, "Received remote viewcontroller: %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
