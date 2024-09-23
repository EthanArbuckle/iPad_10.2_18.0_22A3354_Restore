@implementation ANSTBaseNetworkEspresso

+ (BOOL)supportsANE
{
  if (qword_256308990 != -1)
    dispatch_once(&qword_256308990, &unk_2506E3A80);
  return byte_256308998;
}

- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5
{
  return (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkResolution_(self, a2, a3, *(_QWORD *)&a4, a5, &stru_2506E4518);
}

- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkFileName:(id)a6
{
  return (ANSTBaseNetworkEspresso *)MEMORY[0x24BEDD108](self, sel__initWithNetworkEngine_qualityOfService_networkName_networkFileName_networkResolution_, a3);
}

- (ANSTBaseNetworkEspresso)initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkResolution:(id)a6
{
  return (ANSTBaseNetworkEspresso *)MEMORY[0x24BEDD108](self, sel__initWithNetworkEngine_qualityOfService_networkName_networkFileName_networkResolution_, a3);
}

- (id)_initWithNetworkEngine:(int64_t)a3 qualityOfService:(unsigned int)a4 networkName:(id)a5 networkFileName:(id)a6 networkResolution:(id)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  int v21;
  NSObject *v22;
  NSString *netPath;
  NSString *netFileName;
  id v26;
  id v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v26 = a6;
  v27 = a7;
  v13 = (void *)MEMORY[0x24BDD1488];
  v14 = objc_opt_class();
  objc_msgSend_bundleForClass_(v13, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_inDirectory_(v16, v17, (uint64_t)v12, CFSTR("mlmodelc"), CFSTR("Models"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_netPath, v18);
  objc_storeStrong((id *)&self->_netFileName, a6);
  self->_engineType = a3;
  HIDWORD(v20) = a4 - 9;
  LODWORD(v20) = a4 - 9;
  v19 = v20 >> 3;
  if (v19 > 3)
    v21 = 0;
  else
    v21 = dword_235914CC0[v19];
  self->_planPriority = v21;
  self->_isPrepared = 0;
  objc_storeStrong((id *)&self->_networkResolution, a7);
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    netPath = self->_netPath;
    netFileName = self->_netFileName;
    *(_DWORD *)buf = 138543618;
    v29 = netPath;
    v30 = 2114;
    v31 = netFileName;
    _os_log_impl(&dword_2358CB000, v22, OS_LOG_TYPE_DEFAULT, "ANSTBaseNetworkEspresso initialized with network path %{public}@, network file name %{public}@", buf, 0x16u);
  }

  return self;
}

- (BOOL)prepare
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int inited;

  objc_msgSend_preSetup(self, a2, v2);
  inited = objc_msgSend_initMLNetwork(self, v4, v5);
  if (inited)
  {
    objc_msgSend_postSetup(self, v6, v7);
    self->_isPrepared = 1;
  }
  return inited;
}

- (id)networkVersion
{
  id v3;
  const char *v4;
  _BYTE v5[100];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (espresso_network_get_version())
    return CFSTR("Unknown");
  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  return (id)objc_msgSend_initWithUTF8String_(v3, v4, (uint64_t)v5);
}

- (BOOL)isUsingANE
{
  uint64_t v2;
  int v4;

  v4 = objc_msgSend_supportsANE(ANSTBaseNetworkEspresso, a2, v2);
  if (v4)
    LOBYTE(v4) = self->_engineType == 0;
  return v4;
}

- ($FD4688982923A924290ECB669CAF1EC2)createEsressoTensorDimension:(unint64_t *)a3 dtype:(int)a4
{
  $FD4688982923A924290ECB669CAF1EC2 *v5;
  int v6;
  int v7;
  NSObject *v8;

  v5 = ($FD4688982923A924290ECB669CAF1EC2 *)operator new();
  v5->var14 = a4;
  v6 = espresso_buffer_pack_tensor_shape();
  if (v6)
  {
    v7 = v6;
    MEMORY[0x23B7DA6E4](v5, 0x1080C403DA0D3ADLL);
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_23590E9E4(v7, v8);

    return 0;
  }
  return v5;
}

