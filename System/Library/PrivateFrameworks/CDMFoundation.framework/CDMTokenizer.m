@implementation CDMTokenizer

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

+ (BOOL)registerTrialAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE68FD0], "getAssetPathForLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || (objc_msgSend(a1, "trialAssetUpdate:", v4) & 1) != 0)
    v6 = objc_msgSend(a1, "syncTrialAsset:", v4);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)syncTrialAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "localeIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v24 = "+[CDMTokenizer syncTrialAsset:]";
    v25 = 2112;
    v26 = v19;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Issuing a blocking synchronous API call to get Morphun assets path using MorphunAssets for locale: %@.", buf, 0x16u);

  }
  v22 = 0;
  objc_msgSend(MEMORY[0x24BE68FD0], "getAssetPathForLocale:withError:", v4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "localeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "+[CDMTokenizer syncTrialAsset:]";
        v25 = 2112;
        v26 = v10;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s MorphunAssets returns path: %@ for locale: %@", buf, 0x20u);

      }
      objc_msgSend(a1, "registerMorphunAssetsPathForLocale:withPath:", v4, v10);
      goto LABEL_12;
    }
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localeIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM get nil Morphun assets path with no error returned from MorphunAssets for locale: %@.", buf, 0x16u);

    }
    v10 = 0;
LABEL_23:
    v11 = 0;
    goto LABEL_24;
  }
  v9 = -[NSObject code](v7, "code");
  if (!v9)
  {
    if (objc_msgSend(MEMORY[0x24BE68FD0], "isLocaleEmbedded:", v4))
    {
      CDMOSLoggerForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 1;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      objc_msgSend(v4, "localeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: [Not Critical] CDM gets Morphun assets path with error: %@ for embedded locale: %@. Skip following code to register Morphun assets path.", buf, 0x20u);

      goto LABEL_12;
    }
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localeIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v21;
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM gets Morphun assets path with error: %@ for non-embedded locale: %@.", buf, 0x20u);

    }
    goto LABEL_23;
  }
  if (v9 != 1)
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "+[CDMTokenizer syncTrialAsset:]";
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v16;
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM gets Morphun assets path with error: %@ for locale: %@.", buf, 0x20u);

    }
    goto LABEL_23;
  }
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "+[CDMTokenizer syncTrialAsset:]";
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: CDM gets Morphun assets path with error: %@ for locale: %@. The error code indicates the locale is not supported by MorphunAssets. Skip following code to register Morphun assets path. Morphun will fallback to use assets provided by CoreFoundation / ICU.", buf, 0x20u);

LABEL_12:
    v11 = 1;
  }
LABEL_24:

  return v11;
}

+ (id)tokenizerForLocale:(id)a3
{
  id v3;
  CDMTokenizer *v4;

  v3 = a3;
  v4 = -[CDMTokenizer initWithLocale:]([CDMTokenizer alloc], "initWithLocale:", v3);

  return v4;
}

- (CDMTokenizer)initWithLocale:(id)a3
{
  id v4;
  CDMTokenizer *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *morphunForceUpdateQueue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMTokenizer;
  v5 = -[CDMTokenizer init](&v9, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.siri.mini.CDMTokenizer", 0);
    morphunForceUpdateQueue = v5->_morphunForceUpdateQueue;
    v5->_morphunForceUpdateQueue = (OS_dispatch_queue *)v6;

    v5 = -[CDMTokenizer initWithLocale:maxTokens:maxInputSize:](v5, "initWithLocale:maxTokens:maxInputSize:", v4, 25, 4096);
  }

  return v5;
}

