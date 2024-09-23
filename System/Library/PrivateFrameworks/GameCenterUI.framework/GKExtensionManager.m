@implementation GKExtensionManager

- (GKExtensionManager)initWithExtensionBundleIdentifer:(id)a3 host:(id)a4
{
  id v5;
  GKExtensionManager *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKExtensionManager;
  v6 = -[GKExtensionManager init](&v9, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.gamecenter.extension_state_queue", MEMORY[0x1E0C80D50]);
    -[GKExtensionManager setStateQueue:](v6, "setStateQueue:", v7);

    -[GKExtensionManager setExtensionIdentifier:](v6, "setExtensionIdentifier:", v5);
  }

  return v6;
}

- (void)instantiateViewControllerWithHost:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKExtensionManager *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  -[GKExtensionManager setExtensionLoadState:](self, "setExtensionLoadState:", 1);
  v8 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Extensions/GKExtensionManager.m", 57, "-[GKExtensionManager instantiateViewControllerWithHost:handler:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchGroupWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke;
  v21[3] = &unk_1E59C41C0;
  v21[4] = self;
  v12 = v10;
  v22 = v12;
  objc_msgSend(v12, "perform:", v21);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3;
  v16[3] = &unk_1E59C5688;
  v17 = v12;
  v18 = self;
  v19 = v6;
  v20 = v7;
  v13 = v7;
  v14 = v6;
  v15 = v12;
  objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v16);

}

void __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  void (**v10)(_QWORD);
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB35D8];
  objc_msgSend(*(id *)(a1 + 32), "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "_gkExtensionWithIdentifier:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:", v7);
    v3[2](v3);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_2;
    v8[3] = &unk_1E59C6800;
    v9 = *(id *)(a1 + 40);
    v10 = v3;
    objc_msgSend(v6, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v8);

  }
}

uint64_t __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "setError:", a4);
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v7);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3(uint64_t a1)
{
  void **v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v2 = (void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!*MEMORY[0x1E0D25460])
      v4 = (id)GKOSLoggers();
    v5 = (void *)*MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3_cold_1(v2, v5);
    v6 = *(void **)(a1 + 40);
    v7 = 0;
  }
  else
  {
    objc_msgSend(*v2, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setExtensionHostViewController:", v9);

    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "extensionHostViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHostViewController:", v10);

    v12 = *(void **)(a1 + 40);
    objc_msgSend(v12, "extensionHostViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v12);

    v6 = *(void **)(a1 + 40);
    v7 = 2;
  }
  objc_msgSend(v6, "setExtensionLoadState:", v7);
LABEL_10:
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
  {
    objc_msgSend(*v2, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);

  }
}

- (int64_t)extensionLoadState
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[GKExtensionManager stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__GKExtensionManager_extensionLoadState__block_invoke;
  v6[3] = &unk_1E59C6828;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__GKExtensionManager_extensionLoadState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)setExtensionLoadState:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[GKExtensionManager stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__GKExtensionManager_setExtensionLoadState___block_invoke;
  v6[3] = &unk_1E59C6850;
  v6[4] = self;
  v6[5] = a3;
  dispatch_barrier_async(v5, v6);

}

uint64_t __44__GKExtensionManager_setExtensionLoadState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = *(_QWORD *)(result + 40);
  return result;
}

- (BOOL)needToLoadExtension
{
  return -[GKExtensionManager extensionLoadState](self, "extensionLoadState") == 0;
}

- (void)extensionDidTerminateWithError:(id)a3
{
  -[GKExtensionManager setExtensionLoadState:](self, "setExtensionLoadState:", 0);
  -[GKExtensionManager setExtensionHostViewController:](self, "setExtensionHostViewController:", 0);
}

- (GKExtensionHostViewController)extensionHostViewController
{
  return self->_extensionHostViewController;
}

- (void)setExtensionHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionHostViewController, a3);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateQueue, a3);
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_extensionHostViewController, 0);
}

void __64__GKExtensionManager_instantiateViewControllerWithHost_handler___block_invoke_3_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AB361000, v3, OS_LOG_TYPE_ERROR, "Error instantiating remote view controller: %@", (uint8_t *)&v5, 0xCu);

}

@end
