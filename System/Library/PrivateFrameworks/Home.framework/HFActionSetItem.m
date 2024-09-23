@implementation HFActionSetItem

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetItem actionSet](self, "actionSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\" %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

uint64_t __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

uint64_t __47__HFActionSetItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "requiresDeviceUnlock");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFActionSetItem actionSet](self, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFActionSetItem actionSetItemStyle](self, "actionSetItemStyle");
  -[HFActionSetItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithActionSet:actionSetItemStyle:valueSource:", v5, v6, v7);

  -[HFActionSetItem serviceLikeItem](self, "serviceLikeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServiceLikeItem:", v9);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

+ (id)_primaryStateForActionSet:(id)a3 valueSource:(id)a4 logger:(id)a5 fastInitialUpdate:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  id obja;
  uint64_t v66;
  _QWORD v67[5];
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  BOOL v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v6 = a6;
  v86 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v6)
  {
    objc_msgSend(v10, "actions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      v13 = (void *)MEMORY[0x1E0D519C0];
      v14 = &unk_1EA7CD420;
      goto LABEL_36;
    }
    v56 = a1;
    v57 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastExecutionDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v18);
    v55 = v19 < 60.0;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend(v10, "actions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (!v20)
    {
      v66 = 0;
      goto LABEL_38;
    }
    v21 = v20;
    v66 = 0;
    v22 = *(_QWORD *)v82;
LABEL_6:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v82 != v22)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v23);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        v34 = v24;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;
        v25 = v35;

        if (objc_msgSend(v25, "state")
          || (objc_msgSend(v25, "volume"), v36 = (void *)objc_claimAutoreleasedReturnValue(), v36, v36))
        {
          objc_msgSend(v25, "mediaProfiles");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v66 += objc_msgSend(v37, "count");

        }
        v38 = v61;
LABEL_30:
        objc_msgSend(v38, "addObject:", v25);
LABEL_31:

        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        v39 = v24;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v40 = v39;
        else
          v40 = 0;
        v25 = v40;

        ++v66;
        v38 = v58;
        goto LABEL_30;
      }
LABEL_32:
      if (v21 == ++v23)
      {
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
        if (!v21)
        {
LABEL_38:

          objc_msgSend(v60, "allValues");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2;
          v74[3] = &unk_1EA73F1C8;
          v43 = v57;
          v75 = v43;
          v76 = v59;
          v79 = v56;
          v80 = v55;
          v44 = v12;
          v77 = v44;
          v45 = v10;
          v78 = v45;
          obja = v59;
          objc_msgSend(v42, "na_map:", v74);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = MEMORY[0x1E0C809B0];
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_48;
          v70[3] = &unk_1EA73F240;
          v71 = v44;
          v72 = v45;
          v73 = v56;
          objc_msgSend(v61, "na_flatMap:", v70);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v68[0] = v46;
          v68[1] = 3221225472;
          v68[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_55;
          v68[3] = &unk_1EA73F268;
          v69 = v43;
          objc_msgSend(v58, "na_map:", v68);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "arrayByAddingObjectsFromArray:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = (void *)MEMORY[0x1E0D519C0];
          objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "combineAllFutures:ignoringErrors:scheduler:", v50, 1, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2_108;
          v67[3] = &__block_descriptor_40_e27___NAFuture_16__0__NSArray_8l;
          v67[4] = v66;
          objc_msgSend(v53, "flatMap:", v67);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v57;
          goto LABEL_39;
        }
        goto LABEL_6;
      }
    }
    v25 = v24;
    objc_msgSend(v25, "characteristic");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "service");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uniqueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      v29 = v28 == 0;
    else
      v29 = 1;
    if (!v29)
    {
      objc_msgSend(v25, "targetValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v60, "na_objectForKey:withDefaultValue:", v28, &__block_literal_global_41_3);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "addObject:", v26);
        ++v66;
        objc_msgSend(v25, "targetValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uniqueIdentifier");
        v32 = v21;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v31, v33);

        v21 = v32;
      }
    }

    goto LABEL_31;
  }
  v13 = (void *)MEMORY[0x1E0D519C0];
  v14 = &unk_1EA7CD408;
LABEL_36:
  objc_msgSend(v13, "futureWithResult:", v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

  return v41;
}

