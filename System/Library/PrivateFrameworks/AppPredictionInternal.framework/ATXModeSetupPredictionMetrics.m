@implementation ATXModeSetupPredictionMetrics

- (id)metricName
{
  return CFSTR("com.apple.FocusModeSetupPredictionV2");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  _QWORD v129[49];
  _QWORD v130[51];

  v130[49] = *MEMORY[0x1E0C80C00];
  v129[0] = CFSTR("ModeName");
  -[ATXModeSetupPredictionMetrics modeName](self, "modeName");
  v3 = objc_claimAutoreleasedReturnValue();
  v128 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v130[0] = v3;
  v129[1] = CFSTR("ModeIsCreated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics modeIsCreated](self, "modeIsCreated", v3));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v130[1] = v127;
  v129[2] = CFSTR("ModeWasCreatedWithin7Days");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics modeWasCreatedWithin7Days](self, "modeWasCreatedWithin7Days"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v130[2] = v126;
  v129[3] = CFSTR("ModeWasCreatedToday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics modeWasCreatedToday](self, "modeWasCreatedToday"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v130[3] = v125;
  v129[4] = CFSTR("ModeHasActivatedWithin7Days");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasActivatedWithin7Days](self, "modeHasActivatedWithin7Days"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v130[4] = v124;
  v129[5] = CFSTR("ModeHasActivatedToday");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasActivatedToday](self, "modeHasActivatedToday"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v130[5] = v123;
  v129[6] = CFSTR("WasOfferedDigestOnboardingSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics wasOfferedDigestOnboardingSuggestion](self, "wasOfferedDigestOnboardingSuggestion"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v130[6] = v122;
  v129[7] = CFSTR("HasSetupDigestThroughOnboardingSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics hasSetupDigestThroughOnboardingSuggestion](self, "hasSetupDigestThroughOnboardingSuggestion"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v130[7] = v121;
  v129[8] = CFSTR("IsDigestCurrentlyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics isDigestCurrentlyEnabled](self, "isDigestCurrentlyEnabled"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v130[8] = v120;
  v129[9] = CFSTR("ModeHasLinkedPoster");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasLinkedPoster](self, "modeHasLinkedPoster"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v130[9] = v119;
  v129[10] = CFSTR("ModeHasSmartActivationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasSmartActivationEnabled](self, "modeHasSmartActivationEnabled"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v130[10] = v118;
  v129[11] = CFSTR("GlobalAllPagesFolderCountBucket");
  -[ATXModeSetupPredictionMetrics globalAllPagesFolderCountBucket](self, "globalAllPagesFolderCountBucket");
  v4 = objc_claimAutoreleasedReturnValue();
  v117 = (void *)v4;
  if (v4)
    v5 = (void *)v4;
  else
    v5 = &unk_1E83CC850;
  v130[11] = v5;
  v129[12] = CFSTR("GlobalAllPagesWidgetCountBucket");
  -[ATXModeSetupPredictionMetrics globalAllPagesWidgetCountBucket](self, "globalAllPagesWidgetCountBucket");
  v6 = objc_claimAutoreleasedReturnValue();
  v116 = (void *)v6;
  if (v6)
    v7 = (void *)v6;
  else
    v7 = &unk_1E83CC850;
  v130[12] = v7;
  v129[13] = CFSTR("HomePageFolderCountBucket");
  -[ATXModeSetupPredictionMetrics homePageFolderCountBucket](self, "homePageFolderCountBucket");
  v8 = objc_claimAutoreleasedReturnValue();
  v115 = (void *)v8;
  if (v8)
    v9 = (void *)v8;
  else
    v9 = &unk_1E83CC850;
  v130[13] = v9;
  v129[14] = CFSTR("HomePageWidgetCountBucket");
  -[ATXModeSetupPredictionMetrics homePageWidgetCountBucket](self, "homePageWidgetCountBucket");
  v10 = objc_claimAutoreleasedReturnValue();
  v114 = (void *)v10;
  if (v10)
    v11 = (void *)v10;
  else
    v11 = &unk_1E83CC850;
  v130[14] = v11;
  v129[15] = CFSTR("GlobalAppLaunchCount7Days");
  -[ATXModeSetupPredictionMetrics globalAppLaunchCount7Days](self, "globalAppLaunchCount7Days");
  v12 = objc_claimAutoreleasedReturnValue();
  v113 = (void *)v12;
  if (v12)
    v13 = (void *)v12;
  else
    v13 = &unk_1E83CC850;
  v130[15] = v13;
  v129[16] = CFSTR("GlobalAppLaunchCountToday");
  -[ATXModeSetupPredictionMetrics globalAppLaunchCountToday](self, "globalAppLaunchCountToday");
  v14 = objc_claimAutoreleasedReturnValue();
  v112 = (void *)v14;
  if (v14)
    v15 = (void *)v14;
  else
    v15 = &unk_1E83CC850;
  v130[16] = v15;
  v129[17] = CFSTR("ModeAppLaunchCountBasedOnGlobalPriors7Days");
  -[ATXModeSetupPredictionMetrics modeAppLaunchCountBasedOnGlobalPriors7Days](self, "modeAppLaunchCountBasedOnGlobalPriors7Days");
  v16 = objc_claimAutoreleasedReturnValue();
  v111 = (void *)v16;
  if (v16)
    v17 = (void *)v16;
  else
    v17 = &unk_1E83CC850;
  v130[17] = v17;
  v129[18] = CFSTR("ModeAppLaunchCountBasedOnGlobalPriorsToday");
  -[ATXModeSetupPredictionMetrics modeAppLaunchCountBasedOnGlobalPriorsToday](self, "modeAppLaunchCountBasedOnGlobalPriorsToday");
  v18 = objc_claimAutoreleasedReturnValue();
  v110 = (void *)v18;
  if (v18)
    v19 = (void *)v18;
  else
    v19 = &unk_1E83CC850;
  v130[18] = v19;
  v129[19] = CFSTR("ModeInferredDuration7Days");
  -[ATXModeSetupPredictionMetrics modeInferredDuration7Days](self, "modeInferredDuration7Days");
  v20 = objc_claimAutoreleasedReturnValue();
  v109 = (void *)v20;
  if (v20)
    v21 = (void *)v20;
  else
    v21 = &unk_1E83CC850;
  v130[19] = v21;
  v129[20] = CFSTR("ModeInferredDurationToday");
  -[ATXModeSetupPredictionMetrics modeInferredDurationToday](self, "modeInferredDurationToday");
  v22 = objc_claimAutoreleasedReturnValue();
  v108 = (void *)v22;
  if (v22)
    v23 = (void *)v22;
  else
    v23 = &unk_1E83CC850;
  v130[20] = v23;
  v129[21] = CFSTR("ModeInferredCount7Days");
  -[ATXModeSetupPredictionMetrics modeInferredCount7Days](self, "modeInferredCount7Days");
  v24 = objc_claimAutoreleasedReturnValue();
  v107 = (void *)v24;
  if (v24)
    v25 = (void *)v24;
  else
    v25 = &unk_1E83CC850;
  v130[21] = v25;
  v129[22] = CFSTR("ModeInferredCountToday");
  -[ATXModeSetupPredictionMetrics modeInferredCountToday](self, "modeInferredCountToday");
  v26 = objc_claimAutoreleasedReturnValue();
  v106 = (void *)v26;
  if (v26)
    v27 = (void *)v26;
  else
    v27 = &unk_1E83CC850;
  v130[22] = v27;
  v129[23] = CFSTR("ModeTurnedOnCount7Days");
  -[ATXModeSetupPredictionMetrics modeTurnedOnCount7Days](self, "modeTurnedOnCount7Days");
  v28 = objc_claimAutoreleasedReturnValue();
  v105 = (void *)v28;
  if (v28)
    v29 = (void *)v28;
  else
    v29 = &unk_1E83CC850;
  v130[23] = v29;
  v129[24] = CFSTR("ModeTurnedOnCountToday");
  -[ATXModeSetupPredictionMetrics modeTurnedOnCountToday](self, "modeTurnedOnCountToday");
  v30 = objc_claimAutoreleasedReturnValue();
  v104 = (void *)v30;
  if (v30)
    v31 = (void *)v30;
  else
    v31 = &unk_1E83CC850;
  v130[24] = v31;
  v129[25] = CFSTR("ModeTurnedOnDuration7Days");
  -[ATXModeSetupPredictionMetrics modeTurnedOnDuration7Days](self, "modeTurnedOnDuration7Days");
  v32 = objc_claimAutoreleasedReturnValue();
  v103 = (void *)v32;
  if (v32)
    v33 = (void *)v32;
  else
    v33 = &unk_1E83CC850;
  v130[25] = v33;
  v129[26] = CFSTR("ModeTurnedOnDurationToday");
  -[ATXModeSetupPredictionMetrics modeTurnedOnDurationToday](self, "modeTurnedOnDurationToday");
  v34 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)v34;
  if (v34)
    v35 = (void *)v34;
  else
    v35 = &unk_1E83CC850;
  v130[26] = v35;
  v129[27] = CFSTR("ModeNotificationsClearedCount7Days");
  -[ATXModeSetupPredictionMetrics modeNotificationsClearedCount7Days](self, "modeNotificationsClearedCount7Days");
  v36 = objc_claimAutoreleasedReturnValue();
  v101 = (void *)v36;
  if (v36)
    v37 = (void *)v36;
  else
    v37 = &unk_1E83CC850;
  v130[27] = v37;
  v129[28] = CFSTR("ModeNotificationsClearedCountToday");
  -[ATXModeSetupPredictionMetrics modeNotificationsClearedCountToday](self, "modeNotificationsClearedCountToday");
  v38 = objc_claimAutoreleasedReturnValue();
  v100 = (void *)v38;
  if (v38)
    v39 = (void *)v38;
  else
    v39 = &unk_1E83CC850;
  v130[28] = v39;
  v129[29] = CFSTR("GlobalNotificationsClearedCount7Days");
  -[ATXModeSetupPredictionMetrics globalNotificationsClearedCount7Days](self, "globalNotificationsClearedCount7Days");
  v40 = objc_claimAutoreleasedReturnValue();
  v99 = (void *)v40;
  if (v40)
    v41 = (void *)v40;
  else
    v41 = &unk_1E83CC850;
  v130[29] = v41;
  v129[30] = CFSTR("GlobalNotificationsClearedCountToday");
  -[ATXModeSetupPredictionMetrics globalNotificationsClearedCountToday](self, "globalNotificationsClearedCountToday");
  v42 = objc_claimAutoreleasedReturnValue();
  v98 = (void *)v42;
  if (v42)
    v43 = (void *)v42;
  else
    v43 = &unk_1E83CC850;
  v130[30] = v43;
  v129[31] = CFSTR("ModeNotificationsCount7Days");
  -[ATXModeSetupPredictionMetrics modeNotificationsCount7Days](self, "modeNotificationsCount7Days");
  v44 = objc_claimAutoreleasedReturnValue();
  v97 = (void *)v44;
  if (v44)
    v45 = (void *)v44;
  else
    v45 = &unk_1E83CC850;
  v130[31] = v45;
  v129[32] = CFSTR("ModeNotificationsCountToday");
  -[ATXModeSetupPredictionMetrics modeNotificationsCountToday](self, "modeNotificationsCountToday");
  v46 = objc_claimAutoreleasedReturnValue();
  v96 = (void *)v46;
  if (v46)
    v47 = (void *)v46;
  else
    v47 = &unk_1E83CC850;
  v130[32] = v47;
  v129[33] = CFSTR("GlobalNotificationsCount7Days");
  -[ATXModeSetupPredictionMetrics globalNotificationsCount7Days](self, "globalNotificationsCount7Days");
  v48 = objc_claimAutoreleasedReturnValue();
  v95 = (void *)v48;
  if (v48)
    v49 = (void *)v48;
  else
    v49 = &unk_1E83CC850;
  v130[33] = v49;
  v129[34] = CFSTR("GlobalNotificationsCountToday");
  -[ATXModeSetupPredictionMetrics globalNotificationsCountToday](self, "globalNotificationsCountToday");
  v50 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)v50;
  if (v50)
    v51 = (void *)v50;
  else
    v51 = &unk_1E83CC850;
  v130[34] = v51;
  v129[35] = CFSTR("ModeWeightedAppLaunchCountBasedOnGlobalPriors7Days");
  -[ATXModeSetupPredictionMetrics modeWeightedAppLaunchCountBasedOnGlobalPriors7Days](self, "modeWeightedAppLaunchCountBasedOnGlobalPriors7Days");
  v52 = objc_claimAutoreleasedReturnValue();
  v93 = (void *)v52;
  if (v52)
    v53 = (void *)v52;
  else
    v53 = &unk_1E83CC850;
  v130[35] = v53;
  v129[36] = CFSTR("ModeWeightedAppLaunchCountBasedOnGlobalPriorsToday");
  -[ATXModeSetupPredictionMetrics modeWeightedAppLaunchCountBasedOnGlobalPriorsToday](self, "modeWeightedAppLaunchCountBasedOnGlobalPriorsToday");
  v54 = objc_claimAutoreleasedReturnValue();
  v92 = (void *)v54;
  if (v54)
    v55 = (void *)v54;
  else
    v55 = &unk_1E83CC850;
  v130[36] = v55;
  v129[37] = CFSTR("GlobalPosterConfigurationsCount");
  -[ATXModeSetupPredictionMetrics globalPosterConfigurationsCount](self, "globalPosterConfigurationsCount");
  v56 = objc_claimAutoreleasedReturnValue();
  v91 = (void *)v56;
  if (v56)
    v57 = (void *)v56;
  else
    v57 = &unk_1E83CC850;
  v130[37] = v57;
  v129[38] = CFSTR("GlobalAppInterruptionsCount7Days");
  -[ATXModeSetupPredictionMetrics globalAppInterruptionsCount7Days](self, "globalAppInterruptionsCount7Days");
  v58 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v58;
  if (v58)
    v59 = (void *)v58;
  else
    v59 = &unk_1E83CC850;
  v130[38] = v59;
  v129[39] = CFSTR("GlobalAppInterruptionsCountToday");
  -[ATXModeSetupPredictionMetrics globalAppInterruptionsCountToday](self, "globalAppInterruptionsCountToday");
  v60 = objc_claimAutoreleasedReturnValue();
  v89 = (void *)v60;
  if (v60)
    v61 = (void *)v60;
  else
    v61 = &unk_1E83CC850;
  v130[39] = v61;
  v129[40] = CFSTR("ModeAppInterruptionsCountInModeInferred7Days");
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountInModeInferred7Days](self, "modeAppInterruptionsCountInModeInferred7Days");
  v62 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)v62;
  if (v62)
    v63 = (void *)v62;
  else
    v63 = &unk_1E83CC850;
  v130[40] = v63;
  v129[41] = CFSTR("ModeAppInterruptionsCountInModeInferredToday");
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountInModeInferredToday](self, "modeAppInterruptionsCountInModeInferredToday");
  v64 = objc_claimAutoreleasedReturnValue();
  v87 = (void *)v64;
  if (v64)
    v65 = (void *)v64;
  else
    v65 = &unk_1E83CC850;
  v130[41] = v65;
  v129[42] = CFSTR("ModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days");
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days](self, "modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days");
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v66;
  if (v66)
    v68 = (void *)v66;
  else
    v68 = &unk_1E83CC850;
  v130[42] = v68;
  v129[43] = CFSTR("ModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday");
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday](self, "modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday");
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = (void *)v69;
  if (v69)
    v71 = (void *)v69;
  else
    v71 = &unk_1E83CC850;
  v130[43] = v71;
  v129[44] = CFSTR("ModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days");
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days](self, "modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days");
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v72;
  if (v72)
    v74 = (void *)v72;
  else
    v74 = &unk_1E83CC850;
  v130[44] = v74;
  v129[45] = CFSTR("ModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday");
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday](self, "modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday");
  v75 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v75;
  if (v75)
    v77 = (void *)v75;
  else
    v77 = &unk_1E83CC850;
  v130[45] = v77;
  v129[46] = CFSTR("TrialTreatmentId");
  -[ATXModeSetupPredictionMetrics trialTreatmentId](self, "trialTreatmentId");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v130[46] = v79;
  v129[47] = CFSTR("TrialExperimentId");
  -[ATXModeSetupPredictionMetrics trialExperimentId](self, "trialExperimentId");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v130[47] = v81;
  v129[48] = CFSTR("TrialDeploymentId");
  -[ATXModeSetupPredictionMetrics trialDeploymentId](self, "trialDeploymentId");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v130[48] = v83;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 49);
  v86 = (id)objc_claimAutoreleasedReturnValue();
  if (!v82)

  if (!v80)
  if (!v78)

  if (!v128)
  return v86;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v40 = (id)MEMORY[0x1E0CB3940];
  -[ATXModeSetupPredictionMetrics modeName](self, "modeName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXModeSetupPredictionMetrics modeIsCreated](self, "modeIsCreated"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v39 = v3;
  if (-[ATXModeSetupPredictionMetrics modeWasCreatedWithin7Days](self, "modeWasCreatedWithin7Days"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v38 = v4;
  if (-[ATXModeSetupPredictionMetrics modeWasCreatedToday](self, "modeWasCreatedToday"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v37 = v5;
  if (-[ATXModeSetupPredictionMetrics modeHasActivatedWithin7Days](self, "modeHasActivatedWithin7Days"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v36 = v6;
  if (-[ATXModeSetupPredictionMetrics modeHasActivatedToday](self, "modeHasActivatedToday"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v35 = v7;
  if (-[ATXModeSetupPredictionMetrics wasOfferedDigestOnboardingSuggestion](self, "wasOfferedDigestOnboardingSuggestion"))
  {
    v8 = CFSTR("YES");
  }
  else
  {
    v8 = CFSTR("NO");
  }
  v34 = v8;
  if (-[ATXModeSetupPredictionMetrics hasSetupDigestThroughOnboardingSuggestion](self, "hasSetupDigestThroughOnboardingSuggestion"))
  {
    v9 = CFSTR("YES");
  }
  else
  {
    v9 = CFSTR("NO");
  }
  v33 = v9;
  if (-[ATXModeSetupPredictionMetrics isDigestCurrentlyEnabled](self, "isDigestCurrentlyEnabled"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v32 = v10;
  if (-[ATXModeSetupPredictionMetrics modeHasLinkedPoster](self, "modeHasLinkedPoster"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v31 = v11;
  if (-[ATXModeSetupPredictionMetrics modeHasSmartActivationEnabled](self, "modeHasSmartActivationEnabled"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v30 = v12;
  -[ATXModeSetupPredictionMetrics globalAllPagesFolderCountBucket](self, "globalAllPagesFolderCountBucket");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalAllPagesWidgetCountBucket](self, "globalAllPagesWidgetCountBucket");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics homePageFolderCountBucket](self, "homePageFolderCountBucket");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics homePageWidgetCountBucket](self, "homePageWidgetCountBucket");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalAppLaunchCount7Days](self, "globalAppLaunchCount7Days");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalAppLaunchCountToday](self, "globalAppLaunchCountToday");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppLaunchCountBasedOnGlobalPriors7Days](self, "modeAppLaunchCountBasedOnGlobalPriors7Days");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppLaunchCountBasedOnGlobalPriorsToday](self, "modeAppLaunchCountBasedOnGlobalPriorsToday");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeInferredDuration7Days](self, "modeInferredDuration7Days");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeInferredDurationToday](self, "modeInferredDurationToday");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeInferredCount7Days](self, "modeInferredCount7Days");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeInferredCountToday](self, "modeInferredCountToday");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeTurnedOnCount7Days](self, "modeTurnedOnCount7Days");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeTurnedOnCountToday](self, "modeTurnedOnCountToday");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeTurnedOnDuration7Days](self, "modeTurnedOnDuration7Days");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeTurnedOnDurationToday](self, "modeTurnedOnDurationToday");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeNotificationsClearedCount7Days](self, "modeNotificationsClearedCount7Days");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeNotificationsClearedCountToday](self, "modeNotificationsClearedCountToday");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalNotificationsClearedCount7Days](self, "globalNotificationsClearedCount7Days");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalNotificationsClearedCountToday](self, "globalNotificationsClearedCountToday");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeNotificationsCount7Days](self, "modeNotificationsCount7Days");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeNotificationsCountToday](self, "modeNotificationsCountToday");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalNotificationsCount7Days](self, "globalNotificationsCount7Days");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalNotificationsCountToday](self, "globalNotificationsCountToday");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeWeightedAppLaunchCountBasedOnGlobalPriors7Days](self, "modeWeightedAppLaunchCountBasedOnGlobalPriors7Days");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeWeightedAppLaunchCountBasedOnGlobalPriorsToday](self, "modeWeightedAppLaunchCountBasedOnGlobalPriorsToday");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalPosterConfigurationsCount](self, "globalPosterConfigurationsCount");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalAppInterruptionsCount7Days](self, "globalAppInterruptionsCount7Days");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics globalAppInterruptionsCountToday](self, "globalAppInterruptionsCountToday");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountInModeInferred7Days](self, "modeAppInterruptionsCountInModeInferred7Days");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountInModeInferredToday](self, "modeAppInterruptionsCountInModeInferredToday");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days](self, "modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday](self, "modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days](self, "modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday](self, "modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics trialTreatmentId](self, "trialTreatmentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics trialExperimentId](self, "trialExperimentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeSetupPredictionMetrics trialDeploymentId](self, "trialDeploymentId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("ATXModeSetupPredictionMetrics\nModeName:%@ \nModeIsCreated:%@ \nModeWasCreatedWithin7Days:%@ \nModeWasCreatedToday:%@ \nModeHasActivatedWithin7Days:%@ \nModeHasActivatedToday:%@ \nWasOfferedDigestOnboardingSuggestion:%@ \nHasSetupDigestThroughOnboardingSuggestion:%@ \nIsDigestCurrentlyEnabled:%@ \nModeHasLinkedPoster:%@ \nModeHasSmartActivationEnabled:%@ \nGlobalAllPagesFolderCountBucket:%@ \nGlobalAllPagesWidgetCountBucket:%@ \nHomePageFolderCountBucket:%@ \nHomePageWidgetCountBucket:%@ \nGlobalAppLaunchCount7Days:%@ \nGlobalAppLaunchCountToday:%@ \nModeAppLaunchCountBasedOnGlobalPriors7Days:%@ \nModeAppLaunchCountBasedOnGlobalPriorsToday:%@ \nModeInferredDuration7Days:%@ \nModeInferredDurationToday:%@ \nModeInferredCount7Days:%@ \nModeInferredCountToday:%@ \nModeTurnedOnCount7Days:%@ \nModeTurnedOnCountToday:%@ \nModeTurnedOnDuration7Days:%@ \nModeTurnedOnDurationToday:%@ \nModeNotificationsClearedCount7Days:%@ \nModeNotificationsClearedCountToday:%@ \nGlobalNotificationsClearedCount7Days:%@ \nGlobalNotificationsClearedCountToday:%@ \nModeNotificationsCount7Days:%@ \nModeNotificationsCountToday:%@ \nGlobalNotificationsCount7Days:%@ \nGlobalNotificationsCountToday:%@ \nModeWeightedAppLaunchCountBasedOnGlobalPriors7Days:%@ \nModeWeightedAppLaunchCountBasedOnGlobalPriorsToday:%@ \nGlobalPosterConfigurationsCount:%@ \nGlobalAppInterruptionsCount7Days:%@ \nGlobalAppInterruptionsCountToday:%@ \nModeAppInterruptionsCountInModeInferred7Days:%@ \nModeAppInterruptionsCountInModeInferredToday:%@ \nModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days:%@ \nModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday:%@ \nModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days:%@ \nModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday:%@ \nTrialTreatmentId:%@ \nTrialExperimentId:%@ \nTrialDeploymentId:%@ \n"), v64, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v63, v61, v62, v59, v60,
    v57,
    v58,
    v55,
    v56,
    v53,
    v54,
    v52,
    v51,
    v50,
    v48,
    v49,
    v47,
    v29,
    v46,
    v28,
    v45,
    v27,
    v44,
    v26,
    v43,
    v25,
    v42,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18,
    v17,
    v13,
    v14,
    v15);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (NSString)modeName
{
  return self->_modeName;
}

