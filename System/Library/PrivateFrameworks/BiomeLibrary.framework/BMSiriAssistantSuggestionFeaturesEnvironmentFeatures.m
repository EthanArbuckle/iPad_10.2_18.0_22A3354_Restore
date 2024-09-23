@implementation BMSiriAssistantSuggestionFeaturesEnvironmentFeatures

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)initWithFocusMode:(id)a3 deviceMotion:(id)a4 location:(int)a5 isPlayingMedia:(id)a6 isAirplaneMode:(id)a7 isTimerRunning:(id)a8 isConnectedToWifi:(id)a9 hasInternetConnection:(id)a10 isScreenSharing:(id)a11 audioIsMuted:(id)a12 screenBrightness:(id)a13 homeGraph:(id)a14 batteryIsCharging:(id)a15 isLowBatteryMode:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *v31;
  int v32;
  id v35;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v35 = a4;
  v41 = a4;
  v37 = a6;
  v40 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = v21;
  v25 = a11;
  v26 = v20;
  v27 = a12;
  v28 = a13;
  v39 = a14;
  v29 = a15;
  v30 = a16;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeatures;
  v31 = -[BMEventBase init](&v43, sel_init);
  if (v31)
  {
    v31->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v31->_focusMode, a3);
    objc_storeStrong((id *)&v31->_deviceMotion, v35);
    v31->_location = a5;
    objc_storeStrong((id *)&v31->_isPlayingMedia, v37);
    if (v26)
    {
      v31->_hasIsAirplaneMode = 1;
      v31->_isAirplaneMode = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v31->_hasIsAirplaneMode = 0;
      v31->_isAirplaneMode = 0;
    }
    if (v24)
    {
      v31->_hasIsTimerRunning = 1;
      v31->_isTimerRunning = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v31->_hasIsTimerRunning = 0;
      v31->_isTimerRunning = 0;
    }
    if (v22)
    {
      v31->_hasIsConnectedToWifi = 1;
      v31->_isConnectedToWifi = objc_msgSend(v22, "BOOLValue");
    }
    else
    {
      v31->_hasIsConnectedToWifi = 0;
      v31->_isConnectedToWifi = 0;
    }
    if (v23)
    {
      v31->_hasHasInternetConnection = 1;
      v31->_hasInternetConnection = objc_msgSend(v23, "BOOLValue");
    }
    else
    {
      v31->_hasHasInternetConnection = 0;
      v31->_hasInternetConnection = 0;
    }
    if (v25)
    {
      v31->_hasIsScreenSharing = 1;
      v31->_isScreenSharing = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v31->_hasIsScreenSharing = 0;
      v31->_isScreenSharing = 0;
    }
    if (v27)
    {
      v31->_hasAudioIsMuted = 1;
      v31->_audioIsMuted = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v31->_hasAudioIsMuted = 0;
      v31->_audioIsMuted = 0;
    }
    if (v28)
    {
      v31->_hasScreenBrightness = 1;
      v32 = objc_msgSend(v28, "intValue");
    }
    else
    {
      v31->_hasScreenBrightness = 0;
      v32 = -1;
    }
    v31->_screenBrightness = v32;
    objc_storeStrong((id *)&v31->_homeGraph, a14);
    if (v29)
    {
      v31->_hasBatteryIsCharging = 1;
      v31->_batteryIsCharging = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v31->_hasBatteryIsCharging = 0;
      v31->_batteryIsCharging = 0;
    }
    if (v30)
    {
      v31->_hasIsLowBatteryMode = 1;
      v31->_isLowBatteryMode = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v31->_hasIsLowBatteryMode = 0;
      v31->_isLowBatteryMode = 0;
    }
  }

  return v31;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures focusMode](self, "focusMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures deviceMotion](self, "deviceMotion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationAsString(-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures location](self, "location"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isPlayingMedia](self, "isPlayingMedia");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isAirplaneMode](self, "isAirplaneMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isTimerRunning](self, "isTimerRunning"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isConnectedToWifi](self, "isConnectedToWifi"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasInternetConnection](self, "hasInternetConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isScreenSharing](self, "isScreenSharing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures audioIsMuted](self, "audioIsMuted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures screenBrightness](self, "screenBrightness"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures homeGraph](self, "homeGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures batteryIsCharging](self, "batteryIsCharging"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isLowBatteryMode](self, "isLowBatteryMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesEnvironmentFeatures with focusMode: %@, deviceMotion: %@, location: %@, isPlayingMedia: %@, isAirplaneMode: %@, isTimerRunning: %@, isConnectedToWifi: %@, hasInternetConnection: %@, isScreenSharing: %@, audioIsMuted: %@, screenBrightness: %@, homeGraph: %@, batteryIsCharging: %@, isLowBatteryMode: %@"), v15, v14, v19, v18, v11, v13, v12, v3, v10, v4, v5, v6, v7, v8);

  return (NSString *)v17;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *v5;
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
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
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
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v79;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *homeGraph;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  BOOL v95;
  uint64_t v96;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *v97;
  objc_super v99;
  uint64_t v100;
  uint64_t v101;

  v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeatures;
  v5 = -[BMEventBase init](&v99, sel_init);
  if (!v5)
    goto LABEL_145;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_32;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_32;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_102:
          if (v24 >= 4)
            LODWORD(v24) = 0;
          v5->_location = v24;
          continue;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
LABEL_32:
          v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 5u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasIsAirplaneMode = 1;
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
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v32 = 0;
LABEL_108:
          v95 = v32 != 0;
          v96 = 16;
          goto LABEL_141;
        case 6u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasIsTimerRunning = 1;
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
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v39 = 0;
LABEL_112:
          v95 = v39 != 0;
          v96 = 18;
          goto LABEL_141;
        case 7u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          v5->_hasIsConnectedToWifi = 1;
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
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v46 = 0;
LABEL_116:
          v95 = v46 != 0;
          v96 = 20;
          goto LABEL_141;
        case 8u:
          v51 = 0;
          v52 = 0;
          v53 = 0;
          v5->_hasHasInternetConnection = 1;
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
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v53 = 0;
LABEL_120:
          v95 = v53 != 0;
          v96 = 22;
          goto LABEL_141;
        case 9u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v5->_hasIsScreenSharing = 1;
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
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v60 = 0;
LABEL_124:
          v95 = v60 != 0;
          v96 = 24;
          goto LABEL_141;
        case 0xAu:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          v5->_hasAudioIsMuted = 1;
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
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v67 = 0;
LABEL_128:
          v95 = v67 != 0;
          v96 = 26;
          goto LABEL_141;
        case 0xBu:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          v5->_hasScreenBrightness = 1;
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
                  LODWORD(v74) = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v74) = 0;
