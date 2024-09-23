@implementation ACCCarPlay

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ACCCarPlay_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (id)sharedManager_sharedInstance;
}

void __27__ACCCarPlay_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = v1;

}

- (id)_init
{
  ACCCarPlay *v3;
  uint64_t v4;
  NSXPCConnection *xpcConnection;
  void *v6;
  objc_super v8;

  init_logging();
  v8.receiver = self;
  v8.super_class = (Class)ACCCarPlay;
  v3 = -[ACCCarPlay init](&v8, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.coreaccessories.ACCCarPlayService"));
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4C090);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3->_xpcConnection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v3->_xpcConnection, "resume");
  }
  return v3;
}

- (void)isCarPlayPairedWithCertSerial:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ACCCarPlay xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke;
  v15[3] = &unk_1E5FB3690;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_19;
  v13[3] = &unk_1E5FB36B8;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "isCarPlayPairedWithCertSerial:withReply:", v7, v13);

}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 7;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_19(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    (*(void (**)(void))(v1 + 16))();
  }
  else
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 7;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v4 = MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    else
    {
      v4 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_19_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)isWirelessCarPlayAllowedForCertSerial:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ACCCarPlay xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke;
  v15[3] = &unk_1E5FB3690;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_21;
  v13[3] = &unk_1E5FB36B8;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "isWirelessCarPlayAllowedForCertSerial:withReply:", v7, v13);

}

void __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 7;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_21(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    (*(void (**)(void))(v1 + 16))();
  }
  else
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 7;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v4 = MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    else
    {
      v4 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_21_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)carPlayAppLinksStateForCertSerial:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ACCCarPlay xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke;
  v15[3] = &unk_1E5FB3690;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_22;
  v13[3] = &unk_1E5FB36E0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "carPlayAppLinksStateForCertSerial:withReply:", v7, v13);

}

void __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 7;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_22(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    (*(void (**)(void))(v1 + 16))();
  }
  else
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 7;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v4 = MEMORY[0x1E0C81028];
      v3 = MEMORY[0x1E0C81028];
    }
    else
    {
      v4 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_22_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)carPlayIconStateForCertSerial:(id)a3 andAppCategories:(unint64_t)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = a3;
  -[ACCCarPlay xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke;
  v17[3] = &unk_1E5FB3690;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_24;
  v15[3] = &unk_1E5FB3708;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "carPlayIconStateForCertSerial:andAppCategories:withReply:", v9, a4, v15);

}

void __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  v3 = a2;
  if (gLogObjects)
    v4 = gNumLogObjects < 7;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 7;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v7 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_24_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)carPlayStartSessionForConnectionID:(unsigned int)a3 properties:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[ACCCarPlay xpcConnection](self, "xpcConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "carPlayStartSessionForConnectionID:properties:withReply:", v4, v6, &__block_literal_global_28);

}

void __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 7;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

}

void __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke_26(uint64_t a1, char a2, void *a3)
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 7;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v7 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke_26_cold_1();

  }
}

- (void)filterMatchingDigitalCarKeys:(id)a3 forAccessory:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ACCCarPlay xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_30;
  v14[3] = &unk_1E5FB3770;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "filterMatchingDigitalCarKeys:forAccessory:withReply:", v10, v9, v14);

}

void __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 7;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v5 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1();

}

void __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 7;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
      v9 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_30_cold_1();

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1AF649000, v0, v1, "can't invoke remote object %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__ACCCarPlay_isCarPlayPairedWithCertSerial_withReply___block_invoke_19_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, a1, a3, "%s no reply handler!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __62__ACCCarPlay_isWirelessCarPlayAllowedForCertSerial_withReply___block_invoke_21_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, a1, a3, "%s no reply handler!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __58__ACCCarPlay_carPlayAppLinksStateForCertSerial_withReply___block_invoke_22_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, a1, a3, "%s no reply handler!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __71__ACCCarPlay_carPlayIconStateForCertSerial_andAppCategories_withReply___block_invoke_24_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, a1, a3, "%s no reply handler!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __60__ACCCarPlay_carPlayStartSessionForConnectionID_properties___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, v0, v1, "failed to call ACCCarPlayService %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __78__ACCCarPlay_filterMatchingDigitalCarKeys_forAccessory_withCompletionHandler___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1AF649000, v0, v1, "call to ACCCarPlayService failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
