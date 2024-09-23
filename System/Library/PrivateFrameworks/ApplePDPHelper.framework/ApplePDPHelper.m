void AppleCellularDataPlaneHelperInterface::AppleCellularDataPlaneHelperInterface(AppleCellularDataPlaneHelperInterface *this)
{
  uint64_t v2;
  IOACIPCBBNetCfgClass *v3;
  NSObject *v4;
  NSObject *v5;
  const __SCDynamicStore *SystemConfigStore;
  void *exception;

  ApplePDPHelperInterface::ApplePDPHelperInterface(this);
  *(_QWORD *)(v2 + 152) = 1018212795;
  *(_QWORD *)v2 = &off_24D915BD0;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(_QWORD *)(v2 + 192) = 0;
  *(_QWORD *)(v2 + 200) = 850045863;
  *(_OWORD *)(v2 + 208) = 0u;
  *(_OWORD *)(v2 + 224) = 0u;
  *(_OWORD *)(v2 + 240) = 0u;
  *(_QWORD *)(v2 + 256) = 0;
  *(_QWORD *)(v2 + 280) = v2 + 288;
  *(_QWORD *)(v2 + 288) = 0;
  v3 = (IOACIPCBBNetCfgClass *)(v2 + 312);
  *(_QWORD *)(v2 + 296) = 0;
  IOACIPCBBNetCfgClass::IOACIPCBBNetCfgClass((IOACIPCBBNetCfgClass *)(v2 + 312));
  *((_BYTE *)this + 304) = 1;
  *((_DWORD *)this + 18) = 4;
  IOACIPCBBNetCfgClass::setLogLevel(v3);
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = dispatch_queue_create("ApplePDPHelperDataPlane", v4);
  *((_QWORD *)this + 17) = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x219A18CB0](exception, "Unable to allocate DispatchQueue");
    goto LABEL_6;
  }
  SystemConfigStore = AppleCellularDataPlaneHelperInterface::createSystemConfigStore(this, v5);
  *((_QWORD *)this + 18) = SystemConfigStore;
  if (!SystemConfigStore)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x219A18CB0](exception, "Unable to allocate SystemConfigStore");
LABEL_6:
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
}

void sub_217E6063C(_Unwind_Exception *a1)
{
  ApplePDPHelperInterface *v1;
  std::condition_variable *v2;
  std::mutex *v3;
  uint64_t v4;
  void *v5;

  __cxa_free_exception(v5);
  MEMORY[0x219A18C98](v4);
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy((uint64_t)v1 + 280, *((_QWORD **)v1 + 36));
  std::mutex::~mutex(v3);
  std::condition_variable::~condition_variable(v2);
  ApplePDPHelperInterface::~ApplePDPHelperInterface(v1);
  _Unwind_Resume(a1);
}

const __SCDynamicStore *AppleCellularDataPlaneHelperInterface::createSystemConfigStore(AppleCellularDataPlaneHelperInterface *this, NSObject *a2)
{
  const __SCDynamicStore *v3;
  CFStringRef NetworkInterface;
  const __CFArray *v5;
  int v6;
  const char *v7;
  SCDynamicStoreContext context;
  _BYTE values[12];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  context.version = 0;
  context.info = (char *)this + 152;
  memset(&context.retain, 0, 24);
  v3 = SCDynamicStoreCreate(0, CFSTR("ApplePDPHelperDataPlane"), (SCDynamicStoreCallBack)handleInterfaceChange, &context);
  if (v3)
  {
    NetworkInterface = (CFStringRef)getNetworkInterfaceKey(void)::key;
    if (!getNetworkInterfaceKey(void)::key)
    {
      NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, (CFStringRef)*MEMORY[0x24BDF59B0]);
      getNetworkInterfaceKey(void)::key = (uint64_t)NetworkInterface;
    }
    *(_QWORD *)values = NetworkInterface;
    v5 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x24BDBD690]);
    SCDynamicStoreSetNotificationKeys(v3, v5, 0);
    SCDynamicStoreSetDispatchQueue(v3, a2);
    CFRelease(v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = SCError();
    v7 = SCErrorString(v6);
    *(_DWORD *)values = 136315394;
    *(_QWORD *)&values[4] = "createSystemConfigStore";
    v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: SCDOpen failed: %s", values, 0x16u);
  }
  return v3;
}

void AppleCellularDataPlaneHelperInterface::~AppleCellularDataPlaneHelperInterface(AppleCellularDataPlaneHelperInterface *this)
{
  *(_QWORD *)this = &off_24D915BD0;
  CFRelease(*((CFTypeRef *)this + 18));
  dispatch_release(*((dispatch_object_t *)this + 17));
  MEMORY[0x219A18C98]((char *)this + 312);
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy((uint64_t)this + 280, *((_QWORD **)this + 36));
  std::mutex::~mutex((std::mutex *)((char *)this + 200));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 152));
  ApplePDPHelperInterface::~ApplePDPHelperInterface(this);
}

{
  AppleCellularDataPlaneHelperInterface::~AppleCellularDataPlaneHelperInterface(this);
  JUMPOUT(0x219A18D40);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t AppleCellularDataPlaneHelperInterface::connect(AppleCellularDataPlaneHelperInterface *this, int a2)
{
  IOACIPCBBNetCfgClass *v4;
  char v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const __CFDictionary *cf;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  cf = IOServiceMatching("AppleCellularDataPlane");
  v4 = (AppleCellularDataPlaneHelperInterface *)((char *)this + 312);
  v5 = IOACIPCBBNetCfgClass::start(v4, cf);
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v15 = "connect";
      v16 = 1024;
      v17 = a2;
      v9 = MEMORY[0x24BDACB70];
      v10 = "::%s: failed to start IOACIPCNetCfgClass (context = %u)\n";
      goto LABEL_9;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  if (v6)
  {
    *(_DWORD *)buf = 136315394;
    v15 = "connect";
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: started IOACIPCNetCfgClass (context = %u)\n", buf, 0x12u);
  }
  v7 = IOACIPCBBNetCfgClass::open(v4);
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v15 = "connect";
      v16 = 1024;
      v17 = a2;
      v9 = MEMORY[0x24BDACB70];
      v10 = "::%s: failed to open IOACIPCNetCfgClass (context = %u)\n";
LABEL_9:
      _os_log_impl(&dword_217E5F000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x12u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v8)
  {
    *(_DWORD *)buf = 136315394;
    v15 = "connect";
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: opened IOACIPCNetCfgClass (context = %u)\n", buf, 0x12u);
  }
  v11 = 1;
LABEL_11:
  CFRelease(cf);
  return v11;
}

void sub_217E60A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CFTypeRef *a9)
{
  ACDPHelperSentry<AppleCellularDataPlaneHelperInterface::connect(unsigned short)::$_0>::~ACDPHelperSentry(&a9);
  _Unwind_Resume(a1);
}

CFTypeRef **ACDPHelperSentry<AppleCellularDataPlaneHelperInterface::connect(unsigned short)::$_0>::~ACDPHelperSentry(CFTypeRef **a1)
{
  CFRelease(**a1);
  return a1;
}

uint64_t AppleCellularDataPlaneHelperInterface::disconnect(AppleCellularDataPlaneHelperInterface *this)
{
  return IOACIPCBBNetCfgClass::stop((AppleCellularDataPlaneHelperInterface *)((char *)this + 312));
}

uint64_t AppleCellularDataPlaneHelperInterface::ipcConfigSet(uint64_t a1, int *a2)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *a2;
    v4 = *((_QWORD *)a2 + 1);
    v5 = *((unsigned __int8 *)a2 + 16);
    v6 = a2[5];
    v7 = a2[6];
    v8 = a2[7];
    v10 = 136316674;
    v11 = "ipcConfigSet";
    v12 = 1024;
    v13 = v3;
    v14 = 2080;
    v15 = v4;
    v16 = 1024;
    v17 = v5;
    v18 = 1024;
    v19 = v6;
    v20 = 1024;
    v21 = v7;
    v22 = 1024;
    v23 = v8;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: context = %u, config = %s, active = %u, TrafficTypeMask = %x, DataPathType = %x, MaxQueueSets = %d\n", (uint8_t *)&v10, 0x34u);
  }
  return ApplePDPHelperInterface::ipcConfigSet();
}

uint64_t AppleCellularDataPlaneHelperInterface::ipcInterfaceConfig(uint64_t a1, int *a2, unsigned int *a3)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  uint64_t *v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;
  uint64_t *v30;
  int v31;
  _BOOL4 v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  _QWORD v36[6];
  _QWORD v37[6];
  unsigned int *v38;
  char __str[9];
  _BYTE buf[12];
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *a2;
    v7 = *((_QWORD *)a2 + 1);
    v8 = *((unsigned __int8 *)a2 + 24);
    v9 = a2[4];
    v10 = a2[5];
    v11 = *((_QWORD *)a2 + 4);
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "ipcInterfaceConfig";
    v41 = 1024;
    v42 = v9;
    v43 = 1024;
    v44 = v6;
    v45 = 2080;
    v46 = v7;
    v47 = 1024;
    v48 = v8;
    v49 = 1024;
    v50 = v10;
    v51 = 2048;
    v52 = v11;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: interface = %u, context = %u, config = %s, active = %u, bearerId = 0x%x, qset-id = %llu \n", buf, 0x38u);
  }
  std::mutex::lock((std::mutex *)(a1 + 8));
  if ((*a2 - 1) < 2)
  {
    if (!*((_QWORD *)a2 + 1))
    {
      v13 = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "ipcInterfaceConfig";
        v14 = MEMORY[0x24BDACB70];
        v15 = "::%s: ERROR: config set not assigned\n";
        goto LABEL_12;
      }
      goto LABEL_14;
    }
    v12 = (unsigned int *)(a2 + 4);
    if (a2[4] >= 0x20)
    {
      v13 = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "ipcInterfaceConfig";
        v14 = MEMORY[0x24BDACB70];
        v15 = "::%s: ERROR: interface index out of range\n";
LABEL_12:
        _os_log_impl(&dword_217E5F000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    snprintf(__str, 9uLL, "pdp_ip%u", a2[4]);
    if (*((_BYTE *)a2 + 24))
    {
      v17 = *(_QWORD *)(a1 + 288);
      if (!v17)
        goto LABEL_27;
      v18 = *v12;
      v19 = a1 + 288;
      do
      {
        v20 = *(_DWORD *)(v17 + 32);
        v21 = v20 >= v18;
        if (v20 >= v18)
          v22 = (uint64_t *)v17;
        else
          v22 = (uint64_t *)(v17 + 8);
        if (v21)
          v19 = v17;
        v17 = *v22;
      }
      while (*v22);
      if (v19 == a1 + 288 || v18 < *(_DWORD *)(v19 + 32))
      {
LABEL_27:
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 0x40000000;
        v37[2] = ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke;
        v37[3] = &__block_descriptor_tmp;
        v37[4] = a1;
        v37[5] = a2;
        v23 = AppleCellularDataPlaneHelperInterface::waitForDevicePresence(a1, __str, 0x2710u, 0, (uint64_t)v37);
        if (v23 == 2)
        {
          AppleCellularDataPlaneHelperInterface::removeInterface((AppleCellularDataPlaneHelperInterface *)a1, *v12);
          goto LABEL_13;
        }
        if (v23)
        {
LABEL_13:
          v13 = 0;
          goto LABEL_14;
        }
        v18 = *v12;
      }
      v24 = a2[5];
      if (v24 != -1)
      {
        if (!AppleCellularDataPlaneHelperInterface::addBearer((AppleCellularDataPlaneHelperInterface *)a1, v18, v24))goto LABEL_13;
        v18 = a2[4];
        v24 = a2[5];
      }
    }
    else
    {
      v25 = *(_QWORD *)(a1 + 288);
      if (v25)
      {
        v26 = *v12;
        v27 = a1 + 288;
        do
        {
          v28 = *(_DWORD *)(v25 + 32);
          v29 = v28 >= v26;
          if (v28 >= v26)
            v30 = (uint64_t *)v25;
          else
            v30 = (uint64_t *)(v25 + 8);
          if (v29)
            v27 = v25;
          v25 = *v30;
        }
        while (*v30);
        if (v27 != a1 + 288 && v26 >= *(_DWORD *)(v27 + 32))
        {
          v31 = a2[5];
          if (v31 == -1)
          {
            v32 = 1;
            v33 = -1;
          }
          else
          {
            *(_QWORD *)buf = a2 + 4;
            v32 = v31 == *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 280), (unsigned int *)a2 + 4, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18);
            v26 = a2[4];
            v33 = a2[5];
          }
          AppleCellularDataPlaneHelperInterface::removeBearer((AppleCellularDataPlaneHelperInterface *)a1, v26, v33);
          if (v32)
          {
            v36[0] = MEMORY[0x24BDAC760];
            v36[1] = 0x40000000;
            v36[2] = ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke_2;
            v36[3] = &__block_descriptor_tmp_6;
            v36[4] = a1;
            v36[5] = a2;
            AppleCellularDataPlaneHelperInterface::waitForDevicePresence(a1, __str, 0x2710u, 1, (uint64_t)v36);
            if (std::map<unsigned int,ACDPNetIFConfig>::contains[abi:ne180100](a1 + 280, (unsigned int *)a2 + 4))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              {
                v34 = *v12;
                v38 = v12;
                v35 = *((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 280), v12, (uint64_t)&std::piecewise_construct, &v38)+ 40);
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "ipcInterfaceConfig";
                v41 = 1024;
                v42 = v34;
                v43 = 1024;
                v44 = v35;
                _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Enforcing Configuration Removal (interface = %u, rss = %u)\n", buf, 0x18u);
              }
              *(_QWORD *)buf = v12;
              if (*((_BYTE *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 280), v12, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 40))
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = "ipcInterfaceConfig";
                  _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Releasing RSS token.\n", buf, 0xCu);
                }
                *(_BYTE *)(a1 + 304) = 1;
              }
              std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__erase_unique<unsigned int>(a1 + 280, v12);
            }
          }
          AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID(a1, 0xFFFFFFFF, 0xFFFFFFFF, a3);
          goto LABEL_46;
        }
      }
      v18 = -1;
      v24 = -1;
    }
    AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID(a1, v18, v24, a3);
