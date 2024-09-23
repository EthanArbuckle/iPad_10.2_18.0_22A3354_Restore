@implementation AVApplicationStateMonitor

uint64_t __58__AVApplicationStateMonitor_isHostApplicationInForeground__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)dealloc
{
  NSObject *ivarAccessQueue;
  objc_super v4;

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  if (self->_didEnterBackgroundNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_didEnterBackgroundNotificationToken);

  }
  if (self->_willEnterForegroundNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_willEnterForegroundNotificationToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)AVApplicationStateMonitor;
  -[AVApplicationStateMonitor dealloc](&v4, sel_dealloc);
}

+ (id)sharedApplicationStateMonitor
{
  AVApplicationStateMonitor *WeakRetained;

  if (sharedApplicationStateMonitor_gAVApplicationStateMonitor_Once != -1)
    dispatch_once(&sharedApplicationStateMonitor_gAVApplicationStateMonitor_Once, &__block_literal_global_24);
  MEMORY[0x194033BF8](sharedApplicationStateMonitor__mutex);
  WeakRetained = (AVApplicationStateMonitor *)objc_loadWeakRetained(&sharedApplicationStateMonitor__weakApplicationStateMonitor);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(AVApplicationStateMonitor);
    objc_storeWeak(&sharedApplicationStateMonitor__weakApplicationStateMonitor, WeakRetained);
  }
  MEMORY[0x194033C04](sharedApplicationStateMonitor__mutex);
  return WeakRetained;
}

- (AVApplicationStateMonitor)init
{
  AVApplicationStateMonitor *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVApplicationStateMonitor;
  v2 = -[AVApplicationStateMonitor init](&v18, sel_init);
  if (v2)
  {
    v2->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avapplicationutilities.ivars");
    v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"), "currentState");
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, "taskState") == 4 || objc_msgSend(v4, "taskState") == 2;
      v6 = (void *)objc_msgSend(v4, "endowmentNamespaces");
      v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D22E58]);
      if (v5 && (v7 & 1) != 0)
        v8 = 1;
      else
        v8 = -[AVApplicationStateMonitor _hostApplicationHasForegroundExemption](v2, "_hostApplicationHasForegroundExemption");
      v2->_hostApplicationInForeground = v8;
    }
    else
    {
      v2->_hostApplicationInForeground = 1;
    }
    objc_initWeak(&location, v2);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __33__AVApplicationStateMonitor_init__block_invoke;
    v15[3] = &unk_1E302FA38;
    objc_copyWeak(&v16, &location);
    v2->_didEnterBackgroundNotificationToken = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, 0, v15);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __33__AVApplicationStateMonitor_init__block_invoke_2;
    v13[3] = &unk_1E302FA38;
    objc_copyWeak(&v14, &location);
    v2->_willEnterForegroundNotificationToken = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)isHostApplicationInForeground
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVApplicationStateMonitor_isHostApplicationInForeground__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVApplicationStateMonitor_sharedApplicationStateMonitor__block_invoke()
{
  uint64_t result;

  result = FigSimpleMutexCreate();
  sharedApplicationStateMonitor__mutex = result;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

uint64_t __33__AVApplicationStateMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_didEnterBackground:", a2);
}

uint64_t __33__AVApplicationStateMonitor_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_willEnterForeground:", a2);
}

- (void)setHostApplicationInForeground:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__AVApplicationStateMonitor_setHostApplicationInForeground___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __60__AVApplicationStateMonitor_setHostApplicationInForeground___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)_hostApplicationHasForegroundExemption
{
  if (_hostApplicationHasForegroundExemption_onceToken != -1)
    dispatch_once(&_hostApplicationHasForegroundExemption_onceToken, &__block_literal_global_11);
  return _hostApplicationHasForegroundExemption_applicationHasForegroundExemption;
}

void __67__AVApplicationStateMonitor__hostApplicationHasForegroundExemption__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.avfoundation.tool-has-foreground-exemption"), 0);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID())
        _hostApplicationHasForegroundExemption_applicationHasForegroundExemption = CFBooleanGetValue(v3) != 0;
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

- (void)_didEnterBackground:(id)a3
{
  -[AVApplicationStateMonitor setHostApplicationInForeground:](self, "setHostApplicationInForeground:", 0);
}

- (void)_willEnterForeground:(id)a3
{
  -[AVApplicationStateMonitor setHostApplicationInForeground:](self, "setHostApplicationInForeground:", 1);
}

@end
