@implementation ATPhasePlatform

- (ATPhasePlatform)init
{
  id v2;
  ATPhasePlatform *v3;
  id sessionInterface;
  id tapInterface;
  id roomCongruenceInterface;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATPhasePlatform;
  v2 = -[ATPhasePlatform init](&v8, sel_init);
  v3 = (ATPhasePlatform *)v2;
  if (v2)
  {
    std::unique_ptr<Phase::ServerManager>::reset[abi:ne180100]((uint64_t *)v2 + 1, 0);
    sessionInterface = v3->_sessionInterface;
    v3->_sessionInterface = 0;

    tapInterface = v3->_tapInterface;
    v3->_tapInterface = 0;

    roomCongruenceInterface = v3->_roomCongruenceInterface;
    v3->_roomCongruenceInterface = 0;

  }
  return v3;
}

- (void)dealloc
{
  id sessionInterface;
  id tapInterface;
  id roomCongruenceInterface;
  objc_super v6;

  std::unique_ptr<Phase::ServerManager>::reset[abi:ne180100]((uint64_t *)&self->_serverManager, 0);
  sessionInterface = self->_sessionInterface;
  self->_sessionInterface = 0;

  tapInterface = self->_tapInterface;
  self->_tapInterface = 0;

  roomCongruenceInterface = self->_roomCongruenceInterface;
  self->_roomCongruenceInterface = 0;

  v6.receiver = self;
  v6.super_class = (Class)ATPhasePlatform;
  -[ATPhasePlatform dealloc](&v6, sel_dealloc);
}

- (void)lazyInitServerManager
{
  void *result;
  uint64_t *p_serverManager;
  uint64_t v4;
  AQIONodeManager *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  __int128 v13;
  _BYTE buf[18];
  __int16 v15;
  _BYTE v16[12];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_serverManager = (uint64_t *)&self->_serverManager;
  result = self->_serverManager.__ptr_.__value_;
  if (!result)
  {
    v4 = operator new();
    *(_DWORD *)(v4 + 20) = 0;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_BYTE *)(v4 + 16) = 0;
    Phase::ServerManager::IONodeClient::IONodeClient((std::vector<char> *)(v4 + 24), (Phase::ServerManager *)v4, 0);
    Phase::ServerManager::IONodeClient::IONodeClient((std::vector<char> *)(v4 + 408), (Phase::ServerManager *)v4, 1);
    *(_BYTE *)(v4 + 856) = 0;
    *(_BYTE *)(v4 + 864) = 0;
    *(_BYTE *)(v4 + 888) = 0;
    *(_DWORD *)(v4 + 896) = 0;
    *(_QWORD *)(v4 + 904) = 0;
    *(_DWORD *)(v4 + 808) = 0;
    *(_OWORD *)(v4 + 792) = 0u;
    *(_OWORD *)(v4 + 816) = 0u;
    *(_OWORD *)(v4 + 832) = 0u;
    *(_BYTE *)(v4 + 848) = 0;
    BaseOpaqueObject::BaseOpaqueObject((BaseOpaqueObject *)(v4 + 864));
    *(_QWORD *)(v4 + 864) = &off_1E45164F0;
    *(_QWORD *)(v4 + 880) = v4;
    *(_BYTE *)(v4 + 888) = 1;
    *(_QWORD *)buf = AQIONodeManager::systemMixEngine(v5);
    *(_QWORD *)&buf[8] = 0x300000000;
    buf[16] = 0;
    v17 = 0;
    AQIONodeManager::_FindAQIONode((AQIONodeManager *)&v13, *(const AQMEIO_Binding **)buf, (uint64_t)buf);
    std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100](v4, &v13);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (v17)
    {
      v9 = *(std::__shared_weak_count **)&v16[4];
      if (*(_QWORD *)&v16[4])
      {
        v10 = (unint64_t *)(*(_QWORD *)&v16[4] + 8);
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
    if (!*(_QWORD *)v4)
    {
      gPhaseManagerLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "PhaseServerManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 112;
        v15 = 2048;
        *(_QWORD *)v16 = v4;
        _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: could not find the AQIONode!", buf, 0x1Cu);
      }

    }
    *(_DWORD *)(v4 + 840) = 0;
    Phase::ServerManager::enableIO(v4, 1, 0);
    std::unique_ptr<Phase::ServerManager>::reset[abi:ne180100](p_serverManager, v4);
    result = (void *)*p_serverManager;
    if (!*p_serverManager)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
  return result;
}

- (id)lazyInitSessionInterface
{
  id sessionInterface;
  PHASESessionInterfaceImpl *v4;
  id v5;
  id result;

  sessionInterface = self->_sessionInterface;
  if (sessionInterface)
    return sessionInterface;
  v4 = -[PHASESessionInterfaceImpl initWithPhasePlatform:]([PHASESessionInterfaceImpl alloc], "initWithPhasePlatform:", self);
  v5 = self->_sessionInterface;
  self->_sessionInterface = v4;

  sessionInterface = self->_sessionInterface;
  if (sessionInterface)
    return sessionInterface;
  _os_assert_log();
  result = (id)_os_crash();
  __break(1u);
  return result;
}

