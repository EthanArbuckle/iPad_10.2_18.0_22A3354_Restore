@implementation ASAccessorySession

- (ASAccessorySession)init
{
  ASAccessorySession *v2;
  ASAccessorySession *v3;
  uint64_t v4;
  NSMutableDictionary *accessories;
  void *v6;
  uint64_t v7;
  NSString *bundleID;
  void *v9;
  ASAccessorySession *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ASAccessorySession;
  v2 = -[ASAccessorySession init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ASAccessorySession crashIfAccessorySetupBundleInfoKeysInvalid](v2, "crashIfAccessorySetupBundleInfoKeysInvalid");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    accessories = v3->_accessories;
    v3->_accessories = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    bundleID = v3->_bundleID;
    v3->_bundleID = (NSString *)v7;

    objc_storeStrong((id *)&v3->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3->_tccStateUnkown = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForegroundNotification, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  ASAccessorySession *v4;
  SEL v5;
  id v6;
  objc_super v7;

  if (self->_activateCalled && !self->_invalidateDone)
  {
    v4 = (ASAccessorySession *)FatalErrorF();
    -[ASAccessorySession activateWithEventHandler:](v4, v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    v7.receiver = self;
    v7.super_class = (Class)ASAccessorySession;
    -[ASAccessorySession dealloc](&v7, sel_dealloc);
  }
}

- (void)activateWithEventHandler:(id)a3
{
  -[ASAccessorySession activateWithQueue:eventHandler:](self, "activateWithQueue:eventHandler:", self->_dispatchQueue, a3);
}

- (void)activateWithQueue:(id)a3 eventHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ASAccessorySession_activateWithQueue_eventHandler___block_invoke;
    block[3] = &unk_25041F748;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    v9 = v7;
    v10 = v6;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    v11 = FatalErrorF();
    __53__ASAccessorySession_activateWithQueue_eventHandler___block_invoke(v11);
  }
}

uint64_t __53__ASAccessorySession_activateWithQueue_eventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithQueue:eventHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_activateWithQueue:(id)a3 eventHandler:(id)a4
{
  id v7;
  NSString *overrideAppBundleID;
  NSString *v9;
  void *v10;
  id eventHandler;
  OS_dispatch_queue *v12;

  v12 = (OS_dispatch_queue *)a3;
  v7 = a4;
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    overrideAppBundleID = self->_overrideAppBundleID;
    v9 = overrideAppBundleID;
    if (v9)
      objc_storeStrong((id *)&self->_bundleID, overrideAppBundleID);

    if (self->_dispatchQueue != v12)
      objc_storeStrong((id *)&self->_dispatchQueue, a3);
    v10 = _Block_copy(v7);
    eventHandler = self->_eventHandler;
    self->_eventHandler = v10;

    -[ASAccessorySession _setupDeviceAccessSession](self, "_setupDeviceAccessSession");
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ASAccessorySession_invalidate__block_invoke;
  block[3] = &unk_25041F770;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__ASAccessorySession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    *(_BYTE *)(v1 + 40) = 1;
    if (gLogCategory_ASAccessorySession <= 30
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      v3 = *(_QWORD *)(v2 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 64), "invalidate", v3);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  id eventHandler;
  ASAccessoryEvent *v4;
  void (**v5)(id, ASAccessoryEvent *);

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v5 = (void (**)(id, ASAccessoryEvent *))_Block_copy(self->_eventHandler);
    eventHandler = self->_eventHandler;
    self->_eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_ASAccessorySession <= 30
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 11);
    v5[2](v5, v4);

  }
}

- (void)_applicationWillEnterForegroundNotification
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ASAccessorySession__applicationWillEnterForegroundNotification__block_invoke;
  block[3] = &unk_25041F770;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __65__ASAccessorySession__applicationWillEnterForegroundNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAuthorizedAccesoriesIfNeeded");
}

- (void)crashIfAccessorySetupBundleInfoKeysInvalid
{
  void *v2;
  __CFString *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)xpc_copy_entitlement_for_token();
  if (v3)
  {
LABEL_40:
    if (gLogCategory_ASAccessorySession > 30)
      goto LABEL_38;
    if (gLogCategory_ASAccessorySession != -1)
    {
LABEL_42:
      LogPrintF();
      goto LABEL_38;
    }
LABEL_48:
    if (!_LogCategory_Initialize())
      goto LABEL_38;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForCurrentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    FatalErrorF();
    goto LABEL_44;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
LABEL_44:
    FatalErrorF();
LABEL_45:
    FatalErrorF();
LABEL_46:
    v27 = v2;
    FatalErrorF();
LABEL_47:
    objc_msgSend(v4, "count", v27);
    FatalErrorF();
    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupKitSupports"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (!v8)
  {

    goto LABEL_51;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v42 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      v11 |= objc_msgSend(v14, "isEqualToString:", CFSTR("Bluetooth"));
      v10 |= objc_msgSend(v14, "isEqualToString:", CFSTR("WiFi"));
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  }
  while (v9);

  if (((v11 | v10) & 1) == 0)
LABEL_51:
    FatalErrorF();
  if ((v11 & 1) != 0)
  {
    v28 = v7;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      v3 = CFSTR("004C");
      v29 = *(_QWORD *)v38;
      v30 = v15;
      do
      {
        v19 = 0;
        v31 = v17;
        do
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          v2 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
          if (objc_msgSend(&unk_250423580, "containsObject:", v2))
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v2);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v20 = objc_opt_isKindOfClass();

            if ((v20 & 1) == 0)
              goto LABEL_45;
            objc_msgSend(v15, "objectForKeyedSubscript:", v2);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v4, "count"))
              goto LABEL_46;
            if ((unint64_t)objc_msgSend(v4, "count") >= 0x1F5)
              goto LABEL_47;
            if (objc_msgSend(v2, "isEqualToString:", CFSTR("NSAccessorySetupBluetoothCompanyIdentifiers")))
            {
              v35 = 0u;
              v36 = 0u;
              v33 = 0u;
              v34 = 0u;
              v21 = v4;
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v34;
                while (2)
                {
                  for (j = 0; j != v23; ++j)
                  {
                    if (*(_QWORD *)v34 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
                    if (!objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("4C"))
                      || !objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("004C")))
                    {
                      FatalErrorF();
                      goto LABEL_40;
                    }
                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                  if (v23)
                    continue;
                  break;
                }
              }

              v18 = v29;
              v15 = v30;
            }

            v17 = v31;
          }
          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v17);
    }

    v7 = v28;
    v3 = 0;
  }

