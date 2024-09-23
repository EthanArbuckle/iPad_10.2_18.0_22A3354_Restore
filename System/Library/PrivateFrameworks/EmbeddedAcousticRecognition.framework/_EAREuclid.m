@implementation _EAREuclid

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4
{
  return -[_EAREuclid initWithConfiguration:euclidEncoderType:initFlag:](self, "initWithConfiguration:euclidEncoderType:initFlag:", a3, a4, 0);
}

- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4 initFlag:(int64_t)a5
{
  return -[_EAREuclid initWithConfiguration:euclidEncoderType:initFlag:overrides:](self, "initWithConfiguration:euclidEncoderType:initFlag:overrides:", a3, a4, a5, 0);
}

- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4 initFlag:(int64_t)a5 overrides:(id)a6
{
  id v10;
  id v11;
  unsigned int v12;
  QuasarEuclid *v13;
  QuasarEuclid *value;
  void *v15;
  _EAREuclid *v16;
  void *__p[2];
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35[3];
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)(uint64_t);
  _BYTE v42[32];
  uint64_t v43;
  int v44;
  _BYTE v45[1544];
  void **v46;

  v10 = a3;
  v11 = a6;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v45);
  v37 = 0;
  v38 = &v37;
  v39 = 0x5812000000;
  v40 = __Block_byref_object_copy__5;
  v41 = __Block_byref_object_dispose__5;
  memset(v42, 0, sizeof(v42));
  v43 = 0;
  v44 = 1065353216;
  if (v11)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __73___EAREuclid_initWithConfiguration_euclidEncoderType_initFlag_overrides___block_invoke;
    v36[3] = &unk_1E5D47798;
    v36[4] = &v37;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v36);
  }
  if (v10)
  {
    objc_msgSend(v10, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(_QWORD *)&v19 = 0;
  }
  memset(v35, 0, sizeof(v35));
  quasar::SystemConfig::readJsonFile((uint64_t)v45, (uint64_t)__p, v35, (uint64_t)(v38 + 6), 1, 1);
  v46 = (void **)v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v46);
  if (SBYTE7(v19) < 0)
    operator delete(__p[0]);
  if (a5 == 1)
  {
    v12 = 1;
  }
  else
  {
    if (a5)
    {
      if (quasar::gLogLevel >= 1)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
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
        *(_OWORD *)__p = 0u;
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Unrecognized EAREuclidInitFlag: ", 32);
        std::ostream::operator<<();
        quasar::QuasarErrorMessage::~QuasarErrorMessage((quasar::QuasarErrorMessage *)__p);
      }
      goto LABEL_24;
    }
    v12 = 0;
  }
  if (a4 != 1)
  {
    if (!a4)
    {
      quasar::QuasarEuclid::createQuasarEuclid((uint64_t)v45, 0, v12, 0, __p);
      goto LABEL_18;
    }
    if (quasar::gLogLevel >= 1)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
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
      *(_OWORD *)__p = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Unrecognized EAREuclidEncoderType: ", 35);
      std::ostream::operator<<();
      quasar::QuasarErrorMessage::~QuasarErrorMessage((quasar::QuasarErrorMessage *)__p);
    }
LABEL_24:
    v16 = 0;
    goto LABEL_25;
  }
  quasar::QuasarEuclid::createQuasarEuclid((uint64_t)v45, 1, v12, 0, __p);
LABEL_18:
  v13 = (QuasarEuclid *)__p[0];
  __p[0] = 0;
  value = self->_quasarEuclid.__ptr_.__value_;
  self->_quasarEuclid.__ptr_.__value_ = v13;
  if (value)
  {
    (*(void (**)(QuasarEuclid *))(*(_QWORD *)value + 8))(value);
    v15 = __p[0];
    __p[0] = 0;
    if (v15)
      (*(void (**)(void *))(*(_QWORD *)v15 + 8))(v15);
  }
  v16 = self;
LABEL_25:
  _Block_object_dispose(&v37, 8);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v42[8]);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v45);

  return v16;
}

- (id)findNearestNeighbors:(id)a3 numberOfNeighbors:(int64_t)a4
{
  id v6;
  void *v7;
  QuasarEuclid *value;
  EARLogger *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  _EAREuclidNeighbor *v14;
  void *v15;
  double v16;
  void *v17;
  _EAREuclidNeighbor *v18;
  void *v19;
  void *__p;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = v6;
  value = self->_quasarEuclid.__ptr_.__value_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    __p = 0;
    v22 = 0;
    v23 = 0;
  }
  v9 = (EARLogger *)(*(_QWORD *(**)(uint64_t *__return_ptr, QuasarEuclid *, void **, int64_t, _QWORD))(*(_QWORD *)value + 16))(&v24, value, &__p, a4, 0);
  if (SHIBYTE(v23) < 0)
    operator delete(__p);
  if (v24 == v25)
  {
    EARLogger::QuasarOSLogger(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_1AD756000, v10, OS_LOG_TYPE_INFO, "No nearest neighbors found", (uint8_t *)&__p, 2u);
    }

  }
  v11 = (void *)objc_opt_new();
  if (v25 != v24)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = [_EAREuclidNeighbor alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __p, v22, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = *(_DWORD *)(v24 + v12 + 28);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[_EAREuclidNeighbor initWithName:distance:](v14, "initWithName:distance:", v15, v17);

      objc_msgSend(v11, "addObject:", v18);
      ++v13;
      v12 += 32;
    }
    while (v13 < (v25 - v24) >> 5);
  }
  v19 = (void *)objc_msgSend(v11, "copy", __p);

  __p = &v24;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v19;
}

