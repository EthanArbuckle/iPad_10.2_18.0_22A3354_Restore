@implementation CDMNLServiceUtils

+ (id)get_psc_index_to_parser
{
  if (+[CDMNLServiceUtils get_psc_index_to_parser]::once != -1)
    dispatch_once(&+[CDMNLServiceUtils get_psc_index_to_parser]::once, &__block_literal_global_7144);
  return (id)+[CDMNLServiceUtils get_psc_index_to_parser]::_PSC_INDEX_TO_PARSER;
}

+ (unique_ptr<sirinluinternalnlv4_parser::NLv4ParserRequest,)buildNLv4ProtoRequest:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unique_ptr<sirinluinternalnlv4_parser::NLv4ParserRequest, std::default_delete<sirinluinternalnlv4_parser::NLv4ParserRequest>> v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "+[CDMNLServiceUtils buildNLv4ProtoRequest:]";
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s Convert SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest to sirinluinternalnlv4_parser::NLv4ParserRequest...", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)MEMORY[0x24BE9E350];
  objc_msgSend(v3, "parserRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertNLv4ParserRequestToCpp:", v6);

  return v7;
}

+ (id)buildSetupNLv4ProtoRequest:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
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
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;

  v36 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE9E238]);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __48__CDMNLServiceUtils_buildSetupNLv4ProtoRequest___block_invoke;
  v37[3] = &unk_24DCAC948;
  v5 = v4;
  v38 = v5;
  objc_msgSend(a1, "_setWarmupRequestId:", v37);
  v35 = objc_alloc_init(MEMORY[0x24BE9E248]);
  objc_msgSend(v35, "setNormalisedUtterance:", CFSTR("hello world"));
  objc_msgSend(v35, "setOriginalUtterance:", CFSTR("hello world"));
  v6 = objc_alloc_init(MEMORY[0x24BE9E300]);
  objc_msgSend(v6, "setStringValue:", CFSTR("hello world"));
  objc_msgSend(v6, "setLocale:", CFSTR("en_US"));
  v7 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
  objc_msgSend(v7, "setCleanValue:", CFSTR("hello"));
  objc_msgSend(v7, "setValue:", CFSTR("hello"));
  objc_msgSend(v7, "setTokenIndex:", 0);
  objc_msgSend(v7, "setBegin:", 0);
  objc_msgSend(v7, "setEnd:", 5);
  objc_msgSend(v7, "setIsSignificant:", 1);
  v8 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
  objc_msgSend(v8, "setCleanValue:", CFSTR("world"));
  objc_msgSend(v8, "setValue:", CFSTR("world"));
  objc_msgSend(v8, "setTokenIndex:", 1);
  objc_msgSend(v8, "setBegin:", 6);
  objc_msgSend(v8, "setEnd:", 11);
  objc_msgSend(v8, "setIsSignificant:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTokens:", v9);

  objc_msgSend(v35, "setTokenChain:", v6);
  objc_msgSend(v5, "setTokenisedUtterance:", v35);
  v10 = objc_alloc_init(MEMORY[0x24BE9E250]);
  v11 = malloc_type_calloc(objc_msgSend(v6, "tokensCount") * objc_msgSend(v36, "integerValue"), 4uLL, 0x100004052888210uLL);
  objc_msgSend(v10, "setValues:count:", v11, objc_msgSend(v6, "tokensCount") * objc_msgSend(v36, "integerValue"));
  free(v11);
  objc_msgSend(v10, "setNumToken:", objc_msgSend(v6, "tokensCount"));
  objc_msgSend(v10, "setNumLayer:", 1);
  objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v36, "integerValue"));
  objc_msgSend(v10, "setEmbedderId:", CFSTR("embed_id"));
  objc_msgSend(v5, "setEmbeddings:", v10);
  v12 = objc_alloc_init(MEMORY[0x24BE9E148]);
  v13 = objc_alloc_init(MEMORY[0x24BE9E138]);
  objc_msgSend(v12, "setSystemDialogActGroup:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BE9E140]);
  objc_msgSend(v12, "setTurnContext:", v14);

  v15 = objc_alloc_init(MEMORY[0x24BE9E0C8]);
  objc_msgSend(v12, "turnContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNlContext:", v15);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "turnContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nlContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActiveTasks:", v17);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "turnContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nlContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setExecutedTasks:", v20);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "turnContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "nlContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSalientEntities:", v23);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "turnContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "nlContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSystemDialogActs:", v26);

  v29 = objc_alloc_init(MEMORY[0x24BE9E138]);
  objc_msgSend(v12, "turnContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "nlContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSystemDialogActGroup:", v29);

  objc_msgSend(v5, "setTurnInput:", v12);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMatchingSpans:", v32);

  objc_msgSend(v5, "setMaxNumParses:", 1);
  v33 = v5;

  return v33;
}