LABEL_46:
    v13 = 1;
    goto LABEL_14;
  }
  v13 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "ipcInterfaceConfig";
    v14 = MEMORY[0x24BDACB70];
    v15 = "::%s: ERROR: wrong ICP Context\n";
    goto LABEL_12;
  }
LABEL_14:
  std::mutex::unlock((std::mutex *)(a1 + 8));
  return v13;
}

void sub_217E61188(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL std::map<unsigned int,ACDPNetIFConfig>::contains[abi:ne180100](uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;

  v4 = *(_QWORD *)(a1 + 8);
  v2 = a1 + 8;
  v3 = v4;
  if (!v4)
    goto LABEL_12;
  v5 = *a2;
  v6 = v2;
  do
  {
    v7 = *(_DWORD *)(v3 + 32);
    v8 = v7 >= v5;
    if (v7 >= v5)
      v9 = (uint64_t *)v3;
    else
      v9 = (uint64_t *)(v3 + 8);
    if (v8)
      v6 = v3;
    v3 = *v9;
  }
  while (*v9);
  if (v6 == v2 || v5 < *(_DWORD *)(v6 + 32))
LABEL_12:
    v6 = v2;
  return v6 != v2;
}

uint64_t AppleCellularDataPlaneHelperInterface::waitForDevicePresence(uint64_t a1, const char *a2, unsigned int a3, int a4, uint64_t a5)
{
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  std::chrono::steady_clock::time_point v15;
  std::chrono::steady_clock::time_point v16;
  std::chrono::system_clock::time_point v17;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v18;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v19;
  NSObject *v20;
  const char *v21;
  std::unique_lock<std::mutex> v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "waitForDevicePresence";
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: invalid interface name", buf, 0xCu);
    }
    return 1;
  }
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (!v10)
      goto LABEL_11;
    *(_DWORD *)buf = 136315650;
    v24 = "waitForDevicePresence";
    v25 = 2080;
    v26 = a2;
    v27 = 1024;
    v28 = a3;
    v11 = MEMORY[0x24BDACB70];
    v12 = "::%s: Waiting for interface absence (%s, timeout = %ums)";
  }
  else
  {
    if (!v10)
      goto LABEL_11;
    *(_DWORD *)buf = 136315650;
    v24 = "waitForDevicePresence";
    v25 = 2080;
    v26 = a2;
    v27 = 1024;
    v28 = a3;
    v11 = MEMORY[0x24BDACB70];
    v12 = "::%s: Waiting for interface presence (%s, timeout = %ums)";
  }
  _os_log_impl(&dword_217E5F000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x1Cu);
LABEL_11:
  v22.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 200);
  v22.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 200));
  if (AppleCellularDataPlaneHelperInterface::checkForDevicePresence((SCDynamicStoreRef *)a1, a2, a4 == 0)
    || *(_BYTE *)(a1 + 276))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "waitForDevicePresence";
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Structor called in wrong state", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (!(*(unsigned int (**)(uint64_t))(a5 + 16))(a5))
  {
LABEL_15:
    v13 = 1;
LABEL_16:
    std::mutex::unlock(v22.__m_);
    return v13;
  }
  *(_QWORD *)(a1 + 264) = a2;
  *(_DWORD *)(a1 + 272) = a4;
  v15.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 1000000 * a3;
  do
  {
    if (*(_BYTE *)(a1 + 276))
      goto LABEL_37;
    if (v15.__d_.__rep_ <= std::chrono::steady_clock::now().__d_.__rep_)
      break;
    v16.__d_.__rep_ = v15.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
    if (v16.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v17.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (v17.__d_.__rep_)
      {
        if (v17.__d_.__rep_ < 1)
        {
          if ((unint64_t)v17.__d_.__rep_ < 0xFFDF3B645A1CAC09)
          {
            v18 = 0x8000000000000000;
            goto LABEL_33;
          }
        }
        else if ((unint64_t)v17.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          v18 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_31;
        }
        v18 = 1000 * v17.__d_.__rep_;
      }
      else
      {
        v18 = 0;
      }
LABEL_31:
      if (v18 > (v16.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
      {
        v19.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_34:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 152), &v22, v19);
        std::chrono::steady_clock::now();
        continue;
      }
LABEL_33:
      v19.__d_.__rep_ = v18 + v16.__d_.__rep_;
      goto LABEL_34;
    }
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < v15.__d_.__rep_);
  if (*(_BYTE *)(a1 + 276))
  {
LABEL_37:
    if (a4)
    {
      if (a4 == 1 && !*(_BYTE *)(a1 + 277))
      {
        v13 = 0;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_50;
        *(_DWORD *)buf = 136315394;
        v24 = "waitForDevicePresence";
        v25 = 2080;
        v26 = a2;
        v20 = MEMORY[0x24BDACB70];
        v21 = "::%s: Interface successfully removed (%s)";
LABEL_45:
        _os_log_impl(&dword_217E5F000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
        v13 = 0;
        goto LABEL_50;
      }
    }
    else if (*(_BYTE *)(a1 + 277))
    {
      v13 = 0;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_50;
      *(_DWORD *)buf = 136315394;
      v24 = "waitForDevicePresence";
      v25 = 2080;
      v26 = a2;
      v20 = MEMORY[0x24BDACB70];
      v21 = "::%s: Interface successfully attached (%s)";
      goto LABEL_45;
    }
    v13 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "waitForDevicePresence";
      v25 = 2080;
      v26 = a2;
      v27 = 1024;
      v28 = a3;
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Timeout Waiting for interface (%s, timeout = %ums)", buf, 0x1Cu);
    }
    v13 = 2;
  }
LABEL_50:
  *(_QWORD *)(a1 + 264) = 0;
  *(_BYTE *)(a1 + 276) = 0;
  if (v22.__owns_)
    goto LABEL_16;
  return v13;
}

void sub_217E61698(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

BOOL ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke(AppleCellularDataPlaneHelperInterface *a1)
{
  unsigned __int16 *v2;
  uint64_t **v3;
  unsigned int v4;
  int v5;
  char *v6;
  int v7;
  int v8;

  v3 = (uint64_t **)*((_QWORD *)a1 + 4);
  v2 = (unsigned __int16 *)*((_QWORD *)a1 + 5);
  v4 = *((_DWORD *)v2 + 4);
  v5 = *v2;
  v6 = AppleCellularDataPlaneHelperInterface::ipcConfigSetHasRSS(a1, *((char **)v2 + 1));
  v7 = (int)v6;
  v8 = AppleCellularDataPlaneHelperInterface::ipcConfigSetHasPrioUL((AppleCellularDataPlaneHelperInterface *)v6, *(char **)(*((_QWORD *)a1 + 5) + 8));
  return AppleCellularDataPlaneHelperInterface::addInterface(v3, v4, v5, v7, v8);
}

BOOL AppleCellularDataPlaneHelperInterface::addInterface(uint64_t **this, unsigned int a2, int a3, int a4, int a5)
{
  uint64_t *v10;
  uint64_t **v11;
  unsigned int v12;
  BOOL v13;
  uint64_t **v14;
  _BOOL8 v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  char *v29;
  int v30;
  uint64_t **v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v46;
  _OWORD v47[12];
  int v48;
  __int16 v49;
  char v50;
  char v51;
  uint64_t v52;
  int v53;
  int v54;
  __int16 v55;
  unsigned int v56;
  unsigned int *v57;
  uint8_t v58[4];
  _BYTE v59[20];
  uint64_t *v60;
  _BYTE v61[200];
  _BYTE buf[12];
  __int16 v63;
  unsigned int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  _BYTE v71[452];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v56 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "addInterface";
    v63 = 1024;
    v64 = a2;
    v65 = 1024;
    v66 = a3;
    v67 = 1024;
    v68 = a4;
    v69 = 1024;
    v70 = a5;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Adding Network Interface %u (context %u, rss = %u, prioUL = %u)\n", buf, 0x24u);
  }
  if ((AppleCellularDataPlaneHelperInterface::connect((AppleCellularDataPlaneHelperInterface *)this, a3) & 1) == 0)
  {
    v15 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_63;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "addInterface";
    v16 = MEMORY[0x24BDACB70];
    v17 = "::%s: ERROR: Failed to connect to ACDP-Driver. Device Reset needed or Device in Reset\n";
    v18 = 12;
    goto LABEL_19;
  }
  v10 = this[36];
  if (v10)
  {
    v11 = this + 36;
    do
    {
      v12 = *((_DWORD *)v10 + 8);
      v13 = v12 >= v56;
      if (v12 >= v56)
        v14 = (uint64_t **)v10;
      else
        v14 = (uint64_t **)(v10 + 1);
      if (v13)
        v11 = (uint64_t **)v10;
      v10 = *v14;
    }
    while (*v14);
    if (v11 != this + 36 && v56 >= *((_DWORD *)v11 + 8))
    {
      *(_QWORD *)buf = &v56;
      if (*((unsigned __int16 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v56, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 21) == a3)
      {
        *(_QWORD *)buf = &v56;
        if (*((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v56, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 40) == a4)
        {
          *(_QWORD *)buf = &v56;
          if (*((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v56, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 41) == a5)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "addInterface";
              v63 = 1024;
              v64 = v56;
              _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Compatible Network Interface %u is already configured by ACDP-Helper.\n", buf, 0x12u);
            }
            v15 = 1;
            goto LABEL_63;
          }
        }
      }
      v15 = 0;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_63;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "addInterface";
      v63 = 1024;
      v64 = v56;
      v16 = MEMORY[0x24BDACB70];
      v17 = "::%s: ERROR: Incompatible Network Interface %u is already configured by ACDP-Helper.\n";
      v18 = 18;
LABEL_19:
      _os_log_impl(&dword_217E5F000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
      v15 = 0;
      goto LABEL_63;
    }
  }
  if (*((_BYTE *)this + 304))
  {
    *((_BYTE *)this + 304) = a4 ^ 1;
  }
  else if (a4)
  {
    a4 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "addInterface";
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: RSS wanted but already in use by another interface\n", buf, 0xCu);
      a4 = 0;
    }
  }
  bzero(buf, 0x1DEuLL);
  bzero(&v49, 0x1CuLL);
  v49 = v56;
  v50 = a5;
  v51 = a4;
  v52 = 0xBE000000FALL;
  v54 = 256;
  if (a4)
  {
    v53 = 0x2000;
    v55 = 0x2000;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v58 = 136315906;
    *(_QWORD *)v59 = "addInterface";
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = 250;
    *(_WORD *)&v59[14] = 1024;
    *(_DWORD *)&v59[16] = 190;
    LOWORD(v60) = 1024;
    *(_DWORD *)((char *)&v60 + 2) = 256;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: rxPacingTimerUS = %u, rxPacketPacingThresold = %u TRSize = %u)\n", v58, 0x1Eu);
  }
  v19 = IOACIPCBBNetCfgClass::addNetIf();
  v15 = v19 == 0;
  if (v19)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v58 = 136315138;
      *(_QWORD *)v59 = "addInterface";
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: ERROR: failed to add network interface\n", v58, 0xCu);
    }
    if (a4)
      *((_BYTE *)this + 304) = 1;
    goto LABEL_63;
  }
  v46 = a5;
  v20 = 0;
  v21 = 0;
  v22 = MEMORY[0x24BDACB70];
  while (1)
  {
    v23 = *(_DWORD *)((char *)&v69 + v20);
    if (v23 == 2)
    {
      v29 = (char *)v47 + 12 * v21;
      *(_QWORD *)(v29 + 4) = 0xFF00000003;
      v30 = *(unsigned __int16 *)&v71[v20];
      *((_DWORD *)v29 + 3) = v30;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v58 = 136315394;
        *(_QWORD *)v59 = "addInterface";
        *(_WORD *)&v59[8] = 1024;
        *(_DWORD *)&v59[10] = v30;
        _os_log_impl(&dword_217E5F000, v22, OS_LOG_TYPE_DEFAULT, "::%s: DL Pipe configured (id = %u)\n", v58, 0x12u);
      }
      v26 = (v21 + 1);
      if (v26 > 0xF)
        goto LABEL_49;
      goto LABEL_48;
    }
    if (v23 != 1)
    {
      v26 = v21;
      goto LABEL_48;
    }
    v24 = (_DWORD *)v47 + 3 * v21;
    v24[1] = 0;
    v24[2] = 0;
    v25 = *(unsigned __int16 *)&v71[v20];
    v24[3] = v25;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v58 = 136315394;
      *(_QWORD *)v59 = "addInterface";
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v25;
      _os_log_impl(&dword_217E5F000, v22, OS_LOG_TYPE_DEFAULT, "::%s: UL.Default Pipe configured (id = %u)\n", v58, 0x12u);
    }
    v26 = (v21 + 1);
    if (v26 > 0xF)
      goto LABEL_49;
    v27 = *(unsigned __int16 *)&v71[v20 + 2];
    if (v27 != 0xFFFF)
    {
      v28 = (char *)v47 + 12 * v26;
      *(_QWORD *)(v28 + 4) = 0x100000000;
      *((_DWORD *)v28 + 3) = v27;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v58 = 136315394;
        *(_QWORD *)v59 = "addInterface";
        *(_WORD *)&v59[8] = 1024;
        *(_DWORD *)&v59[10] = v27;
        _os_log_impl(&dword_217E5F000, v22, OS_LOG_TYPE_DEFAULT, "::%s: UL.Prio Pipe configured (id = %u)\n", v58, 0x12u);
      }
      v26 = (v21 + 2);
      if (v26 > 0xF)
        break;
    }