- (void)setModeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)modeIsCreated
{
  return self->_modeIsCreated;
}

- (void)setModeIsCreated:(BOOL)a3
{
  self->_modeIsCreated = a3;
}

- (BOOL)modeWasCreatedWithin7Days
{
  return self->_modeWasCreatedWithin7Days;
}

- (void)setModeWasCreatedWithin7Days:(BOOL)a3
{
  self->_modeWasCreatedWithin7Days = a3;
}

- (BOOL)modeWasCreatedToday
{
  return self->_modeWasCreatedToday;
}

- (void)setModeWasCreatedToday:(BOOL)a3
{
  self->_modeWasCreatedToday = a3;
}

- (BOOL)modeHasActivatedWithin7Days
{
  return self->_modeHasActivatedWithin7Days;
}

- (void)setModeHasActivatedWithin7Days:(BOOL)a3
{
  self->_modeHasActivatedWithin7Days = a3;
}

- (BOOL)modeHasActivatedToday
{
  return self->_modeHasActivatedToday;
}

- (void)setModeHasActivatedToday:(BOOL)a3
{
  self->_modeHasActivatedToday = a3;
}

- (BOOL)wasOfferedDigestOnboardingSuggestion
{
  return self->_wasOfferedDigestOnboardingSuggestion;
}

