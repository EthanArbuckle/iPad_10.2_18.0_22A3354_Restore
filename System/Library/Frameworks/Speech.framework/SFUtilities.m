@implementation SFUtilities

+ (void)supportedLocalesWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void (**v14)(id, void *, void *);
  id obj;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = (void (**)(id, void *, void *))a3;
  AFPreferencesSupportedDictationLanguages();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = CFSTR("hi-IN-translit");
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v16, "addObject:", v11);
          objc_msgSend(v4, "addObject:", v10);
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("hi-IN")))
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8);
          v12 = v8;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v16, "addObject:", v13);
            objc_msgSend(v4, "addObject:", v12);
          }

          v8 = v12;
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v14[2](v14, v16, v4);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && SFLogInitIfNeeded_once != -1)
    dispatch_once(&SFLogInitIfNeeded_once, &__block_literal_global_2502);
}

+ (id)taskNameFromTaskHint:(int64_t)a3
{
  id result;

  result = CFSTR("Dictation");
  switch(a3)
  {
    case 1001:
      result = CFSTR("SearchOrMessaging");
      break;
    case 1002:
      result = CFSTR("VoiceMail");
      break;
    case 1003:
    case 1009:
    case 1010:
      return result;
    case 1004:
      result = CFSTR("Captioning");
      break;
    case 1005:
      result = CFSTR("DictationCC");
      break;
    case 1006:
      result = CFSTR("SpellCC");
      break;
    case 1007:
    case 1008:
      result = CFSTR("Tshot");
      break;
    case 1011:
      result = CFSTR("SiriDictation");
      break;
    default:
      if (a3 == 2)
        result = CFSTR("WebSearch");
      break;
  }
  return result;
}

