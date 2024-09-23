@implementation _EARFormatter

+ (void)initialize
{
  uint64_t is_darwinos;
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    is_darwinos = os_variant_is_darwinos();
    if ((is_darwinos & 1) == 0)
    {
      v3 = (id)objc_opt_self();
      is_darwinos = +[EARSdapiHelper EnsureSDAPIInitialized](EARSdapiHelper, "EnsureSDAPIInitialized");
    }
    EARLogger::initializeLogging((EARLogger *)is_darwinos);
  }
}

- (_EARFormatter)initWithLanguage:(id)a3 withSdapiConfig:(id)a4 quasarConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARFormatter *v11;
  uint64_t v12;
  NSString *language;
  SpeechITN *v14;
  SpeechITN *value;
  void *v16;
  _OWORD *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  uint64_t *v24;
  SpeechITN *v25;
  uint64_t *v26;
  _EARFormatter *v27;
  void *v29[2];
  uint64_t v30;
  void *v31[2];
  uint64_t v32;
  void *v33[2];
  char v34;
  uint64_t *v35;
  std::string __p[5];
  _QWORD *v37;
  char v38;
  _QWORD *v39;
  char v40;
  _QWORD *v41;
  char v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t v48;
  objc_super v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v49.receiver = self;
  v49.super_class = (Class)_EARFormatter;
  v11 = -[_EARFormatter init](&v49, sel_init);
  if (!v11)
    goto LABEL_55;
  v12 = objc_msgSend(v8, "copy");
  language = v11->_language;
  v11->_language = (NSString *)v12;

  if (objc_msgSend(v10, "length"))
  {
    if (v10)
    {
      objc_msgSend(v10, "ear_toString");
      if (v8)
      {
LABEL_5:
        objc_msgSend(v8, "ear_toString");
        goto LABEL_11;
      }
    }
    else
    {
      memset(__p, 0, 24);
      if (v8)
        goto LABEL_5;
    }
    v46 = 0;
    v47 = 0;
    v48 = 0;
LABEL_11:
    v43 = 0;
    v44 = 0;
    v45 = 0;
    SpeechITN::createQuasarITN((uint64_t)__p, (const quasar::SystemConfig *)&v46, (uint64_t *)&v43, 0, v31);
    v14 = (SpeechITN *)v31[0];
    v31[0] = 0;
    value = v11->_itn.__ptr_.__value_;
    v11->_itn.__ptr_.__value_ = v14;
    if (value)
    {
      (*(void (**)(SpeechITN *))(*(_QWORD *)value + 8))(value);
      v16 = v31[0];
      v31[0] = 0;
      if (v16)
        (*(void (**)(void *))(*(_QWORD *)v16 + 8))(v16);
    }
    v33[0] = &v43;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v33);
    if (SHIBYTE(v48) < 0)
      operator delete(v46);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
    goto LABEL_55;
  }
  if ((os_variant_is_darwinos() & 1) != 0)
    goto LABEL_55;
  if (v9)
    objc_msgSend(v9, "ear_toString");
  else
    memset(__p, 0, 24);
  sdapi::SdapiUtil::readConfig((__int128 *)__p, (uint64_t)&v46);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
  }
  else
  {
    v43 = 0;
    v44 = 0;
    v45 = 0;
  }
  v33[0] = &v43;
  v17 = std::__tree<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v46, (const void **)&v43, (uint64_t)&std::piecewise_construct, (_OWORD **)v33);
  sdapi::SdapiUtil::LocaleInfo::LocaleInfo(__p, (_OWORD *)((char *)v17 + 56));
  if (SHIBYTE(v45) < 0)
    operator delete(v43);
  if (v38 >= 0)
    v18 = &v37;
  else
    v18 = v37;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 >= 0)
    v20 = &v39;
  else
    v20 = v39;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42 >= 0)
    v22 = &v41;
  else
    v22 = v41;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v19, "ear_toString");
  }
  else
  {
    v43 = 0;
    v44 = 0;
    v45 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v33, "");
  if (v21)
  {
    objc_msgSend(v21, "ear_toString");
    if (v23)
    {
LABEL_40:
      objc_msgSend(v23, "ear_toString");
      goto LABEL_43;
    }
  }
  else
  {
    v31[0] = 0;
    v31[1] = 0;
    v32 = 0;
    if (v23)
      goto LABEL_40;
  }
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
LABEL_43:
  SpeechITN::createSdapiITN((uint64_t)&v43, (uint64_t)v33, (uint64_t)v31, (uint64_t)v29, &v35);
  v24 = v35;
  v35 = 0;
  v25 = v11->_itn.__ptr_.__value_;
  v11->_itn.__ptr_.__value_ = (SpeechITN *)v24;
  if (v25)
  {
    (*(void (**)(SpeechITN *))(*(_QWORD *)v25 + 8))(v25);
    v26 = v35;
    v35 = 0;
    if (v26)
      (*(void (**)(uint64_t *))(*v26 + 8))(v26);
  }
  if (SHIBYTE(v30) < 0)
    operator delete(v29[0]);
  if (SHIBYTE(v32) < 0)
    operator delete(v31[0]);
  if (v34 < 0)
    operator delete(v33[0]);
  if (SHIBYTE(v45) < 0)
    operator delete(v43);

  sdapi::SdapiUtil::LocaleInfo::~LocaleInfo((void **)&__p[0].__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>>>::destroy((uint64_t)&v46, v47);
LABEL_55:
  v27 = v11;

  return v27;
}

- (_EARFormatter)initWithQuasarConfig:(id)a3
{
  return -[_EARFormatter initWithQuasarConfig:overrideConfigFiles:](self, "initWithQuasarConfig:overrideConfigFiles:", a3, 0);
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4
{
  return -[_EARFormatter initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:](self, "initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:", a3, a4, 0, 0);
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4 supportEmojiRecognition:(BOOL)a5 language:(id)a6
{
  return -[_EARFormatter initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:](self, "initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:", a3, a4, a5, a6, 0);
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 overrideConfigFiles:(id)a4 supportEmojiRecognition:(BOOL)a5 language:(id)a6 skipPathsExistCheck:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  _EARFormatter *v15;
  void *v16;
  uint64_t v17;
  NSString *language;
  const quasar::SpeechModelInfo *SpeechModelInfo;
  _QWORD *v20;
  uint64_t v21;
  NSString *v22;
  EARLogger *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _EARFormatter *v32;
  SpeechITN *v33;
  SpeechITN *value;
  void *v35;
  _EAREmojiRecognition *v36;
  _EAREmojiRecognition *emojiFormatter;
  void *v39[2];
  __int128 v40;
  int v41;
  _QWORD *v42;
  char v43;
  void *__p[2];
  uint64_t v45;
  void **v46[193];
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  __n128 (*v51)(__n128 *, __n128 *);
  void (*v52)(uint64_t);
  void *v53;
  _QWORD v54[3];
  objc_super v55;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v55.receiver = self;
  v55.super_class = (Class)_EARFormatter;
  v15 = -[_EARFormatter init](&v55, sel_init);
  if (!v15)
    goto LABEL_30;
  v48 = 0;
  v49 = &v48;
  v50 = 0x4812000000;
  v51 = __Block_byref_object_copy__13;
  v52 = __Block_byref_object_dispose__13;
  v53 = &unk_1AE30551B;
  memset(v54, 0, sizeof(v54));
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __111___EARFormatter_initWithQuasarConfig_overrideConfigFiles_supportEmojiRecognition_language_skipPathsExistCheck___block_invoke;
  v47[3] = &unk_1E5D46F38;
  v47[4] = &v48;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v47);
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v46);
  if (v12)
  {
    objc_msgSend(v12, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v45 = 0;
  }
  *(_OWORD *)v39 = 0u;
  v40 = 0u;
  v41 = 1065353216;
  quasar::SystemConfig::readJsonFile((uint64_t)v46, (uint64_t)__p, v49 + 6, (uint64_t)v39, 1, a7);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v39);
  if (SHIBYTE(v45) < 0)
  {
    operator delete(__p[0]);
    if (v14)
      goto LABEL_7;
  }
  else if (v14)
  {
LABEL_7:
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "copy");
    language = v15->_language;
    v15->_language = (NSString *)v17;

    v14 = v16;
    goto LABEL_13;
  }
  SpeechModelInfo = (const quasar::SpeechModelInfo *)quasar::SystemConfig::getSpeechModelInfo((quasar::SystemConfig *)v46);
  quasar::SpeechModelInfo::SpeechModelInfo((std::string *)v39, SpeechModelInfo);
  if (v43 >= 0)
    v20 = &v42;
  else
    v20 = v42;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v15->_language;
  v15->_language = (NSString *)v21;

  quasar::SpeechModelInfo::~SpeechModelInfo((quasar::SpeechModelInfo *)v39);
  v14 = 0;
LABEL_13:
  v23 = (EARLogger *)objc_msgSend((id)objc_opt_class(), "supportedByQuasarSystemConfig:", v46);
  if ((v23 & 1) != 0)
  {
    if (v14)
    {
      objc_msgSend(v14, "ear_toString");
    }
    else
    {
      v39[0] = 0;
      v39[1] = 0;
      *(_QWORD *)&v40 = 0;
    }
    SpeechITN::createQuasarITN((quasar::QuasarTextProc *)v46, (const quasar::SystemConfig *)v39, __p);
    v33 = (SpeechITN *)__p[0];
    __p[0] = 0;
    value = v15->_itn.__ptr_.__value_;
    v15->_itn.__ptr_.__value_ = v33;
    if (value)
    {
      (*(void (**)(SpeechITN *))(*(_QWORD *)value + 8))(value);
      v35 = __p[0];
      __p[0] = 0;
      if (v35)
        (*(void (**)(void *))(*(_QWORD *)v35 + 8))(v35);
    }
    if (SBYTE7(v40) < 0)
    {
      operator delete(v39[0]);
      if (!a5)
      {
LABEL_29:
        quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v46);
        _Block_object_dispose(&v48, 8);
        v46[0] = (void **)v54;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v46);
LABEL_30:
        v32 = v15;
        goto LABEL_31;
      }
    }
    else if (!a5)
    {
      goto LABEL_29;
    }
    if ((os_variant_is_darwinos() & 1) == 0)
    {
      v36 = -[_EAREmojiRecognition initWithLanguage:]([_EAREmojiRecognition alloc], "initWithLanguage:", v15->_language);
      emojiFormatter = v15->_emojiFormatter;
      v15->_emojiFormatter = v36;

      -[_EARFormatter initializeItnMetrics](v15, "initializeItnMetrics");
    }
    goto LABEL_29;
  }
  EARLogger::QuasarOSLogger(v23);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[_EARFormatter initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);

  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v46);
  _Block_object_dispose(&v48, 8);
  v46[0] = (void **)v54;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v46);
  v32 = 0;
LABEL_31:

  return v32;
}

- (_EARFormatter)initWithQuasarConfig:(id)a3 language:(id)a4
{
  return -[_EARFormatter initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:](self, "initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:", a3, 0, 0, a4);
}

+ (BOOL)supportedByQuasarConfig:(id)a3
{
  id v3;
  char v4;
  void *__p[2];
  char v7;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v3, "fileSystemRepresentation"));
  v4 = SpeechITN::quasarItnExists((uint64_t)__p);
  if (v7 < 0)
    operator delete(__p[0]);

  return v4;
}

+ (BOOL)supportedByQuasarSystemConfig:(const void *)a3
{
  return SpeechITN::quasarItnExists((SpeechITN *)a3, (const quasar::SystemConfig *)a2);
}

- (BOOL)isEnableAutoPunctuation:(const void *)a3 task:(const void *)a4 itnEnablingFlags:(unsigned __int16)a5
{
  return (*(uint64_t (**)(SpeechITN *, const void *, const void *, _QWORD))(*(_QWORD *)self->_itn.__ptr_.__value_
                                                                                    + 24))(self->_itn.__ptr_.__value_, a3, a4, a5);
}

+ (BOOL)useEmojiHammerWhenRecognizeEmoji:(BOOL)a3
{
  if (a3)
    return !+[_EARFeatureFlags isEmojiV2Enabled](_EARFeatureFlags, "isEmojiV2Enabled");
  else
    return 0;
}

- (unordered_set<std::string,)endsOfSentencePunctuationsForLanguage:()std:(std:(_EARFormatter *)self :(SEL)a3 allocator<std:(const void *)a4 :string>> *__return_ptr)retstr :equal_to<std::string>
{
  return (unordered_set<std::string, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::string>> *)(*(_QWORD *(**)(unordered_set<std::string, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::string>> *__return_ptr))(*(_QWORD *)self->_itn.__ptr_.__value_ + 40))(retstr);
}