- (id)lazyInitRoomCongruenceInterface
{
  id roomCongruenceInterface;
  void *v4;
  id v5;
  id result;

  roomCongruenceInterface = self->_roomCongruenceInterface;
  if (roomCongruenceInterface)
    return roomCongruenceInterface;
  v4 = (void *)objc_opt_new();
  v5 = self->_roomCongruenceInterface;
  self->_roomCongruenceInterface = v4;

  roomCongruenceInterface = self->_roomCongruenceInterface;
  if (roomCongruenceInterface)
    return roomCongruenceInterface;
  _os_assert_log();
  result = (id)_os_crash();
  __break(1u);
  return result;
}

- (double)sampleRate
{
  void *v2;
  double v3;
  double v4;

  Phase::ServerManager::ioFormat((_QWORD *)-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleRate");
  v4 = v3;

  return v4;
}

- (BOOL)running
{
  return *(_BYTE *)(-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager") + 16);
}

- (unsigned)bufferFrameSize
{
  return Phase::ServerManager::maxBufferSizeFrames((Phase::ServerManager *)-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager"));
}

- (BOOL)enableIO:(BOOL)a3 direction:(unsigned __int8)a4
{
  return Phase::ServerManager::enableIO((uint64_t)-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager"), a3, a4);
}

- (unsigned)deviceLatencyInFramesForDirection:(unsigned __int8)a3
{
  return Phase::ServerManager::deviceLatencyInFrames((uint64_t *)-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager"), a3);
}

- (unsigned)numberOfStreamsForDirection:(unsigned __int8)a3
{
  -[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager", a3);
  return 1;
}

- (id)streamInfoForIndex:(unsigned int)a3 direction:(unsigned __int8)a4
{
  int v4;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  std::vector<unsigned int>::pointer begin;
  std::vector<unsigned int>::pointer v16;
  char *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  CFTypeRef *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  const void *v30;
  int64x2_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  CFTypeRef *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  const void *v44;
  int64x2_t v45;
  char *v46;
  void **CFDictionaryRef;
  PHASEStreamInfoImpl *v48;
  CFTypeRef v50;
  CFTypeRef cf;
  std::vector<unsigned int> v52;
  std::vector<unsigned int> v53;
  void *__p;
  _BYTE *v55;
  uint64_t v56;
  int64x2_t v57;
  char *v58;
  void **v59;
  int64x2_t v60;
  char *v61;
  char **v62;

  v4 = a4;
  Phase::ServerManager::ioFormat((_QWORD *)-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager", *(_QWORD *)&a3), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = Phase::ServerManager::deviceLatencyInFrames((uint64_t *)-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager"), v4);
  v57 = 0uLL;
  v58 = 0;
  __p = 0;
  v55 = 0;
  v56 = 0;
  v8 = -[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager");
  v9 = *v8;
  if (*v8)
  {
    v10 = (uint64_t)(v4 ? v8 + 51 : v8 + 3);
    os_unfair_recursive_lock_lock_with_options();
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 392))(v9, v10);
    v12 = v4 ? 65 : 1;
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, void **))(*(_QWORD *)v11 + 280))(v11, v12, &__p);
    os_unfair_recursive_lock_unlock();
    if (v13)
    {
      if (__p != v55)
      {
        std::vector<unsigned int>::vector(&v53, 0xAAAAAAAAAAAAAAABLL * ((v55 - (_BYTE *)__p) >> 2));
        std::vector<unsigned int>::vector(&v52, 0xAAAAAAAAAAAAAAABLL * ((v55 - (_BYTE *)__p) >> 2));
        if (v55 != __p)
        {
          v14 = (v55 - (_BYTE *)__p) / 12;
          begin = v53.__begin_;
          v16 = v52.__begin_;
          if (v14 <= 1)
            v14 = 1;
          v17 = (char *)__p + 4;
          do
          {
            *begin = *((_DWORD *)v17 - 1);
            v18 = v17[4];
            if (v17[4])
              v18 = *(_DWORD *)v17;
            *v16++ = v18;
            v17 += 12;
            ++begin;
            --v14;
          }
          while (v14);
        }
        applesauce::CF::TypeRefPair::TypeRefPair<char const*,std::vector<unsigned int> &>((applesauce::CF::TypeRef *)&v50, (char *)objc_msgSend(CFSTR("port type"), "UTF8String"), (int **)&v53);
        v19 = v57.i64[1];
        if (v57.i64[1] >= (unint64_t)v58)
        {
          v20 = (v57.i64[1] - v57.i64[0]) >> 4;
          v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 60)
            std::vector<void const*>::__throw_length_error[abi:ne180100]();
          v22 = (uint64_t)&v58[-v57.i64[0]];
          if ((uint64_t)&v58[-v57.i64[0]] >> 3 > v21)
            v21 = v22 >> 3;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
            v23 = 0xFFFFFFFFFFFFFFFLL;
          else
            v23 = v21;
          v62 = &v58;
          v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v23);
          v25 = (CFTypeRef *)&v24[16 * v20];
          v61 = &v24[16 * v26];
          *v25 = v50;
          v50 = 0;
          v25[1] = cf;
          cf = 0;
          v27 = v25 + 2;
          v60.i64[1] = (uint64_t)(v25 + 2);
          v28 = (_QWORD *)v57.i64[1];
          v29 = (_QWORD *)v57.i64[0];
          if (v57.i64[1] == v57.i64[0])
          {
            v31 = vdupq_n_s64(v57.u64[1]);
          }
          else
          {
            do
            {
              v30 = (const void *)*(v28 - 2);
              v28 -= 2;
              *(v25 - 2) = v30;
              v25 -= 2;
              *v28 = 0;
              v25[1] = (CFTypeRef)v28[1];
              v28[1] = 0;
            }
            while (v28 != v29);
            v31 = v57;
            v27 = (_QWORD *)v60.i64[1];
          }
          v57.i64[0] = (uint64_t)v25;
          v57.i64[1] = (uint64_t)v27;
          v60 = v31;
          v32 = v58;
          v58 = v61;
          v61 = v32;
          v59 = (void **)v31.i64[0];
          std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)&v59);
          v57.i64[1] = (uint64_t)v27;
          if (cf)
            CFRelease(cf);
          if (v50)
            CFRelease(v50);
        }
        else
        {
          *(_QWORD *)v57.i64[1] = v50;
          *(_QWORD *)(v19 + 8) = cf;
          v57.i64[1] = v19 + 16;
        }
        applesauce::CF::TypeRefPair::TypeRefPair<char const*,std::vector<unsigned int> &>((applesauce::CF::TypeRef *)&v50, (char *)objc_msgSend(CFSTR("port subtype"), "UTF8String", v50), (int **)&v52);
        v33 = v57.i64[1];
        if (v57.i64[1] >= (unint64_t)v58)
        {
          v34 = (v57.i64[1] - v57.i64[0]) >> 4;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 60)
            std::vector<void const*>::__throw_length_error[abi:ne180100]();
          v36 = (uint64_t)&v58[-v57.i64[0]];
          if ((uint64_t)&v58[-v57.i64[0]] >> 3 > v35)
            v35 = v36 >> 3;
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
            v37 = 0xFFFFFFFFFFFFFFFLL;
          else
            v37 = v35;
          v62 = &v58;
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v37);
          v40 = (CFTypeRef *)&v38[16 * v34];
          *v40 = v50;
          v50 = 0;
          v40[1] = cf;
          cf = 0;
          v41 = v40 + 2;
          v42 = (_QWORD *)v57.i64[1];
          v43 = (_QWORD *)v57.i64[0];
          if (v57.i64[1] == v57.i64[0])
          {
            v45 = vdupq_n_s64(v57.u64[1]);
          }
          else
          {
            do
            {
              v44 = (const void *)*(v42 - 2);
              v42 -= 2;
              *(v40 - 2) = v44;
              v40 -= 2;
              *v42 = 0;
              v40[1] = (CFTypeRef)v42[1];
              v42[1] = 0;
            }
            while (v42 != v43);
            v45 = v57;
          }
          v57.i64[0] = (uint64_t)v40;
          v57.i64[1] = (uint64_t)v41;
          v60 = v45;
          v46 = v58;
          v58 = &v38[16 * v39];
          v61 = v46;
          v59 = (void **)v45.i64[0];
          std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)&v59);
          v57.i64[1] = (uint64_t)v41;
          if (cf)
            CFRelease(cf);
          if (v50)
            CFRelease(v50);
        }
        else
        {
          *(_QWORD *)v57.i64[1] = v50;
          *(_QWORD *)(v33 + 8) = cf;
          v57.i64[1] = v33 + 16;
        }
        if (v52.__begin_)
        {
          v52.__end_ = v52.__begin_;
          operator delete(v52.__begin_);
        }
        if (v53.__begin_)
        {
          v53.__end_ = v53.__begin_;
          operator delete(v53.__begin_);
        }
      }
    }
  }
  CFDictionaryRef = (void **)applesauce::CF::details::make_CFDictionaryRef((void ***)&v57);
  v59 = CFDictionaryRef;
  v48 = -[PHASEStreamInfoImpl initWithFormat:latencyInFrames:streamDescription:]([PHASEStreamInfoImpl alloc], "initWithFormat:latencyInFrames:streamDescription:", v6, v7, CFDictionaryRef);
  CFRelease(CFDictionaryRef);
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  v59 = (void **)&v57;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](&v59);

  return v48;
}