LABEL_48:
    v20 += 28;
    v21 = v26;
    if (v20 == 448)
      goto LABEL_49;
  }
  LODWORD(v26) = 16;
LABEL_49:
  LODWORD(v47[0]) = v26;
  *(_OWORD *)&v61[148] = v47[9];
  *(_OWORD *)&v61[164] = v47[10];
  *(_OWORD *)&v61[180] = v47[11];
  *(_OWORD *)&v61[84] = v47[5];
  *(_OWORD *)&v61[100] = v47[6];
  *(_OWORD *)&v61[116] = v47[7];
  *(_OWORD *)&v61[132] = v47[8];
  *(_OWORD *)&v61[20] = v47[1];
  *(_OWORD *)&v61[36] = v47[2];
  *(_OWORD *)&v61[52] = v47[3];
  *(_OWORD *)&v61[68] = v47[4];
  v58[0] = a4;
  v58[1] = v46;
  *(_WORD *)&v58[2] = a3;
  *(_QWORD *)&v59[12] = 0;
  v60 = 0;
  *(_QWORD *)&v59[4] = &v59[12];
  *(_DWORD *)v61 = -1;
  *(_DWORD *)&v61[196] = v48;
  *(_OWORD *)&v61[4] = v47[0];
  v57 = &v56;
  v31 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 35, &v56, (uint64_t)&std::piecewise_construct, &v57);
  *((_DWORD *)v31 + 10) = *(_DWORD *)v58;
  v32 = (uint64_t *)(v31 + 7);
  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy((uint64_t)(v31 + 6), v31[7]);
  v33 = *(uint64_t **)&v59[12];
  v31[6] = *(uint64_t **)&v59[4];
  v31[7] = v33;
  v34 = v60;
  v31[8] = v60;
  if (v34)
  {
    v33[2] = (uint64_t)v32;
    *(_QWORD *)&v59[4] = &v59[12];
    *(_QWORD *)&v59[12] = 0;
    v60 = 0;
    v33 = 0;
  }
  else
  {
    v31[6] = v32;
  }
  v35 = *(uint64_t **)&v61[192];
  v37 = *(_OWORD *)&v61[160];
  v36 = *(_OWORD *)&v61[176];
  v38 = *(_OWORD *)&v61[128];
  *(_OWORD *)(v31 + 27) = *(_OWORD *)&v61[144];
  *(_OWORD *)(v31 + 29) = v37;
  *(_OWORD *)(v31 + 31) = v36;
  v40 = *(_OWORD *)&v61[96];
  v39 = *(_OWORD *)&v61[112];
  v41 = *(_OWORD *)&v61[64];
  *(_OWORD *)(v31 + 19) = *(_OWORD *)&v61[80];
  *(_OWORD *)(v31 + 21) = v40;
  *(_OWORD *)(v31 + 23) = v39;
  *(_OWORD *)(v31 + 25) = v38;
  v43 = *(_OWORD *)&v61[32];
  v42 = *(_OWORD *)&v61[48];
  v44 = *(_OWORD *)v61;
  *(_OWORD *)(v31 + 11) = *(_OWORD *)&v61[16];
  *(_OWORD *)(v31 + 13) = v43;
  v31[33] = v35;
  *(_OWORD *)(v31 + 15) = v42;
  *(_OWORD *)(v31 + 17) = v41;
  *(_OWORD *)(v31 + 9) = v44;
  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy((uint64_t)&v59[4], v33);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v58 = 136315394;
    *(_QWORD *)v59 = "addInterface";
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = v56;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Network Interface %u added.\n", v58, 0x12u);
  }
  v15 = 1;
LABEL_63:
  IOACIPCBBNetCfgClass::stop((IOACIPCBBNetCfgClass *)(this + 39));
  return v15;
}

void sub_217E61FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,_QWORD *a47)
{
  uint64_t v47;
  uint64_t v48;

  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(v48, a47);
  IOACIPCBBNetCfgClass::stop((IOACIPCBBNetCfgClass *)(v47 + 312));
  _Unwind_Resume(a1);
}

char *AppleCellularDataPlaneHelperInterface::ipcConfigSetHasRSS(AppleCellularDataPlaneHelperInterface *this, char *a2)
{
  unsigned __int8 v3;
  int v4;
  void *v5;
  size_t v6;
  _QWORD *v7;
  size_t v8;
  _BYTE *v9;
  size_t v10;
  _BOOL4 v11;
  _QWORD v13[2];
  unsigned __int8 v14;
  _BYTE buf[22];
  unsigned __int8 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "ipcConfigSetHasRSS";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: config = %s\n", buf, 0x16u);
  }
  if (a2)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "__Internet__");
    std::string::basic_string[abi:ne180100]<0>(v13, a2);
    v3 = v16;
    v4 = (char)v14;
    v5 = (void *)v13[0];
    if ((v14 & 0x80u) == 0)
      v6 = v14;
    else
      v6 = v13[1];
    if ((v14 & 0x80u) == 0)
      v7 = v13;
    else
      v7 = (_QWORD *)v13[0];
    if ((v16 & 0x80u) == 0)
      v8 = v16;
    else
      v8 = *(_QWORD *)&buf[8];
    if ((v16 & 0x80u) == 0)
      v9 = buf;
    else
      v9 = *(_BYTE **)buf;
    if (v8 >= v6)
      v10 = v6;
    else
      v10 = v8;
    v11 = memcmp(v7, v9, v10) == 0;
    if (v8 == v6)
      a2 = (char *)v11;
    else
      a2 = 0;
    if (v4 < 0)
    {
      operator delete(v5);
      if ((v16 & 0x80) == 0)
        return a2;
    }
    else if ((v3 & 0x80) == 0)
    {
      return a2;
    }
    operator delete(*(void **)buf);
  }
  return a2;
}

void sub_217E62160(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *AppleCellularDataPlaneHelperInterface::ipcConfigSetHasPrioUL(AppleCellularDataPlaneHelperInterface *this, char *a2)
{
  unsigned __int8 v3;
  int v4;
  void *v5;
  size_t v6;
  _QWORD *v7;
  size_t v8;
  _BYTE *v9;
  size_t v10;
  _BOOL4 v11;
  _QWORD v13[2];
  unsigned __int8 v14;
  _BYTE buf[22];
  unsigned __int8 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "ipcConfigSetHasPrioUL";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: config = %s\n", buf, 0x16u);
  }
  if (a2)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "__Internet__");
    std::string::basic_string[abi:ne180100]<0>(v13, a2);
    v3 = v16;
    v4 = (char)v14;
    v5 = (void *)v13[0];
    if ((v14 & 0x80u) == 0)
      v6 = v14;
    else
      v6 = v13[1];
    if ((v14 & 0x80u) == 0)
      v7 = v13;
    else
      v7 = (_QWORD *)v13[0];
    if ((v16 & 0x80u) == 0)
      v8 = v16;
    else
      v8 = *(_QWORD *)&buf[8];
    if ((v16 & 0x80u) == 0)
      v9 = buf;
    else
      v9 = *(_BYTE **)buf;
    if (v8 >= v6)
      v10 = v6;
    else
      v10 = v8;
    v11 = memcmp(v7, v9, v10) == 0;
    if (v8 == v6)
      a2 = (char *)v11;
    else
      a2 = 0;
    if (v4 < 0)
    {
      operator delete(v5);
      if ((v16 & 0x80) == 0)
        return a2;
    }
    else if ((v3 & 0x80) == 0)
    {
      return a2;
    }
    operator delete(*(void **)buf);
  }
  return a2;
}

void sub_217E622E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t AppleCellularDataPlaneHelperInterface::removeInterface(AppleCellularDataPlaneHelperInterface *this, unsigned int a2)
{
  uint64_t v3;
  uint64_t **v5;
  _DWORD *v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;
  uint64_t v10;
  int v12;
  uint64_t **v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  unsigned int *v18[2];
  unsigned __int8 v19[4];
  _BYTE buf[12];
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v19 = a2;
  v3 = *((_QWORD *)this + 36);
  if (v3)
  {
    v5 = (uint64_t **)((char *)this + 280);
    v6 = (_DWORD *)((char *)this + 288);
    do
    {
      v7 = *(_DWORD *)(v3 + 32);
      v8 = v7 >= a2;
      if (v7 >= a2)
        v9 = (uint64_t *)v3;
      else
        v9 = (uint64_t *)(v3 + 8);
      if (v8)
        v6 = (_DWORD *)v3;
      v3 = *v9;
    }
    while (*v9);
    if (v6 != (_DWORD *)((char *)this + 288) && v6[8] <= a2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)buf = v19;
        v12 = *((unsigned __int8 *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, (unsigned int *)v19, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 40);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "removeInterface";
        v21 = 1024;
        v22 = a2;
        v23 = 1024;
        v24 = v12;
        _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Removing Network Interface %u (rss = %u)\n", buf, 0x18u);
      }
      v18[0] = (unsigned int *)this;
      v18[1] = (unsigned int *)v19;
      *(_QWORD *)buf = v19;
      v13 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, (unsigned int *)v19, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      if ((AppleCellularDataPlaneHelperInterface::connect(this, *((unsigned __int16 *)v13 + 21)) & 1) != 0)
      {
        v14 = IOACIPCBBNetCfgClass::removeNetIf((AppleCellularDataPlaneHelperInterface *)((char *)this + 312));
        v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if (!v14)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "removeInterface";
            v21 = 1024;
            v22 = *(_DWORD *)v19;
            _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Network Interface %u removed\n", buf, 0x12u);
          }
          v10 = 1;
          goto LABEL_29;
        }
        if (!v15)
          goto LABEL_25;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "removeInterface";
        v16 = MEMORY[0x24BDACB70];
        v17 = "::%s: Failed to remove network interface. Device Reset needed.\n";
      }
      else
      {
        v10 = 0;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
LABEL_29:
          IOACIPCBBNetCfgClass::stop((AppleCellularDataPlaneHelperInterface *)((char *)this + 312));
          ACDPHelperSentry<AppleCellularDataPlaneHelperInterface::removeInterface::$_0>::~ACDPHelperSentry(v18);
          return v10;
        }
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "removeInterface";
        v16 = MEMORY[0x24BDACB70];
        v17 = "::%s: ERROR: Failed to connect to ACDP-Driver. Device Reset needed\n";
      }
      _os_log_impl(&dword_217E5F000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
LABEL_25:
      v10 = 0;
      goto LABEL_29;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "removeInterface";
    v21 = 1024;
    v22 = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Network Interface %u not configured by ACDP-Helper. Returning Success.\n", buf, 0x12u);
  }
  return 1;
}

void sub_217E62600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  _Unwind_Resume(exception_object);
}

