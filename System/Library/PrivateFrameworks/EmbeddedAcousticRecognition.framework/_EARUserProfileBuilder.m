@implementation _EARUserProfileBuilder

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
    +[EARSdapiHelper EnsureSDAPIInitialized](EARSdapiHelper, "EnsureSDAPIInitialized");
  }
}

+ (BOOL)isEasyToRecognizeWord:(id)a3 forLocale:(id)a4
{
  id v5;
  id v6;
  id v7;
  quasar *v8;
  id v9;
  const char *v10;
  const char *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  v8 = (quasar *)objc_msgSend(v7, "UTF8String");
  objc_msgSend(v6, "localeIdentifier");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  LOBYTE(v8) = quasar::wordIsNativeScriptForLocale(v8, v10, v11);

  return (char)v8;
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 withLanguage:(id)a4 withSdapiOverrides:(id)a5 withSdapiConfig:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _EARUserProfileBuilder *v14;
  id v15;
  uint64_t v16;
  EARLogger *v17;
  NSObject *v18;
  _EARUserProfileBuilder *v19;
  TextTokenizer *v20;
  TextTokenizer *value;
  uint64_t v22;
  _OWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  char *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  quasar::SystemConfig *v36;
  __shared_weak_count *cntrl;
  unint64_t *v38;
  unint64_t v39;
  __shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  G2P *v43;
  G2P *v44;
  void *v45;
  std::__shared_weak_count *v46;
  unint64_t *p_shared_owners;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  G2P *v53;
  __shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  __shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  G2Embedding *v60;
  G2Embedding *v61;
  void *v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  LmeDataFactory *v74;
  std::__shared_weak_count *v75;
  void *v76;
  std::__shared_weak_count *v77;
  void *v78[2];
  uint64_t v79;
  void *v80[2];
  uint64_t v81;
  LmeDataFactory *v82;
  std::__shared_weak_count *v83;
  void *ptr;
  std::__shared_weak_count *v85;
  void *v86[2];
  __int128 v87;
  int v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92[2];
  uint64_t v93;
  __int128 __p;
  uint64_t v95;
  std::string v96;
  _QWORD *v97;
  char v98;
  _QWORD *v99;
  char v100;
  _QWORD *v101;
  char v102;
  uint64_t *v103[3];
  objc_super v104;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v104.receiver = self;
  v104.super_class = (Class)_EARUserProfileBuilder;
  v14 = -[_EARUserProfileBuilder init](&v104, sel_init);
  if (!v14)
  {
LABEL_117:
    v19 = v14;
    goto LABEL_118;
  }
  v15 = objc_retainAutorelease(v10);
  v96.__r_.__value_.__r.__words[0] = objc_msgSend(v15, "fileSystemRepresentation");
  std::make_unique[abi:ne180100]<quasar::LmeDataFactory,char const*>(&v96.__r_.__value_.__l.__data_, (uint64_t *)&__p);
  std::shared_ptr<quasar::LmeDataFactory>::operator=[abi:ne180100]<quasar::LmeDataFactory,std::default_delete<quasar::LmeDataFactory>,void>(&v14->_dataFactory.__ptr_, (uint64_t *)&__p);
  v16 = __p;
  *(_QWORD *)&__p = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  v17 = (EARLogger *)(*(uint64_t (**)(LmeDataFactory *))(*(_QWORD *)v14->_dataFactory.__ptr_ + 16))(v14->_dataFactory.__ptr_);
  if (!(_DWORD)v17)
  {
    v71 = v13;
    +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:](_EARQuasarTokenizer, "tokenizerWithRecognizerConfigPath:", v15);
    v20 = (TextTokenizer *)__p;
    *(_QWORD *)&__p = 0;
    value = v14->_tokenizer.__ptr_.__value_;
    v14->_tokenizer.__ptr_.__value_ = v20;
    if (value)
    {
      (*(void (**)(TextTokenizer *))(*(_QWORD *)value + 8))(value);
      v22 = __p;
      *(_QWORD *)&__p = 0;
      if (v22)
        (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
    }
    if (v13)
    {
      objc_msgSend(v13, "ear_toString");
    }
    else
    {
      __p = 0uLL;
      v95 = 0;
    }
    sdapi::SdapiUtil::readConfig(&__p, (uint64_t)v103);
    if (SHIBYTE(v95) < 0)
    {
      operator delete((void *)__p);
      if (v11)
        goto LABEL_16;
    }
    else if (v11)
    {
LABEL_16:
      objc_msgSend(v11, "ear_toString");
      goto LABEL_19;
    }
    __p = 0uLL;
    v95 = 0;
LABEL_19:
    v86[0] = &__p;
    v23 = std::__tree<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v103, (const void **)&__p, (uint64_t)&std::piecewise_construct, (_OWORD **)v86);
    sdapi::SdapiUtil::LocaleInfo::LocaleInfo(&v96, (_OWORD *)((char *)v23 + 56));
    if (SHIBYTE(v95) < 0)
      operator delete((void *)__p);
    if (v98 >= 0)
      v24 = &v97;
    else
      v24 = v97;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100 >= 0)
      v25 = &v99;
    else
      v25 = v99;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v102 >= 0)
      v27 = &v101;
    else
      v27 = v101;
    v73 = (void *)v26;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (char *)operator new(0x68uLL);
    *((_QWORD *)v28 + 2) = 0;
    *(_QWORD *)v28 = &unk_1E5D428E0;
    *((_QWORD *)v28 + 1) = 0;
    v28[32] = 0;
    *((_QWORD *)v28 + 3) = &unk_1E5D35128;
    *((_DWORD *)v28 + 9) = 10000;
    *((_QWORD *)v28 + 5) = v28 + 40;
    *((_QWORD *)v28 + 6) = v28 + 40;
    *(_OWORD *)(v28 + 56) = 0u;
    *(_OWORD *)(v28 + 72) = 0u;
    *((_QWORD *)v28 + 11) = 0;
    *((_DWORD *)v28 + 24) = 1065353216;
    *(_QWORD *)&__p = v28 + 24;
    *((_QWORD *)&__p + 1) = v28;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v14->_pronCache, &__p);
    v29 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
    if (*((_QWORD *)&__p + 1))
    {
      v30 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = (char *)operator new(0x68uLL);
    *((_QWORD *)v32 + 1) = 0;
    *((_QWORD *)v32 + 2) = 0;
    *(_QWORD *)v32 = &unk_1E5D428E0;
    v32[32] = 0;
    *((_QWORD *)v32 + 3) = &unk_1E5D35128;
    *((_DWORD *)v32 + 9) = 10000;
    *((_QWORD *)v32 + 5) = v32 + 40;
    *((_QWORD *)v32 + 6) = v32 + 40;
    *(_OWORD *)(v32 + 56) = 0u;
    *(_OWORD *)(v32 + 72) = 0u;
    *((_QWORD *)v32 + 11) = 0;
    *((_DWORD *)v32 + 24) = 1065353216;
    *(_QWORD *)&__p = v32 + 24;
    *((_QWORD *)&__p + 1) = v32;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v14->_embeddingCache, &__p);
    v33 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
    if (*((_QWORD *)&__p + 1))
    {
      v34 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&__p);
    v13 = v71;
    std::string::basic_string[abi:ne180100]<0>(v92, (char *)objc_msgSend(objc_retainAutorelease(v15), "fileSystemRepresentation"));
    v89 = 0;
    v90 = 0;
    v91 = 0;
    *(_OWORD *)v86 = 0u;
    v87 = 0u;
    v88 = 1065353216;
    quasar::SystemConfig::readJsonFile((uint64_t)&__p, (uint64_t)v92, (uint64_t *)&v89, (uint64_t)v86, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v86);
    v86[0] = &v89;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v86);
    if (SHIBYTE(v93) < 0)
      operator delete(v92[0]);
    if (quasar::QuasarG2PFactory::g2pModelExist((quasar::QuasarG2PFactory *)&__p, v36))
    {
      cntrl = v14->_pronCache.__cntrl_;
      ptr = v14->_pronCache.__ptr_;
      v85 = (std::__shared_weak_count *)cntrl;
      if (cntrl)
      {
        v38 = (unint64_t *)((char *)cntrl + 8);
        do
          v39 = __ldxr(v38);
        while (__stxr(v39 + 1, v38));
      }
      v40 = v14->_dataFactory.__cntrl_;
      v82 = v14->_dataFactory.__ptr_;
      v83 = (std::__shared_weak_count *)v40;
      if (v40)
      {
        v41 = (unint64_t *)((char *)v40 + 8);
        do
          v42 = __ldxr(v41);
        while (__stxr(v42 + 1, v41));
      }
      if (v11)
      {
        objc_msgSend(v11, "ear_toString");
      }
      else
      {
        v86[0] = 0;
        v86[1] = 0;
        *(_QWORD *)&v87 = 0;
      }
      quasar::QuasarG2PFactory::createPronGuesser((uint64_t *)&ptr, (uint64_t *)&v82, (__int128 *)v86, (quasar::SystemConfig *)&__p, 4, 0, v92);
      v43 = (G2P *)v92[0];
      v92[0] = 0;
      v44 = v14->_g2p.__ptr_.__value_;
      v14->_g2p.__ptr_.__value_ = v43;
      if (v44)
      {
        (*(void (**)(G2P *))(*(_QWORD *)v44 + 8))(v44);
        v45 = v92[0];
        v92[0] = 0;
        if (v45)
          (*(void (**)(void *))(*(_QWORD *)v45 + 8))(v45);
      }
      if (SBYTE7(v87) < 0)
        operator delete(v86[0]);
      v46 = v83;
      if (v83)
      {
        p_shared_owners = (unint64_t *)&v83->__shared_owners_;
        do
          v48 = __ldaxr(p_shared_owners);
        while (__stlxr(v48 - 1, p_shared_owners));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
      }
      v49 = v85;
      if (v85)
      {
        v50 = (unint64_t *)&v85->__shared_owners_;
        do
          v51 = __ldaxr(v50);
        while (__stlxr(v51 - 1, v50));
        if (!v51)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
        }
      }
LABEL_92:
      v54 = v14->_embeddingCache.__cntrl_;
      v76 = v14->_embeddingCache.__ptr_;
      v77 = (std::__shared_weak_count *)v54;
      if (v54)
      {
        v55 = (unint64_t *)((char *)v54 + 8);
        do
          v56 = __ldxr(v55);
        while (__stxr(v56 + 1, v55));
      }
      v57 = v14->_dataFactory.__cntrl_;
      v74 = v14->_dataFactory.__ptr_;
      v75 = (std::__shared_weak_count *)v57;
      if (v57)
      {
        v58 = (unint64_t *)((char *)v57 + 8);
        do
          v59 = __ldxr(v58);
        while (__stxr(v59 + 1, v58));
      }
      if (v11)
      {
        objc_msgSend(v11, "ear_toString");
      }
      else
      {
        v86[0] = 0;
        v86[1] = 0;
        *(_QWORD *)&v87 = 0;
      }
      quasar::QuasarG2PFactory::createG2Embedding((uint64_t *)&v76, (uint64_t *)&v74, (uint64_t)v86, (uint64_t)&__p, 4u, 0, (uint64_t *)v92);
      v60 = (G2Embedding *)v92[0];
      v92[0] = 0;
      v61 = v14->_g2emb.__ptr_.__value_;
      v14->_g2emb.__ptr_.__value_ = v60;
      if (v61)
      {
        (*(void (**)(G2Embedding *))(*(_QWORD *)v61 + 8))(v61);
        v62 = v92[0];
        v92[0] = 0;
        if (v62)
          (*(void (**)(void *))(*(_QWORD *)v62 + 8))(v62);
      }
      if (SBYTE7(v87) < 0)
        operator delete(v86[0]);
      v63 = v75;
      if (v75)
      {
        v64 = (unint64_t *)&v75->__shared_owners_;
        do
          v65 = __ldaxr(v64);
        while (__stlxr(v65 - 1, v64));
        if (!v65)
        {
          ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
          std::__shared_weak_count::__release_weak(v63);
        }
      }
      v66 = v77;
      if (v77)
      {
        v67 = (unint64_t *)&v77->__shared_owners_;
        do
          v68 = __ldaxr(v67);
        while (__stlxr(v68 - 1, v67));
        if (!v68)
        {
          ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
          std::__shared_weak_count::__release_weak(v66);
        }
      }
      objc_storeStrong((id *)&v14->_language, a4);
      quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&__p);

      sdapi::SdapiUtil::LocaleInfo::~LocaleInfo((void **)&v96.__r_.__value_.__l.__data_);
      std::__tree<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,sdapi::SdapiUtil::LocaleInfo>>>::destroy((uint64_t)v103, v103[1]);
      goto LABEL_117;
    }
    if (v12)
    {
      objc_msgSend(v12, "ear_toString");
      if (v70)
      {
LABEL_53:
        objc_msgSend(v70, "ear_toString");
        goto LABEL_72;
      }
    }
    else
    {
      v86[0] = 0;
      v86[1] = 0;
      *(_QWORD *)&v87 = 0;
      if (v70)
        goto LABEL_53;
    }
    v92[0] = 0;
    v92[1] = 0;
    v93 = 0;
