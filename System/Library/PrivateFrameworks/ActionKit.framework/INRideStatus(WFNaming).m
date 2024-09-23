@implementation INRideStatus(WFNaming)

- (id)wfName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "rideOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "driver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vehicle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wfName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
