@implementation _EARAppLmData

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARAppLmData)initWithAppLmData:(shared_ptr<quasar::AppLmData>)a3
{
  uint64_t *ptr;
  _EARAppLmData *v4;
  _EARAppLmData *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)_EARAppLmData;
  v4 = -[_EARAppLmData init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::operator=[abi:ne180100](&v4->data.__ptr_, ptr);
  return v5;
}

- (NSArray)orderedOovs
{
  void *v2;
  __int128 *v3;
  __int128 *i;
  __int128 v5;
  void *v6;
  void *v7;
  __int128 *v9;
  __int128 *v10;
  std::string v11;
  uint64_t v12[3];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  quasar::AppLmData::getOrderedOovs((quasar::AppLmData *)self->data.__ptr_, &v9);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  for (i = v10; v3 != i; v3 = (__int128 *)((char *)v3 + 56))
  {
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
    }
    else
    {
      v5 = *v3;
      v11.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
      *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v5;
    }
    std::set<std::string>::set[abi:ne180100](v12, (const void ***)v3 + 3);
    v13 = *((_DWORD *)v3 + 12);
    _earOovToken((const quasar::AppLmData::Oov *)&v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

    std::__tree<std::string>::destroy((uint64_t)v12, (char *)v12[1]);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
  v7 = (void *)objc_msgSend(v2, "copy");

  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&v9;
  std::vector<quasar::AppLmData::Oov>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
  return (NSArray *)v7;
}

- (_EARAppLmData)initWithConfiguration:(id)a3 recognizerConfigPath:(id)a4
{
  return -[_EARAppLmData initWithConfiguration:ncsRoot:recognizerConfigPath:](self, "initWithConfiguration:ncsRoot:recognizerConfigPath:", a3, 0, a4);
}

- (_EARAppLmData)initWithConfiguration:(id)a3 ncsRoot:(id)a4 recognizerConfigPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARAppLmData *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _EARAppLmData *v23;
  NSObject *v24;
  uint64_t v25;
  void *__p[2];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  objc_super v31;
  __int128 buf;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_EARAppLmData;
  v11 = -[_EARAppLmData init](&v31, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v8);

    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "fileExistsAtPath:", v10);

      if ((v15 & 1) != 0)
      {
        v30 = 0;
        if (v9)
          +[_EARQuasarTokenizer tokenizerWithNcsRoot:](_EARQuasarTokenizer, "tokenizerWithNcsRoot:", v9);
        else
          +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:](_EARQuasarTokenizer, "tokenizerWithRecognizerConfigPath:", v10);
        v17 = buf;
        *(_QWORD *)&buf = 0;
        v30 = v17;
        if (v8)
        {
          objc_msgSend(v8, "ear_toString");
          if (v10)
          {
LABEL_15:
            objc_msgSend(v10, "ear_toString");
            goto LABEL_18;
          }
        }
        else
        {
          buf = 0uLL;
          v33 = 0;
          if (v10)
            goto LABEL_15;
        }
        __p[0] = 0;
        __p[1] = 0;
        v28 = 0;
LABEL_18:
        std::allocate_shared[abi:ne180100]<quasar::AppLmData,std::allocator<quasar::AppLmData>,std::string,char const(&)[1],std::unique_ptr<quasar::TextTokenizer>,std::string,void>((uint64_t)&buf, "", &v30, (uint64_t)__p, &v29);
        std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v11->data, &v29);
        v18 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
        if (*((_QWORD *)&v29 + 1))
        {
          v19 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
          do
            v20 = __ldaxr(v19);
          while (__stlxr(v20 - 1, v19));
          if (!v20)
          {
            ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
            std::__shared_weak_count::__release_weak(v18);
          }
        }
        if (SHIBYTE(v28) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v33) < 0)
          operator delete((void *)buf);
        v11->roundingEnabled = 1;
        v21 = *((unsigned int *)v11->data.__ptr_ + 26);
        if (v21 < 4)
        {
          v11->inputType = v21 + 1;
          v22 = v30;
          v30 = 0;
          if (v22)
            (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          goto LABEL_30;
        }
        v11->inputType = 0;
        EarLmLogger();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1AD756000, v24, OS_LOG_TYPE_DEFAULT, "Unsupported input data type", (uint8_t *)&buf, 2u);
        }

        v25 = v30;
        v30 = 0;
        if (v25)
          (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
LABEL_35:
        v23 = 0;
        goto LABEL_36;
      }
      EarLmLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1AD756000, v16, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      EarLmLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1AD756000, v16, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_35;
  }
