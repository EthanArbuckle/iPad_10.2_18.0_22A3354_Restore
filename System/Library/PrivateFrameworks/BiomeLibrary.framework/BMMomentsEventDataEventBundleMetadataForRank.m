@implementation BMMomentsEventDataEventBundleMetadataForRank

- (BMMomentsEventDataEventBundleMetadataForRank)initWithDailyAggregateCallDuration:(id)a3 callDuration:(id)a4 burstyInteractionCount:(id)a5 burstyOutgoingInteractionCount:(id)a6 multipleInteractionTypes:(id)a7 contactLocationWork:(id)a8 isFamilyContact:(id)a9 isCoworkerContact:(id)a10 isRepetitiveContact:(id)a11 isGroupConversation:(id)a12 peopleCountWeightedSum:(id)a13 peopleCountWeightedAverage:(id)a14 peopleCountMax:(id)a15 peopleDensityWeightedSum:(id)a16 peopleDensityWeightedAverage:(id)a17 peopleDensityMax:(id)a18 peopleDensityWeightedConfidenceSum:(id)a19 peopleDensityWeightedConfidenceAverage:(id)a20 mediaTotalPlayTime:(id)a21 mediaLength:(id)a22 mediaActionIsRepeat:(id)a23 timeAtHomeDuration:(id)a24 photosAtHomeCurationScore:(id)a25 workoutDuration:(id)a26 motionActivityWalkSpan:(id)a27 visitDuration:(id)a28 poiCategoryInterestingness:(id)a29 familiarityIndex:(id)a30 stateOfMindDomains:(id)a31 stateOfMindLabels:(id)a32 stateOfMindReflectiveIntervals:(id)a33 stateOfMindValenceClassifications:(id)a34 stateOfMindValenceValues:(id)a35 stateOfMindLoggedIn3pApp:(id)a36 stateOfMindLoggedInJournalApp:(id)a37
{
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  BMMomentsEventDataEventBundleMetadataForRank *v51;
  float v52;
  double v53;
  float v54;
  double v55;
  int v56;
  int v57;
  float v58;
  double v59;
  float v60;
  double v61;
  float v62;
  double v63;
  float v64;
  double v65;
  float v66;
  double v67;
  float v68;
  double v69;
  float v70;
  double v71;
  float v72;
  double v73;
  float v74;
  double v75;
  float v76;
  double v77;
  float v78;
  double v79;
  float v80;
  double v81;
  float v82;
  double v83;
  float v84;
  double v85;
  float v86;
  double v87;
  float v88;
  double v89;
  float v90;
  double v91;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  objc_super v120;

  v119 = a3;
  v118 = a4;
  v117 = a5;
  v116 = a6;
  v115 = a7;
  v114 = a8;
  v113 = a9;
  v112 = a10;
  v111 = a11;
  v110 = a12;
  v42 = a13;
  v43 = a14;
  v44 = a15;
  v45 = a16;
  v46 = a17;
  v47 = a18;
  v48 = a19;
  v49 = a20;
  v109 = a21;
  v108 = a22;
  v107 = a23;
  v106 = a24;
  v105 = a25;
  v104 = a26;
  v103 = a27;
  v102 = a28;
  v101 = a29;
  v100 = a30;
  v98 = a31;
  v97 = a32;
  v96 = a33;
  v95 = a34;
  v94 = a35;
  v99 = a36;
  v50 = a37;
  v120.receiver = self;
  v120.super_class = (Class)BMMomentsEventDataEventBundleMetadataForRank;
  v51 = -[BMEventBase init](&v120, sel_init);
  if (v51)
  {
    v51->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v119)
    {
      v51->_hasDailyAggregateCallDuration = 1;
      objc_msgSend(v119, "floatValue");
      v53 = v52;
    }
    else
    {
      v51->_hasDailyAggregateCallDuration = 0;
      v53 = -1.0;
    }
    v51->_dailyAggregateCallDuration = v53;
    if (v118)
    {
      v51->_hasCallDuration = 1;
      objc_msgSend(v118, "floatValue");
      v55 = v54;
    }
    else
    {
      v51->_hasCallDuration = 0;
      v55 = -1.0;
    }
    v51->_callDuration = v55;
    if (v117)
    {
      v51->_hasBurstyInteractionCount = 1;
      v56 = objc_msgSend(v117, "intValue");
    }
    else
    {
      v51->_hasBurstyInteractionCount = 0;
      v56 = -1;
    }
    v51->_burstyInteractionCount = v56;
    if (v116)
    {
      v51->_hasBurstyOutgoingInteractionCount = 1;
      v57 = objc_msgSend(v116, "intValue");
    }
    else
    {
      v51->_hasBurstyOutgoingInteractionCount = 0;
      v57 = -1;
    }
    v51->_burstyOutgoingInteractionCount = v57;
    if (v115)
    {
      v51->_hasMultipleInteractionTypes = 1;
      v51->_multipleInteractionTypes = objc_msgSend(v115, "BOOLValue");
    }
    else
    {
      v51->_hasMultipleInteractionTypes = 0;
      v51->_multipleInteractionTypes = 0;
    }
    if (v114)
    {
      v51->_hasContactLocationWork = 1;
      v51->_contactLocationWork = objc_msgSend(v114, "BOOLValue");
    }
    else
    {
      v51->_hasContactLocationWork = 0;
      v51->_contactLocationWork = 0;
    }
    if (v113)
    {
      v51->_hasIsFamilyContact = 1;
      v51->_isFamilyContact = objc_msgSend(v113, "BOOLValue");
    }
    else
    {
      v51->_hasIsFamilyContact = 0;
      v51->_isFamilyContact = 0;
    }
    if (v112)
    {
      v51->_hasIsCoworkerContact = 1;
      v51->_isCoworkerContact = objc_msgSend(v112, "BOOLValue");
    }
    else
    {
      v51->_hasIsCoworkerContact = 0;
      v51->_isCoworkerContact = 0;
    }
    if (v111)
    {
      v51->_hasIsRepetitiveContact = 1;
      v51->_isRepetitiveContact = objc_msgSend(v111, "BOOLValue");
    }
    else
    {
      v51->_hasIsRepetitiveContact = 0;
      v51->_isRepetitiveContact = 0;
    }
    if (v110)
    {
      v51->_hasIsGroupConversation = 1;
      v51->_isGroupConversation = objc_msgSend(v110, "BOOLValue");
    }
    else
    {
      v51->_hasIsGroupConversation = 0;
      v51->_isGroupConversation = 0;
    }
    if (v42)
    {
      v51->_hasPeopleCountWeightedSum = 1;
      objc_msgSend(v42, "floatValue");
      v59 = v58;
    }
    else
    {
      v51->_hasPeopleCountWeightedSum = 0;
      v59 = -1.0;
    }
    v51->_peopleCountWeightedSum = v59;
    if (v43)
    {
      v51->_hasPeopleCountWeightedAverage = 1;
      objc_msgSend(v43, "floatValue");
      v61 = v60;
    }
    else
    {
      v51->_hasPeopleCountWeightedAverage = 0;
      v61 = -1.0;
    }
    v51->_peopleCountWeightedAverage = v61;
    if (v44)
    {
      v51->_hasPeopleCountMax = 1;
      objc_msgSend(v44, "floatValue");
      v63 = v62;
    }
    else
    {
      v51->_hasPeopleCountMax = 0;
      v63 = -1.0;
    }
    v51->_peopleCountMax = v63;
    if (v45)
    {
      v51->_hasPeopleDensityWeightedSum = 1;
      objc_msgSend(v45, "floatValue");
      v65 = v64;
    }
    else
    {
      v51->_hasPeopleDensityWeightedSum = 0;
      v65 = -1.0;
    }
    v51->_peopleDensityWeightedSum = v65;
    if (v46)
    {
      v51->_hasPeopleDensityWeightedAverage = 1;
      objc_msgSend(v46, "floatValue");
      v67 = v66;
    }
    else
    {
      v51->_hasPeopleDensityWeightedAverage = 0;
      v67 = -1.0;
    }
    v51->_peopleDensityWeightedAverage = v67;
    if (v47)
    {
      v51->_hasPeopleDensityMax = 1;
      objc_msgSend(v47, "floatValue");
      v69 = v68;
    }
    else
    {
      v51->_hasPeopleDensityMax = 0;
      v69 = -1.0;
    }
    v51->_peopleDensityMax = v69;
    if (v48)
    {
      v51->_hasPeopleDensityWeightedConfidenceSum = 1;
      objc_msgSend(v48, "floatValue");
      v71 = v70;
    }
    else
    {
      v51->_hasPeopleDensityWeightedConfidenceSum = 0;
      v71 = -1.0;
    }
    v51->_peopleDensityWeightedConfidenceSum = v71;
    if (v49)
    {
      v51->_hasPeopleDensityWeightedConfidenceAverage = 1;
      objc_msgSend(v49, "floatValue");
      v73 = v72;
    }
    else
    {
      v51->_hasPeopleDensityWeightedConfidenceAverage = 0;
      v73 = -1.0;
    }
    v51->_peopleDensityWeightedConfidenceAverage = v73;
    if (v109)
    {
      v51->_hasMediaTotalPlayTime = 1;
      objc_msgSend(v109, "floatValue");
      v75 = v74;
    }
    else
    {
      v51->_hasMediaTotalPlayTime = 0;
      v75 = -1.0;
    }
    v51->_mediaTotalPlayTime = v75;
    if (v108)
    {
      v51->_hasMediaLength = 1;
      objc_msgSend(v108, "floatValue");
      v77 = v76;
    }
    else
    {
      v51->_hasMediaLength = 0;
      v77 = -1.0;
    }
    v51->_mediaLength = v77;
    if (v107)
    {
      v51->_hasMediaActionIsRepeat = 1;
      v51->_mediaActionIsRepeat = objc_msgSend(v107, "BOOLValue");
    }
    else
    {
      v51->_hasMediaActionIsRepeat = 0;
      v51->_mediaActionIsRepeat = 0;
    }
    if (v106)
    {
      v51->_hasTimeAtHomeDuration = 1;
      objc_msgSend(v106, "floatValue");
      v79 = v78;
    }
    else
    {
      v51->_hasTimeAtHomeDuration = 0;
      v79 = -1.0;
    }
    v51->_timeAtHomeDuration = v79;
    if (v105)
    {
      v51->_hasPhotosAtHomeCurationScore = 1;
      objc_msgSend(v105, "floatValue");
      v81 = v80;
    }
    else
    {
      v51->_hasPhotosAtHomeCurationScore = 0;
      v81 = -1.0;
    }
    v51->_photosAtHomeCurationScore = v81;
    if (v104)
    {
      v51->_hasWorkoutDuration = 1;
      objc_msgSend(v104, "floatValue");
      v83 = v82;
    }
    else
    {
      v51->_hasWorkoutDuration = 0;
      v83 = -1.0;
    }
    v51->_workoutDuration = v83;
    if (v103)
    {
      v51->_hasMotionActivityWalkSpan = 1;
      objc_msgSend(v103, "floatValue");
      v85 = v84;
    }
    else
    {
      v51->_hasMotionActivityWalkSpan = 0;
      v85 = -1.0;
    }
    v51->_motionActivityWalkSpan = v85;
    if (v102)
    {
      v51->_hasVisitDuration = 1;
      objc_msgSend(v102, "floatValue");
      v87 = v86;
    }
    else
    {
      v51->_hasVisitDuration = 0;
      v87 = -1.0;
    }
    v51->_visitDuration = v87;
    if (v101)
    {
      v51->_hasPoiCategoryInterestingness = 1;
      objc_msgSend(v101, "floatValue");
      v89 = v88;
    }
    else
    {
      v51->_hasPoiCategoryInterestingness = 0;
      v89 = -1.0;
    }
    v51->_poiCategoryInterestingness = v89;
    if (v100)
    {
      v51->_hasFamiliarityIndex = 1;
      objc_msgSend(v100, "floatValue");
      v91 = v90;
    }
    else
    {
      v51->_hasFamiliarityIndex = 0;
      v91 = -1.0;
    }
    v51->_familiarityIndex = v91;
    objc_storeStrong((id *)&v51->_stateOfMindDomains, a31);
    objc_storeStrong((id *)&v51->_stateOfMindLabels, a32);
    objc_storeStrong((id *)&v51->_stateOfMindReflectiveIntervals, a33);
    objc_storeStrong((id *)&v51->_stateOfMindValenceClassifications, a34);
    objc_storeStrong((id *)&v51->_stateOfMindValenceValues, a35);
    if (v99)
    {
      v51->_hasStateOfMindLoggedIn3pApp = 1;
      v51->_stateOfMindLoggedIn3pApp = objc_msgSend(v99, "BOOLValue");
    }
    else
    {
      v51->_hasStateOfMindLoggedIn3pApp = 0;
      v51->_stateOfMindLoggedIn3pApp = 0;
    }
    if (v50)
    {
      v51->_hasStateOfMindLoggedInJournalApp = 1;
      v51->_stateOfMindLoggedInJournalApp = objc_msgSend(v50, "BOOLValue");
    }
    else
    {
      v51->_hasStateOfMindLoggedInJournalApp = 0;
      v51->_stateOfMindLoggedInJournalApp = 0;
    }
  }

  return v51;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  BMMomentsEventDataEventBundleMetadataForRank *v64;
  id v65;
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
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("["));
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindDomains](self, "stateOfMindDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v102;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v102 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v8);
        if (objc_msgSend(v3, "length") != 1)
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        BMMomentsEventDataStateOfMindDomainAsString(objc_msgSend(v9, "unsignedIntValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("]"));
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "appendString:", CFSTR("["));
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLabels](self, "stateOfMindLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v98;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v98 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v16);
        if (objc_msgSend(v11, "length") != 1)
          objc_msgSend(v11, "appendString:", CFSTR(", "));
        BMMomentsEventDataStateOfMindLabelAsString(objc_msgSend(v17, "unsignedIntValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendString:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "appendString:", CFSTR("]"));
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "appendString:", CFSTR("["));
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindReflectiveIntervals](self, "stateOfMindReflectiveIntervals");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v94;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v94 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v24);
        if (objc_msgSend(v19, "length") != 1)
          objc_msgSend(v19, "appendString:", CFSTR(", "));
        BMMomentsEventDataStateOfMindReflectiveIntervalAsString(objc_msgSend(v25, "unsignedIntValue"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendString:", v26);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
    }
    while (v22);
  }

  objc_msgSend(v19, "appendString:", CFSTR("]"));
  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "appendString:", CFSTR("["));
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v64 = self;
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceClassifications](self, "stateOfMindValenceClassifications");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v90;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v90 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v32);
        if (objc_msgSend(v27, "length") != 1)
          objc_msgSend(v27, "appendString:", CFSTR(", "));
        BMMomentsEventDataStateOfMindValenceClassificationAsString(objc_msgSend(v33, "unsignedIntValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "appendString:", v34);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
    }
    while (v30);
  }

  objc_msgSend(v27, "appendString:", CFSTR("]"));
  v63 = objc_alloc(MEMORY[0x1E0CB3940]);
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank dailyAggregateCallDuration](v64, "dailyAggregateCallDuration");
  objc_msgSend(v35, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank callDuration](v64, "callDuration");
  objc_msgSend(v36, "numberWithDouble:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyInteractionCount](v64, "burstyInteractionCount"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyOutgoingInteractionCount](v64, "burstyOutgoingInteractionCount"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank multipleInteractionTypes](v64, "multipleInteractionTypes"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank contactLocationWork](v64, "contactLocationWork"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isFamilyContact](v64, "isFamilyContact"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isCoworkerContact](v64, "isCoworkerContact"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isRepetitiveContact](v64, "isRepetitiveContact"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isGroupConversation](v64, "isGroupConversation"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedSum](v64, "peopleCountWeightedSum");
  objc_msgSend(v37, "numberWithDouble:");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedAverage](v64, "peopleCountWeightedAverage");
  objc_msgSend(v38, "numberWithDouble:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleCountMax](v64, "peopleCountMax");
  objc_msgSend(v39, "numberWithDouble:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedSum](v64, "peopleDensityWeightedSum");
  objc_msgSend(v40, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedAverage](v64, "peopleDensityWeightedAverage");
  objc_msgSend(v41, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityMax](v64, "peopleDensityMax");
  objc_msgSend(v42, "numberWithDouble:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceSum](v64, "peopleDensityWeightedConfidenceSum");
  objc_msgSend(v43, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceAverage](v64, "peopleDensityWeightedConfidenceAverage");
  objc_msgSend(v44, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank mediaTotalPlayTime](v64, "mediaTotalPlayTime");
  objc_msgSend(v45, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank mediaLength](v64, "mediaLength");
  objc_msgSend(v46, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank mediaActionIsRepeat](v64, "mediaActionIsRepeat"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank timeAtHomeDuration](v64, "timeAtHomeDuration");
  objc_msgSend(v47, "numberWithDouble:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank photosAtHomeCurationScore](v64, "photosAtHomeCurationScore");
  objc_msgSend(v48, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank workoutDuration](v64, "workoutDuration");
  objc_msgSend(v49, "numberWithDouble:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank motionActivityWalkSpan](v64, "motionActivityWalkSpan");
  objc_msgSend(v50, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank visitDuration](v64, "visitDuration");
  objc_msgSend(v51, "numberWithDouble:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank poiCategoryInterestingness](v64, "poiCategoryInterestingness");
  objc_msgSend(v52, "numberWithDouble:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleMetadataForRank familiarityIndex](v64, "familiarityIndex");
  objc_msgSend(v53, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceValues](v64, "stateOfMindValenceValues");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedIn3pApp](v64, "stateOfMindLoggedIn3pApp"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedInJournalApp](v64, "stateOfMindLoggedInJournalApp"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (id)objc_msgSend(v63, "initWithFormat:", CFSTR("BMMomentsEventDataEventBundleMetadataForRank with dailyAggregateCallDuration: %@, callDuration: %@, burstyInteractionCount: %@, burstyOutgoingInteractionCount: %@, multipleInteractionTypes: %@, contactLocationWork: %@, isFamilyContact: %@, isCoworkerContact: %@, isRepetitiveContact: %@, isGroupConversation: %@, peopleCountWeightedSum: %@, peopleCountWeightedAverage: %@, peopleCountMax: %@, peopleDensityWeightedSum: %@, peopleDensityWeightedAverage: %@, peopleDensityMax: %@, peopleDensityWeightedConfidenceSum: %@, peopleDensityWeightedConfidenceAverage: %@, mediaTotalPlayTime: %@, mediaLength: %@, mediaActionIsRepeat: %@, timeAtHomeDuration: %@, photosAtHomeCurationScore: %@, workoutDuration: %@, motionActivityWalkSpan: %@, visitDuration: %@, poiCategoryInterestingness: %@, familiarityIndex: %@, stateOfMindDomains: %@, stateOfMindLabels: %@, stateOfMindReflectiveIntervals: %@, stateOfMindValenceClassifications: %@, stateOfMindValenceValues: %@, stateOfMindLoggedIn3pApp: %@, stateOfMindLoggedInJournalApp: %@"), v87, v86, v88, v85, v84, v83, v82, v81, v80, v79, v78, v77, v76, v75, v74, v73,
              v72,
              v71,
              v70,
              v69,
              v68,
              v67,
              v62,
              v61,
              v60,
              v59,
              v66,
              v57,
              v3,
              v11,
              v19,
              v27,
              v58,
              v54,
              v55);

  return (NSString *)v65;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEventDataEventBundleMetadataForRank *v5;
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  uint64_t v21;
  int v22;
  uint64_t v24;
  unint64_t v25;
  float v26;
  uint64_t v27;
  unint64_t v28;
  float v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  uint64_t v85;
  unint64_t v86;
  float v87;
  uint64_t v88;
  unint64_t v89;
  float v90;
  uint64_t v91;
  unint64_t v92;
  float v93;
  uint64_t v94;
  unint64_t v95;
  float v96;
  uint64_t v97;
  unint64_t v98;
  float v99;
  uint64_t v100;
  unint64_t v101;
  float v102;
  uint64_t v103;
  unint64_t v104;
  float v105;
  uint64_t v106;
  unint64_t v107;
  float v108;
  uint64_t v109;
  unint64_t v110;
  float v111;
  uint64_t v112;
  unint64_t v113;
  float v114;
  char v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  uint64_t v122;
  unint64_t v123;
  float v124;
  uint64_t v125;
  unint64_t v126;
  float v127;
  uint64_t v128;
  unint64_t v129;
  float v130;
  uint64_t v131;
  unint64_t v132;
  float v133;
  uint64_t v134;
  unint64_t v135;
  float v136;
  uint64_t v137;
  unint64_t v138;
  float v139;
  uint64_t v140;
  unint64_t v141;
  float v142;
  char v143;
  unsigned int v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  char v150;
  char v151;
  unsigned int v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  char v158;
  char v159;
  unsigned int v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char v166;
  char v167;
  unsigned int v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  char v174;
  void *v175;
  uint64_t v176;
  unint64_t v177;
  double v178;
  char v179;
  unsigned int v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  char v185;
  char v186;
  unsigned int v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  char v192;
  uint64_t v193;
  BOOL v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  void *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  double v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  NSArray *stateOfMindDomains;
  uint64_t v211;
  NSArray *stateOfMindLabels;
  uint64_t v213;
  NSArray *stateOfMindReflectiveIntervals;
  uint64_t v215;
  NSArray *stateOfMindValenceClassifications;
  uint64_t v217;
  NSArray *stateOfMindValenceValues;
  int v219;
  BMMomentsEventDataEventBundleMetadataForRank *v220;
  void *v222;
  id v223;
  void *v224;
  objc_super v225;

  v4 = a3;
  v225.receiver = self;
  v225.super_class = (Class)BMMomentsEventDataEventBundleMetadataForRank;
  v5 = -[BMEventBase init](&v225, sel_init);
  if (!v5)
  {
LABEL_311:
    v220 = v5;
    goto LABEL_312;
  }
  v224 = (void *)objc_opt_new();
  v222 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_309:
    v209 = objc_msgSend(v224, "copy", v222);
    stateOfMindDomains = v5->_stateOfMindDomains;
    v5->_stateOfMindDomains = (NSArray *)v209;

    v211 = objc_msgSend(v223, "copy");
    stateOfMindLabels = v5->_stateOfMindLabels;
    v5->_stateOfMindLabels = (NSArray *)v211;

    v213 = objc_msgSend(v6, "copy");
    stateOfMindReflectiveIntervals = v5->_stateOfMindReflectiveIntervals;
    v5->_stateOfMindReflectiveIntervals = (NSArray *)v213;

    v215 = objc_msgSend(v7, "copy");
    stateOfMindValenceClassifications = v5->_stateOfMindValenceClassifications;
    v5->_stateOfMindValenceClassifications = (NSArray *)v215;

    v217 = objc_msgSend(v8, "copy");
    stateOfMindValenceValues = v5->_stateOfMindValenceValues;
    v5->_stateOfMindValenceValues = (NSArray *)v217;

    v219 = v4[*v11];
    if (v219)
      goto LABEL_310;
    goto LABEL_311;
  }
  v12 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v11])
      goto LABEL_309;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v9;
      v17 = *(_QWORD *)&v4[v16];
      v18 = v17 + 1;
      if (v17 == -1 || v18 > *(_QWORD *)&v4[*v10])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
      *(_QWORD *)&v4[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0)
        goto LABEL_13;
      v13 += 7;
      v20 = v14++ >= 9;
      if (v20)
      {
        v15 = 0;
        v21 = *v11;
        v22 = v4[v21];
        goto LABEL_15;
      }
    }
    v4[*v11] = 1;
LABEL_13:
    v21 = *v11;
    v22 = v4[v21];
    if (v4[v21])
      v15 = 0;
LABEL_15:
    if (v22 || (v15 & 7) == 4)
      goto LABEL_309;
    switch((v15 >> 3))
    {
      case 1u:
        v5->_hasDailyAggregateCallDuration = 1;
        v24 = *v9;
        v25 = *(_QWORD *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v26 = *(float *)(*(_QWORD *)&v4[*v12] + v25);
          *(_QWORD *)&v4[v24] = v25 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v26 = 0.0;
        }
        v206 = v26;
        v207 = 72;
        goto LABEL_303;
      case 2u:
        v5->_hasCallDuration = 1;
        v27 = *v9;
        v28 = *(_QWORD *)&v4[v27];
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v29 = *(float *)(*(_QWORD *)&v4[*v12] + v28);
          *(_QWORD *)&v4[v27] = v28 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v29 = 0.0;
        }
        v206 = v29;
        v207 = 80;
        goto LABEL_303;
      case 3u:
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v5->_hasBurstyInteractionCount = 1;
        while (2)
        {
          v33 = *v9;
          v34 = *(_QWORD *)&v4[v33];
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v34);
            *(_QWORD *)&v4[v33] = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if (v36 < 0)
            {
              v30 += 7;
              v20 = v31++ >= 9;
              if (v20)
              {
                LODWORD(v32) = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          LODWORD(v32) = 0;
LABEL_190:
        v193 = 60;
        goto LABEL_195;
      case 4u:
        v37 = 0;
        v38 = 0;
        v32 = 0;
        v5->_hasBurstyOutgoingInteractionCount = 1;
        while (2)
        {
          v39 = *v9;
          v40 = *(_QWORD *)&v4[v39];
          v41 = v40 + 1;
          if (v40 == -1 || v41 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v42 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v40);
            *(_QWORD *)&v4[v39] = v41;
            v32 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              v20 = v38++ >= 9;
              if (v20)
              {
                LODWORD(v32) = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          LODWORD(v32) = 0;
LABEL_194:
        v193 = 64;
LABEL_195:
        *(_DWORD *)((char *)&v5->super.super.isa + v193) = v32;
        goto LABEL_308;
      case 5u:
        v43 = 0;
        v44 = 0;
        v45 = 0;
        v5->_hasMultipleInteractionTypes = 1;
        while (2)
        {
          v46 = *v9;
          v47 = *(_QWORD *)&v4[v46];
          v48 = v47 + 1;
          if (v47 == -1 || v48 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v47);
            *(_QWORD *)&v4[v46] = v48;
            v45 |= (unint64_t)(v49 & 0x7F) << v43;
            if (v49 < 0)
            {
              v43 += 7;
              v20 = v44++ >= 9;
              if (v20)
              {
                v45 = 0;
                goto LABEL_199;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v45 = 0;
LABEL_199:
        v194 = v45 != 0;
        v195 = 20;
        goto LABEL_264;
      case 6u:
        v50 = 0;
        v51 = 0;
        v52 = 0;
        v5->_hasContactLocationWork = 1;
        while (2)
        {
          v53 = *v9;
          v54 = *(_QWORD *)&v4[v53];
          v55 = v54 + 1;
          if (v54 == -1 || v55 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v56 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v54);
            *(_QWORD *)&v4[v53] = v55;
            v52 |= (unint64_t)(v56 & 0x7F) << v50;
            if (v56 < 0)
            {
              v50 += 7;
              v20 = v51++ >= 9;
              if (v20)
              {
                v52 = 0;
                goto LABEL_203;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v52 = 0;
LABEL_203:
        v194 = v52 != 0;
        v195 = 22;
        goto LABEL_264;
      case 7u:
        v57 = 0;
        v58 = 0;
        v59 = 0;
        v5->_hasIsFamilyContact = 1;
        while (2)
        {
          v60 = *v9;
          v61 = *(_QWORD *)&v4[v60];
          v62 = v61 + 1;
          if (v61 == -1 || v62 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v63 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v61);
            *(_QWORD *)&v4[v60] = v62;
            v59 |= (unint64_t)(v63 & 0x7F) << v57;
            if (v63 < 0)
            {
              v57 += 7;
              v20 = v58++ >= 9;
              if (v20)
              {
                v59 = 0;
                goto LABEL_207;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v59 = 0;
LABEL_207:
        v194 = v59 != 0;
        v195 = 24;
        goto LABEL_264;
      case 8u:
        v64 = 0;
        v65 = 0;
        v66 = 0;
        v5->_hasIsCoworkerContact = 1;
        while (2)
        {
          v67 = *v9;
          v68 = *(_QWORD *)&v4[v67];
          v69 = v68 + 1;
          if (v68 == -1 || v69 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v70 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v68);
            *(_QWORD *)&v4[v67] = v69;
            v66 |= (unint64_t)(v70 & 0x7F) << v64;
            if (v70 < 0)
            {
              v64 += 7;
              v20 = v65++ >= 9;
              if (v20)
              {
                v66 = 0;
                goto LABEL_211;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v66 = 0;
LABEL_211:
        v194 = v66 != 0;
        v195 = 26;
        goto LABEL_264;
      case 9u:
        v71 = 0;
        v72 = 0;
        v73 = 0;
        v5->_hasIsRepetitiveContact = 1;
        while (2)
        {
          v74 = *v9;
          v75 = *(_QWORD *)&v4[v74];
          v76 = v75 + 1;
          if (v75 == -1 || v76 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v77 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v75);
            *(_QWORD *)&v4[v74] = v76;
            v73 |= (unint64_t)(v77 & 0x7F) << v71;
            if (v77 < 0)
            {
              v71 += 7;
              v20 = v72++ >= 9;
              if (v20)
              {
                v73 = 0;
                goto LABEL_215;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v73 = 0;
LABEL_215:
        v194 = v73 != 0;
        v195 = 28;
        goto LABEL_264;
      case 0xAu:
        v78 = 0;
        v79 = 0;
        v80 = 0;
        v5->_hasIsGroupConversation = 1;
        while (2)
        {
          v81 = *v9;
          v82 = *(_QWORD *)&v4[v81];
          v83 = v82 + 1;
          if (v82 == -1 || v83 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v84 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v82);
            *(_QWORD *)&v4[v81] = v83;
            v80 |= (unint64_t)(v84 & 0x7F) << v78;
            if (v84 < 0)
            {
              v78 += 7;
              v20 = v79++ >= 9;
              if (v20)
              {
                v80 = 0;
                goto LABEL_219;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v80 = 0;
LABEL_219:
        v194 = v80 != 0;
        v195 = 30;
        goto LABEL_264;
      case 0xBu:
        v5->_hasPeopleCountWeightedSum = 1;
        v85 = *v9;
        v86 = *(_QWORD *)&v4[v85];
        if (v86 <= 0xFFFFFFFFFFFFFFFBLL && v86 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v87 = *(float *)(*(_QWORD *)&v4[*v12] + v86);
          *(_QWORD *)&v4[v85] = v86 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v87 = 0.0;
        }
        v206 = v87;
        v207 = 88;
        goto LABEL_303;
      case 0xCu:
        v5->_hasPeopleCountWeightedAverage = 1;
        v88 = *v9;
        v89 = *(_QWORD *)&v4[v88];
        if (v89 <= 0xFFFFFFFFFFFFFFFBLL && v89 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v90 = *(float *)(*(_QWORD *)&v4[*v12] + v89);
          *(_QWORD *)&v4[v88] = v89 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v90 = 0.0;
        }
        v206 = v90;
        v207 = 96;
        goto LABEL_303;
      case 0xDu:
        v5->_hasPeopleCountMax = 1;
        v91 = *v9;
        v92 = *(_QWORD *)&v4[v91];
        if (v92 <= 0xFFFFFFFFFFFFFFFBLL && v92 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v93 = *(float *)(*(_QWORD *)&v4[*v12] + v92);
          *(_QWORD *)&v4[v91] = v92 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v93 = 0.0;
        }
        v206 = v93;
        v207 = 104;
        goto LABEL_303;
      case 0xEu:
        v5->_hasPeopleDensityWeightedSum = 1;
        v94 = *v9;
        v95 = *(_QWORD *)&v4[v94];
        if (v95 <= 0xFFFFFFFFFFFFFFFBLL && v95 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v96 = *(float *)(*(_QWORD *)&v4[*v12] + v95);
          *(_QWORD *)&v4[v94] = v95 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v96 = 0.0;
        }
        v206 = v96;
        v207 = 112;
        goto LABEL_303;
      case 0xFu:
        v5->_hasPeopleDensityWeightedAverage = 1;
        v97 = *v9;
        v98 = *(_QWORD *)&v4[v97];
        if (v98 <= 0xFFFFFFFFFFFFFFFBLL && v98 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v99 = *(float *)(*(_QWORD *)&v4[*v12] + v98);
          *(_QWORD *)&v4[v97] = v98 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v99 = 0.0;
        }
        v206 = v99;
        v207 = 120;
        goto LABEL_303;
      case 0x10u:
        v5->_hasPeopleDensityMax = 1;
        v100 = *v9;
        v101 = *(_QWORD *)&v4[v100];
        if (v101 <= 0xFFFFFFFFFFFFFFFBLL && v101 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v102 = *(float *)(*(_QWORD *)&v4[*v12] + v101);
          *(_QWORD *)&v4[v100] = v101 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v102 = 0.0;
        }
        v206 = v102;
        v207 = 128;
        goto LABEL_303;
      case 0x11u:
        v5->_hasPeopleDensityWeightedConfidenceSum = 1;
        v103 = *v9;
        v104 = *(_QWORD *)&v4[v103];
        if (v104 <= 0xFFFFFFFFFFFFFFFBLL && v104 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v105 = *(float *)(*(_QWORD *)&v4[*v12] + v104);
          *(_QWORD *)&v4[v103] = v104 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v105 = 0.0;
        }
        v206 = v105;
        v207 = 136;
        goto LABEL_303;
      case 0x12u:
        v5->_hasPeopleDensityWeightedConfidenceAverage = 1;
        v106 = *v9;
        v107 = *(_QWORD *)&v4[v106];
        if (v107 <= 0xFFFFFFFFFFFFFFFBLL && v107 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v108 = *(float *)(*(_QWORD *)&v4[*v12] + v107);
          *(_QWORD *)&v4[v106] = v107 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v108 = 0.0;
        }
        v206 = v108;
        v207 = 144;
        goto LABEL_303;
      case 0x13u:
        v5->_hasMediaTotalPlayTime = 1;
        v109 = *v9;
        v110 = *(_QWORD *)&v4[v109];
        if (v110 <= 0xFFFFFFFFFFFFFFFBLL && v110 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v111 = *(float *)(*(_QWORD *)&v4[*v12] + v110);
          *(_QWORD *)&v4[v109] = v110 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v111 = 0.0;
        }
        v206 = v111;
        v207 = 152;
        goto LABEL_303;
      case 0x14u:
        v5->_hasMediaLength = 1;
        v112 = *v9;
        v113 = *(_QWORD *)&v4[v112];
        if (v113 <= 0xFFFFFFFFFFFFFFFBLL && v113 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v114 = *(float *)(*(_QWORD *)&v4[*v12] + v113);
          *(_QWORD *)&v4[v112] = v113 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v114 = 0.0;
        }
        v206 = v114;
        v207 = 160;
        goto LABEL_303;
      case 0x15u:
        v115 = 0;
        v116 = 0;
        v117 = 0;
        v5->_hasMediaActionIsRepeat = 1;
        while (2)
        {
          v118 = *v9;
          v119 = *(_QWORD *)&v4[v118];
          v120 = v119 + 1;
          if (v119 == -1 || v120 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v121 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v119);
            *(_QWORD *)&v4[v118] = v120;
            v117 |= (unint64_t)(v121 & 0x7F) << v115;
            if (v121 < 0)
            {
              v115 += 7;
              v20 = v116++ >= 9;
              if (v20)
              {
                v117 = 0;
                goto LABEL_223;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v117 = 0;
LABEL_223:
        v194 = v117 != 0;
        v195 = 42;
        goto LABEL_264;
      case 0x16u:
        v5->_hasTimeAtHomeDuration = 1;
        v122 = *v9;
        v123 = *(_QWORD *)&v4[v122];
        if (v123 <= 0xFFFFFFFFFFFFFFFBLL && v123 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v124 = *(float *)(*(_QWORD *)&v4[*v12] + v123);
          *(_QWORD *)&v4[v122] = v123 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v124 = 0.0;
        }
        v206 = v124;
        v207 = 168;
        goto LABEL_303;
      case 0x17u:
        v5->_hasPhotosAtHomeCurationScore = 1;
        v125 = *v9;
        v126 = *(_QWORD *)&v4[v125];
        if (v126 <= 0xFFFFFFFFFFFFFFFBLL && v126 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v127 = *(float *)(*(_QWORD *)&v4[*v12] + v126);
          *(_QWORD *)&v4[v125] = v126 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v127 = 0.0;
        }
        v206 = v127;
        v207 = 176;
        goto LABEL_303;
      case 0x18u:
        v5->_hasWorkoutDuration = 1;
        v128 = *v9;
        v129 = *(_QWORD *)&v4[v128];
        if (v129 <= 0xFFFFFFFFFFFFFFFBLL && v129 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v130 = *(float *)(*(_QWORD *)&v4[*v12] + v129);
          *(_QWORD *)&v4[v128] = v129 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v130 = 0.0;
        }
        v206 = v130;
        v207 = 184;
        goto LABEL_303;
      case 0x19u:
        v5->_hasMotionActivityWalkSpan = 1;
        v131 = *v9;
        v132 = *(_QWORD *)&v4[v131];
        if (v132 <= 0xFFFFFFFFFFFFFFFBLL && v132 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v133 = *(float *)(*(_QWORD *)&v4[*v12] + v132);
          *(_QWORD *)&v4[v131] = v132 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v133 = 0.0;
        }
        v206 = v133;
        v207 = 192;
        goto LABEL_303;
      case 0x1Au:
        v5->_hasVisitDuration = 1;
        v134 = *v9;
        v135 = *(_QWORD *)&v4[v134];
        if (v135 <= 0xFFFFFFFFFFFFFFFBLL && v135 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v136 = *(float *)(*(_QWORD *)&v4[*v12] + v135);
          *(_QWORD *)&v4[v134] = v135 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v136 = 0.0;
        }
        v206 = v136;
        v207 = 200;
        goto LABEL_303;
      case 0x1Bu:
        v5->_hasPoiCategoryInterestingness = 1;
        v137 = *v9;
        v138 = *(_QWORD *)&v4[v137];
        if (v138 <= 0xFFFFFFFFFFFFFFFBLL && v138 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v139 = *(float *)(*(_QWORD *)&v4[*v12] + v138);
          *(_QWORD *)&v4[v137] = v138 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v139 = 0.0;
        }
        v206 = v139;
        v207 = 208;
        goto LABEL_303;
      case 0x1Cu:
        v5->_hasFamiliarityIndex = 1;
        v140 = *v9;
        v141 = *(_QWORD *)&v4[v140];
        if (v141 <= 0xFFFFFFFFFFFFFFFBLL && v141 + 4 <= *(_QWORD *)&v4[*v10])
        {
          v142 = *(float *)(*(_QWORD *)&v4[*v12] + v141);
          *(_QWORD *)&v4[v140] = v141 + 4;
        }
        else
        {
          v4[*v11] = 1;
          v142 = 0.0;
        }
        v206 = v142;
        v207 = 216;
LABEL_303:
        *(double *)((char *)&v5->super.super.isa + v207) = v206;
        goto LABEL_308;
      case 0x1Du:
        v143 = 0;
        v144 = 0;
        v145 = 0;
        v146 = (void *)MEMORY[0x1E0CB37E8];
        while (2)
        {
          v147 = *v9;
          v148 = *(_QWORD *)&v4[v147];
          v149 = v148 + 1;
          if (v148 == -1 || v149 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v150 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v148);
            *(_QWORD *)&v4[v147] = v149;
            v145 |= (unint64_t)(v150 & 0x7F) << v143;
            if (v150 < 0)
            {
              v143 += 7;
              v20 = v144++ >= 9;
              if (v20)
              {
                LODWORD(v145) = 0;
                goto LABEL_227;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          LODWORD(v145) = 0;
LABEL_227:
        if (v145 >= 0x13)
          v196 = 0;
        else
          v196 = v145;
        objc_msgSend(v146, "numberWithUnsignedInt:", v196, v222);
        v197 = objc_claimAutoreleasedReturnValue();
        if (!v197)
          goto LABEL_313;
        v198 = (void *)v197;
        v199 = v224;
        goto LABEL_307;
      case 0x1Eu:
        v151 = 0;
        v152 = 0;
        v153 = 0;
        v154 = (void *)MEMORY[0x1E0CB37E8];
        while (2)
        {
          v155 = *v9;
          v156 = *(_QWORD *)&v4[v155];
          v157 = v156 + 1;
          if (v156 == -1 || v157 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v158 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v156);
            *(_QWORD *)&v4[v155] = v157;
            v153 |= (unint64_t)(v158 & 0x7F) << v151;
            if (v158 < 0)
            {
              v151 += 7;
              v20 = v152++ >= 9;
              if (v20)
              {
                LODWORD(v153) = 0;
                goto LABEL_235;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          LODWORD(v153) = 0;
LABEL_235:
        if (v153 >= 0x27)
          v200 = 0;
        else
          v200 = v153;
        objc_msgSend(v154, "numberWithUnsignedInt:", v200, v222);
        v201 = objc_claimAutoreleasedReturnValue();
        if (!v201)
          goto LABEL_313;
        v198 = (void *)v201;
        v199 = v222;
        goto LABEL_307;
      case 0x1Fu:
        v159 = 0;
        v160 = 0;
        v161 = 0;
        v162 = (void *)MEMORY[0x1E0CB37E8];
        while (2)
        {
          v163 = *v9;
          v164 = *(_QWORD *)&v4[v163];
          v165 = v164 + 1;
          if (v164 == -1 || v165 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v166 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v164);
            *(_QWORD *)&v4[v163] = v165;
            v161 |= (unint64_t)(v166 & 0x7F) << v159;
            if (v166 < 0)
            {
              v159 += 7;
              v20 = v160++ >= 9;
              if (v20)
              {
                LODWORD(v161) = 0;
                goto LABEL_243;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          LODWORD(v161) = 0;
LABEL_243:
        if (v161 >= 3)
          v202 = 0;
        else
          v202 = v161;
        objc_msgSend(v162, "numberWithUnsignedInt:", v202, v222);
        v203 = objc_claimAutoreleasedReturnValue();
        if (!v203)
          goto LABEL_313;
        v198 = (void *)v203;
        v199 = v6;
        goto LABEL_307;
      case 0x20u:
        v167 = 0;
        v168 = 0;
        v169 = 0;
        v170 = (void *)MEMORY[0x1E0CB37E8];
        while (2)
        {
          v171 = *v9;
          v172 = *(_QWORD *)&v4[v171];
          v173 = v172 + 1;
          if (v172 == -1 || v173 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v174 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v172);
            *(_QWORD *)&v4[v171] = v173;
            v169 |= (unint64_t)(v174 & 0x7F) << v167;
            if (v174 < 0)
            {
              v167 += 7;
              v20 = v168++ >= 9;
              if (v20)
              {
                LODWORD(v169) = 0;
                goto LABEL_251;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          LODWORD(v169) = 0;
LABEL_251:
        if (v169 >= 8)
          v204 = 0;
        else
          v204 = v169;
        objc_msgSend(v170, "numberWithUnsignedInt:", v204, v222);
        v205 = objc_claimAutoreleasedReturnValue();
        if (v205)
        {
          v198 = (void *)v205;
          v199 = v7;
LABEL_307:
          objc_msgSend(v199, "addObject:", v198);

LABEL_308:
          if (*(_QWORD *)&v4[*v9] >= *(_QWORD *)&v4[*v10])
            goto LABEL_309;
          continue;
        }
LABEL_313:

LABEL_310:
        v220 = 0;
LABEL_312:

        return v220;
      case 0x21u:
        v175 = (void *)MEMORY[0x1E0CB37E8];
        v176 = *v9;
        v177 = *(_QWORD *)&v4[v176];
        if (v177 <= 0xFFFFFFFFFFFFFFF7 && v177 + 8 <= *(_QWORD *)&v4[*v10])
        {
          v178 = *(double *)(*(_QWORD *)&v4[*v12] + v177);
          *(_QWORD *)&v4[v176] = v177 + 8;
        }
        else
        {
          v4[v21] = 1;
          v178 = 0.0;
        }
        objc_msgSend(v175, "numberWithDouble:", v178, v222);
        v208 = objc_claimAutoreleasedReturnValue();
        if (!v208)
          goto LABEL_313;
        v198 = (void *)v208;
        v199 = v8;
        goto LABEL_307;
      case 0x22u:
        v179 = 0;
        v180 = 0;
        v181 = 0;
        v5->_hasStateOfMindLoggedIn3pApp = 1;
        while (2)
        {
          v182 = *v9;
          v183 = *(_QWORD *)&v4[v182];
          v184 = v183 + 1;
          if (v183 == -1 || v184 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v185 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v183);
            *(_QWORD *)&v4[v182] = v184;
            v181 |= (unint64_t)(v185 & 0x7F) << v179;
            if (v185 < 0)
            {
              v179 += 7;
              v20 = v180++ >= 9;
              if (v20)
              {
                v181 = 0;
                goto LABEL_259;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v181 = 0;
LABEL_259:
        v194 = v181 != 0;
        v195 = 51;
        goto LABEL_264;
      case 0x23u:
        v186 = 0;
        v187 = 0;
        v188 = 0;
        v5->_hasStateOfMindLoggedInJournalApp = 1;
        while (2)
        {
          v189 = *v9;
          v190 = *(_QWORD *)&v4[v189];
          v191 = v190 + 1;
          if (v190 == -1 || v191 > *(_QWORD *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            v192 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v190);
            *(_QWORD *)&v4[v189] = v191;
            v188 |= (unint64_t)(v192 & 0x7F) << v186;
            if (v192 < 0)
            {
              v186 += 7;
              v20 = v187++ >= 9;
              if (v20)
              {
                v188 = 0;
                goto LABEL_263;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11])
          v188 = 0;
LABEL_263:
        v194 = v188 != 0;
        v195 = 53;
LABEL_264:
        *((_BYTE *)&v5->super.super.isa + v195) = v194;
        goto LABEL_308;
      default:
        if (!PBReaderSkipValueWithTag())
          goto LABEL_313;
        goto LABEL_308;
    }
  }
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasDailyAggregateCallDuration)
    PBDataWriterWriteFloatField();
  if (self->_hasCallDuration)
    PBDataWriterWriteFloatField();
  if (self->_hasBurstyInteractionCount)
    PBDataWriterWriteInt32Field();
  if (self->_hasBurstyOutgoingInteractionCount)
    PBDataWriterWriteInt32Field();
  if (self->_hasMultipleInteractionTypes)
    PBDataWriterWriteBOOLField();
  if (self->_hasContactLocationWork)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFamilyContact)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCoworkerContact)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsRepetitiveContact)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsGroupConversation)
    PBDataWriterWriteBOOLField();
  if (self->_hasPeopleCountWeightedSum)
    PBDataWriterWriteFloatField();
  if (self->_hasPeopleCountWeightedAverage)
    PBDataWriterWriteFloatField();
  if (self->_hasPeopleCountMax)
    PBDataWriterWriteFloatField();
  if (self->_hasPeopleDensityWeightedSum)
    PBDataWriterWriteFloatField();
  if (self->_hasPeopleDensityWeightedAverage)
    PBDataWriterWriteFloatField();
  if (self->_hasPeopleDensityMax)
    PBDataWriterWriteFloatField();
  if (self->_hasPeopleDensityWeightedConfidenceSum)
    PBDataWriterWriteFloatField();
  if (self->_hasPeopleDensityWeightedConfidenceAverage)
    PBDataWriterWriteFloatField();
  if (self->_hasMediaTotalPlayTime)
    PBDataWriterWriteFloatField();
  if (self->_hasMediaLength)
    PBDataWriterWriteFloatField();
  if (self->_hasMediaActionIsRepeat)
    PBDataWriterWriteBOOLField();
  if (self->_hasTimeAtHomeDuration)
    PBDataWriterWriteFloatField();
  if (self->_hasPhotosAtHomeCurationScore)
    PBDataWriterWriteFloatField();
  if (self->_hasWorkoutDuration)
    PBDataWriterWriteFloatField();
  if (self->_hasMotionActivityWalkSpan)
    PBDataWriterWriteFloatField();
  if (self->_hasVisitDuration)
    PBDataWriterWriteFloatField();
  if (self->_hasPoiCategoryInterestingness)
    PBDataWriterWriteFloatField();
  if (self->_hasFamiliarityIndex)
    PBDataWriterWriteFloatField();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = self->_stateOfMindDomains;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v9), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_stateOfMindLabels;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v14), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_stateOfMindReflectiveIntervals;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v19), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_stateOfMindValenceClassifications;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_stateOfMindValenceValues;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v29), "doubleValue", (_QWORD)v30);
        PBDataWriterWriteDoubleField();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

  if (self->_hasStateOfMindLoggedIn3pApp)
    PBDataWriterWriteBOOLField();
  if (self->_hasStateOfMindLoggedInJournalApp)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventDataEventBundleMetadataForRank writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundleMetadataForRank)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
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
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  BMMomentsEventDataEventBundleMetadataForRank *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id *v91;
  id v92;
  BMMomentsEventDataEventBundleMetadataForRank *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  id v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  void *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  id v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  void *v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t i;
  void *v215;
  id v216;
  id v217;
  void *v218;
  void *v219;
  int v220;
  void *v221;
  id *v222;
  id v223;
  uint64_t v224;
  void *v225;
  id v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  id v230;
  uint64_t v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  id v239;
  id *v240;
  id v241;
  id v242;
  void *v243;
  void *v244;
  int v245;
  id *v246;
  id v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  uint64_t v251;
  id v252;
  uint64_t v253;
  id v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  id *v260;
  id v261;
  id v262;
  void *v263;
  void *v264;
  int v265;
  id v266;
  uint64_t v267;
  id v268;
  uint64_t v269;
  void *v270;
  id v271;
  uint64_t v272;
  id v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  id v279;
  id v280;
  void *v281;
  void *v282;
  int v283;
  id v284;
  uint64_t v285;
  id v286;
  uint64_t v287;
  void *v288;
  id v289;
  void *v290;
  id v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  id v298;
  void *v299;
  void *v300;
  id v301;
  id v302;
  uint64_t v303;
  id v304;
  uint64_t v305;
  void *v306;
  uint64_t v307;
  id v308;
  uint64_t v309;
  id v310;
  uint64_t v311;
  id v313;
  uint64_t v314;
  id v315;
  uint64_t v316;
  void *v317;
  void *v318;
  uint64_t v319;
  uint64_t v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  id v325;
  id v326;
  void *v327;
  void *v328;
  void *v329;
  id v330;
  void *v331;
  id obj;
  id v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  id v338;
  void *v339;
  void *v340;
  id v341;
  id v342;
  id v343;
  void *v344;
  id v345;
  void *v346;
  id v347;
  void *v348;
  id v349;
  void *v350;
  id v351;
  void *v352;
  id v353;
  void *v354;
  id v355;
  id v356;
  void *v357;
  id v358;
  id v359;
  id v360;
  void *v361;
  id v362;
  void *v363;
  id v364;
  void *v365;
  void *v366;
  id v367;
  id v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  BMMomentsEventDataEventBundleMetadataForRank *v396;
  void *v397;
  void *v398;
  id v399;
  id v400;
  void *v401;
  id v402;
  void *v403;
  id *v404;
  void *v405;
  id *v406;
  id *v407;
  id v408;
  id v409;
  void *v410;
  id v411;
  void *v412;
  BMMomentsEventDataEventBundleMetadataForRank *v413;
  uint64_t v414;
  id v415;
  void *v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  uint64_t v437;
  void *v438;
  uint64_t v439;
  id v440;
  uint64_t v441;
  void *v442;
  uint64_t v443;
  void *v444;
  _BYTE v445[128];
  uint64_t v446;
  void *v447;
  uint64_t v448;
  void *v449;
  uint64_t v450;
  void *v451;
  _BYTE v452[128];
  uint64_t v453;
  void *v454;
  uint64_t v455;
  void *v456;
  uint64_t v457;
  void *v458;
  _BYTE v459[128];
  uint64_t v460;
  void *v461;
  uint64_t v462;
  void *v463;
  uint64_t v464;
  void *v465;
  _BYTE v466[128];
  uint64_t v467;
  void *v468;
  uint64_t v469;
  void *v470;
  uint64_t v471;
  void *v472;
  _BYTE v473[128];
  uint64_t v474;
  void *v475;
  uint64_t v476;
  void *v477;
  uint64_t v478;
  id v479;
  uint64_t v480;
  id v481;
  uint64_t v482;
  id v483;
  uint64_t v484;
  id v485;
  uint64_t v486;
  id v487;
  uint64_t v488;
  id v489;
  uint64_t v490;
  id v491;
  uint64_t v492;
  id v493;
  uint64_t v494;
  id v495;
  uint64_t v496;
  id v497;
  uint64_t v498;
  id v499;
  uint64_t v500;
  id v501;
  uint64_t v502;
  id v503;
  uint64_t v504;
  id v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  id v509;
  uint64_t v510;
  id v511;
  uint64_t v512;
  id v513;
  uint64_t v514;
  id v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  id v521;
  uint64_t v522;
  void *v523;
  uint64_t v524;
  id *v525;
  uint64_t v526;
  void *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  _QWORD v531[3];

  v531[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dailyAggregateCallDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v64 = *MEMORY[0x1E0D025B8];
        v530 = *MEMORY[0x1E0CB2D50];
        v65 = v7;
        v66 = objc_alloc(MEMORY[0x1E0CB3940]);
        v319 = objc_opt_class();
        v67 = v66;
        v7 = v65;
        v68 = objc_msgSend(v67, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v319, CFSTR("dailyAggregateCallDuration"));
        v531[0] = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v531, &v530, 1);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v63;
        v9 = (void *)v69;
        v71 = (void *)v68;
        v8 = 0;
        v72 = 0;
        *a4 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v64, 2, v69);
        goto LABEL_423;
      }
      v8 = 0;
      v72 = 0;
      goto LABEL_424;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("callDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v73 = v9;
        v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v75 = *MEMORY[0x1E0D025B8];
        v528 = *MEMORY[0x1E0CB2D50];
        v76 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("callDuration"));
        v529 = v76;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v529, &v528, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v74;
        v9 = v73;
        v78 = v75;
        v11 = (id)v76;
        v71 = 0;
        v72 = 0;
        *a4 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v78, 2, v10);
        goto LABEL_422;
      }
      v71 = 0;
      v72 = 0;
      goto LABEL_423;
    }
    v415 = v9;
  }
  else
  {
    v415 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("burstyInteractionCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v412 = v7;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v79 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v80 = *MEMORY[0x1E0D025B8];
        v526 = *MEMORY[0x1E0CB2D50];
        v81 = v8;
        v82 = objc_alloc(MEMORY[0x1E0CB3940]);
        v320 = objc_opt_class();
        v83 = v82;
        v8 = v81;
        v84 = (void *)objc_msgSend(v83, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v320, CFSTR("burstyInteractionCount"));
        v527 = v84;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v527, &v526, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2, v13);
        v11 = 0;
        v413 = 0;
        *a4 = v85;
        v7 = v412;
        goto LABEL_421;
      }
      v11 = 0;
      v72 = 0;
      v71 = v415;
      goto LABEL_422;
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("burstyOutgoingInteractionCount"));
  v12 = objc_claimAutoreleasedReturnValue();
  v409 = v8;
  v411 = v11;
  v410 = (void *)v12;
  if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v399 = v6;
        v86 = v9;
        v407 = a4;
        v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v88 = *MEMORY[0x1E0D025B8];
        v524 = *MEMORY[0x1E0CB2D50];
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("burstyOutgoingInteractionCount"));
        v525 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v525, &v524, 1);
        v89 = objc_claimAutoreleasedReturnValue();
        v90 = v87;
        v9 = v86;
        v6 = v399;
        v416 = (void *)v89;
        v84 = 0;
        v413 = 0;
        *v407 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v88, 2, v89);
        goto LABEL_420;
      }
      v84 = 0;
      v413 = 0;
      goto LABEL_421;
    }
    v408 = v13;
  }
  else
  {
    v408 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("multipleInteractionTypes"));
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  if (v416 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v373 = v9;
        v91 = a4;
        v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v93 = self;
        v94 = *MEMORY[0x1E0D025B8];
        v522 = *MEMORY[0x1E0CB2D50];
        v405 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("multipleInteractionTypes"));
        v523 = v405;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v523, &v522, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v92;
        v9 = v373;
        v96 = v94;
        self = v93;
        v7 = v412;
        a4 = 0;
        v413 = 0;
        *v91 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2, v14);
        v84 = v408;
        goto LABEL_419;
      }
      v413 = 0;
      v84 = v408;
      goto LABEL_420;
    }
    v404 = v416;
  }
  else
  {
    v404 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactLocationWork"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v406 = a4;
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v374 = v9;
        v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v98 = *MEMORY[0x1E0D025B8];
        v520 = *MEMORY[0x1E0CB2D50];
        v402 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contactLocationWork"));
        v521 = v402;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v521, &v520, 1);
        v99 = objc_claimAutoreleasedReturnValue();
        v100 = v97;
        v9 = v374;
        a4 = v404;
        v403 = (void *)v99;
        v405 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v98, 2, v99);
        v84 = v408;
        goto LABEL_418;
      }
      v405 = 0;
      v413 = 0;
      v84 = v408;
      a4 = v404;
      goto LABEL_419;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isFamilyContact"));
  v16 = objc_claimAutoreleasedReturnValue();
  v405 = v15;
  v397 = v10;
  v403 = (void *)v16;
  if (v16 && (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v375 = v9;
        v101 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v102 = *MEMORY[0x1E0D025B8];
        v518 = *MEMORY[0x1E0CB2D50];
        v103 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFamilyContact"));
        v519 = v103;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v519, &v518, 1);
        v104 = objc_claimAutoreleasedReturnValue();
        v105 = v101;
        v9 = v375;
        v106 = v102;
        a4 = v404;
        v20 = (id)v103;
        v398 = (void *)v104;
        v402 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v106, 2);
        v84 = v408;
        goto LABEL_417;
      }
      v402 = 0;
      v413 = 0;
      v84 = v408;
      a4 = v404;
      goto LABEL_418;
    }
    v402 = v17;
  }
  else
  {
    v402 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCoworkerContact"));
  v18 = objc_claimAutoreleasedReturnValue();
  v398 = (void *)v18;
  if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v376 = v9;
        v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v108 = *MEMORY[0x1E0D025B8];
        v516 = *MEMORY[0x1E0CB2D50];
        v109 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isCoworkerContact"));
        v517 = v109;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v517, &v516, 1);
        v110 = objc_claimAutoreleasedReturnValue();
        v111 = v107;
        v10 = v397;
        v9 = v376;
        v371 = (void *)v110;
        v112 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v108, 2);
        v20 = 0;
        v413 = 0;
        *v406 = v112;
        a4 = v404;
        v23 = (id)v109;
        v84 = v408;
        goto LABEL_416;
      }
      v20 = 0;
      v413 = 0;
      v84 = v408;
      v10 = v397;
      a4 = v404;
      goto LABEL_417;
    }
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isRepetitiveContact"));
  v21 = objc_claimAutoreleasedReturnValue();
  v369 = v14;
  v371 = (void *)v21;
  if (v21 && (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v400 = v6;
        v113 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v114 = *MEMORY[0x1E0D025B8];
        v514 = *MEMORY[0x1E0CB2D50];
        v368 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isRepetitiveContact"));
        v515 = v368;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v515, &v514, 1);
        v115 = objc_claimAutoreleasedReturnValue();
        v116 = v113;
        v6 = v400;
        v117 = v114;
        a4 = v404;
        v10 = v397;
        v370 = (void *)v115;
        v23 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v117, 2);
        v84 = v408;
        goto LABEL_415;
      }
      v413 = 0;
      v84 = v408;
      v10 = v397;
      a4 = v404;
      v23 = 0;
      goto LABEL_416;
    }
    v23 = v22;
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isGroupConversation"));
  v24 = objc_claimAutoreleasedReturnValue();
  v396 = self;
  v364 = v23;
  v370 = (void *)v24;
  if (v24 && (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v377 = v9;
        v118 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v119 = v20;
        v120 = *MEMORY[0x1E0D025B8];
        v512 = *MEMORY[0x1E0CB2D50];
        v367 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isGroupConversation"));
        v513 = v367;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v513, &v512, 1);
        v121 = objc_claimAutoreleasedReturnValue();
        v122 = v118;
        v9 = v377;
        v123 = v120;
        v20 = v119;
        v124 = (void *)v121;
        v368 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v123, 2, v121);
        a4 = v404;
        v84 = v408;
        goto LABEL_414;
      }
      v368 = 0;
      v413 = 0;
      v84 = v408;
      v10 = v397;
      a4 = v404;
      goto LABEL_415;
    }
    v368 = v25;
  }
  else
  {
    v368 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleCountWeightedSum"));
  v26 = objc_claimAutoreleasedReturnValue();
  v366 = (void *)v26;
  v360 = v20;
  if (v26 && (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v378 = v9;
        v125 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v126 = *MEMORY[0x1E0D025B8];
        v510 = *MEMORY[0x1E0CB2D50];
        v362 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleCountWeightedSum"));
        v511 = v362;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v511, &v510, 1);
        v127 = objc_claimAutoreleasedReturnValue();
        v128 = v125;
        v9 = v378;
        v129 = v126;
        a4 = v404;
        v20 = v360;
        v365 = (void *)v127;
        v367 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v129, 2);
        v124 = v366;
        v84 = v408;
        goto LABEL_412;
      }
      v367 = 0;
      v413 = 0;
      v84 = v408;
      v124 = v366;
      self = v396;
      a4 = v404;
      goto LABEL_414;
    }
    v367 = v27;
  }
  else
  {
    v367 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleCountWeightedAverage"));
  v28 = objc_claimAutoreleasedReturnValue();
  v365 = (void *)v28;
  if (v28 && (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v379 = v9;
        v130 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v131 = *MEMORY[0x1E0D025B8];
        v508 = *MEMORY[0x1E0CB2D50];
        v359 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleCountWeightedAverage"));
        v509 = v359;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v509, &v508, 1);
        v132 = objc_claimAutoreleasedReturnValue();
        v133 = v130;
        v9 = v379;
        v134 = v131;
        a4 = v404;
        v20 = v360;
        v361 = (void *)v132;
        v362 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v134, 2);
        v84 = v408;
        v124 = v366;
        goto LABEL_411;
      }
      v362 = 0;
      v413 = 0;
      v84 = v408;
      v124 = v366;
      self = v396;
      a4 = v404;
      goto LABEL_413;
    }
    v362 = v29;
  }
  else
  {
    v362 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleCountMax"));
  v30 = objc_claimAutoreleasedReturnValue();
  v361 = (void *)v30;
  if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v380 = v9;
        v135 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v136 = *MEMORY[0x1E0D025B8];
        v506 = *MEMORY[0x1E0CB2D50];
        v137 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleCountMax"));
        v507 = v137;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v507, &v506, 1);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = v135;
        v9 = v380;
        v140 = v136;
        v20 = v360;
        v141 = (void *)v137;
        v359 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v139, "initWithDomain:code:userInfo:", v140, 2, v138);
        v84 = v408;
        v124 = v366;
        goto LABEL_409;
      }
      v359 = 0;
      v413 = 0;
      v84 = v408;
      v124 = v366;
      goto LABEL_410;
    }
    v359 = v31;
  }
  else
  {
    v359 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleDensityWeightedSum"));
  v32 = objc_claimAutoreleasedReturnValue();
  v363 = (void *)v32;
  if (v32 && (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v381 = v9;
        v142 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v143 = *MEMORY[0x1E0D025B8];
        v504 = *MEMORY[0x1E0CB2D50];
        v138 = v363;
        v358 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleDensityWeightedSum"));
        v505 = v358;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v505, &v504, 1);
        v144 = objc_claimAutoreleasedReturnValue();
        v145 = v142;
        v9 = v381;
        v146 = v143;
        v20 = v360;
        v357 = (void *)v144;
        v356 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v146, 2);
        v84 = v408;
        v124 = v366;
        goto LABEL_408;
      }
      v141 = 0;
      v413 = 0;
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_409;
    }
    v356 = v33;
  }
  else
  {
    v356 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleDensityWeightedAverage"));
  v34 = objc_claimAutoreleasedReturnValue();
  v357 = (void *)v34;
  if (v34 && (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v406)
      {
        v358 = 0;
        v413 = 0;
        v84 = v408;
        v124 = v366;
        v138 = v363;
        goto LABEL_408;
      }
      v382 = v9;
      v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v148 = *MEMORY[0x1E0D025B8];
      v502 = *MEMORY[0x1E0CB2D50];
      v355 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleDensityWeightedAverage"));
      v503 = v355;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v503, &v502, 1);
      v149 = objc_claimAutoreleasedReturnValue();
      v150 = v147;
      v9 = v382;
      v151 = v148;
      v20 = v360;
      v354 = (void *)v149;
      v358 = 0;
      v413 = 0;
      *v406 = (id)objc_msgSend(v150, "initWithDomain:code:userInfo:", v151, 2);
      goto LABEL_195;
    }
    v358 = v35;
  }
  else
  {
    v358 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleDensityMax"));
  v36 = objc_claimAutoreleasedReturnValue();
  v354 = (void *)v36;
  if (v36)
  {
    v37 = (void *)v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v355 = v37;
        goto LABEL_49;
      }
      if (v406)
      {
        v383 = v9;
        v152 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v153 = *MEMORY[0x1E0D025B8];
        v500 = *MEMORY[0x1E0CB2D50];
        v353 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleDensityMax"));
        v501 = v353;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v501, &v500, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v152;
        v9 = v383;
        v155 = v153;
        v20 = v360;
        v355 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v155, 2, v38);
        goto LABEL_204;
      }
      v355 = 0;
      v413 = 0;
