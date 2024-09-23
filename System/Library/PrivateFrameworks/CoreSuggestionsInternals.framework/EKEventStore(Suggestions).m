@implementation EKEventStore(Suggestions)

+ (id)sg_newStore
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 128);
}

- (id)sg_confirmedEKEventForSGEvent:()Suggestions
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(v25, "opaqueKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEventCreatedFromSuggestionWithOpaqueKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "eventsMatchingPredicate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v9;
  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v11)
    goto LABEL_18;
  v24 = v5;
  v12 = *(_QWORD *)v28;
  while (2)
  {
    v13 = 0;
    v26 = v11;
    do
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13);
      objc_msgSend(v14, "calendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isSuggestedEventCalendar") & 1) != 0)
        goto LABEL_11;
      objc_msgSend(v14, "calendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isNaturalLanguageSuggestedEventCalendar"))
      {

LABEL_11:
        goto LABEL_13;
      }
      objc_msgSend(v14, "suggestionInfo");
      v17 = v12;
      v18 = v10;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uniqueKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToString:", v21);

      v10 = v18;
      v12 = v17;
      v11 = v26;

      if ((v22 & 1) != 0)
      {
        v11 = v14;
        goto LABEL_17;
      }
LABEL_13:
      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
      continue;
    break;
  }
LABEL_17:
  v5 = v24;
LABEL_18:

  return v11;
}

- (id)eventsWithSameOpaqueKeyAsPseudoEvent:()Suggestions harvestStore:
{
  id v6;
  id v7;
  void *v8;
  SGPseudoEventKey *v9;
  void *v10;
  void *v11;
  SGPseudoEventKey *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "extraKeyTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [SGPseudoEventKey alloc];
    objc_msgSend(v6, "extraKeyTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SGPseudoEventKey initWithGloballyUniqueId:](v9, "initWithGloballyUniqueId:", v11);

  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v6, "duplicateKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventsWithSameOpaqueKeyAsDuplicateKey:extraKey:harvestStore:", v13, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)eventsWithSameOpaqueKeyAsStorageEvent:()Suggestions harvestStore:
{
  id v6;
  id v7;
  void *v8;
  SGPseudoEventKey *v9;
  void *v10;
  void *v11;
  SGPseudoEventKey *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "extraKeyTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [SGPseudoEventKey alloc];
    objc_msgSend(v6, "extraKeyTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SGPseudoEventKey initWithGloballyUniqueId:](v9, "initWithGloballyUniqueId:", v11);

  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v6, "duplicateKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventsWithSameOpaqueKeyAsDuplicateKey:extraKey:harvestStore:", v13, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)eventsWithSameOpaqueKeyAsDuplicateKey:()Suggestions extraKey:harvestStore:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t i;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  uint8_t buf[16];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "pseudoEventKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyForEventKitQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEventCreatedFromSuggestionWithOpaqueKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "eventsMatchingPredicate:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = (void *)MEMORY[0x1E0C9AA60];
  if (v14)
    v17 = (void *)v14;
  else
    v17 = (void *)MEMORY[0x1E0C9AA60];
  v18 = v17;

  if (v9)
  {
    objc_msgSend(v9, "keyForEventKitQuery");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForEventCreatedFromSuggestionWithOpaqueKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "eventsMatchingPredicate:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = v16;
    v24 = v23;

    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v25, "count"))
    {
      v56 = v25;
      v26 = (void *)MEMORY[0x1E0D197F0];
      objc_msgSend(v8, "pseudoEventKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "groupId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "extraKey:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v63[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "duplicateKeysMatchingAnyTag:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = (void *)v29;
      objc_msgSend(v31, "objectForKeyedSubscript:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v51 = v31;
        v52 = v24;
        v53 = v10;
        v54 = v9;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v50 = v32;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v59;
          v37 = (void *)MEMORY[0x1E0C9AA60];
          while (2)
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v59 != v36)
                objc_enumerationMutation(v33);
              v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              if (objc_msgSend(v39, "entityType") == 2 && (objc_msgSend(v39, "isEqualToDuplicateKey:", v8) & 1) == 0)
              {
                v40 = v8;
                objc_msgSend(v39, "pseudoEventKey");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "keyForEventKitQuery");
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(a1, "predicateForEventCreatedFromSuggestionWithOpaqueKey:", v42);
                v43 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(a1, "eventsMatchingPredicate:", v43);
                v44 = objc_claimAutoreleasedReturnValue();
                v45 = (void *)v44;
                if (v44)
                  v46 = (void *)v44;
                else
                  v46 = v37;
                v47 = v46;

                if (objc_msgSend(v47, "count"))
                {
                  sgLogHandle();
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_debug_impl(&dword_1C3607000, v48, OS_LOG_TYPE_DEBUG, "Found related EKEvent by db lookup of related keys.", buf, 2u);
                  }

                  v20 = (void *)v43;
                  v56 = v47;
                  v8 = v40;
                  goto LABEL_28;
                }

                v20 = (void *)v43;
                v56 = v47;
                v8 = v40;
                v37 = (void *)MEMORY[0x1E0C9AA60];
              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
            if (v35)
              continue;
            break;
          }
        }
