@implementation NPKSecureElement

+ (unint64_t)cachedIsInFailForward
{
  unint64_t v3;

  objc_msgSend(a1, "_initVariables");
  v3 = atomic_load((unsigned int *)&_atomicIsInFailForward);
  if (!(_DWORD)v3)
    objc_msgSend(a1, "isInFailForward:", 0);
  return v3;
}

+ (void)isInFailForward:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  pk_ui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_ui_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested check if SE is in fail forward mode", buf, 2u);
    }

  }
  objc_msgSend(a1, "_initVariables");
  v8 = _inFailForwardQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__NPKSecureElement_isInFailForward___block_invoke;
  block[3] = &unk_24CFE7B00;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, block);

}

uint64_t __36__NPKSecureElement_isInFailForward___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t result;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  pk_ui_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_ui_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Start check if SE is in fail forward mode", buf, 2u);
    }

  }
  v5 = objc_msgSend(MEMORY[0x24BE6EE80], "isInFailForward");
  pk_ui_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v5)
  {
    if (!v7)
    {
      v9 = 1;
      goto LABEL_17;
    }
    pk_ui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: SE is in fail forward mode", v12, 2u);
    }
    v9 = 1;
  }
  else
  {
    if (!v7)
    {
      v9 = 2;
      goto LABEL_17;
    }
    pk_ui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      v9 = 2;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: SE is Not in fail forward mode", v11, 2u);
    }
    else
    {
      v9 = 2;
    }
  }

LABEL_17:
  atomic_store(v9, (unsigned int *)&_atomicIsInFailForward);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  return result;
}

+ (void)_initVariables
{
  if (_initVariables_onceToken != -1)
    dispatch_once(&_initVariables_onceToken, &__block_literal_global_32);
}

void __34__NPKSecureElement__initVariables__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  atomic_store(0, (unsigned int *)&_atomicIsInFailForward);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.nanoPassKit.secureElement.inFailForward", v2);
  v1 = (void *)_inFailForwardQueue;
  _inFailForwardQueue = (uint64_t)v0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_17);
  return (id)sharedInstance_sharedInstance_5;
}

void __34__NPKSecureElement_sharedInstance__block_invoke()
{
  NPKSecureElement *v0;
  void *v1;

  v0 = objc_alloc_init(NPKSecureElement);
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v0;

}

- (NPKSecureElement)init
{
  NPKSecureElement *v2;
  NPKSecureElement *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *backgroundQueue;
  NPKThreadSafeObserverManager *v6;
  NPKObserverManager *observerManager;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  NPKSecureElement *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NPKSecureElement;
  v2 = -[NPKSecureElement init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_atomicIsInRestricted);
    v4 = dispatch_queue_create("com.apple.nanoPassKit.hwManager.background", 0);
    backgroundQueue = v3->_backgroundQueue;
    v3->_backgroundQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(NPKThreadSafeObserverManager);
    observerManager = v3->_observerManager;
    v3->_observerManager = &v6->super;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__applicationWillEnterBackground_, *MEMORY[0x24BE6F908], 0);
    v9 = v3->_backgroundQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __24__NPKSecureElement_init__block_invoke;
    block[3] = &unk_24CFE7998;
    v12 = v3;
    dispatch_async(v9, block);

  }
  return v3;
}

uint64_t __24__NPKSecureElement_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundQueue_initHWManager");
}

- (BOOL)isInRestrictedMode
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_atomicIsInRestricted);
  return v2 & 1;
}

- (BOOL)isNfcDisabled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_atomicIsNfcDisabled);
  return v2 & 1;
}

- (void)isInRestrictedMode:(id)a3
{
  id v4;
  NSObject *backgroundQueue;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NPKSecureElement supportState](self, "supportState") == 2)
  {
    backgroundQueue = self->_backgroundQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__NPKSecureElement_isInRestrictedMode___block_invoke;
    v9[3] = &unk_24CFE7E90;
    v9[4] = self;
    v10 = v4;
    dispatch_async(backgroundQueue, v9);

  }
  else
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v12 = -[NPKSecureElement supportState](self, "supportState");
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Won't use APIs since hw support state is %d", buf, 8u);
      }

    }
  }

}

uint64_t __39__NPKSecureElement_isInRestrictedMode___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "hardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInRestrictedMode");

  objc_msgSend(*(id *)(a1 + 32), "_secureElementDidUpdateRestrictedModeState:", v3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (void)registerObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NPKSecureElement hardwareManager](self, "hardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerEventListener:", self);

  -[NPKObserverManager registerObserver:](self->_observerManager, "registerObserver:", v5);
}

- (void)unregisterObserver:(id)a3
{
  id v4;

  -[NPKObserverManager unregisterObserver:](self->_observerManager, "unregisterObserver:", a3);
  -[NPKSecureElement hardwareManager](self, "hardwareManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterEventListener:", self);

}

- (void)applicationIsAtForeground
{
  NSObject *backgroundQueue;
  _QWORD block[5];

  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__NPKSecureElement_applicationIsAtForeground__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(backgroundQueue, block);
}

