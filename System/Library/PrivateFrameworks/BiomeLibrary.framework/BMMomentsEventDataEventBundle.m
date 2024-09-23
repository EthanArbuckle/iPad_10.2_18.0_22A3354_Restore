@implementation BMMomentsEventDataEventBundle

- (BMMomentsEventDataEventBundle)initWithBundleIdentifier:(void *)a3 bundleStartDate:(void *)a4 bundleEndDate:(void *)a5 bundleCreationDate:(void *)a6 bundleExpirationDate:(void *)a7 bundleInterfaceType:(int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(id)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(id)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(id)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(int)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(int)a18 bundleEventIDs:(id)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(id)a22 bundleTimeTag:(int)a23 isBundleResourceTypeUnknown:(id)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(id)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(id)a29 bundlEngagement:(int)a30 bundleVersion:(id)a31 rankingVersion:(id)a32 suggestionType:(int)a33 suggestionTimestamp:(id)a34 suggestionClientIdentifier:(id)a35 suggestionViewContainerName:(id)a36 suggestionViewVisibleTime:(id)a37 appEntryEventType:(int)a38 appEntryEventClientIdentifier:(id)a39 appEntryEventTimestamp:(id)a40 appEntryEventStartTime:(id)a41 appEntryEventEndTime:(id)a42 appEntryEventTotalCharacters:(id)a43 appEntryEventAddedCharacters:(id)a44 clientActivityEventType:(int)a45 clientActivityEventClientIdentifier:(id)a46 clientActivityEventTimestamp:(id)a47 suggestionIdentifier:(id)a48 photoSourceType:(int)a49 photoLibraryType:(int)a50 bundleSourcePostAnalyticsExists:(id)a51 bundleSourcePDExists:(id)a52 bundleSourceMotionExists:(id)a53 bundleSourceBooksExists:(id)a54 bundleSourceScreenTimeExists:(id)a55 gaPRArray:(id)a56 bundlePCount:(id)a57 ranking:(int)a58 labelConfidenceScore:(int)a59 timeCorrelationScore:(int)a60 callDuration:(int)a61 interactionCount:(int)a62 interactionType:(int)a63 callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:
{
  int a64;
  int a65;
  int a66;
  int a67;
  int a68;
  int a69;
  int a70;
  int a71;
  id a72;
  int a73;
  int a74;
  id a75;
  int a76;
  id a77;
  id a78;
  id a79;
  id a80;
  id a81;
  id a82;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  BMMomentsEventDataEventBundle *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  float v100;
  double v101;
  double v102;
  double v103;
  double v104;
  int v105;
  int v106;
  double v107;
  int v108;
  int v109;
  int v110;
  char v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  BMMomentsEventDataEventBundle *v118;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  void *v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v191;
  id v192;
  objc_super v193;

  v182 = (void *)STACK[0x580];
  v170 = (id)STACK[0x548];
  v169 = (id)STACK[0x540];
  v166 = (id)STACK[0x538];
  v165 = (id)STACK[0x530];
  v145 = (void *)STACK[0x578];
  v147 = (void *)STACK[0x570];
  v149 = (void *)STACK[0x568];
  v151 = (void *)STACK[0x560];
  v167 = (id)STACK[0x550];
  v153 = (void *)STACK[0x558];
  v143 = a3;
  v144 = a4;
  v192 = a5;
  v191 = a6;
  v85 = a7;
  v86 = a9;
  v87 = a10;
  v88 = a11;
  v189 = a12;
  v142 = a13;
  v141 = a14;
  v188 = a15;
  v89 = a19;
  v140 = a20;
  v90 = v85;
  v91 = v144;
  v139 = a21;
  v187 = a22;
  v186 = a24;
  v185 = a25;
  v184 = a26;
  v183 = a27;
  v181 = a28;
  v180 = a29;
  v179 = a31;
  v178 = a32;
  v177 = a34;
  v138 = a35;
  v137 = a36;
  v176 = a37;
  v136 = a39;
  v175 = a40;
  v174 = a41;
  v173 = a42;
  v172 = a43;
  v171 = a44;
  v135 = a46;
  v168 = a47;
  v134 = a48;
  v164 = a51;
  v163 = a52;
  v162 = a53;
  v161 = a54;
  v160 = a55;
  v133 = a56;
  v159 = a57;
  v158 = a72;
  v157 = a75;
  v156 = a77;
  v132 = a78;
  v131 = a79;
  v155 = a80;
  v130 = a81;
  v129 = a82;
  v128 = v165;
  v127 = v166;
  v126 = v169;
  v125 = v170;
  v124 = v167;
  v154 = v153;
  v152 = v151;
  v150 = v149;
  v148 = v147;
  v146 = v145;
  v123 = v182;
  v193.receiver = a1;
  v193.super_class = (Class)BMMomentsEventDataEventBundle;
  v92 = -[BMEventBase init](&v193, sel_init);

  if (v92)
  {
    v92->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v92->_bundleIdentifier, a3);
    if (v144)
    {
      v92->_hasRaw_bundleStartDate = 1;
      objc_msgSend(v144, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_bundleStartDate = 0;
      v93 = -1.0;
    }
    v92->_raw_bundleStartDate = v93;
    if (v192)
    {
      v92->_hasRaw_bundleEndDate = 1;
      objc_msgSend(v192, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_bundleEndDate = 0;
      v94 = -1.0;
    }
    v92->_raw_bundleEndDate = v94;
    if (v191)
    {
      v92->_hasRaw_bundleCreationDate = 1;
      objc_msgSend(v191, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_bundleCreationDate = 0;
      v95 = -1.0;
    }
    v92->_raw_bundleCreationDate = v95;
    if (v90)
    {
      v92->_hasRaw_bundleExpirationDate = 1;
      objc_msgSend(v90, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_bundleExpirationDate = 0;
      v96 = -1.0;
    }
    v92->_raw_bundleExpirationDate = v96;
    v92->_bundleInterfaceType = a8;
    if (v86)
    {
      v92->_hasBundleSourceHealthExists = 1;
      v92->_bundleSourceHealthExists = objc_msgSend(v86, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourceHealthExists = 0;
      v92->_bundleSourceHealthExists = 0;
    }
    if (v87)
    {
      v92->_hasBundleSourcePhotoExists = 1;
      v92->_bundleSourcePhotoExists = objc_msgSend(v87, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourcePhotoExists = 0;
      v92->_bundleSourcePhotoExists = 0;
    }
    if (v88)
    {
      v92->_hasBundleSourceProactiveExists = 1;
      v92->_bundleSourceProactiveExists = objc_msgSend(v88, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourceProactiveExists = 0;
      v92->_bundleSourceProactiveExists = 0;
    }
    if (v189)
    {
      v92->_hasBundleSourceRoutineExists = 1;
      v92->_bundleSourceRoutineExists = objc_msgSend(v189, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourceRoutineExists = 0;
      v92->_bundleSourceRoutineExists = 0;
    }
    objc_storeStrong((id *)&v92->_bundlePromptLanguageFormat, a13);
    objc_storeStrong((id *)&v92->_bundlePromptToneID, a14);
    if (v188)
    {
      v92->_hasBundlePromptParametersAvailability = 1;
      v92->_bundlePromptParametersAvailability = objc_msgSend(v188, "BOOLValue");
    }
    else
    {
      v92->_hasBundlePromptParametersAvailability = 0;
      v92->_bundlePromptParametersAvailability = 0;
    }
    v92->_bundlePlaceType = a16;
    v92->_bundlePlaceUserType = a17;
    v92->_bundleBaseEventCateory = a18;
    objc_storeStrong((id *)&v92->_bundleEventIDs, a19);
    objc_storeStrong((id *)&v92->_bundleActionType, a20);
    objc_storeStrong((id *)&v92->_backgroundActions, a21);
    if (v187)
    {
      v92->_hasBundleIsFamilyIncluded = 1;
      v92->_bundleIsFamilyIncluded = objc_msgSend(v187, "BOOLValue");
    }
    else
    {
      v92->_hasBundleIsFamilyIncluded = 0;
      v92->_bundleIsFamilyIncluded = 0;
    }
    v92->_bundleTimeTag = a23;
    if (v186)
    {
      v92->_hasIsBundleResourceTypeUnknown = 1;
      v92->_isBundleResourceTypeUnknown = objc_msgSend(v186, "BOOLValue");
    }
    else
    {
      v92->_hasIsBundleResourceTypeUnknown = 0;
      v92->_isBundleResourceTypeUnknown = 0;
    }
    if (v185)
    {
      v92->_hasIsBundleResourceTypeValueIncluded = 1;
      v92->_isBundleResourceTypeValueIncluded = objc_msgSend(v185, "BOOLValue");
    }
    else
    {
      v92->_hasIsBundleResourceTypeValueIncluded = 0;
      v92->_isBundleResourceTypeValueIncluded = 0;
    }
    if (v184)
    {
      v92->_hasIsBundleResourceTypePhotoAssetsIncluded = 1;
      v92->_isBundleResourceTypePhotoAssetsIncluded = objc_msgSend(v184, "BOOLValue");
    }
    else
    {
      v92->_hasIsBundleResourceTypePhotoAssetsIncluded = 0;
      v92->_isBundleResourceTypePhotoAssetsIncluded = 0;
    }
    if (v183)
    {
      v92->_hasIsBundleResourceTypeMediaIncluded = 1;
      v92->_isBundleResourceTypeMediaIncluded = objc_msgSend(v183, "BOOLValue");
    }
    else
    {
      v92->_hasIsBundleResourceTypeMediaIncluded = 0;
      v92->_isBundleResourceTypeMediaIncluded = 0;
    }
    if (v181)
    {
      v92->_hasIsBundleResourceTypeWebLinkIncluded = 1;
      v92->_isBundleResourceTypeWebLinkIncluded = objc_msgSend(v181, "BOOLValue");
    }
    else
    {
      v92->_hasIsBundleResourceTypeWebLinkIncluded = 0;
      v92->_isBundleResourceTypeWebLinkIncluded = 0;
    }
    if (v180)
    {
      v92->_hasIsBundleResourceTypeInterenceTagIncluded = 1;
      v92->_isBundleResourceTypeInterenceTagIncluded = objc_msgSend(v180, "BOOLValue");
    }
    else
    {
      v92->_hasIsBundleResourceTypeInterenceTagIncluded = 0;
      v92->_isBundleResourceTypeInterenceTagIncluded = 0;
    }
    v92->_bundlEngagement = a30;
    if (v179)
    {
      v92->_hasBundleVersion = 1;
      objc_msgSend(v179, "doubleValue");
    }
    else
    {
      v92->_hasBundleVersion = 0;
      v97 = -1.0;
    }
    v92->_bundleVersion = v97;
    if (v178)
    {
      v92->_hasRankingVersion = 1;
      objc_msgSend(v178, "doubleValue");
    }
    else
    {
      v92->_hasRankingVersion = 0;
      v98 = -1.0;
    }
    v92->_rankingVersion = v98;
    v92->_suggestionType = a33;
    if (v177)
    {
      v92->_hasRaw_suggestionTimestamp = 1;
      objc_msgSend(v177, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_suggestionTimestamp = 0;
      v99 = -1.0;
    }
    v92->_raw_suggestionTimestamp = v99;
    objc_storeStrong((id *)&v92->_suggestionClientIdentifier, a35);
    objc_storeStrong((id *)&v92->_suggestionViewContainerName, a36);
    if (v176)
    {
      v92->_hasSuggestionViewVisibleTime = 1;
      objc_msgSend(v176, "floatValue");
      v101 = v100;
    }
    else
    {
      v92->_hasSuggestionViewVisibleTime = 0;
      v101 = -1.0;
    }
    v92->_suggestionViewVisibleTime = v101;
    v92->_appEntryEventType = a38;
    objc_storeStrong((id *)&v92->_appEntryEventClientIdentifier, a39);
    if (v175)
    {
      v92->_hasRaw_appEntryEventTimestamp = 1;
      objc_msgSend(v175, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_appEntryEventTimestamp = 0;
      v102 = -1.0;
    }
    v92->_raw_appEntryEventTimestamp = v102;
    if (v174)
    {
      v92->_hasRaw_appEntryEventStartTime = 1;
      objc_msgSend(v174, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_appEntryEventStartTime = 0;
      v103 = -1.0;
    }
    v92->_raw_appEntryEventStartTime = v103;
    if (v173)
    {
      v92->_hasRaw_appEntryEventEndTime = 1;
      objc_msgSend(v173, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_appEntryEventEndTime = 0;
      v104 = -1.0;
    }
    v92->_raw_appEntryEventEndTime = v104;
    if (v172)
    {
      v92->_hasAppEntryEventTotalCharacters = 1;
      v105 = objc_msgSend(v172, "intValue");
    }
    else
    {
      v92->_hasAppEntryEventTotalCharacters = 0;
      v105 = -1;
    }
    v92->_appEntryEventTotalCharacters = v105;
    if (v171)
    {
      v92->_hasAppEntryEventAddedCharacters = 1;
      v106 = objc_msgSend(v171, "intValue");
    }
    else
    {
      v92->_hasAppEntryEventAddedCharacters = 0;
      v106 = -1;
    }
    v92->_appEntryEventAddedCharacters = v106;
    v92->_clientActivityEventType = a45;
    objc_storeStrong((id *)&v92->_clientActivityEventClientIdentifier, a46);
    if (v168)
    {
      v92->_hasRaw_clientActivityEventTimestamp = 1;
      objc_msgSend(v168, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_clientActivityEventTimestamp = 0;
      v107 = -1.0;
    }
    v92->_raw_clientActivityEventTimestamp = v107;
    objc_storeStrong((id *)&v92->_suggestionIdentifier, a48);
    v92->_photoSourceType = a49;
    v92->_photoLibraryType = a50;
    if (v164)
    {
      v92->_hasBundleSourcePostAnalyticsExists = 1;
      v92->_bundleSourcePostAnalyticsExists = objc_msgSend(v164, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourcePostAnalyticsExists = 0;
      v92->_bundleSourcePostAnalyticsExists = 0;
    }
    if (v163)
    {
      v92->_hasBundleSourcePDExists = 1;
      v92->_bundleSourcePDExists = objc_msgSend(v163, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourcePDExists = 0;
      v92->_bundleSourcePDExists = 0;
    }
    if (v162)
    {
      v92->_hasBundleSourceMotionExists = 1;
      v92->_bundleSourceMotionExists = objc_msgSend(v162, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourceMotionExists = 0;
      v92->_bundleSourceMotionExists = 0;
    }
    if (v161)
    {
      v92->_hasBundleSourceBooksExists = 1;
      v92->_bundleSourceBooksExists = objc_msgSend(v161, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourceBooksExists = 0;
      v92->_bundleSourceBooksExists = 0;
    }
    if (v160)
    {
      v92->_hasBundleSourceScreenTimeExists = 1;
      v92->_bundleSourceScreenTimeExists = objc_msgSend(v160, "BOOLValue");
    }
    else
    {
      v92->_hasBundleSourceScreenTimeExists = 0;
      v92->_bundleSourceScreenTimeExists = 0;
    }
    objc_storeStrong((id *)&v92->_gaPRArray, a56);
    if (v159)
    {
      v92->_hasBundlePCount = 1;
      v108 = objc_msgSend(v159, "intValue");
    }
    else
    {
      v92->_hasBundlePCount = 0;
      v108 = -1;
    }
    v109 = a74;
    v110 = a73;
    v92->_bundlePCount = v108;
    v92->_ranking = a58;
    v92->_labelConfidenceScore = a59;
    v92->_timeCorrelationScore = a60;
    v92->_callDuration = a61;
    v92->_interactionCount = a62;
    v92->_interactionType = a63;
    v92->_callPlace = a64;
    v92->_distanceFromHome = a65;
    v92->_homeAvailability = a66;
    v92->_workAvailability = a67;
    v92->_bundleVisitMapItemSource = a68;
    v92->_bundleVisitPlaceType = a69;
    v92->_bundleVisitPlaceLabelGranularity = a70;
    v92->_bundleIncludesAnomalousEvent = a71;
    if (v158)
    {
      v92->_hasIsFiltered = 1;
      v111 = objc_msgSend(v158, "BOOLValue");
      v110 = a73;
      v109 = a74;
      v92->_isFiltered = v111;
    }
    else
    {
      v92->_hasIsFiltered = 0;
      v92->_isFiltered = 0;
    }
    v91 = v144;
    v92->_bundleSuperType = v110;
    v92->_bundleSubType = v109;
    if (v157)
    {
      v92->_hasIsAggregatedAndSuppressed = 1;
      v92->_isAggregatedAndSuppressed = objc_msgSend(v157, "BOOLValue");
    }
    else
    {
      v92->_hasIsAggregatedAndSuppressed = 0;
      v92->_isAggregatedAndSuppressed = 0;
    }
    v92->_summarizationGranularity = a76;
    if (v156)
    {
      v92->_hasIncludedInSummaryBundleOnly = 1;
      v92->_includedInSummaryBundleOnly = objc_msgSend(v156, "BOOLValue");
    }
    else
    {
      v92->_hasIncludedInSummaryBundleOnly = 0;
      v92->_includedInSummaryBundleOnly = 0;
    }
    objc_storeStrong((id *)&v92->_subBundleIDs, a78);
    objc_storeStrong((id *)&v92->_subSuggestionIDs, a79);
    if (v155)
    {
      v92->_hasRaw_firstCreationDate = 1;
      objc_msgSend(v155, "timeIntervalSince1970");
    }
    else
    {
      v92->_hasRaw_firstCreationDate = 0;
      v112 = -1.0;
    }
    v92->_raw_firstCreationDate = v112;
    objc_storeStrong((id *)&v92->_resources, a81);
    objc_storeStrong((id *)&v92->_persons, a82);
    objc_storeStrong((id *)&v92->_mainPlace, v165);
    objc_storeStrong((id *)&v92->_otherPlaces, v166);
    objc_storeStrong((id *)&v92->_photoTraits, v169);
    objc_storeStrong((id *)&v92->_clusterMetadata, v170);
    objc_storeStrong((id *)&v92->_outlierMetadata, v167);
    if (v154)
    {
      v92->_hasBundleGoodnessScore = 1;
      objc_msgSend(v154, "doubleValue");
    }
    else
    {
      v92->_hasBundleGoodnessScore = 0;
      v113 = -1.0;
    }
    v92->_bundleGoodnessScore = v113;
    if (v152)
    {
      v92->_hasDistinctnessScore = 1;
      objc_msgSend(v152, "doubleValue");
    }
    else
    {
      v92->_hasDistinctnessScore = 0;
      v114 = -1.0;
    }
    v92->_distinctnessScore = v114;
    if (v150)
    {
      v92->_hasRichnessScore = 1;
      objc_msgSend(v150, "doubleValue");
    }
    else
    {
      v92->_hasRichnessScore = 0;
      v115 = -1.0;
    }
    v92->_richnessScore = v115;
    if (v148)
    {
      v92->_hasEngagementScore = 1;
      objc_msgSend(v148, "doubleValue");
    }
    else
    {
      v92->_hasEngagementScore = 0;
      v116 = -1.0;
    }
    v92->_engagementScore = v116;
    if (v146)
    {
      v92->_hasHeuristicsScore = 1;
      objc_msgSend(v146, "doubleValue");
    }
    else
    {
      v92->_hasHeuristicsScore = 0;
      v117 = -1.0;
    }
    v92->_heuristicsScore = v117;
    objc_storeStrong((id *)&v92->_metadataForRank, v182);
  }
  v118 = v92;

  return v118;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
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
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v83;
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

  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMomentsEventDataEventBundle bundleIdentifier](self, "bundleIdentifier");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleStartDate](self, "bundleStartDate");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleEndDate](self, "bundleEndDate");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleCreationDate](self, "bundleCreationDate");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleExpirationDate](self, "bundleExpirationDate");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataBundleInterfaceTypeAsString(-[BMMomentsEventDataEventBundle bundleInterfaceType](self, "bundleInterfaceType"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceHealthExists](self, "bundleSourceHealthExists"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePhotoExists](self, "bundleSourcePhotoExists"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceProactiveExists](self, "bundleSourceProactiveExists"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceRoutineExists](self, "bundleSourceRoutineExists"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundlePromptLanguageFormat](self, "bundlePromptLanguageFormat");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundlePromptToneID](self, "bundlePromptToneID");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundlePromptParametersAvailability](self, "bundlePromptParametersAvailability"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPlaceInferencePlaceTypeAsString(-[BMMomentsEventDataEventBundle bundlePlaceType](self, "bundlePlaceType"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeAsString(-[BMMomentsEventDataEventBundle bundlePlaceUserType](self, "bundlePlaceUserType"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventCategoryTypeAsString(-[BMMomentsEventDataEventBundle bundleBaseEventCateory](self, "bundleBaseEventCateory"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleEventIDs](self, "bundleEventIDs");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleActionType](self, "bundleActionType");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle backgroundActions](self, "backgroundActions");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleIsFamilyIncluded](self, "bundleIsFamilyIncluded"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataTimeTagTypeAsString(-[BMMomentsEventDataEventBundle bundleTimeTag](self, "bundleTimeTag"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeUnknown](self, "isBundleResourceTypeUnknown"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeValueIncluded](self, "isBundleResourceTypeValueIncluded"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypePhotoAssetsIncluded](self, "isBundleResourceTypePhotoAssetsIncluded"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeMediaIncluded](self, "isBundleResourceTypeMediaIncluded"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeWebLinkIncluded](self, "isBundleResourceTypeWebLinkIncluded"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeInterenceTagIncluded](self, "isBundleResourceTypeInterenceTagIncluded"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataBundleEngagementTypeAsString(-[BMMomentsEventDataEventBundle bundlEngagement](self, "bundlEngagement"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle bundleVersion](self, "bundleVersion");
  objc_msgSend(v3, "numberWithDouble:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle rankingVersion](self, "rankingVersion");
  objc_msgSend(v4, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataSuggestionTypeAsString(-[BMMomentsEventDataEventBundle suggestionType](self, "suggestionType"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle suggestionTimestamp](self, "suggestionTimestamp");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle suggestionClientIdentifier](self, "suggestionClientIdentifier");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle suggestionViewContainerName](self, "suggestionViewContainerName");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle suggestionViewVisibleTime](self, "suggestionViewVisibleTime");
  objc_msgSend(v5, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataAppEntryEventTypeAsString(-[BMMomentsEventDataEventBundle appEntryEventType](self, "appEntryEventType"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle appEntryEventClientIdentifier](self, "appEntryEventClientIdentifier");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle appEntryEventTimestamp](self, "appEntryEventTimestamp");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle appEntryEventStartTime](self, "appEntryEventStartTime");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle appEntryEventEndTime](self, "appEntryEventEndTime");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventTotalCharacters](self, "appEntryEventTotalCharacters"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventAddedCharacters](self, "appEntryEventAddedCharacters"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataClientActivityEventTypeAsString(-[BMMomentsEventDataEventBundle clientActivityEventType](self, "clientActivityEventType"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle clientActivityEventClientIdentifier](self, "clientActivityEventClientIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle clientActivityEventTimestamp](self, "clientActivityEventTimestamp");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle suggestionIdentifier](self, "suggestionIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPhotoSourceTypeAsString(-[BMMomentsEventDataEventBundle photoSourceType](self, "photoSourceType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPhotoLibraryTypeAsString(-[BMMomentsEventDataEventBundle photoLibraryType](self, "photoLibraryType"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePostAnalyticsExists](self, "bundleSourcePostAnalyticsExists"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePDExists](self, "bundleSourcePDExists"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceMotionExists](self, "bundleSourceMotionExists"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceBooksExists](self, "bundleSourceBooksExists"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceScreenTimeExists](self, "bundleSourceScreenTimeExists"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle gaPRArray](self, "gaPRArray");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePCount](self, "bundlePCount"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataRankingTypeAsString(-[BMMomentsEventDataEventBundle ranking](self, "ranking"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataLabelConfidenceScoreTypeAsString(-[BMMomentsEventDataEventBundle labelConfidenceScore](self, "labelConfidenceScore"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataTimeCorrelationScoreTypeAsString(-[BMMomentsEventDataEventBundle timeCorrelationScore](self, "timeCorrelationScore"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataCallDurationTypesAsString(-[BMMomentsEventDataEventBundle callDuration](self, "callDuration"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataInteractionCountTypesAsString(-[BMMomentsEventDataEventBundle interactionCount](self, "interactionCount"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataBundleInteractionTypesAsString(-[BMMomentsEventDataEventBundle interactionType](self, "interactionType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataCallPlaceTypeAsString(-[BMMomentsEventDataEventBundle callPlace](self, "callPlace"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataDistanceFromHomeTypeAsString(-[BMMomentsEventDataEventBundle distanceFromHome](self, "distanceFromHome"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataAvailabilityTypeAsString(-[BMMomentsEventDataEventBundle homeAvailability](self, "homeAvailability"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataAvailabilityTypeAsString(-[BMMomentsEventDataEventBundle workAvailability](self, "workAvailability"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataMapItemSourceTypeAsString(-[BMMomentsEventDataEventBundle bundleVisitMapItemSource](self, "bundleVisitMapItemSource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataVisitPlaceTypesAsString(-[BMMomentsEventDataEventBundle bundleVisitPlaceType](self, "bundleVisitPlaceType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPlaceInferenceGranularityTypeAsString(-[BMMomentsEventDataEventBundle bundleVisitPlaceLabelGranularity](self, "bundleVisitPlaceLabelGranularity"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataAnomalousTypeAsString(-[BMMomentsEventDataEventBundle bundleIncludesAnomalousEvent](self, "bundleIncludesAnomalousEvent"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isFiltered](self, "isFiltered"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventBundleBundleSuperTypeAsString(-[BMMomentsEventDataEventBundle bundleSuperType](self, "bundleSuperType"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventBundleBundleSubTypeAsString(-[BMMomentsEventDataEventBundle bundleSubType](self, "bundleSubType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataEventBundleSummarizationGranularityAsString(-[BMMomentsEventDataEventBundle summarizationGranularity](self, "summarizationGranularity"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle includedInSummaryBundleOnly](self, "includedInSummaryBundleOnly"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle subBundleIDs](self, "subBundleIDs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle subSuggestionIDs](self, "subSuggestionIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle firstCreationDate](self, "firstCreationDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle resources](self, "resources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle persons](self, "persons");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle mainPlace](self, "mainPlace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle otherPlaces](self, "otherPlaces");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle photoTraits](self, "photoTraits");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle clusterMetadata](self, "clusterMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle outlierMetadata](self, "outlierMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle bundleGoodnessScore](self, "bundleGoodnessScore");
  objc_msgSend(v6, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle distinctnessScore](self, "distinctnessScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle richnessScore](self, "richnessScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle engagementScore](self, "engagementScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundle heuristicsScore](self, "heuristicsScore");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle metadataForRank](self, "metadataForRank");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v27, "initWithFormat:", CFSTR("BMMomentsEventDataEventBundle with bundleIdentifier: %@, bundleStartDate: %@, bundleEndDate: %@, bundleCreationDate: %@, bundleExpirationDate: %@, bundleInterfaceType: %@, bundleSourceHealthExists: %@, bundleSourcePhotoExists: %@, bundleSourceProactiveExists: %@, bundleSourceRoutineExists: %@, bundlePromptLanguageFormat: %@, bundlePromptToneID: %@, bundlePromptParametersAvailability: %@, bundlePlaceType: %@, bundlePlaceUserType: %@, bundleBaseEventCateory: %@, bundleEventIDs: %@, bundleActionType: %@, backgroundActions: %@, bundleIsFamilyIncluded: %@, bundleTimeTag: %@, isBundleResourceTypeUnknown: %@, isBundleResourceTypeValueIncluded: %@, isBundleResourceTypePhotoAssetsIncluded: %@, isBundleResourceTypeMediaIncluded: %@, isBundleResourceTypeWebLinkIncluded: %@, isBundleResourceTypeInterenceTagIncluded: %@, bundlEngagement: %@, bundleVersion: %@, rankingVersion: %@, suggestionType: %@, suggestionTimestamp: %@, suggestionClientIdentifier: %@, suggestionViewContainerName: %@, suggestionViewVisibleTime: %@, appEntryEventType: %@, appEntryEventClientIdentifier: %@, appEntryEventTimestamp: %@, appEntryEventStartTime: %@, appEntryEventEndTime: %@, appEntryEventTotalCharacters: %@, appEntryEventAddedCharacters: %@, clientActivityEventType: %@, clientActivityEventClientIdentifier: %@, clientActivityEventTimestamp: %@, suggestionIdentifier: %@, photoSourceType: %@, photoLibraryType: %@, bundleSourcePostAnalyticsExists: %@, bundleSourcePDExists: %@, bundleSourceMotionExists: %@, bundleSourceBooksExists: %@, bundleSourceScreenTimeExists: %@, gaPRArray: %@, bundlePCount: %@, ranking: %@, labelConfidenceScore: %@, timeCorrelationScore: %@, callDuration: %@, interactionCount: %@, interactionType: %@, callPlace: %@, distanceFromHome: %@, homeAvailability: %@, workAvailability: %@, bundleVisitMapItemSource: %@, bundleVisitPlaceType: %@, bundleVisitPlaceLabelGranularity: %@, bundleIncludesAnomalousEvent: %@, isFiltered: %@, bundleSuperType: %@, bundleSubType: %@, isAggregatedAndSuppressed: %@, summarizationGranularity: %@, includedInSummaryBundleOnly: %@, subBundleIDs: %@, subSuggestionIDs: %@, firstCreationDate: %@, resources: %@, persons: %@, mainPlace: %@, otherPlaces: %@, photoTraits: %@, clusterMetadata: %@, outlierMetadata: %@, bundleGoodnessScore: %@, distinctnessScore: %@, richnessScore: %@, engagementScore: %@, heuristicsScore: %@, metadataForRank: %@"), v104, v103, v102, v101, v100, v99, v98, v97, v96, v95, v94, v93, v92, v91, v90, v89,
              v88,
              v87,
              v86,
              v85,
              v84,
              v83,
              v82,
              v81,
              v80,
              v79,
              v78,
              v77,
              v76,
              v75,
              v74,
              v73,
              v72,
              v71,
              v70,
              v69,
              v68,
              v67,
              v66,
              v65,
              v64,
              v63,
              v62,
              v61,
              v60,
              v59,
              v58,
              v57,
              v56,
              v55,
              v54,
              v53,
              v52,
              v51,
              v46,
              v50,
              v44,
              v49,
              v48,
              v47);

  return (NSString *)v28;
}

- (id)initByReadFrom:(id)a3
{
  id v4;
  BMMomentsEventDataEventBundle *v5;
  BMMomentsEventDataEventBundle *v6;
  BMMomentsEventDataEventBundle *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMMomentsEventDataEventBundle;
  v5 = -[BMEventBase init](&v9, sel_init);
  v6 = v5;
  if (v5 && !BMMomentsEventDataEventBundleReadFrom((uint64_t)v5, (uint64_t)v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_bundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_bundleStartDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_bundleEndDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_bundleCreationDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_bundleExpirationDate)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleSourceHealthExists)
    PBDataWriterWriteBOOLField();
  if (self->_hasBundleSourcePhotoExists)
    PBDataWriterWriteBOOLField();
  if (self->_hasBundleSourceProactiveExists)
    PBDataWriterWriteBOOLField();
  if (self->_hasBundleSourceRoutineExists)
    PBDataWriterWriteBOOLField();
  if (self->_bundlePromptLanguageFormat)
    PBDataWriterWriteStringField();
  if (self->_bundlePromptToneID)
    PBDataWriterWriteStringField();
  if (self->_hasBundlePromptParametersAvailability)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v5 = self->_bundleEventIDs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v89;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v89 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
    }
    while (v7);
  }

  if (self->_bundleActionType)
  {
    v87 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataAction writeTo:](self->_bundleActionType, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v10 = self->_backgroundActions;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v84;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v84 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v14);
        v87 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    }
    while (v12);
  }

  if (self->_hasBundleIsFamilyIncluded)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsBundleResourceTypeUnknown)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBundleResourceTypeValueIncluded)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBundleResourceTypePhotoAssetsIncluded)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBundleResourceTypeMediaIncluded)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBundleResourceTypeWebLinkIncluded)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBundleResourceTypeInterenceTagIncluded)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleVersion)
    PBDataWriterWriteDoubleField();
  if (self->_hasRankingVersion)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_suggestionTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_suggestionClientIdentifier)
    PBDataWriterWriteStringField();
  if (self->_suggestionViewContainerName)
    PBDataWriterWriteStringField();
  if (self->_hasSuggestionViewVisibleTime)
    PBDataWriterWriteFloatField();
  PBDataWriterWriteUint32Field();
  if (self->_appEntryEventClientIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_appEntryEventTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_appEntryEventStartTime)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_appEntryEventEndTime)
    PBDataWriterWriteDoubleField();
  if (self->_hasAppEntryEventTotalCharacters)
    PBDataWriterWriteInt32Field();
  if (self->_hasAppEntryEventAddedCharacters)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (self->_clientActivityEventClientIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_clientActivityEventTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_suggestionIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleSourcePostAnalyticsExists)
    PBDataWriterWriteBOOLField();
  if (self->_hasBundleSourcePDExists)
    PBDataWriterWriteBOOLField();
  if (self->_hasBundleSourceMotionExists)
    PBDataWriterWriteBOOLField();
  if (self->_hasBundleSourceBooksExists)
    PBDataWriterWriteBOOLField();
  if (self->_hasBundleSourceScreenTimeExists)
    PBDataWriterWriteBOOLField();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v16 = self->_gaPRArray;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v80;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v80 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v20);
        v87 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v21, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
    }
    while (v18);
  }

  if (self->_hasBundlePCount)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsFiltered)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsAggregatedAndSuppressed)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasIncludedInSummaryBundleOnly)
    PBDataWriterWriteBOOLField();
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v22 = self->_subBundleIDs;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v76;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v76 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteStringField();
        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
    }
    while (v24);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v27 = self->_subSuggestionIDs;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v72;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v72 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteStringField();
        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v71, v96, 16);
    }
    while (v29);
  }

  if (self->_hasRaw_firstCreationDate)
    PBDataWriterWriteDoubleField();
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v32 = self->_resources;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v68;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v68 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v36);
        v87 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v37, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v67, v95, 16);
    }
    while (v34);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v38 = self->_persons;
  v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v63, v94, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v64;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v64 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v42);
        v87 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v43, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v42;
      }
      while (v40 != v42);
      v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v63, v94, 16);
    }
    while (v40);
  }

  if (self->_mainPlace)
  {
    v87 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataEventBundlePlace writeTo:](self->_mainPlace, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v44 = self->_otherPlaces;
  v45 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v59, v93, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v60;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v60 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v48);
        v87 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v49, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v48;
      }
      while (v46 != v48);
      v46 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v59, v93, 16);
    }
    while (v46);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v50 = self->_photoTraits;
  v51 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v55, v92, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v56;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v56 != v53)
          objc_enumerationMutation(v50);
        PBDataWriterWriteStringField();
        ++v54;
      }
      while (v52 != v54);
      v52 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v55, v92, 16);
    }
    while (v52);
  }

  if (self->_clusterMetadata)
  {
    v87 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataEventBundleClusterMetadata writeTo:](self->_clusterMetadata, "writeTo:", v4, v55);
    PBDataWriterRecallMark();
  }
  if (self->_outlierMetadata)
  {
    v87 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataEventBundleOutlierMetadata writeTo:](self->_outlierMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasBundleGoodnessScore)
    PBDataWriterWriteDoubleField();
  if (self->_hasDistinctnessScore)
    PBDataWriterWriteDoubleField();
  if (self->_hasRichnessScore)
    PBDataWriterWriteDoubleField();
  if (self->_hasEngagementScore)
    PBDataWriterWriteDoubleField();
  if (self->_hasHeuristicsScore)
    PBDataWriterWriteDoubleField();
  if (self->_metadataForRank)
  {
    v87 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataEventBundleMetadataForRank writeTo:](self->_metadataForRank, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventDataEventBundle writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundle)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  BMMomentsEventDataEventBundle *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
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
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  id *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  id *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  id v89;
  void *v90;
  id *v91;
  id v92;
  uint64_t v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  BMMomentsEventDataEventBundle *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  void *v126;
  id v127;
  id v128;
  BMMomentsEventDataEventBundle *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  id v138;
  id v139;
  uint64_t v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t i;
  void *v150;
  id v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  void *v164;
  id v165;
  uint64_t v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t j;
  void *v175;
  id v176;
  BMMomentsEventDataAction *v177;
  BMMomentsEventDataAction *v178;
  id v179;
  uint64_t v180;
  void *v181;
  id v182;
  BMMomentsEventDataAction *v183;
  id v184;
  void *v185;
  id v186;
  uint64_t v187;
  id v188;
  id v189;
  void *v190;
  id v191;
  uint64_t v192;
  id v193;
  id v194;
  void *v195;
  id v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  id *v202;
  id v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  uint64_t v207;
  id v208;
  uint64_t v209;
  id v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  void *v215;
  id v216;
  uint64_t v217;
  id v218;
  void *v219;
  id v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  void *v224;
  uint64_t v225;
  void *v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  void *v232;
  uint64_t v233;
  void *v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  uint64_t v239;
  id v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  id v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  id v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  id v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  id v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  uint64_t v260;
  id v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  uint64_t v265;
  id v266;
  uint64_t v267;
  void *v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  void *v272;
  id v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  void *v277;
  id v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  uint64_t v283;
  void *v284;
  id v285;
  uint64_t v286;
  void *v287;
  id v288;
  id v289;
  void *v290;
  id v291;
  void *v292;
  id v293;
  uint64_t v294;
  void *v295;
  uint64_t v296;
  void *v297;
  uint64_t v298;
  void *v299;
  uint64_t v300;
  void *v301;
  id v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  id v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  id v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  id v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  id v318;
  void *v319;
  _BYTE *v320;
  void *v321;
  uint64_t v322;
  void *v323;
  uint64_t v324;
  void *v325;
  id v326;
  id v327;
  id v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  id v332;
  id v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  id v337;
  uint64_t v338;
  void *v339;
  uint64_t v340;
  void *v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  void *v345;
  uint64_t v346;
  void *v347;
  id v348;
  id v349;
  id v350;
  id v351;
  id v352;
  id v353;
  id v354;
  id v355;
  id v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  id v362;
  uint64_t v363;
  void *v364;
  uint64_t v365;
  void *v366;
  uint64_t v367;
  void *v368;
  id v369;
  id v370;
  id v371;
  void *v372;
  id v373;
  uint64_t v374;
  id v375;
  uint64_t v376;
  id v377;
  id v378;
  id v379;
  id v380;
  uint64_t v381;
  id v382;
  void *v383;
  id v384;
  void *v385;
  void *v386;
  int v387;
  void *v388;
  void *v389;
  void *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t k;
  void *v395;
  id v396;
  BMMomentsEventDataPR *v397;
  BMMomentsEventDataPR *v398;
  id v399;
  id v400;
  id v401;
  id v402;
  uint64_t v403;
  id v404;
  uint64_t v405;
  id v406;
  uint64_t v407;
  id v408;
  uint64_t v409;
  id v410;
  uint64_t v411;
  id v412;
  uint64_t v413;
  id v414;
  uint64_t v415;
  id v416;
  uint64_t v417;
  id v418;
  uint64_t v419;
  id v420;
  uint64_t v421;
  id v422;
  uint64_t v423;
  id v424;
  uint64_t v425;
  uint64_t v426;
  void *v427;
  uint64_t v428;
  id v429;
  uint64_t v430;
  id v431;
  uint64_t v432;
  id v433;
  uint64_t v434;
  id v435;
  uint64_t v436;
  id v437;
  id v438;
  id v439;
  id v440;
  id v441;
  id v442;
  id v443;
  id v444;
  id v445;
  id v446;
  uint64_t v447;
  id v448;
  id v449;
  uint64_t v450;
  id v451;
  id v452;
  uint64_t v453;
  id v454;
  id v455;
  uint64_t v456;
  id v457;
  id v458;
  uint64_t v459;
  id v460;
  id v461;
  uint64_t v462;
  id v463;
  uint64_t v464;
  id v465;
  uint64_t v466;
  id v467;
  uint64_t v468;
  id v469;
  id v470;
  uint64_t v471;
  id v472;
  id v473;
  uint64_t v474;
  id v475;
  uint64_t v476;
  id v477;
  uint64_t v478;
  id v479;
  uint64_t v480;
  id v481;
  void *v482;
  void *v483;
  id v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t m;
  void *v490;
  id v491;
  void *v492;
  void *v493;
  id v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  uint64_t v498;
  id v499;
  uint64_t v500;
  id v501;
  uint64_t v502;
  id v503;
  uint64_t v504;
  id v505;
  uint64_t v506;
  id v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t n;
  void *v513;
  id v514;
  id v515;
  uint64_t v516;
  id v517;
  uint64_t v518;
  id v519;
  uint64_t v520;
  id v521;
  uint64_t v522;
  uint64_t v523;
  void *v524;
  uint64_t v525;
  id v526;
  uint64_t v527;
  id v528;
  id v529;
  id v530;
  void *v531;
  void *v532;
  id v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t ii;
  void *v539;
  id v540;
  BMMomentsEventDataEventBundleResource *v541;
  BMMomentsEventDataEventBundleResource *v542;
  void *v543;
  void *v544;
  id v545;
  uint64_t v546;
  uint64_t v547;
  void *v548;
  uint64_t v549;
  id v550;
  uint64_t v551;
  id v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t jj;
  void *v558;
  BMMomentsEventDataEventBundlePlace *v559;
  BMMomentsEventDataEventBundlePerson *v560;
  BMMomentsEventDataEventBundlePerson *v561;
  void *v562;
  void *v563;
  id v564;
  uint64_t v565;
  uint64_t v566;
  void *v567;
  uint64_t v568;
  id v569;
  uint64_t v570;
  id v571;
  id v572;
  uint64_t v573;
  id v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t kk;
  void *v580;
  id v581;
  BMMomentsEventDataEventBundlePlace *v582;
  BMMomentsEventDataEventBundlePlace *v583;
  void *v584;
  void *v585;
  id v586;
  BMMomentsEventDataEventBundlePlace *v587;
  id v588;
  void *v589;
  id v590;
  uint64_t v591;
  id v592;
  uint64_t v593;
  uint64_t v594;
  void *v595;
  uint64_t v596;
  id v597;
  uint64_t v598;
  id v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  void *v605;
  id v606;
  void *v607;
  BMMomentsEventDataEventBundleMetadataForRank *v608;
  uint64_t v609;
  unsigned int v610;
  unsigned int v611;
  unsigned int v612;
  id v613;
  uint64_t v614;
  uint64_t v615;
  void *v616;
  uint64_t v617;
  id v618;
  uint64_t v619;
  id v621;
  BMMomentsEventDataEventBundleClusterMetadata *v622;
  id v623;
  void *v624;
  id v625;
  BMMomentsEventDataEventBundleOutlierMetadata *v626;
  id v627;
  void *v628;
  id v629;
  uint64_t v630;
  id v631;
  uint64_t v632;
  id v633;
  uint64_t v634;
  id v635;
  BMMomentsEventDataEventBundleMetadataForRank *v636;
  id v637;
  void *v638;
  id v639;
  uint64_t v640;
  id v641;
  uint64_t v642;
  id v643;
  uint64_t v644;
  id v645;
  uint64_t v646;
  id v647;
  uint64_t v648;
  void *v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  uint64_t v665;
  uint64_t v666;
  unsigned int v667;
  unsigned int v668;
  unsigned int v669;
  unsigned int v670;
  unsigned int v671;
  unsigned int v672;
  unsigned int v673;
  unsigned int v674;
  unsigned int v675;
  unsigned int v676;
  unsigned int v677;
  unsigned int v678;
  unsigned int v679;
  int v680;
  int v681;
  int v682;
  int v683;
  int v684;
  int v685;
  id v686;
  void *v687;
  id v688;
  void *v689;
  id v690;
  void *v691;
  id v692;
  void *v693;
  BMMomentsEventDataEventBundleOutlierMetadata *v694;
  void *v695;
  id v696;
  void *v697;
  BMMomentsEventDataEventBundleClusterMetadata *v698;
  id v699;
  id v700;
  id v701;
  void *v702;
  void *v703;
  id v704;
  BMMomentsEventDataEventBundlePlace *v705;
  id v706;
  id v707;
  void *v708;
  id v709;
  id v710;
  void *v711;
  void *v712;
  id v713;
  id v714;
  void *v715;
  void *v716;
  id v717;
  void *v718;
  id v719;
  id v720;
  id v721;
  id v722;
  void *v723;
  void *v724;
  id v725;
  id v726;
  id v727;
  id v728;
  id v729;
  void *v730;
  void *v731;
  id v732;
  id v733;
  void *v734;
  id v735;
  id v736;
  void *v737;
  void *v738;
  id v739;
  id v740;
  void *v741;
  id v742;
  void *v743;
  id v744;
  void *v745;
  void *v746;
  void *v747;
  id v748;
  void *v749;
  id v750;
  id v751;
  void *v752;
  id v753;
  void *v754;
  id v755;
  void *v756;
  void *v757;
  void *v758;
  void *v759;
  void *v760;
  void *v761;
  void *v762;
  void *v763;
  void *v764;
  id v765;
  void *v766;
  id v767;
  void *v768;
  id v769;
  void *v770;
  id v771;
  id v772;
  void *v773;
  void *v774;
  id v775;
  id v776;
  void *v777;
  id v778;
  void *v779;
  id v780;
  id v781;
  void *v782;
  void *v783;
  void *v784;
  void *v785;
  id v786;
  void *v787;
  id v788;
  void *v789;
  id v790;
  void *v791;
  id v792;
  void *v793;
  id v794;
  id v795;
  void *v796;
  void *v797;
  id v798;
  void *v799;
  id v800;
  void *v801;
  id v802;
  void *v803;
  id v804;
  void *v805;
  id v806;
  void *v807;
  id v808;
  void *v809;
  id v810;
  id v811;
  void *v812;
  id v813;
  void *v814;
  void *v815;
  void *v816;
  id v817;
  void *v818;
  id v819;
  id v820;
  void *v821;
  id v822;
  void *v823;
  id v824;
  void *v825;
  id v826;
  void *v827;
  id v828;
  void *v829;
  id v830;
  void *v831;
  void *v832;
  id v833;
  void *v834;
  void *v835;
  void *v836;
  void *v837;
  void *v838;
  void *v839;
  id v840;
  void *v841;
  id v842;
  BMMomentsEventDataAction *v843;
  id v844;
  void *v845;
  id v846;
  void *v847;
  id v848;
  id v849;
  void *v850;
  void *v851;
  void *v852;
  void *v853;
  id v854;
  void *v855;
  id v856;
  id v857;
  id v858;
  void *v859;
  id v860;
  void *v861;
  id *v862;
  id *v863;
  unsigned int v864;
  id v865;
  void *v866;
  id obj;
  id v868;
  void *v869;
  id *v870;
  id v871;
  void *v872;
  id v873;
  BMMomentsEventDataEventBundle *v874;
  id v875;
  void *v876;
  BMMomentsEventDataEventBundle *v877;
  unsigned int v878;
  id v879;
  uint64_t v880;
  uint64_t v881;
  uint64_t v882;
  uint64_t v883;
  void *v884;
  void *v885;
  void *v886;
  void *v887;
  id v888;
  void *v889;
  id v890;
  void *v891;
  id v892;
  id v893;
  id v894;
  __int128 v895;
  __int128 v896;
  __int128 v897;
  __int128 v898;
  id v899;
  __int128 v900;
  __int128 v901;
  __int128 v902;
  __int128 v903;
  id v904;
  id v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  id v910;
  __int128 v911;
  __int128 v912;
  __int128 v913;
  __int128 v914;
  __int128 v915;
  __int128 v916;
  __int128 v917;
  __int128 v918;
  __int128 v919;
  __int128 v920;
  __int128 v921;
  __int128 v922;
  id v923;
  __int128 v924;
  __int128 v925;
  __int128 v926;
  __int128 v927;
  id v928;
  __int128 v929;
  __int128 v930;
  __int128 v931;
  __int128 v932;
  id v933;
  __int128 v934;
  __int128 v935;
  __int128 v936;
  __int128 v937;
  uint64_t v938;
  BMMomentsEventDataEventBundleMetadataForRank *v939;
  uint64_t v940;
  void *v941;
  uint64_t v942;
  id v943;
  uint64_t v944;
  id v945;
  uint64_t v946;
  id v947;
  uint64_t v948;
  id v949;
  uint64_t v950;
  BMMomentsEventDataEventBundleOutlierMetadata *v951;
  uint64_t v952;
  BMMomentsEventDataEventBundleClusterMetadata *v953;
  uint64_t v954;
  BMMomentsEventDataEventBundleClusterMetadata *v955;
  uint64_t v956;
  BMMomentsEventDataEventBundleClusterMetadata *v957;
  _BYTE v958[128];
  uint64_t v959;
  void *v960;
  uint64_t v961;
  void *v962;
  uint64_t v963;
  void *v964;
  _BYTE v965[128];
  uint64_t v966;
  void *v967;
  uint64_t v968;
  BMMomentsEventDataEventBundlePlace *v969;
  uint64_t v970;
  BMMomentsEventDataEventBundlePlace *v971;
  uint64_t v972;
  BMMomentsEventDataEventBundlePlace *v973;
  _BYTE v974[128];
  uint64_t v975;
  void *v976;
  uint64_t v977;
  void *v978;
  uint64_t v979;
  void *v980;
  _BYTE v981[128];
  uint64_t v982;
  void *v983;
  uint64_t v984;
  id v985;
  uint64_t v986;
  void *v987;
  uint64_t v988;
  void *v989;
  _BYTE v990[128];
  uint64_t v991;
  void *v992;
  uint64_t v993;
  void *v994;
  uint64_t v995;
  void *v996;
  _BYTE v997[128];
  uint64_t v998;
  void *v999;
  uint64_t v1000;
  id v1001;
  uint64_t v1002;
  id v1003;
  uint64_t v1004;
  id v1005;
  uint64_t v1006;
  id v1007;
  uint64_t v1008;
  id v1009;
  uint64_t v1010;
  id v1011;
  uint64_t v1012;
  id v1013;
  uint64_t v1014;
  id v1015;
  uint64_t v1016;
  id v1017;
  uint64_t v1018;
  id v1019;
  uint64_t v1020;
  id v1021;
  uint64_t v1022;
  id v1023;
  uint64_t v1024;
  id v1025;
  uint64_t v1026;
  id v1027;
  uint64_t v1028;
  id v1029;
  uint64_t v1030;
  id v1031;
  uint64_t v1032;
  id v1033;
  uint64_t v1034;
  id v1035;
  uint64_t v1036;
  id v1037;
  uint64_t v1038;
  id v1039;
  uint64_t v1040;
  id v1041;
  uint64_t v1042;
  void *v1043;
  uint64_t v1044;
  void *v1045;
  _BYTE v1046[128];
  uint64_t v1047;
  void *v1048;
  uint64_t v1049;
  id v1050;
  uint64_t v1051;
  id v1052;
  uint64_t v1053;
  id v1054;
  uint64_t v1055;
  id v1056;
  uint64_t v1057;
  id v1058;
  uint64_t v1059;
  id v1060;
  uint64_t v1061;
  id v1062;
  uint64_t v1063;
  id v1064;
  uint64_t v1065;
  id v1066;
  uint64_t v1067;
  id v1068;
  uint64_t v1069;
  id v1070;
  uint64_t v1071;
  id v1072;
  uint64_t v1073;
  id v1074;
  uint64_t v1075;
  id v1076;
  uint64_t v1077;
  id v1078;
  uint64_t v1079;
  id v1080;
  uint64_t v1081;
  id v1082;
  uint64_t v1083;
  id v1084;
  uint64_t v1085;
  id v1086;
  uint64_t v1087;
  id v1088;
  uint64_t v1089;
  id v1090;
  uint64_t v1091;
  id v1092;
  uint64_t v1093;
  id v1094;
  uint64_t v1095;
  uint64_t v1096;
  uint64_t v1097;
  id v1098;
  uint64_t v1099;
  id v1100;
  uint64_t v1101;
  id v1102;
  uint64_t v1103;
  id v1104;
  uint64_t v1105;
  id v1106;
  uint64_t v1107;
  id v1108;
  uint64_t v1109;
  id v1110;
  uint64_t v1111;
  id v1112;
  uint64_t v1113;
  id v1114;
  uint64_t v1115;
  id v1116;
  uint64_t v1117;
  void *v1118;
  uint64_t v1119;
  void *v1120;
  _BYTE v1121[128];
  uint64_t v1122;
  void *v1123;
  uint64_t v1124;
  BMMomentsEventDataAction *v1125;
  uint64_t v1126;
  BMMomentsEventDataAction *v1127;
  uint64_t v1128;
  BMMomentsEventDataAction *v1129;
  _BYTE v1130[128];
  uint64_t v1131;
  void *v1132;
  uint64_t v1133;
  void *v1134;
  uint64_t v1135;
  id v1136;
  uint64_t v1137;
  void *v1138;
  uint64_t v1139;
  id v1140;
  uint64_t v1141;
  id v1142;
  uint64_t v1143;
  id v1144;
  uint64_t v1145;
  id v1146;
  uint64_t v1147;
  id v1148;
  uint64_t v1149;
  id v1150;
  uint64_t v1151;
  id v1152;
  uint64_t v1153;
  id *v1154;
  uint64_t v1155;
  id v1156;
  uint64_t v1157;
  void *v1158;
  uint64_t v1159;
  void *v1160;
  uint64_t v1161;
  void *v1162;
  uint64_t v1163;
  _QWORD v1164[4];

  v1164[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  v891 = (void *)v7;
  if (!v7 || (v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v888 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v888 = v8;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleStartDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
      v12 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v11, "doubleValue");
      v10 = (id)objc_msgSend(v12, "initWithTimeIntervalSince1970:");
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      v18 = v9;
      objc_msgSend(v11, "dateFromString:", v18);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleEndDate"));
      v19 = objc_claimAutoreleasedReturnValue();
      v886 = (void *)v19;
      if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v879 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
        v22 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v21, "doubleValue");
        v879 = (id)objc_msgSend(v22, "initWithTimeIntervalSince1970:");
LABEL_23:

        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        v23 = v20;
        objc_msgSend(v21, "dateFromString:", v23);
        v879 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v879 = v20;
LABEL_24:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleCreationDate"));
        v24 = objc_claimAutoreleasedReturnValue();
        v885 = v9;
        v887 = (void *)v24;
        if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v875 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = v25;
          v27 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v26, "doubleValue");
          v875 = (id)objc_msgSend(v27, "initWithTimeIntervalSince1970:");
