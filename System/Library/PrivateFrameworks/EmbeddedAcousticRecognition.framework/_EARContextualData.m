@implementation _EARContextualData

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARContextualData)initWithConfiguration:(id)a3
{
  id v4;
  _EARContextualData *v5;
  _EARContextualData *v6;
  void *v7;
  char v8;
  quasar::ContextualData *v9;
  shared_ptr<quasar::ContextualData> *p_contextualData;
  void **v11;
  _EARContextualData *v12;
  quasar::ContextualData *v14;
  void *__p[2];
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_EARContextualData;
  v5 = -[_EARContextualData init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v4);

    if ((v8 & 1) != 0)
    {
      if (v4)
      {
        objc_msgSend(v4, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        *(_QWORD *)&v16 = 0;
      }
      v9 = (quasar::ContextualData *)operator new();
      quasar::ContextualData::ContextualData(v9, __p);
      v14 = v9;
      p_contextualData = &v5->_contextualData;
      std::shared_ptr<quasar::ContextualData>::operator=[abi:ne180100]<quasar::ContextualData,std::default_delete<quasar::ContextualData>,void>(p_contextualData, (uint64_t *)&v14);
      v11 = (void **)v14;
      v14 = 0;
      if (v11)
      {
        quasar::ContextualData::~ContextualData(v11);
        MEMORY[0x1AF44D190]();
      }
      if (SBYTE7(v16) < 0)
        operator delete(__p[0]);
      if ((quasar::ContextualData::getIsEnabled((quasar::ContextualData *)p_contextualData->__ptr_) & 1) != 0)
        goto LABEL_13;
    }
    else if (quasar::gLogLevel >= 4)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      *(_OWORD *)__p = 0u;
      v16 = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Contextual data: configuration file does not exist", 50);
      quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__p);
    }
    v12 = 0;
    goto LABEL_15;
  }
LABEL_13:
  v12 = v6;
LABEL_15:

  return v12;
}

- (BOOL)addNamedEntity:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  void *__p[2];
  void *v21[2];
  __int128 v22;
  void *v23[2];
  void *v24[4];
  int v25;
  uint64_t v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForKey:", CFSTR("category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("category"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v7, "valueForKey:", CFSTR("language"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("language"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v7, "valueForKey:", CFSTR("score"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v7, "valueForKey:", CFSTR("sourceFramework"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("sourceFramework"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  if (objc_msgSend(v6, "length") && v15)
  {
    v26 = 0;
    v27 = 0;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)v21 = 0u;
    v22 = 0u;
    *(_OWORD *)v23 = 0u;
    memset(v24, 0, sizeof(v24));
    v25 = 0;
    if (objc_msgSend(v15, "intValue") == 1)
    {
      if (v9 && objc_msgSend(v11, "length"))
      {
        if (v6)
        {
          objc_msgSend(v6, "ear_toString");
        }
        else
        {
          v28 = 0uLL;
          *(_QWORD *)&v29 = 0;
        }
        if (SHIBYTE(v21[0]) < 0)
          operator delete(__p[0]);
        v25 = objc_msgSend(v9, "intValue", v28, (_QWORD)v29);
        if (v11)
        {
          objc_msgSend(v11, "ear_toString");
        }
        else
        {
          v28 = 0uLL;
          *(_QWORD *)&v29 = 0;
        }
        if (SHIBYTE(v24[3]) < 0)
          operator delete(v24[1]);
        *(_OWORD *)&v24[1] = v28;
        v24[3] = (void *)v29;
        objc_msgSend(v13, "doubleValue");
        v26 = v18;
        v17 = 1;
LABEL_42:
        v27 = v17;
        v16 = quasar::ContextualData::addNamedEntity((uint64_t **)self->_contextualData.__ptr_, (quasar::ContextualData::NamedEntity *)__p);
        goto LABEL_43;
      }
      if (quasar::gLogLevel >= 4)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v28 = 0u;
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v28);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v28, (uint64_t)"Contextual data: missing category or language for Portrait named entity", 71);
        quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)&v28);
      }
    }
    else if (objc_msgSend(v15, "intValue") == 2)
    {
      if (v6)
      {
        objc_msgSend(v6, "ear_toString");
      }
      else
      {
        v28 = 0uLL;
        *(_QWORD *)&v29 = 0;
      }
      if (SHIBYTE(v21[0]) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = v28;
      v21[0] = (void *)v29;
      v17 = 2;
      goto LABEL_42;
    }
    v16 = 0;
LABEL_43:
    if (SHIBYTE(v24[3]) < 0)
      operator delete(v24[1]);
    if (SHIBYTE(v24[0]) < 0)
      operator delete(v23[0]);
    if (SHIBYTE(v22) < 0)
      operator delete(v21[1]);
    if (SHIBYTE(v21[0]) < 0)
      operator delete(__p[0]);
    goto LABEL_51;
  }
  if (quasar::gLogLevel >= 4)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v28);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v28, (uint64_t)"Contextual data: invalid contextual named entity data", 53);
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)&v28);
  }
  v16 = 0;
