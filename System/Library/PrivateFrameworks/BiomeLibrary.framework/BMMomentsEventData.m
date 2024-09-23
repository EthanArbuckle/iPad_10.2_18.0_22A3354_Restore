@implementation BMMomentsEventData

- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9 startDate:(id)a10 endDate:(id)a11 categoryOfEvent:(id)a12 bundleInterface:(id)a13 bundleEvergreenType:(id)a14 sugSeetEngType:(id)a15 appEntryEngType:(id)a16 megaSignalTypeUsed:(id)a17 viewVisibleSuggestionsCount:(id)a18 viewTotalSuggestionsCount:(id)a19 onboardingFlowCompletionState:(int)a20 isJournalAppInstalled:(id)a21 isJournalAppLocked:(id)a22 isJournalSuggestionSkipped:(id)a23 isActivitySettingsSwitchEnabled:(id)a24 isCommunicationSettingsSwitchEnabled:(id)a25 isSignificantLocationSettingsSwitchEnabled:(id)a26 isMediaSettingsSwitchEnabled:(id)a27 isNearbyPeopleSettingsSwitchEnabled:(id)a28 isPhotoSettingsSwitchEnabled:(id)a29 isStateOfMindSettingsSwitchEnabled:(id)a30 isReflectionSettingsSwitchEnabled:(id)a31 isBroadSystemLocationSettingsSwitchEnabled:(id)a32
{
  id v35;
  id v36;
  id v37;
  id v38;
  BMMomentsEventData *v39;
  int v40;
  double v41;
  double v42;
  int v43;
  int v44;
  id v47;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v73;
  objc_super v74;

  v57 = a3;
  v47 = a4;
  v56 = a4;
  v35 = a5;
  v68 = a6;
  v73 = a7;
  v71 = a10;
  v65 = a11;
  v55 = a12;
  v54 = a13;
  v53 = a14;
  v52 = a15;
  v51 = a16;
  v50 = a17;
  v69 = a18;
  v70 = a19;
  v67 = a21;
  v66 = a22;
  v36 = a23;
  v64 = a24;
  v63 = a25;
  v62 = a26;
  v61 = a27;
  v60 = a28;
  v59 = a29;
  v58 = a30;
  v37 = a31;
  v38 = a32;
  v74.receiver = self;
  v74.super_class = (Class)BMMomentsEventData;
  v39 = -[BMEventBase init](&v74, sel_init);
  if (v39)
  {
    v39->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v39->_event, a3);
    objc_storeStrong((id *)&v39->_bundle, v47);
    if (v35)
    {
      v39->_hasIsBundle = 1;
      v39->_isBundle = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v35 = 0;
      v39->_hasIsBundle = 0;
      v39->_isBundle = 0;
    }
    if (v68)
    {
      v39->_hasIHAState = 1;
      v39->_IHAState = objc_msgSend(v68, "BOOLValue");
    }
    else
    {
      v39->_hasIHAState = 0;
      v39->_IHAState = 0;
    }
    if (v73)
    {
      v39->_hasAge = 1;
      v40 = objc_msgSend(v73, "intValue");
    }
    else
    {
      v39->_hasAge = 0;
      v40 = -1;
    }
    v39->_age = v40;
    v39->_ageRange = a8;
    v39->_biologicalSex = a9;
    if (v71)
    {
      v39->_hasRaw_startDate = 1;
      objc_msgSend(v71, "timeIntervalSince1970");
    }
    else
    {
      v39->_hasRaw_startDate = 0;
      v41 = -1.0;
    }
    v39->_raw_startDate = v41;
    if (v65)
    {
      v39->_hasRaw_endDate = 1;
      objc_msgSend(v65, "timeIntervalSince1970");
    }
    else
    {
      v39->_hasRaw_endDate = 0;
      v42 = -1.0;
    }
    v39->_raw_endDate = v42;
    objc_storeStrong((id *)&v39->_categoryOfEvent, a12);
    objc_storeStrong((id *)&v39->_bundleInterface, a13);
    objc_storeStrong((id *)&v39->_bundleEvergreenType, a14);
    objc_storeStrong((id *)&v39->_sugSeetEngType, a15);
    objc_storeStrong((id *)&v39->_appEntryEngType, a16);
    objc_storeStrong((id *)&v39->_megaSignalTypeUsed, a17);
    if (v69)
    {
      v39->_hasViewVisibleSuggestionsCount = 1;
      v43 = objc_msgSend(v69, "intValue");
    }
    else
    {
      v39->_hasViewVisibleSuggestionsCount = 0;
      v43 = -1;
    }
    v39->_viewVisibleSuggestionsCount = v43;
    if (v70)
    {
      v39->_hasViewTotalSuggestionsCount = 1;
      v44 = objc_msgSend(v70, "intValue");
    }
    else
    {
      v39->_hasViewTotalSuggestionsCount = 0;
      v44 = -1;
    }
    v39->_viewTotalSuggestionsCount = v44;
    v39->_onboardingFlowCompletionState = a20;
    if (v67)
    {
      v39->_hasIsJournalAppInstalled = 1;
      v39->_isJournalAppInstalled = objc_msgSend(v67, "BOOLValue");
    }
    else
    {
      v39->_hasIsJournalAppInstalled = 0;
      v39->_isJournalAppInstalled = 0;
    }
    if (v66)
    {
      v39->_hasIsJournalAppLocked = 1;
      v39->_isJournalAppLocked = objc_msgSend(v66, "BOOLValue");
    }
    else
    {
      v39->_hasIsJournalAppLocked = 0;
      v39->_isJournalAppLocked = 0;
    }
    if (v36)
    {
      v39->_hasIsJournalSuggestionSkipped = 1;
      v39->_isJournalSuggestionSkipped = objc_msgSend(v36, "BOOLValue");
    }
    else
    {
      v39->_hasIsJournalSuggestionSkipped = 0;
      v39->_isJournalSuggestionSkipped = 0;
    }
    if (v64)
    {
      v39->_hasIsActivitySettingsSwitchEnabled = 1;
      v39->_isActivitySettingsSwitchEnabled = objc_msgSend(v64, "BOOLValue");
    }
    else
    {
      v39->_hasIsActivitySettingsSwitchEnabled = 0;
      v39->_isActivitySettingsSwitchEnabled = 0;
    }
    if (v63)
    {
      v39->_hasIsCommunicationSettingsSwitchEnabled = 1;
      v39->_isCommunicationSettingsSwitchEnabled = objc_msgSend(v63, "BOOLValue");
    }
    else
    {
      v39->_hasIsCommunicationSettingsSwitchEnabled = 0;
      v39->_isCommunicationSettingsSwitchEnabled = 0;
    }
    if (v62)
    {
      v39->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
      v39->_isSignificantLocationSettingsSwitchEnabled = objc_msgSend(v62, "BOOLValue");
    }
    else
    {
      v39->_hasIsSignificantLocationSettingsSwitchEnabled = 0;
      v39->_isSignificantLocationSettingsSwitchEnabled = 0;
    }
    if (v61)
    {
      v39->_hasIsMediaSettingsSwitchEnabled = 1;
      v39->_isMediaSettingsSwitchEnabled = objc_msgSend(v61, "BOOLValue");
    }
    else
    {
      v39->_hasIsMediaSettingsSwitchEnabled = 0;
      v39->_isMediaSettingsSwitchEnabled = 0;
    }
    if (v60)
    {
      v39->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
      v39->_isNearbyPeopleSettingsSwitchEnabled = objc_msgSend(v60, "BOOLValue");
    }
    else
    {
      v39->_hasIsNearbyPeopleSettingsSwitchEnabled = 0;
      v39->_isNearbyPeopleSettingsSwitchEnabled = 0;
    }
    if (v59)
    {
      v39->_hasIsPhotoSettingsSwitchEnabled = 1;
      v39->_isPhotoSettingsSwitchEnabled = objc_msgSend(v59, "BOOLValue");
    }
    else
    {
      v39->_hasIsPhotoSettingsSwitchEnabled = 0;
      v39->_isPhotoSettingsSwitchEnabled = 0;
    }
    if (v58)
    {
      v39->_hasIsStateOfMindSettingsSwitchEnabled = 1;
      v39->_isStateOfMindSettingsSwitchEnabled = objc_msgSend(v58, "BOOLValue");
    }
    else
    {
      v39->_hasIsStateOfMindSettingsSwitchEnabled = 0;
      v39->_isStateOfMindSettingsSwitchEnabled = 0;
    }
    if (v37)
    {
      v39->_hasIsReflectionSettingsSwitchEnabled = 1;
      v39->_isReflectionSettingsSwitchEnabled = objc_msgSend(v37, "BOOLValue");
    }
    else
    {
      v39->_hasIsReflectionSettingsSwitchEnabled = 0;
      v39->_isReflectionSettingsSwitchEnabled = 0;
    }
    if (v38)
    {
      v39->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
      v39->_isBroadSystemLocationSettingsSwitchEnabled = objc_msgSend(v38, "BOOLValue");
    }
    else
    {
      v39->_hasIsBroadSystemLocationSettingsSwitchEnabled = 0;
      v39->_isBroadSystemLocationSettingsSwitchEnabled = 0;
    }
  }

  return v39;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMomentsEventData event](self, "event");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData bundle](self, "bundle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isBundle](self, "isBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData IHAState](self, "IHAState"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData age](self, "age"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataAgeRangeTypeAsString(-[BMMomentsEventData ageRange](self, "ageRange"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataBiologicalSexTypeAsString(-[BMMomentsEventData biologicalSex](self, "biologicalSex"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData startDate](self, "startDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData endDate](self, "endDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData categoryOfEvent](self, "categoryOfEvent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData bundleInterface](self, "bundleInterface");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData bundleEvergreenType](self, "bundleEvergreenType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData sugSeetEngType](self, "sugSeetEngType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData appEntryEngType](self, "appEntryEngType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData megaSignalTypeUsed](self, "megaSignalTypeUsed");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataOnboardingFlowCompletionAsString(-[BMMomentsEventData onboardingFlowCompletionState](self, "onboardingFlowCompletionState"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isJournalAppInstalled](self, "isJournalAppInstalled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isJournalAppLocked](self, "isJournalAppLocked"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMMomentsEventData with event: %@, bundle: %@, isBundle: %@, IHAState: %@, age: %@, ageRange: %@, biologicalSex: %@, startDate: %@, endDate: %@, categoryOfEvent: %@, bundleInterface: %@, bundleEvergreenType: %@, sugSeetEngType: %@, appEntryEngType: %@, megaSignalTypeUsed: %@, viewVisibleSuggestionsCount: %@, viewTotalSuggestionsCount: %@, onboardingFlowCompletionState: %@, isJournalAppInstalled: %@, isJournalAppLocked: %@, isJournalSuggestionSkipped: %@, isActivitySettingsSwitchEnabled: %@, isCommunicationSettingsSwitchEnabled: %@, isSignificantLocationSettingsSwitchEnabled: %@, isMediaSettingsSwitchEnabled: %@, isNearbyPeopleSettingsSwitchEnabled: %@, isPhotoSettingsSwitchEnabled: %@, isStateOfMindSettingsSwitchEnabled: %@, isReflectionSettingsSwitchEnabled: %@, isBroadSystemLocationSettingsSwitchEnabled: %@"), v35, v33, v34, v30, v32, v28, v31, v27, v26, v29, v24, v25, v23, v17, v22, v16,
                  v21,
                  v15,
                  v20,
                  v14,
                  v13,
                  v12,
                  v11,
                  v10,
                  v9,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEventData *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
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
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  objc_class *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  char v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  char v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  char v118;
  unsigned int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char v124;
  char v125;
  unsigned int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  char v138;
  char v139;
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char v145;
  char v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char v152;
  char v153;
  unsigned int v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char v159;
  char v160;
  unsigned int v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char v166;
  BOOL v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  BMMomentsEventData *v172;
  objc_super v174;
  uint64_t v175;
  uint64_t v176;

  v4 = a3;
  v174.receiver = self;
  v174.super_class = (Class)BMMomentsEventData;
  v5 = -[BMEventBase init](&v174, sel_init);
  if (!v5)
    goto LABEL_280;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v175 = 0;
          v176 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_279;
          v20 = -[BMMomentsEventDataEvent initByReadFrom:]([BMMomentsEventDataEvent alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_279;
          v21 = 112;
          goto LABEL_28;
        case 2u:
          v175 = 0;
          v176 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_279;
          v20 = -[BMMomentsEventDataEventBundle initByReadFrom:]([BMMomentsEventDataEventBundle alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_279;
          v21 = 120;
LABEL_28:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasIsBundle = 1;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  v25 = 0;
                  goto LABEL_185;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v25 = 0;
LABEL_185:
          v167 = v25 != 0;
          v168 = 48;
          goto LABEL_270;
        case 4u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasIHAState = 1;
          while (2)
          {
            v33 = *v6;
            v34 = *(_QWORD *)&v4[v33];
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
              *(_QWORD *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  v32 = 0;
                  goto LABEL_189;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v32 = 0;
LABEL_189:
          v167 = v32 != 0;
          v168 = 50;
          goto LABEL_270;
        case 5u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasAge = 1;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
              *(_QWORD *)&v4[v40] = v42;
              v39 |= (unint64_t)(v43 & 0x7F) << v37;
              if (v43 < 0)
              {
                v37 += 7;
                v17 = v38++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v39) = 0;
LABEL_193:
          v169 = 84;
          goto LABEL_214;
        case 6u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          while (2)
          {
            v47 = *v6;
            v48 = *(_QWORD *)&v4[v47];
            v49 = v48 + 1;
            if (v48 == -1 || v49 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
              *(_QWORD *)&v4[v47] = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v46) = 0;
LABEL_197:
          if (v46 >= 7)
            LODWORD(v46) = 0;
          v170 = 88;
          goto LABEL_221;
        case 7u:
          v51 = 0;
          v52 = 0;
          v46 = 0;
          while (2)
          {
            v53 = *v6;
            v54 = *(_QWORD *)&v4[v53];
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v54);
              *(_QWORD *)&v4[v53] = v55;
              v46 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                v17 = v52++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_203;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v46) = 0;
LABEL_203:
          if (v46 >= 4)
            LODWORD(v46) = 0;
          v170 = 92;
          goto LABEL_221;
        case 8u:
          v5->_hasRaw_startDate = 1;
          v57 = *v6;
          v58 = *(_QWORD *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v59 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v58);
            *(_QWORD *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v59 = 0;
          }
          v171 = 24;
          goto LABEL_277;
        case 9u:
          v5->_hasRaw_endDate = 1;
          v60 = *v6;
          v61 = *(_QWORD *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v59 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v61);
            *(_QWORD *)&v4[v60] = v61 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v59 = 0;
          }
          v171 = 40;
LABEL_277:
          *(Class *)((char *)&v5->super.super.isa + v171) = v59;
          continue;
        case 0xAu:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = 128;
          goto LABEL_76;
        case 0xBu:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = 136;
          goto LABEL_76;
        case 0xCu:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = 144;
          goto LABEL_76;
        case 0xDu:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = 152;
          goto LABEL_76;
        case 0xEu:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = 160;
          goto LABEL_76;
        case 0xFu:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = 168;
LABEL_76:
          v64 = *(Class *)((char *)&v5->super.super.isa + v63);
          *(Class *)((char *)&v5->super.super.isa + v63) = (Class)v62;

          continue;
        case 0x10u:
          v65 = 0;
          v66 = 0;
          v39 = 0;
          v5->_hasViewVisibleSuggestionsCount = 1;
          while (2)
          {
            v67 = *v6;
            v68 = *(_QWORD *)&v4[v67];
            v69 = v68 + 1;
            if (v68 == -1 || v69 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v70 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v68);
              *(_QWORD *)&v4[v67] = v69;
              v39 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                v17 = v66++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v39) = 0;
LABEL_209:
          v169 = 96;
          goto LABEL_214;
        case 0x11u:
          v71 = 0;
          v72 = 0;
          v39 = 0;
          v5->_hasViewTotalSuggestionsCount = 1;
          while (2)
          {
            v73 = *v6;
            v74 = *(_QWORD *)&v4[v73];
            v75 = v74 + 1;
            if (v74 == -1 || v75 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v76 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v74);
              *(_QWORD *)&v4[v73] = v75;
              v39 |= (unint64_t)(v76 & 0x7F) << v71;
              if (v76 < 0)
              {
                v71 += 7;
                v17 = v72++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v39) = 0;
LABEL_213:
          v169 = 100;
LABEL_214:
          *(_DWORD *)((char *)&v5->super.super.isa + v169) = v39;
          continue;
        case 0x12u:
          v77 = 0;
          v78 = 0;
          v46 = 0;
          while (2)
          {
            v79 = *v6;
            v80 = *(_QWORD *)&v4[v79];
            v81 = v80 + 1;
            if (v80 == -1 || v81 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v82 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v80);
              *(_QWORD *)&v4[v79] = v81;
              v46 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                v17 = v78++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_218;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v46) = 0;
LABEL_218:
          if (v46 >= 5)
            LODWORD(v46) = 0;
          v170 = 104;
LABEL_221:
          *(_DWORD *)((char *)&v5->super.super.isa + v170) = v46;
          continue;
        case 0x13u:
          v83 = 0;
          v84 = 0;
          v85 = 0;
          v5->_hasIsJournalAppInstalled = 1;
          while (2)
          {
            v86 = *v6;
            v87 = *(_QWORD *)&v4[v86];
            v88 = v87 + 1;
            if (v87 == -1 || v88 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v89 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v87);
              *(_QWORD *)&v4[v86] = v88;
              v85 |= (unint64_t)(v89 & 0x7F) << v83;
              if (v89 < 0)
              {
                v83 += 7;
                v17 = v84++ >= 9;
                if (v17)
                {
                  v85 = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v85 = 0;
LABEL_225:
          v167 = v85 != 0;
          v168 = 55;
          goto LABEL_270;
        case 0x14u:
          v90 = 0;
          v91 = 0;
          v92 = 0;
          v5->_hasIsJournalAppLocked = 1;
          while (2)
          {
            v93 = *v6;
            v94 = *(_QWORD *)&v4[v93];
            v95 = v94 + 1;
            if (v94 == -1 || v95 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v96 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v94);
              *(_QWORD *)&v4[v93] = v95;
              v92 |= (unint64_t)(v96 & 0x7F) << v90;
              if (v96 < 0)
              {
                v90 += 7;
                v17 = v91++ >= 9;
                if (v17)
                {
                  v92 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v92 = 0;
LABEL_229:
          v167 = v92 != 0;
          v168 = 57;
          goto LABEL_270;
        case 0x15u:
          v97 = 0;
          v98 = 0;
          v99 = 0;
          v5->_hasIsJournalSuggestionSkipped = 1;
          while (2)
          {
            v100 = *v6;
            v101 = *(_QWORD *)&v4[v100];
            v102 = v101 + 1;
            if (v101 == -1 || v102 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v101);
              *(_QWORD *)&v4[v100] = v102;
              v99 |= (unint64_t)(v103 & 0x7F) << v97;
              if (v103 < 0)
              {
                v97 += 7;
                v17 = v98++ >= 9;
                if (v17)
                {
                  v99 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v99 = 0;
LABEL_233:
          v167 = v99 != 0;
          v168 = 59;
          goto LABEL_270;
        case 0x16u:
          v104 = 0;
          v105 = 0;
          v106 = 0;
          v5->_hasIsActivitySettingsSwitchEnabled = 1;
          while (2)
          {
            v107 = *v6;
            v108 = *(_QWORD *)&v4[v107];
            v109 = v108 + 1;
            if (v108 == -1 || v109 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v110 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v108);
              *(_QWORD *)&v4[v107] = v109;
              v106 |= (unint64_t)(v110 & 0x7F) << v104;
              if (v110 < 0)
              {
                v104 += 7;
                v17 = v105++ >= 9;
                if (v17)
                {
                  v106 = 0;
                  goto LABEL_237;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v106 = 0;
LABEL_237:
          v167 = v106 != 0;
          v168 = 61;
          goto LABEL_270;
        case 0x17u:
          v111 = 0;
          v112 = 0;
          v113 = 0;
          v5->_hasIsCommunicationSettingsSwitchEnabled = 1;
          while (2)
          {
            v114 = *v6;
            v115 = *(_QWORD *)&v4[v114];
            v116 = v115 + 1;
            if (v115 == -1 || v116 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v117 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v115);
              *(_QWORD *)&v4[v114] = v116;
              v113 |= (unint64_t)(v117 & 0x7F) << v111;
              if (v117 < 0)
              {
                v111 += 7;
                v17 = v112++ >= 9;
                if (v17)
                {
                  v113 = 0;
                  goto LABEL_241;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v113 = 0;
LABEL_241:
          v167 = v113 != 0;
          v168 = 63;
          goto LABEL_270;
        case 0x18u:
          v118 = 0;
          v119 = 0;
          v120 = 0;
          v5->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
          while (2)
          {
            v121 = *v6;
            v122 = *(_QWORD *)&v4[v121];
            v123 = v122 + 1;
            if (v122 == -1 || v123 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v124 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v122);
              *(_QWORD *)&v4[v121] = v123;
              v120 |= (unint64_t)(v124 & 0x7F) << v118;
              if (v124 < 0)
              {
                v118 += 7;
                v17 = v119++ >= 9;
                if (v17)
                {
                  v120 = 0;
                  goto LABEL_245;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v120 = 0;
LABEL_245:
          v167 = v120 != 0;
          v168 = 65;
          goto LABEL_270;
        case 0x19u:
          v125 = 0;
          v126 = 0;
          v127 = 0;
          v5->_hasIsMediaSettingsSwitchEnabled = 1;
          while (2)
          {
            v128 = *v6;
            v129 = *(_QWORD *)&v4[v128];
            v130 = v129 + 1;
            if (v129 == -1 || v130 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v131 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v129);
              *(_QWORD *)&v4[v128] = v130;
              v127 |= (unint64_t)(v131 & 0x7F) << v125;
              if (v131 < 0)
              {
                v125 += 7;
                v17 = v126++ >= 9;
                if (v17)
                {
                  v127 = 0;
                  goto LABEL_249;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v127 = 0;
LABEL_249:
          v167 = v127 != 0;
          v168 = 67;
          goto LABEL_270;
        case 0x1Au:
          v132 = 0;
          v133 = 0;
          v134 = 0;
          v5->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
          while (2)
          {
            v135 = *v6;
            v136 = *(_QWORD *)&v4[v135];
            v137 = v136 + 1;
            if (v136 == -1 || v137 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v138 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v136);
              *(_QWORD *)&v4[v135] = v137;
              v134 |= (unint64_t)(v138 & 0x7F) << v132;
              if (v138 < 0)
              {
                v132 += 7;
                v17 = v133++ >= 9;
                if (v17)
                {
                  v134 = 0;
                  goto LABEL_253;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v134 = 0;
LABEL_253:
          v167 = v134 != 0;
          v168 = 69;
          goto LABEL_270;
        case 0x1Bu:
          v139 = 0;
          v140 = 0;
          v141 = 0;
          v5->_hasIsPhotoSettingsSwitchEnabled = 1;
          while (2)
          {
            v142 = *v6;
            v143 = *(_QWORD *)&v4[v142];
            v144 = v143 + 1;
            if (v143 == -1 || v144 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v145 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v143);
              *(_QWORD *)&v4[v142] = v144;
              v141 |= (unint64_t)(v145 & 0x7F) << v139;
              if (v145 < 0)
              {
                v139 += 7;
                v17 = v140++ >= 9;
                if (v17)
                {
                  v141 = 0;
                  goto LABEL_257;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v141 = 0;
LABEL_257:
          v167 = v141 != 0;
          v168 = 71;
          goto LABEL_270;
        case 0x1Cu:
          v146 = 0;
          v147 = 0;
          v148 = 0;
          v5->_hasIsStateOfMindSettingsSwitchEnabled = 1;
          while (2)
          {
            v149 = *v6;
            v150 = *(_QWORD *)&v4[v149];
            v151 = v150 + 1;
            if (v150 == -1 || v151 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v152 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v150);
              *(_QWORD *)&v4[v149] = v151;
              v148 |= (unint64_t)(v152 & 0x7F) << v146;
              if (v152 < 0)
              {
                v146 += 7;
                v17 = v147++ >= 9;
                if (v17)
                {
                  v148 = 0;
                  goto LABEL_261;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v148 = 0;
LABEL_261:
          v167 = v148 != 0;
          v168 = 73;
          goto LABEL_270;
        case 0x1Du:
          v153 = 0;
          v154 = 0;
          v155 = 0;
          v5->_hasIsReflectionSettingsSwitchEnabled = 1;
          while (2)
          {
            v156 = *v6;
            v157 = *(_QWORD *)&v4[v156];
            v158 = v157 + 1;
            if (v157 == -1 || v158 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v159 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v157);
              *(_QWORD *)&v4[v156] = v158;
              v155 |= (unint64_t)(v159 & 0x7F) << v153;
              if (v159 < 0)
              {
                v153 += 7;
                v17 = v154++ >= 9;
                if (v17)
                {
                  v155 = 0;
                  goto LABEL_265;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v155 = 0;
LABEL_265:
          v167 = v155 != 0;
          v168 = 75;
          goto LABEL_270;
        case 0x1Eu:
          v160 = 0;
          v161 = 0;
          v162 = 0;
          v5->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_279;
          continue;
      }
      while (1)
      {
        v163 = *v6;
        v164 = *(_QWORD *)&v4[v163];
        v165 = v164 + 1;
        if (v164 == -1 || v165 > *(_QWORD *)&v4[*v7])
          break;
        v166 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v164);
        *(_QWORD *)&v4[v163] = v165;
        v162 |= (unint64_t)(v166 & 0x7F) << v160;
        if ((v166 & 0x80) == 0)
          goto LABEL_267;
        v160 += 7;
        v17 = v161++ >= 9;
        if (v17)
        {
          v162 = 0;
          goto LABEL_269;
        }
      }
      v4[*v8] = 1;
LABEL_267:
      if (v4[*v8])
        v162 = 0;
LABEL_269:
      v167 = v162 != 0;
      v168 = 77;
LABEL_270:
      *((_BYTE *)&v5->super.super.isa + v168) = v167;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_279:
    v172 = 0;
  else
LABEL_280:
    v172 = v5;

  return v172;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_event)
  {
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataEvent writeTo:](self->_event, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_bundle)
  {
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataEventBundle writeTo:](self->_bundle, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasIsBundle)
    PBDataWriterWriteBOOLField();
  if (self->_hasIHAState)
    PBDataWriterWriteBOOLField();
  if (self->_hasAge)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_startDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_endDate)
    PBDataWriterWriteDoubleField();
  if (self->_categoryOfEvent)
    PBDataWriterWriteStringField();
  if (self->_bundleInterface)
    PBDataWriterWriteStringField();
  if (self->_bundleEvergreenType)
    PBDataWriterWriteStringField();
  if (self->_sugSeetEngType)
    PBDataWriterWriteStringField();
  if (self->_appEntryEngType)
    PBDataWriterWriteStringField();
  if (self->_megaSignalTypeUsed)
    PBDataWriterWriteStringField();
  if (self->_hasViewVisibleSuggestionsCount)
    PBDataWriterWriteInt32Field();
  if (self->_hasViewTotalSuggestionsCount)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsJournalAppInstalled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsJournalAppLocked)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsJournalSuggestionSkipped)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsActivitySettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsCommunicationSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsSignificantLocationSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMediaSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsNearbyPeopleSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsPhotoSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsStateOfMindSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsReflectionSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsBroadSystemLocationSettingsSwitchEnabled)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventData writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  BMMomentsEventDataEvent *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BMMomentsEventData *v16;
  id v17;
  BMMomentsEventData *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  BMMomentsEventDataEvent *v24;
  id v25;
  BMMomentsEventData *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  id v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  uint64_t v111;
  id v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  id v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  id v149;
  uint64_t v150;
  int v151;
  void *v152;
  void *v153;
  id v155;
  uint64_t v156;
  id v157;
  void *v158;
  uint64_t v159;
  void *v160;
  id v161;
  uint64_t v162;
  id v163;
  void *v164;
  uint64_t v165;
  void *v166;
  id v167;
  uint64_t v168;
  id v169;
  void *v170;
  uint64_t v171;
  void *v172;
  id v173;
  uint64_t v174;
  id v175;
  void *v176;
  uint64_t v177;
  void *v178;
  id v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  id v183;
  void *v184;
  uint64_t v185;
  void *v186;
  id v187;
  uint64_t v188;
  id v189;
  void *v190;
  uint64_t v191;
  void *v192;
  id v193;
  uint64_t v194;
  id v195;
  void *v196;
  uint64_t v197;
  void *v198;
  id v199;
  uint64_t v200;
  id v201;
  void *v202;
  uint64_t v203;
  void *v204;
  id v205;
  uint64_t v206;
  id v207;
  void *v208;
  uint64_t v209;
  void *v210;
  id v211;
  uint64_t v212;
  id v213;
  void *v214;
  uint64_t v215;
  void *v216;
  id v217;
  uint64_t v218;
  id v219;
  void *v220;
  uint64_t v221;
  void *v222;
  id v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  uint64_t v245;
  id v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  void *v251;
  id v252;
  id v253;
  void *v254;
  void *v255;
  id v256;
  id v257;
  void *v258;
  void *v259;
  id v260;
  void *v261;
  id v262;
  void *v263;
  void *v264;
  void *v265;
  id v266;
  void *v267;
  id v268;
  id v269;
  void *v270;
  void *v271;
  void *v272;
  id v273;
  void *v274;
  void *v275;
  void *v276;
  id v277;
  void *v278;
  void *v279;
  id v280;
  void *v281;
  void *v282;
  id v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  id v288;
  void *v289;
  void *v290;
  id v291;
  id *v292;
  id v293;
  id v294;
  void *v295;
  void *v296;
  id v297;
  void *v298;
  BMMomentsEventData *v299;
  id v300;
  BMMomentsEventDataEvent *v301;
  BMMomentsEventDataEventBundle *v302;
  void *v303;
  void *v304;
  id v305;
  void *v306;
  id v307;
  id v308;
  uint64_t v309;
  void *v310;
  uint64_t v311;
  void *v312;
  uint64_t v313;
  id v314;
  uint64_t v315;
  id v316;
  uint64_t v317;
  id v318;
  uint64_t v319;
  void *v320;
  uint64_t v321;
  id v322;
  uint64_t v323;
  id v324;
  uint64_t v325;
  id v326;
  uint64_t v327;
  id v328;
  uint64_t v329;
  void *v330;
  uint64_t v331;
  id v332;
  uint64_t v333;
  id v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  id v338;
  uint64_t v339;
  id v340;
  uint64_t v341;
  id v342;
  uint64_t v343;
  void *v344;
  uint64_t v345;
  id v346;
  uint64_t v347;
  void *v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  void *v352;
  uint64_t v353;
  void *v354;
  uint64_t v355;
  id v356;
  uint64_t v357;
  id v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  uint64_t v365;
  BMMomentsEventDataEventBundle *v366;
  uint64_t v367;
  _QWORD v368[3];

  v368[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("event"));
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v306 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v308 = 0;
    v305 = v306;
    v7 = -[BMMomentsEventDataEvent initWithJSONDictionary:error:]([BMMomentsEventDataEvent alloc], "initWithJSONDictionary:error:", v305, &v308);
    v12 = v308;
    if (v12)
    {
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

LABEL_39:
      v16 = 0;
      goto LABEL_242;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle"));
    v305 = (id)objc_claimAutoreleasedReturnValue();
    if (!v305 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v301 = v7;
      v302 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v305;
      v307 = 0;
      v302 = -[BMMomentsEventDataEventBundle initWithJSONDictionary:error:]([BMMomentsEventDataEventBundle alloc], "initWithJSONDictionary:error:", v8, &v307);
      v14 = v307;
      if (v14)
      {
        v15 = v14;
        if (a4)
          *a4 = objc_retainAutorelease(v14);

        v16 = 0;
        goto LABEL_241;
      }
      v301 = v7;

LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBundle"));
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      v299 = self;
      if (v304 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v8 = 0;
            v16 = 0;
LABEL_240:

            v7 = v301;
            goto LABEL_241;
          }
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v31 = *MEMORY[0x1E0D025B8];
          v363 = *MEMORY[0x1E0CB2D50];
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBundle"));
          v364 = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v364, &v363, 1);
          v303 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 0;
          v16 = 0;
          *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v303);
          goto LABEL_239;
        }
        v8 = v304;
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IHAState"));
      v300 = v8;
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v303 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v297 = 0;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v297 = v303;
LABEL_13:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("age"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v298 = v9;
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v292 = a4;
          v293 = 0;
LABEL_16:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ageRange"));
          v10 = objc_claimAutoreleasedReturnValue();
          v296 = (void *)v10;
          if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v294 = v11;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v292)
                {
                  v294 = 0;
                  v16 = 0;
                  v32 = v297;
                  v37 = v293;
                  goto LABEL_237;
                }
                v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v89 = *MEMORY[0x1E0D025B8];
                v357 = *MEMORY[0x1E0CB2D50];
                v291 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("ageRange"));
                v358 = v291;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v358, &v357, 1);
                v290 = (void *)objc_claimAutoreleasedReturnValue();
                v294 = 0;
                v16 = 0;
                *v292 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                goto LABEL_250;
              }
              v43 = v11;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataAgeRangeTypeFromString(v43));
              v294 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          else
          {
            v294 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("biologicalSex"));
          v44 = objc_claimAutoreleasedReturnValue();
          v290 = (void *)v44;
          if (!v44 || (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v291 = 0;
            goto LABEL_61;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v291 = v45;
LABEL_60:

LABEL_61:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startDate"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v289 = v47;
            if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v288 = 0;
              goto LABEL_64;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v55 = v47;
              v56 = objc_alloc(MEMORY[0x1E0C99D68]);
              objc_msgSend(v55, "doubleValue");
              v288 = (id)objc_msgSend(v56, "initWithTimeIntervalSince1970:");

              goto LABEL_64;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v64 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
              v65 = v47;
              objc_msgSend(v64, "dateFromString:", v65);
              v288 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_64;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v288 = v47;
LABEL_64:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endDate"));
              v48 = objc_claimAutoreleasedReturnValue();
              v286 = (void *)v48;
              if (!v48 || (v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v50 = 0;
                goto LABEL_67;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = v49;
                v58 = objc_alloc(MEMORY[0x1E0C99D68]);
                objc_msgSend(v57, "doubleValue");
                v50 = (id)objc_msgSend(v58, "initWithTimeIntervalSince1970:");

                goto LABEL_67;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v66 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                v67 = v49;
                objc_msgSend(v66, "dateFromString:", v67);
                v50 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_67;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v50 = v49;
LABEL_67:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("categoryOfEvent"));
                v51 = objc_claimAutoreleasedReturnValue();
                v285 = (void *)v51;
                v287 = v50;
                if (!v51 || (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v53 = 0;
LABEL_70:
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleInterface"));
                  v295 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v295)
                  {
                    v283 = 0;
                    v54 = v53;
                    goto LABEL_82;
                  }
                  objc_opt_class();
                  v54 = v53;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v283 = 0;
                    goto LABEL_82;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v283 = v295;
LABEL_82:
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleEvergreenType"));
                    v59 = objc_claimAutoreleasedReturnValue();
                    v282 = (void *)v59;
                    if (!v59 || (v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v61 = 0;
                      goto LABEL_85;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v61 = v60;
LABEL_85:
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sugSeetEngType"));
                      v284 = (void *)objc_claimAutoreleasedReturnValue();
                      v281 = v61;
                      if (!v284 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v62 = v54;
                        v280 = 0;
                        goto LABEL_88;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v62 = v54;
                        v280 = v284;
LABEL_88:
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appEntryEngType"));
                        v63 = (id)objc_claimAutoreleasedReturnValue();
                        v279 = v63;
                        if (v63)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v63 = 0;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                v72 = 0;
                                v16 = 0;
                                v32 = v297;
                                v37 = v293;
                                v54 = v62;
                                goto LABEL_229;
                              }
                              v95 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v96 = *MEMORY[0x1E0D025B8];
                              v341 = *MEMORY[0x1E0CB2D50];
                              v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appEntryEngType"));
                              v342 = v71;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v342, &v341, 1);
                              v278 = (void *)objc_claimAutoreleasedReturnValue();
                              v97 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2);
                              v72 = 0;
                              v16 = 0;
                              *v292 = v97;
                              v32 = v297;
                              v37 = v293;
                              v54 = v62;
                              goto LABEL_228;
                            }
                            v63 = v63;
                          }
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("megaSignalTypeUsed"));
                        v68 = objc_claimAutoreleasedReturnValue();
                        v278 = (void *)v68;
                        if (v68)
                        {
                          v69 = (void *)v68;
                          objc_opt_class();
                          v70 = v69;
                          v54 = v62;
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v71 = 0;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                v71 = 0;
                                v16 = 0;
                                v32 = v297;
                                v37 = v293;
                                v72 = v63;
                                goto LABEL_228;
                              }
                              v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v99 = *MEMORY[0x1E0D025B8];
                              v339 = *MEMORY[0x1E0CB2D50];
                              v277 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("megaSignalTypeUsed"));
                              v340 = v277;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v340, &v339, 1);
                              v100 = objc_claimAutoreleasedReturnValue();
                              v101 = v98;
                              v75 = (void *)v100;
                              v71 = 0;
                              v16 = 0;
                              *v292 = (id)objc_msgSend(v101, "initWithDomain:code:userInfo:", v99, 2, v100);
                              v32 = v297;
                              v37 = v293;
                              v72 = v63;
LABEL_227:

LABEL_228:
                              v47 = v289;
                              goto LABEL_229;
                            }
                            v71 = v70;
                          }
                          v72 = v63;
                        }
                        else
                        {
                          v71 = 0;
                          v72 = v63;
                          v54 = v62;
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewVisibleSuggestionsCount"));
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        v275 = v72;
                        if (v75)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v272 = v54;
                            v76 = v72;
                            v77 = v71;
                            v277 = 0;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                v277 = 0;
                                v16 = 0;
                                v32 = v297;
                                v37 = v293;
                                goto LABEL_227;
                              }
                              v102 = v71;
                              v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v104 = *MEMORY[0x1E0D025B8];
                              v337 = *MEMORY[0x1E0CB2D50];
                              v105 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v231 = objc_opt_class();
                              v106 = v105;
                              v9 = v298;
                              v82 = (id)objc_msgSend(v106, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v231, CFSTR("viewVisibleSuggestionsCount"));
                              v338 = v82;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v338, &v337, 1);
                              v107 = objc_claimAutoreleasedReturnValue();
                              v108 = v103;
                              v71 = v102;
                              v72 = v275;
                              v276 = (void *)v107;
                              v277 = 0;
                              v16 = 0;
                              *v292 = (id)objc_msgSend(v108, "initWithDomain:code:userInfo:", v104, 2);
                              v32 = v297;
                              v37 = v293;
                              goto LABEL_226;
                            }
                            v272 = v54;
                            v76 = v72;
                            v77 = v71;
                            v277 = v75;
                          }
                        }
                        else
                        {
                          v272 = v54;
                          v76 = v72;
                          v277 = 0;
                          v77 = v71;
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewTotalSuggestionsCount"));
                        v80 = objc_claimAutoreleasedReturnValue();
                        v276 = (void *)v80;
                        v274 = v77;
                        if (v80 && (v81 = (void *)v80, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              v82 = 0;
                              v16 = 0;
                              v32 = v297;
                              v37 = v293;
                              v71 = v77;
                              v72 = v76;
                              v54 = v272;
                              goto LABEL_226;
                            }
                            v109 = v75;
                            v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v111 = *MEMORY[0x1E0D025B8];
                            v335 = *MEMORY[0x1E0CB2D50];
                            v112 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v232 = objc_opt_class();
                            v113 = v112;
                            v9 = v298;
                            v114 = objc_msgSend(v113, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v232, CFSTR("viewTotalSuggestionsCount"));
                            v336 = v114;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v336, &v335, 1);
                            v115 = objc_claimAutoreleasedReturnValue();
                            v116 = v110;
                            v75 = v109;
                            v117 = (void *)v114;
                            v72 = v275;
                            v270 = (void *)v115;
                            v82 = 0;
                            v16 = 0;
                            *v292 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v111, 2);
                            v32 = v297;
                            v37 = v293;
                            v54 = v272;
LABEL_225:

                            v71 = v274;
LABEL_226:

                            goto LABEL_227;
                          }
                          v82 = v81;
                        }
                        else
                        {
                          v82 = 0;
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onboardingFlowCompletionState"));
                        v83 = objc_claimAutoreleasedReturnValue();
                        v270 = (void *)v83;
                        v271 = v75;
                        v269 = v82;
                        if (v83 && (v84 = (void *)v83, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v85 = v84;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                v117 = 0;
                                v16 = 0;
                                v32 = v297;
                                v37 = v293;
                                v54 = v272;
                                v72 = v275;
                                goto LABEL_225;
                              }
                              v179 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v180 = *MEMORY[0x1E0D025B8];
                              v333 = *MEMORY[0x1E0CB2D50];
                              v268 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("onboardingFlowCompletionState"));
                              v334 = v268;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v334, &v333, 1);
                              v267 = (void *)objc_claimAutoreleasedReturnValue();
                              v117 = 0;
                              v16 = 0;
                              *v292 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v180, 2);
                              v32 = v297;
                              v37 = v293;
                              v75 = v271;
                              v54 = v272;
                              v72 = v275;
                              goto LABEL_224;
                            }
                            v122 = v84;
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataOnboardingFlowCompletionFromString(v122));
                            v85 = (id)objc_claimAutoreleasedReturnValue();

                          }
                          v76 = v275;
                        }
                        else
                        {
                          v85 = 0;
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isJournalAppInstalled"));
                        v123 = objc_claimAutoreleasedReturnValue();
                        v267 = (void *)v123;
                        if (v123 && (v124 = (void *)v123, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              v268 = 0;
                              v16 = 0;
                              v32 = v297;
                              v37 = v293;
                              v72 = v76;
                              v117 = v85;
                              v75 = v271;
                              v54 = v272;
                              goto LABEL_224;
                            }
                            v117 = v85;
                            v155 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v156 = *MEMORY[0x1E0D025B8];
                            v331 = *MEMORY[0x1E0CB2D50];
                            v157 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v233 = objc_opt_class();
                            v158 = v157;
                            v9 = v298;
                            v266 = (id)objc_msgSend(v158, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v233, CFSTR("isJournalAppInstalled"));
                            v332 = v266;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v332, &v331, 1);
                            v159 = objc_claimAutoreleasedReturnValue();
                            v160 = v155;
                            v75 = v271;
                            v72 = v275;
                            v265 = (void *)v159;
                            v16 = 0;
                            v268 = 0;
                            *v292 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v156, 2);
                            v32 = v297;
                            v37 = v293;
                            v54 = v272;
LABEL_223:

LABEL_224:
                            goto LABEL_225;
                          }
                          v268 = v124;
                        }
                        else
                        {
                          v268 = 0;
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isJournalAppLocked"));
                        v125 = objc_claimAutoreleasedReturnValue();
                        v265 = (void *)v125;
                        if (v125 && (v126 = (void *)v125, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              v266 = 0;
                              v16 = 0;
                              v32 = v297;
                              v37 = v293;
                              v72 = v76;
                              v117 = v85;
                              v75 = v271;
                              v54 = v272;
                              goto LABEL_223;
                            }
                            v117 = v85;
                            v161 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v162 = *MEMORY[0x1E0D025B8];
                            v329 = *MEMORY[0x1E0CB2D50];
                            v163 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v234 = objc_opt_class();
                            v164 = v163;
                            v9 = v298;
                            v264 = (void *)objc_msgSend(v164, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v234, CFSTR("isJournalAppLocked"));
                            v330 = v264;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
                            v165 = objc_claimAutoreleasedReturnValue();
                            v166 = v161;
                            v75 = v271;
                            v72 = v275;
                            v263 = (void *)v165;
                            v16 = 0;
                            v266 = 0;
                            *v292 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v162, 2);
                            v32 = v297;
                            v37 = v293;
                            v54 = v272;
                            goto LABEL_222;
                          }
                          v266 = v126;
                        }
                        else
                        {
                          v266 = 0;
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isJournalSuggestionSkipped"));
                        v127 = objc_claimAutoreleasedReturnValue();
                        v263 = (void *)v127;
                        if (v127 && (v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              v264 = 0;
                              v16 = 0;
                              v32 = v297;
                              v37 = v293;
                              v72 = v76;
                              v117 = v85;
                              v75 = v271;
                              v54 = v272;
                              goto LABEL_222;
                            }
                            v117 = v85;
                            v167 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v168 = *MEMORY[0x1E0D025B8];
                            v327 = *MEMORY[0x1E0CB2D50];
                            v169 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v235 = objc_opt_class();
                            v170 = v169;
                            v9 = v298;
                            v262 = (id)objc_msgSend(v170, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v235, CFSTR("isJournalSuggestionSkipped"));
                            v328 = v262;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v328, &v327, 1);
                            v171 = objc_claimAutoreleasedReturnValue();
                            v172 = v167;
                            v75 = v271;
                            v72 = v275;
                            v261 = (void *)v171;
                            v16 = 0;
                            v264 = 0;
                            *v292 = (id)objc_msgSend(v172, "initWithDomain:code:userInfo:", v168, 2);
                            v32 = v297;
                            v37 = v293;
                            v54 = v272;
LABEL_221:

LABEL_222:
                            v82 = v269;
                            goto LABEL_223;
                          }
                          v129 = v128;
                        }
                        else
                        {
                          v129 = 0;
                        }
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isActivitySettingsSwitchEnabled"));
                        v130 = objc_claimAutoreleasedReturnValue();
                        v261 = (void *)v130;
                        v264 = v129;
                        if (v130)
                        {
                          v131 = (void *)v130;
                          objc_opt_class();
                          v72 = v76;
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_opt_class();
                            v54 = v272;
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                v262 = 0;
                                v16 = 0;
                                v32 = v297;
                                v37 = v293;
                                v117 = v85;
                                v75 = v271;
                                goto LABEL_221;
                              }
                              v117 = v85;
                              v173 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v174 = *MEMORY[0x1E0D025B8];
                              v325 = *MEMORY[0x1E0CB2D50];
                              v175 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v236 = objc_opt_class();
                              v176 = v175;
                              v9 = v298;
                              v260 = (id)objc_msgSend(v176, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v236, CFSTR("isActivitySettingsSwitchEnabled"));
                              v326 = v260;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v326, &v325, 1);
                              v177 = objc_claimAutoreleasedReturnValue();
                              v178 = v173;
                              v75 = v271;
                              v72 = v275;
                              v259 = (void *)v177;
                              v16 = 0;
                              v262 = 0;
                              *v292 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v174, 2);
                              goto LABEL_299;
                            }
                            v262 = v131;
LABEL_181:
                            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCommunicationSettingsSwitchEnabled"));
                            v132 = objc_claimAutoreleasedReturnValue();
                            v117 = v85;
                            v259 = (void *)v132;
                            if (!v132)
                            {
                              v260 = 0;
                              v75 = v271;
                              goto LABEL_191;
                            }
                            v133 = (void *)v132;
                            objc_opt_class();
                            v75 = v271;
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v260 = 0;
                              goto LABEL_191;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v260 = v133;
LABEL_191:
                              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSignificantLocationSettingsSwitchEnabled"));
                              v134 = objc_claimAutoreleasedReturnValue();
                              v258 = (void *)v134;
                              if (!v134 || (v135 = (void *)v134, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v273 = 0;
                                goto LABEL_194;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v273 = v135;
LABEL_194:
                                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaSettingsSwitchEnabled"));
                                v136 = objc_claimAutoreleasedReturnValue();
                                v255 = (void *)v136;
                                if (!v136
                                  || (v137 = (void *)v136, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v256 = 0;
                                  goto LABEL_197;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v256 = v137;
LABEL_197:
                                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isNearbyPeopleSettingsSwitchEnabled"));
                                  v138 = objc_claimAutoreleasedReturnValue();
                                  v254 = (void *)v138;
                                  if (!v138
                                    || (v139 = (void *)v138, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v257 = 0;
LABEL_200:
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPhotoSettingsSwitchEnabled"));
                                    v140 = objc_claimAutoreleasedReturnValue();
                                    v251 = (void *)v140;
                                    if (v140
                                      && (v141 = (void *)v140, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        if (!v292)
                                        {
                                          v253 = 0;
                                          v16 = 0;
                                          v32 = v297;
                                          v37 = v293;
                                          v153 = v257;
                                          goto LABEL_216;
                                        }
                                        v205 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v206 = *MEMORY[0x1E0D025B8];
                                        v315 = *MEMORY[0x1E0CB2D50];
                                        v207 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v241 = objc_opt_class();
                                        v208 = v207;
                                        v9 = v298;
                                        v252 = (id)objc_msgSend(v208, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v241, CFSTR("isPhotoSettingsSwitchEnabled"));
                                        v316 = v252;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v316, &v315, 1);
                                        v209 = objc_claimAutoreleasedReturnValue();
                                        v210 = v205;
                                        v75 = v271;
                                        v72 = v275;
                                        v249 = (void *)v209;
                                        v16 = 0;
                                        v253 = 0;
                                        *v292 = (id)objc_msgSend(v210, "initWithDomain:code:userInfo:", v206, 2);
                                        goto LABEL_313;
                                      }
                                      v253 = v141;
                                    }
                                    else
                                    {
                                      v253 = 0;
                                    }
                                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isStateOfMindSettingsSwitchEnabled"));
                                    v142 = objc_claimAutoreleasedReturnValue();
                                    v249 = (void *)v142;
                                    if (!v142
                                      || (v143 = (void *)v142, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v252 = 0;
                                      goto LABEL_206;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v252 = v143;
LABEL_206:
                                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isReflectionSettingsSwitchEnabled"));
                                      v144 = objc_claimAutoreleasedReturnValue();
                                      v248 = (void *)v144;
                                      if (!v144
                                        || (v145 = (void *)v144, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v250 = 0;
                                        goto LABEL_209;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v250 = v145;
LABEL_209:
                                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBroadSystemLocationSettingsSwitchEnabled"));
                                        v146 = objc_claimAutoreleasedReturnValue();
                                        v247 = (void *)v146;
                                        if (v146
                                          && (v147 = (void *)v146, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                        {
                                          objc_opt_class();
                                          v37 = v293;
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (v292)
                                            {
                                              v223 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v224 = *MEMORY[0x1E0D025B8];
                                              v309 = *MEMORY[0x1E0CB2D50];
                                              v225 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBroadSystemLocationSettingsSwitchEnabled"));
                                              v310 = v225;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v310, &v309, 1);
                                              v226 = (void *)objc_claimAutoreleasedReturnValue();
                                              v227 = v223;
                                              v75 = v271;
                                              v72 = v275;
                                              v228 = v224;
                                              v37 = v293;
                                              *v292 = (id)objc_msgSend(v227, "initWithDomain:code:userInfo:", v228, 2, v226);

                                              v9 = v298;
                                            }
                                            v152 = 0;
                                            v16 = 0;
                                            v32 = v297;
                                            goto LABEL_213;
                                          }
                                          v148 = v274;
                                          v149 = v147;
                                        }
                                        else
                                        {
                                          v148 = v274;
                                          v149 = 0;
                                          v37 = v293;
                                        }
                                        v150 = objc_msgSend(v294, "intValue");
                                        v151 = objc_msgSend(v291, "intValue");
                                        v152 = v149;
                                        v246 = v149;
                                        LODWORD(v245) = objc_msgSend(v117, "intValue");
                                        v244 = v148;
                                        v72 = v275;
                                        LODWORD(v229) = v151;
                                        v32 = v297;
                                        v16 = objc_retain(-[BMMomentsEventData initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](v299, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v301, v302, v300, v297, v37, v150, v229,
                                                  v288,
                                                  v287,
                                                  v54,
                                                  v283,
                                                  v281,
                                                  v280,
                                                  v275,
                                                  v244,
                                                  v277,
                                                  v269,
                                                  v245,
                                                  v268,
                                                  v266,
                                                  v264,
                                                  v262,
                                                  v260,
                                                  v273,
                                                  v256,
                                                  v257,
                                                  v253,
                                                  v252,
                                                  v250,
                                                  v246));
                                        v299 = v16;
                                        v75 = v271;
LABEL_213:

LABEL_214:
                                        v153 = v257;

LABEL_215:
LABEL_216:

LABEL_217:
LABEL_218:

LABEL_219:
LABEL_220:

                                        goto LABEL_221;
                                      }
                                      if (v292)
                                      {
                                        v217 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v218 = *MEMORY[0x1E0D025B8];
                                        v311 = *MEMORY[0x1E0CB2D50];
                                        v219 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v243 = objc_opt_class();
                                        v220 = v219;
                                        v9 = v298;
                                        v152 = (void *)objc_msgSend(v220, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v243, CFSTR("isReflectionSettingsSwitchEnabled"));
                                        v312 = v152;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v312, &v311, 1);
                                        v221 = objc_claimAutoreleasedReturnValue();
                                        v222 = v217;
                                        v75 = v271;
                                        v72 = v275;
                                        v247 = (void *)v221;
                                        v16 = 0;
                                        v250 = 0;
                                        *v292 = (id)objc_msgSend(v222, "initWithDomain:code:userInfo:", v218, 2);
                                        v32 = v297;
                                        v37 = v293;
                                        goto LABEL_213;
                                      }
                                      v250 = 0;
                                      v16 = 0;
LABEL_315:
                                      v32 = v297;
                                      v37 = v293;
                                      goto LABEL_214;
                                    }
                                    if (v292)
                                    {
                                      v211 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v212 = *MEMORY[0x1E0D025B8];
                                      v313 = *MEMORY[0x1E0CB2D50];
                                      v213 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v242 = objc_opt_class();
                                      v214 = v213;
                                      v9 = v298;
                                      v250 = (id)objc_msgSend(v214, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v242, CFSTR("isStateOfMindSettingsSwitchEnabled"));
                                      v314 = v250;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v314, &v313, 1);
                                      v215 = objc_claimAutoreleasedReturnValue();
                                      v216 = v211;
                                      v75 = v271;
                                      v72 = v275;
                                      v248 = (void *)v215;
                                      v16 = 0;
                                      v252 = 0;
                                      *v292 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v212, 2);
                                      goto LABEL_315;
                                    }
                                    v252 = 0;
                                    v16 = 0;
LABEL_313:
                                    v32 = v297;
                                    v37 = v293;
                                    v153 = v257;
                                    goto LABEL_215;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v257 = v139;
                                    goto LABEL_200;
                                  }
                                  if (v292)
                                  {
                                    v199 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v200 = *MEMORY[0x1E0D025B8];
                                    v317 = *MEMORY[0x1E0CB2D50];
                                    v201 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v240 = objc_opt_class();
                                    v202 = v201;
                                    v9 = v298;
                                    v253 = (id)objc_msgSend(v202, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v240, CFSTR("isNearbyPeopleSettingsSwitchEnabled"));
                                    v318 = v253;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v318, &v317, 1);
                                    v203 = objc_claimAutoreleasedReturnValue();
                                    v204 = v199;
                                    v75 = v271;
                                    v72 = v275;
                                    v251 = (void *)v203;
                                    v16 = 0;
                                    v153 = 0;
                                    *v292 = (id)objc_msgSend(v204, "initWithDomain:code:userInfo:", v200, 2);
                                    v32 = v297;
                                    v37 = v293;
                                    goto LABEL_216;
                                  }
                                  v153 = 0;
                                  v16 = 0;
LABEL_310:
                                  v32 = v297;
                                  v37 = v293;
                                  goto LABEL_217;
                                }
                                if (v292)
                                {
                                  v193 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v194 = *MEMORY[0x1E0D025B8];
                                  v319 = *MEMORY[0x1E0CB2D50];
                                  v195 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v239 = objc_opt_class();
                                  v196 = v195;
                                  v9 = v298;
                                  v153 = (void *)objc_msgSend(v196, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v239, CFSTR("isMediaSettingsSwitchEnabled"));
                                  v320 = v153;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v320, &v319, 1);
                                  v197 = objc_claimAutoreleasedReturnValue();
                                  v198 = v193;
                                  v75 = v271;
                                  v72 = v275;
                                  v254 = (void *)v197;
                                  v16 = 0;
                                  v256 = 0;
                                  *v292 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v194, 2);
                                  goto LABEL_310;
                                }
                                v256 = 0;
                                v16 = 0;
LABEL_308:
                                v32 = v297;
                                v37 = v293;
                                goto LABEL_218;
                              }
                              if (v292)
                              {
                                v187 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v188 = *MEMORY[0x1E0D025B8];
                                v321 = *MEMORY[0x1E0CB2D50];
                                v189 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v238 = objc_opt_class();
                                v190 = v189;
                                v9 = v298;
                                v256 = (id)objc_msgSend(v190, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v238, CFSTR("isSignificantLocationSettingsSwitchEnabled"));
                                v322 = v256;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v322, &v321, 1);
                                v191 = objc_claimAutoreleasedReturnValue();
                                v192 = v187;
                                v75 = v271;
                                v72 = v275;
                                v255 = (void *)v191;
                                v16 = 0;
                                v273 = 0;
                                *v292 = (id)objc_msgSend(v192, "initWithDomain:code:userInfo:", v188, 2);
                                goto LABEL_308;
                              }
                              v273 = 0;
                              v16 = 0;
LABEL_303:
                              v32 = v297;
                              v37 = v293;
                              goto LABEL_219;
                            }
                            if (v292)
                            {
                              v181 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v182 = *MEMORY[0x1E0D025B8];
                              v323 = *MEMORY[0x1E0CB2D50];
                              v183 = objc_alloc(MEMORY[0x1E0CB3940]);
                              v237 = objc_opt_class();
                              v184 = v183;
                              v9 = v298;
                              v273 = (id)objc_msgSend(v184, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v237, CFSTR("isCommunicationSettingsSwitchEnabled"));
                              v324 = v273;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v324, &v323, 1);
                              v185 = objc_claimAutoreleasedReturnValue();
                              v186 = v181;
                              v75 = v271;
                              v72 = v275;
                              v258 = (void *)v185;
                              v16 = 0;
                              v260 = 0;
                              *v292 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v182, 2);
                              goto LABEL_303;
                            }
                            v260 = 0;
                            v16 = 0;
LABEL_299:
                            v32 = v297;
                            v37 = v293;
                            goto LABEL_220;
                          }
                          v262 = 0;
                        }
                        else
                        {
                          v262 = 0;
                          v72 = v76;
                        }
                        v54 = v272;
                        goto LABEL_181;
                      }
                      if (v292)
                      {
                        v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v91 = *MEMORY[0x1E0D025B8];
                        v343 = *MEMORY[0x1E0CB2D50];
                        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sugSeetEngType"));
                        v344 = v72;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v344, &v343, 1);
                        v279 = (void *)objc_claimAutoreleasedReturnValue();
                        v280 = 0;
                        v16 = 0;
                        *v292 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v91, 2);
                        v32 = v297;
                        v37 = v293;
