@implementation HMBMutableCloudZoneConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HMBCloudZoneConfiguration *v4;

  v4 = -[HMBCloudZoneConfiguration init](+[HMBCloudZoneConfiguration allocWithZone:](HMBCloudZoneConfiguration, "allocWithZone:", a3), "init");
  -[HMBCloudZoneConfiguration setShouldRebuildOnManateeKeyLoss:](v4, "setShouldRebuildOnManateeKeyLoss:", -[HMBCloudZoneConfiguration shouldRebuildOnManateeKeyLoss](self, "shouldRebuildOnManateeKeyLoss"));
  -[HMBCloudZoneConfiguration setShouldSkipCloudPulls:](v4, "setShouldSkipCloudPulls:", -[HMBCloudZoneConfiguration shouldSkipCloudPulls](self, "shouldSkipCloudPulls"));
  return v4;
}

@end