LABEL_38:
}

- (void)_setupDeviceAccessSession
{
  NSString *v3;
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v3 = self->_bundleID;
  v4 = objc_alloc_init(MEMORY[0x24BE2BEF8]);
  objc_storeStrong((id *)&self->_daSession, v4);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.ask.sessionQueue", v5);

  objc_storeStrong((id *)&self->_sessionQueue, v6);
  objc_msgSend(v4, "setBundleID:", v3);
  objc_msgSend(v4, "setDeviceFlags:", 8);
  objc_msgSend(v4, "setDispatchQueue:", v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__ASAccessorySession__setupDeviceAccessSession__block_invoke;
  v9[3] = &unk_25041F7C0;
  v9[4] = self;
  v9[5] = v4;
  objc_msgSend(v4, "setEventHandler:", v9);
  -[ASAccessorySession xpcListenerEndpoint](self, "xpcListenerEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ASAccessorySession xpcListenerEndpoint](self, "xpcListenerEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setXpcListenerEndpoint:", v8);

  }
  objc_msgSend(v4, "activate");

}

void __47__ASAccessorySession__setupDeviceAccessSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ASAccessorySession__setupDeviceAccessSession__block_invoke_2;
  block[3] = &unk_25041F798;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __47__ASAccessorySession__setupDeviceAccessSession__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDASessionEventHandler:session:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_handleDASessionEventHandler:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  id v9;
  uint64_t v10;
  id v11;
  ASAccessorySession *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  ASAccessory *v19;
  ASAccessoryEvent *v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  ASAccessorySession *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  ASAccessory *v35;
  ASAccessoryEvent *v36;
  void (**v37)(_QWORD, _QWORD);
  ASAccessoryEvent *v38;
  ASAccessory *v39;
  ASAccessorySession *v40;
  ASAccessoryEvent *v41;
  void (**v42)(_QWORD, _QWORD);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  ASAccessory *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  ASAccessorySession *v56;
  void *v57;
  uint64_t v58;
  ASAccessoryEvent *v59;
  void (**v60)(_QWORD, _QWORD);
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_bundleID;
  v9 = v6;
  v66 = v7;
  if (gLogCategory_ASAccessorySession <= 30
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    v61 = v9;
    LogPrintF();
  }
  v10 = objc_msgSend(v9, "eventType", v61);
  if (v10 > 40)
  {
    if (v10 == 41)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v24 = v9;
        objc_msgSend(v24, "device");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_ASAccessorySession <= 30
          && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v39 = -[ASAccessory initWithDADevice:bundleID:]([ASAccessory alloc], "initWithDADevice:bundleID:", v25, v8);
        if (gLogCategory_ASAccessorySession <= 30
          && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v39)
        {
          v40 = self;
          objc_sync_enter(v40);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v40->_accessories, "setObject:forKeyedSubscript:", 0, v26);
          objc_sync_exit(v40);

          v41 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 31);
          -[ASAccessoryEvent setAccessory:](v41, "setAccessory:", v39);
          -[ASAccessorySession eventHandler](v40, "eventHandler");
          v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, ASAccessoryEvent *))v42)[2](v42, v41);

        }
      }
      goto LABEL_77;
    }
    if (v10 != 42)
    {
      if (v10 == 50)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v9;
          if (objc_msgSend(v11, "devicesMigrated"))
          {
            v12 = self;
            objc_sync_enter(v12);
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v63 = v11;
            objc_msgSend(v11, "devices");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v72;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v72 != v15)
                    objc_enumerationMutation(v13);
                  v17 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                  objc_msgSend(v17, "identifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = -[ASAccessory initWithDADevice:bundleID:]([ASAccessory alloc], "initWithDADevice:bundleID:", v17, v8);
                  if (v19)
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_accessories, "setObject:forKeyedSubscript:", v19, v18);

                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
              }
              while (v14);
            }

            v20 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 20);
            -[ASAccessorySession eventHandler](v12, "eventHandler");
            v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, ASAccessoryEvent *))v21)[2](v21, v20);

            objc_sync_exit(v12);
            v11 = v63;
          }

        }
      }
      goto LABEL_77;
    }
