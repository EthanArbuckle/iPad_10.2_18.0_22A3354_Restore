char *sar::toStringAccessory(sar *this)
{
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  const char *v4;
  size_t v5;
  char *result;

  v1 = this;
  bzero(sar::toStringAccessory::retStr, 0x400uLL);
  v2 = 0;
  v3 = 0;
  do
  {
    if (((v1 >> v2) & 1) != 0 && v3 <= 0x3FE)
    {
      v4 = sar::toStringAccessory::accessoryStringArray[v2];
      v5 = strlen(v4);
      memcpy(&sar::toStringAccessory::retStr[v3], v4, v5);
      v3 += strlen(v4);
    }
    ++v2;
  }
  while (v2 != 32);
  if (!v3)
    return "Unknown Accessory";
  result = sar::toStringAccessory::retStr;
  if (v3 <= 0x3FE)
    sar::toStringAccessory::retStr[v3] = 0;
  return result;
}

const char *sar::toString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown Mode";
  else
    return off_25080A688[(char)a1];
}

{
  if (a1 > 2)
    return "Unknown Region";
  else
    return off_25080A6B0[(char)a1];
}

{
  if (a1 > 4)
    return "Unknown TAS Mode";
  else
    return off_25080A6C8[(char)a1];
}

uint64_t sar::toTASMode(sar *this, const char *a2)
{
  uint64_t result;

  result = strncmp("Periodic Budget", (const char *)this, 0xFuLL);
  if ((_DWORD)result)
  {
    if (!strncmp("Default Budget", (const char *)this, 0xEuLL))
    {
      return 1;
    }
    else if (!strncmp("Limit Budget", (const char *)this, 0xCuLL))
    {
      return 2;
    }
    else if (!strncmp("Periodic Budget for Control Message", (const char *)this, 0x23uLL))
    {
      return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

_QWORD *AppleSARHelper::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  _OWORD *v3;
  _QWORD *result;

  v3 = operator new(0x30uLL);
  *v3 = 0u;
  v3[1] = 0u;
  *(_OWORD *)((char *)v3 + 28) = 0u;
  AppleSARHelper::init((io_connect_t *)v3);
  *a1 = v3;
  result = operator new(0x20uLL);
  *result = off_25080A700;
  result[1] = 0;
  result[2] = 0;
  result[3] = v3;
  a1[1] = result;
  return result;
}

void sub_236A3FA34(_Unwind_Exception *a1)
{
  AppleSARHelper *v1;
  void *v3;

  AppleSARHelper::~AppleSARHelper(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_236A3FA4C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const void *v7;

  v3 = v1[1];
  if (v3)
  {
    v4 = v1[2];
    v5 = (void *)v1[1];
    if (v4 != v3)
    {
      do
      {
        v6 = *(NSObject **)(v4 - 8);
        if (v6)
          dispatch_release(v6);
        v7 = *(const void **)(v4 - 16);
        if (v7)
          _Block_release(v7);
        v4 -= 16;
      }
      while (v4 != v3);
      v5 = (void *)v1[1];
    }
    v1[2] = v3;
    operator delete(v5);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void AppleSARHelper::AppleSARHelper(AppleSARHelper *this)
{
  *(_OWORD *)((char *)this + 28) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  AppleSARHelper::init((io_connect_t *)this);
}

{
  *(_OWORD *)((char *)this + 28) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  AppleSARHelper::init((io_connect_t *)this);
}

void sub_236A3FAEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const void *v7;

  v3 = *(_QWORD *)(v1 + 8);
  if (v3)
  {
    v4 = *(_QWORD *)(v1 + 16);
    v5 = *(void **)(v1 + 8);
    if (v4 != v3)
    {
      do
      {
        v6 = *(NSObject **)(v4 - 8);
        if (v6)
          dispatch_release(v6);
        v7 = *(const void **)(v4 - 16);
        if (v7)
          _Block_release(v7);
        v4 -= 16;
      }
      while (v4 != v3);
      v5 = *(void **)(v1 + 8);
    }
    *(_QWORD *)(v1 + 16) = v3;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void sub_236A3FB7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::~vector[abi:ne180100]((void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void AppleSARHelper::init(io_connect_t *this)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  kern_return_t v5;
  kern_return_t v6;
  unsigned __int8 v7;
  NSObject *v8;
  io_object_t v9;
  unsigned __int8 v10;
  NSObject *v11;
  const char *v12;
  unsigned __int8 v13;
  dispatch_queue_t v14;
  NSObject *v15;
  IONotificationPort *v16;
  unsigned __int8 v17;
  NSObject *v18;
  unsigned __int8 v19;
  NSObject *v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceMatching("AppleSARService");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  *this = MatchingService;
  if (!MatchingService)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v11 = qword_2564324C8;
      if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        return;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v11 = qword_2564324C8;
      if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        return;
    }
    LOWORD(v21) = 0;
    v12 = "Failed to create service!";
    goto LABEL_16;
  }
  v5 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, this + 1);
  if (!v5)
  {
    *((_QWORD *)this + 4) = 0;
    v14 = dispatch_queue_create("AppleSARHelperQueue", 0);
    if (!v14)
    {
      {
        GetOsLogContext(void)::sOsLogContext = 0;
        qword_2564324C8 = 0;
        __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
      }
      if (GetOsLogContext(void)::onceToken == -1)
      {
        v18 = qword_2564324C8;
        if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
          return;
      }
      else
      {
        dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
        v18 = qword_2564324C8;
        if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
          return;
      }
      v21 = 136315138;
      v22 = "AppleSARSPMI";
      _os_log_error_impl(&dword_236A3F000, v18, OS_LOG_TYPE_ERROR, "Failed to create a queue for the notification for %s", (uint8_t *)&v21, 0xCu);
      return;
    }
    v15 = v14;
    v16 = IONotificationPortCreate(v2);
    *((_QWORD *)this + 4) = v16;
    if (v16)
    {
      IONotificationPortSetDispatchQueue(v16, v15);
LABEL_27:
      dispatch_release(v15);
      return;
    }
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v20 = qword_2564324C8;
      if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v20 = qword_2564324C8;
      if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
    }
    v21 = 136315138;
    v22 = "AppleSARSPMI";
    _os_log_error_impl(&dword_236A3F000, v20, OS_LOG_TYPE_ERROR, "Failed to find the notification for %s", (uint8_t *)&v21, 0xCu);
    goto LABEL_27;
  }
  v6 = v5;
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2564324C8 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v8 = qword_2564324C8;
    if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
LABEL_30:
    v21 = 67109120;
    LODWORD(v22) = v6;
    _os_log_error_impl(&dword_236A3F000, v8, OS_LOG_TYPE_ERROR, "Failed to get the connection. ret: %u", (uint8_t *)&v21, 8u);
    v9 = *this;
    if (!*this)
      return;
    goto LABEL_7;
  }
  dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  v8 = qword_2564324C8;
  if (os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
    goto LABEL_30;
LABEL_6:
  v9 = *this;
  if (!*this)
    return;
LABEL_7:
  if (IOObjectRelease(v9))
  {
    if ((v10 & 1) == 0)
    {
      {
        GetOsLogContext(void)::sOsLogContext = 0;
        qword_2564324C8 = 0;
        __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
      }
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v11 = qword_2564324C8;
      if (os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        LOWORD(v21) = 0;
        v12 = "Failed to relase the service!";
LABEL_16:
        _os_log_error_impl(&dword_236A3F000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v11 = qword_2564324C8;
      if (os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
  }
}

void sub_236A400BC(_Unwind_Exception *a1)
{
  NSObject *v1;

  dispatch_release(v1);
  _Unwind_Resume(a1);
}

void **std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::~vector[abi:ne180100](void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  NSObject *v5;
  const void *v6;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = *((_QWORD *)v3 - 1);
        if (v5)
          dispatch_release(v5);
        v6 = (const void *)*((_QWORD *)v3 - 2);
        if (v6)
          _Block_release(v6);
        v3 -= 16;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void AppleSARHelper::~AppleSARHelper(AppleSARHelper *this)
{
  IONotificationPort *v2;
  io_object_t v3;
  io_connect_t v4;
  unsigned __int8 v5;
  NSObject *v6;
  io_object_t v7;
  unsigned __int8 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v2 = (IONotificationPort *)*((_QWORD *)this + 4);
  if (v2)
  {
    IONotificationPortDestroy(v2);
    *((_QWORD *)this + 4) = 0;
    v3 = *((_DWORD *)this + 10);
    if (v3)
    {
      IOObjectRelease(v3);
      *((_DWORD *)this + 10) = 0;
    }
  }
  v4 = *((_DWORD *)this + 1);
  if (v4 && IOServiceClose(v4))
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v6 = qword_2564324C8;
      if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
LABEL_26:
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236A3F000, v6, OS_LOG_TYPE_ERROR, "Failed to close the connection!", buf, 2u);
      v7 = *(_DWORD *)this;
      if (!*(_DWORD *)this)
        goto LABEL_14;
      goto LABEL_10;
    }
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v6 = qword_2564324C8;
    if (os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
  }
LABEL_9:
  v7 = *(_DWORD *)this;
  if (!*(_DWORD *)this)
    goto LABEL_14;
LABEL_10:
  if (!IOObjectRelease(v7))
    goto LABEL_14;
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2564324C8 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v9 = qword_2564324C8;
    if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
  }
  else
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v9 = qword_2564324C8;
    if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
  }
  *(_WORD *)v15 = 0;
  _os_log_error_impl(&dword_236A3F000, v9, OS_LOG_TYPE_ERROR, "Failed to relase the service!", v15, 2u);
LABEL_14:
  v10 = *((_QWORD *)this + 1);
  if (v10)
  {
    v11 = *((_QWORD *)this + 2);
    v12 = (void *)*((_QWORD *)this + 1);
    if (v11 != v10)
    {
      do
      {
        v13 = *(NSObject **)(v11 - 8);
        if (v13)
          dispatch_release(v13);
        v14 = *(const void **)(v11 - 16);
        if (v14)
          _Block_release(v14);
        v11 -= 16;
      }
      while (v11 != v10);
      v12 = (void *)*((_QWORD *)this + 1);
    }
    *((_QWORD *)this + 2) = v10;
    operator delete(v12);
  }
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL AppleSARHelper::getSPMIEventTrackingArray(uint64_t a1, void *outputStruct, size_t a3)
{
  mach_port_t v3;
  kern_return_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  _BOOL8 result;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  size_t v13;
  uint8_t buf[4];
  kern_return_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v3 = *(_DWORD *)(a1 + 4);
  if (!v3)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v12 = qword_2564324C8;
      result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v12 = qword_2564324C8;
      result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    *(_WORD *)buf = 0;
    v8 = "Connection has not established yet!";
    v9 = v12;
    v10 = 2;
    goto LABEL_11;
  }
  v4 = IOConnectCallMethod(v3, 0xAu, 0, 0, 0, 0, 0, 0, outputStruct, &v13);
  if (!v4)
    return 1;
  if ((v5 & 1) == 0)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v6 = qword_2564324C8;
    result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
    if (result)
    {
LABEL_6:
      *(_DWORD *)buf = 67109120;
      v15 = v4;
      v8 = "Failed to get SPMI Tracking List (ret: 0x%x)";
      v9 = v6;
      v10 = 8;
LABEL_11:
      _os_log_error_impl(&dword_236A3F000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      return 0;
    }
  }
  else
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v6 = qword_2564324C8;
    result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
    if (result)
      goto LABEL_6;
  }
  return result;
}

BOOL AppleSARHelper::callUserClientMethod(AppleSARHelper *this, uint32_t a2, const unint64_t *a3, uint32_t a4, const void *a5, size_t a6, unint64_t *a7, unsigned int *a8, void *outputStruct, unint64_t a10)
{
  mach_port_t v10;
  kern_return_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  _BOOL8 result;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint8_t buf[4];
  uint32_t v22;
  __int16 v23;
  uint32_t v24;
  __int16 v25;
  kern_return_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = *((_DWORD *)this + 1);
  if (!v10)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v20 = qword_2564324C8;
      result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v20 = qword_2564324C8;
      result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    *(_WORD *)buf = 0;
    v16 = "Connection has not established yet!";
    v17 = v20;
    v18 = 2;
    goto LABEL_11;
  }
  v12 = IOConnectCallMethod(v10, a2, a3, a4, a5, a6, a7, a8, outputStruct, &a10);
  if (!v12)
    return 1;
  if ((v13 & 1) == 0)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v14 = qword_2564324C8;
    result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
    if (result)
    {
LABEL_6:
      *(_DWORD *)buf = 67109632;
      v22 = a2;
      v23 = 1024;
      v24 = a2;
      v25 = 1024;
      v26 = v12;
      v16 = "Failed to run the command for %d (0x%x): result: 0x%x";
      v17 = v14;
      v18 = 20;
LABEL_11:
      _os_log_error_impl(&dword_236A3F000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      return 0;
    }
  }
  else
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v14 = qword_2564324C8;
    result = os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR);
    if (result)
      goto LABEL_6;
  }
  return result;
}

