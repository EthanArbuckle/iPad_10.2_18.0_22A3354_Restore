@implementation HRETemplateRecommendationGeneratorProcess

- (BOOL)shouldGenerateRecommendations
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRETemplateRecommendationGeneratorProcess;
  if (!-[HREStandardAsyncRecommendationGenerationProcess shouldGenerateRecommendations](&v6, sel_shouldGenerateRecommendations))return 0;
  -[HRETemplateRecommendationGeneratorProcess activeTemplates](self, "activeTemplates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)generateRecommendations
{
  HRERecommendationEmptyTriggerBuilderContext *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  HRERecommendationEmptyTriggerBuilderContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  HRERecommendationEmptyTriggerBuilderContext *v16;

  v3 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
  -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke;
  v15[3] = &unk_24F217880;
  v15[4] = self;
  v16 = v3;
  v7 = v3;
  objc_msgSend(v5, "na_map:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRETemplateRecommendationGeneratorProcess setHomeTriggerBuilders:](self, "setHomeTriggerBuilders:", v8);

  v9 = (void *)MEMORY[0x24BDBCF20];
  -[HRETemplateRecommendationGeneratorProcess activeTemplates](self, "activeTemplates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke_2;
  v14[3] = &unk_24F2178A8;
  v14[4] = self;
  objc_msgSend(v10, "na_flatMap:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE4D188];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerBuilderForTrigger:inHome:context:assertsFailure:", v5, v6, *(_QWORD *)(a1 + 40), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __68__HRETemplateRecommendationGeneratorProcess_generateRecommendations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "recommendationsWithTemplate:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recommendationsWithTemplate:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  HRETemplateRecommendationGeneratorProcess *v32;
  id v33;
  _QWORD *v34;
  char v35;
  _QWORD v36[5];

  v4 = a3;
  v5 = -[HREStandardAsyncRecommendationGenerationProcess options](self, "options");
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v6, "rules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hre_filteredToClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "na_filter:", &__block_literal_global_49);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HREStandardAsyncRecommendationGenerationProcess homeRecommendableObjects](self, "homeRecommendableObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = +[HRERecommendableObjectUtilities recommendableObjects:matchAllRules:](HRERecommendableObjectUtilities, "recommendableObjects:matchAllRules:", v13, v12);

  v14 = 0;
  if ((_DWORD)v10)
  {
    -[HREStandardAsyncRecommendationGenerationProcess homeRecommendableObjects](self, "homeRecommendableObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "involvedAccessoryTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRERecommendableObjectUtilities filterRecommendableObjects:toMatchTypes:](HRERecommendableObjectUtilities, "filterRecommendableObjects:toMatchTypes:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v17, "count"))
    {
      v14 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[HREStandardAsyncRecommendationGenerationProcess sourceRecommendableObjects](self, "sourceRecommendableObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "na_filter:", &__block_literal_global_53);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HREStandardAsyncRecommendationGenerationProcess sourceRecommendableObjects](self, "sourceRecommendableObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v21 = objc_msgSend(v19, "count");

      if (!v21)
        goto LABEL_14;
    }
    else
    {

    }
    if (!objc_msgSend(v19, "count") || objc_msgSend(v17, "intersectsSet:", v19))
    {
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x2020000000;
      v36[3] = 0;
      -[HRETemplateRecommendationGeneratorProcess _initialRecommendationsForTemplate:](self, "_initialRecommendationsForTemplate:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (v5 >> 7) & 1;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_3;
      v28[3] = &unk_24F217998;
      v29 = v17;
      v30 = v11;
      v24 = v6;
      v31 = v24;
      v32 = self;
      v35 = v23;
      v33 = v8;
      v34 = v36;
      objc_msgSend(v22, "na_filter:", v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[HRETemplateRecommendationGeneratorProcess _filterRecommendations:fromTemplate:](self, "_filterRecommendations:fromTemplate:", v25, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_7;
      v27[3] = &unk_24F2179C0;
      v27[4] = v36;
      objc_msgSend(v14, "na_each:", v27);

      _Block_object_dispose(v36, 8);
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
LABEL_17:

  return v14;
}

BOOL __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_isVisible");
}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  id v65;
  id v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  id v74;
  char v75;
  _QWORD v76[4];
  id v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "roomsToFilterHomeObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v3, "roomsToFilterHomeObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRERecommendableObjectUtilities filterRecommendableObjects:toRooms:](HRERecommendableObjectUtilities, "filterRecommendableObjects:toRooms:", v4, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  if (+[HRERecommendableObjectUtilities recommendableObjects:matchAllRules:](HRERecommendableObjectUtilities, "recommendableObjects:matchAllRules:", v4, *(_QWORD *)(a1 + 40)))
  {
    objc_opt_class();
    v9 = *(id *)(a1 + 48);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 56), "sourceRecommendableObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (!v30)
      {
        v65 = 0;
        goto LABEL_22;
      }
      objc_msgSend(*(id *)(a1 + 56), "sourceRecommendableObjects");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "na_setByIntersectingWithSet:", v14);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v65 = v11;

      v4 = (id)v24;
LABEL_22:
      v31 = v3;
      v32 = &unk_255A52378;
      if (objc_msgSend(v31, "conformsToProtocol:", v32))
        v33 = v31;
      else
        v33 = 0;
      v34 = v33;

      v66 = v3;
      v67 = v34;
      if (v34)
      {
        objc_msgSend(*(id *)(a1 + 56), "_existingActionSetForTemplate:recommendation:", *(_QWORD *)(a1 + 48), v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v36 = v31;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v37 = v36;
        else
          v37 = 0;
        v38 = v37;

        if (v38 && v35)
        {
          objc_msgSend(v38, "mutableActionSetBuilders");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "removeAllObjects");

          objc_msgSend(v38, "mutableActionSetBuilders");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v35);

          objc_msgSend(v38, "setSelectedActionSetBuilder:", v35);
        }
        objc_msgSend(*(id *)(a1 + 64), "actionMap");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(*(id *)(a1 + 56), "_defineActionsWithActionMap:withActionableObjects:", v41, v4);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addActions:allowEditingExistingActions:", v42, *(unsigned __int8 *)(a1 + 80));

        }
        objc_msgSend(*(id *)(a1 + 56), "_actionsForDerivingForTemplate:recommendation:", *(_QWORD *)(a1 + 48), v34);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "count"))
        {
          v44 = MEMORY[0x24BDAC760];
          v76[0] = MEMORY[0x24BDAC760];
          v76[1] = 3221225472;
          v76[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_5;
          v76[3] = &unk_24F217770;
          v77 = *(id *)(a1 + 48);
          objc_msgSend(v4, "na_filter:", v76);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          +[HREDerivedActionUtilities derivedActionsForActionableObjects:fromActions:](HREDerivedActionUtilities, "derivedActionsForActionableObjects:fromActions:", v45, v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = v44;
          v72[1] = 3221225472;
          v72[2] = __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_6;
          v72[3] = &unk_24F217970;
          v73 = *(id *)(a1 + 64);
          v74 = v67;
          v75 = *(_BYTE *)(a1 + 80);
          objc_msgSend(v46, "na_each:", v72);

        }
        v3 = v66;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = v31;
        objc_msgSend(v47, "triggerBuilders");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v48, "copy");

        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v50 = v49;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v69 != v53)
                objc_enumerationMutation(v50);
              v55 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 56), "_triggerWithSameConfigurationAsTrigger:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = v56;
              if (v56)
              {
                objc_msgSend(v56, "setEnabled:", 1);
                objc_msgSend(v47, "replaceTriggerBuilder:withTriggerBuilder:allowEditingExistingActions:", v55, v57, *(unsigned __int8 *)(a1 + 80));
              }

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
          }
          while (v52);
        }

        v3 = v66;
      }
      v58 = objc_msgSend(v31, "containsRecommendableContent");
      v59 = objc_msgSend(v31, "containsMeaningfulChanges");
      if ((objc_msgSend(*(id *)(a1 + 56), "options") & 0x40) != 0)
        v60 = v58;
      else
        v60 = v58 & v59;
      v11 = v65;
      if (v58 && (v59 & 1) == 0)
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 56), "sourceRecommendableObjects");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v61, "count"))
      {
        objc_msgSend(*(id *)(a1 + 56), "sourceRecommendableObjects");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v31, "includesObjects:", v62);

      }
      else
      {
        v63 = 1;
      }

      v28 = v60 & v63;
      goto LABEL_60;
    }
    objc_opt_class();
    v12 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v11, "triggerBuilderForRecommendation:withObjects:", v14, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 56), "sourceRecommendableObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (!v17)
      {
LABEL_16:
        v24 = (uint64_t)v4;
        objc_msgSend(v15, "setEnabled:", 1);
        objc_msgSend(v14, "mutableTriggerBuilders");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v15);

        objc_msgSend(v14, "mutableTriggerBuilders");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "na_each:", &__block_literal_global_56);

        objc_msgSend(v11, "iconDescriptorForRecommendation:withObjects:", v14, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIconDescriptor:", v27);

        v4 = v15;
        goto LABEL_20;
      }
      objc_msgSend(*(id *)(a1 + 56), "sourceRecommendableObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "intersectsSet:", v18);

      if (v19)
      {
        v20 = *(void **)(a1 + 56);
        objc_msgSend(v20, "sourceRecommendableObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_filterToAllowedObjects:withSourceObjects:withTrigger:template:", v4, v21, v15, v11);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "triggerBuilderForRecommendation:withObjects:", v14, v22);
        v23 = objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v4 = (id)v22;
          v15 = (void *)v23;
          goto LABEL_16;
        }
        v15 = 0;
        v4 = (id)v22;
      }
    }

    v28 = 0;
