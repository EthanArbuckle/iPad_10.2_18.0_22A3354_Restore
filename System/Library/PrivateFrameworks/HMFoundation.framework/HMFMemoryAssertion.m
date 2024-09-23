@implementation HMFMemoryAssertion

- (void)mark
{
  void *v3;
  char v4;
  void *v5;
  HMFMemoryAssertion *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HMFMemoryAssertion;
  -[HMFAssertion mark](&v11, sel_mark);
  -[HMFMemoryAssertion internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_transaction_needs_more_time();

  v5 = (void *)MEMORY[0x1A1AC355C]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if ((v4 & 1) != 0)
  {
    if (v8)
    {
      HMFGetLogIdentifier(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      v10 = "%{public}@Successfully marked";
LABEL_6:
      _os_log_impl(&dword_19B546000, v7, OS_LOG_TYPE_DEBUG, v10, buf, 0xCu);

    }
  }
  else if (v8)
  {
    HMFGetLogIdentifier(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    v10 = "%{public}@Failed to mark";
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
}

- (OS_os_transaction)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMFMemoryAssertion;
  -[HMFAssertion invalidate](&v3, sel_invalidate);
  -[HMFMemoryAssertion setInternal:](self, "setInternal:", 0);
}

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (HMFMemoryAssertion)initWithName:(id)a3
{
  HMFMemoryAssertion *v3;
  HMFMemoryAssertion *v4;
  id v5;
  uint64_t v6;
  OS_os_transaction *internal;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMFMemoryAssertion;
  v3 = -[HMFAssertion initWithName:](&v9, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    -[HMFAssertion uniqueDescription](v3, "uniqueDescription");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "UTF8String");
    v6 = os_transaction_create();
    internal = v4->_internal;
    v4->_internal = (OS_os_transaction *)v6;

  }
  return v4;
}

@end