LABEL_195:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_407;
    }
  }
  v355 = 0;
LABEL_49:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleDensityWeightedConfidenceSum"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v352 = v38;
  if (v38)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v353 = v38;
        goto LABEL_52;
      }
      if (v406)
      {
        v384 = v9;
        v156 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v157 = *MEMORY[0x1E0D025B8];
        v498 = *MEMORY[0x1E0CB2D50];
        v351 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleDensityWeightedConfidenceSum"));
        v499 = v351;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v499, &v498, 1);
        v158 = objc_claimAutoreleasedReturnValue();
        v159 = v156;
        v9 = v384;
        v160 = v157;
        v20 = v360;
        v350 = (void *)v158;
        v353 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
        goto LABEL_210;
      }
      v353 = 0;
      v413 = 0;
LABEL_204:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_406;
    }
  }
  v353 = 0;
LABEL_52:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("peopleDensityWeightedConfidenceAverage"));
  v39 = objc_claimAutoreleasedReturnValue();
  v350 = (void *)v39;
  if (v39)
  {
    v40 = (void *)v39;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v351 = v40;
        goto LABEL_55;
      }
      if (v406)
      {
        v385 = v9;
        v161 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v162 = *MEMORY[0x1E0D025B8];
        v496 = *MEMORY[0x1E0CB2D50];
        v349 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("peopleDensityWeightedConfidenceAverage"));
        v497 = v349;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v497, &v496, 1);
        v163 = objc_claimAutoreleasedReturnValue();
        v164 = v161;
        v9 = v385;
        v165 = v162;
        v20 = v360;
        v348 = (void *)v163;
        v351 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v164, "initWithDomain:code:userInfo:", v165, 2);
        goto LABEL_216;
      }
      v351 = 0;
      v413 = 0;