- (void)setWasOfferedDigestOnboardingSuggestion:(BOOL)a3
{
  self->_wasOfferedDigestOnboardingSuggestion = a3;
}

- (BOOL)hasSetupDigestThroughOnboardingSuggestion
{
  return self->_hasSetupDigestThroughOnboardingSuggestion;
}

- (void)setHasSetupDigestThroughOnboardingSuggestion:(BOOL)a3
{
  self->_hasSetupDigestThroughOnboardingSuggestion = a3;
}

- (BOOL)isDigestCurrentlyEnabled
{
  return self->_isDigestCurrentlyEnabled;
}

- (void)setIsDigestCurrentlyEnabled:(BOOL)a3
{
  self->_isDigestCurrentlyEnabled = a3;
}

- (BOOL)modeHasLinkedPoster
{
  return self->_modeHasLinkedPoster;
}

- (void)setModeHasLinkedPoster:(BOOL)a3
{
  self->_modeHasLinkedPoster = a3;
}

- (BOOL)modeHasSmartActivationEnabled
{
  return self->_modeHasSmartActivationEnabled;
}

- (void)setModeHasSmartActivationEnabled:(BOOL)a3
{
  self->_modeHasSmartActivationEnabled = a3;
}

- (NSNumber)globalAllPagesFolderCountBucket
{
  return self->_globalAllPagesFolderCountBucket;
}