LABEL_51:

  return v16;
}

- (void)iterNamedEntitySourceWithApplication:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, void *);
  ContextualData *ptr;
  __n128 v9;
  uint64_t *i;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *__p[2];
  char v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[16];
  uint64_t *v21;

  v6 = a3;
  v7 = (void (**)(id, void *, void *, void *))a4;
  ptr = self->_contextualData.__ptr_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v18 = 0uLL;
    v19 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Dictation");
  v9.n128_f64[0] = quasar::ContextualData::getNamedEntityQueryConfig((uint64_t)ptr, &v18, (unsigned __int8 *)__p, (uint64_t)v20);
  if (v17 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v19) < 0)
    operator delete((void *)v18);
  for (i = v21; i; i = (uint64_t *)*i)
  {
    v11 = i + 2;
    v12 = (void *)MEMORY[0x1AF44DFA0](v9);
    if (*((char *)i + 39) < 0)
      v11 = (_QWORD *)*v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)-*((_DWORD *)i + 11));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)-*((_DWORD *)i + 12));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13, v14, v15);

    objc_autoreleasePoolPop(v12);
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v20);

}

- (void)iterNamedEntitySourceWithApplication:(id)a3 task:(id)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, id, void *, void *, _QWORD);
  ContextualData *ptr;
  __n128 v11;
  uint64_t *v12;
  void *v13;
  id v14;
  _BOOL4 v17;
  uint64_t *v18;
  uint64_t *i;
  uint64_t *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *__p[2];
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[16];
  uint64_t *v31;

  v8 = a3;
  v25 = a4;
  v9 = (void (**)(id, id, void *, void *, _QWORD))a5;
  ptr = self->_contextualData.__ptr_;
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
  }
  else
  {
    v28 = 0uLL;
    v29 = 0;
  }
  if (v25)
  {
    objc_msgSend(v25, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v27 = 0;
  }
  v11.n128_f64[0] = quasar::ContextualData::getNamedEntityQueryConfig((uint64_t)ptr, &v28, (unsigned __int8 *)__p, (uint64_t)v30);
  if (SHIBYTE(v27) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v29) < 0)
    operator delete((void *)v28);
  v12 = v31;
  if (!v31)
    goto LABEL_42;
  do
  {
    v13 = (void *)MEMORY[0x1AF44DFA0](v11);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    quasar::toLower((uint64_t)(v12 + 2), (uint64_t)&v28);
    if (SHIBYTE(v29) < 0)
    {
      if (*((_QWORD *)&v28 + 1) == 3)
      {
        v17 = *(_WORD *)v28 != 27745 || *(_BYTE *)(v28 + 2) != 108;
        operator delete((void *)v28);
        if (!v17)
        {
LABEL_40:
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)-*((_DWORD *)v12 + 11));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)-*((_DWORD *)v12 + 12));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v14, v23, v24, *((int *)v12 + 10));

          goto LABEL_41;
        }
      }
      else
      {
        operator delete((void *)v28);
      }
    }
    else if (SHIBYTE(v29) == 3 && (unsigned __int16)v28 == 27745 && BYTE2(v28) == 108)
    {
      goto LABEL_40;
    }
    v28 = 0uLL;
    v29 = 0;
    kaldi::SplitStringToVector((const std::string *)(v12 + 2), ",|", 1, (uint64_t)&v28);
    v18 = (uint64_t *)*((_QWORD *)&v28 + 1);
    for (i = (uint64_t *)v28; i != v18; i += 3)
    {
      if (*((char *)i + 23) < 0)
      {
        if (!i[1])
          continue;
        v20 = (uint64_t *)*i;
LABEL_37:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

        continue;
      }
      v20 = i;
      if (*((_BYTE *)i + 23))
        goto LABEL_37;
    }
    v22 = objc_msgSend(v14, "count");
    __p[0] = &v28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    if (v22)
      goto LABEL_40;
