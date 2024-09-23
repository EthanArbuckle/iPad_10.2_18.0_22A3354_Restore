@implementation AVAudioSessionServerPriv

- (tuple<int,)getDescriptionForSession:(int> *__return_ptr)retstr
{
  unsigned int v2;
  tuple<int, std::string, int> *result;
  unsigned int v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  char *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t i;
  as::server *v20;
  NSObject *v21;
  void **v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *__p[2];
  char v27;
  _BYTE v28[8];
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  _BYTE buf[28];
  __int16 v33;
  const char *v34;
  __int16 v35;
  unint64_t v36;
  _BYTE v37[10];
  void *v38;
  uint64_t *v39;
  void **v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (v2 != 0 && v2 < 0xFFFFFFFC)
  {
    v5 = v2;
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v30, v2);
    v6 = v30;
    if (v30)
    {
      *(_QWORD *)buf = v30;
      *(_QWORD *)&buf[8] = v31;
      if (v31)
      {
        v7 = (unint64_t *)(v31 + 1);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      v9 = (char *)(v6 + 176);
      if (*(char *)(v6 + 199) < 0)
        v9 = *(char **)v9;
      v10 = (std::__shared_weak_count *)v31;
      v38 = (void *)v6;
      v39 = v31;
      if (v31)
      {
        v11 = (unint64_t *)(v31 + 1);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
      v13 = *(_DWORD *)(v6 + 88);
      retstr->var0.var0 = 0;
      result = (tuple<int, std::string, int> *)std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, v9);
      retstr->var0.var1.__r_.var0 = v13;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      v16 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v17 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(_QWORD *)&buf[16] = buf;
      buf[24] = 1;
      BYTE2(v34) = 6;
      v36 = v5;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v34 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v34 + 2);
      *(_QWORD *)v37 = (char *)&v34 + 2;
      v37[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v38, (uint64_t)buf, 2, 1, 2);
      v40 = &v38;
      v41 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v28, (uint64_t)&v38, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v38);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v39, v38);
      for (i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v34 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v37[i - 8], *((unsigned __int8 *)&v34 + i + 2));
      }
      v21 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v20));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v38 = 0;
        v39 = 0;
        v40 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v28, -1, 0x20u, 0, 0, __p);
        if (v27 >= 0)
          v22 = __p;
        else
          v22 = (void **)__p[0];
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAudioSessionServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 194;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "get_description";
        v33 = 2080;
        v34 = "Session lookup failed";
        v35 = 2080;
        v36 = (unint64_t)&v38;
        *(_WORD *)v37 = 2080;
        *(_QWORD *)&v37[2] = v22;
        _os_log_impl(&dword_1C895C000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v27 < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v40) < 0)
          operator delete(v38);
      }

      retstr->var0.var0 = 561210739;
      std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
      retstr->var0.var1.__r_.var0 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
    }
    v23 = (std::__shared_weak_count *)v31;
    if (v31)
    {
      v24 = (unint64_t *)(v31 + 1);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
  }
  else
  {
    retstr->var0.var0 = -50;
    result = (tuple<int, std::string, int> *)std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
    retstr->var0.var1.__r_.var0 = 0;
  }
  return result;
}

- (void)getDefaultMXSession:(unsigned int)a3
{
  void *v3;
  as::server::ConstAudioSessionInfo *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t i;
  as::server *v12;
  NSObject *v13;
  void **v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *__p[2];
  char v20;
  _BYTE v21[8];
  uint64_t *v22;
  as::server::ConstAudioSessionInfo *v23;
  std::__shared_weak_count *v24;
  _BYTE cf[12];
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  const char *v29;
  __int16 v30;
  void **v31;
  _BYTE v32[10];
  void *v33;
  uint64_t *v34;
  void **v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3 + 4 < 5)
    return 0;
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v23, a3);
  v5 = v23;
  if (v23)
  {
    v6 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v5, cf);
    v3 = *(void **)cf;
    if (*(_QWORD *)cf)
      CFRelease(*(CFTypeRef *)cf);
    if (v6)
    {
      v9 = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  else
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)cf, "sessionID");
    *(_QWORD *)&v27[2] = cf;
    v27[10] = 1;
    BYTE2(v29) = 6;
    v31 = (void **)a3;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29 + 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29 + 2);
    *(_QWORD *)v32 = (char *)&v29 + 2;
    v32[8] = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v33, (uint64_t)cf, 2, 1, 2);
    v35 = &v33;
    v36 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v21, (uint64_t)&v33, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v33);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v34, v33);
    for (i = 0; i != -64; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29 + i + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v32[i - 8], *((unsigned __int8 *)&v29 + i + 2));
    }
    v13 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v12));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v33 = 0;
      v34 = 0;
      v35 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v21, -1, 0x20u, 0, 0, __p);
      if (v20 >= 0)
        v14 = __p;
      else
        v14 = (void **)__p[0];
      *(_DWORD *)cf = 136316418;
      *(_QWORD *)&cf[4] = "AVAudioSessionServer.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 177;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "get_mx_session";
      v28 = 2080;
      v29 = "Session lookup failed";
      v30 = 2080;
      v31 = &v33;
      *(_WORD *)v32 = 2080;
      *(_QWORD *)&v32[2] = v14;
      _os_log_impl(&dword_1C895C000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", cf, 0x3Au);
      if (v20 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v35) < 0)
        operator delete(v33);
    }

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v22, v21[0]);
    v3 = 0;
  }
  v15 = v24;
  if (v24)
  {
    v16 = (unint64_t *)&v24->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v3;
}

