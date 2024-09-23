@implementation GpsDevice

- (id)init:(id *)a3
{
  char *v4;
  NSObject *v5;
  _BOOL8 v6;
  double ProcessUptimeSec;
  unsigned int v8;
  GpsdPlatformInfo *v9;
  void **v10;
  NSObject *v11;
  GpsFactoryTest *v12;
  objc_super v14;
  uint8_t buf[16];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)GpsDevice;
  v4 = -[GpsDevice init](&v14, sel_init);
  if (!GpsdLogObjectGeneral)
    GpsdLogObjectGeneral = (uint64_t)os_log_create("com.apple.gpstest", "general");
  if (!GpsdLogObjectWarning)
    GpsdLogObjectWarning = (uint64_t)os_log_create("com.apple.gpstest", "Warning");
  if (!GpsdLogObjectDevice)
    GpsdLogObjectDevice = (uint64_t)os_log_create("com.apple.gpstest", "device");
  if (!GpsdLogObjectNmea)
    GpsdLogObjectNmea = (uint64_t)os_log_create("com.apple.gpstest", "NMEA");
  if (!GpsdLogObjectGem)
    GpsdLogObjectGem = (uint64_t)os_log_create("com.apple.gpstest", "gem");
  v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEBUG, "Logging init, check if the level is enabled", buf, 2u);
    v5 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_INFO, "Logging init, check if the level is enabled", buf, 2u);
    v5 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "Logging init, check if the level is enabled", buf, 2u);
    v5 = GpsdLogObjectGeneral;
  }
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    ProcessUptimeSec = gpsd::util::getProcessUptimeSec((gpsd::util *)v6);
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = ProcessUptimeSec;
    _os_log_impl(&dword_2293C9000, v5, OS_LOG_TYPE_DEFAULT, "Record process start time, %.1f", buf, 0xCu);
  }
  GpsdPreferences::instance(4);
  switch(CoreGPSTestPreflight())
  {
    case 1u:
      +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, 5, CFSTR("Error: preflight failed, unknown error"));
      goto LABEL_34;
    case 2u:
      +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, 5, CFSTR("Error: preflight failed, locationd is running"));
      goto LABEL_34;
    case 3u:
      +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, 5, CFSTR("Error: gpstool is running"));
      goto LABEL_34;
    case 4u:
    case 5u:
      +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, 5, CFSTR("Daemon is loaded"));
      goto LABEL_34;
    case 6u:
      +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, 5, CFSTR("Error: Unsupported platform"));
LABEL_34:
      v4 = 0;
      break;
    default:
      v8 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
      if (v8 > 4 || ((1 << v8) & 0x19) == 0)
      {
        v9 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
        GpsdPlatformInfo::vendorDylibFullPathName(v9, buf);
        v10 = (void **)(v4 + 40);
        if (v4[63] < 0)
          operator delete(*v10);
        *(_OWORD *)v10 = *(_OWORD *)buf;
        *((_QWORD *)v4 + 7) = v16;
        v11 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
        {
          if (v4[63] < 0)
            v10 = (void **)*v10;
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v10;
          _os_log_impl(&dword_2293C9000, v11, OS_LOG_TYPE_INFO, "gnssDeviceLibraryName,%s", buf, 0xCu);
        }
        v12 = (GpsFactoryTest *)operator new();
        GpsFactoryTest::GpsFactoryTest(v12, (const GpsFactoryTest::Options *)(v4 + 16));
        *((_QWORD *)v4 + 1) = v12;
        GpsFactoryTest::testInitialize(v12);
      }
      break;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GpsDevice;
  -[GpsDevice dealloc](&v2, sel_dealloc);
}

- (BOOL)getGpsConfiguration:(id *)a3 error:(id *)a4
{
  uint64_t (****fTestDevice)(_QWORD, SEL);
  int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  unsigned int var0;
  int var2;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  _DWORD v18[2];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  fTestDevice = (uint64_t (****)(_QWORD, SEL))self->_fTestDevice;
  if (fTestDevice)
    v7 = (**fTestDevice[66])(fTestDevice[66], a2);
  else
    v7 = -1;
  a3->var2 = v7;
  v8 = (unsigned int *)GpsdPlatformInfo::instance(0);
  v9 = *v8;
  a3->var0 = *v8;
  if (!v9)
  {
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a4, 4, CFSTR("Unrecognized hardware"));
    v15 = GpsdLogObjectGeneral;
    v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!v14)
      return v14;
    LOWORD(v18[0]) = 0;
    v16 = "Unknown hardware platform";
    goto LABEL_14;
  }
  v10 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  a3->var1 = v10;
  if (!v10)
  {
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a4, 4, CFSTR("Unrecognized gnss chip"));
    v15 = GpsdLogObjectGeneral;
    v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!v14)
      return v14;
    LOWORD(v18[0]) = 0;
    v16 = "Unknown gnss chip";
