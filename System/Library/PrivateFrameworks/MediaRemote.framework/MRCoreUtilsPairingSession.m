@implementation MRCoreUtilsPairingSession

- (MRCoreUtilsPairingSession)initWithRole:(unint64_t)a3 device:(id)a4
{
  MRCoreUtilsPairingSession *v4;
  MRCoreUtilsPairingSession *v5;
  uint64_t v6;
  MRPasscodeCredentials *credentials;
  objc_class *v8;
  const char *Name;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MRCoreUtilsPairingSession;
  v4 = -[MRCryptoPairingSession initWithRole:device:](&v14, sel_initWithRole_device_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_state = 1;
    +[MRPasscodeCredentials standardCredentials](MRPasscodeCredentials, "standardCredentials");
    v6 = objc_claimAutoreleasedReturnValue();
    credentials = v5->_credentials;
    v5->_credentials = (MRPasscodeCredentials *)v6;

    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(Name, v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    *(_OWORD *)&v5->_pairingDelegate.context = 0u;
    *(_OWORD *)&v5->_pairingDelegate.hideSetupCode_f = 0u;
    *(_OWORD *)&v5->_pairingDelegate.copyIdentity_f = 0u;
    *(_OWORD *)&v5->_pairingDelegate.savePeer_f = 0u;
    v5->_pairingDelegate.resumeResponse_f = 0;
    v5->_pairingDelegate.context = v5;
    v5->_pairingDelegate.showSetupCode_f = _MRCUPSShowSetupCodeCallback;
    v5->_pairingDelegate.hideSetupCode_f = _MRCUPSHideSetupCodeCallback;
    v5->_pairingDelegate.promptForSetupCode_f = _MRCUPSPromptForSetupCodeCallback;
    v5->_pairingFlags = 0;
  }
  return v5;
}

- (void)dealloc
{
  PairingSessionPrivate *pairingSession;
  objc_super v4;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  self->_pairingDelegate.context = 0;
  v4.receiver = self;
  v4.super_class = (Class)MRCoreUtilsPairingSession;
  -[MRCoreUtilsPairingSession dealloc](&v4, sel_dealloc);
}

- (BOOL)isValid
{
  return self->_state == 5;
}

- (BOOL)isPaired
{
  void *v2;
  BOOL v3;

  -[MRCoreUtilsPairingSession pairedPeerDevice](self, "pairedPeerDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)pairedDevices
{
  void *v2;
  void *v3;

  -[MRCoreUtilsPairingSession mediaRemotePairedDevices](self, "mediaRemotePairedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)open
{
  -[MRCoreUtilsPairingSession openInState:](self, "openInState:", 3);
}

- (void)close
{
  void *Error;

  if (self->_state <= 3)
  {
    Error = (void *)MRMediaRemoteCreateError(25);
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](self, Error);

  }
  self->_state = 1;
  -[MRCoreUtilsPairingSession setInputKey:](self, "setInputKey:", 0);
  -[MRCoreUtilsPairingSession setInputNonce:](self, "setInputNonce:", 0);
  -[MRCoreUtilsPairingSession setOutputKey:](self, "setOutputKey:", 0);
  -[MRCoreUtilsPairingSession setOutputNonce:](self, "setOutputNonce:", 0);
}

- (void)handlePairingExchangeData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRCoreUtilsPairingSession_handlePairingExchangeData_completion___block_invoke;
  block[3] = &unk_1E30CA5C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __66__MRCoreUtilsPairingSession_handlePairingExchangeData_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = (void *)a1[5];
  v17 = 0;
  -[MRCoreUtilsPairingSession _onQueuePerformPairingExchangeWithInputData:error:](v2, v3, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 != -6727)
      goto LABEL_7;
    v8 = (id)objc_msgSend((id)a1[4], "removePeer");
    if (!objc_msgSend((id)a1[4], "shouldAutoRetryPairingExchange:", v5))
      goto LABEL_7;
    *(_BYTE *)(a1[4] + 128) = 0;
    *(_QWORD *)(a1[4] + 136) = 2;
    -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](a1[4], 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_9;
    v10 = a1[4];
    v11 = (void *)a1[5];
    v16 = 0;
    -[MRCoreUtilsPairingSession _onQueuePerformPairingExchangeWithInputData:error:](v10, v11, &v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = v16;
    v6 = v4;
    v4 = (void *)v12;
  }

LABEL_7:
  if (!v5)
  {
    if (v4)
    {
      objc_msgSend((id)a1[4], "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pairingSession:didPrepareExchangeData:", a1[4], v4);

      v9 = 0;
      *(_BYTE *)(a1[4] + 128) = 1;
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_16;
  }
  v9 = v5;
LABEL_9:
  _MRLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to handle pairing exchange. %{public}@", buf, 0xCu);
  }

  v14 = (void *)a1[4];
  if (v14)
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](v14, v9);
LABEL_16:
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)_onQueuePerformPairingExchangeWithInputData:(_QWORD *)a3 error:
{
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, char *);
  uint64_t v7;
  id v8;
  int v9;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v5 = a2;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_14;
  }
  v19 = 0;
  v17 = 0;
  v18 = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, char *))MSVWeakLinkSymbol();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = objc_retainAutorelease(v5);
    v9 = v6(v7, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), &v18, &v17, &v19);
    if (v9 == -6771 || v9 == 0)
    {
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      if (v19)
        -[MRCoreUtilsPairingSession _handleSetupExchangeComplete](a1);
      v15 = 0;
      if (!a3)
        goto LABEL_13;
      goto LABEL_12;
    }
    v12 = v9;
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v12, 0);
  }
  else
  {
    MRCreateCryptoError(CFSTR("No pairing session"));
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;
  v11 = 0;
  if (a3)
LABEL_12:
    *a3 = objc_retainAutorelease(v15);
LABEL_13:

LABEL_14:
  return v11;
}

