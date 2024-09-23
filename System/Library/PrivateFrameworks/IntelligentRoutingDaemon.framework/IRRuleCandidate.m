@implementation IRRuleCandidate

- (IRRuleCandidate)initWithAttributeKey:(id)a3 requireAllNodes:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  IRRuleCandidate *v7;
  IRRuleCandidate *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRRuleCandidate;
  v7 = -[IRRuleCandidate init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[IRRuleCandidate setAttributeKey:](v7, "setAttributeKey:", v6);
    -[IRRuleCandidate setRequireAllNodes:](v8, "setRequireAllNodes:", v4);
  }

  return v8;
}

- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  IRRuleOutputCandidate *v28;
  void *v29;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v31 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_opt_new();
  -[IRRuleCandidate attributeKey](self, "attributeKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRuleCandidate _prerequisiteValueForAttributeKey:withCandidatesContainer:nearbyDeviceContainer:systemState:historyContainer:date:](self, "_prerequisiteValueForAttributeKey:withCandidatesContainer:nearbyDeviceContainer:systemState:historyContainer:date:", v20, v14, v17, v15, v16, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  objc_msgSend(v14, "candidates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __125__IRRuleCandidate_executeRuleWithCandiatesContainer_systemStatus_historyContainer_miloPrediction_nearbyDeviceContainer_date___block_invoke;
  v32[3] = &unk_251044458;
  v32[4] = self;
  v23 = v21;
  v33 = v23;
  v24 = v17;
  v34 = v24;
  v25 = v15;
  v35 = v25;
  v26 = v18;
  v36 = v26;
  v38 = &v39;
  v27 = v19;
  v37 = v27;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v32);

  v28 = -[IRRuleOutput initWithRule:]([IRRuleOutputCandidate alloc], "initWithRule:", self);
  v29 = (void *)objc_msgSend(v27, "copy");
  -[IRRuleOutputCandidate setValues:](v28, "setValues:", v29);

  -[IRRuleOutputCandidate setIsAnyCandidateEvaluatedToYes:](v28, "setIsAnyCandidateEvaluatedToYes:", *((unsigned __int8 *)v40 + 24));
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __125__IRRuleCandidate_executeRuleWithCandiatesContainer_systemStatus_historyContainer_miloPrediction_nearbyDeviceContainer_date___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)a1[4];
  objc_msgSend(v3, "attributeKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_attributeValueForAttributeKey:prerequisite:withCandidate:nearbyDeviceContainer:systemState:date:", v4, a1[5], v8, a1[6], a1[7], a1[8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasBoolean") && objc_msgSend(v5, "BOOLean"))
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 1;
  v6 = (void *)a1[9];
  objc_msgSend(v8, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

- (id)_proximityValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "proximityPerCandiate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidateIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBoolean:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v9, "setHasBoolean:", objc_msgSend(v7, "anyCandidateInProximity"));
  return v9;
}

- (id)_proximityShortestRangeValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "candidateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "shortestRangeCandidateIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBoolean:", objc_msgSend(v10, "isEqual:", v11));

  objc_msgSend(v9, "setHasBoolean:", objc_msgSend(v7, "anyCandidateMeetsCondition"));
  return v9;
}

- (id)_proximityShortestRangeInHistoryOrSameICloudValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 prerequisite:(id)a5 date:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "candidateIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "shortestRangeCandidateIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBoolean:", objc_msgSend(v10, "isEqual:", v11));

  objc_msgSend(v9, "setHasBoolean:", objc_msgSend(v7, "anyCandidateMeetsCondition"));
  return v9;
}

- (BOOL)_proximityDecisionForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IRRuleCandidate _proximityLowestUwbRangeForCandidate:withNearbyDeviceContainer:date:](self, "_proximityLowestUwbRangeForCandidate:withNearbyDeviceContainer:date:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11
     && (+[IRPreferences shared](IRPreferences, "shared"),
         v12 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v12, "deviceRangeProximityThreshold"),
         v13 = (void *)objc_claimAutoreleasedReturnValue(),
         v14 = objc_msgSend(v11, "isLessThanOrEqualTo:", v13),
         v13,
         v12,
         (v14 & 1) != 0)
     || -[IRRuleCandidate _proximityBLEValueForCandidate:withNearbyDeviceContainer:date:](self, "_proximityBLEValueForCandidate:withNearbyDeviceContainer:date:", v8, v9, v10);

  return v15;
}

