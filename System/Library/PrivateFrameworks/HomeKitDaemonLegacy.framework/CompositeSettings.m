@implementation CompositeSettings

void __CompositeSettings_Database_log_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(CFSTR("CompositeSettings_Database"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CompositeSettings_Database_log__hmf_once_v1;
  CompositeSettings_Database_log__hmf_once_v1 = v0;

}

@end
