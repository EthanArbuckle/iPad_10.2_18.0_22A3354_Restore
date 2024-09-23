@implementation HMFCFHTTPServer

void __31___HMFCFHTTPServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("Networking.HTTP.Server.Internal"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012E48;
  qword_1ED012E48 = v0;

}

@end
