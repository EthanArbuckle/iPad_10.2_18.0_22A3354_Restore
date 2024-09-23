id ACHYearMonthDayStringFromDateComponents(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDD17C8];
    v2 = a1;
    v3 = objc_msgSend(v2, "year");
    v4 = objc_msgSend(v2, "month");
    v5 = objc_msgSend(v2, "day");

    objc_msgSend(v1, "stringWithFormat:", CFSTR("%04ld-%02ld-%02ld"), v3, v4, v5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id ACHYearMonthDayDateComponentsFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v4 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setYear:", objc_msgSend(v5, "integerValue"));

    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMonth:", objc_msgSend(v6, "integerValue"));

    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDay:", objc_msgSend(v7, "integerValue"));

    if (objc_msgSend(v4, "year") && objc_msgSend(v4, "month") && objc_msgSend(v4, "day"))
      goto LABEL_8;

  }
  v4 = 0;
LABEL_8:

LABEL_10:
  return v4;
}

id ACHDateComponentsForYearMonthDay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v6, "setYear:", a1);
  objc_msgSend(v6, "setMonth:", a2);
  objc_msgSend(v6, "setDay:", a3);
  return v6;
}

id ACHTemplateAlertDatesFromString(void *a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("|"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        ACHYearMonthDayDateComponentsFromString(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

uint64_t ACHTemplateAvailableSuffixesFromString(void *a1, const char *a2)
{
  return objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("|"));
}

uint64_t ACHTemplateAvailableCountryCodesFromString(void *a1, const char *a2)
{
  return objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("|"));
}

ACHCodableTemplate *ACHCodableFromTemplate(void *a1)
{
  id v1;
  ACHCodableTemplate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  ACHCodableSyncIdentity *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v1 = a1;
  v2 = objc_alloc_init(ACHCodableTemplate);
  -[ACHCodableTemplate setKey:](v2, "setKey:", objc_msgSend(v1, "key"));
  objc_msgSend(v1, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  -[ACHCodableTemplate setUniqueName:](v2, "setUniqueName:", v4);

  -[ACHCodableTemplate setVersion:](v2, "setVersion:", objc_msgSend(v1, "version"));
  -[ACHCodableTemplate setMinimumEngineVersion:](v2, "setMinimumEngineVersion:", objc_msgSend(v1, "minimumEngineVersion"));
  objc_msgSend(v1, "createdDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[ACHCodableTemplate setCreatedDate:](v2, "setCreatedDate:");

  -[ACHCodableTemplate setCreatorDevice:](v2, "setCreatorDevice:", objc_msgSend(v1, "creatorDevice"));
  objc_msgSend(v1, "sourceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[ACHCodableTemplate setSourceName:](v2, "setSourceName:", v7);

  objc_msgSend(v1, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[ACHCodableTemplate setPredicate:](v2, "setPredicate:", v9);

  objc_msgSend(v1, "gracePredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[ACHCodableTemplate setGracePredicate:](v2, "setGracePredicate:", v11);

  objc_msgSend(v1, "valueExpression");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[ACHCodableTemplate setValueExpression:](v2, "setValueExpression:", v13);

  objc_msgSend(v1, "graceValueExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[ACHCodableTemplate setGraceValueExpression:](v2, "setGraceValueExpression:", v15);

  objc_msgSend(v1, "progressExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  -[ACHCodableTemplate setProgressExpression:](v2, "setProgressExpression:", v17);

  objc_msgSend(v1, "graceProgressExpression");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  -[ACHCodableTemplate setGraceProgressExpression:](v2, "setGraceProgressExpression:", v19);

  objc_msgSend(v1, "goalExpression");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  -[ACHCodableTemplate setGoalExpression:](v2, "setGoalExpression:", v21);

  objc_msgSend(v1, "graceGoalExpression");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  -[ACHCodableTemplate setGraceGoalExpression:](v2, "setGraceGoalExpression:", v23);

  -[ACHCodableTemplate setTriggers:](v2, "setTriggers:", objc_msgSend(v1, "triggers"));
  -[ACHCodableTemplate setEarnLimit:](v2, "setEarnLimit:", objc_msgSend(v1, "earnLimit"));
  objc_msgSend(v1, "visibilityPredicate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  -[ACHCodableTemplate setVisibilityPredicate:](v2, "setVisibilityPredicate:", v25);

  objc_msgSend(v1, "graceVisibilityPredicate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  -[ACHCodableTemplate setGraceVisibilityPredicate:](v2, "setGraceVisibilityPredicate:", v27);

  objc_msgSend(v1, "visibilityStart");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setVisibilityStartDate:](v2, "setVisibilityStartDate:", v29);

  objc_msgSend(v1, "visibilityEnd");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setVisibilityEndDate:](v2, "setVisibilityEndDate:", v31);

  objc_msgSend(v1, "availabilityPredicate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copy");
  -[ACHCodableTemplate setAvailabilityPredicate:](v2, "setAvailabilityPredicate:", v33);

  objc_msgSend(v1, "availabilityStart");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setAvailabilityStartDate:](v2, "setAvailabilityStartDate:", v35);

  objc_msgSend(v1, "availabilityEnd");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setAvailabilityEndDate:](v2, "setAvailabilityEndDate:", v37);

  objc_msgSend(v1, "availableCountryCodes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAvailableCountryCodesStringFromStrings(v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setAvailableCountryCodes:](v2, "setAvailableCountryCodes:", v40);

  objc_msgSend(v1, "alertabilityPredicate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  -[ACHCodableTemplate setAlertabilityPredicate:](v2, "setAlertabilityPredicate:", v42);

  objc_msgSend(v1, "alertDates");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAlertDatesStringFromDates(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setAlertDates:](v2, "setAlertDates:", v44);

  -[ACHCodableTemplate setDuplicateRemovalStrategy:](v2, "setDuplicateRemovalStrategy:", objc_msgSend(v1, "duplicateRemovalStrategy"));
  -[ACHCodableTemplate setDuplicateRemovalCalendarUnit:](v2, "setDuplicateRemovalCalendarUnit:", objc_msgSend(v1, "duplicateRemovalCalendarUnit"));
  -[ACHCodableTemplate setEarnDateStrategy:](v2, "setEarnDateStrategy:", objc_msgSend(v1, "earnDateStrategy"));
  objc_msgSend(v1, "canonicalUnit");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "unitString");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setCanonicalUnit:](v2, "setCanonicalUnit:", v46);

  -[ACHCodableTemplate setDisplayOrder:](v2, "setDisplayOrder:", objc_msgSend(v1, "displayOrder"));
  -[ACHCodableTemplate setDisplaysEarnedInstanceCount:](v2, "setDisplaysEarnedInstanceCount:", objc_msgSend(v1, "displaysEarnedInstanceCount"));
  objc_msgSend(v1, "availableSuffixes");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateAvailableSuffixesStringFromStrings(v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setAvailableSuffixes:](v2, "setAvailableSuffixes:", v49);

  -[ACHCodableTemplate setAvailableOnPairedDevice:](v2, "setAvailableOnPairedDevice:", objc_msgSend(v1, "availableOnPairedDevice"));
  -[ACHCodableTemplate setMobileAssetVersion:](v2, "setMobileAssetVersion:", objc_msgSend(v1, "mobileAssetVersion"));
  objc_msgSend(v1, "dailyTarget");
  -[ACHCodableTemplate setDailyTarget:](v2, "setDailyTarget:");
  objc_msgSend(v1, "dailyTargetCanonicalUnit");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "unitString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setDailyTargetCanonicalUnit:](v2, "setDailyTargetCanonicalUnit:", v51);

  objc_msgSend(v1, "syncIdentity");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v53 = objc_alloc_init(ACHCodableSyncIdentity);
    objc_msgSend(v1, "syncIdentity");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "hardwareIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableSyncIdentity setHardwareIdentifier:](v53, "setHardwareIdentifier:", v55);

    objc_msgSend(v1, "syncIdentity");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "databaseIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableSyncIdentity setDatabaseIdentifier:](v53, "setDatabaseIdentifier:", v57);

    objc_msgSend(v1, "syncIdentity");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "instanceDiscriminator");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableSyncIdentity setInstanceDiscriminator:](v53, "setInstanceDiscriminator:", v59);

    -[ACHCodableTemplate setSyncIdentity:](v2, "setSyncIdentity:", v53);
  }
  objc_msgSend(v1, "prerequisiteTemplateName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableTemplate setPrerequisiteTemplateName:](v2, "setPrerequisiteTemplateName:", v60);

  return v2;
}

id ACHLogDefault()
{
  if (ACHLogDefault_onceToken != -1)
    dispatch_once(&ACHLogDefault_onceToken, &__block_literal_global_0);
  return (id)ACHLogDefault_category;
}

id ACHLogAssets()
{
  if (ACHLogAssets_onceToken != -1)
    dispatch_once(&ACHLogAssets_onceToken, &__block_literal_global_186);
  return (id)ACHLogAssets_category;
}

uint64_t ACHTemplateAvailableSuffixesStringFromStrings(void *a1, const char *a2)
{
  return objc_msgSend(a1, "componentsJoinedByString:", CFSTR("|"));
}

uint64_t ACHTemplateAvailableCountryCodesStringFromStrings(void *a1, const char *a2)
{
  return objc_msgSend(a1, "componentsJoinedByString:", CFSTR("|"));
}

id ACHTemplateAlertDatesStringFromDates(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        ACHYearMonthDayStringFromDateComponents(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL ACHAchievementColorsAreEqual(float a1, float a2, float a3, float a4, float a5, float a6)
{
  float v6;
  float v7;
  float v8;
  float v9;

  v6 = a1 - a4;
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 >= 0.00000011921)
    return 0;
  v7 = a2 - a5;
  v8 = -(float)(a2 - a5);
  if (v7 < 0.0)
    v7 = v8;
  if (v7 >= 0.00000011921)
    return 0;
  v9 = a3 - a6;
  if ((float)(a3 - a6) < 0.0)
    v9 = -(float)(a3 - a6);
  return v9 < 0.00000011921;
}

uint64_t ACHTemplateIsMonthlyChallenge(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, CFSTR("MonthlyChallenges"));
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return 1;
}

id ACHHKQuantityWithValueAndUnit(void *a1, void *a2)
{
  id v3;
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v7, "quantityWithUnit:doubleValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t ACHTemplateSourceNameIsEqualToIdentifier(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(a1, "sourceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  return v5;
}

uint64_t ACHTemplateIsRemote(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, CFSTR("Remote"));
}

float ACHAchievementColorFromACHCodableColor(void *a1)
{
  id v1;
  double v2;
  float v3;

  v1 = a1;
  objc_msgSend(v1, "red");
  v3 = v2;
  objc_msgSend(v1, "green");
  objc_msgSend(v1, "blue");

  return v3;
}

ACHCodableAchievement *ACHCodableFromAchievement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  ACHCodableAchievement *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  float v42;
  void *v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  ACHCodablePlaceholderValue *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  ACHCodableAchievement *v77;
  id v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ACHCodableFromTemplate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  objc_msgSend(v1, "earnedInstances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v85 != v8)
          objc_enumerationMutation(v5);
        ACHCodableFromEarnedInstance(*(void **)(*((_QWORD *)&v84 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
    }
    while (v7);
  }

  v11 = objc_alloc_init(ACHCodableAchievement);
  -[ACHCodableAchievement setAchievementTemplate:](v11, "setAchievementTemplate:", v3);
  objc_msgSend(v1, "relevantEarnedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v1, "relevantEarnedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ACHCodableFromEarnedInstance(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableAchievement setRelevantEarnedInstance:](v11, "setRelevantEarnedInstance:", v14);

  }
  -[ACHCodableAchievement setEarnedInstanceCount:](v11, "setEarnedInstanceCount:", objc_msgSend(v1, "earnedInstanceCount"));
  -[ACHCodableAchievement setEarnedInstances:](v11, "setEarnedInstances:", v4);
  objc_msgSend(v1, "localizationBundleURLString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setLocalizationBundleURL:](v11, "setLocalizationBundleURL:", v15);

  objc_msgSend(v1, "resourceBundleURLString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setResourceBundleURL:](v11, "setResourceBundleURL:", v16);

  objc_msgSend(v1, "propertyListBundleURLString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setPropertyListBundleURL:](v11, "setPropertyListBundleURL:", v17);

  objc_msgSend(v1, "stickerBundleURLString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setStickerBundleURL:](v11, "setStickerBundleURL:", v18);

  v19 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v1, "textureFilenames");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);
  -[ACHCodableAchievement setTextureFilenames:](v11, "setTextureFilenames:", v21);

  objc_msgSend(v1, "glyphTextureFilename");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setGlyphTextureFilename:](v11, "setGlyphTextureFilename:", v22);

  objc_msgSend(v1, "glyphPositionOffsetX");
  -[ACHCodableAchievement setGlyphPositionOffsetX:](v11, "setGlyphPositionOffsetX:");
  objc_msgSend(v1, "glyphPositionOffsetY");
  -[ACHCodableAchievement setGlyphPositionOffsetY:](v11, "setGlyphPositionOffsetY:");
  v23 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v1, "badgeModelFilenames");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);
  -[ACHCodableAchievement setBadgeModelFilenames:](v11, "setBadgeModelFilenames:", v25);

  objc_msgSend(v1, "glyphTextureScale");
  -[ACHCodableAchievement setGlyphTextureScale:](v11, "setGlyphTextureScale:");
  objc_msgSend(v1, "badgeShapeName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setBadgeShapeName:](v11, "setBadgeShapeName:", v26);

  objc_msgSend(v1, "badgeMetalColor");
  ACHCodableColorFromACHAchievementColor(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setBadgeMetalColor:](v11, "setBadgeMetalColor:", v30);

  -[ACHCodableAchievement setBadgeUsesFullColorEnamel:](v11, "setBadgeUsesFullColorEnamel:", objc_msgSend(v1, "badgeUsesFullColorEnamel"));
  -[ACHCodableAchievement setUnearnedUsesTwoToneEnamel:](v11, "setUnearnedUsesTwoToneEnamel:", objc_msgSend(v1, "unearnedUsesTwoToneEnamel"));
  -[ACHCodableAchievement setFaceHasMetalInlay:](v11, "setFaceHasMetalInlay:", objc_msgSend(v1, "faceHasMetalInlay"));
  objc_msgSend(v1, "badgeEnamelColor");
  ACHCodableColorFromACHAchievementColor(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setBadgeEnamelColor:](v11, "setBadgeEnamelColor:", v34);

  objc_msgSend(v1, "section");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievement setSection:](v11, "setSection:", v35);

  -[ACHCodableAchievement setBadgeUsesTriColorEnamel:](v11, "setBadgeUsesTriColorEnamel:", objc_msgSend(v1, "badgeUsesTriColorEnamel"));
  if (objc_msgSend(v1, "badgeUsesTriColorEnamel"))
  {
    objc_msgSend(v1, "enamelTriColor1");
    ACHCodableColorFromACHAchievementColor(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableAchievement setEnamelTriColor1:](v11, "setEnamelTriColor1:", v39);

    objc_msgSend(v1, "enamelTriColor2");
    ACHCodableColorFromACHAchievementColor(v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableAchievement setEnamelTriColor2:](v11, "setEnamelTriColor2:", v43);

    objc_msgSend(v1, "enamelTriColor3");
    ACHCodableColorFromACHAchievementColor(v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableAchievement setEnamelTriColor3:](v11, "setEnamelTriColor3:", v47);

  }
  objc_msgSend(v1, "progress");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v1, "progress");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "template");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "canonicalUnit");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "doubleValueForUnit:", v51);
    -[ACHCodableAchievement setProgressValue:](v11, "setProgressValue:");

    objc_msgSend(v1, "template");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "canonicalUnit");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "unitString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableAchievement setProgressUnitString:](v11, "setProgressUnitString:", v54);

  }
  objc_msgSend(v1, "goal");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v1, "goal");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "template");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "canonicalUnit");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValueForUnit:", v58);
    -[ACHCodableAchievement setGoalValue:](v11, "setGoalValue:");

    objc_msgSend(v1, "template");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "canonicalUnit");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "unitString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableAchievement setGoalUnitString:](v11, "setGoalUnitString:", v61);

  }
  objc_msgSend(v1, "customPlaceholderValues");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v77 = v11;
    v78 = v4;
    v79 = v3;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v1, "customPlaceholderValues");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v81;
      v67 = (void *)MEMORY[0x24BDBD1A8];
      do
      {
        v68 = 0;
        v69 = v67;
        do
        {
          if (*(_QWORD *)v81 != v66)
            objc_enumerationMutation(v63);
          v70 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v68);
          v71 = objc_alloc_init(ACHCodablePlaceholderValue);
          -[ACHCodablePlaceholderValue setPlaceholder:](v71, "setPlaceholder:", v70);
          objc_msgSend(v1, "customPlaceholderValues");
          v72 = v1;
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", v70);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACHCodablePlaceholderValue setValue:](v71, "setValue:", v74);

          v1 = v72;
          objc_msgSend(v69, "arrayByAddingObject:", v71);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          ++v68;
          v69 = v67;
        }
        while (v65 != v68);
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      }
      while (v65);
    }
    else
    {
      v67 = (void *)MEMORY[0x24BDBD1A8];
    }

    v75 = (void *)objc_msgSend(v67, "mutableCopy");
    v11 = v77;
    -[ACHCodableAchievement setCustomPlaceholderValues:](v77, "setCustomPlaceholderValues:", v75);

    v4 = v78;
    v3 = v79;
  }
  -[ACHCodableAchievement setBadgeModelVersion:](v11, "setBadgeModelVersion:", objc_msgSend(v1, "badgeModelVersion"));
  -[ACHCodableAchievement setPrerequisiteMet:](v11, "setPrerequisiteMet:", objc_msgSend(v1, "prerequisiteMet"));

  return v11;
}

