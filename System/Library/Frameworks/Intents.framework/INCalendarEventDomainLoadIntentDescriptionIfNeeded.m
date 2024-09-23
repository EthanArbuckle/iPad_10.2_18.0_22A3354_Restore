@implementation INCalendarEventDomainLoadIntentDescriptionIfNeeded

void ___INCalendarEventDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  INIntentDescription *v2;
  uint64_t v3;
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
  INIntentDescription *v14;
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
  INIntentSlotDescription *v31;
  uint64_t v32;
  uint64_t v33;
  INIntentDescription *v34;
  uint64_t v35;
  INIntentSlotDescription *v36;
  INIntentDescription *v37;
  INIntentDescription *v38;
  void *v39;
  void *v40;
  INIntentSlotDescription *v41;
  INIntentSlotDescription *v42;
  INIntentSlotDescription *v43;
  INIntentSlotDescription *v44;
  INIntentSlotDescription *v45;
  INIntentDescription *v46;
  void *v47;
  void *v48;
  INIntentSlotDescription *v49;
  INIntentSlotDescription *v50;
  INIntentDescription *v51;
  INIntentDescription *v52;
  void *v53;
  void *v54;
  INIntentSlotDescription *v55;
  INIntentSlotDescription *v56;
  INIntentSlotDescription *v57;
  INIntentSlotDescription *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _QWORD v64[8];
  _QWORD v65[5];
  _QWORD v66[2];
  _QWORD v67[4];
  _QWORD v68[6];

  v68[4] = *MEMORY[0x1E0C80C00];
  v51 = [INIntentDescription alloc];
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v58 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("title"), 2, CFSTR("title"), CFSTR("title"), 0, 0, 7, 1, &unk_1E23F6498, &unk_1E23F64B0, objc_opt_class(), sel_resolveTitleForCreateEvent_withCompletion_, sel_resolveTitleForCreateEvent_completion_, 0);
  v67[0] = v58;
  v57 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("dateTimeRange"), 3, CFSTR("dateTimeRange"), CFSTR("dateTimeRange"), 0, 0, 16, 1, &unk_1E23F64C8, &unk_1E23F64E0, objc_opt_class(), sel_resolveDateTimeRangeForCreateEvent_withCompletion_, sel_resolveDateTimeRangeForCreateEvent_completion_, 0);
  v67[1] = v57;
  v56 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("participants"), 4, CFSTR("participants"), CFSTR("participants"), 0, 0, 10, 3, &unk_1E23F64F8, &unk_1E23F6510, objc_opt_class(), sel_resolveParticipantsForCreateEvent_withCompletion_, sel_resolveParticipantsForCreateEvent_completion_, 0);
  v67[2] = v56;
  v55 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("location"), 5, CFSTR("location"), CFSTR("location"), 0, 0, 27, 1, &unk_1E23F6528, &unk_1E23F6540, objc_opt_class(), sel_resolveLocationForCreateEvent_withCompletion_, sel_resolveLocationForCreateEvent_completion_, 0);
  v67[3] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v51, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("CreateEventIntent"), CFSTR("CreateEventIntentResponse"), v0, v1, CFSTR("sirikit.intent.calendar.CreateEventIntent"), 0, sel_handleCreateEvent_completion_, sel_confirmCreateEvent_completion_, v53);
  v68[0] = v52;
  v2 = [INIntentDescription alloc];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v50 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetEventIdentifier"), 2, CFSTR("targetEventIdentifier"), CFSTR("targetEventIdentifier"), 0, 0, 7, 1, &unk_1E23F6558, &unk_1E23F6570, objc_opt_class(), sel_resolveTargetEventIdentifierForDeleteEvent_withCompletion_, sel_resolveTargetEventIdentifierForDeleteEvent_completion_, 0);
  v66[0] = v50;
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("deleteAllOccurrences"), 3, CFSTR("deleteAllOccurrences"), CFSTR("deleteAllOccurrences"), 0, 0, 1, 1, &unk_1E23F6588, &unk_1E23F65A0, objc_opt_class(), sel_resolveDeleteAllOccurrencesForDeleteEvent_withCompletion_, sel_resolveDeleteAllOccurrencesForDeleteEvent_completion_, 0);
  v66[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v2, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("DeleteEventIntent"), CFSTR("DeleteEventIntentResponse"), v3, v4, CFSTR("sirikit.intent.calendar.DeleteEventIntent"), 0, sel_handleDeleteEvent_completion_, sel_confirmDeleteEvent_completion_, v47);
  v68[1] = v46;
  v37 = [INIntentDescription alloc];
  v35 = objc_opt_class();
  v5 = objc_opt_class();
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("searchQuery"), 2, CFSTR("searchQuery"), CFSTR("searchQuery"), 0, 0, 7, 1, &unk_1E23F65B8, &unk_1E23F65D0, objc_opt_class(), sel_resolveSearchQueryForFindEvents_withCompletion_, sel_resolveSearchQueryForFindEvents_completion_, 0);
  v65[0] = v45;
  v44 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("dateTimeRange"), 3, CFSTR("dateTimeRange"), CFSTR("dateTimeRange"), 0, 0, 16, 1, &unk_1E23F65E8, &unk_1E23F6600, objc_opt_class(), sel_resolveDateTimeRangeForFindEvents_withCompletion_, sel_resolveDateTimeRangeForFindEvents_completion_, 0);
  v65[1] = v44;
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("participants"), 4, CFSTR("participants"), CFSTR("participants"), 0, 0, 10, 3, &unk_1E23F6618, &unk_1E23F6630, objc_opt_class(), sel_resolveParticipantsForFindEvents_withCompletion_, sel_resolveParticipantsForFindEvents_completion_, 0);
  v65[2] = v43;
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("location"), 5, CFSTR("location"), CFSTR("location"), 0, 0, 27, 1, &unk_1E23F6648, &unk_1E23F6660, objc_opt_class(), sel_resolveLocationForFindEvents_withCompletion_, sel_resolveLocationForFindEvents_completion_, 0);
  v65[3] = v42;
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("requestedEventAttribute"), 6, CFSTR("requestedEventAttribute"), CFSTR("requestedEventAttribute"), 0, 0, 241, 1, &unk_1E23F6678, &unk_1E23F6690, objc_opt_class(), sel_resolveRequestedEventAttributeForFindEvents_withCompletion_, sel_resolveRequestedEventAttributeForFindEvents_completion_, 0);
  v65[4] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v37, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("FindEventsIntent"), CFSTR("FindEventsIntentResponse"), v35, v5, CFSTR("sirikit.intent.calendar.FindEventsIntent"), 0, sel_handleFindEvents_completion_, sel_confirmFindEvents_completion_, v39);
  v68[2] = v38;
  v34 = [INIntentDescription alloc];
  v33 = objc_opt_class();
  v32 = objc_opt_class();
  v36 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetEventIdentifier"), 2, CFSTR("targetEventIdentifier"), CFSTR("targetEventIdentifier"), 0, 0, 7, 1, &unk_1E23F66A8, &unk_1E23F66C0, objc_opt_class(), sel_resolveTargetEventIdentifierForUpdateEvent_withCompletion_, sel_resolveTargetEventIdentifierForUpdateEvent_completion_, 0);
  v64[0] = v36;
  v31 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("setTitle"), 3, CFSTR("setTitle"), CFSTR("setTitle"), 0, 0, 7, 1, &unk_1E23F66D8, &unk_1E23F66F0, objc_opt_class(), sel_resolveSetTitleForUpdateEvent_withCompletion_, sel_resolveSetTitleForUpdateEvent_completion_, 0);
  v64[1] = v31;
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("setDateTimeRange"), 4, CFSTR("setDateTimeRange"), CFSTR("setDateTimeRange"), 0, 0, 16, 1, &unk_1E23F6708, &unk_1E23F6720, objc_opt_class(), sel_resolveSetDateTimeRangeForUpdateEvent_withCompletion_, sel_resolveSetDateTimeRangeForUpdateEvent_completion_, 0);
  v64[2] = v6;
  v7 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("setLocation"), 5, CFSTR("setLocation"), CFSTR("setLocation"), 0, 0, 27, 1, &unk_1E23F6738, &unk_1E23F6750, objc_opt_class(), sel_resolveSetLocationForUpdateEvent_withCompletion_, sel_resolveSetLocationForUpdateEvent_completion_, 0);
  v64[3] = v7;
  v8 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("addParticipants"), 6, CFSTR("addParticipants"), CFSTR("addParticipants"), 0, 0, 10, 3, &unk_1E23F6768, &unk_1E23F6780, objc_opt_class(), sel_resolveAddParticipantsForUpdateEvent_withCompletion_, sel_resolveAddParticipantsForUpdateEvent_completion_, 0);
  v64[4] = v8;
  v9 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("removeParticipants"), 7, CFSTR("removeParticipants"), CFSTR("removeParticipants"), 0, 0, 10, 3, &unk_1E23F6798, &unk_1E23F67B0, objc_opt_class(), sel_resolveRemoveParticipantsForUpdateEvent_withCompletion_, sel_resolveRemoveParticipantsForUpdateEvent_completion_, 0);
  v64[5] = v9;
  v10 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("updateAllOccurrences"), 8, CFSTR("updateAllOccurrences"), CFSTR("updateAllOccurrences"), 0, 0, 1, 1, &unk_1E23F67C8, &unk_1E23F67E0, objc_opt_class(), sel_resolveUpdateAllOccurrencesForUpdateEvent_withCompletion_, sel_resolveUpdateAllOccurrencesForUpdateEvent_completion_, 0);
  v64[6] = v10;
  v11 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("removeLocation"), 9, CFSTR("removeLocation"), CFSTR("removeLocation"), 0, 0, 1, 1, &unk_1E23F67F8, &unk_1E23F6810, objc_opt_class(), sel_resolveRemoveLocationForUpdateEvent_withCompletion_, sel_resolveRemoveLocationForUpdateEvent_completion_, 0);
  v64[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v34, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("UpdateEventIntent"), CFSTR("UpdateEventIntentResponse"), v33, v32, CFSTR("sirikit.intent.calendar.UpdateEventIntent"), 0, sel_handleUpdateEvent_completion_, sel_confirmUpdateEvent_completion_, v13);
  v68[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v16);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v16);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v60 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v24, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v24, v25);

        objc_msgSend(v24, "type");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v24, v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v21);
  }

  v27 = objc_msgSend(v17, "copy");
  v28 = (void *)sCalendarEventDomain_intentDescsByName;
  sCalendarEventDomain_intentDescsByName = v27;

  v29 = objc_msgSend(v18, "copy");
  v30 = (void *)sCalendarEventDomain_intentDescsByType;
  sCalendarEventDomain_intentDescsByType = v29;

}

@end
