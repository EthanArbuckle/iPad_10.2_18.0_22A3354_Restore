@implementation CBServer

- (CBServer)init
{
  CBServer *v2;
  CBServer *v3;
  CBServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBServer;
  v2 = -[CBServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CBServer;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CBServer;
  -[CBServer dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)NSPrintF_safe();
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CBServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __35__CBServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  CBPeripheralManager *v7;
  CBPeripheralManager *peripheralManager;
  int var0;
  void *v10;
  id activateCompletion;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__CBServer__activateWithCompletion___block_invoke;
  v14[3] = &unk_1E53FF898;
  v16 = &v17;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v14);
  if (self->_activateCalled
    || self->_invalidateCalled
    || (self->_activateCalled = 1,
        v7 = -[CBPeripheralManager initWithDelegate:queue:]([CBPeripheralManager alloc], "initWithDelegate:queue:", self, self->_dispatchQueue), peripheralManager = self->_peripheralManager, self->_peripheralManager = v7, peripheralManager, !self->_peripheralManager))
  {
    NSErrorF_safe();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v18[5];
    v18[5] = v12;

  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v10 = (void *)MEMORY[0x1A85D1CE4](v5);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = v10;

    -[CBServer _startIfNeeded](self, "_startIfNeeded");
  }
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __36__CBServer__activateWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 48);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__CBServer_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__CBServer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;
  void (**v4)(_QWORD, _QWORD);
  id activateCompletion;
  void *v6;
  CBPeripheralManager *peripheralManager;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void (**v13)(_QWORD);
  id acceptHandler;
  id bluetoothStateChangedHandler;
  id configChangedHandler;
  id invalidationHandler;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v4)
    {
      NSErrorF_safe();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v4)[2](v4, v6);

    }
    if (self->_bleListeningPSM)
    {
      -[CBPeripheralManager unpublishL2CAPChannel:](self->_peripheralManager, "unpublishL2CAPChannel:");
      self->_bleListeningPSM = 0;
    }
    -[CBPeripheralManager setDelegate:](self->_peripheralManager, "setDelegate:", 0);
    peripheralManager = self->_peripheralManager;
    self->_peripheralManager = 0;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_connections;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "invalidate", (_QWORD)v19);
        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
    v13 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](self->_invalidationHandler);
    acceptHandler = self->_acceptHandler;
    self->_acceptHandler = 0;

    bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_bluetoothStateChangedHandler = 0;

    configChangedHandler = self->_configChangedHandler;
    self->_configChangedHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v13)
      v13[2](v13);
    v18 = self->_ucat->var0;
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();

  }
}

- (void)_startIfNeeded
{
  int var0;

  var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (!self->_bleListeningPSM && -[CBManager state](self->_peripheralManager, "state") == CBManagerStatePoweredOn)
    -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:](self->_peripheralManager, "publishL2CAPChannel:requiresEncryption:", self->_bleListenPSM, 0);
}

- (void)_handleConnectionInvalidated:(id)a3
{
  void *v4;
  int var0;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "l2capChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v6 = objc_msgSend(v4, "PSM");
    objc_msgSend(v4, "peer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v10, v8, v9);

}

- (void)pairingGenerateOOBDataForPeer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int var0;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__6;
  v50 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __60__CBServer_pairingGenerateOOBDataForPeer_completionHandler___block_invoke;
  v41[3] = &unk_1E5403828;
  v44 = &v45;
  v41[4] = self;
  v8 = v6;
  v42 = v8;
  v9 = v7;
  v43 = v9;
  v16 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v41);
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Use after invalidate", v10, v11, v12, v13, v14, v15, v39);
    v35 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v46[5];
    v46[5] = v35;
  }
  else
  {
    -[CBManager sharedPairingAgent](self->_peripheralManager, "sharedPairingAgent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v17;
    if (v17)
    {
      objc_msgSend(v17, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        objc_msgSend(v24, "setDelegate:", self);
      objc_msgSend(v24, "retrieveOOBDataForPeer:", v8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v8, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          CUPrintNSDataHex();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v32, 0);
      }
      else
      {
        CBErrorF(-6700, (uint64_t)"Generate OOB data failed", v26, v27, v28, v29, v30, v31, v39);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v46[5];
        v46[5] = v37;

      }
    }
    else
    {
      CBErrorF(-6705, (uint64_t)"No pairing agent", v18, v19, v20, v21, v22, v23, v39);
      v36 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v46[5];
      v46[5] = v36;
    }

  }
  v16[2](v16);

  _Block_object_dispose(&v45, 8);
}

