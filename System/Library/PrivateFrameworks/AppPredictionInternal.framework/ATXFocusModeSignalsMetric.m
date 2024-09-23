@implementation ATXFocusModeSignalsMetric

- (id)metricName
{
  return CFSTR("com.apple.FocusModeWidget");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v84;
  void *v85;
  void *v86;
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
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  _QWORD v163[47];
  _QWORD v164[49];

  v164[47] = *MEMORY[0x1E0C80C00];
  v163[0] = CFSTR("FocusMode");
  -[ATXFocusModeSignalsMetric focusMode](self, "focusMode");
  ATXModeToString();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v121 = (void *)v3;
  v164[0] = v3;
  v163[1] = CFSTR("AppBundleId");
  -[ATXFocusModeSignalsMetric appBundleId](self, "appBundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v138 = v6;
  v139 = v4;
  v120 = (void *)v5;
  v164[1] = v5;
  v163[2] = CFSTR("ActiveConfigurationType");
  -[ATXFocusModeSignalsMetric activeConfigurationType](self, "activeConfigurationType");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v119 = (void *)v7;
  v164[2] = v7;
  v163[3] = CFSTR("wasAppSuggestedDuringModeSetup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeSignalsMetric wasAppSuggestedDuringModeSetup](self, "wasAppSuggestedDuringModeSetup"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v164[3] = v136;
  v163[4] = CFSTR("wasAppSuggestionDuringModeSetupAccepted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeSignalsMetric wasAppSuggestionDuringModeSetupAccepted](self, "wasAppSuggestionDuringModeSetupAccepted"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v164[4] = v135;
  v163[5] = CFSTR("CategoryScore");
  -[ATXFocusModeSignalsMetric categoryScore](self, "categoryScore");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v118 = (void *)v9;
  v164[5] = v9;
  v163[6] = CFSTR("ClassConditionalProbabilityOfModeGivenEntity");
  -[ATXFocusModeSignalsMetric classConditionalProbabilityOfModeGivenEntity](self, "classConditionalProbabilityOfModeGivenEntity");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v117 = (void *)v11;
  v164[6] = v11;
  v163[7] = CFSTR("EntityModeEntityScore");
  -[ATXFocusModeSignalsMetric entityModeEntityScore](self, "entityModeEntityScore");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v116 = (void *)v13;
  v164[7] = v13;
  v163[8] = CFSTR("GlobalPopularityForEntity");
  -[ATXFocusModeSignalsMetric globalPopularityForEntity](self, "globalPopularityForEntity");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v115 = (void *)v15;
  v164[8] = v15;
  v163[9] = CFSTR("ModePopularityForEntity");
  -[ATXFocusModeSignalsMetric modePopularityForEntity](self, "modePopularityForEntity");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v114 = (void *)v17;
  v164[9] = v17;
  v163[10] = CFSTR("RatioOfModePopularityToGlobalPopularityOfEntity");
  -[ATXFocusModeSignalsMetric ratioOfModePopularityToGlobalPopularityOfEntity](self, "ratioOfModePopularityToGlobalPopularityOfEntity");
  v19 = objc_claimAutoreleasedReturnValue();
  v129 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v113 = (void *)v19;
  v164[10] = v19;
  v163[11] = CFSTR("PosteriorProbabilityOfEntityGivenMode");
  -[ATXFocusModeSignalsMetric posteriorProbabilityOfEntityGivenMode](self, "posteriorProbabilityOfEntityGivenMode");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v112 = (void *)v20;
  v164[11] = v20;
  v163[12] = CFSTR("GlobalOccurrencesOfEntity");
  -[ATXFocusModeSignalsMetric globalOccurrencesOfEntity](self, "globalOccurrencesOfEntity");
  v22 = objc_claimAutoreleasedReturnValue();
  v162 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v111 = (void *)v22;
  v164[12] = v22;
  v163[13] = CFSTR("LocalOccurrencesOfEntityInMode");
  -[ATXFocusModeSignalsMetric localOccurrencesOfEntityInMode](self, "localOccurrencesOfEntityInMode");
  v23 = objc_claimAutoreleasedReturnValue();
  v161 = (void *)v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v110 = (void *)v23;
  v164[13] = v23;
  v163[14] = CFSTR("UniqueOccurrencesOfEntityInMode");
  -[ATXFocusModeSignalsMetric uniqueOccurrencesOfEntityInMode](self, "uniqueOccurrencesOfEntityInMode");
  v24 = objc_claimAutoreleasedReturnValue();
  v160 = (void *)v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v109 = (void *)v24;
  v164[14] = v24;
  v163[15] = CFSTR("EntityOccurredGloballyOverTheLastNDays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeSignalsMetric entityOccurredGloballyOverLastNDays](self, "entityOccurredGloballyOverLastNDays"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v164[15] = v127;
  v163[16] = CFSTR("EntityOccurredInModeOverLastNDays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeSignalsMetric entityOccurredInModeOverLastNDays](self, "entityOccurredInModeOverLastNDays"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v164[16] = v126;
  v163[17] = CFSTR("WidgetBundleIdAndKind");
  -[ATXFocusModeSignalsMetric widgetBundleIdAndKind](self, "widgetBundleIdAndKind");
  v25 = objc_claimAutoreleasedReturnValue();
  v159 = (void *)v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v108 = (void *)v25;
  v164[17] = v25;
  v163[18] = CFSTR("WidgetSize");
  -[ATXFocusModeSignalsMetric widgetSize](self, "widgetSize");
  v26 = objc_claimAutoreleasedReturnValue();
  v158 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v107 = (void *)v26;
  v164[18] = v26;
  v163[19] = CFSTR("IntentHash");
  -[ATXFocusModeSignalsMetric intentHash](self, "intentHash");
  v27 = objc_claimAutoreleasedReturnValue();
  v157 = (void *)v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v106 = (void *)v27;
  v164[19] = v27;
  v163[20] = CFSTR("ABGroup");
  -[ATXFocusModeSignalsMetric abGroup](self, "abGroup");
  v28 = objc_claimAutoreleasedReturnValue();
  v156 = (void *)v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v105 = (void *)v28;
  v164[20] = v28;
  v163[21] = CFSTR("GlobalClearanceRateForEntity");
  -[ATXFocusModeSignalsMetric globalClearanceRateForEntity](self, "globalClearanceRateForEntity");
  v29 = objc_claimAutoreleasedReturnValue();
  v155 = (void *)v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v104 = (void *)v29;
  v164[21] = v29;
  v163[22] = CFSTR("LocalClearanceRateForEntity");
  -[ATXFocusModeSignalsMetric localClearanceRateForEntity](self, "localClearanceRateForEntity");
  v30 = objc_claimAutoreleasedReturnValue();
  v154 = (void *)v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v103 = (void *)v30;
  v164[22] = v30;
  v163[23] = CFSTR("NotificationsClearedInMode");
  -[ATXFocusModeSignalsMetric notificationsClearedInMode](self, "notificationsClearedInMode");
  v31 = objc_claimAutoreleasedReturnValue();
  v153 = (void *)v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v102 = (void *)v31;
  v164[23] = v31;
  v163[24] = CFSTR("NotificationsClearedGlobally");
  -[ATXFocusModeSignalsMetric notificationsClearedGlobally](self, "notificationsClearedGlobally");
  v32 = objc_claimAutoreleasedReturnValue();
  v152 = (void *)v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v101 = (void *)v32;
  v164[24] = v32;
  v163[25] = CFSTR("NotificationsMuted");
  -[ATXFocusModeSignalsMetric notificationsMuted](self, "notificationsMuted");
  v33 = objc_claimAutoreleasedReturnValue();
  v151 = (void *)v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)v33;
  v164[25] = v33;
  v163[26] = CFSTR("RatioOfLocalToGlobalNotificationsClearedRateForEntity");
  -[ATXFocusModeSignalsMetric ratioOfLocalToGlobalNotificationsClearedRateForEntity](self, "ratioOfLocalToGlobalNotificationsClearedRateForEntity");
  v34 = objc_claimAutoreleasedReturnValue();
  v150 = (void *)v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)v34;
  v164[26] = v34;
  v163[27] = CFSTR("ClassConditionalOfNotificationsClearedForEntity");
  -[ATXFocusModeSignalsMetric classConditionalOfNotificationsClearedForEntity](self, "classConditionalOfNotificationsClearedForEntity");
  v35 = objc_claimAutoreleasedReturnValue();
  v149 = (void *)v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)v35;
  v164[27] = v35;
  v163[28] = CFSTR("NotificationsReceivedGlobally");
  -[ATXFocusModeSignalsMetric notificationsReceivedGlobally](self, "notificationsReceivedGlobally");
  v36 = objc_claimAutoreleasedReturnValue();
  v148 = (void *)v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)v36;
  v164[28] = v36;
  v163[29] = CFSTR("NotificationsReceivedInMode");
  -[ATXFocusModeSignalsMetric notificationsReceivedInMode](self, "notificationsReceivedInMode");
  v37 = objc_claimAutoreleasedReturnValue();
  v147 = (void *)v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v96 = (void *)v37;
  v164[29] = v37;
  v163[30] = CFSTR("LocalPopularityOfNotificationsReceivedForEntity");
  -[ATXFocusModeSignalsMetric localPopularityOfNotificationsReceivedForEntity](self, "localPopularityOfNotificationsReceivedForEntity");
  v38 = objc_claimAutoreleasedReturnValue();
  v146 = (void *)v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v38;
  v164[30] = v38;
  v163[31] = CFSTR("GlobalPopularityOfNotificationsReceivedForEntity");
  -[ATXFocusModeSignalsMetric globalPopularityOfNotificationsReceivedForEntity](self, "globalPopularityOfNotificationsReceivedForEntity");
  v39 = objc_claimAutoreleasedReturnValue();
  v145 = (void *)v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v39;
  v164[31] = v39;
  v163[32] = CFSTR("RatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  -[ATXFocusModeSignalsMetric ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity](self, "ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity");
  v40 = objc_claimAutoreleasedReturnValue();
  v144 = (void *)v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v93 = (void *)v40;
  v164[32] = v40;
  v163[33] = CFSTR("ClassConditionalOfNotificationsReceivedForEntity");
  -[ATXFocusModeSignalsMetric classConditionalOfNotificationsReceivedForEntity](self, "classConditionalOfNotificationsReceivedForEntity");
  v41 = objc_claimAutoreleasedReturnValue();
  v143 = (void *)v41;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v92 = (void *)v41;
  v164[33] = v41;
  v163[34] = CFSTR("IsAppCandidateSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeSignalsMetric isAppCandidateSuggestion](self, "isAppCandidateSuggestion"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v164[34] = v125;
  v163[35] = CFSTR("IsAppRecommendedSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFocusModeSignalsMetric isAppRecommendedSuggestion](self, "isAppRecommendedSuggestion"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v164[35] = v124;
  v163[36] = CFSTR("TreatmentId");
  -[ATXFocusModeSignalsMetric treatmentId](self, "treatmentId");
  v42 = objc_claimAutoreleasedReturnValue();
  v142 = (void *)v42;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v91 = (void *)v42;
  v164[36] = v42;
  v163[37] = CFSTR("ExperimentId");
  -[ATXFocusModeSignalsMetric experimentId](self, "experimentId");
  v43 = objc_claimAutoreleasedReturnValue();
  v141 = (void *)v43;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v90 = (void *)v43;
  v164[37] = v43;
  v163[38] = CFSTR("DeploymentId");
  -[ATXFocusModeSignalsMetric deploymentId](self, "deploymentId");
  v44 = objc_claimAutoreleasedReturnValue();
  v140 = (void *)v44;
  if (!v44)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v128 = v21;
  v89 = (void *)v44;
  v164[38] = v44;
  v163[39] = CFSTR("GlobalModeAffinityPrior");
  -[ATXFocusModeSignalsMetric globalModeAffinityPrior](self, "globalModeAffinityPrior");
  v45 = objc_claimAutoreleasedReturnValue();
  v123 = (void *)v45;
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v134 = v10;
  v88 = (void *)v45;
  v164[39] = v45;
  v163[40] = CFSTR("GlobalInterruptingPrior");
  -[ATXFocusModeSignalsMetric globalInterruptingPrior](self, "globalInterruptingPrior");
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v46;
  if (!v46)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v137 = v8;
  v87 = (void *)v46;
  v164[40] = v46;
  v163[41] = CFSTR("ModeAppInterruptionsCountByEntity");
  -[ATXFocusModeSignalsMetric modeAppInterruptionsCountByEntity](self, "modeAppInterruptionsCountByEntity");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v86 = (void *)v48;
  v164[41] = v48;
  v163[42] = CFSTR("ModeAppInterruptionsClassConditionalProbabilityByEntity");
  -[ATXFocusModeSignalsMetric modeAppInterruptionsClassConditionalProbabilityByEntity](self, "modeAppInterruptionsClassConditionalProbabilityByEntity");
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v130 = v18;
  v133 = v12;
  v85 = (void *)v50;
  v164[42] = v50;
  v163[43] = CFSTR("GlobalAppInterruptionsCountByEntity");
  -[ATXFocusModeSignalsMetric globalAppInterruptionsCountByEntity](self, "globalAppInterruptionsCountByEntity");
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v131 = v16;
  v132 = v14;
  v84 = (void *)v52;
  v164[43] = v52;
  v163[44] = CFSTR("GlobalPopularityOfInterruptingEntity");
  -[ATXFocusModeSignalsMetric globalPopularityOfInterruptingEntity](self, "globalPopularityOfInterruptingEntity");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v164[44] = v55;
  v163[45] = CFSTR("ModePopularityOfInterruptingEntity");
  -[ATXFocusModeSignalsMetric modePopularityOfInterruptingEntity](self, "modePopularityOfInterruptingEntity");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v164[45] = v57;
  v163[46] = CFSTR("RatioOfModePopularityToGlobalPopularityOfInterruptingEntity");
  -[ATXFocusModeSignalsMetric ratioOfModePopularityToGlobalPopularityOfInterruptingEntity](self, "ratioOfModePopularityToGlobalPopularityOfInterruptingEntity");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v58)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v164[46] = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 47);
  v122 = (id)objc_claimAutoreleasedReturnValue();
  if (!v58)

  if (!v56)
  if (!v54)

  if (!v53)
  if (!v51)

  if (!v49)
  if (!v47)

  if (!v123)
  v60 = v140;
  if (!v140)
  {

    v60 = 0;
  }

  v61 = v141;
  if (!v141)
  {

    v61 = 0;
  }

  v62 = v142;
  if (!v142)
  {

    v62 = 0;
  }

  v63 = v143;
  if (!v143)
  {

    v63 = 0;
  }

  v64 = v144;
  if (!v144)
  {

    v64 = 0;
  }

  v65 = v145;
  if (!v145)
  {

    v65 = 0;
  }

  v66 = v146;
  if (!v146)
  {

    v66 = 0;
  }

  v67 = v147;
  if (!v147)
  {

    v67 = 0;
  }

  v68 = v148;
  if (!v148)
  {

    v68 = 0;
  }

  v69 = v149;
  if (!v149)
  {

    v69 = 0;
  }

  v70 = v150;
  if (!v150)
  {

    v70 = 0;
  }

  v71 = v151;
  if (!v151)
  {

    v71 = 0;
  }

  v72 = v152;
  if (!v152)
  {

    v72 = 0;
  }

  v73 = v153;
  if (!v153)
  {

    v73 = 0;
  }

  v74 = v154;
  if (!v154)
  {

    v74 = 0;
  }

  v75 = v155;
  if (!v155)
  {

    v75 = 0;
  }

  v76 = v156;
  if (!v156)
  {

    v76 = 0;
  }

  v77 = v157;
  if (!v157)
  {

    v77 = 0;
  }

  v78 = v158;
  if (!v158)
  {

    v78 = 0;
  }

  v79 = v159;
  if (!v159)
  {

    v79 = 0;
  }

  v80 = v160;
  if (!v160)
  {

    v80 = 0;
  }

  v81 = v161;
  if (!v161)
  {

    v81 = 0;
  }

  v82 = v162;
  if (!v162)
  {

    v82 = 0;
  }

  if (!v128)
  if (!v129)

  if (!v130)
  if (!v131)

  if (!v132)
  if (!v133)

  if (!v134)
  if (!v137)

  if (!v138)
  if (!v139)

  return v122;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (unint64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(unint64_t)a3
{
  self->_focusMode = a3;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (NSString)activeConfigurationType
{
  return self->_activeConfigurationType;
}

- (void)setActiveConfigurationType:(id)a3
{
  objc_storeStrong((id *)&self->_activeConfigurationType, a3);
}

- (BOOL)wasAppSuggestedDuringModeSetup
{
  return self->_wasAppSuggestedDuringModeSetup;
}

- (void)setWasAppSuggestedDuringModeSetup:(BOOL)a3
{
  self->_wasAppSuggestedDuringModeSetup = a3;
}

- (BOOL)wasAppSuggestionDuringModeSetupAccepted
{
  return self->_wasAppSuggestionDuringModeSetupAccepted;
}

- (void)setWasAppSuggestionDuringModeSetupAccepted:(BOOL)a3
{
  self->_wasAppSuggestionDuringModeSetupAccepted = a3;
}

- (NSString)widgetBundleIdAndKind
{
  return self->_widgetBundleIdAndKind;
}

- (void)setWidgetBundleIdAndKind:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBundleIdAndKind, a3);
}

- (NSString)widgetSize
{
  return self->_widgetSize;
}

- (void)setWidgetSize:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSize, a3);
}

- (NSString)intentHash
{
  return self->_intentHash;
}

- (void)setIntentHash:(id)a3
{
  objc_storeStrong((id *)&self->_intentHash, a3);
}

- (NSNumber)classConditionalProbabilityOfModeGivenEntity
{
  return self->_classConditionalProbabilityOfModeGivenEntity;
}

- (void)setClassConditionalProbabilityOfModeGivenEntity:(id)a3
{
  objc_storeStrong((id *)&self->_classConditionalProbabilityOfModeGivenEntity, a3);
}

- (NSNumber)entityModeEntityScore
{
  return self->_entityModeEntityScore;
}

- (void)setEntityModeEntityScore:(id)a3
{
  objc_storeStrong((id *)&self->_entityModeEntityScore, a3);
}

- (NSNumber)globalPopularityForEntity
{
  return self->_globalPopularityForEntity;
}

- (void)setGlobalPopularityForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalPopularityForEntity, a3);
}

