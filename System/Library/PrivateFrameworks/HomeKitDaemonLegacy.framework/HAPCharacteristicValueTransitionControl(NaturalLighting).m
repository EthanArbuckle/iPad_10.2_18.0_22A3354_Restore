@implementation HAPCharacteristicValueTransitionControl(NaturalLighting)

- (uint64_t)naturalLightingEnabledForCharacteristic:()NaturalLighting
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(a1, "transitionStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__HAPCharacteristicValueTransitionControl_NaturalLighting__naturalLightingEnabledForCharacteristic___block_invoke;
  v14[3] = &unk_1E89B83A0;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "controllerContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (objc_msgSend(v8, "endBehavior"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (objc_msgSend(v8, "linearTransition"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v8, "linearDerivedTransition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v11 = MEMORY[0x1E0C9AAA0];
        goto LABEL_10;
      }
    }
    objc_msgSend(v8, "naturalLightingActiveTransitionContextForCharacteristic:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = MEMORY[0x1E0C9AAB0];
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (id)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(a1, "transitionStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __116__HAPCharacteristicValueTransitionControl_NaturalLighting__naturalLightingActiveTransitionContextForCharacteristic___block_invoke;
  v11[3] = &unk_1E89B83A0;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "naturalLightingActiveTransitionContextForCharacteristic:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