- (id)_mostCommonRoomForActionSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFActionSetItem rooms](self, "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v5, "countForObject:", v12);
        if (v13 > v8)
        {
          v14 = v13;
          v15 = v12;

          v8 = v14;
          v9 = v15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)rooms
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HFActionSetItem actionSet](self, "actionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    v27 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "characteristic");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "service");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accessory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "room");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "na_safeAddObject:", v14);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_25;
          v11 = v10;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v11, "mediaProfiles");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v15)
          {
            v16 = v15;
            v29 = v11;
            v30 = v9;
            v17 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v37 != v17)
                  objc_enumerationMutation(v12);
                v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                v32 = 0u;
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                objc_msgSend(v19, "accessories");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = *(_QWORD *)v33;
                  do
                  {
                    for (j = 0; j != v22; ++j)
                    {
                      if (*(_QWORD *)v33 != v23)
                        objc_enumerationMutation(v20);
                      objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "room");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "na_safeAddObject:", v25);

                    }
                    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                  }
                  while (v22);
                }

              }
              v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            }
            while (v16);
            v8 = v27;
            v7 = v28;
            v11 = v29;
            v9 = v30;
          }
        }

LABEL_25:
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  HFMutableItemUpdateOutcome *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  HFMutableItemUpdateOutcome *v37;
  id v38;
  unsigned int v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  HFMutableItemUpdateOutcome *v45;
  uint64_t v46;
  uint64_t v47;
  id (*v48)(uint64_t);
  void *v49;
  HFActionSetItem *v50;
  id v51;
  _QWORD v52[4];
  HFMutableItemUpdateOutcome *v53;
  HFActionSetItem *v54;
  id v55;
  id v56;

  v4 = a3;
  -[HFActionSetItem actionSet](self, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionLogger);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v5)
  {
    v40 = v8;
    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v10 = objc_alloc_init(HFMutableItemUpdateOutcome);
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1EA7CD3D8, CFSTR("controlSummaryStyle"));
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, CFSTR("title"));

    }
    else
    {
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    }
    -[HFActionSetItem actionSet](self, "actionSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_iconDescriptor");
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, CFSTR("icon"));
    v41 = (void *)v17;
    v42 = v6;
    -[HFActionSetItem actionSet](self, "actionSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_iconTintColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, CFSTR("tintColor"));
    v20 = v9;
    -[HFActionSetItem _mostCommonRoomForActionSet:](self, "_mostCommonRoomForActionSet:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "uniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v23, CFSTR("roomIdentifier"));

    }
    objc_msgSend(v5, "actions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (!v25)
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "actions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "na_any:", &__block_literal_global_221));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v28, CFSTR("actionRequiresDeviceUnlock"));

    v29 = -[HFActionSetItem actionSetItemStyle](self, "actionSetItemStyle");
    v30 = MEMORY[0x1E0C809B0];
    v31 = &unk_1DD669000;
    if (v29 - 1 >= 2)
    {
      if (!v29)
      {
        -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1EA7CD3F0, CFSTR("state"));
        objc_msgSend(v20, "finishWithResult:", v10);
      }
    }
    else
    {
      v32 = (void *)objc_opt_class();
      -[HFActionSetItem valueSource](self, "valueSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_primaryStateForActionSet:valueSource:logger:fastInitialUpdate:", v5, v33, v42, v40);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v30;
      v52[1] = 3221225472;
      v52[2] = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_22;
      v52[3] = &unk_1EA73F158;
      v53 = v10;
      v54 = self;
      v55 = v5;
      v56 = v20;
      v35 = (id)objc_msgSend(v34, "addCompletionBlock:", v52);

      v31 = (_QWORD *)&unk_1DD669000;
    }
    v46 = v30;
    v47 = v31[108];
    v36 = v47;
    v48 = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_2;
    v49 = &unk_1EA730ED0;
    v50 = self;
    v51 = v4;
    __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_2((uint64_t)&v46);
    v43[0] = v30;
    v43[1] = v36;
    v43[2] = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_3;
    v43[3] = &unk_1EA726DC0;
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = v10;
    v37 = v10;
    v38 = v44;
    objc_msgSend(v20, "flatMap:", v43);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v42;
  }
  else
  {
    NSLog(CFSTR("actionSet must be set on HFActionSetItem before requesting an update"));
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (unint64_t)actionSetItemStyle
{
  return self->_actionSetItemStyle;
}

id __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  HFActionSetBuilder *v3;
  void *v4;
  void *v5;
  void *v6;
  HFActionSetBuilder *v7;
  HFActionSetValueSource *v8;
  HFServiceActionItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HFServiceActionItem *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HFItemUpdateOutcome *v24;

  objc_msgSend(*(id *)(a1 + 32), "serviceLikeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = [HFActionSetBuilder alloc];
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HFActionSetBuilder initWithExistingObject:inHome:](v3, "initWithExistingObject:inHome:", v4, v6);

    v8 = -[HFActionSetValueSource initWithActionSetBuilder:]([HFActionSetValueSource alloc], "initWithActionSetBuilder:", v7);
    v9 = [HFServiceActionItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceLikeItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithValueSource:", v8);
    v14 = -[HFServiceActionItem initWithHome:containingItem:](v9, "initWithHome:containingItem:", v11, v13);

    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceActionItem setActions:](v14, "setActions:", v16);

    v17 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v18 = (void *)MEMORY[0x1E0C99E60];
    -[HFAbstractBaseActionSetBuilder actions](v7, "actions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, HFItemUpdateOptionActionBuilders);

    v21 = (void *)objc_msgSend(v17, "copy");
    -[HFItem updateWithOptions:](v14, "updateWithOptions:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0D519C0];
    v24 = [HFItemUpdateOutcome alloc];
    v7 = -[HFItemUpdateOutcome initWithResults:](v24, "initWithResults:", MEMORY[0x1E0C9AA70]);
    objc_msgSend(v23, "futureWithResult:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (void)setServiceLikeItem:(id)a3
{
  id v4;
  HFActionSetValueSource *v5;
  void *v6;
  HFServiceLikeItem *v7;
  HFServiceLikeItem *serviceLikeItem;
  HFActionSetValueSource *v9;

  if (self->_serviceLikeItem != a3)
  {
    v4 = a3;
    v5 = [HFActionSetValueSource alloc];
    -[HFActionSetItem actionSet](self, "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFActionSetValueSource initWithActionSet:](v5, "initWithActionSet:", v6);

    v7 = (HFServiceLikeItem *)objc_msgSend(v4, "copyWithValueSource:", v9);
    serviceLikeItem = self->_serviceLikeItem;
    self->_serviceLikeItem = v7;

  }
}

- (HFActionSetItem)initWithActionSet:(id)a3 actionSetItemStyle:(unint64_t)a4 valueSource:(id)a5
{
  id v9;
  id v10;
  HFActionSetItem *v11;
  HFActionSetItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFActionSetItem;
  v11 = -[HFActionSetItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionSet, a3);
    v12->_actionSetItemStyle = a4;
    objc_storeStrong((id *)&v12->_valueSource, a5);
  }

  return v12;
}

id __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  objc_msgSend(*(id *)(a1 + 32), "readValuesForCharacteristics:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_3;
  v8[3] = &unk_1EA73F1A0;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v12 = v5;
  v13 = *(_BYTE *)(a1 + 72);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v3, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_4;
  v4[3] = &unk_1EA7289C8;
  v1 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v1, "flatMap:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("description"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("description"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;
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
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  os_activity_scope_state_s state;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = a2;
  objc_msgSend(v34, "allCharacteristics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (!v35)
  {
    v32 = 0;
    goto LABEL_25;
  }
  v32 = 0;
  v33 = *(_QWORD *)v38;
  *(_QWORD *)&v3 = 138413058;
  v30 = v3;
  do
  {
    v4 = 0;
    do
    {
      if (*(_QWORD *)v38 != v33)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
      objc_msgSend(v5, "characteristicType", v30);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "responseForCharacteristicType:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = *(void **)(a1 + 32);
      objc_msgSend(v5, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (!v8)
          goto LABEL_12;
      }
      else
      {
        NSLog(CFSTR("We got a read response for a characteristic we didn't ask to read"));
        if (!v8)
          goto LABEL_12;
      }
      v12 = *(void **)(a1 + 56);
      objc_msgSend(v5, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "minimumValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "maximumValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v12, "_value:isApproximatelyEqualToValue:forMinimumValue:maximumValue:", v8, v11, v14, v16);

      if ((_DWORD)v12)
      {
        ++v32;
        goto LABEL_17;
      }
LABEL_12:
      if (*(_BYTE *)(a1 + 64))
      {
        v17 = *(void **)(a1 + 40);
        if (v17)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v17, "loggerActivity");
          v18 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v18, &state);

          HFLogForCategory(0x29uLL);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 48), "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "hf_prettyDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            v42 = v20;
            v43 = 2112;
            v44 = v11;
            v45 = 2112;
            v46 = v8;
            v47 = 2112;
            v48 = v21;
            _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" isn't on because targetValue = %@, but readValue = %@ for characteristic %@", buf, 0x2Au);

          }
          os_activity_scope_leave(&state);
        }
        else
        {
          HFLogForCategory(0x29uLL);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 48), "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "hf_prettyDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            v42 = v23;
            v43 = 2112;
            v44 = v11;
            v45 = 2112;
            v46 = v8;
            v47 = 2112;
            v48 = v24;
            _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" isn't on because targetValue = %@, but readValue = %@ for characteristic %@", buf, 0x2Au);

          }
        }
      }
