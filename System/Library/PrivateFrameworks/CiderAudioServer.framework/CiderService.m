@implementation CiderService

+ (void)StartService
{
  util *v2;
  NSObject *v3;
  const char *v4;
  char *v5;
  void *v6;
  CiderDelegate *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  util *v16;
  NSObject *v17;
  util *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  InCider::InstanceOpt((InCider *)a1);
  if (byte_2568727E8)
  {
    util::server_log(v2);
    v3 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315394;
    v22 = "InCider.mm";
    v23 = 1024;
    v24 = 25;
    v4 = "%25s:%-5d Request to launch InCider but it is already running => no-op";
    goto LABEL_18;
  }
  InCider::InstanceOpt(v2);
  if (byte_2568727E8)
  {
    InCider::~InCider((id **)&InCider::InstanceOpt(void)::theInstance);
    byte_2568727E8 = 0;
  }
  v5 = (char *)operator new(0x58uLL);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = &off_2509A24A0;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  InCider::InstanceOpt(void)::theInstance = (uint64_t)(v5 + 24);
  *(_QWORD *)algn_2568727D8 = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.virtualaudio.cider"));
  v7 = [CiderDelegate alloc];
  v19 = InCider::InstanceOpt(void)::theInstance;
  v20 = *(std::__shared_weak_count **)algn_2568727D8;
  if (*(_QWORD *)algn_2568727D8)
  {
    v8 = (unint64_t *)(*(_QWORD *)algn_2568727D8 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = -[CiderDelegate init:](v7, "init:", &v19);
  v11 = (_QWORD *)operator new();
  v12 = v6;
  *v11 = v12;
  v11[1] = v10;
  qword_2568727E0 = (uint64_t)v11;
  v13 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  util::server_log(v16);
  v17 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "InCider.mm";
    v23 = 1024;
    v24 = 939;
    _os_log_impl(&dword_237B88000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d InCider object constructed", buf, 0x12u);
  }
  objc_msgSend(*(id *)qword_2568727E0, "setDelegate:", *(_QWORD *)(qword_2568727E0 + 8), v19);
  v18 = (util *)objc_msgSend(*(id *)qword_2568727E0, "activate");
  byte_2568727E8 = 1;
  util::server_log(v18);
  v3 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "InCider.mm";
    v23 = 1024;
    v24 = 38;
    v4 = "%25s:%-5d Launched InCider service";
LABEL_18:
    _os_log_impl(&dword_237B88000, v3, OS_LOG_TYPE_ERROR, v4, buf, 0x12u);
  }
}

+ (void)StopService
{
  util *v2;
  util *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  InCider::InstanceOpt((InCider *)a1);
  if (!byte_2568727E8)
  {
    util::server_log(v2);
    v4 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return;
    v6 = 136315394;
    v7 = "InCider.mm";
    v8 = 1024;
    v9 = 45;
    v5 = "%25s:%-5d Request to shut down InCider but it is not running => no-op";
    goto LABEL_8;
  }
  InCider::InstanceOpt(v2);
  if (byte_2568727E8)
  {
    InCider::~InCider((id **)&InCider::InstanceOpt(void)::theInstance);
    *((_BYTE *)v3 + 24) = 0;
  }
  util::server_log(v3);
  v4 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "InCider.mm";
    v8 = 1024;
    v9 = 58;
    v5 = "%25s:%-5d Shut down InCider service";
LABEL_8:
    _os_log_impl(&dword_237B88000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x12u);
  }
}

+ (BOOL)ServiceIsRunning
{
  InCider::InstanceOpt((InCider *)a1);
  return byte_2568727E8;
}