LABEL_132:
          v5->_screenBrightness = v74;
          continue;
        case 0xCu:
          v100 = 0;
          v101 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_144;
          v79 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus initByReadFrom:]([BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus alloc], "initByReadFrom:", v4);
          if (!v79)
            goto LABEL_144;
          homeGraph = v5->_homeGraph;
          v5->_homeGraph = v79;

          PBReaderRecallMark();
          continue;
        case 0xDu:
          v81 = 0;
          v82 = 0;
          v83 = 0;
          v5->_hasBatteryIsCharging = 1;
          while (2)
          {
            v84 = *v6;
            v85 = *(_QWORD *)&v4[v84];
            v86 = v85 + 1;
            if (v85 == -1 || v86 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v87 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v85);
              *(_QWORD *)&v4[v84] = v86;
              v83 |= (unint64_t)(v87 & 0x7F) << v81;
              if (v87 < 0)
              {
                v81 += 7;
                v17 = v82++ >= 9;
                if (v17)
                {
                  v83 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v83 = 0;
LABEL_136:
          v95 = v83 != 0;
          v96 = 29;
          goto LABEL_141;
        case 0xEu:
          v88 = 0;
          v89 = 0;
          v90 = 0;
          v5->_hasIsLowBatteryMode = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_144;
          continue;
      }
      while (1)
      {
        v91 = *v6;
        v92 = *(_QWORD *)&v4[v91];
        v93 = v92 + 1;
        if (v92 == -1 || v93 > *(_QWORD *)&v4[*v7])
          break;
        v94 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v92);
        *(_QWORD *)&v4[v91] = v93;
        v90 |= (unint64_t)(v94 & 0x7F) << v88;
        if ((v94 & 0x80) == 0)
          goto LABEL_138;
        v88 += 7;
        v17 = v89++ >= 9;
        if (v17)
        {
          v90 = 0;
          goto LABEL_140;
        }
      }
      v4[*v8] = 1;
LABEL_138:
      if (v4[*v8])
        v90 = 0;
LABEL_140:
      v95 = v90 != 0;
      v96 = 31;
LABEL_141:
      *((_BYTE *)&v5->super.super.isa + v96) = v95;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_144:
    v97 = 0;
  else
LABEL_145:
    v97 = v5;

  return v97;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_focusMode)
    PBDataWriterWriteStringField();
  if (self->_deviceMotion)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_isPlayingMedia)
    PBDataWriterWriteStringField();
  if (self->_hasIsAirplaneMode)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsTimerRunning)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsConnectedToWifi)
    PBDataWriterWriteBOOLField();
  if (self->_hasHasInternetConnection)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsScreenSharing)
    PBDataWriterWriteBOOLField();
  if (self->_hasAudioIsMuted)
    PBDataWriterWriteBOOLField();
  if (self->_hasScreenBrightness)
    PBDataWriterWriteInt32Field();
  if (self->_homeGraph)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus writeTo:](self->_homeGraph, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasBatteryIsCharging)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsLowBatteryMode)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
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
  id v22;
  uint64_t v23;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  void *v122;
  id v123;
  id v124;
  id *v125;
  id v126;
  id v127;
  id v128;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *v129;
  id v130;
  id v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  id v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  _QWORD v159[3];

  v159[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("focusMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v130 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceMotion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = self;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v9 = 0;
          v24 = 0;
          goto LABEL_94;
        }
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v156 = *MEMORY[0x1E0CB2D50];
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceMotion"));
        v157 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v26;
        v10 = (void *)v28;
        v9 = 0;
        v24 = 0;
        *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v29, 2, v28);
        goto LABEL_93;
      }
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("location"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v126 = v10;
      }
      else
      {
        v111 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v63 = v10;
          if (!a4)
          {
            v27 = 0;
            v24 = 0;
            goto LABEL_93;
          }
          v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v65 = *MEMORY[0x1E0D025B8];
          v154 = *MEMORY[0x1E0CB2D50];
          v127 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("location"));
          v155 = v127;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
          v66 = a4;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          v24 = 0;
          *v66 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2, v11);
          v10 = v63;
          v9 = v111;
