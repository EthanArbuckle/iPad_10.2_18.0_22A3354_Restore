@implementation BMItemType

+ (BMItemType)toggledDoNotDisturb
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("ToggledDoNotDisturb"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "doNotDisturbStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global);
  return v2;
}

uint64_t __47__BMItemType_DoNotDisturb__toggledDoNotDisturb__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "BOOLValue"));
}

+ (BMItemType)appIntentClass
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AppIntentClass"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appIntentsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_0);
  return v2;
}

id __37__BMItemType_Intents__appIntentClass__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0A0], "intentClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("INSendMessageIntent")) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@"), v9, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BMItemType)appIntentAutomationHash
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AppIntentAutomationHash"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appIntentsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_11);
  return v2;
}

id __46__BMItemType_Intents__appIntentAutomationHash__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t *v31;
  char v32;
  _QWORD v33[3];
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v25 = a2;
  objc_msgSend(v25, "interaction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "direction") != 2)
  {
    objc_msgSend(v25, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B0A0], "intentClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v26, "intent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentWithTypedIntent();
      v6 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject _isEligibleForSuggestions](v6, "_isEligibleForSuggestions"))
      {
        -[NSObject _parameterCombinations](v6, "_parameterCombinations");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = (void *)objc_msgSend(v7, "count");

        if (v2)
        {
          v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          -[NSObject _validParameterCombinations](v6, "_validParameterCombinations");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 0;
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v48 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                -[NSObject _validParameterCombinations](v6, "_validParameterCombinations");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKey:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v8, "unionSet:", v14);
                LOBYTE(v14) = objc_msgSend(v16, "isPrimary");

                v10 |= v14;
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
            }
            while (v11);
          }

          v41 = 0;
          v42 = &v41;
          v43 = 0x3032000000;
          v44 = __Block_byref_object_copy_;
          v45 = __Block_byref_object_dispose_;
          v46 = 0;
          v35 = 0;
          v36 = &v35;
          v37 = 0x3032000000;
          v38 = __Block_byref_object_copy_;
          v39 = __Block_byref_object_dispose_;
          v40 = 0;
          v33[0] = 0;
          v33[1] = v33;
          v33[2] = 0x2020000000;
          v34 = (v10 & 1) == 0;
          -[NSObject _validParameterCombinations](v6, "_validParameterCombinations");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_13;
          v27[3] = &unk_24D21E788;
          v29 = v33;
          v30 = &v41;
          v6 = v6;
          v28 = v6;
          v31 = &v35;
          v32 = v10 & 1;
          objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v27);
          if (v42[5] && v36[5])
          {
            v18 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v25, "source");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "bundleID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v42[5], "debugDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%@:%@"), v20, v21, v36[5]);
            v2 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v2 = 0;
          }

          _Block_object_dispose(v33, 8);
          _Block_object_dispose(&v35, 8);

          _Block_object_dispose(&v41, 8);
        }
        goto LABEL_21;
      }
    }
    else
    {
      BMLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_cold_1((uint64_t)v25, v6, v22);
    }
    v2 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v2 = 0;
LABEL_22:

  return v2;
}

void __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_13(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  if ((objc_msgSend(a3, "isPrimary") & 1) != 0
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")
     || (v22 = objc_msgSend(v8, "count"),
         v22 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v23 = 0;
    objc_msgSend(MEMORY[0x24BE1AFA8], "md5forDictionary:error:", v9, &v23);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v23;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v17;

    if (v18)
    {
      BMLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_13_cold_1(a1, v21);

    }
    if (objc_msgSend(v8, "containsObject:", CFSTR("content")))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else if (*(_BYTE *)(a1 + 64))
    {
      *a4 = 1;
    }

  }
}

+ (BMItemType)relevanceIntentHash
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("RelevanceIntentHash"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appIntentsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_23);
  return v2;
}

id __42__BMItemType_Intents__relevanceIntentHash__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMCreateShortcutFilter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentByFilteringIntent:withLevel:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v2, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifierForIntent:bundleIdentifier:", v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (BMItemType)relevanceCoarseIntentHash
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("RelevanceCoarseIntentHash"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appIntentsStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_26);
  return v2;
}

