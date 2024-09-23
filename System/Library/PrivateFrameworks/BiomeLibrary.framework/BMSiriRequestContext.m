@implementation BMSiriRequestContext

- (BMSiriRequestContext)initWithSessionID:(id)a3 requestID:(id)a4 inputOrigin:(id)a5 responseMode:(id)a6 isEyesFree:(id)a7 isMultiUser:(id)a8 isVoiceTriggerEnabled:(id)a9 isTextToSpeechEnabled:(id)a10 isTriggerlessFollowup:(id)a11 deviceRestrictions:(id)a12 bargeInModes:(id)a13 identifiedUser:(id)a14 encodedLocation:(id)a15 countryCode:(id)a16 siriLocale:(id)a17 contentRestrictions:(id)a18 uiScale:(id)a19 temperatureUnit:(id)a20 allowUserGeneratedContent:(id)a21 censorSpeech:(id)a22 meCard:(id)a23
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  BMSiriRequestContext *v37;
  double v38;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v58;
  objc_super v59;

  v56 = a3;
  v41 = a4;
  v55 = a4;
  v42 = a5;
  v54 = a5;
  v43 = a6;
  v53 = a6;
  v27 = a7;
  v58 = a8;
  v28 = a9;
  v29 = a10;
  v30 = a11;
  v52 = a12;
  v51 = a13;
  v50 = a14;
  v49 = a15;
  v48 = a16;
  v47 = a17;
  v46 = a18;
  v31 = a19;
  v45 = a20;
  v32 = v30;
  v33 = v29;
  v34 = a21;
  v35 = a22;
  v36 = a23;
  v59.receiver = self;
  v59.super_class = (Class)BMSiriRequestContext;
  v37 = -[BMEventBase init](&v59, sel_init);
  if (v37)
  {
    v37->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v37->_sessionID, a3);
    objc_storeStrong((id *)&v37->_requestID, v41);
    objc_storeStrong((id *)&v37->_inputOrigin, v42);
    objc_storeStrong((id *)&v37->_responseMode, v43);
    if (v27)
    {
      v37->_hasIsEyesFree = 1;
      v37->_isEyesFree = objc_msgSend(v27, "BOOLValue");
    }
    else
    {
      v37->_hasIsEyesFree = 0;
      v37->_isEyesFree = 0;
    }
    if (v58)
    {
      v37->_hasIsMultiUser = 1;
      v37->_isMultiUser = objc_msgSend(v58, "BOOLValue");
    }
    else
    {
      v37->_hasIsMultiUser = 0;
      v37->_isMultiUser = 0;
    }
    if (v28)
    {
      v37->_hasIsVoiceTriggerEnabled = 1;
      v37->_isVoiceTriggerEnabled = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v37->_hasIsVoiceTriggerEnabled = 0;
      v37->_isVoiceTriggerEnabled = 0;
    }
    if (v33)
    {
      v37->_hasIsTextToSpeechEnabled = 1;
      v37->_isTextToSpeechEnabled = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v37->_hasIsTextToSpeechEnabled = 0;
      v37->_isTextToSpeechEnabled = 0;
    }
    if (v32)
    {
      v37->_hasIsTriggerlessFollowup = 1;
      v37->_isTriggerlessFollowup = objc_msgSend(v32, "BOOLValue");
    }
    else
    {
      v37->_hasIsTriggerlessFollowup = 0;
      v37->_isTriggerlessFollowup = 0;
    }
    objc_storeStrong((id *)&v37->_deviceRestrictions, a12);
    objc_storeStrong((id *)&v37->_bargeInModes, a13);
    objc_storeStrong((id *)&v37->_identifiedUser, a14);
    objc_storeStrong((id *)&v37->_encodedLocation, a15);
    objc_storeStrong((id *)&v37->_countryCode, a16);
    objc_storeStrong((id *)&v37->_siriLocale, a17);
    objc_storeStrong((id *)&v37->_contentRestrictions, a18);
    if (v31)
    {
      v37->_hasUiScale = 1;
      objc_msgSend(v31, "doubleValue");
    }
    else
    {
      v37->_hasUiScale = 0;
      v38 = -1.0;
    }
    v37->_uiScale = v38;
    objc_storeStrong((id *)&v37->_temperatureUnit, a20);
    if (v34)
    {
      v37->_hasAllowUserGeneratedContent = 1;
      v37->_allowUserGeneratedContent = objc_msgSend(v34, "BOOLValue");
    }
    else
    {
      v37->_hasAllowUserGeneratedContent = 0;
      v37->_allowUserGeneratedContent = 0;
    }
    if (v35)
    {
      v37->_hasCensorSpeech = 1;
      v37->_censorSpeech = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v37->_hasCensorSpeech = 0;
      v37->_censorSpeech = 0;
    }
    objc_storeStrong((id *)&v37->_meCard, a23);
  }

  return v37;
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

  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriRequestContext sessionID](self, "sessionID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext requestID](self, "requestID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext inputOrigin](self, "inputOrigin");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext responseMode](self, "responseMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isEyesFree](self, "isEyesFree"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isMultiUser](self, "isMultiUser"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isVoiceTriggerEnabled](self, "isVoiceTriggerEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isTextToSpeechEnabled](self, "isTextToSpeechEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isTriggerlessFollowup](self, "isTriggerlessFollowup"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext deviceRestrictions](self, "deviceRestrictions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext bargeInModes](self, "bargeInModes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext identifiedUser](self, "identifiedUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext encodedLocation](self, "encodedLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext countryCode](self, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext siriLocale](self, "siriLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext contentRestrictions](self, "contentRestrictions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriRequestContext uiScale](self, "uiScale");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext temperatureUnit](self, "temperatureUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext allowUserGeneratedContent](self, "allowUserGeneratedContent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext censorSpeech](self, "censorSpeech"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext meCard](self, "meCard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("BMSiriRequestContext with sessionID: %@, requestID: %@, inputOrigin: %@, responseMode: %@, isEyesFree: %@, isMultiUser: %@, isVoiceTriggerEnabled: %@, isTextToSpeechEnabled: %@, isTriggerlessFollowup: %@, deviceRestrictions: %@, bargeInModes: %@, identifiedUser: %@, encodedLocation: %@, countryCode: %@, siriLocale: %@, contentRestrictions: %@, uiScale: %@, temperatureUnit: %@, allowUserGeneratedContent: %@, censorSpeech: %@, meCard: %@"), v27, v25, v26, v24, v17, v23, v16, v22, v21, v20, v14, v15, v13, v12, v3, v4,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10);

  return (NSString *)v19;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRequestContext *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  objc_class *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  double v67;
  void *v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  void *v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  NSArray *deviceRestrictions;
  uint64_t v88;
  NSArray *bargeInModes;
  int v90;
  BMSiriRequestContext *v91;
  objc_super v93;
  uint64_t v94;
  uint64_t v95;

  v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)BMSiriRequestContext;
  v5 = -[BMEventBase init](&v93, sel_init);
  if (!v5)
    goto LABEL_133;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v10])
        break;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v8;
        v16 = *(_QWORD *)&v4[v15];
        v17 = v16 + 1;
        if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        v19 = v13++ >= 9;
        if (v19)
        {
          v14 = 0;
          v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = v4[*v10];
      if (v4[*v10])
        v14 = 0;
LABEL_15:
      if (v20 || (v14 & 7) == 4)
        break;
      switch((v14 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 40;
          goto LABEL_79;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 48;
          goto LABEL_79;
        case 3u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 56;
          goto LABEL_79;
        case 4u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 64;
          goto LABEL_79;
        case 5u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v5->_hasIsEyesFree = 1;
          while (2)
          {
            v27 = *v8;
            v28 = *(_QWORD *)&v4[v27];
            v29 = v28 + 1;
            if (v28 == -1 || v29 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v28);
              *(_QWORD *)&v4[v27] = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                v19 = v25++ >= 9;
                if (v19)
                {
                  v26 = 0;
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v26 = 0;
LABEL_101:
          v84 = v26 != 0;
          v85 = 16;
          goto LABEL_126;
        case 6u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasIsMultiUser = 1;
          while (2)
          {
            v34 = *v8;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                v19 = v32++ >= 9;
                if (v19)
                {
                  v33 = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v33 = 0;
LABEL_105:
          v84 = v33 != 0;
          v85 = 18;
          goto LABEL_126;
        case 7u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasIsVoiceTriggerEnabled = 1;
          while (2)
          {
            v41 = *v8;
            v42 = *(_QWORD *)&v4[v41];
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v42);
              *(_QWORD *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                v19 = v39++ >= 9;
                if (v19)
                {
                  v40 = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v40 = 0;
LABEL_109:
          v84 = v40 != 0;
          v85 = 20;
          goto LABEL_126;
        case 8u:
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v5->_hasIsTextToSpeechEnabled = 1;
          while (2)
          {
            v48 = *v8;
            v49 = *(_QWORD *)&v4[v48];
            v50 = v49 + 1;
            if (v49 == -1 || v50 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v51 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v49);
              *(_QWORD *)&v4[v48] = v50;
              v47 |= (unint64_t)(v51 & 0x7F) << v45;
              if (v51 < 0)
              {
                v45 += 7;
                v19 = v46++ >= 9;
                if (v19)
                {
                  v47 = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v47 = 0;
LABEL_113:
          v84 = v47 != 0;
          v85 = 22;
          goto LABEL_126;
        case 9u:
          v52 = 0;
          v53 = 0;
          v54 = 0;
          v5->_hasIsTriggerlessFollowup = 1;
          while (2)
          {
            v55 = *v8;
            v56 = *(_QWORD *)&v4[v55];
            v57 = v56 + 1;
            if (v56 == -1 || v57 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v56);
              *(_QWORD *)&v4[v55] = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                v19 = v53++ >= 9;
                if (v19)
                {
                  v54 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v54 = 0;
LABEL_117:
          v84 = v54 != 0;
          v85 = 24;
          goto LABEL_126;
        case 0xAu:
          PBReaderReadString();
          v59 = objc_claimAutoreleasedReturnValue();
          if (!v59)
            goto LABEL_135;
          v60 = (void *)v59;
          v61 = v6;
          goto LABEL_65;
        case 0xBu:
          PBReaderReadString();
          v62 = objc_claimAutoreleasedReturnValue();
          if (!v62)
            goto LABEL_135;
          v60 = (void *)v62;
          v61 = v7;
LABEL_65:
          objc_msgSend(v61, "addObject:", v60);

          continue;
        case 0xCu:
          v94 = 0;
          v95 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_135;
          v63 = -[BMSiriRequestContextUser initByReadFrom:]([BMSiriRequestContextUser alloc], "initByReadFrom:", v4);
          if (!v63)
            goto LABEL_135;
          v64 = 88;
          goto LABEL_97;
        case 0xDu:
          PBReaderReadData();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 96;
          goto LABEL_79;
        case 0xEu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 104;
          goto LABEL_79;
        case 0xFu:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 112;
          goto LABEL_79;
        case 0x10u:
          v94 = 0;
          v95 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_135;
          v63 = -[BMSiriRequestContextContentRestriction initByReadFrom:]([BMSiriRequestContextContentRestriction alloc], "initByReadFrom:", v4);
          if (!v63)
            goto LABEL_135;
          v64 = 120;
          goto LABEL_97;
        case 0x11u:
          v5->_hasUiScale = 1;
          v65 = *v8;
          v66 = *(_QWORD *)&v4[v65];
          if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)&v4[*v9])
          {
            v67 = *(double *)(*(_QWORD *)&v4[*v11] + v66);
            *(_QWORD *)&v4[v65] = v66 + 8;
          }
          else
          {
            v4[*v10] = 1;
            v67 = 0.0;
          }
          v5->_uiScale = v67;
          continue;
        case 0x12u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = 136;
LABEL_79:
          v68 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 0x13u:
          v69 = 0;
          v70 = 0;
          v71 = 0;
          v5->_hasAllowUserGeneratedContent = 1;
          while (2)
          {
            v72 = *v8;
            v73 = *(_QWORD *)&v4[v72];
            v74 = v73 + 1;
            if (v73 == -1 || v74 > *(_QWORD *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              v75 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v73);
              *(_QWORD *)&v4[v72] = v74;
              v71 |= (unint64_t)(v75 & 0x7F) << v69;
              if (v75 < 0)
              {
                v69 += 7;
                v19 = v70++ >= 9;
                if (v19)
                {
                  v71 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10])
            v71 = 0;
LABEL_121:
          v84 = v71 != 0;
          v85 = 27;
          goto LABEL_126;
        case 0x14u:
          v76 = 0;
          v77 = 0;
          v78 = 0;
          v5->_hasCensorSpeech = 1;
          break;
        case 0x15u:
          v94 = 0;
          v95 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_135;
          v63 = -[BMSiriRequestContextMeCard initByReadFrom:]([BMSiriRequestContextMeCard alloc], "initByReadFrom:", v4);
          if (!v63)
            goto LABEL_135;
          v64 = 144;
LABEL_97:
          v83 = *(Class *)((char *)&v5->super.super.isa + v64);
          *(Class *)((char *)&v5->super.super.isa + v64) = v63;

          PBReaderRecallMark();
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_135:

          goto LABEL_132;
      }
      while (1)
      {
        v79 = *v8;
        v80 = *(_QWORD *)&v4[v79];
        v81 = v80 + 1;
        if (v80 == -1 || v81 > *(_QWORD *)&v4[*v9])
          break;
        v82 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v80);
        *(_QWORD *)&v4[v79] = v81;
        v78 |= (unint64_t)(v82 & 0x7F) << v76;
        if ((v82 & 0x80) == 0)
          goto LABEL_123;
        v76 += 7;
        v19 = v77++ >= 9;
        if (v19)
        {
          v78 = 0;
          goto LABEL_125;
        }
      }
      v4[*v10] = 1;
LABEL_123:
      if (v4[*v10])
        v78 = 0;
LABEL_125:
      v84 = v78 != 0;
      v85 = 29;
LABEL_126:
      *((_BYTE *)&v5->super.super.isa + v85) = v84;
    }
    while (*(_QWORD *)&v4[*v8] < *(_QWORD *)&v4[*v9]);
  }
  v86 = objc_msgSend(v6, "copy");
  deviceRestrictions = v5->_deviceRestrictions;
  v5->_deviceRestrictions = (NSArray *)v86;

  v88 = objc_msgSend(v7, "copy");
  bargeInModes = v5->_bargeInModes;
  v5->_bargeInModes = (NSArray *)v88;

  v90 = v4[*v10];
  if (v90)
LABEL_132:
    v91 = 0;
  else
LABEL_133:
    v91 = v5;

  return v91;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_sessionID)
    PBDataWriterWriteStringField();
  if (self->_requestID)
    PBDataWriterWriteStringField();
  if (self->_inputOrigin)
    PBDataWriterWriteStringField();
  if (self->_responseMode)
    PBDataWriterWriteStringField();
  if (self->_hasIsEyesFree)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsMultiUser)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsVoiceTriggerEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsTextToSpeechEnabled)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsTriggerlessFollowup)
    PBDataWriterWriteBOOLField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_deviceRestrictions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_bargeInModes;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_identifiedUser)
  {
    PBDataWriterPlaceMark();
    -[BMSiriRequestContextUser writeTo:](self->_identifiedUser, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_encodedLocation)
    PBDataWriterWriteDataField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_siriLocale)
    PBDataWriterWriteStringField();
  if (self->_contentRestrictions)
  {
    PBDataWriterPlaceMark();
    -[BMSiriRequestContextContentRestriction writeTo:](self->_contentRestrictions, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasUiScale)
    PBDataWriterWriteDoubleField();
  if (self->_temperatureUnit)
    PBDataWriterWriteStringField();
  if (self->_hasAllowUserGeneratedContent)
    PBDataWriterWriteBOOLField();
  if (self->_hasCensorSpeech)
    PBDataWriterWriteBOOLField();
  if (self->_meCard)
  {
    PBDataWriterPlaceMark();
    -[BMSiriRequestContextMeCard writeTo:](self->_meCard, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRequestContext writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRequestContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BMSiriRequestContext *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BMSiriRequestContext *v25;
  void *v26;
  id v27;
  uint64_t v28;
  BMSiriRequestContext *v29;
  id *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  void *v104;
  id v105;
  id v106;
  void *v107;
  int v108;
  id v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  id *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  id v129;
  uint64_t v130;
  void *v131;
  id v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  void *v138;
  BMSiriRequestContextUser **v139;
  uint64_t *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  id v163;
  BMSiriRequestContextUser *v164;
  id v165;
  void *v166;
  void *v167;
  id v168;
  id *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  BMSiriRequestContextContentRestriction *v174;
  id v175;
  void *v176;
  id v177;
  id v178;
  id *v179;
  uint64_t v180;
  id v181;
  id v182;
  id *v183;
  uint64_t v184;
  id v185;
  id v186;
  id *v187;
  uint64_t v188;
  id v189;
  id *v190;
  uint64_t v191;
  void *v192;
  id v194;
  BMSiriRequestContextMeCard *v195;
  id v196;
  void *v197;
  id v198;
  id v199;
  id *v200;
  uint64_t v201;
  id v202;
  id v203;
  id *v204;
  uint64_t v205;
  id v206;
  id v207;
  id *v208;
  uint64_t v209;
  id v210;
  id v211;
  id *v212;
  uint64_t v213;
  uint64_t v214;
  id v215;
  id *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  id v228;
  void *v229;
  id v230;
  void *v231;
  id v232;
  id v233;
  void *v234;
  BMSiriRequestContextContentRestriction *v235;
  void *v236;
  id v237;
  void *v238;
  id v239;
  void *v240;
  void *v241;
  id v242;
  BMSiriRequestContextUser *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  id v249;
  id v250;
  void *v251;
  id v252;
  void *v253;
  id obj;
  void *v255;
  id v256;
  BMSiriRequestContext *v257;
  id v258;
  void *v259;
  id v260;
  id v261;
  void *v262;
  id v263;
  id *v264;
  void *v265;
  id v266;
  void *v267;
  void *v268;
  void *v269;
  id v270;
  id v271;
  id v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  uint64_t v285;
  id v286;
  uint64_t v287;
  id v288;
  uint64_t v289;
  id v290;
  uint64_t v291;
  BMSiriRequestContextContentRestriction *v292;
  uint64_t v293;
  void *v294;
  uint64_t v295;
  id v296;
  uint64_t v297;
  id v298;
  uint64_t v299;
  BMSiriRequestContextUser *v300;
  uint64_t v301;
  BMSiriRequestContextUser *v302;
  uint64_t v303;
  BMSiriRequestContextUser *v304;
  _BYTE v305[128];
  uint64_t v306;
  void *v307;
  uint64_t v308;
  void *v309;
  uint64_t v310;
  void *v311;
  _BYTE v312[128];
  uint64_t v313;
  void *v314;
  uint64_t v315;
  id v316;
  uint64_t v317;
  id v318;
  uint64_t v319;
  void *v320;
  uint64_t v321;
  void *v322;
  uint64_t v323;
  id v324;
  uint64_t v325;
  id v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  uint64_t v331;
  _QWORD v332[3];

  v332[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionID"));
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  if (v269 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = a4;
        v21 = *MEMORY[0x1E0D025B8];
        v331 = *MEMORY[0x1E0CB2D50];
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sessionID"));
        v332[0] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v332, &v331, 1);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v19;
        v8 = (void *)v23;
        v25 = 0;
        *v20 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v21, 2, v23);
        v7 = 0;
        goto LABEL_219;
      }
      v7 = 0;
      v25 = 0;
      goto LABEL_220;
    }
    v7 = v269;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v26 = v8;
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v329 = *MEMORY[0x1E0CB2D50];
        v29 = self;
        v30 = a4;
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v220 = objc_opt_class();
        v32 = v31;
        v33 = v7;
        v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v220, CFSTR("requestID"));
        v330 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v27;
        v8 = v26;
        v37 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v28, 2, v35);
        v22 = 0;
        v25 = 0;
        *v30 = v37;
        self = v29;
        v9 = (void *)v35;
        v7 = v33;
        goto LABEL_218;
      }
      v22 = 0;
      v25 = 0;
      goto LABEL_219;
    }
    v266 = v8;
  }
  else
  {
    v266 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputOrigin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v48 = v8;
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v50 = *MEMORY[0x1E0D025B8];
        v327 = *MEMORY[0x1E0CB2D50];
        v51 = v9;
        v52 = v7;
        v53 = objc_alloc(MEMORY[0x1E0CB3940]);
        v221 = objc_opt_class();
        v54 = v53;
        v7 = v52;
        v9 = v51;
        v55 = objc_msgSend(v54, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v221, CFSTR("inputOrigin"));
        v328 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v328, &v327, 1);
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = v49;
        v8 = v48;
        v58 = (void *)v55;
        v265 = (void *)v56;
        v59 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v50, 2);
        v34 = 0;
        v25 = 0;
        *a4 = v59;
        v22 = v266;
        goto LABEL_217;
      }
      v34 = 0;
      v25 = 0;
      v22 = v266;
      goto LABEL_218;
    }
    v263 = v9;
  }
  else
  {
    v263 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("responseMode"));
  v10 = objc_claimAutoreleasedReturnValue();
  v265 = (void *)v10;
  if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v61 = v8;
        v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v63 = *MEMORY[0x1E0D025B8];
        v325 = *MEMORY[0x1E0CB2D50];
        v64 = v9;
        v65 = v7;
        v66 = objc_alloc(MEMORY[0x1E0CB3940]);
        v222 = objc_opt_class();
        v67 = v66;
        v7 = v65;
        v9 = v64;
        v261 = (id)objc_msgSend(v67, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v222, CFSTR("responseMode"));
        v326 = v261;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v326, &v325, 1);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v62;
        v8 = v61;
        v262 = (void *)v68;
        v70 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v63, 2);
        v58 = 0;
        v25 = 0;
        *a4 = v70;
        v22 = v266;
        v34 = v263;
        goto LABEL_216;
      }
      v58 = 0;
      v25 = 0;
      v22 = v266;
      v34 = v263;
      goto LABEL_217;
    }
    v260 = v11;
  }
  else
  {
    v260 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isEyesFree"));
  v12 = objc_claimAutoreleasedReturnValue();
  v264 = a4;
  v262 = (void *)v12;
  if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v71 = v8;
        v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v73 = *MEMORY[0x1E0D025B8];
        v323 = *MEMORY[0x1E0CB2D50];
        v74 = v7;
        v75 = objc_alloc(MEMORY[0x1E0CB3940]);
        v223 = objc_opt_class();
        v76 = v75;
        v7 = v74;
        v258 = (id)objc_msgSend(v76, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v223, CFSTR("isEyesFree"));
        v324 = v258;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v324, &v323, 1);
        v77 = objc_claimAutoreleasedReturnValue();
        v78 = v72;
        v8 = v71;
        v259 = (void *)v77;
        v79 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v73, 2);
        v261 = 0;
        v25 = 0;
        *a4 = v79;
        v22 = v266;
        v34 = v263;
        v58 = v260;
        goto LABEL_215;
      }
      v261 = 0;
      v25 = 0;
      v22 = v266;
      v34 = v263;
      v58 = v260;
      goto LABEL_216;
    }
    v14 = self;
    v261 = v13;
  }
  else
  {
    v14 = self;
    v261 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isMultiUser"));
  v15 = objc_claimAutoreleasedReturnValue();
  v256 = v7;
  v257 = v14;
  v259 = (void *)v15;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v264)
      {
        v258 = 0;
        v25 = 0;
        v22 = v266;
        v34 = v263;
        v58 = v260;
        self = v14;
        goto LABEL_215;
      }
      v80 = v8;
      v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v82 = *MEMORY[0x1E0D025B8];
      v321 = *MEMORY[0x1E0CB2D50];
      v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isMultiUser"));
      v322 = v83;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v322, &v321, 1);
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = v81;
      v8 = v80;
      v86 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v82, 2, v84);
      v258 = 0;
      v25 = 0;
      *v264 = v86;
      v17 = (void *)v84;
