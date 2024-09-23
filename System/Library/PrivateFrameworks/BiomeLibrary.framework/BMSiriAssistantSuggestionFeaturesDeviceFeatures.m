@implementation BMSiriAssistantSuggestionFeaturesDeviceFeatures

- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)initWithConnectedToAirpods:(id)a3 noiseCancellingMode:(id)a4 connectedToDevice:(id)a5 isInCarPlay:(id)a6 hasWatch:(id)a7 hasIPad:(id)a8 hasHomePod:(id)a9 hasAppleTV:(id)a10 hasIPhone:(id)a11 totalNumDevices:(id)a12 currentDeviceType:(id)a13 currentBuildVersion:(id)a14 distanceFromLatestBuild:(id)a15 isALargeFormatPhone:(id)a16 hasAPasscode:(id)a17 supportsSMSMEssaging:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v30;
  int v31;
  id obj;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  obj = a4;
  v38 = a4;
  v34 = a5;
  v37 = a5;
  v42 = a6;
  v43 = a7;
  v23 = a8;
  v41 = a9;
  v40 = a10;
  v24 = a11;
  v39 = a12;
  v25 = a13;
  v26 = a14;
  v36 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  v45.receiver = self;
  v45.super_class = (Class)BMSiriAssistantSuggestionFeaturesDeviceFeatures;
  v30 = -[BMEventBase init](&v45, sel_init);
  if (v30)
  {
    v30->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v44)
    {
      v30->_hasConnectedToAirpods = 1;
      v30->_connectedToAirpods = objc_msgSend(v44, "BOOLValue");
    }
    else
    {
      v30->_hasConnectedToAirpods = 0;
      v30->_connectedToAirpods = 0;
    }
    objc_storeStrong((id *)&v30->_noiseCancellingMode, obj);
    objc_storeStrong((id *)&v30->_connectedToDevice, v34);
    if (v42)
    {
      v30->_hasIsInCarPlay = 1;
      v30->_isInCarPlay = objc_msgSend(v42, "BOOLValue");
    }
    else
    {
      v30->_hasIsInCarPlay = 0;
      v30->_isInCarPlay = 0;
    }
    if (v43)
    {
      v30->_hasHasWatch = 1;
      v30->_hasWatch = objc_msgSend(v43, "BOOLValue");
    }
    else
    {
      v30->_hasHasWatch = 0;
      v30->_hasWatch = 0;
    }
    if (v23)
    {
      v30->_hasHasIPad = 1;
      v30->_hasIPad = objc_msgSend(v23, "BOOLValue");
    }
    else
    {
      v30->_hasHasIPad = 0;
      v30->_hasIPad = 0;
    }
    if (v41)
    {
      v30->_hasHasHomePod = 1;
      v30->_hasHomePod = objc_msgSend(v41, "BOOLValue");
    }
    else
    {
      v30->_hasHasHomePod = 0;
      v30->_hasHomePod = 0;
    }
    if (v40)
    {
      v30->_hasHasAppleTV = 1;
      v30->_hasAppleTV = objc_msgSend(v40, "BOOLValue");
    }
    else
    {
      v30->_hasHasAppleTV = 0;
      v30->_hasAppleTV = 0;
    }
    if (v24)
    {
      v30->_hasHasIPhone = 1;
      v30->_hasIPhone = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v30->_hasHasIPhone = 0;
      v30->_hasIPhone = 0;
    }
    if (v39)
    {
      v30->_hasTotalNumDevices = 1;
      v31 = objc_msgSend(v39, "intValue");
    }
    else
    {
      v30->_hasTotalNumDevices = 0;
      v31 = -1;
    }
    v30->_totalNumDevices = v31;
    objc_storeStrong((id *)&v30->_currentDeviceType, a13);
    objc_storeStrong((id *)&v30->_currentBuildVersion, a14);
    objc_storeStrong((id *)&v30->_distanceFromLatestBuild, a15);
    if (v27)
    {
      v30->_hasIsALargeFormatPhone = 1;
      v30->_isALargeFormatPhone = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v30->_hasIsALargeFormatPhone = 0;
      v30->_isALargeFormatPhone = 0;
    }
    if (v28)
    {
      v30->_hasHasAPasscode = 1;
      v30->_hasAPasscode = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v30->_hasHasAPasscode = 0;
      v30->_hasAPasscode = 0;
    }
    if (v29)
    {
      v30->_hasSupportsSMSMEssaging = 1;
      v30->_supportsSMSMEssaging = objc_msgSend(v29, "BOOLValue");
    }
    else
    {
      v30->_hasSupportsSMSMEssaging = 0;
      v30->_supportsSMSMEssaging = 0;
    }
  }

  return v30;
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
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToAirpods](self, "connectedToAirpods"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures noiseCancellingMode](self, "noiseCancellingMode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToDevice](self, "connectedToDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isInCarPlay](self, "isInCarPlay"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasWatch](self, "hasWatch"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPad](self, "hasIPad"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHomePod](self, "hasHomePod"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAppleTV](self, "hasAppleTV"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPhone](self, "hasIPhone"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures totalNumDevices](self, "totalNumDevices"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentDeviceType](self, "currentDeviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentBuildVersion](self, "currentBuildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures distanceFromLatestBuild](self, "distanceFromLatestBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isALargeFormatPhone](self, "isALargeFormatPhone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAPasscode](self, "hasAPasscode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures supportsSMSMEssaging](self, "supportsSMSMEssaging"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesDeviceFeatures with connectedToAirpods: %@, noiseCancellingMode: %@, connectedToDevice: %@, isInCarPlay: %@, hasWatch: %@, hasIPad: %@, hasHomePod: %@, hasAppleTV: %@, hasIPhone: %@, totalNumDevices: %@, currentDeviceType: %@, currentBuildVersion: %@, distanceFromLatestBuild: %@, isALargeFormatPhone: %@, hasAPasscode: %@, supportsSMSMEssaging: %@"), v16, v21, v20, v15, v14, v13, v19, v12, v11, v10, v3, v4, v5, v6, v7, v8);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
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
  void *v78;
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
  BOOL v100;
  uint64_t v101;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v102;
  objc_super v104;

  v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)BMSiriAssistantSuggestionFeaturesDeviceFeatures;
  v5 = -[BMEventBase init](&v104, sel_init);
  if (!v5)
    goto LABEL_153;
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasConnectedToAirpods = 1;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_106;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_108;
            }
          }
          v4[*v8] = 1;