LABEL_229:

LABEL_230:
                        goto LABEL_231;
                      }
                      v280 = 0;
                      v16 = 0;
LABEL_248:
                      v32 = v297;
                      v37 = v293;
                      goto LABEL_230;
                    }
                    if (v292)
                    {
                      v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v87 = *MEMORY[0x1E0D025B8];
                      v345 = *MEMORY[0x1E0CB2D50];
                      v280 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleEvergreenType"));
                      v346 = v280;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v346, &v345, 1);
                      v284 = (void *)objc_claimAutoreleasedReturnValue();
                      v281 = 0;
                      v16 = 0;
                      *v292 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v87, 2, v284);
                      goto LABEL_248;
                    }
                    v281 = 0;
                    v16 = 0;
LABEL_157:
                    v32 = v297;
                    v37 = v293;
LABEL_231:

                    goto LABEL_232;
                  }
                  if (v292)
                  {
                    v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v79 = *MEMORY[0x1E0D025B8];
                    v347 = *MEMORY[0x1E0CB2D50];
                    v281 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleInterface"));
                    v348 = v281;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v348, &v347, 1);
                    v282 = (void *)objc_claimAutoreleasedReturnValue();
                    v283 = 0;
                    v16 = 0;
                    *v292 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
                    goto LABEL_157;
                  }
                  v283 = 0;
                  v16 = 0;
                  v32 = v297;
                  v37 = v293;