- (BOOL)initMLNetwork
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;

  if (objc_msgSend_initContext(self, a2, v2)
    && objc_msgSend_initPlan(self, v4, v5)
    && objc_msgSend_initNetwork(self, v6, v7)
    && objc_msgSend_buildPlan(self, v8, v9)
    && objc_msgSend_validateNetworkOutputDimension(self, v10, v11))
  {
    return objc_msgSend_initNetworkOutput(self, v12, v13);
  }
  else
  {
    return 0;
  }
}

- (BOOL)buildPlan
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  uint64_t last_error;
  _DWORD v7[6];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_enablePreprocess)
    objc_msgSend_initPreprocess(self, a2, v2);
  v3 = espresso_plan_build();
  if (v3)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      last_error = espresso_get_last_error();
      sub_23590EA68(last_error, v7);
    }

  }
  return v3 == 0;
}

- (BOOL)initContext
{
  int64_t engineType;
  NSObject *v4;
  void *context;
  NSObject *v6;
  uint64_t v7;
  uint64_t last_error;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  engineType = self->_engineType;
  if (engineType == 2)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2358CB000, v4, OS_LOG_TYPE_DEFAULT, "Using CPU", v10, 2u);
    }
  }
  else if (engineType == 1)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2358CB000, v4, OS_LOG_TYPE_DEFAULT, "Using GPU", v10, 2u);
    }
  }
  else if (engineType)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_23590EB28(engineType, v4);
  }
  else
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2358CB000, v4, OS_LOG_TYPE_DEFAULT, "Using ANE", v10, 2u);
    }
  }

  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      last_error = espresso_get_last_error();
      sub_23590EAA8(last_error, v10);
    }
    goto LABEL_20;
  }
  if (espresso_context_set_low_precision_accumulation())
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = espresso_get_last_error();
      sub_23590EAE8(v7, v10);
    }
LABEL_20:

    return 0;
  }
  return 1;
}

- (BOOL)initPlan
{
  void *plan;
  NSObject *v4;
  uint64_t v5;
  uint64_t last_error;
  _DWORD v8[6];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      last_error = espresso_get_last_error();
      sub_23590EBAC(last_error, v8);
    }
    goto LABEL_7;
  }
  if (espresso_plan_set_priority())
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = espresso_get_last_error();
      sub_23590EBEC(v5, v8);
    }
LABEL_7:

    return 0;
  }
  return 1;
}

- (BOOL)initNetwork
{
  NSString *netPath;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  NSString *networkResolution;
  uint64_t v21;
  NSString *v22;
  int v23;
  NSString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t last_error;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  netPath = self->_netPath;
  if (netPath)
  {
    objc_msgSend_stringByAppendingPathComponent_(netPath, a2, (uint64_t)self->_netFileName);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v4, v5, v6);
    v9 = espresso_plan_add_network();
    if (v9)
    {
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v22 = self->_netPath;
        v23 = 138543874;
        v24 = v22;
        v25 = 1024;
        v26 = v9;
        v27 = 2082;
        last_error = espresso_get_last_error();
        _os_log_fault_impl(&dword_2358CB000, v10, OS_LOG_TYPE_FAULT, "%{public}@: espresso_plan_add_network failed with status %d (%{public}s)", (uint8_t *)&v23, 0x1Cu);
      }
    }
    else
    {
      networkResolution = self->_networkResolution;
      if (!networkResolution
        || (objc_msgSend_isEqualToString_(networkResolution, v7, (uint64_t)&stru_2506E4518) & 1) != 0
        || (objc_msgSend_UTF8String(self->_networkResolution, v7, v8),
            !espresso_network_select_configuration()))
      {
        objc_msgSend_updateOutputBlobMap(self, v7, v8);
        v18 = 1;
        goto LABEL_9;
      }
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v21 = espresso_get_last_error();
        sub_23590EC9C(v21, &v23);
      }
    }

  }
  else
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_23590EC2C(v4, v11, v12, v13, v14, v15, v16, v17);
  }
  v18 = 0;