LABEL_106:
          if (v4[*v8])
            v22 = 0;
LABEL_108:
          v100 = v22 != 0;
          v101 = 16;
          goto LABEL_149;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 48;
          goto LABEL_83;
        case 3u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 56;
          goto LABEL_83;
        case 5u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasIsInCarPlay = 1;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  v31 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v31 = 0;
LABEL_112:
          v100 = v31 != 0;
          v101 = 18;
          goto LABEL_149;
        case 6u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v5->_hasHasWatch = 1;
          while (2)
          {
            v39 = *v6;
            v40 = *(_QWORD *)&v4[v39];
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
              *(_QWORD *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  v38 = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v38 = 0;
LABEL_116:
          v100 = v38 != 0;
          v101 = 20;
          goto LABEL_149;
        case 7u:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v5->_hasHasIPad = 1;
          while (2)
          {
            v46 = *v6;
            v47 = *(_QWORD *)&v4[v46];
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v47);
              *(_QWORD *)&v4[v46] = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                v17 = v44++ >= 9;
                if (v17)
                {
                  v45 = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v45 = 0;
LABEL_120:
          v100 = v45 != 0;
          v101 = 22;
          goto LABEL_149;
        case 8u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          v5->_hasHasHomePod = 1;
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
              v52 |= (unint64_t)(v56 & 0x7F) << v50;
              if (v56 < 0)
              {
                v50 += 7;
                v17 = v51++ >= 9;
                if (v17)
                {
                  v52 = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v52 = 0;
LABEL_124:
          v100 = v52 != 0;
          v101 = 24;
          goto LABEL_149;
        case 9u:
          v57 = 0;
          v58 = 0;
          v59 = 0;
          v5->_hasHasAppleTV = 1;
          while (2)
          {
            v60 = *v6;
            v61 = *(_QWORD *)&v4[v60];
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v61);
              *(_QWORD *)&v4[v60] = v62;
              v59 |= (unint64_t)(v63 & 0x7F) << v57;
              if (v63 < 0)
              {
                v57 += 7;
                v17 = v58++ >= 9;
                if (v17)
                {
                  v59 = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v59 = 0;
LABEL_128:
          v100 = v59 != 0;
          v101 = 26;
          goto LABEL_149;
        case 0xAu:
          v64 = 0;
          v65 = 0;
          v66 = 0;
          v5->_hasHasIPhone = 1;
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
              v66 |= (unint64_t)(v70 & 0x7F) << v64;
              if (v70 < 0)
              {
                v64 += 7;
                v17 = v65++ >= 9;
                if (v17)
                {
                  v66 = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v66 = 0;
LABEL_132:
          v100 = v66 != 0;
          v101 = 28;
          goto LABEL_149;
        case 0xBu:
          v71 = 0;
          v72 = 0;
          v73 = 0;
          v5->_hasTotalNumDevices = 1;
          while (2)
          {
            v74 = *v6;
            v75 = *(_QWORD *)&v4[v74];
            v76 = v75 + 1;
            if (v75 == -1 || v76 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v75);
              *(_QWORD *)&v4[v74] = v76;
              v73 |= (unint64_t)(v77 & 0x7F) << v71;
              if (v77 < 0)
              {
                v71 += 7;
                v17 = v72++ >= 9;
                if (v17)
                {
                  LODWORD(v73) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v73) = 0;
LABEL_136:
          v5->_totalNumDevices = v73;
          continue;
        case 0xCu:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 64;
          goto LABEL_83;
        case 0xDu:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 72;
          goto LABEL_83;
        case 0xEu:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 80;
LABEL_83:
          v78 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 0xFu:
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v5->_hasIsALargeFormatPhone = 1;
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
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v81 = 0;
LABEL_140:
          v100 = v81 != 0;
          v101 = 31;
          goto LABEL_149;
        case 0x10u:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          v5->_hasHasAPasscode = 1;
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
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v88 = 0;
LABEL_144:
          v100 = v88 != 0;
          v101 = 33;
          goto LABEL_149;
        case 0x11u:
          v93 = 0;
          v94 = 0;
          v95 = 0;
          v5->_hasSupportsSMSMEssaging = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_152;
          continue;
      }
      while (1)
      {
        v96 = *v6;
        v97 = *(_QWORD *)&v4[v96];
        v98 = v97 + 1;
        if (v97 == -1 || v98 > *(_QWORD *)&v4[*v7])
          break;
        v99 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v97);
        *(_QWORD *)&v4[v96] = v98;
        v95 |= (unint64_t)(v99 & 0x7F) << v93;
        if ((v99 & 0x80) == 0)
          goto LABEL_146;
        v93 += 7;
        v17 = v94++ >= 9;
        if (v17)
        {
          v95 = 0;
          goto LABEL_148;
        }
      }
      v4[*v8] = 1;
LABEL_146:
      if (v4[*v8])
        v95 = 0;
LABEL_148:
      v100 = v95 != 0;
      v101 = 35;
LABEL_149:
      *((_BYTE *)&v5->super.super.isa + v101) = v100;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_152:
    v102 = 0;
  else
LABEL_153:
    v102 = v5;

  return v102;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasConnectedToAirpods)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_noiseCancellingMode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_connectedToDevice)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsInCarPlay)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasWatch)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasIPad)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasHomePod)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasAppleTV)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasIPhone)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasTotalNumDevices)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_currentDeviceType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_currentBuildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_distanceFromLatestBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsALargeFormatPhone)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasAPasscode)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasSupportsSMSMEssaging)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v18;
  uint64_t v19;
  void *v20;
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
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v37;
  void *v38;
  void *v39;
  void *v40;
  id *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  uint64_t v121;
  void *v122;
  id v123;
  id v124;
  id *v125;
  uint64_t v126;
  id v127;
  id *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  id *v146;
  id *v147;
  void *v148;
  id v149;
  id v150;
  void *v151;
  id v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  id v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  id v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  id v189;
  uint64_t v190;
  id v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  _QWORD v199[3];

  v199[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("connectedToAirpods"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v167 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("noiseCancellingMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v165 = 0;
          v37 = 0;
          goto LABEL_67;
        }
        v46 = v7;
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v48 = *MEMORY[0x1E0D025B8];
        v196 = *MEMORY[0x1E0CB2D50];
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("noiseCancellingMode"));
        v197 = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v47;
        v7 = v46;
        v166 = (void *)v49;
        v51 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v48, 2);
        v37 = 0;
        v165 = 0;
        *a4 = v51;
        goto LABEL_66;
      }
      v165 = v8;
    }
    else
    {
      v165 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("connectedToDevice"));
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    if (v166 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v42 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v40 = 0;
          v37 = 0;
          goto LABEL_66;
        }
        v155 = v8;
        v52 = v7;
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v54 = *MEMORY[0x1E0D025B8];
        v194 = *MEMORY[0x1E0CB2D50];
        v55 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("connectedToDevice"));
        v195 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v53;
        v7 = v52;
        v8 = v155;
        v57 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v54, 2, v9);
        v37 = 0;
        v40 = 0;
        *v42 = v57;
        v11 = (id)v55;
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      v164 = v166;
    }
    else
    {
      v164 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isInCarPlay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v37 = 0;
          v40 = v164;
          goto LABEL_65;
        }
        v58 = v7;
        v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v60 = *MEMORY[0x1E0D025B8];
        v192 = *MEMORY[0x1E0CB2D50];
        v146 = a4;
        v163 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isInCarPlay"));
        v193 = v163;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v59;
        v7 = v58;
        v62 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v60, 2, v38);
        v37 = 0;
        v11 = 0;
        *v146 = v62;
        v40 = v164;
        goto LABEL_64;
      }
      v10 = self;
      v11 = v9;
    }
    else
    {
      v10 = self;
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasWatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v163 = 0;
          v37 = 0;
          v40 = v164;
          v38 = v12;
          self = v10;
          goto LABEL_64;
        }
        v156 = v8;
        v63 = v11;
        v64 = v7;
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v66 = *MEMORY[0x1E0D025B8];
        v190 = *MEMORY[0x1E0CB2D50];
        v147 = a4;
        v67 = objc_alloc(MEMORY[0x1E0CB3940]);
        v132 = objc_opt_class();
        v68 = v67;
        v38 = v12;
        self = v10;
        v162 = (id)objc_msgSend(v68, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v132, CFSTR("hasWatch"));
        v191 = v162;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v65;
        v7 = v64;
        v11 = v63;
        v8 = v156;
        v70 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v66, 2, v13);
        v37 = 0;
        v163 = 0;
        *v147 = v70;
        v40 = v164;
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      v159 = v12;
      v163 = v12;
    }
    else
    {
      v159 = v12;
      v163 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasIPad"));
    self = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = v11;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v162 = 0;
          v37 = 0;
          v40 = v164;
          v38 = v159;
          goto LABEL_63;
        }
        v157 = v8;
        v71 = v11;
        v72 = v7;
        v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v74 = *MEMORY[0x1E0D025B8];
        v188 = *MEMORY[0x1E0CB2D50];
        v161 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasIPad"));
        v189 = v161;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = v73;
        v7 = v72;
        v11 = v71;
        v8 = v157;
        v158 = (void *)v75;
        v77 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v74, 2);
        v37 = 0;
        v162 = 0;
        *a4 = v77;
        v40 = v164;
        v38 = v159;
        goto LABEL_62;
      }
      v14 = v7;
      v162 = v13;
    }
    else
    {
      v14 = v7;
      v162 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasHomePod"));
    v15 = objc_claimAutoreleasedReturnValue();
    v158 = (void *)v15;
    if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v161 = 0;
          v37 = 0;
          v40 = v164;
          v38 = v159;
          v7 = v14;
          goto LABEL_61;
        }
        v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v81 = *MEMORY[0x1E0D025B8];
        v186 = *MEMORY[0x1E0CB2D50];
        v153 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasHomePod"));
        v187 = v153;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1);
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = v80;
        v7 = v14;
        v17 = (void *)v82;
        v84 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v81, 2, v82);
        v37 = 0;
        v161 = 0;
        *a4 = v84;
        goto LABEL_135;
      }
      v161 = v16;
    }
    else
    {
      v161 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasAppleTV"));
    v7 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v145 = v13;
      v18 = self;
      v153 = 0;
LABEL_25:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasIPhone"));
      v19 = objc_claimAutoreleasedReturnValue();
      v148 = v17;
      v151 = (void *)v19;
      if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v152 = 0;
            v37 = 0;
            v40 = v164;
            v38 = v159;
            self = v18;
            goto LABEL_58;
          }
          v90 = v7;
          v91 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v92 = *MEMORY[0x1E0D025B8];
          v182 = *MEMORY[0x1E0CB2D50];
          self = v18;
          v149 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasIPhone"));
          v183 = v149;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v91;
          v7 = v90;
          v17 = v148;
          v94 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v92, 2, v21);
          v37 = 0;
          v152 = 0;
          *a4 = v94;
          goto LABEL_142;
        }
        v152 = v20;
      }
      else
      {
        v152 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalNumDevices"));
      self = v18;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = v21;
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v149 = 0;
LABEL_31:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currentDeviceType"));
        v22 = objc_claimAutoreleasedReturnValue();
        v142 = (void *)v22;
        if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v78 = v9;
          v79 = self;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v143 = 0;
              v37 = 0;
              v40 = v164;
              v38 = v159;
              v17 = v148;
              v21 = v144;
              goto LABEL_56;
            }
            v101 = v7;
            v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v103 = *MEMORY[0x1E0D025B8];
            v178 = *MEMORY[0x1E0CB2D50];
            v141 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("currentDeviceType"));
            v179 = v141;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
            v104 = objc_claimAutoreleasedReturnValue();
            v105 = v102;
            v7 = v101;
            v140 = (void *)v104;
            v106 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v103, 2);
            v37 = 0;
            v143 = 0;
            *a4 = v106;
            goto LABEL_148;
          }
          v143 = v23;
          v17 = v148;
          v21 = v144;
        }
        else
        {
          v143 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currentBuildVersion"));
        v24 = objc_claimAutoreleasedReturnValue();
        v140 = (void *)v24;
        if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v141 = 0;
          goto LABEL_37;
        }
        v78 = v9;
        v79 = self;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v141 = v25;
          v17 = v148;
          v21 = v144;
