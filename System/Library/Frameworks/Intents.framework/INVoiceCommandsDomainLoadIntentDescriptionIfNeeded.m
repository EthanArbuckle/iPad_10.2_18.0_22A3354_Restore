@implementation INVoiceCommandsDomainLoadIntentDescriptionIfNeeded

void ___INVoiceCommandsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentDescription *v3;
  INIntentSlotDescription *v4;
  INIntentSlotDescription *v5;
  INIntentSlotDescription *v6;
  INIntentSlotDescription *v7;
  void *v8;
  void *v9;
  INIntentDescription *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  INIntentDescription *v29;
  void *v30;
  void *v31;
  INIntentSlotDescription *v32;
  INIntentSlotDescription *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[4];
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v33 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("originDevice"), 2, CFSTR("originDevice"), CFSTR("originDevice"), 0, 0, 203, 1, 0, 0, 0, 0);
  v40[0] = v33;
  v32 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("appTitle"), 3, CFSTR("appTitles"), CFSTR("appTitles"), 0, 0, 202, 3, &unk_1E23F9228, &unk_1E23F9240, objc_opt_class(), sel_resolveAppTitlesForListShortcuts_withCompletion_, sel_resolveAppTitlesForListShortcuts_completion_, 0);
  v40[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ListShortcutsIntent"), CFSTR("ListShortcutsIntentResponse"), v1, v2, CFSTR("sirikit.intent.voice_commands.ListShortcutsIntent"), 0, sel_handleListShortcuts_completion_, sel_confirmListShortcuts_completion_, v30);
  v41[0] = v3;
  v29 = [INIntentDescription alloc];
  v28 = objc_opt_class();
  v27 = objc_opt_class();
  v4 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("voiceCommand"), 2, CFSTR("voiceCommand"), CFSTR("voiceCommand"), 0, 0, 12, 1, &unk_1E23F9258, &unk_1E23F9270, objc_opt_class(), sel_resolveVoiceCommandForRunVoiceCommand_withCompletion_, sel_resolveVoiceCommandForRunVoiceCommand_completion_, 0);
  v39[0] = v4;
  v5 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("originDevice"), 3, CFSTR("originDevice"), CFSTR("originDevice"), 0, 0, 198, 1, 0, 0, 0, 0);
  v39[1] = v5;
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("executionResult"), 4, CFSTR("executionResult"), CFSTR("executionResult"), 0, 0, 200, 1, &unk_1E23F9288, &unk_1E23F92A0, objc_opt_class(), sel_resolveExecutionResultForRunVoiceCommand_withCompletion_, sel_resolveExecutionResultForRunVoiceCommand_completion_, 0);
  v39[2] = v6;
  v7 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("previousIntentIdentifier"), 5, CFSTR("previousIntentIdentifier"), CFSTR("previousIntentIdentifier"), 0, 0, 7, 1, 0, 0, 0, 0);
  v39[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v29, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("RunVoiceCommandIntent"), CFSTR("RunVoiceCommandIntentResponse"), v28, v27, CFSTR("sirikit.intent.voice_commands.RunVoiceCommandIntent"), 0, sel_handleRunVoiceCommand_completion_, sel_confirmRunVoiceCommand_completion_, v9);
  v41[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v20, v21);

        objc_msgSend(v20, "type");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v20, v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v17);
  }

  v23 = objc_msgSend(v13, "copy");
  v24 = (void *)sVoiceCommandsDomain_intentDescsByName;
  sVoiceCommandsDomain_intentDescsByName = v23;

  v25 = objc_msgSend(v14, "copy");
  v26 = (void *)sVoiceCommandsDomain_intentDescsByType;
  sVoiceCommandsDomain_intentDescsByType = v25;

}

@end
