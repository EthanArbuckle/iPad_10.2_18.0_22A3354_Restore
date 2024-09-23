@implementation BMSiriVoiceTriggerStatistics

- (BMSiriVoiceTriggerStatistics)initWithAbsoluteTimestamp:(id)a3 firstPassPeakScoreHS:(id)a4 firstPassPeakScoreJS:(id)a5 firstPassTriggerSource:(id)a6 recognizerScoreHS:(id)a7 recognizerScoreJS:(id)a8 triggerScoreHS:(id)a9 triggerScoreJS:(id)a10 mitigationScore:(id)a11 invocationTypeID:(id)a12 repetitionSimilarityScore:(id)a13 tdSpeakerRecognizerCombinedScore:(id)a14 hwSampleRate:(id)a15 configVersion:(id)a16
{
  return -[BMSiriVoiceTriggerStatistics initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:](self, "initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           0,
           0,
           0,
           0);
}

- (BMSiriVoiceTriggerStatistics)initWithAbsoluteTimestamp:(id)a3 firstPassPeakScoreHS:(id)a4 firstPassPeakScoreJS:(id)a5 firstPassTriggerSource:(id)a6 recognizerScoreHS:(id)a7 recognizerScoreJS:(id)a8 triggerScoreHS:(id)a9 triggerScoreJS:(id)a10 mitigationScore:(id)a11 invocationTypeID:(id)a12 repetitionSimilarityScore:(id)a13 tdSpeakerRecognizerCombinedScore:(id)a14 hwSampleRate:(id)a15 configVersion:(id)a16 keywordThresholdHS:(id)a17 keywordThresholdJS:(id)a18 tdSpeakerRecognizerCombinedThresholdHS:(id)a19 tdSpeakerRecognizerCombinedThresholdJS:(id)a20
{
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BMSiriVoiceTriggerStatistics *v35;
  double v36;
  float v37;
  double v38;
  float v39;
  double v40;
  int v41;
  float v42;
  double v43;
  float v44;
  double v45;
  float v46;
  double v47;
  float v48;
  double v49;
  float v50;
  double v51;
  int v52;
  float v53;
  double v54;
  float v55;
  double v56;
  float v57;
  double v58;
  float v59;
  double v60;
  float v61;
  double v62;
  float v63;
  double v64;
  float v65;
  double v66;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  objc_super v78;

  v25 = a3;
  v26 = a4;
  v77 = a5;
  v76 = a6;
  v75 = a7;
  v74 = a8;
  v73 = a9;
  v72 = a10;
  v27 = v26;
  v71 = a11;
  v70 = a12;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v69 = a16;
  v31 = a17;
  v32 = a18;
  v33 = a19;
  v34 = a20;
  v78.receiver = self;
  v78.super_class = (Class)BMSiriVoiceTriggerStatistics;
  v35 = -[BMEventBase init](&v78, sel_init);
  if (v35)
  {
    v35->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v25)
    {
      v35->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v25, "timeIntervalSince1970");
    }
    else
    {
      v35->_hasRaw_absoluteTimestamp = 0;
      v36 = -1.0;
    }
    v35->_raw_absoluteTimestamp = v36;
    if (v27)
    {
      v35->_hasFirstPassPeakScoreHS = 1;
      objc_msgSend(v27, "floatValue");
      v38 = v37;
    }
    else
    {
      v35->_hasFirstPassPeakScoreHS = 0;
      v38 = -1.0;
    }
    v35->_firstPassPeakScoreHS = v38;
    if (v77)
    {
      v35->_hasFirstPassPeakScoreJS = 1;
      objc_msgSend(v77, "floatValue");
      v40 = v39;
    }
    else
    {
      v35->_hasFirstPassPeakScoreJS = 0;
      v40 = -1.0;
    }
    v35->_firstPassPeakScoreJS = v40;
    if (v76)
    {
      v35->_hasFirstPassTriggerSource = 1;
      v41 = objc_msgSend(v76, "intValue");
    }
    else
    {
      v35->_hasFirstPassTriggerSource = 0;
      v41 = -1;
    }
    v35->_firstPassTriggerSource = v41;
    if (v75)
    {
      v35->_hasRecognizerScoreHS = 1;
      objc_msgSend(v75, "floatValue");
      v43 = v42;
    }
    else
    {
      v35->_hasRecognizerScoreHS = 0;
      v43 = -1.0;
    }
    v35->_recognizerScoreHS = v43;
    if (v74)
    {
      v35->_hasRecognizerScoreJS = 1;
      objc_msgSend(v74, "floatValue");
      v45 = v44;
    }
    else
    {
      v35->_hasRecognizerScoreJS = 0;
      v45 = -1.0;
    }
    v35->_recognizerScoreJS = v45;
    if (v73)
    {
      v35->_hasTriggerScoreHS = 1;
      objc_msgSend(v73, "floatValue");
      v47 = v46;
    }
    else
    {
      v35->_hasTriggerScoreHS = 0;
      v47 = -1.0;
    }
    v35->_triggerScoreHS = v47;
    if (v72)
    {
      v35->_hasTriggerScoreJS = 1;
      objc_msgSend(v72, "floatValue");
      v49 = v48;
    }
    else
    {
      v35->_hasTriggerScoreJS = 0;
      v49 = -1.0;
    }
    v35->_triggerScoreJS = v49;
    if (v71)
    {
      v35->_hasMitigationScore = 1;
      objc_msgSend(v71, "floatValue");
      v51 = v50;
    }
    else
    {
      v35->_hasMitigationScore = 0;
      v51 = -1.0;
    }
    v35->_mitigationScore = v51;
    if (v70)
    {
      v35->_hasInvocationTypeID = 1;
      v52 = objc_msgSend(v70, "intValue");
    }
    else
    {
      v35->_hasInvocationTypeID = 0;
      v52 = -1;
    }
    v35->_invocationTypeID = v52;
    if (v28)
    {
      v35->_hasRepetitionSimilarityScore = 1;
      objc_msgSend(v28, "floatValue");
      v54 = v53;
    }
    else
    {
      v35->_hasRepetitionSimilarityScore = 0;
      v54 = -1.0;
    }
    v35->_repetitionSimilarityScore = v54;
    if (v29)
    {
      v35->_hasTdSpeakerRecognizerCombinedScore = 1;
      objc_msgSend(v29, "floatValue");
      v56 = v55;
    }
    else
    {
      v35->_hasTdSpeakerRecognizerCombinedScore = 0;
      v56 = -1.0;
    }
    v35->_tdSpeakerRecognizerCombinedScore = v56;
    if (v30)
    {
      v35->_hasHwSampleRate = 1;
      objc_msgSend(v30, "floatValue");
      v58 = v57;
    }
    else
    {
      v35->_hasHwSampleRate = 0;
      v58 = -1.0;
    }
    v35->_hwSampleRate = v58;
    objc_storeStrong((id *)&v35->_configVersion, a16);
    if (v31)
    {
      v35->_hasKeywordThresholdHS = 1;
      objc_msgSend(v31, "floatValue");
      v60 = v59;
    }
    else
    {
      v35->_hasKeywordThresholdHS = 0;
      v60 = -1.0;
    }
    v35->_keywordThresholdHS = v60;
    if (v32)
    {
      v35->_hasKeywordThresholdJS = 1;
      objc_msgSend(v32, "floatValue");
      v62 = v61;
    }
    else
    {
      v35->_hasKeywordThresholdJS = 0;
      v62 = -1.0;
    }
    v35->_keywordThresholdJS = v62;
    if (v33)
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdHS = 1;
      objc_msgSend(v33, "floatValue");
      v64 = v63;
    }
    else
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdHS = 0;
      v64 = -1.0;
    }
    v35->_tdSpeakerRecognizerCombinedThresholdHS = v64;
    if (v34)
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdJS = 1;
      objc_msgSend(v34, "floatValue");
      v66 = v65;
    }
    else
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdJS = 0;
      v66 = -1.0;
    }
    v35->_tdSpeakerRecognizerCombinedThresholdJS = v66;
  }

  return v35;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriVoiceTriggerStatistics absoluteTimestamp](self, "absoluteTimestamp");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics firstPassPeakScoreHS](self, "firstPassPeakScoreHS");
  objc_msgSend(v3, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics firstPassPeakScoreJS](self, "firstPassPeakScoreJS");
  objc_msgSend(v4, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriVoiceTriggerStatistics firstPassTriggerSource](self, "firstPassTriggerSource"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics recognizerScoreHS](self, "recognizerScoreHS");
  objc_msgSend(v5, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics recognizerScoreJS](self, "recognizerScoreJS");
  objc_msgSend(v6, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics triggerScoreHS](self, "triggerScoreHS");
  objc_msgSend(v7, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics triggerScoreJS](self, "triggerScoreJS");
  objc_msgSend(v8, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics mitigationScore](self, "mitigationScore");
  objc_msgSend(v9, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriVoiceTriggerStatistics invocationTypeID](self, "invocationTypeID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics repetitionSimilarityScore](self, "repetitionSimilarityScore");
  objc_msgSend(v10, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore");
  objc_msgSend(v11, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics hwSampleRate](self, "hwSampleRate");
  objc_msgSend(v12, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriVoiceTriggerStatistics configVersion](self, "configVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics keywordThresholdHS](self, "keywordThresholdHS");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics keywordThresholdJS](self, "keywordThresholdJS");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdHS](self, "tdSpeakerRecognizerCombinedThresholdHS");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdJS](self, "tdSpeakerRecognizerCombinedThresholdJS");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("BMSiriVoiceTriggerStatistics with absoluteTimestamp: %@, firstPassPeakScoreHS: %@, firstPassPeakScoreJS: %@, firstPassTriggerSource: %@, recognizerScoreHS: %@, recognizerScoreJS: %@, triggerScoreHS: %@, triggerScoreJS: %@, mitigationScore: %@, invocationTypeID: %@, repetitionSimilarityScore: %@, tdSpeakerRecognizerCombinedScore: %@, hwSampleRate: %@, configVersion: %@, keywordThresholdHS: %@, keywordThresholdJS: %@, tdSpeakerRecognizerCombinedThresholdHS: %@, tdSpeakerRecognizerCombinedThresholdJS: %@"), v37, v36, v35, v30, v29, v28, v34, v27, v26, v33, v25, v24, v23, v13, v15, v17,
                  v19,
                  v21);

  return (NSString *)v32;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriVoiceTriggerStatistics *v5;
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
  unint64_t v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  float v25;
  uint64_t v26;
  unint64_t v27;
  float v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  unint64_t v37;
  float v38;
  uint64_t v39;
  unint64_t v40;
  float v41;
  uint64_t v42;
  unint64_t v43;
  float v44;
  uint64_t v45;
  unint64_t v46;
  float v47;
  uint64_t v48;
  unint64_t v49;
  float v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  float v59;
  uint64_t v60;
  unint64_t v61;
  float v62;
  uint64_t v63;
  unint64_t v64;
  float v65;
  uint64_t v66;
  NSString *configVersion;
  uint64_t v68;
  unint64_t v69;
  float v70;
  uint64_t v71;
  unint64_t v72;
  float v73;
  uint64_t v74;
  unint64_t v75;
  float v76;
  uint64_t v77;
  unint64_t v78;
  float v79;
  uint64_t v80;
  uint64_t v81;
  BMSiriVoiceTriggerStatistics *v82;
  objc_super v84;

  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)BMSiriVoiceTriggerStatistics;
  v5 = -[BMEventBase init](&v84, sel_init);
  if (!v5)
    goto LABEL_125;
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
          v5->_hasRaw_absoluteTimestamp = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0.0;
          }
          v81 = 24;
          goto LABEL_121;
        case 2u:
          v5->_hasFirstPassPeakScoreHS = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v25 = *(float *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v25 = 0.0;
          }
          v22 = v25;
          v81 = 64;
          goto LABEL_121;
        case 3u:
          v5->_hasFirstPassPeakScoreJS = 1;
          v26 = *v6;
          v27 = *(_QWORD *)&v4[v26];
          if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v28 = *(float *)(*(_QWORD *)&v4[*v9] + v27);
            *(_QWORD *)&v4[v26] = v27 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v28 = 0.0;
          }
          v22 = v28;
          v81 = 72;
          goto LABEL_121;
        case 4u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasFirstPassTriggerSource = 1;
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
                  LODWORD(v31) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_85:
          v80 = 52;
          goto LABEL_90;
        case 5u:
          v5->_hasRecognizerScoreHS = 1;
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v38 = *(float *)(*(_QWORD *)&v4[*v9] + v37);
            *(_QWORD *)&v4[v36] = v37 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v38 = 0.0;
          }
          v22 = v38;
          v81 = 80;
          goto LABEL_121;
        case 6u:
          v5->_hasRecognizerScoreJS = 1;
          v39 = *v6;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v41 = *(float *)(*(_QWORD *)&v4[*v9] + v40);
            *(_QWORD *)&v4[v39] = v40 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v41 = 0.0;
          }
          v22 = v41;
          v81 = 88;
          goto LABEL_121;
        case 7u:
          v5->_hasTriggerScoreHS = 1;
          v42 = *v6;
          v43 = *(_QWORD *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFFBLL && v43 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v44 = *(float *)(*(_QWORD *)&v4[*v9] + v43);
            *(_QWORD *)&v4[v42] = v43 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v44 = 0.0;
          }
          v22 = v44;
          v81 = 96;
          goto LABEL_121;
        case 8u:
          v5->_hasTriggerScoreJS = 1;
          v45 = *v6;
          v46 = *(_QWORD *)&v4[v45];
          if (v46 <= 0xFFFFFFFFFFFFFFFBLL && v46 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v47 = *(float *)(*(_QWORD *)&v4[*v9] + v46);
            *(_QWORD *)&v4[v45] = v46 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v47 = 0.0;
          }
          v22 = v47;
          v81 = 104;
          goto LABEL_121;
        case 9u:
          v5->_hasMitigationScore = 1;
          v48 = *v6;
          v49 = *(_QWORD *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFFBLL && v49 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v50 = *(float *)(*(_QWORD *)&v4[*v9] + v49);
            *(_QWORD *)&v4[v48] = v49 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v50 = 0.0;
          }
          v22 = v50;
          v81 = 112;
          goto LABEL_121;
        case 0xAu:
          v51 = 0;
          v52 = 0;
          v31 = 0;
          v5->_hasInvocationTypeID = 1;
          break;
        case 0xBu:
          v5->_hasRepetitionSimilarityScore = 1;
          v57 = *v6;
          v58 = *(_QWORD *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFFBLL && v58 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v59 = *(float *)(*(_QWORD *)&v4[*v9] + v58);
            *(_QWORD *)&v4[v57] = v58 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v59 = 0.0;
          }
          v22 = v59;
          v81 = 120;
          goto LABEL_121;
        case 0xCu:
          v5->_hasTdSpeakerRecognizerCombinedScore = 1;
          v60 = *v6;
          v61 = *(_QWORD *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFFBLL && v61 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v62 = *(float *)(*(_QWORD *)&v4[*v9] + v61);
            *(_QWORD *)&v4[v60] = v61 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v62 = 0.0;
          }
          v22 = v62;
          v81 = 128;
          goto LABEL_121;
        case 0xDu:
          v5->_hasHwSampleRate = 1;
          v63 = *v6;
          v64 = *(_QWORD *)&v4[v63];
          if (v64 <= 0xFFFFFFFFFFFFFFFBLL && v64 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v65 = *(float *)(*(_QWORD *)&v4[*v9] + v64);
            *(_QWORD *)&v4[v63] = v64 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v65 = 0.0;
          }
          v22 = v65;
          v81 = 136;
          goto LABEL_121;
        case 0xEu:
          PBReaderReadString();
          v66 = objc_claimAutoreleasedReturnValue();
          configVersion = v5->_configVersion;
          v5->_configVersion = (NSString *)v66;

          continue;
        case 0xFu:
          v5->_hasKeywordThresholdHS = 1;
          v68 = *v6;
          v69 = *(_QWORD *)&v4[v68];
          if (v69 <= 0xFFFFFFFFFFFFFFFBLL && v69 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v70 = *(float *)(*(_QWORD *)&v4[*v9] + v69);
            *(_QWORD *)&v4[v68] = v69 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v70 = 0.0;
          }
          v22 = v70;
          v81 = 152;
          goto LABEL_121;
        case 0x10u:
          v5->_hasKeywordThresholdJS = 1;
          v71 = *v6;
          v72 = *(_QWORD *)&v4[v71];
          if (v72 <= 0xFFFFFFFFFFFFFFFBLL && v72 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v73 = *(float *)(*(_QWORD *)&v4[*v9] + v72);
            *(_QWORD *)&v4[v71] = v72 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v73 = 0.0;
          }
          v22 = v73;
          v81 = 160;
          goto LABEL_121;
        case 0x11u:
          v5->_hasTdSpeakerRecognizerCombinedThresholdHS = 1;
          v74 = *v6;
          v75 = *(_QWORD *)&v4[v74];
          if (v75 <= 0xFFFFFFFFFFFFFFFBLL && v75 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v76 = *(float *)(*(_QWORD *)&v4[*v9] + v75);
            *(_QWORD *)&v4[v74] = v75 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v76 = 0.0;
          }
          v22 = v76;
          v81 = 168;
          goto LABEL_121;
        case 0x12u:
          v5->_hasTdSpeakerRecognizerCombinedThresholdJS = 1;
          v77 = *v6;
          v78 = *(_QWORD *)&v4[v77];
          if (v78 <= 0xFFFFFFFFFFFFFFFBLL && v78 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v79 = *(float *)(*(_QWORD *)&v4[*v9] + v78);
            *(_QWORD *)&v4[v77] = v78 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v79 = 0.0;
          }
          v22 = v79;
          v81 = 176;