LABEL_37:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("distanceFromLatestBuild"));
          v26 = objc_claimAutoreleasedReturnValue();
          v137 = (void *)v26;
          if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v139 = 0;
LABEL_40:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isALargeFormatPhone"));
            v28 = objc_claimAutoreleasedReturnValue();
            v136 = (void *)v28;
            if (v28 && (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v138 = 0;
                  v37 = 0;
                  v40 = v164;
                  v38 = v159;
                  goto LABEL_53;
                }
                v119 = v7;
                v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v121 = *MEMORY[0x1E0D025B8];
                v172 = *MEMORY[0x1E0CB2D50];
                v21 = v144;
                v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isALargeFormatPhone"));
                v173 = v135;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v122 = v120;
                v7 = v119;
                v17 = v148;
                v123 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v121, 2, v39);
                v37 = 0;
                v138 = 0;
                *a4 = v123;
                v38 = v159;
                goto LABEL_52;
              }
              v138 = v29;
            }
            else
            {
              v138 = 0;
            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasAPasscode"));
            v30 = objc_claimAutoreleasedReturnValue();
            v134 = v9;
            v154 = (void *)v30;
            if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v135 = 0;
                  v37 = 0;
                  v38 = v159;
                  goto LABEL_51;
                }
                v33 = v7;
                v124 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v125 = a4;
                v126 = *MEMORY[0x1E0D025B8];
                v170 = *MEMORY[0x1E0CB2D50];
                v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasAPasscode"));
                v171 = v36;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = (id)objc_msgSend(v124, "initWithDomain:code:userInfo:", v126, 2, v35);
                v37 = 0;
                v135 = 0;
                *v125 = v127;
                goto LABEL_50;
              }
              v32 = v160;
              v33 = v7;
              v34 = v31;
            }
            else
            {
              v32 = v160;
              v33 = v7;
              v34 = 0;
            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("supportsSMSMEssaging"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = v34;
            if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v128 = a4;
                  v129 = *MEMORY[0x1E0D025B8];
                  v168 = *MEMORY[0x1E0CB2D50];
                  v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("supportsSMSMEssaging"));
                  v169 = v130;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  *v128 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v129, 2, v131);

                }
                v36 = 0;
                v37 = 0;
                goto LABEL_50;
              }
              v36 = v35;
            }
            else
            {
              v36 = 0;
            }
            self = objc_retain(-[BMSiriAssistantSuggestionFeaturesDeviceFeatures initWithConnectedToAirpods:noiseCancellingMode:connectedToDevice:isInCarPlay:hasWatch:hasIPad:hasHomePod:hasAppleTV:hasIPhone:totalNumDevices:currentDeviceType:currentBuildVersion:distanceFromLatestBuild:isALargeFormatPhone:hasAPasscode:supportsSMSMEssaging:](self, "initWithConnectedToAirpods:noiseCancellingMode:connectedToDevice:isInCarPlay:hasWatch:hasIPad:hasHomePod:hasAppleTV:hasIPhone:totalNumDevices:currentDeviceType:currentBuildVersion:distanceFromLatestBuild:isALargeFormatPhone:hasAPasscode:supportsSMSMEssaging:", v33, v165, v164, v32, v163, v162, v161, v153, v152, v149, v143, v141, v139, v138,
                       v34,
                       v36));
            v37 = self;