- (id)createTimestampWriterForDevice:(id)a3 halID:(unsigned int)a4 isDecoupledInput:(BOOL)a5
{
  as::server::LegacySessionManager *v7;
  _QWORD *v8;
  uint64_t v9;
  as::server::LegacySessionManager *v10;
  as::server::LegacySessionManager *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v15;
  CFTypeRef cf;
  BOOL v17;
  _QWORD v18[2];

  v7 = (as::server::LegacySessionManager *)a3;
  v8 = as::server::LegacySessionManager::Instance(v7);
  v9 = v8[31];
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8[31]);
    v15 = a4;
    v10 = v7;
    v11 = v10;
    if (v10)
      CFRetain(v10);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v11);

    v17 = a5;
    v12 = mach_absolute_time();
    v18[0] = as::server::DeviceTimeObserver::createDevice((uint64_t *)(v9 + 8), (uint64_t)&v15, v12);
    v18[1] = v13;
    if (cf)
      CFRelease(cf);
    os_unfair_lock_unlock((os_unfair_lock_t)v9);
    as::server::DeviceTimeObserver::DeviceSlot::timestampWriter((as::server::DeviceTimeObserver::DeviceSlot *)v18);
    v9 = objc_claimAutoreleasedReturnValue();
  }

  return (id)v9;
}

- (void)generateIOControllerEvent:(unint64_t)a3 forDevice:(unsigned int)a4
{
  void *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  void *v9;
  void *__p;
  void *v11;

  v6 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  v7 = *((_QWORD *)v6 + 31);
  if (v7)
  {
    v8 = (os_unfair_lock_s *)v6;
    os_unfair_lock_lock(*((os_unfair_lock_t *)v6 + 31));
    as::server::DeviceTimeObserver::sessionsObservingDeviceEvent((uint64_t *)(v7 + 8), a4, a3, (uint64_t)&__p);
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
    v9 = __p;
    if (__p != v11)
    {
      as::server::LegacySessionManager::GenerateIOControllerEventForSessions(v8, a3, (int **)&__p);
      v9 = __p;
    }
    if (v9)
    {
      v11 = v9;
      operator delete(v9);
    }
  }
}

- (int)setClientMuteState:(BOOL)a3 sessionID:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(void *)a6
{
  return as::server::require_acq::AudioSessionServerSetClientMuteState(*(AudioSession **)&a4, a5, a6, a3);
}

- (void)mapSession:(unsigned int)a3 isInput:(BOOL)a4 toDevice:(id)a5
{
  _BOOL4 v5;
  as::server::LegacySessionManager *v7;
  void *v8;
  uint64_t v9;
  as::server::LegacySessionManager *v10;
  as::server::LegacySessionManager *v11;
  uint64_t v12;
  CFTypeRef cf;

  v5 = a4;
  v7 = (as::server::LegacySessionManager *)a5;
  v8 = as::server::LegacySessionManager::Instance(v7);
  v9 = *((_QWORD *)v8 + 31);
  if (v9)
  {
    os_unfair_lock_lock(*((os_unfair_lock_t *)v8 + 31));
    v10 = v7;
    v11 = v10;
    if (v10)
      CFRetain(v10);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v11);

    v12 = mach_absolute_time();
    as::server::DeviceTimeObserver::mapSessionToDevice((uint64_t *)(v9 + 8), a3, v5, (const __CFString **)&cf, v12);
    if (cf)
      CFRelease(cf);
    os_unfair_lock_unlock((os_unfair_lock_t)v9);
  }

}

- (tuple<int,)setPlayState:(unsigned int)a3 sessionID:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(void *)a6 modes:(unsigned int)a7 subsessionRef:(void *)a8
{
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v11[2];
  tuple<int, AudioSessionDuckingInfo> result;

  memset(v11, 0, 12);
  v8 = as::server::require_acq::AudioSessionServerSetClientPlayState(*(AudioSession **)&a4, a5, (AudioSession *)a6, *(AudioSession **)&a7, a3, (char *)v11, (uint64_t)a8);
  v9 = *(_QWORD *)((char *)v11 + 4);
  v10 = v8 | ((unint64_t)LODWORD(v11[0]) << 32);
  *(_QWORD *)&result.var0.var1.var1 = v9;
  *(_QWORD *)&result.var0.var0 = v10;
  return result;
}

- (void)sampleRateChanged:(double)a3 forDevice:(unsigned int)a4
{
  void *v6;
  os_unfair_lock_s *v7;
  as::server *PropertyData;
  NSObject *v9;
  as::server *v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  AudioObjectPropertyAddress v14;
  uint64_t inAddress;
  uint64_t inAddress_8;
  int outData;
  UInt32 ioDataSize;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  v7 = (os_unfair_lock_s *)*((_QWORD *)v6 + 31);
  if (v7)
  {
    os_unfair_lock_lock(*((os_unfair_lock_t *)v6 + 31));
    as::server::DeviceTimeObserver::setSampleRate((uint64_t)&v7[2], a4, a3);
    os_unfair_lock_unlock(v7);
    outData = 0;
    ioDataSize = 4;
    inAddress = *(_QWORD *)"tlwhptuo";
    inAddress_8 = 0;
    *(_QWORD *)&v14.mSelector = *(_QWORD *)"tlwhtpni";
    v14.mElement = 0;
    PropertyData = (as::server *)AudioObjectGetPropertyData(a4, (const AudioObjectPropertyAddress *)&inAddress, 0, 0, &ioDataSize, &outData);
    if ((_DWORD)PropertyData)
    {
      v9 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(PropertyData));
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSessionServer.mm";
      v21 = 1024;
      v22 = 458;
LABEL_8:
      _os_log_impl(&dword_1C895C000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to get output device constant latency", buf, 0x12u);
      return;
    }
    v10 = (as::server *)AudioObjectGetPropertyData(a4, &v14, 0, 0, &ioDataSize, (char *)&inAddress_8 + 4);
    if ((_DWORD)v10)
    {
      v9 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v10));
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSessionServer.mm";
      v21 = 1024;
      v22 = 464;
      goto LABEL_8;
    }
    os_unfair_lock_lock(v7);
    LODWORD(v11) = HIDWORD(inAddress_8);
    v12 = 1000000000.0 / a3 * (double)v11;
    v13 = llround(v12);
    LODWORD(v12) = outData;
    as::server::DeviceTimeObserver::setFixedLatency((uint64_t)&v7[2], a4, v13, llround(1000000000.0 / a3 * (double)*(unint64_t *)&v12));
    os_unfair_lock_unlock(v7);
  }
}