LABEL_60:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v65 = v9;
      objc_msgSend(v65, "device");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[ASAccessory initWithDADevice:bundleID:]([ASAccessory alloc], "initWithDADevice:bundleID:", v50, v8);
      if (gLogCategory_ASAccessorySession <= 30
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v52)
      {
        objc_msgSend(v50, "appAccessInfoMap");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", v8);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "state");

        if (v55 >= 11)
        {
          if (gLogCategory_ASAccessorySession <= 30
            && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v56 = self;
          objc_sync_enter(v56);
          -[NSMutableDictionary objectForKeyedSubscript:](v56->_accessories, "objectForKeyedSubscript:", v51);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKeyedSubscript:](v56->_accessories, "setObject:forKeyedSubscript:", v52, v51);
          if (v57)
            v58 = 32;
          else
            v58 = 30;
          objc_sync_exit(v56);

          v59 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", v58);
          -[ASAccessoryEvent setAccessory:](v59, "setAccessory:", v52);
          -[ASAccessorySession eventHandler](v56, "eventHandler");
          v60 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, ASAccessoryEvent *))v60)[2](v60, v59);

        }
      }

    }
    goto LABEL_77;
  }
  if (v10 == 10)
  {
    objc_msgSend(v9, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      if (gLogCategory_ASAccessorySession <= 90
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v9, "error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v38 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 11);
      ASErrorF(100, (uint64_t)"Unable to activate session.", v43, v44, v45, v46, v47, v48, (uint64_t)v62);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASAccessoryEvent setError:](v38, "setError:", v49);

    }
    else
    {
      objc_msgSend(v66, "availableDevices");
      v38 = (ASAccessoryEvent *)objc_claimAutoreleasedReturnValue();
      -[ASAccessorySession _notifyAccesoriesChangedIfNeeded:bundleID:eventType:](self, "_notifyAccesoriesChangedIfNeeded:bundleID:eventType:", v38, v8, 10);
    }

    goto LABEL_60;
  }
  if (v10 != 15)
  {
    if (v10 != 40)
      goto LABEL_77;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v9;
    if (objc_msgSend(v27, "devicesMigrated"))
    {
      v28 = self;
      objc_sync_enter(v28);
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v64 = v27;
      objc_msgSend(v27, "devices");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v68 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
            objc_msgSend(v33, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[ASAccessory initWithDADevice:bundleID:]([ASAccessory alloc], "initWithDADevice:bundleID:", v33, v8);
            if (v35)
              -[NSMutableDictionary setObject:forKeyedSubscript:](v28->_accessories, "setObject:forKeyedSubscript:", v35, v34);

          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
        }
        while (v30);
      }

      v36 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 20);
      -[ASAccessorySession eventHandler](v28, "eventHandler");
      v37 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, ASAccessoryEvent *))v37)[2](v37, v36);

      objc_sync_exit(v28);
      v27 = v64;
    }

  }
LABEL_77:

}

- (OS_dispatch_queue)queue
{
  ASAccessorySession *v2;
  OS_dispatch_queue *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_dispatchQueue;
  objc_sync_exit(v2);

  return v3;
}

- (void)relayPickerEvent:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__ASAccessorySession_relayPickerEvent___block_invoke;
  v7[3] = &unk_25041F7E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __39__ASAccessorySession_relayPickerEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "eventHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)_fetchAuthorizedAccesoriesIfNeeded
{
  NSString *v3;
  DASession *v4;
  DASession *v5;
  BOOL v6;
  _QWORD v7[6];

  v3 = self->_bundleID;
  v4 = self->_daSession;
  v5 = v4;
  if (!self->_activateCalled || (!self->_invalidateCalled ? (v6 = v4 == 0) : (v6 = 1), v6))
  {
    if (gLogCategory_ASAccessorySession <= 90
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke;
    v7[3] = &unk_25041F838;
    v7[4] = self;
    v7[5] = v3;
    -[DASession getDevicesWithFlags:completionHandler:](v4, "getDevicesWithFlags:completionHandler:", 8, v7);
  }

}

void __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  uint64_t v17;
  _QWORD aBlock[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v5 = a2;
  v6 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v22 = 0;
  v7 = v5;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_59;
  aBlock[3] = &unk_25041F810;
  v20 = v21;
  v9 = v7;
  v19 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!v9 || !v6)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 32);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_2;
    block[3] = &unk_25041F798;
    block[4] = v11;
    v13 = v9;
    v14 = *(_QWORD *)(a1 + 40);
    v16 = v13;
    v17 = v14;
    dispatch_async(v12, block);

  }
  v10[2](v10);

  _Block_object_dispose(v21, 8);
}

void __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_59(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && gLogCategory_ASAccessorySession <= 90
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

uint64_t __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAccesoriesChangedIfNeeded:bundleID:eventType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 32);
}