LABEL_60:

    goto LABEL_61;
  }
  v28 = 0;
LABEL_61:

  return v28;
}

void __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(v4, "naturalLanguageNameOfType:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v3);

  }
}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "involvedAccessoryTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hre_matchingTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "intersectsSet:", v5);
  return v6;
}

void __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allowedVariance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "anyRulePassesForAction:", v5);

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addAction:allowEditingExistingActions:", v5, *(unsigned __int8 *)(a1 + 48));

}

uint64_t __73__HRETemplateRecommendationGeneratorProcess_recommendationsWithTemplate___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNumberOfEnabledRecommendationsForTemplate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (id)_initialRecommendationsForTemplate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[HREStandardAsyncRecommendationGenerationProcess sourceRecommendableObjects](self, "sourceRecommendableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_127);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createStarterRecommendationInHome:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "splitStrategy");
  -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "splitUsingSplitStrategy:inHome:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "count");
  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_2;
    v20[3] = &unk_24F217A28;
    v21 = v6;
    objc_msgSend(v11, "na_filter:", v20);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_3;
  v18[3] = &unk_24F217A50;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  objc_msgSend(v11, "na_flatMap:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_parentRoom");
}

uint64_t __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);
  }
  else
  {
    objc_msgSend(v3, "zone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v7 = 1;
      goto LABEL_6;
    }
    v9 = *(void **)(a1 + 32);
    v10 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v3, "zone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rooms");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "intersectsSet:", v12);

  }
