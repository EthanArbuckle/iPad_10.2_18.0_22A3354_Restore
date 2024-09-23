@implementation SGMIFollowUpAnalyzer

+ (id)analyzeFeatureVector:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  sgMailIntelligenceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "messageId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412547;
    v13 = v5;
    v14 = 2117;
    v15 = v3;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeFeatureVector] Analyze Feature Vector with messageId %@. Feature Vector: %{sensitive}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(v3, "mailMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isSent") & 1) != 0)
    +[SGMIFollowUpAnalyzer analyzeOutgoingMailFeatureVector:](SGMIFollowUpAnalyzer, "analyzeOutgoingMailFeatureVector:", v3);
  else
    +[SGMIFollowUpAnalyzer analyzeIncomingMailFeatureVector:](SGMIFollowUpAnalyzer, "analyzeIncomingMailFeatureVector:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  sgMailIntelligenceLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138739971;
    v13 = v7;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeFeatureVector] Storing Detection Stats for Warning  %{sensitive}@", (uint8_t *)&v12, 0xCu);
  }

  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sgmiFeatureStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateFollowUpDetectionStatsWithWarning:", v7);

  return v7;
}

+ (id)analyzeBody:(id)a3 forLanguage:(id)a4 forDate:(id)a5 withCustomTimeRange:(BOOL)a6
{
  id v8;
  id v9;
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
  SGSimpleMailMessage *v31;
  SGMIFeatureVector *v32;
  void *v33;
  SGMIFeatureVector *v34;
  void *v35;
  _BOOL4 v38;
  _QWORD v39[5];
  _QWORD v40[6];

  v38 = a6;
  v40[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "detectors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "followUpOnOutgoingMailsQuestions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v11, "detectors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "followUpOnOutgoingMailsQuestions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "body");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, &unk_1E7E0BEE8);

  }
  objc_msgSend(v11, "detectors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "followUpOnOutgoingMailsAsks");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "body");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v11, "detectors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "followUpOnOutgoingMailsAsks");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "body");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, &unk_1E7E0BF00);

  }
  v39[0] = CFSTR("body");
  v39[1] = CFSTR("isSent");
  v40[0] = v8;
  v40[1] = MEMORY[0x1E0C9AAB0];
  v39[2] = CFSTR("messageId");
  v39[3] = CFSTR("appleMailMessageId");
  v40[2] = &stru_1E7DB83A8;
  v40[3] = &stru_1E7DB83A8;
  v39[4] = CFSTR("date");
  v29 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[4] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)

  v31 = -[SGSimpleMailMessage initWithMessageDictionary:]([SGSimpleMailMessage alloc], "initWithMessageDictionary:", v30);
  v32 = [SGMIFeatureVector alloc];
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:](v32, "initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:", &stru_1E7DB83A8, 0, v31, &unk_1E7E0BF18, 0, v33, &unk_1E7E10740);

  objc_msgSend(a1, "_analyzeFeatureVector:withRegExpDictionary:forOutgoingMail:withDetectedLanguage:withRegExLanguage:withCustomTimeRange:", v34, v12, 1, v9, v9, v38);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)_analyzeFeatureVector:(id)a3 withRegExpDictionary:(id)a4 forOutgoingMail:(BOOL)a5 withDetectedLanguage:(id)a6 withRegExLanguage:(id)a7 withCustomTimeRange:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
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
  BOOL v56;
  NSObject *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  _BOOL4 v87;
  id v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  _QWORD *v100;
  uint64_t *v101;
  uint64_t *v102;
  _BYTE *v103;
  BOOL v104;
  BOOL v105;
  _QWORD v106[5];
  id v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  uint8_t v120[4];
  void *v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  _BYTE buf[24];
  uint64_t (*v129)(uint64_t, uint64_t);
  __int128 v130;
  uint64_t v131;

  v8 = a8;
  v87 = a5;
  v131 = *MEMORY[0x1E0C80C00];
  v91 = a3;
  v90 = a4;
  v88 = a6;
  v12 = a7;
  sgMailIntelligenceLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v91, "messageId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412803;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2117;
    *(_QWORD *)&buf[14] = v91;
    *(_WORD *)&buf[22] = 2112;
    v129 = v15;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Analyze Feature Vector for messageId %@. Feature Vector: %{sensitive}@ with CustomRange %@", buf, 0x20u);

  }
  +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sgMailIntelligenceLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v16;
    _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] SGMIConfig loaded: %@", buf, 0xCu);
  }

  objc_msgSend(v91, "mailMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = v12;
  if (v90 && v16 && v19)
  {
    objc_msgSend(v16, "followUpWarningsParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", safeguardingQuotedRegionsRegex);
    v86 = objc_claimAutoreleasedReturnValue();

    v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v86, 1, 0);
    objc_msgSend(v85, "firstMatchInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v21;
    if (v21)
      v22 = objc_msgSend(v21, "range");
    else
      v22 = objc_msgSend(v19, "length");
    objc_msgSend(v19, "substringToIndex:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v129 = __Block_byref_object_copy__8083;
    *(_QWORD *)&v130 = __Block_byref_object_dispose__8084;
    *((_QWORD *)&v130 + 1) = 0;
    v114 = 0;
    v115 = &v114;
    v116 = 0x3032000000;
    v117 = __Block_byref_object_copy__8083;
    v118 = __Block_byref_object_dispose__8084;
    v119 = 0;
    objc_msgSend(v91, "mailMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v119 = v29;

    v108 = 0;
    v109 = &v108;
    v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__8083;
    v112 = __Block_byref_object_dispose__8084;
    v113 = 0;
    v30 = (void *)v115[5];
    objc_msgSend(v16, "defaultTimeIntervalToStartWarningExposition");
    objc_msgSend(v30, "dateByAddingTimeInterval:");
    v113 = (id)objc_claimAutoreleasedReturnValue();
    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x3032000000;
    v106[3] = __Block_byref_object_copy__8083;
    v106[4] = __Block_byref_object_dispose__8084;
    v107 = 0;
    v107 = (id)v109[5];
    if (objc_msgSend(v19, "length"))
    {
      v31 = (void *)MEMORY[0x1C3BD4F6C]();
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v19, "length"));
      objc_msgSend(v91, "mailMessage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "quotedRegions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeIndexes:", v34);

      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke;
      v92[3] = &unk_1E7DAAA60;
      v35 = v32;
      v93 = v35;
      v94 = v19;
      v104 = v8;
      v95 = v91;
      v100 = v106;
      v101 = &v108;
      v96 = v16;
      v97 = v89;
      v102 = &v114;
      v105 = v87;
      v103 = buf;
      v98 = v97;
      v99 = v88;
      objc_msgSend(v90, "enumerateKeysAndObjectsUsingBlock:", v92);

      objc_autoreleasePoolPop(v31);
    }
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "snippet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
      goto LABEL_27;
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "signature");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "detectedLanguage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39 == 0;

        if (!v40)
        {
          sgMailIntelligenceLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v120 = 138739971;
            v121 = v42;
            _os_log_impl(&dword_1C3607000, v41, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exiting the method. Warning found %{sensitive}@", v120, 0xCu);
          }
LABEL_30:

          objc_msgSend(MEMORY[0x1E0D198F0], "followUpTimeRangeForDebugging");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count") == 0;

          if (!v56)
          {
            sgMailIntelligenceLogHandle();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v58 = *(void **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v120 = 138739971;
              v121 = v58;
              _os_log_impl(&dword_1C3607000, v57, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] followUpTimeRangeForDebugging was set in defaults settings. Overriding the custom time range for warning %{sensitive}@", v120, 0xCu);
            }

            objc_msgSend(v16, "defaultTimeIntervalToStartWarningExposition");
            v60 = v59;
            objc_msgSend(v16, "defaultTimeIntervalForAWarning");
            v62 = v61;
            objc_msgSend(MEMORY[0x1E0D198F0], "followUpTimeRangeForDebugging");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("startOffset"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            if (v64)
            {
              objc_msgSend(MEMORY[0x1E0D198F0], "followUpTimeRangeForDebugging");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("startOffset"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "doubleValue");
              v60 = v67;

            }
            objc_msgSend(MEMORY[0x1E0D198F0], "followUpTimeRangeForDebugging");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("endOffset"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
            {
              objc_msgSend(MEMORY[0x1E0D198F0], "followUpTimeRangeForDebugging");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("endOffset"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "doubleValue");
              v62 = v72;

            }
            objc_msgSend((id)v115[5], "dateByAddingTimeInterval:", v60);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "dateByAddingTimeInterval:", v62);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "type");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_alloc(MEMORY[0x1E0D19868]);
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "snippet");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "core");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "signature");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v76, "initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:startDate:startDateCore:endDate:endDateCore:", v77, v78, v79, v88, !v87, &unk_1E7E0BF60, v73, 0, v74, 0);
            v81 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v80;

            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setType:", v75);
          }
          v24 = *(id *)(*(_QWORD *)&buf[8] + 40);
          _Block_object_dispose(v106, 8);

          _Block_object_dispose(&v108, 8);
          _Block_object_dispose(&v114, 8);

          _Block_object_dispose(buf, 8);
          v23 = v86;
          goto LABEL_39;
        }
