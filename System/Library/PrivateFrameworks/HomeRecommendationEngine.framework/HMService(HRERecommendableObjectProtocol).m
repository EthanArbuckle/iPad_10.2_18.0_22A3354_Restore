@implementation HMService(HRERecommendableObjectProtocol)

- (id)hre_actionTypes
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1, "characteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "associatedServiceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[HREDerivedActionUtilities characteristicTypeForActionType:serviceType:](HREDerivedActionUtilities, "characteristicTypeForActionType:serviceType:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HREDerivedActionUtilities characteristicTypeForActionType:serviceType:](HREDerivedActionUtilities, "characteristicTypeForActionType:serviceType:", v4, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)hre_parentRoom
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hre_primaryType
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "associatedServiceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "serviceType");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)hre_matchingTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1, "associatedServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(a1, "serviceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v6;
}

- (id)hre_characteristics
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1, "characteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hre_isActionable
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = objc_alloc_init(MEMORY[0x24BE4D108]);
  v3 = objc_alloc(MEMORY[0x24BE4CFF0]);
  objc_msgSend(a1, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAccessory:valueSource:", v4, v2);

  objc_msgSend(MEMORY[0x24BE4D160], "serviceItemForService:valueSource:", a1, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsActions"))
    v7 = objc_msgSend(v6, "containsActions");
  else
    v7 = 0;

  return v7;
}

- (uint64_t)hre_isMediaObject
{
  return 0;
}

@end