LABEL_6:

  return v7;
}

uint64_t __80__HRETemplateRecommendationGeneratorProcess__initialRecommendationsForTemplate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createInitialRecommendations:withRecommendation:", *(_QWORD *)(a1 + 40), a2);
}

- (id)_createInitialRecommendations:(id)a3 withRecommendation:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
  {
    v11 = (void *)MEMORY[0x24BDBCF20];
    v40[0] = v7;
    v12 = (void *)MEMORY[0x24BDBCE30];
    v13 = (id *)v40;
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "allowMultipleEventsFeature"))
  {
    v11 = (void *)MEMORY[0x24BDBCF20];
    v39 = v7;
    v12 = (void *)MEMORY[0x24BDBCE30];
    v13 = &v39;
LABEL_8:
    objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v10, "triggerCharacteristicValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_map:", &__block_literal_global_131);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v7, "room");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREStandardAsyncRecommendationGenerationProcess homeRecommendableObjects](self, "homeRecommendableObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_2;
    v35[3] = &unk_24F216E98;
    v36 = v18;
    v37 = v19;
    v22 = v19;
    v23 = v18;
    objc_msgSend(v20, "na_filter:", v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v21;
    v30 = 3221225472;
    v31 = __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_3;
    v32 = &unk_24F217AB8;
    v33 = v8;
    v34 = v17;
    objc_msgSend(v24, "na_flatMap:", &v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "splitUsingSplitCharacteristics:", v25, v29, v30, v31, v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = (void *)MEMORY[0x24BDBCF20];
    v38 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v15;
}

uint64_t __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type");
}

uint64_t __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "hre_parentRoom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    if (!v7)
    {
      v6 = v4 != 0;
      goto LABEL_6;
    }
    objc_msgSend(v7, "rooms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hre_parentRoom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v8);

  }
LABEL_6:

  return v6;
}