LABEL_117:
      v22 = v266;
      v34 = v263;
      v58 = v260;
      goto LABEL_214;
    }
    v258 = v16;
  }
  else
  {
    v258 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isVoiceTriggerEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v252 = 0;
    v18 = v264;
    goto LABEL_41;
  }
  objc_opt_class();
  v18 = v264;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v252 = 0;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v264)
    {
      v87 = v8;
      v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v89 = *MEMORY[0x1E0D025B8];
      v319 = *MEMORY[0x1E0CB2D50];
      v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isVoiceTriggerEnabled"));
      v320 = v90;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v320, &v319, 1);
      v91 = objc_claimAutoreleasedReturnValue();
      v92 = v88;
      v8 = v87;
      v253 = (void *)v91;
      v93 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v89, 2);
      v83 = 0;
      v25 = 0;
      *v264 = v93;
      v22 = v266;
      v58 = v260;
      goto LABEL_213;
    }
    v83 = 0;
    v25 = 0;
    goto LABEL_117;
  }
  v252 = v17;
LABEL_41:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isTextToSpeechEnabled"));
  v38 = objc_claimAutoreleasedReturnValue();
  v253 = (void *)v38;
  if (v38 && (v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v18)
      {
        v94 = v8;
        v95 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v96 = *MEMORY[0x1E0D025B8];
        v317 = *MEMORY[0x1E0CB2D50];
        v250 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isTextToSpeechEnabled"));
        v318 = v250;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v318, &v317, 1);
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = v95;
        v8 = v94;
        v251 = (void *)v97;
        v99 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v96, 2);
        v90 = 0;
        v25 = 0;
        *v18 = v99;
        v22 = v266;
        v58 = v260;
        v83 = v252;
        goto LABEL_212;
      }
      v90 = 0;
      v25 = 0;
      v22 = v266;
      v58 = v260;
      v83 = v252;
      goto LABEL_213;
    }
    v40 = v17;
    v249 = v39;
  }
  else
  {
    v40 = v17;
    v249 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isTriggerlessFollowup"));
  v41 = objc_claimAutoreleasedReturnValue();
  v248 = v8;
  v251 = (void *)v41;
  if (v41 && (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v264)
      {
        v116 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v117 = *MEMORY[0x1E0D025B8];
        v315 = *MEMORY[0x1E0CB2D50];
        obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isTriggerlessFollowup"));
        v316 = obj;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v316, &v315, 1);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v117, 2);
        v250 = 0;
        v25 = 0;
        *v264 = v118;
        v22 = v266;
        v58 = v260;
        v83 = v252;
        v90 = v249;
        v17 = v40;

        goto LABEL_211;
      }
      v250 = 0;
      v25 = 0;
      v22 = v266;
      v58 = v260;
      v83 = v252;
      v90 = v249;
      v17 = v40;
      goto LABEL_212;
    }
    v43 = v9;
    v250 = v42;
  }
  else
  {
    v43 = v9;
    v250 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceRestrictions"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v44, "isEqual:", v45);

  v17 = v40;
  if (v46)
  {
    v244 = v40;

    v47 = 0;
    v9 = v43;
  }
  else
  {
    v60 = v44;
    v9 = v43;
    if (v60)
    {
      objc_opt_class();
      obj = v60;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v264)
        {
          v25 = 0;
          v22 = v266;
          v58 = v260;
          v83 = v252;
          v90 = v249;
          goto LABEL_211;
        }
        v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v134 = *MEMORY[0x1E0D025B8];
        v313 = *MEMORY[0x1E0CB2D50];
        v267 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("deviceRestrictions"));
        v314 = v267;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v314, &v313, 1);
        v106 = (id)objc_claimAutoreleasedReturnValue();
        v135 = v134;
        v17 = v40;
        v25 = 0;
        *v264 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v135, 2, v106);
        v22 = v266;
        v58 = v260;
        goto LABEL_113;
      }
      v244 = v40;
      v47 = v60;
    }
    else
    {
      v244 = v40;
      v47 = 0;
    }
  }
  v267 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v47, "count"));
  v277 = 0u;
  v278 = 0u;
  v279 = 0u;
  v280 = 0u;
  obj = v47;
  v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v277, v312, 16);
  if (!v100)
    goto LABEL_81;
  v101 = v100;
  v102 = *(_QWORD *)v278;
  do
  {
    for (i = 0; i != v101; ++i)
    {
      if (*(_QWORD *)v278 != v102)
        objc_enumerationMutation(obj);
      v104 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v264)
        {
          v109 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v110 = *MEMORY[0x1E0D025B8];
          v310 = *MEMORY[0x1E0CB2D50];
          v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("deviceRestrictions"));
          v311 = v255;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v311, &v310, 1);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = v109;
          v113 = v110;
          goto LABEL_87;
        }
