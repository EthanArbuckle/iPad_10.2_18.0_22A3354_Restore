@implementation INCarPlayDomainLoadIntentDescriptionIfNeeded

void ___INCarPlayDomainLoadIntentDescriptionIfNeeded_block_invoke()
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
  uint64_t v20;
  INIntentDescription *v21;
  uint64_t v22;
  uint64_t v23;
  INIntentDescription *v24;
  uint64_t v25;
  uint64_t v26;
  INIntentDescription *v27;
  uint64_t v28;
  uint64_t v29;
  INIntentSlotDescription *v30;
  INIntentSlotDescription *v31;
  INIntentSlotDescription *v32;
  INIntentSlotDescription *v33;
  INIntentSlotDescription *v34;
  INIntentSlotDescription *v35;
  void *v36;
  void *v37;
  INIntentDescription *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  INIntentSlotDescription *v57;
  INIntentDescription *v58;
  INIntentDescription *v59;
  void *v60;
  void *v61;
  INIntentSlotDescription *v62;
  INIntentSlotDescription *v63;
  INIntentSlotDescription *v64;
  INIntentSlotDescription *v65;
  INIntentDescription *v66;
  void *v67;
  void *v68;
  INIntentSlotDescription *v69;
  INIntentSlotDescription *v70;
  INIntentSlotDescription *v71;
  INIntentDescription *v72;
  void *v73;
  void *v74;
  INIntentSlotDescription *v75;
  INIntentSlotDescription *v76;
  INIntentSlotDescription *v77;
  INIntentSlotDescription *v78;
  INIntentSlotDescription *v79;
  INIntentSlotDescription *v80;
  INIntentSlotDescription *v81;
  INIntentSlotDescription *v82;
  INIntentSlotDescription *v83;
  INIntentSlotDescription *v84;
  INIntentSlotDescription *v85;
  INIntentSlotDescription *v86;
  INIntentDescription *v87;
  void *v88;
  void *v89;
  INIntentSlotDescription *v90;
  INIntentSlotDescription *v91;
  INIntentDescription *v92;
  void *v93;
  void *v94;
  INIntentSlotDescription *v95;
  INIntentSlotDescription *v96;
  INIntentDescription *v97;
  void *v98;
  void *v99;
  INIntentSlotDescription *v100;
  INIntentSlotDescription *v101;
  INIntentDescription *v102;
  void *v103;
  INIntentDescription *v104;
  void *v105;
  void *v106;
  INIntentSlotDescription *v107;
  INIntentDescription *v108;
  void *v109;
  void *v110;
  INIntentSlotDescription *v111;
  INIntentDescription *v112;
  void *v113;
  void *v114;
  INIntentSlotDescription *v115;
  INIntentSlotDescription *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _QWORD v122[7];
  _QWORD v123[4];
  _QWORD v124[3];
  _QWORD v125[12];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  INIntentSlotDescription *v129;
  INIntentSlotDescription *v130;
  _QWORD v131[2];
  _QWORD v132[13];

  v132[11] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v116 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("carName"), 2, CFSTR("carName"), CFSTR("carName"), 0, 0, 12, 1, &unk_1E23F6AF8, &unk_1E23F6B10, objc_opt_class(), sel_resolveCarNameForActivateCarSignal_withCompletion_, sel_resolveCarNameForActivateCarSignal_completion_, 0);
  v131[0] = v116;
  v115 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("signals"), 3, CFSTR("signals"), CFSTR("signals"), 0, 0, 143, 3, &unk_1E23F6B28, &unk_1E23F6B40, objc_opt_class(), sel_resolveSignalsForActivateCarSignal_withCompletion_, sel_resolveSignalsForActivateCarSignal_completion_, 0);
  v131[1] = v115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v114);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ActivateCarSignalIntent"), CFSTR("ActivateCarSignalIntentResponse"), v1, v2, CFSTR("sirikit.intent.car_commands.ActivateCarSignalIntent"), 0, sel_handleActivateCarSignal_completion_, sel_confirmActivateCarSignal_completion_, v113);
  v132[0] = v112;
  v3 = [INIntentDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v111 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("carName"), 2, CFSTR("carName"), CFSTR("carName"), 0, 0, 12, 1, &unk_1E23F6B58, &unk_1E23F6B70, objc_opt_class(), sel_resolveCarNameForGetCarLockStatus_withCompletion_, sel_resolveCarNameForGetCarLockStatus_completion_, 0);
  v130 = v111;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v110);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetCarLockStatusIntent"), CFSTR("GetCarLockStatusIntentResponse"), v4, v5, CFSTR("sirikit.intent.car_commands.GetCarLockStatusIntent"), 0, sel_handleGetCarLockStatus_completion_, sel_confirmGetCarLockStatus_completion_, v109);
  v132[1] = v108;
  v6 = [INIntentDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v107 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("carName"), 2, CFSTR("carName"), CFSTR("carName"), 0, 0, 12, 1, &unk_1E23F6B88, &unk_1E23F6BA0, objc_opt_class(), sel_resolveCarNameForGetCarPowerLevelStatus_withCompletion_, sel_resolveCarNameForGetCarPowerLevelStatus_completion_, 0);
  v129 = v107;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v106);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v6, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetCarPowerLevelStatusIntent"), CFSTR("GetCarPowerLevelStatusIntentResponse"), v7, v8, CFSTR("sirikit.intent.car_commands.GetCarPowerLevelStatusIntent"), 0, sel_handleGetCarPowerLevelStatus_completion_, sel_confirmGetCarPowerLevelStatus_completion_, v105);
  v132[2] = v104;
  v9 = [INIntentDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v9, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ListCarsIntent"), CFSTR("ListCarsIntentResponse"), v10, v11, CFSTR("sirikit.intent.car_commands.ListCarsIntent"), 0, sel_handleListCars_completion_, sel_confirmListCars_completion_, v103);
  v132[3] = v102;
  v12 = [INIntentDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v101 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("profileNumber"), 2, CFSTR("profileNumber"), CFSTR("profileNumber"), 0, 0, 24, 1, &unk_1E23F6BB8, &unk_1E23F6BD0, objc_opt_class(), sel_resolveProfileNumberForSaveProfileInCar_withCompletion_, sel_resolveProfileNumberForSaveProfileInCar_completion_, 0);
  v128[0] = v101;
  v100 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("profileName"), 3, CFSTR("profileName"), CFSTR("profileName"), 0, 0, 30, 1, &unk_1E23F6BE8, &unk_1E23F6C00, objc_opt_class(), sel_resolveProfileNameForSaveProfileInCar_withCompletion_, sel_resolveProfileNameForSaveProfileInCar_completion_, 0);
  v128[1] = v100;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v99);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v12, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SaveProfileInCarIntent"), CFSTR("SaveProfileInCarIntentResponse"), v13, v14, CFSTR("sirikit.intent.car_commands.SaveProfileInCarIntent"), 0, sel_handleSaveProfileInCar_completion_, sel_confirmSaveProfileInCar_completion_, v98);
  v132[4] = v97;
  v15 = [INIntentDescription alloc];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v96 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("audioSource"), 2, CFSTR("audioSource"), CFSTR("audioSource"), 0, 0, 121, 1, &unk_1E23F6C18, &unk_1E23F6C30, objc_opt_class(), sel_resolveAudioSourceForSetAudioSourceInCar_withCompletion_, sel_resolveAudioSourceForSetAudioSourceInCar_completion_, 0);
  v127[0] = v96;
  v95 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("relativeAudioSourceReference"), 3, CFSTR("relativeAudioSourceReference"), CFSTR("relativeAudioSourceReference"), 0, 0, 124, 1, &unk_1E23F6C48, &unk_1E23F6C60, objc_opt_class(), sel_resolveRelativeAudioSourceReferenceForSetAudioSourceInCar_withCompletion_, sel_resolveRelativeAudioSourceReferenceForSetAudioSourceInCar_completion_, 0);
  v127[1] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v15, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetAudioSourceInCarIntent"), CFSTR("SetAudioSourceInCarIntentResponse"), v16, v17, CFSTR("sirikit.intent.car_commands.SetAudioSourceInCarIntent"), 0, sel_handleSetAudioSourceInCar_completion_, sel_confirmSetAudioSourceInCar_completion_, v93);
  v132[5] = v92;
  v18 = [INIntentDescription alloc];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v91 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("locked"), 2, CFSTR("locked"), CFSTR("locked"), 0, 0, 1, 1, &unk_1E23F6C78, &unk_1E23F6C90, objc_opt_class(), sel_resolveLockedForSetCarLockStatus_withCompletion_, sel_resolveLockedForSetCarLockStatus_completion_, 0);
  v126[0] = v91;
  v90 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("carName"), 3, CFSTR("carName"), CFSTR("carName"), 0, 0, 12, 1, &unk_1E23F6CA8, &unk_1E23F6CC0, objc_opt_class(), sel_resolveCarNameForSetCarLockStatus_withCompletion_, sel_resolveCarNameForSetCarLockStatus_completion_, 0);
  v126[1] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v18, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetCarLockStatusIntent"), CFSTR("SetCarLockStatusIntentResponse"), v19, v20, CFSTR("sirikit.intent.car_commands.SetCarLockStatusIntent"), 0, sel_handleSetCarLockStatus_completion_, sel_confirmSetCarLockStatus_completion_, v88);
  v132[6] = v87;
  v21 = [INIntentDescription alloc];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v86 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enableFan"), 2, CFSTR("enableFan"), CFSTR("enableFan"), 0, 0, 1, 1, &unk_1E23F6CD8, &unk_1E23F6CF0, objc_opt_class(), sel_resolveEnableFanForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableFanForSetClimateSettingsInCar_completion_, 0);
  v125[0] = v86;
  v85 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enableAirConditioner"), 3, CFSTR("enableAirConditioner"), CFSTR("enableAirConditioner"), 0, 0, 1, 1, &unk_1E23F6D08, &unk_1E23F6D20, objc_opt_class(), sel_resolveEnableAirConditionerForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableAirConditionerForSetClimateSettingsInCar_completion_, 0);
  v125[1] = v85;
  v84 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enableClimateControl"), 4, CFSTR("enableClimateControl"), CFSTR("enableClimateControl"), 0, 0, 1, 1, &unk_1E23F6D38, &unk_1E23F6D50, objc_opt_class(), sel_resolveEnableClimateControlForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableClimateControlForSetClimateSettingsInCar_completion_, 0);
  v125[2] = v84;
  v83 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enableAutoMode"), 5, CFSTR("enableAutoMode"), CFSTR("enableAutoMode"), 0, 0, 1, 1, &unk_1E23F6D68, &unk_1E23F6D80, objc_opt_class(), sel_resolveEnableAutoModeForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableAutoModeForSetClimateSettingsInCar_completion_, 0);
  v125[3] = v83;
  v82 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("airCirculationMode"), 6, CFSTR("airCirculationMode"), CFSTR("airCirculationMode"), 0, 0, 120, 1, &unk_1E23F6D98, &unk_1E23F6DB0, objc_opt_class(), sel_resolveAirCirculationModeForSetClimateSettingsInCar_withCompletion_, sel_resolveAirCirculationModeForSetClimateSettingsInCar_completion_, 0);
  v125[4] = v82;
  v81 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("fanSpeedIndex"), 7, CFSTR("fanSpeedIndex"), CFSTR("fanSpeedIndex"), 0, 0, 24, 1, &unk_1E23F6DC8, &unk_1E23F6DE0, objc_opt_class(), sel_resolveFanSpeedIndexForSetClimateSettingsInCar_withCompletion_, sel_resolveFanSpeedIndexForSetClimateSettingsInCar_completion_, 0);
  v125[5] = v81;
  v80 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("fanSpeedPercentage"), 8, CFSTR("fanSpeedPercentage"), CFSTR("fanSpeedPercentage"), 0, 0, 21, 1, &unk_1E23F6DF8, &unk_1E23F6E10, objc_opt_class(), sel_resolveFanSpeedPercentageForSetClimateSettingsInCar_withCompletion_, sel_resolveFanSpeedPercentageForSetClimateSettingsInCar_completion_, 0);
  v125[6] = v80;
  v79 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("relativeFanSpeedSetting"), 9, CFSTR("relativeFanSpeedSetting"), CFSTR("relativeFanSpeedSetting"), 0, 0, 125, 1, &unk_1E23F6E28, &unk_1E23F6E40, objc_opt_class(), sel_resolveRelativeFanSpeedSettingForSetClimateSettingsInCar_withCompletion_, sel_resolveRelativeFanSpeedSettingForSetClimateSettingsInCar_completion_, 0);
  v125[7] = v79;
  v78 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("temperature"), 11, CFSTR("temperature"), CFSTR("temperature"), 0, 0, 32, 1, &unk_1E23F6E58, &unk_1E23F6E70, objc_opt_class(), sel_resolveTemperatureForSetClimateSettingsInCar_withCompletion_, sel_resolveTemperatureForSetClimateSettingsInCar_completion_, 0);
  v125[8] = v78;
  v77 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("relativeTemperatureSetting"), 12, CFSTR("relativeTemperatureSetting"), CFSTR("relativeTemperatureSetting"), 0, 0, 125, 1, &unk_1E23F6E88, &unk_1E23F6EA0, objc_opt_class(), sel_resolveRelativeTemperatureSettingForSetClimateSettingsInCar_withCompletion_, sel_resolveRelativeTemperatureSettingForSetClimateSettingsInCar_completion_, 0);
  v125[9] = v77;
  v76 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("climateZone"), 13, CFSTR("climateZone"), CFSTR("climateZone"), 0, 0, 123, 1, &unk_1E23F6EB8, &unk_1E23F6ED0, objc_opt_class(), sel_resolveClimateZoneForSetClimateSettingsInCar_withCompletion_, sel_resolveClimateZoneForSetClimateSettingsInCar_completion_, 0);
  v125[10] = v76;
  v75 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("carName"), 14, CFSTR("carName"), CFSTR("carName"), 0, 0, 12, 1, &unk_1E23F6EE8, &unk_1E23F6F00, objc_opt_class(), sel_resolveCarNameForSetClimateSettingsInCar_withCompletion_, sel_resolveCarNameForSetClimateSettingsInCar_completion_, 0);
  v125[11] = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 12);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v21, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetClimateSettingsInCarIntent"), CFSTR("SetClimateSettingsInCarIntentResponse"), v22, v23, CFSTR("sirikit.intent.car_commands.SetClimateSettingsInCarIntent"), 0, sel_handleSetClimateSettingsInCar_completion_, sel_confirmSetClimateSettingsInCar_completion_, v73);
  v132[7] = v72;
  v24 = [INIntentDescription alloc];
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v71 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enable"), 2, CFSTR("enable"), CFSTR("enable"), 0, 0, 1, 1, &unk_1E23F6F18, &unk_1E23F6F30, objc_opt_class(), sel_resolveEnableForSetDefrosterSettingsInCar_withCompletion_, sel_resolveEnableForSetDefrosterSettingsInCar_completion_, 0);
  v124[0] = v71;
  v70 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("defroster"), 3, CFSTR("defroster"), CFSTR("defroster"), 0, 0, 122, 1, &unk_1E23F6F48, &unk_1E23F6F60, objc_opt_class(), sel_resolveDefrosterForSetDefrosterSettingsInCar_withCompletion_, sel_resolveDefrosterForSetDefrosterSettingsInCar_completion_, 0);
  v124[1] = v70;
  v69 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("carName"), 4, CFSTR("carName"), CFSTR("carName"), 0, 0, 12, 1, &unk_1E23F6F78, &unk_1E23F6F90, objc_opt_class(), sel_resolveCarNameForSetDefrosterSettingsInCar_withCompletion_, sel_resolveCarNameForSetDefrosterSettingsInCar_completion_, 0);
  v124[2] = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v24, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetDefrosterSettingsInCarIntent"), CFSTR("SetDefrosterSettingsInCarIntentResponse"), v25, v26, CFSTR("sirikit.intent.car_commands.SetDefrosterSettingsInCarIntent"), 0, sel_handleSetDefrosterSettingsInCar_completion_, sel_confirmSetDefrosterSettingsInCar_completion_, v67);
  v132[8] = v66;
  v27 = [INIntentDescription alloc];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v65 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("profileNumber"), 2, CFSTR("profileNumber"), CFSTR("profileNumber"), 0, 0, 24, 1, &unk_1E23F6FA8, &unk_1E23F6FC0, objc_opt_class(), sel_resolveProfileNumberForSetProfileInCar_withCompletion_, sel_resolveProfileNumberForSetProfileInCar_completion_, 0);
  v123[0] = v65;
  v64 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("profileName"), 3, CFSTR("profileName"), CFSTR("profileName"), 0, 0, 30, 1, &unk_1E23F6FD8, &unk_1E23F6FF0, objc_opt_class(), sel_resolveProfileNameForSetProfileInCar_withCompletion_, sel_resolveProfileNameForSetProfileInCar_completion_, 0);
  v123[1] = v64;
  v63 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("defaultProfile"), 4, CFSTR("defaultProfile"), CFSTR("defaultProfile"), 0, 0, 1, 1, 0, 0, 0, 0);
  v123[2] = v63;
  v62 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 12, 1, &unk_1E23F7008, &unk_1E23F7020, objc_opt_class(), sel_resolveCarNameForSetProfileInCar_withCompletion_, sel_resolveCarNameForSetProfileInCar_completion_, 0);
  v123[3] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v27, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetProfileInCarIntent"), CFSTR("SetProfileInCarIntentResponse"), v28, v29, CFSTR("sirikit.intent.car_commands.SetProfileInCarIntent"), 0, sel_handleSetProfileInCar_completion_, sel_confirmSetProfileInCar_completion_, v60);
  v132[9] = v59;
  v58 = [INIntentDescription alloc];
  v56 = objc_opt_class();
  v55 = objc_opt_class();
  v57 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enableHeating"), 2, CFSTR("enableHeating"), CFSTR("enableHeating"), 0, 0, 1, 1, &unk_1E23F7038, &unk_1E23F7050, objc_opt_class(), sel_resolveEnableHeatingForSetSeatSettingsInCar_withCompletion_, sel_resolveEnableHeatingForSetSeatSettingsInCar_completion_, 0);
  v122[0] = v57;
  v30 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enableCooling"), 3, CFSTR("enableCooling"), CFSTR("enableCooling"), 0, 0, 1, 1, &unk_1E23F7068, &unk_1E23F7080, objc_opt_class(), sel_resolveEnableCoolingForSetSeatSettingsInCar_withCompletion_, sel_resolveEnableCoolingForSetSeatSettingsInCar_completion_, 0);
  v122[1] = v30;
  v31 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("enableMassage"), 4, CFSTR("enableMassage"), CFSTR("enableMassage"), 0, 0, 1, 1, &unk_1E23F7098, &unk_1E23F70B0, objc_opt_class(), sel_resolveEnableMassageForSetSeatSettingsInCar_withCompletion_, sel_resolveEnableMassageForSetSeatSettingsInCar_completion_, 0);
  v122[2] = v31;
  v32 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("seat"), 5, CFSTR("seat"), CFSTR("seat"), 0, 0, 123, 1, &unk_1E23F70C8, &unk_1E23F70E0, objc_opt_class(), sel_resolveSeatForSetSeatSettingsInCar_withCompletion_, sel_resolveSeatForSetSeatSettingsInCar_completion_, 0);
  v122[3] = v32;
  v33 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("level"), 6, CFSTR("level"), CFSTR("level"), 0, 0, 24, 1, &unk_1E23F70F8, &unk_1E23F7110, objc_opt_class(), sel_resolveLevelForSetSeatSettingsInCar_withCompletion_, sel_resolveLevelForSetSeatSettingsInCar_completion_, 0);
  v122[4] = v33;
  v34 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("relativeLevelSetting"), 7, CFSTR("relativeLevelSetting"), CFSTR("relativeLevelSetting"), 0, 0, 125, 1, &unk_1E23F7128, &unk_1E23F7140, objc_opt_class(), sel_resolveRelativeLevelSettingForSetSeatSettingsInCar_withCompletion_, sel_resolveRelativeLevelSettingForSetSeatSettingsInCar_completion_, 0);
  v122[5] = v34;
  v35 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("carName"), 8, CFSTR("carName"), CFSTR("carName"), 0, 0, 12, 1, &unk_1E23F7158, &unk_1E23F7170, objc_opt_class(), sel_resolveCarNameForSetSeatSettingsInCar_withCompletion_, sel_resolveCarNameForSetSeatSettingsInCar_completion_, 0);
  v122[6] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v58, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetSeatSettingsInCarIntent"), CFSTR("SetSeatSettingsInCarIntentResponse"), v56, v55, CFSTR("sirikit.intent.car_commands.SetSeatSettingsInCarIntent"), 0, sel_handleSetSeatSettingsInCar_completion_, sel_confirmSetSeatSettingsInCar_completion_, v37);
  v132[10] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v39, "count");
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v40);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v40);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v43 = v39;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v117, v121, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v118 != v46)
          objc_enumerationMutation(v43);
        v48 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend(v48, "name");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKey:", v48, v49);

        objc_msgSend(v48, "type");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKey:", v48, v50);

      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v117, v121, 16);
    }
    while (v45);
  }

  v51 = objc_msgSend(v41, "copy");
  v52 = (void *)sCarPlayDomain_intentDescsByName;
  sCarPlayDomain_intentDescsByName = v51;

  v53 = objc_msgSend(v42, "copy");
  v54 = (void *)sCarPlayDomain_intentDescsByType;
  sCarPlayDomain_intentDescsByType = v53;

}

@end