LABEL_210:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_405;
    }
  }
  v351 = 0;
LABEL_55:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaTotalPlayTime"));
  v41 = objc_claimAutoreleasedReturnValue();
  v348 = (void *)v41;
  if (v41)
  {
    v42 = (void *)v41;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v349 = v42;
        goto LABEL_58;
      }
      if (v406)
      {
        v386 = v9;
        v166 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v167 = *MEMORY[0x1E0D025B8];
        v494 = *MEMORY[0x1E0CB2D50];
        v347 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mediaTotalPlayTime"));
        v495 = v347;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v495, &v494, 1);
        v168 = objc_claimAutoreleasedReturnValue();
        v169 = v166;
        v9 = v386;
        v170 = v167;
        v20 = v360;
        v346 = (void *)v168;
        v349 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v169, "initWithDomain:code:userInfo:", v170, 2);
        goto LABEL_220;
      }
      v349 = 0;
      v413 = 0;
LABEL_216:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_404;
    }
  }
  v349 = 0;
LABEL_58:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaLength"));
  v43 = objc_claimAutoreleasedReturnValue();
  v346 = (void *)v43;
  if (v43)
  {
    v44 = (void *)v43;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v347 = v44;
        goto LABEL_61;
      }
      if (v406)
      {
        v387 = v9;
        v171 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v172 = *MEMORY[0x1E0D025B8];
        v492 = *MEMORY[0x1E0CB2D50];
        v345 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mediaLength"));
        v493 = v345;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v493, &v492, 1);
        v173 = objc_claimAutoreleasedReturnValue();
        v174 = v171;
        v9 = v387;
        v175 = v172;
        v20 = v360;
        v344 = (void *)v173;
        v347 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v175, 2);
        goto LABEL_224;
      }
      v347 = 0;
      v413 = 0;
