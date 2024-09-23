@implementation MLCustomLayerWrapper

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *className;
  void *v10;
  id v11;
  void *v12;
  NSString *v13;
  MLCustomLayer *v14;
  MLCustomLayer *customImpl;
  MLCustomLayer *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v22;
  const char *v23;
  std::string *v24;
  __int128 v25;
  std::string *v26;
  MLCustomLayerException *exception;
  NSObject *v28;
  const char *v29;
  std::string *v30;
  __int128 v31;
  std::string *v32;
  void *v33;
  MLCustomLayerException *v34;
  NSObject *v35;
  const char *v36;
  std::string *v37;
  __int128 v38;
  std::string *v39;
  MLCustomLayerException *v40;
  id v41;
  std::string v42;
  std::string v43;
  std::string __p;
  id v45;
  uint8_t buf[4];
  _BYTE v47[36];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("engineName"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  className = self->_className;
  self->_className = v8;

  +[MLCustomLayerWrapper espressoShapesToCoremlShapes:ndMode:](MLCustomLayerWrapper, "espressoShapesToCoremlShapes:ndMode:", v6, self->_ndMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_customImpl)
  {
    v11 = 0;
  }
  else
  {
    +[MLCustomLayerWrapper factory](MLCustomLayerWrapper, "factory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_className;
    v45 = 0;
    objc_msgSend(v12, "createCustomLayer:withParameters:error:", v13, v7, &v45);
    v14 = (MLCustomLayer *)objc_claimAutoreleasedReturnValue();
    v11 = v45;
    customImpl = self->_customImpl;
    self->_customImpl = v14;

    if (!self->_customImpl)
      goto LABEL_9;
  }
  if (v11)
  {
LABEL_9:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = -[NSString UTF8String](self->_className, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v47 = v23;
      _os_log_error_impl(&dword_19C486000, v22, OS_LOG_TYPE_ERROR, "Error creating Core ML custom layer implementation from factory for layer \"%s\".", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v42, (char *)-[NSString UTF8String](self->_className, "UTF8String"));
    v24 = std::string::insert(&v42, 0, "Error creating Core ML custom layer implementation from factory for layer \");
    v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    v26 = std::string::append(&v43, "\".");
    __p = *v26;
    v26->__r_.__value_.__l.__size_ = 0;
    v26->__r_.__value_.__r.__words[2] = 0;
    v26->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v43.__r_.__value_.__l.__data_);
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v42.__r_.__value_.__l.__data_);
    objc_storeStrong((id *)&v47[4], v11);
    exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
  }
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EE446A08) & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = -[NSString UTF8String](self->_className, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v47 = v29;
      _os_log_error_impl(&dword_19C486000, v28, OS_LOG_TYPE_ERROR, "Core ML custom Layer implementation '%s' does not conform to the MLCustomLayer protocol.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v42, (char *)-[NSString UTF8String](self->_className, "UTF8String"));
    v30 = std::string::insert(&v42, 0, "Core ML custom Layer implementation '");
    v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    v32 = std::string::append(&v43, "' does not conform to the MLCustomLayer protocol");
    __p = *v32;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v43.__r_.__value_.__l.__data_);
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v42.__r_.__value_.__l.__data_);
    v33 = *(void **)&v47[4];
    *(_QWORD *)&v47[4] = 0;

    v34 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(v34, (id *)buf);
  }
  v16 = self->_customImpl;
  v41 = 0;
  -[MLCustomLayer outputShapesForInputShapes:error:](v16, "outputShapesForInputShapes:error:", v10, &v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v41;
  v19 = v41;
  if (!v17 || v19)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = -[NSString UTF8String](self->_className, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v47 = v36;
      _os_log_error_impl(&dword_19C486000, v35, OS_LOG_TYPE_ERROR, "Error getting Core ML custom layer output shapes for layer \"%s\".", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v42, (char *)-[NSString UTF8String](self->_className, "UTF8String"));
    v37 = std::string::insert(&v42, 0, "Error getting Core ML custom layer output shapes for layer \");
    v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v38;
    v37->__r_.__value_.__l.__size_ = 0;
    v37->__r_.__value_.__r.__words[2] = 0;
    v37->__r_.__value_.__r.__words[0] = 0;
    v39 = std::string::append(&v43, "\".");
    __p = *v39;
    v39->__r_.__value_.__l.__size_ = 0;
    v39->__r_.__value_.__r.__words[2] = 0;
    v39->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v43.__r_.__value_.__l.__data_);
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v42.__r_.__value_.__l.__data_);
    objc_storeStrong((id *)&v47[4], v18);
    v40 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(v40, (id *)buf);
  }
  +[MLCustomLayerWrapper coremlShapesToEspressoShapes:ndMode:](MLCustomLayerWrapper, "coremlShapesToEspressoShapes:ndMode:", v17, self->_ndMode);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MLCustomLayer *customImpl;
  char v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  MLCustomLayerException *exception;
  NSObject *v20;
  const char *v21;
  std::string *v22;
  __int128 v23;
  std::string *v24;
  MLCustomLayerException *v25;
  id v26;
  std::string v27;
  std::string v28;
  std::string __p;
  uint8_t buf[4];
  _DWORD v31[11];

  *(_QWORD *)&v31[9] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_customImpl)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = -[NSString UTF8String](self->_className, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v31 = v15;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Evaluation on Core ML custom layer \"%s\" called before the layer is constructed.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v27, (char *)-[NSString UTF8String](self->_className, "UTF8String"));
    v16 = std::string::insert(&v27, 0, "Evaluation on Core ML custom layer \");
    v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    v18 = std::string::append(&v28, "\" called before the layer is constructed.");
    __p = *v18;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v28.__r_.__value_.__l.__data_);
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v27.__r_.__value_.__l.__data_);
    exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
  }
  +[MLCustomLayerWrapper espressoTensorsToCoremlTensors:ndMode:](MLCustomLayerWrapper, "espressoTensorsToCoremlTensors:ndMode:", v6, self->_ndMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCustomLayerWrapper espressoTensorsToCoremlTensors:ndMode:](MLCustomLayerWrapper, "espressoTensorsToCoremlTensors:ndMode:", v7, self->_ndMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  customImpl = self->_customImpl;
  v26 = 0;
  v11 = -[MLCustomLayer evaluateOnCPUWithInputs:outputs:error:](customImpl, "evaluateOnCPUWithInputs:outputs:error:", v8, v9, &v26);
  v12 = v26;
  v13 = v26;
  if ((v11 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = -[NSString UTF8String](self->_className, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v31 = v21;
      _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "Error evaluating Core ML custom layer \"%s\" on CPU.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v27, (char *)-[NSString UTF8String](self->_className, "UTF8String"));
    v22 = std::string::insert(&v27, 0, "Error evaluating Core ML custom layer \");
    v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    v24 = std::string::append(&v28, "\" on CPU.");
    __p = *v24;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v28.__r_.__value_.__l.__data_);
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v27.__r_.__value_.__l.__data_);
    objc_storeStrong((id *)&v31[1], v12);
    v25 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(v25, (id *)buf);
  }

}

- (MLCustomLayerWrapper)initWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  MLCustomLayerWrapper *v10;
  MLCustomLayerWrapper *v11;
  id *p_className;
  Class v13;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  id v17;
  MLCustomLayer *customImpl;
  NSObject *v20;
  uint64_t v21;
  std::string *v22;
  __int128 v23;
  std::string *v24;
  void *v25;
  MLCustomLayerException *exception;
  NSObject *v27;
  uint64_t v28;
  std::string *v29;
  __int128 v30;
  std::string *v31;
  MLCustomLayerException *v32;
  void *v33;
  void *v34;
  std::string v35;
  std::string v36;
  std::string __p;
  objc_super v38;
  uint8_t buf[4];
  _DWORD v40[11];

  *(_QWORD *)&v40[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engineName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_internal_NDMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_internal_NDMode")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        v6,
        v8))
  {
    self->_ndMode = 1;
    v9 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("_internal_NDMode"));
  }
  else
  {
    v9 = 0;
    self->_ndMode = 0;
  }
  v38.receiver = self;
  v38.super_class = (Class)MLCustomLayerWrapper;
  v10 = -[MLCustomLayerWrapper init](&v38, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_13:
    v14 = v11;
    goto LABEL_14;
  }
  p_className = (id *)&v10->_className;
  objc_storeStrong((id *)&v10->_className, v5);
  v13 = NSClassFromString((NSString *)v5);
  v14 = v13;
  if (v13)
  {
    if ((-[objc_class conformsToProtocol:](v13, "conformsToProtocol:", &unk_1EE446A08) & 1) == 0)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(*p_className, "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v40 = v21;
        _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "Core ML custom Layer implementation '%s' does not conform to the MLCustomLayer protocol'", buf, 0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>(&v35, (char *)objc_msgSend(*p_className, "UTF8String"));
      v22 = std::string::insert(&v35, 0, "Core ML custom Layer implementation '");
      v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
      v36.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v23;
      v22->__r_.__value_.__l.__size_ = 0;
      v22->__r_.__value_.__r.__words[2] = 0;
      v22->__r_.__value_.__r.__words[0] = 0;
      v24 = std::string::append(&v36, "' does not conform to the MLCustomLayer protocol'");
      __p = *v24;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v36.__r_.__value_.__l.__data_);
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v35.__r_.__value_.__l.__data_);
      v25 = *(void **)&v40[1];
      *(_QWORD *)&v40[1] = 0;

      exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
      MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
    }
    if (v11->_ndMode)
    {
      v34 = 0;
      v15 = objc_msgSend([v14 alloc], "initWithParameterDictionary:error:", v9, &v34);
      v16 = v34;
    }
    else
    {
      v33 = 0;
      v15 = objc_msgSend([v14 alloc], "initWithParameterDictionary:error:", v4, &v33);
      v16 = v33;
    }
    v17 = v16;
    customImpl = v11->_customImpl;
    v11->_customImpl = (MLCustomLayer *)v15;

    if (!v11->_customImpl)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = objc_msgSend(*p_className, "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v40 = v28;
        _os_log_error_impl(&dword_19C486000, v27, OS_LOG_TYPE_ERROR, "Error initializing Core ML custom layer implementation with parameter dictionary for layer \"%s\".", buf, 0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>(&v35, (char *)objc_msgSend(*p_className, "UTF8String"));
      v29 = std::string::insert(&v35, 0, "Error initializing Core ML custom layer implementation with parameter dictionary for layer \");
      v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
      v36.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v30;
      v29->__r_.__value_.__l.__size_ = 0;
      v29->__r_.__value_.__r.__words[2] = 0;
      v29->__r_.__value_.__r.__words[0] = 0;
      v31 = std::string::append(&v36, "\".");
      __p = *v31;
      v31->__r_.__value_.__l.__size_ = 0;
      v31->__r_.__value_.__r.__words[2] = 0;
      v31->__r_.__value_.__r.__words[0] = 0;
      MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v36.__r_.__value_.__l.__data_);
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v35.__r_.__value_.__l.__data_);
      objc_storeStrong((id *)&v40[1], v17);
      v32 = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
      MLCustomLayerException::MLCustomLayerException(v32, (id *)buf);
    }

    goto LABEL_13;
  }
