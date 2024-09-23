uint64_t TestCommConfig::castBaudRateToEnum(TestCommConfig *this)
{
  if ((int)this > 2399999)
  {
    if ((int)this > 3199999)
    {
      if ((_DWORD)this == 3200000)
        return 6;
      if ((_DWORD)this == 4800000)
        return 7;
    }
    else
    {
      if ((_DWORD)this == 2400000)
        return 4;
      if ((_DWORD)this == 3000000)
        return 5;
    }
    return 2;
  }
  if ((_DWORD)this == 9600)
    return 0;
  if ((_DWORD)this != 921600)
  {
    if ((_DWORD)this == 1000000)
      return 3;
    return 2;
  }
  return 1;
}

uint64_t convertToHardwareEnum(char *a1)
{
  char *v2;
  uint64_t v3;
  char **v4;
  _BYTE *v5;
  char **v6;
  char *v7;
  char **v8;
  BOOL v9;
  char **v10;
  char ***v11;
  char **v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  std::string *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _BYTE *v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char **v33;
  char **v34;
  char *v35;
  _BOOL4 v36;
  char *v37;
  char *v38;
  NSObject *v39;
  _QWORD *v40;
  int v41;
  uint64_t v42;
  char *__s;
  char **v45;
  char *v46;
  uint64_t v47;
  _BYTE __p[12];
  __int16 v49;
  int v50;
  char v51;
  _DWORD v52[2];
  uint64_t v53[3];
  int v54;
  uint64_t v55[3];
  int v56;
  uint64_t v57[3];
  int v58;
  uint64_t v59[3];
  int v60;
  uint64_t v61[3];
  int v62;
  uint64_t v63[3];
  int v64;
  uint64_t v65[3];
  int v66;
  uint64_t v67[3];
  int v68;
  uint64_t v69[3];
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(__p, "2");
  v52[0] = 10401;
  std::string::basic_string[abi:ne180100]<0>(v53, "fire3");
  v54 = 10401;
  std::string::basic_string[abi:ne180100]<0>(v55, "5");
  v56 = 10606;
  std::string::basic_string[abi:ne180100]<0>(v57, "fire6");
  v58 = 10606;
  std::string::basic_string[abi:ne180100]<0>(v59, "6");
  v60 = 10618;
  std::string::basic_string[abi:ne180100]<0>(v61, "fire7");
  v62 = 10618;
  std::string::basic_string[abi:ne180100]<0>(v63, "3");
  v64 = 21102;
  std::string::basic_string[abi:ne180100]<0>(v65, "ice18");
  v66 = 21102;
  std::string::basic_string[abi:ne180100]<0>(v67, "4");
  __s = a1;
  v68 = 21203;
  std::string::basic_string[abi:ne180100]<0>(v69, "ice19");
  v2 = 0;
  v3 = 0;
  v70 = 21203;
  v46 = 0;
  v47 = 0;
  v45 = &v46;
  v4 = &v46;
  while (1)
  {
    v5 = &__p[32 * v3];
    v6 = &v46;
    if (v4 == &v46)
      goto LABEL_8;
    v7 = v2;
    v8 = &v46;
    if (v2)
    {
      do
      {
        v6 = (char **)v7;
        v7 = (char *)*((_QWORD *)v7 + 1);
      }
      while (v7);
    }
    else
    {
      do
      {
        v6 = (char **)v8[2];
        v9 = *v6 == (char *)v8;
        v8 = v6;
      }
      while (v9);
    }
    if (std::less<std::string>::operator()[abi:ne180100](v6 + 4, &__p[32 * v3]))
    {
LABEL_8:
      if (v2)
        v10 = v6;
      else
        v10 = &v46;
      if (v2)
        v11 = (char ***)v6;
      else
        v11 = &v45;
      if (v2)
        v12 = v6 + 1;
      else
        v12 = &v46;
      if (v11[1])
        goto LABEL_60;
LABEL_27:
      v15 = (char *)operator new(0x40uLL);
      v16 = (std::string *)(v15 + 32);
      if ((char)v5[23] < 0)
      {
        std::string::__init_copy_ctor_external(v16, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
      }
      else
      {
        *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)v5;
        *((_QWORD *)v15 + 6) = *((_QWORD *)v5 + 2);
      }
      *((_DWORD *)v15 + 14) = v52[8 * v3];
      *(_QWORD *)v15 = 0;
      *((_QWORD *)v15 + 1) = 0;
      *((_QWORD *)v15 + 2) = v10;
      *v12 = v15;
      if (*v45)
      {
        v45 = (char **)*v45;
        v15 = *v12;
      }
      v17 = v46;
      v9 = v15 == v46;
      v15[24] = v15 == v46;
      if (!v9)
      {
        do
        {
          v18 = *((_QWORD *)v15 + 2);
          if (*(_BYTE *)(v18 + 24))
            break;
          v19 = *(char **)(v18 + 16);
          v20 = *(_QWORD *)v19;
          if (*(_QWORD *)v19 == v18)
          {
            v23 = *((_QWORD *)v19 + 1);
            if (!v23 || (v24 = *(unsigned __int8 *)(v23 + 24), v21 = (_BYTE *)(v23 + 24), v24))
            {
              if (*(char **)v18 == v15)
              {
                v25 = (uint64_t *)*((_QWORD *)v15 + 2);
              }
              else
              {
                v25 = *(uint64_t **)(v18 + 8);
                v26 = *v25;
                *(_QWORD *)(v18 + 8) = *v25;
                if (v26)
                {
                  *(_QWORD *)(v26 + 16) = v18;
                  v19 = *(char **)(v18 + 16);
                }
                v25[2] = (uint64_t)v19;
                *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v25;
                *v25 = v18;
                *(_QWORD *)(v18 + 16) = v25;
                v19 = (char *)v25[2];
                v18 = *(_QWORD *)v19;
              }
              *((_BYTE *)v25 + 24) = 1;
              v19[24] = 0;
              v29 = *(_QWORD *)(v18 + 8);
              *(_QWORD *)v19 = v29;
              if (v29)
                *(_QWORD *)(v29 + 16) = v19;
              *(_QWORD *)(v18 + 16) = *((_QWORD *)v19 + 2);
              *(_QWORD *)(*((_QWORD *)v19 + 2) + 8 * (**((_QWORD **)v19 + 2) != (_QWORD)v19)) = v18;
              *(_QWORD *)(v18 + 8) = v19;
              goto LABEL_58;
            }
          }
          else if (!v20 || (v22 = *(unsigned __int8 *)(v20 + 24), v21 = (_BYTE *)(v20 + 24), v22))
          {
            if (*(char **)v18 == v15)
            {
              v27 = *((_QWORD *)v15 + 1);
              *(_QWORD *)v18 = v27;
              if (v27)
              {
                *(_QWORD *)(v27 + 16) = v18;
                v19 = *(char **)(v18 + 16);
              }
              *((_QWORD *)v15 + 2) = v19;
              *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v15;
              *((_QWORD *)v15 + 1) = v18;
              *(_QWORD *)(v18 + 16) = v15;
              v19 = (char *)*((_QWORD *)v15 + 2);
            }
            else
            {
              v15 = (char *)*((_QWORD *)v15 + 2);
            }
            v15[24] = 1;
            v19[24] = 0;
            v18 = *((_QWORD *)v19 + 1);
            v28 = *(char **)v18;
            *((_QWORD *)v19 + 1) = *(_QWORD *)v18;
            if (v28)
              *((_QWORD *)v28 + 2) = v19;
            *(_QWORD *)(v18 + 16) = *((_QWORD *)v19 + 2);
            *(_QWORD *)(*((_QWORD *)v19 + 2) + 8 * (**((_QWORD **)v19 + 2) != (_QWORD)v19)) = v18;
            *(_QWORD *)v18 = v19;
LABEL_58:
            *((_QWORD *)v19 + 2) = v18;
            break;
          }
          *(_BYTE *)(v18 + 24) = 1;
          v15 = v19;
          v19[24] = v19 == v17;
          *v21 = 1;
        }
        while (v19 != v17);
      }
      ++v47;
      goto LABEL_60;
    }
    v12 = &v46;
    v10 = &v46;
    if (!v2)
      goto LABEL_27;
    v13 = v2;
    while (1)
    {
      while (1)
      {
        v10 = (char **)v13;
        v14 = v13 + 32;
        if (!std::less<std::string>::operator()[abi:ne180100](&__p[32 * v3], (_QWORD *)v13 + 4))
          break;
        v13 = *v10;
        v12 = v10;
        if (!*v10)
          goto LABEL_27;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v14, &__p[32 * v3]))
        break;
      v13 = v10[1];
      if (!v13)
      {
        v12 = v10 + 1;
        goto LABEL_27;
      }
    }
LABEL_60:
    if (++v3 == 10)
      break;
    v4 = v45;
    v2 = v46;
  }
  v30 = 40;
  v31 = __s;
  do
  {
    if (*((char *)&v46 + v30 * 8 + 7) < 0)
      operator delete((&__s)[v30]);
    v30 -= 4;
  }
  while (v30 * 8);
  std::string::basic_string[abi:ne180100]<0>(__p, v31);
  v32 = v46;
  if (!v46)
    goto LABEL_76;
  v33 = &v46;
  do
  {
    v34 = v33;
    v35 = v32 + 32;
    v36 = std::less<std::string>::operator()[abi:ne180100]((_QWORD *)v32 + 4, __p);
    v37 = v32 + 8;
    if (!v36)
    {
      v37 = v32;
      v33 = (char **)v32;
    }
    v32 = *(char **)v37;
  }
  while (*(_QWORD *)v37);
  if (v33 == &v46
    || (!v36 ? (v38 = v35) : (v38 = (char *)(v34 + 4)), std::less<std::string>::operator()[abi:ne180100](__p, v38)))
  {
LABEL_76:
    v33 = &v46;
  }
  if (v51 < 0)
    operator delete(*(void **)__p);
  v39 = GpsdLogObjectGeneral;
  if (&v46 == v33)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315138;
      *(_QWORD *)&__p[4] = v31;
      _os_log_error_impl(&dword_2293C9000, v39, OS_LOG_TYPE_ERROR, "Failed to convert hardware type %s to hardware enum", __p, 0xCu);
    }
    v42 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v33 + 4;
      if (*((char *)v33 + 55) < 0)
        v40 = (_QWORD *)*v40;
      v41 = *((_DWORD *)v33 + 14);
      *(_DWORD *)__p = 136315394;
      *(_QWORD *)&__p[4] = v40;
      v49 = 1024;
      v50 = v41;
      _os_log_impl(&dword_2293C9000, v39, OS_LOG_TYPE_DEFAULT, "Converted hardware type %s to hardware enum %d", __p, 0x12u);
    }
    v42 = *((unsigned int *)v33 + 14);
  }
  std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(v46);
  return v42;
}

void sub_2293CAF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char *a11)
{
  std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(a11);
  _Unwind_Resume(a1);
}

void GpsFactoryTest::GpsFactoryTest(GpsFactoryTest *this, const GpsFactoryTest::Options *a2)
{
  std::string *v3;
  id *v4;
  dispatch_qos_class_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = GpsFactoryTest::Options::Options((std::string *)this, a2);
  *(_OWORD *)&v3[9].__r_.__value_.__r.__words[1] = xmmword_2293F5A60;
  v3[18].__r_.__value_.__r.__words[0] = 850045863;
  *(_OWORD *)&v3[10].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[10].__r_.__value_.__r.__words[2] = 0u;
  v3[11].__r_.__value_.__l.__size_ = 0;
  v3[11].__r_.__value_.__r.__words[2] = 850045863;
  v3[14].__r_.__value_.__r.__words[2] = 0;
  *(_OWORD *)&v3[12].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[12].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v3[13].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)((char *)&v3[13].__r_.__value_.__r.__words[2] + 1) = 0u;
  LODWORD(v3[15].__r_.__value_.__l.__data_) = 0;
  v3[15].__r_.__value_.__s.__data_[4] = 0;
  LODWORD(v3[15].__r_.__value_.__r.__words[1]) = 0;
  *(_OWORD *)&v3[15].__r_.__value_.__r.__words[2] = xmmword_2293F5A70;
  *(_OWORD *)&v3[16].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&v3[17].__r_.__value_.__l.__data_ = 0u;
  v3[17].__r_.__value_.__r.__words[2] = 0;
  v3[33].__r_.__value_.__l.__size_ = 0;
  v3[22].__r_.__value_.__l.__size_ = 0;
  *(_OWORD *)&v3[21].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v3[21].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[20].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&v3[19].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v3[19].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[18].__r_.__value_.__r.__words[1] = 0u;
  v4 = (id *)GpsdPreferences::instance(0);
  v5 = GpsdPreferences::maxSchedulerQos(v4);
  v6 = dispatch_queue_attr_make_with_qos_class(0, v5, 0);
  if (!v6)
  {
    v7 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEFAULT, "#spi,queue,nullattr", v8, 2u);
    }
  }
  *((_QWORD *)this + 100) = dispatch_queue_create("com.apple.gpsfactorytest", v6);
}

void sub_2293CB140(_Unwind_Exception *a1)
{
  uint64_t v1;
  std::mutex *v2;
  std::mutex *v3;
  uint64_t v5;

  std::unique_ptr<VendorLogger>::reset[abi:ne180100]((VendorLogger **)(v1 + 536), 0);
  v5 = *(_QWORD *)(v1 + 528);
  *(_QWORD *)(v1 + 528) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
  if (*(char *)(v1 + 519) < 0)
    operator delete(*(void **)(v1 + 496));
  std::mutex::~mutex(v2);
  std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 384));
  std::mutex::~mutex(v3);
  std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 232));
  GpsFactoryTest::Options::~Options((void **)v1);
  _Unwind_Resume(a1);
}

void GpsFactoryTest::Options::~Options(void **this)
{
  if (*((char *)this + 223) < 0)
    operator delete(this[25]);
  if (*((char *)this + 199) < 0)
    operator delete(this[22]);
  if (*((char *)this + 167) < 0)
    operator delete(this[18]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void GpsFactoryTest::~GpsFactoryTest(GpsFactoryTest *this)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*((_QWORD *)this + 65);
  if (v2)
  {
    v3 = dlclose(v2);
    if (v3)
    {
      v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v3;
        _os_log_error_impl(&dword_2293C9000, v4, OS_LOG_TYPE_ERROR, "dlclose failed with code %d", (uint8_t *)v6, 8u);
      }
    }
  }
  std::unique_ptr<VendorLogger>::reset[abi:ne180100]((VendorLogger **)this + 67, 0);
  v5 = *((_QWORD *)this + 66);
  *((_QWORD *)this + 66) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5);
  if (*((char *)this + 519) < 0)
    operator delete(*((void **)this + 62));
  std::mutex::~mutex((std::mutex *)((char *)this + 432));
  std::condition_variable::~condition_variable((std::condition_variable *)this + 8);
  std::mutex::~mutex((std::mutex *)((char *)this + 280));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 232));
  if (*((char *)this + 223) < 0)
    operator delete(*((void **)this + 25));
  if (*((char *)this + 199) < 0)
    operator delete(*((void **)this + 22));
  if (*((char *)this + 167) < 0)
    operator delete(*((void **)this + 18));
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

void sub_2293CB38C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void GpsFactoryTest::stop(GpsFactoryTest *this)
{
  VendorLogger *v2;

  v2 = (VendorLogger *)*((_QWORD *)this + 67);
  if (v2)
    VendorLogger::flush(v2);
  atomic_store(0, (unsigned __int8 *)this + 364);
  GpsFactoryTest::BasicTimer::wakeNow((GpsFactoryTest *)((char *)this + 224));
}

void GpsFactoryTest::flushLogs(GpsFactoryTest *this)
{
  VendorLogger *v1;

  v1 = (VendorLogger *)*((_QWORD *)this + 67);
  if (v1)
    VendorLogger::flush(v1);
}

void GpsFactoryTest::BasicTimer::wakeNow(GpsFactoryTest::BasicTimer *this)
{
  std::mutex *v2;

  v2 = (std::mutex *)((char *)this + 56);
  std::mutex::lock((std::mutex *)((char *)this + 56));
  *((_BYTE *)this + 120) = 1;
  std::condition_variable::notify_all((std::condition_variable *)((char *)this + 8));
  std::mutex::unlock(v2);
}

void GpsFactoryTest::deviceInterfaceCallback(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  unint64_t v5;
  int v6;
  void **v7;
  void **v8;
  void **v9;
  void *__p[2];
  char v11;
  void *v12[2];
  char v13;
  uint8_t buf[4];
  void **v15;
  __int16 v16;
  void **v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v5 = atomic_load((unint64_t *)(a1 + 376));
    if ((v5 & 0xFF00000000) == 0)
      std::__throw_bad_optional_access[abi:ne180100]();
    GpsFactoryTest::stringify(v5, v12);
    v6 = v13;
    v7 = (void **)v12[0];
    GpsFactoryTest::stringify(a2, __p);
    v8 = v12;
    if (v6 < 0)
      v8 = v7;
    if (v11 >= 0)
      v9 = __p;
    else
      v9 = (void **)__p[0];
    *(_DWORD *)buf = 136446466;
    v15 = v8;
    v16 = 2082;
    v17 = v9;
    _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "deviceInterfaceCallback,results,curent:%{public}s,new:%{public}s", buf, 0x16u);
    if (v11 < 0)
      operator delete(__p[0]);
    if (v13 < 0)
      operator delete(v12[0]);
  }
  atomic_store(a2 | 0x100000000, (unint64_t *)(a1 + 376));
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(0, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
}

void sub_2293CB598(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *GpsFactoryTest::stringify@<X0>(unsigned int a1@<W1>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 > 8)
    v2 = "unknown";
  else
    v2 = off_24F20B0D0[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void GpsFactoryTest::mutateState(uint64_t a1, unsigned int a2)
{
  std::mutex *v4;

  v4 = (std::mutex *)(a1 + 432);
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(a2, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock(v4);
}

void GpsFactoryTest::waitForIdle(GpsFactoryTest *this)
{
  int v2;
  unsigned int v3;
  signed int v4;
  double v5;
  std::chrono::steady_clock::time_point v6;
  std::chrono::steady_clock::time_point v8;
  std::chrono::system_clock::time_point v9;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v11;
  double v13;
  double v14;
  NSObject *v15;
  _QWORD *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD *v20;
  std::unique_lock<std::mutex> __lk;
  uint8_t buf[4];
  _QWORD *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = *((_DWORD *)this + 90);
  if (v2)
  {
    if (v2 < -1500)
      return;
    v3 = (v2 + 2500) / 0x3E8u;
  }
  else
  {
    v3 = 60;
  }
  v4 = 0;
  v20 = (_QWORD *)((char *)this + 496);
  v5 = 0.0;
  do
  {
    __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 432);
    __lk.__owns_ = 1;
    std::mutex::lock((std::mutex *)((char *)this + 432));
    v6.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 1000000000;
    while (atomic_load((unsigned int *)this + 92))
    {
      if (std::chrono::steady_clock::now().__d_.__rep_ >= v6.__d_.__rep_)
        goto LABEL_23;
      v8.__d_.__rep_ = v6.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
      if (v8.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v9.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v9.__d_.__rep_)
        {
          v10 = 0;
          goto LABEL_18;
        }
        if (v9.__d_.__rep_ < 1)
        {
          if ((unint64_t)v9.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
            goto LABEL_17;
          v10 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v9.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            v10 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_18;
          }
LABEL_17:
          v10 = 1000 * v9.__d_.__rep_;
LABEL_18:
          if (v10 > (v8.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v11.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
            std::condition_variable::__do_timed_wait((std::condition_variable *)this + 8, &__lk, v11);
            std::chrono::steady_clock::now();
            goto LABEL_22;
          }
        }
        v11.__d_.__rep_ = v10 + v8.__d_.__rep_;
        goto LABEL_21;
      }
LABEL_22:
      if (std::chrono::steady_clock::now().__d_.__rep_ >= v6.__d_.__rep_)
      {
LABEL_23:
        if (atomic_load((unsigned int *)this + 92))
        {
          v13 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - *((_QWORD *)this + 28)) / 1000000000.0;
          v14 = *((double *)this + 44);
          if (v5 >= v14)
            v14 = v5;
          if (v13 > v14 + 60.0)
          {
            v15 = GpsdLogObjectGeneral;
            if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              v16 = v20;
              if (*((char *)this + 519) < 0)
                v16 = (_QWORD *)*v20;
              v17 = atomic_load((unsigned int *)this + 92);
              v18 = *((_QWORD *)this + 44);
              *(_DWORD *)buf = 136316162;
              v23 = v16;
              v24 = 1024;
              v25 = v4 + 1;
              v26 = 1024;
              v27 = v3;
              v28 = 1024;
              v29 = v17;
              v30 = 2048;
              v31 = v18;
              _os_log_impl(&dword_2293C9000, v15, OS_LOG_TYPE_DEFAULT, "[TOOL  ] Running: %s,%d/%d,state,%d,lastHeartbeat,%.1f", buf, 0x28u);
            }
            v5 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - *((_QWORD *)this + 28)) / 1000000000.0;
          }
          if (v4 >= (int)(v3 - 1))
            atomic_store(0x100000006uLL, (unint64_t *)this + 47);
          goto LABEL_36;
        }
        break;
      }
    }
    v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v19, OS_LOG_TYPE_INFO, "waitForIdle,done", buf, 2u);
    }
LABEL_36:
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);
    ++v4;
  }
  while (v4 != v3);
}

double GpsFactoryTest::BasicTimer::get(GpsFactoryTest::BasicTimer *this)
{
  return (double)(std::chrono::steady_clock::now().__d_.__rep_ - *(_QWORD *)this) / 1000000000.0;
}

double GpsFactoryTest::BasicTimer::lastHeartbeat(GpsFactoryTest::BasicTimer *this)
{
  return *((double *)this + 16);
}

void GpsFactoryTest::waitForInit(GpsFactoryTest *this)
{
  unsigned int v2;
  unsigned int v3;
  std::unique_lock<std::mutex> v4;

  v4.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 432);
  v4.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 432));
  v2 = atomic_load((unsigned int *)this + 92);
  if (v2 != 2)
  {
    do
    {
      std::condition_variable::wait((std::condition_variable *)this + 8, &v4);
      v3 = atomic_load((unsigned int *)this + 92);
    }
    while (v3 != 2);
  }
  if (v4.__owns_)
    std::mutex::unlock(v4.__m_);
}

void GpsFactoryTest::printResult(GpsFactoryTest *this, const char *a2)
{
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  NSObject *v6;
  _BYTE *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  _BYTE *v11;
  const char *v12;
  _BYTE __p[12];
  char v14;
  uint8_t buf[4];
  _BYTE *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = atomic_load((unint64_t *)this + 47);
  if ((v3 & 0xFF00000000) != 0)
    v4 = v3;
  else
    v4 = 7;
  v5 = atomic_load((unint64_t *)this + 47);
  if ((v5 & 0xFF00000000) != 0)
  {
    v6 = GpsdLogObjectGeneral;
    if (v4 == 1)
    {
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        return;
      std::string::basic_string[abi:ne180100]<0>(__p, "Success");
      if (v14 >= 0)
        v7 = __p;
      else
        v7 = *(_BYTE **)__p;
      v8 = "unknown";
      if (a2)
        v8 = a2;
      *(_DWORD *)buf = 136315394;
      v16 = v7;
      v17 = 2080;
      v18 = v8;
      _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEFAULT, "[TOOL  ] %s, %s", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        return;
      GpsFactoryTest::stringify(v4, __p);
      if (v14 >= 0)
        v11 = __p;
      else
        v11 = *(_BYTE **)__p;
      v12 = "unknown";
      if (a2)
        v12 = a2;
      *(_DWORD *)buf = 136315394;
      v16 = v11;
      v17 = 2080;
      v18 = v12;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "[TOOL  ] %s, %s", buf, 0x16u);
    }
    if (v14 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "unknown";
      if (a2)
        v10 = a2;
      *(_DWORD *)__p = 136315138;
      *(_QWORD *)&__p[4] = v10;
      _os_log_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEFAULT, "[TOOL  ] %s", __p, 0xCu);
    }
  }
}

void GpsFactoryTest::waitForIdleAndPrintResult(GpsFactoryTest *this, const char *a2)
{
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, a2);
}

void GpsFactoryTest::constructDevice(GpsFactoryTest *this)
{
  NSObject *v2;
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  const char **v6;
  const char *v7;
  NSObject *v8;
  char *v9;
  int *v10;
  uint64_t (*v11)(uint64_t *, _QWORD *);
  NSObject *v12;
  void **v13;
  int v14;
  VendorLogger *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  GnssHal::PlatformNvStore *v19;
  NSObject *v20;
  int v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  std::string *v31;
  uint64_t v32;
  unsigned int v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  std::string::value_type *v38;
  std::string::value_type v39;
  uint64_t v40;
  std::string *v41;
  std::string::size_type size;
  NSObject *v43;
  GnssHal::CommPcie *v44;
  std::string *v45;
  uint64_t v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  _QWORD *v52;
  uint64_t v53;
  id *v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t (*v58)(uint64_t *, _QWORD *);
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  NSObject *v68;
  int v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  void *v76[2];
  uint64_t v77;
  void *v78;
  char v79;
  uint64_t v80;
  void *v81[2];
  uint64_t v82;
  void *__p;
  void *v84;
  uint64_t v85;
  void *v86;
  char v87;
  uint64_t v88;
  void *v89[2];
  char v90;
  void *v91[2];
  char v92;
  void *v93[2];
  uint64_t v94;
  int v95;
  uint64_t v96;
  GnssHal::PlatformNvStore *v97;
  _QWORD *v98;
  _QWORD v99[3];
  _QWORD *v100;
  std::string v101;
  std::string *v102;
  uint64_t v103;
  _BYTE buf[32];
  _BYTE v105[10];
  __int16 v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[23];

  v109[20] = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "constructDevice";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3);
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  if (*((_QWORD *)this + 66))
  {
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "constructDevice";
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "%s, already constructed", buf, 0xCu);
    }
    return;
  }
  v5 = (void *)*((_QWORD *)this + 65);
  if (!v5)
  {
    v6 = (const char **)((char *)this + 24);
    v7 = (char *)this + 24;
    if (*((char *)this + 47) < 0)
      v7 = *v6;
    v5 = dlopen(v7, 4);
    *((_QWORD *)this + 65) = v5;
    if (!v5)
    {
      v8 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        goto LABEL_184;
      if (*((char *)this + 47) < 0)
        v6 = (const char **)*v6;
      v9 = dlerror();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_2293C9000, v8, OS_LOG_TYPE_DEFAULT, "could not dlopen %s due to %s", buf, 0x16u);
      v5 = (void *)*((_QWORD *)this + 65);
      if (!v5)
LABEL_184:
        __assert_rtn("constructDevice", "GpsFactoryTest.mm", 239, "fGnssDeviceLibraryHandle && \"Could not open dylib\"");
    }
  }
  v11 = (uint64_t (*)(uint64_t *, _QWORD *))dlsym(v5, "newGnssDeviceTest");
  if (!v11)
    __assert_rtn("constructDevice", "GpsFactoryTest.mm", 244, "newGnssDeviceTest && \"newGnssDeviceTest is null\"");
  v95 = 0;
  v93[0] = 0;
  v93[1] = 0;
  v94 = 0;
  if (!gpsd::util::getVersionNumberFromDylib(*((gpsd::util **)this + 65), &v95, v10)
    || !gpsd::util::getVersionStringFromDylib(*((void **)this + 65), (uint64_t)v93))
  {
    v72 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v72, OS_LOG_TYPE_ERROR, "[TOOL] version number/string dlsym failed", buf, 2u);
    }
    exit(-1);
  }
  v12 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v93;
    if (v94 < 0)
      v13 = (void **)v93[0];
    *(_DWORD *)buf = 134218242;
    *(double *)&buf[4] = (double)v95 * 0.01;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEFAULT, "[TOOL] gnss::Device version %.2f, %s", buf, 0x16u);
  }
  v14 = v95;
  if (v95 != 2502)
  {
    v73 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = 0x4039051EB851EB85;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v14 * 0.01;
      _os_log_error_impl(&dword_2293C9000, v73, OS_LOG_TYPE_ERROR, "[TOOL] gnss::Device version mismatch: local=%.2f, dylib=%.2f", buf, 0x16u);
    }
    exit(-1);
  }
  v15 = (VendorLogger *)operator new();
  VendorLogger::VendorLogger(v15);
  std::unique_ptr<VendorLogger>::reset[abi:ne180100]((VendorLogger **)this + 67, v15);
  v16 = *((_QWORD *)this + 67);
  if (!v16)
  {
    v70 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v70, OS_LOG_TYPE_ERROR, "failed to create vendor logger", buf, 2u);
      v70 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Tools/GpsFactoryTest.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 261;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "constructDevice";
      _os_log_error_impl(&dword_2293C9000, v70, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v91, "assert");
    std::string::basic_string[abi:ne180100]<0>(v89, "constructDevice");
    std::string::basic_string[abi:ne180100]<0>(&v86, "failed to create vendor logger");
    gpsd::util::triggerDiagnosticReport((uint64_t)v91, (uint64_t)v89, (uint64_t)&v86);
    if (SHIBYTE(v88) < 0)
      operator delete(v86);
    if (v90 < 0)
      operator delete(v89[0]);
    if (v92 < 0)
      operator delete(v91[0]);
    __assert_rtn("constructDevice", "GpsFactoryTest.mm", 261, "false && \"failed to create vendor logger\"");
  }
  v17 = operator new();
  v18 = *((_QWORD *)this + 7);
  *(_QWORD *)v17 = &off_24F20BB98;
  *(_QWORD *)(v17 + 8) = *((_QWORD *)this + 6);
  *(_QWORD *)(v17 + 16) = v18;
  *(_QWORD *)(v17 + 24) = v16;
  *(_BYTE *)(v17 + 32) = 0;
  v19 = (GnssHal::PlatformNvStore *)operator new();
  GnssHal::PlatformNvStore::PlatformNvStore(v19);
  if (*((_BYTE *)this + 64))
  {
    v20 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v20, OS_LOG_TYPE_DEFAULT, "[TOOL] Clearing NV store (use --retain-nv-store to avoid)", buf, 2u);
    }
    (*(void (**)(GnssHal::PlatformNvStore *))(*(_QWORD *)v19 + 104))(v19);
    (*(void (**)(GnssHal::PlatformNvStore *))(*(_QWORD *)v19 + 96))(v19);
    (*(void (**)(GnssHal::PlatformNvStore *))(*(_QWORD *)v19 + 8))(v19);
    v19 = (GnssHal::PlatformNvStore *)operator new();
    GnssHal::PlatformNvStore::PlatformNvStore(v19);
  }
  v21 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v21 == 103 || v21 == 201 || v21 == 106)
  {
    v22 = (_QWORD *)operator new();
    *(_QWORD *)&buf[24] = 0;
    GnssHal::GpioEmbedded::GpioEmbedded(v22, (uint64_t)buf);
    v23 = *(_QWORD **)&buf[24];
    if (*(_BYTE **)&buf[24] == buf)
    {
      v24 = 4;
      v23 = buf;
    }
    else
    {
      if (!*(_QWORD *)&buf[24])
        goto LABEL_36;
      v24 = 5;
    }
    (*(void (**)(void))(*v23 + 8 * v24))();
  }
  else
  {
    v22 = 0;
  }
LABEL_36:
  if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) > 1)
  {
    v25 = 0;
    v33 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
    if (v33 > 4 || ((1 << v33) & 0x19) == 0)
      goto LABEL_74;
    __p = 0;
    v84 = 0;
    v85 = 0;
    v34 = (_QWORD *)((char *)this + 176);
    if (*((char *)this + 199) < 0)
    {
      if (*((_QWORD *)this + 23))
      {
LABEL_53:
        std::ifstream::basic_ifstream(buf);
        if (v108)
        {
          v37 = *(_QWORD **)&v105[*(_QWORD *)(*(_QWORD *)buf - 24) + 8];
          v97 = 0;
          v98 = v37;
          memset(&v101, 0, sizeof(v101));
          while ((std::istreambuf_iterator<char>::equal[abi:ne180100](&v98, (_QWORD **)&v97) & 1) == 0)
          {
            v38 = (std::string::value_type *)v98[3];
            if (v38 == (std::string::value_type *)v98[4])
              v39 = (*(uint64_t (**)(_QWORD *))(*v98 + 72))(v98);
            else
              v39 = *v38;
            std::string::push_back(&v101, v39);
            v40 = v98[3];
            if (v40 == v98[4])
              (*(void (**)(_QWORD *))(*v98 + 80))(v98);
            else
              v98[3] = v40 + 1;
          }
          if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v41 = &v101;
          else
            v41 = (std::string *)v101.__r_.__value_.__r.__words[0];
          if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v101.__r_.__value_.__r.__words[2]);
          else
            size = v101.__r_.__value_.__l.__size_;
          MEMORY[0x22E2C8BB0](&__p, v41, size);
          if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v101.__r_.__value_.__l.__data_);
        }
        else
        {
          v43 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            if (*((char *)this + 199) < 0)
              v34 = (_QWORD *)*v34;
            LODWORD(v101.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)v101.__r_.__value_.__r.__words + 4) = (std::string::size_type)v34;
            _os_log_error_impl(&dword_2293C9000, v43, OS_LOG_TYPE_ERROR, "[ERROR ] Failed to open xml file %s", (uint8_t *)&v101, 0xCu);
          }
        }
        *(_QWORD *)buf = *MEMORY[0x24BEDB7E0];
        *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
        MEMORY[0x22E2C8C58](&buf[16]);
        std::istream::~istream();
        MEMORY[0x22E2C8DFC](v109);
      }
    }
    else if (*((_BYTE *)this + 199))
    {
      goto LABEL_53;
    }
    v25 = operator new();
    *(_QWORD *)v25 = &off_24F20B428;
    *(_QWORD *)(v25 + 32) = 0;
    *(_QWORD *)(v25 + 64) = 0;
    *(_QWORD *)(v25 + 96) = 0;
    *(_QWORD *)(v25 + 128) = 0;
    *(_QWORD *)(v25 + 160) = 0;
    *(_QWORD *)(v25 + 192) = 0;
    *(_QWORD *)(v25 + 232) = &off_24F20A550;
    *(_QWORD *)(v25 + 240) = &__p;
    *(_QWORD *)(v25 + 288) = v25 + 264;
    *(_QWORD *)(v25 + 224) = 0;
    *(_QWORD *)(v25 + 256) = v25 + 232;
    *(_QWORD *)(v25 + 264) = &off_24F20A5E0;
    *(_QWORD *)(v25 + 272) = this;
    *(_BYTE *)(v25 + 296) = 0;
    if (SHIBYTE(v85) < 0)
      operator delete(__p);
    goto LABEL_74;
  }
  v25 = operator new();
  *(_QWORD *)&buf[24] = 0;
  v102 = 0;
  *(_QWORD *)v25 = &off_24F20B598;
  *(_QWORD *)(v25 + 32) = 0;
  *(_QWORD *)(v25 + 64) = 0;
  GpsdPlatformInfo::instance(0);
  *(_OWORD *)(v25 + 72) = xmmword_2293F5A80;
  __asm { FMOV            V0.2D, #23.0 }
  *(_OWORD *)(v25 + 88) = _Q0;
  *(_BYTE *)(v25 + 104) = 0;
  *(_QWORD *)(v25 + 112) = 0;
  *(_BYTE *)(v25 + 120) = 0;
  v31 = v102;
  if (v102 == &v101)
  {
    v32 = 4;
    v31 = &v101;
    goto LABEL_46;
  }
  if (v102)
  {
    v32 = 5;
LABEL_46:
    (*(void (**)(void))(v31->__r_.__value_.__r.__words[0] + 8 * v32))();
  }
  v35 = *(_QWORD **)&buf[24];
  if (*(_BYTE **)&buf[24] == buf)
  {
    v36 = 4;
    v35 = buf;
  }
  else
  {
    if (!*(_QWORD *)&buf[24])
      goto LABEL_74;
    v36 = 5;
  }
  (*(void (**)(void))(*v35 + 8 * v36))();
LABEL_74:
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 202)
  {
    v44 = (GnssHal::CommPcie *)operator new();
    *(_QWORD *)&buf[24] = 0;
    v102 = 0;
    GnssHal::CommPcie::CommPcie((uint64_t)v44, buf, (uint64_t)&v101);
    v45 = v102;
    if (v102 == &v101)
    {
      v46 = 4;
      v45 = &v101;
    }
    else
    {
      if (!v102)
        goto LABEL_89;
      v46 = 5;
    }
    (*(void (**)(void))(v45->__r_.__value_.__r.__words[0] + 8 * v46))();
LABEL_89:
    v55 = *(_QWORD **)&buf[24];
    if (*(_BYTE **)&buf[24] == buf)
    {
      v56 = 4;
      v55 = buf;
    }
    else
    {
      if (!*(_QWORD *)&buf[24])
      {
LABEL_94:
        GnssHal::CommPcie::openWithRetries(v44, 72);
        if (((*(uint64_t (**)(GnssHal::CommPcie *))(*(_QWORD *)v44 + 32))(v44) & 1) == 0)
        {
          v71 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_2293C9000, v71, OS_LOG_TYPE_ERROR, "#pcie did not open", buf, 2u);
            v71 = GpsdLogObjectGeneral;
          }
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Tools/GpsFactoryTest.mm";
            *(_WORD *)&buf[12] = 1026;
            *(_DWORD *)&buf[14] = 315;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = "constructDevice";
            _os_log_error_impl(&dword_2293C9000, v71, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
          }
          std::string::basic_string[abi:ne180100]<0>(v81, "assert");
          std::string::basic_string[abi:ne180100]<0>(&v78, "constructDevice");
          std::string::basic_string[abi:ne180100]<0>(v76, "#pcie did not open");
          gpsd::util::triggerDiagnosticReport((uint64_t)v81, (uint64_t)&v78, (uint64_t)v76);
          if (SHIBYTE(v77) < 0)
            operator delete(v76[0]);
          if (SHIBYTE(v80) < 0)
            operator delete(v78);
          if (SHIBYTE(v82) < 0)
            operator delete(v81[0]);
          __assert_rtn("constructDevice", "GpsFactoryTest.mm", 315, "false && \"#pcie did not open\"");
        }
        if ((*(unsigned int (**)(GnssHal::CommPcie *))(*(_QWORD *)v44 + 72))(v44))
          (*(void (**)(GnssHal::CommPcie *))(*(_QWORD *)v44 + 24))(v44);
        goto LABEL_101;
      }
      v56 = 5;
    }
    (*(void (**)(void))(*v55 + 8 * v56))();
    goto LABEL_94;
  }
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107)
  {
    v44 = (GnssHal::CommPcie *)operator new();
    *(_QWORD *)&buf[24] = 0;
    GnssHal::CommSpi::CommSpi((uint64_t)v44, (uint64_t)buf, *((_QWORD *)this + 100), v47, v48, v49, v50, v51, v74, v75, (int)v76[0], SWORD2(v76[0]), SBYTE6(v76[0]), SHIBYTE(v76[0]), v76[1], v77, (int)v78, SWORD2(v78), SBYTE6(v78),
      SHIBYTE(v78),
      v79,
      v80,
      (int)v81[0],
      SWORD2(v81[0]),
      SBYTE6(v81[0]),
      SHIBYTE(v81[0]),
      v81[1],
      v82,
      (int)__p,
      SWORD2(__p),
      SBYTE6(__p),
      SHIBYTE(__p),
      v84,
      v85,
      (int)v86,
      SWORD2(v86),
      SBYTE6(v86),
      SHIBYTE(v86),
      v87,
      v88,
      (int)v89[0],
      SWORD2(v89[0]),
      SBYTE6(v89[0]),
      SHIBYTE(v89[0]));
    v52 = *(_QWORD **)&buf[24];
    if (*(_BYTE **)&buf[24] == buf)
    {
      v53 = 4;
      v52 = buf;
    }
    else
    {
      if (!*(_QWORD *)&buf[24])
      {
LABEL_101:
        v57 = v22;
        goto LABEL_102;
      }
      v53 = 5;
    }
    (*(void (**)(void))(*v52 + 8 * v53))();
    goto LABEL_101;
  }
  LOWORD(v101.__r_.__value_.__l.__data_) = 2561;
  BYTE4(v103) = 0;
  v102 = 0;
  *(_OWORD *)&v101.__r_.__value_.__r.__words[1] = 0uLL;
  LOBYTE(v103) = 0;
  std::string::operator=((std::string *)&v101.__r_.__value_.__r.__words[1], (const std::string *)this);
  if (*((_BYTE *)this + 66))
  {
    LODWORD(v103) = TestCommConfig::castBaudRateToEnum((TestCommConfig *)*((unsigned int *)this + 42));
    BYTE4(v103) = 1;
  }
  v54 = (id *)GpsdPreferences::instance(0);
  if (GpsdPreferences::usesAsyncCommRead(v54))
  {
    v44 = (GnssHal::CommPcie *)operator new();
    *(_WORD *)buf = v101.__r_.__value_.__l.__data_;
    if (SHIBYTE(v102) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&buf[8], (const std::string::value_type *)v101.__r_.__value_.__l.__size_, v101.__r_.__value_.__r.__words[2]);
    }
    else
    {
      *(_OWORD *)&buf[8] = *(_OWORD *)&v101.__r_.__value_.__r.__words[1];
      *(_QWORD *)&buf[24] = v102;
    }
    *(_QWORD *)v105 = v103;
    __p = v22;
    GnssHal::CommUart::CommUart((uint64_t)v44, (uint64_t)buf, (uint64_t *)&__p, *((dispatch_queue_t *)this + 100));
    if (__p)
      (*(void (**)(void *))(*(_QWORD *)__p + 8))(__p);
    if ((buf[31] & 0x80000000) != 0)
      operator delete(*(void **)&buf[8]);
    v22 = 0;
  }
  else
  {
    v44 = (GnssHal::CommPcie *)operator new();
    *(_WORD *)buf = v101.__r_.__value_.__l.__data_;
    if (SHIBYTE(v102) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&buf[8], (const std::string::value_type *)v101.__r_.__value_.__l.__size_, v101.__r_.__value_.__r.__words[2]);
    }
    else
    {
      *(_OWORD *)&buf[8] = *(_OWORD *)&v101.__r_.__value_.__r.__words[1];
      *(_QWORD *)&buf[24] = v102;
    }
    *(_QWORD *)v105 = v103;
    __p = 0;
    GnssHal::CommUart::CommUart((uint64_t)v44, (uint64_t)buf, (uint64_t *)&__p, 0);
    if (__p)
      (*(void (**)(void *))(*(_QWORD *)__p + 8))(__p);
    if ((buf[31] & 0x80000000) != 0)
      operator delete(*(void **)&buf[8]);
  }
  v57 = v22;
  if (SHIBYTE(v102) < 0)
    operator delete((void *)v101.__r_.__value_.__l.__size_);
LABEL_102:
  v58 = v11;
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107)
  {
    v59 = (void *)operator new();
    GnssHal::PlatformTimer::PlatformTimer((uint64_t)v59, *((dispatch_queue_t *)this + 100));
  }
  else
  {
    v59 = 0;
  }
  std::mutex::lock((std::mutex *)((char *)this + 432));
  atomic_store(1u, (unsigned int *)this + 92);
  std::condition_variable::notify_all((std::condition_variable *)this + 8);
  std::mutex::unlock((std::mutex *)((char *)this + 432));
  v60 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    *(_QWORD *)&buf[4] = v57;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v44;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v17;
    *(_WORD *)v105 = 2048;
    *(_QWORD *)&v105[2] = v19;
    v106 = 2048;
    v107 = v25;
    _os_log_impl(&dword_2293C9000, v60, OS_LOG_TYPE_DEFAULT, "trying newGnssDeviceTest, gpio=%p, comm=%p, log=%p, nv=%p, ext=%p", buf, 0x34u);
  }
  v61 = operator new();
  *(_QWORD *)buf = v57;
  v101.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
  __p = v59;
  v97 = v19;
  v98 = (_QWORD *)v17;
  v96 = v25;
  GnssHal::InterfacesImpl::InterfacesImpl(v61, (uint64_t *)buf, (uint64_t *)&v101, (uint64_t *)&__p, (uint64_t *)&v98, (uint64_t *)&v97, &v96);
  if (v96)
    (*(void (**)(uint64_t))(*(_QWORD *)v96 + 8))(v96);
  if (v97)
    (*(void (**)(GnssHal::PlatformNvStore *))(*(_QWORD *)v97 + 8))(v97);
  if (v98)
    (*(void (**)(_QWORD *))(*v98 + 8))(v98);
  if (__p)
    (*(void (**)(void *))(*(_QWORD *)__p + 8))(__p);
  if (v101.__r_.__value_.__r.__words[0])
    (*(void (**)(std::string::size_type))(*(_QWORD *)v101.__r_.__value_.__l.__data_ + 8))(v101.__r_.__value_.__r.__words[0]);
  if (*(_QWORD *)buf)
    (*(void (**)(_QWORD))(**(_QWORD **)buf + 8))(*(_QWORD *)buf);
  v75 = v61;
  v99[0] = &off_24F20A660;
  v99[1] = this;
  v100 = v99;
  v62 = v58(&v75, v99);
  v63 = *((_QWORD *)this + 66);
  *((_QWORD *)this + 66) = v62;
  if (v63)
    (*(void (**)(uint64_t))(*(_QWORD *)v63 + 16))(v63);
  v64 = v100;
  if (v100 == v99)
  {
    v65 = 4;
    v64 = v99;
    goto LABEL_125;
  }
  if (v100)
  {
    v65 = 5;
LABEL_125:
    (*(void (**)(void))(*v64 + 8 * v65))();
  }
  v66 = v75;
  v75 = 0;
  if (v66)
    (*(void (**)(uint64_t))(*(_QWORD *)v66 + 8))(v66);
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, "newGnssDeviceTest");
  v67 = atomic_load((unint64_t *)this + 47);
  if ((v67 & 0xFF00000000) == 0)
    std::__throw_bad_optional_access[abi:ne180100]();
  if ((_DWORD)v67 != 1)
    __assert_rtn("constructDevice", "GpsFactoryTest.mm", 350, "fLastResult.load().value() == gnss::Result::kSuccess && \"newGnssDeviceTest error code\"");
  v68 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v69 = (***((uint64_t (****)(_QWORD))this + 66))(*((_QWORD *)this + 66));
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = 2502;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v69;
    _os_log_impl(&dword_2293C9000, v68, OS_LOG_TYPE_DEFAULT, "[TOOL  ] header version = %d, dylib = %d", buf, 0xEu);
  }
  if ((***((unsigned int (****)(_QWORD))this + 66))(*((_QWORD *)this + 66)) != 2502)
    __assert_rtn("constructDevice", "GpsFactoryTest.mm", 354, "gnssTest::Device::getStaticVersionNumber() == fDevice->getObjectVersionNumber() && gnssTest::Device::getStaticVersionNumber() > 0");
  if (SHIBYTE(v94) < 0)
    operator delete(v93[0]);
}

void sub_2293CCDB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,void *__p,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  MEMORY[0x22E2C8E68](v53, 0x10B3C408487180ALL);
  if (a49 < 0)
    operator delete(__p);
  if (v52)
    (*(void (**)(uint64_t))(*(_QWORD *)v52 + 8))(v52);
  if (v51)
    (*(void (**)(uint64_t))(*(_QWORD *)v51 + 8))(v51);
  (*(void (**)(uint64_t))(*(_QWORD *)v50 + 8))(v50);
  (*(void (**)(uint64_t))(*(_QWORD *)v49 + 8))(v49);
  JUMPOUT(0x2293CD300);
}

void sub_2293CCEF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,char *a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,char *a52)
{
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;

  v53 = a46;
  if (a46 == v52)
  {
    v54 = 4;
    v53 = &a43;
  }
  else
  {
    if (!a46)
      goto LABEL_6;
    v54 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v53 + 8 * v54))();
LABEL_6:
  v55 = a52;
  if (a52 == &a49)
  {
    v56 = 4;
    v55 = &a49;
  }
  else
  {
    if (!a52)
      goto LABEL_11;
    v56 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v55 + 8 * v56))();
LABEL_11:
  JUMPOUT(0x2293CCF68);
}

void sub_2293CCF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,char *a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,char *a52)
{
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;

  v54 = (_QWORD *)v52[8];
  if (v54 == v52 + 5)
  {
    v55 = 4;
    v54 = v52 + 5;
  }
  else
  {
    if (!v54)
      goto LABEL_6;
    v55 = 5;
  }
  (*(void (**)(void))(*v54 + 8 * v55))();
LABEL_6:
  v56 = (_QWORD *)v52[4];
  if (v56 == v53)
  {
    v57 = 4;
  }
  else
  {
    if (!v56)
      goto LABEL_11;
    v57 = 5;
    v53 = (_QWORD *)v52[4];
  }
  (*(void (**)(_QWORD *))(*v53 + 8 * v57))(v53);
LABEL_11:
  v58 = a46;
  if (a46 == &a43)
  {
    v59 = 4;
    v58 = &a43;
  }
  else
  {
    if (!a46)
      goto LABEL_16;
    v59 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v58 + 8 * v59))();
LABEL_16:
  v60 = a52;
  if (a52 == &a49)
  {
    v61 = 4;
    v60 = &a49;
  }
  else
  {
    if (!a52)
    {
LABEL_21:
      MEMORY[0x22E2C8E68](v52, 0x10A1C406C057149);
      JUMPOUT(0x2293CD2B4);
    }
    v61 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v60 + 8 * v61))();
  goto LABEL_21;
}

void sub_2293CD064()
{
  uint64_t v0;

  MEMORY[0x22E2C8E68](v0, 0x10B3C4086D85886);
  JUMPOUT(0x2293CD2D8);
}

void sub_2293CD134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  uint64_t v37;

  MEMORY[0x22E2C8E68](v37, 0x10F2C4084379287);
  if (a37 < 0)
    operator delete(a32);
  _Unwind_Resume(a1);
}

void sub_2293CD158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (v40)
    (*(void (**)(uint64_t))(*(_QWORD *)v40 + 8))(v40);
  if (v39)
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
  (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
  (*(void (**)(uint64_t))(*(_QWORD *)v37 + 8))(v37);
  if (a37 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_2293CD164()
{
  JUMPOUT(0x2293CD2B4);
}

void sub_2293CD198(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    if (a48 < 0)
      operator delete(__p);
    __cxa_rethrow();
  }
  JUMPOUT(0x2293CD310);
}

void sub_2293CD1C4()
{
  __cxa_end_catch();
  JUMPOUT(0x2293CD1CCLL);
}

void sub_2293CD1E8(void *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  JUMPOUT(0x2293CD310);
}

void sub_2293CD1F8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  if (a16 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);
  if (a28 < 0)
    operator delete(a23);
  JUMPOUT(0x2293CD290);
}

void sub_2293CD2F4()
{
  JUMPOUT(0x2293CD310);
}

_QWORD *std::ifstream::basic_ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB838];
  v3 = MEMORY[0x24BEDB838] + 64;
  a1[53] = MEMORY[0x24BEDB838] + 64;
  v4 = a1 + 2;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  a1[1] = 0;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 2);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[53] = v3;
  MEMORY[0x22E2C8C4C](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_2293CD3EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x22E2C8DFC](v1 + 424);
  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E0];
  v3 = *MEMORY[0x24BEDB7E0];
  *a1 = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x22E2C8C58](a1 + 2);
  std::istream::~istream();
  MEMORY[0x22E2C8DFC](a1 + 53);
  return a1;
}

uint64_t GpsFactoryTest::getDylibInterfaceVersion(GpsFactoryTest *this)
{
  return (***((uint64_t (****)(_QWORD))this + 66))(*((_QWORD *)this + 66));
}

void GpsFactoryTest::destructDevice(GpsFactoryTest *this)
{
  VendorLogger *v2;

  v2 = (VendorLogger *)*((_QWORD *)this + 67);
  if (v2)
    VendorLogger::prepareForTermination(v2);
  std::mutex::lock((std::mutex *)((char *)this + 432));
  atomic_store(0, (unsigned int *)this + 92);
  std::condition_variable::notify_all((std::condition_variable *)this + 8);
  std::mutex::unlock((std::mutex *)((char *)this + 432));
  atomic_store(0x100000001uLL, (unint64_t *)this + 47);
}

void GpsFactoryTest::fixCallback(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  std::string *p_p;
  std::string __p;
  uint8_t buf[4];
  std::string *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = GpsdLogObjectGeneral;
  v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      GpsFactoryTest::stringify(a1, v3, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v9 = p_p;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "[FIX   ] %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    GpsFactoryTest::BasicTimer::heartbeat((GpsFactoryTest::BasicTimer *)(a1 + 224));
  }
  else if (v5)
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "[WARN  ] null gnss::Fix", (uint8_t *)&__p, 2u);
  }
}

void GpsFactoryTest::stringify(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  std::string *v6;
  __int128 v7;
  void **v8;
  std::string::size_type v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  __int128 v13;
  void **v14;
  std::string::size_type v15;
  std::string *v16;
  void *__p[2];
  unsigned __int8 v18;
  void *v19[2];
  unsigned __int8 v20;
  std::string v21;
  std::string v22;
  std::string v23;
  std::string v24;

  GpsFactoryTest::stringify(a1, a2, &v21);
  v6 = std::string::append(&v21, ", ");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v22.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify(a1, a2 + 48, v19);
  if ((v20 & 0x80u) == 0)
    v8 = v19;
  else
    v8 = (void **)v19[0];
  if ((v20 & 0x80u) == 0)
    v9 = v20;
  else
    v9 = (std::string::size_type)v19[1];
  v10 = std::string::append(&v22, (const std::string::value_type *)v8, v9);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v23.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  v12 = std::string::append(&v23, ", ");
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v24.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify(a1, (double *)(a2 + 136), __p);
  if ((v18 & 0x80u) == 0)
    v14 = __p;
  else
    v14 = (void **)__p[0];
  if ((v18 & 0x80u) == 0)
    v15 = v18;
  else
    v15 = (std::string::size_type)__p[1];
  v16 = std::string::append(&v24, (const std::string::value_type *)v14, v15);
  *a3 = *v16;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if ((char)v18 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  if ((char)v20 < 0)
    operator delete(v19[0]);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
}

void sub_2293CD788(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v33 - 41) < 0)
    operator delete(*(void **)(v33 - 64));
  if (*(char *)(v33 - 73) < 0)
    operator delete(*(void **)(v33 - 96));
  if (a21 < 0)
    operator delete(a16);
  if (a33 < 0)
    operator delete(a28);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

void GpsFactoryTest::BasicTimer::heartbeat(GpsFactoryTest::BasicTimer *this)
{
  std::mutex *v2;

  v2 = (std::mutex *)((char *)this + 56);
  std::mutex::lock((std::mutex *)((char *)this + 56));
  *((double *)this + 16) = (double)(std::chrono::steady_clock::now().__d_.__rep_ - *(_QWORD *)this) / 1000000000.0;
  std::mutex::unlock(v2);
}

void GpsFactoryTest::rfMeasurementCallback(uint64_t a1, unsigned __int8 **a2)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  NSObject *v5;
  void **v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *__p[2];
  char v12;
  uint8_t buf[4];
  void **v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        GpsFactoryTest::stringify(*v3, __p);
        if (v12 >= 0)
          v6 = __p;
        else
          v6 = (void **)__p[0];
        v7 = *((_DWORD *)v3 + 1);
        v8 = *((_QWORD *)v3 + 1);
        v9 = *((_QWORD *)v3 + 2);
        v10 = *((_QWORD *)v3 + 3);
        *(_DWORD *)buf = 136316162;
        v14 = v6;
        v15 = 1024;
        v16 = v7;
        v17 = 2048;
        v18 = v8;
        v19 = 2048;
        v20 = v9;
        v21 = 2048;
        v22 = v10;
        _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "[RFMEAS] %s.%d, %.2f dB-Hz, %.2f dBm, %.2f Hz offset", buf, 0x30u);
        if (v12 < 0)
          operator delete(__p[0]);
      }
      v3 += 40;
    }
    while (v3 != v4);
  }
  GpsFactoryTest::BasicTimer::heartbeat((GpsFactoryTest::BasicTimer *)(a1 + 224));
}

_QWORD *GpsFactoryTest::stringify@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  char *v2;

  if ((a1 - 1) > 9)
    v2 = "unknown";
  else
    v2 = off_24F20B118[(char)(a1 - 1)];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void GpsFactoryTest::loobackResultCallback()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "loobackResultCallback";
    _os_log_impl(&dword_2293C9000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }
}

void GpsFactoryTest::EventNotificationCb()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "EventNotificationCb";
    _os_log_impl(&dword_2293C9000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }
}

void GpsFactoryTest::commPingCallback(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  NSObject *v5;
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  uint64_t *v9;
  __int16 v10;
  uint64_t *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0)
      v6 = a2;
    else
      v6 = (uint64_t *)*a2;
    if (*((char *)a3 + 23) >= 0)
      v7 = a3;
    else
      v7 = (uint64_t *)*a3;
    v8 = 136315394;
    v9 = v6;
    v10 = 2080;
    v11 = v7;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT ] commPing result: version %s, serial %s", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t GpsFactoryTest::run(GpsFactoryTest *this)
{
  NSObject *v2;
  const char *v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD block[5];

  v2 = *((_QWORD *)this + 100);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN14GpsFactoryTest3runEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
  v3 = (char *)this + 496;
  if (*((char *)this + 519) < 0)
    v3 = *(const char **)v3;
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, v3);
  sleep(1u);
  v4 = atomic_load((unint64_t *)this + 47);
  if ((v4 & 0xFF00000000) != 0)
    v5 = v4;
  else
    v5 = 7;
  GpsFactoryTest::destructDevice(this);
  return v5;
}

_QWORD *GpsFactoryTest::runInternal(GpsFactoryTest *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  int v18;
  int v20;
  unsigned int v21;
  NSObject *v22;
  unsigned int v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t NoiseFigure;
  NSObject *v33;
  _BOOL4 v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  int v49;
  const char *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  _QWORD *result;
  uint64_t v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD *v104;
  _QWORD *v105;
  int v106;
  int v107;
  int v108;
  int v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  char v117;
  int v118;
  int v119;
  int v120;
  int v121;
  _BYTE v122[24];
  _BYTE *v123;
  _QWORD v124[3];
  _QWORD *v125;
  uint8_t buf[4];
  __int128 v127;
  _BYTE v128[6];
  _DWORD v129[63];
  _BYTE v130[24];
  _BYTE *v131;
  _BYTE v132[24];
  _BYTE *v133;
  _BYTE v134[24];
  _BYTE *v135;
  _BYTE v136[24];
  _BYTE *v137;
  _BYTE v138[24];
  _BYTE *v139;
  _QWORD v140[3];
  _QWORD *v141;
  _BYTE v142[24];
  _BYTE *v143;
  _QWORD v144[3];
  _QWORD *v145;
  _BYTE v146[24];
  _BYTE *v147;
  _QWORD v148[3];
  _QWORD *v149;
  _BYTE v150[24];
  _BYTE *v151;
  _QWORD v152[3];
  _QWORD *v153;
  _QWORD v154[3];
  _QWORD *v155;
  _BYTE v156[24];
  _BYTE *v157;
  _QWORD v158[3];
  _QWORD *v159;
  _QWORD v160[3];
  _QWORD *v161;
  uint64_t v162;

  v162 = *MEMORY[0x24BDAC8D0];
  atomic_store(1u, (unsigned __int8 *)this + 364);
  *((std::chrono::steady_clock::time_point *)this + 28) = std::chrono::steady_clock::now();
  *((_QWORD *)this + 44) = 0;
  GpsFactoryTest::constructDevice(this);
  v160[0] = &off_24F20A6F0;
  v160[1] = this;
  v161 = v160;
  if (*((_BYTE *)this + 74))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((_BYTE *)this + 74) = 0;
    v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: commPing", buf, 2u);
    }
    v3 = *((_QWORD *)this + 66);
    v4 = *((unsigned int *)this + 33);
    v158[0] = &off_24F20A770;
    v158[1] = this;
    v159 = v158;
    v5 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v157 = v156;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v156);
LABEL_13:
        (*(void (**)(uint64_t, uint64_t, _QWORD *, _BYTE *))(*(_QWORD *)v3 + 88))(v3, v4, v158, v156);
        v7 = v157;
        if (v157 == v156)
        {
          v8 = 4;
          v7 = v156;
        }
        else
        {
          if (!v157)
            goto LABEL_18;
          v8 = 5;
        }
        (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_18:
        v9 = v159;
        if (v159 == v158)
        {
          v10 = 4;
          v9 = v158;
        }
        else
        {
          if (!v159)
          {
LABEL_23:
            *((_DWORD *)this + 90) = *((_DWORD *)this + 33);
            MEMORY[0x22E2C8BA4]((char *)this + 496, "commPing");
            goto LABEL_203;
          }
          v10 = 5;
        }
        (*(void (**)(void))(*v9 + 8 * v10))();
        goto LABEL_23;
      }
      v5 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v157 = (_BYTE *)v5;
    goto LABEL_13;
  }
  if (*((_BYTE *)this + 65))
  {
    v6 = (id *)GpsdPreferences::instance(0);
    if (!GpsdPreferences::nmeaMaskOverride(v6)
      && (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) >= 2)
    {
      GpsdPlatformInfo::instance(0);
    }
    v11 = *((_QWORD *)this + 66);
    v155 = v154;
    v152[0] = &off_24F20A890;
    v153 = v152;
    v154[0] = &off_24F20A800;
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 96))(v11);
    v12 = v153;
    if (v153 == v152)
    {
      v13 = 4;
      v12 = v152;
    }
    else
    {
      if (!v153)
        goto LABEL_30;
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_30:
    v14 = v155;
    if (v155 == v154)
    {
      v15 = 4;
      v14 = v154;
    }
    else
    {
      if (!v155)
      {
LABEL_35:
        GpsFactoryTest::waitForIdle(this);
        goto LABEL_36;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_35;
  }
LABEL_36:
  v16 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
  v17 = v16 > 4;
  v18 = (1 << v16) & 0x19;
  if (!v17 && v18 != 0)
  {
    if (*((_BYTE *)this + 80))
    {
      v20 = *((_DWORD *)this + 19);
      if (v20 == 13)
      {
        v21 = 1;
        goto LABEL_53;
      }
      if (v20 == 14)
      {
        v21 = 2;
        goto LABEL_53;
      }
      v24 = GpsdLogObjectGeneral;
      v21 = 0;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
LABEL_53:
        if (*((_BYTE *)this + 87))
          v23 = *((unsigned __int8 *)this + 86);
        else
          v23 = 0;
        goto LABEL_56;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v127) = v20;
      _os_log_impl(&dword_2293C9000, v24, OS_LOG_TYPE_DEFAULT, "[EVENT ] Unknown LTE filter band %d", buf, 8u);
    }
    v21 = 0;
    goto LABEL_53;
  }
  if (*((_BYTE *)this + 80) || *((_BYTE *)this + 87))
  {
    v22 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v22, OS_LOG_TYPE_ERROR, "[EVENT ] LTE filter / blanking only supported in FIRE", buf, 2u);
    }
  }
  v23 = 0;
  v21 = 0;
LABEL_56:
  v25 = v21 | ((unint64_t)v23 << 8);
  if (v25)
  {
    v26 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&v127 = v21 | ((unint64_t)v23 << 8);
      WORD4(v127) = 1024;
      *(_DWORD *)((char *)&v127 + 10) = v21;
      HIWORD(v127) = 1024;
      *(_DWORD *)v128 = v23;
      *(_WORD *)&v128[4] = 1024;
      v129[0] = 0;
      _os_log_impl(&dword_2293C9000, v26, OS_LOG_TYPE_DEFAULT, "[TOOL  ] coexConfig,val,0x%llx,lte,%d,blanking,%d,bitmask,0x%x", buf, 0x1Eu);
    }
    v27 = *((_QWORD *)this + 66);
    v28 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v151 = v150;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v150);
LABEL_64:
        (*(void (**)(uint64_t, unint64_t, _BYTE *))(*(_QWORD *)v27 + 104))(v27, v25, v150);
        v29 = v151;
        if (v151 == v150)
        {
          v30 = 4;
          v29 = v150;
        }
        else
        {
          if (!v151)
          {
LABEL_69:
            GpsFactoryTest::waitForIdle(this);
            goto LABEL_70;
          }
          v30 = 5;
        }
        (*(void (**)(void))(*v29 + 8 * v30))();
        goto LABEL_69;
      }
      v28 = (*(uint64_t (**)(_QWORD *))(*v161 + 16))(v161);
    }
    v151 = (_BYTE *)v28;
    goto LABEL_64;
  }
LABEL_70:
  if (*((_BYTE *)this + 68) || *((_BYTE *)this + 69))
  {
    v31 = GpsdPlatformInfo::instance(0);
    NoiseFigure = GpsdPlatformInfo::getNoiseFigure(v31, *((unsigned __int8 *)this + 104));
    v33 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v33, OS_LOG_TYPE_DEFAULT, "[INFO  ] C/N0 measured at correlator; RSSI referred to antenna port: C/N0 - 174 + NF",
        buf,
        2u);
      v33 = GpsdLogObjectGeneral;
    }
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if ((NoiseFigure & 0xFF00000000) != 0)
    {
      if (!v34)
        goto LABEL_80;
      *(_DWORD *)buf = 134217984;
      *(double *)&v127 = *(float *)&NoiseFigure;
      v35 = "[INFO  ] Noise Figure: %.1f dB";
      v36 = v33;
      v37 = 12;
    }
    else
    {
      if (!v34)
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v35 = "[INFO  ] Noise Figure: unknown";
      v36 = v33;
      v37 = 2;
    }
    _os_log_impl(&dword_2293C9000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
  }
LABEL_80:
  if (*((_BYTE *)this + 67))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((_BYTE *)this + 67) = 0;
    v38 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v38, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: PERIODIC", buf, 2u);
    }
    v39 = *((_QWORD *)this + 66);
    v40 = *((unsigned int *)this + 22);
    v148[0] = &off_24F20A910;
    v148[1] = this;
    v149 = v148;
    v41 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v147 = v146;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v146);
LABEL_93:
        (*(void (**)(uint64_t, uint64_t, _QWORD *, _BYTE *))(*(_QWORD *)v39 + 24))(v39, v40, v148, v146);
        v45 = v147;
        if (v147 == v146)
        {
          v46 = 4;
          v45 = v146;
        }
        else
        {
          if (!v147)
            goto LABEL_98;
          v46 = 5;
        }
        (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_98:
        v47 = v149;
        if (v149 == v148)
        {
          v48 = 4;
          v47 = v148;
        }
        else
        {
          if (!v149)
          {
LABEL_103:
            v49 = *((_DWORD *)this + 22);
            if (v49 < 1)
            {
              if (v49 == -1)
              {
                std::mutex::lock((std::mutex *)((char *)this + 432));
                atomic_store(1u, (unsigned int *)this + 92);
                std::condition_variable::notify_all((std::condition_variable *)this + 8);
                std::mutex::unlock((std::mutex *)((char *)this + 432));
              }
            }
            else if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1)
            {
              sleep(*((_DWORD *)this + 22) + 1);
            }
            *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 22);
            v50 = "periodic";
            goto LABEL_202;
          }
          v48 = 5;
        }
        (*(void (**)(void))(*v47 + 8 * v48))();
        goto LABEL_103;
      }
      v41 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v147 = (_BYTE *)v41;
    goto LABEL_93;
  }
  if (*((_BYTE *)this + 68))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((_BYTE *)this + 68) = 0;
    v42 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v42, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: CW", buf, 2u);
    }
    v43 = *((unsigned __int8 *)this + 104);
    if ((_DWORD)v43 == 4)
    {
      v44 = *((unsigned int *)this + 27);
    }
    else
    {
      v44 = 0;
      *((_DWORD *)this + 27) = 0;
    }
    v58 = *((_QWORD *)this + 66);
    v59 = *((unsigned int *)this + 23);
    v60 = *((_DWORD *)this + 24);
    v61 = *((unsigned int *)this + 25);
    v144[0] = &off_24F20A9A0;
    v144[1] = this;
    v145 = v144;
    v62 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v143 = v142;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v142);
LABEL_122:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, _BYTE *, double))(*(_QWORD *)v58 + 32))(v58, v59, v43, v44, v61, v144, v142, (double)v60);
        v63 = v143;
        if (v143 == v142)
        {
          v64 = 4;
          v63 = v142;
        }
        else
        {
          if (!v143)
            goto LABEL_127;
          v64 = 5;
        }
        (*(void (**)(void))(*v63 + 8 * v64))();
LABEL_127:
        v65 = v145;
        if (v145 == v144)
        {
          v66 = 4;
          v65 = v144;
        }
        else
        {
          if (!v145)
          {
LABEL_132:
            *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 23);
            v50 = "cw";
LABEL_202:
            MEMORY[0x22E2C8BA4]((char *)this + 496, v50);
            goto LABEL_203;
          }
          v66 = 5;
        }
        (*(void (**)(void))(*v65 + 8 * v66))();
        goto LABEL_132;
      }
      v62 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v143 = (_BYTE *)v62;
    goto LABEL_122;
  }
  if (*((_BYTE *)this + 69))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((_BYTE *)this + 69) = 0;
    v51 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v51, OS_LOG_TYPE_DEFAULT, "[EVENT ] *** starting test: modulated", buf, 2u);
    }
    v52 = *((_QWORD *)this + 66);
    v53 = *((unsigned __int8 *)this + 104);
    v54 = *((unsigned int *)this + 27);
    v55 = *((unsigned int *)this + 28);
    v56 = *((unsigned int *)this + 25);
    v140[0] = &off_24F20AA30;
    v140[1] = this;
    v141 = v140;
    v57 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v139 = v138;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v138);
LABEL_141:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, _BYTE *))(*(_QWORD *)v52 + 40))(v52, v55, v53, v54, v56, v140, v138);
        v73 = v139;
        if (v139 == v138)
        {
          v74 = 4;
          v73 = v138;
        }
        else
        {
          if (!v139)
            goto LABEL_146;
          v74 = 5;
        }
        (*(void (**)(void))(*v73 + 8 * v74))();
LABEL_146:
        v75 = v141;
        if (v141 == v140)
        {
          v76 = 4;
          v75 = v140;
        }
        else
        {
          if (!v141)
          {
LABEL_151:
            *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 28);
            v50 = "modulated";
            goto LABEL_202;
          }
          v76 = 5;
        }
        (*(void (**)(void))(*v75 + 8 * v76))();
        goto LABEL_151;
      }
      v57 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v139 = (_BYTE *)v57;
    goto LABEL_141;
  }
  if (*((_BYTE *)this + 70))
  {
    *((_BYTE *)this + 70) = 0;
    GpsFactoryTest::mutateState((uint64_t)this, 1u);
    v67 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v67, OS_LOG_TYPE_DEFAULT, "[EVENT ] *** starting test: record IQ", buf, 2u);
    }
    v68 = *((_QWORD *)this + 66);
    v69 = *((unsigned int *)this + 29);
    v70 = *((unsigned __int8 *)this + 104);
    v71 = *((unsigned int *)this + 27);
    v72 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v137 = v136;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v136);
LABEL_158:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v68 + 48))(v68, v69, v70, v71, v136);
        v80 = v137;
        if (v137 == v136)
        {
          v81 = 4;
          v80 = v136;
        }
        else
        {
          if (!v137)
          {
LABEL_163:
            *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 29);
            v50 = "recordIQ";
            goto LABEL_202;
          }
          v81 = 5;
        }
        (*(void (**)(void))(*v80 + 8 * v81))();
        goto LABEL_163;
      }
      v72 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v137 = (_BYTE *)v72;
    goto LABEL_158;
  }
  if (*((_BYTE *)this + 71))
  {
    *((_BYTE *)this + 71) = 0;
    v77 = *((_QWORD *)this + 66);
    v78 = *((unsigned int *)this + 30);
    v79 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v135 = v134;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v134);
LABEL_170:
        (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v77 + 64))(v77, v78, v134);
        v85 = v135;
        if (v135 == v134)
        {
          v86 = 4;
          v85 = v134;
        }
        else
        {
          if (!v135)
          {
LABEL_175:
            v50 = "powerMode";
            goto LABEL_202;
          }
          v86 = 5;
        }
        (*(void (**)(void))(*v85 + 8 * v86))();
        goto LABEL_175;
      }
      v79 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v135 = (_BYTE *)v79;
    goto LABEL_170;
  }
  if (*((_BYTE *)this + 72))
  {
    GpsFactoryTest::mutateState((uint64_t)this, 1u);
    *((_BYTE *)this + 72) = 0;
    v82 = *((_QWORD *)this + 66);
    v83 = *((unsigned int *)this + 31);
    v84 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v133 = v132;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v132);
LABEL_184:
        (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v82 + 72))(v82, v83, v132);
        v91 = v133;
        if (v133 == v132)
        {
          v92 = 4;
          v91 = v132;
        }
        else
        {
          if (!v133)
          {
LABEL_189:
            v50 = "HostWakeGpio";
            goto LABEL_202;
          }
          v92 = 5;
        }
        (*(void (**)(void))(*v91 + 8 * v92))();
        goto LABEL_189;
      }
      v84 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v133 = (_BYTE *)v84;
    goto LABEL_184;
  }
  if (*((_BYTE *)this + 73))
  {
    v87 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v87, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: TimeMark", buf, 2u);
    }
    GpsFactoryTest::mutateState((uint64_t)this, 1u);
    *((_BYTE *)this + 73) = 0;
    v88 = *((_QWORD *)this + 66);
    v89 = *((unsigned int *)this + 32);
    v90 = (uint64_t)v161;
    if (v161)
    {
      if (v161 == v160)
      {
        v131 = v130;
        (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v130);
LABEL_196:
        (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v88 + 80))(v88, v89, v130);
        v96 = v131;
        if (v131 == v130)
        {
          v97 = 4;
          v96 = v130;
        }
        else
        {
          if (!v131)
          {
LABEL_201:
            *((_DWORD *)this + 90) = *((_DWORD *)this + 32);
            v50 = "TimeMarkGpio";
            goto LABEL_202;
          }
          v97 = 5;
        }
        (*(void (**)(void))(*v96 + 8 * v97))();
        goto LABEL_201;
      }
      v90 = (*(uint64_t (**)(void))(*v161 + 16))();
    }
    v131 = (_BYTE *)v90;
    goto LABEL_196;
  }
  if (!*((_BYTE *)this + 75))
    goto LABEL_203;
  GpsFactoryTest::mutateState((uint64_t)this, 1u);
  *((_BYTE *)this + 75) = 0;
  v93 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v93, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: commLoopback", buf, 2u);
  }
  v94 = *((unsigned int *)this + 34);
  v120 = 1;
  v121 = 8;
  v118 = 9;
  v119 = 1;
  if (*((char *)this + 167) < 0)
    v95 = *((_QWORD *)this + 19);
  else
    v95 = *((unsigned __int8 *)this + 167);
  if (v95)
  {
    std::istringstream::basic_istringstream[abi:ne180100]((uint64_t)buf, (const std::string *)this + 6);
    v100 = (_QWORD *)MEMORY[0x22E2C8C94](buf, &v120);
    v101 = std::operator>>[abi:ne180100]<char,std::char_traits<char>>(v100, &v117);
    v102 = (_QWORD *)MEMORY[0x22E2C8C94](v101, &v119);
    v103 = std::operator>>[abi:ne180100]<char,std::char_traits<char>>(v102, &v117);
    v104 = (_QWORD *)MEMORY[0x22E2C8C94](v103, &v121);
    v105 = std::operator>>[abi:ne180100]<char,std::char_traits<char>>(v104, &v117);
    MEMORY[0x22E2C8C94](v105, &v118);
    std::istringstream::~istringstream((uint64_t)buf);
    v107 = v120;
    v106 = v121;
    v108 = v118;
    v109 = v119;
  }
  else
  {
    v106 = 8;
    v109 = 1;
    v108 = 9;
    v107 = 1;
  }
  v110 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    LODWORD(v127) = v94;
    WORD2(v127) = 1024;
    *(_DWORD *)((char *)&v127 + 6) = v107;
    WORD5(v127) = 1024;
    HIDWORD(v127) = v109;
    *(_WORD *)v128 = 1024;
    *(_DWORD *)&v128[2] = v106;
    LOWORD(v129[0]) = 1024;
    *(_DWORD *)((char *)v129 + 2) = v108;
    _os_log_impl(&dword_2293C9000, v110, OS_LOG_TYPE_DEFAULT, "[INFO  ] Options: duration,%d,sec,min,%d,step,%d,max,%d,kB,loops,%d", buf, 0x20u);
    v107 = v120;
    v106 = v121;
    v108 = v118;
    v109 = v119;
  }
  *(_DWORD *)buf = v107 << 10;
  LODWORD(v127) = v106 << 10;
  DWORD1(v127) = v109 << 10;
  DWORD2(v127) = v108;
  v111 = *((_QWORD *)this + 66);
  v124[0] = &off_24F20AAB0;
  v124[1] = this;
  v125 = v124;
  v112 = (uint64_t)v161;
  if (!v161)
    goto LABEL_218;
  if (v161 != v160)
  {
    v112 = (*(uint64_t (**)(void))(*v161 + 16))();
LABEL_218:
    v123 = (_BYTE *)v112;
    goto LABEL_220;
  }
  v123 = v122;
  (*(void (**)(_QWORD *, _BYTE *))(v160[0] + 24))(v160, v122);
LABEL_220:
  (*(void (**)(uint64_t, uint64_t, uint8_t *, _QWORD *, _BYTE *))(*(_QWORD *)v111 + 56))(v111, v94, buf, v124, v122);
  v113 = v123;
  if (v123 == v122)
  {
    v114 = 4;
    v113 = v122;
  }
  else
  {
    if (!v123)
      goto LABEL_225;
    v114 = 5;
  }
  (*(void (**)(void))(*v113 + 8 * v114))();
LABEL_225:
  v115 = v125;
  if (v125 == v124)
  {
    v116 = 4;
    v115 = v124;
    goto LABEL_229;
  }
  if (v125)
  {
    v116 = 5;
LABEL_229:
    (*(void (**)(void))(*v115 + 8 * v116))();
  }
  *((_DWORD *)this + 90) = 1000 * v94;
  MEMORY[0x22E2C8BA4]((char *)this + 496, "CommLoopback");
LABEL_203:
  result = v161;
  if (v161 == v160)
  {
    v99 = 4;
    result = v160;
  }
  else
  {
    if (!v161)
      return result;
    v99 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v99))();
}

void sub_2293CEE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;

  v23 = (_QWORD *)a20;
  if ((char *)a20 == &a17)
  {
    v24 = 4;
    v23 = &a17;
  }
  else
  {
    if (!a20)
      goto LABEL_6;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_6:
  v25 = *(_QWORD **)(v20 + 504);
  if (v25 == (_QWORD *)(v21 - 120))
  {
    v26 = 4;
    v25 = (_QWORD *)(v21 - 120);
  }
  else
  {
    if (!v25)
      goto LABEL_11;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_11:
  _Unwind_Resume(a1);
}

std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep GpsFactoryTest::BasicTimer::reset(GpsFactoryTest::BasicTimer *this)
{
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep result;

  result = std::chrono::steady_clock::now().__d_.__rep_;
  *(_QWORD *)this = result;
  *((_QWORD *)this + 16) = 0;
  return result;
}

uint64_t std::istringstream::basic_istringstream[abi:ne180100](uint64_t a1, const std::string *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  std::string::size_type v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v4 = MEMORY[0x24BEDB868];
  v5 = MEMORY[0x24BEDB868] + 64;
  *(_QWORD *)(a1 + 120) = MEMORY[0x24BEDB868] + 64;
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 8);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 16);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 16));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v4 + 24;
  *(_QWORD *)(a1 + 120) = v5;
  std::streambuf::basic_streambuf();
  v9 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_QWORD *)(a1 + 16) = v9;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 8;
  std::string::operator=((std::string *)(a1 + 80), a2);
  *(_QWORD *)(a1 + 104) = 0;
  v10 = *(_BYTE *)(a1 + 103);
  if (v10 < 0)
  {
    v11 = *(_QWORD *)(a1 + 80);
    v12 = *(_QWORD *)(a1 + 88);
  }
  else
  {
    v11 = a1 + 80;
    v12 = *(unsigned __int8 *)(a1 + 103);
  }
  v13 = *(_DWORD *)(a1 + 112);
  if ((v13 & 8) != 0)
  {
    *(_QWORD *)(a1 + 104) = v11 + v12;
    *(_QWORD *)(a1 + 32) = v11;
    *(_QWORD *)(a1 + 40) = v11;
    *(_QWORD *)(a1 + 48) = v11 + v12;
  }
  if ((v13 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 104) = v11 + v12;
    v14 = v10 < 0 ? (*(_QWORD *)(a1 + 96) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize((std::string *)(a1 + 80), v14, 0);
    v15 = *(char *)(a1 + 103) < 0 ? *(_QWORD *)(a1 + 88) : *(unsigned __int8 *)(a1 + 103);
    *(_QWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 64) = v11;
    *(_QWORD *)(a1 + 72) = v11 + v15;
    if ((*(_BYTE *)(a1 + 112) & 3) != 0)
    {
      if (v12 >> 31)
      {
        v16 = ((v12 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v17 = 0x7FFFFFFF * ((v16 + ((v12 - 0x80000000 - v16) >> 1)) >> 30);
        v11 += v17 + 0x7FFFFFFF;
        v12 = v12 - v17 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 64) = v11;
      }
      if (v12)
        *(_QWORD *)(a1 + 64) = v11 + v12;
    }
  }
  return a1;
}

void sub_2293CF320(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x22E2C8DFC](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::operator>>[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, _BYTE *a2)
{
  _QWORD *v4;
  _BYTE *v5;
  int v6;
  char v8;

  MEMORY[0x22E2C8C7C](&v8, a1, 0);
  if (v8)
  {
    v4 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v5 = (_BYTE *)v4[3];
    if (v5 == (_BYTE *)v4[4])
    {
      LODWORD(v4) = (*(uint64_t (**)(_QWORD *))(*v4 + 80))(v4);
      if ((_DWORD)v4 == -1)
      {
        v6 = 6;
        goto LABEL_6;
      }
    }
    else
    {
      v4[3] = v5 + 1;
      LOBYTE(v4) = *v5;
    }
    v6 = 0;
    *a2 = (_BYTE)v4;
LABEL_6:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v6);
  }
  return a1;
}

void sub_2293CF414(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x2293CF3E0);
  }
  __cxa_rethrow();
}

void sub_2293CF454(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::istringstream::~istringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7F8];
  v3 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x22E2C8DFC](a1 + 120);
  return a1;
}

uint64_t GpsFactoryTest::testInitialize(GpsFactoryTest *this)
{
  NSObject *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "testInitialize";
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "+%s", (uint8_t *)&v5, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)this + 364);
  *((std::chrono::steady_clock::time_point *)this + 28) = std::chrono::steady_clock::now();
  *((_QWORD *)this + 44) = 0;
  GpsFactoryTest::constructDevice(this);
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "testInitialize";
    _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEFAULT, "-%s", (uint8_t *)&v5, 0xCu);
  }
  usleep(0x4E20u);
  return 1;
}

unint64_t GpsFactoryTest::testPeriodicFix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  unsigned __int8 v6;
  unint64_t result;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[3];
  _QWORD *v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "testPeriodicFix";
    _os_log_debug_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEBUG, "+%s", buf, 0xCu);
  }
  v6 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v6 & 1) == 0)
    return 7;
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  v8 = *(_QWORD *)(a1 + 528);
  v15[0] = &off_24F20AB40;
  v15[1] = a1;
  v16 = v15;
  v13[0] = &off_24F20ABC0;
  v13[1] = a1;
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t, _QWORD *, _QWORD *))(*(_QWORD *)v8 + 24))(v8, a3, v15, v13);
  v9 = v14;
  if (v14 == v13)
  {
    v10 = 4;
    v9 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_10;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_10:
  v11 = v16;
  if (v16 == v15)
  {
    v12 = 4;
    v11 = v15;
    goto LABEL_14;
  }
  if (v16)
  {
    v12 = 5;
LABEL_14:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1)
    sleep(a3 + 1);
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testPeriodicFix");
  result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0)
    std::__throw_bad_optional_access[abi:ne180100]();
  return result;
}

void sub_2293CF7F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12, char a13, uint64_t a14, uint64_t a15, char *a16)
{
  uint64_t *v16;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a12;
  if (a12 == v16)
  {
    v19 = 4;
    v18 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_6:
  v20 = a16;
  if (a16 == &a13)
  {
    v21 = 4;
    v20 = &a13;
  }
  else
  {
    if (!a16)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

unint64_t GpsFactoryTest::testCw(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  NSObject *v13;
  _BOOL8 v14;
  unsigned __int8 v15;
  unint64_t result;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD *v23;
  _QWORD v24[3];
  _QWORD *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  unint64_t MachContinuousTimeNs;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v13 = GpsdLogObjectGeneral;
  v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    *(_DWORD *)buf = 136315394;
    v27 = "testCw";
    v28 = 2048;
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v14);
    _os_log_impl(&dword_2293C9000, v13, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  v15 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v15 & 1) == 0)
    return 7;
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  v17 = *(_QWORD *)(a1 + 528);
  v24[0] = &off_24F20AC40;
  v24[1] = a1;
  v25 = v24;
  v22[0] = &off_24F20ACC0;
  v22[1] = a1;
  v23 = v22;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD *, _QWORD *, double))(*(_QWORD *)v17 + 32))(v17, a4, a5, a6, a7, v24, v22, a2);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_10;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_10:
  v20 = v25;
  if (v25 == v24)
  {
    v21 = 4;
    v20 = v24;
    goto LABEL_14;
  }
  if (v25)
  {
    v21 = 5;
LABEL_14:
    (*(void (**)(void))(*v20 + 8 * v21))();
  }
  if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1)
    sleep(a4 + 1);
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testCw");
  result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0)
    std::__throw_bad_optional_access[abi:ne180100]();
  return result;
}

void sub_2293CFA88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12, char a13, uint64_t a14, uint64_t a15, char *a16)
{
  uint64_t *v16;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a12;
  if (a12 == v16)
  {
    v19 = 4;
    v18 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_6:
  v20 = a16;
  if (a16 == &a13)
  {
    v21 = 4;
    v20 = &a13;
  }
  else
  {
    if (!a16)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

unint64_t GpsFactoryTest::testModulated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  NSObject *v9;
  _BOOL8 v10;
  unsigned __int8 v11;
  unint64_t result;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD *v19;
  _QWORD v20[3];
  _QWORD *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  unint64_t MachContinuousTimeNs;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = GpsdLogObjectGeneral;
  v10 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    *(_DWORD *)buf = 136315394;
    v23 = "testModulated";
    v24 = 2048;
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v10);
    _os_log_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  v11 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v11 & 1) == 0)
    return 7;
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  v13 = *(_QWORD *)(a1 + 528);
  v20[0] = &off_24F20AD40;
  v20[1] = a1;
  v21 = v20;
  v18[0] = &off_24F20ADC0;
  v18[1] = a1;
  v19 = v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD *, _QWORD *))(*(_QWORD *)v13 + 40))(v13, a3, a4, a5, 0xFFFFFFFFLL, v20, v18);
  v14 = v19;
  if (v19 == v18)
  {
    v15 = 4;
    v14 = v18;
  }
  else
  {
    if (!v19)
      goto LABEL_10;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_10:
  v16 = v21;
  if (v21 == v20)
  {
    v17 = 4;
    v16 = v20;
    goto LABEL_14;
  }
  if (v21)
  {
    v17 = 5;
LABEL_14:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }
  if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1)
    sleep(a3 + 1);
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testModulated");
  result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0)
    std::__throw_bad_optional_access[abi:ne180100]();
  return result;
}

void sub_2293CFD04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12, char a13, uint64_t a14, uint64_t a15, char *a16)
{
  uint64_t *v16;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a12;
  if (a12 == v16)
  {
    v19 = 4;
    v18 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_6:
  v20 = a16;
  if (a16 == &a13)
  {
    v21 = 4;
    v20 = &a13;
  }
  else
  {
    if (!a16)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

unint64_t GpsFactoryTest::testApSignal(GpsFactoryTest *this)
{
  NSObject *v2;
  _BOOL8 v3;
  unsigned __int8 v4;
  unint64_t result;
  GnssHal::GpioEmbedded::GpioBackend *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  GnssHal::GpioEmbedded::GpioBackend *v11;
  uint64_t v12;
  unint64_t v13;
  GnssHal::GpioEmbedded::GpioBackend *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  unint64_t v18;
  BOOL v19;
  int v20;
  const char *v21;
  __int16 v22;
  unint64_t MachContinuousTimeNs;
  __int16 v24;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    v20 = 136315394;
    v21 = "testApSignal";
    v22 = 2048;
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3);
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", (uint8_t *)&v20, 0x16u);
  }
  v4 = atomic_load((unsigned __int8 *)this + 364);
  if ((v4 & 1) == 0)
    return 7;
  std::mutex::lock((std::mutex *)((char *)this + 432));
  atomic_store(1u, (unsigned int *)this + 92);
  std::condition_variable::notify_all((std::condition_variable *)this + 8);
  std::mutex::unlock((std::mutex *)((char *)this + 432));
  v7 = GnssHal::GpioEmbedded::GpioBackend::instance(v6);
  std::mutex::lock(&GnssHal::sMutex);
  *(_DWORD *)(v7 + 20) = 0;
  *(_DWORD *)(v7 + 24) = 0;
  std::mutex::unlock(&GnssHal::sMutex);
  v8 = *((_QWORD *)this + 66);
  v26[0] = &off_24F20AE40;
  v26[1] = this;
  v27 = v26;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v8 + 72))(v8, 1500, v26);
  v9 = v27;
  if (v27 == v26)
  {
    v10 = 4;
    v9 = v26;
    goto LABEL_9;
  }
  if (v27)
  {
    v10 = 5;
LABEL_9:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, "testApSignal");
  v11 = (GnssHal::GpioEmbedded::GpioBackend *)sleep(1u);
  v12 = GnssHal::GpioEmbedded::GpioBackend::instance(v11);
  std::mutex::lock(&GnssHal::sMutex);
  v13 = *(int *)(v12 + 20);
  std::mutex::unlock(&GnssHal::sMutex);
  v15 = GnssHal::GpioEmbedded::GpioBackend::instance(v14);
  std::mutex::lock(&GnssHal::sMutex);
  v16 = *(int *)(v15 + 24);
  std::mutex::unlock(&GnssHal::sMutex);
  v17 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315650;
    v21 = "testApSignal";
    v22 = 2048;
    MachContinuousTimeNs = v13;
    v24 = 2048;
    v25 = v16;
    _os_log_impl(&dword_2293C9000, v17, OS_LOG_TYPE_DEFAULT, "%s,zero transitions, %llu, one transitions, %llu,", (uint8_t *)&v20, 0x20u);
  }
  v18 = atomic_load((unint64_t *)this + 47);
  if ((v18 & 0xFF00000000) != 0 && v18 == 1)
  {
    if ((_DWORD)v16)
      v19 = (_DWORD)v13 == 0;
    else
      v19 = 1;
    if (v19)
      return 8;
    else
      return 1;
  }
  else
  {
    result = atomic_load((unint64_t *)this + 47);
    if ((result & 0xFF00000000) == 0)
      std::__throw_bad_optional_access[abi:ne180100]();
  }
  return result;
}

void sub_2293D0000(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;

  v19 = a17;
  if (a17 == v17)
  {
    v20 = 4;
    v19 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

unint64_t GpsFactoryTest::testTimeMark(GpsFactoryTest *this)
{
  NSObject *v2;
  _BOOL8 v3;
  unsigned __int8 v4;
  unint64_t result;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  unint64_t MachContinuousTimeNs;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    *(_DWORD *)buf = 136315394;
    v12 = "testTimeMark";
    v13 = 2048;
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3);
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  v4 = atomic_load((unsigned __int8 *)this + 364);
  if ((v4 & 1) == 0)
    return 7;
  std::mutex::lock((std::mutex *)((char *)this + 432));
  atomic_store(1u, (unsigned int *)this + 92);
  std::condition_variable::notify_all((std::condition_variable *)this + 8);
  std::mutex::unlock((std::mutex *)((char *)this + 432));
  v6 = *((_QWORD *)this + 66);
  v9[0] = &off_24F20AEC0;
  v9[1] = this;
  v10 = v9;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v6 + 80))(v6, 1500, v9);
  v7 = v10;
  if (v10 == v9)
  {
    v8 = 4;
    v7 = v9;
  }
  else
  {
    if (!v10)
      goto LABEL_10;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_10:
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, "testTimeMark");
  sleep(1u);
  result = atomic_load((unint64_t *)this + 47);
  if ((result & 0xFF00000000) == 0)
    std::__throw_bad_optional_access[abi:ne180100]();
  return result;
}

void sub_2293D01C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12)
{
  uint64_t *v12;
  uint64_t *v14;
  uint64_t v15;

  v14 = a12;
  if (a12 == v12)
  {
    v15 = 4;
    v14 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

unint64_t GpsFactoryTest::testCommPing(uint64_t a1)
{
  NSObject *v2;
  _BOOL8 v3;
  unsigned __int8 v4;
  unint64_t result;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unint64_t MachContinuousTimeNs;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    *(_DWORD *)buf = 136315394;
    v16 = "testCommPing";
    v17 = 2048;
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3);
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  v4 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v4 & 1) == 0)
    return 7;
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  v6 = *(_QWORD *)(a1 + 528);
  v13[0] = &off_24F20AF40;
  v13[1] = a1;
  v14 = v13;
  v11[0] = &off_24F20AFC0;
  v11[1] = a1;
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t, _QWORD *, _QWORD *))(*(_QWORD *)v6 + 88))(v6, 1500, v13, v11);
  v7 = v12;
  if (v12 == v11)
  {
    v8 = 4;
    v7 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_10;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_10:
  v9 = v14;
  if (v14 == v13)
  {
    v10 = 4;
    v9 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_15;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_15:
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testCommPing");
  sleep(1u);
  result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0)
    std::__throw_bad_optional_access[abi:ne180100]();
  return result;
}

void sub_2293D03D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12, char a13, uint64_t a14, uint64_t a15, char *a16)
{
  uint64_t *v16;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v18 = a12;
  if (a12 == v16)
  {
    v19 = 4;
    v18 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_6:
  v20 = a16;
  if (a16 == &a13)
  {
    v21 = 4;
    v20 = &a13;
  }
  else
  {
    if (!a16)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

unint64_t GpsFactoryTest::testPowerMode(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL8 v5;
  unsigned __int8 v6;
  unint64_t result;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  unint64_t MachContinuousTimeNs;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    *(_DWORD *)buf = 136315394;
    v14 = "testPowerMode";
    v15 = 2048;
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v5);
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  v6 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v6 & 1) == 0)
    return 7;
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  v8 = *(_QWORD *)(a1 + 528);
  v11[0] = &off_24F20B040;
  v11[1] = a1;
  v12 = v11;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v8 + 64))(v8, a2, v11);
  v9 = v12;
  if (v12 == v11)
  {
    v10 = 4;
    v9 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_10;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_10:
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testPowerMode");
  sleep(1u);
  result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0)
    std::__throw_bad_optional_access[abi:ne180100]();
  return result;
}

void sub_2293D05D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t *a12)
{
  uint64_t *v12;
  uint64_t *v14;
  uint64_t v15;

  v14 = a12;
  if (a12 == v12)
  {
    v15 = 4;
    v14 = &a9;
  }
  else
  {
    if (!a12)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *GpsFactoryTest::stringify@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  char *v4;

  v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "rxTimeNs=%12llu, gpsTimeNs=%12llu(%4.1f)", *(_QWORD *)(a2 + 24), *(_QWORD *)a2, *(float *)(a2 + 8));
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v5;
  void **v6;
  void *__p[2];
  char v9;

  v5 = (char *)(a1 + 544);
  GpsFactoryTest::stringify((int *)(a2 + 68), __p);
  if (v9 >= 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  snprintf(v5, 0x100uLL, "%s, ll=%6.3f,%6.3f, hUnc=%6.3f, alt=%6.3f(%6.3f), undul=%6.3f", (const char *)v6, *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 40), *(double *)(a2 + 16), *(double *)(a2 + 32), *(double *)(a2 + 24));
  if (v9 < 0)
    operator delete(__p[0]);
  return std::string::basic_string[abi:ne180100]<0>(a3, v5);
}

_QWORD *GpsFactoryTest::stringify@<X0>(uint64_t a1@<X0>, double *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v4;

  v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "hSpeed=%4.2f(%5.2f), vVel=%4.2f(%5.2f)", *a2, a2[1], a2[2], a2[3]);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

void GpsFactoryTest::stringify_json(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  std::string *v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  void **v10;
  std::string::size_type v11;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  __int128 v15;
  void **v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  void *__p[2];
  unsigned __int8 v22;
  void *v23[2];
  unsigned __int8 v24;
  std::string v25;
  std::string v26;
  std::string v27;
  std::string v28;
  std::string v29;
  std::string v30;

  GpsFactoryTest::stringify_json(a1, a2, &v25);
  v6 = std::string::insert(&v25, 0, "{\"fix\": {");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  v8 = std::string::append(&v26, ", ");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify_json(a1, a2 + 48, v23);
  if ((v24 & 0x80u) == 0)
    v10 = v23;
  else
    v10 = (void **)v23[0];
  if ((v24 & 0x80u) == 0)
    v11 = v24;
  else
    v11 = (std::string::size_type)v23[1];
  v12 = std::string::append(&v27, (const std::string::value_type *)v10, v11);
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v28.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  v14 = std::string::append(&v28, ", ");
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify_json(a1, (double *)(a2 + 136), __p);
  if ((v22 & 0x80u) == 0)
    v16 = __p;
  else
    v16 = (void **)__p[0];
  if ((v22 & 0x80u) == 0)
    v17 = v22;
  else
    v17 = (std::string::size_type)__p[1];
  v18 = std::string::append(&v29, (const std::string::value_type *)v16, v17);
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v30.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  v20 = std::string::append(&v30, "}}");
  *a3 = *v20;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);
  if ((char)v22 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
  if ((char)v24 < 0)
    operator delete(v23[0]);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
}

void sub_2293D0964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  uint64_t v47;

  if (*(char *)(v47 - 57) < 0)
    operator delete(*(void **)(v47 - 80));
  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v47 - 89) < 0)
    operator delete(*(void **)(v47 - 112));
  if (a47 < 0)
    operator delete(a42);
  if (a21 < 0)
    operator delete(a16);
  if (a40 < 0)
    operator delete(a35);
  if (a33 < 0)
    operator delete(a28);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

_QWORD *GpsFactoryTest::stringify_json@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  char *v4;

  v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "\"time\":{\"mClockNanoSeconds\":%12llu,\"mGpsNanoSeconds\":%12llu, \"mGpsTimeUncertaintyNanoSeconds\":%4.1f}", *(_QWORD *)(a2 + 24), *(_QWORD *)a2, *(float *)(a2 + 8));
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v5;
  void **v6;
  void *__p[2];
  char v9;

  v5 = (char *)(a1 + 544);
  GpsFactoryTest::stringify((int *)(a2 + 68), __p);
  if (v9 >= 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  snprintf(v5, 0x100uLL, "\"position\":{\"mReliability\":\"%s\",\"mLatitude\":%6.3f, \"mLongitude\":%6.3f,\"mSemiMajorHorizontalUncertainty\":%6.3f,\"mAltWgs84\":%6.3f,\"mVerticalUncertainty\":%6.3f,\"mUndulation\":%6.3f}", (const char *)v6, *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 40), *(double *)(a2 + 16), *(double *)(a2 + 32), *(double *)(a2 + 24));
  if (v9 < 0)
    operator delete(__p[0]);
  return std::string::basic_string[abi:ne180100]<0>(a3, v5);
}

_QWORD *GpsFactoryTest::stringify_json@<X0>(uint64_t a1@<X0>, double *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v4;

  v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "\"velocity\":{\"mHorizSpeed\":%4.2f,\"mHorizSpeedUnc\":%5.2f, \"mVertVelocity\":%4.2f,\"mVertVelocityUnc\":%5.2f}", *a2, a2[1], a2[2], a2[3]);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

uint64_t GpsFactoryTest::stringify@<X0>(int *a1@<X1>, _QWORD *a2@<X8>)
{
  int v3;
  const char *v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = *a1;
  if (*a1 <= 24)
  {
    if (!v3)
    {
      v4 = "NotSet";
      return MEMORY[0x22E2C8BA4](a2, v4);
    }
    if (v3 == 10)
    {
      v4 = "VeryLow";
      return MEMORY[0x22E2C8BA4](a2, v4);
    }
LABEL_12:
    v4 = "Error";
    return MEMORY[0x22E2C8BA4](a2, v4);
  }
  if (v3 == 25)
  {
    v4 = "Low";
    return MEMORY[0x22E2C8BA4](a2, v4);
  }
  if (v3 == 50)
  {
    v4 = "Medium";
    return MEMORY[0x22E2C8BA4](a2, v4);
  }
  if (v3 != 75)
    goto LABEL_12;
  v4 = "High";
  return MEMORY[0x22E2C8BA4](a2, v4);
}

void sub_2293D0C18(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void GpsFactoryTest::BasicTimer::waitUntil(GpsFactoryTest::BasicTimer *this, double a2)
{
  std::condition_variable *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  std::chrono::steady_clock::time_point v8;
  std::chrono::system_clock::time_point v9;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v11;
  std::unique_lock<std::mutex> v12;

  v3 = (std::condition_variable *)((char *)this + 8);
  v4 = (a2 * 1000000000.0 + (double)*(uint64_t *)this) / 1000000000.0;
  v12.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 56);
  v12.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 56));
  v5 = v4 * 1000000000.0;
  v6 = -9.22337204e18;
  if (v4 * 1000000000.0 > -9.22337204e18)
    v6 = v4 * 1000000000.0;
  if (v5 < 9.22337204e18)
    v7 = (uint64_t)v6;
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  while (!*((_BYTE *)this + 120) && v5 > (double)std::chrono::steady_clock::now().__d_.__rep_)
  {
    v8.__d_.__rep_ = v7 - std::chrono::steady_clock::now().__d_.__rep_;
    if (v8.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v9.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (!v9.__d_.__rep_)
      {
        v10 = 0;
        goto LABEL_17;
      }
      if (v9.__d_.__rep_ < 1)
      {
        if ((unint64_t)v9.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
          goto LABEL_16;
        v10 = 0x8000000000000000;
      }
      else
      {
        if ((unint64_t)v9.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          v10 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_17;
        }
LABEL_16:
        v10 = 1000 * v9.__d_.__rep_;
LABEL_17:
        if (v10 > (v8.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
        {
          v11.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:
          std::condition_variable::__do_timed_wait(v3, &v12, v11);
          std::chrono::steady_clock::now();
          goto LABEL_21;
        }
      }
      v11.__d_.__rep_ = v10 + v8.__d_.__rep_;
      goto LABEL_20;
    }
LABEL_21:
    if (v5 <= (double)std::chrono::steady_clock::now().__d_.__rep_)
      break;
  }
  if (v12.__owns_)
    std::mutex::unlock(v12.__m_);
}

std::string *GpsFactoryTest::Options::Options(std::string *this, const GpsFactoryTest::Options *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  std::string *v12;
  __int128 v13;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v5 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  v6 = *((_OWORD *)a2 + 4);
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = *((_OWORD *)a2 + 3);
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[2] = v6;
  v7 = *((_OWORD *)a2 + 5);
  v8 = *((_OWORD *)a2 + 6);
  v9 = *((_OWORD *)a2 + 7);
  *(_OWORD *)((char *)this[5].__r_.__value_.__r.__words + 4) = *(_OWORD *)((char *)a2 + 124);
  *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = v8;
  *(_OWORD *)&this[4].__r_.__value_.__r.__words[2] = v9;
  *(_OWORD *)&this[3].__r_.__value_.__r.__words[1] = v7;
  if (*((char *)a2 + 167) < 0)
  {
    std::string::__init_copy_ctor_external(this + 6, *((const std::string::value_type **)a2 + 18), *((_QWORD *)a2 + 19));
  }
  else
  {
    v10 = *((_OWORD *)a2 + 9);
    this[6].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 20);
    *(_OWORD *)&this[6].__r_.__value_.__l.__data_ = v10;
  }
  LODWORD(this[7].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 42);
  if (*((char *)a2 + 199) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 176), *((const std::string::value_type **)a2 + 22), *((_QWORD *)a2 + 23));
  }
  else
  {
    v11 = *((_OWORD *)a2 + 11);
    this[8].__r_.__value_.__r.__words[0] = *((_QWORD *)a2 + 24);
    *(_OWORD *)&this[7].__r_.__value_.__r.__words[1] = v11;
  }
  v12 = (std::string *)((char *)this + 200);
  if (*((char *)a2 + 223) < 0)
  {
    std::string::__init_copy_ctor_external(v12, *((const std::string::value_type **)a2 + 25), *((_QWORD *)a2 + 26));
  }
  else
  {
    v13 = *(_OWORD *)((char *)a2 + 200);
    this[9].__r_.__value_.__r.__words[0] = *((_QWORD *)a2 + 27);
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
  }
  return this;
}

void sub_2293D0EEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;

  if (*(char *)(v1 + 199) < 0)
    operator delete(*v4);
  if (*(char *)(v1 + 167) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
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
  __cxa_throw(exception, (struct type_info *)off_24F20A0C8, MEMORY[0x24BEDAAF0]);
}

void sub_2293D102C(_Unwind_Exception *a1)
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

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
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

BOOL std::less<std::string>::operator()[abi:ne180100](_QWORD *a1, _QWORD *a2)
{
  int v2;
  int v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = *((char *)a2 + 23);
  v3 = *((char *)a1 + 23);
  if (v3 >= 0)
    v4 = *((unsigned __int8 *)a1 + 23);
  else
    v4 = a1[1];
  if (v3 < 0)
    a1 = (_QWORD *)*a1;
  if (v2 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = a2[1];
  if (v2 < 0)
    a2 = (_QWORD *)*a2;
  if (v5 >= v4)
    v6 = v4;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
    return v7 < 0;
  else
    return v4 < v5;
}

void std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

VendorLogger *std::unique_ptr<VendorLogger>::reset[abi:ne180100](VendorLogger **a1, VendorLogger *a2)
{
  VendorLogger *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    VendorLogger::~VendorLogger(result);
    JUMPOUT(0x22E2C8E68);
  }
  return result;
}

uint64_t std::istreambuf_iterator<char>::equal[abi:ne180100](_QWORD **a1, _QWORD **a2)
{
  _QWORD *v4;
  _BOOL4 v5;
  _QWORD *v6;
  _BOOL4 v7;

  v4 = *a1;
  if (v4)
  {
    if (v4[3] != v4[4])
    {
      v5 = 0;
      goto LABEL_8;
    }
    if ((*(unsigned int (**)(_QWORD *))(*v4 + 72))(v4) != -1)
    {
      v5 = *a1 == 0;
      goto LABEL_8;
    }
    *a1 = 0;
  }
  v5 = 1;
LABEL_8:
  v6 = *a2;
  if (!*a2)
    goto LABEL_14;
  if (v6[3] == v6[4])
  {
    if ((*(unsigned int (**)(_QWORD *))(*v6 + 72))(v6) != -1)
    {
      v7 = *a2 == 0;
      return v5 ^ v7 ^ 1u;
    }
    *a2 = 0;
LABEL_14:
    v7 = 1;
    return v5 ^ v7 ^ 1u;
  }
  v7 = 0;
  return v5 ^ v7 ^ 1u;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20A550;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20A550;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::operator()(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  __int128 *v2;
  __int128 v3;

  v2 = *(__int128 **)(a1 + 8);
  if (*((char *)v2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)v2, *((_QWORD *)v2 + 1));
  }
  else
  {
    v3 = *v2;
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)v2 + 2);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::target_type()
{
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

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20A5E0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20A5E0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::operator()(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2;
  __int128 v3;

  v2 = *(_QWORD *)(a1 + 8);
  if (*(char *)(v2 + 223) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(v2 + 200), *(_QWORD *)(v2 + 208));
  }
  else
  {
    v3 = *(_OWORD *)(v2 + 200);
    a2->__r_.__value_.__r.__words[2] = *(_QWORD *)(v2 + 216);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::target_type()
{
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20A660;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20A660;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20A6F0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20A6F0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20A770;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20A770;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24F20A800;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24F20A800;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::operator()(uint64_t a1, std::string **a2)
{
  std::string *v2;
  char *v3;
  uint64_t v4;
  std::string *v5;
  size_t size;
  _BYTE *v7;
  unint64_t v8;
  char *v9;
  char *v11;
  int v12;
  char *v13;
  std::string *v14;
  NSObject *v15;
  std::string *v16;
  uint8_t buf[4];
  std::string *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = (char *)a2[1];
  if (*a2 != (std::string *)v3)
  {
    do
    {
      v4 = HIBYTE(v2->__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
      {
        v5 = (std::string *)v2->__r_.__value_.__r.__words[0];
        size = v2->__r_.__value_.__l.__size_;
      }
      else
      {
        v5 = v2;
        size = HIBYTE(v2->__r_.__value_.__r.__words[2]);
      }
      v7 = memchr(v5, 13, size);
      if (v7)
        v8 = (unint64_t)v7;
      else
        v8 = (unint64_t)v5 + size;
      v9 = (char *)(v8 + 1);
      if (v8 - (_QWORD)v5 != size && v9 != (char *)v5 + size)
      {
        v11 = (char *)v5 + size + ~v8;
        do
        {
          v12 = *v9;
          if (v12 != 13)
            *(_BYTE *)v8++ = v12;
          ++v9;
          --v11;
        }
        while (v11);
        v4 = HIBYTE(v2->__r_.__value_.__r.__words[2]);
      }
      if ((v4 & 0x80) != 0)
      {
        v14 = (std::string *)v2->__r_.__value_.__r.__words[0];
        v13 = (char *)(v2->__r_.__value_.__r.__words[0] + v2->__r_.__value_.__l.__size_);
      }
      else
      {
        v13 = (char *)v2 + v4;
        v14 = v2;
      }
      std::string::erase(v2, v8 - (_QWORD)v14, (std::string::size_type)&v13[-v8]);
      v15 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v2;
        if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
          v16 = (std::string *)v2->__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136315138;
        v18 = v16;
        _os_log_impl(&dword_2293C9000, v15, OS_LOG_TYPE_DEFAULT, "[NMEA  ] %s", buf, 0xCu);
      }
      ++v2;
    }
    while (v2 != (std::string *)v3);
  }
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24F20A890;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24F20A890;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::operator()(uint64_t a1, int *a2)
{
  int v2;
  uint64_t v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = GpsdLogObjectGeneral;
  v4 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (!v4)
      return;
    LOWORD(v8[0]) = 0;
    v5 = "[EVENT ] Succeed to set NMEA handler";
    v6 = v3;
    v7 = 2;
  }
  else
  {
    if (!v4)
      return;
    v8[0] = 67109120;
    v8[1] = v2;
    v5 = "[EVENT ] Failed to set NMEA handler %d";
    v6 = v3;
    v7 = 8;
  }
  _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v8, v7);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20A910;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20A910;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a2;
  *a2 = 0;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v2;
  GpsFactoryTest::fixCallback(v3, &v4);
  if (v2)
    JUMPOUT(0x22E2C8E68);
}

void sub_2293D1C14(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x22E2C8E68](v1, 0x1000C4043D32D5CLL);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20A9A0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20A9A0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *__p[3];

  v3 = *(void **)a2;
  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v4 = *(_QWORD *)(a1 + 8);
  memset(__p, 0, sizeof(__p));
  std::vector<gnssTest::RfMeasurement>::__init_with_size[abi:ne180100]<gnssTest::RfMeasurement*,gnssTest::RfMeasurement*>(__p, v3, v2, 0xCCCCCCCCCCCCCCCDLL * ((v2 - (uint64_t)v3) >> 3));
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)__p);
  if (__p[0])
    operator delete(__p[0]);
  if (v3)
    operator delete(v3);
}

void sub_2293D1D74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  void *v10;

  if (__p)
    operator delete(__p);
  if (v10)
    operator delete(v10);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

_QWORD *std::vector<gnssTest::RfMeasurement>::__init_with_size[abi:ne180100]<gnssTest::RfMeasurement*,gnssTest::RfMeasurement*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v5;
  _QWORD *v8;
  size_t v9;

  if (a4)
  {
    v5 = result;
    if (a4 >= 0x666666666666667)
      std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
    result = operator new(40 * a4);
    v8 = result;
    *v5 = result;
    v5[1] = result;
    v5[2] = &result[5 * a4];
    v9 = a3 - (_QWORD)a2;
    if (v9)
      result = memcpy(result, a2, v9);
    v5[1] = (char *)v8 + v9;
  }
  return result;
}

void sub_2293D1E80(_Unwind_Exception *exception_object)
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

void std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AA30;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AA30;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *__p[3];

  v3 = *(void **)a2;
  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v4 = *(_QWORD *)(a1 + 8);
  memset(__p, 0, sizeof(__p));
  std::vector<gnssTest::RfMeasurement>::__init_with_size[abi:ne180100]<gnssTest::RfMeasurement*,gnssTest::RfMeasurement*>(__p, v3, v2, 0xCCCCCCCCCCCCCCCDLL * ((v2 - (uint64_t)v3) >> 3));
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)__p);
  if (__p[0])
    operator delete(__p[0]);
  if (v3)
    operator delete(v3);
}

void sub_2293D1FA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  void *v10;

  if (__p)
    operator delete(__p);
  if (v10)
    operator delete(v10);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AAB0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AAB0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)a2 >> 10;
    v6 = *(_QWORD *)(a2 + 8) >> 10;
    v7 = *(_DWORD *)(a2 + 16) >> 10;
    v8 = *(_DWORD *)(a2 + 20) >> 10;
    v9 = 134218752;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    v15 = 1024;
    v16 = v8;
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "[EVENT ] loopback results: Tx %lld kB, Rx %lld kB, Tx %d KB/s, Rx %d KB/s", (uint8_t *)&v9, 0x22u);
  }
  GpsFactoryTest::BasicTimer::heartbeat((GpsFactoryTest::BasicTimer *)(v3 + 224));
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AB40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AB40;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a2;
  *a2 = 0;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v2;
  GpsFactoryTest::fixCallback(v3, &v4);
  if (v2)
    JUMPOUT(0x22E2C8E68);
}

void sub_2293D2278(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x22E2C8E68](v1, 0x1000C4043D32D5CLL);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20ABC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20ABC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AC40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AC40;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v2 = *((_QWORD *)a2 + 2);
  v3 = *a2;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = (void *)v3;
  v6 = v3;
  v7 = v2;
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)&v6);
  if (v5)
    operator delete(v5);
}

void sub_2293D246C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  if ((_QWORD)a9)
    operator delete((void *)a9);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20ACC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20ACC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AD40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AD40;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v2 = *((_QWORD *)a2 + 2);
  v3 = *a2;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = (void *)v3;
  v6 = v3;
  v7 = v2;
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)&v6);
  if (v5)
    operator delete(v5);
}

void sub_2293D2654(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  if ((_QWORD)a9)
    operator delete((void *)a9);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20ADC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20ADC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AE40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AE40;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AEC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AEC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AF40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AF40;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20AFC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20AFC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20B040;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20B040;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
  GpsFactoryTest::deviceInterfaceCallback(*(_QWORD *)(a1 + 8), *a2);
}

uint64_t std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::target_type()
{
}

uint64_t CoreGPSTestPreflight(void)
{
  _BOOL8 v0;
  uint64_t v1;
  _BOOL4 v2;
  _BOOL4 v3;
  int v4;
  unsigned int v5;
  void *__p[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(__p, "gpstool");
  v0 = isProcessRunning((char *)__p);
  v1 = v0;
  if ((v8 & 0x80000000) == 0)
  {
    if (!v0)
      goto LABEL_4;
    goto LABEL_3;
  }
  operator delete(__p[0]);
  if ((_DWORD)v1)
  {
LABEL_3:
    NSLog(CFSTR("[ERROR] It looks like gpstool is running\n\n"));
    v1 = 3;
  }
LABEL_4:
  std::string::basic_string[abi:ne180100]<0>(__p, "/usr/libexec/gpsd");
  v2 = isProcessRunning((char *)__p);
  v3 = v2;
  if (v8 < 0)
  {
    operator delete(__p[0]);
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v2)
  {
LABEL_6:
    NSLog(CFSTR("[ERROR] It looks like gpsd is running. Unload gpsd with:\n"));
    NSLog(CFSTR("  launchctl unload /System/Library/LaunchDaemons/com.apple.gpsd.plist\n\n"));
    v1 = 4;
  }
LABEL_7:
  v4 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if ((v4 - 201) >= 2)
  {
    v5 = v4 - 103;
    if (v5 > 4 || ((1 << v5) & 0x19) == 0)
    {
      NSLog(CFSTR("[ERROR] CoreGPSTest not supported on this platform\n"));
      return 6;
    }
  }
  return v1;
}

void sub_2293D2C20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

const __CFString *stringifyTest(unsigned int a1)
{
  if (a1 > 8)
    return CFSTR("Success");
  else
    return off_24F20B168[a1];
}

uint64_t errorCodeTranslator(unsigned int a1)
{
  if (a1 > 8)
    return 0;
  else
    return dword_2293F7004[a1];
}

uint64_t factTestReturnCodeTranslator(uint64_t a1)
{
  if (a1 < 9)
    return dword_2293F6FE0[(int)a1];
  NSLog(CFSTR("UnknownRetrunCode,%d"), a1);
  return 8;
}

uint64_t powerModeTranslator(int a1)
{
  return 4 * (a1 != 0);
}

uint64_t isEnableGpsTestForkProcess(void)
{
  unsigned int v0;

  v0 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
  return (v0 < 5) & (0x19u >> v0);
}

uint64_t forkProcessGpsTest(uint64_t a1, void *a2)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  uint64_t v16;

  v4 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
  v5 = v4 > 4;
  v6 = (1 << v4) & 0x19;
  if (v5 || v6 == 0)
  {
    MEMORY[0x22E2C8BA4](a1, "isEnableGpsTestForkProcess,0");
    return 2;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD17D8]);
    objc_msgSend(v8, "setLaunchPath:", CFSTR("/usr/local/bin/gpsfactorytest"));
    objc_msgSend(v8, "setArguments:", a2);
    NSLog(CFSTR("CommandArgument,%@"), objc_msgSend(a2, "componentsJoinedByString:", CFSTR(",")));
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD1740], "pipe");
    objc_msgSend(v8, "setStandardOutput:", v9);
    v10 = (void *)objc_msgSend(v9, "fileHandleForReading");
    objc_msgSend(v8, "launch");
    objc_msgSend(v8, "waitUntilExit");
    v11 = objc_msgSend(v8, "terminationStatus");
    v12 = objc_msgSend(v10, "readDataToEndOfFile");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
    std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(v13, "UTF8String"));
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    *(_OWORD *)a1 = v15;
    *(_QWORD *)(a1 + 16) = v16;
    NSLog(CFSTR("testResult,%d"), v11);
    NSLog(CFSTR("testOutput\n%@"), v13);

    return factTestReturnCodeTranslator(v11);
  }
}

void sub_2293D344C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2C8E68](v1, 0x10B2C4012DFF3E0);
  _Unwind_Resume(a1);
}

void sub_2293D3764(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2293D3868(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2293D3DA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  if (a32 < 0)
    operator delete(a27);
  if (a39 < 0)
    operator delete(a34);
  _Unwind_Resume(exception_object);
}

void sub_2293D3FDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2293D4178(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2293D42E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2293D4418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2293D4538(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *__assign_helper_atomic_property_(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  std::string::operator=((std::string *)a1, (const std::string *)a2);
  std::string::operator=((std::string *)(a1 + 24), (const std::string *)(a2 + 24));
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 124) = *(_OWORD *)(a2 + 124);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v5;
  *(_OWORD *)(a1 + 80) = v7;
  std::string::operator=((std::string *)(a1 + 144), (const std::string *)(a2 + 144));
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  std::string::operator=((std::string *)(a1 + 176), (const std::string *)(a2 + 176));
  return std::string::operator=((std::string *)(a1 + 200), (const std::string *)(a2 + 200));
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
  __cxa_throw(exception, (struct type_info *)off_24F20A0D0, MEMORY[0x24BEDAB00]);
}

void sub_2293D47F4(_Unwind_Exception *a1)
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

void executeCommand(const char *a1@<X0>, std::string *a2@<X8>)
{
  FILE *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::string::value_type __s[256];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v3 = popen(a1, "r");
  v4 = (std::__shared_weak_count *)operator new();
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_24F20B1C0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)v3;
  v4[1].__shared_owners_ = (uint64_t)MEMORY[0x24BDAF5A0];
  if (!v3)
    __assert_rtn("executeCommand", "TestUtil.mm", 20, "pipe && \"popen() failed!\"");
  while (!feof(v3))
  {
    if (fgets(__s, 256, v3))
      std::string::append(a2, __s);
  }
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_2293D4970(_Unwind_Exception *exception_object, int a2)
{
  FILE *v2;

  if (a2)
  {
    __cxa_begin_catch(exception_object);
    pclose(v2);
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2293D4990(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_2293D499C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_2293D49AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  std::shared_ptr<__sFILE>::~shared_ptr[abi:ne180100]((uint64_t)va);
  if (*(char *)(v2 + 23) < 0)
    operator delete(*(void **)v2);
  _Unwind_Resume(a1);
}

BOOL isProcessRunning(char *a1)
{
  std::string *v2;
  __int128 v3;
  void **v4;
  char v5;
  void *v6;
  std::string *v7;
  int64_t v8;
  int64_t v9;
  int64_t size;
  char *v11;
  char *v12;
  uint64_t v13;
  int v15;
  std::string *v16;
  int64_t v17;
  char *v18;
  std::string v19;
  void *__p[2];
  int64_t v21;

  std::operator+<char>();
  v2 = std::string::append(&v19, "'");
  v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v21 = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
  if (v21 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  executeCommand((const char *)v4, &v19);
  v5 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
  v6 = (void *)v19.__r_.__value_.__r.__words[0];
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v19;
  else
    v7 = (std::string *)v19.__r_.__value_.__r.__words[0];
  v8 = *((_QWORD *)a1 + 1);
  if (a1[23] >= 0)
  {
    v9 = a1[23];
  }
  else
  {
    a1 = *(char **)a1;
    v9 = v8;
  }
  if (v9)
  {
    if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
    else
      size = v19.__r_.__value_.__l.__size_;
    v11 = (char *)v7 + size;
    if (size >= v9)
    {
      v15 = *a1;
      v16 = v7;
      do
      {
        v17 = size - v9;
        if (v17 == -1)
          break;
        v18 = (char *)memchr(v16, v15, v17 + 1);
        if (!v18)
          break;
        v12 = v18;
        if (!memcmp(v18, a1, v9))
          goto LABEL_18;
        v16 = (std::string *)(v12 + 1);
        size = v11 - (v12 + 1);
      }
      while (size >= v9);
    }
    v12 = v11;
LABEL_18:
    if (v12 == v11)
      v13 = -1;
    else
      v13 = v12 - (char *)v7;
    if (v5 < 0)
      goto LABEL_22;
  }
  else
  {
    v13 = 0;
    if ((*((_BYTE *)&v19.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_22:
      operator delete(v6);
  }
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
  return v13 != -1;
}

void sub_2293D4B50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<__sFILE *,int (*)(__sFILE *),std::allocator<__sFILE>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E2C8E68);
}

uint64_t std::__shared_ptr_pointer<__sFILE *,int (*)(__sFILE *),std::allocator<__sFILE>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__sFILE *,int (*)(__sFILE *),std::allocator<__sFILE>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 32;
  else
    return 0;
}

uint64_t std::shared_ptr<__sFILE>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

_QWORD *GnssHal::ExtensionsFire::ExtensionsFire(_QWORD *this)
{
  *this = &unk_24F20B240;
  return this;
}

double GnssHal::ExtensionsFireImpl::getGpsCrossCorrelationMaxThreshold_dBHz(GnssHal::ExtensionsFireImpl *this)
{
  NSObject *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  GpsdPlatformInfo::instance(0);
  v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v3 = 134217984;
    v4 = 0x4042000000000000;
    _os_log_debug_impl(&dword_2293C9000, v1, OS_LOG_TYPE_DEBUG, "HalExtensions,getGpsCrossCorrelationMaxThreshold_dBHz,%f", (uint8_t *)&v3, 0xCu);
  }
  return 36.0;
}

double GnssHal::ExtensionsFireImpl::getGpsCrossCorrelationMinThreshold_dBHz(GnssHal::ExtensionsFireImpl *this)
{
  GpsdPlatformInfo *v1;
  double GpsCrossCorrelationMinThreshold_dBHz;
  NSObject *v3;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  GpsCrossCorrelationMinThreshold_dBHz = GpsdPlatformInfo::getGpsCrossCorrelationMinThreshold_dBHz(v1);
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = GpsCrossCorrelationMinThreshold_dBHz;
    _os_log_debug_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEBUG, "HalExtensions,getGpsCrossCorrelationMinThreshold_dBHz,%f", (uint8_t *)&v5, 0xCu);
  }
  return GpsCrossCorrelationMinThreshold_dBHz;
}

uint64_t GnssHal::ExtensionsFireImpl::externalToChipL5GroupDelayMeters(GnssHal::ExtensionsFireImpl *this)
{
  id *v1;

  v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::externalToChipL5GroupDelayMeters(v1);
}

void GnssHal::ExtensionsFireImpl::glonassPerFrequencyGroupDelayMeters(char **a1@<X8>)
{
  id *v3;

  v3 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::glonassPerFrequencyGroupDelayMeters(v3, a1);
}

uint64_t GnssHal::ExtensionsFireImpl::submitSoftwareRecoveryStatistics(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::isCntinAvailable(GnssHal::ExtensionsFireImpl *this)
{
  GpsdPlatformInfo *v1;
  unsigned int v2;
  BOOL v3;
  int v4;
  BOOL v5;

  v1 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  v2 = *((_DWORD *)v1 + 2) - 103;
  v3 = v2 >= 4;
  v5 = v2 == 4;
  v4 = (1 << v2) & 0x19;
  v5 = !v5 && v3 || v4 == 0;
  if (v5)
    return 0;
  else
    return GpsdPlatformInfo::isPhone(v1);
}

_QWORD *GnssHal::ExtensionsFireImpl::setCntinEnable(GnssHal::ExtensionsFireImpl *this)
{
  NSObject *v2;
  _QWORD *result;
  uint64_t v4;
  uint8_t v5[8];
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "#cntin,setCntinEnable", v5, 2u);
  }
  result = (_QWORD *)*((_QWORD *)this + 8);
  if (result)
  {
    v6[0] = &off_24F20B398;
    v6[1] = this;
    v7 = v6;
    (*(void (**)(_QWORD *, _QWORD *))(*result + 48))(result, v6);
    result = v7;
    if (v7 == v6)
    {
      v4 = 4;
      result = v6;
    }
    else
    {
      if (!v7)
        return result;
      v4 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
  }
  return result;
}

void sub_2293D4F74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::ExtensionsFireImpl::setCntinDisable(GnssHal::ExtensionsFireImpl *this)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "#cntin,setCntinDisable", v4, 2u);
  }
  result = *((_QWORD *)this + 12);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint8_t *GnssHal::ExtensionsFireImpl::setCntinStatusCb(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint8_t *result;
  uint64_t v10;
  uint8_t v11[24];
  uint8_t *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectWarning;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "#cntin,setCntinStatusCb", v11, 2u);
  }
  v5 = (_QWORD *)a2[3];
  if (v5)
  {
    if (v5 == a2)
    {
      v12 = v11;
      (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, v11);
    }
    else
    {
      v12 = (uint8_t *)(*(uint64_t (**)(_QWORD *))(*v5 + 16))(v5);
    }
  }
  else
  {
    v12 = 0;
  }
  v6 = a1 + 104;
  if (v11 != (uint8_t *)(a1 + 104))
  {
    v7 = v12;
    v8 = *(_QWORD *)(a1 + 128);
    if (v12 == v11)
    {
      if (v8 == v6)
      {
        (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v11 + 24))(v11, v13);
        (*(void (**)(uint8_t *))(*(_QWORD *)v12 + 32))(v12);
        v12 = 0;
        (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(a1 + 128) + 24))(*(_QWORD *)(a1 + 128), v11);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 128) + 32))(*(_QWORD *)(a1 + 128));
        *(_QWORD *)(a1 + 128) = 0;
        v12 = v11;
        (*(void (**)(_QWORD *, uint64_t))(v13[0] + 24))(v13, a1 + 104);
        (*(void (**)(_QWORD *))(v13[0] + 32))(v13);
      }
      else
      {
        (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v11 + 24))(v11, a1 + 104);
        (*(void (**)(uint8_t *))(*(_QWORD *)v12 + 32))(v12);
        v12 = *(uint8_t **)(a1 + 128);
      }
      *(_QWORD *)(a1 + 128) = v6;
    }
    else if (v8 == v6)
    {
      (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v6 + 24))(a1 + 104, v11);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 128) + 32))(*(_QWORD *)(a1 + 128));
      *(_QWORD *)(a1 + 128) = v12;
      v12 = v11;
    }
    else
    {
      v12 = *(uint8_t **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v7;
    }
  }
  result = v12;
  if (v12 == v11)
  {
    v10 = 4;
    result = v11;
  }
  else
  {
    if (!v12)
      return result;
    v10 = 5;
  }
  return (uint8_t *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v10))();
}

void sub_2293D5260(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void GnssHal::ExtensionsFireImpl::factoryTestXml(GnssHal::ExtensionsFireImpl *this@<X0>, std::string **a2@<X8>)
{
  uint64_t v3;
  NSObject *v4;
  void **v5;
  std::string *v6;
  std::string *v7;
  int v8;
  void *__p[2];
  int64_t v10;
  uint8_t buf[4];
  void **v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)this + 32);
  if (v3)
  {
    (*(void (**)(void **__return_ptr))(*(_QWORD *)v3 + 48))(__p);
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v5 = __p;
      if (v10 < 0)
        v5 = (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      v12 = v5;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "factoryTestXml,%s", buf, 0xCu);
    }
    v6 = (std::string *)operator new();
    v7 = v6;
    if (SHIBYTE(v10) < 0)
    {
      std::string::__init_copy_ctor_external(v6, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      v8 = SHIBYTE(v10);
      *a2 = v7;
      if (v8 < 0)
        operator delete(__p[0]);
    }
    else
    {
      *(_OWORD *)&v6->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      v6->__r_.__value_.__r.__words[2] = v10;
      *a2 = v6;
    }
  }
  else
  {
    *a2 = 0;
  }
}

void sub_2293D539C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x22E2C8E68](v15, 0x1012C40EC159624);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void GnssHal::ExtensionsFireImpl::factoryTestJob(GnssHal::ExtensionsFireImpl *this@<X0>, std::string **a2@<X8>)
{
  uint64_t v3;
  NSObject *v4;
  void **v5;
  std::string *v6;
  std::string *v7;
  int v8;
  void *__p[2];
  int64_t v10;
  uint8_t buf[4];
  void **v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)this + 36);
  if (v3)
  {
    (*(void (**)(void **__return_ptr))(*(_QWORD *)v3 + 48))(__p);
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v5 = __p;
      if (v10 < 0)
        v5 = (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      v12 = v5;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "factoryTestJob,%s", buf, 0xCu);
    }
    v6 = (std::string *)operator new();
    v7 = v6;
    if (SHIBYTE(v10) < 0)
    {
      std::string::__init_copy_ctor_external(v6, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      v8 = SHIBYTE(v10);
      *a2 = v7;
      if (v8 < 0)
        operator delete(__p[0]);
    }
    else
    {
      *(_OWORD *)&v6->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      v6->__r_.__value_.__r.__words[2] = v10;
      *a2 = v6;
    }
  }
  else
  {
    *a2 = 0;
  }
}

void sub_2293D5510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x22E2C8E68](v15, 0x1012C40EC159624);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

double GnssHal::ExtensionsFireImpl::bundleName@<D0>(uint64_t *a1@<X8>)
{
  GpsdPreferences *v3;
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;

  v3 = (GpsdPreferences *)GpsdPreferences::instance(0);
  GpsdPreferences::bundleName(v3, &v6);
  v4 = operator new();
  result = *(double *)&v6;
  *(_OWORD *)v4 = v6;
  *(_QWORD *)(v4 + 16) = v7;
  *a1 = v4;
  return result;
}

void sub_2293D55B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double GnssHal::ExtensionsFireImpl::nvStorePath@<D0>(uint64_t *a1@<X8>)
{
  id *v3;
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;

  v3 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::nvStorePath(v3, &v6);
  v4 = operator new();
  result = *(double *)&v6;
  *(_OWORD *)v4 = v6;
  *(_QWORD *)(v4 + 16) = v7;
  *a1 = v4;
  return result;
}

void sub_2293D5630(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *GnssHal::ExtensionsFireImpl::getGpsWeekFromBuildDate(GnssHal::ExtensionsFireImpl *this)
{
  if (*((_BYTE *)this + 296))
    return (char *)2049;
  else
    return gpsd::util::getGpsWeekFromBuildDate(this);
}

void GnssHal::ExtensionsFireImpl::setGnssChipInfo(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  NSObject *v5;
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  uint64_t *v9;
  __int16 v10;
  uint64_t *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0)
      v6 = a2;
    else
      v6 = (uint64_t *)*a2;
    if (*((char *)a3 + 23) >= 0)
      v7 = a3;
    else
      v7 = (uint64_t *)*a3;
    v8 = 136446467;
    v9 = v6;
    v10 = 2081;
    v11 = v7;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "#gdm,chipVersion,%{public}s,serial,%{private}s", (uint8_t *)&v8, 0x16u);
  }
}

BOOL GnssHal::ExtensionsFireImpl::supportsL5(GnssHal::ExtensionsFireImpl *this)
{
  id *v1;
  int v2;
  _BOOL8 result;

  v1 = (id *)GpsdPreferences::instance(0);
  v2 = GpsdPreferences::enableL5(v1);
  result = 0;
  if (v2)
    return *(_BYTE *)(GpsdPlatformInfo::instance(0) + 24) != 0;
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::debugFeaturesBitmask(GnssHal::ExtensionsFireImpl *this)
{
  id *v1;

  v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::debugFeaturesBitmask(v1);
}

uint64_t GnssHal::ExtensionsFireImpl::platformSpecificFeaturesBitmask(GnssHal::ExtensionsFireImpl *this)
{
  id *v1;

  v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::platformSpecificFeaturesBitmask(v1);
}

_QWORD *GnssHal::ExtensionsFireImpl::debugSettingsString@<X0>(_QWORD *a1@<X8>)
{
  id *v3;

  v3 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::debugSettingsString(v3, a1);
}

uint64_t GnssHal::ExtensionsFireImpl::updateReceiverClockAnalyticsData(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 160);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::updateRtcClockAnalyticsData(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 192);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::updateL5GroupDelayAnalyticsData(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 224);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::platform(GnssHal::ExtensionsFireImpl *this)
{
  id *v1;
  unsigned int v2;
  uint64_t result;
  NSObject *v4;
  uint8_t v5[16];

  v1 = (id *)GpsdPreferences::instance(0);
  v2 = GpsdPreferences::forceFireExtensionsPlatform(v1) + 1;
  if (v2 < 9 && ((0x199u >> v2) & 1) != 0)
    return dword_2293F7210[v2];
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 103)
    return 2;
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 106)
    return 3;
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107)
    return 4;
  v4 = GpsdLogObjectGeneral;
  result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_2293C9000, v4, OS_LOG_TYPE_FAULT, "UnknownPlatformExtensionFire", v5, 2u);
    return 0;
  }
  return result;
}

void GnssHal::ExtensionsFireImpl::~ExtensionsFireImpl(GnssHal::ExtensionsFireImpl *this)
{
  GnssHal::ExtensionsFireImpl::~ExtensionsFireImpl(this);
  JUMPOUT(0x22E2C8E68);
}

{
  char *v2;
  char *v3;
  uint64_t v4;
  GnssHal::ExtensionsFireImpl *v5;
  uint64_t v6;
  GnssHal::ExtensionsFireImpl *v7;
  uint64_t v8;
  GnssHal::ExtensionsFireImpl *v9;
  uint64_t v10;
  GnssHal::ExtensionsFireImpl *v11;
  uint64_t v12;
  GnssHal::ExtensionsFireImpl *v13;
  uint64_t v14;
  GnssHal::ExtensionsFireImpl *v15;
  uint64_t v16;
  GnssHal::ExtensionsFireImpl *v17;
  uint64_t v18;
  GnssHal::ExtensionsFireImpl *v19;
  uint64_t v20;

  *(_QWORD *)this = &off_24F20B428;
  v2 = (char *)this + 264;
  v3 = (char *)*((_QWORD *)this + 36);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 32);
  if (v5 == (GnssHal::ExtensionsFireImpl *)((char *)this + 232))
  {
    v6 = 4;
    v5 = (GnssHal::ExtensionsFireImpl *)((char *)this + 232);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  v7 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 28);
  if (v7 == (GnssHal::ExtensionsFireImpl *)((char *)this + 200))
  {
    v8 = 4;
    v7 = (GnssHal::ExtensionsFireImpl *)((char *)this + 200);
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
LABEL_16:
  v9 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 24);
  if (v9 == (GnssHal::ExtensionsFireImpl *)((char *)this + 168))
  {
    v10 = 4;
    v9 = (GnssHal::ExtensionsFireImpl *)((char *)this + 168);
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    v10 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v9 + 8 * v10))();
LABEL_21:
  v11 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 20);
  if (v11 == (GnssHal::ExtensionsFireImpl *)((char *)this + 136))
  {
    v12 = 4;
    v11 = (GnssHal::ExtensionsFireImpl *)((char *)this + 136);
  }
  else
  {
    if (!v11)
      goto LABEL_26;
    v12 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v11 + 8 * v12))();
LABEL_26:
  v13 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 16);
  if (v13 == (GnssHal::ExtensionsFireImpl *)((char *)this + 104))
  {
    v14 = 4;
    v13 = (GnssHal::ExtensionsFireImpl *)((char *)this + 104);
  }
  else
  {
    if (!v13)
      goto LABEL_31;
    v14 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v13 + 8 * v14))();
LABEL_31:
  v15 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 12);
  if (v15 == (GnssHal::ExtensionsFireImpl *)((char *)this + 72))
  {
    v16 = 4;
    v15 = (GnssHal::ExtensionsFireImpl *)((char *)this + 72);
  }
  else
  {
    if (!v15)
      goto LABEL_36;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_36:
  v17 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 8);
  if (v17 == (GnssHal::ExtensionsFireImpl *)((char *)this + 40))
  {
    v18 = 4;
    v17 = (GnssHal::ExtensionsFireImpl *)((char *)this + 40);
  }
  else
  {
    if (!v17)
      goto LABEL_41;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_41:
  v19 = (GnssHal::ExtensionsFireImpl *)*((_QWORD *)this + 4);
  if (v19 == (GnssHal::ExtensionsFireImpl *)((char *)this + 8))
  {
    v20 = 4;
    v19 = (GnssHal::ExtensionsFireImpl *)((char *)this + 8);
  }
  else
  {
    if (!v19)
      return;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x22E2C8E68);
}

void std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20B398;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20B398;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::operator()(uint64_t a1, int *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(v3 + 128);
  v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67240448;
    v7[1] = v2;
    v8 = 1026;
    v9 = v4 != 0;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_INFO, "#cntin,status,%{public}d,hasHandler,%{public}d", (uint8_t *)v7, 0xEu);
  }
  if (v4)
  {
    v7[0] = v2;
    v6 = *(_QWORD *)(v3 + 128);
    if (!v6)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v6 + 48))(v6, v7);
  }
}

uint64_t std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::target_type()
{
}

_QWORD *GnssHal::ExtensionsOlaf::ExtensionsOlaf(_QWORD *this)
{
  *this = &unk_24F20B500;
  return this;
}

_QWORD *GnssHal::ExtensionsOlafImpl::requestLtlInfo(_QWORD *result, uint64_t a2, _QWORD *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[24];
  _BYTE *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (result[4])
  {
    v4 = result;
    v5 = (_QWORD *)a3[3];
    if (v5)
    {
      if (v5 == a3)
      {
        v9 = v8;
        (*(void (**)(_QWORD *, _BYTE *))(*a3 + 24))(a3, v8);
      }
      else
      {
        v9 = (_BYTE *)(*(uint64_t (**)(_QWORD *))(*v5 + 16))(v5);
      }
    }
    else
    {
      v9 = 0;
    }
    v6 = v4[4];
    if (!v6)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v6 + 48))(v6, a2, v8);
    result = v9;
    if (v9 == v8)
    {
      v7 = 4;
      result = v8;
    }
    else
    {
      if (!v9)
        return result;
      v7 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v7))();
  }
  return result;
}

void sub_2293D5E14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  _Unwind_Resume(exception_object);
}

double GnssHal::ExtensionsOlafImpl::groupDelayL1InCAChips(GnssHal::ExtensionsOlafImpl *this)
{
  id *v1;
  double v2;
  double v3;
  NSObject *v4;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::groupDelayL1InCAChips(v1);
  v3 = v2;
  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "ExtensionsOlafImpl,groupDelayL1InCAChips,%f", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

uint64_t GnssHal::ExtensionsOlafImpl::enableInertialFusion(GnssHal::ExtensionsOlafImpl *this)
{
  id *v1;

  v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::isRavenExpected(v1) ^ 1;
}

BOOL GnssHal::ExtensionsOlafImpl::platform(GnssHal::ExtensionsOlafImpl *this)
{
  uint64_t v1;
  _BOOL8 result;
  NSObject *v3;
  uint8_t v4[16];

  v1 = GpsdPlatformInfo::instance(0);
  result = 0;
  if (*(_DWORD *)(v1 + 8) != 201)
  {
    if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 202)
    {
      return 1;
    }
    else
    {
      v3 = GpsdLogObjectGeneral;
      result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_WORD *)v4 = 0;
        _os_log_fault_impl(&dword_2293C9000, v3, OS_LOG_TYPE_FAULT, "Unhandled platform in ExtensionsOlaf", v4, 2u);
        return 0;
      }
    }
  }
  return result;
}

char *GnssHal::ExtensionsOlafImpl::getGpsWeekFromBuildDate(GnssHal::ExtensionsOlafImpl *this)
{
  if (*((_BYTE *)this + 104))
    return (char *)2049;
  else
    return gpsd::util::getGpsWeekFromBuildDate(this);
}

uint64_t GnssHal::ExtensionsOlafImpl::supportsL5(GnssHal::ExtensionsOlafImpl *this)
{
  return *(unsigned __int8 *)(GpsdPlatformInfo::instance(0) + 24);
}

void GnssHal::ExtensionsOlafImpl::requestBasebandReset(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  const std::string::value_type *v7;
  uint64_t v8;
  NSObject *v9;
  std::string __p;
  std::string v11;
  std::string v12;
  std::string v13;
  uint8_t buf[4];
  _BYTE v15[14];
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (const std::string::value_type *)a3;
    if (*(char *)(a3 + 23) < 0)
      v7 = *(const std::string::value_type **)a3;
    *(_DWORD *)buf = 67240451;
    *(_DWORD *)v15 = a2;
    *(_WORD *)&v15[4] = 2081;
    *(_QWORD *)&v15[6] = v7;
    _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEFAULT, "#bbReset,extensionsOlaf,%{public}d,%{private}s", buf, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 64);
  if (!v8)
  {
    v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "requestBasebandReset invoked without a handler", buf, 2u);
      v9 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v15 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalExtensionsOlafImpl.mm";
      *(_WORD *)&v15[8] = 1026;
      *(_DWORD *)&v15[10] = 58;
      v16 = 2082;
      v17 = "requestBasebandReset";
      _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v13, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v12, "requestBasebandReset");
    std::string::basic_string[abi:ne180100]<0>(&v11, "requestBasebandReset invoked without a handler");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v13, (uint64_t)&v12, (uint64_t)&v11);
    std::string::~string(&v11);
    std::string::~string(&v12);
    std::string::~string(&v13);
    __assert_rtn("requestBasebandReset", "GnssHalExtensionsOlafImpl.mm", 58, "false && \"requestBasebandReset invoked without a handler\"");
  }
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
    v8 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = a2;
    if (!v8)
      std::__throw_bad_function_call[abi:ne180100]();
  }
  else
  {
    __p = *(std::string *)a3;
    *(_DWORD *)buf = a2;
  }
  (*(void (**)(uint64_t, uint8_t *, std::string *))(*(_QWORD *)v8 + 48))(v8, buf, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_2293D6270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void GnssHal::ExtensionsOlafImpl::~ExtensionsOlafImpl(GnssHal::ExtensionsOlafImpl *this)
{
  char *v2;
  char *v3;
  uint64_t v4;
  GnssHal::ExtensionsOlafImpl *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24F20B598;
  v2 = (char *)this + 40;
  v3 = (char *)*((_QWORD *)this + 8);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (GnssHal::ExtensionsOlafImpl *)*((_QWORD *)this + 4);
  if (v5 == (GnssHal::ExtensionsOlafImpl *)((char *)this + 8))
  {
    v6 = 4;
    v5 = (GnssHal::ExtensionsOlafImpl *)((char *)this + 8);
  }
  else
  {
    if (!v5)
      return;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
}

{
  char *v2;
  char *v3;
  uint64_t v4;
  GnssHal::ExtensionsOlafImpl *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24F20B598;
  v2 = (char *)this + 40;
  v3 = (char *)*((_QWORD *)this + 8);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v5 = (GnssHal::ExtensionsOlafImpl *)*((_QWORD *)this + 4);
  if (v5 == (GnssHal::ExtensionsOlafImpl *)((char *)this + 8))
  {
    v6 = 4;
    v5 = (GnssHal::ExtensionsOlafImpl *)((char *)this + 8);
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_11:
  JUMPOUT(0x22E2C8E68);
}

uint64_t GnssHal::ExtensionsOlafImpl::debugFeaturesBitmask(GnssHal::ExtensionsOlafImpl *this)
{
  return 0;
}

uint64_t GnssHal::ExtensionsOlafImpl::platformSpecificFeaturesBitmask(GnssHal::ExtensionsOlafImpl *this)
{
  return 0;
}

void GnssHal::ExtensionsOlafImpl::debugSettingsString(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

double GnssHal::ExtensionsOlafImpl::crossCorrelationSettings(GnssHal::ExtensionsOlafImpl *this)
{
  return *((double *)this + 9);
}

uint64_t proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto(proto::gnsshal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  wireless_diagnostics::google::protobuf::DescriptorPool *v4;
  uint64_t FileByName;
  uint64_t v6;
  wireless_diagnostics::google::protobuf::DescriptorPool *v7;
  uint64_t v8;
  wireless_diagnostics::google::protobuf::DescriptorPool *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  void *__p[2];
  char v14;

  proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(this, a2, a3, a4);
  wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "GnssHalNvStore.proto");
  FileByName = wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName();
  v6 = FileByName;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (!v6)
    {
LABEL_5:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
    }
  }
  else if (!FileByName)
  {
    goto LABEL_5;
  }
  _MergedGlobals = *(_QWORD *)(v6 + 80);
  v7 = (wireless_diagnostics::google::protobuf::DescriptorPool *)operator new();
  wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(v7);
  MEMORY[0x22E2C8904]();
  wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection();
  v8 = *(_QWORD *)(v6 + 80) + 120;
  qword_255A4BD90 = (uint64_t)v7;
  qword_255A4BD98 = v8;
  v9 = (wireless_diagnostics::google::protobuf::DescriptorPool *)operator new();
  v10 = wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(v9);
  MEMORY[0x22E2C8904](v10, v11);
  result = wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection();
  qword_255A4BDA0 = (uint64_t)v9;
  return result;
}

void sub_2293D65E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&__p);
  _Unwind_Resume(a1);
}

void proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(proto::gnsshal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  proto::gnsshal::NvStore *v4;
  proto::gnsshal::NvStoreItem *v5;
  void (*v6)(void);

  if ((proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(void)::already_here & 1) == 0)
  {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(void)::already_here = 1;
    wireless_diagnostics::google::protobuf::internal::VerifyVersion((wireless_diagnostics::google::protobuf::internal *)0x1E9808, 2005000, (uint64_t)"Sources/Protobuf/Generated/GnssHalNvStore.pb.cc", a4);
    wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile((wireless_diagnostics::google::protobuf::DescriptorPool *)"\n\x14GnssHalNvStore.proto\x12\rproto.gnsshal\"I\n\aNvStore\x12\x13\n\aversion\x18\x01 \x01(\x05:\x02-1\x12)\n\x05items\x18\x02 \x03(\v2\x1A.proto.gnsshal.NvStoreItem\"\xB9\x01\n\vNvStoreItem\x12\n\n\x02id\x18\x01 \x01(\x03\x12\f\n\x04blob\x18\x02 \x01(\f\x12 \n\x15blob_truncated_sha256\x18\x03 \x01(\r:\x010\x12\x1E\n\x12modification_count\x18\x04 \x01(\x03:\x02-1\x12$\n\x18creation_cf_time_seconds\x18\x05 \x01(\x01:\x02-1\x12(\n\x1Cmodification_cf_time_seconds\x18\x06 \x01(\x01:\x02-1", (const void *)0x12C);
    wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile();
    v4 = (proto::gnsshal::NvStore *)operator new();
    proto::gnsshal::NvStore::NvStore(v4);
    proto::gnsshal::NvStore::default_instance_ = (uint64_t)v4;
    v5 = (proto::gnsshal::NvStoreItem *)operator new();
    proto::gnsshal::NvStoreItem::NvStoreItem(v5);
    proto::gnsshal::NvStoreItem::default_instance_ = (uint64_t)v5;
    wireless_diagnostics::google::protobuf::internal::OnShutdown((wireless_diagnostics::google::protobuf::internal *)proto::gnsshal::protobuf_ShutdownFile_GnssHalNvStore_2eproto, v6);
  }
}

void sub_2293D6714(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  MEMORY[0x22E2C8E68](v2, 0x10A1C40F05C313FLL);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::protobuf_ShutdownFile_GnssHalNvStore_2eproto(proto::gnsshal *this)
{
  uint64_t result;

  if (proto::gnsshal::NvStore::default_instance_)
    (*(void (**)(uint64_t))(*(_QWORD *)proto::gnsshal::NvStore::default_instance_ + 8))(proto::gnsshal::NvStore::default_instance_);
  if (qword_255A4BD90)
    (*(void (**)(uint64_t))(*(_QWORD *)qword_255A4BD90 + 8))(qword_255A4BD90);
  if (proto::gnsshal::NvStoreItem::default_instance_)
    (*(void (**)(uint64_t))(*(_QWORD *)proto::gnsshal::NvStoreItem::default_instance_ + 8))(proto::gnsshal::NvStoreItem::default_instance_);
  result = qword_255A4BDA0;
  if (qword_255A4BDA0)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)qword_255A4BDA0 + 8))(qword_255A4BDA0);
  return result;
}

uint64_t proto::gnsshal::`anonymous namespace'::protobuf_RegisterTypes(proto::gnsshal *a1)
{
  uint64_t v1;
  proto::gnsshal *v2;
  _QWORD v4[2];
  char v5;

  v1 = qword_255A4BDA8;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v4[0] = MEMORY[0x24BEDDBA8] + 16;
    v4[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    v5 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v4);
  }
  if (!proto::gnsshal::NvStore::default_instance_)
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(a1);
  v2 = (proto::gnsshal *)wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage();
  if (!proto::gnsshal::NvStoreItem::default_instance_)
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(v2);
  return wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage();
}

void sub_2293D6878(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

proto::gnsshal::NvStore *proto::gnsshal::NvStore::NvStore(proto::gnsshal::NvStore *this)
{
  *(_QWORD *)this = off_24F20B660;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStore *)((char *)this + 8));
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = 0xFFFFFFFFLL;
  *((_DWORD *)this + 12) = 0;
  return this;
}

double proto::gnsshal::NvStore::SharedCtor(proto::gnsshal::NvStore *this)
{
  double result;

  *(_QWORD *)&result = 0xFFFFFFFFLL;
  *((_QWORD *)this + 5) = 0xFFFFFFFFLL;
  *((_DWORD *)this + 12) = 0;
  return result;
}

proto::gnsshal::NvStore *proto::gnsshal::NvStore::NvStore(proto::gnsshal::NvStore *this, const proto::gnsshal::NvStore *a2)
{
  *(_QWORD *)this = off_24F20B660;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStore *)((char *)this + 8));
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = 0xFFFFFFFFLL;
  *((_DWORD *)this + 12) = 0;
  proto::gnsshal::NvStore::MergeFrom(this, a2);
  return this;
}

void sub_2293D6970(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>(v3);
  MEMORY[0x22E2C894C](v2);
  MEMORY[0x22E2C89F4](v1);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::MergeFrom(proto::gnsshal::NvStore *this, const proto::gnsshal::NvStore *a2)
{
  uint64_t v4;
  const proto::gnsshal::NvStoreItem *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  proto::gnsshal::NvStoreItem *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _BYTE v14[48];

  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v14);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((proto::gnsshal::NvStore *)((char *)this + 16));
  if (*((int *)a2 + 6) >= 1)
  {
    v4 = 0;
    do
    {
      v5 = *(const proto::gnsshal::NvStoreItem **)(*((_QWORD *)a2 + 2) + 8 * v4);
      v6 = *((_DWORD *)this + 7);
      v7 = *((int *)this + 6);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 8))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((proto::gnsshal::NvStore *)((char *)this + 16));
          v6 = *((_DWORD *)this + 7);
        }
        *((_DWORD *)this + 7) = v6 + 1;
        v9 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
        v10 = *((_QWORD *)this + 2);
        v11 = *((int *)this + 6);
        *((_DWORD *)this + 6) = v11 + 1;
        *(_QWORD *)(v10 + 8 * v11) = v9;
      }
      else
      {
        v8 = *((_QWORD *)this + 2);
        *((_DWORD *)this + 6) = v7 + 1;
        v9 = *(proto::gnsshal::NvStoreItem **)(v8 + 8 * v7);
      }
      proto::gnsshal::NvStoreItem::MergeFrom(v9, v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 6));
  }
  if ((*((_BYTE *)a2 + 48) & 1) != 0)
  {
    v12 = *((_DWORD *)a2 + 10);
    *((_DWORD *)this + 12) |= 1u;
    *((_DWORD *)this + 10) = v12;
  }
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom((proto::gnsshal::NvStore *)((char *)this + 8), (const proto::gnsshal::NvStore *)((char *)a2 + 8));
}

void sub_2293D6AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void proto::gnsshal::NvStore::~NvStore(proto::gnsshal::NvStore *this)
{
  *(_QWORD *)this = off_24F20B660;
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>((uint64_t *)this + 2);
  MEMORY[0x22E2C894C]((char *)this + 8);
  JUMPOUT(0x22E2C89F4);
}

{
  proto::gnsshal::NvStore::~NvStore(this);
}

void sub_2293D6B58()
{
  JUMPOUT(0x22E2C8E68);
}

uint64_t proto::gnsshal::NvStore::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 44) = a2;
  return this;
}

uint64_t proto::gnsshal::NvStore::descriptor(proto::gnsshal::NvStore *this)
{
  uint64_t v1;
  _QWORD v3[2];
  char v4;

  v1 = qword_255A4BDA8;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x24BEDDBA8] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return _MergedGlobals;
}

void sub_2293D6BE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::default_instance(proto::gnsshal::NvStore *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result;

  result = proto::gnsshal::NvStore::default_instance_;
  if (!proto::gnsshal::NvStore::default_instance_)
  {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(0, a2, a3, a4);
    return proto::gnsshal::NvStore::default_instance_;
  }
  return result;
}

proto::gnsshal::NvStore *proto::gnsshal::NvStore::New(proto::gnsshal::NvStore *this)
{
  proto::gnsshal::NvStore *v1;

  v1 = (proto::gnsshal::NvStore *)operator new();
  proto::gnsshal::NvStore::NvStore(v1);
  return v1;
}

void sub_2293D6C64(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2C8E68](v1, 0x10A1C407FBCBAABLL);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::Clear(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  wireless_diagnostics::google::protobuf::UnknownFieldSet *v4;
  uint64_t v5;

  v1 = this;
  if (*(_BYTE *)(this + 48))
    *(_DWORD *)(this + 40) = -1;
  if (*(int *)(this + 24) >= 1)
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8 * v2);
      this = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
      ++v2;
    }
    while (v2 < *(int *)(v1 + 24));
  }
  v5 = *(_QWORD *)(v1 + 8);
  v4 = (wireless_diagnostics::google::protobuf::UnknownFieldSet *)(v1 + 8);
  *((_DWORD *)v4 + 4) = 0;
  *((_DWORD *)v4 + 10) = 0;
  if (v5)
    return wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(v4);
  return this;
}

uint64_t proto::gnsshal::NvStore::MergePartialFromCodedStream(proto::gnsshal::NvStore *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *v6;
  char *v7;
  char *v8;
  uint64_t TagFallback;
  int v10;
  char *v11;
  unint64_t v12;
  unsigned int v13;
  _BYTE *v14;
  uint64_t result;
  int v16;
  uint64_t v17;
  uint64_t v18;
  proto::gnsshal::NvStoreItem *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int v23;
  int v24;
  uint64_t v25;
  wireless_diagnostics::google::protobuf::UnknownFieldSet *v26;
  int v27;
  BOOL v28;
  int v29;
  _BYTE *v30;
  unsigned int v31;
  unsigned int v32;

  v6 = (proto::gnsshal::NvStore *)((char *)this + 16);
  v7 = (char *)this + 8;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v8 = (char *)*((_QWORD *)a2 + 1);
        if ((unint64_t)v8 >= *((_QWORD *)a2 + 2) || *v8 < 0)
        {
          TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
          *((_DWORD *)a2 + 8) = TagFallback;
          if (!(_DWORD)TagFallback)
            return 1;
        }
        else
        {
          TagFallback = *v8;
          *((_DWORD *)a2 + 8) = TagFallback;
          *((_QWORD *)a2 + 1) = v8 + 1;
          if (!(_DWORD)TagFallback)
            return 1;
        }
        if (TagFallback >> 3 != 1)
          break;
        v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0)
          goto LABEL_16;
        v31 = 0;
        v11 = (char *)*((_QWORD *)a2 + 1);
        v12 = *((_QWORD *)a2 + 2);
        if ((unint64_t)v11 >= v12 || *v11 < 0)
        {
          result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v31);
          if (!(_DWORD)result)
            return result;
          v13 = v31;
          v14 = (_BYTE *)*((_QWORD *)a2 + 1);
          v12 = *((_QWORD *)a2 + 2);
        }
        else
        {
          v13 = *v11;
          v14 = v11 + 1;
          *((_QWORD *)a2 + 1) = v14;
        }
        *((_DWORD *)this + 10) = v13;
        *((_DWORD *)this + 12) |= 1u;
        if ((unint64_t)v14 < v12 && *v14 == 18)
          goto LABEL_23;
      }
      if (TagFallback >> 3 != 2)
        break;
      v10 = TagFallback & 7;
      if (v10 != 2)
        goto LABEL_16;
      while (1)
      {
        v16 = *((_DWORD *)this + 7);
        v17 = *((int *)this + 6);
        if ((int)v17 >= v16)
        {
          if (v16 == *((_DWORD *)this + 8))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v6);
            v16 = *((_DWORD *)this + 7);
          }
          *((_DWORD *)this + 7) = v16 + 1;
          v19 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
          v20 = *((_QWORD *)this + 2);
          v21 = *((int *)this + 6);
          *((_DWORD *)this + 6) = v21 + 1;
          *(_QWORD *)(v20 + 8 * v21) = v19;
        }
        else
        {
          v18 = *((_QWORD *)this + 2);
          *((_DWORD *)this + 6) = v17 + 1;
          v19 = *(proto::gnsshal::NvStoreItem **)(v18 + 8 * v17);
        }
        v32 = 0;
        v22 = (char *)*((_QWORD *)a2 + 1);
        if ((unint64_t)v22 >= *((_QWORD *)a2 + 2) || *v22 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v32))return 0;
        }
        else
        {
          v32 = *v22;
          *((_QWORD *)a2 + 1) = v22 + 1;
        }
        v23 = *((_DWORD *)a2 + 14);
        v24 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v23 + 1;
        if (v23 >= v24)
          return 0;
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!proto::gnsshal::NvStoreItem::MergePartialFromCodedStream(v19, a2, v25, v26)
          || !*((_BYTE *)a2 + 36))
        {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        v27 = *((_DWORD *)a2 + 14);
        v28 = __OFSUB__(v27, 1);
        v29 = v27 - 1;
        if (v29 < 0 == v28)
          *((_DWORD *)a2 + 14) = v29;
        v14 = (_BYTE *)*((_QWORD *)a2 + 1);
        v30 = (_BYTE *)*((_QWORD *)a2 + 2);
        if (v14 >= v30 || *v14 != 18)
          break;
LABEL_23:
        *((_QWORD *)a2 + 1) = v14 + 1;
      }
      if (v14 == v30 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
      {
        *((_DWORD *)a2 + 8) = 0;
        result = 1;
        *((_BYTE *)a2 + 36) = 1;
        return result;
      }
    }
    v10 = TagFallback & 7;
LABEL_16:
    if (v10 == 4)
      return 1;
    if ((wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, (uint64_t)v7, a4) & 1) == 0)return 0;
  }
}

uint64_t proto::gnsshal::NvStore::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  wireless_diagnostics::google::protobuf::internal::WireFormat *v8;
  _QWORD *v9;

  v5 = this;
  if ((*(_BYTE *)(this + 48) & 1) != 0)
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 40), (uint64_t)a2, a4);
  if (*(int *)(v5 + 24) >= 1)
  {
    v6 = 0;
    do
    {
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray();
      ++v6;
    }
    while (v6 < *(int *)(v5 + 24));
  }
  v9 = *(_QWORD **)(v5 + 8);
  v8 = (wireless_diagnostics::google::protobuf::internal::WireFormat *)(v5 + 8);
  v7 = v9;
  if (v9)
  {
    if (*v7 != v7[1])
      return wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFields(v8, a2, a3);
  }
  return this;
}

unsigned __int8 *proto::gnsshal::NvStore::SerializeWithCachedSizesToArray(proto::gnsshal::NvStore *this, wireless_diagnostics::google::protobuf::UnknownFieldSet *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  unsigned __int8 *v4;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v11;
  unsigned __int8 *v12;
  _QWORD *v13;
  wireless_diagnostics::google::protobuf::internal::WireFormat *v14;
  _QWORD *v15;

  v4 = (unsigned __int8 *)a2;
  if ((*((_BYTE *)this + 48) & 1) != 0)
  {
    v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((int *)this + 10);
    *(_BYTE *)a2 = 8;
    v7 = (char *)a2 + 1;
    if ((v6 & 0x80000000) != 0)
    {
      v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(v6, (uint64_t)v7, a3);
    }
    else
    {
      if (v6 <= 0x7F)
      {
        v4[1] = v6;
        v4 += 2;
        goto LABEL_8;
      }
      v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v6, (uint64_t)v7, a3);
    }
    v4 = (unsigned __int8 *)v8;
  }
LABEL_8:
  if (*((int *)this + 6) >= 1)
  {
    v9 = 0;
    do
    {
      v10 = *(unsigned int **)(*((_QWORD *)this + 2) + 8 * v9);
      *v4 = 18;
      v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v10[15];
      if (v11 > 0x7F)
      {
        v12 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v11, (uint64_t)(v4 + 1), a3);
      }
      else
      {
        v4[1] = v11;
        v12 = v4 + 2;
      }
      v4 = proto::gnsshal::NvStoreItem::SerializeWithCachedSizesToArray((proto::gnsshal::NvStoreItem *)v10, v12, a3, a4);
      ++v9;
    }
    while (v9 < *((int *)this + 6));
  }
  v15 = (_QWORD *)*((_QWORD *)this + 1);
  v14 = (proto::gnsshal::NvStore *)((char *)this + 8);
  v13 = v15;
  if (!v15 || *v13 == v13[1])
    return v4;
  else
    return (unsigned __int8 *)wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(v14, (const wireless_diagnostics::google::protobuf::UnknownFieldSet *)v4, a3);
}

uint64_t proto::gnsshal::NvStore::ByteSize(proto::gnsshal::NvStore *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  int v3;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v8;
  int v9;
  int v10;
  _QWORD *v11;

  if ((*((_BYTE *)this + 48) & 1) != 0)
  {
    v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 10);
    if ((v4 & 0x80000000) != 0)
    {
      v3 = 11;
    }
    else if (v4 >= 0x80)
    {
      v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
    }
    else
    {
      v3 = 2;
    }
  }
  else
  {
    v3 = 0;
  }
  v5 = *((_DWORD *)this + 6);
  v6 = (v5 + v3);
  if (v5 >= 1)
  {
    v7 = 0;
    do
    {
      v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)proto::gnsshal::NvStoreItem::ByteSize(*(proto::gnsshal::NvStoreItem **)(*((_QWORD *)this + 2) + 8 * v7), a2);
      v9 = (int)v8;
      if (v8 >= 0x80)
        v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
      else
        v10 = 1;
      v6 = (v9 + v6 + v10);
      ++v7;
    }
    while (v7 < *((int *)this + 6));
  }
  v11 = (_QWORD *)*((_QWORD *)this + 1);
  if (v11 && *v11 != v11[1])
    v6 = wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize((proto::gnsshal::NvStore *)((char *)this + 8), a2)+ v6;
  *((_DWORD *)this + 11) = v6;
  return v6;
}

uint64_t proto::gnsshal::NvStore::MergeFrom(proto::gnsshal::NvStore *this, const wireless_diagnostics::google::protobuf::Message *lpsrc)
{
  const proto::gnsshal::NvStore *v4;
  wireless_diagnostics::google::protobuf::Message *v5;
  _BYTE v7[48];

  if (lpsrc == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }
  if (v4)
    return proto::gnsshal::NvStore::MergeFrom(this, v4);
  else
    return wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(lpsrc, this, v5);
}

void sub_2293D72A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::CopyFrom(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (a2 != result)
  {
    v3 = result;
    (*(void (**)(uint64_t))(*(_QWORD *)result + 32))(result);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 112))(v3, a2);
  }
  return result;
}

const proto::gnsshal::NvStore *proto::gnsshal::NvStore::CopyFrom(const proto::gnsshal::NvStore *this, const proto::gnsshal::NvStore *a2)
{
  proto::gnsshal::NvStore *v3;

  if (a2 != this)
  {
    v3 = this;
    (*(void (**)(const proto::gnsshal::NvStore *))(*(_QWORD *)this + 32))(this);
    return (const proto::gnsshal::NvStore *)proto::gnsshal::NvStore::MergeFrom(v3, a2);
  }
  return this;
}

uint64_t proto::gnsshal::NvStore::IsInitialized(proto::gnsshal::NvStore *this)
{
  return 1;
}

proto::gnsshal::NvStore *proto::gnsshal::NvStore::Swap(proto::gnsshal::NvStore *this, proto::gnsshal::NvStore *a2)
{
  proto::gnsshal::NvStore *v3;
  int v4;
  int v5;
  uint64_t v6;

  if (a2 != this)
  {
    v3 = this;
    v4 = *((_DWORD *)this + 10);
    *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
    *((_DWORD *)a2 + 10) = v4;
    this = (proto::gnsshal::NvStore *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    v5 = *((_DWORD *)v3 + 12);
    *((_DWORD *)v3 + 12) = *((_DWORD *)a2 + 12);
    *((_DWORD *)a2 + 12) = v5;
    v6 = *((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = *((_QWORD *)a2 + 1);
    *((_QWORD *)a2 + 1) = v6;
    LODWORD(v6) = *((_DWORD *)v3 + 11);
    *((_DWORD *)v3 + 11) = *((_DWORD *)a2 + 11);
    *((_DWORD *)a2 + 11) = v6;
  }
  return this;
}

uint64_t proto::gnsshal::NvStore::GetMetadata(proto::gnsshal::NvStore *this)
{
  uint64_t v1;
  _QWORD v3[2];
  char v4;

  v1 = qword_255A4BDA8;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x24BEDDBA8] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return _MergedGlobals;
}

void sub_2293D7434(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

proto::gnsshal::NvStoreItem *proto::gnsshal::NvStoreItem::NvStoreItem(proto::gnsshal::NvStoreItem *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24F20B710;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStoreItem *)((char *)this + 8));
  v2 = MEMORY[0x24BEDD958];
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = v2;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 4) = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)this + 40) = _Q0;
  *((_DWORD *)this + 16) = 0;
  return this;
}

__n128 proto::gnsshal::NvStoreItem::SharedCtor(proto::gnsshal::NvStoreItem *this)
{
  uint64_t v1;
  __n128 result;

  v1 = MEMORY[0x24BEDD958];
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = v1;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 4) = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(__n128 *)((char *)this + 40) = result;
  *((_DWORD *)this + 16) = 0;
  return result;
}

proto::gnsshal::NvStoreItem *proto::gnsshal::NvStoreItem::NvStoreItem(proto::gnsshal::NvStoreItem *this, const proto::gnsshal::NvStoreItem *a2)
{
  uint64_t v4;

  *(_QWORD *)this = off_24F20B710;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStoreItem *)((char *)this + 8));
  v4 = MEMORY[0x24BEDD958];
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = v4;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 4) = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)this + 40) = _Q0;
  *((_DWORD *)this + 16) = 0;
  proto::gnsshal::NvStoreItem::MergeFrom(this, a2);
  return this;
}

uint64_t proto::gnsshal::NvStoreItem::MergeFrom(proto::gnsshal::NvStoreItem *this, const proto::gnsshal::NvStoreItem *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v7;
  const std::string *v8;
  std::string *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[48];

  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
  }
  LOBYTE(v4) = *((_BYTE *)a2 + 64);
  if (!(_BYTE)v4)
    return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom((proto::gnsshal::NvStoreItem *)((char *)this + 8), (const proto::gnsshal::NvStoreItem *)((char *)a2 + 8));
  if ((*((_BYTE *)a2 + 64) & 1) != 0)
  {
    v7 = *((_QWORD *)a2 + 2);
    *((_DWORD *)this + 16) |= 1u;
    *((_QWORD *)this + 2) = v7;
    v4 = *((_DWORD *)a2 + 16);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)a2 + 64) & 2) == 0)
  {
    goto LABEL_6;
  }
  v8 = (const std::string *)*((_QWORD *)a2 + 3);
  *((_DWORD *)this + 16) |= 2u;
  v9 = (std::string *)*((_QWORD *)this + 3);
  if (v9 == (std::string *)MEMORY[0x24BEDD958])
  {
    v9 = (std::string *)operator new();
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    *((_QWORD *)this + 3) = v9;
  }
  std::string::operator=(v9, v8);
  v4 = *((_DWORD *)a2 + 16);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v10 = *((_DWORD *)a2 + 14);
  *((_DWORD *)this + 16) |= 4u;
  *((_DWORD *)this + 14) = v10;
  v4 = *((_DWORD *)a2 + 16);
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0)
      goto LABEL_9;
LABEL_18:
    v12 = *((_QWORD *)a2 + 5);
    *((_DWORD *)this + 16) |= 0x10u;
    *((_QWORD *)this + 5) = v12;
    if ((*((_DWORD *)a2 + 16) & 0x20) == 0)
      return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom((proto::gnsshal::NvStoreItem *)((char *)this + 8), (const proto::gnsshal::NvStoreItem *)((char *)a2 + 8));
    goto LABEL_10;
  }
LABEL_17:
  v11 = *((_QWORD *)a2 + 4);
  *((_DWORD *)this + 16) |= 8u;
  *((_QWORD *)this + 4) = v11;
  v4 = *((_DWORD *)a2 + 16);
  if ((v4 & 0x10) != 0)
    goto LABEL_18;
LABEL_9:
  if ((v4 & 0x20) != 0)
  {
LABEL_10:
    v5 = *((_QWORD *)a2 + 6);
    *((_DWORD *)this + 16) |= 0x20u;
    *((_QWORD *)this + 6) = v5;
  }
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom((proto::gnsshal::NvStoreItem *)((char *)this + 8), (const proto::gnsshal::NvStoreItem *)((char *)a2 + 8));
}

void sub_2293D76F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void proto::gnsshal::NvStoreItem::~NvStoreItem(proto::gnsshal::NvStoreItem *this)
{
  char *v1;

  *(_QWORD *)this = off_24F20B710;
  v1 = (char *)this + 8;
  proto::gnsshal::NvStoreItem::SharedDtor((uint64_t)this);
  MEMORY[0x22E2C894C](v1);
  JUMPOUT(0x22E2C89F4);
}

{
  proto::gnsshal::NvStoreItem::~NvStoreItem(this);
}

uint64_t proto::gnsshal::NvStoreItem::SharedDtor(uint64_t this)
{
  uint64_t v1;

  v1 = *(_QWORD *)(this + 24);
  if (v1 != MEMORY[0x24BEDD958] && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    JUMPOUT(0x22E2C8E68);
  }
  return this;
}

void sub_2293D77B8()
{
  JUMPOUT(0x22E2C8E68);
}

uint64_t proto::gnsshal::NvStoreItem::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 60) = a2;
  return this;
}

uint64_t proto::gnsshal::NvStoreItem::descriptor(proto::gnsshal::NvStoreItem *this)
{
  uint64_t v1;
  _QWORD v3[2];
  char v4;

  v1 = qword_255A4BDA8;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x24BEDDBA8] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return qword_255A4BD98;
}

void sub_2293D7848(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStoreItem::default_instance(proto::gnsshal::NvStoreItem *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result;

  result = proto::gnsshal::NvStoreItem::default_instance_;
  if (!proto::gnsshal::NvStoreItem::default_instance_)
  {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(0, a2, a3, a4);
    return proto::gnsshal::NvStoreItem::default_instance_;
  }
  return result;
}

proto::gnsshal::NvStoreItem *proto::gnsshal::NvStoreItem::New(proto::gnsshal::NvStoreItem *this)
{
  proto::gnsshal::NvStoreItem *v1;

  v1 = (proto::gnsshal::NvStoreItem *)operator new();
  proto::gnsshal::NvStoreItem::NvStoreItem(v1);
  return v1;
}

void sub_2293D78C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2C8E68](v1, 0x10A1C40F05C313FLL);
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::UnknownFieldSet *proto::gnsshal::NvStoreItem::Clear(proto::gnsshal::NvStoreItem *this)
{
  char v1;
  uint64_t v2;
  wireless_diagnostics::google::protobuf::UnknownFieldSet *result;
  uint64_t v9;

  v1 = *((_BYTE *)this + 64);
  if (v1)
  {
    *((_QWORD *)this + 2) = 0;
    if ((v1 & 2) != 0)
    {
      v2 = *((_QWORD *)this + 3);
      if (v2 != MEMORY[0x24BEDD958])
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(_BYTE **)v2 = 0;
          *(_QWORD *)(v2 + 8) = 0;
        }
        else
        {
          *(_BYTE *)v2 = 0;
          *(_BYTE *)(v2 + 23) = 0;
        }
      }
    }
    *((_DWORD *)this + 14) = 0;
    *((_QWORD *)this + 4) = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)((char *)this + 40) = _Q0;
  }
  v9 = *((_QWORD *)this + 1);
  result = (proto::gnsshal::NvStoreItem *)((char *)this + 8);
  *((_DWORD *)result + 14) = 0;
  if (v9)
    return (wireless_diagnostics::google::protobuf::UnknownFieldSet *)wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(result);
  return result;
}

uint64_t proto::gnsshal::NvStoreItem::MergePartialFromCodedStream(proto::gnsshal::NvStoreItem *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  unsigned int *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t TagFallback;
  int v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  _BYTE *v15;
  int v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t result;
  _QWORD *v21;
  _BYTE *v22;
  _BYTE *v23;
  unint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  unint64_t v27;

  v6 = (unsigned int *)((char *)this + 56);
  v7 = (char *)this + 8;
  v8 = MEMORY[0x24BEDD958];
  while (2)
  {
    v9 = (char *)*((_QWORD *)a2 + 1);
    if ((unint64_t)v9 >= *((_QWORD *)a2 + 2) || *v9 < 0)
    {
      TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!(_DWORD)TagFallback)
        return 1;
    }
    else
    {
      TagFallback = *v9;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((_QWORD *)a2 + 1) = v9 + 1;
      if (!(_DWORD)TagFallback)
        return 1;
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        v11 = TagFallback & 7;
        if ((TagFallback & 7) != 0)
          goto LABEL_22;
        v27 = 0;
        v13 = (char *)*((_QWORD *)a2 + 1);
        v12 = *((_QWORD *)a2 + 2);
        if ((unint64_t)v13 >= v12 || *v13 < 0)
        {
          result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, &v27);
          if (!(_DWORD)result)
            return result;
          v14 = v27;
          v15 = (_BYTE *)*((_QWORD *)a2 + 1);
          v12 = *((_QWORD *)a2 + 2);
        }
        else
        {
          v14 = *v13;
          v15 = v13 + 1;
          *((_QWORD *)a2 + 1) = v15;
        }
        *((_QWORD *)this + 2) = v14;
        v16 = *((_DWORD *)this + 16) | 1;
        *((_DWORD *)this + 16) = v16;
        if ((unint64_t)v15 < v12 && *v15 == 18)
        {
          *((_QWORD *)a2 + 1) = v15 + 1;
          goto LABEL_30;
        }
        continue;
      case 2u:
        v11 = TagFallback & 7;
        if (v11 != 2)
          goto LABEL_22;
        v16 = *((_DWORD *)this + 16);
LABEL_30:
        *((_DWORD *)this + 16) = v16 | 2;
        if (*((_QWORD *)this + 3) == v8)
        {
          v21 = (_QWORD *)operator new();
          v21[1] = 0;
          v21[2] = 0;
          *v21 = 0;
          *((_QWORD *)this + 3) = v21;
        }
        result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes();
        if (!(_DWORD)result)
          return result;
        v22 = (_BYTE *)*((_QWORD *)a2 + 1);
        v17 = *((_QWORD *)a2 + 2);
        if ((unint64_t)v22 >= v17 || *v22 != 24)
          continue;
        v18 = v22 + 1;
        *((_QWORD *)a2 + 1) = v18;
LABEL_36:
        if ((unint64_t)v18 >= v17 || *v18 < 0)
        {
          result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!(_DWORD)result)
            return result;
          v23 = (_BYTE *)*((_QWORD *)a2 + 1);
          v17 = *((_QWORD *)a2 + 2);
        }
        else
        {
          *v6 = *v18;
          v23 = v18 + 1;
          *((_QWORD *)a2 + 1) = v23;
        }
        *((_DWORD *)this + 16) |= 4u;
        if ((unint64_t)v23 >= v17 || *v23 != 32)
          continue;
        v19 = v23 + 1;
        *((_QWORD *)a2 + 1) = v19;
LABEL_44:
        v27 = 0;
        if ((unint64_t)v19 >= v17 || *v19 < 0)
        {
          result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, &v27);
          if (!(_DWORD)result)
            return result;
          v24 = v27;
          v25 = (_BYTE *)*((_QWORD *)a2 + 1);
          v17 = *((_QWORD *)a2 + 2);
        }
        else
        {
          v24 = *v19;
          v25 = v19 + 1;
          *((_QWORD *)a2 + 1) = v25;
        }
        *((_QWORD *)this + 4) = v24;
        *((_DWORD *)this + 16) |= 8u;
        if ((unint64_t)v25 >= v17 || *v25 != 41)
          continue;
        *((_QWORD *)a2 + 1) = v25 + 1;
LABEL_52:
        v27 = 0;
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(a2, &v27) & 1) == 0)
          return 0;
        *((_QWORD *)this + 5) = v27;
        *((_DWORD *)this + 16) |= 0x10u;
        v26 = (_BYTE *)*((_QWORD *)a2 + 1);
        if ((unint64_t)v26 >= *((_QWORD *)a2 + 2) || *v26 != 49)
          continue;
        *((_QWORD *)a2 + 1) = v26 + 1;
LABEL_56:
        v27 = 0;
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(a2, &v27) & 1) != 0)
        {
          *((_QWORD *)this + 6) = v27;
          *((_DWORD *)this + 16) |= 0x20u;
          if (*((_QWORD *)a2 + 1) == *((_QWORD *)a2 + 2)
            && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + 8) = 0;
            result = 1;
            *((_BYTE *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        return 0;
      case 3u:
        v11 = TagFallback & 7;
        if ((TagFallback & 7) != 0)
          goto LABEL_22;
        v18 = (char *)*((_QWORD *)a2 + 1);
        v17 = *((_QWORD *)a2 + 2);
        goto LABEL_36;
      case 4u:
        v11 = TagFallback & 7;
        if ((TagFallback & 7) != 0)
          goto LABEL_22;
        v19 = (char *)*((_QWORD *)a2 + 1);
        v17 = *((_QWORD *)a2 + 2);
        goto LABEL_44;
      case 5u:
        v11 = TagFallback & 7;
        if (v11 == 1)
          goto LABEL_52;
        goto LABEL_22;
      case 6u:
        v11 = TagFallback & 7;
        if (v11 != 1)
          goto LABEL_22;
        goto LABEL_56;
      default:
        v11 = TagFallback & 7;
LABEL_22:
        if (v11 == 4)
          return 1;
        if ((wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, (uint64_t)v7, a4) & 1) == 0)return 0;
        continue;
    }
  }
}

uint64_t proto::gnsshal::NvStoreItem::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5;
  int v6;
  _QWORD *v7;
  wireless_diagnostics::google::protobuf::internal::WireFormat *v8;
  _QWORD *v9;

  v5 = this;
  v6 = *(_DWORD *)(this + 64);
  if ((v6 & 1) != 0)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(_QWORD *)(this + 16), (uint64_t)a2, a4);
    v6 = *(_DWORD *)(v5 + 64);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes();
  v6 = *(_DWORD *)(v5 + 64);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 56), (uint64_t)a2, a4);
  v6 = *(_DWORD *)(v5 + 64);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(_QWORD *)(v5 + 32), (uint64_t)a2, a4);
  v6 = *(_DWORD *)(v5 + 64);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_16:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, (uint64_t)a2, *(double *)(v5 + 40), a3);
  if ((*(_DWORD *)(v5 + 64) & 0x20) != 0)
LABEL_7:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, (uint64_t)a2, *(double *)(v5 + 48), a3);
LABEL_8:
  v9 = *(_QWORD **)(v5 + 8);
  v8 = (wireless_diagnostics::google::protobuf::internal::WireFormat *)(v5 + 8);
  v7 = v9;
  if (v9)
  {
    if (*v7 != v7[1])
      return wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFields(v8, a2, a3);
  }
  return this;
}

unsigned __int8 *proto::gnsshal::NvStoreItem::SerializeWithCachedSizesToArray(proto::gnsshal::NvStoreItem *this, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  int v5;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v6;
  uint64_t v7;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v8;
  unsigned __int8 *v9;
  int v10;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v11;
  const void *v12;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  wireless_diagnostics::google::protobuf::internal::WireFormat *v17;
  _QWORD *v18;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v20;
  uint64_t v21;

  v5 = *((_DWORD *)this + 16);
  if ((v5 & 1) != 0)
  {
    v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((_QWORD *)this + 2);
    *a2 = 8;
    a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(v6, (uint64_t)(a2 + 1), a3);
    v5 = *((_DWORD *)this + 16);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_22;
      goto LABEL_19;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  v7 = *((_QWORD *)this + 3);
  *a2 = 18;
  if (*(char *)(v7 + 23) < 0)
    v8 = *(wireless_diagnostics::google::protobuf::io::CodedOutputStream **)(v7 + 8);
  else
    v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned __int8 *)(v7 + 23);
  if (v8 > 0x7F)
  {
    v9 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v8, (uint64_t)(a2 + 1), a3);
  }
  else
  {
    a2[1] = v8;
    v9 = a2 + 2;
  }
  v10 = *(char *)(v7 + 23);
  if (v10 >= 0)
    v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v7;
  else
    v11 = *(wireless_diagnostics::google::protobuf::io::CodedOutputStream **)v7;
  if (v10 >= 0)
    v12 = (const void *)*(unsigned __int8 *)(v7 + 23);
  else
    v12 = (const void *)*(unsigned int *)(v7 + 8);
  a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(v11, v12, (uint64_t)v9, a4);
  if ((*((_DWORD *)this + 16) & 4) != 0)
  {
LABEL_19:
    v13 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 14);
    *a2 = 24;
    if (v13 > 0x7F)
    {
      a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v13, (uint64_t)(a2 + 1), a3);
    }
    else
    {
      a2[1] = v13;
      a2 += 2;
    }
  }
LABEL_22:
  v14 = *((_DWORD *)this + 16);
  if ((v14 & 8) == 0)
  {
    if ((v14 & 0x10) == 0)
      goto LABEL_24;
LABEL_31:
    v21 = *((_QWORD *)this + 5);
    *a2 = 41;
    *(_QWORD *)(a2 + 1) = v21;
    a2 += 9;
    if ((*((_DWORD *)this + 16) & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
  v20 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((_QWORD *)this + 4);
  *a2 = 32;
  a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(v20, (uint64_t)(a2 + 1), a3);
  v14 = *((_DWORD *)this + 16);
  if ((v14 & 0x10) != 0)
    goto LABEL_31;
LABEL_24:
  if ((v14 & 0x20) != 0)
  {
LABEL_25:
    v15 = *((_QWORD *)this + 6);
    *a2 = 49;
    *(_QWORD *)(a2 + 1) = v15;
    a2 += 9;
  }
LABEL_26:
  v18 = (_QWORD *)*((_QWORD *)this + 1);
  v17 = (proto::gnsshal::NvStoreItem *)((char *)this + 8);
  v16 = v18;
  if (!v18 || *v16 == v16[1])
    return a2;
  else
    return (unsigned __int8 *)wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(v17, (const wireless_diagnostics::google::protobuf::UnknownFieldSet *)a2, a3);
}

uint64_t proto::gnsshal::NvStoreItem::ByteSize(proto::gnsshal::NvStoreItem *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unsigned int v12;
  _QWORD *v13;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v15;
  int v16;

  LOBYTE(v3) = *((_BYTE *)this + 64);
  if (!(_BYTE)v3)
  {
    v5 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)this + 64) & 1) != 0)
  {
    v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                     + 2))
       + 1;
    v3 = *((_DWORD *)this + 16);
    if ((v3 & 2) == 0)
      goto LABEL_16;
  }
  else
  {
    v4 = 0;
    if ((*((_BYTE *)this + 64) & 2) == 0)
      goto LABEL_16;
  }
  v6 = *((_QWORD *)this + 3);
  v7 = *(unsigned __int8 *)(v6 + 23);
  v8 = v7;
  v9 = *(_QWORD *)(v6 + 8);
  if ((v7 & 0x80u) == 0)
    v10 = *(unsigned __int8 *)(v6 + 23);
  else
    v10 = v9;
  if (v10 >= 0x80)
  {
    v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v10);
    v7 = *(unsigned __int8 *)(v6 + 23);
    v9 = *(_QWORD *)(v6 + 8);
    v3 = *((_DWORD *)this + 16);
    v8 = *(_BYTE *)(v6 + 23);
  }
  else
  {
    v11 = 1;
  }
  if (v8 < 0)
    v7 = v9;
  v4 += v11 + v7 + 1;
LABEL_16:
  if ((v3 & 4) != 0)
  {
    v15 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 14);
    if (v15 >= 0x80)
    {
      v16 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v15) + 1;
      v3 = *((_DWORD *)this + 16);
    }
    else
    {
      v16 = 2;
    }
    v4 += v16;
    if ((v3 & 8) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  if ((v3 & 8) != 0)
  {
LABEL_18:
    v4 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                      + 4))
        + 1;
    v3 = *((_DWORD *)this + 16);
  }
LABEL_19:
  v12 = v4 + 9;
  if ((v3 & 0x10) == 0)
    v12 = v4;
  if ((v3 & 0x20) != 0)
    v5 = v12 + 9;
  else
    v5 = v12;
LABEL_24:
  v13 = (_QWORD *)*((_QWORD *)this + 1);
  if (v13 && *v13 != v13[1])
    v5 = wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize((proto::gnsshal::NvStoreItem *)((char *)this + 8), a2)+ v5;
  *((_DWORD *)this + 15) = v5;
  return v5;
}

uint64_t proto::gnsshal::NvStoreItem::MergeFrom(proto::gnsshal::NvStoreItem *this, const wireless_diagnostics::google::protobuf::Message *lpsrc)
{
  const proto::gnsshal::NvStoreItem *v4;
  wireless_diagnostics::google::protobuf::Message *v5;
  _BYTE v7[48];

  if (lpsrc == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }
  if (v4)
    return proto::gnsshal::NvStoreItem::MergeFrom(this, v4);
  else
    return wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(lpsrc, this, v5);
}

void sub_2293D817C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStoreItem::CopyFrom(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (a2 != result)
  {
    v3 = result;
    (*(void (**)(uint64_t))(*(_QWORD *)result + 32))(result);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 112))(v3, a2);
  }
  return result;
}

const proto::gnsshal::NvStoreItem *proto::gnsshal::NvStoreItem::CopyFrom(const proto::gnsshal::NvStoreItem *this, const proto::gnsshal::NvStoreItem *a2)
{
  proto::gnsshal::NvStoreItem *v3;

  if (a2 != this)
  {
    v3 = this;
    (*(void (**)(const proto::gnsshal::NvStoreItem *))(*(_QWORD *)this + 32))(this);
    return (const proto::gnsshal::NvStoreItem *)proto::gnsshal::NvStoreItem::MergeFrom(v3, a2);
  }
  return this;
}

uint64_t proto::gnsshal::NvStoreItem::IsInitialized(proto::gnsshal::NvStoreItem *this)
{
  return 1;
}

double proto::gnsshal::NvStoreItem::Swap(proto::gnsshal::NvStoreItem *this, proto::gnsshal::NvStoreItem *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  if (a2 != this)
  {
    v2 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
    *((_QWORD *)a2 + 3) = v2;
    LODWORD(v2) = *((_DWORD *)this + 14);
    *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
    *((_DWORD *)a2 + 14) = v2;
    v4 = *((_QWORD *)this + 1);
    v3 = *((_QWORD *)this + 2);
    v5 = *((_QWORD *)a2 + 2);
    *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
    *((_QWORD *)this + 2) = v5;
    *((_QWORD *)a2 + 2) = v3;
    v6 = *((_QWORD *)this + 4);
    *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
    *((_QWORD *)a2 + 4) = v6;
    LODWORD(v6) = *((_DWORD *)this + 16);
    *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
    v7 = *((_QWORD *)this + 5);
    *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
    *((_QWORD *)a2 + 5) = v7;
    result = *((double *)this + 6);
    *((_QWORD *)this + 6) = *((_QWORD *)a2 + 6);
    *((double *)a2 + 6) = result;
    *((_DWORD *)a2 + 16) = v6;
    *((_QWORD *)a2 + 1) = v4;
    LODWORD(v6) = *((_DWORD *)this + 15);
    *((_DWORD *)this + 15) = *((_DWORD *)a2 + 15);
    *((_DWORD *)a2 + 15) = v6;
  }
  return result;
}

uint64_t proto::gnsshal::NvStoreItem::GetMetadata(proto::gnsshal::NvStoreItem *this)
{
  uint64_t v1;
  _QWORD v3[2];
  char v4;

  v1 = qword_255A4BDA8;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x24BEDDBA8] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return qword_255A4BD98;
}

void sub_2293D8328(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::GetCachedSize(proto::gnsshal::NvStore *this)
{
  return *((unsigned int *)this + 11);
}

uint64_t wireless_diagnostics::google::protobuf::Message::GetReflection(wireless_diagnostics::google::protobuf::Message *this)
{
  uint64_t v1;

  (*(void (**)(wireless_diagnostics::google::protobuf::Message *))(*(_QWORD *)this + 152))(this);
  return v1;
}

uint64_t proto::gnsshal::NvStoreItem::GetCachedSize(proto::gnsshal::NvStoreItem *this)
{
  return *((unsigned int *)this + 15);
}

proto::gnsshal::NvStoreItem *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New()
{
  proto::gnsshal::NvStoreItem *v0;

  v0 = (proto::gnsshal::NvStoreItem *)operator new();
  proto::gnsshal::NvStoreItem::NvStoreItem(v0);
  return v0;
}

void sub_2293D83A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2C8E68](v1, 0x10A1C40F05C313FLL);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>(uint64_t *a1)
{
  int v2;
  uint64_t i;
  uint64_t v4;
  uint64_t result;

  v2 = *((_DWORD *)a1 + 3);
  if (v2 >= 1)
  {
    for (i = 0; i < v2; ++i)
    {
      v4 = *(_QWORD *)(*a1 + 8 * i);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
        v2 = *((_DWORD *)a1 + 3);
      }
    }
  }
  result = *a1;
  if (*a1)
    JUMPOUT(0x22E2C8E50);
  return result;
}

uint64_t GnssHal::PlatformTimer::PlatformTimer(uint64_t a1, dispatch_queue_t queue)
{
  NSObject *v3;
  NSObject *v5;
  _QWORD v6[5];
  void *__p[2];
  char v8;
  void *v9[2];
  char v10;
  void *v11[2];
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = &off_24F20B7F0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = queue;
  *(_WORD *)(a1 + 56) = 0;
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, queue);
  *(_QWORD *)(a1 + 40) = v3;
  if (!v3)
  {
    v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "timer,nullptr", buf, 2u);
      v5 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalTimerImpl.mm";
      v15 = 1026;
      v16 = 15;
      v17 = 2082;
      v18 = "PlatformTimer";
      _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v11, "assert");
    std::string::basic_string[abi:ne180100]<0>(v9, "PlatformTimer");
    std::string::basic_string[abi:ne180100]<0>(__p, "timer,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)v11, (uint64_t)v9, (uint64_t)__p);
    if (v8 < 0)
      operator delete(__p[0]);
    if (v10 < 0)
      operator delete(v9[0]);
    if (v12 < 0)
      operator delete(v11[0]);
    __assert_rtn("PlatformTimer", "GnssHalTimerImpl.mm", 15, "false && \"timer,nullptr\"");
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___ZN7GnssHal13PlatformTimerC2EPU28objcproto17OS_dispatch_queue8NSObject_block_invoke;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = a1;
  dispatch_source_set_event_handler(v3, v6);
  return a1;
}

void sub_2293D8664(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v31;
  _QWORD **v32;
  _QWORD *v34;
  uint64_t v35;

  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  if (a31 < 0)
    operator delete(a26);
  v34 = *v32;
  if (*v32 == (_QWORD *)(v31 + 8))
  {
    v35 = 4;
    v34 = (_QWORD *)(v31 + 8);
  }
  else
  {
    if (!v34)
      goto LABEL_12;
    v35 = 5;
  }
  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_12:
  _Unwind_Resume(exception_object);
}

void ___ZN7GnssHal13PlatformTimerC2EPU28objcproto17OS_dispatch_queue8NSObject_block_invoke(uint64_t a1)
{
  GnssHal::PlatformTimer::handleEvent(*(GnssHal::PlatformTimer **)(a1 + 32));
}

void GnssHal::PlatformTimer::handleEvent(GnssHal::PlatformTimer *this)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (!*((_BYTE *)this + 57))
    (*(void (**)(GnssHal::PlatformTimer *))(*(_QWORD *)this + 32))(this);
  v2 = *((_QWORD *)this + 4);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  }
  else
  {
    v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "timer,handleEvent,callback,nullptr", v4, 2u);
    }
  }
}

void GnssHal::PlatformTimer::~PlatformTimer(GnssHal::PlatformTimer *this)
{
  NSObject *v2;
  GnssHal::PlatformTimer *v3;
  uint64_t v4;
  GnssHal::PlatformTimer *v5;
  uint64_t v6;

  *(_QWORD *)this = &off_24F20B7F0;
  v2 = *((_QWORD *)this + 5);
  if (!v2)
    goto LABEL_10;
  v3 = (GnssHal::PlatformTimer *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3 == (GnssHal::PlatformTimer *)((char *)this + 8))
  {
    v4 = 4;
    v3 = (GnssHal::PlatformTimer *)((char *)this + 8);
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = 5;
LABEL_6:
    (*(void (**)(GnssHal::PlatformTimer *))(*(_QWORD *)v3 + 8 * v4))(v3);
    v2 = *((_QWORD *)this + 5);
  }
  if (!*((_BYTE *)this + 56))
  {
    dispatch_resume(v2);
    v2 = *((_QWORD *)this + 5);
  }
  dispatch_source_cancel(v2);

  *((_QWORD *)this + 5) = 0;
LABEL_10:
  v5 = (GnssHal::PlatformTimer *)*((_QWORD *)this + 4);
  if (v5 == (GnssHal::PlatformTimer *)((char *)this + 8))
  {
    v6 = 4;
    v5 = (GnssHal::PlatformTimer *)((char *)this + 8);
  }
  else
  {
    if (!v5)
      return;
    v6 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
}

{
  GnssHal::PlatformTimer::~PlatformTimer(this);
  JUMPOUT(0x22E2C8E68);
}

void GnssHal::PlatformTimer::startInternal(GnssHal::PlatformTimer *this, int a2, char a3)
{
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;

  v4 = 1000000 * a2;
  *((_BYTE *)this + 57) = a3;
  v5 = *((_QWORD *)this + 5);
  v6 = dispatch_walltime(0, v4);
  dispatch_source_set_timer(v5, v6, v4, 0x989680uLL);
  if (!*((_BYTE *)this + 56))
  {
    dispatch_resume(*((dispatch_object_t *)this + 5));
    *((_BYTE *)this + 56) = 1;
  }
}

void GnssHal::PlatformTimer::stopInternal(GnssHal::PlatformTimer *this)
{
  if (*((_BYTE *)this + 56))
  {
    *((_BYTE *)this + 56) = 0;
    dispatch_suspend(*((dispatch_object_t *)this + 5));
  }
}

double GnssHal::PlatformTimer::getContinuousSystemTimeSeconds(GnssHal::PlatformTimer *this)
{
  return (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
}

_QWORD *GnssHal::PlatformTimer::setCallback(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  _QWORD v9[5];
  _BYTE v10[24];
  _BYTE *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3321888768;
  v9[2] = ___ZN7GnssHal13PlatformTimer11setCallbackENSt3__18functionIFvvEEE_block_invoke;
  v9[3] = &__block_descriptor_72_e8_40c27_ZTSNSt3__18functionIFvvEEE_e5_v8__0l;
  v9[4] = a1;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v10, a2);
  dispatch_async(v2, v9);
  result = v11;
  if (v11 == v10)
  {
    v8 = 4;
    result = v10;
  }
  else
  {
    if (!v11)
      return result;
    v8 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(*result + 8 * v8))(result, v3, v4, v5, v6);
}

void GnssHal::PlatformTimer::start(GnssHal::PlatformTimer *this, int a2, char a3)
{
  NSObject *v3;
  _QWORD v4[5];
  int v5;
  char v6;

  v3 = *((_QWORD *)this + 6);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___ZN7GnssHal13PlatformTimer5startEib_block_invoke;
  v4[3] = &__block_descriptor_45_e5_v8__0l;
  v4[4] = this;
  v5 = a2;
  v6 = a3;
  dispatch_async(v3, v4);
}

void GnssHal::PlatformTimer::stop(GnssHal::PlatformTimer *this)
{
  NSObject *v1;
  _QWORD block[5];

  v1 = *((_QWORD *)this + 6);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN7GnssHal13PlatformTimer4stopEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_async(v1, block);
}

void sub_2293D8C70(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 40, a2 + 40);
}

_QWORD *__destroy_helper_block_e8_40c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 40);
  result = *(_QWORD **)(a1 + 64);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void ___ZN7GnssHal13PlatformTimer5startEib_block_invoke(uint64_t a1)
{
  GnssHal::PlatformTimer::startInternal(*(GnssHal::PlatformTimer **)(a1 + 32), *(_DWORD *)(a1 + 40), *(_BYTE *)(a1 + 44));
}

void ___ZN7GnssHal13PlatformTimer4stopEv_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 56))
  {
    *(_BYTE *)(v1 + 56) = 0;
    dispatch_suspend(*(dispatch_object_t *)(v1 + 40));
  }
}

uint64_t GnssHal::InterfacesImpl::InterfacesImpl(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t *a7)
{
  uint64_t v13;
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

  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &off_24F20B8A8;
  v13 = *a2;
  *a2 = 0;
  v14 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v13;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v15 = *a3;
  *a3 = 0;
  v16 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v15;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  v17 = *a4;
  *a4 = 0;
  v18 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v17;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  v19 = *a5;
  *a5 = 0;
  v20 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v19;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  v21 = *a6;
  *a6 = 0;
  v22 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v21;
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  v23 = *a7;
  *a7 = 0;
  v24 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v23;
  if (v24)
    (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
  return a1;
}

void GnssHal::InterfacesImpl::~InterfacesImpl(GnssHal::InterfacesImpl *this)
{
  GnssHal::Interfaces::~Interfaces(this);
  JUMPOUT(0x22E2C8E68);
}

void GnssHal::Interfaces::~Interfaces(GnssHal::Interfaces *this)
{
  GnssHal::Interfaces::~Interfaces(this);
  JUMPOUT(0x22E2C8E68);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_24F20B8F0;
  v2 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
}

uint64_t GnssHal::CommUart::CommUart(uint64_t a1, uint64_t a2, uint64_t *a3, dispatch_queue_t DispatchQueue)
{
  id *v8;
  __int128 v9;
  GnssHal::CommUart::AsyncReader *v10;
  GnssHal::CommUart::AsyncReader *v11;
  uint64_t v12;

  *(_QWORD *)a1 = &off_24F20B910;
  v8 = (id *)GpsdPreferences::instance(0);
  *(_BYTE *)(a1 + 8) = GpsdPreferences::verboseCommDataSniffer(v8);
  *(_WORD *)(a1 + 16) = *(_WORD *)a2;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 24), *(const std::string::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v9;
  }
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 56) = -1;
  *(_WORD *)(a1 + 60) = 1;
  *(_QWORD *)(a1 + 64) = 0;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1))
  {
    v10 = (GnssHal::CommUart::AsyncReader *)operator new();
    v11 = v10;
    v12 = *a3;
    *a3 = 0;
    *(_QWORD *)v10 = a1;
    *((_QWORD *)v10 + 1) = v12;
    if (!DispatchQueue)
      DispatchQueue = GnssHal::CommUart::AsyncReader::createDispatchQueue(v10);
    *((_QWORD *)v11 + 2) = DispatchQueue;
    *((_OWORD *)v11 + 3) = 0u;
    *((_OWORD *)v11 + 4) = 0u;
    *((_QWORD *)v11 + 10) = 0;
    std::unique_ptr<GnssHal::CommUart::AsyncReader>::reset[abi:ne180100]((_QWORD **)(a1 + 64), v11);
  }
  return a1;
}

void sub_2293D9030(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  _QWORD **v3;
  uint64_t v4;
  uint64_t v6;

  v6 = *(_QWORD *)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  MEMORY[0x22E2C8E68](v4, 0x10F0C40764F7215);
  std::unique_ptr<GnssHal::CommUart::AsyncReader>::reset[abi:ne180100](v3, 0);
  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  _Unwind_Resume(a1);
}

void GnssHal::CommUart::~CommUart(void **this)
{
  *this = &off_24F20B910;
  GnssHal::CommUart::close((GnssHal::CommUart *)this);
  std::unique_ptr<GnssHal::CommUart::AsyncReader>::reset[abi:ne180100]((_QWORD **)this + 8, 0);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
}

{
  GnssHal::CommUart::~CommUart(this);
  JUMPOUT(0x22E2C8E68);
}

BOOL GnssHal::CommUart::open(GnssHal::CommUart *this)
{
  NSObject *v2;
  uint64_t v3;
  const std::string::value_type **v4;
  std::string::size_type v5;
  std::string *p_p;
  int v7;
  NSObject *v8;
  dispatch_queue_t *v9;
  NSObject *v10;
  std::string *v12;
  int v13;
  std::string __p;
  uint8_t buf[4];
  std::string *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this))
  {
    v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(__p.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEBUG, "#comm,already open", (uint8_t *)&__p, 2u);
    }
    return *((_BYTE *)this + 60) != 0;
  }
  v4 = (const std::string::value_type **)((char *)this + 24);
  if (*((char *)this + 47) < 0)
  {
    v5 = *((_QWORD *)this + 4);
    if (v5)
    {
      std::string::__init_copy_ctor_external(&__p, *v4, v5);
      goto LABEL_11;
    }
  }
  else if (*((_BYTE *)this + 47))
  {
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v4;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)this + 5);
    goto LABEL_11;
  }
  GpsdPlatformInfo::instance(0);
  std::string::basic_string[abi:ne180100]<0>(&__p, "/dev/cu.gps");
LABEL_11:
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v7 = open((const char *)p_p, 131074, __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2]);
  *((_DWORD *)this + 14) = v7;
  v8 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v12 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315394;
    v16 = v12;
    v17 = 1026;
    v18 = 131074;
    _os_log_debug_impl(&dword_2293C9000, v8, OS_LOG_TYPE_DEBUG, "#comm,open,%s,flag,0x%{public}X", buf, 0x12u);
    v7 = *((_DWORD *)this + 14);
  }
  if (v7 == -1)
  {
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v13 = *__error();
      *(_DWORD *)buf = 67240192;
      LODWORD(v16) = v13;
      _os_log_error_impl(&dword_2293C9000, v10, OS_LOG_TYPE_ERROR, "#comm,open,errno,%{public}d", buf, 8u);
    }
  }
  else if ((*(unsigned int (**)(GnssHal::CommUart *))(*(_QWORD *)this + 112))(this)
         && GnssHal::CommUart::configure(this))
  {
    v9 = (dispatch_queue_t *)*((_QWORD *)this + 8);
    if (v9)
      GnssHal::CommUart::AsyncReader::open(v9);
    v3 = 1;
    goto LABEL_24;
  }
  v3 = 0;
LABEL_24:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

void sub_2293D936C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::CommUart::configure(GnssHal::CommUart *this)
{
  int v2;
  speed_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  tcflag_t v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  int v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  speed_t v25;
  uint8_t buf[4];
  _BYTE v27[10];
  _QWORD v28[2];
  termios v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (tcgetattr(*((_DWORD *)this + 14), &v29) == -1)
  {
    v9 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v21 = *__error();
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v27 = v21;
    v6 = "#comm,configure,tcgetattr failed,%{public}d";
LABEL_27:
    v7 = v9;
    v8 = 8;
    goto LABEL_28;
  }
  cfmakeraw(&v29);
  v29.c_cc[16] = 0;
  v29.c_cc[17] = *((_BYTE *)this + 17);
  if (v29.c_cc[17])
  {
    v24 = 115200;
    v25 = 115200;
    v2 = GnssHal::CommUart::Config::lookupBaudRate((GnssHal::CommUart *)((char *)this + 16), &v25, &v24);
    v3 = v25;
    if (cfsetspeed(&v29, v25))
    {
      v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v5 = *__error();
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)v27 = v3;
        *(_WORD *)&v27[8] = 1026;
        LODWORD(v28[0]) = v5;
        v6 = "#comm,configure,cfsetspeed failed,%{public}lu,%{public}d";
        v7 = v4;
LABEL_6:
        v8 = 18;
LABEL_28:
        _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      }
LABEL_8:
      v10 = 0;
      *((_BYTE *)this + 60) = 0;
      return v10;
    }
    v13 = v29.c_cflag | 0x30300;
    if (!*((_BYTE *)this + 16))
      v13 = v29.c_cflag & 0xFFFFFFFFFFFCFCFFLL | 0x300;
    v29.c_cflag = v13;
    if (tcsetattr(*((_DWORD *)this + 14), 0, &v29))
    {
      v9 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v14 = *__error();
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v27 = v14;
      v6 = "#comm,configure,tcsetattr failed,%{public}d";
      goto LABEL_27;
    }
    if (v2)
    {
      v15 = ioctl(*((_DWORD *)this + 14), 0x80085402uLL, &v24);
      v16 = GpsdLogObjectGeneral;
      if (v15 == -1)
      {
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        v22 = v24;
        v23 = *__error();
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)v27 = v22;
        *(_WORD *)&v27[8] = 1026;
        LODWORD(v28[0]) = v23;
        v6 = "#comm,configure,IOSSIOSPEED failed,%{public}lu,%{public}d";
        v7 = v16;
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v27 = v24;
        *(_WORD *)&v27[8] = 2048;
        v28[0] = v3;
        _os_log_debug_impl(&dword_2293C9000, v16, OS_LOG_TYPE_DEBUG, "#comm,configure,IOSSIOSPEED,%lu,standardSpeed,%lu", buf, 0x16u);
      }
    }
    v17 = GpsdLogObjectGeneral;
    v10 = 1;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      v18 = *((unsigned __int8 *)this + 16);
      v19 = *((unsigned __int8 *)this + 17);
      v20 = v24;
      if (!v2)
        v20 = v3;
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v27 = v18;
      *(_WORD *)&v27[4] = 1026;
      *(_DWORD *)&v27[6] = v19;
      LOWORD(v28[0]) = 2050;
      *(_QWORD *)((char *)v28 + 2) = v20;
      _os_log_impl(&dword_2293C9000, v17, OS_LOG_TYPE_INFO, "#comm,configured,flowCtrl,%{public}d,timeoutTenths,%{public}d,baud,%{public}lu", buf, 0x18u);
    }
  }
  else
  {
    v11 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v11, OS_LOG_TYPE_ERROR, "#comm,configure,timeoutTenthsOfSeconds is 0", buf, 2u);
    }
    return 0;
  }
  return v10;
}

void GnssHal::CommUart::AsyncReader::open(dispatch_queue_t *this)
{
  int v2;
  dispatch_source_t v3;
  NSObject *v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  std::string v9;
  std::string v10;
  std::string v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (*((uint64_t (**)(dispatch_queue_t))(*this)->isa + 5))(*this);
  v3 = dispatch_source_create(MEMORY[0x24BDACA00], v2, 0, this[2]);
  this[7] = v3;
  if (!v3)
  {
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "#comm,async,readSrc,nullptr", buf, 2u);
      v7 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommUart.mm";
      v14 = 1026;
      v15 = 456;
      v16 = 2082;
      v17 = "open";
      _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v11, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v10, "open");
    std::string::basic_string[abi:ne180100]<0>(&v9, "#comm,async,readSrc,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v11, (uint64_t)&v10, (uint64_t)&v9);
    std::string::~string(&v9);
    std::string::~string(&v10);
    std::string::~string(&v11);
    __assert_rtn("open", "GnssHalCommUart.mm", 456, "false && \"#comm,async,readSrc,nullptr\"");
  }
  std::vector<unsigned char>::reserve((unint64_t *)this + 8, 0x1000uLL);
  v4 = this[7];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___ZN7GnssHal8CommUart11AsyncReader4openEv_block_invoke;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  v8[4] = this;
  dispatch_source_set_event_handler(v4, v8);
  dispatch_resume(this[7]);
  if (this[1])
  {
    v5 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
    if (v5 <= 4 && ((1 << v5) & 0x19) != 0)
    {
      (*((void (**)(dispatch_queue_t))this[1]->isa + 2))(this[1]);
      usleep(0x4E20u);
      (*((void (**)(dispatch_queue_t))this[1]->isa + 3))(this[1]);
      usleep(0x186A0u);
      v6 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEBUG, "#comm,async,powerOnChip", buf, 2u);
      }
    }
  }
}

void sub_2293D9A0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  if (a31 < 0)
    operator delete(a26);
  _Unwind_Resume(exception_object);
}

void GnssHal::CommUart::close(GnssHal::CommUart *this)
{
  GnssHal::CommUart::AsyncReader *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint32_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this))
  {
    v2 = (GnssHal::CommUart::AsyncReader *)*((_QWORD *)this + 8);
    if (v2)
      GnssHal::CommUart::AsyncReader::close(v2);
    if (close(*((_DWORD *)this + 14)) < 0)
    {
      v9 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *__error();
        v11[0] = 67240192;
        v11[1] = v10;
        v4 = "#comm,close,errno,%{public}d";
        v5 = v9;
        v6 = OS_LOG_TYPE_DEFAULT;
        v7 = 8;
        goto LABEL_11;
      }
    }
    else
    {
      v3 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11[0]) = 0;
        v4 = "#comm,close,completed";
        v5 = v3;
        v6 = OS_LOG_TYPE_INFO;
        v7 = 2;
LABEL_11:
        _os_log_impl(&dword_2293C9000, v5, v6, v4, (uint8_t *)v11, v7);
      }
    }
    *((_DWORD *)this + 14) = -1;
    return;
  }
  v8 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_2293C9000, v8, OS_LOG_TYPE_INFO, "#comm,close,not open", (uint8_t *)v11, 2u);
  }
}

void GnssHal::CommUart::AsyncReader::close(GnssHal::CommUart::AsyncReader *this)
{
  unsigned int v2;
  BOOL v3;
  int v4;
  void *v6;

  if (*((_QWORD *)this + 1))
  {
    v2 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
    v3 = v2 > 4;
    v4 = (1 << v2) & 0x19;
    if (!v3 && v4 != 0)
      (*(void (**)(_QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1));
  }
  dispatch_release(*((dispatch_object_t *)this + 7));
  v6 = (void *)*((_QWORD *)this + 8);
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  if (v6)
    operator delete(v6);
}

BOOL GnssHal::CommUart::waitForDataAvailable(GnssHal::CommUart *this)
{
  int v2;
  int v3;
  _BOOL8 v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  int v11;
  NSObject *v12;
  int v13;
  int *v14;
  char *v15;
  fd_set v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (((*(uint64_t (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this) & 1) != 0)
  {
    v2 = *((_DWORD *)this + 14);
    memset(&v16, 0, sizeof(v16));
    if (__darwin_check_fd_set_overflow(v2, &v16, 0))
      *(__int32_t *)((char *)v16.fds_bits + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v2;
    v3 = select(v2 + 1, &v16, 0, 0, 0);
    v4 = v3 >= 0;
    if (v3 < 0)
    {
      v11 = *__error();
      v12 = GpsdLogObjectGeneral;
      if (v11 == 9)
      {
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67240192;
          v18 = v2;
          _os_log_impl(&dword_2293C9000, v12, OS_LOG_TYPE_INFO, "#comm,select,interrupted,fd,%{public}d", buf, 8u);
        }
      }
      else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v13 = *__error();
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 67240706;
        v18 = v13;
        v19 = 2082;
        v20 = v15;
        v21 = 1026;
        v22 = v2;
        v6 = "#comm,select,errno,%{public}d,%{public}s,fd,%{public}d";
        v7 = v12;
        v8 = 24;
        goto LABEL_17;
      }
    }
    else if (*((_BYTE *)this + 61))
    {
      v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v6 = "#comm,rx data while in sleep";
        v7 = v5;
        v8 = 2;
LABEL_17:
        _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      }
    }
  }
  else
  {
    v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16.fds_bits[0]) = 0;
      _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "#comm,waitForDataAvailable,portNotOpen", (uint8_t *)&v16, 2u);
    }
    return 0;
  }
  return v4;
}

uint64_t GnssHal::CommUart::readTimeout(GnssHal::CommUart *this, unsigned __int8 *a2, size_t a3)
{
  const char *v6;
  const unsigned __int8 *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  int v14;
  int v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)this + 60)
    || ((*(uint64_t (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this) & 1) == 0)
  {
    v10 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *((unsigned __int8 *)this + 60);
      v12 = (*(uint64_t (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this);
      v14 = 67240448;
      v15 = v11;
      v16 = 1026;
      LODWORD(v17) = v12;
      _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEFAULT, "#comm,read,unavailable,good,%{public}d,open,%{public}d", (uint8_t *)&v14, 0xEu);
    }
    return -1;
  }
  v7 = (const unsigned __int8 *)read(*((_DWORD *)this + 14), a2, a3);
  if (*((_BYTE *)this + 8))
    gpsd::util::logBinaryBytes((gpsd::util *)a2, v7, (uint64_t)"#comm,read", v6);
  if (v7 == (const unsigned __int8 *)-1)
  {
    v8 = *__error();
    v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v14 = 67240450;
      v15 = v8;
      v16 = 2082;
      v17 = strerror(v8);
      _os_log_debug_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEBUG, "#comm,read,errno,%{public}d,%{public}s", (uint8_t *)&v14, 0x12u);
    }
    if (v8 == 35)
      return 0;
    *((_BYTE *)this + 60) = 0;
    return -1;
  }
  return (uint64_t)v7;
}

uint64_t GnssHal::CommUart::isReadCallbackSupported(GnssHal::CommUart *this)
{
  id *v1;

  v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::usesAsyncCommRead(v1);
}

BOOL GnssHal::CommUart::setReadCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _BYTE v6[24];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
    GnssHal::CommUart::AsyncReader::setReadCallback(v2, (uint64_t)v6);
    v3 = v7;
    if (v7 == v6)
    {
      v4 = 4;
      v3 = v6;
      goto LABEL_6;
    }
    if (v7)
    {
      v4 = 5;
LABEL_6:
      (*(void (**)(void))(*v3 + 8 * v4))();
    }
  }
  return v2 != 0;
}

void sub_2293DA104(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::CommUart::AsyncReader::setReadCallback(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = (_QWORD *)(a1 + 24);
  if (*(_QWORD *)(a1 + 48))
  {
    v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "#comm,setReadCallback,alreadySet", buf, 2u);
    }
  }
  std::function<void ()(unsigned char *,unsigned long)>::operator=(v3, a2);
  v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEBUG, "#comm,setReadCallback", v7, 2u);
  }
  return 1;
}

BOOL GnssHal::CommUart::readComplete(GnssHal::CommUart *this, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = 0;
  do
  {
    v7 = v6;
    if (a3 <= v6)
      break;
    v8 = (*(uint64_t (**)(GnssHal::CommUart *, unsigned __int8 *, unint64_t))(*(_QWORD *)this + 56))(this, &a2[v6], a3 - v6);
    v6 = v8 + v7;
  }
  while ((v8 & 0x8000000000000000) == 0);
  return a3 == v7;
}

unint64_t GnssHal::CommUart::write(GnssHal::CommUart *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  _BYTE v18[10];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 8))
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#comm,write", a4);
  if (!*((_BYTE *)this + 60)
    || ((*(uint64_t (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this) & 1) == 0)
  {
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v15 = *((unsigned __int8 *)this + 60);
      v16 = (*(uint64_t (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this);
      v17 = 67240448;
      *(_DWORD *)v18 = v15;
      *(_WORD *)&v18[4] = 1026;
      *(_DWORD *)&v18[6] = v16;
      _os_log_debug_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEBUG, "#comm,write,unavailable,good,%{public}d,open,%{public}d", (uint8_t *)&v17, 0xEu);
    }
    return -1;
  }
  v7 = write(*((_DWORD *)this + 14), a2, (size_t)a3);
  if (v7 != -1)
  {
    v8 = v7;
    if (v7 < (unint64_t)a3)
    {
      v9 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        v17 = 134349312;
        *(_QWORD *)v18 = a3;
        *(_WORD *)&v18[8] = 1026;
        v19 = v8;
        _os_log_debug_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEBUG, "#comm,write,overflow,toWrite,%{public}zu,done,%{public}d,retry", (uint8_t *)&v17, 0x12u);
      }
    }
    return v8;
  }
  v12 = *__error();
  if (v12 != 35)
  {
    *((_BYTE *)this + 60) = 0;
    v14 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67240192;
      *(_DWORD *)v18 = v12;
      _os_log_impl(&dword_2293C9000, v14, OS_LOG_TYPE_DEFAULT, "#comm,write,errno,%{public}d", (uint8_t *)&v17, 8u);
    }
    return -1;
  }
  v13 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v17 = 67240192;
    *(_DWORD *)v18 = 35;
    _os_log_debug_impl(&dword_2293C9000, v13, OS_LOG_TYPE_DEBUG, "#comm,write,errno,%{public}d", (uint8_t *)&v17, 8u);
  }
  return 0;
}

BOOL GnssHal::CommUart::writeComplete(GnssHal::CommUart *this, const unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = 0;
  do
  {
    v7 = v6;
    if (a3 <= v6)
      break;
    v8 = (*(uint64_t (**)(GnssHal::CommUart *, const unsigned __int8 *, unint64_t))(*(_QWORD *)this + 88))(this, &a2[v6], a3 - v6);
    v6 = v8 + v7;
  }
  while ((v8 & 0x8000000000000000) == 0);
  return a3 == v7;
}

BOOL GnssHal::CommUart::enterLowPowerMode(GnssHal::CommUart *this)
{
  _BOOL8 v2;
  NSObject *v3;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = GnssHal::CommUart::setRtsState((uint64_t)this, 0);
  v3 = GpsdLogObjectGeneral;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEFAULT, "#comm,enterLowPowerMode,success", buf, 2u);
    }
    *((_BYTE *)this + 61) = 1;
  }
  else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "#comm,enterLowPowerMode,failure", v5, 2u);
  }
  return v2;
}

BOOL GnssHal::CommUart::setRtsState(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  _BOOL8 result;
  int v7;
  int v8;
  int v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    v11 = a2;
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "#comm,setRtsState,%{public}d", buf, 8u);
  }
  v9 = 4;
  if (a2 != 1)
  {
    if (!a2 && ioctl(*(_DWORD *)(a1 + 56), 0x8004746BuLL, &v9) < 0)
    {
      v5 = GpsdLogObjectGeneral;
      result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
      if (result)
      {
        v7 = *__error();
        *(_DWORD *)buf = 67240448;
        v11 = 0;
        v12 = 1026;
        v13 = v7;
LABEL_13:
        _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "#comm,setRtsState,%{public}d,ioctl error,%{public}d", buf, 0xEu);
        return 0;
      }
      return result;
    }
    return 1;
  }
  if ((ioctl(*(_DWORD *)(a1 + 56), 0x8004746CuLL, &v9) & 0x80000000) == 0)
    return 1;
  v5 = GpsdLogObjectGeneral;
  result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v8 = *__error();
    *(_DWORD *)buf = 67240448;
    v11 = 1;
    v12 = 1026;
    v13 = v8;
    goto LABEL_13;
  }
  return result;
}

BOOL GnssHal::CommUart::exitLowPowerMode(GnssHal::CommUart *this)
{
  _BOOL8 v2;
  NSObject *v3;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = GnssHal::CommUart::setRtsState((uint64_t)this, 1);
  v3 = GpsdLogObjectGeneral;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEFAULT, "#comm,exitLowPowerMode,success", buf, 2u);
    }
    *((_BYTE *)this + 61) = 0;
  }
  else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "#comm,exitLowPowerMode,failure", v5, 2u);
  }
  return v2;
}

BOOL GnssHal::CommUart::readWriteFlush(GnssHal::CommUart *this)
{
  NSObject *v2;
  int v3;
  _BOOL8 result;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (((*(uint64_t (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this) & 1) != 0)
  {
    if (tcflush(*((_DWORD *)this + 14), 3))
    {
      v2 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *__error();
        v7[0] = 67240192;
        v7[1] = v3;
        _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#comm,readWriteFlush,TCIOFLUSH error,%{public}d", (uint8_t *)v7, 8u);
      }
      result = 0;
      *((_BYTE *)this + 60) = 0;
    }
    else
    {
      v6 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7[0]) = 0;
        _os_log_debug_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEBUG, "#comm,readWriteFlush,success", (uint8_t *)v7, 2u);
      }
      return 1;
    }
  }
  else
  {
    v5 = GpsdLogObjectGeneral;
    result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
    if (result)
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_INFO, "#comm,readWriteFlush,not open", (uint8_t *)v7, 2u);
      return 0;
    }
  }
  return result;
}

BOOL GnssHal::CommUart::readFlush(GnssHal::CommUart *this)
{
  int v2;
  NSObject *v3;
  int v4;
  _BOOL8 result;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (((*(uint64_t (**)(GnssHal::CommUart *))(*(_QWORD *)this + 32))(this) & 1) != 0)
  {
    v2 = tcflush(*((_DWORD *)this + 14), 1);
    v3 = GpsdLogObjectGeneral;
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        v4 = *__error();
        v7[0] = 67240192;
        v7[1] = v4;
        _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_INFO, "#comm,readFlush,TCIFLUSH error,%{public}d", (uint8_t *)v7, 8u);
      }
      result = 0;
      *((_BYTE *)this + 60) = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7[0]) = 0;
        _os_log_debug_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEBUG, "#comm,readFlush,success", (uint8_t *)v7, 2u);
      }
      return 1;
    }
  }
  else
  {
    v6 = GpsdLogObjectGeneral;
    result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
    if (result)
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_INFO, "#comm,readFlush,not open", (uint8_t *)v7, 2u);
      return 0;
    }
  }
  return result;
}

uint64_t GnssHal::CommUart::Config::lookupBaudRate(GnssHal::CommUart::Config *this, unint64_t *a2, unint64_t *a3)
{
  int v5;
  uint64_t result;
  unint64_t v7;

  if (*((_BYTE *)this + 36))
    v5 = *((_DWORD *)this + 8);
  else
    v5 = GnssHal::CommUart::Config::platformDefaultBaudRate(this);
  result = 0;
  *a2 = 115200;
  switch(v5)
  {
    case 0:
      result = 0;
      *a2 = 9600;
      return result;
    case 1:
      v7 = 921600;
      goto LABEL_12;
    case 3:
      v7 = 1000000;
      goto LABEL_12;
    case 4:
      v7 = 2400000;
      goto LABEL_12;
    case 5:
      v7 = 3000000;
      goto LABEL_12;
    case 6:
      v7 = 3200000;
      goto LABEL_12;
    case 7:
      v7 = 4800000;
LABEL_12:
      *a3 = v7;
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GnssHal::CommUart::Config::platformDefaultBaudRate(GnssHal::CommUart::Config *this)
{
  id *v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 201)
  {
    v1 = (id *)GpsdPreferences::instance(0);
    if (GpsdPreferences::baudRate4M8(v1))
      return 7;
    else
      return 4;
  }
  else if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 103
         || *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 106)
  {
    return 6;
  }
  else
  {
    v3 = GpsdLogObjectGeneral;
    v2 = 1;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
    {
      v5[0] = 67109120;
      v5[1] = 1;
      _os_log_fault_impl(&dword_2293C9000, v3, OS_LOG_TYPE_FAULT, "UnsupportedHardware,defaultRate,%d,used", (uint8_t *)v5, 8u);
    }
  }
  return v2;
}

void GnssHal::CommUart::pulseTimeMarkStrobe(GnssHal::CommUart *this@<X0>, uint64_t a2@<X8>)
{
  NSObject *v4;
  GnssHal::CommUart::AsyncReader *v5;
  NSObject *v6;
  __int128 v7;
  char v8;

  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "#comm,CommUart::pulseTimeMarkStrobe", (uint8_t *)&v7, 2u);
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  v5 = (GnssHal::CommUart::AsyncReader *)*((_QWORD *)this + 8);
  if (v5)
  {
    GnssHal::CommUart::AsyncReader::pulseTimeMarkStrobe(v5, (uint64_t)&v7);
    *(_OWORD *)a2 = v7;
    *(_BYTE *)(a2 + 16) = v8;
  }
  else
  {
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#comm,fAsyncReader,null", (uint8_t *)&v7, 2u);
    }
  }
}

void GnssHal::CommUart::AsyncReader::pulseTimeMarkStrobe(GnssHal::CommUart::AsyncReader *this@<X0>, uint64_t a2@<X8>)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  char v8;

  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "#comm,CommUart::AsyncReader::pulseTimeMarkStrobe", (uint8_t *)&v7, 2u);
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  v5 = *((_QWORD *)this + 1);
  if (v5)
  {
    (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)v5 + 48))(&v7);
    *(_OWORD *)a2 = v7;
    *(_BYTE *)(a2 + 16) = v8;
  }
  else
  {
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#comm,fGpio,null", (uint8_t *)&v7, 2u);
    }
  }
}

dispatch_queue_t GnssHal::CommUart::AsyncReader::createDispatchQueue(GnssHal::CommUart::AsyncReader *this)
{
  id *v1;
  dispatch_qos_class_t v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t result;
  NSObject *v6;
  std::string v7;
  std::string v8;
  std::string v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)GpsdPreferences::instance(0);
  v2 = GpsdPreferences::maxSchedulerQos(v1);
  v3 = dispatch_queue_attr_make_with_qos_class(0, v2, 0);
  if (!v3)
  {
    v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "#comm,async,nullattr", buf, 2u);
    }
  }
  result = dispatch_queue_create("com.apple.gpsd.comm", v3);
  if (!result)
  {
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#comm,async,createQ,nullptr", buf, 2u);
      v6 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommUart.mm";
      v12 = 1026;
      v13 = 439;
      v14 = 2082;
      v15 = "createDispatchQueue";
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v9, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v8, "createDispatchQueue");
    std::string::basic_string[abi:ne180100]<0>(&v7, "#comm,async,createQ,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v9, (uint64_t)&v8, (uint64_t)&v7);
    std::string::~string(&v7);
    std::string::~string(&v8);
    std::string::~string(&v9);
    __assert_rtn("createDispatchQueue", "GnssHalCommUart.mm", 439, "false && \"#comm,async,createQ,nullptr\"");
  }
  return result;
}

void sub_2293DB0EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

_QWORD *std::function<void ()(unsigned char *,unsigned long)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::swap[abi:ne180100](v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::vector<unsigned char>::reserve(unint64_t *a1, size_t __sz)
{
  unint64_t v2;
  char *v5;
  _BYTE *v6;
  char *v7;
  _BYTE *v8;
  char *v9;
  char v10;

  v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
    v5 = (char *)a1[1];
    v6 = operator new(__sz);
    v7 = &v5[(_QWORD)v6 - v2];
    v8 = v7;
    if (v5 != (char *)v2)
    {
      v9 = &v5[~v2];
      do
      {
        v10 = *--v5;
        (v9--)[(_QWORD)v6] = v10;
      }
      while (v5 != (char *)v2);
      v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
      operator delete((void *)v2);
  }
}

uint64_t ___ZN7GnssHal8CommUart11AsyncReader4openEv_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  v1 = *(_QWORD **)(a1 + 32);
  result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)*v1 + 56))(*v1, v1[8], v1[10] - v1[8]);
  if (result >= 1)
  {
    if (v1[6])
      return std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)(v1 + 3), v1[8], result);
  }
  return result;
}

uint64_t std::function<void ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = a3;
  v6 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v3 + 48))(v3, &v6, &v5);
}

BOOL GnssHal::CommUart::isOpen(GnssHal::CommUart *this)
{
  return *((_DWORD *)this + 14) != -1;
}

uint64_t GnssHal::CommUart::getFileDescriptor(GnssHal::CommUart *this)
{
  return *((unsigned int *)this + 14);
}

double GnssHal::CommUart::getTimeoutValueSeconds(GnssHal::CommUart *this, double a2)
{
  LOBYTE(a2) = *((_BYTE *)this + 17);
  return (double)*(unint64_t *)&a2 * 10.0;
}

_QWORD **std::unique_ptr<GnssHal::CommUart::AsyncReader>::reset[abi:ne180100](_QWORD **result, _QWORD *a2)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    GnssHal::CommUart::AsyncReader::close((GnssHal::CommUart::AsyncReader *)v2);
    v3 = (void *)v2[8];
    if (v3)
    {
      v2[9] = v3;
      operator delete(v3);
    }
    v4 = (_QWORD *)v2[6];
    if (v4 == v2 + 3)
    {
      v5 = 4;
      v4 = v2 + 3;
    }
    else
    {
      if (!v4)
        goto LABEL_10;
      v5 = 5;
    }
    (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_10:
    v6 = v2[1];
    v2[1] = 0;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    JUMPOUT(0x22E2C8E68);
  }
  return result;
}

_QWORD *std::__function::__value_func<void ()(unsigned char *,unsigned long)>::swap[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2293DB558(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

_QWORD *std::function<void ()(unsigned char *,unsigned long)>::~function(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)a1[3];
  if (v2 == a1)
  {
    v3 = 4;
    v2 = a1;
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

_QWORD *std::function<void ()(std::string)>::~function(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)a1[3];
  if (v2 == a1)
  {
    v3 = 4;
    v2 = a1;
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

uint64_t GnssHal::CommPcie::CommPcie(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  NSObject *v5;
  _QWORD *v6;
  uint8_t *v7;
  uint8_t *v8;
  uint64_t v9;
  uint8_t v11[24];
  uint8_t *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = &off_24F20B9E0;
  *(_BYTE *)(a1 + 96) = 0;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 104, a3);
  if (qword_255A4BDC8)
  {
    v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "#pcie,sReadCallbackFunction collision", v11, 2u);
    }
  }
  v6 = (_QWORD *)a2[3];
  if (!v6)
  {
    v12 = 0;
    v8 = (uint8_t *)qword_255A4BDE8;
    if ((uint64_t *)qword_255A4BDE8 != &qword_255A4BDD0)
    {
      v7 = 0;
LABEL_12:
      v12 = v8;
      qword_255A4BDE8 = (uint64_t)v7;
      goto LABEL_17;
    }
LABEL_13:
    v8 = v11;
    (*(void (**)(void))(qword_255A4BDD0 + 24))();
    (*(void (**)(uint64_t))(*(_QWORD *)qword_255A4BDE8 + 32))(qword_255A4BDE8);
    qword_255A4BDE8 = (uint64_t)v12;
    v12 = v11;
    v9 = 4;
LABEL_21:
    (*(void (**)(uint8_t *))(*(_QWORD *)v8 + 8 * v9))(v8);
    return a1;
  }
  if (v6 == a2)
  {
    v12 = v11;
    (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, v11);
    v7 = v12;
  }
  else
  {
    v7 = (uint8_t *)(*(uint64_t (**)(_QWORD *))(*v6 + 16))(v6);
    v12 = v7;
  }
  v8 = (uint8_t *)qword_255A4BDE8;
  if (v7 != v11)
  {
    if ((uint64_t *)qword_255A4BDE8 != &qword_255A4BDD0)
      goto LABEL_12;
    goto LABEL_13;
  }
  if ((uint64_t *)qword_255A4BDE8 == &qword_255A4BDD0)
  {
    (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v11 + 24))(v11, v13);
    (*(void (**)(uint8_t *))(*(_QWORD *)v12 + 32))(v12);
    v12 = 0;
    (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)qword_255A4BDE8 + 24))(qword_255A4BDE8, v11);
    (*(void (**)(uint64_t))(*(_QWORD *)qword_255A4BDE8 + 32))(qword_255A4BDE8);
    qword_255A4BDE8 = 0;
    v12 = v11;
    (*(void (**)(_QWORD *, uint64_t *))(v13[0] + 24))(v13, &qword_255A4BDD0);
    (*(void (**)(_QWORD *))(v13[0] + 32))(v13);
    qword_255A4BDE8 = (uint64_t)&qword_255A4BDD0;
    v8 = v12;
  }
  else
  {
    (*(void (**)(uint8_t *, uint64_t *))(*(_QWORD *)v11 + 24))(v11, &qword_255A4BDD0);
    (*(void (**)(uint8_t *))(*(_QWORD *)v12 + 32))(v12);
    v8 = (uint8_t *)qword_255A4BDE8;
    v12 = (uint8_t *)qword_255A4BDE8;
    qword_255A4BDE8 = (uint64_t)&qword_255A4BDD0;
  }
LABEL_17:
  if (v8 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_21;
  }
  if (v8)
  {
    v9 = 5;
    goto LABEL_21;
  }
  return a1;
}

void sub_2293DB89C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = *(_QWORD **)(v1 + 128);
  if (v4 == v2)
  {
    v5 = 4;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
    v2 = *(_QWORD **)(v1 + 128);
  }
  (*(void (**)(_QWORD *))(*v2 + 8 * v5))(v2);
LABEL_6:
  _Unwind_Resume(exception_object);
}

void GnssHal::CommPcie::~CommPcie(GnssHal::CommPcie **this)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  GnssHal::CommPcie *v7;
  uint64_t v8;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  *this = (GnssHal::CommPcie *)&off_24F20B9E0;
  GnssHal::CommPcie::close((GnssHal::CommPcie *)this);
  v2 = (uint64_t *)qword_255A4BDE8;
  qword_255A4BDE8 = 0;
  if (v2 == &qword_255A4BDD0)
  {
    v3 = 4;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  if (*((_BYTE *)this + 96))
  {
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "#pcie,freeInternal", buf, 2u);
    }
    v5 = TelephonyUtilTransportFree();
    v6 = GpsdLogObjectGeneral;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEFAULT, "#pcie,freeInternal,success", v10, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#pcie,freeInternal,failure", v9, 2u);
    }
    *((_BYTE *)this + 96) = 0;
  }
  v7 = this[16];
  if (v7 == (GnssHal::CommPcie *)(this + 13))
  {
    v8 = 4;
    v7 = (GnssHal::CommPcie *)(this + 13);
  }
  else
  {
    if (!v7)
      return;
    v8 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
}

{
  GnssHal::CommPcie::~CommPcie(this);
  JUMPOUT(0x22E2C8E68);
}

uint64_t GnssHal::CommPcie::setReadCallback(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _BOOL4 v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  std::function<void ()(unsigned char *,unsigned long)>::operator=(_MergedGlobals_0, a2);
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a2 + 24) != 0;
    v6[0] = 67240192;
    v6[1] = v4;
    _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEFAULT, "#pcie,setReadCallback,%{public}d", (uint8_t *)v6, 8u);
  }
  return 1;
}

uint64_t GnssHal::CommPcie::open(GnssHal::CommPcie *this)
{
  return GnssHal::CommPcie::openInternal(this, 30);
}

uint64_t GnssHal::CommPcie::openInternal(GnssHal::CommPcie *this, int a2)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v6;
  char v7;
  uint8_t v9[8];
  _QWORD v10[5];
  uint8_t buf[4];
  int v12;
  _QWORD *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  if (*((_BYTE *)this + 96))
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#pcie,open,already open", buf, 2u);
    }
    return 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      v12 = a2;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "#pcie,open,creating,timeout,%{public}d", buf, 8u);
    }
    TelephonyBasebandPCITransportInitParameters();
    *(_DWORD *)buf = 14;
    v14 = 1000 * a2;
    v15 |= 5u;
    v16 = 0x100000000004;
    v19 = 25;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke;
    v10[3] = &__block_descriptor_40_e16_v28__0i8_v12_v20l;
    v10[4] = this;
    v13 = v10;
    v17 = &__block_literal_global;
    v18 = &__block_literal_global_7;
    v3 = TelephonyBasebandPCITransportCreate();
    v6 = GpsdLogObjectGeneral;
    if ((_DWORD)v3)
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEFAULT, "#pcie,open,success", v9, 2u);
      }
      v7 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#pcie,open,failure", v9, 2u);
      }
      v7 = 0;
    }
    *((_BYTE *)this + 96) = v7;
  }
  return v3;
}

void ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  std::string *v13;
  uint64_t *v14;
  uint64_t v15;
  std::string __p;
  std::string v17;
  uint8_t buf[4];
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 32);
  memset(&v17, 0, sizeof(v17));
  if (a2)
  {
    if (a2 == 1)
    {
      v8 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134283777;
        *(_QWORD *)v19 = a3;
        *(_WORD *)&v19[8] = 2049;
        *(_QWORD *)&v19[10] = a4;
        _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "#pcie,statusBlock,PCITransportStatusError,%{private}p,%{private}p", buf, 0x16u);
      }
      v9 = "#pcie_TransportStatusError";
    }
    else
    {
      v11 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240705;
        *(_DWORD *)v19 = a2;
        *(_WORD *)&v19[4] = 2049;
        *(_QWORD *)&v19[6] = a3;
        *(_WORD *)&v19[14] = 2049;
        *(_QWORD *)&v19[16] = a4;
        _os_log_error_impl(&dword_2293C9000, v11, OS_LOG_TYPE_ERROR, "#pcie,statusBlock,Unrecognized status 0x%{public}08x,%{private}p,%{private}p", buf, 0x1Cu);
      }
      v9 = "#pcie_UnknownStatus";
    }
  }
  else
  {
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283777;
      *(_QWORD *)v19 = a3;
      *(_WORD *)&v19[8] = 2049;
      *(_QWORD *)&v19[10] = a4;
      _os_log_error_impl(&dword_2293C9000, v10, OS_LOG_TYPE_ERROR, "#pcie,statusBlock,PCITransportStatusNotReady,%{private}p,%{private}p", buf, 0x16u);
    }
    v9 = "#pcie_TransportStatusNotReady";
  }
  MEMORY[0x22E2C8BA4](&v17, v9);
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
  if (!qword_255A4BDE8)
    exit(-1);
  v12 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v13 = &v17;
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)v19 = v13;
    _os_log_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEFAULT, "#pcie,invoking exit callback,%{public}s", buf, 0xCu);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  else
    __p = v17;
  if (!qword_255A4BDE8)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, std::string *))(*(_QWORD *)qword_255A4BDE8 + 48))(qword_255A4BDE8, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v14 = (uint64_t *)qword_255A4BDE8;
  qword_255A4BDE8 = 0;
  if (v14 == &qword_255A4BDD0)
  {
    v15 = 4;
  }
  else
  {
    if (!v14)
      goto LABEL_28;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_28:
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
}

void sub_2293DC05C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke_5(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = qword_255A4BDC8;
  if (!a2 && a4 && qword_255A4BDC8)
  {
    std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)_MergedGlobals_0, (uint64_t)a3, a4);
  }
  else
  {
    v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67241216;
      v9[1] = a2;
      v10 = 1026;
      v11 = a2 == -536870165;
      v12 = 1026;
      v13 = a2 == -536870168;
      v14 = 1026;
      v15 = a4;
      v16 = 1026;
      v17 = v7 != 0;
      _os_log_impl(&dword_2293C9000, v8, OS_LOG_TYPE_DEFAULT, "#pcie,async read failure,0x%{public}08x,is_aborted,%{public}d,is_overrun,%{public}d,sz,%{public}u,callback,%{public}d", (uint8_t *)v9, 0x20u);
    }
    free(a3);
  }
}

void ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke_2(uint64_t a1, int a2, uint64_t a3, int a4)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  void *__p[2];
  char v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      v13 = a2;
      v14 = 1026;
      v15 = a4;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#pcie,write error,0x%{public}08x,sz,%{public}u", buf, 0xEu);
    }
    if (!qword_255A4BDE8)
      exit(-2);
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEFAULT, "#pcie,invoking exit callback,#pcie_writeError", buf, 2u);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "#pcie_writeError");
    if (!qword_255A4BDE8)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **))(*(_QWORD *)qword_255A4BDE8 + 48))(qword_255A4BDE8, __p);
    if (v11 < 0)
      operator delete(__p[0]);
    v8 = (uint64_t *)qword_255A4BDE8;
    qword_255A4BDE8 = 0;
    if (v8 == &qword_255A4BDD0)
    {
      v9 = 4;
    }
    else
    {
      if (!v8)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
}

void sub_2293DC374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *GnssHal::CommPcie::close(GnssHal::CommPcie *this)
{
  NSObject *v1;
  _QWORD *result;
  uint64_t v3;
  uint8_t v4[16];

  v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_2293C9000, v1, OS_LOG_TYPE_ERROR, "#pcie,ignoring close", v4, 2u);
  }
  result = (_QWORD *)qword_255A4BDC8;
  qword_255A4BDC8 = 0;
  if (result == (_QWORD *)&_MergedGlobals_0)
  {
    v3 = 4;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t GnssHal::CommPcie::openWithRetries(GnssHal::CommPcie *this, int a2)
{
  gpsd::util *MachContinuousTimeNs;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  int v10;
  NSObject *v11;
  gpsd::util *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  gpsd::util *v18;
  char v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL8 v23;
  unint64_t v24;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  MachContinuousTimeNs = (gpsd::util *)gpsd::util::getMachContinuousTimeNs(this);
  v5 = (double)(unint64_t)MachContinuousTimeNs * 0.000000001;
  v6 = (double)a2;
  v7 = (double)gpsd::util::getMachContinuousTimeNs(MachContinuousTimeNs) * 0.000000001;
  v8 = v5 - v7 + (double)a2;
  v9 = llround(v8);
  if (v9 >= 30)
    v10 = 30;
  else
    v10 = v9;
  if (v10 >= 1)
  {
    do
    {
      v11 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240448;
        v27 = v10;
        v28 = 2050;
        v29 = v8;
        _os_log_impl(&dword_2293C9000, v11, OS_LOG_TYPE_INFO, "#pcie,thisOpen,start,thisTimeoutSec,%{public}d,timeLeftSec,%{public}.3f", buf, 0x12u);
      }
      v12 = (gpsd::util *)GnssHal::CommPcie::openInternal(this, v10);
      v13 = (int)v12;
      v14 = (double)gpsd::util::getMachContinuousTimeNs(v12) * 0.000000001;
      v15 = v14 - v7;
      v16 = v5 - v14 + v6;
      v17 = GpsdLogObjectGeneral;
      v18 = (gpsd::util *)os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v18)
      {
        *(_DWORD *)buf = 67240704;
        v27 = v13;
        v28 = 2050;
        v29 = v15;
        v30 = 2050;
        v31 = v16;
        _os_log_impl(&dword_2293C9000, v17, OS_LOG_TYPE_DEFAULT, "#pcie,thisOpen,success,%{public}d,durationSec,%{public}.3f,timeLeftSec,%{public}.3f", buf, 0x1Cu);
      }
      if (v16 < 5.0)
        v19 = 1;
      else
        v19 = v13;
      if ((v19 & 1) != 0)
        break;
      if (v15 < 5.0)
        v18 = (gpsd::util *)sleep(5u);
      v7 = (double)gpsd::util::getMachContinuousTimeNs(v18) * 0.000000001;
      v8 = v5 - v7 + v6;
      v20 = llround(v8);
      v10 = v20 >= 30 ? 30 : v20;
    }
    while (v10 > 0);
  }
  v21 = (*(uint64_t (**)(GnssHal::CommPcie *))(*(_QWORD *)this + 32))(this);
  v22 = GpsdLogObjectGeneral;
  v23 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    v24 = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v23);
    *(_DWORD *)buf = 67240448;
    v27 = v21;
    v28 = 2050;
    v29 = (double)v24 * 0.000000001 - v5;
    _os_log_impl(&dword_2293C9000, v22, OS_LOG_TYPE_DEFAULT, "#pcie,overallOpen,success,%{public}d,durationSeconds,%{public}.3f", buf, 0x12u);
  }
  return v21;
}

uint64_t GnssHal::CommPcie::waitForDataAvailable(GnssHal::CommPcie *this)
{
  return 0;
}

uint64_t GnssHal::CommPcie::readTimeout(GnssHal::CommPcie *this, unsigned __int8 *a2)
{
  return -1;
}

uint64_t GnssHal::CommPcie::readComplete(GnssHal::CommPcie *this, unsigned __int8 *a2)
{
  return 0;
}

uint64_t GnssHal::CommPcie::write(GnssHal::CommPcie *this, const unsigned __int8 *a2, uint64_t a3)
{
  char *v3;
  uint64_t (*v4)(char *, const unsigned __int8 *, uint64_t, int *, uint64_t, uint64_t, _QWORD);
  uint64_t (*v5)(char *, const unsigned __int8 *, uint64_t, int *, uint64_t, uint64_t, _QWORD);
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[12];
  int v10;

  v10 = 0;
  v5 = (uint64_t (*)(char *, const unsigned __int8 *, uint64_t, int *, uint64_t, uint64_t, _QWORD))*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (!v5 || (v6 = a3, (v4(v3, a2, a3, &v10, 1, 1000, 0) & 1) == 0))
  {
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "#pcie, TelephonyUtilTransportWrite failure", v9, 2u);
    }
    return -1;
  }
  return v6;
}

BOOL GnssHal::CommPcie::writeComplete(GnssHal::CommPcie *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(GnssHal::CommPcie *, const unsigned __int8 *))(*(_QWORD *)this + 88))(this, a2);
  return v4 >= 0 && v4 == a3;
}

uint64_t GnssHal::CommPcie::enterLowPowerMode(GnssHal::CommPcie *this)
{
  NSObject *v1;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "enterLowPowerMode";
    _os_log_error_impl(&dword_2293C9000, v1, OS_LOG_TYPE_ERROR, "#pcie, %s, interface not available on PCIe platform", (uint8_t *)&v3, 0xCu);
  }
  return 0;
}

uint64_t GnssHal::CommPcie::exitLowPowerMode(GnssHal::CommPcie *this)
{
  NSObject *v1;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "exitLowPowerMode";
    _os_log_error_impl(&dword_2293C9000, v1, OS_LOG_TYPE_ERROR, "#pcie, %s, interface not available on PCIe platform", (uint8_t *)&v3, 0xCu);
  }
  return 1;
}

uint64_t GnssHal::CommPcie::readWriteFlush(GnssHal::CommPcie *this)
{
  NSObject *v1;
  uint8_t v3[16];

  v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2293C9000, v1, OS_LOG_TYPE_INFO, "#pcie,readWriteFlush not available on PCIe", v3, 2u);
  }
  return 1;
}

uint64_t GnssHal::CommPcie::readFlush(GnssHal::CommPcie *this)
{
  NSObject *v1;
  uint8_t v3[16];

  v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2293C9000, v1, OS_LOG_TYPE_INFO, "#pcie,readFlush not available on PCIe", v3, 2u);
  }
  return 1;
}

void GnssHal::CommPcie::pulseTimeMarkStrobe(GnssHal::CommPcie *this@<X0>, uint64_t a2@<X8>)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  gpsd::util *v10;
  gpsd::util *MachContinuousTimeNs;
  unint64_t v12;
  std::chrono::steady_clock::time_point v13;
  unsigned int v14;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v15;
  std::chrono::steady_clock::time_point v16;
  std::chrono::steady_clock::time_point v17;
  std::chrono::system_clock::time_point v18;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v19;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v20;
  unsigned int v21;
  NSObject *v22;
  int v23;
  std::mutex *v24;
  unint64_t v25;
  double v26;
  NSObject *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  NSObject *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  unint64_t v46;
  NSObject *v47;
  unint64_t v48;
  NSObject *v49;
  unint64_t v50;
  void *ptr;
  unint64_t v52;
  std::exception_ptr v53;
  int v54;
  int v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  uint64_t *(*v61)(uint64_t);
  void *v62;
  uint64_t v63;
  std::exception_ptr v64;
  _BYTE __lk[22];
  __int16 v66;
  unint64_t v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  unint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  v4 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v4 != 107 && v4 != 202)
  {
    v22 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__lk = 0;
      _os_log_error_impl(&dword_2293C9000, v22, OS_LOG_TYPE_ERROR, "#pcie,#tt,pulseTimemarkStrobe not supported", __lk, 2u);
    }
    return;
  }
  if (!*((_BYTE *)this + 96))
    return;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3812000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = &unk_2294029D7;
  v5 = operator new();
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 850045863;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  *(_QWORD *)(v5 + 80) = 0;
  *(_QWORD *)(v5 + 88) = 1018212795;
  *(_OWORD *)(v5 + 124) = 0u;
  *(_OWORD *)(v5 + 96) = 0u;
  *(_OWORD *)(v5 + 112) = 0u;
  *(_QWORD *)v5 = &off_24F20BB50;
  *(_QWORD *)(v5 + 8) = 0;
  v63 = v5;
  v6 = v58[6];
  if (!v6)
    std::__throw_future_error[abi:ne180100](3u);
  std::mutex::lock((std::mutex *)(v6 + 24));
  v7 = *(_DWORD *)(v6 + 136);
  if ((v7 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  v8 = (unint64_t *)(v6 + 8);
  do
    v9 = __ldxr(v8);
  while (__stxr(v9 + 1, v8));
  *(_DWORD *)(v6 + 136) = v7 | 2;
  std::mutex::unlock((std::mutex *)(v6 + 24));
  v10 = (gpsd::util *)GpsdPlatformInfo::instance(0);
  MachContinuousTimeNs = (gpsd::util *)gpsd::util::getMachContinuousTimeNs(v10);
  v12 = gpsd::util::getMachContinuousTimeNs(MachContinuousTimeNs);
  if ((TelephonyBasebandPCITransportTimesync() & 1) == 0)
  {
    do
LABEL_39:
      v28 = __ldaxr(v8);
    while (__stlxr(v28 - 1, v8));
    if (!v28)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
    goto LABEL_42;
  }
  v56 = v12;
  v13.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  *(_QWORD *)__lk = v6 + 24;
  __lk[8] = 1;
  std::mutex::lock((std::mutex *)(v6 + 24));
  v14 = *(_DWORD *)(v6 + 136);
  if ((v14 & 8) != 0)
  {
    v23 = 2;
LABEL_34:
    v24 = (std::mutex *)(v6 + 24);
    goto LABEL_35;
  }
  if ((v14 & 4) != 0)
  {
    v23 = ((v14 >> 2) & 1) == 0;
    goto LABEL_34;
  }
  v15 = v13.__d_.__rep_ + 500000000;
  while (1)
  {
    v16.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    if (v16.__d_.__rep_ >= v15)
      break;
    v16.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    if (v16.__d_.__rep_ < v15)
    {
      v17.__d_.__rep_ = v15 - std::chrono::steady_clock::now().__d_.__rep_;
      if (v17.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v18.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v18.__d_.__rep_)
        {
          v19 = 0;
          goto LABEL_23;
        }
        if (v18.__d_.__rep_ < 1)
        {
          if ((unint64_t)v18.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
            goto LABEL_22;
          v19 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v18.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            v19 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_23;
          }
LABEL_22:
          v19 = 1000 * v18.__d_.__rep_;
LABEL_23:
          if (v19 > (v17.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v20.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_26;
          }
        }
        v20.__d_.__rep_ = v19 + v17.__d_.__rep_;
LABEL_26:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(v6 + 88), (std::unique_lock<std::mutex> *)__lk, v20);
        std::chrono::steady_clock::now();
      }
      v16.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    }
    v21 = *(_DWORD *)(v6 + 136);
    if ((v21 & 4) != 0)
      goto LABEL_58;
  }
  v21 = *(_DWORD *)(v6 + 136);
LABEL_58:
  v23 = ((v21 >> 2) & 1) == 0;
  if (__lk[8])
  {
    v24 = *(std::mutex **)__lk;
LABEL_35:
    std::mutex::unlock(v24);
  }
  v25 = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v16.__d_.__rep_);
  GpsdPlatformInfo::instance(0);
  v26 = (double)(v25 - (unint64_t)MachContinuousTimeNs) * 0.000001;
  if (v23)
  {
    v27 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__lk = 134349056;
      *(double *)&__lk[4] = (double)(v25 - (unint64_t)MachContinuousTimeNs) * 0.000001;
      _os_log_error_impl(&dword_2293C9000, v27, OS_LOG_TYPE_ERROR, "#pcie,#tt,timeout,%{public}f", __lk, 0xCu);
    }
    goto LABEL_39;
  }
  *(_QWORD *)__lk = v6 + 24;
  __lk[8] = 1;
  std::mutex::lock((std::mutex *)(v6 + 24));
  std::__assoc_sub_state::__sub_wait((std::__assoc_sub_state *)v6, (std::unique_lock<std::mutex> *)__lk);
  v29 = *(_QWORD *)(v6 + 16);
  v64.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v64);
  if (v29)
  {
    std::exception_ptr::exception_ptr(&v64, (const std::exception_ptr *)(v6 + 16));
    v53.__ptr_ = &v64;
    std::rethrow_exception(v53);
    __break(1u);
  }
  else
  {
    v54 = *(unsigned __int8 *)(v6 + 144);
    v55 = *(unsigned __int8 *)(v6 + 145);
    v31 = *(unsigned int *)(v6 + 148);
    v32 = *(_QWORD *)(v6 + 152);
    v33 = *(_QWORD *)(v6 + 160);
    v34 = *(_DWORD *)(v6 + 168);
    if (__lk[8])
      std::mutex::unlock(*(std::mutex **)__lk);
    do
      v35 = __ldaxr(v8);
    while (__stlxr(v35 - 1, v8));
    if (!v35)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
    if (v34 != 1)
    {
      if (!v34)
      {
        *(_BYTE *)(a2 + 16) = 1;
        v36 = gpsd::util::convertMachTimeInTicksToNs(v33);
        *(_QWORD *)a2 = v36;
        v37 = gpsd::util::convertMachTimeInTicksToNs(v31) + v36;
        *(_QWORD *)(a2 + 8) = v37;
        v38 = v32 + v31;
        goto LABEL_53;
      }
      goto LABEL_42;
    }
    *(_BYTE *)(a2 + 16) = 1;
    v64.__ptr_ = 0;
    if (!gpsd::util::getCurrentMachContinuousMinusMachAbsoluteTicks((gpsd::util *)&v64, v30))
    {
      v44 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__lk = 0;
        _os_log_error_impl(&dword_2293C9000, v44, OS_LOG_TYPE_ERROR, "#pcie,#tt-ptm,offset failed", __lk, 2u);
      }
      goto LABEL_42;
    }
    if ((unint64_t)v64.__ptr_ > v32)
    {
      v43 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__lk = 0;
        _os_log_error_impl(&dword_2293C9000, v43, OS_LOG_TYPE_ERROR, "#pcie,#tt-ptm,machAbsOffset error", __lk, 2u);
      }
LABEL_72:
      *(_BYTE *)(a2 + 16) = 0;
      goto LABEL_42;
    }
    if (gpsd::util::convertMachTimeInTicksToNs(v32) < v56)
    {
      v45 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
      {
        v46 = gpsd::util::convertMachTimeInTicksToNs(v32);
        *(_DWORD *)__lk = 134349312;
        *(_QWORD *)&__lk[4] = v46;
        *(_WORD *)&__lk[12] = 2050;
        *(_QWORD *)&__lk[14] = v56;
        _os_log_fault_impl(&dword_2293C9000, v45, OS_LOG_TYPE_FAULT, "#pcie,#tt,Sanity check failed: PCIeDoorbellMachContNs,%{public}llu,PCIeDoorbellTriggerNs,%{public}llu", __lk, 0x16u);
      }
      goto LABEL_72;
    }
    if (gpsd::util::convertMachTimeInTicksToNs(v32) > v56 + 1000000000)
    {
      v47 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        v48 = gpsd::util::convertMachTimeInTicksToNs(v32);
        *(_DWORD *)__lk = 134349312;
        *(_QWORD *)&__lk[4] = v48;
        *(_WORD *)&__lk[12] = 2050;
        *(_QWORD *)&__lk[14] = v56;
        _os_log_impl(&dword_2293C9000, v47, OS_LOG_TYPE_DEFAULT, "#pcie,#tt,Delayed timemark pulse: PCIeDoorbellMachContNs,%{public}llu,PCIeDoorbellTriggerNs,%{public}llu", __lk, 0x16u);
      }
      goto LABEL_72;
    }
    v36 = gpsd::util::convertMachTimeInTicksToNs(v32) - 100;
    *(_QWORD *)a2 = v36;
    v37 = gpsd::util::convertMachTimeInTicksToNs(v32) + 100;
    *(_QWORD *)(a2 + 8) = v37;
    v49 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__lk = 67240704;
      *(_DWORD *)&__lk[4] = v31;
      *(_WORD *)&__lk[8] = 1026;
      *(_DWORD *)&__lk[10] = v54;
      *(_WORD *)&__lk[14] = 1026;
      *(_DWORD *)&__lk[16] = v55;
      _os_log_impl(&dword_2293C9000, v49, OS_LOG_TYPE_INFO, "#pcie,#tt-ptm,seqNum,%{public}u,domain,%{public}u,unit,%{public}u", __lk, 0x14u);
    }
    v50 = gpsd::util::convertNsToMachTimeInTicks(0x64uLL);
    ptr = v64.__ptr_;
    v52 = gpsd::util::convertNsToMachTimeInTicks(0x64uLL) + v32;
    v32 = v32 - v50 - (_QWORD)ptr;
    v38 = v52 - (unint64_t)v64.__ptr_;
LABEL_53:
    v39 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v40 = gpsd::util::convertMachTimeInTicksToNs(v32);
      v41 = gpsd::util::convertMachTimeInTicksToNs(v38);
      *(_DWORD *)__lk = 134350592;
      *(double *)&__lk[4] = v26;
      *(_WORD *)&__lk[12] = 2050;
      *(_QWORD *)&__lk[14] = v36;
      v66 = 2050;
      v67 = v37;
      v68 = 2050;
      v69 = v37 - v36;
      v70 = 2050;
      v71 = v25;
      v72 = 2050;
      v73 = v40;
      v74 = 2050;
      v75 = v41;
      _os_log_impl(&dword_2293C9000, v39, OS_LOG_TYPE_DEFAULT, "#pcie,#tt,toggled,waitMs,%{public}f,beforeContNs,%{public}llu,afterContNs,%{public}llu,widthNs,%{public}llu,nowContNs,%{public}llu,beforeMachNs,%{public}llu,afterMachNs,%{public}llu", __lk, 0x48u);
    }
    v42 = *((_QWORD *)this + 16);
    if (v42)
    {
      *(_QWORD *)__lk = v32;
      *(_QWORD *)&__lk[8] = v38;
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v42 + 48))(v42, __lk);
    }
LABEL_42:
    _Block_object_dispose(&v57, 8);
    std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~promise(&v63);
  }
}

void sub_2293DD1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::exception_ptr a24,std::mutex *a25,char a26)
{
  uint64_t *v26;

  _Block_object_dispose(&a17, 8);
  std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~promise(v26);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose_(uint64_t a1)
{
  return std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~promise((uint64_t *)(a1 + 48));
}

void ___ZN7GnssHal8CommPcie19pulseTimeMarkStrobeEv_block_invoke(uint64_t a1, int a2, uint64_t a3, __int128 *a4)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 || !a4)
  {
    v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v10) = 67240192;
      DWORD1(v10) = a2;
      _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "#pcie,#tt,completion failure,0x%{public}08x", (uint8_t *)&v10, 8u);
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    LOBYTE(v10) = 0;
    v12 = 2;
    std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::set_value(*(_QWORD *)(v9 + 48), &v10);
  }
  else
  {
    GpsdPlatformInfo::instance(0);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *a4;
    v11 = *((_QWORD *)a4 + 2);
    v12 = 0;
    std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::set_value(*(_QWORD *)(v7 + 48), &v10);
  }
}

void std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::set_value(uint64_t a1, _OWORD *a2)
{
  std::mutex *v4;
  uint64_t v5;
  __int128 v6;
  std::exception_ptr v7;

  if (!a1)
    std::__throw_future_error[abi:ne180100](3u);
  v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 136) & 1) != 0
    || (v7.__ptr_ = 0, v5 = *(_QWORD *)(a1 + 16), std::exception_ptr::~exception_ptr(&v7), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  v6 = a2[1];
  *(_OWORD *)(a1 + 144) = *a2;
  *(_OWORD *)(a1 + 160) = v6;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_2293DD498(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::CommPcie::isOpen(GnssHal::CommPcie *this)
{
  return *((unsigned __int8 *)this + 96);
}

uint64_t GnssHal::CommPcie::getFileDescriptor(GnssHal::CommPcie *this)
{
  return 0xFFFFFFFFLL;
}

uint64_t GnssHal::CommPcie::isReadCallbackSupported(GnssHal::CommPcie *this)
{
  return 1;
}

double GnssHal::CommPcie::getTimeoutValueSeconds(GnssHal::CommPcie *this)
{
  return 0.0;
}

void GnssHal::CommPcie::getPortString(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void std::__assoc_state<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x22E2C8E68);
}

uint64_t std::__assoc_state<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t *std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  const std::error_category *v7;
  std::logic_error *exception;
  std::logic_error *v9;
  std::logic_error v10;
  std::logic_error v11;
  std::exception_ptr v12;

  v2 = *a1;
  if (v2)
  {
    if ((*(_BYTE *)(v2 + 136) & 1) == 0)
    {
      v12.__ptr_ = 0;
      v3 = *(_QWORD *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v12);
      v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        v7 = std::future_category();
        MEMORY[0x22E2C8C1C](&v10, 4, v7);
        exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
        v9 = std::logic_error::logic_error(exception, &v10);
        v9->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB810] + 16);
        v9[1] = v11;
        __cxa_throw(v9, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
      }
    }
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
  return a1;
}

void sub_2293DD668(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__assoc_sub_state *a10, char a11)
{
  uint64_t v11;
  std::exception_ptr v12;

  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
  v12.__ptr_ = (void *)(v11 - 32);
  std::__assoc_sub_state::set_exception(a10, v12);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v11 - 32));
  MEMORY[0x22E2C8C28](&a11);
  JUMPOUT(0x2293DD5D8);
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  void *exception;
  const std::error_category *v3;

  exception = __cxa_allocate_exception(0x20uLL);
  v3 = std::future_category();
  MEMORY[0x22E2C8C1C](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_2293DD6EC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t _GLOBAL__sub_I_GnssHalCommPcie_mm()
{
  qword_255A4BDC8 = 0;
  __cxa_atexit((void (*)(void *))std::function<void ()(unsigned char *,unsigned long)>::~function, _MergedGlobals_0, &dword_2293C9000);
  qword_255A4BDE8 = 0;
  return __cxa_atexit((void (*)(void *))std::function<void ()(std::string)>::~function, &qword_255A4BDD0, &dword_2293C9000);
}

uint64_t GnssHal::PlatformLog::PlatformLog(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(_QWORD *)result = &off_24F20BB98;
  *(_QWORD *)(result + 16) = a5;
  *(_QWORD *)(result + 24) = a2;
  *(_BYTE *)(result + 32) = 0;
  return result;
}

{
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(_QWORD *)result = &off_24F20BB98;
  *(_QWORD *)(result + 16) = a5;
  *(_QWORD *)(result + 24) = a2;
  *(_BYTE *)(result + 32) = 0;
  return result;
}

uint64_t GnssHal::PlatformLog::getPrimaryPathLogLevel(GnssHal::PlatformLog *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t GnssHal::PlatformLog::getSecondaryPathLogLevel(GnssHal::PlatformLog *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t GnssHal::PlatformLog::getLogMask(GnssHal::PlatformLog *this)
{
  return *((_QWORD *)this + 2);
}

void GnssHal::PlatformLog::logSystemException(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  int v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  NSObject *v80;
  uint64_t v81;
  id *v82;
  std::string *v83;
  uint64_t v84;
  uint64_t v85;
  std::string::size_type *v86;
  std::string::size_type v87;
  std::string::size_type v88;
  std::ios_base *v89;
  _QWORD *v90;
  _QWORD *v91;
  NSObject *v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  std::string __p;
  uint8_t v100[4];
  uint64_t *v101;
  __int16 v102;
  unint64_t v103;
  __int16 v104;
  uint64_t v105;
  std::string buf;
  uint64_t v107;
  _BYTE v108[384];
  _QWORD v109[22];

  v109[20] = *MEMORY[0x24BDAC8D0];
  v6 = *((char *)a2 + 23);
  if (v6 >= 0)
    v7 = a2;
  else
    v7 = (_QWORD *)*a2;
  if (v6 >= 0)
    v8 = *((unsigned __int8 *)a2 + 23);
  else
    v8 = a2[1];
  if (v8 > 0x20)
  {
    if (v8 <= 0x40)
    {
      v12 = (char *)v7 + v8;
      v13 = *(_QWORD *)((char *)v7 + v8 - 16);
      v14 = *(_QWORD *)((char *)v7 + v8 - 8);
      v15 = *v7 - 0x3C5A37A36834CED9 * (v13 + v8);
      v17 = v7[2];
      v16 = v7[3];
      v18 = __ROR8__(v15 + v16, 52);
      v19 = __ROR8__(v15, 37);
      v20 = v15 + v7[1];
      v21 = __ROR8__(v20, 7);
      v22 = v20 + v17;
      v23 = v21 + v19;
      v24 = *((_QWORD *)v12 - 4) + v17;
      v25 = v14 + v16;
      v26 = __ROR8__(v25 + v24, 52);
      v27 = v23 + v18;
      v28 = __ROR8__(v24, 37);
      v29 = *((_QWORD *)v12 - 3) + v24;
      v30 = __ROR8__(v29, 7);
      v31 = v27 + __ROR8__(v22, 31);
      v32 = v29 + v13;
      v33 = v32 + v25;
      v34 = v22 + v16 + v28 + v30 + v26 + __ROR8__(v32, 31);
      v35 = 0x9AE16A3B2F90404FLL;
      v36 = v31
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v33 + v31) - 0x651E95C4D06FBFB1 * v34) ^ ((0xC3A5C85C97CB3127 * (v33 + v31)
                                                                                 - 0x651E95C4D06FBFB1 * v34) >> 47));
LABEL_15:
      v11 = (v36 ^ (v36 >> 47)) * v35;
      goto LABEL_19;
    }
    v44 = *(_QWORD *)((char *)v7 + v8 - 48);
    v43 = *(_QWORD *)((char *)v7 + v8 - 40);
    v45 = *(_QWORD *)((char *)v7 + v8 - 24);
    v46 = *(_QWORD *)((char *)v7 + v8 - 56);
    v47 = *(_QWORD *)((char *)v7 + v8 - 16);
    v48 = *(_QWORD *)((char *)v7 + v8 - 8);
    v49 = v46 + v47;
    v50 = 0x9DDFEA08EB382D69
        * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v8))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v8))));
    v51 = 0x9DDFEA08EB382D69 * (v50 ^ (v50 >> 47));
    v52 = *(_QWORD *)((char *)v7 + v8 - 64) + v8;
    v53 = v44 + v46 + v52;
    v54 = v53 + v43;
    v55 = __ROR8__(v53, 44) + v52 + __ROR8__(v52 + v43 + v51, 21);
    v56 = v46 + v47 + *(_QWORD *)((char *)v7 + v8 - 32) - 0x4B6D499041670D8DLL;
    v57 = v45 + v47 + v56;
    v58 = v57 + v48;
    v59 = __ROR8__(v57, 44) + v56 + __ROR8__(v56 + v43 + v48, 21);
    v60 = v7 + 4;
    v61 = *v7 - 0x4B6D499041670D8DLL * v43;
    v62 = -(uint64_t)((v8 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v63 = *(v60 - 3);
      v64 = v61 + v54 + v49 + v63;
      v65 = v60[2];
      v66 = v60[3];
      v67 = v60[1];
      v49 = v67 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v49 + v55 + v65, 42);
      v68 = v51 + v58;
      v69 = *(v60 - 2);
      v70 = *(v60 - 1);
      v71 = *(v60 - 4) - 0x4B6D499041670D8DLL * v55;
      v72 = v71 + v58 + v70;
      v73 = v71 + v63 + v69;
      v54 = v73 + v70;
      v74 = __ROR8__(v73, 44) + v71;
      v75 = (0xB492B66FBE98F273 * __ROR8__(v64, 37)) ^ v59;
      v61 = 0xB492B66FBE98F273 * __ROR8__(v68, 33);
      v55 = v74 + __ROR8__(v72 + v75, 21);
      v76 = v61 + v59 + *v60;
      v58 = v67 + v65 + v76 + v66;
      v59 = __ROR8__(v67 + v65 + v76, 44) + v76 + __ROR8__(v49 + v69 + v76 + v66, 21);
      v60 += 8;
      v51 = v75;
      v62 += 64;
    }
    while (v62);
    v77 = 0x9DDFEA08EB382D69
        * (v58 ^ ((0x9DDFEA08EB382D69 * (v58 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v58 ^ v54)));
    v78 = v75 - 0x4B6D499041670D8DLL * (v49 ^ (v49 >> 47)) - 0x622015F714C7D297 * (v77 ^ (v77 >> 47));
    v79 = v61
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v55)))) >> 47));
    v11 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v79 ^ ((0x9DDFEA08EB382D69 * (v79 ^ v78)) >> 47) ^ (0x9DDFEA08EB382D69 * (v79 ^ v78)))) ^ ((0x9DDFEA08EB382D69 * (v79 ^ ((0x9DDFEA08EB382D69 * (v79 ^ v78)) >> 47) ^ (0x9DDFEA08EB382D69 * (v79 ^ v78)))) >> 47));
  }
  else
  {
    if (v8 > 0x10)
    {
      v37 = v7[1];
      v38 = 0xB492B66FBE98F273 * *v7;
      v39 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)v7 + v8 - 8), 30) + __ROR8__(v38 - v37, 43);
      v40 = v38
          + v8
          + __ROR8__(v37 ^ 0xC949D7C7509E6557, 20)
          - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)v7 + v8 - 8);
      v41 = (v39 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)v7 + v8 - 16)) ^ v40;
      v35 = 0x9DDFEA08EB382D69;
      v42 = v40 ^ ((0x9DDFEA08EB382D69 * v41) >> 47) ^ (0x9DDFEA08EB382D69 * v41);
LABEL_14:
      v36 = 0x9DDFEA08EB382D69 * v42;
      goto LABEL_15;
    }
    if (v8 >= 9)
    {
      v9 = *(_QWORD *)((char *)v7 + v8 - 8);
      v10 = __ROR8__(v9 + v8, v8);
      v11 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69
             * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ *v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ *v7)))) ^ ((0x9DDFEA08EB382D69 * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ *v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ *v7)))) >> 47))) ^ v9;
      goto LABEL_19;
    }
    if (v8 >= 4)
    {
      v93 = *(unsigned int *)((char *)v7 + v8 - 4);
      v94 = (v8 + (8 * *(_DWORD *)v7)) ^ v93;
      v35 = 0x9DDFEA08EB382D69;
      v42 = v93 ^ ((0x9DDFEA08EB382D69 * v94) >> 47) ^ (0x9DDFEA08EB382D69 * v94);
      goto LABEL_14;
    }
    v11 = 0x9AE16A3B2F90404FLL;
    if (v8)
    {
      v95 = v8 + 4 * *((unsigned __int8 *)v7 + v8 - 1);
      v96 = 0x9AE16A3B2F90404FLL
          * (*(unsigned __int8 *)v7 | ((unint64_t)*((unsigned __int8 *)v7 + (v8 >> 1)) << 8));
      v11 = 0x9AE16A3B2F90404FLL * ((0xC949D7C7509E6557 * v95) ^ v96 ^ (((0xC949D7C7509E6557 * v95) ^ v96) >> 47));
    }
  }
LABEL_19:
  if (*(_BYTE *)(a1 + 32))
  {
    v80 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v81 = a3[1] - *a3;
      LODWORD(buf.__r_.__value_.__l.__data_) = 136381187;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v7;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2050;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v11;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2050;
      v107 = v81;
      _os_log_error_impl(&dword_2293C9000, v80, OS_LOG_TYPE_ERROR, "logSystemException,%{private}s,%{public}zu,size,%{public}zu", (uint8_t *)&buf, 0x20u);
    }
  }
  else
  {
    v82 = (id *)GpsdPreferences::instance(0);
    GpsdPreferences::vendorLogDirectory(v82, &buf);
    v83 = std::string::append(&buf, "/gnss_hw_exception.bin");
    __p = *v83;
    v83->__r_.__value_.__l.__size_ = 0;
    v83->__r_.__value_.__r.__words[2] = 0;
    v83->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v84 = MEMORY[0x24BEDB840];
    v85 = MEMORY[0x24BEDB840] + 64;
    v86 = (std::string::size_type *)MEMORY[0x24BEDB7E8];
    v87 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
    v88 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
    v109[0] = MEMORY[0x24BEDB840] + 64;
    buf.__r_.__value_.__r.__words[0] = v87;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + *(_QWORD *)(v87 - 24)) = v88;
    v89 = (std::ios_base *)((char *)&buf + *(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24));
    std::ios_base::init(v89, &buf.__r_.__value_.__r.__words[1]);
    v89[1].__vftable = 0;
    v89[1].__fmtflags_ = -1;
    buf.__r_.__value_.__r.__words[0] = v84 + 24;
    v109[0] = v85;
    MEMORY[0x22E2C8C4C](&buf.__r_.__value_.__r.__words[1]);
    if (!std::filebuf::open())
      std::ios_base::clear((std::ios_base *)((char *)&buf + *(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)&v108[*(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24)] | 4);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&buf, (uint64_t)"logSystemException(", 19);
    v90 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v90, (uint64_t)",", 1);
    v91 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v91, (uint64_t)")\n", 2);
    std::ostream::write();
    if (!std::filebuf::close())
      std::ios_base::clear((std::ios_base *)((char *)&buf + *(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)&v108[*(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24)] | 4);
    v92 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
    {
      if (*((char *)a2 + 23) >= 0)
        v97 = a2;
      else
        v97 = (uint64_t *)*a2;
      v98 = a3[1] - *a3;
      *(_DWORD *)v100 = 136381187;
      v101 = v97;
      v102 = 2050;
      v103 = v11;
      v104 = 2050;
      v105 = v98;
      _os_log_fault_impl(&dword_2293C9000, v92, OS_LOG_TYPE_FAULT, "logSystemException,%{private}s,%{public}zu,size,%{public}zu", v100, 0x20u);
    }
    *(_BYTE *)(a1 + 32) = 1;
    buf.__r_.__value_.__r.__words[0] = *v86;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words
                              + *(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24)) = v86[3];
    MEMORY[0x22E2C8C58](&buf.__r_.__value_.__r.__words[1]);
    std::ostream::~ostream();
    MEMORY[0x22E2C8DFC](v109);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2293DDF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  std::ostream::~ostream();
  MEMORY[0x22E2C8DFC](v25);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::~ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x22E2C8C58](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x22E2C8DFC](a1 + 52);
  return a1;
}

void GnssHal::PlatformLog::flush(VendorLogger **this)
{
  VendorLogger::flush(this[3]);
}

void GnssHal::PlatformLog::~PlatformLog(GnssHal::PlatformLog *this)
{
  JUMPOUT(0x22E2C8E68);
}

void GnssHal::PlatformLog::log(uint64_t a1, unsigned int a2, std::string::value_type *a3)
{
  VendorLogger::log(*(_QWORD *)(a1 + 24), a2, a3);
}

void GnssHal::PlatformLog::log(uint64_t a1, int a2, uint64_t a3)
{
  VendorLogger::log(*(gpsd::util **)(a1 + 24), a2, *(const void **)a3, *(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
}

void GnssHal::PlatformLog::log(uint64_t a1, int a2, const void *a3, size_t a4)
{
  VendorLogger::log(*(gpsd::util **)(a1 + 24), a2, a3, a4);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x22E2C8CB8](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x22E2C8CC4](v13);
  return a1;
}

void sub_2293DE148(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x22E2C8CC4](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2293DE128);
}

void sub_2293DE190(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_2293DE2C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

_QWORD *GnssHal::GpioEmbedded::GpioEmbedded(_QWORD *a1, uint64_t a2)
{
  NSObject *v3;
  GnssHal::GpioEmbedded::GpioBackend *v4;
  _QWORD *v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  *a1 = &off_24F20BC20;
  a1[4] = 0;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)(a1 + 5), a2);
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_INFO, "#gpio,frontend,ctor,start", buf, 2u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  v5 = (_QWORD *)GnssHal::GpioEmbedded::GpioBackend::instance(v4);
  GnssHal::GpioEmbedded::GpioBackend::setFrontend(v5, (uint64_t)a1);
  v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_INFO, "#gpio,frontend,ctor,end", v8, 2u);
  }
  std::mutex::unlock(&GnssHal::sMutex);
  return a1;
}

void sub_2293DE484(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  std::mutex::unlock(&GnssHal::sMutex);
  v4 = (_QWORD *)v1[8];
  if (v4 == v2)
  {
    v5 = 4;
    v4 = v2;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  v6 = (_QWORD *)v1[4];
  if (v6 == v1 + 1)
  {
    v7 = 4;
    v6 = v1 + 1;
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_11:
  _Unwind_Resume(a1);
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::instance(GnssHal::GpioEmbedded::GpioBackend *this)
{
  uint64_t result;
  NSObject *v2;
  std::string v3;
  std::string v4;
  std::string v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (GnssHal::GpioEmbedded::GpioBackend::instance(void)::pred != -1)
    dispatch_once(&GnssHal::GpioEmbedded::GpioBackend::instance(void)::pred, &__block_literal_global_0);
  result = GnssHal::GpioEmbedded::GpioBackend::fInstance;
  if (!GnssHal::GpioEmbedded::GpioBackend::fInstance)
  {
    v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v2, OS_LOG_TYPE_ERROR, "null GpioBackend", buf, 2u);
      v2 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v7 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalGpioImpl.mm";
      v8 = 1026;
      v9 = 299;
      v10 = 2082;
      v11 = "instance";
      _os_log_error_impl(&dword_2293C9000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v4, "instance");
    std::string::basic_string[abi:ne180100]<0>(&v3, "null GpioBackend");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v5, (uint64_t)&v4, (uint64_t)&v3);
    std::string::~string(&v3);
    std::string::~string(&v4);
    std::string::~string(&v5);
    __assert_rtn("instance", "GnssHalGpioImpl.mm", 299, "false && \"null GpioBackend\"");
  }
  return result;
}

void sub_2293DE6BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

void GnssHal::GpioEmbedded::GpioBackend::setFrontend(_QWORD *a1, uint64_t a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *a1 = a2;
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67240192;
    v4[1] = a2 == 0;
    _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_INFO, "#gpio,set frontend,isNull,%{public}d", (uint8_t *)v4, 8u);
  }
}

void GnssHal::GpioEmbedded::~GpioEmbedded(GnssHal::GpioEmbedded *this)
{
  NSObject *v2;
  GnssHal::GpioEmbedded::GpioBackend *v3;
  _QWORD *v4;
  NSObject *v5;
  GnssHal::GpioEmbedded *v6;
  uint64_t v7;
  GnssHal::GpioEmbedded *v8;
  uint64_t v9;
  uint8_t v10[16];
  uint8_t buf[16];

  *(_QWORD *)this = &off_24F20BC20;
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "#gpio,frontend,dtor,start", buf, 2u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  v4 = (_QWORD *)GnssHal::GpioEmbedded::GpioBackend::instance(v3);
  GnssHal::GpioEmbedded::GpioBackend::setFrontend(v4, 0);
  v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_INFO, "#gpio,frontend,dtor,end", v10, 2u);
  }
  std::mutex::unlock(&GnssHal::sMutex);
  v6 = (GnssHal::GpioEmbedded *)*((_QWORD *)this + 8);
  if (v6 == (GnssHal::GpioEmbedded *)((char *)this + 40))
  {
    v7 = 4;
    v6 = (GnssHal::GpioEmbedded *)((char *)this + 40);
  }
  else
  {
    if (!v6)
      goto LABEL_10;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
LABEL_10:
  v8 = (GnssHal::GpioEmbedded *)*((_QWORD *)this + 4);
  if (v8 == (GnssHal::GpioEmbedded *)((char *)this + 8))
  {
    v9 = 4;
    v8 = (GnssHal::GpioEmbedded *)((char *)this + 8);
  }
  else
  {
    if (!v8)
      return;
    v9 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
}

{
  GnssHal::GpioEmbedded::~GpioEmbedded(this);
  JUMPOUT(0x22E2C8E68);
}

void GnssHal::GpioEmbedded::setResetLow(GnssHal::GpioEmbedded *this)
{
  int v1;
  NSObject *v2;
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 103 || v1 == 201 || v1 == 106)
  {
    v2 = GpsdLogObjectGeneral;
    v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setResetLow", buf, 2u);
    }
    v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 1u, 0);
  }
  else
  {
    v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::GpioBackend::setGpioState(uint64_t a1, uint32_t a2, uint64_t a3)
{
  int v3;
  NSObject *v6;
  uint64_t input;
  uint8_t buf[4];
  uint32_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  input = a3;
  std::mutex::lock(&GnssHal::sMutex);
  if (*(_BYTE *)(a1 + 8))
  {
    IOConnectCallScalarMethod(*(_DWORD *)(a1 + 12), a2, &input, 1u, 0, 0);
  }
  else
  {
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      v9 = a2;
      v10 = 1026;
      v11 = v3;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#gpio,setGpioState failed,selector,%{public}d,input,%{public}d", buf, 0xEu);
    }
  }
  std::mutex::unlock(&GnssHal::sMutex);
}

void sub_2293DEB10(_Unwind_Exception *a1)
{
  std::mutex::unlock(&GnssHal::sMutex);
  _Unwind_Resume(a1);
}

void GnssHal::GpioEmbedded::setResetHigh(GnssHal::GpioEmbedded *this)
{
  int v1;
  NSObject *v2;
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 103 || v1 == 201 || v1 == 106)
  {
    v2 = GpsdLogObjectGeneral;
    v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setResetHigh", buf, 2u);
    }
    v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 1u, 1uLL);
  }
  else
  {
    v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::setDeviceWakeLow(GnssHal::GpioEmbedded *this)
{
  int v1;
  NSObject *v2;
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 106 || v1 == 103)
  {
    v2 = GpsdLogObjectGeneral;
    v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setDeviceWakeLow", buf, 2u);
    }
    v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 3u, 1uLL);
  }
  else
  {
    v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::setDeviceWakeHigh(GnssHal::GpioEmbedded *this)
{
  int v1;
  NSObject *v2;
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 106 || v1 == 103)
  {
    v2 = GpsdLogObjectGeneral;
    v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setDeviceWakeHigh", buf, 2u);
    }
    v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 3u, 0);
  }
  else
  {
    v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::pulseTimeMarkStrobe(GnssHal::GpioEmbedded *this@<X0>, uint64_t a2@<X8>)
{
  GnssHal::GpioEmbedded::GpioBackend *v4;
  int v5;
  GnssHal::GpioEmbedded::GpioBackend *v6;
  unint64_t *v7;
  kern_return_t v8;
  _BOOL8 CurrentMachContinuousMinusMachAbsoluteNanoseconds;
  unint64_t MachContinuousTimeNs;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _BYTE *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint32_t outputCnt;
  uint64_t output[3];
  mach_port_t connection;
  _QWORD v31[3];
  _QWORD *v32;
  _BYTE buf[22];
  __int16 v34;
  _BYTE *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  v4 = (GnssHal::GpioEmbedded::GpioBackend *)GpsdPlatformInfo::instance(0);
  v5 = *((_DWORD *)v4 + 2);
  if (v5 != 103 && v5 != 106 && v5 != 201)
  {
    v20 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v21 = "#gpio,pulseTimeMarkStrobe not supported";
    goto LABEL_17;
  }
  connection = 0;
  v6 = (GnssHal::GpioEmbedded::GpioBackend *)GnssHal::GpioEmbedded::GpioBackend::instance(v4);
  if (!GnssHal::GpioEmbedded::GpioBackend::controlConnect(v6, &connection))
  {
    v20 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v21 = "#gpio,#tt,GPSControlConnect failed";
LABEL_17:
    _os_log_error_impl(&dword_2293C9000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    return;
  }
  outputCnt = 2;
  v8 = IOConnectCallScalarMethod(connection, 5u, 0, 0, output, &outputCnt);
  if (v8 || outputCnt != 2)
  {
    v22 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v8;
      _os_log_error_impl(&dword_2293C9000, v22, OS_LOG_TYPE_ERROR, "#gpio,#tt,TogglePIN,failed,Result,%{public}08x", buf, 8u);
    }
    goto LABEL_38;
  }
  v27 = 0;
  CurrentMachContinuousMinusMachAbsoluteNanoseconds = gpsd::util::getCurrentMachContinuousMinusMachAbsoluteNanoseconds((gpsd::util *)&v27, v7);
  if (!CurrentMachContinuousMinusMachAbsoluteNanoseconds)
  {
    v23 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v23, OS_LOG_TYPE_ERROR, "#gpio,#tt,machCont timestamping failed", buf, 2u);
    }
    goto LABEL_38;
  }
  MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)CurrentMachContinuousMinusMachAbsoluteNanoseconds);
  *(_BYTE *)(a2 + 16) = 1;
  v11 = gpsd::util::convertMachTimeInTicksToNs(output[0]);
  v12 = v27;
  v13 = v27 + v11;
  *(_QWORD *)a2 = v27 + v11;
  v14 = gpsd::util::convertMachTimeInTicksToNs(output[1]) + v12;
  *(_QWORD *)(a2 + 8) = v14;
  v15 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v16 = gpsd::util::convertMachTimeInTicksToNs(output[0]);
    v17 = gpsd::util::convertMachTimeInTicksToNs(output[1]);
    *(_DWORD *)buf = 134350336;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v14;
    v34 = 2050;
    v35 = (_BYTE *)(v14 - v13);
    v36 = 2050;
    v37 = MachContinuousTimeNs;
    v38 = 2050;
    v39 = v16;
    v40 = 2050;
    v41 = v17;
    _os_log_impl(&dword_2293C9000, v15, OS_LOG_TYPE_INFO, "#gpio,#tt,TogglePIN,beforeContNs,%{public}llu,afterContNs,%{public}llu,widthNs,%{public}llu,nowContNs,%{public}llu,beforeMachNs,%{public}llu,afterMachNs,%{public}llu", buf, 0x3Eu);
  }
  v32 = 0;
  std::mutex::lock(&GnssHal::sMutex);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)buf, (uint64_t)this + 40);
  v18 = v35;
  v19 = v32;
  if (v35 == buf)
  {
    if (v32 == v31)
    {
      (*(void (**)(_BYTE *, _QWORD *))(*(_QWORD *)buf + 24))(buf, v42);
      (*(void (**)(_BYTE *))(*(_QWORD *)v35 + 32))(v35);
      v35 = 0;
      (*(void (**)(_QWORD *, _BYTE *))(*v32 + 24))(v32, buf);
      (*(void (**)(_QWORD *))(*v32 + 32))(v32);
      v32 = 0;
      v35 = buf;
      (*(void (**)(_QWORD *, _QWORD *))(v42[0] + 24))(v42, v31);
      (*(void (**)(_QWORD *))(v42[0] + 32))(v42);
      v32 = v31;
      v19 = v35;
    }
    else
    {
      (*(void (**)(_BYTE *, _QWORD *))(*(_QWORD *)buf + 24))(buf, v31);
      (*(void (**)(_BYTE *))(*(_QWORD *)v35 + 32))(v35);
      v19 = v32;
      v35 = v32;
      v32 = v31;
    }
  }
  else
  {
    if (v32 == v31)
    {
      v19 = buf;
      (*(void (**)(_QWORD *, _BYTE *))(v31[0] + 24))(v31, buf);
      (*(void (**)(_QWORD *))(*v32 + 32))(v32);
      v32 = v35;
      v35 = buf;
      v24 = 4;
      goto LABEL_31;
    }
    v35 = v32;
    v32 = v18;
  }
  if (v19 == buf)
  {
    v24 = 4;
    v19 = buf;
  }
  else
  {
    if (!v19)
      goto LABEL_32;
    v24 = 5;
  }
LABEL_31:
  (*(void (**)(_BYTE *))(*(_QWORD *)v19 + 8 * v24))(v19);
LABEL_32:
  std::mutex::unlock(&GnssHal::sMutex);
  if (v32)
  {
    *(_OWORD *)buf = *(_OWORD *)output;
    (*(void (**)(_QWORD *, _BYTE *))(*v32 + 48))(v32, buf);
    v25 = v32;
    if (v32 == v31)
    {
      v26 = 4;
      v25 = v31;
      goto LABEL_37;
    }
    if (v32)
    {
      v26 = 5;
LABEL_37:
      (*(void (**)(void))(*v25 + 8 * v26))();
    }
  }
LABEL_38:
  IOServiceClose(connection);
}

void sub_2293DF274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char *a18)
{
  char *v19;
  uint64_t v20;

  v19 = a18;
  if (a18 == &a15)
  {
    v20 = 4;
    v19 = &a15;
  }
  else
  {
    if (!a18)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

BOOL GnssHal::GpioEmbedded::GpioBackend::controlConnect(GnssHal::GpioEmbedded::GpioBackend *this, unsigned int *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  _BOOL8 result;
  const __CFDictionary *v8;
  kern_return_t MatchingServices;
  kern_return_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint32_t v14;
  io_service_t v15;
  kern_return_t v16;
  kern_return_t v17;
  uint64_t v18;
  io_iterator_t existing;
  mach_port_t mainPort;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  mainPort = 0;
  v4 = MEMORY[0x22E2C87E4](0, &mainPort);
  if (v4)
  {
    v5 = v4;
    v6 = GpsdLogObjectGeneral;
    result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 67240192;
    LODWORD(v22) = v5;
    v11 = "#gpio,IOMasterPort failed,%{public}d";
    goto LABEL_15;
  }
  v8 = IOServiceMatching("AppleEmbeddedGPSControl");
  if (v8)
  {
    existing = 0;
    MatchingServices = IOServiceGetMatchingServices(mainPort, v8, &existing);
    if (MatchingServices)
    {
      v10 = MatchingServices;
      v6 = GpsdLogObjectGeneral;
      result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v22) = v10;
        v11 = "#gpio,IOServiceGetMatchingServices failed,%{public}d";
LABEL_15:
        v13 = v6;
        v14 = 8;
        goto LABEL_16;
      }
    }
    else
    {
      *((_DWORD *)this + 4) = IOIteratorNext(existing);
      IOObjectRelease(existing);
      v15 = *((_DWORD *)this + 4);
      if (v15)
      {
        v16 = IOServiceOpen(v15, *MEMORY[0x24BDAEC58], 0, a2);
        if (!v16)
          return 1;
        v17 = v16;
        v6 = GpsdLogObjectGeneral;
        result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_DWORD *)buf = 67240192;
          LODWORD(v22) = v17;
          v11 = "#gpio,IOServiceOpen failed,%{public}d";
          goto LABEL_15;
        }
      }
      else
      {
        v18 = GpsdLogObjectGeneral;
        result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_WORD *)buf = 0;
          v11 = "#gpio,No fServiceObject";
          v13 = v18;
          v14 = 2;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    v12 = GpsdLogObjectGeneral;
    result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136315138;
      v22 = "AppleEmbeddedGPSControl";
      v11 = "#gpio,IOServiceMatching failed,%s";
      v13 = v12;
      v14 = 12;
LABEL_16:
      _os_log_error_impl(&dword_2293C9000, v13, OS_LOG_TYPE_ERROR, v11, buf, v14);
      return 0;
    }
  }
  return result;
}

void GnssHal::GpioEmbedded::GpioBackend::callback(GnssHal::GpioEmbedded::GpioBackend *this, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)this)
  {
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "#gpio,callback,locked", (uint8_t *)&v7, 2u);
    }
    if (a2)
    {
      if (a2 == 1)
      {
        GnssHal::GpioEmbedded::notifyDevice(*(_QWORD *)this, 0);
        ++*((_DWORD *)this + 6);
      }
      else
      {
        v6 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          v7 = 134349056;
          v8 = a2;
          _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "#gpio,Unrecognized messageArg,%{public}llu", (uint8_t *)&v7, 0xCu);
        }
      }
    }
    else
    {
      GnssHal::GpioEmbedded::notifyDevice(*(_QWORD *)this, 1);
      ++*((_DWORD *)this + 5);
    }
  }
  else
  {
    v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134349056;
      v8 = a2;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,pGpioObject null,%{public}llu", (uint8_t *)&v7, 0xCu);
    }
  }
}

void GnssHal::GpioEmbedded::notifyDevice(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = GpsdLogObjectGeneral;
  v6 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v8 = 67240192;
      v9 = a2;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_INFO, "#gpio,notifyDevice,int,sending,%{public}d,", (uint8_t *)&v8, 8u);
      v4 = *(_QWORD *)(a1 + 32);
      v8 = a2;
      if (!v4)
        std::__throw_bad_function_call[abi:ne180100]();
    }
    else
    {
      v8 = a2;
    }
    (*(void (**)(uint64_t, int *))(*(_QWORD *)v4 + 48))(v4, &v8);
  }
  else if (v6)
  {
    v8 = 67240192;
    v9 = a2;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_INFO, "#gpio,notifyDevice,int,no callback,%{public}d,", (uint8_t *)&v8, 8u);
  }
  v7 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_INFO, "#gpio,notifyDevice,done", (uint8_t *)&v8, 2u);
  }
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::incrementApGpioTransitionCount(uint64_t this, int a2, int a3)
{
  if (!a2)
  {
    if (!a3)
      return this;
LABEL_5:
    ++*(_DWORD *)(this + 24);
    return this;
  }
  ++*(_DWORD *)(this + 20);
  if (a3)
    goto LABEL_5;
  return this;
}

BOOL GnssHal::GpioEmbedded::GpioBackend::registerForNotifications(GnssHal::GpioEmbedded::GpioBackend *this)
{
  IONotificationPortRef v2;
  IONotificationPort *v3;
  NSObject *global_queue;
  kern_return_t v5;
  _BOOL8 v6;
  kern_return_t v7;
  NSObject *v8;
  NSObject *v9;
  io_object_t notification;
  uint8_t buf[4];
  kern_return_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  if (v2)
  {
    v3 = v2;
    global_queue = dispatch_get_global_queue(2, 0);
    IONotificationPortSetDispatchQueue(v3, global_queue);
    notification = 0;
    v5 = IOServiceAddInterestNotification(v3, *((_DWORD *)this + 4), "IOGeneralInterest", (IOServiceInterestCallback)GnssHal::GPSControlInterestCallback, 0, &notification);
    v6 = v5 == 0;
    if (v5)
    {
      v7 = v5;
      v8 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        v13 = v7;
        _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "#gpio,failed to register interest in notification,%{public}d", buf, 8u);
      }
    }
  }
  else
  {
    v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "#gpio,failed to create notification port", buf, 2u);
    }
    return 0;
  }
  return v6;
}

void GnssHal::GPSControlInterestCallback(GnssHal *this, void *a2, int a3, uint64_t a4, void *a5)
{
  NSObject *v7;
  GnssHal::GpioEmbedded::GpioBackend *v8;
  GnssHal::GpioEmbedded::GpioBackend *v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67240448;
    v11[1] = a3;
    v12 = 2050;
    v13 = a4;
    _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_INFO, "#gpio,callback,begin,%{public}u,%{public}llu", (uint8_t *)v11, 0x12u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  v9 = (GnssHal::GpioEmbedded::GpioBackend *)GnssHal::GpioEmbedded::GpioBackend::instance(v8);
  GnssHal::GpioEmbedded::GpioBackend::callback(v9, a4);
  v10 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_INFO, "#gpio,callback,end", (uint8_t *)v11, 2u);
  }
  std::mutex::unlock(&GnssHal::sMutex);
}

void sub_2293DFAC4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void GnssHal::GpioEmbedded::setGpioNotifier(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v5 = a2[3] == 0;
    LODWORD(v12[0]) = 67240192;
    HIDWORD(v12[0]) = v5;
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "#gpio,setGpioNotifier,int,isNull,%{public}d", (uint8_t *)v12, 8u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  v6 = a2[3];
  if (!v6)
    goto LABEL_6;
  if ((_QWORD *)v6 != a2)
  {
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
LABEL_6:
    v13 = (_QWORD *)v6;
    goto LABEL_8;
  }
  v13 = v12;
  (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, v12);
LABEL_8:
  v7 = a1 + 8;
  if (v12 != (_QWORD *)(a1 + 8))
  {
    v8 = v13;
    v9 = *(_QWORD *)(a1 + 32);
    if (v13 == v12)
    {
      if (v9 == v7)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v12[0] + 24))(v12, v14);
        (*(void (**)(_QWORD *))(*v13 + 32))(v13);
        v13 = 0;
        (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(a1 + 32) + 24))(*(_QWORD *)(a1 + 32), v12);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 32))(*(_QWORD *)(a1 + 32));
        *(_QWORD *)(a1 + 32) = 0;
        v13 = v12;
        (*(void (**)(_QWORD *, uint64_t))(v14[0] + 24))(v14, a1 + 8);
        (*(void (**)(_QWORD *))(v14[0] + 32))(v14);
      }
      else
      {
        (*(void (**)(_QWORD *, uint64_t))(v12[0] + 24))(v12, a1 + 8);
        (*(void (**)(_QWORD *))(*v13 + 32))(v13);
        v13 = *(_QWORD **)(a1 + 32);
      }
      *(_QWORD *)(a1 + 32) = v7;
    }
    else if (v9 == v7)
    {
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v7 + 24))(a1 + 8, v12);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 32))(*(_QWORD *)(a1 + 32));
      *(_QWORD *)(a1 + 32) = v13;
      v13 = v12;
    }
    else
    {
      v13 = *(_QWORD **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v8;
    }
  }
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
    goto LABEL_21;
  }
  if (v13)
  {
    v11 = 5;
LABEL_21:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  std::mutex::unlock(&GnssHal::sMutex);
}

void sub_2293DFD44(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::getApGpioZeroTransitionCount(GnssHal::GpioEmbedded::GpioBackend *this)
{
  uint64_t v2;

  std::mutex::lock(&GnssHal::sMutex);
  v2 = *((unsigned int *)this + 5);
  std::mutex::unlock(&GnssHal::sMutex);
  return v2;
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::getApGpioOneTransitionCount(GnssHal::GpioEmbedded::GpioBackend *this)
{
  uint64_t v2;

  std::mutex::lock(&GnssHal::sMutex);
  v2 = *((unsigned int *)this + 6);
  std::mutex::unlock(&GnssHal::sMutex);
  return v2;
}

void GnssHal::GpioEmbedded::GpioBackend::clearApGpioTransitionCounts(GnssHal::GpioEmbedded::GpioBackend *this)
{
  std::mutex::lock(&GnssHal::sMutex);
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  std::mutex::unlock(&GnssHal::sMutex);
}

void sub_2293DFE60(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2C8E68](v1, 0x1020C405901AD1DLL);
  _Unwind_Resume(a1);
}

GnssHal::GpioEmbedded::GpioBackend *GnssHal::GpioEmbedded::GpioBackend::GpioBackend(GnssHal::GpioEmbedded::GpioBackend *this)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  *(_QWORD *)this = 0;
  *((_BYTE *)this + 8) = 0;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "#gpio,backend,ctor,start", buf, 2u);
  }
  v3 = GnssHal::GpioEmbedded::GpioBackend::controlConnect(this, (unsigned int *)this + 3);
  *((_BYTE *)this + 8) = v3;
  if (v3)
  {
    GnssHal::GpioEmbedded::GpioBackend::registerForNotifications(this);
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "#gpio,controlConnect,success", v10, 2u);
    }
  }
  else
  {
    v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "#gpio,controlConnect,failure", v9, 2u);
    }
  }
  v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_INFO, "#gpio,backend,ctor,end", v8, 2u);
  }
  return this;
}

uint64_t _GLOBAL__sub_I_GnssHalGpioImpl_mm()
{
  return __cxa_atexit((void (*)(void *))MEMORY[0x24BEDB380], &GnssHal::sMutex, &dword_2293C9000);
}

BOOL deleteFile(const char *a1)
{
  int v2;
  NSObject *v3;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = unlink(a1);
  if (v2)
  {
    v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v5 = *__error();
      v6 = 136446466;
      v7 = a1;
      v8 = 1026;
      v9 = v5;
      _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "VendorLogger,deleteFile could not unlink,%{public}s,%{public}d", (uint8_t *)&v6, 0x12u);
    }
  }
  return v2 == 0;
}

BOOL getFileModificationTimeAndSize(const char *a1, timespec *a2, uint64_t *a3)
{
  int v6;
  NSObject *v7;
  int v8;
  stat v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = stat(a1, &v10);
  if (v6)
  {
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v8 = *__error();
      *(_DWORD *)buf = 136446466;
      v12 = a1;
      v13 = 1026;
      v14 = v8;
      _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "VendorLogger,getFileModificationTime could not stat,%{public}s,%{public}d", buf, 0x12u);
    }
  }
  else
  {
    *a2 = v10.st_mtimespec;
    *a3 = v10.st_size;
  }
  return v6 == 0;
}

uint64_t copyFile(const char *a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v9 = 0;
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "copyItemAtPath:toPath:error:", v3, v4, &v9);
  if ((v5 & 1) == 0)
  {
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend((id)objc_msgSend(v9, "localizedDescription"), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v11 = v8;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "VendorLogger,copyFile,error:%{public}s", buf, 0xCu);
    }
  }
  return v5;
}

void VendorLogger::copyLatestLogsToPath(uint64_t a1, uint64_t a2, int a3, int a4)
{
  id *v8;
  std::string::size_type size;
  const char *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  const char *v14;
  int v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  _QWORD block[5];
  std::string __p;
  uint64_t v30;
  int v31;
  int v32;
  std::string v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogDirectory(v8, &v33);
  size = HIBYTE(v33.__r_.__value_.__r.__words[2]);
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v33.__r_.__value_.__l.__size_;
  if (!size)
  {
    v11 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_WORD *)buf = 0;
    v12 = "VendorLogger,copyLatestLogsToPath, null source dirpath, cannot copy latest logs";
LABEL_21:
    v18 = v11;
    v19 = 2;
LABEL_22:
    _os_log_error_impl(&dword_2293C9000, v18, OS_LOG_TYPE_ERROR, v12, buf, v19);
    goto LABEL_42;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(_QWORD *)(a2 + 8))
    {
LABEL_19:
      v11 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v12 = "VendorLogger,copyLatestLogsToPath, null destination dirpath, cannot copy latest logs";
      goto LABEL_21;
    }
    v10 = *(const char **)a2;
  }
  else
  {
    v10 = (const char *)a2;
    if (!*(_BYTE *)(a2 + 23))
      goto LABEL_19;
  }
  if (!mkdir(v10, 0x1F8u))
  {
    v20 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
LABEL_36:
      v27 = *(NSObject **)(a1 + 880);
      if (v27)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3321888768;
        block[2] = ___ZN12VendorLogger20copyLatestLogsToPathERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEij_block_invoke;
        block[3] = &__block_descriptor_80_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_e5_v8__0l;
        block[4] = a1;
        if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&__p, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
        else
          __p = v33;
        v30 = a2;
        v31 = a4;
        v32 = a3;
        dispatch_sync(v27, block);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_42;
    }
    if (*(char *)(a2 + 23) >= 0)
      v21 = (const char *)a2;
    else
      v21 = *(const char **)a2;
    *(_DWORD *)buf = 136446466;
    v35 = v21;
    v36 = 1024;
    v37 = 504;
    v22 = "VendorLogger,copyLatestLogsToPath,created directory,%{public}s,permissions,%x";
    v23 = v20;
    v24 = 18;
LABEL_35:
    _os_log_impl(&dword_2293C9000, v23, OS_LOG_TYPE_INFO, v22, buf, v24);
    goto LABEL_36;
  }
  v13 = *__error();
  if (v13 == 17)
  {
    if (*(char *)(a2 + 23) >= 0)
      v14 = (const char *)a2;
    else
      v14 = *(const char **)a2;
    v15 = chmod(v14, 0x1F8u);
    v16 = GpsdLogObjectGeneral;
    if (v15)
    {
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      v17 = *__error();
      *(_DWORD *)buf = 67240192;
      LODWORD(v35) = v17;
      v12 = "VendorLogger,copyLatestLogsToPath,chmod failed,%{public}d";
      v18 = v16;
      v19 = 8;
      goto LABEL_22;
    }
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      goto LABEL_36;
    *(_DWORD *)buf = 67109120;
    LODWORD(v35) = 504;
    v22 = "VendorLogger,copyLatestLogsToPath,directory exists,permissions,%x";
    v23 = v16;
    v24 = 8;
    goto LABEL_35;
  }
  v25 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    if (*(char *)(a2 + 23) >= 0)
      v26 = (const char *)a2;
    else
      v26 = *(const char **)a2;
    *(_DWORD *)buf = 136446466;
    v35 = v26;
    v36 = 1026;
    v37 = v13;
    v12 = "VendorLogger,copyLatestLogsToPath,could not create directory,%{public}s, error,%{public}d";
    v18 = v25;
    v19 = 18;
    goto LABEL_22;
  }
LABEL_42:
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
}

void sub_2293E0648(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ___ZN12VendorLogger20copyLatestLogsToPathERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEij_block_invoke(uint64_t a1)
{
  VendorLogger *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const void **v6;
  const void **v7;
  os_log_t *v8;
  size_t v9;
  std::string *v10;
  const void *v11;
  int v12;
  const std::string::value_type *v13;
  std::string::size_type v14;
  std::string *v15;
  __int128 v16;
  uint8_t *v17;
  os_log_t *v18;
  const void **v19;
  size_t v20;
  std::string *v21;
  const void *v22;
  int v23;
  const std::string::value_type *v24;
  std::string::size_type v25;
  std::string *v26;
  __int128 v27;
  const char *v28;
  std::string *v29;
  char v30;
  NSObject *v31;
  int v32;
  BOOL v33;
  _BOOL4 v34;
  BOOL v35;
  int v36;
  NSObject *v37;
  uint8_t *v38;
  std::string *v39;
  uint8_t *v40;
  std::string *v41;
  NSObject *v42;
  int v43;
  int v44;
  uint64_t v45;
  timespec v46;
  const void **v47;
  const void **v48;
  uint64_t v49;
  std::string v50;
  std::string v51;
  uint8_t buf[16];
  int64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v2 = *(VendorLogger **)(a1 + 32);
  VendorLogger::closeLogFile(v2);
  v47 = 0;
  v48 = 0;
  v49 = 0;
  if (*(char *)(a1 + 63) < 0)
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = a1 + 40;
  VendorLogger::enumerateFiles(v3, (const void **)v2, (uint64_t *)&v47);
  v4 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v48 - v47));
  if (v48 == v47)
    v5 = 0;
  else
    v5 = v4;
  std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>((uint64_t)v47, v48, v5, 1);
  v45 = 0;
  v6 = v47;
  v7 = v48;
  v8 = (os_log_t *)&GpsdLogObjectGeneral;
  if (v47 != v48)
  {
    v44 = 0;
    while (1)
    {
      if (*(char *)(a1 + 63) >= 0)
        v9 = *(unsigned __int8 *)(a1 + 63);
      else
        v9 = *(_QWORD *)(a1 + 48);
      std::string::basic_string[abi:ne180100]((uint64_t)&v51, v9 + 1);
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = &v51;
      else
        v10 = (std::string *)v51.__r_.__value_.__r.__words[0];
      if (v9)
      {
        if (*(char *)(a1 + 63) >= 0)
          v11 = (const void *)(a1 + 40);
        else
          v11 = *(const void **)(a1 + 40);
        memmove(v10, v11, v9);
      }
      *(_WORD *)((char *)&v10->__r_.__value_.__l.__data_ + v9) = 47;
      v12 = *((char *)v6 + 23);
      if (v12 >= 0)
        v13 = (const std::string::value_type *)v6;
      else
        v13 = (const std::string::value_type *)*v6;
      if (v12 >= 0)
        v14 = *((unsigned __int8 *)v6 + 23);
      else
        v14 = (std::string::size_type)v6[1];
      v15 = std::string::append(&v51, v13, v14);
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v53 = v15->__r_.__value_.__r.__words[2];
      *(_OWORD *)buf = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v51.__r_.__value_.__l.__data_);
      if (v53 >= 0)
        v17 = buf;
      else
        v17 = *(uint8_t **)buf;
      if (!getFileModificationTimeAndSize((const char *)v17, &v46, &v45))
        goto LABEL_74;
      if (v45 <= *(unsigned int *)(a1 + 72))
      {
        v37 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          if (v53 >= 0)
            v38 = buf;
          else
            v38 = *(uint8_t **)buf;
          LODWORD(v51.__r_.__value_.__l.__data_) = 136446210;
          *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          _os_log_impl(&dword_2293C9000, v37, OS_LOG_TYPE_INFO, "VendorLogger,copyLatestLogsToPath, skipped file,%{public}s", (uint8_t *)&v51, 0xCu);
        }
        v36 = 3;
        goto LABEL_75;
      }
      v18 = v8;
      v19 = *(const void ***)(a1 + 64);
      if (*((char *)v19 + 23) >= 0)
        v20 = *((unsigned __int8 *)v19 + 23);
      else
        v20 = (size_t)v19[1];
      std::string::basic_string[abi:ne180100]((uint64_t)&v50, v20 + 1);
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v21 = &v50;
      else
        v21 = (std::string *)v50.__r_.__value_.__r.__words[0];
      if (v20)
      {
        if (*((char *)v19 + 23) >= 0)
          v22 = v19;
        else
          v22 = *v19;
        memmove(v21, v22, v20);
      }
      *(_WORD *)((char *)&v21->__r_.__value_.__l.__data_ + v20) = 47;
      v23 = *((char *)v6 + 23);
      if (v23 >= 0)
        v24 = (const std::string::value_type *)v6;
      else
        v24 = (const std::string::value_type *)*v6;
      if (v23 >= 0)
        v25 = *((unsigned __int8 *)v6 + 23);
      else
        v25 = (std::string::size_type)v6[1];
      v26 = std::string::append(&v50, v24, v25);
      v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
      v51.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v27;
      v26->__r_.__value_.__l.__size_ = 0;
      v26->__r_.__value_.__r.__words[2] = 0;
      v26->__r_.__value_.__r.__words[0] = 0;
      v8 = v18;
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v50.__r_.__value_.__l.__data_);
      v28 = v53 >= 0 ? (const char *)buf : *(const char **)buf;
      v29 = (v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v51
          : (std::string *)v51.__r_.__value_.__r.__words[0];
      v30 = copyFile(v28, (const char *)v29);
      v31 = *v18;
      if ((v30 & 1) != 0)
      {
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
        {
          if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v39 = &v51;
          else
            v39 = (std::string *)v51.__r_.__value_.__r.__words[0];
          LODWORD(v50.__r_.__value_.__l.__data_) = 136446210;
          *(std::string::size_type *)((char *)v50.__r_.__value_.__r.__words + 4) = (std::string::size_type)v39;
          _os_log_debug_impl(&dword_2293C9000, v31, OS_LOG_TYPE_DEBUG, "VendorLogger,copyLatestLogsToPath, copied %{public}s", (uint8_t *)&v50, 0xCu);
        }
        v32 = *(_DWORD *)(a1 + 76);
        v33 = ++v44 < v32;
        v34 = v44 >= v32;
        v35 = v33;
        v36 = 2 * v34;
      }
      else
      {
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
        {
          if (v53 >= 0)
            v40 = buf;
          else
            v40 = *(uint8_t **)buf;
          if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v41 = &v51;
          else
            v41 = (std::string *)v51.__r_.__value_.__r.__words[0];
          LODWORD(v50.__r_.__value_.__l.__data_) = 136446466;
          *(std::string::size_type *)((char *)v50.__r_.__value_.__r.__words + 4) = (std::string::size_type)v40;
          WORD2(v50.__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&v50.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v41;
          _os_log_error_impl(&dword_2293C9000, v31, OS_LOG_TYPE_ERROR, "VendorLogger,copyLatestLogsToPath, failed src,%{public}s, dest,%{public}s", (uint8_t *)&v50, 0x16u);
        }
        v35 = 0;
        v36 = 2;
      }
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        break;
      if (v35)
        goto LABEL_74;
LABEL_75:
      if (SHIBYTE(v53) < 0)
        operator delete(*(void **)buf);
      if (v36 == 3 || !v36)
      {
        v6 += 3;
        if (v6 != v7)
          continue;
      }
      goto LABEL_95;
    }
    operator delete(v51.__r_.__value_.__l.__data_);
    if (!v35)
      goto LABEL_75;
LABEL_74:
    v36 = 0;
    goto LABEL_75;
  }
  v44 = 0;
LABEL_95:
  v42 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v43 = *(_DWORD *)(a1 + 76);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v44;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v43;
    _os_log_impl(&dword_2293C9000, v42, OS_LOG_TYPE_DEFAULT, "VendorLogger,copyLatestLogsToPath, Copied,%d, RequestedMax,%d", buf, 0xEu);
  }
  *(_QWORD *)buf = &v47;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

void sub_2293E0B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  *(_QWORD *)(v33 - 128) = &a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 128));
  _Unwind_Resume(a1);
}

void VendorLogger::closeLogFile(VendorLogger *this)
{
  std::ios_base *v2;
  const std::__fs::filesystem::path *v3;
  NSObject *v4;
  int64_t size;
  std::string *p_buf;
  void **v7;
  int64_t v8;
  NSObject *v9;
  std::string::size_type v10;
  void **v11;
  std::string::size_type v12;
  NSObject *v13;
  std::error_code *v14;
  std::string *v15;
  std::string *v16;
  const std::__fs::filesystem::path *v17;
  int v18;
  NSObject *v19;
  char *v20;
  int v21;
  std::string *v22;
  int64_t v23;
  char *v24;
  char *v25;
  int v26;
  void *__p[2];
  unsigned __int8 v28;
  void *v29[2];
  unsigned __int8 v30;
  std::string buf;
  uint8_t v32[4];
  std::string *v33;
  __int16 v34;
  std::string *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  VendorLogger::flushCompression(this);
  if (*((_QWORD *)this + 52))
  {
    std::ostream::flush();
    if (!std::filebuf::close())
    {
      v2 = (std::ios_base *)((char *)this + *(_QWORD *)(*((_QWORD *)this + 36) - 24) + 288);
      std::ios_base::clear(v2, v2->__rdstate_ | 4);
    }
    v3 = (const std::__fs::filesystem::path *)((char *)this + 856);
    if (*((char *)this + 879) < 0)
    {
      std::string::__init_copy_ctor_external(&buf, *((const std::string::value_type **)this + 107), *((_QWORD *)this + 108));
    }
    else
    {
      *(_OWORD *)&buf.__r_.__value_.__l.__data_ = *(_OWORD *)&v3->__pn_.__r_.__value_.__l.__data_;
      buf.__r_.__value_.__r.__words[2] = *((_QWORD *)this + 109);
    }
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((uint64_t)v29, (const void **)this + 3, (const void **)this + 9);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((uint64_t)__p, (const void **)this + 6, (const void **)this + 9);
    size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    if ((v30 & 0x80u) == 0)
      v7 = v29;
    else
      v7 = (void **)v29[0];
    if ((v30 & 0x80u) == 0)
      v8 = v30;
    else
      v8 = (int64_t)v29[1];
    if (v8)
    {
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = buf.__r_.__value_.__l.__size_;
      if (size >= v8)
      {
        v20 = (char *)p_buf + size;
        v21 = *(char *)v7;
        v22 = p_buf;
        do
        {
          v23 = size - v8;
          if (v23 == -1)
            break;
          v24 = (char *)memchr(v22, v21, v23 + 1);
          if (!v24)
            break;
          v25 = v24;
          if (!memcmp(v24, v7, v8))
          {
            if (v25 != v20)
            {
              v10 = v25 - (char *)p_buf;
              if (v25 - (char *)p_buf != -1)
                goto LABEL_25;
            }
            break;
          }
          v22 = (std::string *)(v25 + 1);
          size = v20 - (v25 + 1);
        }
        while (size >= v8);
      }
      v9 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 136315138;
        v33 = p_buf;
        _os_log_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEFAULT, "VendorLogger,closeLogFile,Could not archive,%s", v32, 0xCu);
      }
    }
    else
    {
      v10 = 0;
LABEL_25:
      if ((v28 & 0x80u) == 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      if ((v28 & 0x80u) == 0)
        v12 = v28;
      else
        v12 = (std::string::size_type)__p[1];
      std::string::replace(&buf, v10, v8, (const std::string::value_type *)v11, v12);
      v13 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        v15 = (std::string *)((char *)this + 856);
        if (*((char *)this + 879) < 0)
          v15 = (std::string *)v3->__pn_.__r_.__value_.__r.__words[0];
        v16 = &buf;
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v16 = (std::string *)buf.__r_.__value_.__r.__words[0];
        *(_DWORD *)v32 = 136315394;
        v33 = v15;
        v34 = 2080;
        v35 = v16;
        _os_log_impl(&dword_2293C9000, v13, OS_LOG_TYPE_INFO, "VendorLogger,closeLogFile,Archiving,Old name,%s,New name,%s", v32, 0x16u);
      }
      if (*((char *)this + 879) < 0)
        v3 = (const std::__fs::filesystem::path *)v3->__pn_.__r_.__value_.__r.__words[0];
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v17 = (const std::__fs::filesystem::path *)&buf;
      else
        v17 = (const std::__fs::filesystem::path *)buf.__r_.__value_.__r.__words[0];
      rename(v3, v17, v14);
      if (v18)
      {
        v19 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          v26 = *__error();
          *(_DWORD *)v32 = 67240192;
          LODWORD(v33) = v26;
          _os_log_error_impl(&dword_2293C9000, v19, OS_LOG_TYPE_ERROR, "VendorLogger,closeLogFile,rename failed,%{public}d", v32, 8u);
        }
      }
    }
    if (*((char *)this + 879) < 0)
    {
      **((_BYTE **)this + 107) = 0;
      *((_QWORD *)this + 108) = 0;
    }
    else
    {
      *((_BYTE *)this + 856) = 0;
      *((_BYTE *)this + 879) = 0;
    }
    if ((char)v28 < 0)
      operator delete(__p[0]);
    if ((char)v30 < 0)
      operator delete(v29[0]);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "VendorLogger,closeLogFile,No output to close", (uint8_t *)&buf, 2u);
    }
  }
  *((_BYTE *)this + 892) = 0;
}

void sub_2293E0F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(exception_object);
}

uint64_t VendorLogger::enumerateFiles(uint64_t a1, const void **a2, uint64_t *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  unint64_t v15;
  unsigned __int8 v16;
  size_t v17;
  const void *v18;
  NSObject *v19;
  const void *v20;
  unint64_t v22;
  std::string *v23;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  std::string *v31;
  std::string *v32;
  std::string *value;
  std::__split_buffer<std::string>::pointer end;
  __int128 v35;
  int64x2_t v36;
  int v37;
  std::allocator<std::string> *v38;
  uint64_t v39;
  void *__p[2];
  std::string::size_type v41;
  void *v42;
  size_t v43;
  unsigned __int8 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  std::__split_buffer<std::string> buf;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1), 0);
  std::vector<std::string>::__clear[abi:ne180100](a3);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = (void *)objc_msgSend(v7, "reverseObjectEnumerator");
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  v10 = result;
  if (result)
  {
    v11 = *(_QWORD *)v46;
    v38 = (std::allocator<std::string> *)(a3 + 2);
    do
    {
      v12 = 0;
      v39 = v10;
      do
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = (char *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v12), "UTF8String", v38);
        if (v13)
        {
          std::string::basic_string[abi:ne180100]<0>(&v42, v13);
          v14 = *((char *)a2 + 23);
          if (v14 >= 0)
            v15 = *((unsigned __int8 *)a2 + 23);
          else
            v15 = (unint64_t)a2[1];
          v16 = v44;
          if ((char)v44 < 0)
          {
            if (v15 == -1)
LABEL_55:
              std::string::__throw_out_of_range[abi:ne180100]();
            v18 = v42;
            if (v43 >= v15)
              v17 = v15;
            else
              v17 = v43;
          }
          else
          {
            if (v15 == -1)
              goto LABEL_55;
            if (v44 >= v15)
              v17 = v15;
            else
              v17 = v44;
            v18 = &v42;
          }
          if (v14 >= 0)
            v20 = a2;
          else
            v20 = *a2;
          if (!memcmp(v18, v20, v17) && v17 == v15)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, v13);
            v22 = a3[1];
            v23 = (std::string *)a3[2];
            if (v22 >= (unint64_t)v23)
            {
              v25 = *a3;
              v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *a3) >> 3);
              v27 = v26 + 1;
              if (v26 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
              v28 = v11;
              v29 = v8;
              if (0x5555555555555556 * (((uint64_t)v23 - v25) >> 3) > v27)
                v27 = 0x5555555555555556 * (((uint64_t)v23 - v25) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v23 - v25) >> 3) >= 0x555555555555555)
                v30 = 0xAAAAAAAAAAAAAAALL;
              else
                v30 = v27;
              buf.__end_cap_.__value_ = v38;
              if (v30)
              {
                if (v30 > 0xAAAAAAAAAAAAAAALL)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v31 = (std::string *)operator new(24 * v30);
              }
              else
              {
                v31 = 0;
              }
              v32 = v31 + v26;
              buf.__first_ = v31;
              buf.__begin_ = v32;
              value = &v31[v30];
              *(_OWORD *)&v32->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
              v32->__r_.__value_.__r.__words[2] = v41;
              __p[0] = 0;
              __p[1] = 0;
              v41 = 0;
              end = v32 + 1;
              buf.__end_ = v32 + 1;
              buf.__end_cap_.__value_ = value;
              if (v22 == v25)
              {
                v36 = vdupq_n_s64(v22);
                v8 = v29;
              }
              else
              {
                v8 = v29;
                do
                {
                  v35 = *(_OWORD *)(v22 - 24);
                  v32[-1].__r_.__value_.__r.__words[2] = *(_QWORD *)(v22 - 8);
                  *(_OWORD *)&v32[-1].__r_.__value_.__l.__data_ = v35;
                  --v32;
                  *(_QWORD *)(v22 - 16) = 0;
                  *(_QWORD *)(v22 - 8) = 0;
                  *(_QWORD *)(v22 - 24) = 0;
                  v22 -= 24;
                }
                while (v22 != v25);
                v36 = *(int64x2_t *)a3;
                v23 = (std::string *)a3[2];
                end = buf.__end_;
                value = buf.__end_cap_.__value_;
              }
              v11 = v28;
              *a3 = (uint64_t)v32;
              a3[1] = (uint64_t)end;
              *(int64x2_t *)&buf.__begin_ = v36;
              a3[2] = (uint64_t)value;
              buf.__end_cap_.__value_ = v23;
              buf.__first_ = (std::__split_buffer<std::string>::pointer)v36.i64[0];
              std::__split_buffer<std::string>::~__split_buffer(&buf);
              v37 = SHIBYTE(v41);
              a3[1] = (uint64_t)end;
              v10 = v39;
              if (v37 < 0)
                operator delete(__p[0]);
            }
            else
            {
              v24 = *(_OWORD *)__p;
              *(_QWORD *)(v22 + 16) = v41;
              *(_OWORD *)v22 = v24;
              a3[1] = v22 + 24;
            }
            v16 = v44;
          }
          if ((v16 & 0x80) != 0)
            operator delete(v42);
        }
        else
        {
          v19 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.__first_) = 0;
            _os_log_error_impl(&dword_2293C9000, v19, OS_LOG_TYPE_ERROR, "VendorLogger,pruneLogFiles,null filename from reverseEnumerateFiles", (uint8_t *)&buf, 2u);
          }
        }
        ++v12;
      }
      while (v12 != v10);
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      v10 = result;
    }
    while (result);
  }
  return result;
}

void sub_2293E13A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  std::string *v2;
  __int128 v3;

  v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  else
  {
    v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
}

const char *algorithmName(int a1)
{
  if (a1 > 773)
  {
    if (a1 != 774)
    {
      if (a1 == 2049)
        return "lzfse";
      return "unk";
    }
    return "lzma";
  }
  else
  {
    if (a1 != 256)
    {
      if (a1 == 517)
        return "zlib";
      return "unk";
    }
    return "lz4";
  }
}

void VendorLogger::VendorLogger(VendorLogger *this)
{
  void *v2[2];
  char v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *__p;
  char v11;

  VendorLogger::generateDefaultConfig((uint64_t)v2);
  VendorLogger::VendorLogger((std::string *)this, (const VendorLogger::Config *)v2);
  if (v11 < 0)
    operator delete(__p);
  if (v9 < 0)
    operator delete(v8);
  if (v7 < 0)
    operator delete(v6);
  if (v5 < 0)
    operator delete(v4);
  if (v3 < 0)
    operator delete(v2[0]);
}

{
  void *v2[2];
  char v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *__p;
  char v11;

  VendorLogger::generateDefaultConfig((uint64_t)v2);
  VendorLogger::VendorLogger((std::string *)this, (const VendorLogger::Config *)v2);
  if (v11 < 0)
    operator delete(__p);
  if (v9 < 0)
    operator delete(v8);
  if (v7 < 0)
    operator delete(v6);
  if (v5 < 0)
    operator delete(v4);
  if (v3 < 0)
    operator delete(v2[0]);
}

void sub_2293E151C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  VendorLogger::Config::~Config(&a9);
  _Unwind_Resume(a1);
}

void VendorLogger::generateDefaultConfig(uint64_t a1@<X8>)
{
  void **v3;
  id *v4;
  float v5;
  GpsdPreferences *v6;
  id *v7;
  id *v8;
  id *v9;
  id *v10;
  id *v11;
  unsigned int LogLevel;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  id *v17;
  int v18;
  unsigned int v19;
  __int128 v20;
  uint64_t v21;

  std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, "gpsd");
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 24), "o");
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 48), "");
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 72), "log");
  *(_OWORD *)(a1 + 96) = 0u;
  v3 = (void **)(a1 + 96);
  *(_QWORD *)(a1 + 152) = 0;
  *(_BYTE *)(a1 + 196) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_DWORD *)(a1 + 144) = 0;
  *(_DWORD *)(a1 + 200) = 2;
  memset_pattern16((void *)(a1 + 160), &unk_2293F7540, 0x24uLL);
  v4 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogRetentionDays(v4);
  *(double *)(a1 + 120) = (float)((float)(v5 * 24.0) * 3600.0);
  v6 = (GpsdPreferences *)GpsdPreferences::instance(0);
  *(_QWORD *)(a1 + 128) = (uint64_t)(int)GpsdPreferences::vendorLogRotationSizeMB(v6) << 20;
  v7 = (id *)GpsdPreferences::instance(0);
  *(_QWORD *)(a1 + 136) = (uint64_t)(int)GpsdPreferences::vendorLogMaxDirectorySizeMB(v7) << 20;
  v8 = (id *)GpsdPreferences::instance(0);
  *(_DWORD *)(a1 + 144) = GpsdPreferences::vendorLogMaxNumberOfFiles(v8);
  v9 = (id *)GpsdPreferences::instance(0);
  *(_BYTE *)(a1 + 196) = GpsdPreferences::vendorLogPrefixWithTimestamp(v9);
  v10 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogDirectory(v10, &v20);
  if (*(char *)(a1 + 119) < 0)
    operator delete(*v3);
  *(_OWORD *)v3 = v20;
  *(_QWORD *)(a1 + 112) = v21;
  *(_QWORD *)(a1 + 152) &= 0xFFFFFFFFFFFFFE00;
  v11 = (id *)GpsdPreferences::instance(0);
  LogLevel = GpsdPreferences::getLogLevel(v11);
  v13 = 0;
  v14 = *(_QWORD *)(a1 + 152);
  if (LogLevel >= 8)
    v15 = 8;
  else
    v15 = LogLevel;
  v16 = (v15 + 1);
  do
  {
    if (v13)
    {
      v14 |= 1 << v13;
      *(_QWORD *)(a1 + 152) = v14;
    }
    ++v13;
  }
  while (v16 != v13);
  v17 = (id *)GpsdPreferences::instance(0);
  v18 = GpsdPreferences::vendorLogAllToOsLog(v17);
  memset_pattern16((void *)(a1 + 160), &unk_2293F7540, 0x24uLL);
  if (v18)
  {
    *(_OWORD *)(a1 + 164) = xmmword_2293F7530;
    *(_QWORD *)(a1 + 180) = 0x400000003;
    *(_DWORD *)(a1 + 192) = 4;
  }
  else
  {
    *(_QWORD *)(a1 + 164) = 0x100000000;
    v19 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
    if (v19 <= 4 && ((1 << v19) & 0x19) != 0)
    {
      *(_DWORD *)(a1 + 176) = 2;
    }
    else
    {
      GpsdPlatformInfo::instance(0);
      *(_DWORD *)(a1 + 172) = 2;
    }
  }
}

void sub_2293E1770(_Unwind_Exception *a1)
{
  void **v1;

  VendorLogger::Config::~Config(v1);
  _Unwind_Resume(a1);
}

void VendorLogger::VendorLogger(std::string *this, const VendorLogger::Config *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  std::string::size_type v17;
  std::string::size_type v18;
  std::string::size_type v19;
  std::ios_base *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  id *v23;
  int v24;
  id *v25;
  id *v26;
  NSObject *v27;
  int v28;
  const char *v29;
  NSObject *v30;
  void *__p[2];
  char v32;
  void *v33[2];
  char v34;
  void *v35[2];
  char v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v5 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  if (*((char *)a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(this + 2, *((const std::string::value_type **)a2 + 6), *((_QWORD *)a2 + 7));
  }
  else
  {
    v6 = *((_OWORD *)a2 + 3);
    this[2].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 8);
    *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v6;
  }
  if (*((char *)a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(this + 3, *((const std::string::value_type **)a2 + 9), *((_QWORD *)a2 + 10));
  }
  else
  {
    v7 = *(_OWORD *)((char *)a2 + 72);
    this[3].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 11);
    *(_OWORD *)&this[3].__r_.__value_.__l.__data_ = v7;
  }
  v8 = this + 4;
  if (*((char *)a2 + 119) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *((const std::string::value_type **)a2 + 12), *((_QWORD *)a2 + 13));
  }
  else
  {
    v9 = *((_OWORD *)a2 + 6);
    this[4].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 14);
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
  }
  v10 = *(_OWORD *)((char *)a2 + 152);
  v11 = *(_OWORD *)((char *)a2 + 168);
  v12 = *(_OWORD *)((char *)a2 + 184);
  v13 = *((_DWORD *)a2 + 50);
  v14 = *(_OWORD *)((char *)a2 + 120);
  v15 = *(_OWORD *)((char *)a2 + 136);
  this[8].__r_.__value_.__r.__words[2] = 0;
  *(_OWORD *)&this[5].__r_.__value_.__r.__words[2] = v15;
  *(_OWORD *)&this[5].__r_.__value_.__l.__data_ = v14;
  LODWORD(this[8].__r_.__value_.__r.__words[1]) = v13;
  *(_OWORD *)&this[7].__r_.__value_.__r.__words[2] = v12;
  *(_OWORD *)&this[7].__r_.__value_.__l.__data_ = v11;
  *(_OWORD *)&this[6].__r_.__value_.__r.__words[1] = v10;
  this[9].__r_.__value_.__r.__words[0] = 0;
  this[9].__r_.__value_.__l.__size_ = 0;
  LODWORD(this[11].__r_.__value_.__r.__words[1]) = 2049;
  WORD2(this[11].__r_.__value_.__r.__words[1]) = 0;
  v16 = MEMORY[0x24BEDB840];
  v17 = MEMORY[0x24BEDB840] + 64;
  this[29].__r_.__value_.__l.__size_ = MEMORY[0x24BEDB840] + 64;
  v18 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v19 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  this[11].__r_.__value_.__r.__words[2] = 0;
  this[12].__r_.__value_.__r.__words[0] = v18;
  *(std::string::size_type *)((char *)this[12].__r_.__value_.__r.__words + *(_QWORD *)(v18 - 24)) = v19;
  v20 = (std::ios_base *)((char *)&this[12] + *(_QWORD *)(this[12].__r_.__value_.__r.__words[0] - 24));
  std::ios_base::init(v20, &this[12].__r_.__value_.__r.__words[1]);
  v20[1].__vftable = 0;
  v20[1].__fmtflags_ = -1;
  this[12].__r_.__value_.__r.__words[0] = v16 + 24;
  this[29].__r_.__value_.__l.__size_ = v17;
  MEMORY[0x22E2C8C4C](&this[12].__r_.__value_.__r.__words[1]);
  LODWORD(this[37].__r_.__value_.__r.__words[1]) = 0;
  *(_OWORD *)&this[35].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[36].__r_.__value_.__r.__words[1] = 0u;
  *(std::string::size_type *)((char *)&this[36].__r_.__value_.__r.__words[2] + 5) = 0;
  if ((this[6].__r_.__value_.__r.__words[1] & 0x1FF) == 0)
    goto LABEL_39;
  v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v22 = dispatch_queue_create("com.apple.gpsd.vendor_log", v21);
  this[36].__r_.__value_.__r.__words[2] = (std::string::size_type)v22;
  if (!v22)
  {
    v30 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v30, OS_LOG_TYPE_ERROR, "null fInternalWorkerQueue", buf, 2u);
      v30 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v38 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdVendorLogger.mm";
      v39 = 1026;
      v40 = 174;
      v41 = 2082;
      v42 = "VendorLogger";
      _os_log_error_impl(&dword_2293C9000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v35, "assert");
    std::string::basic_string[abi:ne180100]<0>(v33, "VendorLogger");
    std::string::basic_string[abi:ne180100]<0>(__p, "null fInternalWorkerQueue");
    gpsd::util::triggerDiagnosticReport((uint64_t)v35, (uint64_t)v33, (uint64_t)__p);
    if (v32 < 0)
      operator delete(__p[0]);
    if (v34 < 0)
      operator delete(v33[0]);
    if (v36 < 0)
      operator delete(v35[0]);
    __assert_rtn("VendorLogger", "GpsdVendorLogger.mm", 174, "false && \"null fInternalWorkerQueue\"");
  }
  v23 = (id *)GpsdPreferences::instance(0);
  if ((GpsdPreferences::vendorLogLz4(v23) & 1) != 0)
  {
    v24 = 256;
LABEL_24:
    this[11].__r_.__value_.__s.__data_[12] = 1;
    LODWORD(this[11].__r_.__value_.__r.__words[1]) = v24;
    goto LABEL_25;
  }
  v25 = (id *)GpsdPreferences::instance(0);
  if ((GpsdPreferences::vendorLogLzfse(v25) & 1) != 0)
  {
    v24 = 2049;
    goto LABEL_24;
  }
  v26 = (id *)GpsdPreferences::instance(0);
  if ((GpsdPreferences::vendorLogZlib(v26) & 1) != 0)
  {
    v24 = 517;
    goto LABEL_24;
  }
  if (!this[11].__r_.__value_.__s.__data_[12])
    goto LABEL_39;
LABEL_25:
  v27 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v28 = this[11].__r_.__value_.__r.__words[1];
    if (v28 > 773)
    {
      if (v28 == 774)
      {
        v29 = "lzma";
        goto LABEL_38;
      }
      if (v28 == 2049)
      {
        v29 = "lzfse";
        goto LABEL_38;
      }
    }
    else
    {
      if (v28 == 256)
      {
        v29 = "lz4";
        goto LABEL_38;
      }
      if (v28 == 517)
      {
        v29 = "zlib";
LABEL_38:
        *(_DWORD *)buf = 136446210;
        v38 = v29;
        _os_log_impl(&dword_2293C9000, v27, OS_LOG_TYPE_INFO, "VendorLogger,compression enabled,%{public}s", buf, 0xCu);
        goto LABEL_39;
      }
    }
    v29 = "unk";
    goto LABEL_38;
  }
LABEL_39:
  VendorLogger::openNewLogFile((VendorLogger *)this);
}

void sub_2293E1C94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v27;
  void **v28;
  void **v29;
  void **v30;

  if (*(char *)(v27 + 95) < 0)
    operator delete(*v30);
  if (*(char *)(v27 + 71) < 0)
    operator delete(*v29);
  if (*(char *)(v27 + 47) < 0)
    operator delete(*v28);
  if (*(char *)(v27 + 23) < 0)
    operator delete(*(void **)v27);
  _Unwind_Resume(exception_object);
}

void VendorLogger::Config::~Config(void **this)
{
  if (*((char *)this + 119) < 0)
    operator delete(this[12]);
  if (*((char *)this + 95) < 0)
    operator delete(this[9]);
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void sub_2293E1E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  VendorLogger::Config::~Config(&a9);
  _Unwind_Resume(a1);
}

void VendorLogger::openNewLogFile(VendorLogger *this)
{
  void **v2;
  NSObject *v3;
  NSObject *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if ((*((_WORD *)this + 76) & 0x1FF) != 0)
  {
    VendorLogger::ensureDirectoryExists(this);
    VendorLogger::ensureLogFileIsClosed(this);
    VendorLogger::initCompression(this);
    VendorLogger::generateFilename(this, (uint64_t)&v5);
    v2 = (void **)((char *)this + 856);
    if (*((char *)this + 879) < 0)
      operator delete(*v2);
    *(_OWORD *)v2 = v5;
    *((_QWORD *)this + 109) = v6;
    std::ofstream::open();
    v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)this + 879) < 0)
        v2 = (void **)*v2;
      LODWORD(v5) = 136446210;
      *(_QWORD *)((char *)&v5 + 4) = v2;
      _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEFAULT, "VendorLogger,opening,%{public}s", (uint8_t *)&v5, 0xCu);
    }
    if (!*((_QWORD *)this + 52))
    {
      v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v5) = 0;
        _os_log_error_impl(&dword_2293C9000, v4, OS_LOG_TYPE_ERROR, "VendorLogger,failed to open", (uint8_t *)&v5, 2u);
      }
    }
    *((_DWORD *)this + 224) = 0;
    *((_BYTE *)this + 892) = 1;
  }
}

void VendorLogger::~VendorLogger(VendorLogger *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD block[5];

  v2 = *((_QWORD *)this + 110);
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLoggerD2Ev_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v2, block);
  }
  if (*((char *)this + 879) < 0)
    operator delete(*((void **)this + 107));
  v3 = MEMORY[0x24BEDB7E8];
  v4 = *MEMORY[0x24BEDB7E8];
  *((_QWORD *)this + 36) = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)this + *(_QWORD *)(v4 - 24) + 288) = *(_QWORD *)(v3 + 24);
  MEMORY[0x22E2C8C58]((char *)this + 296);
  std::ostream::~ostream();
  MEMORY[0x22E2C8DFC]((char *)this + 704);
  v5 = (void *)*((_QWORD *)this + 26);
  if (v5)
  {
    *((_QWORD *)this + 27) = v5;
    operator delete(v5);
  }
  if (*((char *)this + 119) < 0)
    operator delete(*((void **)this + 12));
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  if (*((char *)this + 71) < 0)
    operator delete(*((void **)this + 6));
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

void ___ZN12VendorLoggerD2Ev_block_invoke(uint64_t a1)
{
  VendorLogger::closeLogFile(*(VendorLogger **)(a1 + 32));
}

void VendorLogger::flushCompression(VendorLogger *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  compression_status v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  compression_status v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 276) && *((_BYTE *)this + 277))
  {
    v2 = GpsdLogObjectGeneral;
    do
    {
      while (1)
      {
        v15 = 0;
        *((_QWORD *)this + 31) = &v15;
        *((_QWORD *)this + 32) = 0;
        v3 = *((_QWORD *)this + 26);
        v4 = *((_QWORD *)this + 27) - v3;
        *((_QWORD *)this + 29) = v3;
        *((_QWORD *)this + 30) = v4;
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218752;
          v17 = &v15;
          v18 = 2048;
          v19 = 0;
          v20 = 2048;
          v21 = v3;
          v22 = 2048;
          v23 = v4;
          _os_log_debug_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,before,%p,%zu,%p,%zu", buf, 0x2Au);
        }
        v5 = compression_stream_process((compression_stream *)((char *)this + 232), 1);
        if (v5 > COMPRESSION_STATUS_END)
        {
          v9 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "VendorLogger,flushCompression,failed to finalize stream", buf, 2u);
          }
        }
        else
        {
          v6 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
          v7 = *((_QWORD *)this + 30);
          v8 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v17 = (char *)(v6 - v7);
            _os_log_debug_impl(&dword_2293C9000, v8, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,flushed bytes,%zu", buf, 0xCu);
          }
          if (v6 != v7)
            std::ostream::write();
        }
        v2 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
          break;
        if (v5)
          goto LABEL_17;
      }
      v10 = (char *)*((_QWORD *)this + 31);
      v11 = *((_QWORD *)this + 32);
      v12 = *((_QWORD *)this + 29);
      v13 = *((_QWORD *)this + 30);
      *(_DWORD *)buf = 134219008;
      v17 = v10;
      v18 = 2048;
      v19 = v11;
      v20 = 2048;
      v21 = v12;
      v22 = 2048;
      v23 = v13;
      v24 = 1024;
      v25 = v5;
      _os_log_debug_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,after,%p,%zu,%p,%zu,status,%d", buf, 0x30u);
      v2 = GpsdLogObjectGeneral;
    }
    while (v5 == COMPRESSION_STATUS_OK);
LABEL_17:
    *((_BYTE *)this + 277) = 0;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,destroying", buf, 2u);
    }
    if (compression_stream_destroy((compression_stream *)((char *)this + 232)))
    {
      v14 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2293C9000, v14, OS_LOG_TYPE_ERROR, "VendorLogger,flushCompression,failed to destroy stream", buf, 2u);
      }
    }
  }
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(uint64_t a1, const void **a2, const void **a3)
{
  size_t v5;
  size_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  char *v10;
  const void *v11;

  if (*((char *)a2 + 23) >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (*((char *)a3 + 23) >= 0)
    v6 = *((unsigned __int8 *)a3 + 23);
  else
    v6 = (size_t)a3[1];
  result = std::string::basic_string[abi:ne180100](a1, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a2 + 23) >= 0)
      v9 = a2;
    else
      v9 = *a2;
    result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a3 + 23) >= 0)
      v11 = a3;
    else
      v11 = *a3;
    result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

void VendorLogger::pruneLogFiles(VendorLogger *this)
{
  NSObject *v1;
  __darwin_time_t tv_sec;
  double v3;
  double v4;
  NSObject *v5;
  id *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  const void **v10;
  const void **v11;
  int v12;
  uint64_t v13;
  size_t v14;
  std::string *v15;
  const void *v16;
  int v17;
  const std::string::value_type *v18;
  std::string::size_type v19;
  std::string *v20;
  __int128 v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  __darwin_time_t v27;
  void **v28;
  uint64_t v29;
  void **v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  void **v34;
  NSObject *v35;
  void **v36;
  uint64_t v37;
  void **v38;
  void **v39;
  uint64_t v40;
  void **v41;
  void **v42;
  void **v43;
  NSObject *v44;
  int v45;
  void *__p[2];
  int64_t v48;
  uint64_t v49;
  timespec v50;
  const void **v51;
  const void **v52;
  uint64_t v53;
  void *v54;
  size_t v55;
  unsigned __int8 v56;
  timespec __tp;
  std::string v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  if (clock_gettime(_CLOCK_REALTIME, &__tp))
  {
    v1 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v45 = *__error();
      LODWORD(v58.__r_.__value_.__l.__data_) = 67240192;
      HIDWORD(v58.__r_.__value_.__r.__words[0]) = v45;
      _os_log_error_impl(&dword_2293C9000, v1, OS_LOG_TYPE_ERROR, "VendorLogger,pruneLogFiles,clock_gettime failed,%{public}d", (uint8_t *)&v58, 8u);
    }
  }
  tv_sec = __tp.tv_sec;
  v3 = (double)__tp.tv_sec;
  v4 = *((double *)this + 15);
  if (v4 >= (double)__tp.tv_sec)
  {
    v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v58.__r_.__value_.__l.__data_) = 134349056;
      *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = tv_sec;
      _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "VendorLogger,pruneLogFiles,timespecNow too small to use,%{public}ld", (uint8_t *)&v58, 0xCu);
      v4 = *((double *)this + 15);
    }
  }
  v6 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogDirectory(v6, &v54);
  if ((char)v56 < 0)
  {
    if (v55)
    {
      v51 = 0;
      v52 = 0;
      v53 = 0;
      v7 = v54;
      goto LABEL_12;
    }
LABEL_90:
    v44 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_2293C9000, v44, OS_LOG_TYPE_DEFAULT, "VendorLogger.pruneLogFiles: null path, cannot delete old logs", (uint8_t *)&v58, 2u);
    }
    goto LABEL_92;
  }
  if (!v56)
    goto LABEL_90;
  v51 = 0;
  v52 = 0;
  v7 = &v54;
  v53 = 0;
LABEL_12:
  VendorLogger::enumerateFiles((uint64_t)v7, (const void **)this, (uint64_t *)&v51);
  v8 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v52 - v51));
  if (v52 == v51)
    v9 = 0;
  else
    v9 = v8;
  std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>((uint64_t)v51, v52, v9, 1);
  v49 = 0;
  v10 = v51;
  v11 = v52;
  if (v51 != v52)
  {
    v12 = 0;
    v13 = 0;
    while (1)
    {
      if ((v56 & 0x80u) == 0)
        v14 = v56;
      else
        v14 = v55;
      std::string::basic_string[abi:ne180100]((uint64_t)&v58, v14 + 1);
      if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v58;
      else
        v15 = (std::string *)v58.__r_.__value_.__r.__words[0];
      if (v14)
      {
        if ((v56 & 0x80u) == 0)
          v16 = &v54;
        else
          v16 = v54;
        memmove(v15, v16, v14);
      }
      *(_WORD *)((char *)&v15->__r_.__value_.__l.__data_ + v14) = 47;
      v17 = *((char *)v10 + 23);
      if (v17 >= 0)
        v18 = (const std::string::value_type *)v10;
      else
        v18 = (const std::string::value_type *)*v10;
      if (v17 >= 0)
        v19 = *((unsigned __int8 *)v10 + 23);
      else
        v19 = (std::string::size_type)v10[1];
      v20 = std::string::append(&v58, v18, v19);
      v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
      v48 = v20->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v21;
      v20->__r_.__value_.__l.__size_ = 0;
      v20->__r_.__value_.__r.__words[2] = 0;
      v20->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v58.__r_.__value_.__l.__data_);
      if (v48 >= 0)
        v22 = __p;
      else
        v22 = (void **)__p[0];
      if (!getFileModificationTimeAndSize((const char *)v22, &v50, &v49))
        goto LABEL_76;
      v23 = v49;
      v24 = v49 + v13;
      v25 = GpsdLogObjectGeneral;
      v26 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
      v27 = v50.tv_sec;
      if (v26)
      {
        if (v48 >= 0)
          v42 = __p;
        else
          v42 = (void **)__p[0];
        LODWORD(v58.__r_.__value_.__l.__data_) = 136316162;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
        WORD2(v58.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v50.tv_sec;
        HIWORD(v58.__r_.__value_.__r.__words[2]) = 2048;
        v59 = (uint64_t)(v3 - v4);
        v60 = 2048;
        v61 = v23;
        v62 = 2048;
        v63 = v24;
        _os_log_debug_impl(&dword_2293C9000, v25, OS_LOG_TYPE_DEBUG, "VendorLogger,pruneLogFiles,looking at,%s,modTime,%ld,floorTime,%ld,size,%lld,new total,%lld", (uint8_t *)&v58, 0x34u);
      }
      if (v27 < (uint64_t)(v3 - v4))
      {
        if (v48 >= 0)
          v28 = __p;
        else
          v28 = (void **)__p[0];
        deleteFile((const char *)v28);
        v29 = GpsdLogObjectGeneral;
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
          goto LABEL_75;
        if (v48 >= 0)
          v30 = __p;
        else
          v30 = (void **)__p[0];
        LODWORD(v58.__r_.__value_.__l.__data_) = 136315650;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v30;
        WORD2(v58.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v27;
        HIWORD(v58.__r_.__value_.__r.__words[2]) = 2048;
        v59 = (uint64_t)(v3 - v4);
        v31 = v29;
        v32 = "VendorLogger,pruneLogFiles,deleted due to age,%s,fileTime,%ld,targetTime,%ld";
        v33 = 32;
        goto LABEL_74;
      }
      if (v12 >= *((_DWORD *)this + 36))
        break;
      if (!v23)
      {
        if (v48 >= 0)
          v39 = __p;
        else
          v39 = (void **)__p[0];
        deleteFile((const char *)v39);
        v40 = GpsdLogObjectGeneral;
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
          goto LABEL_75;
        if (v48 >= 0)
          v41 = __p;
        else
          v41 = (void **)__p[0];
        LODWORD(v58.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v41;
        v31 = v40;
        v32 = "VendorLogger,pruneLogFiles,deleted due to zero size,%s";
        v33 = 12;
        goto LABEL_74;
      }
      if (v24 <= *((_QWORD *)this + 17))
      {
        v13 = v24;
        ++v12;
        goto LABEL_76;
      }
      if (v48 >= 0)
        v34 = __p;
      else
        v34 = (void **)__p[0];
      deleteFile((const char *)v34);
      v35 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        if (v48 >= 0)
          v43 = __p;
        else
          v43 = (void **)__p[0];
        LODWORD(v58.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v43;
        _os_log_debug_impl(&dword_2293C9000, v35, OS_LOG_TYPE_DEBUG, "VendorLogger,pruneLogFiles,deleted due to size,%s", (uint8_t *)&v58, 0xCu);
      }
      v13 = v24;
LABEL_75:
      ++v12;
LABEL_76:
      if (SHIBYTE(v48) < 0)
        operator delete(__p[0]);
      v10 += 3;
      if (v10 == v11)
        goto LABEL_89;
    }
    if (v48 >= 0)
      v36 = __p;
    else
      v36 = (void **)__p[0];
    deleteFile((const char *)v36);
    v37 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      goto LABEL_75;
    if (v48 >= 0)
      v38 = __p;
    else
      v38 = (void **)__p[0];
    LODWORD(v58.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
    WORD2(v58.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v12 + 1;
    v31 = v37;
    v32 = "VendorLogger,pruneLogFiles,deleted due to num files,%s,num files,%d";
    v33 = 18;
LABEL_74:
    _os_log_debug_impl(&dword_2293C9000, v31, OS_LOG_TYPE_DEBUG, v32, (uint8_t *)&v58, v33);
    goto LABEL_75;
  }
LABEL_89:
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&v51;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
LABEL_92:
  if ((char)v56 < 0)
    operator delete(v54);
}

void sub_2293E2B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  uint64_t v37;

  *(_QWORD *)(v37 - 176) = &a29;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v37 - 176));
  if (a37 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t VendorLogger::isLogFileOpen(VendorLogger *this)
{
  return *((unsigned __int8 *)this + 892);
}

void VendorLogger::ensureLogFileIsOpen(VendorLogger *this)
{
  if (!*((_BYTE *)this + 892) && (*((_WORD *)this + 76) & 0x1FF) != 0)
    VendorLogger::openNewLogFile(this);
}

void VendorLogger::ensureLogFileIsClosed(VendorLogger *this)
{
  if (*((_BYTE *)this + 892))
  {
    VendorLogger::closeLogFile(this);
    VendorLogger::pruneLogFiles(this);
  }
}

void VendorLogger::ensureDirectoryExists(VendorLogger *this)
{
  const char *v2;
  int v3;
  const char *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((*((_WORD *)this + 76) & 0x1FF) != 0)
  {
    v2 = (char *)this + 96;
    v3 = *((char *)this + 119);
    v4 = (char *)this + 96;
    if (v3 < 0)
      v4 = *(const char **)v2;
    if (mkdir(v4, 0x1F8u))
    {
      v5 = *__error();
      if (v5 != 17)
      {
        v13 = GpsdLogObjectGeneral;
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          return;
        if (*((char *)this + 119) < 0)
          v2 = *(const char **)v2;
        v14 = 136446466;
        v15 = v2;
        v16 = 1026;
        v17 = v5;
        v9 = "VendorLogger,could not create directory,%{public}s,%{public}d";
        v10 = v13;
        v11 = 18;
        goto LABEL_19;
      }
      if (*((char *)this + 119) < 0)
        v2 = *(const char **)v2;
      v6 = chmod(v2, 0x1F8u);
      v7 = GpsdLogObjectGeneral;
      if (v6)
      {
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          return;
        v8 = *__error();
        v14 = 67240192;
        LODWORD(v15) = v8;
        v9 = "VendorLogger,chmod failed,%{public}d";
        v10 = v7;
        v11 = 8;
LABEL_19:
        _os_log_error_impl(&dword_2293C9000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, v11);
        return;
      }
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        v14 = 67109120;
        LODWORD(v15) = 504;
        _os_log_debug_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEBUG, "VendorLogger,directory exists,permissions,%x", (uint8_t *)&v14, 8u);
      }
    }
    else
    {
      v12 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        if (*((char *)this + 119) < 0)
          v2 = *(const char **)v2;
        v14 = 136446466;
        v15 = v2;
        v16 = 1024;
        v17 = 504;
        _os_log_impl(&dword_2293C9000, v12, OS_LOG_TYPE_INFO, "VendorLogger,created directory,%{public}s,permissions,%x", (uint8_t *)&v14, 0x12u);
      }
    }
  }
}

void VendorLogger::initCompression(VendorLogger *this)
{
  uint64_t v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (*((_BYTE *)this + 276))
  {
    *((_QWORD *)this + 35) = 0;
    v2 = *((_QWORD *)this + 26);
    v3 = *((_QWORD *)this + 27) - v2;
    if (v3 >> 15)
    {
      if (v3 != 0x8000)
        *((_QWORD *)this + 27) = v2 + 0x8000;
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)this + 26, 0x8000 - v3);
    }
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "VendorLogger,initCompression", buf, 2u);
    }
    if (compression_stream_init((compression_stream *)((char *)this + 232), COMPRESSION_STREAM_ENCODE, *((compression_algorithm *)this + 68)))
    {
      v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "VendorLogger,initCompression,Could not init stream", v6, 2u);
      }
      *((_BYTE *)this + 276) = 0;
      *((_QWORD *)this + 27) = *((_QWORD *)this + 26);
    }
    else
    {
      *((_BYTE *)this + 277) = 1;
    }
  }
}

void VendorLogger::generateFilename(VendorLogger *this@<X0>, uint64_t a2@<X8>)
{
  size_t v4;
  std::string *v5;
  char *v6;
  int v7;
  const std::string::value_type *v8;
  std::string::size_type v9;
  std::string *v10;
  __int128 v11;
  const std::string::value_type *v12;
  std::string::size_type v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  __int128 v17;
  char *v18;
  void **v19;
  std::string::size_type v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  int v25;
  const std::string::value_type *v26;
  std::string::size_type v27;
  std::string *v28;
  __int128 v29;
  int v30;
  const std::string::value_type *v31;
  std::string::size_type v32;
  std::string *v33;
  std::string::size_type v34;
  char v35;
  int v36;
  uint64_t v37;
  int v38;
  const std::string::value_type *v39;
  void *__p[2];
  unsigned __int8 v41;
  std::string v42;
  std::string v43;
  std::string v44;
  std::string v45;
  std::string v46;
  std::string v47;
  std::string v48;
  void *v49[2];
  char v50;
  void *v51[2];
  unsigned __int8 v52;
  _QWORD v53[2];
  char __str[8];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 8uLL, "%03d", *((_DWORD *)this + 222));
  ++*((_DWORD *)this + 222);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  VendorLogger::isoTimestampString(v51);
  std::string::basic_string[abi:ne180100]<0>(v49, __str);
  if (*(_DWORD *)(GpsdPreferences::instance(0) + 8) == 3)
  {
    MEMORY[0x22E2C8BA4](v51, "unittest");
    MEMORY[0x22E2C8BA4](v49, "000");
  }
  if (*((char *)this + 119) >= 0)
    v4 = *((unsigned __int8 *)this + 119);
  else
    v4 = *((_QWORD *)this + 13);
  v5 = &v42;
  std::string::basic_string[abi:ne180100]((uint64_t)&v42, v4 + 1);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v5 = (std::string *)v42.__r_.__value_.__r.__words[0];
  if (v4)
  {
    if (*((char *)this + 119) >= 0)
      v6 = (char *)this + 96;
    else
      v6 = (char *)*((_QWORD *)this + 12);
    memmove(v5, v6, v4);
  }
  *(_WORD *)((char *)&v5->__r_.__value_.__l.__data_ + v4) = 47;
  v7 = *((char *)this + 23);
  if (v7 >= 0)
    v8 = (const std::string::value_type *)this;
  else
    v8 = *(const std::string::value_type **)this;
  if (v7 >= 0)
    v9 = *((unsigned __int8 *)this + 23);
  else
    v9 = *((_QWORD *)this + 1);
  v10 = std::string::append(&v42, v8, v9);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v43.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if ((v52 & 0x80u) == 0)
    v12 = (const std::string::value_type *)v51;
  else
    v12 = (const std::string::value_type *)v51[0];
  if ((v52 & 0x80u) == 0)
    v13 = v52;
  else
    v13 = (std::string::size_type)v51[1];
  v14 = std::string::append(&v43, v12, v13);
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = std::string::append(&v44, "_");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if (v50 >= 0)
    v18 = (char *)v49;
  else
    v18 = (char *)v49[0];
  std::string::basic_string[abi:ne180100]<0>(__p, v18);
  if ((v41 & 0x80u) == 0)
    v19 = __p;
  else
    v19 = (void **)__p[0];
  if ((v41 & 0x80u) == 0)
    v20 = v41;
  else
    v20 = (std::string::size_type)__p[1];
  v21 = std::string::append(&v45, (const std::string::value_type *)v19, v20);
  v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v46.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  v23 = std::string::append(&v46, ".");
  v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v47.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  v25 = *((char *)this + 47);
  if (v25 >= 0)
    v26 = (char *)this + 24;
  else
    v26 = (const std::string::value_type *)*((_QWORD *)this + 3);
  if (v25 >= 0)
    v27 = *((unsigned __int8 *)this + 47);
  else
    v27 = *((_QWORD *)this + 4);
  v28 = std::string::append(&v47, v26, v27);
  v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
  v48.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v48.__r_.__value_.__l.__data_ = v29;
  v28->__r_.__value_.__l.__size_ = 0;
  v28->__r_.__value_.__r.__words[2] = 0;
  v28->__r_.__value_.__r.__words[0] = 0;
  v30 = *((char *)this + 95);
  if (v30 >= 0)
    v31 = (char *)this + 72;
  else
    v31 = (const std::string::value_type *)*((_QWORD *)this + 9);
  if (v30 >= 0)
    v32 = *((unsigned __int8 *)this + 95);
  else
    v32 = *((_QWORD *)this + 10);
  v33 = std::string::append(&v48, v31, v32);
  v34 = v33->__r_.__value_.__r.__words[0];
  v53[0] = v33->__r_.__value_.__l.__size_;
  *(_QWORD *)((char *)v53 + 7) = *(std::string::size_type *)((char *)&v33->__r_.__value_.__r.__words[1] + 7);
  v35 = HIBYTE(v33->__r_.__value_.__r.__words[2]);
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  v36 = SHIBYTE(v48.__r_.__value_.__r.__words[2]);
  *(_QWORD *)(a2 + 15) = *(_QWORD *)((char *)v53 + 7);
  v37 = v53[0];
  *(_QWORD *)a2 = v34;
  *(_QWORD *)(a2 + 8) = v37;
  *(_BYTE *)(a2 + 23) = v35;
  if (v36 < 0)
    operator delete(v48.__r_.__value_.__l.__data_);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  if ((char)v41 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
  if (*((_BYTE *)this + 276))
  {
    std::string::append((std::string *)a2, ".");
    v38 = *((_DWORD *)this + 68);
    if (v38 > 773)
    {
      if (v38 == 774)
      {
        v39 = "lzma";
        goto LABEL_73;
      }
      if (v38 == 2049)
      {
        v39 = "lzfse";
        goto LABEL_73;
      }
    }
    else
    {
      if (v38 == 256)
      {
        v39 = "lz4";
        goto LABEL_73;
      }
      if (v38 == 517)
      {
        v39 = "zlib";
LABEL_73:
        std::string::append((std::string *)a2, v39);
        goto LABEL_74;
      }
    }
    v39 = "unk";
    goto LABEL_73;
  }
LABEL_74:
  if (v50 < 0)
    operator delete(v49[0]);
  if ((char)v52 < 0)
    operator delete(v51[0]);
}

void sub_2293E33C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  uint64_t v56;
  uint64_t v57;

  if (*(char *)(v57 - 137) < 0)
    operator delete(*(void **)(v57 - 160));
  if (a56 < 0)
    operator delete(__p);
  if (a49 < 0)
    operator delete(a44);
  if (a16 < 0)
    operator delete(a11);
  if (a42 < 0)
    operator delete(a37);
  if (a35 < 0)
    operator delete(a30);
  if (a28 < 0)
    operator delete(a23);
  if (a22 < 0)
    operator delete(a17);
  if (*(char *)(v57 - 105) < 0)
    operator delete(*(void **)(v57 - 128));
  if (*(char *)(v57 - 81) < 0)
    operator delete(*(void **)(v57 - 104));
  if (*(char *)(v56 + 23) < 0)
    operator delete(*(void **)v56);
  _Unwind_Resume(exception_object);
}

void VendorLogger::notifyStart(VendorLogger *this)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = *((_QWORD *)this + 110);
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger11notifyStartEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_async(v2, block);
  }
}

void ___ZN12VendorLogger11notifyStartEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (_QWORD *)(v1 + 856);
    if (*(char *)(v1 + 879) < 0)
      v3 = (_QWORD *)*v3;
    v4 = 136446210;
    v5 = v3;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "VendorLogger,notifyStart,activeFilename,%{public}s", (uint8_t *)&v4, 0xCu);
  }
  if (!*(_BYTE *)(v1 + 892) && (*(_WORD *)(v1 + 152) & 0x1FF) != 0)
    VendorLogger::openNewLogFile((VendorLogger *)v1);
}

void VendorLogger::notifyStop(VendorLogger *this)
{
  NSObject *v1;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  v1 = *((_QWORD *)this + 110);
  if (v1)
  {
    v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_INFO, "VendorLogger,notifyStop,received", buf, 2u);
      v1 = *((_QWORD *)this + 110);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger10notifyStopEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v1, block);
  }
}

void ___ZN12VendorLogger10notifyStopEv_block_invoke(uint64_t a1)
{
  VendorLogger::ensureLogFileIsClosed(*(VendorLogger **)(a1 + 32));
}

void VendorLogger::flush(VendorLogger *this)
{
  NSObject *v1;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  v1 = *((_QWORD *)this + 110);
  if (v1)
  {
    v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEFAULT, "VendorLogger,flush,received", buf, 2u);
      v1 = *((_QWORD *)this + 110);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger5flushEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v1, block);
  }
}

uint64_t ___ZN12VendorLogger5flushEv_block_invoke(uint64_t result)
{
  VendorLogger *v1;

  v1 = *(VendorLogger **)(result + 32);
  if ((*((_WORD *)v1 + 76) & 0x1FF) != 0)
  {
    VendorLogger::flushCompression(*(VendorLogger **)(result + 32));
    VendorLogger::initCompression(v1);
    return std::ostream::flush();
  }
  return result;
}

void VendorLogger::prepareForTermination(VendorLogger *this)
{
  NSObject *v1;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  v1 = *((_QWORD *)this + 110);
  if (v1)
  {
    v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEFAULT, "VendorLogger,prepareForTermination,received", buf, 2u);
      v1 = *((_QWORD *)this + 110);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger21prepareForTerminationEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v1, block);
  }
}

void ___ZN12VendorLogger21prepareForTerminationEv_block_invoke(uint64_t a1)
{
  VendorLogger::ensureLogFileIsClosed(*(VendorLogger **)(a1 + 32));
}

void VendorLogger::restart(VendorLogger *this)
{
  VendorLogger::notifyStop(this);
  VendorLogger::notifyStart(this);
}

uint64_t fillPrefixBufferWithTimestamp(char *a1, double a2)
{
  return snprintf(a1, 0x10uLL, "%.3f,", a2);
}

void VendorLogger::log(uint64_t a1, unsigned int a2, std::string::value_type *a3)
{
  double v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  const std::string::value_type *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  const std::string::value_type *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  uint64_t v22;
  _BOOL4 v23;
  const std::string::value_type *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  _BOOL4 v30;
  const std::string::value_type *v31;
  uint32_t v32;
  int v33;
  uint64_t v34;
  _BOOL4 v35;
  const std::string::value_type *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  const gpsd::util::DiagnosticReportParameters *v40;
  const std::string::value_type *v41;
  const std::string::value_type *v42;
  const std::string::value_type *v43;
  const std::string::value_type *v44;
  __int128 v45;
  NSObject *v46;
  std::string::value_type *v47;
  _QWORD v48[7];
  unsigned int v49;
  _BYTE buf[24];
  void *v51[2];
  _BYTE v52[32];
  char v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)a1) * 0.000000001;
  switch(*(_DWORD *)(a1 + 4 * a2 + 160))
  {
    case 0:
      v7 = *(unsigned __int8 *)(a1 + 196);
      v8 = GpsdLogObjectDevice;
      v9 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_FAULT);
      if (v7)
      {
        if (!v9)
          goto LABEL_34;
        if (a3[23] >= 0)
          v10 = a3;
        else
          v10 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 134349315;
        *(double *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(_QWORD *)&buf[14] = v10;
        v11 = "%{public}.3f,%{private}s";
        v12 = v8;
        v13 = 22;
      }
      else
      {
        if (!v9)
          goto LABEL_34;
        if (a3[23] >= 0)
          v47 = a3;
        else
          v47 = *(std::string::value_type **)a3;
        *(_DWORD *)buf = 136380675;
        *(_QWORD *)&buf[4] = v47;
        v11 = "%{private}s";
        v12 = v8;
        v13 = 12;
      }
      _os_log_fault_impl(&dword_2293C9000, v12, OS_LOG_TYPE_FAULT, v11, buf, v13);
LABEL_34:
      std::string::basic_string[abi:ne180100]<0>(buf, "Vendor");
      std::string::basic_string[abi:ne180100]<0>(v51, "assert");
      if (a3[23] < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&v52[8], *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
      }
      else
      {
        *(_OWORD *)&v52[8] = *(_OWORD *)a3;
        *(_QWORD *)&v52[24] = *((_QWORD *)a3 + 2);
      }
      v53 = 1;
      gpsd::util::triggerDiagnosticReport((gpsd::util *)buf, v40);
      if ((v52[31] & 0x80000000) != 0)
        operator delete(*(void **)&v52[8]);
      if ((v52[7] & 0x80000000) != 0)
        operator delete(v51[0]);
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
LABEL_67:
      if (*(_QWORD *)(a1 + 880))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x4812000000;
        v51[0] = __Block_byref_object_copy__0;
        v51[1] = __Block_byref_object_dispose__0;
        *(_OWORD *)&v52[16] = 0u;
        *(_OWORD *)v52 = 0u;
        v45 = *(_OWORD *)&v52[8];
        *(_QWORD *)&v52[24] = *((_QWORD *)a3 + 2);
        *(_OWORD *)&v52[8] = *(_OWORD *)a3;
        *(_OWORD *)a3 = v45;
        *((_QWORD *)a3 + 2) = 0;
        v46 = *(NSObject **)(a1 + 880);
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = ___ZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke;
        v48[3] = &unk_24F20BD00;
        v48[4] = buf;
        v48[5] = a1;
        *(double *)&v48[6] = v6;
        v49 = a2;
        dispatch_async(v46, v48);
        _Block_object_dispose(buf, 8);
        if ((v52[31] & 0x80000000) != 0)
          operator delete(*(void **)&v52[8]);
      }
      return;
    case 1:
      v14 = *(unsigned __int8 *)(a1 + 196);
      v15 = GpsdLogObjectDevice;
      v16 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_ERROR);
      if (v14)
      {
        if (!v16)
          goto LABEL_67;
        if (a3[23] >= 0)
          v17 = a3;
        else
          v17 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 134349315;
        *(double *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(_QWORD *)&buf[14] = v17;
        v18 = "%{public}.3f,%{private}s";
        v19 = v15;
        v20 = 22;
      }
      else
      {
        if (!v16)
          goto LABEL_67;
        if (a3[23] >= 0)
          v41 = a3;
        else
          v41 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 136380675;
        *(_QWORD *)&buf[4] = v41;
        v18 = "%{private}s";
        v19 = v15;
        v20 = 12;
      }
      _os_log_error_impl(&dword_2293C9000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_67;
    case 2:
      v21 = *(unsigned __int8 *)(a1 + 196);
      v22 = GpsdLogObjectDevice;
      v23 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          if (a3[23] >= 0)
            v24 = a3;
          else
            v24 = *(const std::string::value_type **)a3;
          *(_DWORD *)buf = 134349315;
          *(double *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2081;
          *(_QWORD *)&buf[14] = v24;
          v25 = "%{public}.3f,%{private}s";
          v26 = v22;
          v27 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_26;
        }
      }
      else if (v23)
      {
        if (a3[23] >= 0)
          v42 = a3;
        else
          v42 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 136380675;
        *(_QWORD *)&buf[4] = v42;
        v25 = "%{private}s";
        v26 = v22;
        v27 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_52;
      }
      goto LABEL_67;
    case 3:
      v28 = *(unsigned __int8 *)(a1 + 196);
      v29 = GpsdLogObjectDevice;
      v30 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (!v30)
          goto LABEL_67;
        if (a3[23] >= 0)
          v31 = a3;
        else
          v31 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 134349315;
        *(double *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(_QWORD *)&buf[14] = v31;
        v25 = "%{public}.3f,%{private}s";
        v26 = v29;
        v27 = OS_LOG_TYPE_INFO;
LABEL_26:
        v32 = 22;
      }
      else
      {
        if (!v30)
          goto LABEL_67;
        if (a3[23] >= 0)
          v43 = a3;
        else
          v43 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 136380675;
        *(_QWORD *)&buf[4] = v43;
        v25 = "%{private}s";
        v26 = v29;
        v27 = OS_LOG_TYPE_INFO;
LABEL_52:
        v32 = 12;
      }
      _os_log_impl(&dword_2293C9000, v26, v27, v25, buf, v32);
      goto LABEL_67;
    case 4:
      v33 = *(unsigned __int8 *)(a1 + 196);
      v34 = GpsdLogObjectDevice;
      v35 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_DEBUG);
      if (v33)
      {
        if (!v35)
          goto LABEL_67;
        if (a3[23] >= 0)
          v36 = a3;
        else
          v36 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 134349315;
        *(double *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(_QWORD *)&buf[14] = v36;
        v37 = "%{public}.3f,%{private}s";
        v38 = v34;
        v39 = 22;
      }
      else
      {
        if (!v35)
          goto LABEL_67;
        if (a3[23] >= 0)
          v44 = a3;
        else
          v44 = *(const std::string::value_type **)a3;
        *(_DWORD *)buf = 136380675;
        *(_QWORD *)&buf[4] = v44;
        v37 = "%{private}s";
        v38 = v34;
        v39 = 12;
      }
      _os_log_debug_impl(&dword_2293C9000, v38, OS_LOG_TYPE_DEBUG, v37, buf, v39);
      goto LABEL_67;
    default:
      goto LABEL_67;
  }
}

void sub_2293E3E78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(exception_object);
}

void gpsd::util::DiagnosticReportParameters::~DiagnosticReportParameters(void **this)
{
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  a2[3].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
}

void ___ZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  _DWORD v8[2];
  __int16 v9;
  unsigned int v10;
  __int16 v11;
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  VendorLogger::textLogWorker(v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, *(double *)(a1 + 48));
  v3 = *(_DWORD *)(a1 + 56);
  if (v3 >= 9)
    std::__throw_out_of_range[abi:ne180100]("bitset test argument out of range");
  if (((*(_QWORD *)(v2 + 152) >> v3) & 1) == 0
    && _ZZZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEUb_E17levelWarningCount <= 9)
  {
    v4 = ++_ZZZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEUb_E17levelWarningCount;
    v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = (_QWORD *)(v6 + 48);
      if (*(char *)(v6 + 71) < 0)
        v7 = (_QWORD *)*v7;
      v8[0] = 67240707;
      v8[1] = v4;
      v9 = 1026;
      v10 = v3;
      v11 = 2081;
      v12 = v7;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "VendorLogger,outOfLevel,text,%{public}d,level,%{public}d,%{private}s", (uint8_t *)v8, 0x18u);
    }
  }
}

void VendorLogger::textLogWorker(uint64_t a1, uint64_t a2, double a3)
{
  int v6;
  int v7;
  const unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const unsigned __int8 *v12;
  size_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char __str[4];
  double v19;
  __int16 v20;
  const unsigned __int8 *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  VendorLogger::checkLogAge((VendorLogger *)a1, a3);
  if (*(_BYTE *)(a1 + 276))
  {
    if (*(_BYTE *)(a1 + 196))
    {
      v6 = snprintf(__str, 0x10uLL, "%.3f,", a3);
      if (v6 >= 1)
        VendorLogger::writeCompressed((VendorLogger *)a1, (const unsigned __int8 *)__str, v6);
    }
    v7 = *(char *)(a2 + 23);
    if (v7 >= 0)
      v8 = (const unsigned __int8 *)a2;
    else
      v8 = *(const unsigned __int8 **)a2;
    if (v7 >= 0)
      v9 = *(unsigned __int8 *)(a2 + 23);
    else
      v9 = *(_QWORD *)(a2 + 8);
    VendorLogger::writeCompressed((VendorLogger *)a1, v8, v9);
    if (*(char *)(a2 + 23) < 0)
    {
      v10 = *(_QWORD *)(a2 + 8);
      if (!v10)
        return;
      a2 = *(_QWORD *)a2;
    }
    else
    {
      v10 = *(unsigned __int8 *)(a2 + 23);
      if (!*(_BYTE *)(a2 + 23))
        return;
    }
    if (*(_BYTE *)(a2 + v10 - 1) != 10)
    {
      __str[0] = 10;
      VendorLogger::writeCompressed((VendorLogger *)a1, (const unsigned __int8 *)__str, 1);
    }
  }
  else if ((*(_BYTE *)(a1 + 288 + *(_QWORD *)(*(_QWORD *)(a1 + 288) - 24) + 32) & 5) != 0)
  {
    v11 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      if (*(char *)(a2 + 23) >= 0)
        v12 = (const unsigned __int8 *)a2;
      else
        v12 = *(const unsigned __int8 **)a2;
      *(_DWORD *)__str = 134349315;
      v19 = a3;
      v20 = 2081;
      v21 = v12;
      _os_log_impl(&dword_2293C9000, v11, OS_LOG_TYPE_DEFAULT, "VendorLogger,unserviced textLogWorker,%{public}.3f,%{private}s", (uint8_t *)__str, 0x16u);
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 196) && snprintf(__str, 0x10uLL, "%.3f,", a3) >= 1)
    {
      v13 = strlen(__str);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)(a1 + 288), (uint64_t)__str, v13);
    }
    v14 = *(char *)(a2 + 23);
    if (v14 >= 0)
      v15 = a2;
    else
      v15 = *(_QWORD *)a2;
    if (v14 >= 0)
      v16 = *(unsigned __int8 *)(a2 + 23);
    else
      v16 = *(_QWORD *)(a2 + 8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)(a1 + 288), v15, v16);
    if (*(char *)(a2 + 23) < 0)
    {
      v17 = *(_QWORD *)(a2 + 8);
      if (!v17)
        return;
      a2 = *(_QWORD *)a2;
    }
    else
    {
      v17 = *(unsigned __int8 *)(a2 + 23);
      if (!*(_BYTE *)(a2 + 23))
        return;
    }
    if (*(_BYTE *)(a2 + v17 - 1) != 10)
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)(a1 + 288), (uint64_t)"\n", 1);
  }
}

void VendorLogger::checkLogAge(VendorLogger *this, double a2)
{
  signed int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = vcvtmd_s64_f64((double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001 - a2);
  if (*((_DWORD *)this + 224) < v3 && *((_DWORD *)this + 50) <= v3)
  {
    v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67240192;
      v5[1] = v3;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "VendorLogger,addtl memory use is induced by queue backup,%{public}d", (uint8_t *)v5, 8u);
    }
    *((_DWORD *)this + 224) = v3;
  }
}

void VendorLogger::writeCompressed(VendorLogger *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;
  compression_status v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)this + 276))
    return;
  if (*((_BYTE *)this + 277))
  {
    v4 = *((_QWORD *)this + 26);
    *((_QWORD *)this + 29) = v4;
    *((_QWORD *)this + 31) = a2;
    *((_QWORD *)this + 32) = a3;
    *((_QWORD *)this + 30) = *((_QWORD *)this + 27) - v4;
    while (1)
    {
      v5 = compression_stream_process((compression_stream *)((char *)this + 232), 0);
      if (v5)
        break;
      v6 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
      v7 = *((_QWORD *)this + 30);
      v8 = v6 - v7;
      if (v6 == v7)
      {
        if (!*((_QWORD *)this + 32))
          goto LABEL_25;
      }
      else
      {
        if (v6 < v7)
        {
          v9 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349312;
            v17 = v8;
            v18 = 2050;
            v19 = v6;
            _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "VendorLogger,Excessive bytes_to_print,%{public}zu,limit,%{public}zu", buf, 0x16u);
            v8 = *((_QWORD *)this + 27) - *((_QWORD *)this + 26);
          }
          else
          {
            v8 = v6;
          }
        }
        if ((*((_BYTE *)this + *(_QWORD *)(*((_QWORD *)this + 36) - 24) + 320) & 5) != 0)
        {
          v10 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_INFO, "VendorLogger,stream unavailable for compressed output", buf, 2u);
          }
        }
        else
        {
          std::ostream::write();
        }
        *((_QWORD *)this + 35) += v8;
        v11 = *((_QWORD *)this + 26);
        v12 = *((_QWORD *)this + 27) - v11;
        *((_QWORD *)this + 29) = v11;
        *((_QWORD *)this + 30) = v12;
      }
    }
    if (v5 == COMPRESSION_STATUS_END)
    {
      v13 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v14 = "VendorLogger,writeCompressed,unexpected COMPRESSION_STATUS_END";
    }
    else
    {
      v13 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v14 = "VendorLogger,writeCompressed,unexpected COMPRESSION_STATUS_ERROR";
    }
    _os_log_error_impl(&dword_2293C9000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
LABEL_25:
    if (*((_QWORD *)this + 35) > *((_QWORD *)this + 16))
      VendorLogger::openNewLogFile(this);
    return;
  }
  if ((VendorLogger::writeCompressed(unsigned char const*,unsigned long)::kWarningPrinted & 1) == 0)
  {
    v15 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v15, OS_LOG_TYPE_DEFAULT, "VendorLogger,log dropped since compression spun down", buf, 2u);
    }
    VendorLogger::writeCompressed(unsigned char const*,unsigned long)::kWarningPrinted = 1;
  }
}

void VendorLogger::log(gpsd::util *a1, int a2, uint64_t a3)
{
  VendorLogger::log(a1, a2, *(const void **)a3, *(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
}

void VendorLogger::log(gpsd::util *a1, int a2, const void *a3, size_t a4)
{
  unint64_t MachContinuousTimeNs;
  char *v9;
  NSObject *v10;
  _QWORD block[7];
  int v12;
  _QWORD v13[6];
  void *__p;
  void *__dst;
  uint64_t v16;

  if (*((_QWORD *)a1 + 110))
  {
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(a1);
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x4812000000;
    v13[3] = __Block_byref_object_copy__17;
    v13[4] = __Block_byref_object_dispose__18;
    v13[5] = &unk_2294029D7;
    __p = 0;
    __dst = 0;
    v16 = 0;
    if (a4)
    {
      std::vector<unsigned char>::__vallocate[abi:ne180100](&__p, a4);
      v9 = (char *)__dst;
      memmove(__dst, a3, a4);
      __dst = &v9[a4];
    }
    v10 = *((_QWORD *)a1 + 110);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger3logEN7GnssHal8LogLevelEPKhm_block_invoke;
    block[3] = &unk_24F20BD00;
    block[4] = v13;
    block[5] = a1;
    *(double *)&block[6] = (double)MachContinuousTimeNs * 0.000000001;
    v12 = a2;
    dispatch_async(v10, block);
    _Block_object_dispose(v13, 8);
    if (__p)
    {
      __dst = __p;
      operator delete(__p);
    }
  }
}

void sub_2293E47A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *__Block_byref_object_copy__17(_QWORD *result, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  size_t v4;
  _QWORD *v5;
  char *v6;

  result[6] = 0;
  result[7] = 0;
  result[8] = 0;
  v3 = *(_BYTE **)(a2 + 48);
  v2 = *(_BYTE **)(a2 + 56);
  v4 = v2 - v3;
  if (v2 != v3)
  {
    v5 = result;
    std::vector<unsigned char>::__vallocate[abi:ne180100](result + 6, v2 - v3);
    v6 = (char *)v5[7];
    result = memmove(v6, v3, v4);
    v5[7] = &v6[v4];
  }
  return result;
}

void sub_2293E4828(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 56) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void ___ZN12VendorLogger3logEN7GnssHal8LogLevelEPKhm_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  VendorLogger::binaryLogWorker(v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, *(double *)(a1 + 48));
  v3 = *(_DWORD *)(a1 + 56);
  if (v3 >= 9)
    std::__throw_out_of_range[abi:ne180100]("bitset test argument out of range");
  if (((*(_QWORD *)(v2 + 152) >> v3) & 1) == 0
    && _ZZZN12VendorLogger3logEN7GnssHal8LogLevelEPKhmEUb0_E17levelWarningCount <= 9)
  {
    v4 = ++_ZZZN12VendorLogger3logEN7GnssHal8LogLevelEPKhmEUb0_E17levelWarningCount;
    v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67240448;
      v6[1] = v4;
      v7 = 1026;
      v8 = v3;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "VendorLogger,outOfLevel,binary,%{public}d,level,%{public}d", (uint8_t *)v6, 0xEu);
    }
  }
}

void VendorLogger::binaryLogWorker(uint64_t a1, uint64_t a2, double a3)
{
  int v6;
  size_t v7;
  char __str[16];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VendorLogger::checkLogAge((VendorLogger *)a1, a3);
  if (*(_BYTE *)(a1 + 276))
  {
    if (*(_BYTE *)(a1 + 196))
    {
      v6 = snprintf(__str, 0x10uLL, "%.3f,", a3);
      if (v6 >= 1)
        VendorLogger::writeCompressed((VendorLogger *)a1, (const unsigned __int8 *)__str, v6);
    }
    VendorLogger::writeCompressed((VendorLogger *)a1, *(const unsigned __int8 **)a2, *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  }
  else
  {
    if (*(_BYTE *)(a1 + 196) && snprintf(__str, 0x10uLL, "%.3f,", a3) >= 1)
    {
      v7 = strlen(__str);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((_QWORD *)(a1 + 288), (uint64_t)__str, v7);
    }
    std::ostream::write();
  }
}

_QWORD *VendorLogger::isoTimestampString@<X0>(_QWORD *a1@<X8>)
{
  tm *v3;
  time_t v5;
  char __s[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = time(0);
  v3 = gmtime(&v5);
  if (v5 < 0 || !v3)
    strcpy(__s, "unknown_time");
  else
    strftime(__s, 0x20uLL, "%Y%m%dT_%H-%M-%SZ", v3);
  return std::string::basic_string[abi:ne180100]<0>(a1, __s);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>(uint64_t a1, const void **a2, uint64_t a3, char a4)
{
  const void **v8;
  const void **v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;
  const void **v22;
  const void **v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 *v27;
  __int128 v28;
  __int128 v29;
  BOOL v30;
  BOOL v31;
  __int128 v32;
  const void **v33;
  _BOOL4 v34;
  unint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const void **v45;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  const void **v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  int64_t v56;
  int64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  int64_t v68;
  _OWORD *v69;
  uint64_t v70;
  _OWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v90;
  const void **v91;
  __int128 v92;
  uint64_t v93;
  BOOL v94;
  __int128 v95;
  void *v96;
  const void **v97;
  char v98;
  uint64_t v99;
  __int128 v100;
  const void *v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
LABEL_2:
  v8 = a2 - 3;
  v97 = a2 - 6;
  v99 = (uint64_t)a2;
  v9 = a2 - 9;
  v10 = a1;
  while (2)
  {
    a1 = v10;
    v11 = (uint64_t)a2 - v10;
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - v10) >> 3);
    switch(v12)
    {
      case 0:
      case 1:
        return;
      case 2:
        if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v8, (const void **)a1))
        {
          v42 = *(_OWORD *)a1;
          v101 = *(const void **)(a1 + 16);
          v100 = v42;
          v43 = *(_OWORD *)v8;
          *(_QWORD *)(a1 + 16) = v8[2];
          *(_OWORD *)a1 = v43;
          v44 = v100;
          v8[2] = v101;
          *(_OWORD *)v8 = v44;
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)(a1 + 24), v8);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (__int128 *)v8);
        return;
      case 5:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (__int128 *)(a1 + 72), (__int128 *)v8);
        return;
      default:
        if (v11 <= 575)
        {
          v45 = (const void **)(a1 + 24);
          v47 = (const void **)a1 == a2 || v45 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v47)
            {
              v48 = 0;
              v49 = a1;
              do
              {
                v50 = (const void **)v49;
                v49 = (uint64_t)v45;
                if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v45, v50))
                {
                  v51 = *(_OWORD *)v49;
                  v101 = *(const void **)(v49 + 16);
                  v100 = v51;
                  *(_QWORD *)(v49 + 8) = 0;
                  *(_QWORD *)(v49 + 16) = 0;
                  *(_QWORD *)v49 = 0;
                  v52 = v48;
                  while (1)
                  {
                    v53 = a1 + v52;
                    *(_OWORD *)(v53 + 24) = *(_OWORD *)(a1 + v52);
                    *(_QWORD *)(v53 + 40) = *(_QWORD *)(a1 + v52 + 16);
                    *(_BYTE *)(v53 + 23) = 0;
                    *(_BYTE *)v53 = 0;
                    if (!v52)
                      break;
                    v52 -= 24;
                    if (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v100, (const void **)(v52 + a1)))
                    {
                      v54 = a1 + v52 + 24;
                      goto LABEL_81;
                    }
                  }
                  v54 = a1;
LABEL_81:
                  v55 = v100;
                  *(_QWORD *)(v54 + 16) = v101;
                  *(_OWORD *)v54 = v55;
                }
                v45 = (const void **)(v49 + 24);
                v48 += 24;
              }
              while ((const void **)(v49 + 24) != a2);
            }
          }
          else if (!v47)
          {
            v90 = a1 - 24;
            do
            {
              v91 = (const void **)a1;
              a1 = (uint64_t)v45;
              if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v45, v91))
              {
                v92 = *(_OWORD *)a1;
                v101 = *(const void **)(a1 + 16);
                v100 = v92;
                *(_QWORD *)(a1 + 8) = 0;
                *(_QWORD *)(a1 + 16) = 0;
                *(_QWORD *)a1 = 0;
                v93 = v90;
                do
                {
                  *(_OWORD *)(v93 + 48) = *(_OWORD *)(v93 + 24);
                  *(_QWORD *)(v93 + 64) = *(_QWORD *)(v93 + 40);
                  *(_BYTE *)(v93 + 47) = 0;
                  *(_BYTE *)(v93 + 24) = 0;
                  v94 = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v100, (const void **)v93);
                  v93 -= 24;
                }
                while (v94);
                v95 = v100;
                *(_QWORD *)(v93 + 64) = v101;
                *(_OWORD *)(v93 + 48) = v95;
              }
              v45 = (const void **)(a1 + 24);
              v90 += 24;
            }
            while ((const void **)(a1 + 24) != a2);
          }
          return;
        }
        if (!a3)
        {
          if ((const void **)a1 != a2)
          {
            v56 = (unint64_t)(v12 - 2) >> 1;
            v57 = v56;
            do
            {
              v58 = v57;
              if (v56 >= v57)
              {
                v59 = (2 * v57) | 1;
                v60 = a1 + 24 * v59;
                if (2 * v57 + 2 < v12
                  && std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a1 + 24 * v59), (const void **)(v60 + 24)))
                {
                  v60 += 24;
                  v59 = 2 * v58 + 2;
                }
                v61 = a1 + 24 * v58;
                if (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v60, (const void **)v61))
                {
                  v62 = *(_OWORD *)v61;
                  v101 = *(const void **)(v61 + 16);
                  v100 = v62;
                  *(_QWORD *)(v61 + 8) = 0;
                  *(_QWORD *)(v61 + 16) = 0;
                  *(_QWORD *)v61 = 0;
                  do
                  {
                    v63 = v60;
                    v64 = *(_OWORD *)v60;
                    *(_QWORD *)(v61 + 16) = *(_QWORD *)(v60 + 16);
                    *(_OWORD *)v61 = v64;
                    *(_BYTE *)(v60 + 23) = 0;
                    *(_BYTE *)v60 = 0;
                    if (v56 < v59)
                      break;
                    v65 = (2 * v59) | 1;
                    v60 = a1 + 24 * v65;
                    v66 = 2 * v59 + 2;
                    if (v66 < v12
                      && std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a1 + 24 * v65), (const void **)(v60 + 24)))
                    {
                      v60 += 24;
                      v65 = v66;
                    }
                    v61 = v63;
                    v59 = v65;
                  }
                  while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v60, (const void **)&v100));
                  v67 = v100;
                  *(_QWORD *)(v63 + 16) = v101;
                  *(_OWORD *)v63 = v67;
                }
              }
              v57 = v58 - 1;
            }
            while (v58);
            v68 = v11 / 0x18uLL;
            v69 = (_OWORD *)v99;
            do
            {
              v70 = 0;
              v71 = v69;
              v96 = *(void **)a1;
              *(_QWORD *)&v102 = *(_QWORD *)(a1 + 8);
              *(_QWORD *)((char *)&v102 + 7) = *(_QWORD *)(a1 + 15);
              v98 = *(_BYTE *)(a1 + 23);
              *(_QWORD *)(a1 + 8) = 0;
              *(_QWORD *)(a1 + 16) = 0;
              *(_QWORD *)a1 = 0;
              v72 = v68 - 2;
              if (v68 < 2)
                v72 = v68 - 1;
              v73 = v72 >> 1;
              v74 = a1;
              do
              {
                v75 = v74 + 24 * v70 + 24;
                v76 = 2 * v70;
                v70 = (2 * v70) | 1;
                v77 = v76 + 2;
                if (v76 + 2 < v68
                  && std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v75, (const void **)(v75 + 24)))
                {
                  v75 += 24;
                  v70 = v77;
                }
                if (*(char *)(v74 + 23) < 0)
                  operator delete(*(void **)v74);
                v78 = *(_OWORD *)v75;
                *(_QWORD *)(v74 + 16) = *(_QWORD *)(v75 + 16);
                *(_OWORD *)v74 = v78;
                *(_BYTE *)(v75 + 23) = 0;
                *(_BYTE *)v75 = 0;
                v74 = v75;
              }
              while (v70 <= v73);
              v69 = (_OWORD *)((char *)v71 - 24);
              if ((_OWORD *)v75 == (_OWORD *)((char *)v71 - 24))
              {
                *(_QWORD *)v75 = v96;
                v88 = *(_QWORD *)((char *)&v102 + 7);
                *(_QWORD *)(v75 + 8) = v102;
                *(_QWORD *)(v75 + 15) = v88;
                *(_BYTE *)(v75 + 23) = v98;
              }
              else
              {
                v79 = *v69;
                *(_QWORD *)(v75 + 16) = *((_QWORD *)v71 - 1);
                *(_OWORD *)v75 = v79;
                *((_QWORD *)v71 - 3) = v96;
                v80 = v102;
                *(_QWORD *)((char *)v71 - 9) = *(_QWORD *)((char *)&v102 + 7);
                *((_QWORD *)v71 - 2) = v80;
                *((_BYTE *)v71 - 1) = v98;
                v81 = v75 - a1 + 24;
                if (v81 >= 25)
                {
                  v82 = (v81 / 0x18uLL - 2) >> 1;
                  v83 = a1 + 24 * v82;
                  if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v83, (const void **)v75))
                  {
                    v84 = *(_OWORD *)v75;
                    v101 = *(const void **)(v75 + 16);
                    v100 = v84;
                    *(_QWORD *)(v75 + 8) = 0;
                    *(_QWORD *)(v75 + 16) = 0;
                    *(_QWORD *)v75 = 0;
                    do
                    {
                      v85 = v83;
                      v86 = *(_OWORD *)v83;
                      *(_QWORD *)(v75 + 16) = *(_QWORD *)(v83 + 16);
                      *(_OWORD *)v75 = v86;
                      *(_BYTE *)(v83 + 23) = 0;
                      *(_BYTE *)v83 = 0;
                      if (!v82)
                        break;
                      v82 = (v82 - 1) >> 1;
                      v83 = a1 + 24 * v82;
                      v75 = v85;
                    }
                    while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v83, (const void **)&v100));
                    v87 = v100;
                    *(_QWORD *)(v85 + 16) = v101;
                    *(_OWORD *)v85 = v87;
                  }
                }
              }
            }
            while (v68-- > 2);
          }
          return;
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = a1 + 24 * ((unint64_t)v12 >> 1);
        if ((unint64_t)v11 < 0xC01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)v14, (const void **)a1, v8);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)v14, v8);
          v15 = 3 * v13;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)(a1 + 24), (const void **)(a1 + 8 * v15 - 24), v97);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)(a1 + 48), (const void **)(a1 + 24 + 8 * v15), v9);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)(a1 + 8 * v15 - 24), (const void **)v14, (const void **)(a1 + 24 + 8 * v15));
          v16 = *(_OWORD *)a1;
          v101 = *(const void **)(a1 + 16);
          v100 = v16;
          v17 = *(_QWORD *)(v14 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v14;
          *(_QWORD *)(a1 + 16) = v17;
          v18 = v100;
          *(_QWORD *)(v14 + 16) = v101;
          *(_OWORD *)v14 = v18;
        }
        --a3;
        if ((a4 & 1) == 0
          && !std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a1 - 24), (const void **)a1))
        {
          v32 = *(_OWORD *)a1;
          v103 = *(_QWORD *)(a1 + 16);
          v102 = v32;
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v102, v8))
          {
            v10 = a1;
            do
              v10 += 24;
            while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v102, (const void **)v10));
          }
          else
          {
            v33 = (const void **)(a1 + 24);
            do
            {
              v10 = (unint64_t)v33;
              if (v33 >= a2)
                break;
              v34 = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v102, v33);
              v33 = (const void **)(v10 + 24);
            }
            while (!v34);
          }
          v35 = (unint64_t)a2;
          if (v10 < (unint64_t)a2)
          {
            v35 = (unint64_t)a2;
            do
              v35 -= 24;
            while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v102, (const void **)v35));
          }
          while (v10 < v35)
          {
            v36 = *(_OWORD *)v10;
            v101 = *(const void **)(v10 + 16);
            v100 = v36;
            v37 = *(_OWORD *)v35;
            *(_QWORD *)(v10 + 16) = *(_QWORD *)(v35 + 16);
            *(_OWORD *)v10 = v37;
            v38 = v100;
            *(_QWORD *)(v35 + 16) = v101;
            *(_OWORD *)v35 = v38;
            do
              v10 += 24;
            while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v102, (const void **)v10));
            do
              v35 -= 24;
            while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v102, (const void **)v35));
          }
          v39 = (__int128 *)(v10 - 24);
          if (v10 - 24 == a1)
          {
            if (*(char *)(v10 - 1) < 0)
              operator delete(*(void **)a1);
          }
          else
          {
            if (*(char *)(a1 + 23) < 0)
              operator delete(*(void **)a1);
            v40 = *v39;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(v10 - 8);
            *(_OWORD *)a1 = v40;
            *(_BYTE *)(v10 - 1) = 0;
            *(_BYTE *)(v10 - 24) = 0;
          }
          a4 = 0;
          v41 = v102;
          *(_QWORD *)(v10 - 8) = v103;
          *v39 = v41;
          continue;
        }
        v19 = 0;
        v20 = *(_OWORD *)a1;
        v103 = *(_QWORD *)(a1 + 16);
        v102 = v20;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        do
          v19 += 24;
        while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(v19 + a1), (const void **)&v102));
        v21 = a1 + v19;
        v22 = (const void **)v99;
        if (v19 == 24)
        {
          v22 = (const void **)v99;
          do
          {
            if (v21 >= (unint64_t)v22)
              break;
            v22 -= 3;
          }
          while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v22, (const void **)&v102));
        }
        else
        {
          do
            v22 -= 3;
          while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v22, (const void **)&v102));
        }
        v10 = a1 + v19;
        if (v21 < (unint64_t)v22)
        {
          v23 = v22;
          do
          {
            v24 = *(_OWORD *)v10;
            v101 = *(const void **)(v10 + 16);
            v100 = v24;
            v25 = *(_OWORD *)v23;
            *(_QWORD *)(v10 + 16) = v23[2];
            *(_OWORD *)v10 = v25;
            v26 = v100;
            v23[2] = v101;
            *(_OWORD *)v23 = v26;
            do
              v10 += 24;
            while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v10, (const void **)&v102));
            do
              v23 -= 3;
            while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v23, (const void **)&v102));
          }
          while (v10 < (unint64_t)v23);
        }
        v27 = (__int128 *)(v10 - 24);
        if (v10 - 24 == a1)
        {
          if (*(char *)(v10 - 1) < 0)
            operator delete(*(void **)a1);
        }
        else
        {
          if (*(char *)(a1 + 23) < 0)
            operator delete(*(void **)a1);
          v28 = *v27;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v10 - 8);
          *(_OWORD *)a1 = v28;
          *(_BYTE *)(v10 - 1) = 0;
          *(_BYTE *)(v10 - 24) = 0;
        }
        v29 = v102;
        *(_QWORD *)(v10 - 8) = v103;
        *v27 = v29;
        v30 = v21 >= (unint64_t)v22;
        a2 = (const void **)v99;
        if (!v30)
        {
LABEL_35:
          std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>(a1, v10 - 24, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v31 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, v10 - 24);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(v10, v99))
        {
          if (v31)
            continue;
          goto LABEL_35;
        }
        a2 = (const void **)(v10 - 24);
        if (!v31)
          goto LABEL_2;
        return;
    }
  }
}

BOOL std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(const void **a1, const void **a2)
{
  int v2;
  int v3;
  size_t v4;
  const void *v5;
  size_t v6;
  const void *v7;
  size_t v8;
  int v9;

  v2 = *((char *)a1 + 23);
  v3 = *((char *)a2 + 23);
  if (v3 >= 0)
    v4 = *((unsigned __int8 *)a2 + 23);
  else
    v4 = (size_t)a2[1];
  if (v3 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v2 >= 0)
    v6 = *((unsigned __int8 *)a1 + 23);
  else
    v6 = (size_t)a1[1];
  if (v2 >= 0)
    v7 = a1;
  else
    v7 = *a1;
  if (v6 >= v4)
    v8 = v4;
  else
    v8 = v6;
  v9 = memcmp(v5, v7, v8);
  if (v9)
    return v9 < 0;
  else
    return v4 < v6;
}

BOOL std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(const void **a1, const void **a2, const void **a3)
{
  BOOL v6;
  _BOOL8 result;
  const void *v8;
  __int128 v9;
  const void *v10;
  const void *v11;
  __int128 v12;
  const void *v13;
  const void *v14;
  __int128 v15;
  const void *v16;
  const void *v17;
  __int128 v18;
  const void *v19;
  const void *v20;

  v6 = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, a1);
  result = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2);
  if (v6)
  {
    if (result)
    {
      v8 = a1[2];
      v9 = *(_OWORD *)a1;
      v10 = a3[2];
      *(_OWORD *)a1 = *(_OWORD *)a3;
      a1[2] = v10;
    }
    else
    {
      v17 = a1[2];
      v18 = *(_OWORD *)a1;
      v19 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v19;
      *(_OWORD *)a2 = v18;
      a2[2] = v17;
      result = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2);
      if (!result)
        return result;
      v8 = a2[2];
      v9 = *(_OWORD *)a2;
      v20 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v20;
    }
    *(_OWORD *)a3 = v9;
    a3[2] = v8;
  }
  else if (result)
  {
    v11 = a2[2];
    v12 = *(_OWORD *)a2;
    v13 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v13;
    *(_OWORD *)a3 = v12;
    a3[2] = v11;
    result = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, a1);
    if (result)
    {
      v14 = a1[2];
      v15 = *(_OWORD *)a1;
      v16 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v16;
      *(_OWORD *)a2 = v15;
      a2[2] = v14;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  const void **v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = a2 - 24;
      if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a2 - 24), (const void **)a1))
      {
        v7 = *(_QWORD *)(a1 + 16);
        v8 = *(_OWORD *)a1;
        v9 = *(_QWORD *)(v6 + 16);
        *(_OWORD *)a1 = *(_OWORD *)v6;
        *(_QWORD *)(a1 + 16) = v9;
        *(_OWORD *)v6 = v8;
        *(_QWORD *)(v6 + 16) = v7;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)(a1 + 24), (const void **)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (__int128 *)(a2 - 24));
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (__int128 *)(a1 + 72), (__int128 *)(a2 - 24));
      return 1;
    default:
      v10 = (const void **)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)(a1 + 24), (const void **)(a1 + 48));
      v11 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v11, v10))
    {
      v17 = *(_OWORD *)v11;
      v18 = *(_QWORD *)(v11 + 16);
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      *(_QWORD *)v11 = 0;
      v14 = v12;
      while (1)
      {
        v15 = a1 + v14;
        *(_OWORD *)(v15 + 72) = *(_OWORD *)(a1 + v14 + 48);
        *(_QWORD *)(v15 + 88) = *(_QWORD *)(a1 + v14 + 64);
        *(_BYTE *)(v15 + 71) = 0;
        *(_BYTE *)(v15 + 48) = 0;
        if (v14 == -48)
          break;
        v14 -= 24;
        if (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v17, (const void **)(v15 + 24)))
        {
          v16 = a1 + v14 + 72;
          goto LABEL_12;
        }
      }
      v16 = a1;
LABEL_12:
      *(_OWORD *)v16 = v17;
      *(_QWORD *)(v16 + 16) = v18;
      if (++v13 == 8)
        return v11 + 24 == a2;
    }
    v10 = (const void **)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(uint64_t a1, const void **a2, const void **a3, __int128 *a4)
{
  __n128 result;
  const void *v9;
  __int128 v10;
  const void *v11;
  const void *v12;
  __int128 v13;
  const void *v14;
  const void *v15;
  const void *v16;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, a2, a3);
  if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)a4, a3))
  {
    v9 = a3[2];
    v10 = *(_OWORD *)a3;
    v11 = (const void *)*((_QWORD *)a4 + 2);
    *(_OWORD *)a3 = *a4;
    a3[2] = v11;
    *a4 = v10;
    *((_QWORD *)a4 + 2) = v9;
    if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2))
    {
      v12 = a2[2];
      v13 = *(_OWORD *)a2;
      v14 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v14;
      *(_OWORD *)a3 = v13;
      a3[2] = v12;
      if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, (const void **)a1))
      {
        v15 = *(const void **)(a1 + 16);
        result = *(__n128 *)a1;
        v16 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v16;
        *(__n128 *)a2 = result;
        a2[2] = v15;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(uint64_t a1, const void **a2, const void **a3, __int128 *a4, __int128 *a5)
{
  __n128 result;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  const void *v14;
  __int128 v15;
  const void *v16;
  const void *v17;
  __int128 v18;
  const void *v19;
  const void *v20;
  const void *v21;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, a2, a3, a4);
  if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)a5, (const void **)a4))
  {
    v11 = *((_QWORD *)a4 + 2);
    v12 = *a4;
    v13 = *((_QWORD *)a5 + 2);
    *a4 = *a5;
    *((_QWORD *)a4 + 2) = v13;
    *a5 = v12;
    *((_QWORD *)a5 + 2) = v11;
    if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)a4, a3))
    {
      v14 = a3[2];
      v15 = *(_OWORD *)a3;
      v16 = (const void *)*((_QWORD *)a4 + 2);
      *(_OWORD *)a3 = *a4;
      a3[2] = v16;
      *a4 = v15;
      *((_QWORD *)a4 + 2) = v14;
      if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2))
      {
        v17 = a2[2];
        v18 = *(_OWORD *)a2;
        v19 = a3[2];
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v19;
        *(_OWORD *)a3 = v18;
        a3[2] = v17;
        if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, (const void **)a1))
        {
          v20 = *(const void **)(a1 + 16);
          result = *(__n128 *)a1;
          v21 = a2[2];
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_QWORD *)(a1 + 16) = v21;
          *(__n128 *)a2 = result;
          a2[2] = v20;
        }
      }
    }
  }
  return result;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

uint64_t GpsdPlatformInfoHardware::detectHardware(GpsdPlatformInfoHardware *this)
{
  uint64_t result;
  NSObject *v2;
  __int128 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = xmmword_2293F7568;
  v4 = 710807826;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10401;
  v4 = 470738981;
  v3 = xmmword_2293F757C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10401;
  v4 = -2085056298;
  v3 = xmmword_2293F7590;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10403;
  v4 = 1860682089;
  v3 = xmmword_2293F75A4;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10403;
  v4 = -338255497;
  v3 = xmmword_2293F75B8;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10509;
  v4 = 152704997;
  v3 = xmmword_2293F75CC;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10509;
  v4 = 283967174;
  v3 = xmmword_2293F75E0;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10511;
  v4 = -1040127899;
  v3 = xmmword_2293F75F4;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10511;
  v4 = -1742178852;
  v3 = xmmword_2293F7608;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10501;
  v4 = 2146530832;
  v3 = xmmword_2293F761C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10501;
  v4 = 1330813729;
  v3 = xmmword_2293F7630;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10503;
  v4 = 617174804;
  v3 = xmmword_2293F7644;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10503;
  v4 = -871113647;
  v3 = xmmword_2293F7658;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10601;
  v4 = 1530707451;
  v3 = xmmword_2293F766C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10601;
  v4 = 1472775220;
  v3 = xmmword_2293F7680;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10603;
  v4 = 483476120;
  v3 = xmmword_2293F7694;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10603;
  v4 = 282158961;
  v3 = xmmword_2293F76A8;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10606;
  v4 = 56502976;
  v3 = xmmword_2293F76BC;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10606;
  v4 = -961843768;
  v3 = xmmword_2293F76D0;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10608;
  v4 = 1282132887;
  v3 = xmmword_2293F76E4;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10608;
  v4 = -441172408;
  v3 = xmmword_2293F76F8;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10610;
  v4 = 1326690998;
  v3 = xmmword_2293F770C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10610;
  v4 = 1756484512;
  v3 = xmmword_2293F7720;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10612;
  v4 = -126099363;
  v3 = xmmword_2293F7734;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10612;
  v4 = -1092155788;
  v3 = xmmword_2293F7748;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10614;
  v4 = 763775061;
  v3 = xmmword_2293F775C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10614;
  v4 = -63049871;
  v3 = xmmword_2293F7770;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10616;
  v4 = -557458837;
  v3 = xmmword_2293F7784;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10616;
  v4 = 1730000236;
  v3 = xmmword_2293F7798;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10618;
  v4 = 1530338216;
  v3 = xmmword_2293F77AC;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10701;
  v4 = 406601745;
  v3 = xmmword_2293F77C0;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10701;
  v4 = 1654218604;
  v3 = xmmword_2293F77D4;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10703;
  v4 = -1930811061;
  v3 = xmmword_2293F77E8;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10703;
  v4 = -182498503;
  v3 = xmmword_2293F77FC;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10705;
  v4 = 841005628;
  v3 = xmmword_2293F7810;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10708;
  v4 = -2030489149;
  v3 = xmmword_2293F7824;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10708;
  v4 = 1219348060;
  v3 = xmmword_2293F7838;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10710;
  v4 = 223445260;
  v3 = xmmword_2293F784C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 10710;
  v4 = -232427879;
  v3 = xmmword_2293F7860;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21102;
  v4 = -427474227;
  v3 = xmmword_2293F7874;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21106;
  v4 = 1477534141;
  v3 = xmmword_2293F7888;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21106;
  v4 = -1843102369;
  v3 = xmmword_2293F789C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21108;
  v4 = -61007701;
  v3 = xmmword_2293F78B0;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21203;
  v4 = -235416490;
  v3 = xmmword_2293F78C4;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21205;
  v4 = -820493242;
  v3 = xmmword_2293F78D8;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21201;
  v4 = -121925081;
  v3 = xmmword_2293F78EC;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21210;
  v4 = -1820426635;
  v3 = xmmword_2293F7900;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21502;
  v4 = -937652876;
  v3 = xmmword_2293F7914;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21503;
  v4 = 1874287171;
  v3 = xmmword_2293F7928;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21601;
  v4 = -781324731;
  v3 = xmmword_2293F793C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21602;
  v4 = 1214880059;
  v3 = xmmword_2293F7950;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21701;
  v4 = 426359977;
  v3 = xmmword_2293F7964;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 21702;
  v4 = -1841712216;
  v3 = xmmword_2293F7978;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 31102;
  v4 = 213746202;
  v3 = xmmword_2293F798C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 31104;
  v4 = 300442574;
  v3 = xmmword_2293F79A0;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 30808;
  v4 = 440949464;
  v3 = xmmword_2293F79B4;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 31302;
  v4 = -762483149;
  v3 = xmmword_2293F79C8;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 30804;
  v4 = -1294188889;
  v3 = xmmword_2293F79DC;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 30808;
  v4 = -1926937532;
  v3 = xmmword_2293F79F0;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 30804;
  v4 = -2132668294;
  v3 = xmmword_2293F7A04;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 30712;
  v4 = -858079590;
  v3 = xmmword_2293F7A18;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 31107;
  v4 = -1675932945;
  v3 = xmmword_2293F7A2C;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 30812;
  v4 = 300130091;
  v3 = xmmword_2293F7A40;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 30810;
  v4 = 646100384;
  v3 = xmmword_2293F7A54;
  if ((MGIsDeviceOfType() & 1) != 0)
    return 31202;
  v2 = GpsdLogObjectGeneral;
  result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    LODWORD(v3) = 67109120;
    DWORD1(v3) = MGGetProductType();
    _os_log_error_impl(&dword_2293C9000, v2, OS_LOG_TYPE_ERROR, "GpsdPlatformInfo,Unknown or unsupported hardware,%x", (uint8_t *)&v3, 8u);
    return 0;
  }
  return result;
}

void gnss::stringify(int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v3;
  std::string *v4;
  __int128 v5;
  std::string v6;

  switch(a1)
  {
    case 0:
      v3 = "kDropped";
      goto LABEL_11;
    case 1:
      v3 = "kSuccess";
      goto LABEL_11;
    case 2:
      v3 = "kAborted";
      goto LABEL_11;
    case 3:
      v3 = "kInUse";
      goto LABEL_11;
    case 4:
      v3 = "kInvalidArgument";
      goto LABEL_11;
    case 5:
      v3 = "kPermissionDenied";
      goto LABEL_11;
    case 6:
      v3 = "kTimeout";
      goto LABEL_11;
    case 7:
      v3 = "kUnavailable";
      goto LABEL_11;
    case 8:
      v3 = "kCompletedWithFailure";
LABEL_11:
      std::string::basic_string[abi:ne180100]<0>(a2, v3);
      break;
    default:
      std::to_string(&v6, a1);
      v4 = std::string::insert(&v6, 0, "unknown ");
      v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
      a2[2] = *((_QWORD *)&v4->__r_.__value_.__l + 2);
      *(_OWORD *)a2 = v5;
      v4->__r_.__value_.__l.__size_ = 0;
      v4->__r_.__value_.__r.__words[2] = 0;
      v4->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v6.__r_.__value_.__l.__data_);
      break;
  }
}

void sub_2293E6A1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t gnss::MeasurementData::fillIsUsableFlag(gnss::MeasurementData *this)
{
  uint64_t result;
  unsigned int v3;
  BOOL v4;
  int v5;
  uint64_t v7;
  uint64_t i;
  float v9;
  double v10;
  BOOL v11;

  result = GpsdPlatformInfo::instance(0);
  v3 = *(_DWORD *)(result + 8) - 103;
  v4 = v3 > 4;
  v5 = (1 << v3) & 0x19;
  if (!v4 && v5 != 0)
  {
    v7 = *((_QWORD *)this + 19);
    for (i = *((_QWORD *)this + 20); v7 != i; v7 += 176)
    {
      if (*(double *)(v7 + 48) < 0.0
        || (v9 = *(float *)(v7 + 56), v9 <= 0.0)
        || (*(_QWORD *)(v7 + 64) & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        v11 = 0;
      }
      else
      {
        v10 = *(double *)(v7 + 72);
        v11 = v9 < 5000.0;
        if (v10 <= 0.0)
          v11 = 0;
        if (v10 >= 50.0)
          v11 = 0;
      }
      *(_BYTE *)(v7 + 173) = v11;
    }
  }
  return result;
}

uint64_t calculateGcd(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (!(_DWORD)a2)
    return a1;
  do
  {
    v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }
  while ((_DWORD)a2);
  return v2;
}

unint64_t gpsd::util::getMachContinuousTimeNs(gpsd::util *this)
{
  unsigned __int8 v1;
  uint64_t v2;
  char v3;

  {
    getTickToNsInfo();
  }
  v2 = mach_continuous_time();
  v3 = 8;
  if (!getTickToNsInfo(void)::info)
    v3 = 0;
  return ((v2 >> v3) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v3;
}

void sub_2293E6BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void getTickToNsInfo(void)
{
  uint32_t denom;
  uint32_t numer;
  uint32_t v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  std::string v10;
  std::string v11;
  std::string v12;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;
  std::string v17;
  std::string v18;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  _BYTE v23[14];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!getTickToNsInfo(void)::info)
  {
    mach_timebase_info(&info);
    if (info.denom)
    {
      denom = info.denom;
      numer = info.numer;
      do
      {
        v2 = denom;
        denom = numer % denom;
        numer = v2;
      }
      while (denom);
    }
    else
    {
      v2 = info.numer;
      if (!info.numer)
      {
        v9 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "gcd result is zero", buf, 2u);
          v9 = GpsdLogObjectGeneral;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v21 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
          v22 = 1026;
          *(_DWORD *)v23 = 85;
          *(_WORD *)&v23[4] = 2082;
          *(_QWORD *)&v23[6] = "getTickToNsInfo";
          _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
        }
        std::string::basic_string[abi:ne180100]<0>(&v18, "assert");
        std::string::basic_string[abi:ne180100]<0>(&v17, "getTickToNsInfo");
        std::string::basic_string[abi:ne180100]<0>(&v16, "gcd result is zero");
        gpsd::util::triggerDiagnosticReport((uint64_t)&v18, (uint64_t)&v17, (uint64_t)&v16);
        std::string::~string(&v16);
        std::string::~string(&v17);
        std::string::~string(&v18);
        __assert_rtn("getTickToNsInfo", "GpsdUtil.mm", 85, "false && \"gcd result is zero\"");
      }
    }
    getTickToNsInfo(void)::info = info.denom / v2;
    getTickToNsInfo(void)::info = info.numer / v2;
    if (v2 > info.denom)
    {
      v7 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "info.denominator is zero", buf, 2u);
        v7 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v21 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
        v22 = 1026;
        *(_DWORD *)v23 = 88;
        *(_WORD *)&v23[4] = 2082;
        *(_QWORD *)&v23[6] = "getTickToNsInfo";
        _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v15, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v14, "getTickToNsInfo");
      std::string::basic_string[abi:ne180100]<0>(&v13, "info.denominator is zero");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v15, (uint64_t)&v14, (uint64_t)&v13);
      std::string::~string(&v13);
      std::string::~string(&v14);
      std::string::~string(&v15);
      __assert_rtn("getTickToNsInfo", "GpsdUtil.mm", 88, "false && \"info.denominator is zero\"");
    }
    if (v2 > info.numer)
    {
      v8 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "info.numerator is zero", buf, 2u);
        v8 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v21 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
        v22 = 1026;
        *(_DWORD *)v23 = 89;
        *(_WORD *)&v23[4] = 2082;
        *(_QWORD *)&v23[6] = "getTickToNsInfo";
        _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v12, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v11, "getTickToNsInfo");
      std::string::basic_string[abi:ne180100]<0>(&v10, "info.numerator is zero");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v10);
      std::string::~string(&v10);
      std::string::~string(&v11);
      std::string::~string(&v12);
      __assert_rtn("getTickToNsInfo", "GpsdUtil.mm", 89, "false && \"info.numerator is zero\"");
    }
    v3 = info.numer / v2 * (unint64_t)(info.denom / v2);
    if (v3 >= 0x17D)
    {
      getTickToNsInfo(void)::info = 1;
      v4 = GpsdLogObjectGeneral;
      if (v3 >> 10 > 0x5E)
      {
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_2293C9000, v4, OS_LOG_TYPE_ERROR, "#gpsdUtil,Cannot protect against overflow in tick to ns", buf, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "#gpsdUtil,Reducing tick to ns precision to avoid overflow risk", buf, 2u);
      }
    }
    v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      if (getTickToNsInfo(void)::info)
        v6 = 8;
      else
        v6 = 0;
      *(_DWORD *)buf = 134218496;
      v21 = (const char *)getTickToNsInfo(void)::info;
      v22 = 2048;
      *(_QWORD *)v23 = getTickToNsInfo(void)::info;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = v6;
      _os_log_debug_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEBUG, "#gpsdUtil,Tick to ns info,Numerator,%llu,Denominator,%llu,PrecisionReductionBits,%d", buf, 0x1Cu);
    }
  }
}

void sub_2293E7148(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,char a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *__p,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  uint64_t v50;

  if (a50 < 0)
    operator delete(__p);
  if (*(char *)(v50 - 129) < 0)
    operator delete(*(void **)(v50 - 152));
  if (*(char *)(v50 - 105) < 0)
    operator delete(*(void **)(v50 - 128));
  _Unwind_Resume(exception_object);
}

double gpsd::util::getMachContinuousTimeSeconds(gpsd::util *this)
{
  return (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
}

unint64_t gpsd::util::getMachAbsoluteTimeNs(gpsd::util *this)
{
  unsigned __int8 v1;
  uint64_t v2;
  char v3;

  {
    getTickToNsInfo();
  }
  v2 = mach_absolute_time();
  v3 = 8;
  if (!getTickToNsInfo(void)::info)
    v3 = 0;
  return ((v2 >> v3) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v3;
}

void sub_2293E72D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t gpsd::util::convertMachTimeInTicksToNs(unint64_t this)
{
  unsigned __int8 v2;
  char v3;

  if ((v2 & 1) == 0
  {
    getTickToNsInfo();
  }
  v3 = 8;
  if (!getTickToNsInfo(void)::info)
    v3 = 0;
  return ((this >> v3) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v3;
}

void sub_2293E736C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t gpsd::util::convertNsToMachTimeInTicks(unint64_t this)
{
  unsigned __int8 v2;
  char v3;

  if ((v2 & 1) == 0
  {
    getTickToNsInfo();
  }
  v3 = 8;
  if (!getTickToNsInfo(void)::info)
    v3 = 0;
  return ((this >> v3) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v3;
}

void sub_2293E7408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL gpsd::util::getCurrentMachContinuousMinusMachAbsoluteTicks(gpsd::util *this, unint64_t *a2)
{
  NSObject *v3;
  _BOOL8 result;
  uint8_t buf[4];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (mach_get_times())
  {
    v3 = GpsdLogObjectGeneral;
    result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "#gpsdUtil,mach_get_times failed", buf, 2u);
      return 0;
    }
  }
  else
  {
    *(_QWORD *)this = 0;
    return 1;
  }
  return result;
}

BOOL gpsd::util::getCurrentMachContinuousMinusMachAbsoluteNanoseconds(gpsd::util *this, unint64_t *a2)
{
  _BOOL8 CurrentMachContinuousMinusMachAbsoluteTicks;
  gpsd::util *v5;

  v5 = 0;
  CurrentMachContinuousMinusMachAbsoluteTicks = gpsd::util::getCurrentMachContinuousMinusMachAbsoluteTicks((gpsd::util *)&v5, a2);
  if (CurrentMachContinuousMinusMachAbsoluteTicks)
    *(_QWORD *)this = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v5);
  return CurrentMachContinuousMinusMachAbsoluteTicks;
}

CFAbsoluteTime gpsd::util::getInaccurateGpsTimeSeconds(gpsd::util *this)
{
  return CFAbsoluteTimeGetCurrent() + -5.0 + 662342413.0;
}

double gpsd::util::getProcessUptimeSec(gpsd::util *this)
{
  if (!gpsd::util::getProcessUptimeSec(void)::sMachContTimeStartNs)
  {
    this = (gpsd::util *)gpsd::util::getMachContinuousTimeNs(this);
    gpsd::util::getProcessUptimeSec(void)::sMachContTimeStartNs = (uint64_t)this;
  }
  return (double)(gpsd::util::getMachContinuousTimeNs(this) - gpsd::util::getProcessUptimeSec(void)::sMachContTimeStartNs)
       * 0.000000001;
}

void gpsd::util::stringify(unsigned int __val@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  std::string *v5;
  std::string::size_type v6;
  char v7;
  std::string __p;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if (__val >= 0x1B || ((0x7FFFE3Fu >> __val) & 1) == 0)
    goto LABEL_6;
  MEMORY[0x22E2C8BA4](a2, off_24F20BD48[__val]);
  v4 = *(unsigned __int8 *)(a2 + 23);
  if (*(char *)(a2 + 23) < 0)
    v4 = *(_QWORD *)(a2 + 8);
  if (!v4)
  {
LABEL_6:
    std::to_string(&__p, __val);
    v5 = std::string::insert(&__p, 0, "unknown_");
    v6 = v5->__r_.__value_.__r.__words[0];
    v9[0] = v5->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v9 + 7) = *(std::string::size_type *)((char *)&v5->__r_.__value_.__r.__words[1] + 7);
    v7 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    if (*(char *)(a2 + 23) < 0)
      operator delete(*(void **)a2);
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v9[0];
    *(_QWORD *)(a2 + 15) = *(_QWORD *)((char *)v9 + 7);
    *(_BYTE *)(a2 + 23) = v7;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2293E7728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (*(char *)(v14 + 23) < 0)
    operator delete(*(void **)v14);
  _Unwind_Resume(exception_object);
}

void gpsd::util::stringify(int __val@<W0>, uint64_t a2@<X8>)
{
  const char *v4;
  uint64_t v5;
  std::string *v6;
  std::string::size_type v7;
  char v8;
  std::string __p;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v4 = "START";
  switch(__val)
  {
    case 0:
      v4 = "PROTO_DEFAULT";
      goto LABEL_62;
    case 1:
      goto LABEL_62;
    case 2:
      v4 = "STOP";
      goto LABEL_62;
    case 3:
      v4 = "RESET";
      goto LABEL_62;
    case 4:
      v4 = "CLEAR";
      goto LABEL_62;
    case 5:
      v4 = "DELETE_GNSS_DATA";
      goto LABEL_62;
    case 6:
      v4 = "SET_PVTM_REPORT";
      goto LABEL_62;
    case 7:
      v4 = "SET_NMEA_HANDLER";
      goto LABEL_62;
    case 8:
      v4 = "INJECT_ASSISTANCE_POSITION";
      goto LABEL_62;
    case 9:
      v4 = "INJECT_ASSISTANCE_TIME";
      goto LABEL_62;
    case 10:
      v4 = "INJECT_ASSISTANCE_FILE";
      goto LABEL_62;
    case 11:
      v4 = "INJECT_RTI_FILE";
      goto LABEL_62;
    case 12:
      v4 = "INJECT_SVID_BLOCKLIST";
      goto LABEL_62;
    case 13:
      v4 = "SET_ASSISTANCE_PRESSURE";
      goto LABEL_62;
    case 14:
      v4 = "SET_ASSISTANCE_ACCEL";
      goto LABEL_62;
    case 15:
      v4 = "SET_ASSISTANCE_GYRO";
      goto LABEL_62;
    case 16:
      v4 = "SET_ASSISTANCE_DEM";
      goto LABEL_62;
    case 17:
      v4 = "SET_ASSISTANCE_MAP_VECTOR";
      goto LABEL_62;
    case 18:
      v4 = "SET_ASSISTANCE_MOTION_ACTIVITY_CONTEXT";
      goto LABEL_62;
    case 19:
      v4 = "SET_ASSISTANCE_MOUNT_STATE";
      goto LABEL_62;
    case 20:
      v4 = "SET_ASSISTANCE_SIGNAL_ENVIRONMENT";
      goto LABEL_62;
    case 21:
      v4 = "SET_ASSISTANCE_SPEED_CONSTRAINT";
      goto LABEL_62;
    case 22:
      v4 = "SET_ASSISTANCE_ALONG_TRACK_VELOCITY";
      goto LABEL_62;
    case 23:
      v4 = "SET_POWER_REPORT";
      goto LABEL_62;
    case 24:
      v4 = "SET_CONFIG_SIMULATOR_MODE";
      goto LABEL_62;
    case 25:
      v4 = "SET_CONFIG_ENABLE_GNSS_CONSTELLATIONS";
      goto LABEL_62;
    case 26:
      v4 = "SET_CONFIG_DUTY_CYCLING";
      goto LABEL_62;
    case 27:
      v4 = "SET_TIME_TRANSFER_PULSE";
      goto LABEL_62;
    case 28:
      v4 = "CLEAN_TIME_TRANSFER_PULSE";
      goto LABEL_62;
    case 29:
      v4 = "INJECT_LTL_INFO";
      goto LABEL_62;
    case 30:
      v4 = "CNTIN_STATUS_UPDATE";
      goto LABEL_62;
    case 31:
      v4 = "SET_THERMAL_RISK_STATE";
      goto LABEL_62;
    case 32:
      v4 = "PING";
      goto LABEL_62;
    case 34:
      v4 = "BUILD_DEVICE";
      goto LABEL_62;
    case 35:
      v4 = "TERMINATION_IMMINENT";
      goto LABEL_62;
    case 36:
      v4 = "EXIT";
      goto LABEL_62;
    case 37:
      v4 = "FORCE_CLEAR_ALL_NV";
      goto LABEL_62;
    case 38:
      v4 = "SET_CONFIG_RF_BAND_ENABLE";
      goto LABEL_62;
    case 51:
      v4 = "START_EMERGENCY_PREEMPTIVE_SESSION";
      goto LABEL_62;
    case 52:
      v4 = "STOP_EMERGENCY_PREEMPTIVE_SESSION";
      goto LABEL_62;
    case 53:
      v4 = "SET_EMERGENCY_CONFIG";
      goto LABEL_62;
    case 54:
      v4 = "SET_EMERGENCY_SESSION_SUMMARY_REPORT";
      goto LABEL_62;
    case 55:
      v4 = "ENTER_EMERGENCY_MODE";
      goto LABEL_62;
    case 56:
      v4 = "EXIT_EMERGENCY_MODE";
      goto LABEL_62;
    case 60:
      v4 = "START_EMERGENCY_POSITION";
      goto LABEL_62;
    case 61:
      v4 = "STOP_EMERGENCY_POSITION";
      goto LABEL_62;
    case 62:
      v4 = "SET_EMERGENCY_POSITION_REPORT";
      goto LABEL_62;
    case 63:
      v4 = "SET_EMERGENCY_MEASUREMENT_REPORT";
      goto LABEL_62;
    case 64:
      v4 = "SET_NW_ASSISTANCE_NEEDED_REPORT";
      goto LABEL_62;
    case 65:
      v4 = "SET_NW_ASSISTANCE_GPS_REF_TIME";
      goto LABEL_62;
    case 66:
      v4 = "SET_NW_ASSISTANCE_REF_POSITION";
      goto LABEL_62;
    case 67:
      v4 = "SET_NW_ASSISTANCE_GPS_EPHEMERIS";
      goto LABEL_62;
    case 68:
      v4 = "SET_NW_ASSISTANCE_GPS_ACQUISITION";
      goto LABEL_62;
    case 69:
      v4 = "INJECT_FT_ASSISTANCE";
      goto LABEL_62;
    case 70:
      v4 = "DECODE_SUPL_INIT";
      goto LABEL_62;
    case 71:
      v4 = "SET_SUPL_INIT";
      goto LABEL_62;
    case 72:
      v4 = "SET_SUPL_LOCATIONID_NEEDED_REPORT";
      goto LABEL_62;
    case 73:
      v4 = "SET_SUPL_LOCATIONID";
      goto LABEL_62;
    case 74:
      v4 = "ABORT_SUPL_SESSION";
      goto LABEL_62;
    case 75:
      v4 = "SET_SUPL_SESSION_STATUS_REPORT";
      goto LABEL_62;
    case 76:
      v4 = "SET_SUPL_WLAN_MEAS";
LABEL_62:
      MEMORY[0x22E2C8BA4](a2, v4);
      v5 = *(unsigned __int8 *)(a2 + 23);
      if (*(char *)(a2 + 23) < 0)
        v5 = *(_QWORD *)(a2 + 8);
      if (!v5)
        goto LABEL_65;
      return;
    default:
LABEL_65:
      std::to_string(&__p, __val);
      v6 = std::string::insert(&__p, 0, "unknown_");
      v7 = v6->__r_.__value_.__r.__words[0];
      v10[0] = v6->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v10 + 7) = *(std::string::size_type *)((char *)&v6->__r_.__value_.__r.__words[1] + 7);
      v8 = HIBYTE(v6->__r_.__value_.__r.__words[2]);
      v6->__r_.__value_.__l.__size_ = 0;
      v6->__r_.__value_.__r.__words[2] = 0;
      v6->__r_.__value_.__r.__words[0] = 0;
      if (*(char *)(a2 + 23) < 0)
        operator delete(*(void **)a2);
      *(_QWORD *)a2 = v7;
      *(_QWORD *)(a2 + 8) = v10[0];
      *(_QWORD *)(a2 + 15) = *(_QWORD *)((char *)v10 + 7);
      *(_BYTE *)(a2 + 23) = v8;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      return;
  }
}

void sub_2293E7B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v14 + 23) < 0)
    operator delete(*(void **)v14);
  _Unwind_Resume(exception_object);
}

void gpsd::util::shorthandStringify(int a1@<W0>, _QWORD *a2@<X8>)
{
  const char *v3;
  __int128 v4;
  uint64_t v5;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = "INJECT_TIME";
  switch(a1)
  {
    case 8:
      v3 = "INJECT_POSITION";
      goto LABEL_45;
    case 9:
      goto LABEL_45;
    case 10:
      v3 = "INJECT_FILE";
      goto LABEL_45;
    case 11:
      v3 = "INJECT_RTI";
      goto LABEL_45;
    case 12:
      v3 = "INJECT_BLOCKLIST";
      goto LABEL_45;
    case 14:
      v3 = "ACCEL";
      goto LABEL_45;
    case 15:
      v3 = "GYRO";
      goto LABEL_45;
    case 16:
      v3 = "DEM";
      goto LABEL_45;
    case 17:
      v3 = "MAP_VECTOR";
      goto LABEL_45;
    case 18:
      v3 = "MOTION_CONTEXT";
      goto LABEL_45;
    case 19:
      v3 = "MOUNT_STATE";
      goto LABEL_45;
    case 20:
      v3 = "SIGNAL_ENV";
      goto LABEL_45;
    case 21:
      v3 = "SPEED_CONSTRAINT";
      goto LABEL_45;
    case 22:
      v3 = "ALONG_TRACK_VEL";
      goto LABEL_45;
    case 23:
      v3 = "SET_POWER_REPORT";
      goto LABEL_45;
    case 24:
      v3 = "CONFIG_SIM";
      goto LABEL_45;
    case 25:
      v3 = "CONFIG_CONSTELL";
      goto LABEL_45;
    case 26:
      v3 = "CONFIG_DUTY";
      goto LABEL_45;
    case 27:
      v3 = "SET_TT_PULSE";
      goto LABEL_45;
    case 28:
      v3 = "CLEAN_TT_PULSE";
      goto LABEL_45;
    case 31:
      v3 = "THERMAL_RISK";
      goto LABEL_45;
    case 35:
      v3 = "TERM_IMMINENT";
      goto LABEL_45;
    case 37:
      v3 = "FORCE_CLEAR";
      goto LABEL_45;
    case 38:
      v3 = "CONFIG_BANDS";
      goto LABEL_45;
    case 51:
      v3 = "START_PREEMPT";
      goto LABEL_45;
    case 52:
      v3 = "STOP_PREEMPT";
      goto LABEL_45;
    case 53:
      v3 = "EMERG_CONFIG";
      goto LABEL_45;
    case 54:
      v3 = "EMERG_SUMMARY";
      goto LABEL_45;
    case 60:
      v3 = "START_EMERG";
      goto LABEL_45;
    case 61:
      v3 = "STOP_EMERG";
      goto LABEL_45;
    case 62:
      v3 = "EMERG_POS_RPT";
      goto LABEL_45;
    case 64:
      v3 = "NW_NEEDED_RPT";
      goto LABEL_45;
    case 65:
      v3 = "NW_REF_TIME";
      goto LABEL_45;
    case 66:
      v3 = "NW_REF_POS";
      goto LABEL_45;
    case 67:
      v3 = "NW_EPHEM";
      goto LABEL_45;
    case 68:
      v3 = "NW_GPS_ACQUISITION";
      goto LABEL_45;
    case 69:
      v3 = "INJECT_FTA_1x";
      goto LABEL_45;
    case 70:
      v3 = "DEC_SUPL_INIT";
      goto LABEL_45;
    case 71:
      v3 = "SUPL_INIT";
      goto LABEL_45;
    case 72:
      v3 = "SUPL_LOCID_NEED";
      goto LABEL_45;
    case 73:
      v3 = "SUPL_LOCID";
      goto LABEL_45;
    case 74:
      v3 = "ABORT_SUPL";
      goto LABEL_45;
    case 75:
      v3 = "SUPL_STATUS";
LABEL_45:
      MEMORY[0x22E2C8BA4](a2, v3);
      break;
    default:
      gpsd::util::stringify(a1, (uint64_t)&v4);
      *(_OWORD *)a2 = v4;
      a2[2] = v5;
      break;
  }
}

void sub_2293E7E00(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

BOOL gpsd::util::isRequestTypeHighRate(int a1)
{
  return (a1 & 0xFFFFFFFE) == 14;
}

uint64_t gpsd::util::fletcher16(unsigned __int8 **a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  __int16 v3;
  __int16 v4;
  __int16 v5;

  v1 = *a1;
  v2 = a1[1] - *a1;
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = *v1++;
      v4 += v5;
      v3 += v4;
      --v2;
    }
    while (v2);
  }
  else
  {
    LOBYTE(v4) = 0;
    v3 = 0;
  }
  return (unsigned __int16)(v4 | (unsigned __int16)(v3 << 8));
}

uint64_t gpsd::util::fletcher16(gpsd::util *this, const unsigned __int8 *a2)
{
  __int16 v2;
  __int16 v3;
  __int16 v4;

  if (a2)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *(unsigned __int8 *)this;
      this = (gpsd::util *)((char *)this + 1);
      v3 += v4;
      v2 += v3;
      --a2;
    }
    while (a2);
  }
  else
  {
    LOBYTE(v3) = 0;
    v2 = 0;
  }
  return (unsigned __int16)(v3 | (unsigned __int16)(v2 << 8));
}

uint64_t gpsd::util::fletcher16(unsigned __int8 *a1)
{
  uint64_t v1;
  unsigned __int8 *v2;
  __int16 v3;
  __int16 v4;
  __int16 v5;

  v1 = a1[23];
  if ((v1 & 0x80u) == 0)
    v2 = a1;
  else
    v2 = *(unsigned __int8 **)a1;
  if ((v1 & 0x80u) != 0)
    v1 = *((_QWORD *)a1 + 1);
  if (v1)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = *v2++;
      v4 += v5;
      v3 += v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    LOBYTE(v4) = 0;
    v3 = 0;
  }
  return (unsigned __int16)(v4 | (unsigned __int16)(v3 << 8));
}

uint64_t gpsd::util::truncatedSha256(uint64_t a1)
{
  return gpsd::util::truncatedSha256(*(gpsd::util **)a1, (const void *)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1));
}

{
  if (*(char *)(a1 + 23) >= 0)
    return gpsd::util::truncatedSha256((gpsd::util *)a1, (const void *)*(unsigned __int8 *)(a1 + 23));
  else
    return gpsd::util::truncatedSha256(*(gpsd::util **)a1, *(const void **)(a1 + 8));
}

uint64_t gpsd::util::truncatedSha256(gpsd::util *this, const void *a2)
{
  uint64_t result;
  NSObject *v5;
  int v6;
  gpsd::util *v7;
  __int16 v8;
  const void *v9;
  unsigned __int8 md[4];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (CC_SHA256(this, (CC_LONG)a2, md))
    return bswap32(*(unsigned int *)md);
  v5 = GpsdLogObjectGeneral;
  result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    v6 = 134218240;
    v7 = this;
    v8 = 2048;
    v9 = a2;
    _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "#gpsdUtil,CC_SHA256 failed on,%p,%zu", (uint8_t *)&v6, 0x16u);
    return 0;
  }
  return result;
}

BOOL gpsd::util::getVersionNumberFromDylib(gpsd::util *this, _DWORD *a2, int *a3)
{
  uint64_t (*v4)(void);
  uint64_t (*v5)(void);
  NSObject *v6;
  uint8_t v8[16];

  v4 = (uint64_t (*)(void))dlsym(this, "getGnssDeviceVersion");
  v5 = v4;
  if (v4)
  {
    *a2 = v4();
  }
  else
  {
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_2293C9000, v6, OS_LOG_TYPE_ERROR, "gpsdUtil,Could not dlsym for version number", v8, 2u);
    }
  }
  return v5 != 0;
}

BOOL gpsd::util::getVersionStringFromDylib(void *a1, uint64_t a2)
{
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = (uint64_t (*)(void))dlsym(a1, "getVersionString");
  v4 = v3;
  if (v3)
  {
    v5 = v3();
    if (v5)
      v6 = (const char *)v5;
    else
      v6 = "(null)";
    MEMORY[0x22E2C8BA4](a2, v6);
  }
  else
  {
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "gpsdUtil,Could not dlsym for version string", v9, 2u);
    }
  }
  return v4 != 0;
}

BOOL gpsd::util::readFileIntoVector(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD *v27;
  _BYTE v28[12];
  __int16 v29;
  char *v30;
  __int128 buf;
  char *v32;
  _QWORD v33[2];
  _BYTE v34[120];
  uint64_t v35;
  _QWORD v36[21];

  v36[19] = *MEMORY[0x24BDAC8D0];
  std::ifstream::basic_ifstream(v33);
  v4 = v35;
  if (v35)
  {
    v5 = 0;
    v6 = *(_QWORD *)&v34[*(_QWORD *)(v33[0] - 24) + 24];
    v32 = 0;
    buf = 0uLL;
    v27 = 0;
    *(_QWORD *)v28 = v6;
    while ((std::istreambuf_iterator<char>::equal[abi:ne180100]((_QWORD **)v28, &v27) & 1) == 0)
    {
      v7 = *(char **)(*(_QWORD *)v28 + 24);
      if (v7 == *(char **)(*(_QWORD *)v28 + 32))
        v8 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v28 + 72))(*(_QWORD *)v28);
      else
        v8 = *v7;
      if (v5 >= v32)
      {
        v9 = buf;
        v10 = &v5[-buf];
        v11 = (uint64_t)&v5[-buf + 1];
        if (v11 < 0)
          std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
        v12 = (unint64_t)&v32[-buf];
        if (2 * (uint64_t)&v32[-buf] > (unint64_t)v11)
          v11 = 2 * v12;
        if (v12 >= 0x3FFFFFFFFFFFFFFFLL)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
          v14 = (char *)operator new(v13);
        else
          v14 = 0;
        v15 = &v10[(_QWORD)v14];
        v16 = &v10[(_QWORD)v14];
        *v16 = v8;
        v17 = v16 + 1;
        if (v5 != (char *)v9)
        {
          v18 = &v5[~v9];
          do
          {
            v19 = *--v5;
            (v18--)[(_QWORD)v14] = v19;
          }
          while (v5 != (char *)v9);
          v5 = (char *)buf;
          v15 = v14;
        }
        *(_QWORD *)&buf = v15;
        *((_QWORD *)&buf + 1) = v17;
        v32 = &v14[v13];
        if (v5)
          operator delete(v5);
        v5 = v17;
      }
      else
      {
        *v5++ = v8;
      }
      *((_QWORD *)&buf + 1) = v5;
      v20 = *(_QWORD *)(*(_QWORD *)v28 + 24);
      if (v20 == *(_QWORD *)(*(_QWORD *)v28 + 32))
        (*(void (**)(_QWORD))(**(_QWORD **)v28 + 80))(*(_QWORD *)v28);
      else
        *(_QWORD *)(*(_QWORD *)v28 + 24) = v20 + 1;
    }
    v21 = *(void **)a2;
    v22 = buf;
    v23 = v32;
    *(_QWORD *)a2 = buf;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v23;
    v24 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v28 = 136315394;
      *(_QWORD *)&v28[4] = a1;
      v29 = 2048;
      v30 = &v5[-v22];
      _os_log_debug_impl(&dword_2293C9000, v24, OS_LOG_TYPE_DEBUG, "readFileIntoVector,%s,size,%zu", v28, 0x16u);
      if (!v21)
        goto LABEL_33;
      goto LABEL_30;
    }
    if (v21)
LABEL_30:
      operator delete(v21);
  }
  else
  {
    v25 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_2293C9000, v25, OS_LOG_TYPE_DEFAULT, "readFileIntoVector,failed to open %{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_33:
  v33[0] = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)v33 + *(_QWORD *)(v33[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x22E2C8C58](v34);
  std::istream::~istream();
  MEMORY[0x22E2C8DFC](v36);
  return v4 != 0;
}

void sub_2293E8428(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Unwind_Resume(exception_object);
}

uint64_t gpsd::util::writeVectorToClassDFileWithRename(uint64_t a1, uint64_t a2)
{
  const void **v2;
  size_t v4;
  void **v5;
  const void *v6;
  std::error_code *v7;
  const std::__fs::filesystem::path *v8;
  const std::__fs::filesystem::path *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  int v14;
  int *v15;
  char *v16;
  const void **v17;
  void *__p[2];
  char v19;
  uint8_t buf[4];
  const void **v21;
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v2 = (const void **)a2;
  v26 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a2 + 23) >= 0)
    v4 = *(unsigned __int8 *)(a2 + 23);
  else
    v4 = *(_QWORD *)(a2 + 8);
  v5 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v4 + 4);
  if (v19 < 0)
    v5 = (void **)__p[0];
  if (v4)
  {
    if (*((char *)v2 + 23) >= 0)
      v6 = v2;
    else
      v6 = *v2;
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, ".tmp");
  if (!gpsd::util::writeVectorToClassDFile(a1, (uint64_t)__p))
    goto LABEL_20;
  if (v19 >= 0)
    v8 = (const std::__fs::filesystem::path *)__p;
  else
    v8 = (const std::__fs::filesystem::path *)__p[0];
  if (*((char *)v2 + 23) >= 0)
    v9 = (const std::__fs::filesystem::path *)v2;
  else
    v9 = (const std::__fs::filesystem::path *)*v2;
  rename(v8, v9, v7);
  v10 = GpsdLogObjectGeneral;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      if (*((char *)v2 + 23) < 0)
        v2 = (const void **)*v2;
      v14 = *__error();
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 136446722;
      v21 = v2;
      v22 = 1026;
      v23 = v14;
      v24 = 2082;
      v25 = v16;
      _os_log_error_impl(&dword_2293C9000, v10, OS_LOG_TYPE_ERROR, "writeVectorToClassDFileWithRename,renameFailed,%{public}s,err,%{public}d,%{public}s", buf, 0x1Cu);
    }
LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)v2 + 23) >= 0)
      v17 = v2;
    else
      v17 = (const void **)*v2;
    *(_DWORD *)buf = 136446210;
    v21 = v17;
    _os_log_debug_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEBUG, "writeVectorToClassDFileWithRename,success,%{public}s", buf, 0xCu);
  }
  v12 = 1;
LABEL_21:
  if (v19 < 0)
    operator delete(__p[0]);
  return v12;
}

void sub_2293E8668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL gpsd::util::writeVectorToClassDFile(uint64_t a1, uint64_t a2)
{
  const char *v3;
  FILE *v4;
  __sFILE *v5;
  FILE *v6;
  size_t v7;
  _BOOL8 v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a2 + 23) >= 0)
    v3 = (const char *)a2;
  else
    v3 = *(const char **)a2;
  v4 = fopen(v3, "wb+");
  if (!v4)
  {
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      v16 = 67240192;
      v17 = v14;
      v12 = "#utilWriteVector,open failed,%{public}d";
      goto LABEL_15;
    }
    return 0;
  }
  v6 = v4;
  gpsd::util::changeFileToClassD(v4, v5);
  v7 = fwrite(*(const void **)a1, *(_QWORD *)(a1 + 8) - *(_QWORD *)a1, 1uLL, v6);
  v8 = v7 == 1;
  if (v7 != 1)
  {
    v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v15 = *__error();
      v16 = 67240192;
      v17 = v15;
      _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "#utilWriteVector,write failed,%{public}d", (uint8_t *)&v16, 8u);
    }
  }
  if (fclose(v6))
  {
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v11 = *__error();
      v16 = 67240192;
      v17 = v11;
      v12 = "#utilWriteVector,close failed,%{public}d";
LABEL_15:
      _os_log_error_impl(&dword_2293C9000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 8u);
      return 0;
    }
    return 0;
  }
  return v8;
}

void gpsd::util::changeFileToClassD(FILE *this, __sFILE *a2)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    v2 = fileno(this);
    if (v2 == -1)
    {
      v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v10 = *__error();
        *(_DWORD *)buf = 67240192;
        v12 = v10;
        v6 = "#utilFileClass,fileno failed,%{public}d";
        goto LABEL_12;
      }
    }
    else
    {
      v3 = v2;
      if (fcntl(v2, 63) != 4)
      {
        if (fcntl(v3, 64, 4))
        {
          v4 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            v5 = *__error();
            *(_DWORD *)buf = 67240192;
            v12 = v5;
            v6 = "#utilFileClass,set class failed,%{public}d";
LABEL_12:
            v8 = v4;
            v9 = 8;
            goto LABEL_13;
          }
        }
      }
    }
  }
  else
  {
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "#utilFileClass,nullptr";
      v8 = v7;
      v9 = 2;
LABEL_13:
      _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, v6, buf, v9);
    }
  }
}

void gpsd::util::triggerDiagnosticReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::string v5;
  std::string v6;
  std::string __p;
  char v8;

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v5, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v5 = *(std::string *)a1;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v6, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v6 = *(std::string *)a2;
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  v8 = 0;
  gpsd::util::triggerDiagnosticReport((gpsd::util *)&v5, (const gpsd::util::DiagnosticReportParameters *)a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v6.__r_.__value_.__l.__data_);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5.__r_.__value_.__l.__data_);
}

void sub_2293E8A90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void gpsd::util::triggerDiagnosticReport(gpsd::util *this, const gpsd::util::DiagnosticReportParameters *a2)
{
  id v3;
  gpsd::util *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  gpsd::util *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  std::condition_variable *v15;
  std::chrono::steady_clock::time_point v16;
  std::chrono::system_clock::time_point v17;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  std::condition_variable *v22;
  uint8_t v23[16];
  std::unique_lock<std::mutex> __lk;
  _QWORD v25[5];
  uint64_t v26;
  std::condition_variable **v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  std::condition_variable *(*v30)(uint64_t);
  uint64_t v31;
  std::condition_variable *v32;
  std::mutex buf;
  std::condition_variable v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (objc_opt_class())
  {
    v3 = objc_alloc_init(MEMORY[0x24BEB3470]);
    if (*((char *)this + 23) >= 0)
      v4 = this;
    else
      v4 = *(gpsd::util **)this;
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    if (*((char *)this + 47) >= 0)
      v6 = (char *)this + 24;
    else
      v6 = (char *)*((_QWORD *)this + 3);
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
    if (*((char *)this + 71) >= 0)
      v8 = (char *)this + 48;
    else
      v8 = (char *)*((_QWORD *)this + 6);
    v9 = objc_msgSend(v3, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("GPSDaemon"), v5, v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8), CFSTR("com.apple.gpsd"), 0);
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)this + 23) >= 0)
        v11 = this;
      else
        v11 = *(gpsd::util **)this;
      if (*((char *)this + 47) >= 0)
        v12 = (char *)this + 24;
      else
        v12 = (char *)*((_QWORD *)this + 3);
      if (*((char *)this + 71) >= 0)
        v13 = (char *)this + 48;
      else
        v13 = (char *)*((_QWORD *)this + 6);
      LODWORD(buf.__m_.__sig) = 136315650;
      *(uint64_t *)((char *)&buf.__m_.__sig + 4) = (uint64_t)v11;
      *(_WORD *)&buf.__m_.__opaque[4] = 2080;
      *(_QWORD *)&buf.__m_.__opaque[6] = v12;
      *(_WORD *)&buf.__m_.__opaque[14] = 2080;
      *(_QWORD *)&buf.__m_.__opaque[16] = v13;
      _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEFAULT, "#gsdr,type,%s,subtype,%s,context,%s", (uint8_t *)&buf, 0x20u);
    }
    memset(v34.__cv_.__opaque, 0, sizeof(v34.__cv_.__opaque));
    v34.__cv_.__sig = 1018212795;
    v26 = 0;
    v27 = (std::condition_variable **)&v26;
    v28 = 0x3812000000;
    v29 = __Block_byref_object_copy__1;
    v30 = __Block_byref_object_dispose__1;
    v31 = 0;
    v32 = 0;
    if (*((_BYTE *)this + 72))
    {
      v14 = operator new();
      *(_QWORD *)v14 = 1018212795;
      *(_OWORD *)(v14 + 8) = 0u;
      *(_OWORD *)(v14 + 24) = 0u;
      *(_QWORD *)(v14 + 40) = 0;
      std::unique_ptr<std::condition_variable>::reset[abi:ne180100](v27 + 6, (std::condition_variable *)v14);
    }
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = ___ZN4gpsd4util23triggerDiagnosticReportERKNS0_26DiagnosticReportParametersE_block_invoke;
    v25[3] = &unk_24F20BD28;
    v25[4] = &v26;
    if ((objc_msgSend(v3, "snapshotWithSignature:duration:events:payload:actions:reply:", v9, 0, 0, 0, v25, 0.0) & 1) != 0)
    {
      if (*((_BYTE *)this + 72))
      {
        memset(buf.__m_.__opaque, 0, sizeof(buf.__m_.__opaque));
        buf.__m_.__sig = 850045863;
        __lk.__m_ = &buf;
        __lk.__owns_ = 1;
        std::mutex::lock(&buf);
        v15 = v27[6];
        v16.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
        v17.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (v17.__d_.__rep_)
        {
          if (v17.__d_.__rep_ < 1)
          {
            if ((unint64_t)v17.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
              v18.__d_.__rep_ = 1000 * v17.__d_.__rep_ + 5000000000;
            else
              v18.__d_.__rep_ = 0x800000012A05F200;
          }
          else if ((unint64_t)v17.__d_.__rep_ < 0x20C49BA59708B8)
          {
            v18.__d_.__rep_ = 1000 * v17.__d_.__rep_ + 5000000000;
          }
          else
          {
            v18.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        else
        {
          v18.__d_.__rep_ = 5000000000;
        }
        std::condition_variable::__do_timed_wait(v15, &__lk, v18);
        if (std::chrono::steady_clock::now().__d_.__rep_ - v16.__d_.__rep_ > 0x12A05F1FFLL)
        {
          v20 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v23 = 0;
            _os_log_error_impl(&dword_2293C9000, v20, OS_LOG_TYPE_ERROR, "#gsdr,wait timeout", v23, 2u);
          }
        }
        if (__lk.__owns_)
          std::mutex::unlock(__lk.__m_);
        std::mutex::~mutex(&buf);
      }
    }
    else
    {
      v19 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.__m_.__sig) = 0;
        _os_log_error_impl(&dword_2293C9000, v19, OS_LOG_TYPE_ERROR, "#gsdr,return failure", (uint8_t *)&buf, 2u);
      }
    }
    v21 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.__m_.__sig) = 0;
      _os_log_impl(&dword_2293C9000, v21, OS_LOG_TYPE_DEFAULT, "#gsdr,exit", (uint8_t *)&buf, 2u);
    }

    _Block_object_dispose(&v26, 8);
    v22 = v32;
    v32 = 0;
    if (v22)
    {
      std::condition_variable::~condition_variable(v22);
      MEMORY[0x22E2C8E68]();
    }
    std::condition_variable::~condition_variable(&v34);
  }
}

void sub_2293E8F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::mutex *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;

  std::mutex::~mutex((std::mutex *)&a25);
  _Block_object_dispose(&a18, 8);
  std::unique_ptr<std::condition_variable>::reset[abi:ne180100]((std::condition_variable **)(v25 + 48), 0);
  std::condition_variable::~condition_variable((std::condition_variable *)(v26 - 136));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(result + 48) = v2;
  return result;
}

std::condition_variable *__Block_byref_object_dispose__1(uint64_t a1)
{
  return std::unique_ptr<std::condition_variable>::reset[abi:ne180100]((std::condition_variable **)(a1 + 48), 0);
}

void ___ZN4gpsd4util23triggerDiagnosticReportERKNS0_26DiagnosticReportParametersE_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  void *v9;
  uint64_t v10;
  std::condition_variable *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BEB3550]), "BOOLValue"))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BEB3540]);
    v5 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v12 = 136315138;
    v13 = objc_msgSend(v4, "UTF8String");
    v6 = "#gsdr,accepted,%s";
    v7 = v5;
    v8 = 12;
  }
  else
  {
    v9 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BEB3520]);
    v10 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v12 = 67109120;
    LODWORD(v13) = objc_msgSend(v9, "intValue");
    v6 = "#gsdr,rejected,reason,%d";
    v7 = v10;
    v8 = 8;
  }
  _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, v8);
LABEL_7:
  v11 = *(std::condition_variable **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (v11)
    std::condition_variable::notify_one(v11);
}

char *gpsd::util::getGpsWeekFromBuildDate(gpsd::util *this)
{
  char *result;
  time_t v2;
  double v3;
  tm v4;

  result = (char *)gpsd::util::getGpsWeekFromBuildDate(void)::buildWeek;
  if (gpsd::util::getGpsWeekFromBuildDate(void)::buildWeek <= 0)
  {
    memset(&v4, 0, sizeof(v4));
    result = strptime("Aug  3 2024 08:01:50", "%b %d %Y %H:%M:%S", &v4);
    if (result)
    {
      v2 = mktime(&v4);
      if (v2 < 0)
      {
        return 0;
      }
      else
      {
        v3 = ((double)v2 + -315964800.0 + -259200.0) / 604800.0;
        result = (char *)(int)v3;
        gpsd::util::getGpsWeekFromBuildDate(void)::buildWeek = (int)v3;
      }
    }
  }
  return result;
}

void gpsd::util::charToHex(gpsd::util *this@<X0>, const unsigned __int8 *a2@<X1>, int __c@<W2>, std::string *a4@<X8>)
{
  const unsigned __int8 *v8;

  if (a2)
  {
    v8 = 0;
    a4->__r_.__value_.__r.__words[0] = 0;
    a4->__r_.__value_.__l.__size_ = 0;
    a4->__r_.__value_.__r.__words[2] = 0;
    do
    {
      if (__c)
      {
        if (v8)
          std::string::push_back(a4, __c);
      }
      std::string::push_back(a4, __const__ZN4gpsd4util9charToHexEPKhmc_charmap[(unint64_t)v8[(_QWORD)this] >> 4]);
      std::string::push_back(a4, __const__ZN4gpsd4util9charToHexEPKhmc_charmap[(v8++)[(_QWORD)this] & 0xF]);
    }
    while (a2 != v8);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a4, "EmptyBuffer");
  }
}

void sub_2293E92A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void gpsd::util::charToHex(gpsd::util *this@<X0>, const unsigned __int8 *a2@<X1>, int a3@<W2>, std::string *a4@<X8>)
{
  if (((unint64_t)a2 & 0x8000000000000000) != 0)
    std::string::__throw_length_error[abi:ne180100]();
  gpsd::util::charToHex(this, a2, a3, a4);
}

void gpsd::util::logBinaryBytes(gpsd::util *this, const unsigned __int8 *a2, uint64_t a3, const char *a4)
{
  unint64_t v7;
  const unsigned __int8 *v8;
  NSObject *v9;
  uint64_t v10;
  std::string *p_p;
  std::string __p;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const unsigned __int8 *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  std::string *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v7 = 0;
    v8 = a2;
    do
    {
      v9 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)v8 >= 0x40)
          v10 = 64;
        else
          v10 = (uint64_t)v8;
        gpsd::util::charToHex((gpsd::util *)((char *)this + v7), (const unsigned __int8 *)v10, 0, &__p);
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136315906;
        v14 = a3;
        v15 = 2048;
        v16 = a2;
        v17 = 2048;
        v18 = v7;
        v19 = 2080;
        v20 = p_p;
        _os_log_debug_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEBUG, "%s,%zu,%zu,%s", buf, 0x2Au);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      v7 += 64;
      v8 -= 64;
    }
    while (v7 < (unint64_t)a2);
  }
}

void gpsd::util::dispatchQueueInit(dispatch_queue_t *a1, dispatch_qos_class_t a2, const std::string::value_type *a3)
{
  std::string *v6;
  std::string *v7;
  __int128 v8;
  NSObject *v9;
  NSObject *v10;
  void **v11;
  void **v12;
  dispatch_queue_t v13;
  NSObject *v14;
  void **v15;
  void *v16[2];
  char v17;
  void *v18[2];
  char v19;
  void *v20[2];
  char v21;
  void *__p[2];
  int64_t v23;
  _BYTE buf[12];
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (std::string *)std::string::basic_string[abi:ne180100]<0>(buf, "com.apple.gpsd.");
  v7 = std::string::append(v6, a3);
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v23 = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  if (SBYTE3(v28) < 0)
    operator delete(*(void **)buf);
  v9 = dispatch_queue_attr_make_with_qos_class(0, a2, 0);
  if (!v9)
  {
    v10 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v11 = __p;
      if (v23 < 0)
        v11 = (void **)__p[0];
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEFAULT, "dispatchQueueInit,nullattr,%{public}s", buf, 0xCu);
    }
  }
  if (v23 >= 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  v13 = dispatch_queue_create((const char *)v12, v9);
  *a1 = v13;
  if (!v13)
  {
    v14 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v15 = __p;
      if (v23 < 0)
        v15 = (void **)__p[0];
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_2293C9000, v14, OS_LOG_TYPE_ERROR, "dispatchQueueInit,queue,null,%{public}s", buf, 0xCu);
      v14 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
      v25 = 1026;
      v26 = 635;
      v27 = 2082;
      v28 = "dispatchQueueInit";
      _os_log_error_impl(&dword_2293C9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v20, "assert");
    std::string::basic_string[abi:ne180100]<0>(v18, "dispatchQueueInit");
    std::string::basic_string[abi:ne180100]<0>(v16, "dispatchQueueInit,queue,null,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)v20, (uint64_t)v18, (uint64_t)v16);
    if (v17 < 0)
      operator delete(v16[0]);
    if (v19 < 0)
      operator delete(v18[0]);
    if (v21 < 0)
      operator delete(v20[0]);
    __assert_rtn("dispatchQueueInit", "GpsdUtil.mm", 635, "false && \"dispatchQueueInit,queue,null,%{public}s\"");
  }
  if (SHIBYTE(v23) < 0)
    operator delete(__p[0]);
}

void sub_2293E96F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 57) < 0)
    operator delete(*(void **)(v33 - 80));
  _Unwind_Resume(exception_object);
}

std::condition_variable *std::unique_ptr<std::condition_variable>::reset[abi:ne180100](std::condition_variable **a1, std::condition_variable *a2)
{
  std::condition_variable *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    std::condition_variable::~condition_variable(result);
    JUMPOUT(0x22E2C8E68);
  }
  return result;
}

uint64_t GpsdHardwareConfig::GpsdHardwareConfig(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 0;
  if (a2 > 21101)
  {
    if (a2 > 21704)
    {
      if (a2 <= 31101)
      {
        switch(a2)
        {
          case 30804:
          case 30808:
            goto LABEL_45;
          case 30805:
          case 30806:
          case 30807:
          case 30809:
          case 30811:
            return a1;
          case 30810:
          case 30812:
            goto LABEL_32;
          default:
            if (a2 == 21705)
              goto LABEL_51;
            if (a2 == 30712)
              goto LABEL_45;
            return a1;
        }
      }
      if (a2 <= 31201)
      {
        if ((a2 - 31102) > 5 || ((1 << (a2 - 126)) & 0x25) == 0)
          return a1;
      }
      else
      {
        if (a2 > 31701)
        {
          if (a2 == 31702)
            goto LABEL_51;
          v5 = 31704;
LABEL_50:
          if (a2 != v5)
            return a1;
          goto LABEL_51;
        }
        if (a2 != 31202)
        {
          if (a2 != 31302)
            return a1;
          goto LABEL_32;
        }
      }
    }
    else
    {
      if (a2 > 21501)
      {
        if ((a2 - 21502) >= 2)
        {
          if ((a2 - 21601) >= 2 && (a2 - 21701) >= 2)
            return a1;
          *(_BYTE *)(a1 + 16) = 1;
          *(_QWORD *)(a1 + 8) = 0x401799999999999ALL;
          *(_BYTE *)(a1 + 32) = 1;
          *(_QWORD *)(a1 + 24) = 0x4039000000000000;
          goto LABEL_42;
        }
        *(_BYTE *)(a1 + 16) = 1;
        v7 = 0x401799999999999ALL;
        goto LABEL_41;
      }
      if ((a2 - 21201) <= 9 && ((1 << (a2 + 47)) & 0x215) != 0)
      {
LABEL_32:
        v4 = 202;
        goto LABEL_46;
      }
      if ((a2 - 21102) > 6 || ((1 << (a2 - 110)) & 0x51) == 0)
      {
        v5 = 21409;
        goto LABEL_50;
      }
    }
LABEL_45:
    v4 = 201;
    goto LABEL_46;
  }
  if (a2 > 10700)
  {
    if ((a2 - 10701) > 0x12)
      return a1;
    v6 = 1 << (a2 + 51);
    if ((v6 & 0x552E5) != 0)
      goto LABEL_42;
    if ((v6 & 0x810) == 0)
      return a1;
LABEL_21:
    *(_BYTE *)(a1 + 16) = 1;
    v7 = 0x3FF3333333333333;
LABEL_41:
    *(_QWORD *)(a1 + 8) = v7;
LABEL_42:
    v4 = 107;
    goto LABEL_46;
  }
  if (a2 > 10600)
  {
    switch(a2)
    {
      case 10601:
      case 10603:
        goto LABEL_25;
      case 10606:
      case 10608:
        v4 = 106;
        goto LABEL_46;
      case 10610:
      case 10612:
      case 10614:
      case 10616:
        goto LABEL_42;
      case 10618:
        goto LABEL_21;
      default:
        return a1;
    }
    return a1;
  }
  if (a2 > 10500)
  {
    if ((a2 - 10501) > 0xA || ((1 << (a2 - 5)) & 0x505) == 0)
      return a1;
LABEL_25:
    v4 = 103;
LABEL_46:
    *(_DWORD *)a1 = v4;
    return a1;
  }
  if (a2)
  {
    if (a2 != 10401 && a2 != 10403)
      return a1;
    goto LABEL_25;
  }
LABEL_51:
  v9 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67240192;
    v10[1] = a2;
    _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "GpsdPlatformInfo,device,%{public}d,unknown/unsupported", (uint8_t *)v10, 8u);
  }
  return a1;
}

uint64_t GpsdHardwareConfig::getEarliestBornYear(GpsdHardwareConfig *this)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_DWORD *)this;
  v2 = 0x100000000;
  v3 = 2017;
  v4 = 2021;
  v5 = 2018;
  if (*(_DWORD *)this != 202)
    v5 = 2017;
  if (v1 != 107)
    v4 = v5;
  if (v1 == 106)
  {
    v2 = 0x100000000;
    v3 = 2020;
  }
  if (!v1)
  {
    v2 = 0;
    v3 = 1792;
  }
  v6 = v1 <= 106;
  if (v1 <= 106)
    v7 = v2;
  else
    v7 = 0x100000000;
  if (v6)
    v8 = v3;
  else
    v8 = v4;
  return v8 | v7;
}

uint64_t GpsdPlatformInfo::isGpsdSupported(GpsdPlatformInfo *this)
{
  unsigned int v1;
  unsigned int v2;
  BOOL v3;
  unsigned int v4;

  v1 = *((_DWORD *)this + 2);
  v2 = v1 - 201;
  v1 -= 103;
  v3 = v1 > 4;
  v4 = (0x19u >> v1) & 1;
  if (v3)
    v4 = 0;
  if (v2 >= 2)
    return v4;
  else
    return 1;
}

BOOL GpsdPlatformInfo::isKaroo(GpsdPlatformInfo *this)
{
  return (*((_DWORD *)this + 2) - 201) < 2;
}

uint64_t GpsdPlatformInfo::isFire(GpsdPlatformInfo *this)
{
  return ((*((_DWORD *)this + 2) - 103) < 5) & (0x19u >> (*((_BYTE *)this + 8) - 103));
}

uint64_t GpsdPlatformInfo::isWatch(GpsdPlatformInfo *this)
{
  return 0;
}

uint64_t GpsdPlatformInfo::isPhone(GpsdPlatformInfo *this)
{
  if (qword_255A4BE20 != -1)
    dispatch_once(&qword_255A4BE20, &__block_literal_global_1);
  return _MergedGlobals_1;
}

void ___ZN16GpsdPlatformInfo7isPhoneEv_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    if (CFEqual(v0, CFSTR("iPhone")))
      _MergedGlobals_1 = 1;
    CFRelease(v1);
  }
}

void GpsdPlatformInfo::vendorDylibFullPathName(GpsdPlatformInfo *this@<X0>, _QWORD *a2@<X8>)
{
  int v3;
  char *v4;
  NSObject *v6;
  uint8_t v7[16];

  v3 = *((_DWORD *)this + 2);
  if ((v3 - 201) <= 1)
  {
    v4 = "/usr/lib/libolaf.dylib";
LABEL_9:
    std::string::basic_string[abi:ne180100]<0>(a2, v4);
    return;
  }
  if (v3 == 107)
  {
    v4 = "/usr/lib/libfire7.dylib";
    goto LABEL_9;
  }
  if (GpsdPlatformInfo::isLibgll6(this))
  {
    v4 = "/usr/lib/libfire6.dylib";
    goto LABEL_9;
  }
  if (GpsdPlatformInfo::isLibgll3(this))
  {
    v4 = "/usr/lib/libfire3.dylib";
    goto LABEL_9;
  }
  v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl(&dword_2293C9000, v6, OS_LOG_TYPE_FAULT, "PlatformInfo,unknown vendorDylibFullPathName", v7, 2u);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
}

BOOL GpsdPlatformInfo::isLibolaf(GpsdPlatformInfo *this)
{
  return (*((_DWORD *)this + 2) - 201) < 2;
}

BOOL GpsdPlatformInfo::isLibgll7(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

BOOL GpsdPlatformInfo::isLibgll6(GpsdPlatformInfo *this)
{
  _BOOL8 result;
  id *v3;
  int isRavenExpected;

  if (*((_DWORD *)this + 2) == 106)
    return 1;
  v3 = (id *)GpsdPreferences::instance(0);
  isRavenExpected = GpsdPreferences::isRavenExpected(v3);
  result = 0;
  if (isRavenExpected)
    return *((_DWORD *)this + 2) == 103;
  return result;
}

uint64_t GpsdPlatformInfo::isLibgll3(GpsdPlatformInfo *this)
{
  id *v1;

  if (*((_DWORD *)this + 2) != 103)
    return 0;
  v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::isRavenExpected(v1) ^ 1;
}

uint64_t GpsdPlatformInfo::isLibindus(GpsdPlatformInfo *this)
{
  return 0;
}

_QWORD *GpsdPlatformInfo::serialPortPath@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "/dev/cu.gps");
}

uint64_t GpsdPlatformInfo::expectedToHaveRaven(GpsdPlatformInfo *this)
{
  int v1;
  unsigned int v3;
  BOOL v4;
  int v5;

  v1 = *((_DWORD *)this + 2);
  if ((v1 - 201) <= 1)
  {
    if (qword_255A4BE20 != -1)
      dispatch_once(&qword_255A4BE20, &__block_literal_global_1);
    if ((_MergedGlobals_1 & 1) != 0)
      return 1;
    v1 = *((_DWORD *)this + 2);
  }
  v3 = v1 - 103;
  v4 = v3 > 4;
  v5 = (1 << v3) & 0x19;
  if (!v4 && v5 != 0)
  {
    if (qword_255A4BE20 != -1)
      dispatch_once(&qword_255A4BE20, &__block_literal_global_1);
    if ((_MergedGlobals_1 & 1) != 0)
      return 1;
  }
  return 0;
}

uint64_t GpsdPlatformInfo::supportsL5(GpsdPlatformInfo *this)
{
  return *((unsigned __int8 *)this + 24);
}

BOOL GpsdPlatformInfo::supportsBeidou(GpsdPlatformInfo *this)
{
  int v1;

  v1 = *((_DWORD *)this + 2);
  return v1 != 103 && v1 != 201;
}

BOOL GpsdPlatformInfo::supportsNavic(GpsdPlatformInfo *this)
{
  if (qword_255A4BE20 != -1)
    dispatch_once(&qword_255A4BE20, &__block_literal_global_1);
  return _MergedGlobals_1 == 1 && *((_DWORD *)this + 2) == 107;
}

double GpsdPlatformInfo::groupDelayL1InCAChips(GpsdPlatformInfo *this)
{
  int v1;
  double result;

  v1 = *((_DWORD *)this + 2);
  result = 0.036;
  if (v1 != 202)
    result = 0.0;
  if (v1 == 201)
    return -7.149;
  return result;
}

double GpsdPlatformInfo::externalToChipL5GroupDelayMeters(GpsdPlatformInfo *this)
{
  if (*((_BYTE *)this + 24))
    return *((double *)this + 2);
  else
    return 0.0;
}

void GpsdPlatformInfo::glonassPerFrequencyGroupDelayMeters(GpsdPlatformInfo *this@<X0>, float64x2_t **a2@<X8>)
{
  double v3;
  float64x2_t *v4;
  double v5;
  float64x2_t v6;
  NSObject *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*((_DWORD *)this + 2) == 107)
  {
    if (*((_BYTE *)this + 40))
      v3 = *((double *)this + 4);
    else
      v3 = 15.0;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    v4 = (float64x2_t *)operator new(0x70uLL);
    v5 = v3 + -520.569214 + 0.1;
    v6 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v3 + -520.569214), 0);
    a2[2] = v4 + 7;
    *v4 = vaddq_f64(v6, (float64x2_t)xmmword_2293F7C20);
    v4[1] = vaddq_f64(v6, (float64x2_t)xmmword_2293F7C30);
    v4[2] = vaddq_f64(v6, (float64x2_t)xmmword_2293F7C40);
    v4[3] = vaddq_f64(v6, (float64x2_t)xmmword_2293F7C50);
    v4[4] = vaddq_f64(v6, (float64x2_t)xmmword_2293F7C60);
    v4[5].f64[0] = v3 + -520.569214;
    v4[5].f64[1] = v5;
    v4[6].f64[0] = v5;
    v4[6].f64[1] = v5;
    *a2 = v4;
    a2[1] = v4 + 7;
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134349056;
      v9 = v3;
      _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEFAULT, "glonassExternalCalMeters,%{public}.2f", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
}

double GpsdPlatformInfo::getGpsCrossCorrelationMaxThreshold_dBHz(GpsdPlatformInfo *this)
{
  return 36.0;
}

double GpsdPlatformInfo::getGpsCrossCorrelationMinThreshold_dBHz(GpsdPlatformInfo *this)
{
  double v2;
  NSObject *v3;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (qword_255A4BE20 != -1)
    dispatch_once(&qword_255A4BE20, &__block_literal_global_1);
  v2 = 24.0;
  if ((_MergedGlobals_1 & 1) == 0)
  {
    v3 = GpsdLogObjectGeneral;
    v2 = -1.0;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_DWORD *)this;
      v6[0] = 67240192;
      v6[1] = v5;
      _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "HalExtensions,Unexpected hardware,%{public}d", (uint8_t *)v6, 8u);
    }
  }
  return v2;
}

BOOL GpsdPlatformInfo::supportsInternalEmergencyStack(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

BOOL GpsdPlatformInfo::usesPcie(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 202;
}

uint64_t GpsdPlatformInfo::usesPreciseTimeMeasurement(GpsdPlatformInfo *this)
{
  return 0;
}

BOOL GpsdPlatformInfo::usesSpi(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

BOOL GpsdPlatformInfo::usesResetGpio(GpsdPlatformInfo *this)
{
  int v1;
  _BOOL4 v2;

  v1 = *((_DWORD *)this + 2);
  v2 = v1 == 201;
  if (v1 == 106)
    v2 = 1;
  return v1 == 103 || v2;
}

BOOL GpsdPlatformInfo::usesDeviceWakeGpio(GpsdPlatformInfo *this)
{
  int v1;

  v1 = *((_DWORD *)this + 2);
  return v1 == 103 || v1 == 106;
}

BOOL GpsdPlatformInfo::usesTimeMarkGpio(GpsdPlatformInfo *this)
{
  int v1;
  _BOOL4 v2;

  v1 = *((_DWORD *)this + 2);
  v2 = v1 == 201;
  if (v1 == 106)
    v2 = 1;
  return v1 == 103 || v2;
}

BOOL GpsdPlatformInfo::usesAsyncCommRead(GpsdPlatformInfo *this)
{
  int v1;

  v1 = *((_DWORD *)this + 2);
  return v1 == 202 || v1 == 107;
}

BOOL GpsdPlatformInfo::usesTimeMarkPciDoorbell(GpsdPlatformInfo *this)
{
  int v1;

  v1 = *((_DWORD *)this + 2);
  return v1 == 202 || v1 == 107;
}

BOOL GpsdPlatformInfo::usesGpio(GpsdPlatformInfo *this)
{
  int v1;
  _BOOL4 v2;

  v1 = *((_DWORD *)this + 2);
  v2 = v1 == 201;
  if (v1 == 106)
    v2 = 1;
  return v1 == 103 || v2;
}

uint64_t GpsdPlatformInfo::isLibgll(GpsdPlatformInfo *this)
{
  return ((*((_DWORD *)this + 2) - 103) < 5) & (0x19u >> (*((_BYTE *)this + 8) - 103));
}

uint64_t GpsdPlatformInfo::getLibindusPlatformCoExConfigDefault(GpsdPlatformInfo *this)
{
  return 0;
}

BOOL GpsdPlatformInfo::hasXtalFreqJumpRisk(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

double GpsdPlatformInfo::olafCrossCorrelationSettings(GpsdPlatformInfo *this)
{
  return 35.0;
}

double GpsdPlatformInfo::indusCrossCorrelationSettings(GpsdPlatformInfo *this)
{
  return 35.0;
}

uint64_t GpsdPlatformInfo::isInternalInstall(GpsdPlatformInfo *this)
{
  return os_variant_has_internal_diagnostics();
}

uint64_t GpsdPlatformInfo::instance(int a1)
{
  _QWORD block[4];
  int v3;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN16GpsdPlatformInfo8instanceEN24GpsdPlatformInfoHardware8HardwareE_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v3 = a1;
  if (GpsdPlatformInfo::instance(GpsdPlatformInfoHardware::Hardware)::pred != -1)
    dispatch_once(&GpsdPlatformInfo::instance(GpsdPlatformInfoHardware::Hardware)::pred, block);
  return GpsdPlatformInfo::fInstance;
}

void sub_2293EA4E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2C8E68](v1, 0x1000C405B242E63);
  _Unwind_Resume(a1);
}

GpsdPlatformInfo *GpsdPlatformInfo::GpsdPlatformInfo(GpsdPlatformInfo *a1, int a2)
{
  *(_DWORD *)a1 = a2;
  GpsdHardwareConfig::GpsdHardwareConfig((uint64_t)a1 + 8, a2);
  *((_BYTE *)a1 + 48) = 0;
  *((_BYTE *)a1 + 52) = 0;
  *((_BYTE *)a1 + 56) = 0;
  *((_BYTE *)a1 + 60) = 0;
  GpsdPlatformInfo::checkVendorLibs(a1);
  GpsdPlatformInfo::readMlbBornOnYww(a1);
  return a1;
}

void GpsdPlatformInfo::checkVendorLibs(GpsdPlatformInfo *this)
{
  int v2;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *((_DWORD *)this + 2);
  if ((v2 - 103) > 4 || ((1 << (v2 - 103)) & 0x19) == 0)
  {
    v4 = GpsdLogObjectGeneral;
    if ((v2 - 203) <= 0xFFFFFFFD
      && os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_error_impl(&dword_2293C9000, v4, OS_LOG_TYPE_ERROR, "GpsdPlatformInfo,invoked on platform that does not have a supported vendor lib", (uint8_t *)v6, 2u);
      v4 = GpsdLogObjectGeneral;
    }
  }
  else
  {
    v4 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_DWORD *)this;
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "GpsdPlatformInfo,hardware,%d", (uint8_t *)v6, 8u);
  }
}

void GpsdPlatformInfo::readMlbBornOnYww(GpsdPlatformInfo *this)
{
  std::string::size_type size;
  NSObject *v3;
  uint8_t v4[8];
  std::string __p;

  GpsdPlatformInfo::readMlbSerialNumber((uint64_t *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
LABEL_3:
      if (size < 0x12)
        GpsdPlatformInfo::parseWeekFromYwwMlbSerialNumber((uint64_t)this, (std::string::size_type)&__p);
      else
        GpsdPlatformInfo::parseWeekFromDomMlbSerialNumber((uint64_t)this, &__p);
      goto LABEL_9;
    }
  }
  else
  {
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if (*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_3;
  }
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_INFO, "MlbSn,aborted,empty", v4, 2u);
  }
LABEL_9:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_2293EA748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t GpsdPlatformInfo::getNoiseFigure(uint64_t a1, int a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "GpsdPlatformInfo,getNoiseFigure,band,%d", (uint8_t *)v10, 8u);
  }
  v5 = *(_DWORD *)(a1 + 8);
  if ((v5 - 201) >= 2)
  {
    v8 = v5 - 103;
    if ((v5 - 103) > 4)
    {
      v6 = 0;
      v7 = 0;
    }
    else
    {
      v6 = qword_2293F7BC8[v8];
      v7 = qword_2293F7BF0[v8];
    }
  }
  else
  {
    v6 = 0x100000000;
    v7 = 1078355558;
  }
  return v7 | v6;
}

void GpsdPlatformInfo::readMlbSerialNumber(uint64_t *a1@<X8>)
{
  const __CFString *v3;
  const __CFString *v4;
  const char *CStringPtr;
  NSObject *v6;
  uint64_t *v7;
  NSObject *v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v3 = (const __CFString *)MGCopyAnswer();
  v4 = v3;
  if (v3)
  {
    CStringPtr = CFStringGetCStringPtr(v3, 0x8000100u);
    MEMORY[0x22E2C8BA4](a1, CStringPtr);
    CFRelease(v4);
    v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      if (*((char *)a1 + 23) >= 0)
        v7 = a1;
      else
        v7 = (uint64_t *)*a1;
      v9 = 136315138;
      v10 = v7;
      _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_INFO, "MlbSn,%s", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "MlbSn,readSN,failed", (uint8_t *)&v9, 2u);
    }
  }
}

void sub_2293EA9A8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void GpsdPlatformInfo::parseWeekFromDomMlbSerialNumber(uint64_t a1, const std::string *a2)
{
  uint64_t v4;
  int v5;
  const std::string *v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  std::string *v11;
  int v12;
  double v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  std::string __p;
  uint8_t buf[4];
  std::string *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v4 = 0;
  v5 = 0;
  v31 = *MEMORY[0x24BDAC8D0];
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = a2;
  else
    v6 = (const std::string *)a2->__r_.__value_.__r.__words[0];
  v7 = (uint64_t)v6->__r_.__value_.__r.__words + 3;
  do
  {
    v8 = *(char *)(v7 + v4);
    v9 = charToIntBase34(v8);
    if (v9 < 0)
    {
      v14 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        return;
      LODWORD(__p.__r_.__value_.__l.__data_) = 67174657;
      HIDWORD(__p.__r_.__value_.__r.__words[0]) = v8;
      v15 = "MlbSn,dom,unexpectedCh,%{private}c";
      v16 = v14;
      v17 = 8;
LABEL_28:
      _os_log_error_impl(&dword_2293C9000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&__p, v17);
      return;
    }
    v5 = v9 + 34 * v5;
    ++v4;
  }
  while (v4 != 3);
  v10 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    std::string::basic_string(&__p, a2, 3uLL, 3uLL, (std::allocator<char> *)buf);
    v11 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136380931;
    v28 = v11;
    v29 = 1025;
    v30 = v5;
    _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEFAULT, "MlbSn,dom,%{private}s,%{private}d", buf, 0x12u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v12 = *(_DWORD *)(a1 + 8);
  v13 = 13514.25;
  if (v12 <= 106)
  {
    if (v12)
    {
      if (v12 == 106)
        v13 = 14610.0;
      goto LABEL_25;
    }
    v18 = GpsdLogObjectWarning;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    v19 = "MlbSn,dom,EarliestBornYear,unknown";
    v20 = v18;
    v21 = 2;
LABEL_31:
    _os_log_impl(&dword_2293C9000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&__p, v21);
    return;
  }
  if (v12 == 107)
  {
    v13 = 14975.25;
  }
  else if (v12 == 202)
  {
    v13 = 13879.5;
  }
LABEL_25:
  v22 = (int)(v13 / 7.0);
  v23 = (v5 - 3657) / 7;
  if (v23 < v22)
  {
    v24 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    LODWORD(__p.__r_.__value_.__l.__data_) = 67174913;
    HIDWORD(__p.__r_.__value_.__r.__words[0]) = (v5 - 3657) / 7;
    LOWORD(__p.__r_.__value_.__r.__words[1]) = 1026;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 2) = v22;
    v15 = "MlbSn,dom,weekOutOfRange,mlb,%{private}d,earliest,%{public}d";
    v16 = v24;
    v17 = 14;
    goto LABEL_28;
  }
  *(_DWORD *)(a1 + 56) = v23;
  *(_BYTE *)(a1 + 60) = 1;
  v25 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(__p.__r_.__value_.__r.__words[0]) = (v5 - 3657) / 7;
    v19 = "MlbSn,dom,bornOnGpsWeek,%{private}d";
    v20 = v25;
    v21 = 8;
    goto LABEL_31;
  }
}

void GpsdPlatformInfo::parseWeekFromYwwMlbSerialNumber(uint64_t a1, std::string::size_type a2)
{
  std::string::size_type v4;
  NSObject *v5;
  std::string::size_type v6;
  std::string::size_type v8;
  int *v9;
  void *v10;
  NSObject *v11;
  _BOOL8 v12;
  int v13;
  int v14;
  uint64_t v15;
  const char *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  char v28;
  std::string v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a2 + 23) < 0)
  {
    v4 = *(_QWORD *)(a2 + 8);
    v5 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    v6 = *(_QWORD *)a2;
  }
  else
  {
    v4 = *(unsigned __int8 *)(a2 + 23);
    v5 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    v6 = a2;
  }
  LODWORD(v29.__r_.__value_.__l.__data_) = 136380931;
  *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = v6;
  WORD2(v29.__r_.__value_.__r.__words[1]) = 2049;
  *(std::string::size_type *)((char *)&v29.__r_.__value_.__r.__words[1] + 6) = v4;
  _os_log_debug_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEBUG, "MlbSn,parse,%{private}s,sz,%{private}zu", (uint8_t *)&v29, 0x16u);
LABEL_5:
  if (v4 == 11 || v4 == 13)
  {
    v8 = 2;
  }
  else
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0x10)
    {
      v25 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        return;
      LODWORD(v29.__r_.__value_.__l.__data_) = 134283521;
      *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = v4;
      v16 = "MlbSn,unexpectedSize,%{private}zu";
      v23 = v25;
      v24 = 12;
      goto LABEL_47;
    }
    v8 = 3;
  }
  std::string::basic_string(&v29, (const std::string *)a2, v8, 3uLL, (std::allocator<char> *)&v28);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    v10 = (void *)v29.__r_.__value_.__r.__words[0];
    *(_DWORD *)(a1 + 48) = atoi(v29.__r_.__value_.__l.__data_);
    v9 = (int *)(a1 + 48);
    *(_BYTE *)(a1 + 52) = 1;
    operator delete(v10);
  }
  else
  {
    *(_DWORD *)(a1 + 48) = atoi((const char *)&v29);
    v9 = (int *)(a1 + 48);
    *(_BYTE *)(a1 + 52) = 1;
  }
  v11 = GpsdLogObjectGeneral;
  v12 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!*(_BYTE *)(a1 + 52))
      std::__throw_bad_optional_access[abi:ne180100]();
    v13 = *v9;
    LODWORD(v29.__r_.__value_.__l.__data_) = 134283777;
    *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = v4;
    WORD2(v29.__r_.__value_.__r.__words[1]) = 1025;
    *(_DWORD *)((char *)&v29.__r_.__value_.__r.__words[1] + 6) = v13;
    _os_log_impl(&dword_2293C9000, v11, OS_LOG_TYPE_DEFAULT, "MlbSn,sz,%{private}zu,yww,%{private}d", (uint8_t *)&v29, 0x12u);
  }
  if (!*(_BYTE *)(a1 + 52))
    std::__throw_bad_optional_access[abi:ne180100]();
  v14 = *v9 % 100;
  if ((v14 - 54) <= 0xFFFFFFCA)
  {
    v15 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    LODWORD(v29.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(v29.__r_.__value_.__r.__words[0]) = v14;
    v16 = "MlbSn,invalid,ww,%{private}d";
LABEL_40:
    v23 = v15;
    v24 = 8;
LABEL_47:
    _os_log_error_impl(&dword_2293C9000, v23, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v29, v24);
    return;
  }
  v17 = *(_DWORD *)(a1 + 8);
  if (v17 > 106)
  {
    if (v17 == 202)
      v19 = 2018;
    else
      v19 = 2017;
    if (v17 == 107)
      v18 = 2021;
    else
      v18 = v19;
  }
  else
  {
    if (!v17)
    {
      v27 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        return;
      LOWORD(v29.__r_.__value_.__l.__data_) = 0;
      v16 = "MlbSn,EarliestBornYear,unknown";
      v23 = v27;
      v24 = 2;
      goto LABEL_47;
    }
    if (v17 == 106)
      v18 = 2020;
    else
      v18 = 2017;
  }
  v20 = v18 - (unsigned __int16)(v18 - 10 * ((6554 * v18) >> 16)) + *v9 / 100;
  if (v20 >= v18)
    v21 = v18 - (unsigned __int16)(v18 - 10 * ((6554 * v18) >> 16)) + *v9 / 100;
  else
    v21 = v20 + 10;
  v22 = v14 + (int)((double)(v21 - 1980) * 365.25 / 7.0);
  if (v22 > (int)gpsd::util::getGpsWeekFromBuildDate((gpsd::util *)v12))
  {
    v15 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    LODWORD(v29.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(v29.__r_.__value_.__r.__words[0]) = v22;
    v16 = "MlbSn,weekOutOfRange,mlb,%{private}d";
    goto LABEL_40;
  }
  *(_DWORD *)(a1 + 56) = v22;
  *(_BYTE *)(a1 + 60) = 1;
  v26 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v29.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(v29.__r_.__value_.__r.__words[0]) = v22;
    _os_log_impl(&dword_2293C9000, v26, OS_LOG_TYPE_DEFAULT, "MlbSn,bornOnGpsWeek,%{private}d", (uint8_t *)&v29, 8u);
  }
}

uint64_t charToIntBase34(int a1)
{
  char v1;
  int v2;
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;

  if ((a1 - 97) >= 0x1A)
    v1 = a1;
  else
    v1 = a1 - 32;
  v2 = v1;
  v3 = (v1 - 48);
  if ((v2 - 80) >= 0xB)
    v4 = -1;
  else
    v4 = v2 - 57;
  if ((v2 - 74) <= 4)
    v5 = v2 - 56;
  else
    v5 = v4;
  if ((v2 - 65) <= 7u)
    v6 = v2 - 55;
  else
    v6 = v5;
  v7 = v2 - 48;
  if (v3 <= 9)
    return v7;
  else
    return v6;
}

void *vectorToNSArray(double **a1)
{
  void *v2;
  double *v3;
  double *v4;
  double v5;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a1[1] - *a1);
  v4 = *a1;
  v3 = a1[1];
  while (v4 != v3)
  {
    v5 = *v4++;
    objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5));
  }
  return v2;
}

uint64_t GpsdPreferences::GpsdPreferences(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  GpsdPlatformInfo *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  GpsdPlatformInfo *v21;
  uint64_t v22;
  void *v23;
  int v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  GpsdPlatformInfo *v29;
  GpsdPlatformInfo *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[7];
  _QWORD v46[7];
  _QWORD v47[9];
  _QWORD v48[9];
  _BYTE __p[22];
  _QWORD v50[70];
  _QWORD v51[73];

  v51[70] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = a2;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  *(_QWORD *)a1 = v3;
  objc_msgSend(v3, "addSuiteNamed:", CFSTR("gpsd"));
  v4 = MEMORY[0x24BDBD1C0];
  v51[0] = MEMORY[0x24BDBD1C0];
  v50[0] = CFSTR("ForceDisableGpsd");
  v50[1] = CFSTR("BigPowerSwitch");
  v5 = GpsdPlatformInfo::instance(0);
  v6 = MEMORY[0x24BDBD1C8];
  if (*(_DWORD *)(v5 + 8) == 201)
    v7 = MEMORY[0x24BDBD1C8];
  else
    v7 = v4;
  v51[1] = v7;
  v50[2] = CFSTR("BaudRate4M8");
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 201)
    v8 = v6;
  else
    v8 = v4;
  v51[2] = v8;
  v50[3] = CFSTR("UsesAsyncCommRead");
  v9 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v9 == 107 || v9 == 202)
    v11 = v6;
  else
    v11 = v4;
  v51[3] = v11;
  v51[4] = &stru_24F20C7C0;
  v50[4] = CFSTR("ForceGnssDeviceLibraryName");
  v50[5] = CFSTR("EnableMeasurementApi");
  v51[5] = v6;
  v51[6] = v6;
  v50[6] = CFSTR("EnableXocalRequests");
  v50[7] = CFSTR("ForceEnableXocalLearning");
  v51[7] = v4;
  v51[8] = &unk_24F20D5F8;
  v50[8] = CFSTR("MaxSchedulerQos");
  v50[9] = CFSTR("EnableBasebandReset");
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 202)
    v12 = v6;
  else
    v12 = v4;
  v51[9] = v12;
  v50[10] = CFSTR("LogLevel");
  v51[10] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v50[11] = CFSTR("SecondaryLogLevel");
  v51[11] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v51[12] = &unk_24F20D610;
  v50[12] = CFSTR("LogMask");
  v50[13] = CFSTR("PvtmTimeOut");
  v51[13] = &unk_24F20D628;
  v51[14] = CFSTR("0x0");
  v50[14] = CFSTR("NmeaMaskOverride");
  v50[15] = CFSTR("VendorLogQA");
  v51[15] = v4;
  v51[16] = v4;
  v50[16] = CFSTR("VendorLogRestrictedCarry");
  v50[17] = CFSTR("VendorLogAllToOsLog");
  v51[17] = v4;
  v51[18] = v4;
  v50[18] = CFSTR("VendorLogForceCustomer");
  v50[19] = CFSTR("VendorLogLz4");
  v51[19] = v6;
  v51[20] = v4;
  v50[20] = CFSTR("VendorLogLzfse");
  v50[21] = CFSTR("VendorLogZlib");
  v51[21] = v4;
  v51[22] = CFSTR("/var/mobile/Library/Logs/gpsd");
  v50[22] = CFSTR("VendorLogDirectory");
  v50[23] = CFSTR("VendorLogPrefixWithTimestamp");
  v51[23] = v4;
  v51[24] = &unk_24F20D640;
  v50[24] = CFSTR("VendorLogMaxDirectorySizeMB");
  v50[25] = CFSTR("VendorLogRotationSizeMB");
  v51[25] = &unk_24F20D658;
  v51[26] = &unk_24F20D670;
  v50[26] = CFSTR("VendorLogMaxNumberOfFiles");
  v50[27] = CFSTR("VendorLogRetentionDays");
  v51[27] = &unk_24F20D6D0;
  v51[28] = v4;
  v50[28] = CFSTR("EnableProtobufBinaryLog");
  v50[29] = CFSTR("ProtobufLogDirectory");
  v51[29] = CFSTR("/var/mobile/Library/Logs/gpsd");
  v51[30] = &unk_24F20D6E0;
  v50[30] = CFSTR("ProtobufLogRetentionDays");
  v50[31] = CFSTR("EnableProtobufTextLog");
  v51[31] = v4;
  v51[32] = v4;
  v50[32] = CFSTR("EnableInterfaceTelemetry");
  v50[33] = CFSTR("NvStoreFile");
  v51[33] = CFSTR("/var/db/gpsd/gps_nvstore.bin");
  v51[34] = v4;
  v50[34] = CFSTR("VerboseNvStore");
  v50[35] = CFSTR("VerboseCommDataSize");
  v51[35] = v4;
  v51[36] = v4;
  v50[36] = CFSTR("VerboseCommDataSniffer");
  v50[37] = CFSTR("PerformanceReportIntervalSeconds");
  v51[37] = &unk_24F20D628;
  v51[38] = &unk_24F20D610;
  v50[38] = CFSTR("RecoveryTestCase");
  v50[39] = CFSTR("GenericTestCase");
  v51[39] = &unk_24F20D610;
  v51[40] = v6;
  v50[40] = CFSTR("EnableGps");
  v50[41] = CFSTR("EnableQzss");
  v51[41] = v6;
  v51[42] = v6;
  v50[42] = CFSTR("EnableGlonass");
  v50[43] = CFSTR("EnableGalileo");
  v51[43] = v6;
  v50[44] = CFSTR("EnableBeidou");
  v13 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v13 == 201 || v13 == 103)
    v15 = v4;
  else
    v15 = v6;
  v51[44] = v15;
  v50[45] = CFSTR("EnableNavic");
  v16 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  if (GpsdPlatformInfo::supportsNavic(v16))
    v17 = v6;
  else
    v17 = v4;
  v51[45] = v17;
  v50[46] = CFSTR("EnableL5");
  if (*(_BYTE *)(GpsdPlatformInfo::instance(0) + 24))
    v18 = v6;
  else
    v18 = v4;
  v51[46] = v18;
  v50[47] = CFSTR("EnableCoexL5NotchFilter");
  v19 = GpsdPlatformInfo::instance(0);
  v20 = v4;
  if (*(_DWORD *)(v19 + 8) == 107)
  {
    v21 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
    if (GpsdPlatformInfo::isPhone(v21))
      v20 = v6;
    else
      v20 = v4;
  }
  v51[47] = v20;
  v51[48] = v6;
  v50[48] = CFSTR("EnableCoexBitEnhancedFreqAsst");
  v50[49] = CFSTR("EnableCoexBitCdmaFineTimeAsst");
  v51[49] = v6;
  v51[50] = v6;
  v50[50] = CFSTR("EnableCoexBitBlankingGpsL1");
  v50[51] = CFSTR("EnableCoexBitBlankingGloL1");
  v51[51] = v4;
  v51[52] = v4;
  v50[52] = CFSTR("EnableCoexBitBlankingBdsB1I");
  v50[53] = CFSTR("CoexForceGpsL1Filter");
  v51[53] = &unk_24F20D610;
  v51[54] = &unk_24F20D610;
  v50[54] = CFSTR("CoexForceGloL1Filter");
  v50[55] = CFSTR("CoexForceB1IFilter");
  v51[55] = &unk_24F20D610;
  v50[56] = CFSTR("CoexUseB14LteFilterSettingsForB13");
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107)
    v22 = v6;
  else
    v22 = v4;
  v51[56] = v22;
  v51[57] = v6;
  v50[57] = CFSTR("EnableCoexBitStaticSpur");
  v50[58] = CFSTR("EnableCoexBitDynamicNotch");
  v51[58] = v4;
  v51[59] = v6;
  v50[59] = CFSTR("EnableCoexBitJammer");
  v50[60] = CFSTR("GroupDelayL1InCAChips");
  v23 = (void *)MEMORY[0x24BDD16E0];
  v24 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  LODWORD(v25) = 1024685244;
  if (v24 != 202)
    *(float *)&v25 = 0.0;
  if (v24 == 201)
    *(float *)&v25 = -7.149;
  v51[60] = objc_msgSend(v23, "numberWithFloat:", v25);
  v50[61] = CFSTR("ExternalToChipL5GroupDelayMeters");
  v26 = (void *)MEMORY[0x24BDD16E0];
  v27 = GpsdPlatformInfo::instance(0);
  if (*(_BYTE *)(v27 + 24))
    v28 = *(double *)(v27 + 16);
  else
    v28 = 0.0;
  v51[61] = objc_msgSend(v26, "numberWithDouble:", v28);
  v50[62] = CFSTR("GlonassPerFrequencyGroupDelayMeters");
  v29 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  GpsdPlatformInfo::glonassPerFrequencyGroupDelayMeters(v29, (float64x2_t **)__p);
  v51[62] = vectorToNSArray((double **)__p);
  v50[63] = CFSTR("RavenExpected");
  v30 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  if (GpsdPlatformInfo::expectedToHaveRaven(v30))
    v31 = v6;
  else
    v31 = v4;
  v50[64] = CFSTR("ForceFireExtensionsPlatform");
  v51[63] = v31;
  v51[64] = &unk_24F20D610;
  v50[65] = CFSTR("UseInternalEmergencyStack");
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107)
    v32 = v6;
  else
    v32 = v4;
  v51[65] = v32;
  v50[66] = CFSTR("HasXtalFreqJumpRisk");
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107)
    v33 = v6;
  else
    v33 = v4;
  v51[66] = v33;
  v50[67] = CFSTR("AllowAssistanceTimeTo10Milliseconds");
  GpsdPlatformInfo::instance(0);
  v51[67] = v4;
  v50[68] = CFSTR("DebugFeaturesBitmask");
  v51[68] = &unk_24F20D610;
  v50[69] = CFSTR("DebugSettingsString");
  v51[69] = &stru_24F20C7C0;
  v34 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 70);
  if (*(_QWORD *)__p)
  {
    *(_QWORD *)&__p[8] = *(_QWORD *)__p;
    operator delete(*(void **)__p);
  }
  objc_msgSend(*(id *)a1, "registerDefaults:", v34);
  if ((objc_msgSend(*(id *)a1, "BOOLForKey:", CFSTR("VendorLogForceCustomer")) & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 8))
    {
      v47[0] = CFSTR("LogLevel");
      v48[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
      v48[1] = &unk_24F20D688;
      v47[1] = CFSTR("VendorLogMaxDirectorySizeMB");
      v47[2] = CFSTR("VendorLogRotationSizeMB");
      v48[2] = &unk_24F20D688;
      v48[3] = &unk_24F20D6A0;
      v47[3] = CFSTR("VendorLogMaxNumberOfFiles");
      v47[4] = CFSTR("VendorLogAllToOsLog");
      if (*(_DWORD *)(a1 + 8) == 1)
        v35 = v4;
      else
        v35 = v6;
      v48[4] = v35;
      v48[5] = v4;
      v47[5] = CFSTR("VendorLogLz4");
      v47[6] = CFSTR("VendorLogLzfse");
      v48[6] = v4;
      v48[7] = v4;
      v47[7] = CFSTR("VendorLogZlib");
      v47[8] = CFSTR("VerboseCommDataSize");
      v48[8] = v6;
      v36 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 9);
      goto LABEL_62;
    }
    if ((objc_msgSend(*(id *)a1, "BOOLForKey:", CFSTR("VendorLogQA")) & 1) != 0
      || objc_msgSend(*(id *)a1, "BOOLForKey:", CFSTR("VendorLogAllToOsLog")))
    {
      v45[0] = CFSTR("LogLevel");
      v46[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      v46[1] = &unk_24F20D688;
      v45[1] = CFSTR("VendorLogMaxDirectorySizeMB");
      v45[2] = CFSTR("VendorLogRotationSizeMB");
      v46[2] = &unk_24F20D688;
      v46[3] = &unk_24F20D6A0;
      v45[3] = CFSTR("VendorLogMaxNumberOfFiles");
      v45[4] = CFSTR("EnableProtobufBinaryLog");
      v46[4] = v6;
      v46[5] = &unk_24F20D6D0;
      v45[5] = CFSTR("ProtobufLogRetentionDays");
      v45[6] = CFSTR("EnableInterfaceTelemetry");
      v46[6] = v6;
      v36 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 7);
LABEL_62:
      objc_msgSend(*(id *)a1, "registerDefaults:", v36);
      goto LABEL_63;
    }
    if (objc_msgSend(*(id *)a1, "BOOLForKey:", CFSTR("VendorLogRestrictedCarry")))
    {
      v43[0] = CFSTR("LogLevel");
      v44[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      v44[1] = v6;
      v43[1] = CFSTR("EnableInterfaceTelemetry");
      v43[2] = CFSTR("EnableProtobufBinaryLog");
      v43[3] = CFSTR("VendorLogMaxDirectorySizeMB");
      v44[2] = v6;
      v44[3] = &unk_24F20D6B8;
      v36 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
      goto LABEL_62;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v42[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5, CFSTR("LogLevel"));
      v42[1] = v6;
      v41[1] = CFSTR("EnableInterfaceTelemetry");
      v41[2] = CFSTR("EnableProtobufBinaryLog");
      v42[2] = v6;
      v36 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
      goto LABEL_62;
    }
  }
LABEL_63:
  v37 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("Library/Managed Preferences/mobile/gpsd.plist"));
  v38 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 138412546;
    *(_QWORD *)&__p[4] = CFSTR("Library/Managed Preferences/mobile/gpsd.plist");
    *(_WORD *)&__p[12] = 2112;
    *(_QWORD *)&__p[14] = v37;
    _os_log_impl(&dword_2293C9000, v38, OS_LOG_TYPE_DEFAULT, "gpsd_plistpath: %@ defaults %@", __p, 0x16u);
  }
  if (v37)
  {
    v39 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl(&dword_2293C9000, v39, OS_LOG_TYPE_DEFAULT, "Configure defaults from the gpsd.plist on the device", __p, 2u);
    }
    objc_msgSend(*(id *)a1, "registerDefaults:", v37);
  }
  GpsdPreferences::dumpSettingsToLog((id *)a1);
  return a1;
}

void sub_2293EBBF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *__p,uint64_t a56)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t GpsdPreferences::vendorLogForceCustomer(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogForceCustomer"));
}

uint64_t GpsdPreferences::vendorLogQA(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogQA"));
}

uint64_t GpsdPreferences::vendorLogAllToOsLog(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogAllToOsLog"));
}

uint64_t GpsdPreferences::vendorLogRestrictedCarry(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogRestrictedCarry"));
}

uint64_t GpsdPreferences::dumpSettingsToLog(id *this)
{
  void *v1;
  uint64_t result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)objc_msgSend(*this, "dictionaryRepresentation");
  v1 = (void *)objc_msgSend((id)objc_msgSend(v11, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v13;
    *(_QWORD *)&v3 = 138412546;
    v10 = v3;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AppleLanguages"), v10) & 1) == 0
          && (objc_msgSend(v7, "isEqualToString:", CFSTR("NSLanguages")) & 1) == 0
          && (objc_msgSend(v7, "isEqualToString:", CFSTR("NSInterfaceStyle")) & 1) == 0)
        {
          v8 = objc_msgSend(v11, "objectForKeyedSubscript:", v7);
          v9 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v10;
            v17 = v7;
            v18 = 2112;
            v19 = v8;
            _os_log_impl(&dword_2293C9000, v9, OS_LOG_TYPE_INFO, "Pref: %@ = %@", buf, 0x16u);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t GpsdPreferences::setMode(int a1)
{
  uint64_t result;

  result = GpsdPreferences::instance(a1);
  if (result)
    return *(_DWORD *)(result + 8) == a1;
  return result;
}

uint64_t GpsdPreferences::instance(int a1)
{
  _QWORD block[4];
  int v3;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN15GpsdPreferences8instanceENS_4ModeE_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v3 = a1;
  if (GpsdPreferences::instance(GpsdPreferences::Mode)::pred != -1)
    dispatch_once(&GpsdPreferences::instance(GpsdPreferences::Mode)::pred, block);
  return GpsdPreferences::fInstance;
}

uint64_t GpsdPreferences::instance(GpsdPreferences *this)
{
  return GpsdPreferences::instance(0);
}

uint64_t ___ZN15GpsdPreferences8instanceENS_4ModeE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = operator new();
  result = GpsdPreferences::GpsdPreferences(v2, *(_DWORD *)(a1 + 32));
  GpsdPreferences::fInstance = v2;
  return result;
}

void sub_2293EBF14(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2C8E68](v1, 0x1080C409227ACB4);
  _Unwind_Resume(a1);
}

uint64_t GpsdPreferences::vendorLogLz4(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogLz4"));
}

uint64_t GpsdPreferences::vendorLogLzfse(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogLzfse"));
}

uint64_t GpsdPreferences::vendorLogZlib(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogZlib"));
}

_QWORD *GpsdPreferences::vendorLogDirectory@<X0>(id *this@<X0>, _QWORD *a2@<X8>)
{
  char *v3;

  switch(*((_DWORD *)this + 2))
  {
    case 1:
      v3 = "/var/root/gpstool_logs";
      break;
    case 2:
      v3 = "/var/root/gpsfactorytest_logs";
      break;
    case 3:
      v3 = "/var/root/gps_unittest_logs";
      break;
    case 4:
      v3 = "/private/var/logs/BurnIn/gps";
      break;
    default:
      v3 = (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", CFSTR("VendorLogDirectory")), "UTF8String");
      break;
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

_QWORD *GpsdPreferences::vendorLogDirectoryAssumingGpsd@<X0>(id *this@<X0>, _QWORD *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", CFSTR("VendorLogDirectory")), "UTF8String"));
}

uint64_t GpsdPreferences::vendorLogPrefixWithTimestamp(id *this)
{
  if (*((_DWORD *)this + 2) == 3)
    return 0;
  else
    return objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogPrefixWithTimestamp"));
}

uint64_t GpsdPreferences::vendorLogMaxDirectorySizeMB(id *this)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*this, "integerForKey:", CFSTR("VendorLogMaxDirectorySizeMB"));
  if (!objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogQA")))
    return v2;
  LODWORD(result) = objc_msgSend(&unk_24F20D688, "intValue");
  if ((int)result <= (int)v2)
    return v2;
  else
    return result;
}

uint64_t GpsdPreferences::vendorLogRotationSizeMB(GpsdPreferences *this)
{
  uint64_t v1;
  uint64_t result;

  if (*((_DWORD *)this + 2) == 3)
    return 2000;
  v1 = objc_msgSend(*(id *)this, "integerForKey:", CFSTR("VendorLogRotationSizeMB"));
  if (!objc_msgSend(*(id *)this, "BOOLForKey:", CFSTR("VendorLogQA")))
    return v1;
  LODWORD(result) = objc_msgSend(&unk_24F20D688, "intValue");
  if ((int)result <= (int)v1)
    return v1;
  else
    return result;
}

uint64_t GpsdPreferences::vendorLogMaxNumberOfFiles(id *this)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*this, "integerForKey:", CFSTR("VendorLogMaxNumberOfFiles"));
  if (!objc_msgSend(*this, "BOOLForKey:", CFSTR("VendorLogQA")))
    return v2;
  LODWORD(result) = objc_msgSend(&unk_24F20D6A0, "intValue");
  if ((int)result <= (int)v2)
    return v2;
  else
    return result;
}

uint64_t GpsdPreferences::vendorLogRetentionDays(id *this)
{
  return objc_msgSend(*this, "floatForKey:", CFSTR("VendorLogRetentionDays"));
}

BOOL GpsdPreferences::isInUnitTestMode(GpsdPreferences *this)
{
  return *((_DWORD *)this + 2) == 3;
}

uint64_t GpsdPreferences::bigPowerSwitch(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("BigPowerSwitch"));
}

uint64_t GpsdPreferences::baudRate4M8(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("BaudRate4M8"));
}

uint64_t GpsdPreferences::usesAsyncCommRead(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("UsesAsyncCommRead"));
}

_QWORD *GpsdPreferences::forceGnssDeviceLibraryName@<X0>(id *this@<X0>, _QWORD *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", CFSTR("ForceGnssDeviceLibraryName")), "UTF8String"));
}

uint64_t integerToHalLogLevel(unsigned int a1)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 < 9)
    return dword_2293F7C9C[a1];
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v4[0] = 67240192;
    v4[1] = a1;
    _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "Invalid LogLevel preference %{public}d", (uint8_t *)v4, 8u);
  }
  return 3;
}

uint64_t GpsdPreferences::getLogLevel(id *this)
{
  return integerToHalLogLevel(objc_msgSend(*this, "integerForKey:", CFSTR("LogLevel")));
}

uint64_t GpsdPreferences::getSecondaryLogLevel(id *this)
{
  return integerToHalLogLevel(objc_msgSend(*this, "integerForKey:", CFSTR("SecondaryLogLevel")));
}

uint64_t GpsdPreferences::getLogMask(id *this)
{
  uint64_t v1;

  v1 = objc_msgSend(*this, "integerForKey:", CFSTR("LogMask"));
  return v1 & ~(v1 >> 63);
}

uint64_t GpsdPreferences::getPvtmTimeOut(id *this)
{
  uint64_t v1;
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*this, "integerForKey:", CFSTR("PvtmTimeOut"));
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_debug_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEBUG, "Pref: kPvtmTimeOut = %d", (uint8_t *)v4, 8u);
  }
  return v1;
}

uint64_t GpsdPreferences::nmeaMaskOverride(id *this)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*this, "stringForKey:", CFSTR("NmeaMaskOverride"));
  v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v1), "scanHexLongLong:", &v4);
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = v4;
    _os_log_debug_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEBUG, "Pref: kNmeaMaskOverride = 0x%llx", buf, 0xCu);
  }
  return v4;
}

uint64_t GpsdPreferences::enableMeasurementApi(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableMeasurementApi"));
}

uint64_t GpsdPreferences::enableXocalRequests(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableXocalRequests"));
}

uint64_t GpsdPreferences::forceEnableXocalLearning(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("ForceEnableXocalLearning"));
}

uint64_t GpsdPreferences::maxSchedulerQos(id *this)
{
  int v1;
  NSObject *v2;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  v1 = objc_msgSend(*this, "integerForKey:", CFSTR("MaxSchedulerQos"));
  if (v1 == 2)
  {
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_INFO, "Pref,maxSchedulerQos,UserInteractive", v7, 2u);
    }
    return 33;
  }
  else if (v1 == 1)
  {
    v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "Pref,maxSchedulerQos,UserInitiated", buf, 2u);
    }
    return 25;
  }
  else
  {
    v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_INFO, "Pref,maxSchedulerQos,Default", v6, 2u);
    }
    return 21;
  }
}

uint64_t GpsdPreferences::forceDisableGpsd(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("ForceDisableGpsd"));
}

uint64_t GpsdPreferences::enableBasebandReset(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableBasebandReset"));
}

uint64_t GpsdPreferences::enableProtobufBinaryLog(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableProtobufBinaryLog"));
}

_QWORD *GpsdPreferences::protobufLogDirectory@<X0>(id *this@<X0>, _QWORD *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", CFSTR("ProtobufLogDirectory")), "UTF8String"));
}

uint64_t GpsdPreferences::protobufLogRetentionDays(id *this)
{
  return objc_msgSend(*this, "floatForKey:", CFSTR("ProtobufLogRetentionDays"));
}

uint64_t GpsdPreferences::enableProtobufTextLog(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableProtobufTextLog"));
}

uint64_t GpsdPreferences::enableInterfaceTelemetry(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableInterfaceTelemetry"));
}

_QWORD *GpsdPreferences::nvStorePath@<X0>(id *this@<X0>, _QWORD *a2@<X8>)
{
  void *v4;

  v4 = (void *)objc_msgSend(*this, "stringForKey:", CFSTR("DatabasePath"));
  if (!v4)
    __asm { BR              X10 }
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend(v4, "UTF8String"));
}

void sub_2293EC6F8()
{
  JUMPOUT(0x2293EC6CCLL);
}

void sub_2293EC704()
{
  JUMPOUT(0x2293EC6CCLL);
}

void sub_2293EC710()
{
  JUMPOUT(0x2293EC6CCLL);
}

void sub_2293EC71C()
{
  JUMPOUT(0x2293EC6CCLL);
}

void sub_2293EC728()
{
  JUMPOUT(0x2293EC6CCLL);
}

_QWORD *GpsdPreferences::bundleName@<X0>(GpsdPreferences *this@<X0>, _QWORD *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_24F20BE60[*((int *)this + 2)]);
}

_QWORD *GpsdPreferences::nvStoreFile@<X0>(GpsdPreferences *this@<X0>, _QWORD *a2@<X8>)
{
  int v3;
  char *v4;

  v3 = *((_DWORD *)this + 2);
  if ((v3 - 1) < 2)
  {
    v4 = "/var/root/gpstool_nvstore.bin";
  }
  else if (v3 == 4)
  {
    v4 = "/private/var/logs/BurnIn/gps/nvstore.bin";
  }
  else if (v3 == 3)
  {
    v4 = "/var/mobile/CoreGPS_UnitTests_nvstore.bin";
  }
  else
  {
    v4 = (char *)objc_msgSend((id)objc_msgSend(*(id *)this, "stringForKey:", CFSTR("NvStoreFile")), "UTF8String");
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

uint64_t GpsdPreferences::verboseNvStore(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VerboseNvStore"));
}

uint64_t GpsdPreferences::verboseCommDataSize(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VerboseCommDataSize"));
}

uint64_t GpsdPreferences::verboseCommDataSniffer(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("VerboseCommDataSniffer"));
}

void GpsdPreferences::recoveryTestCase(GpsdPreferences *this)
{
  NSObject *v1;
  std::string v2;
  std::string v3;
  std::string v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2293C9000, v1, OS_LOG_TYPE_ERROR, "Checking recoveryTestCase value is not permitted unless GPSD_DEBUGONLY_PERMIT_TEST_CASES is defined", buf, 2u);
    v1 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v6 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdPreferences.mm";
    v7 = 1026;
    v8 = 641;
    v9 = 2082;
    v10 = "recoveryTestCase";
    _os_log_error_impl(&dword_2293C9000, v1, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
  }
  std::string::basic_string[abi:ne180100]<0>(&v4, "assert");
  std::string::basic_string[abi:ne180100]<0>(&v3, "recoveryTestCase");
  std::string::basic_string[abi:ne180100]<0>(&v2, "Checking recoveryTestCase value is not permitted unless GPSD_DEBUGONLY_PERMIT_TEST_CASES is defined");
  gpsd::util::triggerDiagnosticReport((uint64_t)&v4, (uint64_t)&v3, (uint64_t)&v2);
  std::string::~string(&v2);
  std::string::~string(&v3);
  std::string::~string(&v4);
  __assert_rtn("recoveryTestCase", "GpsdPreferences.mm", 641, "false && \"Checking recoveryTestCase value is not permitted unless GPSD_DEBUGONLY_PERMIT_TEST_CASES is defined\"");
}

void sub_2293EC94C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

uint64_t GpsdPreferences::genericTestCase(id *this)
{
  return objc_msgSend(*this, "integerForKey:", CFSTR("GenericTestCase"));
}

uint64_t GpsdPreferences::performanceReportIntervalSeconds(id *this)
{
  return objc_msgSend(*this, "integerForKey:", CFSTR("PerformanceReportIntervalSeconds"));
}

uint64_t GpsdPreferences::enableConstellationGps(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableGps"));
}

uint64_t GpsdPreferences::enableConstellationQzss(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableQzss"));
}

uint64_t GpsdPreferences::enableConstellationGlonass(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableGlonass"));
}

uint64_t GpsdPreferences::enableConstellationGalileo(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableGalileo"));
}

uint64_t GpsdPreferences::enableConstellationBeidou(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableBeidou"));
}

uint64_t GpsdPreferences::enableConstellationNavic(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableNavic"));
}

uint64_t GpsdPreferences::enableL5(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableL5"));
}

uint64_t GpsdPreferences::enableCoexL5NotchFilter(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexL5NotchFilter"));
}

uint64_t GpsdPreferences::useB14LteFilterSettingsForB13(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("CoexUseB14LteFilterSettingsForB13"));
}

uint64_t GpsdPreferences::enableConstellationsBitfield(id *this)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v2 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableGps"));
  if (objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableQzss")))
    v3 = 16;
  else
    v3 = 0;
  v4 = v3 | v2;
  if (objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableGlonass")))
    v5 = 2;
  else
    v5 = 0;
  if (objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableGalileo")))
    v6 = 8;
  else
    v6 = 0;
  v7 = v4 | v5 | v6;
  if (objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableBeidou")))
    v8 = 4;
  else
    v8 = 0;
  if (objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableNavic")))
    v9 = 32;
  else
    v9 = 0;
  return v7 | v8 | v9;
}

unint64_t GpsdPreferences::determineLibindusFinalCoExConfig(id *this, uint64_t a2, int a3)
{
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  int v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  GpsdPlatformInfo::instance(0);
  if (a3)
    v6 = a2;
  else
    v6 = 0;
  if (objc_msgSend(*this, "objectForKey:", CFSTR("CREnableCoexBlanking2G")))
  {
    if (objc_msgSend(*this, "BOOLForKey:", CFSTR("CREnableCoexBlanking2G")))
      v6 |= 1uLL;
    else
      v6 &= ~1uLL;
  }
  if (objc_msgSend(*this, "objectForKey:", CFSTR("CREnableCoexBlankingNR")))
  {
    if (objc_msgSend(*this, "BOOLForKey:", CFSTR("CREnableCoexBlankingNR")))
      v6 |= 2uLL;
    else
      v6 &= ~2uLL;
  }
  if (objc_msgSend(*this, "objectForKey:", CFSTR("CREnableCoexLTEB13")))
  {
    if (objc_msgSend(*this, "BOOLForKey:", CFSTR("CREnableCoexLTEB13")))
      v6 |= 4uLL;
    else
      v6 &= ~4uLL;
  }
  if (objc_msgSend(*this, "objectForKey:", CFSTR("CREnableCoexLTEB14")))
  {
    if (objc_msgSend(*this, "BOOLForKey:", CFSTR("CREnableCoexLTEB14")))
      v6 |= 8uLL;
    else
      v6 &= ~8uLL;
  }
  if (objc_msgSend(*this, "objectForKey:", CFSTR("CREnableCoexEnhancedAssistance")))
  {
    if (objc_msgSend(*this, "BOOLForKey:", CFSTR("CREnableCoexEnhancedAssistance")))
      v6 |= 0x10uLL;
    else
      v6 &= ~0x10uLL;
  }
  if (objc_msgSend(*this, "objectForKey:", CFSTR("CREnableSTWMitigation"))
    && !objc_msgSend(*this, "BOOLForKey:", CFSTR("CREnableSTWMitigation")))
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFDFLL;
  }
  else
  {
    v7 = v6 | 0x20;
  }
  v8 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v9 = "No";
    v11 = 134349826;
    v12 = v7;
    v13 = 2050;
    if (a3)
      v9 = "Yes";
    v14 = 0;
    v15 = 2080;
    v16 = v9;
    v17 = 2050;
    v18 = a2;
    _os_log_impl(&dword_2293C9000, v8, OS_LOG_TYPE_INFO, "#gdm,decodeCoexConfig,coexConfigPostOverride,0x%{public}llx,coexConfigDefault,0x%{public}llx,isCLOverride,%s,coexConfigCLOverride,0x%{public}llx", (uint8_t *)&v11, 0x2Au);
  }
  return v7;
}

unint64_t GpsdPreferences::libolafCoexFlagsBitfield(id *this)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v24;
  int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitEnhancedFreqAsst"));
  v24 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitCdmaFineTimeAsst"));
  v25 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitBlankingGpsL1"));
  v3 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitBlankingGloL1"));
  v4 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitBlankingBdsB1I"));
  v5 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitStaticSpur"));
  v6 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitDynamicNotch"));
  v7 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexBitJammer"));
  v8 = objc_msgSend(*this, "integerForKey:", CFSTR("CoexForceGpsL1Filter"));
  v9 = objc_msgSend(*this, "integerForKey:", CFSTR("CoexForceGloL1Filter"));
  v10 = objc_msgSend(*this, "integerForKey:", CFSTR("CoexForceB1IFilter"));
  v11 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67242752;
    v27 = v2;
    v28 = 1026;
    v29 = v24;
    v30 = 1026;
    v31 = v25;
    v32 = 1026;
    v33 = v3;
    v34 = 1026;
    v35 = v4;
    v36 = 1026;
    v37 = v8;
    v38 = 1026;
    v39 = v9;
    v40 = 1026;
    v41 = v10;
    v42 = 1026;
    v43 = v5;
    v44 = 1026;
    v45 = v6;
    v46 = 1026;
    v47 = v7;
    _os_log_impl(&dword_2293C9000, v11, OS_LOG_TYPE_INFO, "#coex,eFA,%{public}d,FTA,%{public}d,blankingGPS/GLO/B1I,%{public}d,%{public}d,%{public}d,forceFilterGPS/GLO/B1I,%{public}d,%{public}d,%{public}d,enableSpurStatic,%{public}d,enableSpurDynamic,%{public}d,enableJammer,%{public}d", buf, 0x44u);
  }
  if ((v8 - 1) > 3)
    v12 = 30720;
  else
    v12 = qword_2293F7CC0[v8 - 1];
  if ((v10 - 1) > 2)
    v13 = 917504;
  else
    v13 = qword_2293F7CE0[v10 - 1];
  v14 = 98304;
  if (v9 == 2)
    v14 = 0x10000;
  if (v9 == 1)
    v14 = 0x8000;
  v15 = 0x100000;
  if (!(v8 | v9))
    v15 = (unint64_t)(v10 != 0) << 20;
  v16 = 4;
  if (!v2)
    v16 = 0;
  v17 = 8;
  if (!v5)
    v17 = 0;
  v18 = 16;
  if (!v6)
    v18 = 0;
  v19 = 32;
  if (!v7)
    v19 = 0;
  v20 = 256;
  if (!v25)
    v20 = 0;
  v21 = 512;
  if (!v3)
    v21 = 0;
  v22 = 1024;
  if (!v4)
    v22 = 0;
  return v16 | v24 | v20 | v21 | v22 | v17 | v18 | v19 | v14 | v15 | v12 | v13;
}

uint64_t GpsdPreferences::groupDelayL1InCAChips(id *this)
{
  return objc_msgSend(*this, "doubleForKey:", CFSTR("GroupDelayL1InCAChips"));
}

uint64_t GpsdPreferences::externalToChipL5GroupDelayMeters(id *this)
{
  return objc_msgSend(*this, "doubleForKey:", CFSTR("ExternalToChipL5GroupDelayMeters"));
}

void GpsdPreferences::glonassPerFrequencyGroupDelayMeters(id *this@<X0>, char **a2@<X8>)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = (void *)objc_msgSend(*this, "arrayForKey:", CFSTR("GlonassPerFrequencyGroupDelayMeters"));
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "count") > 0xD)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        v10 = a2[2];
        v11 = *a2;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "doubleValue");
          v13 = v12;
          if (v7 >= v10)
          {
            v14 = (v7 - v11) >> 3;
            v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 61)
              std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
            if ((v10 - v11) >> 2 > v15)
              v15 = (v10 - v11) >> 2;
            if ((unint64_t)(v10 - v11) >= 0x7FFFFFFFFFFFFFF8)
              v16 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v16 = v15;
            if (v16)
            {
              if (v16 >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v17 = (char *)operator new(8 * v16);
            }
            else
            {
              v17 = 0;
            }
            v18 = &v17[8 * v14];
            *(_QWORD *)v18 = v13;
            v19 = v18 + 8;
            while (v7 != v11)
            {
              v20 = *((_QWORD *)v7 - 1);
              v7 -= 8;
              *((_QWORD *)v18 - 1) = v20;
              v18 -= 8;
            }
            v10 = &v17[8 * v16];
            *a2 = v18;
            a2[1] = v19;
            a2[2] = v10;
            if (v11)
              operator delete(v11);
            v11 = v18;
            v7 = v19;
          }
          else
          {
            *(_QWORD *)v7 = v12;
            v7 += 8;
          }
          a2[1] = v7;
          ++v9;
        }
        while (v9 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }
  }
  else
  {
    v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v5, OS_LOG_TYPE_ERROR, "Invalid glonassPerFrequencyGroupDelayMeters parameters", buf, 2u);
    }
  }
}

void sub_2293ED2CC(_Unwind_Exception *exception_object)
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

uint64_t GpsdPreferences::isRavenExpected(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("RavenExpected"));
}

uint64_t GpsdPreferences::forceFireExtensionsPlatform(id *this)
{
  return objc_msgSend(*this, "integerForKey:", CFSTR("ForceFireExtensionsPlatform"));
}

uint64_t GpsdPreferences::useInternalEmergencyStack(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("UseInternalEmergencyStack"));
}

uint64_t GpsdPreferences::debugFeaturesBitmask(id *this)
{
  uint64_t v1;
  NSObject *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*this, "integerForKey:", CFSTR("DebugFeaturesBitmask"));
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = v1;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "debugFeaturesBitmask,0x%llx", (uint8_t *)&v4, 0xCu);
  }
  return v1;
}

_QWORD *GpsdPreferences::debugSettingsString@<X0>(id *this@<X0>, _QWORD *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", CFSTR("DebugSettingsString")), "UTF8String"));
}

uint64_t GpsdPreferences::platformSpecificFeaturesBitmask(id *this)
{
  uint64_t v2;

  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) != 107)
    return 0;
  v2 = objc_msgSend(*this, "BOOLForKey:", CFSTR("EnableCoexL5NotchFilter"));
  if (objc_msgSend(*this, "BOOLForKey:", CFSTR("HasXtalFreqJumpRisk")))
    return v2 | 2;
  else
    return v2;
}

uint64_t GpsdPreferences::hasXtalFreqJumpRisk(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("HasXtalFreqJumpRisk"));
}

uint64_t GpsdPreferences::allowAssistanceTimeTo10Milliseconds(id *this)
{
  return objc_msgSend(*this, "BOOLForKey:", CFSTR("AllowAssistanceTimeTo10Milliseconds"));
}

uint64_t GnssHal::CommSpi::CommSpi(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,char a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  id *v46;
  id *v47;
  char v48;
  id *v49;
  dispatch_qos_class_t v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[8];
  uint64_t v63;
  uint8_t *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = &off_24F20BE98;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 8, a2);
  v46 = (id *)GpsdPreferences::instance(0);
  *(_BYTE *)(a1 + 40) = GpsdPreferences::verboseCommDataSize(v46);
  v47 = (id *)GpsdPreferences::instance(0);
  v48 = GpsdPreferences::verboseCommDataSniffer(v47);
  *(_OWORD *)(a1 + 96) = 0u;
  *(_BYTE *)(a1 + 41) = v48;
  *(_BYTE *)(a1 + 42) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = a3;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_QWORD *)(a1 + 128) = 0;
  v49 = (id *)GpsdPreferences::instance(0);
  v50 = GpsdPreferences::maxSchedulerQos(v49);
  gpsd::util::dispatchQueueInit((dispatch_queue_t *)(a1 + 96), v50, "commTx");
  gpsd::util::dispatchQueueInit((dispatch_queue_t *)(a1 + 104), QOS_CLASS_USER_INITIATED, "commRx");
  if (!*(_QWORD *)(a1 + 88))
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a1 + 104);
  v51 = operator new();
  v52 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)buf = &off_24F20BF58;
  v63 = a1;
  v64 = buf;
  GnssHal::CommSpi::AsyncBuffering::AsyncBuffering(v51, v52, (uint64_t)buf, 0x1000uLL);
  v53 = v64;
  if (v64 == buf)
  {
    v54 = 4;
    v53 = buf;
  }
  else
  {
    if (!v64)
      goto LABEL_8;
    v54 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v53 + 8 * v54))();
LABEL_8:
  v55 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v51;
  if (v55)
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v55);
  v56 = operator new();
  v57 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)buf = &off_24F20BFE8;
  v63 = a1;
  v64 = buf;
  GnssHal::CommSpi::AsyncBuffering::AsyncBuffering(v56, v57, (uint64_t)buf, 0x1000uLL);
  v58 = v64;
  if (v64 == buf)
  {
    v59 = 4;
    v58 = buf;
  }
  else
  {
    if (!v64)
      goto LABEL_15;
    v59 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v58 + 8 * v59))();
LABEL_15:
  v60 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v56;
  if (v60)
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v60);
  return a1;
}

void sub_2293ED958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;

  v50 = *(_QWORD **)(v48 - 88);
  if (v50 == (_QWORD *)(v48 - 112))
  {
    v51 = 4;
    v50 = (_QWORD *)(v48 - 112);
  }
  else
  {
    if (!v50)
      goto LABEL_6;
    v51 = 5;
  }
  (*(void (**)(void))(*v50 + 8 * v51))();
LABEL_6:
  MEMORY[0x22E2C8E68](v47, 0x10B0C4041A38AA4);
  v52 = v44[16];
  v44[16] = 0;
  if (v52)
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v52);
  v53 = (_QWORD *)(v46 - 40);
  v54 = v44[15];
  v44[15] = 0;
  if (v54)
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v54);
  v55 = (_QWORD *)v44[10];
  if (v55 == v53)
  {
    v56 = 4;
    v55 = v53;
  }
  else
  {
    if (!v55)
      goto LABEL_15;
    v56 = 5;
  }
  (*(void (**)(void))(*v55 + 8 * v56))();
LABEL_15:
  v57 = (_QWORD *)v44[4];
  if (v57 == v45)
  {
    v58 = 4;
    v57 = v45;
  }
  else
  {
    if (!v57)
      goto LABEL_20;
    v58 = 5;
  }
  (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_20:
  _Unwind_Resume(a1);
}

void GnssHal::CommSpi::setGnssChipPowerStateOn(GnssHal::CommSpi *this, int a2)
{
  NSObject *v4;
  uint64_t v5;
  mach_error_t v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  std::string v10;
  std::string v11;
  std::string v12;
  uint8_t buf[4];
  _BYTE v14[14];
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (GnssHal::CommSpi::isGnssChipPowerStateOn(this) == a2)
  {
    v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v14 = a2;
      _os_log_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEFAULT, "#spi,setGnssChipPowerStateOn,alreadyInState,%{public}d", buf, 8u);
    }
  }
  if (a2)
    v5 = 2;
  else
    v5 = 1;
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 14) + 96))(*((_QWORD *)this + 14), v5);
  v7 = GpsdLogObjectGeneral;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v9 = mach_error_string(v6);
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)v14 = v6;
      *(_WORD *)&v14[4] = 2082;
      *(_QWORD *)&v14[6] = v9;
      _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,SetPowerState,errCode,0x%{public}X,%{public}s", buf, 0x12u);
      v7 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v14 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v14[8] = 1026;
      *(_DWORD *)&v14[10] = 60;
      v15 = 2082;
      v16 = "setGnssChipPowerStateOn";
      _os_log_error_impl(&dword_2293C9000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v12, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v11, "setGnssChipPowerStateOn");
    std::string::basic_string[abi:ne180100]<0>(&v10, "#spi,fail,gpti,SetPowerState,errCode,0x%{public}X,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v10);
    std::string::~string(&v10);
    std::string::~string(&v11);
    std::string::~string(&v12);
    __assert_rtn("setGnssChipPowerStateOn", "GnssHalCommSpi.mm", 60, "false && \"#spi,fail,\" \"gpti,\" \"SetPowerState\" \",errCode,0x%{public}X,%{public}s\"");
  }
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v14 = a2;
    *(_WORD *)&v14[4] = 1026;
    *(_DWORD *)&v14[6] = v5;
    _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEFAULT, "#spi,setGnssChipPowerStateOn,enable,%{public}d,set,%{public}d", buf, 0xEu);
  }
  if (GnssHal::CommSpi::isGnssChipPowerStateOn(this) != a2)
  {
    v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "#spi,setGnssChipPowerStateOn,failed", buf, 2u);
    }
  }
}

void sub_2293EDDB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

BOOL GnssHal::CommSpi::isGnssChipPowerStateOn(GnssHal::CommSpi *this)
{
  mach_error_t v1;
  NSObject *v2;
  char *v4;
  std::string v5;
  std::string v6;
  std::string v7;
  int v8;
  uint8_t buf[4];
  _BYTE v10[14];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v1 = (*(uint64_t (**)(_QWORD, int *))(**((_QWORD **)this + 14) + 104))(*((_QWORD *)this + 14), &v8);
  v2 = GpsdLogObjectGeneral;
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v4 = mach_error_string(v1);
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)v10 = v1;
      *(_WORD *)&v10[4] = 2082;
      *(_QWORD *)&v10[6] = v4;
      _os_log_error_impl(&dword_2293C9000, v2, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,GetGnssChipPowerState,errCode,0x%{public}X,%{public}s", buf, 0x12u);
      v2 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v10 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v10[8] = 1026;
      *(_DWORD *)&v10[10] = 70;
      v11 = 2082;
      v12 = "isGnssChipPowerStateOn";
      _os_log_error_impl(&dword_2293C9000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v7, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v6, "isGnssChipPowerStateOn");
    std::string::basic_string[abi:ne180100]<0>(&v5, "#spi,fail,gpti,GetGnssChipPowerState,errCode,0x%{public}X,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v7, (uint64_t)&v6, (uint64_t)&v5);
    std::string::~string(&v5);
    std::string::~string(&v6);
    std::string::~string(&v7);
    __assert_rtn("isGnssChipPowerStateOn", "GnssHalCommSpi.mm", 70, "false && \"#spi,fail,\" \"gpti,\" \"GetGnssChipPowerState\" \",errCode,0x%{public}X,%{public}s\"");
  }
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v10 = v8;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#spi,GetGnssChipPowerState,%{public}d", buf, 8u);
  }
  return v8 == 2;
}

void sub_2293EE024(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::CommSpi::setReadCallback(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  __int16 v14;
  uint8_t buf[16];
  uint8_t v16[2];

  v4 = (*(uint64_t (**)(_QWORD *))(*a1 + 72))(a1);
  if ((v4 & 1) != 0)
  {
    v5 = a1 + 7;
    if (a1[10])
    {
      v6 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2293C9000, v6, OS_LOG_TYPE_DEFAULT, "#spi,setReadCallback,overwrite", buf, 2u);
      }
    }
    std::function<void ()(unsigned char *,unsigned long)>::operator=(v5, a2);
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      v14 = 0;
      v8 = "#spi,setReadCallback";
      v9 = (uint8_t *)&v14;
      v10 = v7;
      v11 = OS_LOG_TYPE_INFO;
LABEL_9:
      _os_log_impl(&dword_2293C9000, v10, v11, v8, v9, 2u);
    }
  }
  else
  {
    v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      v8 = "#spi,setReadCallback,notSupported";
      v9 = v16;
      v10 = v12;
      v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_9;
    }
  }
  return v4;
}

uint64_t GnssHal::CommSpi::open(GnssHal::CommSpi *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(GnssHal::CommSpi *))(*(_QWORD *)this + 32))(this))
  {
    v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#spi,open,alreadyOpen", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    v3 = *((_QWORD *)this + 6);
    if (v3 && (v4 = *((_QWORD *)this + 14)) != 0)
    {
      v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        v7 = 134349312;
        v8 = v3;
        v9 = 2050;
        v10 = v4;
        _os_log_debug_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEBUG, "#spi,open,existing,plugin,%{public}p,ifc,%{public}p", (uint8_t *)&v7, 0x16u);
      }
    }
    else
    {
      GnssHal::CommSpi::createIoPlugin(this);
    }
    GnssHal::CommSpi::setGnssChipPowerStateOn(this, 0);
    GnssHal::CommSpi::setGnssChipPowerStateOn(this, 1);
    *((_BYTE *)this + 42) = 1;
  }
  return 1;
}

void GnssHal::CommSpi::createIoPlugin(GnssHal::CommSpi *this)
{
  IOCFPlugInInterface ***v2;
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  mach_error_t ChildEntry;
  io_service_t v7;
  const __CFUUID *v8;
  const __CFUUID *v9;
  mach_error_t v10;
  IOCFPlugInInterface **v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD *v14;
  IOCFPlugInInterface **v15;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v17;
  CFUUIDBytes v18;
  NSObject *v19;
  _QWORD *v20;
  mach_error_t v21;
  mach_error_t v22;
  mach_error_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  char *v30;
  NSObject *v31;
  char *v32;
  NSObject *v33;
  char *v34;
  NSObject *v35;
  char *v36;
  std::string v37;
  std::string v38;
  std::string v39;
  std::string v40;
  std::string v41;
  std::string v42;
  std::string v43;
  std::string v44;
  std::string v45;
  std::string v46;
  std::string v47;
  std::string v48;
  std::string v49;
  std::string v50;
  std::string v51;
  std::string v52;
  std::string v53;
  std::string v54;
  SInt32 theScore;
  std::string v56;
  std::string v57;
  std::string v58;
  io_registry_entry_t child;
  std::string v60;
  std::string v61;
  std::string v62;
  uint8_t buf[4];
  _BYTE v64[14];
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v2 = (IOCFPlugInInterface ***)((char *)this + 48);
  if (!*((_QWORD *)this + 6))
  {
    v3 = *MEMORY[0x24BDD8B18];
    v4 = IOServiceNameMatching("gnss");
    MatchingService = IOServiceGetMatchingService(v3, v4);
    if (!MatchingService)
    {
      v26 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2293C9000, v26, OS_LOG_TYPE_ERROR, "#spi,fail,IOServiceGetMatchingService", buf, 2u);
        v26 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 127;
        v65 = 2082;
        v66 = "createIoPlugin";
        _os_log_error_impl(&dword_2293C9000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v62, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v61, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v60, "#spi,fail,IOServiceGetMatchingService");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v62, (uint64_t)&v61, (uint64_t)&v60);
      std::string::~string(&v60);
      std::string::~string(&v61);
      std::string::~string(&v62);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 127, "false && \"#spi,fail,IOServiceGetMatchingService\"");
    }
    child = 0;
    ChildEntry = IORegistryEntryGetChildEntry(MatchingService, "IOService", &child);
    if (ChildEntry)
    {
      v27 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v28 = mach_error_string(ChildEntry);
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v64 = ChildEntry;
        *(_WORD *)&v64[4] = 2082;
        *(_QWORD *)&v64[6] = v28;
        _os_log_error_impl(&dword_2293C9000, v27, OS_LOG_TYPE_ERROR, "#spi,fail,kern,IORegistryEntryGetChildEntry,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        v27 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 131;
        v65 = 2082;
        v66 = "createIoPlugin";
        _os_log_error_impl(&dword_2293C9000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v58, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v57, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v56, "#spi,fail,kern,IORegistryEntryGetChildEntry,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v58, (uint64_t)&v57, (uint64_t)&v56);
      std::string::~string(&v56);
      std::string::~string(&v57);
      std::string::~string(&v58);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 131, "false && \"#spi,fail,\" \"kern,\" \"IORegistryEntryGetChildEntry\" \",errCode,0x%{public}X,%{public}s\"");
    }
    theScore = 0;
    v7 = child;
    v8 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x31u, 0x68u, 0xB0u, 0x8Eu, 0xE5u, 0x7Du, 0x4Eu, 4u, 0x92u, 0xC9u, 0xC0u, 0x15u, 0xB8u, 0xB0u, 0xE9u, 0xABu);
    v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v10 = IOCreatePlugInInterfaceForService(v7, v8, v9, v2, &theScore);
    if (v10)
    {
      v31 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v32 = mach_error_string(v10);
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v64 = v10;
        *(_WORD *)&v64[4] = 2082;
        *(_QWORD *)&v64[6] = v32;
        _os_log_error_impl(&dword_2293C9000, v31, OS_LOG_TYPE_ERROR, "#spi,fail,kern,IOCreatePlugInInterfaceForService,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        v31 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 135;
        v65 = 2082;
        v66 = "createIoPlugin";
        _os_log_error_impl(&dword_2293C9000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v54, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v53, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v52, "#spi,fail,kern,IOCreatePlugInInterfaceForService,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      std::string::~string(&v52);
      std::string::~string(&v53);
      std::string::~string(&v54);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 135, "false && \"#spi,fail,\" \"kern,\" \"IOCreatePlugInInterfaceForService\" \",errCode,0x%{public}X,%{public}s\"");
    }
    v11 = *v2;
    if (!*v2 || !*v11)
    {
      v25 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2293C9000, v25, OS_LOG_TYPE_ERROR, "#spi,fIOCFPluginInterface,nullptr", buf, 2u);
        v25 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 136;
        v65 = 2082;
        v66 = "createIoPlugin";
        _os_log_error_impl(&dword_2293C9000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v51, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v50, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v49, "#spi,fIOCFPluginInterface,nullptr");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      std::string::~string(&v49);
      std::string::~string(&v50);
      std::string::~string(&v51);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 136, "false && \"#spi,fIOCFPluginInterface,nullptr\"");
    }
    v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)v64 = v11;
      *(_WORD *)&v64[8] = 1026;
      *(_DWORD *)&v64[10] = theScore;
      _os_log_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEFAULT, "#spi,opened,plugin,%{public}p,score,%{public}d", buf, 0x12u);
    }
  }
  v14 = (_QWORD *)((char *)this + 112);
  v13 = (_QWORD *)*((_QWORD *)this + 14);
  if (!v13)
  {
    v15 = *v2;
    QueryInterface = (**v2)->QueryInterface;
    v17 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0xE8u, 0x77u, 0xCDu, 0x61u, 0x8Du, 0x30u, 0x46u, 0x2Du, 0xA3u, 0xB7u, 0xB0u, 0x11u, 0x5Au, 0x2Cu, 0xF8u, 0xA8u);
    v18 = CFUUIDGetUUIDBytes(v17);
    ((void (*)(IOCFPlugInInterface **, _QWORD, _QWORD, char *))QueryInterface)(v15, *(_QWORD *)&v18.byte0, *(_QWORD *)&v18.byte8, (char *)this + 112);
    ((void (*)(IOCFPlugInInterface **))(**v2)->Release)(*v2);
    v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (_QWORD *)*v14;
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)v64 = v20;
      _os_log_impl(&dword_2293C9000, v19, OS_LOG_TYPE_DEFAULT, "#spi,opened,ifc,%{public}p", buf, 0xCu);
    }
    v21 = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)this + 14) + 64))(*((_QWORD *)this + 14), *((_QWORD *)this + 13));
    if (v21)
    {
      v29 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v30 = mach_error_string(v21);
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v64 = v21;
        *(_WORD *)&v64[4] = 2082;
        *(_QWORD *)&v64[6] = v30;
        _os_log_error_impl(&dword_2293C9000, v29, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,SetDispatchQueue,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        v29 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 144;
        v65 = 2082;
        v66 = "createIoPlugin";
        _os_log_error_impl(&dword_2293C9000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v48, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v47, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v46, "#spi,fail,gpti,SetDispatchQueue,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v48, (uint64_t)&v47, (uint64_t)&v46);
      std::string::~string(&v46);
      std::string::~string(&v47);
      std::string::~string(&v48);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 144, "false && \"#spi,fail,\" \"gpti,\" \"SetDispatchQueue\" \",errCode,0x%{public}X,%{public}s\"");
    }
    v22 = (*(uint64_t (**)(_QWORD, _QWORD, GnssHal::CommSpi *))(**((_QWORD **)this + 14) + 72))(*((_QWORD *)this + 14), GnssHal::CommSpi::readCallback, this);
    if (v22)
    {
      v33 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v34 = mach_error_string(v22);
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v64 = v22;
        *(_WORD *)&v64[4] = 2082;
        *(_QWORD *)&v64[6] = v34;
        _os_log_error_impl(&dword_2293C9000, v33, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,RegisterDataHandler,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        v33 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 145;
        v65 = 2082;
        v66 = "createIoPlugin";
        _os_log_error_impl(&dword_2293C9000, v33, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v45, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v44, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v43, "#spi,fail,gpti,RegisterDataHandler,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v45, (uint64_t)&v44, (uint64_t)&v43);
      std::string::~string(&v43);
      std::string::~string(&v44);
      std::string::~string(&v45);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 145, "false && \"#spi,fail,\" \"gpti,\" \"RegisterDataHandler\" \",errCode,0x%{public}X,%{public}s\"");
    }
    v23 = (*(uint64_t (**)(_QWORD, void (*)(GnssHal::CommSpi *, void *, gpsd::util *, const unsigned __int8 *), GnssHal::CommSpi *))(**((_QWORD **)this + 14) + 88))(*((_QWORD *)this + 14), GnssHal::CommSpi::eventCallback, this);
    if (v23)
    {
      v35 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v36 = mach_error_string(v23);
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v64 = v23;
        *(_WORD *)&v64[4] = 2082;
        *(_QWORD *)&v64[6] = v36;
        _os_log_error_impl(&dword_2293C9000, v35, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,RegisterEventHandler,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        v35 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 146;
        v65 = 2082;
        v66 = "createIoPlugin";
        _os_log_error_impl(&dword_2293C9000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v42, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v41, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v40, "#spi,fail,gpti,RegisterEventHandler,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v42, (uint64_t)&v41, (uint64_t)&v40);
      std::string::~string(&v40);
      std::string::~string(&v41);
      std::string::~string(&v42);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 146, "false && \"#spi,fail,\" \"gpti,\" \"RegisterEventHandler\" \",errCode,0x%{public}X,%{public}s\"");
    }
    v13 = (_QWORD *)*v14;
    if (!*v14)
      goto LABEL_17;
  }
  if (!*v13)
  {
LABEL_17:
    v24 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v24, OS_LOG_TYPE_ERROR, "#spi,open,failed,fGNSSPassthroughInterface,nullptr", buf, 2u);
      v24 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v64[8] = 1026;
      *(_DWORD *)&v64[10] = 149;
      v65 = 2082;
      v66 = "createIoPlugin";
      _os_log_error_impl(&dword_2293C9000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v39, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v38, "createIoPlugin");
    std::string::basic_string[abi:ne180100]<0>(&v37, "#spi,open,failed,fGNSSPassthroughInterface,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v39, (uint64_t)&v38, (uint64_t)&v37);
    std::string::~string(&v37);
    std::string::~string(&v38);
    std::string::~string(&v39);
    __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 149, "false && \"#spi,open,failed,fGNSSPassthroughInterface,nullptr\"");
  }
}

void sub_2293EF048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a25 < 0)
    operator delete(__p);
  if (a31 < 0)
    operator delete(a26);
  if (a37 < 0)
    operator delete(a32);
  _Unwind_Resume(a1);
}

void GnssHal::CommSpi::close(GnssHal::CommSpi *this)
{
  NSObject *v2;
  uint8_t v3[16];

  if (((*(uint64_t (**)(GnssHal::CommSpi *))(*(_QWORD *)this + 32))(this) & 1) != 0)
  {
    GnssHal::CommSpi::setGnssChipPowerStateOn(this, 0);
    *((_BYTE *)this + 42) = 0;
  }
  else
  {
    v2 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#spi,close,notOpen", v3, 2u);
    }
  }
}

void GnssHal::CommSpi::readCallback(GnssHal::CommSpi::AsyncBuffering **this, unsigned __int8 *a2, int64_t a3)
{
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  std::string v10;
  std::string v11;
  std::string v12;
  _BYTE block[32];
  NSObject **v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2 && a3)
  {
    if (!this)
    {
      v9 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)block = 0;
        _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "#spi,readCallback,commSpiObj,null", block, 2u);
        v9 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 136446722;
        *(_QWORD *)&block[4] = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&block[12] = 1026;
        *(_DWORD *)&block[14] = 165;
        *(_WORD *)&block[18] = 2082;
        *(_QWORD *)&block[20] = "readCallback";
        _os_log_error_impl(&dword_2293C9000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", block, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v12, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v11, "readCallback");
      std::string::basic_string[abi:ne180100]<0>(&v10, "#spi,readCallback,commSpiObj,null");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v10);
      std::string::~string(&v10);
      std::string::~string(&v11);
      std::string::~string(&v12);
      __assert_rtn("readCallback", "GnssHalCommSpi.mm", 165, "false && \"#spi,readCallback,commSpiObj,null\"");
    }
    GnssHal::CommSpi::AsyncBuffering::input(this[16], a2, a3);
    v6 = (NSObject **)this[16];
    v7 = *v6;
    *(_QWORD *)block = MEMORY[0x24BDAC760];
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
    *(_QWORD *)&block[24] = &__block_descriptor_40_e5_v8__0l;
    v14 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    v8 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)block = 134349312;
      *(_QWORD *)&block[4] = a2;
      *(_WORD *)&block[12] = 2050;
      *(_QWORD *)&block[14] = a3;
      _os_log_impl(&dword_2293C9000, v8, OS_LOG_TYPE_DEFAULT, "#spi,read,invalid,data,%{public}p,size,%{public}zu", block, 0x16u);
    }
  }
}

void sub_2293EF558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

void GnssHal::CommSpi::eventCallback(GnssHal::CommSpi *this, void *a2, gpsd::util *a3, const unsigned __int8 *a4)
{
  NSObject *v4;
  int v7;
  std::string *p_p;
  std::string __p;
  std::string v11;
  std::string v12;
  std::string v13;
  uint8_t buf[4];
  _BYTE v15[14];
  __int16 v16;
  const char *v17;
  __int16 v18;
  gpsd::util *v19;
  __int16 v20;
  const unsigned __int8 *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  if (!this)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v4, OS_LOG_TYPE_ERROR, "#spi,eventCallback,commSpiObj,null", buf, 2u);
      v4 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v15 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v15[8] = 1026;
      *(_DWORD *)&v15[10] = 194;
      v16 = 2082;
      v17 = "eventCallback";
      _os_log_error_impl(&dword_2293C9000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v13, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v12, "eventCallback");
    std::string::basic_string[abi:ne180100]<0>(&v11, "#spi,eventCallback,commSpiObj,null");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v13, (uint64_t)&v12, (uint64_t)&v11);
    std::string::~string(&v11);
    std::string::~string(&v12);
    std::string::~string(&v13);
    __assert_rtn("eventCallback", "GnssHalCommSpi.mm", 194, "false && \"#spi,eventCallback,commSpiObj,null\"");
  }
  v7 = (int)a2;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
  {
    gpsd::util::charToHex(a3, a4, 0, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 67241218;
    *(_DWORD *)v15 = v7;
    *(_WORD *)&v15[4] = 2082;
    *(_QWORD *)&v15[6] = p_p;
    v16 = 2050;
    v17 = (const char *)this;
    v18 = 2050;
    v19 = a3;
    v20 = 2050;
    v21 = a4;
    _os_log_fault_impl(&dword_2293C9000, v4, OS_LOG_TYPE_FAULT, "#spi,eventCallback,type,%{public}d,data,hex,%{public}s,context,%{public}p,eventp,%{public}p,size,%{public}zu", buf, 0x30u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2293EF7F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a29 < 0)
    operator delete(a24);
  _Unwind_Resume(exception_object);
}

void GnssHal::CommSpi::destroyIoPlugin(IOCFPlugInInterface ***this)
{
  NSObject *v2;
  IOCFPlugInInterface **v3;
  IOCFPlugInInterface **v4;
  int v5;
  IOCFPlugInInterface **v6;
  __int16 v7;
  IOCFPlugInInterface **v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  IODestroyPlugInInterface(this[6]);
  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = this[6];
    v4 = this[14];
    v5 = 134349312;
    v6 = v3;
    v7 = 2050;
    v8 = v4;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "#spi,closed,plugin,%{public}p,ifc,%{public}p", (uint8_t *)&v5, 0x16u);
  }
  this[6] = 0;
  this[14] = 0;
}

void GnssHal::CommSpi::AsyncBuffering::input(GnssHal::CommSpi::AsyncBuffering *this, const unsigned __int8 *a2, int64_t a3)
{
  char *v6;
  char *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  size_t v15;
  char *v16;
  NSObject *v17;
  const unsigned __int8 *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  int64_t v23;
  char *v24;
  char *v25;
  char *v26;
  int64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  void *v32;
  NSObject *v33;
  std::mutex *v34;
  _BYTE buf[24];
  void *v36;
  GnssHal::CommSpi::AsyncBuffering *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v34 = (std::mutex *)((char *)this + 40);
    std::mutex::lock((std::mutex *)((char *)this + 40));
    v6 = (char *)*((_QWORD *)this + 13);
    v7 = (char *)*((_QWORD *)this + 14);
    v8 = (void *)(*((_QWORD *)this + 15) - (_QWORD)v6);
    v9 = v7 - v6;
    if ((unint64_t)v8 < v7 - v6 + a3)
    {
      v10 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v7 - v6 + a3;
        *(_WORD *)&buf[22] = 2050;
        v36 = v8;
        _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEFAULT, "#spi,ab,overflow,@%{public}p,sz,%{public}zu,cap,%{public}zu", buf, 0x20u);
        v6 = (char *)*((_QWORD *)this + 13);
        v7 = (char *)*((_QWORD *)this + 14);
        v9 = v7 - v6;
      }
    }
    if (a3 < 1)
      goto LABEL_44;
    v11 = &v6[v9];
    v12 = *((_QWORD *)this + 15);
    if (v12 - (uint64_t)v7 < a3)
    {
      v13 = v7 - v6 + a3;
      if (v13 < 0)
        std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
      v14 = v12 - (_QWORD)v6;
      if (2 * v14 > v13)
        v13 = 2 * v14;
      if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
        v16 = (char *)operator new(v15);
      else
        v16 = 0;
      v28 = &v16[v9];
      memcpy(&v16[v9], a2, a3);
      if (v7 == v6)
      {
        v29 = &v16[v9];
      }
      else
      {
        do
        {
          v16[v9 - 1] = v6[v9 - 1];
          --v9;
        }
        while (v9);
        v7 = (char *)*((_QWORD *)this + 14);
        v29 = v16;
      }
      v30 = &v28[a3];
      v31 = &v16[v15];
      if (v7 != v11)
        memmove(v30, v11, v7 - v11);
      v32 = (void *)*((_QWORD *)this + 13);
      *((_QWORD *)this + 13) = v29;
      *((_QWORD *)this + 14) = &v30[v7 - v11];
      *((_QWORD *)this + 15) = v31;
      if (v32)
        operator delete(v32);
      goto LABEL_44;
    }
    v18 = &a2[a3];
    v19 = v7 - v11;
    if (v7 - v11 >= a3)
    {
      v20 = v7;
    }
    else
    {
      memmove(v7, &a2[v19], a3 - v19);
      v20 = &v11[a3];
      *((_QWORD *)this + 14) = &v11[a3];
      if (v19 < 1)
      {
LABEL_44:
        if (((*((_QWORD *)this + 14) - *((_QWORD *)this + 13)) & 0x7FFFFFFFFFFFF800) != 0)
        {
          v33 = *(NSObject **)this;
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
          v36 = &__block_descriptor_40_e5_v8__0l;
          v37 = this;
          dispatch_async(v33, buf);
        }
        std::mutex::unlock(v34);
        return;
      }
      v18 = &a2[v19];
    }
    v21 = &v11[a3];
    v22 = v20;
    if (&v20[-a3] < v7)
    {
      if (a3 <= v19)
        v23 = v7 - v11;
      else
        v23 = a3;
      v24 = &v7[a3 - v9];
      v25 = &v6[v9 - a3];
      v26 = &v6[v9];
      do
      {
        v26[v23] = v25[v23];
        --v24;
        ++v25;
        ++v26;
      }
      while (&v6[v23] != v24);
      if (a3 <= v19)
        v27 = v7 - v11;
      else
        v27 = a3;
      v22 = &v26[v27];
    }
    *((_QWORD *)this + 14) = v22;
    if (v20 != v21)
      memmove(&v11[a3], &v6[v9], v20 - v21);
    if (v18 != a2)
      memmove(&v6[v9], a2, v18 - a2);
    goto LABEL_44;
  }
  v17 = GpsdLogObjectWarning;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v17, OS_LOG_TYPE_DEFAULT, "#spi,ab,input,zerosize", buf, 2u);
  }
}

void sub_2293EFC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10)
{
  std::mutex::unlock(a10);
  _Unwind_Resume(a1);
}

void GnssHal::CommSpi::AsyncBuffering::flush(NSObject **this)
{
  NSObject *v1;
  _QWORD block[5];

  v1 = *this;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_async(v1, block);
}

void GnssHal::CommSpi::readCallbackInternal(GnssHal::CommSpi *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  double v7;
  NSObject *v8;
  const char *v9;
  gpsd::util *v10;
  unint64_t MachContinuousTimeNs;
  NSObject *v12;
  int v13;
  unsigned __int8 *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 41))
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,read,bin", a4);
  if (!*((_QWORD *)this + 10))
  {
    v8 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
      return;
    LOWORD(v13) = 0;
    v9 = "#spi,readCallback,null";
LABEL_11:
    _os_log_fault_impl(&dword_2293C9000, v8, OS_LOG_TYPE_FAULT, v9, (uint8_t *)&v13, 2u);
    return;
  }
  if (!*((_BYTE *)this + 42))
  {
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,read,bin", a4);
    v8 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
      return;
    LOWORD(v13) = 0;
    v9 = "#spi,readcallback,portClosed";
    goto LABEL_11;
  }
  if (*((_BYTE *)this + 40))
    v7 = (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
  else
    v7 = 0.0;
  v10 = (gpsd::util *)std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)this + 56, (uint64_t)a2, (uint64_t)a3);
  if (*((_BYTE *)this + 40))
  {
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(v10);
    v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134349312;
      v14 = a3;
      v15 = 2050;
      v16 = ((double)MachContinuousTimeNs * 0.000000001 - v7) * 1000000.0;
      _os_log_debug_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEBUG, "#spi,hal,read,size,%{public}zu,duration,us,%{public}.1f", (uint8_t *)&v13, 0x16u);
    }
  }
}

uint64_t GnssHal::CommSpi::writeInternal(GnssHal::CommSpi *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  const unsigned __int8 *v4;
  gpsd::util *v7;
  const char *v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  gpsd::util *v12;
  mach_error_t v13;
  unint64_t MachContinuousTimeNs;
  int v15;
  NSObject *v16;
  double v18;
  NSObject *v19;
  char *v20;
  int v21;
  NSObject *v22;
  std::string v23;
  std::string v24;
  std::string v25;
  uint8_t buf[4];
  _BYTE v27[26];
  __int16 v28;
  const unsigned __int8 *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 41))
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,write,bin", a4);
  v7 = (gpsd::util *)(*(uint64_t (**)(GnssHal::CommSpi *))(*(_QWORD *)this + 32))(this);
  if ((v7 & 1) == 0)
  {
    gpsd::util::logBinaryBytes(a2, v4, (uint64_t)"#spi,write,bin", v8);
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v10, OS_LOG_TYPE_ERROR, "#spi,write,notOpen", buf, 2u);
    }
    return -1;
  }
  if (a2 && v4)
  {
    if (*((_BYTE *)this + 40))
      v9 = (double)gpsd::util::getMachContinuousTimeNs(v7) * 0.000000001;
    else
      v9 = 0.0;
    v12 = (gpsd::util *)(*(uint64_t (**)(_QWORD, gpsd::util *, const unsigned __int8 *))(**((_QWORD **)this + 14)
                                                                                                 + 80))(*((_QWORD *)this + 14), a2, v4);
    if ((_DWORD)v12)
    {
      v13 = (int)v12;
      MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(v12);
      v15 = *((_DWORD *)this + 11) + 1;
      *((_DWORD *)this + 11) = v15;
      v16 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
      {
        v20 = mach_error_string(v13);
        v21 = *((_DWORD *)this + 11);
        *(_DWORD *)buf = 67241474;
        *(_DWORD *)v27 = v13;
        *(_WORD *)&v27[4] = 2082;
        *(_QWORD *)&v27[6] = v20;
        *(_WORD *)&v27[14] = 1026;
        *(_DWORD *)&v27[16] = v21;
        *(_WORD *)&v27[20] = 1026;
        *(_DWORD *)&v27[22] = 5;
        v28 = 2050;
        v29 = v4;
        v30 = 2050;
        v31 = ((double)MachContinuousTimeNs * 0.000000001 - v9) * 1000000.0;
        _os_log_fault_impl(&dword_2293C9000, v16, OS_LOG_TYPE_FAULT, "#spi,write,failed,%{public}X,%{public}s,count,%{public}d/%{public}d,size,%{public}zu,duration,us,%{public}.1f", buf, 0x32u);
        v15 = *((_DWORD *)this + 11);
      }
      if (v15 >= 5)
      {
        v22 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_2293C9000, v22, OS_LOG_TYPE_ERROR, "#spi,continuousWriteError", buf, 2u);
          v22 = GpsdLogObjectGeneral;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)v27 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
          *(_WORD *)&v27[8] = 1026;
          *(_DWORD *)&v27[10] = 223;
          *(_WORD *)&v27[14] = 2082;
          *(_QWORD *)&v27[16] = "writeInternal";
          _os_log_error_impl(&dword_2293C9000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
        }
        std::string::basic_string[abi:ne180100]<0>(&v25, "assert");
        std::string::basic_string[abi:ne180100]<0>(&v24, "writeInternal");
        std::string::basic_string[abi:ne180100]<0>(&v23, "#spi,continuousWriteError");
        gpsd::util::triggerDiagnosticReport((uint64_t)&v25, (uint64_t)&v24, (uint64_t)&v23);
        std::string::~string(&v23);
        std::string::~string(&v24);
        std::string::~string(&v25);
        __assert_rtn("writeInternal", "GnssHalCommSpi.mm", 223, "false && \"#spi,continuousWriteError\"");
      }
      return -1;
    }
    *((_DWORD *)this + 11) = 0;
    if (*((_BYTE *)this + 40))
    {
      v18 = ((double)gpsd::util::getMachContinuousTimeNs(v12) * 0.000000001 - v9) * 1000000.0;
      v19 = GpsdLogObjectGeneral;
      if (v18 > (double)(unint64_t)(8 * (_QWORD)v4) / 5.0 + 100000.0
        && os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)v27 = v4;
        *(_WORD *)&v27[8] = 2050;
        *(double *)&v27[10] = v18;
        _os_log_fault_impl(&dword_2293C9000, v19, OS_LOG_TYPE_FAULT, "#spi,write,longDelay,size,%{public}zu,duration,us,%{public}.1f", buf, 0x16u);
        v19 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)v27 = v4;
        *(_WORD *)&v27[8] = 2050;
        *(double *)&v27[10] = v18;
        _os_log_debug_impl(&dword_2293C9000, v19, OS_LOG_TYPE_DEBUG, "#spi,write,size,%{public}zu,duration,us,%{public}.1f", buf, 0x16u);
      }
    }
  }
  else
  {
    v11 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)v27 = a2;
      *(_WORD *)&v27[8] = 2050;
      *(_QWORD *)&v27[10] = v4;
      _os_log_impl(&dword_2293C9000, v11, OS_LOG_TYPE_DEFAULT, "$spi,write,invalid,buffer,%{public}p,size,%{public}zu", buf, 0x16u);
    }
    return 0;
  }
  return (uint64_t)v4;
}

void sub_2293F03A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *GnssHal::CommSpi::write(GnssHal::CommSpi *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  double v7;
  gpsd::util *v8;
  unint64_t MachContinuousTimeNs;
  NSObject *v10;
  int v12;
  unsigned __int8 *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 41))
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,hal,write,bin", a4);
  if (*((_BYTE *)this + 40))
    v7 = (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
  else
    v7 = 0.0;
  GnssHal::CommSpi::AsyncBuffering::input(*((GnssHal::CommSpi::AsyncBuffering **)this + 15), (const unsigned __int8 *)a2, (int64_t)a3);
  if (*((_BYTE *)this + 40))
  {
    MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(v8);
    v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134218240;
      v13 = a3;
      v14 = 2048;
      v15 = ((double)MachContinuousTimeNs * 0.000000001 - v7) * 1000000.0;
      _os_log_debug_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEBUG, "#spi,hal,write,size,%zu,duration,us,%.1f", (uint8_t *)&v12, 0x16u);
    }
  }
  return a3;
}

BOOL GnssHal::CommSpi::writeComplete(GnssHal::CommSpi *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(GnssHal::CommSpi *, const unsigned __int8 *))(*(_QWORD *)this + 88))(this, a2);
  return v4 >= 0 && v4 == a3;
}

uint64_t GnssHal::CommSpi::readFlush(GnssHal::CommSpi *this)
{
  NSObject **v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = (NSObject **)*((_QWORD *)this + 16);
  v2 = *v1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v1;
  dispatch_async(v2, block);
  return 1;
}

uint64_t GnssHal::CommSpi::readWriteFlush(GnssHal::CommSpi *this)
{
  NSObject **v2;
  uint64_t v3;
  NSObject *v4;
  NSObject **v5;
  NSObject *v6;
  uint64_t block;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  NSObject **v12;

  v2 = (NSObject **)*((_QWORD *)this + 16);
  v3 = MEMORY[0x24BDAC760];
  v4 = *v2;
  block = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  v11 = &__block_descriptor_40_e5_v8__0l;
  v12 = v2;
  dispatch_async(v4, &block);
  v5 = (NSObject **)*((_QWORD *)this + 15);
  v6 = *v5;
  block = v3;
  v9 = 3221225472;
  v10 = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  v11 = &__block_descriptor_40_e5_v8__0l;
  v12 = v5;
  dispatch_async(v6, &block);
  return 1;
}

void GnssHal::CommSpi::pulseTimeMarkStrobe(GnssHal::CommSpi *this@<X0>, uint64_t a2@<X8>)
{
  unint64_t *v4;
  mach_error_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL8 v10;
  unint64_t MachContinuousTimeNs;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  gpsd::util *v16;
  std::string v17;
  std::string v18;
  std::string v19;
  gpsd::util *v20[2];
  _BYTE buf[32];
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v20[0] = 0;
  v20[1] = 0;
  v5 = (*(uint64_t (**)(_QWORD, gpsd::util **, gpsd::util **))(**((_QWORD **)this + 14) + 112))(*((_QWORD *)this + 14), v20, &v20[1]);
  if (v5)
  {
    v14 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v15 = mach_error_string(v5);
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)&buf[4] = v5;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = v15;
      _os_log_error_impl(&dword_2293C9000, v14, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,pulseTimeMarkStrobe,errCode,0x%{public}X,%{public}s", buf, 0x12u);
      v14 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 272;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "pulseTimeMarkStrobe";
      _os_log_error_impl(&dword_2293C9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v19, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v18, "pulseTimeMarkStrobe");
    std::string::basic_string[abi:ne180100]<0>(&v17, "#spi,fail,gpti,pulseTimeMarkStrobe,errCode,0x%{public}X,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v19, (uint64_t)&v18, (uint64_t)&v17);
    std::string::~string(&v17);
    std::string::~string(&v18);
    std::string::~string(&v19);
    __assert_rtn("pulseTimeMarkStrobe", "GnssHalCommSpi.mm", 272, "false && \"#spi,fail,\" \"gpti,\" \"pulseTimeMarkStrobe\" \",errCode,0x%{public}X,%{public}s\"");
  }
  v16 = 0;
  if (gpsd::util::getCurrentMachContinuousMinusMachAbsoluteTicks((gpsd::util *)&v16, v4))
  {
    v6 = *((_QWORD *)this + 4);
    if (v6)
    {
      *(int64x2_t *)buf = vsubq_s64(*(int64x2_t *)v20, vdupq_lane_s64((uint64_t)v16, 0));
      (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v6 + 48))(v6, buf);
    }
    v7 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v20[0]);
    *(_QWORD *)a2 = v7;
    v8 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v20[1]);
    *(_QWORD *)(a2 + 8) = v8;
    *(_BYTE *)(a2 + 16) = 1;
    v9 = GpsdLogObjectGeneral;
    v10 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v10);
      v12 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v16);
      *(_DWORD *)buf = 134349824;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2050;
      *(_QWORD *)&buf[24] = MachContinuousTimeNs;
      v22 = 2050;
      v23 = v12;
      _os_log_debug_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEBUG, "#spi,#tt,pulseTimeMarkStrobe,low,ns,%{public}llu,upper,ns,%{public}llu,current,ns,%{public}llu,machContMinusMachAbs,ns,%{public}llu", buf, 0x2Au);
    }
  }
  else
  {
    v13 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v13, OS_LOG_TYPE_ERROR, "#spi,#tt,pulseTimeMarkStrobe,offset,failed", buf, 2u);
    }
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
}

void sub_2293F097C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::CommSpi::AsyncBuffering::AsyncBuffering(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4)
{
  NSObject *v8;
  const char *v9;
  int v10;
  void **v11;
  NSObject *v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  _QWORD v17[2];
  char v18;
  void *__p[2];
  char v20;
  void *v21[2];
  char v22;
  _QWORD v23[2];
  char v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = a2;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 8, a3);
  *(_QWORD *)(a1 + 40) = 850045863;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_QWORD *)(a1 + 144) = 0;
  if (!*(_QWORD *)a1)
  {
    v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "#spi,ab,queue,null", buf, 2u);
      v8 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v26 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      v27 = 1026;
      v28 = 305;
      v29 = 2082;
      v30 = "AsyncBuffering";
      _os_log_error_impl(&dword_2293C9000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v23, "assert");
    std::string::basic_string[abi:ne180100]<0>(v21, "AsyncBuffering");
    std::string::basic_string[abi:ne180100]<0>(__p, "#spi,ab,queue,null");
    gpsd::util::triggerDiagnosticReport((uint64_t)v23, (uint64_t)v21, (uint64_t)__p);
    if (v20 < 0)
      operator delete(__p[0]);
    if (v22 < 0)
      operator delete(v21[0]);
    v9 = "false && \"#spi,ab,queue,null\"";
    v10 = 305;
    if (v24 < 0)
    {
      v11 = (void **)v23;
LABEL_24:
      operator delete(*v11);
    }
LABEL_25:
    __assert_rtn("AsyncBuffering", "GnssHalCommSpi.mm", v10, v9);
  }
  if (!*(_QWORD *)(a3 + 24))
  {
    v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v12, OS_LOG_TYPE_ERROR, "#spi,ab,cb,null", buf, 2u);
      v12 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v26 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      v27 = 1026;
      v28 = 306;
      v29 = 2082;
      v30 = "AsyncBuffering";
      _os_log_error_impl(&dword_2293C9000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v17, "assert");
    std::string::basic_string[abi:ne180100]<0>(v15, "AsyncBuffering");
    std::string::basic_string[abi:ne180100]<0>(v13, "#spi,ab,cb,null");
    gpsd::util::triggerDiagnosticReport((uint64_t)v17, (uint64_t)v15, (uint64_t)v13);
    if (v14 < 0)
      operator delete(v13[0]);
    if (v16 < 0)
      operator delete(v15[0]);
    v9 = "false && \"#spi,ab,cb,null\"";
    v10 = 306;
    if (v18 < 0)
    {
      v11 = (void **)v17;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 104), a4);
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 128), a4);
  return a1;
}

void sub_2293F0D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  _QWORD *v44;
  _QWORD *v45;
  std::mutex *v46;
  void **v47;
  void **v48;
  void *v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  v50 = *v48;
  if (*v48)
  {
    v44[17] = v50;
    operator delete(v50);
  }
  v51 = *v47;
  if (*v47)
  {
    v44[14] = v51;
    operator delete(v51);
  }
  std::mutex::~mutex(v46);
  v52 = (_QWORD *)v44[4];
  if (v52 == v45)
  {
    v53 = 4;
    v52 = v45;
  }
  else
  {
    if (!v52)
      goto LABEL_16;
    v53 = 5;
  }
  (*(void (**)(void))(*v52 + 8 * v53))();
LABEL_16:
  _Unwind_Resume(a1);
}

void ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke(uint64_t a1)
{
  GnssHal::CommSpi::AsyncBuffering::flushInternal(*(GnssHal::CommSpi::AsyncBuffering **)(a1 + 32));
}

void GnssHal::CommSpi::AsyncBuffering::flushInternal(GnssHal::CommSpi::AsyncBuffering *this)
{
  std::mutex *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];

  v2 = (std::mutex *)((char *)this + 40);
  std::mutex::lock((std::mutex *)((char *)this + 40));
  v3 = *((_QWORD *)this + 13);
  v4 = *((_QWORD *)this + 14);
  if (v3 == v4)
  {
    std::mutex::unlock(v2);
  }
  else
  {
    *(_OWORD *)((char *)this + 104) = *((_OWORD *)this + 8);
    v5 = *((_QWORD *)this + 18);
    v6 = *((_QWORD *)this + 15);
    *((_QWORD *)this + 17) = v4;
    *((_QWORD *)this + 18) = v6;
    *((_QWORD *)this + 15) = v5;
    *((_QWORD *)this + 16) = v3;
    std::mutex::unlock(v2);
    std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)this + 8, *((_QWORD *)this + 16), *((_QWORD *)this + 17) - *((_QWORD *)this + 16));
    v7 = *((_QWORD *)this + 16);
    if (*((_QWORD *)this + 17) != v7)
      *((_QWORD *)this + 17) = v7;
    v8 = *(NSObject **)this;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_async(v8, block);
  }
}

void GnssHal::CommSpi::~CommSpi(GnssHal::CommSpi *this)
{
  GnssHal::CommSpi::~CommSpi(this);
  JUMPOUT(0x22E2C8E68);
}

{
  uint64_t v2;
  uint64_t v3;
  GnssHal::CommSpi *v4;
  uint64_t v5;
  GnssHal::CommSpi *v6;
  uint64_t v7;

  *(_QWORD *)this = &off_24F20BE98;
  GnssHal::CommSpi::close(this);
  v2 = *((_QWORD *)this + 16);
  *((_QWORD *)this + 16) = 0;
  if (v2)
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v2);
  v3 = *((_QWORD *)this + 15);
  *((_QWORD *)this + 15) = 0;
  if (v3)
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v3);
  v4 = (GnssHal::CommSpi *)*((_QWORD *)this + 10);
  if (v4 == (GnssHal::CommSpi *)((char *)this + 56))
  {
    v5 = 4;
    v4 = (GnssHal::CommSpi *)((char *)this + 56);
  }
  else
  {
    if (!v4)
      goto LABEL_10;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v4 + 8 * v5))();
LABEL_10:
  v6 = (GnssHal::CommSpi *)*((_QWORD *)this + 4);
  if (v6 == (GnssHal::CommSpi *)((char *)this + 8))
  {
    v7 = 4;
    v6 = (GnssHal::CommSpi *)((char *)this + 8);
  }
  else
  {
    if (!v6)
      return;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
}

uint64_t GnssHal::CommSpi::isOpen(GnssHal::CommSpi *this)
{
  return *((unsigned __int8 *)this + 42);
}

uint64_t GnssHal::CommSpi::getFileDescriptor(GnssHal::CommSpi *this)
{
  return 0xFFFFFFFFLL;
}

uint64_t GnssHal::CommSpi::waitForDataAvailable(GnssHal::CommSpi *this)
{
  return 0;
}

uint64_t GnssHal::CommSpi::readTimeout(GnssHal::CommSpi *this, unsigned __int8 *a2)
{
  return -1;
}

uint64_t GnssHal::CommSpi::readComplete(GnssHal::CommSpi *this, unsigned __int8 *a2)
{
  return 0;
}

uint64_t GnssHal::CommSpi::isReadCallbackSupported(GnssHal::CommSpi *this)
{
  return 1;
}

uint64_t GnssHal::CommSpi::enterLowPowerMode(GnssHal::CommSpi *this)
{
  return 0;
}

uint64_t GnssHal::CommSpi::exitLowPowerMode(GnssHal::CommSpi *this)
{
  return 0;
}

double GnssHal::CommSpi::getTimeoutValueSeconds(GnssHal::CommSpi *this)
{
  return 0.0;
}

void std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 128);
  if (v2)
  {
    *(_QWORD *)(a1 + 136) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 104);
  if (v3)
  {
    *(_QWORD *)(a1 + 112) = v3;
    operator delete(v3);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 40));
  v4 = *(_QWORD **)(a1 + 32);
  if (v4 == (_QWORD *)(a1 + 8))
  {
    v5 = 4;
    v4 = (_QWORD *)(a1 + 8);
  }
  else
  {
    if (!v4)
      goto LABEL_10;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_10:
  JUMPOUT(0x22E2C8E68);
}

void std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20BF58;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20BF58;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, gpsd::util **a2, unsigned __int8 **a3, const char *a4)
{
  return GnssHal::CommSpi::writeInternal(*(GnssHal::CommSpi **)(a1 + 8), *a2, *a3, a4);
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::target_type()
{
}

void std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::~__func()
{
  JUMPOUT(0x22E2C8E68);
}

_QWORD *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24F20BFE8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24F20BFE8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, gpsd::util **a2, unsigned __int8 **a3, const char *a4)
{
  GnssHal::CommSpi::readCallbackInternal(*(GnssHal::CommSpi **)(a1 + 8), *a2, *a3, a4);
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::target_type()
{
}

GnssHal::PlatformNvStore *GnssHal::PlatformNvStore::PlatformNvStore(GnssHal::PlatformNvStore *this)
{
  GnssHal::PlatformNvStore::Cache *v2;

  *(_QWORD *)this = &off_24F20C068;
  v2 = (GnssHal::PlatformNvStore *)((char *)this + 8);
  proto::gnsshal::NvStore::NvStore((GnssHal::PlatformNvStore *)((char *)this + 8));
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  proto::gnsshal::NvStore::NvStore((GnssHal::PlatformNvStore *)((char *)this + 96));
  *((_QWORD *)this + 31) = (char *)this + 256;
  *((_QWORD *)this + 19) = 0;
  *((_QWORD *)this + 20) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 32) = 0;
  *((_QWORD *)this + 33) = 0;
  *((_OWORD *)this + 11) = xmmword_2293F7FA0;
  proto::gnsshal::NvStore::Clear((uint64_t)this + 96);
  *((_DWORD *)this + 36) |= 1u;
  *((_DWORD *)this + 34) = 1;
  *((_QWORD *)this + 11) = 0;
  proto::gnsshal::NvStore::Clear((uint64_t)v2);
  *((_DWORD *)this + 14) |= 1u;
  *((_DWORD *)this + 12) = 1;
  GnssHal::PlatformNvStore::configure(this);
  GnssHal::PlatformNvStore::readCacheFromDisk(this, (GnssHal::PlatformNvStore *)((char *)this + 96));
  GnssHal::PlatformNvStore::readCacheFromDisk(this, v2);
  return this;
}

void sub_2293F1340()
{
  void **v0;

  GnssHal::PlatformNvStore::Cache::~Cache(v0);
}

uint64_t GnssHal::PlatformNvStore::Cache::reset(GnssHal::PlatformNvStore::Cache *this)
{
  uint64_t result;

  *((_QWORD *)this + 10) = 0;
  result = proto::gnsshal::NvStore::Clear((uint64_t)this);
  *((_DWORD *)this + 12) |= 1u;
  *((_DWORD *)this + 10) = 1;
  return result;
}

uint64_t GnssHal::PlatformNvStore::configure(GnssHal::PlatformNvStore *this)
{
  GpsdPreferences *v2;
  void **v3;
  __int128 v5;
  uint64_t v6;

  v2 = (GpsdPreferences *)GpsdPreferences::instance(0);
  GpsdPreferences::nvStoreFile(v2, &v5);
  v3 = (void **)((char *)this + 152);
  if (*((char *)this + 175) < 0)
    operator delete(*v3);
  *(_OWORD *)v3 = v5;
  *((_QWORD *)this + 21) = v6;
  return MEMORY[0x22E2C8BA4]((char *)this + 64, &str);
}

uint64_t GnssHal::PlatformNvStore::readCacheFromDisk(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2)
{
  uint64_t v2;
  char *v5;
  size_t v6;
  _BYTE *v7;
  const void *v8;
  int CacheFromFile;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _BYTE __p[12];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *((unsigned __int8 *)a2 + 79);
  if ((v2 & 0x80u) != 0)
    v2 = *((_QWORD *)a2 + 8);
  if (v2)
  {
    v5 = (char *)a2 + 56;
    if ((GnssHal::PlatformNvStore::readCacheFromFile(this, (uint64_t)a2, (uint64_t *)a2 + 7) & 1) == 0)
    {
      if (*((char *)a2 + 79) >= 0)
        v6 = *((unsigned __int8 *)a2 + 79);
      else
        v6 = *((_QWORD *)a2 + 8);
      v7 = __p;
      std::string::basic_string[abi:ne180100]((uint64_t)__p, v6 + 4);
      if (v16 < 0)
        v7 = *(_BYTE **)__p;
      if (v6)
      {
        if (*((char *)a2 + 79) >= 0)
          v8 = v5;
        else
          v8 = (const void *)*((_QWORD *)a2 + 7);
        memmove(v7, v8, v6);
      }
      strcpy(&v7[v6], ".bak");
      CacheFromFile = GnssHal::PlatformNvStore::readCacheFromFile(this, (uint64_t)a2, (uint64_t *)__p);
      if (v16 < 0)
        operator delete(*(void **)__p);
      v10 = GpsdLogObjectGeneral;
      if (CacheFromFile)
      {
        v11 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
        if ((_DWORD)v11)
        {
          if (*((char *)a2 + 79) >= 0)
            v12 = v5;
          else
            v12 = (char *)*((_QWORD *)a2 + 7);
          *(_DWORD *)__p = 136315138;
          *(_QWORD *)&__p[4] = v12;
          _os_log_error_impl(&dword_2293C9000, v10, OS_LOG_TYPE_ERROR, "NvStore,Needed to read from backup file, %s, is corrupt", __p, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          if (*((char *)a2 + 79) >= 0)
            v13 = v5;
          else
            v13 = (char *)*((_QWORD *)a2 + 7);
          *(_DWORD *)__p = 136315138;
          *(_QWORD *)&__p[4] = v13;
          _os_log_impl(&dword_2293C9000, v10, OS_LOG_TYPE_DEFAULT, "NvStore,Failed to read from primary and backup files for,%s, using an empty cache", __p, 0xCu);
        }
        *((_QWORD *)a2 + 10) = 0;
        v11 = proto::gnsshal::NvStore::Clear((uint64_t)a2);
        *((_DWORD *)a2 + 12) |= 1u;
        *((_DWORD *)a2 + 10) = 1;
      }
      GnssHal::PlatformNvStore::writeCacheToDisk((GnssHal::PlatformNvStore *)v11, a2);
    }
  }
  return 1;
}

void sub_2293F161C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void GnssHal::PlatformNvStore::Cache::~Cache(void **this)
{
  if (*((char *)this + 79) < 0)
    operator delete(this[7]);
  proto::gnsshal::NvStore::~NvStore((proto::gnsshal::NvStore *)this);
}

void GnssHal::PlatformNvStore::~PlatformNvStore(GnssHal::PlatformNvStore *this)
{
  *(_QWORD *)this = &off_24F20C068;
  GnssHal::PlatformNvStore::flushSession(this);
  (*(void (**)(GnssHal::PlatformNvStore *))(*(_QWORD *)this + 56))(this);
  std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy((uint64_t)this + 248, *((char **)this + 32));
  std::mutex::~mutex((std::mutex *)((char *)this + 184));
  if (*((char *)this + 175) < 0)
    operator delete(*((void **)this + 19));
  proto::gnsshal::NvStore::~NvStore((GnssHal::PlatformNvStore *)((char *)this + 96));
}

{
  GnssHal::PlatformNvStore::~PlatformNvStore(this);
}

void sub_2293F16D4()
{
  uint64_t v0;

  if (*(char *)(v0 + 87) < 0)
    operator delete(*(void **)(v0 + 64));
  proto::gnsshal::NvStore::~NvStore((proto::gnsshal::NvStore *)(v0 + 8));
}

uint64_t sub_2293F16EC()
{
  uint64_t v0;

  return v0;
}

BOOL GnssHal::PlatformNvStore::storeSession(uint64_t a1, int a2, uint64_t a3)
{
  std::mutex *v6;
  _BOOL8 v7;

  v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 8, (GnssHal::PlatformNvStore::Cache *)(a1 + 96));
  std::mutex::unlock(v6);
  return v7;
}

{
  std::mutex *v6;
  _BOOL8 v7;

  v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 8, (GnssHal::PlatformNvStore::Cache *)(a1 + 96));
  std::mutex::unlock(v6);
  return v7;
}

void sub_2293F1788(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL GnssHal::PlatformNvStore::storeInternal(GnssHal::PlatformNvStore *a1, uint64_t a2, uint64_t a3, uint64_t a4, GnssHal::PlatformNvStore::Cache *a5)
{
  NSObject *v9;
  _BOOL8 v10;
  NSObject *v11;
  _BOOL8 v12;
  NSObject *v13;
  int v15;
  double v16;
  const void *v17;
  int v18;
  int v19;
  double v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (GnssHal::PlatformNvStore::existsInCache(a1, a5, a2))
  {
    v9 = GpsdLogObjectWarning;
    v10 = 0;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_2293C9000, v9, OS_LOG_TYPE_DEFAULT, "NvStore,Item already in alternate cache", (uint8_t *)&v19, 2u);
      return 0;
    }
  }
  else
  {
    GnssHal::PlatformNvStore::printState(a1, "pre-store");
    v11 = GpsdLogObjectGeneral;
    v12 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (a2 <= 0x7FFFFFFF)
        v15 = a2;
      else
        v15 = a2 - 0x7FFFFFFF;
      v16 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v12) * 0.000000001;
      v17 = (const void *)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
      v18 = gpsd::util::truncatedSha256(*(gpsd::util **)a3, v17);
      v19 = 134218752;
      v20 = v16;
      v21 = 1024;
      v22 = v15;
      v23 = 2048;
      v24 = v17;
      v25 = 1024;
      v26 = v18;
      _os_log_debug_impl(&dword_2293C9000, v11, OS_LOG_TYPE_DEBUG, "NvStore,store,mach_cont_s,%.3f,id,%d,size,%zu,hash,%x", (uint8_t *)&v19, 0x22u);
    }
    v10 = GnssHal::PlatformNvStore::storeToCache(v12, a4, a2, a3);
    if (!v10)
    {
      v13 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_2293C9000, v13, OS_LOG_TYPE_DEFAULT, "NvStore,storeToCache failed", (uint8_t *)&v19, 2u);
      }
    }
    GnssHal::PlatformNvStore::printState(a1, "post-store");
  }
  return v10;
}

void sub_2293F1A04(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL GnssHal::PlatformNvStore::storeInternal(GnssHal::PlatformNvStore *this, int a2, uint64_t a3, uint64_t a4, GnssHal::PlatformNvStore::Cache *a5)
{
  char *v10;
  const void **v11;
  int v12;
  BOOL v13;
  char **v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v18;
  _BOOL8 v19;
  NSObject *v20;
  double v21;
  const void *v22;
  int v23;
  int v24;
  _BYTE v25[14];
  __int16 v26;
  const void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = (char *)*((_QWORD *)this + 32);
  if (!v10)
    goto LABEL_11;
  v11 = (const void **)((char *)this + 256);
  do
  {
    v12 = *((_DWORD *)v10 + 8);
    v13 = v12 < a2;
    if (v12 >= a2)
      v14 = (char **)v10;
    else
      v14 = (char **)(v10 + 8);
    if (!v13)
      v11 = (const void **)v10;
    v10 = *v14;
  }
  while (*v14);
  if (v11 != (const void **)((char *)this + 256) && *((_DWORD *)v11 + 8) <= a2)
  {
    GnssHal::PlatformNvStore::printState(this, "pre-storeNamed");
    v18 = GpsdLogObjectGeneral;
    v19 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      v21 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v19) * 0.000000001;
      v22 = (const void *)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
      v23 = gpsd::util::truncatedSha256(*(gpsd::util **)a3, v22);
      v24 = 134218752;
      *(double *)v25 = v21;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = a2;
      v26 = 2048;
      v27 = v22;
      v28 = 1024;
      v29 = v23;
      _os_log_debug_impl(&dword_2293C9000, v18, OS_LOG_TYPE_DEBUG, "NvStore,storeNamed,mach_cont_s,%.3f,id,%d,size,%zu,hash,%x", (uint8_t *)&v24, 0x22u);
    }
    v16 = GnssHal::PlatformNvStore::writeBlobToDedicatedFile(v19, v11 + 5, a3);
    v20 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v24 = 67109120;
      *(_DWORD *)v25 = v16;
      _os_log_debug_impl(&dword_2293C9000, v20, OS_LOG_TYPE_DEBUG, "NvStore,storeReturn,%d", (uint8_t *)&v24, 8u);
    }
    GnssHal::PlatformNvStore::printState(this, "post-storeNamed");
  }
  else
  {
LABEL_11:
    v15 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v24 = 67109376;
      *(_DWORD *)v25 = a2;
      *(_WORD *)&v25[4] = 2048;
      *(_QWORD *)&v25[6] = a2 + 0x80000000;
      _os_log_debug_impl(&dword_2293C9000, v15, OS_LOG_TYPE_DEBUG, "NvStore,Did not find dedicated file for NamedType,%d,Converting to id,%lld", (uint8_t *)&v24, 0x12u);
    }
    return GnssHal::PlatformNvStore::storeInternal(this, a2 + 0x80000000, a3, a4, a5);
  }
  return v16;
}

BOOL GnssHal::PlatformNvStore::storePermanent(uint64_t a1, int a2, uint64_t a3)
{
  std::mutex *v6;
  _BOOL8 v7;

  v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 96, (GnssHal::PlatformNvStore::Cache *)(a1 + 8));
  std::mutex::unlock(v6);
  return v7;
}

{
  std::mutex *v6;
  _BOOL8 v7;

  v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 96, (GnssHal::PlatformNvStore::Cache *)(a1 + 8));
  std::mutex::unlock(v6);
  return v7;
}

void sub_2293F1CD8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2293F1D4C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::flushSession(GnssHal::PlatformNvStore *this)
{
  NSObject *v2;
  GnssHal::PlatformNvStore *v3;
  uint8_t v4[16];

  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "NvStore,flushSession", v4, 2u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::flushInternal(v3, (GnssHal::PlatformNvStore *)((char *)this + 8));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
}

void sub_2293F1DE4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::flushInternal(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((GnssHal::PlatformNvStore::writeCacheToDisk(this, a2) & 1) == 0)
  {
    v2 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "NvStore,flush,writeCacheToDisk failed", v3, 2u);
    }
  }
}

void GnssHal::PlatformNvStore::flushPermanent(GnssHal::PlatformNvStore *this)
{
  NSObject *v2;
  GnssHal::PlatformNvStore *v3;
  uint8_t v4[16];

  v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_DEFAULT, "NvStore,flushPermanent", v4, 2u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::flushInternal(v3, (GnssHal::PlatformNvStore *)((char *)this + 96));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
}

void sub_2293F1EEC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::recall(GnssHal::PlatformNvStore *this@<X0>, int a2@<W1>, unint64_t *a3@<X8>)
{
  std::mutex *v6;

  v6 = (std::mutex *)((char *)this + 184);
  std::mutex::lock((std::mutex *)((char *)this + 184));
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  GnssHal::PlatformNvStore::recallInternal((uint64_t)this, a2, a3);
  std::mutex::unlock(v6);
}

void sub_2293F1F54(_Unwind_Exception *a1)
{
  std::mutex *v1;
  uint64_t v2;
  void *v4;

  v4 = *(void **)v2;
  if (*(_QWORD *)v2)
  {
    *(_QWORD *)(v2 + 8) = v4;
    operator delete(v4);
  }
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::recallInternal(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  char *v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  _BOOL8 v16;
  double v17;
  gpsd::util *v18;
  const void *v19;
  int v20;
  double v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v4 = a2;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned int *)(a1 + 32);
  if ((int)v6 < 1)
  {
LABEL_5:
    v9 = *(unsigned int *)(a1 + 120);
    if ((int)v9 < 1)
      goto LABEL_17;
    v10 = *(uint64_t **)(a1 + 112);
    while (1)
    {
      v8 = *v10;
      if (*(_QWORD *)(*v10 + 16) == a2)
        break;
      ++v10;
      if (!--v9)
        goto LABEL_17;
    }
  }
  else
  {
    v7 = *(uint64_t **)(a1 + 24);
    while (1)
    {
      v8 = *v7;
      if (*(_QWORD *)(*v7 + 16) == a2)
        break;
      ++v7;
      if (!--v6)
        goto LABEL_5;
    }
  }
  v11 = *(char **)(v8 + 24);
  if (v11[23] < 0)
    v12 = *((_QWORD *)v11 + 1);
  else
    v12 = v11[23];
  std::vector<unsigned char>::reserve(a3, v12);
  if (v11[23] < 0)
  {
    v14 = v11;
    v11 = *(char **)v11;
    v13 = *((_QWORD *)v14 + 1);
  }
  else
  {
    v13 = v11[23];
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>(v11, &v11[v13], a3);
LABEL_17:
  v15 = GpsdLogObjectGeneral;
  v16 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v4 > 0x7FFFFFFF)
      LODWORD(v4) = v4 - 0x7FFFFFFF;
    v17 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v16) * 0.000000001;
    v18 = (gpsd::util *)*a3;
    v19 = (const void *)(a3[1] - *a3);
    v20 = 134218752;
    v21 = v17;
    v22 = 1024;
    v23 = v4;
    v24 = 2048;
    v25 = v19;
    v26 = 1024;
    v27 = gpsd::util::truncatedSha256(v18, v19);
    _os_log_debug_impl(&dword_2293C9000, v15, OS_LOG_TYPE_DEBUG, "NvStore,recall,mach_cont_s,%.3f,id,%d,size,%zu,hash,%x", (uint8_t *)&v20, 0x22u);
  }
  GnssHal::PlatformNvStore::printState((GnssHal::PlatformNvStore *)a1, "recalled");
}

void GnssHal::PlatformNvStore::recall(uint64_t a1@<X0>, int a2@<W1>, unint64_t *a3@<X8>)
{
  std::mutex *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  uint64_t *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL8 v14;
  _QWORD *v15;
  int v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v7 = *(_QWORD *)(a1 + 256);
  if (!v7)
    goto LABEL_11;
  v8 = a1 + 256;
  do
  {
    v9 = *(_DWORD *)(v7 + 32);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (uint64_t *)v7;
    else
      v11 = (uint64_t *)(v7 + 8);
    if (!v10)
      v8 = v7;
    v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 256 && *(_DWORD *)(v8 + 32) <= a2)
  {
    v13 = GpsdLogObjectGeneral;
    v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      v15 = (_QWORD *)(v8 + 40);
      if (*(char *)(v8 + 63) < 0)
        v15 = (_QWORD *)*v15;
      v16 = 67109378;
      v17 = a2;
      v18 = 2080;
      v19 = (uint64_t)v15;
      _os_log_debug_impl(&dword_2293C9000, v13, OS_LOG_TYPE_DEBUG, "NvStore: Reading NamedType=%d from dedicated file %s", (uint8_t *)&v16, 0x12u);
    }
    GnssHal::PlatformNvStore::readBlobFromDedicatedFile(v14, v8 + 40, a3);
  }
  else
  {
LABEL_11:
    v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v16 = 67109376;
      v17 = a2;
      v18 = 2048;
      v19 = a2 + 0x80000000;
      _os_log_debug_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEBUG, "NvStore: Did not find dedicated file for NamedType=%d, converting it to id=%lld", (uint8_t *)&v16, 0x12u);
    }
    GnssHal::PlatformNvStore::recallInternal(a1, a2 + 0x80000000, a3);
  }
  std::mutex::unlock(v6);
}

void sub_2293F22FC(_Unwind_Exception *a1)
{
  std::mutex *v1;
  uint64_t v2;
  void *v4;

  v4 = *(void **)v2;
  if (*(_QWORD *)v2)
  {
    *(_QWORD *)(v2 + 8) = v4;
    operator delete(v4);
  }
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::idFromNamedType(uint64_t a1, int a2)
{
  return a2 + 0x80000000;
}

void GnssHal::PlatformNvStore::readBlobFromDedicatedFile(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  const char *v4;
  FILE *v5;
  FILE *v6;
  size_t v7;
  size_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  size_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int __ptr;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a2 + 23) >= 0)
    v4 = (const char *)a2;
  else
    v4 = *(const char **)a2;
  v5 = fopen(v4, "rb");
  if (!v5)
  {
    v11 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    v12 = *__error();
    *(_DWORD *)buf = 67240192;
    v22 = v12;
    v13 = "NvStore,Failed to open file for reading,%{public}d";
LABEL_14:
    v14 = v11;
    v15 = 8;
LABEL_15:
    _os_log_error_impl(&dword_2293C9000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    return;
  }
  v6 = v5;
  __ptr = 0;
  v7 = fread(&__ptr, 4uLL, 1uLL, v5);
  v8 = __ptr;
  if (v7 != 1 || (__ptr & 0x80000000) != 0 || (int)__ptr >= 8000001)
  {
    fclose(v6);
    v11 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67240192;
    v22 = v8;
    v13 = "NvStore,Failed to read itemId/numBytes or out of range,numBytes,%{public}d";
    goto LABEL_14;
  }
  v9 = (void *)*a3;
  v10 = a3[1] - *a3;
  if (__ptr <= v10)
  {
    if (__ptr < v10)
      a3[1] = (unint64_t)v9 + __ptr;
  }
  else
  {
    std::vector<unsigned char>::__append(a3, __ptr - v10);
    v9 = (void *)*a3;
  }
  v16 = fread(v9, 1uLL, v8, v6);
  v17 = fclose(v6);
  if (v16 == v8)
  {
    if (v17)
    {
      v18 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = "NvStore,Failed to close file after reading";
        v14 = v18;
        v15 = 2;
        goto LABEL_15;
      }
    }
  }
  else
  {
    v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2293C9000, v19, OS_LOG_TYPE_ERROR, "NvStore,Failed to read payload", buf, 2u);
    }
    a3[1] = *a3;
  }
}

uint64_t GnssHal::PlatformNvStore::clear(GnssHal::PlatformNvStore *this, int a2)
{
  NSObject *v4;
  _BOOL8 v5;
  GnssHal::PlatformNvStore *v6;
  GnssHal::PlatformNvStore *v7;
  int v9;
  double v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    v9 = 134218240;
    v10 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v5) * 0.000000001;
    v11 = 1024;
    v12 = a2;
    _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "NvStore,clear,mach_cont_s,%.3f,id,%d", (uint8_t *)&v9, 0x12u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  v7 = (GnssHal::PlatformNvStore *)GnssHal::PlatformNvStore::clearFromCache(v6, (GnssHal::PlatformNvStore *)((char *)this + 8), a2);
  GnssHal::PlatformNvStore::clearFromCache(v7, (GnssHal::PlatformNvStore *)((char *)this + 96), a2);
  std::mutex::unlock((std::mutex *)((char *)this + 184));
  return 1;
}

void sub_2293F2674(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::PlatformNvStore::clearInternal(GnssHal::PlatformNvStore *this, uint64_t a2)
{
  GnssHal::PlatformNvStore *v4;

  v4 = (GnssHal::PlatformNvStore *)GnssHal::PlatformNvStore::clearFromCache(this, (GnssHal::PlatformNvStore *)((char *)this + 8), a2);
  GnssHal::PlatformNvStore::clearFromCache(v4, (GnssHal::PlatformNvStore *)((char *)this + 96), a2);
  return 1;
}

uint64_t GnssHal::PlatformNvStore::clear(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL8 v5;
  std::mutex *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;
  uint64_t *v11;
  NSObject *v12;
  _BOOL8 v13;
  GnssHal::PlatformNvStore *v14;
  uint64_t v15;
  NSObject *v17;
  _BOOL8 v18;
  _QWORD *v19;
  double v20[4];

  v20[3] = *(double *)MEMORY[0x24BDAC8D0];
  v4 = GpsdLogObjectGeneral;
  v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    LODWORD(v20[0]) = 134218240;
    *(double *)((char *)v20 + 4) = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v5) * 0.000000001;
    WORD2(v20[1]) = 1024;
    *(_DWORD *)((char *)&v20[1] + 6) = a2;
    _os_log_debug_impl(&dword_2293C9000, v4, OS_LOG_TYPE_DEBUG, "NvStore,clearNamed,mach_cont_s,%.3f,id,%d", (uint8_t *)v20, 0x12u);
  }
  v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  v7 = *(_QWORD *)(a1 + 256);
  if (!v7)
    goto LABEL_13;
  v8 = a1 + 256;
  do
  {
    v9 = *(_DWORD *)(v7 + 32);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (uint64_t *)v7;
    else
      v11 = (uint64_t *)(v7 + 8);
    if (!v10)
      v8 = v7;
    v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 256 && *(_DWORD *)(v8 + 32) <= a2)
  {
    v17 = GpsdLogObjectGeneral;
    v18 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      v19 = (_QWORD *)(v8 + 40);
      if (*(char *)(v8 + 63) < 0)
        v19 = (_QWORD *)*v19;
      LODWORD(v20[0]) = 67109378;
      HIDWORD(v20[0]) = a2;
      LOWORD(v20[1]) = 2080;
      *(_QWORD *)((char *)&v20[1] + 2) = v19;
      _os_log_debug_impl(&dword_2293C9000, v17, OS_LOG_TYPE_DEBUG, "NvStore: Clearing NamedType=%d from dedicated file %s", (uint8_t *)v20, 0x12u);
    }
    memset(v20, 0, 24);
    v15 = GnssHal::PlatformNvStore::writeBlobToDedicatedFile(v18, (const void **)(v8 + 40), (uint64_t)v20);
  }
  else
  {
LABEL_13:
    v12 = GpsdLogObjectGeneral;
    v13 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      LODWORD(v20[0]) = 67109376;
      HIDWORD(v20[0]) = a2;
      LOWORD(v20[1]) = 2048;
      *(_QWORD *)((char *)&v20[1] + 2) = a2 + 0x80000000;
      _os_log_debug_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEBUG, "NvStore: Did not find dedicated file for NamedType=%d, converting it to id=%lld", (uint8_t *)v20, 0x12u);
    }
    v14 = (GnssHal::PlatformNvStore *)GnssHal::PlatformNvStore::clearFromCache((GnssHal::PlatformNvStore *)v13, (GnssHal::PlatformNvStore::Cache *)(a1 + 8), a2 + 0x80000000);
    GnssHal::PlatformNvStore::clearFromCache(v14, (GnssHal::PlatformNvStore::Cache *)(a1 + 96), a2 + 0x80000000);
    v15 = 1;
  }
  std::mutex::unlock(v6);
  return v15;
}

void sub_2293F28FC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::clearDedicatedFile(uint64_t a1, const void **a2)
{
  _QWORD v3[3];

  memset(v3, 0, sizeof(v3));
  return GnssHal::PlatformNvStore::writeBlobToDedicatedFile(a1, a2, (uint64_t)v3);
}

uint64_t GnssHal::PlatformNvStore::clearSessionStorage(GnssHal::PlatformNvStore *this)
{
  NSObject *v2;
  _BOOL8 v3;
  GnssHal::PlatformNvStore *v4;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
  if (v3)
  {
    v6 = 134217984;
    v7 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3) * 0.000000001;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "NvStore,clearSession,mach_cont_s,%.3f", (uint8_t *)&v6, 0xCu);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::clearCache(v4, (GnssHal::PlatformNvStore *)((char *)this + 8));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
  return 1;
}

void sub_2293F2A18(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::clearCache(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2)
{
  GnssHal::PlatformNvStore *v3;
  NSObject *v4;
  uint8_t v5[16];

  *((_QWORD *)a2 + 10) = 0;
  v3 = (GnssHal::PlatformNvStore *)proto::gnsshal::NvStore::Clear((uint64_t)a2);
  *((_DWORD *)a2 + 12) |= 1u;
  *((_DWORD *)a2 + 10) = 1;
  if ((GnssHal::PlatformNvStore::writeCacheToDisk(v3, a2) & 1) == 0)
  {
    v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_2293C9000, v4, OS_LOG_TYPE_ERROR, "NvStore,clearCache requested but not completed due to writeCacheToDisk failure", v5, 2u);
    }
  }
}

uint64_t GnssHal::PlatformNvStore::clearPermanentStorage(GnssHal::PlatformNvStore *this)
{
  NSObject *v2;
  _BOOL8 v3;
  GnssHal::PlatformNvStore *v4;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = GpsdLogObjectGeneral;
  v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
  if (v3)
  {
    v6 = 134217984;
    v7 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3) * 0.000000001;
    _os_log_impl(&dword_2293C9000, v2, OS_LOG_TYPE_INFO, "NvStore,clearPermanent,mach_cont_s,%.3f", (uint8_t *)&v6, 0xCu);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::clearCache(v4, (GnssHal::PlatformNvStore *)((char *)this + 96));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
  return 1;
}

void sub_2293F2BA4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::printState(GnssHal::PlatformNvStore *this, const char *a2)
{
  unsigned __int8 v4;
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  id *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = atomic_load((unsigned __int8 *)&qword_255A4BE38);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_255A4BE38))
  {
    v8 = (id *)GpsdPreferences::instance(0);
    _MergedGlobals_2 = GpsdPreferences::verboseNvStore(v8);
    __cxa_guard_release(&qword_255A4BE38);
  }
  if (_MergedGlobals_2)
  {
    v5 = GpsdLogObjectGeneral;
    v6 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      v9 = 136315138;
      v10 = a2;
      _os_log_debug_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEBUG, "NvStore,printState,begin,%s", (uint8_t *)&v9, 0xCu);
    }
    if (*((uint64_t *)this + 11) >= 1)
      GnssHal::PlatformNvStore::printState((GnssHal::PlatformNvStore *)v6, (GnssHal::PlatformNvStore *)((char *)this + 8));
    GnssHal::PlatformNvStore::printState((GnssHal::PlatformNvStore *)v6, (GnssHal::PlatformNvStore *)((char *)this + 96));
    v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = a2;
      _os_log_debug_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEBUG, "NvStore,printState,end,%s", (uint8_t *)&v9, 0xCu);
    }
  }
}

void sub_2293F2D28(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_255A4BE38);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::writeBlobToDedicatedFile(uint64_t a1, const void **a2, uint64_t a3)
{
  size_t v5;
  void **v6;
  const void *v7;
  void **v8;
  FILE *v9;
  size_t v10;
  NSObject *v11;
  std::error_code *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  void **v19;
  const std::__fs::filesystem::path *v20;
  const std::__fs::filesystem::path *v21;
  int v22;
  uint64_t v23;
  int v24;
  void **v25;
  int *v26;
  void **v27;
  int v28;
  uint64_t v29;
  void **v31;
  int __ptr;
  void *__p[2];
  char v34;
  uint8_t buf[4];
  void **v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (*((char *)a2 + 23) >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  v6 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v5 + 4);
  if (v34 < 0)
    v6 = (void **)__p[0];
  if (v5)
  {
    if (*((char *)a2 + 23) >= 0)
      v7 = a2;
    else
      v7 = *a2;
    memmove(v6, v7, v5);
  }
  strcpy((char *)v6 + v5, ".tmp");
  if (v34 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  v9 = fopen((const char *)v8, "wb+");
  if (!v9)
  {
    v18 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      if (*((char *)a2 + 23) >= 0)
        v19 = (void **)a2;
      else
        v19 = (void **)*a2;
      *(_DWORD *)buf = 136446210;
      v36 = v19;
      v15 = "NvStore,Failed to open dedicated tmp file,%{public}s";
      v16 = v18;
      v17 = 12;
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  __ptr = *(_DWORD *)(a3 + 8) - *(_DWORD *)a3;
  if (fwrite(&__ptr, 4uLL, 1uLL, v9) != 1 || (v10 = fwrite(*(const void **)a3, 1uLL, __ptr, v9), v10 != __ptr))
  {
    v11 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v31 = __p;
      if (v34 < 0)
        v31 = (void **)__p[0];
      *(_DWORD *)buf = 136446466;
      v36 = v31;
      v37 = 1026;
      v38 = __ptr;
      _os_log_error_impl(&dword_2293C9000, v11, OS_LOG_TYPE_ERROR, "NvStore,Failed to write to temp file,%{public}s,localNumByes,%{public}d", buf, 0x12u);
    }
  }
  if (fclose(v9))
  {
    v13 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      *(_DWORD *)buf = 67240192;
      LODWORD(v36) = v14;
      v15 = "NvStore,Failed to close temp file,%{public}d";
      v16 = v13;
      v17 = 8;
LABEL_38:
      _os_log_error_impl(&dword_2293C9000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (v34 >= 0)
    v20 = (const std::__fs::filesystem::path *)__p;
  else
    v20 = (const std::__fs::filesystem::path *)__p[0];
  if (*((char *)a2 + 23) >= 0)
    v21 = (const std::__fs::filesystem::path *)a2;
  else
    v21 = (const std::__fs::filesystem::path *)*a2;
  rename(v20, v21, v12);
  if (v22)
  {
    v23 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v24 = *((char *)a2 + 23);
      v25 = (void **)*a2;
      v26 = __error();
      if (v24 >= 0)
        v27 = (void **)a2;
      else
        v27 = v25;
      v28 = *v26;
      *(_DWORD *)buf = 136446466;
      v36 = v27;
      v37 = 1026;
      v38 = v28;
      v15 = "NvStore,Failed to move temp file to primary dedicated,%{public}s,%{public}d";
      v16 = v23;
      v17 = 18;
      goto LABEL_38;
    }
LABEL_39:
    v29 = 0;
    goto LABEL_40;
  }
  v29 = 1;
LABEL_40:
  if (v34 < 0)
    operator delete(__p[0]);
  return v29;
}

void sub_2293F3070(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL GnssHal::PlatformNvStore::existsInCache(GnssHal::PlatformNvStore *this, const GnssHal::PlatformNvStore::Cache *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[48];

  v3 = *((unsigned int *)a2 + 6);
  if ((int)v3 < 1)
    return 0;
  v5 = 0;
  while (1)
  {
    v6 = *(_QWORD *)(*((_QWORD *)a2 + 2) + 8 * v5);
    if (*(_QWORD *)(v6 + 16) == a3)
      break;
    if (v3 == ++v5)
      return 0;
  }
  if ((int)v3 <= (int)v5)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
    v6 = *(_QWORD *)(*((_QWORD *)a2 + 2) + 8 * v5);
  }
  v8 = *(_QWORD *)(v6 + 24);
  if (*(char *)(v8 + 23) < 0)
    v9 = *(_QWORD *)(v8 + 8);
  else
    v9 = *(unsigned __int8 *)(v8 + 23);
  return v9 != 0;
}

void sub_2293F3168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

BOOL GnssHal::PlatformNvStore::storeToCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  proto::gnsshal::NvStoreItem *v14;
  NSObject *v15;
  _BOOL8 result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFAbsoluteTime Current;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned int *)(a2 + 24);
  v8 = (int)v7;
  if ((int)v7 >= 1)
  {
    v9 = 0;
    while (1)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8 * v9);
      if (*(_QWORD *)(v10 + 16) == a3)
        break;
      if (v7 == ++v9)
        goto LABEL_5;
    }
    if ((int)v7 <= (int)v9)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)buf);
      v10 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8 * v9);
    }
    v17 = *(_QWORD *)(v10 + 24);
    if (*(char *)(v17 + 23) < 0)
      v18 = *(_QWORD *)(v17 + 8);
    else
      v18 = *(unsigned __int8 *)(v17 + 23);
    v11 = *(_QWORD *)(a2 + 80) + *(_QWORD *)(a4 + 8) - (v18 + *(_QWORD *)a4);
    if (v11 < 8000000)
    {
      *(_QWORD *)(a2 + 80) = v11;
      GnssHal::PlatformNvStore::storeToProtobuf(a1, v10, a3, (gpsd::util **)a4);
      return 1;
    }
    v15 = GpsdLogObjectGeneral;
    result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
LABEL_24:
    *(_DWORD *)buf = 134349312;
    v24 = v11;
    v25 = 2050;
    v26 = 8000000;
    _os_log_error_impl(&dword_2293C9000, v15, OS_LOG_TYPE_ERROR, "NvStore,NV_LIMIT_TOTAL_SIZE reached,%{public}lld,%{public}lld", buf, 0x16u);
    return 0;
  }
LABEL_5:
  v11 = *(_QWORD *)(a4 + 8) - *(_QWORD *)a4 + *(_QWORD *)(a2 + 80);
  if (v11 < 8000000)
  {
    *(_QWORD *)(a2 + 80) = v11;
    v12 = *(_DWORD *)(a2 + 28);
    if ((int)v8 >= v12)
    {
      if (v12 == *(_DWORD *)(a2 + 32))
      {
        wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(a2 + 16));
        v12 = *(_DWORD *)(a2 + 28);
      }
      *(_DWORD *)(a2 + 28) = v12 + 1;
      v14 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
      v19 = *(_QWORD *)(a2 + 16);
      v20 = *(int *)(a2 + 24);
      *(_DWORD *)(a2 + 24) = v20 + 1;
      *(_QWORD *)(v19 + 8 * v20) = v14;
    }
    else
    {
      v13 = *(_QWORD *)(a2 + 16);
      *(_DWORD *)(a2 + 24) = v8 + 1;
      v14 = *(proto::gnsshal::NvStoreItem **)(v13 + 8 * v8);
    }
    *((_DWORD *)v14 + 16) |= 8u;
    *((_QWORD *)v14 + 4) = 0;
    Current = CFAbsoluteTimeGetCurrent();
    *((_DWORD *)v14 + 16) |= 0x10u;
    *((CFAbsoluteTime *)v14 + 5) = Current;
    GnssHal::PlatformNvStore::storeToProtobuf(v22, (uint64_t)v14, a3, (gpsd::util **)a4);
    return 1;
  }
  v15 = GpsdLogObjectGeneral;
  result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if (result)
    goto LABEL_24;
  return result;
}

void sub_2293F3428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore *this, const GnssHal::PlatformNvStore::Cache *a2)
{
  size_t v2;
  char v3;
  size_t v4;
  uint64_t v5;
  NSObject *v7;
  size_t v8;
  void **v9;
  char *v10;
  size_t v11;
  void **v12;
  char *v13;
  void **v14;
  void **v15;
  FILE *v16;
  __sFILE *v17;
  int *v18;
  NSObject *v19;
  NSObject *v20;
  const wireless_diagnostics::google::protobuf::UnknownFieldSet *v21;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void **v28;
  char *v29;
  void **v30;
  FILE *v31;
  void *__p[2];
  char v33;
  void *v34[2];
  char v35;
  uint8_t buf[4];
  void **v37;
  __int16 v38;
  _BYTE v39[10];
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = *((unsigned __int8 *)a2 + 79);
  v3 = v2;
  v4 = *((_QWORD *)a2 + 8);
  if ((v2 & 0x80u) == 0)
    v5 = *((unsigned __int8 *)a2 + 79);
  else
    v5 = *((_QWORD *)a2 + 8);
  if (!v5)
    return 1;
  v7 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v7, OS_LOG_TYPE_DEFAULT, "NvStore,writeCacheToDisk", buf, 2u);
    v2 = *((unsigned __int8 *)a2 + 79);
    v4 = *((_QWORD *)a2 + 8);
    v3 = *((_BYTE *)a2 + 79);
  }
  if (v3 >= 0)
    v8 = v2;
  else
    v8 = v4;
  v9 = v34;
  std::string::basic_string[abi:ne180100]((uint64_t)v34, v8 + 4);
  if (v35 < 0)
    v9 = (void **)v34[0];
  if (v8)
  {
    if (*((char *)a2 + 79) >= 0)
      v10 = (char *)a2 + 56;
    else
      v10 = (char *)*((_QWORD *)a2 + 7);
    memmove(v9, v10, v8);
  }
  strcpy((char *)v9 + v8, ".tmp");
  if (*((char *)a2 + 79) >= 0)
    v11 = *((unsigned __int8 *)a2 + 79);
  else
    v11 = *((_QWORD *)a2 + 8);
  v12 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v11 + 4);
  if (v33 < 0)
    v12 = (void **)__p[0];
  if (v11)
  {
    if (*((char *)a2 + 79) >= 0)
      v13 = (char *)a2 + 56;
    else
      v13 = (char *)*((_QWORD *)a2 + 7);
    memmove(v12, v13, v11);
  }
  strcpy((char *)v12 + v11, ".bak");
  if (v35 >= 0)
    v14 = v34;
  else
    v14 = (void **)v34[0];
  unlink((const char *)v14);
  if (v35 >= 0)
    v15 = v34;
  else
    v15 = (void **)v34[0];
  v16 = fopen((const char *)v15, "wb+");
  v31 = v16;
  if (v16)
  {
    gpsd::util::changeFileToClassD(v16, v17);
    wireless_diagnostics::google::protobuf::MessageLite::SerializeToString();
    v20 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v23 = *((_DWORD *)a2 + 10);
      v24 = *((_DWORD *)a2 + 6);
      v25 = proto::gnsshal::NvStore::ByteSize(a2, v21);
      *(_DWORD *)buf = 134349824;
      v37 = 0;
      v38 = 1026;
      *(_DWORD *)v39 = v23;
      *(_WORD *)&v39[4] = 1026;
      *(_DWORD *)&v39[6] = v24;
      v40 = 1026;
      v41 = v25;
      _os_log_error_impl(&dword_2293C9000, v20, OS_LOG_TYPE_ERROR, "NvStore,Could not serialize to string,stringSize,%{public}zu,cacheVer,%{public}d,cacheNum,%{public}d,cacheBytes,%{public}d", buf, 0x1Eu);
    }
  }
  else
  {
    v18 = __error();
    v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v26 = *v18;
      v27 = v35;
      v28 = (void **)v34[0];
      v29 = strerror(v26);
      v30 = v34;
      if (v27 < 0)
        v30 = v28;
      *(_DWORD *)buf = 136446466;
      v37 = v30;
      v38 = 2082;
      *(_QWORD *)v39 = v29;
      _os_log_error_impl(&dword_2293C9000, v19, OS_LOG_TYPE_ERROR, "NvStore,Failed to open temp file,%{public}s,%{public}s", buf, 0x16u);
    }
  }
  std::unique_ptr<__sFILE,GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore::Cache const&,BOOL)::$_0>::reset[abi:ne180100](&v31);
  if (v33 < 0)
    operator delete(__p[0]);
  if (v35 < 0)
    operator delete(v34[0]);
  return 0;
}

void sub_2293F3AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, FILE *a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a14 < 0)
    operator delete(__p);
  std::unique_ptr<__sFILE,GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore::Cache const&,BOOL)::$_0>::reset[abi:ne180100](&a15);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::printState(GnssHal::PlatformNvStore *this, const GnssHal::PlatformNvStore::Cache *a2)
{
  NSObject *v3;
  double Current;
  int v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  char *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v19 = (char *)a2 + 56;
    v20 = *((_QWORD *)a2 + 10);
    if (*((char *)a2 + 79) < 0)
      v19 = (char *)*((_QWORD *)a2 + 7);
    *(_DWORD *)buf = 134218242;
    v22 = v20;
    v23 = 2080;
    v24 = v19;
    _os_log_debug_impl(&dword_2293C9000, v3, OS_LOG_TYPE_DEBUG, "NvStore,printState,currentSize,%lld,filePath,%s", buf, 0x16u);
  }
  if (*((int *)a2 + 6) < 1)
  {
    v18 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2293C9000, v18, OS_LOG_TYPE_DEBUG, "NvStore,printState,empty", buf, 2u);
    }
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *((_DWORD *)a2 + 6);
    if (v5 >= 1)
    {
      v6 = Current;
      v7 = 0;
      v8 = GpsdLogObjectGeneral;
      do
      {
        v9 = *(_QWORD *)(*((_QWORD *)a2 + 2) + 8 * v7);
        v10 = *(_QWORD *)(v9 + 16);
        if (v10 <= 0x7FFFFFFF)
          v11 = *(_QWORD *)(v9 + 16);
        else
          v11 = v10 - 0x7FFFFFFF;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v12 = *(_QWORD *)(v9 + 24);
          if (*(char *)(v12 + 23) < 0)
            v13 = *(char **)(v12 + 8);
          else
            v13 = (char *)*(unsigned __int8 *)(v12 + 23);
          v14 = *(_DWORD *)(v9 + 56);
          v15 = v6 - *(double *)(v9 + 40);
          v16 = v6 - *(double *)(v9 + 48);
          v17 = *(_QWORD *)(v9 + 32);
          *(_DWORD *)buf = 134219264;
          v22 = v11;
          v23 = 2048;
          v24 = v13;
          v25 = 1024;
          v26 = v14;
          v27 = 2048;
          v28 = v15;
          v29 = 2048;
          v30 = v16;
          v31 = 2048;
          v32 = v17;
          _os_log_debug_impl(&dword_2293C9000, v8, OS_LOG_TYPE_DEBUG, "NvStore,printState,id,%lld,size,%zu,hash,%x,createAgeSeconds,%.1f,modAgeSeconds,%.1f,modCount,%lld", buf, 0x3Au);
          v8 = GpsdLogObjectGeneral;
          v5 = *((_DWORD *)a2 + 6);
        }
        ++v7;
      }
      while (v7 < v5);
    }
  }
}

uint64_t GnssHal::PlatformNvStore::clearFromCache(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GnssHal::PlatformNvStore *v11;
  NSObject *v12;
  uint8_t buf[8];
  uint64_t v15;
  uint64_t v16;

  v3 = *((unsigned int *)a2 + 6);
  if ((int)v3 >= 1)
  {
    v6 = 0;
    v7 = *((_QWORD *)a2 + 2);
    while (1)
    {
      v8 = *(_QWORD *)(v7 + 8 * v6);
      if (*(_QWORD *)(v8 + 16) == a3)
        break;
      if (v3 == ++v6)
        return 1;
    }
    if ((int)v3 <= (int)v6)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)buf);
      v8 = *(_QWORD *)(*((_QWORD *)a2 + 2) + 8 * v6);
    }
    v9 = *(_QWORD *)(v8 + 24);
    if (*(char *)(v9 + 23) < 0)
      v10 = *(_QWORD *)(v9 + 8);
    else
      v10 = *(unsigned __int8 *)(v9 + 23);
    *((_QWORD *)a2 + 10) -= v10;
    *(_QWORD *)buf = 0;
    v15 = 0;
    v16 = 0;
    GnssHal::PlatformNvStore::storeToProtobuf((uint64_t)this, v8, a3, (gpsd::util **)buf);
    if ((GnssHal::PlatformNvStore::writeCacheToDisk(v11, a2) & 1) == 0)
    {
      v12 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEFAULT, "NvStore,clearFromCache,writeCacheToDisk failed", buf, 2u);
      }
    }
  }
  return 1;
}

void sub_2293F3F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::storeToProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, gpsd::util **a4)
{
  int v6;
  int v7;
  uint64_t v8;
  gpsd::util *v9;
  gpsd::util *v10;
  std::string::value_type v11;
  uint64_t v12;
  CFAbsoluteTime Current;
  NSObject *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(a2 + 64) |= 1u;
  *(_QWORD *)(a2 + 16) = a3;
  v6 = gpsd::util::truncatedSha256(*a4, (const void *)(a4[1] - *a4));
  v7 = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 56) = v6;
  *(_DWORD *)(a2 + 64) = v7 | 6;
  v8 = *(_QWORD *)(a2 + 24);
  if (v8 == MEMORY[0x24BEDD958])
  {
    v8 = operator new();
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)v8 = 0;
    *(_QWORD *)(a2 + 24) = v8;
  }
  if (*(char *)(v8 + 23) < 0)
  {
    **(_BYTE **)v8 = 0;
    *(_QWORD *)(v8 + 8) = 0;
  }
  else
  {
    *(_BYTE *)v8 = 0;
    *(_BYTE *)(v8 + 23) = 0;
  }
  std::string::reserve((std::string *)v8, a4[1] - *a4);
  v9 = *a4;
  v10 = a4[1];
  while (v9 != v10)
  {
    v11 = *(_BYTE *)v9;
    v9 = (gpsd::util *)((char *)v9 + 1);
    std::string::push_back((std::string *)v8, v11);
  }
  v12 = *(_QWORD *)(a2 + 32) + 1;
  *(_DWORD *)(a2 + 64) |= 8u;
  *(_QWORD *)(a2 + 32) = v12;
  Current = CFAbsoluteTimeGetCurrent();
  *(_DWORD *)(a2 + 64) |= 0x20u;
  *(CFAbsoluteTime *)(a2 + 48) = Current;
  v14 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v15 = a4[1] - *a4;
    v16 = *(_QWORD *)(a2 + 24);
    if (*(char *)(v16 + 23) < 0)
      v17 = *(_QWORD *)(v16 + 8);
    else
      v17 = *(unsigned __int8 *)(v16 + 23);
    v18 = *(_DWORD *)(a2 + 56);
    v19 = *(_QWORD *)(a2 + 32);
    v20 = 134218752;
    v21 = v15;
    v22 = 2048;
    v23 = v17;
    v24 = 1024;
    v25 = v18;
    v26 = 2048;
    v27 = v19;
    _os_log_debug_impl(&dword_2293C9000, v14, OS_LOG_TYPE_DEBUG, "NvStore,storeToProtobuf,source_size,%zu,dest_size,%zu,hash,%x,count,%lld", (uint8_t *)&v20, 0x26u);
  }
}

void std::unique_ptr<__sFILE,GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore::Cache const&,BOOL)::$_0>::reset[abi:ne180100](FILE **a1)
{
  FILE *v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  *a1 = 0;
  if (v2 && fclose(v2))
  {
    v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      v4 = *__error();
      v5[0] = 67240192;
      v5[1] = v4;
      _os_log_error_impl(&dword_2293C9000, v3, OS_LOG_TYPE_ERROR, "NvStore,Failed to close file,%{public}d", (uint8_t *)v5, 8u);
    }
  }
}

void sub_2293F41BC(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

uint64_t GnssHal::PlatformNvStore::readCacheFromFile(GnssHal::PlatformNvStore *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  std::ios_base *v11;
  NSObject *v12;
  char v13;
  uint64_t *v14;
  const char *v15;
  uint8_t *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  char v21;
  BOOL v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  gpsd::util *v29;
  const void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  int v42;
  int v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  uint64_t v47;
  uint64_t *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  proto::gnsshal::NvStoreItem *v53;
  NSObject *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  proto::gnsshal::NvStoreItem *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  int v62;
  uint64_t v63;
  uint8_t v64[4];
  int v65;
  uint8_t v66[4];
  _BYTE v67[24];
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  std::string __p;
  uint64_t v73;
  uint8_t buf[4];
  uint64_t *v75;
  uint64_t v76;
  _QWORD v77[2];
  _BYTE v78[408];
  _QWORD v79[21];

  v79[19] = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x24BEDB838];
  v7 = MEMORY[0x24BEDB838] + 64;
  v8 = (_QWORD *)MEMORY[0x24BEDB7E0];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  v79[0] = MEMORY[0x24BEDB838] + 64;
  v77[0] = v9;
  *(_QWORD *)((char *)v77 + *(_QWORD *)(v9 - 24)) = v10;
  v77[1] = 0;
  v11 = (std::ios_base *)((char *)v77 + *(_QWORD *)(v77[0] - 24));
  std::ios_base::init(v11, v78);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v77[0] = v6 + 24;
  v79[0] = v7;
  MEMORY[0x22E2C8C4C](v78);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)v77 + *(_QWORD *)(v77[0] - 24)), *(_DWORD *)&v78[*(_QWORD *)(v77[0] - 24) + 16] | 4);
  if ((v78[*(_QWORD *)(v77[0] - 24) + 16] & 5) != 0)
  {
    v12 = GpsdLogObjectGeneral;
    v13 = 0;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a3 + 23) >= 0)
        v14 = a3;
      else
        v14 = (uint64_t *)*a3;
      *(_DWORD *)buf = 136315138;
      v75 = v14;
      v15 = "NvStore,readCacheFromFile,Could not open file,%s";
      v16 = buf;
LABEL_9:
      _os_log_impl(&dword_2293C9000, v12, OS_LOG_TYPE_DEFAULT, v15, v16, 0xCu);
LABEL_60:
      v13 = 0;
      goto LABEL_61;
    }
    goto LABEL_61;
  }
  std::istream::seekg();
  std::istream::tellg();
  v17 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)a3 + 23) >= 0)
      v49 = a3;
    else
      v49 = (uint64_t *)*a3;
    *(_DWORD *)v66 = 136315394;
    *(_QWORD *)v67 = v49;
    *(_WORD *)&v67[8] = 1026;
    *(_DWORD *)&v67[10] = v76;
    _os_log_debug_impl(&dword_2293C9000, v17, OS_LOG_TYPE_DEBUG, "NvStore,readCacheFromFile,filePath,%s,size,%{public}d", v66, 0x12u);
  }
  std::istream::seekg();
  if (v76)
  {
    if ((wireless_diagnostics::google::protobuf::Message::ParseFromIstream() & 1) != 0)
    {
      v18 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        v50 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)v66 = 67240192;
        *(_DWORD *)v67 = v50;
        _os_log_debug_impl(&dword_2293C9000, v18, OS_LOG_TYPE_DEBUG, "NvStore,readCacheFromFile,items_size,%{public}d", v66, 8u);
      }
      GnssHal::PlatformNvStore::printState(a1, "post-parse of cache from file");
      v19 = *(_DWORD *)(a2 + 40);
      if (v19 == 1)
      {
        *(_QWORD *)(a2 + 80) = 0;
        if (*(int *)(a2 + 24) < 1)
        {
          v21 = 0;
        }
        else
        {
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = (_QWORD *)(a2 + 16);
          do
          {
            v24 = *(_QWORD *)(*v23 + 8 * v20);
            v25 = *(_QWORD *)(v24 + 24);
            if (*(char *)(v25 + 23) < 0)
              v26 = *(_QWORD *)(v25 + 8);
            else
              v26 = *(unsigned __int8 *)(v25 + 23);
            *(_QWORD *)(a2 + 80) += v26;
            v22 = v22 || (*(_BYTE *)(v24 + 64) & 1) == 0;
            v27 = *(_DWORD *)(v24 + 56);
            v28 = *(char *)(v25 + 23);
            if (v28 >= 0)
              v29 = (gpsd::util *)v25;
            else
              v29 = *(gpsd::util **)v25;
            if (v28 >= 0)
              v30 = (const void *)*(unsigned __int8 *)(v25 + 23);
            else
              v30 = *(const void **)(v25 + 8);
            v31 = gpsd::util::truncatedSha256(v29, v30);
            if (v27 != v31)
            {
              if (v20 >= *(int *)(a2 + 24))
              {
                wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
                wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
                wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
                wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v66);
              }
              v32 = *(_QWORD *)(*v23 + 8 * v20);
              v33 = GpsdLogObjectGeneral;
              if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
              {
                v35 = *(_QWORD *)(v32 + 24);
                if (*(char *)(v35 + 23) < 0)
                  v36 = *(_QWORD *)(v35 + 8);
                else
                  v36 = *(unsigned __int8 *)(v35 + 23);
                v37 = *(_DWORD *)(a2 + 24);
                v38 = *(_QWORD *)(v32 + 16);
                *(_DWORD *)v66 = 67241216;
                *(_DWORD *)v67 = v37;
                *(_WORD *)&v67[4] = 2050;
                *(_QWORD *)&v67[6] = v38;
                *(_WORD *)&v67[14] = 2050;
                *(_QWORD *)&v67[16] = v36;
                v68 = 1026;
                v69 = v27;
                v70 = 1026;
                v71 = v31;
                _os_log_error_impl(&dword_2293C9000, v33, OS_LOG_TYPE_ERROR, "NvStore,readCacheFromFile,hash does not match,items_size,%{public}d,itemId,%{public}lld,size,%{public}zu,storedHash,%{public}x,calculatedHash,%{public}x", v66, 0x28u);
              }
              *(_DWORD *)(v32 + 64) |= 2u;
              v34 = *(_QWORD *)(v32 + 24);
              if (v34 == MEMORY[0x24BEDD958])
              {
                v34 = operator new();
                *(_QWORD *)v34 = 0;
                *(_QWORD *)(v34 + 8) = 0;
                *(_QWORD *)(v34 + 16) = 0;
                *(_QWORD *)(v32 + 24) = v34;
              }
              if (*(char *)(v34 + 23) < 0)
              {
                **(_BYTE **)v34 = 0;
                *(_QWORD *)(v34 + 8) = 0;
              }
              else
              {
                *(_BYTE *)v34 = 0;
                *(_BYTE *)(v34 + 23) = 0;
              }
              v21 = 1;
            }
            ++v20;
          }
          while (v20 < *(int *)(a2 + 24));
          if (v22)
          {
            proto::gnsshal::NvStore::NvStore((proto::gnsshal::NvStore *)v66, (const proto::gnsshal::NvStore *)a2);
            if (*(char *)(a2 + 79) < 0)
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 56), *(_QWORD *)(a2 + 64));
            else
              __p = *(std::string *)(a2 + 56);
            v73 = *(_QWORD *)(a2 + 80);
            if (*(int *)(a2 + 24) >= 1)
            {
              v51 = 0;
              do
              {
                (*(void (**)(_QWORD))(**(_QWORD **)(*v23 + 8 * v51) + 32))(*(_QWORD *)(*v23 + 8 * v51));
                ++v51;
              }
              while (v51 < *(int *)(a2 + 24));
            }
            *(_DWORD *)(a2 + 24) = 0;
            if (*(int *)&v67[20] >= 1)
            {
              v52 = 0;
              do
              {
                v53 = *(proto::gnsshal::NvStoreItem **)(*(_QWORD *)&v67[12] + 8 * v52);
                if ((*((_BYTE *)v53 + 64) & 1) != 0)
                {
                  v55 = *(_DWORD *)(a2 + 28);
                  v56 = *(int *)(a2 + 24);
                  if ((int)v56 >= v55)
                  {
                    if (v55 == *(_DWORD *)(a2 + 32))
                    {
                      wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(a2 + 16));
                      v55 = *(_DWORD *)(a2 + 28);
                    }
                    *(_DWORD *)(a2 + 28) = v55 + 1;
                    v58 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
                    v59 = *(_QWORD *)(a2 + 16);
                    v60 = *(int *)(a2 + 24);
                    *(_DWORD *)(a2 + 24) = v60 + 1;
                    *(_QWORD *)(v59 + 8 * v60) = v58;
                  }
                  else
                  {
                    v57 = *(_QWORD *)(a2 + 16);
                    *(_DWORD *)(a2 + 24) = v56 + 1;
                    v58 = *(proto::gnsshal::NvStoreItem **)(v57 + 8 * v56);
                  }
                  if (v53 != v58)
                  {
                    (*(void (**)(proto::gnsshal::NvStoreItem *))(*(_QWORD *)v58 + 32))(v58);
                    proto::gnsshal::NvStoreItem::MergeFrom(v58, v53);
                  }
                }
                else
                {
                  v54 = GpsdLogObjectWarning;
                  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v64 = 67240192;
                    v65 = v52;
                    _os_log_impl(&dword_2293C9000, v54, OS_LOG_TYPE_DEFAULT, "NvStore,readCacheFromFile,Missing item id for index,%{public}d", v64, 8u);
                  }
                }
                ++v52;
              }
              while (v52 < *(int *)&v67[20]);
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            proto::gnsshal::NvStore::~NvStore((proto::gnsshal::NvStore *)v66);
          }
        }
        v61 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
        {
          v62 = *(_DWORD *)(a2 + 24);
          v63 = *(_QWORD *)(a2 + 80);
          *(_DWORD *)v66 = 67109376;
          *(_DWORD *)v67 = v62;
          *(_WORD *)&v67[4] = 2048;
          *(_QWORD *)&v67[6] = v63;
          _os_log_debug_impl(&dword_2293C9000, v61, OS_LOG_TYPE_DEBUG, "NvStore,readCacheFromFile,numItems,%d,totalSize,%lld", v66, 0x12u);
        }
        v13 = v21 ^ 1;
        goto LABEL_61;
      }
      v47 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v66 = 67240448;
        *(_DWORD *)v67 = v19;
        *(_WORD *)&v67[4] = 1026;
        *(_DWORD *)&v67[6] = 1;
        v44 = "NvStore,readCacheFromFile,Unexpected version,%{public}d,Expected version,%{public}d";
        v45 = v47;
        v46 = 14;
LABEL_58:
        _os_log_impl(&dword_2293C9000, v45, OS_LOG_TYPE_DEFAULT, v44, v66, v46);
      }
    }
    else
    {
      v40 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        if (*((char *)a3 + 23) >= 0)
          v41 = a3;
        else
          v41 = (uint64_t *)*a3;
        v42 = *(_DWORD *)(a2 + 40);
        v43 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)v66 = 136315650;
        *(_QWORD *)v67 = v41;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = v42;
        *(_WORD *)&v67[14] = 1024;
        *(_DWORD *)&v67[16] = v43;
        v44 = "NvStore,readCacheFromFile,Could not parse message from file,%s,parsed_ver,%d,parsed_items_size,%d";
        v45 = v40;
        v46 = 24;
        goto LABEL_58;
      }
    }
    proto::gnsshal::NvStore::Clear(a2);
    goto LABEL_60;
  }
  v12 = GpsdLogObjectWarning;
  v13 = 0;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0)
      v39 = a3;
    else
      v39 = (uint64_t *)*a3;
    *(_DWORD *)v66 = 136315138;
    *(_QWORD *)v67 = v39;
    v15 = "NvStore,readCacheFromFile,Empty file,%s";
    v16 = v66;
    goto LABEL_9;
  }
LABEL_61:
  v77[0] = *v8;
  *(_QWORD *)((char *)v77 + *(_QWORD *)(v77[0] - 24)) = v8[3];
  MEMORY[0x22E2C8C58](v78);
  std::istream::~istream();
  MEMORY[0x22E2C8DFC](v79);
  return v13 & 1;
}

void sub_2293F4A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  proto::gnsshal::NvStore::~NvStore((proto::gnsshal::NvStore *)va);
}

void sub_2293F4A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  _Unwind_Exception *v45;

  std::ifstream::~ifstream(&a45);
  _Unwind_Resume(v45);
}

void std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[63] < 0)
      operator delete(*((void **)a2 + 5));
    operator delete(a2);
  }
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>(char *a1, char *a2, unint64_t *a3)
{
  char *v5;
  _BYTE *v6;
  char v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  size_t v14;
  char *v15;
  char *v16;
  _BYTE *v17;
  _BYTE *v18;
  char v19;

  if (a1 != a2)
  {
    v5 = a1;
    v6 = (_BYTE *)a3[1];
    do
    {
      v7 = *v5;
      v8 = a3[2];
      if ((unint64_t)v6 >= v8)
      {
        v10 = *a3;
        v11 = &v6[-*a3];
        v12 = (unint64_t)(v11 + 1);
        if ((uint64_t)(v11 + 1) < 0)
          std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
        v13 = v8 - v10;
        if (2 * v13 > v12)
          v12 = 2 * v13;
        if (v13 >= 0x3FFFFFFFFFFFFFFFLL)
          v14 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v14 = v12;
        if (v14)
          v15 = (char *)operator new(v14);
        else
          v15 = 0;
        v16 = &v11[(_QWORD)v15];
        v17 = &v11[(_QWORD)v15];
        *v17 = v7;
        v9 = v17 + 1;
        if (v6 != (_BYTE *)v10)
        {
          v18 = &v6[~v10];
          do
          {
            v19 = *--v6;
            (v18--)[(_QWORD)v15] = v19;
          }
          while (v6 != (_BYTE *)v10);
          v6 = (_BYTE *)*a3;
          v16 = v15;
        }
        *a3 = (unint64_t)v16;
        a3[1] = (unint64_t)v9;
        a3[2] = (unint64_t)&v15[v14];
        if (v6)
          operator delete(v6);
      }
      else
      {
        *v6 = v7;
        v9 = v6 + 1;
      }
      a3[1] = (unint64_t)v9;
      ++v5;
      v6 = v9;
    }
    while (v5 != a2);
  }
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x24BDD7FD0](interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x24BDD88C8](*(_QWORD *)&entry, plane, child);
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

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x24BED84B8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x24BED8A38]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x24BED8A40]();
}

uint64_t TelephonyBasebandPCITransportTimesync()
{
  return MEMORY[0x24BED8A60]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x24BED97A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(wireless_diagnostics::google::protobuf::DescriptorPool *this)
{
  return MEMORY[0x24BEDDBB8](this);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile(wireless_diagnostics::google::protobuf::DescriptorPool *this, const void *a2)
{
  return MEMORY[0x24BEDDBC0](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::generated_factory(wireless_diagnostics::google::protobuf::MessageFactory *this)
{
  return MEMORY[0x24BEDDBC8](this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile()
{
  return MEMORY[0x24BEDDBD0]();
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage()
{
  return MEMORY[0x24BEDDBD8]();
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  return MEMORY[0x24BEDDBE0](this);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom(wireless_diagnostics::google::protobuf::UnknownFieldSet *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  return MEMORY[0x24BEDDBF0](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  return MEMORY[0x24BEDDBF8](this);
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  MEMORY[0x24BEDDC00](this);
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl()
{
  return MEMORY[0x24BEDD6A8]();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD6D8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x24BEDD6E0](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD6E8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD700](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD720](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD728](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x24BEDD748](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, uint64_t a3, unsigned __int8 *a4)
{
  return MEMORY[0x24BEDD760](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x24BEDD778](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, uint64_t a2, unsigned __int8 *a3)
{
  return MEMORY[0x24BEDD780](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, uint64_t a2, unsigned __int8 *a3)
{
  return MEMORY[0x24BEDD788](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::Message::ParseFromIstream()
{
  return MEMORY[0x24BEDDC08]();
}

void wireless_diagnostics::google::protobuf::Message::~Message(wireless_diagnostics::google::protobuf::Message *this)
{
  MEMORY[0x24BEDDC10](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x24BEDD7E0]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
  MEMORY[0x24BEDD7E8](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x24BEDD7F0]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::OnShutdown(wireless_diagnostics::google::protobuf::internal *this, void (*a2)(void))
{
  return MEMORY[0x24BEDD808](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFields(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3)
{
  return MEMORY[0x24BEDDC18](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  return MEMORY[0x24BEDDC20](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2, unsigned __int8 *a3)
{
  return MEMORY[0x24BEDDC28](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormat *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  return MEMORY[0x24BEDDC30](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x24BEDD810]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(wireless_diagnostics::google::protobuf::internal::ReflectionOps *this, const wireless_diagnostics::google::protobuf::Message *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  return MEMORY[0x24BEDDC38](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x24BEDD960](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return MEMORY[0x24BEDD970]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD988](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD990](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD998](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9B8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray()
{
  return MEMORY[0x24BEDDA08]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return MEMORY[0x24BEDDA10]();
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
  MEMORY[0x24BEDDA38](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap()
{
  return MEMORY[0x24BEDDA40]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this)
{
  return MEMORY[0x24BEDDA48](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection()
{
  return MEMORY[0x24BEDDC40]();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString()
{
  return MEMORY[0x24BEDDAA0]();
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName()
{
  return MEMORY[0x24BEDDC48]();
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC60](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x24BEDACA8](this, __pos, __n1, __s, __n2);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

void std::string::~string(std::string *this)
{
  MEMORY[0x24BEDACF0](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE98]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF60]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB020]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
  MEMORY[0x24BEDB100](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB110](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24F20A150();
}

void operator delete(void *__p)
{
  off_24F20A158(__p);
}

uint64_t operator delete()
{
  return off_24F20A160();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F20A168(__sz);
}

uint64_t operator new()
{
  return off_24F20A170();
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
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

void cfmakeraw(termios *a1)
{
  MEMORY[0x24BDAD958](a1);
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD970](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAE7B0](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x24BEDD010](dest, src, copyHelper);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x24BDAF5A0](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAF5E0](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x24BDAFF98](a1, a2, a3);
}

int tcflush(int a1, int a2)
{
  return MEMORY[0x24BDB01D8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x24BDB01E0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x24BDB01E8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