LABEL_220:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_403;
    }
  }
  v347 = 0;
LABEL_61:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaActionIsRepeat"));
  v45 = objc_claimAutoreleasedReturnValue();
  v344 = (void *)v45;
  if (v45)
  {
    v46 = (void *)v45;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v345 = v46;
        goto LABEL_64;
      }
      if (v406)
      {
        v388 = v9;
        v176 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v177 = *MEMORY[0x1E0D025B8];
        v490 = *MEMORY[0x1E0CB2D50];
        v342 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mediaActionIsRepeat"));
        v491 = v342;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v491, &v490, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = v176;
        v9 = v388;
        v179 = v177;
        v20 = v360;
        v345 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v179, 2, v47);
        goto LABEL_228;
      }
      v345 = 0;
      v413 = 0;
LABEL_224:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_402;
    }
  }
  v345 = 0;
LABEL_64:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeAtHomeDuration"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v339 = v47;
  if (v47)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v342 = v47;
        goto LABEL_67;
      }
      if (v406)
      {
        v389 = v9;
        v180 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v181 = *MEMORY[0x1E0D025B8];
        v488 = *MEMORY[0x1E0CB2D50];
        v343 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timeAtHomeDuration"));
        v489 = v343;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v489, &v488, 1);
        v182 = objc_claimAutoreleasedReturnValue();
        v183 = v180;
        v9 = v389;
        v184 = v181;
        v20 = v360;
        v340 = (void *)v182;
        v342 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
        goto LABEL_256;
      }
      v342 = 0;
      v413 = 0;
LABEL_228:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_401;
    }
  }
  v342 = 0;
LABEL_67:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("photosAtHomeCurationScore"));
  v48 = objc_claimAutoreleasedReturnValue();
  v340 = (void *)v48;
  if (v48)
  {
    v49 = (void *)v48;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v343 = v49;
        goto LABEL_70;
      }
      if (v406)
      {
        v390 = v9;
        v186 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v187 = *MEMORY[0x1E0D025B8];
        v486 = *MEMORY[0x1E0CB2D50];
        v341 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("photosAtHomeCurationScore"));
        v487 = v341;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v487, &v486, 1);
        v188 = objc_claimAutoreleasedReturnValue();
        v189 = v186;
        v9 = v390;
        v190 = v187;
        v20 = v360;
        v337 = (void *)v188;
        v343 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v190, 2);
        goto LABEL_260;
      }
      v343 = 0;
      v413 = 0;
LABEL_256:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_400;
    }
  }
  v343 = 0;
LABEL_70:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("workoutDuration"));
  v50 = objc_claimAutoreleasedReturnValue();
  v337 = (void *)v50;
  if (v50)
  {
    v51 = (void *)v50;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v341 = v51;
        goto LABEL_73;
      }
      if (v406)
      {
        v391 = v9;
        v191 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v192 = *MEMORY[0x1E0D025B8];
        v484 = *MEMORY[0x1E0CB2D50];
        v338 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("workoutDuration"));
        v485 = v338;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v485, &v484, 1);
        v193 = objc_claimAutoreleasedReturnValue();
        v194 = v191;
        v9 = v391;
        v195 = v192;
        v20 = v360;
        v334 = (void *)v193;
        v341 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v195, 2);
        goto LABEL_263;
      }
      v341 = 0;
      v413 = 0;
LABEL_260:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_399;
    }
  }
  v341 = 0;
LABEL_73:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("motionActivityWalkSpan"));
  v52 = objc_claimAutoreleasedReturnValue();
  v334 = (void *)v52;
  if (v52)
  {
    v53 = (void *)v52;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v338 = v53;
        goto LABEL_76;
      }
      if (v406)
      {
        v392 = v9;
        v196 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v197 = *MEMORY[0x1E0D025B8];
        v482 = *MEMORY[0x1E0CB2D50];
        v333 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("motionActivityWalkSpan"));
        v483 = v333;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v483, &v482, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = v196;
        v9 = v392;
        v199 = v197;
        v20 = v360;
        v338 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v199, 2, v54);
        goto LABEL_265;
      }
      v338 = 0;
      v413 = 0;
LABEL_263:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_398;
    }
  }
  v338 = 0;
LABEL_76:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visitDuration"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v333 = v54;
        goto LABEL_79;
      }
      if (v406)
      {
        v393 = v9;
        v200 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v201 = *MEMORY[0x1E0D025B8];
        v480 = *MEMORY[0x1E0CB2D50];
        v330 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("visitDuration"));
        v481 = v330;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v481, &v480, 1);
        v202 = objc_claimAutoreleasedReturnValue();
        v203 = v200;
        v9 = v393;
        v204 = v201;
        v20 = v360;
        v331 = (void *)v202;
        v333 = 0;
        v413 = 0;
        *v406 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v204, 2);
        v84 = v408;
        v124 = v366;
        v138 = v363;
        goto LABEL_396;
      }
      v333 = 0;
      v413 = 0;
LABEL_265:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_397;
    }
  }
  v333 = 0;
LABEL_79:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("poiCategoryInterestingness"));
  v55 = objc_claimAutoreleasedReturnValue();
  v327 = v54;
  v331 = (void *)v55;
  if (v55 && (v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v406)
      {
        v330 = 0;
        v413 = 0;
        v84 = v408;
        v124 = v366;
        v138 = v363;
        v47 = v339;
        goto LABEL_396;
      }
      v394 = v9;
      v205 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v206 = *MEMORY[0x1E0D025B8];
      v478 = *MEMORY[0x1E0CB2D50];
      v326 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("poiCategoryInterestingness"));
      v479 = v326;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v479, &v478, 1);
      v207 = objc_claimAutoreleasedReturnValue();
      v208 = v205;
      v9 = v394;
      v209 = v206;
      v47 = v339;
      v20 = v360;
      v328 = (void *)v207;
      v330 = 0;
      v413 = 0;
      *v406 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v209, 2);
