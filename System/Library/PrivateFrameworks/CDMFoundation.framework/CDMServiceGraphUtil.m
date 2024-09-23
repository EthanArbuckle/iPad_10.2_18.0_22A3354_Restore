@implementation CDMServiceGraphUtil

+ (id)extractPrevTurnsAsrConfidence:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "asrOutputs", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "probability");
          v13 = v12;

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  return v4;
}

+ (id)runCcqrService:(id)a3 nluRequest:(id)a4 tokenResponse:(id)a5 previousTurnTokenizationResponseCommand:(id)a6 rdResponse:(id)a7 requestLink:(id)a8 locale:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v61 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(v15, "currentTurnInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "tapToEdit"))
  {

LABEL_4:
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "+[CDMServiceGraphUtil runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdResp"
            "onse:requestLink:locale:]";
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s Current Turn is Tap2Edit or Current Context isn't expected, skipping CCQR", buf, 0xCu);
    }
    v25 = 0;
LABEL_7:
    v26 = v61;
    goto LABEL_8;
  }
  objc_msgSend(v15, "currentTurnInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "turnContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[CDMCcqrAerCbRService suppressCcqrUsingCurContext:](CDMCcqrAerCbRService, "suppressCcqrUsingCurContext:", v22);

  if (v23)
    goto LABEL_4;
  objc_msgSend(v15, "previousTurnInputs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  v59 = v16;
  v60 = v19;
  v58 = v17;
  if (v29)
  {
    v24 = objc_opt_new();
    objc_msgSend(v15, "currentTurnInput");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setCurrentTurn:](v24, "setCurrentTurn:", v30);

    objc_msgSend(v15, "previousTurnInputs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPreviousTurns:](v24, "setPreviousTurns:", v31);

    -[NSObject setType:](v24, "setType:", 0);
    objc_msgSend(v15, "currentTurnInput");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "asrOutputs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "utterance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tokenChain");
    v36 = v14;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMServiceGraphUtil overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:](CDMServiceGraphUtil, "overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:", v35, 0, v37, v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v36;
    v39 = v38;
    objc_msgSend(v36, "match:", v38);
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v25 = (void *)v40;
      CDMOSLoggerForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      v17 = v58;
      v19 = v60;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v25, "qrResponse");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v63 = "+[CDMServiceGraphUtil runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdRe"
              "sponse:requestLink:locale:]";
        v64 = 2112;
        v65 = v55;
        _os_log_debug_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_DEBUG, "%s Found override match. Return pre-defined match result %@", buf, 0x16u);

        v19 = v60;
      }

      v16 = v59;
      goto LABEL_7;
    }

  }
  v57 = v14;
  CDMOSLoggerForCategory(0);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v63 = "+[CDMServiceGraphUtil runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdRespon"
          "se:requestLink:locale:]";
    _os_log_debug_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_DEBUG, "%s The current turn is NOT Tap2Edit Request, nor override matching, Running CCQR inference", buf, 0xCu);
  }

  objc_msgSend(v15, "currentTurnInput");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "asrOutputs");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "probability");
  v46 = v45;
  objc_msgSend(v15, "previousTurnInputs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil extractPrevTurnsAsrConfidence:](CDMServiceGraphUtil, "extractPrevTurnsAsrConfidence:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nlId");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resultCandidateId");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestId");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:](CDMServiceGraphUtil, "prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:", v60, v59, v48, v58, v49, v50, v46, v51);
  v24 = objc_claimAutoreleasedReturnValue();

  v14 = v57;
  objc_msgSend(v57, "handle:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CDMFeatureFlags isCbrUnrestrictedByRDEnabled](CDMFeatureFlags, "isCbrUnrestrictedByRDEnabled"))
  {
    v17 = v58;
    v16 = v59;
    v26 = v61;
  }
  else
  {
    objc_msgSend(v25, "rewriteMsg");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v59;
    v26 = v61;
    if (objc_msgSend(v52, "rewriteType") == 2)
    {
      objc_msgSend(v61, "response");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "repetitionType");

      if (v54 != 2)
        objc_msgSend(v25, "setRewriteMsg:", 0);
    }
    else
    {

    }
    v17 = v58;
  }
  v19 = v60;
LABEL_8:

  return v25;
}