uint64_t __60__CBServer_pairingGenerateOOBDataForPeer_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = result;
    v2 = **(_DWORD **)(*(_QWORD *)(result + 32) + 48);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(v1 + 40), "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  }
  return result;
}

- (void)pairingSetOOBEnabled:(BOOL)a3 peer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int var0;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__6;
  v43 = __Block_byref_object_dispose__6;
  v44 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __56__CBServer_pairingSetOOBEnabled_peer_completionHandler___block_invoke;
  v34[3] = &unk_1E5403850;
  v37 = &v39;
  v34[4] = self;
  v38 = a3;
  v10 = v8;
  v35 = v10;
  v11 = v9;
  v36 = v11;
  v18 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v34);
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Use after invalidate", v12, v13, v14, v15, v16, v17, v33);
    v30 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v40[5];
    v40[5] = v30;
  }
  else
  {
    -[CBManager sharedPairingAgent](self->_peripheralManager, "sharedPairingAgent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v19;
    if (v19)
    {
      objc_msgSend(v19, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        objc_msgSend(v26, "setDelegate:", self);
      objc_msgSend(v26, "setOOBPairingEnabled:forPeer:", 1, v10);
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v10, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    }
    else
    {
      CBErrorF(-6705, (uint64_t)"No pairing agent", v20, v21, v22, v23, v24, v25, v33);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v40[5];
      v40[5] = v31;

    }
  }

  v18[2](v18);
  _Block_object_dispose(&v39, 8);

}

uint64_t __56__CBServer_pairingSetOOBEnabled_peer_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = result;
    v2 = **(_DWORD **)(*(_QWORD *)(result + 32) + 48);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(v1 + 40), "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  }
  return result;
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v9;
  void *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int var0;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v9 = a4;
  v25 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v26 = v9;
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = self->_connections;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "l2capChannel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "peer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "isEqual:", v10))
        {
          v22 = v26;
          v21 = v27;
          v23 = v25;
          objc_msgSend(v16, "pairingAgent:peerDidRequestPairing:type:passkey:", v27, v26, a5, v25);

          goto LABEL_13;
        }

      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v13)
        continue;
      break;
    }
  }

  var0 = self->_ucat->var0;
  v22 = v26;
  v21 = v27;
  v23 = v25;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_13:

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6;
  void *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int var0;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v20 = v6;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_connections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "l2capChannel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "peer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "isEqual:", v7))
        {
          v19 = v20;
          v18 = v21;
          objc_msgSend(v13, "pairingAgent:peerDidCompletePairing:", v21, v20);

          goto LABEL_13;
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }

  var0 = self->_ucat->var0;
  v19 = v20;
  v18 = v21;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_13:

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int var0;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v8 = a4;
  v23 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v24 = v8;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_connections;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "l2capChannel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "peer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "isEqual:", v9))
        {
          v21 = v24;
          v20 = v25;
          objc_msgSend(v15, "pairingAgent:peerDidCompletePairing:", v25, v24);

          v22 = v23;
          goto LABEL_13;
        }

      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
        continue;
      break;
    }
  }

  var0 = self->_ucat->var0;
  v21 = v24;
  v20 = v25;
  v22 = v23;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
LABEL_13:

  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v6;
  void *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int var0;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v20 = v6;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_connections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "l2capChannel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "peer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "isEqual:", v7))
        {
          v19 = v20;
          v18 = v21;
          objc_msgSend(v13, "pairingAgent:peerDidUnpair:", v21, v20);

          goto LABEL_13;
        }

      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }

  var0 = self->_ucat->var0;
  v19 = v20;
  v18 = v21;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_13:

}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  uint64_t v6;
  int var0;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = objc_msgSend(v5, "state");

  var0 = self->_ucat->var0;
  if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
    if (v6 != 1)
      goto LABEL_5;
LABEL_8:
    self->_bleListeningPSM = 0;
    return;
  }
  LogPrintF_safe();
  if (v6 == 1)
    goto LABEL_8;
LABEL_5:
  if (v6 == 5)
    -[CBServer _startIfNeeded](self, "_startIfNeeded");
}

- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  int v5;
  int var0;
  void (**v8)(_QWORD, _QWORD);
  id activateCompletion;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (v13)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  self->_bleListeningPSM = v5;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v8)
  {
    ((void (**)(_QWORD, id))v8)[2](v8, v13);
  }
  else if (self->_bleListenPSM != v5)
  {
    v10 = MEMORY[0x1A85D1CE4](self->_configChangedHandler);
    v11 = (void *)v10;
    if (v10)
      (*(void (**)(uint64_t))(v10 + 16))(v10);

  }
}

- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  int var0;
  void *v7;
  id v8;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  else
  {

  }
}

- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  CBConnection *v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  NSMutableSet *connections;
  NSMutableSet *v19;
  NSMutableSet *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int var0;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[7];
  id v32;
  _QWORD v33[6];

  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else
  {
    v9 = v7;
    v10 = self->_ucat->var0;
    if (v9)
    {
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v9, "peer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "PSM");
        CUPrintNSError();
        v29 = v13;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v12;
        LogPrintF_safe();

      }
      v14 = objc_alloc_init(CBConnection);
      -[CBConnection setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
      -[CBConnection setL2capChannel:](v14, "setL2capChannel:", v9);
      -[CBConnection setServer:](v14, "setServer:", self);
      if (self->_label)
        -[CBConnection setLabel:](v14, "setLabel:");
      v15 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke;
      v33[3] = &unk_1E53FF5A0;
      v33[4] = self;
      v33[5] = v14;
      -[CBConnection setServerInvalidationHandler:](v14, "setServerInvalidationHandler:", v33, v25, v29, v30);
      v32 = 0;
      v16 = -[CBConnection activateDirectAndReturnError:](v14, "activateDirectAndReturnError:", &v32);
      v17 = v32;
      if (v16)
      {
        connections = self->_connections;
        if (!connections)
        {
          v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v20 = self->_connections;
          self->_connections = v19;

          connections = self->_connections;
        }
        -[NSMutableSet addObject:](connections, "addObject:", v14);
        v21 = MEMORY[0x1A85D1CE4](self->_acceptHandler);
        v22 = (void *)v21;
        if (v21)
        {
          v31[0] = v15;
          v31[1] = 3221225472;
          v31[2] = __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke_2;
          v31[3] = &unk_1E54026E8;
          v31[4] = self;
          v31[5] = v9;
          v31[6] = v14;
          (*(void (**)(uint64_t, CBConnection *, _QWORD *))(v21 + 16))(v21, v14, v31);
        }

      }
      else
      {
        v23 = self->_ucat->var0;
        if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          -[CBConnection invalidate](v14, "invalidate", v27);
        }
        else
        {
          -[CBConnection invalidate](v14, "invalidate", v26);
        }
      }

    }
    else if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
}

uint64_t __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

void __56__CBServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = **(_DWORD **)(v5 + 48);
  if (v3)
  {
    v15 = v3;
    if (v6 <= 30)
    {
      if (v6 != -1 || (v10 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v10))
      {
        v7 = objc_msgSend(*(id *)(a1 + 40), "PSM");
        objc_msgSend(*(id *)(a1 + 40), "peer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v12 = v7;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v5 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(v5 + 24), "removeObject:", *(_QWORD *)(a1 + 48), v12, v13);
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    goto LABEL_10;
  }
  if (v6 <= 30)
  {
    v15 = 0;
    if (v6 != -1 || (v11 = _LogCategory_Initialize(), v4 = 0, v11))
    {
      objc_msgSend(*(id *)(a1 + 40), "PSM");
      objc_msgSend(*(id *)(a1 + 40), "peer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

LABEL_10:
      v4 = v15;
    }
  }

}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)label
{
  return self->_label;
}

- (id)acceptHandler
{
  return self->_acceptHandler;
}

- (void)setAcceptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unsigned)bleListenPSM
{
  return self->_bleListenPSM;
}

- (void)setBleListenPSM:(unsigned __int16)a3
{
  self->_bleListenPSM = a3;
}

- (unsigned)bleListeningPSM
{
  return self->_bleListeningPSM;
}

- (id)configChangedHandler
{
  return self->_configChangedHandler;
}

- (void)setConfigChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configChangedHandler, 0);
  objc_storeStrong(&self->_acceptHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