LABEL_14:
    _os_log_error_impl(&dword_2293C9000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v18, 2u);
    LOBYTE(v14) = 0;
    return v14;
  }
  v11 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3->var0;
    var2 = a3->var2;
    v18[0] = 67109632;
    v18[1] = var0;
    v19 = 1024;
    v20 = v10;
    v21 = 1024;
    v22 = var2;
    _os_log_impl(&dword_2293C9000, v11, OS_LOG_TYPE_DEFAULT, "deviceConfig,%d,hwConfig,%d,dylibIfc,%d", (uint8_t *)v18, 0x14u);
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)testTimeMarkGpio:(id *)a3
{
  GpsFactoryTest *fTestDevice;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  const __CFString *v9;
  void *__p[2];
  char v12;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = (GpsFactoryTest *)self->_fTestDevice;
  if (fTestDevice)
    v6 = GpsFactoryTest::testTimeMark(fTestDevice);
  else
    v6 = forkProcessGpsTest((uint64_t)__p, (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("--time-mark"), CFSTR("10000"), 0));
  v7 = v6;
  if (v6 == 1)
  {
    if (a3)
      *a3 = 0;
  }
  else
  {
    if (v6 > 8)
    {
      v8 = 0;
      v9 = CFSTR("Success");
    }
    else
    {
      v8 = dword_2293F7004[v6];
      v9 = off_24F20B168[v6];
    }
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, v8, CFSTR("%@"), v9);
  }
  if (v12 < 0)
    operator delete(__p[0]);
  return v7 == 1;
}

- (BOOL)testApSignalGpio:(id *)a3
{
  GpsFactoryTest *fTestDevice;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  const __CFString *v8;
  void *__p[2];
  uint64_t v11;

  __p[0] = 0;
  __p[1] = 0;
  v11 = 0;
  fTestDevice = (GpsFactoryTest *)self->_fTestDevice;
  if (fTestDevice)
    v5 = GpsFactoryTest::testApSignal(fTestDevice);
  else
    v5 = forkProcessGpsTest((uint64_t)__p, (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("--host-wake"), CFSTR("1000"), 0));
  v6 = v5;
  if (v5 == 1)
  {
    if (a3)
      *a3 = 0;
  }
  else
  {
    if (v5 > 8)
    {
      v7 = 0;
      v8 = CFSTR("Success");
    }
    else
    {
      v7 = dword_2293F7004[v5];
      v8 = off_24F20B168[v5];
    }
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, v7, CFSTR("%@"), v8);
  }
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  return v6 == 1;
}

- (BOOL)testCommPing:(id)a3 error:(id *)a4
{
  return -[GpsDevice testCommPing:id:error:](self, "testCommPing:id:error:", 0, 0, a4);
}