+ (id)prepareCcqrTokens:(id)a3 currentTurn:(id)a4 previousTurns:(id)a5 utterance:(id)a6 locale:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t m;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t n;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t ii;
  void *v111;
  void *v112;
  void *v113;
  CDMTokenizationProtoResponseCommand *v114;
  id v116;
  void *v117;
  id obj;
  uint64_t v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint8_t v162[128];
  uint8_t buf[4];
  const char *v164;
  __int16 v165;
  void *v166;
  _BYTE v167[128];
  uint64_t v168;

  v168 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v116 = a4;
  v11 = a5;
  v12 = a7;
  CDMOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
    _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use of PreviousTurn SiriResponse", buf, 0xCu);
  }

  v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  obj = v11;
  v121 = v10;
  v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
  v128 = v12;
  if (v122)
  {
    v119 = *(_QWORD *)v154;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v154 != v119)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v14);
        objc_msgSend(v15, "asrOutputs", v116);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v15, "asrOutputs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19)
          {
            objc_msgSend(v15, "asrOutputs");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "utterance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            CDMOSLoggerForCategory(0);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
              v165 = 2112;
              v166 = v22;
              _os_log_debug_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.previousTurnInputs, previous asr hypo: %@", buf, 0x16u);
            }

            +[CDMTokenizerProtoService createProtoTokenRequestWithText:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithText:locale:", v22, v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "handle:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "response");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "addObject:", v26);

          }
        }
        v123 = v14;
        v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v15, "turnContext");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "nlContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "systemDialogActs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "turnContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "legacyNlContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_alloc(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v32, "renderedTexts");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v33, "initWithCapacity:", objc_msgSend(v34, "count"));

        v126 = v32;
        objc_msgSend(v32, "renderedTexts");
        v36 = objc_claimAutoreleasedReturnValue();
        v124 = v30;
        if (v36)
        {
          v37 = (void *)v36;
          objc_msgSend(v32, "renderedTexts");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");

          if (v39)
          {
            v151 = 0u;
            v152 = 0u;
            v149 = 0u;
            v150 = 0u;
            objc_msgSend(v126, "renderedTexts");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v150;
              do
              {
                for (i = 0; i != v42; ++i)
                {
                  if (*(_QWORD *)v150 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
                  objc_msgSend(v45, "value");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v46)
                  {
                    objc_msgSend(v45, "value");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "addObject:", v47);

                  }
                  else
                  {
                    objc_msgSend(v27, "addObject:", &stru_24DCAE158);
                  }

                  CDMOSLoggerForCategory(0);
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v27, "lastObject");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315394;
                    v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
                    v165 = 2112;
                    v166 = v49;
                    _os_log_debug_impl(&dword_21A2A0000, v48, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.previousTurnInputs.turnContext.legacyNlContext, previous rendered text: %@", buf, 0x16u);

                  }
                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
              }
              while (v42);
            }

            v10 = v121;
            v30 = v124;
          }
        }
        if (v30 && objc_msgSend(v30, "count"))
        {
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v50 = v30;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v146;
            do
            {
              for (j = 0; j != v52; ++j)
              {
                if (*(_QWORD *)v146 != v53)
                  objc_enumerationMutation(v50);
                v55 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
                if (objc_msgSend(v27, "count"))
                {
                  CDMOSLoggerForCategory(0);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315138;
                    v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
                    _os_log_impl(&dword_21A2A0000, v56, OS_LOG_TYPE_INFO, "%s [WARN]: NLConetext and legcyNLContext both exists", buf, 0xCu);
                  }

                }
                objc_msgSend(v55, "renderedText");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "value");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if (v58)
                {
                  objc_msgSend(v55, "renderedText");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "value");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "addObject:", v60);

                }
                else
                {
                  objc_msgSend(v27, "addObject:", &stru_24DCAE158);
                }

                CDMOSLoggerForCategory(0);
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v27, "lastObject");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
                  v165 = 2112;
                  v166 = v62;
                  _os_log_debug_impl(&dword_21A2A0000, v61, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.previousTurnInputs.turnContext.nlContext, previous rendered text: %@", buf, 0x16u);

                }
                v12 = v128;
              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
            }
            while (v52);
          }

          v10 = v121;
        }
        v143 = 0u;
        v144 = 0u;
        v141 = 0u;
        v142 = 0u;
        v63 = v27;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v142;
          do
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v142 != v66)
                objc_enumerationMutation(v63);
              +[CDMTokenizerProtoService createProtoTokenRequestWithText:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithText:locale:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * k), v12);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "handle:", v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "response");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "addObject:", v70);

            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
          }
          while (v65);
        }

        objc_msgSend(v120, "addObject:", v35);
        v14 = v123 + 1;
      }
      while (v123 + 1 != v122);
      v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
    }
    while (v122);
  }

  v71 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v116, "turnContext");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "nlContext");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "systemDialogActs");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v116, "turnContext");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "legacyNlContext");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v75, "renderedTexts");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v76, "initWithCapacity:", objc_msgSend(v77, "count"));

  objc_msgSend(v75, "renderedTexts");
  v79 = objc_claimAutoreleasedReturnValue();
  v125 = v75;
  if (v79)
  {
    v80 = (void *)v79;
    objc_msgSend(v75, "renderedTexts");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "count");

    if (v82)
    {
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      objc_msgSend(v75, "renderedTexts");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
      if (v84)
      {
        v85 = v84;
        v86 = *(_QWORD *)v138;
        do
        {
          for (m = 0; m != v85; ++m)
          {
            if (*(_QWORD *)v138 != v86)
              objc_enumerationMutation(v83);
            v88 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * m);
            objc_msgSend(v88, "value", v116);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (v89)
            {
              objc_msgSend(v88, "value");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "addObject:", v90);

            }
            else
            {
              objc_msgSend(v78, "addObject:", &stru_24DCAE158);
            }

            CDMOSLoggerForCategory(0);
            v91 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v78, "lastObject");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
              v165 = 2112;
              v166 = v92;
              _os_log_debug_impl(&dword_21A2A0000, v91, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.currentTurnInput.turnContext.legacyNlContext, current rendered text: %@", buf, 0x16u);

            }
          }
          v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
        }
        while (v85);
      }

      v10 = v121;
      v12 = v128;
    }
  }
  if (v127 && objc_msgSend(v127, "count"))
  {
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v93 = v127;
    v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v133, v158, 16);
    if (v94)
    {
      v95 = v94;
      v96 = *(_QWORD *)v134;
      do
      {
        for (n = 0; n != v95; ++n)
        {
          if (*(_QWORD *)v134 != v96)
            objc_enumerationMutation(v93);
          v98 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * n);
          if (objc_msgSend(v78, "count", v116))
          {
            CDMOSLoggerForCategory(0);
            v99 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
              _os_log_impl(&dword_21A2A0000, v99, OS_LOG_TYPE_INFO, "%s [WARN]: NLConetext and legcyNLContext both exists", buf, 0xCu);
            }

          }
          objc_msgSend(v98, "renderedText");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "value");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          if (v101)
          {
            objc_msgSend(v98, "renderedText");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "value");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "addObject:", v103);

            v10 = v121;
          }
          else
          {
            objc_msgSend(v78, "addObject:", &stru_24DCAE158);
          }

          CDMOSLoggerForCategory(0);
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v78, "lastObject");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
            v165 = 2112;
            v166 = v105;
            _os_log_debug_impl(&dword_21A2A0000, v104, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.currentTurnInput.turnContext.nlContext, current rendered text: %@", buf, 0x16u);

          }
        }
        v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v133, v158, 16);
      }
      while (v95);
    }

    v12 = v128;
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v106 = v78;
  v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
  if (v107)
  {
    v108 = v107;
    v109 = *(_QWORD *)v130;
    do
    {
      for (ii = 0; ii != v108; ++ii)
      {
        if (*(_QWORD *)v130 != v109)
          objc_enumerationMutation(v106);
        +[CDMTokenizerProtoService createProtoTokenRequestWithText:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithText:locale:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * ii), v12, v116);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handle:", v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "response");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addObject:", v113);

      }
      v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
    }
    while (v108);
  }

  objc_msgSend(v120, "addObject:", v71);
  v114 = -[CDMTokenizationProtoResponseCommand initWithPreviousResponses:withPreviousSiriResponse:]([CDMTokenizationProtoResponseCommand alloc], "initWithPreviousResponses:withPreviousSiriResponse:", v117, v120);

  return v114;
}

