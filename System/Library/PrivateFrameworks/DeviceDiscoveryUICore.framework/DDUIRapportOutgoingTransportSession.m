@implementation DDUIRapportOutgoingTransportSession

void __104___DDUIRapportOutgoingTransportSession_generateNetworkEndpointIdentifierForRemoteDevice_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _DDUICoreRapportLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 134218498;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1C87B2000, v7, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession finished generating mapping {self: %p, endpointUUID: %@, inError: %@}", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _DDUICoreRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = WeakRetained;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession did disconnect {self: %p}", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _DDUICoreRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = WeakRetained;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession did interrupt {self: %p}", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91___DDUIRapportOutgoingTransportSession_activateWithErrorHandler_messageHandler_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession activation completed {self: %p, inError: %@}", (uint8_t *)&v7, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32));

}

void __75___DDUIRapportOutgoingTransportSession_sendMessage_withTimeout_completion___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  _DDUICoreRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)a1[4];
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[5];
    v13 = 134218754;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportOutgoingTransportSession finished sending message {self: %p, sessionID: %@, messageID: %@, inResponse: %@}", (uint8_t *)&v13, 0x2Au);

  }
  v12 = a1[6];
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v7);

}

@end