- (BOOL)registerIOBlock:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  int v7;
  BOOL v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _QWORD *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager");
  v6 = v4;
  v7 = *((unsigned __int8 *)v5 + 115) | *((unsigned __int8 *)v5 + 499);
  v8 = v7 == 0;
  if (v7)
  {
    gPhaseManagerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = _Block_copy(v6);
      v16 = 136315906;
      v17 = "PhaseServerManager.mm";
      v18 = 1024;
      v19 = 146;
      v20 = 2048;
      v21 = v5;
      v22 = 2048;
      v23 = v14;
      _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: cannot set the block@%p when IO is running!", (uint8_t *)&v16, 0x26u);

    }
    if (!v5[99])
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
  else
  {
    v9 = (const void *)v5[99];
    if (v9)
    {
      _Block_release(v9);
      v10 = (void *)v5[99];
      v5[99] = 0;

    }
    if (v6)
    {
      _Block_copy(v6);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v5[99];
      v5[99] = v11;

    }
  }

  return v8;
}

- (BOOL)registerOverloadNotification:(id)a3
{
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  ATPhasePlatform *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    gPhaseManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315650;
      v8 = "ATPhasePlatform.mm";
      v9 = 1024;
      v10 = 691;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d platform@%p: registering overload notification not supported yet!", (uint8_t *)&v7, 0x1Cu);
    }

  }
  return a3 == 0;
}

