@implementation Siri

void __Siri_log_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(CFSTR("Siri"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)Siri_log__hmf_once_v1;
  Siri_log__hmf_once_v1 = v0;

}

@end
