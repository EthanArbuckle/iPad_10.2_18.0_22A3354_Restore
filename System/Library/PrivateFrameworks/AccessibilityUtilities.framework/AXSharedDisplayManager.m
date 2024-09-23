@implementation AXSharedDisplayManager

void ___AXSharedDisplayManager_block_invoke()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (_AXSCurrentProcessIsWebContent())
  {
    _AXSharedDisplayManager_CanAccessDisplayManager = 1;
  }
  else
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2050000000;
    v0 = (void *)getAXMDisplayManagerClass_softClass;
    v8 = getAXMDisplayManagerClass_softClass;
    if (!getAXMDisplayManagerClass_softClass)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __getAXMDisplayManagerClass_block_invoke;
      v4[3] = &unk_1E24C4AE0;
      v4[4] = &v5;
      __getAXMDisplayManagerClass_block_invoke((uint64_t)v4);
      v0 = (void *)v6[3];
    }
    v1 = objc_retainAutorelease(v0);
    _Block_object_dispose(&v5, 8);
    v2 = objc_msgSend([v1 alloc], "initWithCompletion:", &__block_literal_global_227_0);
    v3 = (void *)_AXSharedDisplayManager__Shared;
    _AXSharedDisplayManager__Shared = v2;

  }
}

uint64_t ___AXSharedDisplayManager_block_invoke_2()
{
  return AXPerformBlockSynchronouslyOnMainThread();
}

void ___AXSharedDisplayManager_block_invoke_3()
{
  NSObject *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x18D7846EC]())
  {
    AXLogDisplay();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      _AXSharedDisplayManager();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "coreAnimationMainDisplay");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = 138412290;
      v4 = v2;
      _os_log_impl(&dword_18C62B000, v0, OS_LOG_TYPE_DEFAULT, "Did finish initializing AX DisplayManager: %@", (uint8_t *)&v3, 0xCu);

    }
  }
}

@end