- (BOOL)registerRouteChangeNotification:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = -[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager");
  v6 = v4;
  v7 = (const void *)v5[100];
  if (v7)
  {
    _Block_release(v7);
    v8 = (void *)v5[100];
    v5[100] = 0;

  }
  if (v6)
  {
    _Block_copy(v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v5[100];
    v5[100] = v9;

  }
  return 1;
}

- (BOOL)start
{
  _QWORD *v3;
  std::string::size_type v4;
  int v5;
  uint64_t v6;
  char **__ptr32 *v7;
  CA::AudioBuffers *v8;
  int v9;
  NSObject *v10;
  unint64_t *v11;
  uint64_t v12;
  char v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v24;
  const char *v25;
  NSObject *global_queue;
  id v27;
  NSObject *v28;
  int v29;
  id v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint32_t v37;
  unint64_t *v39;
  void *v40[3];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  std::string v45;
  std::string v46;
  _BYTE v47[28];
  __int16 v48;
  int v49;
  _BYTE __p[40];
  std::string::size_type v51;
  _BYTE buf[40];
  std::string v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = -[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager");
  v4 = (std::string::size_type)v3;
  v5 = *((_DWORD *)v3 + 5);
  if ((v5 & 3) == 0)
  {
    v9 = -66681;
    gPhaseManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "PhaseServerManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 427;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v4;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = -66681;
      _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: both input and output are disabled, err = %d", buf, 0x22u);
    }
    goto LABEL_14;
  }
  if (!v3[99])
  {
    v9 = -66681;
    gPhaseManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "PhaseServerManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 434;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v4;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = -66681;
      _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: IOBlock is nil, err = %d", buf, 0x22u);
    }
    goto LABEL_14;
  }
  if (!*v3)
  {
    v9 = -66681;
    gPhaseManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "PhaseServerManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 440;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v4;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = -66681;
      _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: error initializing, err = %d", buf, 0x22u);
    }
LABEL_14:

    goto LABEL_172;
  }
  v6 = MEMORY[0x1E0C809B0];
  v7 = &off_1A11BE000;
  if ((*((_DWORD *)v3 + 5) & 3) == 3)
  {
    Phase::ServerManager::maxBufferSizeFrames((Phase::ServerManager *)v3);
    std::__optional_destruct_base<CA::AudioBuffers,false>::reset[abi:ne180100](v4 + 848);
    v8 = (CA::AudioBuffers *)ExtendedAudioBufferList_Create();
    CA::AudioBuffers::AudioBuffers((_QWORD *)(v4 + 848), v8);
    *(_BYTE *)(v4 + 856) = 1;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
  }
  else
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    if ((v5 & 2) == 0)
      goto LABEL_163;
  }
  (*(void (**)(void **__return_ptr, std::string::size_type))(*(_QWORD *)(v4 + 408) + 64))(v40, v4 + 408);
  v11 = (unint64_t *)operator new();
  std::string::basic_string[abi:ne180100]<0>(&v45, "fire-impulse-through-phase-server-input-stream");
  v12 = operator new();
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v46, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
  else
    v46 = v45;
  v13 = _os_feature_enabled_impl();
  *(_BYTE *)v12 = v13;
  *(_DWORD *)(v12 + 4) = (int)(*(double *)(v4 + 552) + *(double *)(v4 + 552));
  v14 = *(_DWORD *)v40[0];
  v15 = 1;
  if (*(int *)v40[0] <= 10944519)
  {
    if (v14 <= 9502735)
    {
      if (v14 > 8257543)
      {
        if (v14 <= 8519687)
        {
          if (v14 <= 8388615)
          {
            if (v14 != 8257544)
            {
              v17 = 8323080;
              goto LABEL_127;
            }
            goto LABEL_128;
          }
          if (v14 == 8388616)
            goto LABEL_128;
          v18 = 8454152;
          goto LABEL_123;
        }
        if (v14 > 8978436)
        {
          if (v14 == 8978437)
            goto LABEL_128;
          if (v14 == 9109510)
            goto LABEL_124;
          v18 = 9175047;
          goto LABEL_123;
        }
        if (v14 == 8519688)
          goto LABEL_128;
        v17 = 8912900;
      }
      else
      {
        if (v14 <= 7798788)
        {
          if (v14 <= 7667716)
          {
            if (v14 != 7405571)
            {
              v17 = 7536644;
              goto LABEL_127;
            }
            goto LABEL_128;
          }
          if (v14 == 7667717)
            goto LABEL_128;
          v18 = 7733253;
          goto LABEL_123;
        }
        if (v14 <= 7995397)
        {
          if (v14 == 7798789)
            goto LABEL_132;
          v17 = 7929862;
        }
        else
        {
          if (v14 == 7995398)
            goto LABEL_124;
          if (v14 == 8060934)
            goto LABEL_132;
          v17 = 8192007;
        }
      }
LABEL_127:
      if (v14 == v17)
        goto LABEL_128;
LABEL_180:
      v15 = 0;
      goto LABEL_132;
    }
    if (v14 > 10354694)
    {
      if (v14 <= 10616839)
      {
        if (v14 > 10485767)
        {
          if (v14 == 10485768)
            goto LABEL_132;
          v16 = 10551304;
        }
        else
        {
          if (v14 == 10354695)
            goto LABEL_132;
          v16 = 10420231;
        }
      }
      else if (v14 <= 10747911)
      {
        if (v14 == 10616840)
          goto LABEL_132;
        v16 = 10682376;
      }
      else
      {
        if (v14 == 10747912 || v14 == 10813448)
          goto LABEL_132;
        v16 = 10878984;
      }
    }
    else if (v14 <= 9961475)
    {
      if (v14 <= 9830402)
      {
        if (v14 == 9502736)
          goto LABEL_128;
        v18 = 9699335;
        goto LABEL_123;
      }
      if (v14 == 9830403)
        goto LABEL_132;
      v16 = 9895940;
    }
    else if (v14 <= 10158085)
    {
      if (v14 == 9961476)
        goto LABEL_132;
      v16 = 10092549;
    }
    else
    {
      if (v14 == 10158086 || v14 == 10223623)
        goto LABEL_132;
      v16 = 10289159;
    }
LABEL_131:
    if (v14 == v16)
      goto LABEL_132;
    goto LABEL_180;
  }
  if (v14 <= 13172743)
  {
    if (v14 > 12582923)
    {
      if (v14 > 12845065)
      {
        if (v14 > 12976133)
        {
          if (v14 == 12976134 || v14 == 13041671)
          {
            v15 = 5;
            goto LABEL_132;
          }
          v16 = 13107207;
          goto LABEL_131;
        }
        if (v14 != 12845066)
        {
          if (v14 == 12910596)
          {
            v15 = 3;
            goto LABEL_132;
          }
          goto LABEL_180;
        }
        goto LABEL_128;
      }
      if (v14 <= 12713991)
      {
        if (v14 != 12582924)
        {
          v17 = 12648464;
          goto LABEL_127;
        }
        goto LABEL_128;
      }
      if (v14 == 12713992)
        goto LABEL_128;
      v17 = 12779530;
      goto LABEL_127;
    }
    if (v14 > 11862024)
    {
      if (v14 <= 12255237)
      {
        if (v14 == 11862025)
          goto LABEL_132;
        v17 = 12189701;
      }
      else
      {
        if (v14 == 12255238 || v14 == 12320775)
          goto LABEL_128;
        v17 = 12386312;
      }
      goto LABEL_127;
    }
    if (v14 > 11599879)
    {
      if (v14 == 11599880)
        goto LABEL_132;
      v16 = 11730952;
    }
    else
    {
      if (v14 == 10944520)
        goto LABEL_132;
      v16 = 11534343;
    }
    goto LABEL_131;
  }
  if (v14 <= 13762571)
  {
    if (v14 <= 13434887)
    {
      if (v14 <= 13303821)
      {
        if (v14 == 13172744)
          goto LABEL_120;
        v19 = 13238284;
LABEL_82:
        if (v14 != v19)
          goto LABEL_180;
LABEL_120:
        v15 = 6;
        goto LABEL_132;
      }
      if (v14 == 13303822)
        goto LABEL_120;
      v17 = 13369368;
    }
    else if (v14 <= 13565961)
    {
      if (v14 == 13434888)
        goto LABEL_128;
      v17 = 13500428;
    }
    else
    {
      if (v14 == 13565962 || v14 == 13631500)
        goto LABEL_128;
      v17 = 13697038;
    }
    goto LABEL_127;
  }
  if (v14 > 14090247)
  {
    if (v14 > 14221317)
    {
      if (v14 != 14221318 && v14 != 14286855)
      {
        v19 = 14352392;
        goto LABEL_82;
      }
LABEL_124:
      v15 = 4;
      goto LABEL_132;
    }
    if (v14 == 14090248)
      goto LABEL_132;
    v18 = 14155781;
LABEL_123:
    if (v14 != v18)
      goto LABEL_180;
    goto LABEL_124;
  }
  if (v14 <= 13893636)
  {
    if (v14 != 13762572)
    {
      v17 = 13828110;
      goto LABEL_127;
    }
LABEL_128:
    v15 = 2;
    goto LABEL_132;
  }
  if (v14 != 13893637 && v14 != 13959174)
  {
    v16 = 14024711;
    goto LABEL_131;
  }
