@implementation HREDerivedActionUtilities

+ (id)actionType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "actionTypeForCharacteristic:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "actionTypeForActionClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)actionTypeForActionClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionTypeAlias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

+ (id)actionTypeForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedServiceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceType");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "characteristicType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionTypeForServiceType:characteristicType:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)actionTypeForServiceType:(id)a3 characteristicType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "serviceTypeAlias");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v7;
  v12 = v11;

  objc_msgSend(a1, "characteristicTypeAlias");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v6;
  v17 = v16;

  if (v12 && v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "actionTypeAlias");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v18);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = v18;
    v23 = v22;

  }
  else
  {
    __73__HREDerivedActionUtilities_actionTypeForServiceType_characteristicType___block_invoke();
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

id __73__HREDerivedActionUtilities_actionTypeForServiceType_characteristicType___block_invoke()
{
  if (NORMALIZED_VALUE_DIFFERENCE_THRESHOLD_block_invoke_na_once_token_376 != -1)
    dispatch_once(&NORMALIZED_VALUE_DIFFERENCE_THRESHOLD_block_invoke_na_once_token_376, &__block_literal_global_2_9);
  return (id)NORMALIZED_VALUE_DIFFERENCE_THRESHOLD_block_invoke_na_once_object_376;
}

void __73__HREDerivedActionUtilities_actionTypeForServiceType_characteristicType___block_invoke_2()
{
  void *v0;

  v0 = (void *)NORMALIZED_VALUE_DIFFERENCE_THRESHOLD_block_invoke_na_once_object_376;
  NORMALIZED_VALUE_DIFFERENCE_THRESHOLD_block_invoke_na_once_object_376 = (uint64_t)&stru_24F219000;

}

+ (id)characteristicTypeForActionType:(id)a3 serviceType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (objc_msgSend(v5, "containsString:", a4))
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
        v8 = v7;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)actionTypesForProfile:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__HREDerivedActionUtilities_actionTypesForProfile___block_invoke;
  v15[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v15[4] = a1;
  objc_msgSend(v6, "na_map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __51__HREDerivedActionUtilities_actionTypesForProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionTypeAlias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v3;
  v7 = v5;

  return v7;
}

+ (id)derivedActionsForActionableObjects:(id)a3 fromActions:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];

  v6 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke;
  v20[3] = &__block_descriptor_40_e38____NSCopying__16__0__HFActionBuilder_8l;
  v20[4] = a1;
  v7 = a3;
  objc_msgSend(a4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = v6;
  v14 = 3221225472;
  v15 = __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_2;
  v16 = &unk_24F218C00;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = a1;
  v17 = v8;
  v9 = v18;
  v10 = v8;
  objc_msgSend(v7, "na_each:", &v13);

  v11 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

uint64_t __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "actionType:", a2);
}

void __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hre_actionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByIntersectingWithSet:", v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_3;
  v18[3] = &unk_24F218BD8;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  v22 = v5;
  v23 = v11;
  v19 = v10;
  v20 = v3;
  v21 = v4;
  v12 = v5;
  v13 = v4;
  v14 = v3;
  objc_msgSend(v17, "na_each:", v18);
  v15 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_filterActions:withUnmatchedCharacteristicTypes:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unionSet:", v16);

}

void __76__HREDerivedActionUtilities_derivedActionsForActionableObjects_fromActions___block_invoke_3(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[8], "_derivedActionForActionableObject:actionType:actions:", a1[5], v7, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1[6], "addObject:", v4);
  }
  else
  {
    objc_msgSend(a1[5], "hre_characteristicTypeForActionType:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = v5;
    else
      v6 = v7;
    objc_msgSend(a1[7], "addObject:", v6);

  }
}

+ (id)_derivedActionForActionableObject:(id)a3 actionType:(id)a4 actions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v8, "hre_parentRoom");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_allZones");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke;
  v44[3] = &unk_24F218C28;
  v16 = v8;
  v45 = v16;
  objc_msgSend(a1, "_filterActions:withAccessoriesPassingTest:", v10, v44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v15;
  v42[1] = 3221225472;
  v42[2] = __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_2;
  v42[3] = &unk_24F218C28;
  v18 = v14;
  v43 = v18;
  objc_msgSend(a1, "_filterActions:withAccessoriesPassingTest:", v10, v42);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  objc_msgSend(a1, "_serviceTypesExtrapolatingFromZones");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hre_matchingTypes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "intersectsSet:", v22))
  {
    v23 = objc_msgSend(v20, "count");

    v24 = v20;
    if (v23)
      goto LABEL_6;
    v24 = v19;
    v21 = v20;
  }
  else
  {

    v24 = v20;
  }

LABEL_6:
  objc_msgSend(a1, "_serviceTypesExtrapolatingFromWholeHome", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hre_matchingTypes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "intersectsSet:", v26))
  {
    v27 = objc_msgSend(v24, "count");

    if (v27)
      goto LABEL_11;
    v25 = v24;
    v24 = v10;
  }
  else
  {

  }
