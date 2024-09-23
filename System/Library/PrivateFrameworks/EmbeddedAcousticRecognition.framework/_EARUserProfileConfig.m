@implementation _EARUserProfileConfig

- (_EARUserProfileConfig)initWithConfiguration:(id)a3 overrides:(id)a4
{
  id v6;
  id v7;
  _EARUserProfileConfig *v8;
  id v9;
  int JsonFile;
  quasar::LmeConfig *v11;
  LmeConfig *value;
  std::runtime_error *exception;
  uint64_t v15[3];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)(uint64_t);
  _OWORD v21[2];
  uint64_t v22;
  int v23;
  _BYTE v24[40];
  objc_super v25;
  void *v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  uint64_t *v30;
  void **v31;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_EARUserProfileConfig;
  v8 = -[_EARUserProfileConfig init](&v25, sel_init);
  v9 = v7;
  v16 = 0;
  v17 = &v16;
  v18 = 0x5812000000;
  v19 = __Block_byref_object_copy__286;
  v20 = __Block_byref_object_dispose__287;
  memset(v21, 0, sizeof(v21));
  v22 = 0;
  v23 = 1065353216;
  v26 = (void *)MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = ___ZN10EARHelpers24DictionaryToUnorderedMapINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEES7_Z57___EARUserProfileConfig_initWithConfiguration_overrides__E3__0S8_EENS1_13unordered_mapIT_T0_NS1_4hashISA_EENS1_8equal_toISA_EENS5_INS1_4pairIKSA_SB_EEEEEEP12NSDictionaryT1_T2__block_invoke;
  v29 = &unk_1E5D46E20;
  v30 = &v16;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v26);
  std::unordered_map<std::string,std::string>::unordered_map((uint64_t)v24, (uint64_t)(v17 + 6));
  _Block_object_dispose(&v16, 8);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v21 + 8);

  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&v16);
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
  }
  memset(v15, 0, sizeof(v15));
  JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v16, (uint64_t)&v26, v15, (uint64_t)v24, 0, 0);
  v31 = (void **)v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v31);
  if (SHIBYTE(v28) < 0)
    operator delete(v26);
  if (JsonFile == 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Config file version is not supported.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v11 = (quasar::LmeConfig *)operator new();
  quasar::LmeConfig::LmeConfig(v11, (const quasar::SystemConfig *)&v16);
  value = v8->lmeConfig.__ptr_.__value_;
  v8->lmeConfig.__ptr_.__value_ = (LmeConfig *)v11;
  if (value)
    MEMORY[0x1AF44D190](value, 0x1000C403E1C8BA9);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&v16);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v24);

  return v8;
}

- (_EARPeopleSuggesterConfig)peopleSuggesterConfig
{
  return -[_EARPeopleSuggesterConfig initWithContactsCount:bestContactsCount:bestContactsBonus:]([_EARPeopleSuggesterConfig alloc], "initWithContactsCount:bestContactsCount:bestContactsBonus:", *(_DWORD *)self->lmeConfig.__ptr_.__value_, *((unsigned int *)self->lmeConfig.__ptr_.__value_ + 1), *((unsigned int *)self->lmeConfig.__ptr_.__value_ + 2));
}

- (void).cxx_destruct
{
  LmeConfig *value;

  value = self->lmeConfig.__ptr_.__value_;
  self->lmeConfig.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x1AF44D190);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