+ (id)getNonWhitespaceTokenChain:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isWhitespace"))
        {
          CDMOSLoggerForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "+[CDMServiceGraphUtil getNonWhitespaceTokenChain:]";
            v22 = 2112;
            v23 = v12;
            _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v14, "setTokens:", v6);

  return v14;
}

+ (BOOL)runUaaPNLProtoService:(id)a3 requestId:(id)a4 utterance:(id)a5 locale:(id)a6 tokenChain:(id)a7 matchingSpans:(id)a8 embeddingTensor:(id)a9 currentTurn:(id)a10 outUaapProtoRequest:(id *)a11 outUaapProtoResponse:(id *)a12 outError:(id *)a13
{
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CDMUaaPNLProtoRequestCommand *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v46 = a4;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v48 = a10;
  CDMOSLoggerForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "+[CDMServiceGraphUtil runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTenso"
          "r:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:]";
    _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Creating SIRINLUINTERNALUAAP_PARSERUaaPParserRequest for use in CDMUaaPNLProtoService", buf, 0xCu);
  }

  v20 = objc_alloc_init(MEMORY[0x24BE9E308]);
  v45 = v16;
  objc_msgSend(v20, "setTokenChain:", v16);
  v44 = v18;
  objc_msgSend(v20, "setEmbeddings:", v18);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  objc_msgSend(v20, "setMatchingSpans:", v21);

  objc_msgSend(v20, "setMaxNumParses:", +[CDMUserDefaultsUtils readUaaPNLMaxNumParses](CDMUserDefaultsUtils, "readUaaPNLMaxNumParses"));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v20, "matchingSpans");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v28, "addObject:", v29);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v24);
  }

  objc_msgSend(v20, "setTurnInput:", v48);
  v30 = v46;
  v31 = objc_retainAutorelease(-[CDMUaaPNLProtoRequestCommand initWithParserRequest:requestId:]([CDMUaaPNLProtoRequestCommand alloc], "initWithParserRequest:requestId:", v20, v46));
  *a11 = v31;
  v32 = v47;
  objc_msgSend(v47, "handle:", v31);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  *a12 = v33;
  if (a13 && !v33)
  {
    v35 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*a13, "userInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("Hit error running uaap protobuf inference: no response populated. Internal error: %@"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)MEMORY[0x24BDD1540];
    v57 = v37;
    v58 = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("uaapProtoService"), 1, v41);
    *a13 = (id)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "+[CDMServiceGraphUtil runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTen"
            "sor:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:]";
      v55 = 2112;
      v56 = v39;
      _os_log_error_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    v30 = v46;
    v32 = v47;
  }

  return v34 != 0;
}

+ (id)prepareCcqrServiceRequest:(id)a3 currentTurnAsrConf:(double)a4 tokenResponse:(id)a5 previousTurnsAsrConf:(id)a6 previousTurnTokenizationResponseCommand:(id)a7 nluRequestId:(id)a8 resultCandidateId:(id)a9 cdmRequestId:(id)a10
{
  id v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  unint64_t v56;
  void *v57;
  unint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  CDMQRRequestCommand *v74;
  id v76;
  id v77;
  id v78;
  id v79;
  id obj;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  id v101;
  _BYTE v102[128];
  id v103;
  uint8_t v104[128];
  uint8_t buf[4];
  const char *v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v85 = a3;
  v79 = a5;
  v86 = a6;
  v16 = a7;
  v78 = a8;
  v77 = a9;
  v76 = a10;
  CDMOSLoggerForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previou"
           "sTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Creating CDMQRRequestCommand for use in CCQR Service", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previou"
           "sTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s 1. Constructing previous interactions", buf, 0xCu);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(v16, "responses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v83)
  {
    LODWORD(v19) = 0;
    v82 = *(_QWORD *)v97;
    v81 = v16;
    while (2)
    {
      v20 = 0;
      v19 = (int)v19;
      do
      {
        if (*(_QWORD *)v97 != v82)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v20);
        v22 = objc_alloc_init(MEMORY[0x24BE9E2A8]);
        objc_msgSend(v21, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setUtterance:", v23);

        objc_msgSend(v22, "setAsrId:", 0);
        objc_msgSend(v22, "setConfidence:", 1000.0);
        if (objc_msgSend(v86, "count") > v19)
        {
          objc_msgSend(v86, "objectAtIndex:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          objc_msgSend(v22, "setConfidence:");

        }
        objc_msgSend(v21, "tokenChain", v76);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "tokens");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setNluInternalTokens:", v26);

        objc_msgSend(v16, "previousSiriResponseTokenResponses");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v28 <= v19)
        {
          CDMOSLoggerForCategory(0);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf"
                   ":previousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
            _os_log_impl(&dword_21A2A0000, v44, OS_LOG_TYPE_INFO, "%s [WARN]: Missing previous Siri response! Attempted to access index exceeding number of previous Siri responses.", buf, 0xCu);
          }

          goto LABEL_26;
        }
        v29 = objc_alloc_init(MEMORY[0x24BE9E298]);
        v87 = v22;
        v103 = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v29, "setOriginalUtterances:", v31);

        objc_msgSend(v16, "previousSiriResponseTokenResponses");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndex:", v19);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v33, "count"));
        objc_msgSend(v29, "setSiriResponses:", v34);

        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v35 = v33;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v93;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v93 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
              objc_msgSend(v29, "siriResponses");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "tokenChain");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "tokens");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObjectsFromArray:", v43);

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
          }
          while (v37);
        }

        objc_msgSend(v29, "setLocale:", v85);
        objc_msgSend(v84, "addObject:", v29);
        ++v19;

        ++v20;
        v16 = v81;
      }
      while (v20 != v83);
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
      if (v83)
        continue;
      break;
    }
  }