LABEL_50:
            v38 = v159;

            v7 = v33;
            v9 = v134;
            v17 = v148;
            v21 = v144;
LABEL_51:
            v39 = v154;
LABEL_52:

            v40 = v164;
LABEL_53:

LABEL_54:
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
            v13 = v145;
LABEL_59:

LABEL_60:
LABEL_61:
            v11 = v160;
LABEL_62:

            goto LABEL_63;
          }
          v78 = v9;
          v79 = self;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v139 = v27;
            v17 = v148;
            v21 = v144;
            goto LABEL_40;
          }
          if (a4)
          {
            v113 = v7;
            v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v115 = *MEMORY[0x1E0D025B8];
            v174 = *MEMORY[0x1E0CB2D50];
            v138 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("distanceFromLatestBuild"));
            v175 = v138;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
            v116 = objc_claimAutoreleasedReturnValue();
            v117 = v114;
            v7 = v113;
            v136 = (void *)v116;
            v118 = (id)objc_msgSend(v117, "initWithDomain:code:userInfo:", v115, 2);
            v37 = 0;
            v139 = 0;
            *a4 = v118;
            v40 = v164;
            v9 = v78;
            v38 = v159;
            v17 = v148;
            v21 = v144;
            goto LABEL_53;
          }
          v139 = 0;
          v37 = 0;
