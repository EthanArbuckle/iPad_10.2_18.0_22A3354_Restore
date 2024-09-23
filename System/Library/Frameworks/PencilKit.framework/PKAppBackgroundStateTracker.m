@implementation PKAppBackgroundStateTracker

void __45__PKAppBackgroundStateTracker_sharedInstance__block_invoke()
{
  PKAppBackgroundStateTracker *v0;
  void *v1;

  v0 = objc_alloc_init(PKAppBackgroundStateTracker);
  v1 = (void *)qword_1ECEE61D8;
  qword_1ECEE61D8 = (uint64_t)v0;

}

void __43__PKAppBackgroundStateTracker__updateState__block_invoke(uint64_t a1)
{
  -[PKAppBackgroundStateTracker _updateStateOnMainThread](*(_QWORD *)(a1 + 32));
}

- (PKAppBackgroundStateTracker)init
{
  PKAppBackgroundStateTracker *v2;
  PKAppBackgroundStateTracker *v3;
  Class v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAppBackgroundStateTracker;
  v2 = -[PKAppBackgroundStateTracker init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_inBackground);
    v4 = NSClassFromString(CFSTR("UIApplication"));
    v3->_applicationClass = v4;
    if (v4)
    {
      if ((_UIApplicationIsExtension() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ScreenshotServicesService"));

        if ((v7 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel__updateState, *MEMORY[0x1E0DC4768], 0);

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__updateState, *MEMORY[0x1E0DC4750], 0);

          -[PKAppBackgroundStateTracker _updateState](v3, "_updateState");
        }
      }
    }
  }
  return v3;
}

- (void)_updateState
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[PKAppBackgroundStateTracker _updateStateOnMainThread]((uint64_t)self);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PKAppBackgroundStateTracker__updateState__block_invoke;
    block[3] = &unk_1E7778020;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_updateStateOnMainThread
{
  void *v2;
  unsigned __int8 v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "applicationState") == 2;

    atomic_store(v3, (unsigned __int8 *)(a1 + 8));
  }
}

+ (id)sharedInstance
{
  objc_opt_self();
  if (_MergedGlobals_126 != -1)
    dispatch_once(&_MergedGlobals_126, &__block_literal_global_33);
  return (id)qword_1ECEE61D8;
}

@end
