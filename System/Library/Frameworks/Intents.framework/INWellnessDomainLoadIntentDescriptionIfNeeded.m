@implementation INWellnessDomainLoadIntentDescriptionIfNeeded

void ___INWellnessDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  INIntentDescription *v4;
  INIntentSlotDescription *v5;
  INIntentSlotDescription *v6;
  INIntentSlotDescription *v7;
  INIntentSlotDescription *v8;
  INIntentSlotDescription *v9;
  void *v10;
  void *v11;
  INIntentDescription *v12;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  INIntentDescription *v32;
  INIntentDescription *v33;
  void *v34;
  void *v35;
  INIntentSlotDescription *v36;
  INIntentSlotDescription *v37;
  INIntentSlotDescription *v38;
  INIntentSlotDescription *v39;
  INIntentSlotDescription *v40;
  INIntentSlotDescription *v41;
  INIntentDescription *v42;
  void *v43;
  void *v44;
  INIntentSlotDescription *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[5];
  _QWORD v52[6];
  INIntentSlotDescription *v53;
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sampleUuids"), 2, CFSTR("sampleUuids"), CFSTR("sampleUuids"), 0, 0, 30, 3, &unk_1E23F92B8, &unk_1E23F92D0, objc_opt_class(), sel_resolveSampleUuidsForDeleteHealthSample_withCompletion_, sel_resolveSampleUuidsForDeleteHealthSample_completion_, 0);
  v53 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("DeleteHealthSampleIntent"), CFSTR("DeleteHealthSampleIntentResponse"), v1, v2, CFSTR("sirikit.intent.wellness.DeleteHealthSampleIntent"), 0, sel_handleDeleteHealthSample_completion_, sel_confirmDeleteHealthSample_completion_, v43);
  v54[0] = v42;
  v32 = [INIntentDescription alloc];
  v30 = objc_opt_class();
  v3 = objc_opt_class();
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("objectType"), 2, CFSTR("objectType"), CFSTR("objectType"), 0, 0, 172, 1, &unk_1E23F92E8, &unk_1E23F9300, objc_opt_class(), sel_resolveObjectTypeForQueryHealthSample_withCompletion_, sel_resolveObjectTypeForQueryHealthSample_completion_, 0);
  v52[0] = v41;
  v40 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recordDate"), 3, CFSTR("recordDates"), CFSTR("recordDates"), 0, 0, 16, 3, &unk_1E23F9318, &unk_1E23F9330, objc_opt_class(), sel_resolveRecordDatesForQueryHealthSample_withCompletion_, sel_resolveRecordDatesForQueryHealthSample_completion_, 0);
  v52[1] = v40;
  v39 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("unit"), 4, CFSTR("unit"), CFSTR("unit"), 0, 0, 174, 1, &unk_1E23F9348, &unk_1E23F9360, objc_opt_class(), sel_resolveUnitForQueryHealthSample_withCompletion_, sel_resolveUnitForQueryHealthSample_completion_, 0);
  v52[2] = v39;
  v38 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("questionType"), 5, CFSTR("questionType"), CFSTR("questionType"), 0, 0, 177, 1, &unk_1E23F9378, &unk_1E23F9390, objc_opt_class(), sel_resolveQuestionTypeForQueryHealthSample_withCompletion_, sel_resolveQuestionTypeForQueryHealthSample_completion_, 0);
  v52[3] = v38;
  v37 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("thresholdValues"), 6, CFSTR("thresholdValues"), CFSTR("thresholdValues"), 0, 0, 173, 3, &unk_1E23F93A8, &unk_1E23F93C0, objc_opt_class(), sel_resolveThresholdValuesForQueryHealthSample_withCompletion_, sel_resolveThresholdValuesForQueryHealthSample_completion_, 0);
  v52[4] = v37;
  v36 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("expectedResultType"), 7, CFSTR("expectedResultType"), CFSTR("expectedResultType"), 0, 0, 178, 1, &unk_1E23F93D8, &unk_1E23F93F0, objc_opt_class(), sel_resolveExpectedResultTypeForQueryHealthSample_withCompletion_, sel_resolveExpectedResultTypeForQueryHealthSample_completion_, 0);
  v52[5] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v32, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("QueryHealthSampleIntent"), CFSTR("QueryHealthSampleIntentResponse"), v30, v3, CFSTR("sirikit.intent.wellness.QueryHealthSampleIntent"), 0, sel_handleQueryHealthSample_completion_, sel_confirmQueryHealthSample_completion_, v34);
  v54[1] = v4;
  v33 = [INIntentDescription alloc];
  v31 = objc_opt_class();
  v29 = objc_opt_class();
  v5 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recordDate"), 2, CFSTR("recordDate"), CFSTR("recordDate"), 0, 0, 16, 1, &unk_1E23F9408, &unk_1E23F9420, objc_opt_class(), sel_resolveRecordDateForSaveHealthSample_withCompletion_, sel_resolveRecordDateForSaveHealthSample_completion_, 0);
  v51[0] = v5;
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("objectType"), 3, CFSTR("objectType"), CFSTR("objectType"), 0, 0, 172, 1, &unk_1E23F9438, &unk_1E23F9450, objc_opt_class(), sel_resolveObjectTypeForSaveHealthSample_withCompletion_, sel_resolveObjectTypeForSaveHealthSample_completion_, 0);
  v51[1] = v6;
  v7 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("values"), 4, CFSTR("values"), CFSTR("values"), 0, 0, 173, 3, &unk_1E23F9468, &unk_1E23F9480, objc_opt_class(), sel_resolveValuesForSaveHealthSample_withCompletion_, sel_resolveValuesForSaveHealthSample_completion_, 0);
  v51[2] = v7;
  v8 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("unit"), 5, CFSTR("unit"), CFSTR("unit"), 0, 0, 174, 1, &unk_1E23F9498, &unk_1E23F94B0, objc_opt_class(), sel_resolveUnitForSaveHealthSample_withCompletion_, sel_resolveUnitForSaveHealthSample_completion_, 0);
  v51[3] = v8;
  v9 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sampleMetadata"), 6, CFSTR("sampleMetadatas"), CFSTR("sampleMetadatas"), 0, 0, 175, 3, &unk_1E23F94C8, &unk_1E23F94E0, objc_opt_class(), sel_resolveSampleMetadatasForSaveHealthSample_withCompletion_, sel_resolveSampleMetadatasForSaveHealthSample_completion_, 0);
  v51[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v33, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SaveHealthSampleIntent"), CFSTR("SaveHealthSampleIntentResponse"), v31, v29, CFSTR("sirikit.intent.wellness.SaveHealthSampleIntent"), 0, sel_handleSaveHealthSample_completion_, sel_confirmSaveHealthSample_completion_, v11);
  v54[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v22, v23);

        objc_msgSend(v22, "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v19);
  }

  v25 = objc_msgSend(v15, "copy");
  v26 = (void *)sWellnessDomain_intentDescsByName;
  sWellnessDomain_intentDescsByName = v25;

  v27 = objc_msgSend(v16, "copy");
  v28 = (void *)sWellnessDomain_intentDescsByType;
  sWellnessDomain_intentDescsByType = v27;

}

@end