LABEL_30:
  v23 = v11;
LABEL_36:

  return v23;
}

- (void)addLineWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  AppLmData *ptr;
  void *__p[2];
  uint64_t v13;
  int v14;
  void *v15[2];
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  ptr = self->data.__ptr_;
  v14 = v6;
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
    if (v10)
    {
LABEL_3:
      objc_msgSend(v10, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v15[0] = 0;
    v15[1] = 0;
    v16 = 0;
    if (v9)
      goto LABEL_3;
  }
  __p[0] = 0;
  __p[1] = 0;
  v13 = 0;
LABEL_6:
  quasar::LmData::addLine(ptr, &v14, (uint64_t)v15, (uint64_t)__p);
  if (SHIBYTE(v13) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);

}

- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5 hasWeights:(BOOL)a6
{
  _BOOL8 v6;
  int v8;
  id v10;
  id v11;
  void *v12;
  AppLmData *ptr;
  void *__p[2];
  uint64_t v15;
  int v16;
  void *v17[2];
  uint64_t v18;
  uint64_t v19;

  v6 = a6;
  v8 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = v11;
  ptr = self->data.__ptr_;
  v16 = v8;
  if (v10)
  {
    objc_msgSend(v10, "ear_toString");
    if (v12)
    {
LABEL_3:
      objc_msgSend(v12, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v17[0] = 0;
    v17[1] = 0;
    v18 = 0;
    if (v11)
      goto LABEL_3;
  }
  __p[0] = 0;
  __p[1] = 0;
  v15 = 0;
LABEL_6:
  (*(void (**)(AppLmData *, int *, void **, void **, _BOOL8, _QWORD, _QWORD))(*(_QWORD *)ptr + 24))(ptr, &v16, v17, __p, v6, 0, 0);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v18) < 0)
    operator delete(v17[0]);

}

- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5
{
  -[_EARAppLmData addSentenceWithType:uuid:content:hasWeights:](self, "addSentenceWithType:uuid:content:hasWeights:", a3, a4, a5, 0);
}

- (void)addNgramCountWithType:(unint64_t)a3 content:(id)a4
{
  int v4;
  id v6;
  void *v7;
  AppLmData *ptr;
  void *__p[2];
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  ptr = self->data.__ptr_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  quasar::LmData::addNgramCount((uint64_t)ptr, v4, (uint64_t)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

}

- (void)setInputFormat:(int64_t)a3
{
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10[2];

  cntrl = self->data.__cntrl_;
  v10[0] = (uint64_t)self->data.__ptr_;
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
  self->inputType = a3;
}

- (id)addOovTokensFromSentence:(id)a3
{
  id v4;
  void *v5;
  AppLmData *ptr;
  void *v7;
  void *v8;
  void *__p[2];
  uint64_t v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->data.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v11 = 0;
  }
  quasar::AppLmData::addOovTokensFromSentence((uint64_t)ptr, (uint64_t)__p, (uint64_t)v12);
  EARHelpers::ContainerToNSSet<std::set<std::string>>(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<std::string>::destroy((uint64_t)v12, (char *)v12[1]);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)setProns:(id)a3 forWord:(id)a4 pronIsXsampa:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  AppLmData *ptr;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  char v19;
  std::string v21;
  void *v22[2];
  uint64_t v23;
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *__p[2];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v24 = a5;
  ptr = self->data.__ptr_;
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    v22[0] = 0;
    v22[1] = 0;
    v23 = 0;
  }
  v12 = v8;
  *(_OWORD *)&v21.__r_.__value_.__r.__words[1] = 0uLL;
  v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v21.__r_.__value_.__l.__size_;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v13);
        v17 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v30 = 0;
        }

        std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v21, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v30) < 0)
          operator delete(__p[0]);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v14);
  }

  v19 = quasar::AppLmData::setPronsForWord((uint64_t)ptr, v22, &v21, &v24);
  std::__tree<std::string>::destroy((uint64_t)&v21, (char *)v21.__r_.__value_.__l.__size_);
  if (SHIBYTE(v23) < 0)
    operator delete(v22[0]);

  return v19;
}