id __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(v3, "hre_matchingTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "involvedAccessoryTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "hre_characteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_4;
    v10[3] = &unk_24F216CF8;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "na_filter:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __94__HRETemplateRecommendationGeneratorProcess__createInitialRecommendations_withRecommendation___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v3, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_isVisible");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_defineActionsWithActionMap:(id)a3 withActionableObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  HRETemplateRecommendationGeneratorProcess *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HREServiceTypeAll"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__HRETemplateRecommendationGeneratorProcess__defineActionsWithActionMap_withActionableObjects___block_invoke;
  v15[3] = &unk_24F217AE0;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "na_flatMap:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRETemplateRecommendationGeneratorProcess _defineProfileActionsForActionableObjects:withActionMap:](self, "_defineProfileActionsForActionableObjects:withActionMap:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setByAddingObjectsFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __95__HRETemplateRecommendationGeneratorProcess__defineActionsWithActionMap_withActionableObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "hre_primaryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[HRERecommendableObjectUtilities actionMapFromActionMap:forRecommendableObject:](HRERecommendableObjectUtilities, "actionMapFromActionMap:forRecommendableObject:", *(_QWORD *)(a1 + 32), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = v6;

    }
    else
    {
      +[HRECharacteristicActionMap emptyMap](HRECharacteristicActionMap, "emptyMap");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*(_QWORD *)(a1 + 40))
    {
      v14[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mergeWithActionMaps:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v12;
    }
    objc_msgSend(*(id *)(a1 + 48), "characteristicActionsForObject:actionMap:", v3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_defineProfileActionsForActionableObjects:(id)a3 withActionMap:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  v8 = a4;
  objc_msgSend(v7, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HREMediaProfileContainerType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v6, "na_flatMap:", &__block_literal_global_137);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "flattenedMapEvaluatedForObject:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc(MEMORY[0x24BE4D0E8]);
      -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithHome:", v17);

      objc_msgSend(v18, "setMediaProfiles:", v14);
      objc_msgSend(v18, "setTargetPlayState:", objc_msgSend(v11, "targetPlaybackState"));
      objc_msgSend(v11, "targetVolume");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTargetVolume:", v19);

      objc_msgSend(v11, "playbackArchive");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPlaybackArchive:", v20);

      objc_msgSend(v9, "addObject:", v18);
    }

  }
  return v9;
}

