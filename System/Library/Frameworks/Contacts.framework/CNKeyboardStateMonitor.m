@implementation CNKeyboardStateMonitor

- (int64_t)keyboardState
{
  return self->_keyboardState;
}

void __30__CNKeyboardStateMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setKeyboardState:", 2);

}

void __30__CNKeyboardStateMonitor_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setKeyboardState:", 3);

}

- (void)setKeyboardState:(int64_t)a3
{
  self->_keyboardState = a3;
}

void __39__CNKeyboardStateMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMonitor_cn_once_object_0;
  sharedMonitor_cn_once_object_0 = (uint64_t)v1;

}

- (CNKeyboardStateMonitor)init
{
  CNKeyboardStateMonitor *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *didHideObserver;
  void *v8;
  uint64_t v9;
  NSObject *didShowObserver;
  CNKeyboardStateMonitor *v11;
  CNKeyboardStateMonitor *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CNKeyboardStateMonitor;
  v2 = -[CNKeyboardStateMonitor init](&v19, sel_init);
  if (v2)
  {
    if (NSClassFromString(CFSTR("UIApplication")))
    {
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v2);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __30__CNKeyboardStateMonitor_init__block_invoke;
      v16[3] = &unk_1E29F8880;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("UIKeyboardDidHideNotification"), 0, v3, v16);
      v6 = objc_claimAutoreleasedReturnValue();
      didHideObserver = v2->_didHideObserver;
      v2->_didHideObserver = v6;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __30__CNKeyboardStateMonitor_init__block_invoke_2;
      v14[3] = &unk_1E29F8880;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("UIKeyboardDidShowNotification"), 0, v3, v14);
      v9 = objc_claimAutoreleasedReturnValue();
      didShowObserver = v2->_didShowObserver;
      v2->_didShowObserver = v9;

      v11 = v2;
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
    else
    {
      -[CNKeyboardStateMonitor setKeyboardState:](v2, "setKeyboardState:", 1);
      v12 = v2;
    }
  }

  return v2;
}

+ (CNKeyboardStateMonitor)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CNKeyboardStateMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_cn_once_token_0 != -1)
    dispatch_once(&sharedMonitor_cn_once_token_0, block);
  return (CNKeyboardStateMonitor *)(id)sharedMonitor_cn_once_object_0;
}

- (void)dealloc
{
  void *v3;
  NSObject *didHideObserver;
  void *v5;
  NSObject *didShowObserver;
  objc_super v7;

  if (self->_didHideObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_didHideObserver);

    didHideObserver = self->_didHideObserver;
    self->_didHideObserver = 0;

  }
  if (self->_didShowObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self->_didShowObserver);

    didShowObserver = self->_didShowObserver;
    self->_didShowObserver = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)CNKeyboardStateMonitor;
  -[CNKeyboardStateMonitor dealloc](&v7, sel_dealloc);
}

- (NSObject)didShowObserver
{
  return self->_didShowObserver;
}

- (void)setDidShowObserver:(id)a3
{
  objc_storeStrong((id *)&self->_didShowObserver, a3);
}

- (NSObject)didHideObserver
{
  return self->_didHideObserver;
}

- (void)setDidHideObserver:(id)a3
{
  objc_storeStrong((id *)&self->_didHideObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didHideObserver, 0);
  objc_storeStrong((id *)&self->_didShowObserver, 0);
}

@end