- (tuple<int,)checkBooleanEntitlementForSession:(unsigned int)a3 entitlementIdentifier:(const char *)a4
{
  uint64_t HasBooleanEntitlement;
  uint64_t v5;
  as::server::ConstAudioSessionInfo *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t i;
  as::server *v15;
  NSObject *v16;
  void **v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  void *__p[2];
  char v23;
  _BYTE v24[8];
  uint64_t *v25;
  as::server::ConstAudioSessionInfo *v26;
  std::__shared_weak_count *v27;
  _BYTE buf[28];
  __int16 v29;
  const char *v30;
  __int16 v31;
  void **v32;
  _BYTE v33[10];
  void *v34;
  uint64_t *v35;
  void **v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3 + 4 >= 5)
  {
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v26, a3);
    v8 = v26;
    if (v26)
    {
      v9 = v27;
      *(_QWORD *)buf = v26;
      *(_QWORD *)&buf[8] = v27;
      if (v27)
      {
        p_shared_owners = (unint64_t *)&v27->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      HasBooleanEntitlement = as::server::ConstAudioSessionInfo::HasBooleanEntitlement(v8, a4);
      if (v9)
      {
        v12 = (unint64_t *)&v9->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v5 = 0;
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(_QWORD *)&buf[16] = buf;
      buf[24] = 1;
      BYTE2(v30) = 6;
      v32 = (void **)a3;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30 + 2);
      *(_QWORD *)v33 = (char *)&v30 + 2;
      v33[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v34, (uint64_t)buf, 2, 1, 2);
      v36 = &v34;
      v37 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v24, (uint64_t)&v34, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v34);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v35, v34);
      for (i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v33[i - 8], *((unsigned __int8 *)&v30 + i + 2));
      }
      v16 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v15));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v34 = 0;
        v35 = 0;
        v36 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v24, -1, 0x20u, 0, 0, __p);
        if (v23 >= 0)
          v17 = __p;
        else
          v17 = (void **)__p[0];
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAudioSessionServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 156;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "check_BOOL_entitlement";
        v29 = 2080;
        v30 = "Session lookup failed";
        v31 = 2080;
        v32 = &v34;
        *(_WORD *)v33 = 2080;
        *(_QWORD *)&v33[2] = v17;
        _os_log_impl(&dword_1C895C000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v23 < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v36) < 0)
          operator delete(v34);
      }

      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v25, v24[0]);
      HasBooleanEntitlement = 0;
      v5 = 561210739;
    }
    v18 = v27;
    if (v27)
    {
      v19 = (unint64_t *)&v27->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else
  {
    HasBooleanEntitlement = 0;
    v5 = 4294967246;
  }
  return (tuple<int, BOOL>)(v5 | (HasBooleanEntitlement << 32));
}

- (opaqueCMSession)copyCMSession:(unsigned int)a3
{
  as::server::ConstAudioSessionInfo *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  opaqueCMSession *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t i;
  as::server *v12;
  NSObject *v13;
  void **v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *__p[2];
  char v20;
  _BYTE v21[8];
  uint64_t *v22;
  as::server::ConstAudioSessionInfo *v23;
  std::__shared_weak_count *v24;
  _BYTE cf[12];
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  const char *v29;
  __int16 v30;
  void **v31;
  _BYTE v32[10];
  void *v33;
  uint64_t *v34;
  void **v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v23, a3);
  v4 = v23;
  if (v23)
  {
    v5 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    as::server::ConstAudioSessionInfo::GetCMSessionRef(v4, cf);
    v8 = *(opaqueCMSession **)cf;
    if (*(_QWORD *)cf)
      CFRelease(*(CFTypeRef *)cf);
    if (v5)
    {
      v9 = (unint64_t *)&v5->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        if (!v8)
          goto LABEL_24;
        goto LABEL_12;
      }
    }
    if (v8)
LABEL_12:
      CFRetain(v8);
  }
  else
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)cf, "sessionID");
    *(_QWORD *)&v27[2] = cf;
    v27[10] = 1;
    BYTE2(v29) = 6;
    v31 = (void **)a3;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29 + 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29 + 2);
    *(_QWORD *)v32 = (char *)&v29 + 2;
    v32[8] = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v33, (uint64_t)cf, 2, 1, 2);
    v35 = &v33;
    v36 = 1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v21, (uint64_t)&v33, 1, 1, 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v33);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v34, v33);
    for (i = 0; i != -64; i -= 32)
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29 + i + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v32[i - 8], *((unsigned __int8 *)&v29 + i + 2));
    }
    v13 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v12));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v33 = 0;
      v34 = 0;
      v35 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v21, -1, 0x20u, 0, 0, __p);
      if (v20 >= 0)
        v14 = __p;
      else
        v14 = (void **)__p[0];
      *(_DWORD *)cf = 136316418;
      *(_QWORD *)&cf[4] = "AVAudioSessionServer.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 299;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "copy_CMSession";
      v28 = 2080;
      v29 = "Session lookup failed";
      v30 = 2080;
      v31 = &v33;
      *(_WORD *)v32 = 2080;
      *(_QWORD *)&v32[2] = v14;
      _os_log_impl(&dword_1C895C000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", cf, 0x3Au);
      if (v20 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v35) < 0)
        operator delete(v33);
    }

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v22, v21[0]);
    v8 = 0;
  }
