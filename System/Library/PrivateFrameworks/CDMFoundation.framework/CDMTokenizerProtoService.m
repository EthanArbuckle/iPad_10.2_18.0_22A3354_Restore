@implementation CDMTokenizerProtoService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMTokenizationProtoRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CDMTokenizer *v8;
  CDMTokenizer *tokenizer;
  CDMDataDispatcherContext *v10;
  CDMDataDispatcherContext *dataDispatcherContext;
  CDMTokenizer *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v18 = 136315138;
    v19 = "-[CDMTokenizerProtoService setup:]";
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Tokenization Service setup started", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v4, "dynamicConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMTokenizer tokenizerForLocale:](CDMTokenizer, "tokenizerForLocale:", v7);
  v8 = (CDMTokenizer *)objc_claimAutoreleasedReturnValue();
  tokenizer = self->_tokenizer;
  self->_tokenizer = v8;

  objc_msgSend(v4, "dataDispatcherContext");
  v10 = (CDMDataDispatcherContext *)objc_claimAutoreleasedReturnValue();

  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v10;

  v12 = self->_tokenizer;
  CDMOSLoggerForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      v18 = 136315138;
      v19 = "-[CDMTokenizerProtoService setup:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s Tokenization Service setup success", (uint8_t *)&v18, 0xCu);
    }

    self->super.super._serviceState = 2;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v14)
    {
      v18 = 136315138;
      v19 = "-[CDMTokenizerProtoService setup:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s Tokenization Service setup failed", (uint8_t *)&v18, 0xCu);
    }

    self->super.super._serviceState = 3;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Tokenizer nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCmdError:", v17);

    return v16;
  }
}

+ (id)createProtoTokenRequestWithText:(id)a3 locale:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  CDMTokenizationProtoRequestCommand *v9;

  v5 = (objc_class *)MEMORY[0x24BE9E2E8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v8, "setLocale:", v6);
  v9 = -[CDMTokenizationProtoRequestCommand initWithRequest:]([CDMTokenizationProtoRequestCommand alloc], "initWithRequest:", v8);

  return v9;
}

+ (id)createProtoTokenRequestWithAsrOutputs:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  unsigned int v27;
  NSObject *v28;
  NSObject *v29;
  CDMTokenizationProtoRequestCommand *v30;
  uint64_t v32;
  __int128 v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[14];
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v37;
    v11 = 1;
    *(_QWORD *)&v8 = 136315906;
    v33 = v8;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x24BE9E348];
        objc_msgSend(v13, "idA", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "convertUUID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        CDMOSLoggerForCategory(0);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v13, "utterance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v33;
          v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
          v42 = 1024;
          *(_DWORD *)v43 = v11;
          *(_WORD *)&v43[4] = 2112;
          *(_QWORD *)&v43[6] = v16;
          v44 = 2112;
          v45 = v25;
          _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s ASR #%d: Processing asr.UUID=%@, asr.utterance=%@", buf, 0x26u);

        }
        objc_msgSend(v13, "utterance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "length"))
        {
          v21 = objc_alloc_init(MEMORY[0x24BE9E2E8]);
          -[NSObject setText:](v21, "setText:", v20);
          -[NSObject setLocale:](v21, "setLocale:", v6);
          objc_msgSend(v13, "idA");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setAsrId:](v21, "setAsrId:", v22);

          CDMOSLoggerForCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
            v42 = 1024;
            *(_DWORD *)v43 = v11;
            *(_WORD *)&v43[4] = 2112;
            *(_QWORD *)&v43[6] = v16;
            v44 = 2112;
            v45 = v20;
            _os_log_debug_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEBUG, "%s ASR #%d: Added asr.UUID=%@, trimmed=%@", buf, 0x26u);
          }

          objc_msgSend(v35, "addObject:", v21);
          v24 = +[CDMUserDefaultsUtils readAsrAlternativeCount:](CDMUserDefaultsUtils, "readAsrAlternativeCount:", v6);
          if (v11 >= v24)
          {
            v27 = v24;
            CDMOSLoggerForCategory(0);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
              v42 = 1024;
              *(_DWORD *)v43 = v27;
              *(_WORD *)&v43[4] = 1024;
              *(_DWORD *)&v43[6] = v11;
              _os_log_debug_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_DEBUG, "%s Early return as we've processed enough ASRs per NSUserDefault config=%d, already processed counter=%d", buf, 0x18u);
            }

            goto LABEL_21;
          }
          ++v11;
        }
        else
        {
          CDMOSLoggerForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "utterance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v33;
            v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
            v42 = 1024;
            *(_DWORD *)v43 = v11;
            *(_WORD *)&v43[4] = 2112;
            *(_QWORD *)&v43[6] = v16;
            v44 = 2112;
            v45 = v26;
            _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s ASR #%d: Skipping trimmed empty version of asr.UUID=%@, asr.utterance=%@", buf, 0x26u);

          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_21:

  CDMOSLoggerForCategory(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v32 = objc_msgSend(v35, "count");
    *(_DWORD *)buf = 136315394;
    v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
    v42 = 2048;
    *(_QWORD *)v43 = v32;
    _os_log_debug_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_DEBUG, "%s Returning CDMTokenizationProtoRequestCommand with %lu ASRs", buf, 0x16u);
  }

  v30 = -[CDMTokenizationProtoRequestCommand initWithRequests:]([CDMTokenizationProtoRequestCommand alloc], "initWithRequests:", v35);
  return v30;
}

