@implementation CPSClusterManeuversCardView

+ (id)createPlatterView
{
  CPSCardPlatterView *v2;

  v2 = [CPSCardPlatterView alloc];
  return -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:](v2, "initWithFrame:cornerRadius:maskedCorners:", 15, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), 12.0);
}

+ (id)maneuverViewWithManeuver:(id)a3
{
  CPSClusterPrimaryManeuverView *v3;
  CPSClusterPrimaryManeuverView *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [CPSClusterPrimaryManeuverView alloc];
  v5 = -[CPSPrimaryManeuverView initWithManeuver:](v3, "initWithManeuver:", location[0]);
  objc_storeStrong(location, 0);
  return v5;
}

@end