- (NSNumber)modePopularityForEntity
{
  return self->_modePopularityForEntity;
}

- (void)setModePopularityForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modePopularityForEntity, a3);
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfEntity, a3);
}

- (NSNumber)posteriorProbabilityOfEntityGivenMode
{
  return self->_posteriorProbabilityOfEntityGivenMode;
}

- (void)setPosteriorProbabilityOfEntityGivenMode:(id)a3
{
  objc_storeStrong((id *)&self->_posteriorProbabilityOfEntityGivenMode, a3);
}

- (NSNumber)categoryScore
{
  return self->_categoryScore;
}

- (void)setCategoryScore:(id)a3
{
  objc_storeStrong((id *)&self->_categoryScore, a3);
}

- (NSNumber)globalOccurrencesOfEntity
{
  return self->_globalOccurrencesOfEntity;
}

- (void)setGlobalOccurrencesOfEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalOccurrencesOfEntity, a3);
}

- (NSNumber)localOccurrencesOfEntityInMode
{
  return self->_localOccurrencesOfEntityInMode;
}

- (void)setLocalOccurrencesOfEntityInMode:(id)a3
{
  objc_storeStrong((id *)&self->_localOccurrencesOfEntityInMode, a3);
}

- (NSNumber)uniqueOccurrencesOfEntityInMode
{
  return self->_uniqueOccurrencesOfEntityInMode;
}