- (CDMTokenizer)initWithLocale:(id)a3 maxTokens:(int)a4 maxInputSize:(int)a5
{
  id v7;
  char *v8;
  uint64_t v9;
  ULocale *value;
  _QWORD *v11;
  NSString *v12;
  NSString *language;
  uint64_t v14;
  void *v15;
  const ULocale *v16;
  Tokenizer *Tokenizer;
  Tokenizer *v18;
  void *v19;
  void *v20;
  void *analyzer;
  uint64_t v22;
  void *normalizer;
  uint64_t v24;
  CDMTokenizer *v25;
  NSObject *v26;
  _BYTE buf[12];
  __int16 v29;
  id v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = objc_retainAutorelease(a3);
  v8 = (char *)objc_msgSend(v7, "UTF8String");
  v9 = operator new();
  std::string::basic_string[abi:ne180100]<0>(buf, v8);
  morphun::util::ULocale::ULocale();
  if (v31 < 0)
    operator delete(*(void **)buf);
  value = self->_locale.__ptr_.__value_;
  self->_locale.__ptr_.__value_ = (ULocale *)v9;
  if (value)
  {
    (*(void (**)(ULocale *))(*(_QWORD *)value + 16))(value);
    v9 = (uint64_t)self->_locale.__ptr_.__value_;
  }
  v11 = (_QWORD *)(v9 + 8);
  if (*(char *)(v9 + 31) < 0)
    v11 = (_QWORD *)*v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  language = self->_language;
  self->_language = v12;

  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend((id)v14, "registerTrialAsset:", v15);

  if ((v14 & 1) != 0)
  {
    self->_maxTokens = a4;
    Tokenizer = (Tokenizer *)morphun::TokenizerFactory::createTokenizer((morphun::TokenizerFactory *)self->_locale.__ptr_.__value_, v16);
    v18 = self->_tokenizer.__ptr_.__value_;
    self->_tokenizer.__ptr_.__value_ = Tokenizer;
    if (v18)
    {
      (*(void (**)(Tokenizer *))(*(_QWORD *)v18 + 16))(v18);
      Tokenizer = self->_tokenizer.__ptr_.__value_;
    }
    morphun::Tokenizer::setMaxTokens(Tokenizer);
    morphun::Tokenizer::setMaxInputSize(self->_tokenizer.__ptr_.__value_);
    v19 = +[CDMTokenizer analyzerFactory](CDMTokenizer, "analyzerFactory");
    self->_analyzer = (void *)(*(uint64_t (**)(void *, ULocale *))(*(_QWORD *)v19 + 24))(v19, self->_locale.__ptr_.__value_);
    v20 = +[CDMTokenizer normalizerFactory](CDMTokenizer, "normalizerFactory");
    self->_normalizer = (void *)(*(uint64_t (**)(void *, ULocale *))(*(_QWORD *)v20 + 24))(v20, self->_locale.__ptr_.__value_);
    analyzer = self->_analyzer;
    v31 = 1;
    *(_DWORD *)buf = 65;
    v22 = (*(uint64_t (**)(void *, _BYTE *))(*(_QWORD *)analyzer + 64))(analyzer, buf);
    if (v31 < 0)
      operator delete(*(void **)buf);
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 16))(v22);
    normalizer = self->_normalizer;
    v31 = 1;
    *(_DWORD *)buf = 65;
    v24 = (*(uint64_t (**)(void *, _BYTE *))(*(_QWORD *)normalizer + 64))(normalizer, buf);
    if (v31 < 0)
      operator delete(*(void **)buf);
    if (v24)
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 16))(v24);
    v25 = self;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CDMTokenizer initWithLocale:maxTokens:maxInputSize:]";
      v29 = 2112;
      v30 = v7;
      _os_log_error_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_ERROR, "%s [ERR]: Fail to register Morphun assets path for locale: %@.", buf, 0x16u);
    }

    v25 = 0;
  }

  return v25;
}

+ (void)normalizerFactory
{
  unsigned __int8 v2;
  morphun::analysis::DefaultAnalyzerFactory *v4;

  {
    v4 = (morphun::analysis::DefaultAnalyzerFactory *)operator new();
    morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(v4);
    +[CDMTokenizer normalizerFactory]::factory = (uint64_t)v4;
  }
  return (void *)+[CDMTokenizer normalizerFactory]::factory;
}