LABEL_92:

LABEL_93:
          self = v129;
          goto LABEL_94;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationFromString(v10));
        v126 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v126 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPlayingMedia"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v125)
        {
          v127 = 0;
          v24 = 0;
          v27 = v126;
          goto LABEL_92;
        }
        v128 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v106 = v10;
        v35 = *MEMORY[0x1E0D025B8];
        v152 = *MEMORY[0x1E0CB2D50];
        v123 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("isPlayingMedia"));
        v153 = v123;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v35;
        v10 = v106;
        v38 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v37, 2, v36);
        v24 = 0;
        v127 = 0;
        *v125 = v38;
        v12 = (void *)v36;
        v27 = v126;
        goto LABEL_91;
      }
      v127 = v11;
    }
    else
    {
      v127 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAirplaneMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v125)
        {
          v123 = 0;
          v24 = 0;
          v27 = v126;
          goto LABEL_91;
        }
        v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = v9;
        v40 = v10;
        v41 = *MEMORY[0x1E0D025B8];
        v150 = *MEMORY[0x1E0CB2D50];
        v120 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isAirplaneMode"));
        v151 = v120;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v41;
        v10 = v40;
        v9 = v39;
        v11 = v122;
        v44 = (id)objc_msgSend(v124, "initWithDomain:code:userInfo:", v43, 2, v42);
        v24 = 0;
        v123 = 0;
        *v125 = v44;
        v13 = (void *)v42;
        v27 = v126;
LABEL_90:

LABEL_91:
        goto LABEL_92;
      }
      v123 = v12;
    }
    else
    {
      v123 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isTimerRunning"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v125)
        {
          v120 = 0;
          v24 = 0;
          v27 = v126;
          goto LABEL_90;
        }
        v121 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = v9;
        v46 = v10;
        v47 = *MEMORY[0x1E0D025B8];
        v148 = *MEMORY[0x1E0CB2D50];
        v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isTimerRunning"));
        v149 = v118;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v47;
        v10 = v46;
        v9 = v45;
        v11 = v122;
        v117 = (void *)v48;
        v50 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v49, 2);
        v24 = 0;
        v120 = 0;
        *v125 = v50;
        v27 = v126;
        goto LABEL_89;
      }
      v14 = v7;
      v15 = v8;
      v120 = v13;
    }
    else
    {
      v14 = v7;
      v15 = v8;
      v120 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isConnectedToWifi"));
    v16 = objc_claimAutoreleasedReturnValue();
    v114 = v13;
    v117 = (void *)v16;
    if (v16 && (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v56 = v12;
        if (!v125)
        {
          v118 = 0;
          v24 = 0;
          v27 = v126;
          v13 = v114;
          v8 = v15;
          v7 = v14;
          v11 = v122;
          goto LABEL_89;
        }
        v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = v9;
        v58 = v10;
        v59 = *MEMORY[0x1E0D025B8];
        v146 = *MEMORY[0x1E0CB2D50];
        v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isConnectedToWifi"));
        v147 = v115;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v59;
        v10 = v58;
        v9 = v57;
        v113 = (void *)v60;
        v62 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v61, 2);
        v24 = 0;
        v118 = 0;
        *v125 = v62;
        goto LABEL_131;
      }
      v118 = v17;
    }
    else
    {
      v118 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasInternetConnection"));
    v18 = objc_claimAutoreleasedReturnValue();
    v113 = (void *)v18;
    if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v115 = 0;
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v115 = v19;
LABEL_25:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isScreenSharing"));
      v20 = objc_claimAutoreleasedReturnValue();
      v110 = v15;
      v108 = (void *)v20;
      if (v20)
      {
        v21 = (void *)v20;
        objc_opt_class();
        v7 = v14;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          v11 = v122;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v125)
            {
              v109 = 0;
              v24 = 0;
              v27 = v126;
              v8 = v110;
              goto LABEL_87;
            }
            v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v76 = v9;
            v77 = v10;
            v78 = *MEMORY[0x1E0D025B8];
            v142 = *MEMORY[0x1E0CB2D50];
            v107 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isScreenSharing"));
            v143 = v107;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
            v79 = objc_claimAutoreleasedReturnValue();
            v80 = v78;
            v10 = v77;
            v9 = v76;
            v11 = v122;
            v104 = (void *)v79;
            v24 = 0;
            v109 = 0;
            *v125 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v80, 2);
            v27 = v126;
            v8 = v110;
            goto LABEL_86;
          }
          v109 = v21;
LABEL_50:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("audioIsMuted"));
          v30 = objc_claimAutoreleasedReturnValue();
          v8 = v110;
          v104 = (void *)v30;
          v105 = v10;
          v112 = v9;
          if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v125)
              {
                v107 = 0;
                v24 = 0;
                v27 = v126;
                goto LABEL_86;
              }
              v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v82 = *MEMORY[0x1E0D025B8];
              v140 = *MEMORY[0x1E0CB2D50];
              v102 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("audioIsMuted"));
              v141 = v102;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
              v83 = objc_claimAutoreleasedReturnValue();
              v84 = v81;
              v32 = (void *)v83;
              v85 = v82;
              v10 = v105;
              v24 = 0;
              v107 = 0;
              *v125 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 2, v83);
              v27 = v126;
              goto LABEL_84;
            }
            v107 = v31;
          }
          else
          {
            v107 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("screenBrightness"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v12;
          if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v8 = v110;
              if (!v125)
              {
                v102 = 0;
                v24 = 0;
                v27 = v126;
                goto LABEL_85;
              }
              v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v86 = *MEMORY[0x1E0D025B8];
              v138 = *MEMORY[0x1E0CB2D50];
              v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("screenBrightness"));
              v139 = v54;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
              v87 = objc_claimAutoreleasedReturnValue();
              v88 = v86;
              v34 = (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)v87;
              v89 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v88, 2);
              v24 = 0;
              v102 = 0;
              *v125 = v89;
              goto LABEL_81;
            }
            v102 = v32;
          }
          else
          {
            v102 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeGraph"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_opt_class();
            v8 = v110;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v125)
                {
                  v24 = 0;
                  v27 = v126;
                  goto LABEL_83;
                }
                v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v90 = *MEMORY[0x1E0D025B8];
                v136 = *MEMORY[0x1E0CB2D50];
                v34 = (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("homeGraph"));
                v137 = v34;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                *v125 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v90, 2, v91);

                v24 = 0;
                v54 = v33;
                v27 = v126;
LABEL_82:

                v33 = v54;
LABEL_83:

                v10 = v105;
                v12 = v101;
LABEL_84:
                v13 = v114;
LABEL_85:

                v9 = v112;
LABEL_86:

LABEL_87:
LABEL_88:

LABEL_89:
                goto LABEL_90;
              }
              v54 = v33;
              v131 = 0;
              v34 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus alloc], "initWithJSONDictionary:error:", v54, &v131);
              v67 = v131;
              if (v67)
              {
                v68 = v67;
                v27 = v126;
                if (v125)
                  *v125 = objc_retainAutorelease(v67);

                v24 = 0;
                goto LABEL_82;
              }

            }
          }
          else
          {
            v34 = 0;
            v8 = v110;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("batteryIsCharging"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v125)
              {
                v24 = 0;
                v99 = 0;
                goto LABEL_80;
              }
              v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v97 = *MEMORY[0x1E0D025B8];
              v134 = *MEMORY[0x1E0CB2D50];
              v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("batteryIsCharging"));
              v135 = v53;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v97, 2, v52);
              v24 = 0;
              v99 = 0;
              *v125 = v92;
              goto LABEL_79;
            }
            v99 = v51;
          }
          else
          {
            v99 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isLowBatteryMode"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v125)
              {
                v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v95 = *MEMORY[0x1E0D025B8];
                v132 = *MEMORY[0x1E0CB2D50];
                v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isLowBatteryMode"));
                v133 = v93;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                *v125 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v95, 2, v94);

              }
              v53 = 0;
              v24 = 0;
              goto LABEL_79;
            }
            v53 = v52;
          }
          else
          {
            v53 = 0;
          }
          v24 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures initWithFocusMode:deviceMotion:location:isPlayingMedia:isAirplaneMode:isTimerRunning:isConnectedToWifi:hasInternetConnection:isScreenSharing:audioIsMuted:screenBrightness:homeGraph:batteryIsCharging:isLowBatteryMode:](v129, "initWithFocusMode:deviceMotion:location:isPlayingMedia:isAirplaneMode:isTimerRunning:isConnectedToWifi:hasInternetConnection:isScreenSharing:audioIsMuted:screenBrightness:homeGraph:batteryIsCharging:isLowBatteryMode:", v130, v112, objc_msgSend(v126, "intValue"), v127, v123, v120, v118, v115, v109, v107, v102, v34, v99, v53);
          v129 = v24;
LABEL_79:

          v11 = v122;
LABEL_80:

          v54 = v33;
LABEL_81:
          v27 = v126;
          goto LABEL_82;
        }
        v109 = 0;
      }
      else
      {
        v109 = 0;
        v7 = v14;
      }
      v11 = v122;
      goto LABEL_50;
    }
    v56 = v12;
    if (v125)
    {
      v116 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v69 = v9;
      v70 = v10;
      v71 = *MEMORY[0x1E0D025B8];
      v144 = *MEMORY[0x1E0CB2D50];
      v109 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasInternetConnection"));
      v145 = v109;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = v71;
      v10 = v70;
      v9 = v69;
      v108 = (void *)v72;
      v74 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v73, 2);
      v24 = 0;
      v115 = 0;
      *v125 = v74;
      v27 = v126;
      v13 = v114;
      v8 = v15;
      v7 = v14;
      v11 = v122;
      goto LABEL_87;
    }
    v115 = 0;
    v24 = 0;
LABEL_131:
    v27 = v126;
    v12 = v56;
    v13 = v114;
    v8 = v15;
    v7 = v14;
    v11 = v122;
    goto LABEL_88;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v130 = 0;
    v24 = 0;
    goto LABEL_95;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = *MEMORY[0x1E0D025B8];
  v158 = *MEMORY[0x1E0CB2D50];
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("focusMode"));
  v159[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, &v158, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = 0;
  v24 = 0;
  *a4 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v8);
LABEL_94:

LABEL_95:
  return v24;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[14];
  _QWORD v47[16];

  v47[14] = *MEMORY[0x1E0C80C00];
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures focusMode](self, "focusMode");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures deviceMotion](self, "deviceMotion");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures location](self, "location"));
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isPlayingMedia](self, "isPlayingMedia");
  v6 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsAirplaneMode](self, "hasIsAirplaneMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isAirplaneMode](self, "isAirplaneMode"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsTimerRunning](self, "hasIsTimerRunning"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isTimerRunning](self, "isTimerRunning"));
    v45 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsConnectedToWifi](self, "hasIsConnectedToWifi"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isConnectedToWifi](self, "isConnectedToWifi"));
    v44 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasHasInternetConnection](self, "hasHasInternetConnection"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasInternetConnection](self, "hasInternetConnection"));
    v43 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v43 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsScreenSharing](self, "hasIsScreenSharing"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isScreenSharing](self, "isScreenSharing"));
    v42 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasAudioIsMuted](self, "hasAudioIsMuted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures audioIsMuted](self, "audioIsMuted"));
    v41 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasScreenBrightness](self, "hasScreenBrightness"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures screenBrightness](self, "screenBrightness"));
    v40 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v40 = 0;
  }
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures homeGraph](self, "homeGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasBatteryIsCharging](self, "hasBatteryIsCharging"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures batteryIsCharging](self, "batteryIsCharging"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsLowBatteryMode](self, "hasIsLowBatteryMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isLowBatteryMode](self, "isLowBatteryMode"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v46[0] = CFSTR("focusMode");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v11;
  v47[0] = v11;
  v46[1] = CFSTR("deviceMotion");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v12;
  v47[1] = v12;
  v46[2] = CFSTR("location");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v13;
  v47[2] = v13;
  v46[3] = CFSTR("isPlayingMedia");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v14;
  v47[3] = v14;
  v46[4] = CFSTR("isAirplaneMode");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v4;
  v29 = (void *)v15;
  v47[4] = v15;
  v46[5] = CFSTR("isTimerRunning");
  v16 = (uint64_t)v45;
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v6;
  v47[5] = v16;
  v46[6] = CFSTR("isConnectedToWifi");
  v17 = (uint64_t)v44;
  if (!v44)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v3;
  v47[6] = v17;
  v46[7] = CFSTR("hasInternetConnection");
  v18 = v43;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = v7;
  v47[7] = v18;
  v46[8] = CFSTR("isScreenSharing");
  v19 = v42;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v17;
  v28 = (void *)v16;
  v47[8] = v19;
  v46[9] = CFSTR("audioIsMuted");
  v20 = v41;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v5;
  v47[9] = v20;
  v46[10] = CFSTR("screenBrightness");
  v22 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[10] = v22;
  v46[11] = CFSTR("homeGraph");
  v23 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[11] = v23;
  v46[12] = CFSTR("batteryIsCharging");
  v24 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[12] = v24;
  v46[13] = CFSTR("isLowBatteryMode");
  v25 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[13] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 14);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_58;
  }
  else
  {

    if (v9)
      goto LABEL_58;
  }

LABEL_58:
  if (!v39)

  if (!v40)
  if (!v41)

  if (!v42)
  if (!v43)

  if (!v44)
  if (!v45)

  if (v35)
  {
    if (v36)
      goto LABEL_74;
  }
  else
  {

    if (v36)
    {
LABEL_74:
      if (v21)
        goto LABEL_75;
      goto LABEL_82;
    }
  }

  if (v21)
  {
LABEL_75:
    if (v37)
      goto LABEL_76;
LABEL_83:

    if (v38)
      goto LABEL_77;
LABEL_84:

    goto LABEL_77;
  }
LABEL_82:

  if (!v37)
    goto LABEL_83;
LABEL_76:
  if (!v38)
    goto LABEL_84;