LABEL_24:
  v15 = v24;
  if (v24)
  {
    v16 = (unint64_t *)&v24->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v8;
}

- (AVAudioSessionServerPriv)init
{
  AVAudioSessionServerPriv *v2;
  AVAudioSessionXPCServer *v3;
  AVAudioSessionXPCServer *xpcServer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAudioSessionServerPriv;
  v2 = -[AVAudioSessionServerPriv init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVAudioSessionXPCServer);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = v3;

  }
  return v2;
}

- (AVAudioSessionServerPriv)initWithAudioControlQueue:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AVAudioSessionServerPriv *v8;
  AVAudioSessionXPCServer *v9;
  AVAudioSessionXPCServer *xpcServer;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVAudioSessionServerPriv;
  v8 = -[AVAudioSessionServerPriv init](&v12, sel_init);
  if (v8)
  {
    as::server::SetAudioControlQueue(v6);
    v9 = -[AVAudioSessionXPCServer initWithDelegate:]([AVAudioSessionXPCServer alloc], "initWithDelegate:", v7);
    xpcServer = v8->_xpcServer;
    v8->_xpcServer = v9;

    objc_storeStrong((id *)&v8->_serverDelegate, a4);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDelegate, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
}

- (void)startXPCServer
{
  as::server::forbid_acq::SystemController::Instance((as::server::forbid_acq::SystemController *)self);
  -[AVAudioSessionXPCServer start](self->_xpcServer, "start");
}

- (int)activateWithFlags:(unsigned int)a3 auditToken:(id *)a4 flags:(unsigned int)a5
{
  return as::server::ff_acq::AudioSessionServerActivateWithFlags(self->_serverDelegate, *(AudioSession **)&a3, (uint64_t)a4, a5);
}

- (int)deactivateWithFlags:(unsigned int)a3 auditToken:(id *)a4 flags:(unsigned int)a5
{
  return as::server::ff_acq::AudioSessionServerDeactivateWithFlags(self->_serverDelegate, *(uint64_t *)&a3, (as::server::AudioSessionInfoAccessor *)a4, a5);
}

- (vector<unsigned)getSessionIDsForToken:(AVAudioSessionServerPriv *)self
{
  os_unfair_lock_s *v6;
  vector<unsigned int, std::allocator<unsigned int>> *result;

  v6 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::GetSessionIDsForToken(v6, (const audit_token_t *)a4, (char **)retstr);
  return result;
}

- (tuple<int,)getJSONDescriptionForSession:(int> *__return_ptr)retstr
{
  unsigned int v2;
  tuple<int, std::string, int> *result;
  unsigned int v5;
  char *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t i;
  as::server *v10;
  NSObject *v11;
  void **v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  int v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  void *__p[2];
  char v27;
  char v28[8];
  uint64_t *v29;
  char *v30;
  uint64_t *v31;
  _BYTE buf[28];
  __int16 v33;
  const char *v34;
  __int16 v35;
  unint64_t v36;
  _BYTE v37[10];
  char *v38;
  std::__shared_weak_count *v39;
  void **v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (v2 != 0 && v2 < 0xFFFFFFFC)
  {
    v5 = v2;
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v30, v2);
    v6 = v30;
    if (v30)
    {
      v38 = v30;
      v39 = (std::__shared_weak_count *)v31;
      if (v31)
      {
        v7 = (unint64_t *)(v31 + 1);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      if (v6[223] < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)buf, *((const std::string::value_type **)v6 + 25), *((_QWORD *)v6 + 26));
        v6 = v30;
        if (!v30)
        {
          v25 = _os_crash();
          as::server::require_acq::AudioSessionServerSetClientPlayState(v25);
        }
      }
      else
      {
        *(_OWORD *)buf = *(_OWORD *)(v6 + 200);
        *(_QWORD *)&buf[16] = *((_QWORD *)v6 + 27);
      }
      v13 = (std::__shared_weak_count *)v31;
      __p[0] = v6;
      __p[1] = v31;
      if (v31)
      {
        v14 = (unint64_t *)(v31 + 1);
        do
          v15 = __ldxr(v14);
        while (__stxr(v15 + 1, v14));
      }
      v16 = *((_DWORD *)v6 + 22);
      retstr->var0.var0 = 0;
      result = (tuple<int, std::string, int> *)&retstr->var0.var1;
      if ((buf[23] & 0x80000000) != 0)
      {
        std::string::__init_copy_ctor_external((std::string *)result, *(const std::string::value_type **)buf, *(std::string::size_type *)&buf[8]);
      }
      else
      {
        *(_OWORD *)&result->var0.var0 = *(_OWORD *)buf;
        *((_QWORD *)&retstr->var0.var1.__r_.__value_.var0.var1 + 2) = *(_QWORD *)&buf[16];
      }
      retstr->var0.var1.__r_.var0 = v16;
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v18 = __ldaxr(p_shared_owners);
        while (__stlxr(v18 - 1, p_shared_owners));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if ((buf[23] & 0x80000000) != 0)
        operator delete(*(void **)buf);
      v19 = v39;
      if (v39)
      {
        v20 = (unint64_t *)&v39->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(_QWORD *)&buf[16] = buf;
      buf[24] = 1;
      BYTE2(v34) = 6;
      v36 = v5;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v34 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v34 + 2);
      *(_QWORD *)v37 = (char *)&v34 + 2;
      v37[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v38, (uint64_t)buf, 2, 1, 2);
      v40 = (void **)&v38;
      v41 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v28, (uint64_t)&v38, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v38);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v39, v38);
      for (i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v34 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v37[i - 8], *((unsigned __int8 *)&v34 + i + 2));
      }
      v11 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v10));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v38 = 0;
        v39 = 0;
        v40 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v28, -1, 0x20u, 0, 0, __p);
        if (v27 >= 0)
          v12 = __p;
        else
          v12 = (void **)__p[0];
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAudioSessionServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 211;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "get_description";
        v33 = 2080;
        v34 = "Session lookup failed";
        v35 = 2080;
        v36 = (unint64_t)&v38;
        *(_WORD *)v37 = 2080;
        *(_QWORD *)&v37[2] = v12;
        _os_log_impl(&dword_1C895C000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v27 < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v40) < 0)
          operator delete(v38);
      }

      retstr->var0.var0 = 561210739;
      std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
      retstr->var0.var1.__r_.var0 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
    }
    v22 = (std::__shared_weak_count *)v31;
    if (v31)
    {
      v23 = (unint64_t *)(v31 + 1);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  else
  {
    retstr->var0.var0 = -50;
    result = (tuple<int, std::string, int> *)std::string::basic_string[abi:ne180100]<0>(&retstr->var0.var1.__r_.__value_.var0.var1.__data_, "");
    retstr->var0.var1.__r_.var0 = 0;
  }
  return result;
}