- (id)_onQueueInitializePairingSessionWithState:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  int v9;
  int v10;
  const void *v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  int v14;
  NSObject *v15;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void (*v24)(_QWORD, void *);
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_msgSend((id)a1, "role");
  switch(a2)
  {
    case 4:
      v6 = 5;
      v7 = v4 == 1;
      v8 = 6;
LABEL_10:
      v9 = v7;
      if (!v7)
        v8 = 0;
      if (v4)
        v10 = v9;
      else
        v10 = 0;
      if (v4)
        v5 = v8;
      else
        v5 = v6;
      break;
    case 3:
      v6 = 3;
      v7 = v4 == 1;
      v8 = 4;
      goto LABEL_10;
    case 2:
      if (v4)
      {
        if (v4 == 1)
          v5 = 2;
        else
          v5 = 0;
        v10 = 1;
      }
      else
      {
        v10 = 1;
        v5 = 1;
      }
      break;
    default:
      v10 = 0;
      v5 = 0;
      break;
  }
  v11 = *(const void **)(a1 + 40);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
  v13 = v12(a1 + 40, a1 + 48, v5);
  if (v13)
  {
    v14 = v13;
    _MRLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 67109120;
      LODWORD(v26) = v14;
      _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error initializing pairing session (OSStatus = %d)", (uint8_t *)&v25, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)a1, "initializePairingSession:", *(_QWORD *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      _MRLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_DWORD *)(a1 + 132);
        v25 = 67109120;
        LODWORD(v26) = v19;
        _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Pairing flags are: %u", (uint8_t *)&v25, 8u);
      }

      objc_msgSend((id)a1, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (MRPairedDeviceSupportsACL())
      {
        v21 = *(_DWORD *)(a1 + 132);

        if ((v21 & 4) != 0)
        {
          _MRLogForCategory(0);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend((id)a1, "device");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543362;
            v26 = v23;
            _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Enabling ACL for device: %{public}@", (uint8_t *)&v25, 0xCu);

          }
          v24 = (void (*)(_QWORD, void *))MSVWeakLinkSymbol();
          v24(*(_QWORD *)(a1 + 40), &unk_1E3143CC8);
        }
      }
      else
      {

      }
    }
    return v17;
  }
}

- (void)handlePairingFailureWithStatus:(int)a3
{
  id v5;
  id v6;

  if (-[MRCoreUtilsPairingSession shouldAutoRetry](self))
  {
    if (self)
    {
      v5 = -[MRCoreUtilsPairingSession removePeer](self, "removePeer");
      -[MRCoreUtilsPairingSession openInState:](self, "openInState:", 2);
    }
  }
  else
  {
    self->_state = 1;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](self, v6);

  }
}

