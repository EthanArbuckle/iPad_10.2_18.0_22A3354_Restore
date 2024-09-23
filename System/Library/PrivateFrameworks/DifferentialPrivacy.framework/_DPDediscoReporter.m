@implementation _DPDediscoReporter

- (BOOL)reportDediscoRecords:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _UNKNOWN **v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  BOOL v29;
  BOOL v30;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *context;
  uint64_t v39;
  _DPDediscoReporter *v40;
  void *v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    goto LABEL_38;
  +[_DPLog daemon](_DPLog, "daemon");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_DPDediscoReporter reportDediscoRecords:].cold.4(a2, v6);

  if (!+[_DPDeviceInfo isDataCollectionEnabled](_DPDeviceInfo, "isDataCollectionEnabled"))
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_DPDediscoReporter reportDediscoRecords:].cold.3(a2, v7);
    goto LABEL_37;
  }
  if (+[_DPDeviceInfo isDisabledByTaskingForDedisco](_DPDeviceInfo, "isDisabledByTaskingForDedisco"))
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_DPDediscoReporter reportDediscoRecords:].cold.1(a2, v7);
LABEL_37:

LABEL_38:
    v30 = 0;
    goto LABEL_39;
  }
  v33 = (void *)MEMORY[0x1D8256B78]();
  v8 = &off_1E95D8000;
  +[_DPKeyNames keyNamesGroupedByPropertyName](_DPKeyNames, "keyNamesGroupedByPropertyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v36 = v9;
  objc_msgSend(v9, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "randomizeKeys:andSortByPriority:", v32, 1);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v49;
    v40 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(obj);
        v39 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1D8256B78]();
        objc_msgSend(v36, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        v43 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v45;
          v42 = v14;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v45 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_msgSend(v8[100], "keyPropertiesForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "transport") == 4 && objc_msgSend(v20, "keyPatternsAllowed"))
              {
                objc_msgSend(v43, "addObject:", v19);
                objc_msgSend((id)objc_opt_class(), "queryKeysForPattern:storage:", v19, v5);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "count"))
                {
                  objc_msgSend((id)objc_opt_class(), "randomizeKeys:andSortByPriority:", v21, 0);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "addObjectsFromArray:", v22);

                }
                else
                {
                  -[_DPDediscoReporter keysWithDefaultValues](self, "keysWithDefaultValues");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "allKeys");
                  v24 = v5;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "containsObject:", v19);

                  v5 = v24;
                  self = v40;

                  v8 = &off_1E95D8000;
                  if (v26)
                    objc_msgSend(v43, "removeObject:", v19);
                }

                v14 = v42;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v16);
        }

        objc_msgSend(v14, "removeObjectsInArray:", v43);
        v27 = (void *)objc_msgSend(v14, "copy");
        if (objc_msgSend(v27, "count"))
        {
          objc_msgSend((id)objc_opt_class(), "randomizeKeys:andSortByPriority:", v27, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObjectsFromArray:", v28);

        }
        objc_autoreleasePoolPop(context);
        v10 = v39 + 1;
      }
      while (v39 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v37);
  }

  v29 = -[_DPDediscoReporter reportDediscoKeys:storage:](self, "reportDediscoKeys:storage:", v41, v5);
  objc_autoreleasePoolPop(v33);
  if (!v29)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_DPDediscoReporter reportDediscoRecords:].cold.2(v7);
    goto LABEL_37;
  }
  v30 = 1;
LABEL_39:

  return v30;
}