- (BOOL)testCommPing:(id *)a3 id:(id *)a4 error:(id *)a5
{
  void *fTestDevice;
  unsigned int v10;
  int64_t v11;
  std::string *p_str;
  std::string *p_p;
  int64_t size;
  int64_t v15;
  std::string::size_type v16;
  std::string::size_type v17;
  char *v18;
  int64_t v19;
  std::string *v20;
  int64_t v21;
  char *v22;
  int v23;
  std::string *v24;
  int64_t v25;
  char *v26;
  char *v27;
  std::string::size_type v28;
  int64_t v29;
  std::string *v30;
  std::string *v31;
  std::string *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  std::string *v37;
  char *v39;
  int v40;
  std::string *v41;
  int64_t v42;
  char *v43;
  char *v44;
  std::string v45;
  void *v46;
  int64_t v47;
  unsigned __int8 v48;
  std::string v49;
  std::string __p;
  std::string __str;
  _BYTE v52[9];

  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    v10 = GpsFactoryTest::testCommPing((uint64_t)fTestDevice);
  }
  else
  {
    v10 = forkProcessGpsTest((uint64_t)&__str, (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("--ping"), CFSTR("1000"), 0));
    std::string::basic_string[abi:ne180100]<0>(&__p, "commPing result: ");
    v11 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_str = &__str;
    else
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    if (size)
    {
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v11 = __str.__r_.__value_.__l.__size_;
      if (v11 >= size)
      {
        v22 = (char *)p_str + v11;
        v23 = p_p->__r_.__value_.__s.__data_[0];
        v24 = p_str;
        do
        {
          v25 = v11 - size;
          if (v25 == -1)
            break;
          v26 = (char *)memchr(v24, v23, v25 + 1);
          if (!v26)
            break;
          v27 = v26;
          if (!memcmp(v26, p_p, size))
          {
            if (v27 != v22)
            {
              v15 = v27 - (char *)p_str;
              if (v27 - (char *)p_str != -1)
                goto LABEL_18;
            }
            break;
          }
          v24 = (std::string *)(v27 + 1);
          v11 = v22 - (v27 + 1);
        }
        while (v11 >= size);
      }
      MEMORY[0x22E2C8BA4](&__str, "");
    }
    else
    {
      v15 = 0;
LABEL_18:
      std::string::basic_string(&v49, &__str, v15 + size, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v46);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      __str = v49;
      v16 = std::string::find(&__str, 10, 0);
      std::string::basic_string(&v49, &__str, 0, v16, (std::allocator<char> *)&v46);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      __str = v49;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  std::string::basic_string[abi:ne180100]<0>(&v49, "");
  if (v10 == 1)
  {
    v17 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v17 = __str.__r_.__value_.__l.__size_;
    if (v17)
    {
      v18 = (char *)&v46;
      std::string::basic_string[abi:ne180100]<0>(&v46, " ID:");
      v19 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v20 = &__str;
      else
        v20 = (std::string *)__str.__r_.__value_.__r.__words[0];
      if ((v48 & 0x80u) == 0)
      {
        v21 = v48;
      }
      else
      {
        v18 = (char *)v46;
        v21 = v47;
      }
      if (v21)
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v19 = __str.__r_.__value_.__l.__size_;
        if (v19 >= v21)
        {
          v39 = (char *)v20 + v19;
          v40 = *v18;
          v41 = v20;
          do
          {
            v42 = v19 - v21;
            if (v42 == -1)
              break;
            v43 = (char *)memchr(v41, v40, v42 + 1);
            if (!v43)
              break;
            v44 = v43;
            if (!memcmp(v43, v18, v21))
            {
              if (v44 != v39)
              {
                v28 = v44 - (char *)v20;
                if (v44 - (char *)v20 != -1)
                  goto LABEL_47;
              }
              break;
            }
            v41 = (std::string *)(v44 + 1);
            v19 = v39 - (v44 + 1);
          }
          while (v19 >= v21);
        }
        std::string::operator=(&__p, &__str);
      }
      else
      {
        v28 = 0;
LABEL_47:
        std::string::basic_string(&v45, &__str, 0, v28, (std::allocator<char> *)v52);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        __p = v45;
        v29 = v48;
        if ((v48 & 0x80u) != 0)
          v29 = v47;
        std::string::basic_string(&v45, &__str, v29 + v28, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v52);
        if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v49.__r_.__value_.__l.__data_);
        v49 = v45;
      }
      if ((char)v48 < 0)
        operator delete(v46);
    }
  }
  v30 = &__p;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
  v31 = &v49;
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v31 = (std::string *)v49.__r_.__value_.__r.__words[0];
  NSLog(CFSTR("localResults,%s,ID,%s"), v30, v31);
  if (v10 == 1)
  {
    if (a5)
      *a5 = 0;
    if (!a3)
    {
LABEL_79:
      if (!a4)
        goto LABEL_87;
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
      {
        if (v49.__r_.__value_.__l.__size_)
        {
          v37 = (std::string *)v49.__r_.__value_.__r.__words[0];
          goto LABEL_85;
        }
      }
      else if (*((_BYTE *)&v49.__r_.__value_.__s + 23))
      {
        v37 = &v49;
LABEL_85:
        v35 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v37);
        goto LABEL_86;
      }
LABEL_73:
      v35 = 0;
LABEL_86:
      *a4 = v35;
      goto LABEL_87;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_)
      {
        v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
        goto LABEL_76;
      }
    }
    else if (*((_BYTE *)&__p.__r_.__value_.__s + 23))
    {
      v32 = &__p;
LABEL_76:
      v36 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v32);