LABEL_150:
          self = v79;
          v40 = v164;
          v9 = v78;
          v38 = v159;
          v17 = v148;
          v21 = v144;
          goto LABEL_54;
        }
        if (a4)
        {
          v107 = v7;
          v108 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v109 = *MEMORY[0x1E0D025B8];
          v176 = *MEMORY[0x1E0CB2D50];
          v139 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("currentBuildVersion"));
          v177 = v139;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
          v110 = objc_claimAutoreleasedReturnValue();
          v111 = v108;
          v7 = v107;
          v137 = (void *)v110;
          v112 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v109, 2);
          v37 = 0;
          v141 = 0;
          *a4 = v112;
          goto LABEL_150;
        }
        v141 = 0;
        v37 = 0;
LABEL_148:
        self = v79;
        v40 = v164;
        v9 = v78;
        v38 = v159;
        v17 = v148;
        v21 = v144;
        goto LABEL_55;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v149 = v21;
        goto LABEL_31;
      }
      if (a4)
      {
        v95 = v7;
        v96 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v97 = *MEMORY[0x1E0D025B8];
        v180 = *MEMORY[0x1E0CB2D50];
        v143 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalNumDevices"));
        v181 = v143;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
        v98 = objc_claimAutoreleasedReturnValue();
        v99 = v96;
        v7 = v95;
        v17 = v148;
        v142 = (void *)v98;
        v100 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v97, 2);
        v37 = 0;
        v149 = 0;
        *a4 = v100;
        v40 = v164;
        v38 = v159;
        goto LABEL_56;
      }
      v149 = 0;
      v37 = 0;
LABEL_142:
      v40 = v164;
      v38 = v159;
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v145 = v13;
      v18 = self;
      v153 = v17;
      goto LABEL_25;
    }
    if (a4)
    {
      v150 = v7;
      v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v86 = *MEMORY[0x1E0D025B8];
      v184 = *MEMORY[0x1E0CB2D50];
      v152 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasAppleTV"));
      v185 = v152;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
      v87 = objc_claimAutoreleasedReturnValue();
      v88 = v85;
      v7 = v150;
      v151 = (void *)v87;
      v89 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v86, 2);
      v37 = 0;
      v153 = 0;
      *a4 = v89;
      v40 = v164;
      v38 = v159;
      goto LABEL_59;
    }
    v153 = 0;
    v37 = 0;
LABEL_135:
    v40 = v164;
    v38 = v159;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v167;
    goto LABEL_4;
  }
  if (!a4)
  {
    v37 = 0;
    v7 = 0;
    goto LABEL_68;
  }
  v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v44 = *MEMORY[0x1E0D025B8];
  v198 = *MEMORY[0x1E0CB2D50];
  v165 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("connectedToAirpods"));
  v199[0] = v165;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v199, &v198, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v8);
  v37 = 0;
  v7 = 0;
  *a4 = v45;
LABEL_67:

LABEL_68:
  return v37;
}