LABEL_9:

  return v18;
}

- (void)updateOutputBlobMap
{
  unordered_map<std::string, espresso_buffer_t, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, espresso_buffer_t>>> *p_outputBufferMap;
  uint64_t output_blob_name;
  char *v4;
  uint64_t v5;
  _OWORD v6[10];
  uint64_t v7;
  void *v8[2];
  char v9;

  p_outputBufferMap = &self->_outputBufferMap;
  sub_2358D0F4C((uint64_t)&self->_outputBufferMap);
  output_blob_name = espresso_get_output_blob_name();
  if (output_blob_name)
  {
    v4 = (char *)output_blob_name;
    v5 = 1;
    do
    {
      sub_2358D0CEC(v8, v4);
      v7 = 0;
      memset(v6, 0, sizeof(v6));
      sub_2358D0FE4((uint64_t)p_outputBufferMap, (unsigned __int8 *)v8, (uint64_t)v8, (uint64_t)v6);
      if (v9 < 0)
        operator delete(v8[0]);
      v4 = (char *)espresso_get_output_blob_name();
      ++v5;
    }
    while (v4);
  }
}

- (BOOL)validateNetworkOutputDimension
{
  char *next;
  uint64_t v4;
  uint64_t v5;
  char v6;
  NSObject *v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  next = (char *)self->_expectedDimensions.__table_.__p1_.__value_.__next_;
  if (!next)
    return 1;
  while (1)
  {
    memset(v9, 0, sizeof(v9));
    v4 = (uint64_t)(next + 16);
    if (next[39] < 0)
      v4 = *((_QWORD *)next + 2);
    objc_msgSend_getBlobDimensionByName_andDestination_(self, a2, v4, v9);
    v5 = 0;
    v6 = 1;
    do
    {
      v6 &= *(_QWORD *)((char *)v9 + v5) == *(_QWORD *)(*((_QWORD *)next + 5) + v5);
      v5 += 8;
    }
    while (v5 != 32);
    if ((v6 & 1) == 0)
      break;
    next = *(char **)next;
    if (!next)
      return 1;
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_23590ECDC(next + 39, (_QWORD *)next + 2, v8);

  return 0;
}

- (void)setExpectedDimension:(const char *)a3 andDimension:(unint64_t *)a4
{
  unsigned __int8 *v6;
  void *v7;
  void *__p[2];
  char v9;
  void *v10[2];
  uint64_t v11;
  void **v12;

  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  sub_2358D0E4C(v10, a4, (uint64_t)(a4 + 4), 4uLL);
  sub_2358D0CEC(__p, (char *)a3);
  v12 = __p;
  v6 = sub_2358D1A7C((uint64_t)&self->_expectedDimensions, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v12);
  v7 = (void *)*((_QWORD *)v6 + 5);
  if (v7)
  {
    *((_QWORD *)v6 + 6) = v7;
    operator delete(v7);
    *((_QWORD *)v6 + 5) = 0;
    *((_QWORD *)v6 + 6) = 0;
    *((_QWORD *)v6 + 7) = 0;
  }
  *(_OWORD *)(v6 + 40) = *(_OWORD *)v10;
  *((_QWORD *)v6 + 7) = v11;
  v10[1] = 0;
  v11 = 0;
  v10[0] = 0;
  if (v9 < 0)
  {
    operator delete(__p[0]);
    if (v10[0])
    {
      v10[1] = v10[0];
      operator delete(v10[0]);
    }
  }
}

- (BOOL)getBlobDimensionByName:(const char *)a3 andDestination:(unint64_t *)a4
{
  int blob_dimensions;
  NSObject *v6;
  uint64_t last_error;
  _DWORD v9[10];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  blob_dimensions = espresso_network_query_blob_dimensions();
  if (blob_dimensions)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      last_error = espresso_get_last_error();
      sub_23590ED64((uint64_t)a3, last_error, v9);
    }

  }
  return blob_dimensions == 0;
}

