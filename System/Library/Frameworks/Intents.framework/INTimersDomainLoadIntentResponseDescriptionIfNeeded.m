@implementation INTimersDomainLoadIntentResponseDescriptionIfNeeded

void ___INTimersDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentResponseDescription *v3;
  uint64_t v4;
  uint64_t v5;
  INIntentResponseDescription *v6;
  uint64_t v7;
  uint64_t v8;
  INIntentResponseDescription *v9;
  uint64_t v10;
  uint64_t v11;
  INIntentResponseDescription *v12;
  uint64_t v13;
  uint64_t v14;
  INIntentResponseDescription *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  INIntentResponseDescription *v20;
  INIntentResponseDescription *v21;
  uint64_t v22;
  uint64_t v23;
  INIntentSlotDescription *v24;
  void *v25;
  void *v26;
  INIntentResponseDescription *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  INIntentSlotDescription *v44;
  INIntentSlotDescription *v45;
  INIntentResponseDescription *v46;
  void *v47;
  void *v48;
  INIntentSlotDescription *v49;
  INIntentResponseDescription *v50;
  void *v51;
  void *v52;
  INIntentSlotDescription *v53;
  INIntentResponseDescription *v54;
  void *v55;
  void *v56;
  INIntentSlotDescription *v57;
  INIntentResponseDescription *v58;
  void *v59;
  void *v60;
  INIntentSlotDescription *v61;
  INIntentResponseDescription *v62;
  void *v63;
  void *v64;
  INIntentSlotDescription *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  INIntentSlotDescription *v71;
  _QWORD v72[2];
  INIntentSlotDescription *v73;
  INIntentSlotDescription *v74;
  INIntentSlotDescription *v75;
  INIntentSlotDescription *v76;
  INIntentSlotDescription *v77;
  _QWORD v78[9];

  v78[7] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v65 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("createdTimer"), 1, CFSTR("createdTimer"), CFSTR("createdTimer"), 0, 0, 189, 1, 0, 0, 0, 0);
  v77 = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("CreateTimerIntentResponse"), v1, v2, CFSTR("sirikit.intent.timer.CreateTimerIntentResponse"), 0, v63);
  v78[0] = v62;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v61 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("deletedTimers"), 1, CFSTR("deletedTimers"), CFSTR("deletedTimers"), 0, 0, 189, 3, 0, 0, 0, 0);
  v76 = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("DeleteTimerIntentResponse"), v4, v5, CFSTR("sirikit.intent.timer.DeleteTimerIntentResponse"), 0, v59);
  v78[1] = v58;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v57 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("pausedTimers"), 1, CFSTR("pausedTimers"), CFSTR("pausedTimers"), 0, 0, 189, 3, 0, 0, 0, 0);
  v75 = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("PauseTimerIntentResponse"), v7, v8, CFSTR("sirikit.intent.timer.PauseTimerIntentResponse"), 0, v55);
  v78[2] = v54;
  v9 = [INIntentResponseDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("resetTimers"), 1, CFSTR("resetTimers"), CFSTR("resetTimers"), 0, 0, 189, 3, 0, 0, 0, 0);
  v74 = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v9, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ResetTimerIntentResponse"), v10, v11, CFSTR("sirikit.intent.timer.ResetTimerIntentResponse"), 0, v51);
  v78[3] = v50;
  v12 = [INIntentResponseDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("resumedTimers"), 1, CFSTR("resumedTimers"), CFSTR("resumedTimers"), 0, 0, 189, 3, 0, 0, 0, 0);
  v73 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v12, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ResumeTimerIntentResponse"), v13, v14, CFSTR("sirikit.intent.timer.ResumeTimerIntentResponse"), 0, v47);
  v78[4] = v46;
  v15 = [INIntentResponseDescription alloc];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("matchedTimers"), 2, CFSTR("matchedTimers"), CFSTR("matchedTimers"), 0, 0, 189, 3, 0, 0, 0, 0);
  v72[0] = v45;
  v44 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("unmatchedTimers"), 3, CFSTR("unmatchedTimers"), CFSTR("unmatchedTimers"), 0, 0, 189, 3, 0, 0, 0, 0);
  v72[1] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v15, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForTimersIntentResponse"), v16, v17, CFSTR("sirikit.intent.timer.SearchForTimersIntentResponse"), 0, v19);
  v78[5] = v20;
  v21 = [INIntentResponseDescription alloc];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updatedTimer"), 1, CFSTR("updatedTimer"), CFSTR("updatedTimer"), 0, 0, 189, 1, 0, 0, 0, 0);
  v71 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v21, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetTimerAttributeIntentResponse"), v22, v23, CFSTR("sirikit.intent.timer.SetTimerAttributeIntentResponse"), 0, v26);
  v78[6] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "count");
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v29);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v29);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v32 = v28;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v67 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v37, "name");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKey:", v37, v38);

        objc_msgSend(v37, "type");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v37, v39);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    }
    while (v34);
  }

  v40 = objc_msgSend(v30, "copy");
  v41 = (void *)sTimersDomain_intentResponseDescsByName;
  sTimersDomain_intentResponseDescsByName = v40;

  v42 = objc_msgSend(v31, "copy");
  v43 = (void *)sTimersDomain_intentResponseDescsByType;
  sTimersDomain_intentResponseDescsByType = v42;

}

@end