LABEL_268:
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_395;
    }
    v330 = v56;
  }
  else
  {
    v330 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familiarityIndex"));
  v57 = objc_claimAutoreleasedReturnValue();
  v328 = (void *)v57;
  if (!v57 || (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v59 = v9;
    v326 = 0;
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v47 = v339;
    if (v406)
    {
      v395 = v9;
      v226 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v227 = *MEMORY[0x1E0D025B8];
      v476 = *MEMORY[0x1E0CB2D50];
      v329 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("familiarityIndex"));
      v477 = v329;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v477, &v476, 1);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = v226;
      v9 = v395;
      v229 = v227;
      v20 = v360;
      v326 = 0;
      v413 = 0;
      *v406 = (id)objc_msgSend(v228, "initWithDomain:code:userInfo:", v229, 2, v210);
      v84 = v408;
      v124 = v366;
      v138 = v363;
      goto LABEL_393;
    }
    v326 = 0;
    v413 = 0;
    goto LABEL_268;
  }
  v59 = v9;
  v326 = v58;
LABEL_85:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOfMindDomains"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v60, "isEqual:", v61);

  if (v62)
  {
    v372 = v59;

LABEL_230:
    v185 = 0;
    goto LABEL_231;
  }
  if (!v60)
  {
    v372 = v59;
    goto LABEL_230;
  }
  objc_opt_class();
  v329 = v60;
  v9 = v59;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v406)
    {
      v413 = 0;
      v84 = v408;
      v124 = v366;
      v138 = v363;
      v54 = v327;
      goto LABEL_394;
    }
    v232 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v233 = *MEMORY[0x1E0D025B8];
    v474 = *MEMORY[0x1E0CB2D50];
    v210 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("stateOfMindDomains"));
    v475 = v210;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v475, &v474, 1);
    v211 = (id)objc_claimAutoreleasedReturnValue();
    v234 = v233;
    v9 = v59;
    v413 = 0;
    *v406 = (id)objc_msgSend(v232, "initWithDomain:code:userInfo:", v234, 2, v211);
    v84 = v408;
LABEL_270:
    v124 = v366;
    v138 = v363;
    goto LABEL_271;
  }
  v372 = v59;
  v185 = v60;
LABEL_231:
  v210 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v185, "count"));
  v433 = 0u;
  v434 = 0u;
  v435 = 0u;
  v436 = 0u;
  v211 = v185;
  v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v433, v473, 16);
  v138 = v363;
  v329 = v211;
  if (v212)
  {
    v213 = *(_QWORD *)v434;
    do
    {
      for (i = 0; i != v212; ++i)
      {
        if (*(_QWORD *)v434 != v213)
          objc_enumerationMutation(v211);
        v215 = *(void **)(*((_QWORD *)&v433 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v222 = v406;
          if (v406)
          {
            v223 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v224 = *MEMORY[0x1E0D025B8];
            v471 = *MEMORY[0x1E0CB2D50];
            v335 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("stateOfMindDomains"));
            v472 = v335;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v472, &v471, 1);
            v325 = (id)objc_claimAutoreleasedReturnValue();
            v225 = (void *)objc_msgSend(v223, "initWithDomain:code:userInfo:", v224, 2);
            v84 = v408;
            v20 = v360;
            v124 = v366;
LABEL_251:
            v54 = v327;
            v413 = 0;
            *v222 = v225;
            obj = v211;
            v9 = v372;
            v38 = v352;
            goto LABEL_390;
          }
          v413 = 0;
          v9 = v372;
          v84 = v408;
          v20 = v360;
          v124 = v366;
LABEL_271:
          v38 = v352;
          v54 = v327;
          goto LABEL_392;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v216 = v215;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v222 = v406;
            if (v406)
            {
              v230 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v231 = *MEMORY[0x1E0D025B8];
              v469 = *MEMORY[0x1E0CB2D50];
              v335 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("stateOfMindDomains"));
              v470 = v335;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v470, &v469, 1);
              v325 = (id)objc_claimAutoreleasedReturnValue();
              v225 = (void *)objc_msgSend(v230, "initWithDomain:code:userInfo:", v231, 2);
              v84 = v408;
              v20 = v360;
              v124 = v366;
              v138 = v363;
              goto LABEL_251;
            }
            v413 = 0;
            v9 = v372;
            v84 = v408;
            v20 = v360;
            goto LABEL_270;
          }
          v217 = v215;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataStateOfMindDomainFromString(v217));
          v216 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v210, "addObject:", v216);

        v138 = v363;
      }
      v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v433, v473, 16);
    }
    while (v212);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOfMindLabels"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = objc_msgSend(v218, "isEqual:", v219);

  if (v220)
  {

    v221 = 0;
    v20 = v360;
    v124 = v366;
  }
  else
  {
    v124 = v366;
    if (v218)
    {
      objc_opt_class();
      obj = v218;
      v20 = v360;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v406)
        {
          v413 = 0;
          v9 = v372;
          v84 = v408;
          v124 = v366;
          v54 = v327;
          goto LABEL_391;
        }
        v266 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v267 = *MEMORY[0x1E0D025B8];
        v467 = *MEMORY[0x1E0CB2D50];
        v335 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("stateOfMindLabels"));
        v468 = v335;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v468, &v467, 1);
        v325 = (id)objc_claimAutoreleasedReturnValue();
        v413 = 0;
        *v406 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v267, 2);
        v9 = v372;
        v84 = v408;
        v124 = v366;
        goto LABEL_312;
      }
      v221 = v218;
    }
    else
    {
      v221 = 0;
      v20 = v360;
    }
  }
  v335 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v221, "count"));
  v429 = 0u;
  v430 = 0u;
  v431 = 0u;
  v432 = 0u;
  obj = v221;
  v235 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v429, v466, 16);
  v336 = v210;
  if (!v235)
    goto LABEL_285;
  v236 = v235;
  v414 = *(_QWORD *)v430;
  do
  {
    v237 = 0;
    do
    {
      if (*(_QWORD *)v430 != v414)
        objc_enumerationMutation(obj);
      v238 = *(void **)(*((_QWORD *)&v429 + 1) + 8 * v237);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v246 = v406;
        if (v406)
        {
          v247 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v248 = *MEMORY[0x1E0D025B8];
          v464 = *MEMORY[0x1E0CB2D50];
          v324 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("stateOfMindLabels"));
          v465 = v324;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v465, &v464, 1);
          v249 = objc_claimAutoreleasedReturnValue();
          v250 = v247;
          v251 = v248;
LABEL_292:
          v322 = (void *)v249;
          v84 = v408;
          v54 = v327;
          v413 = 0;
          *v246 = (id)objc_msgSend(v250, "initWithDomain:code:userInfo:", v251, 2);
          v325 = obj;
          v9 = v372;
          v38 = v352;
          goto LABEL_389;
        }
LABEL_293:
        v413 = 0;
        v325 = obj;
        v9 = v372;
        v84 = v408;
LABEL_312:
        v38 = v352;
LABEL_313:
        v54 = v327;
        goto LABEL_390;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v239 = v20;
        v240 = v404;
        v241 = v238;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v246 = v406;
          if (v406)
          {
            v252 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v253 = *MEMORY[0x1E0D025B8];
            v462 = *MEMORY[0x1E0CB2D50];
            v324 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("stateOfMindLabels"));
            v463 = v324;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v463, &v462, 1);
            v249 = objc_claimAutoreleasedReturnValue();
            v250 = v252;
            v251 = v253;
            goto LABEL_292;
          }
          goto LABEL_293;
        }
        v239 = v20;
        v240 = v404;
        v242 = v238;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataStateOfMindLabelFromString(v242));
        v241 = (id)objc_claimAutoreleasedReturnValue();

      }
      v404 = v240;

      objc_msgSend(v335, "addObject:", v241);
      ++v237;
      v20 = v239;
      v124 = v366;
      v138 = v363;
      v210 = v336;
    }
    while (v236 != v237);
    v236 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v429, v466, 16);
  }
  while (v236);
LABEL_285:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOfMindReflectiveIntervals"));
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = objc_msgSend(v243, "isEqual:", v244);

  if (v245)
  {

    v243 = 0;
    goto LABEL_296;
  }
  if (v243)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v325 = v243;
      if (v406)
      {
        v284 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v285 = *MEMORY[0x1E0D025B8];
        v460 = *MEMORY[0x1E0CB2D50];
        v324 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("stateOfMindReflectiveIntervals"));
        v461 = v324;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v461, &v460, 1);
        v322 = (void *)objc_claimAutoreleasedReturnValue();
        v413 = 0;
        *v406 = (id)objc_msgSend(v284, "initWithDomain:code:userInfo:", v285, 2);
        v9 = v372;
        v84 = v408;
        goto LABEL_340;
      }
      v413 = 0;
      v9 = v372;
      v84 = v408;
      goto LABEL_313;
    }
  }
LABEL_296:
  v324 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v243, "count"));
  v425 = 0u;
  v426 = 0u;
  v427 = 0u;
  v428 = 0u;
  v254 = v243;
  v255 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", &v425, v459, 16);
  v325 = v254;
  if (!v255)
    goto LABEL_308;
  v256 = v255;
  v257 = *(_QWORD *)v426;
  while (2)
  {
    v258 = 0;
    while (2)
    {
      if (*(_QWORD *)v426 != v257)
        objc_enumerationMutation(v325);
      v259 = *(void **)(*((_QWORD *)&v425 + 1) + 8 * v258);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v406)
        {
          v268 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v269 = *MEMORY[0x1E0D025B8];
          v457 = *MEMORY[0x1E0CB2D50];
          v323 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("stateOfMindReflectiveIntervals"));
          v458 = v323;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v458, &v457, 1);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          v270 = (void *)objc_msgSend(v268, "initWithDomain:code:userInfo:", v269, 2);
          v84 = v408;
          v20 = v360;
          v124 = v366;
          v54 = v327;
LABEL_319:
          v413 = 0;
          *v406 = v270;
          v322 = v325;
          v9 = v372;
          goto LABEL_388;
        }
        v413 = 0;
        v322 = v325;
        v9 = v372;
        v84 = v408;
        v20 = v360;
        v124 = v366;
LABEL_340:
        v54 = v327;
        goto LABEL_389;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v260 = v404;
        v261 = v259;
        goto LABEL_306;
      }
      v260 = v404;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v406)
        {
          v271 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v272 = *MEMORY[0x1E0D025B8];
          v455 = *MEMORY[0x1E0CB2D50];
          v323 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("stateOfMindReflectiveIntervals"));
          v456 = v323;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v456, &v455, 1);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          v270 = (void *)objc_msgSend(v271, "initWithDomain:code:userInfo:", v272, 2);
          v84 = v408;
          v20 = v360;
          v124 = v366;
          v138 = v363;
          v54 = v327;
          v210 = v336;
          goto LABEL_319;
        }
        v413 = 0;
        v322 = v325;
        v9 = v372;
        v84 = v408;
        v20 = v360;
        v124 = v366;
        v138 = v363;
        goto LABEL_383;
      }
      v262 = v259;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataStateOfMindReflectiveIntervalFromString(v262));
      v261 = (id)objc_claimAutoreleasedReturnValue();

LABEL_306:
      v404 = v260;

      objc_msgSend(v324, "addObject:", v261);
      ++v258;
      v138 = v363;
      v210 = v336;
      if (v256 != v258)
        continue;
      break;
    }
    v254 = v325;
    v256 = objc_msgSend(v325, "countByEnumeratingWithState:objects:count:", &v425, v459, 16);
    if (v256)
      continue;
    break;
  }
LABEL_308:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOfMindValenceClassifications"));
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v265 = objc_msgSend(v263, "isEqual:", v264);

  if (v265)
  {

    v263 = 0;
    goto LABEL_323;
  }
  if (v263)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v322 = v263;
      if (v406)
      {
        v302 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v303 = *MEMORY[0x1E0D025B8];
        v453 = *MEMORY[0x1E0CB2D50];
        v323 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("stateOfMindValenceClassifications"));
        v454 = v323;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v454, &v453, 1);
        v321 = (void *)objc_claimAutoreleasedReturnValue();
        v413 = 0;
        *v406 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v303, 2);
LABEL_379:
        v9 = v372;
LABEL_380:
        v84 = v408;
        v20 = v360;
        v124 = v366;
        v138 = v363;
        goto LABEL_381;
      }
      v413 = 0;
      v9 = v372;
      v84 = v408;
      v20 = v360;
      v124 = v366;
      v138 = v363;
LABEL_383:
      v54 = v327;
      v210 = v336;
      goto LABEL_389;
    }
  }
  v138 = v363;
LABEL_323:
  v323 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v263, "count"));
  v421 = 0u;
  v422 = 0u;
  v423 = 0u;
  v424 = 0u;
  v273 = v263;
  v274 = objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v421, v452, 16);
  v322 = v273;
  if (!v274)
    goto LABEL_335;
  v275 = v274;
  v276 = *(_QWORD *)v422;
  while (2)
  {
    v277 = 0;
    while (2)
    {
      if (*(_QWORD *)v422 != v276)
        objc_enumerationMutation(v273);
      v278 = *(void **)(*((_QWORD *)&v421 + 1) + 8 * v277);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v406)
        {
          v286 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v287 = *MEMORY[0x1E0D025B8];
          v450 = *MEMORY[0x1E0CB2D50];
          v288 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("stateOfMindValenceClassifications"));
          v451 = v288;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v451, &v450, 1);
          v289 = (id)objc_claimAutoreleasedReturnValue();
          v290 = (void *)objc_msgSend(v286, "initWithDomain:code:userInfo:", v287, 2, v289);
LABEL_347:
          v413 = 0;
          *v406 = v290;
          v321 = v273;
          v84 = v408;
          goto LABEL_387;
        }
        v413 = 0;
        v321 = v273;
        v9 = v372;
        v84 = v408;
        v20 = v360;
        v124 = v366;
LABEL_381:
        v54 = v327;
        v210 = v336;
        goto LABEL_388;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v279 = v278;
        goto LABEL_333;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v406)
        {
          v291 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v292 = *MEMORY[0x1E0D025B8];
          v448 = *MEMORY[0x1E0CB2D50];
          v288 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("stateOfMindValenceClassifications"));
          v449 = v288;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v449, &v448, 1);
          v289 = (id)objc_claimAutoreleasedReturnValue();
          v290 = (void *)objc_msgSend(v291, "initWithDomain:code:userInfo:", v292, 2, v289);
          goto LABEL_347;
        }
        v413 = 0;
        v321 = v273;
        goto LABEL_379;
      }
      v280 = v278;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataStateOfMindValenceClassificationFromString(v280));
      v279 = (id)objc_claimAutoreleasedReturnValue();

LABEL_333:
      objc_msgSend(v323, "addObject:", v279);

      ++v277;
      v138 = v363;
      if (v275 != v277)
        continue;
      break;
    }
    v275 = objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v421, v452, 16);
    if (v275)
      continue;
    break;
  }
LABEL_335:

  v401 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateOfMindValenceValues"));
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v283 = objc_msgSend(v281, "isEqual:", v282);

  if (v283)
  {

    v281 = 0;
    goto LABEL_350;
  }
  v321 = v281;
  if (v281)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v310 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v311 = *MEMORY[0x1E0D025B8];
        v446 = *MEMORY[0x1E0CB2D50];
        v288 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("stateOfMindValenceValues"));
        v447 = v288;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v447, &v446, 1);
        v289 = (id)objc_claimAutoreleasedReturnValue();
        v413 = 0;
        *v406 = (id)objc_msgSend(v310, "initWithDomain:code:userInfo:", v311, 2, v289);
        goto LABEL_386;
      }
      v413 = 0;
      v9 = v372;
      v6 = v401;
      goto LABEL_380;
    }
  }
LABEL_350:
  v288 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v281, "count"));
  v417 = 0u;
  v418 = 0u;
  v419 = 0u;
  v420 = 0u;
  v289 = v281;
  v293 = objc_msgSend(v289, "countByEnumeratingWithState:objects:count:", &v417, v445, 16);
  v321 = v289;
  if (!v293)
    goto LABEL_359;
  v294 = v293;
  v295 = *(_QWORD *)v418;
  while (2)
  {
    v296 = 0;
    while (2)
    {
      if (*(_QWORD *)v418 != v295)
        objc_enumerationMutation(v289);
      v297 = *(void **)(*((_QWORD *)&v417 + 1) + 8 * v296);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v406)
        {
          v304 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v305 = *MEMORY[0x1E0D025B8];
          v443 = *MEMORY[0x1E0CB2D50];
          v299 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("stateOfMindValenceValues"));
          v444 = v299;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v444, &v443, 1);
          v301 = (id)objc_claimAutoreleasedReturnValue();
          v306 = v304;
          v307 = v305;
LABEL_374:
          v413 = 0;
          *v406 = (id)objc_msgSend(v306, "initWithDomain:code:userInfo:", v307, 2, v301);
          goto LABEL_375;
        }
LABEL_377:
        v413 = 0;
        goto LABEL_386;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v406)
        {
          v308 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v309 = *MEMORY[0x1E0D025B8];
          v441 = *MEMORY[0x1E0CB2D50];
          v299 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stateOfMindValenceValues"));
          v442 = v299;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v442, &v441, 1);
          v301 = (id)objc_claimAutoreleasedReturnValue();
          v306 = v308;
          v307 = v309;
          goto LABEL_374;
        }
        goto LABEL_377;
      }
      v298 = v297;
      objc_msgSend(v288, "addObject:", v298);

      if (v294 != ++v296)
        continue;
      break;
    }
    v294 = objc_msgSend(v289, "countByEnumeratingWithState:objects:count:", &v417, v445, 16);
    if (v294)
      continue;
    break;
  }
