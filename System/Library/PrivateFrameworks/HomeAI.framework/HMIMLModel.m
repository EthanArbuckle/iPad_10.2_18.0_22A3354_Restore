@implementation HMIMLModel

- (HMIMLModel)initWithModelURL:(id)a3
{
  id v5;
  HMIMLModel *v6;
  HMIMLModel *v7;
  uint64_t v8;
  HMFTimer *watchdogTimer;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMIMLModel;
  v6 = -[HMIMLModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelURL, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 8, 30.0);
    watchdogTimer = v7->_watchdogTimer;
    v7->_watchdogTimer = (HMFTimer *)v8;

    -[HMFTimer setDelegate:](v7->_watchdogTimer, "setDelegate:", v7);
  }

  return v7;
}

- (MLModel)underlyingModel
{
  _BOOL4 v3;
  void *v4;

  v3 = -[HMIMLModel _ensureModelWithError:](self, "_ensureModelWithError:", 0);
  v4 = 0;
  if (v3)
  {
    -[HMIMLModel model](self, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MLModel *)v4;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;

  v6 = a3;
  if (-[HMIMLModel _ensureModelWithError:](self, "_ensureModelWithError:", a4))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMIMLModel model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predictionFromFeatures:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_ensureModelWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIMLModel model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMIMLModel watchdogTimer](self, "watchdogTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resume");

    v8 = 1;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "usesCPUOnly");

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v9, "setComputeUnits:", 0);
    }
    else
    {
      +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAllowBackgroundGPUCompute:", objc_msgSend(v12, "BOOLPreferenceForKey:defaultValue:", CFSTR("espressoLowPriority"), 1));

    }
    v13 = (void *)MEMORY[0x24BDBFFC8];
    -[HMIMLModel modelURL](self, "modelURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v13, "modelWithContentsOfURL:configuration:error:", v14, v9, &v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v26;
    -[HMIMLModel setModel:](self, "setModel:", v15);

    -[HMIMLModel model](self, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17 != 0;

    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("HMIMLModel"));
      -[HMIMLModel setTransaction:](self, "setTransaction:", v18);

      -[HMIMLModel watchdogTimer](self, "watchdogTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resume");
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      -[HMIMLModel modelURL](self, "modelURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to load model at path: %@"), v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1018, v19, v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (a3)
        *a3 = objc_retainAutorelease(v23);
      HMIErrorLog(self, v24);

    }
  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  void *v8;
  HMIMLModel *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[HMIMLModel modelURL](v9, "modelURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Unloading model at path %@ after period of inactivity", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIMLModel setModel:](v9, "setModel:", 0);
  -[HMIMLModel setTransaction:](v9, "setTransaction:", 0);
  os_unfair_lock_unlock(p_lock);
  objc_autoreleasePoolPop(v5);

}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (MLModel)model
{
  return (MLModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (HMFOSTransaction)transaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
