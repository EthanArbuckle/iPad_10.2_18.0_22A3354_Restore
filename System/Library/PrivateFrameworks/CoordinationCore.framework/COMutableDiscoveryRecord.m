@implementation COMutableDiscoveryRecord

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CODiscoveryRecord initWithDiscoveryRecord:]([CODiscoveryRecord alloc], "initWithDiscoveryRecord:", self);
}

- (void)addDestinationsFromDiscoveryRecord:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CODiscoveryRecord constituent](self, "constituent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constituent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[CODiscoveryRecord destinations](self, "destinations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v10, "destinations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionOrderedSet:", v9);

    -[CODiscoveryRecord setDestinations:](self, "setDestinations:", v8);
  }

}

- (void)rollConstituent:(id)a3
{
  if (a3)
    -[CODiscoveryRecord setConstituent:](self, "setConstituent:");
}

@end