- (BOOL)interruptDummyPlayersForSession:(unsigned int)a3
{
  return as::server::require_acq::AudioSessionServerInterruptDummyPlayers(*(as::server::require_acq **)&a3) != 0;
}

- (tuple<int,)isSessionMuted:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  as::server::AudioSessionInfo *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t i;
  as::server *v13;
  NSObject *v14;
  void **v15;
  void *__p[2];
  char v18;
  _BYTE v19[8];
  uint64_t *v20;
  as::server::AudioSessionInfo *v21;
  std::__shared_weak_count *v22;
  _BYTE buf[28];
  __int16 v24;
  const char *v25;
  __int16 v26;
  void **v27;
  _BYTE v28[10];
  void *v29;
  uint64_t *v30;
  void **v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3 + 4 >= 5)
  {
    as::server::AudioSessionInfoAccessor::AudioSessionInfoAccessor((as::server::AudioSessionInfoAccessor *)&v21, a3);
    v6 = v21;
    if (v21)
    {
      v7 = v22;
      *(_QWORD *)buf = v21;
      *(_QWORD *)&buf[8] = v22;
      if (v22)
      {
        p_shared_owners = (unint64_t *)&v22->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }
      v3 = as::server::AudioSessionInfo::IsSessionInputMuted(v6) != 0;
      if (v7)
      {
        v10 = (unint64_t *)&v7->__shared_owners_;
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
      v4 = 0;
    }
    else
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[10],char [10],0>((uint64_t)buf, "sessionID");
      *(_QWORD *)&buf[16] = buf;
      buf[24] = 1;
      BYTE2(v25) = 6;
      v27 = (void **)a3;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v25 + 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v25 + 2);
      *(_QWORD *)v28 = (char *)&v25 + 2;
      v28[8] = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v29, (uint64_t)buf, 2, 1, 2);
      v31 = &v29;
      v32 = 1;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v19, (uint64_t)&v29, 1, 1, 2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v30, v29);
      for (i = 0; i != -64; i -= 32)
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v25 + i + 2);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v28[i - 8], *((unsigned __int8 *)&v25 + i + 2));
      }
      v14 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v13));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v29 = 0;
        v30 = 0;
        v31 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v19, -1, 0x20u, 0, 0, __p);
        if (v18 >= 0)
          v15 = __p;
        else
          v15 = (void **)__p[0];
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "AVAudioSessionServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 233;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "is_session_muted";
        v24 = 2080;
        v25 = "Session lookup failed";
        v26 = 2080;
        v27 = &v29;
        *(_WORD *)v28 = 2080;
        *(_QWORD *)&v28[2] = v15;
        _os_log_impl(&dword_1C895C000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
        if (v18 < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v31) < 0)
          operator delete(v29);
      }

      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
      v3 = 0;
      v4 = 561210739;
    }
    as::server::AudioSessionInfoAccessor::~AudioSessionInfoAccessor((os_unfair_lock_s **)&v21);
  }
  else
  {
    v3 = 0;
    v4 = 4294967246;
  }
  return (tuple<int, BOOL>)(v4 | (v3 << 32));
}

