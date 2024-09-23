@implementation CDMSiriVocabularyProtoSpanMatcher

- (CDMSiriVocabularyProtoSpanMatcher)initWithSEMSpanMatcher:(id)a3 userId:(id)a4
{
  id v7;
  id v8;
  CDMSiriVocabularyProtoSpanMatcher *v9;
  CDMSiriVocabularyProtoSpanMatcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  v9 = -[CDMSiriVocabularyProtoSpanMatcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_semSpanMatcher, a3);
    objc_storeStrong((id *)&v10->_userId, a4);
  }

  return v10;
}

- (CDMSiriVocabularyProtoSpanMatcher)initWithSandboxId:(id)a3
{
  id v4;
  CDMSiriVocabularyProtoSpanMatcher *v5;
  uint64_t v6;
  id v7;
  SEMSandbox *semSandbox;
  SEMSandbox *v9;
  uint64_t v10;
  SEMSpanMatcher *semSpanMatcher;
  NSObject *v12;
  CDMSiriVocabularyProtoSpanMatcher *v13;
  NSObject *v14;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  v5 = -[CDMSiriVocabularyProtoSpanMatcher init](&v17, sel_init);
  if (!v5)
  {
LABEL_6:
    v13 = v5;
    goto LABEL_10;
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x24BE92C90], "loadWithSandboxId:error:", v4, &v16);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v16;
  semSandbox = v5->_semSandbox;
  v5->_semSandbox = (SEMSandbox *)v6;

  v9 = v5->_semSandbox;
  if (v9)
  {
    -[SEMSandbox indexMatcher](v9, "indexMatcher");
    v10 = objc_claimAutoreleasedReturnValue();
    semSpanMatcher = v5->_semSpanMatcher;
    v5->_semSpanMatcher = (SEMSpanMatcher *)v10;

    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[CDMSiriVocabularyProtoSpanMatcher initWithSandboxId:]";
      v20 = 2112;
      v21 = v4;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s SiriVocabulary span matcher initialized with sandbox Id %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CDMSiriVocabularyProtoSpanMatcher initWithSandboxId:]";
    v20 = 2112;
    v21 = v7;
    _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Error when loading Siri Entity Matcher Sandbox for SiriVocabulary: %@", buf, 0x16u);
  }

  v13 = 0;
LABEL_10:

  return v13;
}