- (uint64_t)shouldAutoRetry
{
  void *v1;
  uint64_t v2;

  if (!a1 || a1[17] != 3)
    return 0;
  objc_msgSend(a1, "device");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "supportsSystemPairing") ^ 1;

  return v2;
}

- (id)encryptData:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__19;
  v27 = __Block_byref_object_dispose__19;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__19;
  v21 = __Block_byref_object_dispose__19;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__MRCoreUtilsPairingSession_encryptData_withError___block_invoke;
  v13[3] = &unk_1E30CA5E8;
  v13[4] = self;
  v15 = &v23;
  v8 = v6;
  v14 = v8;
  v16 = &v17;
  dispatch_sync(queue, v13);
  if (v18[5])
  {
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v18[5];
      *(_DWORD *)buf = 138543362;
      v30 = v10;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error while encrypting data: %{public}@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
  }
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __51__MRCoreUtilsPairingSession_encryptData_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, _BYTE *);
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE v14[16];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) == 5)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(*(id *)(a1 + 40), "length"));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = (void (*)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, _BYTE *))MSVWeakLinkSymbol();
    v5(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "bytes"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "bytes"), 0, 0, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)), "mutableBytes"), v14);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendBytes:length:", v14, 16);
    v6 = (_BYTE *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "mutableBytes");
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "length");
    if (v7)
    {
      v8 = v7 - 1;
      do
      {
        if (++*v6++)
          v10 = 1;
        else
          v10 = v8 == 0;
        --v8;
      }
      while (!v10);
    }
  }
  else
  {
    MRCreateCryptoError(CFSTR("Session not open"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (id)decryptData:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  MRCoreUtilsPairingSession *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__19;
  v28 = __Block_byref_object_dispose__19;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__19;
  v22 = __Block_byref_object_dispose__19;
  v23 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__MRCoreUtilsPairingSession_decryptData_withError___block_invoke;
  v13[3] = &unk_1E30CA5E8;
  v8 = v6;
  v14 = v8;
  v15 = self;
  v16 = &v18;
  v17 = &v24;
  dispatch_sync(queue, v13);
  if (v19[5])
  {
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v19[5];
      *(_DWORD *)buf = 138543362;
      v31 = v10;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error while decrypting data: %{public}@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);
  }
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __51__MRCoreUtilsPairingSession_decryptData_withError___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") <= 0xF)
  {
    v2 = CFSTR("Encrypted data has an invalid length");
LABEL_15:
    MRCreateCryptoError(v2);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;
    goto LABEL_16;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 136) != 5)
  {
    v2 = CFSTR("Session not open");
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", objc_msgSend(*(id *)(a1 + 32), "length") - 16, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, objc_msgSend(*(id *)(a1 + 32), "length") - 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v4, "length"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "bytes");
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "bytes");
  v11 = objc_retainAutorelease(v4);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");
  v14 = objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)), "mutableBytes");
  v28 = objc_retainAutorelease(v3);
  v15 = v8(v9, v10, 0, 0, v12, v13, v14, objc_msgSend(v28, "bytes"));
  v16 = (_BYTE *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "mutableBytes");
  v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "length");
  if (v17)
  {
    v18 = v17 - 1;
    do
    {
      if (++*v16++)
        v20 = 1;
      else
        v20 = v18 == 0;
      --v18;
    }
    while (!v20);
  }
  if (v15)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v15, 0);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  v25 = v28;
LABEL_16:

}

- (BOOL)deleteIdentityWithError:(id *)a3
{
  NSObject *queue;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__MRCoreUtilsPairingSession_deleteIdentityWithError___block_invoke;
  v7[3] = &unk_1E30C5F90;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = v9[5] == 0;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __53__MRCoreUtilsPairingSession_deleteIdentityWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t (*v9)(_QWORD);
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 40))
  {
    -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](v2, 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v15 = 138543362;
      v16 = v7;
      v8 = "[CryptoPairingSession(CoreUtils)] Error initializing pairing session during identity deletion. %{public}@";
LABEL_9:
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    v9 = (uint64_t (*)(_QWORD))MSVWeakLinkSymbol();
    v10 = v9(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    if (!v10)
      return;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v15 = 138543362;
      v16 = v14;
      v8 = "[CryptoPairingSession(CoreUtils)] Error deleting identity. %{public}@";
      goto LABEL_9;
    }
  }

}

