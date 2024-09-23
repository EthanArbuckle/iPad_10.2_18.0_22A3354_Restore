@implementation _EAROnDeviceEndpointerInfo

- (_EAROnDeviceEndpointerInfo)initWithConfig:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  int v7;
  EARLogger *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _EAROnDeviceEndpointerInfo *v16;
  uint64_t HybridClientConfigs;
  _OWORD v19[2];
  int v20;
  uint64_t v21[3];
  void *__p[2];
  uint64_t v23;
  _BYTE v24[1544];
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_EAROnDeviceEndpointerInfo;
  v5 = -[_EAROnDeviceEndpointerInfo init](&v25, sel_init);
  if (!v5)
  {
LABEL_14:
    v16 = v5;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

  if (v7)
  {
    quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v24);
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v23 = 0;
    }
    memset(v21, 0, sizeof(v21));
    memset(v19, 0, sizeof(v19));
    v20 = 1065353216;
    quasar::SystemConfig::readJsonFile((uint64_t)v24, (uint64_t)__p, v21, (uint64_t)v19, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v19);
    *(_QWORD *)&v19[0] = v21;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v19);
    if (SHIBYTE(v23) < 0)
      operator delete(__p[0]);
    HybridClientConfigs = quasar::SystemConfig::getHybridClientConfigs((quasar::SystemConfig *)v24);
    if (v5 + 8 != (char *)HybridClientConfigs)
    {
      std::__tree<std::__value_type<int,std::map<std::string,double>>,std::__map_value_compare<int,std::__value_type<int,std::map<std::string,double>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::map<std::string,double>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<int,std::map<std::string,double>>,std::__tree_node<std::__value_type<int,std::map<std::string,double>>,void *> *,long>>((uint64_t **)v5 + 1, *(uint64_t **)HybridClientConfigs, (uint64_t *)(HybridClientConfigs + 8));
      std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,int>,std::__tree_node<std::__value_type<std::string,int>,void *> *,long>>((uint64_t **)v5 + 4, *(_QWORD **)(HybridClientConfigs + 24), (_QWORD *)(HybridClientConfigs + 32));
    }
    quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v24);
    goto LABEL_14;
  }
  EARLogger::QuasarOSLogger(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[_EAROnDeviceEndpointerInfo initWithConfig:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

  v16 = 0;
LABEL_15:

  return v16;
}

- (id)getEndpointerThresholdForClientModelVersion:(unsigned int)a3 task:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::map<std::string, double>>, void *>>> *p_pair1;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::map<std::string, double>>, void *>>> *v11;
  int v12;
  BOOL v13;
  void **v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *__p[2];
  uint64_t v22;

  v6 = a4;
  v7 = v6;
  left = (char *)self->_hybridClientConfigs.hybridEndpointerThresholds.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_hybridClientConfigs.hybridEndpointerThresholds.__tree_.__pair1_;
  v8 = left;
  if (!left)
    goto LABEL_11;
  v11 = p_pair1;
  do
  {
    v12 = *((_DWORD *)v8 + 8);
    v13 = v12 < (int)a3;
    if (v12 >= (int)a3)
      v14 = (void **)v8;
    else
      v14 = (void **)(v8 + 8);
    if (!v13)
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::map<std::string, double>>, void *>>> *)v8;
    v8 = (char *)*v14;
  }
  while (*v14);
  if (v11 == p_pair1 || SLODWORD(v11[4].__value_.__left_) > (signed int)a3)
    goto LABEL_11;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v22 = 0;
  }
  v18 = std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&v11[5], (const void **)__p);
  if (SHIBYTE(v22) < 0)
    operator delete(__p[0]);
  if (&v11[6] != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, std::map<std::string, double>>, void *>>> *)v18)
    goto LABEL_24;
  std::string::basic_string[abi:ne180100]<0>(__p, "*");
  v6 = (id)std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&v11[5], (const void **)__p);
  v19 = (uint64_t)v6;
  if (SHIBYTE(v22) < 0)
    operator delete(__p[0]);
  v20 = v18 == v19;
  v18 = v19;
  if (v20)
  {
LABEL_11:
    EARLogger::QuasarOSLogger((EARLogger *)v6);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_EAROnDeviceEndpointerInfo getEndpointerThresholdForClientModelVersion:task:].cold.1(a3, v15);

    v16 = 0;
  }
  else
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v18 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)getEndpointerExtraDelayFrequencyForTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  EARLogger *v7;
  EARLogger *v8;
  BOOL v9;
  void *v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *__p[2];
  uint64_t v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v20 = 0;
  }
  v6 = std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency, (const void **)__p);
  if (SHIBYTE(v20) < 0)
    operator delete(__p[0]);
  if (&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, int>, void *>>> *)v6)
    goto LABEL_10;
  std::string::basic_string[abi:ne180100]<0>(__p, "*");
  v7 = (EARLogger *)std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency, (const void **)__p);
  v8 = v7;
  if (SHIBYTE(v20) < 0)
    operator delete(__p[0]);
  v9 = v6 == (_QWORD)v8;
  v6 = (uint64_t)v8;
  if (v9)
  {
    EARLogger::QuasarOSLogger(v7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_EAROnDeviceEndpointerInfo getEndpointerExtraDelayFrequencyForTask:].cold.1((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);

    v10 = 0;
  }
  else
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v6 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void).cxx_destruct
{
  HybridClientConfigs *p_hybridClientConfigs;

  p_hybridClientConfigs = &self->_hybridClientConfigs;
  std::__tree<std::string>::destroy((uint64_t)&self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency, (char *)self->_hybridClientConfigs.hybridEndpointerExtraDelayFrequency.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<int,std::map<std::string,double>>,std::__map_value_compare<int,std::__value_type<int,std::map<std::string,double>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::map<std::string,double>>>>::destroy((uint64_t)p_hybridClientConfigs, (_QWORD *)self->_hybridClientConfigs.hybridEndpointerThresholds.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

- (void)initWithConfig:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AD756000, a2, a3, "Configuration file %@ does not exist", a5, a6, a7, a8, 2u);
}

- (void)getEndpointerThresholdForClientModelVersion:(int)a1 task:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AD756000, a2, OS_LOG_TYPE_ERROR, "EndpointerThreshold does not exist for clientModelVersion %u", (uint8_t *)v2, 8u);
}

- (void)getEndpointerExtraDelayFrequencyForTask:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AD756000, a2, a3, "EndpointerExtraDelayFrequency does not exist for task %@ and there is no default value returning nil", a5, a6, a7, a8, 2u);
}

@end
