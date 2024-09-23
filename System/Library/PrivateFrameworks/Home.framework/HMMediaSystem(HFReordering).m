@implementation HMMediaSystem(HFReordering)

- (HFServiceNameComponents)hf_serviceNameComponents
{
  void *v2;
  HFServiceNameComponents *v3;
  void *v4;
  void *v5;
  void *v6;
  HFServiceNameComponents *v7;

  +[HFNamingComponents namingComponentFromMediaSystem:](HFNamingComponents, "namingComponentFromMediaSystem:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [HFServiceNameComponents alloc];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_parentRoom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:](v3, "initWithRawServiceName:rawRoomName:", v4, v6);

  return v7;
}

@end