LABEL_14:

  return (MLCustomLayerWrapper *)v14;
}

- (void)setMappedWeights:(void *)a3 sizeInBytes:(unint64_t)a4
{
  std::vector<int>::size_type v6;
  uint64_t v7;
  std::vector<int>::size_type v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  MLCustomLayer *customImpl;
  char v16;
  id v17;
  id v18;
  NSObject *v19;
  const char *v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  MLCustomLayerException *exception;
  std::string v25;
  std::string v26;
  std::string __p;
  id v28;
  std::vector<int> v29;
  uint8_t buf[4];
  _DWORD v31[11];

  *(_QWORD *)&v31[9] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    objc_opt_self();
    v6 = (*(unsigned __int8 *)a3 << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 2) << 8) | *((unsigned __int8 *)a3 + 3);
    std::vector<int>::vector(&v29, v6);
    if ((_DWORD)v6)
    {
      v7 = 0;
      v8 = v6;
      do
      {
        objc_opt_self();
        v29.__begin_[v7] = bswap32(*(_DWORD *)((char *)a3 + v7 * 4 + 4));
        ++v7;
        --v8;
      }
      while (v8);
      v9 = v7 * 4 + 4;
    }
    else
    {
      v9 = 4;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6)
    {
      v11 = 0;
      v12 = (char *)a3 + v9;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, v29.__begin_[v11], 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v13, v11);
        v14 = v29.__begin_[v11];

        v12 += v14;
        ++v11;
      }
      while (v6 != v11);
    }
    customImpl = self->_customImpl;
    v28 = 0;
    v16 = -[MLCustomLayer setWeightData:error:](customImpl, "setWeightData:error:", v10, &v28);
    v17 = v28;
    v18 = v28;
    if ((v16 & 1) == 0)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = -[NSString UTF8String](self->_className, "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v31 = v20;
        _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Error setting weights in Core ML custom layer \"%s\".", buf, 0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>(&v25, (char *)-[NSString UTF8String](self->_className, "UTF8String"));
      v21 = std::string::insert(&v25, 0, "Error setting weights in Core ML custom layer \");
      v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      v26.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      v21->__r_.__value_.__r.__words[0] = 0;
      v23 = std::string::append(&v26, "\".");
      __p = *v23;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v26.__r_.__value_.__l.__data_);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
      objc_storeStrong((id *)&v31[1], v17);
      exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
      MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
    }

    if (v29.__begin_)
    {
      v29.__end_ = v29.__begin_;
      operator delete(v29.__begin_);
    }
  }
}

