@implementation INRadioDomainLoadIntentDescriptionIfNeeded

void ___INRadioDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentSlotDescription *v0;
  INIntentSlotDescription *v1;
  INIntentSlotDescription *v2;
  INIntentSlotDescription *v3;
  INIntentSlotDescription *v4;
  void *v5;
  void *v6;
  INIntentDescription *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  INIntentDescription *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[5];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v26 = [INIntentDescription alloc];
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v0 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("radioType"), 2, CFSTR("radioType"), CFSTR("radioType"), 0, 0, 149, 1, &unk_1E23F8868, &unk_1E23F8880, objc_opt_class(), sel_resolveRadioTypeForSetRadioStation_withCompletion_, sel_resolveRadioTypeForSetRadioStation_completion_, 0);
  v32[0] = v0;
  v1 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("frequency"), 3, CFSTR("frequency"), CFSTR("frequency"), 0, 0, 21, 1, &unk_1E23F8898, &unk_1E23F88B0, objc_opt_class(), sel_resolveFrequencyForSetRadioStation_withCompletion_, sel_resolveFrequencyForSetRadioStation_completion_, 0);
  v32[1] = v1;
  v2 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("stationName"), 4, CFSTR("stationName"), CFSTR("stationName"), 0, 0, 30, 1, &unk_1E23F88C8, &unk_1E23F88E0, objc_opt_class(), sel_resolveStationNameForSetRadioStation_withCompletion_, sel_resolveStationNameForSetRadioStation_completion_, 0);
  v32[2] = v2;
  v3 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("channel"), 5, CFSTR("channel"), CFSTR("channel"), 0, 0, 30, 1, &unk_1E23F88F8, &unk_1E23F8910, objc_opt_class(), sel_resolveChannelForSetRadioStation_withCompletion_, sel_resolveChannelForSetRadioStation_completion_, 0);
  v32[3] = v3;
  v4 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("presetNumber"), 6, CFSTR("presetNumber"), CFSTR("presetNumber"), 0, 0, 24, 1, &unk_1E23F8928, &unk_1E23F8940, objc_opt_class(), sel_resolvePresetNumberForSetRadioStation_withCompletion_, sel_resolvePresetNumberForSetRadioStation_completion_, 0);
  v32[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v26, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetRadioStationIntent"), CFSTR("SetRadioStationIntentResponse"), v25, v24, CFSTR("sirikit.intent.media_player.SetRadioStationIntent"), 0, sel_handleSetRadioStation_completion_, sel_confirmSetRadioStation_completion_, v6);
  v33[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v17, v18);

        objc_msgSend(v17, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v17, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v20 = objc_msgSend(v10, "copy");
  v21 = (void *)sRadioDomain_intentDescsByName;
  sRadioDomain_intentDescsByName = v20;

  v22 = objc_msgSend(v11, "copy");
  v23 = (void *)sRadioDomain_intentDescsByType;
  sRadioDomain_intentDescsByType = v22;

}

@end
