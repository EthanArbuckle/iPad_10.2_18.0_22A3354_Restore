@implementation _EARTextNormalization

- (_EARTextNormalization)init
{

  return 0;
}

- (_EARTextNormalization)initWithNcsRoot:(id)a3 mungeRuleFile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _EARTextNormalization *v9;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[_EARQuasarTokenizer extractModelRootFromNcsRoot:](_EARQuasarTokenizer, "extractModelRootFromNcsRoot:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[_EARTextNormalization initWithModelRoot:mungeRuleFile:](self, "initWithModelRoot:mungeRuleFile:", v8, v7);

  return v9;
}

- (_EARTextNormalization)initWithNcsRoot:(id)a3 mungeRules:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _EARTextNormalization *v9;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[_EARQuasarTokenizer extractModelRootFromNcsRoot:](_EARQuasarTokenizer, "extractModelRootFromNcsRoot:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[_EARTextNormalization initWithModelRoot:mungeRules:](self, "initWithModelRoot:mungeRules:", v8, v7);

  return v9;
}

- (_EARTextNormalization)initWithNcsRoot:(id)a3
{
  void *v4;
  _EARTextNormalization *v5;

  +[_EARQuasarTokenizer extractModelRootFromNcsRoot:](_EARQuasarTokenizer, "extractModelRootFromNcsRoot:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_EARTextNormalization initWithModelRoot:](self, "initWithModelRoot:", v4);

  return v5;
}

- (_EARTextNormalization)initWithModelRoot:(id)a3 mungeRuleFile:(id)a4
{
  id v6;
  id v7;
  id v8;
  _EARQuasarTokenizer *v9;
  void *v10;
  void **v11;
  void *__p;
  char v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_EARTextNormalization;
  v8 = -[_EARTextNormalization init](&v15, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = -[_EARQuasarTokenizer initWithModelRoot:]([_EARQuasarTokenizer alloc], "initWithModelRoot:", v6);
      v10 = (void *)*((_QWORD *)v8 + 1);
      *((_QWORD *)v8 + 1) = v9;

    }
    if (v7)
    {
      objc_msgSend(v7, "ear_toString");
      v11 = (void **)operator new();
      quasar::Munger::Munger(v11, &__p);
      std::unique_ptr<quasar::Munger>::reset[abi:ne180100]((void ***)v8 + 2, v11);
      if (v14 < 0)
        operator delete(__p);
    }
  }

  return (_EARTextNormalization *)v8;
}

- (_EARTextNormalization)initWithModelRoot:(id)a3 mungeRules:(id)a4
{
  id v6;
  id v7;
  id v8;
  _EARQuasarTokenizer *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  std::string __p;
  _QWORD v15[13];
  char v16;
  uint64_t v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_EARTextNormalization;
  v8 = -[_EARTextNormalization init](&v18, sel_init);
  if (v8)
  {
    v9 = -[_EARQuasarTokenizer initWithModelRoot:]([_EARQuasarTokenizer alloc], "initWithModelRoot:", v6);
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    if (v7)
      objc_msgSend(v7, "ear_toString");
    else
      memset(&__p, 0, sizeof(__p));
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v15, &__p, 24);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v11 = (void **)operator new();
    quasar::Munger::Munger(v11, v15);
    std::unique_ptr<quasar::Munger>::reset[abi:ne180100]((void ***)v8 + 2, v11);
    v15[0] = *MEMORY[0x1E0DE4F50];
    v12 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
    *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
    v15[2] = v12;
    v15[3] = MEMORY[0x1E0DE4FB8] + 16;
    if (v16 < 0)
      operator delete((void *)v15[11]);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x1AF44D094](&v17);
  }

  return (_EARTextNormalization *)v8;
}

