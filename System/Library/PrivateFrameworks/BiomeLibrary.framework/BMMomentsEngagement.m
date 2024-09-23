@implementation BMMomentsEngagement

- (BMMomentsEngagement)initWithSuggestionEvent:(id)a3 entryEvent:(id)a4 clientActivityEvent:(id)a5
{
  return -[BMMomentsEngagement initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](self, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0);
}

- (BMMomentsEngagement)initWithSuggestionEvent:(id)a3 entryEvent:(id)a4 clientActivityEvent:(id)a5 onboardingFlowCompletionState:(int)a6 isJournalAppInstalled:(id)a7 isJournalAppLocked:(id)a8 isJournalSuggestionSkipped:(id)a9 isActivitySettingsSwitchEnabled:(id)a10 isCommunicationSettingsSwitchEnabled:(id)a11 isSignificantLocationSettingsSwitchEnabled:(id)a12 isMediaSettingsSwitchEnabled:(id)a13 isNearbyPeopleSettingsSwitchEnabled:(id)a14 isPhotoSettingsSwitchEnabled:(id)a15 isStateOfMindSettingsSwitchEnabled:(id)a16 isReflectionSettingsSwitchEnabled:(id)a17 isBroadSystemLocationSettingsSwitchEnabled:(id)a18
{
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BMMomentsEngagement *v33;
  id v36;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v41 = a3;
  v40 = a4;
  v36 = a5;
  v39 = a5;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v45 = a10;
  v25 = v24;
  v44 = a11;
  v43 = a12;
  v26 = v23;
  v42 = a13;
  v27 = v22;
  v28 = a14;
  v29 = a15;
  v30 = a16;
  v31 = a17;
  v32 = a18;
  v46.receiver = self;
  v46.super_class = (Class)BMMomentsEngagement;
  v33 = -[BMEventBase init](&v46, sel_init);
  if (v33)
  {
    v33->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v33->_suggestionEvent, a3);
    objc_storeStrong((id *)&v33->_entryEvent, a4);
    objc_storeStrong((id *)&v33->_clientActivityEvent, v36);
    v33->_onboardingFlowCompletionState = a6;
    if (v27)
    {
      v33->_hasIsJournalAppInstalled = 1;
      v33->_isJournalAppInstalled = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v33->_hasIsJournalAppInstalled = 0;
      v33->_isJournalAppInstalled = 0;
    }
    if (v26)
    {
      v33->_hasIsJournalAppLocked = 1;
      v33->_isJournalAppLocked = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v33->_hasIsJournalAppLocked = 0;
      v33->_isJournalAppLocked = 0;
    }
    if (v25)
    {
      v33->_hasIsJournalSuggestionSkipped = 1;
      v33->_isJournalSuggestionSkipped = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v33->_hasIsJournalSuggestionSkipped = 0;
      v33->_isJournalSuggestionSkipped = 0;
    }
    if (v45)
    {
      v33->_hasIsActivitySettingsSwitchEnabled = 1;
      v33->_isActivitySettingsSwitchEnabled = objc_msgSend(v45, "BOOLValue");
    }
    else
    {
      v33->_hasIsActivitySettingsSwitchEnabled = 0;
      v33->_isActivitySettingsSwitchEnabled = 0;
    }
    if (v44)
    {
      v33->_hasIsCommunicationSettingsSwitchEnabled = 1;
      v33->_isCommunicationSettingsSwitchEnabled = objc_msgSend(v44, "BOOLValue");
    }
    else
    {
      v33->_hasIsCommunicationSettingsSwitchEnabled = 0;
      v33->_isCommunicationSettingsSwitchEnabled = 0;
    }
    if (v43)
    {
      v33->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
      v33->_isSignificantLocationSettingsSwitchEnabled = objc_msgSend(v43, "BOOLValue");
    }
    else
    {
      v33->_hasIsSignificantLocationSettingsSwitchEnabled = 0;
      v33->_isSignificantLocationSettingsSwitchEnabled = 0;
    }
    if (v42)
    {
      v33->_hasIsMediaSettingsSwitchEnabled = 1;
      v33->_isMediaSettingsSwitchEnabled = objc_msgSend(v42, "BOOLValue");
    }
    else
    {
      v33->_hasIsMediaSettingsSwitchEnabled = 0;
      v33->_isMediaSettingsSwitchEnabled = 0;
    }
    if (v28)
    {
      v33->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
      v33->_isNearbyPeopleSettingsSwitchEnabled = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v33->_hasIsNearbyPeopleSettingsSwitchEnabled = 0;
      v33->_isNearbyPeopleSettingsSwitchEnabled = 0;
    }
    if (v29)
    {
      v33->_hasIsPhotoSettingsSwitchEnabled = 1;
      v33->_isPhotoSettingsSwitchEnabled = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v33->_hasIsPhotoSettingsSwitchEnabled = 0;
      v33->_isPhotoSettingsSwitchEnabled = 0;
    }
    if (v30)
    {
      v33->_hasIsStateOfMindSettingsSwitchEnabled = 1;
      v33->_isStateOfMindSettingsSwitchEnabled = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v33->_hasIsStateOfMindSettingsSwitchEnabled = 0;
      v33->_isStateOfMindSettingsSwitchEnabled = 0;
    }
    if (v31)
    {
      v33->_hasIsReflectionSettingsSwitchEnabled = 1;
      v33->_isReflectionSettingsSwitchEnabled = objc_msgSend(v31, "BOOLValue");
    }
    else
    {
      v33->_hasIsReflectionSettingsSwitchEnabled = 0;
      v33->_isReflectionSettingsSwitchEnabled = 0;
    }
    if (v32)
    {
      v33->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
      v33->_isBroadSystemLocationSettingsSwitchEnabled = objc_msgSend(v32, "BOOLValue");
    }
    else
    {
      v33->_hasIsBroadSystemLocationSettingsSwitchEnabled = 0;
      v33->_isBroadSystemLocationSettingsSwitchEnabled = 0;
    }
  }

  return v33;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
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

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMomentsEngagement suggestionEvent](self, "suggestionEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagement entryEvent](self, "entryEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagement clientActivityEvent](self, "clientActivityEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataOnboardingFlowCompletionAsString(-[BMMomentsEngagement onboardingFlowCompletionState](self, "onboardingFlowCompletionState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isJournalAppInstalled](self, "isJournalAppInstalled"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isJournalAppLocked](self, "isJournalAppLocked"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMMomentsEngagement with suggestionEvent: %@, entryEvent: %@, clientActivityEvent: %@, onboardingFlowCompletionState: %@, isJournalAppInstalled: %@, isJournalAppLocked: %@, isJournalSuggestionSkipped: %@, isActivitySettingsSwitchEnabled: %@, isCommunicationSettingsSwitchEnabled: %@, isSignificantLocationSettingsSwitchEnabled: %@, isMediaSettingsSwitchEnabled: %@, isNearbyPeopleSettingsSwitchEnabled: %@, isPhotoSettingsSwitchEnabled: %@, isStateOfMindSettingsSwitchEnabled: %@, isReflectionSettingsSwitchEnabled: %@, isBroadSystemLocationSettingsSwitchEnabled: %@"), v21, v17, v20, v16, v15, v14, v13, v12, v11, v10, v9, v8, v3, v4, v5, v6);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEngagement *v5;
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
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char v113;
  BOOL v114;
  uint64_t v115;
  BMMomentsEngagement *v116;
  objc_super v118;
  uint64_t v119;
  uint64_t v120;

  v4 = a3;
  v118.receiver = self;
  v118.super_class = (Class)BMMomentsEngagement;
  v5 = -[BMEventBase init](&v118, sel_init);
  if (!v5)
    goto LABEL_181;
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
          v119 = 0;
          v120 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_180;
          v20 = -[BMMomentsEngagementSuggestionEvent initByReadFrom:]([BMMomentsEngagementSuggestionEvent alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_180;
          v21 = 48;
          goto LABEL_31;
        case 2u:
          v119 = 0;
          v120 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_180;
          v20 = -[BMMomentsEngagementAppEntryEvent initByReadFrom:]([BMMomentsEngagementAppEntryEvent alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_180;
          v21 = 56;
          goto LABEL_31;
        case 3u:
          v119 = 0;
          v120 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_180;
          v20 = -[BMMomentsEngagementClientActivityEvent initByReadFrom:]([BMMomentsEngagementClientActivityEvent alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_180;
          v21 = 64;
LABEL_31:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 4u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
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
                  LODWORD(v25) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v25) = 0;
LABEL_126:
          if (v25 >= 5)
            LODWORD(v25) = 0;
          v5->_onboardingFlowCompletionState = v25;
          continue;
        case 5u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasIsJournalAppInstalled = 1;
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
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v32 = 0;
LABEL_132:
          v114 = v32 != 0;
          v115 = 16;
          goto LABEL_177;
        case 6u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasIsJournalAppLocked = 1;
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
                  v39 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v39 = 0;
LABEL_136:
          v114 = v39 != 0;
          v115 = 18;
          goto LABEL_177;
        case 7u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v5->_hasIsJournalSuggestionSkipped = 1;
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
                  v46 = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v46 = 0;
LABEL_140:
          v114 = v46 != 0;
          v115 = 20;
          goto LABEL_177;
        case 8u:
          v51 = 0;
          v52 = 0;
          v53 = 0;
          v5->_hasIsActivitySettingsSwitchEnabled = 1;
          while (2)
          {
            v54 = *v6;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v55);
              *(_QWORD *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                v17 = v52++ >= 9;
                if (v17)
                {
                  v53 = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v53 = 0;
LABEL_144:
          v114 = v53 != 0;
          v115 = 22;
          goto LABEL_177;
        case 9u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v5->_hasIsCommunicationSettingsSwitchEnabled = 1;
          while (2)
          {
            v61 = *v6;
            v62 = *(_QWORD *)&v4[v61];
            v63 = v62 + 1;
            if (v62 == -1 || v63 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v64 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v62);
              *(_QWORD *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                v17 = v59++ >= 9;
                if (v17)
                {
                  v60 = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v60 = 0;
LABEL_148:
          v114 = v60 != 0;
          v115 = 24;
          goto LABEL_177;
        case 0xAu:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          v5->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
          while (2)
          {
            v68 = *v6;
            v69 = *(_QWORD *)&v4[v68];
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v69);
              *(_QWORD *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                v17 = v66++ >= 9;
                if (v17)
                {
                  v67 = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v67 = 0;
LABEL_152:
          v114 = v67 != 0;
          v115 = 26;
          goto LABEL_177;
        case 0xBu:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          v5->_hasIsMediaSettingsSwitchEnabled = 1;
          while (2)
          {
            v75 = *v6;
            v76 = *(_QWORD *)&v4[v75];
            v77 = v76 + 1;
            if (v76 == -1 || v77 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v78 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v76);
              *(_QWORD *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                v17 = v73++ >= 9;
                if (v17)
                {
                  v74 = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v74 = 0;
LABEL_156:
          v114 = v74 != 0;
          v115 = 28;
          goto LABEL_177;
        case 0xCu:
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v5->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
          while (2)
          {
            v82 = *v6;
            v83 = *(_QWORD *)&v4[v82];
            v84 = v83 + 1;
            if (v83 == -1 || v84 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v83);
              *(_QWORD *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                v17 = v80++ >= 9;
                if (v17)
                {
                  v81 = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v81 = 0;
LABEL_160:
          v114 = v81 != 0;
          v115 = 30;
          goto LABEL_177;
        case 0xDu:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          v5->_hasIsPhotoSettingsSwitchEnabled = 1;
          while (2)
          {
            v89 = *v6;
            v90 = *(_QWORD *)&v4[v89];
            v91 = v90 + 1;
            if (v90 == -1 || v91 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v90);
              *(_QWORD *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                v17 = v87++ >= 9;
                if (v17)
                {
                  v88 = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v88 = 0;
LABEL_164:
          v114 = v88 != 0;
          v115 = 32;
          goto LABEL_177;
        case 0xEu:
          v93 = 0;
          v94 = 0;
          v95 = 0;
          v5->_hasIsStateOfMindSettingsSwitchEnabled = 1;
          while (2)
          {
            v96 = *v6;
            v97 = *(_QWORD *)&v4[v96];
            v98 = v97 + 1;
            if (v97 == -1 || v98 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v99 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v97);
              *(_QWORD *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                v17 = v94++ >= 9;
                if (v17)
                {
                  v95 = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v95 = 0;
LABEL_168:
          v114 = v95 != 0;
          v115 = 34;
          goto LABEL_177;
        case 0xFu:
          v100 = 0;
          v101 = 0;
          v102 = 0;
          v5->_hasIsReflectionSettingsSwitchEnabled = 1;
          while (2)
          {
            v103 = *v6;
            v104 = *(_QWORD *)&v4[v103];
            v105 = v104 + 1;
            if (v104 == -1 || v105 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v106 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v104);
              *(_QWORD *)&v4[v103] = v105;
              v102 |= (unint64_t)(v106 & 0x7F) << v100;
              if (v106 < 0)
              {
                v100 += 7;
                v17 = v101++ >= 9;
                if (v17)
                {
                  v102 = 0;
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v102 = 0;
LABEL_172:
          v114 = v102 != 0;
          v115 = 36;
          goto LABEL_177;
        case 0x10u:
          v107 = 0;
          v108 = 0;
          v109 = 0;
          v5->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_180;
          continue;
      }
      while (1)
      {
        v110 = *v6;
        v111 = *(_QWORD *)&v4[v110];
        v112 = v111 + 1;
        if (v111 == -1 || v112 > *(_QWORD *)&v4[*v7])
          break;
        v113 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v111);
        *(_QWORD *)&v4[v110] = v112;
        v109 |= (unint64_t)(v113 & 0x7F) << v107;
        if ((v113 & 0x80) == 0)
          goto LABEL_174;
        v107 += 7;
        v17 = v108++ >= 9;
        if (v17)
        {
          v109 = 0;
          goto LABEL_176;
        }
      }
      v4[*v8] = 1;
LABEL_174:
      if (v4[*v8])
        v109 = 0;
LABEL_176:
      v114 = v109 != 0;
      v115 = 38;
LABEL_177:
      *((_BYTE *)&v5->super.super.isa + v115) = v114;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_180:
    v116 = 0;
  else
LABEL_181:
    v116 = v5;

  return v116;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_suggestionEvent)
  {
    PBDataWriterPlaceMark();
    -[BMMomentsEngagementSuggestionEvent writeTo:](self->_suggestionEvent, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_entryEvent)
  {
    PBDataWriterPlaceMark();
    -[BMMomentsEngagementAppEntryEvent writeTo:](self->_entryEvent, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_clientActivityEvent)
  {
    PBDataWriterPlaceMark();
    -[BMMomentsEngagementClientActivityEvent writeTo:](self->_clientActivityEvent, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
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
  -[BMMomentsEngagement writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id *v28;
  BMMomentsEngagementClientActivityEvent *v29;
  id v30;
  void *v31;
  BMMomentsEngagement *v32;
  id v33;
  BMMomentsEngagement *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id *v39;
  BMMomentsEngagement *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  BMMomentsEngagement *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  BMMomentsEngagement *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  id *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  BMMomentsEngagement *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  void *v164;
  void *v165;
  id *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  uint64_t v172;
  void *v173;
  id v174;
  id v175;
  void *v176;
  BMMomentsEngagement *v177;
  BMMomentsEngagement *v178;
  BMMomentsEngagement *v179;
  BMMomentsEngagement *v180;
  BMMomentsEngagement *v181;
  BMMomentsEngagement *v182;
  BMMomentsEngagement *v183;
  BMMomentsEngagement *v184;
  void *v185;
  id v186;
  uint64_t v187;
  void *v188;
  id v189;
  id v190;
  void *v191;
  void *v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  void *v198;
  id v199;
  id v200;
  id v201;
  void *v202;
  id v203;
  id *v204;
  uint64_t v205;
  id v206;
  BMMomentsEngagementClientActivityEvent *v207;
  BMMomentsEngagementAppEntryEvent *v208;
  BMMomentsEngagementSuggestionEvent *v209;
  id v210;
  id v211;
  id v212;
  id v213;
  uint64_t v214;
  void *v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  id *v219;
  uint64_t v220;
  id v221;
  uint64_t v222;
  id v223;
  uint64_t v224;
  id v225;
  uint64_t v226;
  id v227;
  uint64_t v228;
  id v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  void *v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  id v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  BMMomentsEngagementAppEntryEvent *v243;
  uint64_t v244;
  _QWORD v245[3];

  v245[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v209 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v213 = 0;
    v210 = v7;
    v209 = -[BMMomentsEngagementSuggestionEvent initWithJSONDictionary:error:]([BMMomentsEngagementSuggestionEvent alloc], "initWithJSONDictionary:error:", v210, &v213);
    v24 = v213;
    if (v24)
    {
      v25 = v24;
      if (a4)
        *a4 = objc_retainAutorelease(v24);

LABEL_57:
      v32 = 0;
      goto LABEL_115;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entryEvent"));
    v210 = (id)objc_claimAutoreleasedReturnValue();
    if (!v210 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v208 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v210;
      v212 = 0;
      v208 = -[BMMomentsEngagementAppEntryEvent initWithJSONDictionary:error:]([BMMomentsEngagementAppEntryEvent alloc], "initWithJSONDictionary:error:", v8, &v212);
      v26 = v212;
      if (v26)
      {
        v27 = v26;
        if (a4)
          *a4 = objc_retainAutorelease(v26);

LABEL_62:
        v32 = 0;
        goto LABEL_114;
      }

LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientActivityEvent"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v207 = 0;
        goto LABEL_10;
      }
      v28 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a4 = (id *)v8;
        v211 = 0;
        v29 = -[BMMomentsEngagementClientActivityEvent initWithJSONDictionary:error:]([BMMomentsEngagementClientActivityEvent alloc], "initWithJSONDictionary:error:", a4, &v211);
        v30 = v211;
        if (v30)
        {
          v31 = v30;
          if (v28)
            *v28 = objc_retainAutorelease(v30);

          v32 = 0;
          goto LABEL_113;
        }
        v207 = v29;

        a4 = v28;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onboardingFlowCompletionState"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v206 = v8;
        if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v204 = v9;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v94 = v9;
              if (!a4)
              {
                v32 = 0;
                goto LABEL_112;
              }
              v95 = a4;
              v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v205 = *MEMORY[0x1E0D025B8];
              v238 = *MEMORY[0x1E0CB2D50];
              v97 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("onboardingFlowCompletionState"));
              v239 = v97;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v239, &v238, 1);
              v98 = objc_claimAutoreleasedReturnValue();
              v99 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v205, 2, v98);
              a4 = 0;
              v32 = 0;
              *v95 = v99;
              v10 = (void *)v98;
              v9 = v94;
              v58 = (void *)v97;
LABEL_111:

LABEL_112:
              v8 = v206;
              v29 = v207;
              goto LABEL_113;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataOnboardingFlowCompletionFromString(v9));
            v204 = (id *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v204 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isJournalAppInstalled"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v58 = 0;
              v32 = 0;
              a4 = v204;
              goto LABEL_111;
            }
            v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v53 = *MEMORY[0x1E0D025B8];
            v236 = *MEMORY[0x1E0CB2D50];
            v54 = self;
            v55 = objc_alloc(MEMORY[0x1E0CB3940]);
            v153 = objc_opt_class();
            v56 = v55;
            self = v54;
            v203 = (id)objc_msgSend(v56, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v153, CFSTR("isJournalAppInstalled"));
            v237 = v203;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v237, &v236, 1);
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2);
            v32 = 0;
            v58 = 0;
            *a4 = v57;
            a4 = v204;
            goto LABEL_110;
          }
          v201 = v10;
        }
        else
        {
          v201 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isJournalAppLocked"));
        v11 = objc_claimAutoreleasedReturnValue();
        v202 = (void *)v11;
        if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v203 = 0;
              v32 = 0;
              a4 = v204;
              v58 = v201;
              goto LABEL_110;
            }
            v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v177 = self;
            v60 = *MEMORY[0x1E0D025B8];
            v234 = *MEMORY[0x1E0CB2D50];
            v61 = v9;
            v62 = objc_alloc(MEMORY[0x1E0CB3940]);
            v154 = objc_opt_class();
            v63 = v62;
            v9 = v61;
            v199 = (id)objc_msgSend(v63, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v154, CFSTR("isJournalAppLocked"));
            v235 = v199;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v60;
            self = v177;
            v32 = 0;
            v203 = 0;
            *a4 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v64, 2, v13);
            goto LABEL_145;
          }
          v203 = v12;
        }
        else
        {
          v203 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isJournalSuggestionSkipped"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v192 = v7;
          v14 = v10;
          v15 = v13;
          v199 = 0;
LABEL_22:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isActivitySettingsSwitchEnabled"));
          v16 = objc_claimAutoreleasedReturnValue();
          v198 = (void *)v16;
          if (v16 && (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v32 = 0;
                a4 = v204;
                v58 = v201;
                v13 = v15;
                v10 = v14;
                v65 = 0;
                v7 = v192;
                goto LABEL_108;
              }
              v197 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v179 = self;
              v88 = *MEMORY[0x1E0D025B8];
              v230 = *MEMORY[0x1E0CB2D50];
              v13 = v15;
              v89 = v9;
              v90 = objc_alloc(MEMORY[0x1E0CB3940]);
              v156 = objc_opt_class();
              v91 = v90;
              v10 = v14;
              v9 = v89;
              v195 = (id)objc_msgSend(v91, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v156, CFSTR("isActivitySettingsSwitchEnabled"));
              v231 = v195;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v231, &v230, 1);
              v92 = objc_claimAutoreleasedReturnValue();
              v93 = v88;
              self = v179;
              v191 = (void *)v92;
              v32 = 0;
              v65 = 0;
              *a4 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v93, 2);
              a4 = v204;
              v58 = v201;
              v7 = v192;
              goto LABEL_107;
            }
            v196 = v17;
          }
          else
          {
            v196 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCommunicationSettingsSwitchEnabled"));
          v18 = objc_claimAutoreleasedReturnValue();
          v191 = (void *)v18;
          if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v195 = 0;
                v32 = 0;
                a4 = v204;
                v58 = v201;
                v13 = v15;
                v10 = v14;
                v7 = v192;
                v65 = v196;
                goto LABEL_107;
              }
              v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v180 = self;
              v101 = *MEMORY[0x1E0D025B8];
              v228 = *MEMORY[0x1E0CB2D50];
              v168 = v15;
              v102 = v9;
              v103 = objc_alloc(MEMORY[0x1E0CB3940]);
              v157 = objc_opt_class();
              v104 = v103;
              v10 = v14;
              v9 = v102;
              v65 = v196;
              v13 = v168;
              v189 = (id)objc_msgSend(v104, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v157, CFSTR("isCommunicationSettingsSwitchEnabled"));
              v229 = v189;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
              v105 = objc_claimAutoreleasedReturnValue();
              v106 = v101;
              self = v180;
              v188 = (void *)v105;
              v32 = 0;
              v195 = 0;
              *a4 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v106, 2);
              a4 = v204;
              v58 = v201;
              v7 = v192;
LABEL_106:

LABEL_107:
LABEL_108:

LABEL_109:
LABEL_110:

              goto LABEL_111;
            }
            v195 = v19;
          }
          else
          {
            v195 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSignificantLocationSettingsSwitchEnabled"));
          v20 = objc_claimAutoreleasedReturnValue();
          v188 = (void *)v20;
          if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v7 = v192;
              if (!a4)
              {
                v189 = 0;
                v32 = 0;
                a4 = v204;
                v58 = v201;
                v13 = v15;
                v10 = v14;
                v65 = v196;
                goto LABEL_106;
              }
              v190 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v181 = self;
              v107 = *MEMORY[0x1E0D025B8];
              v226 = *MEMORY[0x1E0CB2D50];
              v108 = v15;
              v109 = v9;
              v110 = objc_alloc(MEMORY[0x1E0CB3940]);
              v158 = objc_opt_class();
              v111 = v110;
              v10 = v14;
              v9 = v109;
              v65 = v196;
              v13 = v108;
              v186 = (id)objc_msgSend(v111, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v158, CFSTR("isSignificantLocationSettingsSwitchEnabled"));
              v227 = v186;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v227, &v226, 1);
              v112 = objc_claimAutoreleasedReturnValue();
              v113 = v107;
              self = v181;
              v176 = (void *)v112;
              v114 = (id)objc_msgSend(v190, "initWithDomain:code:userInfo:", v113, 2);
              v32 = 0;
              v189 = 0;
              *a4 = v114;
              goto LABEL_160;
            }
            v189 = v21;
          }
          else
          {
            v189 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMediaSettingsSwitchEnabled"));
          v22 = objc_claimAutoreleasedReturnValue();
          v13 = v15;
          v176 = (void *)v22;
          if (!v22)
          {
            v186 = 0;
            v7 = v192;
            v10 = v14;
            goto LABEL_83;
          }
          v23 = (void *)v22;
          objc_opt_class();
          v7 = v192;
          v10 = v14;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v186 = 0;
LABEL_83:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isNearbyPeopleSettingsSwitchEnabled"));
            v66 = objc_claimAutoreleasedReturnValue();
            v173 = (void *)v66;
            if (v66 && (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v174 = 0;
                  v32 = 0;
                  a4 = v204;
                  v58 = v201;
                  v65 = v196;
                  goto LABEL_104;
                }
                v175 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v182 = self;
                v121 = *MEMORY[0x1E0D025B8];
                v222 = *MEMORY[0x1E0CB2D50];
                v122 = v13;
                v123 = v9;
                v124 = objc_alloc(MEMORY[0x1E0CB3940]);
                v160 = objc_opt_class();
                v125 = v124;
                v9 = v123;
                v65 = v196;
                v13 = v122;
                v193 = (id)objc_msgSend(v125, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v160, CFSTR("isNearbyPeopleSettingsSwitchEnabled"));
                v223 = v193;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v223, &v222, 1);
                v126 = objc_claimAutoreleasedReturnValue();
                v127 = v121;
                self = v182;
                v170 = (void *)v126;
                v128 = (id)objc_msgSend(v175, "initWithDomain:code:userInfo:", v127, 2);
                v32 = 0;
                v174 = 0;
                *a4 = v128;
                a4 = v204;
                v58 = v201;
                goto LABEL_103;
              }
              v174 = v67;
            }
            else
            {
              v174 = 0;
            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPhotoSettingsSwitchEnabled"));
            v68 = objc_claimAutoreleasedReturnValue();
            v170 = (void *)v68;
            if (v68 && (v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v193 = 0;
                  v32 = 0;
                  a4 = v204;
                  v58 = v201;
                  v65 = v196;
                  goto LABEL_103;
                }
                v194 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v183 = self;
                v129 = *MEMORY[0x1E0D025B8];
                v220 = *MEMORY[0x1E0CB2D50];
                v130 = v13;
                v131 = v9;
                v132 = objc_alloc(MEMORY[0x1E0CB3940]);
                v161 = objc_opt_class();
                v133 = v132;
                v9 = v131;
                v65 = v196;
                v13 = v130;
                v171 = (id)objc_msgSend(v133, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v161, CFSTR("isPhotoSettingsSwitchEnabled"));
                v221 = v171;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1);
                v134 = objc_claimAutoreleasedReturnValue();
                v135 = v129;
                self = v183;
                v169 = (void *)v134;
                v136 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v135, 2);
                v32 = 0;
                v193 = 0;
                *a4 = v136;
LABEL_102:
                a4 = v204;
                v58 = v201;

LABEL_103:
LABEL_104:

LABEL_105:
                goto LABEL_106;
              }
              v193 = v69;
            }
            else
            {
              v193 = 0;
            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isStateOfMindSettingsSwitchEnabled"));
            v70 = objc_claimAutoreleasedReturnValue();
            v65 = v196;
            v169 = (void *)v70;
            if (v70 && (v71 = (void *)v70, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v171 = 0;
                  v32 = 0;
                  goto LABEL_102;
                }
                v137 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v166 = a4;
                v172 = *MEMORY[0x1E0D025B8];
                v218 = *MEMORY[0x1E0CB2D50];
                v138 = v13;
                v139 = v9;
                v140 = objc_alloc(MEMORY[0x1E0CB3940]);
                v162 = objc_opt_class();
                v141 = v140;
                v9 = v139;
                v13 = v138;
                a4 = (id *)objc_msgSend(v141, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v162, CFSTR("isStateOfMindSettingsSwitchEnabled"));
                v219 = a4;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v219, &v218, 1);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v142 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v172, 2, v78);
                v32 = 0;
                v171 = 0;
                *v166 = v142;
                goto LABEL_101;
              }
              v171 = v71;
            }
            else
            {
              v171 = 0;
            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isReflectionSettingsSwitchEnabled"));
            v72 = objc_claimAutoreleasedReturnValue();
            v164 = v10;
            v165 = (void *)v72;
            v167 = v13;
            if (v72 && (v73 = (void *)v72, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v32 = 0;
                  goto LABEL_100;
                }
                v76 = v196;
                v143 = a4;
                v144 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v184 = self;
                v145 = *MEMORY[0x1E0D025B8];
                v216 = *MEMORY[0x1E0CB2D50];
                v77 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isReflectionSettingsSwitchEnabled"));
                v217 = v77;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v217, &v216, 1);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v146 = v145;
                self = v184;
                v147 = (id)objc_msgSend(v144, "initWithDomain:code:userInfo:", v146, 2, v75);
                v32 = 0;
                a4 = 0;
                *v143 = v147;
                goto LABEL_99;
              }
              v74 = a4;
              a4 = v73;
            }
            else
            {
              v74 = a4;
              a4 = 0;
            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isBroadSystemLocationSettingsSwitchEnabled"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (v75 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v76 = v196;
                if (v74)
                {
                  v163 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v185 = v9;
                  v148 = self;
                  v149 = *MEMORY[0x1E0D025B8];
                  v214 = *MEMORY[0x1E0CB2D50];
                  v150 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isBroadSystemLocationSettingsSwitchEnabled"));
                  v215 = v150;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  v152 = v149;
                  self = v148;
                  v9 = v185;
                  *v74 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v152, 2, v151);

                }
                v77 = 0;
                v32 = 0;
                goto LABEL_99;
              }
              v76 = v196;
              v77 = v75;
            }
            else
            {
              v76 = v196;
              v77 = 0;
            }
            self = objc_retain(-[BMMomentsEngagement initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](self, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v209, v208, v207, objc_msgSend(v204, "intValue"), v201, v203, v199, v76, v195, v189, v186, v174,
                       v193,
                       v171,
                       a4,
                       v77));
            v32 = self;
LABEL_99:
            v10 = v164;

            v13 = v167;
            v65 = v76;
LABEL_100:
            v78 = v165;
LABEL_101:

            goto LABEL_102;
          }
          objc_opt_class();
          v65 = v196;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v186 = v23;
            goto LABEL_83;
          }
          if (a4)
          {
            v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v187 = *MEMORY[0x1E0D025B8];
            v224 = *MEMORY[0x1E0CB2D50];
            v116 = v13;
            v117 = v9;
            v118 = objc_alloc(MEMORY[0x1E0CB3940]);
            v159 = objc_opt_class();
            v119 = v118;
            v9 = v117;
            v13 = v116;
            v174 = (id)objc_msgSend(v119, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v159, CFSTR("isMediaSettingsSwitchEnabled"));
            v225 = v174;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v225, &v224, 1);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v187, 2);
            v32 = 0;
            v186 = 0;
            *a4 = v120;
            a4 = v204;
            v58 = v201;
            goto LABEL_104;
          }
          v186 = 0;
          v32 = 0;
LABEL_160:
          a4 = v204;
          v58 = v201;
          goto LABEL_105;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v192 = v7;
          v14 = v10;
          v15 = v13;
          v199 = v13;
          goto LABEL_22;
        }
        if (a4)
        {
          v200 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v178 = self;
          v80 = *MEMORY[0x1E0D025B8];
          v232 = *MEMORY[0x1E0CB2D50];
          v81 = v13;
          v82 = v9;
          v83 = objc_alloc(MEMORY[0x1E0CB3940]);
          v155 = objc_opt_class();
          v84 = v83;
          v9 = v82;
          v13 = v81;
          v65 = (void *)objc_msgSend(v84, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v155, CFSTR("isJournalSuggestionSkipped"));
          v233 = v65;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
          v85 = objc_claimAutoreleasedReturnValue();
          v86 = v80;
          self = v178;
          v198 = (void *)v85;
          v87 = (id)objc_msgSend(v200, "initWithDomain:code:userInfo:", v86, 2);
          v32 = 0;
          v199 = 0;
          *a4 = v87;
          a4 = v204;
          v58 = v201;
          goto LABEL_108;
        }
        v199 = 0;
        v32 = 0;
LABEL_145:
        a4 = v204;
        v58 = v201;
        goto LABEL_109;
      }
      if (a4)
      {
        v45 = v8;
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v47 = self;
        v48 = *MEMORY[0x1E0D025B8];
        v240 = *MEMORY[0x1E0CB2D50];
        v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("clientActivityEvent"));
        v241 = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v241, &v240, 1);
        a4 = (id *)objc_claimAutoreleasedReturnValue();
        v50 = v46;
        v8 = v45;
        v51 = v48;
        self = v47;
        v29 = (BMMomentsEngagementClientActivityEvent *)v49;
        v32 = 0;
        *v28 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, a4);
