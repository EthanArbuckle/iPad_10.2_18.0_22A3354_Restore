@implementation HFActionNaturalLanguageUtilities

+ (id)hf_naturalLanguageDescriptionForActions:(id)a3 withOptions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  int v65;
  void *v66;
  _QWORD v67[4];
  NSObject *v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  uint8_t buf[4];
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[HFActionNaturalLanguageExecution executionWithActions:options:](HFActionNaturalLanguageExecution, "executionWithActions:options:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "singularInvolvedObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_serviceNameComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "composedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "singularInvolvedObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_serviceNameComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v7, "named");
  if (v13)
    v15 = v14;
  else
    v15 = 0;
  objc_msgSend(v7, "setNamed:", v15);
  objc_msgSend(v7, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(v7, "allInvolvedObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "na_flatMap:", &__block_literal_global_132);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "actions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "na_map:", &__block_literal_global_17_9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setByAddingObjectsFromSet:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v7, "accessoryCount");
    v24 = MEMORY[0x1E0C809B0];
    if (v23 > 1)
      goto LABEL_38;
    objc_msgSend(v7, "actions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_20_6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v24;
    v72[1] = 3221225472;
    v72[2] = __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_5;
    v72[3] = &unk_1EA737238;
    v75 = a1;
    v28 = v7;
    v73 = v28;
    v29 = v27;
    v74 = v29;
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v72);
    if (objc_msgSend(v29, "count") == 1)
    {
      objc_msgSend(v28, "indescribableActionTypes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(a1, "actionTypesMissingDescriptionShouldCauseFailure:", v30);

      if ((v31 & 1) != 0)
      {
        v32 = 0;
      }
      else
      {
        objc_msgSend(v29, "anyObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v32 = 0;
    }

    if (!v32)
    {
LABEL_38:
      if (objc_msgSend(v22, "count") != 1
        || !objc_msgSend(v22, "containsObject:", *MEMORY[0x1E0CB9A70])
        || (objc_msgSend(a1, "lightbulbStringKeyWithExecution:", v7),
            (v32 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v7, "actions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "na_allObjectsPassTest:", &__block_literal_global_26_1);

        if (!v37
          || (objc_msgSend(a1, "shortcutsStringKeyWithExecution:", v7),
              (v32 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          objc_msgSend(v6, "objectsInContext");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "allInvolvedObjects");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v38, "intersectsSet:", v39);

          objc_msgSend((id)objc_opt_class(), "genericStringKeyWithNumberOfAccessories:named:inContext:options:", objc_msgSend(v7, "accessoryCount"), objc_msgSend(v7, "named"), v40, v6);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    objc_msgSend(v7, "singularInvolvedObject");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!v41)
      goto LABEL_30;
    v42 = (void *)v41;
    v43 = objc_msgSend(v7, "named");

    if (!v43)
      goto LABEL_30;
    objc_msgSend(v32, "argumentMap");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

    objc_msgSend(v7, "involvedServices");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "count") == 1)
    {
      objc_msgSend(v7, "singularInvolvedObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "involvedServices");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "anyObject");
      v66 = v22;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v46, "isEqual:", v48);

      v22 = v66;
      v24 = MEMORY[0x1E0C809B0];

      if (!v49)
        goto LABEL_30;
      objc_msgSend(v7, "involvedServices");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "anyObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "accessory");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v52, "hf_showAsAccessoryTile");

      objc_msgSend(v6, "objectsInContext");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "involvedServices");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "anyObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "accessory");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v53, "containsObject:", v56);

      v24 = MEMORY[0x1E0C809B0];
      v22 = v66;

      if (!v65 || !v57)
        goto LABEL_30;
      objc_msgSend(v32, "argumentMap");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v13, CFSTR("name"));
    }

LABEL_30:
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v24;
    v67[1] = 3221225472;
    v67[2] = __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_8;
    v67[3] = &unk_1EA737280;
    v33 = v32;
    v68 = v33;
    v59 = v58;
    v69 = v59;
    v70 = v10;
    v60 = v7;
    v71 = v60;
    -[NSObject localizedStringWithArgumentBlock:](v33, "localizedStringWithArgumentBlock:", v67);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "count") && !+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    {
      objc_msgSend((id)objc_opt_class(), "genericStringKeyWithNumberOfAccessories:named:inContext:options:", objc_msgSend(v60, "accessoryCount"), 0, 0, v6);
      v62 = v22;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "localizedStringWithArgumentBlock:", &__block_literal_global_37_2);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      v22 = v62;
    }
    else
    {
      v35 = v61;
    }

    goto LABEL_35;
  }
  HFLogForCategory(0x2EuLL);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass((Class)a1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v77 = v34;
    _os_log_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_DEFAULT, "%@: natural language requested but no actions were supplied!", buf, 0xCu);

  }
  v35 = 0;