+ (id)transcriptionFromSpeechPhrases:(id)a3 afAudioAnalytics:(id)a4 utteranceStart:(double)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  SFTranscriptionSegment *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  id v40;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  _QWORD *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[5];
  id v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v43 = a4;
  v8 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__1741;
  v94[4] = __Block_byref_object_dispose__1742;
  v95 = 0;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
  if (v9)
  {
    v47 = *(_QWORD *)v91;
    do
    {
      v48 = v9;
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v91 != v47)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v11, "interpretations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v86 = 0;
          v87 = &v86;
          v88 = 0x2020000000;
          v89 = 0;
          v89 = objc_msgSend(v49, "length");
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v8 + 3560), "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v8 + 3560), "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0;
          v83 = (double *)&v82;
          v84 = 0x2020000000;
          v85 = 0x7FEFFFFFFFFFFFFFLL;
          v78 = 0;
          v79 = (double *)&v78;
          v80 = 0x2020000000;
          v81 = 0x10000000000000;
          v74 = 0;
          v75 = &v74;
          v76 = 0x2020000000;
          v77 = 1065353216;
          v68 = 0;
          v69 = &v68;
          v70 = 0x3032000000;
          v71 = __Block_byref_object_copy__1741;
          v72 = __Block_byref_object_dispose__1742;
          v73 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v62 = 0;
          v63 = &v62;
          v64 = 0x3032000000;
          v65 = __Block_byref_object_copy__1741;
          v66 = __Block_byref_object_dispose__1742;
          v67 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v11, "interpretations");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke;
          v50[3] = &unk_1E6486138;
          v55 = &v82;
          v56 = &v78;
          v18 = v15;
          v51 = v18;
          v19 = v16;
          v52 = v19;
          v57 = v94;
          v20 = v49;
          v53 = v20;
          v58 = &v86;
          v21 = v14;
          v54 = v21;
          v59 = &v74;
          v60 = &v68;
          v61 = &v62;
          objc_msgSend(v17, "enumerateObjectsUsingBlock:", v50);

          v8 = 0x1E0C99000;
          if (v83[3] != 1.79769313e308 && v79[3] != 2.22507386e-308)
          {
            v22 = v87[3];
            v23 = objc_msgSend(v20, "length");
            v24 = v87[3];
            if (objc_msgSend((id)v69[5], "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v69[5]);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v45 = 0;
            }
            v44 = v22;
            if (objc_msgSend((id)v63[5], "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v63[5]);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = 0;
            }
            VoiceAnalyticsForSegment(v43, v83[3], v79[3]);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = [SFTranscriptionSegment alloc];
            v28 = v83[3];
            v29 = v28 + a5;
            v30 = v79[3];
            v31 = v30 - v28;
            LODWORD(v30) = *((_DWORD *)v75 + 6);
            v32 = -[SFTranscriptionSegment _initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:](v27, "_initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:", v21, v44, v23 - v24, v18, v19, v45, v29, v31, v30, v25, v26);
            objc_msgSend(v42, "addObject:", v32);

            v8 = 0x1E0C99000;
          }

          _Block_object_dispose(&v62, 8);
          _Block_object_dispose(&v68, 8);

          _Block_object_dispose(&v74, 8);
          _Block_object_dispose(&v78, 8);
          _Block_object_dispose(&v82, 8);

          _Block_object_dispose(&v86, 8);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
    }
    while (v9);
  }

  objc_msgSend(v43, "speechRecognitionFeatures");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", CFSTR("speakingRate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  v36 = v35;

  objc_msgSend(v33, "objectForKey:", CFSTR("averagePauseDuration"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v38;

  v40 = -[SFTranscription _initWithSegments:formattedString:speakingRate:averagePauseDuration:]([SFTranscription alloc], "_initWithSegments:formattedString:speakingRate:averagePauseDuration:", v42, v49, v36, v39);
  _Block_object_dispose(v94, 8);

  return v40;
}

+ (id)recognitionMetadataFromSpeechPhrases:(id)a3 afAudioAnalytics:(id)a4 utteranceStart:(double)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  SFSpeechRecognitionMetadata *v22;
  id v23;
  id v25;
  id obj;
  _QWORD v27[7];
  _QWORD v28[4];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v25 = a4;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0x7FEFFFFFFFFFFFFFLL;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0x10000000000000;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        v28[0] = 0;
        v28[1] = v28;
        v28[2] = 0x2020000000;
        v28[3] = 0x7FEFFFFFFFFFFFFFLL;
        v34[3] = 2.22507386e-308;
        objc_msgSend(v12, "interpretations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v10;
        v27[1] = 3221225472;
        v27[2] = __84__SFUtilities_recognitionMetadataFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke;
        v27[3] = &unk_1E6486160;
        v27[4] = v28;
        v27[5] = &v33;
        v27[6] = &v37;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v27);

        _Block_object_dispose(v28, 8);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v8);
  }

  VoiceAnalyticsForSegment(v25, v38[3], v34[3]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "speechRecognitionFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("speakingRate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(v15, "objectForKey:", CFSTR("averagePauseDuration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  v22 = [SFSpeechRecognitionMetadata alloc];
  v23 = -[SFSpeechRecognitionMetadata _initWithSpeechStartTimestamp:speechDuration:voiceAnalytics:speakingRate:averagePauseDuration:](v22, "_initWithSpeechStartTimestamp:speechDuration:voiceAnalytics:speakingRate:averagePauseDuration:", v14, v38[3] + a5, v34[3] - v38[3], v18, v21);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

+ (id)transcriptionsWithTokens:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  SFTranscriptionSegment *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id obj;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v25 = *(_QWORD *)v28;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        v10 = v7;
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v10
          && (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "removeSpaceBefore") & 1) == 0
          && (objc_msgSend(v10, "removeSpaceAfter") & 1) == 0)
        {
          objc_msgSend(v4, "appendString:", CFSTR(" "));
        }
        objc_msgSend(v11, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "length");
        v14 = objc_msgSend(v12, "length");
        objc_msgSend(v11, "startTime");
        v16 = v15;
        v17 = [SFTranscriptionSegment alloc];
        objc_msgSend(v11, "silenceStartTime");
        v19 = v18 - v16;
        *(float *)&v20 = (double)objc_msgSend(v11, "confidenceScore") * 0.001;
        v21 = -[SFTranscriptionSegment _initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:](v17, "_initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:", v12, v13, v14, v8, v8, v16, v19, v20, &stru_1E6486C88, 0);
        objc_msgSend(v26, "addObject:", v21);
        objc_msgSend(v4, "appendString:", v12);
        v7 = v11;

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);

  }
  v22 = -[SFTranscription _initWithSegments:formattedString:speakingRate:averagePauseDuration:]([SFTranscription alloc], "_initWithSegments:formattedString:speakingRate:averagePauseDuration:", v26, v4, 0.0, 0.0);

  return v22;
}