+ (id)buildSetupSNLCProtoRequest:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE9E248]);
  objc_msgSend(v5, "setOriginalUtterance:", CFSTR("hello world"));
  objc_msgSend(v5, "setNormalisedUtterance:", CFSTR("hello world"));
  v6 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
  objc_msgSend(v6, "setValue:", CFSTR("hello"));
  objc_msgSend(v6, "setTokenIndex:", 0);
  objc_msgSend(v6, "setBegin:", 0);
  objc_msgSend(v6, "setEnd:", 5);
  v7 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
  objc_msgSend(v7, "setValue:", CFSTR("world"));
  objc_msgSend(v7, "setTokenIndex:", 0);
  objc_msgSend(v7, "setBegin:", 6);
  objc_msgSend(v7, "setEnd:", 11);
  v8 = objc_alloc_init(MEMORY[0x24BE9E300]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTokens:", v9);

  objc_msgSend(v5, "setTokenChain:", v8);
  v10 = objc_alloc_init(MEMORY[0x24BE9E250]);
  v11 = malloc_type_calloc(objc_msgSend(v8, "tokensCount") * objc_msgSend(v4, "integerValue"), 4uLL, 0x100004052888210uLL);
  objc_msgSend(v10, "setValues:count:", v11, objc_msgSend(v8, "tokensCount") * objc_msgSend(v4, "integerValue"));
  free(v11);
  objc_msgSend(v10, "setNumToken:", objc_msgSend(v8, "tokensCount"));
  objc_msgSend(v10, "setNumLayer:", 1);
  objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v4, "integerValue"));
  objc_msgSend(v10, "setEmbedderId:", CFSTR("embed_id"));
  v12 = objc_alloc_init(MEMORY[0x24BE9E1F8]);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__CDMNLServiceUtils_buildSetupSNLCProtoRequest___block_invoke;
  v16[3] = &unk_24DCAC948;
  v13 = v12;
  v17 = v13;
  objc_msgSend(a1, "_setWarmupRequestId:", v16);
  objc_msgSend(v13, "setTokenisedUtterance:", v5);
  objc_msgSend(v13, "setEmbeddings:", v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMatchingSpans:", v14);

  return v13;
}

+ (id)buildSNLCProtoResponse:(id)a3 snlcRequest:(id)a4 parserToSet:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  void *v20;
  double v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  CDMSNLCProtoResponseCommand *v48;
  void *v49;
  void *v50;
  CDMSNLCProtoResponseCommand *v51;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v59 = a4;
  v57 = a5;
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "hypotheses");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
    v72 = 1024;
    LODWORD(v73) = objc_msgSend(v54, "label");
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s SNLC classification result=%i", buf, 0x12u);

  }
  +[CDMUserDefaultsUtils readUserDefaultSnlcOverride](CDMUserDefaultsUtils, "readUserDefaultSnlcOverride");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Checking user defaults for \"com.apple.siri.cdm\" \"SNLC override\"...", buf, 0xCu);
  }

  if (objc_msgSend(v58, "length"))
  {
    if (objc_msgSend(v58, "isEqualToString:", CFSTR("server")))
    {
      v10 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
        v72 = 2112;
        v73 = CFSTR("snlc");
        v74 = 2112;
        v75 = CFSTR("server");
        v76 = 2048;
        v77 = 0x3FF0000000000000;
        _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: SNLC defaults override found. Overriding SNLC classification result with %@ and probability=%.2f", buf, 0x2Au);
      }
    }
    else
    {
      if (objc_msgSend(v58, "isEqualToString:", CFSTR("device")))
      {
        v11 = CDMLogContext;
        v12 = 1;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
          v72 = 2112;
          v73 = CFSTR("snlc");
          v74 = 2112;
          v75 = CFSTR("device");
          v76 = 2048;
          v77 = 0x3FF0000000000000;
          _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: SNLC defaults override found. Overriding SNLC classification result with %@ and probability=%.2f", buf, 0x2Au);
        }
        goto LABEL_16;
      }
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
        _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Unknown SNLC override label. Falling back on SERVER", buf, 0xCu);
      }

    }
    v12 = 0;