+ (void)analyzerFactory
{
  unsigned __int8 v2;
  morphun::analysis::DefaultAnalyzerFactory *v4;

  {
    v4 = (morphun::analysis::DefaultAnalyzerFactory *)operator new();
    morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(v4);
    +[CDMTokenizer analyzerFactory]::factory = (uint64_t)v4;
  }
  return (void *)+[CDMTokenizer analyzerFactory]::factory;
}

+ (void)registerMorphunAssetsPathForLocale:(id)a3 withPath:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *__p;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  CDMOSLoggerForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v27 = "+[CDMTokenizer registerMorphunAssetsPathForLocale:withPath:]";
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s Attempting to register Morphun assets from Trial for locale: %@ with path: %@", buf, 0x20u);

  }
  objc_msgSend(v5, "localeIdentifier");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v24, (char *)objc_msgSend(v9, "UTF8String"));
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  morphun::util::ULocale::ULocale();
  v10 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  morphun::resources::DataRegistrationService::registerDataPathForLocale();
  if (v14 < 0)
    operator delete(__p);
  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)buf);
  if (SHIBYTE(v17) < 0)
    operator delete(v15);
  if (SHIBYTE(v20) < 0)
    operator delete(v18);
  if (SHIBYTE(v23) < 0)
    operator delete(v21);
  if (v25 < 0)
    operator delete(v24);

  CDMOSLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v27 = "+[CDMTokenizer registerMorphunAssetsPathForLocale:withPath:]";
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Registered Morphun assets from Trial for locale: %@ with path: %@", buf, 0x20u);

  }
}

