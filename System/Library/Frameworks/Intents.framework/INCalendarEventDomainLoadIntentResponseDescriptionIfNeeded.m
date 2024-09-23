@implementation INCalendarEventDomainLoadIntentResponseDescriptionIfNeeded

void ___INCalendarEventDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
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
  INIntentResponseDescription *v10;
  uint64_t v11;
  uint64_t v12;
  INIntentSlotDescription *v13;
  INIntentSlotDescription *v14;
  INIntentSlotDescription *v15;
  void *v16;
  void *v17;
  INIntentResponseDescription *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  INIntentSlotDescription *v37;
  INIntentResponseDescription *v38;
  void *v39;
  void *v40;
  INIntentSlotDescription *v41;
  INIntentResponseDescription *v42;
  void *v43;
  void *v44;
  INIntentSlotDescription *v45;
  INIntentSlotDescription *v46;
  INIntentSlotDescription *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[3];
  INIntentSlotDescription *v54;
  INIntentSlotDescription *v55;
  _QWORD v56[3];
  _QWORD v57[6];

  v57[4] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("createdEvent"), 1, CFSTR("createdEvent"), CFSTR("createdEvent"), 0, 0, 239, 1, 0, 0, 0, 0);
  v56[0] = v47;
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("conflictingEventIdentifiers"), 2, CFSTR("conflictingEventIdentifiers"), CFSTR("conflictingEventIdentifiers"), 0, 0, 7, 3, 0, 0, 0, 0);
  v56[1] = v46;
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("confirmationReason"), 3, CFSTR("confirmationReason"), CFSTR("confirmationReason"), 0, 0, 242, 1, 0, 0, 0, 0);
  v56[2] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("CreateEventIntentResponse"), v1, v2, CFSTR("sirikit.intent.calendar.CreateEventIntentResponse"), 0, v43);
  v57[0] = v42;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("confirmationReason"), 3, CFSTR("confirmationReason"), CFSTR("confirmationReason"), 0, 0, 244, 1, 0, 0, 0, 0);
  v55 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("DeleteEventIntentResponse"), v4, v5, CFSTR("sirikit.intent.calendar.DeleteEventIntentResponse"), 0, v39);
  v57[1] = v38;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v37 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("events"), 1, CFSTR("events"), CFSTR("events"), 0, 0, 239, 3, 0, 0, 0, 0);
  v54 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("FindEventsIntentResponse"), v7, v8, CFSTR("sirikit.intent.calendar.FindEventsIntentResponse"), 0, v35);
  v57[2] = v9;
  v10 = [INIntentResponseDescription alloc];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updatedEvent"), 1, CFSTR("updatedEvent"), CFSTR("updatedEvent"), 0, 0, 239, 1, 0, 0, 0, 0);
  v53[0] = v13;
  v14 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("conflictingEventIdentifiers"), 2, CFSTR("conflictingEventIdentifiers"), CFSTR("conflictingEventIdentifiers"), 0, 0, 7, 3, 0, 0, 0, 0);
  v53[1] = v14;
  v15 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("confirmationReason"), 3, CFSTR("confirmationReason"), CFSTR("confirmationReason"), 0, 0, 243, 1, 0, 0, 0, 0);
  v53[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v10, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("UpdateEventIntentResponse"), v11, v12, CFSTR("sirikit.intent.calendar.UpdateEventIntentResponse"), 0, v17);
  v57[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "count");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v20);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v20);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v23 = v19;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v28, v29);

        objc_msgSend(v28, "type");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v28, v30);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v25);
  }

  v31 = objc_msgSend(v21, "copy");
  v32 = (void *)sCalendarEventDomain_intentResponseDescsByName;
  sCalendarEventDomain_intentResponseDescsByName = v31;

  v33 = objc_msgSend(v22, "copy");
  v34 = (void *)sCalendarEventDomain_intentResponseDescsByType;
  sCalendarEventDomain_intentResponseDescsByType = v33;

}

@end