LABEL_359:

  objc_msgSend(v401, "objectForKeyedSubscript:", CFSTR("stateOfMindLoggedIn3pApp"));
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  if (v299 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v289 = v299;
      goto LABEL_362;
    }
    if (v406)
    {
      v313 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v314 = *MEMORY[0x1E0D025B8];
      v439 = *MEMORY[0x1E0CB2D50];
      v301 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stateOfMindLoggedIn3pApp"));
      v440 = v301;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v440, &v439, 1);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      v413 = 0;
      v289 = 0;
      *v406 = (id)objc_msgSend(v313, "initWithDomain:code:userInfo:", v314, 2, v300);
      goto LABEL_366;
    }
    v289 = 0;
    v413 = 0;
  }
  else
  {
    v289 = 0;
LABEL_362:
    objc_msgSend(v401, "objectForKeyedSubscript:", CFSTR("stateOfMindLoggedInJournalApp"));
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v300 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v301 = 0;
      goto LABEL_365;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v301 = v300;
LABEL_365:
      v396 = objc_retain(-[BMMomentsEventDataEventBundleMetadataForRank initWithDailyAggregateCallDuration:callDuration:burstyInteractionCount:burstyOutgoingInteractionCount:multipleInteractionTypes:contactLocationWork:isFamilyContact:isCoworkerContact:isRepetitiveContact:isGroupConversation:peopleCountWeightedSum:peopleCountWeightedAverage:peopleCountMax:peopleDensityWeightedSum:peopleDensityWeightedAverage:peopleDensityMax:peopleDensityWeightedConfidenceSum:peopleDensityWeightedConfidenceAverage:mediaTotalPlayTime:mediaLength:mediaActionIsRepeat:timeAtHomeDuration:photosAtHomeCurationScore:workoutDuration:motionActivityWalkSpan:visitDuration:poiCategoryInterestingness:familiarityIndex:stateOfMindDomains:stateOfMindLabels:stateOfMindReflectiveIntervals:stateOfMindValenceClassifications:stateOfMindValenceValues:stateOfMindLoggedIn3pApp:stateOfMindLoggedInJournalApp:](v396, "initWithDailyAggregateCallDuration:callDuration:burstyInteractionCount:burstyOutgoingInteractionCount:multipleInteractionTypes:contactLocationWork:isFamilyContact:isCoworkerContact:isRepetitiveContact:isGroupConversation:peopleCountWeightedSum:peopleCountWeightedAverage:peopleCountMax:peopleDensityWeightedSum:peopleDensityWeightedAverage:peopleDensityMax:peopleDensityWeightedConfidenceSum:peopleDensityWeightedConfidenceAverage:mediaTotalPlayTime:mediaLength:mediaActionIsRepeat:timeAtHomeDuration:photosAtHomeCurationScore:workoutDuration:motionActivityWalkSpan:visitDuration:poiCategoryInterestingness:familiarityIndex:stateOfMindDomains:stateOfMindLabels:stateOfMindReflectiveIntervals:stateOfMindValenceClassifications:stateOfMindValenceValues:stateOfMindLoggedIn3pApp:stateOfMindLoggedInJournalApp:", v409, v415, v411, v408, v404, v405, v402, v360, v364,
                 v368,
                 v367,
                 v362,
                 v359,
                 v356,
                 v358,
                 v355,
                 v353,
                 v351,
                 v349,
                 v347,
                 v345,
                 v342,
                 v343,
                 v341,
                 v338,
                 v333,
                 v330,
                 v326,
                 v336,
                 v335,
                 v324,
                 v323,
                 v288,
                 v289,
                 v301));
      v413 = v396;
    }
    else
    {
      if (v406)
      {
        v315 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v316 = *MEMORY[0x1E0D025B8];
        v437 = *MEMORY[0x1E0CB2D50];
        v317 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("stateOfMindLoggedInJournalApp"));
        v438 = v317;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v438, &v437, 1);
        v318 = (void *)objc_claimAutoreleasedReturnValue();
        *v406 = (id)objc_msgSend(v315, "initWithDomain:code:userInfo:", v316, 2, v318);

      }
      v301 = 0;
      v413 = 0;
    }
LABEL_366:

LABEL_375:
  }

LABEL_386:
  v6 = v401;
  v84 = v408;
  v38 = v352;
LABEL_387:
  v54 = v327;
  v210 = v336;

  v9 = v372;
  v20 = v360;
  v124 = v366;
  v138 = v363;
LABEL_388:

LABEL_389:
LABEL_390:

LABEL_391:
  v211 = obj;
LABEL_392:

LABEL_393:
LABEL_394:

  v47 = v339;
LABEL_395:

  v23 = v364;
LABEL_396:

LABEL_397:
LABEL_398:

LABEL_399:
LABEL_400:

LABEL_401:
  v14 = v369;
LABEL_402:

LABEL_403:
LABEL_404:

LABEL_405:
LABEL_406:

  v7 = v412;
LABEL_407:

LABEL_408:
  v141 = v356;
LABEL_409:

LABEL_410:
  a4 = v404;
LABEL_411:

LABEL_412:
  self = v396;
LABEL_413:

LABEL_414:
  v10 = v397;
LABEL_415:

LABEL_416:
LABEL_417:

LABEL_418:
LABEL_419:

  v8 = v409;
LABEL_420:

  v11 = v411;
  v13 = v410;
LABEL_421:

  v71 = v415;
  v72 = v413;
LABEL_422:

LABEL_423:
LABEL_424:

  return v72;
}

- (id)_stateOfMindDomainsJSONArray
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
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindDomains](self, "stateOfMindDomains", 0);
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

- (id)_stateOfMindLabelsJSONArray
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
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLabels](self, "stateOfMindLabels", 0);
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

- (id)_stateOfMindReflectiveIntervalsJSONArray
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
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindReflectiveIntervals](self, "stateOfMindReflectiveIntervals", 0);
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

- (id)_stateOfMindValenceClassificationsJSONArray
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
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceClassifications](self, "stateOfMindValenceClassifications", 0);
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

- (id)_stateOfMindValenceValuesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceValues](self, "stateOfMindValenceValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v92;
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
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
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
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  _QWORD v154[35];
  _QWORD v155[37];

  v155[35] = *MEMORY[0x1E0C80C00];
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasDailyAggregateCallDuration](self, "hasDailyAggregateCallDuration")|| (-[BMMomentsEventDataEventBundleMetadataForRank dailyAggregateCallDuration](self, "dailyAggregateCallDuration"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank dailyAggregateCallDuration](self, "dailyAggregateCallDuration");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank dailyAggregateCallDuration](self, "dailyAggregateCallDuration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasCallDuration](self, "hasCallDuration")
    || (-[BMMomentsEventDataEventBundleMetadataForRank callDuration](self, "callDuration"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank callDuration](self, "callDuration");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank callDuration](self, "callDuration");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasBurstyInteractionCount](self, "hasBurstyInteractionCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyInteractionCount](self, "burstyInteractionCount"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasBurstyOutgoingInteractionCount](self, "hasBurstyOutgoingInteractionCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyOutgoingInteractionCount](self, "burstyOutgoingInteractionCount"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasMultipleInteractionTypes](self, "hasMultipleInteractionTypes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank multipleInteractionTypes](self, "multipleInteractionTypes"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasContactLocationWork](self, "hasContactLocationWork"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank contactLocationWork](self, "contactLocationWork"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsFamilyContact](self, "hasIsFamilyContact"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isFamilyContact](self, "isFamilyContact"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsCoworkerContact](self, "hasIsCoworkerContact"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isCoworkerContact](self, "isCoworkerContact"));
    v153 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v153 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsRepetitiveContact](self, "hasIsRepetitiveContact"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isRepetitiveContact](self, "isRepetitiveContact"));
    v152 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v152 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsGroupConversation](self, "hasIsGroupConversation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isGroupConversation](self, "isGroupConversation"));
    v151 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v151 = 0;
  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountWeightedSum](self, "hasPeopleCountWeightedSum")
    || (-[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedSum](self, "peopleCountWeightedSum"),
        fabs(v14) == INFINITY))
  {
    v150 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedSum](self, "peopleCountWeightedSum");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedSum](self, "peopleCountWeightedSum");
    objc_msgSend(v15, "numberWithDouble:");
    v150 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountWeightedAverage](self, "hasPeopleCountWeightedAverage")|| (-[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedAverage](self, "peopleCountWeightedAverage"), fabs(v16) == INFINITY))
  {
    v149 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedAverage](self, "peopleCountWeightedAverage");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedAverage](self, "peopleCountWeightedAverage");
    objc_msgSend(v17, "numberWithDouble:");
    v149 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountMax](self, "hasPeopleCountMax")
    || (-[BMMomentsEventDataEventBundleMetadataForRank peopleCountMax](self, "peopleCountMax"), fabs(v18) == INFINITY))
  {
    v148 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleCountMax](self, "peopleCountMax");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleCountMax](self, "peopleCountMax");
    objc_msgSend(v19, "numberWithDouble:");
    v148 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedSum](self, "hasPeopleDensityWeightedSum")
    || (-[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedSum](self, "peopleDensityWeightedSum"),
        fabs(v20) == INFINITY))
  {
    v147 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedSum](self, "peopleDensityWeightedSum");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedSum](self, "peopleDensityWeightedSum");
    objc_msgSend(v21, "numberWithDouble:");
    v147 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedAverage](self, "hasPeopleDensityWeightedAverage")|| (-[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedAverage](self, "peopleDensityWeightedAverage"), fabs(v22) == INFINITY))
  {
    v146 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedAverage](self, "peopleDensityWeightedAverage");
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedAverage](self, "peopleDensityWeightedAverage");
    objc_msgSend(v23, "numberWithDouble:");
    v146 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityMax](self, "hasPeopleDensityMax")
    || (-[BMMomentsEventDataEventBundleMetadataForRank peopleDensityMax](self, "peopleDensityMax"), fabs(v24) == INFINITY))
  {
    v145 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityMax](self, "peopleDensityMax");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityMax](self, "peopleDensityMax");
    objc_msgSend(v25, "numberWithDouble:");
    v145 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceSum](self, "hasPeopleDensityWeightedConfidenceSum")|| (-[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceSum](self, "peopleDensityWeightedConfidenceSum"), fabs(v26) == INFINITY))
  {
    v144 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceSum](self, "peopleDensityWeightedConfidenceSum");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceSum](self, "peopleDensityWeightedConfidenceSum");
    objc_msgSend(v27, "numberWithDouble:");
    v144 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceAverage](self, "hasPeopleDensityWeightedConfidenceAverage")|| (-[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceAverage](self, "peopleDensityWeightedConfidenceAverage"), fabs(v28) == INFINITY))
  {
    v143 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceAverage](self, "peopleDensityWeightedConfidenceAverage");
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceAverage](self, "peopleDensityWeightedConfidenceAverage");
    objc_msgSend(v29, "numberWithDouble:");
    v143 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMediaTotalPlayTime](self, "hasMediaTotalPlayTime")
    || (-[BMMomentsEventDataEventBundleMetadataForRank mediaTotalPlayTime](self, "mediaTotalPlayTime"),
        fabs(v30) == INFINITY))
  {
    v142 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank mediaTotalPlayTime](self, "mediaTotalPlayTime");
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank mediaTotalPlayTime](self, "mediaTotalPlayTime");
    objc_msgSend(v31, "numberWithDouble:");
    v142 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMediaLength](self, "hasMediaLength")
    || (-[BMMomentsEventDataEventBundleMetadataForRank mediaLength](self, "mediaLength"), fabs(v32) == INFINITY))
  {
    v141 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank mediaLength](self, "mediaLength");
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank mediaLength](self, "mediaLength");
    objc_msgSend(v33, "numberWithDouble:");
    v141 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasMediaActionIsRepeat](self, "hasMediaActionIsRepeat"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank mediaActionIsRepeat](self, "mediaActionIsRepeat"));
    v140 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v140 = 0;
  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasTimeAtHomeDuration](self, "hasTimeAtHomeDuration")
    || (-[BMMomentsEventDataEventBundleMetadataForRank timeAtHomeDuration](self, "timeAtHomeDuration"),
        fabs(v34) == INFINITY))
  {
    v139 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank timeAtHomeDuration](self, "timeAtHomeDuration");
    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank timeAtHomeDuration](self, "timeAtHomeDuration");
    objc_msgSend(v35, "numberWithDouble:");
    v139 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPhotosAtHomeCurationScore](self, "hasPhotosAtHomeCurationScore")|| (-[BMMomentsEventDataEventBundleMetadataForRank photosAtHomeCurationScore](self, "photosAtHomeCurationScore"), fabs(v36) == INFINITY))
  {
    v138 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank photosAtHomeCurationScore](self, "photosAtHomeCurationScore");
    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank photosAtHomeCurationScore](self, "photosAtHomeCurationScore");
    objc_msgSend(v37, "numberWithDouble:");
    v138 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasWorkoutDuration](self, "hasWorkoutDuration")
    || (-[BMMomentsEventDataEventBundleMetadataForRank workoutDuration](self, "workoutDuration"), fabs(v38) == INFINITY))
  {
    v137 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank workoutDuration](self, "workoutDuration");
    v39 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank workoutDuration](self, "workoutDuration");
    objc_msgSend(v39, "numberWithDouble:");
    v137 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMotionActivityWalkSpan](self, "hasMotionActivityWalkSpan")
    || (-[BMMomentsEventDataEventBundleMetadataForRank motionActivityWalkSpan](self, "motionActivityWalkSpan"),
        fabs(v40) == INFINITY))
  {
    v136 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank motionActivityWalkSpan](self, "motionActivityWalkSpan");
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank motionActivityWalkSpan](self, "motionActivityWalkSpan");
    objc_msgSend(v41, "numberWithDouble:");
    v136 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasVisitDuration](self, "hasVisitDuration")
    || (-[BMMomentsEventDataEventBundleMetadataForRank visitDuration](self, "visitDuration"), fabs(v42) == INFINITY))
  {
    v135 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank visitDuration](self, "visitDuration");
    v43 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank visitDuration](self, "visitDuration");
    objc_msgSend(v43, "numberWithDouble:");
    v135 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPoiCategoryInterestingness](self, "hasPoiCategoryInterestingness")|| (-[BMMomentsEventDataEventBundleMetadataForRank poiCategoryInterestingness](self, "poiCategoryInterestingness"), fabs(v44) == INFINITY))
  {
    v134 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank poiCategoryInterestingness](self, "poiCategoryInterestingness");
    v45 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank poiCategoryInterestingness](self, "poiCategoryInterestingness");
    objc_msgSend(v45, "numberWithDouble:");
    v134 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMMomentsEventDataEventBundleMetadataForRank hasFamiliarityIndex](self, "hasFamiliarityIndex")
    || (-[BMMomentsEventDataEventBundleMetadataForRank familiarityIndex](self, "familiarityIndex"), fabs(v46) == INFINITY))
  {
    v133 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleMetadataForRank familiarityIndex](self, "familiarityIndex");
    v47 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleMetadataForRank familiarityIndex](self, "familiarityIndex");
    objc_msgSend(v47, "numberWithDouble:");
    v133 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMMomentsEventDataEventBundleMetadataForRank _stateOfMindDomainsJSONArray](self, "_stateOfMindDomainsJSONArray");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundleMetadataForRank _stateOfMindLabelsJSONArray](self, "_stateOfMindLabelsJSONArray");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundleMetadataForRank _stateOfMindReflectiveIntervalsJSONArray](self, "_stateOfMindReflectiveIntervalsJSONArray");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundleMetadataForRank _stateOfMindValenceClassificationsJSONArray](self, "_stateOfMindValenceClassificationsJSONArray");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundleMetadataForRank _stateOfMindValenceValuesJSONArray](self, "_stateOfMindValenceValuesJSONArray");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedIn3pApp](self, "hasStateOfMindLoggedIn3pApp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedIn3pApp](self, "stateOfMindLoggedIn3pApp"));
    v127 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v127 = 0;
  }
  if (-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedInJournalApp](self, "hasStateOfMindLoggedInJournalApp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedInJournalApp](self, "stateOfMindLoggedInJournalApp"));
    v126 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v126 = 0;
  }
  v154[0] = CFSTR("dailyAggregateCallDuration");
  v48 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v118 = (void *)v48;
  v155[0] = v48;
  v154[1] = CFSTR("callDuration");
  v49 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v117 = (void *)v49;
  v155[1] = v49;
  v154[2] = CFSTR("burstyInteractionCount");
  v50 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v116 = (void *)v50;
  v155[2] = v50;
  v154[3] = CFSTR("burstyOutgoingInteractionCount");
  v51 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v115 = (void *)v51;
  v155[3] = v51;
  v154[4] = CFSTR("multipleInteractionTypes");
  v52 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v114 = (void *)v52;
  v155[4] = v52;
  v154[5] = CFSTR("contactLocationWork");
  v53 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
  }
  v113 = (void *)v53;
  v155[5] = v53;
  v154[6] = CFSTR("isFamilyContact");
  v54 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  v112 = (void *)v54;
  v155[6] = v54;
  v154[7] = CFSTR("isCoworkerContact");
  v55 = (uint64_t)v153;
  if (!v153)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v56 = v13;
  v155[7] = v55;
  v154[8] = CFSTR("isRepetitiveContact");
  v57 = (uint64_t)v152;
  if (!v152)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = objc_claimAutoreleasedReturnValue();
  }
  v58 = v12;
  v155[8] = v57;
  v154[9] = CFSTR("isGroupConversation");
  v59 = (uint64_t)v151;
  if (!v151)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = objc_claimAutoreleasedReturnValue();
  }
  v60 = v11;
  v121 = (void *)v59;
  v155[9] = v59;
  v154[10] = CFSTR("peopleCountWeightedSum");
  v61 = (uint64_t)v150;
  if (!v150)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = objc_claimAutoreleasedReturnValue();
  }
  v62 = v8;
  v109 = (void *)v61;
  v155[10] = v61;
  v154[11] = CFSTR("peopleCountWeightedAverage");
  v63 = (uint64_t)v149;
  if (!v149)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v63 = objc_claimAutoreleasedReturnValue();
  }
  v64 = v5;
  v120 = (void *)v63;
  v155[11] = v63;
  v154[12] = CFSTR("peopleCountMax");
  v65 = (uint64_t)v148;
  if (!v148)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v65;
  v155[12] = v65;
  v154[13] = CFSTR("peopleDensityWeightedSum");
  v67 = (uint64_t)v147;
  if (!v147)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = objc_claimAutoreleasedReturnValue();
  }
  v108 = (void *)v67;
  v155[13] = v67;
  v154[14] = CFSTR("peopleDensityWeightedAverage");
  v68 = (uint64_t)v146;
  if (!v146)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v68 = objc_claimAutoreleasedReturnValue();
  }
  v107 = (void *)v68;
  v155[14] = v68;
  v154[15] = CFSTR("peopleDensityMax");
  v69 = (uint64_t)v145;
  if (!v145)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = objc_claimAutoreleasedReturnValue();
  }
  v106 = (void *)v69;
  v155[15] = v69;
  v154[16] = CFSTR("peopleDensityWeightedConfidenceSum");
  v70 = (uint64_t)v144;
  if (!v144)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v105 = (void *)v70;
  v155[16] = v70;
  v154[17] = CFSTR("peopleDensityWeightedConfidenceAverage");
  v71 = (uint64_t)v143;
  if (!v143)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v71 = objc_claimAutoreleasedReturnValue();
  }
  v104 = (void *)v71;
  v155[17] = v71;
  v154[18] = CFSTR("mediaTotalPlayTime");
  v72 = (uint64_t)v142;
  if (!v142)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v72 = objc_claimAutoreleasedReturnValue();
  }
  v103 = (void *)v72;
  v155[18] = v72;
  v154[19] = CFSTR("mediaLength");
  v73 = (uint64_t)v141;
  if (!v141)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v73 = objc_claimAutoreleasedReturnValue();
  }
  v102 = (void *)v73;
  v155[19] = v73;
  v154[20] = CFSTR("mediaActionIsRepeat");
  v74 = (uint64_t)v140;
  if (!v140)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v74 = objc_claimAutoreleasedReturnValue();
  }
  v101 = (void *)v74;
  v155[20] = v74;
  v154[21] = CFSTR("timeAtHomeDuration");
  v75 = (uint64_t)v139;
  if (!v139)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v75 = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)v75;
  v155[21] = v75;
  v154[22] = CFSTR("photosAtHomeCurationScore");
  v76 = (uint64_t)v138;
  if (!v138)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v76 = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)v76;
  v155[22] = v76;
  v154[23] = CFSTR("workoutDuration");
  v77 = (uint64_t)v137;
  if (!v137)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v77 = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)v77;
  v155[23] = v77;
  v154[24] = CFSTR("motionActivityWalkSpan");
  v78 = (uint64_t)v136;
  if (!v136)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v78 = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)v78;
  v155[24] = v78;
  v154[25] = CFSTR("visitDuration");
  v79 = (uint64_t)v135;
  if (!v135)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v79 = objc_claimAutoreleasedReturnValue();
  }
  v96 = (void *)v79;
  v155[25] = v79;
  v154[26] = CFSTR("poiCategoryInterestingness");
  v80 = (uint64_t)v134;
  if (!v134)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v80 = objc_claimAutoreleasedReturnValue();
  }
  v123 = v10;
  v95 = (void *)v80;
  v155[26] = v80;
  v154[27] = CFSTR("familiarityIndex");
  v81 = (uint64_t)v133;
  if (!v133)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v81 = objc_claimAutoreleasedReturnValue();
  }
  v110 = (void *)v57;
  v94 = (void *)v81;
  v155[27] = v81;
  v154[28] = CFSTR("stateOfMindDomains");
  v82 = (uint64_t)v132;
  if (!v132)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v82 = objc_claimAutoreleasedReturnValue();
  }
  v124 = v9;
  v125 = v64;
  v92 = v82;
  v155[28] = v82;
  v154[29] = CFSTR("stateOfMindLabels");
  v83 = v131;
  if (!v131)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v82, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,
      v110);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v111 = (void *)v55;
  v122 = v62;
  v155[29] = v83;
  v154[30] = CFSTR("stateOfMindReflectiveIntervals");
  v84 = v130;
  if (!v130)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v85 = v58;
  v155[30] = v84;
  v154[31] = CFSTR("stateOfMindValenceClassifications");
  v86 = v129;
  if (!v129)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v155[31] = v86;
  v154[32] = CFSTR("stateOfMindValenceValues");
  v87 = v128;
  if (!v128)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v155[32] = v87;
  v154[33] = CFSTR("stateOfMindLoggedIn3pApp");
  v88 = v127;
  if (!v127)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v155[33] = v88;
  v154[34] = CFSTR("stateOfMindLoggedInJournalApp");
  v89 = v126;
  if (!v126)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v155[34] = v89;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 35, v92);
  v119 = (id)objc_claimAutoreleasedReturnValue();
  if (!v126)

  v90 = v66;
  if (!v127)
  {

    v90 = v66;
  }
  if (!v128)
  {

    v90 = v66;
  }
  if (!v129)
  {

    v90 = v66;
  }
  if (!v130)
  {

    v90 = v66;
  }
  if (!v131)
  {

    v90 = v66;
  }
  if (!v132)
  {

    v90 = v66;
  }
  if (!v133)
  {

    v90 = v66;
  }
  if (!v134)
  {

    v90 = v66;
  }
  if (!v135)
  {

    v90 = v66;
  }
  if (!v136)
  {

    v90 = v66;
  }
  if (!v137)
  {

    v90 = v66;
  }
  if (!v138)
  {

    v90 = v66;
  }
  if (!v139)
  {

    v90 = v66;
  }
  if (!v140)
  {

    v90 = v66;
  }
  if (!v141)
  {

    v90 = v66;
  }
  if (!v142)
  {

    v90 = v66;
  }
  if (!v143)
  {

    v90 = v66;
  }
  if (!v144)
  {

    v90 = v66;
  }
  if (!v145)
  {

    v90 = v66;
  }
  if (!v146)
  {

    v90 = v66;
  }
  if (!v147)
  {

    v90 = v66;
  }
  if (!v148)

  if (!v149)
  if (!v150)

  if (!v151)
  if (!v152)

  if (v153)
  {
    if (v56)
      goto LABEL_236;
  }
  else
  {

    if (v56)
    {
LABEL_236:
      if (v85)
        goto LABEL_237;
      goto LABEL_245;
    }
  }

  if (v85)
  {
LABEL_237:
    if (v60)
      goto LABEL_238;
    goto LABEL_246;
  }
