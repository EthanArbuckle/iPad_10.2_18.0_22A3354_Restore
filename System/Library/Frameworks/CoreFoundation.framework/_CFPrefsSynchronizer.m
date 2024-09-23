@implementation _CFPrefsSynchronizer

+ (uint64_t)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_42);
  return sharedInstance_shared;
}

- (void)noteDirtySource:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 24), a2);
    if (!*(_BYTE *)(a1 + 36))
    {
      *(_BYTE *)(a1 + 36) = 1;
      dispatch_resume(*(dispatch_object_t *)(a1 + 8));
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)synchronize
{
  const __CFSet *v1;

  if (a1)
  {
    v1 = -[_CFPrefsSynchronizer copyDirtySourcesSnapshotAndClear](a1);
    CFSetApplyFunction(v1, (CFSetApplierFunction)_CFPrefsSynchronizeDirtySourceForTimer, 0);
    CFRelease(v1);
  }
}

- (CFSetRef)copyDirtySourcesSnapshotAndClear
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  CFSetRef Copy;

  if (result)
  {
    v1 = (uint64_t)result;
    v2 = (os_unfair_lock_s *)((char *)result + 32);
    os_unfair_lock_lock_with_options();
    Copy = CFSetCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFSetRef *)(v1 + 24));
    -[_CFPrefsSynchronizer clear_alreadyLocked](v1);
    os_unfair_lock_unlock(v2);
    return Copy;
  }
  return result;
}

- (void)clear_alreadyLocked
{
  if (a1)
  {
    CFSetRemoveAllValues(*(CFMutableSetRef *)(a1 + 24));
    if (*(_BYTE *)(a1 + 36))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 8));
      *(_BYTE *)(a1 + 36) = 0;
    }
  }
}

- (_CFPrefsSynchronizer)init
{
  _CFPrefsSynchronizer *v2;
  _CFPrefsSynchronizer *v3;
  NSObject *global_queue;
  NSObject *v5;
  NSObject *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_CFPrefsSynchronizer;
  v2 = -[_CFPrefsSynchronizer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_CFPrefsDirtySourcesLock._os_unfair_lock_opaque = 0;
    v2->_dirtySources = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = dispatch_queue_create_with_target_V2("CFPreferences Periodic Sync Queue", 0, global_queue);
    v3->_synchQueue = (OS_dispatch_queue *)v5;
    v6 = dispatch_source_create(MEMORY[0x1E0C80D90], 0x2710uLL, 0, v5);
    v3->_synchTimer = (OS_dispatch_source *)v6;
    dispatch_source_set_event_handler(v6, &__block_literal_global_2_0);
  }
  return v3;
}

- (void)enableTimer_alreadyLocked
{
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 36))
    {
      *(_BYTE *)(a1 + 36) = 1;
      dispatch_resume(*(dispatch_object_t *)(a1 + 8));
    }
  }
}

- (void)disableTimer_alreadyLocked
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 36))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 8));
      *(_BYTE *)(a1 + 36) = 0;
    }
  }
}

- (void)synchronizeForDaemonTermination
{
  const __CFSet *v1;

  if (a1)
  {
    v1 = -[_CFPrefsSynchronizer copyDirtySourcesSnapshotAndClear](a1);
    CFSetApplyFunction(v1, (CFSetApplierFunction)_CFPrefsSynchronizeDirtySourceForDaemonTermination, 0);
    CFRelease(v1);
  }
}

- (void)clear
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    -[_CFPrefsSynchronizer clear_alreadyLocked](a1);
    os_unfair_lock_unlock(v2);
  }
}

@end