+ (id)recognizedResultFromPackage:(id)a3
{
  id v3;
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
  SFSpeechRecognitionResult *v16;
  uint64_t v17;
  id v18;

  v3 = a3;
  objc_msgSend(v3, "recognition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "utteranceStart");
  +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "rawRecognition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "phrases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "utteranceStart");
  +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "recognition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "phrases");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioAnalytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "utteranceStart");
  +[SFUtilities recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [SFSpeechRecognitionResult alloc];
  v17 = objc_msgSend(v3, "isFinal");

  v18 = -[SFSpeechRecognitionResult _initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:](v16, "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:", v7, v11, v17, v15);
  return v18;
}

+ (BOOL)isSpeechXPCEnabled
{
  if (isSpeechXPCEnabled_onceToken[0] != -1)
    dispatch_once(isSpeechXPCEnabled_onceToken, &__block_literal_global_155);
  return isSpeechXPCEnabled_result;
}

+ (BOOL)canAccessPathAt:(id)a3 methodName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v7);
  v11 = v10;
  if (a5 && (v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CFEB48];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to access path: %@ method:%@"), v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 203, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)issueReadWriteSandboxExtensionForDirectoryPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    v18 = v7;
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
    v31 = 2112;
    v32 = v19;
    v33 = 2112;
    v34 = v6;
    _os_log_debug_impl(&dword_1B2494000, v18, OS_LOG_TYPE_DEBUG, "%s %@: path=%@", buf, 0x20u);

  }
  v8 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v10 = objc_msgSend(v8, "canAccessPathAt:methodName:error:", v6, v9, &v28);
  v11 = v28;

  if (!v10)
  {
    v16 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v20 = v16;
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v11;
      _os_log_error_impl(&dword_1B2494000, v20, OS_LOG_TYPE_ERROR, "%s %@: Inaccessible file (%@) : error=%@", buf, 0x2Au);

      if (a4)
        goto LABEL_8;
    }
    else if (a4)
    {
LABEL_8:
      v15 = 0;
      *a4 = objc_retainAutorelease(v11);
      goto LABEL_15;
    }
    v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/"), v6);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = sandbox_extension_issue_file();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    free(v14);
  }
  else
  {
    v17 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      v26 = v17;
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
      v31 = 2112;
      v32 = v27;
      v33 = 2112;
      v34 = v12;
      _os_log_debug_impl(&dword_1B2494000, v26, OS_LOG_TYPE_DEBUG, "%s %@: sandbox_extension_issue_file() returned NULL. path=%@", buf, 0x20u);

    }
    v15 = 0;
  }

LABEL_15:
  v22 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    v24 = v22;
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "+[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:]";
    v31 = 2112;
    v32 = v25;
    v33 = 2112;
    v34 = v15;
    _os_log_debug_impl(&dword_1B2494000, v24, OS_LOG_TYPE_DEBUG, "%s %@: sandboxExtension=%@", buf, 0x20u);

  }
  return v15;
}

