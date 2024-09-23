@implementation CESRUtilities

+ (BOOL)isSiriUODSupported
{
  if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    return 1;
  else
    return AFShouldRunAsrOnServerForUOD();
}

+ (BOOL)isASRSupported
{
  if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    return 1;
  else
    return AFOfflineDictationCapable();
}

+ (id)currentSiriLanguageCode
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

+ (id)currentDictationLanguageCodes
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = objc_alloc_init(MEMORY[0x1E0CD7F48]);
  objc_msgSend(v2, "installationStatusForLanguagesWithAssetType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__988;
  v11 = __Block_byref_object_dispose__989;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CESRUtilities_currentDictationLanguageCodes__block_invoke;
  v6[3] = &unk_1E6734028;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (BOOL)isAssistantEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  return v3;
}

+ (BOOL)isDictationEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dictationIsEnabled");

  return v3;
}

+ (unint64_t)secondsToHostTime:(float)a3
{
  double v3;
  double v4;

  v3 = a3;
  +[CESRUtilities getHostClockFrequency](CESRUtilities, "getHostClockFrequency");
  return (unint64_t)(v4 * v3);
}

+ (float)hostTimeToSeconds:(unint64_t)a3
{
  double v3;
  double v4;

  v3 = (double)a3;
  +[CESRUtilities getHostClockFrequency](CESRUtilities, "getHostClockFrequency");
  return v3 / v4;
}

+ (unint64_t)machAbsoluteTimeToMachContinuousTime:(unint64_t)a3
{
  mach_get_times();
  return a3;
}

+ (double)getHostClockFrequency
{
  unint64_t v2;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  if (!info.numer)
    return 0.0;
  LODWORD(v2) = info.denom;
  return (double)v2 / (double)info.numer * 1000000000.0;
}

+ (int64_t)calculateDiffInDaysFromTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "doubleValue");
  v9 = v8;

  objc_msgSend(v7, "dateWithTimeIntervalSince1970:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:toDate:options:", 16, v10, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "day");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)hasRecognizedAnythingInAFSpeechPackage:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "recognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "utterances", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "interpretationIndices");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)afTokensForEARTokens:(id)a3 removeSpaceBefore:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        v13 = objc_alloc_init(MEMORY[0x1E0CFEA68]);
        objc_msgSend(v12, "tokenName", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setText:", v14);

        objc_msgSend(v12, "phoneSequence");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPhoneSequence:", v15);

        objc_msgSend(v12, "start");
        objc_msgSend(v13, "setStartTime:");
        objc_msgSend(v12, "silenceStart");
        objc_msgSend(v13, "setSilenceStartTime:");
        objc_msgSend(v12, "end");
        objc_msgSend(v13, "setEndTime:");
        objc_msgSend(v13, "setRemoveSpaceBefore:", a4);
        a4 = objc_msgSend(v12, "hasSpaceAfter") ^ 1;
        objc_msgSend(v12, "confidence");
        objc_msgSend(v13, "setConfidenceScore:", (uint64_t)v16);
        objc_msgSend(v12, "ipaPhoneSequence");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setIpaPhoneSequence:", v17);

        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "graphCost");
        objc_msgSend(v18, "numberWithDouble:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setGraphCost:", v19);

        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "acousticCost");
        objc_msgSend(v20, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAcousticCost:", v21);

        objc_msgSend(v6, "addObject:", v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)afRecognitionForEARSausage:(id)a3 processedAudioDuration:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  os_log_t *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t i;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  id obj;
  id obja;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  char v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t v89[128];
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  unint64_t v93;
  __int16 v94;
  unint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "nBest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenSausage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v5;
  objc_msgSend(v5, "interpretationIndices");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v7;
  v66 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v12;
  v13 = objc_msgSend(v12, "count");
  v68 = v9;
  v14 = objc_msgSend(v9, "count");
  v15 = v14;
  if (v14 > v13)
  {
    v16 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v91 = "AFPhrasesAndUtterancesForEARSausage";
      v92 = 2048;
      v93 = v15;
      v94 = 2048;
      v95 = v13;
      _os_log_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_INFO, "%s Size of lossless n-best (%ld) exceeds size of sausage-based n-best (%ld); this leads to information loss in t"
        "he lossless n-best.",
        buf,
        0x20u);
    }