- (id)jsonDictionary
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
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
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[16];
  _QWORD v56[18];

  v56[16] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasConnectedToAirpods](self, "hasConnectedToAirpods"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToAirpods](self, "connectedToAirpods"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures noiseCancellingMode](self, "noiseCancellingMode");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToDevice](self, "connectedToDevice");
  v5 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIsInCarPlay](self, "hasIsInCarPlay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isInCarPlay](self, "isInCarPlay"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasWatch](self, "hasHasWatch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasWatch](self, "hasWatch"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasIPad](self, "hasHasIPad"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPad](self, "hasIPad"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasHomePod](self, "hasHasHomePod"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHomePod](self, "hasHomePod"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasAppleTV](self, "hasHasAppleTV"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAppleTV](self, "hasAppleTV"));
    v54 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v54 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasIPhone](self, "hasHasIPhone"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPhone](self, "hasIPhone"));
    v53 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v53 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasTotalNumDevices](self, "hasTotalNumDevices"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures totalNumDevices](self, "totalNumDevices"));
    v52 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentDeviceType](self, "currentDeviceType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentBuildVersion](self, "currentBuildVersion");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesDeviceFeatures distanceFromLatestBuild](self, "distanceFromLatestBuild");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIsALargeFormatPhone](self, "hasIsALargeFormatPhone"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isALargeFormatPhone](self, "isALargeFormatPhone"));
    v48 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasAPasscode](self, "hasHasAPasscode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAPasscode](self, "hasAPasscode"));
    v47 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v47 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasSupportsSMSMEssaging](self, "hasSupportsSMSMEssaging"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures supportsSMSMEssaging](self, "supportsSMSMEssaging"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v55[0] = CFSTR("connectedToAirpods");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v11;
  v56[0] = v11;
  v55[1] = CFSTR("noiseCancellingMode");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v12;
  v56[1] = v12;
  v55[2] = CFSTR("connectedToDevice");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v13;
  v56[2] = v13;
  v55[3] = CFSTR("isInCarPlay");
  v14 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v14;
  v56[3] = v14;
  v55[4] = CFSTR("hasWatch");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v15;
  v56[4] = v15;
  v55[5] = CFSTR("hasIPad");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v16;
  v56[5] = v16;
  v55[6] = CFSTR("hasHomePod");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v17;
  v56[6] = v17;
  v55[7] = CFSTR("hasAppleTV");
  v18 = (uint64_t)v54;
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v43 = v9;
  v56[7] = v18;
  v55[8] = CFSTR("hasIPhone");
  v19 = (uint64_t)v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v45 = v6;
  v56[8] = v19;
  v55[9] = CFSTR("totalNumDevices");
  v20 = (uint64_t)v52;
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v46 = v3;
  v31 = v20;
  v56[9] = v20;
  v55[10] = CFSTR("currentDeviceType");
  v21 = v51;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v19;
  v34 = (void *)v18;
  v44 = v7;
  v56[10] = v21;
  v55[11] = CFSTR("currentBuildVersion");
  v22 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v8;
  v24 = (void *)v4;
  v56[11] = v22;
  v55[12] = CFSTR("distanceFromLatestBuild");
  v25 = v49;
  if (!v49)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v5;
  v56[12] = v25;
  v55[13] = CFSTR("isALargeFormatPhone");
  v27 = v48;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56[13] = v27;
  v55[14] = CFSTR("hasAPasscode");
  v28 = v47;
  if (!v47)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56[14] = v28;
  v55[15] = CFSTR("supportsSMSMEssaging");
  v29 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56[15] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 16, v31);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)

  if (!v47)
  if (!v48)

  if (!v49)
  if (!v50)

  if (!v51)
  if (!v52)

  if (!v53)
  if (v54)
  {
    if (v43)
      goto LABEL_84;
  }
  else
  {

    if (v43)
    {
LABEL_84:
      if (v23)
        goto LABEL_85;
      goto LABEL_93;
    }
  }

  if (v23)
  {
LABEL_85:
    if (v44)
      goto LABEL_86;
    goto LABEL_94;
  }
LABEL_93:

  if (v44)
  {
LABEL_86:
    if (v45)
      goto LABEL_87;
    goto LABEL_95;
  }
LABEL_94:

  if (v45)
  {
LABEL_87:
    if (v26)
      goto LABEL_88;
    goto LABEL_96;
  }
LABEL_95:

  if (v26)
  {
LABEL_88:
    if (v24)
      goto LABEL_89;
LABEL_97:

    if (v46)
      goto LABEL_90;
LABEL_98:

    goto LABEL_90;
  }
LABEL_96:

  if (!v24)
    goto LABEL_97;
LABEL_89:
  if (!v46)
    goto LABEL_98;