- (int)requestApplyInputMuteForSession:(unsigned int)a3 inputMuted:(BOOL)a4
{
  _BOOL8 v4;
  unsigned __int8 v6;
  int v7;
  as::server::AudioSessionInfo *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  os_unfair_lock_s *v15;
  os_unfair_lock_s *v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  as::server::AudioSessionInfo *v21;
  std::__shared_weak_count *v22;

  v4 = a4;
  if ((v6 & 1) == 0)
  {
    if ((_DWORD)self)
    {
      as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
    }
  }
  v7 = 2003329396;
  if (as::AudioSessionMuteEnabled(void)::enabled)
  {
    as::server::AudioSessionInfoAccessor::AudioSessionInfoAccessor((as::server::AudioSessionInfoAccessor *)&v21, a3);
    v8 = v21;
    if (v21)
    {
      v9 = v22;
      if (v22)
      {
        p_shared_owners = (unint64_t *)&v22->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      v7 = as::server::AudioSessionInfo::SetSessionInputMuted(v8, v4);
      if (v9)
      {
        v12 = (unint64_t *)&v9->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
    as::server::AudioSessionInfoAccessor::~AudioSessionInfoAccessor((os_unfair_lock_s **)&v21);
  }
  else
  {
    v15 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
    as::server::LegacySessionManager::FindAudioApplicationForSession(v15, a3, &v21);
    v16 = (os_unfair_lock_s *)v21;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = as::server::AudioApplicationInfo::SetProperty(v16, CFSTR("InputMute"), v17);

    }
    v18 = v22;
    if (v22)
    {
      v19 = (unint64_t *)&v22->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  return v7;
}

- (int)queuePIDOverridden:(int)a3
{
  void *v5;
  int v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _BYTE v11[36];
  int v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v5 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  v11[0] = 0;
  v11[32] = 0;
  v12 = a3;
  as::server::LegacySessionManager::FindOrCreatePrimarySession((uint64_t)v5, (uint64_t)v11, 0, self->_serverDelegate, 1, (uint64_t)&v13);
  if (v13)
  {
    v6 = 0;
    *(_BYTE *)(v13 + 312) = 1;
  }
  else
  {
    v6 = 2003329396;
  }
  v7 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v6;
}

- (tuple<opaqueCMSession)createCoreMXSessionForProcID:(unsigned int> *__return_ptr)retstr type:(AVAudioSessionServerPriv *)self
{
  __int128 v7;
  os_unfair_lock_s *v8;
  as::server *v9;
  NSObject *v10;
  int v11;
  std::string::size_type v12;
  std::string *v13;
  void **v14;
  opaqueCMSession *v15;
  void *v16;
  unsigned int v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  tuple<opaqueCMSession *, const void *, unsigned int> *result;
  _BYTE v25[8];
  uint64_t *v26;
  void *__p[2];
  char v28;
  std::string v29;
  __int128 v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned int v33;
  id v34;
  id v35;
  int v36;
  __int128 v37;
  __int128 v38;
  _BYTE buf[12];
  __int16 v40;
  int v41;
  __int16 v42;
  char *v43;
  __int16 v44;
  std::string *v45;
  __int16 v46;
  void **v47;
  char v48[24];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = *((_OWORD *)a4 + 1);
  v31[0] = *(_OWORD *)a4;
  v31[1] = v7;
  v32 = *((_QWORD *)a4 + 4);
  v33 = a5;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = 0u;
  v38 = 0u;
  v8 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::CreateSession(v8, (uint64_t)v31, 0, self->_serverDelegate, &v30);
  if ((_QWORD)v30)
  {
    strcpy(v48, "create_core_session");
    v10 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v9));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (*(char *)(v30 + 223) < 0)
        std::string::__init_copy_ctor_external(&v29, *(const std::string::value_type **)(v30 + 200), *(_QWORD *)(v30 + 208));
      else
        v29 = *(std::string *)(v30 + 200);
      v11 = SHIBYTE(v29.__r_.__value_.__r.__words[2]);
      v12 = v29.__r_.__value_.__r.__words[0];
      v25[0] = 0;
      v26 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v25, -1, 0x20u, 0, 0, __p);
      v13 = &v29;
      if (v11 < 0)
        v13 = (std::string *)v12;
      if (v28 >= 0)
        v14 = __p;
      else
        v14 = (void **)__p[0];
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "AVAudioSessionServer.mm";
      v40 = 1024;
      v41 = 316;
      v42 = 2080;
      v43 = v48;
      v44 = 2080;
      v45 = v13;
      v46 = 2080;
      v47 = v14;
      _os_log_impl(&dword_1C895C000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d { \"action\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x30u);
      if (v28 < 0)
        operator delete(__p[0]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v26, v25[0]);
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
    }

    as::server::ConstAudioSessionInfo::GetCMSessionRef((CFTypeRef)v30, buf);
    v15 = *(opaqueCMSession **)buf;
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef((CFTypeRef)v30, &v29);
    v16 = (void *)v29.__r_.__value_.__r.__words[0];
    v17 = *(_DWORD *)(v30 + 8);
    retstr->var0.var0 = v15;
    retstr->var0.var1 = v16;
    retstr->var0.var2 = v17;
    if (v16)
      CFRelease(v16);
    if (*(_QWORD *)buf)
      CFRelease(*(CFTypeRef *)buf);
  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var0.var1 = 0;
    retstr->var0.var2 = 0;
  }
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
  if (*((_QWORD *)&v30 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return result;
}

- (tuple<opaqueCMSession)createCoreMXSession:(unsigned int> *__return_ptr)retstr type:(AVAudioSessionServerPriv *)self
{
  uint64_t v5;
  __int128 v7;
  _OWORD v9[2];
  char v10;
  pid_t v11;
  audit_token_t atoken;

  v5 = *(_QWORD *)&a5;
  v7 = *(_OWORD *)&a4->var0[4];
  v9[0] = *(_OWORD *)a4->var0;
  v9[1] = v7;
  v10 = 1;
  *(_OWORD *)atoken.val = v9[0];
  *(_OWORD *)&atoken.val[4] = v7;
  v11 = audit_token_to_pid(&atoken);
  return -[AVAudioSessionServerPriv createCoreMXSessionForProcID:type:](self, "createCoreMXSessionForProcID:type:", v9, v5);
}

- (tuple<opaqueCMSession)createCoreMXSessionForPID:(unsigned int> *__return_ptr)retstr
{
  _BYTE v5[36];
  int v6;

  v5[0] = 0;
  v5[32] = 0;
  v6 = a4;
  return -[AVAudioSessionServerPriv createCoreMXSessionForProcID:type:](self, "createCoreMXSessionForProcID:type:", v5, 1718183795);
}

- (tuple<opaqueCMSession)getPrimarySessionForProcID:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self
{
  _BOOL4 v5;
  void *v9;
  tuple<opaqueCMSession *, const void *, unsigned int> *result;
  opaqueCMSession *v11;
  void *v12;
  unsigned int v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  CFTypeRef cf;
  CFTypeRef v18;
  as::server::ConstAudioSessionInfo *v19;
  std::__shared_weak_count *v20;

  v5 = a5;
  v9 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::FindOrCreatePrimarySession((uint64_t)v9, (uint64_t)a4, 0, self->_serverDelegate, v5, (uint64_t)&v19);
  result = (tuple<opaqueCMSession *, const void *, unsigned int> *)v19;
  if (v19)
  {
    as::server::ConstAudioSessionInfo::GetCMSessionRef(v19, &v18);
    v11 = (opaqueCMSession *)v18;
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v19, &cf);
    v12 = (void *)cf;
    v13 = *((_DWORD *)v19 + 2);
    retstr->var0.var0 = v11;
    retstr->var0.var1 = v12;
    retstr->var0.var2 = v13;
    if (v12)
      CFRelease(v12);
    result = (tuple<opaqueCMSession *, const void *, unsigned int> *)v18;
    if (v18)
      CFRelease(v18);
  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var0.var1 = 0;
    retstr->var0.var2 = 0;
  }
  v14 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return result;
}

- (tuple<opaqueCMSession)getPrimarySession:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self
{
  _BOOL8 v5;
  __int128 v7;
  _OWORD v9[2];
  char v10;
  pid_t v11;
  audit_token_t atoken;

  v5 = a5;
  v7 = *(_OWORD *)&a4->var0[4];
  v9[0] = *(_OWORD *)a4->var0;
  v9[1] = v7;
  v10 = 1;
  *(_OWORD *)atoken.val = v9[0];
  *(_OWORD *)&atoken.val[4] = v7;
  v11 = audit_token_to_pid(&atoken);
  return -[AVAudioSessionServerPriv getPrimarySessionForProcID:createIfNecessary:](self, "getPrimarySessionForProcID:createIfNecessary:", v9, v5);
}

- (tuple<opaqueCMSession)getPrimarySessionForPID:(unsigned int> *__return_ptr)retstr createIfNecessary:(AVAudioSessionServerPriv *)self
{
  _BYTE v6[36];
  int v7;

  v6[0] = 0;
  v6[32] = 0;
  v7 = a4;
  return -[AVAudioSessionServerPriv getPrimarySessionForProcID:createIfNecessary:](self, "getPrimarySessionForProcID:createIfNecessary:", v6, a5);
}

- (int)destroySession:(unsigned int)a3 procID:(const void *)a4
{
  AudioSession *v5;
  uint64_t v7;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  tuple<int, std::string, int> *v11;
  NSObject *v12;
  void **v13;
  int v14;
  as::server::LegacySessionManager *v15;
  void *__p[2];
  char v18;
  _BYTE v19[8];
  uint64_t *v20;
  char v21[16];
  void *v22[2];
  void **v23;
  char v24;
  _BYTE v25[16];
  uint64_t v26;
  char v27;
  int v28;
  void *v29;
  int *v30;
  char v31;
  char v32;
  _BYTE v33[8];
  _QWORD v34[2];
  char v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  _BYTE v39[14];
  __int16 v40;
  const char *v41;
  __int16 v42;
  void **v43;
  _BYTE v44[10];
  uint64_t v45;

  v5 = *(AudioSession **)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[11],char [11],0>((uint64_t)&v28, "client_PID");
  v30 = &v28;
  v31 = 1;
  v7 = *((int *)a4 + 9);
  v33[0] = 5;
  v34[0] = v7;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v33);
  v34[1] = v33;
  v35 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)buf, (uint64_t)&v28, 2, 1, 2);
  *(_QWORD *)&v39[2] = buf;
  v39[10] = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const(&)[3],char [3],0>((uint64_t)v22, "ID");
  v23 = v22;
  v24 = 1;
  AudioSession::FormatSessionIDAsHex(v5, __p);
  v26 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v25, (uint64_t)__p);
  v27 = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v41 + 2, (uint64_t)v22, 2, 1, 2);
  *(_QWORD *)v44 = (char *)&v41 + 2;
  v44[8] = 1;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v19, (uint64_t)buf, 2, 1, 2);
  for (i = 0; i != -64; i -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v41 + i + 2);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v44[i - 8], *((unsigned __int8 *)&v41 + i + 2));
  }
  for (j = 0; j != -64; j -= 32)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v25[j]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v25[j + 8], v25[j]);
  }
  if (v18 < 0)
    operator delete(__p[0]);
  for (k = 0; k != -8; k -= 4)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v33[k * 8]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v34[k], v33[k * 8]);
  }
  strcpy(v21, "destroy_session");
  v11 = -[AVAudioSessionServerPriv getDescriptionForSession:](self, "getDescriptionForSession:", v5);
  if (v28)
  {
    v12 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)v11));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22[0] = 0;
      v22[1] = 0;
      v23 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v19, -1, 0x20u, 0, 0, __p);
      if (v18 >= 0)
        v13 = __p;
      else
        v13 = (void **)__p[0];
      *(_DWORD *)buf = 136316418;
      v37 = "AVAudioSessionServer.mm";
      v38 = 1024;
      *(_DWORD *)v39 = 373;
      *(_WORD *)&v39[4] = 2080;
      *(_QWORD *)&v39[6] = v21;
      v40 = 2080;
      v41 = "unrecognized session ID";
      v42 = 2080;
      v43 = v22;
      *(_WORD *)v44 = 2080;
      *(_QWORD *)&v44[2] = v13;
      _os_log_impl(&dword_1C895C000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d { \"action\":\"%s\", \"error\":\"%s\", \"session\":%s, \"details\":%s }", buf, 0x3Au);
      if (v18 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v23) < 0)
        operator delete(v22[0]);
    }

    v14 = v28;
  }
  else
  {
    v15 = (as::server::LegacySessionManager *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)v11);
    if (as::server::LegacySessionManager::RemoveSession(v15, v5, (const as::server::ProcessIdentity *)a4))
      v14 = 0;
    else
      v14 = 2003329396;
  }
  if (v32 < 0)
    operator delete(v29);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
  return v14;
}

