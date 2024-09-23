@implementation HMDUserCloudShareManagerCreatorDependency

- (HMDUserCloudShareManagerCreatorDependency)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDUserCloudShareManagerCreatorDependency;
  return -[HMDUserCloudShareManagerCreatorDependency init](&v3, sel_init);
}

- (id)createUserCloudShareControllerWithDelegate:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  HMDUserCloudShareController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDUserCloudShareController initWithDelegate:queue:pendingRequestTimeoutInterval:]([HMDUserCloudShareController alloc], "initWithDelegate:queue:pendingRequestTimeoutInterval:", v6, v5, 30.0);

  return v7;
}

@end