LABEL_8:
    v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v13)
      goto LABEL_17;
    goto LABEL_9;
  }
  if (v14 >= v13)
    goto LABEL_8;
  v17 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v91 = "AFPhrasesAndUtterancesForEARSausage";
    v92 = 2048;
    v93 = v15;
    v94 = 2048;
    v95 = v13;
    _os_log_error_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_ERROR, "%s Size of lossless n-best (%ld) is less than size of sausage-based n-best (%ld); this is unexpected.",
      buf,
      0x20u);
  }
  v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
LABEL_9:
  obj = v10;
  v18 = 0;
  v19 = MEMORY[0x1E0C9AA60];
  v20 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  do
  {
    if (v18 >= v15)
    {
      v24 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v91 = "AFPhrasesAndUtterancesForEARSausage";
        v92 = 2048;
        v93 = v18;
        _os_log_impl(&dword_1B3E5F000, v24, OS_LOG_TYPE_INFO, "%s AFSpeechUtterance at index %ld will have a nil AFSpeechInterpretation (used for lossless n-best) since the lossless n-best does not have an entry at this index.", buf, 0x16u);
      }
      v21 = 0;
    }
    else
    {
      v21 = objc_alloc_init(MEMORY[0x1E0CFEA38]);
      objc_msgSend(v68, "objectAtIndex:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CESRUtilities afTokensForEARTokens:removeSpaceBefore:](CESRUtilities, "afTokensForEARTokens:removeSpaceBefore:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTokens:", v23);

    }
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA70]), "initWithInterpretationIndices:confidenceScore:interpretation:", v19, 0, v21);
    objc_msgSend(v25, "setSource:", 2);
    objc_msgSend(v73, "addObject:", v25);

    ++v18;
  }
  while (v13 != v18);
  v10 = obj;
LABEL_17:
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obja = v10;
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, buf, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = 0;
    v71 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v86 != v71)
          objc_enumerationMutation(obja);
        v32 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        v33 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __AFPhrasesAndUtterancesForEARSausage_block_invoke;
        v79[3] = &unk_1E6734138;
        v34 = v73;
        v83 = v29;
        v80 = v34;
        v81 = v32;
        v84 = v30 & 1;
        v35 = v33;
        v82 = v35;
        objc_msgSend(v72, "enumerateObjectsUsingBlock:", v79);
        v36 = objc_msgSend(v35, "count");
        if (v36)
        {
          v37 = v36;
          objc_msgSend(v32, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "lastObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v39, "hasSpaceAfter") ^ 1;

          v40 = objc_alloc_init(MEMORY[0x1E0CFEA50]);
          objc_msgSend(v35, "array");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v41, "copy");
          objc_msgSend(v40, "setInterpretations:", v42);

          objc_msgSend(v40, "setIsLowConfidence:", v37 != 1);
          objc_msgSend(v26, "addObject:", v40);
          ++v29;

        }
      }
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, buf, 16);
    }
    while (v28);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v74 = v73;
  v43 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v76 != v45)
          objc_enumerationMutation(v74);
        v47 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
        objc_msgSend(v47, "interpretationIndices");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "count");

        if (v49)
        {
          v50 = 0;
          v51 = 0;
          do
          {
            objc_msgSend(v47, "interpretationIndices");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectAtIndex:", v50);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "unsignedIntegerValue");

            objc_msgSend(v26, "objectAtIndex:", v50);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "interpretations");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectAtIndex:", v54);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v57, "tokens");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v51 += objc_msgSend(v58, "count");

            ++v50;
            objc_msgSend(v47, "interpretationIndices");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "count");

          }
          while (v50 < v60);
          if (v51)
            objc_msgSend(v47, "setConfidenceScore:", (uint64_t)((double)objc_msgSend(v47, "confidenceScore") / (double)v51));
        }
      }
      v44 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    }
    while (v44);
  }

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v74);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "array");
  v62 = (id)objc_claimAutoreleasedReturnValue();

  v63 = v62;
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA58]), "initWithPhrases:utterances:processedAudioDuration:", v26, v63, a4);

  return v64;
}