LABEL_16:
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v7, "hypotheses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v65 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (objc_msgSend(v18, "label") == v12)
          {
            LODWORD(v19) = 1.0;
            objc_msgSend(v18, "setProbability:", v19);
          }
          else
          {
            objc_msgSend(v7, "hypotheses");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v21 = 0.0 / (float)(unint64_t)(objc_msgSend(v20, "count") - 1);
            objc_msgSend(v18, "setProbability:", v21);

          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      }
      while (v15);
    }

    v22 = (id)CDMLogContext;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "hypotheses");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "label");
      *(_DWORD *)buf = 136315650;
      v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
      v72 = 2112;
      v73 = CFSTR("snlc");
      v74 = 1024;
      LODWORD(v75) = v25;
      _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nCorrected SNLC classification result=%i (after override).", buf, 0x1Cu);

    }
  }
  objc_msgSend(v59, "rewriteMsg");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v26;
  v27 = objc_alloc_init(MEMORY[0x24BE9E0A8]);
  objc_msgSend(v27, "setAsrHypothesisIndex:", 0);
  objc_msgSend(v27, "setExternalParserId:", CFSTR("com.apple.siri.nlv3"));
  objc_msgSend(v59, "rewriteMsg");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRewrite:", v28);

  CDMOSLoggerForCategory(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
    v72 = 1024;
    LODWORD(v73) = v26 != 0;
    _os_log_debug_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_DEBUG, "%s SNLC rewrittenUtterances size=%d", buf, 0x12u);
  }

  if (v26)
  {
    objc_msgSend(v26, "rewrittenUtterance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "length") == 0;

    if (!v31)
    {
      CDMOSLoggerForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v26, "rewrittenUtterance");
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
        v72 = 2112;
        v73 = v55;
        _os_log_debug_impl(&dword_21A2A0000, v32, OS_LOG_TYPE_DEBUG, "%s SNLC rewrittenUtterance being set to CCQR top hypothesis:%@", buf, 0x16u);

      }
      v33 = objc_alloc_init(MEMORY[0x24BE9E060]);
      objc_msgSend(v26, "rewrittenUtterance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setValue:", v34);

      objc_msgSend(v27, "setRewrittenUtterance:", v33);
    }
  }
  v35 = objc_alloc_init(MEMORY[0x24BE9E158]);
  objc_msgSend(v35, "setDelegated:", v27);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObject:", v35);
  v37 = objc_alloc_init(MEMORY[0x24BE9E160]);
  objc_msgSend(v37, "setUserDialogActs:", v36);
  objc_msgSend(v37, "setParserId:", CFSTR("ServerNLClassifier"));
  objc_msgSend(v37, "setParser:", v57);
  objc_msgSend(v59, "parserRequest");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "requestId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setIdA:", v39);

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v7, "hypotheses");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v61;
    while (2)
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v61 != v42)
          objc_enumerationMutation(v40);
        v44 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        if (!objc_msgSend(v44, "label"))
        {
          objc_msgSend(v44, "probability");
          objc_msgSend(v37, "setProbability:", v45);
          goto LABEL_46;
        }
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v41)
        continue;
      break;
    }
  }
LABEL_46:

  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v37, 0);
  objc_msgSend(v7, "hypotheses");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sortUsingComparator:", &__block_literal_global_307);

  v48 = [CDMSNLCProtoResponseCommand alloc];
  objc_msgSend(v7, "hypotheses");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[CDMSNLCProtoResponseCommand initWithClassLabel:snlcParses:snlcResponse:](v48, "initWithClassLabel:snlcParses:snlcResponse:", objc_msgSend(v50, "label"), v46, v7);

  return v51;
}