+ (id)tokenChainFromProto:(id)a3
{
  id v3;
  CDMTokenChain *v4;

  v3 = a3;
  v4 = -[CDMTokenChain initWithProtoTokenChain:]([CDMTokenChain alloc], "initWithProtoTokenChain:", v3);

  return v4;
}

- (id)handle:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  CDMTokenizer *tokenizer;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  CDMTokenizationProtoResponseCommand *v39;
  id v41;
  id obj;
  CDMTokenizerProtoService *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->super.super._serviceState == 2)
  {
    v5 = -[CDMDataDispatcherContext cdmSELFLoggingPolicyType](self->_dataDispatcherContext, "cdmSELFLoggingPolicyType");
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v41 = v4;
    objc_msgSend(v4, "requests");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v46)
    {
      v45 = *(_QWORD *)v56;
      v43 = self;
      v44 = v6;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v56 != v45)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v7);
          if (v8)
          {
            v49 = v7;
            tokenizer = self->_tokenizer;
            v50 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v7);
            objc_msgSend(v8, "text");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[CDMTokenizer createTokenChain:](tokenizer, "createTokenChain:", v10);
            v11 = objc_claimAutoreleasedReturnValue();

            v12 = objc_alloc_init(MEMORY[0x24BE9E300]);
            -[NSObject string](v11, "string");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setStringValue:", v13);

            -[NSObject locale](v11, "locale");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v12;
            objc_msgSend(v12, "setLocale:", v14);

            v15 = (void *)MEMORY[0x24BDBCEB8];
            -[NSObject tokens](v11, "tokens");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v48 = v11;
            -[NSObject tokens](v11, "tokens");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v52;
              do
              {
                v22 = 0;
                do
                {
                  if (*(_QWORD *)v52 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v22);
                  v24 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
                  objc_msgSend(v23, "value");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setValue:", v25);

                  objc_msgSend(v24, "setBegin:", objc_msgSend(v23, "begin"));
                  objc_msgSend(v24, "setEnd:", objc_msgSend(v23, "end"));
                  objc_msgSend(v24, "setIsSignificant:", objc_msgSend(v23, "isSignificant"));
                  objc_msgSend(v24, "setIsWhitespace:", objc_msgSend(v23, "isWhiteSpace"));
                  objc_msgSend(v23, "cleanValue");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setCleanValue:", v26);

                  objc_msgSend(v23, "cleanValues");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = (void *)objc_msgSend(v27, "mutableCopy");
                  objc_msgSend(v24, "setCleanValues:", v28);

                  objc_msgSend(v24, "setTokenIndex:", objc_msgSend(v23, "tokenIndex"));
                  objc_msgSend(v24, "setNonWhitespaceTokenIndex:", objc_msgSend(v23, "nonWhitespaceTokenIndex"));
                  objc_msgSend(v23, "normalizedValues");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = (void *)objc_msgSend(v29, "mutableCopy");
                  objc_msgSend(v24, "setNormalizedValues:", v30);

                  objc_msgSend(v17, "addObject:", v24);
                  v31 = CDMLogContext;
                  v32 = os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG);
                  if (v5 == 2)
                  {
                    if (v32)
                    {
                      *(_DWORD *)buf = 136315394;
                      v60 = "-[CDMTokenizerProtoService handle:]";
                      v61 = 2112;
                      v62 = CFSTR("tokenize");
                      _os_log_debug_impl(&dword_21A2A0000, v31, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nAdded token for asrId=<Redacted>.\nToken = <Redacted>", buf, 0x16u);
                    }
                  }
                  else if (v32)
                  {
                    v33 = v31;
                    objc_msgSend(v50, "asrId");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315906;
                    v60 = "-[CDMTokenizerProtoService handle:]";
                    v61 = 2112;
                    v62 = CFSTR("tokenize");
                    v63 = 2112;
                    v64 = v34;
                    v65 = 2112;
                    v66 = v24;
                    _os_log_debug_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nAdded token for asrId=%@.\nToken = %@", buf, 0x2Au);

                  }
                  ++v22;
                }
                while (v20 != v22);
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
              }
              while (v20);
            }

            objc_msgSend(v47, "setTokens:", v17);
            v35 = objc_alloc_init(MEMORY[0x24BE9E2F0]);
            objc_msgSend(v50, "text");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setText:", v36);

            objc_msgSend(v35, "setTokenChain:", v47);
            objc_msgSend(v50, "asrId");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setAsrId:", v37);

            v6 = v44;
            -[NSObject addObject:](v44, "addObject:", v35);

            self = v43;
            v38 = v48;
            v7 = v49;
          }
          else
          {
            CDMOSLoggerForCategory(0);
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v60 = "-[CDMTokenizerProtoService handle:]";
              _os_log_error_impl(&dword_21A2A0000, v38, OS_LOG_TYPE_ERROR, "%s [ERR]: TokenizationProtoRequest nil, skipping", buf, 0xCu);
            }
          }

          ++v7;
        }
        while (v7 != v46);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v46);
    }

    v39 = -[CDMTokenizationProtoResponseCommand initWithResponses:]([CDMTokenizationProtoResponseCommand alloc], "initWithResponses:", v6);
    v4 = v41;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v60 = "-[CDMTokenizerProtoService handle:]";
      _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: TokenizationProto Request received while service in not Ready state", buf, 0xCu);
    }
    v39 = 0;
  }

  return v39;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

@end