- (BOOL)reportDediscoKeys:(id)a3 storage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  _DPDediscoReporter *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  BOOL v40;
  NSObject *v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *context;
  id obj;
  void *v52;
  _DPDediscoReporter *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = a4;
  if (v54)
  {
    v53 = self;
    v7 = (void *)MEMORY[0x1D8256B78]();
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v60;
      v13 = 40;
      v14 = &off_1E95D8000;
      v49 = v9;
      v45 = v7;
      v46 = v6;
      v52 = v8;
      v47 = *(_QWORD *)v60;
      do
      {
        v15 = 0;
        v16 = v53;
        v48 = v11;
        do
        {
          if (*(_QWORD *)v60 != v12)
            objc_enumerationMutation(v9);
          v17 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v15);
          v18 = (void *)MEMORY[0x1D8256B78]();
          objc_msgSend(v14[100], "keyPropertiesForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19 && objc_msgSend(v19, "transport") == 4)
          {
            v21 = (void *)MEMORY[0x1D8256B78]();
            objc_msgSend((id)objc_opt_class(), "queryRecordsForKey:storage:", v17, v54);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            context = v18;
            if (!objc_msgSend(v22, "count"))
            {
              -[_DPDediscoReporter keysWithDefaultValues](v16, "keysWithDefaultValues");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "allKeys");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "containsObject:", v17);

              if (v25)
              {
                -[_DPDediscoReporter keysWithDefaultValues](v16, "keysWithDefaultValues");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", v17);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[_DPDediscoReporter defaultRecordsWithValues:key:properties:](v16, "defaultRecordsWithValues:key:properties:", v27, v17, v20);
                v28 = objc_claimAutoreleasedReturnValue();

                v22 = (void *)v28;
              }
              v9 = v49;
              v18 = context;
            }
            objc_msgSend((id)objc_opt_class(), "filterNonConformingDediscoRecordsFrom:", v22);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v29, "count"))
            {

              objc_autoreleasePoolPop(v21);
              if (v13 < objc_msgSend(v29, "count"))
              {
                objc_msgSend(v29, "subarrayWithRange:", 0, v13);
                v30 = objc_claimAutoreleasedReturnValue();

                v29 = (void *)v30;
              }
              +[_DPEnhancedPrivacyAlgorithm findMultipleDonationForKey:inRecords:](_DPEnhancedPrivacyAlgorithm, "findMultipleDonationForKey:inRecords:", v17, v29, v45, v46);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              objc_msgSend(v31, "allKeys");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
              if (v32)
              {
                v33 = v32;
                v34 = *(_QWORD *)v56;
                while (2)
                {
                  v35 = 0;
                  v36 = v29;
                  do
                  {
                    if (*(_QWORD *)v56 != v34)
                      objc_enumerationMutation(obj);
                    objc_msgSend(v31, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v35));
                    v29 = (void *)objc_claimAutoreleasedReturnValue();

                    -[_DPDediscoReporter directlyUploadDediscoRecords:forKey:keyProperties:storage:](v53, "directlyUploadDediscoRecords:forKey:keyProperties:storage:", v29, v17, v20, v54);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v37, "count"))
                    {
                      objc_msgSend(v52, "addObjectsFromArray:", v37);
                      v13 -= objc_msgSend(v37, "count");
                      if (!v13)
                      {

                        goto LABEL_29;
                      }
                      if (v13 < 0)
                      {
                        +[_DPLog daemon](_DPLog, "daemon");
                        v41 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                        {
                          v43 = objc_msgSend(v29, "count");
                          v44 = objc_msgSend(v52, "count");
                          *(_DWORD *)buf = 134218496;
                          v64 = v13;
                          v65 = 2048;
                          v66 = v43;
                          v67 = 2048;
                          v68 = v44;
                          _os_log_error_impl(&dword_1D3FAA000, v41, OS_LOG_TYPE_ERROR, "The max report count (%ld) has become negative. The latest submitted record count is %lu with the total submitted records of %lu so far.", buf, 0x20u);
                        }

                        objc_autoreleasePoolPop(context);
                        v40 = 0;
                        v7 = v45;
                        v6 = v46;
                        v8 = v52;
                        goto LABEL_41;
                      }
                    }

                    ++v35;
                    v36 = v29;
                  }
                  while (v33 != v35);
                  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
                  if (v33)
                    continue;
                  break;
                }
              }
LABEL_29:

              v22 = v29;
              v16 = v53;
              v9 = v49;
              v18 = context;
            }
            else
            {

              objc_autoreleasePoolPop(v21);
            }

            v12 = v47;
            v11 = v48;
            v14 = &off_1E95D8000;
          }

          objc_autoreleasePoolPop(v18);
          ++v15;
        }
        while (v15 != v11);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        v7 = v45;
        v6 = v46;
        v8 = v52;
      }
      while (v11);
    }

    +[_DPLog daemon](_DPLog, "daemon");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[_DPDediscoReporter reportDediscoKeys:storage:].cold.1(v8, v38);

    if (objc_msgSend(v8, "count"))
    {
      v39 = (void *)MEMORY[0x1D8256B78]();
      +[_DPPrivacyBudget updateAllBudgetsIn:](_DPPrivacyBudget, "updateAllBudgetsIn:", v54);
      objc_autoreleasePoolPop(v39);
      -[_DPDediscoReporter markSubmitted:storage:](v53, "markSubmitted:storage:", v8, v54);
    }
    v40 = 1;