LABEL_78:
      *a3 = v36;
      goto LABEL_79;
    }
    v36 = 0;
    goto LABEL_78;
  }
  if (v10 > 8)
  {
    v33 = 0;
    v34 = CFSTR("Success");
  }
  else
  {
    v33 = dword_2293F7004[v10];
    v34 = off_24F20B168[v10];
  }
  +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a5, v33, CFSTR("%@"), v34);
  if (a3)
    *a3 = 0;
  if (a4)
    goto LABEL_73;
LABEL_87:
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v49.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  return v10 == 1;
}

- (BOOL)testGpsCw:(id)a3 error:(id *)a4
{
  void *fTestDevice;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  const __CFString *v14;
  void *__p[2];
  char v17;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    v7 = GpsFactoryTest::testCw((uint64_t)fTestDevice, 10000.0, (uint64_t)__p, 10, 2, 0, 0xFFFFFFFFLL);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10000);
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10000);
    v7 = forkProcessGpsTest((uint64_t)__p, (void *)objc_msgSend(v8, "arrayWithObjects:", CFSTR("--cw"), v9, CFSTR("--bandwidth"), v10, CFSTR("--band"), v11, CFSTR("--subband"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10000), 0));
  }
  v12 = v7;
  if (v7 == 1)
  {
    if (a4)
      *a4 = 0;
  }
  else
  {
    if (v7 > 8)
    {
      v13 = 0;
      v14 = CFSTR("Success");
    }
    else
    {
      v13 = dword_2293F7004[v7];
      v14 = off_24F20B168[v7];
    }
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a4, v13, CFSTR("%@"), v14);
  }
  if (v17 < 0)
    operator delete(__p[0]);
  return v12 == 1;
}

- (BOOL)testGpsModulated:(id)a3 gpsPrn:(int)a4 error:(id *)a5
{
  void *fTestDevice;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  const __CFString *v15;
  void *__p[2];
  char v18;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    v9 = GpsFactoryTest::testModulated((uint64_t)fTestDevice, (uint64_t)__p, 10, 2, a4);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10000);
    v9 = forkProcessGpsTest((uint64_t)__p, (void *)objc_msgSend(v10, "arrayWithObjects:", CFSTR("--modulated"), v11, CFSTR("--band"), v12, CFSTR("--subband"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10000), 0));
  }
  v13 = v9;
  if (v9 == 1)
  {
    if (a5)
      *a5 = 0;
  }
  else
  {
    if (v9 > 8)
    {
      v14 = 0;
      v15 = CFSTR("Success");
    }
    else
    {
      v14 = dword_2293F7004[v9];
      v15 = off_24F20B168[v9];
    }
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a5, v14, CFSTR("%@"), v15);
  }
  if (v18 < 0)
    operator delete(__p[0]);
  return v13 == 1;
}

- (BOOL)testPeriodic:(id)a3 error:(id *)a4
{
  void *fTestDevice;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  int v10;
  void **v11;
  uint64_t v12;
  void **v13;
  uint64_t v14;
  const __CFString *v15;
  void *__p[2];
  char v18;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
    v7 = GpsFactoryTest::testPeriodicFix((uint64_t)fTestDevice, (uint64_t)__p, 10);
  else
    v7 = forkProcessGpsTest((uint64_t)__p, (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("--periodic"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10), 0));
  v8 = v7;
  if (v7 == 1)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = v18;
    v11 = (void **)__p[0];
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding");
    if (v10 >= 0)
      v13 = __p;
    else
      v13 = v11;
    objc_msgSend(v9, "stringWithCString:encoding:", v13, v12);
    *a4 = 0;
  }
  else
  {
    if (v7 > 8)
    {
      v14 = 0;
      v15 = CFSTR("Success");
    }
    else
    {
      v14 = dword_2293F7004[v7];
      v15 = off_24F20B168[v7];
    }
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a4, v14, CFSTR("%@"), v15);
  }
  if (v18 < 0)
    operator delete(__p[0]);
  return v8 == 1;
}

