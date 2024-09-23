@implementation HMFLocationAuthorizationMarkOperation

void __54____HMFLocationAuthorizationMarkOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Location.Authorization.Mark"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0130B8;
  qword_1ED0130B8 = v0;

}

@end