- (BOOL)initNetworkOutput
{
  char *i;
  _QWORD *v4;

  for (i = (char *)self->_outputBufferMap.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    v4 = i + 16;
    if (i[39] < 0)
      v4 = (_QWORD *)*v4;
    objc_msgSend_bindNetworkOutput_(self, a2, (uint64_t)v4);
  }
  return 1;
}

- (BOOL)bindNetworkInputWithImage:(__CVBuffer *)a3 withInputName:(id)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t last_error;
  _DWORD v15[10];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a4);
  objc_msgSend_UTF8String(v4, v5, v6);
  v7 = espresso_network_bind_cvpixelbuffer();
  if (v7)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_retainAutorelease(v4);
      v12 = objc_msgSend_UTF8String(v9, v10, v11);
      last_error = espresso_get_last_error();
      sub_23590EDA8(v12, last_error, v15);
    }

  }
  return v7 == 0;
}

- (BOOL)bindNetworkInputWithEspressoBuffer:(id *)a3 withInputName:(id)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t last_error;
  _DWORD v15[10];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a4);
  objc_msgSend_UTF8String(v4, v5, v6);
  v7 = espresso_network_bind_buffer();
  if (v7)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_retainAutorelease(v4);
      v12 = objc_msgSend_UTF8String(v9, v10, v11);
      last_error = espresso_get_last_error();
      sub_23590EDEC(v12, last_error, v15);
    }

  }
  return v7 == 0;
}

- (BOOL)bindNetworkOutput:(const char *)a3
{
  NSSet *disabledOutputSet;
  void *v6;
  const char *v7;
  NSObject *v8;
  uint64_t last_error;
  void *__p[2];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  disabledOutputSet = self->_disabledOutputSet;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(disabledOutputSet) = objc_msgSend_containsObject_(disabledOutputSet, v7, (uint64_t)v6);

  if ((disabledOutputSet & 1) == 0)
  {
    sub_2358D0CEC(__p, (char *)a3);
    if (!sub_2358D2358(&self->_outputBufferMap.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p))
      sub_2358D1DA8("unordered_map::at: key not found");
    if (v12 < 0)
      operator delete(__p[0]);
    if (!espresso_network_bind_buffer())
      return 1;
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      last_error = espresso_get_last_error();
      sub_23590EE30(last_error, __p);
    }

  }
  return 0;
}

- ($FD4688982923A924290ECB669CAF1EC2)getTensorByName:(const char *)a3
{
  unordered_map<std::string, espresso_buffer_t, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, espresso_buffer_t>>> *p_outputBufferMap;
  char *v4;
  void *__p[2];
  char v7;
  void **v8;

  p_outputBufferMap = &self->_outputBufferMap;
  sub_2358D0CEC(__p, (char *)a3);
  v8 = __p;
  v4 = sub_2358D1E1C((uint64_t)p_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v8);
  if (v7 < 0)
    operator delete(__p[0]);
  return ($FD4688982923A924290ECB669CAF1EC2 *)(v4 + 40);
}

- (__CVBuffer)getOutPixelBufferByName:(const char *)a3
{
  unordered_map<std::string, __CVBuffer *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, __CVBuffer *>>> *p_outputPixelBufMap;
  __CVBuffer *v4;
  void *__p[2];
  char v7;
  void **v8;

  p_outputPixelBufMap = &self->_outputPixelBufMap;
  sub_2358D0CEC(__p, (char *)a3);
  v8 = __p;
  v4 = (__CVBuffer *)*((_QWORD *)sub_2358D20D0((uint64_t)p_outputPixelBufMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v8)+ 5);
  if (v7 < 0)
    operator delete(__p[0]);
  return v4;
}