LABEL_88:
        v25 = 0;
        v22 = v266;
        v106 = obj;
        goto LABEL_89;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v264)
          goto LABEL_88;
        v114 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v115 = *MEMORY[0x1E0D025B8];
        v308 = *MEMORY[0x1E0CB2D50];
        v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceRestrictions"));
        v309 = v255;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v309, &v308, 1);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v114;
        v113 = v115;
LABEL_87:
        v22 = v266;
        v58 = v260;
        v25 = 0;
        *v264 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2, v111);
        v106 = obj;
LABEL_127:
        v17 = v244;
        v83 = v252;
        v90 = v249;
        goto LABEL_208;
      }
      v105 = v104;
      objc_msgSend(v267, "addObject:", v105);

    }
    v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v277, v312, 16);
  }
  while (v101);
LABEL_81:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bargeInModes"));
  v106 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v106, "isEqual:", v107);

  if (v108)
  {

    v106 = 0;
    goto LABEL_97;
  }
  if (v106)
  {
    objc_opt_class();
    v119 = v264;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v264)
      {
        v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v121 = *MEMORY[0x1E0D025B8];
        v306 = *MEMORY[0x1E0CB2D50];
        v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("bargeInModes"));
        v307 = v255;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v307, &v306, 1);
        v122 = objc_claimAutoreleasedReturnValue();
        v123 = v121;
        v111 = (void *)v122;
        v25 = 0;
        *v264 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v123, 2, v122);
        goto LABEL_126;
      }
      v25 = 0;
      v22 = v266;