id __48__BMItemType_Intents__relevanceCoarseIntentHash__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMCreateShortcutFilter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentByFilteringIntent:withLevel:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v2, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifierForIntent:bundleIdentifier:", v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (BMItemType)appActivityType
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AppActivityType"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_1);
  return v2;
}

id __42__BMItemType_AppActivity__appActivityType__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = a2;
  v3 = (void *)MEMORY[0x2199D5B54]();
  objc_msgSend(v2, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v2, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B018], "isEligibleForPrediction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "BOOLValue"))
      goto LABEL_9;
    objc_msgSend(v2, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B018], "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v5, v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_9:
      v6 = 0;
    }

  }
  objc_autoreleasePoolPop(v3);

  return v6;
}

+ (BMItemType)relevanceAppActivityHash
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("RelevanceAppActivityHash"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_13);
  return v2;
}

id __51__BMItemType_AppActivity__relevanceAppActivityHash__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B018], "userActivityRequiredString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "_initWithUserActivityStrings:secondaryString:optionalData:", v5, 0, 0);
  BMCreateShortcutFilter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userActivityByFilteringUserActivity:withLevel:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v7 && v8)
  {
    objc_msgSend(v2, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifierForUserActivity:bundleIdentifier:", v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (BMItemType)relevanceCoarseAppActivityHash
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("RelevanceCoarseAppActivityHash"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_16);
  return v2;
}

id __57__BMItemType_AppActivity__relevanceCoarseAppActivityHash__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B018], "userActivityRequiredString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1598]), "_initWithUserActivityStrings:secondaryString:optionalData:", v5, 0, 0);
  BMCreateShortcutFilter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userActivityByFilteringUserActivity:withLevel:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v7 && v8)
  {
    objc_msgSend(v2, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifierForUserActivity:bundleIdentifier:", v8, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (BMItemType)toggledLowPowerMode
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("ToggledLowPowerMode"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "deviceLowPowerModeStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_2);
  return v2;
}

uint64_t __47__BMItemType_LowPowerMode__toggledLowPowerMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "BOOLValue"));
}

+ (BMItemType)firstBacklightAfterWakeup
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("FirstBacklightAfterWakeup"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "userIsFirstBacklightOnAfterWakeup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_3);
  return v2;
}

id __45__BMItemType_User__firstBacklightAfterWakeup__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "BOOLValue"))
    return MEMORY[0x24BDBD1C8];
  else
    return 0;
}

+ (BMItemType)bluetoothConnectedToDevice
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("BluetoothConnectedToDevice"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "bluetoothIsConnectedStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_4);
  return v2;
}

id __51__BMItemType_Bluetooth__bluetoothConnectedToDevice__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "deviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BMItemType)bluetoothConnectedToDeviceWithName
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("BluetoothConnectedToDeviceWithName"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "bluetoothIsConnectedStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_9);
  return v2;
}

id __59__BMItemType_Bluetooth__bluetoothConnectedToDeviceWithName__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BMItemType)bluetoothConnectedToDeviceWithAddress
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("BluetoothConnectedToDeviceWithAddress"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "bluetoothIsConnectedStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_12);
  return v2;
}

id __62__BMItemType_Bluetooth__bluetoothConnectedToDeviceWithAddress__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BMItemType)mediaIsPlaying
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("MediaIsPlaying"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  objc_msgSend(MEMORY[0x24BE1B130], "nowPlayingStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_5);
  return v2;
}

uint64_t __35__BMItemType_Media__mediaIsPlaying__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "playing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 1)
    return MEMORY[0x24BDBD1C8];
  else
    return 0;
}

+ (BMItemType)mediaGenreStartedPlaying
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("MediaGenreStartedPlaying"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "nowPlayingStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_9_0);
  return v2;
}

id __45__BMItemType_Media__mediaGenreStartedPlaying__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B0D8], "genre");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BMItemType)hourOfDay
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("HourOfDay"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  return v2;
}

