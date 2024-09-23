@implementation HMMutableMediaGroup

- (id)copyWithZone:(_NSZone *)a3
{
  HMMediaGroup *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  HMMediaGroup *v11;

  v4 = [HMMediaGroup alloc];
  -[HMMediaGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMediaGroup isDefaultName](self, "isDefaultName");
  -[HMMediaGroup destinationUniqueIdentifiers](self, "destinationUniqueIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroup associatedGroupIdentifier](self, "associatedGroupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMMediaGroup initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:](v4, "initWithIdentifier:parentIdentifier:name:defaultName:destinationIdentifiers:associatedGroupIdentifier:", v5, v6, v7, v8, v9, v10);

  return v11;
}

@end