- (CDMSiriVocabularyProtoSpanMatcher)initWithOverrideSpans:(id)a3
{
  id v5;
  CDMSiriVocabularyProtoSpanMatcher *v6;
  CDMSiriVocabularyProtoSpanMatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  v6 = -[CDMSiriVocabularyProtoSpanMatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_overrideSpans, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CDMSiriVocabularyProtoSpanMatcher;
  -[CDMSiriVocabularyProtoSpanMatcher dealloc](&v2, sel_dealloc);
}

- (id)semSandboxId
{
  void *semSandbox;

  semSandbox = self->_semSandbox;
  if (semSandbox)
  {
    objc_msgSend(semSandbox, "sandboxId");
    semSandbox = (void *)objc_claimAutoreleasedReturnValue();
  }
  return semSandbox;
}

- (id)callSEMSpanMatcher:(id)a3 asrHypothesis:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  SEMSpanMatcher *semSpanMatcher;
  NSString *userId;
  void *v25;
  id v26;
  NSObject *v27;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v34;
  id obj;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31 = a4;
  v6 = (void *)MEMORY[0x24BDBCEA0];
  v34 = v5;
  objc_msgSend(v5, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeWithLocaleIdentifier:", v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BE92C98]);
  objc_msgSend(v5, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v8, "initWithLocale:originalText:asrHypothesis:", v32, v9, v31);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "tokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v14, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cleanValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "normalizedValues");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v14, "begin");
        v19 = objc_msgSend(v14, "end");
        v20 = objc_msgSend(v14, "isSignificant");
        LOBYTE(v30) = objc_msgSend(v14, "isWhiteSpace");
        objc_msgSend(v36, "addTokenWithValue:cleanValue:normalizedValues:beginIndex:endIndex:isSignificant:isWhitespace:", v15, v16, v17, v18, v19, v20, v30);

      }
      v10 = obj;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v11);
  }

  objc_msgSend(v36, "build");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_semSandbox)
  {
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[CDMSiriVocabularyProtoSpanMatcher semSandboxId](self, "semSandboxId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v43 = "-[CDMSiriVocabularyProtoSpanMatcher callSEMSpanMatcher:asrHypothesis:]";
      v44 = 2112;
      v45 = v29;
      _os_log_debug_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_DEBUG, "%s SiriVocabulary matching spans with Siri Entity Matcher sandbox ID: %@", buf, 0x16u);

    }
  }
  semSpanMatcher = self->_semSpanMatcher;
  userId = self->_userId;
  v37 = 0;
  -[SEMSpanMatcher matchSpans:userId:error:](semSpanMatcher, "matchSpans:userId:error:", v21, userId, &v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v37;
  if (!v25)
  {
    CDMOSLoggerForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[CDMSiriVocabularyProtoSpanMatcher callSEMSpanMatcher:asrHypothesis:]";
      v44 = 2112;
      v45 = v26;
      _os_log_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_INFO, "%s [WARN]: Nil span match results returned: %@", buf, 0x16u);
    }

  }
  return v25;
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSArray *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  char *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_overrideSpans)
  {
    CDMOSLoggerForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315138;
      v20 = "-[CDMSiriVocabularyProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
      _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s SiriVocabularyProtoSpanMatcher is returning override spans!", (uint8_t *)&v19, 0xCu);
    }

    v9 = self->_overrideSpans;
  }
  else
  {
    v10 = os_signpost_id_generate((os_log_t)CDMLogContext);
    v11 = (id)CDMLogContext;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SpanMatcher", "%{public}@", (uint8_t *)&v19, 0xCu);

    }
    -[CDMSiriVocabularyProtoSpanMatcher callSEMSpanMatcher:asrHypothesis:](self, "callSEMSpanMatcher:asrHypothesis:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSiriVocabularyProtoSpanMatcher convertSEMSpanResults:tokenChain:](CDMSiriVocabularyProtoSpanMatcher, "convertSEMSpanResults:tokenChain:", v15, v6);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = (id)CDMLogContext;
    v17 = v16;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v17, OS_SIGNPOST_INTERVAL_END, v10, "SpanMatcher", ", (uint8_t *)&v19, 2u);
    }

  }
  return v9;
}

- (NSArray)overrideSpans
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)userId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_semSpanMatcher, 0);
  objc_storeStrong((id *)&self->_overrideSpans, 0);
  objc_storeStrong((id *)&self->_semSandbox, 0);
}

+ (id)convertSEMResultToNLUTypesMatchingSpan:(id)a3 tokenChain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  std::string *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  float v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  std::string v32;
  id v33;
  std::string buf;
  char v35;
  uint64_t v36;
  NSRange v37;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v33 = 0;
  objc_msgSend(v5, "toOntologyGraph:", &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  if (!v7)
  {
    CDMOSLoggerForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v8;
      _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: No ontologyGraph from spanMatchResult: %@", (uint8_t *)&buf, 0x16u);
    }

  }
  std::string::basic_string[abi:ne180100]<0>(&v32, "");
  v10 = +[CDMSiriVocabularyProtoSpanMatcher getFirstEntitySpanFromGraph:](CDMSiriVocabularyProtoSpanMatcher, "getFirstEntitySpanFromGraph:", v7);
  if (v10)
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&buf, (__int128 *)(v10 + 40));
    if (v35)
    {
      std::string::operator=(&v32, &buf);
      if (v35)
      {
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
      }
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: No valid UsoEntitySpan in SEMSpanMatchResult graph, so unable to populate span label", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(v5, "spanInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: No valid SEMSpanInfo in SEMSpanMatchResult, so unable to populate SIRINLUINTERNALMatchingSpan indexes", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_27;
  }
  v14 = objc_msgSend(v12, "spanRange");
  v16 = v15;
  objc_msgSend(v6, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 >= objc_msgSend(v17, "length"))
  {

LABEL_25:
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v37.location = v14;
      v37.length = v16;
      NSStringFromRange(v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"+[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:]";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v28;
      _os_log_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_INFO, "%s [WARN]: Invalid SEMSpanInfo in SEMSpanMatchResult, so unable to populate SIRINLUINTERNALMatchingSpan indexes. Given range %@", (uint8_t *)&buf, 0x16u);

    }
