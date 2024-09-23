@implementation INWorkflowDomainLoadIntentResponseDescriptionIfNeeded

void ___INWorkflowDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentSlotDescription *v0;
  INIntentSlotDescription *v1;
  INIntentSlotDescription *v2;
  INIntentSlotDescription *v3;
  INIntentSlotDescription *v4;
  INIntentSlotDescription *v5;
  void *v6;
  void *v7;
  INIntentResponseDescription *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  INIntentResponseDescription *v27;
  INIntentSlotDescription *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[7];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v27 = [INIntentResponseDescription alloc];
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v28 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("underlyingIntent"), 1, CFSTR("underlyingIntent"), CFSTR("underlyingIntent"), 0, 0, 197, 1, 0, 0, 0, 0);
  v34[0] = v28;
  v0 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("underlyingIntentResponse"), 2, CFSTR("underlyingIntentResponse"), CFSTR("underlyingIntentResponse"), 0, 0, 197, 1, 0, 0, 0, 0);
  v34[1] = v0;
  v1 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("utterance"), 3, CFSTR("utterance"), CFSTR("utterance"), 0, 0, 7, 1, 0, 0, 0, 0);
  v34[2] = v1;
  v2 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("waitingForResume"), 4, CFSTR("waitingForResume"), CFSTR("waitingForResume"), 0, 0, 1, 1, 0, 0, 0, 0);
  v34[3] = v2;
  v3 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("continueRunning"), 5, CFSTR("continueRunning"), CFSTR("continueRunning"), 0, 0, 1, 1, 0, 0, 0, 0);
  v34[4] = v3;
  v4 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("step"), 6, CFSTR("steps"), CFSTR("steps"), 0, 0, 199, 3, 0, 0, 0, 0);
  v34[5] = v4;
  v5 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("requestsIntentExecution"), 7, CFSTR("requestsIntentExecution"), CFSTR("requestsIntentExecution"), 0, 0, 1, 1, 0, 0, 0, 0);
  v34[6] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v27, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("RunWorkflowIntentResponse"), v26, v25, CFSTR("sirikit.intent.workflow.RunWorkflowIntentResponse"), 0, v7);
  v35[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v10);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v18, v19);

        objc_msgSend(v18, "type");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v18, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend(v11, "copy");
  v22 = (void *)sWorkflowDomain_intentResponseDescsByName;
  sWorkflowDomain_intentResponseDescsByName = v21;

  v23 = objc_msgSend(v12, "copy");
  v24 = (void *)sWorkflowDomain_intentResponseDescsByType;
  sWorkflowDomain_intentResponseDescsByType = v23;

}

@end
