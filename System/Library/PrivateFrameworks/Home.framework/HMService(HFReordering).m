@implementation HMService(HFReordering)

- (id)hf_displayName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_serviceNameComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "composedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  HFServiceNameComponents *v6;
  void *v7;
  void *v8;
  HFServiceNameComponents *v9;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_parentService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {

    v3 = 0;
  }
  +[HFNamingComponents namingComponentFromService:](HFNamingComponents, "namingComponentFromService:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFServiceNameComponents alloc];
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:](v6, "initWithRawServiceName:rawRoomName:", v7, v8);

  return v9;
}

- (id)hf_updateDateAdded:()HFReordering
{
  return HFUpdateDateAddedForApplicationDataContainer(a1, a3);
}

@end
