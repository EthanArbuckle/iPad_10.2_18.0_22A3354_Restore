@implementation PKRendererVSyncController

- (PKRendererVSyncController)init
{
  PKRendererVSyncController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *vSyncQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *runloopQueue;
  uint64_t v8;
  NSHashTable *rendererControllers;
  NSObject *v10;
  _QWORD block[4];
  PKRendererVSyncController *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKRendererVSyncController;
  v2 = -[PKRendererVSyncController init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.pencilkit.vsync", v3);
    vSyncQueue = v2->_vSyncQueue;
    v2->_vSyncQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.pencilkit.vsync-runloop", v3);
    runloopQueue = v2->_runloopQueue;
    v2->_runloopQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
    v8 = objc_claimAutoreleasedReturnValue();
    rendererControllers = v2->_rendererControllers;
    v2->_rendererControllers = (NSHashTable *)v8;

    mach_timebase_info((mach_timebase_info_t)&timebase_info);
    v10 = v2->_runloopQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PKRendererVSyncController_init__block_invoke;
    block[3] = &unk_1E7776F38;
    v13 = v2;
    dispatch_async(v10, block);

  }
  return v2;
}

void __33__PKRendererVSyncController_init__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (_QWORD *)(v1 + 32);
    if (!*(_QWORD *)(v1 + 32))
    {
      v3 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v9 = CFSTR("primary");
        _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "Opening mobile framebuffer by name: %@", buf, 0xCu);
      }

      IOMobileFramebufferOpenByName();
      if (*v2)
      {
        RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource();
        if (RunLoopSource)
        {
          Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
          IOMobileFramebufferSupportedFrameInfo();
          IOMobileFramebufferChangeFrameInfo();
          IOMobileFramebufferFrameInfo();
        }
        else
        {
          v7 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1BE213000, v7, OS_LOG_TYPE_ERROR, "Unable to get runloop source for primary mobile framebuffer", buf, 2u);
          }

          *v2 = 0;
        }
      }
      else
      {
        v6 = os_log_create("com.apple.pencilkit", "Sketching");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE213000, v6, OS_LOG_TYPE_ERROR, "Unable to open primary mobile framebuffer", buf, 2u);
        }

      }
    }
  }
  CFRunLoopRun();
}

+ (id)sharedController
{
  objc_opt_self();
  if (qword_1ECEE6198 != -1)
    dispatch_once(&qword_1ECEE6198, &__block_literal_global_25);
  return (id)_MergedGlobals_122;
}

void __45__PKRendererVSyncController_sharedController__block_invoke()
{
  PKRendererVSyncController *v0;
  void *v1;

  v0 = objc_alloc_init(PKRendererVSyncController);
  v1 = (void *)_MergedGlobals_122;
  _MergedGlobals_122 = (uint64_t)v0;

}

- (BOOL)isActive
{
  NSObject *v1;
  _BOOL8 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__PKRendererVSyncController_isActive__block_invoke;
  v4[3] = &unk_1E7777418;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__PKRendererVSyncController_isActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32) != 0;
  return result;
}

- (void)addRendererController:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PKRendererVSyncController_addRendererController___block_invoke;
    v6[3] = &unk_1E7777440;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __51__PKRendererVSyncController_addRendererController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeRendererController:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    block[1] = 3221225472;
    block[2] = __54__PKRendererVSyncController_removeRendererController___block_invoke;
    block[3] = &unk_1E7777440;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

uint64_t __54__PKRendererVSyncController_removeRendererController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __67__PKRendererVSyncController_signalVSyncSemaphore_presentationTime___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "signalVSyncSemaphore:presentationTime:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 40), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererControllers, 0);
  objc_storeStrong((id *)&self->_runloopQueue, 0);
  objc_storeStrong((id *)&self->_vSyncQueue, 0);
}

@end