- (id)createTokenChain:(id)a3
{
  const __CFString *v4;
  __CFString *v5;
  CFIndex Length;
  std::basic_string<char16_t>::value_type v7;
  std::basic_string<char16_t> *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  CDMTokenChain *v12;
  void **v13;
  unint64_t v14;
  void *v15;
  unsigned int v16;
  morphun::Token *v17;
  morphun::Token *v18;
  morphun::Token *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  morphun::Token *v23;
  morphun::Token *v24;
  uint64_t Value;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t CleanValue;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CDMToken *v37;
  int v38;
  int v39;
  uint64_t isSignificant;
  CDMToken *v41;
  morphun::Token *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  _BOOL4 v51;
  morphun::Token *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  morphun::Token *v58;
  __CFString *v60;
  uint64_t v61;
  CDMTokenChain *v62;
  unsigned int v63;
  void *__p[2];
  unsigned __int8 v65;
  std::basic_string<char16_t> v66;
  CFRange v67;

  v4 = (const __CFString *)a3;
  v5 = (__CFString *)v4;
  memset(&v66, 0, sizeof(v66));
  if (v4)
  {
    Length = CFStringGetLength(v4);
    std::basic_string<char16_t>::resize(&v66, Length, v7);
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v8 = &v66;
    else
      v8 = (std::basic_string<char16_t> *)v66.__r_.__value_.__r.__words[0];
    v67.location = 0;
    v67.length = Length;
    CFStringGetCharacters(v5, v67, (UniChar *)v8);
  }
  v60 = v5;

  v9 = (*(uint64_t (**)(Tokenizer *, std::basic_string<char16_t> *))(*(_QWORD *)self->_tokenizer.__ptr_.__value_
                                                                             + 24))(self->_tokenizer.__ptr_.__value_, &v66);
  v10 = (_QWORD *)(*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)self->_analyzer + 72))(self->_analyzer, v9);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
  v11 = (*(uint64_t (**)(void *, _QWORD *))(*(_QWORD *)self->_normalizer + 72))(self->_normalizer, v10);
  v12 = [CDMTokenChain alloc];
  v61 = v11;
  (**(void (***)(void **__return_ptr))self->_locale.__ptr_.__value_)(__p);
  if ((v65 & 0x80u) == 0)
    v13 = __p;
  else
    v13 = (void **)__p[0];
  if ((v65 & 0x80u) == 0)
    v14 = v65;
  else
    v14 = (unint64_t)__p[1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[CDMTokenChain initWithString:locale:](v12, "initWithString:locale:", v60, v15);

  if ((char)v65 < 0)
    operator delete(__p[0]);
  morphun::TokenIterator::TokenIterator();
  morphun::TokenIterator::TokenIterator();
  v63 = 0;
  v16 = 0;
  while (1)
  {
    v17 = (morphun::Token *)v10[2];
    if (v17)
      morphun::Token::getNext(v17);
    morphun::TokenIterator::TokenIterator();
    if (!morphun::TokenIterator::operator!=())
      break;
    v18 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v18) & 1) == 0)
    {
      v19 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v19) & 1) == 0)
      {
        while (1)
        {
          v20 = morphun::TokenIterator::operator->();
          v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
          v22 = morphun::TokenIterator::operator->();
          if (v21 >= (*(int (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22))
          {
            v23 = (morphun::Token *)morphun::TokenIterator::operator->();
            if (!morphun::Token::isHead(v23))
              break;
          }
          morphun::TokenIterator::operator++();
        }
        v24 = (morphun::Token *)morphun::TokenIterator::operator*();
        Value = morphun::Token::getValue(v24);
        v26 = *(char *)(Value + 23);
        if (v26 >= 0)
          v27 = Value;
        else
          v27 = *(_QWORD *)Value;
        if (v26 >= 0)
          v28 = *(unsigned __int8 *)(Value + 23);
        else
          v28 = *(_QWORD *)(Value + 8);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        CleanValue = morphun::Token::getCleanValue(v24);
        v31 = *(unsigned __int8 *)(CleanValue + 23);
        if ((v31 & 0x80u) != 0)
          v31 = *(_QWORD *)(CleanValue + 8);
        if (v31)
        {
          v32 = morphun::Token::getCleanValue(v24);
          v33 = *(char *)(v32 + 23);
          if (v33 >= 0)
            v34 = v32;
          else
            v34 = *(_QWORD *)v32;
          if (v33 >= 0)
            v35 = *(unsigned __int8 *)(v32 + 23);
          else
            v35 = *(_QWORD *)(v32 + 8);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = 0;
        }
        v37 = [CDMToken alloc];
        v38 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v24 + 24))(v24);
        v39 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v24 + 32))(v24);
        isSignificant = morphun::Token::isSignificant(v24);
        v41 = -[CDMToken initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:](v37, "initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:", v29, v38, v39, isSignificant, morphun::Token::isWhitespace(v24), v36, v63, v16);

        while (1)
        {
          v42 = (morphun::Token *)morphun::TokenIterator::operator->();
          v43 = morphun::Token::getValue(v42);
          v44 = *(char *)(v43 + 23);
          v45 = v44 >= 0 ? v43 : *(_QWORD *)v43;
          v46 = v44 >= 0 ? *(unsigned __int8 *)(v43 + 23) : *(_QWORD *)(v43 + 8);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = morphun::TokenIterator::operator->();
          v49 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v48 + 24))(v48);
          v50 = morphun::TokenIterator::operator->();
          v51 = -[CDMToken hasValue:from:to:](v41, "hasValue:from:to:", v47, v49, (*(int (**)(uint64_t))(*(_QWORD *)v50 + 32))(v50));

          if (!v51)
            break;
          v52 = (morphun::Token *)morphun::TokenIterator::operator->();
          v53 = morphun::Token::getCleanValue(v52);
          v54 = *(char *)(v53 + 23);
          if (v54 >= 0)
            v55 = v53;
          else
            v55 = *(_QWORD *)v53;
          if (v54 >= 0)
            v56 = *(unsigned __int8 *)(v53 + 23);
          else
            v56 = *(_QWORD *)(v53 + 8);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDMToken addNormalizedValue:](v41, "addNormalizedValue:", v57);

          morphun::TokenIterator::operator++();
        }
        -[CDMTokenChain addToken:](v62, "addToken:", v41);
        v58 = (morphun::Token *)morphun::TokenIterator::operator->();
        ++v63;
        v16 += morphun::Token::isWhitespace(v58) ^ 1;

        v11 = v61;
      }
    }
    morphun::TokenIterator::operator++();
  }
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
  (*(void (**)(_QWORD *))(*v10 + 16))(v10);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v66.__r_.__value_.__l.__data_);

  return v62;
}