LABEL_31:

          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          v28 = v25;
          objc_msgSend(v26, "dateFromString:", v28);
          v875 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v875 = v25;
LABEL_32:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleExpirationDate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v889 = v29;
          v874 = self;
          if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v873 = 0;
            goto LABEL_40;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = v29;
            v31 = objc_alloc(MEMORY[0x1E0C99D68]);
            objc_msgSend(v30, "doubleValue");
            v32 = v31;
            v29 = v889;
            v873 = (id)objc_msgSend(v32, "initWithTimeIntervalSince1970:");
LABEL_39:

            goto LABEL_40;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            v33 = v29;
            objc_msgSend(v30, "dateFromString:", v33);
            v873 = (id)objc_claimAutoreleasedReturnValue();

            v29 = v889;
            goto LABEL_39;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v873 = v29;
LABEL_40:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleInterfaceType"));
            v34 = objc_claimAutoreleasedReturnValue();
            v876 = (void *)v34;
            if (!v34 || (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v36 = 0;
              goto LABEL_48;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = v35;
LABEL_47:

              v29 = v889;
LABEL_48:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourceHealthExists"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v870 = 0;
                goto LABEL_51;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v870 = v39;
LABEL_51:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourcePhotoExists"));
                v40 = objc_claimAutoreleasedReturnValue();
                v872 = (void *)v40;
                if (!v40 || (v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v871 = 0;
                  goto LABEL_54;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v871 = v41;
LABEL_54:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourceProactiveExists"));
                  v42 = objc_claimAutoreleasedReturnValue();
                  v869 = (void *)v42;
                  if (!v42 || (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v868 = 0;
                    goto LABEL_57;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v868 = v43;
LABEL_57:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourceRoutineExists"));
                    v44 = objc_claimAutoreleasedReturnValue();
                    v866 = (void *)v44;
                    if (!v44 || (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v865 = 0;
                      goto LABEL_60;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v865 = v45;
LABEL_60:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePromptLanguageFormat"));
                      v46 = objc_claimAutoreleasedReturnValue();
                      v857 = v10;
                      v861 = (void *)v46;
                      v862 = a4;
                      if (!v46 || (v47 = (void *)v46, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v860 = 0;
                        goto LABEL_63;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v860 = v47;
LABEL_63:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePromptToneID"));
                        v48 = objc_claimAutoreleasedReturnValue();
                        v859 = (void *)v48;
                        if (!v48 || (v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v858 = 0;
                          goto LABEL_66;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v858 = v49;
LABEL_66:
                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePromptParametersAvailability"));
                          v50 = objc_claimAutoreleasedReturnValue();
                          v855 = (void *)v50;
                          if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v856 = 0;
                            goto LABEL_69;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v856 = v51;
LABEL_69:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePlaceType"));
                            v52 = objc_claimAutoreleasedReturnValue();
                            v853 = (void *)v52;
                            if (!v52 || (v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v854 = 0;
                              goto LABEL_123;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v854 = v53;
LABEL_122:

LABEL_123:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePlaceUserType"));
                              v125 = objc_claimAutoreleasedReturnValue();
                              v851 = (void *)v125;
                              if (!v125 || (v126 = (void *)v125, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v852 = 0;
LABEL_135:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleBaseEventCateory"));
                                v140 = objc_claimAutoreleasedReturnValue();
                                v849 = v6;
                                v850 = (void *)v140;
                                if (v140
                                  && (v141 = (void *)v140, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v848 = v141;
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v862)
                                      {
                                        v196 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v197 = *MEMORY[0x1E0D025B8];
                                        v1133 = *MEMORY[0x1E0CB2D50];
                                        v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleBaseEventCateory"));
                                        v1134 = v143;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1134, &v1133, 1);
                                        v884 = (void *)objc_claimAutoreleasedReturnValue();
                                        v848 = 0;
                                        v877 = 0;
                                        *v862 = (id)objc_msgSend(v196, "initWithDomain:code:userInfo:", v197, 2);
                                        v59 = v879;
                                        v60 = v875;
                                        v29 = v889;
                                        v61 = v873;
                                        v98 = v859;
                                        v16 = v888;
                                        goto LABEL_1111;
                                      }
                                      v848 = 0;
                                      v877 = 0;
                                      v59 = v879;
                                      v60 = v875;
                                      v29 = v889;
                                      v61 = v873;
                                      v98 = v859;
                                      v16 = v888;
                                      goto LABEL_1113;
                                    }
                                    v142 = v141;
                                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventCategoryTypeFromString(v142));
                                    v848 = (id)objc_claimAutoreleasedReturnValue();

                                  }
                                }
                                else
                                {
                                  v848 = 0;
                                }
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleEventIDs"));
                                v143 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                v144 = (void *)objc_claimAutoreleasedReturnValue();
                                v145 = objc_msgSend(v143, "isEqual:", v144);

                                v98 = v859;
                                if (v145)
                                {
                                  v847 = v36;

                                  v143 = 0;
                                }
                                else
                                {
                                  if (v143)
                                  {
                                    objc_opt_class();
                                    v29 = v889;
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v862)
                                      {
                                        v165 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v166 = *MEMORY[0x1E0D025B8];
                                        v1131 = *MEMORY[0x1E0CB2D50];
                                        v884 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("bundleEventIDs"));
                                        v1132 = v884;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1132, &v1131, 1);
                                        v167 = v36;
                                        v168 = objc_claimAutoreleasedReturnValue();
                                        v169 = v166;
                                        v29 = v889;
                                        v877 = 0;
                                        *v862 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v169, 2, v168);
                                        v164 = (void *)v168;
                                        v36 = v167;
                                        v59 = v879;
                                        v60 = v875;
                                        v61 = v873;
                                        v16 = v888;
                                        goto LABEL_1110;
                                      }
                                      v877 = 0;
                                      v59 = v879;
                                      v60 = v875;
                                      v61 = v873;
                                      v16 = v888;
                                      goto LABEL_1112;
                                    }
                                    v847 = v36;
LABEL_151:
                                    v884 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v143, "count"));
                                    v934 = 0u;
                                    v935 = 0u;
                                    v936 = 0u;
                                    v937 = 0u;
                                    obj = v143;
                                    v146 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v934, v1130, 16);
                                    if (v146)
                                    {
                                      v147 = v146;
                                      v148 = *(_QWORD *)v935;
                                      v98 = v859;
                                      do
                                      {
                                        for (i = 0; i != v147; ++i)
                                        {
                                          if (*(_QWORD *)v935 != v148)
                                            objc_enumerationMutation(obj);
                                          v150 = *(void **)(*((_QWORD *)&v934 + 1) + 8 * i);
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            if (v862)
                                            {
                                              v157 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v158 = *MEMORY[0x1E0D025B8];
                                              v1128 = *MEMORY[0x1E0CB2D50];
                                              v843 = (BMMomentsEventDataAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("bundleEventIDs"));
                                              v1129 = v843;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1129, &v1128, 1);
                                              v159 = objc_claimAutoreleasedReturnValue();
                                              v160 = v157;
                                              v161 = v158;
LABEL_169:
                                              v846 = (id)v159;
                                              v59 = v879;
                                              v60 = v875;
                                              v61 = v873;
                                              v877 = 0;
                                              *v862 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, 2);
                                              v143 = obj;
                                              v844 = obj;
                                              v16 = v888;
                                              v29 = v889;
                                              v36 = v847;
                                              v98 = v859;
                                              goto LABEL_1109;
                                            }
LABEL_170:
                                            v877 = 0;
                                            v143 = obj;
                                            v164 = obj;
                                            v16 = v888;
                                            v59 = v879;
                                            v60 = v875;
                                            v29 = v889;
                                            v61 = v873;
                                            v36 = v847;
                                            v98 = v859;
                                            goto LABEL_1110;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (v862)
                                            {
                                              v162 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v163 = *MEMORY[0x1E0D025B8];
                                              v1126 = *MEMORY[0x1E0CB2D50];
                                              v843 = (BMMomentsEventDataAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleEventIDs"));
                                              v1127 = v843;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1127, &v1126, 1);
                                              v159 = objc_claimAutoreleasedReturnValue();
                                              v160 = v162;
                                              v161 = v163;
                                              goto LABEL_169;
                                            }
                                            goto LABEL_170;
                                          }
                                          v151 = v150;
                                          objc_msgSend(v884, "addObject:", v151);

                                        }
                                        v147 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v934, v1130, 16);
                                        v6 = v849;
                                        v29 = v889;
                                      }
                                      while (v147);
                                    }
                                    v143 = obj;

                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleActionType"));
                                    v152 = objc_claimAutoreleasedReturnValue();
                                    v844 = (id)v152;
                                    if (!v152
                                      || (v153 = (void *)v152, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v843 = 0;
LABEL_163:
                                      v36 = v847;
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundActions"));
                                      v154 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                      v155 = (void *)objc_claimAutoreleasedReturnValue();
                                      v156 = objc_msgSend(v154, "isEqual:", v155);

                                      if (v156)
                                      {

                                        v154 = 0;
                                      }
                                      else if (v154)
                                      {
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                        {
                                          v846 = v154;
                                          if (v862)
                                          {
                                            v210 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v211 = *MEMORY[0x1E0D025B8];
                                            v1122 = *MEMORY[0x1E0CB2D50];
                                            v845 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("backgroundActions"));
                                            v1123 = v845;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1123, &v1122, 1);
                                            v212 = objc_claimAutoreleasedReturnValue();
                                            v877 = 0;
                                            *v862 = (id)objc_msgSend(v210, "initWithDomain:code:userInfo:", v211, 2, v212);
                                            v213 = (void *)v212;
                                            v36 = v847;
                                            v16 = v888;
                                            v59 = v879;
                                            v60 = v875;
                                            v29 = v889;
                                            v61 = v873;
                                            goto LABEL_1108;
                                          }
                                          v877 = 0;
                                          v16 = v888;
                                          v59 = v879;
                                          v60 = v875;
                                          v29 = v889;
                                          v61 = v873;
                                          goto LABEL_1109;
                                        }
                                      }
                                      v845 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v154, "count"));
                                      v929 = 0u;
                                      v930 = 0u;
                                      v931 = 0u;
                                      v932 = 0u;
                                      v170 = v154;
                                      v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v929, v1121, 16);
                                      v846 = v170;
                                      if (!v171)
                                        goto LABEL_189;
                                      v172 = v171;
                                      v173 = *(_QWORD *)v930;
                                      while (1)
                                      {
                                        for (j = 0; j != v172; ++j)
                                        {
                                          if (*(_QWORD *)v930 != v173)
                                            objc_enumerationMutation(v846);
                                          v175 = *(void **)(*((_QWORD *)&v929 + 1) + 8 * j);
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v202 = v862;
                                            if (v862)
                                            {
                                              v203 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v204 = *MEMORY[0x1E0D025B8];
                                              v1119 = *MEMORY[0x1E0CB2D50];
                                              v841 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("backgroundActions"));
                                              v1120 = v841;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1120, &v1119, 1);
                                              v205 = objc_claimAutoreleasedReturnValue();
                                              v206 = v203;
                                              v207 = v204;
                                              goto LABEL_220;
                                            }
LABEL_229:
                                            v877 = 0;
                                            v213 = v846;
                                            v16 = v888;
                                            v59 = v879;
                                            v60 = v875;
                                            v29 = v889;
                                            v61 = v873;
                                            v98 = v859;
                                            v143 = obj;
                                            v36 = v847;
                                            goto LABEL_1108;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            v202 = v862;
                                            if (!v862)
                                              goto LABEL_229;
                                            v208 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                            v209 = *MEMORY[0x1E0D025B8];
                                            v1117 = *MEMORY[0x1E0CB2D50];
                                            v841 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("backgroundActions"));
                                            v1118 = v841;
                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1118, &v1117, 1);
                                            v205 = objc_claimAutoreleasedReturnValue();
                                            v206 = v208;
                                            v207 = v209;
LABEL_220:
                                            v842 = (id)v205;
                                            v877 = 0;
                                            *v202 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v207, 2);
LABEL_224:
                                            v840 = v846;
                                            v16 = v888;
                                            v59 = v879;
                                            v60 = v875;
                                            v29 = v889;
                                            v61 = v873;
                                            v98 = v859;
                                            v143 = obj;
                                            v36 = v847;
                                            goto LABEL_1106;
                                          }
                                          v176 = v175;
                                          v177 = [BMMomentsEventDataAction alloc];
                                          v928 = 0;
                                          v178 = -[BMMomentsEventDataAction initWithJSONDictionary:error:](v177, "initWithJSONDictionary:error:", v176, &v928);
                                          v179 = v928;
                                          if (v179)
                                          {
                                            v842 = v179;
                                            v841 = v176;
                                            if (v862)
                                              *v862 = objc_retainAutorelease(v179);

                                            v877 = 0;
                                            goto LABEL_224;
                                          }
                                          objc_msgSend(v845, "addObject:", v178);

                                        }
                                        v170 = v846;
                                        v172 = objc_msgSend(v846, "countByEnumeratingWithState:objects:count:", &v929, v1121, 16);
                                        if (!v172)
                                        {
LABEL_189:

                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIsFamilyIncluded"));
                                          v180 = objc_claimAutoreleasedReturnValue();
                                          v841 = (void *)v180;
                                          if (v180)
                                          {
                                            v181 = (void *)v180;
                                            objc_opt_class();
                                            v98 = v859;
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v840 = 0;
                                              v29 = v889;
                                              goto LABEL_232;
                                            }
                                            objc_opt_class();
                                            v143 = obj;
                                            v36 = v847;
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v840 = v181;
                                              v29 = v889;
                                              goto LABEL_233;
                                            }
                                            v16 = v888;
                                            if (v862)
                                            {
                                              v216 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v217 = *MEMORY[0x1E0D025B8];
                                              v1115 = *MEMORY[0x1E0CB2D50];
                                              v218 = objc_alloc(MEMORY[0x1E0CB3940]);
                                              v660 = objc_opt_class();
                                              v219 = v218;
                                              v16 = v888;
                                              v842 = (id)objc_msgSend(v219, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v660, CFSTR("bundleIsFamilyIncluded"));
                                              v1116 = v842;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1116, &v1115, 1);
                                              v98 = v859;
                                              v835 = (void *)objc_claimAutoreleasedReturnValue();
                                              v840 = 0;
                                              v877 = 0;
                                              *v862 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v217, 2);
                                              v59 = v879;
                                              v60 = v875;
                                              v29 = v889;
                                              v61 = v873;

                                              goto LABEL_1106;
                                            }
                                            v840 = 0;
                                            v877 = 0;
                                            v59 = v879;
                                            v60 = v875;
                                            v29 = v889;
                                            v61 = v873;
LABEL_1107:

                                            v213 = v840;
LABEL_1108:

LABEL_1109:
                                            v164 = v844;
LABEL_1110:

LABEL_1111:
                                            v6 = v849;
LABEL_1112:

LABEL_1113:
                                            a4 = v870;
LABEL_1114:

                                            goto LABEL_1115;
                                          }
                                          v840 = 0;
                                          v29 = v889;
                                          v98 = v859;
LABEL_232:
                                          v143 = obj;
                                          v36 = v847;
