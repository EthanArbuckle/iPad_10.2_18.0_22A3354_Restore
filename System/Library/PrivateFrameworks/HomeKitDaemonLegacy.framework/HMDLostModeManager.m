@implementation HMDLostModeManager

- (BOOL)isLost
{
  HMDLostModeManager *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_lost;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_119766 != -1)
    dispatch_once(&sharedManager_onceToken_119766, &__block_literal_global_119767);
  return (id)sharedManager_sharedManager;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDLostModeManager isLost](self, "isLost");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Lost"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_24406 != -1)
    dispatch_once(&logCategory__hmf_once_t0_24406, &__block_literal_global_24407);
  return (id)logCategory__hmf_once_v1_24408;
}

void __41__HMDLostModeManager_Common__logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_24408;
  logCategory__hmf_once_v1_24408 = v0;

}

- (HMDLostModeManager)init
{
  HMDLostModeManager *v2;
  HMDLostModeManager *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDLostModeManager;
  v2 = -[HMDLostModeManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock.lock._os_unfair_lock_opaque = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__HMDLostModeManagerLostModeChangeNotification, (CFStringRef)*MEMORY[0x1E0D21398], 0, CFNotificationSuspensionBehaviorCoalesce);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)__HMDLostModeManagerExitLostModeWithAuthCompleteNotification, (CFStringRef)*MEMORY[0x1E0D21370], 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_lost = objc_msgSend(v6, "lostModeIsActive");

  }
  return v3;
}

- (BOOL)isLostOrNeedsExitAuth
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "lostModeIsActive") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "needsLostModeExitAuth");

  }
  return v3;
}

void __35__HMDLostModeManager_sharedManager__block_invoke()
{
  HMDLostModeManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMDLostModeManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

@end