+ (BMItemType)hourOfDaySlot
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("HourOfDaySlot"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  return v2;
}

+ (BMItemType)dayOfWeek
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("DayOfWeek"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  return v2;
}

+ (BMItemType)isWeekend
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("IsWeekend"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  return v2;
}

+ (NSSet)temporalItemTypes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x24BDBCF20]);
  +[BMItemType hourOfDay](BMItemType, "hourOfDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType hourOfDaySlot](BMItemType, "hourOfDaySlot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType dayOfWeek](BMItemType, "dayOfWeek");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMItemType isWeekend](BMItemType, "isWeekend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  return (NSSet *)v7;
}

+ (BMItemType)appOpened
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AppOpened"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_6);
  return v2;
}

id __35__BMItemType_AppInFocus__appOpened__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (BMIsNotAppExtension(v2))
  {
    objc_msgSend(v2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BMItemType)appLaunchedReason
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AppLaunchedReason"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_7);
  return v2;
}

id __43__BMItemType_AppInFocus__appLaunchedReason__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (BMIsNotAppExtension(v2))
  {
    objc_msgSend(v2, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B020], "launchReason");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BMItemType)appInFocus
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AppInFocus"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_10);
  return v2;
}

id __36__BMItemType_AppInFocus__appInFocus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (BMIsNotAppExtension(v2))
  {
    objc_msgSend(v2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BMItemType)bundleIdOfShareExtensionOpened
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("ShareExtensionOpened"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_13_0);
  return v2;
}

id __56__BMItemType_AppInFocus__bundleIdOfShareExtensionOpened__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (BMIsShareExtension(v2))
  {
    objc_msgSend(v2, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BMItemType)bundleIdOfHostOpenedShareExtension
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AppHostOpenedShareExtension"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_16_0);
  return v2;
}

id __60__BMItemType_AppInFocus__bundleIdOfHostOpenedShareExtension__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (BMIsShareExtension(v2))
  {
    objc_msgSend(v2, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B020], "extensionHostIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BMItemType)alarmSnoozedAny
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AlarmSnoozedAny"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "alarmStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_7);
  return v2;
}

__CFString *__36__BMItemType_Alarm__alarmSnoozedAny__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFE8], "snoozed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
    v4 = CFSTR("ANY");
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (BMItemType)alarmStoppedAny
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AlarmStoppedAny"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "alarmStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_9_1);
  return v2;
}

__CFString *__36__BMItemType_Alarm__alarmStoppedAny__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFE8], "stopped");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
    v4 = CFSTR("ANY");
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (BMItemType)alarmSnoozedWithID
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AlarmSnoozedWithID"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "alarmStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_12_0);
  return v2;
}

id __39__BMItemType_Alarm__alarmSnoozedWithID__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFE0], "isSleep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("WAKEUP");
  if (!v5)
    v6 = CFSTR("EXISTING");
  v7 = v6;

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFE0], "alarmID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1AFE8], "snoozed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqual:", v14))
    v15 = v12;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

+ (BMItemType)alarmStoppedWithID
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("AlarmStoppedWithID"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "alarmStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_22);
  return v2;
}

id __39__BMItemType_Alarm__alarmStoppedWithID__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFE0], "isSleep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("WAKEUP");
  if (!v5)
    v6 = CFSTR("EXISTING");
  v7 = v6;

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFE0], "alarmID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1AFE8], "stopped");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqual:", v14))
    v15 = v12;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

+ (BMItemType)connectedToCarPlay
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("ConnectedToCarPlay"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "carPlayIsConnectedStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_8);
  return v2;
}

uint64_t __41__BMItemType_CarPlay__connectedToCarPlay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "BOOLValue"));
}