+ (id)issueReadSandboxExtensionForFilePath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    v20 = v7;
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
    v31 = 2112;
    v32 = v21;
    v33 = 2112;
    v34 = v6;
    _os_log_debug_impl(&dword_1B2494000, v20, OS_LOG_TYPE_DEBUG, "%s %@: path=%@", buf, 0x20u);

  }
  v8 = (void *)objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v10 = objc_msgSend(v8, "canAccessPathAt:methodName:error:", v6, v9, &v28);
  v11 = v28;

  if (v10)
  {
    v12 = objc_retainAutorelease(v6);
    objc_msgSend(v12, "UTF8String");
    v13 = sandbox_extension_issue_file();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      free(v14);
      goto LABEL_12;
    }
    v17 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      v26 = v17;
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
      v31 = 2112;
      v32 = v27;
      v33 = 2112;
      v34 = v12;
      _os_log_debug_impl(&dword_1B2494000, v26, OS_LOG_TYPE_DEBUG, "%s %@: sandbox_extension_issue_file() returned NULL. path=%@", buf, 0x20u);

    }
    goto LABEL_11;
  }
  v16 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    v24 = v16;
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
    v31 = 2112;
    v32 = v25;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = v11;
    _os_log_error_impl(&dword_1B2494000, v24, OS_LOG_TYPE_ERROR, "%s %@: Inaccessible file (%@) : error=%@", buf, 0x2Au);

    if (a4)
      goto LABEL_8;
  }
  else if (a4)
  {
LABEL_8:
    v15 = 0;
    *a4 = objc_retainAutorelease(v11);
    goto LABEL_12;
  }
LABEL_11:
  v15 = 0;
LABEL_12:
  v18 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    v22 = v18;
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "+[SFUtilities issueReadSandboxExtensionForFilePath:error:]";
    v31 = 2112;
    v32 = v23;
    v33 = 2112;
    v34 = v15;
    _os_log_debug_impl(&dword_1B2494000, v22, OS_LOG_TYPE_DEBUG, "%s %@: sandboxExtension=%@", buf, 0x20u);

  }
  return v15;
}

+ (BOOL)isCacheDirInternal
{
  char v2;
  void *v3;
  void *v4;

  v2 = 1;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("/var/mobile/Library/Caches")) & 1) == 0)
    v2 = objc_msgSend(v4, "hasPrefix:", CFSTR("/private/var/mobile/Library/Caches"));

  return v2;
}

+ (id)sandboxExtensionsForUsingANEAndAssets
{
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[SFUtilities isCacheDirInternal](SFUtilities, "isCacheDirInternal"))
  {
    v2 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = "+[SFUtilities sandboxExtensionsForUsingANEAndAssets]";
      _os_log_debug_impl(&dword_1B2494000, v2, OS_LOG_TYPE_DEBUG, "%s Sandbox extension Cache directories not needed.", (uint8_t *)&v9, 0xCu);
    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.speech.localspeechrecognition"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFUtilities createDirPath:](SFUtilities, "createDirPath:", v7);
    +[SFUtilities issueReadWriteSandboxExtensionForDirectoryPath:error:](SFUtilities, "issueReadWriteSandboxExtensionForDirectoryPath:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v4, "addObject:", v8);

    return v4;
  }
}

+ (void)createDirPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0) & 1) == 0)
  {
    v8 = 0;
    v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v8);
    v6 = v8;
    v7 = SFLogFramework;
    if ((v5 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "+[SFUtilities createDirPath:]";
        v11 = 2112;
        v12 = v3;
        _os_log_debug_impl(&dword_1B2494000, v7, OS_LOG_TYPE_DEBUG, "%s Write successful %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "+[SFUtilities createDirPath:]";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1B2494000, v7, OS_LOG_TYPE_INFO, "%s Failed to create directory %@", buf, 0x16u);
    }

  }
}

+ (id)defaultClientID
{
  if (defaultClientID_onceToken[0] != -1)
    dispatch_once(defaultClientID_onceToken, &__block_literal_global_168);
  return (id)defaultClientID_defaultClientID;
}

+ (id)stringByReplacingUnderscoresWithHyphens:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
}

+ (id)stringByReplacingHyphensWithUnderscores:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
}

