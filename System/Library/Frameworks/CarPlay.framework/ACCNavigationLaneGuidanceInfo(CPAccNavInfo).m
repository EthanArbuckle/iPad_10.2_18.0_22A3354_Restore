@implementation ACCNavigationLaneGuidanceInfo(CPAccNavInfo)

- (uint64_t)initWithLaneGuidance:()CPAccNavInfo component:
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__ACCNavigationLaneGuidanceInfo_CPAccNavInfo__initWithLaneGuidance_component___block_invoke;
  v12[3] = &unk_24C77DC68;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  +[CPAccNavUpdate accNavInfoWithUpdate:component:customValueBlock:](CPAccNavUpdate, "accNavInfoWithUpdate:component:customValueBlock:", v9, v8, v12);
  v10 = objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
