void CtrXpcClient_startFWUpdate_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_startFWUpdate_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully started FW Update... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A0F9C20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_startFWUpdate_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  const char *v6;
  double result;
  __int128 v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t object;

  v5 = *(unsigned __int8 *)(a2 + 43);
  v6 = *(const char **)(a2 + 48);
  v10 = xpc_string_create("startFWUpdate");
  if (!v10)
    v10 = xpc_null_create();
  *(_QWORD *)&v8 = a1;
  *((_QWORD *)&v8 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v8, &v10, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v10);
  v10 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "startFWUpdate");
  if (v6)
    xpc_dictionary_set_string(*a1, "extendedMACAddress", v6);
  xpc_dictionary_set_BOOL(*a1, "isWED", v5 != 0);
  std::string::basic_string[abi:ne180100]<0>(&v8, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)&v8;
  *(_OWORD *)(a3 + 8) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  return result;
}

xpc_object_t xpc::dict::object_proxy::operator=@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t result;

  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  result = xpc_null_create();
  *a2 = result;
  return result;
}

{
  xpc_object_t result;

  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  result = xpc_null_create();
  *a2 = result;
  return result;
}

{
  xpc_object_t result;

  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  result = xpc_null_create();
  *a2 = result;
  return result;
}

uint64_t std::string::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v4;

  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *((_BYTE *)a2 + 23) = 0;
  *(_BYTE *)a2 = 0;
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  size_t v7;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    if ((v4 | 7) == 0x17)
      v7 = 25;
    else
      v7 = (v4 | 7) + 1;
    v6 = operator new(v7);
    a1[1] = v5;
    a1[2] = v7 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_10;
  }
  memmove(v6, __s, v5);
LABEL_10:
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
  __cxa_throw(exception, (struct type_info *)off_250B1FB90, MEMORY[0x24BEDAAF0]);
}

void sub_23A0F9EDC(_Unwind_Exception *a1)
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

void CtrXpcClient_generateDiagnostics_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_generateDiagnostics_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Running Thread Diagnostics Monitor... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A0FA0A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_generateDiagnostics_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v5;
  uint64_t v6;
  xpc_object_t object;
  xpc_object_t v8;

  object = xpc_string_create("GenerateDiagnostics");
  if (!object)
    object = xpc_null_create();
  *(_QWORD *)&v5 = a1;
  *((_QWORD *)&v5 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v5, &object, &v8);
  xpc_release(v8);
  v8 = 0;
  xpc_release(object);
  object = 0;
  xpc_dictionary_set_string(*a1, "property_name", "GenerateDiagnostics");
  std::string::basic_string[abi:ne180100]<0>(&v5, (char *)&unk_23A11B5CA);
  *(_DWORD *)a2 = 0;
  result = *(double *)&v5;
  *(_OWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

void CtrXpcClient_threadLeave_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_generateDiagnostics_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Leaving the Network... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A0FA314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_threadLeave_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  double result;
  __int128 v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t object;

  if (a2)
    v5 = *(unsigned __int8 *)(a2 + 41);
  else
    v5 = 0;
  v9 = xpc_string_create("threadLeave");
  if (!v9)
    v9 = xpc_null_create();
  *(_QWORD *)&v7 = a1;
  *((_QWORD *)&v7 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v7, &v9, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v9);
  v9 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "threadLeave");
  xpc_dictionary_set_BOOL(*a1, "threadStop", v5 != 0);
  std::string::basic_string[abi:ne180100]<0>(&v7, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)&v7;
  *(_OWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 24) = v8;
  return result;
}

void CtrXpcClient_leave_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_generateDiagnostics_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Left current WPAN. . .\n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A0FA5B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_leave_interface_helper@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v5;
  uint64_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t object;
  char __str[256];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v11 = xpc_string_create("org.wpantund.v1");
  if (!v11)
    v11 = xpc_null_create();
  *(_QWORD *)&v5 = a1;
  *((_QWORD *)&v5 + 1) = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v5, &v11, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
  v11 = 0;
  v9 = xpc_string_create(__str);
  if (!v9)
    v9 = xpc_null_create();
  *(_QWORD *)&v5 = a1;
  *((_QWORD *)&v5 + 1) = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v5, &v9, &v10);
  xpc_release(v10);
  v10 = 0;
  xpc_release(v9);
  v9 = 0;
  v7 = xpc_string_create("Leave");
  if (!v7)
    v7 = xpc_null_create();
  *(_QWORD *)&v5 = a1;
  *((_QWORD *)&v5 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v5, &v7, &v8);
  xpc_release(v8);
  v8 = 0;
  xpc_release(v7);
  v7 = 0;
  fwrite("Leaving current WPAN. . .\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  std::string::basic_string[abi:ne180100]<0>(&v5, (char *)&unk_23A11B5CA);
  *(_DWORD *)a2 = 0;
  result = *(double *)&v5;
  *(_OWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

void sub_23A0FA784(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_commissionOrFormNetwork_response_helper(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int int64;
  const char *string;
  uint64_t v9;
  char *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  std::string *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t object;
  xpc_object_t v23;
  std::string __p;
  __int128 buf;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23B841948](*a2);
  v5 = MEMORY[0x24BDACFA0];
  if (v4 != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v6 = 11;
LABEL_9:
    *(_DWORD *)a1 = v6;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    return;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v9 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v9, int64);
    v10 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v10);
    v6 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sucessfully formed the Network... \n", (uint8_t *)&__p, 2u);
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  v12 = v11;
  if (v11)
  {
    v23 = v11;
  }
  else
  {
    v12 = xpc_null_create();
    v23 = v12;
    if (!v12)
    {
      v13 = xpc_null_create();
      v12 = 0;
      goto LABEL_20;
    }
  }
  if (MEMORY[0x23B841948](v12) != v5)
  {
    v13 = xpc_null_create();
LABEL_20:
    v23 = v13;
    goto LABEL_21;
  }
  xpc_retain(v12);
LABEL_21:
  xpc_release(v12);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"channel";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "channel";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &object);
  xpc_release(object);
  object = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"panid";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "panid";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v21);
  xpc_release(v21);
  v21 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"networkName";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "networkName";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v20);
  xpc_release(v20);
  v20 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"xpanid";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "xpanid";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v19);
  xpc_release(v19);
  v19 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"masterKey";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "masterKey";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v18);
  xpc_release(v18);
  v18 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"PSKc";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "PSKc";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v17);
  xpc_release(v17);
  v17 = 0;
  v15 = v23;
  if (v23)
    xpc_retain(v23);
  else
    v15 = xpc_null_create();
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"PropVal";
  xpc::dict::object_proxy::operator=((uint64_t)&__p, &v15, &v16);
  xpc_release(v16);
  v16 = 0;
  xpc_release(v15);
  v15 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    xpc::dict::to_debug_string((xpc::dict *)a2, &__p);
    v14 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Response is: %s \n", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  xpc_release(v23);
}

void sub_23A0FABD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void xpc::dict::object_proxy::operator=(uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t v5;
  xpc_object_t object;

  xpc::dict::object_proxy::operator xpc::object(a2, &object);
  v5 = object;
  if (object)
    xpc_retain(object);
  else
    v5 = xpc_null_create();
  xpc::dict::object_proxy::operator=(a1, &v5, a3);
  xpc_release(v5);
  v5 = 0;
  xpc_release(object);
}

void xpc::dict::~dict(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

double CtrXpcClient_commissionOrFormNetwork_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  double result;
  xpc_object_t v7;
  xpc_object_t object;
  __int128 v9;
  uint64_t v10;

  if (*(_QWORD *)(a2 + 8))
  {
    v5 = *(unsigned __int8 *)(a2 + 16);
    v7 = xpc_string_create("commissionOrFormNetwork");
    if (!v7)
      v7 = xpc_null_create();
    *(_QWORD *)&v9 = a1;
    *((_QWORD *)&v9 + 1) = "method";
    xpc::dict::object_proxy::operator=((uint64_t)&v9, &v7, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v7);
    v7 = 0;
    xpc_dictionary_set_string(*a1, "property_name", "commissionOrFormNetwork");
    xpc_dictionary_set_BOOL(*a1, "clearThreadCredentials", v5 != 0);
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)&unk_23A11B5CA);
    *(_DWORD *)a3 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, "Output pointer is not given");
    *(_DWORD *)a3 = 10;
  }
  result = *(double *)&v9;
  *(_OWORD *)(a3 + 8) = v9;
  *(_QWORD *)(a3 + 24) = v10;
  return result;
}

xpc_object_t xpc::dict::object_proxy::operator xpc::object@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t v3;
  xpc_object_t result;

  v3 = xpc::dict::object_proxy::operator*(a1);
  *a2 = v3;
  if (v3)
    return xpc_retain(v3);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

xpc_object_t xpc::dict::object_proxy::operator*(uint64_t a1)
{
  return xpc_dictionary_get_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8));
}

void xpc::dict::to_debug_string(xpc::dict *this@<X0>, _QWORD *a2@<X8>)
{
  char *v3;

  v3 = (char *)MEMORY[0x23B841858](*(_QWORD *)this);
  std::string::basic_string[abi:ne180100]<0>(a2, v3);
  free(v3);
}

void CtrXpcClient_updatePrimaryResident_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_generateDiagnostics_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Updating primary resident information... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A0FB064(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_updatePrimaryResident_interface_helper@<D0>(xpc_object_t *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  int v6;
  const char *v7;
  double result;
  __int128 v9;
  uint64_t v10;
  xpc_object_t v11;
  xpc_object_t object;

  v5 = *a2;
  v6 = a2[1];
  v7 = (const char *)*((_QWORD *)a2 + 1);
  v11 = xpc_string_create("updatePrimaryResident");
  if (!v11)
    v11 = xpc_null_create();
  *(_QWORD *)&v9 = a1;
  *((_QWORD *)&v9 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v9, &v11, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
  v11 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "updatePrimaryResident");
  xpc_dictionary_set_BOOL(*a1, "isPrimaryResident", v5 != 0);
  xpc_dictionary_set_BOOL(*a1, "isPrimaryResidentThreadCapable", v6 != 0);
  if (v7)
    xpc_dictionary_set_string(*a1, "primaryResidentInfo", v7);
  std::string::basic_string[abi:ne180100]<0>(&v9, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)&v9;
  *(_OWORD *)(a3 + 8) = v9;
  *(_QWORD *)(a3 + 24) = v10;
  return result;
}

void CtrXpcClient_threadStart_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string *v9;
  xpc_object_t object;
  std::string __p;
  __int128 buf;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sucessfully Started the Network... \n", (uint8_t *)&__p, 2u);
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"outputUniqueNetworkId";
  *(_QWORD *)&buf = a2;
  *((_QWORD *)&buf + 1) = "PropVal";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &object);
  xpc_release(object);
  object = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    xpc::dict::to_debug_string((xpc::dict *)a2, &__p);
    v9 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? &__p
       : (std::string *)__p.__r_.__value_.__r.__words[0];
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Response is: %s \n", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FB3DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_threadStart_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const char *v5;
  int v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  const char *v11;
  double result;
  __int128 v13;
  uint64_t v14;
  xpc_object_t v15;
  xpc_object_t object;

  v5 = *(const char **)a2;
  v6 = *(unsigned __int8 *)(a2 + 24);
  v7 = *(const char **)(a2 + 32);
  v8 = *(unsigned __int8 *)(a2 + 40);
  v9 = *(unsigned __int8 *)(a2 + 42);
  v10 = *(unsigned __int8 *)(a2 + 44);
  v11 = *(const char **)(a2 + 48);
  v15 = xpc_string_create("threadStart");
  if (!v15)
    v15 = xpc_null_create();
  *(_QWORD *)&v13 = a1;
  *((_QWORD *)&v13 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v13, &v15, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v15);
  v15 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "threadStart");
  xpc_dictionary_set_BOOL(*a1, "wait_for_sync", v6 != 0);
  xpc_dictionary_set_BOOL(*a1, "geoAvailable", v8 != 0);
  xpc_dictionary_set_BOOL(*a1, "routerMode", v9 != 0);
  xpc_dictionary_set_BOOL(*a1, "isPrimaryUser", v10 != 0);
  if (v11)
    xpc_dictionary_set_string(*a1, "extendedMACAddress", v11);
  if (v7)
    xpc_dictionary_set_string(*a1, "activeOperationalDataset", v7);
  if (v5)
    xpc_dictionary_set_string(*a1, "uniqueNetworkId", v5);
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)&v13;
  *(_OWORD *)(a3 + 8) = v13;
  *(_QWORD *)(a3 + 24) = v14;
  return result;
}

void CtrXpcClient_generatePSKc_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  xpc_object_t value;
  std::string *v10;
  std::string __p;
  uint8_t buf[4];
  std::string *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sucessfully generated PSKc ... \n", (uint8_t *)&__p, 2u);
  }
  value = xpc_dictionary_get_value(*a2, "value");
  xpc_dictionary_set_value(*a2, "PropVal", value);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    xpc::dict::to_debug_string((xpc::dict *)a2, &__p);
    v10 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    v13 = v10;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Response is: %s \n", buf, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FB7DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *CtrXpcClient_generatePSKc_interface_helper@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const char *v4;
  const char *v5;
  unint64_t v7;
  _QWORD *result;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t object;
  _BYTE buf[24];
  unint64_t bytes;
  char __str[16];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 8))
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "Output pointer is not given");
LABEL_16:
    *(_DWORD *)a3 = 10;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)__str;
    v9 = v19;
    goto LABEL_17;
  }
  v4 = *(const char **)a2;
  if (!*(_QWORD *)a2)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "Network name is not given");
    goto LABEL_16;
  }
  v5 = *(const char **)(a2 + 16);
  if (!v5)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "Pass phrase is not given");
    goto LABEL_16;
  }
  v7 = *(_QWORD *)(a2 + 24);
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v14 = xpc_string_create("org.wpantund.v1");
  if (!v14)
    v14 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v14, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v14);
  v14 = 0;
  v12 = xpc_string_create(__str);
  if (!v12)
    v12 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "path";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v12, &v13);
  xpc_release(v13);
  v13 = 0;
  xpc_release(v12);
  v12 = 0;
  v10 = xpc_string_create("GeneratePSKc");
  if (!v10)
    v10 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "method";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v10, &v11);
  xpc_release(v11);
  v11 = 0;
  xpc_release(v10);
  v10 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "GeneratePSKc");
  xpc_dictionary_set_string(*a1, "pass_phrase", v5);
  xpc_dictionary_set_string(*a1, "network_name", v4);
  bytes = bswap64(v7);
  xpc_dictionary_set_data(*a1, "xpanid", &bytes, 8uLL);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CtrXpcClient_generatePSKc_interface_helper";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s : xpanid:0x%016llX", buf, 0x16u);
  }
  result = std::string::basic_string[abi:ne180100]<0>(buf, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)buf;
  v9 = *(_QWORD *)&buf[16];
LABEL_17:
  *(_QWORD *)(a3 + 24) = v9;
  return result;
}

void sub_23A0FBAC8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_SetChannel_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  const char *v7;
  char *v8;
  std::string::size_type v9;
  std::string __p;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  v7 = xpc_dictionary_get_string(*a2, "property_name");
  if (int64)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper((uint64_t)string, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  v9 = (std::string::size_type)v7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v9;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sucessfully set the property - \"%s\" \n", (uint8_t *)&__p, 0xCu);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FBCD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_SetChannel_interface_helper@<D0>(xpc_object_t *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  int v4;
  std::string *v6;
  double result;
  _QWORD v8[2];
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t object;
  std::string v13;

  v4 = *a2;
  if ((v4 - 11) >= 0xF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_SetChannel_interface_helper(v4);
    std::string::basic_string[abi:ne180100]<0>(&v13, "Invalid Channel number provided");
    *(_DWORD *)a3 = 10;
  }
  else
  {
    v11 = xpc_string_create("setChannel");
    if (!v11)
      v11 = xpc_null_create();
    v13.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    v13.__r_.__value_.__l.__size_ = (std::string::size_type)"method";
    xpc::dict::object_proxy::operator=((uint64_t)&v13, &v11, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v11);
    v11 = 0;
    xpc_dictionary_set_string(*a1, "property_name", "setChannel");
    std::to_string(&v13, v4);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = &v13;
    else
      v6 = (std::string *)v13.__r_.__value_.__r.__words[0];
    v9 = xpc_string_create((const char *)v6);
    if (!v9)
      v9 = xpc_null_create();
    v8[0] = a1;
    v8[1] = "property_value";
    xpc::dict::object_proxy::operator=((uint64_t)v8, &v9, &v10);
    xpc_release(v10);
    v10 = 0;
    xpc_release(v9);
    v9 = 0;
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
    std::string::basic_string[abi:ne180100]<0>(&v13, (char *)&unk_23A11B5CA);
    *(_DWORD *)a3 = 0;
  }
  result = *(double *)&v13.__r_.__value_.__l.__data_;
  *(std::string *)(a3 + 8) = v13;
  return result;
}

void CtrXpcClient_remove_service_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Service is removed.\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FBFF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *CtrXpcClient_remove_service_interface_helper@<X0>(xpc_object_t *a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  char *v5;
  size_t v7;
  _BYTE *v8;
  int v9;
  _QWORD *result;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t object;
  char __str[16];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  if (!(_DWORD)v4)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "enterprise number is invalid, given as(0)");
LABEL_12:
    *(_DWORD *)a3 = 10;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)__str;
    v11 = v21;
    goto LABEL_13;
  }
  v5 = (char *)*((_QWORD *)a2 + 1);
  if (!v5)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "Service data is not Given");
    goto LABEL_12;
  }
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v18 = xpc_string_create("org.wpantund.v1");
  if (!v18)
    v18 = xpc_null_create();
  *(_QWORD *)&v12 = a1;
  *((_QWORD *)&v12 + 1) = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v12, &v18, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v18);
  v18 = 0;
  v16 = xpc_string_create(__str);
  if (!v16)
    v16 = xpc_null_create();
  *(_QWORD *)&v12 = a1;
  *((_QWORD *)&v12 + 1) = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v12, &v16, &v17);
  xpc_release(v17);
  v17 = 0;
  xpc_release(v16);
  v16 = 0;
  v14 = xpc_string_create("ServiceRemove");
  if (!v14)
    v14 = xpc_null_create();
  *(_QWORD *)&v12 = a1;
  *((_QWORD *)&v12 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v12, &v14, &v15);
  xpc_release(v15);
  v15 = 0;
  xpc_release(v14);
  v14 = 0;
  v7 = strlen(v5);
  v8 = malloc_type_malloc(v7, 0x100004077774924uLL);
  v9 = parse_string_into_data(v8, v7, v5);
  xpc_dictionary_set_uint64(*a1, "enterprise_number", v4);
  xpc_dictionary_set_data(*a1, "service_data", v8, v9);
  free(v8);
  result = std::string::basic_string[abi:ne180100]<0>(&v12, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  *(_OWORD *)(a3 + 8) = v12;
  v11 = v13;
LABEL_13:
  *(_QWORD *)(a3 + 24) = v11;
  return result;
}

void sub_23A0FC268(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_joiner_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LOWORD(__p.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Reply is not a dictionary \n", (uint8_t *)&__p, 2u);
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Joiner command is successful.\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FC450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXpcClient_joiner_interface_helper(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const char *v5;
  char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  int v12;
  __int128 *p_p;
  uint64_t v14;
  uint64_t v17;
  int v18;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  __int128 v26;
  uint64_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t object;
  __int128 __p;
  char v35;
  _BYTE buf[264];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = *(char **)a2;
  v5 = *(const char **)(a2 + 8);
  v8 = *(const char **)(a2 + 16);
  v7 = *(const char **)(a2 + 24);
  v10 = *(const char **)(a2 + 32);
  v9 = *(const char **)(a2 + 40);
  v11 = *(const char **)(a2 + 48);
  v12 = *(unsigned __int8 *)(a2 + 64);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "joiner: cmd: %s, pspskd: %s \n", buf, 0x16u);
  }
  if (!v6)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "Joiner command operation is not provided");
    *(_DWORD *)a3 = 10;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)buf;
    *(_QWORD *)(a3 + 24) = *(_QWORD *)&buf[16];
    return;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v6);
  snprintf(buf, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v32 = xpc_string_create("org.wpantund.v1");
  if (!v32)
    v32 = xpc_null_create();
  *(_QWORD *)&v26 = a1;
  *((_QWORD *)&v26 + 1) = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v26, &v32, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v32);
  v32 = 0;
  v30 = xpc_string_create(buf);
  if (!v30)
    v30 = xpc_null_create();
  *(_QWORD *)&v26 = a1;
  *((_QWORD *)&v26 + 1) = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v26, &v30, &v31);
  xpc_release(v31);
  v31 = 0;
  xpc_release(v30);
  v30 = 0;
  if (v35 < 0)
  {
    v14 = *((_QWORD *)&__p + 1);
    if (*((_QWORD *)&__p + 1) == 10)
    {
      if (*(_QWORD *)__p == 0x745372656E696F4ALL && *(_WORD *)(__p + 8) == 28783)
      {
LABEL_41:
        v24 = xpc_string_create("JoinerStop");
        if (!v24)
          v24 = xpc_null_create();
        *(_QWORD *)&v26 = a1;
        *((_QWORD *)&v26 + 1) = "method";
        xpc::dict::object_proxy::operator=((uint64_t)&v26, &v24, &v25);
        xpc_release(v25);
        v25 = 0;
        xpc_release(v24);
        v24 = 0;
        goto LABEL_63;
      }
      v14 = *((_QWORD *)&__p + 1);
    }
    else if (*((_QWORD *)&__p + 1) == 11
           && *(_QWORD *)__p == 0x745372656E696F4ALL
           && *(_QWORD *)(__p + 3) == 0x747261745372656ELL)
    {
LABEL_50:
      v28 = xpc_string_create("JoinerStart");
      if (!v28)
        v28 = xpc_null_create();
      *(_QWORD *)&v26 = a1;
      *((_QWORD *)&v26 + 1) = "method";
      xpc::dict::object_proxy::operator=((uint64_t)&v26, &v28, &v29);
      xpc_release(v29);
      v29 = 0;
      xpc_release(v28);
      v28 = 0;
      if (!v5)
      {
        std::string::basic_string[abi:ne180100]<0>(&v26, "psk value is not given");
        goto LABEL_49;
      }
      xpc_dictionary_set_string(*a1, "Joiner:PSKd", v5);
      xpc_dictionary_set_BOOL(*a1, "Joiner:ReturnImmediatelyOnStart", v12 != 0);
      if (v8)
        xpc_dictionary_set_string(*a1, "Joiner:ProvisioningUrl", v8);
      if (v7)
        xpc_dictionary_set_string(*a1, "Joiner:Vendor:Name", v7);
      if (v10)
        xpc_dictionary_set_string(*a1, "Joiner:Vendor:Model", v10);
      if (v9)
        xpc_dictionary_set_string(*a1, "Joiner:Vendor:SwVersion", v9);
      if (v11)
        xpc_dictionary_set_string(*a1, "Joiner:Vendor:Data", v11);
      goto LABEL_63;
    }
    if (v14 == 12)
    {
      p_p = (__int128 *)__p;
      goto LABEL_28;
    }
LABEL_48:
    std::string::basic_string[abi:ne180100]<0>(&v26, "Joiner: not a valid cmd");
LABEL_49:
    *(_DWORD *)a3 = 10;
    goto LABEL_64;
  }
  if (v35 == 10)
  {
    if ((_QWORD)__p != 0x745372656E696F4ALL || WORD4(__p) != 28783)
      goto LABEL_48;
    goto LABEL_41;
  }
  if (v35 == 11)
  {
    if ((_QWORD)__p != 0x745372656E696F4ALL || *(_QWORD *)((char *)&__p + 3) != 0x747261745372656ELL)
      goto LABEL_48;
    goto LABEL_50;
  }
  if (v35 != 12)
    goto LABEL_48;
  p_p = &__p;
LABEL_28:
  v17 = *(_QWORD *)p_p;
  v18 = *((_DWORD *)p_p + 2);
  if (v17 != 0x744172656E696F4ALL || v18 != 1751343476)
    goto LABEL_48;
  v22 = xpc_string_create("JoinerAttach");
  if (!v22)
    v22 = xpc_null_create();
  *(_QWORD *)&v26 = a1;
  *((_QWORD *)&v26 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v26, &v22, &v23);
  xpc_release(v23);
  v23 = 0;
  xpc_release(v22);
  v22 = 0;
  xpc_dictionary_set_BOOL(*a1, "Joiner:ReturnImmediatelyOnStart", v12 != 0);
LABEL_63:
  std::string::basic_string[abi:ne180100]<0>(&v26, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
LABEL_64:
  *(_OWORD *)(a3 + 8) = v26;
  *(_QWORD *)(a3 + 24) = v27;
  if (v35 < 0)
    operator delete((void *)__p);
}

void sub_23A0FC9AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t dump_basic_type_from_xpc_msg(FILE *a1, xpc_object_t xuint, uint64_t a3)
{
  uint64_t result;
  const char *v6;
  uint64_t v7;
  size_t i;
  const char *string;
  uint64_t v10;
  size_t j;
  unsigned __int8 uint64;
  uint64_t v13;
  size_t k;
  int int64;

  switch(a3)
  {
    case 1:
      xpc_uint64_get_value(xuint);
      return fprintf(a1, "0x%02X");
    case 2:
      if (xpc_BOOL_get_value(xuint))
        v6 = "true";
      else
        v6 = "false";
      return fputs(v6, a1);
    case 3:
      xpc_int64_get_value(xuint);
      return fprintf(a1, "%d");
    case 4:
      xpc_uint64_get_value(xuint);
      return fprintf(a1, "0x%04X");
    case 5:
      xpc_int64_get_value(xuint);
      return fprintf(a1, "%d");
    case 6:
      xpc_uint64_get_value(xuint);
      return fprintf(a1, "%d");
    case 7:
      xpc_int64_get_value(xuint);
      goto LABEL_14;
    case 8:
      xpc_uint64_get_value(xuint);
LABEL_14:
      result = fprintf(a1, "0x%016llX");
      break;
    case 9:
      xpc_double_get_value(xuint);
      result = fprintf(a1, "%lf");
      break;
    case 10:
      xpc_string_get_string_ptr(xuint);
      result = fprintf(a1, "\"%s\"");
      break;
    case 13:
      result = xpc_array_get_count(xuint);
      if (result)
      {
        v7 = result;
        for (i = 0; i != v7; ++i)
        {
          string = xpc_array_get_string(xuint, i);
          result = fprintf(a1, "\"%s\" \n", string);
        }
      }
      break;
    case 14:
      result = xpc_array_get_count(xuint);
      if (result)
      {
        v10 = result;
        for (j = 0; j != v10; ++j)
        {
          uint64 = xpc_array_get_uint64(xuint, j);
          result = fprintf(a1, "%02X", uint64);
        }
      }
      break;
    case 15:
      result = xpc_array_get_count(xuint);
      if (result)
      {
        v13 = result;
        for (k = 0; k != v13; ++k)
        {
          int64 = xpc_array_get_int64(xuint, k);
          result = fprintf(a1, "%d \n", int64);
        }
      }
      break;
    default:
      result = fprintf(a1, "Invalid Msg Sub Type v_type = %llu \n");
      break;
  }
  return result;
}

uint64_t dump_info_from_xpc_msg(__sFILE *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *string;
  xpc_object_t v11;
  uint64_t v12;
  size_t count;
  size_t v15;
  size_t v16;
  uint64_t v17;
  xpc_object_t value;
  __sFILE *v19;
  void *v20;
  uint64_t uint64;

  v6 = MEMORY[0x23B841948](a2);
  v7 = MEMORY[0x24BDACF78];
  if (v6 == MEMORY[0x24BDACF78])
  {
    if (a3 == 14)
    {
      fputc(91, a1);
LABEL_14:
      dump_basic_type_from_xpc_msg(a1, a2, a3);
LABEL_15:
      fputc(93, a1);
      return fputc(10, a1);
    }
    if (xpc_array_get_count(a2))
      fwrite("[\n", 2uLL, 1uLL, a1);
    else
      fputc(91, a1);
    if ((unint64_t)(a3 - 13) <= 2)
      goto LABEL_14;
    count = xpc_array_get_count(a2);
    if (!count)
      goto LABEL_15;
    v15 = count;
    v16 = 0;
    v17 = MEMORY[0x24BDACFA0];
    while (1)
    {
      value = xpc_array_get_value(a2, v16);
      if (MEMORY[0x23B841948]() == v7)
        break;
      if (MEMORY[0x23B841948](value) == v17)
      {
        uint64 = xpc_dictionary_get_uint64(value, "v_type");
        v19 = a1;
        v20 = value;
        goto LABEL_24;
      }
      fwrite("WPANCTL: Invalid type while looping through Array \n", 0x33uLL, 1uLL, a1);
LABEL_25:
      if (v15 == ++v16)
        goto LABEL_15;
    }
    v19 = a1;
    v20 = value;
    uint64 = 12;
LABEL_24:
    dump_info_from_xpc_msg(v19, v20, uint64);
    goto LABEL_25;
  }
  v8 = MEMORY[0x23B841948](a2);
  v9 = MEMORY[0x24BDACFA0];
  if (v8 == MEMORY[0x24BDACFA0])
  {
    string = xpc_dictionary_get_string(a2, "key");
    fprintf(a1, "\t\"%s\"", string);
    fwrite(" => ", 4uLL, 1uLL, a1);
    v11 = xpc_dictionary_get_value(a2, "value");
    v12 = xpc_dictionary_get_uint64(a2, "v_type");
    if (MEMORY[0x23B841948](v11) == v9 || MEMORY[0x23B841948](v11) == v7)
      dump_info_from_xpc_msg(a1, v11, v12);
    else
      dump_basic_type_from_xpc_msg(a1, v11, v12);
  }
  else
  {
    fprintf(a1, "Invalid Msg Type with v_type = %llu \n", a3);
  }
  return fputc(10, a1);
}

uint64_t dump_xpc_msg(FILE *a1, void *a2, uint64_t a3)
{
  if (MEMORY[0x23B841948](a2) == MEMORY[0x24BDACFA0] || MEMORY[0x23B841948](a2) == MEMORY[0x24BDACF78])
    return dump_info_from_xpc_msg(a1, a2, a3);
  dump_basic_type_from_xpc_msg(a1, a2, a3);
  return fputc(10, (FILE *)*MEMORY[0x24BDAC8E8]);
}

uint64_t parse_prefix(char *a1, _BYTE *a2)
{
  uint64_t result;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x24BDAC8D0];
  if (!strchr(a1, 58))
    return 2 * ((int)parse_string_into_data(a2, 8, a1) < 1);
  if (inet_pton(30, a1, v5) < 0)
    return 2;
  result = 0;
  *(_QWORD *)a2 = v5[0];
  return result;
}

const char *parse_node_type(const char *a1)
{
  const char *v2;

  v2 = "router";
  if (strcasecmp(a1, "router"))
  {
    if (strcasecmp(a1, "r"))
    {
      if (strcasecmp(a1, "2"))
      {
        if (strcasecmp(a1, "leader"))
        {
          if (strcasecmp(a1, "commissioner"))
          {
            v2 = "end-device";
            if (strcasecmp(a1, "end-device"))
            {
              if (strcasecmp(a1, "enddevice"))
              {
                if (strcasecmp(a1, "end"))
                {
                  if (strcasecmp(a1, "ed"))
                  {
                    if (strcasecmp(a1, "e"))
                    {
                      if (strcasecmp(a1, "3"))
                      {
                        v2 = "sleepy-end-device";
                        if (strcasecmp(a1, "sleepy-end-device"))
                        {
                          if (strcasecmp(a1, "sleepy"))
                          {
                            if (strcasecmp(a1, "sed"))
                            {
                              if (strcasecmp(a1, "s"))
                              {
                                if (strcasecmp(a1, "4"))
                                {
                                  v2 = "synchronized-sleepy-end-device";
                                  if (strcasecmp(a1, "synchronized-sleepy-end-device"))
                                  {
                                    if (strcasecmp(a1, "synchronized")
                                      && strcasecmp(a1, "ssed")
                                      && strcasecmp(a1, "ss")
                                      && strcasecmp(a1, "5"))
                                    {
                                      if (!strcasecmp(a1, "lurker")
                                        || !strcasecmp(a1, "nl-lurker")
                                        || !strcasecmp(a1, "l")
                                        || !strcasecmp(a1, "6"))
                                      {
                                        return "nl-lurker";
                                      }
                                      else
                                      {
                                        return "unknown";
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v2;
}

void *xpc_parse_network_info(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  const void *data;
  size_t length;

  string = xpc_dictionary_get_string(xdict, "kWPANTUNDProperty_NetworkName");
  snprintf((char *)a1, 0x11uLL, "%s", string);
  *(_QWORD *)(a1 + 24) = xpc_dictionary_get_uint64(xdict, "kWPANTUNDProperty_NetworkXPANID");
  *(_WORD *)(a1 + 18) = xpc_dictionary_get_uint64(xdict, "kWPANTUNDProperty_NetworkPANID");
  *(_BYTE *)(a1 + 33) = xpc_dictionary_get_int64(xdict, "kWPANTUNDProperty_NetworkNodeType");
  *(_WORD *)(a1 + 20) = xpc_dictionary_get_uint64(xdict, "kWPANTUNDProperty_NCPChannel");
  *(_BYTE *)(a1 + 32) = xpc_dictionary_get_int64(xdict, "RSSI");
  *(_BYTE *)(a1 + 17) = xpc_dictionary_get_BOOL(xdict, "kWPANTUNDProperty_NestLabs_NetworkAllowingJoin");
  length = 0;
  data = xpc_dictionary_get_data(xdict, "kWPANTUNDProperty_NCPHardwareAddress", &length);
  if (length < 9)
    return memcpy((void *)(a1 + 34), data, length);
  else
    return (void *)fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Invalid size:%zu for kWPANTUNDProperty_NCPHardwareAddress", length);
}

size_t print_error_diagnosis(size_t result)
{
  int v1;
  FILE *v2;
  const char *v3;
  size_t v4;
  FILE *v5;
  const char *v6;
  size_t v7;

  v1 = result;
  if ((int)result <= 1)
  {
    if ((int)result <= -38)
    {
      if ((_DWORD)result == -54)
      {
LABEL_17:
        v5 = (FILE *)*MEMORY[0x24BDAC8D8];
        v6 = "\n"
             "DIAGNOSIS: The NCP has unexpectedly crashed and rebooted. Please see the\n"
             "wpantund logs for more information and try again.\n"
             "\n";
        v7 = 125;
      }
      else
      {
        if ((_DWORD)result != -53)
          goto LABEL_19;
LABEL_15:
        v5 = (FILE *)*MEMORY[0x24BDAC8D8];
        v6 = "\n"
             "DIAGNOSIS: This action was aborted due to a change in the NCP's state.\n"
             "This can occur if the interface is disabled while you were trying to join,\n"
             "or if AutoDeepSleep kicked in for some reason.\n"
             "\n";
        v7 = 195;
      }
    }
    else
    {
      switch((_DWORD)result)
      {
        case 0xFFFFFFDB:
LABEL_9:
          v5 = (FILE *)*MEMORY[0x24BDAC8D8];
          v6 = "\n"
               "DIAGNOSIS: This error indicates that the device is not in a state where\n"
               "it can complete your request, typically because a request is already in progress or\n"
               "the NCP is already in the requested state.\n"
               "If you are getting this error persistently, you should try reseting the network\n"
               "settings on the NCP (via the \"leave\" command). The \"status\" command can be\n"
               "helpful to further diagnose the issue.\n"
               "\n";
          v7 = 395;
          break;
        case 0xFFFFFFEA:
LABEL_16:
          v5 = (FILE *)*MEMORY[0x24BDAC8D8];
          v6 = "\n"
               "DIAGNOSIS: This error indicates that either the device in a state where your\n"
               "request makes no sense or the parameters of your request were invalid. Check your\n"
               "arguments and verify that you are allowed to perform the given operation when the\n"
               "NCP is in its current state.\n"
               "\n";
          v7 = 272;
          break;
        case 0xFFFFFFF0:
LABEL_8:
          v5 = (FILE *)*MEMORY[0x24BDAC8D8];
          v6 = "\n"
               "DIAGNOSIS: The requested operation can't be completed because the NCP\n"
               "is busy doing something else, like scanning or joining. If you are persistently\n"
               "getting this error, try resetting the NCP via the \"reset\" command. You can\n"
               "help diagnose why this is occuring using the \"state\" command.\n"
               "\n";
          v7 = 289;
          break;
        default:
          goto LABEL_19;
      }
    }
    result = fwrite(v6, v7, 1uLL, v5);
LABEL_19:
    if ((v1 & 0xFFFF0000) == 0xEA0000)
      return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "\nDIAGNOSIS: This error is specific to this specific type of NCP. The error\ncode is %d (0x%02X). Consult the NCP documentation for an explantion of this\nerror code.\n\n", (unsigned __int16)v1, (unsigned __int16)v1);
    return result;
  }
  switch((int)result)
  {
    case 2:
      goto LABEL_16;
    case 3:
      v2 = (FILE *)*MEMORY[0x24BDAC8D8];
      v3 = "\n"
           "DIAGNOSIS: This error indicates that this operation is not valid when the interface\n"
           "is disabled. Enable the interface first and try again. You can enable the interface\n"
           "\n";
      v4 = 211;
      goto LABEL_25;
    case 4:
    case 12:
      goto LABEL_9;
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 21:
      goto LABEL_19;
    case 9:
      goto LABEL_8;
    case 11:
      goto LABEL_15;
    case 19:
      v2 = (FILE *)*MEMORY[0x24BDAC8D8];
      v3 = "\n"
           "DIAGNOSIS: This error indicates that the NCP could not find a device in\n"
           "range that would allow it to join the given network. This can occur if\n"
           "the closest device on the network you are trying to join is out of range,\n"
           "the devices on the network you are trying to join are running an\n"
           "incompatible network stack, or if there are no devices on the target\n"
           "network which are permitting joining.\n"
           "\n";
      v4 = 391;
      goto LABEL_25;
    case 20:
      v2 = (FILE *)*MEMORY[0x24BDAC8D8];
      v3 = "\n"
           "DIAGNOSIS: Join failed while authenticating. This is typically due to using the wrong\n"
           "key or because this NCP's network stack is not compatible with this network.\n"
           "\n";
      v4 = 165;
      goto LABEL_25;
    case 22:
      goto LABEL_17;
    default:
      if ((_DWORD)result == 33)
      {
        v2 = (FILE *)*MEMORY[0x24BDAC8D8];
        v3 = "\nDIAGNOSIS: Entitlement Check Failed for this property.\n\n";
        v4 = 57;
      }
      else
      {
        if ((_DWORD)result != 28)
          goto LABEL_19;
        v2 = (FILE *)*MEMORY[0x24BDAC8D8];
        v3 = "\n"
             "DIAGNOSIS: The requested operation can't be completed because the given\n"
             "network interface doesn't exist or it isn't managed by wpantund. If you are\n"
             "\n";
        v4 = 375;
      }
LABEL_25:
      result = fwrite(v3, v4, 1uLL, v2);
      break;
  }
  return result;
}

uint64_t node_type_str2int(const char *a1)
{
  uint64_t result;

  if (!strcasecmp(a1, "router") || !strcasecmp(a1, "r"))
  {
    LOWORD(result) = 2;
  }
  else if (!strcasecmp(a1, "end-device") || !strcasecmp(a1, "end") || !strcasecmp(a1, "e"))
  {
    LOWORD(result) = 3;
  }
  else if (!strcasecmp(a1, "sleepy-end-device")
         || !strcasecmp(a1, "sleepy")
         || !strcasecmp(a1, "sed")
         || !strcasecmp(a1, "s"))
  {
    LOWORD(result) = 4;
  }
  else if (!strcasecmp(a1, "lurker") || !strcasecmp(a1, "nl-lurker") || !strcasecmp(a1, "l"))
  {
    LOWORD(result) = 6;
  }
  else
  {
    LOWORD(result) = strtol(a1, 0, 0);
  }
  return (unsigned __int16)result;
}

const char *node_type_int2str(int a1)
{
  if ((a1 - 2) > 4)
    return "unknown";
  else
    return off_250B200C8[(__int16)(a1 - 2)];
}

const char *joiner_state_int2str(int a1)
{
  if ((a1 - 1) > 4)
    return "idle";
  else
    return off_250B200F0[(char)(a1 - 1)];
}

void CtrXpcClient_form_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully formed!\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FD854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_form_interface_helper@<D0>(xpc_object_t *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  double result;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t object;
  _OWORD buf[16];
  uint8_t v19[4];
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2[5];
  v26 = a2[4];
  *(_OWORD *)v27 = v5;
  *(_QWORD *)&v27[16] = *((_QWORD *)a2 + 12);
  v6 = a2[1];
  v22 = *a2;
  v23 = v6;
  v7 = a2[3];
  v24 = a2[2];
  v25 = v7;
  v8 = (const char *)*((_QWORD *)&v26 + 1);
  if (!*((_QWORD *)&v26 + 1))
  {
    v8 = "router";
    *((_QWORD *)&v26 + 1) = "router";
  }
  if (!(_QWORD)v22)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "Network Name not Given");
    *(_DWORD *)a3 = 10;
    goto LABEL_59;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 136315394;
    *(_QWORD *)((char *)buf + 4) = v22;
    WORD6(buf[0]) = 2080;
    *(_QWORD *)((char *)buf + 14) = v8;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Forming WPAN \"%s\" as node type \"%s\"", (uint8_t *)buf, 0x16u);
  }
  if (BYTE8(v22))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_14;
    LODWORD(buf[0]) = 67109120;
    DWORD1(buf[0]) = WORD5(v22);
    v9 = MEMORY[0x24BDACB70];
    v10 = ", channel:%d";
  }
  else
  {
    if (!BYTE12(v22) || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_14;
    LODWORD(buf[0]) = 67109120;
    DWORD1(buf[0]) = v23;
    v9 = MEMORY[0x24BDACB70];
    v10 = ", channel-mask:0x%x";
  }
  _os_log_impl(&dword_23A0F8000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)buf, 8u);
LABEL_14:
  if (BYTE4(v23) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 67109120;
    DWORD1(buf[0]) = WORD3(v23);
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ", panid:0x%04X", (uint8_t *)buf, 8u);
  }
  if (BYTE8(v23) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v24;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ", xpanid:0x%016llX", (uint8_t *)buf, 0xCu);
  }
  if (BYTE8(v24))
  {
    encode_data_into_string((unint64_t)&v24 + 9, 16, buf, 0x24uLL, 0);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LODWORD(v21) = 136315138;
      *(_QWORD *)((char *)&v21 + 4) = buf;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ", key:[%s]", (uint8_t *)&v21, 0xCu);
    }
  }
  if (BYTE9(v25) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 67109120;
    DWORD1(buf[0]) = HIDWORD(v25);
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ", key-index:%d", (uint8_t *)buf, 8u);
  }
  if (v27[0])
  {
    memset((char *)buf + 2, 0, 44);
    LOWORD(buf[0]) = 14906;
    v21 = *(unint64_t *)&v27[1];
    inet_ntop(30, &v21, (char *)buf, 0x2Eu);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v19 = 136315138;
      v20 = buf;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ", mesh-local-prefix:\"%s\"", v19, 0xCu);
    }
  }
  if (v27[9])
  {
    memset((char *)buf + 2, 0, 44);
    LOWORD(buf[0]) = 14906;
    v21 = *(unint64_t *)&v27[10];
    inet_ntop(30, &v21, (char *)buf, 0x2Eu);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v19 = 136315138;
      v20 = buf;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, ", legacy-prefix:\"%s\"", v19, 0xCu);
    }
  }
  snprintf((char *)buf, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v16 = xpc_string_create("org.wpantund.v1");
  if (!v16)
    v16 = xpc_null_create();
  *(_QWORD *)&v21 = a1;
  *((_QWORD *)&v21 + 1) = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v21, &v16, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v16);
  v16 = 0;
  v14 = xpc_string_create((const char *)buf);
  if (!v14)
    v14 = xpc_null_create();
  *(_QWORD *)&v21 = a1;
  *((_QWORD *)&v21 + 1) = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v21, &v14, &v15);
  xpc_release(v15);
  v15 = 0;
  xpc_release(v14);
  v14 = 0;
  v12 = xpc_string_create("Form");
  if (!v12)
    v12 = xpc_null_create();
  *(_QWORD *)&v21 = a1;
  *((_QWORD *)&v21 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v21, &v12, &v13);
  xpc_release(v13);
  v13 = 0;
  xpc_release(v12);
  v12 = 0;
  xpc_dictionary_set_string(*a1, "network_name", (const char *)v22);
  if ((_BYTE)v26)
    xpc_dictionary_set_string(*a1, "node_type", *((const char **)&v26 + 1));
  if (BYTE8(v22))
    xpc_dictionary_set_uint64(*a1, "channel", WORD5(v22));
  if (BYTE12(v22))
    xpc_dictionary_set_uint64(*a1, "channel_mask", v23);
  if (BYTE4(v23))
    xpc_dictionary_set_uint64(*a1, "panid", WORD3(v23));
  if (BYTE8(v23))
    xpc_dictionary_set_uint64(*a1, "xpanid", v24);
  if (BYTE8(v24))
    xpc_dictionary_set_data(*a1, "network_key", (char *)&v24 + 9, 0x10uLL);
  if (BYTE9(v25))
    xpc_dictionary_set_uint64(*a1, "key_index", HIDWORD(v25));
  if (v27[0])
    xpc_dictionary_set_data(*a1, "mesh_local_prefix", &v27[1], 8uLL);
  if (v27[9])
    xpc_dictionary_set_data(*a1, "legacy_prefix", &v27[10], 8uLL);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(v21) = 136315138;
    *(_QWORD *)((char *)&v21 + 4) = v22;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Forming WPAN \"%s\"\n", (uint8_t *)&v21, 0xCu);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
LABEL_59:
  result = *(double *)buf;
  *(_OWORD *)(a3 + 8) = buf[0];
  *(_QWORD *)(a3 + 24) = *(_QWORD *)&buf[1];
  return result;
}

void sub_23A0FDF70(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_join_response_helper(uint64_t a1, xpc_object_t *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int int64;
  const char *string;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      CtrXpcClient_join_response_helper(v4, v5, v6, v7, v8, v9, v10, v11);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v12 = 11;
    goto LABEL_19;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64 == -36 || int64 == 12)
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v16)
      CtrXpcClient_join_response_helper(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_18;
  }
  if (int64)
  {
    v24 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v24, int64);
LABEL_18:
    v25 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v25);
    v12 = 3;
LABEL_19:
    *(_DWORD *)a1 = v12;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Joined network.\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_20:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FE15C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *CtrXpcClient_join_interface_helper@<X0>(xpc_object_t *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v4;
  const char *v5;
  _QWORD *result;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t object;
  char __str[16];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a2[1];
  v23 = *a2;
  v24 = v4;
  v25 = a2[2];
  v26 = *((_QWORD *)a2 + 6);
  v5 = (const char *)v23;
  if ((_QWORD)v23)
  {
    snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
    v19 = xpc_string_create("org.wpantund.v1");
    if (!v19)
      v19 = xpc_null_create();
    *(_QWORD *)&v9 = a1;
    *((_QWORD *)&v9 + 1) = "interface";
    xpc::dict::object_proxy::operator=((uint64_t)&v9, &v19, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v19);
    v19 = 0;
    v17 = xpc_string_create(__str);
    if (!v17)
      v17 = xpc_null_create();
    *(_QWORD *)&v9 = a1;
    *((_QWORD *)&v9 + 1) = "path";
    xpc::dict::object_proxy::operator=((uint64_t)&v9, &v17, &v18);
    xpc_release(v18);
    v18 = 0;
    xpc_release(v17);
    v17 = 0;
    v15 = xpc_string_create("Join");
    if (!v15)
      v15 = xpc_null_create();
    *(_QWORD *)&v9 = a1;
    *((_QWORD *)&v9 + 1) = "method";
    xpc::dict::object_proxy::operator=((uint64_t)&v9, &v15, &v16);
    xpc_release(v16);
    v16 = 0;
    xpc_release(v15);
    v15 = 0;
    v13 = xpc_string_create(v5);
    if (!v13)
      v13 = xpc_null_create();
    *(_QWORD *)&v9 = a1;
    *((_QWORD *)&v9 + 1) = "network_name";
    xpc::dict::object_proxy::operator=((uint64_t)&v9, &v13, &v14);
    xpc_release(v14);
    v14 = 0;
    xpc_release(v13);
    v13 = 0;
    v11 = xpc_string_create(*((const char **)&v23 + 1));
    if (!v11)
      v11 = xpc_null_create();
    *(_QWORD *)&v9 = a1;
    *((_QWORD *)&v9 + 1) = "node_type";
    xpc::dict::object_proxy::operator=((uint64_t)&v9, &v11, &v12);
    xpc_release(v12);
    v12 = 0;
    xpc_release(v11);
    v11 = 0;
    if ((_BYTE)v26)
      xpc_dictionary_set_uint64(*a1, "channel", (unsigned __int16)v24);
    if (BYTE1(v26))
      xpc_dictionary_set_uint64(*a1, "panid", WORD1(v24));
    if (BYTE2(v26))
      xpc_dictionary_set_uint64(*a1, "xpanid", *((uint64_t *)&v24 + 1));
    if (BYTE3(v26))
      xpc_dictionary_set_data(*a1, "network_key", &v25, 0x10uLL);
    result = std::string::basic_string[abi:ne180100]<0>(&v9, (char *)&unk_23A11B5CA);
    *(_DWORD *)a3 = 0;
    *(_OWORD *)(a3 + 8) = v9;
    v8 = v10;
  }
  else
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "Network name is not given");
    *(_DWORD *)a3 = 10;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)__str;
    v8 = v22;
  }
  *(_QWORD *)(a3 + 24) = v8;
  return result;
}

void sub_23A0FE468(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void CtrXpcClient_stopFWUpdate_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_stopFWUpdate_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully stopped FW update... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A0FE6AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_stopFWUpdate_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v5;
  uint64_t v6;
  xpc_object_t object;
  xpc_object_t v8;

  object = xpc_string_create("stopFWUpdate");
  if (!object)
    object = xpc_null_create();
  *(_QWORD *)&v5 = a1;
  *((_QWORD *)&v5 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v5, &object, &v8);
  xpc_release(v8);
  v8 = 0;
  xpc_release(object);
  object = 0;
  xpc_dictionary_set_string(*a1, "property_name", "stopFWUpdate");
  std::string::basic_string[abi:ne180100]<0>(&v5, (char *)&unk_23A11B5CA);
  *(_DWORD *)a2 = 0;
  result = *(double *)&v5;
  *(_OWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

void CtrXpcClient_provideExtendedMACAddress_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;
  _QWORD v9[2];
  xpc_object_t object;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_provideExtendedMACAddress_response_helper(v6, int64);
      if (xpc_dictionary_get_value(*a2, "delayWedConnectionRetryRequest"))
      {
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
        __p.__r_.__value_.__l.__size_ = (std::string::size_type)"delayWedConnectionRetryRequest";
        v9[0] = a2;
        v9[1] = "PropVal";
        xpc::dict::object_proxy::operator=((uint64_t)v9, (uint64_t)&__p, &object);
        xpc_release(object);
        object = 0;
      }
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully attached... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A0FE960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_provideExtendedMACAddress_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const char *v5;
  double result;
  __int128 v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t object;

  v5 = *(const char **)(a2 + 48);
  v9 = xpc_string_create("provideEmac");
  if (!v9)
    v9 = xpc_null_create();
  *(_QWORD *)&v7 = a1;
  *((_QWORD *)&v7 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v7, &v9, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v9);
  v9 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "provideEmac");
  if (v5)
    xpc_dictionary_set_string(*a1, "extendedMACAddress", v5);
  std::string::basic_string[abi:ne180100]<0>(&v7, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)&v7;
  *(_OWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 24) = v8;
  return result;
}

double CtrXpcClient_sendnwdiaggetreq_interface_helper@<D0>(xpc_object_t *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v5;
  double result;
  __int128 v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t object;
  char __str[256];
  __int128 bytes;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2[1];
  bytes = *a2;
  v17 = v5;
  v18 = *((_DWORD *)a2 + 8);
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v13 = xpc_string_create("org.wpantund.v1");
  if (!v13)
    v13 = xpc_null_create();
  *(_QWORD *)&v7 = a1;
  *((_QWORD *)&v7 + 1) = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v7, &v13, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v13);
  v13 = 0;
  v11 = xpc_string_create(__str);
  if (!v11)
    v11 = xpc_null_create();
  *(_QWORD *)&v7 = a1;
  *((_QWORD *)&v7 + 1) = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v7, &v11, &v12);
  xpc_release(v12);
  v12 = 0;
  xpc_release(v11);
  v11 = 0;
  v9 = xpc_string_create("NetworkDiagnostics");
  if (!v9)
    v9 = xpc_null_create();
  *(_QWORD *)&v7 = a1;
  *((_QWORD *)&v7 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v7, &v9, &v10);
  xpc_release(v10);
  v10 = 0;
  xpc_release(v9);
  v9 = 0;
  xpc_dictionary_set_data(*a1, "destination", &bytes, (unsigned __int16)v18);
  xpc_dictionary_set_data(*a1, "tlv", &v17, HIWORD(v18));
  std::string::basic_string[abi:ne180100]<0>(&v7, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)&v7;
  *(_OWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 24) = v8;
  return result;
}

void sub_23A0FEC44(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_sendnwdiaggetreq_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  const char *v7;
  char *v8;
  std::string::size_type v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  std::string __p;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  v7 = xpc_dictionary_get_string(*a2, "property_name");
  if (int64)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper((uint64_t)string, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  v9 = (std::string::size_type)v7;
  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v10)
    {
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v9;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Sucessfully sent nw diag req - \"%s\" \n";
LABEL_18:
      _os_log_impl(&dword_23A0F8000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&__p, 0xCu);
    }
  }
  else if (v10)
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)string;
    v11 = MEMORY[0x24BDACB70];
    v12 = "Sucessfully sent nw diag req method- \"%s\" \n";
    goto LABEL_18;
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A0FEE80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXpcClient_captureTriggerData_interface_helper()
{
  xpc_object_t *v0;
  uint64_t v1;
  uint64_t v2;
  const Ctr_triggerBasedStats *v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  xpc_object_t v8;
  xpc_object_t object;
  _BYTE v10[8];
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  char v15;

  v0 = (xpc_object_t *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  Ctr_triggerBasedStats::Ctr_triggerBasedStats((Ctr_triggerBasedStats *)v10, v3);
  v8 = xpc_string_create("getTriggerBasedStats");
  if (!v8)
    v8 = xpc_null_create();
  *(_QWORD *)&v6 = v0;
  *((_QWORD *)&v6 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v6, &v8, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v8);
  v8 = 0;
  xpc_dictionary_set_string(*v0, "property_name", "getTriggerBasedStats");
  xpc_dictionary_set_uint64(*v0, "triggerType", v13);
  xpc_dictionary_set_uint64(*v0, "triggerId", v14);
  std::string::basic_string[abi:ne180100]<0>(&v6, (char *)&unk_23A11B5CA);
  v4 = &v15;
  *(_DWORD *)v2 = 0;
  *(_OWORD *)(v2 + 8) = v6;
  *(_QWORD *)(v2 + 24) = v7;
  v5 = -5600;
  do
  {
    if (*v4 < 0)
      operator delete(*(void **)(v4 - 23));
    if (*(v4 - 24) < 0)
      operator delete(*(void **)(v4 - 47));
    v4 -= 56;
    v5 += 56;
  }
  while (v5);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult(&v12);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult(&v11);
}

void sub_23A0FF010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  Ctr_triggerBasedStats::~Ctr_triggerBasedStats((void **)va);
  _Unwind_Resume(a1);
}

void Ctr_triggerBasedStats::~Ctr_triggerBasedStats(void **this)
{
  char *v2;
  uint64_t v3;

  v2 = (char *)this + 42799;
  v3 = -5600;
  do
  {
    if (*v2 < 0)
      operator delete(*(void **)(v2 - 23));
    if (*(v2 - 24) < 0)
      operator delete(*(void **)(v2 - 47));
    v2 -= 56;
    v3 += 56;
  }
  while (v3);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult(this + 2325);
  Ctr_triggerStatsResult::~Ctr_triggerStatsResult(this + 1);
}

void CtrXpcClient_captureTriggerData_response_helper(_DWORD *a1, xpc_object_t *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__p[2];
  char v21;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACF78])
  {
    xpc_array_get_count(*a2);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_23A11B5CA);
    *a1 = 0;
    std::string::operator=[abi:ne180100]((uint64_t)(a1 + 2), (__int128 *)__p);
    if (v21 < 0)
      operator delete(__p[0]);
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      CtrXpcClient_captureTriggerData_response_helper(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Reply is not a dictionary");
    *a1 = 11;
    std::string::operator=[abi:ne180100]((uint64_t)(a1 + 2), (__int128 *)__p);
    if (v21 < 0)
      operator delete(__p[0]);
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      CtrXpcClient_captureTriggerData_response_helper(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

void Ctr_triggerBasedStats::Ctr_triggerBasedStats(Ctr_triggerBasedStats *this, const Ctr_triggerBasedStats *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;

  *(_QWORD *)this = *(_QWORD *)a2;
  Ctr_triggerStatsResult::Ctr_triggerStatsResult((Ctr_triggerBasedStats *)((char *)this + 8), (const Ctr_triggerBasedStats *)((char *)a2 + 8));
  Ctr_triggerStatsResult::Ctr_triggerStatsResult((Ctr_triggerBasedStats *)((char *)this + 18600), (const Ctr_triggerBasedStats *)((char *)a2 + 18600));
  v4 = 0;
  *(_OWORD *)((char *)this + 37192) = *(_OWORD *)((char *)a2 + 37192);
  v5 = (char *)a2 + 37256;
  v6 = (char *)a2 + 37232;
  v7 = (char *)a2 + 37208;
  v8 = 100;
  do
  {
    std::string::basic_string((std::string *)((char *)this + v4 + 37208), (const std::string *)&v7[v4]);
    std::string::basic_string((std::string *)((char *)this + v4 + 37232), (const std::string *)&v6[v4]);
    *(_WORD *)((char *)this + v4 + 37256) = *(_WORD *)&v5[v4];
    v4 += 56;
    --v8;
  }
  while (v8);
}

void sub_23A0FF264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, Ctr_triggerStatsResult *a10)
{
  void **v10;

  Ctr_triggerStatsResult::~Ctr_triggerStatsResult(v10);
  _Unwind_Resume(a1);
}

void Ctr_triggerAccessoryInfoInput::~Ctr_triggerAccessoryInfoInput(void **this)
{
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void Ctr_triggerStatsResult::Ctr_triggerStatsResult(Ctr_triggerStatsResult *this, const Ctr_triggerStatsResult *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  char *v10;
  uint64_t v11;

  v4 = *(_OWORD *)a2;
  v5 = *((_OWORD *)a2 + 1);
  v6 = *((_OWORD *)a2 + 2);
  *((_WORD *)this + 24) = *((_WORD *)a2 + 24);
  *((_OWORD *)this + 1) = v5;
  *((_OWORD *)this + 2) = v6;
  *(_OWORD *)this = v4;
  std::string::basic_string((std::string *)((char *)this + 56), (const std::string *)((char *)a2 + 56));
  *((_DWORD *)this + 20) = *((_DWORD *)a2 + 20);
  std::string::basic_string((std::string *)((char *)this + 88), (const std::string *)((char *)a2 + 88));
  v7 = *((_OWORD *)a2 + 7);
  *((_QWORD *)this + 16) = *((_QWORD *)a2 + 16);
  *((_OWORD *)this + 7) = v7;
  std::string::basic_string((std::string *)((char *)this + 136), (const std::string *)((char *)a2 + 136));
  v8 = 0;
  v9 = *((_OWORD *)a2 + 11);
  *((_OWORD *)this + 10) = *((_OWORD *)a2 + 10);
  *((_OWORD *)this + 11) = v9;
  v10 = (char *)a2 + 192;
  v11 = 100;
  do
  {
    Ctr_triggerAccessoryStatsResult::Ctr_triggerAccessoryStatsResult((Ctr_triggerStatsResult *)((char *)this + v8 + 192), (const std::string *)&v10[v8]);
    v8 += 184;
    --v11;
  }
  while (v11);
}

void sub_23A0FF3D0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;

  if (*(char *)(v1 + 111) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 79) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void Ctr_triggerAccessoryStatsResult::~Ctr_triggerAccessoryStatsResult(void **this)
{
  if (*((char *)this + 95) < 0)
    operator delete(this[9]);
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void Ctr_triggerAccessoryStatsResult::Ctr_triggerAccessoryStatsResult(Ctr_triggerAccessoryStatsResult *this, const std::string *a2)
{
  std::string *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = std::string::basic_string((std::string *)this, a2);
  std::string::basic_string(v4 + 1, a2 + 1);
  std::string::basic_string((std::string *)this + 2, a2 + 2);
  std::string::basic_string((std::string *)this + 3, a2 + 3);
  v5 = *(_OWORD *)&a2[4].__r_.__value_.__r.__words[2];
  *((_OWORD *)this + 6) = *(_OWORD *)&a2[4].__r_.__value_.__l.__data_;
  *((_OWORD *)this + 7) = v5;
  v6 = *(_OWORD *)&a2[5].__r_.__value_.__r.__words[1];
  v7 = *(_OWORD *)&a2[6].__r_.__value_.__l.__data_;
  v8 = *(_OWORD *)&a2[6].__r_.__value_.__r.__words[2];
  *((_BYTE *)this + 176) = a2[7].__r_.__value_.__s.__data_[8];
  *((_OWORD *)this + 9) = v7;
  *((_OWORD *)this + 10) = v8;
  *((_OWORD *)this + 8) = v6;
}

void sub_23A0FF510(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;

  if (*(char *)(v1 + 71) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void Ctr_triggerStatsResult::~Ctr_triggerStatsResult(void **this)
{
  uint64_t v2;
  char *v3;
  void **v4;

  v2 = 0;
  v3 = (char *)this + 18503;
  do
  {
    v4 = &this[v2];
    if (v3[v2 * 8] < 0)
      operator delete(v4[2310]);
    if (v3[v2 * 8 - 24] < 0)
      operator delete(this[v2 + 2307]);
    if (v3[v2 * 8 - 48] < 0)
      operator delete(this[v2 + 2304]);
    if (v3[v2 * 8 - 72] < 0)
      operator delete(v4[2301]);
    v2 -= 23;
  }
  while (v2 != -2300);
  if (*((char *)this + 159) < 0)
    operator delete(this[17]);
  if (*((char *)this + 111) < 0)
    operator delete(this[11]);
  if (*((char *)this + 79) < 0)
    operator delete(this[7]);
}

void sub_23A0FF6AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CtrXPC::Client::State::~State(CtrXPC::Client::State *this)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_250B201D8;
  if (*((_QWORD *)this + 19))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *((const void **)this + 23), *((CFNotificationName *)this + 19), 0);
    v3 = *((_QWORD *)this + 23);
    if (v3)
    {
      v4 = std::weak_ptr<ctu::XpcClient>::~weak_ptr(v3);
      MEMORY[0x23B84139C](v4, 0x20C40A4A59CD2);
      *((_QWORD *)this + 23) = 0;
    }
    CFRelease(*((CFTypeRef *)this + 19));
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = (_QWORD *)((char *)this + 48);
    if (*((char *)this + 71) < 0)
      v5 = (_QWORD *)*v5;
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Client \"%s\" Destroyed, Release Notification Center Observer", (uint8_t *)&v6, 0xCu);
  }
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)this + 160);
  if (*((char *)this + 143) < 0)
    operator delete(*((void **)this + 15));
  if (*((char *)this + 119) < 0)
    operator delete(*((void **)this + 12));
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  ctu::XpcClient::~XpcClient(this);
}

{
  CtrXPC::Client::State::~State(this);
  JUMPOUT(0x23B84139CLL);
}

void sub_23A0FF844(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void CtrXPC::Client::State::Parameters::~Parameters(void **this)
{
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void CtrXPC::Client::State::handleDaemonReadyNotificationStatic(CtrXPC::Client::State *this, __CFNotificationCenter *a2, const __CFString *a3, const __CFString *a4, const void *a5, const __CFDictionary *a6)
{
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(v8) = 136315138;
    *(_QWORD *)((char *)&v8 + 4) = CFStringGetCStringPtr(a3, 0x8000100u);
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Client received notification: %s", (uint8_t *)&v8, 0xCu);
  }
  if (a2)
  {
    std::weak_ptr<CtrXPC::Client::State>::lock(a2, &v8);
    if ((_QWORD)v8)
      CtrXPC::Client::State::handleDaemonReady((CtrXPC::Client::State *)v8);
    if (*((_QWORD *)&v8 + 1))
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
  }
}

std::__shared_weak_count *std::weak_ptr<CtrXPC::Client::State>::lock@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  std::__shared_weak_count *result;

  *a2 = 0;
  a2[1] = 0;
  result = (std::__shared_weak_count *)a1[1];
  if (result)
  {
    result = std::__shared_weak_count::lock(result);
    a2[1] = result;
    if (result)
      *a2 = *a1;
  }
  return result;
}

void CtrXPC::Client::State::handleDaemonReady(CtrXPC::Client::State *this)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 0x40000000;
  v1[2] = ___ZN6CtrXPC6Client5State17handleDaemonReadyEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_65;
  v1[4] = this;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)this + 1, (uint64_t)v1);
}

void CtrXPC::Client::create(CtrXPC::Client *this@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *p_shared_owners;
  unint64_t v11;
  xpc_object_t *v12;
  std::__shared_weak_count *v13;
  xpc_object_t v14;
  xpc_object_t *v15;
  std::__shared_weak_count *v16;
  xpc_object_t v17;
  xpc_object_t object;
  xpc_object_t v19;

  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (v5)
  {
    v19 = v5;
  }
  else
  {
    v6 = xpc_null_create();
    v19 = v6;
    if (!v6)
    {
      v7 = xpc_null_create();
      v6 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23B841948](v6) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v6);
    goto LABEL_9;
  }
  v7 = xpc_null_create();
LABEL_8:
  v19 = v7;
LABEL_9:
  xpc_release(v6);
  v17 = xpc_string_create((const char *)this);
  if (!v17)
    v17 = xpc_null_create();
  v15 = &v19;
  v16 = (std::__shared_weak_count *)"ClientHostName";
  xpc::dict::object_proxy::operator=((uint64_t)&v15, &v17, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v17);
  v17 = 0;
  v14 = v19;
  if (v19)
    xpc_retain(v19);
  else
    v14 = xpc_null_create();
  CtrXPC::Client::State::create(&v14, (uint64_t)&v15);
  xpc_release(v14);
  v14 = 0;
  v8 = (_QWORD *)operator new();
  v9 = (uint64_t)v8;
  v12 = v15;
  v13 = v16;
  if (v16)
  {
    p_shared_owners = &v16->__shared_owners_;
    do
      v11 = __ldxr((unint64_t *)p_shared_owners);
    while (__stxr(v11 + 1, (unint64_t *)p_shared_owners));
  }
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](v8, &v12);
  std::shared_ptr<CtrXPC::Client>::shared_ptr[abi:ne180100]<CtrXPC::Client,void>(a2, v9);
  if (v13)
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  if (v16)
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  xpc_release(v19);
}

void sub_23A0FFBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v12;

  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  xpc::dict::~dict((xpc_object_t *)(v12 - 40));
  _Unwind_Resume(a1);
}

void CtrXPC::Client::State::create(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  std::string::size_type size;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::string v19;
  std::string v20;
  std::string v21;
  _QWORD *v22;
  const char *v23;
  xpc_object_t object;
  void *__p[2];
  char v26;
  __int128 __str;
  __int128 __str_16;
  __int128 v29;
  std::string v30;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  if (MEMORY[0x23B841948](*a1) == MEMORY[0x24BDACFA0])
  {
    v29 = 0u;
    memset(&v30, 0, sizeof(v30));
    __str_16 = 0u;
    __str = 0u;
    v22 = a1;
    v23 = "ServiceXPCName";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v22, &object);
    xpc::dyn_cast_or_default((xpc *)&object, (const object *)"com.apple.wpantund.xpc", v4);
    std::string::operator=[abi:ne180100]((uint64_t)&__str, (__int128 *)__p);
    if (v26 < 0)
      operator delete(__p[0]);
    xpc_release(object);
    v22 = a1;
    v23 = "ServiceNotificationName";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v22, &object);
    xpc::dyn_cast_or_default((xpc *)&object, (const object *)"wpantund.daemon.ready", v5);
    std::string::operator=[abi:ne180100]((uint64_t)&__str_16 + 8, (__int128 *)__p);
    if (v26 < 0)
      operator delete(__p[0]);
    xpc_release(object);
    v22 = a1;
    v23 = "ClientHostName";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v22, &object);
    xpc::dyn_cast_or_default((xpc *)&object, (const object *)&unk_23A11B5CA, v6);
    std::string::operator=[abi:ne180100]((uint64_t)&v30, (__int128 *)__p);
    if (v26 < 0)
      operator delete(__p[0]);
    xpc_release(object);
    v7 = BYTE7(__str_16);
    if (SBYTE7(__str_16) < 0)
      v7 = *((_QWORD *)&__str + 1);
    if (v7)
    {
      v8 = HIBYTE(v29);
      if (v29 < 0)
        v8 = v29;
      if (v8)
      {
        size = HIBYTE(v30.__r_.__value_.__r.__words[2]);
        if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          size = v30.__r_.__value_.__l.__size_;
        if (size)
        {
          v10 = operator new();
          std::string::basic_string(&v19, (const std::string *)&__str);
          std::string::basic_string(&v20, (const std::string *)((char *)&__str_16 + 8));
          std::string::basic_string(&v21, &v30);
          CtrXPC::Client::State::State(v10, (uint64_t)&v19);
          std::shared_ptr<CtrXPC::Client::State>::shared_ptr[abi:ne180100]<CtrXPC::Client::State,void>((uint64_t *)__p, v10);
          std::shared_ptr<CtrXPC::Command>::operator=[abi:ne180100](a2, (__int128 *)__p);
          if (__p[1])
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
          if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v21.__r_.__value_.__l.__data_);
          if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v20.__r_.__value_.__l.__data_);
          if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v19.__r_.__value_.__l.__data_);
          CtrXPC::Client::State::init(*(CtrXPC::Client::State **)a2);
        }
      }
    }
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v30.__r_.__value_.__l.__data_);
    if (SHIBYTE(v29) < 0)
      operator delete(*((void **)&__str_16 + 1));
    if (SBYTE7(__str_16) < 0)
      operator delete((void *)__str);
  }
  if (!*(_QWORD *)a2)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      CtrXPC::Client::State::create(v11, v12, v13, v14, v15, v16, v17, v18);
    __assert_rtn("create", "CtrXPCClient.cpp", 158, "false");
  }
}

void sub_23A0FFF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,xpc_object_t object,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  uint64_t v31;

  CtrXPC::Client::State::Parameters::~Parameters(&a10);
  CtrXPC::Client::State::Parameters::~Parameters(&a31);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](v31);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::create(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  xpc_object_t object;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v3 = *a1;
  object = v3;
  if (v3)
    xpc_retain(v3);
  else
    object = xpc_null_create();
  CtrXPC::Client::State::create(&object, (uint64_t)&v11);
  xpc_release(object);
  object = 0;
  v4 = (_QWORD *)operator new();
  v5 = (uint64_t)v4;
  v8 = v11;
  v9 = v12;
  if (v12)
  {
    p_shared_owners = &v12->__shared_owners_;
    do
      v7 = __ldxr((unint64_t *)p_shared_owners);
    while (__stxr(v7 + 1, (unint64_t *)p_shared_owners));
  }
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](v4, &v8);
  std::shared_ptr<CtrXPC::Client>::shared_ptr[abi:ne180100]<CtrXPC::Client,void>(a2, v5);
  if (v9)
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  if (v12)
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
}

void sub_23A1000CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::~Client(CtrXPC::Client *this)
{
  _QWORD *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v2 = (_QWORD *)(*(_QWORD *)this + 48);
    if (*(char *)(*(_QWORD *)this + 71) < 0)
      v2 = (_QWORD *)*v2;
    v3 = 136315138;
    v4 = v2;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Client \"%s\" Destroyed", (uint8_t *)&v3, 0xCu);
  }
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void CtrXPC::Client::setEventHandler(uint64_t *a1, const std::string *a2, void *aBlock, NSObject *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *aBlocka;
  dispatch_object_t object;
  std::string v12;
  void *v13;
  NSObject *v14;

  if (aBlock)
  {
    v7 = _Block_copy(aBlock);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (a4)
LABEL_3:
    dispatch_retain(a4);
LABEL_4:
  v13 = v7;
  v14 = a4;
  v8 = *a1;
  std::string::basic_string(&v12, a2);
  if (v7)
    v9 = _Block_copy(v7);
  else
    v9 = 0;
  aBlocka = v9;
  object = a4;
  if (a4)
    dispatch_retain(a4);
  CtrXPC::Client::State::setEventHandler(v8, &v12, (uint64_t)&aBlocka);
  if (object)
    dispatch_release(object);
  if (aBlocka)
    _Block_release(aBlocka);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (a4)
    dispatch_release(a4);
  if (v7)
    _Block_release(v7);
}

{
  void *v7;
  uint64_t v8;
  void *v9;
  void *aBlocka;
  dispatch_object_t object;
  std::string v12;
  void *v13;
  NSObject *v14;

  if (aBlock)
  {
    v7 = _Block_copy(aBlock);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (a4)
LABEL_3:
    dispatch_retain(a4);
LABEL_4:
  v13 = v7;
  v14 = a4;
  v8 = *a1;
  std::string::basic_string(&v12, a2);
  if (v7)
    v9 = _Block_copy(v7);
  else
    v9 = 0;
  aBlocka = v9;
  object = a4;
  if (a4)
    dispatch_retain(a4);
  CtrXPC::Client::State::setEventHandler(v8, &v12, (uint64_t)&aBlocka);
  if (object)
    dispatch_release(object);
  if (aBlocka)
    _Block_release(aBlocka);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (a4)
    dispatch_release(a4);
  if (v7)
    _Block_release(v7);
}

void sub_23A1002C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback((uint64_t)&a10);
  if (a17 < 0)
    operator delete(__p);
  dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::State::setEventHandler(uint64_t a1, const std::string *a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[5];
  std::string __p;
  void *aBlock;
  dispatch_object_t object;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1174405120;
  v8[2] = ___ZN6CtrXPC6Client5State15setEventHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS2_10shared_ptrINS_5EventEEEEEE_block_invoke;
  v8[3] = &__block_descriptor_tmp_129;
  v8[4] = a1;
  std::string::basic_string(&__p, a2);
  v5 = *(void **)a3;
  if (*(_QWORD *)a3)
    v5 = _Block_copy(v5);
  v6 = (_QWORD *)(a1 + 8);
  v7 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  object = v7;
  if (v7)
    dispatch_retain(v7);
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v6, (uint64_t)v8);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void sub_23A1004E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback((uint64_t)&a10);
  if (a17 < 0)
    operator delete(__p);
  dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback((uint64_t)&a18);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::setEventHandler(uint64_t *a1, const std::string *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *aBlock;
  dispatch_object_t object;
  std::string v9;

  v4 = *a1;
  std::string::basic_string(&v9, a2);
  v5 = *(void **)a3;
  if (*(_QWORD *)a3)
    v5 = _Block_copy(v5);
  v6 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  object = v6;
  if (v6)
    dispatch_retain(v6);
  CtrXPC::Client::State::setEventHandler(v4, &v9, (uint64_t)&aBlock);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_23A1005AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback((uint64_t)&a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::setEventHandler(uint64_t *a1, const std::string *a2, void *a3, NSObject **a4)
{
  uint64_t v6;
  NSObject *v7;
  void *aBlock;
  dispatch_object_t object;
  std::string v10;

  v6 = *a1;
  std::string::basic_string(&v10, a2);
  if (a3)
    a3 = _Block_copy(a3);
  v7 = *a4;
  if (v7)
    dispatch_retain(v7);
  aBlock = a3;
  object = v7;
  CtrXPC::Client::State::setEventHandler(v6, &v10, (uint64_t)&aBlock);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
}

void sub_23A100670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback((uint64_t)&a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::eventsOn(CtrXPC::Client::State **this)
{
  CtrXPC::Client::State::eventsOn(*this);
}

void CtrXPC::Client::State::eventsOn(CtrXPC::Client::State *this)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 0x40000000;
  v1[2] = ___ZN6CtrXPC6Client5State8eventsOnEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_135;
  v1[4] = this;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)this + 1, (uint64_t)v1);
}

void CtrXPC::Client::perform(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  v2 = *a1;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v3, a2);
  CtrXPC::Client::State::perform(v2, &v3);
  if (v4)
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
}

void CtrXPC::Client::State::perform(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD v3[5];
  uint64_t v4;
  std::__shared_weak_count *v5;

  v2 = (_QWORD *)(a1 + 8);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 1174405120;
  v3[2] = ___ZN6CtrXPC6Client5State7performENSt3__110shared_ptrINS_7CommandEEE_block_invoke;
  v3[3] = &__block_descriptor_tmp_136;
  v3[4] = a1;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v4, a2);
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v2, (uint64_t)v3);
  if (v5)
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

void CtrXPC::Client::perform(uint64_t *a1, uint64_t a2, uint64_t a3, void **a4)
{
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  xpc_object_t object;
  void *aBlock;
  dispatch_object_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v8 = *(void **)a3;
  if (*(_QWORD *)a3)
    v8 = _Block_copy(v8);
  v9 = *(NSObject **)(a3 + 8);
  aBlock = v8;
  v18 = v9;
  if (v9)
    dispatch_retain(v9);
  v10 = *a4;
  object = v10;
  if (v10)
    xpc_retain(v10);
  else
    object = xpc_null_create();
  CtrXPC::Command::create(a2, (uint64_t)&aBlock, &object, &v19);
  xpc_release(object);
  object = 0;
  if (v18)
    dispatch_release(v18);
  if (aBlock)
    _Block_release(aBlock);
  v11 = *a1;
  v14 = v19;
  v15 = v20;
  if (v20)
  {
    p_shared_owners = &v20->__shared_owners_;
    do
      v13 = __ldxr((unint64_t *)p_shared_owners);
    while (__stxr(v13 + 1, (unint64_t *)p_shared_owners));
  }
  CtrXPC::Client::State::perform(v11, &v14);
  if (v15)
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  if (v20)
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
}

void sub_23A1008AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  xpc_object_t v5;
  va_list va;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, xpc_object_t);
  xpc::dict::~dict((xpc_object_t *)va);
  dispatch::callback<void({block_pointer})(CtrXPC::Result,xpc::dict)>::~callback((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(CtrXPC::Result,xpc::dict)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void CtrXPC::Client::get(CtrXPC::Client *this@<X0>, const char *a2@<X1>, void **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  void *__p[2];
  char v8;
  _QWORD v9[2];
  _QWORD v10[3];
  __int16 v11;

  v11 = 1;
  v6 = (uint64_t)*a3;
  v9[0] = a2;
  v9[1] = v6;
  v10[0] = v9;
  v10[1] = CtrXpcClient_getprop_interface_helper;
  v10[2] = CtrXpcClient_getprop_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(this, v10, (uint64_t)__p, a4);
  if (v8 < 0)
    operator delete(__p[0]);
}

void sub_23A100990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::processClientApi(CtrXPC::Client *a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  void (*v9)(uint64_t *__return_ptr, xpc_object_t *, _QWORD);
  xpc_object_t v10;
  xpc_object_t v11;
  uint64_t v12;
  xpc_object_t v13;
  NSObject *v14;
  void *v15;
  NSObject *global_queue;
  NSObject *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  void *v21;
  uint64_t v22;
  uint64_t *p_shared_owners;
  unint64_t v24;
  dispatch_time_t v25;
  unsigned int v26;
  void *v27;
  void **v28;
  xpc_object_t value;
  uint64_t v30;
  void **v31;
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  const std::string *v37;
  xpc_object_t v38;
  void *p_buf;
  void *__p[2];
  uint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  xpc_object_t v44;
  void *v45;
  dispatch_object_t v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  xpc_object_t object;
  uint64_t v50;
  void *v51[2];
  uint64_t v52;
  _QWORD aBlock[7];
  dispatch_object_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  xpc_object_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  xpc_object_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  __n128 (*v66)(__n128 *, __n128 *);
  void (*v67)(uint64_t);
  int v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  xpc_object_t v72;
  __int128 buf;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v9 = (void (*)(uint64_t *__return_ptr, xpc_object_t *, _QWORD))*((_QWORD *)a2 + 1);
  v8 = *((_QWORD *)a2 + 2);
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = v10;
  v12 = MEMORY[0x24BDACFA0];
  if (v10)
  {
    v72 = v10;
  }
  else
  {
    v11 = xpc_null_create();
    v72 = v11;
    if (!v11)
    {
      v13 = xpc_null_create();
      v11 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23B841948](v11) == v12)
  {
    xpc_retain(v11);
    goto LABEL_9;
  }
  v13 = xpc_null_create();
LABEL_8:
  v72 = v13;
LABEL_9:
  xpc_release(v11);
  v63 = 0;
  v64 = &v63;
  v65 = 0x4802000000;
  v66 = __Block_byref_object_copy_;
  v67 = __Block_byref_object_dispose_;
  v68 = 2;
  v70 = 0;
  v71 = 0;
  v69 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3002000000;
  v60 = __Block_byref_object_copy__4;
  v61 = __Block_byref_object_dispose__5;
  v62 = xpc_null_create();
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN6CtrXPC6Client16processClientApiER8cmd_dataRKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEE_block_invoke;
  aBlock[3] = &unk_250B20238;
  aBlock[4] = &v63;
  aBlock[5] = &v57;
  aBlock[6] = v8;
  v54 = v14;
  if (v14)
    dispatch_retain(v14);
  v15 = _Block_copy(aBlock);
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = global_queue;
  if (global_queue)
    dispatch_retain(global_queue);
  v55 = v15;
  v56 = v17;
  object = v72;
  if (v72)
    xpc_retain(v72);
  else
    object = xpc_null_create();
  v9(&v50, &object, *(_QWORD *)a2);
  xpc_release(object);
  object = 0;
  if ((_DWORD)v50)
  {
    v18 = xpc_null_create();
    v19 = xpc_null_create();
    v20 = v72;
    v72 = v18;
    xpc_release(v20);
    xpc_release(v19);
    *(_DWORD *)a4 = v50;
    *(_OWORD *)(a4 + 8) = *(_OWORD *)v51;
    *(_QWORD *)(a4 + 24) = v52;
  }
  else
  {
    if (v15)
      v21 = _Block_copy(v15);
    else
      v21 = 0;
    v45 = v21;
    v46 = v17;
    if (v17)
      dispatch_retain(v17);
    v44 = v72;
    if (v72)
      xpc_retain(v72);
    else
      v44 = xpc_null_create();
    CtrXPC::Command::create(a3, (uint64_t)&v45, &v44, &v47);
    xpc_release(v44);
    v44 = 0;
    if (v46)
      dispatch_release(v46);
    if (v45)
      _Block_release(v45);
    v22 = *(_QWORD *)a1;
    v42 = v47;
    v43 = v48;
    if (v48)
    {
      p_shared_owners = &v48->__shared_owners_;
      do
        v24 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v24 + 1, (unint64_t *)p_shared_owners));
    }
    CtrXPC::Client::State::perform(v22, &v42);
    if (v43)
      std::__shared_weak_count::__release_shared[abi:ne180100](v43);
    if (v14)
    {
      if (MEMORY[0x23B841948](v72) == v12
        && (p_buf = &v72,
            __p[0] = "KeyTimeout",
            xpc::dict::object_proxy::operator xpc::object((uint64_t)&p_buf, &buf),
            v26 = xpc::dyn_cast_or_default((xpc *)&buf, 0),
            xpc_release((xpc_object_t)buf),
            v26))
      {
        v25 = dispatch_time(0, 1000000 * v26);
      }
      else
      {
        v25 = -1;
      }
      if (dispatch_group_wait(v14, v25))
      {
        std::string::basic_string[abi:ne180100]<0>(&buf, "Timeout waiting for response from helper server");
        LODWORD(p_buf) = 4;
        *(_OWORD *)__p = buf;
        v41 = v74;
        buf = 0uLL;
        v74 = 0;
        CtrXPC::Result::operator=((_DWORD *)v64 + 10, (uint64_t)&p_buf);
        if (SHIBYTE(v41) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v74) < 0)
          operator delete((void *)buf);
      }
      else if (a2[24])
      {
        v27 = *(void **)(*(_QWORD *)a2 + 8);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          xpc::object::to_string((xpc::object *)(v58 + 5));
          v28 = SHIBYTE(__p[1]) >= 0 ? &p_buf : (void **)p_buf;
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v28;
          _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "dict_out = %s", (uint8_t *)&buf, 0xCu);
          if (SHIBYTE(__p[1]) < 0)
            operator delete(p_buf);
        }
        value = xpc_dictionary_get_value((xpc_object_t)v58[5], "PropVal");
        xpc_dictionary_set_value(v27, "PropVal", value);
      }
      else if (a2[25])
      {
        v30 = *(_QWORD *)a2;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          xpc::object::to_string((xpc::object *)(v58 + 5));
          v31 = SHIBYTE(__p[1]) >= 0 ? &p_buf : (void **)p_buf;
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v31;
          _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "dict_out = %s", (uint8_t *)&buf, 0xCu);
          if (SHIBYTE(__p[1]) < 0)
            operator delete(p_buf);
        }
        p_buf = v58 + 5;
        __p[0] = "prevOutput";
        xpc::dict::object_proxy::operator xpc::dict((uint64_t)&p_buf, &buf);
        p_buf = &buf;
        __p[0] = "value";
        v32 = xpc::dict::object_proxy::operator*((uint64_t)&p_buf);
        CtrXPC::Client::processStatsData(a1, (Ctr_triggerStatsResult *)(v30 + 8), v32);
        p_buf = v58 + 5;
        __p[0] = "currOutput";
        xpc::dict::object_proxy::operator xpc::dict((uint64_t)&p_buf, &v38);
        p_buf = &v38;
        __p[0] = "value";
        v33 = xpc::dict::object_proxy::operator*((uint64_t)&p_buf);
        CtrXPC::Client::processStatsData(a1, (Ctr_triggerStatsResult *)(v30 + 18600), v33);
        xpc::dict::~dict(&v38);
        xpc::dict::~dict((xpc_object_t *)&buf);
      }
    }
    v34 = xpc_null_create();
    v35 = xpc_null_create();
    v36 = v72;
    v72 = v34;
    xpc_release(v36);
    xpc_release(v35);
    v37 = (const std::string *)v64;
    *(_DWORD *)a4 = *((_DWORD *)v64 + 10);
    std::string::basic_string((std::string *)(a4 + 8), v37 + 2);
    if (v48)
      std::__shared_weak_count::__release_shared[abi:ne180100](v48);
    if (SHIBYTE(v52) < 0)
      operator delete(v51[0]);
  }
  if (v17)
    dispatch_release(v17);
  if (v15)
    _Block_release(v15);
  if (v54)
    dispatch_release(v54);
  if (v14)
    dispatch_release(v14);
  _Block_object_dispose(&v57, 8);
  xpc_release(v62);
  _Block_object_dispose(&v63, 8);
  if (SHIBYTE(v71) < 0)
    operator delete(v69);
  xpc_release(v72);
}

void sub_23A101034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,dispatch_object_t object,char a41,uint64_t a42,char a43)
{
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;

  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)&a23);
  if (a32 < 0)
    operator delete(__p);
  dispatch::callback<void({block_pointer})(CtrXPC::Result,xpc::dict)>::~callback((uint64_t)&a41);
  if (object)
    dispatch_release(object);
  if (v43)
    dispatch_release(v43);
  _Block_object_dispose(&a43, 8);
  xpc::dict::~dict((xpc_object_t *)(v44 + 40));
  _Block_object_dispose((const void *)(v45 - 208), 8);
  if (*(char *)(v45 - 137) < 0)
    operator delete(*(void **)(v45 - 160));
  xpc::dict::~dict((xpc_object_t *)(v45 - 136));
  _Unwind_Resume(a1);
}

void CtrXPC::Client::getProperty(CtrXPC::Client *this@<X0>, const char *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  void *__p[2];
  char v7;
  _QWORD v8[2];
  _QWORD v9[3];
  __int16 v10;

  v10 = 1;
  v8[0] = a2;
  v8[1] = a3;
  v9[0] = v8;
  v9[1] = CtrXpcClient_getprop_interface_helper;
  v9[2] = CtrXpcClient_getprop_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(this, v9, (uint64_t)__p, a4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_23A101224(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::set(CtrXPC::Client *this@<X0>, const char *a2@<X1>, const char *a3@<X2>, uint64_t a4@<X8>)
{
  void *__p[2];
  char v7;
  _QWORD v8[2];
  _QWORD v9[3];
  __int16 v10;

  v10 = 0;
  v8[0] = a2;
  v8[1] = a3;
  v9[0] = v8;
  v9[1] = CtrXpcClient_setprop_interface_helper;
  v9[2] = CtrXpcClient_setprop_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(this, v9, (uint64_t)__p, a4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_23A1012C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::sendData(CtrXPC::Client *this@<X0>, const char *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  void *__p[2];
  char v8;
  _QWORD v9[3];
  _QWORD v10[3];
  __int16 v11;

  v11 = 0;
  v9[0] = a2;
  v9[1] = a3;
  v9[2] = a4;
  v10[0] = v9;
  v10[1] = CtrXpcClient_send_data_interface_helper;
  v10[2] = CtrXpcClient_setprop_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(this, v10, (uint64_t)__p, a5);
  if (v8 < 0)
    operator delete(__p[0]);
}

void sub_23A101360(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::send_network_diag_get(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v7[0] = a2;
  v7[1] = CtrXpcClient_sendnwdiaggetreq_interface_helper;
  v7[2] = CtrXpcClient_sendnwdiaggetreq_response_helper;
  v8 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A1013F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::processClientApiWithCompletion(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void (*v9)(uint64_t *__return_ptr, xpc_object_t *, _QWORD);
  xpc_object_t v10;
  xpc_object_t v11;
  uint64_t v12;
  xpc_object_t v13;
  NSObject *v14;
  void *v15;
  NSObject *global_queue;
  NSObject *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t *p_shared_owners;
  unint64_t v25;
  dispatch_time_t v26;
  unsigned int v27;
  void *v28;
  _BYTE *v29;
  xpc_object_t value;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  int v34;
  std::string v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  xpc_object_t v38;
  void *v39;
  dispatch_object_t v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  int v43;
  std::string __p;
  xpc_object_t object;
  uint64_t v46;
  std::string v47;
  _QWORD aBlock[7];
  dispatch_object_t v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  xpc_object_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  xpc_object_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  __n128 (*v61)(__n128 *, __n128 *);
  void (*v62)(uint64_t);
  int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  xpc_object_t v67;
  uint8_t v68[16];
  uint64_t v69;
  _BYTE buf[32];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v9 = (void (*)(uint64_t *__return_ptr, xpc_object_t *, _QWORD))a2[1];
  v8 = a2[2];
  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = v10;
  v12 = MEMORY[0x24BDACFA0];
  if (v10)
  {
    v67 = v10;
  }
  else
  {
    v11 = xpc_null_create();
    v67 = v11;
    if (!v11)
    {
      v13 = xpc_null_create();
      v11 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23B841948](v11) == v12)
  {
    xpc_retain(v11);
    goto LABEL_9;
  }
  v13 = xpc_null_create();
LABEL_8:
  v67 = v13;
LABEL_9:
  xpc_release(v11);
  v58 = 0;
  v59 = &v58;
  v60 = 0x4802000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  v63 = 2;
  v65 = 0;
  v66 = 0;
  v64 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3002000000;
  v55 = __Block_byref_object_copy__4;
  v56 = __Block_byref_object_dispose__5;
  v57 = xpc_null_create();
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN6CtrXPC6Client30processClientApiWithCompletionER8cmd_dataU13block_pointerFvNS_6ResultEERKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE_block_invoke;
  aBlock[3] = &unk_250B20200;
  aBlock[4] = &v58;
  aBlock[5] = &v52;
  aBlock[6] = v8;
  v49 = v14;
  if (v14)
    dispatch_retain(v14);
  v15 = _Block_copy(aBlock);
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = global_queue;
  if (global_queue)
    dispatch_retain(global_queue);
  v50 = v15;
  v51 = v17;
  object = v67;
  if (v67)
    xpc_retain(v67);
  else
    object = xpc_null_create();
  v9(&v46, &object, *a2);
  xpc_release(object);
  object = 0;
  if ((_DWORD)v46)
  {
    v18 = xpc_null_create();
    v19 = xpc_null_create();
    v20 = v67;
    v67 = v18;
    xpc_release(v20);
    xpc_release(v19);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v21 = (_QWORD *)(*a1 + 48);
      if (*(char *)(*a1 + 71) < 0)
        v21 = (_QWORD *)*v21;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "void CtrXPC::Client::processClientApiWithCompletion(Cmd_data &, ResultBlock, const std::string &)";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 913;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v21;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d:Error Client \"%s\" Destroyed", buf, 0x1Cu);
    }
    v43 = v46;
    std::string::basic_string(&__p, &v47);
    (*(void (**)(uint64_t, int *))(a3 + 16))(a3, &v43);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    if (v15)
      v22 = _Block_copy(v15);
    else
      v22 = 0;
    v39 = v22;
    v40 = v17;
    if (v17)
      dispatch_retain(v17);
    v38 = v67;
    if (v67)
      xpc_retain(v67);
    else
      v38 = xpc_null_create();
    CtrXPC::Command::create(a4, (uint64_t)&v39, &v38, &v41);
    xpc_release(v38);
    v38 = 0;
    if (v40)
      dispatch_release(v40);
    if (v39)
      _Block_release(v39);
    v23 = *a1;
    v36 = v41;
    v37 = v42;
    if (v42)
    {
      p_shared_owners = &v42->__shared_owners_;
      do
        v25 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v25 + 1, (unint64_t *)p_shared_owners));
    }
    CtrXPC::Client::State::perform(v23, &v36);
    if (v37)
      std::__shared_weak_count::__release_shared[abi:ne180100](v37);
    if (v14)
    {
      if (MEMORY[0x23B841948](v67) == v12
        && (*(_QWORD *)buf = &v67,
            *(_QWORD *)&buf[8] = "KeyTimeout",
            xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, v68),
            v27 = xpc::dyn_cast_or_default((xpc *)v68, 0),
            xpc_release(*(xpc_object_t *)v68),
            v27))
      {
        v26 = dispatch_time(0, 1000000 * v27);
      }
      else
      {
        v26 = -1;
      }
      if (dispatch_group_wait(v14, v26))
      {
        std::string::basic_string[abi:ne180100]<0>(v68, "Timeout waiting for response from helper server");
        *(_DWORD *)buf = 4;
        *(_OWORD *)&buf[8] = *(_OWORD *)v68;
        *(_QWORD *)&buf[24] = v69;
        memset(v68, 0, sizeof(v68));
        v69 = 0;
        CtrXPC::Result::operator=((_DWORD *)v59 + 10, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0)
          operator delete(*(void **)&buf[8]);
        if (SHIBYTE(v69) < 0)
          operator delete(*(void **)v68);
      }
      else if (*((_BYTE *)a2 + 24))
      {
        v28 = *(void **)(*a2 + 8);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          xpc::object::to_string((xpc::object *)(v53 + 5));
          v29 = buf[23] >= 0 ? buf : *(_BYTE **)buf;
          *(_DWORD *)v68 = 136315138;
          *(_QWORD *)&v68[4] = v29;
          _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "dict_out = %s", v68, 0xCu);
          if ((buf[23] & 0x80000000) != 0)
            operator delete(*(void **)buf);
        }
        if (xpc_dictionary_get_value((xpc_object_t)v53[5], "PropVal"))
        {
          value = xpc_dictionary_get_value((xpc_object_t)v53[5], "PropVal");
          xpc_dictionary_set_value(v28, "PropVal", value);
        }
      }
    }
    v31 = xpc_null_create();
    v32 = xpc_null_create();
    v33 = v67;
    v67 = v31;
    xpc_release(v33);
    xpc_release(v32);
    v34 = *((_DWORD *)v59 + 10);
    std::string::basic_string(&v35, (const std::string *)v59 + 2);
    (*(void (**)(uint64_t, int *))(a3 + 16))(a3, &v34);
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__r_.__value_.__l.__data_);
    if (v42)
      std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  if (v17)
    dispatch_release(v17);
  if (v15)
    _Block_release(v15);
  if (v49)
    dispatch_release(v49);
  if (v14)
    dispatch_release(v14);
  _Block_object_dispose(&v52, 8);
  xpc_release(v57);
  _Block_object_dispose(&v58, 8);
  if (SHIBYTE(v66) < 0)
    operator delete(v64);
  xpc_release(v67);
}

void sub_23A101A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, char a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,dispatch_object_t object,char a49,uint64_t a50,char a51)
{
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;

  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  if (a40 < 0)
    operator delete(__p);
  dispatch::callback<void({block_pointer})(CtrXPC::Result,xpc::dict)>::~callback((uint64_t)&a49);
  if (object)
    dispatch_release(object);
  if (v51)
    dispatch_release(v51);
  _Block_object_dispose(&a51, 8);
  xpc::dict::~dict((xpc_object_t *)(v52 + 40));
  _Block_object_dispose((const void *)(v53 - 256), 8);
  if (*(char *)(v53 - 185) < 0)
    operator delete(*(void **)(v53 - 208));
  xpc::dict::~dict((xpc_object_t *)(v53 - 184));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[2].n128_u32[2] = a2[2].n128_u32[2];
  result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  a2[3].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
}

xpc_object_t __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  xpc_object_t result;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  result = xpc_null_create();
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
}

void ___ZN6CtrXPC6Client30processClientApiWithCompletionER8cmd_dataU13block_pointerFvNS_6ResultEERKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE_block_invoke(uint64_t a1, _DWORD *a2, void **a3)
{
  void (*v6)(_DWORD *, xpc_object_t *);
  void *v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  xpc_object_t object;

  if (!*a2)
  {
    v6 = *(void (**)(_DWORD *, xpc_object_t *))(a1 + 48);
    v7 = *a3;
    object = v7;
    if (v7)
      xpc_retain(v7);
    else
      object = xpc_null_create();
    v6(a2, &object);
    xpc_release(object);
    object = 0;
  }
  CtrXPC::Result::operator=(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, (uint64_t)a2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *a3;
  if (v9)
    xpc_retain(v9);
  else
    v9 = xpc_null_create();
  v10 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9;
  xpc_release(v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_23A101D24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

uint64_t CtrXPC::Result::operator=(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  std::string::operator=((std::string *)(a1 + 8), (const std::string *)(a2 + 8));
  return a1;
}

void __copy_helper_block_e8_56c21_ZTSN8dispatch5groupE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __destroy_helper_block_e8_56c21_ZTSN8dispatch5groupE(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 56);
  if (v1)
    dispatch_release(v1);
}

_DWORD *CtrXPC::Result::operator=(_DWORD *a1, uint64_t a2)
{
  *a1 = *(_DWORD *)a2;
  std::string::operator=[abi:ne180100]((uint64_t)(a1 + 2), (__int128 *)(a2 + 8));
  return a1;
}

void CtrXPC::Client::populateStatsAccessoryData(int a1, _QWORD *a2, int a3, const std::string *a4, __int16 a5, char a6, uint64_t a7)
{
  int v13;
  uint64_t *v15;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  std::string *v24;

  if (*((char *)a2 + 23) < 0)
  {
    if (a2[1] == 8 && *(_QWORD *)*a2 == 0x6C61746F745F7874)
      goto LABEL_26;
    if (a2[1] == 10 && *(_QWORD *)*a2 == 0x65636375735F7874 && *(_WORD *)(*a2 + 8) == 29555)
      goto LABEL_54;
    if (a2[1] == 15 && *(_QWORD *)*a2 == 0x65636375735F7874 && *(_QWORD *)(*a2 + 7) == 0x637265705F737365)
      goto LABEL_57;
    if (a2[1] != 8 || *(_QWORD *)*a2 != 0x6C61746F745F7872)
    {
      if (a2[1] != 10
        || (*(_QWORD *)*a2 == 0x65636375735F7872 ? (v20 = *(unsigned __int16 *)(*a2 + 8) == 29555) : (v20 = 0), !v20))
      {
        if (a2[1] != 15)
          goto LABEL_50;
        v15 = (uint64_t *)*a2;
        goto LABEL_46;
      }
LABEL_59:
      *(_DWORD *)(a7 + 140) = a3;
      return;
    }
    goto LABEL_58;
  }
  v13 = *((unsigned __int8 *)a2 + 23);
  if (v13 == 8)
  {
    if (*a2 == 0x6C61746F745F7874)
    {
LABEL_26:
      *(_DWORD *)(a7 + 104) = a3;
      return;
    }
    if (*a2 != 0x6C61746F745F7872)
      goto LABEL_50;
LABEL_58:
    *(_DWORD *)(a7 + 136) = a3;
    return;
  }
  if (v13 == 10)
  {
    if (*a2 != 0x65636375735F7874 || *((_WORD *)a2 + 4) != 29555)
    {
      if (*a2 != 0x65636375735F7872 || *((_WORD *)a2 + 4) != 29555)
        goto LABEL_50;
      goto LABEL_59;
    }
LABEL_54:
    *(_DWORD *)(a7 + 108) = a3;
    return;
  }
  if (v13 != 15)
    goto LABEL_50;
  if (*a2 == 0x65636375735F7874 && *(_QWORD *)((char *)a2 + 7) == 0x637265705F737365)
  {
LABEL_57:
    *(_DWORD *)(a7 + 116) = a3;
    return;
  }
  v15 = a2;
LABEL_46:
  v21 = *v15;
  v22 = *(uint64_t *)((char *)v15 + 7);
  if (v21 == 0x65636375735F7872 && v22 == 0x637265705F737365)
  {
    *(_DWORD *)(a7 + 148) = a3;
    return;
  }
LABEL_50:
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_delayavg"))
  {
    *(_DWORD *)(a7 + 152) = a3;
    return;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_delaymin"))
  {
    *(_DWORD *)(a7 + 156) = a3;
    return;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_delaymax"))
  {
    *(_DWORD *)(a7 + 160) = a3;
    return;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "RLOC16"))
  {
    *(_WORD *)(a7 + 96) = a3;
    return;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "ExtAddress"))
  {
    v24 = (std::string *)(a7 + 48);
LABEL_66:
    std::string::operator=(v24, a4);
    return;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "thread_version"))
  {
    *(_BYTE *)(a7 + 176) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "is_direct_link"))
  {
    *(_BYTE *)(a7 + 172) = a6;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "AverageRssi"))
  {
    *(_WORD *)(a7 + 98) = a5;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "LastRssi"))
  {
    *(_WORD *)(a7 + 100) = a5;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "LinkQualityIn"))
  {
    *(_BYTE *)(a7 + 102) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "is_current_node_parent"))
  {
    *(_BYTE *)(a7 + 175) = a6;
  }
  else
  {
    if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "last_known_device_role"))
    {
      v24 = (std::string *)(a7 + 72);
      goto LABEL_66;
    }
    if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "rx_failure"))
    {
      *(_DWORD *)(a7 + 144) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_failure"))
    {
      *(_DWORD *)(a7 + 112) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_app_pkt_success"))
    {
      *(_DWORD *)(a7 + 120) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_app_total"))
    {
      *(_DWORD *)(a7 + 124) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_app_pkt_failure"))
    {
      *(_DWORD *)(a7 + 128) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_app_success_perc"))
    {
      *(_DWORD *)(a7 + 132) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_icmp_err"))
    {
      *(_DWORD *)(a7 + 164) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "rx_icmp_err"))
    {
      *(_DWORD *)(a7 + 168) = a3;
    }
  }
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1)
        goto LABEL_10;
      a1 = (_QWORD *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1)
LABEL_10:
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) == 0;
  }
  return 0;
}

void CtrXPC::Client::processStatsDataPerAccessory(CtrXPC::Client *this, Ctr_triggerAccessoryStatsResult *a2, void *a3)
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  xpc_object_t array;
  size_t v15;
  size_t v16;
  uint64_t v17;
  xpc_object_t dictionary;
  char *string;
  std::string *p_str;
  std::string::size_type size;
  BOOL v23;
  __int16 int64;
  int v35;
  std::string *v36;
  std::string::size_type v41;
  uint64_t v42;
  int uint64;
  int v45;
  const char *v46;
  int v47;
  Ctr_triggerAccessoryStatsResult *v48;
  size_t count;
  std::string v50;
  std::string v51;
  std::string v52;
  std::string v53;
  std::string v54;
  std::string v55;
  std::string __str;
  std::string v57;

  memset(&v57, 0, sizeof(v57));
  if (MEMORY[0x23B841948](a3) == MEMORY[0x24BDACF78])
  {
    v48 = a2;
    count = xpc_array_get_count(a3);
    if (!count)
      goto LABEL_124;
    v13 = 0;
    while (1)
    {
      array = xpc_array_get_array(a3, v13);
      v15 = xpc_array_get_count(array);
      if (v15)
        break;
LABEL_123:
      if (++v13 == count)
        goto LABEL_124;
    }
    v16 = 0;
    v17 = (uint64_t)v48 + 184 * v13;
    while (1)
    {
      dictionary = xpc_array_get_dictionary(array, v16);
      string = (char *)xpc_dictionary_get_string(dictionary, "key");
      std::string::basic_string[abi:ne180100]<0>(&__str, string);
      if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        p_str = &__str;
        switch(*((_BYTE *)&__str.__r_.__value_.__s + 23))
        {
          case 4:
            goto LABEL_15;
          case 7:
            if (LODWORD(__str.__r_.__value_.__l.__data_) == 1633644649
              && *(_DWORD *)((char *)__str.__r_.__value_.__r.__words + 3) == 1919181921)
            {
              goto LABEL_113;
            }
            if (HIBYTE(__str.__r_.__value_.__r.__words[2]) != 4)
              goto LABEL_109;
LABEL_15:
            if (LODWORD(__str.__r_.__value_.__l.__data_) != 1701667182)
              goto LABEL_109;
            goto LABEL_113;
          case 8:
            goto LABEL_78;
          case 0xA:
            if (__str.__r_.__value_.__r.__words[0] == 0x6572646441747845
              && LOWORD(__str.__r_.__value_.__r.__words[1]) == 29555)
            {
              goto LABEL_113;
            }
            goto LABEL_77;
          case 0xB:
            if (__str.__r_.__value_.__r.__words[0] == 0x5265676172657641
              && *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 3) == 0x6973735265676172)
            {
              goto LABEL_85;
            }
LABEL_77:
            if (HIBYTE(__str.__r_.__value_.__r.__words[2]) != 8)
              goto LABEL_109;
LABEL_78:
            if (__str.__r_.__value_.__r.__words[0] != 0x697373527473614CLL)
              goto LABEL_109;
            goto LABEL_85;
          case 0xD:
            if (__str.__r_.__value_.__r.__words[0] != 0x6C6175516B6E694CLL
              || *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 5) != 0x6E497974696C6175)
            {
              goto LABEL_109;
            }
            goto LABEL_85;
          case 0xE:
            goto LABEL_105;
          case 0x16:
            if (__str.__r_.__value_.__r.__words[0] == 0x6F6E6B5F7473616CLL
              && __str.__r_.__value_.__l.__size_ == 0x63697665645F6E77
              && *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 6) == 0x656C6F725F656369)
            {
              goto LABEL_113;
            }
            if (__str.__r_.__value_.__r.__words[0] == 0x65727275635F7369
              && __str.__r_.__value_.__l.__size_ == 0x5F65646F6E5F746ELL
              && *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 6) == 0x746E657261705F65)
            {
              goto LABEL_122;
            }
            if (HIBYTE(__str.__r_.__value_.__r.__words[2]) != 14)
              goto LABEL_109;
            p_str = &__str;
            break;
          default:
            goto LABEL_109;
        }
        goto LABEL_105;
      }
      size = __str.__r_.__value_.__l.__size_;
      if (__str.__r_.__value_.__l.__size_ == 7)
      {
        if (*(_DWORD *)__str.__r_.__value_.__l.__data_ == 1633644649
          && *(_DWORD *)(__str.__r_.__value_.__r.__words[0] + 3) == 1919181921)
        {
LABEL_113:
          v46 = xpc_dictionary_get_string(dictionary, "value");
          MEMORY[0x23B8412B8](&v57, v46);
          std::string::basic_string(&v55, &__str);
          v47 = std::string::basic_string(&v54, &v57);
          CtrXPC::Client::populateStatsAccessoryData(v47, &v55, 0, &v54, 0, 0, v17);
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v54.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_118;
          v36 = &v55;
          goto LABEL_117;
        }
        size = __str.__r_.__value_.__l.__size_;
      }
      else if (__str.__r_.__value_.__l.__size_ == 22)
      {
        v23 = *(_QWORD *)__str.__r_.__value_.__l.__data_ == 0x6F6E6B5F7473616CLL
           && *(_QWORD *)(__str.__r_.__value_.__r.__words[0] + 8) == 0x63697665645F6E77;
        if (v23 && *(_QWORD *)(__str.__r_.__value_.__r.__words[0] + 14) == 0x656C6F725F656369)
          goto LABEL_113;
      }
      if (size == 4)
      {
        if (*(_DWORD *)__str.__r_.__value_.__l.__data_ == 1701667182)
          goto LABEL_113;
        size = __str.__r_.__value_.__l.__size_;
      }
      if (size == 10)
      {
        if (*(_QWORD *)__str.__r_.__value_.__l.__data_ == 0x6572646441747845
          && *(_WORD *)(__str.__r_.__value_.__r.__words[0] + 8) == 29555)
        {
          goto LABEL_113;
        }
        size = __str.__r_.__value_.__l.__size_;
      }
      if (size == 11)
      {
        if (*(_QWORD *)__str.__r_.__value_.__l.__data_ == 0x5265676172657641
          && *(_QWORD *)(__str.__r_.__value_.__r.__words[0] + 3) == 0x6973735265676172)
        {
          goto LABEL_85;
        }
        size = __str.__r_.__value_.__l.__size_;
      }
      if (size != 8)
        goto LABEL_50;
      if (*(_QWORD *)__str.__r_.__value_.__l.__data_ != 0x697373527473614CLL)
      {
        size = __str.__r_.__value_.__l.__size_;
LABEL_50:
        if (size != 13)
          goto LABEL_56;
        if (*(_QWORD *)__str.__r_.__value_.__l.__data_ != 0x6C6175516B6E694CLL
          || *(_QWORD *)(__str.__r_.__value_.__r.__words[0] + 5) != 0x6E497974696C6175)
        {
          size = __str.__r_.__value_.__l.__size_;
LABEL_56:
          if (size == 22)
          {
            if (*(_QWORD *)__str.__r_.__value_.__l.__data_ == 0x65727275635F7369
              && *(_QWORD *)(__str.__r_.__value_.__r.__words[0] + 8) == 0x5F65646F6E5F746ELL
              && *(_QWORD *)(__str.__r_.__value_.__r.__words[0] + 14) == 0x746E657261705F65)
            {
LABEL_122:
              xpc_dictionary_get_BOOL(dictionary, "value");
              goto LABEL_118;
            }
            size = __str.__r_.__value_.__l.__size_;
          }
          if (size == 14)
          {
            p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
LABEL_105:
            v41 = p_str->__r_.__value_.__r.__words[0];
            v42 = *(std::string::size_type *)((char *)p_str->__r_.__value_.__r.__words + 6);
            if (v41 == 0x63657269645F7369 && v42 == 0x6B6E696C5F746365)
              goto LABEL_122;
          }
LABEL_109:
          uint64 = xpc_dictionary_get_uint64(dictionary, "value");
          std::string::basic_string(&v51, &__str);
          v45 = std::string::basic_string(&v50, &v57);
          CtrXPC::Client::populateStatsAccessoryData(v45, &v51, uint64, &v50, 0, 0, v17);
          if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v50.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v51.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_118;
          v36 = &v51;
          goto LABEL_117;
        }
      }
LABEL_85:
      int64 = xpc_dictionary_get_int64(dictionary, "value");
      std::string::basic_string(&v53, &__str);
      v35 = std::string::basic_string(&v52, &v57);
      CtrXPC::Client::populateStatsAccessoryData(v35, &v53, 0, &v52, int64, 0, v17);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v52.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v53.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_118;
      v36 = &v53;
LABEL_117:
      operator delete(v36->__r_.__value_.__l.__data_);
LABEL_118:
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      if (v15 == ++v16)
        goto LABEL_123;
    }
  }
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v5)
    CtrXPC::Client::processStatsDataPerAccessory(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_124:
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v57.__r_.__value_.__l.__data_);
}

void sub_23A102A20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  uint64_t v47;

  if (*(char *)(v47 - 89) < 0)
    operator delete(*(void **)(v47 - 112));
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::populateStatsData(int a1, _QWORD *a2, unsigned int a3, const std::string *a4, uint64_t a5)
{
  unsigned int v9;
  uint64_t *v10;
  BOOL v13;
  BOOL v15;
  BOOL v17;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v31;
  uint64_t v33;
  uint64_t v34;
  int v35;

  if (*((char *)a2 + 23) < 0)
  {
    if (a2[1] == 19)
    {
      v15 = *(_QWORD *)*a2 == 0x64656C6261736964 && *(_QWORD *)(*a2 + 8) == 0x6F635F656C6F725FLL;
      if (v15 && *(_QWORD *)(*a2 + 11) == 0x746E756F635F656CLL)
        goto LABEL_79;
    }
    if (a2[1] == 19)
    {
      v17 = *(_QWORD *)*a2 == 0x6465686361746564 && *(_QWORD *)(*a2 + 8) == 0x6F635F656C6F725FLL;
      if (v17 && *(_QWORD *)(*a2 + 11) == 0x746E756F635F656CLL)
        goto LABEL_79;
    }
    if (a2[1] != 24
      || (*(_QWORD *)*a2 == 0x6C7070615F6D756ELL ? (v19 = *(_QWORD *)(*a2 + 8) == 0x726564726F625F65) : (v19 = 0),
          v19 ? (v20 = *(_QWORD *)(*a2 + 16) == 0x73726574756F725FLL) : (v20 = 0),
          !v20))
    {
      if (a2[1] != 30
        || (*(_QWORD *)*a2 == 0x726968745F6D756ELL ? (v21 = *(_QWORD *)(*a2 + 8) == 0x5F79747261705F64) : (v21 = 0),
            v21 ? (v22 = *(_QWORD *)(*a2 + 16) == 0x725F726564726F62) : (v22 = 0),
            v22 ? (v23 = *(_QWORD *)(*a2 + 22) == 0x73726574756F725FLL) : (v23 = 0),
            !v23))
      {
        if (a2[1] == 19)
        {
          v24 = *(_QWORD *)*a2 == 0x657268745F6D756ELL && *(_QWORD *)(*a2 + 8) == 0x6F7774656E5F6461;
          if (v24 && *(_QWORD *)(*a2 + 11) == 0x736B726F7774656ELL)
            goto LABEL_117;
        }
        if (a2[1] != 17)
          goto LABEL_106;
        v10 = (uint64_t *)*a2;
        goto LABEL_99;
      }
LABEL_78:
      *(_BYTE *)(a5 + 1) = a3;
      return;
    }
LABEL_113:
    *(_BYTE *)a5 = a3;
    return;
  }
  v9 = *((unsigned __int8 *)a2 + 23);
  if (v9 <= 0x17)
  {
    v10 = a2;
    if (v9 != 17)
    {
      if (v9 != 19)
        goto LABEL_106;
      if (*a2 != 0x64656C6261736964
        || a2[1] != 0x6F635F656C6F725FLL
        || *(_QWORD *)((char *)a2 + 11) != 0x746E756F635F656CLL)
      {
        v13 = *a2 == 0x6465686361746564 && a2[1] == 0x6F635F656C6F725FLL;
        if (!v13 || *(_QWORD *)((char *)a2 + 11) != 0x746E756F635F656CLL)
          goto LABEL_88;
      }
LABEL_79:
      if (a3)
        *(_BYTE *)(a5 + 115) = 1;
      else
        *(_BYTE *)(a5 + 115) = 0;
      return;
    }
LABEL_99:
    v33 = *v10;
    v34 = v10[1];
    v35 = *((unsigned __int8 *)v10 + 16);
    if (v33 == 0x73654D6E4F6D756ELL && v34 == 0x6578696665725068 && v35 == 115)
    {
      *(_BYTE *)(a5 + 3) = a3;
      return;
    }
    goto LABEL_106;
  }
  if (v9 == 24)
  {
    if (*a2 != 0x6C7070615F6D756ELL || a2[1] != 0x726564726F625F65 || a2[2] != 0x73726574756F725FLL)
      goto LABEL_88;
    goto LABEL_113;
  }
  if (v9 != 30)
    goto LABEL_106;
  if (*a2 == 0x726968745F6D756ELL
    && a2[1] == 0x5F79747261705F64
    && a2[2] == 0x725F726564726F62
    && *(_QWORD *)((char *)a2 + 22) == 0x73726574756F725FLL)
  {
    goto LABEL_78;
  }
LABEL_88:
  if (v9 == 19)
  {
    v31 = *a2 == 0x657268745F6D756ELL && a2[1] == 0x6F7774656E5F6461;
    if (v31 && *(_QWORD *)((char *)a2 + 11) == 0x736B726F7774656ELL)
    {
LABEL_117:
      *(_BYTE *)(a5 + 2) = a3;
      return;
    }
  }
LABEL_106:
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_total"))
  {
    *(_DWORD *)(a5 + 4) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_success"))
  {
    *(_DWORD *)(a5 + 8) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_success_perc"))
  {
    *(_DWORD *)(a5 + 12) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "rx_total"))
  {
    *(_DWORD *)(a5 + 16) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "rx_success"))
  {
    *(_DWORD *)(a5 + 20) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "rx_success_perc"))
  {
    *(_DWORD *)(a5 + 24) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_delayavg"))
  {
    *(_DWORD *)(a5 + 28) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_delaymin"))
  {
    *(_DWORD *)(a5 + 32) = a3;
  }
  else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "tx_delaymax"))
  {
    *(_DWORD *)(a5 + 36) = a3;
  }
  else
  {
    if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "numRouters"))
    {
      *(_DWORD *)(a5 + 80) = a3;
      JUMPOUT(0x23B8412B8);
    }
    if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "partition_id_changes_count"))
    {
      if (a3)
        *(_BYTE *)(a5 + 49) = 1;
      else
        *(_BYTE *)(a5 + 49) = 0;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "parent_changes_count"))
    {
      if (a3)
        *(_BYTE *)(a5 + 112) = 1;
      else
        *(_BYTE *)(a5 + 112) = 0;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "ca_trigger_based_counters_num_firmware_resets"))
    {
      if (a3)
        *(_BYTE *)(a5 + 114) = 1;
      else
        *(_BYTE *)(a5 + 114) = 0;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "ca_trigger_based_counters_num_daemon_restart_due_to_crashes_or_jetsams"))
    {
      if (a3)
        *(_BYTE *)(a5 + 113) = 1;
      else
        *(_BYTE *)(a5 + 113) = 0;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "is_border_router_advertised"))
    {
      if (a3)
        *(_BYTE *)(a5 + 116) = 1;
      else
        *(_BYTE *)(a5 + 116) = 0;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "last_known_device_role"))
    {
      std::string::operator=((std::string *)(a5 + 136), a4);
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "num_border_routers_advertised"))
    {
      *(_BYTE *)(a5 + 118) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "statsTimestamp"))
    {
      *(_QWORD *)(a5 + 120) = a3;
    }
    else if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, "statsDuration"))
    {
      *(_QWORD *)(a5 + 128) = a3;
    }
  }
}

void CtrXPC::Client::processStatsData(CtrXPC::Client *this, Ctr_triggerStatsResult *a2, void *a3)
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t count;
  size_t v14;
  xpc_object_t dictionary;
  char *string;
  std::string *p_str;
  std::string::size_type v18;
  std::string::size_type size;
  uint64_t v20;
  unsigned int uint64;
  int v24;
  std::string *v25;
  const char *v26;
  int v27;
  std::string __p;
  std::string v29;
  std::string v30;
  std::string v31;
  std::string __str;
  std::string v33;

  memset(&v33, 0, sizeof(v33));
  if (MEMORY[0x23B841948](a3) == MEMORY[0x24BDACF78])
  {
    *((_BYTE *)a2 + 176) = 1;
    count = xpc_array_get_count(a3);
    if (!count)
      goto LABEL_5;
    v14 = 0;
    while (1)
    {
      dictionary = xpc_array_get_dictionary(a3, v14);
      string = (char *)xpc_dictionary_get_string(dictionary, "key");
      std::string::basic_string[abi:ne180100]<0>(&__str, string);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        if (__str.__r_.__value_.__l.__size_ != 22)
          goto LABEL_22;
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      else
      {
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) != 22)
          goto LABEL_22;
        p_str = &__str;
      }
      v18 = p_str->__r_.__value_.__r.__words[0];
      size = p_str->__r_.__value_.__l.__size_;
      v20 = *(std::string::size_type *)((char *)&p_str->__r_.__value_.__r.__words[1] + 6);
      if (v18 == 0x6F6E6B5F7473616CLL && size == 0x63697665645F6E77 && v20 == 0x656C6F725F656369)
      {
        v26 = xpc_dictionary_get_string(dictionary, "value");
        MEMORY[0x23B8412B8](&v33, v26);
        std::string::basic_string(&v31, &__str);
        v27 = std::string::basic_string(&v30, &v33);
        CtrXPC::Client::populateStatsData(v27, &v31, 0, &v30, (uint64_t)a2);
        if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v30.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_30;
        v25 = &v31;
        goto LABEL_26;
      }
LABEL_22:
      uint64 = xpc_dictionary_get_uint64(dictionary, "value");
      std::string::basic_string(&v29, &__str);
      v24 = std::string::basic_string(&__p, &v33);
      CtrXPC::Client::populateStatsData(v24, &v29, uint64, &__p, (uint64_t)a2);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_30;
      v25 = &v29;
LABEL_26:
      operator delete(v25->__r_.__value_.__l.__data_);
LABEL_30:
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      if (count == ++v14)
        goto LABEL_5;
    }
  }
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v5)
    CtrXPC::Client::processStatsData(v5, v6, v7, v8, v9, v10, v11, v12);
  *((_BYTE *)a2 + 176) = 0;
LABEL_5:
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
}

void sub_23A103444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  uint64_t v38;

  if (*(char *)(v38 - 81) < 0)
    operator delete(*(void **)(v38 - 104));
  _Unwind_Resume(exception_object);
}

void ___ZN6CtrXPC6Client16processClientApiER8cmd_dataRKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEE_block_invoke(uint64_t a1, _DWORD *a2, void **a3)
{
  void (*v6)(_DWORD *, xpc_object_t *);
  void *v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  xpc_object_t object;

  if (!*a2)
  {
    v6 = *(void (**)(_DWORD *, xpc_object_t *))(a1 + 48);
    v7 = *a3;
    object = v7;
    if (v7)
      xpc_retain(v7);
    else
      object = xpc_null_create();
    v6(a2, &object);
    xpc_release(object);
    object = 0;
  }
  CtrXPC::Result::operator=(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, (uint64_t)a2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *a3;
  if (v9)
    xpc_retain(v9);
  else
    v9 = xpc_null_create();
  v10 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9;
  xpc_release(v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_23A1035A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

void xpc::dict::object_proxy::operator xpc::dict(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;

  v3 = xpc::dict::object_proxy::operator*(a1);
  if (v3)
  {
    v4 = v3;
    xpc_retain(v3);
    *a2 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    *a2 = v4;
    if (!v4)
    {
      v5 = xpc_null_create();
      v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23B841948](v4) != MEMORY[0x24BDACFA0])
  {
    v5 = xpc_null_create();
LABEL_8:
    *a2 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
}

void CtrXPC::Client::scan(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_scan_interface_helper;
  v7[2] = CtrXpcClient_scan_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A1036C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::addService(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_add_service_interface_helper;
  v7[2] = CtrXpcClient_add_service_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A10375C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::removeService(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *__p[2];
  char v7;
  _QWORD v8[3];
  __int16 v9;
  _QWORD v10[2];

  v10[0] = a2;
  v10[1] = a3;
  v9 = 0;
  v8[0] = v10;
  v8[1] = CtrXpcClient_remove_service_interface_helper;
  v8[2] = CtrXpcClient_remove_service_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v8, (uint64_t)__p, a4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_23A1037F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::addPrefix(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_config_gateway_interface_helper;
  v7[2] = CtrXpcClient_config_gateway_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A10388C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::removePrefix(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  if (*(_DWORD *)(a2 + 4) == -1)
    *(_DWORD *)(a2 + 4) = 0;
  if (*(_DWORD *)(a2 + 8) == -1)
    *(_DWORD *)(a2 + 8) = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_config_gateway_interface_helper;
  v7[2] = CtrXpcClient_config_gateway_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A103940(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::updateAccData(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_update_accessory_data_interface_helper;
  v7[2] = CtrXpcClient_update_accessory_data_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A1039D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::form(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_form_interface_helper;
  v7[2] = CtrXpcClient_form_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A103A68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::leave(CtrXPC::Client *this@<X0>, uint64_t a2@<X8>)
{
  void *__p[2];
  char v5;
  _QWORD v6[3];
  __int16 v7;

  v7 = 0;
  v6[0] = 0;
  v6[1] = CtrXpcClient_leave_interface_helper;
  v6[2] = CtrXpcClient_leave_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(this, v6, (uint64_t)__p, a2);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_23A103AFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::join(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_join_interface_helper;
  v7[2] = CtrXpcClient_join_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A103B90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::joiner(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_joiner_interface_helper;
  v7[2] = CtrXpcClient_joiner_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A103C24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::eventsOff(CtrXPC::Client::State **this)
{
  CtrXPC::Client::State::eventsOff(*this);
}

void CtrXPC::Client::State::eventsOff(CtrXPC::Client::State *this)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 0x40000000;
  v1[2] = ___ZN6CtrXPC6Client5State9eventsOffEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_137;
  v1[4] = this;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((_QWORD *)this + 1, (uint64_t)v1);
}

void CtrXPC::Client::resume(CtrXPC::Client *this@<X0>, uint64_t a2@<X8>)
{
  void *__p[2];
  char v5;
  _QWORD v6[3];
  __int16 v7;

  v7 = 0;
  v6[0] = 0;
  v6[1] = CtrXpcClient_resume_interface_helper;
  v6[2] = CtrXpcClient_resume_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(this, v6, (uint64_t)__p, a2);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_23A103D18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::reset(CtrXPC::Client *this@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;
  char v9;

  v9 = a2;
  v8 = 0;
  v7[0] = &v9;
  v7[1] = CtrXpcClient_reset_interface_helper;
  v7[2] = CtrXpcClient_reset_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(this, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A103DB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::setChannel(CtrXPC::Client *this@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;
  char v9;

  v9 = a2;
  v8 = 0;
  v7[0] = &v9;
  v7[1] = CtrXpcClient_SetChannel_interface_helper;
  v7[2] = CtrXpcClient_SetChannel_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApi(this, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A103E50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::attachToNetwork(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *__p[2];
  char v7;
  _QWORD v8[3];
  __int16 v9;

  *(_QWORD *)(a2 + 8) = a3;
  v8[0] = a2;
  v8[1] = CtrXpcClient_attachToNetwork_interface_helper;
  v8[2] = CtrXpcClient_attachToNetwork_response_helper;
  v9 = 1;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApi(a1, v8, (uint64_t)__p, a4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_23A103EEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::attachToNetwork(CtrXPC::Client *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  xpc_object_t v6;
  __int128 v7;
  _OWORD v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = a2[1];
  v8[0] = *a2;
  v8[1] = v7;
  v8[2] = a2[2];
  CtrXPC::Client::attachToNetwork(a1, (uint64_t)v8, (uint64_t)v6, a3);
}

void CtrXPC::Client::commissionOrFormNetwork(CtrXPC::Client *this@<X0>, void *a2@<X2>, char a3@<W1>, uint64_t a4@<X8>)
{
  void *__p[2];
  char v7;
  char v8;
  void *v9;
  char v10;
  _QWORD v11[3];
  __int16 v12;

  v12 = 1;
  v10 = a3;
  v9 = a2;
  v11[0] = &v8;
  v11[1] = CtrXpcClient_commissionOrFormNetwork_interface_helper;
  v11[2] = CtrXpcClient_commissionOrFormNetwork_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApi(this, v11, (uint64_t)__p, a4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_23A104024(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::generatePSKc(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void *__p[2];
  char v7;
  _QWORD v8[3];
  __int16 v9;

  *(_QWORD *)(a2 + 8) = a3;
  v8[0] = a2;
  v8[1] = CtrXpcClient_generatePSKc_interface_helper;
  v8[2] = CtrXpcClient_generatePSKc_response_helper;
  v9 = 1;
  std::string::basic_string[abi:ne180100]<0>(__p, "WpanctlCmd");
  CtrXPC::Client::processClientApi(a1, v8, (uint64_t)__p, a4);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_23A1040C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::threadStart(CtrXPC::Client *this@<X0>, const char *a2@<X1>, char *a3@<X2>, _DWORD *a4@<X8>)
{
  const char *string;
  size_t v8;
  const char *v9;
  xpc_object_t xdict;
  char *v11;
  char v12;
  uint64_t v13;
  int v14;
  char v15;
  uint64_t v16;
  _QWORD v17[3];
  char v18;
  char v19;
  _BYTE buf[12];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 1;
  v16 = 0;
  v9 = a2;
  v11 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  v17[0] = &v9;
  v17[1] = CtrXpcClient_threadStart_interface_helper;
  v17[2] = CtrXpcClient_threadStart_response_helper;
  v18 = 1;
  std::string::basic_string[abi:ne180100]<0>(buf, "TnmCmd");
  CtrXPC::Client::processClientApi(this, v17, (uint64_t)buf, (uint64_t)a4);
  if (v21 < 0)
    operator delete(*(void **)buf);
  if (!*a4)
  {
    string = xpc_dictionary_get_string(xdict, "PropVal");
    v8 = strlen(string);
    memcpy(a3, string, v8);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Output Network ID = %s.\n", buf, 0xCu);
    }
  }
}

void sub_23A104244(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*(void **)(v1 + 8));
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::generate_diagnostics(CtrXPC::Client *this@<X0>, uint64_t a2@<X8>)
{
  void *__p[2];
  char v5;
  _QWORD v6[3];
  __int16 v7;

  v7 = 0;
  v6[0] = 0;
  v6[1] = CtrXpcClient_generateDiagnostics_interface_helper;
  v6[2] = CtrXpcClient_generateDiagnostics_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TdmCmd");
  CtrXPC::Client::processClientApi(this, v6, (uint64_t)__p, a2);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_23A1042F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::threadStart(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v7[0] = a2;
  v7[1] = CtrXpcClient_threadStart_interface_helper;
  v7[2] = CtrXpcClient_threadStart_response_helper;
  v8 = 1;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A10438C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::threadLeave(CtrXPC::Client *this@<X0>, uint64_t a2@<X8>)
{
  void *__p[2];
  char v5;
  _QWORD v6[3];
  __int16 v7;

  v7 = 0;
  v6[0] = 0;
  v6[1] = CtrXpcClient_threadLeave_interface_helper;
  v6[2] = CtrXpcClient_threadLeave_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApi(this, v6, (uint64_t)__p, a2);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_23A104420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::threadLeaveWithCompletion(uint64_t *a1, uint64_t a2)
{
  void *__p[2];
  char v5;
  _QWORD v6[3];
  __int16 v7;

  v7 = 0;
  v6[0] = 0;
  v6[1] = CtrXpcClient_threadLeave_interface_helper;
  v6[2] = CtrXpcClient_threadLeave_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v6, a2, (uint64_t)__p);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_23A1044B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::updatePrimaryResident(CtrXPC::Client *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_updatePrimaryResident_interface_helper;
  v7[2] = CtrXpcClient_updatePrimaryResident_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApi(a1, v7, (uint64_t)__p, a3);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A104548(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::captureTriggerDataWithCompletion(CtrXPC::Client *this, Ctr_triggerBasedStats *a2)
{
  void *v3[2];
  char v4;
  _BYTE v5[8];
  void *__p;
  char v7;
  _QWORD v8[3];
  __int16 v9;

  v9 = 256;
  v8[0] = a2;
  v8[1] = CtrXpcClient_captureTriggerData_interface_helper;
  v8[2] = CtrXpcClient_captureTriggerData_response_helper;
  std::string::basic_string[abi:ne180100]<0>(v3, "TnmCmd");
  CtrXPC::Client::processClientApi(this, v8, (uint64_t)v3, (uint64_t)v5);
  if (v7 < 0)
    operator delete(__p);
  if (v4 < 0)
    operator delete(v3[0]);
}

void sub_23A1045EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::threadStartWithCompletion(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v7[0] = a2;
  v7[1] = CtrXpcClient_threadStart_interface_helper;
  v7[2] = CtrXpcClient_threadStart_response_helper;
  v8 = 1;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v7, a3, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A104684(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::threadStopWithCompletion(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_threadLeave_interface_helper;
  v7[2] = CtrXpcClient_threadLeave_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v7, a3, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A104718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::provideExtendedMACAddress(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v7[0] = a2;
  v7[1] = CtrXpcClient_provideExtendedMACAddress_interface_helper;
  v7[2] = CtrXpcClient_provideExtendedMACAddress_response_helper;
  v8 = 1;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v7, a3, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A1047B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::startPairing(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_startPairing_interface_helper;
  v7[2] = CtrXpcClient_startPairing_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v7, a3, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A104844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::stopPairing(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_stopPairing_interface_helper;
  v7[2] = CtrXpcClient_stopPairing_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v7, a3, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A1048D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::startFWUpdate(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_startFWUpdate_interface_helper;
  v7[2] = CtrXpcClient_startFWUpdate_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v7, a3, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A10496C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::stopFWUpdate(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *__p[2];
  char v6;
  _QWORD v7[3];
  __int16 v8;

  v8 = 0;
  v7[0] = a2;
  v7[1] = CtrXpcClient_stopFWUpdate_interface_helper;
  v7[2] = CtrXpcClient_stopFWUpdate_response_helper;
  std::string::basic_string[abi:ne180100]<0>(__p, "TnmCmd");
  CtrXPC::Client::processClientApiWithCompletion(a1, v7, a3, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_23A104A00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::State::handleServerError_sync(CtrXPC::Client::State *a1, xpc::object *a2)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  const char *p_block;
  const void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t *p_shared_owners;
  unint64_t v19;
  void *aBlock;
  dispatch_object_t v21;
  xpc_object_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  _QWORD v31[2];
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  xpc_object_t object;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t *block;
  const char *v39;
  void (*v40)(uint64_t);
  void *v41;
  const void *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;

  v4 = *((_QWORD *)a1 + 20);
  std::string::basic_string[abi:ne180100]<0>(&block, "EventServerStateChange");
  v5 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::find<std::string>(v4, (const void **)&block);
  if (SHIBYTE(v40) < 0)
    operator delete(block);
  if (*((_QWORD *)a1 + 20) + 8 != v5)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    v7 = v6;
    v8 = MEMORY[0x24BDACFA0];
    if (v6)
    {
      v37 = v6;
    }
    else
    {
      v7 = xpc_null_create();
      v37 = v7;
      if (!v7)
      {
        v9 = xpc_null_create();
        v7 = 0;
        goto LABEL_11;
      }
    }
    if (MEMORY[0x23B841948](v7) == v8)
    {
      xpc_retain(v7);
      goto LABEL_12;
    }
    v9 = xpc_null_create();
LABEL_11:
    v37 = v9;
LABEL_12:
    xpc_release(v7);
    v10 = xpc_dictionary_create(0, 0, 0);
    v11 = v10;
    if (v10)
    {
      v36 = v10;
    }
    else
    {
      v11 = xpc_null_create();
      v36 = v11;
      if (!v11)
      {
        v12 = xpc_null_create();
        v11 = 0;
        goto LABEL_19;
      }
    }
    if (MEMORY[0x23B841948](v11) == v8)
    {
      xpc_retain(v11);
LABEL_20:
      xpc_release(v11);
      v34 = xpc_string_create("ServerStateError");
      if (!v34)
        v34 = xpc_null_create();
      block = &v36;
      v39 = "KeyServerState";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v34, &object);
      xpc_release(object);
      object = 0;
      xpc_release(v34);
      v34 = 0;
      xpc::object::to_string(a2);
      if (SHIBYTE(v40) >= 0)
        p_block = (const char *)&block;
      else
        p_block = (const char *)block;
      v32 = xpc_string_create(p_block);
      if (!v32)
        v32 = xpc_null_create();
      v31[0] = &v36;
      v31[1] = "KeyErrorString";
      xpc::dict::object_proxy::operator=((uint64_t)v31, &v32, &v33);
      xpc_release(v33);
      v33 = 0;
      xpc_release(v32);
      v32 = 0;
      if (SHIBYTE(v40) < 0)
        operator delete(block);
      v29 = xpc_string_create("eventNotification");
      if (!v29)
        v29 = xpc_null_create();
      block = &v37;
      v39 = "command";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v29, &v30);
      xpc_release(v30);
      v30 = 0;
      xpc_release(v29);
      v29 = 0;
      v27 = xpc_string_create("EventServerStateChange");
      if (!v27)
        v27 = xpc_null_create();
      block = &v37;
      v39 = "event";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v27, &v28);
      xpc_release(v28);
      v28 = 0;
      xpc_release(v27);
      v27 = 0;
      v25 = v36;
      if (v36)
        xpc_retain(v36);
      else
        v25 = xpc_null_create();
      block = &v37;
      v39 = "eventData";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v25, &v26);
      xpc_release(v26);
      v26 = 0;
      xpc_release(v25);
      v25 = 0;
      v22 = v37;
      if (v37)
        xpc_retain(v37);
      else
        v22 = xpc_null_create();
      aBlock = 0;
      v21 = 0;
      CtrXPC::Event::create(&v22, (uint64_t)&aBlock, &v23);
      v14 = *(const void **)(v5 + 56);
      if (v14)
        v15 = _Block_copy(v14);
      else
        v15 = 0;
      v16 = *(NSObject **)(v5 + 64);
      block = (xpc_object_t *)MEMORY[0x24BDAC760];
      v39 = (const char *)1174405120;
      v40 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke;
      v41 = &__block_descriptor_tmp_139;
      if (v15)
        v17 = _Block_copy(v15);
      else
        v17 = 0;
      v42 = v17;
      v43 = v23;
      v44 = v24;
      if (v24)
      {
        p_shared_owners = &v24->__shared_owners_;
        do
          v19 = __ldxr((unint64_t *)p_shared_owners);
        while (__stxr(v19 + 1, (unint64_t *)p_shared_owners));
      }
      dispatch_async(v16, &block);
      if (v44)
        std::__shared_weak_count::__release_shared[abi:ne180100](v44);
      if (v42)
        _Block_release(v42);
      if (v15)
        _Block_release(v15);
      if (v24)
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      if (v21)
        dispatch_release(v21);
      if (aBlock)
        _Block_release(aBlock);
      xpc_release(v22);
      v22 = 0;
      xpc_release(v36);
      xpc_release(v37);
      goto LABEL_61;
    }
    v12 = xpc_null_create();
LABEL_19:
    v36 = v12;
    goto LABEL_20;
  }
LABEL_61:
  if (*(_QWORD *)a2 != MEMORY[0x24BDACF48])
    CtrXPC::Client::State::disconnect_sync(a1);
}

void sub_23A104ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,xpc_object_t a26)
{
  uint64_t v26;

  dispatch::callback<void({block_pointer})(xpc::dict)>::~callback((uint64_t)&a9);
  xpc::dict::~dict(&a11);
  xpc::dict::~dict(&a26);
  xpc::dict::~dict((xpc_object_t *)(v26 - 128));
  _Unwind_Resume(a1);
}

void CtrXPC::Client::State::handleMessage_sync(uint64_t a1, xpc::dict *a2)
{
  __int128 *v4;
  __int128 v5;
  unint64_t *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  size_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  CtrXPC::Event *v21;
  uint64_t *p_shared_owners;
  unint64_t v23;
  const void *v24;
  void *v25;
  uint64_t v26;
  CtrXPC::Event *v27;
  uint64_t *v28;
  unint64_t v29;
  const void *v30;
  NSObject *v31;
  void *v32;
  unint64_t *v33;
  unint64_t v34;
  NSObject *v35;
  void *v36;
  unint64_t *v37;
  unint64_t v38;
  _QWORD aBlock[5];
  __int128 v40;
  void *v41;
  dispatch_object_t object;
  xpc_object_t v43;
  CtrXPC::Event *v44;
  std::__shared_weak_count *v45;
  __int128 __p;
  void (*v47)(uint64_t);
  void *v48;
  void *v49;
  CtrXPC::Event *v50;
  std::__shared_weak_count *v51;
  uint8_t buf[24];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    xpc::dict::to_debug_string(a2, &__p);
    v4 = SHIBYTE(v47) >= 0 ? &__p : (__int128 *)__p;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Message From Server: %s", buf, 0xCu);
    if (SHIBYTE(v47) < 0)
      operator delete((void *)__p);
  }
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&__p, (_QWORD *)(a1 + 8));
  v5 = __p;
  *(_OWORD *)buf = __p;
  if (*((_QWORD *)&__p + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&__p + 1) + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v5 + 1));
  }
  v8 = *(void **)a2;
  v43 = v8;
  if (v8)
    xpc_retain(v8);
  else
    v43 = xpc_null_create();
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_141;
  aBlock[4] = a1;
  v40 = v5;
  if (*((_QWORD *)&v5 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v5 + 1) + 16);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = _Block_copy(aBlock);
  v13 = *(NSObject **)(a1 + 24);
  if (v13)
    dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  v41 = v12;
  object = v13;
  CtrXPC::Event::create(&v43, (uint64_t)&v41, &v44);
  if (object)
    dispatch_release(object);
  if (v41)
    _Block_release(v41);
  xpc_release(v43);
  v43 = 0;
  CtrXPC::Event::name((CtrXPC::Event::State **)v44);
  v14 = strlen("invalid");
  if ((SHIBYTE(v47) & 0x80000000) == 0)
  {
    if (v14 != HIBYTE(v47))
      goto LABEL_33;
    if (v14 != -1)
    {
      if (!memcmp(&__p, "invalid", v14))
        goto LABEL_77;
      goto LABEL_33;
    }
LABEL_84:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  if (v14 != *((_QWORD *)&__p + 1))
  {
    operator delete((void *)__p);
    goto LABEL_33;
  }
  if (v14 == -1)
    goto LABEL_84;
  v15 = (void *)__p;
  v16 = memcmp((const void *)__p, "invalid", v14);
  operator delete(v15);
  if (!v16)
    goto LABEL_77;
LABEL_33:
  v17 = *(_QWORD *)(a1 + 160);
  CtrXPC::Event::name((CtrXPC::Event::State **)v44);
  v18 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::find<std::string>(v17, (const void **)&__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p);
  v19 = *(_QWORD *)(a1 + 160);
  if (v19 + 8 != v18)
  {
    v21 = v44;
    v20 = v45;
    if (v45)
    {
      p_shared_owners = &v45->__shared_owners_;
      do
        v23 = __ldxr((unint64_t *)p_shared_owners);
      while (__stxr(v23 + 1, (unint64_t *)p_shared_owners));
    }
    v24 = *(const void **)(v18 + 56);
    if (v24)
      v25 = _Block_copy(v24);
    else
      v25 = 0;
    v31 = *(NSObject **)(v18 + 64);
    *(_QWORD *)&__p = v9;
    *((_QWORD *)&__p + 1) = 1174405120;
    v47 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke;
    v48 = &__block_descriptor_tmp_139;
    if (v25)
      v32 = _Block_copy(v25);
    else
      v32 = 0;
    v49 = v32;
    v50 = v21;
    v51 = v20;
    if (v20)
    {
      v33 = (unint64_t *)&v20->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    dispatch_async(v31, &__p);
    if (v51)
      std::__shared_weak_count::__release_shared[abi:ne180100](v51);
    if (v49)
      _Block_release(v49);
    if (!v25)
      goto LABEL_75;
    goto LABEL_74;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "All");
  v26 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::find<std::string>(v19, (const void **)&__p);
  if (SHIBYTE(v47) < 0)
    operator delete((void *)__p);
  if (*(_QWORD *)(a1 + 160) + 8 != v26)
  {
    v27 = v44;
    v20 = v45;
    if (v45)
    {
      v28 = &v45->__shared_owners_;
      do
        v29 = __ldxr((unint64_t *)v28);
      while (__stxr(v29 + 1, (unint64_t *)v28));
    }
    v30 = *(const void **)(v26 + 56);
    if (v30)
      v25 = _Block_copy(v30);
    else
      v25 = 0;
    v35 = *(NSObject **)(v26 + 64);
    *(_QWORD *)&__p = v9;
    *((_QWORD *)&__p + 1) = 1174405120;
    v47 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke;
    v48 = &__block_descriptor_tmp_139;
    if (v25)
      v36 = _Block_copy(v25);
    else
      v36 = 0;
    v49 = v36;
    v50 = v27;
    v51 = v20;
    if (v20)
    {
      v37 = (unint64_t *)&v20->__shared_owners_;
      do
        v38 = __ldxr(v37);
      while (__stxr(v38 + 1, v37));
    }
    dispatch_async(v35, &__p);
    if (v51)
      std::__shared_weak_count::__release_shared[abi:ne180100](v51);
    if (v49)
      _Block_release(v49);
    if (!v25)
      goto LABEL_75;
LABEL_74:
    _Block_release(v25);
LABEL_75:
    if (v20)
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
LABEL_77:
  if (v45)
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  if (*((_QWORD *)&v40 + 1))
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v40 + 1));
  if (*((_QWORD *)&v5 + 1))
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v5 + 1));
}

void sub_23A105428(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ___ZN6CtrXPC6Client5State17handleDaemonReadyEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Daemon ready received", (uint8_t *)v4, 2u);
  }
  if (MEMORY[0x23B841948](*(_QWORD *)(v1 + 40)) == MEMORY[0x24BDACF88])
  {
    v2 = *(_DWORD *)(v1 + 176);
    v3 = v2 + 1;
    if (v2 == -1)
    {
      __break(0x5500u);
    }
    else
    {
      *(_DWORD *)(v1 + 176) = v3;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v4[0] = 67109120;
        v4[1] = v3;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Extra increased to: %d", (uint8_t *)v4, 8u);
      }
    }
  }
  else
  {
    CtrXPC::Client::State::handleServerReady_sync((dispatch_queue_t *)v1);
  }
}

void CtrXPC::Client::State::handleServerReady_sync(dispatch_queue_t *this)
{
  uint8_t v2[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Server Ready", v2, 2u);
  }
  CtrXPC::Client::State::connect_sync(this);
}

void ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t *p_shared_owners;
  unint64_t v6;
  _QWORD block[6];
  std::__shared_weak_count *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v9, a1);
  v4 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_250B202A8;
  block[5] = v9;
  v8 = v10;
  if (v10)
  {
    p_shared_owners = &v10->__shared_owners_;
    do
      v6 = __ldxr((unint64_t *)p_shared_owners);
    while (__stxr(v6 + 1, (unint64_t *)p_shared_owners));
  }
  block[4] = a2;
  dispatch_async(v4, block);
  if (v8)
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  if (v10)
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_QWORD *__copy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1, uint64_t a2)
{
  return std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]((_QWORD *)(a1 + 40), (_QWORD *)(a2 + 40));
}

uint64_t __destroy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1)
{
  return std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](a1 + 40);
}

_QWORD *std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(_QWORD *a1, _QWORD *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4)
    goto LABEL_5;
  return a1;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

_QWORD *std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  return a1;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void CtrXPC::Client::State::connect_sync(dispatch_queue_t *this)
{
  _QWORD *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v2 = this + 9;
    if (*((char *)this + 95) < 0)
      v2 = (_QWORD *)*v2;
    v3 = 136315138;
    v4 = v2;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Started on name '%s'", (uint8_t *)&v3, 0xCu);
  }
  CtrXPC::Client::State::createConnection_sync(this);
  CtrXPC::Client::State::checkIn_sync((CtrXPC::Client::State *)this);
  if (*((_DWORD *)this + 37))
  {
    CtrXPC::Client::State::changeEventsState_sync((uint64_t)this, 0);
    CtrXPC::Client::State::eventsOn_sync((CtrXPC::Client::State *)this);
  }
}

void CtrXPC::Client::State::createConnection_sync(dispatch_queue_t *this)
{
  const char *v2;
  xpc_connection_t mach_service;
  xpc_object_t v4;
  xpc_object_t object;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Create server connection", buf, 2u);
  }
  v2 = (const char *)(this + 9);
  if (*((char *)this + 95) < 0)
    v2 = *(const char **)v2;
  mach_service = xpc_connection_create_mach_service(v2, this[3], 2uLL);
  *(_QWORD *)buf = mach_service;
  if (mach_service)
  {
    v4 = mach_service;
    object = mach_service;
  }
  else
  {
    v4 = xpc_null_create();
    object = v4;
    *(_QWORD *)buf = v4;
    if (!v4)
    {
      v4 = 0;
      object = xpc_null_create();
      goto LABEL_9;
    }
  }
  xpc_retain(v4);
LABEL_9:
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
  xpc_release(v4);
}

void sub_23A105A00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  xpc_object_t v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, xpc_object_t);
  xpc::connection::~connection((xpc_object_t *)va);
  xpc::connection::~connection((xpc_object_t *)va1);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::State::checkIn_sync(CtrXPC::Client::State *this)
{
  int v1;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  xpc_object_t object;
  _QWORD aBlock[6];
  std::__shared_weak_count *v11;
  void *v12;
  void *__p[2];
  char v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint8_t buf[8];
  std::__shared_weak_count *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = *((_DWORD *)this + 36);
  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v1;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Checked in state is %u, skipping", buf, 8u);
    }
  }
  else
  {
    CtrXPC::Client::State::changeCheckInState_sync((uint64_t)this, 1);
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v17, (_QWORD *)this + 1);
    v4 = v17;
    v3 = v18;
    *(_QWORD *)buf = v17;
    v20 = v18;
    if (v18)
    {
      p_shared_weak_owners = (unint64_t *)&v18->__shared_weak_owners_;
      do
        v6 = __ldxr(p_shared_weak_owners);
      while (__stxr(v6 + 1, p_shared_weak_owners));
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "checkIn");
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN6CtrXPC6Client5State12checkIn_syncEv_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_72;
    aBlock[4] = this;
    aBlock[5] = v4;
    v11 = v3;
    if (v3)
    {
      v7 = (unint64_t *)&v3->__shared_weak_owners_;
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v12 = _Block_copy(aBlock);
    object = xpc_null_create();
    CtrXPC::Client::State::createCommand_sync((uint64_t)this, (uint64_t)__p, &v12, &object, &v15);
    CtrXPC::Client::State::perform_sync((uint64_t)this, &v15);
    if (v16)
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    xpc_release(object);
    object = 0;
    if (v12)
      _Block_release(v12);
    if (v14 < 0)
      operator delete(__p[0]);
    if (v11)
      std::__shared_weak_count::__release_weak(v11);
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_23A105BEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *aBlock, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::State::changeEventsState_sync(uint64_t a1, int a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(a1 + 148);
    v5[0] = 67109376;
    v5[1] = v4;
    v6 = 1024;
    v7 = a2;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Changing event state from %u -> %u", (uint8_t *)v5, 0xEu);
  }
  *(_DWORD *)(a1 + 148) = a2;
}

void CtrXPC::Client::State::eventsOn_sync(CtrXPC::Client::State *this)
{
  int v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  xpc_object_t object;
  _QWORD aBlock[6];
  std::__shared_weak_count *v13;
  void *v14;
  void *__p[2];
  char v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint8_t buf[8];
  std::__shared_weak_count *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *((_DWORD *)this + 37);
  if (v2 == 1)
    goto LABEL_4;
  if (!v2)
  {
    CtrXPC::Client::State::changeEventsState_sync((uint64_t)this, 1);
LABEL_4:
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v19, (_QWORD *)this + 1);
    v4 = v19;
    v3 = v20;
    *(_QWORD *)buf = v19;
    v22 = v20;
    if (v20)
    {
      p_shared_weak_owners = (unint64_t *)&v20->__shared_weak_owners_;
      do
        v6 = __ldxr(p_shared_weak_owners);
      while (__stxr(v6 + 1, p_shared_weak_owners));
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "eventsOn");
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN6CtrXPC6Client5State13eventsOn_syncEv_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_115;
    aBlock[4] = this;
    aBlock[5] = v4;
    v13 = v3;
    if (v3)
    {
      v7 = (unint64_t *)&v3->__shared_weak_owners_;
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v14 = _Block_copy(aBlock);
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v9, (_QWORD *)this + 20);
    CtrXPC::Client::State::convert_sync((uint64_t)this, (uint64_t)&v9, &object);
    CtrXPC::Client::State::createCommand_sync((uint64_t)this, (uint64_t)__p, &v14, &object, &v17);
    CtrXPC::Client::State::perform_sync((uint64_t)this, &v17);
    if (v18)
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    xpc_release(object);
    object = 0;
    if (v10)
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    if (v14)
      _Block_release(v14);
    if (v16 < 0)
      operator delete(__p[0]);
    if (v13)
      std::__shared_weak_count::__release_weak(v13);
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v2;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Events state is %u, so skipping", buf, 8u);
  }
}

void sub_23A105F20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *aBlock,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void xpc::connection::~connection(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

void CtrXPC::Client::State::changeCheckInState_sync(uint64_t a1, int a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = *(_DWORD *)(a1 + 144);
    v5[0] = 67109376;
    v5[1] = v4;
    v6 = 1024;
    v7 = a2;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Changing checked in state from %u -> %u", (uint8_t *)v5, 0xEu);
  }
  *(_DWORD *)(a1 + 144) = a2;
}

void CtrXPC::Client::State::perform_sync(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v11[6];
  std::__shared_weak_count *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  if (*a2)
  {
    v4 = (_QWORD *)(a1 + 8);
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v15, (_QWORD *)(a1 + 8));
    v6 = v15;
    v5 = v16;
    if (v16)
    {
      p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
      do
        v8 = __ldxr(p_shared_weak_owners);
      while (__stxr(v8 + 1, p_shared_weak_owners));
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1174405120;
    v11[2] = ___ZN6CtrXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke;
    v11[3] = &__block_descriptor_tmp_78;
    v11[4] = a1;
    v11[5] = v6;
    v12 = v5;
    if (v5)
    {
      v9 = (unint64_t *)&v5->__shared_weak_owners_;
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v13, a2);
    ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v4, (uint64_t)v11);
    if (v14)
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    if (v12)
      std::__shared_weak_count::__release_weak(v12);
    if (v5)
      std::__shared_weak_count::__release_weak(v5);
  }
}

void CtrXPC::Client::State::createCommand_sync(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  xpc_object_t object;
  void *v24;
  dispatch_object_t v25;
  __int128 v26;
  _QWORD aBlock[4];
  void *v28;
  _QWORD *v29;
  const char *v30;
  xpc_object_t v31;
  xpc_object_t v32;

  v10 = MEMORY[0x23B841948](*a4);
  v11 = MEMORY[0x24BDACFA0];
  if (v10 != MEMORY[0x24BDACFA0])
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    if (v12 || (v12 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x23B841948](v12) == v11)
      {
        xpc_retain(v12);
        v13 = v12;
      }
      else
      {
        v13 = xpc_null_create();
      }
    }
    else
    {
      v13 = xpc_null_create();
      v12 = 0;
    }
    xpc_release(v12);
    v14 = xpc_null_create();
    v15 = (void *)*a4;
    *a4 = v13;
    xpc_release(v15);
    xpc_release(v14);
  }
  v16 = (const char *)(a1 + 120);
  if (*(char *)(a1 + 143) < 0)
    v16 = *(const char **)v16;
  v31 = xpc_string_create(v16);
  if (!v31)
    v31 = xpc_null_create();
  v29 = a4;
  v30 = "clientName";
  xpc::dict::object_proxy::operator=((uint64_t)&v29, &v31, &v32);
  xpc_release(v32);
  v32 = 0;
  xpc_release(v31);
  v31 = 0;
  v17 = MEMORY[0x24BDAC760];
  *a5 = 0;
  a5[1] = 0;
  aBlock[0] = v17;
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN6CtrXPC6Client5State18createCommand_syncENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvNS_6ResultEN3xpc4dictEEEESD__block_invoke;
  aBlock[3] = &__block_descriptor_tmp_113;
  v18 = *a3;
  if (*a3)
    v18 = _Block_copy(v18);
  v28 = v18;
  v19 = _Block_copy(aBlock);
  v20 = *(NSObject **)(a1 + 24);
  if (v20)
    dispatch_retain(v20);
  v29 = v19;
  v30 = (const char *)v20;
  if (v19)
    v21 = _Block_copy(v19);
  else
    v21 = 0;
  v24 = v21;
  v25 = v20;
  if (v20)
    dispatch_retain(v20);
  v22 = (void *)*a4;
  object = v22;
  if (v22)
    xpc_retain(v22);
  else
    object = xpc_null_create();
  CtrXPC::Command::create(a2, (uint64_t)&v24, &object, &v26);
  std::shared_ptr<CtrXPC::Command>::operator=[abi:ne180100]((uint64_t)a5, &v26);
  if (*((_QWORD *)&v26 + 1))
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v26 + 1));
  xpc_release(object);
  object = 0;
  if (v25)
    dispatch_release(v25);
  if (v24)
    _Block_release(v24);
  if (v20)
    dispatch_release(v20);
  if (v19)
    _Block_release(v19);
  if (v28)
    _Block_release(v28);
}

void sub_23A10641C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *aBlock, char a19)
{
  uint64_t v19;

  xpc::dict::~dict((xpc_object_t *)&a9);
  dispatch::callback<void({block_pointer})(CtrXPC::Result,xpc::dict)>::~callback((uint64_t)&a10);
  dispatch::callback<void({block_pointer})(CtrXPC::Result,xpc::dict)>::~callback((uint64_t)&a19);
  if (aBlock)
    _Block_release(aBlock);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](v19);
  _Unwind_Resume(a1);
}

void ___ZN6CtrXPC6Client5State12checkIn_syncEv_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v3 = *(_QWORD *)(a1 + 32);
  std::weak_ptr<CtrXPC::Client::State>::lock((_QWORD *)(a1 + 40), &v4);
  if (v4 && !*a2)
    CtrXPC::Client::State::changeCheckInState_sync(v3, 2);
  if (v5)
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

uint64_t __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t a1)
{
  return std::weak_ptr<ctu::XpcClient>::~weak_ptr(a1 + 40);
}

void ___ZN6CtrXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  CtrXPC::Command **v3;
  std::string *p_str;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  CtrXPC::Command *v8;
  void *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  xpc_object_t v15;
  xpc_object_t object;
  int v17;
  void *__p[2];
  uint64_t v19;
  _QWORD aBlock[6];
  std::__shared_weak_count *v21;
  std::string v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  void *v25;
  void *v26;
  std::string __str;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint8_t buf[24];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  std::weak_ptr<CtrXPC::Client::State>::lock((_QWORD *)(a1 + 40), &v28);
  if (v28)
  {
    v3 = (CtrXPC::Command **)(a1 + 56);
    CtrXPC::Command::name(*(CtrXPC::Command::State ***)(a1 + 56));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      p_str = &__str;
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = p_str;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Performing command: %s", buf, 0xCu);
    }
    v5 = CtrXPC::Command::notifiable(*v3);
    v6 = *(_QWORD *)(v2 + 40);
    if (v5)
    {
      v7 = MEMORY[0x23B841948](v6);
      v8 = *v3;
      if (v7 == MEMORY[0x24BDACF88])
      {
        CtrXPC::Command::get((void ***)*v3, &v26);
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1174405120;
        aBlock[2] = ___ZN6CtrXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_73;
        aBlock[3] = &__block_descriptor_tmp_76;
        v12 = *(_QWORD *)(a1 + 40);
        v11 = *(std::__shared_weak_count **)(a1 + 48);
        aBlock[4] = v2;
        aBlock[5] = v12;
        v21 = v11;
        if (v11)
        {
          p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
          do
            v14 = __ldxr(p_shared_weak_owners);
          while (__stxr(v14 + 1, p_shared_weak_owners));
        }
        std::string::basic_string(&v22, &__str);
        std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v23, v3);
        v25 = _Block_copy(aBlock);
        CtrXPC::Client::State::send_with_reply_sync(v2, &v26, &v25);
        if (v25)
          _Block_release(v25);
        xpc_release(v26);
        v26 = 0;
        if (v24)
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v22.__r_.__value_.__l.__data_);
        if (v21)
          std::__shared_weak_count::__release_weak(v21);
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "Server not available");
        v17 = 2;
        *(_OWORD *)__p = *(_OWORD *)buf;
        v19 = *(_QWORD *)&buf[16];
        memset(buf, 0, sizeof(buf));
        object = xpc_null_create();
        CtrXPC::Command::notify((uint64_t *)v8, (uint64_t)&v17, &object);
        xpc_release(object);
        object = 0;
        if (SHIBYTE(v19) < 0)
          operator delete(__p[0]);
        if ((char)buf[23] < 0)
          operator delete(*(void **)buf);
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x23B841858](v6);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(v2 + 40);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "perform_sync_block_invoke";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2080;
        v31 = v9;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: xpc connection obj in clinet: %p: \n %s", buf, 0x20u);
      }
      free(v9);
      CtrXPC::Command::get((void ***)*v3, &v15);
      CtrXPC::Client::State::send_sync(v2, &v15);
      xpc_release(v15);
      v15 = 0;
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v29)
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
}

void sub_23A106828(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t a36,void *aBlock)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::State::send_with_reply_sync(uint64_t a1, void **a2, void **a3)
{
  _xpc_connection_s *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD handler[4];
  void *aBlock;

  if (MEMORY[0x23B841948](*(_QWORD *)(a1 + 40)) == MEMORY[0x24BDACF88])
  {
    v6 = *(_xpc_connection_s **)(a1 + 40);
    v7 = *a2;
    v8 = *(NSObject **)(a1 + 24);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 1174405120;
    handler[2] = ___ZN6CtrXPC6Client5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke;
    handler[3] = &__block_descriptor_tmp_80;
    v9 = *a3;
    if (*a3)
      v9 = _Block_copy(v9);
    aBlock = v9;
    xpc_connection_send_message_with_reply(v6, v7, v8, handler);
    if (aBlock)
      _Block_release(aBlock);
  }
}

void sub_23A1069C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  if (aBlock)
    _Block_release(aBlock);
  _Unwind_Resume(exception_object);
}

void ___ZN6CtrXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_73(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v4;
  _QWORD *v5;
  uint64_t *v6;
  xpc_object_t v7;
  int v8;
  std::string __p;
  xpc_object_t object;
  xpc_object_t v11;
  int v12;
  std::string v13;
  xpc_object_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  std::string buf;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  std::weak_ptr<CtrXPC::Client::State>::lock((_QWORD *)(a1 + 40), &v15);
  if (v15)
  {
    v4 = *a2;
    v14 = v4;
    if (v4 && MEMORY[0x23B841948](v4) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v4);
    }
    else
    {
      v4 = xpc_null_create();
      v14 = v4;
    }
    std::string::basic_string[abi:ne180100]<0>(&buf, "Unknown internal error");
    v12 = 1;
    v13 = buf;
    object = v4;
    if (v4)
      xpc_retain(v4);
    else
      object = xpc_null_create();
    CtrXPC::Client::State::parseReply_sync(&object, (uint64_t)&v12, &v11);
    xpc_release(object);
    object = 0;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        CtrXPC::Result::describe((uint64_t *)&buf, (CtrXPC::Result *)&v12);
        ___ZN6CtrXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_73_cold_1();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v5 = (_QWORD *)(a1 + 56);
      if (*(char *)(a1 + 79) < 0)
        v5 = (_QWORD *)*v5;
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successful: %s", (uint8_t *)&buf, 0xCu);
    }
    v6 = *(uint64_t **)(a1 + 80);
    v8 = v12;
    std::string::basic_string(&__p, &v13);
    v7 = v11;
    if (v11)
      xpc_retain(v11);
    else
      v7 = xpc_null_create();
    CtrXPC::Command::notify(v6, (uint64_t)&v8, &v7);
    xpc_release(v7);
    v7 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    xpc_release(v11);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
    xpc_release(v4);
  }
  if (v16)
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
}

void sub_23A106C20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29,int a30,__int16 a31,char a32,char a33)
{
  _Unwind_Resume(exception_object);
}

void CtrXPC::Client::State::parseReply_sync(_QWORD *a1@<X1>, uint64_t a2@<X2>, xpc_object_t *a3@<X8>)
{
  int v6;
  xpc_object_t v7;
  xpc_object_t v8;
  _QWORD v9[2];
  xpc_object_t v10;
  xpc_object_t object[2];
  char v12;
  std::string __str;
  void *v14;
  const char *v15;
  uint64_t v16;

  *a3 = xpc_null_create();
  std::string::basic_string[abi:ne180100]<0>(&__str, "Server not available");
  if (MEMORY[0x23B841948](*a1) == MEMORY[0x24BDACFA0])
  {
    v14 = a1;
    v15 = "commandData";
    xpc::dict::object_proxy::operator xpc::dict((uint64_t)&v14, object);
    v7 = object[0];
    object[0] = xpc_null_create();
    v8 = *a3;
    *a3 = v7;
    xpc_release(v8);
    xpc_release(object[0]);
    v14 = a1;
    v15 = "commandResult";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v14, object);
    v6 = xpc::dyn_cast_or_default((xpc *)object, (const object *)1);
    xpc_release(object[0]);
    v9[0] = a3;
    v9[1] = "KeyErrorString";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)v9, &v10);
    v14 = 0;
    v15 = 0;
    v16 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v16) < 0)
      operator delete(v14);
    std::string::operator=[abi:ne180100]((uint64_t)&__str, (__int128 *)object);
    if (v12 < 0)
      operator delete(object[0]);
    xpc_release(v10);
  }
  else
  {
    v6 = 2;
  }
  *(_DWORD *)a2 = v6;
  std::string::operator=((std::string *)(a2 + 8), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_23A106E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  xpc_object_t *v20;
  uint64_t v21;

  if (*(char *)(v21 - 33) < 0)
    operator delete(*(void **)(v21 - 56));
  xpc_release(object);
  if (a20 < 0)
    operator delete(__p);
  xpc::dict::~dict(v20);
  _Unwind_Resume(a1);
}

uint64_t CtrXPC::Result::describe(CtrXPC::Result *this)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t result;
  unint64_t v7;
  void *__p[2];
  char v9;
  _QWORD v10[11];
  char v11;
  uint64_t v12;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v10);
  v2 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v10, "Result:'");
  CtrXPC::Result::toString(*(_DWORD *)this, __p);
  v3 = std::operator<<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v2, (uint64_t)__p);
  std::operator<<[abi:ne180100]<std::char_traits<char>>(v3, "'");
  if (v9 < 0)
    operator delete(__p[0]);
  if (*((char *)this + 31) < 0)
  {
    if (!*((_QWORD *)this + 2))
      goto LABEL_8;
    goto LABEL_7;
  }
  if (*((_BYTE *)this + 31))
  {
LABEL_7:
    v4 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v10, " Info:'");
    v5 = std::operator<<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v4, (uint64_t)this + 8);
    std::operator<<[abi:ne180100]<std::char_traits<char>>(v5, "'");
  }
LABEL_8:
  result = std::stringbuf::str();
  v10[0] = *MEMORY[0x24BEDB800];
  v7 = *(_QWORD *)(v10[0] - 24);
  if (v7 > 0x100)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)((char *)v10 + v7) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
    v10[1] = MEMORY[0x24BEDB848] + 16;
    if (v11 < 0)
      operator delete((void *)v10[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return MEMORY[0x23B84136C](&v12);
  }
  return result;
}

void sub_23A106FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c43_ZTSNSt3__110shared_ptrIN6CtrXPC7CommandEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  std::string::basic_string((std::string *)(a1 + 56), (const std::string *)(a2 + 56));
  return std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]((_QWORD *)(a1 + 80), (_QWORD *)(a2 + 80));
}

void sub_23A107078(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::weak_ptr<ctu::XpcClient>::~weak_ptr(v1);
  _Unwind_Resume(a1);
}

uint64_t __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c43_ZTSNSt3__110shared_ptrIN6CtrXPC7CommandEEE(uint64_t a1)
{
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](a1 + 80);
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  return std::weak_ptr<ctu::XpcClient>::~weak_ptr(a1 + 40);
}

void CtrXPC::Client::State::send_sync(uint64_t a1, xpc_object_t *a2)
{
  _xpc_connection_s *remote_connection;

  if (xpc_dictionary_get_remote_connection(*a2))
  {
    remote_connection = xpc_dictionary_get_remote_connection(*a2);
    xpc_connection_send_message(remote_connection, *a2);
  }
}

_QWORD *__copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c43_ZTSNSt3__110shared_ptrIN6CtrXPC7CommandEEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[6];
  a1[5] = a2[5];
  a1[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](a1 + 7, a2 + 7);
}

uint64_t __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c43_ZTSNSt3__110shared_ptrIN6CtrXPC7CommandEEE(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 40;
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](a1 + 56);
  return std::weak_ptr<ctu::XpcClient>::~weak_ptr(v1);
}

void ___ZN6CtrXPC6Client5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  xpc_object_t objecta;

  objecta = object;
  if (object)
    xpc_retain(object);
  else
    objecta = xpc_null_create();
  dispatch::block<void({block_pointer})(xpc::object)>::operator()<xpc::object>((uint64_t *)(a1 + 32), &objecta);
  xpc_release(objecta);
}

void sub_23A1071B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void dispatch::block<void({block_pointer})(xpc::object)>::operator()<xpc::object>(uint64_t *a1, xpc_object_t *a2)
{
  uint64_t v2;
  xpc_object_t object;

  v2 = *a1;
  object = *a2;
  *a2 = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v2 + 16))(v2, &object);
  xpc_release(object);
}

void sub_23A107220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_23A107350(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x23B84136C](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

_QWORD *std::operator<<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, a2, v3);
}

_QWORD *CtrXPC::Result::toString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 0xE)
    v2 = "kInvalidErrorCode";
  else
    v2 = off_250B206D0[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x23B84136C](a1 + 112);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const std::locale::facet *v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x23B8412DC](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = a2 + a3;
    if ((*(_DWORD *)(v6 + 8) & 0xB0) == 0x20)
      v9 = v8;
    else
      v9 = a2;
    v10 = *(_DWORD *)(v6 + 144);
    if (v10 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v11 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v10;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v9, v8, v6, v10))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x23B8412E8](v13);
  return a1;
}

void sub_23A107588(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x23B8412E8](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23A107568);
}

void sub_23A1075D0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  void *__p[2];
  char v17;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    v12 = v11 - (a4 - a2);
    if (v11 > a4 - a2)
    {
      if (!__OFSUB__(v11, a4 - a2))
        goto LABEL_7;
      __break(0x5515u);
    }
    v12 = 0;
LABEL_7:
    if (a3 - a2 < 1 || (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) == a3 - a2)
    {
      if (v12 >= 1)
      {
        std::string::basic_string[abi:ne180100](__p, v12, a6);
        if (v17 >= 0)
          v13 = __p;
        else
          v13 = (void **)__p[0];
        if ((*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12) != v12)
        {
          if (v17 < 0)
            operator delete(__p[0]);
          return 0;
        }
        if (v17 < 0)
          operator delete(__p[0]);
      }
      v14 = a4 - a3;
      if (v14 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v14) == v14)
      {
        *(_QWORD *)(a5 + 24) = 0;
        return v6;
      }
    }
    return 0;
  }
  return v6;
}

void sub_23A107718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *a1, unint64_t a2, char a3)
{
  _QWORD *v3;
  size_t v6;
  uint64_t v7;

  v3 = a1;
  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 >= 0x17)
  {
    if ((a2 | 7) == 0x17)
      v6 = 25;
    else
      v6 = (a2 | 7) + 1;
    a1 = operator new(v6);
    v3[1] = a2;
    v3[2] = v6 | 0x8000000000000000;
    *v3 = a1;
  }
  else
  {
    *((_BYTE *)a1 + 23) = a2;
    if (!a2)
      goto LABEL_11;
  }
  v7 = 0;
  do
    *((_BYTE *)a1 + v7++) = a3;
  while (a2 != v7);
LABEL_11:
  *((_BYTE *)a1 + a2) = 0;
  return v3;
}

void ___ZN6CtrXPC6Client5State18createCommand_syncENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvNS_6ResultEN3xpc4dictEEEESD__block_invoke(uint64_t a1, int *a2, void **a3)
{
  dispatch::block<void({block_pointer})(CtrXPC::Result,xpc::dict)>::operator()<CtrXPC::Result&,xpc::dict&>((uint64_t *)(a1 + 32), a2, a3);
}

void dispatch::block<void({block_pointer})(CtrXPC::Result,xpc::dict)>::operator()<CtrXPC::Result&,xpc::dict&>(uint64_t *a1, int *a2, void **a3)
{
  uint64_t v4;
  void *v5;
  xpc_object_t object;
  int v7;
  std::string __p;

  v4 = *a1;
  v7 = *a2;
  std::string::basic_string(&__p, (const std::string *)(a2 + 2));
  v5 = *a3;
  object = v5;
  if (v5)
    xpc_retain(v5);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, int *, xpc_object_t *))(v4 + 16))(v4, &v7, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A107860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc::dict::~dict(&a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN6CtrXPC6ResultEN3xpc4dictEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN6CtrXPC6ResultEN3xpc4dictEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t std::shared_ptr<CtrXPC::Command>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  return a1;
}

uint64_t std::weak_ptr<ctu::XpcClient>::~weak_ptr(uint64_t a1)
{
  std::__shared_weak_count *v2;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

void ___ZN6CtrXPC6Client5State13eventsOn_syncEv_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  v3 = *(_QWORD *)(a1 + 32);
  std::weak_ptr<CtrXPC::Client::State>::lock((_QWORD *)(a1 + 40), &v4);
  if (v4 && !*a2)
    CtrXPC::Client::State::changeEventsState_sync(v3, 2);
  if (v5)
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

void CtrXPC::Client::State::convert_sync(uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  _QWORD *v13;
  const char *v14;
  xpc_object_t v15;
  _QWORD v16[2];
  xpc_object_t v17;
  xpc_object_t object;
  xpc_object_t v19;

  *a3 = xpc_null_create();
  if (!*(_QWORD *)(*(_QWORD *)a2 + 16))
    return;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x23B841948](v6) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v6);
      v7 = v6;
    }
    else
    {
      v7 = xpc_null_create();
    }
  }
  else
  {
    v7 = xpc_null_create();
    v6 = 0;
  }
  xpc_release(v6);
  v8 = xpc_null_create();
  v9 = *a3;
  *a3 = v7;
  xpc_release(v9);
  xpc_release(v8);
  v10 = xpc_array_create(0, 0);
  v11 = v10;
  if (v10)
  {
    v19 = v10;
  }
  else
  {
    v11 = xpc_null_create();
    v19 = v11;
    if (!v11)
    {
      v12 = xpc_null_create();
      v11 = 0;
      goto LABEL_15;
    }
  }
  if (MEMORY[0x23B841948](v11) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v11);
    v12 = v11;
    goto LABEL_16;
  }
  v12 = xpc_null_create();
LABEL_15:
  v19 = v12;
LABEL_16:
  xpc_release(v11);
  v13 = *(_QWORD **)(a1 + 160);
  v16[0] = *v13;
  while ((_QWORD *)v16[0] != v13 + 1)
  {
    v14 = (const char *)(v16[0] + 32);
    if (*(char *)(v16[0] + 55) < 0)
      v14 = *(const char **)v14;
    v15 = xpc_string_create(v14);
    if (!v15)
      v15 = xpc_null_create();
    xpc_array_append_value(v12, v15);
    xpc_release(v15);
    std::__tree_iterator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *> *,long>::operator++[abi:ne180100]((uint64_t)v16);
    v13 = *(_QWORD **)(a1 + 160);
  }
  v17 = v12;
  if (v12)
    xpc_retain(v12);
  else
    v17 = xpc_null_create();
  v16[0] = a3;
  v16[1] = "eventList";
  xpc::dict::object_proxy::operator=((uint64_t)v16, &v17, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v17);
  v17 = 0;
  xpc_release(v19);
}

void sub_23A107BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t a14)
{
  xpc_object_t *v14;
  void *v15;

  xpc_release(v15);
  xpc::array::~array(&a14);
  xpc::dict::~dict(v14);
  _Unwind_Resume(a1);
}

void xpc::array::~array(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

uint64_t std::__tree_iterator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *> *,long>::operator++[abi:ne180100](uint64_t result)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  BOOL v4;

  v1 = *(_QWORD **)result;
  v2 = *(_QWORD **)(*(_QWORD *)result + 8);
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  else
  {
    do
    {
      v3 = (_QWORD *)v1[2];
      v4 = *v3 == (_QWORD)v1;
      v1 = v3;
    }
    while (!v4);
  }
  *(_QWORD *)result = v3;
  return result;
}

void CtrXPC::Client::State::init(CtrXPC::Client::State *this)
{
  NSObject *v1;
  char *v2;
  _QWORD v3[5];
  _QWORD *v4;
  _QWORD block[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___ZN6CtrXPC6Client5State4initEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_127;
  v3[4] = this;
  v4 = v3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_128;
  block[4] = (char *)this + 8;
  block[5] = &v4;
  v2 = (char *)this + 24;
  v1 = *((_QWORD *)this + 3);
  if (*((_QWORD *)v2 + 1))
    dispatch_async_and_wait(v1, block);
  else
    dispatch_sync(v1, block);
}

uint64_t CtrXPC::Client::State::State(uint64_t a1, uint64_t a2)
{
  const std::string *v4;
  int v5;
  char *v6;
  const char *v7;
  _QWORD *v8;
  void *__p;
  char v11;

  v4 = (const std::string *)(a2 + 48);
  v5 = *(char *)(a2 + 71);
  v6 = (char *)(a2 + 48);
  if (v5 < 0)
    v6 = (char *)v4->__r_.__value_.__r.__words[0];
  std::string::basic_string[abi:ne180100]<0>(&__p, v6);
  ctu::XpcClient::XpcClient();
  if (v11 < 0)
    operator delete(__p);
  *(_QWORD *)a1 = &off_250B201D8;
  std::string::basic_string((std::string *)(a1 + 72), (const std::string *)a2);
  v7 = (const char *)(a2 + 24);
  std::string::basic_string((std::string *)(a1 + 96), (const std::string *)(a2 + 24));
  std::string::basic_string((std::string *)(a1 + 120), v4);
  *(_QWORD *)(a1 + 144) = 0;
  if (*(char *)(a2 + 47) < 0)
    v7 = *(const char **)v7;
  *(_QWORD *)(a1 + 152) = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, 0x600u);
  v8 = (_QWORD *)operator new();
  v8[2] = 0;
  v8[1] = 0;
  *v8 = v8 + 1;
  std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::shared_ptr[abi:ne180100]<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void>((_QWORD *)(a1 + 160), (uint64_t)v8);
  *(_DWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = 0;
  return a1;
}

void sub_23A107E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  char *v15;
  void **v16;
  void **v17;

  if (v15[119] < 0)
    operator delete(*v17);
  if (v15[95] < 0)
    operator delete(*v16);
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)v15);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::shared_ptr[abi:ne180100]<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_250B20408;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_23A107F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    std::default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B84139CLL);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::operator()[abi:ne180100](a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::~__tree(a2);
    JUMPOUT(0x23B84139CLL);
  }
}

uint64_t std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::~__tree(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

void std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,0>(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 24);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t *std::shared_ptr<CtrXPC::Client::State>::shared_ptr[abi:ne180100]<CtrXPC::Client::State,void>(uint64_t *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_250B20480;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = (uint64_t)v4;
  if (a2)
    v5 = (_QWORD *)(a2 + 8);
  else
    v5 = 0;
  std::shared_ptr<CtrXPC::Client::State>::__enable_weak_this[abi:ne180100]<ctu::XpcClient,CtrXPC::Client::State,void>((uint64_t)a1, v5, a2);
  return a1;
}

void sub_23A108170(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<CtrXPC::Client::State>::__enable_weak_this[abi:ne180100]<ctu::XpcClient,CtrXPC::Client::State,void>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *p_shared_weak_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;

  if (a2)
  {
    v3 = a2[1];
    if (!v3)
      goto LABEL_5;
    v4 = *(_QWORD *)(v3 + 8);
    v5 = __OFADD__(v4, 1);
    v6 = v4 + 1;
    if (v5)
    {
      __break(0x5500u);
      return;
    }
    if (!v6)
    {
LABEL_5:
      v7 = *(std::__shared_weak_count **)(a1 + 8);
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
        do
          v11 = __ldxr(p_shared_weak_owners);
        while (__stxr(v11 + 1, p_shared_weak_owners));
      }
      v12 = (std::__shared_weak_count *)a2[1];
      *a2 = a3;
      a2[1] = v7;
      if (v12)
        std::__shared_weak_count::__release_weak(v12);
      if (v7)
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void std::__shared_ptr_pointer<CtrXPC::Client::State *,std::shared_ptr<CtrXPC::Client::State>::__shared_ptr_default_delete<CtrXPC::Client::State,CtrXPC::Client::State>,std::allocator<CtrXPC::Client::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B84139CLL);
}

uint64_t std::__shared_ptr_pointer<CtrXPC::Client::State *,std::shared_ptr<CtrXPC::Client::State>::__shared_ptr_default_delete<CtrXPC::Client::State,CtrXPC::Client::State>,std::allocator<CtrXPC::Client::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<CtrXPC::Client::State *,std::shared_ptr<CtrXPC::Client::State>::__shared_ptr_default_delete<CtrXPC::Client::State,CtrXPC::Client::State>,std::allocator<CtrXPC::Client::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void ___ZN6CtrXPC6Client5State4initEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *CStringPtr;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 152))
    ___ZN6CtrXPC6Client5State4initEv_block_invoke_cold_1();
  v2 = operator new();
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v10, (_QWORD *)(v1 + 8));
  v3 = v10;
  if (*((_QWORD *)&v10 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    *(_OWORD *)v2 = v3;
    v6 = (unint64_t *)(*((_QWORD *)&v3 + 1) + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    *(_QWORD *)(v1 + 184) = v2;
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v3 + 1));
  }
  else
  {
    *(_QWORD *)v2 = v10;
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v1 + 184) = v2;
  }
  if (*((_QWORD *)&v10 + 1))
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(v1 + 184), (CFNotificationCallback)CtrXPC::Client::State::handleDaemonReadyNotificationStatic, *(CFStringRef *)(v1 + 152), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 152), 0x8000100u);
    LODWORD(v10) = 136315138;
    *(_QWORD *)((char *)&v10 + 4) = CStringPtr;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Watching for notification: %s", (uint8_t *)&v10, 0xCu);
  }
  CtrXPC::Client::State::connect_sync((dispatch_queue_t *)v1);
}

void sub_23A1083FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B84139C](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void ___ZN6CtrXPC6Client5State15setEventHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS2_10shared_ptrINS_5EventEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *aBlock;
  dispatch_object_t object;
  std::string v7;

  v2 = *(_QWORD *)(a1 + 32);
  std::string::basic_string(&v7, (const std::string *)(a1 + 40));
  v3 = *(void **)(a1 + 64);
  if (v3)
    v3 = _Block_copy(v3);
  v4 = *(NSObject **)(a1 + 72);
  aBlock = v3;
  object = v4;
  if (v4)
    dispatch_retain(v4);
  CtrXPC::Client::State::setEventHandler_sync(v2, (uint64_t)&v7, (uint64_t)&aBlock);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_23A1084CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::~callback((uint64_t)&a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void CtrXPC::Client::State::setEventHandler_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void **v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  NSObject *v8;

  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(_QWORD *)(a2 + 8))
      return;
  }
  else if (!*(_BYTE *)(a2 + 23))
  {
    return;
  }
  if (*(_QWORD *)a3 && *(_QWORD *)(a3 + 8))
  {
    v4 = (const void **)std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>::operator[](*(uint64_t ***)(a1 + 160), (std::string *)a2);
    v5 = *(void **)a3;
    if (*(_QWORD *)a3)
      v5 = _Block_copy(v5);
    v6 = *v4;
    *v4 = v5;
    if (v6)
      _Block_release(v6);
    v7 = *(NSObject **)(a3 + 8);
    if (v7)
      dispatch_retain(v7);
    v8 = v4[1];
    v4[1] = v7;
    if (v8)
      dispatch_release(v8);
  }
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c82_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEE(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;

  std::string::basic_string((std::string *)(a1 + 40), (const std::string *)(a2 + 40));
  v4 = *(void **)(a2 + 64);
  if (v4)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 72) = v5;
  if (v5)
    dispatch_retain(v5);
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c82_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 72);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 64);
  if (v3)
    _Block_release(v3);
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

_QWORD *std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>::operator[](uint64_t **a1, std::string *a2)
{
  const std::string *v3;

  v3 = a2;
  return std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (const void **)&a2->__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, &v3)+ 7;
}

_QWORD *std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, const std::string **a4)
{
  _QWORD *v7;
  _QWORD *v8;
  _QWORD **v9;
  void *v11[3];
  uint64_t v12;

  v7 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  v8 = (_QWORD *)*v7;
  if (!*v7)
  {
    v9 = (_QWORD **)v7;
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a3, a4, (uint64_t)v11);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__insert_node_at(a1, v12, v9, (_QWORD *)v11[0]);
    v8 = v11[0];
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>>>>::reset[abi:ne180100](v11, 0);
  }
  return v8;
}

_QWORD *std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

std::string *std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, const std::string **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *result;

  v7 = a1 + 8;
  v8 = (char *)operator new(0x48uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  result = std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>>>::construct[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>,void>(v7, (std::string *)(v8 + 32), a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_23A108820(_Unwind_Exception *a1)
{
  void **v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, _QWORD **a3, _QWORD *a4)
{
  uint64_t *v5;
  _QWORD *result;
  uint64_t *v7;
  BOOL v8;
  uint64_t *v9;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
    *a1 = v5;
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], *a3);
  v7 = a1[2];
  v8 = __CFADD__(v7, 1);
  v9 = (uint64_t *)((char *)v7 + 1);
  if (v8)
    __break(0x5500u);
  else
    a1[2] = v9;
  return result;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  BOOL v4;
  const void *v5;
  size_t v6;
  int v7;
  size_t v8;
  const void *v9;
  size_t v10;
  int v11;

  v3 = *((char *)a3 + 23);
  v4 = v3 < 0;
  if (v3 >= 0)
    v5 = a3;
  else
    v5 = *a3;
  if (v4)
    v6 = (size_t)a3[1];
  else
    v6 = *((unsigned __int8 *)a3 + 23);
  v7 = *((char *)a2 + 23);
  if (v7 >= 0)
    v8 = *((unsigned __int8 *)a2 + 23);
  else
    v8 = (size_t)a2[1];
  if (v7 >= 0)
    v9 = a2;
  else
    v9 = *a2;
  if (v6 >= v8)
    v10 = v8;
  else
    v10 = v6;
  v11 = memcmp(v9, v5, v10);
  if (v11)
    return v11 < 0;
  else
    return v8 < v6;
}

std::string *std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>>>::construct[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>,void>(int a1, std::string *this, uint64_t a3, const std::string **a4)
{
  std::string *result;

  result = std::string::basic_string(this, *a4);
  result[1].__r_.__value_.__r.__words[0] = 0;
  result[1].__r_.__value_.__l.__size_ = 0;
  return result;
}

_QWORD *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = a2[2];
      if (*(_BYTE *)(v2 + 24))
        break;
      v3 = *(_QWORD **)(v2 + 16);
      v4 = *v3;
      if (*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if (*(_QWORD **)v2 != a2)
          {
            std::__tree_left_rotate[abi:ne180100]<std::__tree_node_base<void *> *>(a2[2]);
            a2 = (_QWORD *)v2;
          }
          v11 = a2[2];
          *(_BYTE *)(v11 + 24) = 1;
          v12 = *(_QWORD *)(v11 + 16);
          *(_BYTE *)(v12 + 24) = 0;
          return std::__tree_right_rotate[abi:ne180100]<std::__tree_node_base<void *> *>((_QWORD *)v12);
        }
      }
      else if (!v4 || (v6 = *(unsigned __int8 *)(v4 + 24), v5 = (_BYTE *)(v4 + 24), v6))
      {
        if (*(_QWORD **)v2 == a2)
        {
          std::__tree_right_rotate[abi:ne180100]<std::__tree_node_base<void *> *>((_QWORD *)a2[2]);
          a2 = (_QWORD *)v2;
        }
        v9 = a2[2];
        *(_BYTE *)(v9 + 24) = 1;
        v10 = *(_QWORD *)(v9 + 16);
        *(_BYTE *)(v10 + 24) = 0;
        return (_QWORD *)std::__tree_left_rotate[abi:ne180100]<std::__tree_node_base<void *> *>(v10);
      }
      *(_BYTE *)(v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::__tree_left_rotate[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(result + 8);
  v2 = *v1;
  *(_QWORD *)(result + 8) = *v1;
  if (v2)
    *(_QWORD *)(v2 + 16) = result;
  v1[2] = *(_QWORD *)(result + 16);
  *(_QWORD *)(*(_QWORD *)(result + 16) + 8 * (**(_QWORD **)(result + 16) != result)) = v1;
  *v1 = result;
  *(_QWORD *)(result + 16) = v1;
  return result;
}

_QWORD *std::__tree_right_rotate[abi:ne180100]<std::__tree_node_base<void *> *>(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *result;
  v2 = *(_QWORD *)(*result + 8);
  *result = v2;
  if (v2)
    *(_QWORD *)(v2 + 16) = result;
  *(_QWORD *)(v1 + 16) = result[2];
  *(_QWORD *)(result[2] + 8 * (*(_QWORD *)result[2] != (_QWORD)result)) = v1;
  *(_QWORD *)(v1 + 8) = result;
  result[2] = v1;
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>>>>::reset[abi:ne180100](void **a1, void *a2)
{
  void *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>>>::operator()[abi:ne180100]((uint64_t)(a1 + 1), v3);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,0>((uint64_t)__p + 32);
  if (__p)
    operator delete(__p);
}

void ___ZN6CtrXPC6Client5State8eventsOnEv_block_invoke(uint64_t a1)
{
  CtrXPC::Client::State::eventsOn_sync(*(CtrXPC::Client::State **)(a1 + 32));
}

void ___ZN6CtrXPC6Client5State7performENSt3__110shared_ptrINS_7CommandEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v3;

  v1 = *(_QWORD *)(a1 + 32);
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v2, (_QWORD *)(a1 + 40));
  CtrXPC::Client::State::perform_sync(v1, &v2);
  if (v3)
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

void sub_23A108B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIN6CtrXPC7CommandEEE(uint64_t a1, uint64_t a2)
{
  return std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]((_QWORD *)(a1 + 40), (_QWORD *)(a2 + 40));
}

uint64_t __destroy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIN6CtrXPC7CommandEEE(uint64_t a1)
{
  return std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN6CtrXPC6Client5State9eventsOffEv_block_invoke(uint64_t a1)
{
  CtrXPC::Client::State::eventsOff_sync(*(CtrXPC::Client::State **)(a1 + 32));
}

void CtrXPC::Client::State::eventsOff_sync(CtrXPC::Client::State *this)
{
  int v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  xpc_object_t object;
  _QWORD aBlock[6];
  std::__shared_weak_count *v13;
  void *v14;
  void *__p[2];
  char v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint8_t buf[8];
  std::__shared_weak_count *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *((_DWORD *)this + 37);
  if (v2 == 1)
    goto LABEL_4;
  if (v2 == 2)
  {
    CtrXPC::Client::State::changeEventsState_sync((uint64_t)this, 1);
LABEL_4:
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v19, (_QWORD *)this + 1);
    v4 = v19;
    v3 = v20;
    *(_QWORD *)buf = v19;
    v22 = v20;
    if (v20)
    {
      p_shared_weak_owners = (unint64_t *)&v20->__shared_weak_owners_;
      do
        v6 = __ldxr(p_shared_weak_owners);
      while (__stxr(v6 + 1, p_shared_weak_owners));
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "eventsOff");
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN6CtrXPC6Client5State14eventsOff_syncEv_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_138;
    aBlock[4] = this;
    aBlock[5] = v4;
    v13 = v3;
    if (v3)
    {
      v7 = (unint64_t *)&v3->__shared_weak_owners_;
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v14 = _Block_copy(aBlock);
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v9, (_QWORD *)this + 20);
    CtrXPC::Client::State::convert_sync((uint64_t)this, (uint64_t)&v9, &object);
    CtrXPC::Client::State::createCommand_sync((uint64_t)this, (uint64_t)__p, &v14, &object, &v17);
    CtrXPC::Client::State::perform_sync((uint64_t)this, &v17);
    if (v18)
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    xpc_release(object);
    object = 0;
    if (v10)
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    if (v14)
      _Block_release(v14);
    if (v16 < 0)
      operator delete(__p[0]);
    if (v13)
      std::__shared_weak_count::__release_weak(v13);
    if (v3)
      std::__shared_weak_count::__release_weak(v3);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v2;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Events state is %u, so skipping", buf, 8u);
  }
}

void sub_23A108D64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *aBlock,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ___ZN6CtrXPC6Client5State14eventsOff_syncEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  std::__shared_weak_count *v3;

  v1 = *(_QWORD *)(a1 + 32);
  std::weak_ptr<CtrXPC::Client::State>::lock((_QWORD *)(a1 + 40), &v2);
  if (v2)
    CtrXPC::Client::State::changeEventsState_sync(v1, 0);
  if (v3)
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
}

uint64_t dispatch::callback<void({block_pointer})(xpc::dict)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void CtrXPC::Client::State::disconnect_sync(CtrXPC::Client::State *this)
{
  int v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Destroy server connection", (uint8_t *)v4, 2u);
  }
  v2 = *((_DWORD *)this + 44);
  if (v2)
  {
    v3 = v2 - 1;
    *((_DWORD *)this + 44) = v2 - 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Extra decreased to %u", (uint8_t *)v4, 8u);
      v3 = *((_DWORD *)this + 44);
    }
    if (!v3)
    {
      CtrXPC::Client::State::destroyConnection_sync(this);
      CtrXPC::Client::State::handleServerReady_sync((dispatch_queue_t *)this);
    }
  }
  else
  {
    CtrXPC::Client::State::destroyConnection_sync(this);
  }
}

uint64_t std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1 + 8;
  v5 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__lower_bound<std::string>(a1, a2, *(_QWORD *)(a1 + 8), a1 + 8);
  if (v4 != v5)
  {
    v6 = v5;
    if (!std::less<std::string>::operator()[abi:ne180100](a1 + 16, a2, (const void **)(v5 + 32)))
      return v6;
  }
  return v4;
}

uint64_t std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__lower_bound<std::string>(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t *v9;

  if (a3)
  {
    v5 = a3;
    v7 = a1 + 16;
    do
    {
      v8 = std::less<std::string>::operator()[abi:ne180100](v7, (const void **)(v5 + 32), a2);
      v9 = (uint64_t *)(v5 + 8);
      if (!v8)
      {
        v9 = (uint64_t *)v5;
        a4 = v5;
      }
      v5 = *v9;
    }
    while (*v9);
  }
  return a4;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke(uint64_t a1)
{
  dispatch::block<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::operator()<std::shared_ptr<CtrXPC::Event> const&>((uint64_t *)(a1 + 32), (_QWORD *)(a1 + 40));
}

void dispatch::block<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>::operator()<std::shared_ptr<CtrXPC::Event> const&>(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  v2 = *a1;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](&v3, a2);
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v3);
  if (v4)
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
}

void sub_23A1090A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEE40c41_ZTSNSt3__110shared_ptrIN6CtrXPC5EventEEE(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a2 + 32);
  if (v4)
    v4 = _Block_copy(v4);
  *(_QWORD *)(a1 + 32) = v4;
  return std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]((_QWORD *)(a1 + 40), (_QWORD *)(a2 + 40));
}

void __destroy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN6CtrXPC5EventEEEEEE40c41_ZTSNSt3__110shared_ptrIN6CtrXPC5EventEEE(uint64_t a1)
{
  const void *v2;

  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](a1 + 40);
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

void CtrXPC::Client::State::destroyConnection_sync(CtrXPC::Client::State *this)
{
  xpc_object_t object;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Destroy server connection", buf, 2u);
  }
  CtrXPC::Client::State::changeCheckInState_sync((uint64_t)this, 0);
  object = xpc_null_create();
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
}

void sub_23A1091B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::connection::~connection((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

void ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v3;
  xpc_object_t reply;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  pid_t pid;
  _xpc_connection_s *remote_connection;
  pid_t v18;
  _xpc_connection_s *v19;
  pid_t v20;
  void **v21;
  xpc_object_t v22;
  void *__p[2];
  char v24;
  xpc_object_t object;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint8_t buf[4];
  void **v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  std::weak_ptr<CtrXPC::Client::State>::lock((_QWORD *)(a1 + 40), &v26);
  if (!v26)
    goto LABEL_12;
  reply = xpc_dictionary_create_reply(*a2);
  v5 = reply;
  v6 = MEMORY[0x24BDACFA0];
  if (reply)
  {
    object = reply;
  }
  else
  {
    v5 = xpc_null_create();
    object = v5;
    if (!v5)
    {
      v7 = xpc_null_create();
      v5 = 0;
      goto LABEL_9;
    }
  }
  if (MEMORY[0x23B841948](v5) != v6)
  {
    v7 = xpc_null_create();
LABEL_9:
    object = v7;
    goto LABEL_10;
  }
  xpc_retain(v5);
  v7 = v5;
LABEL_10:
  xpc_release(v5);
  if (MEMORY[0x23B841948](v7) == v6)
  {
    if (MEMORY[0x23B841948](*(_QWORD *)(v3 + 40)) == MEMORY[0x24BDACF88])
    {
      pid = xpc_connection_get_pid(*(xpc_connection_t *)(v3 + 40));
      remote_connection = xpc_dictionary_get_remote_connection(object);
      if (pid == xpc_connection_get_pid(remote_connection))
      {
        v22 = object;
        if (object)
          xpc_retain(object);
        else
          v22 = xpc_null_create();
        CtrXPC::Client::State::send_sync(v3, &v22);
        xpc_release(v22);
        v22 = 0;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          xpc::dict::to_debug_string((xpc::dict *)a2, __p);
          v21 = v24 >= 0 ? __p : (void **)__p[0];
          *(_DWORD *)buf = 136315138;
          v29 = v21;
          _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sent reply for: %s", buf, 0xCu);
          if (v24 < 0)
            operator delete(__p[0]);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v18 = xpc_connection_get_pid(*(xpc_connection_t *)(v3 + 40));
          v19 = xpc_dictionary_get_remote_connection(object);
          v20 = xpc_connection_get_pid(v19);
          ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke_cold_2(buf, v18, v20);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          xpc::dict::to_debug_string((xpc::dict *)a2, __p);
          ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke_cold_1();
        }
      }
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v8)
        ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  xpc_release(object);
LABEL_12:
  if (v27)
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
}

void sub_23A109458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  xpc_object_t v7;
  va_list va;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, xpc_object_t);
  xpc::dict::~dict((xpc_object_t *)va);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<CtrXPC::Client>::shared_ptr[abi:ne180100]<CtrXPC::Client,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_250B20668;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_23A109528(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  CtrXPC::Client *v10;

  a10 = 0;
  if (v10)
    std::default_delete<CtrXPC::Client>::operator()[abi:ne180100]((int)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<CtrXPC::Client *,std::shared_ptr<CtrXPC::Client>::__shared_ptr_default_delete<CtrXPC::Client,CtrXPC::Client>,std::allocator<CtrXPC::Client>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B84139CLL);
}

void std::__shared_ptr_pointer<CtrXPC::Client *,std::shared_ptr<CtrXPC::Client>::__shared_ptr_default_delete<CtrXPC::Client,CtrXPC::Client>,std::allocator<CtrXPC::Client>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<CtrXPC::Client>::operator()[abi:ne180100](a1 + 24, *(CtrXPC::Client **)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<CtrXPC::Client *,std::shared_ptr<CtrXPC::Client>::__shared_ptr_default_delete<CtrXPC::Client,CtrXPC::Client>,std::allocator<CtrXPC::Client>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<CtrXPC::Client>::operator()[abi:ne180100](int a1, CtrXPC::Client *this)
{
  if (this)
  {
    CtrXPC::Client::~Client(this);
    JUMPOUT(0x23B84139CLL);
  }
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_250B1FB98, MEMORY[0x24BEDAB00]);
}

void sub_23A109638(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t memcpyrev(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;

  if (a3)
  {
    v3 = 0;
    v4 = a3 - 1;
    while (v4 >= v3)
    {
      *(_BYTE *)(result + v3) = *(_BYTE *)(a2 + v4 - v3);
      if (a3 == ++v3)
        return result;
    }
    __break(0x5515u);
  }
  return result;
}

uint64_t memcmprev(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;

  if (a3)
  {
    v3 = 0;
    v4 = a3 - 1;
    while (1)
    {
      v5 = v4 - v3;
      if (v4 < v3)
        break;
      v6 = *(unsigned __int8 *)(result + v3++);
      v7 = v6 - *(unsigned __int8 *)(a2 + v5);
      if (v3 >= a3 || (_DWORD)v7)
        return v7;
    }
    __break(0x5515u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t reverse_bytes(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  char v3;
  uint64_t v4;

  if (a2 >= 2)
  {
    v2 = 0;
    while (a2 > v2)
    {
      v3 = *(_BYTE *)(result + v2);
      v4 = a2 - v2 + result;
      *(_BYTE *)(result + v2) = *(_BYTE *)(v4 - 1);
      *(_BYTE *)(v4 - 1) = v3;
      if (a2 >> 1 == ++v2)
        return result;
    }
    __break(0x5515u);
  }
  return result;
}

uint64_t parse_string_into_data(_BYTE *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  char v4;
  BOOL v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t result;
  char v12;
  BOOL v13;
  __darwin_ct_rune_t v14;
  __darwin_ct_rune_t v15;
  char v17;
  BOOL v18;

  if (a1)
    v3 = a2;
  else
    v3 = 0;
  v4 = *a3;
  if (*a3)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = a3;
    v7 = a1;
    v8 = 0;
    while (1)
    {
      v9 = v6 + 1;
      result = __tolower(v4);
      if ((result - 48) < 0xA || (result - 97) < 6)
      {
        if ((result - 48) >= 0xA)
          v12 = 9;
        else
          v12 = 0;
        *v7 = 16 * (result + v12);
        v13 = __OFADD__((_DWORD)v8, 1);
        v8 = (v8 + 1);
        if (v13)
        {
          __break(0x5500u);
          return result;
        }
        v14 = (char)*v9;
        if (!*v9)
          return v8;
        --v3;
        v9 = v6 + 2;
        v15 = __tolower(v14);
        if ((v15 - 48) < 0xA || (v15 - 97) <= 5)
        {
          if ((v15 - 48) >= 0xA)
            v17 = -87;
          else
            v17 = -48;
          *v7++ |= (_BYTE)v15 + v17;
        }
      }
      v4 = *v9;
      if (*v9)
        v18 = v3 == 0;
      else
        v18 = 1;
      v6 = v9;
      if (v18)
        return v8;
    }
  }
  return 0;
}

unint64_t encode_data_into_string(unint64_t result, uint64_t a2, _BYTE *a3, unint64_t a4, int a5)
{
  unint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v9;

  v5 = 0;
  if (a2 && a4 >= 3)
  {
    v6 = 0;
    v7 = a2 - 1;
    while (!__OFSUB__(a5--, 1))
    {
      v9 = *(unsigned __int8 *)result;
      *a3 = a0123456789abcd[v9 >> 4];
      a3[1] = a0123456789abcd[v9 & 0xF];
      v5 = (v6 + 2);
      if (__OFADD__(v6, 2))
        goto LABEL_18;
      a3 += 2;
      a4 -= 2;
      if (v7-- != 0)
      {
        ++result;
        v6 += 2;
        if (a4 > 2)
          continue;
      }
      goto LABEL_9;
    }
  }
  else
  {
LABEL_9:
    if (a5 < 1 || a4 < 3)
    {
      result = v5;
LABEL_16:
      if (a4)
      {
        *a3 = 0;
        return result;
      }
    }
    else
    {
      while (1)
      {
        *(_WORD *)a3 = 12336;
        result = (v5 + 2);
        if (__OFADD__((_DWORD)v5, 2))
          break;
        a3 += 2;
        a4 -= 2;
        if (a5 >= 2)
        {
          --a5;
          LODWORD(v5) = v5 + 2;
          if (a4 > 2)
            continue;
        }
        goto LABEL_16;
      }
LABEL_18:
      __break(0x5500u);
    }
  }
  __break(0x5515u);
  return result;
}

unint64_t strtoBOOL(const char *a1)
{
  unsigned int v1;

  v1 = *a1 - 70;
  if (v1 < 0x34 && ((0x8410100084101uLL >> v1) & 1) != 0)
    return (0xFFEFEFFFFFEFEuLL >> v1) & 1;
  else
    return strtol(a1, 0, 0) != 0;
}

uint64_t strtomask_uint32(const char *a1)
{
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  const char *v6;
  int v7;
  uint64_t result;
  int v9;
  int v10;
  int v11;

  v1 = strdup(a1);
  v2 = strtok(v1, ",");
  if (v2)
  {
    v3 = v2;
    LODWORD(v4) = 0;
    while (1)
    {
      v5 = strchr(v3, 45);
      if (v5)
        break;
      v4 = (1 << strtol(v3, 0, 0)) | v4;
LABEL_14:
      v3 = strtok(0, ",");
      if (!v3)
        goto LABEL_17;
    }
    *v5 = 0;
    v6 = v5 + 1;
    v7 = atoi(v3);
    result = atoi(v6);
    if (v7 >= (int)result)
      v9 = result;
    else
      v9 = v7;
    if (v7 <= (int)result)
      v10 = result;
    else
      v10 = v7;
    while (1)
    {
      v11 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v4 = v4 | (1 << v9++);
      if (v11 > v10)
        goto LABEL_14;
    }
    __break(0x5500u);
  }
  else
  {
    v4 = 0;
LABEL_17:
    free(v1);
    return v4;
  }
  return result;
}

uint64_t strtologmask(const char *a1, uint64_t a2)
{
  uint64_t result;

  result = strtol(a1, 0, 0);
  if (!(_DWORD)result)
  {
    if (strcasestr(a1, "all"))
    {
      if (strcasestr(a1, "-all"))
        a2 = 0;
      else
        a2 = 0xFFFFFFFFLL;
    }
    if (strcasestr(a1, "emerg"))
    {
      if (strcasestr(a1, "-emerg"))
        a2 = a2 & 0xFFFFFFFE;
      else
        a2 = a2 | 1;
    }
    if (strcasestr(a1, "alert"))
    {
      if (strcasestr(a1, "-alert"))
        a2 = a2 & 0xFFFFFFFD;
      else
        a2 = a2 | 2;
    }
    if (strcasestr(a1, "crit"))
    {
      if (strcasestr(a1, "-crit"))
        a2 = a2 & 0xFFFFFFFB;
      else
        a2 = a2 | 4;
    }
    if (strcasestr(a1, "err"))
    {
      if (strcasestr(a1, "-err"))
        a2 = a2 & 0xFFFFFFF7;
      else
        a2 = a2 | 8;
    }
    if (strcasestr(a1, "warn"))
    {
      if (strcasestr(a1, "-warn"))
        a2 = a2 & 0xFFFFFFEF;
      else
        a2 = a2 | 0x10;
    }
    if (strcasestr(a1, "notice"))
    {
      if (strcasestr(a1, "-notice"))
        a2 = a2 & 0xFFFFFFDF;
      else
        a2 = a2 | 0x20;
    }
    if (strcasestr(a1, "info"))
    {
      if (strcasestr(a1, "-info"))
        a2 = a2 & 0xFFFFFFBF;
      else
        a2 = a2 | 0x40;
    }
    if (strcasestr(a1, "debug"))
    {
      if (strcasestr(a1, "-debug"))
        return a2 & 0xFFFFFF7F;
      else
        return a2 | 0x80;
    }
    else
    {
      return a2;
    }
  }
  return result;
}

BOOL buffer_is_nonzero(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;

  do
  {
    v2 = a2;
    if (a2-- == 0)
      break;
  }
  while (!*a1++);
  return v2 != 0;
}

unsigned __int8 *is_hex(unsigned __int8 *result, uint64_t a2)
{
  unsigned int v3;

  do
  {
    if (a2-- == 0)
    {
      __break(0x5515u);
      return result;
    }
    v3 = *result++;
  }
  while ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v3 + 60) & 0x10000) != 0);
  return 0;
}

uint64_t is_uppercase_or_digit(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v7;

  v2 = a2 - 1;
  if (a2)
  {
    v4 = MEMORY[0x24BDAC740];
    while (1)
    {
      v5 = *a1;
      v6 = *a1 < 0
         ? __maskrune(*a1, 0x8000uLL)
         : *(_DWORD *)(v4 + 4 * *a1 + 60) & 0x8000;
      v7 = !v6 && (v5 - 48) >= 0xA;
      if (v7)
        break;
      ++a1;
      v7 = v2-- != 0;
      if (!v7)
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    __break(0x5515u);
  }
  return 0;
}

void CtrXpcClient_update_accessory_data_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Accessory Cache updated\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A109EA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_update_accessory_data_interface_helper@<D0>(xpc_object_t *a1@<X0>, const char **a2@<X1>, uint64_t a3@<X8>)
{
  const char *v5;
  const char *v6;
  const char *v7;
  double result;
  __int128 v9;
  uint64_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t object;
  char __str[256];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v5 = a2[1];
  v7 = a2[2];
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v15 = xpc_string_create("org.wpantund.v1");
  if (!v15)
    v15 = xpc_null_create();
  *(_QWORD *)&v9 = a1;
  *((_QWORD *)&v9 + 1) = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v9, &v15, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v15);
  v15 = 0;
  v13 = xpc_string_create(__str);
  if (!v13)
    v13 = xpc_null_create();
  *(_QWORD *)&v9 = a1;
  *((_QWORD *)&v9 + 1) = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v9, &v13, &v14);
  xpc_release(v14);
  v14 = 0;
  xpc_release(v13);
  v13 = 0;
  v11 = xpc_string_create("UpdateAccessoryData");
  if (!v11)
    v11 = xpc_null_create();
  *(_QWORD *)&v9 = a1;
  *((_QWORD *)&v9 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v9, &v11, &v12);
  xpc_release(v12);
  v12 = 0;
  xpc_release(v11);
  v11 = 0;
  if (v6 && v5 && v7)
  {
    xpc_dictionary_set_string(*a1, "ipaddr_add", v6);
    xpc_dictionary_set_string(*a1, "ipaddr_lookup", v5);
    xpc_dictionary_set_string(*a1, "host_info", v7);
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)&unk_23A11B5CA);
    *(_DWORD *)a3 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, "Invalid Input");
    *(_DWORD *)a3 = 10;
  }
  result = *(double *)&v9;
  *(_OWORD *)(a3 + 8) = v9;
  *(_QWORD *)(a3 + 24) = v10;
  return result;
}

void sub_23A10A0C8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_23A10A2E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_23A10A62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33)
{
  void *v33;
  uint64_t v34;

  _Unwind_Resume(a1);
}

void sub_23A10AA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_23A10AD24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void CtrXPC::Command::name(CtrXPC::Command::State **this)
{
  CtrXPC::Command::State::name(*this);
}

void CtrXPC::Command::State::name(CtrXPC::Command::State *this)
{
  const char *v1;
  _QWORD v2[2];
  xpc_object_t object;

  v2[0] = this;
  v2[1] = "command";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v2, &object);
  xpc::dyn_cast_or_default((xpc *)&object, (const object *)"invalid", v1);
  xpc_release(object);
}

void sub_23A10AEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void CtrXPC::Command::getName(CtrXPC::Command::State **this@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  void *__p;
  char v5;

  CtrXPC::Command::State::name(*this);
  v3 = ctu::cf::convert_copy();
  if (v5 < 0)
    operator delete(__p);
  if ((v3 & 1) == 0)
    CtrXPC::Command::getName();
  *a2 = 0;
}

void sub_23A10AF74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

xpc_object_t CtrXPC::Command::get@<X0>(void ***this@<X0>, _QWORD *a2@<X8>)
{
  return CtrXPC::Command::State::get(*this, a2);
}

xpc_object_t CtrXPC::Command::State::get@<X0>(void **this@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  xpc_object_t result;

  v2 = *this;
  *a2 = v2;
  if (v2)
    return xpc_retain(v2);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

BOOL CtrXPC::Command::notifiable(CtrXPC::Command *this)
{
  return *(_QWORD *)(*(_QWORD *)this + 8) && *(_QWORD *)(*(_QWORD *)this + 16) != 0;
}

void CtrXPC::Command::notify(uint64_t *a1, uint64_t a2, void **a3)
{
  uint64_t v4;
  void *v5;
  xpc_object_t object;
  int v7;
  std::string __p;

  v4 = *a1;
  v7 = *(_DWORD *)a2;
  std::string::basic_string(&__p, (const std::string *)(a2 + 8));
  v5 = *a3;
  object = v5;
  if (v5)
    xpc_retain(v5);
  else
    object = xpc_null_create();
  CtrXPC::Command::State::notify(v4, &v7, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A10B080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc::dict::~dict(&a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void CtrXPC::Command::State::notify(uint64_t a1, int *a2, xpc_object_t *a3)
{
  xpc_object_t v5;
  const void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  std::string v11;
  _QWORD block[4];
  void *aBlock;
  int v14;
  std::string __p;
  xpc_object_t object;

  if (*(_QWORD *)(a1 + 8) && *(_QWORD *)(a1 + 16))
  {
    v10 = *a2;
    std::string::basic_string(&v11, (const std::string *)(a2 + 2));
    v5 = *a3;
    if (v5)
      xpc_retain(v5);
    else
      v5 = xpc_null_create();
    v6 = *(const void **)(a1 + 8);
    if (v6)
      v7 = _Block_copy(v6);
    else
      v7 = 0;
    v8 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN6CtrXPC6ResultEN3xpc4dictEEEclIJS2_S4_EEEvDpT__block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    if (v7)
      v9 = _Block_copy(v7);
    else
      v9 = 0;
    aBlock = v9;
    v14 = v10;
    std::string::basic_string(&__p, &v11);
    object = v5;
    if (v5)
      xpc_retain(v5);
    else
      object = xpc_null_create();
    dispatch_async(v8, block);
    xpc_release(object);
    object = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (aBlock)
      _Block_release(aBlock);
    if (v7)
      _Block_release(v7);
    xpc_release(v5);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_23A10B22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *aBlock)
{
  const void *v22;

  if (aBlock)
    _Block_release(aBlock);
  if (v22)
    _Block_release(v22);
  xpc::dict::~dict(&a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void CtrXPC::Command::create(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X2>, _QWORD *a4@<X8>)
{
  void **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  xpc_object_t object;
  void *aBlock;
  dispatch_object_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  v8 = (void **)operator new();
  v9 = *(void **)a2;
  if (*(_QWORD *)a2)
    v9 = _Block_copy(v9);
  v10 = *(NSObject **)(a2 + 8);
  aBlock = v9;
  v20 = v10;
  if (v10)
    dispatch_retain(v10);
  v11 = *a3;
  object = v11;
  if (v11)
    xpc_retain(v11);
  else
    object = xpc_null_create();
  CtrXPC::Command::State::State(v8, a1, (uint64_t)&aBlock, &object);
  std::shared_ptr<CtrXPC::Command::State>::shared_ptr[abi:ne180100]<CtrXPC::Command::State,void>(&v21, (uint64_t)v8);
  xpc_release(object);
  object = 0;
  if (v20)
    dispatch_release(v20);
  if (aBlock)
    _Block_release(aBlock);
  v12 = (_QWORD *)operator new();
  v13 = (uint64_t)v12;
  v16 = v21;
  v17 = v22;
  if (v22)
  {
    p_shared_owners = &v22->__shared_owners_;
    do
      v15 = __ldxr((unint64_t *)p_shared_owners);
    while (__stxr(v15 + 1, (unint64_t *)p_shared_owners));
  }
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](v12, &v16);
  std::shared_ptr<CtrXPC::Command>::shared_ptr[abi:ne180100]<CtrXPC::Command,void>(a4, v13);
  if (v17)
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  if (v22)
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
}

void sub_23A10B3CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN6CtrXPC6ResultEN3xpc4dictEEEclIJS2_S4_EEEvDpT__block_invoke(uint64_t a1)
{
  dispatch::block<void({block_pointer})(CtrXPC::Result,xpc::dict)>::operator()<CtrXPC::Result const&,xpc::dict const&>((uint64_t *)(a1 + 32), (int *)(a1 + 40), (void **)(a1 + 72));
}

void dispatch::block<void({block_pointer})(CtrXPC::Result,xpc::dict)>::operator()<CtrXPC::Result const&,xpc::dict const&>(uint64_t *a1, int *a2, void **a3)
{
  uint64_t v4;
  void *v5;
  xpc_object_t object;
  int v7;
  std::string __p;

  v4 = *a1;
  v7 = *a2;
  std::string::basic_string(&__p, (const std::string *)(a2 + 2));
  v5 = *a3;
  object = v5;
  if (v5)
    xpc_retain(v5);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, int *, xpc_object_t *))(v4 + 16))(v4, &v7, &object);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A10B4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc::dict::~dict(&a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN6CtrXPC6ResultEN3xpc4dictEEEE40c20_ZTSN6CtrXPC6ResultE72c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  xpc_object_t result;

  v4 = *(void **)(a2 + 32);
  if (v4)
    v4 = _Block_copy(v4);
  *(_QWORD *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  std::string::basic_string((std::string *)(a1 + 48), (const std::string *)(a2 + 48));
  v5 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v5;
  if (v5)
    return xpc_retain(v5);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

void sub_23A10B558(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 32);
  if (v3)
    _Block_release(v3);
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN6CtrXPC6ResultEN3xpc4dictEEEE40c20_ZTSN6CtrXPC6ResultE72c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 72));
  *(_QWORD *)(a1 + 72) = 0;
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

void **CtrXPC::Command::State::State(void **a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  xpc_object_t v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t v11;
  void *v12;
  NSObject *v13;
  xpc_object_t v14;
  void *v15;
  const char *v16;
  _QWORD v18[2];
  xpc_object_t v19;
  xpc_object_t object;

  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = v8;
  v10 = MEMORY[0x24BDACFA0];
  if (v8)
  {
    *a1 = v8;
  }
  else
  {
    v9 = xpc_null_create();
    *a1 = v9;
    if (!v9)
    {
      v11 = xpc_null_create();
      v9 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23B841948](v9) == v10)
  {
    xpc_retain(v9);
    goto LABEL_9;
  }
  v11 = xpc_null_create();
LABEL_8:
  *a1 = v11;
LABEL_9:
  xpc_release(v9);
  v12 = *(void **)a3;
  if (*(_QWORD *)a3)
    v12 = _Block_copy(v12);
  a1[1] = v12;
  v13 = *(NSObject **)(a3 + 8);
  a1[2] = v13;
  if (v13)
    dispatch_retain(v13);
  if (MEMORY[0x23B841948](*a4) == v10)
  {
    v14 = (xpc_object_t)*a4;
    if (v14)
      xpc_retain(v14);
    else
      v14 = xpc_null_create();
    v15 = *a1;
    *a1 = v14;
    xpc_release(v15);
  }
  if (*(char *)(a2 + 23) >= 0)
    v16 = (const char *)a2;
  else
    v16 = *(const char **)a2;
  v19 = xpc_string_create(v16);
  if (!v19)
    v19 = xpc_null_create();
  v18[0] = a1;
  v18[1] = "command";
  xpc::dict::object_proxy::operator=((uint64_t)v18, &v19, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v19);
  return a1;
}

void sub_23A10B748(_Unwind_Exception *a1)
{
  xpc_object_t *v1;
  uint64_t v2;

  dispatch::callback<void({block_pointer})(CtrXPC::Result,xpc::dict)>::~callback(v2);
  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<CtrXPC::Command::State>::shared_ptr[abi:ne180100]<CtrXPC::Command::State,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_250B20788;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_23A10B7D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    std::default_delete<CtrXPC::Command::State>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<CtrXPC::Command::State *,std::shared_ptr<CtrXPC::Command::State>::__shared_ptr_default_delete<CtrXPC::Command::State,CtrXPC::Command::State>,std::allocator<CtrXPC::Command::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B84139CLL);
}

void std::__shared_ptr_pointer<CtrXPC::Command::State *,std::shared_ptr<CtrXPC::Command::State>::__shared_ptr_default_delete<CtrXPC::Command::State,CtrXPC::Command::State>,std::allocator<CtrXPC::Command::State>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<CtrXPC::Command::State>::operator()[abi:ne180100](a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<CtrXPC::Command::State *,std::shared_ptr<CtrXPC::Command::State>::__shared_ptr_default_delete<CtrXPC::Command::State,CtrXPC::Command::State>,std::allocator<CtrXPC::Command::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<CtrXPC::Command::State>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  const void *v4;

  if (a2)
  {
    v3 = *(NSObject **)(a2 + 16);
    if (v3)
      dispatch_release(v3);
    v4 = *(const void **)(a2 + 8);
    if (v4)
      _Block_release(v4);
    xpc_release(*(xpc_object_t *)a2);
    *(_QWORD *)a2 = 0;
    JUMPOUT(0x23B84139CLL);
  }
}

_QWORD *std::shared_ptr<CtrXPC::Command>::shared_ptr[abi:ne180100]<CtrXPC::Command,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_250B20800;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_23A10B92C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    std::default_delete<CtrXPC::Command>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<CtrXPC::Command *,std::shared_ptr<CtrXPC::Command>::__shared_ptr_default_delete<CtrXPC::Command,CtrXPC::Command>,std::allocator<CtrXPC::Command>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B84139CLL);
}

void std::__shared_ptr_pointer<CtrXPC::Command *,std::shared_ptr<CtrXPC::Command>::__shared_ptr_default_delete<CtrXPC::Command,CtrXPC::Command>,std::allocator<CtrXPC::Command>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<CtrXPC::Command>::operator()[abi:ne180100](a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<CtrXPC::Command *,std::shared_ptr<CtrXPC::Command>::__shared_ptr_default_delete<CtrXPC::Command,CtrXPC::Command>,std::allocator<CtrXPC::Command>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<CtrXPC::Command>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100](a2);
    JUMPOUT(0x23B84139CLL);
  }
}

void sub_23A10BAB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23A10BB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  void *v10;

  if (object)
    dispatch_release(object);

  _Unwind_Resume(a1);
}

void sub_23A10BFD8(_Unwind_Exception *exception_object)
{
  void *v1;
  int v2;

  if (v2 < 0)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_23A10C048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23A10CA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55)
{
  void *v55;
  void *v56;

  Ctr_triggerBasedStats::~Ctr_triggerBasedStats(&a55);
  _Unwind_Resume(a1);
}

void sub_23A10CCA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23A10D0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  void *v14;
  void *v15;
  void *v16;
  va_list va;

  va_start(va, a14);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  v4 = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 64) = v3;
  *(_OWORD *)(a1 + 80) = v4;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

void sub_23A10D2C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23A10D930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31,char a32)
{
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  _Block_object_dispose(&a26, 8);

  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void sub_23A10DC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_23A10DD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_23A10DE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23A10DFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_23A10E1B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23A10E424(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23A10E5A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23A10E6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_23A10E7D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23A10EA38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_23A10EBB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23A10ECB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_23A10EDE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void CtrXpcClient_startPairing_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_startPairing_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully started Pairing... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A10EFD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_startPairing_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  const char *v6;
  double result;
  __int128 v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t object;

  v5 = *(unsigned __int8 *)(a2 + 43);
  v6 = *(const char **)(a2 + 48);
  v10 = xpc_string_create("startPairing");
  if (!v10)
    v10 = xpc_null_create();
  *(_QWORD *)&v8 = a1;
  *((_QWORD *)&v8 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v8, &v10, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v10);
  v10 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "startPairing");
  if (v6)
    xpc_dictionary_set_string(*a1, "extendedMACAddress", v6);
  xpc_dictionary_set_BOOL(*a1, "isWED", v5 != 0);
  std::string::basic_string[abi:ne180100]<0>(&v8, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)&v8;
  *(_OWORD *)(a3 + 8) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  return result;
}

int setlogmask(int a1)
{
  int v1;

  v1 = logMask;
  logMask = a1;
  return v1;
}

uint64_t syslog_is_the_mask_enabled(char a1)
{
  return (logMask >> a1) & 1;
}

void getEntitlementFromMethodName(char *__s@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  std::string *v7;
  const char *v8;
  std::string v9;
  _BYTE __p[12];
  __int16 v11;
  char *v12;
  __int16 v13;
  std::string *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  memset(&v9, 0, sizeof(v9));
  if (__s
    && (std::string::basic_string[abi:ne180100]<0>(__p, __s),
        std::string::append[abi:ne180100](&v9, __p),
        SHIBYTE(v13) < 0))
  {
    operator delete(*(void **)__p);
    if (!a2)
      goto LABEL_7;
  }
  else if (!a2)
  {
    goto LABEL_7;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  std::string::append[abi:ne180100](&v9, __p);
  if (SHIBYTE(v13) < 0)
    operator delete(*(void **)__p);
LABEL_7:
  v6 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::find<std::string>((uint64_t)&kEntitlementStringToMethodMap, (const void **)&v9.__r_.__value_.__l.__data_);
  if ((_UNKNOWN *)v6 != &unk_2542CFAC0)
    std::string::operator=((std::string *)a3, (const std::string *)(v6 + 56));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = &v9;
    if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v7 = (std::string *)v9.__r_.__value_.__r.__words[0];
    if (*(char *)(a3 + 23) < 0)
    {
      if (*(_QWORD *)(a3 + 8))
        v8 = *(const char **)a3;
      else
        v8 = "Empty";
    }
    else if (*(_BYTE *)(a3 + 23))
    {
      v8 = (const char *)a3;
    }
    else
    {
      v8 = "Empty";
    }
    *(_DWORD *)__p = 136315906;
    *(_QWORD *)&__p[4] = __s;
    v11 = 2080;
    v12 = a2;
    v13 = 2080;
    v14 = v7;
    v15 = 2080;
    v16 = v8;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "getEntitlementFromMethodName: method: %s, property_name: %s, serach_entitelement: %s, ret: %s", __p, 0x2Au);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_23A10F2DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v21 + 23) < 0)
    operator delete(*(void **)v21);
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100](std::string *a1, const std::string::value_type *a2)
{
  std::string::size_type v2;
  std::string::size_type v3;

  v2 = *((_QWORD *)a2 + 1);
  if (a2[23] >= 0)
  {
    v3 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    v3 = v2;
  }
  return std::string::append(a1, a2, v3);
}

uint64_t checkEntitlementForMachMsg(xpc::dict *a1, uint64_t a2)
{
  uint64_t v4;
  pid_t pid;
  void *v7;
  xpc_object_t v8;
  uint64_t v9;
  xpc_object_t v10;
  _BYTE *v11;
  int v12;
  uint64_t v13;
  void **v14;
  xpc_object_t object;
  void *v16[2];
  char v17;
  _BYTE __p[22];
  char v19;
  _BYTE buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B841948](*(_QWORD *)a1) != MEMORY[0x24BDACF88])
  {
LABEL_2:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      checkEntitlementForMachMsg(a1, (uint64_t *)a2);
    return 0;
  }
  pid = xpc_connection_get_pid(*(xpc_connection_t *)a1);
  if (getpid() != pid)
  {
    xpc_connection_get_audit_token();
    v7 = (void *)xpc_copy_entitlement_for_token();
    v8 = v7;
    v9 = MEMORY[0x24BDACFA0];
    if (v7)
    {
      object = v7;
    }
    else
    {
      v8 = xpc_null_create();
      object = v8;
      if (!v8)
      {
        v10 = xpc_null_create();
        v8 = 0;
        goto LABEL_14;
      }
    }
    if (MEMORY[0x23B841948](v8) == v9)
    {
      xpc_retain(v8);
LABEL_15:
      xpc_release(v8);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        xpc::dict::to_debug_string((xpc::dict *)&object, __p);
        v11 = v19 >= 0 ? __p : *(_BYTE **)__p;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "entitlements in Server: %s", buf, 0xCu);
        if (v19 < 0)
          operator delete(*(void **)__p);
      }
      if (MEMORY[0x23B841948](object) == v9)
      {
        v13 = a2;
        if (*(char *)(a2 + 23) < 0)
          v13 = *(_QWORD *)a2;
        *(_QWORD *)__p = &object;
        *(_QWORD *)&__p[8] = v13;
        xpc::dict::object_proxy::operator xpc::object((uint64_t)__p, buf);
        if (MEMORY[0x23B841948](*(_QWORD *)buf) == MEMORY[0x24BDACFE0])
          v12 = 0;
        else
          v12 = xpc::dyn_cast_or_default((xpc *)buf, 0);
        xpc_release(*(xpc_object_t *)buf);
      }
      else
      {
        v12 = 0;
      }
      xpc_release(object);
      if (!v12)
        goto LABEL_2;
      goto LABEL_30;
    }
    v10 = xpc_null_create();
LABEL_14:
    object = v10;
    goto LABEL_15;
  }
LABEL_30:
  v4 = 1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    xpc::dict::to_debug_string(a1, v16);
    if (v17 >= 0)
      v14 = v16;
    else
      v14 = (void **)v16[0];
    if (*(char *)(a2 + 23) < 0)
      a2 = *(_QWORD *)a2;
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = v14;
    *(_WORD *)&__p[12] = 2080;
    *(_QWORD *)&__p[14] = a2;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Connection \"%s\" allowed for: %s \n", __p, 0x16u);
    if (v17 < 0)
      operator delete(v16[0]);
    return 1;
  }
  return v4;
}

void sub_23A10F614(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  xpc_release(*(xpc_object_t *)(v2 - 64));
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

uint64_t checkEntitlementInServer(_QWORD *a1, xpc_object_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *string;
  char *v9;
  std::string::size_type size;
  void *v11;
  char v12;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t xdict;
  std::string v24;
  xpc_object_t object;
  std::string __str;
  void *v27;
  void *aBlock;
  xpc_object_t v29;
  int v30;

  if (MEMORY[0x23B841948](*a1) != MEMORY[0x24BDACF88])
    return 1;
  v6 = MEMORY[0x23B841948](*a2);
  v7 = MEMORY[0x24BDACFA0];
  if (v6 != MEMORY[0x24BDACFA0])
    return 1;
  string = (char *)xpc_dictionary_get_string(*a2, "method");
  v9 = (char *)xpc_dictionary_get_string(*a2, "property_name");
  getEntitlementFromMethodName(string, v9, (uint64_t)&__str);
  size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __str.__r_.__value_.__l.__size_;
  if (!size)
  {
    v12 = 1;
    if ((*((_BYTE *)&__str.__r_.__value_.__s + 23) & 0x80) == 0)
      goto LABEL_14;
LABEL_17:
    operator delete(__str.__r_.__value_.__l.__data_);
    if ((v12 & 1) != 0)
      return 1;
    goto LABEL_18;
  }
  v11 = (void *)*a1;
  object = v11;
  if (v11)
    xpc_retain(v11);
  else
    object = xpc_null_create();
  std::string::basic_string(&v24, &__str);
  v12 = checkEntitlementForMachMsg((xpc::dict *)&object, (uint64_t)&v24);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  xpc_release(object);
  object = 0;
  if ((*((_BYTE *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
    goto LABEL_17;
LABEL_14:
  if ((v12 & 1) != 0)
    return 1;
LABEL_18:
  v14 = xpc_dictionary_create(0, 0, 0);
  v15 = v14;
  if (v14)
  {
    xdict = v14;
  }
  else
  {
    v15 = xpc_null_create();
    xdict = v15;
    if (!v15)
    {
      v16 = xpc_null_create();
      v15 = 0;
      goto LABEL_25;
    }
  }
  if (MEMORY[0x23B841948](v15) != v7)
  {
    v16 = xpc_null_create();
LABEL_25:
    xdict = v16;
    goto LABEL_26;
  }
  xpc_retain(v15);
  v16 = v15;
LABEL_26:
  xpc_release(v15);
  xpc_dictionary_set_int64(v16, "ret", 33);
  if (string)
    xpc_dictionary_set_string(xdict, "method", string);
  if (v9)
    xpc_dictionary_set_string(xdict, "property_name", v9);
  if (*(_QWORD *)a3 && *(_QWORD *)(a3 + 8))
  {
    v17 = xdict;
    if (xdict)
      xpc_retain(xdict);
    else
      v17 = xpc_null_create();
    if (*(_QWORD *)a3)
      v18 = _Block_copy(*(const void **)a3);
    else
      v18 = 0;
    v19 = *(NSObject **)(a3 + 8);
    __str.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
    __str.__r_.__value_.__l.__size_ = 1174405120;
    __str.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZNK8dispatch8callbackIU13block_pointerFvhN3xpc4dictEEEclIJN6CtrXPC3__0ES2_EEEvDpT__block_invoke;
    v27 = &__block_descriptor_tmp_1;
    if (v18)
      v20 = _Block_copy(v18);
    else
      v20 = 0;
    v30 = 5;
    aBlock = v20;
    v29 = v17;
    if (v17)
      xpc_retain(v17);
    else
      v29 = xpc_null_create();
    dispatch_async(v19, &__str);
    xpc_release(v29);
    v29 = 0;
    if (aBlock)
      _Block_release(aBlock);
    if (v18)
      _Block_release(v18);
    xpc_release(v17);
  }
  v21 = xpc_null_create();
  v22 = xpc_null_create();
  xpc_release(xdict);
  xpc_release(v22);
  xpc_release(v21);
  return 0;
}

void sub_23A10F9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, xpc_object_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a15 < 0)
    operator delete(__p);
  xpc::connection::~connection(&a16);
  if (a22 < 0)
    operator delete(a17);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>(uint64_t a1, __int128 *a2, std::string *__str)
{
  __int128 v4;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  std::string::basic_string((std::string *)(a1 + 24), __str);
  return a1;
}

void sub_23A10FA50(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[11],std::string const&,0>(_QWORD *a1, char *a2, const std::string *a3)
{
  std::string *v5;

  v5 = (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string(v5 + 1, a3);
  return a1;
}

void sub_23A10FAA0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[14],std::string const&,0>(_QWORD *a1, char *a2, const std::string *a3)
{
  std::string *v5;

  v5 = (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string(v5 + 1, a3);
  return a1;
}

void sub_23A10FAF0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[20],std::string const&,0>(_QWORD *a1, char *a2, const std::string *a3)
{
  std::string *v5;

  v5 = (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string(v5 + 1, a3);
  return a1;
}

void sub_23A10FB40(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::map<std::string,std::string>::map[abi:ne180100](uint64_t a1, std::string *a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = a1 + 8;
  std::map<std::string,std::string>::insert[abi:ne180100]<std::pair<std::string const,std::string> const*>((const void **)a1, a2, &a2[2 * a3]);
  return a1;
}

void sub_23A10FB98(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::~__tree(v1);
  _Unwind_Resume(a1);
}

const void **std::map<std::string,std::string>::insert[abi:ne180100]<std::pair<std::string const,std::string> const*>(const void **result, std::string *a2, std::string *a3)
{
  std::string *v4;
  const void **v5;
  uint64_t v6;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = result;
    v6 = (uint64_t)(result + 1);
    do
    {
      result = (const void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::string> const&>(v5, v6, (const void **)&v4->__r_.__value_.__l.__data_, v4);
      v4 += 2;
    }
    while (v4 != a3);
  }
  return result;
}

void *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::string> const&>(const void **a1, uint64_t a2, const void **a3, const std::string *a4)
{
  const void **v6;
  void *v7;
  const void **v8;
  void *v10[3];
  uint64_t v11;
  const void **v12;

  v6 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(a1, a2, &v12, &v11, a3);
  v7 = (void *)*v6;
  if (!*v6)
  {
    v8 = v6;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v12, (_QWORD **)v8, (_QWORD *)v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v10, 0);
  }
  return v7;
}

const void **std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(const void **result, uint64_t a2, const void ***a3, _QWORD *a4, const void **a5)
{
  _QWORD *v8;
  const void **v9;
  _QWORD **v11;
  const void **v12;
  const void **v13;
  const void **v14;

  v8 = result;
  v9 = result + 1;
  if (result + 1 != (const void **)a2)
  {
    result = (const void **)std::less<std::string>::operator()[abi:ne180100]((uint64_t)(result + 2), a5, (const void **)(a2 + 32));
    if (!(_DWORD)result)
    {
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(v8 + 2), (const void **)(a2 + 32), a5))
      {
        *a3 = (const void **)a2;
        *a4 = a2;
        return (const void **)a4;
      }
      v14 = (const void **)a2;
      std::__tree_iterator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,void *> *,long>::operator++[abi:ne180100]((uint64_t)&v14);
      v13 = v14;
      if (v14 == v9 || std::less<std::string>::operator()[abi:ne180100]((uint64_t)(v8 + 2), a5, v14 + 4))
      {
        a4 = (_QWORD *)(a2 + 8);
        if (*(_QWORD *)(a2 + 8))
        {
          *a3 = v13;
          return v13;
        }
        else
        {
          *a3 = (const void **)a2;
        }
        return (const void **)a4;
      }
      return (const void **)std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__find_equal<std::string>((uint64_t)v8, a3, a5);
    }
  }
  v14 = (const void **)a2;
  if (*v8 != a2)
  {
    v11 = std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>::operator--[abi:ne180100](&v14);
    result = (const void **)std::less<std::string>::operator()[abi:ne180100]((uint64_t)(v8 + 2), (const void **)*v11 + 4, a5);
    if (!(_DWORD)result)
      return (const void **)std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<CtrXPC::Event>)>>>>::__find_equal<std::string>((uint64_t)v8, a3, a5);
  }
  if (!*(_QWORD *)a2)
  {
    *a3 = (const void **)a2;
    return (const void **)a2;
  }
  v12 = v14;
  *a3 = v14;
  if (v12)
    return v12 + 1;
  __break(0x5516u);
  return result;
}

std::string *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>@<X0>(uint64_t a1@<X0>, const std::string *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x50uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<std::string const,std::string>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_23A10FE40(_Unwind_Exception *a1)
{
  void **v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

_QWORD **std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>::operator--[abi:ne180100](_QWORD **result)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  BOOL v4;

  v1 = *result;
  v2 = (_QWORD *)**result;
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (_QWORD *)v2[1];
    }
    while (v2);
  }
  else
  {
    do
    {
      v3 = (_QWORD *)v1[2];
      v4 = *v3 == (_QWORD)v1;
      v1 = v3;
    }
    while (v4);
  }
  *result = v3;
  return result;
}

std::string *std::pair<std::string const,std::string>::pair[abi:ne180100](std::string *a1, const std::string *a2)
{
  std::string *v4;

  v4 = std::string::basic_string(a1, a2);
  std::string::basic_string(v4 + 1, a2 + 1);
  return a1;
}

void sub_23A10FEC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](void **a1, void *a2)
{
  void *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)(a1 + 1), v3);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)__p + 32);
  if (__p)
    operator delete(__p);
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::~__tree(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFvhN3xpc4dictEEEclIJN6CtrXPC3__0ES2_EEEvDpT__block_invoke(uint64_t a1)
{
  int v1;
  void *v2;
  uint64_t v3;
  xpc_object_t object;

  v1 = *(_DWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  object = v2;
  if (v2)
    xpc_retain(v2);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, _QWORD, xpc_object_t *))(v3 + 16))(v3, v1, &object);
  xpc_release(object);
}

void sub_23A110050(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFvhN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  void *v6;
  xpc_object_t result;

  v4 = *(const void **)(a2 + 32);
  if (v4)
    v5 = _Block_copy(v4);
  else
    v5 = 0;
  v6 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  if (v6)
    return xpc_retain(v6);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFvhN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

uint64_t _GLOBAL__sub_I_CoreThreadRadio_Entitlements_cpp()
{
  void (*v0)(void *);
  std::string *v1;
  __int128 v2;
  std::string *v3;
  __int128 v4;
  std::string *v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  __int128 v30;
  std::string *v31;
  __int128 v32;
  uint64_t v33;
  std::string *v34;
  void *v36[2];
  char v37;
  std::string v38;
  void *__p[2];
  std::string::size_type v40;
  void *v41[2];
  char v42;
  std::string v43;
  __int128 v44;
  std::string::size_type v45;
  void *v46[2];
  char v47;
  std::string v48;
  __int128 v49;
  std::string::size_type v50;
  void *v51[2];
  char v52;
  std::string v53;
  __int128 v54;
  std::string::size_type v55;
  void *v56[2];
  char v57;
  std::string v58;
  __int128 v59;
  std::string::size_type v60;
  void *v61[2];
  char v62;
  std::string v63;
  __int128 v64;
  std::string::size_type v65;
  void *v66[2];
  char v67;
  std::string v68;
  __int128 v69;
  std::string::size_type v70;
  void *v71[2];
  char v72;
  std::string v73;
  __int128 v74;
  std::string::size_type v75;
  void *v76[2];
  char v77;
  std::string v78;
  __int128 v79;
  std::string::size_type v80;
  void *v81[2];
  char v82;
  std::string v83;
  __int128 v84;
  std::string::size_type v85;
  void *v86[2];
  char v87;
  std::string v88;
  __int128 v89;
  std::string::size_type v90;
  void *v91[2];
  char v92;
  std::string v93;
  __int128 v94;
  std::string::size_type v95;
  void *v96[2];
  char v97;
  std::string v98;
  __int128 v99;
  std::string::size_type v100;
  void *v101[2];
  char v102;
  std::string v103;
  __int128 v104;
  std::string::size_type v105;
  void *v106[2];
  char v107;
  std::string v108;
  __int128 v109;
  std::string::size_type v110;
  void *v111[2];
  char v112;
  std::string v113;
  __int128 v114;
  std::string::size_type v115;
  std::string v116[2];
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[6];
  _QWORD v122[6];
  _QWORD v123[6];
  _QWORD v124[6];
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD v135[7];

  v135[6] = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsReadPSKc, "com.apple.private.fillmore.pskc.get");
  v0 = (void (*)(void *))MEMORY[0x24BEDACF0];
  __cxa_atexit(MEMORY[0x24BEDACF0], &kThreadEntitlementsReadPSKc, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsWritePSKc, "com.apple.private.fillmore.pskc.set");
  __cxa_atexit(v0, &kThreadEntitlementsWritePSKc, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsReadMasterKey, "com.apple.private.fillmore.masterkey.get");
  __cxa_atexit(v0, &kThreadEntitlementsReadMasterKey, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsWriteMasterKey, "com.apple.private.fillmore.masterkey.set");
  __cxa_atexit(v0, &kThreadEntitlementsWriteMasterKey, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsSetChannel, "com.apple.private.fillmore.channel.set");
  __cxa_atexit(v0, &kThreadEntitlementsSetChannel, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsAddService, "com.apple.private.fillmore.service.add");
  __cxa_atexit(v0, &kThreadEntitlementsAddService, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsRemoveService, "com.apple.private.fillmore.service.remove");
  __cxa_atexit(v0, &kThreadEntitlementsRemoveService, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsPrefixModification, "com.apple.private.fillmore.prefix.modification");
  __cxa_atexit(v0, &kThreadEntitlementsPrefixModification, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsAccessoryInfoModification, "com.apple.private.fillmore.AccessoryInfo.modification");
  __cxa_atexit(v0, &kThreadEntitlementsAccessoryInfoModification, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsattachToNetwork, "com.apple.private.fillmore.attachToNetwork");
  __cxa_atexit(v0, &kThreadEntitlementsattachToNetwork, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementscommissionOrFormNetwork, "com.apple.private.fillmore.commissionOrFormNetwork");
  __cxa_atexit(v0, &kThreadEntitlementscommissionOrFormNetwork, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsthreadStart, "com.apple.private.fillmore.threadStart");
  __cxa_atexit(v0, &kThreadEntitlementsthreadStart, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsthreadLeave, "com.apple.private.fillmore.threadLeave");
  __cxa_atexit(v0, &kThreadEntitlementsthreadLeave, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsUpdatePrimaryResident, "com.apple.private.fillmore.updatePrimaryResident");
  __cxa_atexit(v0, &kThreadEntitlementsUpdatePrimaryResident, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsGetTriggerStats, "com.apple.private.fillmore.getTriggerStats");
  __cxa_atexit(v0, &kThreadEntitlementsGetTriggerStats, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsProvideEMAC, "com.apple.private.fillmore.provideEmac");
  __cxa_atexit(v0, &kThreadEntitlementsProvideEMAC, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsStartEMAC, "com.apple.private.fillmore.startPairing");
  __cxa_atexit(v0, &kThreadEntitlementsStartEMAC, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsStopEMAC, "com.apple.private.fillmore.stopPairing");
  __cxa_atexit(v0, &kThreadEntitlementsStopEMAC, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsStartFWUpdate, "com.apple.private.fillmore.startFWUpdate");
  __cxa_atexit(v0, &kThreadEntitlementsStartFWUpdate, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&kThreadEntitlementsStopFWUpdate, "com.apple.private.fillmore.stopFWUpdate");
  __cxa_atexit(v0, &kThreadEntitlementsStopFWUpdate, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(kThreadEntitlementPrivateCtrFramework, "com.apple.private.ctr.thread");
  __cxa_atexit(v0, kThreadEntitlementPrivateCtrFramework, &dword_23A0F8000);
  std::string::basic_string[abi:ne180100]<0>(&v113, "PropGet");
  std::string::basic_string[abi:ne180100]<0>(v111, "Network:PSKc");
  v1 = std::string::append[abi:ne180100](&v113, (const std::string::value_type *)v111);
  v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v115 = v1->__r_.__value_.__r.__words[2];
  v114 = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)v116, &v114, &kThreadEntitlementsReadPSKc);
  std::string::basic_string[abi:ne180100]<0>(&v108, "PropSet");
  std::string::basic_string[abi:ne180100]<0>(v106, "Network:PSKc");
  v3 = std::string::append[abi:ne180100](&v108, (const std::string::value_type *)v106);
  v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v110 = v3->__r_.__value_.__r.__words[2];
  v109 = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v117, &v109, &kThreadEntitlementsWritePSKc);
  std::string::basic_string[abi:ne180100]<0>(&v103, "PropGet");
  std::string::basic_string[abi:ne180100]<0>(v101, "Network:Key");
  v5 = std::string::append[abi:ne180100](&v103, (const std::string::value_type *)v101);
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v105 = v5->__r_.__value_.__r.__words[2];
  v104 = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v118, &v104, &kThreadEntitlementsReadMasterKey);
  std::string::basic_string[abi:ne180100]<0>(&v98, "PropSet");
  std::string::basic_string[abi:ne180100]<0>(v96, "Network:Key");
  v7 = std::string::append[abi:ne180100](&v98, (const std::string::value_type *)v96);
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v100 = v7->__r_.__value_.__r.__words[2];
  v99 = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v119, &v99, &kThreadEntitlementsWriteMasterKey);
  std::string::basic_string[abi:ne180100]<0>(&v93, "setChannel");
  std::string::basic_string[abi:ne180100]<0>(v91, "setChannel");
  v9 = std::string::append[abi:ne180100](&v93, (const std::string::value_type *)v91);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v95 = v9->__r_.__value_.__r.__words[2];
  v94 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v120, &v94, &kThreadEntitlementsSetChannel);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[11],std::string const&,0>(v121, "ServiceAdd", &kThreadEntitlementsAddService);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[14],std::string const&,0>(v122, "ServiceRemove", &kThreadEntitlementsRemoveService);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[14],std::string const&,0>(v123, "ConfigGateway", &kThreadEntitlementsPrefixModification);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[20],std::string const&,0>(v124, "UpdateAccessoryData", &kThreadEntitlementsAccessoryInfoModification);
  std::string::basic_string[abi:ne180100]<0>(&v88, "attachToNetwork");
  std::string::basic_string[abi:ne180100]<0>(v86, "attachToNetwork");
  v11 = std::string::append[abi:ne180100](&v88, (const std::string::value_type *)v86);
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v90 = v11->__r_.__value_.__r.__words[2];
  v89 = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v125, &v89, &kThreadEntitlementsattachToNetwork);
  std::string::basic_string[abi:ne180100]<0>(&v83, "commissionOrFormNetwork");
  std::string::basic_string[abi:ne180100]<0>(v81, "commissionOrFormNetwork");
  v13 = std::string::append[abi:ne180100](&v83, (const std::string::value_type *)v81);
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v85 = v13->__r_.__value_.__r.__words[2];
  v84 = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v126, &v84, &kThreadEntitlementscommissionOrFormNetwork);
  std::string::basic_string[abi:ne180100]<0>(&v78, "threadStart");
  std::string::basic_string[abi:ne180100]<0>(v76, "threadStart");
  v15 = std::string::append[abi:ne180100](&v78, (const std::string::value_type *)v76);
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v80 = v15->__r_.__value_.__r.__words[2];
  v79 = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v127, &v79, &kThreadEntitlementsthreadStart);
  std::string::basic_string[abi:ne180100]<0>(&v73, "threadLeave");
  std::string::basic_string[abi:ne180100]<0>(v71, "threadLeave");
  v17 = std::string::append[abi:ne180100](&v73, (const std::string::value_type *)v71);
  v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v75 = v17->__r_.__value_.__r.__words[2];
  v74 = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v128, &v74, &kThreadEntitlementsthreadLeave);
  std::string::basic_string[abi:ne180100]<0>(&v68, "provideEmac");
  std::string::basic_string[abi:ne180100]<0>(v66, "provideEmac");
  v19 = std::string::append[abi:ne180100](&v68, (const std::string::value_type *)v66);
  v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v70 = v19->__r_.__value_.__r.__words[2];
  v69 = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v129, &v69, &kThreadEntitlementsProvideEMAC);
  std::string::basic_string[abi:ne180100]<0>(&v63, "startPairing");
  std::string::basic_string[abi:ne180100]<0>(v61, "startPairing");
  v21 = std::string::append[abi:ne180100](&v63, (const std::string::value_type *)v61);
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v65 = v21->__r_.__value_.__r.__words[2];
  v64 = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v130, &v64, &kThreadEntitlementsStartEMAC);
  std::string::basic_string[abi:ne180100]<0>(&v58, "stopPairing");
  std::string::basic_string[abi:ne180100]<0>(v56, "stopPairing");
  v23 = std::string::append[abi:ne180100](&v58, (const std::string::value_type *)v56);
  v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v60 = v23->__r_.__value_.__r.__words[2];
  v59 = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v131, &v59, &kThreadEntitlementsStopEMAC);
  std::string::basic_string[abi:ne180100]<0>(&v53, "updatePrimaryResident");
  std::string::basic_string[abi:ne180100]<0>(v51, "updatePrimaryResident");
  v25 = std::string::append[abi:ne180100](&v53, (const std::string::value_type *)v51);
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v55 = v25->__r_.__value_.__r.__words[2];
  v54 = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v132, &v54, &kThreadEntitlementsUpdatePrimaryResident);
  std::string::basic_string[abi:ne180100]<0>(&v48, "getTriggerBasedStats");
  std::string::basic_string[abi:ne180100]<0>(v46, "getTriggerBasedStats");
  v27 = std::string::append[abi:ne180100](&v48, (const std::string::value_type *)v46);
  v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v50 = v27->__r_.__value_.__r.__words[2];
  v49 = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v133, &v49, &kThreadEntitlementsGetTriggerStats);
  std::string::basic_string[abi:ne180100]<0>(&v43, "startFWUpdate");
  std::string::basic_string[abi:ne180100]<0>(v41, "startFWUpdate");
  v29 = std::string::append[abi:ne180100](&v43, (const std::string::value_type *)v41);
  v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v45 = v29->__r_.__value_.__r.__words[2];
  v44 = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)&v134, &v44, &kThreadEntitlementsStartFWUpdate);
  std::string::basic_string[abi:ne180100]<0>(&v38, "stopFWUpdate");
  std::string::basic_string[abi:ne180100]<0>(v36, "stopFWUpdate");
  v31 = std::string::append[abi:ne180100](&v38, (const std::string::value_type *)v36);
  v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v40 = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<std::string,std::string const&,0>((uint64_t)v135, (__int128 *)__p, &kThreadEntitlementsStopFWUpdate);
  std::map<std::string,std::string>::map[abi:ne180100]((uint64_t)&kEntitlementStringToMethodMap, v116, 20);
  v33 = 40;
  do
  {
    v34 = &v116[v33];
    if (SHIBYTE(v116[v33 - 1].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34[-1].__r_.__value_.__l.__data_);
    if (SHIBYTE(v34[-2].__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34[-2].__r_.__value_.__l.__data_);
    v33 -= 2;
  }
  while (v33 * 24);
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  if (v37 < 0)
    operator delete(v36[0]);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  if (SHIBYTE(v45) < 0)
    operator delete((void *)v44);
  if (v42 < 0)
    operator delete(v41[0]);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  if (SHIBYTE(v50) < 0)
    operator delete((void *)v49);
  if (v47 < 0)
    operator delete(v46[0]);
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  if (SHIBYTE(v55) < 0)
    operator delete((void *)v54);
  if (v52 < 0)
    operator delete(v51[0]);
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
  if (SHIBYTE(v60) < 0)
    operator delete((void *)v59);
  if (v57 < 0)
    operator delete(v56[0]);
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v58.__r_.__value_.__l.__data_);
  if (SHIBYTE(v65) < 0)
    operator delete((void *)v64);
  if (v62 < 0)
    operator delete(v61[0]);
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v63.__r_.__value_.__l.__data_);
  if (SHIBYTE(v70) < 0)
    operator delete((void *)v69);
  if (v67 < 0)
    operator delete(v66[0]);
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v68.__r_.__value_.__l.__data_);
  if (SHIBYTE(v75) < 0)
    operator delete((void *)v74);
  if (v72 < 0)
    operator delete(v71[0]);
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v73.__r_.__value_.__l.__data_);
  if (SHIBYTE(v80) < 0)
    operator delete((void *)v79);
  if (v77 < 0)
    operator delete(v76[0]);
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v78.__r_.__value_.__l.__data_);
  if (SHIBYTE(v85) < 0)
    operator delete((void *)v84);
  if (v82 < 0)
    operator delete(v81[0]);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  if (SHIBYTE(v90) < 0)
    operator delete((void *)v89);
  if (v87 < 0)
    operator delete(v86[0]);
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v88.__r_.__value_.__l.__data_);
  if (SHIBYTE(v95) < 0)
    operator delete((void *)v94);
  if (v92 < 0)
    operator delete(v91[0]);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v93.__r_.__value_.__l.__data_);
  if (SHIBYTE(v100) < 0)
    operator delete((void *)v99);
  if (v97 < 0)
    operator delete(v96[0]);
  if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v98.__r_.__value_.__l.__data_);
  if (SHIBYTE(v105) < 0)
    operator delete((void *)v104);
  if (v102 < 0)
    operator delete(v101[0]);
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v103.__r_.__value_.__l.__data_);
  if (SHIBYTE(v110) < 0)
    operator delete((void *)v109);
  if (v107 < 0)
    operator delete(v106[0]);
  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v108.__r_.__value_.__l.__data_);
  if (SHIBYTE(v115) < 0)
    operator delete((void *)v114);
  if (v112 < 0)
    operator delete(v111[0]);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v113.__r_.__value_.__l.__data_);
  return __cxa_atexit((void (*)(void *))std::map<std::string,std::string>::~map[abi:ne180100], &kEntitlementStringToMethodMap, &dword_23A0F8000);
}

void sub_23A110EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,uint64_t a56,int a57,__int16 a58,char a59,char a60,uint64_t a61,uint64_t a62,int a63)
{
  char a66;
  char a72;
  char a73;
  char a74;
  char a75;
  char a76;
  char a77;
  char a78;
  char a79;
  char a80;
  void **v80;
  uint64_t v81;

  _GLOBAL__sub_I_CoreThreadRadio_Entitlements_cpp_cold_1(v81 + 960, (uint64_t)&STACK[0x508]);
  if (a28 < 0)
    operator delete(__p);
  if (a16 < 0)
    operator delete(a11);
  if (a22 < 0)
    operator delete(a17);
  if (a47 < 0)
    operator delete(*v80);
  if (a35 < 0)
    operator delete(a30);
  if (a41 < 0)
    operator delete(a36);
  if (a66 < 0)
    operator delete(v80[10]);
  if (a54 < 0)
    operator delete(v80[4]);
  if (a60 < 0)
    operator delete(v80[7]);
  if (a74 < 0)
    operator delete(v80[20]);
  if (a72 < 0)
    operator delete(v80[14]);
  if (a73 < 0)
    operator delete(v80[17]);
  if (a77 < 0)
    operator delete(v80[30]);
  if (a75 < 0)
    operator delete(v80[24]);
  if (a76 < 0)
    operator delete(v80[27]);
  if (a80 < 0)
    operator delete(v80[40]);
  if (a78 < 0)
    operator delete(v80[34]);
  if (a79 < 0)
    operator delete(v80[37]);
  if (SLOBYTE(STACK[0x237]) < 0)
    operator delete(v80[50]);
  if (SLOBYTE(STACK[0x207]) < 0)
    operator delete(v80[44]);
  if (SLOBYTE(STACK[0x21F]) < 0)
    operator delete(v80[47]);
  if (SLOBYTE(STACK[0x287]) < 0)
    operator delete(v80[60]);
  if (SLOBYTE(STACK[0x257]) < 0)
    operator delete(v80[54]);
  if (SLOBYTE(STACK[0x26F]) < 0)
    operator delete(v80[57]);
  if (SLOBYTE(STACK[0x2D7]) < 0)
    operator delete(v80[70]);
  if (SLOBYTE(STACK[0x2A7]) < 0)
    operator delete(v80[64]);
  if (SLOBYTE(STACK[0x2BF]) < 0)
    operator delete(v80[67]);
  if (SLOBYTE(STACK[0x327]) < 0)
    operator delete(v80[80]);
  if (SLOBYTE(STACK[0x2F7]) < 0)
    operator delete(v80[74]);
  if (SLOBYTE(STACK[0x30F]) < 0)
    operator delete(v80[77]);
  if (SLOBYTE(STACK[0x377]) < 0)
    operator delete(v80[90]);
  if (SLOBYTE(STACK[0x347]) < 0)
    operator delete(v80[84]);
  if (SLOBYTE(STACK[0x35F]) < 0)
    operator delete(v80[87]);
  if (SLOBYTE(STACK[0x3C7]) < 0)
    operator delete(v80[100]);
  if (SLOBYTE(STACK[0x397]) < 0)
    operator delete(v80[94]);
  if (SLOBYTE(STACK[0x3AF]) < 0)
    operator delete(v80[97]);
  if (SLOBYTE(STACK[0x417]) < 0)
    operator delete(v80[110]);
  if (SLOBYTE(STACK[0x3E7]) < 0)
    operator delete(v80[104]);
  if (SLOBYTE(STACK[0x3FF]) < 0)
    operator delete(v80[107]);
  if (SLOBYTE(STACK[0x467]) < 0)
    operator delete(v80[120]);
  if (SLOBYTE(STACK[0x437]) < 0)
    operator delete(v80[114]);
  if (SLOBYTE(STACK[0x44F]) < 0)
    operator delete(v80[117]);
  if (SLOBYTE(STACK[0x4B7]) < 0)
    operator delete(v80[130]);
  if (SLOBYTE(STACK[0x487]) < 0)
    operator delete(v80[124]);
  if (SLOBYTE(STACK[0x49F]) < 0)
    operator delete(v80[127]);
  if (SLOBYTE(STACK[0x507]) < 0)
    operator delete(v80[140]);
  if (SLOBYTE(STACK[0x4D7]) < 0)
    operator delete(v80[134]);
  if (SLOBYTE(STACK[0x4EF]) < 0)
    operator delete(v80[137]);
  _Unwind_Resume(a1);
}

void sub_23A1112E0()
{
  JUMPOUT(0x23A110FB4);
}

void sub_23A1112F0()
{
  JUMPOUT(0x23A110FC4);
}

void sub_23A111300()
{
  JUMPOUT(0x23A110FD4);
}

void sub_23A111310()
{
  JUMPOUT(0x23A110FD4);
}

void sub_23A111320()
{
  JUMPOUT(0x23A110FE4);
}

void sub_23A111330()
{
  JUMPOUT(0x23A110FF4);
}

void sub_23A111340()
{
  JUMPOUT(0x23A111004);
}

void sub_23A111350()
{
  JUMPOUT(0x23A111004);
}

void sub_23A111360()
{
  JUMPOUT(0x23A111014);
}

void sub_23A111370()
{
  JUMPOUT(0x23A111024);
}

void sub_23A111380()
{
  JUMPOUT(0x23A111034);
}

void sub_23A111390()
{
  JUMPOUT(0x23A111034);
}

void sub_23A1113A0()
{
  JUMPOUT(0x23A111044);
}

void sub_23A1113B0()
{
  JUMPOUT(0x23A111054);
}

void sub_23A1113C0()
{
  JUMPOUT(0x23A111064);
}

void sub_23A1113D0()
{
  JUMPOUT(0x23A111064);
}

void sub_23A1113E0()
{
  JUMPOUT(0x23A111074);
}

void sub_23A1113F0()
{
  JUMPOUT(0x23A111084);
}

void sub_23A111400()
{
  JUMPOUT(0x23A111094);
}

void sub_23A111410()
{
  JUMPOUT(0x23A111094);
}

void sub_23A111420()
{
  JUMPOUT(0x23A1110A4);
}

void sub_23A111430()
{
  JUMPOUT(0x23A1110B4);
}

void sub_23A111440()
{
  JUMPOUT(0x23A1110C4);
}

void sub_23A111450()
{
  JUMPOUT(0x23A1110C4);
}

void sub_23A111460()
{
  JUMPOUT(0x23A1110D4);
}

void sub_23A111470()
{
  JUMPOUT(0x23A1110E4);
}

void sub_23A111480()
{
  JUMPOUT(0x23A1110F4);
}

void sub_23A111490()
{
  JUMPOUT(0x23A1110F4);
}

void sub_23A1114A0()
{
  JUMPOUT(0x23A111104);
}

void sub_23A1114B0()
{
  JUMPOUT(0x23A111114);
}

void sub_23A1114C0()
{
  JUMPOUT(0x23A111124);
}

void sub_23A1114D0()
{
  JUMPOUT(0x23A111124);
}

void sub_23A1114E0()
{
  JUMPOUT(0x23A111134);
}

void sub_23A1114F0()
{
  JUMPOUT(0x23A111144);
}

void sub_23A111500()
{
  JUMPOUT(0x23A111154);
}

void sub_23A111510()
{
  JUMPOUT(0x23A111164);
}

void sub_23A111520()
{
  JUMPOUT(0x23A111174);
}

void sub_23A111530()
{
  JUMPOUT(0x23A111184);
}

void sub_23A111540()
{
  JUMPOUT(0x23A111184);
}

void sub_23A111550()
{
  JUMPOUT(0x23A111194);
}

void sub_23A111560()
{
  JUMPOUT(0x23A1111A4);
}

void sub_23A111570()
{
  JUMPOUT(0x23A1111B4);
}

void sub_23A111580()
{
  JUMPOUT(0x23A1111B4);
}

void sub_23A111590()
{
  JUMPOUT(0x23A1111C4);
}

void sub_23A1115A0()
{
  JUMPOUT(0x23A1111D4);
}

void sub_23A1115B0()
{
  JUMPOUT(0x23A1111E4);
}

void sub_23A1115C0()
{
  JUMPOUT(0x23A1111E4);
}

void sub_23A1115D0()
{
  JUMPOUT(0x23A1111F4);
}

void sub_23A1115E0()
{
  JUMPOUT(0x23A111204);
}

void sub_23A1115F0()
{
  JUMPOUT(0x23A111214);
}

void sub_23A111600()
{
  JUMPOUT(0x23A111214);
}

void sub_23A111614()
{
  JUMPOUT(0x23A111224);
}

void sub_23A111628()
{
  JUMPOUT(0x23A111234);
}

void sub_23A11163C()
{
  JUMPOUT(0x23A1112D4);
}

void sub_23A111644()
{
  JUMPOUT(0x23A111154);
}

void CtrXpcClient_resume_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_generateDiagnostics_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Resume command success.\n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A1117E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_resume_interface_helper@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  uint8_t buf[16];
  uint64_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t object;
  char __str[256];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v11 = xpc_string_create("org.wpantund.v1");
  if (!v11)
    v11 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v11, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
  v11 = 0;
  v9 = xpc_string_create(__str);
  if (!v9)
    v9 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "path";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v9, &v10);
  xpc_release(v10);
  v10 = 0;
  xpc_release(v9);
  v9 = 0;
  v7 = xpc_string_create("Attach");
  if (!v7)
    v7 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "method";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v7, &v8);
  xpc_release(v8);
  v8 = 0;
  xpc_release(v7);
  v7 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Resuming saved WPAN. . .\n", buf, 2u);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)&unk_23A11B5CA);
  *(_DWORD *)a2 = 0;
  result = *(double *)buf;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)buf;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

void sub_23A1119D0(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXPC::Event::getName(CtrXPC::Event::State **this)
{
  CtrXPC::Event::State::name(*this);
}

void CtrXPC::Event::State::name(CtrXPC::Event::State *this)
{
  const char *v1;
  _QWORD v2[2];
  xpc_object_t object;

  v2[0] = this;
  v2[1] = "event";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v2, &object);
  xpc::dyn_cast_or_default((xpc *)&object, (const object *)"invalid", v1);
  xpc_release(object);
}

void sub_23A111AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void CtrXPC::Event::getData(CtrXPC::Event *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD v2[2];

  v2[0] = *(_QWORD *)this;
  v2[1] = "eventData";
  xpc::dict::object_proxy::operator xpc::dict((uint64_t)v2, a2);
}

void CtrXPC::Event::getDataStr(CtrXPC::Event *this)
{
  xpc_object_t object;
  _QWORD v2[2];

  v2[0] = *(_QWORD *)this;
  v2[1] = "eventData";
  xpc::dict::object_proxy::operator xpc::dict((uint64_t)v2, &object);
  xpc::object::to_string((xpc::object *)&object);
  xpc_release(object);
}

void sub_23A111B50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

const char *CtrXPC::Event::getDataKey(CtrXPC::Event *this)
{
  const char *string;
  xpc_object_t xdict;
  _QWORD v4[2];

  v4[0] = *(_QWORD *)this;
  v4[1] = "eventData";
  xpc::dict::object_proxy::operator xpc::dict((uint64_t)v4, &xdict);
  string = xpc_dictionary_get_string(xdict, "key");
  xpc_release(xdict);
  return string;
}

void sub_23A111BC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

xpc_object_t CtrXPC::Event::getDataValue(CtrXPC::Event *this)
{
  xpc_object_t value;
  xpc_object_t xdict;
  _QWORD v4[2];

  v4[0] = *(_QWORD *)this;
  v4[1] = "eventData";
  xpc::dict::object_proxy::operator xpc::dict((uint64_t)v4, &xdict);
  value = xpc_dictionary_get_value(xdict, "value");
  xpc_release(xdict);
  return value;
}

void sub_23A111C40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

void CtrXPC::Event::name(CtrXPC::Event::State **this)
{
  CtrXPC::Event::State::name(*this);
}

void CtrXPC::Event::create(void **a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void **v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  void *aBlock;
  dispatch_object_t object;
  xpc_object_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v6 = (void **)operator new();
  v7 = *a1;
  v18 = v7;
  if (v7)
    xpc_retain(v7);
  else
    v18 = xpc_null_create();
  v8 = *(void **)a2;
  if (*(_QWORD *)a2)
    v8 = _Block_copy(v8);
  v9 = *(NSObject **)(a2 + 8);
  aBlock = v8;
  object = v9;
  if (v9)
    dispatch_retain(v9);
  CtrXPC::Event::State::State(v6, &v18, (uint64_t)&aBlock);
  std::shared_ptr<CtrXPC::Event::State>::shared_ptr[abi:ne180100]<CtrXPC::Event::State,void>(&v19, (uint64_t)v6);
  if (object)
    dispatch_release(object);
  if (aBlock)
    _Block_release(aBlock);
  xpc_release(v18);
  v18 = 0;
  v10 = (_QWORD *)operator new();
  v11 = (uint64_t)v10;
  v14 = v19;
  v15 = v20;
  if (v20)
  {
    p_shared_owners = &v20->__shared_owners_;
    do
      v13 = __ldxr((unint64_t *)p_shared_owners);
    while (__stxr(v13 + 1, (unint64_t *)p_shared_owners));
  }
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100](v10, &v14);
  std::shared_ptr<CtrXPC::Event>::shared_ptr[abi:ne180100]<CtrXPC::Event,void>(a3, v11);
  if (v15)
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  if (v20)
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
}

void sub_23A111D9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ctu::XpcClient const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void **CtrXPC::Event::State::State(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  void *v6;
  NSObject *v7;

  v5 = *a2;
  *a1 = *a2;
  if (v5)
    xpc_retain(v5);
  else
    *a1 = xpc_null_create();
  v6 = *(void **)a3;
  if (*(_QWORD *)a3)
    v6 = _Block_copy(v6);
  v7 = *(NSObject **)(a3 + 8);
  a1[1] = v6;
  a1[2] = v7;
  if (v7)
    dispatch_retain(v7);
  return a1;
}

_QWORD *std::shared_ptr<CtrXPC::Event::State>::shared_ptr[abi:ne180100]<CtrXPC::Event::State,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_250B20948;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_23A111EA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  CtrXPC::Event::State *v10;

  a10 = 0;
  if (v10)
    std::default_delete<CtrXPC::Event::State>::operator()[abi:ne180100]((int)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<CtrXPC::Event::State *,std::shared_ptr<CtrXPC::Event::State>::__shared_ptr_default_delete<CtrXPC::Event::State,CtrXPC::Event::State>,std::allocator<CtrXPC::Event::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B84139CLL);
}

void std::__shared_ptr_pointer<CtrXPC::Event::State *,std::shared_ptr<CtrXPC::Event::State>::__shared_ptr_default_delete<CtrXPC::Event::State,CtrXPC::Event::State>,std::allocator<CtrXPC::Event::State>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<CtrXPC::Event::State>::operator()[abi:ne180100](a1 + 24, *(CtrXPC::Event::State **)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<CtrXPC::Event::State *,std::shared_ptr<CtrXPC::Event::State>::__shared_ptr_default_delete<CtrXPC::Event::State,CtrXPC::Event::State>,std::allocator<CtrXPC::Event::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<CtrXPC::Event::State>::operator()[abi:ne180100](int a1, CtrXPC::Event::State *this)
{
  if (this)
  {
    CtrXPC::Event::State::~State(this);
    JUMPOUT(0x23B84139CLL);
  }
}

void CtrXPC::Event::State::~State(CtrXPC::Event::State *this)
{
  size_t v2;
  int v3;
  xpc_object_t v4;
  const void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const void *v10;
  void *__s1;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  void *aBlock;
  xpc_object_t object;

  if (!*((_QWORD *)this + 1) || !*((_QWORD *)this + 2))
    goto LABEL_30;
  CtrXPC::Event::State::name(this);
  v2 = strlen("invalid");
  if (SHIBYTE(v13) < 0)
  {
    if (v2 == v12)
    {
      if (v2 != -1)
      {
        v3 = memcmp(__s1, "invalid", v2);
        operator delete(__s1);
        if (!v3)
          goto LABEL_30;
        goto LABEL_13;
      }
      goto LABEL_35;
    }
    operator delete(__s1);
  }
  else if (v2 == HIBYTE(v13))
  {
    if (v2 != -1)
    {
      if (!memcmp(&__s1, "invalid", v2))
        goto LABEL_30;
      goto LABEL_13;
    }
LABEL_35:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
LABEL_13:
  v4 = *(xpc_object_t *)this;
  if (*(_QWORD *)this)
    xpc_retain(*(xpc_object_t *)this);
  else
    v4 = xpc_null_create();
  v5 = (const void *)*((_QWORD *)this + 1);
  if (v5)
    v6 = _Block_copy(v5);
  else
    v6 = 0;
  v7 = *((_QWORD *)this + 2);
  __s1 = (void *)MEMORY[0x24BDAC760];
  v12 = 1174405120;
  v13 = ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke;
  v14 = &__block_descriptor_tmp_2;
  if (v6)
    v8 = _Block_copy(v6);
  else
    v8 = 0;
  aBlock = v8;
  object = v4;
  if (v4)
    xpc_retain(v4);
  else
    object = xpc_null_create();
  dispatch_async(v7, &__s1);
  xpc_release(object);
  object = 0;
  if (aBlock)
    _Block_release(aBlock);
  if (v6)
    _Block_release(v6);
  xpc_release(v4);
LABEL_30:
  v9 = *((_QWORD *)this + 2);
  if (v9)
    dispatch_release(v9);
  v10 = (const void *)*((_QWORD *)this + 1);
  if (v10)
    _Block_release(v10);
  xpc_release(*(xpc_object_t *)this);
  *(_QWORD *)this = 0;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  dispatch::block<void({block_pointer})(xpc::dict)>::operator()<xpc::dict const&>((uint64_t *)(a1 + 32), (void **)(a1 + 40));
}

void dispatch::block<void({block_pointer})(xpc::dict)>::operator()<xpc::dict const&>(uint64_t *a1, void **a2)
{
  uint64_t v2;
  void *v3;
  xpc_object_t object;

  v2 = *a1;
  v3 = *a2;
  object = v3;
  if (v3)
    xpc_retain(v3);
  else
    object = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v2 + 16))(v2, &object);
  xpc_release(object);
}

void sub_23A1121D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  xpc::dict::~dict((xpc_object_t *)va);
  _Unwind_Resume(a1);
}

xpc_object_t __copy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  void *v6;
  xpc_object_t result;

  v4 = *(const void **)(a2 + 32);
  if (v4)
    v5 = _Block_copy(v4);
  else
    v5 = 0;
  v6 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  if (v6)
    return xpc_retain(v6);
  result = xpc_null_create();
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1)
{
  const void *v2;

  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  v2 = *(const void **)(a1 + 32);
  if (v2)
    _Block_release(v2);
}

_QWORD *std::shared_ptr<CtrXPC::Event>::shared_ptr[abi:ne180100]<CtrXPC::Event,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_250B209F0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_23A1122E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    std::default_delete<CtrXPC::Command>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<CtrXPC::Event *,std::shared_ptr<CtrXPC::Event>::__shared_ptr_default_delete<CtrXPC::Event,CtrXPC::Event>,std::allocator<CtrXPC::Event>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23B84139CLL);
}

void std::__shared_ptr_pointer<CtrXPC::Event *,std::shared_ptr<CtrXPC::Event>::__shared_ptr_default_delete<CtrXPC::Event,CtrXPC::Event>,std::allocator<CtrXPC::Event>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<CtrXPC::Command>::operator()[abi:ne180100](a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<CtrXPC::Event *,std::shared_ptr<CtrXPC::Event>::__shared_ptr_default_delete<CtrXPC::Event,CtrXPC::Event>,std::allocator<CtrXPC::Event>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

char *wpantund_status_to_cstr(unsigned int a1)
{
  if ((a1 & 0x80000000) != 0)
    return strerror(a1);
  if ((a1 & 0xFFFF0000) == 0xEA0000)
    return "NCP-Specific Errorcode";
  if (a1 > 0x21)
    return (char *)&unk_23A11B5CA;
  return (&off_250B20A58)[a1];
}

void CtrXpcClient_add_service_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Service is added.\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A112514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *CtrXpcClient_add_service_interface_helper@<X0>(xpc_object_t *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int v8;
  size_t v9;
  size_t v10;
  _BYTE *v11;
  _BYTE *v12;
  int v13;
  int v14;
  _QWORD *result;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t object;
  char __str[16];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = *((unsigned int *)a2 + 1);
  if (!(_DWORD)v4)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "enterprise number is invalid, given as(0)");
LABEL_14:
    *(_DWORD *)a3 = 10;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)__str;
    v16 = v26;
    goto LABEL_15;
  }
  v5 = (char *)*((_QWORD *)a2 + 1);
  if (!v5)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "Service data is not Given");
    goto LABEL_14;
  }
  v6 = (char *)*((_QWORD *)a2 + 2);
  if (!v6)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "Server data is not Given");
    goto LABEL_14;
  }
  v8 = *a2;
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v23 = xpc_string_create("org.wpantund.v1");
  if (!v23)
    v23 = xpc_null_create();
  *(_QWORD *)&v17 = a1;
  *((_QWORD *)&v17 + 1) = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v17, &v23, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v23);
  v23 = 0;
  v21 = xpc_string_create(__str);
  if (!v21)
    v21 = xpc_null_create();
  *(_QWORD *)&v17 = a1;
  *((_QWORD *)&v17 + 1) = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v17, &v21, &v22);
  xpc_release(v22);
  v22 = 0;
  xpc_release(v21);
  v21 = 0;
  v19 = xpc_string_create("ServiceAdd");
  if (!v19)
    v19 = xpc_null_create();
  *(_QWORD *)&v17 = a1;
  *((_QWORD *)&v17 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v17, &v19, &v20);
  xpc_release(v20);
  v20 = 0;
  xpc_release(v19);
  v19 = 0;
  v9 = strlen(v5);
  v10 = strlen(v6);
  v11 = malloc_type_malloc(v9, 0x100004077774924uLL);
  v12 = malloc_type_malloc(v10, 0x100004077774924uLL);
  v13 = parse_string_into_data(v11, v9, v5);
  v14 = parse_string_into_data(v12, v10, v6);
  xpc_dictionary_set_uint64(*a1, "enterprise_number", v4);
  xpc_dictionary_set_data(*a1, "service_data", v11, v13);
  xpc_dictionary_set_data(*a1, "server_data", v12, v14);
  xpc_dictionary_set_BOOL(*a1, "stable", v8 != 0);
  free(v11);
  free(v12);
  result = std::string::basic_string[abi:ne180100]<0>(&v17, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  *(_OWORD *)(a3 + 8) = v17;
  v16 = v18;
LABEL_15:
  *(_QWORD *)(a3 + 24) = v16;
  return result;
}

void sub_23A11282C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void parse_basic_type_from_xpc_msg(xpc_object_t *a1, void *a2, uint64_t a3)
{
  unsigned __int8 value;
  BOOL v7;
  __int16 v8;
  unsigned __int16 v9;
  int v10;
  unsigned int v11;
  int64_t v12;
  uint64_t v13;
  double v14;
  const char *string_ptr;
  size_t count;
  _BYTE *v17;
  size_t v18;
  char uint64;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t object;
  xpc_object_t v35;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t *v38;
  const char *v39;
  xpc_object_t v40;
  xpc_object_t v41;

  switch(a3)
  {
    case 1:
      value = xpc_uint64_get_value(a2);
      object = xpc_int64_create(value);
      if (!object)
        object = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &object, &v35);
      xpc_release(v35);
      v35 = 0;
      xpc_release(object);
      break;
    case 2:
      v7 = xpc_BOOL_get_value(a2);
      v36 = xpc_BOOL_create(v7);
      if (!v36)
        v36 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v36, &v37);
      xpc_release(v37);
      v37 = 0;
      xpc_release(v36);
      break;
    case 3:
      v8 = xpc_int64_get_value(a2);
      v32 = xpc_int64_create(v8);
      if (!v32)
        v32 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v32, &v33);
      xpc_release(v33);
      v33 = 0;
      xpc_release(v32);
      break;
    case 4:
      v9 = xpc_uint64_get_value(a2);
      v30 = xpc_int64_create(v9);
      if (!v30)
        v30 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v30, &v31);
      xpc_release(v31);
      v31 = 0;
      xpc_release(v30);
      break;
    case 5:
      v10 = xpc_int64_get_value(a2);
      v26 = xpc_int64_create(v10);
      if (!v26)
        v26 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v26, &v27);
      xpc_release(v27);
      v27 = 0;
      xpc_release(v26);
      break;
    case 6:
      v11 = xpc_uint64_get_value(a2);
      v28 = xpc_int64_create(v11);
      if (!v28)
        v28 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v28, &v29);
      xpc_release(v29);
      v29 = 0;
      xpc_release(v28);
      break;
    case 7:
      v12 = xpc_int64_get_value(a2);
      v22 = xpc_int64_create(v12);
      if (!v22)
        v22 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v22, &v23);
      xpc_release(v23);
      v23 = 0;
      xpc_release(v22);
      break;
    case 8:
      v13 = xpc_uint64_get_value(a2);
      v24 = xpc_uint64_create(v13);
      if (!v24)
        v24 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v24, &v25);
      xpc_release(v25);
      v25 = 0;
      xpc_release(v24);
      break;
    case 9:
      v14 = xpc_double_get_value(a2);
      v20 = xpc_double_create(v14);
      if (!v20)
        v20 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v20, &v21);
      xpc_release(v21);
      v21 = 0;
      xpc_release(v20);
      break;
    case 10:
      string_ptr = xpc_string_get_string_ptr(a2);
      v40 = xpc_string_create(string_ptr);
      if (!v40)
        v40 = xpc_null_create();
      v38 = a1;
      v39 = "PropVal";
      xpc::dict::object_proxy::operator=((uint64_t)&v38, &v40, &v41);
      xpc_release(v41);
      v41 = 0;
      xpc_release(v40);
      break;
    case 12:
    case 13:
      xpc_dictionary_set_value(*a1, "PropVal", a2);
      break;
    case 14:
      count = xpc_array_get_count(a2);
      v17 = malloc_type_malloc(count, 0x100004077774924uLL);
      if (count)
      {
        v18 = 0;
        while (1)
        {
          uint64 = xpc_array_get_uint64(a2, v18);
          if ((v18 & 0x8000000000000000) != 0 || count <= v18)
            break;
          v17[v18++] = uint64;
          if (count == v18)
            goto LABEL_41;
        }
        __break(1u);
      }
      else
      {
LABEL_41:
        xpc_dictionary_set_data(*a1, "PropVal", v17, count);
        free(v17);
      }
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        parse_basic_type_from_xpc_msg(a3);
      break;
  }
}

void CtrXpcClient_getprop_response_helper(int *a1, xpc_object_t *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char *string;
  xpc_object_t v14;
  unsigned int int64;
  char *v16;
  xpc_object_t array;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t count;
  size_t v27;
  NSObject *v28;
  const char *v29;
  xpc_object_t value;
  uint64_t uint64;
  xpc_object_t v32;
  _BYTE *v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t object;
  uint8_t buf[4];
  _BYTE *v38;
  _BYTE __p[22];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      CtrXpcClient_join_response_helper(v4, v5, v6, v7, v8, v9, v10, v11);
    std::string::basic_string[abi:ne180100]<0>(__p, "Reply is not a dictionary");
    v12 = 11;
LABEL_5:
    *a1 = v12;
    std::string::operator=[abi:ne180100]((uint64_t)(a1 + 2), (__int128 *)__p);
LABEL_6:
    if (v40 < 0)
      operator delete(*(void **)__p);
    return;
  }
  string = (char *)xpc_dictionary_get_string(*a2, "method");
  v14 = *a2;
  if (string == "GetInterfaces")
  {
    array = xpc_dictionary_get_array(v14, "list");
    if (MEMORY[0x23B841948]() != MEMORY[0x24BDACF78])
    {
      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v18)
        CtrXpcClient_getprop_response_helper(v18, v19, v20, v21, v22, v23, v24, v25);
      std::string::basic_string[abi:ne180100]<0>(__p, "unknown");
      *a1 = 3;
      std::string::operator=[abi:ne180100]((uint64_t)(a1 + 2), (__int128 *)__p);
      if (v40 < 0)
        operator delete(*(void **)__p);
    }
    count = xpc_array_get_count(array);
    if (count)
    {
      v27 = 0;
      v28 = MEMORY[0x24BDACB70];
      do
      {
        v29 = xpc_array_get_string(array, v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__p = 134218242;
          *(_QWORD *)&__p[4] = v27;
          *(_WORD *)&__p[12] = 2080;
          *(_QWORD *)&__p[14] = v29;
          _os_log_impl(&dword_23A0F8000, v28, OS_LOG_TYPE_INFO, "Interface(%zu) -> (%s)\n", __p, 0x16u);
        }
        v35 = xpc_string_create(v29);
        if (!v35)
          v35 = xpc_null_create();
        *(_QWORD *)__p = a2;
        *(_QWORD *)&__p[8] = "PropVal";
        xpc::dict::object_proxy::operator=((uint64_t)__p, &v35, &object);
        xpc_release(object);
        object = 0;
        xpc_release(v35);
        v35 = 0;
        ++v27;
      }
      while (count != v27);
    }
  }
  else
  {
    int64 = xpc_dictionary_get_int64(v14, "ret");
    xpc_dictionary_get_string(*a2, "property_name");
    if (int64)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_generateDiagnostics_response_helper((uint64_t)string, int64);
      v16 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(__p, v16);
      v12 = 3;
      goto LABEL_5;
    }
    value = xpc_dictionary_get_value(*a2, "value");
    uint64 = xpc_dictionary_get_uint64(*a2, "v_type");
    v32 = *a2;
    v34 = v32;
    if (v32)
      xpc_retain(v32);
    else
      v34 = xpc_null_create();
    parse_basic_type_from_xpc_msg(&v34, value, uint64);
    xpc_release(v34);
    v34 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      xpc::dict::to_debug_string((xpc::dict *)a2, __p);
      if (v40 >= 0)
        v33 = __p;
      else
        v33 = *(_BYTE **)__p;
      *(_DWORD *)buf = 136315138;
      v38 = v33;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Response is: %s", buf, 0xCu);
      goto LABEL_6;
    }
  }
}

void sub_23A113124(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void CtrXpcClient_getprop_interface_helper(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const char *v4;
  void **v6;
  int v7;
  void *v8;
  uint64_t v9;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  uint64_t v17;
  const char *v18;
  xpc_object_t v19;
  xpc_object_t object;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  void *__p[2];
  char v28;
  __int128 __str;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = *(const char **)a2;
  if (!*(_QWORD *)a2 || !*v4)
  {
    std::string::basic_string[abi:ne180100]<0>(&__str, "No inputs were given");
    v7 = 9;
LABEL_8:
    *(_DWORD *)a3 = v7;
    *(_OWORD *)(a3 + 8) = __str;
    *(_QWORD *)(a3 + 24) = v30;
    return;
  }
  if (!*(_QWORD *)(a2 + 8))
  {
    std::string::basic_string[abi:ne180100]<0>(&__str, "Output pointer is not given");
    v7 = 10;
    goto LABEL_8;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)a2);
  if (v28 < 0)
  {
    if (__p[1] != (void *)13)
      goto LABEL_17;
    v6 = (void **)__p[0];
  }
  else
  {
    if (v28 != 13)
      goto LABEL_17;
    v6 = __p;
  }
  v8 = *v6;
  v9 = *(uint64_t *)((char *)v6 + 5);
  if (v8 == (void *)0x7265746E49746547 && v9 == 0x7365636166726574)
  {
    v25 = xpc_string_create("com.nestlabs.WPANTunnelDriver");
    if (!v25)
      v25 = xpc_null_create();
    *(_QWORD *)&__str = a1;
    *((_QWORD *)&__str + 1) = "interface";
    xpc::dict::object_proxy::operator=((uint64_t)&__str, &v25, &v26);
    xpc_release(v26);
    v26 = 0;
    xpc_release(v25);
    v25 = 0;
    v23 = xpc_string_create("/com/nestlabs/WPANTunnelDriver");
    if (!v23)
      v23 = xpc_null_create();
    *(_QWORD *)&__str = a1;
    *((_QWORD *)&__str + 1) = "path";
    xpc::dict::object_proxy::operator=((uint64_t)&__str, &v23, &v24);
    xpc_release(v24);
    v24 = 0;
    xpc_release(v23);
    v23 = 0;
    v21 = xpc_string_create("GetInterfaces");
    if (!v21)
      v21 = xpc_null_create();
    *(_QWORD *)&__str = a1;
    *((_QWORD *)&__str + 1) = "method";
    xpc::dict::object_proxy::operator=((uint64_t)&__str, &v21, &v22);
    xpc_release(v22);
    v22 = 0;
    xpc_release(v21);
    v21 = 0;
    goto LABEL_26;
  }
LABEL_17:
  snprintf((char *)&__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v19 = xpc_string_create("org.wpantund.v1");
  if (!v19)
    v19 = xpc_null_create();
  v17 = a1;
  v18 = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)&v17, &v19, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v19);
  v19 = 0;
  v15 = xpc_string_create((const char *)&__str);
  if (!v15)
    v15 = xpc_null_create();
  v17 = a1;
  v18 = "path";
  xpc::dict::object_proxy::operator=((uint64_t)&v17, &v15, &v16);
  xpc_release(v16);
  v16 = 0;
  xpc_release(v15);
  v15 = 0;
  v13 = xpc_string_create("PropGet");
  if (!v13)
    v13 = xpc_null_create();
  v17 = a1;
  v18 = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v17, &v13, &v14);
  xpc_release(v14);
  v14 = 0;
  xpc_release(v13);
  v13 = 0;
  v11 = xpc_string_create(v4);
  if (!v11)
    v11 = xpc_null_create();
  v17 = a1;
  v18 = "property_name";
  xpc::dict::object_proxy::operator=((uint64_t)&v17, &v11, &v12);
  xpc_release(v12);
  v12 = 0;
  xpc_release(v11);
  v11 = 0;
LABEL_26:
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  *(_OWORD *)(a3 + 8) = __str;
  *(_QWORD *)(a3 + 24) = v30;
  if (v28 < 0)
    operator delete(__p[0]);
}

void sub_23A113518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void CtrXpcClient_scan_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully Scan Completed!\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A113718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_scan_interface_helper@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int64_t v5;
  int v6;
  int v7;
  int64_t v8;
  int v9;
  double result;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t object;
  uint8_t buf[16];
  uint64_t v30;
  char __str[256];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned int *)(a2 + 8);
  v6 = *(unsigned __int8 *)(a2 + 12);
  v7 = *(unsigned __int8 *)(a2 + 13);
  v8 = *(unsigned __int16 *)(a2 + 14);
  v9 = *(_DWORD *)(a2 + 16);
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v27 = xpc_string_create("org.wpantund.v1");
  if (!v27)
    v27 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v27, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v27);
  v27 = 0;
  v25 = xpc_string_create(__str);
  if (!v25)
    v25 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "path";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v25, &v26);
  xpc_release(v26);
  v26 = 0;
  xpc_release(v25);
  v25 = 0;
  if (v9 == 2)
  {
    v19 = xpc_string_create("NetScanStart");
    if (!v19)
      v19 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "method";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v19, &v20);
    xpc_release(v20);
    v20 = 0;
    xpc_release(v19);
    v19 = 0;
  }
  else if (v9 == 1)
  {
    v21 = xpc_string_create("DiscoverScanStart");
    if (!v21)
      v21 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "method";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v21, &v22);
    xpc_release(v22);
    v22 = 0;
    xpc_release(v21);
    v21 = 0;
  }
  else
  {
    if (v9)
    {
      std::string::basic_string[abi:ne180100]<0>(buf, "Scan Type is Invalid");
      *(_DWORD *)a3 = 10;
      goto LABEL_31;
    }
    v23 = xpc_string_create("EnergyScanStart");
    if (!v23)
      v23 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "method";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v23, &v24);
    xpc_release(v24);
    v24 = 0;
    xpc_release(v23);
    v23 = 0;
  }
  v17 = xpc_int64_create(v5);
  if (!v17)
    v17 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "channel_mask";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v17, &v18);
  xpc_release(v18);
  v18 = 0;
  xpc_release(v17);
  v17 = 0;
  if (v9 == 1)
  {
    v15 = xpc_BOOL_create(v6 != 0);
    if (!v15)
      v15 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "joiner_flag";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v15, &v16);
    xpc_release(v16);
    v16 = 0;
    xpc_release(v15);
    v15 = 0;
    v13 = xpc_BOOL_create(v7 != 0);
    if (!v13)
      v13 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "enable_filtering";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v13, &v14);
    xpc_release(v14);
    v14 = 0;
    xpc_release(v13);
    v13 = 0;
    v11 = xpc_int64_create(v8);
    if (!v11)
      v11 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "pan_id_filter";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v11, &v12);
    xpc_release(v12);
    v12 = 0;
    xpc_release(v11);
    v11 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Starting Scan of Type %d \n", buf, 8u);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
LABEL_31:
  result = *(double *)buf;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)buf;
  *(_QWORD *)(a3 + 24) = v30;
  return result;
}

void sub_23A113B50(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_reset_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int uint64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    uint64 = xpc_dictionary_get_uint64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (uint64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_generateDiagnostics_response_helper(v6, uint64);
      v7 = wpantund_status_to_cstr(uint64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Reset command success.\n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A113E04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_reset_interface_helper@<D0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X8>)
{
  NSObject *v6;
  const char *v7;
  double result;
  uint8_t buf[16];
  uint64_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t object;
  char __str[256];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v17 = xpc_string_create("org.wpantund.v1");
  if (!v17)
    v17 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v17, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v17);
  v17 = 0;
  v15 = xpc_string_create(__str);
  if (!v15)
    v15 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "path";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v15, &v16);
  xpc_release(v16);
  v16 = 0;
  xpc_release(v15);
  v15 = 0;
  if (*a2)
  {
    v11 = xpc_string_create("HardReset");
    if (!v11)
      v11 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "method";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v11, &v12);
    xpc_release(v12);
    v12 = 0;
    xpc_release(v11);
    v11 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "WPANCTL: Hard Resetting NCP. . .\n";
LABEL_14:
      _os_log_impl(&dword_23A0F8000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
    }
  }
  else
  {
    v13 = xpc_string_create("Reset");
    if (!v13)
      v13 = xpc_null_create();
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = "method";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v13, &v14);
    xpc_release(v14);
    v14 = 0;
    xpc_release(v13);
    v13 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "WPANCTL: Resetting NCP. . .\n";
      goto LABEL_14;
    }
  }
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
  result = *(double *)buf;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)buf;
  *(_QWORD *)(a3 + 24) = v10;
  return result;
}

void sub_23A114084(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_stopPairing_response_helper(uint64_t a1, xpc_object_t *a2)
{
  unsigned int int64;
  const char *string;
  uint64_t v6;
  char *v7;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(*a2, "ret");
    string = xpc_dictionary_get_string(*a2, "method");
    if (int64)
    {
      v6 = (uint64_t)string;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_stopPairing_response_helper(v6, int64);
      v7 = wpantund_status_to_cstr(int64);
      std::string::basic_string[abi:ne180100]<0>(&__p, v7);
      *(_DWORD *)a1 = 3;
      std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      memset(&__p, 0, sizeof(__p));
      *(_DWORD *)a1 = 0;
      std::string::operator=((std::string *)(a1 + 8), &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully stopped pairing... \n", (uint8_t *)&__p, 2u);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    *(_DWORD *)a1 = 11;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
  }
}

void sub_23A114298(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_stopPairing_interface_helper@<D0>(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v5;
  uint64_t v6;
  xpc_object_t object;
  xpc_object_t v8;

  object = xpc_string_create("stopPairing");
  if (!object)
    object = xpc_null_create();
  *(_QWORD *)&v5 = a1;
  *((_QWORD *)&v5 + 1) = "method";
  xpc::dict::object_proxy::operator=((uint64_t)&v5, &object, &v8);
  xpc_release(v8);
  v8 = 0;
  xpc_release(object);
  object = 0;
  xpc_dictionary_set_string(*a1, "property_name", "stopPairing");
  std::string::basic_string[abi:ne180100]<0>(&v5, (char *)&unk_23A11B5CA);
  *(_DWORD *)a2 = 0;
  result = *(double *)&v5;
  *(_OWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

void CtrXpcClient_setprop_response_helper(uint64_t a1, xpc_object_t *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int int64;
  const char *string;
  const char *v15;
  char *v16;
  std::string::size_type v17;
  std::string __p;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      CtrXpcClient_setprop_response_helper(v4, v5, v6, v7, v8, v9, v10, v11);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v12 = 11;
LABEL_9:
    *(_DWORD *)a1 = v12;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  v15 = xpc_dictionary_get_string(*a2, "property_name");
  if (int64)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper((uint64_t)string, int64);
    v16 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v16);
    v12 = 3;
    goto LABEL_9;
  }
  v17 = (std::string::size_type)v15;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v17;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sucessfully set the property - \"%s\" \n", (uint8_t *)&__p, 0xCu);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A11451C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *CtrXpcClient_setprop_interface_helper@<X0>(xpc_object_t *a1@<X0>, const char **a2@<X1>, uint64_t a3@<X8>)
{
  const char *v4;
  const char *v5;
  BOOL v6;
  xpc_object_t value;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *result;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t object;
  char __str[16];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a2[1];
  if (v4 && ((v5 = *a2, *v4) ? (v6 = v5 == 0) : (v6 = 1), !v6 && *v5))
  {
    snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
    v30 = xpc_string_create("org.wpantund.v1");
    if (!v30)
      v30 = xpc_null_create();
    *(_QWORD *)&v22 = a1;
    *((_QWORD *)&v22 + 1) = "interface";
    xpc::dict::object_proxy::operator=((uint64_t)&v22, &v30, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v30);
    v30 = 0;
    v28 = xpc_string_create(__str);
    if (!v28)
      v28 = xpc_null_create();
    *(_QWORD *)&v22 = a1;
    *((_QWORD *)&v22 + 1) = "path";
    xpc::dict::object_proxy::operator=((uint64_t)&v22, &v28, &v29);
    xpc_release(v29);
    v29 = 0;
    xpc_release(v28);
    v28 = 0;
    v26 = xpc_string_create("PropSet");
    if (!v26)
      v26 = xpc_null_create();
    *(_QWORD *)&v22 = a1;
    *((_QWORD *)&v22 + 1) = "method";
    xpc::dict::object_proxy::operator=((uint64_t)&v22, &v26, &v27);
    xpc_release(v27);
    v27 = 0;
    xpc_release(v26);
    v26 = 0;
    xpc_dictionary_set_string(*a1, "property_name", v5);
    v24 = xpc_string_create(v4);
    if (!v24)
      v24 = xpc_null_create();
    *(_QWORD *)&v22 = a1;
    *((_QWORD *)&v22 + 1) = "property_value";
    xpc::dict::object_proxy::operator=((uint64_t)&v22, &v24, &v25);
    xpc_release(v25);
    v25 = 0;
    xpc_release(v24);
    v24 = 0;
    value = xpc_dictionary_get_value(*a1, "property_value");
    v9 = MEMORY[0x23B841948](value);
    v10 = *a1;
    if (v9 == MEMORY[0x24BDACFF0])
    {
      xpc_dictionary_set_uint64(v10, "property_type", 0);
    }
    else
    {
      v11 = xpc_dictionary_get_value(v10, "property_value");
      if (MEMORY[0x23B841948](v11) == MEMORY[0x24BDACF90])
      {
        xpc_dictionary_set_uint64(*a1, "property_type", 1uLL);
      }
      else
      {
        v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v12)
          CtrXpcClient_setprop_interface_helper(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    result = std::string::basic_string[abi:ne180100]<0>(&v22, (char *)&unk_23A11B5CA);
    *(_DWORD *)a3 = 0;
    *(_OWORD *)(a3 + 8) = v22;
    v21 = v23;
  }
  else
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "No inputs were given");
    *(_DWORD *)a3 = 9;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)__str;
    v21 = v33;
  }
  *(_QWORD *)(a3 + 24) = v21;
  return result;
}

void sub_23A114818(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

_QWORD *CtrXpcClient_send_data_interface_helper@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const char *v4;
  uint64_t v5;
  BOOL v6;
  const void *v8;
  xpc_object_t value;
  uint64_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *result;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t object;
  char __str[16];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = *(const char **)a2;
  v5 = *(_QWORD *)(a2 + 16);
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6 || !*v4)
  {
    result = std::string::basic_string[abi:ne180100]<0>(__str, "No inputs were given");
    *(_DWORD *)a3 = 9;
    *(_OWORD *)(a3 + 8) = *(_OWORD *)__str;
    v22 = v32;
  }
  else
  {
    v8 = *(const void **)(a2 + 8);
    snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
    v29 = xpc_string_create("org.wpantund.v1");
    if (!v29)
      v29 = xpc_null_create();
    *(_QWORD *)&v23 = a1;
    *((_QWORD *)&v23 + 1) = "interface";
    xpc::dict::object_proxy::operator=((uint64_t)&v23, &v29, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v29);
    v29 = 0;
    v27 = xpc_string_create(__str);
    if (!v27)
      v27 = xpc_null_create();
    *(_QWORD *)&v23 = a1;
    *((_QWORD *)&v23 + 1) = "path";
    xpc::dict::object_proxy::operator=((uint64_t)&v23, &v27, &v28);
    xpc_release(v28);
    v28 = 0;
    xpc_release(v27);
    v27 = 0;
    v25 = xpc_string_create("PropSet");
    if (!v25)
      v25 = xpc_null_create();
    *(_QWORD *)&v23 = a1;
    *((_QWORD *)&v23 + 1) = "method";
    xpc::dict::object_proxy::operator=((uint64_t)&v23, &v25, &v26);
    xpc_release(v26);
    v26 = 0;
    xpc_release(v25);
    v25 = 0;
    xpc_dictionary_set_uint64(*a1, "property_value_length", v5);
    xpc_dictionary_set_data(*a1, "property_value", v8, v5);
    xpc_dictionary_set_string(*a1, "property_name", v4);
    value = xpc_dictionary_get_value(*a1, "property_value");
    v10 = MEMORY[0x23B841948](value);
    v11 = *a1;
    if (v10 == MEMORY[0x24BDACFF0])
    {
      xpc_dictionary_set_uint64(v11, "property_type", 0);
    }
    else
    {
      v12 = xpc_dictionary_get_value(v11, "property_value");
      if (MEMORY[0x23B841948](v12) == MEMORY[0x24BDACF90])
      {
        xpc_dictionary_set_uint64(*a1, "property_type", 1uLL);
      }
      else
      {
        v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v13)
          CtrXpcClient_setprop_interface_helper(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    result = std::string::basic_string[abi:ne180100]<0>(&v23, (char *)&unk_23A11B5CA);
    *(_DWORD *)a3 = 0;
    *(_OWORD *)(a3 + 8) = v23;
    v22 = v24;
  }
  *(_QWORD *)(a3 + 24) = v22;
  return result;
}

void sub_23A114B50(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_attachToNetwork_response_helper(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int int64;
  const char *string;
  uint64_t v9;
  char *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  std::string *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t object;
  xpc_object_t v23;
  std::string __p;
  __int128 buf;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23B841948](*a2);
  v5 = MEMORY[0x24BDACFA0];
  if (v4 != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v6 = 11;
LABEL_9:
    *(_DWORD *)a1 = v6;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    return;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v9 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_generateDiagnostics_response_helper(v9, int64);
    v10 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v10);
    v6 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Sucessfully Attached to the Network \n", (uint8_t *)&__p, 2u);
  }
  v11 = xpc_dictionary_create(0, 0, 0);
  v12 = v11;
  if (v11)
  {
    v23 = v11;
  }
  else
  {
    v12 = xpc_null_create();
    v23 = v12;
    if (!v12)
    {
      v13 = xpc_null_create();
      v12 = 0;
      goto LABEL_20;
    }
  }
  if (MEMORY[0x23B841948](v12) != v5)
  {
    v13 = xpc_null_create();
LABEL_20:
    v23 = v13;
    goto LABEL_21;
  }
  xpc_retain(v12);
LABEL_21:
  xpc_release(v12);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"channel";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "channel";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &object);
  xpc_release(object);
  object = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"panid";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "panid";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v21);
  xpc_release(v21);
  v21 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"networkName";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "networkName";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v20);
  xpc_release(v20);
  v20 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"xpanid";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "xpanid";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v19);
  xpc_release(v19);
  v19 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"masterKey";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "masterKey";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v18);
  xpc_release(v18);
  v18 = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"PSKc";
  *(_QWORD *)&buf = &v23;
  *((_QWORD *)&buf + 1) = "PSKc";
  xpc::dict::object_proxy::operator=((uint64_t)&buf, (uint64_t)&__p, &v17);
  xpc_release(v17);
  v17 = 0;
  v15 = v23;
  if (v23)
    xpc_retain(v23);
  else
    v15 = xpc_null_create();
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)"PropVal";
  xpc::dict::object_proxy::operator=((uint64_t)&__p, &v15, &v16);
  xpc_release(v16);
  v16 = 0;
  xpc_release(v15);
  v15 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    xpc::dict::to_debug_string((xpc::dict *)a2, &__p);
    v14 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Response is: %s \n", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  xpc_release(v23);
}

void sub_23A114FA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_attachToNetwork_interface_helper@<D0>(xpc_object_t *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v4;
  uint64_t v5;
  const char *v6;
  double result;
  xpc_object_t v9;
  xpc_object_t object;
  uint8_t v11[4];
  uint8_t *v12;
  uint8_t buf[16];
  uint64_t v14;
  __int128 v15;
  uint64_t value[2];
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2[1];
  v15 = *a2;
  *(_OWORD *)value = v4;
  v17 = a2[2];
  v5 = WORD1(v4);
  if ((unsigned __int16)(WORD1(v4) - 11) >= 0xFu)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_attachToNetwork_interface_helper(v5);
    std::string::basic_string[abi:ne180100]<0>(buf, "Invalid Channel number provided");
    goto LABEL_29;
  }
  v6 = (const char *)v15;
  if (!(_QWORD)v15)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "Network Name not Given");
LABEL_29:
    *(_DWORD *)a3 = 10;
    goto LABEL_30;
  }
  if (!*((_QWORD *)&v15 + 1))
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "Output pointer is not given");
    goto LABEL_29;
  }
  v9 = xpc_string_create("attachToNetwork");
  if (!v9)
    v9 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "method";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v9, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v9);
  v9 = 0;
  xpc_dictionary_set_string(*a1, "property_name", "attachToNetwork");
  xpc_dictionary_set_uint64(*a1, "channel", v5);
  xpc_dictionary_set_string(*a1, "network_name", v6);
  xpc_dictionary_set_uint64(*a1, "panid", WORD2(value[0]));
  xpc_dictionary_set_uint64(*a1, "xpanid", value[1]);
  if (BYTE1(value[0]))
    xpc_dictionary_set_data(*a1, "network_key", &v17, 0x10uLL);
  xpc_dictionary_set_BOOL(*a1, "clearThreadCredentials", value[0]);
  xpc_dictionary_set_BOOL(*a1, "hasNetworkKey", SBYTE1(value[0]));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Attaching to WPAN with properties", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "name:%s", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = WORD1(value[0]);
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "channel:%u", buf, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = WORD2(value[0]);
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "panid:0x%04X", buf, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = value[1];
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "xpanid:0x%016llX", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = BYTE1(value[0]);
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "has network key: (BOOLean : [%u])", buf, 8u);
  }
  if (BYTE1(value[0]))
  {
    encode_data_into_string((unint64_t)&v17, 16, buf, 0x24uLL, 0);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v11 = 136315138;
      v12 = buf;
      _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "key:[%s]", v11, 0xCu);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
LABEL_30:
  result = *(double *)buf;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)buf;
  *(_QWORD *)(a3 + 24) = v14;
  return result;
}

void sub_23A11546C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void CtrXpcClient_config_gateway_response_helper(uint64_t a1, xpc_object_t *a2)
{
  int v4;
  unsigned int int64;
  const char *string;
  uint64_t v7;
  char *v8;
  std::string __p;

  if (MEMORY[0x23B841948](*a2) != MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_startFWUpdate_response_helper();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Reply is not a dictionary");
    v4 = 11;
LABEL_9:
    *(_DWORD *)a1 = v4;
    std::string::operator=[abi:ne180100](a1 + 8, (__int128 *)&__p);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(*a2, "ret");
  string = xpc_dictionary_get_string(*a2, "method");
  if (int64)
  {
    v7 = (uint64_t)string;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_config_gateway_response_helper(v7, int64);
    v8 = wpantund_status_to_cstr(int64);
    std::string::basic_string[abi:ne180100]<0>(&__p, v8);
    v4 = 3;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Gateway configured.\n", (uint8_t *)&__p, 2u);
  }
  memset(&__p, 0, sizeof(__p));
  *(_DWORD *)a1 = 0;
  std::string::operator=((std::string *)(a1 + 8), &__p);
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_23A1155F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CtrXpcClient_config_gateway_interface_helper@<D0>(xpc_object_t *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double result;
  uint64_t value;
  int v30;
  int v31;
  int v32;
  xpc_object_t v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t object;
  uint8_t buf[16];
  uint64_t v40;
  char __str[256];
  _QWORD bytes[2];
  char v43[2];
  __int128 v44;
  _BYTE v45[28];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  v6 = *((__int16 *)a2 + 1);
  v8 = *((unsigned int *)a2 + 1);
  v7 = *((unsigned int *)a2 + 2);
  v9 = a2[12];
  v10 = a2[13];
  v11 = a2[14];
  v12 = (char *)*((_QWORD *)a2 + 2);
  v31 = a2[25];
  v32 = a2[24];
  value = *((unsigned __int16 *)a2 + 13);
  v30 = a2[28];
  memset(v45, 0, sizeof(v45));
  v44 = 0u;
  *(_WORD *)v43 = 14906;
  bytes[0] = 0;
  bytes[1] = 0;
  snprintf(__str, 0x100uLL, "%s/%s", "/org/wpantund", gInterfaceName);
  v37 = xpc_string_create("org.wpantund.v1");
  if (!v37)
    v37 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "interface";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v37, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v37);
  v37 = 0;
  v35 = xpc_string_create(__str);
  if (!v35)
    v35 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "path";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v35, &v36);
  xpc_release(v36);
  v36 = 0;
  xpc_release(v35);
  v35 = 0;
  v33 = xpc_string_create("ConfigGateway");
  if (!v33)
    v33 = xpc_null_create();
  *(_QWORD *)buf = a1;
  *(_QWORD *)&buf[8] = "method";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v33, &v34);
  xpc_release(v34);
  v34 = 0;
  xpc_release(v33);
  v33 = 0;
  xpc_dictionary_set_BOOL(*a1, "defaultRoute", v5 != 0);
  if (!v12)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "Prefix is not given");
LABEL_25:
    *(_DWORD *)a3 = 10;
    goto LABEL_26;
  }
  if (strchr(v12, 58))
  {
    v13 = inet_pton(30, v12, bytes);
    if (v13 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_config_gateway_interface_helper();
      goto LABEL_24;
    }
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CtrXpcClient_config_gateway_interface_helper((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
LABEL_24:
      std::string::basic_string[abi:ne180100]<0>(buf, "Bad Prefix");
      goto LABEL_25;
    }
  }
  else if ((int)parse_string_into_data(bytes, 8, v12) <= 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CtrXpcClient_config_gateway_interface_helper((uint64_t)v12, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_24;
  }
  inet_ntop(30, bytes, v43, 0x2Eu);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v43;
    _os_log_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Using prefix \"%s\"\n", buf, 0xCu);
  }
  xpc_dictionary_set_int64(*a1, "prefix_length", 16);
  xpc_dictionary_set_data(*a1, "prefix", bytes, 0x10uLL);
  xpc_dictionary_set_uint64(*a1, "preferredLifetime", v8);
  xpc_dictionary_set_uint64(*a1, "validLifetime", v7);
  xpc_dictionary_set_BOOL(*a1, "preferred", v9 != 0);
  xpc_dictionary_set_BOOL(*a1, "slaac", v10 != 0);
  xpc_dictionary_set_BOOL(*a1, "onMesh", v11 != 0);
  xpc_dictionary_set_uint64(*a1, "priority", v6);
  xpc_dictionary_set_BOOL(*a1, "dhcp", v32 != 0);
  xpc_dictionary_set_BOOL(*a1, "configure", v31 != 0);
  xpc_dictionary_set_BOOL(*a1, "stable", v30 != 0);
  xpc_dictionary_set_uint64(*a1, "prefix_len_in_bits", value);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)&unk_23A11B5CA);
  *(_DWORD *)a3 = 0;
LABEL_26:
  result = *(double *)buf;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)buf;
  *(_QWORD *)(a3 + 24) = v40;
  return result;
}

void sub_23A115A94(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void CtrXpcClient_startFWUpdate_response_helper(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  unsigned int v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 2080;
  v7 = wpantund_status_to_cstr(a2);
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s failed to start FW update with error %d. %s\n", (uint8_t *)&v2, 0x1Cu);
}

void CtrXpcClient_startFWUpdate_response_helper()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Reply is not a dictionary \n", v0, 2u);
}

void CtrXpcClient_generateDiagnostics_response_helper(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  unsigned int v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 2080;
  v7 = wpantund_status_to_cstr(a2);
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s failed with error %d. %s\n", (uint8_t *)&v2, 0x1Cu);
}

void CtrXpcClient_SetChannel_interface_helper(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to set channel %d Channel value is not in valid range", (uint8_t *)v1, 8u);
}

void CtrXpcClient_join_response_helper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Partial (insecure) join. Credentials needed. Update key to continue.", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Reply is not a dictionary \n", a5, a6, a7, a8, 0);
}

void CtrXpcClient_stopFWUpdate_response_helper(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  unsigned int v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 2080;
  v7 = wpantund_status_to_cstr(a2);
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s failed to stop FW update with error %d. %s\n", (uint8_t *)&v2, 0x1Cu);
}

void CtrXpcClient_provideExtendedMACAddress_response_helper(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  unsigned int v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 2080;
  v7 = wpantund_status_to_cstr(a2);
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s failed to attach with error %d. %s\n", (uint8_t *)&v2, 0x1Cu);
}

void CtrXpcClient_captureTriggerData_response_helper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "getTriggerData response is a dictionary \n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "getTriggerData response is not a dictionary \n", a5, a6, a7, a8, 0);
}

void CtrXPC::Client::State::create(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Could not create CtrXPCClient, verify parameters\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void CtrXPC::Client::processStatsDataPerAccessory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Client::processStatsDataPerAccessory Reply is not a dictionary.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void CtrXPC::Client::processStatsData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Client::processStatsData Reply is not a dictionary.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ___ZN6CtrXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_73_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1();
  *(_DWORD *)v1 = 136315138;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_3(&dword_23A0F8000, MEMORY[0x24BDACB70], v3, "Failure: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
}

void ___ZN6CtrXPC6Client5State4initEv_block_invoke_cold_1()
{
  __assert_rtn("init_block_invoke", "CtrXPCClient.cpp", 184, "fNotificationName");
}

void ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1();
  *(_DWORD *)v1 = 136315138;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_3(&dword_23A0F8000, MEMORY[0x24BDACB70], v3, "Reply not sent for: %s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
}

void ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke_cold_2(uint8_t *buf, int a2, int a3)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Server connection pid:%d is not same as reply connection pid:%d. Server possibly getting destroyed", buf, 0xEu);
}

void ___ZN6CtrXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "getServer_sync failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void CtrXPC::Command::getName()
{
  __assert_rtn("getName", "ClientCommand.cpp", 77, "success");
}

void CtrXpcClient_startPairing_response_helper(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  unsigned int v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 2080;
  v7 = wpantund_status_to_cstr(a2);
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s failed to start pairing with error %d. %s\n", (uint8_t *)&v2, 0x1Cu);
}

void checkEntitlementForMachMsg(xpc::dict *a1, uint64_t *a2)
{
  void **v3;
  void *__p[2];
  char v5;
  uint8_t buf[4];
  void **v7;
  __int16 v8;
  uint64_t *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  xpc::dict::to_debug_string(a1, __p);
  if (v5 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  if (*((char *)a2 + 23) < 0)
    a2 = (uint64_t *)*a2;
  *(_DWORD *)buf = 136315394;
  v7 = v3;
  v8 = 2080;
  v9 = a2;
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Connection \"%s\" not allowed for: %s \n", buf, 0x16u);
  if (v5 < 0)
    operator delete(__p[0]);
}

void _GLOBAL__sub_I_CoreThreadRadio_Entitlements_cpp_cold_1(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(char *)(a1 - 1) < 0)
      operator delete(*(void **)(a1 - 24));
    if (*(char *)(a1 - 25) < 0)
      operator delete(*(void **)(a1 - 48));
    a1 -= 48;
  }
  while (a1 != a2);
}

void parse_basic_type_from_xpc_msg(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "CtrXPCClient GetCmd Helper: Not handled V Type = %llu \n", (uint8_t *)&v1, 0xCu);
}

void CtrXpcClient_getprop_response_helper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "WPANCTL error: Bad type for interface list \n", a5, a6, a7, a8, 0);
}

void CtrXpcClient_stopPairing_response_helper(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  unsigned int v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 2080;
  v7 = wpantund_status_to_cstr(a2);
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s failed to stop pairing with error %d. %s\n", (uint8_t *)&v2, 0x1Cu);
}

void CtrXpcClient_setprop_response_helper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Reply is not a dictionary \n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void CtrXpcClient_setprop_interface_helper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Set Property: Property type is neither String nor Data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void CtrXpcClient_attachToNetwork_interface_helper(unsigned __int16 a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_23A0F8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to set channel %d Channel value is not in valid range", (uint8_t *)v1, 8u);
}

void CtrXpcClient_config_gateway_response_helper(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  wpantund_status_to_cstr(a2);
  OUTLINED_FUNCTION_0_1(&dword_23A0F8000, MEMORY[0x24BDACB70], v2, "%s failed with error %d. %s\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2_1();
}

void CtrXpcClient_config_gateway_interface_helper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23A0F8000, MEMORY[0x24BDACB70], a3, "Bad prefix \"%s\"\n", a5, a6, a7, a8, 2u);
}

void CtrXpcClient_config_gateway_interface_helper()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1(&dword_23A0F8000, MEMORY[0x24BDACB70], v1, "Bad Prefix \"%s\", errno=%d (%s)\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x24BED9A90]();
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x24BED9CD0]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x24BED9CD8]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
  MEMORY[0x24BED9CE0](this);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return MEMORY[0x24BED9D68](this, a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D70]();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2)
{
  return MEMORY[0x24BED9D80](this, a2);
}

{
  return MEMORY[0x24BED9D90](this, a2);
}

{
  return MEMORY[0x24BED9DA8](this, a2);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x24BED9ED0](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDACE0](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_250B1FBD0(__p);
}

uint64_t operator delete()
{
  return off_250B1FBD8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250B1FBE0(__sz);
}

uint64_t operator new()
{
  return off_250B1FBE8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x24BDAFED8](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x24BDAFFF0](__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_get_array(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB0650](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB0670](xarray, index);
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0680](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0690](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x24BDB09E8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0BD8](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