LABEL_17:

      ++v4;
    }
    while (v35 != v4);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    v35 = v25;
  }
  while (v25);
LABEL_25:

  v26 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "futureWithResult:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (BOOL)_value:(id)a3 isApproximatelyEqualToValue:(id)a4 forMinimumValue:(id)a5 maximumValue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  char v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_opt_class();
  v13 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_opt_class();
  v16 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v15)
    v19 = v18 == 0;
  else
    v19 = 1;
  if (v19)
    goto LABEL_21;
  objc_opt_class();
  v20 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  objc_opt_class();
  v23 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (!v22 || !v25)
  {

LABEL_21:
    v33 = objc_msgSend(v9, "isEqual:", v10);
    goto LABEL_22;
  }
  objc_msgSend(v22, "floatValue");
  v27 = v26;
  objc_msgSend(v25, "floatValue");
  v29 = vabds_f32(v27, v28);
  objc_msgSend(v18, "floatValue");
  v31 = v30;
  objc_msgSend(v15, "floatValue");
  v33 = v29 <= (float)((float)(v31 - v32) * 0.02);

LABEL_22:
  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
}

- (HFActionSetItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithActionSet_actionSetItemStyle_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionSetItem.m"), 69, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFActionSetItem init]",
    v5);

  return 0;
}