LABEL_41:

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)keysWithDefaultValues
{
  if (keysWithDefaultValues_onceToken != -1)
    dispatch_once(&keysWithDefaultValues_onceToken, &__block_literal_global_3);
  return (id)keysWithDefaultValues_keysWithDefaultValues;
}

- (id)defaultRecordsWithValues:(id)a3 key:(id)a4 properties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
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
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(v9, "privacyParameter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  v14 = objc_msgSend(v9, "privatizationAlgorithm");
  v15 = objc_msgSend(v9, "dataAlgorithm");
  objc_msgSend(v9, "parameterDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPStringRandomizer stringRandomizerWithEpsilon:privatizationAlgorithm:dataAlgorithm:algorithmParameters:](_DPStringRandomizer, "stringRandomizerWithEpsilon:privatizationAlgorithm:dataAlgorithm:algorithmParameters:", v14, v15, v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v18, "isEqual:", v19);

  if ((_DWORD)v15)
  {
    objc_msgSend(v9, "parameterDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("p"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v26 = 0;
      do
      {
        objc_msgSend(v25, "addObject:", v24);
        ++v26;
      }
      while (v26 < objc_msgSend(v7, "count"));
    }
    objc_msgSend(v17, "randomizer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v27, "randomizeBitVectors:metadata:forKey:", v28, MEMORY[0x1E0C9AA70], v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v17, "randomizer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "randomizeBitValues:metadata:forKey:", v7, MEMORY[0x1E0C9AA70], v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(v10);
  return v29;
}

- (id)directlyUploadDediscoRecords:(id)a3 forKey:(id)a4 keyProperties:(id)a5 storage:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  BOOL v19;
  void *v20;
  id v21;
  uint64_t v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[_DPPrivacyBudget enforceBudgetForRecords:withKey:inDatabase:](_DPPrivacyBudget, "enforceBudgetForRecords:withKey:inDatabase:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "count");
  v15 = objc_msgSend(v13, "count");
  v16 = v14 - v15;
  if (v14 != v15)
  {
    do
    {
      v17 = (objc_msgSend(v11, "telemetryAllowed") & 1) != 0
         || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
      LOBYTE(v23) = v17;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v10, 3, 0, 0, 300, CFSTR("No budget left"), v23);
      --v16;
    }
    while (v16);
  }
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v13, "count"))
    {
      v18 = 0;
      do
      {
        v19 = (objc_msgSend(v11, "telemetryAllowed") & 1) != 0
           || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
        LOBYTE(v23) = v19;
        +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v10, 3, 0, 1, 0, 0, v23);
        ++v18;
      }
      while (v18 < objc_msgSend(v13, "count"));
    }
    -[_DPDediscoReporter reportToDediscoRecords:forKey:keyProperties:storage:](self, "reportToDediscoRecords:forKey:keyProperties:storage:", v13, v10, v11, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
      +[_DPPrivacyBudget updateBudgetForRecords:withKey:inDatabase:](_DPPrivacyBudget, "updateBudgetForRecords:withKey:inDatabase:", v20, v10, v12);
    v21 = v20;
  }
  else
  {
    v21 = (id)MEMORY[0x1E0C9AA60];
  }

  return v21;
}