- (int)destroyCMSessionForPID:(int)a3 sessionID:(unsigned int)a4
{
  _BYTE v5[36];
  int v6;

  v5[0] = 0;
  v5[32] = 0;
  v6 = a3;
  return -[AVAudioSessionServerPriv destroySession:procID:](self, "destroySession:procID:", *(_QWORD *)&a4, v5);
}

- (int)destroySession:(unsigned int)a3 auditToken:(id *)a4
{
  uint64_t v4;
  __int128 v6;
  _OWORD v8[2];
  char v9;
  pid_t v10;
  audit_token_t atoken;

  v4 = *(_QWORD *)&a3;
  v6 = *(_OWORD *)&a4->var0[4];
  v8[0] = *(_OWORD *)a4->var0;
  v8[1] = v6;
  v9 = 1;
  *(_OWORD *)atoken.val = v8[0];
  *(_OWORD *)&atoken.val[4] = v6;
  v10 = audit_token_to_pid(&atoken);
  return -[AVAudioSessionServerPriv destroySession:procID:](self, "destroySession:procID:", v4, v8);
}

- (void)destroyTimestampWriterForDevice:(id)a3
{
  as::server::LegacySessionManager *v3;
  void *v4;
  os_unfair_lock_s *v5;
  as::server::LegacySessionManager *v6;
  as::server::LegacySessionManager *v7;
  uint64_t v8;
  CFTypeRef cf;

  v3 = (as::server::LegacySessionManager *)a3;
  v4 = as::server::LegacySessionManager::Instance(v3);
  v5 = (os_unfair_lock_s *)*((_QWORD *)v4 + 31);
  if (v5)
  {
    os_unfair_lock_lock(*((os_unfair_lock_t *)v4 + 31));
    v6 = v3;
    v7 = v6;
    if (v6)
      CFRetain(v6);
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v7);

    v8 = mach_absolute_time();
    as::server::DeviceTimeObserver::removeDevice((gsl::details *)&v5[2], &cf, v8);
    if (cf)
      CFRelease(cf);
    os_unfair_lock_unlock(v5);
  }

}