BOOL AppleSARHelper::registerSARServiceCallback(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  __int128 v5;
  mach_port_t MachPort;
  kern_return_t v7;
  _BOOL8 v8;
  unsigned __int8 v9;
  NSObject *v10;
  unsigned __int8 v11;
  NSObject *v12;
  unint64_t v13;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  unint64_t v31;
  char *v32;
  __int128 v33;
  char *v34;
  NSObject *v35;
  const void *v36;
  char *v38;
  BOOL v39;
  BOOL v40;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  double *v45;
  const double *v46;
  uint64_t v47;
  uint8_t buf[4];
  kern_return_t v49;
  uint64_t reference[2];
  uint64_t v51;
  unint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  float64x2x2_t v56;

  v55 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 4);
  if (!v2)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v12 = qword_2564324C8;
      if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        return 0;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v12 = qword_2564324C8;
      if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
        return 0;
    }
    LOWORD(reference[0]) = 0;
    _os_log_error_impl(&dword_236A3F000, v12, OS_LOG_TYPE_ERROR, "Connection has not established yet!", (uint8_t *)reference, 2u);
    return 0;
  }
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v52 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v53 = v5;
  v54 = v5;
  reference[1] = (uint64_t)AppleSARHelper::callback;
  v51 = a1;
  MachPort = IONotificationPortGetMachPort(*(IONotificationPortRef *)(a1 + 32));
  v7 = IOConnectCallAsyncScalarMethod(v2, 0x1Eu, MachPort, reference, 3u, 0, 0, 0, 0);
  v8 = v7 == 0;
  if (!v7)
  {
    v14 = *(_QWORD **)(a1 + 16);
    v13 = *(_QWORD *)(a1 + 24);
    if ((unint64_t)v14 < v13)
    {
      v15 = *(void **)a2;
      if (*(_QWORD *)a2)
        v15 = _Block_copy(v15);
      *v14 = v15;
      v16 = *(NSObject **)(a2 + 8);
      v14[1] = v16;
      if (v16)
        dispatch_retain(v16);
      v17 = v14 + 2;
LABEL_45:
      *(_QWORD *)(a1 + 16) = v17;
      return v8;
    }
    v18 = *(_QWORD *)(a1 + 8);
    v19 = (char *)v14 - v18;
    v20 = ((uint64_t)v14 - v18) >> 4;
    if ((unint64_t)(v20 + 1) >> 60)
      std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::__throw_length_error[abi:ne180100]();
    v21 = v13 - v18;
    v22 = v21 >> 3;
    if (v21 >> 3 <= (unint64_t)(v20 + 1))
      v22 = v20 + 1;
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
      v23 = 0xFFFFFFFFFFFFFFFLL;
    else
      v23 = v22;
    if (v23)
    {
      if (v23 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v24 = (char *)operator new(16 * v23);
      v25 = *(void **)a2;
      if (!*(_QWORD *)a2)
        goto LABEL_29;
    }
    else
    {
      v24 = 0;
      v25 = *(void **)a2;
      if (!*(_QWORD *)a2)
      {
LABEL_29:
        v26 = *(NSObject **)(a2 + 8);
        v27 = &v24[16 * v20];
        *(_QWORD *)v27 = v25;
        *((_QWORD *)v27 + 1) = v26;
        if (v26)
          dispatch_retain(v26);
        v28 = &v24[16 * v23];
        v17 = v27 + 16;
        v29 = *(char **)(a1 + 8);
        v30 = *(char **)(a1 + 16);
        if (v30 == v29)
        {
          *(_QWORD *)(a1 + 8) = v27;
          *(_QWORD *)(a1 + 16) = v17;
          *(_QWORD *)(a1 + 24) = v28;
        }
        else
        {
          v31 = v30 - v29 - 16;
          if (v31 < 0xD0)
            goto LABEL_33;
          v38 = &v30[-(v31 & 0xFFFFFFFFFFFFFFF0)];
          v39 = &v19[(_QWORD)v24 - 8 - (v31 & 0xFFFFFFFFFFFFFFF0)] >= v30 || v38 - 8 >= v27;
          v40 = !v39;
          if (v38 - 16 < &v19[(_QWORD)v24 - 8] && &v19[(_QWORD)v24 - (v31 & 0xFFFFFFFFFFFFFFF0) - 16] < v30 - 8)
            goto LABEL_33;
          if (v40)
            goto LABEL_33;
          v42 = (v31 >> 4) + 1;
          v43 = 16 * (v42 & 0x1FFFFFFFFFFFFFFELL);
          v32 = &v27[-v43];
          v44 = &v30[-v43];
          v45 = (double *)(v27 - 32);
          v46 = (const double *)(v30 - 32);
          v47 = v42 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            v56 = vld2q_f64(v46);
            vst2q_f64(v45, v56);
            *(_OWORD *)v46 = 0uLL;
            *((_OWORD *)v46 + 1) = 0uLL;
            v46 -= 4;
            v45 -= 4;
            v47 -= 2;
          }
          while (v47);
          v27 = v32;
          v30 = v44;
          if (v42 != (v42 & 0x1FFFFFFFFFFFFFFELL))
          {
LABEL_33:
            v32 = v27;
            do
            {
              v33 = *((_OWORD *)v30 - 1);
              v30 -= 16;
              *((_OWORD *)v32 - 1) = v33;
              v32 -= 16;
              *(_QWORD *)v30 = 0;
              *((_QWORD *)v30 + 1) = 0;
            }
            while (v30 != v29);
          }
          v30 = *(char **)(a1 + 8);
          v34 = *(char **)(a1 + 16);
          *(_QWORD *)(a1 + 8) = v32;
          *(_QWORD *)(a1 + 16) = v17;
          *(_QWORD *)(a1 + 24) = v28;
          while (v34 != v30)
          {
            v35 = *((_QWORD *)v34 - 1);
            if (v35)
              dispatch_release(v35);
            v36 = (const void *)*((_QWORD *)v34 - 2);
            if (v36)
              _Block_release(v36);
            v34 -= 16;
          }
        }
        if (v30)
          operator delete(v30);
        goto LABEL_45;
      }
    }
    v25 = _Block_copy(v25);
    goto LABEL_29;
  }
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2564324C8 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v10 = qword_2564324C8;
    if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
      return v8;
    goto LABEL_6;
  }
  v10 = qword_2564324C8;
  if (os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
  {
LABEL_6:
    *(_DWORD *)buf = 67109120;
    v49 = v7;
    _os_log_error_impl(&dword_236A3F000, v10, OS_LOG_TYPE_ERROR, "Failed to setup callback: (ret: 0x%x)", buf, 8u);
  }
  return v8;
}

