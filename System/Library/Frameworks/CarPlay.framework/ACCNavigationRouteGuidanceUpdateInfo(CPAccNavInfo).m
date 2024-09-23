@implementation ACCNavigationRouteGuidanceUpdateInfo(CPAccNavInfo)

- (uint64_t)initWithRouteGuidance:()CPAccNavInfo component:
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
  v12[2] = __86__ACCNavigationRouteGuidanceUpdateInfo_CPAccNavInfo__initWithRouteGuidance_component___block_invoke;
  v12[3] = &unk_24C77DC68;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  +[CPAccNavUpdate accNavInfoWithUpdate:component:customValueBlock:](CPAccNavUpdate, "accNavInfoWithUpdate:component:customValueBlock:", v8, v9, v12);
  v10 = objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