- (void)_notifyAccesoriesChangedIfNeeded:(id)a3 bundleID:(id)a4 eventType:(int64_t)a5
{
  id v7;
  id v8;
  NSMutableDictionary **p_accessories;
  NSMutableDictionary *accessories;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  ASAccessory *v17;
  ASAccessory *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ASAccessorySession *v25;
  ASAccessoryEvent *v26;
  void (**v27)(_QWORD, _QWORD);
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  ASAccessoryEvent *v34;
  void (**v35)(_QWORD, _QWORD);
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  ASAccessoryEvent *v42;
  void (**v43)(_QWORD, _QWORD);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  uint64_t v48;
  ASAccessoryEvent *v49;
  void (**v50)(_QWORD, _QWORD);
  void *v51;
  void *v52;
  id v53;
  void *v54;
  ASAccessorySession *v55;
  void *v56;
  void *v58;
  NSMutableDictionary *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v55 = self;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  v59 = accessories;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v79 != v15)
          objc_enumerationMutation(v12);
        v17 = -[ASAccessory initWithDADevice:bundleID:]([ASAccessory alloc], "initWithDADevice:bundleID:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i), v8);
        v18 = v17;
        if (v17)
        {
          -[ASAccessory identifier](v17, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v19);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    }
    while (v14);
  }

  v20 = MEMORY[0x24BDAC760];
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke;
  v75[3] = &unk_25041F860;
  v21 = v11;
  v76 = v21;
  v22 = v51;
  v77 = v22;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v59, "enumerateKeysAndObjectsUsingBlock:", v75);
  v72[0] = v20;
  v72[1] = 3221225472;
  v72[2] = __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke_2;
  v72[3] = &unk_25041F888;
  v72[4] = v59;
  v23 = v54;
  v73 = v23;
  v24 = v52;
  v74 = v24;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v72);
  v25 = v55;
  objc_sync_enter(v25);
  objc_storeStrong((id *)p_accessories, v11);
  objc_sync_exit(v25);

  if (a5 == 10)
  {
    v26 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 10);
    -[ASAccessorySession eventHandler](v25, "eventHandler");
    v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ASAccessoryEvent *))v27)[2](v27, v26);

  }
  else
  {
    v56 = v24;
    v58 = v23;
    v53 = v22;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v28 = v22;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v69 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
          v34 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 31);
          -[ASAccessoryEvent setAccessory:](v34, "setAccessory:", v33);
          -[ASAccessorySession eventHandler](v25, "eventHandler");
          v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, ASAccessoryEvent *))v35)[2](v35, v34);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      }
      while (v30);
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v36 = v58;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v65 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k);
          v42 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 30);
          -[ASAccessoryEvent setAccessory:](v42, "setAccessory:", v41);
          -[ASAccessorySession eventHandler](v25, "eventHandler");
          v43 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, ASAccessoryEvent *))v43)[2](v43, v42);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
      }
      while (v38);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v24 = v56;
    v26 = v56;
    v44 = -[ASAccessoryEvent countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v61;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v61 != v46)
            objc_enumerationMutation(v26);
          v48 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * m);
          v49 = -[ASAccessoryEvent initWithEventType:]([ASAccessoryEvent alloc], "initWithEventType:", 32);
          -[ASAccessoryEvent setAccessory:](v49, "setAccessory:", v48);
          -[ASAccessorySession eventHandler](v25, "eventHandler");
          v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, ASAccessoryEvent *))v50)[2](v50, v49);

        }
        v45 = -[ASAccessoryEvent countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
      }
      while (v45);
      v22 = v53;
      v24 = v56;
      v23 = v58;
    }
    else
    {
      v22 = v53;
      v23 = v58;
    }
  }

}

void __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v10 = *(void **)(a1 + 40);
    goto LABEL_6;
  }
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", v11))
  {

    goto LABEL_8;
  }
  v9 = objc_msgSend(v7, "isEqual:", v5);

  if ((v9 & 1) == 0)
  {
    v10 = *(void **)(a1 + 48);
LABEL_6:
    objc_msgSend(v10, "addObject:", v5);
  }
LABEL_8:

}

- (NSArray)accessories
{
  ASAccessorySession *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_accessories, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)failAuthorization:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke;
  block[3] = &unk_25041F748;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    if (!*(_BYTE *)(v1 + 40))
    {
      +[ASUIClientManager shared](_TtC17AccessorySetupKit17ASUIClientManager, "shared");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke_2;
      v6[3] = &unk_25041F8B0;
      v4 = *(_QWORD *)(a1 + 40);
      v7 = *(id *)(a1 + 48);
      objc_msgSend(v3, "failWithAccessory:completionHandler:", v4, v6);

      return;
    }
  }
  else
  {
    FatalErrorF();
  }
  v5 = FatalErrorF();
  __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke_2(v5);
}

uint64_t __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ASAccessorySession_removeAccessory_completionHandler___block_invoke;
  block[3] = &unk_25041F748;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __56__ASAccessorySession_removeAccessory_completionHandler___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  ASAccessorySession *v3;
  SEL v4;
  id v5;
  id v6;

  v2 = (_BYTE *)a1[4];
  if (v2[8])
  {
    if (!v2[40])
    {
      objc_msgSend(v2, "_removeAccessory:completionHandler:", a1[5], a1[6]);
      return;
    }
  }
  else
  {
    FatalErrorF();
  }
  v3 = (ASAccessorySession *)FatalErrorF();
  -[ASAccessorySession _removeAccessory:completionHandler:](v3, v4, v5, v6);
}

