@implementation INAlarmDomainLoadIntentDescriptionIfNeeded

void ___INAlarmDomainLoadIntentDescriptionIfNeeded_block_invoke()
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
  INIntentDescription *v12;
  uint64_t v13;
  uint64_t v14;
  INIntentDescription *v15;
  INIntentSlotDescription *v16;
  INIntentSlotDescription *v17;
  INIntentSlotDescription *v18;
  INIntentSlotDescription *v19;
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
  uint64_t v40;
  uint64_t v41;
  INIntentDescription *v42;
  void *v43;
  void *v44;
  INIntentSlotDescription *v45;
  INIntentDescription *v46;
  void *v47;
  void *v48;
  INIntentSlotDescription *v49;
  INIntentSlotDescription *v50;
  INIntentSlotDescription *v51;
  INIntentDescription *v52;
  void *v53;
  void *v54;
  INIntentSlotDescription *v55;
  INIntentSlotDescription *v56;
  INIntentDescription *v57;
  void *v58;
  void *v59;
  INIntentSlotDescription *v60;
  INIntentSlotDescription *v61;
  INIntentSlotDescription *v62;
  INIntentSlotDescription *v63;
  INIntentDescription *v64;
  void *v65;
  void *v66;
  INIntentSlotDescription *v67;
  INIntentSlotDescription *v68;
  INIntentSlotDescription *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _QWORD v75[5];
  INIntentSlotDescription *v76;
  _QWORD v77[3];
  _QWORD v78[2];
  _QWORD v79[4];
  _QWORD v80[3];
  _QWORD v81[8];

  v81[6] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v69 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarmSearch"), 1, CFSTR("alarmSearch"), CFSTR("alarmSearch"), 0, 0, 180, 1, 0, 0, 0, 0);
  v80[0] = v69;
  v68 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarms"), 2, CFSTR("alarms"), CFSTR("alarms"), 0, 0, 179, 3, &unk_1E23F6258, &unk_1E23F6270, objc_opt_class(), sel_resolveAlarmsForChangeAlarmStatus_withCompletion_, sel_resolveAlarmsForChangeAlarmStatus_completion_, 0);
  v80[1] = v68;
  v67 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("operation"), 3, CFSTR("operation"), CFSTR("operation"), 0, 0, 184, 1, &unk_1E23F6288, &unk_1E23F62A0, objc_opt_class(), sel_resolveOperationForChangeAlarmStatus_withCompletion_, sel_resolveOperationForChangeAlarmStatus_completion_, 0);
  v80[2] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ChangeAlarmStatusIntent"), CFSTR("ChangeAlarmStatusIntentResponse"), v1, v2, CFSTR("sirikit.intent.alarm.ChangeAlarmStatusIntent"), 0, sel_handleChangeAlarmStatus_completion_, sel_confirmChangeAlarmStatus_completion_, v65);
  v81[0] = v64;
  v3 = [INIntentDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v63 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("relativeOffsetInMinutes"), 1, CFSTR("relativeOffsetInMinutes"), CFSTR("relativeOffsetInMinutes"), 0, 0, 5, 1, 0, 0, 0, 0);
  v79[0] = v63;
  v62 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("time"), 2, CFSTR("time"), CFSTR("time"), 0, 0, 16, 1, &unk_1E23F62B8, &unk_1E23F62D0, objc_opt_class(), sel_resolveTimeForCreateAlarm_withCompletion_, sel_resolveTimeForCreateAlarm_completion_, 0);
  v79[1] = v62;
  v61 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("label"), 3, CFSTR("label"), CFSTR("label"), 0, 0, 12, 1, &unk_1E23F62E8, &unk_1E23F6300, objc_opt_class(), sel_resolveLabelForCreateAlarm_withCompletion_, sel_resolveLabelForCreateAlarm_completion_, 0);
  v79[2] = v61;
  v60 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarmRepeatScheduleOptions"), 4, CFSTR("alarmRepeatScheduleOptions"), CFSTR("alarmRepeatScheduleOptions"), 0, 0, 181, 3, &unk_1E23F6318, &unk_1E23F6330, objc_opt_class(), sel_resolveAlarmRepeatScheduleOptionsForCreateAlarm_withCompletion_, sel_resolveAlarmRepeatScheduleOptionsForCreateAlarm_completion_, 0);
  v79[3] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("CreateAlarmIntent"), CFSTR("CreateAlarmIntentResponse"), v4, v5, CFSTR("sirikit.intent.alarm.CreateAlarmIntent"), 0, sel_handleCreateAlarm_completion_, sel_confirmCreateAlarm_completion_, v58);
  v81[1] = v57;
  v6 = [INIntentDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v56 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarmSearch"), 1, CFSTR("alarmSearch"), CFSTR("alarmSearch"), 0, 0, 180, 1, 0, 0, 0, 0);
  v78[0] = v56;
  v55 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarms"), 2, CFSTR("alarms"), CFSTR("alarms"), 0, 0, 179, 3, &unk_1E23F6348, &unk_1E23F6360, objc_opt_class(), sel_resolveAlarmsForDeleteAlarm_withCompletion_, sel_resolveAlarmsForDeleteAlarm_completion_, 0);
  v78[1] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v6, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("DeleteAlarmIntent"), CFSTR("DeleteAlarmIntentResponse"), v7, v8, CFSTR("sirikit.intent.alarm.DeleteAlarmIntent"), 0, sel_handleDeleteAlarm_completion_, sel_confirmDeleteAlarm_completion_, v53);
  v81[2] = v52;
  v9 = [INIntentDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v51 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarmSearch"), 1, CFSTR("alarmSearch"), CFSTR("alarmSearch"), 0, 0, 180, 1, 0, 0, 0, 0);
  v77[0] = v51;
  v50 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarmSearchType"), 2, CFSTR("alarmSearchType"), CFSTR("alarmSearchType"), 0, 0, 188, 1, 0, 0, 0, 0);
  v77[1] = v50;
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 179, 3, &unk_1E23F6378, &unk_1E23F6390, objc_opt_class(), sel_resolveAlarmsForSearchAlarm_withCompletion_, sel_resolveAlarmsForSearchAlarm_completion_, 0);
  v77[2] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v9, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SearchAlarmIntent"), CFSTR("SearchAlarmIntentResponse"), v10, v11, CFSTR("sirikit.intent.alarm.SearchAlarmIntent"), 0, sel_handleSearchAlarm_completion_, sel_confirmSearchAlarm_completion_, v47);
  v81[3] = v46;
  v12 = [INIntentDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarms"), 1, CFSTR("alarms"), CFSTR("alarms"), 0, 0, 179, 3, &unk_1E23F63A8, &unk_1E23F63C0, objc_opt_class(), sel_resolveAlarmsForSnoozeAlarm_withCompletion_, sel_resolveAlarmsForSnoozeAlarm_completion_, 0);
  v76 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v12, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SnoozeAlarmIntent"), CFSTR("SnoozeAlarmIntentResponse"), v13, v14, CFSTR("sirikit.intent.alarm.SnoozeAlarmIntent"), 0, sel_handleSnoozeAlarm_completion_, sel_confirmSnoozeAlarm_completion_, v43);
  v81[4] = v15;
  v42 = [INIntentDescription alloc];
  v41 = objc_opt_class();
  v40 = objc_opt_class();
  v16 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarmSearch"), 1, CFSTR("alarmSearch"), CFSTR("alarmSearch"), 0, 0, 180, 1, 0, 0, 0, 0);
  v75[0] = v16;
  v17 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("alarm"), 2, CFSTR("alarm"), CFSTR("alarm"), 0, 0, 179, 1, &unk_1E23F63D8, &unk_1E23F63F0, objc_opt_class(), sel_resolveAlarmForUpdateAlarm_withCompletion_, sel_resolveAlarmForUpdateAlarm_completion_, 0);
  v75[1] = v17;
  v18 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("operation"), 3, CFSTR("operation"), CFSTR("operation"), 0, 0, 183, 1, &unk_1E23F6408, &unk_1E23F6420, objc_opt_class(), sel_resolveOperationForUpdateAlarm_withCompletion_, sel_resolveOperationForUpdateAlarm_completion_, 0);
  v75[2] = v18;
  v19 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("proposedTime"), 4, CFSTR("proposedTime"), CFSTR("proposedTime"), 0, 0, 16, 1, &unk_1E23F6438, &unk_1E23F6450, objc_opt_class(), sel_resolveProposedTimeForUpdateAlarm_withCompletion_, sel_resolveProposedTimeForUpdateAlarm_completion_, 0);
  v75[3] = v19;
  v20 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("proposedLabel"), 5, CFSTR("proposedLabel"), CFSTR("proposedLabel"), 0, 0, 12, 1, &unk_1E23F6468, &unk_1E23F6480, objc_opt_class(), sel_resolveProposedLabelForUpdateAlarm_withCompletion_, sel_resolveProposedLabelForUpdateAlarm_completion_, 0);
  v75[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v42, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("UpdateAlarmIntent"), CFSTR("UpdateAlarmIntentResponse"), v41, v40, CFSTR("sirikit.intent.alarm.UpdateAlarmIntent"), 0, sel_handleUpdateAlarm_completion_, sel_confirmUpdateAlarm_completion_, v22);
  v81[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "count");
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v25);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v25);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v28 = v24;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v71 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v33, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v33, v34);

        objc_msgSend(v33, "type");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v33, v35);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    }
    while (v30);
  }

  v36 = objc_msgSend(v26, "copy");
  v37 = (void *)sAlarmDomain_intentDescsByName;
  sAlarmDomain_intentDescsByName = v36;

  v38 = objc_msgSend(v27, "copy");
  v39 = (void *)sAlarmDomain_intentDescsByType;
  sAlarmDomain_intentDescsByType = v38;

}

@end