- (_EARFormatter)initWithGeneralVoc:(id)a3 withLexiconEnh:(id)a4 withItnEnh:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _EARFormatter *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_EARQuasarTokenizer extractModelRootFromNcsResourcePaths:lexiconEnh:tokenEnh:itnEnh:](_EARQuasarTokenizer, "extractModelRootFromNcsResourcePaths:lexiconEnh:tokenEnh:itnEnh:", v8, v9, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_EARFormatter initNcsWithModelRoot:](self, "initNcsWithModelRoot:", v11);

  return v12;
}

- (id)initNcsWithModelRoot:(id)a3
{
  id v4;
  _EARFormatter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  SpeechITN *value;
  uint64_t *v12;
  _EARFormatter *v13;
  void *__p[2];
  uint64_t v16;
  void *v17[2];
  uint64_t v18;
  void *v19[2];
  char v20;
  void *v21[2];
  uint64_t v22;
  uint64_t *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_EARFormatter;
  v5 = -[_EARFormatter init](&v24, sel_init);
  if (!v5 || (os_variant_is_darwinos() & 1) != 0)
    goto LABEL_23;
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ncs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("dispatch.voc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("lexicon.enh"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("itn_s.enh"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "ear_toString");
  }
  else
  {
    v21[0] = 0;
    v21[1] = 0;
    v22 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v19, "");
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
    if (v9)
    {
LABEL_8:
      objc_msgSend(v9, "ear_toString");
      goto LABEL_11;
    }
  }
  else
  {
    v17[0] = 0;
    v17[1] = 0;
    v18 = 0;
    if (v9)
      goto LABEL_8;
  }
  __p[0] = 0;
  __p[1] = 0;
  v16 = 0;
LABEL_11:
  SpeechITN::createSdapiITN((uint64_t)v21, (uint64_t)v19, (uint64_t)v17, (uint64_t)__p, &v23);
  v10 = v23;
  v23 = 0;
  value = v5->_itn.__ptr_.__value_;
  v5->_itn.__ptr_.__value_ = (SpeechITN *)v10;
  if (value)
  {
    (*(void (**)(SpeechITN *))(*(_QWORD *)value + 8))(value);
    v12 = v23;
    v23 = 0;
    if (v12)
      (*(void (**)(uint64_t *))(*v12 + 8))(v12);
  }
  if (SHIBYTE(v16) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v18) < 0)
    operator delete(v17[0]);
  if (v20 < 0)
    operator delete(v19[0]);
  if (SHIBYTE(v22) < 0)
    operator delete(v21[0]);

LABEL_23:
  v13 = v5;

  return v13;
}

- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3
{
  return -[_EARFormatter formatWords:unrepairedWordsOut:task:](self, "formatWords:unrepairedWordsOut:task:", a4, a5, &stru_1E5D49530);
}

- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3 task:(const void *)a4
{
  id v10;
  __CFString *language;
  __CFString *v12;
  SpeechITN *value;
  vector<quasar::Token, std::allocator<quasar::Token>> *result;
  void *v15[3];
  void *__p;
  char v17;
  void *v18[2];
  uint64_t v19;
  void **v20;

  v10 = a6;
  language = (__CFString *)self->_language;
  if (!language)
    language = &stru_1E5D49530;
  v12 = language;
  value = self->_itn.__ptr_.__value_;
  if (value)
  {
    if (v10)
    {
      objc_msgSend(v10, "ear_toString");
    }
    else
    {
      v18[0] = 0;
      v18[1] = 0;
      v19 = 0;
    }
    -[__CFString ear_toString](v12, "ear_toString");
    memset(v15, 0, sizeof(v15));
    (*(void (**)(SpeechITN *, const void *, void *, void **, void **, void **, uint64_t, _QWORD))(*(_QWORD *)value + 16))(value, a4, a5, v18, &__p, v15, 0xFFFFLL, 0);
    v20 = v15;
    std::vector<quasar::ItnOverride>::__destroy_vector::operator()[abi:ne180100](&v20);
    if (v17 < 0)
      operator delete(__p);
    if (SHIBYTE(v19) < 0)
      operator delete(v18[0]);
  }
  else
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
  }

  return result;
}

- (vector<quasar::Token,)formatWords:(_EARFormatter *)self unrepairedWordsOut:(SEL)a3 task:(const void *)a4 language:(void *)a5 preItnLeftContext:(id)a6 separateAutoEndPunctuation:(id)a7 partialResults:(const void *)a8 timestampOffset:(BOOL)a9 zeroTimestamp:(void *)a10 continuousListeningConfig:(unsigned int)a11 postItnLeftContext:(BOOL)a12 itnResult:(shared_ptr<quasar:(const void *)a14 :(void *)a15 ContinuousListeningConfig>)a13 itnOverrides:(const void *)a16 itnEnablingFlags:(unsigned __int16)a17 recognizeEmoji:(BOOL)a18 leftContextProvidedByClient:(BOOL)a19 preItnRightContext:(const void *)a20 emojiTokenIndices:(void *)a21 persistEmoji:(BOOL)a22 shouldHideTrailingPunctuation:(BOOL)a23 isTrailingPunctuationHidden:(shared_ptr<BOOL>)a24 isFinal:(BOOL)a25 choiceIdx:(int)a26 itnCompletion:(id)a27
{
  __shared_weak_count *var1;
  char v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  uint64_t *v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  _QWORD *v48;
  unsigned __int8 v49;
  uint64_t v50;
  char v51;
  _QWORD *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  int var0_high;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  _EARFormatter *v67;
  void *v68;
  char v69;
  Token *begin;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  __int128 v74;
  SpeechITN *value;
  void *v76;
  std::string *v77;
  std::string::size_type v78;
  void *v79;
  void *v80;
  uint64_t v81;
  int v82;
  _BOOL4 v85;
  NSMutableDictionary *emojiMetrics;
  void *v87;
  vector<quasar::Token, std::allocator<quasar::Token>> *result;
  id obj;
  void *v90;
  id v91;
  __shared_weak_count *v92;
  void *__p;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96[3];
  std::string v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  uint64_t v100;
  std::__shared_weak_count *v101;
  id v102;
  char v103;
  id v104;
  _EARFormatter *v105;
  void **p_p;
  void *v107;
  _QWORD v108[2];
  _BYTE v109[24];
  _BYTE *v110;
  uint64_t v111;

  var1 = a24.var1;
  v35 = BYTE2(a16);
  v111 = *MEMORY[0x1E0C80C00];
  v105 = self;
  v104 = a6;
  v103 = v35;
  v91 = a7;
  v92 = var1;
  objc_msgSend(v91, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v36;
  if (!self->_itn.__ptr_.__value_)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    goto LABEL_82;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "systemUptime");
  v39 = v38;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_continuous_time());
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (uint64_t *)a22;
  v41 = (std::__shared_weak_count *)*((_QWORD *)a13.var0 + 1);
  v100 = *(_QWORD *)a13.var0;
  v101 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v43 = __ldxr(p_shared_owners);
    while (__stxr(v43 + 1, p_shared_owners));
  }
  v45 = *v40;
  v44 = (std::__shared_weak_count *)v40[1];
  v98 = v45;
  v99 = v44;
  if (v44)
  {
    v46 = (unint64_t *)&v44->__shared_owners_;
    do
      v47 = __ldxr(v46);
    while (__stxr(v47 + 1, v46));
  }
  v48 = operator new(0x40uLL);
  v49 = BYTE1(a21);
  v50 = a17;
  v51 = BYTE3(a16);
  *v48 = &off_1E5D3D250;
  v48[1] = &v105;
  v48[2] = a5;
  v48[3] = &v104;
  v48[4] = &v102;
  v48[5] = a15;
  v48[6] = &a16;
  v48[7] = &v103;
  v110 = v48;
  quasar::formatWords((std::string *)a4, (std::string *)a8, a9, (std::string *)a10, a11, a12, &v100, a13.var1, (std::string *)retstr, v51, (std::string *)a14, v50, v49, (uint64_t)&v98, (uint64_t)v109);
  v52 = v110;
  if (v110 == v109)
  {
    v53 = 4;
    v52 = v109;
  }
  else
  {
    if (!v110)
      goto LABEL_14;
    v53 = 5;
  }
  (*(void (**)(void))(*v52 + 8 * v53))();
LABEL_14:
  v54 = v99;
  if (v99)
  {
    v55 = (unint64_t *)&v99->__shared_owners_;
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }
  v57 = v101;
  if (v101)
  {
    v58 = (unint64_t *)&v101->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  var0_high = HIDWORD(a24.var0);
  v61 = a21;
  if (v103 && v105->_emojiFormatter)
    -[_EARFormatter recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:](v105, "recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:", retstr, a20, a21, HIDWORD(a24.var0));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_continuous_time());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v90;
  v108[1] = v62;
  v63 = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!var0_high)
  {
    if (v61)
    {
      objc_storeStrong((id *)&v105->_firstCandidateItnIntervalInTicks, obj);
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "systemUptime");
      v66 = v65;

      v67 = v105;
      v105->_firstCandidateItnDurationSum = v66 - v39 + v105->_firstCandidateItnDurationSum;
      ++v67->_firstCandidateItnCount;
      -[NSMutableDictionary valueForKey:](v67->_emojiMetrics, "valueForKey:", CFSTR("isEmojiExpectedButNotRecognized"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "BOOLValue");

      if ((v69 & 1) == 0)
      {
        begin = retstr->__begin_;
        if (retstr->__end_ != retstr->__begin_)
        {
          v71 = 0;
          v72 = 0;
          while (1)
          {
            v73 = &begin->tokenName.__r_.__value_.var0.var0.__data_[v71];
            if (v73[23] < 0)
            {
              std::string::__init_copy_ctor_external(&v97, *(const std::string::value_type **)v73, *((_QWORD *)v73 + 1));
            }
            else
            {
              v74 = *(_OWORD *)v73;
              v97.__r_.__value_.__r.__words[2] = *((_QWORD *)v73 + 2);
              *(_OWORD *)&v97.__r_.__value_.__l.__data_ = v74;
            }
            value = v105->_itn.__ptr_.__value_;
            v76 = (void *)objc_opt_class();
            v77 = (v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? &v97
                : (std::string *)v97.__r_.__value_.__r.__words[0];
            v78 = (v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? HIBYTE(v97.__r_.__value_.__r.__words[2])
                : v97.__r_.__value_.__l.__size_;
            objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v77, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = v79;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (v76)
            {
              objc_msgSend(v76, "convertStringsToQuasarTokens:offset:", v80, 0);
            }
            else
            {
              __p = 0;
              v94 = 0;
              v95 = 0;
            }
            (*(void (**)(uint64_t *__return_ptr, SpeechITN *, void **))(*(_QWORD *)value + 32))(v96, value, &__p);
            p_p = &__p;
            std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&p_p);

            v62 = v63;
            v81 = v96[0];
            if (v96[0] != v96[1])
              break;
            v82 = 4;
LABEL_71:
            __p = v96;
            std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
            if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v97.__r_.__value_.__l.__data_);
            if ((v82 | 4) == 4)
            {
              ++v72;
              begin = retstr->__begin_;
              v71 += 224;
              if (0x6DB6DB6DB6DB6DB7 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) > v72)
                continue;
            }
            goto LABEL_75;
          }
          std::string::basic_string[abi:ne180100]<0>(&__p, " ");
          quasar::eraseAll(v81, (uint64_t)&__p);
          if (SHIBYTE(v95) < 0)
            operator delete(__p);
          if (*(char *)(v96[0] + 23) < 0)
          {
            if (!*(_QWORD *)(v96[0] + 8))
            {
LABEL_68:
              emojiMetrics = v105->_emojiMetrics;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setValue:forKey:](emojiMetrics, "setValue:forKey:", v87, CFSTR("isEmojiExpectedButNotRecognized"));

              v82 = 2;
              goto LABEL_71;
            }
          }
          else if (!*(_BYTE *)(v96[0] + 23))
          {
            goto LABEL_68;
          }
          quasar::toLower(v96[0], (uint64_t)&__p);
          if (SHIBYTE(v95) < 0)
          {
            if (v94 != 5)
            {
              operator delete(__p);
LABEL_70:
              v82 = 0;
              goto LABEL_71;
            }
            v85 = *(_DWORD *)__p != 1785687397 || *((_BYTE *)__p + 4) != 105;
            operator delete(__p);
            if (v85)
              goto LABEL_70;
          }
          else
          {
            if (SHIBYTE(v95) != 5)
              goto LABEL_70;
            if ((_DWORD)__p != 1785687397 || BYTE4(__p) != 105)
              goto LABEL_70;
          }
          goto LABEL_68;
        }
      }
    }
  }