- (void)openInState:(unint64_t)a3
{
  NSObject *queue;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  self->_hasExchangedMessage = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__19;
  v13 = __Block_byref_object_dispose__19;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRCoreUtilsPairingSession_openInState___block_invoke;
  block[3] = &unk_1E30CA610;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(queue, block);
  if (v10[5])
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v10[5];
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error initializing pairing session. %{public}@", buf, 0xCu);
    }

    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](self, (void *)v10[5]);
  }
  else
  {
    self->_state = a3;
    if (!-[MRCryptoPairingSession role](self, "role"))
      -[MRCoreUtilsPairingSession handlePairingExchangeData:completion:](self, "handlePairingExchangeData:completion:", 0, &__block_literal_global_49);
  }
  _Block_object_dispose(&v9, 8);

}

void __41__MRCoreUtilsPairingSession_openInState___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](a1[4], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__MRCoreUtilsPairingSession_openInState___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to begin pairing exchange. %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (BOOL)shouldAutoRetryPairingExchange:(id)a3
{
  void *v3;
  char v4;

  -[MRCryptoPairingSession device](self, "device", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSystemPairing") ^ 1;

  return v4;
}

- (id)initializePairingSession:(PairingSessionPrivate *)a3
{
  void (*v4)(PairingSessionPrivate *, const __CFString *, uint64_t, const __CFString *, const __CFString *, uint64_t, const __CFString *, const __CFString *, _DWORD);

  v4 = (void (*)(PairingSessionPrivate *, const __CFString *, uint64_t, const __CFString *, const __CFString *, uint64_t, const __CFString *, const __CFString *, _DWORD))MSVWeakLinkSymbol();
  v4(a3, CFSTR("com.apple.MediaRemote.pairing"), 1212434788, CFSTR("Media Remote Pairing Identity"), CFSTR("Media Remote Pairing Identity"), 1212436594, CFSTR("Paired TV Remote Peer"), CFSTR("Paired TV Remote Peer"), 0);
  return 0;
}

- (id)addPeer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t (*v6)(PairingSessionPrivate *, uint64_t *, int *);
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(PairingSessionPrivate *, void *, uint64_t, void *);
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t (*v14)(PairingSessionPrivate *, void *, uint64_t, void *);
  id v15;
  __CFString *v16;
  id v17;
  int v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRCryptoPairingSession device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Pairing device %@...", buf, 0xCu);

  }
  -[MRCryptoPairingSession device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self->_pairingSession)
    {
      v20 = 0;
      v19 = 0;
      v6 = (uint64_t (*)(PairingSessionPrivate *, uint64_t *, int *))MSVWeakLinkSymbol();
      v7 = v6(self->_pairingSession, &v20, &v19);
      if (v7)
      {
        v8 = (void *)v7;
        -[MRCoreUtilsPairingSession extendedPeerInfo](self);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (uint64_t (*)(PairingSessionPrivate *, void *, uint64_t, void *))MSVWeakLinkSymbol();
        v11 = v10(self->_pairingSession, v8, v20, v9);
        v19 = v11;
        if (!v11)
          goto LABEL_17;
        if (v11 != -25299)
          goto LABEL_12;
        _MRLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v22 = v8;
          _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "Duplicate record found for identifier %s dumping pairing", buf, 0xCu);
        }

        -[MRCoreUtilsPairingSession removePeer](self, "removePeer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_18;
        v14 = (uint64_t (*)(PairingSessionPrivate *, void *, uint64_t, void *))MSVWeakLinkSymbol();
        v19 = v14(self->_pairingSession, v8, v20, v9);
        if (v19)
        {
LABEL_12:
          v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v13 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v19, 0);
        }
        else
        {
LABEL_17:
          v13 = 0;
        }
LABEL_18:
        free(v8);
        v17 = v13;

        goto LABEL_19;
      }
      v16 = CFSTR("Cannot add peer, No peer Identifier available");
    }
    else
    {
      v16 = CFSTR("Cannot update peer, No pairing session available");
    }
  }
  else
  {
    v16 = CFSTR("Cannot add peer, No device available");
  }
  MRCreateCryptoError(v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v17;
}