LABEL_232:

                  goto LABEL_233;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v53 = v52;
                  goto LABEL_70;
                }
                if (v292)
                {
                  v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v74 = *MEMORY[0x1E0D025B8];
                  v349 = *MEMORY[0x1E0CB2D50];
                  v283 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("categoryOfEvent"));
                  v350 = v283;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v350, &v349, 1);
                  v295 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = 0;
                  *v292 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 2, v295);
                  v32 = v297;
                  v37 = v293;
                  v54 = 0;
                  goto LABEL_232;
                }
                v16 = 0;
                v32 = v297;
                v37 = v293;
                v54 = 0;
LABEL_233:

                v8 = v300;
LABEL_234:

LABEL_235:
LABEL_236:

                goto LABEL_237;
              }
              if (v292)
              {
                v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v121 = *MEMORY[0x1E0D025B8];
                v351 = *MEMORY[0x1E0CB2D50];
                v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("endDate"));
                v352 = v54;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v352, &v351, 1);
                v285 = (void *)objc_claimAutoreleasedReturnValue();
                v287 = 0;
                v16 = 0;
                *v292 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                v32 = v297;
                v37 = v293;
                goto LABEL_233;
              }
              v287 = 0;
              v16 = 0;
LABEL_280:
              v32 = v297;
              v37 = v293;
              goto LABEL_234;
            }
            if (v292)
            {
              v118 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v119 = *MEMORY[0x1E0D025B8];
              v353 = *MEMORY[0x1E0CB2D50];
              v287 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("startDate"));
              v354 = v287;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v354, &v353, 1);
              v286 = (void *)objc_claimAutoreleasedReturnValue();
              v288 = 0;
              v16 = 0;
              *v292 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
              goto LABEL_280;
            }
            v288 = 0;
            v16 = 0;