void __47__HFActionSetItem__subclass_updateWithOptions___block_invoke_22(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15)
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v15, CFSTR("state"));
  objc_msgSend(a1[5], "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(a1[5], "valueSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedErrorForExecutionOfActionSet:", a1[6]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFActionSetItemDescriptionExecutionFailure"), CFSTR("HFActionSetItemDescriptionExecutionFailure"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v10, CFSTR("description"));

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "hf_affectedCharacteristics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v12);
  objc_msgSend(a1[6], "hf_affectedMediaSessions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v13);
  objc_msgSend(a1[6], "hf_affectedProfiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v14);
  if (objc_msgSend(v11, "count"))
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v11, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(a1[7], "finishWithResult:", a1[4]);

}

id __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "mediaProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2_49;
  v8[3] = &unk_1EA73F218;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_3_50;
  v10[3] = &unk_1EA73F1F0;
  v11 = v3;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v14 = v5;
  v15 = v6;
  v7 = v3;
  objc_msgSend(v4, "futureWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_3_50(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  const char *v81;
  os_activity_scope_state_s v82;
  uint8_t buf[4];
  NSObject *v84;
  __int16 v85;
  NSObject *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  NSObject *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v6, "loggerActivity", 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v7, &v82);

    HFLogForCategory(0x29uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "name");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v84 = v9;
      v85 = 2112;
      v86 = v10;
      v87 = 2112;
      v88 = v5;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\", buf, 0x20u);

    }
    os_activity_scope_leave(&v82);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "name");
      v65 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v66 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v84 = v65;
      v85 = 2112;
      v86 = v66;
      v87 = 2112;
      v88 = v5;
      _os_log_impl(&dword_1DD34E000, v64, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 56), "volume");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "audioControl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "volume");
    objc_msgSend(v12, "numberWithFloat:");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 56), "volume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    *(float *)&v19 = v18 / 100.0;
    objc_msgSend(v16, "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend((id)v15, "_value:isApproximatelyEqualToValue:forMinimumValue:maximumValue:", v20, v14, &unk_1EA7CDEE8, &unk_1EA7CDEF8);

    if ((v15 & 1) == 0)
    {
      v34 = *(void **)(a1 + 40);
      if (v34)
      {
        objc_msgSend(v34, "loggerActivity", 0, 0);
        v35 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v35, &v82);

        HFLogForCategory(0x29uLL);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 48), "name");
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
          v38 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "volume");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v84 = v37;
          v85 = 2112;
          v86 = v38;
          v87 = 2112;
          v88 = v5;
          v89 = 2112;
          v90 = v39;
          v91 = 2112;
          v92 = v14;
          _os_log_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" volume doesn't match (%@, %@)", buf, 0x34u);

        }
        os_activity_scope_leave(&v82);
        goto LABEL_24;
      }
      HFLogForCategory(0x29uLL);
      v67 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      objc_msgSend(*(id *)(a1 + 48), "name");
      v68 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v71 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "volume");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v84 = v68;
      v85 = 2112;
      v86 = v71;
      v87 = 2112;
      v88 = v5;
      v89 = 2112;
      v90 = v72;
      v91 = 2112;
      v92 = v14;
      _os_log_impl(&dword_1DD34E000, v67, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" volume doesn't match (%@, %@)", buf, 0x34u);

      goto LABEL_52;
    }

  }
  if (!objc_msgSend(*(id *)(a1 + 56), "state"))
    goto LABEL_19;
  v21 = objc_msgSend(*(id *)(a1 + 56), "state");
  if (v21 == 1)
  {
    if (objc_msgSend(v5, "playbackState") == 1)
      goto LABEL_13;
LABEL_26:
    v40 = *(void **)(a1 + 40);
    if (v40)
    {
      objc_msgSend(v40, "loggerActivity", 0, 0);
      v41 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v41, &v82);

      HFLogForCategory(0x29uLL);
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

LABEL_31:
        os_activity_scope_leave(&v82);
        goto LABEL_32;
      }
      objc_msgSend(*(id *)(a1 + 48), "name");
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "playbackState"));
      v46 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v84 = v43;
      v85 = 2112;
      v86 = v44;
      v87 = 2112;
      v88 = v5;
      v89 = 2112;
      v90 = v45;
      v91 = 2112;
      v92 = v46;
      _os_log_impl(&dword_1DD34E000, v42, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback state doesn't match (%@, %@)", buf, 0x34u);

LABEL_29:
      goto LABEL_30;
    }
    HFLogForCategory(0x29uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "name");
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v68 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "playbackState"));
      v70 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v84 = v67;
      v85 = 2112;
      v86 = v68;
      v87 = 2112;
      v88 = v5;
      v89 = 2112;
      v90 = v69;
      v91 = 2112;
      v92 = v70;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback state doesn't match (%@, %@)", buf, 0x34u);