LABEL_35:

  return v35;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "hf_containedServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_15_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "associatedServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "serviceType");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  objc_class *v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;

  v2 = a2;
  objc_msgSend(v2, "hf_affectedCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "hf_affectedCharacteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (objc_class *)objc_opt_class();

    NSStringFromClass(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

void __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a1[6], "stringKeysForActions:withServiceType:execution:", a3, a2, a1[4]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(a1[5], "unionSet:", v8);
  v6 = a1[6];
  objc_msgSend(a1[4], "indescribableActionTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v6, "actionTypesMissingDescriptionShouldCauseFailure:", v7);

}

uint64_t __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x2EuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ argument key requested for which no value was given for string key: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("name")))
  {
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_28;
      v9[3] = &unk_1EA7273E0;
      v10 = *(id *)(a1 + 56);
      __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_28((uint64_t)v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_28(uint64_t a1)
{
  __CFString *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "accessoryCount") == 1)
    v1 = CFSTR("HFNaturalLanguageFailedAccessoryNamePlaceholder");
  else
    v1 = CFSTR("HFNaturalLanguageFailedAccessoryNamePlaceholder_Plural");
  _HFLocalizedStringWithDefaultValue(v1, v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __88__HFActionNaturalLanguageUtilities_hf_naturalLanguageDescriptionForActions_withOptions___block_invoke_2_36()
{
  return 0;
}

+ (id)stringKeysForActions:(id)a3 withServiceType:(id)a4 execution:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a1, "actionValuesByTypeForActions:execution:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_39_3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "stringKeyForSpecialCasesWithValuesByType:execution:characteristics:", v9, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __83__HFActionNaturalLanguageUtilities_stringKeysForActions_withServiceType_execution___block_invoke_2;
    v18 = &unk_1EA7372E8;
    v20 = a1;
    v19 = v7;
    objc_msgSend(v9, "na_dictionaryByMappingValues:", &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "selectHighestPriorityStringsFromStrings:", v13, v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

id __83__HFActionNaturalLanguageUtilities_stringKeysForActions_withServiceType_execution___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __83__HFActionNaturalLanguageUtilities_stringKeysForActions_withServiceType_execution___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "stringKeyWithType:values:execution:", v5, a3, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "indescribableActionTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v5);

  }
  return v6;
}

+ (id)actionValuesByTypeForActions:(id)a3 execution:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke;
  v24[3] = &__block_descriptor_40_e31____NSCopying__16__0__HMAction_8l;
  v24[4] = a1;
  objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_2;
  v21[3] = &unk_1EA737330;
  v22 = v6;
  v23 = a1;
  v12 = v6;
  objc_msgSend(v8, "na_filter:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v16);

  objc_msgSend(v12, "indescribableActionTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unionSet:", v11);

  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_3;
  v20[3] = &__block_descriptor_40_e35___NSSet_24__0__NSString_8__NSSet_16l;
  v20[4] = a1;
  objc_msgSend(v13, "na_dictionaryByMappingValues:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionTypeForAction:", a2);
}

uint64_t __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "_shouldIgnoreActions:withCharacteristicType:execution:", a3, a2, *(_QWORD *)(a1 + 32)) ^ 1;
}

id __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_4;
  v10[3] = &unk_1EA737358;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v5;
  objc_msgSend(a3, "na_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __75__HFActionNaturalLanguageUtilities_actionValuesByTypeForActions_execution___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_valueForAction:withActionType:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)stringKeyForSpecialCasesWithValuesByType:(id)a3 execution:(id)a4 characteristics:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_MergedGlobals_273 != -1)
    dispatch_once(&_MergedGlobals_273, &__block_literal_global_49_1);
  v11 = (id)qword_1ED3792F0;
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "intersectsSet:", v14);

  if (v15)
  {
    objc_msgSend(a1, "temperatureStringKeyForActions:execution:characteristics:", v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __103__HFActionNaturalLanguageUtilities_stringKeyForSpecialCasesWithValuesByType_execution_characteristics___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8AB8];
  v5[0] = *MEMORY[0x1E0CB8AC0];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3792F0;
  qword_1ED3792F0 = v3;

}

+ (id)stringKeyWithType:(id)a3 values:(id)a4 execution:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v15 = objc_msgSend(v10, "named");
      objc_msgSend(v10, "options");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "stringKeyForMediaPlaybackAction:named:options:", v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v12, "conformsToProtocol:", &unk_1F03F0C00))
      {
        v18 = 0;
        goto LABEL_12;
      }
      v19 = objc_msgSend(v10, "named");
      objc_msgSend(v10, "options");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "stringKeyForCharacteristicType:targetValue:named:options:", v8, v12, v19, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;

LABEL_12:
    goto LABEL_13;
  }
  v18 = 0;
LABEL_13:

  return v18;
}

+ (id)selectHighestPriorityStringsFromStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _OWORD v14[4];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v14, 0, sizeof(v14));
  objc_msgSend(a1, "_actionTypeDescriptionPriority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v14, v15, 16))
  {
    v6 = (void *)**((_QWORD **)&v14[0] + 1);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__HFActionNaturalLanguageUtilities_selectHighestPriorityStringsFromStrings___block_invoke;
    v12[3] = &unk_1EA72A1E8;
    v13 = v4;
    objc_msgSend(v6, "na_map:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __76__HFActionNaturalLanguageUtilities_selectHighestPriorityStringsFromStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

+ (id)stringKeyForCharacteristicType:(id)a3 targetValue:(id)a4 named:(BOOL)a5 options:(id)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  id v36;
  id v37;
  const char *aSelector;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  _QWORD v53[4];

  v6 = a5;
  v53[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  aSelector = a2;
  if (qword_1ED3792F8 != -1)
    dispatch_once(&qword_1ED3792F8, &__block_literal_global_54_2);
  v12 = (id)qword_1ED379300;
  v43 = 0;
  v44 = 0;
  v42 = 0;
  objc_msgSend(a1, "characteristicCaseClassification:valueKey:argumentKeys:fromCharacteristicType:targetValue:", &v44, &v43, &v42, v10, v11);
  v13 = v44;
  v14 = v43;
  v15 = v42;
  if (v13)
  {
    if (v6)
    {
      if (qword_1ED379308 != -1)
        dispatch_once(&qword_1ED379308, &__block_literal_global_60_0);
      v16 = (id)qword_1ED379310;
      objc_msgSend(v12, "stringByAppendingString:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = (id)MEMORY[0x1E0C9AA60];
      if (v15)
        v18 = v15;
      v53[0] = CFSTR("name");
      v53[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "na_arrayByFlattening");
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v20;
      v12 = (id)v17;
    }
    v39 = v10;
    if (v14)
    {
      v41 = 0;
      v21 = (id *)&v41;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@%@"), &v41, v13, v14);
    }
    else
    {
      v40 = 0;
      v21 = (id *)&v40;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), &v40, v13, v35);
    }
    v22 = objc_claimAutoreleasedReturnValue();
    v36 = a1;
    v37 = v14;
    v25 = *v21;
    v26 = v25;
    if (!v22)
      NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v12, v25);
    v27 = v11;
    +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v22, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "containsObject:", CFSTR("targetValuePercent")))
    {
      +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "percentFormatter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "stringForObjectValue:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "argumentMap");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("targetValuePercent"));

    }
    HFLogForCategory(0x2EuLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(aSelector);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v46 = v36;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v24;
      v51 = 2112;
      v52 = v39;
      _os_log_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@ for characteristic type %@", buf, 0x2Au);

    }
    v10 = v39;
    v11 = v27;
    v14 = v37;
  }
  else
  {
    HFLogForCategory(0x2EuLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(aSelector);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = a1;
      v47 = 2112;
      v48 = v23;
      v49 = 2112;
      v50 = v10;
      _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to produce classification for characteristic type %@", buf, 0x20u);

    }
    v24 = 0;
  }

  return v24;
}

void __93__HFActionNaturalLanguageUtilities_stringKeyForCharacteristicType_targetValue_named_options___block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED379300;
  qword_1ED379300 = (uint64_t)CFSTR("HFNaturalLanguage_Action_%@_%@");

}

void __93__HFActionNaturalLanguageUtilities_stringKeyForCharacteristicType_targetValue_named_options___block_invoke_2_59()
{
  void *v0;

  v0 = (void *)qword_1ED379310;
  qword_1ED379310 = (uint64_t)CFSTR("_Named");

}

+ (void)characteristicCaseClassification:(id *)a3 valueKey:(id *)a4 argumentKeys:(id *)a5 fromCharacteristicType:(id)a6 targetValue:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  int v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id *v49;
  id v50;
  id *v51;
  id *v52;
  id obj;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (qword_1ED379318 != -1)
    dispatch_once(&qword_1ED379318, &__block_literal_global_74_0);
  v16 = (id)qword_1ED379320;
  objc_msgSend(v16, "objectForKeyedSubscript:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    objc_msgSend(v16, "objectForKeyedSubscript:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      objc_msgSend(v20, "first");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "second");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      objc_msgSend(v16, "objectForKeyedSubscript:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      *a3 = objc_retainAutorelease(v23);

      if (v15)
        v24 = v15;
      else
        v24 = v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  if (!*a3)
  {
    v52 = a4;
    if (qword_1ED379328 != -1)
      dispatch_once(&qword_1ED379328, &__block_literal_global_100_3);
    v25 = (id)qword_1ED379330;
    objc_msgSend(v25, "objectForKeyedSubscript:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v47 = v16;
      v48 = v13;
      v50 = v11;
      v51 = a3;
      v49 = a5;
      v46 = v25;
      objc_msgSend(v25, "objectForKeyedSubscript:", v11);
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v56;
        v54 = v15;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v56 != v29)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_msgSend(v31, "first");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "second");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v15)
            {
              objc_msgSend(v33, "maxValue");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                objc_msgSend(v34, "maxValue");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "compare:", v15) != -1;

              }
              else
              {
                v37 = 1;
              }

              objc_msgSend(v34, "minValue");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                objc_msgSend(v34, "minValue");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "compare:", v15) != 1;

              }
              else
              {
                v40 = 1;
              }

              v41 = v37 && v40;
              v15 = v54;
              if (v41 == 1)
              {
                v42 = objc_retainAutorelease(v32);
                *v51 = v42;
                objc_msgSend(v31, "third");
                *v52 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_41;
              }
            }

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          if (v28)
            continue;
          break;
        }
      }
