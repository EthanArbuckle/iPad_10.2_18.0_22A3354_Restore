@implementation CDMBaseSpanMatchService

- (id)handleRequestCommandTypeNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  +[CDMBaseCommand commandName](CDMSpanMatcherRequestCommand, "commandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)setupSpanMatcher:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)handle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CDMBaseSpanMatchService _handle:](self, "_handle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_handle:(id)a3
{
  id v4;
  objc_class *v5;
  __CFString *v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CDMTokenChain *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  CDMSpanMatcherResponseCommand *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  CDMTokenChain *v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  int64_t v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDMBaseService serviceState](self, "serviceState");
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s Spanize all ASR(s) and fill in asrSpansMap & topAsrSpansFiltered", buf, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "spanMatchRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "spanMatchRequests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    objc_msgSend(v4, "spanMatchRequests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asrHypothesis");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMBaseSpanMatchService spanizeAsrs:asrSpansMap:topAsrSpans:topAsrSpansFiltered:asrHypotheses:](self, "spanizeAsrs:asrSpansMap:topAsrSpans:topAsrSpansFiltered:asrHypotheses:", v17, v10, v13, v16, v18);

    objc_msgSend(v4, "spanMatchRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = [CDMTokenChain alloc];
    objc_msgSend(v20, "tokenChain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[CDMTokenChain initWithProtoTokenChain:](v21, "initWithProtoTokenChain:", v22);

    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      _os_log_debug_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_DEBUG, "%s Creating a map of {ASR uuid: {char_index: timing}} for ASR alternatives", buf, 0xCu);
    }

    objc_msgSend(v4, "asrHypothesis");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMAsrUtils createAsrUuidCharIndexTimingMaps:](CDMAsrUtils, "createAsrUuidCharIndexTimingMaps:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      _os_log_debug_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_DEBUG, "%s Get the {char_index: timing} map for top ASR", buf, 0xCu);
    }

    v52 = v20;
    objc_msgSend(v20, "asrId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", v27);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "asrHypothesis");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    v53 = v25;
    if (v29)
    {
      v30 = os_signpost_id_generate((os_log_t)CDMLogContext);
      v31 = (id)CDMLogContext;
      v32 = v31;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SpanMatcher", "Add ASR confidence scores to spans", buf, 2u);
      }

      objc_msgSend(v4, "asrHypothesis");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMSpanMatchUtils addAsrConfidenceToSpans:tokenChain:asrTimingMap:asrHypothesis:](CDMSpanMatchUtils, "addAsrConfidenceToSpans:tokenChain:asrTimingMap:asrHypothesis:", v13, v55, v54, v34);

      v35 = (id)CDMLogContext;
      v36 = v35;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v36, OS_SIGNPOST_INTERVAL_END, v30, "SpanMatcher", ", buf, 2u);
      }

      v25 = v53;
    }
    objc_msgSend(v4, "spanMatchRequests");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    if (v38 >= 2)
    {
      objc_msgSend(v4, "spanMatchRequests");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asrHypothesis");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMSpanMatchUtils postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAsrSpansFiltered:](CDMSpanMatchUtils, "postProcessSpans:asrSpansMap:asrHypothesis:asrMaps:topAsrTokenChain:asrMapTopAsr:topAsrSpansFiltered:", v39, v10, v40, v25, v55, v54, v16);

    }
    v41 = os_signpost_id_generate((os_log_t)CDMLogContext);
    v42 = (id)CDMLogContext;
    v43 = v42;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "SpanMatcher", "spanMatchResponse", buf, 2u);
    }

    v44 = objc_alloc_init(MEMORY[0x24BE9E2C8]);
    -[CDMBaseSpanMatchService limitNumberOfSpans:](self, "limitNumberOfSpans:", v13);
    +[CDMSpanMatchUtils setAsrHypothesisIndexForTopAsrSpans:](CDMSpanMatchUtils, "setAsrHypothesisIndexForTopAsrSpans:", v13);
    objc_msgSend(v44, "setMatchingSpans:", v13);
    v45 = -[CDMSpanMatcherResponseCommand initWithResponse:]([CDMSpanMatcherResponseCommand alloc], "initWithResponse:", v44);
    v46 = (void *)CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      v50 = v46;
      v51 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 136315906;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      v58 = 2112;
      v59 = CFSTR("spanmatch");
      v60 = 2112;
      v61 = (int64_t)v6;
      v62 = 1024;
      v63 = v51;
      _os_log_debug_impl(&dword_21A2A0000, v50, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@ generated number of spans: %d", buf, 0x26u);

      v46 = (void *)CDMLogContext;
    }
    v47 = v46;
    v48 = v47;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v48, OS_SIGNPOST_INTERVAL_END, v41, "SpanMatcher", ", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      v58 = 2112;
      v59 = v6;
      v60 = 2048;
      v61 = -[CDMBaseService serviceState](self, "serviceState");
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s %@ Not Ready! State: %tu", buf, 0x20u);
    }

    v45 = objc_alloc_init(CDMSpanMatcherResponseCommand);
    -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, CFSTR("Service Not Ready"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CDMBaseCommand setCmdError:](v45, "setCmdError:", v10);
  }

  return v45;
}