LABEL_53:
LABEL_54:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (v21 != 2 || objc_msgSend(v5, "playbackState") == 1 || !objc_msgSend(v5, "playbackState"))
    goto LABEL_26;
LABEL_13:
  objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "playbackSessionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaUniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqualToString:", v25);

    if ((v26 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValueForOption:", 1);

      v29 = objc_msgSend(v5, "shuffleState");
      if (objc_msgSend(v5, "shuffleState") && ((v28 ^ (v29 == 1)) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "BOOLValueForOption:", 2);

        v32 = objc_msgSend(v5, "repeatState");
        if (objc_msgSend(v5, "repeatState") && ((v31 ^ (v32 == 1)) & 1) != 0)
          goto LABEL_19;
        v62 = *(void **)(a1 + 40);
        if (v62)
        {
          objc_msgSend(v62, "loggerActivity", 0, 0);
          v63 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v63, &v82);

          HFLogForCategory(0x29uLL);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 48), "name");
            v57 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
            v58 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "repeatState"));
            v60 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v84 = v57;
            v85 = 2112;
            v86 = v58;
            v87 = 2112;
            v88 = v5;
            v89 = 2112;
            v90 = v59;
            v91 = 2112;
            v92 = v60;
            v61 = "Action set \"%@\" media profile \"%@\" media session \"%@\" repeat doesn't match (%@, %@)";
            goto LABEL_43;
          }
          goto LABEL_44;
        }
        HFLogForCategory(0x29uLL);
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 48), "name");
          v77 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
          v78 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "repeatState"));
          v80 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v84 = v77;
          v85 = 2112;
          v86 = v78;
          v87 = 2112;
          v88 = v5;
          v89 = 2112;
          v90 = v79;
          v91 = 2112;
          v92 = v80;
          v81 = "Action set \"%@\" media profile \"%@\" media session \"%@\" repeat doesn't match (%@, %@)";
          goto LABEL_61;
        }
      }
      else
      {
        v54 = *(void **)(a1 + 40);
        if (v54)
        {
          objc_msgSend(v54, "loggerActivity", 0, 0);
          v55 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v55, &v82);

          HFLogForCategory(0x29uLL);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 48), "name");
            v57 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
            v58 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "shuffleState"));
            v60 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v84 = v57;
            v85 = 2112;
            v86 = v58;
            v87 = 2112;
            v88 = v5;
            v89 = 2112;
            v90 = v59;
            v91 = 2112;
            v92 = v60;
            v61 = "Action set \"%@\" media profile \"%@\" media session \"%@\" shuffle doesn't match (%@, %@)";