+ (id)buildPSCResponse:(id)a3 pscRequest:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  void *v24;
  float v25;
  void *v26;
  NSObject *v27;
  void *v28;
  float v29;
  NSObject *v30;
  int v31;
  float v32;
  float v33;
  float v34;
  float v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  NSObject *v45;
  CDMPSCResponseCommand *v46;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *obj;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  _BYTE v68[18];
  __int16 v69;
  double v70;
  __int16 v71;
  uint64_t v72;
  _BYTE v73[128];
  _QWORD v74[2];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v49 = a4;
  objc_msgSend(v49, "rewriteMsg");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v55, "rewrittenUtterance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
      v67 = 2112;
      *(_QWORD *)v68 = v48;
      _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s PSC rewrittenUtterance being set to CCQR top hypothesis:%@", buf, 0x16u);

    }
  }
  v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v50, "hypotheses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v50, "hypotheses");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v62 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasStringLabel") & 1) == 0)
        {
          CDMOSLoggerForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v31 = objc_msgSend(v12, "label");
            objc_msgSend(v12, "probability");
            *(_DWORD *)buf = 136315650;
            v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
            v67 = 1024;
            *(_DWORD *)v68 = v31;
            *(_WORD *)&v68[4] = 2048;
            *(double *)&v68[6] = v32;
          }

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v12, "label"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setStringLabel:", v14);

        }
        objc_msgSend(a1, "get_psc_index_to_parser");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "label"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "length"))
        {
          objc_msgSend(v12, "probability");
          v19 = v18;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKey:", v20, v17);

          +[CDMNLServiceUtils getPscOverrideProbabilityForLabel:](CDMNLServiceUtils, "getPscOverrideProbabilityForLabel:", objc_msgSend(v12, "label"));
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v23 = (id)CDMLogContext;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v12, "stringLabel");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject floatValue](v21, "floatValue");
              *(_DWORD *)buf = 136315906;
              v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
              v67 = 2112;
              *(_QWORD *)v68 = CFSTR("psc");
              *(_WORD *)&v68[8] = 2112;
              *(_QWORD *)&v68[10] = v24;
              v69 = 2048;
              v70 = v25;
              _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: PSC override found - setting '%@' parse to probability=%.2f", buf, 0x2Au);

            }
            -[NSObject floatValue](v21, "floatValue");
            v19 = *(float *)&v22;
          }
          *(float *)&v22 = v19;
          +[CDMNLServiceUtils buildPSCUserParseForExternalParserId:probability:rewriteMsg:](CDMNLServiceUtils, "buildPSCUserParseForExternalParserId:probability:rewriteMsg:", v17, v55, v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 < 0.6)
          {
            if (+[CDMFeatureFlags isAmbiguityRefactorEnabled](CDMFeatureFlags, "isAmbiguityRefactorEnabled"))
            {
              CDMOSLoggerForCategory(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315906;
                v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
                v67 = 2112;
                *(_QWORD *)v68 = v17;
                *(_WORD *)&v68[8] = 2048;
                *(double *)&v68[10] = v19;
                v69 = 2048;
                v70 = 0.600000024;
                _os_log_debug_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_DEBUG, "%s Not emitting PSC parse for externalParserId=%@: probability=%.2f < threshold=%.2f", buf, 0x2Au);
              }

              goto LABEL_30;
            }
            CDMOSLoggerForCategory(0);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
              v67 = 2112;
              *(_QWORD *)v68 = v17;
              *(_WORD *)&v68[8] = 2048;
              *(double *)&v68[10] = v19;
              v69 = 2048;
              v70 = 0.600000024;
              _os_log_debug_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_DEBUG, "%s PSC parse externalParserId=%@: probability=%.2f is below threshold (%.2f), but emitting due to ambiguity refactor being disabled.", buf, 0x2Au);
            }

          }
          objc_msgSend(v54, "addObject:", v26);
LABEL_30:

          goto LABEL_31;
        }
        CDMOSLoggerForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "stringLabel");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "probability");
          *(_DWORD *)buf = 136315650;
          v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
          v67 = 2112;
          *(_QWORD *)v68 = v28;
          *(_WORD *)&v68[8] = 2048;
          *(double *)&v68[10] = v29;
          _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s Not emitting PSC parse for label=%@ prob=%.2f, no externalParserId found", buf, 0x20u);

        }