- (unint64_t)dynamicLatencyForDevice:(unsigned int)a3
{
  void *v4;
  os_unfair_lock_s *v5;
  unint64_t v6;

  v4 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  v5 = (os_unfair_lock_s *)*((_QWORD *)v4 + 31);
  if (!v5)
    return 0;
  os_unfair_lock_lock(*((os_unfair_lock_t *)v4 + 31));
  v6 = as::server::DeviceTimeObserver::nanosecondLatency((as::server::DeviceTimeObserver *)&v5[2], a3, 0);
  os_unfair_lock_unlock(v5);
  return v6;
}

- (int)setMicrophoneInjectionCapability:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *v4;

  v3 = a3;
  v4 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::SetMicrophoneInjectionIsEnabled(v4, v3);
  return 0;
}

- (int)notifyMicrophoneInjectionPermissionChanged
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  as::server::LegacySessionManager::NotifyClientsMicrophoneInjectionUserPermissionChanged(v2);
  return 0;
}

- (BOOL)checkMicrophoneInjectionPermission
{
  as::server::LegacySessionManager *v2;

  v2 = (as::server::LegacySessionManager *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  return as::server::LegacySessionManager::UserAllowsMicrophoneInjection(v2);
}

- (id)getSessionsWithMicrophoneInjectionPreference
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  return as::server::LegacySessionManager::GetSessionsWithMicrophoneInjectionPreference(v2);
}

- (unint64_t)dynamicLatencyForDevice:(unsigned int)a3 isInput:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  os_unfair_lock_s *v7;
  unint64_t v8;

  v4 = a4;
  v6 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)self);
  v7 = (os_unfair_lock_s *)*((_QWORD *)v6 + 31);
  if (!v7)
    return 0;
  os_unfair_lock_lock(*((os_unfair_lock_t *)v6 + 31));
  v8 = as::server::DeviceTimeObserver::nanosecondLatency((as::server::DeviceTimeObserver *)&v7[2], a3, v4);
  os_unfair_lock_unlock(v7);
  return v8;
}

- (tuple<int,)getMXSessionProperty:(id)a3 forSessionID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  as::server::ConstAudioSessionInfo *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  int v14;
  CFTypeRef v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  CFTypeRef cf;
  as::server::ConstAudioSessionInfo *v22;
  std::__shared_weak_count *v23;
  tuple<int, id<NSSecureCoding>> result;

  v6 = v4;
  v7 = a3;
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v22, a4);
  v8 = v22;
  if (v22)
  {
    v9 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v8, &cf);
    if (cf)
      CFRelease(cf);
    if (v9)
    {
      v12 = (unint64_t *)&v9->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    cf = 0;
    v14 = MXSessionCopyProperty();
    v15 = cf;
    *(_DWORD *)v6 = v14;
    *(_QWORD *)(v6 + 8) = v15;
  }
  else
  {
    *(_DWORD *)v6 = -50;
    *(_QWORD *)(v6 + 8) = 0;
  }
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  result.var0.var1 = v20;
  *(_QWORD *)&result.var0.var0 = v19;
  return result;
}

- (int)setMXSessionProperty:(id)a3 forSessionID:(unsigned int)a4 value:(id)a5
{
  id v7;
  id v8;
  as::server::ConstAudioSessionInfo *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  int v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  CFTypeRef cf;
  as::server::ConstAudioSessionInfo *v21;
  std::__shared_weak_count *v22;

  v7 = a3;
  v8 = a5;
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v21, a4);
  v9 = v21;
  if (v21)
  {
    v10 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v9, &cf);
    if (cf)
      CFRelease(cf);
    if (v10)
    {
      v13 = (unint64_t *)&v10->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v15 = MXSessionSetProperty();
  }
  else
  {
    v15 = -50;
  }
  v16 = v22;
  if (v22)
  {
    v17 = (unint64_t *)&v22->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return v15;
}

@end