LABEL_121:
          *(double *)((char *)&v5->super.super.isa + v81) = v22;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_124;
          continue;
      }
      while (1)
      {
        v53 = *v6;
        v54 = *(_QWORD *)&v4[v53];
        v55 = v54 + 1;
        if (v54 == -1 || v55 > *(_QWORD *)&v4[*v7])
          break;
        v56 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v54);
        *(_QWORD *)&v4[v53] = v55;
        v31 |= (unint64_t)(v56 & 0x7F) << v51;
        if ((v56 & 0x80) == 0)
          goto LABEL_87;
        v51 += 7;
        v17 = v52++ >= 9;
        if (v17)
        {
          LODWORD(v31) = 0;
          goto LABEL_89;
        }
      }
      v4[*v8] = 1;
LABEL_87:
      if (v4[*v8])
        LODWORD(v31) = 0;
LABEL_89:
      v80 = 56;
LABEL_90:
      *(_DWORD *)((char *)&v5->super.super.isa + v80) = v31;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_124:
    v82 = 0;
  else
LABEL_125:
    v82 = v5;

  return v82;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasFirstPassPeakScoreHS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasFirstPassPeakScoreJS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasFirstPassTriggerSource)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRecognizerScoreHS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasRecognizerScoreJS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasTriggerScoreHS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasTriggerScoreJS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasMitigationScore)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasInvocationTypeID)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasRepetitionSimilarityScore)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasTdSpeakerRecognizerCombinedScore)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasHwSampleRate)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_configVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasKeywordThresholdHS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasKeywordThresholdJS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasTdSpeakerRecognizerCombinedThresholdHS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_hasTdSpeakerRecognizerCombinedThresholdJS)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriVoiceTriggerStatistics writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriVoiceTriggerStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  BMSiriVoiceTriggerStatistics *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  id *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  uint64_t v68;
  id *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  id v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  id v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  uint64_t v141;
  id v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  void *v152;
  id v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  id v161;
  id v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  id v175;
  void *v176;
  id *v177;
  id v178;
  id v179;
  id v180;
  void *v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  id v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  id v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  id v208;
  uint64_t v209;
  id v210;
  uint64_t v211;
  id v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  id v216;
  uint64_t v217;
  _QWORD v218[3];

  v218[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v182 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (objc_class *)MEMORY[0x1E0C99D68];
    v8 = v182;
    v9 = [v7 alloc];
    objc_msgSend(v8, "doubleValue");
    v11 = v10;

    v12 = (id)objc_msgSend(v9, "initWithTimeIntervalSince1970:", v11);
LABEL_6:
    v6 = v12;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v6 = 0;
        v47 = 0;
        goto LABEL_144;
      }
      v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v94 = *MEMORY[0x1E0D025B8];
      v217 = *MEMORY[0x1E0CB2D50];
      v180 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v218[0] = v180;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v218, &v217, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v94, 2, v14);
      v6 = 0;
      v47 = 0;
      *a4 = v95;
      goto LABEL_143;
    }
    v12 = v182;
    goto LABEL_6;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v13, "dateFromString:", v182);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPassPeakScoreHS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v180 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v180 = v14;