LABEL_11:
  objc_msgSend(v24, "na_map:", &__block_literal_global_21_0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionTypeForActionClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v9, "isEqualToString:", v29);

  if (v30)
  {
    objc_msgSend(v16, "hf_containedProfiles");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "na_map:", &__block_literal_global_23_0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_derivedActionForMediaProfiles:withExistingValues:", v32, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "hre_characteristics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_5;
    v39[3] = &unk_24F218C90;
    v40 = v9;
    v41 = a1;
    objc_msgSend(v34, "na_filter:", v39);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "anyObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_derivedActionForCharacteristic:withExistingValues:", v36, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v40;
  }

  return v33;
}

uint64_t __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hre_parentRoom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a2, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_allZones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "intersectsSet:", v6);

  return v7;
}

id __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "targetValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v6 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
      v9 = v8;
    else
      v6 = 0;

  }
  return v6;
}

id __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255A60378))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __82__HREDerivedActionUtilities__derivedActionForActionableObject_actionType_actions___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actionTypeForCharacteristic:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

+ (id)_derivedActionForMediaProfiles:(id)a3 withExistingValues:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(a4, "na_firstObjectPassingTest:", &__block_literal_global_273);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE4D0E8]);
    objc_msgSend(v5, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithHome:", v9);

    objc_msgSend(v10, "setMediaProfiles:", v5);
    objc_msgSend(v10, "setTargetPlayState:", objc_msgSend(v6, "targetPlayState"));
    objc_msgSend(v6, "targetVolume");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTargetVolume:", v11);

    objc_msgSend(v6, "playbackArchive");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlaybackArchive:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __79__HREDerivedActionUtilities__derivedActionForMediaProfiles_withExistingValues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5 != 0;
}

+ (id)_derivedActionForCharacteristic:(id)a3 withExistingValues:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  double v32;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[6];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x24BE4D068]);
        objc_msgSend(v5, "hf_home");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithHome:", v10);

        objc_msgSend(v11, "setCharacteristic:", v5);
        objc_msgSend(v11, "setTargetValue:", v8);
LABEL_24:

        goto LABEL_25;
      }
LABEL_23:
      v11 = 0;
      goto LABEL_24;
    }
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v7, "na_map:", &__block_literal_global_275);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      if (v13 == objc_msgSend(v7, "count"))
      {
        objc_msgSend(v5, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "minimumValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "maximumValue");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = 0;
        v8 = 0;
        if (v15 && v16)
        {
          objc_msgSend(v14, "format");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)*MEMORY[0x24BDD56E0];

          if (v19 == v20)
          {
            v8 = 0;
            v18 = 0;
          }
          else
          {
            objc_msgSend(v15, "doubleValue");
            v22 = (unint64_t)v21;
            objc_msgSend(v17, "doubleValue");
            v24 = v23;
            objc_msgSend(v15, "doubleValue");
            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_2;
            v41[3] = &__block_descriptor_48_e18__16__0__NSNumber_8l;
            v34 = (unint64_t)(v24 - v25);
            v35 = v22;
            v41[4] = v22;
            v41[5] = v34;
            objc_msgSend(v12, "na_map:", v41);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v38;
              v30 = 0.0;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v38 != v29)
                    objc_enumerationMutation(v26);
                  objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "doubleValue");
                  v30 = v30 + v32 / (double)(unint64_t)objc_msgSend(v26, "count");
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
              }
              while (v28);
            }
            else
            {
              v30 = 0.0;
            }
            v36[0] = MEMORY[0x24BDAC760];
            v36[1] = 3221225472;
            v36[2] = __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_3;
            v36[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
            *(double *)&v36[4] = v30;
            if (objc_msgSend(v26, "na_all:", v36))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)((double)v35 + v30 * (double)v34));
              v8 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v8 = 0;
            }

            v18 = 1;
          }
        }

        if (!v18)
          goto LABEL_23;
        goto LABEL_5;
      }

    }
    v8 = 0;
    goto LABEL_23;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

id __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

id __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  unint64_t v5;
  void *v7;
  double v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "doubleValue");
  v5 = *(_QWORD *)(a1 + 32);
  if ((unint64_t)v4 < v5 || (unint64_t)v4 - v5 >= *(_QWORD *)(a1 + 40))
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:", (v8 - (double)*(unint64_t *)(a1 + 32)) / (double)*(unint64_t *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