LABEL_26:

  CDMOSLoggerForCategory(0);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previou"
           "sTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_21A2A0000, v45, OS_LOG_TYPE_DEBUG, "%s 2. Constructing current interactions", buf, 0xCu);
  }

  v46 = objc_alloc_init(MEMORY[0x24BE9E2A8]);
  objc_msgSend(v79, "text");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setUtterance:", v47);

  objc_msgSend(v79, "tokenChain");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "tokens");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setNluInternalTokens:", v49);

  objc_msgSend(v46, "setAsrId:", 0);
  objc_msgSend(v46, "setConfidence:", a4);
  v50 = objc_alloc_init(MEMORY[0x24BE9E298]);
  v101 = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v101, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  objc_msgSend(v50, "setOriginalUtterances:", v52);

  objc_msgSend(v16, "responses");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "count");

  objc_msgSend(v16, "previousSiriResponseTokenResponses");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "count");

  if (v56 <= v54)
  {
    CDMOSLoggerForCategory(0);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previ"
             "ousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
      _os_log_impl(&dword_21A2A0000, v72, OS_LOG_TYPE_INFO, "%s [WARN]: Missing previous Siri response! Attempted to access index exceeding number of previous Siri responses.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setSiriResponses:", v63);
  }
  else
  {
    objc_msgSend(v16, "previousSiriResponseTokenResponses");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");

    if (v58 > v54 + 1)
    {
      CDMOSLoggerForCategory(0);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:pre"
               "viousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
        _os_log_impl(&dword_21A2A0000, v59, OS_LOG_TYPE_INFO, "%s [WARN]: Missing previous user utterance!", buf, 0xCu);
      }

    }
    objc_msgSend(v16, "previousSiriResponseTokenResponses", v76);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectAtIndex:", v54);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v61, "count"));
    objc_msgSend(v50, "setSiriResponses:", v62);

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v63 = v61;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v65; ++j)
        {
          if (*(_QWORD *)v89 != v66)
            objc_enumerationMutation(v63);
          v68 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          objc_msgSend(v50, "siriResponses");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "tokenChain");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "tokens");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addObjectsFromArray:", v71);

        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      }
      while (v65);
    }

  }
  objc_msgSend(v50, "setLocale:", v85);
  objc_msgSend(v84, "addObject:", v50);
  v73 = objc_alloc_init(MEMORY[0x24BE9E280]);
  objc_msgSend(v73, "setResultCandidateId:", v77);
  objc_msgSend(v73, "setNluRequestId:", v78);
  objc_msgSend(v73, "setOriginalInteractions:", v84);
  objc_msgSend(v73, "setCdmRequestId:", v76);
  v74 = -[CDMQRRequestCommand initWithQRRequest:]([CDMQRRequestCommand alloc], "initWithQRRequest:", v73);

  return v74;
}

+ (id)extractReferenceResolutionUtterances:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v3;
  objc_msgSend(v3, "rewriteHypotheses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = objc_alloc_init(MEMORY[0x24BE9E2A8]);
        CDMOSLoggerForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "utterance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v23 = "+[CDMServiceGraphUtil extractReferenceResolutionUtterances:]";
          v24 = 2112;
          v25 = v13;
          _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s Rewritten Utterance (reference resolution): %@", buf, 0x16u);

        }
        objc_msgSend(v10, "utterance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setUtterance:", v14);

        objc_msgSend(v11, "setNluInternalTokens:", 0);
        objc_msgSend(v11, "setAsrId:", 0);
        objc_msgSend(v11, "setConfidence:", 0.0);
        objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

+ (BOOL)debugInfoEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (+[CDMPlatformUtils isInternalInstall](CDMPlatformUtils, "isInternalInstall"))
  {
    objc_msgSend(v3, "requestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idA");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("debug-mode-id"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)addDebugInfo:(id)a3 nluRequest:(id)a4 responseObject:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (+[CDMServiceGraphUtil debugInfoEnabled:](CDMServiceGraphUtil, "debugInfoEnabled:", a4))
  {
    objc_msgSend(v8, "commandName");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("%@%@\n%@"), CFSTR("\n\n   ➡️  "), v9, v10);

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "+[CDMServiceGraphUtil addDebugInfo:nluRequest:responseObject:]";
      v13 = 2112;
      v14 = CFSTR("debug-mode-id");
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Early return and skip adding debugText as idAsString is not the special %@", buf, 0x16u);
    }
  }

}

+ (id)buildRepetitionResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE9E0E8]);
  objc_msgSend(v4, "setAsrHypothesisIndex:", 0);
  objc_msgSend(v4, "setRepetitionType:", 0);
  if (v3)
  {
    objc_msgSend(v3, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "repetitionType");

    if (v6 == 3)
      v7 = 3;
    else
      v7 = 1;
    objc_msgSend(v4, "setRepetitionType:", v7);
  }

  return v4;
}