- (void)setUniqueOccurrencesOfEntityInMode:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueOccurrencesOfEntityInMode, a3);
}

- (BOOL)entityOccurredGloballyOverLastNDays
{
  return self->_entityOccurredGloballyOverLastNDays;
}

- (void)setEntityOccurredGloballyOverLastNDays:(BOOL)a3
{
  self->_entityOccurredGloballyOverLastNDays = a3;
}

- (BOOL)entityOccurredInModeOverLastNDays
{
  return self->_entityOccurredInModeOverLastNDays;
}

- (void)setEntityOccurredInModeOverLastNDays:(BOOL)a3
{
  self->_entityOccurredInModeOverLastNDays = a3;
}

- (NSNumber)notificationsMuted
{
  return self->_notificationsMuted;
}

- (void)setNotificationsMuted:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsMuted, a3);
}

- (NSNumber)notificationsClearedInMode
{
  return self->_notificationsClearedInMode;
}

- (void)setNotificationsClearedInMode:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsClearedInMode, a3);
}

- (NSNumber)notificationsClearedGlobally
{
  return self->_notificationsClearedGlobally;
}

- (void)setNotificationsClearedGlobally:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsClearedGlobally, a3);
}

- (NSNumber)localClearanceRateForEntity
{
  return self->_localClearanceRateForEntity;
}