- (id)createErrorSetupResponseCommand:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->super.super._serviceState = 3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[CDMBaseSpanMatchService createErrorSetupResponseCommand:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: %@", (uint8_t *)&v9, 0x16u);
  }

  -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMBaseService createErrorWithCode:description:](self, "createErrorWithCode:description:", 1, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCmdError:", v7);

  return v6;
}

- (id)setup:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[CDMBaseSpanMatchService setup:]";
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s Setup %@", buf, 0x16u);

  }
  -[CDMBaseSpanMatchService setupSpanMatcher:](self, "setupSpanMatcher:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CDMBaseSpanMatchService setSpanMatcher:](self, "setSpanMatcher:", v8);
    self->super.super._serviceState = 2;
    -[CDMBaseService createSetupResponseCommand](self, "createSetupResponseCommand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unable to setup span matcher for %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDMBaseSpanMatchService createErrorSetupResponseCommand:](self, "createErrorSetupResponseCommand:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)warmup:(id)a3
{
  NSObject *v4;
  void *v5;
  CDMTokenChain *v6;
  CDMToken *v7;
  id v8;
  id v9;
  CDMWarmupResponseCommand *v10;
  int64_t v11;
  void *v12;
  CDMWarmupResponseCommand *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[CDMBaseService serviceName](self, "serviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[CDMBaseSpanMatchService warmup:]";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s Prewarm Span Matcher %@", buf, 0x16u);

  }
  v6 = -[CDMTokenChain initWithString:locale:]([CDMTokenChain alloc], "initWithString:locale:", CFSTR("helloworld"), CFSTR("en"));
  v7 = -[CDMToken initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:]([CDMToken alloc], "initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:", CFSTR("helloworld"), 0, 10, 1, 0, CFSTR("helloworld"), 0, 0);
  -[CDMToken addNormalizedValue:](v7, "addNormalizedValue:", CFSTR("helloworld"));
  -[CDMTokenChain addToken:](v6, "addToken:", v7);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:](self, "spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:", v6, v8, 1, v9, 0);
  v10 = [CDMWarmupResponseCommand alloc];
  v11 = -[CDMBaseService serviceState](self, "serviceState");
  -[CDMBaseService serviceName](self, "serviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CDMWarmupResponseCommand initWithServiceState:serviceName:](v10, "initWithServiceState:serviceName:", v11, v12);

  return v13;
}

- (void)spanizeAsrs:(id)a3 asrSpansMap:(id)a4 topAsrSpans:(id)a5 topAsrSpansFiltered:(id)a6 asrHypotheses:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  unint64_t v24;
  void *v25;
  CDMTokenChain *v26;
  void *v27;
  CDMTokenChain *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  __int128 v36;
  id v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v38 = a4;
  v37 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v20, "idA");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v20, "idA");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v20, v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v11, "count"))
  {
    v24 = 0;
    *(_QWORD *)&v23 = 136315138;
    v36 = v23;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v24, v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = [CDMTokenChain alloc];
      objc_msgSend(v25, "tokenChain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[CDMTokenChain initWithProtoTokenChain:](v26, "initWithProtoTokenChain:", v27);

      objc_msgSend(v25, "asrId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v25, "asrId");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = 0;
      }
      v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:](self, "spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:", v28, v32, v24 == 0, v12, v31);
      if (!v24)
      {
        CDMOSLoggerForCategory(0);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v36;
          v45 = "-[CDMBaseSpanMatchService spanizeAsrs:asrSpansMap:topAsrSpans:topAsrSpansFiltered:asrHypotheses:]";
          _os_log_debug_impl(&dword_21A2A0000, v33, OS_LOG_TYPE_DEBUG, "%s This is top ASR, set the topAsrSpans", buf, 0xCu);
        }

        objc_msgSend(v37, "addObjectsFromArray:", v32);
      }
      objc_msgSend(v25, "asrId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v25, "asrId");
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKey:", v32, v35);
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMBaseSpanMatchService spanizeAsrs:asrSpansMap:topAsrSpans:topAsrSpansFiltered:asrHypotheses:]";
          v46 = 2112;
          v47 = v25;
          _os_log_impl(&dword_21A2A0000, v35, OS_LOG_TYPE_INFO, "%s [WARN]: Did not expect a request w/o ASR uuid? %@", buf, 0x16u);
        }
      }

      ++v24;
    }
    while (objc_msgSend(v11, "count") > v24);
  }

}

