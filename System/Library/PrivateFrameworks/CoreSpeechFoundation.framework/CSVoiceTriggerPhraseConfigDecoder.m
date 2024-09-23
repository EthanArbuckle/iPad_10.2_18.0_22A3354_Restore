@implementation CSVoiceTriggerPhraseConfigDecoder

+ (id)decodeConfigFrom:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "containsKey:category:", CFSTR("phrase"), v6))
  {
    objc_msgSend(a1, "decodeConfigV2:category:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    objc_msgSend(a1, "decodeConfigV1:category:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

+ (id)decodeConfigV2:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  CSVoiceTriggerPhraseConfig *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  int v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  double v37;
  int v38;
  int v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CSVoiceTriggerPhraseConfig *v65;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  id obj;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  float v86;
  void *v87;
  int v88;
  const __CFString *v89;
  CSVoiceTriggerPhraseConfig *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "getValueForKey:category:", CFSTR("phrase"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v69 = v7;
    v70 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v74 = (id)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v68 = v8;
    obj = v8;
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    if (v75)
    {
      v72 = *(_QWORD *)v96;
      v73 = a1;
      do
      {
        for (i = 0; i != v75; ++i)
        {
          if (*(_QWORD *)v96 != v72)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("threshold"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("threshold"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "floatValue");
            v14 = v13;

          }
          else
          {
            v14 = 2139095040;
          }

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("2ndChanceThreshold"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v14;
          if (v15)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("2ndChanceThreshold"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "floatValue");
            v16 = v18;

          }
          v19 = [CSVoiceTriggerPhraseConfig alloc];
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v22 = CFSTR("Hey Siri");
          if (v20)
            v22 = (const __CFString *)v20;
          v89 = v22;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("loggingThreshold"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v92)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("loggingThreshold"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "floatValue");
            v88 = v23;
          }
          else
          {
            v88 = 2139095040;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ndapiScaleFactor"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          if (v94)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ndapiScaleFactor"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "floatValue");
          }
          else
          {
            v24 = 1.0;
          }
          v86 = v24;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("recognizerThresholdOffset"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (v91)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("recognizerThresholdOffset"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "floatValue");
            v26 = v25;
          }
          else
          {
            v26 = 0.5;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("recognizerScoreScaleFactor"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("recognizerScoreScaleFactor"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "floatValue");
            v29 = v28;
          }
          else
          {
            v29 = 1.0;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("recognizerToken"));
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          v32 = CFSTR("hey_Siri");
          if (v30)
            v32 = (const __CFString *)v30;
          v85 = v32;
          objc_msgSend(a1, "twoShotDelayConfigKey");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v19;
          if (v33)
          {
            objc_msgSend(a1, "twoShotDelayConfigKey");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "floatValue");
          }
          else
          {
            objc_msgSend(a1, "defaultTwoShotDelay");
          }
          objc_msgSend(a1, "adjustTwoShotDelay:");
          v35 = v34;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("twoShotFeedbackDelayPhaticRemora"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("twoShotFeedbackDelayPhaticRemora"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "floatValue");
          }
          else
          {
            LODWORD(v37) = 2.0;
          }
          objc_msgSend(a1, "adjustTwoShotDelay:", v37);
          v39 = v38;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rejectLoggingThreshold"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rejectLoggingThreshold"));
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "floatValue");
            v42 = v41;
          }
          else
          {
            v42 = 2139095040;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("phsRejectLoggingThreshold"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v21;
          if (v43)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("phsRejectLoggingThreshold"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "floatValue");
            v45 = v44;
          }
          else
          {
            v45 = 2139095040;
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("preTriggerSilenceOffset"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("preTriggerSilenceOffset"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "floatValue");
            LODWORD(v67) = v56;
            LODWORD(v57) = v14;
            LODWORD(v58) = v16;
            LODWORD(v59) = v88;
            *(float *)&v60 = v86;
            *(float *)&v61 = v26;
            *(float *)&v62 = v29;
            LODWORD(v63) = v35;
            LODWORD(v64) = v39;
            v65 = -[CSVoiceTriggerPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v90, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", v89, v85, v57, v58, v59, v60, v61, v62, v63, v64, __PAIR64__(v45, v42), v67);

          }
          else
          {
            LODWORD(v67) = 0;
            LODWORD(v47) = v14;
            LODWORD(v48) = v16;
            LODWORD(v49) = v88;
            *(float *)&v50 = v86;
            *(float *)&v51 = v26;
            *(float *)&v52 = v29;
            LODWORD(v53) = v35;
            LODWORD(v54) = v39;
            v65 = -[CSVoiceTriggerPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v90, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", v89, v85, v47, v48, v49, v50, v51, v52, v53, v54, __PAIR64__(v45, v42), v67);
          }

          if (v43)
          a1 = v73;
          if (v40)

          if (v36)
          if (v33)
          {

          }
          if (v27)

          if (v91)
          if (v94)

          if (v92)
          objc_msgSend(v74, "addObject:", v65);

        }
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      }
      while (v75);
    }

    v7 = v69;
    v6 = v70;
    v8 = v68;
  }
  else
  {
    v74 = 0;
  }

  return v74;
}