+ (id)afSpeechPackageForEARPackage:(id)a3 processedAudioDuration:(double)a4 speechProfileUsed:(BOOL)a5 recognizerModelInfo:(id)a6 isVoiceCommandCandidatePackage:(BOOL)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  double v65;
  double v66;
  char v67;
  void *v68;
  void *v69;
  NSObject *v71;
  float v72;
  double v73;
  float v74;
  double v75;
  float v76;
  double v77;
  float v78;
  uint64_t v79;
  id v80;
  id v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  double v99;
  __int16 v100;
  double v101;
  __int16 v102;
  double v103;
  __int16 v104;
  double v105;
  uint64_t v106;

  v82 = a7;
  v106 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v91 = a6;
  objc_msgSend(v9, "recognition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:](CESRUtilities, "afRecognitionForEARSausage:processedAudioDuration:", v10, a4);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "preITNRecognition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:](CESRUtilities, "afRecognitionForEARSausage:processedAudioDuration:", v11, a4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "audioAnalytics");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "acousticFeatures");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v92, buf, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v93 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(MEMORY[0x1E0CFEA18]);
        objc_msgSend(v20, "acousticFeatureValuePerFrame");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frameDuration");
        v23 = (void *)objc_msgSend(v21, "initWithAcousticFeatureValue:frameDuration:", v22);

        objc_msgSend(v13, "setValue:forKey:", v23, v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v92, buf, 16);
    }
    while (v16);
  }

  objc_msgSend(v85, "speechRecognitionFeatures");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc(MEMORY[0x1E0CFEA20]);
  objc_msgSend(v85, "snr");
  v87 = (void *)objc_msgSend(v25, "initWithSpeechRecognitionFeatures:acousticFeatures:snr:", v24, v13);

  objc_msgSend(v9, "latticeMitigatorResult");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v91;
  if (v26)
  {
    v28 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      v71 = v28;
      objc_msgSend(v26, "score");
      v73 = v72;
      objc_msgSend(v26, "threshold");
      v75 = v74;
      objc_msgSend(v26, "calibrationScale");
      v77 = v76;
      objc_msgSend(v26, "calibrationOffset");
      *(_DWORD *)buf = 136316162;
      v97 = "AFSpeechLatticeMitigatorResultForEar";
      v98 = 2048;
      v99 = v73;
      v100 = 2048;
      v101 = v75;
      v102 = 2048;
      v103 = v77;
      v104 = 2048;
      v105 = v78;
      _os_log_debug_impl(&dword_1B3E5F000, v71, OS_LOG_TYPE_DEBUG, "%s AFSpeechLatticeMitigatorResult Score = %f, Threshold = %f, CalibrationScale = %f, CalibrationOffset = %f", buf, 0x34u);

    }
    v29 = objc_alloc(MEMORY[0x1E0CFEA40]);
    objc_msgSend(v26, "version");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "score");
    v32 = v31;
    objc_msgSend(v26, "threshold");
    v34 = v33;
    objc_msgSend(v26, "calibrationScale");
    v36 = v35;
    objc_msgSend(v26, "calibrationOffset");
    LODWORD(v38) = v37;
    LODWORD(v39) = v32;
    LODWORD(v40) = v34;
    LODWORD(v41) = v36;
    v86 = (void *)objc_msgSend(v29, "initWithResults:score:threshold:calibrationScale:calibrationOffset:", v30, v39, v40, v41, v38);

  }
  else
  {
    v86 = 0;
  }

  if ((objc_msgSend(v9, "isFinal") & 1) != 0)
  {
    v42 = -1;
  }
  else
  {
    objc_getAssociatedObject(v9, kResultCandidateIdKey);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_getAssociatedObject(v9, kResultCandidateIdKey);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (int)objc_msgSend(v44, "intValue");

    }
    else
    {
      v42 = -1;
    }

  }
  if (v82)
  {
    objc_msgSend(v9, "recognition");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v55 = 0;
      v56 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v9, "recognition");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_opt_respondsToSelector();

    if ((v47 & 1) != 0)
    {
      objc_msgSend(v9, "recognition");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "potentialPrecedingRecognition");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        v80 = objc_alloc(MEMORY[0x1E0CFEA48]);
        objc_msgSend(v9, "recognition");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "potentialPrecedingRecognition");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:](CESRUtilities, "afRecognitionForEARSausage:processedAudioDuration:", v50, a4);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "preITNRecognition");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "potentialPrecedingRecognition");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:](CESRUtilities, "afRecognitionForEARSausage:processedAudioDuration:", v53, a4);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "utteranceStart");
        v55 = (void *)objc_msgSend(v80, "initWithRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:", v51, v54, 0, 0);

      }
      else
      {
        v55 = 0;
      }
      v81 = objc_alloc(MEMORY[0x1E0CFEA48]);
      objc_msgSend(v9, "recognition");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "potentialCommandRecognition");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:](CESRUtilities, "afRecognitionForEARSausage:processedAudioDuration:", v84, a4);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preITNRecognition");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "potentialCommandRecognition");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[CESRUtilities afRecognitionForEARSausage:processedAudioDuration:](CESRUtilities, "afRecognitionForEARSausage:processedAudioDuration:", v61, a4);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "utteranceStart");
      v56 = (void *)objc_msgSend(v81, "initWithRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:", v59, v62, 0, 0);

      v27 = v91;