LABEL_27:
        sgMailIntelligenceLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "snippet");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "numberWithInt:", v83 == 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "signature");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "numberWithInt:", v47 == 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "detectedLanguage");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "numberWithInt:", v50 == 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "startDate");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "numberWithInt:", v53 == 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v120 = 138413058;
          v121 = v45;
          v122 = 2112;
          v123 = v48;
          v124 = 2112;
          v125 = v51;
          v126 = 2112;
          v127 = v54;
          _os_log_impl(&dword_1C3607000, v43, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Warning not raised, as one of the following is nil. isNil_snippet: %@, isNil_signature: %@, isNil_detectedLanguage: %@, isNil_startDate: %@", v120, 0x2Au);

        }
        v41 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
        goto LABEL_30;
      }

    }
    goto LABEL_27;
  }
  sgMailIntelligenceLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413059;
    *(_QWORD *)&buf[4] = v89;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2117;
    v129 = (uint64_t (*)(uint64_t, uint64_t))v19;
    LOWORD(v130) = 2112;
    *(_QWORD *)((char *)&v130 + 2) = v90;
    _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Aborting computation. Language %@, Config %@, Body %{sensitive}@, RegExpDictionary %@", buf, 0x2Au);
  }
  v24 = 0;
LABEL_39:

  return v24;
}