void sub_236A40CD8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void AppleSARHelper::callback(AppleSARHelper *this, void *a2, int *a3, unint64_t *a4)
{
  unsigned __int8 v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  void *v15;
  char v16;
  unsigned __int8 v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  void *aBlock;
  uint64_t v24;
  int v25;

  if (!(_DWORD)a2)
  {
    if (!this)
      return;
    if (!a3)
    {
      {
        GetOsLogContext(void)::sOsLogContext = 0;
        qword_2564324C8 = 0;
        __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
      }
      if (GetOsLogContext(void)::onceToken == -1)
      {
        v5 = qword_2564324C8;
        if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
          return;
      }
      else
      {
        dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
        v5 = qword_2564324C8;
        if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
          return;
      }
      LOWORD(v19) = 0;
      v18 = "Failed to fetch arguments!";
LABEL_35:
      _os_log_error_impl(&dword_236A3F000, v5, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v19, 2u);
      return;
    }
    v7 = *((_QWORD *)this + 1);
    v8 = *((_QWORD *)this + 2);
    if (v7 == v8)
      return;
    v9 = *a3;
    while (*(_QWORD *)v7)
    {
      v10 = _Block_copy(*(const void **)v7);
      v11 = *(NSObject **)(v7 + 8);
      if (v11)
        goto LABEL_13;
LABEL_14:
      v12 = *((_QWORD *)a3 + 2);
      if (v10)
      {
        v13 = _Block_copy(v10);
        v14 = v13;
        v19 = MEMORY[0x24BDAC760];
        v20 = 1174405120;
        v21 = ___ZNK8dispatch8callbackIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEclIJS2_S3_EEEvDpT__block_invoke;
        v22 = &__block_descriptor_tmp;
        if (v13)
        {
          v15 = _Block_copy(v13);
          v16 = 0;
        }
        else
        {
          v15 = 0;
          v16 = 1;
        }
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v19 = MEMORY[0x24BDAC760];
        v20 = 1174405120;
        v16 = 1;
        v21 = ___ZNK8dispatch8callbackIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEclIJS2_S3_EEEvDpT__block_invoke;
        v22 = &__block_descriptor_tmp;
      }
      v25 = v9;
      aBlock = v15;
      v24 = v12;
      dispatch_async(v11, &v19);
      if (aBlock)
        _Block_release(aBlock);
      if ((v16 & 1) == 0)
        _Block_release(v14);
      if (v11)
        dispatch_release(v11);
      if (v10)
        _Block_release(v10);
      v7 += 16;
      if (v7 == v8)
        return;
    }
    v10 = 0;
    v11 = *(NSObject **)(v7 + 8);
    if (!v11)
      goto LABEL_14;
LABEL_13:
    dispatch_retain(v11);
    goto LABEL_14;
  }
  if ((v4 & 1) == 0)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2564324C8 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
    }
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v5 = qword_2564324C8;
    if (!os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
      return;
    goto LABEL_34;
  }
  dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  v5 = qword_2564324C8;
  if (os_log_type_enabled((os_log_t)qword_2564324C8, OS_LOG_TYPE_ERROR))
  {
LABEL_34:
    LOWORD(v19) = 0;
    v18 = "Failed to process the callback!";
    goto LABEL_35;
  }
}