LABEL_41:

      a5 = v49;
      v11 = v50;
      v16 = v47;
      v13 = v48;
      a3 = v51;
      v25 = v46;
    }
    if (!*a3)
    {
      v43 = v25;
      if (qword_1ED379338 != -1)
        dispatch_once(&qword_1ED379338, &__block_literal_global_112_0);
      v44 = (id)qword_1ED379340;
      objc_msgSend(v44, "objectForKeyedSubscript:", v11);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", v11);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        if (qword_1ED379348 != -1)
          dispatch_once(&qword_1ED379348, &__block_literal_global_120_2);
        *v52 = objc_retainAutorelease((id)qword_1ED379350);
        if (qword_1ED379358 != -1)
          dispatch_once(&qword_1ED379358, &__block_literal_global_122_1);
        *a5 = objc_retainAutorelease((id)qword_1ED379360);
      }

      v25 = v43;
    }

  }
}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8790];
  v8[0] = *MEMORY[0x1E0CB8AA8];
  v8[1] = v0;
  v9[0] = CFSTR("Open");
  v9[1] = CFSTR("Power");
  v1 = *MEMORY[0x1E0CB8AE0];
  v8[2] = *MEMORY[0x1E0CB89C8];
  v8[3] = v1;
  v9[2] = CFSTR("Power");
  v9[3] = CFSTR("Lock");
  v8[4] = *MEMORY[0x1E0CB8B00];
  v6[0] = &unk_1EA7CC5E0;
  v6[1] = &unk_1EA7CC5F8;
  v7[0] = CFSTR("Home");
  v7[1] = CFSTR("Away");
  v6[2] = &unk_1EA7CC610;
  v6[3] = &unk_1EA7CC628;
  v7[2] = CFSTR("Night");
  v7[3] = CFSTR("Off");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFActionNaturalLanguageExecutionTuple tuple:second:](HFActionNaturalLanguageExecutionTuple, "tuple:second:", CFSTR("Security"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED379320;
  qword_1ED379320 = v4;

}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_2_99()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0CB87C0];
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", &unk_1EA7CC640);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFActionNaturalLanguageExecutionTuple tuple:second:third:](HFActionNaturalLanguageExecutionTuple, "tuple:second:third:", CFSTR("Power"), v12, CFSTR("0"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v16[1] = *MEMORY[0x1E0CB89F0];
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", &unk_1EA7CC640);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFActionNaturalLanguageExecutionTuple tuple:second:third:](HFActionNaturalLanguageExecutionTuple, "tuple:second:third:", CFSTR("Power"), v0, CFSTR("0"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v2;
  v16[2] = *MEMORY[0x1E0CB8AF0];
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", &unk_1EA7CC640);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFActionNaturalLanguageExecutionTuple tuple:second:third:](HFActionNaturalLanguageExecutionTuple, "tuple:second:third:", CFSTR("Open"), v3, CFSTR("1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMinValue:", &unk_1EA7CC658);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFActionNaturalLanguageExecutionTuple tuple:second:third:](HFActionNaturalLanguageExecutionTuple, "tuple:second:third:", CFSTR("Open"), v5, CFSTR("0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED379330;
  qword_1ED379330 = v8;

}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_2_111()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB89F0];
  v3[0] = *MEMORY[0x1E0CB87C0];
  v3[1] = v0;
  v4[0] = CFSTR("Brightness");
  v4[1] = CFSTR("FanSpeed");
  v3[2] = *MEMORY[0x1E0CB8AF0];
  v4[2] = CFSTR("Position");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED379340;
  qword_1ED379340 = v1;

}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_4()
{
  void *v0;

  v0 = (void *)qword_1ED379350;
  qword_1ED379350 = (uint64_t)CFSTR("0");

}

void __126__HFActionNaturalLanguageUtilities_characteristicCaseClassification_valueKey_argumentKeys_fromCharacteristicType_targetValue___block_invoke_6()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("targetValuePercent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379360;
  qword_1ED379360 = v0;

}

+ (id)shortcutsStringKeyWithExecution:(id)a3
{
  return -[HFLocalizableStringKey initWithKey:argumentKeys:]([HFLocalizableStringKey alloc], "initWithKey:argumentKeys:", CFSTR("HFNaturalLanguage_Action_Shortcut"), 0);
}