LABEL_89:
      v58 = v260;
      v17 = v244;
LABEL_113:
      v83 = v252;
      v90 = v249;
      goto LABEL_209;
    }
  }
  else
  {
LABEL_97:
    v119 = v264;
  }
  v255 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v106, "count"));
  v273 = 0u;
  v274 = 0u;
  v275 = 0u;
  v276 = 0u;
  v106 = v106;
  v124 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v273, v305, 16);
  if (!v124)
    goto LABEL_107;
  v125 = v124;
  v126 = *(_QWORD *)v274;
  while (2)
  {
    v127 = 0;
    while (2)
    {
      if (*(_QWORD *)v274 != v126)
        objc_enumerationMutation(v106);
      v128 = *(void **)(*((_QWORD *)&v273 + 1) + 8 * v127);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v264)
        {
          v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v137 = *MEMORY[0x1E0D025B8];
          v303 = *MEMORY[0x1E0CB2D50];
          v243 = (BMSiriRequestContextUser *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("bargeInModes"));
          v304 = v243;
          v138 = (void *)MEMORY[0x1E0C99D80];
          v139 = &v304;
          v140 = &v303;
LABEL_122:
          objc_msgSend(v138, "dictionaryWithObjects:forKeys:count:", v139, v140, 1);
          v242 = (id)objc_claimAutoreleasedReturnValue();
          v141 = (void *)objc_msgSend(v136, "initWithDomain:code:userInfo:", v137, 2);
          v22 = v266;
          v58 = v260;
          v17 = v244;
          v25 = 0;
          *v264 = v141;
          v111 = v106;
          v83 = v252;
          v90 = v249;
          goto LABEL_206;
        }
LABEL_125:
        v25 = 0;
        v111 = v106;
LABEL_126:
        v22 = v266;
        v58 = v260;
        goto LABEL_127;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v264)
        {
          v136 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v137 = *MEMORY[0x1E0D025B8];
          v301 = *MEMORY[0x1E0CB2D50];
          v243 = (BMSiriRequestContextUser *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bargeInModes"));
          v302 = v243;
          v138 = (void *)MEMORY[0x1E0C99D80];
          v139 = &v302;
          v140 = &v301;
          goto LABEL_122;
        }
        goto LABEL_125;
      }
      v129 = v128;
      objc_msgSend(v255, "addObject:", v129);

      if (v125 != ++v127)
        continue;
      break;
    }
    v125 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v273, v305, 16);
    v119 = v264;
    if (v125)
      continue;
    break;
  }
