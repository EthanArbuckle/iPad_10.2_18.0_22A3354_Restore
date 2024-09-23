@implementation HMFLocationManagerOperation

void __44____HMFLocationManagerOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Location.Authorization.Operation"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED013018;
  qword_1ED013018 = v0;

}

@end
