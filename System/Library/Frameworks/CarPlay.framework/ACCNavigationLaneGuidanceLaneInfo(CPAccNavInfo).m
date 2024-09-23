@implementation ACCNavigationLaneGuidanceLaneInfo(CPAccNavInfo)

- (uint64_t)initWithLane:()CPAccNavInfo component:
{
  uint64_t v5;

  +[CPAccNavUpdate accNavInfoWithUpdate:component:customValueBlock:](CPAccNavUpdate, "accNavInfoWithUpdate:component:customValueBlock:", a3, a4, &__block_literal_global_17);
  v5 = objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