LABEL_107:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifiedUser"));
  v130 = objc_claimAutoreleasedReturnValue();
  v241 = (void *)v130;
  if (!v130)
  {
    v243 = 0;
    v132 = v263;
    v17 = v244;
    goto LABEL_130;
  }
  v131 = (void *)v130;
  objc_opt_class();
  v17 = v244;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v243 = 0;
    goto LABEL_110;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v119)
    {
      v168 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v169 = v119;
      v170 = *MEMORY[0x1E0D025B8];
      v299 = *MEMORY[0x1E0CB2D50];
      v243 = (BMSiriRequestContextUser *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("identifiedUser"));
      v300 = v243;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v300, &v299, 1);
      v171 = objc_claimAutoreleasedReturnValue();
      v172 = v170;
      v111 = v241;
      v25 = 0;
      *v169 = (id)objc_msgSend(v168, "initWithDomain:code:userInfo:", v172, 2, v171);
      v167 = (void *)v171;
      v17 = v244;
      v22 = v266;
      goto LABEL_179;
    }
    v25 = 0;
    v22 = v266;
    v58 = v260;
    v83 = v252;
    v90 = v249;
    v111 = v241;
    goto LABEL_208;
  }
  v163 = v131;
  v164 = [BMSiriRequestContextUser alloc];
  v272 = 0;
  v243 = -[BMSiriRequestContextUser initWithJSONDictionary:error:](v164, "initWithJSONDictionary:error:", v163, &v272);
  v165 = v272;
  if (!v165)
  {

LABEL_110:
    v132 = v263;
LABEL_130:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encodedLocation"));
    v142 = objc_claimAutoreleasedReturnValue();
    v240 = (void *)v142;
    v263 = v132;
    if (v142 && (v143 = (void *)v142, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v119)
        {
          v25 = 0;
          v242 = 0;
          v22 = v266;
          v58 = v260;
          v83 = v252;
          v90 = v249;
          v111 = v241;
LABEL_205:

LABEL_206:
          v167 = v242;
          goto LABEL_207;
        }
        v177 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v178 = v106;
        v179 = v119;
        v180 = *MEMORY[0x1E0D025B8];
        v297 = *MEMORY[0x1E0CB2D50];
        v239 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("encodedLocation"));
        v298 = v239;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v242 = 0;
        *v179 = (id)objc_msgSend(v177, "initWithDomain:code:userInfo:", v180, 2);
        v106 = v178;
        goto LABEL_238;
      }
      v242 = v143;
    }
    else
    {
      v242 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v144 = objc_claimAutoreleasedReturnValue();
    v238 = (void *)v144;
    if (!v144 || (v145 = (void *)v144, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v239 = 0;
      goto LABEL_136;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v239 = v145;
LABEL_136:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriLocale"));
      v146 = objc_claimAutoreleasedReturnValue();
      v236 = (void *)v146;
      if (!v146 || (v147 = (void *)v146, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v237 = 0;
        goto LABEL_139;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v237 = v147;
LABEL_139:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentRestrictions"));
        v148 = objc_claimAutoreleasedReturnValue();
        v234 = (void *)v148;
        if (!v148 || (v149 = (void *)v148, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v235 = 0;
LABEL_142:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uiScale"));
          v150 = objc_claimAutoreleasedReturnValue();
          v231 = (void *)v150;
          if (v150 && (v151 = (void *)v150, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v119)
              {
                v25 = 0;
                v233 = 0;
                v22 = v266;
                v58 = v260;
                v83 = v252;
                v90 = v249;
                v111 = v241;
                goto LABEL_164;
              }
              v198 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v199 = v106;
              v200 = v119;
              v201 = *MEMORY[0x1E0D025B8];
              v289 = *MEMORY[0x1E0CB2D50];
              v232 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("uiScale"));
              v290 = v232;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = 0;
              v233 = 0;
              *v200 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v201, 2);
              v106 = v199;
              goto LABEL_249;
            }
            v233 = v151;
          }
          else
          {
            v233 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("temperatureUnit"));
          v152 = objc_claimAutoreleasedReturnValue();
          v229 = (void *)v152;
          if (!v152 || (v153 = (void *)v152, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v232 = 0;
            goto LABEL_148;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v232 = v153;
LABEL_148:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowUserGeneratedContent"));
            v154 = objc_claimAutoreleasedReturnValue();
            v227 = (void *)v154;
            if (!v154 || (v155 = (void *)v154, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v230 = 0;
              goto LABEL_151;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v230 = v155;
LABEL_151:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("censorSpeech"));
              v156 = objc_claimAutoreleasedReturnValue();
              v226 = (void *)v156;
              if (!v156 || (v157 = (void *)v156, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v228 = 0;
                goto LABEL_154;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v228 = v157;
LABEL_154:
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("meCard"));
                v158 = objc_claimAutoreleasedReturnValue();
                v225 = (void *)v158;
                if (v158 && (v159 = (void *)v158, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!v119)
                    {
                      v25 = 0;
                      v22 = v266;
                      v58 = v260;
                      v83 = v252;
                      v90 = v249;
                      v111 = v241;
                      goto LABEL_160;
                    }
                    v215 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v247 = v17;
                    v216 = v119;
                    v217 = *MEMORY[0x1E0D025B8];
                    v281 = *MEMORY[0x1E0CB2D50];
                    v218 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("meCard"));
                    v282 = v218;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v282, &v281, 1);
                    v219 = (void *)objc_claimAutoreleasedReturnValue();
                    *v216 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v217, 2, v219);
                    v17 = v247;

                    v162 = (void *)v218;
                    v25 = 0;
                    v22 = v266;
                    v58 = v260;
                    v83 = v252;
                    v90 = v249;
                    goto LABEL_158;
                  }
                  v194 = v159;
                  v195 = [BMSiriRequestContextMeCard alloc];
                  v270 = 0;
                  v160 = -[BMSiriRequestContextMeCard initWithJSONDictionary:error:](v195, "initWithJSONDictionary:error:", v194, &v270);
                  v196 = v270;
                  v22 = v266;
                  v58 = v260;
                  if (v196)
                  {
                    v197 = v196;
                    v246 = (void *)v160;
                    if (v119)
                      *v119 = objc_retainAutorelease(v196);

                    v25 = 0;
                    v225 = v194;
                    v83 = v252;
                    v90 = v249;
                    v111 = v241;
                    v162 = v246;
                    goto LABEL_159;
                  }

                }
                else
                {
                  v160 = 0;
                  v22 = v266;
                  v58 = v260;
                }
                v224 = v160;
                v161 = (void *)v160;
                v90 = v249;
                v83 = v252;
                v25 = objc_retain(-[BMSiriRequestContext initWithSessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:](v257, "initWithSessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:", v256, v22, v263, v58, v261, v258, v252, v249, v250, v267, v255, v243, v242,
                          v239,
                          v237,
                          v235,
                          v233,
                          v232,
                          v230,
                          v228,
                          v224));
                v257 = v25;
                v162 = v161;
LABEL_158:
                v111 = v241;
LABEL_159:

LABEL_160:
LABEL_161:

LABEL_162:
LABEL_163:

LABEL_164:
LABEL_201:

LABEL_202:
LABEL_203:

LABEL_204:
                goto LABEL_205;
              }
              if (v119)
              {
                v210 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v211 = v106;
                v212 = v119;
                v213 = *MEMORY[0x1E0D025B8];
                v283 = *MEMORY[0x1E0CB2D50];
                v225 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("censorSpeech"));
                v284 = v225;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v284, &v283, 1);
                v214 = objc_claimAutoreleasedReturnValue();
                v25 = 0;
                v228 = 0;
                *v212 = (id)objc_msgSend(v210, "initWithDomain:code:userInfo:", v213, 2, v214);
                v162 = (void *)v214;
                v106 = v211;
                v22 = v266;
                v58 = v260;
                v83 = v252;
                v90 = v249;
                goto LABEL_158;
              }
              v228 = 0;
              v25 = 0;
LABEL_253:
              v22 = v266;
              v58 = v260;
              v83 = v252;
              v90 = v249;
              v111 = v241;
              goto LABEL_161;
            }
            if (v119)
            {
              v206 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v207 = v106;
              v208 = v119;
              v209 = *MEMORY[0x1E0D025B8];
              v285 = *MEMORY[0x1E0CB2D50];
              v228 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("allowUserGeneratedContent"));
              v286 = v228;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v286, &v285, 1);
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = 0;
              v230 = 0;
              *v208 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v209, 2);
              v106 = v207;
              goto LABEL_253;
            }
            v230 = 0;
            v25 = 0;
LABEL_251:
            v22 = v266;
            v58 = v260;
            v83 = v252;
            v90 = v249;
            v111 = v241;
            goto LABEL_162;
          }
          if (v119)
          {
            v202 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v203 = v106;
            v204 = v119;
            v205 = *MEMORY[0x1E0D025B8];
            v287 = *MEMORY[0x1E0CB2D50];
            v230 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("temperatureUnit"));
            v288 = v230;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v288, &v287, 1);
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0;
            v232 = 0;
            *v204 = (id)objc_msgSend(v202, "initWithDomain:code:userInfo:", v205, 2);
            v106 = v203;
            goto LABEL_251;
          }
          v232 = 0;
          v25 = 0;
