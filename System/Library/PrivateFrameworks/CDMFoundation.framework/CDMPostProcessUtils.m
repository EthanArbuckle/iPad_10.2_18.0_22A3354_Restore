@implementation CDMPostProcessUtils

+ (id)runPostProcess:(id)a3 snlcRequest:(id)a4 snlcResponse:(id)a5 nLv4Request:(id)a6 nLv4Response:(id)a7 uaapNLProtoResponse:(id)a8 catiProtoResponse:(id)a9 pscRequest:(id)a10 pscResponse:(id)a11 lvcResponse:(id)a12 overridesProtoResponse:(id)a13 mdRequest:(id)a14 mdResponse:(id)a15 mrRequest:(id)a16 mrResponse:(id)a17 spanProtoResponse:(id)a18 rdResponse:(id)a19 tokenProtoResponse:(id)a20 ssuResponse:(id)a21 ccqrResponse:(id)a22 correctionOutcome:(id)a23 nluRequest:(id)a24 graphInput:(id)a25 debugText:(id)a26
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  NSObject *v94;
  __CFString *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  NSObject *v101;
  CDMAssistantNLUResponse *v102;
  void *v103;
  void *v104;
  CDMAssistantNLUResponse *v105;
  __CFString *v107;
  __CFString *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  __CFString *v133;
  id v134;
  void *v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  const char *v148;
  __int16 v149;
  const __CFString *v150;
  __int16 v151;
  void *v152;
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  v132 = a3;
  v30 = a5;
  v31 = a7;
  v131 = a8;
  v32 = a9;
  v33 = a11;
  v130 = a12;
  v34 = a13;
  v35 = a17;
  v134 = a18;
  v129 = a19;
  v128 = a20;
  v36 = a21;
  v127 = a22;
  v126 = a23;
  v136 = a24;
  v133 = (__CFString *)a26;
  CDMOSLoggerForCategory(0);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_21A2A0000, v37, OS_LOG_TYPE_DEBUG, "%s Final post process step", buf, 0xCu);
  }

  v116 = v31;
  v117 = v30;
  if (+[CDMLogging debugEnabled](CDMLogging, "debugEnabled"))
  {
    objc_msgSend(v136, "data");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "base64EncodedDataWithOptions:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v39, 4);
    v41 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      v149 = 2112;
      v150 = CFSTR("cdmio");
      v151 = 2112;
      v152 = v40;
      _os_log_debug_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSIRINLUEXTERNALCDMNluRequest base64:\n%@", buf, 0x20u);
    }

    v31 = v116;
    v30 = v117;
  }
  if (v132)
  {
    objc_msgSend(v132, "voiceCommandsUserParses");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "autoShortcutParses");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      goto LABEL_9;
LABEL_12:
    v42 = MEMORY[0x24BDBD1A8];
    if (v31)
      goto LABEL_10;
    goto LABEL_13;
  }
  v124 = (void *)MEMORY[0x24BDBD1A8];
  v125 = (void *)MEMORY[0x24BDBD1A8];
  if (!v30)
    goto LABEL_12;
LABEL_9:
  objc_msgSend(v30, "snlcParses");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
LABEL_10:
    objc_msgSend(v31, "nluResponse");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "parses");
    v44 = objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
LABEL_13:
  v44 = MEMORY[0x24BDBD1A8];
LABEL_14:
  if (v131)
  {
    objc_msgSend(v131, "nluResponse");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "parses");
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      goto LABEL_16;
  }
  else
  {
    v123 = (void *)MEMORY[0x24BDBD1A8];
    if (v32)
    {
LABEL_16:
      objc_msgSend(v32, "response");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "hypotheses");
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        goto LABEL_17;
LABEL_21:
      v121 = (void *)MEMORY[0x24BDBD1A8];
      if (v34)
        goto LABEL_18;
      goto LABEL_22;
    }
  }
  v122 = (void *)MEMORY[0x24BDBD1A8];
  if (!v33)
    goto LABEL_21;
LABEL_17:
  objc_msgSend(v33, "pscParses");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
LABEL_18:
    objc_msgSend(v34, "parsesForReplacement");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "parsesForAppending");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_22:
  v119 = (void *)MEMORY[0x24BDBD1A8];
  v120 = (void *)MEMORY[0x24BDBD1A8];
LABEL_23:
  v112 = v36;
  if (v36)
  {
    objc_msgSend(v36, "ssuResponse");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hypotheses");
    v48 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = MEMORY[0x24BDBD1A8];
  }
  v115 = v32;
  v109 = (void *)v48;
  v110 = (void *)v44;
  v111 = (void *)v42;
  +[CDMPostProcessUtils selectParsesFromUserParsesUaaP:userParsesShortcut:userParsesReplaceOverrides:userParsesAppendOverrides:userParsesSNLC:userParsesNLv4:userParsesCATI:userParsesPSC:userParsesAutoShortcuts:userParsesSSU:addDebugInfo:](CDMPostProcessUtils, "selectParsesFromUserParsesUaaP:userParsesShortcut:userParsesReplaceOverrides:userParsesAppendOverrides:userParsesSNLC:userParsesNLv4:userParsesCATI:userParsesPSC:userParsesAutoShortcuts:userParsesSSU:addDebugInfo:", v123, v125, v120, v119, v42, v44, v122, v121, v124, v48, v133);
  v49 = objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_21A2A0000, v50, OS_LOG_TYPE_DEBUG, "%s Convert SiriNLUTypes internal spans to external spans", buf, 0xCu);
  }

  v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v35, "response");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "mentions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils filterAndConvertInternalMatchingSpans:](CDMPostProcessUtils, "filterAndConvertInternalMatchingSpans:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObjectsFromArray:", v54);

  objc_msgSend(v134, "matchingSpansForNL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils filterAndConvertInternalMatchingSpans:](CDMPostProcessUtils, "filterAndConvertInternalMatchingSpans:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObjectsFromArray:", v56);

  objc_msgSend(v134, "matchingSpansForExternalParsers");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils filterAndConvertInternalMatchingSpans:](CDMPostProcessUtils, "filterAndConvertInternalMatchingSpans:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObjectsFromArray:", v58);

  CDMOSLoggerForCategory(0);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_21A2A0000, v59, OS_LOG_TYPE_DEBUG, "%s Annotate DelegatedUserDialogActs with external spans", buf, 0xCu);
  }

  objc_msgSend(v35, "response");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "rewrittenUtterance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils annotateDelegatedUDAParses:matchingSpans:mrRewrittenUtterance:](CDMPostProcessUtils, "annotateDelegatedUDAParses:matchingSpans:mrRewrittenUtterance:", v49, v51, v61);

  CDMOSLoggerForCategory(0);
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_21A2A0000, v62, OS_LOG_TYPE_DEBUG, "%s Annotate all UserParse with correction outcome", buf, 0xCu);
  }

  +[CDMPostProcessUtils getCorrectionOutcomeFromUserParses:ccqrCorrectionOutcome:](CDMPostProcessUtils, "getCorrectionOutcomeFromUserParses:ccqrCorrectionOutcome:", v49, v126);
  v63 = objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils annotateUserParses:correctionOutcome:](CDMPostProcessUtils, "annotateUserParses:correctionOutcome:", v49, v63);
  if (+[CDMFeatureFlags isAmbiguityRefactorEnabled](CDMFeatureFlags, "isAmbiguityRefactorEnabled"))
  {
    CDMOSLoggerForCategory(0);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      _os_log_debug_impl(&dword_21A2A0000, v64, OS_LOG_TYPE_DEBUG, "%s Remove the probability from each parse", buf, 0xCu);
    }

    +[CDMPostProcessUtils removeProbabilityFromUserParses:](CDMPostProcessUtils, "removeProbabilityFromUserParses:", v49);
  }
  v118 = (void *)v49;
  v65 = (void *)v63;
  v135 = v35;
  v113 = v34;
  v114 = v33;
  CDMOSLoggerForCategory(0);
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_21A2A0000, v66, OS_LOG_TYPE_DEBUG, "%s Create NLU Response", buf, 0xCu);
  }

  v67 = objc_alloc_init(MEMORY[0x24BE9E088]);
  objc_msgSend(v136, "requestId");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setRequestId:", v68);

  v69 = (void *)objc_msgSend(v118, "mutableCopy");
  objc_msgSend(v67, "setParses:", v69);

  +[CDMServiceGraphUtil buildRepetitionResult:](CDMServiceGraphUtil, "buildRepetitionResult:", v129);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  objc_msgSend(v67, "parses");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v141, v146, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v73; ++i)
      {
        if (*(_QWORD *)v142 != v74)
          objc_enumerationMutation(v71);
        objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * i), "setRepetitionResult:", v70);
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v141, v146, 16);
    }
    while (v73);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v70);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setRepetitionResults:", v76);

  if (+[CDMServiceGraphUtil debugInfoEnabled:](CDMServiceGraphUtil, "debugInfoEnabled:", v136))
  {
    -[__CFString appendString:](v133, "appendString:", CFSTR("\n\n*** ✅ FOR DEBUGGING (end) ***"));
    objc_msgSend(v67, "setDebugText:", v133);
    CDMOSLoggerForCategory(0);
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      v149 = 2112;
      v150 = v133;
      _os_log_debug_impl(&dword_21A2A0000, v77, OS_LOG_TYPE_DEBUG, "%s Debug info %@", buf, 0x16u);
    }

  }
  objc_msgSend(v134, "matchingSpansForNL");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend(v78, "mutableCopy");

  objc_msgSend(v135, "response");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "mentions");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "count");

  if (v82)
  {
    CDMOSLoggerForCategory(0);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v135, "response");
      v108 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      v149 = 2112;
      v150 = v108;
      _os_log_debug_impl(&dword_21A2A0000, v83, OS_LOG_TYPE_DEBUG, "%s Found mention resolver spans, MR response: %@", buf, 0x16u);

    }
    objc_msgSend(v135, "response");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "mentions");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v85);

  }
  objc_msgSend(v128, "response");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "tokenChain");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils annotateNLUResponse:nluRequest:matchingSpans:tokenChain:](CDMPostProcessUtils, "annotateNLUResponse:nluRequest:matchingSpans:tokenChain:", v67, v136, v79, v87);

  objc_msgSend(v130, "languageVariantResult");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setLanguageVariantResult:", v88);

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  objc_msgSend(v67, "parses");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v138;
    do
    {
      for (j = 0; j != v91; ++j)
      {
        if (*(_QWORD *)v138 != v92)
          objc_enumerationMutation(v89);
        objc_msgSend(a1, "mapVocGenericBundleIdsToPlatformBundleIdsForParse:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * j));
      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
    }
    while (v91);
  }

  CDMOSLoggerForCategory(0);
  v94 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_21A2A0000, v94, OS_LOG_TYPE_DEBUG, "%s Annotate NLUResponse with external spans and rewrite message", buf, 0xCu);
  }

  objc_msgSend(v127, "rewriteMsg");
  v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v95)
  {
    v96 = (void *)objc_opt_class();
    objc_msgSend(v135, "response");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "rewrittenUtterance");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "rewriteMessageFromMatchingSpans:mrRewrittenUtterance:", v51, v98);
    v95 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  CDMOSLoggerForCategory(0);
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    v149 = 2112;
    v150 = v95;
    _os_log_debug_impl(&dword_21A2A0000, v99, OS_LOG_TYPE_DEBUG, "%s Rewrite message: %@", buf, 0x16u);
  }

  +[CDMPostProcessUtils supplementaryOutputFromMatchingSpans:rewriteMessage:correctionOutcome:](CDMPostProcessUtils, "supplementaryOutputFromMatchingSpans:rewriteMessage:correctionOutcome:", v51, v95, v65);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setSupplementaryOutput:", v100);

  CDMOSLoggerForCategory(0);
  v101 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v67, "supplementaryOutput");
    v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    v149 = 2112;
    v150 = v107;
    _os_log_debug_impl(&dword_21A2A0000, v101, OS_LOG_TYPE_DEBUG, "%s NLUResponse supplementaryOutput: %@", buf, 0x16u);

  }
  v102 = [CDMAssistantNLUResponse alloc];
  objc_msgSend(v67, "requestId");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "idA");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = -[CDMAssistantNLUResponse initWithNLUResponse:requestId:](v102, "initWithNLUResponse:requestId:", v67, v104);

  return v105;
}