id __101__HRETemplateRecommendationGeneratorProcess__defineProfileActionsForActionableObjects_withActionMap___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "hf_containedProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_139);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __101__HRETemplateRecommendationGeneratorProcess__defineProfileActionsForActionableObjects_withActionMap___block_invoke_2(uint64_t a1, void *a2)
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

- (id)_actionsForDerivingForTemplate:(id)a3 recommendation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a4;
  -[HRETemplateRecommendationGeneratorProcess _existingActionSetForTemplate:recommendation:](self, "_existingActionSetForTemplate:recommendation:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v7, "actions");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v13 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v10 = v14;

    if (v10)
    {
      objc_msgSend(v10, "triggerBuilders");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "na_flatMap:", &__block_literal_global_143);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_9:

  return v12;
}

id __91__HRETemplateRecommendationGeneratorProcess__actionsForDerivingForTemplate_recommendation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anonymousActionSetBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_existingActionSetForTemplate:(id)a3 recommendation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;

  v5 = a3;
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "actionSetType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionSetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionSets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __90__HRETemplateRecommendationGeneratorProcess__existingActionSetForTemplate_recommendation___block_invoke;
    v23 = &unk_24F217B68;
    v13 = v10;
    v24 = v13;
    v14 = v9;
    v25 = v14;
    objc_msgSend(v12, "na_firstObjectPassingTest:", &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x24BE4D020]);
      -[HREStandardAsyncRecommendationGenerationProcess home](self, "home", v20, v21, v22, v23, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithExistingObject:inHome:", v15, v17);

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __90__HRETemplateRecommendationGeneratorProcess__existingActionSetForTemplate_recommendation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "actionSetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_filterToAllowedObjects:(id)a3 withSourceObjects:(id)a4 withTrigger:(id)a5 template:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;
  char v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v11, "actionMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rules");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "hre_filteredToClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_opt_class();
  v17 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  v20 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke;
  v43[3] = &unk_24F217770;
  v21 = v19;
  v44 = v21;
  v22 = objc_msgSend(v9, "na_any:", v43);
  v41[0] = v20;
  v41[1] = 3221225472;
  v41[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_2;
  v41[3] = &unk_24F217770;
  v23 = v13;
  v42 = v23;
  v24 = objc_msgSend(v9, "na_any:", v41);
  v39[0] = v20;
  v39[1] = 3221225472;
  v39[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_3;
  v39[3] = &unk_24F217110;
  v25 = v16;
  v40 = v25;
  objc_msgSend(v9, "na_each:", v39);
  v32[0] = v20;
  v32[1] = 3221225472;
  v32[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_5;
  v32[3] = &unk_24F217BB8;
  v33 = v25;
  v34 = v23;
  v37 = v24;
  v38 = v22;
  v35 = v21;
  v36 = v9;
  v26 = v9;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  objc_msgSend(v12, "na_filter:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hre_characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "intersectsSet:", v5);
  return v6;
}

BOOL __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HRERecommendableObjectUtilities recommendableObject:involvedInActionMap:](HRERecommendableObjectUtilities, "recommendableObject:involvedInActionMap:", a2, *(_QWORD *)(a1 + 32));
}

void __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_4;
  v7[3] = &unk_24F217B90;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "minusSet:", v5);

}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passesWithObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  char v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_6;
  v15[3] = &unk_24F217B90;
  v5 = v3;
  v16 = v5;
  objc_msgSend(v4, "na_filter:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "minusSet:", v6);
  v7 = objc_msgSend(v6, "count");
  if (+[HRERecommendableObjectUtilities recommendableObject:involvedInActionMap:](HRERecommendableObjectUtilities, "recommendableObject:involvedInActionMap:", v5, *(_QWORD *)(a1 + 40)))
  {
    v8 = *(_BYTE *)(a1 + 64) == 0;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "characteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hre_characteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "intersectsSet:", v10))
    v11 = *(_BYTE *)(a1 + 65) == 0;
  else
    v11 = 0;

  v12 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5);
  v13 = 1;
  if (!v7 && (v12 & 1) == 0)
    v13 = v8 | v11;

  return v13;
}

