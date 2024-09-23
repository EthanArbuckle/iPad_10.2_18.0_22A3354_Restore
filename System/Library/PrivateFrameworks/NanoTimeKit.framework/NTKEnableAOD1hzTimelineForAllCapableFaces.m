@implementation NTKEnableAOD1hzTimelineForAllCapableFaces

void __NTKEnableAOD1hzTimelineForAllCapableFaces_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (CLKInternalBuild() && NTKEnableAOD1hzTimeline(v2))
    NTKEnableAOD1hzTimelineForAllCapableFaces_allowExtendedSupport = _os_feature_enabled_impl();

}

@end