LABEL_72:
    if (v73)
    {
      objc_msgSend(v73, "ear_toString");
    }
    else
    {
      v89 = 0;
      v90 = 0;
      v91 = 0;
    }
    if (v72)
    {
      objc_msgSend(v72, "ear_toString");
      if (v11)
      {
LABEL_77:
        objc_msgSend(v11, "ear_toString");
LABEL_80:
        v52 = operator new();
        sdapi::SdapiG2P::SdapiG2P(v52, v86, v92, &v89, v80, &v14->_pronCache, &v14->_dataFactory, v78);
        v53 = v14->_g2p.__ptr_.__value_;
        v14->_g2p.__ptr_.__value_ = (G2P *)v52;
        if (v53)
          (*(void (**)(G2P *))(*(_QWORD *)v53 + 8))(v53);
        if (SHIBYTE(v79) < 0)
          operator delete(v78[0]);
        if (SHIBYTE(v81) < 0)
          operator delete(v80[0]);
        if (SHIBYTE(v91) < 0)
          operator delete(v89);
        if (SHIBYTE(v93) < 0)
          operator delete(v92[0]);
        if (SBYTE7(v87) < 0)
          operator delete(v86[0]);
        goto LABEL_92;
      }
    }
    else
    {
      v80[0] = 0;
      v80[1] = 0;
      v81 = 0;
      if (v11)
        goto LABEL_77;
    }
    v78[0] = 0;
    v78[1] = 0;
    v79 = 0;
    goto LABEL_80;
  }
  EARLogger::QuasarOSLogger(v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[_EARUserProfileBuilder initWithConfiguration:withLanguage:withSdapiOverrides:withSdapiConfig:].cold.1();

  v19 = 0;
LABEL_118:

  return v19;
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 sdapiOverrides:(id)a5 generalVoc:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 lexiconEnh:(id)a9 tokenEnh:(id)a10 paramsetHolder:(id)a11
{
  return -[_EARUserProfileBuilder initWithConfiguration:language:overrides:sdapiOverrides:generalVoc:emptyVoc:pgVoc:lexiconEnh:tokenEnh:paramsetHolder:](self, "initWithConfiguration:language:overrides:sdapiOverrides:generalVoc:emptyVoc:pgVoc:lexiconEnh:tokenEnh:paramsetHolder:", a3, a4, 0, a5, a6, a7, a8, a9, a10, a11);
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 generalVoc:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 lexiconEnh:(id)a10 tokenEnh:(id)a11 paramsetHolder:(id)a12
{
  uint64_t v13;

  LOBYTE(v13) = 0;
  return -[_EARUserProfileBuilder initWithConfiguration:language:overrides:sdapiOverrides:generalVoc:emptyVoc:pgVoc:lexiconEnh:tokenEnh:paramsetHolder:isJit:](self, "initWithConfiguration:language:overrides:sdapiOverrides:generalVoc:emptyVoc:pgVoc:lexiconEnh:tokenEnh:paramsetHolder:isJit:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v13);
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 generalVoc:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 lexiconEnh:(id)a10 tokenEnh:(id)a11 paramsetHolder:(id)a12 isJit:(BOOL)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _EARUserProfileBuilder *v28;
  uint64_t v30;
  id v31;

  v18 = a3;
  v19 = a4;
  v31 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = +[_EARQuasarTokenizer extractModelRootFromNcsResourcePaths:lexiconEnh:tokenEnh:itnEnh:](_EARQuasarTokenizer, "extractModelRootFromNcsResourcePaths:lexiconEnh:tokenEnh:itnEnh:", v21, v24, v25, 0);
  LOBYTE(v30) = a13;
  v28 = -[_EARUserProfileBuilder initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:](self, "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:", v18, v19, v31, v20, v22, v23, v26, v30);

  return v28;
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 paramsetHolder:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[_EARUserProfileBuilder initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:](self, "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 paramsetHolder:(id)a9 isJit:(BOOL)a10
{
  uint64_t v11;

  LOBYTE(v11) = a10;
  return -[_EARUserProfileBuilder initWithConfiguration:language:overrides:textNormalizationModelRoot:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:](self, "initWithConfiguration:language:overrides:textNormalizationModelRoot:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:", a3, a4, a5, 0, a6, a7, a8, a9, v11);
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 textNormalizationModelRoot:(id)a6 sdapiOverrides:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 paramsetHolder:(id)a10 isJit:(BOOL)a11
{
  id v17;
  void *v18;
  id v19;
  void *v20;
  EARLogger *v21;
  NSObject *v22;
  _EARUserProfileBuilder *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 *v31;
  unsigned __int8 *v32;
  id v33;
  uint64_t Ptree;
  unsigned int BoolOptional;
  char v36;
  TextTokenizer *v37;
  TextTokenizer *value;
  TextTokenizer *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  PersonalizationRecipe *v46;
  quasar::SystemConfig *v47;
  __shared_weak_count *cntrl;
  unint64_t *v49;
  unint64_t v50;
  __shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  TextTokenizer *v54;
  G2P *v55;
  G2P *v56;
  void *v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  G2P *v65;
  __shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  __shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  G2Embedding *v72;
  G2Embedding *v73;
  void *v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  id obj;
  shared_ptr<quasar::LmeDataFactory> *p_dataFactory;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _EARUserProfileBuilder *v91;
  _EARUserProfileBuilder *v92;
  LmeDataFactory *v93;
  std::__shared_weak_count *v94;
  void *v95;
  std::__shared_weak_count *v96;
  void *v97[2];
  uint64_t v98;
  void *v99[2];
  uint64_t v100;
  void *v101[2];
  uint64_t v102;
  LmeDataFactory *v103;
  std::__shared_weak_count *v104;
  void *ptr;
  std::__shared_weak_count *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *__p[2];
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  char *v116[4];
  int v117;
  _QWORD v118[4];
  _EARUserProfileBuilder *v119;
  objc_super v120;
  __int128 v121;
  uint64_t v122;
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v89 = a3;
  obj = a4;
  v17 = a4;
  v90 = a5;
  v88 = a6;
  v84 = a7;
  v85 = a8;
  v86 = a9;
  v87 = a10;
  v120.receiver = self;
  v120.super_class = (Class)_EARUserProfileBuilder;
  v92 = -[_EARUserProfileBuilder init](&v120, sel_init);

  v18 = v17;
  if (!v92)
    goto LABEL_134;
  v19 = objc_retainAutorelease(v89);
  v116[0] = (char *)objc_msgSend(v19, "fileSystemRepresentation");
  std::make_unique[abi:ne180100]<quasar::LmeDataFactory,char const*>(v116, (uint64_t *)__p);
  p_dataFactory = &v92->_dataFactory;
  std::shared_ptr<quasar::LmeDataFactory>::operator=[abi:ne180100]<quasar::LmeDataFactory,std::default_delete<quasar::LmeDataFactory>,void>(&v92->_dataFactory.__ptr_, (uint64_t *)__p);
  v20 = __p[0];
  __p[0] = 0;
  if (v20)
    (*(void (**)(void *))(*(_QWORD *)v20 + 8))(v20);
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __145___EARUserProfileBuilder_initWithConfiguration_language_overrides_textNormalizationModelRoot_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_isJit___block_invoke;
  v118[3] = &unk_1E5D46DA8;
  v91 = v92;
  v119 = v91;
  objc_msgSend(v90, "enumerateKeysAndObjectsUsingBlock:", v118);
  v21 = (EARLogger *)(*(uint64_t (**)(LmeDataFactory *))(*(_QWORD *)p_dataFactory->__ptr_ + 16))(p_dataFactory->__ptr_);
  if ((_DWORD)v21)
  {
    EARLogger::QuasarOSLogger(v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_EARUserProfileBuilder initWithConfiguration:withLanguage:withSdapiOverrides:withSdapiConfig:].cold.1();

    v23 = 0;
    goto LABEL_135;
  }
  memset(v116, 0, sizeof(v116));
  v117 = 1065353216;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v24 = v90;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
  if (!v25)
    goto LABEL_26;
  v26 = *(_QWORD *)v113;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v113 != v26)
        objc_enumerationMutation(v24);
      v28 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
      objc_msgSend(v24, "objectForKey:", v28, obj);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "ear_toString");
        if (v28)
          goto LABEL_15;
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        v111 = 0;
        if (v28)
        {
LABEL_15:
          objc_msgSend(v28, "ear_toString");
          goto LABEL_18;
        }
      }
      v121 = 0uLL;
      v122 = 0;
LABEL_18:
      v107 = &v121;
      v31 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v116, (unsigned __int8 *)&v121, (uint64_t)&std::piecewise_construct, (__int128 **)&v107);
      v32 = v31 + 40;
      if ((char)v31[63] < 0)
        operator delete(*(void **)v32);
      *(_OWORD *)v32 = *(_OWORD *)__p;
      *((_QWORD *)v32 + 2) = v111;
      HIBYTE(v111) = 0;
      LOBYTE(__p[0]) = 0;
      if (SHIBYTE(v122) < 0)
      {
        operator delete((void *)v121);
        v18 = v17;
        if (SHIBYTE(v111) < 0)
          operator delete(__p[0]);
      }
      else
      {
        v18 = v17;
      }

    }
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
  }
  while (v25);
LABEL_26:

  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)__p);
  v33 = objc_retainAutorelease(v19);
  std::string::basic_string[abi:ne180100]<0>(&v121, (char *)objc_msgSend(v33, "fileSystemRepresentation"));
  v107 = 0;
  v108 = 0;
  v109 = 0;
  quasar::SystemConfig::readJsonFile((uint64_t)__p, (uint64_t)&v121, (uint64_t *)&v107, (uint64_t)v116, 0, 0);
  v101[0] = &v107;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v101);
  if (SHIBYTE(v122) < 0)
  {
    operator delete((void *)v121);
    if (!a11)
      goto LABEL_38;
  }
  else if (!a11)
  {
    goto LABEL_38;
  }
  std::string::basic_string[abi:ne180100]<0>(&v121, "lme-create");
  Ptree = quasar::SystemConfig::getPtree((uint64_t)__p, (uint64_t)&v121);
  if (SHIBYTE(v122) < 0)
    operator delete((void *)v121);
  std::string::basic_string[abi:ne180100]<0>(&v121, "jit-use-tokenizer");
  BoolOptional = (unsigned __int16)quasar::PTree::getBoolOptional(Ptree, (uint64_t)&v121);
  if (BoolOptional <= 0x100)
    v36 = 0;
  else
    v36 = BoolOptional;
  if (SHIBYTE(v122) < 0)
    operator delete((void *)v121);
  if (v36)
  {
LABEL_38:
    if (v88)
      +[_EARQuasarTokenizer tokenizerWithTokenizerModelRoot:](_EARQuasarTokenizer, "tokenizerWithTokenizerModelRoot:");
    else
      +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:](_EARQuasarTokenizer, "tokenizerWithRecognizerConfigPath:", v33);
    v37 = (TextTokenizer *)v121;
    *(_QWORD *)&v121 = 0;
    value = v91->_tokenizer.__ptr_.__value_;
    v91->_tokenizer.__ptr_.__value_ = v37;
    if (value)
    {
      (*(void (**)(TextTokenizer *))(*(_QWORD *)value + 8))(value);
      v39 = (TextTokenizer *)v121;
      *(_QWORD *)&v121 = 0;
      if (v39)
        goto LABEL_43;
    }
  }
  else
  {
    v54 = (TextTokenizer *)operator new();
    std::string::basic_string[abi:ne180100]<0>(&v121, "");
    quasar::BasicTokenizer::BasicTokenizer(v54, &v121);
    if (SHIBYTE(v122) < 0)
      operator delete((void *)v121);
    v39 = v91->_tokenizer.__ptr_.__value_;
    v91->_tokenizer.__ptr_.__value_ = v54;
    if (v39)
LABEL_43:
      (*(void (**)(TextTokenizer *))(*(_QWORD *)v39 + 8))(v39);
  }
  v40 = operator new();
  *(_BYTE *)(v40 + 8) = 0;
  *(_QWORD *)v40 = &unk_1E5D35128;
  *(_DWORD *)(v40 + 12) = 10000;
  *(_QWORD *)(v40 + 16) = v40 + 16;
  *(_QWORD *)(v40 + 24) = v40 + 16;
  *(_OWORD *)(v40 + 32) = 0u;
  *(_OWORD *)(v40 + 48) = 0u;
  *(_QWORD *)(v40 + 64) = 0;
  *(_DWORD *)(v40 + 72) = 1065353216;
  *(_QWORD *)&v121 = v40;
  std::shared_ptr<quasar::PronCache<std::string,std::vector<std::string>>>::operator=[abi:ne180100]<quasar::GlobalLRUCache<std::string,std::vector<std::string>>,std::default_delete<quasar::GlobalLRUCache<std::string,std::vector<std::string>>>,void>(&v91->_pronCache.__ptr_, (uint64_t *)&v121);
  v41 = v121;
  *(_QWORD *)&v121 = 0;
  if (v41)
    (*(void (**)(uint64_t))(*(_QWORD *)v41 + 8))(v41);
  v42 = (char *)operator new(0x68uLL);
  *((_QWORD *)v42 + 2) = 0;
  *(_QWORD *)v42 = &unk_1E5D428E0;
  *((_QWORD *)v42 + 1) = 0;
  v42[32] = 0;
  *((_QWORD *)v42 + 3) = &unk_1E5D35128;
  *((_DWORD *)v42 + 9) = 10000;
  *((_QWORD *)v42 + 5) = v42 + 40;
  *((_QWORD *)v42 + 6) = v42 + 40;
  *(_OWORD *)(v42 + 56) = 0u;
  *(_OWORD *)(v42 + 72) = 0u;
  *((_QWORD *)v42 + 11) = 0;
  *((_DWORD *)v42 + 24) = 1065353216;
  *(_QWORD *)&v121 = v42 + 24;
  *((_QWORD *)&v121 + 1) = v42;
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v91->_embeddingCache, &v121);
  v43 = (std::__shared_weak_count *)*((_QWORD *)&v121 + 1);
  if (*((_QWORD *)&v121 + 1))
  {
    v44 = (unint64_t *)(*((_QWORD *)&v121 + 1) + 8);
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  quasar::getPersonalizationRecipe((quasar *)__p, (uint64_t *)&v121);
  v46 = (PersonalizationRecipe *)v121;
  *(_QWORD *)&v121 = 0;
  v47 = (quasar::SystemConfig *)v91->_personalizationRecipe.__ptr_.__value_;
  v91->_personalizationRecipe.__ptr_.__value_ = v46;
  if (v47)
  {
    std::default_delete<quasar::PersonalizationRecipe>::operator()[abi:ne180100]((uint64_t)&v91->_personalizationRecipe, (uint64_t)v47);
    v47 = (quasar::SystemConfig *)v121;
    *(_QWORD *)&v121 = 0;
    if (v47)
      std::default_delete<quasar::PersonalizationRecipe>::operator()[abi:ne180100]((uint64_t)&v121, (uint64_t)v47);
  }
  if (quasar::QuasarG2PFactory::g2pModelExist((quasar::QuasarG2PFactory *)__p, v47))
  {
    cntrl = v91->_pronCache.__cntrl_;
    ptr = v91->_pronCache.__ptr_;
    v106 = (std::__shared_weak_count *)cntrl;
    if (cntrl)
    {
      v49 = (unint64_t *)((char *)cntrl + 8);
      do
        v50 = __ldxr(v49);
      while (__stxr(v50 + 1, v49));
    }
    v51 = v91->_dataFactory.__cntrl_;
    v103 = p_dataFactory->__ptr_;
    v104 = (std::__shared_weak_count *)v51;
    if (v51)
    {
      v52 = (unint64_t *)((char *)v51 + 8);
      do
        v53 = __ldxr(v52);
      while (__stxr(v53 + 1, v52));
    }
    if (v18)
    {
      objc_msgSend(v18, "ear_toString");
    }
    else
    {
      v121 = 0uLL;
      v122 = 0;
    }
    quasar::QuasarG2PFactory::createPronGuesser((uint64_t *)&ptr, (uint64_t *)&v103, &v121, (quasar::SystemConfig *)__p, 4, a11, &v107);
    v55 = (G2P *)v107;
    v107 = 0;
    v56 = v91->_g2p.__ptr_.__value_;
    v91->_g2p.__ptr_.__value_ = v55;
    if (v56)
    {
      (*(void (**)(G2P *))(*(_QWORD *)v56 + 8))(v56);
      v57 = v107;
      v107 = 0;
      if (v57)
        (*(void (**)(void *))(*(_QWORD *)v57 + 8))(v57);
    }
    if (SHIBYTE(v122) < 0)
      operator delete((void *)v121);
    v58 = v104;
    if (v104)
    {
      p_shared_owners = (unint64_t *)&v104->__shared_owners_;
      do
        v60 = __ldaxr(p_shared_owners);
      while (__stlxr(v60 - 1, p_shared_owners));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
    v61 = v106;
    if (v106)
    {
      v62 = (unint64_t *)&v106->__shared_owners_;
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
    goto LABEL_109;
  }
  if (v84)
  {
    objc_msgSend(v84, "ear_toString");
  }
  else
  {
    v121 = 0uLL;
    v122 = 0;
  }
  if (v87)
  {
    objc_msgSend(v87, "ear_toString");
  }
  else
  {
    v107 = 0;
    v108 = 0;
    v109 = 0;
  }
  if (v85)
  {
    objc_msgSend(v85, "ear_toString");
  }
  else
  {
    v101[0] = 0;
    v101[1] = 0;
    v102 = 0;
  }
  if (v86)
  {
    objc_msgSend(v86, "ear_toString");
    if (v18)
      goto LABEL_94;
LABEL_96:
    v97[0] = 0;
    v97[1] = 0;
    v98 = 0;
  }
  else
  {
    v99[0] = 0;
    v99[1] = 0;
    v100 = 0;
    if (!v18)
      goto LABEL_96;
LABEL_94:
    objc_msgSend(v18, "ear_toString", obj);
  }
  v64 = operator new();
  sdapi::SdapiG2P::SdapiG2P(v64, &v121, &v107, v101, v99, &v91->_pronCache, p_dataFactory, v97);
  v65 = v91->_g2p.__ptr_.__value_;
  v91->_g2p.__ptr_.__value_ = (G2P *)v64;
  if (v65)
    (*(void (**)(G2P *))(*(_QWORD *)v65 + 8))(v65);
  if (SHIBYTE(v98) < 0)
    operator delete(v97[0]);
  if (SHIBYTE(v100) < 0)
    operator delete(v99[0]);
  if (SHIBYTE(v102) < 0)
    operator delete(v101[0]);
  if (SHIBYTE(v109) < 0)
    operator delete(v107);
  if (SHIBYTE(v122) < 0)
    operator delete((void *)v121);
LABEL_109:
  v66 = v91->_embeddingCache.__cntrl_;
  v95 = v91->_embeddingCache.__ptr_;
  v96 = (std::__shared_weak_count *)v66;
  if (v66)
  {
    v67 = (unint64_t *)((char *)v66 + 8);
    do
      v68 = __ldxr(v67);
    while (__stxr(v68 + 1, v67));
  }
  v69 = v91->_dataFactory.__cntrl_;
  v93 = p_dataFactory->__ptr_;
  v94 = (std::__shared_weak_count *)v69;
  if (v69)
  {
    v70 = (unint64_t *)((char *)v69 + 8);
    do
      v71 = __ldxr(v70);
    while (__stxr(v71 + 1, v70));
  }
  if (v18)
  {
    objc_msgSend(v18, "ear_toString");
  }
  else
  {
    v121 = 0uLL;
    v122 = 0;
  }
  quasar::QuasarG2PFactory::createG2Embedding((uint64_t *)&v95, (uint64_t *)&v93, (uint64_t)&v121, (uint64_t)__p, 4u, a11, (uint64_t *)&v107);
  v72 = (G2Embedding *)v107;
  v107 = 0;
  v73 = v91->_g2emb.__ptr_.__value_;
  v91->_g2emb.__ptr_.__value_ = v72;
  if (v73)
  {
    (*(void (**)(G2Embedding *))(*(_QWORD *)v73 + 8))(v73);
    v74 = v107;
    v107 = 0;
    if (v74)
      (*(void (**)(void *))(*(_QWORD *)v74 + 8))(v74);
  }
  if (SHIBYTE(v122) < 0)
    operator delete((void *)v121);
  v75 = v94;
  if (v94)
  {
    v76 = (unint64_t *)&v94->__shared_owners_;
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
  }
  v78 = v96;
  if (v96)
  {
    v79 = (unint64_t *)&v96->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  objc_storeStrong((id *)&v91->_language, obj);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)__p);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v116);

LABEL_134:
  v23 = v92;
LABEL_135:

  return v23;
}