LABEL_31:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v54, "count"))
  {
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("com.apple.search"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("com.apple.search_phase_2"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      if (v51)
      {
        objc_msgSend(v52, "floatValue");
        v34 = v33;
        objc_msgSend(v51, "floatValue");
        if ((float)(v34 + v35) >= 0.6)
        {
          v74[0] = CFSTR("com.apple.search");
          v74[1] = CFSTR("com.apple.search_phase_2");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 2);
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
          if (v37)
          {
            v38 = *(_QWORD *)v58;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v58 != v38)
                  objc_enumerationMutation(v36);
                v40 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
                objc_msgSend(v56, "objectForKeyedSubscript:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "floatValue");
                v43 = v42;
                +[CDMNLServiceUtils buildPSCUserParseForExternalParserId:probability:rewriteMsg:](CDMNLServiceUtils, "buildPSCUserParseForExternalParserId:probability:rewriteMsg:", v40, v55);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                CDMOSLoggerForCategory(0);
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136316162;
                  v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
                  v67 = 2112;
                  *(_QWORD *)v68 = v40;
                  *(_WORD *)&v68[8] = 2048;
                  *(double *)&v68[10] = v43;
                  v69 = 2048;
                  v70 = 0.600000024;
                  v71 = 2048;
                  v72 = 0x3FE3333340000000;
                  _os_log_debug_impl(&dword_21A2A0000, v45, OS_LOG_TYPE_DEBUG, "%s PSC parse externalParserId=%@: probability=%.2f is below threshold (%.2f), but emitting as POMMES + POMMES_PHASE_2 > (%.2f).", buf, 0x34u);
                }

                objc_msgSend(v54, "addObject:", v44);
              }
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
            }
            while (v37);
          }

        }
      }
    }

  }
  v46 = -[CDMPSCResponseCommand initWithPscParses:pscResponse:]([CDMPSCResponseCommand alloc], "initWithPscParses:pscResponse:", v54, v50);

  return v46;
}

+ (id)getPscOverrideProbabilityForLabel:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "get_psc_index_to_parser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[CDMUserDefaultsUtils readUserDefaultPscOverride](CDMUserDefaultsUtils, "readUserDefaultPscOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
    goto LABEL_15;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("not-pommes")) & 1) != 0)
  {
    v8 = &unk_24DCCCB60;
    goto LABEL_16;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("pommes")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("pommes-phase-2")))
    {
      v9 = CFSTR("com.apple.search_phase_2");
      goto LABEL_8;
    }
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "+[CDMNLServiceUtils getPscOverrideProbabilityForLabel:]";
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: Unexpected PSC override \"%@\", (uint8_t *)&v13, 0x16u);
    }

LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  v9 = CFSTR("com.apple.search");
LABEL_8:
  if (v6 == v9)
    v10 = &unk_24DCCCB70;
  else
    v10 = &unk_24DCCCB80;
  v8 = v10;
LABEL_16:

  return v8;
}

+ (id)buildPSCUserParseForExternalParserId:(id)a3 probability:(float)a4 rewriteMsg:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BE9E0A8]);
  objc_msgSend(v9, "setAsrHypothesisIndex:", 0);
  objc_msgSend(v9, "setExternalParserId:", v7);
  objc_msgSend(v9, "setRewrite:", v8);
  if (v8)
  {
    objc_msgSend(v8, "rewrittenUtterance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = objc_alloc_init(MEMORY[0x24BE9E060]);
      objc_msgSend(v8, "rewrittenUtterance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:", v13);

      objc_msgSend(v9, "setRewrittenUtterance:", v12);
    }
  }
  v14 = objc_alloc_init(MEMORY[0x24BE9E158]);
  objc_msgSend(v14, "setDelegated:", v9);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v14);
  v16 = objc_alloc_init(MEMORY[0x24BE9E160]);
  objc_msgSend(v16, "setUserDialogActs:", v15);
  objc_msgSend(v16, "setProbability:", a4);
  objc_msgSend(v16, "setParserId:", CFSTR("POMMESClassifier"));
  v17 = (void *)MEMORY[0x24BE9E320];
  v18 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v17, "convertFromUUID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIdA:", v19);

  v20 = objc_alloc_init(MEMORY[0x24BE9E0D8]);
  objc_msgSend(v20, "setAlgorithm:", 2);
  objc_msgSend(v20, "setParserId:", 7);
  objc_msgSend(v16, "setParser:", v20);

  return v16;
}