+ (id)decodeConfigV1:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  void *v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CSVoiceTriggerPhraseConfig *v49;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  CSVoiceTriggerPhraseConfig *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("threshold"), v6, &unk_1E68A1A78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  LODWORD(v11) = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("2ndChanceThreshold"), v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v57 = v14;

  v55 = [CSVoiceTriggerPhraseConfig alloc];
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("loggingThreshold"), v6, &unk_1E68A1A78);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "floatValue");
  v53 = v15;
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("ndapiScaleFactor"), v6, &unk_1E68A1A88);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "floatValue");
  v17 = v16;
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("recognizerThresholdOffset"), v6, &unk_1E68A1A98);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "floatValue");
  v19 = v18;
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("recognizerScoreScaleFactor"), v6, &unk_1E68A1A88);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  v21 = v20;
  objc_msgSend(v7, "getStringForKey:category:default:", CFSTR("recognizerToken"), v6, CFSTR("hey_Siri"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "twoShotDelayConfigKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "defaultTwoShotDelay");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getNumberForKey:category:default:", v22, v6, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  objc_msgSend(a1, "adjustTwoShotDelay:");
  v27 = v26;
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "defaultRemoraTwoShotDelay");
  objc_msgSend(v28, "numberWithFloat:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("twoShotFeedbackDelayPhaticRemora"), v6, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  objc_msgSend(a1, "adjustTwoShotDelay:");
  v32 = v31;
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("rejectLoggingThreshold"), v6, &unk_1E68A1A78);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v35 = v34;
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("phsRejectLoggingThreshold"), v6, &unk_1E68A1A78);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v38 = v37;
  objc_msgSend(v7, "getNumberForKey:category:default:", CFSTR("preTriggerSilenceOffset"), v6, &unk_1E68A1AA8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "floatValue");
  LODWORD(v51) = v40;
  LODWORD(v41) = v10;
  LODWORD(v42) = v57;
  LODWORD(v43) = v53;
  LODWORD(v44) = v17;
  LODWORD(v45) = v19;
  LODWORD(v46) = v21;
  LODWORD(v47) = v27;
  LODWORD(v48) = v32;
  v49 = -[CSVoiceTriggerPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v55, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", CFSTR("Hey Siri"), v52, v41, v42, v43, v44, v45, v46, v47, v48, __PAIR64__(v38, v35), v51);

  return v49;
}

+ (float)defaultRemoraTwoShotDelay
{
  return 2.0;
}

+ (float)defaultTwoShotDelay
{
  float result;

  if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    AFPreferencesStartAlertEnabled();
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  result = 2.0;
  if (!CSIsHorseman_isHorseman)
    return 1.5;
  return result;
}

+ (id)twoShotDelayConfigKey
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS") || AFPreferencesStartAlertEnabled())
    return CFSTR("twoShotFeedbackDelayBeep");
  else
    return CFSTR("twoShotFeedbackDelayPhatic");
}

+ (float)adjustTwoShotDelay:(float)a3
{
  float result;

  result = a3 + -0.5;
  if (result < 0.0)
    return 0.0;
  return result;
}

@end
