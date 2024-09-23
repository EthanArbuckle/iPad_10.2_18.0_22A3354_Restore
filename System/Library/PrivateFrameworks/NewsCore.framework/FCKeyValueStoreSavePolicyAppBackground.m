@implementation FCKeyValueStoreSavePolicyAppBackground

- (void)activityObservingApplicationDidBecomeActive
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  self->_inBackground = 0;
}

- (FCKeyValueStoreSavePolicyAppBackground)initWithActivityMonitor:(id)a3 backgroundTaskable:(id)a4
{
  id v6;
  id v7;
  FCKeyValueStoreSavePolicyAppBackground *v8;
  FCKeyValueStoreSavePolicyAppBackground *v9;
  _QWORD v11[4];
  id v12;
  FCKeyValueStoreSavePolicyAppBackground *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCKeyValueStoreSavePolicyAppBackground;
  v8 = -[FCKeyValueStoreSavePolicyAppBackground init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backgroundTaskable, a4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__FCKeyValueStoreSavePolicyAppBackground_initWithActivityMonitor_backgroundTaskable___block_invoke;
    v11[3] = &unk_1E463AD10;
    v12 = v6;
    v13 = v9;
    FCPerformBlockOnMainThread(v11);

  }
  return v9;
}

uint64_t __85__FCKeyValueStoreSavePolicyAppBackground_initWithActivityMonitor_backgroundTaskable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:", *(_QWORD *)(a1 + 40));
}

- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke;
  v10[3] = &unk_1E463CCB8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  FCPerformBlockOnMainThread(v10);

}

void __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  v2 = _Block_copy(*(const void **)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v5 = dispatch_time(0, 5000000000);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_2;
    v9[3] = &unk_1E463AB18;
    v9[4] = *(_QWORD *)(a1 + 32);
    v6 = MEMORY[0x1E0C80D38];
    v7 = v9;
  }
  else
  {
    v5 = dispatch_time(0, 60000000000);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_3;
    v8[3] = &unk_1E463AB18;
    v8[4] = *(_QWORD *)(a1 + 32);
    v6 = MEMORY[0x1E0C80D38];
    v7 = v8;
  }
  dispatch_after(v5, v6, v7);
}

uint64_t __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveIfNeeded");
}

uint64_t __70__FCKeyValueStoreSavePolicyAppBackground_scheduleSaveOnQueue_handler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveIfNeeded");
}

- (void)activityObservingApplicationWillResignActiveWithSceneID:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  self->_inBackground = 1;
  -[FCKeyValueStoreSavePolicyAppBackground _saveIfNeeded](self, "_saveIfNeeded");
}

- (void)activityObservingApplicationWillTerminate
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  self->_inBackground = 1;
  -[FCKeyValueStoreSavePolicyAppBackground _saveIfNeeded](self, "_saveIfNeeded");
}

- (void)_saveIfNeeded
{
  OS_dispatch_queue *v3;
  void *v4;
  OS_dispatch_queue *pendingQueue;
  id pendingHandler;
  BOOL v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = self->_pendingQueue;
  v4 = _Block_copy(self->_pendingHandler);
  pendingQueue = self->_pendingQueue;
  self->_pendingQueue = 0;

  pendingHandler = self->_pendingHandler;
  self->_pendingHandler = 0;

  if (v3)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (self->_inBackground)
    {
      dispatch_sync((dispatch_queue_t)v3, v4);
    }
    else
    {
      v8 = -[FCBackgroundTaskable fc_beginBackgroundTaskWithName:expirationHandler:](self->_backgroundTaskable, "fc_beginBackgroundTaskWithName:expirationHandler:", CFSTR("save-kvs"), 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__FCKeyValueStoreSavePolicyAppBackground__saveIfNeeded__block_invoke;
      block[3] = &unk_1E463F9A0;
      block[4] = self;
      v10 = v4;
      v11 = v8;
      dispatch_async((dispatch_queue_t)v3, block);

    }
  }

}

uint64_t __55__FCKeyValueStoreSavePolicyAppBackground__saveIfNeeded__block_invoke(_QWORD *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  return objc_msgSend(*(id *)(a1[4] + 8), "fc_endBackgroundTask:", a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingHandler, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundTaskable, 0);
}

@end