- (_EARTextNormalization)initWithModelRoot:(id)a3
{
  id v4;
  _EARTextNormalization *v5;
  _EARQuasarTokenizer *v6;
  _EARTokenizer *tokenizer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EARTextNormalization;
  v5 = -[_EARTextNormalization init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_EARQuasarTokenizer initWithModelRoot:]([_EARQuasarTokenizer alloc], "initWithModelRoot:", v4);
    tokenizer = v5->_tokenizer;
    v5->_tokenizer = &v6->super;

  }
  return v5;
}

- (_EARTextNormalization)initWithMungeRules:(id)a3
{
  id v4;
  id v5;
  void **v6;
  uint64_t v7;
  std::string __p;
  _QWORD v10[13];
  char v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EARTextNormalization;
  v5 = -[_EARTextNormalization init](&v13, sel_init);
  if (v5)
  {
    if (v4)
      objc_msgSend(v4, "ear_toString");
    else
      memset(&__p, 0, sizeof(__p));
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v10, &__p, 24);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v6 = (void **)operator new();
    quasar::Munger::Munger(v6, v10);
    std::unique_ptr<quasar::Munger>::reset[abi:ne180100]((void ***)v5 + 2, v6);
    v10[0] = *MEMORY[0x1E0DE4F50];
    v7 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
    *(_QWORD *)((char *)v10 + *(_QWORD *)(v10[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
    v10[2] = v7;
    v10[3] = MEMORY[0x1E0DE4FB8] + 16;
    if (v11 < 0)
      operator delete((void *)v10[11]);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x1AF44D094](&v12);
  }

  return (_EARTextNormalization *)v5;
}

- (id)normalize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (self->_tokenizer)
  {
    -[_EARTextNormalization tokenize:](self, "tokenize:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_7:
      v7 = v5;
      goto LABEL_8;
    }
  }
  if (!self->_munger.__ptr_.__value_)
    goto LABEL_7;
  -[_EARTextNormalization munge:](self, "munge:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = v7;

  return v8;
}

- (id)tokenize:(id)a3
{
  -[_EARTokenizer tokenize:](self->_tokenizer, "tokenize:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)munge:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  std::vector<std::string>::pointer end;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  std::string *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  void *v18;
  std::vector<std::string> v21;
  void *__p[2];
  std::string::size_type v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  std::__split_buffer<std::string> __v;
  void **v29[18];

  v29[16] = *(void ***)MEMORY[0x1E0C80C00];
  memset(&v21, 0, sizeof(v21));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v23 = 0;
        }

        end = v21.__end_;
        if (v21.__end_ >= v21.__end_cap_.__value_)
        {
          v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21.__end_ - (char *)v21.__begin_) >> 3);
          v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3) > v12)
            v12 = 0x5555555555555556 * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3) >= 0x555555555555555)
            v13 = 0xAAAAAAAAAAAAAAALL;
          else
            v13 = v12;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v21.__end_cap_;
          if (v13)
            v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v21.__end_cap_, v13);
          else
            v14 = 0;
          v15 = v14 + v11;
          __v.__first_ = v14;
          __v.__begin_ = v15;
          __v.__end_cap_.__value_ = &v14[v13];
          v16 = *(_OWORD *)__p;
          v15->__r_.__value_.__r.__words[2] = v23;
          *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
          __p[1] = 0;
          v23 = 0;
          __p[0] = 0;
          __v.__end_ = v15 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v21, &__v);
          v17 = v21.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v21.__end_ = v17;
          if (SHIBYTE(v23) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v10 = *(_OWORD *)__p;
          v21.__end_->__r_.__value_.__r.__words[2] = v23;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
          v21.__end_ = end + 1;
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v4);
  }

  quasar::Munger::munge((uint64_t)self->_munger.__ptr_.__value_, (uint64_t *)&v21, 0, 0);
  EARHelpers::VectorToArray<std::string>((__int128 **)&v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = (void **)&v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v29);

  return v18;
}

- (void).cxx_destruct
{
  std::unique_ptr<quasar::Munger>::reset[abi:ne180100]((void ***)&self->_munger, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