LABEL_245:

  if (v60)
  {
LABEL_238:
    if (v123)
      goto LABEL_239;
    goto LABEL_247;
  }
LABEL_246:

  if (v123)
  {
LABEL_239:
    if (v124)
      goto LABEL_240;
    goto LABEL_248;
  }
LABEL_247:

  if (v124)
  {
LABEL_240:
    if (v122)
      goto LABEL_241;
LABEL_249:

    if (v125)
      goto LABEL_242;
LABEL_250:

    goto LABEL_242;
  }
LABEL_248:

  if (!v122)
    goto LABEL_249;
LABEL_241:
  if (!v125)
    goto LABEL_250;
LABEL_242:

  return v119;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  int v103;
  _BOOL4 v104;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasDailyAggregateCallDuration](self, "hasDailyAggregateCallDuration")|| objc_msgSend(v5, "hasDailyAggregateCallDuration"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasDailyAggregateCallDuration](self, "hasDailyAggregateCallDuration"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasDailyAggregateCallDuration"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank dailyAggregateCallDuration](self, "dailyAggregateCallDuration");
      v7 = v6;
      objc_msgSend(v5, "dailyAggregateCallDuration");
      if (v7 != v8)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasCallDuration](self, "hasCallDuration")
      || objc_msgSend(v5, "hasCallDuration"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasCallDuration](self, "hasCallDuration"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasCallDuration"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank callDuration](self, "callDuration");
      v10 = v9;
      objc_msgSend(v5, "callDuration");
      if (v10 != v11)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasBurstyInteractionCount](self, "hasBurstyInteractionCount")
      || objc_msgSend(v5, "hasBurstyInteractionCount"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasBurstyInteractionCount](self, "hasBurstyInteractionCount"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasBurstyInteractionCount"))
        goto LABEL_173;
      v12 = -[BMMomentsEventDataEventBundleMetadataForRank burstyInteractionCount](self, "burstyInteractionCount");
      if (v12 != objc_msgSend(v5, "burstyInteractionCount"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasBurstyOutgoingInteractionCount](self, "hasBurstyOutgoingInteractionCount")|| objc_msgSend(v5, "hasBurstyOutgoingInteractionCount"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasBurstyOutgoingInteractionCount](self, "hasBurstyOutgoingInteractionCount"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasBurstyOutgoingInteractionCount"))
        goto LABEL_173;
      v13 = -[BMMomentsEventDataEventBundleMetadataForRank burstyOutgoingInteractionCount](self, "burstyOutgoingInteractionCount");
      if (v13 != objc_msgSend(v5, "burstyOutgoingInteractionCount"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasMultipleInteractionTypes](self, "hasMultipleInteractionTypes")|| objc_msgSend(v5, "hasMultipleInteractionTypes"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMultipleInteractionTypes](self, "hasMultipleInteractionTypes"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasMultipleInteractionTypes"))
        goto LABEL_173;
      v14 = -[BMMomentsEventDataEventBundleMetadataForRank multipleInteractionTypes](self, "multipleInteractionTypes");
      if (v14 != objc_msgSend(v5, "multipleInteractionTypes"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasContactLocationWork](self, "hasContactLocationWork")
      || objc_msgSend(v5, "hasContactLocationWork"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasContactLocationWork](self, "hasContactLocationWork"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasContactLocationWork"))
        goto LABEL_173;
      v15 = -[BMMomentsEventDataEventBundleMetadataForRank contactLocationWork](self, "contactLocationWork");
      if (v15 != objc_msgSend(v5, "contactLocationWork"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsFamilyContact](self, "hasIsFamilyContact")
      || objc_msgSend(v5, "hasIsFamilyContact"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasIsFamilyContact](self, "hasIsFamilyContact"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasIsFamilyContact"))
        goto LABEL_173;
      v16 = -[BMMomentsEventDataEventBundleMetadataForRank isFamilyContact](self, "isFamilyContact");
      if (v16 != objc_msgSend(v5, "isFamilyContact"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsCoworkerContact](self, "hasIsCoworkerContact")
      || objc_msgSend(v5, "hasIsCoworkerContact"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasIsCoworkerContact](self, "hasIsCoworkerContact"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasIsCoworkerContact"))
        goto LABEL_173;
      v17 = -[BMMomentsEventDataEventBundleMetadataForRank isCoworkerContact](self, "isCoworkerContact");
      if (v17 != objc_msgSend(v5, "isCoworkerContact"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsRepetitiveContact](self, "hasIsRepetitiveContact")
      || objc_msgSend(v5, "hasIsRepetitiveContact"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasIsRepetitiveContact](self, "hasIsRepetitiveContact"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasIsRepetitiveContact"))
        goto LABEL_173;
      v18 = -[BMMomentsEventDataEventBundleMetadataForRank isRepetitiveContact](self, "isRepetitiveContact");
      if (v18 != objc_msgSend(v5, "isRepetitiveContact"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasIsGroupConversation](self, "hasIsGroupConversation")
      || objc_msgSend(v5, "hasIsGroupConversation"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasIsGroupConversation](self, "hasIsGroupConversation"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasIsGroupConversation"))
        goto LABEL_173;
      v19 = -[BMMomentsEventDataEventBundleMetadataForRank isGroupConversation](self, "isGroupConversation");
      if (v19 != objc_msgSend(v5, "isGroupConversation"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountWeightedSum](self, "hasPeopleCountWeightedSum")
      || objc_msgSend(v5, "hasPeopleCountWeightedSum"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountWeightedSum](self, "hasPeopleCountWeightedSum"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleCountWeightedSum"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedSum](self, "peopleCountWeightedSum");
      v21 = v20;
      objc_msgSend(v5, "peopleCountWeightedSum");
      if (v21 != v22)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountWeightedAverage](self, "hasPeopleCountWeightedAverage")|| objc_msgSend(v5, "hasPeopleCountWeightedAverage"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountWeightedAverage](self, "hasPeopleCountWeightedAverage"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleCountWeightedAverage"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleCountWeightedAverage](self, "peopleCountWeightedAverage");
      v24 = v23;
      objc_msgSend(v5, "peopleCountWeightedAverage");
      if (v24 != v25)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountMax](self, "hasPeopleCountMax")
      || objc_msgSend(v5, "hasPeopleCountMax"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountMax](self, "hasPeopleCountMax"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleCountMax"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleCountMax](self, "peopleCountMax");
      v27 = v26;
      objc_msgSend(v5, "peopleCountMax");
      if (v27 != v28)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedSum](self, "hasPeopleDensityWeightedSum")|| objc_msgSend(v5, "hasPeopleDensityWeightedSum"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedSum](self, "hasPeopleDensityWeightedSum"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleDensityWeightedSum"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedSum](self, "peopleDensityWeightedSum");
      v30 = v29;
      objc_msgSend(v5, "peopleDensityWeightedSum");
      if (v30 != v31)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedAverage](self, "hasPeopleDensityWeightedAverage")|| objc_msgSend(v5, "hasPeopleDensityWeightedAverage"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedAverage](self, "hasPeopleDensityWeightedAverage"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleDensityWeightedAverage"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedAverage](self, "peopleDensityWeightedAverage");
      v33 = v32;
      objc_msgSend(v5, "peopleDensityWeightedAverage");
      if (v33 != v34)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityMax](self, "hasPeopleDensityMax")
      || objc_msgSend(v5, "hasPeopleDensityMax"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityMax](self, "hasPeopleDensityMax"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleDensityMax"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityMax](self, "peopleDensityMax");
      v36 = v35;
      objc_msgSend(v5, "peopleDensityMax");
      if (v36 != v37)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceSum](self, "hasPeopleDensityWeightedConfidenceSum")|| objc_msgSend(v5, "hasPeopleDensityWeightedConfidenceSum"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceSum](self, "hasPeopleDensityWeightedConfidenceSum"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleDensityWeightedConfidenceSum"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceSum](self, "peopleDensityWeightedConfidenceSum");
      v39 = v38;
      objc_msgSend(v5, "peopleDensityWeightedConfidenceSum");
      if (v39 != v40)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceAverage](self, "hasPeopleDensityWeightedConfidenceAverage")|| objc_msgSend(v5, "hasPeopleDensityWeightedConfidenceAverage"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceAverage](self, "hasPeopleDensityWeightedConfidenceAverage"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasPeopleDensityWeightedConfidenceAverage"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank peopleDensityWeightedConfidenceAverage](self, "peopleDensityWeightedConfidenceAverage");
      v42 = v41;
      objc_msgSend(v5, "peopleDensityWeightedConfidenceAverage");
      if (v42 != v43)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasMediaTotalPlayTime](self, "hasMediaTotalPlayTime")
      || objc_msgSend(v5, "hasMediaTotalPlayTime"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMediaTotalPlayTime](self, "hasMediaTotalPlayTime"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasMediaTotalPlayTime"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank mediaTotalPlayTime](self, "mediaTotalPlayTime");
      v45 = v44;
      objc_msgSend(v5, "mediaTotalPlayTime");
      if (v45 != v46)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasMediaLength](self, "hasMediaLength")
      || objc_msgSend(v5, "hasMediaLength"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMediaLength](self, "hasMediaLength"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasMediaLength"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank mediaLength](self, "mediaLength");
      v48 = v47;
      objc_msgSend(v5, "mediaLength");
      if (v48 != v49)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasMediaActionIsRepeat](self, "hasMediaActionIsRepeat")
      || objc_msgSend(v5, "hasMediaActionIsRepeat"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMediaActionIsRepeat](self, "hasMediaActionIsRepeat"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasMediaActionIsRepeat"))
        goto LABEL_173;
      v50 = -[BMMomentsEventDataEventBundleMetadataForRank mediaActionIsRepeat](self, "mediaActionIsRepeat");
      if (v50 != objc_msgSend(v5, "mediaActionIsRepeat"))
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasTimeAtHomeDuration](self, "hasTimeAtHomeDuration")
      || objc_msgSend(v5, "hasTimeAtHomeDuration"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasTimeAtHomeDuration](self, "hasTimeAtHomeDuration"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasTimeAtHomeDuration"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank timeAtHomeDuration](self, "timeAtHomeDuration");
      v52 = v51;
      objc_msgSend(v5, "timeAtHomeDuration");
      if (v52 != v53)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPhotosAtHomeCurationScore](self, "hasPhotosAtHomeCurationScore")|| objc_msgSend(v5, "hasPhotosAtHomeCurationScore"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPhotosAtHomeCurationScore](self, "hasPhotosAtHomeCurationScore"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasPhotosAtHomeCurationScore"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank photosAtHomeCurationScore](self, "photosAtHomeCurationScore");
      v55 = v54;
      objc_msgSend(v5, "photosAtHomeCurationScore");
      if (v55 != v56)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasWorkoutDuration](self, "hasWorkoutDuration")
      || objc_msgSend(v5, "hasWorkoutDuration"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasWorkoutDuration](self, "hasWorkoutDuration"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasWorkoutDuration"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank workoutDuration](self, "workoutDuration");
      v58 = v57;
      objc_msgSend(v5, "workoutDuration");
      if (v58 != v59)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasMotionActivityWalkSpan](self, "hasMotionActivityWalkSpan")
      || objc_msgSend(v5, "hasMotionActivityWalkSpan"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasMotionActivityWalkSpan](self, "hasMotionActivityWalkSpan"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasMotionActivityWalkSpan"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank motionActivityWalkSpan](self, "motionActivityWalkSpan");
      v61 = v60;
      objc_msgSend(v5, "motionActivityWalkSpan");
      if (v61 != v62)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasVisitDuration](self, "hasVisitDuration")
      || objc_msgSend(v5, "hasVisitDuration"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasVisitDuration](self, "hasVisitDuration"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasVisitDuration"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank visitDuration](self, "visitDuration");
      v64 = v63;
      objc_msgSend(v5, "visitDuration");
      if (v64 != v65)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPoiCategoryInterestingness](self, "hasPoiCategoryInterestingness")|| objc_msgSend(v5, "hasPoiCategoryInterestingness"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasPoiCategoryInterestingness](self, "hasPoiCategoryInterestingness"))goto LABEL_173;
      if (!objc_msgSend(v5, "hasPoiCategoryInterestingness"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank poiCategoryInterestingness](self, "poiCategoryInterestingness");
      v67 = v66;
      objc_msgSend(v5, "poiCategoryInterestingness");
      if (v67 != v68)
        goto LABEL_173;
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasFamiliarityIndex](self, "hasFamiliarityIndex")
      || objc_msgSend(v5, "hasFamiliarityIndex"))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasFamiliarityIndex](self, "hasFamiliarityIndex"))
        goto LABEL_173;
      if (!objc_msgSend(v5, "hasFamiliarityIndex"))
        goto LABEL_173;
      -[BMMomentsEventDataEventBundleMetadataForRank familiarityIndex](self, "familiarityIndex");
      v70 = v69;
      objc_msgSend(v5, "familiarityIndex");
      if (v70 != v71)
        goto LABEL_173;
    }
    -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindDomains](self, "stateOfMindDomains");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateOfMindDomains");
    v73 = objc_claimAutoreleasedReturnValue();
    if (v72 == (void *)v73)
    {

    }
    else
    {
      v74 = (void *)v73;
      -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindDomains](self, "stateOfMindDomains");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateOfMindDomains");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v75, "isEqual:", v76);

      if (!v77)
        goto LABEL_173;
    }
    -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLabels](self, "stateOfMindLabels");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateOfMindLabels");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v79 == (void *)v80)
    {

    }
    else
    {
      v81 = (void *)v80;
      -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLabels](self, "stateOfMindLabels");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateOfMindLabels");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v82, "isEqual:", v83);

      if (!v84)
        goto LABEL_173;
    }
    -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindReflectiveIntervals](self, "stateOfMindReflectiveIntervals");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateOfMindReflectiveIntervals");
    v86 = objc_claimAutoreleasedReturnValue();
    if (v85 == (void *)v86)
    {

    }
    else
    {
      v87 = (void *)v86;
      -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindReflectiveIntervals](self, "stateOfMindReflectiveIntervals");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateOfMindReflectiveIntervals");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v88, "isEqual:", v89);

      if (!v90)
        goto LABEL_173;
    }
    -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceClassifications](self, "stateOfMindValenceClassifications");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateOfMindValenceClassifications");
    v92 = objc_claimAutoreleasedReturnValue();
    if (v91 == (void *)v92)
    {

    }
    else
    {
      v93 = (void *)v92;
      -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceClassifications](self, "stateOfMindValenceClassifications");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateOfMindValenceClassifications");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v94, "isEqual:", v95);

      if (!v96)
        goto LABEL_173;
    }
    -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceValues](self, "stateOfMindValenceValues");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateOfMindValenceValues");
    v98 = objc_claimAutoreleasedReturnValue();
    if (v97 == (void *)v98)
    {

    }
    else
    {
      v99 = (void *)v98;
      -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindValenceValues](self, "stateOfMindValenceValues");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateOfMindValenceValues");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v100, "isEqual:", v101);

      if (!v102)
        goto LABEL_173;
    }
    if (!-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedIn3pApp](self, "hasStateOfMindLoggedIn3pApp")&& !objc_msgSend(v5, "hasStateOfMindLoggedIn3pApp")|| -[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedIn3pApp](self, "hasStateOfMindLoggedIn3pApp")&& objc_msgSend(v5, "hasStateOfMindLoggedIn3pApp")&& (v103 = -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedIn3pApp](self, "stateOfMindLoggedIn3pApp"), v103 == objc_msgSend(v5, "stateOfMindLoggedIn3pApp")))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedInJournalApp](self, "hasStateOfMindLoggedInJournalApp")&& !objc_msgSend(v5, "hasStateOfMindLoggedInJournalApp"))
      {
        LOBYTE(v78) = 1;
        goto LABEL_174;
      }
      if (-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedInJournalApp](self, "hasStateOfMindLoggedInJournalApp")&& objc_msgSend(v5, "hasStateOfMindLoggedInJournalApp"))
      {
        v104 = -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedInJournalApp](self, "stateOfMindLoggedInJournalApp");
        v78 = v104 ^ objc_msgSend(v5, "stateOfMindLoggedInJournalApp") ^ 1;
