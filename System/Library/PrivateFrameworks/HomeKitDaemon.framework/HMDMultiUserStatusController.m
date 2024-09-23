@implementation HMDMultiUserStatusController

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)multiUserState
{
  os_unfair_lock_s *p_lock;
  int64_t multiUserState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  multiUserState = self->_multiUserState;
  os_unfair_lock_unlock(p_lock);
  return multiUserState;
}

- (HMDMultiUserStatusController)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HMDMultiUserStatusController *v9;
  HMDMultiUserStatusController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMultiUserStatusController;
  v9 = -[HMDMultiUserStatusController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v10->_multiUserState = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)setMultiUserState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_multiUserState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)didUpdateDataSyncState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  HMDMultiUserStatusController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDMultiUserStatusController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDMultiUserStatusController dataSyncState](self, "dataSyncState") != a3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMHomeManagerDataSyncStateToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Changed data sync state to %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDMultiUserStatusController setDataSyncState:](v7, "setDataSyncState:", a3);
    -[HMDMultiUserStatusController _recalculateState]((uint64_t)v7);
  }
}

- (void)didChangeHasActiveAccountState:(BOOL)a3
{
  unsigned int v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  HMDMultiUserStatusController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDMultiUserStatusController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDMultiUserStatusController haveActiveSignedInAccount](self, "haveActiveSignedInAccount") != v3)
  {
    v6 = v3;
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Changed account state to %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDMultiUserStatusController setHaveActiveSignedInAccount:](v8, "setHaveActiveSignedInAccount:", v6);
    if (v8)
    {
      -[HMDMultiUserStatusController queue](v8, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v12);

      if (-[HMDMultiUserStatusController _recalculateState]((uint64_t)v8))
      {
        -[HMDMultiUserStatusController delegate](v8, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "multiUserStatusController:statusDidChange:", v8, -[HMDMultiUserStatusController multiUserState](v8, "multiUserState"));

      }
    }
  }
}

- (HMDMultiUserStatusControllerDelegate)delegate
{
  return (HMDMultiUserStatusControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)haveActiveSignedInAccount
{
  return self->_haveActiveSignedInAccount;
}

- (void)setHaveActiveSignedInAccount:(unint64_t)a3
{
  self->_haveActiveSignedInAccount = a3;
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (void)setDataSyncState:(unint64_t)a3
{
  self->_dataSyncState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (uint64_t)_recalculateState
{
  void *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = (void *)result;
    objc_msgSend((id)result, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(v1, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    objc_msgSend(v1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = objc_msgSend(v1, "dataSyncState") == 1;
    if (objc_msgSend(v1, "multiUserState") == v5)
    {
      return 0;
    }
    else
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = v1;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Multi-User state updated to %@", (uint8_t *)&v11, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(v7, "setMultiUserState:", v5);
      return 1;
    }
  }
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_229272 != -1)
    dispatch_once(&logCategory__hmf_once_t0_229272, &__block_literal_global_229273);
  return (id)logCategory__hmf_once_v1_229274;
}

void __43__HMDMultiUserStatusController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_229274;
  logCategory__hmf_once_v1_229274 = v0;

}

@end