+ (id)languageCodeForLocaleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localeCodeForLocale:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *MEMORY[0x1E0C997E8];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  +[SFUtilities _firstSeenPartialResultIndicesForTokens:firstSeenPartialResultTokens:](SFUtilities, "_firstSeenPartialResultIndicesForTokens:firstSeenPartialResultTokens:", v5, v6);
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
      v32 = __Block_byref_object_copy__1741;
      v33 = __Block_byref_object_dispose__1742;
      v34 = &unk_1E6498798;
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToNumber:", &unk_1E6498798);

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
          +[SFUtilities getNormString:](SFUtilities, "getNormString:", v19);
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
            v28[2] = __81__SFUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke;
            v28[3] = &unk_1E64861C8;
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
      +[SFUtilities _alignTokenToFirstSeenPartialResult:tokenIndex:firstSeenPartialResultTokens:firstSeenPartialResultIndex:](SFUtilities, "_alignTokenToFirstSeenPartialResult:tokenIndex:firstSeenPartialResultTokens:firstSeenPartialResultIndex:", v24, v12, v23, v11);
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
          objc_msgSend(v7, "addObject:", &unk_1E6498798);
          --v20;
        }
        while (v20);
      }
      if (v19 >= v10)
      {
        objc_msgSend(v7, "addObject:", &unk_1E6498798);
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
      +[SFUtilities getNormString:](SFUtilities, "getNormString:", v20);
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

  v9 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    v16 = "+[SFUtilities speechProfileRootDirectories]";
    v17 = 2113;
    v18 = v2;
    _os_log_debug_impl(&dword_1B2494000, v9, OS_LOG_TYPE_DEBUG, "%s Root directories for new type of speech profile: %{private}@", buf, 0x16u);
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
    v25 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "+[SFUtilities speechProfilePathsWithLanguage:]";
      _os_log_error_impl(&dword_1B2494000, v25, OS_LOG_TYPE_ERROR, "%s speechProfilePathsWithLanguage was incorrectly called with language=nil", buf, 0xCu);
    }
    goto LABEL_27;
  }
  v5 = v4;
  +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SFReplacementLocaleCodeForLocaleIdentifier(v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  if (!v10)
  {
    v26 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "+[SFUtilities speechProfilePathsWithLanguage:]";
      _os_log_fault_impl(&dword_1B2494000, v26, OS_LOG_TYPE_FAULT, "%s Mapped language=nil", buf, 0xCu);
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
  id v9;
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
  uint64_t v40;
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
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      v40 = *MEMORY[0x1E0CB2A88];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "attributesOfItemAtPath:error:", v14, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v17, "objectForKey:", v40);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "timeIntervalSinceReferenceDate");
              v20 = v19;
              objc_msgSend(v15, "loadDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "timeIntervalSinceReferenceDate");
              v23 = v22;

              if (v20 > 0.0 && v23 > 0.0 && v20 <= v23)
              {
                objc_msgSend(v39, "setObject:forKey:", v15, v14);
                v25 = SFLogFramework;
                if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315395;
                  v50 = "+[SFUtilities loadSpeechProfiles:language:]";
                  v51 = 2113;
                  v52 = v14;
                  _os_log_debug_impl(&dword_1B2494000, v25, OS_LOG_TYPE_DEBUG, "%s Reused new type of speech profile: path=%{private}@", buf, 0x16u);
                }
              }

            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      }
      while (v11);
    }

    objc_msgSend(v6, "removeAllObjects");
    objc_msgSend(v6, "addEntriesFromDictionary:", v39);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = v9;
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
          objc_msgSend(v6, "objectForKey:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F190]), "initWithPath:error:", v31, 0);
            v35 = SFLogFramework;
            if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315651;
              v50 = "+[SFUtilities loadSpeechProfiles:language:]";
              v51 = 2113;
              v52 = v31;
              v53 = 1024;
              v54 = v34 != 0;
              _os_log_debug_impl(&dword_1B2494000, v35, OS_LOG_TYPE_DEBUG, "%s Loaded new type of speech profile: path=%{private}@ profile=%d", buf, 0x1Cu);
              if (v34)
              {
LABEL_28:
                objc_msgSend(v34, "setLoadDate:", v33);
                objc_msgSend(v6, "setObject:forKey:", v34, v31);
              }
            }
            else if (v34)
            {
              goto LABEL_28;
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
    v37 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "+[SFUtilities loadSpeechProfiles:language:]";
      _os_log_fault_impl(&dword_1B2494000, v37, OS_LOG_TYPE_FAULT, "%s loadSpeechProfiles was incorrectly called with profiles=nil", buf, 0xCu);
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

    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2A88]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isGeneralASRSupportedOnDevice
{
  if (isGeneralASRSupportedOnDevice_onceToken != -1)
    dispatch_once(&isGeneralASRSupportedOnDevice_onceToken, &__block_literal_global_185);
  return isGeneralASRSupportedOnDevice_isSupported;
}