LABEL_27:
    v23 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v6, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16 > objc_msgSend(v18, "length") - v14;

  if (v19)
    goto LABEL_25;
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v32;
  else
    v20 = (std::string *)v32.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "substringWithRange:", v14, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 2;
  +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:](CDMProtoSpanMatcherHelper, "buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:startCharIndex:endCharIndex:spanMatcherName:", v31, v22, objc_msgSend(v6, "tokenIndexFromCharacterIndex:", v14), objc_msgSend(v6, "tokenIndexFromCharacterIndex:", (v14 + v16 - 1)) + 1, v14, (v14 + v16), v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc_init(MEMORY[0x24BE9E208]);
  v25 = objc_alloc_init(MEMORY[0x24BE9E2E0]);
  objc_msgSend(v13, "matchScore");
  objc_msgSend(v25, "setMatchScore:", v26);
  -[NSObject setSiriVocabularySpanData:](v24, "setSiriVocabularySpanData:", v25);
  objc_msgSend(v23, "setInternalSpanData:", v24);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", objc_msgSend(v7, "getCppGraph"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUsoGraph:", v27);

  }
LABEL_28:

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);

  return v23;
}

+ (void)getFirstEntitySpanFromGraph:(id)a3
{
  id v3;
  void *v4;
  const void **v5;
  const struct __class_type_info *v6;
  siri::ontology::UsoEntityNode *v7;
  void *v8;
  void **v10;
  void **v11;
  const void **v12;
  const void **v13;

  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "getCppGraph"))
  {
    v8 = 0;
    goto LABEL_17;
  }
  siri::ontology::UsoGraph::getNodes((siri::ontology::UsoGraph *)objc_msgSend(v4, "getCppGraph"));
  v5 = v12;
  if (v12 == v13)
  {
    v8 = 0;
    if (v12)
      goto LABEL_16;
    goto LABEL_17;
  }
  v6 = (const struct __class_type_info *)MEMORY[0x24BEA3F70];
  while (1)
  {
    if (v7)
      break;
LABEL_9:
    if (++v5 == v13)
    {
      v8 = 0;
      goto LABEL_15;
    }
  }
  siri::ontology::UsoEntityNode::getEntitySpans(v7);
  if (v11 == v10)
  {
    if (v11)
      operator delete(v11);
    goto LABEL_9;
  }
  v8 = *v10;
  operator delete(v10);
LABEL_15:
  v5 = v12;
  if (v12)
LABEL_16:
    operator delete(v5);
LABEL_17:

  return v8;
}

+ (id)convertSEMSpanResults:(id)a3 tokenChain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  unint64_t i;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "+[CDMSiriVocabularyProtoSpanMatcher convertSEMSpanResults:tokenChain:]";
    v15 = 2048;
    v16 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s SiriVocabulary matched %tu spanResults", buf, 0x16u);
  }

  for (i = 0; objc_msgSend(v5, "count") > i; ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSiriVocabularyProtoSpanMatcher convertSEMResultToNLUTypesMatchingSpan:tokenChain:](CDMSiriVocabularyProtoSpanMatcher, "convertSEMResultToNLUTypesMatchingSpan:tokenChain:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v7, "addObject:", v11);

  }
  return v7;
}

@end
