@implementation HMSymptomFixSession

- (HMSymptomFixSession)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMSymptomFixSession)initWithSymptom:(id)a3 deviceIdentifier:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMSymptomFixSession *v12;
  HMSymptomFixSession *v13;
  uint64_t v14;
  NSString *logIdentifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMSymptomFixSession;
  v12 = -[HMSymptomFixSession init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_symptom, a3);
    objc_storeStrong((id *)&v13->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v13->_context, a5);
    v13->_state = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v13->_symptom, v13->_deviceIdentifier);
    v14 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v13->_logIdentifier;
    v13->_logIdentifier = (NSString *)v14;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[SFDeviceRepairSession invalidate](self->_deviceRepairSession, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HMSymptomFixSession;
  -[HMSymptomFixSession dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  HMSymptomFixSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  HMSymptomFixSession *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[HMSymptomFixSession state](self, "state") != a3)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v8;
      v17 = 2048;
      v18 = -[HMSymptomFixSession state](v6, "state");
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating state from %ld to %ld", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    os_unfair_lock_lock_with_options();
    v6->_state = a3;
    os_unfair_lock_unlock(&v6->_lock);
    -[HMSymptomFixSession delegate](v6, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMSymptomFixSession context](v6, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegateCaller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __32__HMSymptomFixSession_setState___block_invoke;
      v12[3] = &unk_1E3AB5ED8;
      v13 = v9;
      v14 = v6;
      objc_msgSend(v11, "invokeBlock:", v12);

    }
  }
}

- (HMSymptomFixSessionDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMSymptomFixSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSError)error
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_error;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setError:(id)a3
{
  NSError *v4;
  NSError *error;

  v4 = (NSError *)a3;
  os_unfair_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_lock_unlock(&self->_lock);
  -[HMSymptomFixSession _updateState](self, "_updateState");
}