LABEL_12:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPassPeakScoreJS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v179 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v179 = v15;
LABEL_15:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v176 = v16;
        v17 = 0;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v176 = v16;
        v17 = v16;
LABEL_18:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recognizerScoreHS"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = v17;
        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v19 = 0;
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
LABEL_21:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recognizerScoreJS"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v171 = v20;
            v175 = 0;
            goto LABEL_24;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v171 = v20;
            v175 = v20;
LABEL_24:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("triggerScoreHS"));
            v21 = objc_claimAutoreleasedReturnValue();
            v173 = (void *)v21;
            if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v174 = 0;
              goto LABEL_27;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v174 = v22;
LABEL_27:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("triggerScoreJS"));
              v23 = objc_claimAutoreleasedReturnValue();
              v170 = (void *)v23;
              if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v172 = 0;
                goto LABEL_30;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v172 = v24;
LABEL_30:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mitigationScore"));
                v25 = objc_claimAutoreleasedReturnValue();
                v168 = (void *)v25;
                if (!v25 || (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v169 = 0;
                  goto LABEL_33;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v169 = v26;
LABEL_33:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("invocationTypeID"));
                  v27 = objc_claimAutoreleasedReturnValue();
                  v164 = (void *)v27;
                  if (!v27 || (v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v165 = 0;
                    goto LABEL_36;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v165 = v28;
LABEL_36:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("repetitionSimilarityScore"));
                    v29 = objc_claimAutoreleasedReturnValue();
                    v159 = (void *)v29;
                    if (!v29 || (v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v160 = 0;
                      goto LABEL_39;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v160 = v30;
LABEL_39:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedScore"));
                      v31 = objc_claimAutoreleasedReturnValue();
                      v157 = (void *)v31;
                      if (!v31 || (v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v158 = 0;
                        goto LABEL_42;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v158 = v32;
LABEL_42:
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hwSampleRate"));
                        v33 = objc_claimAutoreleasedReturnValue();
                        v155 = (void *)v33;
                        if (!v33 || (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v156 = 0;
                          goto LABEL_45;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v156 = v34;
LABEL_45:
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("configVersion"));
                          v35 = objc_claimAutoreleasedReturnValue();
                          v152 = (void *)v35;
                          if (!v35 || (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v153 = 0;
                            goto LABEL_48;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v153 = v36;
LABEL_48:
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keywordThresholdHS"));
                            v37 = objc_claimAutoreleasedReturnValue();
                            v166 = v18;
                            v149 = (void *)v37;
                            if (!v37 || (v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v151 = 0;
                              goto LABEL_51;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v151 = v38;
LABEL_51:
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keywordThresholdJS"));
                              v39 = objc_claimAutoreleasedReturnValue();
                              v148 = (void *)v39;
                              if (!v39 || (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v150 = 0;
                                goto LABEL_54;
                              }
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v150 = v40;
LABEL_54:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedThresholdHS"));
                                v41 = (id)objc_claimAutoreleasedReturnValue();
                                v161 = v41;
                                if (v41)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v42 = v6;
                                    v41 = 0;
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!a4)
                                      {
                                        v41 = 0;
                                        v47 = 0;
                                        v63 = v171;
                                        goto LABEL_127;
                                      }
                                      v42 = v6;
                                      v140 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v141 = *MEMORY[0x1E0D025B8];
                                      v185 = *MEMORY[0x1E0CB2D50];
                                      v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tdSpeakerRecognizerCombinedThresholdHS"));
                                      v186 = v115;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1);
                                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                                      v142 = (id)objc_msgSend(v140, "initWithDomain:code:userInfo:", v141, 2, v114);
                                      v47 = 0;
                                      v41 = 0;
                                      *a4 = v142;
                                      goto LABEL_126;
                                    }
                                    v42 = v6;
                                    v41 = v41;
                                  }
                                }
                                else
                                {
                                  v42 = v6;
                                }
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedThresholdJS"));
                                v114 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v114 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (a4)
                                    {
                                      v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v146 = *MEMORY[0x1E0D025B8];
                                      v183 = *MEMORY[0x1E0CB2D50];
                                      v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tdSpeakerRecognizerCombinedThresholdJS"));
                                      v184 = v143;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
                                      v144 = (void *)objc_claimAutoreleasedReturnValue();
                                      *a4 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v146, 2, v144);

                                    }
                                    v115 = 0;
                                    v47 = 0;
                                    goto LABEL_126;
                                  }
                                  v115 = v114;
                                }
                                else
                                {
                                  v115 = 0;
                                }
                                v47 = objc_retain(-[BMSiriVoiceTriggerStatistics initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:](self, "initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:", v42, v180, v179, v178, v19, v175, v174, v172, v169, v165, v160, v158,
                                          v156,
                                          v153,
                                          v151,
                                          v150,
                                          v41,
                                          v115));
                                self = v47;
LABEL_126:
                                v63 = v171;

                                v6 = v42;
                                v18 = v166;
LABEL_127:
                                v116 = v161;
LABEL_128:

                                v16 = v176;
LABEL_129:

LABEL_130:
LABEL_131:

LABEL_132:
LABEL_133:

LABEL_134:
LABEL_135:

LABEL_136:
LABEL_137:

                                goto LABEL_138;
                              }
                              if (a4)
                              {
                                v163 = v19;
                                v132 = v14;
                                v133 = v15;
                                v134 = v6;
                                v135 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v136 = *MEMORY[0x1E0D025B8];
                                v187 = *MEMORY[0x1E0CB2D50];
                                v137 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("keywordThresholdJS"));
                                v188 = v137;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
                                v116 = (void *)objc_claimAutoreleasedReturnValue();
                                v138 = v135;
                                v6 = v134;
                                v41 = (id)v137;
                                v15 = v133;
                                v14 = v132;
                                v19 = v163;
                                v139 = (id)objc_msgSend(v138, "initWithDomain:code:userInfo:", v136, 2, v116);
                                v47 = 0;
                                v150 = 0;
                                *a4 = v139;
                                v63 = v171;
                                goto LABEL_128;
                              }
                              v150 = 0;
                              v47 = 0;
LABEL_178:
                              v16 = v176;
                              v63 = v171;
                              goto LABEL_129;
                            }
                            if (a4)
                            {
                              v126 = v6;
                              v127 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v128 = *MEMORY[0x1E0D025B8];
                              v189 = *MEMORY[0x1E0CB2D50];
                              v150 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("keywordThresholdHS"));
                              v190 = v150;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1);
                              v129 = objc_claimAutoreleasedReturnValue();
                              v130 = v127;
                              v6 = v126;
                              v148 = (void *)v129;
                              v131 = (id)objc_msgSend(v130, "initWithDomain:code:userInfo:", v128, 2);
                              v47 = 0;
                              v151 = 0;
                              *a4 = v131;
                              goto LABEL_178;
                            }
                            v151 = 0;
                            v47 = 0;
                            v16 = v176;