+ (id)selectParsesFromUserParsesUaaP:(id)a3 userParsesShortcut:(id)a4 userParsesReplaceOverrides:(id)a5 userParsesAppendOverrides:(id)a6 userParsesSNLC:(id)a7 userParsesNLv4:(id)a8 userParsesCATI:(id)a9 userParsesPSC:(id)a10 userParsesAutoShortcuts:(id)a11 userParsesSSU:(id)a12 addDebugInfo:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v18 = a4;
  v19 = a5;
  v34 = a6;
  v20 = a7;
  v33 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  if (+[CDMFeatureFlags isUaaPEnabled](CDMFeatureFlags, "isUaaPEnabled")
    && +[CDMFeatureFlags isUaaPPreferred](CDMFeatureFlags, "isUaaPPreferred")
    && objc_msgSend(v35, "count"))
  {
    v26 = v20;
    CDMOSLoggerForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "+[CDMPostProcessUtils selectParsesFromUserParsesUaaP:userParsesShortcut:userParsesReplaceOverrides:userParse"
            "sAppendOverrides:userParsesSNLC:userParsesNLv4:userParsesCATI:userParsesPSC:userParsesAutoShortcuts:userPars"
            "esSSU:addDebugInfo:]";
      _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s UaaP parses preferred, all other parses will be ignored", buf, 0xCu);
    }

    v28 = v35;
    v29 = v35;
    goto LABEL_11;
  }
  if (!objc_msgSend(v18, "count"))
  {
    v28 = v35;
    if (!objc_msgSend(v19, "count"))
    {
      v26 = v20;
      +[CDMPostProcessUtils getPostProcessUserParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:](CDMPostProcessUtils, "getPostProcessUserParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:", v20, v33, v21, v35, v22, v23, v34, v24, v25);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v26 = v20;
    v29 = v19;
LABEL_11:
    +[CDMPostProcessUtils getPostProcessUserParses:](CDMPostProcessUtils, "getPostProcessUserParses:", v29);
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v30 = (void *)v31;
    goto LABEL_14;
  }
  v26 = v20;
  +[CDMPostProcessUtils getPostProcessUserParses:](CDMPostProcessUtils, "getPostProcessUserParses:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v35;
LABEL_14:

  return v30;
}

+ (void)runFeatureStore:(id)a3 nluResponse:(id)a4 snlcRequest:(id)a5 snlcResponse:(id)a6 pscRequest:(id)a7 pscResponse:(id)a8 spanProtoResponse:(id)a9 tokenProtoResponse:(id)a10 mdRequest:(id)a11 mdResponse:(id)a12 mrRequest:(id)a13 mrResponse:(id)a14 nLv4Request:(id)a15 nLv4Response:(id)a16
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v40;
  void *v41;
  void *v42;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint8_t buf[4];
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v72 = a16;
  v71 = a15;
  v70 = a14;
  v69 = a13;
  v68 = a12;
  v67 = a11;
  v66 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  CDMOSLoggerForCategory(0);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v74 = "+[CDMPostProcessUtils runFeatureStore:nluResponse:snlcRequest:snlcResponse:pscRequest:pscResponse:spanProtoRes"
          "ponse:tokenProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:nLv4Request:nLv4Response:]";
    _os_log_debug_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_DEBUG, "%s FeatureStore Insertion", buf, 0xCu);
  }

  +[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:](CDMFeatureStoreUtils, "insertRequestToFeatureStoreAsJson:", v25);
  +[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:](CDMFeatureStoreUtils, "insertResponseToFeatureStoreAsJson:", v24);

  objc_msgSend(v23, "parserRequest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "idA");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertSNLCRequestToFeatureStore:interactionId:", v27, v29);

  objc_msgSend(v22, "snlcResponse");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "idA");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertSNLCResponseToFeatureStore:interactionId:", v30, v32);

  objc_msgSend(v21, "parserRequest");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "idA");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertPSCRequestToFeatureStore:interactionId:", v33, v35);

  objc_msgSend(v20, "pscResponse");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "idA");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertPSCResponseToFeatureStore:interactionId:", v36, v38);

  objc_msgSend(v19, "spanMatchResponse");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "idA");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertSpanMatchResponseToFeatureStore:interactionId:", v39, v41);

  objc_msgSend(v66, "response");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "idA");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertTokenizerResponseToFeatureStore:interactionId:", v42, v44);

  objc_msgSend(v67, "mdRequest");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "idA");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertMDRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMDRequestToFeatureStore:interactionId:", v45, v47);

  objc_msgSend(v68, "response");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "idA");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertMDResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMDResponseToFeatureStore:interactionId:", v48, v50);

  objc_msgSend(v69, "mrRequest");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "idA");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertMRRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMRRequestToFeatureStore:interactionId:", v51, v53);

  objc_msgSend(v70, "response");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "idA");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertMRResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertMRResponseToFeatureStore:interactionId:", v54, v56);

  objc_msgSend(v71, "parserRequest");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "idA");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertNLv4ParserRequestToFeatureStore:interactionId:", v57, v59);

  objc_msgSend(v72, "parserResponse");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "requestId");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "idA");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:interactionId:](CDMFeatureStoreUtils, "insertNLv4ParserResponseToFeatureStore:interactionId:", v60, v62);

}

+ (id)usoGraphs:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "userDialogActs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (!v10)
        {
          v12 = 0;
          goto LABEL_35;
        }
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
            if (objc_msgSend(v15, "hasUserStatedTask"))
            {
              objc_msgSend(v15, "userStatedTask");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "task");
              v17 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (objc_msgSend(v15, "hasAccepted"))
              {
                objc_msgSend(v15, "accepted");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else if (objc_msgSend(v15, "hasRejected"))
              {
                objc_msgSend(v15, "rejected");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else if (objc_msgSend(v15, "hasAcknowledged"))
              {
                objc_msgSend(v15, "acknowledged");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else if (objc_msgSend(v15, "hasCancelled"))
              {
                objc_msgSend(v15, "cancelled");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else if (objc_msgSend(v15, "hasWantedToPause"))
              {
                objc_msgSend(v15, "wantedToPause");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else if (objc_msgSend(v15, "hasWantedToProceed"))
              {
                objc_msgSend(v15, "wantedToProceed");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (!objc_msgSend(v15, "hasWantedToRepeat"))
                  goto LABEL_29;
                objc_msgSend(v15, "wantedToRepeat");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v16 = v18;
              objc_msgSend(v18, "reference");
              v17 = objc_claimAutoreleasedReturnValue();
            }
            v19 = (void *)v17;

            v12 = v19;
LABEL_29:
            if (v12)
              objc_msgSend(v4, "addObject:", v12);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v11);
LABEL_35:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)getGroupIndexDict:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = v3;
  objc_msgSend(v3, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasGroupIndex") & 1) == 0)
          objc_msgSend(v10, "setGroupIndex:", 0);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", objc_msgSend(v10, "nodeIndex"));
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 || (v13 = objc_msgSend(v10, "groupIndex"), v13 > objc_msgSend(v12, "unsignedIntValue")))
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", objc_msgSend(v10, "groupIndex"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)spanIndexDict:(id)a3 tokenChain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  __int128 v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v57;
    *(_QWORD *)&v9 = 136315394;
    v35 = v9;
    v37 = *(_QWORD *)v57;
    do
    {
      v12 = 0;
      v38 = v10;
      do
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v12);
        objc_msgSend(v41, "usoGraph", v35);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "identifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16)
          {
            v40 = v12;
            v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v14, "alignments");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "initWithCapacity:", 2 * objc_msgSend(v18, "count"));
            v20 = v14;
            v21 = (void *)v19;

            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v44 = v20;
            objc_msgSend(v20, "alignments");
            v42 = (id)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
            if (v45)
            {
              v43 = *(_QWORD *)v53;
              do
              {
                v22 = 0;
                do
                {
                  if (*(_QWORD *)v53 != v43)
                    objc_enumerationMutation(v42);
                  v46 = v22;
                  v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v22);
                  objc_msgSend(a1, "entityKeyFrom:at:", v44, objc_msgSend(v23, "nodeIndex"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  v51 = 0u;
                  objc_msgSend(v23, "spans");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
                  if (v26)
                  {
                    v27 = v26;
                    v28 = *(_QWORD *)v49;
                    do
                    {
                      for (i = 0; i != v27; ++i)
                      {
                        if (*(_QWORD *)v49 != v28)
                          objc_enumerationMutation(v25);
                        v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                        *(_DWORD *)buf = 0;
                        *(_DWORD *)buf = objc_msgSend(v30, "startIndex");
                        v47 = 0;
                        v47 = objc_msgSend(v30, "endIndex");
                        objc_msgSend(a1, "updateIndexesForSignificantTokensFrom:to:tokenChain:entityKey:", buf, &v47, v7, v24);
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)buf);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "addObject:", v31);

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v47);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "addObject:", v32);

                      }
                      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
                    }
                    while (v27);
                  }

                  v22 = v46 + 1;
                }
                while (v46 + 1 != v45);
                v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
              }
              while (v45);
            }

            if (objc_msgSend(v21, "count"))
            {
              objc_msgSend(v21, "sortUsingSelector:", sel_compare_);
              objc_msgSend(v36, "objectForKeyedSubscript:", v21);
              v33 = objc_claimAutoreleasedReturnValue();
              v11 = v37;
              v10 = v38;
              v12 = v40;
              if (!v33)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v33 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setObject:forKeyedSubscript:", v33, v21);
              }
              -[NSObject addObject:](v33, "addObject:", v41);
            }
            else
            {
              CDMOSLoggerForCategory(0);
              v33 = objc_claimAutoreleasedReturnValue();
              v11 = v37;
              v10 = v38;
              v12 = v40;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v35;
                v61 = "+[CDMPostProcessUtils spanIndexDict:tokenChain:]";
                v62 = 2112;
                v63 = v41;
                _os_log_debug_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEBUG, "%s Found a MatchingSpan without an utterance span alignment: %@", buf, 0x16u);
              }
            }

            v14 = v44;
          }
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v10);
  }

  return v36;
}