LABEL_113:

        goto LABEL_114;
      }
      goto LABEL_62;
    }
    if (a4)
    {
      v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v39 = a4;
      v40 = self;
      v41 = *MEMORY[0x1E0D025B8];
      v242 = *MEMORY[0x1E0CB2D50];
      v208 = (BMMomentsEngagementAppEntryEvent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("entryEvent"));
      v243 = v208;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v243, &v242, 1);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v38;
      v8 = (id)v42;
      v44 = v41;
      self = v40;
      v32 = 0;
      *v39 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v42);
LABEL_114:

      goto LABEL_115;
    }
    goto LABEL_57;
  }
  if (a4)
  {
    v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = self;
    v35 = *MEMORY[0x1E0D025B8];
    v244 = *MEMORY[0x1E0CB2D50];
    v209 = (BMMomentsEngagementSuggestionEvent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("suggestionEvent"));
    v245[0] = v209;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v245, &v244, 1);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v35;
    self = v34;
    v210 = (id)v36;
    v32 = 0;
    *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2);
LABEL_115:

    goto LABEL_116;
  }
  v32 = 0;
LABEL_116:

  return v32;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
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
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[16];
  _QWORD v58[18];

  v58[16] = *MEMORY[0x1E0C80C00];
  -[BMMomentsEngagement suggestionEvent](self, "suggestionEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMMomentsEngagement entryEvent](self, "entryEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMMomentsEngagement clientActivityEvent](self, "clientActivityEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEngagement onboardingFlowCompletionState](self, "onboardingFlowCompletionState"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (-[BMMomentsEngagement hasIsJournalAppInstalled](self, "hasIsJournalAppInstalled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isJournalAppInstalled](self, "isJournalAppInstalled"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (-[BMMomentsEngagement hasIsJournalAppLocked](self, "hasIsJournalAppLocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isJournalAppLocked](self, "isJournalAppLocked"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if (-[BMMomentsEngagement hasIsJournalSuggestionSkipped](self, "hasIsJournalSuggestionSkipped"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  if (-[BMMomentsEngagement hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
    v56 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = 0;
  }
  if (-[BMMomentsEngagement hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
    v55 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v55 = 0;
  }
  if (-[BMMomentsEngagement hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
    v54 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v54 = 0;
  }
  if (-[BMMomentsEngagement hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
    v53 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v53 = 0;
  }
  if (-[BMMomentsEngagement hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
    v52 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  if (-[BMMomentsEngagement hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
    v51 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = 0;
  }
  if (-[BMMomentsEngagement hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
    v50 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
  }
  if (-[BMMomentsEngagement hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
    v49 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }
  if (-[BMMomentsEngagement hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagement isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  v57[0] = CFSTR("suggestionEvent");
  v14 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v14;
  v58[0] = v14;
  v57[1] = CFSTR("entryEvent");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v15;
  v58[1] = v15;
  v57[2] = CFSTR("clientActivityEvent");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v16;
  v58[2] = v16;
  v57[3] = CFSTR("onboardingFlowCompletionState");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v17;
  v58[3] = v17;
  v57[4] = CFSTR("isJournalAppInstalled");
  v18 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v18;
  v58[4] = v18;
  v57[5] = CFSTR("isJournalAppLocked");
  v19 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v19;
  v58[5] = v19;
  v57[6] = CFSTR("isJournalSuggestionSkipped");
  v20 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v20;
  v58[6] = v20;
  v57[7] = CFSTR("isActivitySettingsSwitchEnabled");
  v21 = (uint64_t)v56;
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v58[7] = v21;
  v57[8] = CFSTR("isCommunicationSettingsSwitchEnabled");
  v22 = (uint64_t)v55;
  if (!v55)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v22;
  v36 = (void *)v21;
  v58[8] = v22;
  v57[9] = CFSTR("isSignificantLocationSettingsSwitchEnabled");
  v23 = (uint64_t)v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v4;
  v33 = v23;
  v58[9] = v23;
  v57[10] = CFSTR("isMediaSettingsSwitchEnabled");
  v24 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v23, v35, v21, v37, v38, v39, v40, v41, v42, v43);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = v10;
  v46 = (void *)v9;
  v58[10] = v24;
  v57[11] = CFSTR("isNearbyPeopleSettingsSwitchEnabled");
  v25 = v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45 = v12;
  v26 = (void *)v6;
  v58[11] = v25;
  v57[12] = CFSTR("isPhotoSettingsSwitchEnabled");
  v27 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v8;
  v58[12] = v27;
  v57[13] = CFSTR("isStateOfMindSettingsSwitchEnabled");
  v29 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v58[13] = v29;
  v57[14] = CFSTR("isReflectionSettingsSwitchEnabled");
  v30 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v58[14] = v30;
  v57[15] = CFSTR("isBroadSystemLocationSettingsSwitchEnabled");
  v31 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v58[15] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 16, v33);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v49)
  if (!v50)

  if (!v51)
  if (!v52)

  if (!v53)
  if (!v54)

  if (!v55)
  if (v56)
  {
    if (v45)
      goto LABEL_87;
  }
  else
  {

    if (v45)
    {
LABEL_87:
      if (v11)
        goto LABEL_88;
      goto LABEL_96;
    }
  }

  if (v11)
  {
LABEL_88:
    if (v47)
      goto LABEL_89;
    goto LABEL_97;
  }
LABEL_96:

  if (v47)
  {
LABEL_89:
    if (v46)
      goto LABEL_90;
    goto LABEL_98;
  }
LABEL_97:

  if (v46)
  {
LABEL_90:
    if (v28)
      goto LABEL_91;
    goto LABEL_99;
  }
LABEL_98:

  if (v28)
  {
LABEL_91:
    if (v26)
      goto LABEL_92;
LABEL_100:

    if (v48)
      goto LABEL_93;
LABEL_101:

    goto LABEL_93;
  }
LABEL_99:

  if (!v26)
    goto LABEL_100;
LABEL_92:
  if (!v48)
    goto LABEL_101;
LABEL_93:

  return v44;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _BOOL4 v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMomentsEngagement suggestionEvent](self, "suggestionEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionEvent");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMomentsEngagement suggestionEvent](self, "suggestionEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_76;
    }
    -[BMMomentsEngagement entryEvent](self, "entryEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryEvent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMomentsEngagement entryEvent](self, "entryEvent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entryEvent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_76;
    }
    -[BMMomentsEngagement clientActivityEvent](self, "clientActivityEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientActivityEvent");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMomentsEngagement clientActivityEvent](self, "clientActivityEvent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientActivityEvent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_76;
    }
    v25 = -[BMMomentsEngagement onboardingFlowCompletionState](self, "onboardingFlowCompletionState");
    if (v25 == objc_msgSend(v5, "onboardingFlowCompletionState"))
    {
      if (!-[BMMomentsEngagement hasIsJournalAppInstalled](self, "hasIsJournalAppInstalled")
        && !objc_msgSend(v5, "hasIsJournalAppInstalled")
        || -[BMMomentsEngagement hasIsJournalAppInstalled](self, "hasIsJournalAppInstalled")
        && objc_msgSend(v5, "hasIsJournalAppInstalled")
        && (v26 = -[BMMomentsEngagement isJournalAppInstalled](self, "isJournalAppInstalled"),
            v26 == objc_msgSend(v5, "isJournalAppInstalled")))
      {
        if (!-[BMMomentsEngagement hasIsJournalAppLocked](self, "hasIsJournalAppLocked")
          && !objc_msgSend(v5, "hasIsJournalAppLocked")
          || -[BMMomentsEngagement hasIsJournalAppLocked](self, "hasIsJournalAppLocked")
          && objc_msgSend(v5, "hasIsJournalAppLocked")
          && (v27 = -[BMMomentsEngagement isJournalAppLocked](self, "isJournalAppLocked"),
              v27 == objc_msgSend(v5, "isJournalAppLocked")))
        {
          if (!-[BMMomentsEngagement hasIsJournalSuggestionSkipped](self, "hasIsJournalSuggestionSkipped")
            && !objc_msgSend(v5, "hasIsJournalSuggestionSkipped")
            || -[BMMomentsEngagement hasIsJournalSuggestionSkipped](self, "hasIsJournalSuggestionSkipped")
            && objc_msgSend(v5, "hasIsJournalSuggestionSkipped")
            && (v28 = -[BMMomentsEngagement isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"),
                v28 == objc_msgSend(v5, "isJournalSuggestionSkipped")))
          {
            if (!-[BMMomentsEngagement hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled")
              && !objc_msgSend(v5, "hasIsActivitySettingsSwitchEnabled")
              || -[BMMomentsEngagement hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled")
              && objc_msgSend(v5, "hasIsActivitySettingsSwitchEnabled")
              && (v29 = -[BMMomentsEngagement isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"),
                  v29 == objc_msgSend(v5, "isActivitySettingsSwitchEnabled")))
            {
              if (!-[BMMomentsEngagement hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsCommunicationSettingsSwitchEnabled")|| -[BMMomentsEngagement hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsCommunicationSettingsSwitchEnabled")&& (v30 = -[BMMomentsEngagement isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"), v30 == objc_msgSend(v5, "isCommunicationSettingsSwitchEnabled")))
              {
                if (!-[BMMomentsEngagement hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsSignificantLocationSettingsSwitchEnabled")|| -[BMMomentsEngagement hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsSignificantLocationSettingsSwitchEnabled")&& (v31 = -[BMMomentsEngagement isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"), v31 == objc_msgSend(v5, "isSignificantLocationSettingsSwitchEnabled")))
                {
                  if (!-[BMMomentsEngagement hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled")
                    && !objc_msgSend(v5, "hasIsMediaSettingsSwitchEnabled")
                    || -[BMMomentsEngagement hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled")
                    && objc_msgSend(v5, "hasIsMediaSettingsSwitchEnabled")
                    && (v32 = -[BMMomentsEngagement isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"),
                        v32 == objc_msgSend(v5, "isMediaSettingsSwitchEnabled")))
                  {
                    if (!-[BMMomentsEngagement hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsNearbyPeopleSettingsSwitchEnabled")|| -[BMMomentsEngagement hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsNearbyPeopleSettingsSwitchEnabled")&& (v33 = -[BMMomentsEngagement isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"), v33 == objc_msgSend(v5, "isNearbyPeopleSettingsSwitchEnabled")))
                    {
                      if (!-[BMMomentsEngagement hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsPhotoSettingsSwitchEnabled")|| -[BMMomentsEngagement hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsPhotoSettingsSwitchEnabled")&& (v34 = -[BMMomentsEngagement isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"), v34 == objc_msgSend(v5, "isPhotoSettingsSwitchEnabled")))
                      {
                        if (!-[BMMomentsEngagement hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsStateOfMindSettingsSwitchEnabled")|| -[BMMomentsEngagement hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsStateOfMindSettingsSwitchEnabled")&& (v35 = -[BMMomentsEngagement isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"), v35 == objc_msgSend(v5, "isStateOfMindSettingsSwitchEnabled")))
                        {
                          if (!-[BMMomentsEngagement hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsReflectionSettingsSwitchEnabled")|| -[BMMomentsEngagement hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsReflectionSettingsSwitchEnabled")&& (v36 = -[BMMomentsEngagement isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"), v36 == objc_msgSend(v5, "isReflectionSettingsSwitchEnabled")))
                          {
                            if (!-[BMMomentsEngagement hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& !objc_msgSend(v5, "hasIsBroadSystemLocationSettingsSwitchEnabled"))
                            {
                              LOBYTE(v12) = 1;
                              goto LABEL_77;
                            }
                            if (-[BMMomentsEngagement hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsBroadSystemLocationSettingsSwitchEnabled"))
                            {
                              v37 = -[BMMomentsEngagement isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled");
                              v12 = v37 ^ objc_msgSend(v5, "isBroadSystemLocationSettingsSwitchEnabled") ^ 1;
LABEL_77:

                              goto LABEL_78;
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
LABEL_76:
    LOBYTE(v12) = 0;
    goto LABEL_77;
  }
  LOBYTE(v12) = 0;
LABEL_78:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMMomentsEngagementSuggestionEvent)suggestionEvent
{
  return self->_suggestionEvent;
}

- (BMMomentsEngagementAppEntryEvent)entryEvent
{
  return self->_entryEvent;
}

- (BMMomentsEngagementClientActivityEvent)clientActivityEvent
{
  return self->_clientActivityEvent;
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
  objc_storeStrong((id *)&self->_clientActivityEvent, 0);
  objc_storeStrong((id *)&self->_entryEvent, 0);
  objc_storeStrong((id *)&self->_suggestionEvent, 0);
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

    v4 = -[BMMomentsEngagement initByReadFrom:]([BMMomentsEngagement alloc], "initByReadFrom:", v7);
    v4[10] = 0;

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
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[18];

  v20[16] = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("suggestionEvent_json"), 5, 1, &__block_literal_global_717_45432);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("entryEvent_json"), 5, 1, &__block_literal_global_718_45433);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("clientActivityEvent_json"), 5, 1, &__block_literal_global_719_45434);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("onboardingFlowCompletionState"), 0, 0, 4, 4, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJournalAppInstalled"), 0, 0, 5, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJournalAppLocked"), 0, 0, 6, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isJournalSuggestionSkipped"), 0, 0, 7, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isActivitySettingsSwitchEnabled"), 0, 0, 8, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isCommunicationSettingsSwitchEnabled"), 0, 0, 9, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSignificantLocationSettingsSwitchEnabled"), 0, 0, 10, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMediaSettingsSwitchEnabled"), 0, 0, 11, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNearbyPeopleSettingsSwitchEnabled"), 0, 0, 12, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPhotoSettingsSwitchEnabled"), 0, 0, 13, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isStateOfMindSettingsSwitchEnabled"), 0, 0, 14, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isReflectionSettingsSwitchEnabled"), 0, 0, 15, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isBroadSystemLocationSettingsSwitchEnabled"), 0, 0, 16, 12, 0);
  v20[0] = v19;
  v20[1] = v18;
  v20[2] = v17;
  v20[3] = v16;
  v20[4] = v15;
  v20[5] = v14;
  v20[6] = v2;
  v20[7] = v3;
  v20[8] = v4;
  v20[9] = v5;
  v20[10] = v13;
  v20[11] = v6;
  v20[12] = v7;
  v20[13] = v12;
  v20[14] = v8;
  v20[15] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 16);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D680;
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
  _QWORD v20[18];

  v20[16] = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionEvent"), 1, 14, objc_opt_class());
  v20[0] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entryEvent"), 2, 14, objc_opt_class());
  v20[1] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientActivityEvent"), 3, 14, objc_opt_class());
  v20[2] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("onboardingFlowCompletionState"), 4, 4, 0);
  v20[3] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJournalAppInstalled"), 5, 12, 0);
  v20[4] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJournalAppLocked"), 6, 12, 0);
  v20[5] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isJournalSuggestionSkipped"), 7, 12, 0);
  v20[6] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isActivitySettingsSwitchEnabled"), 8, 12, 0);
  v20[7] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isCommunicationSettingsSwitchEnabled"), 9, 12, 0);
  v20[8] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSignificantLocationSettingsSwitchEnabled"), 10, 12, 0);
  v20[9] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMediaSettingsSwitchEnabled"), 11, 12, 0);
  v20[10] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNearbyPeopleSettingsSwitchEnabled"), 12, 12, 0);
  v20[11] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPhotoSettingsSwitchEnabled"), 13, 12, 0);
  v20[12] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isStateOfMindSettingsSwitchEnabled"), 14, 12, 0);
  v20[13] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isReflectionSettingsSwitchEnabled"), 15, 12, 0);
  v20[14] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isBroadSystemLocationSettingsSwitchEnabled"), 16, 12, 0);
  v20[15] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __30__BMMomentsEngagement_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientActivityEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __30__BMMomentsEngagement_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __30__BMMomentsEngagement_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestionEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