uint64_t AppleCellularDataPlaneHelperInterface::addBearer(AppleCellularDataPlaneHelperInterface *this, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t **v7;
  _DWORD *v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  _BOOL4 v12;
  uint64_t result;
  uint64_t **v14;
  uint64_t **v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t **v18;
  unsigned int v19;
  BOOL v20;
  uint64_t **v21;
  uint64_t *v22;
  _BOOL4 v23;
  uint64_t **v24;
  uint64_t **v25;
  uint64_t **v26;
  uint64_t **v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  uint64_t **v31;
  unint64_t v32;
  int v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  __int16 v51;
  char *v52;
  __int16 v53;
  unsigned int v54;
  uint64_t **v55;
  uint64_t **v56;
  uint64_t *v57;
  uint64_t *v58;
  __int16 v59;
  void *__p;
  char *v61;
  char *v62;
  void *v63;
  char *v64;
  char *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int *v68;
  uint8_t buf[24];
  __int128 v70;
  uint64_t *v71;
  __int16 v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  v67 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "addBearer";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Adding Bearer %u to Network Interface %u.\n", buf, 0x18u);
  }
  v6 = *((_QWORD *)this + 36);
  if (v6)
  {
    v7 = (uint64_t **)((char *)this + 280);
    v8 = (_DWORD *)((char *)this + 288);
    do
    {
      v9 = *(_DWORD *)(v6 + 32);
      v10 = v9 >= v67;
      if (v9 >= v67)
        v11 = (uint64_t *)v6;
      else
        v11 = (uint64_t *)(v6 + 8);
      if (v10)
        v8 = (_DWORD *)v6;
      v6 = *v11;
    }
    while (*v11);
    if (v8 != (_DWORD *)((char *)this + 288) && v67 >= v8[8])
    {
      *(_QWORD *)buf = &v67;
      v14 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      v17 = v14[7];
      v15 = v14 + 7;
      v16 = v17;
      if (v17)
      {
        v18 = v15;
        do
        {
          v19 = *((_DWORD *)v16 + 8);
          v20 = v19 >= v66;
          if (v19 >= v66)
            v21 = (uint64_t **)v16;
          else
            v21 = (uint64_t **)(v16 + 1);
          if (v20)
            v18 = (uint64_t **)v16;
          v16 = *v21;
        }
        while (*v21);
        if (v18 != v15 && v66 >= *((_DWORD *)v18 + 8))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "addBearer";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v66;
            _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Bearer %u is already configured. Returning Success.\n", buf, 0x12u);
          }
          return 1;
        }
      }
      v63 = 0;
      v64 = 0;
      v65 = 0;
      __p = 0;
      v61 = 0;
      v62 = 0;
      v59 = 0;
      *(_QWORD *)buf = &v67;
      v22 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)[8];
      v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "addBearer";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v66;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v67;
          _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: ERROR: Failed to add Bearer %u on Interface %u. Out of radio resources. Redirecting to Default Bearer\n", buf, 0x18u);
        }
        *(_QWORD *)buf = &v67;
        LODWORD(v68) = *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18);
        if ((_DWORD)v68 == -1)
          __assert_rtn("addBearer", "AppleCellularDataPlaneHelper.cpp", 688, "defaultBearerID != kACDPHelperNoBearer");
        *(_QWORD *)buf = &v67;
        v24 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(_QWORD *)buf = &v68;
        v25 = std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v24 + 6, (unsigned int *)&v68, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(_QWORD *)buf = &v67;
        v26 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(_QWORD *)buf = &v66;
        v27 = std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v26 + 6, &v66, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        std::__memberwise_copy_assign[abi:ne180100]<std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,0ul,1ul,2ul>((char *)v27 + 40, (uint64_t)(v25 + 5));
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_86;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "addBearer";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v66;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (_DWORD)v68;
        v28 = MEMORY[0x24BDACB70];
        v29 = "::%s: Bearer %u redirected to %u\n";
        v30 = 24;
      }
      else
      {
        if (v23)
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "addBearer";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v66;
          _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Bearer %u becomes Default Bearer\n", buf, 0x12u);
        }
        *(_QWORD *)buf = &v67;
        if (*((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18) != -1)__assert_rtn("addBearer", "AppleCellularDataPlaneHelper.cpp", 657, "config_[interface].defaultBearer == kACDPHelperNoBearer");
        *(_QWORD *)buf = &v67;
        v31 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        if (*((_DWORD *)v31 + 19))
        {
          v32 = 0;
          do
          {
            v33 = *((_DWORD *)v31 + 3 * v32 + 20);
            if (v33 == 3)
            {
              v36 = v64;
              if (v64 >= v65)
              {
                v44 = (char *)v63;
                v45 = v64 - (_BYTE *)v63;
                if (v64 - (_BYTE *)v63 <= -3)
                  std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
                v46 = v45 >> 1;
                if (v65 - (_BYTE *)v63 <= (unint64_t)((v45 >> 1) + 1))
                  v47 = v46 + 1;
                else
                  v47 = v65 - (_BYTE *)v63;
                if ((unint64_t)(v65 - (_BYTE *)v63) >= 0x7FFFFFFFFFFFFFFELL)
                  v48 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v48 = v47;
                if (v48)
                {
                  v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v65, v48);
                  v44 = (char *)v63;
                  v36 = v64;
                }
                else
                {
                  v49 = 0;
                }
                v52 = &v49[2 * v46];
                *(_WORD *)v52 = v32;
                v37 = v52 + 2;
                while (v36 != v44)
                {
                  v53 = *((_WORD *)v36 - 1);
                  v36 -= 2;
                  *((_WORD *)v52 - 1) = v53;
                  v52 -= 2;
                }
                v63 = v52;
                v64 = v37;
                v65 = &v49[2 * v48];
                if (v44)
                  operator delete(v44);
              }
              else
              {
                *(_WORD *)v64 = v32;
                v37 = v36 + 2;
              }
              v64 = v37;
            }
            else if (!v33)
            {
              v34 = v61;
              if (v61 >= v62)
              {
                v38 = (char *)__p;
                v39 = v61 - (_BYTE *)__p;
                if (v61 - (_BYTE *)__p <= -3)
                  std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
                v40 = v39 >> 1;
                if (v62 - (_BYTE *)__p <= (unint64_t)((v39 >> 1) + 1))
                  v41 = v40 + 1;
                else
                  v41 = v62 - (_BYTE *)__p;
                if ((unint64_t)(v62 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
                  v42 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v42 = v41;
                if (v42)
                {
                  v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v62, v42);
                  v38 = (char *)__p;
                  v34 = v61;
                }
                else
                {
                  v43 = 0;
                }
                v50 = &v43[2 * v40];
                *(_WORD *)v50 = v32;
                v35 = v50 + 2;
                while (v34 != v38)
                {
                  v51 = *((_WORD *)v34 - 1);
                  v34 -= 2;
                  *((_WORD *)v50 - 1) = v51;
                  v50 -= 2;
                }
                __p = v50;
                v61 = v35;
                v62 = &v43[2 * v42];
                if (v38)
                  operator delete(v38);
              }
              else
              {
                *(_WORD *)v61 = v32;
                v35 = v34 + 2;
              }
              v61 = v35;
            }
            ++v32;
          }
          while (v32 < *((unsigned int *)v31 + 19));
        }
        v54 = v66;
        *(_QWORD *)buf = &v67;
        *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18) = v54;
        _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2EEEEJNS_6vectorItNS_9allocatorItEEEES6_tEEC2B8ne180100IJLm0ELm1ELm2EEJS6_S6_tEJEJEJRS6_S9_RtEEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSC_IJDpT2_EEEDpOT3_((uint64_t)buf, (uint64_t)&v63, (uint64_t)&__p, &v59);
        v68 = &v67;
        v55 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v67, (uint64_t)&std::piecewise_construct, &v68);
        v68 = &v66;
        v56 = std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v55 + 6, &v66, (uint64_t)&std::piecewise_construct, &v68);
        v57 = v56[5];
        if (v57)
        {
          v56[6] = v57;
          operator delete(v57);
          v56[5] = 0;
          v56[6] = 0;
          v56[7] = 0;
        }
        v58 = v56[8];
        *(_OWORD *)(v56 + 5) = *(_OWORD *)buf;
        v56[7] = *(uint64_t **)&buf[16];
        memset(buf, 0, sizeof(buf));
        if (v58)
        {
          v56[9] = v58;
          operator delete(v58);
          v56[8] = 0;
          v56[9] = 0;
          v56[10] = 0;
          v58 = *(uint64_t **)buf;
        }
        *((_OWORD *)v56 + 4) = v70;
        v56[10] = v71;
        v71 = 0;
        v70 = 0uLL;
        *((_WORD *)v56 + 44) = v72;
        if (v58)
        {
          *(_QWORD *)&buf[8] = v58;
          operator delete(v58);
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_86;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "addBearer";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v66;
        v28 = MEMORY[0x24BDACB70];
        v29 = "::%s: Bearer %u added\n";
        v30 = 18;
      }
      _os_log_impl(&dword_217E5F000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
LABEL_86:
      if (__p)
      {
        v61 = (char *)__p;
        operator delete(__p);
      }
      if (v63)
      {
        v64 = (char *)v63;
        operator delete(v63);
      }
      return 1;
    }
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v12)
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "addBearer";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v67;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Error: Network Interface %u not configured by ACDP-Helper.\n", buf, 0x12u);
    return 0;
  }
  return result;
}

void sub_217E62EBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

uint64_t AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v5;
  uint64_t **v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  uint64_t **v16;
  uint64_t *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned __int16 *v22;
  unsigned __int16 *v23;
  uint64_t v24;
  uint64_t **v25;
  char *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int *v29;
  uint64_t v30;
  unsigned __int16 *v31;
  unsigned __int16 *v32;
  uint64_t v33;
  uint64_t **v34;
  char *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  BOOL v42;
  unsigned int v43;
  uint64_t **v44;
  unsigned int v45;
  _BYTE buf[12];
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v45 = a2;
  *a4 = 0;
  if (a2 == -1)
    goto LABEL_48;
  if (a3 == -1)
    goto LABEL_48;
  v5 = *(_QWORD *)(a1 + 288);
  if (!v5)
    goto LABEL_48;
  v7 = (uint64_t **)(a1 + 280);
  v8 = a1 + 288;
  do
  {
    v9 = *(_DWORD *)(v5 + 32);
    v10 = v9 >= a2;
    if (v9 >= a2)
      v11 = (uint64_t *)v5;
    else
      v11 = (uint64_t *)(v5 + 8);
    if (v10)
      v8 = v5;
    v5 = *v11;
  }
  while (*v11);
  if (v8 == a1 + 288 || *(_DWORD *)(v8 + 32) > a2)
  {
LABEL_48:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "generateOutputParamsForBearerID";
      v12 = MEMORY[0x24BDACB70];
      v13 = "::%s: returning 0 pipes\n";
      v14 = 12;
LABEL_16:
      _os_log_impl(&dword_217E5F000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
    }
  }
  else
  {
    *(_QWORD *)buf = &v45;
    v16 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a1 + 280), &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
    v17 = v16[6];
    v44 = v16 + 7;
    if (v17 != (uint64_t *)(v16 + 7))
    {
      do
      {
        if (*((_DWORD *)v17 + 8) == a3)
        {
          v18 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "generateOutputParamsForBearerID";
            v47 = 1024;
            v48 = a3;
            v49 = 1024;
            LODWORD(v50) = v45;
            _os_log_impl(&dword_217E5F000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u found on Interface %u\n", buf, 0x18u);
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (v17[6] - v17[5]) >> 1;
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "generateOutputParamsForBearerID";
            v47 = 1024;
            v48 = a3;
            v49 = 2048;
            v50 = v19;
            _os_log_impl(&dword_217E5F000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u has %lu RX Pipes\n", buf, 0x1Cu);
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (v17[9] - v17[8]) >> 1;
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "generateOutputParamsForBearerID";
            v47 = 1024;
            v48 = a3;
            v49 = 2048;
            v50 = v20;
            _os_log_impl(&dword_217E5F000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u has %lu TX Pipes\n", buf, 0x1Cu);
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *((unsigned __int16 *)v17 + 44);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "generateOutputParamsForBearerID";
            v47 = 1024;
            v48 = a3;
            v49 = 1024;
            LODWORD(v50) = v21;
            _os_log_impl(&dword_217E5F000, v18, OS_LOG_TYPE_DEFAULT, "::%s: BearerID %u is using QueueSet ID %u\n", buf, 0x18u);
          }
          v23 = (unsigned __int16 *)v17[5];
          v22 = (unsigned __int16 *)v17[6];
          while (v23 != v22)
          {
            v24 = *v23;
            *(_QWORD *)buf = &v45;
            v25 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
            v24 *= 3;
            AppleCellularDataPlaneHelperInterface::printIPCPipeConfig((uint64_t)v25, (_DWORD *)v25 + v24 + 20);
            *(_QWORD *)buf = &v45;
            v26 = (char *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 4 * v24;
            v27 = *a4;
            v28 = *a4 + 1;
            *a4 = v28;
            v29 = &a4[3 * v27];
            v30 = *((_QWORD *)v26 + 10);
            v29[3] = *((_DWORD *)v26 + 22);
            *(_QWORD *)(v29 + 1) = v30;
            if (v28 >= 0x11)
              AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID();
            ++v23;
          }
          v31 = (unsigned __int16 *)v17[8];
          v32 = (unsigned __int16 *)v17[9];
          while (v31 != v32)
          {
            v33 = *v31;
            *(_QWORD *)buf = &v45;
            v34 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
            v33 *= 3;
            AppleCellularDataPlaneHelperInterface::printIPCPipeConfig((uint64_t)v34, (_DWORD *)v34 + v33 + 20);
            *(_QWORD *)buf = &v45;
            v35 = (char *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v45, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 4 * v33;
            v36 = *a4;
            v37 = *a4 + 1;
            *a4 = v37;
            v38 = &a4[3 * v36];
            v39 = *((_QWORD *)v35 + 10);
            v38[3] = *((_DWORD *)v35 + 22);
            *(_QWORD *)(v38 + 1) = v39;
            if (v37 >= 0x11)
              AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID();
            ++v31;
          }
        }
        v40 = (uint64_t *)v17[1];
        if (v40)
        {
          do
          {
            v41 = v40;
            v40 = (uint64_t *)*v40;
          }
          while (v40);
        }
        else
        {
          do
          {
            v41 = (uint64_t *)v17[2];
            v42 = *v41 == (_QWORD)v17;
            v17 = v41;
          }
          while (!v42);
        }
        v17 = v41;
      }
      while (v41 != (uint64_t *)v44);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v43 = *a4;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "generateOutputParamsForBearerID";
      v47 = 1024;
      v48 = v43;
      v12 = MEMORY[0x24BDACB70];
      v13 = "::%s: returning %u pipes\n";
      v14 = 18;
      goto LABEL_16;
    }
  }
  return 1;
}

uint64_t AppleCellularDataPlaneHelperInterface::removeBearer(AppleCellularDataPlaneHelperInterface *this, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t **v7;
  _DWORD *v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  _BOOL4 v12;
  uint64_t result;
  uint64_t **v14;
  uint64_t **v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t **v18;
  unsigned int v19;
  BOOL v20;
  uint64_t **v21;
  NSObject *v22;
  const char *v23;
  uint64_t **v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  _BYTE buf[12];
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v27 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "removeBearer";
    v29 = 1024;
    v30 = a3;
    v31 = 1024;
    v32 = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Removing Bearer 0x%x from Network Interface %u.\n", buf, 0x18u);
  }
  v6 = *((_QWORD *)this + 36);
  if (v6)
  {
    v7 = (uint64_t **)((char *)this + 280);
    v8 = (_DWORD *)((char *)this + 288);
    do
    {
      v9 = *(_DWORD *)(v6 + 32);
      v10 = v9 >= a2;
      if (v9 >= a2)
        v11 = (uint64_t *)v6;
      else
        v11 = (uint64_t *)(v6 + 8);
      if (v10)
        v8 = (_DWORD *)v6;
      v6 = *v11;
    }
    while (*v11);
    if (v8 != (_DWORD *)((char *)this + 288) && v8[8] <= a2)
    {
      *(_QWORD *)buf = &v27;
      v14 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      v17 = v14[7];
      v15 = v14 + 7;
      v16 = v17;
      if (!v17)
        goto LABEL_27;
      v18 = v15;
      do
      {
        v19 = *((_DWORD *)v16 + 8);
        v20 = v19 >= a3;
        if (v19 >= a3)
          v21 = (uint64_t **)v16;
        else
          v21 = (uint64_t **)(v16 + 1);
        if (v20)
          v18 = (uint64_t **)v16;
        v16 = *v21;
      }
      while (*v21);
      if (v18 != v15 && *((_DWORD *)v18 + 8) <= a3)
      {
        *(_QWORD *)buf = &v27;
        v24 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__erase_unique<unsigned int>((uint64_t)(v24 + 6), &v26);
        v25 = v26;
        *(_QWORD *)buf = &v27;
        if (v25 == *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18))
        {
          *(_QWORD *)buf = &v27;
          *((_DWORD *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v27, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 18) = -1;
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            return 1;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "removeBearer";
          v29 = 1024;
          v30 = v26;
          v22 = MEMORY[0x24BDACB70];
          v23 = "::%s: Default Bearer %u removed\n";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            return 1;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "removeBearer";
          v29 = 1024;
          v30 = v26;
          v22 = MEMORY[0x24BDACB70];
          v23 = "::%s: Bearer %u removed\n";
        }
      }
      else
      {
LABEL_27:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          return 1;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "removeBearer";
        v29 = 1024;
        v30 = a3;
        v22 = MEMORY[0x24BDACB70];
        v23 = "::%s: Bearer 0x%x is not configured. Returning Success.\n";
      }
      _os_log_impl(&dword_217E5F000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x12u);
      return 1;
    }
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v12)
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "removeBearer";
    v29 = 1024;
    v30 = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Error: Network Interface %u not configured by ACDP-Helper.\n", buf, 0x12u);
    return 0;
  }
  return result;
}