- (void)setGlobalAllPagesFolderCountBucket:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)globalAllPagesWidgetCountBucket
{
  return self->_globalAllPagesWidgetCountBucket;
}

- (void)setGlobalAllPagesWidgetCountBucket:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)homePageFolderCountBucket
{
  return self->_homePageFolderCountBucket;
}

- (void)setHomePageFolderCountBucket:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)homePageWidgetCountBucket
{
  return self->_homePageWidgetCountBucket;
}

- (void)setHomePageWidgetCountBucket:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)globalAppLaunchCount7Days
{
  return self->_globalAppLaunchCount7Days;
}

- (void)setGlobalAppLaunchCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)globalAppLaunchCountToday
{
  return self->_globalAppLaunchCountToday;
}

- (void)setGlobalAppLaunchCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriors7Days
{
  return self->_modeAppLaunchCountBasedOnGlobalPriors7Days;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriors7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsToday
{
  return self->_modeAppLaunchCountBasedOnGlobalPriorsToday;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriorsToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)modeInferredDuration7Days
{
  return self->_modeInferredDuration7Days;
}

- (void)setModeInferredDuration7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)modeInferredDurationToday
{
  return self->_modeInferredDurationToday;
}

- (void)setModeInferredDurationToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)modeInferredCount7Days
{
  return self->_modeInferredCount7Days;
}

