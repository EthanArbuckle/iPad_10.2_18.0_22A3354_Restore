@implementation HMMUptimeProvider

+ (HMMUptimeProvider)sharedInstance
{
  if (sharedInstance__hmf_once_t0 != -1)
    dispatch_once(&sharedInstance__hmf_once_t0, &__block_literal_global_84);
  return (HMMUptimeProvider *)(id)sharedInstance__hmf_once_v1;
}

void __35__HMMUptimeProvider_sharedInstance__block_invoke()
{
  HMMUptimeProvider *v0;
  void *v1;

  v0 = objc_alloc_init(HMMUptimeProvider);
  v1 = (void *)sharedInstance__hmf_once_v1;
  sharedInstance__hmf_once_v1 = (uint64_t)v0;

}

@end