LABEL_90:

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int v46;
  _BOOL4 v47;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasConnectedToAirpods](self, "hasConnectedToAirpods")
      || objc_msgSend(v5, "hasConnectedToAirpods"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasConnectedToAirpods](self, "hasConnectedToAirpods"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasConnectedToAirpods"))
        goto LABEL_78;
      v6 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToAirpods](self, "connectedToAirpods");
      if (v6 != objc_msgSend(v5, "connectedToAirpods"))
        goto LABEL_78;
    }
    -[BMSiriAssistantSuggestionFeaturesDeviceFeatures noiseCancellingMode](self, "noiseCancellingMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noiseCancellingMode");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMSiriAssistantSuggestionFeaturesDeviceFeatures noiseCancellingMode](self, "noiseCancellingMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "noiseCancellingMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_78;
    }
    -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToDevice](self, "connectedToDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectedToDevice");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToDevice](self, "connectedToDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "connectedToDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_78;
    }
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIsInCarPlay](self, "hasIsInCarPlay")
      || objc_msgSend(v5, "hasIsInCarPlay"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIsInCarPlay](self, "hasIsInCarPlay"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasIsInCarPlay"))
        goto LABEL_78;
      v20 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isInCarPlay](self, "isInCarPlay");
      if (v20 != objc_msgSend(v5, "isInCarPlay"))
        goto LABEL_78;
    }
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasWatch](self, "hasHasWatch")
      || objc_msgSend(v5, "hasHasWatch"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasWatch](self, "hasHasWatch"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasHasWatch"))
        goto LABEL_78;
      v21 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasWatch](self, "hasWatch");
      if (v21 != objc_msgSend(v5, "hasWatch"))
        goto LABEL_78;
    }
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasIPad](self, "hasHasIPad")
      || objc_msgSend(v5, "hasHasIPad"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasIPad](self, "hasHasIPad"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasHasIPad"))
        goto LABEL_78;
      v22 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPad](self, "hasIPad");
      if (v22 != objc_msgSend(v5, "hasIPad"))
        goto LABEL_78;
    }
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasHomePod](self, "hasHasHomePod")
      || objc_msgSend(v5, "hasHasHomePod"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasHomePod](self, "hasHasHomePod"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasHasHomePod"))
        goto LABEL_78;
      v23 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHomePod](self, "hasHomePod");
      if (v23 != objc_msgSend(v5, "hasHomePod"))
        goto LABEL_78;
    }
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasAppleTV](self, "hasHasAppleTV")
      || objc_msgSend(v5, "hasHasAppleTV"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasAppleTV](self, "hasHasAppleTV"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasHasAppleTV"))
        goto LABEL_78;
      v24 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAppleTV](self, "hasAppleTV");
      if (v24 != objc_msgSend(v5, "hasAppleTV"))
        goto LABEL_78;
    }
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasIPhone](self, "hasHasIPhone")
      || objc_msgSend(v5, "hasHasIPhone"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasIPhone](self, "hasHasIPhone"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasHasIPhone"))
        goto LABEL_78;
      v25 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPhone](self, "hasIPhone");
      if (v25 != objc_msgSend(v5, "hasIPhone"))
        goto LABEL_78;
    }
    if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasTotalNumDevices](self, "hasTotalNumDevices")
      || objc_msgSend(v5, "hasTotalNumDevices"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasTotalNumDevices](self, "hasTotalNumDevices"))
        goto LABEL_78;
      if (!objc_msgSend(v5, "hasTotalNumDevices"))
        goto LABEL_78;
      v26 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures totalNumDevices](self, "totalNumDevices");
      if (v26 != objc_msgSend(v5, "totalNumDevices"))
        goto LABEL_78;
    }
    -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentDeviceType](self, "currentDeviceType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDeviceType");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentDeviceType](self, "currentDeviceType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentDeviceType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_78;
    }
    -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentBuildVersion](self, "currentBuildVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentBuildVersion");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[BMSiriAssistantSuggestionFeaturesDeviceFeatures currentBuildVersion](self, "currentBuildVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentBuildVersion");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_78;
    }
    -[BMSiriAssistantSuggestionFeaturesDeviceFeatures distanceFromLatestBuild](self, "distanceFromLatestBuild");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "distanceFromLatestBuild");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[BMSiriAssistantSuggestionFeaturesDeviceFeatures distanceFromLatestBuild](self, "distanceFromLatestBuild");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "distanceFromLatestBuild");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_78;
    }
    if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIsALargeFormatPhone](self, "hasIsALargeFormatPhone")
      && !objc_msgSend(v5, "hasIsALargeFormatPhone")
      || -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIsALargeFormatPhone](self, "hasIsALargeFormatPhone")
      && objc_msgSend(v5, "hasIsALargeFormatPhone")
      && (v45 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isALargeFormatPhone](self, "isALargeFormatPhone"),
          v45 == objc_msgSend(v5, "isALargeFormatPhone")))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasAPasscode](self, "hasHasAPasscode")
        && !objc_msgSend(v5, "hasHasAPasscode")
        || -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHasAPasscode](self, "hasHasAPasscode")
        && objc_msgSend(v5, "hasHasAPasscode")
        && (v46 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAPasscode](self, "hasAPasscode"),
            v46 == objc_msgSend(v5, "hasAPasscode")))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasSupportsSMSMEssaging](self, "hasSupportsSMSMEssaging")&& !objc_msgSend(v5, "hasSupportsSMSMEssaging"))
        {
          LOBYTE(v13) = 1;
          goto LABEL_79;
        }
        if (-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasSupportsSMSMEssaging](self, "hasSupportsSMSMEssaging")
          && objc_msgSend(v5, "hasSupportsSMSMEssaging"))
        {
          v47 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures supportsSMSMEssaging](self, "supportsSMSMEssaging");
          v13 = v47 ^ objc_msgSend(v5, "supportsSMSMEssaging") ^ 1;
LABEL_79:

          goto LABEL_80;
        }
      }
    }
LABEL_78:
    LOBYTE(v13) = 0;
    goto LABEL_79;
  }
  LOBYTE(v13) = 0;
LABEL_80:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)connectedToAirpods
{
  return self->_connectedToAirpods;
}

- (BOOL)hasConnectedToAirpods
{
  return self->_hasConnectedToAirpods;
}

- (void)setHasConnectedToAirpods:(BOOL)a3
{
  self->_hasConnectedToAirpods = a3;
}

- (NSString)noiseCancellingMode
{
  return self->_noiseCancellingMode;
}

- (NSString)connectedToDevice
{
  return self->_connectedToDevice;
}