- (BOOL)setXsampaProns:(id)a3 forWord:(id)a4
{
  return -[_EARAppLmData setProns:forWord:pronIsXsampa:](self, "setProns:forWord:pronIsXsampa:", a3, a4, 1);
}

- (BOOL)setAsrProns:(id)a3 forWord:(id)a4
{
  return -[_EARAppLmData setProns:forWord:pronIsXsampa:](self, "setProns:forWord:pronIsXsampa:", a3, a4, 0);
}

- (int64_t)canAddProns:(id)a3 forWord:(id)a4 pronIsXsampa:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  AppLmData *ptr;
  id v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  uint64_t *v20;
  char *v21[2];
  void *v22[2];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  ptr = self->data.__ptr_;
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    v22[0] = 0;
    v22[1] = 0;
    v23 = 0;
  }
  v12 = v8;
  v21[0] = 0;
  v21[1] = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = (int64_t)v12;
  v14 = objc_msgSend((id)v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16, v21);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation((id)v13);
        v17 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v29 = 0;
        }

        std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>(&v20, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v29) < 0)
          operator delete(__p[0]);

      }
      v14 = objc_msgSend((id)v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v14);
  }

  LODWORD(v13) = quasar::AppLmData::canAddProns((uint64_t)ptr, (uint64_t)v22, &v20, v5);
  std::__tree<std::string>::destroy((uint64_t)&v20, v21[0]);
  if (SHIBYTE(v23) < 0)
    operator delete(v22[0]);
  if (v13 >= 4)
    v13 = 4;
  else
    v13 = v13;

  return v13;
}

- (int64_t)canAddXsampaProns:(id)a3 forWord:(id)a4
{
  return -[_EARAppLmData canAddProns:forWord:pronIsXsampa:](self, "canAddProns:forWord:pronIsXsampa:", a3, a4, 1);
}

- (int64_t)canAddAsrProns:(id)a3 forWord:(id)a4
{
  return -[_EARAppLmData canAddProns:forWord:pronIsXsampa:](self, "canAddProns:forWord:pronIsXsampa:", a3, a4, 0);
}

- (void)generateLmeData:(id)a3
{
  id v4;
  void *v5;
  AppLmData *ptr;
  void *__p[2];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->data.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v8 = 0;
  }
  quasar::AppLmData::generateLmeData((uint64_t)ptr, (uint64_t)__p);
  if (SHIBYTE(v8) < 0)
    operator delete(__p[0]);

}

- (int64_t)lmeThreshold
{
  return quasar::AppLmData::getLmeThreshold((quasar::AppLmData *)self->data.__ptr_);
}

- (id)supportedSlots
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  quasar::AppLmData::getSupportedSlots((uint64_t *)self->data.__ptr_, (uint64_t)v5);
  EARHelpers::ContainerToNSSet<std::set<std::string>>(v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<std::string>::destroy((uint64_t)v5, (char *)v5[1]);
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metrics
{
  void *v2;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  quasar::LmData::getMetrics((quasar::LmData *)self->data.__ptr_, self->roundingEnabled, (quasar::PTree *)v4);
  EARHelpers::dictFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  quasar::PTree::~PTree((quasar::PTree *)v4);
  return v2;
}

- (shared_ptr<quasar::AppLmData>)data
{
  AppLmData **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::AppLmData> result;

  cntrl = self->data.__cntrl_;
  *v2 = self->data.__ptr_;
  v2[1] = (AppLmData *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AppLmData *)self;
  return result;
}

- (BOOL)roundingEnabled
{
  return self->roundingEnabled;
}

- (void)setRoundingEnabled:(BOOL)a3
{
  self->roundingEnabled = a3;
}

- (int64_t)inputType
{
  return self->inputType;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->data);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
