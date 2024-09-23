@implementation INSettingsDomainLoadIntentResponseDescriptionIfNeeded

void ___INSettingsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
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
  INIntentResponseDescription *v16;
  uint64_t v17;
  uint64_t v18;
  INIntentSlotDescription *v19;
  INIntentSlotDescription *v20;
  INIntentSlotDescription *v21;
  void *v22;
  void *v23;
  INIntentResponseDescription *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  INIntentSlotDescription *v43;
  INIntentSlotDescription *v44;
  INIntentSlotDescription *v45;
  INIntentSlotDescription *v46;
  INIntentSlotDescription *v47;
  INIntentResponseDescription *v48;
  void *v49;
  void *v50;
  INIntentSlotDescription *v51;
  INIntentSlotDescription *v52;
  INIntentSlotDescription *v53;
  INIntentResponseDescription *v54;
  void *v55;
  void *v56;
  INIntentSlotDescription *v57;
  INIntentSlotDescription *v58;
  INIntentSlotDescription *v59;
  INIntentResponseDescription *v60;
  void *v61;
  void *v62;
  INIntentSlotDescription *v63;
  INIntentSlotDescription *v64;
  INIntentResponseDescription *v65;
  void *v66;
  void *v67;
  INIntentSlotDescription *v68;
  INIntentSlotDescription *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _QWORD v75[3];
  _QWORD v76[5];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[8];

  v81[6] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v69 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("settingResponseData"), 1, CFSTR("settingResponseDatas"), CFSTR("settingResponseDatas"), 0, 0, 232, 3, 0, 0, 0, 0);
  v80[0] = v69;
  v68 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("errorDetail"), 2, CFSTR("errorDetail"), CFSTR("errorDetail"), 0, 0, 7, 1, 0, 0, 0, 0);
  v80[1] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("GetSettingIntentResponse"), v1, v2, CFSTR("sirikit.intent.settings.GetSettingIntentResponse"), 0, v66);
  v81[0] = v65;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v64 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("punchoutUrl"), 1, CFSTR("punchoutUrl"), CFSTR("punchoutUrl"), 0, 0, 7, 1, 0, 0, 0, 0);
  v79[0] = v64;
  v63 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("errorDetail"), 2, CFSTR("errorDetail"), CFSTR("errorDetail"), 0, 0, 7, 1, 0, 0, 0, 0);
  v79[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("OpenSettingIntentResponse"), v4, v5, CFSTR("sirikit.intent.settings.OpenSettingIntentResponse"), 0, v61);
  v81[1] = v60;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v59 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("oldValue"), 1, CFSTR("oldValue"), CFSTR("oldValue"), 0, 0, 234, 1, 0, 0, 0, 0);
  v78[0] = v59;
  v58 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updatedValue"), 2, CFSTR("updatedValue"), CFSTR("updatedValue"), 0, 0, 234, 1, 0, 0, 0, 0);
  v78[1] = v58;
  v57 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("errorDetail"), 3, CFSTR("errorDetail"), CFSTR("errorDetail"), 0, 0, 7, 1, 0, 0, 0, 0);
  v78[2] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetBinarySettingIntentResponse"), v7, v8, CFSTR("sirikit.intent.settings.SetBinarySettingIntentResponse"), 0, v55);
  v81[2] = v54;
  v9 = [INIntentResponseDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("oldValue"), 1, CFSTR("oldValue"), CFSTR("oldValue"), 0, 0, 7, 1, 0, 0, 0, 0);
  v77[0] = v53;
  v52 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updatedValue"), 2, CFSTR("updatedValue"), CFSTR("updatedValue"), 0, 0, 7, 1, 0, 0, 0, 0);
  v77[1] = v52;
  v51 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("errorDetail"), 3, CFSTR("errorDetail"), CFSTR("errorDetail"), 0, 0, 7, 1, 0, 0, 0, 0);
  v77[2] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v9, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetLabeledSettingIntentResponse"), v10, v11, CFSTR("sirikit.intent.settings.SetLabeledSettingIntentResponse"), 0, v49);
  v81[3] = v48;
  v12 = [INIntentResponseDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("oldValue"), 1, CFSTR("oldValue"), CFSTR("oldValue"), 0, 0, 233, 1, 0, 0, 0, 0);
  v76[0] = v47;
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updatedValue"), 2, CFSTR("updatedValue"), CFSTR("updatedValue"), 0, 0, 233, 1, 0, 0, 0, 0);
  v76[1] = v46;
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("minValue"), 3, CFSTR("minValue"), CFSTR("minValue"), 0, 0, 233, 1, 0, 0, 0, 0);
  v76[2] = v45;
  v44 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("maxValue"), 4, CFSTR("maxValue"), CFSTR("maxValue"), 0, 0, 233, 1, 0, 0, 0, 0);
  v76[3] = v44;
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("errorDetail"), 5, CFSTR("errorDetail"), CFSTR("errorDetail"), 0, 0, 7, 1, 0, 0, 0, 0);
  v76[4] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v12, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetNumericSettingIntentResponse"), v13, v14, CFSTR("sirikit.intent.settings.SetNumericSettingIntentResponse"), 0, v41);
  v81[4] = v15;
  v16 = [INIntentResponseDescription alloc];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("oldValue"), 1, CFSTR("oldValue"), CFSTR("oldValue"), 0, 0, 16, 1, 0, 0, 0, 0);
  v75[0] = v19;
  v20 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updatedValue"), 2, CFSTR("updatedValue"), CFSTR("updatedValue"), 0, 0, 16, 1, 0, 0, 0, 0);
  v75[1] = v20;
  v21 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("errorDetail"), 3, CFSTR("errorDetail"), CFSTR("errorDetail"), 0, 0, 7, 1, 0, 0, 0, 0);
  v75[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v16, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetTemporalSettingIntentResponse"), v17, v18, CFSTR("sirikit.intent.settings.SetTemporalSettingIntentResponse"), 0, v23);
  v81[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "count");
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v26);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v26);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v29 = v25;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v71 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v34, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v34, v35);

        objc_msgSend(v34, "type");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v34, v36);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    }
    while (v31);
  }

  v37 = objc_msgSend(v27, "copy");
  v38 = (void *)sSettingsDomain_intentResponseDescsByName;
  sSettingsDomain_intentResponseDescsByName = v37;

  v39 = objc_msgSend(v28, "copy");
  v40 = (void *)sSettingsDomain_intentResponseDescsByType;
  sSettingsDomain_intentResponseDescsByType = v39;

}

@end