LABEL_75:
  if (!var0_high && LOBYTE(a24.var0) && v92)
  {
    -[_EARFormatter setItnMetricsWithCompletion:](v105, "setItnMetricsWithCompletion:", v92);
  }
  else if (v92)
  {
    (*((void (**)(__shared_weak_count *, _QWORD, _QWORD, id))v92 + 2))(v92, 0, 0, obj);
  }

  v36 = v102;
LABEL_82:

  return result;
}

- (void)setItnMetricsWithCompletion:(id)a3
{
  NSMutableDictionary *emojiMetrics;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void (**v10)(id, NSMutableDictionary *, NSMutableArray *, NSArray *);

  v10 = (void (**)(id, NSMutableDictionary *, NSMutableArray *, NSArray *))a3;
  emojiMetrics = self->_emojiMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstCandidateItnDurationSum / (double)self->_firstCandidateItnCount * 1000000000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](emojiMetrics, "setValue:forKey:", v5, CFSTR("itnDurationInNs"));

  v6 = self->_emojiMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_EAREmojiRecognition isEmojiDisambiguationUsed](self->_emojiFormatter, "isEmojiDisambiguationUsed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](v6, "setValue:forKey:", v7, CFSTR("isEmojiDisambiguationUsed"));

  v8 = self->_emojiMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_EAREmojiRecognition isEmojiPersonalizationUsed](self->_emojiFormatter, "isEmojiPersonalizationUsed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](v8, "setValue:forKey:", v9, CFSTR("isEmojiPersonalizationUsed"));

  if (v10)
    v10[2](v10, self->_emojiMetrics, self->_recognizedEmojis, self->_firstCandidateItnIntervalInTicks);
  -[_EARFormatter initializeItnMetrics](self, "initializeItnMetrics");

}

- (vector<std::string,)emojiAlternativesForEmojis:(_EARFormatter *)self
{
  id v5;
  unint64_t i;
  void *v7;
  void *v8;
  char *end;
  char *value;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::string *v15;
  std::string *v16;
  void *v17;
  vector<std::string, std::allocator<std::string>> *result;
  void *__p[2];
  std::string::size_type v20;
  std::__split_buffer<std::string> __v;

  v5 = a4;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  for (i = 1; i != 4; ++i)
  {
    if (i >= objc_msgSend(v5, "count", __p[0]))
      break;
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "ear_toString");
    }
    else
    {
      *(_OWORD *)__p = 0uLL;
      v20 = 0;
    }
    end = (char *)retstr->__end_;
    value = (char *)retstr->__end_cap_.__value_;
    if (end >= value)
    {
      v11 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)retstr->__begin_) >> 3);
      v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v13 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)retstr->__begin_) >> 3);
      if (2 * v13 > v12)
        v12 = 2 * v13;
      v14 = v13 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v12;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->__end_cap_;
      v15 = v14
          ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&retstr->__end_cap_, v14): 0;
      v16 = v15 + v11;
      __v.__first_ = v15;
      __v.__begin_ = v16;
      __v.__end_cap_.__value_ = &v15[v14];
      v16->__r_.__value_.__r.__words[2] = v20;
      *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      v20 = 0;
      *(_OWORD *)__p = 0uLL;
      __v.__end_ = v16 + 1;
      std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
      v17 = retstr->__end_;
      std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
      retstr->__end_ = v17;
    }
    else
    {
      *((_QWORD *)end + 2) = v20;
      *(_OWORD *)end = *(_OWORD *)__p;
      v20 = 0;
      *(_OWORD *)__p = 0uLL;
      retstr->__end_ = end + 24;
    }

  }
  return result;
}