- (id)extendedPeerInfo
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a1, "device");
    v2 = (id)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(a1, "device");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("MediaRemote_PeerName"));
      objc_msgSend(a1, "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("MediaRemote_PeerIdentifier"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)removePeer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t (*v7)(PairingSessionPrivate *, uint64_t, uint64_t);
  PairingSessionPrivate *pairingSession;
  id v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  __CFString *v14;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRCryptoPairingSession device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Unpairing device %@", (uint8_t *)&v17, 0xCu);

  }
  -[MRCryptoPairingSession device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v14 = CFSTR("Cannot remove peer, No device available");
LABEL_10:
    MRCreateCryptoError(v14);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_pairingSession)
  {
    v14 = CFSTR("Cannot update peer, No pairing session available");
    goto LABEL_10;
  }
  -[MRCoreUtilsPairingSession peerIdentifier](self, "peerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (uint64_t (*)(PairingSessionPrivate *, uint64_t, uint64_t))MSVWeakLinkSymbol();
    pairingSession = self->_pairingSession;
    v9 = objc_retainAutorelease(v6);
    v10 = v7(pairingSession, objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"));
    if (!v10)
    {
      v16 = 0;
      goto LABEL_14;
    }
    v11 = v10;
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
  }
  else
  {
    MRCreateCryptoError(CFSTR("Could not find peer"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v13;
LABEL_14:

  return v16;
}

- (id)updatePeer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t (*v8)(PairingSessionPrivate *, uint64_t, uint64_t, void *);
  PairingSessionPrivate *pairingSession;
  id v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  __CFString *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRCryptoPairingSession device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Updating Peer %@", (uint8_t *)&v18, 0xCu);

  }
  -[MRCryptoPairingSession device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v16 = CFSTR("Cannot update peer, No device available");
LABEL_12:
    MRCreateCryptoError(v16);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_pairingSession)
  {
    v16 = CFSTR("Cannot update peer, No pairing session available");
    goto LABEL_12;
  }
  -[MRCoreUtilsPairingSession peerIdentifier](self, "peerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MRCoreUtilsPairingSession extendedPeerInfo](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (uint64_t (*)(PairingSessionPrivate *, uint64_t, uint64_t, void *))MSVWeakLinkSymbol();
    pairingSession = self->_pairingSession;
    v10 = objc_retainAutorelease(v6);
    v11 = v8(pairingSession, objc_msgSend(v10, "UTF8String"), objc_msgSend(v10, "length"), v7);
    if (v11)
    {
      v12 = v11;
      _MRLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 67109120;
        LODWORD(v19) = v12;
        _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error updating peer (OSStatus = %d)", (uint8_t *)&v18, 8u);
      }

      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v12, 0);
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    MRCreateCryptoError(CFSTR("Could not find peer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (NSString)peerIdentifier
{
  void *v3;
  uint64_t (*v4)(PairingSessionPrivate *, uint64_t *, int *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  v19 = 0;
  -[MRCryptoPairingSession device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_pairingSession)
    {
      v13 = 0;
      v12 = 0;
      v4 = (uint64_t (*)(PairingSessionPrivate *, uint64_t *, int *))MSVWeakLinkSymbol();
      v5 = (void *)v4(self->_pairingSession, &v13, &v12);
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)v15[5];
        v15[5] = v6;

        free(v5);
      }
    }
    if (!v15[5])
    {
      -[MRCoreUtilsPairingSession mediaRemotePairedDevices](self, "mediaRemotePairedDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __43__MRCoreUtilsPairingSession_peerIdentifier__block_invoke;
      v11[3] = &unk_1E30CA638;
      v11[4] = self;
      v11[5] = &v14;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

    }
  }
  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSString *)v9;
}

void __43__MRCoreUtilsPairingSession_peerIdentifier__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v11, "isEqualToString:", v12);
  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)setPairingFlags:(unsigned int)a3
{
  void (*v4)(PairingSessionPrivate *, _QWORD);

  self->_pairingFlags = a3;
  v4 = (void (*)(PairingSessionPrivate *, _QWORD))MSVWeakLinkSymbol();
  v4(self->_pairingSession, self->_pairingFlags);
}