+ (id)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sgMailIntelligenceLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138740483;
    v16 = v8;
    v17 = 2117;
    v18 = v9;
    v19 = 2117;
    v20 = v10;
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "Follow Up. [identifyFollowUpWarningFromSubject:body:date] Computing warning for subject: %{sensitive}@ body:%{sensitive}@ date:%{sensitive}@", (uint8_t *)&v15, 0x20u);
  }

  if (v10)
  {
    objc_msgSend(a1, "analyzeForFollowUpMailWithBody:isSent:messageId:date:", v9, 1, &stru_1E7DB83A8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "analyzeForFollowUpMailWithBody:isSent:messageId:date:", v9, 1, &stru_1E7DB83A8, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)analyzeForFollowUpMailWithBody:(id)a3 isSent:(BOOL)a4 messageId:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  dispatch_block_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[16];
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  id v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken30 != -1)
    dispatch_once(&analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken30, &__block_literal_global_8082);
  v13 = (id)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__8083;
  v39 = __Block_byref_object_dispose__8084;
  v40 = 0;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2;
  block[3] = &unk_1E7DAAAA8;
  v32 = &v35;
  v33 = a1;
  v15 = v10;
  v29 = v15;
  v34 = a4;
  v16 = v11;
  v30 = v16;
  v17 = v12;
  v31 = v17;
  v18 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_async(v13, v18);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForBlock:timeoutSeconds:", v18, 0.25) == 1)
  {
    sgMailIntelligenceLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGMIFollowUpAnalyzer: Mail Intelligence's SPI back end timed out", buf, 2u);
    }

    if (analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken32 != -1)
      dispatch_once(&analyzeForFollowUpMailWithBody_isSent_messageId_date___pasOnceToken32, &__block_literal_global_67);
    v20 = (id)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult_65;
    v21 = (void *)MEMORY[0x1E0D81598];
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2_69;
    v24[3] = &unk_1E7DB7578;
    v26 = v18;
    v25 = v15;
    objc_msgSend(v21, "runAsyncOnQueue:afterDelaySeconds:block:", v20, v24, 5.0);

    v22 = 0;
  }
  else
  {
    v22 = (id)v36[5];
  }

  _Block_object_dispose(&v35, 8);
  return v22;
}