ACHCodableColor *ACHCodableColorFromACHAchievementColor(float a1, float a2, float a3)
{
  ACHCodableColor *v6;

  v6 = objc_alloc_init(ACHCodableColor);
  -[ACHCodableColor setRed:](v6, "setRed:", a1);
  -[ACHCodableColor setGreen:](v6, "setGreen:", a2);
  -[ACHCodableColor setBlue:](v6, "setBlue:", a3);
  return v6;
}

uint64_t ACHCodableAchievementArrayReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ACHCodableAchievement *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ACHCodableAchievement);
        objc_msgSend(a1, "addAchievements:", v17);
        if (!PBReaderPlaceMark() || (ACHCodableAchievementReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACHCodableAchievementReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  ACHCodableTemplate *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  BOOL v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(ACHCodableTemplate);
        objc_storeStrong((id *)(a1 + 64), v18);
        if (PBReaderPlaceMark() && (ACHCodableTemplateReadFrom((uint64_t)v18, a2) & 1) != 0)
          goto LABEL_113;
        goto LABEL_165;
      case 2u:
        v18 = objc_alloc_init(ACHCodableEarnedInstance);
        objc_msgSend((id)a1, "addEarnedInstances:", v18);
        goto LABEL_88;
      case 3u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 160;
        goto LABEL_104;
      case 4u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 192;
        goto LABEL_104;
      case 5u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 208;
        goto LABEL_104;
      case 6u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 96;
        goto LABEL_104;
      case 7u:
        v18 = objc_alloc_init(ACHCodableColor);
        v22 = 80;
        goto LABEL_77;
      case 8u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_WORD *)(a1 + 240) |= 0x80u;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              v15 = v24++ >= 9;
              if (v15)
              {
                v25 = 0;
                goto LABEL_125;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_125:
        v83 = v25 != 0;
        v84 = 232;
        goto LABEL_151;
      case 9u:
        v18 = objc_alloc_init(ACHCodableColor);
        v22 = 72;
        goto LABEL_77;
      case 0xAu:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 176;
        goto LABEL_104;
      case 0xBu:
        *(_WORD *)(a1 + 240) |= 0x40u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v32 = 0;
        }
        v86 = 56;
        goto LABEL_162;
      case 0xCu:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 168;
        goto LABEL_104;
      case 0xDu:
        *(_WORD *)(a1 + 240) |= 0x20u;
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
          *(_QWORD *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v32 = 0;
        }
        v86 = 48;
        goto LABEL_162;
      case 0xEu:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 152;
        goto LABEL_104;
      case 0xFu:
        v18 = objc_alloc_init(ACHCodablePlaceholderValue);
        objc_msgSend((id)a1, "addCustomPlaceholderValues:", v18);
        if (!PBReaderPlaceMark() || !ACHCodablePlaceholderValueReadFrom((uint64_t)v18, a2))
          goto LABEL_165;
        goto LABEL_113;
      case 0x10u:
        PBReaderReadString();
        v18 = (ACHCodableTemplate *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend((id)a1, "addTextureFilenames:", v18);
        goto LABEL_114;
      case 0x11u:
        v35 = 0;
        v36 = 0;
        v37 = 0;
        *(_WORD *)(a1 + 240) |= 0x800u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          v40 = v39 + 1;
          if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              v15 = v36++ >= 9;
              if (v15)
              {
                v37 = 0;
                goto LABEL_129;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v37 = 0;
LABEL_129:
        v83 = v37 != 0;
        v84 = 236;
        goto LABEL_151;
      case 0x12u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 200;
        goto LABEL_104;
      case 0x13u:
        v42 = 0;
        v43 = 0;
        v44 = 0;
        *(_WORD *)(a1 + 240) |= 0x200u;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          v47 = v46 + 1;
          if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v44 |= (unint64_t)(v48 & 0x7F) << v42;
            if (v48 < 0)
            {
              v42 += 7;
              v15 = v43++ >= 9;
              if (v15)
              {
                v44 = 0;
                goto LABEL_133;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v44 = 0;
LABEL_133:
        v83 = v44 != 0;
        v84 = 234;
        goto LABEL_151;
      case 0x14u:
        v49 = 0;
        v50 = 0;
        v51 = 0;
        *(_WORD *)(a1 + 240) |= 0x100u;
        while (2)
        {
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          v54 = v53 + 1;
          if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v54;
            v51 |= (unint64_t)(v55 & 0x7F) << v49;
            if (v55 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                v51 = 0;
                goto LABEL_137;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v51 = 0;
LABEL_137:
        v83 = v51 != 0;
        v84 = 233;
        goto LABEL_151;
      case 0x15u:
        v18 = objc_alloc_init(ACHCodableColor);
        v22 = 120;
        goto LABEL_77;
      case 0x16u:
        v18 = objc_alloc_init(ACHCodableColor);
        v22 = 128;
        goto LABEL_77;
      case 0x17u:
        v18 = objc_alloc_init(ACHCodableColor);
        v22 = 136;
LABEL_77:
        objc_storeStrong((id *)(a1 + v22), v18);
        if (!PBReaderPlaceMark() || !ACHCodableColorReadFrom((uint64_t)v18, a2))
          goto LABEL_165;
        goto LABEL_113;
      case 0x18u:
        v56 = 0;
        v57 = 0;
        v58 = 0;
        *(_WORD *)(a1 + 240) |= 1u;
        while (2)
        {
          v59 = *v3;
          v60 = *(_QWORD *)(a2 + v59);
          v61 = v60 + 1;
          if (v60 == -1 || v61 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
            *(_QWORD *)(a2 + v59) = v61;
            v58 |= (unint64_t)(v62 & 0x7F) << v56;
            if (v62 < 0)
            {
              v56 += 7;
              v15 = v57++ >= 9;
              if (v15)
              {
                v58 = 0;
                goto LABEL_141;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v58 = 0;
LABEL_141:
        v85 = 8;
        goto LABEL_146;
      case 0x19u:
        v18 = objc_alloc_init(ACHCodableEarnedInstance);
        objc_storeStrong((id *)(a1 + 184), v18);
LABEL_88:
        if (!PBReaderPlaceMark() || (ACHCodableEarnedInstanceReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_165;
        goto LABEL_113;
      case 0x1Au:
        v63 = 0;
        v64 = 0;
        v58 = 0;
        *(_WORD *)(a1 + 240) |= 2u;
        while (2)
        {
          v65 = *v3;
          v66 = *(_QWORD *)(a2 + v65);
          v67 = v66 + 1;
          if (v66 == -1 || v67 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
            *(_QWORD *)(a2 + v65) = v67;
            v58 |= (unint64_t)(v68 & 0x7F) << v63;
            if (v68 < 0)
            {
              v63 += 7;
              v15 = v64++ >= 9;
              if (v15)
              {
                v58 = 0;
                goto LABEL_145;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v58 = 0;
LABEL_145:
        v85 = 16;
LABEL_146:
        *(_QWORD *)(a1 + v85) = v58;
        goto LABEL_163;
      case 0x1Bu:
        PBReaderReadString();
        v18 = (ACHCodableTemplate *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend((id)a1, "addBadgeModelFilenames:", v18);
        goto LABEL_114;
      case 0x1Cu:
        *(_WORD *)(a1 + 240) |= 0x10u;
        v69 = *v3;
        v70 = *(_QWORD *)(a2 + v69);
        if (v70 <= 0xFFFFFFFFFFFFFFF7 && v70 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v70);
          *(_QWORD *)(a2 + v69) = v70 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v32 = 0;
        }
        v86 = 40;
        goto LABEL_162;
      case 0x1Du:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 144;
LABEL_104:
        v71 = *(void **)(a1 + v21);
        *(_QWORD *)(a1 + v21) = v20;

        goto LABEL_163;
      case 0x1Eu:
        *(_WORD *)(a1 + 240) |= 4u;
        v72 = *v3;
        v73 = *(_QWORD *)(a2 + v72);
        if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v73);
          *(_QWORD *)(a2 + v72) = v73 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v32 = 0;
        }
        v86 = 24;
        goto LABEL_162;
      case 0x1Fu:
        *(_WORD *)(a1 + 240) |= 8u;
        v74 = *v3;
        v75 = *(_QWORD *)(a2 + v74);
        if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v75);
          *(_QWORD *)(a2 + v74) = v75 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v32 = 0;
        }
        v86 = 32;
LABEL_162:
        *(_QWORD *)(a1 + v86) = v32;
        goto LABEL_163;
      case 0x20u:
        v18 = objc_alloc_init(ACHCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 216), v18);
        if (PBReaderPlaceMark() && ACHCodableSyncIdentityReadFrom((uint64_t)v18, a2))
        {
LABEL_113:
          PBReaderRecallMark();
LABEL_114:

LABEL_163:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_165:

        return 0;
      case 0x21u:
        v76 = 0;
        v77 = 0;
        v78 = 0;
        *(_WORD *)(a1 + 240) |= 0x400u;
        while (2)
        {
          v79 = *v3;
          v80 = *(_QWORD *)(a2 + v79);
          v81 = v80 + 1;
          if (v80 == -1 || v81 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v82 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v80);
            *(_QWORD *)(a2 + v79) = v81;
            v78 |= (unint64_t)(v82 & 0x7F) << v76;
            if (v82 < 0)
            {
              v76 += 7;
              v15 = v77++ >= 9;
              if (v15)
              {
                v78 = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v78 = 0;
LABEL_150:
        v83 = v78 != 0;
        v84 = 235;
LABEL_151:
        *(_BYTE *)(a1 + v84) = v83;
        goto LABEL_163;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_163;
    }
  }
}

BOOL ACHCodableColorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int *v26;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v22 = *v3;
        v23 = *(_QWORD *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        v26 = &OBJC_IVAR___ACHCodableColor__blue;
        goto LABEL_38;
      }
      if ((_DWORD)v18 == 2)
        break;
      if ((_DWORD)v18 == 1)
      {
        *(_BYTE *)(a1 + 32) |= 4u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        v26 = &OBJC_IVAR___ACHCodableColor__red;
LABEL_38:
        *(_QWORD *)(a1 + *v26) = v21;
        goto LABEL_39;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_39:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 32) |= 2u;
    v24 = *v3;
    v25 = *(_QWORD *)(a2 + v24);
    if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
      *(_QWORD *)(a2 + v24) = v25 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v21 = 0;
    }
    v26 = &OBJC_IVAR___ACHCodableColor__green;
    goto LABEL_38;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACHCodableTemplateReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  char v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  uint64_t v105;
  unint64_t v106;
  ACHCodableSyncIdentity *v107;
  void *v108;
  uint64_t v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 272;
        goto LABEL_145;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x1000u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_149;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_149:
        v109 = 104;
        goto LABEL_199;
      case 3u:
        v28 = 0;
        v29 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x200u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v23 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_153;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_153:
        v109 = 80;
        goto LABEL_199;
      case 4u:
        *(_WORD *)(a1 + 316) |= 1u;
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
          *(_QWORD *)(a2 + v34) = v35 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v36 = 0;
        }
        v112 = 8;
        goto LABEL_206;
      case 5u:
        v37 = 0;
        v38 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 2u;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          v41 = v40 + 1;
          if (v40 == -1 || v41 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v41;
            v23 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              v15 = v38++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_157;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_157:
        v109 = 16;
        goto LABEL_199;
      case 6u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 256;
        goto LABEL_145;
      case 7u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 232;
        goto LABEL_145;
      case 8u:
        v43 = 0;
        v44 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x800u;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          v47 = v46 + 1;
          if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v23 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              v15 = v44++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_161;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_161:
        v109 = 96;
        goto LABEL_199;
      case 9u:
        v49 = 0;
        v50 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x80u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v23 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_165:
        v109 = 64;
        goto LABEL_199;
      case 0xAu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 296;
        goto LABEL_145;
      case 0xBu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 304;
        goto LABEL_145;
      case 0xCu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 288;
        goto LABEL_145;
      case 0xDu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 136;
        goto LABEL_145;
      case 0xEu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 144;
        goto LABEL_145;
      case 0xFu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 128;
        goto LABEL_145;
      case 0x10u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 120;
        goto LABEL_145;
      case 0x11u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 112;
        goto LABEL_145;
      case 0x12u:
        v55 = 0;
        v56 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x20u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v23 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_169;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_169:
        v109 = 48;
        goto LABEL_199;
      case 0x13u:
        v61 = 0;
        v62 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x10u;
        while (2)
        {
          v63 = *v3;
          v64 = *(_QWORD *)(a2 + v63);
          v65 = v64 + 1;
          if (v64 == -1 || v65 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
            *(_QWORD *)(a2 + v63) = v65;
            v23 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              v15 = v62++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_173:
        v109 = 40;
        goto LABEL_199;
      case 0x14u:
        v67 = 0;
        v68 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x40u;
        while (2)
        {
          v69 = *v3;
          v70 = *(_QWORD *)(a2 + v69);
          v71 = v70 + 1;
          if (v70 == -1 || v71 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
            *(_QWORD *)(a2 + v69) = v71;
            v23 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v67 += 7;
              v15 = v68++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_177;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_177:
        v109 = 56;
        goto LABEL_199;
      case 0x15u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 168;
        goto LABEL_145;
      case 0x16u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 280;
        goto LABEL_145;
      case 0x17u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 248;
        goto LABEL_145;
      case 0x18u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 184;
        goto LABEL_145;
      case 0x19u:
        v73 = 0;
        v74 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 8u;
        while (2)
        {
          v75 = *v3;
          v76 = *(_QWORD *)(a2 + v75);
          v77 = v76 + 1;
          if (v76 == -1 || v77 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v78 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v76);
            *(_QWORD *)(a2 + v75) = v77;
            v23 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              v73 += 7;
              v15 = v74++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_181;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_181:
        v109 = 32;
        goto LABEL_199;
      case 0x1Au:
        v79 = 0;
        v80 = 0;
        v81 = 0;
        *(_WORD *)(a1 + 316) |= 0x4000u;
        while (2)
        {
          v82 = *v3;
          v83 = *(_QWORD *)(a2 + v82);
          v84 = v83 + 1;
          if (v83 == -1 || v84 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v85 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v83);
            *(_QWORD *)(a2 + v82) = v84;
            v81 |= (unint64_t)(v85 & 0x7F) << v79;
            if (v85 < 0)
            {
              v79 += 7;
              v15 = v80++ >= 9;
              if (v15)
              {
                v81 = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v81 = 0;
LABEL_185:
        v110 = v81 != 0;
        v111 = 313;
        goto LABEL_190;
      case 0x1Bu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 152;
        goto LABEL_145;
      case 0x1Cu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 160;
        goto LABEL_145;
      case 0x1Du:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 200;
        goto LABEL_145;
      case 0x1Eu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 224;
        goto LABEL_145;
      case 0x1Fu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 216;
        goto LABEL_145;
      case 0x20u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 208;
        goto LABEL_145;
      case 0x21u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 192;
        goto LABEL_145;
      case 0x22u:
        v86 = 0;
        v87 = 0;
        v88 = 0;
        *(_WORD *)(a1 + 316) |= 0x2000u;
        while (2)
        {
          v89 = *v3;
          v90 = *(_QWORD *)(a2 + v89);
          v91 = v90 + 1;
          if (v90 == -1 || v91 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v92 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v90);
            *(_QWORD *)(a2 + v89) = v91;
            v88 |= (unint64_t)(v92 & 0x7F) << v86;
            if (v92 < 0)
            {
              v86 += 7;
              v15 = v87++ >= 9;
              if (v15)
              {
                v88 = 0;
                goto LABEL_189;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v88 = 0;
LABEL_189:
        v110 = v88 != 0;
        v111 = 312;
LABEL_190:
        *(_BYTE *)(a1 + v111) = v110;
        goto LABEL_200;
      case 0x23u:
        v93 = 0;
        v94 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x400u;
        while (2)
        {
          v95 = *v3;
          v96 = *(_QWORD *)(a2 + v95);
          v97 = v96 + 1;
          if (v96 == -1 || v97 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v98 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v96);
            *(_QWORD *)(a2 + v95) = v97;
            v23 |= (unint64_t)(v98 & 0x7F) << v93;
            if (v98 < 0)
            {
              v93 += 7;
              v15 = v94++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_194:
        v109 = 88;
        goto LABEL_199;
      case 0x24u:
        v99 = 0;
        v100 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 316) |= 0x100u;
        while (2)
        {
          v101 = *v3;
          v102 = *(_QWORD *)(a2 + v101);
          v103 = v102 + 1;
          if (v102 == -1 || v103 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v104 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
            *(_QWORD *)(a2 + v101) = v103;
            v23 |= (unint64_t)(v104 & 0x7F) << v99;
            if (v104 < 0)
            {
              v99 += 7;
              v15 = v100++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_198;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_198:
        v109 = 72;
LABEL_199:
        *(_QWORD *)(a1 + v109) = v23;
        goto LABEL_200;
      case 0x25u:
        *(_WORD *)(a1 + 316) |= 4u;
        v105 = *v3;
        v106 = *(_QWORD *)(a2 + v105);
        if (v106 <= 0xFFFFFFFFFFFFFFF7 && v106 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v106);
          *(_QWORD *)(a2 + v105) = v106 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v36 = 0;
        }
        v112 = 24;
LABEL_206:
        *(_QWORD *)(a1 + v112) = v36;
        goto LABEL_200;
      case 0x26u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 176;
        goto LABEL_145;
      case 0x27u:
        v107 = objc_alloc_init(ACHCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 264), v107);
        if (PBReaderPlaceMark() && ACHCodableSyncIdentityReadFrom((uint64_t)v107, a2))
        {
          PBReaderRecallMark();

LABEL_200:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0x28u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 240;
LABEL_145:
        v108 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_200;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_200;
    }
  }
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t ACHStartOfFitnessWeekBeforeDateInCalendar(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_startOfFitnessWeekBeforeDate:", a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id ACHLogProgress()
{
  if (ACHLogProgress_onceToken != -1)
    dispatch_once(&ACHLogProgress_onceToken, &__block_literal_global_208);
  return (id)ACHLogProgress_category;
}

id ACHPairedWatchCountryCode()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR(".GlobalPreferences"));
  v1 = (id)objc_msgSend(v0, "synchronize");
  objc_msgSend(v0, "objectForKey:", CFSTR("AppleLocale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ACHCountryCode(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ACHLogAwardEngine()
{
  if (ACHLogAwardEngine_onceToken != -1)
    dispatch_once(&ACHLogAwardEngine_onceToken, &__block_literal_global_188);
  return (id)ACHLogAwardEngine_category;
}

void sub_2140341F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id ACHLegacyDefinitionIdentifierForTemplateUniqueName(void *a1)
{
  void *v1;
  void *v2;

  ACHStrippedTemplateUniqueName(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (ACHLegacyDefinitionIdentifierForTemplateUniqueName_onceToken != -1)
    dispatch_once(&ACHLegacyDefinitionIdentifierForTemplateUniqueName_onceToken, &__block_literal_global);
  objc_msgSend((id)ACHLegacyDefinitionIdentifierForTemplateUniqueName_mappingDictionary, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *ACHStrippedTemplateUniqueName(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("FirstWorkout-")) & 1) != 0)
  {
    v2 = CFSTR("FirstWorkout");
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("BestWorkout-")) & 1) != 0)
  {
    v2 = CFSTR("BestWorkout");
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("PerfectMonth-")) & 1) != 0)
  {
    v2 = CFSTR("PerfectMonth");
  }
  else
  {
    v2 = (__CFString *)v1;
  }

  return v2;
}

id ACHTemplateUniqueNameForLegacyAchievementInfo(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  __CFString *v8;
  id v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  ACHDateComponentInterval *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HKAchievementTypeBestSessionCalories")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("HKAchievementTypeFirstSessionOfType")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("HKAchievementTypeBestSessionCalories")))
      v10 = CFSTR("BestWorkout");
    else
      v10 = CFSTR("FirstWorkout");
    objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", a2);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = v12;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "containsString:", CFSTR("MonthlyChallenge")))
  {
    v15 = CFSTR("MonthlyChallengeTypeAllThreeRings");
    if (v8)
      v15 = v8;
    v11 = v15;
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("_"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") == 3)
    {
      v17 = ACHMonthlyChallengeTypeFromLegacyString(v11);
      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ACHDateComponentsForYearMonthDay(objc_msgSend(v30, "integerValue"), objc_msgSend(v29, "integerValue"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateFromComponents:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hk_startOfMonthForDate:addingMonths:", v28, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hk_startOfDateBySubtractingDays:fromDate:", 1, v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "components:fromDate:", 28, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[ACHDateComponentInterval initWithStartDateComponents:endDateComponents:]([ACHDateComponentInterval alloc], "initWithStartDateComponents:endDateComponents:", v26, v20);
      ACHMonthlyChallengeTemplate(v17, v21, 0.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uniqueName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    v8 = v11;
  }
  else
  {
    if (!objc_msgSend(v7, "containsString:", CFSTR("HKAchievementTypeDailyGoalCompleteMonth")))
    {
      v11 = (__CFString *)v7;
      if (ACHActivityTemplateUniqueName_onceToken != -1)
        dispatch_once(&ACHActivityTemplateUniqueName_onceToken, &__block_literal_global_290);
      objc_msgSend((id)ACHActivityTemplateUniqueName_mappingDictionary, "objectForKeyedSubscript:", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v12 = v11;
        v11 = v12;
      }
      goto LABEL_7;
    }
    v23 = ACHPerfectMonthUniqueName_onceToken;
    v24 = v9;
    if (v23 != -1)
      dispatch_once(&ACHPerfectMonthUniqueName_onceToken, &__block_literal_global_287);
    objc_msgSend((id)ACHPerfectMonthUniqueName_utcCalendar, "hk_dateBySubtractingDays:fromDate:", 1, v24);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)ACHPerfectMonthUniqueName_utcCalendar, "components:fromDate:", 12, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PerfectMonth_%04ld_%02ld"), objc_msgSend(v25, "year"), objc_msgSend(v25, "month"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v13;
}

uint64_t ACHWorkoutActivityTypeForTemplateUniqueName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  if (objc_msgSend(v1, "containsString:", CFSTR("Workout")))
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("-"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDD4118];
    objc_msgSend(v2, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "_workoutActivityTypeFromString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

ACHCodableLegacyAchievement *ACHBackCompatCodableAchievement(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  ACHCodableLegacyAchievement *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "uniqueName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ACHLegacyDefinitionIdentifierForTemplateUniqueName(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(ACHCodableLegacyAchievement);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_dataForUUIDBytes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableLegacyAchievement setUuid:](v10, "setUuid:", v12);

    -[ACHCodableLegacyAchievement setDefinitionIdentifier:](v10, "setDefinitionIdentifier:", v9);
    objc_msgSend(v5, "earnedDateComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    -[ACHCodableLegacyAchievement setCompletedDate:](v10, "setCompletedDate:");

    objc_msgSend(v6, "uniqueName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableLegacyAchievement setWorkoutActivityType:](v10, "setWorkoutActivityType:", ACHWorkoutActivityTypeForTemplateUniqueName(v15));

    -[ACHCodableLegacyAchievement setAlerted:](v10, "setAlerted:", 1);
    objc_msgSend(v6, "canonicalUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v5, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "canonicalUnit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValueForUnit:", v18);
      v20 = v19;

      -[ACHCodableLegacyAchievement setDoubleValue:](v10, "setDoubleValue:", v20);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

ACHEarnedInstance *ACHEarnedInstanceFromBackCompatCodableAchievement(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ACHEarnedInstance *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "definitionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "workoutActivityType");
  v7 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v3, "completedDate");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ACHTemplateUniqueNameForLegacyAchievementInfo(v5, v6, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(ACHEarnedInstance);
    -[ACHEarnedInstance setTemplateUniqueName:](v10, "setTemplateUniqueName:", v9);
    v11 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "completedDate");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 28, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstance setEarnedDateComponents:](v10, "setEarnedDateComponents:", v13);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstance setCreatedDate:](v10, "setCreatedDate:", v14);

    -[ACHEarnedInstance setCreatorDevice:](v10, "setCreatorDevice:", 1);
    ACHStrippedTemplateUniqueName(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (ACHCanonicalUnitForTemplateUniqueName_onceToken != -1)
      dispatch_once(&ACHCanonicalUnitForTemplateUniqueName_onceToken, &__block_literal_global_294);
    objc_msgSend((id)ACHCanonicalUnitForTemplateUniqueName_mappingDictionary, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_11;
    if (objc_msgSend(v3, "hasDoubleValue"))
    {
      v17 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(v3, "doubleValue");
    }
    else
    {
      if (!objc_msgSend(v3, "hasIntValue"))
      {
LABEL_11:

        goto LABEL_12;
      }
      v17 = (void *)MEMORY[0x24BDD3E50];
      v18 = (double)objc_msgSend(v3, "intValue");
    }
    objc_msgSend(v17, "quantityWithUnit:doubleValue:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHEarnedInstance setValue:](v10, "setValue:", v19);

    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

void sub_214037B04(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id ACHLogAwardScheduling()
{
  if (ACHLogAwardScheduling_onceToken != -1)
    dispatch_once(&ACHLogAwardScheduling_onceToken, &__block_literal_global_190);
  return (id)ACHLogAwardScheduling_category;
}

id ACHLogDatabase()
{
  if (ACHLogDatabase_onceToken != -1)
    dispatch_once(&ACHLogDatabase_onceToken, &__block_literal_global_192);
  return (id)ACHLogDatabase_category;
}

id ACHLogMonthlyChallenges()
{
  if (ACHLogMonthlyChallenges_onceToken != -1)
    dispatch_once(&ACHLogMonthlyChallenges_onceToken, &__block_literal_global_194);
  return (id)ACHLogMonthlyChallenges_category;
}

id ACHLogSync()
{
  if (ACHLogSync_onceToken != -1)
    dispatch_once(&ACHLogSync_onceToken, &__block_literal_global_196);
  return (id)ACHLogSync_category;
}

id ACHLogTemplates()
{
  if (ACHLogTemplates_onceToken != -1)
    dispatch_once(&ACHLogTemplates_onceToken, &__block_literal_global_198);
  return (id)ACHLogTemplates_category;
}

id ACHLogWorkouts()
{
  if (ACHLogWorkouts_onceToken != -1)
    dispatch_once(&ACHLogWorkouts_onceToken, &__block_literal_global_200);
  return (id)ACHLogWorkouts_category;
}

id ACHLogXPC()
{
  if (ACHLogXPC_onceToken != -1)
    dispatch_once(&ACHLogXPC_onceToken, &__block_literal_global_202);
  return (id)ACHLogXPC_category;
}

id ACHLogUI()
{
  if (ACHLogUI_onceToken != -1)
    dispatch_once(&ACHLogUI_onceToken, &__block_literal_global_204);
  return (id)ACHLogUI_category;
}

id ACHLogMetrics()
{
  if (ACHLogMetrics_onceToken != -1)
    dispatch_once(&ACHLogMetrics_onceToken, &__block_literal_global_206);
  return (id)ACHLogMetrics_category;
}

id ACHLogCleanup()
{
  if (ACHLogCleanup_onceToken != -1)
    dispatch_once(&ACHLogCleanup_onceToken, &__block_literal_global_210);
  return (id)ACHLogCleanup_category;
}

BOOL ACHCodablePlaceholderValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ACHCodableSyncIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

ACHTemplate *NewMoveGoalAchievedTemplate()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("NewMoveGoalAchieved"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 7);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 12);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("todayMoveValue >= todayMoveGoal && todayMoveGoal > previousBestMoveGoal"));
  -[ACHTemplate setGracePredicate:](v0, "setGracePredicate:", CFSTR("todayActivityMoveMode != 2 && todayMoveValue >= todayMoveGoal && todayMoveGoal > previousBestMoveGoal"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("todayMoveGoal"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("todayMoveValue"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("todayMoveGoal"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("TRUEPREDICATE"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("activityMoveMode != 2 && %@"), CFSTR("earnedInstanceCount == 0"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGraceVisibilityPredicate:](v0, "setGraceVisibilityPredicate:", v1);

  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 6);
  return v0;
}

ACHTemplate *DailyMoveRecordTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("NewMoveRecord"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 6);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 2);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("todayMoveValue > bestMoveValue && bestMoveValue >= 10 && totalDaysOfMoveHistory >= requiredDaysOfActivityHistoryForRecords"));
  -[ACHTemplate setGracePredicate:](v0, "setGracePredicate:", CFSTR("todayActivityMoveMode != 2 && todayMoveValue > bestMoveValue && bestMoveValue >= 10 && totalDaysOfMoveHistory >= requiredDaysOfActivityHistoryForRecords"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("todayMoveValue"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("todayMoveValue"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("bestMoveValue"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 128);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("TRUEPREDICATE"));
  -[ACHTemplate setGraceVisibilityPredicate:](v0, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 2);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 2);
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 1);
  return v0;
}

ACHTemplate *NewMoveTimeGoalAchievedTemplate()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("NewMoveTimeGoalAchieved"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 6);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 12);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setGracePredicate:](v0, "setGracePredicate:", CFSTR("todayActivityMoveMode == 2 && todayMoveTimeValue >= todayMoveTimeGoal && todayMoveTimeGoal > previousBestMoveTimeGoal"));
  -[ACHTemplate setGraceValueExpression:](v0, "setGraceValueExpression:", CFSTR("todayMoveTimeGoal"));
  -[ACHTemplate setGraceProgressExpression:](v0, "setGraceProgressExpression:", CFSTR("todayMoveTimeValue"));
  -[ACHTemplate setGraceGoalExpression:](v0, "setGraceGoalExpression:", CFSTR("todayMoveTimeGoal"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("activityMoveMode == 2 && %@"), CFSTR("earnedInstanceCount == 0"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGraceVisibilityPredicate:](v0, "setGraceVisibilityPredicate:", v1);

  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 6);
  return v0;
}

ACHTemplate *DailyMoveTimeRecordTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("NewMoveTimeRecord"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 2);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setGracePredicate:](v0, "setGracePredicate:", CFSTR("todayActivityMoveMode == 2 && todayMoveTimeValue > bestMoveTimeValue && bestMoveTimeValue >= 10 && totalDaysOfMoveHistory >= requiredDaysOfActivityHistoryForRecords"));
  -[ACHTemplate setGraceValueExpression:](v0, "setGraceValueExpression:", CFSTR("todayMoveTimeValue"));
  -[ACHTemplate setGraceProgressExpression:](v0, "setGraceProgressExpression:", CFSTR("todayMoveTimeValue"));
  -[ACHTemplate setGraceGoalExpression:](v0, "setGraceGoalExpression:", CFSTR("bestMoveTimeValue"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 512);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setGraceVisibilityPredicate:](v0, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode == 2"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 2);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 2);
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 1);
  return v0;
}

ACHTemplate *DailyExerciseRecordTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("NewExerciseRecord"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 6);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("todayExerciseValue > bestExerciseValue && totalDaysOfExerciseHistory >= requiredDaysOfActivityHistoryForRecords && todayIsStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("todayExerciseValue"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("todayExerciseValue"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("bestExerciseValue"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 256);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 2);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 2);
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 2);
  return v0;
}

ACHTemplate *LongestMoveStreakTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("LongestMoveStreak"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 1);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("currentMoveStreak > previousBestMoveStreak && currentMoveStreak >= requiredDaysOfActivityHistoryForStreaks"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("currentMoveStreak"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("currentMoveStreak"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("TERNARY(bestMoveStreak + 1 > 8, bestMoveStreak + 1, 8)"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("TRUEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 2);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 7);
  return v0;
}

ACHTemplate *MoveGoal200PercentTemplate()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("MoveGoal200Percent"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("currentMovePercentage >= %@ && previousMovePercentage < %@"), CFSTR("2.0"), CFSTR("2.0"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("2.0*todayMoveGoal"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("todayMoveValue"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("2.0*todayMoveGoal"));
  -[ACHTemplate setGraceValueExpression:](v0, "setGraceValueExpression:", CFSTR("2.0*todayAgnosticMoveGoal"));
  -[ACHTemplate setGraceProgressExpression:](v0, "setGraceProgressExpression:", CFSTR("todayAgnosticMoveValue"));
  -[ACHTemplate setGraceGoalExpression:](v0, "setGraceGoalExpression:", CFSTR("2.0*todayAgnosticMoveGoal"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 8);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("TRUEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 3);
  return v0;
}

ACHTemplate *MoveGoal300PercentTemplate()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("MoveGoal300Percent"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 6);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 13);
  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("MoveGoal200Percent"));
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("currentMovePercentage >= %@ && previousMovePercentage < %@"), CFSTR("3.0"), CFSTR("3.0"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("3.0*todayMoveGoal"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("todayMoveValue"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("3.0*todayMoveGoal"));
  -[ACHTemplate setGraceValueExpression:](v0, "setGraceValueExpression:", CFSTR("3.0*todayAgnosticMoveGoal"));
  -[ACHTemplate setGraceProgressExpression:](v0, "setGraceProgressExpression:", CFSTR("todayAgnosticMoveValue"));
  -[ACHTemplate setGraceGoalExpression:](v0, "setGraceGoalExpression:", CFSTR("3.0*todayAgnosticMoveGoal"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 8);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 4);
  return v0;
}

ACHTemplate *MoveGoal400PercentTemplate()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("MoveGoal400Percent"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 13);
  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("MoveGoal300Percent"));
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("currentMovePercentage >= %@ && previousMovePercentage < %@"), CFSTR("4.0"), CFSTR("4.0"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("4.0*todayMoveGoal"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("todayMoveValue"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("4.0*todayMoveGoal"));
  -[ACHTemplate setGraceValueExpression:](v0, "setGraceValueExpression:", CFSTR("4.0*todayAgnosticMoveGoal"));
  -[ACHTemplate setGraceProgressExpression:](v0, "setGraceProgressExpression:", CFSTR("todayAgnosticMoveValue"));
  -[ACHTemplate setGraceGoalExpression:](v0, "setGraceGoalExpression:", CFSTR("4.0*todayAgnosticMoveGoal"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 8);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("TRUEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 16);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 5);
  return v0;
}

ACHTemplate *PerfectWeekMoveTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("PerfectWeekMove"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 12);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("currentMoveStreak >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("currentWeekMoveStreak"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("7"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("TRUEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 0x2000);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 8);
  return v0;
}

ACHTemplate *PerfectWeekExerciseTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("PerfectWeekExercise"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 12);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("currentExerciseStreak >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek && todayIsStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("currentWeekExerciseStreak"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("7"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 16);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 0x2000);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 9);
  return v0;
}

ACHTemplate *PerfectWeekStandTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("PerfectWeekStand"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 12);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("currentStandStreak >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek && todayIsStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("currentWeekStandStreak"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("7"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 32);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 0x2000);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 10);
  return v0;
}

ACHTemplate *PerfectWeekAllTemplate()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("PerfectWeekAll"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 12);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("currentStreakForAllActivity >= 7 && dayOfWeekForToday == dayOfWeekForLastDayOfFitnessWeek && todayIsStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("currentWeekStreakForAllActivity"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("7"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 64);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 0x2000);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 11);
  return v0;
}

ACHTemplate *HundredMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("100MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 100"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("100"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 12);
  return v0;
}

ACHTemplate *ThreeHundredSixtyFiveMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("365MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 365"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("365"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("100MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 13);
  return v0;
}

ACHTemplate *FiveHundredMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("500MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 500"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("500"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("365MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 14);
  return v0;
}

ACHTemplate *ThousandMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("1000MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 1000"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("1000"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("500MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 15);
  return v0;
}

ACHTemplate *TwelveFiftyMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("1250MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 1250"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("1250"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("1000MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 16);
  return v0;
}

ACHTemplate *FifteenHundredMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("1500MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 1500"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("1500"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("1250MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 17);
  return v0;
}

ACHTemplate *SeventeenFiftyMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("1750MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 1750"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("1750"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("1500MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 18);
  return v0;
}

ACHTemplate *TwoThousandMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("2000MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 2000"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("2000"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("1750MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 19);
  return v0;
}

ACHTemplate *TwentyTwoFiftyMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("2250MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 2250"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("2250"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("2000MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 20);
  return v0;
}

ACHTemplate *TwentyFiveHundredMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("2500MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 2500"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("2500"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("2250MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 21);
  return v0;
}

ACHTemplate *TwentySevenFiftyMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("2750MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 2750"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("2750"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("2500MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 22);
  return v0;
}

ACHTemplate *ThreeThousandMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("3000MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 3000"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("3000"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("2750MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 23);
  return v0;
}

ACHTemplate *ThreeThousandTwoHundredFiftyMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("3250MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 3250"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("3250"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("3000MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 24);
  return v0;
}

ACHTemplate *ThreeThousandFiveHundredMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("3500MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 3500"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("3500"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("3250MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 25);
  return v0;
}

ACHTemplate *ThreeThousandSevenHundredFiftyMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("3750MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 3750"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("3750"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("3500MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 26);
  return v0;
}

ACHTemplate *FourThousandMoveGoals()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("4000MoveGoals"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("totalMoveGoalsMet == 4000"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("totalMoveGoalsMet"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("4000"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setPrerequisiteTemplateName:](v0, "setPrerequisiteTemplateName:", CFSTR("3750MoveGoals"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("prerequisiteMet == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 27);
  return v0;
}

ACHTemplate *SevenWorkoutWeekTemplate()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("7WorkoutWeek"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 3);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek == 7"));
  -[ACHTemplate setProgressExpression:](v0, "setProgressExpression:", CFSTR("numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek"));
  -[ACHTemplate setGoalExpression:](v0, "setGoalExpression:", CFSTR("7"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("TRUEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 0x2000);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 800);
  return v0;
}

ACHTemplate *FirstWorkoutTemplateForWorkoutActivityType(uint64_t a1)
{
  ACHTemplate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v2 = objc_alloc_init(ACHTemplate);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FirstWorkout-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setUniqueName:](v2, "setUniqueName:", v5);

  -[ACHTemplate setVersion:](v2, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v2, "setMinimumEngineVersion:", 13);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType == 1"), a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v2, "setPredicate:", v6);

  -[ACHTemplate setTriggers:](v2, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v2, "setEarnLimit:", 1);
  v7 = CFSTR("NO");
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0x46)
    v7 = CFSTR("YES");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isStandalonePhoneFitnessMode == NO && isWheelchairUser == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityPredicate:](v2, "setVisibilityPredicate:", v8);

  -[ACHTemplate setDuplicateRemovalStrategy:](v2, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setEarnDateStrategy:](v2, "setEarnDateStrategy:", 1);
  -[ACHTemplate setDisplayOrder:](v2, "setDisplayOrder:", a1 + 700);
  return v2;
}

ACHTemplate *BestWorkoutEnergyBurnedTemplateForWorkoutActivityType(uint64_t a1)
{
  ACHTemplate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(ACHTemplate);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BestWorkout-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setUniqueName:](v2, "setUniqueName:", v5);

  -[ACHTemplate setVersion:](v2, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v2, "setMinimumEngineVersion:", 10);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType >= 5 && workout.kilocalories > bestKilocaloriesForType"), a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v2, "setPredicate:", v6);

  -[ACHTemplate setValueExpression:](v2, "setValueExpression:", CFSTR("workout.kilocalories"));
  -[ACHTemplate setTriggers:](v2, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v2, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v2, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v2, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v2, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v2, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v2, "setCanonicalUnit:", v7);

  -[ACHTemplate setDisplayOrder:](v2, "setDisplayOrder:", a1 + 700);
  return v2;
}

ACHTemplate *FiftyKilometersCyclingWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FiftyKilometersCyclingWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 6);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && isMetricLocale == YES && workout.kilometers >= 50.0 && workout.kilometers < 100.0"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 801);
  return v0;
}

ACHTemplate *FiftyMilesCyclingWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FiftyMilesCyclingWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && isMetricLocale == NO && workout.kilometers >= 80.4672 && workout.kilometers < 100.0"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 802);
  return v0;
}

ACHTemplate *OneHundredKilometersCyclingWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("OneHundredKilometersCyclingWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && workout.kilometers >= 100.0 && workout.kilometers < 160.934"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 803);
  return v0;
}

ACHTemplate *OneHundredMilesCyclingWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("OneHundredMilesCyclingWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isIndoor == NO && workout.type == 13 && workout.kilometers >= 160.934"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 804);
  return v0;
}

ACHTemplate *HalfMarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("HalfMarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 6);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f && workout.kilometers < %f"), 0x4034EBE0DED288CELL, 0x4044C2B020C49BA6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 850);
  return v0;
}

ACHTemplate *WheelchairHalfMarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("WheelchairHalfMarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f && workout.kilometers < %f"), 0x4034EBE0DED288CELL, 0x4044C2B020C49BA6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 851);
  return v0;
}

ACHTemplate *FastestHalfMarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FastestHalfMarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f && workout.bestHalfMarathonDuration < bestHalfMarathonDuration"), 0x4034EBE0DED288CELL);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.bestHalfMarathonDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 852);
  return v0;
}

ACHTemplate *FastestWheelchairHalfMarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FastestWheelchairHalfMarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f && workout.bestWheelchairHalfMarathonDuration < bestWheelchairHalfMarathonDuration"), 0x4034EBE0DED288CELL);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.bestWheelchairHalfMarathonDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 853);
  return v0;
}

ACHTemplate *MarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("MarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f"), 0x4044C2B020C49BA6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 854);
  return v0;
}

ACHTemplate *WheelchairMarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("WheelchairMarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f"), 0x4044C2B020C49BA6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 855);
  return v0;
}

ACHTemplate *FastestMarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FastestMarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= %f && workout.bestMarathonDuration < bestMarathonDuration"), 0x4044C2B020C49BA6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.bestMarathonDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 856);
  return v0;
}

ACHTemplate *FastestWheelchairMarathonWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FastestWheelchairMarathonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= %f && workout.bestWheelchairMarathonDuration < bestWheelchairMarathonDuration"), 0x4044C2B020C49BA6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.bestWheelchairMarathonDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 857);
  return v0;
}

ACHTemplate *DuathlonWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("DuathlonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isDuathlon == YES"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 820);
  return v0;
}

ACHTemplate *SprintTriathlonWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("SprintTriathlonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isSprintTriathlon == YES"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 821);
  return v0;
}

ACHTemplate *FiftyKilometerTriathlonWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FiftyKilometerTriathlonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isFiftyKilometerTriathlon == YES"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 822);
  return v0;
}

ACHTemplate *HalfDistanceTriathlonWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("HalfDistanceTriathlonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isHalfDistanceTriathlon == YES"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 823);
  return v0;
}

ACHTemplate *FullDistanceTriathlonWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FullDistanceTriathlonWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 5);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 9);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.isFullDistanceTriathlon == YES"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 824);
  return v0;
}

ACHTemplate *FiveKilometerWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FiveKilometerWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 13);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= 5.0 && workout.kilometers < 10.0"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO && isWheelchairUser == NO"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 840);
  return v0;
}

ACHTemplate *FiveKilometerWheelchairWorkout()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("FiveKilometerWheelchairWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 13);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= 5.0 && workout.kilometers < 10.0"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO && isWheelchairUser == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 841);
  return v0;
}

ACHTemplate *TenKilometerWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("TenKilometerWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 13);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.kilometers >= 10.0 && workout.kilometers < %f"), 0x4034EBE0DED288CELL);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO && isWheelchairUser == NO"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 842);
  return v0;
}

ACHTemplate *TenKilometerWheelchairWorkout()
{
  ACHTemplate *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("TenKilometerWheelchairWorkout"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 4);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 13);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.kilometers >= 10.0 && workout.kilometers < %f"), 0x4034EBE0DED288CELL);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v0, "setPredicate:", v1);

  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("isStandalonePhoneFitnessMode == NO && isWheelchairUser == YES"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 4);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  -[ACHTemplate setDisplaysEarnedInstanceCount:](v0, "setDisplaysEarnedInstanceCount:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v2);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 843);
  return v0;
}

ACHTemplate *Best5KDuration()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("Best5KDuration"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 7);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.best5KDuration < best5KDuration"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.best5KDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 844);
  return v0;
}

ACHTemplate *BestWheelchair5KDuration()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("BestWheelchair5KDuration"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 8);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.bestWheelchair5KDuration < bestWheelchair5KDuration"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.bestWheelchair5KDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 845);
  return v0;
}

ACHTemplate *Best10KDuration()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("Best10KDuration"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 2);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 7);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.type == 37 && workout.best10KDuration < best10KDuration"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.best10KDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 846);
  return v0;
}

ACHTemplate *BestWheelchair10KDuration()
{
  ACHTemplate *v0;
  void *v1;

  v0 = objc_alloc_init(ACHTemplate);
  -[ACHTemplate setUniqueName:](v0, "setUniqueName:", CFSTR("BestWheelchair10KDuration"));
  -[ACHTemplate setVersion:](v0, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v0, "setMinimumEngineVersion:", 8);
  -[ACHTemplate setPredicate:](v0, "setPredicate:", CFSTR("workout.isFirstParty == YES && workout.type == 71 && workout.bestWheelchair10KDuration < bestWheelchair10KDuration"));
  -[ACHTemplate setValueExpression:](v0, "setValueExpression:", CFSTR("workout.bestWheelchair10KDuration"));
  -[ACHTemplate setTriggers:](v0, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v0, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  -[ACHTemplate setVisibilityPredicate:](v0, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setDuplicateRemovalStrategy:](v0, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v0, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v0, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v0, "setCanonicalUnit:", v1);

  -[ACHTemplate setDisplayOrder:](v0, "setDisplayOrder:", 847);
  return v0;
}

ACHTemplate *BestWorkoutDistanceTemplateForWorkoutActivityType(uint64_t a1)
{
  ACHTemplate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(ACHTemplate);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BestWorkoutDistance-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setUniqueName:](v2, "setUniqueName:", v5);

  -[ACHTemplate setVersion:](v2, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v2, "setMinimumEngineVersion:", 13);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType >= 5 && workout.kilometers > bestKilometersForType"), a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v2, "setPredicate:", v6);

  -[ACHTemplate setValueExpression:](v2, "setValueExpression:", CFSTR("workout.meters"));
  -[ACHTemplate setTriggers:](v2, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v2, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  v7 = CFSTR("NO");
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0x46)
    v7 = CFSTR("YES");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isStandalonePhoneFitnessMode == NO && isWheelchairUser == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityPredicate:](v2, "setVisibilityPredicate:", v8);

  -[ACHTemplate setDuplicateRemovalStrategy:](v2, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v2, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v2, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v2, "setCanonicalUnit:", v9);

  -[ACHTemplate setDisplayOrder:](v2, "setDisplayOrder:", a1 + 1100);
  return v2;
}

ACHTemplate *BestWorkoutElevationGainedTemplateForWorkoutActivityType(uint64_t a1)
{
  ACHTemplate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(ACHTemplate);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BestWorkoutElevationGained-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setUniqueName:](v2, "setUniqueName:", v5);

  -[ACHTemplate setVersion:](v2, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v2, "setMinimumEngineVersion:", 13);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("workout.isFirstParty == YES && workout.type == %lu && workout.duration >= 5*60 && numberOfFirstPartyWorkoutsOver5MinutesWithType >= 5 && workout.elevationGained > bestElevationGainedForType"), a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v2, "setPredicate:", v6);

  -[ACHTemplate setValueExpression:](v2, "setValueExpression:", CFSTR("workout.elevationGainedInMeters"));
  -[ACHTemplate setTriggers:](v2, "setTriggers:", 2);
  -[ACHTemplate setEarnLimit:](v2, "setEarnLimit:", ACHTemplateEarnLimitNoLimit);
  v7 = CFSTR("NO");
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0x46)
    v7 = CFSTR("YES");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isStandalonePhoneFitnessMode == NO && isWheelchairUser == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityPredicate:](v2, "setVisibilityPredicate:", v8);

  -[ACHTemplate setDuplicateRemovalStrategy:](v2, "setDuplicateRemovalStrategy:", 3);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v2, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v2, "setEarnDateStrategy:", 1);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v2, "setCanonicalUnit:", v9);

  -[ACHTemplate setDisplayOrder:](v2, "setDisplayOrder:", a1 + 1200);
  return v2;
}

id ACHMonthlyChallengeTemplate(unint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = v5;
  switch(a1)
  {
    case 1uLL:
      ACHMonthlyChallengeTypeAllThreeRingsTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2uLL:
      ACHMonthlyChallengeTypeMoveRingTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 3uLL:
      ACHMonthlyChallengeTypeExerciseRingTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 4uLL:
      ACHMonthlyChallengeTypeStandRingTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 5uLL:
      ACHMonthlyChallengeTypeTotalEnergyBurnTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 6uLL:
      ACHMonthlyChallengeTypeTotalExerciseMinutesTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 7uLL:
      ACHMonthlyChallengeTypeTotalWorkoutsTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      ACHMonthlyChallengeTypeTotalSpecificWorkoutTemplate(v5, a1, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x14uLL:
      ACHMonthlyChallengeTypeTotalDistanceTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x15uLL:
      ACHMonthlyChallengeTypeDaysDoublingMoveGoalTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x16uLL:
      ACHMonthlyChallengeTypeTotalAppleMoveTimeTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x17uLL:
      ACHMonthlyChallengeTypeDaysDoublingExerciseGoalTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x18uLL:
      ACHMonthlyChallengeTypeMoveStreakTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x19uLL:
      ACHMonthlyChallengeTypeDailyEnergyBurnTargetTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x1AuLL:
      ACHMonthlyChallengeTypeDailyExerciseMinutesTargetTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x1BuLL:
      ACHMonthlyChallengeTypeDailyDistanceTargetTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0x1CuLL:
      ACHMonthlyChallengeTypeDailyAppleMoveTimeTargetTemplate(v5, a3);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

ACHTemplate *ACHMonthlyChallengeTypeAllThreeRingsTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeAllThreeRings_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfDaysClosingAllThreeRingsInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("numberOfDaysClosingAllThreeRingsInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("numberOfDaysClosingAllThreeRingsInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeMoveRingTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeMoveRing_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfDaysClosingMoveRingInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("numberOfDaysClosingMoveRingInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("numberOfDaysClosingMoveRingInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeExerciseRingTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeExerciseRing_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfDaysClosingExerciseRingInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("numberOfDaysClosingExerciseRingInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("numberOfDaysClosingExerciseRingInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeStandRingTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeStandRing_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfDaysClosingStandRingInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("numberOfDaysClosingStandRingInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("numberOfDaysClosingStandRingInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalEnergyBurnTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeTotalEnergyBurn_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("totalEnergyBurnInCurrentMonth >= %f"), *(_QWORD *)&a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("totalEnergyBurnInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("totalEnergyBurnInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalExerciseMinutesTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeTotalExerciseMinutes_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("totalExerciseMinutesInCurrentMonth >= %f"), *(_QWORD *)&a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("totalExerciseMinutesInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("totalExerciseMinutesInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalWorkoutsTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeTotalWorkouts_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfWorkoutsCompletedInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("numberOfWorkoutsCompletedInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("numberOfWorkoutsCompletedInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalDistanceTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeTotalDistance_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("totalWalkingRunningDistanceInCurrentMonth >= %f"), *(_QWORD *)&a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("totalWalkingRunningDistanceInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("totalWalkingRunningDistanceInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDaysDoublingMoveGoalTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeDaysDoublingMoveGoal_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfDaysDoublingMoveGoalInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("numberOfDaysDoublingMoveGoalInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("numberOfDaysDoublingMoveGoalInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalAppleMoveTimeTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeTotalMoveTime_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 2);
  -[ACHTemplate setPredicate:](v4, "setPredicate:", CFSTR("FALSEPREDICATE"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("totalMoveTimeInCurrentMonth >= %f"), *(_QWORD *)&a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGracePredicate:](v4, "setGracePredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("totalMoveTimeInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("totalMoveTimeInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityPredicate:](v4, "setVisibilityPredicate:", CFSTR("FALSEPREDICATE"));
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode == 2"));
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDaysDoublingExerciseGoalTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeDaysDoublingExerciseGoal_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfDaysDoublingExerciseGoalInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("numberOfDaysDoublingExerciseGoalInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("numberOfDaysDoublingExerciseGoalInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeTotalSpecificWorkoutTemplate(void *a1, unint64_t a2, double a3)
{
  id v5;
  ACHTemplate *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a1;
  v6 = objc_alloc_init(ACHTemplate);
  ACHMonthlyChallengeNameFromChallengeType(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ACH"), &stru_24D1281D8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "startDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "year");
  objc_msgSend(v5, "startDateComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%04ld_%02ld"), v8, v11, objc_msgSend(v12, "month"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v6, "setUniqueName:", v13);
  -[ACHTemplate setVersion:](v6, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v6, "setMinimumEngineVersion:", 4);
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("FUNCTION(SELF, 'numberOfCompletedWorkoutsInCurrentMonthForChallengeType:', %@)"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ >= %ld"), v16, (uint64_t)a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v6, "setPredicate:", v17);

  -[ACHTemplate setValueExpression:](v6, "setValueExpression:", v16);
  -[ACHTemplate setProgressExpression:](v6, "setProgressExpression:", v16);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v6, "setGoalExpression:", v18);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v6, "setCanonicalUnit:", v19);

  -[ACHTemplate setTriggers:](v6, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v6, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v6, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  objc_msgSend(v5, "startDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v6, "setVisibilityStart:", v20);

  objc_msgSend(v5, "endDateComponents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v6, "setVisibilityEnd:", v21);

  objc_msgSend(v5, "startDateComponents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v6, "setAvailabilityStart:", v22);

  objc_msgSend(v5, "endDateComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v6, "setAvailabilityEnd:", v23);

  -[ACHTemplate setDuplicateRemovalStrategy:](v6, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v6, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v6, "setEarnDateStrategy:", 1);
  objc_msgSend(v5, "startDateComponents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v6, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v24, 0));
  return v6;
}

ACHTemplate *ACHMonthlyChallengeTypeMoveStreakTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeMoveStreak_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("currentMoveStreakInCurrentMonth >= %ld"), (uint64_t)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v10);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", CFSTR("currentMoveStreakInCurrentMonth"));
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", CFSTR("currentMoveStreakInCurrentMonth"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", v11);

  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v12);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  objc_msgSend(v3, "startDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v13);

  objc_msgSend(v3, "endDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v14);

  objc_msgSend(v3, "startDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v15);

  objc_msgSend(v3, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v16);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v17, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyEnergyBurnTargetTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeDailyEnergyBurnTarget_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 5);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("FUNCTION(SELF, 'numberOfDaysWithCaloriesBurnedOver:', %@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ >= 14"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v13);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", v12);
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", v12);
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", CFSTR("14"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v14);

  -[ACHTemplate setDailyTarget:](v4, "setDailyTarget:", a2);
  objc_msgSend(MEMORY[0x24BDD4048], "largeCalorieUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setDailyTargetCanonicalUnit:](v4, "setDailyTargetCanonicalUnit:", v15);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  objc_msgSend(v3, "startDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v16);

  objc_msgSend(v3, "endDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v17);

  objc_msgSend(v3, "startDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v18);

  objc_msgSend(v3, "endDateComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v19);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v20, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyExerciseMinutesTargetTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeDailyExerciseMinutesTarget_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 5);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("FUNCTION(SELF, 'numberOfDaysWithExerciseMinutesOver:', %@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ >= 14"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v13);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", v12);
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", v12);
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", CFSTR("14"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v14);

  -[ACHTemplate setDailyTarget:](v4, "setDailyTarget:", a2);
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setDailyTargetCanonicalUnit:](v4, "setDailyTargetCanonicalUnit:", v15);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  objc_msgSend(v3, "startDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v16);

  objc_msgSend(v3, "endDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v17);

  objc_msgSend(v3, "startDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v18);

  objc_msgSend(v3, "endDateComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v19);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v20, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyDistanceTargetTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeDailyDistanceTarget_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 5);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("FUNCTION(SELF, 'numberOfDaysWithDistanceOver:', %@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ >= 14"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v13);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", v12);
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", v12);
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", CFSTR("14"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v14);

  -[ACHTemplate setDailyTarget:](v4, "setDailyTarget:", a2);
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setDailyTargetCanonicalUnit:](v4, "setDailyTargetCanonicalUnit:", v15);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode != 2"));
  objc_msgSend(v3, "startDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v16);

  objc_msgSend(v3, "endDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v17);

  objc_msgSend(v3, "startDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v18);

  objc_msgSend(v3, "endDateComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v19);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v20, 0));
  return v4;
}

ACHTemplate *ACHMonthlyChallengeTypeDailyAppleMoveTimeTargetTemplate(void *a1, double a2)
{
  id v3;
  ACHTemplate *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = a1;
  v4 = objc_alloc_init(ACHTemplate);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "year");
  objc_msgSend(v3, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("MonthlyChallengeTypeDailyAppleMoveTimeTarget_%04ld_%02ld"), v7, objc_msgSend(v8, "month"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setUniqueName:](v4, "setUniqueName:", v9);
  -[ACHTemplate setVersion:](v4, "setVersion:", 1);
  -[ACHTemplate setMinimumEngineVersion:](v4, "setMinimumEngineVersion:", 5);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("FUNCTION(SELF, 'numberOfDaysWithAppleMoveTimeOver:', %@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ >= 14"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setPredicate:](v4, "setPredicate:", v13);

  -[ACHTemplate setValueExpression:](v4, "setValueExpression:", v12);
  -[ACHTemplate setProgressExpression:](v4, "setProgressExpression:", v12);
  -[ACHTemplate setGoalExpression:](v4, "setGoalExpression:", CFSTR("14"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v4, "setCanonicalUnit:", v14);

  -[ACHTemplate setDailyTarget:](v4, "setDailyTarget:", a2);
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setDailyTargetCanonicalUnit:](v4, "setDailyTargetCanonicalUnit:", v15);

  -[ACHTemplate setTriggers:](v4, "setTriggers:", 0);
  -[ACHTemplate setEarnLimit:](v4, "setEarnLimit:", 1);
  -[ACHTemplate setGraceVisibilityPredicate:](v4, "setGraceVisibilityPredicate:", CFSTR("activityMoveMode == 2"));
  objc_msgSend(v3, "startDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityStart:](v4, "setVisibilityStart:", v16);

  objc_msgSend(v3, "endDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setVisibilityEnd:](v4, "setVisibilityEnd:", v17);

  objc_msgSend(v3, "startDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityStart:](v4, "setAvailabilityStart:", v18);

  objc_msgSend(v3, "endDateComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setAvailabilityEnd:](v4, "setAvailabilityEnd:", v19);

  -[ACHTemplate setDuplicateRemovalStrategy:](v4, "setDuplicateRemovalStrategy:", 1);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v4, "setDuplicateRemovalCalendarUnit:", 2);
  -[ACHTemplate setEarnDateStrategy:](v4, "setEarnDateStrategy:", 1);
  objc_msgSend(v3, "startDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setDisplayOrder:](v4, "setDisplayOrder:", ACHMonthlyTemplateDisplayOrder(v20, 0));
  return v4;
}

id ACHMonthlyChallengeTemplateFromTemplate(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  ACHDateComponentInterval *v4;
  void *v5;
  void *v6;
  ACHDateComponentInterval *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  double v15;

  v1 = a1;
  objc_msgSend(v1, "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v2);

  v4 = [ACHDateComponentInterval alloc];
  objc_msgSend(v1, "availabilityStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "availabilityEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ACHDateComponentInterval initWithStartDateComponents:endDateComponents:](v4, "initWithStartDateComponents:endDateComponents:", v5, v6);

  if (v3 - 1 >= 0x18)
  {
    if (v3 - 25 >= 4)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v1, "dailyTarget");
      ACHMonthlyChallengeTemplate(v3, v7, v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v1, "graceGoalExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v1, "goalExpression");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    objc_msgSend(v11, "doubleValue");
    ACHMonthlyChallengeTemplate(v3, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

id ACHAwardsWorkoutServerInterface()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E630);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x24BDBCF20]);
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithArray:", v2);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_workoutsInDateInterval_completion_, 0, 1);
  return v0;
}

uint64_t ACHCompareYearMonthDayDateComponents(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "year");
  if (v5 == objc_msgSend(v4, "year"))
  {
    v6 = objc_msgSend(v3, "month");
    if (v6 == objc_msgSend(v4, "month"))
    {
      v7 = objc_msgSend(v3, "day");
      v8 = objc_msgSend(v4, "day");
    }
    else
    {
      v7 = objc_msgSend(v3, "month");
      v8 = objc_msgSend(v4, "month");
    }
  }
  else
  {
    v7 = objc_msgSend(v3, "year");
    v8 = objc_msgSend(v4, "year");
  }
  if (v7 > v8)
    v9 = 1;
  else
    v9 = (uint64_t)((unint64_t)(v7 < v8) << 63) >> 63;

  return v9;
}

uint64_t ACHStartOfFitnessWeekBeforeDateWithFirstWeekdayInCalendar(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a2, a1, 0);
}

BOOL ACHDateComponentsAreEqualForYearMonthDay(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "year");
  if (v5 == objc_msgSend(v4, "year") && (v6 = objc_msgSend(v3, "month"), v6 == objc_msgSend(v4, "month")))
  {
    v7 = objc_msgSend(v3, "day");
    v8 = v7 == objc_msgSend(v4, "day");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

ACHTemplate *RemoteAchievementTemplateFromTemplateAssetAndBuildVersion(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  ACHTemplate *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  unsigned __int8 v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "getLocalFileUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Definition.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v46 = v3;
    v47 = (void *)v8;
    v45 = v6;
    v48 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("disabledBuildRanges"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firstUnavailableBuild"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firstAvailableBuild"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", v16, v17))
          {
            ACHLogTemplates();
            v23 = objc_claimAutoreleasedReturnValue();
            v44 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v9 = v47;
              v54 = v47;
              v55 = 2114;
              v56 = v4;
              _os_log_impl(&dword_214029000, v23, OS_LOG_TYPE_DEFAULT, "Not creating template for remote asset %{public}@, it has been disabled for build %{public}@", buf, 0x16u);
              v18 = 0;
              v24 = v10;
              v6 = v45;
              v3 = v46;
            }
            else
            {
              v18 = 0;
              v24 = v10;
              v6 = v45;
              v3 = v46;
              v9 = v47;
            }
            v7 = v48;
            goto LABEL_23;
          }

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v12)
          continue;
        break;
      }
    }

    v18 = objc_alloc_init(ACHTemplate);
    -[ACHTemplate setUniqueName:](v18, "setUniqueName:", v47);
    v3 = v46;
    objc_msgSend(v46, "attributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE66A90]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setVersion:](v18, "setVersion:", objc_msgSend(v20, "integerValue"));

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("minimumEngineVersion"));
    v21 = objc_claimAutoreleasedReturnValue();
    v43 = v21;
    if (v21)
      v22 = -[NSObject unsignedIntegerValue](v21, "unsignedIntegerValue");
    else
      v22 = 1;
    -[ACHTemplate setMinimumEngineVersion:](v18, "setMinimumEngineVersion:", v22);
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("predicate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setPredicate:](v18, "setPredicate:", v16);
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("progressExpression"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setProgressExpression:](v18, "setProgressExpression:", v17);
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("goalExpression"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setGoalExpression:](v18, "setGoalExpression:");
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("canonicalUnit"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setCanonicalUnit:](v18, "setCanonicalUnit:", v25);

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("triggers"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");

    -[ACHTemplate setTriggers:](v18, "setTriggers:", v27);
    -[ACHTemplate setEarnLimit:](v18, "setEarnLimit:", 1);
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("visibilityStart"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setVisibilityStart:](v18, "setVisibilityStart:");
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("visibilityEnd"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setVisibilityEnd:](v18, "setVisibilityEnd:");
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("availabilityStart"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAvailabilityStart:](v18, "setAvailabilityStart:");
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("availabilityEnd"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    ACHYearMonthDayDateComponentsFromString(v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAvailabilityEnd:](v18, "setAvailabilityEnd:");
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("availableCountryCodes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
      -[ACHTemplate setAvailableCountryCodes:](v18, "setAvailableCountryCodes:", v28);
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("alertDates"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hk_map:", &__block_literal_global_1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setAlertDates:](v18, "setAlertDates:", v31);

    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("displayOrder"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplate setDisplayOrder:](v18, "setDisplayOrder:", objc_msgSend(v32, "integerValue"));
    -[ACHTemplate setDuplicateRemovalStrategy:](v18, "setDuplicateRemovalStrategy:", 1);
    -[ACHTemplate setEarnDateStrategy:](v18, "setEarnDateStrategy:", 1);

    v7 = v48;
    v6 = v45;
    v9 = v47;
    v24 = v43;
LABEL_23:

  }
  else
  {
    ACHLogTemplates();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      RemoteAchievementTemplateFromTemplateAssetAndBuildVersion_cold_1((uint64_t)v6, v10);
    v18 = 0;
  }

  return v18;
}

uint64_t ACHCodableTemplateArrayReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ACHCodableTemplate *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ACHCodableTemplate);
        objc_msgSend(a1, "addTemplates:", v17);
        if (!PBReaderPlaceMark() || (ACHCodableTemplateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ACHBadgePropertiesListPathForAchievement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "propertyListBundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v1, "propertyListBundleURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ACHLogAssets();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v1;
      _os_log_impl(&dword_214029000, v6, OS_LOG_TYPE_DEFAULT, "propertyListBundleURL is nil for achievement: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }

  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("BadgeModel"), CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void ACHApplyBadgePropertiesToAchievement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int IsPerfectMonth;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  float v25;
  int v26;
  int v27;
  int v28;
  int v29;
  NSObject *v30;
  int v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  __CFString *v38;
  double v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[2];
  _QWORD v84[3];
  void *v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (ACHTemplateIsMonthlyChallenge(v2))
  {

LABEL_4:
    objc_msgSend(v1, "template");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v7;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "intValue");
    v11 = objc_msgSend(v9, "intValue");
    v12 = v10;
    if (v10 <= 2028)
    {
      v84[0] = CFSTR("MONTH_BACK");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MONTH_%d"), v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v17;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("YEAR_%d"), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v84[2] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setBadgeModelFilenames:", v19);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MONTH_%d"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = v15;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("YEAR_%d"), v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v83[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setTextureFilenames:", v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fallback_%d"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setBadgeModelFilenames:", v14);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fallback_%d"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setTextureFilenames:", v16);
    }

    objc_msgSend(v1, "setBadgeUsesFullColorEnamel:", v12 > 2028);
    objc_msgSend(v1, "setBadgeShapeName:", CFSTR("hexagon"));
    v21 = v1;
    v22 = v9;
    v23 = objc_msgSend(v9, "intValue") - 1;
    if (objc_msgSend(&unk_24D138F70, "count") <= (unint64_t)v23)
    {
      ACHLogAssets();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        ACHApplyBadgePropertiesToAchievement_cold_1(v21, v30);

      v25 = _ColorForString(CFSTR("0.0 0.0 0.0"));
      v27 = v31;
      v29 = v32;
    }
    else
    {
      objc_msgSend(&unk_24D138F70, "objectAtIndexedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = _ColorForString(v24);
      v27 = v26;
      v29 = v28;

    }
    v33 = v79;

    *(float *)&v34 = v25;
    LODWORD(v35) = v27;
    LODWORD(v36) = v29;
    objc_msgSend(v21, "setBadgeEnamelColor:", v34, v35, v36);
    objc_msgSend(v21, "template");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (ACHTemplateIsPerfectMonth(v37))
      v38 = CFSTR("gold");
    else
      v38 = CFSTR("silver");
    *(float *)&v39 = _ColorForString(v38);
    objc_msgSend(v21, "setBadgeMetalColor:", v39);

    objc_msgSend(v21, "setUnearnedUsesTwoToneEnamel:", 1);
    objc_msgSend(v21, "template");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (ACHTemplateIsPerfectMonth(v40))
      v41 = CFSTR("ACTIVITY");
    else
      v41 = CFSTR("MONTHLY_CHALLENGES");
    objc_msgSend(v21, "setSection:", v41);

    objc_msgSend(v21, "setBadgeModelVersion:", 2);
    goto LABEL_41;
  }
  objc_msgSend(v1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsPerfectMonth = ACHTemplateIsPerfectMonth(v3);

  if (IsPerfectMonth)
    goto LABEL_4;
  ACHBadgePropertiesListPathForAchievement(v1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v33);
  v42 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v42;
  if (v33 && !v42)
  {
    ACHLogAssets();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      ACHApplyBadgePropertiesToAchievement_cold_2((uint64_t)v1, (uint64_t)v33, v43);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shape"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBadgeShapeName:", v22);
  *(float *)&v44 = _ColorForKey((uint64_t)CFSTR("metalColor"), v8);
  objc_msgSend(v1, "setBadgeMetalColor:", v44);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fullColorEnamel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBadgeUsesFullColorEnamel:", objc_msgSend(v45, "BOOLValue"));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("unearnedTwoToneEnamel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUnearnedUsesTwoToneEnamel:", objc_msgSend(v46, "BOOLValue"));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("faceHasMetalInlay"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFaceHasMetalInlay:", objc_msgSend(v47, "BOOLValue"));
  *(float *)&v48 = _ColorForKey((uint64_t)CFSTR("enamelColor"), v8);
  objc_msgSend(v1, "setBadgeEnamelColor:", v48);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triColorEnamel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "BOOLValue");
  objc_msgSend(v1, "setBadgeUsesTriColorEnamel:", v50);
  if ((_DWORD)v50)
  {
    *(float *)&v51 = _ColorForKey((uint64_t)CFSTR("enamelTriColor1"), v8);
    objc_msgSend(v1, "setEnamelTriColor1:", v51);
    *(float *)&v52 = _ColorForKey((uint64_t)CFSTR("enamelTriColor2"), v8);
    objc_msgSend(v1, "setEnamelTriColor2:", v52);
    *(float *)&v53 = _ColorForKey((uint64_t)CFSTR("enamelTriColor3"), v8);
    objc_msgSend(v1, "setEnamelTriColor3:", v53);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("section"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSection:", v54);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("badgeModelVersion"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBadgeModelVersion:", objc_msgSend(v76, "integerValue"));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("textureFilenames"));
  v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("textureFilename"));
  v56 = objc_claimAutoreleasedReturnValue();
  v78 = (void *)v56;
  if (v55)
  {
    objc_msgSend(v1, "setTextureFilenames:", v55);
  }
  else if (v56)
  {
    v82 = v56;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setTextureFilenames:", v57);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("badgeModelFilenames"));
  v58 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("badgeModelFilename"));
  v59 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v58;
  v75 = (void *)v55;
  v77 = (void *)v59;
  if (v58)
  {
    objc_msgSend(v1, "setBadgeModelFilenames:", v58);
  }
  else if (v59)
  {
    v81 = v59;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v81, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setBadgeModelFilenames:", v60);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("glyphScale"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
    objc_msgSend(v61, "doubleValue");
  else
    v63 = 1.0;
  objc_msgSend(v1, "setGlyphTextureScale:", v63);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("glyphTextureFilename"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setGlyphTextureFilename:", v64);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("glyphPositionOffset"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    objc_msgSend(v65, "componentsSeparatedByString:", CFSTR(" "));
    v73 = v47;
    v80 = v33;
    v67 = v46;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
    v69 = v49;
    v70 = v45;
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "doubleValue");
    objc_msgSend(v1, "setGlyphPositionOffsetX:");

    objc_msgSend(v68, "objectAtIndexedSubscript:", 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "doubleValue");
    objc_msgSend(v1, "setGlyphPositionOffsetY:");

    v45 = v70;
    v49 = v69;

    v46 = v67;
    v33 = v80;
    v47 = v73;
  }
  else
  {
    objc_msgSend(v1, "setGlyphPositionOffsetX:", 0.0);
    objc_msgSend(v1, "setGlyphPositionOffsetY:", 0.0);
  }

LABEL_41:
}

float _ColorForString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(&unk_24D138ED8, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;

      v4 = v7;
    }
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    if (objc_msgSend(v8, "count") == 3)
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v9 = v11;

      objc_msgSend(v8, "objectAtIndex:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");

      objc_msgSend(v8, "objectAtIndex:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");

    }
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

float _ColorForKey(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ColorForString(v2);

  return v3;
}

void sub_2140453E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_214045648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_2140458A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_214045AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_214045D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_214045F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_214046228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2140464D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_214046700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

ACHTemplate *PerfectMonthTemplateForDateComponents(void *a1, void *a2)
{
  id v3;
  id v4;
  ACHTemplate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc_init(ACHTemplate);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%04ld_%02ld"), CFSTR("PerfectMonth_"), objc_msgSend(v4, "year"), objc_msgSend(v4, "month"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setUniqueName:](v5, "setUniqueName:", v6);
  -[ACHTemplate setVersion:](v5, "setVersion:", 3);
  -[ACHTemplate setMinimumEngineVersion:](v5, "setMinimumEngineVersion:", 11);
  -[ACHTemplate setPredicate:](v5, "setPredicate:", CFSTR("currentMoveStreak >= numberOfDaysInThisMonth && dayOfMonthForToday == numberOfDaysInThisMonth"));
  -[ACHTemplate setProgressExpression:](v5, "setProgressExpression:", CFSTR("currentMonthMoveStreak"));
  -[ACHTemplate setGoalExpression:](v5, "setGoalExpression:", CFSTR("numberOfDaysInThisMonth"));
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHTemplate setCanonicalUnit:](v5, "setCanonicalUnit:", v7);

  -[ACHTemplate setTriggers:](v5, "setTriggers:", 4);
  -[ACHTemplate setEarnLimit:](v5, "setEarnLimit:", 1);
  -[ACHTemplate setVisibilityStart:](v5, "setVisibilityStart:", v4);
  -[ACHTemplate visibilityStart](v5, "visibilityStart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hk_startOfMonthForDate:addingMonths:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", PerfectMonthCalendarUnits, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplate setVisibilityEnd:](v5, "setVisibilityEnd:", v12);
  -[ACHTemplate setAvailabilityStart:](v5, "setAvailabilityStart:", v4);
  -[ACHTemplate setAvailabilityEnd:](v5, "setAvailabilityEnd:", v12);
  -[ACHTemplate setDuplicateRemovalStrategy:](v5, "setDuplicateRemovalStrategy:", 2);
  -[ACHTemplate setDuplicateRemovalCalendarUnit:](v5, "setDuplicateRemovalCalendarUnit:", 8);
  -[ACHTemplate setEarnDateStrategy:](v5, "setEarnDateStrategy:", 1);
  v13 = ACHMonthlyTemplateDisplayOrder(v4, 0);

  -[ACHTemplate setDisplayOrder:](v5, "setDisplayOrder:", v13);
  return v5;
}

BOOL ACHIsActivityAchievementSharable(void *a1)
{
  void *v1;
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  _BOOL8 v7;

  objc_msgSend(a1, "template");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "minimumEngineVersion");

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.nanolifestyle"));
  objc_msgSend(v3, "valueForKey:", CFSTR("AchievementsMaxmiumSharableEngineVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 13;
  v7 = v6 >= v2;

  return v7;
}

BOOL ACHIsActivityAchievementPrerelease(void *a1)
{
  void *v1;
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  _BOOL8 v7;

  objc_msgSend(a1, "template");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "minimumEngineVersion");

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.nanolifestyle"));
  objc_msgSend(v3, "valueForKey:", CFSTR("AchievementsReleaseEngineVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 13;
  v7 = v6 < v2;

  return v7;
}

BOOL ACHIsActivityAchievementsAssetServerURLExplicitlySet()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ActivityChallengeAssetsServerExplicitlyChosen"), CFSTR("com.apple.activityawardsd"), 0) != 0;
}

void ACHSetActivityAchievementsAssetServerURLExplicitlySet()
{
  CFPreferencesSetAppValue(CFSTR("ActivityChallengeAssetsServerExplicitlyChosen"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.activityawardsd"));
}

__CFString *ACHTriggerOptionsToString(uint64_t a1)
{
  __int16 v1;
  void *v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1)
  {
    v1 = a1;
    if ((a1 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBD1A8], "arrayByAddingObject:", CFSTR("Day Changed"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v1 & 2) == 0)
        goto LABEL_8;
    }
    else
    {
      v2 = (void *)MEMORY[0x24BDBD1A8];
      if ((a1 & 2) == 0)
      {
LABEL_8:
        if ((v1 & 4) != 0)
        {
          objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Move Goal Achieved"));
          v7 = objc_claimAutoreleasedReturnValue();

          v2 = (void *)v7;
          if ((v1 & 8) == 0)
          {
LABEL_10:
            if ((v1 & 0x10) == 0)
              goto LABEL_11;
            goto LABEL_22;
          }
        }
        else if ((v1 & 8) == 0)
        {
          goto LABEL_10;
        }
        objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Move Goal Multiple Achieved"));
        v8 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v8;
        if ((v1 & 0x10) == 0)
        {
LABEL_11:
          if ((v1 & 0x20) == 0)
            goto LABEL_12;
          goto LABEL_23;
        }
LABEL_22:
        objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Exercise Goal Achieved"));
        v9 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v9;
        if ((v1 & 0x20) == 0)
        {
LABEL_12:
          if ((v1 & 0x40) == 0)
            goto LABEL_13;
          goto LABEL_24;
        }
LABEL_23:
        objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Stand Goal Achieved"));
        v10 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v10;
        if ((v1 & 0x40) == 0)
        {
LABEL_13:
          if ((v1 & 0x80) == 0)
            goto LABEL_14;
          goto LABEL_25;
        }
LABEL_24:
        objc_msgSend(v2, "arrayByAddingObject:", CFSTR("All Goals Achieved"));
        v11 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v11;
        if ((v1 & 0x80) == 0)
        {
LABEL_14:
          if ((v1 & 0x100) == 0)
            goto LABEL_15;
          goto LABEL_26;
        }
LABEL_25:
        objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Best Move Value Achieved"));
        v12 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v12;
        if ((v1 & 0x100) == 0)
        {
LABEL_15:
          if ((v1 & 0x200) == 0)
            goto LABEL_16;
          goto LABEL_27;
        }
LABEL_26:
        objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Best Exercise Value Achieved"));
        v13 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v13;
        if ((v1 & 0x200) == 0)
        {
LABEL_16:
          if ((v1 & 0x400) == 0)
          {
LABEL_18:
            objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
            v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

            return v3;
          }
LABEL_17:
          objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Mindful Minutes Changed"));
          v5 = objc_claimAutoreleasedReturnValue();

          v2 = (void *)v5;
          goto LABEL_18;
        }
LABEL_27:
        objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Best Move Time Value Achieved"));
        v14 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v14;
        if ((v1 & 0x400) == 0)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    objc_msgSend(v2, "arrayByAddingObject:", CFSTR("Workout Added"));
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
    goto LABEL_8;
  }
  v3 = CFSTR("None");
  return v3;
}

id ACHUnitForTemplateAndActivityMoveMode(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  objc_msgSend(v3, "canonicalUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (ACHUnitForTemplateAndActivityMoveMode_onceToken != -1)
    dispatch_once(&ACHUnitForTemplateAndActivityMoveMode_onceToken, &__block_literal_global_2);
  if (a2 == 2)
  {
    v5 = (void *)ACHUnitForTemplateAndActivityMoveMode_moveModeOverridenTemplates;
    objc_msgSend(v3, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
  }

  return v4;
}

id ACHCountryCode(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  objc_msgSend(v1, "regionCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("en")))
  {
    ACHLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ACHCountryCode_cold_2((uint64_t)v2, (uint64_t)v1, v3);

  }
  if (!v2)
  {
    ACHLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ACHCountryCode_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v2;
}

void ACHEncodeAchievementIntoUserInfoDictionary(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (!v4)
  {
    ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ACHEncodeAchievementIntoUserInfoDictionary_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ACHUserInfoDictionaryEncodedAchievementKey"));

}

id ACHDecodeAchievementFromUserInfoDictionary(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("ACHUserInfoDictionaryEncodedAchievementKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v1, &v19);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v19;
    if (!v2)
    {
      ACHLogDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        ACHDecodeAchievementFromUserInfoDictionary_cold_2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    }
  }
  else
  {
    ACHLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ACHDecodeAchievementFromUserInfoDictionary_cold_1(v3, v11, v12, v13, v14, v15, v16, v17);
    v2 = 0;
  }

  return v2;
}

id _ACHLengthFormatter(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (void *)_ACHLengthFormatter__formatter;
  if (!_ACHLengthFormatter__formatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v3, "setNumberStyle:", 1);
    objc_msgSend(v3, "setMinimumFractionDigits:", 2);
    objc_msgSend(v3, "setMaximumFractionDigits:", 2);
    objc_msgSend(v3, "setRoundingMode:", 3);
    v4 = objc_alloc_init(MEMORY[0x24BDD1630]);
    v5 = (void *)_ACHLengthFormatter__formatter;
    _ACHLengthFormatter__formatter = (uint64_t)v4;

    objc_msgSend((id)_ACHLengthFormatter__formatter, "setNumberFormatter:", v3);
    objc_msgSend((id)_ACHLengthFormatter__formatter, "setUnitStyle:", a1);

    v2 = (void *)_ACHLengthFormatter__formatter;
  }
  return v2;
}

id _ACHLengthFormatterNoDigits(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (void *)_ACHLengthFormatterNoDigits__formatterNoDigits;
  if (!_ACHLengthFormatterNoDigits__formatterNoDigits)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v3, "setNumberStyle:", 1);
    objc_msgSend(v3, "setMinimumFractionDigits:", 0);
    objc_msgSend(v3, "setMaximumFractionDigits:", 0);
    objc_msgSend(v3, "setRoundingMode:", 2);
    v4 = objc_alloc_init(MEMORY[0x24BDD1630]);
    v5 = (void *)_ACHLengthFormatterNoDigits__formatterNoDigits;
    _ACHLengthFormatterNoDigits__formatterNoDigits = (uint64_t)v4;

    objc_msgSend((id)_ACHLengthFormatterNoDigits__formatterNoDigits, "setNumberFormatter:", v3);
    objc_msgSend((id)_ACHLengthFormatterNoDigits__formatterNoDigits, "setUnitStyle:", a1);

    v2 = (void *)_ACHLengthFormatterNoDigits__formatterNoDigits;
  }
  return v2;
}

id ACHFormatCount(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ACHFormatCount_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACHFormatCount_onceToken, &__block_literal_global_303);
  objc_msgSend((id)ACHFormatCount__formatter, "stringFromNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ACHFormatOrdinal(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ACHFormatOrdinal_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACHFormatOrdinal_onceToken, &__block_literal_global_304);
  objc_msgSend((id)ACHFormatOrdinal__formatter, "stringFromNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ACHFormatPercent(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ACHFormatPercent_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACHFormatPercent_onceToken, &__block_literal_global_305);
  objc_msgSend((id)ACHFormatPercent__formatter, "stringFromNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t ACHFormatDuration(void *a1)
{
  uint64_t v1;
  id v2;
  double v3;
  double v4;

  v1 = ACHFormatDuration_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACHFormatDuration_onceToken, &__block_literal_global_306);
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return objc_msgSend((id)ACHFormatDuration__formatter, "stringFromTimeInterval:", v4);
}

id ACHFormatMinutes(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  v1 = ACHFormatMinutes_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACHFormatMinutes_onceToken, &__block_literal_global_308);
  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v4 = objc_msgSend(v2, "integerValue");

  objc_msgSend(v3, "setMinute:", v4);
  objc_msgSend((id)ACHFormatMinutes__formatter, "stringFromDateComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ACHFormatNumberOfDays(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  v1 = ACHFormatNumberOfDays_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACHFormatNumberOfDays_onceToken, &__block_literal_global_310);
  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v4 = objc_msgSend(v2, "integerValue");

  objc_msgSend(v3, "setDay:", v4);
  objc_msgSend((id)ACHFormatNumberOfDays__formatter, "stringFromDateComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ACHFormatDateWithStyle(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  const __CFString *v5;
  void *v6;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setFormattingContext:", 1);
  switch(a2)
  {
    case 0:
      objc_msgSend(v4, "setDateStyle:", 1);
      break;
    case 1:
      v5 = CFSTR("MMMMy");
      goto LABEL_9;
    case 2:
      v5 = CFSTR("MMMy");
      goto LABEL_9;
    case 3:
      v5 = CFSTR("My");
      goto LABEL_9;
    case 4:
      v5 = CFSTR("MMMM d");
      goto LABEL_9;
    case 5:
      v5 = CFSTR("LLLL");
      goto LABEL_9;
    case 6:
      v5 = CFSTR("y");
LABEL_9:
      objc_msgSend(v4, "setLocalizedDateFormatFromTemplate:", v5);
      break;
    default:
      break;
  }
  objc_msgSend(v4, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ACHFormatDistance(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  void *v5;

  v1 = a1;
  _ACHLengthFormatter(2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v4 = v3;

  objc_msgSend(v2, "stringFromMeters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ACHFormatDistanceWithUserUnit(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  v3 = a1;
  _ACHLengthFormatter(2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  objc_msgSend(v4, "stringFromValue:unit:", a2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ACHFormatDistanceWithUserUnitAndUnitStyle(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v7 = a1;
  if ((a4 & 1) != 0)
    _ACHLengthFormatter(a3);
  else
    _ACHLengthFormatterNoDigits(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v10 = v9;

  objc_msgSend(v8, "stringFromValue:unit:", a2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t ACHFormatEnergyWithUserUnit(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;

  v5 = ACHFormatEnergyWithUserUnit_onceToken;
  v6 = a1;
  if (v5 != -1)
    dispatch_once(&ACHFormatEnergyWithUserUnit_onceToken, &__block_literal_global_324);
  objc_msgSend((id)ACHFormatEnergyWithUserUnit__formatter, "setUnitStyle:", a3);
  v7 = (void *)ACHFormatEnergyWithUserUnit__formatter;
  objc_msgSend(v6, "doubleValue");
  v9 = v8;

  return objc_msgSend(v7, "stringFromValue:unit:", a2, round(v9));
}

id ACHFormatEnergyWithUserUnitAndFormatterUnit(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;

  v7 = a1;
  v8 = a2;
  if (ACHFormatEnergyWithUserUnitAndFormatterUnit_onceToken != -1)
    dispatch_once(&ACHFormatEnergyWithUserUnitAndFormatterUnit_onceToken, &__block_literal_global_326);
  objc_msgSend((id)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter, "setUnitStyle:", a4);
  objc_msgSend(MEMORY[0x24BDD4048], "largeCalorieUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  objc_msgSend((id)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter, "setForFoodEnergyUse:", v10);
  v11 = (void *)ACHFormatEnergyWithUserUnitAndFormatterUnit__formatter;
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v11, "stringFromValue:unit:", a3, round(v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t ACHFormatEnergyUnit(uint64_t a1)
{
  if (ACHFormatEnergyUnit_onceToken != -1)
    dispatch_once(&ACHFormatEnergyUnit_onceToken, &__block_literal_global_327);
  return objc_msgSend((id)ACHFormatEnergyUnit__formatter, "unitStringFromValue:unit:", a1, 2.0);
}

id ACHFormatMoveMinutes(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "unsignedIntegerValue");
  ACHBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MOVE_MINUTES"), &stru_24D1281D8, CFSTR("Localizable-tinker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ACHBundle()
{
  if (ACHBundle_onceToken != -1)
    dispatch_once(&ACHBundle_onceToken, &__block_literal_global_338);
  return (id)ACHBundle___bundle;
}

uint64_t ACHSystemRootDirectory()
{
  if (ACHSystemRootDirectory_onceToken != -1)
    dispatch_once(&ACHSystemRootDirectory_onceToken, &__block_literal_global_335);
  return ACHSystemRootDirectory_systemRootDirectory;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ACHCodableAchievementProgressUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 40;
              goto LABEL_25;
            case 2u:
              *(_BYTE *)(a1 + 48) |= 2u;
              v25 = *v3;
              v26 = *(_QWORD *)(a2 + v25);
              if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
                *(_QWORD *)(a2 + v25) = v26 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v27 = 16;
              goto LABEL_35;
            case 3u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 32;
              goto LABEL_25;
            case 4u:
              *(_BYTE *)(a1 + 48) |= 1u;
              v20 = *v3;
              v21 = *(_QWORD *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
                *(_QWORD *)(a2 + v20) = v21 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v27 = 8;
LABEL_35:
              *(_QWORD *)(a1 + v27) = v22;
              goto LABEL_36;
            case 5u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 24;
LABEL_25:
              v23 = *(void **)(a1 + v19);
              *(_QWORD *)(a1 + v19) = v18;

              goto LABEL_36;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_36:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_214048CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_214048F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t ACHTemplateStringFromStrings(void *a1, const char *a2)
{
  return objc_msgSend(a1, "componentsJoinedByString:", a2);
}

uint64_t ACHTemplateStringsFromString(void *a1, const char *a2)
{
  return objc_msgSend(a1, "componentsSeparatedByString:", a2);
}

id ACHEndOfMonthDateComponentsForStartOfMonth(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "hk_gregorianCalendarWithLocalTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 8, 1, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 128, -1, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t ACHCodableAchievementProgressUpdateArrayReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ACHCodableAchievementProgressUpdate *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ACHCodableAchievementProgressUpdate);
        objc_msgSend(a1, "addAchievementProgressUpdate:", v17);
        if (!PBReaderPlaceMark()
          || (ACHCodableAchievementProgressUpdateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACHCodableEarnedInstanceArrayReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ACHCodableEarnedInstance *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ACHCodableEarnedInstance);
        objc_msgSend(a1, "addEarnedInstances:", v17);
        if (!PBReaderPlaceMark() || (ACHCodableEarnedInstanceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21404AC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404AEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404B0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404B348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404B594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404B830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404BAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404BDD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21404BFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21404C224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404C478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404C6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404C950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404CB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21404CD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21404CF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404D1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404D478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404D660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21404D850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21404DADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404DD6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404E0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_21404E384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21404E5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21404E878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

id ACHLegacyKeyTransformations()
{
  if (ACHLegacyKeyTransformations_onceToken != -1)
    dispatch_once(&ACHLegacyKeyTransformations_onceToken, &__block_literal_global_4);
  return (id)ACHLegacyKeyTransformations_ACHBackCompatKeyValueMappingDictionary;
}

id ACHLegacyKeyValueRepresentationFromProperties(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id v13;

  v1 = a1;
  ACHLegacyKeyTransformations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __ACHLegacyKeyValueRepresentationFromProperties_block_invoke;
  v11 = &unk_24D127278;
  v12 = v2;
  v4 = v3;
  v13 = v4;
  v5 = v2;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", &v8);

  if (objc_msgSend(v4, "count", v8, v9, v10, v11))
    v6 = (void *)objc_msgSend(v4, "copy");
  else
    v6 = 0;

  return v6;
}

id ACHAwardsServerInterface()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E870);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x24BDBCF20]);
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithArray:", v2);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_addTemplates_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_addTemplates_removingTemplates_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_addTemplates_removingTemplates_completion_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_removeTemplates_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_fetchAllTemplatesWithCompletion_, 0, 1);
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_addEarnedInstances_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_fetchEarnedInstancesForTemplateUniqueName_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_fetchEarnedInstancesForEarnedDateComponentsString_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_removeEarnedInstances_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_fetchAllEarnedInstancesWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_addEarnedInstances_removingEarnedInstances_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_addEarnedInstances_removingEarnedInstances_completion_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_addEarnedInstances_removingEarnedInstances_completion_, 0, 1);
  v7 = objc_alloc(MEMORY[0x24BDBCF20]);
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v10 = objc_alloc(MEMORY[0x24BDBCF20]);
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_remote_countOfEarnedInstancesForUniqueNames_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_remote_countOfEarnedInstancesForUniqueNames_completion_, 0, 1);
  v13 = objc_alloc(MEMORY[0x24BDBCF20]);
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

  v16 = objc_alloc(MEMORY[0x24BDBCF20]);
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_remote_fetchMostRecentEarnedInstancesForTemplateUniqueNames_completion_, 0, 1);

  return v0;
}

uint64_t ACHCodableEarnedInstanceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  ACHCodableSyncIdentity *v44;
  uint64_t v45;
  uint64_t v46;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x254D63000uLL;
  v8 = 0x254D63000uLL;
  v9 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      v15 = v14 + 1;
      if (v14 == -1 || v15 > *(_QWORD *)(a2 + *v4))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
      *(_QWORD *)(a2 + v13) = v15;
      v12 |= (unint64_t)(v16 & 0x7F) << v10;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v17 = v11++ >= 9;
      if (v17)
      {
        v12 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v18 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(int *)(v7 + 788);
        goto LABEL_45;
      case 2u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(int *)(v8 + 792);
        goto LABEL_45;
      case 3u:
        *(_BYTE *)(a1 + 80) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        v46 = 8;
        goto LABEL_62;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 80) |= 2u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              v17 = v27++ >= 9;
              if (v17)
              {
                v28 = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_52:
        v45 = 16;
        goto LABEL_57;
      case 5u:
        *(_BYTE *)(a1 + 80) |= 8u;
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v34);
          *(_QWORD *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        v46 = 32;
LABEL_62:
        *(_QWORD *)(a1 + v46) = v25;
        goto LABEL_63;
      case 6u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 72;
        goto LABEL_45;
      case 7u:
        v35 = 0;
        v36 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 80) |= 4u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v28 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v17 = v36++ >= 9;
              if (v17)
              {
                v28 = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_56:
        v45 = 24;
LABEL_57:
        *(_QWORD *)(a1 + v45) = v28;
        goto LABEL_63;
      case 8u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 48;
LABEL_45:
        v41 = *(void **)(a1 + v21);
        *(_QWORD *)(a1 + v21) = v20;

        goto LABEL_63;
      case 9u:
        v42 = v8;
        v43 = v7;
        v44 = objc_alloc_init(ACHCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 56), v44);
        if (PBReaderPlaceMark() && ACHCodableSyncIdentityReadFrom((uint64_t)v44, a2))
        {
          PBReaderRecallMark();

          v7 = v43;
          v8 = v42;
LABEL_63:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_63;
    }
  }
}

id ACHMonthlyChallengeTypeNameFromUniqueName(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("_"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t ACHMonthlyChallengeTypeFromTemplateUniqueName(void *a1)
{
  void *v1;
  uint64_t v2;

  ACHMonthlyChallengeTypeNameFromUniqueName(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeAllThreeRings")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeMoveRing")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeExerciseRing")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeStandRing")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalEnergyBurn")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalExerciseMinutes")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalWorkouts")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutRunning")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutOpenWaterSwimming")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutPoolSwimming")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutOutdoorCycling")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutIndoorCycling")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutHIIT")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutYoga")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutHiking")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutElliptical")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutRowing")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutStairs")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutWalking")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalDistance")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeDaysDoublingMoveGoal")) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalMoveTime")) & 1) != 0)
  {
    v2 = 22;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeDaysDoublingExerciseGoal")) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeMoveStreak")) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeDailyEnergyBurnTarget")) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeDailyExerciseMinutesTarget")) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeDailyDistanceTarget")) & 1) != 0)
  {
    v2 = 27;
  }
  else if (objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeDailyAppleMoveTimeTarget")))
  {
    v2 = 28;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

BOOL ACHTemplateUniqueNameIsMonthlyChallenge(void *a1)
{
  return ACHMonthlyChallengeTypeFromTemplateUniqueName(a1) != 0;
}

__CFString *ACHMonthlyChallengeNameFromChallengeType(unint64_t a1)
{
  if (a1 > 0x1D)
    return 0;
  else
    return off_24D127320[a1];
}

uint64_t ACHMonthlyChallengeTypeFromMonthlyChallengeName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeAllThreeRings")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeMoveRing")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeExerciseRing")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeStandRing")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalEnergyBurn")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalExerciseMinutes")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalWorkouts")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutRunning")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutOpenWaterSwimming")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutPoolSwimming")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutOutdoorCycling")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutIndoorCycling")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutHIIT")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutYoga")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutHiking")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutElliptical")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutRowing")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutStairs")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutWalking")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalDistance")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeDaysDoublingMoveGoal")) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalAppleMoveTime")) & 1) != 0)
  {
    v2 = 22;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("ACHMonthlyChallengeTypeDaysDoublingExerciseGoal")) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("ACHMonthlyChallengeTypeMoveStreak")) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeDailyEnergyBurnTarget")) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeDailyExerciseMinutesTarget")) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("ACHMonthlyChallengeTypeDailyDistanceTarget")) & 1) != 0)
  {
    v2 = 27;
  }
  else if (objc_msgSend(v1, "isEqual:", CFSTR("ACHMonthlyChallengeTypeDailyAppleMoveTimeTarget")))
  {
    v2 = 28;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t ACHMonthlyChallengeTypeFromLegacyString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeAllThreeRings")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeMoveRing")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeExerciseRing")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeStandRing")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeAverageDailyEnergyBurn")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalEnergyBurn")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeAverageDailyExerciseMinutes")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalExerciseMinutes")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalWorkouts")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutRunning")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutOpenWaterSwimming")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutPoolSwimming")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutOutdoorCycling")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ACHMonthlyChallengeTypeTotalSpecificWorkoutIndoorCycling")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutHIIT")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutYoga")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutHiking")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutElliptical")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutRowing")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutStairs")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalSpecificWorkoutWalking")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeTotalDistance")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeDaysDoublingMoveGoal")) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeDaysDoublingExerciseGoal")) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeMoveStreak")) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeDailyEnergyBurnTarget")) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MonthlyChallengeTypeDailyExerciseMinutesTarget")) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeDailyDistanceTarget")) & 1) != 0)
  {
    v2 = 27;
  }
  else if (objc_msgSend(v1, "isEqual:", CFSTR("MonthlyChallengeTypeDailyAppleMoveTimeTarget")))
  {
    v2 = 28;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t ACHMonthlyChallengeAchievementIsDayBased(void *a1)
{
  void *v1;
  void *v2;
  char v3;

  objc_msgSend(a1, "template");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v2);

  return (0x1FA0001Eu >> v3) & 1;
}

id ACHMonthlyChallengeAchievementFromAchievementsForDate(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  objc_msgSend(v6, "hk_startOfMonthForDate:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v5;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v19 = v7;
    v20 = v6;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "template", v19, v20, (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((ACHTemplateIsMonthlyChallenge(v14) & 1) != 0)
        {
          objc_msgSend(v13, "template");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "availabilityStart");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v8);

          if (v17)
          {
            v10 = v13;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
LABEL_12:
    v7 = v19;
    v6 = v20;
  }

  return v10;
}

id ACHMonthlyChallengeCacheValue(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;
  ACHPredicateExpressionValidator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;

  v1 = a1;
  objc_msgSend(v1, "uniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v2);

  objc_msgSend(v1, "availabilityStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(ACHPredicateExpressionValidator);
  objc_msgSend(v1, "goalExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHPredicateExpressionValidator validateExpressionString:](v5, "validateExpressionString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isValid"))
  {
    v8 = (void *)MEMORY[0x24BDD1548];
    objc_msgSend(v1, "goalExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expressionWithFormat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "expressionValueWithObject:context:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dailyTarget");
    if (v12 > 0.0)
    {
      objc_msgSend(v1, "dailyTargetCanonicalUnit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v1, "dailyTarget");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v15;
      }
    }
    objc_msgSend(v1, "availableSuffixes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("|"));
      v28 = v10;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDD17C8];
      ACHMonthlyChallengeNameFromChallengeType(v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v4, "year");
      v27 = objc_msgSend(v4, "month");
      v23 = v20;
      v10 = v28;
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@_%04ld_%02ld_%@_%@"), v21, v22, v27, v11, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = (void *)MEMORY[0x24BDD17C8];
      ACHMonthlyChallengeNameFromChallengeType(v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@_%04ld_%02ld_%@"), v19, objc_msgSend(v4, "year"), objc_msgSend(v4, "month"), v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t ACHMonthlyTemplateDisplayOrder(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = objc_msgSend(v3, "year");
  v5 = objc_msgSend(v3, "month");

  return v5 + a2 + 100 * v4;
}

uint64_t ACHWorkoutActivityTypeForMonthlyChallengeType(unint64_t a1)
{
  char *v1;
  NSObject *v3;

  if (a1 - 8 >= 0xC)
  {
    ACHLogTemplates();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      ACHWorkoutActivityTypeForMonthlyChallengeType_cold_1(a1, v3);

    v1 = (char *)MEMORY[0x24BDD4500];
  }
  else
  {
    v1 = (char *)&unk_214063AB8 + 8 * a1 - 64;
  }
  return *(_QWORD *)v1;
}

uint64_t ACHWorkoutLocationTypeForMonthlyChallengeType(uint64_t a1)
{
  if (a1 == 12)
    return 1;
  else
    return 2 * (a1 == 11);
}

double ACHLowRuleThresholdForChallenge(uint64_t a1)
{
  double result;

  result = 0.0;
  if ((unint64_t)(a1 - 1) <= 0x17)
    return dbl_214063B18[a1 - 1];
  return result;
}

id ACHDeviceCapabilitiesForMonthlyChallenges()
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("06943DC7-5853-4025-B160-D33A8C0D0449"));
  v3[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t ACHMonthlyChallengeHasRequiredDeviceCapability(unint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (a1 > 0x1D)
  {
    v6 = 0;
  }
  else if (((1 << a1) & 0x1F8FFF80) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("06943DC7-5853-4025-B160-D33A8C0D0449"));
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = ((1 << a1) & 0x20500061) == 0;
  }

  return v6;
}

BOOL ACHMonthlyChallengeShouldUseAvailableSuffixes(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  double v11;

  v1 = a1;
  objc_msgSend(v1, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v3);

  if (v4)
  {
    objc_msgSend(v1, "template");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = ACHMonthlyChallengeTypeFromTemplateUniqueName(v6);

    v8 = 1;
    if (v7 <= 0x16)
    {
      if (((1 << v7) & 0x500060) != 0)
      {
        objc_msgSend(v1, "customPlaceholderValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("reference_progress_value"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "doubleValue");
        v8 = v11 > 0.0;

      }
      else
      {
        v8 = v7 != 0;
      }
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

__CFString *ACHDuplicateRemovalStrategyToString(char a1)
{
  if ((a1 - 1) > 3u)
    return 0;
  else
    return off_24D1276A8[(char)(a1 - 1)];
}

const __CFString *ACHEarnDateStrategyToString(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Current Date");
  if (a1 != 1)
    v1 = 0;
  if (a1 == 2)
    return CFSTR("Yesterday");
  else
    return v1;
}

id ACHSortedTemplates(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD17C0];
  v2 = a1;
  objc_msgSend(v1, "sortDescriptorWithKey:ascending:", CFSTR("key"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t ACHTemplateIsBuiltIn(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, CFSTR("BuiltIn"));
}

uint64_t ACHTemplateIsPerfectMonth(void *a1)
{
  return ACHTemplateSourceNameIsEqualToIdentifier(a1, CFSTR("PerfectMonth"));
}

id ACHServerInterface()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E8D0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x24BDBCF20]);
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithArray:", v2);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_fetchAllTemplatesWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_removeTemplate_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_addTemplate_completion_, 0, 0);
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remote_fetchAllEarnedInstancesWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_remote_addEarnedInstance_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_remote_removeEarnedInstance_completion_, 0, 0);
  v8 = objc_alloc(MEMORY[0x24BDBCF20]);
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  objc_msgSend(v10, "setByAddingObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_remote_fetchAllAchievementsWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_remote_fetchAchievementWithTemplateUniqueName_completion_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_remote_fetchEphemeralAchievementWithTemplateUniqueName_completion_, 1, 1);
  v12 = objc_alloc(MEMORY[0x24BDBCF20]);
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13, v16[0]);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_remote_availableMobileAssetsWithCompletion_, 0, 1);
  return v0;
}

uint64_t ACHCodableLegacyAchievementReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t result;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  void *v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 56;
          goto LABEL_50;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 68) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  v22 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_61:
          v53 = 8;
          goto LABEL_74;
        case 3u:
          *(_BYTE *)(a1 + 68) |= 2u;
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v54 = 16;
          goto LABEL_79;
        case 4u:
          *(_BYTE *)(a1 + 68) |= 4u;
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v29 = 0;
          }
          v54 = 24;
LABEL_79:
          *(_QWORD *)(a1 + v54) = v29;
          continue;
        case 5u:
          v32 = 0;
          v33 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 68) |= 8u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v36;
              v22 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  v22 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_65:
          v53 = 32;
          goto LABEL_74;
        case 7u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          *(_BYTE *)(a1 + 68) |= 0x20u;
          while (2)
          {
            v42 = *v3;
            v43 = *(_QWORD *)(a2 + v42);
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
              *(_QWORD *)(a2 + v42) = v44;
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                v15 = v40++ >= 9;
                if (v15)
                {
                  v41 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v41 = 0;
LABEL_69:
          *(_BYTE *)(a1 + 64) = v41 != 0;
          continue;
        case 8u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
LABEL_50:
          v46 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 9u:
          v47 = 0;
          v48 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 68) |= 0x10u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v49 = *v3;
        v50 = *(_QWORD *)(a2 + v49);
        v51 = v50 + 1;
        if (v50 == -1 || v51 > *(_QWORD *)(a2 + *v4))
          break;
        v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
        *(_QWORD *)(a2 + v49) = v51;
        v22 |= (unint64_t)(v52 & 0x7F) << v47;
        if ((v52 & 0x80) == 0)
          goto LABEL_71;
        v47 += 7;
        v15 = v48++ >= 9;
        if (v15)
        {
          v22 = 0;
          goto LABEL_73;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_71:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_73:
      v53 = 40;
LABEL_74:
      *(_QWORD *)(a1 + v53) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ACHSortedEarnedInstances(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ACHCanonicalEarnedInstanceUnitForQuantity(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isCompatibleWithUnit:", v2);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isCompatibleWithUnit:", v5);

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "isCompatibleWithUnit:", v7);

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "isCompatibleWithUnit:", v9);

        if (!v10)
        {
          v11 = 0;
          goto LABEL_10;
        }
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
        v4 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v11 = (void *)v4;
LABEL_10:

  return v11;
}

ACHCodableEarnedInstance *ACHCodableFromEarnedInstance(void *a1)
{
  id v1;
  ACHCodableEarnedInstance *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ACHCodableSyncIdentity *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v1 = a1;
  v2 = objc_alloc_init(ACHCodableEarnedInstance);
  -[ACHCodableEarnedInstance setKey:](v2, "setKey:", objc_msgSend(v1, "key"));
  objc_msgSend(v1, "templateUniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableEarnedInstance setTemplateUniqueName:](v2, "setTemplateUniqueName:", v3);

  objc_msgSend(v1, "createdDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[ACHCodableEarnedInstance setCreatedDate:](v2, "setCreatedDate:");

  objc_msgSend(v1, "earnedDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableEarnedInstance setEarnedDateComponents:](v2, "setEarnedDateComponents:", v6);

  -[ACHCodableEarnedInstance setCreatorDevice:](v2, "setCreatorDevice:", objc_msgSend(v1, "creatorDevice"));
  objc_msgSend(v1, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v1, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ACHCanonicalEarnedInstanceUnitForQuantity(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValueForUnit:", v9);
    -[ACHCodableEarnedInstance setValue:](v2, "setValue:");

    objc_msgSend(v9, "unitString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableEarnedInstance setValueUnitString:](v2, "setValueUnitString:", v11);

  }
  objc_msgSend(v1, "externalIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v1, "externalIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableEarnedInstance setExternalIdentifier:](v2, "setExternalIdentifier:", v13);

  }
  objc_msgSend(v1, "syncIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(ACHCodableSyncIdentity);
    objc_msgSend(v1, "syncIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hardwareIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableSyncIdentity setHardwareIdentifier:](v15, "setHardwareIdentifier:", v17);

    objc_msgSend(v1, "syncIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "databaseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableSyncIdentity setDatabaseIdentifier:](v15, "setDatabaseIdentifier:", v19);

    objc_msgSend(v1, "syncIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "instanceDiscriminator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHCodableSyncIdentity setInstanceDiscriminator:](v15, "setInstanceDiscriminator:", v21);

    -[ACHCodableEarnedInstance setSyncIdentity:](v2, "setSyncIdentity:", v15);
  }

  return v2;
}

ACHCodableAchievementProgressUpdate *ACHCodableFromAchievementProgressUpdate(void *a1)
{
  id v1;
  ACHCodableAchievementProgressUpdate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v1 = a1;
  v2 = objc_alloc_init(ACHCodableAchievementProgressUpdate);
  objc_msgSend(v1, "templateUniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievementProgressUpdate setTemplateUniqueName:](v2, "setTemplateUniqueName:", v3);

  objc_msgSend(v1, "progressQuantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievementProgressUpdate setProgressQuantityUnit:](v2, "setProgressQuantityUnit:", v6);

  objc_msgSend(v1, "progressQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "progressQuantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_unit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v9);
  -[ACHCodableAchievementProgressUpdate setProgressQuantityValue:](v2, "setProgressQuantityValue:");

  objc_msgSend(v1, "goalQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_unit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unitString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievementProgressUpdate setGoalQuantityUnit:](v2, "setGoalQuantityUnit:", v12);

  objc_msgSend(v1, "goalQuantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "goalQuantity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_unit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v15);
  -[ACHCodableAchievementProgressUpdate setGoalQuantityValue:](v2, "setGoalQuantityValue:");

  return v2;
}

ACHCodableAchievementArray *ACHCodableFromAchievementArray(void *a1)
{
  void *v1;
  void *v2;
  ACHCodableAchievementArray *v3;

  objc_msgSend(a1, "hk_map:", &__block_literal_global_7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = objc_alloc_init(ACHCodableAchievementArray);
  -[ACHCodableAchievementArray setAchievements:](v3, "setAchievements:", v2);

  return v3;
}

uint64_t ACHSetMobileAssetServerURL()
{
  return ASSetAssetServerURLForAssetType();
}

uint64_t ACHMobileAssetServerURLWithError()
{
  return ASServerURLForAssetType();
}

void RemoteAchievementTemplateFromTemplateAssetAndBuildVersion_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_214029000, a2, OS_LOG_TYPE_ERROR, "Remote Template unique name is nil! Identifier key not found at: %{public}@", (uint8_t *)&v2, 0xCu);
}

void ACHApplyBadgePropertiesToAchievement_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_214029000, a2, OS_LOG_TYPE_ERROR, "Could not determine color for monthly achievement %@.", (uint8_t *)&v5, 0xCu);

}

void ACHApplyBadgePropertiesToAchievement_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_214029000, log, OS_LOG_TYPE_ERROR, "Unable to read the badge properties for achievement: %@. BadgePropertiesListPath: %@", (uint8_t *)&v3, 0x16u);
}

void ACHCountryCode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_214029000, a1, a3, "Country code came back as nil!", a5, a6, a7, a8, 0);
}

void ACHCountryCode_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_214029000, log, OS_LOG_TYPE_ERROR, "Got an invalid country code of %{public}@ from locale %{public}@!", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

void ACHEncodeAchievementIntoUserInfoDictionary_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_214029000, a2, a3, "Error encoding achievement for user info dictionary: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ACHDecodeAchievementFromUserInfoDictionary_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_214029000, a1, a3, "No encoded achievement found in user info dictionary", a5, a6, a7, a8, 0);
}

void ACHDecodeAchievementFromUserInfoDictionary_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_214029000, a2, a3, "Error decoding achievement for user info dictionary: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void ACHWorkoutActivityTypeForMonthlyChallengeType_cold_1(unint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  ACHMonthlyChallengeNameFromChallengeType(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_214029000, a2, OS_LOG_TYPE_FAULT, "Could not determine HKWorkoutActivityType for monthly challenge with type: %@", (uint8_t *)&v4, 0xCu);

}

uint64_t ASServerURLForAssetType()
{
  return MEMORY[0x24BE66B28]();
}

uint64_t ASSetAssetServerURLForAssetType()
{
  return MEMORY[0x24BE66B30]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

uint64_t FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural()
{
  return MEMORY[0x24BE326F0]();
}

uint64_t FIRandomStringForPrefixWithTableName()
{
  return MEMORY[0x24BE32788]();
}

uint64_t HKCompareDoubles()
{
  return MEMORY[0x24BDD2AD0]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x24BDD2B28]();
}

uint64_t HKFirstDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x24BDD2EC8]();
}

uint64_t HKLastDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x24BDD2F98]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x24BE7AFB0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