LABEL_233:
                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleTimeTag"));
                                          v214 = objc_claimAutoreleasedReturnValue();
                                          v834 = (void *)v214;
                                          if (!v214
                                            || (v215 = (void *)v214,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v842 = 0;
LABEL_248:
                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBundleResourceTypeUnknown"));
                                            v221 = objc_claimAutoreleasedReturnValue();
                                            v832 = (void *)v221;
                                            if (!v221
                                              || (v222 = (void *)v221,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              v833 = 0;
LABEL_251:
                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBundleResourceTypeValueIncluded"));
                                              v223 = objc_claimAutoreleasedReturnValue();
                                              v831 = (void *)v223;
                                              if (!v223
                                                || (v224 = (void *)v223,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                v830 = 0;
LABEL_254:
                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBundleResourceTypePhotoAssetsIncluded"));
                                                v225 = objc_claimAutoreleasedReturnValue();
                                                v829 = (void *)v225;
                                                if (!v225
                                                  || (v226 = (void *)v225,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v828 = 0;
LABEL_257:
                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBundleResourceTypeMediaIncluded"));
                                                  v227 = objc_claimAutoreleasedReturnValue();
                                                  v827 = (void *)v227;
                                                  if (!v227
                                                    || (v228 = (void *)v227,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    v826 = 0;
LABEL_260:
                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBundleResourceTypeWebLinkIncluded"));
                                                    v229 = objc_claimAutoreleasedReturnValue();
                                                    v825 = (void *)v229;
                                                    if (!v229
                                                      || (v230 = (void *)v229,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      v824 = 0;
LABEL_263:
                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBundleResourceTypeInterenceTagIncluded"));
                                                      v231 = objc_claimAutoreleasedReturnValue();
                                                      v823 = (void *)v231;
                                                      if (!v231
                                                        || (v232 = (void *)v231,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        v822 = 0;
LABEL_266:
                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlEngagement"));
                                                        v233 = objc_claimAutoreleasedReturnValue();
                                                        v821 = (void *)v233;
                                                        if (!v233
                                                          || (v234 = (void *)v233,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          v820 = 0;
LABEL_303:
                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleVersion"));
                                                          v267 = objc_claimAutoreleasedReturnValue();
                                                          v818 = (void *)v267;
                                                          if (!v267
                                                            || (v268 = (void *)v267,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            v819 = 0;
LABEL_306:
                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankingVersion"));
                                                            v269 = objc_claimAutoreleasedReturnValue();
                                                            v816 = (void *)v269;
                                                            if (!v269
                                                              || (v270 = (void *)v269,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              v817 = 0;
LABEL_309:
                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionType"));
                                                              v271 = objc_claimAutoreleasedReturnValue();
                                                              v815 = (void *)v271;
                                                              if (!v271
                                                                || (v272 = (void *)v271,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v811 = 0;
LABEL_329:
                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionTimestamp"));
                                                                v286 = objc_claimAutoreleasedReturnValue();
                                                                v814 = (void *)v286;
                                                                if (!v286
                                                                  || (v287 = (void *)v286,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  v813 = 0;
LABEL_339:
                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionClientIdentifier"));
                                                                  v294 = objc_claimAutoreleasedReturnValue();
                                                                  v812 = (void *)v294;
                                                                  if (!v294
                                                                    || (v295 = (void *)v294,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    v810 = 0;
LABEL_342:
                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionViewContainerName"));
                                                                    v296 = objc_claimAutoreleasedReturnValue();
                                                                    v809 = (void *)v296;
                                                                    if (!v296
                                                                      || (v297 = (void *)v296,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      v808 = 0;
LABEL_345:
                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionViewVisibleTime"));
                                                                      v298 = objc_claimAutoreleasedReturnValue();
                                                                      v807 = (void *)v298;
                                                                      if (!v298
                                                                        || (v299 = (void *)v298,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        v806 = 0;
LABEL_348:
                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventType"));
                                                                        v300 = objc_claimAutoreleasedReturnValue();
                                                                        v805 = (void *)v300;
                                                                        if (!v300
                                                                          || (v301 = (void *)v300,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          v804 = 0;
LABEL_375:
                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventClientIdentifier"));
                                                                          v322 = objc_claimAutoreleasedReturnValue();
                                                                          v803 = (void *)v322;
                                                                          if (!v322
                                                                            || (v323 = (void *)v322,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            v802 = 0;
LABEL_378:
                                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventTimestamp"));
                                                                            v324 = objc_claimAutoreleasedReturnValue();
                                                                            v801 = (void *)v324;
                                                                            v847 = v36;
                                                                            if (!v324
                                                                              || (v325 = (void *)v324,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              v800 = 0;
LABEL_398:
                                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventStartTime"));
                                                                              v338 = objc_claimAutoreleasedReturnValue();
                                                                              v799 = (void *)v338;
                                                                              if (!v338
                                                                                || (v339 = (void *)v338,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                v798 = 0;
LABEL_401:
                                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventEndTime"));
                                                                                v340 = objc_claimAutoreleasedReturnValue();
                                                                                v797 = (void *)v340;
                                                                                if (!v340
                                                                                  || (v341 = (void *)v340,
                                                                                      objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  v795 = 0;
LABEL_404:
                                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventTotalCharacters"));
                                                                                  v342 = objc_claimAutoreleasedReturnValue();
                                                                                  v796 = (void *)v342;
                                                                                  if (v342
                                                                                    && (v343 = (void *)v342,
                                                                                        objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v794 = v343;
                                                                                      goto LABEL_407;
                                                                                    }
                                                                                    if (!v862)
                                                                                    {
                                                                                      v794 = 0;
                                                                                      v877 = 0;
                                                                                      v59 = v879;
                                                                                      v60 = v875;
                                                                                      v29 = v889;
                                                                                      v61 = v873;
                                                                                      v98 = v859;
                                                                                      v284 = v811;
                                                                                      v16 = v888;
                                                                                      goto LABEL_1085;
                                                                                    }
                                                                                    v356 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                    v357 = *MEMORY[0x1E0D025B8];
                                                                                    v1073 = *MEMORY[0x1E0CB2D50];
                                                                                    v792 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("appEntryEventTotalCharacters"));
                                                                                    v1074 = v792;
                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1074, &v1073, 1);
                                                                                    v793 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v794 = 0;
                                                                                    v877 = 0;
                                                                                    *v862 = (id)objc_msgSend(v356, "initWithDomain:code:userInfo:", v357, 2);
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v794 = 0;
LABEL_407:
                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEventAddedCharacters"));
                                                                                    v344 = objc_claimAutoreleasedReturnValue();
                                                                                    v793 = (void *)v344;
                                                                                    if (!v344
                                                                                      || (v345 = (void *)v344,
                                                                                          objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      v792 = 0;
LABEL_410:
                                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientActivityEventType"));
                                                                                      v346 = objc_claimAutoreleasedReturnValue();
                                                                                      v791 = (void *)v346;
                                                                                      if (v346
                                                                                        && (v347 = (void *)v346,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v790 = v347;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                          {
                                                                                            if (v862)
                                                                                            {
                                                                                              v404 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                              v405 = *MEMORY[0x1E0D025B8];
                                                                                              v1069 = *MEMORY[0x1E0CB2D50];
                                                                                              v788 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("clientActivityEventType"));
                                                                                              v1070 = v788;
                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1070, &v1069, 1);
                                                                                              v789 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              v790 = 0;
                                                                                              v877 = 0;
                                                                                              *v862 = (id)objc_msgSend(v404, "initWithDomain:code:userInfo:", v405, 2);
                                                                                              v16 = v888;
                                                                                              v59 = v879;
                                                                                              v60 = v875;
                                                                                              v29 = v889;
                                                                                              v61 = v873;
                                                                                              v98 = v859;
                                                                                              v143 = obj;
                                                                                              v284 = v811;
                                                                                              goto LABEL_1082;
                                                                                            }
                                                                                            v790 = 0;
                                                                                            v877 = 0;
                                                                                            v16 = v888;
                                                                                            v59 = v879;
                                                                                            v60 = v875;
                                                                                            v29 = v889;
                                                                                            v61 = v873;
                                                                                            v98 = v859;
                                                                                            v143 = obj;
                                                                                            v284 = v811;
                                                                                            goto LABEL_1083;
                                                                                          }
                                                                                          v347 = v791;
                                                                                          v362 = v791;
                                                                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataClientActivityEventTypeFromString(v362));
                                                                                          v790 = (id)objc_claimAutoreleasedReturnValue();

                                                                                          v143 = obj;
                                                                                        }

                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v790 = 0;
                                                                                      }
                                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientActivityEventClientIdentifier"));
                                                                                      v363 = objc_claimAutoreleasedReturnValue();
                                                                                      v789 = (void *)v363;
                                                                                      if (v363
                                                                                        && (v364 = (void *)v363,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                        {
                                                                                          if (v862)
                                                                                          {
                                                                                            v373 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                            v374 = *MEMORY[0x1E0D025B8];
                                                                                            v1067 = *MEMORY[0x1E0CB2D50];
                                                                                            v786 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientActivityEventClientIdentifier"));
                                                                                            v1068 = v786;
                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1068, &v1067, 1);
                                                                                            v787 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v788 = 0;
                                                                                            v877 = 0;
                                                                                            *v862 = (id)objc_msgSend(v373, "initWithDomain:code:userInfo:", v374, 2);
                                                                                            v59 = v879;
                                                                                            v60 = v875;
                                                                                            v29 = v889;
                                                                                            v61 = v873;
                                                                                            v98 = v859;
                                                                                            v284 = v811;
                                                                                            v16 = v888;
                                                                                            goto LABEL_1081;
                                                                                          }
                                                                                          v788 = 0;
                                                                                          v877 = 0;
                                                                                          v59 = v879;
                                                                                          v60 = v875;
                                                                                          v29 = v889;
                                                                                          v61 = v873;
                                                                                          v98 = v859;
                                                                                          v284 = v811;
                                                                                          v16 = v888;
                                                                                          goto LABEL_1082;
                                                                                        }
                                                                                        v788 = v364;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v788 = 0;
                                                                                      }
                                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientActivityEventTimestamp"));
                                                                                      v365 = objc_claimAutoreleasedReturnValue();
                                                                                      v838 = v39;
                                                                                      v787 = (void *)v365;
                                                                                      if (v365
                                                                                        && (v366 = (void *)v365,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v369 = v366;
                                                                                          v370 = objc_alloc(MEMORY[0x1E0C99D68]);
                                                                                          objc_msgSend(v369, "doubleValue");
                                                                                          v786 = (id)objc_msgSend(v370, "initWithTimeIntervalSince1970:");

                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                          {
                                                                                            v377 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                                                                            v378 = v366;
                                                                                            objc_msgSend(v377, "dateFromString:", v378);
                                                                                            v786 = (id)objc_claimAutoreleasedReturnValue();

                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                            {
                                                                                              if (v862)
                                                                                              {
                                                                                                v433 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                v434 = *MEMORY[0x1E0D025B8];
                                                                                                v1065 = *MEMORY[0x1E0CB2D50];
                                                                                                v780 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("clientActivityEventTimestamp"));
                                                                                                v1066 = v780;
                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1066, &v1065, 1);
                                                                                                v782 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                v786 = 0;
                                                                                                v877 = 0;
                                                                                                *v862 = (id)objc_msgSend(v433, "initWithDomain:code:userInfo:", v434, 2);
                                                                                                v16 = v888;
                                                                                                v59 = v879;
                                                                                                v60 = v875;
                                                                                                v29 = v889;
                                                                                                v61 = v873;
                                                                                                v98 = v859;
                                                                                                v143 = obj;
                                                                                                v284 = v811;
                                                                                                goto LABEL_1080;
                                                                                              }
                                                                                              v786 = 0;
                                                                                              v877 = 0;
                                                                                              v16 = v888;
                                                                                              v59 = v879;
                                                                                              v60 = v875;
                                                                                              v29 = v889;
                                                                                              v61 = v873;
                                                                                              v98 = v859;
                                                                                              v143 = obj;
                                                                                              v284 = v811;
                                                                                              goto LABEL_1081;
                                                                                            }
                                                                                            v786 = v787;
                                                                                          }
                                                                                          v6 = v849;
                                                                                          v143 = obj;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v786 = 0;
                                                                                      }
                                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionIdentifier"));
                                                                                      v367 = objc_claimAutoreleasedReturnValue();
                                                                                      v782 = (void *)v367;
                                                                                      if (v367
                                                                                        && (v368 = (void *)v367,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                        {
                                                                                          if (v862)
                                                                                          {
                                                                                            v380 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                            v381 = *MEMORY[0x1E0D025B8];
                                                                                            v1063 = *MEMORY[0x1E0CB2D50];
                                                                                            v778 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestionIdentifier"));
                                                                                            v1064 = v778;
                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1064, &v1063, 1);
                                                                                            v785 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v780 = 0;
                                                                                            v877 = 0;
                                                                                            *v862 = (id)objc_msgSend(v380, "initWithDomain:code:userInfo:", v381, 2);
                                                                                            v59 = v879;
                                                                                            v60 = v875;
                                                                                            v29 = v889;
                                                                                            v61 = v873;
                                                                                            v98 = v859;
                                                                                            v284 = v811;
                                                                                            v16 = v888;
                                                                                            goto LABEL_1079;
                                                                                          }
                                                                                          v780 = 0;
                                                                                          v877 = 0;
                                                                                          v59 = v879;
                                                                                          v60 = v875;
                                                                                          v29 = v889;
                                                                                          v61 = v873;
                                                                                          v98 = v859;
                                                                                          v284 = v811;
                                                                                          v16 = v888;
                                                                                          goto LABEL_1080;
                                                                                        }
                                                                                        v780 = v368;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v780 = 0;
                                                                                      }
                                                                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photoSourceType"));
                                                                                      v785 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      if (!v785
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        v778 = 0;
LABEL_485:
                                                                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photoLibraryType"));
                                                                                        v779 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        if (!v779
                                                                                          || (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          v776 = 0;
LABEL_493:
                                                                                          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourcePostAnalyticsExists"));
                                                                                          v777 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          if (!v777
                                                                                            || (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            v775 = 0;
LABEL_496:
                                                                                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourcePDExists"));
                                                                                            v774 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            if (!v774
                                                                                              || (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                                            {
                                                                                              v772 = 0;
LABEL_499:
                                                                                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourceMotionExists"));
                                                                                              v773 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              if (!v773
                                                                                                || (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                                              {
                                                                                                v771 = 0;
LABEL_502:
                                                                                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourceBooksExists"));
                                                                                                v770 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                if (!v770 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                {
                                                                                                  v769 = 0;
LABEL_505:
                                                                                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSourceScreenTimeExists"));
                                                                                                  v768 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  if (!v768 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                  {
                                                                                                    v767 = 0;
                                                                                                    goto LABEL_508;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                  {
                                                                                                    v767 = v768;
LABEL_508:
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:");
                                                                                                    v385 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                                                    v386 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v387 = objc_msgSend(v385, "isEqual:", v386);

                                                                                                    v388 = v6;
                                                                                                    if (v387)
                                                                                                    {

                                                                                                      goto LABEL_519;
                                                                                                    }
                                                                                                    v781 = v385;
                                                                                                    if (v385)
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          v431 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v432 = *MEMORY[0x1E0D025B8];
                                                                                                          v1047 = *MEMORY[0x1E0CB2D50];
                                                                                                          v783 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("gaPRArray"));
                                                                                                          v1048 = v783;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1048, &v1047, 1);
                                                                                                          v400 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                          v877 = 0;
                                                                                                          *v862 = (id)objc_msgSend(v431, "initWithDomain:code:userInfo:", v432, 2, v400);
                                                                                                          goto LABEL_1070;
                                                                                                        }
                                                                                                        v877 = 0;
                                                                                                        v59 = v879;
                                                                                                        v60 = v875;
                                                                                                        v29 = v889;
                                                                                                        v61 = v873;
                                                                                                        v39 = v838;
                                                                                                        v98 = v859;
                                                                                                        v143 = obj;
                                                                                                        v284 = v811;
                                                                                                        goto LABEL_1072;
                                                                                                      }
                                                                                                      v390 = v385;
                                                                                                    }
                                                                                                    else
                                                                                                    {
LABEL_519:
                                                                                                      v390 = 0;
                                                                                                    }
                                                                                                    v783 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v390, "count"));
                                                                                                    v924 = 0u;
                                                                                                    v925 = 0u;
                                                                                                    v926 = 0u;
                                                                                                    v927 = 0u;
                                                                                                    v781 = v390;
                                                                                                    v391 = objc_msgSend(v781, "countByEnumeratingWithState:objects:count:", &v924, v1046, 16);
                                                                                                    if (v391)
                                                                                                    {
                                                                                                      v392 = v391;
                                                                                                      v393 = *(_QWORD *)v925;
                                                                                                      do
                                                                                                      {
                                                                                                        for (k = 0;
                                                                                                              k != v392;
                                                                                                              ++k)
                                                                                                        {
                                                                                                          if (*(_QWORD *)v925 != v393)
                                                                                                            objc_enumerationMutation(v781);
                                                                                                          v395 = *(void **)(*((_QWORD *)&v924 + 1) + 8 * k);
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              v424 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                              v425 = *MEMORY[0x1E0D025B8];
                                                                                                              v1044 = *MEMORY[0x1E0CB2D50];
                                                                                                              v766 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("gaPRArray"));
                                                                                                              v1045 = v766;
                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1045, &v1044, 1);
                                                                                                              v426 = objc_claimAutoreleasedReturnValue();
                                                                                                              v427 = v424;
                                                                                                              v428 = v425;
                                                                                                              goto LABEL_578;
                                                                                                            }
LABEL_587:
                                                                                                            v877 = 0;
                                                                                                            v400 = v781;
LABEL_1070:
                                                                                                            v59 = v879;
                                                                                                            v60 = v875;
                                                                                                            v61 = v873;
                                                                                                            v98 = v859;
                                                                                                            v143 = obj;
                                                                                                            v284 = v811;

                                                                                                            v29 = v889;
                                                                                                            v39 = v838;

LABEL_1072:
                                                                                                            v16 = v888;
LABEL_1073:

LABEL_1074:
LABEL_1075:

LABEL_1076:
LABEL_1077:

LABEL_1078:
LABEL_1079:

LABEL_1080:
LABEL_1081:

LABEL_1082:
LABEL_1083:

LABEL_1084:
LABEL_1085:

LABEL_1086:
LABEL_1087:

LABEL_1088:
LABEL_1089:

LABEL_1090:
LABEL_1091:

LABEL_1092:
LABEL_1093:

LABEL_1094:
LABEL_1095:

                                                                                                            v277 = v816;
                                                                                                            v36 = v847;
LABEL_1096:

LABEL_1097:
LABEL_1098:

LABEL_1099:
LABEL_1100:

LABEL_1101:
LABEL_1102:

LABEL_1103:
LABEL_1104:

LABEL_1105:
LABEL_1106:

                                                                                                            goto LABEL_1107;
                                                                                                          }
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (!v862)
                                                                                                              goto LABEL_587;
                                                                                                            v429 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v430 = *MEMORY[0x1E0D025B8];
                                                                                                            v1042 = *MEMORY[0x1E0CB2D50];
                                                                                                            v766 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("gaPRArray"));
                                                                                                            v1043 = v766;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1043, &v1042, 1);
                                                                                                            v426 = objc_claimAutoreleasedReturnValue();
                                                                                                            v427 = v429;
                                                                                                            v428 = v430;
LABEL_578:
                                                                                                            v765 = (id)v426;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v427, "initWithDomain:code:userInfo:", v428, 2);
LABEL_582:
                                                                                                            v400 = v781;
                                                                                                            goto LABEL_1068;
                                                                                                          }
                                                                                                          v396 = v395;
                                                                                                          v397 = [BMMomentsEventDataPR alloc];
                                                                                                          v923 = 0;
                                                                                                          v398 = -[BMMomentsEventDataPR initWithJSONDictionary:error:](v397, "initWithJSONDictionary:error:", v396, &v923);
                                                                                                          v399 = v923;
                                                                                                          if (v399)
                                                                                                          {
                                                                                                            v765 = v399;
                                                                                                            v766 = v396;
                                                                                                            if (v862)
                                                                                                              *v862 = objc_retainAutorelease(v399);

                                                                                                            v877 = 0;
                                                                                                            goto LABEL_582;
                                                                                                          }
                                                                                                          objc_msgSend(v783, "addObject:", v398);

                                                                                                        }
                                                                                                        v392 = objc_msgSend(v781, "countByEnumeratingWithState:objects:count:", &v924, v1046, 16);
                                                                                                      }
                                                                                                      while (v392);
                                                                                                    }

                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundlePCount"));
                                                                                                    v766 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v766 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          v435 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v436 = *MEMORY[0x1E0D025B8];
                                                                                                          v1040 = *MEMORY[0x1E0CB2D50];
                                                                                                          v765 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundlePCount"));
                                                                                                          v1041 = v765;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1041, &v1040, 1);
                                                                                                          v764 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v400 = 0;
                                                                                                          v877 = 0;
                                                                                                          *v862 = (id)objc_msgSend(v435, "initWithDomain:code:userInfo:", v436, 2);

                                                                                                          goto LABEL_1068;
                                                                                                        }
                                                                                                        v400 = 0;
                                                                                                        v877 = 0;
LABEL_1069:

                                                                                                        goto LABEL_1070;
                                                                                                      }
                                                                                                      v400 = v766;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v400 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ranking"));
                                                                                                    v763 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v763 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v765 = v763;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v446 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v447 = *MEMORY[0x1E0D025B8];
                                                                                                            v1038 = *MEMORY[0x1E0CB2D50];
                                                                                                            v755 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("ranking"));
                                                                                                            v1039 = v755;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1039, &v1038, 1);
                                                                                                            v762 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v765 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v446, "initWithDomain:code:userInfo:", v447, 2);
                                                                                                            goto LABEL_1066;
                                                                                                          }
                                                                                                          v765 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1067;
                                                                                                        }
                                                                                                        v437 = v763;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataRankingTypeFromString(v437));
                                                                                                        v765 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v765 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("labelConfidenceScore"));
                                                                                                    v762 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v762 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v755 = v762;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v449 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v450 = *MEMORY[0x1E0D025B8];
                                                                                                            v1036 = *MEMORY[0x1E0CB2D50];
                                                                                                            v753 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("labelConfidenceScore"));
                                                                                                            v1037 = v753;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1037, &v1036, 1);
                                                                                                            v761 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v755 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v449, "initWithDomain:code:userInfo:", v450, 2);
                                                                                                            goto LABEL_1065;
                                                                                                          }
                                                                                                          v755 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1066;
                                                                                                        }
                                                                                                        v438 = v762;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataLabelConfidenceScoreTypeFromString(v438));
                                                                                                        v755 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v755 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeCorrelationScore"));
                                                                                                    v761 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v761 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v753 = v761;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v452 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v453 = *MEMORY[0x1E0D025B8];
                                                                                                            v1034 = *MEMORY[0x1E0CB2D50];
                                                                                                            v750 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("timeCorrelationScore"));
                                                                                                            v1035 = v750;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1035, &v1034, 1);
                                                                                                            v760 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v753 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v452, "initWithDomain:code:userInfo:", v453, 2);
                                                                                                            goto LABEL_1064;
                                                                                                          }
                                                                                                          v753 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1065;
                                                                                                        }
                                                                                                        v439 = v761;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataTimeCorrelationScoreTypeFromString(v439));
                                                                                                        v753 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v753 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callDuration"));
                                                                                                    v760 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v760 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v750 = v760;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v455 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v456 = *MEMORY[0x1E0D025B8];
                                                                                                            v1032 = *MEMORY[0x1E0CB2D50];
                                                                                                            v748 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("callDuration"));
                                                                                                            v1033 = v748;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1033, &v1032, 1);
                                                                                                            v759 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v750 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v455, "initWithDomain:code:userInfo:", v456, 2);
                                                                                                            goto LABEL_1063;
                                                                                                          }
                                                                                                          v750 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1064;
                                                                                                        }
                                                                                                        v440 = v760;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataCallDurationTypesFromString(v440));
                                                                                                        v750 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v750 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interactionCount"));
                                                                                                    v759 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v759 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v748 = v759;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v458 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v459 = *MEMORY[0x1E0D025B8];
                                                                                                            v1030 = *MEMORY[0x1E0CB2D50];
                                                                                                            v744 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interactionCount"));
                                                                                                            v1031 = v744;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1031, &v1030, 1);
                                                                                                            v758 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v748 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v458, "initWithDomain:code:userInfo:", v459, 2);
                                                                                                            goto LABEL_1062;
                                                                                                          }
                                                                                                          v748 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1063;
                                                                                                        }
                                                                                                        v441 = v759;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataInteractionCountTypesFromString(v441));
                                                                                                        v748 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v748 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interactionType"));
                                                                                                    v758 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v758 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v744 = v758;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v461 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v462 = *MEMORY[0x1E0D025B8];
                                                                                                            v1028 = *MEMORY[0x1E0CB2D50];
                                                                                                            v742 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interactionType"));
                                                                                                            v1029 = v742;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1029, &v1028, 1);
                                                                                                            v757 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v744 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v461, "initWithDomain:code:userInfo:", v462, 2);
                                                                                                            goto LABEL_1061;
                                                                                                          }
                                                                                                          v744 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1062;
                                                                                                        }
                                                                                                        v442 = v758;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataBundleInteractionTypesFromString(v442));
                                                                                                        v744 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v744 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callPlace"));
                                                                                                    v757 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v757 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v742 = v757;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v465 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v466 = *MEMORY[0x1E0D025B8];
                                                                                                            v1026 = *MEMORY[0x1E0CB2D50];
                                                                                                            v740 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("callPlace"));
                                                                                                            v1027 = v740;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1027, &v1026, 1);
                                                                                                            v756 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v742 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v465, "initWithDomain:code:userInfo:", v466, 2);
                                                                                                            goto LABEL_1060;
                                                                                                          }
                                                                                                          v742 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1061;
                                                                                                        }
                                                                                                        v443 = v757;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataCallPlaceTypeFromString(v443));
                                                                                                        v742 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v742 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("distanceFromHome"));
                                                                                                    v756 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v756 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v740 = v756;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v467 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v468 = *MEMORY[0x1E0D025B8];
                                                                                                            v1024 = *MEMORY[0x1E0CB2D50];
                                                                                                            v739 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("distanceFromHome"));
                                                                                                            v1025 = v739;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1025, &v1024, 1);
                                                                                                            v754 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v740 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v467, "initWithDomain:code:userInfo:", v468, 2);
                                                                                                            goto LABEL_1059;
                                                                                                          }
                                                                                                          v740 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1060;
                                                                                                        }
                                                                                                        v444 = v756;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataDistanceFromHomeTypeFromString(v444));
                                                                                                        v740 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v740 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeAvailability"));
                                                                                                    v754 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v754 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v739 = v754;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v470 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v471 = *MEMORY[0x1E0D025B8];
                                                                                                            v1022 = *MEMORY[0x1E0CB2D50];
                                                                                                            v736 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("homeAvailability"));
                                                                                                            v1023 = v736;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1023, &v1022, 1);
                                                                                                            v752 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v739 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v470, "initWithDomain:code:userInfo:", v471, 2);
                                                                                                            goto LABEL_1058;
                                                                                                          }
                                                                                                          v739 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1059;
                                                                                                        }
                                                                                                        v445 = v754;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataAvailabilityTypeFromString(v445));
                                                                                                        v739 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v739 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("workAvailability"));
                                                                                                    v752 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v752 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v736 = v752;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v473 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v474 = *MEMORY[0x1E0D025B8];
                                                                                                            v1020 = *MEMORY[0x1E0CB2D50];
                                                                                                            v735 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("workAvailability"));
                                                                                                            v1021 = v735;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1021, &v1020, 1);
                                                                                                            v749 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v736 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v473, "initWithDomain:code:userInfo:", v474, 2);
                                                                                                            goto LABEL_1057;
                                                                                                          }
                                                                                                          v736 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1058;
                                                                                                        }
                                                                                                        v448 = v752;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataAvailabilityTypeFromString(v448));
                                                                                                        v736 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v736 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleVisitMapItemSource"));
                                                                                                    v749 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v749 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v735 = v749;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v477 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v478 = *MEMORY[0x1E0D025B8];
                                                                                                            v1018 = *MEMORY[0x1E0CB2D50];
                                                                                                            v733 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleVisitMapItemSource"));
                                                                                                            v1019 = v733;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1019, &v1018, 1);
                                                                                                            v747 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v735 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v477, "initWithDomain:code:userInfo:", v478, 2);
                                                                                                            goto LABEL_1056;
                                                                                                          }
                                                                                                          v735 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1057;
                                                                                                        }
                                                                                                        v451 = v749;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataMapItemSourceTypeFromString(v451));
                                                                                                        v735 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v735 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleVisitPlaceType"));
                                                                                                    v747 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v747 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v733 = v747;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v479 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v480 = *MEMORY[0x1E0D025B8];
                                                                                                            v1016 = *MEMORY[0x1E0CB2D50];
                                                                                                            v732 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleVisitPlaceType"));
                                                                                                            v1017 = v732;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1017, &v1016, 1);
                                                                                                            v743 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v733 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v479, "initWithDomain:code:userInfo:", v480, 2);
                                                                                                            goto LABEL_1055;
                                                                                                          }
                                                                                                          v733 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1056;
                                                                                                        }
                                                                                                        v454 = v747;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataVisitPlaceTypesFromString(v454));
                                                                                                        v733 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v733 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleVisitPlaceLabelGranularity"));
                                                                                                    v743 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v743 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v732 = v743;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v501 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v502 = *MEMORY[0x1E0D025B8];
                                                                                                            v1014 = *MEMORY[0x1E0CB2D50];
                                                                                                            v729 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleVisitPlaceLabelGranularity"));
                                                                                                            v1015 = v729;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1015, &v1014, 1);
                                                                                                            v741 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v732 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v501, "initWithDomain:code:userInfo:", v502, 2);
                                                                                                            goto LABEL_1054;
                                                                                                          }
                                                                                                          v732 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1055;
                                                                                                        }
                                                                                                        v457 = v743;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceInferenceGranularityTypeFromString(v457));
                                                                                                        v732 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v732 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIncludesAnomalousEvent"));
                                                                                                    v741 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v741 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v729 = v741;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v505 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v506 = *MEMORY[0x1E0D025B8];
                                                                                                            v1012 = *MEMORY[0x1E0CB2D50];
                                                                                                            v726 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleIncludesAnomalousEvent"));
                                                                                                            v1013 = v726;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1013, &v1012, 1);
                                                                                                            v738 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v729 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v505, "initWithDomain:code:userInfo:", v506, 2);
                                                                                                            goto LABEL_1053;
                                                                                                          }
                                                                                                          v729 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1054;
                                                                                                        }
                                                                                                        v460 = v741;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataAnomalousTypeFromString(v460));
                                                                                                        v729 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v729 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isFiltered"));
                                                                                                    v738 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v738 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          v463 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v464 = *MEMORY[0x1E0D025B8];
                                                                                                          v1010 = *MEMORY[0x1E0CB2D50];
                                                                                                          v725 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFiltered"));
                                                                                                          v1011 = v725;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1011, &v1010, 1);
                                                                                                          v737 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v726 = 0;
                                                                                                          v877 = 0;
                                                                                                          *v862 = (id)objc_msgSend(v463, "initWithDomain:code:userInfo:", v464, 2);
                                                                                                          goto LABEL_1052;
                                                                                                        }
                                                                                                        v726 = 0;
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1053;
                                                                                                      }
                                                                                                      v726 = v738;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v726 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSuperType"));
                                                                                                    v737 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v737 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v725 = v737;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v515 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v516 = *MEMORY[0x1E0D025B8];
                                                                                                            v1008 = *MEMORY[0x1E0CB2D50];
                                                                                                            v722 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleSuperType"));
                                                                                                            v1009 = v722;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1009, &v1008, 1);
                                                                                                            v734 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v725 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v515, "initWithDomain:code:userInfo:", v516, 2);
                                                                                                            goto LABEL_1051;
                                                                                                          }
                                                                                                          v725 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1052;
                                                                                                        }
                                                                                                        v469 = v737;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventBundleBundleSuperTypeFromString(v469));
                                                                                                        v725 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v725 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleSubType"));
                                                                                                    v734 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v734 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v722 = v734;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v517 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v518 = *MEMORY[0x1E0D025B8];
                                                                                                            v1006 = *MEMORY[0x1E0CB2D50];
                                                                                                            v721 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleSubType"));
                                                                                                            v1007 = v721;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1007, &v1006, 1);
                                                                                                            v731 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v722 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v517, "initWithDomain:code:userInfo:", v518, 2);
                                                                                                            goto LABEL_1050;
                                                                                                          }
                                                                                                          v722 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1051;
                                                                                                        }
                                                                                                        v472 = v734;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventBundleBundleSubTypeFromString(v472));
                                                                                                        v722 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v722 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAggregatedAndSuppressed"));
                                                                                                    v731 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v731 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          v475 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v476 = *MEMORY[0x1E0D025B8];
                                                                                                          v1004 = *MEMORY[0x1E0CB2D50];
                                                                                                          v720 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isAggregatedAndSuppressed"));
                                                                                                          v1005 = v720;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1005, &v1004, 1);
                                                                                                          v730 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v721 = 0;
                                                                                                          v877 = 0;
                                                                                                          *v862 = (id)objc_msgSend(v475, "initWithDomain:code:userInfo:", v476, 2);
                                                                                                          goto LABEL_1049;
                                                                                                        }
                                                                                                        v721 = 0;
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1050;
                                                                                                      }
                                                                                                      v721 = v731;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v721 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("summarizationGranularity"));
                                                                                                    v730 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v730 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                      {
                                                                                                        v720 = v730;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v519 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v520 = *MEMORY[0x1E0D025B8];
                                                                                                            v1002 = *MEMORY[0x1E0CB2D50];
                                                                                                            v719 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("summarizationGranularity"));
                                                                                                            v1003 = v719;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1003, &v1002, 1);
                                                                                                            v724 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v720 = 0;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v519, "initWithDomain:code:userInfo:", v520, 2);
                                                                                                            goto LABEL_1048;
                                                                                                          }
                                                                                                          v720 = 0;
                                                                                                          v877 = 0;
                                                                                                          goto LABEL_1049;
                                                                                                        }
                                                                                                        v481 = v730;
                                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataEventBundleSummarizationGranularityFromString(v481));
                                                                                                        v720 = (id)objc_claimAutoreleasedReturnValue();

                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v720 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includedInSummaryBundleOnly"));
                                                                                                    v724 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    if (v724 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          v503 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v504 = *MEMORY[0x1E0D025B8];
                                                                                                          v1000 = *MEMORY[0x1E0CB2D50];
                                                                                                          v751 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("includedInSummaryBundleOnly"));
                                                                                                          v1001 = v751;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1001, &v1000, 1);
                                                                                                          v746 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v719 = 0;
                                                                                                          v877 = 0;
                                                                                                          *v862 = (id)objc_msgSend(v503, "initWithDomain:code:userInfo:", v504, 2);

                                                                                                          goto LABEL_1047;
                                                                                                        }
                                                                                                        v719 = 0;
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1048;
                                                                                                      }
                                                                                                      v719 = v724;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v719 = 0;
                                                                                                    }
                                                                                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subBundleIDs"));
                                                                                                    v482 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                                                    v483 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v751 = v482;
                                                                                                    LODWORD(v482) = objc_msgSend(v482, "isEqual:", v483);

                                                                                                    if ((_DWORD)v482)
                                                                                                    {

                                                                                                      goto LABEL_794;
                                                                                                    }
                                                                                                    if (v751)
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                      {
                                                                                                        if (v862)
                                                                                                        {
                                                                                                          v484 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                          v485 = *MEMORY[0x1E0D025B8];
                                                                                                          v998 = *MEMORY[0x1E0CB2D50];
                                                                                                          v745 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("subBundleIDs"));
                                                                                                          v999 = v745;
                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v999, &v998, 1);
                                                                                                          v727 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                          v877 = 0;
                                                                                                          *v862 = (id)objc_msgSend(v484, "initWithDomain:code:userInfo:", v485, 2);

                                                                                                          goto LABEL_1046;
                                                                                                        }
                                                                                                        v877 = 0;
                                                                                                        goto LABEL_1047;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
LABEL_794:
                                                                                                      v751 = 0;
                                                                                                    }
                                                                                                    v745 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v751, "count"));
                                                                                                    v919 = 0u;
                                                                                                    v920 = 0u;
                                                                                                    v921 = 0u;
                                                                                                    v922 = 0u;
                                                                                                    v751 = v751;
                                                                                                    v486 = objc_msgSend(v751, "countByEnumeratingWithState:objects:count:", &v919, v997, 16);
                                                                                                    if (!v486)
                                                                                                      goto LABEL_804;
                                                                                                    v487 = v486;
                                                                                                    v488 = *(_QWORD *)v920;
                                                                                                    while (1)
                                                                                                    {
                                                                                                      for (m = 0;
                                                                                                            m != v487;
                                                                                                            ++m)
                                                                                                      {
                                                                                                        if (*(_QWORD *)v920 != v488)
                                                                                                          objc_enumerationMutation(v751);
                                                                                                        v490 = *(void **)(*((_QWORD *)&v919 + 1) + 8 * m);
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v494 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v495 = *MEMORY[0x1E0D025B8];
                                                                                                            v995 = *MEMORY[0x1E0CB2D50];
                                                                                                            v723 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("subBundleIDs"));
                                                                                                            v996 = v723;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v996, &v995, 1);
                                                                                                            v496 = objc_claimAutoreleasedReturnValue();
                                                                                                            v497 = v494;
                                                                                                            v498 = v495;
LABEL_812:
                                                                                                            v715 = (void *)v496;
                                                                                                            v877 = 0;
                                                                                                            *v862 = (id)objc_msgSend(v497, "initWithDomain:code:userInfo:", v498, 2);
                                                                                                            v728 = v751;

                                                                                                            goto LABEL_1044;
                                                                                                          }
LABEL_815:
                                                                                                          v877 = 0;

                                                                                                          goto LABEL_1046;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                        {
                                                                                                          if (v862)
                                                                                                          {
                                                                                                            v499 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                            v500 = *MEMORY[0x1E0D025B8];
                                                                                                            v993 = *MEMORY[0x1E0CB2D50];
                                                                                                            v723 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subBundleIDs"));
                                                                                                            v994 = v723;
                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v994, &v993, 1);
                                                                                                            v496 = objc_claimAutoreleasedReturnValue();
                                                                                                            v497 = v499;
                                                                                                            v498 = v500;
                                                                                                            goto LABEL_812;
                                                                                                          }
                                                                                                          goto LABEL_815;
                                                                                                        }
                                                                                                        v491 = v490;
                                                                                                        objc_msgSend(v745, "addObject:", v491);

                                                                                                      }
                                                                                                      v487 = objc_msgSend(v751, "countByEnumeratingWithState:objects:count:", &v919, v997, 16);
                                                                                                      if (!v487)
                                                                                                      {
LABEL_804:

                                                                                                        objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("subSuggestionIDs"));
                                                                                                        v492 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                                                        v493 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v728 = v492;
                                                                                                        LODWORD(v492) = objc_msgSend(v492, "isEqual:", v493);

                                                                                                        if ((_DWORD)v492)
                                                                                                        {

                                                                                                          goto LABEL_827;
                                                                                                        }
                                                                                                        if (v728)
                                                                                                        {
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              v507 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                              v508 = *MEMORY[0x1E0D025B8];
                                                                                                              v991 = *MEMORY[0x1E0CB2D50];
                                                                                                              v723 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("subSuggestionIDs"));
                                                                                                              v992 = v723;
                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v992, &v991, 1);
                                                                                                              v716 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                              v877 = 0;
                                                                                                              *v862 = (id)objc_msgSend(v507, "initWithDomain:code:userInfo:", v508, 2);

                                                                                                              goto LABEL_1044;
                                                                                                            }
                                                                                                            v877 = 0;
                                                                                                            goto LABEL_1045;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
LABEL_827:
                                                                                                          v728 = 0;
                                                                                                        }
                                                                                                        v723 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v728, "count"));
                                                                                                        v915 = 0u;
                                                                                                        v916 = 0u;
                                                                                                        v917 = 0u;
                                                                                                        v918 = 0u;
                                                                                                        v728 = v728;
                                                                                                        v509 = objc_msgSend(v728, "countByEnumeratingWithState:objects:count:", &v915, v990, 16);
                                                                                                        if (v509)
                                                                                                        {
                                                                                                          v510 = v509;
                                                                                                          v511 = *(_QWORD *)v916;
                                                                                                          do
                                                                                                          {
                                                                                                            for (n = 0;
                                                                                                                  n != v510;
                                                                                                                  ++n)
                                                                                                            {
                                                                                                              if (*(_QWORD *)v916 != v511)
                                                                                                                objc_enumerationMutation(v728);
                                                                                                              v513 = *(void **)(*((_QWORD *)&v915 + 1) + 8 * n);
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  v521 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v522 = *MEMORY[0x1E0D025B8];
                                                                                                                  v988 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v708 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("subSuggestionIDs"));
                                                                                                                  v989 = v708;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v989, &v988, 1);
                                                                                                                  v523 = objc_claimAutoreleasedReturnValue();
                                                                                                                  v524 = v521;
                                                                                                                  v525 = v522;
LABEL_860:
                                                                                                                  v713 = (id)v523;
                                                                                                                  v877 = 0;
                                                                                                                  *v862 = (id)objc_msgSend(v524, "initWithDomain:code:userInfo:", v525, 2);
                                                                                                                  v717 = v728;

                                                                                                                  goto LABEL_1042;
                                                                                                                }
LABEL_865:
                                                                                                                v877 = 0;

                                                                                                                goto LABEL_1044;
                                                                                                              }
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  v526 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v527 = *MEMORY[0x1E0D025B8];
                                                                                                                  v986 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v708 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subSuggestionIDs"));
                                                                                                                  v987 = v708;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v987, &v986, 1);
                                                                                                                  v523 = objc_claimAutoreleasedReturnValue();
                                                                                                                  v524 = v526;
                                                                                                                  v525 = v527;
                                                                                                                  goto LABEL_860;
                                                                                                                }
                                                                                                                goto LABEL_865;
                                                                                                              }
                                                                                                              v514 = v513;
                                                                                                              objc_msgSend(v723, "addObject:", v514);

                                                                                                            }
                                                                                                            v510 = objc_msgSend(v728, "countByEnumeratingWithState:objects:count:", &v915, v990, 16);
                                                                                                          }
                                                                                                          while (v510);
                                                                                                        }

                                                                                                        objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("firstCreationDate"));
                                                                                                        v708 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        if (!v708 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          v717 = 0;
                                                                                                          goto LABEL_876;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v528 = v708;
                                                                                                          v529 = objc_alloc(MEMORY[0x1E0C99D68]);
                                                                                                          objc_msgSend(v528, "doubleValue");
                                                                                                          v717 = (id)objc_msgSend(v529, "initWithTimeIntervalSince1970:");
                                                                                                          goto LABEL_875;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                        {
                                                                                                          v528 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                                                                                          v530 = v708;
                                                                                                          objc_msgSend(v528, "dateFromString:", v530);
                                                                                                          v717 = (id)objc_claimAutoreleasedReturnValue();

LABEL_875:
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              v572 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                              v573 = *MEMORY[0x1E0D025B8];
                                                                                                              v984 = *MEMORY[0x1E0CB2D50];
                                                                                                              v714 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("firstCreationDate"));
                                                                                                              v985 = v714;
                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v985, &v984, 1);
                                                                                                              v712 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                              v717 = 0;
                                                                                                              v877 = 0;
                                                                                                              *v862 = (id)objc_msgSend(v572, "initWithDomain:code:userInfo:", v573, 2);

                                                                                                              goto LABEL_1041;
                                                                                                            }
                                                                                                            v717 = 0;
                                                                                                            v877 = 0;
                                                                                                            goto LABEL_1042;
                                                                                                          }
                                                                                                          v717 = v708;
                                                                                                        }
LABEL_876:
                                                                                                        objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("resources"));
                                                                                                        v531 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                                                        v532 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v714 = v531;
                                                                                                        LODWORD(v531) = objc_msgSend(v531, "isEqual:", v532);

                                                                                                        if ((_DWORD)v531)
                                                                                                        {

                                                                                                          goto LABEL_882;
                                                                                                        }
                                                                                                        if (v714)
                                                                                                        {
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            if (v862)
                                                                                                            {
                                                                                                              v533 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                              v534 = *MEMORY[0x1E0D025B8];
                                                                                                              v982 = *MEMORY[0x1E0CB2D50];
                                                                                                              v711 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("resources"));
                                                                                                              v983 = v711;
                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v983, &v982, 1);
                                                                                                              v706 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                              v877 = 0;
                                                                                                              *v862 = (id)objc_msgSend(v533, "initWithDomain:code:userInfo:", v534, 2);

                                                                                                              goto LABEL_1040;
                                                                                                            }
                                                                                                            v877 = 0;
                                                                                                            goto LABEL_1041;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
LABEL_882:
                                                                                                          v714 = 0;
                                                                                                        }
                                                                                                        v711 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v714, "count"));
                                                                                                        v911 = 0u;
                                                                                                        v912 = 0u;
                                                                                                        v913 = 0u;
                                                                                                        v914 = 0u;
                                                                                                        v714 = v714;
                                                                                                        v535 = objc_msgSend(v714, "countByEnumeratingWithState:objects:count:", &v911, v981, 16);
                                                                                                        if (!v535)
                                                                                                          goto LABEL_893;
                                                                                                        v536 = v535;
                                                                                                        v537 = *(_QWORD *)v912;
                                                                                                        while (1)
                                                                                                        {
                                                                                                          for (ii = 0;
                                                                                                                ii != v536;
                                                                                                                ++ii)
                                                                                                          {
                                                                                                            if (*(_QWORD *)v912 != v537)
                                                                                                              objc_enumerationMutation(v714);
                                                                                                            v539 = *(void **)(*((_QWORD *)&v911 + 1) + 8 * ii);
                                                                                                            objc_opt_class();
                                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                            {
                                                                                                              if (v862)
                                                                                                              {
                                                                                                                v545 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                v546 = *MEMORY[0x1E0D025B8];
                                                                                                                v979 = *MEMORY[0x1E0CB2D50];
                                                                                                                v718 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("resources"));
                                                                                                                v980 = v718;
                                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v980, &v979, 1);
                                                                                                                v547 = objc_claimAutoreleasedReturnValue();
                                                                                                                v548 = v545;
                                                                                                                v549 = v546;
                                                                                                                goto LABEL_899;
                                                                                                              }
LABEL_924:
                                                                                                              v877 = 0;

                                                                                                              goto LABEL_1040;
                                                                                                            }
                                                                                                            objc_opt_class();
                                                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                            {
                                                                                                              if (!v862)
                                                                                                                goto LABEL_924;
                                                                                                              v550 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                              v551 = *MEMORY[0x1E0D025B8];
                                                                                                              v977 = *MEMORY[0x1E0CB2D50];
                                                                                                              v718 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("resources"));
                                                                                                              v978 = v718;
                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v978, &v977, 1);
                                                                                                              v547 = objc_claimAutoreleasedReturnValue();
                                                                                                              v548 = v550;
                                                                                                              v549 = v551;
LABEL_899:
                                                                                                              v709 = (id)v547;
                                                                                                              v877 = 0;
                                                                                                              *v862 = (id)objc_msgSend(v548, "initWithDomain:code:userInfo:", v549, 2);