LABEL_77:

  return v34;
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  _BOOL4 v40;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures focusMode](self, "focusMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusMode");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures focusMode](self, "focusMode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "focusMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_65;
    }
    -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures deviceMotion](self, "deviceMotion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceMotion");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures deviceMotion](self, "deviceMotion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceMotion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_65;
    }
    v19 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures location](self, "location");
    if (v19 == objc_msgSend(v5, "location"))
    {
      -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isPlayingMedia](self, "isPlayingMedia");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "isPlayingMedia");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isPlayingMedia](self, "isPlayingMedia");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "isPlayingMedia");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_65;
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsAirplaneMode](self, "hasIsAirplaneMode")
        || objc_msgSend(v5, "hasIsAirplaneMode"))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsAirplaneMode](self, "hasIsAirplaneMode"))
          goto LABEL_65;
        if (!objc_msgSend(v5, "hasIsAirplaneMode"))
          goto LABEL_65;
        v26 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isAirplaneMode](self, "isAirplaneMode");
        if (v26 != objc_msgSend(v5, "isAirplaneMode"))
          goto LABEL_65;
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsTimerRunning](self, "hasIsTimerRunning")
        || objc_msgSend(v5, "hasIsTimerRunning"))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsTimerRunning](self, "hasIsTimerRunning"))
          goto LABEL_65;
        if (!objc_msgSend(v5, "hasIsTimerRunning"))
          goto LABEL_65;
        v27 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isTimerRunning](self, "isTimerRunning");
        if (v27 != objc_msgSend(v5, "isTimerRunning"))
          goto LABEL_65;
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsConnectedToWifi](self, "hasIsConnectedToWifi")
        || objc_msgSend(v5, "hasIsConnectedToWifi"))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsConnectedToWifi](self, "hasIsConnectedToWifi"))
          goto LABEL_65;
        if (!objc_msgSend(v5, "hasIsConnectedToWifi"))
          goto LABEL_65;
        v28 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isConnectedToWifi](self, "isConnectedToWifi");
        if (v28 != objc_msgSend(v5, "isConnectedToWifi"))
          goto LABEL_65;
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasHasInternetConnection](self, "hasHasInternetConnection")|| objc_msgSend(v5, "hasHasInternetConnection"))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasHasInternetConnection](self, "hasHasInternetConnection"))goto LABEL_65;
        if (!objc_msgSend(v5, "hasHasInternetConnection"))
          goto LABEL_65;
        v29 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasInternetConnection](self, "hasInternetConnection");
        if (v29 != objc_msgSend(v5, "hasInternetConnection"))
          goto LABEL_65;
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsScreenSharing](self, "hasIsScreenSharing")
        || objc_msgSend(v5, "hasIsScreenSharing"))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsScreenSharing](self, "hasIsScreenSharing"))
          goto LABEL_65;
        if (!objc_msgSend(v5, "hasIsScreenSharing"))
          goto LABEL_65;
        v30 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isScreenSharing](self, "isScreenSharing");
        if (v30 != objc_msgSend(v5, "isScreenSharing"))
          goto LABEL_65;
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasAudioIsMuted](self, "hasAudioIsMuted")
        || objc_msgSend(v5, "hasAudioIsMuted"))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasAudioIsMuted](self, "hasAudioIsMuted"))
          goto LABEL_65;
        if (!objc_msgSend(v5, "hasAudioIsMuted"))
          goto LABEL_65;
        v31 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures audioIsMuted](self, "audioIsMuted");
        if (v31 != objc_msgSend(v5, "audioIsMuted"))
          goto LABEL_65;
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasScreenBrightness](self, "hasScreenBrightness")
        || objc_msgSend(v5, "hasScreenBrightness"))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasScreenBrightness](self, "hasScreenBrightness"))
          goto LABEL_65;
        if (!objc_msgSend(v5, "hasScreenBrightness"))
          goto LABEL_65;
        v32 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures screenBrightness](self, "screenBrightness");
        if (v32 != objc_msgSend(v5, "screenBrightness"))
          goto LABEL_65;
      }
      -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures homeGraph](self, "homeGraph");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homeGraph");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v33 == (void *)v34)
      {

      }
      else
      {
        v35 = (void *)v34;
        -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures homeGraph](self, "homeGraph");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "homeGraph");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "isEqual:", v37);

        if (!v38)
          goto LABEL_65;
      }
      if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasBatteryIsCharging](self, "hasBatteryIsCharging")
        && !objc_msgSend(v5, "hasBatteryIsCharging")
        || -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasBatteryIsCharging](self, "hasBatteryIsCharging")
        && objc_msgSend(v5, "hasBatteryIsCharging")
        && (v39 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures batteryIsCharging](self, "batteryIsCharging"),
            v39 == objc_msgSend(v5, "batteryIsCharging")))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsLowBatteryMode](self, "hasIsLowBatteryMode")
          && !objc_msgSend(v5, "hasIsLowBatteryMode"))
        {
          LOBYTE(v12) = 1;
          goto LABEL_66;
        }
        if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasIsLowBatteryMode](self, "hasIsLowBatteryMode")
          && objc_msgSend(v5, "hasIsLowBatteryMode"))
        {
          v40 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isLowBatteryMode](self, "isLowBatteryMode");
          v12 = v40 ^ objc_msgSend(v5, "isLowBatteryMode") ^ 1;
LABEL_66:

          goto LABEL_67;
        }
      }
    }
LABEL_65:
    LOBYTE(v12) = 0;
    goto LABEL_66;
  }
  LOBYTE(v12) = 0;
LABEL_67:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)focusMode
{
  return self->_focusMode;
}

- (NSString)deviceMotion
{
  return self->_deviceMotion;
}

- (int)location
{
  return self->_location;
}

- (NSString)isPlayingMedia
{
  return self->_isPlayingMedia;
}

- (BOOL)isAirplaneMode
{
  return self->_isAirplaneMode;
}

- (BOOL)hasIsAirplaneMode
{
  return self->_hasIsAirplaneMode;
}

- (void)setHasIsAirplaneMode:(BOOL)a3
{
  self->_hasIsAirplaneMode = a3;
}

- (BOOL)isTimerRunning
{
  return self->_isTimerRunning;
}