- (void)addWordWithParts:(id)a3 templateName:(id)a4
{
  id v6;
  void *v7;
  int MaxEntityCountFromQuasarTemplate;
  unsigned int MaxOrthographyLengthFromQuasarTemplate;
  _EARUserProfileBuilder *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  unsigned int MaxNumEnumeratedContacts;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  std::string::size_type v36;
  std::string *v37;
  void *v38;
  void *v39;
  std::string::size_type v40;
  std::string *p_str;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  __int128 *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *p_shared_owners;
  unint64_t v50;
  std::string::size_type v51;
  unint64_t v52;
  uint64_t v53;
  std::string *v54;
  std::string *v55;
  BOOL v56;
  std::string::size_type v57;
  std::string *v58;
  std::string::size_type v59;
  unint64_t v60;
  __int128 *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  const quasar::LmeDataFactoryBase::Word *MaxPronLen;
  std::string::size_type size;
  std::string::size_type v67;
  int v68;
  const std::string::value_type *v69;
  std::string::size_type v70;
  std::string::size_type v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  _EARUserProfileBuilder *v75;
  void *v76;
  _BOOL4 isContactTemplate;
  id v78;
  id obj;
  char v80;
  __int128 *v81[2];
  std::string __str;
  std::string v83;
  std::string __p;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char **v89;
  char *v90;
  unint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  std::string v96;
  void *lpsrc;
  __int128 *v98;
  __int128 **v99;
  _QWORD *v100[2];
  std::string *v101;
  unint64_t v102;
  unint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  std::string v108;
  __int128 v109;
  uint64_t v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v109 = 0uLL;
    v110 = 0;
  }
  quasar::SystemConfig::aceCatToQuasarTemplate((uint64_t)self->_dataFactory.__ptr_ + 192, (uint64_t)&v109, &v108);
  if (!quasar::LmeDataFactory::isSupportedCategory((uint64_t)self->_dataFactory.__ptr_, (uint64_t)&v108, 1))
    goto LABEL_113;
  MaxEntityCountFromQuasarTemplate = quasar::LmeDataFactory::getMaxEntityCountFromQuasarTemplate((uint64_t)self->_dataFactory.__ptr_, (unsigned __int8 *)&v108);
  if ((MaxEntityCountFromQuasarTemplate & 0x80000000) == 0)
  {
    v101 = &v108;
    if (*((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_quasarTemplate2Count, (unsigned __int8 *)&v108, (uint64_t)&std::piecewise_construct, (__int128 **)&v101)+ 10) >= MaxEntityCountFromQuasarTemplate)goto LABEL_113;
  }
  MaxOrthographyLengthFromQuasarTemplate = quasar::LmeDataFactory::getMaxOrthographyLengthFromQuasarTemplate((uint64_t)self->_dataFactory.__ptr_, (unsigned __int8 *)&v108);
  if ((MaxOrthographyLengthFromQuasarTemplate & 0x80000000) != 0)
  {
LABEL_17:
    isContactTemplate = quasar::LmeDataFactory::isContactTemplate((uint64_t)self->_dataFactory.__ptr_, (uint64_t)&v108);
    if (!isContactTemplate
      || (MaxNumEnumeratedContacts = quasar::LmeDataFactory::getMaxNumEnumeratedContacts((quasar::LmeDataFactory *)self->_dataFactory.__ptr_),
          (MaxNumEnumeratedContacts & 0x80000000) != 0)
      || self->_contactEnumSet.__tree_.__pair3_.__value_ < MaxNumEnumeratedContacts)
    {
      v101 = &v108;
      v20 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_quasarTemplate2Count, (unsigned __int8 *)&v108, (uint64_t)&std::piecewise_construct, (__int128 **)&v101);
      ++*((_DWORD *)v20 + 10);
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v100[0] = 0;
      v100[1] = 0;
      v99 = (__int128 **)v100;
      quasar::LmeDataFactory::getNameEnumeratorFromAceCategory((uint64_t)self->_dataFactory.__ptr_, (uint64_t)&v109, &lpsrc);
      v76 = v7;
      memset(&v96, 0, sizeof(v96));
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      obj = v78;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      v75 = self;
      if (!v21)
      {

LABEL_121:
        if (lpsrc)
          (*(void (**)(void *, std::string **))(*(_QWORD *)lpsrc + 32))(lpsrc, &v101);
LABEL_123:
        v89 = 0;
        v90 = 0;
        v91 = 0;
        v61 = (__int128 *)v101;
        v60 = v102;
        if (v101 != (std::string *)v102)
        {
          do
          {
            memset(&__p, 0, sizeof(__p));
            v62 = std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&v99, (const void **)v61);
            if (v100 != (_QWORD **)v62)
              std::string::operator=(&__p, (const std::string *)(v62 + 56));
            memset(&v83, 0, sizeof(v83));
            -[_EARUserProfileBuilder _pronunciationsForOrthography:phoneticOrthography:templateName:pronunciations:pronRequest:outOrthography:](v75, "_pronunciationsForOrthography:phoneticOrthography:templateName:pronunciations:pronRequest:outOrthography:", v61, &__p, &v108, (char *)v61 + 56, 3, &v83);
            std::string::operator=((std::string *)v61, &v83);
            if (!quasar::LmeDataFactoryBase::PronSet::empty((quasar::LmeDataFactoryBase::PronSet *)((char *)v61 + 56)))
            {
              v63 = v90;
              if ((unint64_t)v90 >= v91)
              {
                v64 = (char *)std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t *)&v89, (uint64_t)v61, (uint64_t)v61 + 24, (unsigned int *)v61 + 12, (uint64_t)v61 + 56);
              }
              else
              {
                std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t)&v91, (uint64_t)v90, (uint64_t)v61, (uint64_t)v61 + 24, (unsigned int *)v61 + 12, (uint64_t)v61 + 56);
                v64 = v63 + 80;
              }
              v90 = v64;
            }
            if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v83.__r_.__value_.__l.__data_);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            v61 += 5;
          }
          while (v61 != (__int128 *)v60);
        }
        v7 = v76;
        quasar::LmePackedUserData::addUnpackedEntity((uint64_t **)&v75->_userData, &v109, (const quasar::LmeDataFactoryBase::Word **)&v89);
        ++v75->_wordsAccepted;
        if (isContactTemplate && lpsrc && (*(unsigned int (**)(void *))(*(_QWORD *)lpsrc + 24))(lpsrc))
        {
          MaxPronLen = (const quasar::LmeDataFactoryBase::Word *)quasar::LmeDataFactory::getMaxPronLen((uint64_t)v75->_dataFactory.__ptr_, (unsigned __int8 *)&v108);
          quasar::LmeDataFactory::encodeAndFilterEntity((std::string **)&v89, MaxPronLen, (uint64_t *)&__p);
          size = __p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__r.__words[0] != __p.__r_.__value_.__l.__size_)
          {
            v67 = __p.__r_.__value_.__r.__words[0] + 24;
            do
            {
              v68 = *(char *)(v67 + 23);
              if (v68 >= 0)
                v69 = (const std::string::value_type *)v67;
              else
                v69 = *(const std::string::value_type **)v67;
              if (v68 >= 0)
                v70 = *(unsigned __int8 *)(v67 + 23);
              else
                v70 = *(_QWORD *)(v67 + 8);
              std::string::append((std::string *)(v67 - 24), v69, v70);
              v71 = v67 + 56;
              v67 += 80;
            }
            while (v71 != size);
          }
          (*(void (**)(void *, std::string *, set<std::vector<std::string>, quasar::NameEnumerator::EnumComparator, std::allocator<std::vector<std::string>>> *))(*(_QWORD *)lpsrc + 16))(lpsrc, &__p, &v75->_contactEnumSet);
          v83.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
          std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
        }
        quasar::LmeDataFactoryBase::PronSet::PronSet(&__p);
        -[_EARUserProfileBuilder _embeddingsForOrthography:templateName:embeddings:pronRequest:](v75, "_embeddingsForOrthography:templateName:embeddings:pronRequest:", &v96, &v108, &__p, 2);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)__p.__r_.__value_.__l.__size_);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v89;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v96.__r_.__value_.__l.__data_);
        v72 = (std::__shared_weak_count *)v98;
        if (v98)
        {
          v73 = (unint64_t *)v98 + 1;
          do
            v74 = __ldaxr(v73);
          while (__stlxr(v74 - 1, v73));
          if (!v74)
          {
            ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
            std::__shared_weak_count::__release_weak(v72);
          }
        }
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v99, v100[0]);
        v99 = (__int128 **)&v101;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&v99);
        goto LABEL_114;
      }
      v22 = *(_QWORD *)v93;
      v80 = 1;
LABEL_22:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v93 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v23);
        v90 = 0;
        v91 = 0;
        v89 = &v90;
        objc_msgSend(v24, "pronunciations");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25 == 0;

        if (!v26)
        {
          v88 = 0u;
          v86 = 0u;
          v87 = 0u;
          v85 = 0u;
          objc_msgSend(v24, "pronunciations");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
          if (v28)
          {
            v29 = *(_QWORD *)v86;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v86 != v29)
                  objc_enumerationMutation(v27);
                v31 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                if (v31)
                  objc_msgSend(v31, "ear_toString");
                else
                  memset(&__p, 0, sizeof(__p));
                std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v89, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__p.__r_.__value_.__l.__data_);
              }
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
            }
            while (v28);
          }

        }
        objc_msgSend(v24, "tagName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
          objc_msgSend(v32, "ear_toString");
        else
          memset(&__p, 0, sizeof(__p));

        objc_msgSend(v24, "orthography");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
          objc_msgSend(v34, "ear_toString");
        else
          memset(&v83, 0, sizeof(v83));

        if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
        {
          v36 = v83.__r_.__value_.__l.__size_;
          if (!v83.__r_.__value_.__l.__size_)
          {
            v80 = 0;
LABEL_106:
            operator delete(v83.__r_.__value_.__l.__data_);
            goto LABEL_107;
          }
          v37 = (std::string *)v83.__r_.__value_.__r.__words[0];
        }
        else
        {
          v36 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
          if (!*((_BYTE *)&v83.__r_.__value_.__s + 23))
          {
            v80 = 0;
            goto LABEL_107;
          }
          v37 = &v83;
        }
        if ((char *)v37 + v36 != utf8::find_invalid<std::__wrap_iter<char const*>>((char *)v37, (char *)v37 + v36))
        {
          v80 = 0;
          goto LABEL_105;
        }
        objc_msgSend(v24, "phoneticOrthography");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v38)
          objc_msgSend(v38, "ear_toString");
        else
          memset(&__str, 0, sizeof(__str));

        if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          break;
        v40 = __str.__r_.__value_.__l.__size_;
        if (__str.__r_.__value_.__l.__size_)
        {
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
LABEL_62:
          if ((char *)p_str + v40 == utf8::find_invalid<std::__wrap_iter<char const*>>((char *)p_str, (char *)p_str + v40))
          {
            v81[0] = (__int128 *)&v83;
            v42 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v99, (const void **)&v83.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, v81);
            std::string::operator=((std::string *)(v42 + 7), &__str);
          }
          if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_66;
        }
        operator delete(__str.__r_.__value_.__l.__data_);
LABEL_66:
        if (v91)
        {
          __str.__r_.__value_.__r.__words[0] = objc_msgSend(v24, "frequency");
          v43 = v102;
          if (v102 >= v103)
          {
            v44 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string &,std::string &,unsigned long,std::set<std::string> &>((uint64_t *)&v101, (uint64_t)&v83, (uint64_t)&__p, (unsigned int *)&__str, (uint64_t)&v89);
          }
          else
          {
            std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string &,std::string &,unsigned long,std::set<std::string> &>((uint64_t)&v103, v102, (uint64_t)&v83, (uint64_t)&__p, (unsigned int *)&__str, (uint64_t)&v89);
            v44 = v43 + 80;
          }
          v80 = 0;
          v102 = v44;
        }
        else
        {
          *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = 0uLL;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str.__r_.__value_.__l.__size_;
          if (lpsrc
            && ((*(uint64_t (**)(void *))(*(_QWORD *)lpsrc + 24))(lpsrc) & 1) == 0
            && lpsrc
          {
            v46 = (std::__shared_weak_count *)v98;
            v81[0] = v45;
            v81[1] = v98;
            if (v98)
            {
              v47 = (unint64_t *)v98 + 1;
              do
                v48 = __ldxr(v47);
              while (__stxr(v48 + 1, v47));
            }
            (*(void (**)(__int128 *, std::string *, std::string *))(*(_QWORD *)v45 + 40))(v45, &v83, &__str);
            if (v46)
            {
              p_shared_owners = (unint64_t *)&v46->__shared_owners_;
              do
                v50 = __ldaxr(p_shared_owners);
              while (__stlxr(v50 - 1, p_shared_owners));
              if (!v50)
              {
                ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
                std::__shared_weak_count::__release_weak(v46);
              }
            }
          }
          else
          {
            std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&__str, (const void **)&v83.__r_.__value_.__l.__data_, (uint64_t)&v83);
          }
          v51 = __str.__r_.__value_.__r.__words[0];
          if ((std::string::size_type *)__str.__r_.__value_.__l.__data_ != &__str.__r_.__value_.__r.__words[1])
          {
            do
            {
              v81[0] = (__int128 *)objc_msgSend(v24, "frequency");
              v52 = v102;
              if (v102 >= v103)
              {
                v53 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string const&,std::string&,unsigned long,std::set<std::string> &>((uint64_t *)&v101, v51 + 32, (uint64_t)&__p, (unsigned int *)v81, (uint64_t)&v89);
              }
              else
              {
                std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string const&,std::string&,unsigned long,std::set<std::string> &>((uint64_t)&v103, v102, v51 + 32, (uint64_t)&__p, (unsigned int *)v81, (uint64_t)&v89);
                v53 = v52 + 80;
              }
              v102 = v53;
              v54 = *(std::string **)(v51 + 8);
              if (v54)
              {
                do
                {
                  v55 = v54;
                  v54 = (std::string *)v54->__r_.__value_.__r.__words[0];
                }
                while (v54);
              }
              else
              {
                do
                {
                  v55 = *(std::string **)(v51 + 16);
                  v56 = v55->__r_.__value_.__r.__words[0] == v51;
                  v51 = (std::string::size_type)v55;
                }
                while (!v56);
              }
              v51 = (std::string::size_type)v55;
            }
            while (v55 != (std::string *)&__str.__r_.__value_.__r.__words[1]);
          }
          v57 = HIBYTE(v96.__r_.__value_.__r.__words[2]);
          if ((v96.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v57 = v96.__r_.__value_.__l.__size_;
          if (v57)
            std::string::append(&v96, " ");
          if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v58 = &v83;
          else
            v58 = (std::string *)v83.__r_.__value_.__r.__words[0];
          if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v59 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
          else
            v59 = v83.__r_.__value_.__l.__size_;
          std::string::append(&v96, (const std::string::value_type *)v58, v59);
          std::__tree<std::string>::destroy((uint64_t)&__str, (char *)__str.__r_.__value_.__l.__size_);
        }
LABEL_105:
        if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
          goto LABEL_106;
LABEL_107:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        std::__tree<std::string>::destroy((uint64_t)&v89, v90);
        if (++v23 == v21)
        {
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
          if (!v21)
          {

            if ((v80 & 1) == 0)
              goto LABEL_123;
            goto LABEL_121;
          }
          goto LABEL_22;
        }
      }
      v40 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      if (!*((_BYTE *)&__str.__r_.__value_.__s + 23))
        goto LABEL_66;
      p_str = &__str;
      goto LABEL_62;
    }
LABEL_113:
    ++self->_wordsRejected;
    goto LABEL_114;
  }
  v10 = self;
  v11 = v7;
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v12 = v78;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
  if (!v13)
    goto LABEL_16;
  v14 = *(_QWORD *)v105;
  v15 = MaxOrthographyLengthFromQuasarTemplate;
LABEL_10:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v105 != v14)
      objc_enumerationMutation(v12);
    objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * v16), "orthography");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length") > v15;

    if (v18)
      break;
    if (v13 == ++v16)
    {
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
      if (!v13)
      {
LABEL_16:

        v7 = v11;
        self = v10;
        goto LABEL_17;
      }
      goto LABEL_10;
    }
  }
  ++v10->_wordsRejected;

  v7 = v11;
LABEL_114:
  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v108.__r_.__value_.__l.__data_);
  if (SHIBYTE(v110) < 0)
    operator delete((void *)v109);

}

- (void)removeAllWords
{
  uint64_t v3;
  WordPronCache *value;
  uint64_t v5;
  WordPronCache *v6;

  quasar::LmePackedUserData::clear((quasar::LmePackedUserData *)&self->_userData);
  v3 = operator new();
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_QWORD *)(v3 + 64) = 0;
  *(_QWORD *)v3 = &off_1E5D35090;
  fst::SymbolTable::SymbolTable((fst::SymbolTable *)(v3 + 8));
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 24) = v3 + 32;
  *(_QWORD *)(v3 + 64) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 48) = v3 + 56;
  value = self->_outPronCache.__ptr_.__value_;
  self->_outPronCache.__ptr_.__value_ = (WordPronCache *)v3;
  if (value)
    (*(void (**)(WordPronCache *))(*(_QWORD *)value + 8))(value);
  *(_QWORD *)&self->_outPronCacheHits = 0;
  *(_QWORD *)&self->_wordsRejected = 0;
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear((uint64_t)&self->_quasarTemplate2Count);
  v5 = operator new();
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_QWORD *)(v5 + 64) = 0;
  *(_QWORD *)v5 = &off_1E5D35090;
  fst::SymbolTable::SymbolTable((fst::SymbolTable *)(v5 + 8));
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 24) = v5 + 32;
  *(_QWORD *)(v5 + 64) = 0;
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 48) = v5 + 56;
  v6 = self->_outEmbeddingCache.__ptr_.__value_;
  self->_outEmbeddingCache.__ptr_.__value_ = (WordPronCache *)v5;
  if (v6)
    (*(void (**)(WordPronCache *))(*(_QWORD *)v6 + 8))(v6);
  *(_QWORD *)&self->_outEmbeddingCacheHits = 0;
  std::__tree<std::vector<std::string>,quasar::NameEnumerator::EnumComparator,std::allocator<std::vector<std::string>>>::destroy((uint64_t)&self->_contactEnumSet, (char *)self->_contactEnumSet.__tree_.__pair1_.__value_.__left_);
  self->_contactEnumSet.__tree_.__pair1_.__value_.__left_ = 0;
  self->_contactEnumSet.__tree_.__pair3_.__value_ = 0;
  self->_contactEnumSet.__tree_.__begin_node_ = &self->_contactEnumSet.__tree_.__pair1_;
}