LABEL_132:
  *(_DWORD *)(v12 + 8) = v15;
  *(_QWORD *)(v12 + 16) = 0;
  *(_DWORD *)(v12 + 24) = 0;
  if ((v13 & 1) != 0)
  {
    v20 = CADeprecated::TSingleton<AudioImpulseInjector::Impl::NotificationListener>::instance();
    v21 = HIBYTE(v46.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external((std::string *)v47, v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
    else
      *(std::string *)v47 = v46;
    v39 = v11;
    v22 = v6;
    os_unfair_lock_lock((os_unfair_lock_t)v20);
    v23 = std::__hash_table<std::__hash_value_type<std::string,STSPerLabelControllerState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,STSPerLabelControllerState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,STSPerLabelControllerState>>>::find<std::string>((_QWORD *)(v20 + 8), v47);
    if (v23)
    {
      std::__hash_table<AudioImpulseInjector::Impl *,std::hash<AudioImpulseInjector::Impl *>,std::equal_to<AudioImpulseInjector::Impl *>,std::allocator<AudioImpulseInjector::Impl *>>::__emplace_unique_key_args<AudioImpulseInjector::Impl *,AudioImpulseInjector::Impl * const&>((float *)v23 + 12, v12, v12);
      v7 = &off_1A11BE000;
    }
    else
    {
      *(_QWORD *)buf = v47;
      v24 = std::__hash_table<std::__hash_value_type<std::string,AudioImpulseInjector::Impl::NotificationListener::NotificationState>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,AudioImpulseInjector::Impl::NotificationListener::NotificationState>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,AudioImpulseInjector::Impl::NotificationListener::NotificationState>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,AudioImpulseInjector::Impl::NotificationListener::NotificationState>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v20 + 8, v47, (__int128 **)buf);
      std::__hash_table<AudioImpulseInjector::Impl *,std::hash<AudioImpulseInjector::Impl *>,std::equal_to<AudioImpulseInjector::Impl *>,std::allocator<AudioImpulseInjector::Impl *>>::__emplace_unique_key_args<AudioImpulseInjector::Impl *,AudioImpulseInjector::Impl * const&>((float *)(v24 + 48), v12, v12);
      v25 = __p;
      std::operator+<char>();
      if (__p[23] < 0)
        v25 = *(const char **)__p;
      *(_QWORD *)buf = v22;
      *(_QWORD *)&buf[8] = 1174405120;
      *(_QWORD *)&buf[16] = ___ZN20AudioImpulseInjector4Impl20NotificationListener32AddInjectorForNotificationStringEPS0_NSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEE_block_invoke;
      *(_QWORD *)&buf[24] = &__block_descriptor_tmp_9970;
      *(_QWORD *)&buf[32] = v20;
      if ((v47[23] & 0x80000000) != 0)
        std::string::__init_copy_ctor_external(&v53, *(const std::string::value_type **)v47, *(std::string::size_type *)&v47[8]);
      else
        v53 = *(std::string *)v47;
      global_queue = dispatch_get_global_queue(25, 0);
      notify_register_dispatch(v25, (int *)(v24 + 40), global_queue, buf);
      v6 = v22;
      v7 = &off_1A11BE000;
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v53.__r_.__value_.__l.__data_);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v20);
    if ((v47[23] & 0x80000000) != 0)
      operator delete(*(void **)v47);
    v11 = v39;
  }
  else
  {
    v21 = HIBYTE(v46.__r_.__value_.__r.__words[2]);
  }
  *v11 = v12;
  if (v21 < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  std::unique_ptr<AudioImpulseInjector>::reset[abi:ne180100]((unint64_t **)(v4 + 904), v11);
  if (v40[0])
  {
    v40[1] = v40[0];
    operator delete(v40[0]);
  }
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v27 = (id)AudioControlQueue(void)::gAudioControlQueue;
  *(_QWORD *)buf = v6;
  *(_QWORD *)&buf[8] = *((_QWORD *)v7 + 151);
  *(_QWORD *)&buf[16] = ___ZN5Phase13ServerManager5startEv_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E45161F0;
  *(_QWORD *)&buf[32] = &v41;
  v53.__r_.__value_.__r.__words[0] = v4;
  v53.__r_.__value_.__s.__data_[8] = (v5 & 1) == 0;
  AT::DispatchBlock(v27, buf, 0, (uint64_t)"start", (uint64_t)"PhaseServerManager.mm", 465);

  if (*((_DWORD *)v42 + 6))
  {
    Phase::ServerManager::stop((unint64_t **)v4);
    gPhaseManagerLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *((_DWORD *)v42 + 6);
      *(_DWORD *)__p = 136315906;
      *(_QWORD *)&__p[4] = "PhaseServerManager.mm";
      *(_WORD *)&__p[12] = 1024;
      *(_DWORD *)&__p[14] = 470;
      *(_WORD *)&__p[18] = 2048;
      *(_QWORD *)&__p[20] = v4;
      *(_WORD *)&__p[28] = 1024;
      *(_DWORD *)&__p[30] = v29;
      _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: could not start input client, err = %d", __p, 0x22u);
    }
    goto LABEL_169;
  }