- (void)recognizeEmojiForTokens:(void *)a3 emojiTokenIndices:(void *)a4 persistEmoji:(BOOL)a5 choiceIdx:(int)a6
{
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  EARLogger *v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  unsigned int v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  _EAREmojiRecognition *emojiFormatter;
  void *v41;
  void *v42;
  __int128 v43;
  _QWORD *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  std::string::size_type v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  _EAREmojiRecognition *v57;
  EARLogger *v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  std::string *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  const quasar::Token *v74;
  unint64_t v75;
  unint64_t v76;
  BOOL v77;
  uint64_t v78;
  std::string *v79;
  unint64_t v80;
  int v81;
  char v82;
  int v83;
  unint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  BOOL v87;
  char v88;
  int v89;
  NSObject *v90;
  std::string *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  _QWORD *v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  std::string::size_type v105;
  uint64_t v106;
  _EAREmojiRecognition *v107;
  void *v108;
  std::string *v109;
  std::string *v110;
  _BOOL4 v111;
  NSObject *v112;
  std::string *v113;
  std::string *v114;
  id v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  std::string *v119;
  unsigned int v120;
  const quasar::Token *v121;
  NSObject *v122;
  void *v123;
  std::string *v124;
  std::string::size_type size;
  void *v126;
  std::string::size_type v127;
  __int128 v128;
  _BOOL4 v129;
  _BOOL4 v130;
  int v131;
  void *v132;
  _BOOL4 log;
  os_log_t loga;
  NSObject *logb;
  void *v138;
  _BOOL4 v139;
  void *v140;
  std::string v141;
  __int128 v142;
  uint64_t v143;
  uint64_t v144;
  _BYTE v145[24];
  std::string *v146;
  __int128 v147;
  uint64_t v148;
  uint64_t v149;
  std::string *v150;
  unint64_t v151;
  _QWORD v152[5];
  BOOL v153;
  uint64_t v154;
  __int128 v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  void *__p;
  char *v160;
  char *v161;
  std::string v162;
  char *v163;
  char *v164;
  std::string buf;
  char *v166;
  char *v167;
  char v168;
  void *v169;
  char v170;
  uint64_t v171;
  void *v172;
  char v173;
  uint64_t v174;
  void *v175;
  char v176;
  void *v177;
  char v178;
  uint64_t v179;

  v7 = a5;
  v179 = *MEMORY[0x1E0C80C00];
  if (!+[_EARFeatureFlags isEmojiV2Enabled](_EARFeatureFlags, "isEmojiV2Enabled"))
  {
    v31 = *(_QWORD *)a3;
    if (*((_QWORD *)a3 + 1) == *(_QWORD *)a3)
      return;
    v32 = 0;
    if (a6)
      v33 = 0;
    else
      v33 = v7;
    v139 = v33;
    v34 = 1;
    while (1)
    {
      std::string::basic_string[abi:ne180100]<0>(&buf, "spokenemoji|");
      v35 = v31 + 224 * v32;
      v36 = quasar::startsWith((unsigned __int8 *)v35, (unsigned __int8 *)&buf);
      v37 = v36;
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(buf.__r_.__value_.__l.__data_);
        if (v37)
        {
LABEL_40:
          if (*(char *)(v35 + 23) < 0)
          {
            v39 = *(_QWORD *)v35;
            v38 = *(_QWORD *)(v35 + 8);
          }
          else
          {
            v38 = *(unsigned __int8 *)(v35 + 23);
            v39 = v31 + 224 * v32;
          }
          emojiFormatter = self->_emojiFormatter;
          objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v39, v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_EAREmojiRecognition formatEmojiStrings:](emojiFormatter, "formatEmojiStrings:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            objc_msgSend(v42, "ear_toString");
            if (*(char *)(v35 + 23) < 0)
              operator delete(*(void **)v35);
            v43 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
            *(_QWORD *)(v35 + 16) = *((_QWORD *)&buf.__r_.__value_.__l + 2);
            *(_OWORD *)v35 = v43;
            LODWORD(v162.__r_.__value_.__l.__data_) = v34 - 1;
            v147 = 0uLL;
            v146 = 0;
            LODWORD(v154) = v34 - 1;
            v156 = 0;
            v155 = 0uLL;
            v163 = 0;
            *(_OWORD *)&v162.__r_.__value_.__r.__words[1] = 0uLL;
            v44 = a4;
            v45 = *((_QWORD *)a4 + 1);
            v46 = *((_QWORD *)a4 + 2);
            if (v45 >= v46)
            {
              v48 = (uint64_t)(v45 - *(_QWORD *)a4) >> 5;
              v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 59)
                std::vector<int>::__throw_length_error[abi:ne180100]();
              v50 = v46 - *(_QWORD *)a4;
              if (v50 >> 4 > v49)
                v49 = v50 >> 4;
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFE0)
                v51 = 0x7FFFFFFFFFFFFFFLL;
              else
                v51 = v49;
              v167 = (char *)a4 + 16;
              v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)a4 + 16, v51);
              v53 = (std::string::size_type)&v52[32 * v48];
              buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v52;
              buf.__r_.__value_.__l.__size_ = v53;
              v166 = &v52[32 * v54];
              *(_DWORD *)v53 = v154;
              *(_QWORD *)(v53 + 16) = 0;
              *(_QWORD *)(v53 + 24) = 0;
              *(_QWORD *)(v53 + 8) = 0;
              *(_OWORD *)(v53 + 8) = v155;
              *(_QWORD *)(v53 + 24) = v156;
              v155 = 0uLL;
              v156 = 0;
              buf.__r_.__value_.__r.__words[2] = v53 + 32;
              v44 = a4;
              std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer((uint64_t *)a4, &buf);
              v47 = *((_QWORD *)a4 + 1);
              std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer((void **)&buf.__r_.__value_.__l.__data_);
            }
            else
            {
              *(_DWORD *)v45 = v34 - 1;
              *(_QWORD *)(v45 + 16) = 0;
              *(_QWORD *)(v45 + 24) = 0;
              *(_QWORD *)(v45 + 8) = 0;
              *(_OWORD *)(v45 + 8) = v155;
              *(_QWORD *)(v45 + 24) = v156;
              v155 = 0uLL;
              v156 = 0;
              v47 = v45 + 32;
            }
            v44[1] = v47;
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v155;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v162.__r_.__value_.__l.__size_;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v146;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            if (v139)
            {
              -[_EAREmojiRecognition didUseEmoji:replacementContext:](self->_emojiFormatter, "didUseEmoji:replacementContext:", v42, 0);
              -[_EAREmojiRecognition baseStringForEmojiString:](self->_emojiFormatter, "baseStringForEmojiString:", v42);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](self->_recognizedEmojis, "addObject:", v55);

            }
          }
          else
          {
            std::string::operator=((std::string *)(v31 + 224 * v32), (const std::string *)(v31 + 224 * v32 + 176));
          }

        }
      }
      else if (v36)
      {
        goto LABEL_40;
      }
      v32 = v34;
      v31 = *(_QWORD *)a3;
      v87 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5) > (unint64_t)v34++;
      if (!v87)
        return;
    }
  }
  v131 = a6;
  log = v7;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  __p = 0;
  v160 = 0;
  v161 = 0;
  v9 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = v9 + 224 * v10;
      if (*(char *)(v13 + 23) < 0)
      {
        v13 = *(_QWORD *)v13;
        v14 = *(_QWORD *)(v9 + 224 * v10 + 8);
      }
      else
      {
        v14 = *(unsigned __int8 *)(v13 + 23);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");
      objc_msgSend(v138, "appendString:", v15);
      v17 = objc_msgSend(v15, "length") + v11;
      if (*(_BYTE *)(*(_QWORD *)a3 + 224 * v10 + 44))
      {
        objc_msgSend(v138, "appendString:", CFSTR(" "));
        ++v17;
      }
      v18 = v160;
      if (v160 >= v161)
      {
        v20 = (char *)__p;
        v21 = (v160 - (_BYTE *)__p) >> 4;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 60)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v23 = v161 - (_BYTE *)__p;
        if ((v161 - (_BYTE *)__p) >> 3 > v22)
          v22 = v23 >> 3;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
          v24 = 0xFFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
        {
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,unsigned long>>>((uint64_t)&v161, v24);
          v20 = (char *)__p;
          v18 = v160;
        }
        else
        {
          v25 = 0;
        }
        v26 = &v25[16 * v21];
        *(_QWORD *)v26 = v11;
        *((_QWORD *)v26 + 1) = v16;
        v27 = v26;
        if (v18 != v20)
        {
          do
          {
            *((_OWORD *)v27 - 1) = *((_OWORD *)v18 - 1);
            v27 -= 16;
            v18 -= 16;
          }
          while (v18 != v20);
          v20 = (char *)__p;
        }
        v19 = v26 + 16;
        __p = v27;
        v160 = v26 + 16;
        v161 = &v25[16 * v24];
        if (v20)
          operator delete(v20);
      }
      else
      {
        *(_QWORD *)v160 = v11;
        *((_QWORD *)v18 + 1) = v16;
        v19 = v18 + 16;
      }
      v160 = v19;

      v9 = *(_QWORD *)a3;
      v11 = v17;
      v10 = ++v12;
    }
    while (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5) > (unint64_t)v12);
  }
  v28 = (EARLogger *)objc_msgSend(v138, "length");
  if (v28)
  {
    EARLogger::QuasarOSLogger(v28);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[_EARFormatter recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:].cold.2();

    if (-[_EAREmojiRecognition isLocaleRTL](self->_emojiFormatter, "isLocaleRTL"))
      v30 = objc_msgSend(v138, "characterAtIndex:", 0) == 8207;
    else
      v30 = 0;
    v154 = 0;
    *(_QWORD *)&v155 = &v154;
    *((_QWORD *)&v155 + 1) = 0x3032000000;
    v156 = __Block_byref_object_copy__37;
    v157 = __Block_byref_object_dispose__38;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v158 = (id)objc_claimAutoreleasedReturnValue();
    v57 = self->_emojiFormatter;
    v152[0] = MEMORY[0x1E0C809B0];
    v152[1] = 3221225472;
    v152[2] = __82___EARFormatter_recognizeEmojiForTokens_emojiTokenIndices_persistEmoji_choiceIdx___block_invoke;
    v152[3] = &unk_1E5D48C88;
    v153 = v30;
    v152[4] = &v154;
    -[_EAREmojiRecognition recognizeEmojisInInputString:enumerateUsingBlock:](v57, "recognizeEmojisInInputString:enumerateUsingBlock:", v138, v152);
    objc_msgSend(*(id *)(v155 + 40), "sortedArrayUsingComparator:", &__block_literal_global_3);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (EARLogger *)objc_msgSend(v140, "count");
    if (v58)
    {
      v129 = v30;
      v60 = 0;
      v61 = 0;
      v149 = 0;
      v150 = 0;
      v151 = 0;
      if (v131)
        v62 = 0;
      else
        v62 = log;
      v130 = v62;
      *(_QWORD *)&v59 = 138412802;
      v128 = v59;
      while (v60 < objc_msgSend(v140, "count", v128))
      {
        objc_msgSend(v140, "objectAtIndexedSubscript:", v60);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v140, "objectAtIndexedSubscript:", v60);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectAtIndexedSubscript:", 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        v67 = objc_msgSend(v66, "rangeValue");
        v69 = v68;
        v70 = (std::string *)objc_msgSend(v64, "count");
        if (v70
          && (v71 = *(_QWORD *)a3,
              v72 = *((_QWORD *)a3 + 1),
              0x6DB6DB6DB6DB6DB7 * ((v72 - *(_QWORD *)a3) >> 5) > (unint64_t)v61))
        {
          v73 = v61;
          while (1)
          {
            v74 = (const quasar::Token *)(v71 + 224 * v73);
            v75 = *((_QWORD *)__p + 2 * v73);
            if (v67 == v75)
            {
              v76 = *((_QWORD *)__p + 2 * v73 + 1);
              v77 = v69 >= v76;
              v78 = v69 - v76;
              if (v77)
                break;
            }
            if (v75 > v67)
              goto LABEL_82;
            v79 = v150;
            if ((unint64_t)v150 >= v151)
            {
              v70 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, v74);
            }
            else
            {
              quasar::Token::Token(v150, v74);
              v70 = (std::string *)((char *)v79 + 224);
            }
            v150 = v70;
            v73 = (v61 + 1);
            v71 = *(_QWORD *)a3;
            v72 = *((_QWORD *)a3 + 1);
            v61 = v73;
            if (0x6DB6DB6DB6DB6DB7 * ((v72 - *(_QWORD *)a3) >> 5) <= v73)
              goto LABEL_83;
          }
          v80 = v71 + 224 * v73;
          v81 = *(_DWORD *)(v80 + 28);
          v82 = *(_BYTE *)(v80 + 45);
          if (v78 < 1)
          {
            v83 = 0;
LABEL_98:
            v88 = v82;
            v89 = v81;
            LODWORD(v61) = v83 + v61;
            quasar::Token::Token(&buf, (const quasar::Token *)(v71 + 224 * v61));
            HIDWORD(v166) = v89;
            v168 = v88;
            objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            -[_EAREmojiRecognition formatEmojiStrings:](self->_emojiFormatter, "formatEmojiStrings:");
            v90 = objc_claimAutoreleasedReturnValue();
            loga = v90;
            if (v90)
              -[NSObject ear_toString](v90, "ear_toString");
            else
              memset(&v162, 0, sizeof(v162));
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
            buf = v162;
            v92 = v149;
            v91 = v150;
            -[_EARFormatter emojiAlternativesForEmojis:](self, "emojiAlternativesForEmojis:", v64);
            v93 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v91 - v92) >> 5);
            v144 = v93;
            v94 = v143;
            v95 = v142;
            v143 = 0;
            v142 = 0uLL;
            LODWORD(v146) = -1227133513 * (((uint64_t)v91 - v92) >> 5);
            v147 = v95;
            v148 = v94;
            memset(v145, 0, sizeof(v145));
            v96 = a4;
            v97 = *((_QWORD *)a4 + 1);
            v98 = *((_QWORD *)a4 + 2);
            if (v97 >= v98)
            {
              v100 = (uint64_t)(v97 - *(_QWORD *)a4) >> 5;
              v101 = v100 + 1;
              if ((unint64_t)(v100 + 1) >> 59)
                std::vector<int>::__throw_length_error[abi:ne180100]();
              v102 = v98 - *(_QWORD *)a4;
              if (v102 >> 4 > v101)
                v101 = v102 >> 4;
              if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFE0)
                v103 = 0x7FFFFFFFFFFFFFFLL;
              else
                v103 = v101;
              v164 = (char *)a4 + 16;
              v104 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)a4 + 16, v103);
              v105 = (std::string::size_type)&v104[32 * v100];
              v162.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
              v162.__r_.__value_.__l.__size_ = v105;
              v163 = &v104[32 * v106];
              *(_DWORD *)v105 = (_DWORD)v146;
              *(_QWORD *)(v105 + 16) = 0;
              *(_QWORD *)(v105 + 24) = 0;
              *(_QWORD *)(v105 + 8) = 0;
              *(_OWORD *)(v105 + 8) = v147;
              *(_QWORD *)(v105 + 24) = v148;
              v147 = 0uLL;
              v148 = 0;
              v162.__r_.__value_.__r.__words[2] = v105 + 32;
              v96 = a4;
              std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer((uint64_t *)a4, &v162);
              v99 = *((_QWORD *)a4 + 1);
              std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer((void **)&v162.__r_.__value_.__l.__data_);
            }
            else
            {
              *(_DWORD *)v97 = v93;
              *(_QWORD *)(v97 + 16) = 0;
              *(_QWORD *)(v97 + 24) = 0;
              *(_QWORD *)(v97 + 8) = 0;
              *(_OWORD *)(v97 + 8) = v147;
              *(_QWORD *)(v97 + 24) = v148;
              v147 = 0uLL;
              v148 = 0;
              v99 = v97 + 32;
            }
            v96[1] = v99;
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v147;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)v145;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v142;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            if (v130)
            {
              v107 = self->_emojiFormatter;
              objc_msgSend(v138, "substringWithRange:", v67, v69);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              -[_EAREmojiRecognition didUseEmoji:replacementContext:](v107, "didUseEmoji:replacementContext:", loga, v108);

              -[NSMutableArray addObject:](self->_recognizedEmojis, "addObject:", v132);
            }
            v109 = v150;
            if ((unint64_t)v150 >= v151)
            {
              v110 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, (const quasar::Token *)&buf);
            }
            else
            {
              quasar::Token::Token(v150, (const quasar::Token *)&buf);
              v110 = (std::string *)((char *)v109 + 224);
            }
            v150 = v110;

            if (v178 < 0)
              operator delete(v177);
            if (v176 < 0)
              operator delete(v175);
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v174;
            std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            if (v173 < 0)
              operator delete(v172);
            v162.__r_.__value_.__r.__words[0] = (std::string::size_type)&v171;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v162);
            if (v170 < 0)
              operator delete(v169);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
          }
          else
          {
            v83 = 0;
            v84 = 0x6DB6DB6DB6DB6DB7 * ((v72 - v71) >> 5);
            while (1)
            {
              v85 = (_DWORD)v61 + v83 == -1 ? 0 : *(unsigned __int8 *)(v71 + 224 * (v61 + v83) + 44);
              v86 = (char *)__p + 16 * (v61 + v83 + 1);
              v78 = v78 - v85 - v86[1];
              if (v78 < 0)
                break;
              if (v78)
                v87 = v84 > (v61 + v83 + 2);
              else
                v87 = 1;
              if (!v87)
                goto LABEL_130;
              ++v83;
              if (!v78)
                goto LABEL_98;
            }
            EARLogger::QuasarOSLogger((EARLogger *)v70);
            logb = objc_claimAutoreleasedReturnValue();
            v111 = os_log_type_enabled(logb, OS_LOG_TYPE_DEBUG);
            v112 = logb;
            if (v111)
            {
              objc_msgSend(v138, "substringWithRange:", v67, v69);
              v115 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "substringWithRange:", *v86, v86[1]);
              v116 = (char *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf.__r_.__value_.__l.__data_) = v128;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v138;
              WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v115;
              HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
              v166 = v116;
              _os_log_debug_impl(&dword_1AD756000, logb, OS_LOG_TYPE_DEBUG, "Emoji match failed: inputString:\"%@\" recognizedEmoji:\"%@\" currToken:\"%@\", (uint8_t *)&buf, 0x20u);

              v112 = logb;
            }

LABEL_130:
            v113 = v150;
            if ((unint64_t)v150 >= v151)
            {
              v114 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, v74);
            }
            else
            {
              quasar::Token::Token(v150, v74);
              v114 = (std::string *)((char *)v113 + 224);
            }
            v150 = v114;
          }
          v73 = (v61 + 1);
        }
        else
        {
LABEL_82:
          v73 = v61;
        }
LABEL_83:

        ++v60;
        v61 = v73;
      }
      v117 = *(_QWORD *)a3;
      if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5) > (unint64_t)v61)
      {
        v118 = v61;
        v119 = v150;
        v120 = v61 + 1;
        do
        {
          v121 = (const quasar::Token *)(v117 + 224 * v118);
          if ((unint64_t)v119 >= v151)
          {
            v119 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>(&v149, v121);
          }
          else
          {
            quasar::Token::Token(v119, v121);
            v119 = (std::string *)((char *)v119 + 224);
          }
          v150 = v119;
          v118 = v120;
          v117 = *(_QWORD *)a3;
          v87 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5) > (unint64_t)v120++;
        }
        while (v87);
      }
      if (&v149 != a3)
        std::vector<quasar::Token>::__assign_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>((uint64_t)a3, v149, (uint64_t)v150, 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v150 - v149) >> 5));
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v149;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      v30 = v129;
    }
    EARLogger::QuasarOSLogger(v58);
    v122 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
    {
      v123 = (void *)MEMORY[0x1E0CB3940];
      memset(&v141, 0, sizeof(v141));
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v141, *(_QWORD *)a3, *((_QWORD *)a3 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5));
      EARHelpers::QuasarTokensToStdString(&v141, &v162);
      if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v124 = &v162;
      else
        v124 = (std::string *)v162.__r_.__value_.__r.__words[0];
      if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v162.__r_.__value_.__r.__words[2]);
      else
        size = v162.__r_.__value_.__l.__size_;
      objc_msgSend(v123, "ear_stringWithStringView:", v124, size);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend(v140, "count");
      LODWORD(buf.__r_.__value_.__l.__data_) = 138412802;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v126;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v127;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 1024;
      LODWORD(v166) = v30;
      _os_log_debug_impl(&dword_1AD756000, v122, OS_LOG_TYPE_DEBUG, "Emoji Output: %@ NumOfRecognizedEmojis:%lu isLocaleRTL:%d", (uint8_t *)&buf, 0x1Cu);
      if (SHIBYTE(v162.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v162.__r_.__value_.__l.__data_);
      v146 = &v141;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v146);

    }
    _Block_object_dispose(&v154, 8);

  }
  else
  {
    EARLogger::QuasarOSLogger(0);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      -[_EARFormatter recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:].cold.1(v56);

  }
  if (__p)
  {
    v160 = (char *)__p;
    operator delete(__p);
  }

}