LABEL_176:
                            v63 = v171;
                            goto LABEL_130;
                          }
                          if (a4)
                          {
                            v154 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v124 = *MEMORY[0x1E0D025B8];
                            v191 = *MEMORY[0x1E0CB2D50];
                            v151 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("configVersion"));
                            v192 = v151;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
                            v149 = (void *)objc_claimAutoreleasedReturnValue();
                            v125 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v124, 2);
                            v47 = 0;
                            v153 = 0;
                            *a4 = v125;
                            v16 = v176;
                            goto LABEL_176;
                          }
                          v153 = 0;
                          v47 = 0;
                          v16 = v176;
LABEL_174:
                          v63 = v171;
                          goto LABEL_131;
                        }
                        if (a4)
                        {
                          v118 = v6;
                          v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v120 = *MEMORY[0x1E0D025B8];
                          v193 = *MEMORY[0x1E0CB2D50];
                          v153 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hwSampleRate"));
                          v194 = v153;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
                          v121 = objc_claimAutoreleasedReturnValue();
                          v122 = v119;
                          v6 = v118;
                          v152 = (void *)v121;
                          v123 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v120, 2);
                          v47 = 0;
                          v156 = 0;
                          *a4 = v123;
                          v16 = v176;
                          goto LABEL_174;
                        }
                        v156 = 0;
                        v47 = 0;
LABEL_172:
                        v16 = v176;
                        v63 = v171;
                        goto LABEL_132;
                      }
                      if (a4)
                      {
                        v108 = v6;
                        v109 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v110 = *MEMORY[0x1E0D025B8];
                        v195 = *MEMORY[0x1E0CB2D50];
                        v156 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tdSpeakerRecognizerCombinedScore"));
                        v196 = v156;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
                        v111 = objc_claimAutoreleasedReturnValue();
                        v112 = v109;
                        v6 = v108;
                        v155 = (void *)v111;
                        v113 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v110, 2);
                        v47 = 0;
                        v158 = 0;
                        *a4 = v113;
                        goto LABEL_172;
                      }
                      v158 = 0;
                      v47 = 0;
LABEL_167:
                      v16 = v176;
                      v63 = v171;
                      goto LABEL_133;
                    }
                    if (a4)
                    {
                      v102 = v6;
                      v103 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v104 = *MEMORY[0x1E0D025B8];
                      v197 = *MEMORY[0x1E0CB2D50];
                      v158 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("repetitionSimilarityScore"));
                      v198 = v158;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1);
                      v105 = objc_claimAutoreleasedReturnValue();
                      v106 = v103;
                      v6 = v102;
                      v157 = (void *)v105;
                      v107 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v104, 2);
                      v47 = 0;
                      v160 = 0;
                      *a4 = v107;
                      goto LABEL_167;
                    }
                    v160 = 0;
                    v47 = 0;
LABEL_163:
                    v16 = v176;
                    v63 = v171;
                    goto LABEL_134;
                  }
                  if (a4)
                  {
                    v96 = v6;
                    v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v98 = *MEMORY[0x1E0D025B8];
                    v199 = *MEMORY[0x1E0CB2D50];
                    v160 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("invocationTypeID"));
                    v200 = v160;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v200, &v199, 1);
                    v99 = objc_claimAutoreleasedReturnValue();
                    v100 = v97;
                    v6 = v96;
                    v159 = (void *)v99;
                    v101 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v98, 2);
                    v47 = 0;
                    v165 = 0;
                    *a4 = v101;
                    goto LABEL_163;
                  }
                  v165 = 0;
                  v47 = 0;
LABEL_159:
                  v16 = v176;
                  v63 = v171;
                  goto LABEL_135;
                }
                if (a4)
                {
                  v87 = v6;
                  v88 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v89 = *MEMORY[0x1E0D025B8];
                  v201 = *MEMORY[0x1E0CB2D50];
                  v165 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mitigationScore"));
                  v202 = v165;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1);
                  v90 = objc_claimAutoreleasedReturnValue();
                  v91 = v88;
                  v6 = v87;
                  v164 = (void *)v90;
                  v92 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v89, 2);
                  v47 = 0;
                  v169 = 0;
                  *a4 = v92;
                  goto LABEL_159;
                }
                v169 = 0;
                v47 = 0;