uint64_t __108__HRETemplateRecommendationGeneratorProcess__filterToAllowedObjects_withSourceObjects_withTrigger_template___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passesWithObject:", *(_QWORD *)(a1 + 32));
}

- (id)_triggerWithSameConfigurationAsTrigger:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HRETemplateRecommendationGeneratorProcess homeTriggerBuilders](self, "homeTriggerBuilders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isShortcutOwned") & 1) == 0)
        {
          objc_msgSend(v3, "compareToObject:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "filteredIgnoringKeys:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "hasNoDifferencesHigherThanPriority:", 0))
          {
            objc_msgSend(v18, "addObject:", v10);
            objc_msgSend(v4, "addObject:", v11);
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke_3;
  v19[3] = &unk_24F217C00;
  v21 = &v22;
  v19[4] = self;
  v13 = v4;
  v20 = v13;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
  v14 = v23[3];
  if (v14 >= objc_msgSend(v18, "count") || v23[3] < 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v18, "objectAtIndexedSubscript:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

id __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke()
{
  if (_block_invoke_na_once_token_376_8 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_8, &__block_literal_global_153);
  return (id)_block_invoke_na_once_object_376_8;
}

void __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BE4CE40];
  v5[0] = *MEMORY[0x24BE4CE48];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_block_invoke_na_once_object_376_8;
  _block_invoke_na_once_object_376_8 = v3;

}

void __84__HRETemplateRecommendationGeneratorProcess__triggerWithSameConfigurationAsTrigger___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  id v13;

  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_QWORD *)(v8 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    *(_QWORD *)(v8 + 24) = a3;
    goto LABEL_8;
  }
  v13 = v7;
  if (!objc_msgSend(v7, "hasNoDifferencesHigherThanPriority:", 0))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_diffScoreForTriggerComparison:", v10);

    v12 = objc_msgSend(*(id *)(a1 + 32), "_diffScoreForTriggerComparison:", v13) < v11;
    v7 = v13;
    if (!v12)
      goto LABEL_8;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    goto LABEL_7;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  *a4 = 1;
  v7 = v13;
LABEL_8:

}

- (id)_filterRecommendations:(id)a3 fromTemplate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void *v28;
  HRETemplateRecommendationGeneratorProcess *v29;
  id v30;
  _QWORD v31[5];
  id v32;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDBCF00];
    objc_msgSend(v10, "characteristicTypePriority");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orderedSetWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v10, "characteristicPerServiceRule");
    v15 = MEMORY[0x24BDAC760];
    if (v14)
    {
      objc_msgSend(v7, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_157);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDBCF20];
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_2;
      v31[3] = &unk_24F217C68;
      v31[4] = self;
      v32 = v13;
      objc_msgSend(v16, "na_flatMap:", v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v19;
    }
    if (objc_msgSend(v10, "enforcePriority"))
    {
      -[HRETemplateRecommendationGeneratorProcess _splitRecommendationsBySplitStrategy:](self, "_splitRecommendationsBySplitStrategy:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v15;
      v26 = 3221225472;
      v27 = __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_3;
      v28 = &unk_24F217C90;
      v29 = self;
      v30 = v13;
      objc_msgSend(v20, "na_flatMap:", &v25);
      v21 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v21;
    }
    if (objc_msgSend(v10, "singleRecommendationPerSplit", v25, v26, v27, v28, v29))
    {
      -[HRETemplateRecommendationGeneratorProcess _splitRecommendationsBySplitStrategy:](self, "_splitRecommendationsBySplitStrategy:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "na_map:", &__block_literal_global_162);
      v23 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v23;
    }

  }
  return v7;
}

id __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a2, "splitCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