- (vector<quasar::Token,)formattedTokensWithoutEmojiModifier:(_EARFormatter *)self emojiTokenIndices:(SEL)a3 recognizeEmoji:(const void *)a4
{
  vector<quasar::Token, std::allocator<quasar::Token>> *result;
  int *v11;
  int *v12;
  Token *begin;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  __int128 v21;
  uint64_t v22;

  if (a6 && self->_emojiFormatter)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    result = (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, *(_QWORD *)a4, *((_QWORD *)a4 + 1), 0x6DB6DB6DB6DB6DB7* ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5));
    v11 = *(int **)a5;
    v12 = (int *)*((_QWORD *)a5 + 1);
    if (*(int **)a5 != v12)
    {
      begin = retstr->__begin_;
      do
      {
        v14 = *v11;
        if (0x6DB6DB6DB6DB6DB7 * (((char *)retstr->__end_ - (char *)begin) >> 5) > v14)
        {
          v15 = *(_QWORD *)a4 + 224 * (int)v14;
          if (*(char *)(v15 + 23) < 0)
          {
            v15 = *(_QWORD *)v15;
            v16 = *(_QWORD *)(*(_QWORD *)a4 + 224 * (int)v14 + 8);
          }
          else
          {
            v16 = *(unsigned __int8 *)(v15 + 23);
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_EAREmojiRecognition baseStringForEmojiString:](self->_emojiFormatter, "baseStringForEmojiString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "ear_toString");
          }
          else
          {
            v21 = 0uLL;
            v22 = 0;
          }
          v20 = &retstr->__begin_->tokenName.__r_.__value_.var0.var0.__data_[224 * *v11];
          if (v20[23] < 0)
            operator delete(*(void **)v20);
          *((_QWORD *)v20 + 2) = v22;
          *(_OWORD *)v20 = v21;
          HIBYTE(v22) = 0;
          LOBYTE(v21) = 0;

          begin = retstr->__begin_;
        }
        v11 += 8;
      }
      while (v11 != v12);
    }
  }
  else
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    return (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, *(_QWORD *)a4, *((_QWORD *)a4 + 1), 0x6DB6DB6DB6DB6DB7* ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5));
  }
  return result;
}

- (void)appendNbestListWithEmojiAlternativesForFormattedTokens:(const void *)a3 formattedTokensWithoutEmojiModifier:(const void *)a4 formattedNBestList:(void *)a5 formattedNBestListWithoutEmojiModifier:(void *)a6 emojiTokenIndices:(const void *)a7 recognizeEmoji:(BOOL)a8
{
  _EARFormatter *v8;
  int *v9;
  const std::string *v14;
  const std::string *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  SpeechITN *value;
  void *v23;
  std::string *v24;
  std::string::size_type size;
  void *v26;
  void *v27;
  _EAREmojiRecognition *emojiFormatter;
  void *v29;
  void *p_p;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  char *v41;
  __int128 v42;
  void **v43;
  __int128 v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  int *v50;
  id obj;
  __int128 v52;
  void *v53;
  void **v54[3];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *__p;
  uint64_t v60;
  uint64_t v61;
  void **v62[3];
  std::string v63;
  _BYTE v64[128];
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  if (a8)
  {
    v8 = self;
    if (self->_emojiFormatter)
    {
      v9 = *(int **)a7;
      v50 = (int *)*((_QWORD *)a7 + 1);
      if (*(int **)a7 != v50)
      {
        do
        {
          if (+[_EARFeatureFlags isEmojiV2Enabled](_EARFeatureFlags, "isEmojiV2Enabled"))
          {
            v15 = (const std::string *)*((_QWORD *)v9 + 1);
            v14 = (const std::string *)*((_QWORD *)v9 + 2);
            while (v15 != v14)
            {
              memset(&v63, 0, sizeof(v63));
              std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v63, *(_QWORD *)a3, *((_QWORD *)a3 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5));
              memset(v62, 0, sizeof(v62));
              std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v62, *(_QWORD *)a4, *((_QWORD *)a4 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5));
              std::string::operator=((std::string *)(v63.__r_.__value_.__r.__words[0] + 224 * *v9), v15);
              std::string::operator=((std::string *)&v62[0][28 * *v9], v15);
              v16 = *((_QWORD *)a5 + 1);
              if (v16 >= *((_QWORD *)a5 + 2))
              {
                v17 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a5, (uint64_t *)&v63);
              }
              else
              {
                std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a5, (uint64_t *)&v63);
                v17 = v16 + 24;
              }
              *((_QWORD *)a5 + 1) = v17;
              v18 = *((_QWORD *)a6 + 1);
              if (v18 >= *((_QWORD *)a6 + 2))
              {
                v19 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a6, (uint64_t *)v62);
              }
              else
              {
                std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a6, (uint64_t *)v62);
                v19 = v18 + 24;
              }
              *((_QWORD *)a6 + 1) = v19;
              __p = v62;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
              v62[0] = (void **)&v63;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v62);
              ++v15;
            }
          }
          else
          {
            v20 = *(_QWORD *)a3 + 224 * *v9;
            if (*(char *)(v20 + 199) < 0)
            {
              std::string::__init_copy_ctor_external(&v63, *(const std::string::value_type **)(v20 + 176), *(_QWORD *)(v20 + 184));
            }
            else
            {
              v21 = *(_OWORD *)(v20 + 176);
              v63.__r_.__value_.__r.__words[2] = *(_QWORD *)(v20 + 192);
              *(_OWORD *)&v63.__r_.__value_.__l.__data_ = v21;
            }
            value = v8->_itn.__ptr_.__value_;
            v23 = (void *)objc_opt_class();
            if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v24 = &v63;
            else
              v24 = (std::string *)v63.__r_.__value_.__r.__words[0];
            if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(v63.__r_.__value_.__r.__words[2]);
            else
              size = v63.__r_.__value_.__l.__size_;
            objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v24, size);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v65[0] = v26;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v23, "convertStringsToQuasarTokens:offset:", v27, 0);
            }
            else
            {
              __p = 0;
              v60 = 0;
              v61 = 0;
            }
            (*(void (**)(void ***__return_ptr, SpeechITN *, void **))(*(_QWORD *)value + 32))(v62, value, &__p);
            v54[0] = &__p;
            std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v54);

            emojiFormatter = v8->_emojiFormatter;
            v29 = (void *)MEMORY[0x1E0CB3940];
            -[_EARFormatter getOrthography:](v8, "getOrthography:", v62);
            if (v61 >= 0)
              p_p = &__p;
            else
              p_p = __p;
            if (v61 >= 0)
              v31 = HIBYTE(v61);
            else
              v31 = v60;
            objc_msgSend(v29, "ear_stringWithStringView:", p_p, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = *(_QWORD *)a3 + 224 * *v9;
            if (*(char *)(v33 + 23) < 0)
            {
              v33 = *(_QWORD *)v33;
              v34 = *(_QWORD *)(*(_QWORD *)a3 + 224 * *v9 + 8);
            }
            else
            {
              v34 = *(unsigned __int8 *)(v33 + 23);
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[_EAREmojiRecognition searchEmojiAlternativesForSpokenEmoji:count:emojiCharacter:](emojiFormatter, "searchEmojiAlternativesForSpokenEmoji:count:emojiCharacter:", v32, 3, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (SHIBYTE(v61) < 0)
              operator delete(__p);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            obj = v36;
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
            if (v37)
            {
              v38 = *(_QWORD *)v56;
              do
              {
                for (i = 0; i != v37; ++i)
                {
                  if (*(_QWORD *)v56 != v38)
                    objc_enumerationMutation(obj);
                  v40 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                  __p = 0;
                  v60 = 0;
                  v61 = 0;
                  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&__p, *(_QWORD *)a3, *((_QWORD *)a3 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5));
                  memset(v54, 0, sizeof(v54));
                  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v54, *(_QWORD *)a4, *((_QWORD *)a4 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5));
                  if (v40)
                  {
                    objc_msgSend(v40, "ear_toString");
                  }
                  else
                  {
                    v52 = 0uLL;
                    v53 = 0;
                  }
                  v41 = (char *)__p + 224 * *v9;
                  if (v41[23] < 0)
                    operator delete(*(void **)v41);
                  v42 = v52;
                  *((_QWORD *)v41 + 2) = v53;
                  *(_OWORD *)v41 = v42;
                  if (v40)
                  {
                    objc_msgSend(v40, "ear_toString");
                  }
                  else
                  {
                    v52 = 0uLL;
                    v53 = 0;
                  }
                  v43 = &v54[0][28 * *v9];
                  if (*((char *)v43 + 23) < 0)
                    operator delete(*v43);
                  v44 = v52;
                  v43[2] = v53;
                  *(_OWORD *)v43 = v44;
                  v45 = *((_QWORD *)a5 + 1);
                  if (v45 >= *((_QWORD *)a5 + 2))
                  {
                    v46 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a5, (uint64_t *)&__p);
                  }
                  else
                  {
                    std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a5, (uint64_t *)&__p);
                    v46 = v45 + 24;
                  }
                  *((_QWORD *)a5 + 1) = v46;
                  v47 = *((_QWORD *)a6 + 1);
                  if (v47 >= *((_QWORD *)a6 + 2))
                  {
                    v48 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)a6, (uint64_t *)v54);
                  }
                  else
                  {
                    std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)a6, (uint64_t *)v54);
                    v48 = v47 + 24;
                  }
                  *((_QWORD *)a6 + 1) = v48;
                  *(_QWORD *)&v52 = v54;
                  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
                  v54[0] = &__p;
                  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v54);
                }
                v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
              }
              while (v37);
            }

            v8 = self;
            __p = v62;
            std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
            if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v63.__r_.__value_.__l.__data_);
          }
          v9 += 8;
        }
        while (v9 != v50);
      }
    }
  }
}

