@implementation DDUIRapportPairingTransport

void __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "availableDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    WeakRetained = v5;
  }

}

void __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "availableDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    WeakRetained = v5;
  }

}

void __70___DDUIRapportPairingTransport_activateForDeviceTypes_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport activated {self: %p, inError: %@}", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __74___DDUIRapportPairingTransport__setupListeningForResponseMessagesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("info"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sesID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("msgID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[5], "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134218498;
        v16 = WeakRetained;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_1C87B2000, v14, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming ResponderMessage w/ session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v15, 0x20u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
      objc_msgSend(v12, "handleIncomingMessage:withMessageID:", v9, v11);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 134218498;
        v16 = WeakRetained;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v6;
        _os_log_error_impl(&dword_1C87B2000, v14, OS_LOG_TYPE_ERROR, "_DDUIRapportPairingTransport - incoming ResponderMessage w/o session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v15, 0x20u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
    }

  }
}

void __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _DDUIRapportIncomingTransportSession *v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("info"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sesID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("msgID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
      objc_msgSend(WeakRetained[5], "objectForKey:", v12);
      v14 = (_DDUIRapportIncomingTransportSession *)objc_claimAutoreleasedReturnValue();
      v15 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          v17 = *(_QWORD *)(a1 + 32);
          v23 = 134218498;
          v24 = v17;
          v25 = 2112;
          v26 = v13;
          v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_1C87B2000, v15, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming InitiatorMessage w/ session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v23, 0x20u);
        }

        -[_DDUIRapportIncomingTransportSession messageHandler](v14, "messageHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[_DDUIRapportIncomingTransportSession messageHandler](v14, "messageHandler");
          v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v19)[2](v19, v11);

        }
      }
      else
      {
        if (v16)
        {
          v22 = *(_QWORD *)(a1 + 32);
          v23 = 134218498;
          v24 = v22;
          v25 = 2112;
          v26 = v13;
          v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_1C87B2000, v15, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming InitiatorMessage w/o session {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v23, 0x20u);
        }

        v14 = -[_DDUIRapportIncomingTransportSession initWithOptions:]([_DDUIRapportIncomingTransportSession alloc], "initWithOptions:", v8);
        -[_DDUIRapportIncomingTransportSession setSessionID:](v14, "setSessionID:", v12);
        -[_DDUIRapportIncomingTransportSession setClient:](v14, "setClient:", WeakRetained[3]);
        -[_DDUIRapportIncomingTransportSession setSessionType:](v14, "setSessionType:", 0);
        objc_msgSend(WeakRetained[5], "setObject:forKey:", v14, v12);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      v20 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 32);
        v23 = 134218498;
        v24 = v21;
        v25 = 2112;
        v26 = v13;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_1C87B2000, v20, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming InitiatorMessage missing sessionID, ignoring {self: %p, messageID: %@, inRequest: %@}", (uint8_t *)&v23, 0x20u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    }

  }
}

void __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _DDUIRapportIncomingTransportSession *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sesID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 134218498;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport - incoming continuity camera InitiatorMessage w/o session {self: %p, sessionID: %@, inRequest: %@}", (uint8_t *)&v11, 0x20u);
  }

  v10 = -[_DDUIRapportIncomingTransportSession initWithOptions:]([_DDUIRapportIncomingTransportSession alloc], "initWithOptions:", v6);
  -[_DDUIRapportIncomingTransportSession setSessionID:](v10, "setSessionID:", v7);
  -[_DDUIRapportIncomingTransportSession setClient:](v10, "setClient:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  -[_DDUIRapportIncomingTransportSession setSessionType:](v10, "setSessionType:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C87B2000, a2, a3, "Could not query listener mapping with error %@", a5, a6, a7, a8, 2u);
}

void __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C87B2000, a2, a3, "Could not create device listener mapping with error %@", a5, a6, a7, a8, 2u);
}

@end