LABEL_276:
            v32 = v297;
            v37 = v293;
            goto LABEL_235;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = v45;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataBiologicalSexTypeFromString(v46));
            v291 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_60;
          }
          if (v292)
          {
            v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v93 = *MEMORY[0x1E0D025B8];
            v355 = *MEMORY[0x1E0CB2D50];
            v288 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("biologicalSex"));
            v356 = v288;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v356, &v355, 1);
            v94 = objc_claimAutoreleasedReturnValue();
            v291 = 0;
            v16 = 0;
            *v292 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v93, 2, v94);
            v47 = (void *)v94;
            goto LABEL_276;
          }
          v291 = 0;
          v16 = 0;
LABEL_250:
          v32 = v297;
          v37 = v293;
          goto LABEL_236;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v292 = a4;
          v293 = v9;
          goto LABEL_16;
        }
        if (a4)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v359 = *MEMORY[0x1E0CB2D50];
          v40 = objc_alloc(MEMORY[0x1E0CB3940]);
          v230 = objc_opt_class();
          v41 = v40;
          v9 = v298;
          v294 = (id)objc_msgSend(v41, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v230, CFSTR("age"));
          v360 = v294;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v360, &v359, 1);
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2);
          v37 = 0;
          v16 = 0;
          *a4 = v42;
          v32 = v297;
