@implementation INGeoDomainLoadIntentResponseDescriptionIfNeeded

void ___INGeoDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
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
  void *v15;
  INIntentResponseDescription *v16;
  INIntentResponseDescription *v17;
  uint64_t v18;
  uint64_t v19;
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
  INIntentSlotDescription *v42;
  INIntentSlotDescription *v43;
  INIntentResponseDescription *v44;
  void *v45;
  void *v46;
  INIntentSlotDescription *v47;
  INIntentSlotDescription *v48;
  INIntentResponseDescription *v49;
  void *v50;
  void *v51;
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
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[3];
  _QWORD v75[2];
  _QWORD v76[8];

  v76[6] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v64 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingLocation"), 1, CFSTR("parkingLocation"), CFSTR("parkingLocation"), 0, 0, 27, 1, 0, 0, 0, 0);
  v75[0] = v64;
  v63 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingNote"), 2, CFSTR("parkingNote"), CFSTR("parkingNote"), 0, 0, 30, 1, 0, 0, 0, 0);
  v75[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("DeleteParkingLocationIntentResponse"), v1, v2, CFSTR("sirikit.intent.geo.DeleteParkingLocationIntentResponse"), 0, v61);
  v76[0] = v60;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v59 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transportType"), 1, CFSTR("transportTypes"), CFSTR("transportTypes"), 0, 0, 228, 3, 0, 0, 0, 0);
  v74[0] = v59;
  v58 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("location"), 2, CFSTR("location"), CFSTR("location"), 0, 0, 27, 1, 0, 0, 0, 0);
  v74[1] = v58;
  v57 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("supportedType"), 3, CFSTR("supportedTypes"), CFSTR("supportedTypes"), 0, 0, 229, 3, 0, 0, 0, 0);
  v74[2] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ReportIncidentIntentResponse"), v4, v5, CFSTR("sirikit.intent.geo.ReportIncidentIntentResponse"), 0, v55);
  v76[1] = v54;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingLocation"), 1, CFSTR("parkingLocation"), CFSTR("parkingLocation"), 0, 0, 27, 1, 0, 0, 0, 0);
  v73[0] = v53;
  v52 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingNote"), 2, CFSTR("parkingNote"), CFSTR("parkingNote"), 0, 0, 30, 1, 0, 0, 0, 0);
  v73[1] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("RetrieveParkingLocationIntentResponse"), v7, v8, CFSTR("sirikit.intent.geo.RetrieveParkingLocationIntentResponse"), 0, v50);
  v76[2] = v49;
  v9 = [INIntentResponseDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v48 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingLocation"), 1, CFSTR("parkingLocation"), CFSTR("parkingLocation"), 0, 0, 27, 1, 0, 0, 0, 0);
  v72[0] = v48;
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingNote"), 2, CFSTR("parkingNote"), CFSTR("parkingNote"), 0, 0, 30, 1, 0, 0, 0, 0);
  v72[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v9, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SaveParkingLocationIntentResponse"), v10, v11, CFSTR("sirikit.intent.geo.SaveParkingLocationIntentResponse"), 0, v45);
  v76[3] = v44;
  v12 = [INIntentResponseDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recipient"), 1, CFSTR("recipients"), CFSTR("recipients"), 0, 0, 10, 3, 0, 0, 0, 0);
  v71[0] = v43;
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("medium"), 2, CFSTR("mediums"), CFSTR("mediums"), 0, 0, 227, 3, 0, 0, 0, 0);
  v71[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v12, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ShareETAIntentResponse"), v13, v14, CFSTR("sirikit.intent.geo.ShareETAIntentResponse"), 0, v15);
  v76[4] = v16;
  v17 = [INIntentResponseDescription alloc];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recipient"), 1, CFSTR("recipients"), CFSTR("recipients"), 0, 0, 10, 3, 0, 0, 0, 0);
  v70[0] = v20;
  v21 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("medium"), 2, CFSTR("mediums"), CFSTR("mediums"), 0, 0, 227, 3, 0, 0, 0, 0);
  v70[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v17, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("StopShareETAIntentResponse"), v18, v19, CFSTR("sirikit.intent.geo.StopShareETAIntentResponse"), 0, v23);
  v76[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "count");
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v26);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v26);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v29 = v25;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v66 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v34, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v34, v35);

        objc_msgSend(v34, "type");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v34, v36);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v31);
  }

  v37 = objc_msgSend(v27, "copy");
  v38 = (void *)sGeoDomain_intentResponseDescsByName;
  sGeoDomain_intentResponseDescsByName = v37;

  v39 = objc_msgSend(v28, "copy");
  v40 = (void *)sGeoDomain_intentResponseDescsByType;
  sGeoDomain_intentResponseDescsByType = v39;

}

@end