LABEL_154:
                v16 = v176;
                v63 = v171;
                goto LABEL_136;
              }
              if (a4)
              {
                v81 = v6;
                v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v83 = *MEMORY[0x1E0D025B8];
                v203 = *MEMORY[0x1E0CB2D50];
                v169 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("triggerScoreJS"));
                v204 = v169;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
                v84 = objc_claimAutoreleasedReturnValue();
                v85 = v82;
                v6 = v81;
                v168 = (void *)v84;
                v86 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v83, 2);
                v47 = 0;
                v172 = 0;
                *a4 = v86;
                goto LABEL_154;
              }
              v172 = 0;
              v47 = 0;
LABEL_148:
              v16 = v176;
              v63 = v171;
              goto LABEL_137;
            }
            if (a4)
            {
              v75 = v6;
              v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v77 = *MEMORY[0x1E0D025B8];
              v205 = *MEMORY[0x1E0CB2D50];
              v172 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("triggerScoreHS"));
              v206 = v172;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v206, &v205, 1);
              v78 = objc_claimAutoreleasedReturnValue();
              v79 = v76;
              v6 = v75;
              v170 = (void *)v78;
              v80 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v77, 2);
              v47 = 0;
              v174 = 0;
              *a4 = v80;
              goto LABEL_148;
            }
            v174 = 0;
            v47 = 0;
            v16 = v176;
            v63 = v171;
LABEL_138:

            goto LABEL_139;
          }
          if (a4)
          {
            v162 = v19;
            v66 = v6;
            v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v68 = *MEMORY[0x1E0D025B8];
            v207 = *MEMORY[0x1E0CB2D50];
            v167 = v18;
            v69 = a4;
            v70 = objc_alloc(MEMORY[0x1E0CB3940]);
            v145 = objc_opt_class();
            v71 = v70;
            v63 = v20;
            v174 = (id)objc_msgSend(v71, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v145, CFSTR("recognizerScoreJS"));
            v208 = v174;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v208, &v207, 1);
            v72 = objc_claimAutoreleasedReturnValue();
            v73 = v67;
            v6 = v66;
            v19 = v162;
            v173 = (void *)v72;
            v74 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v68, 2);
            v47 = 0;
            v175 = 0;
            *v69 = v74;
            v18 = v167;
            v16 = v176;
            goto LABEL_138;
          }
          v175 = 0;
          v47 = 0;
          v16 = v176;
          v63 = v20;
LABEL_139:

          goto LABEL_140;
        }
        if (a4)
        {
          v59 = v6;
          v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v209 = *MEMORY[0x1E0CB2D50];
          v62 = a4;
          v175 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("recognizerScoreHS"));
          v210 = v175;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v210, &v209, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v60;
          v6 = v59;
          v65 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v61, 2, v63);
          v47 = 0;
          *v62 = v65;
          v19 = 0;
          v16 = v176;
          goto LABEL_139;
        }
        v19 = 0;
        v47 = 0;
        v16 = v176;
LABEL_140:

        v51 = v178;
        goto LABEL_141;
      }
      if (a4)
      {
        v177 = a4;
        v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v56 = v6;
        v57 = *MEMORY[0x1E0D025B8];
        v211 = *MEMORY[0x1E0CB2D50];
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("firstPassTriggerSource"));
        v212 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v212, &v211, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57;
        v6 = v56;
        v47 = 0;
        v178 = 0;
        *v177 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v58, 2, v18);
        goto LABEL_140;
      }
      v51 = 0;
      v47 = 0;
LABEL_141:

      goto LABEL_142;
    }
    if (a4)
    {
      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v49 = v6;
      v50 = *MEMORY[0x1E0D025B8];
      v213 = *MEMORY[0x1E0CB2D50];
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("firstPassPeakScoreJS"));
      v214 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v48;
      v16 = (void *)v52;
      v54 = v50;
      v6 = v49;
      v47 = 0;
      v179 = 0;
      *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v52);
      goto LABEL_141;
    }
    v179 = 0;
    v47 = 0;
LABEL_142:

    goto LABEL_143;
  }
  if (a4)
  {
    v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v44 = v6;
    v45 = *MEMORY[0x1E0D025B8];
    v215 = *MEMORY[0x1E0CB2D50];
    v179 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("firstPassPeakScoreHS"));
    v216 = v179;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v216, &v215, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    v6 = v44;
    v47 = 0;
    v180 = 0;
    *a4 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v46, 2, v15);
    goto LABEL_142;
  }
  v180 = 0;
  v47 = 0;
LABEL_143:

LABEL_144:
  return v47;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  uint64_t v63;
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
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _QWORD v91[18];
  _QWORD v92[20];

  v92[18] = *MEMORY[0x1E0C80C00];
  -[BMSiriVoiceTriggerStatistics absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  if (!-[BMSiriVoiceTriggerStatistics hasFirstPassPeakScoreHS](self, "hasFirstPassPeakScoreHS")
    || (-[BMSiriVoiceTriggerStatistics firstPassPeakScoreHS](self, "firstPassPeakScoreHS"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics firstPassPeakScoreHS](self, "firstPassPeakScoreHS");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics firstPassPeakScoreHS](self, "firstPassPeakScoreHS");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasFirstPassPeakScoreJS](self, "hasFirstPassPeakScoreJS")
    || (-[BMSiriVoiceTriggerStatistics firstPassPeakScoreJS](self, "firstPassPeakScoreJS"), fabs(v10) == INFINITY))
  {
    v12 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics firstPassPeakScoreJS](self, "firstPassPeakScoreJS");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics firstPassPeakScoreJS](self, "firstPassPeakScoreJS");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriVoiceTriggerStatistics hasFirstPassTriggerSource](self, "hasFirstPassTriggerSource"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriVoiceTriggerStatistics firstPassTriggerSource](self, "firstPassTriggerSource"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (!-[BMSiriVoiceTriggerStatistics hasRecognizerScoreHS](self, "hasRecognizerScoreHS")
    || (-[BMSiriVoiceTriggerStatistics recognizerScoreHS](self, "recognizerScoreHS"), fabs(v14) == INFINITY))
  {
    v16 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics recognizerScoreHS](self, "recognizerScoreHS");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics recognizerScoreHS](self, "recognizerScoreHS");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasRecognizerScoreJS](self, "hasRecognizerScoreJS")
    || (-[BMSiriVoiceTriggerStatistics recognizerScoreJS](self, "recognizerScoreJS"), fabs(v17) == INFINITY))
  {
    v19 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics recognizerScoreJS](self, "recognizerScoreJS");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics recognizerScoreJS](self, "recognizerScoreJS");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasTriggerScoreHS](self, "hasTriggerScoreHS")
    || (-[BMSiriVoiceTriggerStatistics triggerScoreHS](self, "triggerScoreHS"), fabs(v20) == INFINITY))
  {
    v22 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics triggerScoreHS](self, "triggerScoreHS");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics triggerScoreHS](self, "triggerScoreHS");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasTriggerScoreJS](self, "hasTriggerScoreJS")
    || (-[BMSiriVoiceTriggerStatistics triggerScoreJS](self, "triggerScoreJS"), fabs(v23) == INFINITY))
  {
    v90 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics triggerScoreJS](self, "triggerScoreJS");
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics triggerScoreJS](self, "triggerScoreJS");
    objc_msgSend(v24, "numberWithDouble:");
    v90 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasMitigationScore](self, "hasMitigationScore")
    || (-[BMSiriVoiceTriggerStatistics mitigationScore](self, "mitigationScore"), fabs(v25) == INFINITY))
  {
    v89 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics mitigationScore](self, "mitigationScore");
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics mitigationScore](self, "mitigationScore");
    objc_msgSend(v26, "numberWithDouble:");
    v89 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMSiriVoiceTriggerStatistics hasInvocationTypeID](self, "hasInvocationTypeID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriVoiceTriggerStatistics invocationTypeID](self, "invocationTypeID"));
    v88 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v88 = 0;
  }
  if (!-[BMSiriVoiceTriggerStatistics hasRepetitionSimilarityScore](self, "hasRepetitionSimilarityScore")
    || (-[BMSiriVoiceTriggerStatistics repetitionSimilarityScore](self, "repetitionSimilarityScore"),
        fabs(v27) == INFINITY))
  {
    v87 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics repetitionSimilarityScore](self, "repetitionSimilarityScore");
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics repetitionSimilarityScore](self, "repetitionSimilarityScore");
    objc_msgSend(v28, "numberWithDouble:");
    v87 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedScore](self, "hasTdSpeakerRecognizerCombinedScore")
    || (-[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore"),
        fabs(v29) == INFINITY))
  {
    v86 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore");
    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore");
    objc_msgSend(v30, "numberWithDouble:");
    v86 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasHwSampleRate](self, "hasHwSampleRate")
    || (-[BMSiriVoiceTriggerStatistics hwSampleRate](self, "hwSampleRate"), fabs(v31) == INFINITY))
  {
    v85 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics hwSampleRate](self, "hwSampleRate");
    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics hwSampleRate](self, "hwSampleRate");
    objc_msgSend(v32, "numberWithDouble:");
    v85 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[BMSiriVoiceTriggerStatistics configVersion](self, "configVersion");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMSiriVoiceTriggerStatistics hasKeywordThresholdHS](self, "hasKeywordThresholdHS")
    || (-[BMSiriVoiceTriggerStatistics keywordThresholdHS](self, "keywordThresholdHS"), fabs(v33) == INFINITY))
  {
    v83 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics keywordThresholdHS](self, "keywordThresholdHS");
    v34 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics keywordThresholdHS](self, "keywordThresholdHS");
    objc_msgSend(v34, "numberWithDouble:");
    v83 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasKeywordThresholdJS](self, "hasKeywordThresholdJS")
    || (-[BMSiriVoiceTriggerStatistics keywordThresholdJS](self, "keywordThresholdJS"), fabs(v35) == INFINITY))
  {
    v82 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics keywordThresholdJS](self, "keywordThresholdJS");
    v36 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics keywordThresholdJS](self, "keywordThresholdJS");
    objc_msgSend(v36, "numberWithDouble:");
    v82 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdHS](self, "hasTdSpeakerRecognizerCombinedThresholdHS")|| (-[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdHS](self, "tdSpeakerRecognizerCombinedThresholdHS"), fabs(v37) == INFINITY))
  {
    v81 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdHS](self, "tdSpeakerRecognizerCombinedThresholdHS");
    v38 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdHS](self, "tdSpeakerRecognizerCombinedThresholdHS");
    objc_msgSend(v38, "numberWithDouble:");
    v81 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdJS](self, "hasTdSpeakerRecognizerCombinedThresholdJS")|| (-[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdJS](self, "tdSpeakerRecognizerCombinedThresholdJS"), fabs(v39) == INFINITY))
  {
    v41 = 0;
  }
  else
  {
    -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdJS](self, "tdSpeakerRecognizerCombinedThresholdJS");
    v40 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdJS](self, "tdSpeakerRecognizerCombinedThresholdJS");
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (id)objc_claimAutoreleasedReturnValue();

  }
  v91[0] = CFSTR("absoluteTimestamp");
  v42 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v74 = (void *)v42;
  v92[0] = v42;
  v91[1] = CFSTR("firstPassPeakScoreHS");
  v43 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v73 = (void *)v43;
  v92[1] = v43;
  v91[2] = CFSTR("firstPassPeakScoreJS");
  v44 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v44 = objc_claimAutoreleasedReturnValue();
  }
  v72 = (void *)v44;
  v92[2] = v44;
  v91[3] = CFSTR("firstPassTriggerSource");
  v45 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
  }
  v71 = (void *)v45;
  v92[3] = v45;
  v91[4] = CFSTR("recognizerScoreHS");
  v46 = (uint64_t)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v46 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v46;
  v92[4] = v46;
  v91[5] = CFSTR("recognizerScoreJS");
  v47 = (uint64_t)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v69 = (void *)v47;
  v92[5] = v47;
  v91[6] = CFSTR("triggerScoreHS");
  v48 = (uint64_t)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v48 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v48;
  v92[6] = v48;
  v91[7] = CFSTR("triggerScoreJS");
  v49 = (uint64_t)v90;
  if (!v90)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v79 = v9;
  v92[7] = v49;
  v91[8] = CFSTR("mitigationScore");
  v50 = (uint64_t)v89;
  if (!v89)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v50 = objc_claimAutoreleasedReturnValue();
  }
  v77 = v19;
  v92[8] = v50;
  v91[9] = CFSTR("invocationTypeID");
  v51 = (uint64_t)v88;
  if (!v88)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v76 = v22;
  v92[9] = v51;
  v91[10] = CFSTR("repetitionSimilarityScore");
  v52 = (uint64_t)v87;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52 = objc_claimAutoreleasedReturnValue();
  }
  v80 = v6;
  v63 = v52;
  v92[10] = v52;
  v91[11] = CFSTR("tdSpeakerRecognizerCombinedScore");
  v53 = v86;
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v78 = v13;
  v92[11] = v53;
  v91[12] = CFSTR("hwSampleRate");
  v54 = v85;
  if (!v85)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v65 = (void *)v51;
  v67 = (void *)v49;
  v92[12] = v54;
  v91[13] = CFSTR("configVersion");
  v55 = v84;
  if (!v84)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v66 = (void *)v50;
  v56 = v12;
  v92[13] = v55;
  v91[14] = CFSTR("keywordThresholdHS");
  v57 = v83;
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v58 = v16;
  v92[14] = v57;
  v91[15] = CFSTR("keywordThresholdJS");
  v59 = v82;
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v92[15] = v59;
  v91[16] = CFSTR("tdSpeakerRecognizerCombinedThresholdHS");
  v60 = v81;
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v92[16] = v60;
  v91[17] = CFSTR("tdSpeakerRecognizerCombinedThresholdJS");
  v61 = v41;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v92[17] = v61;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 18, v63);
  v75 = (id)objc_claimAutoreleasedReturnValue();
  if (!v41)

  if (!v81)
  if (!v82)

  if (!v83)
  if (!v84)

  if (!v85)
  if (!v86)

  if (!v87)
  if (!v88)

  if (!v89)
  if (v90)
  {
    if (v76)
      goto LABEL_124;
  }
  else
  {

    if (v76)
    {
LABEL_124:
      if (v77)
        goto LABEL_125;
      goto LABEL_133;
    }
  }

  if (v77)
  {
LABEL_125:
    if (v58)
      goto LABEL_126;
    goto LABEL_134;
  }
LABEL_133:

  if (v58)
  {
LABEL_126:
    if (v78)
      goto LABEL_127;
    goto LABEL_135;
  }
LABEL_134:

  if (v78)
  {
LABEL_127:
    if (v56)
      goto LABEL_128;
    goto LABEL_136;
  }
LABEL_135:

  if (v56)
  {
LABEL_128:
    if (v79)
      goto LABEL_129;
LABEL_137:

    if (v80)
      goto LABEL_130;
LABEL_138:

    goto LABEL_130;
  }
LABEL_136:

  if (!v79)
    goto LABEL_137;
LABEL_129:
  if (!v80)
    goto LABEL_138;