- (void)encodeToMetalCommandBuffer:(id)a3 inputTensors:(id)a4 outputTensors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  MLCustomLayer *customImpl;
  char v14;
  id v15;
  id v16;
  NSObject *v17;
  const char *v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  MLCustomLayerException *exception;
  std::string v23;
  std::string v24;
  std::string __p;
  id v26;
  uint8_t buf[4];
  _DWORD v28[11];

  *(_QWORD *)&v28[9] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[MLCustomLayerWrapper espressoTensorsToCoremlTensorsGPU:](MLCustomLayerWrapper, "espressoTensorsToCoremlTensorsGPU:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCustomLayerWrapper espressoTensorsToCoremlTensorsGPU:](MLCustomLayerWrapper, "espressoTensorsToCoremlTensorsGPU:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  customImpl = self->_customImpl;
  v26 = 0;
  v14 = -[MLCustomLayer encodeToCommandBuffer:inputs:outputs:error:](customImpl, "encodeToCommandBuffer:inputs:outputs:error:", v8, v11, v12, &v26);
  v15 = v26;
  v16 = v26;
  if ((v14 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = -[NSString UTF8String](self->_className, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v28 = v18;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "Error evaluating Core ML custom layer \"%s\" on GPU.", buf, 0xCu);
    }

    std::string::basic_string[abi:ne180100]<0>(&v23, (char *)-[NSString UTF8String](self->_className, "UTF8String"));
    v19 = std::string::insert(&v23, 0, "Error evaluating Core ML custom layer \");
    v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    v24.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v20;
    v19->__r_.__value_.__l.__size_ = 0;
    v19->__r_.__value_.__r.__words[2] = 0;
    v19->__r_.__value_.__r.__words[0] = 0;
    v21 = std::string::append(&v24, "\" on GPU.");
    __p = *v21;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    MLCustomLayerException::MLCustomLayerException(buf, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v23.__r_.__value_.__l.__data_);
    objc_storeStrong((id *)&v28[1], v15);
    exception = (MLCustomLayerException *)__cxa_allocate_exception(0x28uLL);
    MLCustomLayerException::MLCustomLayerException(exception, (id *)buf);
  }

}

- (BOOL)hasGPUSupport
{
  return objc_opt_respondsToSelector() & 1;
}

- (BOOL)ndMode
{
  return self->_ndMode;
}

- (NSString)className
{
  return self->_className;
}

- (MLCustomLayer)customImpl
{
  return self->_customImpl;
}

- (void)setCustomImpl:(id)a3
{
  objc_storeStrong((id *)&self->_customImpl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImpl, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

+ (id)espressoShapeToCoremlShape:(id)a3 ndMode:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[4];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[2];

  v4 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    switch(objc_msgSend(v5, "rank"))
    {
      case 1u:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "width"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2u:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "height"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "width"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 3u:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "channels"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "height"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "width"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[2] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 4u:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "batch"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "channels"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17[1] = v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "height"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17[2] = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "width"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17[3] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      default:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "sequence"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "batch"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "channels"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2] = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "height"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[3] = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "width"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[4] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "sequence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "batch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "channels"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "height"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "width"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v13;

LABEL_6:
LABEL_7:

LABEL_8:
  }

  return v8;
}

+ (id)espressoShapesToCoremlShapes:(id)a3 ndMode:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  for (i = 0; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCustomLayerWrapper espressoShapeToCoremlShape:ndMode:](MLCustomLayerWrapper, "espressoShapeToCoremlShape:ndMode:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v9, i);

  }
  return v6;
}

