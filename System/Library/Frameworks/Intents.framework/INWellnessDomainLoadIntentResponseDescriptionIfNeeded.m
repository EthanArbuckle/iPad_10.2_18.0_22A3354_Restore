@implementation INWellnessDomainLoadIntentResponseDescriptionIfNeeded

void ___INWellnessDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentResponseDescription *v3;
  uint64_t v4;
  uint64_t v5;
  INIntentSlotDescription *v6;
  INIntentSlotDescription *v7;
  INIntentSlotDescription *v8;
  INIntentSlotDescription *v9;
  INIntentSlotDescription *v10;
  INIntentSlotDescription *v11;
  void *v12;
  void *v13;
  INIntentResponseDescription *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  INIntentResponseDescription *v33;
  INIntentSlotDescription *v34;
  INIntentResponseDescription *v35;
  void *v36;
  void *v37;
  INIntentSlotDescription *v38;
  INIntentResponseDescription *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[7];
  INIntentSlotDescription *v47;
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("DeleteHealthSampleIntentResponse"), v1, v2, CFSTR("sirikit.intent.wellness.DeleteHealthSampleIntentResponse"), 0, v40);
  v48[0] = v39;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v38 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("resultValues"), 1, CFSTR("resultValues"), CFSTR("resultValues"), 0, 0, 176, 3, 0, 0, 0, 0);
  v47 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("QueryHealthSampleIntentResponse"), v4, v5, CFSTR("sirikit.intent.wellness.QueryHealthSampleIntentResponse"), 0, v36);
  v48[1] = v35;
  v33 = [INIntentResponseDescription alloc];
  v32 = objc_opt_class();
  v31 = objc_opt_class();
  v34 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sampleUuids"), 1, CFSTR("sampleUuids"), CFSTR("sampleUuids"), 0, 0, 30, 3, 0, 0, 0, 0);
  v46[0] = v34;
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recordDate"), 2, CFSTR("recordDate"), CFSTR("recordDate"), 0, 0, 16, 1, 0, 0, 0, 0);
  v46[1] = v6;
  v7 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("defaultUnit"), 3, CFSTR("defaultUnit"), CFSTR("defaultUnit"), 0, 0, 30, 1, 0, 0, 0, 0);
  v46[2] = v7;
  v8 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("valuesDefaultUnit"), 4, CFSTR("valuesDefaultUnits"), CFSTR("valuesDefaultUnits"), 0, 0, 173, 3, 0, 0, 0, 0);
  v46[3] = v8;
  v9 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("userProvidedUnit"), 5, CFSTR("userProvidedUnit"), CFSTR("userProvidedUnit"), 0, 0, 30, 1, 0, 0, 0, 0);
  v46[4] = v9;
  v10 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("valuesUserProvidedUnit"), 6, CFSTR("valuesUserProvidedUnits"), CFSTR("valuesUserProvidedUnits"), 0, 0, 173, 3, 0, 0, 0, 0);
  v46[5] = v10;
  v11 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("punchoutUrl"), 7, CFSTR("punchoutUrl"), CFSTR("punchoutUrl"), 0, 0, 30, 1, 0, 0, 0, 0);
  v46[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v33, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SaveHealthSampleIntentResponse"), v32, v31, CFSTR("sirikit.intent.wellness.SaveHealthSampleIntentResponse"), 0, v13);
  v48[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v16);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v16);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v24, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v24, v25);

        objc_msgSend(v24, "type");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v24, v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v21);
  }

  v27 = objc_msgSend(v17, "copy");
  v28 = (void *)sWellnessDomain_intentResponseDescsByName;
  sWellnessDomain_intentResponseDescsByName = v27;

  v29 = objc_msgSend(v18, "copy");
  v30 = (void *)sWellnessDomain_intentResponseDescsByType;
  sWellnessDomain_intentResponseDescsByType = v29;

}

@end
