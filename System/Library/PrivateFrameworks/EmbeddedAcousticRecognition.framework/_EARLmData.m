@implementation _EARLmData

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARLmData)initWithConfiguration:(id)a3 recognizerConfiguration:(id)a4
{
  return -[_EARLmData initWithConfiguration:ncsRoot:recognizerConfiguration:](self, "initWithConfiguration:ncsRoot:recognizerConfiguration:", a3, 0, a4);
}

- (_EARLmData)initWithConfiguration:(id)a3 ncsRoot:(id)a4 recognizerConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARLmData *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _EARLmData *v22;
  NSObject *v23;
  uint64_t v24;
  unsigned __int8 v26;
  unsigned __int8 v27;
  void *__p[2];
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  objc_super v32;
  __int128 buf;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)_EARLmData;
  v11 = -[_EARLmData init](&v32, sel_init);
  if (v11)
  {
    EarLmLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1AD756000, v12, OS_LOG_TYPE_DEFAULT, "Initializing %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v8);

    if ((v14 & 1) == 0)
    {
      EarLmLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_33;
    }
    v31 = 0;
    if (v9)
      +[_EARQuasarTokenizer tokenizerWithNcsRoot:](_EARQuasarTokenizer, "tokenizerWithNcsRoot:", v9);
    else
      +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:](_EARQuasarTokenizer, "tokenizerWithRecognizerConfigPath:", v8);
    v16 = buf;
    *(_QWORD *)&buf = 0;
    v31 = v16;
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
      if (v10)
      {
LABEL_13:
        objc_msgSend(v10, "ear_toString");
        goto LABEL_16;
      }
    }
    else
    {
      buf = 0uLL;
      v34 = 0;
      if (v10)
        goto LABEL_13;
    }
    __p[0] = 0;
    __p[1] = 0;
    v29 = 0;
LABEL_16:
    v27 = 1;
    v26 = 1;
    std::allocate_shared[abi:ne180100]<quasar::PersonalizedLmData,std::allocator<quasar::PersonalizedLmData>,std::string,char const(&)[1],std::unique_ptr<quasar::TextTokenizer>,std::string,BOOL,BOOL,void>((uint64_t)&buf, "", &v31, (uint64_t)__p, &v27, &v26, &v30);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v11->_data, &v30);
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    if (SHIBYTE(v29) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v34) < 0)
      operator delete((void *)buf);
    v11->_roundingEnabled = 1;
    v20 = *((unsigned int *)v11->_data.__ptr_ + 26);
    if (v20 < 4)
    {
      v11->_inputType = v20 + 1;
      v21 = v31;
      v31 = 0;
      if (v21)
        (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
      goto LABEL_28;
    }
    v11->_inputType = 0;
    EarLmLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AD756000, v23, OS_LOG_TYPE_DEFAULT, "Unsupported input data type", (uint8_t *)&buf, 2u);
    }

    v24 = v31;
    v31 = 0;
    if (v24)
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
LABEL_33:
    v22 = 0;
    goto LABEL_34;
  }
LABEL_28:
  v22 = v11;
LABEL_34:

  return v22;
}

- (void)addDocumentWithUUID:(id)a3 content:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PersonalizedLmData *ptr;
  unsigned int v10;
  void *__p;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    ptr = self->_data.__ptr_;
    objc_msgSend(v6, "ear_toString");
    objc_msgSend(v8, "ear_toString");
    v10 = 0;
    quasar::PersonalizedLmData::addDocument((uint64_t)ptr, (uint64_t)&v13, (uint64_t)&__p, &v10);
    if (v12 < 0)
      operator delete(__p);
    if (v14 < 0)
      operator delete(v13);
  }

}

- (void)addDocumentWithUUID:(id)a3 content:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PersonalizedLmData *ptr;
  NSObject *v15;
  unsigned int v16;
  void *__p;
  char v18;
  uint8_t buf[8];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "valueForKey:", CFSTR("type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        ptr = self->_data.__ptr_;
        objc_msgSend(v8, "ear_toString");
        objc_msgSend(v9, "ear_toString");
        v16 = objc_msgSend(v13, "intValue");
        quasar::PersonalizedLmData::addDocument((uint64_t)ptr, (uint64_t)buf, (uint64_t)&__p, &v16);
        if (v18 < 0)
          operator delete(__p);
        if (v20 < 0)
          operator delete(*(void **)buf);
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {

    }
    EarLmLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_DEFAULT, "Document type is not set properly", buf, 2u);
    }

    v13 = 0;
    goto LABEL_13;
  }
LABEL_14:

}

- (void)addLineWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  PersonalizedLmData *ptr;
  void *__p;
  char v13;
  int v14;
  void *v15;
  char v16;
  uint64_t v17;

  v6 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    ptr = self->_data.__ptr_;
    v14 = v6;
    objc_msgSend(v8, "ear_toString");
    objc_msgSend(v10, "ear_toString");
    quasar::LmData::addLine(ptr, &v14, (uint64_t)&v15, (uint64_t)&__p);
    if (v13 < 0)
      operator delete(__p);
    if (v16 < 0)
      operator delete(v15);
  }

}

- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5 hasWeights:(BOOL)a6
{
  _BOOL8 v6;
  int v8;
  id v10;
  id v11;
  void *v12;
  PersonalizedLmData *ptr;
  void *__p;
  char v15;
  int v16;
  void *v17;
  char v18;
  uint64_t v19;

  v6 = a6;
  v8 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10 && v11)
  {
    ptr = self->_data.__ptr_;
    v16 = v8;
    objc_msgSend(v10, "ear_toString");
    objc_msgSend(v12, "ear_toString");
    (*(void (**)(PersonalizedLmData *, int *, void **, void **, _BOOL8, _QWORD, _QWORD))(*(_QWORD *)ptr + 24))(ptr, &v16, &v17, &__p, v6, 0, 0);
    if (v15 < 0)
      operator delete(__p);
    if (v18 < 0)
      operator delete(v17);
  }

}

- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5
{
  -[_EARLmData addSentenceWithType:uuid:content:hasWeights:](self, "addSentenceWithType:uuid:content:hasWeights:", a3, a4, a5, 0);
}

- (void)addNgramCountWithType:(unint64_t)a3 content:(id)a4
{
  int v4;
  id v6;
  void *v7;
  PersonalizedLmData *ptr;
  void *__p;
  char v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    ptr = self->_data.__ptr_;
    objc_msgSend(v6, "ear_toString");
    quasar::LmData::addNgramCount((uint64_t)ptr, v4, (uint64_t)&__p);
    if (v10 < 0)
      operator delete(__p);
  }

}

- (void)setInputFormat:(int64_t)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10[2];

  cntrl = self->_data.__cntrl_;
  v10[0] = (uint64_t)self->_data.__ptr_;
  v10[1] = (uint64_t)cntrl;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  setInputFormatHelper(v10, a3);
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  self->_inputType = a3;
}

- (void)enumerateSentencesOfType:(unint64_t)a3 block:(id)a4
{
  unsigned int v4;
  void (**v6)(id, void *, _BYTE *);
  quasar::lm::TokenStringAndCount **Sentences;
  quasar::lm::TokenStringAndCount *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  void *v16;
  char v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _BYTE *))a4;
  v17 = 0;
  Sentences = (quasar::lm::TokenStringAndCount **)quasar::LmData::getSentences((uint64_t)self->_data.__ptr_, v4);
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v8 = std::vector<quasar::lm::TokenStringAndCount>::__init_with_size[abi:ne180100]<quasar::lm::TokenStringAndCount*,quasar::lm::TokenStringAndCount*>((quasar::lm::TokenStringAndCount *)&v19, *Sentences, Sentences[1], (Sentences[1] - *Sentences) >> 7);
  v9 = v19;
  for (i = v20; v9 != i; v9 += 128)
  {
    v11 = (void *)MEMORY[0x1AF44DFA0](v8);
    if (!v17)
    {
      v12 = (void *)objc_opt_new();
      v13 = *(uint64_t **)(v9 + 104);
      v14 = *(uint64_t **)(v9 + 112);
      while (v13 != v14)
      {
        v15 = v13;
        if (*((char *)v13 + 23) < 0)
          v15 = (uint64_t *)*v13;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v16);

        v13 += 3;
      }
      v6[2](v6, v12, &v17);

    }
    objc_autoreleasePoolPop(v11);
  }
  v18 = (void **)&v19;
  std::vector<quasar::lm::TokenStringAndCount>::__destroy_vector::operator()[abi:ne180100](&v18);

}

- (BOOL)roomForMoreData
{
  return quasar::LmData::hasRoomForMoreData((quasar::LmData *)self->_data.__ptr_);
}

- (id)sources
{
  __int128 **Sources;

  Sources = (__int128 **)quasar::LmData::getSources((quasar::LmData *)self->_data.__ptr_);
  return EARHelpers::VectorToArray<std::string>(Sources);
}

- (unint64_t)queryLimit
{
  return quasar::LmData::getQueryLimit((quasar::LmData *)self->_data.__ptr_);
}

- (double)maxAge
{
  return quasar::LmData::getMaxAgeSeconds((quasar::LmData *)self->_data.__ptr_);
}

- (double)minAge
{
  return quasar::LmData::getMinAgeSeconds((quasar::LmData *)self->_data.__ptr_);
}

- (id)metrics
{
  void *v2;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  quasar::LmData::getMetrics((quasar::LmData *)self->_data.__ptr_, self->_roundingEnabled, (quasar::PTree *)v4);
  EARHelpers::dictFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  quasar::PTree::~PTree((quasar::PTree *)v4);
  return v2;
}

- (id)wordFrequency
{
  uint64_t WordFrequency;
  void *v3;
  uint64_t *i;
  void *v5;
  _QWORD *v6;
  void *v7;

  WordFrequency = quasar::LmData::getWordFrequency((quasar::LmData *)self->_data.__ptr_);
  v3 = (void *)objc_opt_new();
  for (i = *(uint64_t **)(WordFrequency + 16); i; i = (uint64_t *)*i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)i + 10));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = i + 2;
    if (*((char *)i + 39) < 0)
      v6 = (_QWORD *)*v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v5, v7);

  }
  return v3;
}

- (BOOL)roundingEnabled
{
  return self->_roundingEnabled;
}

- (void)setRoundingEnabled:(BOOL)a3
{
  self->_roundingEnabled = a3;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (shared_ptr<quasar::PersonalizedLmData>)data
{
  PersonalizedLmData **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::PersonalizedLmData> result;

  cntrl = self->_data.__cntrl_;
  *v2 = self->_data.__ptr_;
  v2[1] = (PersonalizedLmData *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PersonalizedLmData *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_data);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