+ (id)_analyzeForFollowUpMailWithBody:(id)a3 isSent:(BOOL)a4 messageId:(id)a5 date:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  SGSimpleMailMessage *v15;
  SGMIFeatureVector *v16;
  void *v17;
  SGMIFeatureVector *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v8 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v9 && v10 && v11)
  {
    v23[0] = v9;
    v22[0] = CFSTR("body");
    v22[1] = CFSTR("isSent");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    v23[2] = v10;
    v22[2] = CFSTR("messageId");
    v22[3] = CFSTR("appleMailMessageId");
    v22[4] = CFSTR("date");
    v23[3] = &stru_1E7DB83A8;
    v23[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = -[SGSimpleMailMessage initWithMessageDictionary:]([SGSimpleMailMessage alloc], "initWithMessageDictionary:", v14);
    v16 = [SGMIFeatureVector alloc];
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:](v16, "initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:", v10, 0, v15, &unk_1E7E0BF18, 0, v17, &unk_1E7E10758);

    +[SGMIFollowUpAnalyzer analyzeFeatureVector:](SGMIFollowUpAnalyzer, "analyzeFeatureVector:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sgMailIntelligenceLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 == 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138740739;
      v25 = v9;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeForFollowUpMailWithBody:isSent:messageId:date] Can't initialize mailDictionary: nil object. body: %{sensitive}@, isNil_body: %@, messageId: %@, date: %@", buf, 0x2Au);

    }
    v19 = 0;
  }

  return v19;
}

+ (id)analyzeOutgoingMailFeatureVector:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_opt_new();
    objc_msgSend(v4, "mailMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textContentLanguageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v5, "detectors"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "objectForKeyedSubscript:", v8),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      v13 = v8;

      v10 = v13;
    }
    else if (!v10)
    {
LABEL_10:
      sgMailIntelligenceLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject description](v6, "description");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138412802;
        v43 = v8;
        v44 = 2112;
        v45 = v10;
        v46 = 2112;
        v47 = v31;
        _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeOutgoingMailFeatureVector] detectedLanguage: %@ regExLanguage %@ regexes loaded: %@", (uint8_t *)&v42, 0x20u);

      }
      objc_msgSend(v5, "followUpWarningsParameters");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", computeCustomTimeRange);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "BOOLValue");

      objc_msgSend(MEMORY[0x1E0D198F0], "followUpComputeCustomTimeRangeForLanguage:", v10);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(MEMORY[0x1E0D198F0], "followUpComputeCustomTimeRangeForLanguage:", v10);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v37, "BOOLValue");

        sgMailIntelligenceLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138412290;
          v43 = v39;
          _os_log_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEFAULT, "[Follow Up] CustomTimeRange behavior specified in asset overriden by default setting. Value: %@", (uint8_t *)&v42, 0xCu);

        }
      }
      objc_msgSend(a1, "_analyzeFeatureVector:withRegExpDictionary:forOutgoingMail:withDetectedLanguage:withRegExLanguage:withCustomTimeRange:", v4, v6, 1, v8, v10, v35);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    objc_msgSend(v5, "detectors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "followUpOnOutgoingMailsQuestions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "body");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v5, "detectors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "followUpOnOutgoingMailsQuestions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "body");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v21, &unk_1E7E0BEE8);

    }
    objc_msgSend(v5, "detectors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "followUpOnOutgoingMailsAsks");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "body");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v5, "detectors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "followUpOnOutgoingMailsAsks");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "body");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v29, &unk_1E7E0BF00);

    }
    goto LABEL_10;
  }
  sgMailIntelligenceLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v42) = 0;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "Follow Up. [analyzeOutgoingMailFeatureVector] nil config. Follow Up processing aborted.", (uint8_t *)&v42, 2u);
  }
  v40 = 0;
LABEL_20:

  return v40;
}

