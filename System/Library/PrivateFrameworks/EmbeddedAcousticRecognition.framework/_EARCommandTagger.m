@implementation _EARCommandTagger

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARCommandTagger)initWithConfiguration:(id)a3 usage:(int64_t)a4
{
  id v6;
  _EARCommandTagger *v7;
  int JsonFile;
  _EARCommandTagger *v9;
  uint64_t v10;
  CommandTagger *value;
  void *v13[2];
  __int128 v14;
  int v15;
  uint64_t v16[3];
  void *__p[2];
  uint64_t v18;
  _BYTE v19[1544];
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_EARCommandTagger;
  v7 = -[_EARCommandTagger init](&v20, sel_init);
  if (!v7)
    goto LABEL_17;
  if (!a4)
  {
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v19);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v18 = 0;
    }
    memset(v16, 0, sizeof(v16));
    *(_OWORD *)v13 = 0u;
    v14 = 0u;
    v15 = 1065353216;
    JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)v19, (uint64_t)__p, v16, (uint64_t)v13, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v13);
    v13[0] = v16;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v13);
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
    if (JsonFile == 2)
    {
      quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v19);
      goto LABEL_10;
    }
    v10 = operator new();
    std::string::basic_string[abi:ne180100]<0>(v13, "osx");
    quasar::CommandTagger::CommandTagger(v10, v19, v13);
    if (SBYTE7(v14) < 0)
      operator delete(v13[0]);
    value = v7->_tagger.__ptr_.__value_;
    v7->_tagger.__ptr_.__value_ = (CommandTagger *)v10;
    if (value)
    {
      (*(void (**)(CommandTagger *))(*(_QWORD *)value + 8))(value);
      v9 = (_EARCommandTagger *)v7->_tagger.__ptr_.__value_;
      quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v19);
      if (!v9)
        goto LABEL_18;
    }
    else
    {
      quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v19);
    }
LABEL_17:
    v9 = v7;
    goto LABEL_18;
  }
LABEL_10:
  v9 = 0;
LABEL_18:

  return v9;
}

- (id)commandTaggingFromRecognitionResult:(id)a3 activeCommands:(id)a4
{
  id v6;
  uint64_t *value;
  void *v8;
  uint64_t *v10[3];
  void **v11[3];
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  _BYTE v15[8];
  char *v16;
  void ***v17;

  v6 = a3;
  EARHelpers::StdSetOfStringsFromNSSet((EARHelpers *)a4, (uint64_t)v15);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  value = (uint64_t *)self->_tagger.__ptr_.__value_;
  EARHelpers::QuasarPreItnNbestFromEARNBest(v6, (uint64_t *)v11);
  quasar::CommandTagger::run(value, (uint64_t *)v11, (uint64_t *)&v12, (uint64_t)v15);
  v17 = v11;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  memset(v10, 0, sizeof(v10));
  std::vector<std::vector<quasar::CommandTagging>>::__init_with_size[abi:ne180100]<std::vector<quasar::CommandTagging>*,std::vector<quasar::CommandTagging>*>(v10, v12, v13, 0xAAAAAAAAAAAAAAABLL * (v13 - v12));
  EARHelpers::EARCommandTaggingResultArrayFromQuasarResults(v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = (void **)v10;
  std::vector<std::vector<quasar::CommandTagging>>::__destroy_vector::operator()[abi:ne180100](v11);
  v11[0] = (void **)&v12;
  std::vector<std::vector<quasar::CommandTagging>>::__destroy_vector::operator()[abi:ne180100](v11);
  std::__tree<std::string>::destroy((uint64_t)v15, v16);

  return v8;
}

- (id)parameterTagForIndex:(int64_t)a3
{
  void *v3;
  void *p_p;
  void *v5;
  void *__p;
  char v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  quasar::CommandTagger::getParameterTag((quasar::CommandTagger *)self->_tagger.__ptr_.__value_);
  if (v8 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(v3, "stringWithUTF8String:", p_p);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 < 0)
    operator delete(__p);
  return v5;
}

- (id)commandPhraseTagForIndex:(int64_t)a3
{
  void *v3;
  void *p_p;
  void *v5;
  void *__p;
  char v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  quasar::CommandTagger::getCommandPhraseTag((quasar::CommandTagger *)self->_tagger.__ptr_.__value_);
  if (v8 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(v3, "stringWithUTF8String:", p_p);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 < 0)
    operator delete(__p);
  return v5;
}

- (BOOL)isParameterTag:(id)a3
{
  id v4;
  void *v5;
  CommandTagger *value;
  BOOL isParameterTag;
  std::string __p;

  v4 = a3;
  v5 = v4;
  value = self->_tagger.__ptr_.__value_;
  if (v4)
    objc_msgSend(v4, "ear_toString");
  else
    memset(&__p, 0, sizeof(__p));
  isParameterTag = quasar::CommandTagger::isParameterTag((uint64_t)value, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return isParameterTag;
}

- (BOOL)isCommandPhraseTag:(id)a3
{
  id v4;
  void *v5;
  CommandTagger *value;
  BOOL isCommandPhraseTag;
  std::string __p;

  v4 = a3;
  v5 = v4;
  value = self->_tagger.__ptr_.__value_;
  if (v4)
    objc_msgSend(v4, "ear_toString");
  else
    memset(&__p, 0, sizeof(__p));
  isCommandPhraseTag = quasar::CommandTagger::isCommandPhraseTag((uint64_t)value, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return isCommandPhraseTag;
}

- (void).cxx_destruct
{
  CommandTagger *value;

  value = self->_tagger.__ptr_.__value_;
  self->_tagger.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CommandTagger *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
