@implementation __HMActiveAssertion

- (__HMActiveAssertion)initWithName:(id)a3 context:(id)a4 messageTargetUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  __HMActiveAssertion *v12;
  __HMActiveAssertion *v13;
  uint64_t v14;
  NSUUID *messageTargetUUID;
  __HMActiveAssertion *result;
  __HMActiveAssertion *v17;
  SEL v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v17 = (__HMActiveAssertion *)_HMFPreconditionFailure();
    -[__HMActiveAssertion dealloc](v17, v18);
    return result;
  }
  v19.receiver = self;
  v19.super_class = (Class)__HMActiveAssertion;
  v12 = -[HMFAssertion initWithName:](&v19, sel_initWithName_, v8);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a4);
    v14 = objc_msgSend(v11, "copy");
    messageTargetUUID = v13->_messageTargetUUID;
    v13->_messageTargetUUID = (NSUUID *)v14;

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  __HMActiveAssertion *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  __HMActiveAssertion *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[HMFAssertion isValid](self, "isValid"))
  {
    v3 = (void *)MEMORY[0x1A1AC1AAC]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_FAULT, "%{public}@Active assertion unexpectedly deallocated: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
  v7.receiver = self;
  v7.super_class = (Class)__HMActiveAssertion;
  -[HMFAssertion dealloc](&v7, sel_dealloc);
}

- (BOOL)acquire:(id *)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)__HMActiveAssertion;
  -[HMFAssertion acquire:](&v10, sel_acquire_, a3);
  objc_initWeak(&location, self);
  -[__HMActiveAssertion context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpcClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31____HMActiveAssertion_acquire___block_invoke;
  v7[3] = &unk_1E3AB61D0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "registerReconnectionHandler:", v7);

  -[__HMActiveAssertion _setAssertionActive:](self, 1);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return 1;
}

- (void)invalidate
{
  objc_super v3;

  if (-[HMFAssertion isValid](self, "isValid"))
    -[__HMActiveAssertion _setAssertionActive:](self, 0);
  v3.receiver = self;
  v3.super_class = (Class)__HMActiveAssertion;
  -[HMFAssertion invalidate](&v3, sel_invalidate);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_setAssertionActive:(void *)a1
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  void *v17;
  id v18;
  char v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(a1, "messageTargetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithTarget:", v5);

    v20 = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HM.activeAssertion"), v6, v8);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __43____HMActiveAssertion__setAssertionActive___block_invoke;
    v16 = &unk_1E3AAE040;
    v17 = a1;
    v18 = v8;
    v19 = a2;
    v10 = v8;
    objc_msgSend(v9, "setResponseHandler:", &v13);
    objc_msgSend(a1, "context", v13, v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMessage:", v9);

  }
}

@end