+ (void)stripBugFixNamespaceSuffix:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "namespaceA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("BugFix"));

  if (v5)
  {
    objc_msgSend(v12, "namespaceA");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "namespaceA");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", objc_msgSend(v9, "length") - objc_msgSend(CFSTR("BugFix"), "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "namespaceA");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:", v10);

  }
}

+ (void)stripBugFixPropertyKeySuffix:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v3;
    objc_msgSend(v3, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hasSuffix:", CFSTR("BugFix"));

          if (v13)
          {
            objc_msgSend(v11, "key");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "key");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "substringToIndex:", objc_msgSend(v15, "length") - objc_msgSend(CFSTR("BugFix"), "length"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setKey:", v16);

          }
          objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v3 = v17;
    objc_msgSend(v17, "setProperties:", v5);

  }
}

+ (void)copyAlignedSpanIdentifierForSameType:(id)a3 spanIndexDict:(id)a4 utteranceAlignment:(id)a5 entityKey:(id)a6 groupIndexDict:(id)a7 tokenChain:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  int v53;
  void *v54;
  unsigned int v55;
  unsigned int v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  unsigned int v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  const char *v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v60 = a4;
  v13 = a5;
  v14 = a6;
  v59 = a7;
  v15 = a8;
  v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v13, "spans");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithCapacity:", 2 * objc_msgSend(v17, "count"));

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v74 = v13;
  objc_msgSend(v13, "spans");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v91 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        *(_DWORD *)buf = 0;
        *(_DWORD *)buf = objc_msgSend(v24, "startIndex");
        v89 = 0;
        v89 = objc_msgSend(v24, "endIndex");
        objc_msgSend(a1, "updateIndexesForSignificantTokensFrom:to:tokenChain:entityKey:", buf, &v89, v15, v14);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)buf);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v25);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v89);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "sortUsingSelector:", sel_compare_);
    objc_msgSend(v60, "objectForKeyedSubscript:", v18);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", objc_msgSend(v13, "nodeIndex"));
      objc_msgSend(v59, "objectForKeyedSubscript:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v29;
      if (v29)
        v30 = objc_msgSend(v29, "unsignedIntValue", v29) + 1;
      else
        v30 = 0;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v31 = v28;
      v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v86;
        v67 = v14;
        v63 = v18;
        v64 = v15;
        v61 = *(_QWORD *)v86;
        v62 = v31;
        do
        {
          v35 = 0;
          v65 = v33;
          do
          {
            if (*(_QWORD *)v86 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v35), "usoGraph", v57);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v36;
            if (v36)
            {
              v83 = 0u;
              v84 = 0u;
              v81 = 0u;
              v82 = 0u;
              objc_msgSend(v36, "alignments");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
              if (v38)
              {
                v66 = v35;
                v39 = 0;
                v40 = 0;
                v41 = *(_QWORD *)v82;
                v42 = v70;
                v43 = v37;
                v44 = v38;
                v68 = *(_QWORD *)v82;
                v69 = v37;
                do
                {
                  v45 = 0;
                  v71 = v44;
                  do
                  {
                    if (*(_QWORD *)v82 != v41)
                      objc_enumerationMutation(v43);
                    v73 = v45;
                    v46 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v45);
                    objc_msgSend(a1, "entityKeyFrom:at:", v42, objc_msgSend(v46, "nodeIndex"));
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v72, "isEqualToEntityKey:", v14))
                    {
                      v79 = 0u;
                      v80 = 0u;
                      v77 = 0u;
                      v78 = 0u;
                      objc_msgSend(v42, "identifiers");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
                      if (v48)
                      {
                        v49 = v48;
                        v50 = *(_QWORD *)v78;
                        do
                        {
                          for (j = 0; j != v49; ++j)
                          {
                            if (*(_QWORD *)v78 != v50)
                              objc_enumerationMutation(v47);
                            v52 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
                            v53 = objc_msgSend(v52, "nodeIndex");
                            if (v53 == objc_msgSend(v46, "nodeIndex"))
                            {
                              v54 = (void *)objc_opt_new();
                              objc_msgSend(v52, "copyTo:", v54);
                              objc_msgSend(v54, "setNodeIndex:", objc_msgSend(v74, "nodeIndex"));
                              objc_msgSend(v54, "setGroupIndex:", objc_msgSend(v52, "groupIndex") + v30);
                              objc_msgSend(a1, "stripBugFixNamespaceSuffix:", v52);
                              v55 = objc_msgSend(v52, "groupIndex");
                              if (v40 <= v55)
                                v40 = v55;
                              objc_msgSend(v75, "addObject:", v54);

                              v39 = 1;
                            }
                          }
                          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
                        }
                        while (v49);
                      }

                      v14 = v67;
                      v41 = v68;
                      v43 = v69;
                      v42 = v70;
                      v44 = v71;
                    }

                    v45 = v73 + 1;
                  }
                  while (v73 + 1 != v44);
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
                }
                while (v44);

                if ((v39 & 1) != 0)
                  v56 = v40 + 1;
                else
                  v56 = 0;
                v30 += v56;
                v18 = v63;
                v15 = v64;
                v34 = v61;
                v31 = v62;
                v33 = v65;
                v35 = v66;
              }
              else
              {

              }
            }

            ++v35;
          }
          while (v35 != v33);
          v33 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
        }
        while (v33);
      }

    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v98 = "+[CDMPostProcessUtils copyAlignedSpanIdentifierForSameType:spanIndexDict:utteranceAlignment:entityKey:groupI"
            "ndexDict:tokenChain:]";
      v99 = 2112;
      v100 = v74;
      _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, "%s Found an alignment without indexes, ignoring: %@", buf, 0x16u);
    }
  }

}

+ (void)copyAlignedSpanEntitySpanForSameType:(id)a3 spanIndexDict:(id)a4 utteranceAlignment:(id)a5 entityKey:(id)a6 tokenChain:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  int v41;
  id v42;
  void *v43;
  NSObject *v44;
  id v45;
  NSObject *obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  unsigned int v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  id v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v58 = a3;
  v45 = a4;
  v12 = a5;
  v57 = a6;
  v13 = a7;
  v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v12, "spans");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v14, "initWithCapacity:", 2 * objc_msgSend(v15, "count"));

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(v12, "spans");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v73 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        *(_DWORD *)buf = 0;
        *(_DWORD *)buf = objc_msgSend(v21, "startIndex");
        v71 = 0;
        v71 = objc_msgSend(v21, "endIndex");
        objc_msgSend(a1, "updateIndexesForSignificantTokensFrom:to:tokenChain:entityKey:", buf, &v71, v13, v57);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)buf);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v22);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v71);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    }
    while (v18);
  }

  if (!objc_msgSend(v50, "count"))
  {
    CDMOSLoggerForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    v24 = v45;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "+[CDMPostProcessUtils copyAlignedSpanEntitySpanForSameType:spanIndexDict:utteranceAlignment:entityKey:tokenChain:]";
      v81 = 2112;
      v82 = v12;
      _os_log_debug_impl(&dword_21A2A0000, v44, OS_LOG_TYPE_DEBUG, "%s Found an alignment without indexes, ignoring: %@", buf, 0x16u);
    }
    goto LABEL_42;
  }
  objc_msgSend(v50, "sortUsingSelector:", sel_compare_);
  v24 = v45;
  objc_msgSend(v45, "objectForKeyedSubscript:", v50);
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v44 = 0;
LABEL_42:
    v43 = v50;
    goto LABEL_43;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v25;
  v48 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v68 != v47)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "usoGraph");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          v49 = j;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          objc_msgSend(v27, "alignments");
          v54 = (id)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v64;
            v51 = *(_QWORD *)v64;
            v52 = v28;
            do
            {
              v32 = 0;
              v53 = v30;
              do
              {
                if (*(_QWORD *)v64 != v31)
                  objc_enumerationMutation(v54);
                v33 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v32);
                objc_msgSend(a1, "entityKeyFrom:at:", v28, objc_msgSend(v33, "nodeIndex"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v34, "isEqualToEntityKey:", v57))
                {
                  v55 = v34;
                  v56 = v32;
                  v61 = 0u;
                  v62 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  objc_msgSend(v28, "spans");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
                  if (v36)
                  {
                    v37 = v36;
                    v38 = *(_QWORD *)v60;
                    do
                    {
                      for (k = 0; k != v37; ++k)
                      {
                        if (*(_QWORD *)v60 != v38)
                          objc_enumerationMutation(v35);
                        v40 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
                        v41 = objc_msgSend(v40, "nodeIndex");
                        if (v41 == objc_msgSend(v33, "nodeIndex"))
                        {
                          v42 = objc_alloc_init(MEMORY[0x24BE9E178]);
                          objc_msgSend(v40, "copyTo:", v42);
                          objc_msgSend(v42, "setNodeIndex:", objc_msgSend(v12, "nodeIndex"));
                          objc_msgSend(a1, "stripBugFixPropertyKeySuffix:", v42);
                          objc_msgSend(v58, "addObject:", v42);

                        }
                      }
                      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
                    }
                    while (v37);
                  }

                  v31 = v51;
                  v28 = v52;
                  v30 = v53;
                  v34 = v55;
                  v32 = v56;
                }

                ++v32;
              }
              while (v32 != v30);
              v30 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
            }
            while (v30);
          }

          j = v49;
        }

      }
      v48 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    }
    while (v48);
    v24 = v45;
  }
  v43 = v50;
  v44 = obj;