LABEL_163:
  if ((v5 & 1) == 0)
    goto LABEL_170;
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v30 = (id)AudioControlQueue(void)::gAudioControlQueue;
  *(_QWORD *)__p = v6;
  *(_QWORD *)&__p[8] = *((_QWORD *)v7 + 151);
  *(_QWORD *)&__p[16] = ___ZN5Phase13ServerManager5startEv_block_invoke_27;
  *(_QWORD *)&__p[24] = &unk_1E45161A0;
  *(_QWORD *)&__p[32] = &v41;
  v51 = v4;
  AT::DispatchBlock(v30, __p, 0, (uint64_t)"start", (uint64_t)"PhaseServerManager.mm", 479);

  if (!*((_DWORD *)v42 + 6))
  {
LABEL_170:
    v9 = 0;
    *(_BYTE *)(v4 + 16) = 1;
    goto LABEL_171;
  }
  Phase::ServerManager::stop((unint64_t **)v4);
  gPhaseManagerLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v31 = *((_DWORD *)v42 + 6);
    *(_DWORD *)v47 = 136315906;
    *(_QWORD *)&v47[4] = "PhaseServerManager.mm";
    *(_WORD *)&v47[12] = 1024;
    *(_DWORD *)&v47[14] = 484;
    *(_WORD *)&v47[18] = 2048;
    *(_QWORD *)&v47[20] = v4;
    v48 = 1024;
    v49 = v31;
    _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d servermgr@%p: could not start output client, err = %d", v47, 0x22u);
  }