LABEL_237:

          goto LABEL_238;
        }
        v37 = 0;
        v16 = 0;
        v32 = v297;
LABEL_238:

        goto LABEL_239;
      }
      if (a4)
      {
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v361 = *MEMORY[0x1E0CB2D50];
        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("IHAState"));
        v362 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v362, &v361, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v33;
        v37 = (void *)v35;
        v32 = 0;
        v16 = 0;
        *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v34, 2, v9);
        goto LABEL_238;
      }
      v32 = 0;
      v16 = 0;
LABEL_239:

      self = v299;
      goto LABEL_240;
    }
    if (a4)
    {
      v24 = v7;
      v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v26 = self;
      v27 = *MEMORY[0x1E0D025B8];
      v365 = *MEMORY[0x1E0CB2D50];
      v302 = (BMMomentsEventDataEventBundle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("bundle"));
      v366 = v302;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v366, &v365, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v25;
      v7 = v24;
      v29 = v27;
      self = v26;
      v16 = 0;
      *a4 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v8);
LABEL_241:

      goto LABEL_242;
    }
    goto LABEL_39;
  }
  if (a4)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = self;
    v19 = *MEMORY[0x1E0D025B8];
    v367 = *MEMORY[0x1E0CB2D50];
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("event"));
    v368[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v368, &v367, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v17;
    v7 = (BMMomentsEventDataEvent *)v20;
    v23 = v19;
    self = v18;
    v305 = (id)v21;
    v16 = 0;
    *a4 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2);
LABEL_242:

    goto LABEL_243;
  }
  v16 = 0;
