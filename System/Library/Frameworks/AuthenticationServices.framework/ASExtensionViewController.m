@implementation ASExtensionViewController

void __57___ASExtensionViewController__extensionRequestDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateNonUIRequestTimerIfNeeded");
    WeakRetained = v4;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4097, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_requestDidFailWithError:completion:", v3, 0);

      WeakRetained = v4;
    }
  }

}

void __53___ASExtensionViewController_setDismissOnBackground___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[125], "_kill:", 9);
    WeakRetained = v2;
  }

}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_2;
    v22[3] = &unk_24C9500D0;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    objc_msgSend(v11, "_sf_addHandlerForRequestIdentifier:withBlock:", v7, v22);
    objc_destroyWeak(&v23);
  }
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3;
  v16[3] = &unk_24C9500F8;
  v17 = v9;
  v18 = v8;
  v12 = *(void **)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = v7;
  v21 = v12;
  v13 = v7;
  v14 = v8;
  v15 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_extensionRequestDidFinish:", a2);

}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3_cold_1(v2, v3);
    objc_msgSend(*(id *)(a1 + 48), "_requestDidFailWithError:completion:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1000), "_extensionContextForUUID:", *(_QWORD *)(a1 + 56));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1000), "_as_auxiliaryRemoteObjectWithRequestID:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "_setRemoteViewController:", *(_QWORD *)(a1 + 40));

  }
}

void __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_2;
    v22[3] = &unk_24C9500D0;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    objc_msgSend(v11, "_sf_addHandlerForRequestIdentifier:withBlock:", v7, v22);
    objc_destroyWeak(&v23);
  }
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_3;
  v16[3] = &unk_24C9500F8;
  v17 = v9;
  v18 = v8;
  v12 = *(void **)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = v7;
  v21 = v12;
  v13 = v7;
  v14 = v8;
  v15 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

void __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_extensionRequestDidFinish:", a2);

}

void __67___ASExtensionViewController__beginNonUIRequest_connectionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3_cold_1(v2, v3);
    objc_msgSend(*(id *)(a1 + 48), "_requestDidFailWithError:completion:", 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1000), "_extensionContextForUUID:", *(_QWORD *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(v5 + 976);
    *(_QWORD *)(v5 + 976) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 976), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1000), "_as_auxiliaryRemoteObjectWithRequestID:", *(_QWORD *)(a1 + 56));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

uint64_t __85___ASExtensionViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "_invalidateNonUIRequestTimerIfNeeded");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 976);
  if (!v3)
    return objc_msgSend((id)v2, "_requestDidFailWithError:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 40) != v3)
    return objc_msgSend((id)v2, "_requestDidFailWithError:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = objc_msgSend(*(id *)(a1 + 48), "safari_matchesErrorDomain:andCode:", CFSTR("ASExtensionErrorDomain"), 100);
  v2 = *(_QWORD *)(a1 + 32);
  if (!v4 || !*(_BYTE *)(v2 + 992))
    return objc_msgSend((id)v2, "_requestDidFailWithError:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20E4D9000, v5, OS_LOG_TYPE_DEFAULT, "Extension requires user interaction - re-running with UI", v7, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_nonUIRequestDidRequireUserInteraction");
}

void __65___ASExtensionViewController__beginRequestWithConnectionHandler___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Failed to get remote view controller: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