LABEL_29:

      if (!v27)
        goto LABEL_30;
      goto LABEL_25;
    }
  }
  v55 = 0;
  v56 = 0;
  if (!v91)
  {
LABEL_30:
    v58 = &stru_1E67359A8;
    v57 = &stru_1E67359A8;
    goto LABEL_31;
  }
LABEL_25:
  objc_msgSend(v27, "version");
  v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "acousticModelVersion");
  v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_31:
  v63 = objc_alloc(MEMORY[0x1E0CFEA48]);
  v64 = objc_msgSend(v9, "isFinal");
  objc_msgSend(v9, "utteranceStart");
  v66 = v65;
  v67 = objc_msgSend(v9, "recognitionPaused");
  objc_msgSend(v9, "endOfSentenceLikelihood");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v79) = a5;
  LOBYTE(v79) = v67;
  v69 = (void *)objc_msgSend(v63, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", v90, v90, v88, v87, v64, v86, v66, v79, v42, v68, v57, v58, v55, v56,
                  objc_msgSend(v9, "numTokensExcludingTriggerPhrase"));

  return v69;
}

+ (id)speechProfileRootDirectories
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  SFSpeechProfileSiteDirectories();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "path", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v5);
  }

  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    v16 = "+[CESRUtilities speechProfileRootDirectories]";
    v17 = 2113;
    v18 = v2;
    _os_log_debug_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_DEBUG, "%s Root directories for new type of speech profile: %{private}@", buf, 0x16u);
  }
  return v2;
}

+ (id)speechProfilePathsWithLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v25 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "+[CESRUtilities speechProfilePathsWithLanguage:]";
      _os_log_error_impl(&dword_1B3E5F000, v25, OS_LOG_TYPE_ERROR, "%s speechProfilePathsWithLanguage was incorrectly called with language=nil", buf, 0xCu);
    }
    goto LABEL_27;
  }
  v5 = v4;
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1B5E32344](v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  if (!v10)
  {
    v26 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "+[CESRUtilities speechProfilePathsWithLanguage:]";
      _os_log_fault_impl(&dword_1B3E5F000, v26, OS_LOG_TYPE_FAULT, "%s Mapped language=nil", buf, 0xCu);
    }
LABEL_27:
    v32 = 0;
    return v32;
  }
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "speechProfileRootDirectories");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(obj);
        v31 = v11;
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v11);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "enumeratorAtPath:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              v20 = (void *)MEMORY[0x1E0CB3940];
              v41[0] = v12;
              v41[1] = v19;
              v41[2] = v10;
              v41[3] = CFSTR("SpeechProfile");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "pathWithComponents:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "fileExistsAtPath:", v22);

              if (v24)
                objc_msgSend(v32, "addObject:", v22);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v16);
        }

        v11 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v30);
  }

  return v32;
}