- (MRDeviceInfo)pairedPeerDevice
{
  MRCoreUtilsPairingSession *v2;
  uint64_t (*v3)(PairingSessionPrivate *, int *);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_pairingSession)
  {
    v2 = self;
    v24 = 0;
    v3 = (uint64_t (*)(PairingSessionPrivate *, int *))MSVWeakLinkSymbol();
    v4 = (void *)v3(v2->_pairingSession, &v24);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v5)
    {
      v6 = v5;
      v19 = *(_QWORD *)v21;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v21 != v19)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "info", 4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKey:", CFSTR("MediaRemote_PeerIdentifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (uint64_t)v2;
          -[MRCryptoPairingSession device](v2, "device");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v11);

          if (v15)
          {
            -[MRCoreUtilsPairingSession _createPeerDeviceFromPeer:](v12, v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }

          ++v7;
          v2 = (MRCoreUtilsPairingSession *)v12;
        }
        while (v6 != v7);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v6)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_12:

  }
  else
  {
    v16 = 0;
  }
  return (MRDeviceInfo *)v16;
}

- (MRDeviceInfo)_createPeerDeviceFromPeer:(uint64_t)a1
{
  id v3;
  void *v4;
  MRDeviceInfo *v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v5 = objc_alloc_init(MRDeviceInfo);
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setIdentifier:](v5, "setIdentifier:", v6);

  }
  return v5;
}

- (NSArray)pairedPeerDevices
{
  id v3;
  uint64_t (*v4)(PairingSessionPrivate *, int *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_pairingSession)
  {
    v17 = 0;
    v4 = (uint64_t (*)(PairingSessionPrivate *, int *))MSVWeakLinkSymbol();
    v5 = (void *)v4(self->_pairingSession, &v17);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[MRCoreUtilsPairingSession _createPeerDeviceFromPeer:]((uint64_t)self, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11, (_QWORD)v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
  return (NSArray *)v3;
}

- (NSMutableDictionary)mediaRemotePairedDevices
{
  uint64_t v3;
  uint64_t (*v4)(PairingSessionPrivate *, int *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  MRDeviceInfo *v11;
  MRDeviceInfo *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = 40;
  if (self->_pairingSession)
  {
    v27 = 0;
    v4 = (uint64_t (*)(PairingSessionPrivate *, int *))MSVWeakLinkSymbol();
    v5 = (void *)v4(self->_pairingSession, &v27);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (!v6)
      goto LABEL_20;
    v7 = v6;
    v8 = *(_QWORD *)v24;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v11 = -[MRCoreUtilsPairingSession _createDeviceFromPeer:]((uint64_t)self, v10);
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v10, "objectForKey:", CFSTR("identifier"));
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v12, v13);
LABEL_15:

          goto LABEL_16;
        }
        _MRLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Found empty extended info entry, removing it", buf, 2u);
        }

        objc_msgSend(v10, "objectForKey:", CFSTR("identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
        v17 = v3;
        v18 = *(uint64_t *)((char *)&self->super.super.isa + v3);
        v12 = objc_retainAutorelease(v15);
        v27 = v16(v18, -[MRDeviceInfo UTF8String](v12, "UTF8String"), -[MRDeviceInfo length](v12, "length"));
        if (v27)
        {
          _MRLogForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v29 = v27;
            _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Could not delete empty entry with status %lu", buf, 0xCu);
          }
          v3 = v17;
          goto LABEL_15;
        }
        v3 = v17;
LABEL_16:

        ++v9;
      }
      while (v7 != v9);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      v7 = v19;
      if (!v19)
      {
LABEL_20:

        return (NSMutableDictionary *)v22;
      }
    }
  }
  return (NSMutableDictionary *)v22;
}

- (MRDeviceInfo)_createDeviceFromPeer:(uint64_t)a1
{
  id v3;
  void *v4;
  MRDeviceInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("MediaRemote_PeerIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("MediaRemote_PeerName"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v5 = 0;
    }
    else
    {
      v5 = objc_alloc_init(MRDeviceInfo);
      -[MRDeviceInfo setIdentifier:](v5, "setIdentifier:", v7);
      -[MRDeviceInfo setName:](v5, "setName:", v9);
    }

  }
  return v5;
}

- (id)_generateSetupCodeWithMaximumLength:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "passcode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "passcode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") >= a2)
    {
      objc_msgSend(v4, "substringToIndex:", a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "passcode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringToIndex:", objc_msgSend(v6, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)_displaySetupCode:(uint64_t)a1
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend((id)a1, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pairingSession:showSetupCode:", a1, v3);

      a1 = 0;
    }
    else
    {
      a1 = 4294960582;
    }
  }

  return a1;
}