void std::vector<dispatch::callback<void({block_pointer})(sar::AppleSARMessageType,void *)>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_25080A498, MEMORY[0x24BEDAAF0]);
}

void sub_236A41058(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "vector");
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

void std::__shared_ptr_pointer<AppleSARHelper *,std::shared_ptr<AppleSARHelper>::__shared_ptr_default_delete<AppleSARHelper,AppleSARHelper>,std::allocator<AppleSARHelper>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<AppleSARHelper *,std::shared_ptr<AppleSARHelper>::__shared_ptr_default_delete<AppleSARHelper,AppleSARHelper>,std::allocator<AppleSARHelper>>::__on_zero_shared(uint64_t a1)
{
  AppleSARHelper *v1;
  void *v2;

  v1 = *(AppleSARHelper **)(a1 + 24);
  if (v1)
  {
    AppleSARHelper::~AppleSARHelper(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<AppleSARHelper *,std::shared_ptr<AppleSARHelper>::__shared_ptr_default_delete<AppleSARHelper,AppleSARHelper>,std::allocator<AppleSARHelper>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000236A41C87)
    return a1 + 24;
  if (((v3 & 0x8000000236A41C87 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000236A41C87))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000236A41C87 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEclIJS2_S3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void *__copy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvN3sar19AppleSARMessageTypeEPvEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t *GetOsLogContext(void)
{
  unsigned __int8 v0;

  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2564324C8 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  return &GetOsLogContext(void)::sOsLogContext;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  _BYTE v0[16];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(uint64_t *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];
  std::__shared_weak_count *v11;

  v2 = atomic_load((unsigned __int8 *)&qword_256432470);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_256432470))
  {
    MEMORY[0x23B7F95D4](&unk_256432478);
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED98A0], &unk_256432478, &dword_236A3F000);
    __cxa_guard_release(&qword_256432470);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_3;
  v3 = *a1;
  v4 = (std::__shared_weak_count *)a1[1];
  v10[4] = v3;
  v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  if (_MergedGlobals != -1)
  {
    dispatch_once(&_MergedGlobals, v10);
    v4 = v11;
    if (v11)
      goto LABEL_7;
    return &unk_256432478;
  }
  if (!v4)
    return &unk_256432478;
LABEL_7:
  v7 = (unint64_t *)&v4->__shared_owners_;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (v8)
    return &unk_256432478;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return &unk_256432478;
}

void sub_236A41408(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_256432470);
  _Unwind_Resume(a1);
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _BYTE v10[16];
  _BYTE v11[48];
  uint64_t v12;
  uint64_t v13;

  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2564324C8 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_236A3F000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v10, (const ctu::OsLogContext *)&GetOsLogContext(void)::sOsLogContext);
  MEMORY[0x23B7F95C8](v11, v10, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  v4 = v12;
  v3 = v13;
  if (v13)
  {
    v5 = (unint64_t *)(v13 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)qword_2564324B0;
  qword_2564324A8 = v4;
  qword_2564324B0 = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  ctu::StaticLogger::~StaticLogger((ctu::StaticLogger *)v11);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v10);
}

void sub_236A4155C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7EE8](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
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

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x24BED9860](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x24BED9870]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x24BED9880]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x24BED9888](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
  MEMORY[0x24BED98A0](this);
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x24BED99C8]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_25080A4B0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25080A4B8(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