LABEL_43:
            _os_log_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_DEFAULT, v61, buf, 0x34u);

          }
LABEL_44:

          goto LABEL_31;
        }
        HFLogForCategory(0x29uLL);
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 48), "name");
          v77 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
          v78 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "shuffleState"));
          v80 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v84 = v77;
          v85 = 2112;
          v86 = v78;
          v87 = 2112;
          v88 = v5;
          v89 = 2112;
          v90 = v79;
          v91 = 2112;
          v92 = v80;
          v81 = "Action set \"%@\" media profile \"%@\" media session \"%@\" shuffle doesn't match (%@, %@)";
LABEL_61:
          _os_log_impl(&dword_1DD34E000, v76, OS_LOG_TYPE_DEFAULT, v81, buf, 0x34u);

        }
      }

      goto LABEL_32;
    }
    v48 = *(void **)(a1 + 40);
    if (v48)
    {
      objc_msgSend(v48, "loggerActivity", 0, 0);
      v49 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v49, &v82);

      HFLogForCategory(0x29uLL);
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      objc_msgSend(*(id *)(a1 + 48), "name");
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "playbackSessionIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaUniqueIdentifier");
      v52 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v84 = v43;
      v85 = 2112;
      v86 = v44;
      v87 = 2112;
      v88 = v5;
      v89 = 2112;
      v90 = v51;
      v91 = 2112;
      v92 = v52;
      v93 = 2112;
      v94 = v53;
      _os_log_impl(&dword_1DD34E000, v42, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback archive doesn't match (%@, %@). mediaAction.playbackArchive %@", buf, 0x3Eu);

      goto LABEL_29;
    }
    HFLogForCategory(0x29uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "name");
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
      v68 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
      v71 = objc_claimAutoreleasedReturnValue();
      -[NSObject playbackSessionIdentifier](v71, "playbackSessionIdentifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaUniqueIdentifier");
      v74 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "playbackArchive");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v84 = v67;
      v85 = 2112;
      v86 = v68;
      v87 = 2112;
      v88 = v5;
      v89 = 2112;
      v90 = v73;
      v91 = 2112;
      v92 = v74;
      v93 = 2112;
      v94 = v75;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Action set \"%@\" media profile \"%@\" media session \"%@\" playback archive doesn't match (%@, %@). mediaAction.playbackArchive %@", buf, 0x3Eu);

LABEL_52:
      goto LABEL_53;
    }
LABEL_24:

LABEL_32:
    v33 = 0;
    goto LABEL_33;
  }
LABEL_19:
  v33 = 1;
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v47);

}