- (void)removeLmeDataForTemplateName:(id)a3
{
  id v4;
  void *v5;
  uint64_t **ptr;
  void *__p;
  char v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    ptr = (uint64_t **)self->_quasarLmeData.__ptr_;
    if (ptr)
    {
      objc_msgSend(v4, "ear_toString");
      quasar::LmeData::removeFstData(ptr, (const void **)&__p);
      if (v8 < 0)
        operator delete(__p);
    }
  }

}

- (NSString)userId
{
  return self->_unmaskedUserId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_unmaskedUserId, a3);
}

- (NSDictionary)templateToVersion
{
  void *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *p_pair1;
  void *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *left;
  void *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *v10;
  BOOL v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_templateToVersion.__tree_.__pair3_.__value_);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)self->_templateToVersion.__tree_.__begin_node_;
  p_pair1 = &self->_templateToVersion.__tree_.__pair1_;
  if (begin_node != &self->_templateToVersion.__tree_.__pair1_)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", begin_node[7].__value_.__left_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)left->__value_.__left_;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", left);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v6, v8);

      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)begin_node[1].__value_.__left_;
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)v9->__value_.__left_;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)begin_node[2].__value_.__left_;
          v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
  return (NSDictionary *)v3;
}

- (void)setTemplateToVersion:(id)a3
{
  id v4;
  uint64_t **p_templateToVersion;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14[2];
  uint64_t v15;
  void *__p[2];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_templateToVersion = (uint64_t **)&self->_templateToVersion;
  std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
  self->_templateToVersion.__tree_.__pair1_.__value_.__left_ = 0;
  self->_templateToVersion.__tree_.__pair3_.__value_ = 0;
  self->_templateToVersion.__tree_.__begin_node_ = &self->_templateToVersion.__tree_.__pair1_;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "ear_toString");
        }
        else
        {
          *(_OWORD *)v14 = 0uLL;
          v15 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "longLongValue");
        *(_OWORD *)__p = *(_OWORD *)v14;
        v13 = v15;
        v15 = 0;
        *(_OWORD *)v14 = 0uLL;
        v17 = v13;
        v18 = v12;
        std::__tree<std::__value_type<std::string,long long>,std::__map_value_compare<std::string,std::__value_type<std::string,long long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,long long>>(p_templateToVersion, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v17) < 0)
          operator delete(__p[0]);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

- (NSSet)experimentIds
{
  void *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *left;
  void *left_high;
  void *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v10;
  BOOL v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", self->_experimentIds.__tree_.__pair3_.__value_);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)self->_experimentIds.__tree_.__begin_node_;
  p_pair1 = &self->_experimentIds.__tree_.__pair1_;
  if (begin_node != &self->_experimentIds.__tree_.__pair1_)
  {
    do
    {
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[4].__value_.__left_;
        left_high = begin_node[5].__value_.__left_;
      }
      else
      {
        left = begin_node + 4;
        left_high = (void *)HIBYTE(begin_node[6].__value_.__left_);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", left, left_high);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[1].__value_.__left_;
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v9->__value_.__left_;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[2].__value_.__left_;
          v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
  return (NSSet *)v3;
}

- (void)setExperimentIds:(id)a3
{
  id v4;
  uint64_t **p_experimentIds;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *__p[2];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_experimentIds = (uint64_t **)&self->_experimentIds;
  std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
  self->_experimentIds.__tree_.__pair1_.__value_.__left_ = 0;
  self->_experimentIds.__tree_.__pair3_.__value_ = 0;
  self->_experimentIds.__tree_.__begin_node_ = &self->_experimentIds.__tree_.__pair1_;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          objc_msgSend(v10, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v12 = 0;
        }
        std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>(p_experimentIds, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v12) < 0)
          operator delete(__p[0]);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (BOOL)_writeProfileToStream:(void *)a3
{
  char *v5;
  int v6;
  LmeData *v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  NSString *unmaskedUserId;
  LmeData *v12;
  LmeData *v13;
  NSString *language;
  LmeData *v15;
  WordPronCache *value;
  WordPronCache *v17;
  G2Embedding *v18;
  LmeDataFactory *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  const std::string::value_type *i;
  _QWORD *v28;
  std::string *v29;
  std::string::size_type size;
  _QWORD *v31;
  LmeDataFactory *v32;
  WordPronCache *v33;
  unint64_t *v34;
  unint64_t v35;
  WordPronCache *v36;
  int v37;
  WordPronCache *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  WordPronCache *v42;
  BOOL v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  unint64_t *p_shared_owners;
  unint64_t v47;
  unint64_t v48;
  LmeData *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  char *v56;
  int v57;
  LmeData *v58;
  const std::string *SpeechModelInfo;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v69[3];
  std::string v70;
  uint64_t v71[3];
  LmeData *v72;
  std::__shared_weak_count *v73;
  WordPronCache *v74;
  LmeData *v75;
  std::__shared_weak_count *v76;
  WordPronCache *v77;
  std::string v78;
  int v79;
  int v80;
  uint64_t v81;
  std::__shared_weak_count *v82;
  int v83[12];
  char **v84;
  char *v85[2];
  char **v86;
  char *v87[2];
  uint64_t v88;
  std::__shared_weak_count *v89;
  LmeData *ptr;
  __shared_weak_count *v91;
  _BYTE __str[32];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3 + *(_QWORD *)(*(_QWORD *)a3 - 24);
  if ((v5[32] & 5) != 0)
  {
    v6 = -1;
  }
  else
  {
    (*(void (**)(_BYTE *__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**((_QWORD **)v5 + 5) + 32))(__str, *((_QWORD *)v5 + 5), 0, 1, 16);
    v6 = v99;
  }
  if (self->_reuseProfile && (v7 = self->_quasarLmeData.__ptr_) != 0)
  {
    cntrl = self->_quasarLmeData.__cntrl_;
    ptr = self->_quasarLmeData.__ptr_;
    v91 = cntrl;
    if (cntrl)
    {
      v9 = (unint64_t *)((char *)cntrl + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
  }
  else
  {
    _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&ptr);
    v7 = ptr;
  }
  unmaskedUserId = self->_unmaskedUserId;
  if (unmaskedUserId)
    -[NSString ear_toString](unmaskedUserId, "ear_toString");
  else
    memset(__str, 0, 24);
  std::string::operator=((std::string *)((char *)v7 + 272), (const std::string *)__str);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  v12 = ptr;
  if ((map<std::string, long long, std::less<std::string>, std::allocator<std::pair<const std::string, long long>>> *)((char *)ptr + 344) != &self->_templateToVersion)
  {
    std::__tree<std::__value_type<std::string,long long>,std::__map_value_compare<std::string,std::__value_type<std::string,long long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long long>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,long long>,std::__tree_node<std::__value_type<std::string,long long>,void *> *,long>>((uint64_t **)ptr + 43, (_QWORD *)self->_templateToVersion.__tree_.__begin_node_, &self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
    v12 = ptr;
  }
  quasar::SystemConfig::getLmeAssetPath((quasar::SystemConfig *)((char *)self->_dataFactory.__ptr_ + 192), (std::string *)__str);
  std::string::operator=((std::string *)((char *)v12 + 296), (const std::string *)__str);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  v13 = ptr;
  language = self->_language;
  if (language)
    -[NSString ear_toString](language, "ear_toString");
  else
    memset(__str, 0, 24);
  std::string::operator=((std::string *)((char *)v13 + 320), (const std::string *)__str);
  if ((__str[23] & 0x80000000) != 0)
    operator delete(*(void **)__str);
  v15 = ptr;
  if ((set<std::string, std::less<std::string>, std::allocator<std::string>> *)((char *)ptr + 368) != &self->_experimentIds)
  {
    std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>((uint64_t **)ptr + 46, (_QWORD *)self->_experimentIds.__tree_.__begin_node_, &self->_experimentIds.__tree_.__pair1_.__value_.__left_);
    v15 = ptr;
  }
  quasar::WordPronCache::removeWordsWithoutTemplates((uint64_t **)v15 + 2, 1);
  quasar::WordPronCache::removeWordsWithoutTemplates((uint64_t **)ptr + 11, 0);
  if (!self->_userData.data.__tree_.__pair3_.__value_)
  {
    v45 = *((_QWORD *)ptr + 28);
    v44 = (std::__shared_weak_count *)*((_QWORD *)ptr + 29);
    if (!v44)
      goto LABEL_76;
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v47 = __ldxr(p_shared_owners);
    while (__stxr(v47 + 1, p_shared_owners));
    do
      v48 = __ldaxr(p_shared_owners);
    while (__stlxr(v48 - 1, p_shared_owners));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
      if (!v45)
      {
LABEL_77:
        v49 = ptr;
        fst::SymbolTable::SymbolTable((fst::SymbolTable *)__str);
        v83[0] = 3;
        std::allocate_shared[abi:ne180100]<quasar::QsrTextSymbolTable,std::allocator<quasar::QsrTextSymbolTable>,fst::SymbolTable,quasar::TextEncoding,void>((uint64_t)__str, v83, &v88);
        std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100]((_QWORD *)v49 + 28, &v88);
        v50 = v89;
        if (v89)
        {
          v51 = (unint64_t *)&v89->__shared_owners_;
          do
            v52 = __ldaxr(v51);
          while (__stlxr(v52 - 1, v51));
          if (!v52)
          {
            ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
            std::__shared_weak_count::__release_weak(v50);
          }
        }
        fst::SymbolTable::~SymbolTable((fst::SymbolTable *)__str);
      }
    }
    else
    {
LABEL_76:
      if (!v45)
        goto LABEL_77;
    }
    v58 = ptr;
    SpeechModelInfo = (const std::string *)quasar::SystemConfig::getSpeechModelInfo((quasar::SystemConfig *)((char *)self->_dataFactory.__ptr_ + 192));
    std::string::operator=((std::string *)((char *)v58 + 176), SpeechModelInfo + 6);
    quasar::LmeData::toStream((uint64_t)ptr, a3, 19);
    v43 = 1;
    goto LABEL_107;
  }
  value = self->_outPronCache.__ptr_.__value_;
  if (value)
    quasar::WordPronCache::copyTemplateDeltaTo((quasar::WordPronCache *)((char *)ptr + 16), (quasar::WordPronCache *)value, 1);
  v17 = self->_outEmbeddingCache.__ptr_.__value_;
  if (v17)
  {
    quasar::WordPronCache::copyTemplateDeltaTo((quasar::WordPronCache *)((char *)ptr + 88), (quasar::WordPronCache *)v17, 0);
    v18 = self->_g2emb.__ptr_.__value_;
    if (v18)
      quasar::G2Embedding::computeEmbeddings((quasar::G2Embedding *)v18, (quasar::WordPronCache *)self->_outEmbeddingCache.__ptr_.__value_);
  }
  if (!self->_reuseProfile)
  {
    *(_OWORD *)__str = 0uLL;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_quasarLmeData, (__int128 *)__str);
    v53 = *(std::__shared_weak_count **)&__str[8];
    if (*(_QWORD *)&__str[8])
    {
      v54 = (unint64_t *)(*(_QWORD *)&__str[8] + 8);
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
  }
  v87[0] = 0;
  v87[1] = 0;
  v85[1] = 0;
  v86 = v87;
  v84 = v85;
  v85[0] = 0;
  memset(v83, 0, 32);
  v83[8] = 1065353216;
  v19 = self->_dataFactory.__ptr_;
  v81 = 0;
  v82 = 0;
  (*(void (**)(LmeDataFactory *, uint64_t *))(*(_QWORD *)v19 + 48))(v19, &v81);
  v20 = v82;
  if (v82)
  {
    v21 = (unint64_t *)&v82->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v80 = 0;
  if (quasar::gLogLevel >= 4)
  {
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v93 = 0u;
    memset(__str, 0, sizeof(__str));
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__str);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__str, (uint64_t)"Getting LME data: outPronCacheHits ", 35);
    v23 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)" outPronCacheMisses ", 20);
    v24 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)" wordsRejected ", 15);
    v25 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)" wordsAccepted ", 15);
    v26 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)" contactEnumSetSize ", 20);
    std::ostream::operator<<();
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__str);
  }
  for (i = (const std::string::value_type *)self->_quasarTemplate2Count.__table_.__p1_.__value_.__next_;
        i;
        i = *(const std::string::value_type **)i)
  {
    if (i[39] < 0)
      std::string::__init_copy_ctor_external(&v78, *((const std::string::value_type **)i + 2), *((_QWORD *)i + 3));
    else
      v78 = *(std::string *)(i + 16);
    v79 = *((_DWORD *)i + 10);
    if (quasar::gLogLevel >= 4)
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v93 = 0u;
      memset(__str, 0, sizeof(__str));
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__str);
      v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__str, (uint64_t)"quasarTemplate2Count[", 21);
      if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = &v78;
      else
        v29 = (std::string *)v78.__r_.__value_.__r.__words[0];
      if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v78.__r_.__value_.__r.__words[2]);
      else
        size = v78.__r_.__value_.__l.__size_;
      v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)v29, size);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"]: ", 3);
      std::ostream::operator<<();
      quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__str);
    }
    if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v78.__r_.__value_.__l.__data_);
  }
  v32 = self->_dataFactory.__ptr_;
  *(_OWORD *)&__str[8] = 0uLL;
  *(_QWORD *)__str = &__str[8];
  v33 = self->_outPronCache.__ptr_.__value_;
  self->_outPronCache.__ptr_.__value_ = 0;
  v75 = ptr;
  v76 = (std::__shared_weak_count *)v91;
  v77 = v33;
  if (v91)
  {
    v34 = (unint64_t *)((char *)v91 + 8);
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }
  v36 = self->_outEmbeddingCache.__ptr_.__value_;
  self->_outEmbeddingCache.__ptr_.__value_ = 0;
  v74 = v36;
  v37 = (*(uint64_t (**)(LmeDataFactory *, _BYTE *, _QWORD, void *, char ***, char ***, int *, int *, WordPronCache **, LmeData **, LmePackedUserData *, WordPronCache **))(*(_QWORD *)v32 + 24))(v32, __str, 0, a3, &v86, &v84, v83, &v80, &v77, &v75, &self->_userData, &v74);
  v38 = v74;
  v74 = 0;
  if (v38)
    (*(void (**)(WordPronCache *))(*(_QWORD *)v38 + 8))(v38);
  v39 = v76;
  if (v76)
  {
    v40 = (unint64_t *)&v76->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  v42 = v77;
  v77 = 0;
  if (v42)
    (*(void (**)(WordPronCache *))(*(_QWORD *)v42 + 8))(v42);
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)__str, *(_QWORD **)&__str[8]);
  v43 = v37 == 0;
  if (v37)
  {
    if (quasar::gLogLevel >= 4)
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v93 = 0u;
      memset(__str, 0, sizeof(__str));
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__str);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__str, (uint64_t)"Could not get LME data", 22);
      std::ostream::operator<<();
      quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__str);
    }
  }
  else
  {
    v56 = (char *)a3 + *(_QWORD *)(*(_QWORD *)a3 - 24);
    if ((v56[32] & 5) != 0)
    {
      v57 = -1;
    }
    else
    {
      (*(void (**)(_BYTE *__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**((_QWORD **)v56 + 5) + 32))(__str, *((_QWORD *)v56 + 5), 0, 1, 16);
      v57 = v99;
    }
    v72 = ptr;
    v73 = (std::__shared_weak_count *)v91;
    if (v91)
    {
      v60 = (unint64_t *)((char *)v91 + 8);
      do
        v61 = __ldxr(v60);
      while (__stxr(v61 + 1, v60));
    }
    std::map<std::string,int>::map[abi:ne180100](v71, (const void ***)&v84);
    -[_EARUserProfileBuilder _logSpeechProfileUpdatedEventWithLmeData:sizeInBytes:numEnumeratedEntries:](self, "_logSpeechProfileUpdatedEventWithLmeData:sizeInBytes:numEnumeratedEntries:", &v72, (v57 - v6), v71);
    std::__tree<std::string>::destroy((uint64_t)v71, (char *)v71[1]);
    v62 = v73;
    if (v73)
    {
      v63 = (unint64_t *)&v73->__shared_owners_;
      do
        v64 = __ldaxr(v63);
      while (__stlxr(v64 - 1, v63));
      if (!v64)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
    }
    if (*((char *)ptr + 343) < 0)
      std::string::__init_copy_ctor_external(&v70, *((const std::string::value_type **)ptr + 40), *((_QWORD *)ptr + 41));
    else
      v70 = *(std::string *)((char *)ptr + 320);
    std::map<std::string,int>::map[abi:ne180100](v69, (const void ***)&v84);
    -[_EARUserProfileBuilder _logLmeSlotUpdatedEventsWithLanguage:numEnumeratedEntries:](self, "_logLmeSlotUpdatedEventsWithLanguage:numEnumeratedEntries:", &v70, v69);
    std::__tree<std::string>::destroy((uint64_t)v69, (char *)v69[1]);
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v70.__r_.__value_.__l.__data_);
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v83);
  std::__tree<std::string>::destroy((uint64_t)&v84, v85[0]);
  std::__tree<std::string>::destroy((uint64_t)&v86, v87[0]);
LABEL_107:
  v65 = (std::__shared_weak_count *)v91;
  if (v91)
  {
    v66 = (unint64_t *)((char *)v91 + 8);
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  return v43;
}