+ (BOOL)_isDeviceH13Plus
{
  if (_isDeviceH13Plus_onceToken != -1)
    dispatch_once(&_isDeviceH13Plus_onceToken, &__block_literal_global_186);
  return _isDeviceH13Plus_isH13Plus;
}

+ (unint64_t)cooldownTimerTimeoutSeconds
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (SFIsInternalInstall_onceToken != -1)
    dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1717);
  if (SFIsInternalInstall_isInternal)
  {
    _AFPreferencesValueForKeyWithContext();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_msgSend(v2, "unsignedIntegerValue");
    else
      v3 = 120;

  }
  else
  {
    v3 = 120;
  }
  v4 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "+[SFUtilities cooldownTimerTimeoutSeconds]";
    v8 = 2048;
    v9 = v3;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "%s On-Device ASR: Cooldown scheduled for %zus.", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

+ (id)languageStringForLocaleString:(id)a3
{
  return +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", a3);
}

+ (id)localeStringForLanguageString:(id)a3
{
  return +[SFUtilities stringByReplacingHyphensWithUnderscores:](SFUtilities, "stringByReplacingHyphensWithUnderscores:", a3);
}

+ (id)languageCodeStringForLanguageString:(id)a3
{
  return +[SFUtilities languageCodeForLocaleIdentifier:](SFUtilities, "languageCodeForLocaleIdentifier:", a3);
}

void __31__SFUtilities__isDeviceH13Plus__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  size_t v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v0 = (void *)get_ANEDeviceInfoClass_softClass;
  v10 = get_ANEDeviceInfoClass_softClass;
  if (!get_ANEDeviceInfoClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __get_ANEDeviceInfoClass_block_invoke;
    v6[3] = &unk_1E6486230;
    v6[4] = &v7;
    __get_ANEDeviceInfoClass_block_invoke((uint64_t)v6);
    v0 = (void *)v8[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v1, "aneSubType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capitalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = strlen((const char *)objc_msgSend(CFSTR("H"), "fileSystemRepresentation"))
     + objc_msgSend(v3, "rangeOfString:", CFSTR("H"));
  objc_msgSend(v3, "substringWithRange:", v4, objc_msgSend(v3, "length") - v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  _isDeviceH13Plus_isH13Plus = atoi((const char *)objc_msgSend(v5, "fileSystemRepresentation")) > 12;

}

BOOL __44__SFUtilities_isGeneralASRSupportedOnDevice__block_invoke()
{
  _BOOL8 result;

  result = +[SFUtilities _isDeviceH13Plus](SFUtilities, "_isDeviceH13Plus");
  if (result)
    isGeneralASRSupportedOnDevice_isSupported = 1;
  return result;
}

void __81__SFUtilities_alignedPartialResultIndicesForTokens_firstSeenPartialResultTokens___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

void __30__SFUtilities_defaultClientID__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_storeStrong((id *)&defaultClientID_defaultClientID, v1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "processName");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)defaultClientID_defaultClientID;
    defaultClientID_defaultClientID = v3;

    v5 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315394;
      v7 = "+[SFUtilities defaultClientID]_block_invoke";
      v8 = 2112;
      v9 = defaultClientID_defaultClientID;
      _os_log_fault_impl(&dword_1B2494000, v5, OS_LOG_TYPE_FAULT, "%s Application does not have a bundle identifier; using unstable \"%@\" as client identifier",
        (uint8_t *)&v6,
        0x16u);
    }
  }

}

