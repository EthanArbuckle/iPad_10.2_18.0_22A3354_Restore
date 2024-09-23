@implementation HMMStateData

- (HMMStateData)initWithName:(id)a3 enterTime:(unint64_t)a4 enterData:(id)a5
{
  id v9;
  id v10;
  HMMStateData *v11;
  HMMStateData *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMMStateData;
  v11 = -[HMMStateData init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_open = 1;
    v12->_enterTime = a4;
    objc_storeStrong((id *)&v12->_enterData, a5);
  }

  return v12;
}

- (void)exitTime:(unint64_t)a3 exitData:(id)a4
{
  -[HMMStateData _exitTime:exitData:](self, "_exitTime:exitData:", a3, a4);
  self->_cleanClose = 1;
}

- (void)_exitTime:(unint64_t)a3 exitData:(id)a4
{
  id v7;
  void *v8;
  HMMStateData *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMStateData *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[HMMStateData isOpen](self, "isOpen"))
  {
    self->_open = 0;
    if (-[HMMStateData enterTime](self, "enterTime") <= a3)
    {
      self->_duration = a3 - -[HMMStateData enterTime](self, "enterTime");
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17B78FC]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMStateData name](v9, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v11;
        v20 = 2114;
        v21 = v12;
        _os_log_impl(&dword_1CD029000, v10, OS_LOG_TYPE_ERROR, "%{public}@Metrics state %{public}@ exit time less than enter time", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
    objc_storeStrong((id *)&self->_exitData, a4);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17B78FC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMStateData name](v14, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1CD029000, v15, OS_LOG_TYPE_ERROR, "%{public}@Metrics state %{public}@ was already exited", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)forceExit:(unint64_t)a3
{
  -[HMMStateData _exitTime:exitData:](self, "_exitTime:exitData:", a3, 0);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (BOOL)cleanClose
{
  return self->_cleanClose;
}

- (NSDictionary)enterData
{
  return self->_enterData;
}

- (NSDictionary)exitData
{
  return self->_exitData;
}

- (unint64_t)enterTime
{
  return self->_enterTime;
}

- (void)setEnterTime:(unint64_t)a3
{
  self->_enterTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitData, 0);
  objc_storeStrong((id *)&self->_enterData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