+ (void)loadSpeechProfiles:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  _BOOL4 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v38 = v7;
    objc_msgSend(a1, "speechProfilePathsWithLanguage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v46;
      v12 = *MEMORY[0x1E0CB2A88];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "attributesOfItemAtPath:error:", v14, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "objectForKey:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "timeIntervalSinceReferenceDate");
            v20 = v19;
            objc_msgSend(v15, "loadDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "timeIntervalSinceReferenceDate");
            v23 = v22;

            if (v20 > 0.0 && v23 > 0.0 && v20 <= v23)
            {
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v15, v14);
              v25 = *MEMORY[0x1E0CFE6C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315395;
                v50 = "+[CESRUtilities loadSpeechProfiles:language:]";
                v51 = 2113;
                v52 = v14;
                _os_log_debug_impl(&dword_1B3E5F000, v25, OS_LOG_TYPE_DEBUG, "%s Reused new type of speech profile: path=%{private}@", buf, 0x16u);
              }
            }

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      }
      while (v10);
    }

    objc_msgSend(v6, "removeAllObjects");
    objc_msgSend(v6, "addEntriesFromDictionary:", v39);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = obj;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v30);
          objc_msgSend(v6, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F190]), "initWithPath:error:", v31, 0);
            v35 = *MEMORY[0x1E0CFE6C0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315651;
              v50 = "+[CESRUtilities loadSpeechProfiles:language:]";
              v51 = 2113;
              v52 = v31;
              v53 = 1024;
              v54 = v34 != 0;
              _os_log_debug_impl(&dword_1B3E5F000, v35, OS_LOG_TYPE_DEBUG, "%s Loaded new type of speech profile: path=%{private}@ profile=%d", buf, 0x1Cu);
              if (v34)
              {
LABEL_26:
                objc_msgSend(v34, "setLoadDate:", v33);
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, v31);
              }
            }
            else if (v34)
            {
              goto LABEL_26;
            }

          }
          ++v30;
        }
        while (v28 != v30);
        v36 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        v28 = v36;
      }
      while (v36);
    }

    v7 = v38;
  }
  else
  {
    v37 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[CESRUtilities loadSpeechProfiles:language:]";
      _os_log_fault_impl(&dword_1B3E5F000, v37, OS_LOG_TYPE_FAULT, "%s loadSpeechProfiles was incorrectly called with profiles=nil", buf, 0xCu);
    }
  }

}

+ (id)speechProfileDateLastModifiedForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "speechProfilePathsWithLanguage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)earTokensToString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__CESRUtilities_earTokensToString___block_invoke;
  v8[3] = &unk_1E6734050;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)voiceCommandsParamKeyBuilder:(unint64_t)a3
{
  return (id)objc_msgSend(CFSTR("Param"), "stringByAppendingFormat:", CFSTR("%lu"), a3);
}

+ (id)afVoiceCommandGrammarParseResultForEARTokenString:(id)a3 withEARVoiceCommandInterpretations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v34;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x1E0C99E08]);
          objc_msgSend(v12, "arguments");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

          v29 = 0;
          v30 = &v29;
          v31 = 0x2020000000;
          v32 = 1;
          objc_msgSend(v12, "arguments");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke;
          v25[3] = &unk_1E67340A0;
          v17 = v15;
          v26 = v17;
          v27 = v5;
          v28 = &v29;
          objc_msgSend(v16, "enumerateObjectsUsingBlock:", v25);

          v18 = objc_alloc(MEMORY[0x1E0CFEAA0]);
          objc_msgSend(v12, "commandIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithCommandId:isComplete:paramMatches:", v19, *((unsigned __int8 *)v30 + 24), v17);

          objc_msgSend(v8, "addObject:", v20);
          _Block_object_dispose(&v29, 8);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v9);
    }

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEAB0]), "initWithUtterance:parseCandidates:", v5, v8);
    v7 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)AFSpeechInfoPackageForEARSpeechRecognitionResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities earTokensToString:](CESRUtilities, "earTokensToString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "voiceCommandInterpretations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities afVoiceCommandGrammarParseResultForEARTokenString:withEARVoiceCommandInterpretations:](CESRUtilities, "afVoiceCommandGrammarParseResultForEARTokenString:withEARVoiceCommandInterpretations:", v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preITNTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities earTokensToString:](CESRUtilities, "earTokensToString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "preITNVoiceCommandInterpretations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CESRUtilities afVoiceCommandGrammarParseResultForEARTokenString:withEARVoiceCommandInterpretations:](CESRUtilities, "afVoiceCommandGrammarParseResultForEARTokenString:withEARVoiceCommandInterpretations:", v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v7 | v11)
  {
    if (v7)
    {
      v18[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_4:
        v17 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEAA8]), "initWithNBestParses:preITNNBestParses:", v12, v13);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA30]), "initWithCommandGrammarParsePackage:", v15);

        goto LABEL_9;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
      if (v11)
        goto LABEL_4;
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