LABEL_243:

  return v16;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
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
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  _QWORD v105[30];
  _QWORD v106[32];

  v106[30] = *MEMORY[0x1E0C80C00];
  -[BMMomentsEventData event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMMomentsEventData bundle](self, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  if (-[BMMomentsEventData hasIsBundle](self, "hasIsBundle"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isBundle](self, "isBundle"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMMomentsEventData hasIHAState](self, "hasIHAState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData IHAState](self, "IHAState"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMMomentsEventData hasAge](self, "hasAge"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData age](self, "age"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData ageRange](self, "ageRange"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData biologicalSex](self, "biologicalSex"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventData startDate](self, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v102 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v102 = 0;
  }

  -[BMMomentsEventData endDate](self, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventData endDate](self, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v101 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v101 = 0;
  }

  -[BMMomentsEventData categoryOfEvent](self, "categoryOfEvent");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData bundleInterface](self, "bundleInterface");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData bundleEvergreenType](self, "bundleEvergreenType");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData sugSeetEngType](self, "sugSeetEngType");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData appEntryEngType](self, "appEntryEngType");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventData megaSignalTypeUsed](self, "megaSignalTypeUsed");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventData hasViewVisibleSuggestionsCount](self, "hasViewVisibleSuggestionsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
    v94 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v94 = 0;
  }
  if (-[BMMomentsEventData hasViewTotalSuggestionsCount](self, "hasViewTotalSuggestionsCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
    v93 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v93 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventData onboardingFlowCompletionState](self, "onboardingFlowCompletionState"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEventData hasIsJournalAppInstalled](self, "hasIsJournalAppInstalled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isJournalAppInstalled](self, "isJournalAppInstalled"));
    v91 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v91 = 0;
  }
  if (-[BMMomentsEventData hasIsJournalAppLocked](self, "hasIsJournalAppLocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isJournalAppLocked](self, "isJournalAppLocked"));
    v90 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v90 = 0;
  }
  if (-[BMMomentsEventData hasIsJournalSuggestionSkipped](self, "hasIsJournalSuggestionSkipped"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
    v89 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v89 = 0;
  }
  if (-[BMMomentsEventData hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
    v88 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v88 = 0;
  }
  if (-[BMMomentsEventData hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
    v87 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v87 = 0;
  }
  if (-[BMMomentsEventData hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
    v86 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v86 = 0;
  }
  if (-[BMMomentsEventData hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
    v85 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v85 = 0;
  }
  if (-[BMMomentsEventData hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
    v84 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v84 = 0;
  }
  if (-[BMMomentsEventData hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
    v83 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v83 = 0;
  }
  if (-[BMMomentsEventData hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
    v82 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v82 = 0;
  }
  if (-[BMMomentsEventData hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
    v81 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v81 = 0;
  }
  if (-[BMMomentsEventData hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventData isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
    v80 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
  }
  v105[0] = CFSTR("event");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v16;
  v106[0] = v16;
  v105[1] = CFSTR("bundle");
  v17 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v17;
  v106[1] = v17;
  v105[2] = CFSTR("isBundle");
  v18 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v18;
  v106[2] = v18;
  v105[3] = CFSTR("IHAState");
  v19 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v19;
  v106[3] = v19;
  v105[4] = CFSTR("age");
  v20 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = v9;
  v67 = (void *)v20;
  v106[4] = v20;
  v105[5] = CFSTR("ageRange");
  v22 = (uint64_t)v104;
  if (!v104)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = v8;
  v106[5] = v22;
  v105[6] = CFSTR("biologicalSex");
  v24 = (uint64_t)v103;
  if (!v103)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v6;
  v106[6] = v24;
  v105[7] = CFSTR("startDate");
  v26 = (uint64_t)v102;
  if (!v102)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v106[7] = v26;
  v105[8] = CFSTR("endDate");
  v27 = (uint64_t)v101;
  if (!v101)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v106[8] = v27;
  v105[9] = CFSTR("categoryOfEvent");
  v28 = (uint64_t)v100;
  if (!v100)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v28;
  v106[9] = v28;
  v105[10] = CFSTR("bundleInterface");
  v29 = (uint64_t)v99;
  if (!v99)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v29;
  v106[10] = v29;
  v105[11] = CFSTR("bundleEvergreenType");
  v30 = (uint64_t)v98;
  if (!v98)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v30;
  v106[11] = v30;
  v105[12] = CFSTR("sugSeetEngType");
  v31 = (uint64_t)v97;
  if (!v97)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v31;
  v106[12] = v31;
  v105[13] = CFSTR("appEntryEngType");
  v32 = (uint64_t)v96;
  if (!v96)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v32;
  v106[13] = v32;
  v105[14] = CFSTR("megaSignalTypeUsed");
  v34 = (uint64_t)v95;
  if (!v95)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v34;
  v106[14] = v34;
  v105[15] = CFSTR("viewVisibleSuggestionsCount");
  v35 = (uint64_t)v94;
  if (!v94)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v35;
  v106[15] = v35;
  v105[16] = CFSTR("viewTotalSuggestionsCount");
  v36 = (uint64_t)v93;
  if (!v93)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v36;
  v106[16] = v36;
  v105[17] = CFSTR("onboardingFlowCompletionState");
  v37 = (uint64_t)v92;
  if (!v92)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v37;
  v106[17] = v37;
  v105[18] = CFSTR("isJournalAppInstalled");
  v38 = (uint64_t)v91;
  if (!v91)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v79 = (void *)v4;
  v58 = (void *)v38;
  v106[18] = v38;
  v105[19] = CFSTR("isJournalAppLocked");
  v39 = (uint64_t)v90;
  if (!v90)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v39;
  v106[19] = v39;
  v105[20] = CFSTR("isJournalSuggestionSkipped");
  v40 = (uint64_t)v89;
  if (!v89)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v78 = v7;
  v56 = (void *)v40;
  v106[20] = v40;
  v105[21] = CFSTR("isActivitySettingsSwitchEnabled");
  v41 = (uint64_t)v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v22;
  v55 = (void *)v41;
  v106[21] = v41;
  v105[22] = CFSTR("isCommunicationSettingsSwitchEnabled");
  v42 = (uint64_t)v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v24;
  v53 = v42;
  v106[22] = v42;
  v105[23] = CFSTR("isSignificantLocationSettingsSwitchEnabled");
  v43 = v86;
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v42, v55, v56, v57, v58, v59, v60, v61, v62, v63);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v76 = (void *)v27;
  v77 = v25;
  v106[23] = v43;
  v105[24] = CFSTR("isMediaSettingsSwitchEnabled");
  v44 = v85;
  if (!v85)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[24] = v44;
  v105[25] = CFSTR("isNearbyPeopleSettingsSwitchEnabled");
  v45 = v84;
  v46 = v23;
  if (!v84)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v64 = (void *)v26;
  v106[25] = v45;
  v105[26] = CFSTR("isPhotoSettingsSwitchEnabled");
  v47 = v83;
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[26] = v47;
  v105[27] = CFSTR("isStateOfMindSettingsSwitchEnabled");
  v48 = v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[27] = v48;
  v105[28] = CFSTR("isReflectionSettingsSwitchEnabled");
  v49 = v81;
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[28] = v49;
  v105[29] = CFSTR("isBroadSystemLocationSettingsSwitchEnabled");
  v50 = v80;
  if (!v80)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v106[29] = v50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 30, v53);
  v72 = (id)objc_claimAutoreleasedReturnValue();
  if (!v80)

  v51 = v33;
  if (!v81)
  {

    v51 = v33;
  }
  if (!v82)
  {

    v51 = v33;
  }
  if (!v83)
  {

    v51 = v33;
  }
  if (!v84)
  {

    v51 = v33;
  }
  if (!v85)
  {

    v51 = v33;
  }
  if (!v86)
  {

    v51 = v33;
  }
  if (!v87)
  {

    v51 = v33;
  }
  if (!v88)
  {

    v51 = v33;
  }
  if (!v89)
  {

    v51 = v33;
  }
  if (!v90)
  {

    v51 = v33;
  }
  if (!v91)
  {

    v51 = v33;
  }
  if (!v92)
  {

    v51 = v33;
  }
  if (!v93)
  {

    v51 = v33;
  }
  if (!v94)
  {

    v51 = v33;
  }
  if (!v95)
  {

    v51 = v33;
  }
  if (!v96)

  if (!v97)
  if (!v98)

  if (!v99)
  if (!v100)

  if (!v101)
  if (!v102)

  if (!v103)
  if (v104)
  {
    if (v21)
      goto LABEL_168;
  }
  else
  {

    if (v21)
    {
LABEL_168:
      if (v46)
        goto LABEL_169;
      goto LABEL_175;
    }
  }

  if (v46)
  {
LABEL_169:
    if (v78)
      goto LABEL_170;
    goto LABEL_176;
  }
LABEL_175:

  if (v78)
  {
LABEL_170:
    if (v77)
      goto LABEL_171;
LABEL_177:

    if (v79)
      goto LABEL_172;
LABEL_178:

    goto LABEL_172;
  }
LABEL_176:

  if (!v77)
    goto LABEL_177;
LABEL_171:
  if (!v79)
    goto LABEL_178;
LABEL_172:

  return v72;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_startDate);
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

- (NSDate)endDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_endDate);
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
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  int v72;
  int v73;
  int v74;
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
  int v85;
  _BOOL4 v86;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMomentsEventData event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "event");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMomentsEventData event](self, "event");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "event");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_131;
    }
    -[BMMomentsEventData bundle](self, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMomentsEventData bundle](self, "bundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_131;
    }
    if (-[BMMomentsEventData hasIsBundle](self, "hasIsBundle") || objc_msgSend(v5, "hasIsBundle"))
    {
      if (!-[BMMomentsEventData hasIsBundle](self, "hasIsBundle"))
        goto LABEL_131;
      if (!objc_msgSend(v5, "hasIsBundle"))
        goto LABEL_131;
      v19 = -[BMMomentsEventData isBundle](self, "isBundle");
      if (v19 != objc_msgSend(v5, "isBundle"))
        goto LABEL_131;
    }
    if (-[BMMomentsEventData hasIHAState](self, "hasIHAState") || objc_msgSend(v5, "hasIHAState"))
    {
      if (!-[BMMomentsEventData hasIHAState](self, "hasIHAState"))
        goto LABEL_131;
      if (!objc_msgSend(v5, "hasIHAState"))
        goto LABEL_131;
      v20 = -[BMMomentsEventData IHAState](self, "IHAState");
      if (v20 != objc_msgSend(v5, "IHAState"))
        goto LABEL_131;
    }
    if (-[BMMomentsEventData hasAge](self, "hasAge") || objc_msgSend(v5, "hasAge"))
    {
      if (!-[BMMomentsEventData hasAge](self, "hasAge"))
        goto LABEL_131;
      if (!objc_msgSend(v5, "hasAge"))
        goto LABEL_131;
      v21 = -[BMMomentsEventData age](self, "age");
      if (v21 != objc_msgSend(v5, "age"))
        goto LABEL_131;
    }
    v22 = -[BMMomentsEventData ageRange](self, "ageRange");
    if (v22 != objc_msgSend(v5, "ageRange"))
      goto LABEL_131;
    v23 = -[BMMomentsEventData biologicalSex](self, "biologicalSex");
    if (v23 != objc_msgSend(v5, "biologicalSex"))
      goto LABEL_131;
    -[BMMomentsEventData startDate](self, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v24 == (void *)v25)
    {

    }
    else
    {
      v26 = (void *)v25;
      -[BMMomentsEventData startDate](self, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqual:", v28);

      if (!v29)
        goto LABEL_131;
    }
    -[BMMomentsEventData endDate](self, "endDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v30 == (void *)v31)
    {

    }
    else
    {
      v32 = (void *)v31;
      -[BMMomentsEventData endDate](self, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqual:", v34);

      if (!v35)
        goto LABEL_131;
    }
    -[BMMomentsEventData categoryOfEvent](self, "categoryOfEvent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryOfEvent");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v36 == (void *)v37)
    {

    }
    else
    {
      v38 = (void *)v37;
      -[BMMomentsEventData categoryOfEvent](self, "categoryOfEvent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoryOfEvent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqual:", v40);

      if (!v41)
        goto LABEL_131;
    }
    -[BMMomentsEventData bundleInterface](self, "bundleInterface");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleInterface");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v42 == (void *)v43)
    {

    }
    else
    {
      v44 = (void *)v43;
      -[BMMomentsEventData bundleInterface](self, "bundleInterface");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleInterface");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "isEqual:", v46);

      if (!v47)
        goto LABEL_131;
    }
    -[BMMomentsEventData bundleEvergreenType](self, "bundleEvergreenType");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleEvergreenType");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v48 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      -[BMMomentsEventData bundleEvergreenType](self, "bundleEvergreenType");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleEvergreenType");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqual:", v52);

      if (!v53)
        goto LABEL_131;
    }
    -[BMMomentsEventData sugSeetEngType](self, "sugSeetEngType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sugSeetEngType");
    v55 = objc_claimAutoreleasedReturnValue();
    if (v54 == (void *)v55)
    {

    }
    else
    {
      v56 = (void *)v55;
      -[BMMomentsEventData sugSeetEngType](self, "sugSeetEngType");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sugSeetEngType");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "isEqual:", v58);

      if (!v59)
        goto LABEL_131;
    }
    -[BMMomentsEventData appEntryEngType](self, "appEntryEngType");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appEntryEngType");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v60 == (void *)v61)
    {

    }
    else
    {
      v62 = (void *)v61;
      -[BMMomentsEventData appEntryEngType](self, "appEntryEngType");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appEntryEngType");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v63, "isEqual:", v64);

      if (!v65)
        goto LABEL_131;
    }
    -[BMMomentsEventData megaSignalTypeUsed](self, "megaSignalTypeUsed");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "megaSignalTypeUsed");
    v67 = objc_claimAutoreleasedReturnValue();
    if (v66 == (void *)v67)
    {

    }
    else
    {
      v68 = (void *)v67;
      -[BMMomentsEventData megaSignalTypeUsed](self, "megaSignalTypeUsed");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "megaSignalTypeUsed");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "isEqual:", v70);

      if (!v71)
        goto LABEL_131;
    }
    if (!-[BMMomentsEventData hasViewVisibleSuggestionsCount](self, "hasViewVisibleSuggestionsCount")
      && !objc_msgSend(v5, "hasViewVisibleSuggestionsCount")
      || -[BMMomentsEventData hasViewVisibleSuggestionsCount](self, "hasViewVisibleSuggestionsCount")
      && objc_msgSend(v5, "hasViewVisibleSuggestionsCount")
      && (v72 = -[BMMomentsEventData viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"),
          v72 == objc_msgSend(v5, "viewVisibleSuggestionsCount")))
    {
      if (!-[BMMomentsEventData hasViewTotalSuggestionsCount](self, "hasViewTotalSuggestionsCount")
        && !objc_msgSend(v5, "hasViewTotalSuggestionsCount")
        || -[BMMomentsEventData hasViewTotalSuggestionsCount](self, "hasViewTotalSuggestionsCount")
        && objc_msgSend(v5, "hasViewTotalSuggestionsCount")
        && (v73 = -[BMMomentsEventData viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"),
            v73 == objc_msgSend(v5, "viewTotalSuggestionsCount")))
      {
        v74 = -[BMMomentsEventData onboardingFlowCompletionState](self, "onboardingFlowCompletionState");
        if (v74 == objc_msgSend(v5, "onboardingFlowCompletionState"))
        {
          if (!-[BMMomentsEventData hasIsJournalAppInstalled](self, "hasIsJournalAppInstalled")
            && !objc_msgSend(v5, "hasIsJournalAppInstalled")
            || -[BMMomentsEventData hasIsJournalAppInstalled](self, "hasIsJournalAppInstalled")
            && objc_msgSend(v5, "hasIsJournalAppInstalled")
            && (v75 = -[BMMomentsEventData isJournalAppInstalled](self, "isJournalAppInstalled"),
                v75 == objc_msgSend(v5, "isJournalAppInstalled")))
          {
            if (!-[BMMomentsEventData hasIsJournalAppLocked](self, "hasIsJournalAppLocked")
              && !objc_msgSend(v5, "hasIsJournalAppLocked")
              || -[BMMomentsEventData hasIsJournalAppLocked](self, "hasIsJournalAppLocked")
              && objc_msgSend(v5, "hasIsJournalAppLocked")
              && (v76 = -[BMMomentsEventData isJournalAppLocked](self, "isJournalAppLocked"),
                  v76 == objc_msgSend(v5, "isJournalAppLocked")))
            {
              if (!-[BMMomentsEventData hasIsJournalSuggestionSkipped](self, "hasIsJournalSuggestionSkipped")
                && !objc_msgSend(v5, "hasIsJournalSuggestionSkipped")
                || -[BMMomentsEventData hasIsJournalSuggestionSkipped](self, "hasIsJournalSuggestionSkipped")
                && objc_msgSend(v5, "hasIsJournalSuggestionSkipped")
                && (v77 = -[BMMomentsEventData isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"),
                    v77 == objc_msgSend(v5, "isJournalSuggestionSkipped")))
              {
                if (!-[BMMomentsEventData hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsActivitySettingsSwitchEnabled")|| -[BMMomentsEventData hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsActivitySettingsSwitchEnabled")&& (v78 = -[BMMomentsEventData isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"), v78 == objc_msgSend(v5, "isActivitySettingsSwitchEnabled")))
                {
                  if (!-[BMMomentsEventData hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsCommunicationSettingsSwitchEnabled")|| -[BMMomentsEventData hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsCommunicationSettingsSwitchEnabled")&& (v79 = -[BMMomentsEventData isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"), v79 == objc_msgSend(v5, "isCommunicationSettingsSwitchEnabled")))
                  {
                    if (!-[BMMomentsEventData hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsSignificantLocationSettingsSwitchEnabled")|| -[BMMomentsEventData hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsSignificantLocationSettingsSwitchEnabled")&& (v80 = -[BMMomentsEventData isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"), v80 == objc_msgSend(v5, "isSignificantLocationSettingsSwitchEnabled")))
                    {
                      if (!-[BMMomentsEventData hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsMediaSettingsSwitchEnabled")|| -[BMMomentsEventData hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsMediaSettingsSwitchEnabled")&& (v81 = -[BMMomentsEventData isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"), v81 == objc_msgSend(v5, "isMediaSettingsSwitchEnabled")))
                      {
                        if (!-[BMMomentsEventData hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsNearbyPeopleSettingsSwitchEnabled")|| -[BMMomentsEventData hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsNearbyPeopleSettingsSwitchEnabled")&& (v82 = -[BMMomentsEventData isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"), v82 == objc_msgSend(v5, "isNearbyPeopleSettingsSwitchEnabled")))
                        {
                          if (!-[BMMomentsEventData hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsPhotoSettingsSwitchEnabled")|| -[BMMomentsEventData hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsPhotoSettingsSwitchEnabled")&& (v83 = -[BMMomentsEventData isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"), v83 == objc_msgSend(v5, "isPhotoSettingsSwitchEnabled")))
                          {
                            if (!-[BMMomentsEventData hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsStateOfMindSettingsSwitchEnabled")|| -[BMMomentsEventData hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsStateOfMindSettingsSwitchEnabled")&& (v84 = -[BMMomentsEventData isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"), v84 == objc_msgSend(v5, "isStateOfMindSettingsSwitchEnabled")))
                            {
                              if (!-[BMMomentsEventData hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsReflectionSettingsSwitchEnabled")|| -[BMMomentsEventData hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsReflectionSettingsSwitchEnabled")&& (v85 = -[BMMomentsEventData isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"), v85 == objc_msgSend(v5, "isReflectionSettingsSwitchEnabled")))
                              {
                                if (!-[BMMomentsEventData hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsBroadSystemLocationSettingsSwitchEnabled"))
                                {
                                  LOBYTE(v12) = 1;
                                  goto LABEL_132;
                                }
                                if (-[BMMomentsEventData hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsBroadSystemLocationSettingsSwitchEnabled"))
                                {
                                  v86 = -[BMMomentsEventData isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled");
                                  v12 = v86 ^ objc_msgSend(v5, "isBroadSystemLocationSettingsSwitchEnabled") ^ 1;
LABEL_132:

                                  goto LABEL_133;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_131:
    LOBYTE(v12) = 0;
    goto LABEL_132;
  }
  LOBYTE(v12) = 0;
LABEL_133:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMMomentsEventDataEvent)event
{
  return self->_event;
}

- (BMMomentsEventDataEventBundle)bundle
{
  return self->_bundle;
}

- (BOOL)isBundle
{
  return self->_isBundle;
}

- (BOOL)hasIsBundle
{
  return self->_hasIsBundle;
}

- (void)setHasIsBundle:(BOOL)a3
{
  self->_hasIsBundle = a3;
}

- (BOOL)IHAState
{
  return self->_IHAState;
}

- (BOOL)hasIHAState
{
  return self->_hasIHAState;
}

- (void)setHasIHAState:(BOOL)a3
{
  self->_hasIHAState = a3;
}

- (int)age
{
  return self->_age;
}

- (BOOL)hasAge
{
  return self->_hasAge;
}

- (void)setHasAge:(BOOL)a3
{
  self->_hasAge = a3;
}

- (int)ageRange
{
  return self->_ageRange;
}

- (int)biologicalSex
{
  return self->_biologicalSex;
}

- (NSString)categoryOfEvent
{
  return self->_categoryOfEvent;
}

- (NSString)bundleInterface
{
  return self->_bundleInterface;
}

- (NSString)bundleEvergreenType
{
  return self->_bundleEvergreenType;
}

- (NSString)sugSeetEngType
{
  return self->_sugSeetEngType;
}

- (NSString)appEntryEngType
{
  return self->_appEntryEngType;
}

- (NSString)megaSignalTypeUsed
{
  return self->_megaSignalTypeUsed;
}

- (int)viewVisibleSuggestionsCount
{
  return self->_viewVisibleSuggestionsCount;
}

- (BOOL)hasViewVisibleSuggestionsCount
{
  return self->_hasViewVisibleSuggestionsCount;
}

- (void)setHasViewVisibleSuggestionsCount:(BOOL)a3
{
  self->_hasViewVisibleSuggestionsCount = a3;
}

- (int)viewTotalSuggestionsCount
{
  return self->_viewTotalSuggestionsCount;
}

- (BOOL)hasViewTotalSuggestionsCount
{
  return self->_hasViewTotalSuggestionsCount;
}

- (void)setHasViewTotalSuggestionsCount:(BOOL)a3
{
  self->_hasViewTotalSuggestionsCount = a3;
}

- (int)onboardingFlowCompletionState
{
  return self->_onboardingFlowCompletionState;
}

- (BOOL)isJournalAppInstalled
{
  return self->_isJournalAppInstalled;
}

- (BOOL)hasIsJournalAppInstalled
{
  return self->_hasIsJournalAppInstalled;
}

- (void)setHasIsJournalAppInstalled:(BOOL)a3
{
  self->_hasIsJournalAppInstalled = a3;
}

- (BOOL)isJournalAppLocked
{
  return self->_isJournalAppLocked;
}

- (BOOL)hasIsJournalAppLocked
{
  return self->_hasIsJournalAppLocked;
}

- (void)setHasIsJournalAppLocked:(BOOL)a3
{
  self->_hasIsJournalAppLocked = a3;
}

- (BOOL)isJournalSuggestionSkipped
{
  return self->_isJournalSuggestionSkipped;
}

- (BOOL)hasIsJournalSuggestionSkipped
{
  return self->_hasIsJournalSuggestionSkipped;
}

- (void)setHasIsJournalSuggestionSkipped:(BOOL)a3
{
  self->_hasIsJournalSuggestionSkipped = a3;
}

- (BOOL)isActivitySettingsSwitchEnabled
{
  return self->_isActivitySettingsSwitchEnabled;
}

- (BOOL)hasIsActivitySettingsSwitchEnabled
{
  return self->_hasIsActivitySettingsSwitchEnabled;
}

- (void)setHasIsActivitySettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsActivitySettingsSwitchEnabled = a3;
}

- (BOOL)isCommunicationSettingsSwitchEnabled
{
  return self->_isCommunicationSettingsSwitchEnabled;
}

- (BOOL)hasIsCommunicationSettingsSwitchEnabled
{
  return self->_hasIsCommunicationSettingsSwitchEnabled;
}

- (void)setHasIsCommunicationSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsCommunicationSettingsSwitchEnabled = a3;
}

- (BOOL)isSignificantLocationSettingsSwitchEnabled
{
  return self->_isSignificantLocationSettingsSwitchEnabled;
}

- (BOOL)hasIsSignificantLocationSettingsSwitchEnabled
{
  return self->_hasIsSignificantLocationSettingsSwitchEnabled;
}

- (void)setHasIsSignificantLocationSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsSignificantLocationSettingsSwitchEnabled = a3;
}

- (BOOL)isMediaSettingsSwitchEnabled
{
  return self->_isMediaSettingsSwitchEnabled;
}

- (BOOL)hasIsMediaSettingsSwitchEnabled
{
  return self->_hasIsMediaSettingsSwitchEnabled;
}

- (void)setHasIsMediaSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsMediaSettingsSwitchEnabled = a3;
}

- (BOOL)isNearbyPeopleSettingsSwitchEnabled
{
  return self->_isNearbyPeopleSettingsSwitchEnabled;
}

- (BOOL)hasIsNearbyPeopleSettingsSwitchEnabled
{
  return self->_hasIsNearbyPeopleSettingsSwitchEnabled;
}

- (void)setHasIsNearbyPeopleSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsNearbyPeopleSettingsSwitchEnabled = a3;
}

- (BOOL)isPhotoSettingsSwitchEnabled
{
  return self->_isPhotoSettingsSwitchEnabled;
}

- (BOOL)hasIsPhotoSettingsSwitchEnabled
{
  return self->_hasIsPhotoSettingsSwitchEnabled;
}

- (void)setHasIsPhotoSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsPhotoSettingsSwitchEnabled = a3;
}

- (BOOL)isStateOfMindSettingsSwitchEnabled
{
  return self->_isStateOfMindSettingsSwitchEnabled;
}

- (BOOL)hasIsStateOfMindSettingsSwitchEnabled
{
  return self->_hasIsStateOfMindSettingsSwitchEnabled;
}

- (void)setHasIsStateOfMindSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsStateOfMindSettingsSwitchEnabled = a3;
}

- (BOOL)isReflectionSettingsSwitchEnabled
{
  return self->_isReflectionSettingsSwitchEnabled;
}

- (BOOL)hasIsReflectionSettingsSwitchEnabled
{
  return self->_hasIsReflectionSettingsSwitchEnabled;
}

- (void)setHasIsReflectionSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsReflectionSettingsSwitchEnabled = a3;
}

- (BOOL)isBroadSystemLocationSettingsSwitchEnabled
{
  return self->_isBroadSystemLocationSettingsSwitchEnabled;
}

- (BOOL)hasIsBroadSystemLocationSettingsSwitchEnabled
{
  return self->_hasIsBroadSystemLocationSettingsSwitchEnabled;
}

- (void)setHasIsBroadSystemLocationSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsBroadSystemLocationSettingsSwitchEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_megaSignalTypeUsed, 0);
  objc_storeStrong((id *)&self->_appEntryEngType, 0);
  objc_storeStrong((id *)&self->_sugSeetEngType, 0);
  objc_storeStrong((id *)&self->_bundleEvergreenType, 0);
  objc_storeStrong((id *)&self->_bundleInterface, 0);
  objc_storeStrong((id *)&self->_categoryOfEvent, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_event, 0);
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

    v4 = -[BMMomentsEventData initByReadFrom:]([BMMomentsEventData alloc], "initByReadFrom:", v7);
    v4[20] = 0;

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
  _QWORD v34[32];

  v34[30] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("event_json"), 5, 1, &__block_literal_global_3554);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bundle_json"), 5, 1, &__block_literal_global_3555);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBundle"), 0, 0, 3, 12, 0);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("IHAState"), 0, 0, 4, 12, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("age"), 0, 0, 5, 2, 0);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ageRange"), 0, 0, 6, 4, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("biologicalSex"), 0, 0, 7, 4, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startDate"), 3, 0, 8, 0, 2);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endDate"), 3, 0, 9, 0, 2);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("categoryOfEvent"), 2, 0, 10, 13, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleInterface"), 2, 0, 11, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleEvergreenType"), 2, 0, 12, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sugSeetEngType"), 2, 0, 13, 13, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appEntryEngType"), 2, 0, 14, 13, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("megaSignalTypeUsed"), 2, 0, 15, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewVisibleSuggestionsCount"), 0, 0, 16, 2, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewTotalSuggestionsCount"), 0, 0, 17, 2, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("onboardingFlowCompletionState"), 0, 0, 18, 4, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJournalAppInstalled"), 0, 0, 19, 12, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJournalAppLocked"), 0, 0, 20, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJournalSuggestionSkipped"), 0, 0, 21, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActivitySettingsSwitchEnabled"), 0, 0, 22, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCommunicationSettingsSwitchEnabled"), 0, 0, 23, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSignificantLocationSettingsSwitchEnabled"), 0, 0, 24, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaSettingsSwitchEnabled"), 0, 0, 25, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNearbyPeopleSettingsSwitchEnabled"), 0, 0, 26, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPhotoSettingsSwitchEnabled"), 0, 0, 27, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isStateOfMindSettingsSwitchEnabled"), 0, 0, 28, 12, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isReflectionSettingsSwitchEnabled"), 0, 0, 29, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBroadSystemLocationSettingsSwitchEnabled"), 0, 0, 30, 12, 0);
  v34[0] = v13;
  v34[1] = v33;
  v34[2] = v32;
  v34[3] = v31;
  v34[4] = v30;
  v34[5] = v29;
  v34[6] = v28;
  v34[7] = v27;
  v34[8] = v26;
  v34[9] = v25;
  v34[10] = v24;
  v34[11] = v23;
  v34[12] = v22;
  v34[13] = v21;
  v34[14] = v20;
  v34[15] = v19;
  v34[16] = v18;
  v34[17] = v17;
  v34[18] = v16;
  v34[19] = v15;
  v34[20] = v2;
  v34[21] = v3;
  v34[22] = v14;
  v34[23] = v4;
  v34[24] = v5;
  v34[25] = v6;
  v34[26] = v7;
  v34[27] = v12;
  v34[28] = v11;
  v34[29] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 30);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A7A0;
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
  _QWORD v34[32];

  v34[30] = *MEMORY[0x1E0C80C00];
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("event"), 1, 14, objc_opt_class());
  v34[0] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundle"), 2, 14, objc_opt_class());
  v34[1] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBundle"), 3, 12, 0);
  v34[2] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("IHAState"), 4, 12, 0);
  v34[3] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("age"), 5, 2, 0);
  v34[4] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ageRange"), 6, 4, 0);
  v34[5] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("biologicalSex"), 7, 4, 0);
  v34[6] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startDate"), 8, 0, 0);
  v34[7] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endDate"), 9, 0, 0);
  v34[8] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("categoryOfEvent"), 10, 13, 0);
  v34[9] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleInterface"), 11, 13, 0);
  v34[10] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleEvergreenType"), 12, 13, 0);
  v34[11] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sugSeetEngType"), 13, 13, 0);
  v34[12] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appEntryEngType"), 14, 13, 0);
  v34[13] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("megaSignalTypeUsed"), 15, 13, 0);
  v34[14] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewVisibleSuggestionsCount"), 16, 2, 0);
  v34[15] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewTotalSuggestionsCount"), 17, 2, 0);
  v34[16] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("onboardingFlowCompletionState"), 18, 4, 0);
  v34[17] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJournalAppInstalled"), 19, 12, 0);
  v34[18] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJournalAppLocked"), 20, 12, 0);
  v34[19] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJournalSuggestionSkipped"), 21, 12, 0);
  v34[20] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActivitySettingsSwitchEnabled"), 22, 12, 0);
  v34[21] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCommunicationSettingsSwitchEnabled"), 23, 12, 0);
  v34[22] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSignificantLocationSettingsSwitchEnabled"), 24, 12, 0);
  v34[23] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaSettingsSwitchEnabled"), 25, 12, 0);
  v34[24] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNearbyPeopleSettingsSwitchEnabled"), 26, 12, 0);
  v34[25] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPhotoSettingsSwitchEnabled"), 27, 12, 0);
  v34[26] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isStateOfMindSettingsSwitchEnabled"), 28, 12, 0);
  v34[27] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isReflectionSettingsSwitchEnabled"), 29, 12, 0);
  v34[28] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBroadSystemLocationSettingsSwitchEnabled"), 30, 12, 0);
  v34[29] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __29__BMMomentsEventData_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __29__BMMomentsEventData_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  BMMomentsEventData *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  BMMomentsEventData *v36;
  void *v37;
  _QWORD v38[24];
  _QWORD v39[24];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[26];
  _QWORD v43[26];
  _QWORD v44[14];
  _QWORD v45[16];

  v45[14] = *MEMORY[0x1E0C80C00];
  v34 = a7;
  v33 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v32 = v14;
  v30 = v16;
  if (objc_msgSend(v14, "BOOLValue"))
  {
    objc_msgSend(v15, "bundleStartDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleEndDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = &unk_1E5F20128;
    v44[1] = &unk_1E5F20140;
    v45[0] = CFSTR("Unknown");
    v45[1] = CFSTR("Activity");
    v44[2] = &unk_1E5F20158;
    v44[3] = &unk_1E5F20170;
    v45[2] = CFSTR("Outing");
    v45[3] = CFSTR("PhotoMoment");
    v44[4] = &unk_1E5F20188;
    v44[5] = &unk_1E5F201A0;
    v45[4] = CFSTR("SignificantContact");
    v45[5] = CFSTR("Media");
    v44[6] = &unk_1E5F201B8;
    v44[7] = &unk_1E5F201D0;
    v45[6] = CFSTR("SharedContent");
    v45[7] = CFSTR("TimeAtHome");
    v44[8] = &unk_1E5F201E8;
    v44[9] = &unk_1E5F20200;
    v45[8] = CFSTR("TopicsOfInterest");
    v45[9] = CFSTR("Trend");
    v44[10] = &unk_1E5F20218;
    v44[11] = &unk_1E5F20230;
    v45[10] = CFSTR("PhotoMemory");
    v45[11] = CFSTR("Evergreen");
    v28 = self;
    v44[12] = &unk_1E5F20248;
    v44[13] = &unk_1E5F20260;
    v45[12] = CFSTR("TimeContext");
    v45[13] = CFSTR("Trip");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "bundleInterfaceType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v43[0] = CFSTR("Unknown");
    v43[1] = CFSTR("Selected");
    v43[2] = CFSTR("Shared");
    v43[3] = CFSTR("Liked");
    v42[0] = &unk_1E5F20128;
    v42[1] = &unk_1E5F20140;
    v42[4] = &unk_1E5F20188;
    v42[5] = &unk_1E5F201A0;
    v42[2] = &unk_1E5F20158;
    v42[3] = &unk_1E5F20170;
    v43[4] = CFSTR("Disliked");
    v43[5] = CFSTR("Dismissed");
    v42[6] = &unk_1E5F201B8;
    v42[7] = &unk_1E5F201D0;
    v43[6] = CFSTR("Deleted");
    v43[7] = CFSTR("Hidden");
    v42[8] = &unk_1E5F201E8;
    v42[9] = &unk_1E5F20200;
    v43[8] = CFSTR("QuickAddEntry");
    v43[9] = CFSTR("Viewed");
    v42[10] = &unk_1E5F20218;
    v42[11] = &unk_1E5F20230;
    v43[10] = CFSTR("ThumbsDown");
    v43[11] = CFSTR("Favorite");
    v42[12] = &unk_1E5F20248;
    v42[13] = &unk_1E5F20260;
    v43[12] = CFSTR("ThumbsUp");
    v43[13] = CFSTR("EntryCreated");
    v42[14] = &unk_1E5F20278;
    v42[15] = &unk_1E5F20290;
    v43[14] = CFSTR("EntryEdited");
    v43[15] = CFSTR("EntryDeleted");
    v42[16] = &unk_1E5F202A8;
    v42[17] = &unk_1E5F202C0;
    v43[16] = CFSTR("EntryCancelled");
    v43[17] = CFSTR("Annotated");
    v42[18] = &unk_1E5F202D8;
    v42[19] = &unk_1E5F202F0;
    v43[18] = CFSTR("Positive");
    v43[19] = CFSTR("Negative");
    v42[20] = &unk_1E5F20308;
    v42[21] = &unk_1E5F20320;
    v43[20] = CFSTR("Neutral");
    v43[21] = CFSTR("Rejected");
    v42[22] = &unk_1E5F20338;
    v42[23] = &unk_1E5F20350;
    v43[22] = CFSTR("Accepted");
    v43[23] = CFSTR("Posted");
    v42[24] = &unk_1E5F20368;
    v42[25] = &unk_1E5F20380;
    v43[24] = CFSTR("Filtered");
    v43[25] = CFSTR("EntryCreatedWithUpdates");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "suggestionType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v40[0] = &unk_1E5F20128;
    v40[1] = &unk_1E5F20140;
    v41[0] = CFSTR("Unknown");
    v41[1] = CFSTR("EntryCreated");
    v40[2] = &unk_1E5F20158;
    v40[3] = &unk_1E5F20170;
    v41[2] = CFSTR("EntryEdited");
    v41[3] = CFSTR("EntryDeleted");
    v40[4] = &unk_1E5F20188;
    v41[4] = CFSTR("EntryCancelled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "appEntryEventType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    self = v28;
    v25 = 0;
  }
  else
  {
    objc_msgSend(v16, "startDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = &unk_1E5F20128;
    v38[1] = &unk_1E5F20140;
    v39[0] = CFSTR("Unknown");
    v39[1] = CFSTR("Visit");
    v38[2] = &unk_1E5F20158;
    v38[3] = &unk_1E5F20170;
    v39[2] = CFSTR("Workout");
    v39[3] = CFSTR("MediaOnRepeat");
    v38[4] = &unk_1E5F20188;
    v38[5] = &unk_1E5F201A0;
    v39[4] = CFSTR("LeisureMedia");
    v39[5] = CFSTR("PhotoMoment");
    v38[6] = &unk_1E5F201B8;
    v38[7] = &unk_1E5F201D0;
    v39[6] = CFSTR("MediaPlaySessions");
    v39[7] = CFSTR("Topic");
    v38[8] = &unk_1E5F201E8;
    v38[9] = &unk_1E5F20200;
    v39[8] = CFSTR("TravelEvent");
    v39[9] = CFSTR("SharedWithYouEvent");
    v38[10] = &unk_1E5F20218;
    v38[11] = &unk_1E5F20230;
    v39[10] = CFSTR("SignificantContact");
    v39[11] = CFSTR("StructuredEvent");
    v38[12] = &unk_1E5F20248;
    v38[13] = &unk_1E5F20260;
    v39[12] = CFSTR("NLEvent");
    v39[13] = CFSTR("MindfulSession");
    v38[14] = &unk_1E5F20278;
    v38[15] = &unk_1E5F20290;
    v39[14] = CFSTR("SharedPhoto");
    v39[15] = CFSTR("ProximityEvent");
    v38[16] = &unk_1E5F202A8;
    v38[17] = &unk_1E5F202C0;
    v39[16] = CFSTR("MotionActivity");
    v39[17] = CFSTR("PhotoMemory");
    v38[18] = &unk_1E5F202D8;
    v38[19] = &unk_1E5F202F0;
    v39[18] = CFSTR("TextCelebration");
    v39[19] = CFSTR("Books");
    v38[20] = &unk_1E5F20308;
    v38[21] = &unk_1E5F20320;
    v39[20] = CFSTR("ScreenTimeEvent");
    v39[21] = CFSTR("SoConEvent");
    v38[22] = &unk_1E5F20338;
    v38[23] = &unk_1E5F20350;
    v39[22] = CFSTR("LifeEvent");
    v39[23] = CFSTR("PDenEvent");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "category"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v21 = 0;
    v24 = 0;
  }

  LODWORD(v27) = a9;
  v36 = -[BMMomentsEventData initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:](self, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:", v30, v15, v32, v33, v34, a8, v27, v37, v31, v25, v29, 0, v21, v24, 0,
          0,
          0);

  return v36;
}

- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9 startDate:(id)a10 endDate:(id)a11 categoryOfEvent:(id)a12 bundleInterface:(id)a13 bundleEvergreenType:(id)a14 sugSeetEngType:(id)a15 appEntryEngType:(id)a16 megaSignalTypeUsed:(id)a17 viewVisibleSuggestionsCount:(id)a18 viewTotalSuggestionsCount:(id)a19
{
  uint64_t v20;
  uint64_t v21;

  LODWORD(v21) = 0;
  LODWORD(v20) = a9;
  return -[BMMomentsEventData initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](self, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", a3, a4, a5, a6, a7, *(_QWORD *)&a8, v20, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           v21,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

@end