LABEL_169:

  v9 = *((_DWORD *)v42 + 6);
LABEL_171:
  _Block_object_dispose(&v41, 8);
LABEL_172:
  gPhaseManagerLog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v9)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "ATPhasePlatform.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 711;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = self;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v9;
      v34 = "%25s:%-5d platform@%p: failed to start IO, err = %d";
      v35 = v33;
      v36 = OS_LOG_TYPE_ERROR;
      v37 = 34;
LABEL_177:
      _os_log_impl(&dword_1A0F4D000, v35, v36, v34, buf, v37);
    }
  }
  else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "ATPhasePlatform.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 707;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = self;
    v34 = "%25s:%-5d platform@%p: successfully started IO";
    v35 = v33;
    v36 = OS_LOG_TYPE_DEFAULT;
    v37 = 28;
    goto LABEL_177;
  }

  return v9 == 0;
}

- (BOOL)stop
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  ATPhasePlatform *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  gPhaseManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "ATPhasePlatform.mm";
    v7 = 1024;
    v8 = 720;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d platform@%p: stopping IO", (uint8_t *)&v5, 0x1Cu);
  }

  Phase::ServerManager::stop((unint64_t **)-[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager"));
  return 1;
}

- (void)registerTapInterface:(id)a3
{
  id v5;
  id tapInterface;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  ATPhasePlatform *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  tapInterface = self->_tapInterface;
  if (tapInterface != v5)
  {
    if (v5 && tapInterface)
    {
      gPhaseManagerLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315650;
        v9 = "ATPhasePlatform.mm";
        v10 = 1024;
        v11 = 737;
        v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d platform@%p: error: cannot override tapsInterface", (uint8_t *)&v8, 0x1Cu);
      }

    }
    else
    {
      objc_storeStrong(&self->_tapInterface, a3);
    }
  }

}