- (SFDeviceRepairSession)deviceRepairSession
{
  os_unfair_lock_s *p_lock;
  SFDeviceRepairSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deviceRepairSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeviceRepairSession:(id)a3
{
  SFDeviceRepairSession *v4;
  SFDeviceRepairSession *deviceRepairSession;

  v4 = (SFDeviceRepairSession *)a3;
  os_unfair_lock_lock_with_options();
  deviceRepairSession = self->_deviceRepairSession;
  self->_deviceRepairSession = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isDeviceRepairSessionFinished
{
  HMSymptomFixSession *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_deviceRepairSessionFinished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDeviceRepairSessionFinished:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_deviceRepairSessionFinished = a3;
  os_unfair_lock_unlock(p_lock);
  -[HMSymptomFixSession _updateState](self, "_updateState");
}

- (unsigned)deviceRepairFlags
{
  HMSymptomFixSession *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_deviceRepairFlags;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setDeviceRepairFlags:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_deviceRepairFlags = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasSymptomDisappeared
{
  HMSymptomFixSession *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasSymptomDisappeared;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasSymptomDisappeared:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasSymptomDisappeared = a3;
  os_unfair_lock_unlock(p_lock);
  -[HMSymptomFixSession _updateState](self, "_updateState");
}

- (HMFTimer)symptomDisappearanceTimer
{
  os_unfair_lock_s *p_lock;
  HMFTimer *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_symptomDisappearanceTimer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSymptomDisappearanceTimer:(id)a3
{
  HMFTimer *v4;
  HMFTimer *symptomDisappearanceTimer;

  v4 = (HMFTimer *)a3;
  os_unfair_lock_lock_with_options();
  symptomDisappearanceTimer = self->_symptomDisappearanceTimer;
  self->_symptomDisappearanceTimer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)start
{
  void *v3;
  HMSymptomFixSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HMSymptomFixSession *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  id *p_location;
  uint64_t v34;
  uint64_t v35;
  _BYTE buf[24];
  void *v37;
  _BYTE v38[10];
  __int16 v39;
  void *v40;
  __int16 v41;
  unsigned int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[HMSymptomFixSession state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Cannot start a session that has already been started"), 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to start symptom fix session", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend((id)objc_opt_class(), "_createDeviceRepairSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSymptomFixSession setDeviceRepairSession:](v4, "setDeviceRepairSession:", v7);

  location = 0;
  p_location = &location;
  v34 = 0x2050000000;
  v8 = (id)getSFDeviceClass_softClass;
  v35 = getSFDeviceClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getSFDeviceClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getSFDeviceClass_block_invoke;
    v37 = &unk_1E3AB4620;
    *(_QWORD *)v38 = &location;
    __getSFDeviceClass_block_invoke((uint64_t)buf);
    v8 = p_location[3];
  }
  v10 = (objc_class *)objc_retainAutorelease(v8);
  _Block_object_dispose(&location, 8);
  v11 = objc_alloc_init(v10);
  -[HMSymptomFixSession deviceIdentifier](v4, "deviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v12);

  -[HMSymptomFixSession deviceRepairSession](v4, "deviceRepairSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPeerDevice:", v11);

  -[HMSymptomFixSession presentingViewController](v4, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSymptomFixSession deviceRepairSession](v4, "deviceRepairSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPresentingViewController:", v14);

  v16 = -[HMSymptomFixSession deviceRepairFlags](v4, "deviceRepairFlags");
  -[HMSymptomFixSession deviceRepairSession](v4, "deviceRepairSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRepairFlags:", v16);

  objc_initWeak(&location, v4);
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __28__HMSymptomFixSession_start__block_invoke;
  v30[3] = &unk_1E3AB3678;
  objc_copyWeak(&v31, &location);
  -[HMSymptomFixSession deviceRepairSession](v4, "deviceRepairSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProgressHandler:", v30);

  v19 = (void *)MEMORY[0x1A1AC1AAC]();
  v20 = v4;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[HMSymptomFixSession deviceRepairSession](v20, "deviceRepairSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSymptomFixSession symptom](v20, "symptom");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSymptomFixSession deviceIdentifier](v20, "deviceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSymptomFixSession presentingViewController](v20, "presentingViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HMSymptomFixSession deviceRepairFlags](v20, "deviceRepairFlags");
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    v37 = v24;
    *(_WORD *)v38 = 2112;
    *(_QWORD *)&v38[2] = v25;
    v39 = 2112;
    v40 = v26;
    v41 = 1024;
    v42 = v27;
    _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Activating SFDeviceRepairSession %@ for symptom %@ with deviceIdentifier: %@ presentingViewController: %@ repairFlags: %d", buf, 0x3Au);

  }
  objc_autoreleasePoolPop(v19);
  -[HMSymptomFixSession deviceRepairSession](v20, "deviceRepairSession");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activate");

  -[HMSymptomFixSession setState:](v20, "setState:", 1);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

- (void)stop
{
  void *v3;
  HMSymptomFixSession *v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HMSymptomFixSession *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to stop symptom fix session", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = -[HMSymptomFixSession state](v4, "state");
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = v4;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v13;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not stopping symptom fix session because it is already finished", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSymptomFixSession setError:](v4, "setError:", v8);

    -[HMSymptomFixSession deviceRepairSession](v4, "deviceRepairSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[HMSymptomFixSession setSymptomDisappearanceTimer:](v4, "setSymptomDisappearanceTimer:", 0);
  }
}

- (void)noteSymptomDisappeared
{
  void *v3;
  HMSymptomFixSession *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that symptom has disappeared", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMSymptomFixSession setHasSymptomDisappeared:](v4, "setHasSymptomDisappeared:", 1);
  -[HMSymptomFixSession setSymptomDisappearanceTimer:](v4, "setSymptomDisappearanceTimer:", 0);
}

- (void)_updateForDeviceSetupProgressEvent:(unsigned int)a3 error:(id)a4
{
  void *v6;

  -[HMSymptomFixSession setError:](self, "setError:", a4);
  if (a3 == 30 || a3 == 20)
  {
    -[HMSymptomFixSession setDeviceRepairSessionFinished:](self, "setDeviceRepairSessionFinished:", 1);
    -[HMSymptomFixSession error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[HMSymptomFixSession _startSymptomDisappearanceTimer](self, "_startSymptomDisappearanceTimer");
  }
}

- (void)_updateState
{
  void *v3;

  -[HMSymptomFixSession error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_3:
    -[HMSymptomFixSession setState:](self, "setState:", 2);
    return;
  }
  if (-[HMSymptomFixSession isDeviceRepairSessionFinished](self, "isDeviceRepairSessionFinished")
    && -[HMSymptomFixSession hasSymptomDisappeared](self, "hasSymptomDisappeared"))
  {
    goto LABEL_3;
  }
}

- (void)_startSymptomDisappearanceTimer
{
  void *v3;
  void *v4;
  HMSymptomFixSession *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_createSymptomDisappearanceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v3, "setDelegate:", self));
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting timer for symptom disappearance: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "resume");
  -[HMSymptomFixSession setSymptomDisappearanceTimer:](v5, "setSymptomDisappearanceTimer:", v3);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMSymptomFixSession *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSymptomFixSession symptomDisappearanceTimer](self, "symptomDisappearanceTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeInterval");
      v12 = 138543618;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Symptom still exists %fs after being fixed. Marking as finished with timeout error", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSymptomFixSession setError:](v7, "setError:", v11);

    -[HMSymptomFixSession setSymptomDisappearanceTimer:](v7, "setSymptomDisappearanceTimer:", 0);
  }

}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (_HMContext)context
{
  return self->_context;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (HMSymptom)symptom
{
  return self->_symptom;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_symptom, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_symptomDisappearanceTimer, 0);
  objc_storeStrong((id *)&self->_deviceRepairSession, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __28__HMSymptomFixSession_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if ((int)a2 > 299)
    {
      if ((int)a2 > 799)
      {
        if ((int)a2 <= 999)
        {
          switch((int)a2)
          {
            case 900:
              v12 = "SU-No-SetupScanAttempt";
              break;
            case 901:
              v12 = "SU-No-SetupStatusUpdate";
              break;
            case 902:
              v12 = "SU-No-SetupWipeWifi";
              break;
            case 903:
              v12 = "SU-No-SetupCancelled";
              break;
            case 904:
              v12 = "SU-No-SetupObliterate";
              break;
            case 905:
              v12 = "SU-No-SetupCannotCancel";
              break;
            case 906:
              v12 = "SysDrop AirDrop Event";
              break;
            case 907:
              v12 = "SysDrop Sysdiagnose Event";
              break;
            case 908:
              v12 = "SysDrop Cancel Event";
              break;
            case 909:
              v12 = "File Transfer Progress Event";
              break;
            case 910:
              v12 = "File Transfer Completed Event";
              break;
            case 911:
              v12 = "iOSWiFiSetup";
              break;
            case 912:
              v12 = "HKPrimaryResidentSSIDFetchStart";
              break;
            default:
              switch((int)a2)
              {
                case 800:
                  v12 = "AuthAccountsStart";
                  break;
                case 803:
                  v12 = "AuthAccountsiCloudProgress";
                  break;
                case 804:
                  v12 = "AuthAccountsStoreProgress";
                  break;
                case 805:
                  v12 = "AuthAccountsGameCenterProgress";
                  break;
                default:
                  goto LABEL_165;
              }
              break;
          }
          goto LABEL_172;
        }
        if ((int)a2 <= 1099)
        {
          if ((_DWORD)a2 == 1000)
          {
            v12 = "SecureIntentStart";
            goto LABEL_172;
          }
          if ((_DWORD)a2 == 1001)
          {
            v12 = "SecureIntentFinish";
            goto LABEL_172;
          }
          goto LABEL_165;
        }
        if ((_DWORD)a2 == 1100)
        {
          v12 = "OneTimeCodeDetected";
          goto LABEL_172;
        }
        if ((_DWORD)a2 == 2000)
        {
          v12 = "DependentStart";
          goto LABEL_172;
        }
        if ((_DWORD)a2 != 2001)
          goto LABEL_165;
        v12 = "DependentEnd";
      }
      else if ((int)a2 <= 519)
      {
        if ((int)a2 <= 410)
        {
          if ((int)a2 <= 399)
          {
            if ((_DWORD)a2 == 300)
            {
              v12 = "BackupProgress";
              goto LABEL_172;
            }
            if ((_DWORD)a2 == 310)
            {
              v12 = "SyncProgress";
              goto LABEL_172;
            }
            goto LABEL_165;
          }
          if ((_DWORD)a2 == 400)
          {
            v12 = "StopSetup";
            goto LABEL_172;
          }
          if ((_DWORD)a2 == 401)
          {
            v12 = "PINPair";
            goto LABEL_172;
          }
          if ((_DWORD)a2 != 410)
            goto LABEL_165;
          v12 = "MigrateStart";
        }
        else
        {
          if ((int)a2 > 430)
          {
            switch((_DWORD)a2)
            {
              case 0x1AF:
                v12 = "eSimExternal2FAStop";
                goto LABEL_172;
              case 0x1F4:
                v12 = "SiriWelcome";
                goto LABEL_172;
              case 0x1FE:
                v12 = "SiriDialogA";
                goto LABEL_172;
            }
            goto LABEL_165;
          }
          if ((_DWORD)a2 == 411)
          {
            v12 = "MigrateStop";
            goto LABEL_172;
          }
          if ((_DWORD)a2 == 420)
          {
            v12 = "FileTransferReady";
            goto LABEL_172;
          }
          if ((_DWORD)a2 != 430)
            goto LABEL_165;
          v12 = "eSimExternal2FAStart";
        }
      }
      else if ((int)a2 > 559)
      {
        if ((int)a2 > 599)
        {
          switch((_DWORD)a2)
          {
            case 0x258:
              v12 = "SiriSkipDemo";
              goto LABEL_172;
            case 0x2BC:
              v12 = "StopSetupLEDs";
              goto LABEL_172;
            case 0x2C6:
              v12 = "AudioPasscodeEnded";
              goto LABEL_172;
          }
          goto LABEL_165;
        }
        if ((_DWORD)a2 == 560)
        {
          v12 = "SiriDialogCMusic";
          goto LABEL_172;
        }
        if ((_DWORD)a2 == 570)
        {
          v12 = "SiriDialogCNews";
          goto LABEL_172;
        }
        if ((_DWORD)a2 != 580)
          goto LABEL_165;
        v12 = "SiriDialogCWeather";
      }
      else
      {
        if ((int)a2 > 549)
        {
          switch((_DWORD)a2)
          {
            case 0x226:
              v12 = "SiriDialogBWeather";
              goto LABEL_172;
            case 0x22B:
              v12 = "SiriDialogBClock";
              goto LABEL_172;
            case 0x22E:
              v12 = "SiriDialogBMusic";
              goto LABEL_172;
          }
          goto LABEL_165;
        }
        if ((_DWORD)a2 == 520)
        {
          v12 = "SiriDialogBStart";
          goto LABEL_172;
        }
        if ((_DWORD)a2 == 530)
        {
          v12 = "SiriDialogBHome";
          goto LABEL_172;
        }
        if ((_DWORD)a2 != 540)
          goto LABEL_165;
        v12 = "SiriDialogBNews";
      }
    }
    else if ((int)a2 > 129)
    {
      if ((int)a2 > 249)
      {
        switch((int)a2)
        {
          case 260:
            v12 = "TVLSStart";
            break;
          case 261:
          case 262:
          case 263:
          case 265:
          case 266:
          case 267:
          case 268:
          case 269:
          case 271:
          case 273:
          case 275:
            goto LABEL_165;
          case 264:
            v12 = "TVLSFinish";
            break;
          case 270:
            v12 = "TVLSEstimateStart";
            break;
          case 272:
            v12 = "TVLSEstimateFinal";
            break;
          case 274:
            v12 = "TVLSEstimateFailed";
            break;
          case 276:
            v12 = "TVLSTryAgain";
            break;
          case 277:
            v12 = "TVLSToneBegan";
            break;
          case 278:
            v12 = "TVLCalStart";
            break;
          case 279:
            v12 = "TVLCalStep";
            break;
          case 280:
            v12 = "TVLCalFailed";
            break;
          case 281:
            v12 = "TVLCalTryAgain";
            break;
          case 282:
            v12 = "TVLCalFinal";
            break;
          default:
            if ((_DWORD)a2 != 250)
              goto LABEL_165;
            v12 = "ReportSuccess";
            break;
        }
        goto LABEL_172;
      }
      if ((int)a2 > 219)
      {
        switch((int)a2)
        {
          case 230:
            v12 = "HomeKitStart";
            goto LABEL_172;
          case 231:
          case 232:
          case 233:
          case 235:
          case 237:
          case 238:
          case 239:
            goto LABEL_165;
          case 234:
            v12 = "HomeKitSetupStart";
            goto LABEL_172;
          case 236:
            v12 = "CDPSetupStart";
            goto LABEL_172;
          case 240:
            v12 = "BuddyStarting";
            goto LABEL_172;
          case 241:
            v12 = "BuddyProgress";
            goto LABEL_172;
          case 242:
            v12 = "BuddyFinished";
            goto LABEL_172;
          default:
            if ((_DWORD)a2 == 220)
            {
              v12 = "iCloudStart";
            }
            else
            {
              if ((_DWORD)a2 != 224)
                goto LABEL_165;
              v12 = "AppleIDSetupStart";
            }
            break;
        }
        goto LABEL_172;
      }
      if ((int)a2 <= 149)
      {
        if ((_DWORD)a2 == 130)
        {
          v12 = "WiFiPoweredOff";
          goto LABEL_172;
        }
        if ((_DWORD)a2 == 140)
        {
          v12 = "RecognizeVoice";
          goto LABEL_172;
        }
        goto LABEL_165;
      }
      if ((_DWORD)a2 == 150)
      {
        v12 = "SiriForEveryone";
        goto LABEL_172;
      }
      if ((_DWORD)a2 == 200)
      {
        v12 = "WiFiStart";
        goto LABEL_172;
      }
      if ((_DWORD)a2 != 210)
        goto LABEL_165;
      v12 = "ActivationStart";
    }
    else if ((int)a2 > 79)
    {
      if ((int)a2 <= 119)
      {
        switch((int)a2)
        {
          case 'P':
            v12 = "BasicConfigStart";
            break;
          case 'Z':
            v12 = "BasicConfigFinish";
            break;
          case '\\':
            v12 = "StepStart";
            break;
          case '^':
            v12 = "StepFinish";
            break;
          case '_':
            v12 = "PreFinish";
            break;
            v12 = "SetupFinished";
            break;
          case 'a':
            v12 = "SetupResumed";
            break;
          case 'b':
            v12 = "SetupSuspend";
            break;
          case 'c':
            v12 = "SetupPeerSWUpdate";
            break;
          case 'd':
            v12 = "Finished";
            break;
          default:
            goto LABEL_165;
        }
        goto LABEL_172;
      }
      if ((_DWORD)a2 == 120)
      {
        v12 = "CheckingiCloud";
        goto LABEL_172;
      }
      if ((_DWORD)a2 == 122)
      {
        v12 = "CheckingAppleMusic";
        goto LABEL_172;
      }
      if ((_DWORD)a2 != 124)
        goto LABEL_165;
      v12 = "CheckingAccount";
    }
    else
    {
      if ((int)a2 <= 49)
      {
        if ((int)a2 > 29)
        {
          switch((int)a2)
          {
            case 30:
              v12 = "Error";
              break;
            case 31:
              v12 = "SessionStarted";
              break;
            case 32:
              v12 = "SessionEnded";
              break;
            case 33:
              v12 = "SessionSecured";
              break;
            case 35:
              v12 = "ConnectStart";
              break;
            case 40:
              v12 = "PreAuthStart";
              break;
            default:
              goto LABEL_165;
          }
          goto LABEL_172;
        }
        switch((_DWORD)a2)
        {
          case 0:
            v12 = "Invalid";
            goto LABEL_172;
          case 0xA:
            v12 = "Start";
            goto LABEL_172;
          case 0x14:
            v12 = "Final";
            goto LABEL_172;
        }
LABEL_165:
        v12 = "?";
        goto LABEL_172;
      }
      if ((int)a2 > 64)
      {
        if ((_DWORD)a2 == 65)
        {
          v12 = "SecurityAPCLoopStart";
          goto LABEL_172;
        }
        if ((_DWORD)a2 == 70)
        {
          v12 = "SecurityFinish";
          goto LABEL_172;
        }
        goto LABEL_165;
      }
      if ((_DWORD)a2 == 50)
      {
        v12 = "PreAuthFinish";
        goto LABEL_172;
      }
      if ((_DWORD)a2 != 60)
        goto LABEL_165;
      v12 = "SecurityStart";
    }
LABEL_172:
    v14 = 138544130;
    v15 = v10;
    v16 = 2080;
    v17 = v12;
    v18 = 1024;
    v19 = a2;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received new device repair session progress event: %s (%d) and info: %@", (uint8_t *)&v14, 0x26u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateForDeviceSetupProgressEvent:error:", a2, v13);

}

uint64_t __32__HMSymptomFixSession_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fixSession:didChangeState:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "state"));
}

+ (id)_createDeviceRepairSession
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getSFDeviceRepairSessionClass_softClass;
  v9 = getSFDeviceRepairSessionClass_softClass;
  if (!getSFDeviceRepairSessionClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getSFDeviceRepairSessionClass_block_invoke;
    v5[3] = &unk_1E3AB4620;
    v5[4] = &v6;
    __getSFDeviceRepairSessionClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

+ (id)_createSymptomDisappearanceTimer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("symptomDisappearanceTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

  }
  else
  {
    v7 = 30.0;
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v7);
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_35956 != -1)
    dispatch_once(&logCategory__hmf_once_t24_35956, &__block_literal_global_35957);
  return (id)logCategory__hmf_once_v25_35958;
}

void __34__HMSymptomFixSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_35958;
  logCategory__hmf_once_v25_35958 = v0;

}

@end