uint64_t ___ZN37AppleCellularDataPlaneHelperInterface18ipcInterfaceConfigERK38AppleIPAppenderIPCInterfaceInputParamsR39AppleIPAppenderIPCInterfaceOutputParams_block_invoke_2(uint64_t a1)
{
  return AppleCellularDataPlaneHelperInterface::removeInterface(*(AppleCellularDataPlaneHelperInterface **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

void AppleCellularDataPlaneHelperInterface::printIPCPipeConfig(uint64_t a1, _DWORD *a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    switch(*a2)
    {
      case 0:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315138;
          v8 = "printIPCPipeConfig";
          v3 = MEMORY[0x24BDACB70];
          v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_UL_TR\n";
          goto LABEL_11;
        }
        break;
      case 1:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315138;
          v8 = "printIPCPipeConfig";
          v3 = MEMORY[0x24BDACB70];
          v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_UL_CR\n";
          goto LABEL_11;
        }
        break;
      case 2:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315138;
          v8 = "printIPCPipeConfig";
          v3 = MEMORY[0x24BDACB70];
          v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_DL_TR\n";
          goto LABEL_11;
        }
        break;
      case 3:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315138;
          v8 = "printIPCPipeConfig";
          v3 = MEMORY[0x24BDACB70];
          v4 = "::%s: Type = kAppleIPAppenderIPCPipeType_DL_CR\n";
LABEL_11:
          _os_log_impl(&dword_217E5F000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v7, 0xCu);
        }
        break;
      default:
        break;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = a2[1];
      v7 = 136315394;
      v8 = "printIPCPipeConfig";
      v9 = 1024;
      v10 = v5;
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Priority = %u\n", (uint8_t *)&v7, 0x12u);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = a2[2];
      v7 = 136315394;
      v8 = "printIPCPipeConfig";
      v9 = 1024;
      v10 = v6;
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: ID = %u\n", (uint8_t *)&v7, 0x12u);
    }
  }
}

uint64_t std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>::~tuple(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

unsigned int **ACDPHelperSentry<AppleCellularDataPlaneHelperInterface::removeInterface(unsigned int)::$_0>::~ACDPHelperSentry(unsigned int **a1)
{
  unsigned int *v2;
  uint64_t **v3;
  _BYTE buf[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = (uint64_t **)(*a1 + 70);
  *(_QWORD *)buf = a1[1];
  if (*((_BYTE *)std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v3, *(unsigned int **)buf, (uint64_t)&std::piecewise_construct, (_DWORD **)buf)+ 40))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "operator()";
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Releasing RSS token.\n", buf, 0xCu);
    }
    *((_BYTE *)v2 + 304) = 1;
  }
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__erase_unique<unsigned int>((uint64_t)v3, a1[1]);
  return a1;
}

void sub_217E63B24(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t AppleCellularDataPlaneHelperInterface::notifyDedicatedBearer()
{
  return 0;
}

uint64_t AppleCellularDataPlaneHelperInterface::blockPDPTraffic(AppleCellularDataPlaneHelperInterface *this, unsigned int a2, char a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t **v12;
  IOACIPCBBNetCfgClass *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  unsigned int v18;
  _BYTE buf[12];
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "blockPDPTraffic";
    v20 = 1024;
    v21 = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Blocking PDP Traffic on Network Interface %u.\n", buf, 0x12u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 8));
  v6 = *((_QWORD *)this + 36);
  if (v6)
  {
    v7 = (_DWORD *)((char *)this + 288);
    do
    {
      v8 = *(_DWORD *)(v6 + 32);
      v9 = v8 >= a2;
      if (v8 >= a2)
        v10 = (uint64_t *)v6;
      else
        v10 = (uint64_t *)(v6 + 8);
      if (v9)
        v7 = (_DWORD *)v6;
      v6 = *v10;
    }
    while (*v10);
    if (v7 != (_DWORD *)((char *)this + 288) && v7[8] <= a2)
    {
      *(_QWORD *)buf = &v18;
      v12 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 35, &v18, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      v11 = AppleCellularDataPlaneHelperInterface::connect(this, *((unsigned __int16 *)v12 + 21));
      if ((v11 & 1) != 0)
      {
        v13 = (AppleCellularDataPlaneHelperInterface *)((char *)this + 312);
        if ((a3 & 1) != 0)
        {
          IOACIPCBBNetCfgClass::stopNetIfTx(v13);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "blockPDPTraffic";
            v20 = 1024;
            v21 = v18;
            v14 = MEMORY[0x24BDACB70];
            v15 = "::%s: Network Interface %u blocked\n";
LABEL_24:
            v16 = 18;
            goto LABEL_25;
          }
        }
        else
        {
          IOACIPCBBNetCfgClass::startNetIfTx(v13);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "blockPDPTraffic";
            v20 = 1024;
            v21 = v18;
            v14 = MEMORY[0x24BDACB70];
            v15 = "::%s: Network Interface %u resumed\n";
            goto LABEL_24;
          }
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "blockPDPTraffic";
        v14 = MEMORY[0x24BDACB70];
        v15 = "::%s: ERROR: Failed to connect to ACDP-Driver. Device Reset needed\n";
        v16 = 12;
LABEL_25:
        _os_log_impl(&dword_217E5F000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
      }
      IOACIPCBBNetCfgClass::stop((AppleCellularDataPlaneHelperInterface *)((char *)this + 312));
      goto LABEL_27;
    }
  }
  v11 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "blockPDPTraffic";
    v20 = 1024;
    v21 = a2;
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: Error: Network Interface %u not configured by ACDP-Helper.\n", buf, 0x12u);
    v11 = 0;
  }
LABEL_27:
  std::mutex::unlock((std::mutex *)((char *)this + 8));
  return v11;
}

void sub_217E63E34(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void handleInterfaceChange(const __SCDynamicStore *a1, const __CFArray *a2, char *a3)
{
  std::mutex *v5;
  const char *v6;
  _BOOL4 v7;
  int v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = (std::mutex *)(a3 + 48);
    std::mutex::lock((std::mutex *)(a3 + 48));
    *((_WORD *)a3 + 62) = 0;
    v6 = (const char *)*((_QWORD *)a3 + 14);
    if (!v6)
      goto LABEL_17;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "handleInterfaceChange";
      v14 = 2080;
      v15 = v6;
      _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: checking for %s", (uint8_t *)&v12, 0x16u);
      v6 = (const char *)*((_QWORD *)a3 + 14);
    }
    v7 = checkSCStoreForIfNet(a1, v6);
    a3[125] = v7;
    v8 = *((_DWORD *)a3 + 30);
    v9 = !v8 && v7;
    v10 = v8 != 1 || v7;
    if (v9 || !v10)
    {
      a3[124] = 1;
      std::mutex::unlock(v5);
      std::condition_variable::notify_all((std::condition_variable *)a3);
    }
    else
    {
LABEL_17:
      std::mutex::unlock(v5);
    }
  }
}

BOOL AppleCellularDataPlaneHelperInterface::checkForDevicePresence(SCDynamicStoreRef *this, const char *a2, int a3)
{
  _BOOL8 result;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (!result)
      return result;
    v9 = 136315138;
    v10 = "checkForDevicePresence";
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: invalid interface name", (uint8_t *)&v9, 0xCu);
    return 0;
  }
  if (a3)
  {
    if (!result)
      goto LABEL_10;
    v9 = 136315394;
    v10 = "checkForDevicePresence";
    v11 = 2080;
    v12 = a2;
    v7 = MEMORY[0x24BDACB70];
    v8 = "::%s: Check for interface presence (%s)";
  }
  else
  {
    if (!result)
      goto LABEL_10;
    v9 = 136315394;
    v10 = "checkForDevicePresence";
    v11 = 2080;
    v12 = a2;
    v7 = MEMORY[0x24BDACB70];
    v8 = "::%s: Check for interface absence (%s)";
  }
  _os_log_impl(&dword_217E5F000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
LABEL_10:
  if (checkSCStoreForIfNet(this[18], a2) != a3)
    return 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "checkForDevicePresence";
    _os_log_impl(&dword_217E5F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "::%s: condition already met", (uint8_t *)&v9, 0xCu);
  }
  return 1;
}

BOOL checkSCStoreForIfNet(SCDynamicStoreRef store, const char *a2)
{
  const __CFString *NetworkInterface;
  const __CFDictionary *v5;
  CFTypeID TypeID;
  const __CFArray *Value;
  CFTypeID v8;
  CFIndex Count;
  CFIndex v10;
  BOOL v11;
  const __CFString *ValueAtIndex;
  const __CFString *theString2;
  CFDictionaryRef *p_theDict;
  CFDictionaryRef theDict;

  NetworkInterface = (const __CFString *)getNetworkInterfaceKey(void)::key;
  if (!getNetworkInterfaceKey(void)::key)
  {
    NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, (CFStringRef)*MEMORY[0x24BDF59B0]);
    getNetworkInterfaceKey(void)::key = (uint64_t)NetworkInterface;
  }
  v5 = (const __CFDictionary *)SCDynamicStoreCopyValue(store, NetworkInterface);
  p_theDict = &theDict;
  theDict = v5;
  TypeID = CFDictionaryGetTypeID();
  if (v5
    && CFGetTypeID(v5) == TypeID
    && (Value = (const __CFArray *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BDF5B48]),
        v8 = CFArrayGetTypeID(),
        Value)
    && CFGetTypeID(Value) == v8
    && (theString2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x600u)) != 0)
  {
    Count = CFArrayGetCount(Value);
    if (Count < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 1;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Value, v10);
        if (CFStringCompare(ValueAtIndex, theString2, 0) == kCFCompareEqualTo)
          break;
        v11 = ++v10 < Count;
      }
      while (Count != v10);
    }
    CFRelease(theString2);
  }
  else
  {
    v11 = 0;
  }
  ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_0>::~ACDPHelperSentry((const void ***)&p_theDict);
  return v11;
}