+ (id)buildSetupITFMRequest:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE9E248]);
  objc_msgSend(v5, "setOriginalUtterance:", CFSTR("hello world"));
  objc_msgSend(v5, "setNormalisedUtterance:", CFSTR("hello world"));
  v6 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
  objc_msgSend(v6, "setValue:", CFSTR("hello"));
  objc_msgSend(v6, "setTokenIndex:", 0);
  objc_msgSend(v6, "setBegin:", 0);
  objc_msgSend(v6, "setEnd:", 5);
  v7 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
  objc_msgSend(v7, "setValue:", CFSTR("world"));
  objc_msgSend(v7, "setTokenIndex:", 0);
  objc_msgSend(v7, "setBegin:", 6);
  objc_msgSend(v7, "setEnd:", 11);
  v8 = objc_alloc_init(MEMORY[0x24BE9E300]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTokens:", v9);

  objc_msgSend(v5, "setTokenChain:", v8);
  v10 = objc_alloc_init(MEMORY[0x24BE9E250]);
  v11 = malloc_type_calloc(objc_msgSend(v8, "tokensCount") * objc_msgSend(v4, "integerValue"), 4uLL, 0x100004052888210uLL);
  objc_msgSend(v10, "setValues:count:", v11, objc_msgSend(v8, "tokensCount") * objc_msgSend(v4, "integerValue"));
  free(v11);
  objc_msgSend(v10, "setNumToken:", objc_msgSend(v8, "tokensCount"));
  objc_msgSend(v10, "setNumLayer:", 1);
  objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v4, "integerValue"));
  objc_msgSend(v10, "setEmbedderId:", CFSTR("embed_id"));
  v12 = objc_alloc_init(MEMORY[0x24BE9E1F8]);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __43__CDMNLServiceUtils_buildSetupITFMRequest___block_invoke;
  v16[3] = &unk_24DCAC948;
  v13 = v12;
  v17 = v13;
  objc_msgSend(a1, "_setWarmupRequestId:", v16);
  objc_msgSend(v13, "setTokenisedUtterance:", v5);
  objc_msgSend(v13, "setEmbeddings:", v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMatchingSpans:", v14);

  return v13;
}

+ (void)_sortMultilingualVariantsByScoreDescending:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_323);
}

+ (id)buildLVCResponse:(id)a3 lvcRequest:(id)a4
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  float v13;
  id v14;
  NSObject *v15;
  float v16;
  int v17;
  float v18;
  id v19;
  CDMLVCResponseCommand *v20;
  NSObject *v21;
  id v23;
  void *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  _BYTE v35[18];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMUserDefaultsUtils readUserDefaultLVCOverride](CDMUserDefaultsUtils, "readUserDefaultLVCOverride");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
    _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Checking user defaults for \"com.apple.siri.cdm\" \"LVC override\"...", buf, 0xCu);
  }

  if (objc_msgSend(v24, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BE9E0C0]);
    objc_msgSend(v5, "setLanguageVariantName:", v24);
    objc_msgSend(v5, "setLanguageVariantScore:", 1.0);
    v6 = (id)CDMLogContext;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
      v34 = 2112;
      *(_QWORD *)v35 = CFSTR("lvc");
      *(_WORD *)&v35[8] = 2112;
      *(_QWORD *)&v35[10] = v7;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: LVC override found. After override, LVC output %@", buf, 0x20u);

    }
    objc_msgSend(v26, "addObject:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", CFSTR("LVC classification results: "));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v23, "hypotheses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "label");
          objc_msgSend(v11, "probability");
          objc_msgSend(v5, "appendFormat:", CFSTR("[symbol=%d, prob=%.2f], "), v12, v13);
          v14 = objc_alloc_init(MEMORY[0x24BE9E0C0]);
          if (objc_msgSend(v11, "hasStringLabel"))
          {
            objc_msgSend(v11, "stringLabel");
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setLanguageVariantName:", v15);
          }
          else
          {
            CDMOSLoggerForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v17 = objc_msgSend(v11, "label");
              objc_msgSend(v11, "probability");
              *(_DWORD *)buf = 136315650;
              v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
              v34 = 1024;
              *(_DWORD *)v35 = v17;
              *(_WORD *)&v35[4] = 2048;
              *(double *)&v35[6] = v18;
              _os_log_error_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Language variant string representation is not set for label=%i prob=%.2f", buf, 0x1Cu);
            }
          }

          objc_msgSend(v11, "probability");
          objc_msgSend(v14, "setLanguageVariantScore:", v16);
          objc_msgSend(v26, "addObject:", v14);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

    objc_msgSend((id)objc_opt_class(), "_sortMultilingualVariantsByScoreDescending:", v26);
  }

  v19 = objc_alloc_init(MEMORY[0x24BE9E0B0]);
  objc_msgSend(v19, "setMultilingualVariants:", v26);
  v20 = -[CDMLVCResponseCommand initWithITFMResponse:languageVariantResult:]([CDMLVCResponseCommand alloc], "initWithITFMResponse:languageVariantResult:", v23, v19);
  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
    v34 = 2112;
    *(_QWORD *)v35 = v20;
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMLVCResponseCommand: %@", buf, 0x16u);
  }

  return v20;
}