- (id)dataProfile
{
  void **v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *__p[2];
  unsigned __int8 v9;
  _QWORD v10[2];
  _QWORD v11[11];
  char v12;
  uint64_t v13;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  if (-[_EARUserProfileBuilder _writeProfileToStream:](self, "_writeProfileToStream:", v11))
  {
    std::stringbuf::str();
    if ((v9 & 0x80u) == 0)
      v3 = __p;
    else
      v3 = (void **)__p[0];
    if ((v9 & 0x80u) == 0)
      v4 = v9;
    else
      v4 = (unint64_t)__p[1];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((char)v9 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v5 = 0;
  }
  v10[0] = *MEMORY[0x1E0DE4F50];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v10 + *(_QWORD *)(v10[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v11[0] = v6;
  v11[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v12 < 0)
    operator delete((void *)v11[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1AF44D094](&v13);
  return v5;
}

- (BOOL)writeProfileToFile:(id)a3 protectionClass:(int64_t)a4 length:(unint64_t *)a5 error:(id *)a6
{
  return -[_EARUserProfileBuilder writeProfileToFile:protectionClass:coordinated:length:error:](self, "writeProfileToFile:protectionClass:coordinated:length:error:", a3, a4, 1, a5, a6);
}

- (BOOL)writeProfileToFile:(id)a3 protectionClass:(int64_t)a4 coordinated:(BOOL)a5 length:(unint64_t *)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  void *v13;
  std::string::size_type size;
  NSObject *v15;
  BOOL v16;
  std::string *v17;
  std::string *v18;
  _BOOL8 is_directory;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  EARLogger *v27;
  NSObject *v28;
  uint64_t v29;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[6];
  std::string v35;
  std::string __p;
  int64_t v37;
  unint64_t *v38;
  std::string v39;
  std::string v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[8];
  uint8_t *v46;
  uint64_t v47;
  _QWORD *(*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  void *v50;
  _QWORD v51[13];
  char v52;
  uint64_t v53;
  uint8_t v54[4];
  void *v55;
  __int16 v56;
  int64_t v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  _BOOL4 v61;
  uint64_t v62;

  v9 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = v12;
  if (a6)
    *a6 = 0;
  if (objc_msgSend(v12, "length"))
  {
    *(_QWORD *)buf = 0;
    v46 = buf;
    v47 = 0x14812000000;
    v48 = __Block_byref_object_copy__1;
    v49 = __Block_byref_object_dispose__1;
    v50 = &unk_1AE30551B;
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v51);
    if (-[_EARUserProfileBuilder _writeProfileToStream:](self, "_writeProfileToStream:", v46 + 64))
    {
      v41 = 0;
      v42 = &v41;
      v43 = 0x2020000000;
      v44 = 0;
      if (v13)
      {
        objc_msgSend(v13, "ear_toString");
        if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(v40.__r_.__value_.__r.__words[2]);
        else
          size = v40.__r_.__value_.__l.__size_;
      }
      else
      {
        size = 0;
        memset(&v40, 0, sizeof(v40));
      }
      v17 = &v39;
      std::string::basic_string[abi:ne180100]((uint64_t)&v39, size + 4);
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v17 = (std::string *)v39.__r_.__value_.__r.__words[0];
      if (size)
      {
        if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v18 = &v40;
        else
          v18 = (std::string *)v40.__r_.__value_.__r.__words[0];
        memmove(v17, v18, size);
      }
      strcpy((char *)v17 + size, ".tmp");
      is_directory = quasar::filesystem::is_directory((char *)&v40);
      if (is_directory)
      {
        EARLogger::QuasarOSLogger((EARLogger *)is_directory);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v54 = 0;
          _os_log_impl(&dword_1AD756000, v20, OS_LOG_TYPE_INFO, "Cannot write profile: path points to a directory", v54, 2u);
        }

        v16 = 0;
      }
      else
      {
        quasar::filesystem::remove((char *)&v39);
        v21 = MEMORY[0x1E0C809B0];
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3321888768;
        v34[2] = __86___EARUserProfileBuilder_writeProfileToFile_protectionClass_coordinated_length_error___block_invoke;
        v34[3] = &unk_1E5D468B0;
        v34[4] = buf;
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v35, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
        else
          v35 = v39;
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&__p, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
        else
          __p = v40;
        v37 = a4;
        v38 = a6;
        v34[5] = &v41;
        v22 = MEMORY[0x1AF44E144](v34);
        v23 = (void *)v22;
        if (v9)
        {
          objc_msgSend(v13, "stringByDeletingLastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v24, 1, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = v21;
          v32[1] = 3221225472;
          v32[2] = __86___EARUserProfileBuilder_writeProfileToFile_protectionClass_coordinated_length_error___block_invoke_90;
          v32[3] = &unk_1E5D46DD0;
          v33 = v23;
          objc_msgSend(v25, "coordinateWritingItemAtURL:options:error:byAccessor:", v26, 4, a7, v32);

        }
        else
        {
          v27 = (EARLogger *)(*(uint64_t (**)(uint64_t))(v22 + 16))(v22);
        }
        v16 = *((_BYTE *)v42 + 24) != 0;
        if (*((_BYTE *)v42 + 24))
        {
          EARLogger::QuasarOSLogger(v27);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v54 = 138478339;
            v55 = v13;
            v56 = 2048;
            v57 = a4;
            v58 = 1024;
            LODWORD(v59) = v9;
            _os_log_impl(&dword_1AD756000, v28, OS_LOG_TYPE_INFO, "Persisted speech profile to path=%{private}@ protectionClass=%ld coordinated=%d", v54, 0x1Cu);
          }
        }
        else
        {
          EARLogger::QuasarOSLogger(v27);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            if (a7)
              v31 = *a7;
            else
              v31 = 0;
            *(_DWORD *)v54 = 138478595;
            v55 = v13;
            v56 = 2114;
            v57 = (int64_t)v31;
            v58 = 2048;
            v59 = a4;
            v60 = 1024;
            v61 = v9;
            _os_log_error_impl(&dword_1AD756000, v28, OS_LOG_TYPE_ERROR, "Persisting speech profile to path=%{private}@ failed with error=%{public}@ protectionClass=%ld coordinated=%d", v54, 0x26u);
          }
        }

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v35.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v39.__r_.__value_.__l.__data_);
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v40.__r_.__value_.__l.__data_);
      _Block_object_dispose(&v41, 8);
    }
    else
    {
      v16 = 0;
    }
    _Block_object_dispose(buf, 8);
    v51[0] = *MEMORY[0x1E0DE4F50];
    v29 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
    *(_QWORD *)((char *)v51 + *(_QWORD *)(v51[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
    v51[2] = v29;
    v51[3] = MEMORY[0x1E0DE4FB8] + 16;
    if (v52 < 0)
      operator delete((void *)v51[11]);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x1AF44D094](&v53);
  }
  else
  {
    EARLogger::QuasarOSLogger(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_INFO, "Cannot write profile: path is empty", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)readUserProfile:(id)a3 reuseProfile:(BOOL)a4
{
  self->_reuseProfile = a4;
  -[_EARUserProfileBuilder readUserProfile:](self, "readUserProfile:", a3);
}

- (void)readUserProfile:(id)a3
{
  EARHelpers *v4;
  uint64_t **p_templateToVersion;
  uint64_t **p_experimentIds;
  shared_ptr<quasar::LmeData> *p_quasarLmeData;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  LmeData *ptr;
  EARHelpers::NSDataInputStream *v12;
  __int128 v13[17];
  std::string v14;
  EARHelpers::NSDataInputStream *v15;

  v4 = (EARHelpers *)a3;
  if (v4)
  {
    p_templateToVersion = (uint64_t **)&self->_templateToVersion;
    std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
    self->_templateToVersion.__tree_.__pair1_.__value_.__left_ = 0;
    self->_templateToVersion.__tree_.__pair3_.__value_ = 0;
    self->_templateToVersion.__tree_.__begin_node_ = &self->_templateToVersion.__tree_.__pair1_;
    p_experimentIds = (uint64_t **)&self->_experimentIds;
    std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
    self->_experimentIds.__tree_.__pair1_.__value_.__left_ = 0;
    self->_experimentIds.__tree_.__pair3_.__value_ = 0;
    self->_experimentIds.__tree_.__begin_node_ = &self->_experimentIds.__tree_.__pair1_;
    EARHelpers::createNSDataInputStream(v4, &v15);
    _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v13);
    p_quasarLmeData = &self->_quasarLmeData;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_quasarLmeData, v13);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v13[0] + 1);
    if (*((_QWORD *)&v13[0] + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v13[0] + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    quasar::SystemConfig::getLmeAssetPath((quasar::SystemConfig *)((char *)self->_dataFactory.__ptr_ + 192), &v14);
    if ((quasar::LmeData::fromStream((uint64_t)p_quasarLmeData->__ptr_, (uint64_t *)v15, 0, (unsigned __int8 *)&v14) & 0xFFFFFFFD) == 1)
    {
      ptr = p_quasarLmeData->__ptr_;
      if (p_templateToVersion != (uint64_t **)p_quasarLmeData->__ptr_ + 43)
      {
        std::__tree<std::__value_type<std::string,long long>,std::__map_value_compare<std::string,std::__value_type<std::string,long long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long long>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,long long>,std::__tree_node<std::__value_type<std::string,long long>,void *> *,long>>(p_templateToVersion, *((_QWORD **)ptr + 43), (_QWORD *)ptr + 44);
        ptr = p_quasarLmeData->__ptr_;
      }
      if (p_experimentIds != (uint64_t **)((char *)ptr + 368))
        std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(p_experimentIds, *((_QWORD **)ptr + 46), (_QWORD *)ptr + 47);
    }
    else
    {
      if (quasar::gLogLevel >= 4)
      {
        memset(v13, 0, sizeof(v13));
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v13);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"Failed to read quasar pronunciation cache from profile blob with error : ", 73);
        std::ostream::operator<<();
        quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v13);
      }
      std::shared_ptr<quasar::LmeData>::reset[abi:ne180100](p_quasarLmeData);
    }
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
    v12 = v15;
    v15 = 0;
    if (v12)
      (*(void (**)(EARHelpers::NSDataInputStream *))(*(_QWORD *)v12 + 8))(v12);
  }

}

- (void)readUserProfileWithPath:(id)a3 reuseProfile:(BOOL)a4
{
  self->_reuseProfile = a4;
  -[_EARUserProfileBuilder readUserProfileWithPath:](self, "readUserProfileWithPath:", a3);
}

- (void)readUserProfileWithPath:(id)a3
{
  id v4;
  uint64_t **p_templateToVersion;
  uint64_t **p_experimentIds;
  shared_ptr<quasar::LmeData> *p_quasarLmeData;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  LmeData *ptr;
  void *__p[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  std::string v29;
  uint64_t v30[2];
  uint64_t v31;
  _QWORD v32[20];

  v32[19] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_templateToVersion = (uint64_t **)&self->_templateToVersion;
    std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
    self->_templateToVersion.__tree_.__pair1_.__value_.__left_ = 0;
    self->_templateToVersion.__tree_.__pair3_.__value_ = 0;
    self->_templateToVersion.__tree_.__begin_node_ = &self->_templateToVersion.__tree_.__pair1_;
    p_experimentIds = (uint64_t **)&self->_experimentIds;
    std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
    self->_experimentIds.__tree_.__pair1_.__value_.__left_ = 0;
    self->_experimentIds.__tree_.__pair3_.__value_ = 0;
    self->_experimentIds.__tree_.__begin_node_ = &self->_experimentIds.__tree_.__pair1_;
    objc_msgSend(v4, "ear_toString");
    std::ifstream::basic_ifstream(v30);
    if (SBYTE7(v13) < 0)
      operator delete(__p[0]);
    _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(__p);
    p_quasarLmeData = &self->_quasarLmeData;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_quasarLmeData, (__int128 *)__p);
    v8 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v9 = (unint64_t *)((char *)__p[1] + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    quasar::SystemConfig::getLmeAssetPath((quasar::SystemConfig *)((char *)self->_dataFactory.__ptr_ + 192), &v29);
    if ((quasar::LmeData::fromStream((uint64_t)p_quasarLmeData->__ptr_, v30, 0, (unsigned __int8 *)&v29) & 0xFFFFFFFD) == 1)
    {
      ptr = p_quasarLmeData->__ptr_;
      if (p_templateToVersion != (uint64_t **)p_quasarLmeData->__ptr_ + 43)
      {
        std::__tree<std::__value_type<std::string,long long>,std::__map_value_compare<std::string,std::__value_type<std::string,long long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long long>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,long long>,std::__tree_node<std::__value_type<std::string,long long>,void *> *,long>>(p_templateToVersion, *((_QWORD **)ptr + 43), (_QWORD *)ptr + 44);
        ptr = p_quasarLmeData->__ptr_;
      }
      if (p_experimentIds != (uint64_t **)((char *)ptr + 368))
        std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(p_experimentIds, *((_QWORD **)ptr + 46), (_QWORD *)ptr + 47);
    }
    else
    {
      if (quasar::gLogLevel >= 4)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        *(_OWORD *)__p = 0u;
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Failed to read quasar pronunciation cache from profile blob with error : ", 73);
        std::ostream::operator<<();
        quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__p);
      }
      std::shared_ptr<quasar::LmeData>::reset[abi:ne180100](p_quasarLmeData);
    }
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v29.__r_.__value_.__l.__data_);
    v30[0] = *MEMORY[0x1E0DE4F40];
    *(uint64_t *)((char *)v30 + *(_QWORD *)(v30[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
    MEMORY[0x1AF44CA70](&v31);
    std::istream::~istream();
    MEMORY[0x1AF44D094](v32);
  }

}

- (void)addPersonalizationData:(id)a3
{
  id v5;
  PersonalizationRecipe *value;
  __int128 *v7;
  uint64_t **p_userData;
  __int128 *v9;
  __int128 *v10;
  BOOL v11;
  void *v12;
  std::string __p;
  const quasar::LmeDataFactoryBase::Word **v14[3];
  uint64_t v15[3];
  __int128 *v16;
  _QWORD *v17[2];
  const void **v18[3];
  const quasar::LmeDataFactoryBase::Word ***v19;

  v5 = a3;
  if (self->_personalizationRecipe.__ptr_.__value_)
  {
    if (!self->_tokenizer.__ptr_.__value_)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EARUserProfileBuilder.mm"), 934, CFSTR("Tokenizer is invoked after explicit release!"));

    }
    EARHelpers::QuasarPersonalizedInputFromEARPersonalizedInput(v5, (uint64_t)v18);
    value = self->_personalizationRecipe.__ptr_.__value_;
    std::map<std::string,std::map<std::string,int>>::map[abi:ne180100](v15, v18);
    quasar::PersonalizationRecipe::getPersonalizedData((uint64_t)value, v15, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, (uint64_t)&v16);
    std::__tree<std::__value_type<std::string,std::map<std::string,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,int>>>>::destroy((uint64_t)v15, (_QWORD *)v15[1]);
    v7 = v16;
    if (v16 != (__int128 *)v17)
    {
      p_userData = (uint64_t **)&self->_userData;
      do
      {
        std::pair<std::string const,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>::pair[abi:ne180100](&__p, v7 + 2);
        quasar::LmePackedUserData::addUnpackedEntities(p_userData, (__int128 *)&__p, v14);
        v19 = v14;
        std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v19);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v9 = (__int128 *)*((_QWORD *)v7 + 1);
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = *(__int128 **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (__int128 *)*((_QWORD *)v7 + 2);
            v11 = *(_QWORD *)v10 == (_QWORD)v7;
            v7 = v10;
          }
          while (!v11);
        }
        v7 = v10;
      }
      while (v10 != (__int128 *)v17);
    }
    std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)&v16, v17[0]);
    std::__tree<std::__value_type<std::string,std::map<std::string,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,int>>>>::destroy((uint64_t)v18, v18[1]);
  }

}

- (void)addPersonalizationJsonData:(id)a3
{
  id v5;
  void *v6;
  PersonalizationRecipe *value;
  void *v8;
  PersonalizationRecipe *v9;
  __int128 *v10;
  uint64_t **p_userData;
  __int128 *v12;
  __int128 *v13;
  BOOL v14;
  std::string __p;
  const quasar::LmeDataFactoryBase::Word **v16[3];
  uint64_t v17[3];
  __int128 *v18;
  _QWORD *v19[2];
  const void **v20[3];
  const quasar::LmeDataFactoryBase::Word ***v21;

  v5 = a3;
  v6 = v5;
  value = self->_personalizationRecipe.__ptr_.__value_;
  if (!value)
    goto LABEL_20;
  if (!self->_tokenizer.__ptr_.__value_)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EARUserProfileBuilder.mm"), 951, CFSTR("Tokenizer is invoked after explicit release!"));

    value = self->_personalizationRecipe.__ptr_.__value_;
    if (v6)
      goto LABEL_4;
LABEL_6:
    memset(&__p, 0, sizeof(__p));
    goto LABEL_7;
  }
  if (!v5)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v6, "ear_toString");
LABEL_7:
  quasar::getInputDataFromJson((uint64_t)value, (__int128 *)&__p, (uint64_t)v20);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = self->_personalizationRecipe.__ptr_.__value_;
  std::map<std::string,std::map<std::string,int>>::map[abi:ne180100](v17, v20);
  quasar::PersonalizationRecipe::getPersonalizedData((uint64_t)v9, v17, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, (uint64_t)&v18);
  std::__tree<std::__value_type<std::string,std::map<std::string,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,int>>>>::destroy((uint64_t)v17, (_QWORD *)v17[1]);
  v10 = v18;
  if (v18 != (__int128 *)v19)
  {
    p_userData = (uint64_t **)&self->_userData;
    do
    {
      std::pair<std::string const,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>::pair[abi:ne180100](&__p, v10 + 2);
      quasar::LmePackedUserData::addUnpackedEntities(p_userData, (__int128 *)&__p, v16);
      v21 = v16;
      std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v12 = (__int128 *)*((_QWORD *)v10 + 1);
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = *(__int128 **)v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (__int128 *)*((_QWORD *)v10 + 2);
          v14 = *(_QWORD *)v13 == (_QWORD)v10;
          v10 = v13;
        }
        while (!v14);
      }
      v10 = v13;
    }
    while (v13 != (__int128 *)v19);
  }
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)&v18, v19[0]);
  std::__tree<std::__value_type<std::string,std::map<std::string,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,int>>>>::destroy((uint64_t)v20, v20[1]);