LABEL_41:

    objc_autoreleasePoolPop(v13);
    v12 = (uint64_t *)*v12;
  }
  while (v12);
LABEL_42:
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v30);

}

- (void)iterRankedContactSourceWithApplication:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, _QWORD);
  ContextualData *ptr;
  __n128 v9;
  uint64_t *i;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *__p[2];
  char v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t *v20;

  v6 = a3;
  v7 = (void (**)(id, void *, void *, _QWORD))a4;
  ptr = self->_contextualData.__ptr_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v17 = 0uLL;
    v18 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Dictation");
  v9.n128_f64[0] = quasar::ContextualData::getRankedContactQueryConfig((uint64_t)ptr, &v17, (unsigned __int8 *)__p, (uint64_t)v19);
  if (v16 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v18) < 0)
    operator delete((void *)v17);
  for (i = v20; i; i = (uint64_t *)*i)
  {
    v11 = i + 2;
    v12 = (void *)MEMORY[0x1AF44DFA0](v9);
    if (*((char *)i + 39) < 0)
      v11 = (_QWORD *)*v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13, v14, *((unsigned __int8 *)i + 52));

    objc_autoreleasePoolPop(v12);
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v19);

}

- (void)iterRankedContactSourceWithApplication:(id)a3 task:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  ContextualData *ptr;
  __n128 v12;
  uint64_t *i;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *__p[2];
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[16];
  uint64_t *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ptr = self->_contextualData.__ptr_;
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v20 = 0uLL;
    v21 = 0;
    if (v9)
      goto LABEL_3;
  }
  __p[0] = 0;
  __p[1] = 0;
  v19 = 0;
LABEL_6:
  v12.n128_f64[0] = quasar::ContextualData::getRankedContactQueryConfig((uint64_t)ptr, &v20, (unsigned __int8 *)__p, (uint64_t)v22);
  if (SHIBYTE(v19) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v21) < 0)
    operator delete((void *)v20);
  for (i = v23; i; i = (uint64_t *)*i)
  {
    v14 = i + 2;
    v15 = (void *)MEMORY[0x1AF44DFA0](v12);
    if (*((char *)i + 39) < 0)
      v14 = (_QWORD *)*v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *, _QWORD, _QWORD))v10 + 2))(v10, v16, v17, *((unsigned __int8 *)i + 52), *((int *)i + 10));

    objc_autoreleasePoolPop(v15);
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v22);

}

- (id)metrics
{
  id v3;
  ContextualData *ptr;
  id v5;
  quasar::PTree *v6;
  uint64_t v7;
  EARHelpers *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  ptr = self->_contextualData.__ptr_;
  if (ptr)
  {
    quasar::ContextualData::getStats((quasar::ContextualData *)ptr, (uint64_t *)&v9);
    EARHelpers::dictFromPTree(v9, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    v9 = 0;
    if (v6)
    {
      quasar::PTree::~PTree(v6);
      MEMORY[0x1AF44D190](v7);
    }
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (BOOL)containsEntity
{
  ContextualData *ptr;

  ptr = self->_contextualData.__ptr_;
  if (ptr)
    LOBYTE(ptr) = quasar::ContextualData::containsWords((quasar::ContextualData *)ptr);
  return (char)ptr;
}

- (map<std::string,)getWords
{
  map<std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>> *result;

  result = (map<std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>> *)self->_contextualData.__ptr_;
  if (result)
    return (map<std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>> *)quasar::ContextualData::getWords((const void ***)result, (uint64_t *)retstr);
  retstr->var0.var2.var0 = 0;
  retstr->var0.var1.var0.__left_ = 0;
  retstr->var0.var0 = &retstr->var0.var1;
  return result;
}

- (unordered_map<std::string,)getTemplateToAverageCost
{
  unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *result;

  result = (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)self->_contextualData.__ptr_;
  if (result)
    return (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)quasar::ContextualData::getTemplateToAverageCost((quasar::ContextualData *)result, (uint64_t)retstr);
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  return result;
}

- (unordered_map<std::string,)getTemplateToDeviationCost
{
  unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *result;

  result = (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)self->_contextualData.__ptr_;
  if (result)
    return (unordered_map<std::string, double, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, double>>> *)quasar::ContextualData::getTemplateToDeviationCost((quasar::ContextualData *)result, (uint64_t)retstr);
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_contextualData);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