- (void)_removeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a4;
  v7 = a3;
  -[ASAccessorySession overrideAppBundleID](self, "overrideAppBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v12 = objc_alloc(MEMORY[0x24BE2BED0]);
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:deviceIdentifier:state:", v10, v13, 0);
  -[ASAccessorySession daSession](self, "daSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke;
  v17[3] = &unk_25041F900;
  v17[4] = self;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "removeDeviceAccess:completionHandler:", v14, v17);

}

void __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke_2;
  v7[3] = &unk_25041F8D8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "code");
    v10 = *(_QWORD *)(a1 + 40);
    if (v3 == 350006)
    {
      v11 = "User restricted accessory removal";
      v12 = 750;
    }
    else
    {
      v11 = "Unable to remove accessory";
      v12 = 1;
    }
    ASErrorF(v12, (uint64_t)v11, v4, v5, v6, v7, v8, v9, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)renameAccessory:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v8 = a3;
  v9 = a5;
  -[ASAccessorySession overrideAppBundleID](self, "overrideAppBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ASAccessorySession_renameAccessory_options_completionHandler___block_invoke;
  block[3] = &unk_25041F928;
  block[4] = self;
  v18 = v8;
  v20 = v9;
  v21 = a4;
  v19 = v12;
  v15 = v9;
  v16 = v8;
  dispatch_async(dispatchQueue, block);

}

void __64__ASAccessorySession_renameAccessory_options_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  ASAccessorySession *v3;
  SEL v4;
  id v5;
  id v6;
  id v7;

  v1 = a1[4];
  if (*(_BYTE *)(v1 + 8))
  {
    if (!*(_BYTE *)(v1 + 40))
    {
      +[ASUIClientManager shared](_TtC17AccessorySetupKit17ASUIClientManager, "shared");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithAccessory:options:for:completionHandler:", a1[5], a1[8], a1[6], a1[7]);

      return;
    }
  }
  else
  {
    FatalErrorF();
  }
  v3 = (ASAccessorySession *)FatalErrorF();
  -[ASAccessorySession showPickerForDisplayItems:completionHandler:](v3, v4, v5, v6);
}

- (void)showPickerForDisplayItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *dispatchQueue;
  uint64_t v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (-[ASAccessorySession allowedToActivatePicker:](self, "allowedToActivatePicker:", v6))
  {
    if (gLogCategory_ASAccessorySession <= 40
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__ASAccessorySession_showPickerForDisplayItems_completionHandler___block_invoke;
    block[3] = &unk_25041F748;
    block[4] = self;
    v18 = v6;
    v19 = v7;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    ASErrorF(550, (uint64_t)"CBManagers active with global permissions", v8, v9, v10, v11, v12, v13, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v14);

  }
}

uint64_t __66__ASAccessorySession_showPickerForDisplayItems_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPickerForDisplayItems:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_showPickerForDisplayItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  ASAccessorySession *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *sessionQueue;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _Unwind_Exception *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  void (**v35)(_QWORD, _QWORD);
  _QWORD v36[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD block[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v6 = a3;
  v7 = a4;
  if (!self->_activateCalled)
  {
    FatalErrorF();
    goto LABEL_24;
  }
  if (self->_invalidateCalled)
  {
LABEL_24:
    FatalErrorF();
    goto LABEL_25;
  }
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x1F5 && !self->_disablePickerItemMaxLimit)
  {
LABEL_25:
    v31 = (_Unwind_Exception *)FatalErrorF();
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v31);
  }
  v9 = (void *)xpc_copy_entitlement_for_token();
  if (v9)
    goto LABEL_6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  if (self->_dispatchQueue == (OS_dispatch_queue *)MEMORY[0x24BDAC9B8])
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "applicationState");
    v43[3] = v22;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke;
    block[3] = &unk_25041F950;
    block[4] = &v42;
    v20 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
  }

  if (!v43[3])
  {
    _Block_object_dispose(&v42, 8);
LABEL_6:
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    LOBYTE(v45) = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v10 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_2;
    v36[3] = &unk_25041F978;
    v36[5] = &v42;
    v36[6] = &v37;
    v36[4] = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v36);
    if (*((_BYTE *)v38 + 24))
    {
      v11 = self;
      objc_sync_enter(v11);
      -[NSMutableDictionary allValues](v11->_accessories, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        if (gLogCategory_ASAccessorySession <= 90
          && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        ASErrorF(550, (uint64_t)"Migration not allowed since accessories are already authorized", v14, v15, v16, v17, v18, v19, v32);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v8)[2](v8, v30);

        objc_sync_exit(v11);
        goto LABEL_21;
      }
      objc_sync_exit(v11);

    }
    sessionQueue = self->_sessionQueue;
    v33[0] = v10;
    v33[1] = 3221225472;
    v33[2] = __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_3;
    v33[3] = &unk_25041F748;
    v33[4] = self;
    v34 = v6;
    v35 = v8;
    dispatch_async(sessionQueue, v33);

LABEL_21:
    _Block_object_dispose(&v37, 8);
    goto LABEL_22;
  }
  ASErrorF(550, (uint64_t)"Application is not in foreground.", v23, v24, v25, v26, v27, v28, v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v8)[2](v8, v29);

