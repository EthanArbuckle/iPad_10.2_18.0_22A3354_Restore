@implementation HKFeatureSettings(HKMenstrualCycles)

- (uint64_t)menstruationProjectionsEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "numberForKey:", CFSTR("MenstruationProjectionsEnabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)fertileWindowProjectionsEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "numberForKey:", CFSTR("FertileWindowProjectionsEnabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)isLoggingVisibleForDisplayTypeIdentifier:()HKMenstrualCycles
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (CFSTR("DisplayTypeIdentifierMenstrualFlow") == a3)
    return 1;
  HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier((uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "numberForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", MEMORY[0x24BDBD1C8]) ^ 1;

  return v6;
}

- (uint64_t)projectionsEnabledSettingsHaveChangedFromFeatureSettings:()HKMenstrualCycles
{
  id v4;
  int v5;
  uint64_t v6;
  int v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "menstruationProjectionsEnabled");
  if (v5 == objc_msgSend(v4, "menstruationProjectionsEnabled"))
  {
    v7 = objc_msgSend(a1, "fertileWindowProjectionsEnabled");
    v6 = v7 ^ objc_msgSend(v4, "fertileWindowProjectionsEnabled");
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (uint64_t)initWithMenstruationProjectionsEnabled:()HKMenstrualCycles fertileWindowProjectionsEnabled:areFertilityTrackingDisplayTypesVisible:isSexualActivityDisplayTypeVisible:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("MenstruationProjectionsEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("FertileWindowProjectionsEnabled"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  _HKMCFertilityDisplayTypeIdentifiers();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    v17 = a5 ^ 1u;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v21);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a6 ^ 1u);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier((uint64_t)CFSTR("DisplayTypeIdentifierSexualActivity"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, v23);

  v24 = objc_msgSend(a1, "initWithDictionary:", v10);
  return v24;
}

- (uint64_t)deviationDetectionEnabledForType:()HKMenstrualCycles
{
  void *v4;
  void *v5;
  uint64_t v6;

  HKFeatureSettingsKeyForDeviationDetectionTypeEnabled(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "numberForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", MEMORY[0x24BDBD1C0]) ^ 1;

  return v6;
}

- (uint64_t)deviationDetectionEnabledForAnyType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  HKMCAllDeviationTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(a1, "deviationDetectionEnabledForType:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "integerValue", (_QWORD)v9)) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (uint64_t)deviationDetectionEnabledForAllTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  HKMCAllDeviationTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(a1, "deviationDetectionEnabledForType:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "integerValue", (_QWORD)v9)))
        {
          v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (uint64_t)deviationDetectionEnabledSetExplicitlyForAnyType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  HKMCAllDeviationTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        HKFeatureSettingsKeyForDeviationDetectionTypeEnabled(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "integerValue", (_QWORD)v11));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "numberForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

@end