- (id)distanceBetweenSource:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  QuasarEuclid *value;
  double v11;
  void *v12;
  void *__p[2];
  uint64_t v15;
  void *v16[2];
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  value = self->_quasarEuclid.__ptr_.__value_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
    if (v8)
    {
LABEL_3:
      objc_msgSend(v8, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v16[0] = 0;
    v16[1] = 0;
    v17 = 0;
    if (v7)
      goto LABEL_3;
  }
  __p[0] = 0;
  __p[1] = 0;
  v15 = 0;
LABEL_6:
  *(float *)&v11 = quasar::QuasarEuclid::computeDistance((uint64_t)value, (uint64_t)v16, (uint64_t)__p);
  objc_msgSend(v9, "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v17) < 0)
    operator delete(v16[0]);

  return v12;
}

- (id)computeEmbedding:(id)a3
{
  id v4;
  id v5;
  QuasarEuclid *value;
  double v7;
  uint64_t i;
  void *v9;
  void *__p[2];
  uint64_t v12;
  _BYTE v13[8];
  uint64_t v14;
  int v15;
  char v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "length"))
  {
    value = self->_quasarEuclid.__ptr_.__value_;
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v12 = 0;
    }
    quasar::QuasarEuclid::computeEmbeddingVector((uint64_t)value, (uint64_t)__p, v13);
    if (SHIBYTE(v12) < 0)
      operator delete(__p[0]);
    if (v16)
    {
      for (i = 0; i < v15; ++i)
      {
        LODWORD(v7) = *(_DWORD *)(v14 + 4 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

        if (!v16)
          std::__throw_bad_optional_access[abi:ne180100]();
      }
    }
    std::__optional_destruct_base<kaldi::CuVector<float>,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v13);
  }

  return v5;
}

- (id)computeEmbeddings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _EAREuclid *v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32___EAREuclid_computeEmbeddings___block_invoke;
  v9[3] = &unk_1E5D477C0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v7 = v6;

  return v7;
}

- (id)maxInputLength
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", quasar::QuasarEuclid::getMaxInputLength((quasar::TextEmbedder **)self->_quasarEuclid.__ptr_.__value_));
}

- (id)embeddingDim
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", quasar::QuasarEuclid::getEmbeddingDim((quasar::TextEmbedder **)self->_quasarEuclid.__ptr_.__value_));
}

- (id)fullVersion
{
  void *v2;
  std::string *p_p;
  void *v4;
  std::string __p;

  v2 = (void *)MEMORY[0x1E0CB3940];
  quasar::CommandTagging::getCommandId((quasar::CommandTagging *)self->_quasarEuclid.__ptr_.__value_, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", p_p);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

- (id)majorVersion
{
  void *v2;
  void *v3;
  std::string v5;
  std::string *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  quasar::QuasarEuclid::getAssetVersionInVector((__int128 **)self->_quasarEuclid.__ptr_.__value_, &v5);
  objc_msgSend(v2, "stringWithUTF8String:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  return v3;
}

- (id)minorVersion
{
  void *v2;
  _QWORD *v3;
  void *v4;
  std::string v6;
  std::string *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  quasar::QuasarEuclid::getAssetVersionInVector((__int128 **)self->_quasarEuclid.__ptr_.__value_, &v6);
  v3 = (_QWORD *)(v6.__r_.__value_.__r.__words[0] + 24);
  if (*(char *)(v6.__r_.__value_.__r.__words[0] + 47) < 0)
    v3 = (_QWORD *)*v3;
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

- (id)patchVersion
{
  void *v2;
  _QWORD *v3;
  void *v4;
  std::string v6;
  std::string *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  quasar::QuasarEuclid::getAssetVersionInVector((__int128 **)self->_quasarEuclid.__ptr_.__value_, &v6);
  v3 = (_QWORD *)(v6.__r_.__value_.__r.__words[0] + 48);
  if (*(char *)(v6.__r_.__value_.__r.__words[0] + 71) < 0)
    v3 = (_QWORD *)*v3;
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

- (void).cxx_destruct
{
  QuasarEuclid *value;

  value = self->_quasarEuclid.__ptr_.__value_;
  self->_quasarEuclid.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(QuasarEuclid *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