id __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = objc_msgSend(v3, "isNaturalLightingEnabled");
  v5 = *(id *)(a1 + 32);
  v6 = &unk_1F0405EE0;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v3, "lightProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "isNaturalLightingEnabledForProfile:", v9);
  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4 ^ v10 ^ 1u);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __82__HFActionSetItem__primaryStateForActionSet_valueSource_logger_fastInitialUpdate___block_invoke_2_108(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 += objc_msgSend(v9, "integerValue");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if (v6 == *(_QWORD *)(a1 + 32))
    v10 = 2;
  else
    v10 = 1;
  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)executeActionSet
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  -[HFActionSetItem valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = (void *)MEMORY[0x1E0D519C0];
  if ((v4 & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_initWeak(&location, self);
    -[HFActionSetItem valueSource](self, "valueSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetItem actionSet](self, "actionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__HFActionSetItem_executeActionSet__block_invoke;
    v13[3] = &unk_1EA72F608;
    objc_copyWeak(&v15, &location);
    v9 = v6;
    v14 = v9;
    objc_msgSend(v7, "executeActionSet:completionHandler:", v8, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 36);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureWithError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

void __35__HFActionSetItem_executeActionSet__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(WeakRetained, "actionSetOperation:errorFromError:", CFSTR("HFOperationExecuteActionSet"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v6);

  }
  else
  {
    objc_msgSend(v5, "finishWithNoResult");
  }

}

- (id)turnOffActionSet
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  HFActionSetItem *v27;
  void *v28;
  void *v29;
  id obj;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  HFActionSetItem *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = self;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HFActionSetItem actionSet](self, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "characteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "targetValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "characteristicType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "containsObject:", v14))
          {
            v15 = objc_msgSend(v12, "isEqual:", MEMORY[0x1E0C9AAB0]);

            if (v15)
              objc_msgSend(v29, "addObject:", v11);
          }
          else
          {

          }
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        objc_opt_class();
        v16 = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v10 = v17;

        if (objc_msgSend(v10, "state") == 1)
        {
          objc_msgSend(v10, "mediaProfiles");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "unionSet:", v11);
LABEL_18:

        }
LABEL_20:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v6);
  }

  -[HFActionSetItem actionSet](v27, "actionSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hf_characteristicValueManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D519C0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __35__HFActionSetItem_turnOffActionSet__block_invoke;
  v31[3] = &unk_1EA737000;
  v32 = v29;
  v33 = v28;
  v34 = v20;
  v35 = v27;
  v22 = v20;
  v23 = v28;
  v24 = v29;
  objc_msgSend(v21, "futureWithBlock:", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __35__HFActionSetItem_turnOffActionSet__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(a1[4], "na_map:", &__block_literal_global_117_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA648]), "initWithMediaProfiles:playbackState:volume:playbackArchive:", a1[5], 2, 0, 0);
    objc_msgSend(v4, "setByAddingObject:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1[6], "beginTransactionWithReason:", CFSTR("HFActionSetItemTransactionReasonCounterActionsExecution"));
    objc_initWeak(&location, a1[7]);
    objc_msgSend(a1[6], "executeActions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__HFActionSetItem_turnOffActionSet__block_invoke_3;
    v9[3] = &unk_1EA72C378;
    objc_copyWeak(&v11, &location);
    v10 = v3;
    v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

    objc_msgSend(a1[6], "commitTransactionWithReason:", CFSTR("HFActionSetItemTransactionReasonCounterActionsExecution"));
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v3, "finishWithNoResult");
  }

}

id __35__HFActionSetItem_turnOffActionSet__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0CBA480];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = (void *)objc_msgSend(v4, "initWithCharacteristic:targetValue:", v3, MEMORY[0x1E0C9AAA0]);

  return v5;
}

void __35__HFActionSetItem_turnOffActionSet__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "actionSetOperation:errorFromError:", CFSTR("HFOperationExecuteActionSet"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "finishWithResult:error:", v7, v9);
}

- (id)actionSetOperation:(id)a3 errorFromError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
    return 0;
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a3;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("HFErrorUserInfoOperationKey"));

  -[HFItem latestResults](self, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = CFSTR("HFErrorHandlerOptionFailedItemName");
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("HFErrorUserInfoOptionsKey"));

  }
  objc_msgSend(v7, "hf_errorWithAddedUserInfo:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