- (int)fadeClientsInSession:(unsigned int)a3 activating:(BOOL)a4 fadeLevel:(float)a5 fadeTime:(float)a6
{
  _BOOL8 v8;
  uint64_t v9;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;

  v8 = a4;
  v9 = *(_QWORD *)&a3;
  -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    return 0;
  -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a5;
  *(float *)&v14 = a6;
  v15 = objc_msgSend(v12, "fadeClientsInSession:activating:fadeLevel:fadeTime:", v9, v8, v13, v14);

  return v15;
}

- (void)activateSession:(unsigned int)a3 activate:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateSession:activate:", v5, v4);

  }
}

- (void)refreshInputMuteOnAllSessions:(float)a3
{
  void *v5;
  double v6;
  id v7;

  -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = a3;
    objc_msgSend(v7, "refreshInputMuteOnAllSessions:", v6);

  }
}

- (int)muteSessionInput:(unsigned int)a3 mute:(BOOL)a4 fadeTime:(float)a5
{
  _BOOL8 v6;
  uint64_t v7;
  void *v9;
  void *v10;
  double v11;
  int v12;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return 0;
  -[ATPhasePlatform lazyInitSessionInterface](self, "lazyInitSessionInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = a5;
  v12 = objc_msgSend(v10, "muteSessionInput:mute:fadeTime:", v7, v6, v11);

  return v12;
}

- (int)muteAudioSessionBidirectional:(unsigned int)a3 mute:(BOOL)a4 inputFadeTime:(float)a5 outputFadeTime:(float)a6
{
  _BOOL4 v7;
  uint64_t v8;
  int v10;
  double v11;
  double v12;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v10 = -[ATPhasePlatform muteSessionInput:mute:fadeTime:](self, "muteSessionInput:mute:fadeTime:");
  LODWORD(v12) = 1.0;
  if (v7)
    *(float *)&v12 = 0.0;
  *(float *)&v11 = a6;
  return -[ATPhasePlatform fadeClientsInSession:activating:fadeLevel:fadeTime:](self, "fadeClientsInSession:activating:fadeLevel:fadeTime:", v8, 0, v12, v11)+ v10;
}

- (BOOL)applyVolumeOnVolumeCategory:(id)a3 mode:(id)a4 value:(float)a5
{
  return 0;
}

- (BOOL)applyVolumeOnSession:(unsigned int)a3
{
  return 0;
}

- (BOOL)applyVolumeOnAllSessions
{
  return 0;
}

- (float)volumeScalarMappedToHWCurve:(float)a3
{
  ServerManager *value;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  float v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  ServerManager *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  value = self->_serverManager.__ptr_.__value_;
  if (value)
  {
    v5 = *(_QWORD *)value;
    if (*(_QWORD *)value)
    {
      os_unfair_recursive_lock_lock_with_options();
      v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 392))(v5, (uint64_t)value + 24);
      v7.n128_u32[0] = 1.0;
      if (a3 <= 1.0)
        v7.n128_f32[0] = a3;
      if (a3 < 0.0)
        v7.n128_f32[0] = 0.0;
      v8 = (*(float (**)(uint64_t, __n128))(*(_QWORD *)v6 + 176))(v6, v7);
      os_unfair_recursive_lock_unlock();
      gPhaseManagerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = 136316162;
        v12 = "PhaseServerManager.mm";
        v13 = 1024;
        v14 = 239;
        v15 = 2048;
        v16 = value;
        v17 = 2048;
        v18 = a3;
        v19 = 2048;
        v20 = v8;
        _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d servermgr@%p: volume %.3f, HW mapped volume %.3f", (uint8_t *)&v11, 0x30u);
      }

      return v8;
    }
  }
  return a3;
}

- (OS_os_workgroup)workgroup
{
  void **v2;
  void *v3;
  void **v4;
  uint64_t v5;
  void *v6;
  caulk::mach::details *v8[9];

  v8[8] = *(caulk::mach::details **)MEMORY[0x1E0C80C00];
  v2 = -[ATPhasePlatform lazyInitServerManager](self, "lazyInitServerManager");
  v3 = *v2;
  if (*v2)
  {
    v4 = v2 + 3;
    os_unfair_recursive_lock_lock_with_options();
    v5 = (*(uint64_t (**)(void *, void **))(*(_QWORD *)v3 + 392))(v3, v4);
    (*(void (**)(caulk::mach::details **__return_ptr))(*(_QWORD *)v5 + 88))(v8);
    caulk::mach::details::retain_os_object(v8[1], v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::mach::os_workgroup_managed::~os_workgroup_managed((caulk::mach::os_workgroup_managed *)v8);
    os_unfair_recursive_lock_unlock();
  }
  return (OS_os_workgroup *)v3;
}

- (PHASETapInterface)tapInterface
{
  return (PHASETapInterface *)self->_tapInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_roomCongruenceInterface, 0);
  objc_storeStrong(&self->_tapInterface, 0);
  objc_storeStrong(&self->_sessionInterface, 0);
  std::unique_ptr<Phase::ServerManager>::reset[abi:ne180100]((uint64_t *)&self->_serverManager, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
