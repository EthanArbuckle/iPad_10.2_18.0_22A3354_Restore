@implementation HMMQueuingRTCBackendSession

- (HMMQueuingRTCBackendSession)initWithServiceName:(id)a3 sessionUUID:(id)a4 isRealtime:(BOOL)a5 submitter:(id)a6 timeSourceBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  double (**v16)(_QWORD);
  HMMQueuingRTCBackendSession *v17;
  HMMQueuingRTCBackendSession *v18;
  uint64_t v19;
  id timeSourceBlock;
  uint64_t v21;
  NSMutableArray *queuedEvents;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (double (**)(_QWORD))a7;
  v24.receiver = self;
  v24.super_class = (Class)HMMQueuingRTCBackendSession;
  v17 = -[HMMQueuingRTCBackendSession init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_serviceName, a3);
    objc_storeStrong((id *)&v18->_sessionUUID, a4);
    v18->_isRealtime = a5;
    objc_storeWeak((id *)&v18->_submitter, v15);
    v19 = MEMORY[0x1D17B7A7C](v16);
    timeSourceBlock = v18->_timeSourceBlock;
    v18->_timeSourceBlock = (id)v19;

    v18->_isOpen = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    queuedEvents = v18->_queuedEvents;
    v18->_queuedEvents = (NSMutableArray *)v21;

    v18->_lastEventTime = v16[2](v16);
  }

  return v18;
}

- (BOOL)sendMessage:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_isOpen)
  {
    -[NSMutableArray addObject:](self->_queuedEvents, "addObject:", v4);
    self->_lastEventTime = (*((double (**)(void))self->_timeSourceBlock + 2))();
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (double)lastEventTime
{
  os_unfair_lock_s *p_lock;
  double lastEventTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  lastEventTime = self->_lastEventTime;
  os_unfair_lock_unlock(p_lock);
  return lastEventTime;
}

- (void)close
{
  os_unfair_lock_s *p_lock;
  _BOOL4 isOpen;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  isOpen = self->_isOpen;
  self->_isOpen = 0;
  os_unfair_lock_unlock(p_lock);
  if (isOpen)
  {
    if (-[NSMutableArray count](self->_queuedEvents, "count"))
    {
      -[HMMQueuingRTCBackendSession submitter](self, "submitter");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)-[NSMutableArray copy](self->_queuedEvents, "copy");
      -[HMMQueuingRTCBackendSession serviceName](self, "serviceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMQueuingRTCBackendSession sessionUUID](self, "sessionUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "submitMessages:serviceName:sessionUUID:isRealtime:", v5, v6, v7, -[HMMQueuingRTCBackendSession isRealtime](self, "isRealtime"));

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[HMMQueuingRTCBackendSession close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)HMMQueuingRTCBackendSession;
  -[HMMQueuingRTCBackendSession dealloc](&v3, sel_dealloc);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (BOOL)isRealtime
{
  return self->_isRealtime;
}

- (_HMMLogBackendSubmitterDelegate)submitter
{
  return (_HMMLogBackendSubmitterDelegate *)objc_loadWeakRetained((id *)&self->_submitter);
}

- (id)timeSourceBlock
{
  return self->_timeSourceBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeSourceBlock, 0);
  objc_destroyWeak((id *)&self->_submitter);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queuedEvents, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1)
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_284);
  return (id)logCategory__hmf_once_v4;
}

void __42__HMMQueuingRTCBackendSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4;
  logCategory__hmf_once_v4 = v0;

}

@end