LABEL_903:
                                                                                                              v707 = v714;
                                                                                                              goto LABEL_1037;
                                                                                                            }
                                                                                                            v540 = v539;
                                                                                                            v541 = [BMMomentsEventDataEventBundleResource alloc];
                                                                                                            v910 = 0;
                                                                                                            v718 = v540;
                                                                                                            v542 = -[BMMomentsEventDataEventBundleResource initWithJSONDictionary:error:](v541, "initWithJSONDictionary:error:", v540, &v910);
                                                                                                            v709 = v910;
                                                                                                            if (v709)
                                                                                                            {
                                                                                                              if (v862)
                                                                                                                *v862 = objc_retainAutorelease(v709);

                                                                                                              v877 = 0;
                                                                                                              goto LABEL_903;
                                                                                                            }
                                                                                                            objc_msgSend(v711, "addObject:", v542);

                                                                                                          }
                                                                                                          v536 = objc_msgSend(v714, "countByEnumeratingWithState:objects:count:", &v911, v981, 16);
                                                                                                          if (!v536)
                                                                                                          {
LABEL_893:

                                                                                                            objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("persons"));
                                                                                                            v543 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                                                            v544 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v707 = v543;
                                                                                                            LODWORD(v543) = objc_msgSend(v543, "isEqual:", v544);

                                                                                                            if ((_DWORD)v543)
                                                                                                            {

                                                                                                              goto LABEL_908;
                                                                                                            }
                                                                                                            if (v707)
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  v552 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v553 = *MEMORY[0x1E0D025B8];
                                                                                                                  v975 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v718 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("persons"));
                                                                                                                  v976 = v718;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v976, &v975, 1);
                                                                                                                  v710 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                                  v877 = 0;
                                                                                                                  *v862 = (id)objc_msgSend(v552, "initWithDomain:code:userInfo:", v553, 2);

                                                                                                                  goto LABEL_1038;
                                                                                                                }
                                                                                                                v877 = 0;
                                                                                                                goto LABEL_1039;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
LABEL_908:
                                                                                                              v707 = 0;
                                                                                                            }
                                                                                                            v718 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v707, "count"));
                                                                                                            v906 = 0u;
                                                                                                            v907 = 0u;
                                                                                                            v908 = 0u;
                                                                                                            v909 = 0u;
                                                                                                            v707 = v707;
                                                                                                            v554 = objc_msgSend(v707, "countByEnumeratingWithState:objects:count:", &v906, v974, 16);
                                                                                                            if (v554)
                                                                                                            {
                                                                                                              v555 = v554;
                                                                                                              v556 = *(_QWORD *)v907;
                                                                                                              do
                                                                                                              {
                                                                                                                for (jj = 0;
                                                                                                                      jj != v555;
                                                                                                                      ++jj)
                                                                                                                {
                                                                                                                  if (*(_QWORD *)v907 != v556)
                                                                                                                    objc_enumerationMutation(v707);
                                                                                                                  v558 = *(void **)(*((_QWORD *)&v906 + 1) + 8 * jj);
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                  {
                                                                                                                    if (v862)
                                                                                                                    {
                                                                                                                      v564 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                      v565 = *MEMORY[0x1E0D025B8];
                                                                                                                      v972 = *MEMORY[0x1E0CB2D50];
                                                                                                                      v705 = (BMMomentsEventDataEventBundlePlace *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("persons"));
                                                                                                                      v973 = v705;
                                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v973, &v972, 1);
                                                                                                                      v566 = objc_claimAutoreleasedReturnValue();
                                                                                                                      v567 = v564;
                                                                                                                      v568 = v565;
                                                                                                                      goto LABEL_932;
                                                                                                                    }
LABEL_938:
                                                                                                                    v877 = 0;

                                                                                                                    goto LABEL_1038;
                                                                                                                  }
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                  {
                                                                                                                    if (!v862)
                                                                                                                      goto LABEL_938;
                                                                                                                    v569 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                    v570 = *MEMORY[0x1E0D025B8];
                                                                                                                    v970 = *MEMORY[0x1E0CB2D50];
                                                                                                                    v705 = (BMMomentsEventDataEventBundlePlace *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("persons"));
                                                                                                                    v971 = v705;
                                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v971, &v970, 1);
                                                                                                                    v566 = objc_claimAutoreleasedReturnValue();
                                                                                                                    v567 = v569;
                                                                                                                    v568 = v570;
LABEL_932:
                                                                                                                    v704 = (id)v566;
                                                                                                                    v877 = 0;
                                                                                                                    *v862 = (id)objc_msgSend(v567, "initWithDomain:code:userInfo:", v568, 2);
LABEL_936:
                                                                                                                    v571 = v707;
LABEL_937:
                                                                                                                    v709 = v571;
                                                                                                                    goto LABEL_1036;
                                                                                                                  }
                                                                                                                  v559 = v558;
                                                                                                                  v560 = [BMMomentsEventDataEventBundlePerson alloc];
                                                                                                                  v905 = 0;
                                                                                                                  v705 = v559;
                                                                                                                  v561 = -[BMMomentsEventDataEventBundlePerson initWithJSONDictionary:error:](v560, "initWithJSONDictionary:error:", v559, &v905);
                                                                                                                  v704 = v905;
                                                                                                                  if (v704)
                                                                                                                  {
                                                                                                                    if (v862)
                                                                                                                      *v862 = objc_retainAutorelease(v704);

                                                                                                                    v877 = 0;
                                                                                                                    goto LABEL_936;
                                                                                                                  }
                                                                                                                  objc_msgSend(v718, "addObject:", v561);

                                                                                                                }
                                                                                                                v555 = objc_msgSend(v707, "countByEnumeratingWithState:objects:count:", &v906, v974, 16);
                                                                                                              }
                                                                                                              while (v555);
                                                                                                            }

                                                                                                            objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("mainPlace"));
                                                                                                            v709 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                            if (v709 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  v590 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v591 = *MEMORY[0x1E0D025B8];
                                                                                                                  v968 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v705 = (BMMomentsEventDataEventBundlePlace *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("mainPlace"));
                                                                                                                  v969 = v705;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v969, &v968, 1);
                                                                                                                  v704 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                                  v877 = 0;
                                                                                                                  *v862 = (id)objc_msgSend(v590, "initWithDomain:code:userInfo:", v591, 2);
                                                                                                                  goto LABEL_1036;
                                                                                                                }
                                                                                                                v877 = 0;
                                                                                                                goto LABEL_1037;
                                                                                                              }
                                                                                                              v586 = v709;
                                                                                                              v587 = [BMMomentsEventDataEventBundlePlace alloc];
                                                                                                              v904 = 0;
                                                                                                              v704 = v586;
                                                                                                              v705 = -[BMMomentsEventDataEventBundlePlace initWithJSONDictionary:error:](v587, "initWithJSONDictionary:error:", v586, &v904);
                                                                                                              v588 = v904;
                                                                                                              if (v588)
                                                                                                              {
                                                                                                                v589 = v588;
                                                                                                                if (v862)
                                                                                                                  *v862 = objc_retainAutorelease(v588);

                                                                                                                v877 = 0;
                                                                                                                v571 = v704;
                                                                                                                goto LABEL_937;
                                                                                                              }

                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v705 = 0;
                                                                                                            }
                                                                                                            objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("otherPlaces"));
                                                                                                            v562 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                                                            v563 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v704 = v562;
                                                                                                            LODWORD(v562) = objc_msgSend(v562, "isEqual:", v563);

                                                                                                            if ((_DWORD)v562)
                                                                                                            {

                                                                                                              goto LABEL_945;
                                                                                                            }
                                                                                                            if (v704)
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                              {
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  v574 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v575 = *MEMORY[0x1E0D025B8];
                                                                                                                  v966 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v702 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("otherPlaces"));
                                                                                                                  v967 = v702;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v967, &v966, 1);
                                                                                                                  v699 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                                  v877 = 0;
                                                                                                                  *v862 = (id)objc_msgSend(v574, "initWithDomain:code:userInfo:", v575, 2);

                                                                                                                  goto LABEL_1035;
                                                                                                                }
                                                                                                                v877 = 0;
                                                                                                                goto LABEL_1036;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
LABEL_945:
                                                                                                              v704 = 0;
                                                                                                            }
                                                                                                            v702 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v704, "count"));
                                                                                                            v900 = 0u;
                                                                                                            v901 = 0u;
                                                                                                            v902 = 0u;
                                                                                                            v903 = 0u;
                                                                                                            v704 = v704;
                                                                                                            v576 = objc_msgSend(v704, "countByEnumeratingWithState:objects:count:", &v900, v965, 16);
                                                                                                            if (!v576)
                                                                                                              goto LABEL_956;
                                                                                                            v577 = v576;
                                                                                                            v578 = *(_QWORD *)v901;
                                                                                                            while (1)
                                                                                                            {
                                                                                                              for (kk = 0;
                                                                                                                    kk != v577;
                                                                                                                    ++kk)
                                                                                                              {
                                                                                                                if (*(_QWORD *)v901 != v578)
                                                                                                                  objc_enumerationMutation(v704);
                                                                                                                v580 = *(void **)(*((_QWORD *)&v900 + 1) + 8 * kk);
                                                                                                                objc_opt_class();
                                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                {
                                                                                                                  if (v862)
                                                                                                                  {
                                                                                                                    v592 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                    v593 = *MEMORY[0x1E0D025B8];
                                                                                                                    v963 = *MEMORY[0x1E0CB2D50];
                                                                                                                    v703 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("otherPlaces"));
                                                                                                                    v964 = v703;
                                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v964, &v963, 1);
                                                                                                                    v594 = objc_claimAutoreleasedReturnValue();
                                                                                                                    v595 = v592;
                                                                                                                    v596 = v593;
                                                                                                                    goto LABEL_971;
                                                                                                                  }
LABEL_1023:
                                                                                                                  v877 = 0;

                                                                                                                  goto LABEL_1035;
                                                                                                                }
                                                                                                                objc_opt_class();
                                                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                {
                                                                                                                  if (!v862)
                                                                                                                    goto LABEL_1023;
                                                                                                                  v597 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v598 = *MEMORY[0x1E0D025B8];
                                                                                                                  v961 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v703 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("otherPlaces"));
                                                                                                                  v962 = v703;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v962, &v961, 1);
                                                                                                                  v594 = objc_claimAutoreleasedReturnValue();
                                                                                                                  v595 = v597;
                                                                                                                  v596 = v598;
LABEL_971:
                                                                                                                  v701 = (id)v594;
                                                                                                                  v877 = 0;
                                                                                                                  *v862 = (id)objc_msgSend(v595, "initWithDomain:code:userInfo:", v596, 2);
LABEL_975:
                                                                                                                  v700 = v704;
                                                                                                                  goto LABEL_1033;
                                                                                                                }
                                                                                                                v581 = v580;
                                                                                                                v582 = [BMMomentsEventDataEventBundlePlace alloc];
                                                                                                                v899 = 0;
                                                                                                                v703 = v581;
                                                                                                                v583 = -[BMMomentsEventDataEventBundlePlace initWithJSONDictionary:error:](v582, "initWithJSONDictionary:error:", v581, &v899);
                                                                                                                v701 = v899;
                                                                                                                if (v701)
                                                                                                                {
                                                                                                                  if (v862)
                                                                                                                    *v862 = objc_retainAutorelease(v701);

                                                                                                                  v877 = 0;
                                                                                                                  goto LABEL_975;
                                                                                                                }
                                                                                                                objc_msgSend(v702, "addObject:", v583);

                                                                                                              }
                                                                                                              v577 = objc_msgSend(v704, "countByEnumeratingWithState:objects:count:", &v900, v965, 16);
                                                                                                              if (!v577)
                                                                                                              {
LABEL_956:

                                                                                                                objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("photoTraits"));
                                                                                                                v584 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                                                                                                v585 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                v700 = v584;
                                                                                                                LODWORD(v584) = objc_msgSend(v584, "isEqual:", v585);

                                                                                                                if ((_DWORD)v584)
                                                                                                                {

                                                                                                                  goto LABEL_980;
                                                                                                                }
                                                                                                                if (v700)
                                                                                                                {
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                  {
                                                                                                                    if (v862)
                                                                                                                    {
                                                                                                                      v599 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                      v600 = *MEMORY[0x1E0D025B8];
                                                                                                                      v959 = *MEMORY[0x1E0CB2D50];
                                                                                                                      v703 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("photoTraits"));
                                                                                                                      v960 = v703;
                                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v960, &v959, 1);
                                                                                                                      v701 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                                      v877 = 0;
                                                                                                                      *v862 = (id)objc_msgSend(v599, "initWithDomain:code:userInfo:", v600, 2);
                                                                                                                      goto LABEL_1033;
                                                                                                                    }
                                                                                                                    v877 = 0;
                                                                                                                    goto LABEL_1034;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
LABEL_980:
                                                                                                                  v700 = 0;
                                                                                                                }
                                                                                                                v703 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v700, "count"));
                                                                                                                v895 = 0u;
                                                                                                                v896 = 0u;
                                                                                                                v897 = 0u;
                                                                                                                v898 = 0u;
                                                                                                                v700 = v700;
                                                                                                                v601 = objc_msgSend(v700, "countByEnumeratingWithState:objects:count:", &v895, v958, 16);
                                                                                                                if (!v601)
                                                                                                                  goto LABEL_990;
                                                                                                                v602 = v601;
                                                                                                                v603 = *(_QWORD *)v896;
LABEL_983:
                                                                                                                v604 = 0;
                                                                                                                while (1)
                                                                                                                {
                                                                                                                  if (*(_QWORD *)v896 != v603)
                                                                                                                    objc_enumerationMutation(v700);
                                                                                                                  v605 = *(void **)(*((_QWORD *)&v895 + 1) + 8 * v604);
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                    break;
                                                                                                                  objc_opt_class();
                                                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                  {
                                                                                                                    if (v862)
                                                                                                                    {
                                                                                                                      v618 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                      v619 = *MEMORY[0x1E0D025B8];
                                                                                                                      v954 = *MEMORY[0x1E0CB2D50];
                                                                                                                      v698 = (BMMomentsEventDataEventBundleClusterMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("photoTraits"));
                                                                                                                      v955 = v698;
                                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v955, &v954, 1);
                                                                                                                      v615 = objc_claimAutoreleasedReturnValue();
                                                                                                                      v616 = v618;
                                                                                                                      v617 = v619;
                                                                                                                      goto LABEL_1028;
                                                                                                                    }
                                                                                                                    goto LABEL_1032;
                                                                                                                  }
                                                                                                                  v606 = v605;
                                                                                                                  objc_msgSend(v703, "addObject:", v606);

                                                                                                                  if (v602 == ++v604)
                                                                                                                  {
                                                                                                                    v602 = objc_msgSend(v700, "countByEnumeratingWithState:objects:count:", &v895, v958, 16);
                                                                                                                    if (v602)
                                                                                                                      goto LABEL_983;
LABEL_990:

                                                                                                                    objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("clusterMetadata"));
                                                                                                                    v701 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                                    if (v701 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                    {
                                                                                                                      objc_opt_class();
                                                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                      {
                                                                                                                        v621 = v701;
                                                                                                                        v622 = [BMMomentsEventDataEventBundleClusterMetadata alloc];
                                                                                                                        v894 = 0;
                                                                                                                        v607 = v621;
                                                                                                                        v698 = -[BMMomentsEventDataEventBundleClusterMetadata initWithJSONDictionary:error:](v622, "initWithJSONDictionary:error:", v621, &v894);
                                                                                                                        v623 = v894;
                                                                                                                        if (!v623)
                                                                                                                        {

                                                                                                                          goto LABEL_993;
                                                                                                                        }
                                                                                                                        v624 = v623;
                                                                                                                        if (v862)
                                                                                                                          *v862 = objc_retainAutorelease(v623);

                                                                                                                        v877 = 0;
                                                                                                                        v701 = v607;
                                                                                                                        goto LABEL_1029;
                                                                                                                      }
                                                                                                                      if (v862)
                                                                                                                      {
                                                                                                                        v629 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                        v630 = *MEMORY[0x1E0D025B8];
                                                                                                                        v952 = *MEMORY[0x1E0CB2D50];
                                                                                                                        v698 = (BMMomentsEventDataEventBundleClusterMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("clusterMetadata"));
                                                                                                                        v953 = v698;
                                                                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v953, &v952, 1);
                                                                                                                        v607 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                        v877 = 0;
                                                                                                                        *v862 = (id)objc_msgSend(v629, "initWithDomain:code:userInfo:", v630, 2);
                                                                                                                        goto LABEL_1029;
                                                                                                                      }
                                                                                                                      v877 = 0;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v698 = 0;
LABEL_993:
                                                                                                                      objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("outlierMetadata"));
                                                                                                                      v607 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                      if (v607 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                      {
                                                                                                                        objc_opt_class();
                                                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                        {
                                                                                                                          v625 = v607;
                                                                                                                          v626 = [BMMomentsEventDataEventBundleOutlierMetadata alloc];
                                                                                                                          v893 = 0;
                                                                                                                          v696 = v625;
                                                                                                                          v694 = -[BMMomentsEventDataEventBundleOutlierMetadata initWithJSONDictionary:error:](v626, "initWithJSONDictionary:error:", v625, &v893);
                                                                                                                          v627 = v893;
                                                                                                                          if (!v627)
                                                                                                                          {

                                                                                                                            goto LABEL_996;
                                                                                                                          }
                                                                                                                          v628 = v627;
                                                                                                                          if (v862)
                                                                                                                            *v862 = objc_retainAutorelease(v627);

                                                                                                                          v877 = 0;
                                                                                                                          goto LABEL_1022;
                                                                                                                        }
                                                                                                                        if (v862)
                                                                                                                        {
                                                                                                                          v631 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                          v632 = *MEMORY[0x1E0D025B8];
                                                                                                                          v950 = *MEMORY[0x1E0CB2D50];
                                                                                                                          v694 = (BMMomentsEventDataEventBundleOutlierMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("outlierMetadata"));
                                                                                                                          v951 = v694;
                                                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v951, &v950, 1);
                                                                                                                          v696 = (id)objc_claimAutoreleasedReturnValue();
                                                                                                                          v877 = 0;
                                                                                                                          *v862 = (id)objc_msgSend(v631, "initWithDomain:code:userInfo:", v632, 2);
                                                                                                                          goto LABEL_1022;
                                                                                                                        }
                                                                                                                        v877 = 0;
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v694 = 0;
LABEL_996:
                                                                                                                        objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore"));
                                                                                                                        v697 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                        if (v697 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                        {
                                                                                                                          objc_opt_class();
                                                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                          {
                                                                                                                            v696 = v697;
                                                                                                                            goto LABEL_999;
                                                                                                                          }
                                                                                                                          if (v862)
                                                                                                                          {
                                                                                                                            v633 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                            v634 = *MEMORY[0x1E0D025B8];
                                                                                                                            v948 = *MEMORY[0x1E0CB2D50];
                                                                                                                            v692 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleGoodnessScore"));
                                                                                                                            v949 = v692;
                                                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v949, &v948, 1);
                                                                                                                            v695 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                            v877 = 0;
                                                                                                                            v696 = 0;
                                                                                                                            *v862 = (id)objc_msgSend(v633, "initWithDomain:code:userInfo:", v634, 2);
                                                                                                                            goto LABEL_1020;
                                                                                                                          }
                                                                                                                          v877 = 0;
                                                                                                                          v696 = 0;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v696 = 0;
LABEL_999:
                                                                                                                          objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("distinctnessScore"));
                                                                                                                          v695 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                          if (v695 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                          {
                                                                                                                            objc_opt_class();
                                                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                            {
                                                                                                                              v692 = v695;
                                                                                                                              goto LABEL_1002;
                                                                                                                            }
                                                                                                                            if (v862)
                                                                                                                            {
                                                                                                                              v639 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                              v640 = *MEMORY[0x1E0D025B8];
                                                                                                                              v946 = *MEMORY[0x1E0CB2D50];
                                                                                                                              v690 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("distinctnessScore"));
                                                                                                                              v947 = v690;
                                                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v947, &v946, 1);
                                                                                                                              v693 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                              v877 = 0;
                                                                                                                              v692 = 0;
                                                                                                                              *v862 = (id)objc_msgSend(v639, "initWithDomain:code:userInfo:", v640, 2);
                                                                                                                              goto LABEL_1019;
                                                                                                                            }
                                                                                                                            v692 = 0;
                                                                                                                            v877 = 0;
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v692 = 0;
LABEL_1002:
                                                                                                                            objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("richnessScore"));
                                                                                                                            v693 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                            if (v693 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                            {
                                                                                                                              objc_opt_class();
                                                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                              {
                                                                                                                                v690 = v693;
                                                                                                                                goto LABEL_1005;
                                                                                                                              }
                                                                                                                              if (v862)
                                                                                                                              {
                                                                                                                                v641 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                                v642 = *MEMORY[0x1E0D025B8];
                                                                                                                                v944 = *MEMORY[0x1E0CB2D50];
                                                                                                                                v688 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("richnessScore"));
                                                                                                                                v945 = v688;
                                                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v945, &v944, 1);
                                                                                                                                v691 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                v877 = 0;
                                                                                                                                v690 = 0;
                                                                                                                                *v862 = (id)objc_msgSend(v641, "initWithDomain:code:userInfo:", v642, 2);
                                                                                                                                goto LABEL_1018;
                                                                                                                              }
                                                                                                                              v690 = 0;
                                                                                                                              v877 = 0;
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v690 = 0;
LABEL_1005:
                                                                                                                              objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("engagementScore"));
                                                                                                                              v691 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                              if (v691 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                              {
                                                                                                                                objc_opt_class();
                                                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                                {
                                                                                                                                  v688 = v691;
                                                                                                                                  goto LABEL_1008;
                                                                                                                                }
                                                                                                                                if (v862)
                                                                                                                                {
                                                                                                                                  v643 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                                  v644 = *MEMORY[0x1E0D025B8];
                                                                                                                                  v942 = *MEMORY[0x1E0CB2D50];
                                                                                                                                  v686 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("engagementScore"));
                                                                                                                                  v943 = v686;
                                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v943, &v942, 1);
                                                                                                                                  v689 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                  v877 = 0;
                                                                                                                                  v688 = 0;
                                                                                                                                  *v862 = (id)objc_msgSend(v643, "initWithDomain:code:userInfo:", v644, 2);
                                                                                                                                  goto LABEL_1017;
                                                                                                                                }
                                                                                                                                v688 = 0;
                                                                                                                                v877 = 0;
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                v688 = 0;
LABEL_1008:
                                                                                                                                objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("heuristicsScore"));
                                                                                                                                v689 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                if (v689 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                                {
                                                                                                                                  objc_opt_class();
                                                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                                  {
                                                                                                                                    v686 = v689;
                                                                                                                                    goto LABEL_1011;
                                                                                                                                  }
                                                                                                                                  if (v862)
                                                                                                                                  {
                                                                                                                                    v645 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                                    v646 = *MEMORY[0x1E0D025B8];
                                                                                                                                    v940 = *MEMORY[0x1E0CB2D50];
                                                                                                                                    v687 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("heuristicsScore"));
                                                                                                                                    v941 = v687;
                                                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v941, &v940, 1);
                                                                                                                                    v608 = (BMMomentsEventDataEventBundleMetadataForRank *)objc_claimAutoreleasedReturnValue();
                                                                                                                                    v877 = 0;
                                                                                                                                    v686 = 0;
                                                                                                                                    *v862 = (id)objc_msgSend(v645, "initWithDomain:code:userInfo:", v646, 2);
                                                                                                                                    goto LABEL_1015;
                                                                                                                                  }
                                                                                                                                  v686 = 0;
                                                                                                                                  v877 = 0;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v686 = 0;
LABEL_1011:
                                                                                                                                  objc_msgSend(v388, "objectForKeyedSubscript:", CFSTR("metadataForRank"));
                                                                                                                                  v687 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                  if (!v687 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                                                  {
                                                                                                                                    v608 = 0;
                                                                                                                                    goto LABEL_1014;
                                                                                                                                  }
                                                                                                                                  objc_opt_class();
                                                                                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                                                  {
                                                                                                                                    v635 = v687;
                                                                                                                                    v636 = [BMMomentsEventDataEventBundleMetadataForRank alloc];
                                                                                                                                    v892 = 0;
                                                                                                                                    v608 = -[BMMomentsEventDataEventBundleMetadataForRank initWithJSONDictionary:error:](v636, "initWithJSONDictionary:error:", v635, &v892);
                                                                                                                                    v637 = v892;
                                                                                                                                    if (v637)
                                                                                                                                    {
                                                                                                                                      v638 = v637;
                                                                                                                                      if (v862)
                                                                                                                                        *v862 = objc_retainAutorelease(v637);

                                                                                                                                      v877 = 0;
                                                                                                                                      v687 = v635;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {

LABEL_1014:
                                                                                                                                      v609 = objc_msgSend(v847, "intValue");
                                                                                                                                      v878 = objc_msgSend(v854, "intValue");
                                                                                                                                      v864 = objc_msgSend(v852, "intValue");
                                                                                                                                      v685 = objc_msgSend(v848, "intValue");
                                                                                                                                      v684 = objc_msgSend(v842, "intValue");
                                                                                                                                      v683 = objc_msgSend(v820, "intValue");
                                                                                                                                      v682 = objc_msgSend(v811, "intValue");
                                                                                                                                      v681 = objc_msgSend(v804, "intValue");
                                                                                                                                      v680 = objc_msgSend(v790, "intValue");
                                                                                                                                      v679 = objc_msgSend(v778, "intValue");
                                                                                                                                      v678 = objc_msgSend(v776, "intValue");
                                                                                                                                      v677 = objc_msgSend(v765, "intValue");
                                                                                                                                      v676 = objc_msgSend(v755, "intValue");
                                                                                                                                      v675 = objc_msgSend(v753, "intValue");
                                                                                                                                      v674 = objc_msgSend(v750, "intValue");
                                                                                                                                      v673 = objc_msgSend(v748, "intValue");
                                                                                                                                      v672 = objc_msgSend(v744, "intValue");
                                                                                                                                      v671 = objc_msgSend(v742, "intValue");
                                                                                                                                      v670 = objc_msgSend(v740, "intValue");
                                                                                                                                      v669 = objc_msgSend(v739, "intValue");
                                                                                                                                      v668 = objc_msgSend(v736, "intValue");
                                                                                                                                      v667 = objc_msgSend(v735, "intValue");
                                                                                                                                      v610 = objc_msgSend(v733, "intValue");
                                                                                                                                      v611 = objc_msgSend(v732, "intValue");
                                                                                                                                      v612 = objc_msgSend(v729, "intValue");
                                                                                                                                      objc_msgSend(v725, "intValue");
                                                                                                                                      objc_msgSend(v722, "intValue");
                                                                                                                                      objc_msgSend(v720, "intValue");
                                                                                                                                      LODWORD(v666) = v680;
                                                                                                                                      LODWORD(v665) = v681;
                                                                                                                                      LODWORD(v664) = v682;
                                                                                                                                      LODWORD(v663) = v683;
                                                                                                                                      LODWORD(v662) = v684;
                                                                                                                                      LODWORD(v661) = v685;
                                                                                                                                      v874 = -[BMMomentsEventDataEventBundle initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:](v874, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:", v888, v857, v879, v875, v873, v609, v870, v871, v868, v865, v860, v858, v856, __PAIR64__(v864, v878), v661, v884, v843, v845, v840, v662, v833, v830, v828, v826, v824, v822, v663, v819, v817, v664, v813, v810, v808, v806, v665, v802, v800, v798, v795, v794, v792, v666, v788, v786, v780, __PAIR64__(v678, v679), v775, v772, v771, v769, v767, v783, v400, __PAIR64__(v676, v677), __PAIR64__(v674, v675), __PAIR64__(v672, v673), __PAIR64__(v670, v671), __PAIR64__(v668, v669), __PAIR64__(v610, v667), __PAIR64__(v612, v611), v726);
                                                                                                                                      v877 = v874;
                                                                                                                                    }
LABEL_1015:

                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    if (v862)
                                                                                                                                    {
                                                                                                                                      v647 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                                      v648 = *MEMORY[0x1E0D025B8];
                                                                                                                                      v938 = *MEMORY[0x1E0CB2D50];
                                                                                                                                      v608 = (BMMomentsEventDataEventBundleMetadataForRank *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("metadataForRank"));
                                                                                                                                      v939 = v608;
                                                                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v939, &v938, 1);
                                                                                                                                      v649 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                      *v862 = (id)objc_msgSend(v647, "initWithDomain:code:userInfo:", v648, 2, v649);

                                                                                                                                      v877 = 0;
                                                                                                                                      goto LABEL_1015;
                                                                                                                                    }
                                                                                                                                    v877 = 0;
                                                                                                                                  }

                                                                                                                                }
LABEL_1017:

                                                                                                                              }
LABEL_1018:

                                                                                                                            }
LABEL_1019:

                                                                                                                          }
LABEL_1020:

                                                                                                                        }
LABEL_1022:

                                                                                                                      }
LABEL_1029:

                                                                                                                    }
LABEL_1033:

LABEL_1034:
LABEL_1035:

LABEL_1036:
LABEL_1037:

LABEL_1038:
LABEL_1039:

LABEL_1040:
LABEL_1041:

LABEL_1042:
LABEL_1044:

LABEL_1045:
LABEL_1046:

LABEL_1047:
LABEL_1048:

LABEL_1049:
LABEL_1050:

LABEL_1051:
LABEL_1052:

LABEL_1053:
LABEL_1054:

LABEL_1055:
LABEL_1056:

LABEL_1057:
LABEL_1058:

LABEL_1059:
LABEL_1060:

LABEL_1061:
LABEL_1062:

LABEL_1063:
LABEL_1064:

LABEL_1065:
LABEL_1066:

LABEL_1067:
LABEL_1068:

                                                                                                                    goto LABEL_1069;
                                                                                                                  }
                                                                                                                }
                                                                                                                if (v862)
                                                                                                                {
                                                                                                                  v613 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                                  v614 = *MEMORY[0x1E0D025B8];
                                                                                                                  v956 = *MEMORY[0x1E0CB2D50];
                                                                                                                  v698 = (BMMomentsEventDataEventBundleClusterMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("photoTraits"));
                                                                                                                  v957 = v698;
                                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v957, &v956, 1);
                                                                                                                  v615 = objc_claimAutoreleasedReturnValue();
                                                                                                                  v616 = v613;
                                                                                                                  v617 = v614;
LABEL_1028:
                                                                                                                  v607 = (void *)v615;
                                                                                                                  v877 = 0;
                                                                                                                  *v862 = (id)objc_msgSend(v616, "initWithDomain:code:userInfo:", v617, 2);
                                                                                                                  v701 = v700;
                                                                                                                  goto LABEL_1029;
                                                                                                                }
LABEL_1032:
                                                                                                                v877 = 0;
                                                                                                                v701 = v700;
                                                                                                                goto LABEL_1033;
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                  if (v862)
                                                                                                  {
                                                                                                    v422 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                    v423 = *MEMORY[0x1E0D025B8];
                                                                                                    v1049 = *MEMORY[0x1E0CB2D50];
                                                                                                    v781 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleSourceScreenTimeExists"));
                                                                                                    v1050 = v781;
                                                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1050, &v1049, 1);
                                                                                                    v784 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v767 = 0;
                                                                                                    v877 = 0;
                                                                                                    *v862 = (id)objc_msgSend(v422, "initWithDomain:code:userInfo:", v423, 2);
                                                                                                    v59 = v879;
                                                                                                    v60 = v875;
                                                                                                    v29 = v889;
                                                                                                    v61 = v873;
                                                                                                    v39 = v838;
                                                                                                    v98 = v859;
                                                                                                    v143 = obj;
                                                                                                    v284 = v811;

                                                                                                    goto LABEL_1072;
                                                                                                  }
                                                                                                  v767 = 0;
                                                                                                  v877 = 0;
LABEL_610:
                                                                                                  v16 = v888;
                                                                                                  v59 = v879;
                                                                                                  v60 = v875;
                                                                                                  v29 = v889;
                                                                                                  v61 = v873;
                                                                                                  v39 = v838;
                                                                                                  v98 = v859;
                                                                                                  v143 = obj;
                                                                                                  v284 = v811;
                                                                                                  goto LABEL_1073;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                                {
                                                                                                  v769 = v770;
                                                                                                  goto LABEL_505;
                                                                                                }
                                                                                                if (v862)
                                                                                                {
                                                                                                  v416 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                  v417 = *MEMORY[0x1E0D025B8];
                                                                                                  v1051 = *MEMORY[0x1E0CB2D50];
                                                                                                  v767 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleSourceBooksExists"));
                                                                                                  v1052 = v767;
                                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1052, &v1051, 1);
                                                                                                  v768 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  v769 = 0;
                                                                                                  v877 = 0;
                                                                                                  *v862 = (id)objc_msgSend(v416, "initWithDomain:code:userInfo:", v417, 2);
                                                                                                  goto LABEL_610;
                                                                                                }
                                                                                                v769 = 0;
                                                                                                v877 = 0;
                                                                                                v16 = v888;
LABEL_605:
                                                                                                v59 = v879;
                                                                                                v60 = v875;
                                                                                                v29 = v889;
                                                                                                v61 = v873;
                                                                                                v39 = v838;
                                                                                                v98 = v859;
                                                                                                v143 = obj;
                                                                                                v284 = v811;
                                                                                                goto LABEL_1074;
                                                                                              }
                                                                                              objc_opt_class();
                                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                              {
                                                                                                v771 = v773;
                                                                                                goto LABEL_502;
                                                                                              }
                                                                                              if (v862)
                                                                                              {
                                                                                                v410 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                                v411 = *MEMORY[0x1E0D025B8];
                                                                                                v1053 = *MEMORY[0x1E0CB2D50];
                                                                                                v769 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleSourceMotionExists"));
                                                                                                v1054 = v769;
                                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1054, &v1053, 1);
                                                                                                v770 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                v771 = 0;
                                                                                                v877 = 0;
                                                                                                *v862 = (id)objc_msgSend(v410, "initWithDomain:code:userInfo:", v411, 2);
                                                                                                v16 = v888;
                                                                                                goto LABEL_605;
                                                                                              }
                                                                                              v771 = 0;
                                                                                              v877 = 0;
                                                                                              v16 = v888;
                                                                                              v59 = v879;
                                                                                              v60 = v875;
                                                                                              v29 = v889;
                                                                                              v61 = v873;
                                                                                              v39 = v838;
LABEL_597:
                                                                                              v98 = v859;
                                                                                              v143 = obj;
                                                                                              v284 = v811;
                                                                                              goto LABEL_1075;
                                                                                            }
                                                                                            v389 = v39;
                                                                                            objc_opt_class();
                                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                            {
                                                                                              v772 = v774;
                                                                                              goto LABEL_499;
                                                                                            }
                                                                                            v401 = v888;
                                                                                            if (v862)
                                                                                            {
                                                                                              v406 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                              v407 = *MEMORY[0x1E0D025B8];
                                                                                              v1055 = *MEMORY[0x1E0CB2D50];
                                                                                              v771 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleSourcePDExists"));
                                                                                              v1056 = v771;
                                                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1056, &v1055, 1);
                                                                                              v773 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              v772 = 0;
                                                                                              v877 = 0;
                                                                                              *v862 = (id)objc_msgSend(v406, "initWithDomain:code:userInfo:", v407, 2);
                                                                                              v16 = v888;
                                                                                              v59 = v879;
                                                                                              v60 = v875;
                                                                                              v29 = v889;
                                                                                              v61 = v873;
                                                                                              v39 = v389;
                                                                                              goto LABEL_597;
                                                                                            }
                                                                                            v772 = 0;
                                                                                            v877 = 0;
LABEL_592:
                                                                                            v16 = v401;
                                                                                            v59 = v879;
                                                                                            v60 = v875;
                                                                                            v29 = v889;
                                                                                            v61 = v873;
                                                                                            v39 = v389;
                                                                                            v98 = v859;
                                                                                            v143 = obj;
                                                                                            v284 = v811;
                                                                                            goto LABEL_1076;
                                                                                          }
                                                                                          v389 = v39;
                                                                                          objc_opt_class();
                                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                          {
                                                                                            v775 = v777;
                                                                                            goto LABEL_496;
                                                                                          }
                                                                                          v401 = v888;
                                                                                          if (v862)
                                                                                          {
                                                                                            v402 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                            v403 = *MEMORY[0x1E0D025B8];
                                                                                            v1057 = *MEMORY[0x1E0CB2D50];
                                                                                            v772 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleSourcePostAnalyticsExists"));
                                                                                            v1058 = v772;
                                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1058, &v1057, 1);
                                                                                            v774 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v775 = 0;
                                                                                            v877 = 0;
                                                                                            *v862 = (id)objc_msgSend(v402, "initWithDomain:code:userInfo:", v403, 2);
                                                                                            goto LABEL_592;
                                                                                          }
                                                                                          v775 = 0;
                                                                                          v877 = 0;
                                                                                          v16 = v888;
                                                                                          v59 = v879;
                                                                                          v60 = v875;
                                                                                          v29 = v889;
                                                                                          v61 = v873;
LABEL_586:
                                                                                          v98 = v859;
                                                                                          v143 = obj;
                                                                                          v284 = v811;
                                                                                          goto LABEL_1077;
                                                                                        }
                                                                                        v371 = v888;
                                                                                        objc_opt_class();
                                                                                        v383 = v779;
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v776 = v779;
LABEL_492:

                                                                                          v6 = v849;
                                                                                          v39 = v838;
                                                                                          goto LABEL_493;
                                                                                        }
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                        {
                                                                                          v383 = v779;
                                                                                          v384 = v779;
                                                                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPhotoLibraryTypeFromString(v384));
                                                                                          v776 = (id)objc_claimAutoreleasedReturnValue();

                                                                                          goto LABEL_492;
                                                                                        }
                                                                                        if (v862)
                                                                                        {
                                                                                          v420 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                          v421 = *MEMORY[0x1E0D025B8];
                                                                                          v1059 = *MEMORY[0x1E0CB2D50];
                                                                                          v775 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("photoLibraryType"));
                                                                                          v1060 = v775;
                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1060, &v1059, 1);
                                                                                          v777 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v776 = 0;
                                                                                          v877 = 0;
                                                                                          *v862 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                                          v16 = v888;
                                                                                          v59 = v879;
                                                                                          v60 = v875;
                                                                                          v29 = v889;
                                                                                          v61 = v873;
                                                                                          v39 = v838;
                                                                                          goto LABEL_586;
                                                                                        }
                                                                                        v776 = 0;
                                                                                        v877 = 0;
