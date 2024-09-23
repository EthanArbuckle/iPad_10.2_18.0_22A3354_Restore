@implementation HMDMutableMediaGroupsAggregateData

- (id)copyWithZone:(_NSZone *)a3
{
  HMDMediaGroupsAggregateData *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaGroupsAggregateData *v8;

  v4 = [HMDMediaGroupsAggregateData alloc];
  -[HMDMediaGroupsAggregateData destinations](self, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateData destinationControllersData](self, "destinationControllersData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateData groups](self, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:](v4, "initWithDestinations:destinationControllersData:groups:", v5, v6, v7);

  return v8;
}

@end