- (id)_proximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v23 = v8;
  objc_msgSend(v8, "candidates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v18 = -[IRRuleCandidate _proximityDecisionForCandidate:withNearbyDeviceContainer:date:](self, "_proximityDecisionForCandidate:withNearbyDeviceContainer:date:", v17, v9, v10);
        v14 |= v18;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "candidateIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v20);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setAnyCandidateInProximity:", v14 & 1);
  objc_msgSend(v21, "setProximityPerCandiate:", v11);

  return v21;
}

- (id)_shortestRangeProximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  IRRuleCandidate *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(v8, "candidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __113__IRRuleCandidate__shortestRangeProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_date___block_invoke;
  v19 = &unk_251044480;
  v20 = self;
  v12 = v9;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v23 = &v26;
  v24 = &v36;
  v25 = &v30;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v16);

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setShortestRange:", v37[5], v16, v17, v18, v19, v20);
  objc_msgSend(v14, "setShortestRangeCandidateIdentifier:", v31[5]);
  objc_msgSend(v14, "setAnyCandidateMeetsCondition:", *((unsigned __int8 *)v27 + 24));

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v14;
}

void __113__IRRuleCandidate__shortestRangeProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_date___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_proximityLowestUwbRangeForCandidate:withNearbyDeviceContainer:date:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceRangeProximityThreshold");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isLessThanOrEqualTo:", v5);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= v6;
    if (v6)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
        || (objc_msgSend(v3, "isLessThan:") & 1) != 0
        || objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        && (objc_msgSend(v12, "nodes"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "count"),
            v7,
            v8 == 1))
      {
        objc_msgSend(v12, "candidateIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v3);
      }
    }
  }

}

- (id)_shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer:(id)a3 withNearbyDeviceContainer:(id)a4 historyContainer:(id)a5 systemState:(id)a6 date:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  objc_msgSend(v12, "candidates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __165__IRRuleCandidate__shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_historyContainer_systemState_date___block_invoke;
  v24[3] = &unk_2510444A8;
  v24[4] = self;
  v18 = v13;
  v25 = v18;
  v19 = v16;
  v26 = v19;
  v20 = v14;
  v27 = v20;
  v21 = v15;
  v28 = v21;
  v29 = &v32;
  v30 = &v42;
  v31 = &v36;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);

  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setShortestRange:", v43[5]);
  objc_msgSend(v22, "setShortestRangeCandidateIdentifier:", v37[5]);
  objc_msgSend(v22, "setAnyCandidateMeetsCondition:", *((unsigned __int8 *)v33 + 24));

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v22;
}

void __165__IRRuleCandidate__shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer_withNearbyDeviceContainer_historyContainer_systemState_date___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_proximityLowestUwbRangeForCandidate:withNearbyDeviceContainer:date:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceRangeProximityThreshold");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isLessThanOrEqualTo:", v5))
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v15, "candidateIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "_isCandidateIdentifier:inHistory:", v7, *(_QWORD *)(a1 + 56)) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_sameIcloudForCandidate:systemState:", v15, *(_QWORD *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "BOOLean");

      }
    }
    else
    {
      v8 = 0;
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) |= v8;
    if (v8)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
        || (objc_msgSend(v3, "isLessThan:") & 1) != 0
        || objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
        && (objc_msgSend(v15, "nodes"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "count"),
            v10,
            v11 == 1))
      {
        objc_msgSend(v15, "candidateIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v3);
      }
    }
  }

}

- (id)_userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer:(id)a3 systemState:(id)a4 date:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDBCEB8];
  v10 = a3;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "historyEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __114__IRRuleCandidate__userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer_systemState_date___block_invoke;
  v20[3] = &unk_2510444D0;
  v21 = v8;
  v22 = v7;
  v23 = v11;
  v13 = v11;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, v20);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v13, "reverseObjectEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFilteredHistoryEvents:", v18);

  return v16;
}

