@implementation HRERecommendableObjectUtilities

+ (BOOL)recommendableObject:(id)a3 isEffectivelyEqualToObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  if (v5 == v6)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v5, "hf_containedServices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_containedServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToSet:", v8))
    {
      objc_msgSend(v5, "hf_containedProfiles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hf_containedProfiles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToSet:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

+ (BOOL)recommendableObject:(id)a3 containsObject:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "recommendableObject:isEffectivelyEqualToObject:", v6, v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "hf_containedServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_containedServices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isSubsetOfSet:", v10))
    {
      objc_msgSend(v7, "hf_containedProfiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hf_containedProfiles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "isSubsetOfSet:", v12);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)recommendableObject:(id)a3 actionBuildersDerivedFromActions:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCF20];
  v13 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v9, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HREDerivedActionUtilities derivedActionsForActionableObjects:fromActions:](HREDerivedActionUtilities, "derivedActionsForActionableObjects:fromActions:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)recommendableObject:(id)a3 involvedInActionMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hre_matchingTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__HRERecommendableObjectUtilities_recommendableObject_involvedInActionMap___block_invoke;
  v12[3] = &unk_24F216CD0;
  v14 = v6;
  v15 = a1;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  LOBYTE(v6) = objc_msgSend(v8, "na_any:", v12);

  return (char)v6;
}

uint64_t __75__HRERecommendableObjectUtilities_recommendableObject_involvedInActionMap___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "_actionMap:includesType:forRecommendableObject:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)_actionMap:(id)a3 includesType:(id)a4 forRecommendableObject:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HREServiceTypeAll"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (!v12)
    goto LABEL_7;
  objc_msgSend(v12, "flattenedMapEvaluatedForObject:", v9);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hre_characteristics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __82__HRERecommendableObjectUtilities__actionMap_includesType_forRecommendableObject___block_invoke;
  v18[3] = &unk_24F216CF8;
  v12 = (id)v13;
  v19 = v12;
  LOBYTE(v13) = objc_msgSend(v14, "na_any:", v18);

  if ((v13 & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
LABEL_7:
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16 != 0;

  }
  return v15;
}

BOOL __82__HRERecommendableObjectUtilities__actionMap_includesType_forRecommendableObject___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "characteristicTypeValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

+ (BOOL)recommendableObject:(id)a3 involvedInAction:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ((objc_opt_class(),
         v7 = (id)objc_msgSend(v6, "performSelector:", sel_characteristic),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (v8 = 0)
      : (v8 = v7),
        v9 = v8,
        v7,
        v9))
  {
    objc_msgSend(v5, "hre_characteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);
  }
  else
  {
    objc_opt_class();
    v12 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v9 = v13;

    if (!v9)
    {
      v11 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v5, "hf_containedProfiles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaProfiles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intersectsSet:", v14);

  }
LABEL_14:

  return v11;
}

+ (id)actionMapFromActionMap:(id)a3 forRecommendableObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hre_matchingTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

    goto LABEL_7;
  }
  v8 = objc_msgSend(v5, "count");

  if (!v8)
  {
LABEL_7:
    +[HREActionMap emptyMap](HREActionMap, "emptyMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "hre_matchingTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __81__HRERecommendableObjectUtilities_actionMapFromActionMap_forRecommendableObject___block_invoke;
  v20 = &unk_24F216D20;
  v21 = v5;
  v22 = v6;
  objc_msgSend(v10, "na_map:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count", v17, v18, v19, v20);
  +[HREActionMap emptyMap](HREActionMap, "emptyMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "mergeWithActionMaps:", v11);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }

LABEL_8:
  return v14;
}

id __81__HRERecommendableObjectUtilities_actionMapFromActionMap_forRecommendableObject___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flattenedMapEvaluatedForObject:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "characteristicTypeValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (id)recommendableObjectsFromHomeKitObjects:(id)a3
{
  return (id)objc_msgSend(a3, "na_flatMap:", &__block_literal_global_114);
}

id __74__HRERecommendableObjectUtilities_recommendableObjectsFromHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v4 = v2;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_255A56278))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v3, "na_safeAddObject:", v6);
  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  v10 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v3, "removeObject:", v12);
    if ((objc_msgSend(v12, "hf_isBridge") & 1) == 0)
    {
      objc_msgSend(v12, "_containedRecommendableObjects");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionSet:", v13);
LABEL_13:

    }
  }
  else if (!v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_class();
      v14 = (id)objc_msgSend(v10, "performSelector:", sel_services);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      objc_msgSend(v3, "na_safeAddObjectsFromArray:", v16);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_class();
      v17 = (id)objc_msgSend(v10, "performSelector:", sel_profiles);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v13 = v18;

      objc_msgSend(v13, "na_map:", &__block_literal_global_122);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "na_safeAddObjectsFromArray:", v19);

      goto LABEL_13;
    }
  }

  return v3;
}

id __74__HRERecommendableObjectUtilities_recommendableObjectsFromHomeKitObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255A56278))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (BOOL)recommendableObjects:(id)a3 matchAllRules:(id)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __70__HRERecommendableObjectUtilities_recommendableObjects_matchAllRules___block_invoke;
      v9[3] = &unk_24F216DC8;
      v10 = v5;
      v7 = objc_msgSend(v6, "na_all:", v9);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __70__HRERecommendableObjectUtilities_recommendableObjects_matchAllRules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passesWithHomeObjects:", *(_QWORD *)(a1 + 32));
}

+ (id)filterRecommendableObjects:(id)a3 toMatchTypes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__HRERecommendableObjectUtilities_filterRecommendableObjects_toMatchTypes___block_invoke;
  v9[3] = &unk_24F216DF0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __75__HRERecommendableObjectUtilities_filterRecommendableObjects_toMatchTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hre_matchingTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)filterRecommendableObjects:(id)a3 toRooms:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__HRERecommendableObjectUtilities_filterRecommendableObjects_toRooms___block_invoke;
  v9[3] = &unk_24F216DF0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __70__HRERecommendableObjectUtilities_filterRecommendableObjects_toRooms___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "hre_parentRoom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "hre_parentRoom");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)filterRecommendableObjects:(id)a3 excludingObjectsInActions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "na_map:", &__block_literal_global_125);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_128);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke_3;
  v13[3] = &unk_24F216E98;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v6, "na_filter:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

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
    objc_msgSend(v5, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

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
    objc_msgSend(v5, "mediaProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v7 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v9, "characteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "profiles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

uint64_t __88__HRERecommendableObjectUtilities_filterRecommendableObjects_excludingObjectsInActions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "hf_containedServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intersectsSet:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "hf_containedProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(a1) = objc_msgSend(v6, "intersectsSet:", *(_QWORD *)(a1 + 40));
  return (v5 | a1) ^ 1;
}

@end
