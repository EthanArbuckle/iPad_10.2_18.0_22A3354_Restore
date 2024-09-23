@implementation HMIVisionSession

+ (HMIVisionSession)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMIVisionSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (HMIVisionSession *)(id)sharedInstance_session;
}

void __34__HMIVisionSession_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x220735570]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_219D45000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing HMIVisionSession", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = objc_alloc_init(*(Class *)(a1 + 32));
  v7 = (void *)sharedInstance_session;
  sharedInstance_session = (uint64_t)v6;

}

- (HMIVisionSession)init
{
  HMIVisionSession *v2;
  HMIVisionSession *v3;
  uint64_t v4;
  HMFTimer *watchdogTimer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMIVisionSession;
  v2 = -[HMIVisionSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 8, 30.0);
    watchdogTimer = v3->_watchdogTimer;
    v3->_watchdogTimer = (HMFTimer *)v4;

    -[HMFTimer setDelegate:](v3->_watchdogTimer, "setDelegate:", v3);
  }
  return v3;
}

- (VNSession)vnSession
{
  os_unfair_lock_s *p_lock;
  HMFOSTransaction *v4;
  HMFOSTransaction *transaction;
  VNSession *v6;
  VNSession *session;
  void *v8;
  VNSession *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_session)
  {
    v4 = (HMFOSTransaction *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("HMIVisionSession"));
    transaction = self->_transaction;
    self->_transaction = v4;

    v6 = (VNSession *)objc_alloc_init(MEMORY[0x24BDF9CE8]);
    session = self->_session;
    self->_session = v6;

  }
  -[HMIVisionSession watchdogTimer](self, "watchdogTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

  v9 = self->_session;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  void *v8;
  HMIVisionSession *v9;
  NSObject *v10;
  void *v11;
  VNSession *session;
  HMFOSTransaction *transaction;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  p_lock = &self->_lock;
  v7 = os_unfair_lock_lock_with_options();
  v8 = (void *)MEMORY[0x220735570](v7);
  v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Releasing vision session and transaction after period of inactivity", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  session = v9->_session;
  v9->_session = 0;

  transaction = v9->_transaction;
  v9->_transaction = 0;

  os_unfair_lock_unlock(p_lock);
  objc_autoreleasePoolPop(v5);

}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (HMFOSTransaction)transaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
