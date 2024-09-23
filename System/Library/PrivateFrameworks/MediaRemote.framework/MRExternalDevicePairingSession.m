@implementation MRExternalDevicePairingSession

- (MRExternalDevicePairingSession)initWithDevice:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRExternalDevicePairingSession;
  return -[MRCryptoPairingSession initWithRole:device:](&v4, sel_initWithRole_device_, 0, a3);
}

- (unint64_t)state
{
  return -[MRCoreUtilsPairingSession state](self->_pairingSession, "state");
}

- (BOOL)hasExchangedMessage
{
  return -[MRCoreUtilsPairingSession hasExchangedMessage](self->_pairingSession, "hasExchangedMessage");
}

- (BOOL)isUsingSystemPairing
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (BOOL)isValid
{
  return -[MRCoreUtilsPairingSession isValid](self->_pairingSession, "isValid");
}

- (BOOL)isPaired
{
  void *v3;
  MRCoreUtilsSystemPairingSession *v4;
  uint64_t v5;
  MRCoreUtilsSystemPairingSession *v6;
  MRCoreUtilsPairingSession *v8;
  void *v9;
  MRCoreUtilsPairingSession *v10;

  -[MRCryptoPairingSession device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = [MRCoreUtilsSystemPairingSession alloc];
  -[MRCryptoPairingSession device](self, "device");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[MRCoreUtilsPairingSession initWithRole:device:](v4, "initWithRole:device:", 0, v5);

  -[MRCoreUtilsPairingSession open](v6, "open");
  LOBYTE(v5) = -[MRCoreUtilsPairingSession isPaired](v6, "isPaired");

  if ((v5 & 1) != 0)
    return 1;
  v8 = [MRCoreUtilsPairingSession alloc];
  -[MRCryptoPairingSession device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MRCoreUtilsPairingSession initWithRole:device:](v8, "initWithRole:device:", 0, v9);

  -[MRCoreUtilsPairingSession open](v10, "open");
  LOBYTE(v9) = -[MRCoreUtilsPairingSession isPaired](v10, "isPaired");

  return (char)v9;
}

- (id)pairedDevices
{
  id v2;
  MRCoreUtilsSystemPairingSession *v3;
  void *v4;
  MRCoreUtilsPairingSession *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[MRCoreUtilsPairingSession initWithRole:device:]([MRCoreUtilsSystemPairingSession alloc], "initWithRole:device:", 0, 0);
  -[MRCoreUtilsPairingSession open](v3, "open");
  -[MRCoreUtilsPairingSession pairedDevices](v3, "pairedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  v5 = -[MRCoreUtilsPairingSession initWithRole:device:]([MRCoreUtilsPairingSession alloc], "initWithRole:device:", 0, 0);
  -[MRCoreUtilsPairingSession open](v5, "open");
  -[MRCoreUtilsPairingSession pairedDevices](v5, "pairedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  return v2;
}

- (id)removePeer
{
  NSObject *v3;
  MRCoreUtilsSystemPairingSession *v4;
  void *v5;
  MRCoreUtilsSystemPairingSession *v6;
  id v7;
  MRCoreUtilsPairingSession *v8;
  void *v9;
  MRCoreUtilsPairingSession *v10;
  void *v11;
  void *v12;

  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[MRExternalDevicePairingSession removePeer].cold.1(self);

  v4 = [MRCoreUtilsSystemPairingSession alloc];
  -[MRCryptoPairingSession device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRCoreUtilsPairingSession initWithRole:device:](v4, "initWithRole:device:", 0, v5);

  -[MRCoreUtilsPairingSession open](v6, "open");
  -[MRCoreUtilsSystemPairingSession removePeer](v6, "removePeer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [MRCoreUtilsPairingSession alloc];
  -[MRCryptoPairingSession device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MRCoreUtilsPairingSession initWithRole:device:](v8, "initWithRole:device:", 0, v9);

  -[MRCoreUtilsPairingSession open](v10, "open");
  -[MRCoreUtilsPairingSession removePeer](v10, "removePeer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v7)
    v7 = v11;

  return v7;
}

- (id)updatePeer
{
  NSObject *v3;
  MRCoreUtilsSystemPairingSession *v4;
  void *v5;
  MRCoreUtilsSystemPairingSession *v6;
  id v7;
  MRCoreUtilsPairingSession *v8;
  void *v9;
  MRCoreUtilsPairingSession *v10;
  void *v11;
  void *v12;

  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[MRExternalDevicePairingSession removePeer].cold.1(self);

  v4 = [MRCoreUtilsSystemPairingSession alloc];
  -[MRCryptoPairingSession device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRCoreUtilsPairingSession initWithRole:device:](v4, "initWithRole:device:", 0, v5);

  -[MRCoreUtilsPairingSession open](v6, "open");
  -[MRCoreUtilsSystemPairingSession updatePeer](v6, "updatePeer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [MRCoreUtilsPairingSession alloc];
  -[MRCryptoPairingSession device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MRCoreUtilsPairingSession initWithRole:device:](v8, "initWithRole:device:", 0, v9);

  -[MRCoreUtilsPairingSession open](v10, "open");
  -[MRCoreUtilsPairingSession updatePeer](v10, "updatePeer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v7)
    v7 = v11;

  return v7;
}

- (void)setDelegate:(id)a3
{
  id v4;
  MRCryptoPairingSessionBlockDelegate *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRExternalDevicePairingSession;
  -[MRCryptoPairingSession setDelegate:](&v16, sel_setDelegate_, v4);
  if (v4)
  {
    v5 = objc_alloc_init(MRCryptoPairingSessionBlockDelegate);
    -[MRExternalDevicePairingSession setPairingDelegate:](self, "setPairingDelegate:", v5);

    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke;
    v13[3] = &unk_1E30CADC0;
    objc_copyWeak(&v14, &location);
    -[MRCryptoPairingSessionBlockDelegate setDataExchangeBlock:](self->_pairingDelegate, "setDataExchangeBlock:", v13);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke_2;
    v11[3] = &unk_1E30CADE8;
    objc_copyWeak(&v12, &location);
    -[MRCryptoPairingSessionBlockDelegate setShowSetupCodeBlock:](self->_pairingDelegate, "setShowSetupCodeBlock:", v11);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke_3;
    v9[3] = &unk_1E30CAE10;
    objc_copyWeak(&v10, &location);
    -[MRCryptoPairingSessionBlockDelegate setHideSetupCodeBlock:](self->_pairingDelegate, "setHideSetupCodeBlock:", v9);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __46__MRExternalDevicePairingSession_setDelegate___block_invoke_4;
    v7[3] = &unk_1E30CAE38;
    objc_copyWeak(&v8, &location);
    -[MRCryptoPairingSessionBlockDelegate setPromptForSetupCodeBlock:](self->_pairingDelegate, "setPromptForSetupCodeBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MRExternalDevicePairingSession setPairingDelegate:](self, "setPairingDelegate:", 0);
  }

}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairingSession:didPrepareExchangeData:", v5, v7);

  }
}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairingSession:showSetupCode:", v5, v7);

  }
}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pairingSessionHideSetupCode:", v3);

    WeakRetained = v3;
  }

}

void __46__MRExternalDevicePairingSession_setDelegate___block_invoke_4(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingSession:promptForSetupCodeWithDelay:completion:", v7, v9, a2);

  }
}

- (void)open
{
  char v3;

  v3 = -[MRExternalDevicePairingSession _useSystemPairing](self);
  -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:]((id *)&self->super.super.isa, (void *)3, v3, 0);
}