+ (id)buildNormalizedUtterance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "tokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasCleanValue");

      objc_msgSend(v3, "tokens");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v10)
        objc_msgSend(v12, "cleanValue");
      else
        objc_msgSend(v12, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v14);

      ++v7;
      objc_msgSend(v3, "tokens");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v7 < v16);
  }

  return v4;
}

+ (BOOL)spanHasMatcherName:(int)a3 matchingSpan:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  BOOL v8;

  v5 = a4;
  if (objc_msgSend(v5, "matcherNamesCount"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(v5, "matcherNamesAtIndex:", v6);
      v8 = v7 == a3;
      if (v7 == a3)
        break;
      if (++v6 >= (unint64_t)objc_msgSend(v5, "matcherNamesCount"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = 0;
  }

  return v8;
}

+ (id)adjustProtoMatchingSpans:(id)a3 tokenChain:(id)a4 outError:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  __CFString *v36;
  int v37;
  int v38;
  uint64_t v39;
  __int128 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  _QWORD v52[3];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v44;
    *(_QWORD *)&v10 = 136315906;
    v41 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
        v15 = (void *)objc_msgSend(v14, "copy", v41);
        v16 = objc_msgSend(v14, "startTokenIndex");
        objc_msgSend(v7, "tokens");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18 <= v16)
        {
          v29 = CDMLogContext;
          if (!os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
            goto LABEL_17;
          *(_DWORD *)buf = 136315650;
          v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
          v49 = 2112;
          v50 = CFSTR("spanmatch");
          v51 = 2112;
          v52[0] = v14;
          v27 = v29;
          v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid rawTokenIndex on begin token. Span:\n %@";
          goto LABEL_16;
        }
        objc_msgSend(v7, "tokens");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "nonWhitespaceTokenIndex");

        if ((v21 & 0x80000000) != 0)
        {
          v30 = CDMLogContext;
          if (!os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
            goto LABEL_17;
          *(_DWORD *)buf = 136315650;
          v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
          v49 = 2112;
          v50 = CFSTR("spanmatch");
          v51 = 2112;
          v52[0] = v14;
          v27 = v30;
          v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid nonWhitespaceTokenIndex on begin token, Span:\n %@";
          goto LABEL_16;
        }
        objc_msgSend(v15, "setStartTokenIndex:", v21);
        v22 = objc_msgSend(v14, "endTokenIndex");
        if (!v22
          || (v23 = v22,
              objc_msgSend(v7, "tokens"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              v25 = objc_msgSend(v24, "count"),
              v24,
              v25 < v23))
        {
          v26 = CDMLogContext;
          if (!os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
            goto LABEL_17;
          *(_DWORD *)buf = 136315650;
          v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
          v49 = 2112;
          v50 = CFSTR("spanmatch");
          v51 = 2112;
          v52[0] = v14;
          v27 = v26;
          v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid end token index, Span:\n %@";
          goto LABEL_16;
        }
        objc_msgSend(v7, "tokens");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v23 - 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "nonWhitespaceTokenIndex");

        if (v33 < 0)
        {
          v35 = CDMLogContext;
          if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
            v49 = 2112;
            v50 = CFSTR("spanmatch");
            v51 = 2112;
            v52[0] = v14;
            v27 = v35;
            v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid nonWhitespaceTokenIndex on end inclusive token, Span:\n %@";
LABEL_16:
            _os_log_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_INFO, v28, buf, 0x20u);
          }
        }
        else
        {
          objc_msgSend(v15, "setEndTokenIndex:", (v33 + 1));
          objc_msgSend(v42, "addObject:", v15);
          CDMOSLoggerForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "label");
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v15, "startTokenIndex");
            v38 = objc_msgSend(v15, "endTokenIndex");
            *(_DWORD *)buf = v41;
            v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
            v49 = 2112;
            v50 = v36;
            v51 = 1024;
            LODWORD(v52[0]) = v37;
            WORD2(v52[0]) = 1024;
            *(_DWORD *)((char *)v52 + 6) = v38;
            _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s MatchedSpan for NLv4: label %@, startTokenIndex %u, endTokenIndex %u", buf, 0x22u);

          }
        }
LABEL_17:

        ++v13;
      }
      while (v11 != v13);
      v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      v11 = v39;
    }
    while (v39);
  }

  return v42;
}

+ (id)buildNLv4ProtoRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 currentTurn:(id)a7 requestId:(id)a8 outError:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  CDMNLv4ProtoRequestCommand *v27;
  void *v28;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v31 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a5;
  v18 = a4;
  CDMOSLoggerForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "+[CDMServiceGraphUtil buildNLv4ProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:currentTurn:"
          "requestId:outError:]";
    _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest...", buf, 0xCu);
  }

  v20 = objc_alloc_init(MEMORY[0x24BE9E238]);
  v21 = objc_alloc_init(MEMORY[0x24BE9E248]);
  +[CDMServiceGraphUtil buildNormalizedUtterance:](CDMServiceGraphUtil, "buildNormalizedUtterance:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNormalisedUtterance:", v22);

  objc_msgSend(v21, "setOriginalUtterance:", v17);
  +[CDMServiceGraphUtil getNonWhitespaceTokenChain:](CDMServiceGraphUtil, "getNonWhitespaceTokenChain:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTokenChain:", v23);

  objc_msgSend(v20, "setMaxNumParses:", +[CDMUserDefaultsUtils readNLv4MaxNumParses](CDMUserDefaultsUtils, "readNLv4MaxNumParses"));
  CDMOSLoggerForCategory(0);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v30 = objc_msgSend(v20, "maxNumParses");
    *(_DWORD *)buf = 136315394;
    v33 = "+[CDMServiceGraphUtil buildNLv4ProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:currentTurn:"
          "requestId:outError:]";
    v34 = 2048;
    v35 = v30;
    _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s Set nlv4ParserRequest.maxNumParses = %llu", buf, 0x16u);
  }

  objc_msgSend(v16, "nluRequestId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRequestId:", v25);

  objc_msgSend(v20, "setNluRequestId:", v16);
  objc_msgSend(v20, "setTokenisedUtterance:", v21);
  +[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:](CDMServiceGraphUtil, "adjustProtoMatchingSpans:tokenChain:outError:", v18, v14, a9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setMatchingSpans:", v26);
  if (*a9)
  {
    v27 = 0;
    v28 = v31;
  }
  else
  {
    v28 = v31;
    objc_msgSend(v20, "setEmbeddings:", v31);
    objc_msgSend(v20, "setTurnInput:", v15);
    v27 = -[CDMNLv4ProtoRequestCommand initWithParserRequest:requestId:]([CDMNLv4ProtoRequestCommand alloc], "initWithParserRequest:requestId:", v20, v16);
  }

  return v27;
}