- (CGSize)getResolutionByBlobName:(const char *)a3
{
  double v3;
  double v4;
  _QWORD v5[5];
  CGSize result;

  v5[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getBlobDimensionByName_andDestination_(self, a2, (uint64_t)a3, v5);
  v3 = (double)v5[0];
  v4 = (double)v5[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)switchConfiguration:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char isEqualToString;
  const char *v10;
  uint64_t v11;
  BOOL v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  objc_msgSend_networkResolution(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v4);

  if ((isEqualToString & 1) != 0)
    goto LABEL_2;
  objc_msgSend_cleanUpOutputPixelBufferMap(self, v10, v11);
  objc_msgSend_plan(self, v13, v14);
  espresso_plan_build_clean();
  v15 = objc_retainAutorelease(v4);
  objc_msgSend_UTF8String(v15, v16, v17);
  if (espresso_network_select_configuration())
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_23590EFC0((uint64_t)self, v20, v21);

    goto LABEL_18;
  }
  objc_msgSend_updateOutputBlobMap(self, v18, v19);
  if ((objc_msgSend_buildPlan(self, v22, v23) & 1) == 0)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_23590EF50(v28, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_17;
  }
  if ((objc_msgSend_validateNetworkOutputDimension(self, v24, v25) & 1) == 0)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_23590EEE0(v28, v36, v37, v38, v39, v40, v41, v42);
    goto LABEL_17;
  }
  if ((objc_msgSend_initNetworkOutput(self, v26, v27) & 1) == 0)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_23590EE70(v28, v43, v44, v45, v46, v47, v48, v49);
LABEL_17:

LABEL_18:
    v12 = 0;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&self->_networkResolution, v15);
LABEL_2:
  v12 = 1;
LABEL_19:

  return v12;
}

- (unint64_t)getInputChannels:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions())
    v6 = -1;
  else
    v6 = v8;

  return v6;
}

- (unint64_t)getInputHeight:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions())
    v6 = -1;
  else
    v6 = v8;

  return v6;
}

- (unint64_t)getInputWidth:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions())
    v6 = -1;
  else
    v6 = v8;

  return v6;
}

- (unint64_t)getInputLength:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  void **v11;
  void **v12;
  uint64_t v13;
  void **v15;
  void *__p[2];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_2358D0CEC(__p, v7);
  v15 = __p;
  sub_2358D1E1C((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v15);
  if (v17 < 0)
    operator delete(__p[0]);
  v15 = 0;
  v8 = espresso_buffer_unpack_tensor_shape();
  if ((_DWORD)v8)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_23590F040((uint64_t)v4, v8, v9);

    v10 = 0;
  }
  else
  {
    v11 = v15;
    if (v15)
    {
      v12 = __p;
      v10 = 1;
      do
      {
        v13 = (uint64_t)*v12++;
        v10 *= v13;
        v11 = (void **)((char *)v11 - 1);
      }
      while (v11);
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (unint64_t)getOutputChannels:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend_UTF8String(v3, v4, v5);
  if (espresso_network_query_blob_dimensions())
    v6 = -1;
  else
    v6 = v8;

  return v6;
}

- (unint64_t)getOutputHeight:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  void *__p[2];
  char v11;
  void **v12;

  v4 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_2358D0CEC(__p, v7);
  v12 = __p;
  v8 = *((_QWORD *)sub_2358D1E1C((uint64_t)&self->_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v12)+ 16);
  if (v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (unint64_t)getOutputRowElements:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  void *__p[2];
  char v11;
  void **v12;

  v4 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_2358D0CEC(__p, v7);
  v12 = __p;
  v8 = *((_QWORD *)sub_2358D1E1C((uint64_t)&self->_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v12)+ 15);
  if (v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (unint64_t)getOutputWidth:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  void *__p[2];
  char v11;
  void **v12;

  v4 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_2358D0CEC(__p, v7);
  v12 = __p;
  v8 = *((_QWORD *)sub_2358D1E1C((uint64_t)&self->_outputBufferMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v12)+ 15);
  if (v11 < 0)
    operator delete(__p[0]);

  return v8;
}

- (void)getRawOutput:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v4 = objc_retainAutorelease(a3);
  v7 = objc_msgSend_UTF8String(v4, v5, v6);
  v9 = *(void **)objc_msgSend_getTensorByName_(self, v8, v7);

  return v9;
}

- (unint64_t)getOutputLength:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v7 = objc_msgSend_UTF8String(v4, v5, v6);
  objc_msgSend_getTensorByName_(self, v8, v7);
  v9 = espresso_buffer_unpack_tensor_shape();
  if ((_DWORD)v9)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_23590F0C8((uint64_t)v4, v9, v10);

    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)getOpsForLibrary
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_23590F150(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (BOOL)runNetwork
{
  int v3;
  NSObject *v4;
  NSString *netPath;
  int v7;
  NSString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t last_error;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = espresso_plan_execute_sync();
  if (v3)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      netPath = self->_netPath;
      v7 = 138543874;
      v8 = netPath;
      v9 = 1024;
      v10 = v3;
      v11 = 2082;
      last_error = espresso_get_last_error();
      _os_log_fault_impl(&dword_2358CB000, v4, OS_LOG_TYPE_FAULT, "%{public}@: espresso_plan_execute_sync failed with status %d (%{public}s)", (uint8_t *)&v7, 0x1Cu);
    }

  }
  return v3 == 0;
}