uint64_t __33__SFUtilities_isSpeechXPCEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    isSpeechXPCEnabled_result = 1;
  return result;
}

void __84__SFUtilities_recognitionMetadataFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
        objc_msgSend(v8, "startTime");
        if (v9 < v10)
          v10 = v9;
        *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = v10;
        v11 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
        objc_msgSend(v8, "silenceStartTime");
        if (v11 >= v12)
          v12 = v11;
        *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v13 = *(_QWORD *)(a1[6] + 8);
  if (*(double *)(v13 + 24) == 1.79769313e308)
    *(_QWORD *)(v13 + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);

}

void __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t k;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        objc_msgSend(v10, "startTime");
        if (v11 < v12)
          v12 = v11;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v12;
        v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        objc_msgSend(v10, "silenceStartTime");
        if (v13 >= v14)
          v14 = v13;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v14;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v7);
  }
  if (a3)
  {
    v15 = *(void **)(a1 + 32);
    v16 = v5;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v19)
    {
      v20 = v19;
      v39 = v15;
      v21 = 0;
      v22 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          v24 = v21;
          if (*(_QWORD *)v52 != v22)
            objc_enumerationMutation(v18);
          v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          if (v24
            && (objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "removeSpaceBefore") & 1) == 0
            && (objc_msgSend(v24, "removeSpaceAfter") & 1) == 0)
          {
            objc_msgSend(v17, "appendString:", CFSTR(" "));
          }
          objc_msgSend(v25, "text", v39);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendString:", v26);
          v21 = v25;

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v20);

      v15 = v39;
    }

    v27 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v15, "addObject:", v27);

    v28 = *(void **)(a1 + 40);
    v29 = (void *)MEMORY[0x1E0CB37E8];
    v30 = v18;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v52;
      v34 = 1.0;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v52 != v33)
            objc_enumerationMutation(v30);
          v34 = v34 * ((double)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "confidenceScore") * 0.001);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v32);
    }
    else
    {
      v34 = 1.0;
    }

    objc_msgSend(v29, "numberWithDouble:", v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v38);
  }
  else
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke_2;
    v40[3] = &unk_1E6486110;
    v43 = *(_QWORD *)(a1 + 80);
    v36 = *(id *)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 88);
    v41 = v36;
    v44 = v37;
    v42 = *(id *)(a1 + 56);
    v45 = *(_OWORD *)(a1 + 96);
    v46 = *(_QWORD *)(a1 + 112);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v40);

    v38 = v41;
  }

}

void __78__SFUtilities_transcriptionFromSpeechPhrases_afAudioAnalytics_utteranceStart___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_msgSend(v12, "removeSpaceBefore") & 1) == 0
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeSpaceAfter") & 1) == 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
      if (!a3)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        goto LABEL_8;
      }
    }
    else if (!a3)
    {
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(" "));
  }
LABEL_8:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(v12, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 40), "appendString:", v6);
  v7 = objc_msgSend(v12, "confidenceScore");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = (double)v7 * 0.001 * *(float *)(v8 + 24);
  *(float *)(v8 + 24) = v9;
  objc_msgSend(v12, "phoneSequence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isEqualToString:", &stru_1E6486C88) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "appendString:", CFSTR(" "));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "appendString:", v10);
  }
  objc_msgSend(v12, "ipaPhoneSequence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "isEqualToString:", &stru_1E6486C88) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "appendString:", CFSTR("."));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "appendString:", v11);
  }

}

@end