- (BOOL)_useSystemPairing
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "device");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "supportsSystemPairing"))
  {
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "useExternalDeviceSystemPairing"))
      v3 = +[MRCoreUtilsSystemPairingSession systemPairingAvailable](MRCoreUtilsSystemPairingSession, "systemPairingAvailable");
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_openSecuritySessionInState:(char)a3 useSystemPairing:(void *)a4 completion:
{
  id v7;
  NSObject *v8;
  __objc2_class *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15[2];
  char v16;
  id location;

  v7 = a4;
  if (a1)
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:].cold.1(a3, (uint64_t)a2, v8);

    if ((a3 & 1) != 0)
      v9 = MRCoreUtilsSystemPairingSession;
    else
      v9 = MRCoreUtilsPairingSession;
    v10 = [v9 alloc];
    objc_msgSend(a1, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithRole:device:", 0, v11);

    objc_msgSend(a1, "setPairingSession:", v12);
    objc_msgSend(a1[4], "setDelegate:", a1[5]);
    objc_initWeak(&location, a1);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke;
    v13[3] = &unk_1E30CAE60;
    objc_copyWeak(v15, &location);
    v15[1] = a2;
    v16 = a3;
    v14 = v7;
    objc_msgSend(a1[5], "setExchangeCompleteBlock:", v13);
    objc_msgSend(a1[4], "openInState:", a2);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_14;
  if (!v4)
  {
    v9 = *(unsigned __int8 *)(a1 + 56);
    _MRLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
        __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_2(v10, v12, v13, v14, v15, v16, v17, v18);
    }
    else if (v11)
    {
      __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);
    }

    goto LABEL_13;
  }
  if (objc_msgSend(v4, "code") == 25 || *(_QWORD *)(a1 + 48) != 3)
  {
LABEL_13:
    objc_msgSend(WeakRetained, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pairingSession:didCompleteExchangeWithError:", WeakRetained, v4);

    goto LABEL_14;
  }
  v6 = *(unsigned __int8 *)(a1 + 56);
  dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_2;
    block[3] = &unk_1E30C5B40;
    v24 = WeakRetained;
    v25 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    v8 = v24;
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_4;
    v20[3] = &unk_1E30C5B40;
    v21 = WeakRetained;
    v22 = *(id *)(a1 + 32);
    dispatch_async(v7, v20);

    v8 = v21;
  }