- (BOOL)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4
{
  id v6;
  const char *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  char *v20;
  void *BaseAddress;
  unsigned __int8 *v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint64_t last_error;
  void *__p[2];
  char v33;
  __int128 *v34[4];
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_isPrepared)
  {
    if (CVPixelBufferGetPixelFormatType(a4) == 1111970369 || CVPixelBufferGetPixelFormatType(a4) == 1278226488)
    {
      v8 = objc_msgSend_bindNetworkInputWithImage_withInputName_(self, v7, (uint64_t)a4, v6);
    }
    else
    {
      v17 = objc_retainAutorelease(v6);
      v20 = (char *)objc_msgSend_UTF8String(v17, v18, v19);
      sub_2358D0CEC(__p, v20);
      if (sub_2358D2358(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p))
        goto LABEL_9;
      v37.i64[0] = (uint64_t)__p;
      *((_DWORD *)sub_2358D2458((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v37)+ 50) = 65568;
      v24 = objc_retainAutorelease(v17);
      v27 = objc_msgSend_UTF8String(v24, v25, v26);
      objc_msgSend_getBlobDimensionByName_andDestination_(self, v28, v27, &v37);
      v35 = vextq_s8(v38, v38, 8uLL);
      v36 = vextq_s8(v37, v37, 8uLL);
      v34[0] = (__int128 *)__p;
      sub_2358D2458((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, v34);
      if (!espresso_buffer_pack_tensor_shape())
      {
LABEL_9:
        CVPixelBufferLockBaseAddress(a4, 0);
        BaseAddress = CVPixelBufferGetBaseAddress(a4);
        v37.i64[0] = (uint64_t)__p;
        *((_QWORD *)sub_2358D2458((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v37)+ 5) = BaseAddress;
        v37.i64[0] = (uint64_t)__p;
        v22 = sub_2358D2458((uint64_t)&self->_input_espresso_buffer, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v37);
        v8 = objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self, v23, (uint64_t)(v22 + 40), v17);
        CVPixelBufferUnlockBaseAddress(a4, 0);
      }
      else
      {
        _ANSTLoggingGetOSLogForCategoryANSTKit();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          last_error = espresso_get_last_error();
          sub_23590F230(last_error, v34);
        }

        v8 = 0;
      }
      if (v33 < 0)
        operator delete(__p[0]);
    }
  }
  else
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_23590F1C0(v9, v10, v11, v12, v13, v14, v15, v16);

    v8 = 0;
  }

  return v8;
}