id __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD1880];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "hmf_zeroUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_filterSplitRecommendations:characteristicTypePriority:", v6, *(_QWORD *)(a1 + 40));
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  objc_msgSend(v6, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_filterSplitRecommendations:characteristicTypePriority:", a2, *(_QWORD *)(a1 + 40));
}

id __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_163);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "anyObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __81__HRETemplateRecommendationGeneratorProcess__filterRecommendations_fromTemplate___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsMeaningfulChanges") ^ 1;
}

- (id)_splitRecommendationsBySplitStrategy:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_164);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __82__HRETemplateRecommendationGeneratorProcess__splitRecommendationsBySplitStrategy___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "zone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_filterSplitRecommendations:(id)a3 characteristicTypePriority:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  _QWORD v22[5];

  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke;
  v22[3] = &unk_24F217A28;
  v22[4] = self;
  v8 = a4;
  objc_msgSend(v6, "na_filter:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_165);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v7;
  v18 = 3221225472;
  v19 = __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke_3;
  v20 = &unk_24F217D78;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v11, "na_firstObjectPassingTest:", &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v13, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setByAddingObjectsFromSet:", v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v6;
  }

  return v15;
}

void *__100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
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

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "selectedTriggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BE4D188];
      objc_msgSend(v8, "trigger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "triggerBuilderForTrigger:inHome:context:assertsFailure:", v11, v12, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v6, "compareForMatchingToTrigger:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v15, "hasNoDifferencesHigherThanPriority:", 0);

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "splitCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __100__HRETemplateRecommendationGeneratorProcess__filterSplitRecommendations_characteristicTypePriority___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)_diffScoreForTriggerComparison:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "differences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "containedObjectResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "differences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "differences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE38]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "differences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE40]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14 != 0;
  if (v10)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v10, "containedObjectResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          v15 += objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v20++), "hasNoDifferencesHigherThanPriority:", 0) ^ 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v18);
    }

  }
  if (v12)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v12, "containedObjectResults", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          v15 += objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25++), "hasNoDifferencesHigherThanPriority:", 0) ^ 1;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v23);
    }

  }
  return v15;
}

- (id)characteristicActionsForObject:(id)a3 actionMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  +[HRECharacteristicActionMap emptyMap](HRECharacteristicActionMap, "emptyMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v7, "characteristicTypeValues"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    objc_msgSend(v7, "flattenedMapEvaluatedForObject:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplateRecommendationGeneratorProcess definiteActionsForCharacteristicActionMap:object:](self, "definiteActionsForCharacteristicActionMap:object:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)definiteActionsForCharacteristicActionMap:(id)a3 object:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HRETemplateRecommendationGeneratorProcess *v13;

  v6 = a3;
  objc_msgSend(a4, "hre_characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __94__HRETemplateRecommendationGeneratorProcess_definiteActionsForCharacteristicActionMap_object___block_invoke;
  v11[3] = &unk_24F217DA0;
  v12 = v6;
  v13 = self;
  v8 = v6;
  objc_msgSend(v7, "na_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __94__HRETemplateRecommendationGeneratorProcess_definiteActionsForCharacteristicActionMap_object___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "characteristicTypeValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE4D068]);
    objc_msgSend(*(id *)(a1 + 40), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithHome:", v8);

    objc_msgSend(v9, "setCharacteristic:", v3);
    objc_msgSend(v9, "setTargetValue:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)rooms
{
  return self->_rooms;
}

- (void)setRooms:(id)a3
{
  objc_storeStrong((id *)&self->_rooms, a3);
}

- (NSArray)activeTemplates
{
  return self->_activeTemplates;
}

- (void)setActiveTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_activeTemplates, a3);
}

- (NSArray)homeTriggerBuilders
{
  return self->_homeTriggerBuilders;
}

- (void)setHomeTriggerBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_homeTriggerBuilders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeTriggerBuilders, 0);
  objc_storeStrong((id *)&self->_activeTemplates, 0);
  objc_storeStrong((id *)&self->_rooms, 0);
}

@end
