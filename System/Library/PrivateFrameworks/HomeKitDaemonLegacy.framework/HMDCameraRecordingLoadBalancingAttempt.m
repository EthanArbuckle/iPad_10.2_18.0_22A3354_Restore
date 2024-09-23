@implementation HMDCameraRecordingLoadBalancingAttempt

- (HMDCameraRecordingLoadBalancingAttempt)initWithLocalResponseTimeout:(double)a3 logIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  HMDCameraRecordingLoadBalancingAttempt *v9;

  v6 = (objc_class *)MEMORY[0x1E0D286C8];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithTimeInterval:options:", 2, a3);
  v9 = -[HMDCameraRecordingLoadBalancingAttempt initWithLocalResponseTimer:logIdentifier:](self, "initWithLocalResponseTimer:logIdentifier:", v8, v7);

  return v9;
}

- (HMDCameraRecordingLoadBalancingAttempt)initWithLocalResponseTimer:(id)a3 logIdentifier:(id)a4
{
  id v7;
  id v8;
  HMDCameraRecordingLoadBalancingAttempt *v9;
  HMDCameraRecordingLoadBalancingAttempt *v10;
  uint64_t v11;
  NSString *logIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraRecordingLoadBalancingAttempt;
  v9 = -[HMDCameraRecordingLoadBalancingAttempt init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localResponseTimer, a3);
    v11 = objc_msgSend(v8, "copy");
    logIdentifier = v10->_logIdentifier;
    v10->_logIdentifier = (NSString *)v11;

  }
  return v10;
}

- (void)startWithMessage:(id)a3 messageDispatcher:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCameraRecordingLoadBalancingAttempt *v15;
  SEL v16;
  id v17;
  _QWORD v18[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v9)
  {
LABEL_7:
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  -[HMDCameraRecordingLoadBalancingAttempt completion](self, "completion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[HMDCameraRecordingLoadBalancingAttempt setCompletion:](self, "setCompletion:", v11);
    -[HMDCameraRecordingLoadBalancingAttempt localResponseTimer](self, "localResponseTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[HMDCameraRecordingLoadBalancingAttempt localResponseTimer](self, "localResponseTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__HMDCameraRecordingLoadBalancingAttempt_startWithMessage_messageDispatcher_completion___block_invoke;
    v18[3] = &unk_1E89C0E20;
    v18[4] = self;
    objc_msgSend(v8, "setResponseHandler:", v18);
    objc_msgSend(v9, "sendMessage:", v8);

    return;
  }
LABEL_9:
  v15 = (HMDCameraRecordingLoadBalancingAttempt *)_HMFPreconditionFailure();
  -[HMDCameraRecordingLoadBalancingAttempt timerDidFire:](v15, v16, v17);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  HMDCameraRecordingLoadBalancingAttempt *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraRecordingLoadBalancingAttempt localResponseTimer](self, "localResponseTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    os_unfair_lock_lock_with_options();
    -[HMDCameraRecordingLoadBalancingAttempt completion](self, "completion");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingLoadBalancingAttempt setCompletion:](self, "setCompletion:", 0);
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for load balancing message response", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 8, CFSTR("Timed out waiting for load balancing message response"), 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v11);

    }
  }

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMFTimer)localResponseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_localResponseTimer, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __88__HMDCameraRecordingLoadBalancingAttempt_startWithMessage_messageDispatcher_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  os_unfair_lock_s *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCompletion:", 0);
  os_unfair_lock_unlock(v6);
  if (v7)
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_67145 != -1)
    dispatch_once(&logCategory__hmf_once_t1_67145, &__block_literal_global_67146);
  return (id)logCategory__hmf_once_v2_67147;
}

void __53__HMDCameraRecordingLoadBalancingAttempt_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_67147;
  logCategory__hmf_once_v2_67147 = v0;

}

@end
