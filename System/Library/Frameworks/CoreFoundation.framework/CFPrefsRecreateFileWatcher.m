@implementation CFPrefsRecreateFileWatcher

uint64_t ___CFPrefsRecreateFileWatcher_block_invoke()
{
  uint64_t locked;

  os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
  locked = _onqueue_locked_CFPrefsRecreateFileWatcher();
  os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
  return fsEventStreamStart(locked);
}

@end