+ (id)AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:(id)a3
{
  id v3;
  void *v4;
  char v5;
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

  v3 = a3;
  objc_msgSend(v3, "recognition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  objc_msgSend(v3, "recognition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "potentialCommandRecognition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nBest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "nBestVoiceCommandInterpretations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preITNRecognition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "potentialCommandRecognition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nBest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "nBest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "nBestVoiceCommandInterpretations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preITNRecognition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nBest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "preITNNBestVoiceCommandInterpretations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") || objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEAA8]), "initWithNBestParses:preITNNBestParses:", v11, v16);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA30]), "initWithCommandGrammarParsePackage:", v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)earTokensForAFTokens:(id)a3 appendedAutoPunctuation:(BOOL)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v27 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0D1F170]);
        objc_msgSend(v10, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startTime");
        v14 = v13;
        objc_msgSend(v10, "endTime");
        v16 = v15;
        objc_msgSend(v10, "silenceStartTime");
        v18 = v17;
        v19 = (double)objc_msgSend(v10, "confidenceScore");
        v20 = objc_msgSend(v10, "removeSpaceAfter") ^ 1;
        v21 = objc_msgSend(v10, "removeSpaceBefore") ^ 1;
        objc_msgSend(v10, "phoneSequence");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ipaPhoneSequence");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v11, "initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:appendedAutoPunctuation:", v12, v20, v21, v22, v23, v27, v14, v16, v18, v19);

        objc_msgSend(v5, "addObject:", v24);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)mapContextOptionToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unconstrained");
  if (a3 == 1)
    v3 = CFSTR("reduced");
  if (a3 == 2)
    return CFSTR("avoid");
  else
    return (id)v3;
}

+ (id)languageCodeForLocale:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *MEMORY[0x1E0C997E8];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)languageStringForLocaleString:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
}

+ (id)localeStringForLanguageString:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
}

+ (BOOL)isFilePathValid:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  char v8;

  v8 = 0;
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v8);

  if (v8)
    return 0;
  else
    return v6;
}

+ (id)audioData:(id)a3 withBytesFromEnd:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (a4)
  {
    if (v6 <= a4)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v5, "subdataWithRange:", v6 - a4, a4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  }
  v8 = v7;

  return v8;
}

+ (unint64_t)audioLengthInBytes:(double)a3 samplingRate:(unint64_t)a4
{
  return 2 * (unint64_t)(a3 / 1000.0 * (double)a4);
}

+ (double)audioDurationInMs:(id)a3 samplingRate:(unint64_t)a4
{
  return (double)((unint64_t)objc_msgSend(a3, "length") >> 1) / (double)a4 * 1000.0;
}