+ (BMItemType)locationIdentifier
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("CoreRoutineLocationIdentifier"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)enterLocation
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("CoreRoutineEnterLocation"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)exitLocation
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("CoreRoutineExitLocation"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 2);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionMechanism
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionMechanism"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionDirection
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionDirection"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionContentURL
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionContentURL"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionSender
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionSender"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionRecipients
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionRecipients"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionPhotoScene
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionPhotoScene"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionPhotoContact
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionPhotoContact"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionPhotoLocation
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionPhotoLocation"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionUTIType
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionUTIType"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionTextTopic
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionTextTopic"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionSharingSourceBundleID
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionSharingSourceBundleID"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionTargetBundleID
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionTargetBundleID"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (BMItemType)interactionExtractedTopicFromAttachment
{
  BMItemType *v2;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("InteractionExtractedTopicFromAttachment"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  -[BMItemType setEventStream:](v2, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", 0);
  return v2;
}

+ (NSSet)interactionItemTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v15 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1, "interactionMechanism");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionDirection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionContentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionSender");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionRecipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionPhotoScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionPhotoContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionPhotoLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionUTIType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionTextTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionSharingSourceBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionTargetBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionExtractedTopicFromAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObjects:", v18, v17, v3, v14, v13, v4, v5, v6, v7, v8, v9, v10, v11, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v16;
}

+ (BMItemType)connectedToExternalAudioOutput
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("ConnectedToExternalAudioOutput"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "audioOutputRouteStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_10);
  return v2;
}