LABEL_14:
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_3;
  v2[3] = &unk_1E30C6798;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:](v1, 3, 0, v2);

}

uint64_t __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = -[MRExternalDevicePairingSession _useSystemPairing](v2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_5;
  v4[3] = &unk_1E30C6798;
  v5 = *(id *)(a1 + 40);
  -[MRExternalDevicePairingSession _openSecuritySessionInState:useSystemPairing:completion:](v2, 2, v3, v4);

}

uint64_t __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)close
{
  -[MRCoreUtilsPairingSession close](self->_pairingSession, "close");
}

- (void)handlePairingExchangeData:(id)a3 completion:(id)a4
{
  -[MRCoreUtilsPairingSession handlePairingExchangeData:completion:](self->_pairingSession, "handlePairingExchangeData:completion:", a3, a4);
}

- (void)handlePairingFailureWithStatus:(int)a3
{
  -[MRCoreUtilsPairingSession handlePairingFailureWithStatus:](self->_pairingSession, "handlePairingFailureWithStatus:", *(_QWORD *)&a3);
}

- (id)encryptData:(id)a3 withError:(id *)a4
{
  return -[MRCoreUtilsPairingSession encryptData:withError:](self->_pairingSession, "encryptData:withError:", a3, a4);
}

- (id)decryptData:(id)a3 withError:(id *)a4
{
  return -[MRCoreUtilsPairingSession decryptData:withError:](self->_pairingSession, "decryptData:withError:", a3, a4);
}

- (BOOL)deleteIdentityWithError:(id *)a3
{
  return -[MRCoreUtilsPairingSession deleteIdentityWithError:](self->_pairingSession, "deleteIdentityWithError:", a3);
}

- (MRCoreUtilsPairingSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
  objc_storeStrong((id *)&self->_pairingSession, a3);
}

- (MRCryptoPairingSessionBlockDelegate)pairingDelegate
{
  return self->_pairingDelegate;
}

- (void)setPairingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_pairingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingDelegate, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
}

- (void)removePeer
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "device");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10(&dword_193827000, v2, v3, "[CryptoPairingSession(MRExternalDevicePairingSession)] Unpairing Device %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_6();
}

- (void)_openSecuritySessionInState:(char)a1 useSystemPairing:(uint64_t)a2 completion:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  const char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = "true";
  if ((a1 & 1) == 0)
    v3 = "false";
  v4 = 134218242;
  v5 = a2;
  v6 = 2080;
  v7 = v3;
  _os_log_debug_impl(&dword_193827000, log, OS_LOG_TYPE_DEBUG, "[CryptoPairingSession(MRExternalDevicePairingSession)] Opening Security Session in State = %ld usingSystemPairing = %s", (uint8_t *)&v4, 0x16u);
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_193827000, a1, a3, "[CryptoPairingSession(MRExternalDevicePairingSession)] Legacy pairing success.", a5, a6, a7, a8, 0);
}

void __90__MRExternalDevicePairingSession__openSecuritySessionInState_useSystemPairing_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_193827000, a1, a3, "[CryptoPairingSession(MRExternalDevicePairingSession)] System pairing success.", a5, a6, a7, a8, 0);
}

@end