LABEL_608:
                                                                                        v16 = v371;
                                                                                        v59 = v879;
                                                                                        v60 = v875;
                                                                                        v29 = v889;
                                                                                        v61 = v873;
                                                                                        v39 = v838;
                                                                                        v98 = v859;
                                                                                        v143 = obj;
                                                                                        v284 = v811;
                                                                                        goto LABEL_1078;
                                                                                      }
                                                                                      v371 = v888;
                                                                                      objc_opt_class();
                                                                                      v372 = v785;
                                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                      {
                                                                                        v778 = v785;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                        {
                                                                                          if (!v862)
                                                                                          {
                                                                                            v778 = 0;
                                                                                            v877 = 0;
                                                                                            v16 = v888;
                                                                                            v59 = v879;
                                                                                            v60 = v875;
                                                                                            v29 = v889;
                                                                                            v61 = v873;
                                                                                            v39 = v838;
                                                                                            v98 = v859;
                                                                                            v143 = obj;
                                                                                            v284 = v811;
                                                                                            goto LABEL_1079;
                                                                                          }
                                                                                          v418 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                          v419 = *MEMORY[0x1E0D025B8];
                                                                                          v1061 = *MEMORY[0x1E0CB2D50];
                                                                                          v776 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("photoSourceType"));
                                                                                          v1062 = v776;
                                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1062, &v1061, 1);
                                                                                          v779 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v778 = 0;
                                                                                          v877 = 0;
                                                                                          *v862 = (id)objc_msgSend(v418, "initWithDomain:code:userInfo:", v419, 2);
                                                                                          goto LABEL_608;
                                                                                        }
                                                                                        v372 = v785;
                                                                                        v382 = v785;
                                                                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPhotoSourceTypeFromString(v382));
                                                                                        v778 = (id)objc_claimAutoreleasedReturnValue();

                                                                                      }
                                                                                      v6 = v849;
                                                                                      v39 = v838;
                                                                                      goto LABEL_485;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                    {
                                                                                      v792 = v345;
                                                                                      goto LABEL_410;
                                                                                    }
                                                                                    if (v862)
                                                                                    {
                                                                                      v358 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                      v359 = *MEMORY[0x1E0D025B8];
                                                                                      v1071 = *MEMORY[0x1E0CB2D50];
                                                                                      v790 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("appEntryEventAddedCharacters"));
                                                                                      v1072 = v790;
                                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1072, &v1071, 1);
                                                                                      v791 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v792 = 0;
                                                                                      v877 = 0;
                                                                                      *v862 = (id)objc_msgSend(v358, "initWithDomain:code:userInfo:", v359, 2);
                                                                                      v59 = v879;
                                                                                      v60 = v875;
                                                                                      v29 = v889;
                                                                                      v61 = v873;
                                                                                      v98 = v859;
                                                                                      v284 = v811;
                                                                                      v16 = v888;
                                                                                      goto LABEL_1083;
                                                                                    }
                                                                                    v792 = 0;
                                                                                    v877 = 0;
                                                                                  }
                                                                                  v59 = v879;
                                                                                  v60 = v875;
                                                                                  v29 = v889;
                                                                                  v61 = v873;
                                                                                  v98 = v859;
                                                                                  v284 = v811;
                                                                                  v16 = v888;
                                                                                  goto LABEL_1084;
                                                                                }
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  v350 = v341;
                                                                                  v351 = objc_alloc(MEMORY[0x1E0C99D68]);
                                                                                  objc_msgSend(v350, "doubleValue");
                                                                                  v795 = (id)objc_msgSend(v351, "initWithTimeIntervalSince1970:");

                                                                                  goto LABEL_404;
                                                                                }
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  v354 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                                                                  v355 = v341;
                                                                                  objc_msgSend(v354, "dateFromString:", v355);
                                                                                  v795 = (id)objc_claimAutoreleasedReturnValue();

                                                                                  goto LABEL_404;
                                                                                }
                                                                                v839 = v39;
                                                                                v379 = v888;
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  v795 = v797;
                                                                                  v6 = v849;
                                                                                  v39 = v839;
                                                                                  v143 = obj;
                                                                                  goto LABEL_404;
                                                                                }
                                                                                if (v862)
                                                                                {
                                                                                  v414 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                  v415 = *MEMORY[0x1E0D025B8];
                                                                                  v1075 = *MEMORY[0x1E0CB2D50];
                                                                                  v794 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("appEntryEventEndTime"));
                                                                                  v1076 = v794;
                                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1076, &v1075, 1);
                                                                                  v796 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v795 = 0;
                                                                                  v877 = 0;
                                                                                  *v862 = (id)objc_msgSend(v414, "initWithDomain:code:userInfo:", v415, 2);
                                                                                  v16 = v888;
                                                                                  v59 = v879;
                                                                                  v60 = v875;
                                                                                  v29 = v889;
                                                                                  v61 = v873;
                                                                                  v39 = v839;
                                                                                  v98 = v859;
                                                                                  v143 = obj;
                                                                                  v284 = v811;
                                                                                  goto LABEL_1085;
                                                                                }
                                                                                v795 = 0;
                                                                                v877 = 0;
LABEL_601:
                                                                                v16 = v379;
                                                                                v59 = v879;
                                                                                v60 = v875;
                                                                                v29 = v889;
                                                                                v61 = v873;
                                                                                v39 = v839;
                                                                                v98 = v859;
                                                                                v143 = obj;
                                                                                v284 = v811;
                                                                                goto LABEL_1086;
                                                                              }
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                v348 = v339;
                                                                                v349 = objc_alloc(MEMORY[0x1E0C99D68]);
                                                                                objc_msgSend(v348, "doubleValue");
                                                                                v798 = (id)objc_msgSend(v349, "initWithTimeIntervalSince1970:");

                                                                                goto LABEL_401;
                                                                              }
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                v352 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                                                                v353 = v339;
                                                                                objc_msgSend(v352, "dateFromString:", v353);
                                                                                v798 = (id)objc_claimAutoreleasedReturnValue();

                                                                                goto LABEL_401;
                                                                              }
                                                                              v839 = v39;
                                                                              v379 = v888;
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                              {
                                                                                v798 = v799;
                                                                                v6 = v849;
                                                                                v39 = v839;
                                                                                v143 = obj;
                                                                                goto LABEL_401;
                                                                              }
                                                                              if (v862)
                                                                              {
                                                                                v412 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v413 = *MEMORY[0x1E0D025B8];
                                                                                v1077 = *MEMORY[0x1E0CB2D50];
                                                                                v795 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("appEntryEventStartTime"));
                                                                                v1078 = v795;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1078, &v1077, 1);
                                                                                v797 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                v798 = 0;
                                                                                v877 = 0;
                                                                                *v862 = (id)objc_msgSend(v412, "initWithDomain:code:userInfo:", v413, 2);
                                                                                goto LABEL_601;
                                                                              }
                                                                              v798 = 0;
                                                                              v877 = 0;
                                                                              v16 = v888;
LABEL_599:
                                                                              v59 = v879;
                                                                              v60 = v875;
                                                                              v29 = v889;
                                                                              v61 = v873;
                                                                              v39 = v839;
                                                                              v98 = v859;
                                                                              v143 = obj;
                                                                              v284 = v811;
                                                                              goto LABEL_1087;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                            {
                                                                              v326 = v325;
                                                                              v327 = objc_alloc(MEMORY[0x1E0C99D68]);
                                                                              objc_msgSend(v326, "doubleValue");
                                                                              v800 = (id)objc_msgSend(v327, "initWithTimeIntervalSince1970:");
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                              {
                                                                                v839 = v39;
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                                {
                                                                                  v800 = v801;
                                                                                  v6 = v849;
                                                                                  v143 = obj;
                                                                                  goto LABEL_398;
                                                                                }
                                                                                if (!v862)
                                                                                {
                                                                                  v800 = 0;
                                                                                  v877 = 0;
                                                                                  v16 = v888;
                                                                                  v59 = v879;
                                                                                  v60 = v875;
                                                                                  v29 = v889;
                                                                                  v61 = v873;
                                                                                  v98 = v859;
                                                                                  v143 = obj;
                                                                                  v284 = v811;
                                                                                  goto LABEL_1088;
                                                                                }
                                                                                v408 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                                v409 = *MEMORY[0x1E0D025B8];
                                                                                v1079 = *MEMORY[0x1E0CB2D50];
                                                                                v798 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("appEntryEventTimestamp"));
                                                                                v1080 = v798;
                                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1080, &v1079, 1);
                                                                                v799 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                v800 = 0;
                                                                                v877 = 0;
                                                                                *v862 = (id)objc_msgSend(v408, "initWithDomain:code:userInfo:", v409, 2);
                                                                                v16 = v888;
                                                                                goto LABEL_599;
                                                                              }
                                                                              v326 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                                                              v337 = v325;
                                                                              objc_msgSend(v326, "dateFromString:", v337);
                                                                              v800 = (id)objc_claimAutoreleasedReturnValue();

                                                                            }
                                                                            goto LABEL_398;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                          {
                                                                            v802 = v323;
                                                                            goto LABEL_378;
                                                                          }
                                                                          if (v862)
                                                                          {
                                                                            v333 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                            v334 = *MEMORY[0x1E0D025B8];
                                                                            v1081 = *MEMORY[0x1E0CB2D50];
                                                                            v800 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appEntryEventClientIdentifier"));
                                                                            v1082 = v800;
                                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1082, &v1081, 1);
                                                                            v335 = objc_claimAutoreleasedReturnValue();
                                                                            v336 = v333;
                                                                            v29 = v889;
                                                                            v801 = (void *)v335;
                                                                            v802 = 0;
                                                                            v877 = 0;
                                                                            *v862 = (id)objc_msgSend(v336, "initWithDomain:code:userInfo:", v334, 2);
                                                                            v59 = v879;
                                                                            v60 = v875;
                                                                            v61 = v873;
                                                                            v98 = v859;
                                                                            v284 = v811;
                                                                            v16 = v888;
                                                                            goto LABEL_1088;
                                                                          }
                                                                          v802 = 0;
                                                                          v877 = 0;
                                                                          v59 = v879;
                                                                          v60 = v875;
LABEL_481:
                                                                          v61 = v873;
                                                                          v98 = v859;
                                                                          v284 = v811;
                                                                          v16 = v888;
                                                                          goto LABEL_1089;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v804 = v301;
LABEL_374:

                                                                          v29 = v889;
                                                                          goto LABEL_375;
                                                                        }
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                        {
                                                                          v318 = v805;
                                                                          v319 = (void *)MEMORY[0x1E0CB37E8];
                                                                          v320 = BMMomentsEventDataAppEntryEventTypeFromString(v318);
                                                                          v321 = v319;
                                                                          v301 = v805;
                                                                          objc_msgSend(v321, "numberWithInt:", v320);
                                                                          v804 = (id)objc_claimAutoreleasedReturnValue();

                                                                          goto LABEL_374;
                                                                        }
                                                                        if (v862)
                                                                        {
                                                                          v360 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                          v361 = *MEMORY[0x1E0D025B8];
                                                                          v1083 = *MEMORY[0x1E0CB2D50];
                                                                          v802 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("appEntryEventType"));
                                                                          v1084 = v802;
                                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1084, &v1083, 1);
                                                                          v803 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v804 = 0;
                                                                          v877 = 0;
                                                                          *v862 = (id)objc_msgSend(v360, "initWithDomain:code:userInfo:", v361, 2);
                                                                          v59 = v879;
                                                                          v60 = v875;
                                                                          v29 = v889;
                                                                          goto LABEL_481;
                                                                        }
                                                                        v804 = 0;
                                                                        v877 = 0;
                                                                        v59 = v879;
                                                                        v60 = v875;
                                                                        v29 = v889;
LABEL_555:
                                                                        v61 = v873;
                                                                        v98 = v859;
                                                                        v284 = v811;
                                                                        v16 = v888;
                                                                        goto LABEL_1090;
                                                                      }
                                                                      objc_opt_class();
                                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                      {
                                                                        v806 = v299;
                                                                        goto LABEL_348;
                                                                      }
                                                                      if (v862)
                                                                      {
                                                                        v314 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                        v315 = *MEMORY[0x1E0D025B8];
                                                                        v1085 = *MEMORY[0x1E0CB2D50];
                                                                        v804 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("suggestionViewVisibleTime"));
                                                                        v1086 = v804;
                                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1086, &v1085, 1);
                                                                        v316 = objc_claimAutoreleasedReturnValue();
                                                                        v317 = v314;
                                                                        v29 = v889;
                                                                        v805 = (void *)v316;
                                                                        v806 = 0;
                                                                        v877 = 0;
                                                                        *v862 = (id)objc_msgSend(v317, "initWithDomain:code:userInfo:", v315, 2);
                                                                        v59 = v879;
                                                                        v60 = v875;
                                                                        goto LABEL_555;
                                                                      }
                                                                      v806 = 0;
                                                                      v877 = 0;
LABEL_464:
                                                                      v59 = v879;
                                                                      v60 = v875;
                                                                      v61 = v873;
                                                                      v98 = v859;
                                                                      v284 = v811;
                                                                      v16 = v888;
                                                                      goto LABEL_1091;
                                                                    }
                                                                    objc_opt_class();
                                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                    {
                                                                      v808 = v297;
                                                                      goto LABEL_345;
                                                                    }
                                                                    if (v862)
                                                                    {
                                                                      v310 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                      v311 = *MEMORY[0x1E0D025B8];
                                                                      v1087 = *MEMORY[0x1E0CB2D50];
                                                                      v806 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestionViewContainerName"));
                                                                      v1088 = v806;
                                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1088, &v1087, 1);
                                                                      v312 = objc_claimAutoreleasedReturnValue();
                                                                      v313 = v310;
                                                                      v29 = v889;
                                                                      v807 = (void *)v312;
                                                                      v808 = 0;
                                                                      v877 = 0;
                                                                      *v862 = (id)objc_msgSend(v313, "initWithDomain:code:userInfo:", v311, 2);
                                                                      goto LABEL_464;
                                                                    }
                                                                    v808 = 0;
                                                                    v877 = 0;
LABEL_435:
                                                                    v59 = v879;
                                                                    v60 = v875;
                                                                    v61 = v873;
                                                                    v98 = v859;
                                                                    v284 = v811;
                                                                    v16 = v888;
                                                                    goto LABEL_1092;
                                                                  }
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                  {
                                                                    v810 = v295;
                                                                    goto LABEL_342;
                                                                  }
                                                                  if (v862)
                                                                  {
                                                                    v302 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                    v303 = *MEMORY[0x1E0D025B8];
                                                                    v1089 = *MEMORY[0x1E0CB2D50];
                                                                    v808 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestionClientIdentifier"));
                                                                    v1090 = v808;
                                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1090, &v1089, 1);
                                                                    v304 = objc_claimAutoreleasedReturnValue();
                                                                    v305 = v302;
                                                                    v29 = v889;
                                                                    v809 = (void *)v304;
                                                                    v810 = 0;
                                                                    v877 = 0;
                                                                    *v862 = (id)objc_msgSend(v305, "initWithDomain:code:userInfo:", v303, 2);
                                                                    goto LABEL_435;
                                                                  }
                                                                  v810 = 0;
                                                                  v877 = 0;
                                                                  v59 = v879;
                                                                  v60 = v875;
LABEL_467:
                                                                  v61 = v873;
                                                                  v98 = v859;
                                                                  v284 = v811;
                                                                  v16 = v888;
                                                                  goto LABEL_1093;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v288 = v287;
                                                                  v289 = objc_alloc(MEMORY[0x1E0C99D68]);
                                                                  objc_msgSend(v288, "doubleValue");
                                                                  v290 = v289;
                                                                  v29 = v889;
                                                                  v813 = (id)objc_msgSend(v290, "initWithTimeIntervalSince1970:");
LABEL_338:

                                                                  goto LABEL_339;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v291 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                                                                  v292 = v287;
                                                                  v288 = v291;
                                                                  v293 = v292;
                                                                  objc_msgSend(v288, "dateFromString:", v293);
                                                                  v813 = (id)objc_claimAutoreleasedReturnValue();

                                                                  v29 = v889;
                                                                  goto LABEL_338;
                                                                }
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                                {
                                                                  v813 = v287;
                                                                  goto LABEL_339;
                                                                }
                                                                if (v862)
                                                                {
                                                                  v375 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                  v376 = *MEMORY[0x1E0D025B8];
                                                                  v1091 = *MEMORY[0x1E0CB2D50];
                                                                  v810 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("suggestionTimestamp"));
                                                                  v1092 = v810;
                                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1092, &v1091, 1);
                                                                  v812 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v813 = 0;
                                                                  v877 = 0;
                                                                  *v862 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v376, 2);
                                                                  v59 = v879;
                                                                  v60 = v875;
                                                                  v29 = v889;
                                                                  goto LABEL_467;
                                                                }
                                                                v813 = 0;
                                                                v877 = 0;
                                                                v59 = v879;
                                                                v60 = v875;
                                                                v29 = v889;
                                                                v61 = v873;
                                                                v98 = v859;
                                                                v284 = v811;
LABEL_564:
                                                                v16 = v888;
                                                                goto LABEL_1094;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v811 = v272;
LABEL_328:

                                                                v29 = v889;
                                                                goto LABEL_329;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                                              {
                                                                v285 = v272;
                                                                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataSuggestionTypeFromString(v285));
                                                                v811 = (id)objc_claimAutoreleasedReturnValue();

                                                                goto LABEL_328;
                                                              }
                                                              if (v862)
                                                              {
                                                                v328 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                                v329 = *MEMORY[0x1E0D025B8];
                                                                v1093 = *MEMORY[0x1E0CB2D50];
                                                                v813 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("suggestionType"));
                                                                v1094 = v813;
                                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1094, &v1093, 1);
                                                                v330 = objc_claimAutoreleasedReturnValue();
                                                                v331 = v329;
                                                                v98 = v859;
                                                                v814 = (void *)v330;
                                                                v332 = (id)objc_msgSend(v328, "initWithDomain:code:userInfo:", v331, 2);
                                                                v284 = 0;
                                                                v877 = 0;
                                                                *v862 = v332;
                                                                v59 = v879;
                                                                v60 = v875;
                                                                v29 = v889;
                                                                v61 = v873;
                                                                goto LABEL_564;
                                                              }
                                                              v284 = 0;
                                                              v877 = 0;
                                                              v59 = v879;
                                                              v60 = v875;
                                                              v29 = v889;
LABEL_479:
                                                              v61 = v873;
                                                              v16 = v888;
                                                              goto LABEL_1095;
                                                            }
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                                            {
                                                              v817 = v270;
                                                              goto LABEL_309;
                                                            }
                                                            if (v862)
                                                            {
                                                              v278 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                              v279 = *MEMORY[0x1E0D025B8];
                                                              v1095 = *MEMORY[0x1E0CB2D50];
                                                              v280 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rankingVersion"));
                                                              v1096 = v280;
                                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1096, &v1095, 1);
                                                              v281 = objc_claimAutoreleasedReturnValue();
                                                              v282 = v278;
                                                              v29 = v889;
                                                              v283 = v279;
                                                              v284 = (void *)v280;
                                                              v98 = v859;
                                                              v815 = (void *)v281;
                                                              v817 = 0;
                                                              v877 = 0;
                                                              *v862 = (id)objc_msgSend(v282, "initWithDomain:code:userInfo:", v283, 2);
                                                              v59 = v879;
                                                              v60 = v875;
                                                              goto LABEL_479;
                                                            }
                                                            v817 = 0;
                                                            v877 = 0;
                                                            v59 = v879;
                                                            v60 = v875;
                                                            v61 = v873;
                                                            v277 = v816;
LABEL_394:
                                                            v16 = v888;
                                                            goto LABEL_1096;
                                                          }
                                                          objc_opt_class();
                                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                                          {
                                                            v819 = v268;
                                                            goto LABEL_306;
                                                          }
                                                          if (v862)
                                                          {
                                                            v273 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                            v274 = *MEMORY[0x1E0D025B8];
                                                            v1097 = *MEMORY[0x1E0CB2D50];
                                                            v817 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("bundleVersion"));
                                                            v1098 = v817;
                                                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1098, &v1097, 1);
                                                            v275 = objc_claimAutoreleasedReturnValue();
                                                            v276 = v273;
                                                            v29 = v889;
                                                            v98 = v859;
                                                            v819 = 0;
                                                            v877 = 0;
                                                            *v862 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v274, 2, v275);
                                                            v277 = (void *)v275;
                                                            v59 = v879;
                                                            v60 = v875;
                                                            v61 = v873;
                                                            goto LABEL_394;
                                                          }
                                                          v819 = 0;
                                                          v877 = 0;
                                                          v59 = v879;
                                                          v60 = v875;
LABEL_386:
                                                          v61 = v873;
                                                          v16 = v888;
                                                          goto LABEL_1097;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v820 = v234;
LABEL_302:

                                                          v29 = v889;
                                                          goto LABEL_303;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                                        {
                                                          v266 = v234;
                                                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataBundleEngagementTypeFromString(v266));
                                                          v820 = (id)objc_claimAutoreleasedReturnValue();

                                                          goto LABEL_302;
                                                        }
                                                        if (v862)
                                                        {
                                                          v306 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                          v307 = *MEMORY[0x1E0D025B8];
                                                          v1099 = *MEMORY[0x1E0CB2D50];
                                                          v819 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundlEngagement"));
                                                          v1100 = v819;
                                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1100, &v1099, 1);
                                                          v308 = objc_claimAutoreleasedReturnValue();
                                                          v309 = v306;
                                                          v98 = v859;
                                                          v818 = (void *)v308;
                                                          v820 = 0;
                                                          v877 = 0;
                                                          *v862 = (id)objc_msgSend(v309, "initWithDomain:code:userInfo:", v307, 2, v308);
                                                          v59 = v879;
                                                          v60 = v875;
                                                          v29 = v889;
                                                          goto LABEL_386;
                                                        }
                                                        v820 = 0;
                                                        v877 = 0;
                                                        v59 = v879;
                                                        v60 = v875;
                                                        v29 = v889;
LABEL_433:
                                                        v61 = v873;
                                                        v16 = v888;
                                                        goto LABEL_1098;
                                                      }
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v822 = v232;
                                                        goto LABEL_266;
                                                      }
                                                      if (v862)
                                                      {
                                                        v261 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                        v262 = *MEMORY[0x1E0D025B8];
                                                        v1101 = *MEMORY[0x1E0CB2D50];
                                                        v820 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBundleResourceTypeInterenceTagIncluded"));
                                                        v1102 = v820;
                                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1102, &v1101, 1);
                                                        v263 = objc_claimAutoreleasedReturnValue();
                                                        v264 = v261;
                                                        v29 = v889;
                                                        v265 = v262;
                                                        v98 = v859;
                                                        v821 = (void *)v263;
                                                        v822 = 0;
                                                        v877 = 0;
                                                        *v862 = (id)objc_msgSend(v264, "initWithDomain:code:userInfo:", v265, 2);
                                                        v59 = v879;
                                                        v60 = v875;
                                                        goto LABEL_433;
                                                      }
                                                      v822 = 0;
                                                      v877 = 0;
LABEL_369:
                                                      v59 = v879;
                                                      v60 = v875;
                                                      v61 = v873;
                                                      v16 = v888;
                                                      goto LABEL_1099;
                                                    }
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v824 = v230;
                                                      goto LABEL_263;
                                                    }
                                                    if (v862)
                                                    {
                                                      v256 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                      v257 = *MEMORY[0x1E0D025B8];
                                                      v1103 = *MEMORY[0x1E0CB2D50];
                                                      v822 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBundleResourceTypeWebLinkIncluded"));
                                                      v1104 = v822;
                                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1104, &v1103, 1);
                                                      v258 = objc_claimAutoreleasedReturnValue();
                                                      v259 = v256;
                                                      v29 = v889;
                                                      v260 = v257;
                                                      v98 = v859;
                                                      v823 = (void *)v258;
                                                      v824 = 0;
                                                      v877 = 0;
                                                      *v862 = (id)objc_msgSend(v259, "initWithDomain:code:userInfo:", v260, 2);
                                                      goto LABEL_369;
                                                    }
                                                    v824 = 0;
                                                    v877 = 0;
LABEL_363:
                                                    v59 = v879;
                                                    v60 = v875;
                                                    v61 = v873;
                                                    v16 = v888;
                                                    goto LABEL_1100;
                                                  }
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                                  {
                                                    v826 = v228;
                                                    goto LABEL_260;
                                                  }
                                                  if (v862)
                                                  {
                                                    v248 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                    v249 = *MEMORY[0x1E0D025B8];
                                                    v1105 = *MEMORY[0x1E0CB2D50];
                                                    v824 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBundleResourceTypeMediaIncluded"));
                                                    v1106 = v824;
                                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1106, &v1105, 1);
                                                    v250 = objc_claimAutoreleasedReturnValue();
                                                    v251 = v248;
                                                    v29 = v889;
                                                    v98 = v859;
                                                    v825 = (void *)v250;
                                                    v826 = 0;
                                                    v877 = 0;
                                                    *v862 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v249, 2);
                                                    goto LABEL_363;
                                                  }
                                                  v826 = 0;
                                                  v877 = 0;
LABEL_335:
                                                  v59 = v879;
                                                  v60 = v875;
                                                  v61 = v873;
                                                  v16 = v888;
                                                  goto LABEL_1101;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                                {
                                                  v828 = v226;
                                                  goto LABEL_257;
                                                }
                                                if (v862)
                                                {
                                                  v244 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                  v245 = *MEMORY[0x1E0D025B8];
                                                  v1107 = *MEMORY[0x1E0CB2D50];
                                                  v826 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBundleResourceTypePhotoAssetsIncluded"));
                                                  v1108 = v826;
                                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1108, &v1107, 1);
                                                  v246 = objc_claimAutoreleasedReturnValue();
                                                  v247 = v244;
                                                  v29 = v889;
                                                  v98 = v859;
                                                  v827 = (void *)v246;
                                                  v828 = 0;
                                                  v877 = 0;
                                                  *v862 = (id)objc_msgSend(v247, "initWithDomain:code:userInfo:", v245, 2);
                                                  goto LABEL_335;
                                                }
                                                v828 = 0;
                                                v877 = 0;
LABEL_325:
                                                v59 = v879;
                                                v60 = v875;
                                                v61 = v873;
                                                v16 = v888;
                                                goto LABEL_1102;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v830 = v224;
                                                goto LABEL_254;
                                              }
                                              if (v862)
                                              {
                                                v240 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                                v241 = *MEMORY[0x1E0D025B8];
                                                v1109 = *MEMORY[0x1E0CB2D50];
                                                v828 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBundleResourceTypeValueIncluded"));
                                                v1110 = v828;
                                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1110, &v1109, 1);
                                                v242 = objc_claimAutoreleasedReturnValue();
                                                v243 = v240;
                                                v29 = v889;
                                                v98 = v859;
                                                v829 = (void *)v242;
                                                v830 = 0;
                                                v877 = 0;
                                                *v862 = (id)objc_msgSend(v243, "initWithDomain:code:userInfo:", v241, 2);
                                                goto LABEL_325;
                                              }
                                              v830 = 0;
                                              v877 = 0;
LABEL_321:
                                              v59 = v879;
                                              v60 = v875;
                                              v61 = v873;
                                              v16 = v888;
                                              goto LABEL_1103;
                                            }
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) != 0)
                                            {
                                              v833 = v222;
                                              goto LABEL_251;
                                            }
                                            if (v862)
                                            {
                                              v235 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v236 = *MEMORY[0x1E0D025B8];
                                              v1111 = *MEMORY[0x1E0CB2D50];
                                              v830 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBundleResourceTypeUnknown"));
                                              v1112 = v830;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1112, &v1111, 1);
                                              v237 = objc_claimAutoreleasedReturnValue();
                                              v238 = v235;
                                              v29 = v889;
                                              v239 = v236;
                                              v98 = v859;
                                              v831 = (void *)v237;
                                              v833 = 0;
                                              v877 = 0;
                                              *v862 = (id)objc_msgSend(v238, "initWithDomain:code:userInfo:", v239, 2);
                                              goto LABEL_321;
                                            }
                                            v833 = 0;
                                            v877 = 0;
                                            v59 = v879;
                                            v60 = v875;
LABEL_299:
                                            v61 = v873;
                                            v16 = v888;
                                            goto LABEL_1104;
                                          }
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v842 = v215;
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v862)
                                              {
                                                v842 = 0;
                                                v877 = 0;
                                                v59 = v879;
                                                v60 = v875;
                                                v29 = v889;
                                                v61 = v873;
                                                v16 = v888;
                                                goto LABEL_1105;
                                              }
                                              v252 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v253 = *MEMORY[0x1E0D025B8];
                                              v1113 = *MEMORY[0x1E0CB2D50];
                                              v833 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("bundleTimeTag"));
                                              v1114 = v833;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1114, &v1113, 1);
                                              v254 = objc_claimAutoreleasedReturnValue();
                                              v255 = v252;
                                              v98 = v859;
                                              v832 = (void *)v254;
                                              v842 = 0;
                                              v877 = 0;
                                              *v862 = (id)objc_msgSend(v255, "initWithDomain:code:userInfo:", v253, 2, v254);
                                              v59 = v879;
                                              v60 = v875;
                                              v29 = v889;
                                              goto LABEL_299;
                                            }
                                            v220 = v215;
                                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataTimeTagTypeFromString(v220));
                                            v842 = (id)objc_claimAutoreleasedReturnValue();

                                          }
                                          v29 = v889;
                                          goto LABEL_248;
                                        }
                                      }
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v182 = v153;
                                      v183 = [BMMomentsEventDataAction alloc];
                                      v933 = 0;
                                      v843 = -[BMMomentsEventDataAction initWithJSONDictionary:error:](v183, "initWithJSONDictionary:error:", v182, &v933);
                                      v184 = v933;
                                      if (!v184)
                                      {

                                        v98 = v859;
                                        goto LABEL_163;
                                      }
                                      v185 = v184;
                                      v846 = v182;
                                      if (v862)
                                        *v862 = objc_retainAutorelease(v184);

                                      v877 = 0;
                                      v844 = v182;
                                    }
                                    else
                                    {
                                      if (!v862)
                                      {
                                        v877 = 0;
                                        v16 = v888;
                                        v59 = v879;
                                        v60 = v875;
                                        v61 = v873;
                                        v98 = v859;
                                        v164 = v844;
                                        v36 = v847;
                                        goto LABEL_1110;
                                      }
                                      v198 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v199 = *MEMORY[0x1E0D025B8];
                                      v1124 = *MEMORY[0x1E0CB2D50];
                                      v843 = (BMMomentsEventDataAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("bundleActionType"));
                                      v1125 = v843;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1125, &v1124, 1);
                                      v200 = objc_claimAutoreleasedReturnValue();
                                      v201 = v198;
                                      v29 = v889;
                                      v846 = (id)v200;
                                      v877 = 0;
                                      *v862 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v199, 2);
                                    }
                                    v16 = v888;
                                    v59 = v879;
                                    v60 = v875;
                                    v61 = v873;
                                    v98 = v859;
                                    v36 = v847;
                                    goto LABEL_1109;
                                  }
                                  v847 = v36;
                                }
                                v29 = v889;
                                goto LABEL_151;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v127 = v126;
LABEL_134:
                                v852 = v127;

                                goto LABEL_135;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v139 = v126;
                                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString(v139));
                                v127 = (id)objc_claimAutoreleasedReturnValue();

                                goto LABEL_134;
                              }
                              if (v862)
                              {
                                v191 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v192 = *MEMORY[0x1E0D025B8];
                                v1135 = *MEMORY[0x1E0CB2D50];
                                v837 = v39;
                                v193 = v6;
                                v194 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v659 = objc_opt_class();
                                v195 = v194;
                                v6 = v193;
                                v39 = v837;
                                a4 = v870;
                                v848 = (id)objc_msgSend(v195, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v659, CFSTR("bundlePlaceUserType"));
                                v1136 = v848;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1136, &v1135, 1);
                                v850 = (void *)objc_claimAutoreleasedReturnValue();
                                v852 = 0;
                                v877 = 0;
                                *v862 = (id)objc_msgSend(v191, "initWithDomain:code:userInfo:", v192, 2);
                                v59 = v879;
                                v60 = v875;
                                v29 = v889;
                                v61 = v873;
                                v98 = v859;
                                v16 = v888;
                                goto LABEL_1114;
                              }
                              v852 = 0;
                              v877 = 0;
                              v59 = v879;
                              v60 = v875;
                              v29 = v889;
                              v61 = v873;
                              v98 = v859;
                              v16 = v888;
                              a4 = v870;
LABEL_1115:

                              goto LABEL_1116;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v124 = v53;
                              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceInferencePlaceTypeFromString(v124));
                              v854 = (id)objc_claimAutoreleasedReturnValue();

                              goto LABEL_122;
                            }
                            if (v862)
                            {
                              v186 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v187 = *MEMORY[0x1E0D025B8];
                              v1137 = *MEMORY[0x1E0CB2D50];
                              v836 = v39;
                              v188 = v6;
                              v189 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v658 = objc_opt_class();
                              v190 = v189;
                              v6 = v188;
                              v39 = v836;
                              a4 = v870;
                              v852 = (void *)objc_msgSend(v190, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v658, CFSTR("bundlePlaceType"));
                              v1138 = v852;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1138, &v1137, 1);
                              v851 = (void *)objc_claimAutoreleasedReturnValue();
                              v854 = 0;
                              v877 = 0;
                              *v862 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v187, 2);
                              v59 = v879;
                              v60 = v875;
                              v29 = v889;
                              v61 = v873;
                              v98 = v859;
                              v16 = v888;
                              goto LABEL_1115;
                            }
                            v854 = 0;
                            v877 = 0;
                            v59 = v879;
                            v60 = v875;
                            v29 = v889;
                            v61 = v873;
                            v98 = v859;
                            v16 = v888;
                            a4 = v870;
LABEL_1116:

                            goto LABEL_1117;
                          }
                          if (v862)
                          {
                            v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v108 = *MEMORY[0x1E0D025B8];
                            v1139 = *MEMORY[0x1E0CB2D50];
                            v109 = v39;
                            v110 = v6;
                            v111 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v657 = objc_opt_class();
                            v112 = v111;
                            v6 = v110;
                            v39 = v109;
                            a4 = v870;
                            v854 = (id)objc_msgSend(v112, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v657, CFSTR("bundlePromptParametersAvailability"));
                            v1140 = v854;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1140, &v1139, 1);
                            v113 = objc_claimAutoreleasedReturnValue();
                            v114 = v107;
                            v29 = v889;
                            v853 = (void *)v113;
                            v856 = 0;
                            v877 = 0;
                            *v862 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v108, 2);
                            v59 = v879;
                            v60 = v875;
                            v61 = v873;
                            v98 = v859;
                            v16 = v888;
                            goto LABEL_1116;
                          }
                          v856 = 0;
                          v877 = 0;
                          v59 = v879;
                          v60 = v875;
                          v61 = v873;
                          v98 = v859;
                          v16 = v888;
                          a4 = v870;
LABEL_1117:

                          goto LABEL_1118;
                        }
                        if (v862)
                        {
                          v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v883 = *MEMORY[0x1E0D025B8];
                          v1141 = *MEMORY[0x1E0CB2D50];
                          v101 = v39;
                          v102 = v6;
                          v103 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v98 = v859;
                          v656 = objc_opt_class();
                          v104 = v103;
                          v6 = v102;
                          v39 = v101;
                          a4 = v870;
                          v856 = (id)objc_msgSend(v104, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v656, CFSTR("bundlePromptToneID"));
                          v1142 = v856;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1142, &v1141, 1);
                          v105 = objc_claimAutoreleasedReturnValue();
                          v106 = v100;
                          v29 = v889;
                          v855 = (void *)v105;
                          v858 = 0;
                          v877 = 0;
                          *v862 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v883, 2);
                          v59 = v879;
                          v60 = v875;
                          v61 = v873;
                          v16 = v888;
                          goto LABEL_1117;
                        }
                        v858 = 0;
                        v877 = 0;
                        v59 = v879;
                        v60 = v875;
                        v61 = v873;
                        v98 = v859;
                        v16 = v888;
                        a4 = v870;
LABEL_1118:

                        v10 = v857;
                        goto LABEL_1119;
                      }
                      if (a4)
                      {
                        v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v93 = *MEMORY[0x1E0D025B8];
                        v1143 = *MEMORY[0x1E0CB2D50];
                        v94 = v39;
                        v95 = v6;
                        v96 = objc_alloc(MEMORY[0x1E0CB3940]);
                        v655 = objc_opt_class();
                        v97 = v96;
                        v6 = v95;
                        v39 = v94;
                        a4 = v870;
                        v858 = (id)objc_msgSend(v97, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v655, CFSTR("bundlePromptLanguageFormat"));
                        v1144 = v858;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1144, &v1143, 1);
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        v99 = v92;
                        v29 = v889;
                        v860 = 0;
                        v877 = 0;
                        *v862 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v93, 2, v98);
                        v59 = v879;
                        v60 = v875;
                        v61 = v873;
                        v16 = v888;
                        goto LABEL_1118;
                      }
                      v860 = 0;
                      v877 = 0;
                      v59 = v879;
                      v60 = v875;
                      v61 = v873;
                      v16 = v888;
                      a4 = v870;
LABEL_1119:

                      goto LABEL_1120;
                    }
                    if (a4)
                    {
                      v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v882 = *MEMORY[0x1E0D025B8];
                      v1145 = *MEMORY[0x1E0CB2D50];
                      v79 = a4;
                      v80 = v39;
                      v81 = v6;
                      v82 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v653 = objc_opt_class();
                      v83 = v82;
                      v6 = v81;
                      v39 = v80;
                      a4 = v870;
                      v860 = (id)objc_msgSend(v83, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v653, CFSTR("bundleSourceRoutineExists"));
                      v1146 = v860;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1146, &v1145, 1);
                      v84 = objc_claimAutoreleasedReturnValue();
                      v85 = v78;
                      v29 = v889;
                      v861 = (void *)v84;
                      v865 = 0;
                      v877 = 0;
                      *v79 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v882, 2);
                      v59 = v879;
                      v60 = v875;
                      v61 = v873;
                      v16 = v888;
                      goto LABEL_1119;
                    }
                    v865 = 0;
                    v877 = 0;
                    v59 = v879;
                    v60 = v875;
                    v61 = v873;
                    v16 = v888;
                    a4 = v870;
LABEL_1120:

                    goto LABEL_1121;
                  }
                  if (a4)
                  {
                    v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v881 = *MEMORY[0x1E0D025B8];
                    v1147 = *MEMORY[0x1E0CB2D50];
                    v71 = a4;
                    v72 = v39;
                    v73 = v6;
                    v74 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v652 = objc_opt_class();
                    v75 = v74;
                    v6 = v73;
                    v39 = v72;
                    a4 = v870;
                    v865 = (id)objc_msgSend(v75, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v652, CFSTR("bundleSourceProactiveExists"));
                    v1148 = v865;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1148, &v1147, 1);
                    v76 = objc_claimAutoreleasedReturnValue();
                    v77 = v70;
                    v29 = v889;
                    v866 = (void *)v76;
                    v868 = 0;
                    v877 = 0;
                    *v71 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v881, 2);
                    v59 = v879;
                    v60 = v875;
                    v61 = v873;
                    v16 = v888;
                    goto LABEL_1120;
                  }
                  v868 = 0;
                  v877 = 0;
                  v59 = v879;
                  v60 = v875;
                  v61 = v873;
                  v16 = v888;
                  a4 = v870;
LABEL_1121:

                  goto LABEL_1122;
                }
                if (a4)
                {
                  v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v880 = *MEMORY[0x1E0D025B8];
                  v1149 = *MEMORY[0x1E0CB2D50];
                  v63 = a4;
                  v64 = v39;
                  v65 = v6;
                  v66 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v651 = objc_opt_class();
                  v67 = v66;
                  v6 = v65;
                  v39 = v64;
                  a4 = v870;
                  v868 = (id)objc_msgSend(v67, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v651, CFSTR("bundleSourcePhotoExists"));
                  v1150 = v868;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1150, &v1149, 1);
                  v68 = objc_claimAutoreleasedReturnValue();
                  v69 = v62;
                  v29 = v889;
                  v869 = (void *)v68;
                  v871 = 0;
                  v877 = 0;
                  *v63 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v880, 2);
                  v59 = v879;
                  v60 = v875;
                  v61 = v873;
                  v16 = v888;
                  goto LABEL_1121;
                }
                v871 = 0;
                v877 = 0;
                v59 = v879;
                v60 = v875;
                v61 = v873;
                v16 = v888;
                a4 = v870;