+ (id)analyzeIncomingMailFeatureVector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SGMIConfig defaultConfig](SGMIConfig, "defaultConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContentLanguageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v5, "detectors"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKeyedSubscript:", v7),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = v7;

    v9 = v12;
  }
  else if (!v9)
  {
    goto LABEL_7;
  }
  objc_msgSend(v5, "detectors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "followUpOnIncomingMails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v34 = &unk_1E7E0BF78;
    objc_msgSend(v5, "detectors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "followUpOnIncomingMails");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "body");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
LABEL_7:
  v21 = (void *)MEMORY[0x1E0C9AA70];
LABEL_8:
  objc_msgSend(v5, "followUpWarningsParameters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", computeCustomTimeRange);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0D198F0], "followUpComputeCustomTimeRangeForLanguage:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0D198F0], "followUpComputeCustomTimeRangeForLanguage:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v27, "BOOLValue");

    sgMailIntelligenceLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v29;
      _os_log_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEFAULT, "[Follow Up] CustomTimeRange behavior specified in asset overriden by default setting. Value: %@", (uint8_t *)&v32, 0xCu);

    }
  }
  objc_msgSend(a1, "_analyzeFeatureVector:withRegExpDictionary:forOutgoingMail:withDetectedLanguage:withRegExLanguage:withCustomTimeRange:", v4, v21, 0, v7, v9, v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (void)reportUserEngagement:(int64_t)a3 forWarning:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];
  uint8_t buf[4];
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  sgMailIntelligenceLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = &unk_1E7E0BF90;
    v12[1] = &unk_1E7E0BFA8;
    v13[0] = CFSTR("positive");
    v13[1] = CFSTR("negative");
    v12[2] = &unk_1E7E0BFC0;
    v13[2] = CFSTR("no engagement");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = (int64_t)v9;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGMI received %@ feedback for follow up warning", buf, 0xCu);

  }
  if ((unint64_t)a3 > 1)
  {
    sgMailIntelligenceLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a3;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "[Follow Up] Engagement type %ld received is not supported.", buf, 0xCu);
    }
  }
  else
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject sgmiFeatureStore](v10, "sgmiFeatureStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementUserEngagement:forFollowUpWarning:", a3 == 1, v5);

  }
}

+ (void)logFollowUpStatsAndSetting
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sgmiFeatureStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSDateForKey:", CFSTR("lastSGMIFollowUpStatsAndSettingReportingDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_2:
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v5 >= -2419200.0)
      goto LABEL_15;
    goto LABEL_8;
  }
  objc_msgSend(v2, "getNSDateForKey:", CFSTR("lastSGMIFollowUpStatsAndSettingReportingDate"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v3, "setNSDate:forKey:", v6, CFSTR("lastSGMIFollowUpStatsAndSettingReportingDate"));
    objc_msgSend(v3, "getNSDateForKey:", CFSTR("lastSGMIFollowUpStatsAndSettingReportingDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_15;
    objc_msgSend(v2, "deleteValueForKey:", CFSTR("lastSGMIFollowUpStatsAndSettingReportingDate"));
    goto LABEL_2;
  }
  v4 = 0;
LABEL_8:
  objc_msgSend(v2, "sgmiFeatureStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "followUpWarningStats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v11 = (void *)objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x1E0D1E0A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E0D1E020]) ^ 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sgMailIntelligenceLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v12, "BOOLValue");
      v15 = CFSTR("disabled");
      if (v14)
        v15 = CFSTR("enabled");
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGMIFollowUpManager Sending an event to CoreAnalytics: FollowUp is %@", buf, 0xCu);
    }

    v18 = MEMORY[0x1E0C809B0];
    v19 = v12;
    v20 = v9;
    v16 = v12;
    AnalyticsSendEventLazy();
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v18, 3221225472, __50__SGMIFollowUpAnalyzer_logFollowUpStatsAndSetting__block_invoke, &unk_1E7DAAAF0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNSDate:forKey:", v17, CFSTR("lastSGMIFollowUpStatsAndSettingReportingDate"));

  }
LABEL_15:

}