+ (id)buildSNLCProtoRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 requestId:(id)a8 currentTurn:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CDMSNLCProtoRequestCommand *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v55 = a6;
  v54 = a7;
  v18 = a8;
  v19 = a9;
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v64 = "+[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:r"
          "equestId:currentTurn:error:]";
    _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALITFMITFMParserRequest...", buf, 0xCu);
  }

  v21 = objc_alloc_init(MEMORY[0x24BE9E248]);
  +[CDMServiceGraphUtil buildNormalizedUtterance:](CDMServiceGraphUtil, "buildNormalizedUtterance:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNormalisedUtterance:", v22);

  objc_msgSend(v21, "setOriginalUtterance:", v17);
  v61 = 0;
  objc_msgSend((id)objc_opt_class(), "adjustProtoMatchingSpans:tokenChain:outError:", v16, v15, &v61);
  v23 = objc_claimAutoreleasedReturnValue();
  v56 = v61;
  v52 = (void *)v23;
  v53 = v19;
  if (v23)
  {
    v47 = v21;
    v48 = v18;
    v49 = v17;
    v50 = v16;
    v24 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v15, "tokens");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v51 = v15;
    objc_msgSend(v15, "tokens");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v58 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if (objc_msgSend(v32, "isWhitespace", v47))
          {
            CDMOSLoggerForCategory(0);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v64 = "+[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:re"
                    "writeMsg:requestId:currentTurn:error:]";
              v65 = 2112;
              v66 = v32;
              _os_log_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v26, "addObject:", v32);
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v29);
    }

    v34 = (void *)objc_msgSend(v51, "copy");
    objc_msgSend(v34, "setTokens:", v26);
    v21 = v47;
    objc_msgSend(v47, "setTokenChain:", v34);
    v35 = objc_alloc_init(MEMORY[0x24BE9E1F8]);
    objc_msgSend(v48, "nluRequestId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRequestId:", v36);

    objc_msgSend(v35, "setNluRequestId:", v48);
    objc_msgSend(v35, "setTokenisedUtterance:", v47);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v52);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMatchingSpans:", v37);

    v38 = v55;
    objc_msgSend(v35, "setEmbeddings:", v55);
    v39 = v53;
    objc_msgSend(v35, "setTurnInput:", v53);
    v40 = v54;
    v41 = -[CDMSNLCProtoRequestCommand initWithParserRequest:rewriteMsg:]([CDMSNLCProtoRequestCommand alloc], "initWithParserRequest:rewriteMsg:", v35, v54);

    v18 = v48;
    v42 = v52;

    v16 = v50;
    v43 = v51;
    v17 = v49;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v56, "localizedDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v64 = "+[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg"
            ":requestId:currentTurn:error:]";
      v65 = 2112;
      v66 = v46;
      _os_log_error_impl(&dword_21A2A0000, v44, OS_LOG_TYPE_ERROR, "%s [ERR]: Error converting matched spans: %@", buf, 0x16u);

    }
    v43 = v15;

    v40 = v54;
    v41 = 0;
    if (a10)
      *a10 = objc_retainAutorelease(v56);
    v42 = 0;
    v39 = v53;
    v38 = v55;
  }

  return v41;
}

+ (id)overrideInputsFromUtterance:(id)a3 matchingSpans:(id)a4 tokenChain:(id)a5 contextUpdateReformedTurnInputBundle:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "currentTurn");
  v13 = objc_claimAutoreleasedReturnValue();
  v31 = v12;
  objc_msgSend(v12, "previousTurns");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = objc_alloc_init(MEMORY[0x24BE9E260]);
  v34 = v9;
  objc_msgSend(v16, "setUtterance:", v9);
  v32 = v11;
  objc_msgSend(v16, "setTokenChain:", v11);
  v33 = v10;
  objc_msgSend(v16, "setMatchingSpans:", v10);
  v30 = (void *)v13;
  objc_msgSend(v16, "setTurnInput:", v13);
  v28 = v16;
  objc_msgSend(v15, "addObject:", v16);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v29 = v14;
  objc_msgSend(v14, "reverseObjectEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v21);
        v23 = objc_alloc_init(MEMORY[0x24BE9E260]);
        objc_msgSend(v22, "asrOutputs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "utterance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setUtterance:", v26);
        objc_msgSend(v23, "setTurnInput:", v22);
        objc_msgSend(v15, "addObject:", v23);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v19);
  }

  return v15;
}