LABEL_249:
          v22 = v266;
          v58 = v260;
          v83 = v252;
          v90 = v249;
          v111 = v241;
          goto LABEL_163;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v173 = v149;
          v174 = [BMSiriRequestContextContentRestriction alloc];
          v271 = 0;
          v235 = -[BMSiriRequestContextContentRestriction initWithJSONDictionary:error:](v174, "initWithJSONDictionary:error:", v173, &v271);
          v175 = v271;
          if (!v175)
          {

            goto LABEL_142;
          }
          v176 = v175;
          if (v119)
            *v119 = objc_retainAutorelease(v175);

          v25 = 0;
          v22 = v266;
          v58 = v260;
          v83 = v252;
          v234 = v173;
        }
        else
        {
          if (!v119)
          {
            v25 = 0;
            v22 = v266;
            v58 = v260;
            v83 = v252;
            v90 = v249;
            v111 = v241;
            goto LABEL_202;
          }
          v189 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v245 = v17;
          v190 = v119;
          v191 = *MEMORY[0x1E0D025B8];
          v291 = *MEMORY[0x1E0CB2D50];
          v235 = (BMSiriRequestContextContentRestriction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("contentRestrictions"));
          v292 = v235;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          *v190 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v191, 2, v192);
          v17 = v245;

          v25 = 0;
          v22 = v266;
          v58 = v260;
          v83 = v252;
        }
        v90 = v249;
LABEL_200:
        v111 = v241;
        goto LABEL_201;
      }
      if (v119)
      {
        v185 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v186 = v106;
        v187 = v119;
        v188 = *MEMORY[0x1E0D025B8];
        v293 = *MEMORY[0x1E0CB2D50];
        v234 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("siriLocale"));
        v294 = v234;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v294, &v293, 1);
        v235 = (BMSiriRequestContextContentRestriction *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v237 = 0;
        *v187 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v188, 2);
        v106 = v186;
        v22 = v266;
        v58 = v260;
        v83 = v252;
        v90 = v249;
        goto LABEL_200;
      }
      v237 = 0;
      v25 = 0;
LABEL_242:
      v22 = v266;
      v58 = v260;
      v83 = v252;
      v90 = v249;
      v111 = v241;
      goto LABEL_203;
    }
    if (v119)
    {
      v181 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v182 = v106;
      v183 = v119;
      v184 = *MEMORY[0x1E0D025B8];
      v295 = *MEMORY[0x1E0CB2D50];
      v237 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
      v296 = v237;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v239 = 0;
      *v183 = (id)objc_msgSend(v181, "initWithDomain:code:userInfo:", v184, 2);
      v106 = v182;
      goto LABEL_242;
    }
    v239 = 0;
    v25 = 0;
LABEL_238:
    v22 = v266;
    v58 = v260;
    v83 = v252;
    v90 = v249;
    v111 = v241;
    goto LABEL_204;
  }
  v166 = v165;
  v22 = v266;
  if (v119)
    *v119 = objc_retainAutorelease(v165);

  v25 = 0;
  v167 = v163;
  v111 = v163;
LABEL_179:
  v58 = v260;
  v83 = v252;
  v90 = v249;
LABEL_207:

LABEL_208:
LABEL_209:

LABEL_211:
  v8 = v248;
LABEL_212:

LABEL_213:
  v34 = v263;
LABEL_214:

  v7 = v256;
  self = v257;
LABEL_215:

LABEL_216:
LABEL_217:

LABEL_218:
LABEL_219:

LABEL_220:
  return v25;
}

- (id)_deviceRestrictionsJSONArray
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
  -[BMSiriRequestContext deviceRestrictions](self, "deviceRestrictions", 0);
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

- (id)_bargeInModesJSONArray
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
  -[BMSiriRequestContext bargeInModes](self, "bargeInModes", 0);
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
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
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[21];
  _QWORD v77[23];

  v77[21] = *MEMORY[0x1E0C80C00];
  -[BMSiriRequestContext sessionID](self, "sessionID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext requestID](self, "requestID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext inputOrigin](self, "inputOrigin");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext responseMode](self, "responseMode");
  v6 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriRequestContext hasIsEyesFree](self, "hasIsEyesFree"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isEyesFree](self, "isEyesFree"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriRequestContext hasIsMultiUser](self, "hasIsMultiUser"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isMultiUser](self, "isMultiUser"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (-[BMSiriRequestContext hasIsVoiceTriggerEnabled](self, "hasIsVoiceTriggerEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isVoiceTriggerEnabled](self, "isVoiceTriggerEnabled"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if (-[BMSiriRequestContext hasIsTextToSpeechEnabled](self, "hasIsTextToSpeechEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isTextToSpeechEnabled](self, "isTextToSpeechEnabled"));
    v74 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }
  if (-[BMSiriRequestContext hasIsTriggerlessFollowup](self, "hasIsTriggerlessFollowup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext isTriggerlessFollowup](self, "isTriggerlessFollowup"));
    v73 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v73 = 0;
  }
  -[BMSiriRequestContext _deviceRestrictionsJSONArray](self, "_deviceRestrictionsJSONArray");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext _bargeInModesJSONArray](self, "_bargeInModesJSONArray");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext identifiedUser](self, "identifiedUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriRequestContext encodedLocation](self, "encodedLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriRequestContext countryCode](self, "countryCode");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext siriLocale](self, "siriLocale");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContext contentRestrictions](self, "contentRestrictions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0;
  if (-[BMSiriRequestContext hasUiScale](self, "hasUiScale"))
  {
    -[BMSiriRequestContext uiScale](self, "uiScale");
    if (fabs(v13) == INFINITY)
    {
      v75 = 0;
    }
    else
    {
      -[BMSiriRequestContext uiScale](self, "uiScale");
      v14 = (void *)MEMORY[0x1E0CB37E8];
      -[BMSiriRequestContext uiScale](self, "uiScale");
      objc_msgSend(v14, "numberWithDouble:");
      v75 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  -[BMSiriRequestContext temperatureUnit](self, "temperatureUnit");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriRequestContext hasAllowUserGeneratedContent](self, "hasAllowUserGeneratedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext allowUserGeneratedContent](self, "allowUserGeneratedContent"));
    v64 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v64 = 0;
  }
  if (-[BMSiriRequestContext hasCensorSpeech](self, "hasCensorSpeech"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContext censorSpeech](self, "censorSpeech"));
    v63 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v63 = 0;
  }
  -[BMSiriRequestContext meCard](self, "meCard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "jsonDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v76[0] = CFSTR("sessionID");
  v17 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v17;
  v77[0] = v17;
  v76[1] = CFSTR("requestID");
  v18 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v18;
  v77[1] = v18;
  v76[2] = CFSTR("inputOrigin");
  v19 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v19;
  v77[2] = v19;
  v76[3] = CFSTR("responseMode");
  v20 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v20;
  v77[3] = v20;
  v76[4] = CFSTR("isEyesFree");
  v21 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v21;
  v77[4] = v21;
  v76[5] = CFSTR("isMultiUser");
  v22 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v22;
  v77[5] = v22;
  v76[6] = CFSTR("isVoiceTriggerEnabled");
  v23 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v23;
  v77[6] = v23;
  v76[7] = CFSTR("isTextToSpeechEnabled");
  v24 = (uint64_t)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v77[7] = v24;
  v76[8] = CFSTR("isTriggerlessFollowup");
  v25 = (uint64_t)v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v77[8] = v25;
  v76[9] = CFSTR("deviceRestrictions");
  v26 = (uint64_t)v72;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v60 = (void *)v5;
  v77[9] = v26;
  v76[10] = CFSTR("bargeInModes");
  v27 = (uint64_t)v71;
  v28 = (void *)v26;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v62 = (void *)v3;
  v77[10] = v27;
  v76[11] = CFSTR("identifiedUser");
  v29 = (uint64_t)v70;
  v30 = (void *)v27;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v58 = v8;
  v56 = (void *)v29;
  v77[11] = v29;
  v76[12] = CFSTR("encodedLocation");
  v31 = (uint64_t)v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v57 = v9;
  v42 = v31;
  v77[12] = v31;
  v76[13] = CFSTR("countryCode");
  v32 = v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v4;
  v77[13] = v32;
  v76[14] = CFSTR("siriLocale");
  v33 = v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v6;
  v77[14] = v33;
  v76[15] = CFSTR("contentRestrictions");
  v34 = v66;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45 = v28;
  v47 = (void *)v24;
  v77[15] = v34;
  v76[16] = CFSTR("uiScale");
  v35 = v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = v7;
  v77[16] = v35;
  v76[17] = CFSTR("temperatureUnit");
  v37 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v25;
  v77[17] = v37;
  v76[18] = CFSTR("allowUserGeneratedContent");
  v38 = v64;
  if (!v64)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44 = v30;
  v77[18] = v38;
  v76[19] = CFSTR("censorSpeech");
  v39 = v63;
  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v77[19] = v39;
  v76[20] = CFSTR("meCard");
  v40 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v77[20] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 21, v42);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)

  if (!v63)
  if (!v64)

  if (!v65)
  if (!v75)

  if (!v66)
  if (!v67)

  if (!v68)
  if (!v69)

  if (!v70)
  if (!v71)

  if (!v72)
  if (!v73)

  if (v74)
  {
    if (v57)
      goto LABEL_96;
  }
  else
  {

    if (v57)
    {
LABEL_96:
      if (v58)
        goto LABEL_97;
      goto LABEL_105;
    }
  }

  if (v58)
  {
LABEL_97:
    if (v36)
      goto LABEL_98;
    goto LABEL_106;
  }
