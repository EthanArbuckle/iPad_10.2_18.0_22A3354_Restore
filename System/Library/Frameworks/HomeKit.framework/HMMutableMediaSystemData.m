@implementation HMMutableMediaSystemData

- (id)copyWithZone:(_NSZone *)a3
{
  HMMediaSystemData *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  HMMediaSystemData *v12;

  v4 = [HMMediaSystemData alloc];
  -[HMMediaGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMediaGroup isDefaultName](self, "isDefaultName");
  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemData leftDestinationIdentifier](self, "leftDestinationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemData rightDestinationIdentifier](self, "rightDestinationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMMediaSystemData initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:](v4, "initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

@end
