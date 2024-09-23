@implementation INTimersDomainLoadIntentDescriptionIfNeeded

void ___INTimersDomainLoadIntentDescriptionIfNeeded_block_invoke()
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
  uint64_t v16;
  uint64_t v17;
  INIntentDescription *v18;
  uint64_t v19;
  INIntentSlotDescription *v20;
  INIntentSlotDescription *v21;
  INIntentSlotDescription *v22;
  void *v23;
  void *v24;
  INIntentDescription *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  INIntentDescription *v43;
  void *v44;
  void *v45;
  INIntentSlotDescription *v46;
  INIntentSlotDescription *v47;
  INIntentSlotDescription *v48;
  INIntentSlotDescription *v49;
  INIntentDescription *v50;
  void *v51;
  void *v52;
  INIntentSlotDescription *v53;
  INIntentSlotDescription *v54;
  INIntentDescription *v55;
  void *v56;
  void *v57;
  INIntentSlotDescription *v58;
  INIntentSlotDescription *v59;
  INIntentDescription *v60;
  void *v61;
  void *v62;
  INIntentSlotDescription *v63;
  INIntentSlotDescription *v64;
  INIntentDescription *v65;
  void *v66;
  void *v67;
  INIntentSlotDescription *v68;
  INIntentSlotDescription *v69;
  INIntentDescription *v70;
  void *v71;
  void *v72;
  INIntentSlotDescription *v73;
  INIntentSlotDescription *v74;
  INIntentSlotDescription *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _QWORD v81[3];
  _QWORD v82[4];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[3];
  _QWORD v88[9];

  v88[7] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v75 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("label"), 3, CFSTR("label"), CFSTR("label"), 0, 0, 12, 1, &unk_1E23F8E98, &unk_1E23F8EB0, objc_opt_class(), sel_resolveLabelForCreateTimer_withCompletion_, sel_resolveLabelForCreateTimer_completion_, 0);
  v87[0] = v75;
  v74 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("duration"), 2, CFSTR("duration"), CFSTR("duration"), 0, 0, 3, 1, &unk_1E23F8EC8, &unk_1E23F8EE0, objc_opt_class(), sel_resolveDurationForCreateTimer_withCompletion_, sel_resolveDurationForCreateTimer_completion_, 0);
  v87[1] = v74;
  v73 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("type"), 4, CFSTR("type"), CFSTR("type"), 0, 0, 191, 1, &unk_1E23F8EF8, &unk_1E23F8F10, objc_opt_class(), sel_resolveTypeForCreateTimer_withCompletion_, sel_resolveTypeForCreateTimer_completion_, 0);
  v87[2] = v73;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("CreateTimerIntent"), CFSTR("CreateTimerIntentResponse"), v1, v2, CFSTR("sirikit.intent.timer.CreateTimerIntent"), 0, sel_handleCreateTimer_completion_, sel_confirmCreateTimer_completion_, v71);
  v88[0] = v70;
  v3 = [INIntentDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v69 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetTimer"), 3, CFSTR("targetTimer"), CFSTR("targetTimer"), 0, 0, 189, 1, &unk_1E23F8F28, &unk_1E23F8F40, objc_opt_class(), sel_resolveTargetTimerForDeleteTimer_withCompletion_, sel_resolveTargetTimerForDeleteTimer_completion_, 0);
  v86[0] = v69;
  v68 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("deleteMultiple"), 2, CFSTR("deleteMultiple"), CFSTR("deleteMultiple"), 0, 0, 1, 1, &unk_1E23F8F58, &unk_1E23F8F70, objc_opt_class(), sel_resolveDeleteMultipleForDeleteTimer_withCompletion_, sel_resolveDeleteMultipleForDeleteTimer_completion_, 0);
  v86[1] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("DeleteTimerIntent"), CFSTR("DeleteTimerIntentResponse"), v4, v5, CFSTR("sirikit.intent.timer.DeleteTimerIntent"), 0, sel_handleDeleteTimer_completion_, sel_confirmDeleteTimer_completion_, v66);
  v88[1] = v65;
  v6 = [INIntentDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v64 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetTimer"), 3, CFSTR("targetTimer"), CFSTR("targetTimer"), 0, 0, 189, 1, &unk_1E23F8F88, &unk_1E23F8FA0, objc_opt_class(), sel_resolveTargetTimerForPauseTimer_withCompletion_, sel_resolveTargetTimerForPauseTimer_completion_, 0);
  v85[0] = v64;
  v63 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("pauseMultiple"), 2, CFSTR("pauseMultiple"), CFSTR("pauseMultiple"), 0, 0, 1, 1, &unk_1E23F8FB8, &unk_1E23F8FD0, objc_opt_class(), sel_resolvePauseMultipleForPauseTimer_withCompletion_, sel_resolvePauseMultipleForPauseTimer_completion_, 0);
  v85[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v6, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("PauseTimerIntent"), CFSTR("PauseTimerIntentResponse"), v7, v8, CFSTR("sirikit.intent.timer.PauseTimerIntent"), 0, sel_handlePauseTimer_completion_, sel_confirmPauseTimer_completion_, v61);
  v88[2] = v60;
  v9 = [INIntentDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v59 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetTimer"), 3, CFSTR("targetTimer"), CFSTR("targetTimer"), 0, 0, 189, 1, &unk_1E23F8FE8, &unk_1E23F9000, objc_opt_class(), sel_resolveTargetTimerForResetTimer_withCompletion_, sel_resolveTargetTimerForResetTimer_completion_, 0);
  v84[0] = v59;
  v58 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("resetMultiple"), 2, CFSTR("resetMultiple"), CFSTR("resetMultiple"), 0, 0, 1, 1, &unk_1E23F9018, &unk_1E23F9030, objc_opt_class(), sel_resolveResetMultipleForResetTimer_withCompletion_, sel_resolveResetMultipleForResetTimer_completion_, 0);
  v84[1] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v9, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ResetTimerIntent"), CFSTR("ResetTimerIntentResponse"), v10, v11, CFSTR("sirikit.intent.timer.ResetTimerIntent"), 0, sel_handleResetTimer_completion_, sel_confirmResetTimer_completion_, v56);
  v88[3] = v55;
  v12 = [INIntentDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v54 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetTimer"), 3, CFSTR("targetTimer"), CFSTR("targetTimer"), 0, 0, 189, 1, &unk_1E23F9048, &unk_1E23F9060, objc_opt_class(), sel_resolveTargetTimerForResumeTimer_withCompletion_, sel_resolveTargetTimerForResumeTimer_completion_, 0);
  v83[0] = v54;
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("resumeMultiple"), 2, CFSTR("resumeMultiple"), CFSTR("resumeMultiple"), 0, 0, 1, 1, &unk_1E23F9078, &unk_1E23F9090, objc_opt_class(), sel_resolveResumeMultipleForResumeTimer_withCompletion_, sel_resolveResumeMultipleForResumeTimer_completion_, 0);
  v83[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v12, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ResumeTimerIntent"), CFSTR("ResumeTimerIntentResponse"), v13, v14, CFSTR("sirikit.intent.timer.ResumeTimerIntent"), 0, sel_handleResumeTimer_completion_, sel_confirmResumeTimer_completion_, v51);
  v88[4] = v50;
  v15 = [INIntentDescription alloc];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("label"), 2, CFSTR("label"), CFSTR("label"), 0, 0, 12, 1, &unk_1E23F90A8, &unk_1E23F90C0, objc_opt_class(), sel_resolveLabelForSearchForTimers_withCompletion_, sel_resolveLabelForSearchForTimers_completion_, 0);
  v82[0] = v49;
  v48 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("duration"), 3, CFSTR("duration"), CFSTR("duration"), 0, 0, 3, 1, &unk_1E23F90D8, &unk_1E23F90F0, objc_opt_class(), sel_resolveDurationForSearchForTimers_withCompletion_, sel_resolveDurationForSearchForTimers_completion_, 0);
  v82[1] = v48;
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("state"), 4, CFSTR("state"), CFSTR("state"), 0, 0, 190, 1, &unk_1E23F9108, &unk_1E23F9120, objc_opt_class(), sel_resolveStateForSearchForTimers_withCompletion_, sel_resolveStateForSearchForTimers_completion_, 0);
  v82[2] = v47;
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("type"), 5, CFSTR("type"), CFSTR("type"), 0, 0, 191, 1, &unk_1E23F9138, &unk_1E23F9150, objc_opt_class(), sel_resolveTypeForSearchForTimers_withCompletion_, sel_resolveTypeForSearchForTimers_completion_, 0);
  v82[3] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v15, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SearchForTimersIntent"), CFSTR("SearchForTimersIntentResponse"), v16, v17, CFSTR("sirikit.intent.timer.SearchForTimersIntent"), 0, sel_handleSearchForTimers_completion_, sel_confirmSearchForTimers_completion_, v44);
  v88[5] = v18;
  v43 = [INIntentDescription alloc];
  v42 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetTimer"), 2, CFSTR("targetTimer"), CFSTR("targetTimer"), 0, 0, 189, 1, &unk_1E23F9168, &unk_1E23F9180, objc_opt_class(), sel_resolveTargetTimerForSetTimerAttribute_withCompletion_, sel_resolveTargetTimerForSetTimerAttribute_completion_, 0);
  v81[0] = v20;
  v21 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("toDuration"), 3, CFSTR("toDuration"), CFSTR("toDuration"), 0, 0, 3, 1, &unk_1E23F9198, &unk_1E23F91B0, objc_opt_class(), sel_resolveToDurationForSetTimerAttribute_withCompletion_, sel_resolveToDurationForSetTimerAttribute_completion_, 0);
  v81[1] = v21;
  v22 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("toLabel"), 4, CFSTR("toLabel"), CFSTR("toLabel"), 0, 0, 12, 1, &unk_1E23F91C8, &unk_1E23F91E0, objc_opt_class(), sel_resolveToLabelForSetTimerAttribute_withCompletion_, sel_resolveToLabelForSetTimerAttribute_completion_, 0);
  v81[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v43, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetTimerAttributeIntent"), CFSTR("SetTimerAttributeIntentResponse"), v42, v19, CFSTR("sirikit.intent.timer.SetTimerAttributeIntent"), 0, sel_handleSetTimerAttribute_completion_, sel_confirmSetTimerAttribute_completion_, v24);
  v88[6] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "count");
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v27);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v27);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v30 = v26;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v77 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v35, v36);

        objc_msgSend(v35, "type");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v35, v37);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v32);
  }

  v38 = objc_msgSend(v28, "copy");
  v39 = (void *)sTimersDomain_intentDescsByName;
  sTimersDomain_intentDescsByName = v38;

  v40 = objc_msgSend(v29, "copy");
  v41 = (void *)sTimersDomain_intentDescsByType;
  sTimersDomain_intentDescsByType = v40;

}

@end