- (BOOL)testPowerMode:(unsigned __int8)a3 error:(id *)a4
{
  void *fTestDevice;
  unsigned int v6;
  uint64_t v7;
  const __CFString *v8;
  void *__p[2];
  uint64_t v11;

  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    v6 = GpsFactoryTest::testPowerMode((uint64_t)fTestDevice, 4 * (a3 != 0));
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v11 = 0;
    v6 = forkProcessGpsTest((uint64_t)__p, (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("--power-mode"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 4 * (a3 != 0)), 0));
    if (SHIBYTE(v11) < 0)
      operator delete(__p[0]);
  }
  if (v6 == 1)
  {
    if (a4)
      *a4 = 0;
  }
  else
  {
    if (v6 > 8)
    {
      v7 = 0;
      v8 = CFSTR("Success");
    }
    else
    {
      v7 = dword_2293F7004[v6];
      v8 = off_24F20B168[v6];
    }
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a4, v7, CFSTR("%@"), v8);
  }
  return v6 == 1;
}

- (BOOL)testExternalFreqAssistance:(id *)a3
{
  void *fTestDevice;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  const __CFString *v8;
  void *__p[2];
  uint64_t v11;

  __p[0] = 0;
  __p[1] = 0;
  v11 = 0;
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
    v5 = GpsFactoryTest::testPeriodicFix((uint64_t)fTestDevice, (uint64_t)__p, 10);
  else
    v5 = forkProcessGpsTest((uint64_t)__p, (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("--periodic"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 10), 0));
  v6 = v5;
  if (v5 == 1)
  {
    if (a3)
      *a3 = 0;
  }
  else
  {
    if (v5 > 8)
    {
      v7 = 0;
      v8 = CFSTR("Success");
    }
    else
    {
      v7 = dword_2293F7004[v5];
      v8 = off_24F20B168[v5];
    }
    +[GpsError setError:withCode:format:](GpsError, "setError:withCode:format:", a3, v7, CFSTR("%@"), v8);
  }
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  return v6 == 1;
}

- (void)flushLogs
{
  NSObject *v3;
  void *fTestDevice;
  VendorLogger *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[GpsDevice flushLogs]";
    _os_log_impl(&dword_2293C9000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }
  fTestDevice = self->_fTestDevice;
  if (fTestDevice)
  {
    v5 = (VendorLogger *)*((_QWORD *)fTestDevice + 67);
    if (v5)
      VendorLogger::flush(v5);
  }
}

- (void)fTestDevice
{
  return self->_fTestDevice;
}

- (void)setFTestDevice:(void *)a3
{
  self->_fTestDevice = a3;
}

- (Options)fTestOptions
{
  uint64_t v1;
  Options *result;

  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 16), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)setFTestOptions:(Options *)a3
{
  objc_copyCppObjectAtomic(&self->_fTestOptions, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (void).cxx_destruct
{
  if (SHIBYTE(self[4]._fTestDevice) < 0)
    operator delete((void *)self[3]._fTestOptions.uartPortName.var0);
  if (*((char *)&self[3]._fTestOptions.uartPortName.__r_.var1 + 3) < 0)
    operator delete((void *)self[3]._fTestOptions.uartPortName.__r_.__value_.var0.var1.__size_);
  if (SHIBYTE(self[3]._fTestDevice) < 0)
    operator delete((void *)self[2]._fTestOptions.uartPortName.var0);
  if (SHIBYTE(self[1].super.isa) < 0)
    operator delete(*(void **)&self->_fTestOptions.uartPortName.__r_.var0);
  if (*((char *)&self->_fTestOptions.uartPortName.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_fTestOptions.uartPortName.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_QWORD *)self + 8) = 6;
  *((_QWORD *)self + 9) = 0;
  *((_BYTE *)self + 80) = 1;
  *((_BYTE *)self + 96) = 0;
  *(_QWORD *)((char *)self + 81) = 0;
  *(_DWORD *)((char *)self + 89) = 0;
  *(_QWORD *)((char *)self + 108) = 0;
  *(_QWORD *)((char *)self + 100) = 0;
  *((_DWORD *)self + 29) = -1;
  *((_BYTE *)self + 120) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 20) = 0;
  *(_OWORD *)((char *)self + 124) = 0u;
  *(_OWORD *)((char *)self + 140) = 0u;
  *((_DWORD *)self + 46) = 115200;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  return self;
}

@end