LABEL_43:

}

+ (void)copySubsumedSpanEntitySpan:(id)a3 spans:(id)a4 parseEntityKey:(id)a5 utteranceAlignment:(id)a6 tokenChain:(id)a7
{
  id v11;
  id v12;
  __objc2_class **v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __objc2_class *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  int v32;
  id v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v11 = a4;
  v52 = a5;
  v12 = a6;
  v48 = a7;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v11;
  v40 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v63;
    v13 = off_24DCA1000;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v63 != v39)
          objc_enumerationMutation(obj);
        v49 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v49, "usoGraph");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v41 = i;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend(v15, "alignments");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v59;
            v43 = v17;
            v44 = v16;
            v42 = *(_QWORD *)v59;
            do
            {
              v21 = 0;
              v45 = v19;
              do
              {
                if (*(_QWORD *)v59 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v21);
                if (objc_msgSend(v22, "subsumedBy:", v12))
                {
                  v47 = v21;
                  v23 = v13[20];
                  objc_msgSend(v49, "usoGraph");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[__objc2_class entityKeyFrom:at:](v23, "entityKeyFrom:at:", v24, objc_msgSend(v22, "nodeIndex"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v25, "isEqualToEntityKey:", v52))
                  {
                    v46 = v25;
                    v56 = 0u;
                    v57 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    objc_msgSend(v16, "spans");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
                    if (v27)
                    {
                      v28 = v27;
                      v29 = *(_QWORD *)v55;
                      do
                      {
                        for (j = 0; j != v28; ++j)
                        {
                          if (*(_QWORD *)v55 != v29)
                            objc_enumerationMutation(v26);
                          v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
                          v32 = objc_msgSend(v31, "nodeIndex");
                          if (v32 == objc_msgSend(v22, "nodeIndex"))
                          {
                            v33 = objc_alloc_init(MEMORY[0x24BE9E178]);
                            objc_msgSend(v31, "copyTo:", v33);
                            objc_msgSend(v33, "setNodeIndex:", objc_msgSend(v12, "nodeIndex"));
                            v34 = objc_alloc_init(MEMORY[0x24BE9E0E0]);
                            objc_msgSend(v34, "setAttachmentType:", objc_msgSend(v22, "equalIndexes:", v12) ^ 1);
                            +[EntityKey userEntity](EntityKey, "userEntity");
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            v36 = objc_msgSend(v35, "isEqualToEntityKey:", v52);

                            if (v36)
                            {
                              objc_msgSend(v33, "properties");
                              v50 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(a1, "getSignificantTokenCountFrom:to:within:", objc_msgSend(v49, "startTokenIndex"), objc_msgSend(v49, "endTokenIndex"), v48);
                              v37 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v50, "addObject:", v37);

                            }
                            objc_msgSend(v33, "setPayloadAttachmentInfo:", v34);
                            objc_msgSend(a1, "stripBugFixPropertyKeySuffix:", v33);
                            objc_msgSend(v51, "addObject:", v33);

                          }
                        }
                        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
                      }
                      while (v28);
                    }

                    v13 = off_24DCA1000;
                    v17 = v43;
                    v16 = v44;
                    v20 = v42;
                    v19 = v45;
                    v25 = v46;
                  }

                  v21 = v47;
                }
                ++v21;
              }
              while (v21 != v19);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            }
            while (v19);
          }

          i = v41;
        }

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v40);
  }

}

+ (BOOL)hasEntityEdgeTo:(int)a3 inGraph:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a4, "edges", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasToIndex"))
        {
          if (objc_msgSend(v10, "toIndex") == a3)
          {
            if (objc_msgSend(v10, "hasLabel"))
            {
              objc_msgSend(v10, "label");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "usoElementId");

              if (v12 == 1271)
              {
                v13 = 1;
                goto LABEL_14;
              }
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_14:

  return v13;
}

+ (void)copyMentionResolverSpanIdentifiers:(id)a3 fromMatchingSpans:(id)a4 toParseGraph:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  unint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  NSObject *v47;
  unsigned int v48;
  void *v49;
  unint64_t v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  int v59;
  void *v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v51 = a4;
  v8 = a5;
  objc_msgSend(v8, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    goto LABEL_51;
  v11 = 0;
  v53 = v8;
  do
  {
    objc_msgSend(v8, "nodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v13;
    v14 = objc_msgSend(v13, "usoElementId");
    if (v14 == 2631)
    {
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      v15 = a1;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
        v17 = v16;
        v18 = "%s Found node of type Common_SpatialPosition";
        goto LABEL_50;
      }
    }
    else
    {
      v15 = a1;
      if (v14 != 1318)
      {
        if (v14 != 1282)
          goto LABEL_47;
        CDMOSLoggerForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        *(_DWORD *)buf = 136315138;
        v73 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
        v17 = v16;
        v18 = "%s Found node of type Common_ReferenceType";
        goto LABEL_50;
      }
      CDMOSLoggerForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
        v17 = v16;
        v18 = "%s Found node of type Common_ListPosition";
LABEL_50:
        _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
      }
    }
LABEL_11:

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v19 = v51;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (!v20)
      goto LABEL_46;
    v21 = v20;
    v59 = 0;
    v22 = *(_QWORD *)v69;
    v54 = *(_QWORD *)v69;
    v55 = v19;
    do
    {
      v23 = 0;
      v56 = v21;
      do
      {
        if (*(_QWORD *)v69 != v22)
          objc_enumerationMutation(v19);
        v57 = v23;
        v24 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v23);
        if (objc_msgSend(v15, "isInternalMatchingSpan:fromMatcher:", v24, 7)
          && objc_msgSend(v24, "hasUsoGraph"))
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(v24, "usoGraph");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifiers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          if (!v63)
          {

            v15 = a1;
            goto LABEL_44;
          }
          v27 = 0;
          v62 = 0;
          v60 = v24;
          v61 = *(_QWORD *)v65;
          v15 = a1;
          v28 = v26;
          while (1)
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v65 != v61)
                objc_enumerationMutation(v28);
              v30 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              v31 = objc_msgSend(v30, "nodeIndex");
              objc_msgSend(v24, "usoGraph");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v31) = objc_msgSend(v15, "hasEntityEdgeTo:inGraph:", v31, v32);

              if ((v31 & 1) != 0)
              {
                v33 = v24;
                v34 = v28;
                v35 = objc_opt_new();
                objc_msgSend(v30, "copyTo:", v35);
                v36 = v11;
                -[NSObject setNodeIndex:](v35, "setNodeIndex:", v11);
                objc_msgSend(v33, "internalSpanData");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v37, "hasMentionResolverSpanData") & 1) != 0)
                {
                  objc_msgSend(v33, "internalSpanData");
                  v38 = v7;
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "mentionResolverSpanData");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "hasJointScore");

                  v7 = v38;
                  v15 = a1;

                  if (v41)
                  {
                    v42 = objc_alloc_init(MEMORY[0x24BE9E048]);
                    objc_msgSend(v60, "internalSpanData");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "mentionResolverSpanData");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "jointScore");
                    -[NSObject setValue:](v42, "setValue:");

                    -[NSObject setProbability:](v35, "setProbability:", v42);
LABEL_32:
                    v11 = v36;

                    -[NSObject setSourceComponent:](v35, "setSourceComponent:", 3);
                    -[NSObject setGroupIndex:](v35, "setGroupIndex:", objc_msgSend(v30, "groupIndex") + v59);
                    v45 = objc_msgSend(v30, "groupIndex");
                    v46 = v62;
                    if (v62 <= v45)
                      v46 = v45;
                    v62 = v46;
                    CDMOSLoggerForCategory(0);
                    v47 = objc_claimAutoreleasedReturnValue();
                    v28 = v34;
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v73 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
                      v74 = 2112;
                      v75 = v30;
                      _os_log_debug_impl(&dword_21A2A0000, v47, OS_LOG_TYPE_DEBUG, "%s Found matching identifier from MRR_MATCHER span. Copying over identifier. Identifier: %@", buf, 0x16u);
                    }

                    objc_msgSend(v7, "addObject:", v35);
                    v27 = 1;
                    v24 = v60;
                    goto LABEL_37;
                  }
                }
                else
                {

                }
                CDMOSLoggerForCategory(0);
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v73 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
                  _os_log_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_INFO, "%s [WARN]: No joint model score found in mentionResolverSpanData, copying from identifier", buf, 0xCu);
                }
                goto LABEL_32;
              }
              CDMOSLoggerForCategory(0);
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v73 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
                v74 = 2112;
                v75 = v30;
                _os_log_debug_impl(&dword_21A2A0000, v35, OS_LOG_TYPE_DEBUG, "%s Skipping copy of identifier from MRR_MATCHER span. Identifier is not attached to a node with a entity edge. Identifier: %@", buf, 0x16u);
              }
LABEL_37:

            }
            v63 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
            if (!v63)
            {

              if ((v27 & 1) != 0)
                v48 = v62 + 1;
              else
                v48 = 0;
              v59 += v48;
              v8 = v53;
              v22 = v54;
              v19 = v55;
              v21 = v56;
              break;
            }
          }
        }
LABEL_44:
        v23 = v57 + 1;
      }
      while (v57 + 1 != v21);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v21);
LABEL_46:

LABEL_47:
    ++v11;
    objc_msgSend(v8, "nodes");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

  }
  while (v50 > v11);
LABEL_51:

}