LABEL_1122:

                goto LABEL_1123;
              }
              if (a4)
              {
                v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v55 = *MEMORY[0x1E0D025B8];
                v1151 = *MEMORY[0x1E0CB2D50];
                v863 = a4;
                v56 = v6;
                v57 = objc_alloc(MEMORY[0x1E0CB3940]);
                v650 = objc_opt_class();
                v58 = v57;
                v6 = v56;
                v871 = (id)objc_msgSend(v58, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v650, CFSTR("bundleSourceHealthExists"));
                v1152 = v871;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1152, &v1151, 1);
                v29 = v889;
                v872 = (void *)objc_claimAutoreleasedReturnValue();
                a4 = 0;
                v877 = 0;
                *v863 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2);
                v59 = v879;
                v60 = v875;
                v61 = v873;
                v16 = v888;
                goto LABEL_1122;
              }
              v877 = 0;
              v59 = v879;
              v60 = v875;
LABEL_112:
              v61 = v873;
              v16 = v888;
LABEL_1123:

              v9 = v885;
              goto LABEL_1124;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = v35;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataBundleInterfaceTypeFromString(v37));
              v38 = (id)objc_claimAutoreleasedReturnValue();

              v36 = v38;
              goto LABEL_47;
            }
            if (a4)
            {
              v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v87 = *MEMORY[0x1E0D025B8];
              v1153 = *MEMORY[0x1E0CB2D50];
              v88 = v6;
              v89 = objc_alloc(MEMORY[0x1E0CB3940]);
              v654 = objc_opt_class();
              v90 = v89;
              v6 = v88;
              v91 = (id *)objc_msgSend(v90, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v654, CFSTR("bundleInterfaceType"));
              v1154 = v91;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1154, &v1153, 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 0;
              v877 = 0;
              *a4 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2, v39);
              a4 = v91;
              v59 = v879;
              v60 = v875;
              v29 = v889;
              goto LABEL_112;
            }
            v877 = 0;
            v59 = v879;
            v60 = v875;
            v29 = v889;
            v61 = v873;
            v36 = 0;
LABEL_175:
            v16 = v888;
LABEL_1124:

            self = v874;
            goto LABEL_1125;
          }
          if (a4)
          {
            v134 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v135 = *MEMORY[0x1E0D025B8];
            v1155 = *MEMORY[0x1E0CB2D50];
            v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bundleExpirationDate"));
            v1156 = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1156, &v1155, 1);
            v136 = objc_claimAutoreleasedReturnValue();
            v137 = v134;
            v29 = v889;
            v876 = (void *)v136;
            v138 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v135, 2);
            v61 = 0;
            v877 = 0;
            *a4 = v138;
            v59 = v879;
            v60 = v875;
            goto LABEL_175;
          }
          v61 = 0;
          v877 = 0;
          v59 = v879;
          v60 = v875;
LABEL_211:
          v16 = v888;
LABEL_1125:

          v17 = v877;
          goto LABEL_1126;
        }
        if (a4)
        {
          v128 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v129 = self;
          v130 = *MEMORY[0x1E0D025B8];
          v1157 = *MEMORY[0x1E0CB2D50];
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bundleCreationDate"));
          v1158 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1158, &v1157, 1);
          v131 = objc_claimAutoreleasedReturnValue();
          v132 = v128;
          v29 = (void *)v131;
          v133 = v130;
          self = v129;
          v9 = v885;
          v60 = 0;
          v877 = 0;
          *a4 = (id)objc_msgSend(v132, "initWithDomain:code:userInfo:", v133, 2, v131);
          v59 = v879;
          goto LABEL_211;
        }
        v60 = 0;
        v17 = 0;
        v59 = v879;
LABEL_209:
        v16 = v888;
LABEL_1126:

        v20 = v886;
        goto LABEL_1127;
      }
      if (a4)
      {
        v890 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v120 = self;
        v121 = *MEMORY[0x1E0D025B8];
        v1159 = *MEMORY[0x1E0CB2D50];
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bundleEndDate"));
        v1160 = v60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1160, &v1159, 1);
        v122 = objc_claimAutoreleasedReturnValue();
        v123 = v121;
        self = v120;
        v887 = (void *)v122;
        v59 = 0;
        v17 = 0;
        *a4 = (id)objc_msgSend(v890, "initWithDomain:code:userInfo:", v123, 2);
        goto LABEL_209;
      }
      v59 = 0;
      v17 = 0;
LABEL_207:
      v16 = v888;
LABEL_1127:

      goto LABEL_1128;
    }
    if (a4)
    {
      v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v116 = *MEMORY[0x1E0D025B8];
      v1161 = *MEMORY[0x1E0CB2D50];
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("bundleStartDate"));
      v1162 = v59;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v1162, &v1161, 1);
      v117 = objc_claimAutoreleasedReturnValue();
      v118 = v116;
      v20 = (void *)v117;
      v119 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v118, 2, v117);
      v10 = 0;
      v17 = 0;
      *a4 = v119;
      goto LABEL_207;
    }
    v10 = 0;
    v17 = 0;
    v16 = v888;
LABEL_1128:

    v8 = v891;
    goto LABEL_1129;
  }
  if (a4)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0D025B8];
    v1163 = *MEMORY[0x1E0CB2D50];
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleIdentifier"));
    v1164[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v1164, &v1163, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2, v9);
    v16 = 0;
    v17 = 0;
    *a4 = v15;
    goto LABEL_1128;
  }
  v16 = 0;
  v17 = 0;
LABEL_1129:

  return v17;
}

- (id)_bundleEventIDsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMMomentsEventDataEventBundle bundleEventIDs](self, "bundleEventIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_backgroundActionsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMomentsEventDataEventBundle backgroundActions](self, "backgroundActions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_gaPRArrayJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMomentsEventDataEventBundle gaPRArray](self, "gaPRArray", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_subBundleIDsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMMomentsEventDataEventBundle subBundleIDs](self, "subBundleIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_subSuggestionIDsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMMomentsEventDataEventBundle subSuggestionIDs](self, "subSuggestionIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_resourcesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMomentsEventDataEventBundle resources](self, "resources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_personsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMomentsEventDataEventBundle persons](self, "persons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_otherPlacesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMomentsEventDataEventBundle otherPlaces](self, "otherPlaces", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_photoTraitsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMMomentsEventDataEventBundle photoTraits](self, "photoTraits", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
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
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  id v255;
  void *v256;
  void *v257;
  id v258;
  void *v259;
  id v260;
  void *v261;
  void *v262;
  id v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  id v278;
  void *v279;
  id v280;
  id v281;
  id v282;
  id v283;
  id v284;
  void *v285;
  void *v286;
  void *v287;
  id v288;
  void *v289;
  void *v290;
  id v291;
  id v292;
  id v293;
  id v294;
  id v295;
  void *v296;
  void *v297;
  id v298;
  void *v299;
  void *v300;
  id v301;
  void *v302;
  id v303;
  id v304;
  void *v305;
  id v306;
  id v307;
  id v308;
  id v309;
  id v310;
  id v311;
  void *v312;
  id v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  id v320;
  void *v321;
  void *v322;
  id v323;
  id v324;
  id v325;
  id v326;
  void *v327;
  _QWORD v328[91];
  _QWORD v329[93];

  v329[91] = *MEMORY[0x1E0C80C00];
  -[BMMomentsEventDataEventBundle bundleIdentifier](self, "bundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleStartDate](self, "bundleStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle bundleStartDate](self, "bundleStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMMomentsEventDataEventBundle bundleEndDate](self, "bundleEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle bundleEndDate](self, "bundleEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  -[BMMomentsEventDataEventBundle bundleCreationDate](self, "bundleCreationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle bundleCreationDate](self, "bundleCreationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    objc_msgSend(v13, "numberWithDouble:");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  -[BMMomentsEventDataEventBundle bundleExpirationDate](self, "bundleExpirationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle bundleExpirationDate](self, "bundleExpirationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleInterfaceType](self, "bundleInterfaceType"));
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasBundleSourceHealthExists](self, "hasBundleSourceHealthExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceHealthExists](self, "bundleSourceHealthExists"));
    v326 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v326 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasBundleSourcePhotoExists](self, "hasBundleSourcePhotoExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePhotoExists](self, "bundleSourcePhotoExists"));
    v325 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v325 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasBundleSourceProactiveExists](self, "hasBundleSourceProactiveExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceProactiveExists](self, "bundleSourceProactiveExists"));
    v324 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v324 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasBundleSourceRoutineExists](self, "hasBundleSourceRoutineExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceRoutineExists](self, "bundleSourceRoutineExists"));
    v323 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v323 = 0;
  }
  -[BMMomentsEventDataEventBundle bundlePromptLanguageFormat](self, "bundlePromptLanguageFormat");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundlePromptToneID](self, "bundlePromptToneID");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasBundlePromptParametersAvailability](self, "hasBundlePromptParametersAvailability"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundlePromptParametersAvailability](self, "bundlePromptParametersAvailability"));
    v320 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v320 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePlaceType](self, "bundlePlaceType"));
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePlaceUserType](self, "bundlePlaceUserType"));
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleBaseEventCateory](self, "bundleBaseEventCateory"));
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle _bundleEventIDsJSONArray](self, "_bundleEventIDsJSONArray");
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle bundleActionType](self, "bundleActionType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "jsonDictionary");
  v315 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMomentsEventDataEventBundle _backgroundActionsJSONArray](self, "_backgroundActionsJSONArray");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasBundleIsFamilyIncluded](self, "hasBundleIsFamilyIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleIsFamilyIncluded](self, "bundleIsFamilyIncluded"));
    v313 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v313 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleTimeTag](self, "bundleTimeTag"));
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeUnknown](self, "hasIsBundleResourceTypeUnknown"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeUnknown](self, "isBundleResourceTypeUnknown"));
    v311 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v311 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeValueIncluded](self, "hasIsBundleResourceTypeValueIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeValueIncluded](self, "isBundleResourceTypeValueIncluded"));
    v310 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v310 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypePhotoAssetsIncluded](self, "hasIsBundleResourceTypePhotoAssetsIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypePhotoAssetsIncluded](self, "isBundleResourceTypePhotoAssetsIncluded"));
    v309 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v309 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeMediaIncluded](self, "hasIsBundleResourceTypeMediaIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeMediaIncluded](self, "isBundleResourceTypeMediaIncluded"));
    v308 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v308 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeWebLinkIncluded](self, "hasIsBundleResourceTypeWebLinkIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeWebLinkIncluded](self, "isBundleResourceTypeWebLinkIncluded"));
    v307 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v307 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeInterenceTagIncluded](self, "hasIsBundleResourceTypeInterenceTagIncluded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isBundleResourceTypeInterenceTagIncluded](self, "isBundleResourceTypeInterenceTagIncluded"));
    v306 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v306 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundlEngagement](self, "bundlEngagement"));
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMomentsEventDataEventBundle hasBundleVersion](self, "hasBundleVersion")
    || (-[BMMomentsEventDataEventBundle bundleVersion](self, "bundleVersion"), fabs(v21) == INFINITY))
  {
    v304 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle bundleVersion](self, "bundleVersion");
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle bundleVersion](self, "bundleVersion");
    objc_msgSend(v22, "numberWithDouble:");
    v304 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundle hasRankingVersion](self, "hasRankingVersion")
    || (-[BMMomentsEventDataEventBundle rankingVersion](self, "rankingVersion"), fabs(v23) == INFINITY))
  {
    v303 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle rankingVersion](self, "rankingVersion");
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle rankingVersion](self, "rankingVersion");
    objc_msgSend(v24, "numberWithDouble:");
    v303 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle suggestionType](self, "suggestionType"));
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle suggestionTimestamp](self, "suggestionTimestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle suggestionTimestamp](self, "suggestionTimestamp");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSince1970");
    objc_msgSend(v26, "numberWithDouble:");
    v301 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v301 = 0;
  }

  -[BMMomentsEventDataEventBundle suggestionClientIdentifier](self, "suggestionClientIdentifier");
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle suggestionViewContainerName](self, "suggestionViewContainerName");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMomentsEventDataEventBundle hasSuggestionViewVisibleTime](self, "hasSuggestionViewVisibleTime")
    || (-[BMMomentsEventDataEventBundle suggestionViewVisibleTime](self, "suggestionViewVisibleTime"),
        fabs(v28) == INFINITY))
  {
    v298 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle suggestionViewVisibleTime](self, "suggestionViewVisibleTime");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle suggestionViewVisibleTime](self, "suggestionViewVisibleTime");
    objc_msgSend(v29, "numberWithDouble:");
    v298 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventType](self, "appEntryEventType"));
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle appEntryEventClientIdentifier](self, "appEntryEventClientIdentifier");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle appEntryEventTimestamp](self, "appEntryEventTimestamp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle appEntryEventTimestamp](self, "appEntryEventTimestamp");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSince1970");
    objc_msgSend(v31, "numberWithDouble:");
    v295 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v295 = 0;
  }

  -[BMMomentsEventDataEventBundle appEntryEventStartTime](self, "appEntryEventStartTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle appEntryEventStartTime](self, "appEntryEventStartTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timeIntervalSince1970");
    objc_msgSend(v34, "numberWithDouble:");
    v294 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v294 = 0;
  }

  -[BMMomentsEventDataEventBundle appEntryEventEndTime](self, "appEntryEventEndTime");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle appEntryEventEndTime](self, "appEntryEventEndTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSince1970");
    objc_msgSend(v37, "numberWithDouble:");
    v293 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v293 = 0;
  }

  if (-[BMMomentsEventDataEventBundle hasAppEntryEventTotalCharacters](self, "hasAppEntryEventTotalCharacters"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventTotalCharacters](self, "appEntryEventTotalCharacters"));
    v292 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v292 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasAppEntryEventAddedCharacters](self, "hasAppEntryEventAddedCharacters"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle appEntryEventAddedCharacters](self, "appEntryEventAddedCharacters"));
    v291 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v291 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle clientActivityEventType](self, "clientActivityEventType"));
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle clientActivityEventClientIdentifier](self, "clientActivityEventClientIdentifier");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle clientActivityEventTimestamp](self, "clientActivityEventTimestamp");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle clientActivityEventTimestamp](self, "clientActivityEventTimestamp");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSince1970");
    objc_msgSend(v40, "numberWithDouble:");
    v288 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v288 = 0;
  }

  -[BMMomentsEventDataEventBundle suggestionIdentifier](self, "suggestionIdentifier");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle photoSourceType](self, "photoSourceType"));
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle photoLibraryType](self, "photoLibraryType"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasBundleSourcePostAnalyticsExists](self, "hasBundleSourcePostAnalyticsExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePostAnalyticsExists](self, "bundleSourcePostAnalyticsExists"));
    v284 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v284 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasBundleSourcePDExists](self, "hasBundleSourcePDExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourcePDExists](self, "bundleSourcePDExists"));
    v283 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v283 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasBundleSourceMotionExists](self, "hasBundleSourceMotionExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceMotionExists](self, "bundleSourceMotionExists"));
    v282 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v282 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasBundleSourceBooksExists](self, "hasBundleSourceBooksExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceBooksExists](self, "bundleSourceBooksExists"));
    v281 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v281 = 0;
  }
  if (-[BMMomentsEventDataEventBundle hasBundleSourceScreenTimeExists](self, "hasBundleSourceScreenTimeExists"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle bundleSourceScreenTimeExists](self, "bundleSourceScreenTimeExists"));
    v280 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v280 = 0;
  }
  -[BMMomentsEventDataEventBundle _gaPRArrayJSONArray](self, "_gaPRArrayJSONArray");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasBundlePCount](self, "hasBundlePCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundlePCount](self, "bundlePCount"));
    v278 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v278 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle ranking](self, "ranking"));
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle labelConfidenceScore](self, "labelConfidenceScore"));
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle timeCorrelationScore](self, "timeCorrelationScore"));
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle callDuration](self, "callDuration"));
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle interactionCount](self, "interactionCount"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle interactionType](self, "interactionType"));
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle callPlace](self, "callPlace"));
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle distanceFromHome](self, "distanceFromHome"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle homeAvailability](self, "homeAvailability"));
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle workAvailability](self, "workAvailability"));
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleVisitMapItemSource](self, "bundleVisitMapItemSource"));
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleVisitPlaceType](self, "bundleVisitPlaceType"));
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleVisitPlaceLabelGranularity](self, "bundleVisitPlaceLabelGranularity"));
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleIncludesAnomalousEvent](self, "bundleIncludesAnomalousEvent"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasIsFiltered](self, "hasIsFiltered"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isFiltered](self, "isFiltered"));
    v263 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v263 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleSuperType](self, "bundleSuperType"));
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle bundleSubType](self, "bundleSubType"));
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasIsAggregatedAndSuppressed](self, "hasIsAggregatedAndSuppressed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed"));
    v260 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v260 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundle summarizationGranularity](self, "summarizationGranularity"));
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundle hasIncludedInSummaryBundleOnly](self, "hasIncludedInSummaryBundleOnly"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundle includedInSummaryBundleOnly](self, "includedInSummaryBundleOnly"));
    v258 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v258 = 0;
  }
  -[BMMomentsEventDataEventBundle _subBundleIDsJSONArray](self, "_subBundleIDsJSONArray");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle _subSuggestionIDsJSONArray](self, "_subSuggestionIDsJSONArray");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle firstCreationDate](self, "firstCreationDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle firstCreationDate](self, "firstCreationDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "timeIntervalSince1970");
    objc_msgSend(v43, "numberWithDouble:");
    v255 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v255 = 0;
  }

  -[BMMomentsEventDataEventBundle _resourcesJSONArray](self, "_resourcesJSONArray");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle _personsJSONArray](self, "_personsJSONArray");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle mainPlace](self, "mainPlace");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "jsonDictionary");
  v252 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMomentsEventDataEventBundle _otherPlacesJSONArray](self, "_otherPlacesJSONArray");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle _photoTraitsJSONArray](self, "_photoTraitsJSONArray");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundle clusterMetadata](self, "clusterMetadata");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "jsonDictionary");
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMomentsEventDataEventBundle outlierMetadata](self, "outlierMetadata");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "jsonDictionary");
  v248 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[BMMomentsEventDataEventBundle hasBundleGoodnessScore](self, "hasBundleGoodnessScore")
    || (-[BMMomentsEventDataEventBundle bundleGoodnessScore](self, "bundleGoodnessScore"), fabs(v48) == INFINITY))
  {
    v247 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle bundleGoodnessScore](self, "bundleGoodnessScore");
    v49 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle bundleGoodnessScore](self, "bundleGoodnessScore");
    objc_msgSend(v49, "numberWithDouble:");
    v247 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundle hasDistinctnessScore](self, "hasDistinctnessScore")
    || (-[BMMomentsEventDataEventBundle distinctnessScore](self, "distinctnessScore"), fabs(v50) == INFINITY))
  {
    v246 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle distinctnessScore](self, "distinctnessScore");
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle distinctnessScore](self, "distinctnessScore");
    objc_msgSend(v51, "numberWithDouble:");
    v246 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundle hasRichnessScore](self, "hasRichnessScore")
    || (-[BMMomentsEventDataEventBundle richnessScore](self, "richnessScore"), fabs(v52) == INFINITY))
  {
    v245 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle richnessScore](self, "richnessScore");
    v53 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle richnessScore](self, "richnessScore");
    objc_msgSend(v53, "numberWithDouble:");
    v245 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundle hasEngagementScore](self, "hasEngagementScore")
    || (-[BMMomentsEventDataEventBundle engagementScore](self, "engagementScore"), fabs(v54) == INFINITY))
  {
    v244 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle engagementScore](self, "engagementScore");
    v55 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle engagementScore](self, "engagementScore");
    objc_msgSend(v55, "numberWithDouble:");
    v244 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundle hasHeuristicsScore](self, "hasHeuristicsScore")
    || (-[BMMomentsEventDataEventBundle heuristicsScore](self, "heuristicsScore"), fabs(v56) == INFINITY))
  {
    v243 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundle heuristicsScore](self, "heuristicsScore");
    v57 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundle heuristicsScore](self, "heuristicsScore");
    objc_msgSend(v57, "numberWithDouble:");
    v243 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMMomentsEventDataEventBundle metadataForRank](self, "metadataForRank");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "jsonDictionary");
  v59 = objc_claimAutoreleasedReturnValue();

  v328[0] = CFSTR("bundleIdentifier");
  v60 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = objc_claimAutoreleasedReturnValue();
  }
  v233 = (void *)v60;
  v329[0] = v60;
  v328[1] = CFSTR("bundleStartDate");
  v61 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = objc_claimAutoreleasedReturnValue();
  }
  v232 = (void *)v61;
  v329[1] = v61;
  v328[2] = CFSTR("bundleEndDate");
  v62 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  v231 = (void *)v62;
  v329[2] = v62;
  v328[3] = CFSTR("bundleCreationDate");
  v63 = (uint64_t)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  v230 = (void *)v63;
  v329[3] = v63;
  v328[4] = CFSTR("bundleExpirationDate");
  v64 = (uint64_t)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v64 = objc_claimAutoreleasedReturnValue();
  }
  v229 = (void *)v64;
  v329[4] = v64;
  v328[5] = CFSTR("bundleInterfaceType");
  v65 = (uint64_t)v327;
  if (!v327)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = objc_claimAutoreleasedReturnValue();
  }
  v329[5] = v65;
  v328[6] = CFSTR("bundleSourceHealthExists");
  v66 = (uint64_t)v326;
  if (!v326)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v66 = objc_claimAutoreleasedReturnValue();
  }
  v329[6] = v66;
  v328[7] = CFSTR("bundleSourcePhotoExists");
  v67 = v325;
  if (!v325)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v329[7] = v67;
  v328[8] = CFSTR("bundleSourceProactiveExists");
  v68 = (uint64_t)v324;
  if (!v324)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = objc_claimAutoreleasedReturnValue();
  }
  v329[8] = v68;
  v328[9] = CFSTR("bundleSourceRoutineExists");
  v69 = (uint64_t)v323;
  if (!v323)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = objc_claimAutoreleasedReturnValue();
  }
  v239 = (void *)v69;
  v329[9] = v69;
  v328[10] = CFSTR("bundlePromptLanguageFormat");
  v70 = (uint64_t)v322;
  if (!v322)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v238 = (void *)v70;
  v329[10] = v70;
  v328[11] = CFSTR("bundlePromptToneID");
  v71 = (uint64_t)v321;
  if (!v321)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  v235 = v11;
  v237 = (void *)v71;
  v329[11] = v71;
  v328[12] = CFSTR("bundlePromptParametersAvailability");
  v72 = (uint64_t)v320;
  if (!v320)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v72 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v3;
  v236 = (void *)v72;
  v329[12] = v72;
  v328[13] = CFSTR("bundlePlaceType");
  v74 = (uint64_t)v319;
  if (!v319)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v74 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v74;
  v329[13] = v74;
  v328[14] = CFSTR("bundlePlaceUserType");
  v76 = (uint64_t)v318;
  if (!v318)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v76 = objc_claimAutoreleasedReturnValue();
  }
  v225 = (void *)v76;
  v329[14] = v76;
  v328[15] = CFSTR("bundleBaseEventCateory");
  v77 = (uint64_t)v317;
  if (!v317)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v77 = objc_claimAutoreleasedReturnValue();
  }
  v224 = (void *)v77;
  v329[15] = v77;
  v328[16] = CFSTR("bundleEventIDs");
  v78 = (uint64_t)v316;
  if (!v316)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v78 = objc_claimAutoreleasedReturnValue();
  }
  v223 = (void *)v78;
  v329[16] = v78;
  v328[17] = CFSTR("bundleActionType");
  v79 = (uint64_t)v315;
  if (!v315)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v79 = objc_claimAutoreleasedReturnValue();
  }
  v222 = (void *)v79;
  v329[17] = v79;
  v328[18] = CFSTR("backgroundActions");
  v80 = (uint64_t)v314;
  if (!v314)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v80 = objc_claimAutoreleasedReturnValue();
  }
  v221 = (void *)v80;
  v329[18] = v80;
  v328[19] = CFSTR("bundleIsFamilyIncluded");
  v81 = (uint64_t)v313;
  if (!v313)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v81 = objc_claimAutoreleasedReturnValue();
  }
  v220 = (void *)v81;
  v329[19] = v81;
  v328[20] = CFSTR("bundleTimeTag");
  v82 = (uint64_t)v312;
  if (!v312)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v82 = objc_claimAutoreleasedReturnValue();
  }
  v219 = (void *)v82;
  v329[20] = v82;
  v328[21] = CFSTR("isBundleResourceTypeUnknown");
  v83 = (uint64_t)v311;
  if (!v311)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v83 = objc_claimAutoreleasedReturnValue();
  }
  v218 = (void *)v83;
  v329[21] = v83;
  v328[22] = CFSTR("isBundleResourceTypeValueIncluded");
  v84 = (uint64_t)v310;
  if (!v310)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v84 = objc_claimAutoreleasedReturnValue();
  }
  v217 = (void *)v84;
  v329[22] = v84;
  v328[23] = CFSTR("isBundleResourceTypePhotoAssetsIncluded");
  v85 = (uint64_t)v309;
  if (!v309)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v85 = objc_claimAutoreleasedReturnValue();
  }
  v216 = (void *)v85;
  v329[23] = v85;
  v328[24] = CFSTR("isBundleResourceTypeMediaIncluded");
  v86 = (uint64_t)v308;
  if (!v308)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v86 = objc_claimAutoreleasedReturnValue();
  }
  v215 = (void *)v86;
  v329[24] = v86;
  v328[25] = CFSTR("isBundleResourceTypeWebLinkIncluded");
  v87 = (uint64_t)v307;
  if (!v307)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v87 = objc_claimAutoreleasedReturnValue();
  }
  v214 = (void *)v87;
  v329[25] = v87;
  v328[26] = CFSTR("isBundleResourceTypeInterenceTagIncluded");
  v88 = (uint64_t)v306;
  if (!v306)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v88 = objc_claimAutoreleasedReturnValue();
  }
  v213 = (void *)v88;
  v329[26] = v88;
  v328[27] = CFSTR("bundlEngagement");
  v89 = (uint64_t)v305;
  if (!v305)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v89 = objc_claimAutoreleasedReturnValue();
  }
  v212 = (void *)v89;
  v329[27] = v89;
  v328[28] = CFSTR("bundleVersion");
  v90 = (uint64_t)v304;
  if (!v304)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v90 = objc_claimAutoreleasedReturnValue();
  }
  v211 = (void *)v90;
  v329[28] = v90;
  v328[29] = CFSTR("rankingVersion");
  v91 = (uint64_t)v303;
  if (!v303)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v91 = objc_claimAutoreleasedReturnValue();
  }
  v210 = (void *)v91;
  v329[29] = v91;
  v328[30] = CFSTR("suggestionType");
  v92 = (uint64_t)v302;
  if (!v302)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v92 = objc_claimAutoreleasedReturnValue();
  }
  v209 = (void *)v92;
  v329[30] = v92;
  v328[31] = CFSTR("suggestionTimestamp");
  v93 = (uint64_t)v301;
  if (!v301)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v93 = objc_claimAutoreleasedReturnValue();
  }
  v208 = (void *)v93;
  v329[31] = v93;
  v328[32] = CFSTR("suggestionClientIdentifier");
  v94 = (uint64_t)v300;
  if (!v300)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v94 = objc_claimAutoreleasedReturnValue();
  }
  v207 = (void *)v94;
  v329[32] = v94;
  v328[33] = CFSTR("suggestionViewContainerName");
  v95 = (uint64_t)v299;
  if (!v299)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v95 = objc_claimAutoreleasedReturnValue();
  }
  v206 = (void *)v95;
  v329[33] = v95;
  v328[34] = CFSTR("suggestionViewVisibleTime");
  v96 = (uint64_t)v298;
  if (!v298)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v96 = objc_claimAutoreleasedReturnValue();
  }
  v205 = (void *)v96;
  v329[34] = v96;
  v328[35] = CFSTR("appEntryEventType");
  v97 = (uint64_t)v297;
  if (!v297)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v97 = objc_claimAutoreleasedReturnValue();
  }
  v204 = (void *)v97;
  v329[35] = v97;
  v328[36] = CFSTR("appEntryEventClientIdentifier");
  v98 = (uint64_t)v296;
  if (!v296)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v98 = objc_claimAutoreleasedReturnValue();
  }
  v203 = (void *)v98;
  v329[36] = v98;
  v328[37] = CFSTR("appEntryEventTimestamp");
  v99 = (uint64_t)v295;
  if (!v295)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v99 = objc_claimAutoreleasedReturnValue();
  }
  v202 = (void *)v99;
  v329[37] = v99;
  v328[38] = CFSTR("appEntryEventStartTime");
  v100 = (uint64_t)v294;
  if (!v294)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v100 = objc_claimAutoreleasedReturnValue();
  }
  v201 = (void *)v100;
  v329[38] = v100;
  v328[39] = CFSTR("appEntryEventEndTime");
  v101 = (uint64_t)v293;
  if (!v293)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v101 = objc_claimAutoreleasedReturnValue();
  }
  v200 = (void *)v101;
  v329[39] = v101;
  v328[40] = CFSTR("appEntryEventTotalCharacters");
  v102 = (uint64_t)v292;
  if (!v292)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v102 = objc_claimAutoreleasedReturnValue();
  }
  v199 = (void *)v102;
  v329[40] = v102;
  v328[41] = CFSTR("appEntryEventAddedCharacters");
  v103 = (uint64_t)v291;
  if (!v291)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v103 = objc_claimAutoreleasedReturnValue();
  }
  v198 = (void *)v103;
  v329[41] = v103;
  v328[42] = CFSTR("clientActivityEventType");
  v104 = (uint64_t)v290;
  if (!v290)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v104 = objc_claimAutoreleasedReturnValue();
  }
  v197 = (void *)v104;
  v329[42] = v104;
  v328[43] = CFSTR("clientActivityEventClientIdentifier");
  v105 = (uint64_t)v289;
  if (!v289)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v105 = objc_claimAutoreleasedReturnValue();
  }
  v196 = (void *)v105;
  v329[43] = v105;
  v328[44] = CFSTR("clientActivityEventTimestamp");
  v106 = (uint64_t)v288;
  if (!v288)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v106 = objc_claimAutoreleasedReturnValue();
  }
  v195 = (void *)v106;
  v329[44] = v106;
  v328[45] = CFSTR("suggestionIdentifier");
  v107 = (uint64_t)v287;
  if (!v287)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v107 = objc_claimAutoreleasedReturnValue();
  }
  v194 = (void *)v107;
  v329[45] = v107;
  v328[46] = CFSTR("photoSourceType");
  v108 = (uint64_t)v286;
  if (!v286)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v108 = objc_claimAutoreleasedReturnValue();
  }
  v193 = (void *)v108;
  v329[46] = v108;
  v328[47] = CFSTR("photoLibraryType");
  v109 = (uint64_t)v285;
  if (!v285)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v109 = objc_claimAutoreleasedReturnValue();
  }
  v192 = (void *)v109;
  v329[47] = v109;
  v328[48] = CFSTR("bundleSourcePostAnalyticsExists");
  v110 = (uint64_t)v284;
  if (!v284)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v110 = objc_claimAutoreleasedReturnValue();
  }
  v191 = (void *)v110;
  v329[48] = v110;
  v328[49] = CFSTR("bundleSourcePDExists");
  v111 = (uint64_t)v283;
  if (!v283)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v111 = objc_claimAutoreleasedReturnValue();
  }
  v190 = (void *)v111;
  v329[49] = v111;
  v328[50] = CFSTR("bundleSourceMotionExists");
  v112 = (uint64_t)v282;
  if (!v282)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v112 = objc_claimAutoreleasedReturnValue();
  }
  v189 = (void *)v112;
  v329[50] = v112;
  v328[51] = CFSTR("bundleSourceBooksExists");
  v113 = (uint64_t)v281;
  if (!v281)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v113 = objc_claimAutoreleasedReturnValue();
  }
  v188 = (void *)v113;
  v329[51] = v113;
  v328[52] = CFSTR("bundleSourceScreenTimeExists");
  v114 = (uint64_t)v280;
  if (!v280)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v114 = objc_claimAutoreleasedReturnValue();
  }
  v187 = (void *)v114;
  v329[52] = v114;
  v328[53] = CFSTR("gaPRArray");
  v115 = (uint64_t)v279;
  if (!v279)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v115 = objc_claimAutoreleasedReturnValue();
  }
  v186 = (void *)v115;
  v329[53] = v115;
  v328[54] = CFSTR("bundlePCount");
  v116 = (uint64_t)v278;
  if (!v278)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v116 = objc_claimAutoreleasedReturnValue();
  }
  v185 = (void *)v116;
  v329[54] = v116;
  v328[55] = CFSTR("ranking");
  v117 = (uint64_t)v277;
  if (!v277)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v117 = objc_claimAutoreleasedReturnValue();
  }
  v184 = (void *)v117;
  v329[55] = v117;
  v328[56] = CFSTR("labelConfidenceScore");
  v118 = (uint64_t)v276;
  if (!v276)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v118 = objc_claimAutoreleasedReturnValue();
  }
  v183 = (void *)v118;
  v329[56] = v118;
  v328[57] = CFSTR("timeCorrelationScore");
  v119 = (uint64_t)v275;
  if (!v275)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v119 = objc_claimAutoreleasedReturnValue();
  }
  v182 = (void *)v119;
  v329[57] = v119;
  v328[58] = CFSTR("callDuration");
  v120 = (uint64_t)v274;
  if (!v274)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v120 = objc_claimAutoreleasedReturnValue();
  }
  v181 = (void *)v120;
  v329[58] = v120;
  v328[59] = CFSTR("interactionCount");
  v121 = (uint64_t)v273;
  if (!v273)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v121 = objc_claimAutoreleasedReturnValue();
  }
  v180 = (void *)v121;
  v329[59] = v121;
  v328[60] = CFSTR("interactionType");
  v122 = (uint64_t)v272;
  if (!v272)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v122 = objc_claimAutoreleasedReturnValue();
  }
  v179 = (void *)v122;
  v329[60] = v122;
  v328[61] = CFSTR("callPlace");
  v123 = (uint64_t)v271;
  if (!v271)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v123 = objc_claimAutoreleasedReturnValue();
  }
  v178 = (void *)v123;
  v329[61] = v123;
  v328[62] = CFSTR("distanceFromHome");
  v124 = (uint64_t)v270;
  if (!v270)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v124 = objc_claimAutoreleasedReturnValue();
  }
  v177 = (void *)v124;
  v329[62] = v124;
  v328[63] = CFSTR("homeAvailability");
  v125 = (uint64_t)v269;
  if (!v269)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v125 = objc_claimAutoreleasedReturnValue();
  }
  v176 = (void *)v125;
  v329[63] = v125;
  v328[64] = CFSTR("workAvailability");
  v126 = (uint64_t)v268;
  if (!v268)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v126 = objc_claimAutoreleasedReturnValue();
  }
  v175 = (void *)v126;
  v329[64] = v126;
  v328[65] = CFSTR("bundleVisitMapItemSource");
  v127 = (uint64_t)v267;
  if (!v267)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v127 = objc_claimAutoreleasedReturnValue();
  }
  v174 = (void *)v127;
  v329[65] = v127;
  v328[66] = CFSTR("bundleVisitPlaceType");
  v128 = (uint64_t)v266;
  if (!v266)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v128 = objc_claimAutoreleasedReturnValue();
  }
  v173 = (void *)v128;
  v329[66] = v128;
  v328[67] = CFSTR("bundleVisitPlaceLabelGranularity");
  v129 = (uint64_t)v265;
  if (!v265)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v129 = objc_claimAutoreleasedReturnValue();
  }
  v172 = (void *)v129;
  v329[67] = v129;
  v328[68] = CFSTR("bundleIncludesAnomalousEvent");
  v130 = (uint64_t)v264;
  if (!v264)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v130 = objc_claimAutoreleasedReturnValue();
  }
  v171 = (void *)v130;
  v329[68] = v130;
  v328[69] = CFSTR("isFiltered");
  v131 = (uint64_t)v263;
  if (!v263)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v131 = objc_claimAutoreleasedReturnValue();
  }
  v170 = (void *)v131;
  v329[69] = v131;
  v328[70] = CFSTR("bundleSuperType");
  v132 = (uint64_t)v262;
  if (!v262)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v132 = objc_claimAutoreleasedReturnValue();
  }
  v169 = (void *)v132;
  v329[70] = v132;
  v328[71] = CFSTR("bundleSubType");
  v133 = (uint64_t)v261;
  if (!v261)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v133 = objc_claimAutoreleasedReturnValue();
  }
  v168 = (void *)v133;
  v329[71] = v133;
  v328[72] = CFSTR("isAggregatedAndSuppressed");
  v134 = (uint64_t)v260;
  if (!v260)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v134 = objc_claimAutoreleasedReturnValue();
  }
  v167 = (void *)v134;
  v329[72] = v134;
  v328[73] = CFSTR("summarizationGranularity");
  v135 = (uint64_t)v259;
  if (!v259)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v135 = objc_claimAutoreleasedReturnValue();
  }
  v166 = (void *)v135;
  v329[73] = v135;
  v328[74] = CFSTR("includedInSummaryBundleOnly");
  v136 = (uint64_t)v258;
  if (!v258)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v136 = objc_claimAutoreleasedReturnValue();
  }
  v165 = (void *)v136;
  v329[74] = v136;
  v328[75] = CFSTR("subBundleIDs");
  v137 = (uint64_t)v257;
  if (!v257)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v137 = objc_claimAutoreleasedReturnValue();
  }
  v164 = (void *)v137;
  v329[75] = v137;
  v328[76] = CFSTR("subSuggestionIDs");
  v138 = (uint64_t)v256;
  if (!v256)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v138 = objc_claimAutoreleasedReturnValue();
  }
  v163 = (void *)v138;
  v329[76] = v138;
  v328[77] = CFSTR("firstCreationDate");
  v139 = (uint64_t)v255;
  if (!v255)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v139 = objc_claimAutoreleasedReturnValue();
  }
  v162 = (void *)v139;
  v329[77] = v139;
  v328[78] = CFSTR("resources");
  v140 = (uint64_t)v254;
  if (!v254)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v140 = objc_claimAutoreleasedReturnValue();
  }
  v161 = (void *)v140;
  v329[78] = v140;
  v328[79] = CFSTR("persons");
  v141 = (uint64_t)v253;
  if (!v253)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v141 = objc_claimAutoreleasedReturnValue();
  }
  v160 = (void *)v141;
  v329[79] = v141;
  v328[80] = CFSTR("mainPlace");
  v142 = (uint64_t)v252;
  if (!v252)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v142 = objc_claimAutoreleasedReturnValue();
  }
  v159 = (void *)v142;
  v329[80] = v142;
  v328[81] = CFSTR("otherPlaces");
  v143 = (uint64_t)v251;
  if (!v251)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v143 = objc_claimAutoreleasedReturnValue();
  }
  v241 = v15;
  v158 = (void *)v143;
  v329[81] = v143;
  v328[82] = CFSTR("photoTraits");
  v144 = (uint64_t)v250;
  if (!v250)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v144 = objc_claimAutoreleasedReturnValue();
  }
  v157 = (void *)v144;
  v329[82] = v144;
  v328[83] = CFSTR("clusterMetadata");
  v145 = (uint64_t)v249;
  if (!v249)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v145 = objc_claimAutoreleasedReturnValue();
  }
  v240 = v19;
  v156 = (void *)v145;
  v329[83] = v145;
  v328[84] = CFSTR("outlierMetadata");
  v146 = (uint64_t)v248;
  if (!v248)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v146 = objc_claimAutoreleasedReturnValue();
  }
  v227 = (void *)v66;
  v155 = (void *)v146;
  v329[84] = v146;
  v328[85] = CFSTR("bundleGoodnessScore");
  v147 = v247;
  if (!v247)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v242 = (void *)v59;
  v329[85] = v147;
  v328[86] = CFSTR("distinctnessScore");
  v148 = v246;
  if (!v246)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v226 = (void *)v68;
  v329[86] = v148;
  v328[87] = CFSTR("richnessScore");
  v149 = v245;
  if (!v245)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v228 = (void *)v65;
  v329[87] = v149;
  v328[88] = CFSTR("engagementScore");
  v150 = v244;
  if (!v244)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v329[88] = v150;
  v328[89] = CFSTR("heuristicsScore");
  v151 = v243;
  if (!v243)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v329[89] = v151;
  v328[90] = CFSTR("metadataForRank");
  v152 = v242;
  if (!v242)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v329[90] = v152;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v329, v328, 91);
  v234 = (id)objc_claimAutoreleasedReturnValue();
  if (!v242)

  v153 = v75;
  if (!v243)
  {

    v153 = v75;
  }
  if (!v244)
  {

    v153 = v75;
  }
  if (!v245)
  {

    v153 = v75;
  }
  if (!v246)
  {

    v153 = v75;
  }
  if (!v247)
  {

    v153 = v75;
  }
  if (!v248)
  {

    v153 = v75;
  }
  if (!v249)
  {

    v153 = v75;
  }
  if (!v250)
  {

    v153 = v75;
  }
  if (!v251)
  {

    v153 = v75;
  }
  if (!v252)
  {

    v153 = v75;
  }
  if (!v253)
  {

    v153 = v75;
  }
  if (!v254)
  {

    v153 = v75;
  }
  if (!v255)
  {

    v153 = v75;
  }
  if (!v256)
  {

    v153 = v75;
  }
  if (!v257)
  {

    v153 = v75;
  }
  if (!v258)
  {

    v153 = v75;
  }
  if (!v259)
  {

    v153 = v75;
  }
  if (!v260)
  {

    v153 = v75;
  }
  if (!v261)
  {

    v153 = v75;
  }
  if (!v262)
  {

    v153 = v75;
  }
  if (!v263)
  {

    v153 = v75;
  }
  if (!v264)
  {

    v153 = v75;
  }
  if (!v265)
  {

    v153 = v75;
  }
  if (!v266)
  {

    v153 = v75;
  }
  if (!v267)
  {

    v153 = v75;
  }
  if (!v268)
  {

    v153 = v75;
  }
  if (!v269)
  {

    v153 = v75;
  }
  if (!v270)
  {

    v153 = v75;
  }
  if (!v271)
  {

    v153 = v75;
  }
  if (!v272)
  {

    v153 = v75;
  }
  if (!v273)
  {

    v153 = v75;
  }
  if (!v274)
  {

    v153 = v75;
  }
  if (!v275)
  {

    v153 = v75;
  }
  if (!v276)
  {

    v153 = v75;
  }
  if (!v277)
  {

    v153 = v75;
  }
  if (!v278)
  {

    v153 = v75;
  }
  if (!v279)
  {

    v153 = v75;
  }
  if (!v280)
  {

    v153 = v75;
  }
  if (!v281)
  {

    v153 = v75;
  }
  if (!v282)
  {

    v153 = v75;
  }
  if (!v283)
  {

    v153 = v75;
  }
  if (!v284)
  {

    v153 = v75;
  }
  if (!v285)
  {

    v153 = v75;
  }
  if (!v286)
  {

    v153 = v75;
  }
  if (!v287)
  {

    v153 = v75;
  }
  if (!v288)
  {

    v153 = v75;
  }
  if (!v289)
  {

    v153 = v75;
  }
  if (!v290)
  {

    v153 = v75;
  }
  if (!v291)
  {

    v153 = v75;
  }
  if (!v292)
  {

    v153 = v75;
  }
  if (!v293)
  {

    v153 = v75;
  }
  if (!v294)
  {

    v153 = v75;
  }
  if (!v295)
  {

    v153 = v75;
  }
  if (!v296)
  {

    v153 = v75;
  }
  if (!v297)
  {

    v153 = v75;
  }
  if (!v298)
  {

    v153 = v75;
  }
  if (!v299)
  {

    v153 = v75;
  }
  if (!v300)
  {

    v153 = v75;
  }
  if (!v301)
  {

    v153 = v75;
  }
  if (!v302)
  {

    v153 = v75;
  }
  if (!v303)
  {

    v153 = v75;
  }
  if (!v304)
  {

    v153 = v75;
  }
  if (!v305)
  {

    v153 = v75;
  }
  if (!v306)
  {

    v153 = v75;
  }
  if (!v307)
  {

    v153 = v75;
  }
  if (!v308)
  {

    v153 = v75;
  }
  if (!v309)
  {

    v153 = v75;
  }
  if (!v310)
  {

    v153 = v75;
  }
  if (!v311)
  {

    v153 = v75;
  }
  if (!v312)
  {

    v153 = v75;
  }
  if (!v313)
  {

    v153 = v75;
  }
  if (!v314)
  {

    v153 = v75;
  }
  if (!v315)
  {

    v153 = v75;
  }
  if (!v316)
  {

    v153 = v75;
  }
  if (!v317)
  {

    v153 = v75;
  }
  if (!v318)
  {

    v153 = v75;
  }
  if (!v319)

  if (!v320)
  if (!v321)

  if (!v322)
  if (!v323)

  if (!v324)
  if (!v325)

  if (!v326)
  if (v327)
  {
    if (v240)
      goto LABEL_486;
  }
  else
  {

    if (v240)
    {
LABEL_486:
      if (v241)
        goto LABEL_487;
      goto LABEL_493;
    }
  }

  if (v241)
  {
LABEL_487:
    if (v235)
      goto LABEL_488;
    goto LABEL_494;
  }
