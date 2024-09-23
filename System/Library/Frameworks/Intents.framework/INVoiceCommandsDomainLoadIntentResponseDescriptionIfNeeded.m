@implementation INVoiceCommandsDomainLoadIntentResponseDescriptionIfNeeded

void ___INVoiceCommandsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentResponseDescription *v3;
  INIntentSlotDescription *v4;
  INIntentSlotDescription *v5;
  INIntentSlotDescription *v6;
  INIntentSlotDescription *v7;
  INIntentSlotDescription *v8;
  INIntentSlotDescription *v9;
  void *v10;
  void *v11;
  INIntentResponseDescription *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  INIntentSlotDescription *v29;
  INIntentSlotDescription *v30;
  INIntentSlotDescription *v31;
  INIntentSlotDescription *v32;
  INIntentSlotDescription *v33;
  INIntentSlotDescription *v34;
  uint64_t v35;
  INIntentSlotDescription *v36;
  uint64_t v37;
  INIntentSlotDescription *v38;
  INIntentSlotDescription *v39;
  INIntentResponseDescription *v40;
  void *v41;
  void *v42;
  INIntentSlotDescription *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[15];
  INIntentSlotDescription *v50;
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("shortcuts"), 1, CFSTR("shortcuts"), CFSTR("shortcuts"), 0, 0, 201, 3, 0, 0, 0, 0);
  v50 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ListShortcutsIntentResponse"), v1, v2, CFSTR("sirikit.intent.voice_commands.ListShortcutsIntentResponse"), 0, v41);
  v51[0] = v40;
  v3 = [INIntentResponseDescription alloc];
  v37 = objc_opt_class();
  v35 = objc_opt_class();
  v39 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("appBundleId"), 1, CFSTR("appBundleId"), CFSTR("appBundleId"), 0, 0, 7, 1, 0, 0, 0, 0);
  v49[0] = v39;
  v38 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("intentCategory"), 2, CFSTR("intentCategory"), CFSTR("intentCategory"), 0, 0, 196, 1, 0, 0, 0, 0);
  v49[1] = v38;
  v36 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("customResponsesDisabled"), 3, CFSTR("customResponsesDisabled"), CFSTR("customResponsesDisabled"), 0, 0, 1, 1, 0, 0, 0, 0);
  v49[2] = v36;
  v34 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("responseTemplate"), 4, CFSTR("responseTemplate"), CFSTR("responseTemplate"), 0, 0, 7, 1, 0, 0, 0, 0);
  v49[3] = v34;
  v33 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parameters"), 5, CFSTR("parameters"), CFSTR("parameters"), 0, 0, 35, 1, 0, 0, 0, 0);
  v49[4] = v33;
  v32 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("verb"), 6, CFSTR("verb"), CFSTR("verb"), 0, 0, 7, 1, 0, 0, 0, 0);
  v49[5] = v32;
  v31 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("underlyingIntent"), 7, CFSTR("underlyingIntent"), CFSTR("underlyingIntent"), 0, 0, 197, 1, 0, 0, 0, 0);
  v49[6] = v31;
  v30 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("localizedAppName"), 8, CFSTR("localizedAppName"), CFSTR("localizedAppName"), 0, 0, 7, 1, 0, 0, 0, 0);
  v49[7] = v30;
  v29 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("underlyingIntentResponse"), 9, CFSTR("underlyingIntentResponse"), CFSTR("underlyingIntentResponse"), 0, 0, 197, 1, 0, 0, 0, 0);
  v49[8] = v29;
  v4 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("toggleState"), 10, CFSTR("toggleState"), CFSTR("toggleState"), 0, 0, 204, 1, 0, 0, 0, 0);
  v49[9] = v4;
  v5 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("continueRunning"), 11, CFSTR("continueRunning"), CFSTR("continueRunning"), 0, 0, 1, 1, 0, 0, 0, 0);
  v49[10] = v5;
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("interstitialDisabled"), 12, CFSTR("interstitialDisabled"), CFSTR("interstitialDisabled"), 0, 0, 1, 1, 0, 0, 0, 0);
  v49[11] = v6;
  v7 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("underlyingIntentTitle"), 13, CFSTR("underlyingIntentTitle"), CFSTR("underlyingIntentTitle"), 0, 0, 7, 1, 0, 0, 0, 0);
  v49[12] = v7;
  v8 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("step"), 14, CFSTR("steps"), CFSTR("steps"), 0, 0, 199, 3, 0, 0, 0, 0);
  v49[13] = v8;
  v9 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("prefersExecutionOnCompanion"), 15, CFSTR("prefersExecutionOnCompanion"), CFSTR("prefersExecutionOnCompanion"), 0, 0, 1, 1, 0, 0, 0, 0);
  v49[14] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("RunVoiceCommandIntentResponse"), v37, v35, CFSTR("sirikit.intent.voice_commands.RunVoiceCommandIntentResponse"), 0, v11);
  v51[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v22, v23);

        objc_msgSend(v22, "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v19);
  }

  v25 = objc_msgSend(v15, "copy");
  v26 = (void *)sVoiceCommandsDomain_intentResponseDescsByName;
  sVoiceCommandsDomain_intentResponseDescsByName = v25;

  v27 = objc_msgSend(v16, "copy");
  v28 = (void *)sVoiceCommandsDomain_intentResponseDescsByType;
  sVoiceCommandsDomain_intentResponseDescsByType = v27;

}

@end