+ (id)coremlShapeToEspressoShape:(id)a3 ndMode:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  if (v4)
  {
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(v6, "setRank:", v7);
    objc_msgSend(v6, "setWidth:", 1);
    objc_msgSend(v6, "setHeight:", 1);
    objc_msgSend(v6, "setChannels:", 1);
    objc_msgSend(v6, "setBatch:", 1);
    objc_msgSend(v6, "setSequence:", 1);
    if ((int)v7 >= 1)
    {
      v8 = 0;
      v9 = (v7 - 1);
      v10 = (int)v7 - 5;
      v22 = (v7 - 4);
      v23 = (v7 - 3);
      v24 = (v7 - 2);
      do
      {
        if (!v8)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setWidth:", objc_msgSend(v11, "intValue"));

        }
        if (!(v9 - v24 + v8))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v24);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setHeight:", objc_msgSend(v12, "intValue"));

        }
        if (!(v9 - v23 + v8))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setChannels:", objc_msgSend(v13, "intValue"));

        }
        if (!(v9 - v22 + v8))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setBatch:", objc_msgSend(v14, "intValue"));

        }
        if (v9 + v8 <= v10)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setSequence:", objc_msgSend(v6, "sequence") * objc_msgSend(v15, "intValue"));

        }
        --v8;
      }
      while (v9 + v8 + 1 > 0);
    }
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSequence:", objc_msgSend(v16, "intValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBatch:", objc_msgSend(v17, "intValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setChannels:", objc_msgSend(v18, "intValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeight:", objc_msgSend(v19, "intValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWidth:", objc_msgSend(v20, "intValue"));

  }
  return v6;
}