LABEL_130:

  return v75;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
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
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
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

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriVoiceTriggerStatistics absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriVoiceTriggerStatistics absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasFirstPassPeakScoreHS](self, "hasFirstPassPeakScoreHS")
      || objc_msgSend(v5, "hasFirstPassPeakScoreHS"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasFirstPassPeakScoreHS](self, "hasFirstPassPeakScoreHS"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasFirstPassPeakScoreHS"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics firstPassPeakScoreHS](self, "firstPassPeakScoreHS");
      v14 = v13;
      objc_msgSend(v5, "firstPassPeakScoreHS");
      if (v14 != v15)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasFirstPassPeakScoreJS](self, "hasFirstPassPeakScoreJS")
      || objc_msgSend(v5, "hasFirstPassPeakScoreJS"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasFirstPassPeakScoreJS](self, "hasFirstPassPeakScoreJS"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasFirstPassPeakScoreJS"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics firstPassPeakScoreJS](self, "firstPassPeakScoreJS");
      v17 = v16;
      objc_msgSend(v5, "firstPassPeakScoreJS");
      if (v17 != v18)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasFirstPassTriggerSource](self, "hasFirstPassTriggerSource")
      || objc_msgSend(v5, "hasFirstPassTriggerSource"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasFirstPassTriggerSource](self, "hasFirstPassTriggerSource"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasFirstPassTriggerSource"))
        goto LABEL_91;
      v19 = -[BMSiriVoiceTriggerStatistics firstPassTriggerSource](self, "firstPassTriggerSource");
      if (v19 != objc_msgSend(v5, "firstPassTriggerSource"))
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasRecognizerScoreHS](self, "hasRecognizerScoreHS")
      || objc_msgSend(v5, "hasRecognizerScoreHS"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasRecognizerScoreHS](self, "hasRecognizerScoreHS"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasRecognizerScoreHS"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics recognizerScoreHS](self, "recognizerScoreHS");
      v21 = v20;
      objc_msgSend(v5, "recognizerScoreHS");
      if (v21 != v22)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasRecognizerScoreJS](self, "hasRecognizerScoreJS")
      || objc_msgSend(v5, "hasRecognizerScoreJS"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasRecognizerScoreJS](self, "hasRecognizerScoreJS"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasRecognizerScoreJS"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics recognizerScoreJS](self, "recognizerScoreJS");
      v24 = v23;
      objc_msgSend(v5, "recognizerScoreJS");
      if (v24 != v25)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasTriggerScoreHS](self, "hasTriggerScoreHS")
      || objc_msgSend(v5, "hasTriggerScoreHS"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasTriggerScoreHS](self, "hasTriggerScoreHS"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasTriggerScoreHS"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics triggerScoreHS](self, "triggerScoreHS");
      v27 = v26;
      objc_msgSend(v5, "triggerScoreHS");
      if (v27 != v28)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasTriggerScoreJS](self, "hasTriggerScoreJS")
      || objc_msgSend(v5, "hasTriggerScoreJS"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasTriggerScoreJS](self, "hasTriggerScoreJS"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasTriggerScoreJS"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics triggerScoreJS](self, "triggerScoreJS");
      v30 = v29;
      objc_msgSend(v5, "triggerScoreJS");
      if (v30 != v31)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasMitigationScore](self, "hasMitigationScore")
      || objc_msgSend(v5, "hasMitigationScore"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasMitigationScore](self, "hasMitigationScore"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasMitigationScore"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics mitigationScore](self, "mitigationScore");
      v33 = v32;
      objc_msgSend(v5, "mitigationScore");
      if (v33 != v34)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasInvocationTypeID](self, "hasInvocationTypeID")
      || objc_msgSend(v5, "hasInvocationTypeID"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasInvocationTypeID](self, "hasInvocationTypeID"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasInvocationTypeID"))
        goto LABEL_91;
      v35 = -[BMSiriVoiceTriggerStatistics invocationTypeID](self, "invocationTypeID");
      if (v35 != objc_msgSend(v5, "invocationTypeID"))
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasRepetitionSimilarityScore](self, "hasRepetitionSimilarityScore")
      || objc_msgSend(v5, "hasRepetitionSimilarityScore"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasRepetitionSimilarityScore](self, "hasRepetitionSimilarityScore"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasRepetitionSimilarityScore"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics repetitionSimilarityScore](self, "repetitionSimilarityScore");
      v37 = v36;
      objc_msgSend(v5, "repetitionSimilarityScore");
      if (v37 != v38)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedScore](self, "hasTdSpeakerRecognizerCombinedScore")|| objc_msgSend(v5, "hasTdSpeakerRecognizerCombinedScore"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedScore](self, "hasTdSpeakerRecognizerCombinedScore"))goto LABEL_91;
      if (!objc_msgSend(v5, "hasTdSpeakerRecognizerCombinedScore"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore");
      v40 = v39;
      objc_msgSend(v5, "tdSpeakerRecognizerCombinedScore");
      if (v40 != v41)
        goto LABEL_91;
    }
    if (-[BMSiriVoiceTriggerStatistics hasHwSampleRate](self, "hasHwSampleRate")
      || objc_msgSend(v5, "hasHwSampleRate"))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasHwSampleRate](self, "hasHwSampleRate"))
        goto LABEL_91;
      if (!objc_msgSend(v5, "hasHwSampleRate"))
        goto LABEL_91;
      -[BMSiriVoiceTriggerStatistics hwSampleRate](self, "hwSampleRate");
      v43 = v42;
      objc_msgSend(v5, "hwSampleRate");
      if (v43 != v44)
        goto LABEL_91;
    }
    -[BMSiriVoiceTriggerStatistics configVersion](self, "configVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configVersion");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v45 == (void *)v46)
    {

    }
    else
    {
      v47 = (void *)v46;
      -[BMSiriVoiceTriggerStatistics configVersion](self, "configVersion");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configVersion");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_91;
    }
    if (!-[BMSiriVoiceTriggerStatistics hasKeywordThresholdHS](self, "hasKeywordThresholdHS")
      && !objc_msgSend(v5, "hasKeywordThresholdHS")
      || -[BMSiriVoiceTriggerStatistics hasKeywordThresholdHS](self, "hasKeywordThresholdHS")
      && objc_msgSend(v5, "hasKeywordThresholdHS")
      && (-[BMSiriVoiceTriggerStatistics keywordThresholdHS](self, "keywordThresholdHS"),
          v52 = v51,
          objc_msgSend(v5, "keywordThresholdHS"),
          v52 == v53))
    {
      if (!-[BMSiriVoiceTriggerStatistics hasKeywordThresholdJS](self, "hasKeywordThresholdJS")
        && !objc_msgSend(v5, "hasKeywordThresholdJS")
        || -[BMSiriVoiceTriggerStatistics hasKeywordThresholdJS](self, "hasKeywordThresholdJS")
        && objc_msgSend(v5, "hasKeywordThresholdJS")
        && (-[BMSiriVoiceTriggerStatistics keywordThresholdJS](self, "keywordThresholdJS"),
            v55 = v54,
            objc_msgSend(v5, "keywordThresholdJS"),
            v55 == v56))
      {
        if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdHS](self, "hasTdSpeakerRecognizerCombinedThresholdHS")&& !objc_msgSend(v5, "hasTdSpeakerRecognizerCombinedThresholdHS")|| -[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdHS](self, "hasTdSpeakerRecognizerCombinedThresholdHS")&& objc_msgSend(v5, "hasTdSpeakerRecognizerCombinedThresholdHS")&& (-[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdHS](self, "tdSpeakerRecognizerCombinedThresholdHS"), v58 = v57, objc_msgSend(v5, "tdSpeakerRecognizerCombinedThresholdHS"), v58 == v59))
        {
          if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdJS](self, "hasTdSpeakerRecognizerCombinedThresholdJS")&& !objc_msgSend(v5, "hasTdSpeakerRecognizerCombinedThresholdJS"))
          {
            v12 = 1;
            goto LABEL_92;
          }
          if (-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdJS](self, "hasTdSpeakerRecognizerCombinedThresholdJS")&& objc_msgSend(v5, "hasTdSpeakerRecognizerCombinedThresholdJS"))
          {
            -[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdJS](self, "tdSpeakerRecognizerCombinedThresholdJS");
            v61 = v60;
            objc_msgSend(v5, "tdSpeakerRecognizerCombinedThresholdJS");
            v12 = v61 == v62;
LABEL_92:

            goto LABEL_93;
          }
        }
      }
    }
LABEL_91:
    v12 = 0;
    goto LABEL_92;
  }
  v12 = 0;
LABEL_93:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)firstPassPeakScoreHS
{
  return self->_firstPassPeakScoreHS;
}

- (BOOL)hasFirstPassPeakScoreHS
{
  return self->_hasFirstPassPeakScoreHS;
}