- (void)setLocalClearanceRateForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_localClearanceRateForEntity, a3);
}

- (NSNumber)globalClearanceRateForEntity
{
  return self->_globalClearanceRateForEntity;
}

- (void)setGlobalClearanceRateForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalClearanceRateForEntity, a3);
}

- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity
{
  return self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
}

- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity, a3);
}

- (NSNumber)classConditionalOfNotificationsClearedForEntity
{
  return self->_classConditionalOfNotificationsClearedForEntity;
}

- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsClearedForEntity, a3);
}

- (NSNumber)notificationsReceivedGlobally
{
  return self->_notificationsReceivedGlobally;
}

- (void)setNotificationsReceivedGlobally:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsReceivedGlobally, a3);
}

- (NSNumber)notificationsReceivedInMode
{
  return self->_notificationsReceivedInMode;
}

- (void)setNotificationsReceivedInMode:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsReceivedInMode, a3);
}

- (NSNumber)localPopularityOfNotificationsReceivedForEntity
{
  return self->_localPopularityOfNotificationsReceivedForEntity;
}

- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_localPopularityOfNotificationsReceivedForEntity, a3);
}

- (NSNumber)globalPopularityOfNotificationsReceivedForEntity
{
  return self->_globalPopularityOfNotificationsReceivedForEntity;
}

- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalPopularityOfNotificationsReceivedForEntity, a3);
}

- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity
{
  return self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
}

- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity, a3);
}

- (NSNumber)classConditionalOfNotificationsReceivedForEntity
{
  return self->_classConditionalOfNotificationsReceivedForEntity;
}

- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3
{
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsReceivedForEntity, a3);
}

- (BOOL)isAppCandidateSuggestion
{
  return self->_isAppCandidateSuggestion;
}

- (void)setIsAppCandidateSuggestion:(BOOL)a3
{
  self->_isAppCandidateSuggestion = a3;
}

- (BOOL)isAppRecommendedSuggestion
{
  return self->_isAppRecommendedSuggestion;
}

- (void)setIsAppRecommendedSuggestion:(BOOL)a3
{
  self->_isAppRecommendedSuggestion = a3;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSNumber)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentId, a3);
}

- (NSNumber)globalModeAffinityPrior
{
  return self->_globalModeAffinityPrior;
}

- (void)setGlobalModeAffinityPrior:(id)a3
{
  objc_storeStrong((id *)&self->_globalModeAffinityPrior, a3);
}

- (NSNumber)globalInterruptingPrior
{
  return self->_globalInterruptingPrior;
}

- (void)setGlobalInterruptingPrior:(id)a3
{
  objc_storeStrong((id *)&self->_globalInterruptingPrior, a3);
}