LABEL_174:

        goto LABEL_175;
      }
    }
LABEL_173:
    LOBYTE(v78) = 0;
    goto LABEL_174;
  }
  LOBYTE(v78) = 0;
LABEL_175:

  return v78;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)dailyAggregateCallDuration
{
  return self->_dailyAggregateCallDuration;
}

- (BOOL)hasDailyAggregateCallDuration
{
  return self->_hasDailyAggregateCallDuration;
}

- (void)setHasDailyAggregateCallDuration:(BOOL)a3
{
  self->_hasDailyAggregateCallDuration = a3;
}

- (double)callDuration
{
  return self->_callDuration;
}

- (BOOL)hasCallDuration
{
  return self->_hasCallDuration;
}

- (void)setHasCallDuration:(BOOL)a3
{
  self->_hasCallDuration = a3;
}

- (int)burstyInteractionCount
{
  return self->_burstyInteractionCount;
}

- (BOOL)hasBurstyInteractionCount
{
  return self->_hasBurstyInteractionCount;
}

- (void)setHasBurstyInteractionCount:(BOOL)a3
{
  self->_hasBurstyInteractionCount = a3;
}

- (int)burstyOutgoingInteractionCount
{
  return self->_burstyOutgoingInteractionCount;
}

- (BOOL)hasBurstyOutgoingInteractionCount
{
  return self->_hasBurstyOutgoingInteractionCount;
}

- (void)setHasBurstyOutgoingInteractionCount:(BOOL)a3
{
  self->_hasBurstyOutgoingInteractionCount = a3;
}

- (BOOL)multipleInteractionTypes
{
  return self->_multipleInteractionTypes;
}

- (BOOL)hasMultipleInteractionTypes
{
  return self->_hasMultipleInteractionTypes;
}

- (void)setHasMultipleInteractionTypes:(BOOL)a3
{
  self->_hasMultipleInteractionTypes = a3;
}

- (BOOL)contactLocationWork
{
  return self->_contactLocationWork;
}

- (BOOL)hasContactLocationWork
{
  return self->_hasContactLocationWork;
}

- (void)setHasContactLocationWork:(BOOL)a3
{
  self->_hasContactLocationWork = a3;
}

- (BOOL)isFamilyContact
{
  return self->_isFamilyContact;
}

- (BOOL)hasIsFamilyContact
{
  return self->_hasIsFamilyContact;
}

- (void)setHasIsFamilyContact:(BOOL)a3
{
  self->_hasIsFamilyContact = a3;
}

- (BOOL)isCoworkerContact
{
  return self->_isCoworkerContact;
}

- (BOOL)hasIsCoworkerContact
{
  return self->_hasIsCoworkerContact;
}

- (void)setHasIsCoworkerContact:(BOOL)a3
{
  self->_hasIsCoworkerContact = a3;
}

- (BOOL)isRepetitiveContact
{
  return self->_isRepetitiveContact;
}

- (BOOL)hasIsRepetitiveContact
{
  return self->_hasIsRepetitiveContact;
}

- (void)setHasIsRepetitiveContact:(BOOL)a3
{
  self->_hasIsRepetitiveContact = a3;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (BOOL)hasIsGroupConversation
{
  return self->_hasIsGroupConversation;
}

- (void)setHasIsGroupConversation:(BOOL)a3
{
  self->_hasIsGroupConversation = a3;
}

- (double)peopleCountWeightedSum
{
  return self->_peopleCountWeightedSum;
}

- (BOOL)hasPeopleCountWeightedSum
{
  return self->_hasPeopleCountWeightedSum;
}

- (void)setHasPeopleCountWeightedSum:(BOOL)a3
{
  self->_hasPeopleCountWeightedSum = a3;
}

- (double)peopleCountWeightedAverage
{
  return self->_peopleCountWeightedAverage;
}

- (BOOL)hasPeopleCountWeightedAverage
{
  return self->_hasPeopleCountWeightedAverage;
}

- (void)setHasPeopleCountWeightedAverage:(BOOL)a3
{
  self->_hasPeopleCountWeightedAverage = a3;
}

- (double)peopleCountMax
{
  return self->_peopleCountMax;
}

- (BOOL)hasPeopleCountMax
{
  return self->_hasPeopleCountMax;
}

- (void)setHasPeopleCountMax:(BOOL)a3
{
  self->_hasPeopleCountMax = a3;
}

- (double)peopleDensityWeightedSum
{
  return self->_peopleDensityWeightedSum;
}

- (BOOL)hasPeopleDensityWeightedSum
{
  return self->_hasPeopleDensityWeightedSum;
}

- (void)setHasPeopleDensityWeightedSum:(BOOL)a3
{
  self->_hasPeopleDensityWeightedSum = a3;
}

- (double)peopleDensityWeightedAverage
{
  return self->_peopleDensityWeightedAverage;
}

- (BOOL)hasPeopleDensityWeightedAverage
{
  return self->_hasPeopleDensityWeightedAverage;
}

- (void)setHasPeopleDensityWeightedAverage:(BOOL)a3
{
  self->_hasPeopleDensityWeightedAverage = a3;
}

- (double)peopleDensityMax
{
  return self->_peopleDensityMax;
}

- (BOOL)hasPeopleDensityMax
{
  return self->_hasPeopleDensityMax;
}

- (void)setHasPeopleDensityMax:(BOOL)a3
{
  self->_hasPeopleDensityMax = a3;
}

- (double)peopleDensityWeightedConfidenceSum
{
  return self->_peopleDensityWeightedConfidenceSum;
}

- (BOOL)hasPeopleDensityWeightedConfidenceSum
{
  return self->_hasPeopleDensityWeightedConfidenceSum;
}

- (void)setHasPeopleDensityWeightedConfidenceSum:(BOOL)a3
{
  self->_hasPeopleDensityWeightedConfidenceSum = a3;
}

- (double)peopleDensityWeightedConfidenceAverage
{
  return self->_peopleDensityWeightedConfidenceAverage;
}

- (BOOL)hasPeopleDensityWeightedConfidenceAverage
{
  return self->_hasPeopleDensityWeightedConfidenceAverage;
}

- (void)setHasPeopleDensityWeightedConfidenceAverage:(BOOL)a3
{
  self->_hasPeopleDensityWeightedConfidenceAverage = a3;
}

- (double)mediaTotalPlayTime
{
  return self->_mediaTotalPlayTime;
}

- (BOOL)hasMediaTotalPlayTime
{
  return self->_hasMediaTotalPlayTime;
}

- (void)setHasMediaTotalPlayTime:(BOOL)a3
{
  self->_hasMediaTotalPlayTime = a3;
}

- (double)mediaLength
{
  return self->_mediaLength;
}

- (BOOL)hasMediaLength
{
  return self->_hasMediaLength;
}

- (void)setHasMediaLength:(BOOL)a3
{
  self->_hasMediaLength = a3;
}

- (BOOL)mediaActionIsRepeat
{
  return self->_mediaActionIsRepeat;
}

- (BOOL)hasMediaActionIsRepeat
{
  return self->_hasMediaActionIsRepeat;
}

- (void)setHasMediaActionIsRepeat:(BOOL)a3
{
  self->_hasMediaActionIsRepeat = a3;
}

- (double)timeAtHomeDuration
{
  return self->_timeAtHomeDuration;
}

- (BOOL)hasTimeAtHomeDuration
{
  return self->_hasTimeAtHomeDuration;
}

- (void)setHasTimeAtHomeDuration:(BOOL)a3
{
  self->_hasTimeAtHomeDuration = a3;
}

- (double)photosAtHomeCurationScore
{
  return self->_photosAtHomeCurationScore;
}

- (BOOL)hasPhotosAtHomeCurationScore
{
  return self->_hasPhotosAtHomeCurationScore;
}

- (void)setHasPhotosAtHomeCurationScore:(BOOL)a3
{
  self->_hasPhotosAtHomeCurationScore = a3;
}

- (double)workoutDuration
{
  return self->_workoutDuration;
}

- (BOOL)hasWorkoutDuration
{
  return self->_hasWorkoutDuration;
}

- (void)setHasWorkoutDuration:(BOOL)a3
{
  self->_hasWorkoutDuration = a3;
}

- (double)motionActivityWalkSpan
{
  return self->_motionActivityWalkSpan;
}

- (BOOL)hasMotionActivityWalkSpan
{
  return self->_hasMotionActivityWalkSpan;
}

- (void)setHasMotionActivityWalkSpan:(BOOL)a3
{
  self->_hasMotionActivityWalkSpan = a3;
}

- (double)visitDuration
{
  return self->_visitDuration;
}

- (BOOL)hasVisitDuration
{
  return self->_hasVisitDuration;
}

- (void)setHasVisitDuration:(BOOL)a3
{
  self->_hasVisitDuration = a3;
}

- (double)poiCategoryInterestingness
{
  return self->_poiCategoryInterestingness;
}

- (BOOL)hasPoiCategoryInterestingness
{
  return self->_hasPoiCategoryInterestingness;
}

- (void)setHasPoiCategoryInterestingness:(BOOL)a3
{
  self->_hasPoiCategoryInterestingness = a3;
}

- (double)familiarityIndex
{
  return self->_familiarityIndex;
}

- (BOOL)hasFamiliarityIndex
{
  return self->_hasFamiliarityIndex;
}

- (void)setHasFamiliarityIndex:(BOOL)a3
{
  self->_hasFamiliarityIndex = a3;
}

- (NSArray)stateOfMindDomains
{
  return self->_stateOfMindDomains;
}

- (NSArray)stateOfMindLabels
{
  return self->_stateOfMindLabels;
}

- (NSArray)stateOfMindReflectiveIntervals
{
  return self->_stateOfMindReflectiveIntervals;
}

- (NSArray)stateOfMindValenceClassifications
{
  return self->_stateOfMindValenceClassifications;
}

- (NSArray)stateOfMindValenceValues
{
  return self->_stateOfMindValenceValues;
}

- (BOOL)stateOfMindLoggedIn3pApp
{
  return self->_stateOfMindLoggedIn3pApp;
}

- (BOOL)hasStateOfMindLoggedIn3pApp
{
  return self->_hasStateOfMindLoggedIn3pApp;
}

- (void)setHasStateOfMindLoggedIn3pApp:(BOOL)a3
{
  self->_hasStateOfMindLoggedIn3pApp = a3;
}

- (BOOL)stateOfMindLoggedInJournalApp
{
  return self->_stateOfMindLoggedInJournalApp;
}

- (BOOL)hasStateOfMindLoggedInJournalApp
{
  return self->_hasStateOfMindLoggedInJournalApp;
}

- (void)setHasStateOfMindLoggedInJournalApp:(BOOL)a3
{
  self->_hasStateOfMindLoggedInJournalApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateOfMindValenceValues, 0);
  objc_storeStrong((id *)&self->_stateOfMindValenceClassifications, 0);
  objc_storeStrong((id *)&self->_stateOfMindReflectiveIntervals, 0);
  objc_storeStrong((id *)&self->_stateOfMindLabels, 0);
  objc_storeStrong((id *)&self->_stateOfMindDomains, 0);
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

    v4 = -[BMMomentsEventDataEventBundleMetadataForRank initByReadFrom:]([BMMomentsEventDataEventBundleMetadataForRank alloc], "initByReadFrom:", v7);
    v4[14] = 0;

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
  void *v8;
  id v10;
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
  _QWORD v39[37];

  v39[35] = *MEMORY[0x1E0C80C00];
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dailyAggregateCallDuration"), 1, 0, 1, 1, 0);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("callDuration"), 1, 0, 2, 1, 0);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("burstyInteractionCount"), 0, 0, 3, 2, 0);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("burstyOutgoingInteractionCount"), 0, 0, 4, 2, 0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("multipleInteractionTypes"), 0, 0, 5, 12, 0);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contactLocationWork"), 0, 0, 6, 12, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFamilyContact"), 0, 0, 7, 12, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCoworkerContact"), 0, 0, 8, 12, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRepetitiveContact"), 0, 0, 9, 12, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isGroupConversation"), 0, 0, 10, 12, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleCountWeightedSum"), 1, 0, 11, 1, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleCountWeightedAverage"), 1, 0, 12, 1, 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleCountMax"), 1, 0, 13, 1, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleDensityWeightedSum"), 1, 0, 14, 1, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleDensityWeightedAverage"), 1, 0, 15, 1, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleDensityMax"), 1, 0, 16, 1, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleDensityWeightedConfidenceSum"), 1, 0, 17, 1, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("peopleDensityWeightedConfidenceAverage"), 1, 0, 18, 1, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaTotalPlayTime"), 1, 0, 19, 1, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaLength"), 1, 0, 20, 1, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaActionIsRepeat"), 0, 0, 21, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeAtHomeDuration"), 1, 0, 22, 1, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("photosAtHomeCurationScore"), 1, 0, 23, 1, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("workoutDuration"), 1, 0, 24, 1, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("motionActivityWalkSpan"), 1, 0, 25, 1, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visitDuration"), 1, 0, 26, 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("poiCategoryInterestingness"), 1, 0, 27, 1, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("familiarityIndex"), 1, 0, 28, 1, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("stateOfMindDomains_json"), 5, 1, &__block_literal_global_2433);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("stateOfMindLabels_json"), 5, 1, &__block_literal_global_2434);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("stateOfMindReflectiveIntervals_json"), 5, 1, &__block_literal_global_2435);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("stateOfMindValenceClassifications_json"), 5, 1, &__block_literal_global_2436);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("stateOfMindValenceValues_json"), 5, 1, &__block_literal_global_2437);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stateOfMindLoggedIn3pApp"), 0, 0, 34, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stateOfMindLoggedInJournalApp"), 0, 0, 35, 12, 0);
  v39[0] = v38;
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v35;
  v39[4] = v34;
  v39[5] = v33;
  v39[6] = v32;
  v39[7] = v31;
  v39[8] = v30;
  v39[9] = v29;
  v39[10] = v28;
  v39[11] = v27;
  v39[12] = v26;
  v39[13] = v25;
  v39[14] = v24;
  v39[15] = v23;
  v39[16] = v22;
  v39[17] = v21;
  v39[18] = v20;
  v39[19] = v18;
  v39[20] = v17;
  v39[21] = v16;
  v39[22] = v15;
  v39[23] = v14;
  v39[24] = v19;
  v39[25] = v2;
  v39[26] = v3;
  v39[27] = v4;
  v39[28] = v13;
  v39[29] = v12;
  v39[30] = v5;
  v39[31] = v6;
  v39[32] = v11;
  v39[33] = v7;
  v39[34] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 35);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A770;
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
  id v13;
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
  _QWORD v39[37];

  v39[35] = *MEMORY[0x1E0C80C00];
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dailyAggregateCallDuration"), 1, 1, 0);
  v39[0] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("callDuration"), 2, 1, 0);
  v39[1] = v37;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("burstyInteractionCount"), 3, 2, 0);
  v39[2] = v36;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("burstyOutgoingInteractionCount"), 4, 2, 0);
  v39[3] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("multipleInteractionTypes"), 5, 12, 0);
  v39[4] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactLocationWork"), 6, 12, 0);
  v39[5] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFamilyContact"), 7, 12, 0);
  v39[6] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCoworkerContact"), 8, 12, 0);
  v39[7] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRepetitiveContact"), 9, 12, 0);
  v39[8] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isGroupConversation"), 10, 12, 0);
  v39[9] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleCountWeightedSum"), 11, 1, 0);
  v39[10] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleCountWeightedAverage"), 12, 1, 0);
  v39[11] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleCountMax"), 13, 1, 0);
  v39[12] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleDensityWeightedSum"), 14, 1, 0);
  v39[13] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleDensityWeightedAverage"), 15, 1, 0);
  v39[14] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleDensityMax"), 16, 1, 0);
  v39[15] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleDensityWeightedConfidenceSum"), 17, 1, 0);
  v39[16] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("peopleDensityWeightedConfidenceAverage"), 18, 1, 0);
  v39[17] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaTotalPlayTime"), 19, 1, 0);
  v39[18] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaLength"), 20, 1, 0);
  v39[19] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaActionIsRepeat"), 21, 12, 0);
  v39[20] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeAtHomeDuration"), 22, 1, 0);
  v39[21] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("photosAtHomeCurationScore"), 23, 1, 0);
  v39[22] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("workoutDuration"), 24, 1, 0);
  v39[23] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("motionActivityWalkSpan"), 25, 1, 0);
  v39[24] = v14;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visitDuration"), 26, 1, 0);
  v39[25] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("poiCategoryInterestingness"), 27, 1, 0);
  v39[26] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("familiarityIndex"), 28, 1, 0);
  v39[27] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOfMindDomains"), 29, 4, 0);
  v39[28] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOfMindLabels"), 30, 4, 0);
  v39[29] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOfMindReflectiveIntervals"), 31, 4, 0);
  v39[30] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOfMindValenceClassifications"), 32, 4, 0);
  v39[31] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOfMindValenceValues"), 33, 0, 0);
  v39[32] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOfMindLoggedIn3pApp"), 34, 12, 0);
  v39[33] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateOfMindLoggedInJournalApp"), 35, 12, 0);
  v39[34] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 35);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateOfMindValenceValuesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateOfMindValenceClassificationsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateOfMindReflectiveIntervalsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateOfMindLabelsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stateOfMindDomainsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