LABEL_22:
  _Block_object_dispose(&v42, 8);

}

void __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "applicationState");

}

void __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  uint64_t v6;
  char v7;
  char v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (a3 || (isKindOfClass & 1) != 0)
  {
    if (*(_BYTE *)(v6 + 24) && (objc_opt_class(), v7 = objc_opt_isKindOfClass(), a3) && (v7 & 1) != 0)
    {
      if (gLogCategory_ASAccessorySession <= 40
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_opt_class();
      v8 = objc_opt_isKindOfClass();
      if (a3 || (v8 & 1) == 0)
        goto LABEL_16;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_16;
  }
  *(_BYTE *)(v6 + 24) = 1;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "_validateDisplayItem:", v9);

}

void __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_3(_QWORD *a1)
{
  id v2;

  +[ASUIClientManager shared](_TtC17AccessorySetupKit17ASUIClientManager, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateConnectionWithSession:with:for:completionHandler:", a1[4], a1[5], *(_QWORD *)(a1[4] + 88), a1[6]);

}

- (void)showPickerWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[ASAccessorySession showPickerForDisplayItems:completionHandler:](self, "showPickerForDisplayItems:completionHandler:", MEMORY[0x24BDBD1A8], v4);

}

- (void)updateAccessory:(id)a3 settings:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__ASAccessorySession_updateAccessory_settings_completionHandler___block_invoke;
  v15[3] = &unk_25041F9A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __65__ASAccessorySession_updateAccessory_settings_completionHandler___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  ASAccessorySession *v3;
  SEL v4;
  id v5;
  id v6;
  id v7;

  v2 = (_BYTE *)a1[4];
  if (v2[8])
  {
    if (!v2[40])
    {
      objc_msgSend(v2, "_updateAccessory:settings:completionHandler:", a1[5], a1[6], a1[7]);
      return;
    }
  }
  else
  {
    FatalErrorF();
  }
  v3 = (ASAccessorySession *)FatalErrorF();
  -[ASAccessorySession _updateAccessory:settings:completionHandler:](v3, v4, v5, v6, v7);
}

- (void)_updateAccessory:(id)a3 settings:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  DASession *v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = self->_daSession;
  v11 = (objc_class *)MEMORY[0x24BE2BEE0];
  v12 = a4;
  v13 = objc_alloc_init(v11);
  objc_msgSend(v12, "SSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSSID:", v14);

  objc_msgSend(v12, "bluetoothTransportBridgingIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBridgingIdentifier:", v15);

  objc_msgSend(v12, "bluetoothTransportBridgingIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  if (v16)
  {
    -[DASession availableDevices](v10, "availableDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke;
    v23[3] = &unk_25041F9C8;
    v24 = v8;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);

  }
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_2;
  v21[3] = &unk_25041F900;
  v21[4] = self;
  v22 = v9;
  v20 = v9;
  -[DASession modifyDeviceWithIdentifier:settings:completionHandler:](v10, "modifyDeviceWithIdentifier:settings:completionHandler:", v19, v13, v21);

}

void __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8)
    goto LABEL_4;
  if ((objc_msgSend(v10, "flags") & 0x20) == 0)
  {
    *a4 = 1;
LABEL_4:

    return;
  }
  v9 = FatalErrorF();
  __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_2(v9);
}

void __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_3;
  v7[3] = &unk_25041F8D8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    CUPrintNSError();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    ASErrorF(450, (uint64_t)"Unable to update accessory: %@", v2, v3, v4, v5, v6, v7, (uint64_t)v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v8);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