- (BOOL)setInput:(id)a3 fromRawPointer:(const void *)a4
{
  id v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  unsigned __int8 *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *__p[2];
  char v26;

  v6 = a3;
  v7 = v6;
  if (self->_isPrepared)
  {
    v8 = objc_retainAutorelease(v6);
    v11 = (char *)objc_msgSend_UTF8String(v8, v9, v10);
    sub_2358D0CEC(__p, v11);
    v12 = sub_2358D2358(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
    v13 = v12 != 0;
    if (v12)
    {
      *((_QWORD *)v12 + 5) = a4;
    }
    else
    {
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_23590F2E0((uint64_t)v8, v22, v23);

    }
    if (v26 < 0)
      operator delete(__p[0]);
  }
  else
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_23590F270(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = 0;
  }

  return v13;
}

- (ANSTBaseNetworkEspresso)initWithNetworkPath:(id)a3 engine:(int64_t)a4 networkMode:(id)a5 directAccessOutputBuffer:(BOOL)a6
{

  return 0;
}

- (void)cleanUpOutputPixelBufferMap
{
  CVPixelBufferRef i;

  for (i = (CVPixelBufferRef)self->_outputPixelBufMap.__table_.__p1_.__value_.__next_; i; i = *(CVPixelBufferRef *)i)
    CVPixelBufferRelease(*((CVPixelBufferRef *)i + 5));
  sub_2358D0F4C((uint64_t)&self->_outputPixelBufMap);
}

- (BOOL)supportFloat16IO
{
  return 0;
}

- (BOOL)supportZeroCopyOutput
{
  return 0;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  espresso_plan_destroy();
  espresso_context_destroy();
  objc_msgSend_cleanUpOutputPixelBufferMap(self, v3, v4);
  v5.receiver = self;
  v5.super_class = (Class)ANSTBaseNetworkEspresso;
  -[ANSTBaseNetworkEspresso dealloc](&v5, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_tracingEntry(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tracingEntry
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSString *networkResolution;
  const char *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  v14[0] = self->_netPath;
  v13[0] = CFSTR("netPath");
  v13[1] = CFSTR("engineType");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, self->_engineType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  v13[2] = CFSTR("enablePreprocess");
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v4, self->_enablePreprocess);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("networkVersion");
  objc_msgSend_networkVersion(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = CFSTR("networkMode");
  networkResolution = self->_networkResolution;
  v14[3] = v8;
  v14[4] = networkResolution;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)tracingEntryFormat
{
  if (qword_2563089A0 != -1)
    dispatch_once(&qword_2563089A0, &unk_2506E3AE0);
  return (id)qword_2563089A8;
}

- (void)context
{
  return self->_context;
}

- (void)plan
{
  return self->_plan;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  uint64_t v2;
  void *plan;
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  v2 = *(_QWORD *)&self->_network.network_index;
  plan = self->_network.plan;
  result.var1 = v2;
  result.var0 = plan;
  return result;
}

- (int64_t)engineType
{
  return self->_engineType;
}

- (int)planPriority
{
  return self->_planPriority;
}

- ($F613A077D53D3D97A8E0FDF5BAE1891D)preprocessor
{
  *($9DF72902E0F602464F2F248C9389BF3B *)retstr = *($9DF72902E0F602464F2F248C9389BF3B *)((char *)self + 248);
  return self;
}

- (BOOL)enablePreprocess
{
  return self->_enablePreprocess;
}

- (NSString)networkResolution
{
  return self->_networkResolution;
}

- (BOOL)useManagedBuffers
{
  return self->_useManagedBuffers;
}

- (NSSet)disabledOutputSet
{
  return self->_disabledOutputSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledOutputSet, 0);
  objc_storeStrong((id *)&self->_networkResolution, 0);
  sub_2358D284C((uint64_t)&self->_input_espresso_buffer);
  sub_2358D2884((uint64_t)&self->_expectedDimensions);
  sub_2358D284C((uint64_t)&self->_outputPixelBufMap);
  sub_2358D284C((uint64_t)&self->_outputBufferMap);
  objc_storeStrong((id *)&self->_netFileName, 0);
  objc_storeStrong((id *)&self->_netPath, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  return self;
}

@end