+ (void)copyMentionResolverSpanEntitySpans:(id)a3 fromMatchingSpans:(id)a4 toParseGraph:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  double v45;
  id v46;
  NSObject *v47;
  void *v48;
  unint64_t v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v51 = a4;
  v9 = a5;
  objc_msgSend(v9, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    goto LABEL_45;
  v12 = 0;
  v50 = v9;
  do
  {
    objc_msgSend(v9, "nodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "usoElementId");
    switch(v15)
    {
      case 2631:
        CDMOSLoggerForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        v52 = v14;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v70 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
          v17 = v16;
          v18 = "%s Found node of type Common_SpatialPosition";
          goto LABEL_44;
        }
        break;
      case 1318:
        CDMOSLoggerForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        v52 = v14;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v70 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
          v17 = v16;
          v18 = "%s Found node of type Common_ListPosition";
LABEL_44:
          _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
        }
        break;
      case 1282:
        CDMOSLoggerForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        v52 = v14;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          break;
        *(_DWORD *)buf = 136315138;
        v70 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
        v17 = v16;
        v18 = "%s Found node of type Common_ReferenceType";
        goto LABEL_44;
      default:
        goto LABEL_41;
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v51;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (!v19)
      goto LABEL_40;
    v20 = v19;
    v21 = *(_QWORD *)v66;
    v57 = v12;
    v53 = *(_QWORD *)v66;
    do
    {
      v22 = 0;
      v54 = v20;
      do
      {
        if (*(_QWORD *)v66 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v22);
        if (objc_msgSend(a1, "isInternalMatchingSpan:fromMatcher:", v23, 7)
          && objc_msgSend(v23, "hasUsoGraph"))
        {
          v56 = v22;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          objc_msgSend(v23, "usoGraph");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "spans");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v57;
          v59 = v25;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          if (!v26)
            goto LABEL_37;
          v27 = v26;
          v28 = *(_QWORD *)v62;
          v58 = *(_QWORD *)v62;
          v60 = v23;
          while (1)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v62 != v28)
                objc_enumerationMutation(v59);
              v30 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              v31 = objc_msgSend(v30, "nodeIndex");
              objc_msgSend(v23, "usoGraph");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v31) = objc_msgSend(a1, "hasEntityEdgeTo:inGraph:", v31, v32);

              if ((v31 & 1) != 0)
              {
                v33 = v23;
                v34 = v27;
                v35 = objc_alloc_init(MEMORY[0x24BE9E178]);
                objc_msgSend(v30, "copyTo:", v35);
                -[NSObject setNodeIndex:](v35, "setNodeIndex:", v12);
                objc_msgSend(v33, "internalSpanData");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v36, "hasMentionResolverSpanData") & 1) != 0)
                {
                  objc_msgSend(v33, "internalSpanData");
                  v37 = a1;
                  v38 = v8;
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "mentionResolverSpanData");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "hasJointScore");

                  v8 = v38;
                  a1 = v37;
                  v12 = v57;

                  if (v41)
                  {
                    v42 = objc_alloc_init(MEMORY[0x24BE9E050]);
                    objc_msgSend(v60, "internalSpanData");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "mentionResolverSpanData");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "jointScore");
                    *(float *)&v45 = v45;
                    -[NSObject setValue:](v42, "setValue:", v45);

                    v46 = objc_alloc_init(MEMORY[0x24BE9E0B8]);
                    objc_msgSend(v46, "setMatchScore:", v42);
                    -[NSObject setMatchInfo:](v35, "setMatchInfo:", v46);

LABEL_32:
                    v28 = v58;
                    v27 = v34;

                    -[NSObject setSourceComponent:](v35, "setSourceComponent:", 3);
                    CDMOSLoggerForCategory(0);
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v70 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
                      v71 = 2112;
                      v72 = v30;
                      _os_log_debug_impl(&dword_21A2A0000, v47, OS_LOG_TYPE_DEBUG, "%s Found matching UsoEntitySpan from MRR_MATCHER span. Copying over UsoEntitySpan. UsoEntitySpan: %@", buf, 0x16u);
                    }

                    objc_msgSend(v8, "addObject:", v35);
                    v23 = v60;
                    goto LABEL_35;
                  }
                }
                else
                {

                }
                CDMOSLoggerForCategory(0);
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v70 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
                  _os_log_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_INFO, "%s [WARN]: No joint model score found in mentionResolverSpanData, copying from identifier", buf, 0xCu);
                }
                goto LABEL_32;
              }
              CDMOSLoggerForCategory(0);
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v70 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
                v71 = 2112;
                v72 = v30;
                _os_log_debug_impl(&dword_21A2A0000, v35, OS_LOG_TYPE_DEBUG, "%s Skipping copy of UsoEntitySpan from MRR_MATCHER span. UsoEntitySpan is not attached to a node with a entity edge. UsoEntitySpan: %@", buf, 0x16u);
              }
LABEL_35:

            }
            v27 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
            if (!v27)
            {
LABEL_37:

              v21 = v53;
              v20 = v54;
              v22 = v56;
              break;
            }
          }
        }
        ++v22;
      }
      while (v22 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v20);
LABEL_40:

    v9 = v50;
    v14 = v52;
LABEL_41:

    ++v12;
    objc_msgSend(v9, "nodes");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");

  }
  while (v49 > v12);
LABEL_45:

}

+ (void)copyASRTimingInfoToUtteranceSpan:(id)a3 startIndexTokenDict:(id)a4 endIndexTokenDict:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithInt:", objc_msgSend(v7, "startIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "setStartMilliSeconds:", objc_msgSend(v12, "startMilliSeconds"));
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315394;
      v19 = "+[CDMPostProcessUtils copyASRTimingInfoToUtteranceSpan:startIndexTokenDict:endIndexTokenDict:]";
      v20 = 1024;
      v21 = objc_msgSend(v7, "startIndex");
      _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Missing ASR Token for alignment with start index: %d", (uint8_t *)&v18, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "endIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "setEndMilliSeconds:", objc_msgSend(v15, "endMilliSeconds"));
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v7, "endIndex");
      v18 = 136315394;
      v19 = "+[CDMPostProcessUtils copyASRTimingInfoToUtteranceSpan:startIndexTokenDict:endIndexTokenDict:]";
      v20 = 1024;
      v21 = v17;
      _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s Missing ASR Token for alignment with end index: %d", (uint8_t *)&v18, 0x12u);
    }

  }
}

+ (id)getSignificantTokenCountFrom:(unsigned int)a3 to:(unsigned int)a4 within:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = (objc_class *)MEMORY[0x24BE9E130];
  v9 = a5;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v10, "setKey:", CFSTR("significantTokenCount"));
  objc_msgSend(a1, "significantTokenCountFrom:to:within:", v6, v5, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setValueInt:", v11);
  return v10;
}

+ (id)significantTokenCountFrom:(unsigned int)a3 to:(unsigned int)a4 within:(id)a5
{
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  LODWORD(v6) = a3;
  v7 = a5;
  objc_msgSend(v7, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= v6 || v6 >= a4)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    v6 = v6;
    v11 = a4;
    do
    {
      objc_msgSend(v7, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v6 >= v13)
        break;
      objc_msgSend(v7, "tokens");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isSignificant");

      v10 = (v10 + v16);
      ++v6;
    }
    while (v11 != v6);
  }
  v17 = objc_alloc_init(MEMORY[0x24BE9E058]);
  objc_msgSend(v17, "setValue:", v10);

  return v17;
}

+ (void)updateIndexesForSignificantTokensFrom:(unsigned int *)a3 to:(unsigned int *)a4 tokenChain:(id)a5 entityKey:(id)a6
{
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  id v21;
  void *v22;
  unint64_t v23;
  id v24;

  v24 = a5;
  v9 = a6;
  +[EntityKey currencyName](EntityKey, "currencyName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToEntityKey:", v9);
  if (!a3 || !v11)
  {
LABEL_24:

    goto LABEL_25;
  }

  if (a4)
  {
    objc_msgSend(v24, "tokens");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      v13 = 0;
      v10 = 0;
      v15 = v24;
      do
      {
        objc_msgSend(v15, "tokens");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          if (objc_msgSend(v17, "begin") >= *a3 && objc_msgSend(v17, "isSignificant"))
            v10 = v17;
          else
            v10 = 0;
        }
        v18 = objc_msgSend(v17, "end");
        v19 = *a4;
        v20 = v18 > *a4 || v10 == 0;
        if (!v20 && objc_msgSend(v17, "isSignificant"))
        {
          v21 = v17;

          v13 = v21;
        }

        if (v18 > v19)
          break;
        ++v14;
        objc_msgSend(v24, "tokens");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        v15 = v24;
      }
      while (v14 < v23);
      if (v10 && v13)
      {
        *a3 = objc_msgSend(v10, "begin");
        *a4 = objc_msgSend(v13, "end");
      }
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_24;
  }
LABEL_25:

}

+ (id)normalizedPayloadsFrom:(int64_t)a3 to:(int64_t)a4 within:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  unint64_t v20;

  v7 = a5;
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  objc_msgSend(v7, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      objc_msgSend(v7, "tokens");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v14 |= (int)objc_msgSend(v16, "begin") == a3;
      if ((v14 & 1) != 0)
      {
        objc_msgSend(v16, "normalizedValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v17);

      }
      v18 = (int)objc_msgSend(v16, "end");

      if (v18 >= a4)
        break;
      ++v13;
      objc_msgSend(v7, "tokens");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v20 > v13);
  }

  return v10;
}

+ (void)addNormalizedValuesTo:(id)a3 alignedWith:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "nodeIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "hasStringPayload"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v8, "spans", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(a1, "normalizedPayloadsFrom:to:within:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "startIndex"), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "endIndex"), v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v17, "mutableCopy");
          objc_msgSend(v11, "setNormalizedStringPayloads:", v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
}

+ (BOOL)hasTagNamespace:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a3, "usoGraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = *MEMORY[0x24BEA38C8];
    v9 = *MEMORY[0x24BEA38D0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "namespaceA");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v8))
        {

LABEL_13:
          v17 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v11, "namespaceA");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v9);

        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v17 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_14:

  return v17;
}

+ (void)createIdentifierGroups:(id)a3 spans:(id)a4 parseEntityKey:(id)a5 parseAlignment:(id)a6 interpretationGroupCurrentMax:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id obj;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v14, "spans");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v30 = v15;
    v32 = v11;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3 * objc_msgSend(v12, "count"));
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3 * objc_msgSend(v12, "count"));
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3 * objc_msgSend(v12, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v31 = v12;
    obj = v12;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v46;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(obj);
          v37 = v18;
          v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v18);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v19, "usoGraph");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "alignments");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v42;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v42 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                if (objc_msgSend(v26, "subsumedBy:", v14))
                {
                  objc_msgSend(v19, "usoGraph");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CDMPostProcessUtils entityKeyFrom:at:](CDMPostProcessUtils, "entityKeyFrom:at:", v27, objc_msgSend(v26, "nodeIndex"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v28, "isEqualToEntityKey:", v13))
                  {
                    if ((objc_msgSend(a1, "hasTagNamespace:", v19) & 1) != 0)
                    {
                      objc_msgSend(v34, "addObject:", v19);

                      goto LABEL_21;
                    }
                    objc_msgSend(v39, "addObject:", v26);
                    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v26);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "setObject:forKeyedSubscript:", v19, v29);

                  }
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v23)
                continue;
              break;
            }
          }