id __51__BMItemType_Audio__connectedToExternalAudioOutput__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B030], "external");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
    v4 = (void *)MEMORY[0x24BDBD1C8];
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)taskSpecificItemWithIdentifier:(id)a3 valueClass:(Class)a4
{
  id v5;
  BMItemType *v6;

  v5 = a3;
  v6 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v6, "setIdentifier:", v5);

  -[BMItemType setValueClass:](v6, "setValueClass:", a4);
  -[BMItemType setEdge:](v6, "setEdge:", 1);
  -[BMItemType setEventStream:](v6, "setEventStream:", 0);
  -[BMItemType setValueExtractBlock:](v6, "setValueExtractBlock:", 0);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BMItemType *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(BMItemType);
  -[BMItemType identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setIdentifier:](v4, "setIdentifier:", v5);

  -[BMItemType setValueClass:](v4, "setValueClass:", -[BMItemType valueClass](self, "valueClass"));
  -[BMItemType setEdge:](v4, "setEdge:", -[BMItemType edge](self, "edge"));
  -[BMItemType eventStream](self, "eventStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v4, "setEventStream:", v6);

  -[BMItemType valueExtractBlock](self, "valueExtractBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setValueExtractBlock:](v4, "setValueExtractBlock:", v7);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BMItemType *v4;
  BMItemType *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (BMItemType *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[BMItemType identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMItemType identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[BMItemType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BMItemType identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> identifier: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)extractValueFromDKEvent:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BMItemType eventStream](self, "eventStream");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    -[BMItemType valueExtractBlock](self, "valueExtractBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[BMItemType valueExtractBlock](self, "valueExtractBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v8 = 0;
  }

LABEL_7:
  return v8;
}

- (id)extractItemFromDKEvent:(id)a3
{
  void *v4;
  BMItem *v5;

  -[BMItemType extractValueFromDKEvent:](self, "extractValueFromDKEvent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[BMItem initWithType:value:]([BMItem alloc], "initWithType:value:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)extractEventFromDKEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  void *v9;
  BMEvent *v10;

  v4 = a3;
  -[BMItemType extractItemFromDKEvent:](self, "extractItemFromDKEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[BMItemType edge](self, "edge");
    if (v8)
    {
      if (v8 != 2)
      {
LABEL_8:
        v10 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v6, v7, v5);

        goto LABEL_9;
      }
      v9 = v7;
    }
    else
    {
      v9 = v6;
      v6 = v7;
    }
    v7 = v9;

    v6 = v7;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (NSMutableSet)allRegisteredItemTypes
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)_allRegisteredItemTypes;
  if (!_allRegisteredItemTypes)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v5 = (void *)_allRegisteredItemTypes;
    _allRegisteredItemTypes = (uint64_t)v4;

    v3 = (void *)_allRegisteredItemTypes;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return (NSMutableSet *)v6;
}

+ (void)registerItemType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  if (v6)
  {
    objc_msgSend(v4, "allRegisteredItemTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  objc_sync_exit(v4);

}

+ (void)unregisterItemType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  if (v6)
  {
    objc_msgSend(v4, "allRegisteredItemTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

  }
  objc_sync_exit(v4);

}

+ (NSSet)allItemTypes
{
  void *v3;
  void *v4;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__BMItemType_allItemTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allItemTypes_onceToken != -1)
    dispatch_once(&allItemTypes_onceToken, block);
  objc_msgSend(a1, "allRegisteredItemTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v4;
}

void __26__BMItemType_allItemTypes__block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "hourOfDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerItemType:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "hourOfDaySlot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerItemType:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "dayOfWeek");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerItemType:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "isWeekend");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerItemType:", v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "appOpened");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerItemType:", v11);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "appLaunchedReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerItemType:", v13);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "appInFocus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerItemType:", v15);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v16, "bundleIdOfShareExtensionOpened");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerItemType:", v17);

  v18 = *(void **)(a1 + 32);
  objc_msgSend(v18, "bundleIdOfHostOpenedShareExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerItemType:", v19);

  v20 = *(void **)(a1 + 32);
  objc_msgSend(v20, "appIntentClass");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerItemType:", v21);

  v22 = *(void **)(a1 + 32);
  objc_msgSend(v22, "appIntentAutomationHash");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerItemType:", v23);

  v24 = *(void **)(a1 + 32);
  objc_msgSend(v24, "relevanceIntentHash");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerItemType:", v25);

  v26 = *(void **)(a1 + 32);
  objc_msgSend(v26, "relevanceCoarseIntentHash");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "registerItemType:", v27);

  v28 = *(void **)(a1 + 32);
  objc_msgSend(v28, "appActivityType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerItemType:", v29);

  v30 = *(void **)(a1 + 32);
  objc_msgSend(v30, "relevanceAppActivityHash");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registerItemType:", v31);

  v32 = *(void **)(a1 + 32);
  objc_msgSend(v32, "relevanceCoarseAppActivityHash");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registerItemType:", v33);

  v34 = *(void **)(a1 + 32);
  objc_msgSend(v34, "bluetoothConnectedToDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "registerItemType:", v35);

  v36 = *(void **)(a1 + 32);
  objc_msgSend(v36, "bluetoothConnectedToDeviceWithName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "registerItemType:", v37);

  v38 = *(void **)(a1 + 32);
  objc_msgSend(v38, "bluetoothConnectedToDeviceWithAddress");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "registerItemType:", v39);

  v40 = *(void **)(a1 + 32);
  objc_msgSend(v40, "locationIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "registerItemType:", v41);

  v42 = *(void **)(a1 + 32);
  objc_msgSend(v42, "enterLocation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "registerItemType:", v43);

  v44 = *(void **)(a1 + 32);
  objc_msgSend(v44, "exitLocation");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "registerItemType:", v45);

  v46 = *(void **)(a1 + 32);
  objc_msgSend(v46, "mediaIsPlaying");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "registerItemType:", v47);

  v48 = *(void **)(a1 + 32);
  objc_msgSend(v48, "mediaGenreStartedPlaying");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "registerItemType:", v49);

  v50 = *(void **)(a1 + 32);
  objc_msgSend(v50, "connectedToExternalAudioOutput");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "registerItemType:", v51);

  v52 = *(void **)(a1 + 32);
  objc_msgSend(v52, "firstBacklightAfterWakeup");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "registerItemType:", v53);

  v54 = *(void **)(a1 + 32);
  objc_msgSend(v54, "toggledAirplaneMode");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "registerItemType:", v55);

  v56 = *(void **)(a1 + 32);
  objc_msgSend(v56, "connectedToCarPlay");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "registerItemType:", v57);

  v58 = *(void **)(a1 + 32);
  objc_msgSend(v58, "toggledDoNotDisturb");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "registerItemType:", v59);

  v60 = *(void **)(a1 + 32);
  objc_msgSend(v60, "toggledLowPowerMode");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "registerItemType:", v61);

  v62 = *(void **)(a1 + 32);
  objc_msgSend(v62, "wifiConnectedToSSID");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "registerItemType:", v63);

  v64 = *(void **)(a1 + 32);
  objc_msgSend(v64, "wifiDisconnectedFromSSID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "registerItemType:", v65);

  v66 = *(void **)(a1 + 32);
  objc_msgSend(v66, "wifiIsConnectedToSSID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "registerItemType:", v67);

  v68 = *(void **)(a1 + 32);
  objc_msgSend(v68, "alarmStoppedAny");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "registerItemType:", v69);

  v70 = *(void **)(a1 + 32);
  objc_msgSend(v70, "alarmSnoozedAny");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "registerItemType:", v71);

  v72 = *(void **)(a1 + 32);
  objc_msgSend(v72, "alarmStoppedWithID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "registerItemType:", v73);

  v74 = *(void **)(a1 + 32);
  objc_msgSend(v74, "alarmSnoozedWithID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "registerItemType:", v75);

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  +[BMItemType interactionItemTypes](BMItemType, "interactionItemTypes", 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v78; ++i)
      {
        if (*(_QWORD *)v82 != v79)
          objc_enumerationMutation(v76);
        objc_msgSend(*(id *)(a1 + 32), "registerItemType:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    }
    while (v78);
  }

}

+ (id)allItemTypesDictionary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "allItemTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMItemType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BMItemType *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "allItemTypesDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (BMItemType *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (Class)valueClass
{
  return self->_valueClass;
}

- (void)setValueClass:(Class)a3
{
  objc_storeStrong((id *)&self->_valueClass, a3);
}

- (int64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(int64_t)a3
{
  self->_edge = a3;
}

- (_DKEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_eventStream, a3);
}

- (id)valueExtractBlock
{
  return self->_valueExtractBlock;
}

- (void)setValueExtractBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueExtractBlock, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_valueClass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BMItemType)toggledAirplaneMode
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("ToggledAirplaneMode"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "airplaneModeStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_11);
  return v2;
}

uint64_t __47__BMItemType_AirplaneMode__toggledAirplaneMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "BOOLValue"));
}

