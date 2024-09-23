@implementation HMMediaProfile(HRERecommendableObjectProtocol)

- (id)hre_actionTypes
{
  return +[HREDerivedActionUtilities actionTypesForProfile:](HREDerivedActionUtilities, "actionTypesForProfile:", a1);
}

- (uint64_t)hre_characteristicTypeForActionType:()HRERecommendableObjectProtocol
{
  return 0;
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

- (id)hre_matchingTypes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke;
  v2[3] = &unk_24F216BC8;
  v2[4] = a1;
  __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke((uint64_t)v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hre_isActionable
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x24BE4D108]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4D0E0]), "initWithValueSource:mediaProfileContainer:", v2, a1);
  v4 = objc_msgSend(v3, "containsActions");

  return v4;
}

- (uint64_t)hre_isVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hre_isVisible");

  return v2;
}

- (uint64_t)hre_isMediaObject
{
  return 1;
}

@end