LABEL_28:

        v10 = v53;
        v9 = v54;
        v31 = v51;
        v24 = v52;
        v32 = v50;
      }

      v25 = v56;
    }

    v13 = v20;
    v18 = v25;
  }

  return v18;
}

- (id)eventsWithSameAlternativeOpaqueKeyAsPseudoEvent:()Suggestions harvestStore:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "duplicateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventsWithSameAlternativeOpaqueKeyAsDuplicateKey:harvestStore:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)eventsWithSameAlternativeOpaqueKeyAsStorageEvent:()Suggestions harvestStore:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "duplicateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventsWithSameAlternativeOpaqueKeyAsDuplicateKey:harvestStore:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)eventsWithSameAlternativeOpaqueKeyAsDuplicateKey:()Suggestions harvestStore:
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pseudoEventKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativeKeysForEventKitQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
LABEL_3:
    v11 = 0;
    v12 = v9;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      objc_msgSend(a1, "predicateForEventCreatedFromSuggestionWithOpaqueKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11), (_QWORD)v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "eventsMatchingPredicate:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v9, "count");
      if (v14)
        break;
      ++v11;
      v12 = v9;
      if (v8 == v11)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  if (v9)
    v15 = v9;
  else
    v15 = (void *)MEMORY[0x1E0C9AA60];
  v16 = v15;

  return v16;
}