LABEL_21:

          v18 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v36);
    }

    v11 = v32;
    v15 = v30;
    +[IdentifierGroupingUtils createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGroupCurrentMax:tagSpans:](IdentifierGroupingUtils, "createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGroupCurrentMax:tagSpans:", v39, v38, v32, objc_msgSend(v14, "nodeIndex"), v30, v34);

    v12 = v31;
  }

}

+ (id)getAlignedIdentifierSpans:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasUsoGraph", (_QWORD)v15))
        {
          objc_msgSend(v10, "usoGraph");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "alignmentsCount"))
          {
            objc_msgSend(v10, "usoGraph");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "identifiersCount");

            if (v13)
              objc_msgSend(v4, "addObject:", v10);
          }
          else
          {

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)getAlignedEntitySpanSpans:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasUsoGraph", (_QWORD)v15))
        {
          objc_msgSend(v10, "usoGraph");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "alignmentsCount"))
          {
            objc_msgSend(v10, "usoGraph");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "spansCount");

            if (v13)
              objc_msgSend(v4, "addObject:", v10);
          }
          else
          {

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)annotateParses:(id)a3 tokenChain:(id)a4 matchingSpans:(id)a5 asrHypothesis:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  id v56;
  void *v57;
  void *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
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
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  const char *v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v74 = a4;
  v63 = a5;
  v11 = a6;
  objc_msgSend(a1, "usoGraphs:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v56 = v10;
    v57 = v12;
    v13 = objc_alloc(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "asrTokens");
    v58 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    v16 = objc_alloc(MEMORY[0x24BDBCED8]);
    objc_msgSend(v58, "asrTokens");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

    if (v58)
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      objc_msgSend(v58, "asrTokens");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v96 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v24, "beginIndex"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, v25);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v24, "endIndex"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v26);

          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
        }
        while (v21);
      }
      v27 = v74;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      v27 = v74;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v105 = "+[CDMPostProcessUtils annotateParses:tokenChain:matchingSpans:asrHypothesis:]";
        _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Missing ASR Hypothesis, unable to add timing information to alignments", buf, 0xCu);
      }
    }

    objc_msgSend(a1, "spanIndexDict:tokenChain:", v63, v27);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = v57;
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    if (!v61)
    {
      v69 = 0;
      v71 = 0;
      goto LABEL_75;
    }
    v69 = 0;
    v71 = 0;
    v60 = *(_QWORD *)v92;
    while (1)
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v92 != v60)
          objc_enumerationMutation(obj);
        v62 = v28;
        v29 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v28);
        objc_msgSend(a1, "getGroupIndexDict:", v29);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        +[IdentifierGroupingUtils getInterpretationGroupMax:](IdentifierGroupingUtils, "getInterpretationGroupMax:", v29);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        objc_msgSend(v29, "alignments");
        v68 = (id)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
        if (v73)
        {
          v72 = *(_QWORD *)v88;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v88 != v72)
                objc_enumerationMutation(v68);
              v31 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v30);
              objc_msgSend(a1, "addNormalizedValuesTo:alignedWith:from:", v29, v31, v27);
              v85 = 0u;
              v86 = 0u;
              v83 = 0u;
              v84 = 0u;
              objc_msgSend(v31, "spans");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v84;
                do
                {
                  for (j = 0; j != v34; ++j)
                  {
                    if (*(_QWORD *)v84 != v35)
                      objc_enumerationMutation(v32);
                    objc_msgSend(a1, "copyASRTimingInfoToUtteranceSpan:startIndexTokenDict:endIndexTokenDict:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j), v15, v18);
                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
                }
                while (v34);
              }

              +[CDMPostProcessUtils entityKeyFrom:at:](CDMPostProcessUtils, "entityKeyFrom:at:", v29, objc_msgSend(v31, "nodeIndex"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v37)
                goto LABEL_43;
              +[EntityKey userEntity](EntityKey, "userEntity");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isEqualToEntityKey:", v37);

              if (v39)
              {
                if (!v71)
                {
                  objc_msgSend(a1, "getAlignedIdentifierSpans:", v63);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                }
                if (!+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
                {
                  objc_msgSend(a1, "createIdentifierGroups:spans:parseEntityKey:parseAlignment:interpretationGroupCurrentMax:", v70, v71, v37, v31, v64);
LABEL_43:
                  v27 = v74;
                  goto LABEL_44;
                }
                v27 = v74;
                v40 = (uint64_t)v69;
                if (!v69)
                {
                  objc_msgSend(a1, "getAlignedEntitySpanSpans:", v63);
                  v40 = objc_claimAutoreleasedReturnValue();
                }
                v69 = (void *)v40;
                objc_msgSend(a1, "copySubsumedSpanEntitySpan:spans:parseEntityKey:utteranceAlignment:tokenChain:", v65, v40, v37, v31, v74);
                if (+[CDMFeatureFlags isInterpretationGroupFilteringEnabled](CDMFeatureFlags, "isInterpretationGroupFilteringEnabled"))
                {
                  objc_msgSend(a1, "copyAlignedSpanIdentifierForSameType:spanIndexDict:utteranceAlignment:entityKey:groupIndexDict:tokenChain:", v70, v67, v31, v37, v66, v74);
                }
                else
                {
                  objc_msgSend(a1, "createIdentifierGroups:spans:parseEntityKey:parseAlignment:interpretationGroupCurrentMax:", v70, v71, v37, v31, v64);
                }
              }
              else
              {
                v27 = v74;
                objc_msgSend(a1, "copyAlignedSpanIdentifierForSameType:spanIndexDict:utteranceAlignment:entityKey:groupIndexDict:tokenChain:", v70, v67, v31, v37, v66, v74);
                if (!+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
                  goto LABEL_44;
                +[EntityKey calendarEventName](EntityKey, "calendarEventName");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v41, "isEqualToEntityKey:", v37))
                {

                }
                else
                {
                  +[EntityKey personEntity](EntityKey, "personEntity");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "isEqualToEntityKey:", v37);

                  v27 = v74;
                  if (!v43)
                  {
                    objc_msgSend(a1, "copyAlignedSpanEntitySpanForSameType:spanIndexDict:utteranceAlignment:entityKey:tokenChain:", v65, v67, v31, v37, v74);
                    goto LABEL_44;
                  }
                }
                v44 = (uint64_t)v69;
                if (!v69)
                {
                  objc_msgSend(a1, "getAlignedEntitySpanSpans:", v63);
                  v44 = objc_claimAutoreleasedReturnValue();
                }
                v69 = (void *)v44;
                objc_msgSend(a1, "copySubsumedSpanEntitySpan:spans:parseEntityKey:utteranceAlignment:tokenChain:", v65, v44, v37, v31, v27);
              }
LABEL_44:

              ++v30;
            }
            while (v30 != v73);
            v45 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
            v73 = v45;
          }
          while (v45);
        }

        objc_msgSend(a1, "copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:", v70, v63, v29);
        if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
          objc_msgSend(a1, "copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:", v65, v63, v29);
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v46 = v70;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v80;
          do
          {
            for (k = 0; k != v48; ++k)
            {
              if (*(_QWORD *)v80 != v49)
                objc_enumerationMutation(v46);
              objc_msgSend(v29, "addIdentifiers:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k));
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
          }
          while (v48);
        }

        if (+[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled"))
        {
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v51 = v65;
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v76;
            do
            {
              for (m = 0; m != v53; ++m)
              {
                if (*(_QWORD *)v76 != v54)
                  objc_enumerationMutation(v51);
                objc_msgSend(v29, "addSpans:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * m));
              }
              v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
            }
            while (v53);
          }

        }
        v28 = v62 + 1;
        v27 = v74;
      }
      while (v62 + 1 != v61);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
      if (!v61)
      {
LABEL_75:

        v10 = v56;
        v12 = v57;
        v11 = v58;
        break;
      }
    }
  }

}

+ (id)getCorrectionOutcomeFromUserParses:(id)a3 ccqrCorrectionOutcome:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "comparableProbability");
        if (v13 > 0.0)
        {
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v12, "userDialogActs", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v22 != v17)
                  objc_enumerationMutation(v14);
                v9 |= objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "hasRejected");
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v16);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  if (objc_msgSend(v6, "type") == 1 || (v9 & 1) != 0)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setType:", 1);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (void)annotateUserParses:(id)a3 correctionOutcome:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setCorrectionOutcome:", v6);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (id)entityKeyFrom:(id)a3 at:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  EntityKey *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "edges", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v7)
    goto LABEL_18;
  v8 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v10, "toIndex") == a4)
      {
        v7 = v10;

        if (v7)
        {
          objc_msgSend(v5, "nodes");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v6, "count"))
            goto LABEL_18;
          objc_msgSend(v5, "nodes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count") <= a4)
          {
            v17 = 0;
LABEL_21:

            goto LABEL_22;
          }
          v12 = objc_msgSend(v7, "fromIndex");
          objc_msgSend(v5, "nodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14 > v12)
          {
            objc_msgSend(v5, "nodes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "nodes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "fromIndex"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = 0;
            if (v6 && v11)
            {
              objc_msgSend(v7, "label");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                v17 = -[EntityKey initWithElementId:edgeElementId:parentElementId:]([EntityKey alloc], "initWithElementId:edgeElementId:parentElementId:", objc_msgSend(v6, "usoElementId"), objc_msgSend(v18, "usoElementId"), objc_msgSend(v11, "usoElementId"));
              else
                v17 = 0;

            }
            goto LABEL_21;
          }
        }
        v17 = 0;
        goto LABEL_23;
      }
    }
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
      continue;
    break;
  }
LABEL_18:
  v17 = 0;
LABEL_22:

LABEL_23:
  return v17;
}

+ (void)annotateNLUResponse:(id)a3 nluRequest:(id)a4 matchingSpans:(id)a5 tokenChain:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "parses");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentTurnInput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "asrOutputs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils annotateParses:tokenChain:matchingSpans:asrHypothesis:](CDMPostProcessUtils, "annotateParses:tokenChain:matchingSpans:asrHypothesis:", v16, v9, v10, v15);

  objc_msgSend(v12, "setParses:", v16);
}

