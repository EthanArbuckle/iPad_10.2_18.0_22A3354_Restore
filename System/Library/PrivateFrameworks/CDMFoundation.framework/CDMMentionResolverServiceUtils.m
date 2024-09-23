@implementation CDMMentionResolverServiceUtils

+ (id)buildMRRequestWithCurTurn:(id)a3 tokenChain:(id)a4 mdResponse:(id)a5 contextualSpanMatcherResponse:(id)a6 embedding:(id)a7 utterance:(id)a8 turnIndex:(unint64_t)a9 nluRequestId:(id)a10 resultCandidateId:(id)a11 cdmRequestId:(id)a12
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v16 = a4;
  v43 = a5;
  v42 = a6;
  v41 = a7;
  v46 = a10;
  v45 = a11;
  v40 = a12;
  v17 = objc_alloc_init(MEMORY[0x24BE9E220]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v16, "tokens");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if ((objc_msgSend(v24, "isWhitespace") & 1) == 0)
        {
          objc_msgSend(v24, "cleanValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length");

          if (v26)
            objc_msgSend(v18, "addObject:", v24);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v21);
  }

  v27 = objc_alloc_init(MEMORY[0x24BE9E300]);
  objc_msgSend(v16, "locale");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLocale:", v28);

  objc_msgSend(v27, "setTokens:", v18);
  objc_msgSend(v16, "stringValue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setStringValue:", v29);

  objc_msgSend(v44, "asrOutputs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "utterance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUtterance:", v32);

  v33 = objc_alloc_init(MEMORY[0x24BE9E150]);
  objc_msgSend(v17, "setRequestId:", v33);

  objc_msgSend(v17, "setResultCandidateId:", v45);
  objc_msgSend(v17, "setNluRequestId:", v46);
  objc_msgSend(v17, "setTokenChain:", v27);
  objc_msgSend(v17, "setMaxCandidates:", 10);
  objc_msgSend(v17, "setEmbeddingTensor:", v41);
  objc_msgSend(v43, "mentions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDetectedMentions:", v34);

  objc_msgSend(v42, "contextualSpans");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContextualSpans:", v35);

  objc_msgSend(v44, "turnContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "nlContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "salientEntities");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEntityCandidates:", v38);

  objc_msgSend(v17, "setTurnIndex:", a9);
  objc_msgSend(v17, "setCdmRequestId:", v40);

  return v17;
}

+ (id)includeWhitespaceInIndices:(id)a3 tokenchain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unsigned int v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "mentions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      v25 = v5;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "startTokenIndex", v25);
          v15 = objc_msgSend(v13, "endTokenIndex") - 1;
          objc_msgSend(v7, "tokens");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count") <= v15)
          {

LABEL_14:
            CDMOSLoggerForCategory(0);
            v23 = objc_claimAutoreleasedReturnValue();
            v5 = v25;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v32 = "+[CDMMentionResolverServiceUtils includeWhitespaceInIndices:tokenchain:]";
              v33 = 2112;
              v34 = v25;
              _os_log_error_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: Error converting MR span indices: %@", buf, 0x16u);
            }

            v8 = 0;
            goto LABEL_17;
          }
          objc_msgSend(v7, "tokens");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (v18 <= v14)
            goto LABEL_14;
          objc_msgSend(v7, "tokens");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndex:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setStartTokenIndex:", objc_msgSend(v20, "tokenIndex"));

          objc_msgSend(v7, "tokens");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndex:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setEndTokenIndex:", objc_msgSend(v22, "tokenIndex") + 1);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        v5 = v25;
        if (v10)
          continue;
        break;
      }
    }

    v8 = v5;
  }
LABEL_17:

  return v8;
}

+ (void)logMRRequestToFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
  {
    v7 = 0;
    +[CDMNluLogUtil writeMRRequestToDisk:error:](CDMNluLogUtil, "writeMRRequestToDisk:error:", v3, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;

    if (!v4)
    {
      CDMOSLoggerForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "+[CDMMentionResolverServiceUtils logMRRequestToFile:]";
        v10 = 2112;
        v11 = v5;
        _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging mr request to file: %@", buf, 0x16u);
      }

    }
  }

}

+ (void)logMRResponseToFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (+[CDMFeatureFlags isLogNluEnabled](CDMFeatureFlags, "isLogNluEnabled"))
  {
    if (v3)
    {
      v7 = 0;
      +[CDMNluLogUtil writeMRResponseToDisk:error:](CDMNluLogUtil, "writeMRResponseToDisk:error:", v3, &v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;

      if (v4)
      {
LABEL_10:

        goto LABEL_11;
      }
      CDMOSLoggerForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "+[CDMMentionResolverServiceUtils logMRResponseToFile:]";
        v10 = 2112;
        v11 = v5;
        _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging mr response to file: %@", buf, 0x16u);
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "+[CDMMentionResolverServiceUtils logMRResponseToFile:]";
        _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s nil mr response, not writing to tmp", buf, 0xCu);
      }
      v5 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:

}

@end