BOOL __80__HREDerivedActionUtilities__derivedActionForCharacteristic_withExistingValues___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL8 v5;
  double v6;

  v3 = a2;
  objc_msgSend(v3, "doubleValue");
  if (v4 >= *(double *)(a1 + 32) + -0.1)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v6 <= *(double *)(a1 + 32) + 0.1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_filterActions:(id)a3 withUnmatchedCharacteristicTypes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = *MEMORY[0x24BDD5770];
  v22[0] = *MEMORY[0x24BDD5970];
  v22[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "intersectsSet:", v10))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)objc_opt_new();
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = *MEMORY[0x24BDD59A8];
    v21[0] = *MEMORY[0x24BDD58D0];
    v21[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "intersectsSet:", v16))
      objc_msgSend(v12, "unionSet:", v16);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __77__HREDerivedActionUtilities__filterActions_withUnmatchedCharacteristicTypes___block_invoke;
    v19[3] = &unk_24F2174C0;
    v20 = v12;
    v17 = v12;
    objc_msgSend(v5, "na_filter:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

uint64_t __77__HREDerivedActionUtilities__filterActions_withUnmatchedCharacteristicTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "characteristicType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9) ^ 1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (id)_filterActions:(id)a3 withAccessoriesPassingTest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke;
  v9[3] = &unk_24F218DC8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v11);

      if ((_DWORD)v9)
      {
        v12 = v4;
        goto LABEL_18;
      }
    }

  }
  objc_opt_class();
  v13 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v8 = v14;

  if (v8)
  {
    objc_msgSend(v8, "mediaProfiles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_2;
    v22[3] = &unk_24F218DA0;
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v15, "na_filter:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      v17 = objc_alloc(MEMORY[0x24BE4D0E8]);
      objc_msgSend(v8, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v17, "initWithHome:", v18);

      objc_msgSend(v12, "setMediaProfiles:", v16);
      objc_msgSend(v12, "setTargetPlayState:", objc_msgSend(v8, "targetPlayState"));
      objc_msgSend(v8, "targetVolume");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTargetVolume:", v19);

      objc_msgSend(v8, "playbackArchive");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPlaybackArchive:", v20);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
LABEL_18:

  return v12;
}

uint64_t __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_3;
  v6[3] = &unk_24F218D78;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __71__HREDerivedActionUtilities__filterActions_withAccessoriesPassingTest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)serviceTypeAlias
{
  if (serviceTypeAlias_onceToken != -1)
    dispatch_once(&serviceTypeAlias_onceToken, &__block_literal_global_284);
  return (id)serviceTypeAlias_serviceTypeAlias;
}

void __45__HREDerivedActionUtilities_serviceTypeAlias__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD6C90];
  v3[0] = *MEMORY[0x24BDD6BA8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceTypeAlias_serviceTypeAlias;
  serviceTypeAlias_serviceTypeAlias = v0;

}

+ (id)characteristicTypeAlias
{
  if (characteristicTypeAlias_onceToken != -1)
    dispatch_once(&characteristicTypeAlias_onceToken, &__block_literal_global_286);
  return (id)characteristicTypeAlias_characteristicTypeAlias;
}

void __52__HREDerivedActionUtilities_characteristicTypeAlias__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD5770];
  v3[0] = *MEMORY[0x24BDD5970];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)characteristicTypeAlias_characteristicTypeAlias;
  characteristicTypeAlias_characteristicTypeAlias = v0;

}

+ (id)actionTypeAlias
{
  if (actionTypeAlias_onceToken != -1)
    dispatch_once(&actionTypeAlias_onceToken, &__block_literal_global_287);
  return (id)actionTypeAlias_actionTypeAlias;
}

void __44__HREDerivedActionUtilities_actionTypeAlias__block_invoke()
{
  void *v0;

  v0 = (void *)actionTypeAlias_actionTypeAlias;
  actionTypeAlias_actionTypeAlias = MEMORY[0x24BDBD1B8];

}

+ (id)_serviceTypesExtrapolatingFromWholeHome
{
  if (_serviceTypesExtrapolatingFromWholeHome_onceToken != -1)
    dispatch_once(&_serviceTypesExtrapolatingFromWholeHome_onceToken, &__block_literal_global_288);
  return (id)_serviceTypesExtrapolatingFromWholeHome_serviceTypesExtrapolatingFromWholeHome;
}

void __68__HREDerivedActionUtilities__serviceTypesExtrapolatingFromWholeHome__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BDD6C08];
  v6[0] = *MEMORY[0x24BDD6B98];
  v6[1] = v1;
  v2 = *MEMORY[0x24BDD6BE8];
  v6[2] = *MEMORY[0x24BDD6CA0];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_serviceTypesExtrapolatingFromWholeHome_serviceTypesExtrapolatingFromWholeHome;
  _serviceTypesExtrapolatingFromWholeHome_serviceTypesExtrapolatingFromWholeHome = v4;

}

+ (id)_serviceTypesExtrapolatingFromZones
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HREDerivedActionUtilities__serviceTypesExtrapolatingFromZones__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_serviceTypesExtrapolatingFromZones_onceToken != -1)
    dispatch_once(&_serviceTypesExtrapolatingFromZones_onceToken, block);
  return (id)_serviceTypesExtrapolatingFromZones_serviceTypesExtrapolatingFromZones;
}

void __64__HREDerivedActionUtilities__serviceTypesExtrapolatingFromZones__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BDD6C90];
  v12[0] = *MEMORY[0x24BDD6BA8];
  v12[1] = v3;
  v4 = *MEMORY[0x24BDD6C70];
  v12[2] = *MEMORY[0x24BDD6CA8];
  v12[3] = v4;
  HREMediaProfileContainerType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v5;
  HRETelevisionProfileType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_serviceTypesExtrapolatingFromWholeHome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_serviceTypesExtrapolatingFromZones_serviceTypesExtrapolatingFromZones;
  _serviceTypesExtrapolatingFromZones_serviceTypesExtrapolatingFromZones = v10;

}

@end