- (void)setHasFirstPassPeakScoreHS:(BOOL)a3
{
  self->_hasFirstPassPeakScoreHS = a3;
}

- (double)firstPassPeakScoreJS
{
  return self->_firstPassPeakScoreJS;
}

- (BOOL)hasFirstPassPeakScoreJS
{
  return self->_hasFirstPassPeakScoreJS;
}

- (void)setHasFirstPassPeakScoreJS:(BOOL)a3
{
  self->_hasFirstPassPeakScoreJS = a3;
}

- (int)firstPassTriggerSource
{
  return self->_firstPassTriggerSource;
}

- (BOOL)hasFirstPassTriggerSource
{
  return self->_hasFirstPassTriggerSource;
}

- (void)setHasFirstPassTriggerSource:(BOOL)a3
{
  self->_hasFirstPassTriggerSource = a3;
}

- (double)recognizerScoreHS
{
  return self->_recognizerScoreHS;
}

- (BOOL)hasRecognizerScoreHS
{
  return self->_hasRecognizerScoreHS;
}

- (void)setHasRecognizerScoreHS:(BOOL)a3
{
  self->_hasRecognizerScoreHS = a3;
}

- (double)recognizerScoreJS
{
  return self->_recognizerScoreJS;
}

- (BOOL)hasRecognizerScoreJS
{
  return self->_hasRecognizerScoreJS;
}

- (void)setHasRecognizerScoreJS:(BOOL)a3
{
  self->_hasRecognizerScoreJS = a3;
}

- (double)triggerScoreHS
{
  return self->_triggerScoreHS;
}

- (BOOL)hasTriggerScoreHS
{
  return self->_hasTriggerScoreHS;
}

- (void)setHasTriggerScoreHS:(BOOL)a3
{
  self->_hasTriggerScoreHS = a3;
}

- (double)triggerScoreJS
{
  return self->_triggerScoreJS;
}

- (BOOL)hasTriggerScoreJS
{
  return self->_hasTriggerScoreJS;
}

- (void)setHasTriggerScoreJS:(BOOL)a3
{
  self->_hasTriggerScoreJS = a3;
}

- (double)mitigationScore
{
  return self->_mitigationScore;
}

- (BOOL)hasMitigationScore
{
  return self->_hasMitigationScore;
}

- (void)setHasMitigationScore:(BOOL)a3
{
  self->_hasMitigationScore = a3;
}

- (int)invocationTypeID
{
  return self->_invocationTypeID;
}

- (BOOL)hasInvocationTypeID
{
  return self->_hasInvocationTypeID;
}

- (void)setHasInvocationTypeID:(BOOL)a3
{
  self->_hasInvocationTypeID = a3;
}

- (double)repetitionSimilarityScore
{
  return self->_repetitionSimilarityScore;
}

- (BOOL)hasRepetitionSimilarityScore
{
  return self->_hasRepetitionSimilarityScore;
}

- (void)setHasRepetitionSimilarityScore:(BOOL)a3
{
  self->_hasRepetitionSimilarityScore = a3;
}

- (double)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return self->_hasTdSpeakerRecognizerCombinedScore;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  self->_hasTdSpeakerRecognizerCombinedScore = a3;
}

- (double)hwSampleRate
{
  return self->_hwSampleRate;
}

- (BOOL)hasHwSampleRate
{
  return self->_hasHwSampleRate;
}

- (void)setHasHwSampleRate:(BOOL)a3
{
  self->_hasHwSampleRate = a3;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (double)keywordThresholdHS
{
  return self->_keywordThresholdHS;
}

- (BOOL)hasKeywordThresholdHS
{
  return self->_hasKeywordThresholdHS;
}

- (void)setHasKeywordThresholdHS:(BOOL)a3
{
  self->_hasKeywordThresholdHS = a3;
}

- (double)keywordThresholdJS
{
  return self->_keywordThresholdJS;
}

- (BOOL)hasKeywordThresholdJS
{
  return self->_hasKeywordThresholdJS;
}

- (void)setHasKeywordThresholdJS:(BOOL)a3
{
  self->_hasKeywordThresholdJS = a3;
}

- (double)tdSpeakerRecognizerCombinedThresholdHS
{
  return self->_tdSpeakerRecognizerCombinedThresholdHS;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdHS
{
  return self->_hasTdSpeakerRecognizerCombinedThresholdHS;
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdHS:(BOOL)a3
{
  self->_hasTdSpeakerRecognizerCombinedThresholdHS = a3;
}

- (double)tdSpeakerRecognizerCombinedThresholdJS
{
  return self->_tdSpeakerRecognizerCombinedThresholdJS;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdJS
{
  return self->_hasTdSpeakerRecognizerCombinedThresholdJS;
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdJS:(BOOL)a3
{
  self->_hasTdSpeakerRecognizerCombinedThresholdJS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configVersion, 0);
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

    v4 = -[BMSiriVoiceTriggerStatistics initByReadFrom:]([BMSiriVoiceTriggerStatistics alloc], "initByReadFrom:", v7);
    v4[12] = 0;

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
  void *v20;
  void *v21;
  _QWORD v22[20];

  v22[18] = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 2);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firstPassPeakScoreHS"), 1, 0, 2, 1, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firstPassPeakScoreJS"), 1, 0, 3, 1, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firstPassTriggerSource"), 0, 0, 4, 2, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("recognizerScoreHS"), 1, 0, 5, 1, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("recognizerScoreJS"), 1, 0, 6, 1, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("triggerScoreHS"), 1, 0, 7, 1, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("triggerScoreJS"), 1, 0, 8, 1, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mitigationScore"), 1, 0, 9, 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("invocationTypeID"), 0, 0, 10, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("repetitionSimilarityScore"), 1, 0, 11, 1, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tdSpeakerRecognizerCombinedScore"), 1, 0, 12, 1, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hwSampleRate"), 1, 0, 13, 1, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("configVersion"), 2, 0, 14, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("keywordThresholdHS"), 1, 0, 15, 1, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("keywordThresholdJS"), 1, 0, 16, 1, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tdSpeakerRecognizerCombinedThresholdHS"), 1, 0, 17, 1, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tdSpeakerRecognizerCombinedThresholdJS"), 1, 0, 18, 1, 0);
  v22[0] = v21;
  v22[1] = v20;
  v22[2] = v19;
  v22[3] = v18;
  v22[4] = v17;
  v22[5] = v16;
  v22[6] = v15;
  v22[7] = v14;
  v22[8] = v2;
  v22[9] = v3;
  v22[10] = v4;
  v22[11] = v13;
  v22[12] = v5;
  v22[13] = v6;
  v22[14] = v7;
  v22[15] = v12;
  v22[16] = v8;
  v22[17] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 18);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F3D8;
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
  _QWORD v22[20];

  v22[18] = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v22[0] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firstPassPeakScoreHS"), 2, 1, 0);
  v22[1] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firstPassPeakScoreJS"), 3, 1, 0);
  v22[2] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firstPassTriggerSource"), 4, 2, 0);
  v22[3] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recognizerScoreHS"), 5, 1, 0);
  v22[4] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recognizerScoreJS"), 6, 1, 0);
  v22[5] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("triggerScoreHS"), 7, 1, 0);
  v22[6] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("triggerScoreJS"), 8, 1, 0);
  v22[7] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mitigationScore"), 9, 1, 0);
  v22[8] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("invocationTypeID"), 10, 2, 0);
  v22[9] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("repetitionSimilarityScore"), 11, 1, 0);
  v22[10] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tdSpeakerRecognizerCombinedScore"), 12, 1, 0);
  v22[11] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hwSampleRate"), 13, 1, 0);
  v22[12] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("configVersion"), 14, 13, 0);
  v22[13] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("keywordThresholdHS"), 15, 1, 0);
  v22[14] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("keywordThresholdJS"), 16, 1, 0);
  v22[15] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tdSpeakerRecognizerCombinedThresholdHS"), 17, 1, 0);
  v22[16] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tdSpeakerRecognizerCombinedThresholdJS"), 18, 1, 0);
  v22[17] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