void sub_217E642BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CFTypeRef *a9, uint64_t a10, const void **a11)
{
  ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_1>::~ACDPHelperSentry(&a9);
  ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_0>::~ACDPHelperSentry(&a11);
  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D915A90, MEMORY[0x24BEDAAF0]);
}

void sub_217E643EC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(a2 + 4);
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
}

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

char *std::__memberwise_copy_assign[abi:ne180100]<std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>,0ul,1ul,2ul>(char *result, uint64_t a2)
{
  char *v3;

  v3 = result;
  if (result != (char *)a2)
  {
    std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>(result, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 1);
    result = std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>(v3 + 24, *(char **)(a2 + 24), *(_QWORD *)(a2 + 32), (uint64_t)(*(_QWORD *)(a2 + 32) - *(_QWORD *)(a2 + 24)) >> 1);
  }
  *((_WORD *)v3 + 24) = *(_WORD *)(a2 + 48);
  return result;
}

char *std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short *,unsigned short *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(_QWORD *)result) >> 1)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0)
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    if (v8 <= a4)
      v10 = a4;
    else
      v10 = v8;
    if (v8 >= 0x7FFFFFFFFFFFFFFELL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<unsigned short>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_17:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 1;
  if (v15 >= a4)
    goto LABEL_17;
  v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_19:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_20:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<unsigned short>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

uint64_t _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2EEEEJNS_6vectorItNS_9allocatorItEEEES6_tEEC2B8ne180100IJLm0ELm1ELm2EEJS6_S6_tEJEJEJRS6_S9_RtEEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSC_IJDpT2_EEEDpOT3_(uint64_t a1, uint64_t a2, uint64_t a3, _WORD *a4)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((_QWORD *)a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 1);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((_QWORD *)(a1 + 24), *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 1);
  *(_WORD *)(a1 + 48) = *a4;
  return a1;
}

void sub_217E64720(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(_QWORD *result, const void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned short>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_217E64798(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

CFTypeRef **ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_1>::~ACDPHelperSentry(CFTypeRef **a1)
{
  CFRelease(**a1);
  return a1;
}

const void ***ACDPHelperSentry<checkSCStoreForIfNet(__SCDynamicStore const*,char const*)::$_0>::~ACDPHelperSentry(const void ***a1)
{
  const void *v2;

  v2 = **a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::destroy(a1, a2[1]);
    std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy((uint64_t)(a2 + 6), (_QWORD *)a2[7]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  char *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (char *)operator new(0x110uLL);
    *((_DWORD *)v11 + 8) = **a4;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *((_QWORD *)v11 + 33) = 0;
    *(_OWORD *)(v11 + 248) = 0u;
    *(_OWORD *)(v11 + 232) = 0u;
    *(_OWORD *)(v11 + 216) = 0u;
    *(_OWORD *)(v11 + 200) = 0u;
    *(_OWORD *)(v11 + 184) = 0u;
    *(_OWORD *)(v11 + 168) = 0u;
    *(_OWORD *)(v11 + 152) = 0u;
    *(_OWORD *)(v11 + 136) = 0u;
    *(_OWORD *)(v11 + 120) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *((_QWORD *)v11 + 6) = v11 + 56;
    *((_DWORD *)v11 + 18) = -1;
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__erase_unique<unsigned int>(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32))
    return 0;
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::erase((uint64_t **)a1, v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::erase(uint64_t **a1, uint64_t a2)
{
  uint64_t *v3;

  v3 = std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__remove_node_pointer(a1, (uint64_t *)a2);
  std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::destroy(a2 + 48, *(_QWORD **)(a2 + 56));
  operator delete((void *)a2);
  return v3;
}

uint64_t *std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t **v9;
  unsigned int v10;
  unsigned int v11;
  char *v12;
  _QWORD v14[2];
  char v15;

  v7 = a1 + 1;
  v6 = a1[1];
  v8 = a1 + 1;
  v9 = a1 + 1;
  if (v6)
  {
    v10 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11)
          break;
        v6 = *v9;
        v8 = v9;
        if (!*v9)
          goto LABEL_9;
      }
      if (v11 >= v10)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = (char *)operator new(0x60uLL);
    v14[1] = v7;
    *((_DWORD *)v12 + 8) = **a4;
    *((_WORD *)v12 + 44) = 0;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    v15 = 1;
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(v2 + 4);
    operator delete(v2);
  }
}

uint64_t std::__tree<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>>>::__erase_unique<unsigned int>(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t *v4;
  unsigned int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (v6)
      v4 = (uint64_t *)v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < *((_DWORD *)v4 + 8))
    return 0;
  std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__remove_node_pointer((uint64_t **)a1, v4);
  std::__destroy_at[abi:ne180100]<std::pair<unsigned int const,std::tuple<std::vector<unsigned short>,std::vector<unsigned short>,unsigned short>>,0>(v4 + 4);
  operator delete(v4);
  return 1;
}

void ApplePDPHelperInterface::ApplePDPHelperInterface(ApplePDPHelperInterface *this)
{
  *(_QWORD *)this = &off_24D915C70;
  *((_QWORD *)this + 1) = 850045863;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 19) = 0;
  *((_DWORD *)this + 20) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = (char *)this + 104;
  *((_QWORD *)this + 14) = (char *)this + 104;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
}

{
  *(_QWORD *)this = &off_24D915C70;
  *((_QWORD *)this + 1) = 850045863;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 19) = 0;
  *((_DWORD *)this + 20) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = (char *)this + 104;
  *((_QWORD *)this + 14) = (char *)this + 104;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
}

void ApplePDPHelperInterface::~ApplePDPHelperInterface(ApplePDPHelperInterface *this)
{
  std::mutex *v2;

  *(_QWORD *)this = &off_24D915C70;
  v2 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  ApplePDPHelperInterface::cleanup_nl(this);
  std::mutex::unlock(v2);
  std::__list_imp<__CFRunLoop *>::clear((_QWORD *)this + 13);
  std::mutex::~mutex(v2);
}

{
  ApplePDPHelperInterface::~ApplePDPHelperInterface(this);
  JUMPOUT(0x219A18D40);
}

uint64_t ApplePDPHelperInterface::cleanup_nl(ApplePDPHelperInterface *this)
{
  char *v2;
  char *v3;
  const __CFString *v4;
  __CFRunLoop *v5;
  IONotificationPort *v6;
  io_connect_t v7;
  uint64_t result;

  if (*((_QWORD *)this + 15))
  {
    v2 = (char *)this + 104;
    v3 = (char *)*((_QWORD *)this + 14);
    if (v3 != (char *)this + 104)
    {
      v4 = (const __CFString *)*MEMORY[0x24BDBD598];
      do
      {
        v5 = (__CFRunLoop *)*((_QWORD *)v3 + 2);
        if (CFRunLoopContainsSource(v5, *((CFRunLoopSourceRef *)this + 12), v4))
          CFRunLoopRemoveSource(v5, *((CFRunLoopSourceRef *)this + 12), v4);
        CFRelease(v5);
        v3 = (char *)*((_QWORD *)v3 + 1);
      }
      while (v3 != v2);
    }
    std::__list_imp<__CFRunLoop *>::clear((_QWORD *)this + 13);
  }
  v6 = (IONotificationPort *)*((_QWORD *)this + 16);
  if (v6)
  {
    IONotificationPortDestroy(v6);
    *((_QWORD *)this + 16) = 0;
  }
  v7 = *((_DWORD *)this + 20);
  if (v7)
  {
    IOServiceClose(v7);
    *((_DWORD *)this + 20) = 0;
  }
  result = *((unsigned int *)this + 19);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 19) = 0;
  }
  return result;
}

uint64_t ApplePDPHelperInterface::init(ApplePDPHelperInterface *this)
{
  std::mutex *v2;
  const __CFDictionary *v3;
  mach_port_t v4;
  io_service_t MatchingService;
  IONotificationPort *v6;
  uint64_t v7;
  kern_return_t v9;
  io_object_t notification;

  v2 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  v3 = IOServiceMatching("AppleIPAppender");
  v4 = *MEMORY[0x24BDD8B18];
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v3);
  *((_DWORD *)this + 19) = MatchingService;
  if (MatchingService)
  {
    LODWORD(v6) = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)this + 20);
    if ((_DWORD)v6 || (v6 = IONotificationPortCreate(v4), (*((_QWORD *)this + 16) = v6) == 0))
    {
      syslog(3, "Could not open service (0x%x)\n", (_DWORD)v6);
    }
    else
    {
      notification = 0;
      v9 = IOServiceAddInterestNotification(v6, *((_DWORD *)this + 19), "IOGeneralInterest", (IOServiceInterestCallback)ApplePDPHelperInterface::callback, this, &notification);
      *((_QWORD *)this + 12) = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)this + 16));
      if (!v9)
      {
        v7 = 1;
        goto LABEL_6;
      }
    }
  }
  else
  {
    syslog(3, "Could not find %s service\n", "AppleIPAppender");
  }
  ApplePDPHelperInterface::cleanup_nl(this);
  v7 = 0;
LABEL_6:
  std::mutex::unlock(v2);
  return v7;
}

void sub_217E65490(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callback(ApplePDPHelperInterface *this, void *a2, int a3, uint64_t a4, void *a5)
{
  uint64_t result;

  result = *((_QWORD *)this + 11);
  if (result)
  {
    if (a3 == -469794559)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)result + 24))(result, a4);
    }
    else if (a3 == -469794560)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)result + 16))(result, a4);
    }
  }
  return result;
}

uint64_t ApplePDPHelperInterface::getInstance(ApplePDPHelperInterface *this)
{
  if (ApplePDPHelperInterface::getInstance(void)::onceToken != -1)
    dispatch_once(&ApplePDPHelperInterface::getInstance(void)::onceToken, &__block_literal_global);
  return ApplePDPHelperInterface::getInstance(void)::sInstance;
}

uint64_t ___ZN23ApplePDPHelperInterface11getInstanceEv_block_invoke(ApplePDPHelperInterface *a1)
{
  uint64_t result;

  result = ApplePDPHelperInterface::create(a1);
  ApplePDPHelperInterface::getInstance(void)::sInstance = result;
  return result;
}

uint64_t ApplePDPHelperInterface::create(ApplePDPHelperInterface *this)
{
  uint64_t v1;

  if (ApplePDPHelperInterface::probeVariant(void)::sOnce != -1)
    dispatch_once(&ApplePDPHelperInterface::probeVariant(void)::sOnce, &__block_literal_global_55);
  if (ApplePDPHelperInterface::probeVariant(void)::ret == 1)
  {
    v1 = operator new();
    AppleCellularDataPlaneHelperInterface::AppleCellularDataPlaneHelperInterface((AppleCellularDataPlaneHelperInterface *)v1);
  }
  else
  {
    v1 = operator new();
    *(_QWORD *)v1 = &off_24D915C70;
    *(_QWORD *)(v1 + 8) = 850045863;
    *(_OWORD *)(v1 + 16) = 0u;
    *(_OWORD *)(v1 + 32) = 0u;
    *(_OWORD *)(v1 + 48) = 0u;
    *(_QWORD *)(v1 + 64) = 0;
    *(_DWORD *)(v1 + 76) = 0;
    *(_DWORD *)(v1 + 80) = 0;
    *(_QWORD *)(v1 + 88) = 0;
    *(_QWORD *)(v1 + 96) = 0;
    *(_QWORD *)(v1 + 104) = v1 + 104;
    *(_QWORD *)(v1 + 112) = v1 + 104;
    *(_QWORD *)(v1 + 120) = 0;
    *(_QWORD *)(v1 + 128) = 0;
  }
  if ((ApplePDPHelperInterface::init((ApplePDPHelperInterface *)v1) & 1) == 0)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
    return 0;
  }
  return v1;
}

void sub_217E6563C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A18D40](v1, 0x10F1C408AAB908CLL);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, unint64_t *a4, uint32_t a5, void *a6, size_t a7, unint64_t *a8, uint32_t *outputCnt, void *outputStruct, unint64_t *a11)
{
  std::mutex *v19;
  mach_port_t v20;
  kern_return_t v21;
  uint64_t v22;

  v19 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  v20 = *((_DWORD *)this + 20);
  if (v20)
  {
    v21 = IOConnectCallMethod(v20, a2, a4, a5, a6, a7, a8, outputCnt, outputStruct, a11);
    if (!v21)
    {
      v22 = 1;
      goto LABEL_7;
    }
    syslog(3, "ApplePDPHelper: Performing '%s' failed: %d (0x%x)\n", a3, v21, v21);
  }
  else
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
  }
  v22 = 0;
