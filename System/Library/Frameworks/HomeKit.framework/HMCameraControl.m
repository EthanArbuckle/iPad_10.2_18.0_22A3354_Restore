@implementation HMCameraControl

- (HMCameraControl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraControl;
  return -[HMCameraControl init](&v3, sel_init);
}

void __31___HMCameraControl_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_27263;
  logCategory__hmf_once_v1_27263 = v0;

}

@end