+ (id)buildPSCRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 nluRequestId:(id)a8 currentTurn:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CDMPSCRequestCommand *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  uint8_t v64[128];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v55 = a7;
  v19 = a8;
  v58 = a9;
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v66 = "+[CDMServiceGraphUtil buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequ"
          "estId:currentTurn:error:]";
    _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALITFMITFMParserRequest...", buf, 0xCu);
  }

  v21 = objc_alloc_init(MEMORY[0x24BE9E248]);
  +[CDMServiceGraphUtil buildNormalizedUtterance:](CDMServiceGraphUtil, "buildNormalizedUtterance:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNormalisedUtterance:", v22);

  v57 = v21;
  objc_msgSend(v21, "setOriginalUtterance:", v17);
  objc_msgSend((id)objc_opt_class(), "filterMatchingSpans:withMatcherName:", v16, 7);
  v63 = 0;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "adjustProtoMatchingSpans:tokenChain:outError:", v54, v15, &v63);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v63;
  if (v23)
  {
    v52 = v23;
    v53 = v19;
    v49 = v17;
    v50 = v16;
    v24 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v15, "tokens");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v51 = v15;
    objc_msgSend(v15, "tokens");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v60 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if (objc_msgSend(v32, "isWhitespace"))
          {
            CDMOSLoggerForCategory(0);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v66 = "+[CDMServiceGraphUtil buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteM"
                    "sg:nluRequestId:currentTurn:error:]";
              v67 = 2112;
              v68 = v32;
              _os_log_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v26, "addObject:", v32);
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v29);
    }

    v15 = v51;
    v34 = (void *)objc_msgSend(v51, "copy");
    objc_msgSend(v34, "setTokens:", v26);
    objc_msgSend(v57, "setTokenChain:", v34);
    v35 = objc_alloc_init(MEMORY[0x24BE9E1F8]);
    objc_msgSend(v53, "nluRequestId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRequestId:", v36);

    objc_msgSend(v35, "setNluRequestId:", v53);
    objc_msgSend(v35, "setTokenisedUtterance:", v57);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v23);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMatchingSpans:", v37);

    objc_msgSend(v35, "setEmbeddings:", v18);
    objc_msgSend(v35, "setTurnInput:", v58);
    objc_msgSend(v35, "turnInput");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "turnContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "legacyNlContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v40, "hasPreviousDomainName"))
    {
      objc_msgSend(v35, "turnInput");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "turnContext");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setLegacyNlContext:", v40);

    }
    v43 = v55;
    v44 = -[CDMPSCRequestCommand initWithParserRequest:rewriteMsg:]([CDMPSCRequestCommand alloc], "initWithParserRequest:rewriteMsg:", v35, v55);

    v17 = v49;
    v16 = v50;
    v23 = v52;
    v19 = v53;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v56, "localizedDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v66 = "+[CDMServiceGraphUtil buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRe"
            "questId:currentTurn:error:]";
      v67 = 2112;
      v68 = v48;
      _os_log_error_impl(&dword_21A2A0000, v46, OS_LOG_TYPE_ERROR, "%s [ERR]: Error converting matched spans: %@", buf, 0x16u);

    }
    v43 = v55;
    if (a10)
    {
      v45 = v56;
      v44 = 0;
      *a10 = objc_retainAutorelease(v56);
      goto LABEL_24;
    }
    v44 = 0;
  }
  v45 = v56;
LABEL_24:

  return v44;
}

+ (id)buildLVCRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 nluRequestId:(id)a8 reformedTurnInput:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CDMLVCRequestCommand *v41;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v52 = a6;
  v45 = a7;
  v51 = a8;
  v50 = a9;
  CDMOSLoggerForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v60 = "+[CDMServiceGraphUtil buildLVCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequ"
          "estId:reformedTurnInput:error:]";
    _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALITFMITFMParserRequest for LVC...", buf, 0xCu);
  }

  v19 = objc_alloc_init(MEMORY[0x24BE9E248]);
  +[CDMServiceGraphUtil buildNormalizedUtterance:](CDMServiceGraphUtil, "buildNormalizedUtterance:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNormalisedUtterance:", v20);

  v46 = v17;
  objc_msgSend(v19, "setOriginalUtterance:", v17);
  v58 = 0;
  v47 = v16;
  objc_msgSend((id)objc_opt_class(), "adjustProtoMatchingSpans:tokenChain:outError:", v16, v15, &v58);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v58;
  v21 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v15, "tokens");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v22, "count"));

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v48 = v15;
  objc_msgSend(v15, "tokens");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v55 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v29, "isWhitespace", v43))
        {
          CDMOSLoggerForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v60 = "+[CDMServiceGraphUtil buildLVCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg"
                  ":nluRequestId:reformedTurnInput:error:]";
            v61 = 2112;
            v62 = v29;
            _os_log_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v23, "addObject:", v29);
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v26);
  }

  v31 = (void *)objc_msgSend(v48, "copy");
  objc_msgSend(v31, "setTokens:", v23);
  v53 = v31;
  objc_msgSend(v19, "setTokenChain:", v31);
  v32 = objc_alloc_init(MEMORY[0x24BE9E1F8]);
  objc_msgSend(v32, "setNluRequestId:", v51);
  objc_msgSend(v32, "setTokenisedUtterance:", v19);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v49);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMatchingSpans:", v33);

  objc_msgSend(v32, "setEmbeddings:", v52);
  objc_msgSend(v50, "currentTurn");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTurnInput:", v34);

  objc_msgSend(v32, "turnInput");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "turnContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "legacyNlContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v37, "hasPreviousDomainName"))
  {
    objc_msgSend(v32, "turnInput");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "turnContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setLegacyNlContext:", v37);

  }
  +[CDMServiceGraphUtil overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:](CDMServiceGraphUtil, "overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:", v46, v47, v48, v50, v43);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[CDMLVCRequestCommand initWithParserRequest:rewriteMsg:overridesInputs:]([CDMLVCRequestCommand alloc], "initWithParserRequest:rewriteMsg:overridesInputs:", v32, v45, v40);

  return v41;
}