id __50__SGMIFollowUpAnalyzer_logFollowUpStatsAndSetting__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v10[0] = v3;
  v9[0] = CFSTR("enabled");
  v9[1] = CFSTR("positiveEngagement");
  objc_msgSend(v2, "positiveEngagement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("noEngagement");
  objc_msgSend(*(id *)(a1 + 40), "noEngagement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("negativeEngagement");
  objc_msgSend(*(id *)(a1 + 40), "negativeEngagement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 64), "_analyzeForFollowUpMailWithBody:isSent:messageId:date:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_2_69(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(MEMORY[0x1E0D81598], "waitForBlock:timeoutSeconds:", *(_QWORD *)(a1 + 40), 0.0);
  if ((_DWORD)result == 1)
  {
    sgMailIntelligenceLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "length");
      v5 = 134217984;
      v6 = v4;
      _os_log_fault_impl(&dword_1C3607000, v3, OS_LOG_TYPE_FAULT, "SGMIFollowUpAnalyzer: Mail Intelligence's SPI back took over 5 seconds on a %tu-lengthed content: we have to xpc_transaction_exit_clean", (uint8_t *)&v5, 0xCu);
    }

    return xpc_transaction_exit_clean();
  }
  return result;
}

void __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke_66()
{
  void *v0;
  dispatch_queue_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = dispatch_queue_create("SGMIFollowUpAnalyzer-timeout", 0);
  v2 = (void *)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult_65;
  analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult_65 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __77__SGMIFollowUpAnalyzer_analyzeForFollowUpMailWithBody_isSent_messageId_date___block_invoke()
{
  void *v0;
  dispatch_queue_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = dispatch_queue_create("SGMIFollowUpAnalyzer-processing", 0);
  v2 = (void *)analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult;
  analyzeForFollowUpMailWithBody_isSent_messageId_date___pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  char v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  sgMailIntelligenceLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector][RegEx loop] Checking for a match in RegEx: %@", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_39;
  v13[3] = &unk_1E7DAAA38;
  v14 = v8;
  v10 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v25 = *(_BYTE *)(a1 + 120);
  v16 = *(id *)(a1 + 48);
  v22 = *(_OWORD *)(a1 + 88);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v26 = *(_BYTE *)(a1 + 121);
  v23 = *(_OWORD *)(a1 + 104);
  v19 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 80);
  v21 = v7;
  v24 = a4;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v10, "enumerateRangesUsingBlock:", v13);

}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_39(uint64_t a1, NSUInteger a2, NSUInteger a3, _BYTE *a4)
{
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSRange v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger length;
  NSUInteger location;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  NSRange *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  NSRange v75;
  id v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  NSRange v97;
  void *context;
  void *v99;
  _QWORD v100[4];
  id v101;
  id v102;
  uint64_t v103;
  __int128 *v104;
  uint64_t *v105;
  _QWORD v106[4];
  id v107;
  id v108;
  uint64_t v109;
  __int128 *p_buf;
  uint64_t *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  NSRange *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint8_t v122[4];
  uint64_t v123;
  uint8_t v124[128];
  __int128 buf;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  uint64_t v130;
  NSRange v131;
  NSRange v132;

  v130 = *MEMORY[0x1E0C80C00];
  v97.length = a3;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v97.location = a2;
  objc_msgSend(*(id *)(a1 + 32), "matchForString:withinRange:", *(_QWORD *)(a1 + 40), __PAIR128__(v97.length, a2));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0;
  v117 = (NSRange *)&v116;
  v118 = 0x3010000000;
  v120 = 0;
  v121 = 0;
  v119 = "";
  v120 = objc_msgSend(v99, "range");
  v121 = v6;
  sgMailIntelligenceLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138739971;
    *(_QWORD *)((char *)&buf + 4) = v99;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Match found: %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }

  v8 = v99;
  if (v99)
  {
    v8 = v99;
    if (objc_msgSend(v99, "location") != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(_BYTE *)(a1 + 136))
      {
        sgMailIntelligenceLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138739971;
          *(_QWORD *)((char *)&buf + 4) = v99;
          _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Match valid: %{sensitive}@", (uint8_t *)&buf, 0xCu);
        }

        v10 = objc_msgSend(v99, "location");
        v11 = objc_msgSend(v99, "range");
        v132.length = v12 + v11 + 64;
        v131.location = a2;
        v131.length = v97.length;
        v132.location = v10;
        v13 = NSIntersectionRange(v131, v132);
        sgMailIntelligenceLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(void **)(a1 + 40);
          v16 = objc_msgSend(v99, "range");
          objc_msgSend(v15, "substringWithRange:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138739971;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Looking for a potential time reference in: %{sensitive}@", (uint8_t *)&buf, 0xCu);

        }
        if (v13.length)
        {
          objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v13.location, v13.length);
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "mailMessage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDataDetectorMatch detectionsInPlainText:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:baseDate:", v19, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = (void *)v19;

          sgMailIntelligenceLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploring Data Detector matches.", (uint8_t *)&buf, 2u);
          }

          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v126 = 0x3032000000;
          v127 = __Block_byref_object_copy__8083;
          v128 = __Block_byref_object_dispose__8084;
          v129 = 0;
          objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v129 = (id)objc_claimAutoreleasedReturnValue();
          v112 = 0u;
          v113 = 0u;
          v114 = 0u;
          v115 = 0u;
          v24 = v22;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v113;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v113 != v26)
                  objc_enumerationMutation(v24);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i), "matchType") == 3)
                {
                  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "detectedDate");
                  v29 = objc_claimAutoreleasedReturnValue();
                  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
                  v31 = *(void **)(v30 + 40);
                  *(_QWORD *)(v30 + 40) = v29;

                  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "compare:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)) == -1)
                  {
                    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
                    v32 = *((_QWORD *)&buf + 1);
                  }
                  else
                  {
                    v32 = *((_QWORD *)&buf + 1);
                    v33 = *((_QWORD *)&buf + 1);
                  }
                  objc_storeStrong((id *)(v32 + 40), *(id *)(v33 + 40));
                  location = v117[2].location;
                  length = v117[2].length;
                  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "range");
                  v39 = v38;

                  v40 = v37 + v39;
                  v41 = v117;
                  if (length > v37 + v39)
                    v40 = length;
                  v117[2].location = location;
                  v41[2].length = v40;
                }
              }
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
            }
            while (v25);
          }

          v42 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          objc_msgSend(*(id *)(a1 + 48), "mailMessage");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "date");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v42, "compare:", v44) == -1;

          if (v45)
            objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
          sgMailIntelligenceLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
            *(_DWORD *)v122 = 138739971;
            v123 = v47;
            _os_log_impl(&dword_1C3607000, v46, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploration Data Detector matches finished. Warning start date %{sensitive}@", v122, 0xCu);
          }

          sgMailIntelligenceLogHandle();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v122 = 0;
            _os_log_impl(&dword_1C3607000, v48, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploring Data Detector Mapped Additions matches.", v122, 2u);
          }

          objc_msgSend(*(id *)(a1 + 56), "detectors");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 64));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "followUpOnIncomingMails");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "dataDetectorMappedAdditions");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = MEMORY[0x1E0C809B0];
          v106[0] = MEMORY[0x1E0C809B0];
          v106[1] = 3221225472;
          v106[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_41;
          v106[3] = &unk_1E7DAA9E8;
          v54 = v95;
          v55 = *(_QWORD *)(a1 + 96);
          v107 = v54;
          v109 = v55;
          v108 = *(id *)(a1 + 48);
          p_buf = &buf;
          v111 = &v116;
          objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", v106);

          sgMailIntelligenceLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            v57 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
            *(_DWORD *)v122 = 138739971;
            v123 = v57;
            _os_log_impl(&dword_1C3607000, v56, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploration Data Detector Mapped Additions matches finished. Warning start date %{sensitive}@", v122, 0xCu);
          }

          sgMailIntelligenceLogHandle();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v122 = 0;
            _os_log_impl(&dword_1C3607000, v58, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploring Data Detector Additions matches.", v122, 2u);
          }

          objc_msgSend(*(id *)(a1 + 56), "detectors");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 64));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "followUpOnIncomingMails");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "dataDetectorAdditions");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v100[0] = v53;
          v100[1] = 3221225472;
          v100[2] = __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_43;
          v100[3] = &unk_1E7DAAA10;
          v63 = v54;
          v64 = *(_QWORD *)(a1 + 96);
          v101 = v63;
          v103 = v64;
          v102 = *(id *)(a1 + 48);
          v104 = &buf;
          v105 = &v116;
          objc_msgSend(v62, "enumerateKeysAndObjectsUsingBlock:", v100);

          sgMailIntelligenceLogHandle();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v66 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
            *(_DWORD *)v122 = 138739971;
            v123 = v66;
            _os_log_impl(&dword_1C3607000, v65, OS_LOG_TYPE_DEFAULT, "Follow Up. [_analyzeFeatureVector] Exploration Data Detector Additions matches finished. Warning start date %{sensitive}@", v122, 0xCu);
          }

          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(*((_QWORD *)&buf + 1) + 40));
          v67 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          objc_msgSend(*(id *)(a1 + 48), "mailMessage");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "date");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v67, "compare:", v69) == -1;

          if (v70)
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
          v71 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v71 == v72)
          {
            v74 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
            v73 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
          }
          else
          {
            v73 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
            v74 = v73;
          }
          objc_storeStrong((id *)(v73 + 40), *(id *)(v74 + 40));

          if (*(_BYTE *)(a1 + 137)
            && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)) == -1)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
          }
          v75 = NSIntersectionRange(v97, v117[2]);
          v117[2] = v75;

          _Block_object_dispose(&buf, 8);
        }
      }
      v76 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v117[2].location)
        v77 = CFSTR("…");
      else
        v77 = &stru_1E7DB83A8;
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "stringByTrimmingCharactersInSet:", v79);
      v80 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v80;
      if (v117[2].length + v117[2].location >= v97.location + v97.length)
        v82 = &stru_1E7DB83A8;
      else
        v82 = CFSTR("…");
      v83 = (void *)objc_msgSend(v76, "initWithFormat:", CFSTR("%@%@%@"), v77, v80, v82);

      v84 = objc_alloc(MEMORY[0x1E0D19868]);
      v85 = objc_alloc(MEMORY[0x1E0CB3940]);
      v86 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v99, "signature");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_msgSend(v85, "initWithFormat:", CFSTR("%@-%@"), v86, v87);
      v89 = *(_QWORD *)(a1 + 80);
      LODWORD(v86) = *(unsigned __int8 *)(a1 + 137);
      v90 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 56), "defaultTimeIntervalForAWarning");
      objc_msgSend(v90, "dateByAddingTimeInterval:");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v84, "initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:startDate:startDateCore:endDate:endDateCore:", v83, v83, v88, v89, (_DWORD)v86 == 0, &unk_1E7E0BF60, v90, 0, v91, 0);
      v93 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
      v94 = *(void **)(v93 + 40);
      *(_QWORD *)(v93 + 40) = v92;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "setType:", *(_QWORD *)(a1 + 88));
      if (!*(_BYTE *)(a1 + 136))
      {
        *a4 = 1;
        **(_BYTE **)(a1 + 128) = 1;
      }

      v8 = v99;
    }
  }
  _Block_object_dispose(&v116, 8);

  objc_autoreleasePoolPop(context);
}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;

  v21 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v9 = v8;

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "mailMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDataDetectorMatch detectionsInPlainText:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:baseDate:", v21, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "detectedDate");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) == -1)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = v17;
    }
    objc_storeStrong((id *)(v17 + 40), *(id *)(v18 + 40));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(_QWORD *)(v19 + 40);
    if (v20 <= v7 + v9)
      v20 = v7 + v9;
    *(_QWORD *)(v19 + 40) = v20;
  }

}

void __142__SGMIFollowUpAnalyzer__analyzeFeatureVector_withRegExpDictionary_forOutgoingMail_withDetectedLanguage_withRegExLanguage_withCustomTimeRange___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;

  v19 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v9 = v8;

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "mailMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v11, "dateByAddingTimeInterval:");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) == -1)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v16 = v15;
    }
    objc_storeStrong((id *)(v15 + 40), *(id *)(v16 + 40));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(_QWORD *)(v17 + 40);
    if (v18 <= v7 + v9)
      v18 = v7 + v9;
    *(_QWORD *)(v17 + 40) = v18;
  }

}

@end