- (id)reportToDediscoRecords:(id)a3 forKey:(id)a4 keyProperties:(id)a5 storage:(id)a6
{
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _DPDediscoDonation *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _DPDediscoDonation *v33;
  _DPDediscoDonation *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  unint64_t v39;
  BOOL v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v46;
  void *context;
  id v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void *v51;
  id v52;
  id v53;
  id v54;
  id obj;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  _QWORD v60[4];
  NSObject *v61;
  _DPDediscoDonation *v62;
  _BYTE *v63;
  _BYTE *v64;
  uint64_t *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD v76[4];
  const __CFString *v77;
  id v78;
  id v79;
  id v80;
  _BYTE v81[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint8_t v85[128];
  _BYTE buf[24];
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v53 = a4;
  v52 = a5;
  v49 = a6;
  +[_DPLog daemon](_DPLog, "daemon");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v54, "count");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v53;
    _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_DEFAULT, "Submitting %lu record(s) to Dedisco for key %@", buf, 0x16u);
  }

  context = (void *)MEMORY[0x1D8256B78]();
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.DPSubmissionService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE41BA0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setRemoteObjectInterface:", v11);

  objc_msgSend(v51, "resume");
  if (v51)
  {
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke;
    v76[3] = &unk_1E95D9588;
    v77 = CFSTR("com.apple.DPSubmissionService");
    v12 = v54;
    v78 = v12;
    v13 = v53;
    v79 = v13;
    v14 = v52;
    v80 = v14;
    objc_msgSend(v51, "synchronousRemoteObjectProxyWithErrorHandler:", v76);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (uint64_t (*)(uint64_t, uint64_t))v13;
    v15 = (uint64_t)v50;
    if (objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.messages.CommunicationSafety.PrivatizedUIInteraction"))&& (-[_DPDediscoReporter extendCommSafetyKey:](self, "extendCommSafetyKey:", v50), v15 = objc_claimAutoreleasedReturnValue(), v50, !v15))
    {
      +[_DPLog daemon](_DPLog, "daemon");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        -[_DPDediscoReporter reportToDediscoRecords:forKey:keyProperties:storage:].cold.2(a2, v43);
        v42 = (void *)MEMORY[0x1E0C9AA60];
        v44 = v43;
      }
      else
      {
        v42 = (void *)MEMORY[0x1E0C9AA60];
      }
    }
    else
    {
      v59 = v15;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v87 = __Block_byref_object_copy__3;
      v88 = __Block_byref_object_dispose__3;
      v89 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v70 = 0;
      v71 = &v70;
      v72 = 0x3032000000;
      v73 = __Block_byref_object_copy__3;
      v74 = __Block_byref_object_dispose__3;
      v75 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v12;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
      if (v16)
      {
        v56 = *(_QWORD *)v67;
        do
        {
          v58 = v16;
          for (i = 0; i != v58; ++i)
          {
            if (*(_QWORD *)v67 != v56)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            *(_QWORD *)v81 = 0;
            *(_QWORD *)&v81[8] = v81;
            *(_QWORD *)&v81[16] = 0x3032000000;
            v82 = __Block_byref_object_copy__3;
            v83 = __Block_byref_object_dispose__3;
            v19 = v18;
            v84 = v19;
            objc_msgSend(v14, "parameterDictionary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "metadata");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("dimensionality"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = (void *)objc_msgSend(v20, "mutableCopy");
              objc_msgSend(v23, "setObject:forKey:", v22, CFSTR("size"));
              v24 = objc_msgSend(v23, "copy");

              v20 = (void *)v24;
            }
            objc_msgSend(v19, "metadata");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v25, "mutableCopy");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "telemetryAllowed"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("telemetryAllowed"));

            v28 = [_DPDediscoDonation alloc];
            objc_msgSend(v19, "share1");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "share2");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v19, "dimension");
            objc_msgSend(v14, "serverAlgorithmString");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = -[_DPDediscoDonation initWithKey:share1:share2:dimension:metadata:serverAlgorithm:algorithmParameters:](v28, "initWithKey:share1:share2:dimension:metadata:serverAlgorithm:algorithmParameters:", v59, v29, v30, v31, v26, v32, v20);

            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_48;
            v60[3] = &unk_1E95D95B0;
            v61 = v59;
            v63 = buf;
            v64 = v81;
            v65 = &v70;
            v34 = v33;
            v62 = v34;
            objc_msgSend(v57, "submitDonation:toDediscoWithReply:", v34, v60);

            _Block_object_dispose(v81, 8);
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
        }
        while (v16);
      }

      objc_msgSend(v51, "invalidate");
      if (objc_msgSend((id)v71[5], "count"))
      {
        objc_msgSend((id)objc_opt_class(), "jsonReportFromObject:replacing:with:", v71[5], CFSTR("Dedisco"), CFSTR("PPM"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          +[_DPUploadHelper writeFileForDedisco:](_DPUploadHelper, "writeFileForDedisco:", v35);
          v36 = objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            +[_DPLog framework](_DPLog, "framework");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = objc_msgSend((id)v71[5], "count");
              *(_DWORD *)v81 = 134218498;
              *(_QWORD *)&v81[4] = v38;
              *(_WORD *)&v81[12] = 2112;
              *(_QWORD *)&v81[14] = v36;
              *(_WORD *)&v81[22] = 2112;
              v82 = v50;
              _os_log_impl(&dword_1D3FAA000, v37, OS_LOG_TYPE_DEFAULT, "%lu Dedisco reports were written to transparency log %@ for %@", v81, 0x20u);
            }
          }
          else
          {
            +[_DPLog framework](_DPLog, "framework");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[_DPDediscoReporter reportToDediscoRecords:forKey:keyProperties:storage:].cold.4((uint64_t)v50, (uint64_t)v81, objc_msgSend((id)v71[5], "count"), v37);
          }

        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[_DPDediscoReporter reportToDediscoRecords:forKey:keyProperties:storage:].cold.3();
        }

      }
      v42 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "copy");
      _Block_object_dispose(&v70, 8);

      _Block_object_dispose(buf, 8);
      v44 = v59;
    }

    v41 = v77;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not create connection to %@"), CFSTR("com.apple.DPSubmissionService"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "count"))
    {
      v39 = 0;
      do
      {
        v40 = (objc_msgSend(v52, "telemetryAllowed") & 1) != 0
           || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
        LOBYTE(v46) = v40;
        +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v53, 4, 0, 0, 410, v57, v46);
        ++v39;
      }
      while (v39 < objc_msgSend(v54, "count"));
    }
    +[_DPLog daemon](_DPLog, "daemon");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[_DPDediscoReporter reportToDediscoRecords:forKey:keyProperties:storage:].cold.1();
    v42 = 0;
  }

  objc_autoreleasePoolPop(context);
  return v42;
}

+ (id)filterNonConformingDediscoRecordsFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_54);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "removeObjectsAtIndexes:", v4);
  return v5;
}

- (BOOL)markSubmitted:(id)a3 storage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D8256B78]();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setSubmitted:", 1, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    objc_msgSend(v6, "updateRecords:withCompletion:", v8, 0);
    objc_autoreleasePoolPop(v7);
  }

  return v6 != 0;
}

+ (id)jsonReportFromObject:(id)a3 replacing:(id)a4 with:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;

  v8 = a4;
  v9 = a5;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 1, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v11)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_DPDediscoReporter jsonReportFromObject:replacing:with:].cold.1(a2, (uint64_t)v11, v12);

    v13 = 0;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithData:encoding:", v10, 4);
    objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", v8, v9, 1, 0, objc_msgSend(v13, "length"));
  }

  return v13;
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  _DPDediscoReporter *v15;
  id v16;

  v6 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59___DPDediscoReporter_scheduleMaintenanceWithName_database___block_invoke;
  v14 = &unk_1E95D9618;
  v15 = self;
  v16 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x1D8256D34](&v11);
  +[_DPPeriodicTask taskWithName:period:handler:networkingRequired:](_DPPeriodicTask, "taskWithName:period:handler:networkingRequired:", v8, kSecondsIn18Hours, v9, 1, v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v10);
}

- (id)extendCommSafetyKey:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[_DPDediscoReporter _isCommSafetyEnabled](self, "_isCommSafetyEnabled"))
  {
    -[_DPDediscoReporter _commSafetyAccountCountryCode](self, "_commSafetyAccountCountryCode");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_DPDediscoReporter _commSafetyAgeGroup](self, "_commSafetyAgeGroup");
      v7 = objc_claimAutoreleasedReturnValue();
      +[_DPLog daemon](_DPLog, "daemon");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_impl(&dword_1D3FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@: CommSafety checks have passed, will continue on with default donation", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v5, v7, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (v9)
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl(&dword_1D3FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@: CommSafety age group is missing, will skip on default donation", buf, 0xCu);

      }
    }
    else
    {
      +[_DPLog daemon](_DPLog, "daemon");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl(&dword_1D3FAA000, v7, OS_LOG_TYPE_DEFAULT, "%@: CommSafety country code is missing, will skip on default donation", buf, 0xCu);

      }
    }
    v11 = 0;
LABEL_16:

    goto LABEL_17;
  }
  +[_DPLog daemon](_DPLog, "daemon");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1D3FAA000, v6, OS_LOG_TYPE_DEFAULT, "%@: CommSafety and/or Analytics are disabled, will skip on default donation", buf, 0xCu);

  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (BOOL)_isCommSafetyEnabled
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getSTCommunicationClientClass_softClass;
  v19 = getSTCommunicationClientClass_softClass;
  if (!getSTCommunicationClientClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __getSTCommunicationClientClass_block_invoke;
    v22 = &unk_1E95D9668;
    v23 = &v16;
    __getSTCommunicationClientClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  v5 = objc_alloc_init(v4);
  v15 = 0;
  objc_msgSend(v5, "currentConfigurationWithError:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_DPDediscoReporter _isCommSafetyEnabled].cold.1(a2, (uint64_t)v8, v10);
LABEL_15:

    v11 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend(v6, "isCommunicationSafetySendingRestricted")
    || (objc_msgSend(v6, "isCommunicationSafetyReceivingRestricted") & 1) == 0)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_INFO, "%@: CommSafety is disabled, will skip on default donation", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isCommunicationSafetyAnalyticsEnabled") & 1) == 0)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_INFO, "%@: CommSafety Analytics is disabled, will skip on default donation", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_15;
  }
  v11 = 1;
