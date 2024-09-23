@implementation LCSFirstUnlockManager

- (LCSFirstUnlockManager)init
{
  LCSFirstUnlockManager *v2;
  int v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LCSFirstUnlockManager;
  v2 = -[LCSFirstUnlockManager init](&v9, sel_init);
  if (v2)
  {
    v3 = MKBDeviceUnlockedSinceBoot();
    v2->_hasUnlockedSinceBoot = v3 > 0;
    if (v3 <= 0)
    {
      v4 = BSDispatchQueueCreateWithQualityOfService();
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v4;

      objc_initWeak(&location, v2);
      objc_copyWeak(&v7, &location);
      v2->_aksEvent = (_AKSEvent *)AKSEventsRegister();
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

void __29__LCSFirstUnlockManager_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "setHasUnlockedSinceBoot:", 1);
    objc_msgSend(v6, "postFirstUnlockHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      objc_msgSend(v6, "setPostFirstUnlockHandler:", 0);
    }
    objc_msgSend(v6, "endObservingForFirstUnlock");

    WeakRetained = v6;
  }

}

- (void)endObservingForFirstUnlock
{
  if (self->_aksEvent)
  {
    AKSEventsUnregister();
    self->_aksEvent = 0;
  }
}

- (void)setPostFirstUnlockHandler:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 v5;
  void *v6;
  id postFirstUnlockHandler;
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v8 = v4;
  if (v4)
  {
    v5 = -[LCSFirstUnlockManager hasUnlockedSinceBoot](self, "hasUnlockedSinceBoot");
    v4 = v8;
    if (v5)
    {
      v8[2](v8);
LABEL_6:
      v4 = v8;
      goto LABEL_7;
    }
  }
  if (self->_postFirstUnlockHandler != v4)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    postFirstUnlockHandler = self->_postFirstUnlockHandler;
    self->_postFirstUnlockHandler = v6;

    goto LABEL_6;
  }
LABEL_7:

}

- (void)dealloc
{
  objc_super v3;

  -[LCSFirstUnlockManager endObservingForFirstUnlock](self, "endObservingForFirstUnlock");
  v3.receiver = self;
  v3.super_class = (Class)LCSFirstUnlockManager;
  -[LCSFirstUnlockManager dealloc](&v3, sel_dealloc);
}

- (BOOL)hasUnlockedSinceBoot
{
  return self->_hasUnlockedSinceBoot;
}

- (void)setHasUnlockedSinceBoot:(BOOL)a3
{
  self->_hasUnlockedSinceBoot = a3;
}

- (id)postFirstUnlockHandler
{
  return self->_postFirstUnlockHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postFirstUnlockHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