+ (void)populateComparableProbabilityForParsesNLv4:(id)a3 parsesSNLC:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t j;
  void *v27;
  double v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  float v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "probability");
      *(float *)&v9 = 1.0 - v9;
      v10 = *(float *)&v9;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "+[CDMPostProcessUtils populateComparableProbabilityForParsesNLv4:parsesSNLC:]";
        _os_log_error_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: no SNLC response available in post process node", buf, 0xCu);
      }

      v10 = 1.0;
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      v16 = 0.00000011921;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v18, "probability");
          if (v19 > v16)
          {
            objc_msgSend(v18, "probability");
            v16 = v20;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 0.00000011921;
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v35;
      v25 = v16;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v27, "probability", (_QWORD)v34);
          if (v28 != 1.0
            || (objc_msgSend(v27, "parser"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                v30 = objc_msgSend(v29, "algorithm"),
                v29,
                v31 = 1.0,
                v30 != 1))
          {
            objc_msgSend(v27, "probability");
            v33 = v10 * (v32 / v25);
            if (v33 <= 0.5)
              v33 = 0.0;
            v31 = v33;
          }
          objc_msgSend(v27, "setComparableProbability:", v31);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v23);
    }

  }
}

+ (void)populateComparableProbabilityParses:(id)a3 threshold:(float)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  float v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = a4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "probability");
        v13 = v12;
        v14 = 0.0;
        if (v13 > v9)
          objc_msgSend(v11, "probability", 0.0);
        v15 = v14;
        objc_msgSend(v11, "setComparableProbability:", v15);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

+ (void)populateComparableProbabilityParsesCATI:(id)a3
{
  double v3;

  LODWORD(v3) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:threshold:](CDMPostProcessUtils, "populateComparableProbabilityParses:threshold:", a3, v3);
}

+ (void)populateComparableProbabilityParsesUaaP:(id)a3
{
  double v3;

  LODWORD(v3) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:threshold:](CDMPostProcessUtils, "populateComparableProbabilityParses:threshold:", a3, v3);
}

+ (void)populateComparableProbabilityParsesPSC:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[2];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v36 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v4 = v3;
  v34 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (!v34)
  {

    v5 = 0;
    v23 = 0;
    goto LABEL_28;
  }
  v37 = 0;
  v5 = 0;
  obj = v4;
  v33 = *(_QWORD *)v43;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v43 != v33)
        objc_enumerationMutation(obj);
      v35 = v6;
      v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v6);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v7, "userDialogActs", obj);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v39 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v13, "delegated");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "externalParserId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.search"));

            if (v16)
            {
              v17 = v7;

              v5 = v17;
            }
            else
            {
              objc_msgSend(v13, "delegated");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "externalParserId");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.search_phase_2"));

              if (v20)
              {
                v21 = v7;

                v37 = v21;
              }
              else
              {
                objc_msgSend(v36, "addObject:", v7);
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v10);
      }

      v6 = v35 + 1;
    }
    while (v35 + 1 != v34);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  }
  while (v34);

  if (!v5)
  {
    v4 = obj;
    v23 = v37;
    goto LABEL_28;
  }
  v23 = v37;
  if (!v37
    || (objc_msgSend(v5, "probability"), v22 >= 0.600000024)
    || (objc_msgSend(v37, "probability"), v22 >= 0.600000024)
    || (objc_msgSend(v5, "probability"), v25 = v24, objc_msgSend(v37, "probability"), v22 = v25 + v26, v22 < 0.600000024))
  {
    v4 = obj;
LABEL_28:
    LODWORD(v22) = 1058642330;
    +[CDMPostProcessUtils populateComparableProbabilityParses:threshold:](CDMPostProcessUtils, "populateComparableProbabilityParses:threshold:", v4, v22);
    goto LABEL_29;
  }
  CDMOSLoggerForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "+[CDMPostProcessUtils populateComparableProbabilityParsesPSC:]";
    v49 = 2048;
    v50 = 0x3FE3333340000000;
    _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s Combined PSC parses above threshold (%.2f). Populating comparableProbability.", buf, 0x16u);
  }

  v46[0] = v5;
  v46[1] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 0;
  +[CDMPostProcessUtils populateComparableProbabilityParses:threshold:](CDMPostProcessUtils, "populateComparableProbabilityParses:threshold:", v28, v29);

  objc_msgSend(v36, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:threshold:](CDMPostProcessUtils, "populateComparableProbabilityParses:threshold:", v30, v31);

  v4 = obj;
LABEL_29:

}

+ (void)populateComparableProbabilityParsesAutoShortcuts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setComparableProbability:", 0.600000024);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)populateComparableProbabilityParsesSSU:(id)a3
{
  double v3;

  LODWORD(v3) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:threshold:](CDMPostProcessUtils, "populateComparableProbabilityParses:threshold:", a3, v3);
}

+ (void)populateComparableProbabilityParsesSNLC:(id)a3 deviceParses:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(a4, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setComparableProbability:", 0.200000003, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  else
  {
    +[CDMPostProcessUtils populateComparableProbabilityFromProbabilityParses:](CDMPostProcessUtils, "populateComparableProbabilityFromProbabilityParses:", v5);
  }

}

+ (void)populateComparableProbabilityFromProbabilityParses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "probability");
        objc_msgSend(v8, "setComparableProbability:");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

+ (void)splitParses:(id)a3 deviceParses:(id)a4 zeroParses:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "comparableProbability");
        if (v15 <= 0.0)
          v16 = v9;
        else
          v16 = v8;
        objc_msgSend(v16, "addObject:", v14);
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

+ (id)sortParses:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_442);
}

+ (void)logParsesRanking:(id)a3 addDebugInfo:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("\n\nFederation ranking order:"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v10 = 1;
    v11 = 0x24BDD1000uLL;
    v12 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v15 = *(void **)(v11 + 1992);
        objc_msgSend(v14, "parser");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "parserId");
        if (v17 >= 0xA)
        {
          objc_msgSend(*(id *)(v11 + 1992), "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = off_24DCAC448[v17];
        }
        objc_msgSend(v14, "comparableProbability");
        v20 = v19;
        objc_msgSend(v14, "probability");
        objc_msgSend(v15, "stringWithFormat:", CFSTR("\n%d: %@ probability: %f (%f before calibration)"), v10 + i, v18, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v12;
        objc_msgSend(v12, "appendString:", v22);

        v11 = 0x24BDD1000;
      }
      v10 = (v10 + i);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v8);
  }

  v23 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "+[CDMPostProcessUtils logParsesRanking:addDebugInfo:]";
    v32 = 2112;
    v33 = CFSTR("summary");
    v34 = 2114;
    v35 = v6;
    _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n%{public}@\n", buf, 0x20u);
  }
  if (v24)
    objc_msgSend(v24, "appendString:", v6);

}