- (BOOL)hasIsTimerRunning
{
  return self->_hasIsTimerRunning;
}

- (void)setHasIsTimerRunning:(BOOL)a3
{
  self->_hasIsTimerRunning = a3;
}

- (BOOL)isConnectedToWifi
{
  return self->_isConnectedToWifi;
}

- (BOOL)hasIsConnectedToWifi
{
  return self->_hasIsConnectedToWifi;
}

- (void)setHasIsConnectedToWifi:(BOOL)a3
{
  self->_hasIsConnectedToWifi = a3;
}

- (BOOL)hasInternetConnection
{
  return self->_hasInternetConnection;
}

- (BOOL)hasHasInternetConnection
{
  return self->_hasHasInternetConnection;
}

- (void)setHasHasInternetConnection:(BOOL)a3
{
  self->_hasHasInternetConnection = a3;
}

- (BOOL)isScreenSharing
{
  return self->_isScreenSharing;
}

- (BOOL)hasIsScreenSharing
{
  return self->_hasIsScreenSharing;
}

- (void)setHasIsScreenSharing:(BOOL)a3
{
  self->_hasIsScreenSharing = a3;
}

- (BOOL)audioIsMuted
{
  return self->_audioIsMuted;
}

- (BOOL)hasAudioIsMuted
{
  return self->_hasAudioIsMuted;
}

- (void)setHasAudioIsMuted:(BOOL)a3
{
  self->_hasAudioIsMuted = a3;
}

- (int)screenBrightness
{
  return self->_screenBrightness;
}

- (BOOL)hasScreenBrightness
{
  return self->_hasScreenBrightness;
}

- (void)setHasScreenBrightness:(BOOL)a3
{
  self->_hasScreenBrightness = a3;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)homeGraph
{
  return self->_homeGraph;
}

- (BOOL)batteryIsCharging
{
  return self->_batteryIsCharging;
}

- (BOOL)hasBatteryIsCharging
{
  return self->_hasBatteryIsCharging;
}

- (void)setHasBatteryIsCharging:(BOOL)a3
{
  self->_hasBatteryIsCharging = a3;
}

- (BOOL)isLowBatteryMode
{
  return self->_isLowBatteryMode;
}

- (BOOL)hasIsLowBatteryMode
{
  return self->_hasIsLowBatteryMode;
}

- (void)setHasIsLowBatteryMode:(BOOL)a3
{
  self->_hasIsLowBatteryMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGraph, 0);
  objc_storeStrong((id *)&self->_isPlayingMedia, 0);
  objc_storeStrong((id *)&self->_deviceMotion, 0);
  objc_storeStrong((id *)&self->_focusMode, 0);
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

    v4 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesEnvironmentFeatures alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("focusMode"), 2, 0, 1, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceMotion"), 2, 0, 2, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("location"), 0, 0, 3, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPlayingMedia"), 2, 0, 4, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAirplaneMode"), 0, 0, 5, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTimerRunning"), 0, 0, 6, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isConnectedToWifi"), 0, 0, 7, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasInternetConnection"), 0, 0, 8, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isScreenSharing"), 0, 0, 9, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("audioIsMuted"), 0, 0, 10, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("screenBrightness"), 0, 0, 11, 2, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("homeGraph_json"), 5, 1, &__block_literal_global_760);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batteryIsCharging"), 0, 0, 13, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isLowBatteryMode"), 0, 0, 14, 12, 0);
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B2E0;
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
  _QWORD v18[16];

  v18[14] = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("focusMode"), 1, 13, 0);
  v18[0] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceMotion"), 2, 13, 0);
  v18[1] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("location"), 3, 4, 0);
  v18[2] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPlayingMedia"), 4, 13, 0);
  v18[3] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAirplaneMode"), 5, 12, 0);
  v18[4] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTimerRunning"), 6, 12, 0);
  v18[5] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isConnectedToWifi"), 7, 12, 0);
  v18[6] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasInternetConnection"), 8, 12, 0);
  v18[7] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isScreenSharing"), 9, 12, 0);
  v18[8] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("audioIsMuted"), 10, 12, 0);
  v18[9] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("screenBrightness"), 11, 2, 0);
  v18[10] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeGraph"), 12, 14, objc_opt_class());
  v18[11] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batteryIsCharging"), 13, 12, 0);
  v18[12] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isLowBatteryMode"), 14, 12, 0);
  v18[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __63__BMSiriAssistantSuggestionFeaturesEnvironmentFeatures_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeGraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