+ (id)coremlShapesToEspressoShapes:(id)a3 ndMode:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  for (i = 0; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCustomLayerWrapper coremlShapeToEspressoShape:ndMode:](MLCustomLayerWrapper, "coremlShapeToEspressoShape:ndMode:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v9, i);

  }
  return v6;
}

+ (id)getStrides:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "channels")* objc_msgSend(v3, "batch")* objc_msgSend(v3, "height")* objc_msgSend(v3, "width"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "height")* objc_msgSend(v3, "channels", v4)* objc_msgSend(v3, "width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "width") * objc_msgSend(v3, "height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "width"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  v10[4] = &unk_1E3DA2038;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)espressoTensorToCoremlTensor:(id)a3 ndMode:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MLMultiArray *v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCustomLayerWrapper espressoShapeToCoremlShape:ndMode:](MLCustomLayerWrapper, "espressoShapeToCoremlShape:ndMode:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCustomLayerWrapper getStrides:](MLCustomLayerWrapper, "getStrides:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:]([MLMultiArray alloc], "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(v5, "rawPointer"), v7, 65568, v9, 0, 0);
  return v10;
}

+ (id)espressoTensorsToCoremlTensorsGPU:(id)a3
{
  id v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  for (i = 0; i < objc_msgSend(v3, "count"); ++i)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "texture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:atIndexedSubscript:", v7, i);

  }
  return v4;
}

+ (id)espressoTensorsToCoremlTensors:(id)a3 ndMode:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  for (i = 0; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCustomLayerWrapper espressoTensorToCoremlTensor:ndMode:](MLCustomLayerWrapper, "espressoTensorToCoremlTensor:ndMode:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v9, i);

  }
  return v6;
}

+ (id)factory
{
  if (+[MLCustomLayerWrapper factory]::onceToken != -1)
    dispatch_once(&+[MLCustomLayerWrapper factory]::onceToken, &__block_literal_global_6642);
  return (id)+[MLCustomLayerWrapper factory]::factory;
}

void __31__MLCustomLayerWrapper_factory__block_invoke()
{
  MLDefaultCustomLayerFactory *v0;
  void *v1;

  v0 = objc_alloc_init(MLDefaultCustomLayerFactory);
  v1 = (void *)+[MLCustomLayerWrapper factory]::factory;
  +[MLCustomLayerWrapper factory]::factory = (uint64_t)v0;

}

@end
