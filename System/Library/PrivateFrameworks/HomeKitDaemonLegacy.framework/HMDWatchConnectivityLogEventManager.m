@implementation HMDWatchConnectivityLogEventManager

- (HMDWatchConnectivityLogEventManager)init
{
  HMDWatchConnectivityLogEventManager *v2;
  uint64_t v3;
  HMFTimer *watchConnectivityLogEventManagerTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDWatchConnectivityLogEventManager;
  v2 = -[HMDWatchConnectivityLogEventManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 13, 86400.0);
    watchConnectivityLogEventManagerTimer = v2->_watchConnectivityLogEventManagerTimer;
    v2->_watchConnectivityLogEventManagerTimer = (HMFTimer *)v3;

    -[HMFTimer setDelegate:](v2->_watchConnectivityLogEventManagerTimer, "setDelegate:", v2);
    -[HMFTimer resume](v2->_watchConnectivityLogEventManagerTimer, "resume");
  }
  return v2;
}

- (void)incrementWatchAddedNotificationCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_watchAddedNotificationCountForCurrentIncompleteReport;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementWatchRemovedNotificationCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_watchRemovedNotificationCountForCurrentIncompleteReport;
  os_unfair_lock_unlock(p_lock);
}

- (void)completeCurrentReport
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unint64_t watchAddedNotificationCountForLastCompleteReport;
  unint64_t watchRemovedNotificationCountForLastCompleteReport;
  _BOOL4 hasCompleteReport;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v4 = os_unfair_lock_lock_with_options();
  self->_hasCompleteReport = 1;
  self->_watchAddedNotificationCountForLastCompleteReport = self->_watchAddedNotificationCountForCurrentIncompleteReport;
  self->_watchRemovedNotificationCountForLastCompleteReport = self->_watchRemovedNotificationCountForCurrentIncompleteReport;
  self->_watchAddedNotificationCountForCurrentIncompleteReport = 0;
  self->_watchRemovedNotificationCountForCurrentIncompleteReport = 0;
  v5 = (void *)MEMORY[0x1D17BA0A0](v4);
  HMFGetOSLogHandle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    watchAddedNotificationCountForLastCompleteReport = self->_watchAddedNotificationCountForLastCompleteReport;
    watchRemovedNotificationCountForLastCompleteReport = self->_watchRemovedNotificationCountForLastCompleteReport;
    hasCompleteReport = self->_hasCompleteReport;
    v11 = 138544130;
    v12 = v7;
    v13 = 2048;
    v14 = watchAddedNotificationCountForLastCompleteReport;
    v15 = 2048;
    v16 = watchRemovedNotificationCountForLastCompleteReport;
    v17 = 1024;
    v18 = hasCompleteReport;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@WatchConnectivityLogEventManagerTimer fired: Watch added: %lu Watch removed: %lu reportComplete: %d", (uint8_t *)&v11, 0x26u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_unlock(p_lock);
}

- (HMDWatchConnectivityLogEventManagerSnapshot)currentWatchConnectivitySnapshot
{
  os_unfair_lock_s *p_lock;
  BOOL hasCompleteReport;
  int *v7;
  int *v8;
  unint64_t v9;
  HMDWatchConnectivityLogEventManagerSnapshot *result;

  *(_QWORD *)&retstr->var0 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  hasCompleteReport = self->_hasCompleteReport;
  v7 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchAddedNotificationCountForLastCompleteReport;
  if (hasCompleteReport)
  {
    v8 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchRemovedNotificationCountForLastCompleteReport;
  }
  else
  {
    v7 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchAddedNotificationCountForCurrentIncompleteReport;
    v8 = &OBJC_IVAR___HMDWatchConnectivityLogEventManager__watchRemovedNotificationCountForCurrentIncompleteReport;
  }
  v9 = *(unint64_t *)((char *)&self->super.super.isa + *v8);
  retstr->var1 = *(unint64_t *)((char *)&self->super.super.isa + *v7);
  retstr->var2 = v9;
  retstr->var0 = hasCompleteReport;
  os_unfair_lock_unlock(p_lock);
  return result;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDWatchConnectivityLogEventManager watchConnectivityLogEventManagerTimer](self, "watchConnectivityLogEventManagerTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDWatchConnectivityLogEventManager completeCurrentReport](self, "completeCurrentReport");
}

- (BOOL)hasCompleteReport
{
  return self->_hasCompleteReport;
}

- (void)setHasCompleteReport:(BOOL)a3
{
  self->_hasCompleteReport = a3;
}

- (unint64_t)watchAddedNotificationCountForCurrentIncompleteReport
{
  return self->_watchAddedNotificationCountForCurrentIncompleteReport;
}

- (void)setWatchAddedNotificationCountForCurrentIncompleteReport:(unint64_t)a3
{
  self->_watchAddedNotificationCountForCurrentIncompleteReport = a3;
}

- (unint64_t)watchRemovedNotificationCountForCurrentIncompleteReport
{
  return self->_watchRemovedNotificationCountForCurrentIncompleteReport;
}

- (void)setWatchRemovedNotificationCountForCurrentIncompleteReport:(unint64_t)a3
{
  self->_watchRemovedNotificationCountForCurrentIncompleteReport = a3;
}

- (unint64_t)watchAddedNotificationCountForLastCompleteReport
{
  return self->_watchAddedNotificationCountForLastCompleteReport;
}

- (void)setWatchAddedNotificationCountForLastCompleteReport:(unint64_t)a3
{
  self->_watchAddedNotificationCountForLastCompleteReport = a3;
}

- (unint64_t)watchRemovedNotificationCountForLastCompleteReport
{
  return self->_watchRemovedNotificationCountForLastCompleteReport;
}

- (void)setWatchRemovedNotificationCountForLastCompleteReport:(unint64_t)a3
{
  self->_watchRemovedNotificationCountForLastCompleteReport = a3;
}

- (HMFTimer)watchConnectivityLogEventManagerTimer
{
  return self->_watchConnectivityLogEventManagerTimer;
}

- (void)setWatchConnectivityLogEventManagerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_watchConnectivityLogEventManagerTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchConnectivityLogEventManagerTimer, 0);
}

+ (HMDWatchConnectivityLogEventManager)sharedInstance
{
  if (sharedInstance_onceToken_53709 != -1)
    dispatch_once(&sharedInstance_onceToken_53709, &__block_literal_global_53710);
  return (HMDWatchConnectivityLogEventManager *)(id)sharedInstance_watchConnectivityLogEventManager;
}

void __53__HMDWatchConnectivityLogEventManager_sharedInstance__block_invoke()
{
  HMDWatchConnectivityLogEventManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMDWatchConnectivityLogEventManager);
  v1 = (void *)sharedInstance_watchConnectivityLogEventManager;
  sharedInstance_watchConnectivityLogEventManager = (uint64_t)v0;

}

@end