+ (id)lightbulbStringKeyWithExecution:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFNumberDependentLocalizableStringKey *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  HFLiteralLocalizableStringKey *v26;
  HFNumberDependentLocalizableStringKey *v27;
  HFLocalizableStringKey *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;

  v3 = a3;
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_125_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFNaturalLanguage_Action_MultiLightbulb_%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFNumberDependentLocalizableStringKey initWithKey:]([HFNumberDependentLocalizableStringKey alloc], "initWithKey:", v7);
    -[HFNumberDependentLocalizableStringKey setIntegerArgument:](v8, "setIntegerArgument:", objc_msgSend(v3, "accessoryCount"));
    objc_msgSend(v3, "allInvolvedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_130_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") == 1)
    {
      v33 = v6;
      objc_msgSend(v10, "anyObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_allVisibleServices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "na_filter:", &__block_literal_global_132_0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v13;
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v3, "allInvolvedObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_4;
      v35[3] = &unk_1EA72C4D0;
      v16 = v14;
      v36 = v16;
      objc_msgSend(v15, "na_each:", v35);

      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v7, "stringByAppendingString:", CFSTR("_WithRoom"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = -[HFNumberDependentLocalizableStringKey integerArgument](v8, "integerArgument");
        objc_msgSend(v11, "hf_displayName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(v17, CFSTR("%lu %@"), v19, v20, v21, v22, v23, v24, v18);
        v25 = (id)objc_claimAutoreleasedReturnValue();

        v26 = -[HFLiteralLocalizableStringKey initWithLocalizedString:]([HFLiteralLocalizableStringKey alloc], "initWithLocalizedString:", v25);
      }
      else
      {
        objc_msgSend(v7, "stringByAppendingString:", CFSTR("_AllInRoom"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = [HFLocalizableStringKey alloc];
        if (qword_1ED379368 != -1)
          dispatch_once(&qword_1ED379368, &__block_literal_global_137_1);
        v25 = (id)qword_1ED379370;
        v26 = -[HFLocalizableStringKey initWithKey:argumentKeys:](v28, "initWithKey:argumentKeys:", v17, v25);
      }
      v27 = (HFNumberDependentLocalizableStringKey *)v26;

      objc_msgSend(v11, "hf_displayName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFLocalizableStringKey argumentMap](v27, "argumentMap");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("room"));

      v7 = v17;
      v6 = v33;
    }
    else
    {
      v27 = v8;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

id __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5
    && (objc_msgSend(v5, "characteristic"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "characteristicType"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB89C8]),
        v7,
        v6,
        v8))
  {
    objc_msgSend(v5, "targetValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "hf_associatedAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB9A70];
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A70]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v2, "associatedServiceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v4);

  }
  return v5;
}

void __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_containedServices");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", v3);

}

void __68__HFActionNaturalLanguageUtilities_lightbulbStringKeyWithExecution___block_invoke_6()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("room");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379370;
  qword_1ED379370 = v0;

}

+ (id)genericStringKeyWithNumberOfAccessories:(unint64_t)a3 named:(BOOL)a4 inContext:(BOOL)a5 options:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  HFLiteralLocalizableStringKey *v11;
  HFLiteralLocalizableStringKey *v12;
  id v13;
  HFLiteralLocalizableStringKey *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HFLiteralLocalizableStringKey *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  HFLiteralLocalizableStringKey *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v6 = a5;
  v7 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("HFNaturalLanguage_Action_Generic"), a4, a5, a6);
  v11 = (HFLiteralLocalizableStringKey *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a3 == 1 && v7)
  {
    -[HFLiteralLocalizableStringKey appendString:](v11, "appendString:", CFSTR("_Named"));
    if (qword_1ED379378 != -1)
      dispatch_once(&qword_1ED379378, &__block_literal_global_147);
    v13 = (id)qword_1ED379380;
    goto LABEL_9;
  }
  if (a3 == 1 && v6)
  {
    -[HFLiteralLocalizableStringKey appendString:](v11, "appendString:", CFSTR("_Context"));
    v13 = 0;
LABEL_9:
    +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v12, v13);
    v14 = (HFLiteralLocalizableStringKey *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x2EuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = a1;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@", buf, 0x20u);

    }
    goto LABEL_15;
  }
  HFLogForCategory(0x2EuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v28 = a1;
    v29 = 2112;
    v30 = v18;
    v31 = 2112;
    v32 = v12;
    v33 = 2048;
    v34 = a3;
    _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced generic fallback string with key: %@, numberOfAccessories: %lu", buf, 0x2Au);

  }
  v19 = [HFLiteralLocalizableStringKey alloc];
  HFLocalizedStringWithFormat(v12, CFSTR("%lu"), v20, v21, v22, v23, v24, v25, a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = -[HFLiteralLocalizableStringKey initWithLocalizedString:](v19, "initWithLocalizedString:", v13);
LABEL_15:

  return v14;
}

void __100__HFActionNaturalLanguageUtilities_genericStringKeyWithNumberOfAccessories_named_inContext_options___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379380;
  qword_1ED379380 = v0;

}