- (void)_hideSetupCode
{
  void *v2;
  char v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(a1, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pairingSessionHideSetupCode:", a1);

    }
  }
}

- (uint64_t)_promptForSetupCodeWithDelay:(uint64_t)result
{
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;
  uint8_t buf[4];
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)result;
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a2;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Requesting delegate to prompt for setup code with delay = %f", buf, 0xCu);
    }

    objc_msgSend(v3, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_initWeak((id *)buf, v3);
      objc_msgSend(v3, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __58__MRCoreUtilsPairingSession__promptForSetupCodeWithDelay___block_invoke;
      v10[3] = &unk_1E30CA660;
      v12 = a2;
      v9 = v3;
      v11 = v9;
      objc_msgSend(v8, "pairingSession:promptForSetupCodeWithDelay:completion:", v9, v10, a2);

      objc_destroyWeak((id *)buf);
      return 0;
    }
    else
    {
      return 4294960582;
    }
  }
  return result;
}

void __58__MRCoreUtilsPairingSession__promptForSetupCodeWithDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(double *)(a1 + 40) <= 0.0)
  {
    if (v3)
    {
LABEL_8:
      -[MRCoreUtilsPairingSession _delegateDidEnterPasscode:](*(_QWORD **)(a1 + 32), v8);
      v6 = 0;
      goto LABEL_9;
    }
    v4 = CFSTR("Pairing Session NULL setup code");
  }
  else
  {
    v4 = CFSTR("Pairing Session Delay");
  }
  MRCreateCryptoError(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  v7 = *(void **)(a1 + 32);
  if (v7)
    -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](v7, v6);
LABEL_9:

}

- (void)_delegateDidEnterPasscode:(_QWORD *)a1
{
  uint64_t (*v3)(_QWORD, uint64_t, uint64_t);
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    if (a1[5])
    {
      v3 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))MSVWeakLinkSymbol();
      v4 = v3(a1[5], objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1);
      if (!(_DWORD)v4)
      {
        objc_msgSend(a1, "handlePairingExchangeData:completion:", 0, &__block_literal_global_72);
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set setup code on pairing session (OSStatus = %d)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      MRCreateCryptoError(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_9;
      goto LABEL_7;
    }
    MRCreateCryptoError(CFSTR("Pairing Session is not available"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_7:
      -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](a1, v6);

    }
  }
LABEL_9:

}

- (void)_handlePairingCompleteWithError:(void *)a1
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(a1, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pairingSession:didCompleteExchangeWithError:", a1, v6);

    }
  }

}

- (void)_handleSetupExchangeComplete
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 120);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MRCoreUtilsPairingSession__handleSetupExchangeComplete__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __55__MRCoreUtilsPairingSession__delegateDidEnterPasscode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to resume pairing process after setting setup code. %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __57__MRCoreUtilsPairingSession__handleSetupExchangeComplete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  if (v2 != 3)
  {
    if (v2 != 2)
      return;
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Exchange complete. Proceeding to verify step.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addPeer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      _MRLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to record successfully paired peer", buf, 2u);
      }

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 3;
    -[MRCoreUtilsPairingSession _onQueueInitializePairingSessionWithState:](*(_QWORD *)(a1 + 32), 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v6;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Error initializing verify session. %{public}@", buf, 0xCu);
      }
LABEL_21:

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
      v13 = *(void **)(a1 + 32);
      if (v13)
        -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](v13, v6);
      goto LABEL_23;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "role"))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 0;
      -[MRCoreUtilsPairingSession _onQueuePerformPairingExchangeWithInputData:error:](v10, 0, &v15);
      v7 = objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (v11)
      {
        v6 = v11;
        _MRLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v6;
          _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to prepare data for verify exchange. %@", buf, 0xCu);
        }

        goto LABEL_21;
      }
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pairingSession:didPrepareExchangeData:", *(_QWORD *)(a1 + 32), v7);

      }
    }
    v6 = 0;
LABEL_23:

    return;
  }
  _MRLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Verify complete. Deriving encryption keys.", buf, 2u);
  }

  -[MRCoreUtilsPairingSession _onQueueDeriveEncryptionKeys](*(_QWORD **)(a1 + 32));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "updatePeer");
}

- (void)_onQueueDeriveEncryptionKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  _BYTE *v22;
  uint64_t i;
  uint64_t (*v24)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  int v31;
  id v32;
  void *v33;
  id v34;
  _BYTE *v35;
  uint64_t j;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  uint8_t buf[4];
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 8);
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 8);
    v5 = objc_msgSend(a1, "role");
    v39 = (id)v4;
    if (v5 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "MediaRemote-Write-Encryption-Key", 32);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D50];
      v8 = "MediaRemote-Read-Encryption-Key";
      v9 = 31;
    }
    else
    {
      if (v5)
      {
        v40 = 0;
        v6 = 0;
LABEL_8:
        v10 = (uint64_t (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
        v11 = a1[5];
        v12 = objc_retainAutorelease(v6);
        v13 = objc_msgSend(v12, "bytes");
        v14 = objc_msgSend(v12, "length");
        v15 = objc_msgSend(v2, "length");
        v16 = objc_retainAutorelease(v2);
        v17 = v10(v11, "MediaRemote-Salt", 16, v13, v14, v15, objc_msgSend(v16, "mutableBytes"));
        if (v17)
        {
          v18 = v17;
          _MRLogForCategory(0);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v43 = v18;
            _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to derive input key (OSStatus = %d)", buf, 8u);
          }
          v20 = v39;
        }
        else
        {
          v38 = v3;
          v21 = objc_retainAutorelease(v3);
          v22 = (_BYTE *)objc_msgSend(v21, "mutableBytes");
          for (i = objc_msgSend(v21, "length"); i; --i)
            *v22++ = 0;
          v24 = (uint64_t (*)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MSVWeakLinkSymbol();
          v25 = a1[5];
          v26 = objc_retainAutorelease(v40);
          v27 = objc_msgSend(v26, "bytes");
          v28 = objc_msgSend(v26, "length");
          v29 = objc_msgSend(v41, "length");
          v30 = objc_retainAutorelease(v41);
          v31 = v24(v25, "MediaRemote-Salt", 16, v27, v28, v29, objc_msgSend(v30, "mutableBytes"));
          if (!v31)
          {
            v20 = v39;
            v34 = objc_retainAutorelease(v39);
            v35 = (_BYTE *)objc_msgSend(v34, "mutableBytes");
            for (j = objc_msgSend(v34, "length"); j; --j)
              *v35++ = 0;
            _MRLogForCategory(0);
            v37 = objc_claimAutoreleasedReturnValue();
            v3 = v38;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_193827000, v37, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Successfully derived encryption keys.", buf, 2u);
            }

            objc_msgSend(a1, "setInputKey:", v16);
            objc_msgSend(a1, "setInputNonce:", v21);
            objc_msgSend(a1, "setOutputKey:", v30);
            objc_msgSend(a1, "setOutputNonce:", v34);
            a1[17] = 5;
            -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](a1, 0);
            goto LABEL_19;
          }
          v18 = v31;
          _MRLogForCategory(0);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v39;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v43 = v18;
            _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils)] Failed to derive output key (OSStatus = %d)", buf, 8u);
          }
          v3 = v38;
        }

        a1[17] = 0;
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v18, 0);
        -[MRCoreUtilsPairingSession _handlePairingCompleteWithError:](a1, v33);

LABEL_19:
        return;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "MediaRemote-Read-Encryption-Key", 31);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D50];
      v8 = "MediaRemote-Write-Encryption-Key";
      v9 = 32;
    }
    objc_msgSend(v7, "dataWithBytes:length:", v8, v9);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)hasExchangedMessage
{
  return self->_hasExchangedMessage;
}

- (unsigned)pairingFlags
{
  return self->_pairingFlags;
}

- (NSData)inputKey
{
  return self->_inputKey;
}

- (void)setInputKey:(id)a3
{
  objc_storeStrong((id *)&self->_inputKey, a3);
}

- (NSMutableData)inputNonce
{
  return self->_inputNonce;
}

- (void)setInputNonce:(id)a3
{
  objc_storeStrong((id *)&self->_inputNonce, a3);
}

- (NSData)outputKey
{
  return self->_outputKey;
}

- (void)setOutputKey:(id)a3
{
  objc_storeStrong((id *)&self->_outputKey, a3);
}

- (NSMutableData)outputNonce
{
  return self->_outputNonce;
}

- (void)setOutputNonce:(id)a3
{
  objc_storeStrong((id *)&self->_outputNonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);
  objc_storeStrong((id *)&self->_inputKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
