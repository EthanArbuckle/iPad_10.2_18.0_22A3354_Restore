@implementation INWorkoutsDomainLoadIntentDescriptionIfNeeded

void ___INWorkoutsDomainLoadIntentDescriptionIfNeeded_block_invoke()
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
  INIntentSlotDescription *v12;
  INIntentSlotDescription *v13;
  INIntentSlotDescription *v14;
  INIntentSlotDescription *v15;
  INIntentSlotDescription *v16;
  INIntentSlotDescription *v17;
  void *v18;
  void *v19;
  INIntentDescription *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  INIntentSlotDescription *v37;
  INIntentSlotDescription *v38;
  INIntentSlotDescription *v39;
  uint64_t v40;
  uint64_t v41;
  INIntentDescription *v42;
  INIntentSlotDescription *v43;
  INIntentDescription *v44;
  void *v45;
  void *v46;
  INIntentSlotDescription *v47;
  INIntentDescription *v48;
  void *v49;
  void *v50;
  INIntentSlotDescription *v51;
  INIntentDescription *v52;
  void *v53;
  void *v54;
  INIntentSlotDescription *v55;
  INIntentDescription *v56;
  void *v57;
  void *v58;
  INIntentSlotDescription *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _QWORD v65[10];
  INIntentSlotDescription *v66;
  INIntentSlotDescription *v67;
  INIntentSlotDescription *v68;
  INIntentSlotDescription *v69;
  _QWORD v70[7];

  v70[5] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v59 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("workoutName"), 2, CFSTR("workoutName"), CFSTR("workoutName"), 0, 0, 12, 1, &unk_1E23F9528, &unk_1E23F9540, objc_opt_class(), sel_resolveWorkoutNameForCancelWorkout_withCompletion_, sel_resolveWorkoutNameForCancelWorkout_completion_, 0);
  v69 = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("CancelWorkoutIntent"), CFSTR("CancelWorkoutIntentResponse"), v1, v2, CFSTR("sirikit.intent.fitness.CancelWorkoutIntent"), 0, sel_handleCancelWorkout_completion_, sel_confirmCancelWorkout_completion_, v57);
  v70[0] = v56;
  v3 = [INIntentDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v55 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("workoutName"), 2, CFSTR("workoutName"), CFSTR("workoutName"), 0, 0, 12, 1, &unk_1E23F9558, &unk_1E23F9570, objc_opt_class(), sel_resolveWorkoutNameForEndWorkout_withCompletion_, sel_resolveWorkoutNameForEndWorkout_completion_, 0);
  v68 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("EndWorkoutIntent"), CFSTR("EndWorkoutIntentResponse"), v4, v5, CFSTR("sirikit.intent.fitness.EndWorkoutIntent"), 0, sel_handleEndWorkout_completion_, sel_confirmEndWorkout_completion_, v53);
  v70[1] = v52;
  v6 = [INIntentDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v51 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("workoutName"), 2, CFSTR("workoutName"), CFSTR("workoutName"), 0, 0, 12, 1, &unk_1E23F9588, &unk_1E23F95A0, objc_opt_class(), sel_resolveWorkoutNameForPauseWorkout_withCompletion_, sel_resolveWorkoutNameForPauseWorkout_completion_, 0);
  v67 = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v6, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("PauseWorkoutIntent"), CFSTR("PauseWorkoutIntentResponse"), v7, v8, CFSTR("sirikit.intent.fitness.PauseWorkoutIntent"), 0, sel_handlePauseWorkout_completion_, sel_confirmPauseWorkout_completion_, v49);
  v70[2] = v48;
  v9 = [INIntentDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("workoutName"), 2, CFSTR("workoutName"), CFSTR("workoutName"), 0, 0, 12, 1, &unk_1E23F95B8, &unk_1E23F95D0, objc_opt_class(), sel_resolveWorkoutNameForResumeWorkout_withCompletion_, sel_resolveWorkoutNameForResumeWorkout_completion_, 0);
  v66 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v9, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ResumeWorkoutIntent"), CFSTR("ResumeWorkoutIntentResponse"), v10, v11, CFSTR("sirikit.intent.fitness.ResumeWorkoutIntent"), 0, sel_handleResumeWorkout_completion_, sel_confirmResumeWorkout_completion_, v45);
  v70[3] = v44;
  v42 = [INIntentDescription alloc];
  v41 = objc_opt_class();
  v40 = objc_opt_class();
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("workoutName"), 2, CFSTR("workoutName"), CFSTR("workoutName"), 0, 0, 12, 1, &unk_1E23F95E8, &unk_1E23F9600, objc_opt_class(), sel_resolveWorkoutNameForStartWorkout_withCompletion_, sel_resolveWorkoutNameForStartWorkout_completion_, 0);
  v65[0] = v43;
  v39 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("goalValue"), 3, CFSTR("goalValue"), CFSTR("goalValue"), 0, 0, 21, 1, &unk_1E23F9618, &unk_1E23F9630, objc_opt_class(), sel_resolveGoalValueForStartWorkout_withCompletion_, sel_resolveGoalValueForStartWorkout_completion_, 0);
  v65[1] = v39;
  v38 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("workoutGoalUnitType"), 4, CFSTR("workoutGoalUnitType"), CFSTR("workoutGoalUnitType"), 0, 0, 115, 1, &unk_1E23F9648, &unk_1E23F9660, objc_opt_class(), sel_resolveWorkoutGoalUnitTypeForStartWorkout_withCompletion_, sel_resolveWorkoutGoalUnitTypeForStartWorkout_completion_, 0);
  v65[2] = v38;
  v37 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("workoutLocationType"), 5, CFSTR("workoutLocationType"), CFSTR("workoutLocationType"), 0, 0, 116, 1, &unk_1E23F9678, &unk_1E23F9690, objc_opt_class(), sel_resolveWorkoutLocationTypeForStartWorkout_withCompletion_, sel_resolveWorkoutLocationTypeForStartWorkout_completion_, 0);
  v65[3] = v37;
  v12 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("isOpenEnded"), 6, CFSTR("isOpenEnded"), CFSTR("isOpenEnded"), 0, 0, 1, 1, &unk_1E23F96A8, &unk_1E23F96C0, objc_opt_class(), sel_resolveIsOpenEndedForStartWorkout_withCompletion_, sel_resolveIsOpenEndedForStartWorkout_completion_, 0);
  v65[4] = v12;
  v13 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("associatedItems"), 7, CFSTR("associatedItems"), CFSTR("associatedItems"), 0, 1, 117, 3, 0, 0, 0, 0);
  v65[5] = v13;
  v14 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("isBuiltInWorkoutType"), 8, CFSTR("isBuiltInWorkoutType"), CFSTR("isBuiltInWorkoutType"), 0, 1, 1, 1, 0, 0, 0, 0);
  v65[6] = v14;
  v15 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("isVoiceOnly"), 9, CFSTR("isVoiceOnly"), CFSTR("isVoiceOnly"), 0, 1, 1, 1, 0, 0, 0, 0);
  v65[7] = v15;
  v16 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sequenceLabel"), 10, CFSTR("sequenceLabel"), CFSTR("sequenceLabel"), 0, 1, 118, 1, 0, 0, 0, 0);
  v65[8] = v16;
  v17 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("customization"), 11, CFSTR("customization"), CFSTR("customization"), 0, 1, 119, 1, 0, 0, 0, 0);
  v65[9] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v42, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("StartWorkoutIntent"), CFSTR("StartWorkoutIntentResponse"), v41, v40, CFSTR("sirikit.intent.fitness.StartWorkoutIntent"), 0, sel_handleStartWorkout_completion_, sel_confirmStartWorkout_completion_, v19);
  v70[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "count");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v22);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v22);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v61 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v30, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v30, v31);

        objc_msgSend(v30, "type");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v30, v32);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v27);
  }

  v33 = objc_msgSend(v23, "copy");
  v34 = (void *)sWorkoutsDomain_intentDescsByName;
  sWorkoutsDomain_intentDescsByName = v33;

  v35 = objc_msgSend(v24, "copy");
  v36 = (void *)sWorkoutsDomain_intentDescsByType;
  sWorkoutsDomain_intentDescsByType = v35;

}

@end