+ (id)stringKeyForMediaPlaybackAction:(id)a3 named:(BOOL)a4 options:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v5 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (qword_1ED379388 != -1)
    dispatch_once(&qword_1ED379388, &__block_literal_global_153_0);
  v9 = (id)qword_1ED379390;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_3;
  v25[3] = &unk_1EA7273E0;
  v10 = v8;
  v26 = v10;
  __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_3((uint64_t)v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v5)
    {
      if (qword_1ED379398 != -1)
        dispatch_once(&qword_1ED379398, &__block_literal_global_165_0);
      v12 = (id)qword_1ED3793A0;
      objc_msgSend(v9, "stringByAppendingString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      if (qword_1ED3793A8 != -1)
        dispatch_once(&qword_1ED3793A8, &__block_literal_global_168_0);
      v14 = (id)qword_1ED3793B0;
      v9 = (id)v13;
    }
    else
    {
      v14 = 0;
    }
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v24, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    v20 = v19;
    if (!v18)
      NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v9, v19);
    +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v18, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x2EuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = a1;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@", buf, 0x20u);

    }
  }
  else
  {
    HFLogForCategory(0x2EuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHMMediaPlaybackState(objc_msgSend(v10, "state"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = a1;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Failed to produce classification for playback state %@", buf, 0x20u);

    }
    v17 = 0;
  }

  return v17;
}

void __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED379390;
  qword_1ED379390 = (uint64_t)CFSTR("HFNaturalLanguage_Action_%@");

}

const __CFString *__82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  const __CFString *result;
  __CFString *v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state") - 1;
  if (v2 < 5)
    return off_1EA737810[v2];
  objc_msgSend(*(id *)(a1 + 32), "volume");
  result = (const __CFString *)objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v4 = (__CFString *)result;
    objc_msgSend(*(id *)(a1 + 32), "playbackArchive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 0;
    else
      return CFSTR("ChangeVolume");
  }
  return result;
}

void __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_2_164()
{
  void *v0;

  v0 = (void *)qword_1ED3793A0;
  qword_1ED3793A0 = (uint64_t)CFSTR("_Named");

}

void __82__HFActionNaturalLanguageUtilities_stringKeyForMediaPlaybackAction_named_options___block_invoke_4()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3793B0;
  qword_1ED3793B0 = v0;

}

+ (id)temperatureStringKeyForActions:(id)a3 execution:(id)a4 characteristics:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  const char *aSelector;
  void *v74;
  void *v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  uint8_t buf[4];
  id v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  aSelector = a2;
  if (qword_1ED3793B8 != -1)
    dispatch_once(&qword_1ED3793B8, &__block_literal_global_172_1);
  v12 = (id)qword_1ED3793C0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_3;
  v77[3] = &unk_1EA7375E0;
  v15 = v9;
  v78 = v15;
  v16 = v14;
  v79 = v16;
  v17 = v13;
  v80 = v17;
  objc_msgSend(v12, "na_each:", v77);
  if (qword_1ED3793C8 != -1)
    dispatch_once(&qword_1ED3793C8, &__block_literal_global_175);
  v18 = (id)qword_1ED3793D0;
  if ((objc_msgSend(v18, "isSubsetOfSet:", v17) & 1) != 0)
  {
    v19 = 0;
    v20 = CFSTR("HFNaturalLanguage_Action_Thermostat_%@");
    goto LABEL_55;
  }
  v64 = v18;
  v65 = v17;
  objc_msgSend(v10, "indescribableActionTypes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unionSet:", v16);

  objc_msgSend(a1, "_actionValue:forCharacteristicType:", v15, *MEMORY[0x1E0CB8790]);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_actionValue:forCharacteristicType:", v15, *MEMORY[0x1E0CB8AC0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_actionValue:forCharacteristicType:", v15, *MEMORY[0x1E0CB8AB8]);
  v23 = objc_claimAutoreleasedReturnValue();
  v68 = v12;
  v66 = v16;
  v63 = v22;
  v71 = (void *)v23;
  if (v22)
  {
    v24 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", objc_msgSend(v22, "integerValue"));
  }
  else
  {
    if (!v23 || !objc_msgSend(v72, "BOOLValue"))
    {
LABEL_16:
      v25 = 0;
      v26 = 0;
      v27 = CFSTR("Off");
      goto LABEL_24;
    }
    v24 = +[HFTargetRangeUtilities rangeModeForTargetHeaterCoolerState:](HFTargetRangeUtilities, "rangeModeForTargetHeaterCoolerState:", objc_msgSend(v71, "integerValue"));
  }
  v25 = v24;
  switch(v24)
  {
    case 0uLL:
      goto LABEL_16;
    case 1uLL:
      if (qword_1ED3793F8 != -1)
        dispatch_once(&qword_1ED3793F8, &__block_literal_global_188_0);
      v26 = (id)qword_1ED379400;
      v27 = CFSTR("Heat");
      v25 = 1;
      break;
    case 2uLL:
      if (qword_1ED3793E8 != -1)
        dispatch_once(&qword_1ED3793E8, &__block_literal_global_184);
      v26 = (id)qword_1ED3793F0;
      v27 = CFSTR("Cool");
      v25 = 2;
      break;
    case 3uLL:
      if (qword_1ED3793D8 != -1)
        dispatch_once(&qword_1ED3793D8, &__block_literal_global_180_0);
      v26 = (id)qword_1ED3793E0;
      v27 = CFSTR("Auto");
      v25 = 3;
      break;
    default:
      v27 = 0;
      v26 = 0;
      break;
  }