+ (id)getFederatedParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 parsesPSC:(id)a7 parsesAutoShortcuts:(id)a8 parsesAppendOverrides:(id)a9 parsesSSU:(id)a10 addDebugInfo:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  objc_class *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;

  v29 = a3;
  v31 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v30 = a11;
  v20 = (objc_class *)MEMORY[0x24BDBCEB8];
  v21 = a5;
  v22 = a4;
  v23 = objc_alloc_init(v20);
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[CDMPostProcessUtils populateComparableProbabilityForParsesNLv4:parsesSNLC:](CDMPostProcessUtils, "populateComparableProbabilityForParsesNLv4:parsesSNLC:", v22, v29);
  +[CDMPostProcessUtils splitParses:deviceParses:zeroParses:](CDMPostProcessUtils, "splitParses:deviceParses:zeroParses:", v22, v23, v24);

  +[CDMPostProcessUtils populateComparableProbabilityParsesCATI:](CDMPostProcessUtils, "populateComparableProbabilityParsesCATI:", v21);
  +[CDMPostProcessUtils splitParses:deviceParses:zeroParses:](CDMPostProcessUtils, "splitParses:deviceParses:zeroParses:", v21, v23, v24);

  if (v31)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesUaaP:](CDMPostProcessUtils, "populateComparableProbabilityParsesUaaP:", v31);
    +[CDMPostProcessUtils splitParses:deviceParses:zeroParses:](CDMPostProcessUtils, "splitParses:deviceParses:zeroParses:", v31, v23, v24);
  }
  if (v16)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesPSC:](CDMPostProcessUtils, "populateComparableProbabilityParsesPSC:", v16);
    +[CDMPostProcessUtils splitParses:deviceParses:zeroParses:](CDMPostProcessUtils, "splitParses:deviceParses:zeroParses:", v16, v23, v24);
  }
  if (v17)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesAutoShortcuts:](CDMPostProcessUtils, "populateComparableProbabilityParsesAutoShortcuts:", v17);
    +[CDMPostProcessUtils splitParses:deviceParses:zeroParses:](CDMPostProcessUtils, "splitParses:deviceParses:zeroParses:", v17, v23, v24);
  }
  if (v18)
  {
    +[CDMPostProcessUtils populateComparableProbabilityFromProbabilityParses:](CDMPostProcessUtils, "populateComparableProbabilityFromProbabilityParses:", v18);
    +[CDMPostProcessUtils splitParses:deviceParses:zeroParses:](CDMPostProcessUtils, "splitParses:deviceParses:zeroParses:", v18, v23, v24);
  }
  if (v19)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesSSU:](CDMPostProcessUtils, "populateComparableProbabilityParsesSSU:", v19);
    +[CDMPostProcessUtils splitParses:deviceParses:zeroParses:](CDMPostProcessUtils, "splitParses:deviceParses:zeroParses:", v19, v23, v24);
  }
  +[CDMPostProcessUtils populateComparableProbabilityParsesSNLC:deviceParses:](CDMPostProcessUtils, "populateComparableProbabilityParsesSNLC:deviceParses:", v29, v23);
  +[CDMPostProcessUtils sortParses:](CDMPostProcessUtils, "sortParses:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  if (!+[CDMFeatureFlags isAmbiguityRefactorEnabled](CDMFeatureFlags, "isAmbiguityRefactorEnabled"))
  {
    +[CDMPostProcessUtils sortParses:](CDMPostProcessUtils, "sortParses:", v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObjectsFromArray:", v27);

    objc_msgSend(v26, "addObjectsFromArray:", v24);
  }
  if (+[CDMUserDefaultsUtils readNLv4MaxNumParses](CDMUserDefaultsUtils, "readNLv4MaxNumParses") != 1)
    objc_msgSend(v26, "addObjectsFromArray:", v24);
  +[CDMPostProcessUtils logParsesRanking:addDebugInfo:](CDMPostProcessUtils, "logParsesRanking:addDebugInfo:", v26, v30);

  return v26;
}

+ (id)getCroppedUserParses:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 >= 0xA)
    v5 = 10;
  else
    v5 = v4;
  objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getPostProcessUserParses:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CDMPostProcessUtils populateComparableProbabilityFromProbabilityParses:](CDMPostProcessUtils, "populateComparableProbabilityFromProbabilityParses:", v3);
  +[CDMPostProcessUtils sortParses:](CDMPostProcessUtils, "sortParses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CDMPostProcessUtils getCroppedUserParses:](CDMPostProcessUtils, "getCroppedUserParses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 addDebugInfo:(id)a6
{
  void *v6;
  void *v7;

  +[CDMPostProcessUtils getFederatedParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:](CDMPostProcessUtils, "getFederatedParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:", a3, a4, a5, 0, 0, 0, 0, 0, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils getCroppedUserParses:](CDMPostProcessUtils, "getCroppedUserParses:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 addDebugInfo:(id)a7
{
  void *v7;
  void *v8;

  +[CDMPostProcessUtils getFederatedParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:](CDMPostProcessUtils, "getFederatedParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:", a3, a4, a5, a6, 0, 0, 0, 0, a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils getCroppedUserParses:](CDMPostProcessUtils, "getCroppedUserParses:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 parsesPSC:(id)a7 parsesAutoShortcuts:(id)a8 parsesAppendOverrides:(id)a9 parsesSSU:(id)a10 addDebugInfo:(id)a11
{
  void *v11;
  void *v12;

  +[CDMPostProcessUtils getFederatedParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:](CDMPostProcessUtils, "getFederatedParses:parsesNLv4:parsesCATI:parsesUaaP:parsesPSC:parsesAutoShortcuts:parsesAppendOverrides:parsesSSU:addDebugInfo:", a3, a4, a5, a6, a7, a8, a9, a10, a11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMPostProcessUtils getCroppedUserParses:](CDMPostProcessUtils, "getCroppedUserParses:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)filterAndConvertInternalMatchingSpan:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE9E128]);
  objc_msgSend(v3, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInput:", v5);

  objc_msgSend(v3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v6);

  objc_msgSend(v4, "setStartTokenIndex:", objc_msgSend(v3, "startTokenIndex"));
  objc_msgSend(v4, "setEndTokenIndex:", objc_msgSend(v3, "endTokenIndex"));
  objc_msgSend(v3, "usoGraph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsoGraph:", v7);

  objc_msgSend(v4, "setScore:", 1.0);
  if (objc_msgSend(v3, "matcherNamesCount"))
  {
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v3, "matcherNamesAtIndex:", v8) - 2;
      if (v9 > 5)
        v10 = 0;
      else
        v10 = dword_21A467530[v9];
      objc_msgSend(v4, "addMatcherNames:", v10);
      ++v8;
    }
    while (objc_msgSend(v3, "matcherNamesCount") > v8);
  }

  return v4;
}

+ (unsigned)isInternalMatchingSpan:(id)a3 fromMatcher:(int)a4
{
  id v5;
  uint64_t v6;
  int v7;
  unsigned __int8 v8;

  v5 = a3;
  if (objc_msgSend(v5, "matcherNamesCount"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(v5, "matcherNamesAtIndex:", v6);
      v8 = v7 == a4;
      if (v7 == a4)
        break;
      if (objc_msgSend(v5, "matcherNamesCount") <= (unint64_t)++v6)
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

+ (id)filterAndConvertInternalMatchingSpans:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "matcherNamesCount", (_QWORD)v14) == 1
           && objc_msgSend(v11, "matcherNamesAtIndex:", 0) == 2
           || objc_msgSend(a1, "isInternalMatchingSpan:fromMatcher:", v11, 7))
          && !objc_msgSend(a1, "isInternalMatchingSpan:fromMatcher:", v11, 4))
        {
          objc_msgSend(a1, "filterAndConvertInternalMatchingSpan:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (unsigned)isExternalMatchingSpan:(id)a3 fromMatcher:(int)a4
{
  id v5;
  uint64_t v6;
  int v7;
  unsigned __int8 v8;

  v5 = a3;
  if (objc_msgSend(v5, "matcherNamesCount"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(v5, "matcherNamesAtIndex:", v6);
      v8 = v7 == a4;
      if (v7 == a4)
        break;
      if (objc_msgSend(v5, "matcherNamesCount") <= (unint64_t)++v6)
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

+ (void)annotateDUDAWithMRRRewrittenUtterance:(id)a3 matchingSpans:(id)a4 userDialogAct:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = 136315394;
    v16 = "+[CDMPostProcessUtils annotateDUDAWithMRRRewrittenUtterance:matchingSpans:userDialogAct:]";
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s annotate DUDA With mr re-written utterance - %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v9, "delegated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rewrite");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend((id)objc_opt_class(), "rewriteMessageFromMatchingSpans:mrRewrittenUtterance:", v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v9, "delegated");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRewrite:", v13);

    }
  }

}

+ (void)annotateDelegatedUDAParses:(id)a3 matchingSpans:(id)a4 mrRewrittenUtterance:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v28 = a4;
  v27 = a5;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v39;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(obj);
        v25 = v8;
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v9, "userDialogActs");
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v35 != v12)
                objc_enumerationMutation(v29);
              v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              if (objc_msgSend(v14, "hasDelegated"))
              {
                v32 = 0u;
                v33 = 0u;
                v30 = 0u;
                v31 = 0u;
                v15 = v28;
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                if (v16)
                {
                  v17 = v16;
                  v18 = *(_QWORD *)v31;
                  do
                  {
                    for (j = 0; j != v17; ++j)
                    {
                      if (*(_QWORD *)v31 != v18)
                        objc_enumerationMutation(v15);
                      v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
                      objc_msgSend(v14, "delegated");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "addMatchingSpans:", v20);

                    }
                    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                  }
                  while (v17);
                }

                objc_msgSend(a1, "annotateDUDAWithMRRRewrittenUtterance:matchingSpans:userDialogAct:", v27, v15, v14);
              }
            }
            v11 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          }
          while (v11);
        }

        v8 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v24);
  }

}

+ (id)rewriteMessageFromMatchingSpans:(id)a3 mrRewrittenUtterance:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (+[CDMFeatureFlags isMentionResolverRewriterEnabled](CDMFeatureFlags, "isMentionResolverRewriterEnabled")&& objc_msgSend(v7, "length"))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(a1, "isExternalMatchingSpan:fromMatcher:", v14, 2, (_QWORD)v17))
            objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "setRewrittenUtterance:", v7);
      objc_msgSend(v15, "setRewriteType:", 3);
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)supplementaryOutputFromMatchingSpans:(id)a3 rewriteMessage:(id)a4 correctionOutcome:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "rewrittenUtterance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "+[CDMPostProcessUtils supplementaryOutputFromMatchingSpans:rewriteMessage:correctionOutcome:]";
    v17 = 2112;
    v18 = v14;
    v19 = 1024;
    v20 = objc_msgSend(v7, "rewriteType");
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Adding supplementary output with re-written utterance: %@, re-write type: %i", (uint8_t *)&v15, 0x1Cu);

  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setRewrite:", v7);
  objc_msgSend(v11, "setCorrectionOutcome:", v8);

  v12 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v11, "setMatchingSpans:", v12);

  return v11;
}

+ (void)removeProbabilityFromUserParses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setProbability:", 0.0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)mapVocGenericBundleIdsToPlatformBundleIdsForParse:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "userDialogActs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasUserStatedTask"))
        {
          objc_msgSend(v9, "userStatedTask");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasTask");

          if (v11)
          {
            objc_msgSend(v9, "userStatedTask");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "task");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "mapVocGenericBundleIdsToPlatformBundleIdsForGraph:", v13);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

+ (void)mapVocGenericBundleIdsToPlatformBundleIdsForGraph:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = a3;
  objc_msgSend(v31, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v8, "sourceComponent") == 2)
        {
          objc_msgSend(v8, "namespaceA");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("appName")))
          {
            v11 = objc_msgSend(v8, "hasValue");

            if ((v11 & 1) == 0)
              continue;
            objc_msgSend(v8, "value");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            +[CDMVocBundleMappingUtils mapVocGenericBundleIdToPlatformBundleId:](CDMVocBundleMappingUtils, "mapVocGenericBundleIdToPlatformBundleId:", v12);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              CDMOSLoggerForCategory(0);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v8, "value");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v42 = "+[CDMPostProcessUtils mapVocGenericBundleIdsToPlatformBundleIdsForGraph:]";
                v43 = 2112;
                v44 = v14;
                v45 = 2112;
                v46 = v9;
                _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Mapping appName identifier generic bundle ID \"%@\" to platform bundle \"%@\".", buf, 0x20u);

              }
              objc_msgSend(v8, "setValue:", v9);
            }
          }
          else
          {

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v5);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v31, "spans");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        if (objc_msgSend(v20, "sourceComponent") == 2)
        {
          objc_msgSend(v20, "properties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "key");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v23, "isEqualToString:", CFSTR("appName")))
            goto LABEL_29;
          v24 = objc_msgSend(v22, "hasValueString");

          if (v24)
          {
            objc_msgSend(v22, "valueString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[CDMVocBundleMappingUtils mapVocGenericBundleIdToPlatformBundleId:](CDMVocBundleMappingUtils, "mapVocGenericBundleIdToPlatformBundleId:", v26);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              CDMOSLoggerForCategory(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v22, "valueString");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "value");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v42 = "+[CDMPostProcessUtils mapVocGenericBundleIdsToPlatformBundleIdsForGraph:]";
                v43 = 2112;
                v44 = v30;
                v45 = 2112;
                v46 = v23;
                _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s Mapping appName entity generic bundle ID \"%@\" to platform bundle \"%@\".", buf, 0x20u);

              }
              objc_msgSend(v22, "valueString");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setValue:", v23);

            }
LABEL_29:

          }
          continue;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v17);
  }

}

BOOL __34__CDMPostProcessUtils_sortParses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "comparableProbability");
  v6 = v5;
  objc_msgSend(v4, "comparableProbability");
  v8 = v7;

  return v6 < v8;
}

@end
