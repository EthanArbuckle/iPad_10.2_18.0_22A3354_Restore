@implementation HMBFutureOperation

- (HMBFutureOperation)initWithBlock:(id)a3
{
  id v4;
  HMBFutureOperation *v5;
  uint64_t v6;
  id block;
  NAFuture *v8;
  NAFuture *future;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBFutureOperation;
  v5 = -[HMFOperation initWithTimeout:](&v11, sel_initWithTimeout_, 0.0);
  if (v5)
  {
    v6 = MEMORY[0x1D17B63A4](v4);
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    future = v5->_future;
    v5->_future = v8;

  }
  return v5;
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMBFutureOperation;
  v4 = a3;
  -[HMFOperation cancelWithError:](&v6, sel_cancelWithError_, v4);
  -[HMBFutureOperation future](self, "future", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithError:", v4);

}

- (void)main
{
  void (**v3)(void);
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  -[HMBFutureOperation block](self, "block");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __26__HMBFutureOperation_main__block_invoke;
  v9[3] = &unk_1E8932758;
  v9[4] = self;
  v6 = (id)objc_msgSend(v4, "addSuccessBlock:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __26__HMBFutureOperation_main__block_invoke_2;
  v8[3] = &unk_1E89327A8;
  v8[4] = self;
  v7 = (id)objc_msgSend(v4, "addFailureBlock:", v8);

}

- (id)block
{
  return objc_getProperty(self, a2, 312, 1);
}

- (NAFuture)future
{
  return (NAFuture *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong(&self->_block, 0);
}

void __26__HMBFutureOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "finish");
  objc_msgSend(*(id *)(a1 + 32), "future");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v4);

}

uint64_t __26__HMBFutureOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_3640 != -1)
    dispatch_once(&logCategory__hmf_once_t0_3640, &__block_literal_global_3641);
  return (id)logCategory__hmf_once_v1_3642;
}

void __33__HMBFutureOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_3642;
  logCategory__hmf_once_v1_3642 = v0;

}

@end