LABEL_105:

  if (v36)
  {
LABEL_98:
    if (v59)
      goto LABEL_99;
    goto LABEL_107;
  }
LABEL_106:

  if (v59)
  {
LABEL_99:
    if (v60)
      goto LABEL_100;
    goto LABEL_108;
  }
LABEL_107:

  if (v60)
  {
LABEL_100:
    if (v61)
      goto LABEL_101;
LABEL_109:

    if (v62)
      goto LABEL_102;
LABEL_110:

    goto LABEL_102;
  }
LABEL_108:

  if (!v61)
    goto LABEL_109;
LABEL_101:
  if (!v62)
    goto LABEL_110;
LABEL_102:

  return v55;
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
  int v31;
  int v32;
  int v33;
  int v34;
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
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  int v87;
  int v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriRequestContext sessionID](self, "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriRequestContext sessionID](self, "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_91;
    }
    -[BMSiriRequestContext requestID](self, "requestID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriRequestContext requestID](self, "requestID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_91;
    }
    -[BMSiriRequestContext inputOrigin](self, "inputOrigin");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputOrigin");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriRequestContext inputOrigin](self, "inputOrigin");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputOrigin");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_91;
    }
    -[BMSiriRequestContext responseMode](self, "responseMode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responseMode");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriRequestContext responseMode](self, "responseMode");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "responseMode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_91;
    }
    if (-[BMSiriRequestContext hasIsEyesFree](self, "hasIsEyesFree") || objc_msgSend(v5, "hasIsEyesFree"))
    {
      if (!-[BMSiriRequestContext hasIsEyesFree](self, "hasIsEyesFree"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasIsEyesFree"))
        goto LABEL_91;
      v31 = -[BMSiriRequestContext isEyesFree](self, "isEyesFree");
      if (v31 != objc_msgSend(v5, "isEyesFree"))
        goto LABEL_91;
    }
    if (-[BMSiriRequestContext hasIsMultiUser](self, "hasIsMultiUser")
      || objc_msgSend(v5, "hasIsMultiUser"))
    {
      if (!-[BMSiriRequestContext hasIsMultiUser](self, "hasIsMultiUser"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasIsMultiUser"))
        goto LABEL_91;
      v32 = -[BMSiriRequestContext isMultiUser](self, "isMultiUser");
      if (v32 != objc_msgSend(v5, "isMultiUser"))
        goto LABEL_91;
    }
    if (-[BMSiriRequestContext hasIsVoiceTriggerEnabled](self, "hasIsVoiceTriggerEnabled")
      || objc_msgSend(v5, "hasIsVoiceTriggerEnabled"))
    {
      if (!-[BMSiriRequestContext hasIsVoiceTriggerEnabled](self, "hasIsVoiceTriggerEnabled"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasIsVoiceTriggerEnabled"))
        goto LABEL_91;
      v33 = -[BMSiriRequestContext isVoiceTriggerEnabled](self, "isVoiceTriggerEnabled");
      if (v33 != objc_msgSend(v5, "isVoiceTriggerEnabled"))
        goto LABEL_91;
    }
    if (-[BMSiriRequestContext hasIsTextToSpeechEnabled](self, "hasIsTextToSpeechEnabled")
      || objc_msgSend(v5, "hasIsTextToSpeechEnabled"))
    {
      if (!-[BMSiriRequestContext hasIsTextToSpeechEnabled](self, "hasIsTextToSpeechEnabled"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasIsTextToSpeechEnabled"))
        goto LABEL_91;
      v34 = -[BMSiriRequestContext isTextToSpeechEnabled](self, "isTextToSpeechEnabled");
      if (v34 != objc_msgSend(v5, "isTextToSpeechEnabled"))
        goto LABEL_91;
    }
    if (-[BMSiriRequestContext hasIsTriggerlessFollowup](self, "hasIsTriggerlessFollowup")
      || objc_msgSend(v5, "hasIsTriggerlessFollowup"))
    {
      if (!-[BMSiriRequestContext hasIsTriggerlessFollowup](self, "hasIsTriggerlessFollowup"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasIsTriggerlessFollowup"))
        goto LABEL_91;
      v35 = -[BMSiriRequestContext isTriggerlessFollowup](self, "isTriggerlessFollowup");
      if (v35 != objc_msgSend(v5, "isTriggerlessFollowup"))
        goto LABEL_91;
    }
    -[BMSiriRequestContext deviceRestrictions](self, "deviceRestrictions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceRestrictions");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v36 == (void *)v37)
    {

    }
    else
    {
      v38 = (void *)v37;
      -[BMSiriRequestContext deviceRestrictions](self, "deviceRestrictions");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceRestrictions");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqual:", v40);

      if (!v41)
        goto LABEL_91;
    }
    -[BMSiriRequestContext bargeInModes](self, "bargeInModes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bargeInModes");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v42 == (void *)v43)
    {

    }
    else
    {
      v44 = (void *)v43;
      -[BMSiriRequestContext bargeInModes](self, "bargeInModes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bargeInModes");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "isEqual:", v46);

      if (!v47)
        goto LABEL_91;
    }
    -[BMSiriRequestContext identifiedUser](self, "identifiedUser");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifiedUser");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v48 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      -[BMSiriRequestContext identifiedUser](self, "identifiedUser");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifiedUser");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqual:", v52);

      if (!v53)
        goto LABEL_91;
    }
    -[BMSiriRequestContext encodedLocation](self, "encodedLocation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodedLocation");
    v55 = objc_claimAutoreleasedReturnValue();
    if (v54 == (void *)v55)
    {

    }
    else
    {
      v56 = (void *)v55;
      -[BMSiriRequestContext encodedLocation](self, "encodedLocation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodedLocation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "isEqual:", v58);

      if (!v59)
        goto LABEL_91;
    }
    -[BMSiriRequestContext countryCode](self, "countryCode");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v60 == (void *)v61)
    {

    }
    else
    {
      v62 = (void *)v61;
      -[BMSiriRequestContext countryCode](self, "countryCode");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v63, "isEqual:", v64);

      if (!v65)
        goto LABEL_91;
    }
    -[BMSiriRequestContext siriLocale](self, "siriLocale");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriLocale");
    v67 = objc_claimAutoreleasedReturnValue();
    if (v66 == (void *)v67)
    {

    }
    else
    {
      v68 = (void *)v67;
      -[BMSiriRequestContext siriLocale](self, "siriLocale");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriLocale");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "isEqual:", v70);

      if (!v71)
        goto LABEL_91;
    }
    -[BMSiriRequestContext contentRestrictions](self, "contentRestrictions");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentRestrictions");
    v73 = objc_claimAutoreleasedReturnValue();
    if (v72 == (void *)v73)
    {

    }
    else
    {
      v74 = (void *)v73;
      -[BMSiriRequestContext contentRestrictions](self, "contentRestrictions");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentRestrictions");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v75, "isEqual:", v76);

      if (!v77)
        goto LABEL_91;
    }
    if (-[BMSiriRequestContext hasUiScale](self, "hasUiScale") || objc_msgSend(v5, "hasUiScale"))
    {
      if (!-[BMSiriRequestContext hasUiScale](self, "hasUiScale"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasUiScale"))
        goto LABEL_91;
      -[BMSiriRequestContext uiScale](self, "uiScale");
      v79 = v78;
      objc_msgSend(v5, "uiScale");
      if (v79 != v80)
        goto LABEL_91;
    }
    -[BMSiriRequestContext temperatureUnit](self, "temperatureUnit");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "temperatureUnit");
    v82 = objc_claimAutoreleasedReturnValue();
    if (v81 == (void *)v82)
    {

    }
    else
    {
      v83 = (void *)v82;
      -[BMSiriRequestContext temperatureUnit](self, "temperatureUnit");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "temperatureUnit");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v84, "isEqual:", v85);

      if (!v86)
        goto LABEL_91;
    }
    if (!-[BMSiriRequestContext hasAllowUserGeneratedContent](self, "hasAllowUserGeneratedContent")
      && !objc_msgSend(v5, "hasAllowUserGeneratedContent")
      || -[BMSiriRequestContext hasAllowUserGeneratedContent](self, "hasAllowUserGeneratedContent")
      && objc_msgSend(v5, "hasAllowUserGeneratedContent")
      && (v87 = -[BMSiriRequestContext allowUserGeneratedContent](self, "allowUserGeneratedContent"),
          v87 == objc_msgSend(v5, "allowUserGeneratedContent")))
    {
      if (!-[BMSiriRequestContext hasCensorSpeech](self, "hasCensorSpeech")
        && !objc_msgSend(v5, "hasCensorSpeech")
        || -[BMSiriRequestContext hasCensorSpeech](self, "hasCensorSpeech")
        && objc_msgSend(v5, "hasCensorSpeech")
        && (v88 = -[BMSiriRequestContext censorSpeech](self, "censorSpeech"),
            v88 == objc_msgSend(v5, "censorSpeech")))
      {
        -[BMSiriRequestContext meCard](self, "meCard");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "meCard");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if (v90 == v91)
        {
          v12 = 1;
        }
        else
        {
          -[BMSiriRequestContext meCard](self, "meCard");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "meCard");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v92, "isEqual:", v93);

        }
        goto LABEL_92;
      }
    }
