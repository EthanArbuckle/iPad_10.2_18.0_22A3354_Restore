@implementation INSettingsDomainLoadIntentDescriptionIfNeeded

void ___INSettingsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentDescription *v3;
  uint64_t v4;
  uint64_t v5;
  INIntentDescription *v6;
  uint64_t v7;
  uint64_t v8;
  INIntentDescription *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  INIntentDescription *v14;
  INIntentSlotDescription *v15;
  INIntentSlotDescription *v16;
  INIntentSlotDescription *v17;
  INIntentSlotDescription *v18;
  void *v19;
  void *v20;
  INIntentDescription *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  INIntentDescription *v42;
  INIntentDescription *v43;
  void *v44;
  INIntentSlotDescription *v45;
  INIntentSlotDescription *v46;
  INIntentSlotDescription *v47;
  INIntentSlotDescription *v48;
  INIntentSlotDescription *v49;
  INIntentDescription *v50;
  void *v51;
  void *v52;
  INIntentSlotDescription *v53;
  INIntentSlotDescription *v54;
  INIntentSlotDescription *v55;
  INIntentDescription *v56;
  void *v57;
  void *v58;
  INIntentSlotDescription *v59;
  INIntentSlotDescription *v60;
  INIntentSlotDescription *v61;
  INIntentDescription *v62;
  void *v63;
  void *v64;
  INIntentSlotDescription *v65;
  INIntentSlotDescription *v66;
  INIntentDescription *v67;
  void *v68;
  void *v69;
  INIntentSlotDescription *v70;
  INIntentSlotDescription *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _QWORD v77[4];
  _QWORD v78[5];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[8];

  v83[6] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v71 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("settingMetadata"), 2, CFSTR("settingMetadata"), CFSTR("settingMetadata"), 0, 0, 230, 1, &unk_1E23F8B08, &unk_1E23F8B20, objc_opt_class(), sel_resolveSettingMetadataForGetSetting_withCompletion_, sel_resolveSettingMetadataForGetSetting_completion_, 0);
  v82[0] = v71;
  v70 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("confirmationValue"), 3, CFSTR("confirmationValue"), CFSTR("confirmationValue"), 0, 0, 234, 1, &unk_1E23F8B38, &unk_1E23F8B50, objc_opt_class(), sel_resolveConfirmationValueForGetSetting_withCompletion_, sel_resolveConfirmationValueForGetSetting_completion_, 0);
  v82[1] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetSettingIntent"), CFSTR("GetSettingIntentResponse"), v1, v2, CFSTR("sirikit.intent.settings.GetSettingIntent"), 0, sel_handleGetSetting_completion_, sel_confirmGetSetting_completion_, v68);
  v83[0] = v67;
  v3 = [INIntentDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v66 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("settingMetadata"), 2, CFSTR("settingMetadata"), CFSTR("settingMetadata"), 0, 0, 230, 1, &unk_1E23F8B68, &unk_1E23F8B80, objc_opt_class(), sel_resolveSettingMetadataForOpenSetting_withCompletion_, sel_resolveSettingMetadataForOpenSetting_completion_, 0);
  v81[0] = v66;
  v65 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("searchQuery"), 3, CFSTR("searchQuery"), CFSTR("searchQuery"), 0, 0, 12, 1, &unk_1E23F8B98, &unk_1E23F8BB0, objc_opt_class(), sel_resolveSearchQueryForOpenSetting_withCompletion_, sel_resolveSearchQueryForOpenSetting_completion_, 0);
  v81[1] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("OpenSettingIntent"), CFSTR("OpenSettingIntentResponse"), v4, v5, CFSTR("sirikit.intent.settings.OpenSettingIntent"), 0, sel_handleOpenSetting_completion_, sel_confirmOpenSetting_completion_, v63);
  v83[1] = v62;
  v6 = [INIntentDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v61 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("settingMetadata"), 2, CFSTR("settingMetadata"), CFSTR("settingMetadata"), 0, 0, 230, 1, &unk_1E23F8BC8, &unk_1E23F8BE0, objc_opt_class(), sel_resolveSettingMetadataForSetBinarySetting_withCompletion_, sel_resolveSettingMetadataForSetBinarySetting_completion_, 0);
  v80[0] = v61;
  v60 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("binaryValue"), 3, CFSTR("binaryValue"), CFSTR("binaryValue"), 0, 0, 234, 1, &unk_1E23F8BF8, &unk_1E23F8C10, objc_opt_class(), sel_resolveBinaryValueForSetBinarySetting_withCompletion_, sel_resolveBinaryValueForSetBinarySetting_completion_, 0);
  v80[1] = v60;
  v59 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("temporalEventTrigger"), 4, CFSTR("temporalEventTrigger"), CFSTR("temporalEventTrigger"), 0, 0, 137, 1, &unk_1E23F8C28, &unk_1E23F8C40, objc_opt_class(), sel_resolveTemporalEventTriggerForSetBinarySetting_withCompletion_, sel_resolveTemporalEventTriggerForSetBinarySetting_completion_, 0);
  v80[2] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v6, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetBinarySettingIntent"), CFSTR("SetBinarySettingIntentResponse"), v7, v8, CFSTR("sirikit.intent.settings.SetBinarySettingIntent"), 0, sel_handleSetBinarySetting_completion_, sel_confirmSetBinarySetting_completion_, v57);
  v83[2] = v56;
  v9 = [INIntentDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v55 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("settingMetadata"), 2, CFSTR("settingMetadata"), CFSTR("settingMetadata"), 0, 0, 230, 1, &unk_1E23F8C58, &unk_1E23F8C70, objc_opt_class(), sel_resolveSettingMetadataForSetLabeledSetting_withCompletion_, sel_resolveSettingMetadataForSetLabeledSetting_completion_, 0);
  v79[0] = v55;
  v54 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("labeledValue"), 3, CFSTR("labeledValue"), CFSTR("labeledValue"), 0, 0, 7, 1, &unk_1E23F8C88, &unk_1E23F8CA0, objc_opt_class(), sel_resolveLabeledValueForSetLabeledSetting_withCompletion_, sel_resolveLabeledValueForSetLabeledSetting_completion_, 0);
  v79[1] = v54;
  v12 = CFSTR("temporalEventTrigger");
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("temporalEventTrigger"), 4, CFSTR("temporalEventTrigger"), CFSTR("temporalEventTrigger"), 0, 0, 137, 1, &unk_1E23F8CB8, &unk_1E23F8CD0, objc_opt_class(), sel_resolveTemporalEventTriggerForSetLabeledSetting_withCompletion_, sel_resolveTemporalEventTriggerForSetLabeledSetting_completion_, 0);
  v79[2] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v9, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetLabeledSettingIntent"), CFSTR("SetLabeledSettingIntentResponse"), v10, v11, CFSTR("sirikit.intent.settings.SetLabeledSettingIntent"), 0, sel_handleSetLabeledSetting_completion_, sel_confirmSetLabeledSetting_completion_, v51);
  v83[3] = v50;
  v42 = [INIntentDescription alloc];
  v40 = objc_opt_class();
  v38 = objc_opt_class();
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 230, 1, &unk_1E23F8CE8, &unk_1E23F8D00, objc_opt_class(), sel_resolveSettingMetadataForSetNumericSetting_withCompletion_, sel_resolveSettingMetadataForSetNumericSetting_completion_, 0);
  v78[0] = v49;
  v48 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("numericValue"), 3, CFSTR("numericValue"), CFSTR("numericValue"), 0, 0, 233, 1, &unk_1E23F8D18, &unk_1E23F8D30, objc_opt_class(), sel_resolveNumericValueForSetNumericSetting_withCompletion_, sel_resolveNumericValueForSetNumericSetting_completion_, 0);
  v78[1] = v48;
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("boundedValue"), 4, CFSTR("boundedValue"), CFSTR("boundedValue"), 0, 0, 235, 1, &unk_1E23F8D48, &unk_1E23F8D60, objc_opt_class(), sel_resolveBoundedValueForSetNumericSetting_withCompletion_, sel_resolveBoundedValueForSetNumericSetting_completion_, 0);
  v78[2] = v47;
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("action"), 5, CFSTR("action"), CFSTR("action"), 0, 0, 236, 1, &unk_1E23F8D78, &unk_1E23F8D90, objc_opt_class(), sel_resolveActionForSetNumericSetting_withCompletion_, sel_resolveActionForSetNumericSetting_completion_, 0);
  v78[3] = v46;
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", v12, 6, v12, v12, 0, 0, 137, 1, &unk_1E23F8DA8, &unk_1E23F8DC0, objc_opt_class(), sel_resolveTemporalEventTriggerForSetNumericSetting_withCompletion_, sel_resolveTemporalEventTriggerForSetNumericSetting_completion_, 0);
  v78[4] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v42, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetNumericSettingIntent"), CFSTR("SetNumericSettingIntentResponse"), v40, v38, CFSTR("sirikit.intent.settings.SetNumericSettingIntent"), 0, sel_handleSetNumericSetting_completion_, sel_confirmSetNumericSetting_completion_, v13);
  v83[4] = v14;
  v43 = [INIntentDescription alloc];
  v41 = objc_opt_class();
  v39 = objc_opt_class();
  v15 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("settingMetadata"), 2, CFSTR("settingMetadata"), CFSTR("settingMetadata"), 0, 0, 230, 1, &unk_1E23F8DD8, &unk_1E23F8DF0, objc_opt_class(), sel_resolveSettingMetadataForSetTemporalSetting_withCompletion_, sel_resolveSettingMetadataForSetTemporalSetting_completion_, 0);
  v77[0] = v15;
  v16 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("timeValue"), 3, CFSTR("timeValue"), CFSTR("timeValue"), 0, 0, 16, 1, &unk_1E23F8E08, &unk_1E23F8E20, objc_opt_class(), sel_resolveTimeValueForSetTemporalSetting_withCompletion_, sel_resolveTimeValueForSetTemporalSetting_completion_, 0);
  v77[1] = v16;
  v17 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", v12, 4, v12, v12, 0, 0, 137, 1, &unk_1E23F8E38, &unk_1E23F8E50, objc_opt_class(), sel_resolveTemporalEventTriggerForSetTemporalSetting_withCompletion_, sel_resolveTemporalEventTriggerForSetTemporalSetting_completion_, 0);
  v77[2] = v17;
  v18 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("action"), 5, CFSTR("action"), CFSTR("action"), 0, 0, 236, 1, &unk_1E23F8E68, &unk_1E23F8E80, objc_opt_class(), sel_resolveActionForSetTemporalSetting_withCompletion_, sel_resolveActionForSetTemporalSetting_completion_, 0);
  v77[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v43, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetTemporalSettingIntent"), CFSTR("SetTemporalSettingIntentResponse"), v41, v39, CFSTR("sirikit.intent.settings.SetTemporalSettingIntent"), 0, sel_handleSetTemporalSetting_completion_, sel_confirmSetTemporalSetting_completion_, v20);
  v83[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "count");
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v23);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v23);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v26 = v22;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v73 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v31, v32);

        objc_msgSend(v31, "type");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v31, v33);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v28);
  }

  v34 = objc_msgSend(v24, "copy");
  v35 = (void *)sSettingsDomain_intentDescsByName;
  sSettingsDomain_intentDescsByName = v34;

  v36 = objc_msgSend(v25, "copy");
  v37 = (void *)sSettingsDomain_intentDescsByType;
  sSettingsDomain_intentDescsByType = v36;

}

@end