+ (BOOL)aFEnableFeatureAndCheckPreferenceValueWithKey:(__CFString *)a3
{
  void *v3;
  BOOL v4;

  _AFPreferencesValueForKeyWithContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (id)recognizerSourceForTask:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isEqualToString:", CFSTR("SearchOrMessaging")))
  {
    v5 = CFSTR("Assistant");
    v6 = CFSTR("Assistant");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)cooldownDisabledForDevice
{
  return 0;
}

+ (id)getNormString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "lowercaseString", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "componentsSeparatedByString:", CFSTR("\\"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)alignedPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v26;
  void *v27;
  _QWORD v28[5];
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  +[CESRUtilities _firstSeenPartialResultIndicesForTokens:firstSeenPartialResultTokens:](CESRUtilities, "_firstSeenPartialResultIndicesForTokens:firstSeenPartialResultTokens:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v26 = v6;
  v10 = objc_msgSend(v6, "count");
  if (v9)
  {
    v11 = v10;
    for (i = 0; i != v9; ++i)
    {
      v29 = 0;
      v30 = (id *)&v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__988;
      v33 = __Block_byref_object_dispose__989;
      v34 = &unk_1E6745000;
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToNumber:", &unk_1E6745000);

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntegerValue");

        if (v16 < v11)
        {
          v17 = v11;
          objc_msgSend(v27, "objectAtIndex:", i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tokenName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[CESRUtilities getNormString:](CESRUtilities, "getNormString:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "objectAtIndex:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_storeStrong(v30 + 5, v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -1);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v30[5];
            v30[5] = (id)v23;

            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __83__CESRUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke;
            v28[3] = &unk_1E67340F0;
            v28[4] = &v29;
            objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v28);
          }

          v11 = v17;
        }
      }
      objc_msgSend(v7, "addObject:", v30[5]);
      _Block_object_dispose(&v29, 8);

    }
  }

  return v7;
}

+ (id)_firstSeenPartialResultIndicesForTokens:(id)a3 firstSeenPartialResultTokens:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  v8 = objc_msgSend(v5, "count");
  v23 = v6;
  v9 = objc_msgSend(v6, "count");
  if (v8)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    do
    {
      +[CESRUtilities _alignTokenToFirstSeenPartialResult:tokenIndex:firstSeenPartialResultTokens:firstSeenPartialResultIndex:](CESRUtilities, "_alignTokenToFirstSeenPartialResult:tokenIndex:firstSeenPartialResultTokens:firstSeenPartialResultIndex:", v24, v12, v23, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      objc_msgSend(v13, "allValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedIntegerValue");

      v20 = v16 - v12;
      if (v16 > v12)
      {
        do
        {
          objc_msgSend(v7, "addObject:", &unk_1E6745000);
          --v20;
        }
        while (v20);
      }
      if (v19 >= v10)
      {
        objc_msgSend(v7, "addObject:", &unk_1E6745000);
        v11 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v21);

        v11 = v19 + 1;
      }
      v12 = v16 + 1;

    }
    while (v16 + 1 < v8);
  }

  return v7;
}

+ (id)_alignTokenToFirstSeenPartialResult:(id)a3 tokenIndex:(unint64_t)a4 firstSeenPartialResultTokens:(id)a5 firstSeenPartialResultIndex:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  char v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  v36 = v9;
  v13 = objc_msgSend(v9, "count");
  v14 = objc_msgSend(v10, "count");
  v34 = v13;
  if (v13 > a4)
  {
    v15 = v14;
    v16 = 0;
    v32 = a6;
    v33 = a6 + a4;
    v17 = -1;
    v18 = a6;
    while (1)
    {
      objc_msgSend(v36, "objectAtIndexedSubscript:", a4, v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "tokenName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CESRUtilities getNormString:](CESRUtilities, "getNormString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v18;
      if (v15 > v18)
        break;
LABEL_8:
      if ((v16 & 1) != 0)
        goto LABEL_9;
      v16 = 0;
      v26 = v15;
LABEL_11:
      v27 = a4 - v33 + v22 + v26;
      if (v27 < v17)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v30 = objc_claimAutoreleasedReturnValue();

        if (!v27)
        {

          v35 = (id)v30;
          goto LABEL_17;
        }
        v35 = (id)v30;
        v17 = v27;
      }

      ++a4;
      v18 = v32;
      if (a4 == v34)
        goto LABEL_17;
    }
    v23 = v16;
    v22 = v18;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
        break;
      if (v15 == ++v22)
      {
        v22 = v15;
        v16 = v23;
        goto LABEL_8;
      }
    }
LABEL_9:
    v26 = 0;
    v16 = 1;
    goto LABEL_11;
  }
LABEL_17:

  return v35;
}

+ (void)logToPowerLogForEventCategory:(id)a3 eventDictionary:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(17, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__CESRUtilities_logToPowerLogForEventCategory_eventDictionary___block_invoke;
  v10[3] = &unk_1E6734D80;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

+ (void)generateABCSnapshotForType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  if (AFIsInternalInstall())
  {
    v9 = objc_alloc(MEMORY[0x1E0CFE9B0]);
    objc_msgSend(MEMORY[0x1E0CFE8E0], "defaultContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithInstanceContext:", v10);

    objc_msgSend(v11, "triggerABCForType:subType:context:completionHandler:", v12, v7, v8, &__block_literal_global_259);
  }

}

