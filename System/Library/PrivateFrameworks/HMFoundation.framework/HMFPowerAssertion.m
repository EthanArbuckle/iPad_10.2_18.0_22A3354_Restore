@implementation HMFPowerAssertion

- (HMFPowerAssertion)initWithName:(id)a3
{
  id v4;
  HMFPowerAssertion *v5;
  HMFPowerAssertion *v6;
  IOReturn v7;
  IOReturn v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMFPowerAssertion *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMFPowerAssertion;
  v5 = -[HMFAssertion initWithName:](&v14, sel_initWithName_, v4);
  v6 = v5;
  if (v5
    && (v7 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), (CFStringRef)-[HMFAssertion uniqueDescription](v5, "uniqueDescription"), 0, 0, 0, 0.0, 0, &v5->_identifier)) != 0)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to create assertion with error: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v12 = 0;
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

- (HMFPowerAssertion)initWithName:(id)a3 timeout:(double)a4
{
  id v6;
  HMFPowerAssertion *v7;
  HMFPowerAssertion *v8;
  IOReturn v9;
  IOReturn v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMFPowerAssertion *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMFPowerAssertion;
  v7 = -[HMFAssertion initWithName:](&v16, sel_initWithName_, v6);
  v8 = v7;
  if (v7
    && (v9 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), (CFStringRef)-[HMFAssertion uniqueDescription](v7, "uniqueDescription"), 0, 0, 0, a4, CFSTR("TimeoutActionTurnOff"), &v7->_identifier)) != 0)
  {
    v10 = v9;
    v11 = (void *)MEMORY[0x1A1AC355C]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier(0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_19B546000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to create assertion with error: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v14 = 0;
  }
  else
  {
    v14 = v8;
  }

  return v14;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMFPowerAssertion;
  -[HMFAssertion invalidate](&v3, sel_invalidate);
  -[HMFPowerAssertion _cleanUpPowerAssertion](self, "_cleanUpPowerAssertion");
}

- (void)_cleanUpPowerAssertion
{
  if (-[HMFPowerAssertion identifier](self, "identifier"))
  {
    IOPMAssertionRelease(-[HMFPowerAssertion identifier](self, "identifier"));
    -[HMFPowerAssertion setIdentifier:](self, "setIdentifier:", 0);
  }
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

@end