void __114__IRRuleCandidate__userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer_systemState_date___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  v6 = a2;
  v7 = (void *)MEMORY[0x24BDBCE60];
  v22 = v6;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "isDate:inSameDayAsDate:forTimeZoneInSeconds:", v8, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "timeZoneSeconds"));

  if ((v7 & 1) == 0)
  {
    *a4 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v22, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    objc_msgSend(v22, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
    {
      objc_msgSend(v22, "event");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
      {
        objc_msgSend(v22, "event");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqual:", v16) & 1) == 0)
        {
          objc_msgSend(v22, "event");
          v20 = v15;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v18, "isEqual:", v19);

          v17 = v22;
          if ((v21 & 1) == 0)
            goto LABEL_13;
          goto LABEL_10;
        }

      }
    }

  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v22);
LABEL_12:
  v17 = v22;
LABEL_13:

}

- (BOOL)_isCandidateIdentifier:(id)a3 inHistory:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  objc_msgSend(a4, "historyEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__IRRuleCandidate__isCandidateIdentifier_inHistory___block_invoke;
  v11[3] = &unk_2510444F8;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "firstWhere:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

uint64_t __52__IRRuleCandidate__isCandidateIdentifier_inHistory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "candidateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_proximityLowestUwbRangeForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE60];
  +[IRPreferences shared](IRPreferences, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nearbyDeviceMeasurmentExpityTimeSeconds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v30 = v10;
  objc_msgSend(v11, "dateWithTimeInterval:sinceDate:", v10, -v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = v8;
  objc_msgSend(v8, "nodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v16);
        -[IRRuleCandidate _matchedDevicefromNode:withNearbyDeviceContainer:measurementExpiry:isUwb:](self, "_matchedDevicefromNode:withNearbyDeviceContainer:measurementExpiry:isUwb:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v9, v15, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = (void *)MEMORY[0x24BDD16E0];
          if (v19)
          {
            objc_msgSend(v19, "doubleValue");
            v26 = v25;
            objc_msgSend(v23, "range");
            if (v26 < v27)
              v27 = v26;
          }
          else
          {
            objc_msgSend(v22, "range");
          }
          objc_msgSend(v24, "numberWithDouble:", v27);
          v28 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v28;
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_matchedDevicefromNode:(id)a3 withNearbyDeviceContainer:(id)a4 measurementExpiry:(id)a5 isUwb:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "computedIdsIdentifier");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "computedMediaRemoteIdenfifier");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "computedMediaRouteIdentifier");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12 || v13 || v14)
  {
    v16 = CFSTR("identifier-doesn't-match");
    if (v12)
      v17 = v12;
    else
      v17 = CFSTR("identifier-doesn't-match");
    if (v13)
      v18 = v13;
    else
      v18 = CFSTR("identifier-doesn't-match");
    if (v14)
      v16 = v14;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K = %@ OR %K = %@ OR %K = %@) AND (%K >= %@) "), CFSTR("idsIdentifier"), v17, CFSTR("mediaRemoteIdentifier"), v18, CFSTR("mediaRemoteIdentifier"), v16, CFSTR("measurementDate"), v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nearbyDevices");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredSetUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v21, "firstWhere:", &__block_literal_global_7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        objc_msgSend(v21, "firstWhere:", &__block_literal_global_101);
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v24;

    }
    else
    {
      objc_msgSend(v21, "firstWhere:", &__block_literal_global_103_0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __92__IRRuleCandidate__matchedDevicefromNode_withNearbyDeviceContainer_measurementExpiry_isUwb___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "proximityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("NIHomeDevice"));

  return v3;
}

BOOL __92__IRRuleCandidate__matchedDevicefromNode_withNearbyDeviceContainer_measurementExpiry_isUwb___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "proximityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[IRProximityProvider isUWBProximityType:](IRProximityProvider, "isUWBProximityType:", v2);

  return v3;
}