LABEL_20:

}

- (void)writeOutUserDataToJson:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  id v8;
  _OWORD v9[2];
  int v10;
  uint64_t v11[3];
  __int128 __p;
  uint64_t v13;
  _BYTE v14[1544];

  v6 = a3;
  v7 = a4;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v14);
  v8 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "fileSystemRepresentation"));
  memset(v11, 0, sizeof(v11));
  memset(v9, 0, sizeof(v9));
  v10 = 1065353216;
  quasar::SystemConfig::readJsonFile((uint64_t)v14, (uint64_t)&__p, v11, (uint64_t)v9, 0, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v9);
  *(_QWORD *)&v9[0] = v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);
  if (SHIBYTE(v13) < 0)
    operator delete((void *)__p);
  quasar::LmePackedUserData::unpacked((quasar::LmePackedUserData *)&self->_userData, (uint64_t)v9);
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    __p = 0uLL;
    v13 = 0;
  }
  quasar::writeUserDataToJsonFile((uint64_t)v14, v9, &__p);
  if (SHIBYTE(v13) < 0)
    operator delete((void *)__p);
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)v9, *((_QWORD **)&v9[0] + 1));
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v14);

}

- (id)pronunciationsForOrthography:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  void *__p[2];
  char v17;
  void *v18[2];
  char v19;
  void *v20[2];
  uint64_t v21;
  void *v22[2];
  uint64_t v23;
  _QWORD v24[3];

  v4 = a3;
  quasar::LmeDataFactoryBase::PronSet::PronSet(v24);
  v22[0] = 0;
  v22[1] = 0;
  v23 = 0;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v20[0] = 0;
    v20[1] = 0;
    v21 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v18, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  -[_EARUserProfileBuilder _pronunciationsForOrthography:phoneticOrthography:templateName:pronunciations:pronRequest:outOrthography:](self, "_pronunciationsForOrthography:phoneticOrthography:templateName:pronunciations:pronRequest:outOrthography:", v20, v18, __p, v24, 0, v22);
  if (v17 < 0)
    operator delete(__p[0]);
  if (v19 < 0)
    operator delete(v18[0]);
  if (SHIBYTE(v21) < 0)
    operator delete(v20[0]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  quasar::Bitmap::~Bitmap((quasar::Bitmap *)v24);
  v7 = v6 + 1;
  v8 = (_QWORD *)*v6;
  if ((_QWORD *)*v6 != v6 + 1)
  {
    do
    {
      if (*((char *)v8 + 63) < 0)
      {
        v9 = (_QWORD *)v8[5];
        v10 = v8[6];
      }
      else
      {
        v9 = v8 + 5;
        v10 = *((unsigned __int8 *)v8 + 63);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

      v12 = (_QWORD *)v8[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)v8[2];
          v14 = *v13 == (_QWORD)v8;
          v8 = v13;
        }
        while (!v14);
      }
      v8 = v13;
    }
    while (v13 != v7);
  }
  if (SHIBYTE(v23) < 0)
    operator delete(v22[0]);
  std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)v24, (char *)v24[1]);

  return v5;
}

- (void)_pronunciationsForOrthography:(const void *)a3 phoneticOrthography:(const void *)a4 templateName:(const void *)a5 pronunciations:(void *)a6 pronRequest:(int)a7 outOrthography:(void *)a8
{
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  __int128 *v19;
  std::string *v20;
  __int128 v21;
  std::string *v22;
  _QWORD *v23;
  _QWORD *v24;
  BOOL v25;
  std::string *v26;
  __int128 v27;
  std::string *v28;
  std::string::size_type v29;
  uint64_t v30;
  std::string *p_p;
  std::string::size_type size;
  uint64_t **value;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  std::string *v38;
  WordPronCache *v39;
  char *v40;
  std::string::size_type v41;
  std::string::size_type v42;
  char *v43;
  std::string::size_type v44;
  std::string::size_type v45;
  WordPronCache *v46;
  uint64_t v47;
  std::string::size_type v48;
  std::string::size_type v49;
  std::string *v50;
  std::string *v51;
  uint64_t v52;
  std::string::size_type v53;
  uint64_t v54;
  int v55;
  std::string::size_type v56;
  unsigned __int8 *v57;
  std::string *v58;
  uint64_t v59;
  std::string::size_type v60;
  uint64_t v61;
  int v62;
  std::string::size_type v63;
  unsigned __int8 *v64;
  std::string *p_str;
  WordPronCache *v66;
  char *v67;
  std::string::size_type v68;
  std::string::size_type v69;
  void **v70;
  void **p_data;
  WordPronCache *v72;
  char *v73;
  std::string::size_type v74;
  std::string::size_type v75;
  void *v76;
  void *v78[2];
  char v79;
  std::string v80;
  void *v81[2];
  char v82;
  std::string v83;
  void *v84[2];
  char v85;
  std::string v86;
  void *v87[2];
  char v88;
  std::string v89;
  std::string v90;
  void *v91;
  char v92;
  char *v93[3];
  void *v94[2];
  char v95;
  std::string v96;
  std::string *v97;
  std::string *v98;
  void *v99[2];
  char v100;
  std::string v101;
  std::string __p;
  void *v103;
  float v104;
  char v105;
  uint64_t v106;
  char *v107;
  std::string v108;
  std::string v109;
  std::string __str;
  std::string *v111;
  std::string *v112;
  unint64_t v113;
  std::string **v114;

  std::string::operator=((std::string *)a8, (const std::string *)a3);
  v15 = *((unsigned __int8 *)a3 + 23);
  if ((v15 & 0x80u) != 0)
    v15 = *((_QWORD *)a3 + 1);
  if (v15)
  {
    v111 = 0;
    v112 = 0;
    v113 = 0;
    quasar::Bitmap::~Bitmap((quasar::Bitmap *)a6);
    v18 = v16 + 1;
    v17 = (_QWORD *)*v16;
    if ((_QWORD *)*v16 != v16 + 1)
    {
      do
      {
        if (*((_DWORD *)v17 + 8) == 1)
        {
          v19 = (__int128 *)(v17 + 5);
          v20 = v112;
          if ((unint64_t)v112 >= v113)
          {
            v22 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v111, v19);
          }
          else
          {
            if (*((char *)v17 + 63) < 0)
            {
              std::string::__init_copy_ctor_external(v112, (const std::string::value_type *)v17[5], v17[6]);
            }
            else
            {
              v21 = *v19;
              v112->__r_.__value_.__r.__words[2] = v17[7];
              *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
            }
            v22 = v20 + 1;
          }
          v112 = v22;
        }
        v23 = (_QWORD *)v17[1];
        if (v23)
        {
          do
          {
            v24 = v23;
            v23 = (_QWORD *)*v23;
          }
          while (v23);
        }
        else
        {
          do
          {
            v24 = (_QWORD *)v17[2];
            v25 = *v24 == (_QWORD)v17;
            v17 = v24;
          }
          while (!v25);
        }
        v17 = v24;
      }
      while (v24 != v18);
    }
    if (*((char *)a3 + 23) < 0)
      std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
    else
      __str = *(std::string *)a3;
    if (v111 == v112)
    {
      v30 = *((unsigned __int8 *)a4 + 23);
      if ((v30 & 0x80u) != 0)
        v30 = *((_QWORD *)a4 + 1);
      if (v30)
      {
        std::operator+<char>();
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          size = __p.__r_.__value_.__l.__size_;
        std::string::append(&__str, (const std::string::value_type *)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        std::string::operator=((std::string *)a8, &__str);
      }
    }
    else
    {
      v109.__r_.__value_.__r.__words[0] = (std::string::size_type)"-";
      v109.__r_.__value_.__l.__size_ = 1;
      quasar::join<std::vector<std::string>>((uint64_t *)&v111, (uint64_t *)&v109);
      v26 = std::string::insert(&v90, 0, "\\\\");
      v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v27;
      v26->__r_.__value_.__l.__size_ = 0;
      v26->__r_.__value_.__r.__words[2] = 0;
      v26->__r_.__value_.__r.__words[0] = 0;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = &__p;
      else
        v28 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v29 = __p.__r_.__value_.__l.__size_;
      std::string::append(&__str, (const std::string::value_type *)v28, v29);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v90.__r_.__value_.__l.__data_);
    }
    value = (uint64_t **)self->_outPronCache.__ptr_.__value_;
    if (value)
    {
      quasar::WordPronCache::addTemplateForWord(value, (uint64_t)a5, (uint64_t)&__str, 1);
      quasar::WordPronCache::addTemplateForWord((uint64_t **)self->_outPronCache.__ptr_.__value_, (uint64_t)a5, (uint64_t)a3, 1);
    }
    quasar::LmeDataFactoryBase::PronSet::clear((char **)a6);
    v34 = *((unsigned __int8 *)a4 + 23);
    v35 = v34;
    v36 = *((_QWORD *)a4 + 1);
    if ((v34 & 0x80u) == 0)
      v37 = *((unsigned __int8 *)a4 + 23);
    else
      v37 = *((_QWORD *)a4 + 1);
    if (v37)
      v38 = (std::string *)a4;
    else
      v38 = (std::string *)a3;
    if (SHIBYTE(v38->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v109, v38->__r_.__value_.__l.__data_, v38->__r_.__value_.__l.__size_);
      v34 = *((unsigned __int8 *)a4 + 23);
      v36 = *((_QWORD *)a4 + 1);
      v35 = *((_BYTE *)a4 + 23);
    }
    else
    {
      v109 = *v38;
    }
    if (v35 < 0)
      v34 = v36;
    if (v34)
    {
      if (*((char *)a3 + 23) < 0)
        std::string::__init_copy_ctor_external(&v108, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
      else
        v108 = *(std::string *)a3;
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v108, "");
    }
    if (self->_outPronCache.__ptr_.__value_)
    {
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v101, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
      else
        v101 = __str;
      std::string::basic_string[abi:ne180100]<0>(v99, "");
      quasar::LmeDataFactoryBase::Word::Word(&__p, &v101, v99, 0);
      if (v100 < 0)
        operator delete(v99[0]);
      if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v101.__r_.__value_.__l.__data_);
      if (quasar::WordPronCache::lookupWord((quasar::WordPronCache *)self->_outPronCache.__ptr_.__value_, (const quasar::LmeDataFactoryBase::Word *)&__p, 1, (char **)a6))
      {
        ++self->_outPronCacheHits;
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)a6, a7, (uint64_t *)&v97);
        quasar::LmeDataFactoryBase::PronSet::PronSet(&v90, &v97);
LABEL_207:
        v73 = (char *)a6 + 8;
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
        v74 = v90.__r_.__value_.__l.__size_;
        *(_QWORD *)a6 = v90.__r_.__value_.__r.__words[0];
        *((_QWORD *)a6 + 1) = v74;
        v75 = v90.__r_.__value_.__r.__words[2];
        *((_QWORD *)a6 + 2) = *((_QWORD *)&v90.__r_.__value_.__l + 2);
        if (v75)
        {
          *(_QWORD *)(v74 + 16) = v73;
          v90.__r_.__value_.__r.__words[0] = (std::string::size_type)&v90.__r_.__value_.__l.__size_;
          *(_OWORD *)&v90.__r_.__value_.__r.__words[1] = 0uLL;
          v74 = 0;
        }
        else
        {
          *(_QWORD *)a6 = v73;
        }
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v90, (char *)v74);
        v114 = &v97;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v114);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
        if (v105 < 0)
          operator delete(v103);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_214;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
      if (v105 < 0)
        operator delete(v103);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (self->_quasarLmeData.__ptr_)
    {
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v96, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
      else
        v96 = __str;
      std::string::basic_string[abi:ne180100]<0>(v94, "");
      quasar::LmeDataFactoryBase::Word::Word(&__p, &v96, v94, 0);
      if (v95 < 0)
        operator delete(v94[0]);
      if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v96.__r_.__value_.__l.__data_);
      if (quasar::LmeData::lookupWordPronCache((quasar::LmeData *)self->_quasarLmeData.__ptr_, (const quasar::LmeDataFactoryBase::Word *)&__p, 1, (char **)a6))
      {
        if (a7 != 3)
          goto LABEL_206;
        v39 = self->_outPronCache.__ptr_.__value_;
        if (!v39)
          goto LABEL_206;
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v89, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
        else
          v89 = __str;
        std::string::basic_string[abi:ne180100]<0>(v87, "");
        quasar::LmeDataFactoryBase::Word::Word(&v90, &v89, v87, 1, a6);
        quasar::WordPronCache::addWord((quasar::WordPronCache *)v39, &v90, 1);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)v93, v93[1]);
        if (v92 < 0)
          operator delete(v91);
        if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v90.__r_.__value_.__l.__data_);
        if (v88 < 0)
          operator delete(v87[0]);
        if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v89.__r_.__value_.__l.__data_);
        v59 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v60 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        else
          v60 = __str.__r_.__value_.__l.__size_;
        v61 = *((unsigned __int8 *)a3 + 23);
        v62 = (char)v61;
        v63 = *((_QWORD *)a3 + 1);
        if ((v61 & 0x80u) != 0)
          v61 = *((_QWORD *)a3 + 1);
        if (v60 != v61)
          goto LABEL_198;
        if (v62 >= 0)
          v64 = (unsigned __int8 *)a3;
        else
          v64 = *(unsigned __int8 **)a3;
        if ((*((_BYTE *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          if (memcmp(__str.__r_.__value_.__l.__data_, v64, __str.__r_.__value_.__l.__size_))
          {
LABEL_198:
            v72 = self->_outPronCache.__ptr_.__value_;
            if (v62 < 0)
              std::string::__init_copy_ctor_external(&v86, *(const std::string::value_type **)a3, v63);
            else
              v86 = *(std::string *)a3;
            std::string::basic_string[abi:ne180100]<0>(v84, "");
            quasar::LmeDataFactoryBase::Word::Word(&v90, &v86, v84, 1, a6);
            quasar::WordPronCache::addWord((quasar::WordPronCache *)v72, &v90, 1);
            quasar::LmeDataFactoryBase::Word::~Word((quasar::LmeDataFactoryBase::Word *)&v90);
            if (v85 < 0)
              operator delete(v84[0]);
            if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v86.__r_.__value_.__l.__data_);
          }
        }
        else if (*((_BYTE *)&__str.__r_.__value_.__s + 23))
        {
          p_str = &__str;
          while (p_str->__r_.__value_.__s.__data_[0] == *v64)
          {
            p_str = (std::string *)((char *)p_str + 1);
            ++v64;
            if (!--v59)
              goto LABEL_205;
          }
          goto LABEL_198;
        }
LABEL_205:
        ++self->_outPronCacheHits;
LABEL_206:
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)a6, a7, (uint64_t *)&v97);
        quasar::LmeDataFactoryBase::PronSet::PronSet(&v90, &v97);
        goto LABEL_207;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
      if (v105 < 0)
        operator delete(v103);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (!self->_tokenizer.__ptr_.__value_)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EARUserProfileBuilder.mm"), 1082, CFSTR("Tokenizer is invoked after explicit release!"));

    }
    if (v111 == v112)
    {
      quasar::getPronunciationsFromOrthography((uint64_t)&v109, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, a7, (quasar::LmeDataFactoryBase::PronSet *)&__p);
      v43 = (char *)a6 + 8;
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
      v44 = __p.__r_.__value_.__l.__size_;
      *(_QWORD *)a6 = __p.__r_.__value_.__r.__words[0];
      *((_QWORD *)a6 + 1) = v44;
      v45 = __p.__r_.__value_.__r.__words[2];
      *((_QWORD *)a6 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
      if (v45)
      {
        *(_QWORD *)(v44 + 16) = v43;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
        v44 = 0;
      }
      else
      {
        *(_QWORD *)a6 = v43;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)v44);
      if (!a7)
        goto LABEL_185;
      v47 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      else
        v48 = v108.__r_.__value_.__l.__size_;
      if (v48)
      {
        v49 = HIBYTE(v109.__r_.__value_.__r.__words[2]);
        if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v49 = v109.__r_.__value_.__l.__size_;
        if (v48 == v49)
        {
          if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v50 = &v109;
          else
            v50 = (std::string *)v109.__r_.__value_.__r.__words[0];
          if ((*((_BYTE *)&v108.__r_.__value_.__s + 23) & 0x80) != 0)
          {
            if (!memcmp(v108.__r_.__value_.__l.__data_, v50, v108.__r_.__value_.__l.__size_))
              goto LABEL_103;
          }
          else
          {
            if (!*((_BYTE *)&v108.__r_.__value_.__s + 23))
              goto LABEL_103;
            v51 = &v108;
            while (v51->__r_.__value_.__s.__data_[0] == v50->__r_.__value_.__s.__data_[0])
            {
              v51 = (std::string *)((char *)v51 + 1);
              v50 = (std::string *)((char *)v50 + 1);
              if (!--v47)
                goto LABEL_103;
            }
          }
        }
        quasar::getPronunciationsFromOrthography((uint64_t)&v108, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, 1, (quasar::LmeDataFactoryBase::PronSet *)&v90);
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)&v90, 1, (uint64_t *)&v97);
        p_data = (void **)&v97->__r_.__value_.__l.__data_;
        v70 = (void **)&v98->__r_.__value_.__l.__data_;
        if (v97 != v98)
        {
          do
          {
            quasar::PronChoice::PronChoice(&__p, (uint64_t)p_data);
            if (LODWORD(__p.__r_.__value_.__l.__data_) == 4)
              quasar::LmeDataFactoryBase::PronSet::insert((uint64_t **)a6, 4, (uint64_t)&__p.__r_.__value_.__l.__size_, v104);
            if (SHIBYTE(v103) < 0)
              operator delete((void *)__p.__r_.__value_.__l.__size_);
            p_data += 5;
          }
          while (p_data != v70);
        }
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v97;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v90, (char *)v90.__r_.__value_.__l.__size_);
      }
    }
    else
    {
      (*(void (**)(std::string *__return_ptr, G2P *, std::string **))(*(_QWORD *)self->_g2p.__ptr_.__value_
                                                                               + 32))(&v90, self->_g2p.__ptr_.__value_, &v111);
      quasar::LmeDataFactoryBase::PronSet::PronSet(&__p, &v90);
      v40 = (char *)a6 + 8;
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
      v41 = __p.__r_.__value_.__l.__size_;
      *(_QWORD *)a6 = __p.__r_.__value_.__r.__words[0];
      *((_QWORD *)a6 + 1) = v41;
      v42 = __p.__r_.__value_.__r.__words[2];
      *((_QWORD *)a6 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
      if (v42)
      {
        *(_QWORD *)(v41 + 16) = v40;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
        v41 = 0;
      }
      else
      {
        *(_QWORD *)a6 = v40;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)v41);
      v97 = &v90;
      std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v97);
    }