- (void)_validateDisplayItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  __int16 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "productImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_73;
  objc_msgSend(v4, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_74:
    FatalErrorF();
    goto LABEL_75;
  }
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_75:
    FatalErrorF();
    goto LABEL_76;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_76:
    -[ASAccessorySession _validateMigrationDisplayItem:](self, "_validateMigrationDisplayItem:", v4);
    goto LABEL_71;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupKitSupports"));
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    LODWORD(self) = 0;
    v14 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v73 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        self = (ASAccessorySession *)(objc_msgSend(v16, "isEqualToString:", CFSTR("Bluetooth")) | self);
        v13 |= objc_msgSend(v16, "isEqualToString:", CFSTR("WiFi"));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v12);
  }
  else
  {
    LOBYTE(v13) = 0;
    self = 0;
  }

  objc_msgSend(v4, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "bluetoothCompanyIdentifier");
  v19 = v18 != 0;
  if (v18)
  {
    if ((self & 1) == 0)
    {
LABEL_89:
      FatalErrorF();
      goto LABEL_90;
    }
    v20 = objc_msgSend(v17, "bluetoothCompanyIdentifier");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x"), objc_msgSend(v17, "bluetoothCompanyIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupBluetoothCompanyIdentifiers"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
LABEL_90:
      FatalErrorF();
      goto LABEL_91;
    }
    v23 = v22;
    if (!objc_msgSend(v22, "count"))
    {
LABEL_91:
      FatalErrorF();
      goto LABEL_92;
    }
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __43__ASAccessorySession__validateDisplayItem___block_invoke;
    v70[3] = &__block_descriptor_34_e18__16__0__NSString_8l;
    v71 = __rev16(v20);
    objc_msgSend(v23, "cuFilteredArrayUsingBlock:", v70);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count") != 1)
    {
LABEL_93:
      FatalErrorF();
      goto LABEL_94;
    }

  }
  objc_msgSend(v17, "bluetoothServiceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if ((self & 1) == 0)
    {
LABEL_92:
      FatalErrorF();
      goto LABEL_93;
    }
    objc_msgSend(v17, "bluetoothServiceUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupBluetoothServices"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
LABEL_94:
      FatalErrorF();
      goto LABEL_95;
    }
    v28 = v27;
    if (!objc_msgSend(v27, "count"))
    {
LABEL_95:
      FatalErrorF();
      goto LABEL_96;
    }
    if ((objc_msgSend(v28, "containsObject:", v25) & 1) == 0)
    {
LABEL_96:
      FatalErrorF();
LABEL_97:
      FatalErrorF();
      goto LABEL_98;
    }

    v19 = 1;
  }
  objc_msgSend(v17, "bluetoothManufacturerDataBlob");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {

  }
  else
  {
    objc_msgSend(v17, "bluetoothManufacturerDataMask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_36;
  }
  if ((self & 1) == 0)
    goto LABEL_78;
  if (!objc_msgSend(v17, "bluetoothCompanyIdentifier"))
  {
LABEL_79:
    FatalErrorF();
LABEL_80:
    FatalErrorF();
    goto LABEL_81;
  }
  objc_msgSend(v17, "bluetoothManufacturerDataBlob");
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30
    || (v25 = (void *)v30,
        objc_msgSend(v17, "bluetoothManufacturerDataMask"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v31,
        v25,
        !v31))
  {
    FatalErrorF();
LABEL_78:
    FatalErrorF();
    goto LABEL_79;
  }
  objc_msgSend(v17, "bluetoothManufacturerDataBlob");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "length"))
  {
LABEL_81:

    goto LABEL_82;
  }
  objc_msgSend(v17, "bluetoothManufacturerDataMask");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (!v33)
  {
LABEL_82:
    FatalErrorF();
    goto LABEL_83;
  }
  objc_msgSend(v17, "bluetoothManufacturerDataBlob");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v25, "length");
  objc_msgSend(v17, "bluetoothManufacturerDataMask");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  if (v34 != v36)
  {
LABEL_83:
    FatalErrorF();
LABEL_84:
    FatalErrorF();
    goto LABEL_85;
  }
LABEL_36:
  objc_msgSend(v17, "bluetoothServiceDataBlob");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {

  }
  else
  {
    objc_msgSend(v17, "bluetoothServiceDataMask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_46;
  }
  if ((self & 1) == 0)
    goto LABEL_84;
  objc_msgSend(v17, "bluetoothServiceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_85:
    FatalErrorF();
    goto LABEL_86;
  }
  objc_msgSend(v17, "bluetoothServiceDataBlob");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
    goto LABEL_80;
  v25 = (void *)v38;
  objc_msgSend(v17, "bluetoothServiceDataMask");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
    goto LABEL_80;
  objc_msgSend(v17, "bluetoothServiceDataBlob");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "length"))
  {
LABEL_86:

    goto LABEL_87;
  }
  objc_msgSend(v17, "bluetoothServiceDataMask");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (!v41)
  {
LABEL_87:
    FatalErrorF();
    goto LABEL_88;
  }
  objc_msgSend(v17, "bluetoothServiceDataBlob");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");
  objc_msgSend(v17, "bluetoothServiceDataMask");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "length");

  if (v43 != v45)
  {
LABEL_88:
    FatalErrorF();
    goto LABEL_89;
  }
LABEL_46:
  objc_msgSend(v17, "bluetoothNameSubstring");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
    goto LABEL_59;
  if ((self & 1) == 0)
    goto LABEL_97;
  if (!v19)
  {
LABEL_98:
    FatalErrorF();
    goto LABEL_99;
  }
  objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupBluetoothNames"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bluetoothNameSubstring");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v49 = v47;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v50)
  {
    v51 = v50;
    self = *(ASAccessorySession **)v67;
LABEL_51:
    v52 = 0;
    while (1)
    {
      if (*(ASAccessorySession **)v67 != self)
        objc_enumerationMutation(v49);
      if ((objc_msgSend(v48, "containsString:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v52)) & 1) != 0)
        break;
      if (v51 == ++v52)
      {
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
        if (v51)
          goto LABEL_51;
        goto LABEL_57;
      }
    }
  }
  else
  {
LABEL_57:

    v64 = v48;
    FatalErrorF();
  }

LABEL_59:
  objc_msgSend(v17, "SSID", v64);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
    goto LABEL_63;
  if ((v13 & 1) == 0)
  {
LABEL_72:
    FatalErrorF();
LABEL_73:
    FatalErrorF();
    goto LABEL_74;
  }
  objc_msgSend(v17, "SSID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "length");

  if (!v55)
  {
LABEL_99:
    FatalErrorF();
    goto LABEL_100;
  }
  v19 = 1;
LABEL_63:
  objc_msgSend(v17, "SSIDPrefix");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    if ((v13 & 1) != 0)
    {
      objc_msgSend(v17, "SSIDPrefix");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "length");

      if (v58)
      {
        v19 = 1;
        goto LABEL_67;
      }
LABEL_100:
      FatalErrorF();
      goto LABEL_101;
    }
    goto LABEL_72;
  }
LABEL_67:
  objc_msgSend(v17, "SSID");
  v59 = objc_claimAutoreleasedReturnValue();
  if (!v59
    || (v60 = (void *)v59,
        objc_msgSend(v17, "SSIDPrefix"),
        v61 = (void *)objc_claimAutoreleasedReturnValue(),
        v61,
        v60,
        !v61))
  {
    if (v19)
    {

LABEL_71:
      return;
    }
LABEL_101:
    FatalErrorF();
  }
  v62 = FatalErrorF();
  __43__ASAccessorySession__validateDisplayItem___block_invoke(v62, v63);
}

id __43__ASAccessorySession__validateDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  CUPrintHex();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "caseInsensitiveCompare:", v3))
    v4 = 0;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