- (id)formatWords:(id)a3 task:(id)a4 autoPunctuate:(BOOL)a5
{
  -[_EARFormatter formatWords:task:autoPunctuate:recognizeEmoji:](self, "formatWords:task:autoPunctuate:recognizeEmoji:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)formatWords:(id)a3 task:(id)a4 autoPunctuate:(BOOL)a5 recognizeEmoji:(BOOL)a6
{
  id v8;
  __CFString *language;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  quasar::QsrText *v21;
  uint64_t v22;
  EARLogger *v23;
  unsigned __int16 v24;
  SpeechITN *value;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  const quasar::Token *j;
  const quasar::Token *v37;
  id v38;
  _BOOL4 v40;
  _BOOL4 v41;
  id v42;
  __CFString *v43;
  id obj;
  uint64_t v45;
  void *v46[2];
  char v47;
  const quasar::Token *v48;
  const quasar::Token *v49;
  _QWORD v50[3];
  void **v51[3];
  std::string v52[2];
  void *v53[2];
  _OWORD v54[2];
  void *v55[2];
  _OWORD v56[2];
  void *v57[2];
  __int128 v58;
  void *__p[2];
  _OWORD v60[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[3];
  _QWORD v66[3];
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v40 = a6;
  v41 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v42 = a4;
  v67 = 0;
  v68 = 0;
  v69 = 0;
  memset(v66, 0, sizeof(v66));
  memset(v65, 0, sizeof(v65));
  language = (__CFString *)self->_language;
  if (!language)
    language = &stru_1E5D49530;
  v43 = language;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v10)
  {
    v45 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v62 != v45)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (v12)
        {
          objc_msgSend(v12, "quasarToken");
        }
        else
        {
          memset(v60, 0, sizeof(v60));
          v58 = 0u;
          *(_OWORD *)__p = 0u;
          *(_OWORD *)v57 = 0u;
          *(_OWORD *)v55 = 0u;
          memset(v56, 0, sizeof(v56));
          memset(v54, 0, sizeof(v54));
          *(_OWORD *)v53 = 0u;
          memset(v52, 0, sizeof(v52));
        }
        v13 = v68;
        if (v68 >= v69)
        {
          v68 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v67, (__int128 *)v52);
          if (SBYTE7(v60[0]) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v14 = *(_OWORD *)&v52[0].__r_.__value_.__l.__data_;
          *(_QWORD *)(v68 + 16) = *((_QWORD *)&v52[0].__r_.__value_.__l + 2);
          *(_OWORD *)v13 = v14;
          memset(v52, 0, 24);
          v15 = *(std::string::size_type *)((char *)&v52[1].__r_.__value_.__r.__words[1] + 6);
          *(_OWORD *)(v13 + 24) = *(_OWORD *)&v52[1].__r_.__value_.__l.__data_;
          *(_QWORD *)(v13 + 38) = v15;
          v16 = *(_QWORD *)&v54[0];
          *(_OWORD *)(v13 + 48) = *(_OWORD *)v53;
          *(_QWORD *)(v13 + 64) = v16;
          *(_QWORD *)(v13 + 72) = 0;
          v53[1] = 0;
          *(_QWORD *)&v54[0] = 0;
          v53[0] = 0;
          *(_QWORD *)(v13 + 80) = 0;
          *(_QWORD *)(v13 + 88) = 0;
          *(_OWORD *)(v13 + 72) = *(_OWORD *)((char *)v54 + 8);
          *(_QWORD *)(v13 + 88) = *((_QWORD *)&v54[1] + 1);
          memset((char *)v54 + 8, 0, 24);
          v17 = *(_OWORD *)v55;
          *(_QWORD *)(v13 + 112) = *(_QWORD *)&v56[0];
          *(_QWORD *)(v13 + 120) = 0;
          *(_OWORD *)(v13 + 96) = v17;
          v55[1] = 0;
          *(_QWORD *)&v56[0] = 0;
          v55[0] = 0;
          *(_QWORD *)(v13 + 128) = 0;
          *(_QWORD *)(v13 + 136) = 0;
          *(_OWORD *)(v13 + 120) = *(_OWORD *)((char *)v56 + 8);
          *(_QWORD *)(v13 + 136) = *((_QWORD *)&v56[1] + 1);
          memset((char *)v56 + 8, 0, 24);
          v18 = *(_OWORD *)v57;
          *(_QWORD *)(v13 + 160) = v58;
          *(_OWORD *)(v13 + 144) = v18;
          v57[1] = 0;
          *(_QWORD *)&v58 = 0;
          v57[0] = 0;
          LODWORD(v16) = DWORD2(v58);
          *(_WORD *)(v13 + 172) = WORD6(v58);
          *(_DWORD *)(v13 + 168) = v16;
          v19 = *(_OWORD *)__p;
          *(_QWORD *)(v13 + 192) = *(_QWORD *)&v60[0];
          *(_OWORD *)(v13 + 176) = v19;
          __p[1] = 0;
          *(_QWORD *)&v60[0] = 0;
          __p[0] = 0;
          v20 = *(_OWORD *)((char *)v60 + 8);
          *(_DWORD *)(v13 + 216) = DWORD2(v60[1]);
          *(_OWORD *)(v13 + 200) = v20;
          v68 = v13 + 224;
        }
        if (SBYTE7(v58) < 0)
          operator delete(v57[0]);
        v51[0] = (void **)v56 + 1;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](v51);
        if (SBYTE7(v56[0]) < 0)
          operator delete(v55[0]);
        v51[0] = (void **)v54 + 1;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v51);
        if (SBYTE7(v54[0]) < 0)
          operator delete(v53[0]);
        if (SHIBYTE(v52[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(v52[0].__r_.__value_.__l.__data_);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v10);
  }

  memset(v51, 0, sizeof(v51));
  v22 = quasar::QsrText::SingletonInstance(v21);
  v23 = (EARLogger *)quasar::QsrText::hatToQsrTokens(v22, &v67, (uint64_t *)v51, 0);
  if (v41)
    v24 = -1;
  else
    v24 = -2;
  memset(v50, 0, sizeof(v50));
  value = self->_itn.__ptr_.__value_;
  if (value)
  {
    if (v42)
      objc_msgSend(v42, "ear_toString");
    else
      memset(v52, 0, 24);
    -[__CFString ear_toString](v43, "ear_toString");
    (*(void (**)(const quasar::Token **__return_ptr, SpeechITN *, void ***, _QWORD *, std::string *, void **, _QWORD *, _QWORD, BOOL))(*(_QWORD *)value + 16))(&v48, value, v51, v66, v52, v46, v65, v24, +[_EARFormatter useEmojiHammerWhenRecognizeEmoji:](_EARFormatter, "useEmojiHammerWhenRecognizeEmoji:", v40));
    if (v47 < 0)
      operator delete(v46[0]);
    if (SHIBYTE(v52[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v52[0].__r_.__value_.__l.__data_);
    -[_EARFormatter recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:](self, "recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:", &v48, v50, 0, 0);
    v35 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v34 = (id)objc_msgSend(v35, "initWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((v49 - v48) >> 5));
    v37 = v48;
    for (j = v49; v37 != j; v37 = (const quasar::Token *)((char *)v37 + 224))
    {
      quasar::Token::Token(v52, v37);
      v38 = -[_EARSpeechRecognitionToken _initWithQuasarToken:]([_EARSpeechRecognitionToken alloc], "_initWithQuasarToken:", v52);
      objc_msgSend(v34, "addObject:", v38);

      if (SBYTE7(v60[0]) < 0)
        operator delete(__p[0]);
      if (SBYTE7(v58) < 0)
        operator delete(v57[0]);
      v46[0] = (char *)v56 + 8;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v46);
      if (SBYTE7(v56[0]) < 0)
        operator delete(v55[0]);
      v46[0] = (char *)v54 + 8;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v46);
      if (SBYTE7(v54[0]) < 0)
        operator delete(v53[0]);
      if (SHIBYTE(v52[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(v52[0].__r_.__value_.__l.__data_);
    }
    v52[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v48;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);
  }
  else
  {
    EARLogger::QuasarOSLogger(v23);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[_EARFormatter formatWords:task:autoPunctuate:recognizeEmoji:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

    v34 = obj;
  }
  v52[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v50;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);
  v52[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v51;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);

  v52[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v65;
  std::vector<quasar::ItnOverride>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);
  v52[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v66;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);
  v52[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v67;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v52);

  return v34;
}

- (BOOL)refreshEmojiRecognizer
{
  _EAREmojiRecognition *emojiFormatter;
  NSObject *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  emojiFormatter = self->_emojiFormatter;
  if (emojiFormatter
    && (emojiFormatter = (_EAREmojiRecognition *)-[_EAREmojiRecognition isEmojiRecognitionCapable](emojiFormatter, "isEmojiRecognitionCapable"), (_DWORD)emojiFormatter))
  {
    -[_EAREmojiRecognition resetEmojiPreferences](self->_emojiFormatter, "resetEmojiPreferences");
    return 1;
  }
  else
  {
    EARLogger::QuasarOSLogger((EARLogger *)emojiFormatter);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_EARFormatter refreshEmojiRecognizer].cold.1((uint64_t)self->_emojiFormatter, -[_EAREmojiRecognition isEmojiRecognitionCapable](self->_emojiFormatter, "isEmojiRecognitionCapable"), v6, v5);

    return 0;
  }
}

- (void)initializeItnMetrics
{
  NSMutableArray *v3;
  NSMutableArray *recognizedEmojis;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *emojiMetrics;
  NSArray *v13;
  NSArray *firstCandidateItnIntervalInTicks;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  recognizedEmojis = self->_recognizedEmojis;
  self->_recognizedEmojis = v3;

  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v15[0] = CFSTR("itnDurationInNs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[1] = CFSTR("isEmojiPersonalizationUsed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v15[2] = CFSTR("isEmojiDisambiguationUsed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("isEmojiExpectedButNotRecognized");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSMutableDictionary *)objc_msgSend(v5, "initWithDictionary:", v10);
  emojiMetrics = self->_emojiMetrics;
  self->_emojiMetrics = v11;

  self->_firstCandidateItnDurationSum = 0.0;
  self->_firstCandidateItnCount = 0;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  firstCandidateItnIntervalInTicks = self->_firstCandidateItnIntervalInTicks;
  self->_firstCandidateItnIntervalInTicks = v13;

  -[_EAREmojiRecognition resetEmojiMetrics](self->_emojiFormatter, "resetEmojiMetrics");
}

- (basic_string<char,)getOrthography:(std::allocator<char>> *__return_ptr)retstr
{
  __int128 **v1;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  quasar::TextProc::GetOrthography(v1, 0, (std::string *)retstr);
  return result;
}

+ (vector<quasar::Token,)convertStringsToQuasarTokens:(id)a2
{
  return +[_EARFormatter convertStringsToQuasarTokens:offset:](_EARFormatter, "convertStringsToQuasarTokens:offset:", a4, 0);
}

+ (vector<quasar::Token,)convertStringsToQuasarTokens:(id)a2 offset:(SEL)a3
{
  id v7;
  uint64_t v8;
  uint64_t i;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  Token *end;
  Token *v14;
  vector<quasar::Token, std::allocator<quasar::Token>> *result;
  id obj;
  uint64_t v17;
  void *__p[2];
  char v19;
  __int128 *v20[3];
  void *v21[2];
  char v22;
  void *v23[2];
  char v24;
  __int128 v25;
  uint64_t v26;
  std::string v27[2];
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v8)
  {
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        v10 = a5;
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (v11)
        {
          objc_msgSend(v11, "ear_toString");
        }
        else
        {
          v25 = 0uLL;
          v26 = 0;
        }
        std::string::basic_string[abi:ne180100]<0>(v23, "");
        std::string::basic_string[abi:ne180100]<0>(v21, "");
        memset(v20, 0, sizeof(v20));
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        v12 = a5 + 999;
        quasar::Token::Token(v27, &v25, v10, v10 + 999, 0, 1, 0, (__int128 *)v23, 0.0, (__int128 *)v21, v20, 0, (__int128 *)__p, 0, 0);
        if (v19 < 0)
          operator delete(__p[0]);
        __p[0] = v20;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
        if (v22 < 0)
          operator delete(v21[0]);
        if (v24 < 0)
          operator delete(v23[0]);
        if (SHIBYTE(v26) < 0)
          operator delete((void *)v25);
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          v14 = (Token *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>((uint64_t *)retstr, (const quasar::Token *)v27);
        }
        else
        {
          quasar::Token::Token((std::string *)retstr->__end_, (const quasar::Token *)v27);
          v14 = (Token *)((char *)end + 224);
          retstr->__end_ = (Token *)((char *)end + 224);
        }
        retstr->__end_ = v14;
        if (v37 < 0)
          operator delete(v36);
        if (v35 < 0)
          operator delete(v34);
        v23[0] = &v33;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
        if (v32 < 0)
          operator delete(v31);
        v23[0] = &v30;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
        if (v29 < 0)
          operator delete(v28);
        if (SHIBYTE(v27[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(v27[0].__r_.__value_.__l.__data_);
        a5 = v12 + 1;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      a5 = v10 + 1000;
    }
    while (v8);
  }

  return result;
}

- (id)formattedStringWithStrings:(id)a3
{
  -[_EARFormatter formattedStringWithStrings:task:](self, "formattedStringWithStrings:task:", a3, &stru_1E5D49530);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)formattedStringWithStrings:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void **v9;
  void *v10;
  void *__p[2];
  char v13;
  void **v14[3];
  void **v15[3];
  _QWORD v16[3];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  if (v8)
    objc_msgSend(v8, "convertStringsToQuasarTokens:", v6);
  else
    memset(v16, 0, sizeof(v16));
  memset(v15, 0, sizeof(v15));
  -[_EARFormatter formatWords:unrepairedWordsOut:task:](self, "formatWords:unrepairedWordsOut:task:", v16, v15, v7);
  -[_EARFormatter getOrthography:](self, "getOrthography:", v14);
  if (v13 >= 0)
    v9 = __p;
  else
    v9 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 < 0)
    operator delete(__p[0]);
  __p[0] = v14;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v14[0] = (void **)v15;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v14);
  v15[0] = (void **)v16;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v15);

  return v10;
}

- (id)formattedStringWithStrings:(id)a3 preToPostItnArray:(id)a4
{
  -[_EARFormatter formattedStringWithStrings:preToPostItnArray:task:](self, "formattedStringWithStrings:preToPostItnArray:task:", a3, a4, &stru_1E5D49530);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)formattedStringWithStrings:(id)a3 preToPostItnArray:(id)a4 task:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int *v11;
  unsigned int *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unsigned int *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *p_p;
  void *v23;
  _EARFormatter *v25;
  void *v26;
  id v27;
  char **v28;
  std::__shared_weak_count *v29;
  void *__p;
  unsigned int *v31;
  uint64_t v32;
  std::string v33;
  void **v34[3];
  std::string v35;
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v8 = a4;
  v9 = a5;
  v26 = v9;
  v10 = (void *)objc_opt_class();
  if (v10)
    objc_msgSend(v10, "convertStringsToQuasarTokens:", v27);
  else
    memset(&v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  -[_EARFormatter formatWords:unrepairedWordsOut:task:](self, "formatWords:unrepairedWordsOut:task:", &v35, v34, v9);
  v25 = self;
  v28 = 0;
  v29 = 0;
  quasar::getPreItnTokenToPostItnCharAlignment(&v35, &v33, &v28, (uint64_t *)&__p);
  v12 = (unsigned int *)__p;
  v11 = v31;
  v31 = 0;
  v32 = 0;
  __p = 0;
  v13 = v29;
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v12 != v11)
  {
    v16 = v12;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v16, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16[1]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16[2]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v19;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16[3]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v21);
      v16 += 4;
    }
    while (v16 != v11);
  }
  -[_EARFormatter getOrthography:](v25, "getOrthography:", &v33, v25);
  if (v32 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v32) < 0)
    operator delete(__p);
  if (v12)
    operator delete(v12);
  __p = &v33;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v33.__r_.__value_.__r.__words[0] = (std::string::size_type)v34;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  v34[0] = (void **)&v35;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v34);

  return v23;
}

