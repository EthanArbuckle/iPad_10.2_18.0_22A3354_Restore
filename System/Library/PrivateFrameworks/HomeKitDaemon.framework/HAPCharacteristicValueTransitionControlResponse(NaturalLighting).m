@implementation HAPCharacteristicValueTransitionControlResponse(NaturalLighting)

- (uint64_t)isNaturalLightingEnabledForCharacteristic:()NaturalLighting
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "transitionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNaturalLightingEnabledForCharacteristic:", v4);

  return v6;
}

@end