- (BOOL)isInCarPlay
{
  return self->_isInCarPlay;
}

- (BOOL)hasIsInCarPlay
{
  return self->_hasIsInCarPlay;
}

- (void)setHasIsInCarPlay:(BOOL)a3
{
  self->_hasIsInCarPlay = a3;
}

- (BOOL)hasWatch
{
  return self->_hasWatch;
}

- (BOOL)hasHasWatch
{
  return self->_hasHasWatch;
}

- (void)setHasHasWatch:(BOOL)a3
{
  self->_hasHasWatch = a3;
}

- (BOOL)hasIPad
{
  return self->_hasIPad;
}

- (BOOL)hasHasIPad
{
  return self->_hasHasIPad;
}

- (void)setHasHasIPad:(BOOL)a3
{
  self->_hasHasIPad = a3;
}

- (BOOL)hasHomePod
{
  return self->_hasHomePod;
}

- (BOOL)hasHasHomePod
{
  return self->_hasHasHomePod;
}

- (void)setHasHasHomePod:(BOOL)a3
{
  self->_hasHasHomePod = a3;
}

- (BOOL)hasAppleTV
{
  return self->_hasAppleTV;
}

- (BOOL)hasHasAppleTV
{
  return self->_hasHasAppleTV;
}

- (void)setHasHasAppleTV:(BOOL)a3
{
  self->_hasHasAppleTV = a3;
}

- (BOOL)hasIPhone
{
  return self->_hasIPhone;
}

- (BOOL)hasHasIPhone
{
  return self->_hasHasIPhone;
}

- (void)setHasHasIPhone:(BOOL)a3
{
  self->_hasHasIPhone = a3;
}

- (int)totalNumDevices
{
  return self->_totalNumDevices;
}

- (BOOL)hasTotalNumDevices
{
  return self->_hasTotalNumDevices;
}

- (void)setHasTotalNumDevices:(BOOL)a3
{
  self->_hasTotalNumDevices = a3;
}

- (NSString)currentDeviceType
{
  return self->_currentDeviceType;
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (NSString)distanceFromLatestBuild
{
  return self->_distanceFromLatestBuild;
}

- (BOOL)isALargeFormatPhone
{
  return self->_isALargeFormatPhone;
}

- (BOOL)hasIsALargeFormatPhone
{
  return self->_hasIsALargeFormatPhone;
}

- (void)setHasIsALargeFormatPhone:(BOOL)a3
{
  self->_hasIsALargeFormatPhone = a3;
}

- (BOOL)hasAPasscode
{
  return self->_hasAPasscode;
}

- (BOOL)hasHasAPasscode
{
  return self->_hasHasAPasscode;
}

- (void)setHasHasAPasscode:(BOOL)a3
{
  self->_hasHasAPasscode = a3;
}

- (BOOL)supportsSMSMEssaging
{
  return self->_supportsSMSMEssaging;
}

- (BOOL)hasSupportsSMSMEssaging
{
  return self->_hasSupportsSMSMEssaging;
}

- (void)setHasSupportsSMSMEssaging:(BOOL)a3
{
  self->_hasSupportsSMSMEssaging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceFromLatestBuild, 0);
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
  objc_storeStrong((id *)&self->_currentDeviceType, 0);
  objc_storeStrong((id *)&self->_connectedToDevice, 0);
  objc_storeStrong((id *)&self->_noiseCancellingMode, 0);
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

    v4 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesDeviceFeatures alloc], "initByReadFrom:", v7);
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
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("connectedToAirpods"), 0, 0, 1, 12, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("noiseCancellingMode"), 2, 0, 2, 13, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("connectedToDevice"), 2, 0, 3, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isInCarPlay"), 0, 0, 5, 12, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasWatch"), 0, 0, 6, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasIPad"), 0, 0, 7, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasHomePod"), 0, 0, 8, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasAppleTV"), 0, 0, 9, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasIPhone"), 0, 0, 10, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalNumDevices"), 0, 0, 11, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("currentDeviceType"), 2, 0, 12, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("currentBuildVersion"), 2, 0, 13, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceFromLatestBuild"), 2, 0, 14, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isALargeFormatPhone"), 0, 0, 15, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasAPasscode"), 0, 0, 16, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("supportsSMSMEssaging"), 0, 0, 17, 12, 0);
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
  return &unk_1E5F1B2B0;
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
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("connectedToAirpods"), 1, 12, 0);
  v20[0] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("noiseCancellingMode"), 2, 13, 0);
  v20[1] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("connectedToDevice"), 3, 13, 0);
  v20[2] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isInCarPlay"), 5, 12, 0);
  v20[3] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasWatch"), 6, 12, 0);
  v20[4] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasIPad"), 7, 12, 0);
  v20[5] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasHomePod"), 8, 12, 0);
  v20[6] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasAppleTV"), 9, 12, 0);
  v20[7] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasIPhone"), 10, 12, 0);
  v20[8] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalNumDevices"), 11, 2, 0);
  v20[9] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("currentDeviceType"), 12, 13, 0);
  v20[10] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("currentBuildVersion"), 13, 13, 0);
  v20[11] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceFromLatestBuild"), 14, 13, 0);
  v20[12] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isALargeFormatPhone"), 15, 12, 0);
  v20[13] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasAPasscode"), 16, 12, 0);
  v20[14] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("supportsSMSMEssaging"), 17, 12, 0);
  v20[15] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