+ (void)populateParser:(id)a3 parserToSet:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
      v25 = 2112;
      v26 = v6;
      _os_log_debug_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_DEBUG, "%s Doing a sweep on userParses and if there isn't one, set it to parserToSet=%@", buf, 0x16u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          v12 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "parser");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (v14)
          {
            CDMOSLoggerForCategory(0);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
              v25 = 2112;
              v26 = v6;
              _os_log_debug_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_DEBUG, "%s No parser set yet, set it to parserToSet=%@", buf, 0x16u);
            }

            objc_msgSend(v12, "setParser:", v6);
          }
          else
          {
            CDMOSLoggerForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "parser");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
              v25 = 2112;
              v26 = v17;
              _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s A parser is set already, moving on. parser=%@", buf, 0x16u);

            }
          }

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s Early return as it's an empty userParses (either nil or empty)", buf, 0xCu);
    }
  }

}

+ (void)_setWarmupRequestId:(id)a3
{
  id v3;
  id v4;
  void (**v5)(id, id, id);

  v5 = (void (**)(id, id, id))a3;
  v3 = objc_alloc_init(MEMORY[0x24BE9E150]);
  objc_msgSend(v3, "setHighInt:", 0);
  objc_msgSend(v3, "setLowInt:", 11);
  v4 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
  objc_msgSend(v4, "setIdA:", CFSTR("00000000-0000-0000-0000-00000000000B:0"));
  objc_msgSend(v4, "setConnectionId:", CFSTR("4-8-15-16-23-42"));
  v5[2](v5, v3, v4);

}

uint64_t __64__CDMNLServiceUtils__sortMultilingualVariantsByScoreDescending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "languageVariantScore");
  v7 = v6;
  objc_msgSend(v5, "languageVariantScore");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "languageVariantScore");
    v11 = v10;
    objc_msgSend(v5, "languageVariantScore");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __43__CDMNLServiceUtils_buildSetupITFMRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRequestId:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setNluRequestId:", v5);

}

uint64_t __68__CDMNLServiceUtils_buildSNLCProtoResponse_snlcRequest_parserToSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "probability");
  v7 = v6;
  objc_msgSend(v5, "probability");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "probability");
    v11 = v10;
    objc_msgSend(v5, "probability");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __48__CDMNLServiceUtils_buildSetupSNLCProtoRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRequestId:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setNluRequestId:", v5);

}

void __48__CDMNLServiceUtils_buildSetupNLv4ProtoRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRequestId:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setNluRequestId:", v5);

}

void __44__CDMNLServiceUtils_get_psc_index_to_parser__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24DCCCB00;
  v2[1] = &unk_24DCCCAE8;
  v3[0] = &stru_24DCAE158;
  v3[1] = CFSTR("com.apple.search");
  v2[2] = &unk_24DCCCB18;
  v3[2] = CFSTR("com.apple.search_phase_2");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMNLServiceUtils get_psc_index_to_parser]::_PSC_INDEX_TO_PARSER;
  +[CDMNLServiceUtils get_psc_index_to_parser]::_PSC_INDEX_TO_PARSER = v0;

}

@end