- (id)eventWithExternalID:()Suggestions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "calendarItemsWithExternalIdentifier:", v5);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = v10;
            goto LABEL_14;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime:()Suggestions
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__28244;
  v13 = __Block_byref_object_dispose__28245;
  v14 = 0;
  v14 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__EKEventStore_Suggestions__sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime___block_invoke;
  v8[3] = &unk_1E7DB23A0;
  v8[4] = &v9;
  +[SGDeduper enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:store:usingBlock:](SGDeduper, "enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:store:usingBlock:", v4, a1, v8);
  if (objc_msgSend((id)v10[5], "count"))
    v5 = (void *)v10[5];
  else
    v5 = 0;
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_sg_fetchEKEventsForPseudoNLEvent:()Suggestions title:participants:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "tags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
  {
    objc_msgSend(v8, "timeRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "start");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v16);

    objc_msgSend(v8, "timeRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "end");
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v20);

    objc_msgSend(v17, "dateByAddingTimeInterval:", -60.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateByAddingTimeInterval:", 60.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForEventsWithStartDate:endDate:calendars:", v22, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__28244;
    v42 = __Block_byref_object_dispose__28245;
    v43 = 0;
    v43 = (id)objc_opt_new();
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __82__EKEventStore_Suggestions___sg_fetchEKEventsForPseudoNLEvent_title_participants___block_invoke;
    v33 = &unk_1E7DB23C8;
    v26 = v25;
    v34 = v26;
    v35 = v9;
    v36 = v10;
    v37 = &v38;
    objc_msgSend(a1, "enumerateEventsMatchingPredicate:usingBlock:", v24, &v30);
    if (objc_msgSend((id)v39[5], "count", v30, v31, v32, v33))
      v27 = (void *)v39[5];
    else
      v27 = 0;
    v28 = v27;

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)sg_fetchEKEventsForPseudoNLEvent:()Suggestions entity:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sg_fetchEKEventsForPseudoNLEvent:title:participants:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sg_fetchEKEventsForPseudoNLEvent:()Suggestions message:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v10, "allRecipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "emailAddress");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v13);
    }

    objc_msgSend(v10, "from");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emailAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v10, "from");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "emailAddress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v20);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = a1;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v41 = v8;
      objc_msgSend(v41, "recipients");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v44 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            objc_msgSend(v26, "handles");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");

            if (v28)
            {
              objc_msgSend(v26, "handles");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v30);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v23);
      }

      objc_msgSend(v41, "sender");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handles");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v33)
      {
        objc_msgSend(v41, "sender");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handles");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v36);

      }
      a1 = v42;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EKEventStore+Suggestions.m"), 274, CFSTR("Unhandled message class %@"), objc_opt_class());

    }
  }
  objc_msgSend(v8, "subject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sg_fetchEKEventsForPseudoNLEvent:title:participants:", v7, v38, v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (void)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction:()Suggestions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isNaturalLanguageEvent"))
  {
    if (sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__once != -1)
      dispatch_once(&sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__once, &__block_literal_global_26_28234);
    objc_msgSend((id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__lock, "lock");
    if (sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache)
    {
      objc_msgSend((id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache, "first");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "opaqueKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
      {
        objc_msgSend((id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache, "second");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceNow");
        v9 = v8;

        if (v9 > 3300.0)
        {
LABEL_22:
          objc_msgSend((id)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__lock, "unlock");
          goto LABEL_23;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v4, "opaqueKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "predicateForEventCreatedFromSuggestionWithOpaqueKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "eventsMatchingPredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sgFilter();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v26 = objc_msgSend(v13, "count");
      objc_msgSend(v4, "opaqueKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v31 = v26;
      v32 = 2112;
      v33 = v27;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "Found %lu events to bump TTL on for OpaqueKey: %@", buf, 0x16u);

    }
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "dateByAddingTimeInterval:", 3600.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setLocalCustomObject:forKey:", v17, *MEMORY[0x1E0CA9F78]);
      v29 = 0;
      v18 = objc_msgSend(a1, "saveEvent:span:commit:error:", v15, 0, 1, &v29);
      v19 = v29;
      sgLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, "EKEventStore+Suggestions: bumped TTL for NL Event ZKW", buf, 2u);
        }

        v22 = objc_alloc(MEMORY[0x1E0D81638]);
        objc_msgSend(v4, "opaqueKey");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "initWithFirst:second:", v23, v17);
        v25 = (void *)sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache;
        sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction__ttlCache = v24;

      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = (uint64_t)v19;
          _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "Unable to save event in event store: %@", buf, 0xCu);
        }

        sgLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v15, "description");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v31 = (uint64_t)v28;
          v32 = 2112;
          v33 = v19;
          _os_log_debug_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEBUG, "Unable to save event in event store; description: %@, error: %@",
            buf,
            0x16u);

        }
      }

    }
    goto LABEL_22;
  }
LABEL_23:

}

- (double)eventsPerWeekAroundDate:()Suggestions
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v16;
  double v17;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = *MEMORY[0x1E0C996C8];
  v6 = a3;
  objc_msgSend(v4, "calendarWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0.0;
  objc_msgSend(v7, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v16, &v17, v6);

  v8 = v16;
  objc_msgSend(v8, "dateByAddingTimeInterval:", v17 * -2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", v17 * 3.0 + -1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForEventsWithStartDate:endDate:calendars:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventsMatchingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sgMapAndFilter();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (double)(unint64_t)objc_msgSend(v13, "count") / 5.0;
  return v14;
}

+ (void)sg_usingSharedStoreForReadingOnly:()Suggestions
{
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = a3;
  if (sg_usingSharedStoreForReadingOnly___pasOnceToken3 != -1)
    dispatch_once(&sg_usingSharedStoreForReadingOnly___pasOnceToken3, &__block_literal_global_28252);
  objc_msgSend((id)sg_usingSharedStoreForReadingOnly___pasExprOnceResult, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  v5[2](v5, v3);
  objc_autoreleasePoolPop(v4);

}

@end