LABEL_7:
  std::mutex::unlock(v19);
  return v22;
}

void sub_217E65744(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callScalarMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, unint64_t *a4, uint32_t a5, unint64_t *a6, unsigned int *a7)
{
  std::mutex *v14;
  mach_port_t v15;
  kern_return_t v16;
  uint64_t v17;

  v14 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  v15 = *((_DWORD *)this + 20);
  if (v15)
  {
    v16 = IOConnectCallScalarMethod(v15, a2, a4, a5, a6, a7);
    if (!v16)
    {
      v17 = 1;
      goto LABEL_7;
    }
    syslog(3, "ApplePDPHelper: Performing '%s' failed: 0x%x\n", a3, v16);
  }
  else
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
  }
  v17 = 0;
LABEL_7:
  std::mutex::unlock(v14);
  return v17;
}

void sub_217E65820(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::callStructMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, void *a4, unsigned int a5, void *a6, unsigned int *a7)
{
  std::mutex *v14;
  mach_port_t v15;
  kern_return_t v16;
  uint64_t v17;
  size_t outputStructCnt;

  v14 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  v15 = *((_DWORD *)this + 20);
  if (v15)
  {
    if (a7)
    {
      outputStructCnt = *a7;
      v16 = IOConnectCallStructMethod(v15, a2, a4, a5, a6, &outputStructCnt);
      *a7 = outputStructCnt;
    }
    else
    {
      v16 = IOConnectCallStructMethod(v15, a2, a4, a5, a6, 0);
    }
    if (!v16)
    {
      v17 = 1;
      goto LABEL_10;
    }
    syslog(3, "ApplePDPHelper: Performing '%s' failed: 0x%x\n", a3, v16);
  }
  else
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
  }
  v17 = 0;
LABEL_10:
  std::mutex::unlock(v14);
  return v17;
}