+ (id)mergeDateTimeSpans:(id)a3 regexSpans:(id)a4 siriVocabularySpans:(id)a5 vocSpans:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
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
  id v30;
  NSObject *v31;
  CDMSpanMatchProtoResponseCommand *v32;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  const char *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "spanMatchResponse");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "matchingSpansCount");
  objc_msgSend(v11, "spanMatchResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "matchingSpansCount") + v14;
  objc_msgSend(v10, "spanMatchResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "matchingSpansCount");
  objc_msgSend(v9, "spanMatchResponse");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16 + v18 + objc_msgSend(v19, "matchingSpansCount");

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v20);
  objc_msgSend(v12, "spanMatchResponse");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "matchingSpans");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v23);

  objc_msgSend(v11, "spanMatchResponse");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "matchingSpans");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v25);

  objc_msgSend(v10, "spanMatchResponse");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "matchingSpans");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v27);

  objc_msgSend(v9, "spanMatchResponse");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "matchingSpans");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v29);

  v30 = objc_alloc_init(MEMORY[0x24BE9E2C8]);
  objc_msgSend(v30, "setMatchingSpans:", v21);
  v31 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    v34 = v31;
    v38 = 136315650;
    v39 = "+[CDMServiceGraphUtil mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:]";
    v40 = 2112;
    v41 = CFSTR("spanmatch");
    v42 = 1024;
    LODWORD(v43) = objc_msgSend(v21, "count");
    _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSpan Matcher Services generated number of spans: %d", (uint8_t *)&v38, 0x1Cu);

    v31 = CDMLogContext;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v35 = (void *)MEMORY[0x24BE9E358];
    v36 = v31;
    objc_msgSend(v35, "printableSpanMatchResponse:withUSOGraph:", v30, +[CDMUserDefaultsUtils isPrintUSOInSpanEnabled](CDMUserDefaultsUtils, "isPrintUSOInSpanEnabled"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 136315650;
    v39 = "+[CDMServiceGraphUtil mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:]";
    v40 = 2112;
    v41 = CFSTR("spanmatch");
    v42 = 2112;
    v43 = v37;
    _os_log_debug_impl(&dword_21A2A0000, v36, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSpanMatchResponse: %@", (uint8_t *)&v38, 0x20u);

  }
  v32 = -[CDMSpanMatchProtoResponseCommand initWithResponse:]([CDMSpanMatchProtoResponseCommand alloc], "initWithResponse:", v30);

  return v32;
}

+ (id)appendMarrsSpans:(id)a3 marrsMRSpans:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "addObjectsFromArray:", v5);
  if (v6 && objc_msgSend(v6, "count"))
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "+[CDMServiceGraphUtil appendMarrsSpans:marrsMRSpans:]";
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s Feeding mention resolver spans to NLv4", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(v8, "addObjectsFromArray:", v6);
  }

  return v8;
}

+ (id)filterMatchingSpans:(id)a3 withMatcherName:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!+[CDMServiceGraphUtil spanHasMatcherName:matchingSpan:](CDMServiceGraphUtil, "spanHasMatcherName:matchingSpan:", v4, v12, (_QWORD)v14))objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)extractStableEmbeddings:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = v3;
    v5 = v3;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "isStableEmbeddingsVersion"))
          {
            if ((objc_msgSend(v10, "hasEmbeddingTensor") & 1) != 0)
            {
              objc_msgSend(v10, "embeddingTensor");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_21;
            }
            CDMOSLoggerForCategory(0);
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "embeddingVersion");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v21 = "+[CDMServiceGraphUtil extractStableEmbeddings:]";
              v22 = 2112;
              v23 = v12;
              _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: Found a stable embedding version %@, but it doesn't have embeddingTensor? skip this one", buf, 0x16u);

            }
          }
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v7)
          continue;
        break;
      }
    }

    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "+[CDMServiceGraphUtil extractStableEmbeddings:]";
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Did not find a stableEmbeddingVersion match, returning nil.", buf, 0xCu);
    }
    v13 = 0;
LABEL_21:
    v4 = v15;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "+[CDMServiceGraphUtil extractStableEmbeddings:]";
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Got nil embeddingsOutput, return nil", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)embeddingsOutput:(id)a3 embeddingConfig:(id)a4 forFactor:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:
      v23 = 0;
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136315138;
    v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
    v24 = "%s Got nil embeddingsOutput, return nil";
LABEL_32:
    _os_log_debug_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
    goto LABEL_23;
  }
  if (!v8)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    *(_DWORD *)buf = 136315138;
    v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
    v24 = "%s Got nil embeddingConfig, return nil";
    goto LABEL_32;
  }
  objc_msgSend(v8, "getEmbeddingConfigForFactor:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v26 = v9;
    v27 = v8;
    -[NSObject embeddingModelVersion](v10, "embeddingModelVersion");
    v12 = objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = v7;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v18, "hasEmbeddingVersion"))
          {
            objc_msgSend(v18, "embeddingVersion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v12);

            if (v20)
            {
              if ((objc_msgSend(v18, "hasEmbeddingTensor") & 1) != 0)
              {
                objc_msgSend(v18, "embeddingTensor");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_28;
              }
              CDMOSLoggerForCategory(0);
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
              }

            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v15)
          continue;
        break;
      }
    }

    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: Did not find a EmbeddingTensorOutput that matches version=%@, returning nil.", buf, 0x16u);
    }

    v23 = 0;
LABEL_28:
    v8 = v27;
    v7 = v28;
    v9 = v26;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: No EmbeddingConfigItem for factor=%@, return nil", buf, 0x16u);
    }
    v23 = 0;
  }

LABEL_30:
  return v23;
}

@end
