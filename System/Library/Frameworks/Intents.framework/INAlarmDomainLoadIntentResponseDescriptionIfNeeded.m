@implementation INAlarmDomainLoadIntentResponseDescriptionIfNeeded

void ___INAlarmDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
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
  void *v9;
  INIntentResponseDescription *v10;
  uint64_t v11;
  uint64_t v12;
  INIntentResponseDescription *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  INIntentResponseDescription *v17;
  INIntentResponseDescription *v18;
  uint64_t v19;
  uint64_t v20;
  INIntentSlotDescription *v21;
  INIntentSlotDescription *v22;
  void *v23;
  void *v24;
  INIntentResponseDescription *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  INIntentResponseDescription *v42;
  void *v43;
  INIntentResponseDescription *v44;
  void *v45;
  INIntentResponseDescription *v46;
  void *v47;
  void *v48;
  INIntentSlotDescription *v49;
  INIntentSlotDescription *v50;
  INIntentResponseDescription *v51;
  void *v52;
  void *v53;
  INIntentSlotDescription *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _QWORD v60[2];
  _QWORD v61[2];
  INIntentSlotDescription *v62;
  _QWORD v63[8];

  v63[6] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v54 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("modifiedAlarms"), 1, CFSTR("modifiedAlarms"), CFSTR("modifiedAlarms"), 0, 0, 179, 3, 0, 0, 0, 0);
  v62 = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ChangeAlarmStatusIntentResponse"), v1, v2, CFSTR("sirikit.intent.alarm.ChangeAlarmStatusIntentResponse"), 0, v52);
  v63[0] = v51;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v50 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("createdAlarm"), 1, CFSTR("createdAlarm"), CFSTR("createdAlarm"), 0, 0, 179, 1, 0, 0, 0, 0);
  v61[0] = v50;
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("successCode"), 2, CFSTR("successCode"), CFSTR("successCode"), 0, 0, 185, 1, 0, 0, 0, 0);
  v61[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("CreateAlarmIntentResponse"), v4, v5, CFSTR("sirikit.intent.alarm.CreateAlarmIntentResponse"), 0, v47);
  v63[1] = v46;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("DeleteAlarmIntentResponse"), v7, v8, CFSTR("sirikit.intent.alarm.DeleteAlarmIntentResponse"), 0, v45);
  v63[2] = v44;
  v10 = [INIntentResponseDescription alloc];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v10, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchAlarmIntentResponse"), v11, v12, CFSTR("sirikit.intent.alarm.SearchAlarmIntentResponse"), 0, v43);
  v63[3] = v42;
  v13 = [INIntentResponseDescription alloc];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v13, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SnoozeAlarmIntentResponse"), v14, v15, CFSTR("sirikit.intent.alarm.SnoozeAlarmIntentResponse"), 0, v16);
  v63[4] = v17;
  v18 = [INIntentResponseDescription alloc];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updatedAlarm"), 1, CFSTR("updatedAlarm"), CFSTR("updatedAlarm"), 0, 0, 179, 1, 0, 0, 0, 0);
  v60[0] = v21;
  v22 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("conflictAlarms"), 2, CFSTR("conflictAlarms"), CFSTR("conflictAlarms"), 0, 0, 179, 3, 0, 0, 0, 0);
  v60[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v18, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("UpdateAlarmIntentResponse"), v19, v20, CFSTR("sirikit.intent.alarm.UpdateAlarmIntentResponse"), 0, v24);
  v63[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "count");
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v27);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v27);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v30 = v26;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v56 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v35, v36);

        objc_msgSend(v35, "type");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v35, v37);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v32);
  }

  v38 = objc_msgSend(v28, "copy");
  v39 = (void *)sAlarmDomain_intentResponseDescsByName;
  sAlarmDomain_intentResponseDescsByName = v38;

  v40 = objc_msgSend(v29, "copy");
  v41 = (void *)sAlarmDomain_intentResponseDescsByType;
  sAlarmDomain_intentResponseDescsByType = v40;

}

@end
