@implementation HREActionSetDerivingRecommendationGenerator

- (unint64_t)disablingOptions
{
  return 16;
}

- (void)setupProcess:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v4 = a3;
  objc_msgSend(v4, "sourceItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "typeGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  objc_msgSend(v4, "sourceItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_filter:", &__block_literal_global_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceItems:", v9);

  v21.receiver = self;
  v21.super_class = (Class)HREActionSetDerivingRecommendationGenerator;
  -[HREStandardAsyncRecommendationSource setupProcess:](&v21, sel_setupProcess_, v4);
  objc_opt_class();
  v10 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v6)
  {
    objc_msgSend(v10, "homeRecommendableObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceRecommendableObjects:", v13);

  }
  objc_msgSend(v10, "sourceRecommendableObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_filter:", &__block_literal_global_48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourceRecommendableObjects:", v15);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v10, "sourceRecommendableObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_5;
  v19[3] = &unk_24F217110;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "na_each:", v19);

  objc_msgSend(v12, "setSourceCharacteristics:", v18);
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255A5F990))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "containsActions");
  else
    v6 = 0;

  return v6;
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend(v2, "hf_containedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v2, "hf_containedServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_50);

  }
  else
  {
    v5 = 1;
  }

  objc_msgSend(v2, "hf_containedProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

    goto LABEL_8;
  }
  objc_msgSend(v2, "hf_containedProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_52);

  if ((v5 | v8) == 1)
  {
LABEL_8:
    v9 = objc_msgSend(v2, "hre_isActionable");
    goto LABEL_9;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

uint64_t __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isVisibleAccessory");

  return v3;
}

void __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "hre_characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_6;
  v4[3] = &unk_24F2170E8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __60__HREActionSetDerivingRecommendationGenerator_setupProcess___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "characteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_msgSend(v6, "addObject:", v9);

}

- (Class)generationProcessClass
{
  return (Class)objc_opt_class();
}

@end
