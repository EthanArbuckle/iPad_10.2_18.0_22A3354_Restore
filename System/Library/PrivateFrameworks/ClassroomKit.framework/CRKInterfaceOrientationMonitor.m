@implementation CRKInterfaceOrientationMonitor

- (void)dealloc
{
  objc_super v3;

  -[FBSOrientationObserver invalidate](self->mObserver, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRKInterfaceOrientationMonitor;
  -[CRKInterfaceOrientationMonitor dealloc](&v3, sel_dealloc);
}

- (CRKInterfaceOrientationMonitor)init
{
  CRKInterfaceOrientationMonitor *v2;
  CRKInterfaceOrientationMonitor *v3;
  uint64_t v4;
  NSMutableArray *mCompletionBlocks;
  void *v6;
  uint64_t v7;
  FBSOrientationObserver *mObserver;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRKInterfaceOrientationMonitor;
  v2 = -[CRKInterfaceOrientationMonitor init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_interfaceOrientation = 0;
    v4 = objc_opt_new();
    mCompletionBlocks = v3->mCompletionBlocks;
    v3->mCompletionBlocks = (NSMutableArray *)v4;

    v3->mIsWaitingForFirstUpdate = 1;
    -[CRKInterfaceOrientationMonitor makeUpdateHandler](v3, "makeUpdateHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_new();
    mObserver = v3->mObserver;
    v3->mObserver = (FBSOrientationObserver *)v7;

    -[FBSOrientationObserver setHandler:](v3->mObserver, "setHandler:", v6);
    -[FBSOrientationObserver activeInterfaceOrientationWithCompletion:](v3->mObserver, "activeInterfaceOrientationWithCompletion:", v6);

  }
  return v3;
}

- (id)makeUpdateHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke;
  v4[3] = &unk_24D9C8AD0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x219A226E8](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCF18];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke_2;
  v6[3] = &unk_24D9C7DC8;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "cat_performBlockOnMainRunLoop:", v6);

  objc_destroyWeak(&v8);
}

void __51__CRKInterfaceOrientationMonitor_makeUpdateHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateInterfaceOrientationWithNotification:", *(_QWORD *)(a1 + 32));

}

- (void)interfaceOrientationWithCompletion:(id)a3
{
  NSMutableArray *mCompletionBlocks;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, unint64_t);

  v10 = (void (**)(id, unint64_t))a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInterfaceOrientationMonitor.m"), 71, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInterfaceOrientationMonitor.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (self->mIsWaitingForFirstUpdate)
  {
    mCompletionBlocks = self->mCompletionBlocks;
    v6 = (void *)MEMORY[0x219A226E8]();
    -[NSMutableArray addObject:](mCompletionBlocks, "addObject:", v6);

  }
  else
  {
    v10[2](v10, -[CRKInterfaceOrientationMonitor interfaceOrientation](self, "interfaceOrientation"));
  }

}

- (void)updateInterfaceOrientationWithNotification:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInterfaceOrientationMonitor.m"), 88, CFSTR("%@ must be called from the main thread"), v13);

  }
  -[CRKInterfaceOrientationMonitor updateInterfaceOrientationWithBSOrientation:](self, "updateInterfaceOrientationWithBSOrientation:", objc_msgSend(v5, "orientation"));
  if (self->mIsWaitingForFirstUpdate)
  {
    self->mIsWaitingForFirstUpdate = 0;
    v6 = (void *)-[NSMutableArray copy](self->mCompletionBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->mCompletionBlocks, "removeAllObjects");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD, unint64_t))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), -[CRKInterfaceOrientationMonitor interfaceOrientation](self, "interfaceOrientation"));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)updateInterfaceOrientationWithBSOrientation:(int64_t)a3
{
  -[CRKInterfaceOrientationMonitor updateInterfaceOrientationWithDMFOrientation:](self, "updateInterfaceOrientationWithDMFOrientation:", -[CRKInterfaceOrientationMonitor DMFInterfaceOrientationFromBSInterfaceOrientation:](self, "DMFInterfaceOrientationFromBSInterfaceOrientation:", a3));
}

- (unint64_t)DMFInterfaceOrientationFromBSInterfaceOrientation:(int64_t)a3
{
  void *v5;

  if ((unint64_t)a3 < 5)
    return qword_218D50240[a3];
  if (_CRKLogGeneral_onceToken_14 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_14, &__block_literal_global_54);
  v5 = (void *)_CRKLogGeneral_logObj_14;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_14, OS_LOG_TYPE_ERROR))
    -[CRKInterfaceOrientationMonitor DMFInterfaceOrientationFromBSInterfaceOrientation:].cold.1(v5, a3);
  return 0;
}

- (void)updateInterfaceOrientationWithDMFOrientation:(unint64_t)a3
{
  if (-[CRKInterfaceOrientationMonitor interfaceOrientation](self, "interfaceOrientation") != a3)
    -[CRKInterfaceOrientationMonitor setInterfaceOrientation:](self, "setInterfaceOrientation:", a3);
}

- (unint64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(unint64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCompletionBlocks, 0);
  objc_storeStrong((id *)&self->mObserver, 0);
}

- (void)DMFInterfaceOrientationFromBSInterfaceOrientation:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v5;
  _os_log_error_impl(&dword_218C99000, v4, OS_LOG_TYPE_ERROR, "Unknown BSInterfaceOrientation: %{public}@", (uint8_t *)&v6, 0xCu);

}

@end