LABEL_16:

  return v11;
}

- (id)_commSafetyAccountCountryCode
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v2 = (void *)getAKAccountManagerClass_softClass;
  v13 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getAKAccountManagerClass_block_invoke;
    v9[3] = &unk_1E95D9668;
    v9[4] = &v10;
    __getAKAccountManagerClass_block_invoke((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryAuthKitAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "appleIDCountryCodeForAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_commSafetyAgeGroup
{
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  SEL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v4 = (void *)getFAFetchFamilyCircleRequestClass_softClass;
  v34 = getFAFetchFamilyCircleRequestClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getFAFetchFamilyCircleRequestClass_softClass)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __getFAFetchFamilyCircleRequestClass_block_invoke;
    v35[3] = &unk_1E95D9668;
    v35[4] = &v31;
    __getFAFetchFamilyCircleRequestClass_block_invoke((uint64_t)v35);
    v4 = (void *)v32[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v31, 8);
  v7 = objc_alloc_init(v6);
  v15 = v5;
  v16 = 3221225472;
  v17 = __41___DPDediscoReporter__commSafetyAgeGroup__block_invoke;
  v18 = &unk_1E95D9640;
  v20 = &v23;
  v21 = &v27;
  v22 = a2;
  v8 = v3;
  v19 = v8;
  objc_msgSend(v7, "startRequestWithCompletionHandler:", &v15);
  v9 = dispatch_time(0, 100000000);
  if (dispatch_semaphore_wait(v8, v9) || !*((_BYTE *)v28 + 24))
  {
    +[_DPLog daemon](_DPLog, "daemon", v15, v16, v17, v18);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DPDediscoReporter _commSafetyAgeGroup].cold.1(v11, (uint64_t)v35, v10);
    }

    v12 = 0;
  }
  else
  {
    if (*((_BYTE *)v24 + 24))
      v13 = CFSTR("ageGroup0");
    else
      v13 = CFSTR("ageGroup1");
    v12 = v13;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

- (void)reportDediscoRecords:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, a2, v4, "%@: Disabled by Tasking - skipping dedisco reporter", v5);

  OUTLINED_FUNCTION_3();
}

- (void)reportDediscoRecords:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Fail to reportDediscoKeys:storage", v1, 2u);
}

- (void)reportDediscoRecords:(const char *)a1 .cold.3(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, a2, v4, "%@: Disabled by D&U switch - skipping dedisco reporter", v5);

  OUTLINED_FUNCTION_3();
}

- (void)reportDediscoRecords:(const char *)a1 .cold.4(const char *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPStrings databaseDirectoryPath](_DPStrings, "databaseDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_DEBUG, "%@: Data Base Directory Path: %@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

- (void)reportDediscoKeys:(void *)a1 storage:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_DEBUG, "Submitted %lu records", v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)reportToDediscoRecords:forKey:keyProperties:storage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)reportToDediscoRecords:(const char *)a1 forKey:(NSObject *)a2 keyProperties:storage:.cold.2(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, a2, v4, "%@: Failed to extend CommSafety key, will skip on default donation", v5);

  OUTLINED_FUNCTION_3();
}

- (void)reportToDediscoRecords:forKey:keyProperties:storage:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, v0, v1, "Failed to create transparency log from submitted donations for %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)reportToDediscoRecords:(uint64_t)a1 forKey:(uint64_t)a2 keyProperties:(uint64_t)a3 storage:(NSObject *)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a4, a3, "Failed to write %lu Dedisco reports to transparency log for %@", (uint8_t *)a2);
}

+ (void)jsonReportFromObject:(const char *)a1 replacing:(uint64_t)a2 with:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v5, "%@: failed to extract json from object, error: %@", v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)_isCommSafetyEnabled
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v6, "%@: Failed to fetch CommSafety configuration, will skip on default donation, error: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)_commSafetyAgeGroup
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, a3, (uint64_t)a3, "%@: Failed to identify CommSafety age group, will skip on default donation", (uint8_t *)a2);

}

@end