+ (void)SendRouteConfiguration:(id)a3 withError:(id *)a4
{
  applesauce::CF::DictionaryRef *v5;
  InCider *v6;
  CFTypeRef v7;
  util *v8;
  const void *v9;
  util *v10;
  NSObject *v11;
  const char *v12;
  applesauce::CF::DictionaryRef *cf;
  CFTypeRef v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  cf = (applesauce::CF::DictionaryRef *)a3;
  if (!+[CiderService ServiceIsRunning](CiderService, "ServiceIsRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("InCider"), 1937010544, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v5 = cf;
  if (cf)
  {
    CFRetain(cf);
    v5 = applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v14, cf);
  }
  else
  {
    v14 = 0;
  }
  InCider::InstanceOpt(v5);
  v7 = v14;
  if (v14)
    v6 = (InCider *)CFRetain(v14);
  InCider::InstanceOpt(v6);
  if (byte_2568727E8)
  {
    v9 = *(const void **)InCider::InstanceOpt(void)::theInstance;
    *(_QWORD *)InCider::InstanceOpt(void)::theInstance = v7;
    if (v7)
      v8 = (util *)CFRetain(v7);
    if (v9)
      CFRelease(v9);
    if (*(_BYTE *)(InCider::InstanceOpt(void)::theInstance + 16))
    {
      v10 = (util *)(*(uint64_t (**)(void))(*(_QWORD *)(InCider::InstanceOpt(void)::theInstance + 8) + 16))();
      util::server_log(v10);
      v11 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        v17 = 1024;
        v18 = 904;
        v12 = "%25s:%-5d Stored route configuration and reported to OutCider";
LABEL_18:
        _os_log_impl(&dword_237B88000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
      }
    }
    else
    {
      util::server_log(v8);
      v11 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        v17 = 1024;
        v18 = 908;
        v12 = "%25s:%-5d Stored route configuration, no reporter present";
        goto LABEL_18;
      }
    }
  }
  if (v7)
    CFRelease(v7);
  if (v14)
    CFRelease(v14);
LABEL_23:

}

+ (void)SendSessionConfiguration:(id)a3 withError:(id *)a4
{
  applesauce::CF::DictionaryRef *v5;
  InCider *v6;
  CFTypeRef v7;
  util *v8;
  const void *v9;
  util *v10;
  NSObject *v11;
  const char *v12;
  applesauce::CF::DictionaryRef *cf;
  CFTypeRef v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  cf = (applesauce::CF::DictionaryRef *)a3;
  if (!+[CiderService ServiceIsRunning](CiderService, "ServiceIsRunning"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("InCider"), 1937010544, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v5 = cf;
  if (cf)
  {
    CFRetain(cf);
    v5 = applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v14, cf);
  }
  else
  {
    v14 = 0;
  }
  InCider::InstanceOpt(v5);
  v7 = v14;
  if (v14)
    v6 = (InCider *)CFRetain(v14);
  InCider::InstanceOpt(v6);
  if (byte_2568727E8)
  {
    v9 = *(const void **)(InCider::InstanceOpt(void)::theInstance + 32);
    *(_QWORD *)(InCider::InstanceOpt(void)::theInstance + 32) = v7;
    if (v7)
      v8 = (util *)CFRetain(v7);
    if (v9)
      CFRelease(v9);
    if (*(_BYTE *)(InCider::InstanceOpt(void)::theInstance + 48))
    {
      v10 = (util *)(*(uint64_t (**)(void))(*(_QWORD *)(InCider::InstanceOpt(void)::theInstance + 40) + 16))();
      util::server_log(v10);
      v11 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        v17 = 1024;
        v18 = 921;
        v12 = "%25s:%-5d Stored session configuration and reported to OutCider";
LABEL_18:
        _os_log_impl(&dword_237B88000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
      }
    }
    else
    {
      util::server_log(v8);
      v11 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "InCider.mm";
        v17 = 1024;
        v18 = 925;
        v12 = "%25s:%-5d Stored session configuration, no reporter present";
        goto LABEL_18;
      }
    }
  }
  if (v7)
    CFRelease(v7);
  if (v14)
    CFRelease(v14);
LABEL_23:

}

+ (BOOL)IsSimulatedDevice:(unsigned int)a3
{
  return icp::IsSimulatedDevice(*(icp **)&a3);
}

@end