+ (BOOL)isTaskDictationSpecific:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dictation")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("WebSearch"));

  return v4;
}

+ (BOOL)isCommonUserWithReason:(id *)a3
{
  return 0;
}

+ (BOOL)keepANEModelLoaded
{
  return 0;
}

+ (BOOL)isSamplingSupportedForTask:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("Dictation"), CFSTR("WebSearch"), CFSTR("SearchOrMessaging"), CFSTR("SiriDictation"), CFSTR("Beto"), CFSTR("BetoDictation"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

void __60__CESRUtilities_generateABCSnapshotForType_subType_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "+[CESRUtilities generateABCSnapshotForType:subType:context:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_ERROR, "%s Unable to trigger ABC due to error %@.", (uint8_t *)&v4, 0x16u);
    }
  }

}

uint64_t __63__CESRUtilities_logToPowerLogForEventCategory_eventDictionary___block_invoke()
{
  return PLLogRegisteredEvent();
}

void __83__CESRUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  unint64_t v8;
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (v8 > (unint64_t)v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

id __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!objc_msgSend(v3, "count"))
  {
LABEL_6:
    v8 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_7;
  }
  v5 = objc_msgSend(v3, "count");
  if (v5 != objc_msgSend(v4, "count"))
  {
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[CESRUtilities AFSpeechInfoPackageForEARSpeechRecognitionResultPackage:]_block_invoke";
      _os_log_error_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_ERROR, "%s Count of command interpretation sets does not match count of speech recognition results", buf, 0xCu);
    }
    goto LABEL_6;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke_236;
  v14 = &unk_1E67340C8;
  v15 = v3;
  v16 = v6;
  v7 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v11);
  v8 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);

LABEL_7:
  return v8;
}

void __73__CESRUtilities_AFSpeechInfoPackageForEARSpeechRecognitionResultPackage___block_invoke_236(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  +[CESRUtilities earTokensToString:](CESRUtilities, "earTokensToString:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities afVoiceCommandGrammarParseResultForEARTokenString:withEARVoiceCommandInterpretations:](CESRUtilities, "afVoiceCommandGrammarParseResultForEARTokenString:withEARVoiceCommandInterpretations:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  void *v20;
  id v21;

  v18 = a2;
  if (objc_msgSend(v18, "presence") && objc_msgSend(v18, "presence") != 1)
    goto LABEL_7;
  objc_msgSend(v18, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CFEA98]);
    objc_msgSend(v18, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "initWithText:", v7);

LABEL_8:
    v17 = *(void **)(a1 + 32);
    +[CESRUtilities voiceCommandsParamKeyBuilder:](CESRUtilities, "voiceCommandsParamKeyBuilder:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v8, v16);
    goto LABEL_9;
  }
  objc_msgSend(v18, "indexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA98]), "initWithText:", &stru_1E67359A8);
    goto LABEL_8;
  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v18, "indexes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke_2;
  v19[3] = &unk_1E6734078;
  v20 = v11;
  v21 = *(id *)(a1 + 40);
  v8 = v11;
  objc_msgSend(v12, "enumerateRangesUsingBlock:", v19);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA98]), "initWithText:", v8);
  v14 = *(void **)(a1 + 32);
  +[CESRUtilities voiceCommandsParamKeyBuilder:](CESRUtilities, "voiceCommandsParamKeyBuilder:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v13, v15);

  v16 = v20;
LABEL_9:

}

void __102__CESRUtilities_afVoiceCommandGrammarParseResultForEARTokenString_withEARVoiceCommandInterpretations___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

}

void __35__CESRUtilities_earTokensToString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "hasSpaceBefore"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "tokenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  LODWORD(v4) = objc_msgSend(v3, "hasSpaceAfter");
  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
}

void __46__CESRUtilities_currentDictationLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (AFOfflineDictationStatusStringIsInstalled())
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

@end