- (NSNumber)modeAppInterruptionsCountByEntity
{
  return self->_modeAppInterruptionsCountByEntity;
}

- (void)setModeAppInterruptionsCountByEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountByEntity, a3);
}

- (NSNumber)modeAppInterruptionsClassConditionalProbabilityByEntity
{
  return self->_modeAppInterruptionsClassConditionalProbabilityByEntity;
}

- (void)setModeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity, a3);
}

- (NSNumber)globalAppInterruptionsCountByEntity
{
  return self->_globalAppInterruptionsCountByEntity;
}

- (void)setGlobalAppInterruptionsCountByEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountByEntity, a3);
}

- (NSNumber)globalPopularityOfInterruptingEntity
{
  return self->_globalPopularityOfInterruptingEntity;
}

- (void)setGlobalPopularityOfInterruptingEntity:(id)a3
{
  objc_storeStrong((id *)&self->_globalPopularityOfInterruptingEntity, a3);
}

- (NSNumber)modePopularityOfInterruptingEntity
{
  return self->_modePopularityOfInterruptingEntity;
}

- (void)setModePopularityOfInterruptingEntity:(id)a3
{
  objc_storeStrong((id *)&self->_modePopularityOfInterruptingEntity, a3);
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_modePopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_globalInterruptingPrior, 0);
  objc_storeStrong((id *)&self->_globalModeAffinityPrior, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_localPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInMode, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedGlobally, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_globalClearanceRateForEntity, 0);
  objc_storeStrong((id *)&self->_localClearanceRateForEntity, 0);
  objc_storeStrong((id *)&self->_notificationsClearedGlobally, 0);
  objc_storeStrong((id *)&self->_notificationsClearedInMode, 0);
  objc_storeStrong((id *)&self->_notificationsMuted, 0);
  objc_storeStrong((id *)&self->_uniqueOccurrencesOfEntityInMode, 0);
  objc_storeStrong((id *)&self->_localOccurrencesOfEntityInMode, 0);
  objc_storeStrong((id *)&self->_globalOccurrencesOfEntity, 0);
  objc_storeStrong((id *)&self->_categoryScore, 0);
  objc_storeStrong((id *)&self->_posteriorProbabilityOfEntityGivenMode, 0);
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfEntity, 0);
  objc_storeStrong((id *)&self->_modePopularityForEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityForEntity, 0);
  objc_storeStrong((id *)&self->_entityModeEntityScore, 0);
  objc_storeStrong((id *)&self->_classConditionalProbabilityOfModeGivenEntity, 0);
  objc_storeStrong((id *)&self->_intentHash, 0);
  objc_storeStrong((id *)&self->_widgetSize, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdAndKind, 0);
  objc_storeStrong((id *)&self->_activeConfigurationType, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