LABEL_91:
    v12 = 0;
LABEL_92:

    goto LABEL_93;
  }
  v12 = 0;
LABEL_93:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (BOOL)hasIsEyesFree
{
  return self->_hasIsEyesFree;
}

- (void)setHasIsEyesFree:(BOOL)a3
{
  self->_hasIsEyesFree = a3;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (BOOL)hasIsMultiUser
{
  return self->_hasIsMultiUser;
}

- (void)setHasIsMultiUser:(BOOL)a3
{
  self->_hasIsMultiUser = a3;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (BOOL)hasIsVoiceTriggerEnabled
{
  return self->_hasIsVoiceTriggerEnabled;
}

- (void)setHasIsVoiceTriggerEnabled:(BOOL)a3
{
  self->_hasIsVoiceTriggerEnabled = a3;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (BOOL)hasIsTextToSpeechEnabled
{
  return self->_hasIsTextToSpeechEnabled;
}

- (void)setHasIsTextToSpeechEnabled:(BOOL)a3
{
  self->_hasIsTextToSpeechEnabled = a3;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (BOOL)hasIsTriggerlessFollowup
{
  return self->_hasIsTriggerlessFollowup;
}

- (void)setHasIsTriggerlessFollowup:(BOOL)a3
{
  self->_hasIsTriggerlessFollowup = a3;
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (NSArray)bargeInModes
{
  return self->_bargeInModes;
}

- (BMSiriRequestContextUser)identifiedUser
{
  return self->_identifiedUser;
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)siriLocale
{
  return self->_siriLocale;
}

- (BMSiriRequestContextContentRestriction)contentRestrictions
{
  return self->_contentRestrictions;
}

- (double)uiScale
{
  return self->_uiScale;
}

- (BOOL)hasUiScale
{
  return self->_hasUiScale;
}

- (void)setHasUiScale:(BOOL)a3
{
  self->_hasUiScale = a3;
}

- (NSString)temperatureUnit
{
  return self->_temperatureUnit;
}

- (BOOL)allowUserGeneratedContent
{
  return self->_allowUserGeneratedContent;
}

- (BOOL)hasAllowUserGeneratedContent
{
  return self->_hasAllowUserGeneratedContent;
}

- (void)setHasAllowUserGeneratedContent:(BOOL)a3
{
  self->_hasAllowUserGeneratedContent = a3;
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (BOOL)hasCensorSpeech
{
  return self->_hasCensorSpeech;
}

- (void)setHasCensorSpeech:(BOOL)a3
{
  self->_hasCensorSpeech = a3;
}

- (BMSiriRequestContextMeCard)meCard
{
  return self->_meCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
  objc_storeStrong((id *)&self->_contentRestrictions, 0);
  objc_storeStrong((id *)&self->_siriLocale, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_identifiedUser, 0);
  objc_storeStrong((id *)&self->_bargeInModes, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
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

    v4 = -[BMSiriRequestContext initByReadFrom:]([BMSiriRequestContext alloc], "initByReadFrom:", v7);
    v4[8] = 0;

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
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionID"), 2, 0, 1, 13, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestID"), 2, 0, 2, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inputOrigin"), 2, 0, 3, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("responseMode"), 2, 0, 4, 13, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isEyesFree"), 0, 0, 5, 12, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isMultiUser"), 0, 0, 6, 12, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isVoiceTriggerEnabled"), 0, 0, 7, 12, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTextToSpeechEnabled"), 0, 0, 8, 12, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isTriggerlessFollowup"), 0, 0, 9, 12, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("deviceRestrictions_json"), 5, 1, &__block_literal_global_338);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bargeInModes_json"), 5, 1, &__block_literal_global_339);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("identifiedUser_json"), 5, 1, &__block_literal_global_340);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("encodedLocation"), 4, 0, 13, 14, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 14, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriLocale"), 2, 0, 15, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("contentRestrictions_json"), 5, 1, &__block_literal_global_341);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uiScale"), 1, 0, 17, 0, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("temperatureUnit"), 2, 0, 18, 13, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("allowUserGeneratedContent"), 0, 0, 19, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("censorSpeech"), 0, 0, 20, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("meCard_json"), 5, 1, &__block_literal_global_342);
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v13;
  v25[3] = v22;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v19;
  v25[7] = v18;
  v25[8] = v17;
  v25[9] = v16;
  v25[10] = v15;
  v25[11] = v2;
  v25[12] = v3;
  v25[13] = v4;
  v25[14] = v14;
  v25[15] = v5;
  v25[16] = v6;
  v25[17] = v12;
  v25[18] = v11;
  v25[19] = v7;
  v25[20] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CD68;
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
  _QWORD v25[23];

  v25[21] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionID"), 1, 13, 0);
  v25[0] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestID"), 2, 13, 0);
  v25[1] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inputOrigin"), 3, 13, 0);
  v25[2] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("responseMode"), 4, 13, 0);
  v25[3] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isEyesFree"), 5, 12, 0);
  v25[4] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isMultiUser"), 6, 12, 0);
  v25[5] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isVoiceTriggerEnabled"), 7, 12, 0);
  v25[6] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTextToSpeechEnabled"), 8, 12, 0);
  v25[7] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isTriggerlessFollowup"), 9, 12, 0);
  v25[8] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceRestrictions"), 10, 13, 0);
  v25[9] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bargeInModes"), 11, 13, 0);
  v25[10] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifiedUser"), 12, 14, objc_opt_class());
  v25[11] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("encodedLocation"), 13, 14, 0);
  v25[12] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 14, 13, 0);
  v25[13] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriLocale"), 15, 13, 0);
  v25[14] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentRestrictions"), 16, 14, objc_opt_class());
  v25[15] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uiScale"), 17, 0, 0);
  v25[16] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("temperatureUnit"), 18, 13, 0);
  v25[17] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("allowUserGeneratedContent"), 19, 12, 0);
  v25[18] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("censorSpeech"), 20, 12, 0);
  v25[19] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("meCard"), 21, 14, objc_opt_class());
  v25[20] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __31__BMSiriRequestContext_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __31__BMSiriRequestContext_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __31__BMSiriRequestContext_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiedUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __31__BMSiriRequestContext_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_bargeInModesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __31__BMSiriRequestContext_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deviceRestrictionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