- (void).cxx_destruct
{
  ULocale *value;
  Tokenizer *v4;

  objc_storeStrong((id *)&self->_morphunForceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_language, 0);
  value = self->_locale.__ptr_.__value_;
  self->_locale.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ULocale *))(*(_QWORD *)value + 16))(value);
  v4 = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Tokenizer *))(*(_QWORD *)v4 + 16))(v4);
}

+ (id)printableLocales:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__CDMTokenizer_printableLocales___block_invoke;
  v7[3] = &unk_24DCACD38;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

+ (BOOL)trialAssetUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "localeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315394;
    v23 = "+[CDMTokenizer trialAssetUpdate:]";
    v24 = 2112;
    v25 = v20;
    _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, "%s Triggering Morphun assets downloading via MorphunAssets API for locale: %@.", (uint8_t *)&v22, 0x16u);

  }
  if ((objc_msgSend(MEMORY[0x24BE68FD0], "isLocaleDownloadSupported:", v4) & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x24BE68FD0], "isLocaleEmbedded:", v4))
    {
      objc_msgSend(MEMORY[0x24BE68FD0], "onDemandDownloadForLocale:withProgress:withCompletion:", v4, 0, 0);
      CDMOSLoggerForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "localeIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE68FD0], "EmbeddedLocales");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "printableLocales:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136315650;
        v23 = "+[CDMTokenizer trialAssetUpdate:]";
        v24 = 2112;
        v25 = v8;
        v26 = 2112;
        v27[0] = v10;
        _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s Issued an non-blocking Morphun Trial asset downloading for %@ as it's part of Morphun embedded locales: %@", (uint8_t *)&v22, 0x20u);

LABEL_9:
        v7 = 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE68FD0], "blockingOnDemandDownloadForLocale:withTimeout:withProgress:", v4, dispatch_time(0, 180000000000), 0);
      v6 = objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "localeIdentifier");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE68FD0], "EmbeddedLocales");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "printableLocales:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136315906;
        v23 = "+[CDMTokenizer trialAssetUpdate:]";
        v24 = 2112;
        v25 = v15;
        v26 = 1024;
        LODWORD(v27[0]) = 180;
        WORD2(v27[0]) = 2112;
        *(_QWORD *)((char *)v27 + 6) = v17;
        _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s Issued a blocking Morphun Trial asset downloading for %@, with timeout of %d secs. This language is NOT part of Morphun embedded locales: %@", (uint8_t *)&v22, 0x26u);

      }
      if (!v6)
      {
        v7 = 1;
        goto LABEL_17;
      }
      CDMOSLoggerForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "localeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136315650;
        v23 = "+[CDMTokenizer trialAssetUpdate:]";
        v24 = 2112;
        v25 = v21;
        v26 = 2112;
        v27[0] = v6;
        _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Morphun Trial asset downloading timed out for: %@, with error: %@", (uint8_t *)&v22, 0x20u);

      }
      v7 = 0;
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "localeIdentifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE68FD0], "SupportedLocales");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "printableLocales:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136315650;
      v23 = "+[CDMTokenizer trialAssetUpdate:]";
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27[0] = v13;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: Current locale: %@ is NOT in MorphunAssets download supported list: %@. Return TRUE so that Morphun will fallback to use Morphun assets provided by CoreFoundation / ICU on device for this locale.", (uint8_t *)&v22, 0x20u);

      goto LABEL_9;
    }
  }

LABEL_17:
  return v7;
}

void __33__CDMTokenizer_printableLocales___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localeIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

@end