+ (BMItemType)wifiConnectedToSSID
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("WiFiConnectedToSSID"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 0);
  objc_msgSend(MEMORY[0x24BE1B130], "wifiConnectionStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_13);
  return v2;
}

id __39__BMItemType_WiFi__wifiConnectedToSSID__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BMItemType)wifiDisconnectedFromSSID
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("WiFiDisconnectedFromSSID"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 2);
  objc_msgSend(MEMORY[0x24BE1B130], "wifiConnectionStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_6);
  return v2;
}

id __44__BMItemType_WiFi__wifiDisconnectedFromSSID__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BMItemType)wifiIsConnectedToSSID
{
  BMItemType *v2;
  void *v3;

  v2 = objc_alloc_init(BMItemType);
  -[BMItemType setIdentifier:](v2, "setIdentifier:", CFSTR("WiFiIsConnectedToSSID"));
  -[BMItemType setValueClass:](v2, "setValueClass:", objc_opt_class());
  -[BMItemType setEdge:](v2, "setEdge:", 1);
  objc_msgSend(MEMORY[0x24BE1B130], "wifiConnectionStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMItemType setEventStream:](v2, "setEventStream:", v3);

  -[BMItemType setValueExtractBlock:](v2, "setValueExtractBlock:", &__block_literal_global_9_2);
  return v2;
}

id __41__BMItemType_WiFi__wifiIsConnectedToSSID__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2147C2000, a2, a3, "No intentClass found on intent considered for mining: %@", (uint8_t *)&v3);
}

void __46__BMItemType_Intents__appIntentAutomationHash__block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_2147C2000, a2, v4, "Error hashing combinations for intent %@", (uint8_t *)&v5);

}

@end