LABEL_24:
  objc_msgSend(a1, "_relativePercentValueInActions:characteristics:characteristicType:", v15, v11, *MEMORY[0x1E0CB8B08]);
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_relativePercentValueInActions:characteristics:characteristicType:", v15, v11, *MEMORY[0x1E0CB88D8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_relativePercentValueInActions:characteristics:characteristicType:", v15, v11, *MEMORY[0x1E0CB8828]);
  v62 = (void *)v28;
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFTargetRangeUtilities targetRelativePercentValueWithTargetMode:currentMode:rawTargetRelativePercentValue:minimumThresholdRelativePercentValue:maximumThresholdRelativePercentValue:](HFTargetRangeUtilities, "targetRelativePercentValueWithTargetMode:currentMode:rawTargetRelativePercentValue:minimumThresholdRelativePercentValue:maximumThresholdRelativePercentValue:", v25, 0, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v29)
    v31 = 0;
  else
    v31 = objc_msgSend(v26, "containsObject:", CFSTR("targetTemperatureHeat"));
  if (v75)
  {
    v32 = 0;
    if (v30)
    {
LABEL_29:
      v33 = 0;
      goto LABEL_32;
    }
  }
  else
  {
    v32 = objc_msgSend(v26, "containsObject:", CFSTR("targetTemperatureCool"));
    if (v30)
      goto LABEL_29;
  }
  v33 = objc_msgSend(v26, "containsObject:", CFSTR("targetTemperatureTarget"));
LABEL_32:
  v74 = (void *)v30;
  if (((v31 | v32) & 1) != 0 || v33)
  {
    objc_msgSend(CFSTR("HFNaturalLanguage_Action_Thermostat_%@"), "stringByAppendingString:", CFSTR("_NoTemp"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v26, "mutableCopy");
    objc_msgSend(v34, "removeObject:", CFSTR("targetTemperatureHeat"));
    objc_msgSend(v34, "removeObject:", CFSTR("targetTemperatureCool"));
    objc_msgSend(v34, "removeObject:", CFSTR("targetTemperatureTarget"));
    v35 = objc_msgSend(v34, "copy");

    v26 = (id)v35;
  }
  else
  {
    v20 = CFSTR("HFNaturalLanguage_Action_Thermostat_%@");
  }
  v70 = v10;
  if (objc_msgSend(v10, "named"))
  {
    -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", CFSTR("_Named"));
    v36 = objc_claimAutoreleasedReturnValue();

    v87[0] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v26)
      v39 = v26;
    else
      v39 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v39);
    v40 = objc_claimAutoreleasedReturnValue();

    v26 = (id)v40;
    v20 = (__CFString *)v36;
  }
  v59 = a1;
  v76 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%@"), &v76, v27);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v76;
  v43 = v42;
  if (!v41)
    NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v20, v42);
  v60 = v43;
  v69 = v11;
  +[HFLocalizableStringKey stringKeyWithKey:argumentKeys:](HFLocalizableStringKey, "stringKeyWithKey:argumentKeys:", v41, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "temperatureFormatter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "setInputIsCelsius:", 1);
  v46 = v75;
  if (v29)
  {
    objc_msgSend(v29, "value");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringForObjectValue:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = 0;
  }
  v61 = v29;
  if (v75)
  {
    objc_msgSend(v75, "value");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringForObjectValue:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }
  v67 = v15;
  if (v74)
  {
    objc_msgSend(v74, "value");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringForObjectValue:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  objc_msgSend(v19, "argumentMap");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "na_safeSetObject:forKey:", v48, CFSTR("targetTemperatureHeat"));

  objc_msgSend(v19, "argumentMap");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "na_safeSetObject:forKey:", v50, CFSTR("targetTemperatureCool"));

  objc_msgSend(v19, "argumentMap");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "na_safeSetObject:forKey:", v52, CFSTR("targetTemperatureTarget"));

  HFLogForCategory(0x2EuLL);
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(aSelector);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v82 = v59;
    v83 = 2112;
    v84 = v57;
    v85 = 2112;
    v86 = v19;
    _os_log_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_DEFAULT, "%@:%@ Produced string key %@", buf, 0x20u);

    v46 = v75;
  }

  v11 = v69;
  v10 = v70;
  v15 = v67;
  v12 = v68;
  v17 = v65;
  v16 = v66;
  v18 = v64;