void sub_217E6592C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL ApplePDPHelperInterface::callAsyncScalarMethod(ApplePDPHelperInterface *this, uint32_t a2, const char *a3, uint64_t a4, unint64_t a5, unint64_t *a6, uint32_t a7, unint64_t *a8, uint32_t *outputCnt)
{
  std::mutex *v17;
  mach_port_t v18;
  IONotificationPort *v19;
  mach_port_t MachPort;
  kern_return_t v21;
  _BOOL8 v22;
  uint64_t reference[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v17 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  v18 = *((_DWORD *)this + 20);
  if (!v18)
  {
    syslog(3, "ApplePDPHelper: service is not open\n");
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  v19 = (IONotificationPort *)*((_QWORD *)this + 16);
  if (!v19)
  {
    syslog(3, "ApplePDPHelper: IONotification port is NULL\n");
    goto LABEL_7;
  }
  reference[0] = 0;
  v26 = 0u;
  v27 = 0u;
  reference[1] = a4;
  v25 = a5;
  MachPort = IONotificationPortGetMachPort(v19);
  v21 = IOConnectCallAsyncScalarMethod(v18, a2, MachPort, reference, 3u, a6, a7, a8, outputCnt);
  v22 = v21 == 0;
  if (v21)
    syslog(3, "ApplePDPHelper: Performing '%s' failed: 0x%x\n", a3, v21);
LABEL_8:
  std::mutex::unlock(v17);
  return v22;
}

void sub_217E65A80(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ApplePDPHelperInterface::enable(ApplePDPHelperInterface *this, unsigned int a2, BOOL *a3)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;

  v7 = 1;
  v5 = a2;
  v6 = 0;
  result = ApplePDPHelperInterface::callScalarMethod(this, 3u, "Enable QoS header prepend", &v5, 1u, &v6, &v7);
  if (a3)
  {
    if ((_DWORD)result)
      *a3 = (_DWORD)v6 != 0;
  }
  return result;
}

uint64_t ApplePDPHelperInterface::addFlow(ApplePDPHelperInterface *a1, int a2, int a3)
{
  _DWORD v4[2];

  v4[0] = a2;
  v4[1] = a3;
  return ApplePDPHelperInterface::callStructMethod(a1, 0, "Add Traffic class to flow Id mapping", v4, 8u, 0, 0);
}

uint64_t ApplePDPHelperInterface::removeFlow(ApplePDPHelperInterface *a1, unsigned int a2)
{
  unint64_t v3;

  v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(a1, 1u, "Remove flow Id mapping from traffic class", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getFlow(ApplePDPHelperInterface *a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;

  v7 = 1;
  v5 = a2;
  if (!a3)
    return 0;
  v6 = 0;
  result = ApplePDPHelperInterface::callScalarMethod(a1, 2u, "Get flow Id mapping for traffic class", &v5, 1u, &v6, &v7);
  if ((_DWORD)result)
  {
    *a3 = v6;
    return 1;
  }
  return result;
}

uint64_t ApplePDPHelperInterface::enableMetadataTrailer(ApplePDPHelperInterface *this, unsigned int a2, BOOL *a3)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;

  v7 = 1;
  v5 = a2;
  v6 = 0;
  result = ApplePDPHelperInterface::callScalarMethod(this, 0x11u, "Enable metadata trailer append", &v5, 1u, &v6, &v7);
  if (a3)
  {
    if ((_DWORD)result)
      *a3 = (_DWORD)v6 != 0;
  }
  return result;
}

uint64_t ApplePDPHelperInterface::setDormancyInterval(ApplePDPHelperInterface *this, int a2, int a3)
{
  _DWORD v4[2];

  v4[0] = a2;
  v4[1] = a3;
  return ApplePDPHelperInterface::callStructMethod(this, 4u, "Set dormancy", v4, 8u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getDormancyTime(ApplePDPHelperInterface *this, unsigned int *a2)
{
  uint64_t result;
  unint64_t v4;
  unsigned int v5;

  v5 = 1;
  v4 = 0;
  result = ApplePDPHelperInterface::callScalarMethod(this, 5u, "Get dormancy time", 0, 0, &v4, &v5);
  if ((_DWORD)result)
    *a2 = v4;
  return result;
}

uint64_t ApplePDPHelperInterface::getTimeAdjustment(ApplePDPHelperInterface *this, mach_timespec *a2)
{
  unsigned int v3;

  v3 = 8;
  return ApplePDPHelperInterface::callStructMethod(this, 6u, "Get Sleep time adjustment", 0, 0, a2, &v3);
}

uint64_t ApplePDPHelperInterface::getStatus(ApplePDPHelperInterface *a1, void *a2)
{
  unsigned int v3;

  v3 = 184;
  return ApplePDPHelperInterface::callStructMethod(a1, 7u, "Get status", 0, 0, a2, &v3);
}

uint64_t ApplePDPHelperInterface::setLinkQualityMetric(ApplePDPHelperInterface *this, int a2)
{
  unint64_t v3;

  v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(this, 8u, "Set Link Quality metric for network interfaces", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::reportLinkThroughput(ApplePDPHelperInterface *a1, void *a2)
{
  if (a2)
    return ApplePDPHelperInterface::callStructMethod(a1, 0xBu, "Report throughput for network interfaces", a2, 0x20u, 0, 0);
  else
    return 0;
}

uint64_t ApplePDPHelperInterface::restartDormancyCheck(ApplePDPHelperInterface *this)
{
  return ApplePDPHelperInterface::callStructMethod(this, 9u, "Restart dormancy check", 0, 0, 0, 0);
}

uint64_t ApplePDPHelperInterface::copyWakeBuffer(ApplePDPHelperInterface *this, unsigned __int8 *a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v6;
  uint32_t outputCnt;

  outputCnt = 1;
  v6 = a3;
  *a4 = a3;
  return ApplePDPHelperInterface::callMethod(this, 0xAu, "Copy wake buffer", &v6, 1u, 0, 0, a5, &outputCnt, a2, a4);
}

uint64_t ApplePDPHelperInterface::fillupPortLists(ApplePDPHelperInterface *this, unsigned __int16 *a2, unsigned int a3, const unsigned __int8 *a4, unint64_t a5, unsigned int *a6, __int16 a7)
{
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned __int16 v11;
  uint64_t v12;

  if (!a5)
    return 1;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    v9 = a4[v7];
    if (v9)
      break;
LABEL_11:
    v7 = ++v8;
    if (v8 >= a5)
      return 1;
  }
  v10 = 0;
  v11 = (a7 << 15) + 8 * v8;
  while (1)
  {
    if ((v9 & 1) == 0)
      goto LABEL_8;
    v12 = *a6;
    if (v12 >= a3)
      break;
    *a6 = v12 + 1;
    a2[v12] = v11;
LABEL_8:
    if (v9 >= 2)
    {
      v9 >>= 1;
      ++v11;
      if (v10++ < 7)
        continue;
    }
    goto LABEL_11;
  }
  syslog(3, "%s: the number of port lists (%u) is more than max number of port lists (%u)\n", "BOOL ApplePDPHelperInterface::fillupPortLists(uint16_t *, const unsigned int, const uint8_t *, const size_t, unsigned int *, const unsigned int)", *a6, a3);
  return 0;
}

uint64_t ApplePDPHelperInterface::getOpenPortsExt(ApplePDPHelperInterface *this, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, unint64_t *a6)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int16 *v9;
  unsigned int v10;
  _QWORD *v11;
  _QWORD *v12;
  unsigned int v13;
  unsigned __int16 *v15;
  ApplePDPHelperInterface *v16;
  unint64_t v17;
  char i;
  char v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unsigned __int8 v23[4096];
  unint64_t v24[5];

  v6 = MEMORY[0x24BDAC7A8](this, a2, a3, a4, a5, a6);
  v24[3] = *MEMORY[0x24BDAC8D0];
  if (v9 && (v12 = v11) != 0)
  {
    v13 = v10;
    *v11 = 0;
    if (v10 <= 0x10000)
    {
      v15 = v9;
      v16 = (ApplePDPHelperInterface *)v6;
      v17 = 0;
      v24[0] = v7;
      v24[1] = v8;
      v22 = 4096;
      v21 = 0;
      *v11 = 0;
      for (i = 1; ; i = 0)
      {
        v19 = i;
        bzero(v23, 0x1000uLL);
        v24[2] = v17;
        v20 = ApplePDPHelperInterface::callMethod(v16, 0xCu, "Get open ports (Extension)", v24, 3u, 0, 0, 0, 0, v23, &v22);
        if ((v20 & 1) == 0)
          break;
        if ((ApplePDPHelperInterface::fillupPortLists((ApplePDPHelperInterface *)v20, v15, v13, v23, 0x1000uLL, &v21, v17) & 1) == 0)return 0;
        v17 = 1;
        if ((v19 & 1) == 0)
        {
          *v12 = 2 * v21;
          return 1;
        }
      }
      syslog(3, "%s: Failed on getting raw bit buffer.\n");
    }
    else
    {
      syslog(3, "%s: Max number of port lists (%u) cannot be exceeded more than %u\n");
    }
  }
  else
  {
    syslog(3, "%s: portLists/copiedBytes should not be NULL\n");
  }
  return 0;
}

uint64_t ApplePDPHelperInterface::enableLowPowerPDPThrottle(ApplePDPHelperInterface *this, unsigned int a2)
{
  unint64_t v3;

  v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(this, 0xDu, "Enable LowPower PDP throttle feature", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::activateLowPowerPDPThrottle(ApplePDPHelperInterface *this, unsigned int a2)
{
  unint64_t v3;

  v3 = a2;
  return ApplePDPHelperInterface::callScalarMethod(this, 0xEu, "Activate LowPower PDP throttle feature", &v3, 1u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getNumLowPowerPDPThrottleStats(ApplePDPHelperInterface *a1, void *a2)
{
  unsigned int v3;

  v3 = 12;
  return ApplePDPHelperInterface::callStructMethod(a1, 0xFu, "Get Low power PDP throttle stats", 0, 0, a2, &v3);
}

uint64_t ApplePDPHelperInterface::blockPDPTraffic(ApplePDPHelperInterface *this, unsigned int a2, unsigned int a3)
{
  unint64_t v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = a2;
  v4[1] = a3;
  return ApplePDPHelperInterface::callScalarMethod(this, 0x10u, "Block PDP traffic", v4, 2u, 0, 0);
}

uint64_t ApplePDPHelperInterface::getKeepaliveOffloadFrames(ApplePDPHelperInterface *a1, unsigned int a2, void *a3, _DWORD *a4)
{
  uint64_t v4;
  int v6;
  unint64_t v8;
  unint64_t v9[2];

  v4 = 0;
  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a4)
    {
      v4 = *a4;
      if ((_DWORD)v4)
      {
        v8 = 132 * v4;
        v9[0] = a2;
        *a4 = 0;
        v6 = ApplePDPHelperInterface::callMethod(a1, 0x12u, "Get Keepalive Offload Frames", v9, 1u, 0, 0, 0, 0, a3, &v8);
        v4 = 0;
        if (v6)
        {
          if (v8 % 0x84)
          {
            syslog(3, "%s: Returned size %zu is not a multiple of frame size %lu\n", "BOOL ApplePDPHelperInterface::getKeepaliveOffloadFrames(unsigned int, AppleIPAppenderKeepaliveOffloadFrame_t *, unsigned int *)", v8, 132);
            return 0;
          }
          else
          {
            *a4 = v8 / 0x84;
            return 1;
          }
        }
      }
    }
  }
  return v4;
}

unint64_t ApplePDPHelperInterface::registerFilterRuleCallBack(ApplePDPHelperInterface *a1, const void *a2, const void *a3)
{
  unint64_t v3;
  uint32_t v7;
  unint64_t v8[3];

  v3 = (unint64_t)a2;
  v8[2] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    syslog(6, "client callback: %p, context: %p\n", a2, a3);
    v8[0] = v3;
    v8[1] = (unint64_t)a3;
    v7 = 0;
    v3 = ApplePDPHelperInterface::callAsyncScalarMethod(a1, 0x14u, "register filter rule callback", (uint64_t)ApplePDPHelperInterface::filterRuleNotification, v3, v8, 2u, 0, &v7);
    if ((v3 & 1) == 0)
      syslog(3, "Filter rule callback registration failed\n");
  }
  else
  {
    syslog(3, "filter rule callback is NULL\n");
  }
  return v3;
}

void ApplePDPHelperInterface::filterRuleNotification(ApplePDPHelperInterface *this, void *a2, const void *a3, void *a4, void *a5)
{
  NSObject *v8;
  _QWORD block[7];

  if ((_DWORD)a2)
  {
    syslog(3, "Error - FilterRule notification, result: 0x%08x\n", a3, a4, a5);
  }
  else
  {
    syslog(6, "refCon: %p, frInfo: %p, context: %p\n", this, a3, a4);
    if (this)
    {
      v8 = dispatch_queue_create("filter rule queue", 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___ZN23ApplePDPHelperInterface22filterRuleNotificationEPviS0_S0__block_invoke;
      block[3] = &__block_descriptor_tmp_42;
      block[4] = this;
      block[5] = a3;
      block[6] = a4;
      dispatch_sync(v8, block);
      dispatch_release(v8);
    }
    else
    {
      syslog(3, "NULL client callback reference\n");
    }
  }
}

void ___ZN23ApplePDPHelperInterface22filterRuleNotificationEPviS0_S0__block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    syslog(3, "NULL filter rule info\n");
}

uint64_t ApplePDPHelperInterface::notifyDedicatedBearer(ApplePDPHelperInterface *a1, unsigned __int8 *a2, void *a3)
{
  uint64_t v4;
  unsigned int v6;

  if (!a2)
  {
    syslog(3, "NULL Input args\n");
    return 0;
  }
  if (!a3)
  {
    syslog(3, "NULL Output args\n");
    return 0;
  }
  if (*((_DWORD *)a2 + 2) >= 0xFFu)
  {
    syslog(3, "Invalid bearerID %u\n");
    return 0;
  }
  if (*((int *)a2 + 3) >= 3)
  {
    syslog(3, "Invalid service %u\n");
    return 0;
  }
  v6 = 16;
  v4 = ApplePDPHelperInterface::callStructMethod(a1, 0x13u, "Notify Dedicated bearer up or down", a2, 0x10u, a3, &v6);
  if ((v4 & 1) == 0)
    syslog(3, "Notification of dedicated bearer to driver failed, enable %u, interfaceID: %u, bearerID: %u, service: %u\n", *a2, *((_DWORD *)a2 + 1), *((_DWORD *)a2 + 2), *((_DWORD *)a2 + 3));
  return v4;
}

uint64_t ApplePDPHelperInterface::ipcContextConfig()
{
  return 0;
}

uint64_t ApplePDPHelperInterface::ipcConfigSet()
{
  return 1;
}

uint64_t ApplePDPHelperInterface::ipcInterfaceConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;

  if ((ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIdsInitialized & 1) == 0)
  {
    *(_QWORD *)&v3 = -1;
    *((_QWORD *)&v3 + 1) = -1;
    xmmword_254F2D168 = v3;
    unk_254F2D178 = v3;
    ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds = v3;
    unk_254F2D158 = v3;
    ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIdsInitialized = 1;
  }
  if (*(_BYTE *)(a2 + 24))
  {
    v4 = *(unsigned int *)(a2 + 16);
    if (*(_QWORD *)(a2 + 32))
    {
      v5 = 63;
      if (v4 <= 0xF)
      {
        if (*((_DWORD *)&ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds
             + v4) == *(_DWORD *)(a2 + 20))
          v5 = 127;
        else
          v5 = 63;
      }
    }
    else
    {
      if (v4 <= 0xF)
        *((_DWORD *)&ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds
        + v4) = *(_DWORD *)(a2 + 20);
      v5 = 255;
    }
    *(_QWORD *)a3 = 2;
    v7 = 3 * v4;
    *(_DWORD *)(a3 + 8) = v5;
    *(_DWORD *)(a3 + 12) = (2 * v7) | 1;
    *(_DWORD *)(a3 + 16) = 3;
    *(_DWORD *)(a3 + 20) = v5;
    *(_DWORD *)(a3 + 24) = 2 * v7 + 2;
  }
  else
  {
    v6 = *(unsigned int *)(a2 + 16);
    if (v6 <= 0xF)
      *((_DWORD *)&ApplePDPHelperInterface::ipcInterfaceConfig(AppleIPAppenderIPCInterfaceInputParams const&,AppleIPAppenderIPCInterfaceOutputParams &)::defaultBearerIds
      + v6) = -1;
    *(_DWORD *)a3 = 0;
  }
  return 1;
}

void ApplePDPHelperInterface::registerHandlerInternal(ApplePDPHelperInterface *this, ApplePDPHelperInterface::Handler *a2)
{
  std::mutex *v4;
  CFRunLoopRef Current;
  __CFRunLoop *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  const char *v10;
  int v11;

  v4 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  if (!*((_DWORD *)this + 19))
  {
    v10 = "fService != MACH_PORT_NULL";
    v11 = 748;
    goto LABEL_9;
  }
  if (*((_QWORD *)this + 11))
  {
    v10 = "fHandler == NULL";
    v11 = 749;
    goto LABEL_9;
  }
  if (!a2)
  {
    v10 = "handler != NULL";
    v11 = 750;
LABEL_9:
    __assert_rtn("registerHandlerInternal", "ApplePDPHelper.cpp", v11, v10);
  }
  *((_QWORD *)this + 11) = a2;
  Current = CFRunLoopGetCurrent();
  v6 = Current;
  if (!Current)
    __assert_rtn("registerHandlerInternal", "ApplePDPHelper.cpp", 755, "rl");
  CFRetain(Current);
  v7 = operator new(0x18uLL);
  v9 = *((_QWORD *)this + 13);
  v8 = (_QWORD *)((char *)this + 104);
  v7[1] = v8;
  v7[2] = v6;
  *v7 = v9;
  *(_QWORD *)(v9 + 8) = v7;
  *v8 = v7;
  ++v8[2];
  CFRunLoopAddSource(v6, (CFRunLoopSourceRef)*(v8 - 1), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  std::mutex::unlock(v4);
}

void sub_217E667E0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL ApplePDPHelperInterface::isServicePresent(ApplePDPHelperInterface *this, const char *a2)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_service_t v5;

  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching((const char *)this);
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v5 != 0;
}

uint64_t ApplePDPHelperInterface::handleFilterRuleNotification(ApplePDPHelperInterface *this, int a2, void **a3)
{
  return 0;
}

uint64_t ApplePDPHelperInterface::probeVariant(ApplePDPHelperInterface *this)
{
  if (ApplePDPHelperInterface::probeVariant(void)::sOnce != -1)
    dispatch_once(&ApplePDPHelperInterface::probeVariant(void)::sOnce, &__block_literal_global_55);
  return ApplePDPHelperInterface::probeVariant(void)::ret;
}

void ___ZN23ApplePDPHelperInterface12probeVariantEv_block_invoke()
{
  const char *v0;
  _QWORD **v1;
  _QWORD *v2;
  _QWORD **v3;
  BOOL v4;
  int v5;
  _QWORD **v6;
  _QWORD *v7[2];
  _OWORD v8[4];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8[0] = xmmword_24D915D48;
  v8[1] = *(_OWORD *)&off_24D915D58;
  v8[2] = xmmword_24D915D68;
  v8[3] = *(_OWORD *)&off_24D915D78;
  std::map<char const*,ApplePDPHelperInterface::variant>::map[abi:ne180100]((uint64_t)&v6, (unint64_t *)v8, 4);
  v1 = v6;
  if (v6 == v7)
  {
LABEL_9:
    v5 = 1;
  }
  else
  {
    while (!ApplePDPHelperInterface::isServicePresent((ApplePDPHelperInterface *)v1[4], v0))
    {
      v2 = v1[1];
      if (v2)
      {
        do
        {
          v3 = (_QWORD **)v2;
          v2 = (_QWORD *)*v2;
        }
        while (v2);
      }
      else
      {
        do
        {
          v3 = (_QWORD **)v1[2];
          v4 = *v3 == v1;
          v1 = v3;
        }
        while (!v4);
      }
      v1 = v3;
      if (v3 == v7)
        goto LABEL_9;
    }
    v5 = *((_DWORD *)v1 + 10);
  }
  ApplePDPHelperInterface::probeVariant(void)::ret = v5;
  std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy((uint64_t)&v6, v7[0]);
}

void sub_217E6697C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11)
{
  _Unwind_Resume(exception_object);
}

uint64_t ApplePDPHelperInterface::setRATConfig(uint64_t result, int a2)
{
  *(_DWORD *)(result + 72) = a2;
  return result;
}

_QWORD *std::__list_imp<__CFRunLoop *>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

uint64_t std::map<char const*,ApplePDPHelperInterface::variant>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,ApplePDPHelperInterface::variant> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 2;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_217E66A68(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,ApplePDPHelperInterface::variant> const&>(uint64_t **a1, _QWORD *a2, unint64_t *a3, _OWORD *a4)
{
  void **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t v11;

  v6 = (void **)std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__find_equal<char const*>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::__value_type<unsigned int,ACDPNetIFConfig>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,ACDPNetIFConfig>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,ACDPNetIFConfig>>>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::__find_equal<char const*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, unint64_t *a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    v8 = *a2;
    if ((_QWORD *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (_QWORD *)*a2;
      do
      {
        v10 = v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (_QWORD *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (v10[4] < *a5)
      goto LABEL_17;
    v16 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = v16;
          v18 = v16[4];
          if (v15 >= v18)
            break;
          v16 = (_QWORD *)*v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = (_QWORD *)v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (_QWORD *)a2[1];
    do
    {
      a4 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (_QWORD *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          v22 = v20[4];
          if (v6 >= v22)
            break;
          v20 = (_QWORD *)*v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = (_QWORD *)v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,ApplePDPHelperInterface::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ApplePDPHelperInterface::variant>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void AppleCellularDataPlaneHelperInterface::generateOutputParamsForBearerID()
{
  __assert_rtn("generateOutputParamsForBearerID", "AppleCellularDataPlaneHelper.cpp", 412, "outputParams.pipesNum <= kAppleIPAppenderMaxIPCPipesParamsNum");
}

{
  __assert_rtn("generateOutputParamsForBearerID", "AppleCellularDataPlaneHelper.cpp", 404, "outputParams.pipesNum <= kAppleIPAppenderMaxIPCPipesParamsNum");
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x24BDBC2E0](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7EE8](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5670](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return (CFStringRef)MEMORY[0x24BDF56A0](allocator, domain);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF56C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x24BDF56E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x24BDF56E8](*(_QWORD *)&status);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t IOACIPCBBNetCfgClass::removeNetIf(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x24BED4810](this);
}

uint64_t IOACIPCBBNetCfgClass::setLogLevel(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x24BED4818](this);
}

uint64_t IOACIPCBBNetCfgClass::stopNetIfTx(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x24BED4820](this);
}

uint64_t IOACIPCBBNetCfgClass::startNetIfTx(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x24BED4828](this);
}

uint64_t IOACIPCBBNetCfgClass::open(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x24BED4830](this);
}

uint64_t IOACIPCBBNetCfgClass::stop(IOACIPCBBNetCfgClass *this)
{
  return MEMORY[0x24BED4838](this);
}

uint64_t IOACIPCBBNetCfgClass::start(IOACIPCBBNetCfgClass *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED4840](this, a2);
}

uint64_t IOACIPCBBNetCfgClass::addNetIf()
{
  return MEMORY[0x24BED4848]();
}

void IOACIPCBBNetCfgClass::IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
  MEMORY[0x24BED4850](this);
}

void IOACIPCBBNetCfgClass::~IOACIPCBBNetCfgClass(IOACIPCBBNetCfgClass *this)
{
  MEMORY[0x24BED4858](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24D915AB0(__p);
}

uint64_t operator delete()
{
  return off_24D915AB8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D915AC0(__sz);
}

uint64_t operator new()
{
  return off_24D915AC8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