- (void)_validateMigrationDisplayItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ASAccessorySession *v20;
  SEL v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupKitSupports"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 |= objc_msgSend(v13, "isEqualToString:", CFSTR("Bluetooth"));
        v9 |= objc_msgSend(v13, "isEqualToString:", CFSTR("WiFi"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
  }

  objc_msgSend(v3, "peripheralIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    goto LABEL_13;
  }
  objc_msgSend(v3, "hotspotSSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_13:
    objc_msgSend(v3, "hotspotSSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (((v16 != 0) & v9) == 1)
    {
      objc_msgSend(v3, "hotspotSSID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_15;
    }
    else
    {

      if (!v17)
      {
LABEL_15:
        objc_msgSend(v3, "peripheralIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (((v17 != 0) & v10) == 1)
        {
          objc_msgSend(v3, "peripheralIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
LABEL_17:

            return;
          }
LABEL_21:
          FatalErrorF();
        }
LABEL_20:

        if (!v17)
          goto LABEL_17;
        goto LABEL_21;
      }
    }
    FatalErrorF();
    goto LABEL_20;
  }
  v20 = (ASAccessorySession *)FatalErrorF();
  -[ASAccessorySession allowedToActivatePicker:](v20, v21, v22);
}

- (BOOL)allowedToActivatePicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  ASAccessorySession *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  BOOL v22;
  _QWORD aBlock[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSAccessorySetupKitSupports"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v8)
  {

LABEL_36:
    v22 = 1;
    goto LABEL_37;
  }
  v9 = 0;
  v10 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(v7);
      v9 |= objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "isEqualToString:", CFSTR("Bluetooth"));
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v8);

  if ((v9 & 1) == 0)
    goto LABEL_36;
  v12 = self;
  objc_sync_enter(v12);
  -[NSMutableDictionary allValues](v12->_accessories, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") == 0;

  if (!v14)
  {
    if (gLogCategory_ASAccessorySession <= 40
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_sync_exit(v12);

    goto LABEL_36;
  }
  objc_sync_exit(v12);

  pthread_mutex_lock(&allowedToActivatePicker__gLock);
  if (!allowedToActivatePicker__tccServer)
  {
    v15 = tcc_server_create();
    v16 = (void *)allowedToActivatePicker__tccServer;
    allowedToActivatePicker__tccServer = v15;

  }
  pthread_mutex_unlock(&allowedToActivatePicker__gLock);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 2;
  v17 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  tcc_credential_singleton_for_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_service_singleton_for_CF_name();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__ASAccessorySession_allowedToActivatePicker___block_invoke;
  aBlock[3] = &unk_25041FA10;
  aBlock[4] = &v25;
  v20 = _Block_copy(aBlock);
  tcc_server_message_request_authorization();
  v21 = *((_DWORD *)v26 + 6);
  if (v21 >= 2)
  {
    if (v21 == 2)
    {
      if (gLogCategory_ASAccessorySession <= 40
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v12->_tccStateUnkown = 1;
    }
    goto LABEL_35;
  }
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!objc_msgSend(MEMORY[0x24BDBB258], "retrieveCurrentProcessSessionCount"))
  {
LABEL_35:

    _Block_object_dispose(&v25, 8);
    goto LABEL_36;
  }
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x24BDBB258], "retrieveCurrentProcessSessionCount");
    LogPrintF();
  }

  _Block_object_dispose(&v25, 8);
  v22 = 0;
LABEL_37:

  return v22;
}

uint64_t __46__ASAccessorySession_allowedToActivatePicker___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;

  if (!a3)
  {
    v3 = result;
    result = tcc_authorization_record_get_authorization_right();
    v4 = 2 * (result != 2);
    if (!result)
      v4 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = v4;
  }
  return result;
}

- (DASession)daSession
{
  return self->_daSession;
}

- (void)setDaSession:(id)a3
{
  objc_storeStrong((id *)&self->_daSession, a3);
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, a3);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)disablePickerItemMaxLimit
{
  return self->_disablePickerItemMaxLimit;
}

- (void)setDisablePickerItemMaxLimit:(BOOL)a3
{
  self->_disablePickerItemMaxLimit = a3;
}

- (NSString)overrideAppBundleID
{
  return self->_overrideAppBundleID;
}

- (void)setOverrideAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAppBundleID, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_daSession, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end