LABEL_493:

  if (v235)
  {
LABEL_488:
    if (v7)
      goto LABEL_489;
LABEL_495:

    if (v73)
      goto LABEL_490;
LABEL_496:

    goto LABEL_490;
  }
LABEL_494:

  if (!v7)
    goto LABEL_495;
LABEL_489:
  if (!v73)
    goto LABEL_496;
LABEL_490:

  return v234;
}

- (NSDate)bundleStartDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_bundleStartDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_bundleStartDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)bundleEndDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_bundleEndDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_bundleEndDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)bundleCreationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_bundleCreationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_bundleCreationDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)bundleExpirationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_bundleExpirationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_bundleExpirationDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)suggestionTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_suggestionTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_suggestionTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)appEntryEventTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_appEntryEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_appEntryEventTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)appEntryEventStartTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_appEntryEventStartTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_appEntryEventStartTime);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)appEntryEventEndTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_appEntryEventEndTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_appEntryEventEndTime);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)clientActivityEventTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_clientActivityEventTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_clientActivityEventTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)firstCreationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_firstCreationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_firstCreationDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  int v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  double v110;
  double v111;
  double v112;
  int v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  int v138;
  int v139;
  int v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  int v198;
  void *v199;
  uint64_t v200;
  void *v201;
  void *v202;
  void *v203;
  int v204;
  void *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  int v210;
  void *v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  int v216;
  void *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  int v222;
  void *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  int v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  void *v233;
  int v234;
  void *v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  int v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  int v246;
  void *v247;
  uint64_t v248;
  void *v249;
  void *v250;
  void *v251;
  int v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMomentsEventDataEventBundle bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMomentsEventDataEventBundle bundleIdentifier](self, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle bundleStartDate](self, "bundleStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleStartDate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMomentsEventDataEventBundle bundleStartDate](self, "bundleStartDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleStartDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle bundleEndDate](self, "bundleEndDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleEndDate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMomentsEventDataEventBundle bundleEndDate](self, "bundleEndDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleEndDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle bundleCreationDate](self, "bundleCreationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleCreationDate");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMMomentsEventDataEventBundle bundleCreationDate](self, "bundleCreationDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleCreationDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle bundleExpirationDate](self, "bundleExpirationDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleExpirationDate");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMMomentsEventDataEventBundle bundleExpirationDate](self, "bundleExpirationDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleExpirationDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_312;
    }
    v37 = -[BMMomentsEventDataEventBundle bundleInterfaceType](self, "bundleInterfaceType");
    if (v37 != objc_msgSend(v5, "bundleInterfaceType"))
      goto LABEL_312;
    if (-[BMMomentsEventDataEventBundle hasBundleSourceHealthExists](self, "hasBundleSourceHealthExists")
      || objc_msgSend(v5, "hasBundleSourceHealthExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourceHealthExists](self, "hasBundleSourceHealthExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourceHealthExists"))
        goto LABEL_312;
      v38 = -[BMMomentsEventDataEventBundle bundleSourceHealthExists](self, "bundleSourceHealthExists");
      if (v38 != objc_msgSend(v5, "bundleSourceHealthExists"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleSourcePhotoExists](self, "hasBundleSourcePhotoExists")
      || objc_msgSend(v5, "hasBundleSourcePhotoExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourcePhotoExists](self, "hasBundleSourcePhotoExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourcePhotoExists"))
        goto LABEL_312;
      v39 = -[BMMomentsEventDataEventBundle bundleSourcePhotoExists](self, "bundleSourcePhotoExists");
      if (v39 != objc_msgSend(v5, "bundleSourcePhotoExists"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleSourceProactiveExists](self, "hasBundleSourceProactiveExists")
      || objc_msgSend(v5, "hasBundleSourceProactiveExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourceProactiveExists](self, "hasBundleSourceProactiveExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourceProactiveExists"))
        goto LABEL_312;
      v40 = -[BMMomentsEventDataEventBundle bundleSourceProactiveExists](self, "bundleSourceProactiveExists");
      if (v40 != objc_msgSend(v5, "bundleSourceProactiveExists"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleSourceRoutineExists](self, "hasBundleSourceRoutineExists")
      || objc_msgSend(v5, "hasBundleSourceRoutineExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourceRoutineExists](self, "hasBundleSourceRoutineExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourceRoutineExists"))
        goto LABEL_312;
      v41 = -[BMMomentsEventDataEventBundle bundleSourceRoutineExists](self, "bundleSourceRoutineExists");
      if (v41 != objc_msgSend(v5, "bundleSourceRoutineExists"))
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle bundlePromptLanguageFormat](self, "bundlePromptLanguageFormat");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundlePromptLanguageFormat");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v42 == (void *)v43)
    {

    }
    else
    {
      v44 = (void *)v43;
      -[BMMomentsEventDataEventBundle bundlePromptLanguageFormat](self, "bundlePromptLanguageFormat");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundlePromptLanguageFormat");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "isEqual:", v46);

      if (!v47)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle bundlePromptToneID](self, "bundlePromptToneID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundlePromptToneID");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v48 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      -[BMMomentsEventDataEventBundle bundlePromptToneID](self, "bundlePromptToneID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundlePromptToneID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqual:", v52);

      if (!v53)
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundlePromptParametersAvailability](self, "hasBundlePromptParametersAvailability")|| objc_msgSend(v5, "hasBundlePromptParametersAvailability"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundlePromptParametersAvailability](self, "hasBundlePromptParametersAvailability"))goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundlePromptParametersAvailability"))
        goto LABEL_312;
      v54 = -[BMMomentsEventDataEventBundle bundlePromptParametersAvailability](self, "bundlePromptParametersAvailability");
      if (v54 != objc_msgSend(v5, "bundlePromptParametersAvailability"))
        goto LABEL_312;
    }
    v55 = -[BMMomentsEventDataEventBundle bundlePlaceType](self, "bundlePlaceType");
    if (v55 != objc_msgSend(v5, "bundlePlaceType"))
      goto LABEL_312;
    v56 = -[BMMomentsEventDataEventBundle bundlePlaceUserType](self, "bundlePlaceUserType");
    if (v56 != objc_msgSend(v5, "bundlePlaceUserType"))
      goto LABEL_312;
    v57 = -[BMMomentsEventDataEventBundle bundleBaseEventCateory](self, "bundleBaseEventCateory");
    if (v57 != objc_msgSend(v5, "bundleBaseEventCateory"))
      goto LABEL_312;
    -[BMMomentsEventDataEventBundle bundleEventIDs](self, "bundleEventIDs");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleEventIDs");
    v59 = objc_claimAutoreleasedReturnValue();
    if (v58 == (void *)v59)
    {

    }
    else
    {
      v60 = (void *)v59;
      -[BMMomentsEventDataEventBundle bundleEventIDs](self, "bundleEventIDs");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleEventIDs");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqual:", v62);

      if (!v63)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle bundleActionType](self, "bundleActionType");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleActionType");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v64 == (void *)v65)
    {

    }
    else
    {
      v66 = (void *)v65;
      -[BMMomentsEventDataEventBundle bundleActionType](self, "bundleActionType");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleActionType");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "isEqual:", v68);

      if (!v69)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle backgroundActions](self, "backgroundActions");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundActions");
    v71 = objc_claimAutoreleasedReturnValue();
    if (v70 == (void *)v71)
    {

    }
    else
    {
      v72 = (void *)v71;
      -[BMMomentsEventDataEventBundle backgroundActions](self, "backgroundActions");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "backgroundActions");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v73, "isEqual:", v74);

      if (!v75)
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleIsFamilyIncluded](self, "hasBundleIsFamilyIncluded")
      || objc_msgSend(v5, "hasBundleIsFamilyIncluded"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleIsFamilyIncluded](self, "hasBundleIsFamilyIncluded"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleIsFamilyIncluded"))
        goto LABEL_312;
      v76 = -[BMMomentsEventDataEventBundle bundleIsFamilyIncluded](self, "bundleIsFamilyIncluded");
      if (v76 != objc_msgSend(v5, "bundleIsFamilyIncluded"))
        goto LABEL_312;
    }
    v77 = -[BMMomentsEventDataEventBundle bundleTimeTag](self, "bundleTimeTag");
    if (v77 != objc_msgSend(v5, "bundleTimeTag"))
      goto LABEL_312;
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeUnknown](self, "hasIsBundleResourceTypeUnknown")
      || objc_msgSend(v5, "hasIsBundleResourceTypeUnknown"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeUnknown](self, "hasIsBundleResourceTypeUnknown"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsBundleResourceTypeUnknown"))
        goto LABEL_312;
      v78 = -[BMMomentsEventDataEventBundle isBundleResourceTypeUnknown](self, "isBundleResourceTypeUnknown");
      if (v78 != objc_msgSend(v5, "isBundleResourceTypeUnknown"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeValueIncluded](self, "hasIsBundleResourceTypeValueIncluded")|| objc_msgSend(v5, "hasIsBundleResourceTypeValueIncluded"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeValueIncluded](self, "hasIsBundleResourceTypeValueIncluded"))goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsBundleResourceTypeValueIncluded"))
        goto LABEL_312;
      v79 = -[BMMomentsEventDataEventBundle isBundleResourceTypeValueIncluded](self, "isBundleResourceTypeValueIncluded");
      if (v79 != objc_msgSend(v5, "isBundleResourceTypeValueIncluded"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypePhotoAssetsIncluded](self, "hasIsBundleResourceTypePhotoAssetsIncluded")|| objc_msgSend(v5, "hasIsBundleResourceTypePhotoAssetsIncluded"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsBundleResourceTypePhotoAssetsIncluded](self, "hasIsBundleResourceTypePhotoAssetsIncluded"))goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsBundleResourceTypePhotoAssetsIncluded"))
        goto LABEL_312;
      v80 = -[BMMomentsEventDataEventBundle isBundleResourceTypePhotoAssetsIncluded](self, "isBundleResourceTypePhotoAssetsIncluded");
      if (v80 != objc_msgSend(v5, "isBundleResourceTypePhotoAssetsIncluded"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeMediaIncluded](self, "hasIsBundleResourceTypeMediaIncluded")|| objc_msgSend(v5, "hasIsBundleResourceTypeMediaIncluded"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeMediaIncluded](self, "hasIsBundleResourceTypeMediaIncluded"))goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsBundleResourceTypeMediaIncluded"))
        goto LABEL_312;
      v81 = -[BMMomentsEventDataEventBundle isBundleResourceTypeMediaIncluded](self, "isBundleResourceTypeMediaIncluded");
      if (v81 != objc_msgSend(v5, "isBundleResourceTypeMediaIncluded"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeWebLinkIncluded](self, "hasIsBundleResourceTypeWebLinkIncluded")|| objc_msgSend(v5, "hasIsBundleResourceTypeWebLinkIncluded"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeWebLinkIncluded](self, "hasIsBundleResourceTypeWebLinkIncluded"))goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsBundleResourceTypeWebLinkIncluded"))
        goto LABEL_312;
      v82 = -[BMMomentsEventDataEventBundle isBundleResourceTypeWebLinkIncluded](self, "isBundleResourceTypeWebLinkIncluded");
      if (v82 != objc_msgSend(v5, "isBundleResourceTypeWebLinkIncluded"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeInterenceTagIncluded](self, "hasIsBundleResourceTypeInterenceTagIncluded")|| objc_msgSend(v5, "hasIsBundleResourceTypeInterenceTagIncluded"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsBundleResourceTypeInterenceTagIncluded](self, "hasIsBundleResourceTypeInterenceTagIncluded"))goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsBundleResourceTypeInterenceTagIncluded"))
        goto LABEL_312;
      v83 = -[BMMomentsEventDataEventBundle isBundleResourceTypeInterenceTagIncluded](self, "isBundleResourceTypeInterenceTagIncluded");
      if (v83 != objc_msgSend(v5, "isBundleResourceTypeInterenceTagIncluded"))
        goto LABEL_312;
    }
    v84 = -[BMMomentsEventDataEventBundle bundlEngagement](self, "bundlEngagement");
    if (v84 != objc_msgSend(v5, "bundlEngagement"))
      goto LABEL_312;
    if (-[BMMomentsEventDataEventBundle hasBundleVersion](self, "hasBundleVersion")
      || objc_msgSend(v5, "hasBundleVersion"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleVersion](self, "hasBundleVersion"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleVersion"))
        goto LABEL_312;
      -[BMMomentsEventDataEventBundle bundleVersion](self, "bundleVersion");
      v86 = v85;
      objc_msgSend(v5, "bundleVersion");
      if (v86 != v87)
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasRankingVersion](self, "hasRankingVersion")
      || objc_msgSend(v5, "hasRankingVersion"))
    {
      if (!-[BMMomentsEventDataEventBundle hasRankingVersion](self, "hasRankingVersion"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasRankingVersion"))
        goto LABEL_312;
      -[BMMomentsEventDataEventBundle rankingVersion](self, "rankingVersion");
      v89 = v88;
      objc_msgSend(v5, "rankingVersion");
      if (v89 != v90)
        goto LABEL_312;
    }
    v91 = -[BMMomentsEventDataEventBundle suggestionType](self, "suggestionType");
    if (v91 != objc_msgSend(v5, "suggestionType"))
      goto LABEL_312;
    -[BMMomentsEventDataEventBundle suggestionTimestamp](self, "suggestionTimestamp");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionTimestamp");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v92 == (void *)v93)
    {

    }
    else
    {
      v94 = (void *)v93;
      -[BMMomentsEventDataEventBundle suggestionTimestamp](self, "suggestionTimestamp");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionTimestamp");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v95, "isEqual:", v96);

      if (!v97)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle suggestionClientIdentifier](self, "suggestionClientIdentifier");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionClientIdentifier");
    v99 = objc_claimAutoreleasedReturnValue();
    if (v98 == (void *)v99)
    {

    }
    else
    {
      v100 = (void *)v99;
      -[BMMomentsEventDataEventBundle suggestionClientIdentifier](self, "suggestionClientIdentifier");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionClientIdentifier");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v101, "isEqual:", v102);

      if (!v103)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle suggestionViewContainerName](self, "suggestionViewContainerName");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionViewContainerName");
    v105 = objc_claimAutoreleasedReturnValue();
    if (v104 == (void *)v105)
    {

    }
    else
    {
      v106 = (void *)v105;
      -[BMMomentsEventDataEventBundle suggestionViewContainerName](self, "suggestionViewContainerName");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionViewContainerName");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v107, "isEqual:", v108);

      if (!v109)
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasSuggestionViewVisibleTime](self, "hasSuggestionViewVisibleTime")
      || objc_msgSend(v5, "hasSuggestionViewVisibleTime"))
    {
      if (!-[BMMomentsEventDataEventBundle hasSuggestionViewVisibleTime](self, "hasSuggestionViewVisibleTime"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasSuggestionViewVisibleTime"))
        goto LABEL_312;
      -[BMMomentsEventDataEventBundle suggestionViewVisibleTime](self, "suggestionViewVisibleTime");
      v111 = v110;
      objc_msgSend(v5, "suggestionViewVisibleTime");
      if (v111 != v112)
        goto LABEL_312;
    }
    v113 = -[BMMomentsEventDataEventBundle appEntryEventType](self, "appEntryEventType");
    if (v113 != objc_msgSend(v5, "appEntryEventType"))
      goto LABEL_312;
    -[BMMomentsEventDataEventBundle appEntryEventClientIdentifier](self, "appEntryEventClientIdentifier");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appEntryEventClientIdentifier");
    v115 = objc_claimAutoreleasedReturnValue();
    if (v114 == (void *)v115)
    {

    }
    else
    {
      v116 = (void *)v115;
      -[BMMomentsEventDataEventBundle appEntryEventClientIdentifier](self, "appEntryEventClientIdentifier");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appEntryEventClientIdentifier");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v117, "isEqual:", v118);

      if (!v119)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle appEntryEventTimestamp](self, "appEntryEventTimestamp");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appEntryEventTimestamp");
    v121 = objc_claimAutoreleasedReturnValue();
    if (v120 == (void *)v121)
    {

    }
    else
    {
      v122 = (void *)v121;
      -[BMMomentsEventDataEventBundle appEntryEventTimestamp](self, "appEntryEventTimestamp");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appEntryEventTimestamp");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v123, "isEqual:", v124);

      if (!v125)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle appEntryEventStartTime](self, "appEntryEventStartTime");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appEntryEventStartTime");
    v127 = objc_claimAutoreleasedReturnValue();
    if (v126 == (void *)v127)
    {

    }
    else
    {
      v128 = (void *)v127;
      -[BMMomentsEventDataEventBundle appEntryEventStartTime](self, "appEntryEventStartTime");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appEntryEventStartTime");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v129, "isEqual:", v130);

      if (!v131)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle appEntryEventEndTime](self, "appEntryEventEndTime");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appEntryEventEndTime");
    v133 = objc_claimAutoreleasedReturnValue();
    if (v132 == (void *)v133)
    {

    }
    else
    {
      v134 = (void *)v133;
      -[BMMomentsEventDataEventBundle appEntryEventEndTime](self, "appEntryEventEndTime");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appEntryEventEndTime");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend(v135, "isEqual:", v136);

      if (!v137)
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasAppEntryEventTotalCharacters](self, "hasAppEntryEventTotalCharacters")
      || objc_msgSend(v5, "hasAppEntryEventTotalCharacters"))
    {
      if (!-[BMMomentsEventDataEventBundle hasAppEntryEventTotalCharacters](self, "hasAppEntryEventTotalCharacters"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasAppEntryEventTotalCharacters"))
        goto LABEL_312;
      v138 = -[BMMomentsEventDataEventBundle appEntryEventTotalCharacters](self, "appEntryEventTotalCharacters");
      if (v138 != objc_msgSend(v5, "appEntryEventTotalCharacters"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasAppEntryEventAddedCharacters](self, "hasAppEntryEventAddedCharacters")
      || objc_msgSend(v5, "hasAppEntryEventAddedCharacters"))
    {
      if (!-[BMMomentsEventDataEventBundle hasAppEntryEventAddedCharacters](self, "hasAppEntryEventAddedCharacters"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasAppEntryEventAddedCharacters"))
        goto LABEL_312;
      v139 = -[BMMomentsEventDataEventBundle appEntryEventAddedCharacters](self, "appEntryEventAddedCharacters");
      if (v139 != objc_msgSend(v5, "appEntryEventAddedCharacters"))
        goto LABEL_312;
    }
    v140 = -[BMMomentsEventDataEventBundle clientActivityEventType](self, "clientActivityEventType");
    if (v140 != objc_msgSend(v5, "clientActivityEventType"))
      goto LABEL_312;
    -[BMMomentsEventDataEventBundle clientActivityEventClientIdentifier](self, "clientActivityEventClientIdentifier");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientActivityEventClientIdentifier");
    v142 = objc_claimAutoreleasedReturnValue();
    if (v141 == (void *)v142)
    {

    }
    else
    {
      v143 = (void *)v142;
      -[BMMomentsEventDataEventBundle clientActivityEventClientIdentifier](self, "clientActivityEventClientIdentifier");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientActivityEventClientIdentifier");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = objc_msgSend(v144, "isEqual:", v145);

      if (!v146)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle clientActivityEventTimestamp](self, "clientActivityEventTimestamp");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientActivityEventTimestamp");
    v148 = objc_claimAutoreleasedReturnValue();
    if (v147 == (void *)v148)
    {

    }
    else
    {
      v149 = (void *)v148;
      -[BMMomentsEventDataEventBundle clientActivityEventTimestamp](self, "clientActivityEventTimestamp");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientActivityEventTimestamp");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(v150, "isEqual:", v151);

      if (!v152)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle suggestionIdentifier](self, "suggestionIdentifier");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionIdentifier");
    v154 = objc_claimAutoreleasedReturnValue();
    if (v153 == (void *)v154)
    {

    }
    else
    {
      v155 = (void *)v154;
      -[BMMomentsEventDataEventBundle suggestionIdentifier](self, "suggestionIdentifier");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionIdentifier");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend(v156, "isEqual:", v157);

      if (!v158)
        goto LABEL_312;
    }
    v159 = -[BMMomentsEventDataEventBundle photoSourceType](self, "photoSourceType");
    if (v159 != objc_msgSend(v5, "photoSourceType"))
      goto LABEL_312;
    v160 = -[BMMomentsEventDataEventBundle photoLibraryType](self, "photoLibraryType");
    if (v160 != objc_msgSend(v5, "photoLibraryType"))
      goto LABEL_312;
    if (-[BMMomentsEventDataEventBundle hasBundleSourcePostAnalyticsExists](self, "hasBundleSourcePostAnalyticsExists")
      || objc_msgSend(v5, "hasBundleSourcePostAnalyticsExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourcePostAnalyticsExists](self, "hasBundleSourcePostAnalyticsExists"))goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourcePostAnalyticsExists"))
        goto LABEL_312;
      v161 = -[BMMomentsEventDataEventBundle bundleSourcePostAnalyticsExists](self, "bundleSourcePostAnalyticsExists");
      if (v161 != objc_msgSend(v5, "bundleSourcePostAnalyticsExists"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleSourcePDExists](self, "hasBundleSourcePDExists")
      || objc_msgSend(v5, "hasBundleSourcePDExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourcePDExists](self, "hasBundleSourcePDExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourcePDExists"))
        goto LABEL_312;
      v162 = -[BMMomentsEventDataEventBundle bundleSourcePDExists](self, "bundleSourcePDExists");
      if (v162 != objc_msgSend(v5, "bundleSourcePDExists"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleSourceMotionExists](self, "hasBundleSourceMotionExists")
      || objc_msgSend(v5, "hasBundleSourceMotionExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourceMotionExists](self, "hasBundleSourceMotionExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourceMotionExists"))
        goto LABEL_312;
      v163 = -[BMMomentsEventDataEventBundle bundleSourceMotionExists](self, "bundleSourceMotionExists");
      if (v163 != objc_msgSend(v5, "bundleSourceMotionExists"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleSourceBooksExists](self, "hasBundleSourceBooksExists")
      || objc_msgSend(v5, "hasBundleSourceBooksExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourceBooksExists](self, "hasBundleSourceBooksExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourceBooksExists"))
        goto LABEL_312;
      v164 = -[BMMomentsEventDataEventBundle bundleSourceBooksExists](self, "bundleSourceBooksExists");
      if (v164 != objc_msgSend(v5, "bundleSourceBooksExists"))
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundleSourceScreenTimeExists](self, "hasBundleSourceScreenTimeExists")
      || objc_msgSend(v5, "hasBundleSourceScreenTimeExists"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundleSourceScreenTimeExists](self, "hasBundleSourceScreenTimeExists"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundleSourceScreenTimeExists"))
        goto LABEL_312;
      v165 = -[BMMomentsEventDataEventBundle bundleSourceScreenTimeExists](self, "bundleSourceScreenTimeExists");
      if (v165 != objc_msgSend(v5, "bundleSourceScreenTimeExists"))
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle gaPRArray](self, "gaPRArray");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gaPRArray");
    v167 = objc_claimAutoreleasedReturnValue();
    if (v166 == (void *)v167)
    {

    }
    else
    {
      v168 = (void *)v167;
      -[BMMomentsEventDataEventBundle gaPRArray](self, "gaPRArray");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gaPRArray");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = objc_msgSend(v169, "isEqual:", v170);

      if (!v171)
        goto LABEL_312;
    }
    if (-[BMMomentsEventDataEventBundle hasBundlePCount](self, "hasBundlePCount")
      || objc_msgSend(v5, "hasBundlePCount"))
    {
      if (!-[BMMomentsEventDataEventBundle hasBundlePCount](self, "hasBundlePCount"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasBundlePCount"))
        goto LABEL_312;
      v172 = -[BMMomentsEventDataEventBundle bundlePCount](self, "bundlePCount");
      if (v172 != objc_msgSend(v5, "bundlePCount"))
        goto LABEL_312;
    }
    v173 = -[BMMomentsEventDataEventBundle ranking](self, "ranking");
    if (v173 != objc_msgSend(v5, "ranking"))
      goto LABEL_312;
    v174 = -[BMMomentsEventDataEventBundle labelConfidenceScore](self, "labelConfidenceScore");
    if (v174 != objc_msgSend(v5, "labelConfidenceScore"))
      goto LABEL_312;
    v175 = -[BMMomentsEventDataEventBundle timeCorrelationScore](self, "timeCorrelationScore");
    if (v175 != objc_msgSend(v5, "timeCorrelationScore"))
      goto LABEL_312;
    v176 = -[BMMomentsEventDataEventBundle callDuration](self, "callDuration");
    if (v176 != objc_msgSend(v5, "callDuration"))
      goto LABEL_312;
    v177 = -[BMMomentsEventDataEventBundle interactionCount](self, "interactionCount");
    if (v177 != objc_msgSend(v5, "interactionCount"))
      goto LABEL_312;
    v178 = -[BMMomentsEventDataEventBundle interactionType](self, "interactionType");
    if (v178 != objc_msgSend(v5, "interactionType"))
      goto LABEL_312;
    v179 = -[BMMomentsEventDataEventBundle callPlace](self, "callPlace");
    if (v179 != objc_msgSend(v5, "callPlace"))
      goto LABEL_312;
    v180 = -[BMMomentsEventDataEventBundle distanceFromHome](self, "distanceFromHome");
    if (v180 != objc_msgSend(v5, "distanceFromHome"))
      goto LABEL_312;
    v181 = -[BMMomentsEventDataEventBundle homeAvailability](self, "homeAvailability");
    if (v181 != objc_msgSend(v5, "homeAvailability"))
      goto LABEL_312;
    v182 = -[BMMomentsEventDataEventBundle workAvailability](self, "workAvailability");
    if (v182 != objc_msgSend(v5, "workAvailability"))
      goto LABEL_312;
    v183 = -[BMMomentsEventDataEventBundle bundleVisitMapItemSource](self, "bundleVisitMapItemSource");
    if (v183 != objc_msgSend(v5, "bundleVisitMapItemSource"))
      goto LABEL_312;
    v184 = -[BMMomentsEventDataEventBundle bundleVisitPlaceType](self, "bundleVisitPlaceType");
    if (v184 != objc_msgSend(v5, "bundleVisitPlaceType"))
      goto LABEL_312;
    v185 = -[BMMomentsEventDataEventBundle bundleVisitPlaceLabelGranularity](self, "bundleVisitPlaceLabelGranularity");
    if (v185 != objc_msgSend(v5, "bundleVisitPlaceLabelGranularity"))
      goto LABEL_312;
    v186 = -[BMMomentsEventDataEventBundle bundleIncludesAnomalousEvent](self, "bundleIncludesAnomalousEvent");
    if (v186 != objc_msgSend(v5, "bundleIncludesAnomalousEvent"))
      goto LABEL_312;
    if (-[BMMomentsEventDataEventBundle hasIsFiltered](self, "hasIsFiltered")
      || objc_msgSend(v5, "hasIsFiltered"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsFiltered](self, "hasIsFiltered"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsFiltered"))
        goto LABEL_312;
      v187 = -[BMMomentsEventDataEventBundle isFiltered](self, "isFiltered");
      if (v187 != objc_msgSend(v5, "isFiltered"))
        goto LABEL_312;
    }
    v188 = -[BMMomentsEventDataEventBundle bundleSuperType](self, "bundleSuperType");
    if (v188 != objc_msgSend(v5, "bundleSuperType"))
      goto LABEL_312;
    v189 = -[BMMomentsEventDataEventBundle bundleSubType](self, "bundleSubType");
    if (v189 != objc_msgSend(v5, "bundleSubType"))
      goto LABEL_312;
    if (-[BMMomentsEventDataEventBundle hasIsAggregatedAndSuppressed](self, "hasIsAggregatedAndSuppressed")
      || objc_msgSend(v5, "hasIsAggregatedAndSuppressed"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIsAggregatedAndSuppressed](self, "hasIsAggregatedAndSuppressed"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasIsAggregatedAndSuppressed"))
        goto LABEL_312;
      v190 = -[BMMomentsEventDataEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed");
      if (v190 != objc_msgSend(v5, "isAggregatedAndSuppressed"))
        goto LABEL_312;
    }
    v191 = -[BMMomentsEventDataEventBundle summarizationGranularity](self, "summarizationGranularity");
    if (v191 != objc_msgSend(v5, "summarizationGranularity"))
      goto LABEL_312;
    if (-[BMMomentsEventDataEventBundle hasIncludedInSummaryBundleOnly](self, "hasIncludedInSummaryBundleOnly")
      || objc_msgSend(v5, "hasIncludedInSummaryBundleOnly"))
    {
      if (!-[BMMomentsEventDataEventBundle hasIncludedInSummaryBundleOnly](self, "hasIncludedInSummaryBundleOnly"))
        goto LABEL_312;
      if (!objc_msgSend(v5, "hasIncludedInSummaryBundleOnly"))
        goto LABEL_312;
      v192 = -[BMMomentsEventDataEventBundle includedInSummaryBundleOnly](self, "includedInSummaryBundleOnly");
      if (v192 != objc_msgSend(v5, "includedInSummaryBundleOnly"))
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle subBundleIDs](self, "subBundleIDs");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subBundleIDs");
    v194 = objc_claimAutoreleasedReturnValue();
    if (v193 == (void *)v194)
    {

    }
    else
    {
      v195 = (void *)v194;
      -[BMMomentsEventDataEventBundle subBundleIDs](self, "subBundleIDs");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subBundleIDs");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = objc_msgSend(v196, "isEqual:", v197);

      if (!v198)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle subSuggestionIDs](self, "subSuggestionIDs");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subSuggestionIDs");
    v200 = objc_claimAutoreleasedReturnValue();
    if (v199 == (void *)v200)
    {

    }
    else
    {
      v201 = (void *)v200;
      -[BMMomentsEventDataEventBundle subSuggestionIDs](self, "subSuggestionIDs");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subSuggestionIDs");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = objc_msgSend(v202, "isEqual:", v203);

      if (!v204)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle firstCreationDate](self, "firstCreationDate");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstCreationDate");
    v206 = objc_claimAutoreleasedReturnValue();
    if (v205 == (void *)v206)
    {

    }
    else
    {
      v207 = (void *)v206;
      -[BMMomentsEventDataEventBundle firstCreationDate](self, "firstCreationDate");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstCreationDate");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v210 = objc_msgSend(v208, "isEqual:", v209);

      if (!v210)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle resources](self, "resources");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resources");
    v212 = objc_claimAutoreleasedReturnValue();
    if (v211 == (void *)v212)
    {

    }
    else
    {
      v213 = (void *)v212;
      -[BMMomentsEventDataEventBundle resources](self, "resources");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resources");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = objc_msgSend(v214, "isEqual:", v215);

      if (!v216)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle persons](self, "persons");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persons");
    v218 = objc_claimAutoreleasedReturnValue();
    if (v217 == (void *)v218)
    {

    }
    else
    {
      v219 = (void *)v218;
      -[BMMomentsEventDataEventBundle persons](self, "persons");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "persons");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v222 = objc_msgSend(v220, "isEqual:", v221);

      if (!v222)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle mainPlace](self, "mainPlace");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainPlace");
    v224 = objc_claimAutoreleasedReturnValue();
    if (v223 == (void *)v224)
    {

    }
    else
    {
      v225 = (void *)v224;
      -[BMMomentsEventDataEventBundle mainPlace](self, "mainPlace");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mainPlace");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = objc_msgSend(v226, "isEqual:", v227);

      if (!v228)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle otherPlaces](self, "otherPlaces");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "otherPlaces");
    v230 = objc_claimAutoreleasedReturnValue();
    if (v229 == (void *)v230)
    {

    }
    else
    {
      v231 = (void *)v230;
      -[BMMomentsEventDataEventBundle otherPlaces](self, "otherPlaces");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "otherPlaces");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = objc_msgSend(v232, "isEqual:", v233);

      if (!v234)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle photoTraits](self, "photoTraits");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoTraits");
    v236 = objc_claimAutoreleasedReturnValue();
    if (v235 == (void *)v236)
    {

    }
    else
    {
      v237 = (void *)v236;
      -[BMMomentsEventDataEventBundle photoTraits](self, "photoTraits");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "photoTraits");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = objc_msgSend(v238, "isEqual:", v239);

      if (!v240)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle clusterMetadata](self, "clusterMetadata");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clusterMetadata");
    v242 = objc_claimAutoreleasedReturnValue();
    if (v241 == (void *)v242)
    {

    }
    else
    {
      v243 = (void *)v242;
      -[BMMomentsEventDataEventBundle clusterMetadata](self, "clusterMetadata");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clusterMetadata");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      v246 = objc_msgSend(v244, "isEqual:", v245);

      if (!v246)
        goto LABEL_312;
    }
    -[BMMomentsEventDataEventBundle outlierMetadata](self, "outlierMetadata");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outlierMetadata");
    v248 = objc_claimAutoreleasedReturnValue();
    if (v247 == (void *)v248)
    {

    }
    else
    {
      v249 = (void *)v248;
      -[BMMomentsEventDataEventBundle outlierMetadata](self, "outlierMetadata");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outlierMetadata");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = objc_msgSend(v250, "isEqual:", v251);

      if (!v252)
        goto LABEL_312;
    }
    if (!-[BMMomentsEventDataEventBundle hasBundleGoodnessScore](self, "hasBundleGoodnessScore")
      && !objc_msgSend(v5, "hasBundleGoodnessScore")
      || -[BMMomentsEventDataEventBundle hasBundleGoodnessScore](self, "hasBundleGoodnessScore")
      && objc_msgSend(v5, "hasBundleGoodnessScore")
      && (-[BMMomentsEventDataEventBundle bundleGoodnessScore](self, "bundleGoodnessScore"),
          v254 = v253,
          objc_msgSend(v5, "bundleGoodnessScore"),
          v254 == v255))
    {
      if (!-[BMMomentsEventDataEventBundle hasDistinctnessScore](self, "hasDistinctnessScore")
        && !objc_msgSend(v5, "hasDistinctnessScore")
        || -[BMMomentsEventDataEventBundle hasDistinctnessScore](self, "hasDistinctnessScore")
        && objc_msgSend(v5, "hasDistinctnessScore")
        && (-[BMMomentsEventDataEventBundle distinctnessScore](self, "distinctnessScore"),
            v257 = v256,
            objc_msgSend(v5, "distinctnessScore"),
            v257 == v258))
      {
        if (!-[BMMomentsEventDataEventBundle hasRichnessScore](self, "hasRichnessScore")
          && !objc_msgSend(v5, "hasRichnessScore")
          || -[BMMomentsEventDataEventBundle hasRichnessScore](self, "hasRichnessScore")
          && objc_msgSend(v5, "hasRichnessScore")
          && (-[BMMomentsEventDataEventBundle richnessScore](self, "richnessScore"),
              v260 = v259,
              objc_msgSend(v5, "richnessScore"),
              v260 == v261))
        {
          if (!-[BMMomentsEventDataEventBundle hasEngagementScore](self, "hasEngagementScore")
            && !objc_msgSend(v5, "hasEngagementScore")
            || -[BMMomentsEventDataEventBundle hasEngagementScore](self, "hasEngagementScore")
            && objc_msgSend(v5, "hasEngagementScore")
            && (-[BMMomentsEventDataEventBundle engagementScore](self, "engagementScore"),
                v263 = v262,
                objc_msgSend(v5, "engagementScore"),
                v263 == v264))
          {
            if (!-[BMMomentsEventDataEventBundle hasHeuristicsScore](self, "hasHeuristicsScore")
              && !objc_msgSend(v5, "hasHeuristicsScore")
              || -[BMMomentsEventDataEventBundle hasHeuristicsScore](self, "hasHeuristicsScore")
              && objc_msgSend(v5, "hasHeuristicsScore")
              && (-[BMMomentsEventDataEventBundle heuristicsScore](self, "heuristicsScore"),
                  v266 = v265,
                  objc_msgSend(v5, "heuristicsScore"),
                  v266 == v267))
            {
              -[BMMomentsEventDataEventBundle metadataForRank](self, "metadataForRank");
              v268 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "metadataForRank");
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              if (v268 == v269)
              {
                v12 = 1;
              }
              else
              {
                -[BMMomentsEventDataEventBundle metadataForRank](self, "metadataForRank");
                v270 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "metadataForRank");
                v271 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v270, "isEqual:", v271);

              }
              goto LABEL_313;
            }
          }
        }
      }
    }
LABEL_312:
    v12 = 0;
LABEL_313:

    goto LABEL_314;
  }
  v12 = 0;
LABEL_314:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int)bundleInterfaceType
{
  return self->_bundleInterfaceType;
}

- (BOOL)bundleSourceHealthExists
{
  return self->_bundleSourceHealthExists;
}

- (BOOL)hasBundleSourceHealthExists
{
  return self->_hasBundleSourceHealthExists;
}

- (void)setHasBundleSourceHealthExists:(BOOL)a3
{
  self->_hasBundleSourceHealthExists = a3;
}

- (BOOL)bundleSourcePhotoExists
{
  return self->_bundleSourcePhotoExists;
}

- (BOOL)hasBundleSourcePhotoExists
{
  return self->_hasBundleSourcePhotoExists;
}

- (void)setHasBundleSourcePhotoExists:(BOOL)a3
{
  self->_hasBundleSourcePhotoExists = a3;
}

- (BOOL)bundleSourceProactiveExists
{
  return self->_bundleSourceProactiveExists;
}

- (BOOL)hasBundleSourceProactiveExists
{
  return self->_hasBundleSourceProactiveExists;
}

- (void)setHasBundleSourceProactiveExists:(BOOL)a3
{
  self->_hasBundleSourceProactiveExists = a3;
}

- (BOOL)bundleSourceRoutineExists
{
  return self->_bundleSourceRoutineExists;
}

- (BOOL)hasBundleSourceRoutineExists
{
  return self->_hasBundleSourceRoutineExists;
}

- (void)setHasBundleSourceRoutineExists:(BOOL)a3
{
  self->_hasBundleSourceRoutineExists = a3;
}

- (NSString)bundlePromptLanguageFormat
{
  return self->_bundlePromptLanguageFormat;
}

- (NSArray)bundleEventIDs
{
  return self->_bundleEventIDs;
}

- (BMMomentsEventDataAction)bundleActionType
{
  return self->_bundleActionType;
}

- (NSArray)backgroundActions
{
  return self->_backgroundActions;
}

- (BOOL)bundleIsFamilyIncluded
{
  return self->_bundleIsFamilyIncluded;
}

- (BOOL)hasBundleIsFamilyIncluded
{
  return self->_hasBundleIsFamilyIncluded;
}

- (void)setHasBundleIsFamilyIncluded:(BOOL)a3
{
  self->_hasBundleIsFamilyIncluded = a3;
}

- (int)bundleTimeTag
{
  return self->_bundleTimeTag;
}

- (double)bundleVersion
{
  return self->_bundleVersion;
}

- (BOOL)hasBundleVersion
{
  return self->_hasBundleVersion;
}

- (void)setHasBundleVersion:(BOOL)a3
{
  self->_hasBundleVersion = a3;
}

- (double)rankingVersion
{
  return self->_rankingVersion;
}

- (BOOL)hasRankingVersion
{
  return self->_hasRankingVersion;
}

- (void)setHasRankingVersion:(BOOL)a3
{
  self->_hasRankingVersion = a3;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (NSString)suggestionClientIdentifier
{
  return self->_suggestionClientIdentifier;
}

- (NSString)suggestionViewContainerName
{
  return self->_suggestionViewContainerName;
}

- (double)suggestionViewVisibleTime
{
  return self->_suggestionViewVisibleTime;
}

- (BOOL)hasSuggestionViewVisibleTime
{
  return self->_hasSuggestionViewVisibleTime;
}

- (void)setHasSuggestionViewVisibleTime:(BOOL)a3
{
  self->_hasSuggestionViewVisibleTime = a3;
}

- (int)appEntryEventType
{
  return self->_appEntryEventType;
}

- (NSString)appEntryEventClientIdentifier
{
  return self->_appEntryEventClientIdentifier;
}

- (int)appEntryEventTotalCharacters
{
  return self->_appEntryEventTotalCharacters;
}

- (BOOL)hasAppEntryEventTotalCharacters
{
  return self->_hasAppEntryEventTotalCharacters;
}

- (void)setHasAppEntryEventTotalCharacters:(BOOL)a3
{
  self->_hasAppEntryEventTotalCharacters = a3;
}

- (int)appEntryEventAddedCharacters
{
  return self->_appEntryEventAddedCharacters;
}

- (BOOL)hasAppEntryEventAddedCharacters
{
  return self->_hasAppEntryEventAddedCharacters;
}

- (void)setHasAppEntryEventAddedCharacters:(BOOL)a3
{
  self->_hasAppEntryEventAddedCharacters = a3;
}

- (int)clientActivityEventType
{
  return self->_clientActivityEventType;
}

- (NSString)clientActivityEventClientIdentifier
{
  return self->_clientActivityEventClientIdentifier;
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (int)photoSourceType
{
  return self->_photoSourceType;
}

- (int)photoLibraryType
{
  return self->_photoLibraryType;
}

- (BOOL)bundleSourcePostAnalyticsExists
{
  return self->_bundleSourcePostAnalyticsExists;
}

- (BOOL)hasBundleSourcePostAnalyticsExists
{
  return self->_hasBundleSourcePostAnalyticsExists;
}

- (void)setHasBundleSourcePostAnalyticsExists:(BOOL)a3
{
  self->_hasBundleSourcePostAnalyticsExists = a3;
}

- (BOOL)bundleSourcePDExists
{
  return self->_bundleSourcePDExists;
}

- (BOOL)hasBundleSourcePDExists
{
  return self->_hasBundleSourcePDExists;
}

- (void)setHasBundleSourcePDExists:(BOOL)a3
{
  self->_hasBundleSourcePDExists = a3;
}

- (BOOL)bundleSourceMotionExists
{
  return self->_bundleSourceMotionExists;
}

- (BOOL)hasBundleSourceMotionExists
{
  return self->_hasBundleSourceMotionExists;
}

- (void)setHasBundleSourceMotionExists:(BOOL)a3
{
  self->_hasBundleSourceMotionExists = a3;
}

- (BOOL)bundleSourceBooksExists
{
  return self->_bundleSourceBooksExists;
}

- (BOOL)hasBundleSourceBooksExists
{
  return self->_hasBundleSourceBooksExists;
}

- (void)setHasBundleSourceBooksExists:(BOOL)a3
{
  self->_hasBundleSourceBooksExists = a3;
}

- (BOOL)bundleSourceScreenTimeExists
{
  return self->_bundleSourceScreenTimeExists;
}

- (BOOL)hasBundleSourceScreenTimeExists
{
  return self->_hasBundleSourceScreenTimeExists;
}

- (void)setHasBundleSourceScreenTimeExists:(BOOL)a3
{
  self->_hasBundleSourceScreenTimeExists = a3;
}

- (NSArray)gaPRArray
{
  return self->_gaPRArray;
}

- (int)bundlePCount
{
  return self->_bundlePCount;
}

- (BOOL)hasBundlePCount
{
  return self->_hasBundlePCount;
}

- (void)setHasBundlePCount:(BOOL)a3
{
  self->_hasBundlePCount = a3;
}

- (int)ranking
{
  return self->_ranking;
}

- (int)labelConfidenceScore
{
  return self->_labelConfidenceScore;
}

- (int)timeCorrelationScore
{
  return self->_timeCorrelationScore;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (int)interactionCount
{
  return self->_interactionCount;
}

- (int)interactionType
{
  return self->_interactionType;
}

- (int)callPlace
{
  return self->_callPlace;
}

- (int)distanceFromHome
{
  return self->_distanceFromHome;
}

- (int)homeAvailability
{
  return self->_homeAvailability;
}

- (int)workAvailability
{
  return self->_workAvailability;
}

- (int)bundleVisitMapItemSource
{
  return self->_bundleVisitMapItemSource;
}

- (int)bundleVisitPlaceType
{
  return self->_bundleVisitPlaceType;
}

- (int)bundleVisitPlaceLabelGranularity
{
  return self->_bundleVisitPlaceLabelGranularity;
}

- (int)bundleIncludesAnomalousEvent
{
  return self->_bundleIncludesAnomalousEvent;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (BOOL)hasIsFiltered
{
  return self->_hasIsFiltered;
}

- (void)setHasIsFiltered:(BOOL)a3
{
  self->_hasIsFiltered = a3;
}

- (int)bundleSuperType
{
  return self->_bundleSuperType;
}

- (int)bundleSubType
{
  return self->_bundleSubType;
}

- (BOOL)isAggregatedAndSuppressed
{
  return self->_isAggregatedAndSuppressed;
}

- (BOOL)hasIsAggregatedAndSuppressed
{
  return self->_hasIsAggregatedAndSuppressed;
}

- (void)setHasIsAggregatedAndSuppressed:(BOOL)a3
{
  self->_hasIsAggregatedAndSuppressed = a3;
}

- (int)summarizationGranularity
{
  return self->_summarizationGranularity;
}

- (BOOL)includedInSummaryBundleOnly
{
  return self->_includedInSummaryBundleOnly;
}

- (BOOL)hasIncludedInSummaryBundleOnly
{
  return self->_hasIncludedInSummaryBundleOnly;
}

- (void)setHasIncludedInSummaryBundleOnly:(BOOL)a3
{
  self->_hasIncludedInSummaryBundleOnly = a3;
}

- (NSArray)subBundleIDs
{
  return self->_subBundleIDs;
}

- (NSArray)subSuggestionIDs
{
  return self->_subSuggestionIDs;
}

- (NSArray)resources
{
  return self->_resources;
}

- (NSArray)persons
{
  return self->_persons;
}

- (BMMomentsEventDataEventBundlePlace)mainPlace
{
  return self->_mainPlace;
}

- (NSArray)otherPlaces
{
  return self->_otherPlaces;
}

- (NSArray)photoTraits
{
  return self->_photoTraits;
}

- (BMMomentsEventDataEventBundleClusterMetadata)clusterMetadata
{
  return self->_clusterMetadata;
}

- (BMMomentsEventDataEventBundleOutlierMetadata)outlierMetadata
{
  return self->_outlierMetadata;
}

- (double)bundleGoodnessScore
{
  return self->_bundleGoodnessScore;
}

- (BOOL)hasBundleGoodnessScore
{
  return self->_hasBundleGoodnessScore;
}

- (void)setHasBundleGoodnessScore:(BOOL)a3
{
  self->_hasBundleGoodnessScore = a3;
}

- (double)distinctnessScore
{
  return self->_distinctnessScore;
}

- (BOOL)hasDistinctnessScore
{
  return self->_hasDistinctnessScore;
}

- (void)setHasDistinctnessScore:(BOOL)a3
{
  self->_hasDistinctnessScore = a3;
}

- (double)richnessScore
{
  return self->_richnessScore;
}

- (BOOL)hasRichnessScore
{
  return self->_hasRichnessScore;
}

- (void)setHasRichnessScore:(BOOL)a3
{
  self->_hasRichnessScore = a3;
}

- (double)engagementScore
{
  return self->_engagementScore;
}

- (BOOL)hasEngagementScore
{
  return self->_hasEngagementScore;
}

- (void)setHasEngagementScore:(BOOL)a3
{
  self->_hasEngagementScore = a3;
}

- (double)heuristicsScore
{
  return self->_heuristicsScore;
}

- (BOOL)hasHeuristicsScore
{
  return self->_hasHeuristicsScore;
}

- (void)setHasHeuristicsScore:(BOOL)a3
{
  self->_hasHeuristicsScore = a3;
}

- (BMMomentsEventDataEventBundleMetadataForRank)metadataForRank
{
  return self->_metadataForRank;
}

- (NSString)bundlePromptToneID
{
  return self->_bundlePromptToneID;
}

- (BOOL)bundlePromptParametersAvailability
{
  return self->_bundlePromptParametersAvailability;
}

- (BOOL)hasBundlePromptParametersAvailability
{
  return self->_hasBundlePromptParametersAvailability;
}

- (void)setHasBundlePromptParametersAvailability:(BOOL)a3
{
  self->_hasBundlePromptParametersAvailability = a3;
}

- (int)bundlePlaceType
{
  return self->_bundlePlaceType;
}

- (int)bundlePlaceUserType
{
  return self->_bundlePlaceUserType;
}

- (int)bundleBaseEventCateory
{
  return self->_bundleBaseEventCateory;
}

- (BOOL)isBundleResourceTypeUnknown
{
  return self->_isBundleResourceTypeUnknown;
}

- (BOOL)hasIsBundleResourceTypeUnknown
{
  return self->_hasIsBundleResourceTypeUnknown;
}

- (void)setHasIsBundleResourceTypeUnknown:(BOOL)a3
{
  self->_hasIsBundleResourceTypeUnknown = a3;
}

- (BOOL)isBundleResourceTypeValueIncluded
{
  return self->_isBundleResourceTypeValueIncluded;
}

- (BOOL)hasIsBundleResourceTypeValueIncluded
{
  return self->_hasIsBundleResourceTypeValueIncluded;
}

- (void)setHasIsBundleResourceTypeValueIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeValueIncluded = a3;
}

- (BOOL)isBundleResourceTypePhotoAssetsIncluded
{
  return self->_isBundleResourceTypePhotoAssetsIncluded;
}

- (BOOL)hasIsBundleResourceTypePhotoAssetsIncluded
{
  return self->_hasIsBundleResourceTypePhotoAssetsIncluded;
}

- (void)setHasIsBundleResourceTypePhotoAssetsIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypePhotoAssetsIncluded = a3;
}

- (BOOL)isBundleResourceTypeMediaIncluded
{
  return self->_isBundleResourceTypeMediaIncluded;
}

- (BOOL)hasIsBundleResourceTypeMediaIncluded
{
  return self->_hasIsBundleResourceTypeMediaIncluded;
}

- (void)setHasIsBundleResourceTypeMediaIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeMediaIncluded = a3;
}

- (BOOL)isBundleResourceTypeWebLinkIncluded
{
  return self->_isBundleResourceTypeWebLinkIncluded;
}

- (BOOL)hasIsBundleResourceTypeWebLinkIncluded
{
  return self->_hasIsBundleResourceTypeWebLinkIncluded;
}

- (void)setHasIsBundleResourceTypeWebLinkIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeWebLinkIncluded = a3;
}

- (BOOL)isBundleResourceTypeInterenceTagIncluded
{
  return self->_isBundleResourceTypeInterenceTagIncluded;
}

- (BOOL)hasIsBundleResourceTypeInterenceTagIncluded
{
  return self->_hasIsBundleResourceTypeInterenceTagIncluded;
}

- (void)setHasIsBundleResourceTypeInterenceTagIncluded:(BOOL)a3
{
  self->_hasIsBundleResourceTypeInterenceTagIncluded = a3;
}

- (int)bundlEngagement
{
  return self->_bundlEngagement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePromptToneID, 0);
  objc_storeStrong((id *)&self->_metadataForRank, 0);
  objc_storeStrong((id *)&self->_outlierMetadata, 0);
  objc_storeStrong((id *)&self->_clusterMetadata, 0);
  objc_storeStrong((id *)&self->_photoTraits, 0);
  objc_storeStrong((id *)&self->_otherPlaces, 0);
  objc_storeStrong((id *)&self->_mainPlace, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_subSuggestionIDs, 0);
  objc_storeStrong((id *)&self->_subBundleIDs, 0);
  objc_storeStrong((id *)&self->_gaPRArray, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientActivityEventClientIdentifier, 0);
  objc_storeStrong((id *)&self->_appEntryEventClientIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionViewContainerName, 0);
  objc_storeStrong((id *)&self->_suggestionClientIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundActions, 0);
  objc_storeStrong((id *)&self->_bundleActionType, 0);
  objc_storeStrong((id *)&self->_bundleEventIDs, 0);
  objc_storeStrong((id *)&self->_bundlePromptLanguageFormat, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMMomentsEventDataEventBundle initByReadFrom:]([BMMomentsEventDataEventBundle alloc], "initByReadFrom:", v7);
    v4[57] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v83;
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
  _QWORD v95[93];

  v95[91] = *MEMORY[0x1E0C80C00];
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleIdentifier"), 2, 0, 1, 13, 0);
  v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleStartDate"), 3, 0, 2, 0, 2);
  v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleEndDate"), 3, 0, 3, 0, 2);
  v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleCreationDate"), 3, 0, 4, 0, 2);
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleExpirationDate"), 3, 0, 5, 0, 2);
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleInterfaceType"), 0, 0, 6, 4, 0);
  v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourceHealthExists"), 0, 0, 7, 12, 0);
  v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourcePhotoExists"), 0, 0, 8, 12, 0);
  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourceProactiveExists"), 0, 0, 9, 12, 0);
  v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourceRoutineExists"), 0, 0, 10, 12, 0);
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundlePromptLanguageFormat"), 2, 0, 11, 13, 0);
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundlePromptToneID"), 2, 0, 12, 13, 0);
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundlePromptParametersAvailability"), 0, 0, 13, 12, 0);
  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundlePlaceType"), 0, 0, 14, 4, 0);
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundlePlaceUserType"), 0, 0, 15, 4, 0);
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleBaseEventCateory"), 0, 0, 16, 4, 0);
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bundleEventIDs_json"), 5, 1, &__block_literal_global_2949);
  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bundleActionType_json"), 5, 1, &__block_literal_global_2950);
  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("backgroundActions_json"), 5, 1, &__block_literal_global_2951);
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleIsFamilyIncluded"), 0, 0, 20, 12, 0);
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleTimeTag"), 0, 0, 21, 4, 0);
  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBundleResourceTypeUnknown"), 0, 0, 22, 12, 0);
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBundleResourceTypeValueIncluded"), 0, 0, 23, 12, 0);
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBundleResourceTypePhotoAssetsIncluded"), 0, 0, 24, 12, 0);
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBundleResourceTypeMediaIncluded"), 0, 0, 25, 12, 0);
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBundleResourceTypeWebLinkIncluded"), 0, 0, 26, 12, 0);
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBundleResourceTypeInterenceTagIncluded"), 0, 0, 27, 12, 0);
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundlEngagement"), 0, 0, 28, 4, 0);
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleVersion"), 1, 0, 29, 0, 0);
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rankingVersion"), 1, 0, 30, 0, 0);
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionType"), 0, 0, 31, 4, 0);
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionTimestamp"), 3, 0, 32, 0, 2);
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionClientIdentifier"), 2, 0, 33, 13, 0);
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionViewContainerName"), 2, 0, 34, 13, 0);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionViewVisibleTime"), 1, 0, 35, 1, 0);
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventType"), 0, 0, 36, 4, 0);
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventClientIdentifier"), 2, 0, 37, 13, 0);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventTimestamp"), 3, 0, 38, 0, 2);
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventStartTime"), 3, 0, 39, 0, 2);
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventEndTime"), 3, 0, 40, 0, 2);
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventTotalCharacters"), 0, 0, 41, 2, 0);
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEventAddedCharacters"), 0, 0, 42, 2, 0);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientActivityEventType"), 0, 0, 43, 4, 0);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientActivityEventClientIdentifier"), 2, 0, 44, 13, 0);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientActivityEventTimestamp"), 3, 0, 45, 0, 2);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionIdentifier"), 2, 0, 46, 13, 0);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoSourceType"), 0, 0, 47, 4, 0);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photoLibraryType"), 0, 0, 48, 4, 0);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourcePostAnalyticsExists"), 0, 0, 49, 12, 0);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourcePDExists"), 0, 0, 50, 12, 0);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourceMotionExists"), 0, 0, 51, 12, 0);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourceBooksExists"), 0, 0, 52, 12, 0);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSourceScreenTimeExists"), 0, 0, 53, 12, 0);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("gaPRArray_json"), 5, 1, &__block_literal_global_2952);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundlePCount"), 0, 0, 55, 2, 0);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ranking"), 0, 0, 56, 4, 0);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("labelConfidenceScore"), 0, 0, 57, 4, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeCorrelationScore"), 0, 0, 58, 4, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("callDuration"), 0, 0, 59, 4, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionCount"), 0, 0, 60, 4, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionType"), 0, 0, 61, 4, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("callPlace"), 0, 0, 62, 4, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceFromHome"), 0, 0, 63, 4, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("homeAvailability"), 0, 0, 64, 4, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("workAvailability"), 0, 0, 65, 4, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleVisitMapItemSource"), 0, 0, 66, 4, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleVisitPlaceType"), 0, 0, 67, 4, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleVisitPlaceLabelGranularity"), 0, 0, 68, 4, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleIncludesAnomalousEvent"), 0, 0, 69, 4, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFiltered"), 0, 0, 70, 12, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSuperType"), 0, 0, 71, 4, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleSubType"), 0, 0, 72, 4, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAggregatedAndSuppressed"), 0, 0, 73, 12, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("summarizationGranularity"), 0, 0, 74, 4, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("includedInSummaryBundleOnly"), 0, 0, 75, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("subBundleIDs_json"), 5, 1, &__block_literal_global_2953);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("subSuggestionIDs_json"), 5, 1, &__block_literal_global_2954);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firstCreationDate"), 3, 0, 78, 0, 2);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("resources_json"), 5, 1, &__block_literal_global_2955);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("persons_json"), 5, 1, &__block_literal_global_2956);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("mainPlace_json"), 5, 1, &__block_literal_global_2957);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("otherPlaces_json"), 5, 1, &__block_literal_global_2958);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("photoTraits_json"), 5, 1, &__block_literal_global_2959);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("clusterMetadata_json"), 5, 1, &__block_literal_global_2960);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("outlierMetadata_json"), 5, 1, &__block_literal_global_2961);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleGoodnessScore"), 1, 0, 86, 0, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distinctnessScore"), 1, 0, 87, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("richnessScore"), 1, 0, 88, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("engagementScore"), 1, 0, 89, 0, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("heuristicsScore"), 1, 0, 90, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("metadataForRank_json"), 5, 1, &__block_literal_global_2962);
  v95[0] = v94;
  v95[1] = v93;
  v95[2] = v92;
  v95[3] = v91;
  v95[4] = v90;
  v95[5] = v89;
  v95[6] = v88;
  v95[7] = v87;
  v95[8] = v86;
  v95[9] = v85;
  v95[10] = v84;
  v95[11] = v83;
  v95[12] = v82;
  v95[13] = v81;
  v95[14] = v80;
  v95[15] = v79;
  v95[16] = v78;
  v95[17] = v77;
  v95[18] = v76;
  v95[19] = v75;
  v95[20] = v74;
  v95[21] = v73;
  v95[22] = v72;
  v95[23] = v71;
  v95[24] = v70;
  v95[25] = v69;
  v95[26] = v68;
  v95[27] = v67;
  v95[28] = v66;
  v95[29] = v65;
  v95[30] = v64;
  v95[31] = v63;
  v95[32] = v62;
  v95[33] = v61;
  v95[34] = v58;
  v95[35] = v60;
  v95[36] = v59;
  v95[37] = v57;
  v95[38] = v56;
  v95[39] = v55;
  v95[40] = v54;
  v95[41] = v53;
  v95[42] = v52;
  v95[43] = v51;
  v95[44] = v50;
  v95[45] = v49;
  v95[46] = v48;
  v95[47] = v47;
  v95[48] = v46;
  v95[49] = v45;
  v95[50] = v44;
  v95[51] = v43;
  v95[52] = v42;
  v95[53] = v41;
  v95[54] = v40;
  v95[55] = v39;
  v95[56] = v38;
  v95[57] = v37;
  v95[58] = v36;
  v95[59] = v35;
  v95[60] = v34;
  v95[61] = v33;
  v95[62] = v32;
  v95[63] = v31;
  v95[64] = v30;
  v95[65] = v29;
  v95[66] = v28;
  v95[67] = v27;
  v95[68] = v26;
  v95[69] = v25;
  v95[70] = v24;
  v95[71] = v23;
  v95[72] = v22;
  v95[73] = v21;
  v95[74] = v20;
  v95[75] = v19;
  v95[76] = v18;
  v95[77] = v17;
  v95[78] = v16;
  v95[79] = v15;
  v95[80] = v14;
  v95[81] = v13;
  v95[82] = v2;
  v95[83] = v3;
  v95[84] = v12;
  v95[85] = v4;
  v95[86] = v11;
  v95[87] = v5;
  v95[88] = v6;
  v95[89] = v10;
  v95[90] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 91);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A788;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v83;
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
  _QWORD v95[93];

  v95[91] = *MEMORY[0x1E0C80C00];
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleIdentifier"), 1, 13, 0);
  v95[0] = v94;
  v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleStartDate"), 2, 0, 0);
  v95[1] = v93;
  v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleEndDate"), 3, 0, 0);
  v95[2] = v92;
  v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleCreationDate"), 4, 0, 0);
  v95[3] = v91;
  v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleExpirationDate"), 5, 0, 0);
  v95[4] = v90;
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleInterfaceType"), 6, 4, 0);
  v95[5] = v89;
  v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourceHealthExists"), 7, 12, 0);
  v95[6] = v88;
  v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourcePhotoExists"), 8, 12, 0);
  v95[7] = v87;
  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourceProactiveExists"), 9, 12, 0);
  v95[8] = v86;
  v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourceRoutineExists"), 10, 12, 0);
  v95[9] = v85;
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundlePromptLanguageFormat"), 11, 13, 0);
  v95[10] = v84;
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundlePromptToneID"), 12, 13, 0);
  v95[11] = v83;
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundlePromptParametersAvailability"), 13, 12, 0);
  v95[12] = v82;
  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundlePlaceType"), 14, 4, 0);
  v95[13] = v81;
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundlePlaceUserType"), 15, 4, 0);
  v95[14] = v80;
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleBaseEventCateory"), 16, 4, 0);
  v95[15] = v79;
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleEventIDs"), 17, 13, 0);
  v95[16] = v78;
  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleActionType"), 18, 14, objc_opt_class());
  v95[17] = v77;
  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("backgroundActions"), 19, 14, objc_opt_class());
  v95[18] = v76;
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleIsFamilyIncluded"), 20, 12, 0);
  v95[19] = v75;
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleTimeTag"), 21, 4, 0);
  v95[20] = v74;
  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBundleResourceTypeUnknown"), 22, 12, 0);
  v95[21] = v73;
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBundleResourceTypeValueIncluded"), 23, 12, 0);
  v95[22] = v72;
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBundleResourceTypePhotoAssetsIncluded"), 24, 12, 0);
  v95[23] = v71;
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBundleResourceTypeMediaIncluded"), 25, 12, 0);
  v95[24] = v70;
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBundleResourceTypeWebLinkIncluded"), 26, 12, 0);
  v95[25] = v69;
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBundleResourceTypeInterenceTagIncluded"), 27, 12, 0);
  v95[26] = v68;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundlEngagement"), 28, 4, 0);
  v95[27] = v67;
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleVersion"), 29, 0, 0);
  v95[28] = v66;
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rankingVersion"), 30, 0, 0);
  v95[29] = v65;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionType"), 31, 4, 0);
  v95[30] = v64;
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionTimestamp"), 32, 0, 0);
  v95[31] = v63;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionClientIdentifier"), 33, 13, 0);
  v95[32] = v62;
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionViewContainerName"), 34, 13, 0);
  v95[33] = v61;
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionViewVisibleTime"), 35, 1, 0);
  v95[34] = v60;
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventType"), 36, 4, 0);
  v95[35] = v59;
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventClientIdentifier"), 37, 13, 0);
  v95[36] = v58;
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventTimestamp"), 38, 0, 0);
  v95[37] = v57;
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventStartTime"), 39, 0, 0);
  v95[38] = v56;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventEndTime"), 40, 0, 0);
  v95[39] = v55;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventTotalCharacters"), 41, 2, 0);
  v95[40] = v54;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEventAddedCharacters"), 42, 2, 0);
  v95[41] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientActivityEventType"), 43, 4, 0);
  v95[42] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientActivityEventClientIdentifier"), 44, 13, 0);
  v95[43] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientActivityEventTimestamp"), 45, 0, 0);
  v95[44] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionIdentifier"), 46, 13, 0);
  v95[45] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoSourceType"), 47, 4, 0);
  v95[46] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoLibraryType"), 48, 4, 0);
  v95[47] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourcePostAnalyticsExists"), 49, 12, 0);
  v95[48] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourcePDExists"), 50, 12, 0);
  v95[49] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourceMotionExists"), 51, 12, 0);
  v95[50] = v44;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourceBooksExists"), 52, 12, 0);
  v95[51] = v43;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSourceScreenTimeExists"), 53, 12, 0);
  v95[52] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("gaPRArray"), 54, 14, objc_opt_class());
  v95[53] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundlePCount"), 55, 2, 0);
  v95[54] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ranking"), 56, 4, 0);
  v95[55] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("labelConfidenceScore"), 57, 4, 0);
  v95[56] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeCorrelationScore"), 58, 4, 0);
  v95[57] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("callDuration"), 59, 4, 0);
  v95[58] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionCount"), 60, 4, 0);
  v95[59] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionType"), 61, 4, 0);
  v95[60] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("callPlace"), 62, 4, 0);
  v95[61] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceFromHome"), 63, 4, 0);
  v95[62] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeAvailability"), 64, 4, 0);
  v95[63] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("workAvailability"), 65, 4, 0);
  v95[64] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleVisitMapItemSource"), 66, 4, 0);
  v95[65] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleVisitPlaceType"), 67, 4, 0);
  v95[66] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleVisitPlaceLabelGranularity"), 68, 4, 0);
  v95[67] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleIncludesAnomalousEvent"), 69, 4, 0);
  v95[68] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFiltered"), 70, 12, 0);
  v95[69] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSuperType"), 71, 4, 0);
  v95[70] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleSubType"), 72, 4, 0);
  v95[71] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAggregatedAndSuppressed"), 73, 12, 0);
  v95[72] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("summarizationGranularity"), 74, 4, 0);
  v95[73] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("includedInSummaryBundleOnly"), 75, 12, 0);
  v95[74] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subBundleIDs"), 76, 13, 0);
  v95[75] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subSuggestionIDs"), 77, 13, 0);
  v95[76] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firstCreationDate"), 78, 0, 0);
  v95[77] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resources"), 79, 14, objc_opt_class());
  v95[78] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("persons"), 80, 14, objc_opt_class());
  v95[79] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mainPlace"), 81, 14, objc_opt_class());
  v95[80] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("otherPlaces"), 82, 14, objc_opt_class());
  v95[81] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photoTraits"), 83, 13, 0);
  v95[82] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clusterMetadata"), 84, 14, objc_opt_class());
  v95[83] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outlierMetadata"), 85, 14, objc_opt_class());
  v95[84] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleGoodnessScore"), 86, 0, 0);
  v95[85] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distinctnessScore"), 87, 0, 0);
  v95[86] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("richnessScore"), 88, 0, 0);
  v95[87] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("engagementScore"), 89, 0, 0);
  v95[88] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("heuristicsScore"), 90, 0, 0);
  v95[89] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("metadataForRank"), 91, 14, objc_opt_class());
  v95[90] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 91);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataForRank");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outlierMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clusterMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_photoTraitsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_otherPlacesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainPlace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_personsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resourcesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_subSuggestionIDsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_subBundleIDsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gaPRArrayJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_backgroundActionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleActionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__BMMomentsEventDataEventBundle_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bundleEventIDsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundle)initWithBundleIdentifier:(id)a3 bundleStartDate:(id)a4 bundleEndDate:(id)a5 bundleCreationDate:(id)a6 bundleExpirationDate:(id)a7 bundleInterfaceType:(int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(id)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(id)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(id)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(int)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(int)a18 bundleEventIDs:(id)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(id)a22 bundleTimeTag:(int)a23 isBundleResourceTypeUnknown:(id)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(id)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(id)a29 bundlEngagement:(int)a30 bundleVersion:(id)a31 rankingVersion:(id)a32
{
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  LODWORD(v38) = 0;
  LODWORD(v37) = 0;
  LODWORD(v36) = 0;
  LODWORD(v35) = a30;
  LODWORD(v34) = a23;
  LODWORD(v33) = a18;
  return -[BMMomentsEventDataEventBundle initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:](self, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:", a3, a4, a5,
           a6,
           a7,
           *(_QWORD *)&a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           *(_QWORD *)&a16,
           v33,
           a19,
           a20,
           a21,
           a22,
           v34,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           v35,
           a31,
           a32,
           v36,
           0,
           0,
           0,
           0,
           v37,
           0,
           0,
           0,
           0,
           0,
           0,
           v38,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E0C9AA60],
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (uint64_t)initWithBundleIdentifier:(uint64_t)a3 bundleStartDate:(uint64_t)a4 bundleEndDate:(uint64_t)a5 bundleCreationDate:(uint64_t)a6 bundleExpirationDate:(uint64_t)a7 bundleInterfaceType:(unsigned int)a8 bundleSourceHealthExists:(id)a9 bundleSourcePhotoExists:(uint64_t)a10 bundleSourceProactiveExists:(id)a11 bundleSourceRoutineExists:(uint64_t)a12 bundlePromptLanguageFormat:(id)a13 bundlePromptToneID:(uint64_t)a14 bundlePromptParametersAvailability:(id)a15 bundlePlaceType:(uint64_t)a16 bundlePlaceUserType:(int)a17 bundleBaseEventCateory:(id)a18 bundleEventIDs:(uint64_t)a19 bundleActionType:(id)a20 backgroundActions:(id)a21 bundleIsFamilyIncluded:(int)a22 bundleTimeTag:(id)a23 isBundleResourceTypeUnknown:(uint64_t)a24 isBundleResourceTypeValueIncluded:(id)a25 isBundleResourceTypePhotoAssetsIncluded:(uint64_t)a26 isBundleResourceTypeMediaIncluded:(id)a27 isBundleResourceTypeWebLinkIncluded:(id)a28 isBundleResourceTypeInterenceTagIncluded:(int)a29 bundlEngagement:(id)a30 bundleVersion:(id)a31 rankingVersion:(int)a32 suggestionType:(id)a33 suggestionTimestamp:(uint64_t)a34 suggestionClientIdentifier:(id)a35 suggestionViewContainerName:(id)a36 suggestionViewVisibleTime:(int)a37 appEntryEventType:(id)a38 appEntryEventClientIdentifier:(uint64_t)a39 appEntryEventTimestamp:(uint64_t)a40 appEntryEventStartTime:(uint64_t)a41 appEntryEventEndTime:(id)a42 appEntryEventTotalCharacters:(id)a43 appEntryEventAddedCharacters:(int)a44 clientActivityEventType:(id)a45 clientActivityEventClientIdentifier:(uint64_t)a46 clientActivityEventTimestamp:(id)a47 suggestionIdentifier:(uint64_t)a48 photoSourceType:(id)a49 photoLibraryType:(uint64_t)a50 bundleSourcePostAnalyticsExists:(id)a51 bundleSourcePDExists:(uint64_t)a52 bundleSourceMotionExists:(id)a53 bundleSourceBooksExists:(uint64_t)a54 bundleSourceScreenTimeExists:(id)a55 gaPRArray:(uint64_t)a56 bundlePCount:(uint64_t)a57 ranking:(uint64_t)a58 labelConfidenceScore:(uint64_t)a59 timeCorrelationScore:(uint64_t)a60 callDuration:(uint64_t)a61 interactionCount:(uint64_t)a62 interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:
{
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  unsigned int v86;

  v86 = a8;
  v85 = a7;
  LODWORD(v68) = a44;
  LODWORD(v67) = a37;
  LODWORD(v66) = a32;
  LODWORD(v65) = a29;
  LODWORD(v64) = a22;
  LODWORD(v63) = a17;
  v80 = MEMORY[0x1E0C9AA60];
  v79 = MEMORY[0x1E0C9AA60];
  v76 = MEMORY[0x1E0C9AA60];
  v77 = MEMORY[0x1E0C9AA60];
  v73 = MEMORY[0x1E0C9AA60];
  v74 = MEMORY[0x1E0C9AA60];
  v75 = 0;
  v78 = 0;
  v72 = 0;
  v71 = 0;
  v70 = 0;
  v69 = 0u;
  v84 = 0u;
  v83 = 0u;
  v82 = 0u;
  v81 = 0u;
  return objc_msgSend(a1, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:",
           a3,
           a4,
           a5,
           a6,
           a7,
           a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           v63,
           a18,
           a19,
           a20,
           a21,
           v64,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           v65,
           a30,
           a31,
           v66,
           a33,
           a34,
           a35,
           a36,
           v67,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           v68,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           0);
}

@end