LABEL_55:

  return v19;
}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8AB8];
  v7[0] = *MEMORY[0x1E0CB8AC0];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0CB8B08];
  v7[2] = *MEMORY[0x1E0CB8790];
  v7[3] = v2;
  v3 = *MEMORY[0x1E0CB8828];
  v7[4] = *MEMORY[0x1E0CB88D8];
  v7[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED3793C0;
  qword_1ED3793C0 = v5;

}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_3(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count") != 1)
  {
    v5 = a1 + 5;
    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v5 = a1 + 6;
LABEL_6:
    objc_msgSend(*v5, "addObject:", v6);
  }

}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_5()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8AB8];
  v5[0] = *MEMORY[0x1E0CB8AC0];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3793D0;
  qword_1ED3793D0 = v3;

}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_7()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("targetTemperatureHeat");
  v2[1] = CFSTR("targetTemperatureCool");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3793E0;
  qword_1ED3793E0 = v0;

}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_9()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("targetTemperatureTarget");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3793F0;
  qword_1ED3793F0 = v0;

}

void __93__HFActionNaturalLanguageUtilities_temperatureStringKeyForActions_execution_characteristics___block_invoke_11()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("targetTemperatureTarget");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379400;
  qword_1ED379400 = v0;

}

+ (id)_actionTypeForAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;

  v3 = a3;
  objc_msgSend(v3, "hf_affectedCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "hf_affectedCharacteristic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "characteristicType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (objc_class *)objc_opt_class();

    NSStringFromClass(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_valueForAction:(id)a3 withActionType:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
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
    objc_msgSend(v7, "targetValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

+ (BOOL)_shouldIgnoreActions:(id)a3 withCharacteristicType:(id)a4 execution:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "na_map:", &__block_literal_global_191);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "allInvolvedObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_2;
    v19 = &unk_1EA7376A8;
    v20 = v7;
    v11 = v9;
    v21 = v11;
    v12 = objc_msgSend(v10, "na_all:", &v16) ^ 1;

    v13 = objc_msgSend(v11, "count", v16, v17, v18, v19);
  }
  else
  {
    v13 = objc_msgSend(v9, "count");
    LOBYTE(v12) = 1;
  }
  if (v13)
    v14 = v12;
  else
    v14 = 0;

  return v14;
}

uint64_t __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_affectedCharacteristic");
}

uint64_t __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "hf_containedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_3;
  v7[3] = &unk_1EA72DFA0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "intersectsSet:", *(_QWORD *)(a1 + 40)))
    v5 = objc_msgSend(v4, "isEqualToSet:", *(_QWORD *)(a1 + 40));
  else
    v5 = 1;

  return v5;
}

uint64_t __90__HFActionNaturalLanguageUtilities__shouldIgnoreActions_withCharacteristicType_execution___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_characteristicOfType:", *(_QWORD *)(a1 + 32));
}

+ (id)_relativePercentValueInActions:(id)a3 characteristics:(id)a4 characteristicType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HFRelativePercentValue *v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "_actionValue:forCharacteristicType:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__HFActionNaturalLanguageUtilities__relativePercentValueInActions_characteristics_characteristicType___block_invoke;
  v15[3] = &unk_1EA72BB50;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v13 = -[HFRelativePercentValue initWithValue:forCharacteristic:]([HFRelativePercentValue alloc], "initWithValue:forCharacteristic:", v10, v12);
  else
    v13 = 0;

  return v13;
}

uint64_t __102__HFActionNaturalLanguageUtilities__relativePercentValueInActions_characteristics_characteristicType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)_actionValue:(id)a3 forCharacteristicType:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = objc_msgSend(v4, "count");
  if (v5 == 1)
  {
    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v5 == 1)
  return v9;
}

+ (BOOL)actionTypesMissingDescriptionShouldCauseFailure:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_characteristicTypesFailingMismatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intersectsSet:", v4);

  return v6;
}

+ (id)_characteristicTypesFailingMismatch
{
  if (qword_1ED379408 != -1)
    dispatch_once(&qword_1ED379408, &__block_literal_global_197);
  return (id)qword_1ED379410;
}

void __71__HFActionNaturalLanguageUtilities__characteristicTypesFailingMismatch__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8790];
  v8 = *MEMORY[0x1E0CB89C8];
  v9 = v1;
  v2 = *MEMORY[0x1E0CB8AC0];
  v10 = *MEMORY[0x1E0CB8AB8];
  v11 = v2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5, v8, v9, v10, v11);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED379410;
  qword_1ED379410 = v6;

}

+ (id)_actionTypeDescriptionPriority
{
  if (qword_1ED379418 != -1)
    dispatch_once(&qword_1ED379418, &__block_literal_global_199_0);
  return (id)qword_1ED379420;
}

void __66__HFActionNaturalLanguageUtilities__actionTypeDescriptionPriority__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB87C0], *MEMORY[0x1E0CB89F0], 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB89C8], *MEMORY[0x1E0CB8790], 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379420;
  qword_1ED379420 = v2;

}

@end