LABEL_103:
    if (a7 != 3)
      goto LABEL_185;
    v46 = self->_outPronCache.__ptr_.__value_;
    if (!v46)
      goto LABEL_185;
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v83, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
    else
      v83 = __str;
    std::string::basic_string[abi:ne180100]<0>(v81, "");
    quasar::LmeDataFactoryBase::Word::Word(&__p, &v83, v81, 1, a6);
    quasar::WordPronCache::addWord((quasar::WordPronCache *)v46, &__p, 1);
    std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
    if (v105 < 0)
      operator delete(v103);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v82 < 0)
      operator delete(v81[0]);
    if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v83.__r_.__value_.__l.__data_);
    v52 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v53 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    else
      v53 = __str.__r_.__value_.__l.__size_;
    v54 = *((unsigned __int8 *)a3 + 23);
    v55 = (char)v54;
    v56 = *((_QWORD *)a3 + 1);
    if ((v54 & 0x80u) != 0)
      v54 = *((_QWORD *)a3 + 1);
    if (v53 == v54)
    {
      if (v55 >= 0)
        v57 = (unsigned __int8 *)a3;
      else
        v57 = *(unsigned __int8 **)a3;
      if ((*((_BYTE *)&__str.__r_.__value_.__s + 23) & 0x80) == 0)
      {
        if (*((_BYTE *)&__str.__r_.__value_.__s + 23))
        {
          v58 = &__str;
          while (v58->__r_.__value_.__s.__data_[0] == *v57)
          {
            v58 = (std::string *)((char *)v58 + 1);
            ++v57;
            if (!--v52)
              goto LABEL_185;
          }
          goto LABEL_174;
        }
LABEL_185:
        ++self->_outPronCacheMisses;
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)a6, a7, (uint64_t *)&v90);
        quasar::LmeDataFactoryBase::PronSet::PronSet(&__p, &v90);
        v67 = (char *)a6 + 8;
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
        v68 = __p.__r_.__value_.__l.__size_;
        *(_QWORD *)a6 = __p.__r_.__value_.__r.__words[0];
        *((_QWORD *)a6 + 1) = v68;
        v69 = __p.__r_.__value_.__r.__words[2];
        *((_QWORD *)a6 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
        if (v69)
        {
          *(_QWORD *)(v68 + 16) = v67;
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
          *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
          v68 = 0;
        }
        else
        {
          *(_QWORD *)a6 = v67;
        }
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)v68);
        v97 = &v90;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v97);
LABEL_214:
        if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v108.__r_.__value_.__l.__data_);
        if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v109.__r_.__value_.__l.__data_);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v111;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        return;
      }
      if (!memcmp(__str.__r_.__value_.__l.__data_, v57, __str.__r_.__value_.__l.__size_))
        goto LABEL_185;
    }
LABEL_174:
    v66 = self->_outPronCache.__ptr_.__value_;
    if (v55 < 0)
      std::string::__init_copy_ctor_external(&v80, *(const std::string::value_type **)a3, v56);
    else
      v80 = *(std::string *)a3;
    std::string::basic_string[abi:ne180100]<0>(v78, "");
    quasar::LmeDataFactoryBase::Word::Word(&__p, &v80, v78, 1, a6);
    quasar::WordPronCache::addWord((quasar::WordPronCache *)v66, &__p, 1);
    std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
    if (v105 < 0)
      operator delete(v103);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v79 < 0)
      operator delete(v78[0]);
    if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v80.__r_.__value_.__l.__data_);
    goto LABEL_185;
  }
}

- (void)_embeddingsForOrthography:(const void *)a3 templateName:(const void *)a4 embeddings:(void *)a5 pronRequest:(int)a6
{
  uint64_t v6;
  std::string::size_type size;
  uint64_t **value;
  WordPronCache *v13;
  char *v14;
  std::string::size_type v15;
  std::string::size_type v16;
  uint64_t v17[3];
  void *v18[2];
  char v19;
  std::string v20;
  std::string v21[3];
  void *__p[2];
  char v23;
  std::string v24;
  void *v25[2];
  char v26;
  void *v27;
  char v28;
  uint64_t v29;
  char *v30;
  std::string v31;
  void **v32;

  v6 = *((unsigned __int8 *)a3 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v6)
  {
    memset(&v31, 0, sizeof(v31));
    quasar::TextSanitizer::sanitize((uint64_t)&self->_sanitizer, (uint64_t)a3, (uint64_t)&v31);
    size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v31.__r_.__value_.__l.__size_;
    if (!size)
      goto LABEL_41;
    value = (uint64_t **)self->_outEmbeddingCache.__ptr_.__value_;
    if (value)
      quasar::WordPronCache::addTemplateForWord(value, (uint64_t)a4, (uint64_t)&v31, 1);
    quasar::LmeDataFactoryBase::PronSet::clear((char **)a5);
    if (self->_quasarLmeData.__ptr_)
    {
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v24, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
      else
        v24 = v31;
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      quasar::LmeDataFactoryBase::Word::Word(v25, &v24, __p, 0);
      if (v23 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
      if (quasar::LmeData::lookupWordEmbeddingCache((quasar::LmeData *)self->_quasarLmeData.__ptr_, (const quasar::LmeDataFactoryBase::Word *)v25, 1, (char **)a5))
      {
        if (a6 == 2)
        {
          v13 = self->_outEmbeddingCache.__ptr_.__value_;
          if (v13)
          {
            if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
              std::string::__init_copy_ctor_external(&v20, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
            else
              v20 = v31;
            std::string::basic_string[abi:ne180100]<0>(v18, "");
            quasar::LmeDataFactoryBase::Word::Word(v21, &v20, v18, 1, a5);
            quasar::WordPronCache::addWord((quasar::WordPronCache *)v13, v21, 1);
            quasar::LmeDataFactoryBase::Word::~Word((quasar::LmeDataFactoryBase::Word *)v21);
            if (v19 < 0)
              operator delete(v18[0]);
            if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v20.__r_.__value_.__l.__data_);
            ++self->_outEmbeddingCacheHits;
          }
        }
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)a5, a6, v17);
        quasar::LmeDataFactoryBase::PronSet::PronSet(v21, v17);
        v14 = (char *)a5 + 8;
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a5, *((char **)a5 + 1));
        v15 = v21[0].__r_.__value_.__l.__size_;
        *(_QWORD *)a5 = v21[0].__r_.__value_.__r.__words[0];
        *((_QWORD *)a5 + 1) = v15;
        v16 = v21[0].__r_.__value_.__r.__words[2];
        *((_QWORD *)a5 + 2) = *((_QWORD *)&v21[0].__r_.__value_.__l + 2);
        if (v16)
        {
          *(_QWORD *)(v15 + 16) = v14;
          v21[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v21[0].__r_.__value_.__l.__size_;
          *(_OWORD *)&v21[0].__r_.__value_.__r.__words[1] = 0uLL;
          v15 = 0;
        }
        else
        {
          *(_QWORD *)a5 = v14;
        }
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)v21, (char *)v15);
        v32 = (void **)v17;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100](&v32);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v29, v30);
        if (v28 < 0)
          operator delete(v27);
        if (v26 < 0)
          operator delete(v25[0]);
LABEL_41:
        if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v31.__r_.__value_.__l.__data_);
        return;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v29, v30);
      if (v28 < 0)
        operator delete(v27);
      if (v26 < 0)
        operator delete(v25[0]);
    }
    if (self->_g2emb.__ptr_.__value_)
      ++self->_outEmbeddingCacheMisses;
    goto LABEL_41;
  }
}

- (id)sanitizedStringWithString:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  void *v7;
  void *__p;
  uint64_t v10;
  uint64_t v11;
  void *v12[2];
  uint64_t v13;

  v4 = a3;
  v5 = v4;
  v12[0] = 0;
  v12[1] = 0;
  v13 = 0;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p = 0;
    v10 = 0;
    v11 = 0;
  }
  quasar::TextSanitizer::sanitize((uint64_t)&self->_sanitizer, (uint64_t)&__p, (uint64_t)v12);
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  if (v13 >= 0)
    v6 = v12;
  else
    v6 = (void **)v12[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6, __p, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v13) < 0)
    operator delete(v12[0]);

  return v7;
}

- (void)signalEndOfUserData
{
  TextTokenizer *value;

  value = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(TextTokenizer *))(*(_QWORD *)value + 8))(value);
}

- (void)createInlineLmeUserDataForContextStrings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _EARWordPart *v9;
  void *v10;
  _EARWordPart *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _EARWordPart *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_EARUserProfileBuilder removeAllWords](self, "removeAllWords", v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = [_EARWordPart alloc];
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[_EARWordPart initWithOrthography:pronunciations:tag:](v9, "initWithOrthography:pronunciations:tag:", v8, v10, 7);

        v19 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "\\NT-inline");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_EARUserProfileBuilder addWordWithParts:templateName:](self, "addWordWithParts:templateName:", v12, v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v5);
  }

}

- (id)createInlineLmeUserDataForContextData:(id)a3 speechProfile:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void **v8;
  G2Embedding *value;
  LmeDataFactory *ptr;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const std::string::value_type *v25;
  std::string::size_type v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  char *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  void **v41;
  void **v42;
  BOOL v43;
  void *v44;
  void *v45;
  LmeDataFactory *v46;
  int v47;
  uint64_t **v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  void **v53;
  void *v54;
  id v57;
  id v58;
  uint64_t **v59;
  uint64_t *v60;
  void *__p[2];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t **v78;
  uint64_t v79;
  std::__shared_weak_count *v80;
  uint64_t v81;
  _BYTE v82[32];
  int v83;
  _BYTE v84[32];
  int v85;
  uint64_t v86;
  std::__shared_weak_count *v87;
  __int128 v88;
  __int128 v89;
  int v90;
  char **v91;
  char *v92[2];
  uint64_t v93;
  unint64_t v94;
  _QWORD v95[9];
  char v96;
  uint64_t v97;
  char **v98;
  char *v99;
  uint64_t v100;
  uint64_t *v101;
  _QWORD *v102;
  uint64_t v103;
  __int128 *v104;

  v58 = a3;
  v57 = a4;
  v102 = 0;
  v103 = 0;
  v101 = (uint64_t *)&v102;
  if (self->_g2emb.__ptr_.__value_)
  {
    v6 = operator new();
    *(_QWORD *)(v6 + 64) = 0;
    *(_OWORD *)(v6 + 32) = 0u;
    *(_OWORD *)(v6 + 48) = 0u;
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    v7 = v6;
    *(_QWORD *)v6 = &off_1E5D35090;
    fst::SymbolTable::SymbolTable((fst::SymbolTable *)(v6 + 8));
    v59 = (uint64_t **)v7;
    *(_QWORD *)(v7 + 56) = 0;
    v7 += 56;
    *(_QWORD *)(v7 - 24) = 0;
    *(_QWORD *)(v7 - 32) = v7 - 24;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 - 16) = 0;
    *(_QWORD *)(v7 - 8) = v7;
  }
  else
  {
    v59 = 0;
  }
  if (!v58)
  {
    v8 = 0;
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v62 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v58, "getWords");
  v8 = (void **)__p[0];
  if (__p[0] != &__p[1])
  {
    while (1)
    {
LABEL_18:
      if (!self->_tokenizer.__ptr_.__value_)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EARUserProfileBuilder.mm"), 1219, CFSTR("Tokenizer is invoked after explicit release!"));

      }
      quasar::LmeDataFactory::getNameEnumeratorFromAceCategory((uint64_t)self->_dataFactory.__ptr_, (uint64_t)(v8 + 4), &v91);
      v16 = (uint64_t *)v8[7];
      v15 = (uint64_t *)v8[8];
      v60 = v15;
LABEL_21:
      if (v16 != v15)
        break;
      v38 = (std::__shared_weak_count *)v92[0];
      if (v92[0])
      {
        v39 = (unint64_t *)(v92[0] + 8);
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
      v41 = (void **)v8[1];
      if (v41)
      {
        do
        {
          v42 = v41;
          v41 = (void **)*v41;
        }
        while (v41);
      }
      else
      {
        do
        {
          v42 = (void **)v8[2];
          v43 = *v42 == v8;
          v8 = v42;
        }
        while (!v43);
      }
      v8 = v42;
      if (v42 == &__p[1])
        goto LABEL_6;
    }
    v94 = 0;
    v93 = 0;
    v95[0] = 0;
    memset(v82, 0, 24);
    v17 = *v16;
    v18 = v16[1];
    while (1)
    {
      if (v17 == v18)
      {
        if (v91)
          (*((void (**)(char **, uint64_t *))*v91 + 4))(v91, &v93);
        v88 = 0uLL;
        *(_QWORD *)&v89 = 0;
        v27 = v93;
        v28 = v94;
        while (v27 != v28)
        {
          quasar::getPronunciationsFromOrthography(v27, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, 3, (quasar::LmeDataFactoryBase::PronSet *)&v98);
          if (quasar::LmeDataFactoryBase::PronSet::size((quasar::LmeDataFactoryBase::PronSet *)&v98))
          {
            v29 = *((_QWORD *)&v88 + 1);
            if (*((_QWORD *)&v88 + 1) >= (unint64_t)v89)
            {
              v30 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t *)&v88, v27, v27 + 24, (unsigned int *)(v27 + 48), (uint64_t)&v98);
            }
            else
            {
              std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t)&v89, *((uint64_t *)&v88 + 1), v27, v27 + 24, (unsigned int *)(v27 + 48), (uint64_t)&v98);
              v30 = v29 + 80;
            }
            *((_QWORD *)&v88 + 1) = v30;
          }
          std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v98, v99);
          v27 += 80;
        }
        v104 = (__int128 *)(v8 + 4);
        v31 = std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v101, (const void **)v8 + 4, (uint64_t)&std::piecewise_construct, &v104);
        v32 = v31 + 7;
        v33 = v31[8];
        if (v33 >= v31[9])
        {
          v34 = std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>::__push_back_slow_path<std::vector<quasar::LmeDataFactoryBase::Word> const&>(v32, (__int128 **)&v88);
        }
        else
        {
          std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::LmeDataFactoryBase::Word> const&>((uint64_t)v32, (__int128 **)&v88);
          v34 = v33 + 24;
        }
        v31[8] = v34;
        if (self->_g2emb.__ptr_.__value_ && v59)
        {
          v98 = 0;
          v99 = 0;
          v100 = 0;
          quasar::TextSanitizer::sanitize((uint64_t)&self->_sanitizer, (uint64_t)v82, (uint64_t)&v98);
          if (*((char *)v8 + 55) < 0)
            v35 = v8[5];
          else
            v35 = (void *)*((unsigned __int8 *)v8 + 55);
          v36 = HIBYTE(v100);
          if (v35)
          {
            v37 = v99;
            if (v100 >= 0)
              v37 = (char *)HIBYTE(v100);
            if (v37)
            {
              quasar::WordPronCache::addTemplateForWord(v59, (uint64_t)(v8 + 4), (uint64_t)&v98, 1);
              v36 = HIBYTE(v100);
            }
          }
          if (v36 < 0)
            operator delete(v98);
        }
        v98 = (char **)&v88;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&v98);
        if ((v82[23] & 0x80000000) != 0)
          operator delete(*(void **)v82);
        *(_QWORD *)v82 = &v93;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)v82);
        v16 += 3;
        v15 = v60;
        goto LABEL_21;
      }
      if (*(char *)(v17 + 23) < 0)
      {
        v19 = *(_QWORD *)(v17 + 8);
        if (!v19)
          goto LABEL_44;
        v20 = *(char **)v17;
      }
      else
      {
        v19 = *(unsigned __int8 *)(v17 + 23);
        if (!*(_BYTE *)(v17 + 23))
          goto LABEL_44;
        v20 = (char *)v17;
      }
      if (&v20[v19] == utf8::find_invalid<std::__wrap_iter<char const*>>(v20, &v20[v19]))
      {
        v21 = v94;
        if (v94 >= v95[0])
        {
          v22 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string const&,std::string const&,int const&>(&v93, v17, v17 + 24, (unsigned int *)(v17 + 48));
        }
        else
        {
          std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string const&,std::string const&,int const&>((uint64_t)v95, v94, v17, v17 + 24, (unsigned int *)(v17 + 48));
          v22 = v21 + 80;
        }
        v94 = v22;
        v23 = v82[23];
        if (v82[23] < 0)
          v23 = *(_QWORD *)&v82[8];
        if (v23)
          std::string::append((std::string *)v82, " ");
        v24 = *(char *)(v17 + 23);
        if (v24 >= 0)
          v25 = (const std::string::value_type *)v17;
        else
          v25 = *(const std::string::value_type **)v17;
        if (v24 >= 0)
          v26 = *(unsigned __int8 *)(v17 + 23);
        else
          v26 = *(_QWORD *)(v17 + 8);
        std::string::append((std::string *)v82, v25, v26);
      }
