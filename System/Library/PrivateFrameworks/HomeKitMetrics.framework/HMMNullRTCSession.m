@implementation HMMNullRTCSession

- (HMMNullRTCSession)initWithUUID:(id)a3 serviceName:(id)a4
{
  id v7;
  id v8;
  HMMNullRTCSession *v9;
  HMMNullRTCSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMNullRTCSession;
  v9 = -[HMMNullRTCSession init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_serviceName, a4);
  }

  return v10;
}

- (HMMRTCSessionVoucher)voucher
{
  HMMRTCSessionVoucher *v3;
  void *v4;
  void *v5;
  HMMRTCSessionVoucher *v6;

  v3 = [HMMRTCSessionVoucher alloc];
  -[HMMNullRTCSession uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMNullRTCSession serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMMRTCSessionVoucher initWithUUID:serviceName:](v3, "initWithUUID:serviceName:", v4, v5);

  return v6;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1)
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_1544);
  return (id)logCategory__hmf_once_v1;
}

void __32__HMMNullRTCSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1;
  logCategory__hmf_once_v1 = v0;

}

@end