uint64_t __45__NPKSecureElement_applicationIsAtForeground__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "isInRestrictedMode:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNFCState");
}

- (void)_backgroundQueue_initHWManager
{
  NFHardwareManager *v3;
  NFHardwareManager *hardwareManager;
  void *v5;
  unsigned int supportState;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_backgroundQueue);
  objc_msgSend(MEMORY[0x24BE6B5A0], "sharedHardwareManagerWithNoUI");
  v3 = (NFHardwareManager *)objc_claimAutoreleasedReturnValue();
  hardwareManager = self->_hardwareManager;
  self->_hardwareManager = v3;

  -[NPKSecureElement hardwareManager](self, "hardwareManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_supportState = objc_msgSend(v5, "getHwSupport");

  supportState = self->_supportState;
  if (supportState == 4)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Found NFHardwareSupportStateUnSupported.", v11, 2u);
      }

    }
    -[NPKSecureElement hardwareManager](self, "hardwareManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterEventListener:", self);

    -[NPKSecureElement setHardwareManager:](self, "setHardwareManager:", 0);
    atomic_store(0, (unsigned __int8 *)&self->_atomicIsNfcDisabled);
  }
  else if (supportState == 2)
  {
    -[NPKSecureElement _fetchNFCState](self, "_fetchNFCState");
  }
}

- (void)_fetchNFCState
{
  NSObject *backgroundQueue;
  _QWORD block[5];

  if ((MGGetBoolAnswer() & 1) != 0)
  {
    backgroundQueue = self->_backgroundQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__NPKSecureElement__fetchNFCState__block_invoke;
    block[3] = &unk_24CFE7998;
    block[4] = self;
    dispatch_async(backgroundQueue, block);
  }
  else
  {
    atomic_store(0, (unsigned __int8 *)&self->_atomicIsNfcDisabled);
  }
}

void __34__NPKSecureElement__fetchNFCState__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "supportState") == 2)
  {
    v14 = 0;
    objc_msgSend(*(id *)(a1 + 32), "hardwareManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "getRadioEnabledState:", &v14);
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v5)
      {
        pk_General_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v3;
          _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Fetch NFC status error: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      atomic_store(v14 != 1, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 17));
    }
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 17));
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = v13 & 1;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NFC: retrieved nfcDisabled state: %d.", buf, 8u);
      }

    }
  }
  else
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (!v8)
      return;
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "supportState");
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v9;
      _os_log_impl(&dword_213518000, v3, OS_LOG_TYPE_DEFAULT, "Warning: Will not use APIs since hw support state is %d", buf, 8u);
    }
  }

}

- (void)_secureElementDidUpdateRestrictedModeState:(BOOL)a3
{
  NPKObserverManager *observerManager;
  _QWORD v4[5];
  BOOL v5;

  atomic_store(a3, (unsigned __int8 *)&self->_atomicIsInRestricted);
  observerManager = self->_observerManager;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__NPKSecureElement__secureElementDidUpdateRestrictedModeState___block_invoke;
  v4[3] = &unk_24CFEE680;
  v4[4] = self;
  v5 = a3;
  -[NPKObserverManager enumerateObserversUsingBlock:](observerManager, "enumerateObserversUsingBlock:", v4);
}

void __63__NPKSecureElement__secureElementDidUpdateRestrictedModeState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "secureElement:didUpdateRestrictedModeState:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NPKSecureElement hardwareManager](self, "hardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterEventListener:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)NPKSecureElement;
  -[NPKSecureElement dealloc](&v5, sel_dealloc);
}

- (void)didChangeRadioState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NFHardwareEventListener received nfc radio enabled %d", (uint8_t *)v8, 8u);
    }

  }
  atomic_store(!v3, (unsigned __int8 *)&self->_atomicIsNfcDisabled);
}

- (void)hardwareStateDidChange
{
  NSObject *backgroundQueue;
  _QWORD block[5];

  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NPKSecureElement_hardwareStateDidChange__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(backgroundQueue, block);
}

void __42__NPKSecureElement_hardwareStateDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hardwareManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSupportState:", objc_msgSend(v2, "getHwSupport"));

}

- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
  -[NPKSecureElement _secureElementDidUpdateRestrictedModeState:](self, "_secureElementDidUpdateRestrictedModeState:", a4);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4;

  -[NPKSecureElement hardwareManager](self, "hardwareManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerEventListener:", self);

}

- (void)_applicationWillEnterBackground:(id)a3
{
  id v4;

  -[NPKSecureElement hardwareManager](self, "hardwareManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterEventListener:", self);

}

- (BOOL)isNFCDisabled
{
  return self->_isNFCDisabled;
}

- (NFHardwareManager)hardwareManager
{
  return self->_hardwareManager;
}

- (void)setHardwareManager:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareManager, a3);
}

- (unsigned)supportState
{
  return self->_supportState;
}

- (void)setSupportState:(unsigned int)a3
{
  self->_supportState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareManager, 0);
  objc_storeStrong((id *)&self->_observerManager, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
}

@end