- (id)formattedRecognitionWithNBestList:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _EARSpeechRecognition *v18;
  void *v19;
  id v20;
  id obj;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28[2];
  _OWORD v29[2];
  void *v30[2];
  _OWORD v31[2];
  void *v32[2];
  _OWORD v33[2];
  void *v34[2];
  __int128 v35;
  void *__p[2];
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50[3];
  void **v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  memset(v50, 0, sizeof(v50));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v3)
  {
    v23 = *(_QWORD *)v47;
    do
    {
      v4 = 0;
      v25 = v3;
      do
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v4);
        v43 = 0;
        v44 = 0;
        v45 = 0;
        memset(v42, 0, sizeof(v42));
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v27 = v5;
        v6 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
        v26 = v4;
        if (v6)
        {
          v7 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v39 != v7)
                objc_enumerationMutation(v27);
              v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              if (v9)
              {
                objc_msgSend(v9, "quasarToken");
              }
              else
              {
                memset(v37, 0, sizeof(v37));
                v35 = 0u;
                *(_OWORD *)__p = 0u;
                *(_OWORD *)v34 = 0u;
                *(_OWORD *)v32 = 0u;
                memset(v33, 0, sizeof(v33));
                memset(v31, 0, sizeof(v31));
                *(_OWORD *)v30 = 0u;
                *(_OWORD *)v28 = 0u;
                memset(v29, 0, sizeof(v29));
              }
              v10 = v44;
              if (v44 >= v45)
              {
                v44 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v43, (__int128 *)v28);
                if (SBYTE7(v37[0]) < 0)
                  operator delete(__p[0]);
              }
              else
              {
                v11 = *(_OWORD *)v28;
                *(_QWORD *)(v44 + 16) = *(_QWORD *)&v29[0];
                *(_OWORD *)v10 = v11;
                v28[1] = 0;
                *(_QWORD *)&v29[0] = 0;
                v28[0] = 0;
                v12 = *(_QWORD *)((char *)&v29[1] + 6);
                *(_OWORD *)(v10 + 24) = *(_OWORD *)((char *)v29 + 8);
                *(_QWORD *)(v10 + 38) = v12;
                v13 = *(_QWORD *)&v31[0];
                *(_OWORD *)(v10 + 48) = *(_OWORD *)v30;
                *(_QWORD *)(v10 + 64) = v13;
                *(_QWORD *)(v10 + 72) = 0;
                v30[1] = 0;
                *(_QWORD *)&v31[0] = 0;
                v30[0] = 0;
                *(_QWORD *)(v10 + 80) = 0;
                *(_QWORD *)(v10 + 88) = 0;
                *(_OWORD *)(v10 + 72) = *(_OWORD *)((char *)v31 + 8);
                *(_QWORD *)(v10 + 88) = *((_QWORD *)&v31[1] + 1);
                memset((char *)v31 + 8, 0, 24);
                v14 = *(_OWORD *)v32;
                *(_QWORD *)(v10 + 112) = *(_QWORD *)&v33[0];
                *(_QWORD *)(v10 + 120) = 0;
                *(_OWORD *)(v10 + 96) = v14;
                v32[1] = 0;
                *(_QWORD *)&v33[0] = 0;
                v32[0] = 0;
                *(_QWORD *)(v10 + 128) = 0;
                *(_QWORD *)(v10 + 136) = 0;
                *(_OWORD *)(v10 + 120) = *(_OWORD *)((char *)v33 + 8);
                *(_QWORD *)(v10 + 136) = *((_QWORD *)&v33[1] + 1);
                memset((char *)v33 + 8, 0, 24);
                v15 = *(_OWORD *)v34;
                *(_QWORD *)(v10 + 160) = v35;
                *(_OWORD *)(v10 + 144) = v15;
                v34[1] = 0;
                *(_QWORD *)&v35 = 0;
                v34[0] = 0;
                LODWORD(v13) = DWORD2(v35);
                *(_WORD *)(v10 + 172) = WORD6(v35);
                *(_DWORD *)(v10 + 168) = v13;
                v16 = *(_OWORD *)__p;
                *(_QWORD *)(v10 + 192) = *(_QWORD *)&v37[0];
                *(_OWORD *)(v10 + 176) = v16;
                __p[1] = 0;
                *(_QWORD *)&v37[0] = 0;
                __p[0] = 0;
                v17 = *(_OWORD *)((char *)v37 + 8);
                *(_DWORD *)(v10 + 216) = DWORD2(v37[1]);
                *(_OWORD *)(v10 + 200) = v17;
                v44 = v10 + 224;
              }
              if (SBYTE7(v35) < 0)
                operator delete(v34[0]);
              v51 = (void **)v33 + 1;
              std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v51);
              if (SBYTE7(v33[0]) < 0)
                operator delete(v32[0]);
              v51 = (void **)v31 + 1;
              std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v51);
              if (SBYTE7(v31[0]) < 0)
                operator delete(v30[0]);
              if (SBYTE7(v29[0]) < 0)
                operator delete(v28[0]);
            }
            v6 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          }
          while (v6);
        }

        -[_EARFormatter formatWords:unrepairedWordsOut:](self, "formatWords:unrepairedWordsOut:", &v43, v42);
        std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v50, (uint64_t)v28);
        v51 = v28;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v51);
        v28[0] = v42;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);
        v28[0] = &v43;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);
        v4 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v3);
  }

  v18 = [_EARSpeechRecognition alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[_EARSpeechRecognition _initWithNBestList:useHatText:endsOfSentencePunctuations:](v18, "_initWithNBestList:useHatText:endsOfSentencePunctuations:", v50, 0, v19);

  v28[0] = v50;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);

  return v20;
}

- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5
{
  void *v5;
  __CFString *v6;

  -[_EARFormatter _formattedStringWithStrings:task:leftContext:recognizeEmoji:](self, "_formattedStringWithStrings:task:leftContext:recognizeEmoji:", a3, a4, a5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E5D49530;
  }

  return v6;
}

- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5 recognizeEmoji:(BOOL)a6
{
  -[_EARFormatter _formattedStringWithStrings:task:leftContext:recognizeEmoji:rightContext:](self, "_formattedStringWithStrings:task:leftContext:recognizeEmoji:rightContext:", a3, a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_formattedStringWithStrings:(id)a3 task:(id)a4 leftContext:(id)a5 recognizeEmoji:(BOOL)a6 rightContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void **v26;
  void **v27;
  void **v28;
  void **v29;
  void *v30;
  void **v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  void *__p[2];
  char v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  void *v43[2];
  uint64_t v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  void **v47;
  void **v48;
  void **v49[3];
  void **v50[3];
  void **v51[3];
  void **v52[3];
  void **v53[3];
  void **v54[3];
  void **v55[3];
  void **v56[3];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_opt_class();
  if (v16)
  {
    objc_msgSend(v16, "convertStringsToQuasarTokens:", v14);
    if (v57 == v58)
      v17 = 0;
    else
      v17 = (*(_DWORD *)(v58 - 192) + 3000);
  }
  else
  {
    v17 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
  }
  v18 = (void *)objc_opt_class();
  if (v18)
    objc_msgSend(v18, "convertStringsToQuasarTokens:", v15);
  else
    memset(v56, 0, sizeof(v56));
  v19 = (void *)objc_opt_class();
  if (v19)
    objc_msgSend(v19, "convertStringsToQuasarTokens:offset:", v12, v17);
  else
    memset(v55, 0, sizeof(v55));
  memset(v54, 0, sizeof(v54));
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, sizeof(v52));
  memset(v51, 0, sizeof(v51));
  memset(v50, 0, sizeof(v50));
  memset(v49, 0, sizeof(v49));
  v45 = 0;
  v46 = 0;
  v43[0] = 0;
  v43[1] = 0;
  v44 = 0;
  v41 = 0;
  v42 = 0;
  LOBYTE(v38) = 0;
  LOWORD(v37) = 0;
  BYTE3(v36) = objc_msgSend(v14, "count") != 0;
  BYTE2(v36) = a6;
  LOWORD(v36) = -1;
  BYTE4(v35) = 0;
  LODWORD(v35) = 0;
  -[_EARFormatter formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:](self, "formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:", v55, v54, v13, CFSTR("en-US"), &v57, 0, v52, v35, &v45, v43, v51, v50, v36, v56,
    v49,
    v37,
    &v41,
    v38,
    0);
  v20 = v42;
  if (v42)
  {
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  __p[0] = v43;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v23 = v46;
  if (v46)
  {
    v24 = (unint64_t *)&v46->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  -[_EARFormatter getOrthography:](self, "getOrthography:", &v47);
  v26 = v48;
  if (v47 != v48)
  {
    v27 = v47 + 22;
    while (*((char *)v27 + 23) < 0)
    {
      if (v27[1])
        goto LABEL_28;
LABEL_29:
      v28 = v27 + 6;
      v27 += 28;
      if (v28 == v26)
        goto LABEL_30;
    }
    if (!*((_BYTE *)v27 + 23))
      goto LABEL_29;
LABEL_28:
    std::string::operator=((std::string *)(v27 - 22), (const std::string *)v27);
    goto LABEL_29;
  }
LABEL_30:
  -[_EARFormatter getOrthography:](self, "getOrthography:", &v47);
  if (v44 >= 0)
    v29 = v43;
  else
    v29 = (void **)v43[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v30;
  if (v40 >= 0)
    v31 = __p;
  else
    v31 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v44) < 0)
    operator delete(v43[0]);
  v43[0] = &v47;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v43);
  v47 = (void **)v49;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100](&v47);
  v49[0] = (void **)v50;
  std::vector<quasar::ItnOverride>::__destroy_vector::operator()[abi:ne180100](v49);
  v50[0] = (void **)v51;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v50);
  v51[0] = (void **)v52;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v51);
  v52[0] = (void **)v53;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v52);
  v53[0] = (void **)v54;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v53);
  v54[0] = (void **)v55;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v54);
  v55[0] = (void **)v56;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v55);
  v56[0] = (void **)&v57;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](v56);

  return v33;
}

- (id)_formattedStringWithoutEmojiModifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t *v9;
  void *v10;
  _QWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  _EARFormatter *v21;
  void *p_p;
  void *v23;
  _EARFormatter *v25;
  _QWORD v26[3];
  unsigned int v27;
  _BYTE v28[24];
  void *__p;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38[6];

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v25 = self;
  if (v5)
  {
    objc_msgSend(v5, "convertStringsToQuasarTokens:offset:", v4, 0);
    v6 = v35;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    if (v36 != v35)
    {
      v7 = 0;
      v8 = 1;
      do
      {
        v9 = (uint64_t *)(v6 + 224 * v7);
        if (*((char *)v9 + 23) < 0)
          v9 = (uint64_t *)*v9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9, v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "_isSingleEmoji"))
        {
          v27 = v8 - 1;
          memset(v26, 0, sizeof(v26));
          LODWORD(__p) = v8 - 1;
          v31 = 0;
          v30 = 0uLL;
          memset(v28, 0, sizeof(v28));
          v11 = v33;
          if ((unint64_t)v33 >= v34)
          {
            v13 = ((uint64_t)v33 - v32) >> 5;
            v14 = v13 + 1;
            if ((unint64_t)(v13 + 1) >> 59)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v15 = v34 - v32;
            if ((uint64_t)(v34 - v32) >> 4 > v14)
              v14 = v15 >> 4;
            if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0)
              v16 = 0x7FFFFFFFFFFFFFFLL;
            else
              v16 = v14;
            v38[4] = &v34;
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)&v34, v16);
            v18 = &v17[32 * v13];
            v38[0] = v17;
            v38[1] = v18;
            v38[3] = &v17[32 * v19];
            *(_DWORD *)v18 = (_DWORD)__p;
            *((_QWORD *)v18 + 2) = 0;
            *((_QWORD *)v18 + 3) = 0;
            *((_QWORD *)v18 + 1) = 0;
            *(_OWORD *)(v18 + 8) = v30;
            *((_QWORD *)v18 + 3) = v31;
            v30 = 0uLL;
            v31 = 0;
            v38[2] = v18 + 32;
            std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer(&v32, v38);
            v12 = v33;
            std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer(v38);
          }
          else
          {
            *v33 = v8 - 1;
            v11[2] = 0;
            v11[3] = 0;
            v11[1] = 0;
            *(_OWORD *)(v11 + 1) = v30;
            v11[3] = v31;
            v30 = 0uLL;
            v31 = 0;
            v12 = v11 + 4;
          }
          v33 = v12;
          v38[0] = &v30;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
          v38[0] = v28;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
          v38[0] = v26;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
        }

        v7 = v8;
        v6 = v35;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((v36 - v35) >> 5) > (unint64_t)v8++);
    }
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
  }
  v21 = v25;
  -[_EARFormatter formattedTokensWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:](v25, "formattedTokensWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:", &v35, &v32, 1, v25);
  -[_EARFormatter getOrthography:](v21, "getOrthography:", v38);
  if (v30 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v30) < 0)
    operator delete(__p);
  __p = v38;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v38[0] = &v32;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
  v38[0] = &v35;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);

  return v23;
}

- (id)emojiPhraseRemoveKeyword:(id)a3
{
  id v4;
  SpeechITN *value;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  void *__p[2];
  uint64_t v13;
  _QWORD v14[3];
  void **v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  value = self->_itn.__ptr_.__value_;
  v6 = (void *)objc_opt_class();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "convertStringsToQuasarTokens:offset:", v7, 0);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v13 = 0;
  }
  (*(void (**)(_QWORD *__return_ptr, SpeechITN *, void **))(*(_QWORD *)value + 32))(v14, value, __p);
  v15 = __p;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v15);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[_EARFormatter getOrthography:](self, "getOrthography:", v14);
  if (v13 >= 0)
    v9 = __p;
  else
    v9 = (void **)__p[0];
  objc_msgSend(v8, "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v13) < 0)
    operator delete(__p[0]);
  __p[0] = v14;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v10;
}

- (id)emojiAlternativesForFormattedTokens:(id)a3 stringsWithoutEmojiModifier:(id)a4 alternateNameForTokens:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t *v14;
  void *v15;
  _QWORD *v16;
  _DWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  void *v31;
  void *v32;
  void *v33;
  void **i;
  void **v35;
  void **v36;
  void *v37;
  void **v38;
  void **v39;
  void **v40;
  void *v41;
  id v43;
  void *v44;
  id v45;
  void *__p[2];
  uint64_t v47;
  void ***v48;
  void ***v49;
  uint64_t v50;
  uint64_t v51;
  void **v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  _DWORD *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  char *v62;
  char *v63;
  unint64_t *v64;

  v8 = a3;
  v9 = a4;
  v45 = a5;
  v10 = (void *)objc_opt_class();
  v43 = v9;
  v44 = v8;
  if (v10)
  {
    objc_msgSend(v10, "convertStringsToQuasarTokens:offset:", v8, 0);
    v11 = v58;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    if (v59 != v58)
    {
      v12 = 0;
      v13 = 1;
      do
      {
        v14 = (uint64_t *)(v11 + 224 * v12);
        if (*((char *)v14 + 23) < 0)
          v14 = (uint64_t *)*v14;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14, v43);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "_isSingleEmoji"))
        {
          LODWORD(v48) = v13 - 1;
          __p[1] = 0;
          v47 = 0;
          __p[0] = 0;
          LODWORD(v52) = v13 - 1;
          v54 = 0;
          v53 = 0uLL;
          v50 = 0;
          v51 = 0;
          v49 = 0;
          v16 = v56;
          if ((unint64_t)v56 >= v57)
          {
            v18 = ((uint64_t)v56 - v55) >> 5;
            v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 59)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v20 = v57 - v55;
            if ((uint64_t)(v57 - v55) >> 4 > v19)
              v19 = v20 >> 4;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0)
              v21 = 0x7FFFFFFFFFFFFFFLL;
            else
              v21 = v19;
            v64 = &v57;
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<quasar::TextTokenizer::Token>>((uint64_t)&v57, v21);
            v23 = &v22[32 * v18];
            *(_QWORD *)&v61 = v22;
            *((_QWORD *)&v61 + 1) = v23;
            v63 = &v22[32 * v24];
            *(_DWORD *)v23 = (_DWORD)v52;
            *((_QWORD *)v23 + 2) = 0;
            *((_QWORD *)v23 + 3) = 0;
            *((_QWORD *)v23 + 1) = 0;
            *(_OWORD *)(v23 + 8) = v53;
            *((_QWORD *)v23 + 3) = v54;
            v53 = 0uLL;
            v54 = 0;
            v62 = v23 + 32;
            std::vector<std::pair<int,std::vector<std::string>>>::__swap_out_circular_buffer(&v55, &v61);
            v17 = v56;
            std::__split_buffer<std::pair<int,std::vector<std::string>>>::~__split_buffer((void **)&v61);
          }
          else
          {
            *v56 = v13 - 1;
            v16[2] = 0;
            v16[3] = 0;
            v16[1] = 0;
            *(_OWORD *)(v16 + 1) = v53;
            v16[3] = v54;
            v53 = 0uLL;
            v54 = 0;
            v17 = v16 + 4;
          }
          v56 = v17;
          *(_QWORD *)&v61 = &v53;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
          *(_QWORD *)&v61 = &v49;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
          *(_QWORD *)&v61 = __p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
        }
        objc_msgSend(v45, "objectAtIndexedSubscript:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "ear_toString");
        }
        else
        {
          v61 = 0uLL;
          v62 = 0;
        }
        v27 = v11 + 224 * v12;
        v28 = v27 + 176;
        if (*(char *)(v27 + 199) < 0)
          operator delete(*(void **)v28);
        v29 = v61;
        *(_QWORD *)(v28 + 16) = v62;
        *(_OWORD *)v28 = v29;
        HIBYTE(v62) = 0;
        LOBYTE(v61) = 0;

        v12 = v13;
        v11 = v58;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((v59 - v58) >> 5) > (unint64_t)v13++);
    }
  }
  else
  {
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
  }
  v31 = v43;
  v32 = (void *)objc_opt_class();
  if (v32)
  {
    objc_msgSend(v32, "convertStringsToQuasarTokens:offset:", v43, 0);
  }
  else
  {
    v61 = 0uLL;
    v62 = 0;
  }
  v52 = 0;
  v53 = 0uLL;
  v48 = 0;
  v49 = 0;
  v50 = 0;
  -[_EARFormatter appendNbestListWithEmojiAlternativesForFormattedTokens:formattedTokensWithoutEmojiModifier:formattedNBestList:formattedNBestListWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:](self, "appendNbestListWithEmojiAlternativesForFormattedTokens:formattedTokensWithoutEmojiModifier:formattedNBestList:formattedNBestListWithoutEmojiModifier:emojiTokenIndices:recognizeEmoji:", &v58, &v61, &v52, &v48, &v55, 1, v43);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v52;
  for (i = (void **)v53; v35 != i; v35 += 3)
  {
    -[_EARFormatter getOrthography:](self, "getOrthography:", v35);
    if (v47 >= 0)
      v36 = __p;
    else
      v36 = (void **)__p[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v37);

    if (SHIBYTE(v47) < 0)
      operator delete(__p[0]);
  }
  v39 = (void **)v48;
  v38 = (void **)v49;
  if (v48 != v49)
  {
    do
    {
      -[_EARFormatter getOrthography:](self, "getOrthography:", v39);
      if (v47 >= 0)
        v40 = __p;
      else
        v40 = (void **)__p[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v41);

      if (SHIBYTE(v47) < 0)
        operator delete(__p[0]);
      v39 += 3;
    }
    while (v39 != v38);
  }
  __p[0] = &v48;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v48 = &v52;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  v52 = (void **)&v61;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v52);
  *(_QWORD *)&v61 = &v55;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
  *(_QWORD *)&v61 = &v58;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);

  return v33;
}

- (id)recognizeEmojiInString:(id)a3 alternativesOut:(id)a4
{
  -[_EARFormatter _recognizeEmojiInString:alternativesOut:persistEmoji:](self, "_recognizeEmojiInString:alternativesOut:persistEmoji:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_recognizeEmojiInString:(id)a3 alternativesOut:(id)a4 persistEmoji:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void **v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  std::string *p_p;
  void *v17;
  std::string v19;
  std::string __p;
  void **v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::string *v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  if (v10)
  {
    objc_msgSend(v10, "convertStringsToQuasarTokens:offset:", v8, 0);
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  -[_EARFormatter recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:](self, "recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:", &v24, &v21, v5, 0);
  v11 = v21;
  if (v22 != v21)
  {
    v12 = 0;
    v13 = 1;
    do
    {
      EARHelpers::VectorToArray<std::string>((__int128 **)&v11[v13]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);

      ++v12;
      v11 = v21;
      v13 += 4;
    }
    while (v12 < ((char *)v22 - (char *)v21) >> 5);
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  memset(&v19, 0, sizeof(v19));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v19, v24, v25, 0x6DB6DB6DB6DB6DB7 * ((v25 - v24) >> 5));
  EARHelpers::QuasarTokensToStdString(&v19, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v15, "stringWithUTF8String:", p_p);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v27 = &v19;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v21;
  std::vector<std::pair<int,std::vector<std::string>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v21 = (void **)&v24;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v21);

  return v17;
}

- (id)_earEmojiRecognition
{
  return self->_emojiFormatter;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  SpeechITN *value;

  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_emojiMetrics, 0);
  objc_storeStrong((id *)&self->_recognizedEmojis, 0);
  objc_storeStrong((id *)&self->_firstCandidateItnIntervalInTicks, 0);
  objc_storeStrong((id *)&self->_emojiFormatter, 0);
  value = self->_itn.__ptr_.__value_;
  self->_itn.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(SpeechITN *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:
{
}

- (__n128)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_1E5D3D250;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  v4 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)formatWords:unrepairedWordsOut:task:language:preItnLeftContext:separateAutoEndPunctuation:partialResults:timestampOffset:zeroTimestamp:continuousListeningConfig:postItnLeftContext:itnResult:itnOverrides:itnEnablingFlags:recognizeEmoji:leftContextProvidedByClient:preItnRightContext:emojiTokenIndices:persistEmoji:shouldHideTrailingPunctuation:isTrailingPunctuationHidden:isFinal:choiceIdx:itnCompletion:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)initWithLanguage:(uint64_t)a1 withSdapiConfig:quasarConfig:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AD756000, v1, v2, "_EARFormatter initialization failed: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)initWithQuasarConfig:(uint64_t)a1 overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AD756000, v1, v2, "_EARFormatter initialization failed on trying createQuasarITN: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)initWithQuasarConfig:(uint64_t)a3 overrideConfigFiles:(uint64_t)a4 supportEmojiRecognition:(uint64_t)a5 language:(uint64_t)a6 skipPathsExistCheck:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, a1, a3, "Quasar Itn missing in configuration", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)initNcsWithModelRoot:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AD756000, v1, v2, "_EARFormatter initialization failed on trying createSdapiITN: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)recognizeEmojiForTokens:(os_log_t)log emojiTokenIndices:persistEmoji:choiceIdx:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AD756000, log, OS_LOG_TYPE_DEBUG, "Emoji Input is empty", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)recognizeEmojiForTokens:emojiTokenIndices:persistEmoji:choiceIdx:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1AD756000, v0, OS_LOG_TYPE_DEBUG, "Emoji Input: %@", v1, 0xCu);
}

- (void)formatWords:(uint64_t)a3 task:(uint64_t)a4 autoPunctuate:(uint64_t)a5 recognizeEmoji:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, a1, a3, "Quasar Itn is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)refreshEmojiRecognizer
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2 & 1;
  _os_log_debug_impl(&dword_1AD756000, log, OS_LOG_TYPE_DEBUG, "Emoji service is not available; Emoji Recognition is turned off %@ %d",
    buf,
    0x12u);
}

@end
