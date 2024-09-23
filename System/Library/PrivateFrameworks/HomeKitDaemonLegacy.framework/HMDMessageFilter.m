@implementation HMDMessageFilter

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDMessageFilter)initWithName:(id)a3
{
  id v4;
  HMDMessageFilter *v5;
  uint64_t v6;
  NSString *name;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDMessageFilter;
  v5 = -[HMDMessageFilter init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.msgfltr"), v4);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  return 1;
}

- (BOOL)shouldCloudSyncData
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_83022 != -1)
    dispatch_once(&logCategory__hmf_once_t0_83022, &__block_literal_global_83023);
  return (id)logCategory__hmf_once_v1_83024;
}

void __31__HMDMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_83024;
  logCategory__hmf_once_v1_83024 = v0;

}

@end