BOOL __92__IRRuleCandidate__matchedDevicefromNode_withNearbyDeviceContainer_measurementExpiry_isUwb___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "proximityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[IRProximityProvider isBLEProximityType:](IRProximityProvider, "isBLEProximityType:", v2);

  return v3;
}

- (BOOL)_proximityBLEValueForCandidate:(id)a3 withNearbyDeviceContainer:(id)a4 date:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "nodes", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRRuleCandidate _matchedDevicefromNode:withNearbyDeviceContainer:measurementExpiry:isUwb:](self, "_matchedDevicefromNode:withNearbyDeviceContainer:measurementExpiry:isUwb:", v13, v7, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)_sameIcloudForCandidate:(id)a3 systemState:(id)a4
{
  id v6;
  id v7;
  IRRuleOutputEvaluation *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(IRRuleOutputEvaluation);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __55__IRRuleCandidate__sameIcloudForCandidate_systemState___block_invoke;
  v20 = &unk_251044580;
  v21 = v6;
  v11 = v9;
  v22 = v11;
  v12 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);

  objc_msgSend(v7, "nodes", v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    -[IRRuleCandidate _valueFromValues:](self, "_valueFromValues:", v11);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (IRRuleOutputEvaluation *)v15;
  }

  return v8;
}

void __55__IRRuleCandidate__sameIcloudForCandidate_systemState___block_invoke(uint64_t a1, void *a2)
{
  IRRuleOutputEvaluation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_alloc_init(IRRuleOutputEvaluation);
  objc_msgSend(v8, "rapportDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IRRuleOutputEvaluation setHasBoolean:](v3, "setHasBoolean:", 1);
    objc_msgSend(v8, "rapportDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iCloudId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "iCloudId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleOutputEvaluation setBoolean:](v3, "setBoolean:", objc_msgSend(v6, "isEqualToString:", v7));

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_sameWiFiForCandidate:(id)a3 systemState:(id)a4
{
  id v5;
  IRRuleOutputEvaluation *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = objc_alloc_init(IRRuleOutputEvaluation);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__IRRuleCandidate__sameWiFiForCandidate_systemState___block_invoke;
  v14[3] = &unk_2510445A8;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  objc_msgSend(v5, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    -[IRRuleCandidate _valueFromValues:](self, "_valueFromValues:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (IRRuleOutputEvaluation *)v12;
  }

  return v6;
}

void __53__IRRuleCandidate__sameWiFiForCandidate_systemState___block_invoke(uint64_t a1, void *a2)
{
  IRRuleOutputEvaluation *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc_init(IRRuleOutputEvaluation);
  objc_msgSend(v11, "avOutpuDeviceIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v11, "avOutputDevice");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v11, "avOutputDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasAirplayProperties");

      if (v9)
      {
        objc_msgSend(v11, "avOutputDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IRRuleOutputEvaluation setBoolean:](v3, "setBoolean:", objc_msgSend(v10, "discoveredOverInfra"));

        -[IRRuleOutputEvaluation setHasBoolean:](v3, "setHasBoolean:", 1);
      }
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)_activeRouteForCandidate:(id)a3 systemState:(id)a4
{
  id v6;
  id v7;
  IRRuleOutputEvaluation *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(IRRuleOutputEvaluation);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __56__IRRuleCandidate__activeRouteForCandidate_systemState___block_invoke;
  v20 = &unk_251044580;
  v21 = v6;
  v11 = v9;
  v22 = v11;
  v12 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);

  objc_msgSend(v7, "nodes", v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    -[IRRuleCandidate _valueFromValues:](self, "_valueFromValues:", v11);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (IRRuleOutputEvaluation *)v15;
  }

  return v8;
}

void __56__IRRuleCandidate__activeRouteForCandidate_systemState___block_invoke(uint64_t a1, void *a2)
{
  IRRuleOutputEvaluation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_alloc_init(IRRuleOutputEvaluation);
  objc_msgSend(v8, "avOutputDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IRRuleOutputEvaluation setHasBoolean:](v3, "setHasBoolean:", 1);
    objc_msgSend(v8, "avOutputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaRouteGroupLeaderOutputDeviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRRuleOutputEvaluation setBoolean:](v3, "setBoolean:", objc_msgSend(v6, "isEqual:", v7));

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_mediaUserRejectedInLastDayWithoutPickerChoiceForCandidate:(id)a3 prerequisite:(id)a4
{
  id v6;
  id v7;
  IRRuleOutputEvaluation *v8;
  _BOOL8 v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(IRRuleOutputEvaluation);
  -[IRRuleOutputEvaluation setHasBoolean:](v8, "setHasBoolean:", 1);
  v9 = -[IRRuleCandidate _isLastEventForCandidate:inPrerequisite:isOneOf:](self, "_isLastEventForCandidate:inPrerequisite:isOneOf:", v7, v6, &unk_25105EF48);

  -[IRRuleOutputEvaluation setBoolean:](v8, "setBoolean:", v9);
  return v8;
}

- (id)_appleTVControlUserRejectedInLastDayWithoutPickerChoiceForCandidate:(id)a3 prerequisite:(id)a4
{
  id v6;
  id v7;
  IRRuleOutputEvaluation *v8;
  _BOOL8 v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(IRRuleOutputEvaluation);
  -[IRRuleOutputEvaluation setHasBoolean:](v8, "setHasBoolean:", 1);
  v9 = -[IRRuleCandidate _isLastEventForCandidate:inPrerequisite:isOneOf:](self, "_isLastEventForCandidate:inPrerequisite:isOneOf:", v7, v6, &unk_25105EF60);

  -[IRRuleOutputEvaluation setBoolean:](v8, "setBoolean:", v9);
  return v8;
}

- (BOOL)_isLastEventForCandidate:(id)a3 inPrerequisite:(id)a4 isOneOf:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  objc_msgSend(v10, "filteredHistoryEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke;
  v18[3] = &unk_2510445D0;
  v13 = v7;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, v18);

  if (v22[5])
  {
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke_2;
    v17[3] = &unk_2510445F8;
    v17[4] = &v21;
    objc_msgSend(v9, "firstWhere:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "candidateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v14, "event");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "eventType"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a4 = 1;
  }

}

uint64_t __67__IRRuleCandidate__isLastEventForCandidate_inPrerequisite_isOneOf___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToNumber:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (id)_valueFromValues:(id)a3
{
  id v4;
  IRRuleOutputEvaluation *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  _BOOL8 v15;

  v4 = a3;
  v5 = objc_alloc_init(IRRuleOutputEvaluation);
  v6 = objc_msgSend(v4, "count");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("hasBoolean"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("BOOLean"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredSetUsingPredicate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    objc_msgSend(v4, "filteredSetUsingPredicate:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (-[IRRuleCandidate requireAllNodes](self, "requireAllNodes"))
      v14 = v11 == v7;
    else
      v14 = v11 != 0;
    -[IRRuleOutputEvaluation setHasBoolean:](v5, "setHasBoolean:", v14);
    if (-[IRRuleCandidate requireAllNodes](self, "requireAllNodes"))
      v15 = v13 == v7;
    else
      v15 = v13 != 0;
    -[IRRuleOutputEvaluation setBoolean:](v5, "setBoolean:", v15);

  }
  return v5;
}

- (id)_attributeValueForAttributeKey:(id)a3 prerequisite:(id)a4 withCandidate:(id)a5 nearbyDeviceContainer:(id)a6 systemState:(id)a7 date:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  IRRuleOutputEvaluation *v20;
  uint64_t v21;
  IRRuleOutputEvaluation *v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_alloc_init(IRRuleOutputEvaluation);
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateSameWiFiKey")))
  {
    -[IRRuleCandidate _sameWiFiForCandidate:systemState:](self, "_sameWiFiForCandidate:systemState:", v16, v18);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v22 = (IRRuleOutputEvaluation *)v21;

    v20 = v22;
    goto LABEL_18;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateSameiCloudKey")))
  {
    -[IRRuleCandidate _sameIcloudForCandidate:systemState:](self, "_sameIcloudForCandidate:systemState:", v16, v18);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateProximityKey")))
  {
    -[IRRuleCandidate _proximityValueForCandidate:withNearbyDeviceContainer:prerequisite:date:](self, "_proximityValueForCandidate:withNearbyDeviceContainer:prerequisite:date:", v16, v17, v15, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateProximityShortestRangeKey")))
  {
    -[IRRuleCandidate _proximityShortestRangeValueForCandidate:withNearbyDeviceContainer:prerequisite:date:](self, "_proximityShortestRangeValueForCandidate:withNearbyDeviceContainer:prerequisite:date:", v16, v17, v15, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateProximityShortestRangeInHistoryOrSameICloudKey")))
  {
    -[IRRuleCandidate _proximityShortestRangeInHistoryOrSameICloudValueForCandidate:withNearbyDeviceContainer:prerequisite:date:](self, "_proximityShortestRangeInHistoryOrSameICloudValueForCandidate:withNearbyDeviceContainer:prerequisite:date:", v16, v17, v15, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateActiveRouteKey")))
  {
    -[IRRuleCandidate _activeRouteForCandidate:systemState:](self, "_activeRouteForCandidate:systemState:", v16, v18);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateMediaUserRejectedInLastDayWithoutPickerChoiceKey")))
  {
    -[IRRuleCandidate _mediaUserRejectedInLastDayWithoutPickerChoiceForCandidate:prerequisite:](self, "_mediaUserRejectedInLastDayWithoutPickerChoiceForCandidate:prerequisite:", v16, v15);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateAppleTVControlUserRejectedInLastDayWithoutPickerChoiceKey")))
  {
    -[IRRuleCandidate _appleTVControlUserRejectedInLastDayWithoutPickerChoiceForCandidate:prerequisite:](self, "_appleTVControlUserRejectedInLastDayWithoutPickerChoiceForCandidate:prerequisite:", v16, v15);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_18:

  return v20;
}

- (id)_prerequisiteValueForAttributeKey:(id)a3 withCandidatesContainer:(id)a4 nearbyDeviceContainer:(id)a5 systemState:(id)a6 historyContainer:(id)a7 date:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateProximityKey")))
  {
    -[IRRuleCandidate _proximityPrerequisiteValueForCandidatesContainer:withNearbyDeviceContainer:date:](self, "_proximityPrerequisiteValueForCandidatesContainer:withNearbyDeviceContainer:date:", v15, v16, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateProximityShortestRangeKey")))
  {
    -[IRRuleCandidate _shortestRangeProximityPrerequisiteValueForCandidatesContainer:withNearbyDeviceContainer:date:](self, "_shortestRangeProximityPrerequisiteValueForCandidatesContainer:withNearbyDeviceContainer:date:", v15, v16, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateProximityShortestRangeInHistoryOrSameICloudKey")))
  {
    -[IRRuleCandidate _shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer:withNearbyDeviceContainer:historyContainer:systemState:date:](self, "_shortestRangeWithHistoryOrSameICloudProximityPrerequisiteValueForCandidatesContainer:withNearbyDeviceContainer:historyContainer:systemState:date:", v15, v16, v18, v17, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateMediaUserRejectedInLastDayWithoutPickerChoiceKey")) & 1) == 0
      && !objc_msgSend(v14, "isEqual:", CFSTR("kIRRuleCandidateAppleTVControlUserRejectedInLastDayWithoutPickerChoiceKey")))
    {
      v21 = 0;
      goto LABEL_11;
    }
    -[IRRuleCandidate _userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer:systemState:date:](self, "_userRejectedInLastDayWithoutPickerChoicePrerequisiteValueForHistoryContainer:systemState:date:", v18, v17, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
LABEL_11:

  return v21;
}

- (NSString)attributeKey
{
  return self->_attributeKey;
}

- (void)setAttributeKey:(id)a3
{
  objc_storeStrong((id *)&self->_attributeKey, a3);
}

- (BOOL)requireAllNodes
{
  return self->_requireAllNodes;
}

- (void)setRequireAllNodes:(BOOL)a3
{
  self->_requireAllNodes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeKey, 0);
}

@end
