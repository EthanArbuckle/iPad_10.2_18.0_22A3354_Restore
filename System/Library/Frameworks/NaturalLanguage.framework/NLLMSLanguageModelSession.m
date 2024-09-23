@implementation NLLMSLanguageModelSession

- (NLLMSLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const std::string::value_type *v10;
  _OWORD *v11;
  _OWORD *v12;
  id v13;
  language_modeling::v1::LanguageModelSession *v14;
  language_modeling::v1::LanguageModelSession *v15;
  NLTokenizer *v16;
  void *v17;
  objc_super v19;
  void *__p[2];
  char v21;
  int v22;
  const std::string::value_type *v23;
  uint64_t *v24;
  _QWORD *v25[2];
  void **v26;

  v6 = a3;
  v7 = a4;
  v25[0] = 0;
  v25[1] = 0;
  v24 = (uint64_t *)v25;
  objc_msgSend(v7, "objectForKey:", CFSTR("AppContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  else
    v10 = 0;
  v23 = v10;
  v22 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E0D430B8]);
  v26 = __p;
  v11 = std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v26);
  std::variant<language_modeling::v1::SessionType,std::string>::operator=[abi:ne180100]<language_modeling::v1::SessionType,0,language_modeling::v1::SessionType,0ul,0>((_DWORD *)v11 + 14, &v22);
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if (!v10)
      goto LABEL_10;
  }
  else if (!v10)
  {
    goto LABEL_10;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E0D430F0]);
  v26 = __p;
  v12 = std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v26);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v12 + 56, (std::string *)((char *)v12 + 56), &v23);
  if (v21 < 0)
    operator delete(__p[0]);
LABEL_10:
  v19.receiver = self;
  v19.super_class = (Class)NLLMSLanguageModelSession;
  v13 = -[NLLanguageModelSession initWithLanguageModel:options:](&v19, sel_initWithLanguageModel_options_, v6, v7);
  if (v13)
  {
    objc_msgSend(v6, "_underlyingModel");
    language_modeling::v1::LanguageModel::makeSession();
    v14 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100]((language_modeling::v1::LanguageModelSession **)v13 + 2, v14);
    v15 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    if (v15)
    {
      language_modeling::v1::LanguageModelSession::~LanguageModelSession(v15);
      MEMORY[0x1A8592B54]();
    }
    v16 = -[NLTokenizer initWithUnit:]([NLTokenizer alloc], "initWithUnit:", 0);
    v17 = (void *)*((_QWORD *)v13 + 3);
    *((_QWORD *)v13 + 3) = v16;

  }
  std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy((uint64_t)&v24, v25[0]);

  return (NLLMSLanguageModelSession *)v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)NLLMSLanguageModelSession;
  -[NLLMSLanguageModelSession description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLLanguageModelSession languageModel](self, "languageModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendString:", CFSTR(")"));
  return v7;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  id v6;
  NSArray *v7;
  id v8;
  char *v9;
  BOOL v10;
  NLProbabilityInfo *v12;
  uint64_t v13;
  NLProbabilityInfo *v14;
  _BYTE v16[8];
  void *__p;
  char v18;
  int v19;

  v6 = a3;
  wordSequenceForString((NSString *)a4, self->_tokenizer);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "UTF8String");
  if (self->_session.__ptr_.__value_)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0)
  {
    v12 = -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, v9);
    v19 = 0;
    makeContext(v7, (language_modeling::v1::LinguisticContext *)v16);
    v13 = language_modeling::v1::LanguageModelSession::conditionalProbability();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v16);
    if (v18 < 0)
      operator delete(__p);
    v12 = -[NLProbabilityInfo initWithLog10Probability:flags:]([NLProbabilityInfo alloc], "initWithLog10Probability:flags:", 0, *(double *)&v13);
  }
  v14 = v12;

  return v14;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  NSArray *v14;
  uint64_t v15;
  double v16;
  id v17;
  char *v18;
  double v19;
  NLProbabilityInfo *v20;
  _BYTE v22[8];
  void *__p;
  char v24;
  int v25;

  v6 = (NSString *)a3;
  wordSequenceForString((NSString *)a4, self->_tokenizer);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  wordSequenceForString(v6, self->_tokenizer);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_session.__ptr_.__value_)
    v10 = v7 == 0;
  else
    v10 = 1;
  v11 = v10 || v8 == 0;
  v12 = 0x1E4A39000;
  if (v11)
  {
LABEL_19:
    v20 = (NLProbabilityInfo *)objc_msgSend(objc_alloc(*(Class *)(v12 + 1784)), "initWithInvalidProbability");
    goto LABEL_20;
  }
  v13 = objc_msgSend(v8, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15 = 0;
    v16 = 0.0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v15);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (char *)objc_msgSend(v17, "UTF8String");
      if (!v18)
        break;
      std::string::basic_string[abi:ne180100]<0>(&__p, v18);
      v25 = 0;
      makeContext(v14, (language_modeling::v1::LinguisticContext *)v22);
      v19 = COERCE_DOUBLE(language_modeling::v1::LanguageModelSession::conditionalProbability());
      language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v22);
      if (v24 < 0)
        operator delete(__p);
      -[NSArray addObject:](v14, "addObject:", v17);
      v16 = v16 + v19;

      if (++v15 >= v13)
        goto LABEL_16;
    }

    v12 = 0x1E4A39000uLL;
    goto LABEL_19;
  }
  v16 = 0.0;
