@implementation ATXNotificationBreakthroughEventMetric

- (id)metricName
{
  return CFSTR("com.apple.ModeActivity.NotificationBreakthrough.event");
}

- (ATXNotificationBreakthroughEventMetric)initWithQueryResult:(id)a3 featureCollectionSet:(id)a4
{
  id v7;
  id v8;
  ATXNotificationBreakthroughEventMetric *v9;
  ATXNotificationBreakthroughEventMetric *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationBreakthroughEventMetric;
  v9 = -[_ATXCoreAnalyticsMetric init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureCollectionSet, a4);
    objc_storeStrong((id *)&v10->_queryResult, a3);
  }

  return v10;
}

- (id)coreAnalyticsDictionary
{
  return (id)objc_msgSend((id)objc_opt_class(), "coreAnalyticsDictionaryFromQueryResult:featureCollectionSet:", self->_queryResult, self->_featureCollectionSet);
}

+ (id)coreAnalyticsDictionaryFromQueryResult:(id)a3 featureCollectionSet:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
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
  id v140;
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
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  _QWORD v224[53];
  _QWORD v225[55];

  v225[53] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v224[0] = CFSTR("bundleId");
  objc_msgSend(v5, "bundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v139 = (void *)v7;
  v225[0] = v7;
  v224[1] = CFSTR("destinationReason");
  objc_msgSend(v5, "destinationReason");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v218 = v10;
  v138 = (void *)v9;
  v225[1] = v9;
  v224[2] = CFSTR("handleDestination");
  objc_msgSend(v5, "finalDestination");
  v11 = objc_claimAutoreleasedReturnValue();
  v217 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v219 = v8;
  v137 = (void *)v11;
  v225[2] = v11;
  v224[3] = CFSTR("handleMode");
  objc_msgSend(v5, "resolution");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "resolutionTimestamp");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v136 = (void *)v12;
  v225[3] = v12;
  v224[4] = CFSTR("isMessage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isMessage"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v225[4] = v213;
  v224[5] = CFSTR("notificationUrgency");
  objc_msgSend(v5, "urgency");
  ATXUserNotificationDeliveryUrgencyToString();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v135 = (void *)v14;
  v225[5] = v14;
  v224[6] = CFSTR("originalDestination");
  objc_msgSend(v5, "originalDestination");
  v16 = objc_claimAutoreleasedReturnValue();
  v211 = (void *)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v134 = (void *)v16;
  v225[6] = v16;
  v224[7] = CFSTR("deliveryMethod");
  objc_msgSend(v5, "deliveryMethod");
  ATXUserNotificationDeliveryMethodToString();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v133 = (void *)v17;
  v225[7] = v17;
  v224[8] = CFSTR("receiveMode");
  objc_msgSend(v5, "receiveTimestamp");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXNotificationEventMetric atxComputedModeStringForTimestamp:](ATXNotificationEventMetric, "atxComputedModeStringForTimestamp:");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v132 = (void *)v19;
  v225[8] = v19;
  v224[9] = CFSTR("resolutionType");
  objc_msgSend(v5, "resolution");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  ATXUserNotificationResolutionTypeToString(objc_msgSend(v207, "resolutionType"));
  v21 = objc_claimAutoreleasedReturnValue();
  v223 = (void *)v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v131 = (void *)v21;
  v225[9] = v21;
  v224[10] = CFSTR("secureBundleId");
  objc_msgSend(v5, "bundleId");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  v22 = objc_claimAutoreleasedReturnValue();
  v222 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v130 = (void *)v22;
  v225[10] = v22;
  v224[11] = CFSTR("timeToResolution");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "resolution");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "resolutionTimestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveTimestamp");
  v204 = v24;
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceDate:");
  objc_msgSend(v23, "numberWithDouble:");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v225[11] = v202;
  v224[12] = CFSTR("receiveInferredMode");
  v25 = (void *)MEMORY[0x1E0D80E50];
  objc_msgSend(v5, "receiveTimestamp");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "currentModeEventAtGivenTime:");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "eventBody");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "modeType");
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  ATXModeToString();
  v26 = objc_claimAutoreleasedReturnValue();
  v221 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v129 = (void *)v26;
  v225[12] = v26;
  v224[13] = CFSTR("handleInferredMode");
  v27 = (void *)MEMORY[0x1E0D80E50];
  objc_msgSend(v5, "resolution");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "resolutionTimestamp");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currentModeEventAtGivenTime:");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "eventBody");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "modeType");
  BMUserFocusInferredModeTypeToActivity();
  ATXModeFromActivityType();
  ATXModeToString();
  v28 = objc_claimAutoreleasedReturnValue();
  v194 = (void *)v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v208 = v20;
  v210 = v18;
  v212 = v15;
  v214 = v13;
  v128 = (void *)v28;
  v225[13] = v28;
  v224[14] = CFSTR("currentUnifiedMode");
  objc_msgSend(v6, "currentUnifiedMode");
  ATXModeToString();
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v225[14] = v193;
  v224[15] = CFSTR("contactRelationships");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "contactRelationships"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v225[15] = v192;
  v224[16] = CFSTR("relationshipFromMegadome");
  objc_msgSend(v6, "relationshipsFromMegadome");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "firstObject");
  v29 = objc_claimAutoreleasedReturnValue();
  v190 = (void *)v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v127 = (void *)v29;
  v225[16] = v29;
  v224[17] = CFSTR("dayOfWeek");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "dayOfWeek"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v225[17] = v189;
  v224[18] = CFSTR("timeOfDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "timeOfDay"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v225[18] = v188;
  v224[19] = CFSTR("locationSemantic");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "locationSemantic"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v225[19] = v187;
  v224[20] = CFSTR("appModeAffinityScore");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "appModeAffinityScore");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = objc_claimAutoreleasedReturnValue();
  v186 = (void *)v31;
  if (v31)
    v32 = (void *)v31;
  else
    v32 = &unk_1E83CD858;
  v225[20] = v32;
  v224[21] = CFSTR("contactModeAffinityScore");
  v33 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "contactModeAffinityScore");
  objc_msgSend(v33, "numberWithDouble:");
  v34 = objc_claimAutoreleasedReturnValue();
  v185 = (void *)v34;
  if (v34)
    v35 = (void *)v34;
  else
    v35 = &unk_1E83CD858;
  v225[21] = v35;
  v224[22] = CFSTR("notificationModeAffinityScore");
  v36 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "notificationModeAffinityScore");
  objc_msgSend(v36, "numberWithDouble:");
  v37 = objc_claimAutoreleasedReturnValue();
  v184 = (void *)v37;
  if (v37)
    v38 = (void *)v37;
  else
    v38 = &unk_1E83CD858;
  v225[22] = v38;
  v224[23] = CFSTR("appCategoryScoreInMode");
  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "appCategoryScoreInMode");
  objc_msgSend(v39, "numberWithDouble:");
  v40 = objc_claimAutoreleasedReturnValue();
  v183 = (void *)v40;
  if (v40)
    v41 = (void *)v40;
  else
    v41 = &unk_1E83CD858;
  v225[23] = v41;
  v224[24] = CFSTR("urgencyScore");
  v42 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "urgencyScore");
  objc_msgSend(v42, "numberWithDouble:");
  v43 = objc_claimAutoreleasedReturnValue();
  v182 = (void *)v43;
  if (v43)
    v44 = (void *)v43;
  else
    v44 = &unk_1E83CD858;
  v225[24] = v44;
  v224[25] = CFSTR("importanceScore");
  v45 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "importanceScore");
  objc_msgSend(v45, "numberWithDouble:");
  v46 = objc_claimAutoreleasedReturnValue();
  v181 = (void *)v46;
  if (v46)
    v47 = (void *)v46;
  else
    v47 = &unk_1E83CD858;
  v225[25] = v47;
  v224[26] = CFSTR("lengthOfNotificationBody");
  v220 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "bodyLength"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v225[26] = v180;
  v224[27] = CFSTR("timeBucketToLaunchApp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "timeToLaunchApp"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v225[27] = v179;
  v224[28] = CFSTR("dailyNumberOfNotificationsReceivedForBundleID");
  v48 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalVolumeByCountAndPercentage");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v178, "dailyNumberOfNotificationsReceivedForBundleID"));
  v49 = objc_claimAutoreleasedReturnValue();
  v177 = (void *)v49;
  if (v49)
    v50 = (void *)v49;
  else
    v50 = &unk_1E83CD858;
  v225[28] = v50;
  v224[29] = CFSTR("weeklyNumberOfNotificationsReceivedForBundleID");
  v51 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalVolumeByCountAndPercentage");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "numberWithUnsignedInteger:", objc_msgSend(v176, "weeklyNumberOfNotificationsReceivedForBundleID"));
  v52 = objc_claimAutoreleasedReturnValue();
  v175 = (void *)v52;
  if (v52)
    v53 = (void *)v52;
  else
    v53 = &unk_1E83CD858;
  v225[29] = v53;
  v224[30] = CFSTR("dailyPercentageOfNotificationsReceivedForBundleID");
  v54 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalVolumeByCountAndPercentage");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "dailyPercentageOfNotificationsReceivedForBundleID");
  objc_msgSend(v54, "numberWithDouble:");
  v55 = objc_claimAutoreleasedReturnValue();
  v173 = (void *)v55;
  if (v55)
    v56 = (void *)v55;
  else
    v56 = &unk_1E83CD858;
  v225[30] = v56;
  v224[31] = CFSTR("weeklyPercentageOfNotificationsReceivedForBundleID");
  v57 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalVolumeByCountAndPercentage");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "weeklyPercentageOfNotificationsReceivedForBundleID");
  objc_msgSend(v57, "numberWithDouble:");
  v58 = objc_claimAutoreleasedReturnValue();
  v171 = (void *)v58;
  if (v58)
    v59 = (void *)v58;
  else
    v59 = &unk_1E83CD858;
  v225[31] = v59;
  v224[32] = CFSTR("modeDailyNumberOfNotificationsReceivedForBundleID");
  v60 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalVolumeByCountAndPercentage");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "numberWithUnsignedInteger:", objc_msgSend(v170, "dailyNumberOfNotificationsReceivedForBundleID"));
  v61 = objc_claimAutoreleasedReturnValue();
  v169 = (void *)v61;
  if (v61)
    v62 = (void *)v61;
  else
    v62 = &unk_1E83CD858;
  v225[32] = v62;
  v224[33] = CFSTR("modeWeeklyNumberOfNotificationsReceivedForBundleID");
  v63 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalVolumeByCountAndPercentage");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v168, "weeklyNumberOfNotificationsReceivedForBundleID"));
  v64 = objc_claimAutoreleasedReturnValue();
  v167 = (void *)v64;
  if (v64)
    v65 = (void *)v64;
  else
    v65 = &unk_1E83CD858;
  v225[33] = v65;
  v224[34] = CFSTR("modeDailyPercentageOfNotificationsReceivedForBundleID");
  v66 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalVolumeByCountAndPercentage");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "dailyPercentageOfNotificationsReceivedForBundleID");
  objc_msgSend(v66, "numberWithDouble:");
  v67 = objc_claimAutoreleasedReturnValue();
  v165 = (void *)v67;
  if (v67)
    v68 = (void *)v67;
  else
    v68 = &unk_1E83CD858;
  v225[34] = v68;
  v224[35] = CFSTR("modeWeeklyPercentageOfNotificationsReceivedForBundleID");
  v69 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalVolumeByCountAndPercentage");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "weeklyPercentageOfNotificationsReceivedForBundleID");
  objc_msgSend(v69, "numberWithDouble:");
  v70 = objc_claimAutoreleasedReturnValue();
  v163 = (void *)v70;
  if (v70)
    v71 = (void *)v70;
  else
    v71 = &unk_1E83CD858;
  v225[35] = v71;
  v224[36] = CFSTR("percentageForOneMinuteDuration");
  v72 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalResolutionByPercentage");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "percentageForOneMinuteDuration");
  objc_msgSend(v72, "numberWithDouble:");
  v73 = objc_claimAutoreleasedReturnValue();
  v161 = (void *)v73;
  if (v73)
    v74 = (void *)v73;
  else
    v74 = &unk_1E83CD858;
  v225[36] = v74;
  v224[37] = CFSTR("percentageForTwoMinutesDuration");
  v75 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalResolutionByPercentage");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "percentageForTwoMinutesDuration");
  objc_msgSend(v75, "numberWithDouble:");
  v76 = objc_claimAutoreleasedReturnValue();
  v159 = (void *)v76;
  if (v76)
    v77 = (void *)v76;
  else
    v77 = &unk_1E83CD858;
  v225[37] = v77;
  v224[38] = CFSTR("percentageForFiveMinutesDuration");
  v78 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalResolutionByPercentage");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "percentageForFiveMinutesDuration");
  objc_msgSend(v78, "numberWithDouble:");
  v79 = objc_claimAutoreleasedReturnValue();
  v157 = (void *)v79;
  if (v79)
    v80 = (void *)v79;
  else
    v80 = &unk_1E83CD858;
  v225[38] = v80;
  v224[39] = CFSTR("percentageForTenMinutesDuration");
  v81 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalResolutionByPercentage");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "percentageForTenMinutesDuration");
  objc_msgSend(v81, "numberWithDouble:");
  v82 = objc_claimAutoreleasedReturnValue();
  v155 = (void *)v82;
  if (v82)
    v83 = (void *)v82;
  else
    v83 = &unk_1E83CD858;
  v225[39] = v83;
  v224[40] = CFSTR("percentageForTwentyMinutesDuration");
  v84 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalResolutionByPercentage");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "percentageForTwentyMinutesDuration");
  objc_msgSend(v84, "numberWithDouble:");
  v85 = objc_claimAutoreleasedReturnValue();
  v153 = (void *)v85;
  if (v85)
    v86 = (void *)v85;
  else
    v86 = &unk_1E83CD858;
  v225[40] = v86;
  v224[41] = CFSTR("percentageForThirtyMinutesDuration");
  v87 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalResolutionByPercentage");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "percentageForThirtyMinutesDuration");
  objc_msgSend(v87, "numberWithDouble:");
  v88 = objc_claimAutoreleasedReturnValue();
  v151 = (void *)v88;
  if (v88)
    v89 = (void *)v88;
  else
    v89 = &unk_1E83CD858;
  v225[41] = v89;
  v224[42] = CFSTR("percentageForSixtyMinutesDuration");
  v90 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "historicalResolutionByPercentage");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "percentageForSixtyMinutesDuration");
  objc_msgSend(v90, "numberWithDouble:");
  v91 = objc_claimAutoreleasedReturnValue();
  v149 = (void *)v91;
  if (v91)
    v92 = (void *)v91;
  else
    v92 = &unk_1E83CD858;
  v225[42] = v92;
  v224[43] = CFSTR("modePercentageForOneMinuteDuration");
  v93 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalResolutionByPercentage");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "percentageForOneMinuteDuration");
  objc_msgSend(v93, "numberWithDouble:");
  v94 = objc_claimAutoreleasedReturnValue();
  v147 = (void *)v94;
  if (v94)
    v95 = (void *)v94;
  else
    v95 = &unk_1E83CD858;
  v225[43] = v95;
  v224[44] = CFSTR("modePercentageForTwoMinutesDuration");
  v96 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalResolutionByPercentage");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "percentageForTwoMinutesDuration");
  objc_msgSend(v96, "numberWithDouble:");
  v97 = objc_claimAutoreleasedReturnValue();
  v145 = (void *)v97;
  if (v97)
    v98 = (void *)v97;
  else
    v98 = &unk_1E83CD858;
  v225[44] = v98;
  v224[45] = CFSTR("modePercentageForFiveMinutesDuration");
  v99 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalResolutionByPercentage");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "percentageForFiveMinutesDuration");
  objc_msgSend(v99, "numberWithDouble:");
  v100 = objc_claimAutoreleasedReturnValue();
  v143 = (void *)v100;
  if (v100)
    v101 = (void *)v100;
  else
    v101 = &unk_1E83CD858;
  v225[45] = v101;
  v224[46] = CFSTR("modePercentageForTenMinutesDuration");
  v102 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalResolutionByPercentage");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "percentageForTenMinutesDuration");
  objc_msgSend(v102, "numberWithDouble:");
  v103 = objc_claimAutoreleasedReturnValue();
  v104 = (void *)v103;
  if (v103)
    v105 = (void *)v103;
  else
    v105 = &unk_1E83CD858;
  v225[46] = v105;
  v224[47] = CFSTR("modePercentageForTwentyMinutesDuration");
  v106 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalResolutionByPercentage");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "percentageForTwentyMinutesDuration");
  objc_msgSend(v106, "numberWithDouble:");
  v107 = objc_claimAutoreleasedReturnValue();
  v108 = (void *)v107;
  if (v107)
    v109 = (void *)v107;
  else
    v109 = &unk_1E83CD858;
  v225[47] = v109;
  v224[48] = CFSTR("modePercentageForThirtyMinutesDuration");
  v110 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalResolutionByPercentage");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "percentageForThirtyMinutesDuration");
  objc_msgSend(v110, "numberWithDouble:");
  v112 = objc_claimAutoreleasedReturnValue();
  v113 = (void *)v112;
  if (v112)
    v114 = (void *)v112;
  else
    v114 = &unk_1E83CD858;
  v225[48] = v114;
  v224[49] = CFSTR("modePercentageForSixtyMinutesDuration");
  v115 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "modeConditionedHistoricalResolutionByPercentage");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "percentageForSixtyMinutesDuration");
  objc_msgSend(v115, "numberWithDouble:");
  v117 = objc_claimAutoreleasedReturnValue();
  v118 = (void *)v117;
  if (v117)
    v119 = (void *)v117;
  else
    v119 = &unk_1E83CD858;
  v225[49] = v119;
  v224[50] = CFSTR("trialDeploymentId");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v225[50] = v120;
  v224[51] = CFSTR("trialExperimentId");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v225[51] = v121;
  v224[52] = CFSTR("trialTreatmentId");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v225[52] = v122;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v225, v224, 53);
  v140 = (id)objc_claimAutoreleasedReturnValue();

  if (!v190)
  if (!v194)

  v123 = v221;
  if (!v221)
  {

    v123 = 0;
  }

  v124 = v222;
  if (!v222)
  {

    v124 = 0;
  }

  v125 = v223;
  if (!v223)
  {

    v125 = 0;
  }

  if (!v208)
  if (!v210)

  if (!v211)
  if (!v212)

  if (!v214)
  if (!v217)

  if (!v218)
  if (!v219)

  return v140;
}

- (ATXNotificationTelemetryQueryResult)queryResult
{
  return self->_queryResult;
}

- (void)setQueryResult:(id)a3
{
  objc_storeStrong((id *)&self->_queryResult, a3);
}

- (ATXNotificationCategorizationFeatureCollectionSet)featureCollectionSet
{
  return self->_featureCollectionSet;
}

- (void)setFeatureCollectionSet:(id)a3
{
  objc_storeStrong((id *)&self->_featureCollectionSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureCollectionSet, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
}

@end
