@implementation MLNeuralNetworkFunctionInfo

- (MLNeuralNetworkFunctionInfo)initWithCompiledModelArchive:(void *)a3 compilerVersionInfo:(id)a4 error:(id *)a5
{
  id v7;
  MLNeuralNetworkFunctionInfo *v8;
  id v9;
  uint64_t data_low;
  BOOL v11;
  id v12;
  std::string::size_type v13;
  void *v14;
  unint64_t i;
  std::string *p_p;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  std::string *v21;
  NSString *v22;
  uint64_t v23;
  NSString *classScoreVectorName;
  NSString *v25;
  NSArray *outputNames;
  std::string v28;
  objc_super v29;
  std::string __p;
  unint64_t v31;
  std::string *v32;

  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MLNeuralNetworkFunctionInfo;
  v8 = -[MLNeuralNetworkFunctionInfo init](&v29, sel_init);
  if (!v8)
    goto LABEL_35;
  __p.__r_.__value_.__r.__words[0] = 0;
  operator>>((uint64_t)a3);
  v9 = 0;
  data_low = LODWORD(__p.__r_.__value_.__l.__data_);
  memset(&v28, 0, sizeof(v28));
  v11 = LODWORD(__p.__r_.__value_.__l.__data_) == 403;
  if (LODWORD(__p.__r_.__value_.__l.__data_) == 403)
  {
    v32 = 0;
    operator>>((uint64_t)a3);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((_DWORD)v32 == 100)
    {
      v31 = 0;
      operator>>((uint64_t)a3);
      if (v31)
      {
        for (i = 0; i < v31; ++i)
        {
          memset(&__p, 0, sizeof(__p));
          operator>>((uint64_t)a3, &__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, v28.__r_.__value_.__r.__words[0]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v17);

          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
    }
    else
    {
      if ((_DWORD)v32 != 101)
      {
        v9 = 0;
        goto LABEL_19;
      }
      __p.__r_.__value_.__r.__words[0] = 0;
      operator>>((uint64_t)a3);
      if (__p.__r_.__value_.__r.__words[0])
      {
        v13 = 0;
        do
        {
          v31 = 0;
          operator>>((uint64_t)a3);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v31);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v14);

          ++v13;
        }
        while (v13 < __p.__r_.__value_.__r.__words[0]);
      }
    }
    v9 = v12;
LABEL_19:

    +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 1, 0, &stru_1E3D68DC8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "olderThan:", v18) & 1) == 0)
      operator>>((uint64_t)a3, &v28);

  }
  memset(&__p, 0, sizeof(__p));
  operator>><std::string>((uint64_t)a3, (std::vector<std::string> *)&__p);
  CoreML::stringArrayToObjC((uint64_t **)&__p);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (data_low == 403)
  {
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v28.__r_.__value_.__l.__size_)
      {
        v21 = (std::string *)v28.__r_.__value_.__r.__words[0];
        goto LABEL_29;
      }
    }
    else if (*((_BYTE *)&v28.__r_.__value_.__s + 23))
    {
      v21 = &v28;
LABEL_29:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21, v28.__r_.__value_.__r.__words[0]);
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_31:
      v22 = (NSString *)v23;
      goto LABEL_32;
    }
    -[NSArray firstObject](v19, "firstObject", v28.__r_.__value_.__r.__words[0]);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  v22 = 0;
LABEL_32:
  v8->_isClassifier = v11;
  objc_storeStrong((id *)&v8->_classLabels, v9);
  classScoreVectorName = v8->_classScoreVectorName;
  v8->_classScoreVectorName = v22;
  v25 = v22;

  outputNames = v8->_outputNames;
  v8->_outputNames = v20;

  v32 = &__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);

LABEL_35:
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkFunctionInfo outputNames](self, "outputNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("outputNames: [%@]\n"), v5);

  if (-[MLNeuralNetworkFunctionInfo isClassifier](self, "isClassifier"))
  {
    -[MLNeuralNetworkFunctionInfo classScoreVectorName](self, "classScoreVectorName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("classScoreVectorName: %@\n"), v6);

    -[MLNeuralNetworkFunctionInfo classLabels](self, "classLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("classLabels: [%@]\n"), v8);

  }
  return v3;
}

- (BOOL)isClassifier
{
  return self->_isClassifier;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (NSString)classScoreVectorName
{
  return self->_classScoreVectorName;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_classScoreVectorName, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
}

@end