- (void)setModeInferredCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)modeInferredCountToday
{
  return self->_modeInferredCountToday;
}

- (void)setModeInferredCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)modeTurnedOnCount7Days
{
  return self->_modeTurnedOnCount7Days;
}

- (void)setModeTurnedOnCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)modeTurnedOnCountToday
{
  return self->_modeTurnedOnCountToday;
}

- (void)setModeTurnedOnCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)modeTurnedOnDuration7Days
{
  return self->_modeTurnedOnDuration7Days;
}

- (void)setModeTurnedOnDuration7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)modeTurnedOnDurationToday
{
  return self->_modeTurnedOnDurationToday;
}

- (void)setModeTurnedOnDurationToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)modeNotificationsClearedCount7Days
{
  return self->_modeNotificationsClearedCount7Days;
}

- (void)setModeNotificationsClearedCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)modeNotificationsClearedCountToday
{
  return self->_modeNotificationsClearedCountToday;
}

- (void)setModeNotificationsClearedCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)globalNotificationsClearedCount7Days
{
  return self->_globalNotificationsClearedCount7Days;
}

- (void)setGlobalNotificationsClearedCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)globalNotificationsClearedCountToday
{
  return self->_globalNotificationsClearedCountToday;
}

- (void)setGlobalNotificationsClearedCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)modeNotificationsCount7Days
{
  return self->_modeNotificationsCount7Days;
}

