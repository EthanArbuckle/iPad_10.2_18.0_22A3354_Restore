@implementation INGeoDomainLoadIntentDescriptionIfNeeded

void ___INGeoDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  INIntentDescription *v4;
  uint64_t v5;
  uint64_t v6;
  INIntentDescription *v7;
  uint64_t v8;
  uint64_t v9;
  INIntentDescription *v10;
  uint64_t v11;
  uint64_t v12;
  INIntentDescription *v13;
  uint64_t v14;
  uint64_t v15;
  INIntentDescription *v16;
  INIntentDescription *v17;
  uint64_t v18;
  uint64_t v19;
  INIntentSlotDescription *v20;
  void *v21;
  void *v22;
  INIntentDescription *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  INIntentSlotDescription *v42;
  INIntentDescription *v43;
  void *v44;
  void *v45;
  INIntentSlotDescription *v46;
  INIntentSlotDescription *v47;
  INIntentDescription *v48;
  void *v49;
  INIntentDescription *v50;
  void *v51;
  void *v52;
  INIntentSlotDescription *v53;
  INIntentSlotDescription *v54;
  INIntentSlotDescription *v55;
  INIntentSlotDescription *v56;
  INIntentSlotDescription *v57;
  INIntentDescription *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  INIntentSlotDescription *v65;
  INIntentSlotDescription *v66;
  _QWORD v67[2];
  _QWORD v68[5];
  _QWORD v69[8];

  v69[6] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("DeleteParkingLocationIntent"), CFSTR("DeleteParkingLocationIntentResponse"), v1, v2, CFSTR("sirikit.intent.geo.DeleteParkingLocationIntent"), 0, sel_handleDeleteParkingLocation_completion_, sel_confirmDeleteParkingLocation_completion_, v59);
  v69[0] = v58;
  v4 = [INIntentDescription alloc];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v57 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("incidentType"), 2, CFSTR("incidentType"), CFSTR("incidentType"), 0, 0, 229, 1, &unk_1E23F7278, &unk_1E23F7290, objc_opt_class(), sel_resolveIncidentTypeForReportIncident_withCompletion_, sel_resolveIncidentTypeForReportIncident_completion_, 0);
  v68[0] = v57;
  v56 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("startTime"), 3, CFSTR("startTime"), CFSTR("startTime"), 0, 0, 3, 1, &unk_1E23F72A8, &unk_1E23F72C0, objc_opt_class(), sel_resolveStartTimeForReportIncident_withCompletion_, sel_resolveStartTimeForReportIncident_completion_, 0);
  v68[1] = v56;
  v55 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("isClear"), 4, CFSTR("isClear"), CFSTR("isClear"), 0, 0, 1, 1, &unk_1E23F72D8, &unk_1E23F72F0, objc_opt_class(), sel_resolveIsClearForReportIncident_withCompletion_, sel_resolveIsClearForReportIncident_completion_, 0);
  v68[2] = v55;
  v54 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("userLocation"), 5, CFSTR("userLocation"), CFSTR("userLocation"), 0, 0, 27, 1, &unk_1E23F7308, &unk_1E23F7320, objc_opt_class(), sel_resolveUserLocationForReportIncident_withCompletion_, sel_resolveUserLocationForReportIncident_completion_, 0);
  v68[3] = v54;
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("additionalDetails"), 6, CFSTR("additionalDetails"), CFSTR("additionalDetails"), 0, 0, 30, 1, &unk_1E23F7338, &unk_1E23F7350, objc_opt_class(), sel_resolveAdditionalDetailsForReportIncident_withCompletion_, sel_resolveAdditionalDetailsForReportIncident_completion_, 0);
  v68[4] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v4, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ReportIncidentIntent"), CFSTR("ReportIncidentIntentResponse"), v5, v6, CFSTR("sirikit.intent.geo.ReportIncidentIntent"), 0, sel_handleReportIncident_completion_, sel_confirmReportIncident_completion_, v51);
  v69[1] = v50;
  v7 = [INIntentDescription alloc];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v7, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("RetrieveParkingLocationIntent"), CFSTR("RetrieveParkingLocationIntentResponse"), v8, v9, CFSTR("sirikit.intent.geo.RetrieveParkingLocationIntent"), 0, sel_handleRetrieveParkingLocation_completion_, sel_confirmRetrieveParkingLocation_completion_, v49);
  v69[2] = v48;
  v10 = [INIntentDescription alloc];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingLocation"), 2, CFSTR("parkingLocation"), CFSTR("parkingLocation"), 0, 0, 27, 1, &unk_1E23F7368, &unk_1E23F7380, objc_opt_class(), sel_resolveParkingLocationForSaveParkingLocation_withCompletion_, sel_resolveParkingLocationForSaveParkingLocation_completion_, 0);
  v67[0] = v47;
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("parkingNote"), 3, CFSTR("parkingNote"), CFSTR("parkingNote"), 0, 0, 30, 1, &unk_1E23F7398, &unk_1E23F73B0, objc_opt_class(), sel_resolveParkingNoteForSaveParkingLocation_withCompletion_, sel_resolveParkingNoteForSaveParkingLocation_completion_, 0);
  v67[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v10, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SaveParkingLocationIntent"), CFSTR("SaveParkingLocationIntentResponse"), v11, v12, CFSTR("sirikit.intent.geo.SaveParkingLocationIntent"), 0, sel_handleSaveParkingLocation_completion_, sel_confirmSaveParkingLocation_completion_, v44);
  v69[3] = v43;
  v13 = [INIntentDescription alloc];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recipient"), 2, CFSTR("recipients"), CFSTR("recipients"), 0, 0, 10, 3, &unk_1E23F73C8, &unk_1E23F73E0, objc_opt_class(), sel_resolveRecipientsForShareETA_withCompletion_, sel_resolveRecipientsForShareETA_completion_, 0);
  v66 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v13, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ShareETAIntent"), CFSTR("ShareETAIntentResponse"), v14, v15, CFSTR("sirikit.intent.geo.ShareETAIntent"), 0, sel_handleShareETA_completion_, sel_confirmShareETA_completion_, v40);
  v69[4] = v16;
  v17 = [INIntentDescription alloc];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recipient"), 2, CFSTR("recipients"), CFSTR("recipients"), 0, 0, 10, 3, &unk_1E23F73F8, &unk_1E23F7410, objc_opt_class(), sel_resolveRecipientsForStopShareETA_withCompletion_, sel_resolveRecipientsForStopShareETA_completion_, 0);
  v65 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v17, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("StopShareETAIntent"), CFSTR("StopShareETAIntentResponse"), v18, v19, CFSTR("sirikit.intent.geo.StopShareETAIntent"), 0, sel_handleStopShareETA_completion_, sel_confirmStopShareETA_completion_, v22);
  v69[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "count");
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v25);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v25);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v28 = v24;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v61 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v33, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v33, v34);

        objc_msgSend(v33, "type");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v33, v35);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v30);
  }

  v36 = objc_msgSend(v26, "copy");
  v37 = (void *)sGeoDomain_intentDescsByName;
  sGeoDomain_intentDescsByName = v36;

  v38 = objc_msgSend(v27, "copy");
  v39 = (void *)sGeoDomain_intentDescsByType;
  sGeoDomain_intentDescsByType = v38;

}

@end