- (BOOL)shouldBeUsedForAsrAlternatives
{
  return 0;
}

- (void)spanizeTokenChain:(id)a3 spans:(id)a4 isTopAsr:(BOOL)a5 topAsrSpansFiltered:(id)a6 asrHypothesis:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v9 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  -[CDMBaseSpanMatchService spanMatcher](self, "spanMatcher");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "normalizedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315650;
    v25 = "-[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:]";
    v26 = 2112;
    v27 = v21;
    v28 = 2112;
    v29 = (uint64_t)v16;
    _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s Start spanizing utterance: [%@]; with span matcher: %@",
      (uint8_t *)&v24,
      0x20u);

  }
  objc_msgSend(v16, "matchSpansForTokenChain:asrHypothesis:", v12, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addObjectsFromArray:", v18);
  if (v9 && -[CDMBaseSpanMatchService shouldBeUsedForAsrAlternatives](self, "shouldBeUsedForAsrAlternatives"))
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v24 = 136315138;
      v25 = "-[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:]";
      _os_log_debug_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_DEBUG, "%s Add selected spans from top ASR for use later in post-processing of ASR alternatives", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend(v13, "addObjectsFromArray:", v18);
  }
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "normalizedString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v18, "count");
    v24 = 136315906;
    v25 = "-[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:]";
    v26 = 2112;
    v27 = v22;
    v28 = 2048;
    v29 = v23;
    v30 = 2112;
    v31 = v16;
    _os_log_debug_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_DEBUG, "%s Spanized utterance: [%@]; Created %lu span(s) for span matcher: %@",
      (uint8_t *)&v24,
      0x2Au);

  }
}

- (void)limitNumberOfSpans:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 0x65)
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315650;
      v6 = "-[CDMBaseSpanMatchService limitNumberOfSpans:]";
      v7 = 2048;
      v8 = objc_msgSend(v3, "count");
      v9 = 1024;
      v10 = 100;
      _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Matched count=%lu spans, filtering spans to the limit=%d", (uint8_t *)&v5, 0x1Cu);
    }

    objc_msgSend(v3, "removeObjectsInRange:", 100, objc_msgSend(v3, "count") - 100);
  }

}

- (CDMProtoSpanMatcher)spanMatcher
{
  return (CDMProtoSpanMatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSpanMatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanMatcher, 0);
}

+ (Class)spanMatcherClass
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)getCDMServiceAssetConfig
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a1, "spanMatcherClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "getCDMServiceAssetConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)convertToSpanMatchRequests:(id)a3 nlContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequest:nlContext:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)convertToSpanMatchRequest:(id)a3 nlContext:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BE9E2C0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v7, "tokenChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTokenChain:", v9);

  objc_msgSend(v7, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUtterance:", v10);

  objc_msgSend(v8, "setNlContext:", v6);
  objc_msgSend(v7, "asrId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAsrId:", v11);
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "utterance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "+[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:]";
    v17 = 2112;
    v18 = v14;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Converted TokenizerResponse -> SpanMatchRequest for utterance: %@", (uint8_t *)&v15, 0x16u);

  }
  return v8;
}

@end