- (void)setModeNotificationsCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)modeNotificationsCountToday
{
  return self->_modeNotificationsCountToday;
}

- (void)setModeNotificationsCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)globalNotificationsCount7Days
{
  return self->_globalNotificationsCount7Days;
}

- (void)setGlobalNotificationsCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)globalNotificationsCountToday
{
  return self->_globalNotificationsCountToday;
}

- (void)setGlobalNotificationsCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)modeWeightedAppLaunchCountBasedOnGlobalPriors7Days
{
  return self->_modeWeightedAppLaunchCountBasedOnGlobalPriors7Days;
}

- (void)setModeWeightedAppLaunchCountBasedOnGlobalPriors7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)modeWeightedAppLaunchCountBasedOnGlobalPriorsToday
{
  return self->_modeWeightedAppLaunchCountBasedOnGlobalPriorsToday;
}

- (void)setModeWeightedAppLaunchCountBasedOnGlobalPriorsToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)globalPosterConfigurationsCount
{
  return self->_globalPosterConfigurationsCount;
}

- (void)setGlobalPosterConfigurationsCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)globalAppInterruptionsCount7Days
{
  return self->_globalAppInterruptionsCount7Days;
}

- (void)setGlobalAppInterruptionsCount7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)globalAppInterruptionsCountToday
{
  return self->_globalAppInterruptionsCountToday;
}

- (void)setGlobalAppInterruptionsCountToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)modeAppInterruptionsCountInModeInferred7Days
{
  return self->_modeAppInterruptionsCountInModeInferred7Days;
}

- (void)setModeAppInterruptionsCountInModeInferred7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)modeAppInterruptionsCountInModeInferredToday
{
  return self->_modeAppInterruptionsCountInModeInferredToday;
}

- (void)setModeAppInterruptionsCountInModeInferredToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days
{
  return self->_modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days;
}

- (void)setModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday
{
  return self->_modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday;
}

- (void)setModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days
{
  return self->_modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days;
}

- (void)setModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday
{
  return self->_modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday;
}

- (void)setModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSNumber)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountInModeInferredToday, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountInModeInferred7Days, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountToday, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCount7Days, 0);
  objc_storeStrong((id *)&self->_globalPosterConfigurationsCount, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchCountBasedOnGlobalPriorsToday, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchCountBasedOnGlobalPriors7Days, 0);
  objc_storeStrong((id *)&self->_globalNotificationsCountToday, 0);
  objc_storeStrong((id *)&self->_globalNotificationsCount7Days, 0);
  objc_storeStrong((id *)&self->_modeNotificationsCountToday, 0);
  objc_storeStrong((id *)&self->_modeNotificationsCount7Days, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedCountToday, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedCount7Days, 0);
  objc_storeStrong((id *)&self->_modeNotificationsClearedCountToday, 0);
  objc_storeStrong((id *)&self->_modeNotificationsClearedCount7Days, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnDurationToday, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnDuration7Days, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnCountToday, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnCount7Days, 0);
  objc_storeStrong((id *)&self->_modeInferredCountToday, 0);
  objc_storeStrong((id *)&self->_modeInferredCount7Days, 0);
  objc_storeStrong((id *)&self->_modeInferredDurationToday, 0);
  objc_storeStrong((id *)&self->_modeInferredDuration7Days, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsToday, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriors7Days, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCountToday, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCount7Days, 0);
  objc_storeStrong((id *)&self->_homePageWidgetCountBucket, 0);
  objc_storeStrong((id *)&self->_homePageFolderCountBucket, 0);
  objc_storeStrong((id *)&self->_globalAllPagesWidgetCountBucket, 0);
  objc_storeStrong((id *)&self->_globalAllPagesFolderCountBucket, 0);
  objc_storeStrong((id *)&self->_modeName, 0);
}

@end