LABEL_16:
  v12 = 0x1E4A39000uLL;
  v20 = -[NLProbabilityInfo initWithLog10Probability:flags:]([NLProbabilityInfo alloc], "initWithLog10Probability:flags:", 0, v16);

  if (!v20)
    goto LABEL_19;
LABEL_20:

  return v20;
}

- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6
{
  NSArray *v8;
  NSArray *v9;
  BOOL v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *__p;
  char v15;
  _BYTE v16[8];
  uint64_t v17;
  id v18;
  unint64_t v19;
  _BYTE v20[24];
  _BYTE *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v18 = a6;
  wordSequenceForString((NSString *)a3, self->_tokenizer);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v17 = 0;
  if (self->_session.__ptr_.__value_)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    goto LABEL_13;
  makeContext(v8, (language_modeling::v1::LinguisticContext *)v16);
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  v11 = operator new(0x20uLL);
  *v11 = &off_1E4A3A308;
  v11[1] = &v18;
  v11[2] = &v17;
  v11[3] = &v19;
  v21 = v11;
  language_modeling::v1::LanguageModelSession::enumeratePredictions();
  v12 = v21;
  if (v21 == v20)
  {
    v13 = 4;
    v12 = v20;
    goto LABEL_9;
  }
  if (v21)
  {
    v13 = 5;
LABEL_9:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }
  if (v15 < 0)
    operator delete(__p);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v16);
LABEL_13:

}

- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4
{
  NSArray *v5;
  void *v6;
  int v7;
  int64_t v8;
  _BYTE v10[8];

  wordSequenceForString((NSString *)a3, self->_tokenizer);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NLLanguageModelSession languageModel](self, "languageModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_underlyingModel");
    makeContext(v5, (language_modeling::v1::LinguisticContext *)v10);
    v7 = language_modeling::v1::LanguageModel::blocklistStatus();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v10);

    v8 = v7 != 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)adaptToToken:(id)a3 context:(id)a4
{
  id v6;
  NSArray *v7;
  id v8;
  char *v9;
  BOOL v10;
  _BYTE v12[8];
  void *__p;
  char v14;
  int v15;

  v6 = a3;
  wordSequenceForString((NSString *)a4, self->_tokenizer);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "UTF8String");
  if (self->_session.__ptr_.__value_)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10 && v7 != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, v9);
    v15 = 0;
    makeContext(v7, (language_modeling::v1::LinguisticContext *)v12);
    language_modeling::v1::LanguageModelSession::adaptToToken();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v12);
    if (v14 < 0)
      operator delete(__p);
  }

}

- (void)unadaptToToken:(id)a3 context:(id)a4
{
  id v6;
  NSArray *v7;
  id v8;
  char *v9;
  BOOL v10;
  _BYTE v12[8];
  void *__p;
  char v14;
  int v15;

  v6 = a3;
  wordSequenceForString((NSString *)a4, self->_tokenizer);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "UTF8String");
  if (self->_session.__ptr_.__value_)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10 && v7 != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, v9);
    v15 = 0;
    makeContext(v7, (language_modeling::v1::LinguisticContext *)v12);
    language_modeling::v1::LanguageModelSession::unAdaptToToken();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v12);
    if (v14 < 0)
      operator delete(__p);
  }

}

- (void)reset
{
  id v2;

  -[NLLanguageModelSession languageModel](self, "languageModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  language_modeling::v1::LanguageModel::deallocateInternalBuffers((language_modeling::v1::LanguageModel *)objc_msgSend(v2, "_underlyingModel"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100]((language_modeling::v1::LanguageModelSession **)&self->_session, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
}

- (__n128)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E4A3A308;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (BOOL)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
  void *v4;
  void *p_p;
  void *v6;
  NLProbabilityInfo *v7;
  NLPredictionInfo *v8;
  unint64_t *v9;
  unint64_t v10;
  _BOOL8 v11;
  void *__p;
  char v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  language_modeling::v1::Prediction::string(this);
  if (v14 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(v4, "stringWithUTF8String:", p_p);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 < 0)
    operator delete(__p);
  v7 = -[NLProbabilityInfo initWithLog10Probability:flags:]([NLProbabilityInfo alloc], "initWithLog10Probability:flags:", 0, COERCE_DOUBLE(language_modeling::v1::Prediction::probability(this)));
  v8 = -[NLPredictionInfo initWithPrediction:contextLength:probabilityInfo:]([NLPredictionInfo alloc], "initWithPrediction:contextLength:probabilityInfo:", v6, language_modeling::v1::Prediction::contextSize(this), v7);
  LOBYTE(__p) = 0;
  (*(void (**)(void))(*a1[1] + 16))();
  v9 = a1[2];
  v10 = *v9 + 1;
  *v9 = v10;
  if ((_BYTE)__p)
    v11 = 0;
  else
    v11 = v10 < *a1[3];

  return v11;
}

- (uint64_t)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