LABEL_44:
      v17 += 80;
    }
  }
LABEL_6:
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)__p, (_QWORD *)__p[1]);
  if (v103)
  {
    if (v59)
    {
      value = self->_g2emb.__ptr_.__value_;
      if (value)
        quasar::G2Embedding::computeEmbeddings((quasar::G2Embedding *)value, (quasar::WordPronCache *)v59);
    }
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v93);
    v99 = 0;
    v100 = 0;
    v98 = &v99;
    v92[1] = 0;
    v92[0] = 0;
    v91 = v92;
    v88 = 0u;
    v89 = 0u;
    v90 = 1065353216;
    ptr = self->_dataFactory.__ptr_;
    v86 = 0;
    v87 = 0;
    (*(void (**)(LmeDataFactory *, uint64_t *))(*(_QWORD *)ptr + 48))(ptr, &v86);
    v11 = v87;
    if (v87)
    {
      p_shared_owners = (unint64_t *)&v87->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    memset(v82, 0, sizeof(v82));
    memset(v84, 0, sizeof(v84));
    v83 = 1065353216;
    v85 = 1065353216;
    if (v58)
    {
      v14 = v58;
      objc_msgSend(v58, "getTemplateToAverageCost");
    }
    else
    {
      *(_QWORD *)&v63 = 0;
      *(_OWORD *)__p = 0uLL;
      v62 = 0uLL;
      v14 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__move_assign((uint64_t)v84, (uint64_t *)__p);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)__p);
    if (v14)
    {
      objc_msgSend(v14, "getTemplateToDeviationCost");
    }
    else
    {
      *(_QWORD *)&v63 = 0;
      *(_OWORD *)__p = 0u;
      v62 = 0u;
    }
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__move_assign((uint64_t)v82, (uint64_t *)__p);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)__p);
    v46 = self->_dataFactory.__ptr_;
    LODWORD(__p[0]) = 1;
    v80 = 0;
    v81 = 0;
    v78 = v59;
    v79 = 0;
    v47 = (*(uint64_t (**)(LmeDataFactory *, uint64_t **, _QWORD, void **, _BYTE *, uint64_t *, char ***, char ***, __int128 *, uint64_t *, uint64_t *, _QWORD, uint64_t ***))(*(_QWORD *)v46 + 56))(v46, &v101, 0, __p, v82, &v93, &v98, &v91, &v88, &v81, &v79, 0, &v78);
    v48 = v78;
    v78 = 0;
    if (v48)
      ((void (*)(uint64_t **))(*v48)[1])(v48);
    v49 = v80;
    if (v80)
    {
      v50 = (unint64_t *)&v80->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    v52 = v81;
    v81 = 0;
    if (v52)
      (*(void (**)(uint64_t))(*(_QWORD *)v52 + 8))(v52);
    if (v47)
    {
      if (quasar::gLogLevel >= 4)
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        *(_OWORD *)__p = 0u;
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Could not get LME data", 22);
        std::ostream::operator<<();
        quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__p);
      }
      v45 = 0;
    }
    else
    {
      std::stringbuf::str();
      if ((SBYTE7(v62) & 0x80u) == 0)
        v53 = __p;
      else
        v53 = (void **)__p[0];
      if ((SBYTE7(v62) & 0x80u) == 0)
        v54 = (void *)BYTE7(v62);
      else
        v54 = __p[1];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v53, v54);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (SBYTE7(v62) < 0)
        operator delete(__p[0]);
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v84);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v82);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v88);
    std::__tree<std::string>::destroy((uint64_t)&v91, v92[0]);
    std::__tree<std::string>::destroy((uint64_t)&v98, v99);
    v93 = *MEMORY[0x1E0DE4F60];
    *(uint64_t *)((char *)&v93 + *(_QWORD *)(v93 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
    v94 = MEMORY[0x1E0DE4FB8] + 16;
    if (v96 < 0)
      operator delete((void *)v95[7]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1AF44D094](&v97);
  }
  else
  {
    if (v59)
      ((void (*)(uint64_t **))(*v59)[1])(v59);
    v45 = 0;
  }
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)&v101, v102);

  return v45;
}

- (_EARPeopleSuggesterConfig)peopleSuggesterConfig
{
  LmeDataFactory *ptr;

  ptr = self->_dataFactory.__ptr_;
  return -[_EARPeopleSuggesterConfig initWithContactsCount:bestContactsCount:bestContactsBonus:]([_EARPeopleSuggesterConfig alloc], "initWithContactsCount:bestContactsCount:bestContactsBonus:", *((unsigned int *)ptr + 546), *((unsigned int *)ptr + 547), *((unsigned int *)ptr + 548));
}

- (void)_logSpeechProfileUpdatedEventWithLmeData:(shared_ptr<quasar:(int)a4 :()map<std:()int :()std:(std:(int>>> *)a5 :allocator<std::pair<const)std::string :less<std::string> string LmeData>)a3 sizeInBytes:numEnumeratedEntries:
{
  LmeData *ptr;
  uint64_t v6;
  __shared_weak_count *cntrl;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  quasar::QsrTextSymbolTable *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  unint64_t *v31;
  unint64_t v32;
  id v33;
  _QWORD *v34;
  void **v35;
  uint64_t v36;
  _QWORD *v37;
  void *__p[2];
  unsigned __int8 v39;
  _OWORD v40[17];
  uint64_t v41;
  uint64_t v42;
  id (*v43)(uint64_t);
  void *v44;
  id v45;

  if (SLODWORD(a3.__cntrl_) < 1)
    return;
  ptr = a3.__ptr_;
  if (!*(_QWORD *)a3.__ptr_)
    return;
  v6 = *(_QWORD *)&a4;
  cntrl = a3.__cntrl_;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", cntrl);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("sizeInBytes"));

  v10 = *(_QWORD *)ptr;
  if (*(char *)(*(_QWORD *)ptr + 343) < 0)
  {
    v11 = *(_QWORD *)(v10 + 320);
    v12 = *(_QWORD *)(v10 + 328);
  }
  else
  {
    v11 = v10 + 320;
    v12 = *(unsigned __int8 *)(*(_QWORD *)ptr + 343);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("language"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)ptr + 8));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("formatVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)ptr + 264));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("g2pModelVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(*(_QWORD *)ptr + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("pronunciationCacheSize"));

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "processName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("process"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v6 + 16));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("numLmeSlotsUpdated"));

  v21 = *(_QWORD *)(*(_QWORD *)ptr + 224);
  v20 = *(std::__shared_weak_count **)(*(_QWORD *)ptr + 232);
  if (!v20)
    goto LABEL_11;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  do
    v23 = __ldxr(p_shared_owners);
  while (__stxr(v23 + 1, p_shared_owners));
  do
    v24 = __ldaxr(p_shared_owners);
  while (__stlxr(v24 - 1, p_shared_owners));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    if (v21)
      goto LABEL_12;
  }
  else
  {
LABEL_11:
    if (v21)
    {
LABEL_12:
      v25 = (void *)MEMORY[0x1E0CB37E8];
      v26 = *(quasar::QsrTextSymbolTable **)(*(_QWORD *)ptr + 224);
      v27 = *(std::__shared_weak_count **)(*(_QWORD *)ptr + 232);
      *(_QWORD *)&v40[0] = v26;
      *((_QWORD *)&v40[0] + 1) = v27;
      if (v27)
      {
        v28 = (unint64_t *)&v27->__shared_owners_;
        do
          v29 = __ldxr(v28);
        while (__stxr(v29 + 1, v28));
      }
      objc_msgSend(v25, "numberWithUnsignedLong:", quasar::QsrTextSymbolTable::NumSymbols(v26));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("totalEntityCount"));

      if (v27)
      {
        v31 = (unint64_t *)&v27->__shared_owners_;
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
  }
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __100___EARUserProfileBuilder__logSpeechProfileUpdatedEventWithLmeData_sizeInBytes_numEnumeratedEntries___block_invoke;
  v44 = &unk_1E5D46DF8;
  v33 = v8;
  v45 = v33;
  AnalyticsSendEventLazy();
  if (quasar::gLogLevel >= 4)
  {
    memset(v40, 0, sizeof(v40));
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v40);
    v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)"Wrote ", 6);
    objc_msgSend(CFSTR("com.apple.siri.embeddedspeech.SpeechProfileUpdated"), "ear_toString");
    if ((v39 & 0x80u) == 0)
      v35 = __p;
    else
      v35 = (void **)__p[0];
    if ((v39 & 0x80u) == 0)
      v36 = v39;
    else
      v36 = (uint64_t)__p[1];
    v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)v35, v36);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)" event to CoreAnalytics.", 24);
    if ((char)v39 < 0)
      operator delete(__p[0]);
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v40);
  }

}

- (void)_logLmeSlotUpdatedEventsWithLanguage:()basic_string<char numEnumeratedEntries:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  _QWORD *v19;
  _QWORD *v20;
  void **v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  void *__p[2];
  unsigned __int8 v26;
  _OWORD v27[17];
  uint64_t v28;
  uint64_t v29;
  id (*v30)(uint64_t);
  void *v31;
  id v32;

  v24 = v3;
  v4 = v3 + 1;
  v5 = (_QWORD *)*v3;
  if ((_QWORD *)*v3 != v3 + 1)
  {
    do
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (*((char *)v5 + 55) < 0)
      {
        v8 = (_QWORD *)v5[4];
        v9 = v5[5];
      }
      else
      {
        v8 = v5 + 4;
        v9 = *((unsigned __int8 *)v5 + 55);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v8, v9, v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("lmeSlot"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v5 + 14));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("entityCount"));

      data = a3;
      if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0)
        data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->__r_.__value_.var0.var1.__data_;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", data);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("language"));

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "processName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("process"));

      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __84___EARUserProfileBuilder__logLmeSlotUpdatedEventsWithLanguage_numEnumeratedEntries___block_invoke;
      v31 = &unk_1E5D46DF8;
      v32 = v7;
      AnalyticsSendEventLazy();

      v16 = (_QWORD *)v5[1];
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = (_QWORD *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (_QWORD *)v5[2];
          v18 = *v17 == (_QWORD)v5;
          v5 = v17;
        }
        while (!v18);
      }
      v5 = v17;
    }
    while (v17 != v4);
  }
  if (quasar::gLogLevel > 3)
  {
    memset(v27, 0, sizeof(v27));
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v27);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"Wrote ", 6);
    v19 = (_QWORD *)std::ostream::operator<<();
    v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" ", 1);
    objc_msgSend(CFSTR("com.apple.siri.embeddedspeech.SpeechProfileLmeSlotUpdated"), "ear_toString");
    if ((v26 & 0x80u) == 0)
      v21 = __p;
    else
      v21 = (void **)__p[0];
    if ((v26 & 0x80u) == 0)
      v22 = v26;
    else
      v22 = (uint64_t)__p[1];
    v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v21, v22);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)" events to CoreAnalytics.", 25);
    if ((char)v26 < 0)
      operator delete(__p[0]);
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v27);
  }
}

- (void).cxx_destruct
{
  WordPronCache *value;
  WordPronCache *v4;
  PersonalizationRecipe *v5;
  G2Embedding *v6;
  G2P *v7;
  TextTokenizer *v8;

  std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_unmaskedUserId, 0);
  value = self->_outEmbeddingCache.__ptr_.__value_;
  self->_outEmbeddingCache.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(WordPronCache *))(*(_QWORD *)value + 8))(value);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_embeddingCache);
  std::__tree<std::vector<std::string>,quasar::NameEnumerator::EnumComparator,std::allocator<std::vector<std::string>>>::destroy((uint64_t)&self->_contactEnumSet, (char *)self->_contactEnumSet.__tree_.__pair1_.__value_.__left_);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->_quasarTemplate2Count);
  v4 = self->_outPronCache.__ptr_.__value_;
  self->_outPronCache.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(WordPronCache *))(*(_QWORD *)v4 + 8))(v4);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_quasarLmeData);
  v5 = self->_personalizationRecipe.__ptr_.__value_;
  self->_personalizationRecipe.__ptr_.__value_ = 0;
  if (v5)
    std::default_delete<quasar::PersonalizationRecipe>::operator()[abi:ne180100]((uint64_t)&self->_personalizationRecipe, (uint64_t)v5);
  quasar::BasicTextSanitizer::~BasicTextSanitizer((quasar::BasicTextSanitizer *)&self->_sanitizer);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_pronCache);
  v6 = self->_g2emb.__ptr_.__value_;
  self->_g2emb.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(G2Embedding *))(*(_QWORD *)v6 + 8))(v6);
  v7 = self->_g2p.__ptr_.__value_;
  self->_g2p.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(G2P *))(*(_QWORD *)v7 + 8))(v7);
  v8 = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(TextTokenizer *))(*(_QWORD *)v8 + 8))(v8);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_dataFactory);
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmePackedWord>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmePackedWord>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmePackedWord>>>>>::destroy((uint64_t)&self->_userData.data, (_QWORD *)self->_userData.data.__tree_.__pair1_.__value_.__left_);
  fst::SymbolTable::~SymbolTable((fst::SymbolTable *)&self->_userData);
  objc_storeStrong((id *)&self->_language, 0);
}

- (id).cxx_construct
{
  void *__p[2];
  char v5;

  fst::SymbolTable::SymbolTable((fst::SymbolTable *)&self->_userData);
  self->_userData.data.__tree_.__pair1_.__value_.__left_ = 0;
  self->_userData.data.__tree_.__pair3_.__value_ = 0;
  self->_userData.data.__tree_.__begin_node_ = &self->_userData.data.__tree_.__pair1_;
  self->_dataFactory = 0u;
  *(_OWORD *)&self->_tokenizer.__ptr_.__value_ = 0u;
  *(_OWORD *)&self->_g2emb.__ptr_.__value_ = 0u;
  self->_pronCache.__cntrl_ = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "•|\\(|\\)|\"|\\[|\\]|\\{|\\}|®|,|;|\\?|\\!|\\\\");
  quasar::BasicTextSanitizer::BasicTextSanitizer((quasar::TextSanitizer *)&self->_sanitizer, (uint64_t *)__p);
  if (v5 < 0)
    operator delete(__p[0]);
  self->_outPronCache.__ptr_.__value_ = 0;
  self->_quasarTemplate2Count.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_quasarTemplate2Count.__table_.__p1_.__value_.__next_ = 0u;
  self->_quasarLmeData.__ptr_ = 0;
  self->_quasarLmeData.__cntrl_ = 0;
  self->_personalizationRecipe.__ptr_.__value_ = 0;
  self->_quasarTemplate2Count.__table_.__p3_.__value_ = 1.0;
  self->_contactEnumSet.__tree_.__pair3_.__value_ = 0;
  self->_embeddingCache.__ptr_ = 0;
  self->_contactEnumSet.__tree_.__begin_node_ = &self->_contactEnumSet.__tree_.__pair1_;
  self->_contactEnumSet.__tree_.__pair1_.__value_.__left_ = 0;
  self->_embeddingCache.__cntrl_ = 0;
  self->_outEmbeddingCache.__ptr_.__value_ = 0;
  self->_templateToVersion.__tree_.__begin_node_ = &self->_templateToVersion.__tree_.__pair1_;
  self->_templateToVersion.__tree_.__pair1_.__value_.__left_ = 0;
  self->_experimentIds.__tree_.__pair1_.__value_.__left_ = 0;
  self->_experimentIds.__tree_.__pair3_.__value_ = 0;
  self->_templateToVersion.__tree_.__pair3_.__value_ = 0;
  self->_experimentIds.__tree_.__begin_node_ = &self->_experimentIds.__tree_.__pair1_;
  return self;
}

- (void)initWithConfiguration:withLanguage:withSdapiOverrides:withSdapiConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, v0, v1, "Can't init factory :(", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithConfiguration:(uint64_t)a1 language:overrides:textNormalizationModelRoot:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:.cold.2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_1_0(&dword_1AD756000, v1, v2, "Can't init LmeDataFactory: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:language:overrides:textNormalizationModelRoot:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, v0, v1, "Can't init LmeDataFactory: (unexpected exception)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)_writeProfileToStream:(_QWORD *)a3 .cold.1(uint64_t a1, uint64_t *a2, _QWORD **a3, uint64_t a4)
{
  uint64_t v7;

  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100](a1);
  v7 = *a2;
  *a2 = 0;
  if (v7)
    OUTLINED_FUNCTION_4_0(v7);
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy(a4, *a3);
}

- (uint64_t)createInlineLmeUserDataForContextData:(uint64_t)a1 speechProfile:(uint64_t *)a2 .cold.1(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100](a1);
  result = *a2;
  *a2 = 0;
  if (result)
    return OUTLINED_FUNCTION_4_0(result);
  return result;
}

@end
